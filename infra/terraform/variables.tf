variable "kafka_image" {
  description = "Confluent Kafka image tag"
  type        = string
  default     = "confluentinc/cp-kafka:7.6.11"
}

variable "zookeeper_image" {
  description = "Confluent Zookeeper image tag"
  type        = string
  default     = "confluentinc/cp-zookeeper:7.6.11"
}

variable "minio_image" {
  description = "MinIO image tag"
  type        = string
  default     = "minio/minio:RELEASE.2025-09-07T16-13-09Z"
}

variable "postgres_image" {
  description = "PostgreSQL image tag"
  type        = string
  default     = "postgres:17.10"
}

variable "redis_image" {
  description = "Redis image tag"
  type        = string
  default     = "redis:8.8.0"
}

variable "prometheus_image" {
  description = "Prometheus image tag"
  type        = string
  default     = "prom/prometheus:v3.10.0"
}

variable "grafana_image" {
  description = "grafana/grafana:11.6.9"
  type        = string
  default     = "grafana/grafana:11.6.9"
}

variable "elasticsearch_image" {
  description = "Elasticsearch image tag"
  type        = string
  default     = "elasticsearch:8.19.9"
}

variable "kibana_image" {
  description = "Kibana image tag"
  type        = string
  default     = "kibana:8.19.9"
}

variable "logstash_image" {
  description = "Logstash image tag"
  type        = string
  default     = "logstash:8.19.9"
}

variable "postgres_password" {
  description = "PostgreSQL root password"
  type        = string
  sensitive   = true
}

variable "minio_root_user" {
  description = "MinIO root user"
  type        = string
  sensitive   = true
}

variable "minio_root_password" {
  description = "MinIO root password"
  type        = string
  sensitive   = true
}