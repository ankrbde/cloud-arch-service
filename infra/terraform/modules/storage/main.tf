resource "docker_network" "cloud_arch_net" {
  name   = "cloud-arch-net"
  driver = "bridge"
}

resource "docker_volume" "postgres_data" {
  name = "postgres_data"
}

resource "docker_volume" "minio_data" {
  name = "minio_data"
}

resource "docker_volume" "redis_data" {
  name = "redis_data"
}

resource "docker_image" "postgres" {
  name = var.postgres_image
}

resource "docker_image" "minio" {
  name = var.minio_image
}

resource "docker_image" "redis" {
  name = var.redis_image
}

resource "docker_container" "postgres" {
  name  = "postgres"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_DB=cloudarch",
    "POSTGRES_USER=cloudarch",
    "POSTGRES_PASSWORD=${var.postgres_password}"
  ]

  ports {
    internal = 5432
    external = 5432
  }

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = docker_network.cloud_arch_net.id
  }

  healthcheck {
    test         = ["CMD-SHELL", "pg_isready -U cloudarch"]
    interval     = "10s"
    timeout      = "5s"
    retries      = 5
    start_period = "10s"
  }

  restart = "unless-stopped"
}

resource "docker_container" "minio" {
  name  = "minio"
  image = docker_image.minio.image_id

  env = [
    "MINIO_ROOT_USER=${var.minio_root_user}",
    "MINIO_ROOT_PASSWORD=${var.minio_root_password}"
  ]

  command = ["server", "/data", "--console-address", ":9001"]

  ports {
    internal = 9000
    external = 9000
  }

  ports {
    internal = 9001
    external = 9001
  }

  volumes {
    volume_name    = docker_volume.minio_data.name
    container_path = "/data"
  }

  networks_advanced {
    name = docker_network.cloud_arch_net.id
  }

  restart = "unless-stopped"
}

resource "docker_container" "redis" {
  name  = "redis"
  image = docker_image.redis.image_id

  command = ["redis-server", "--appendonly", "yes"]

  ports {
    internal = 6379
    external = 6379
  }

  volumes {
    volume_name    = docker_volume.redis_data.name
    container_path = "/data"
  }

  networks_advanced {
    name = docker_network.cloud_arch_net.id
  }

  restart = "unless-stopped"
}