# 2 repos with hardcoded names
resource "github_repository" "example11" {
  name        = "example11"
  description = "My awesome codebase"
}

resource "github_repository" "example22" {
  name        = "example22"
  description = "My awesome codebase"
}

# We use random_pet to generate a random name
resource "random_pet" "random_repo11" {
  length    = "4"
  separator = "-"
}

resource "random_pet" "random_repo22" {
  length    = "4"
  separator = "-"
}

# We generate 2 dynamic repos with the generated random names
resource "github_repository" "random11" {
  name        = "${random_pet.random_repo11.id}"
  description = "My awesome pet project"
}

resource "github_repository" "random22" {
  name        = "${random_pet.random_repo22.id}"
  description = "My awesome pet project"
}

# We use count to generate multiple repos
resource "github_repository" "multiples" {
  count       = "${var.repo_count}"
  name        = "multiple${count.index}"
  description = "My awesome codebase"
}
