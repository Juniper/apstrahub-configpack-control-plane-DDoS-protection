#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

locals {
  t = <<-EOT
    set system ddos-protection protocols vxlan aggregate bandwidth $${bandwidth}
    set system ddos-protection protocols vxlan aggregate burst $${burst}
  EOT
}

resource "apstra_datacenter_configlet" "example" {
  blueprint_id = var.blueprint_id
  condition    = var.configlet_scope
  name         = var.name
  generators = [
    {
      config_style = "junos"
      section      = "top_level_set_delete"
      template_text = templatestring(local.t, {
        bandwidth = var.aggregate_bandwidth
        burst     = var.aggregate_burst
      })
    },
  ]
}
