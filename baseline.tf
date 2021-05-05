terraform {
  backend "remote" {
    organization = "matisotee"

    workspaces {
      name = "dev"
    }
  }
}