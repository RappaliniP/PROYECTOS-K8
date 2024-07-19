
variable "aws_region" {
  type        = string
  default     = "us-east-1"
}
variable "aws_access_key" {
  type        = string
  sensitive   = true
}
variable "aws_secret_key" {
  type        = string
  sensitive   = true
}
variable "environment" {
  description = "Entorno"
  type        = string
}
