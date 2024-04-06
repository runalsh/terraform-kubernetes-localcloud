resource "local_file" "haproxy" {
  content = templatefile("${path.module}/haproxy.cfg", {
    vaults = local.vaults
  })

  filename = "${path.module}/output/haproxy.cfg"
}

resource "docker_container" "haproxy" {
  name  = "haproxy"
  image = "haproxy:alpine"

  ports {
    internal = 443
    external = 443
    ip       = "0.0.0.0"
  }

  ports {
    internal = 8404
    external = 8404
    ip       = "0.0.0.0"
  }

  ports {
    internal = 8200
    external = 8200
    ip       = "0.0.0.0"
  }

  volumes {
    host_path      = abspath(local_file.haproxy.filename) #"F:/Temp/terraform-minikube-localcloud/vault-docker-haproxy/output/haproxy.cfg"
    container_path = "/usr/local/etc/haproxy/haproxy.cfg"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.vault.name
  }

  # lifecycle {
  #   ignore_changes = all
  # }

  depends_on = [docker_container.vault]
}
