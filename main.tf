locals {
  main_set_values      = module.main_image.set_values
  crd_set_values       = module.crd_image.set_values
  registrar_set_values = module.registrar_image.set_values
  liveness_set_values  = module.liveness_image.set_values

  set_values = concat(
    var.set_values,
    local.main_set_values,
    local.crd_set_values,
    local.registrar_set_values,
    local.liveness_set_values,
  )

  default_helm_config = {
    name             = var.name
    repository       = var.repository
    chart            = var.chart
    namespace        = var.namespace
    create_namespace = var.create_namespace
    version          = var.release_version
    values           = var.values
  }
  helm_config = merge(local.default_helm_config, var.helm_config)
}

module "helm" {
  source               = "github.com/terraform-helm/terraform-helm?ref=0.1"
  helm_config          = local.helm_config
  set_values           = local.set_values
  set_sensitive_values = var.set_sensitive_values
}

module "main_image" {
  source     = "./images_set_values"
  repo_regex = var.repo_regex
  repo_url   = var.images.main
  pre_value  = "${var.os}.image"
}

module "crd_image" {
  source     = "./images_set_values"
  repo_regex = var.repo_regex
  repo_url   = var.images.crd
  pre_value  = "${var.os}.crds.image"
}

module "registrar_image" {
  source     = "./images_set_values"
  repo_regex = var.repo_regex
  repo_url   = var.images.registrar
  pre_value  = "${var.os}.registrarImage"
}

module "liveness_image" {
  source     = "./images_set_values"
  repo_regex = var.repo_regex
  repo_url   = var.images.liveness
  pre_value  = "${var.os}.livenessProbeImage"
}
