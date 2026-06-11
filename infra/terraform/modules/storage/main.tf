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