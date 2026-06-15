variable "network_id" {
  description = "Docker network ID for container attachment"
  type        = string
}

variable "zookeeper_image" {
  description = "Confluent Zookeeper image"
  type        = string
}

variable "kafka_image" {
  description = "Confluent Kafka image"
  type        = string
}