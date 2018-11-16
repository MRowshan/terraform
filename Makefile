.PHONY = init jenkins-apply jenkins-destroy

TERRAFORM_APPLY = "terraform apply -auto-approve -var-file="
TERRAFORM_DESTROY = "terraform destroy -auto-approve -var-file="

VAR_DIR = "variables/"
VAR_JENKINS = "jenkins.tfvars"

init:
	@terraform init

jenkins-apply:
	@"${TERRAFORM_APPLY}${VAR_DIR}${VAR_JENKINS}"

jenkins-destroy:
	@"${TERRAFORM_DESTROY}${VAR_DIR}${VAR_JENKINS}"
	
