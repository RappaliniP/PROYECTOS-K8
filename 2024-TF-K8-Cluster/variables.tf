
variable "aws_access_key" {
  description = "access_key"
  type        = string
  sensitive   = true
}
variable "aws_secret_key" {
  description = "secret_key"
  type        = string
  sensitive   = true
}
variable "aws_region" {
  description = "aws region"
  type        = string
  sensitive   = true
}
variable "cluster_name" {
  description = "Cluster Name"
  type        = string
  sensitive   = true
}
variable "cluster_version" {
  description = "Cluster Version"
  type        = string
  sensitive   = true
}
variable "environment" {
  description = "Environment"
  type        = string
  sensitive   = true
  default     = "Desarrollo"
}
