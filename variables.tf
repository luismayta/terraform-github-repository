variable "name" {
  type        = string
  description = "The name of the repository."
}

variable "description" {
  type        = string
  description = "The description of the repository."
}

variable "visibility" {
  type        = string
  description = "The visibility of the repository private or public."
  default     = "private"
}

variable "deploy_keys" {
  type = list(object({
    title     = string
    key       = string
    read_only = bool
  }))
  description = "The name of repositories."
  default     = []
}

variable "secrets" {
  type        = map(any)
  description = "secrets for repository"
  default     = {}
}

variable "pages" {
  type        = map(any)
  description = "Configuration block for GitHub Pages"
  validation {
    condition     = can([for field in keys(try(var.pages, {})) : !contains(["branch", "path", "cname"], field)])
    error_message = "ERROR: Key not permitted."
  }
  default = {}
}

variable "default_branch" {
  type        = string
  description = "Name of the Default Branch of the Repository"
  default     = "develop"
}

variable "settings" {
  type        = map(any)
  description = "Create and manage settings."
  default     = {}
  validation {
    condition = can([for field in keys(try(var.settings, {})) : !contains([
      "auto_init", "has_issues", "has_wiki", "has_projects", "homepage_url", "is_template",
      "allow_merge_commit", "allow_squash_merge", "allow_rebase_merge", "delete_branch_on_merge",
    "gitignore_template", "license_template", "archived", "archive_on_destroy", "vulnerability_alerts"], field)])
    error_message = "ERROR: Key not permitted."
  }
}

variable "topics" {
  type        = list(string)
  description = "topics of project."
  default     = []
}

variable "template" {
  type        = map(string)
  description = "Template Repository to use when creating the Repository"
  validation {
    condition     = can([for field in keys(try(var.template, {})) : !contains(["owner", "repository", ], field)])
    error_message = "ERROR: Key not permitted."
  }
  default = {}
}
