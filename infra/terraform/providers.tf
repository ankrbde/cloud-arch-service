terraform {
  required_version = ">= 1.15.5"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.4.0"
    }
  }
}

provider "docker" {}