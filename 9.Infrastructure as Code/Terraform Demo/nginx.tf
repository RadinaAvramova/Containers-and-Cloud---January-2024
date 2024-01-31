terraform {
    required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginximage" {
  name = "nginxdemos/hello"
}

resource "docker_container" "nginxradi" {
    name= "radi-container-nginx"
    image = resource.docker_image.nginximage.name

    ports {
        internal = "80"
        external = "80"
    }
}

resource "docker_volume" "shared_volume" {
  name = "shared_volume"
}