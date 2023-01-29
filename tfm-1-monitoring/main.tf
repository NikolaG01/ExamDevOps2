terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_network" "appnet" {
  name = "appnet"
  driver = "bridge"
}

resource "docker_image" "img-prometheus" {
    name = "prom/prometheus"
}

resource "docker_image" "img-grafana" {
    name = "grafana/grafana"
}

resource "docker_container" "prometheus" {
  name = "prometheus"
  image = docker_image.img-prometheus.image_id

  ports {
    internal = 9090
    external = 9090
  }
  networks_advanced {
    name = "appnet"
  }

  volumes {
    host_path = "/vagrant/tfm-1-monitoring/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
    read_only = true
  }
}

resource "docker_container" "grafana" {
  name = "grafana"
  image = docker_image.img-grafana.image_id

  ports {
    internal = 3000
    external = 3000
  }
  networks_advanced {
    name = "appnet"
  }

  volumes {
    host_path = "/vagrant/tfm-1-monitoring/datasource.yml"
    container_path = "/etc/grafana/provisioning/datasources/datasource.yaml"
    read_only = true
  }
    volumes {
        host_path = "/vagrant/dashboards"
        container_path = "/etc/dashboards"
        read_only = true
    }
    volumes {
        host_path = "/vagrant/tfm-1-monitoring/dashboard.yml"
        container_path = "/etc/grafana/provisioning/dashboards/dashboard.yaml"
        read_only = true
    }
}