module "storage" {
  source = "./modules/storage"

  postgres_image      = var.postgres_image
  minio_image         = var.minio_image
  redis_image         = var.redis_image
  postgres_password   = var.postgres_password
  minio_root_user     = var.minio_root_user
  minio_root_password = var.minio_root_password
}

module "messaging" {
  source = "./modules/messaging"

  network_id      = module.storage.network_id
  zookeeper_image = var.zookeeper_image
  kafka_image     = var.kafka_image
}

module "observability" {
  source = "./modules/observability"

  network_id = module.storage.network_id
}