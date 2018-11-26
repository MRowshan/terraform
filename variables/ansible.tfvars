name = "ansible-client"
machine_type = "n1-standard-1"
tags = [
        "http-server"
]
ssh_user = "terraform"
scripts = [
        "scripts/ssh-connect"
]
