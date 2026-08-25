variable "my_home_ip" {
  type        = string
  description = "Your personal public IP address for SSH access (CIDR notation)"
  default     = "0.0.0.0/32" # Placeholder for public source control
}
