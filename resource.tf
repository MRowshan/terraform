resource "google_compute_instance" "default" {
	name = "${var.name}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	tags = ["${var.tags}"]
#	count = 4
	boot_disk {
		initialize_params {
			image = "${var.image}"
		}
	}
	network_interface {
		network = "${var.network}" // Flat Network (Google)
		access_config {
			// Ephemeral IP (dynamic IP address)
		}
	}
	metadata {
		sshKeys = "${var.ssh_user}:${file("${var.public_key}")}"
	}
	connection = {
		type = "ssh"
		user = "${var.ssh_user}"
		private_key = "${file("${var.private_key}")}"
	}
	provisioner "remote-exec" {
		inline = [
			#"sudo yum install java -y",
			#"sudo yum install wget -y",
			#"sudo yum install git -y"
			"${var.install_packages[var.package_manager]} ${join(" ", var.packages)}"
		]
	}

	provisioner "remote-exec" {
		scripts = [
			"${var.scripts}"
		]
	}
}
resource "google_compute_attached_disk" "default" {
  disk = "terraform-jenkins"
  instance = "${google_compute_instance.default.self_link}"
  zone = "europe-west2-c"
  device_name = "/var/lib/jenkins"
}
