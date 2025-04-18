resource "helm_release" "reloader" {
  name       = "reloader"
  repository = "https://stakater.github.io/stakater-charts"
  chart      = "reloader"
  version    = "2.1.0"

  count = var.reloader ? 1 : 0
#   values = [file("${path.module}/values/reloader.yaml")]
}  