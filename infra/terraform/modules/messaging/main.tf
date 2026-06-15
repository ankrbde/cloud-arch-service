resource "docker_volume" "kafka_data" {
  name = "kafka_data"
}

resource "docker_volume" "zookeeper_data" {
  name = "zookeeper_data"
}

resource "docker_volume" "zookeeper_log" {
  name = "zookeeper_log"
}

resource "docker_image" "zookeeper" {
  name = var.zookeeper_image
}

resource "docker_image" "kafka" {
  name = var.kafka_image
}

resource "docker_container" "zookeeper" {
  name  = "zookeeper"
  image = docker_image.zookeeper.image_id

  env = [
    "ZOOKEEPER_CLIENT_PORT=2181",
    "ZOOKEEPER_TICK_TIME=2000",
    "ZOOKEEPER_SYNC_LIMIT=2"
  ]

  ports {
    internal = 2181
    external = 2181
  }

  volumes {
    volume_name    = docker_volume.zookeeper_data.name
    container_path = "/var/lib/zookeeper/data"
  }

  volumes {
    volume_name    = docker_volume.zookeeper_log.name
    container_path = "/var/lib/zookeeper/log"
  }

  networks_advanced {
    name = var.network_id
  }

  restart = "unless-stopped"
}

resource "docker_container" "kafka" {
  name  = "kafka"
  image = docker_image.kafka.image_id

  env = [
    "KAFKA_BROKER_ID=1",
    "KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181",
    "KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT",
    "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://kafka:9092,PLAINTEXT_HOST://localhost:29092",
    "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1",
    "KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1",
    "KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1",
    "KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=0",
    "KAFKA_AUTO_CREATE_TOPICS_ENABLE=true"
  ]

  ports {
    internal = 9092
    external = 9092
  }

  ports {
    internal = 29092
    external = 29092
  }

  volumes {
    volume_name    = docker_volume.kafka_data.name
    container_path = "/var/lib/kafka/data"
  }

  networks_advanced {
    name = var.network_id
  }

  depends_on = [docker_container.zookeeper]

  restart = "unless-stopped"
}