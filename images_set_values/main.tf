locals {
  image = try(regex(var.repo_regex, var.repo_url), {})

  set_values = local.image != {} ? [
    { name = "${var.pre_value}.repository", value = "${local.image.url}/${local.image.image}" },
    { name = "${var.pre_value}.tag", value = local.image.tag }
  ] : []
}
