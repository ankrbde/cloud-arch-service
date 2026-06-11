resource "docker_volume" "kafka_data" {
  name = "kafka_data"
}

resource "docker_volume" "zookeeper_data" {
  name = "zookeeper_data"
}

resource "docker_volume" "zookeeper_log" {
  name = "zookeeper_log"
}