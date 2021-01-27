module "main" {
  providers {
    github = github
  }
  source      = "git://github.com/hadenlabs/terraform-github-repository.git?ref=0.1.0"
  name        = var.repository_name
  description = var.repository_description
  visibility  = "public"
}