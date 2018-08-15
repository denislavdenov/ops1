# token variable
variable "github_token" {
  description = "github token"
}

# Configure the GitHub Provider
provider "github" {
  token        = "${var.github_token}"
  organization = "FromBeginning"
}

# 2 repos with hardcoded names
resource "github_repository" "example1" {
  name        = "example1"
  description = "My awesome codebase"
}

resource "github_repository" "example2" {
  name        = "example2"
  description = "My awesome codebase"
}

# We use random_pet to generate a random name
resource "random_pet" "random_repo1" {
  length    = "4"
  separator = "-"
}

resource "random_pet" "random_repo2" {
  length    = "4"
  separator = "-"
}

# We generate 2 dynamic repos with the generated random names
resource "github_repository" "random1" {
  name        = "${random_pet.random_repo1.id}"
  description = "My awesome pet project"
}

resource "github_repository" "random2" {
  name        = "${random_pet.random_repo2.id}"
  description = "My awesome pet project"
}
