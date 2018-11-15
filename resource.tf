resource "google_compute_instance" "default" {
	name = "jenkins"
	machine_type = "n1-standard-1"
	zone = "europe-west2-c"
	tags = ["jenkins"]
	boot_disk {
		initialize_params {
			image = "centos-7"
		}
	}
	network_interface {
		network = "default" // Flat Network (Google)
		access_config {
			// Ephemeral IP (dynamic IP address)
		}
	}
	metadata {
		sshKeys = "terraform:${file("~/.ssh/id_rsa.pub")}"
	}
	connection = {
		type = "ssh"
		user = "terraform"
		private_key = "${file("~/.ssh/id_rsa")}"
	}
	provisioner "remote-exec" {
		inline = [
			"sudo yum install -y java",
			"sudo yum install -y git",
			"sudo yum install -y wget"
		]
	}

	provisioner "remote-exec" {
		scripts = [
			"scripts/jenkins-script"
		]
	}
}
