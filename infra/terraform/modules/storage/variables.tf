variable "postgres_image" {
  type = string
}

variable "minio_image" {
  type = string
}

variable "redis_image" {
  type = string
}

variable "postgres_password" {
  type      = string
  sensitive = true
}

variable "minio_root_user" {
  type      = string
  sensitive = true
}

variable "minio_root_password" {
  type      = string
  sensitive = true
}