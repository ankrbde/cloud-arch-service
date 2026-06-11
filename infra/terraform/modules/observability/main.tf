resource "docker_volume" "prometheus_data" {
  name = "prometheus_data"
}

resource "docker_volume" "grafana_data" {
  name = "grafana_data"
}

resource "docker_volume" "elasticsearch_data" {
  name = "elasticsearch_data"
}