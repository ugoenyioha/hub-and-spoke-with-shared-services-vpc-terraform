# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# --- root/variables.tf ---

# AWS REGION
variable "aws_region" {
  type        = string
  description = "AWS Region to create the environment."
  default     = "us-west-2"
}

# PROJECT IDENTIFIER
variable "identifier" {
  type        = string
  description = "Project Name, used as identifer when creating resources."
  default     = "hubspoke-shared-services"
}

# INFORMATION ABOUT THE VPCs TO CREATE
variable "vpcs" {
  type        = any
  description = "VPCs to create."
  default = {
    "spoke-vpc-1" = {
      type             = "spoke"
      cidr_block       = "10.0.0.0/24"
      workload_subnets = ["10.0.0.0/26", "10.0.0.64/26", "10.0.0.128/26"]
      tgw_subnets      = ["10.0.0.192/28", "10.0.0.208/28", "10.0.0.224/28"]
      number_azs       = 1
      instance_type    = "t2.micro"
      # VPC Flow log type / Default: ALL - Other options: ACCEPT, REJECT
      flow_log_config = {
        log_destination_type = "cloud-watch-logs" # Options: "cloud-watch-logs", "s3", "none"
        retention_in_days    = 7
      }
    }
    "spoke-vpc-2" = {
      type             = "spoke"
      cidr_block       = "10.0.1.0/24"
      workload_subnets = ["10.0.1.0/26", "10.0.1.64/26", "10.0.1.128/26"]
      tgw_subnets      = ["10.0.1.192/28", "10.0.1.208/28", "10.0.1.224/28"]
      number_azs       = 1
      instance_type    = "t2.micro"
      flow_log_config = {
        log_destination_type = "cloud-watch-logs" # Options: "cloud-watch-logs", "s3", "none"
        retention_in_days    = 7
      }
    }
    "shared-services-vpc" = {
      type                 = "shared-services"
      cidr_block           = "10.0.50.0/24"
      vpc_endpoint_subnets = ["10.0.50.0/28", "10.0.50.16/28", "10.0.50.32/28"]
      r53_endpoint_subnets = ["10.0.50.48/28", "10.0.50.64/28", "10.0.50.80/28"]
      tgw_subnets          = ["10.0.50.96/28", "10.0.50.112/28", "10.0.50.128/28"]
      number_azs           = 2
      flow_log_config = {
        log_destination_type = "cloud-watch-logs" # Options: "cloud-watch-logs", "s3", "none"
        retention_in_days    = 7
      }
    }
    "shared-hosting-private-vpc" = {
      type             = "shared-hosting-private"
      cidr_block       = "10.0.0.0/16"
      workload_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
      number_azs       = 3
      flow_log_config = {
        log_destination_type = "cloud-watch-logs" # Options: "cloud-watch-logs", "s3", "none"
        retention_in_days    = 7
      }
    }
  }
}

variable "on_premises_cidr" {
  type        = string
  description = "On-premises CIDR block."
  default     = "192.168.1.0/24"
}

variable "forwarding_rules" {
  type        = map(any)
  description = "Forwarding rules to on-premises DNS servers."
  default = {
    "example-domain" = {
      domain_name = "usableapps.io"
      rule_type   = "FORWARD"
      target_ip   = ["172.64.33.185", "108.162.192.242"]
    }
    # "test-domain" = {
    #   domain_name = "test.usableapps.io"
    #   rule_type   = "FORWARD"
    #   target_ip   = ["1.1.1.1"]
    # }
  }
}
