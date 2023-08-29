resource "helm_release" "nginx-ext-ingress-controller" {
  name       = "nginx-ext"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.helm_nginx_version
  namespace  = "nginx-ext"
  wait       = false
  create_namespace = true
   values = [
    templatefile("${path.module}/templates/values-nginx.yaml.tpl", {
        ingress_class_name = "nginx-ext"
        http_nodeport_port = 32080
        https_nodeport_port = 32443
        lb_name            = data.terraform_remote_state.k3s.outputs.external_lb_dns
        use_proxy_protocol = true
        enable_real_ip     = true
        # tls_sec_name = "default/${var.int_wildcard_cert_sec_name}"
      })
  ]
  # depends_on = [time_sleep.wait_90_seconds-cert]
}
