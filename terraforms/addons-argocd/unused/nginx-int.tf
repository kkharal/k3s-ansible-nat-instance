resource "helm_release" "nginx-int-ingress-controller" {
  name       = "nginx-int"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.6.1"
  namespace  = "nginx-int"
  wait       = false
  create_namespace = true
  values = [
    templatefile("${path.module}/templates/values-nginx.yaml.tpl", {
        http_nodeport_port = 31080
        https_nodeport_port = 31443
        ingress_class_name = "nginx"
        lb_name            = "${local.name}-internal"
        use_proxy_protocol = false
        enable_real_ip     = false
      })
  ]
}
