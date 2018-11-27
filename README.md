# terraform
Creates vm's in gcp
Requires the gcp key to be put inside the home directory in the directory .gcpkey in a file named terraform_key.json
`~/.gcpkey/terraform_key.json`

## makefile
Used to run terraform commands with a makefile
eg. `make` to initialise terraform
`make jenkins-apply` and `make jenkins-destroy` to create and delete jenkins vm's using the jenkins var file

## provider.tf
Sets up connection with gcp network
Requires the gcp key, project ID and region

## default_variables.tf
Contains default values that are assigned to the `resource.tf` file if no var-file is specified when `terraform apply` is run

## resource.tf
Contains the configuration for vm's  
`name` specifies the vm name  
`machine type` specifies the number of cpus and memory of the machine  
`zone` specifies the zone of the vm  
`tags` specifies the firewall tags to be added to the vm  
`count` specifies the number of vm's to be created  
`boot disk` specifies the image the vm will use  
`network interface` add's the vm's to the default network  
`metadata` creates a user in the vm and gives them the public key of the host machine  
`connection` uses the corresponding private key to authenticate the ssh connection  
`provisioner "remote-exec"` runs commands on the vm in the form of inline commands or scripts  

## Additional directories
`Variables` contains the tfvars files which have the values specific to the vm's being made
`Scripts` contains the scripts to be run in the vm's when `terraform apply` is run
