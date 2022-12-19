<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.7.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_crd_image"></a> [crd\_image](#module\_crd\_image) | github.com/littlejo/terraform-helm-images-set-values | v0.1 |
| <a name="module_helm"></a> [helm](#module\_helm) | github.com/terraform-helm/terraform-helm | 0.1 |
| <a name="module_liveness_image"></a> [liveness\_image](#module\_liveness\_image) | github.com/littlejo/terraform-helm-images-set-values | v0.1 |
| <a name="module_main_image"></a> [main\_image](#module\_main\_image) | github.com/littlejo/terraform-helm-images-set-values | v0.1 |
| <a name="module_registrar_image"></a> [registrar\_image](#module\_registrar\_image) | github.com/littlejo/terraform-helm-images-set-values | v0.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart"></a> [chart](#input\_chart) | Chart of helm release | `string` | `"secrets-store-csi-driver"` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Create namespace ? | `bool` | `false` | no |
| <a name="input_helm_config"></a> [helm\_config](#input\_helm\_config) | Map of helm config | `map(any)` | `{}` | no |
| <a name="input_images"></a> [images](#input\_images) | Map of images | <pre>object({<br>    main      = optional(string)<br>    crd       = optional(string)<br>    registrar = optional(string)<br>    liveness  = optional(string)<br>  })</pre> | <pre>{<br>  "crd": null,<br>  "liveness": null,<br>  "main": null,<br>  "registrar": null<br>}</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name of helm release | `string` | `"csi-secrets-store"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | namespace of helm release | `string` | `"kube-system"` | no |
| <a name="input_os"></a> [os](#input\_os) | node installation | `string` | `"linux"` | no |
| <a name="input_release_version"></a> [release\_version](#input\_release\_version) | version of helm release | `string` | `null` | no |
| <a name="input_repo_regex"></a> [repo\_regex](#input\_repo\_regex) | Repo regex to identifier different part of the string | `string` | `"^(?:(?P<url>[^/]+))?(?:/(?P<image>[^:]*))??(?::(?P<tag>[^:]*))"` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Url of repository | `string` | `"https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"` | no |
| <a name="input_set_sensitive_values"></a> [set\_sensitive\_values](#input\_set\_sensitive\_values) | Forced set\_sensitive values | `any` | `[]` | no |
| <a name="input_set_values"></a> [set\_values](#input\_set\_values) | Forced set values | `any` | `[]` | no |
| <a name="input_values"></a> [values](#input\_values) | Values | `list(any)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->