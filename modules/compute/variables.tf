# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

# --- modules/compute/variables.tf ---

variable "identifier" {
  type        = string
  description = "Project identifier."
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC where the EC2 instance(s) are created."
}

variable "vpc_info" {
  type        = any
  description = "Information about the VPC where the EC2 instance(s) are created."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
}

variable "ec2_iam_instance_profile" {
  type        = string
  description = "EC2 instance profile to attach to the EC2 instance(s)"
}

variable "ec2_security_group" {
  type        = any
  description = "Information about the Security Groups to create."
}
