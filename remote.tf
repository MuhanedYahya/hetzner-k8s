terraform {
  backend "remote" {
    organization = "ORG_NAME"

    workspaces {
      prefix = "cluster-"
    }
  }

}