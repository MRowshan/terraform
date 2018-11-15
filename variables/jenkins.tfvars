project = "vm-testing-219509"
name = "jenkins"
machine_type = "n1-standard-1"
tags = [
	"http-server",
	"jenkins"
]
ssh_user = "terraform"
scripts = [
	"scripts/jenkins-script"
]
