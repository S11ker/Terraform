variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
  default     = "change_me"
}

variable "folder_id" {
  type        = string
  description = "Yandex Folder ID"
  default     = "change_me"
}

variable "public_ssh_key_path" {
  description = "Path to public SSH key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "user_name_in_server" {
  description = "The username on the server that is being created"
  type        = string
  default     = "ubuntu"
}

variable "image_id" {
  description = "ID of the boot disk image. Default is Ubuntu 24.04 LTS"
  type        = string
  default     = "fd89mp67446a6rcc4s08"
}

variable "vm_cores" {
  description = "How many cores should I allocate to a VM"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "How much RAM should I allocate to a VM"
  type        = number
  default     = 2
}
