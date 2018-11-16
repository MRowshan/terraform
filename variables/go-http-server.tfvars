name = "go-http-server"
machine_type = "n1-standard-1"
tags = [
	"http-server"
]
ssh_user = "terraform"
scripts = [
	"scripts/go-script",
	"scripts/ssh-connect"
]
