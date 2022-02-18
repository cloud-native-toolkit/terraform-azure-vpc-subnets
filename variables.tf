variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group where the VPC has been provisioned."
}

variable "region" {
  type        = string
  description = "The IBM Cloud region where the cluster will be/has been installed."
}

variable "vpc_name" {
  type        = string
  description = "The name of the vpc instance"
}

variable "label" {
  type        = string
  description = "Label for the subnets created"
  default     = "default"
}

variable "ipv4_cidr_blocks" {
  type        = list(string)
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default     = []
}

variable "provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}

variable "acl_rules" {
  type = list(object({
    name=string,
    action=string,
    direction=string,
    source=string,
    destination=string,
    priority=optional(number),
    tcp=optional(object({
      port_min=number,
      port_max=number,
      source_port_min=number,
      source_port_max=number
    })),
    udp=optional(object({
      port_min=number,
      port_max=number,
      source_port_min=number,
      source_port_max=number
    })),
    icmp=optional(object({
      type=number,
      code=optional(number)
    })),
  }))
  description = "List of rules to set on the subnet access control list"
  default = []
}

variable "enabled" {
  type        = bool
  description = "Flag to indicate that IBM VPC module should be enabled"
  default     = true
}
