# Configure the GitHub Provider
provider "github" {
  token        = "${var.github_token}"
  organization = "FromBeginning"
}
