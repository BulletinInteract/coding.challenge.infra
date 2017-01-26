# global -----------------------------------------------------------------------

variable "region" {
  type = "string"
}

variable "name" {
  type = "string"
}

variable "env" {
  type = "string"
}

variable "amis" {
  type = "map"
  default = {}
}

variable "vpcs" {
  type = "map"
  default = {}
}

variable "subnets" {
  type = "map"
  default = {}
}


# ec2 instance -----------------------------------------------------------------

variable "instance_type" {
  type = "string"
}

variable "user_data_filename" {
  type = "string"
}


# security group - ec2 instance ------------------------------------------------

# -- ingress

variable "ingress_ports_from" {
  type = "map"
  default = {}
}

variable "ingress_ports_to" {
  type = "map"
  default = {}
}

variable "ingress_ports_type" {
  type = "map"
  default = {}
}

variable "ingress_cidrs" {
  type = "map"
  default = {}
}

# -- egress

variable "egress_ports_from" {
  type = "map"
  default = {}
}

variable "egress_ports_to" {
  type = "map"
  default = {}
}

variable "egress_ports_type" {
  type = "map"
  default = {}
}

variable "egress_cidrs" {
  type = "map"
  default = {}
}
