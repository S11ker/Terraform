terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

variable "filename" {
  description = "Имя файла"
  type        = string
  default     = "hello-from-terraform.txt"
}

locals {
  content = "Создано в terraform в ${timestamp()}"
}

resource "local_file" "example" {
  filename = var.filename
  content  = local.content
}

data "local_file" "example_read" {
  filename   = local_file.example.filename
  depends_on = [local_file.example]
}

output "file_path" {
  value = data.local_file.example_read
}
