provider "google" {
	credentials = "${file("~/.gcpkey/terraform_key.json")}"
	project = "vm-testing-219509"
	region = "europe-west2"
}
