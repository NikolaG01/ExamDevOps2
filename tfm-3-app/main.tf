terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "img-rabbit-prod" {
    name = "shekeriev/rabbit-prod"
}

resource "docker_image" "img-rabbit-cons" {
    name = "shekeriev/rabbit-cons"
}

resource "docker_container" "rabbit-producer" {
  name = "rabbit-producer"
  image = docker_image.img-rabbit-prod.image_id
  env = ["BROKER=rabbitmq"]
  networks_advanced {
    name = "appnet"
  }
}

resource "docker_container" "rabbit-consumer" {
  name = "rabbit-consumer"
  image = docker_image.img-rabbit-cons.image_id
  env = ["BROKER=rabbitmq", "TOPICS=cpu.*"]
  networks_advanced {
    name = "appnet"
  }
}
