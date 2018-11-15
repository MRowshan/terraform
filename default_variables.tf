# provider variables
variable "project" {
	default = "vm-testing-219509"
}

variable "region" {
	default = "europe-west2"
}

variable "gcpkey" {
	default = "~/.gcpkey/terraform_key.json"
}

# resource variables
variable "name" {
	default = "default"
}

variable "machine_type" {
	default = "f1-micro"
}

variable "zone" {
	default = "europe-west2-c"
}

variable "image" {
	default = "centos-7"
}

variable "tags" {
	default = []
}

variable "network" {
	default = "default"
}

variable "ssh_user" {
	default = "terraform"
}

variable "public_key" {
	default = "~/.ssh/id_rsa.pub"
}

variable "private_key" {
	default = "~/.ssh/id_rsa"
}

variable "package_manager" {
	default = "yum"
}

variable "update_packages" {
	default = {
		"yum" = "sudo yum update -y"
	}
}

variable "packages" {
	default = [
		"wget",
		"unzip",
		"git"
	]
}

variable "install_packages" {
	default = {
		"yum" = "sudo yum install -y"
	}
}

variable "scripts" {
	default = []
}

variable "allowed_ports" {
	default = ["22"]
}
