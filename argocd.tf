
# resource "kubernetes_namespace" "argocd-namespace" {
#   metadata {
#     name = "argocd"
#   }
# }

# resource "helm_release" "argocd" {
#   name             = "argocd"
#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-cd"
#   version          = "6.7.2"
#   namespace        = "argocd"
#   force_update     = true
#   values = [file("${path.module}/values/argocdvalues.yaml")]
# }

# resource "kubectl_manifest" "argocd_dashboard" {
#   yaml_body = file("${path.module}/dashboards/argocd-grafana-dashboard.yaml")
#   depends_on = [
#     helm_release.argocd
#   ]
# }

# resource "kubectl_manifest" "argocduihttps" {
#     count     = length(data.kubectl_filename_list.argocduihttps.matches)
#     yaml_body = file(element(data.kubectl_filename_list.argocduihttps.matches, count.index))
# }

# data "kubectl_filename_list" "argocduihttps" {
#     pattern = "./manifests/argocduihttps.yaml.yaml"
# }