variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = ["openfire"]
}

variable "extra_plugins" {
  description = "The additional packages to install"
  type        = list(string)
  default = [
  ]
}

variable "packages" {
  description = "List of packages as runtime dependencies for Atlantis"
  type        = list(string)
  default = [
    "openjdk-22"
  ]
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "openfire"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.packages, var.extra_packages, var.extra_plugins)
    }
    accounts = module.accts.block
    paths = [{
      path        = "/usr/local/openfire/"
      type        = "directory"
      uid         = module.accts.uid
      gid         = module.accts.gid
      permissions = 493 // 0o755
      recursive   = true
      }]
    entrypoint = {
      command = "/usr/local/openfire/bin/openfire.sh"
    }
  })
}
