<!--


  ** DO NOT EDIT THIS FILE
  **
  ** 1) Make all changes to `README.yaml`
  ** 2) Run`make readme` to rebuild this file.
  **
  ** (We maintain HUNDREDS of open source projects. This is how we maintain our sanity.)
  **


  -->

# terraform-github-repository

[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/hadenlabs/terraform-github-repository.svg?label=latest&sort=semver)](https://github.com/hadenlabs/terraform-github-repository/releases) [![Lint](https://github.com/hadenlabs/terraform-github-repository/actions/workflows/lint.yml/badge.svg?branch=develop)](https://github.com/hadenlabs/terraform-github-repository/actions) [![Issues](https://img.shields.io/github/issues/hadenlabs/terraform-github-repository.svg)](https://github.com/hadenlabs/terraform-github-repository/issues) [![Latest Release](https://img.shields.io/github/release/hadenlabs/terraform-github-repository.svg)](https://github.com/hadenlabs/terraform-github-repository/releases) [![Beacon](https://ga-beacon.appspot.com/G-MZEK48EGE8/terraform-github-repository/readme)](https://github.com/hadenlabs/terraform-github-repository)

Terraform module to provision an github repository.

## Usage

```hcl

  module "main_with_pages" {
    source = "hadenlabs/repository/github"
    version = "0.9.0"

    providers = {
      github = github
    }

    name        = "repository-example-with-key"
    description = "github repository for repository"
    visibility  = "public"
    pages = {
      branch = "gh-pages"
      path = "/"
    }

    topics = [
        "go",
        "terraform",
    ]

    settings = {
      has_wiki               = true
      has_projects           = true
      vulnerability_alerts   = true
    }

```

Full working examples can be found in [examples](./examples) folder.

## Examples

### common

```hcl

  module "main" {
      source = "hadenlabs/repository/github"
      version = "0.9.0"

      providers = {
        github = github
      }

      name        = "repository-example"
      description = "github repository for repository"
      visibility  = "public"
      settings = {
        auto_init              = true
        has_issues             = true
        has_wiki               = true
        has_projects           = true
    }
  }

```

### implement key deploy

```hcl

  module "main_with_key" {
    source = "hadenlabs/repository/github"
    version = "0.9.0"

    providers = {
      github = github
    }

    name        = "repository-example-with-key"
    description = "github repository for repository"
    visibility  = "public"
    deploy_keys = [{
      title = "user key"
      key = "/usr/etc/key/user.pub"
      read_only = false
    }]
  }

```

### implement secrets

```hcl

  module "main_with_secrets" {
    source = "hadenlabs/repository/github"
    version = "0.9.0"

    providers = {
      github = github
    }

    name        = "repository-example-with-key"
    description = "github repository for repository"
    visibility  = "public"
    secrets = {
      key= value
    }
  }

```

### implement pages

```hcl

  module "main_with_pages" {
    source = "hadenlabs/repository/github"
    version = "0.9.0"

    providers = {
      github = github
    }

    name        = "repository-example-with-key"
    description = "github repository for repository"
    visibility  = "public"
    pages = {
      branch = "gh-pages"
      path = "/"
    }

    topics = [
        "go",
        "terraform",
    ]

    settings = {
      has_wiki               = true
      has_projects           = true
      vulnerability_alerts   = true
    }
  }

```

### implement templates

```hcl

  module "main" {
      source = "hadenlabs/repository/github"
      version = "0.9.0"

      providers = {
        github = github
      }

      name        = "repository-example"
      description = "github repository for repository"
      visibility  = "public"
      settings = {
        auto_init              = true
        has_issues             = true
        has_wiki               = true
        has_projects           = true
      }

      pages = {
        owner = "owner-user"
        repository = "name-repository"
      }
  }

```

### implement collaborator

```hcl

  module "main" {
      source = "hadenlabs/repository/github"
      version = "0.9.0"

      providers = {
        github = github
      }

      name        = "repository-example"
      description = "github repository for repository"
      visibility  = "public"
      settings = {
        auto_init              = true
        has_issues             = true
        has_wiki               = true
        has_projects           = true
      }

      collaborators = [
      {
        username = "other-user"
        permission = "push"
      },
      ]
  }

```

### implement with file

```hcl

  module "repository_file" {
    providers = {
      github = github
    }
    source      = "hadenlabs/repository/github"
    version     = "0.9.0"
    name        = "repository-example"
    description = "repository example"
    visibility  = "public"
    settings = {
      auto_init = true
    }
    files = [
        {
          branch              = "main"
          file                = "LICENSE"
          content             = file(format("%s/LICENSE", path.module))
          commit_message      = "ci: implement template"
          commit_author       = "@slovacus"
          commit_email        = "slovacus@gmail.com"
          overwrite_on_create = true
        },
    ]
  }

```

### implement with gitflow enabled

```hcl

  module "repository_file" {
    providers = {
      github = github
    }
    source      = "hadenlabs/repository/github"
    version     = "0.9.0"
    name        = "repository-example"
    is_git_flow = true
    description = "repository example"
    visibility  = "public"
    settings = {
      auto_init = true
    }
  }

```

 <!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 0.14 |
| <a name="requirement_github"></a> [github](#requirement_github)          | >=4.5.0 |
| <a name="requirement_local"></a> [local](#requirement_local)             | >=1.3.0 |

## Providers

| Name                                                      | Version |
| --------------------------------------------------------- | ------- |
| <a name="provider_github"></a> [github](#provider_github) | >=4.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
| --- | --- |
| [github_actions_secret.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_branch.develop](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.develop_default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_issue_label.kind_bug](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.kind_chore](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.kind_discussion](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.kind_documentation](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.kind_feature](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.kind_perf](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.kind_question](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.kind_refactor](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.priority_critical](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.priority_high](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.priority_low](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.priority_medium](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.status_approved](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.status_backlog](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.status_blocked](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.status_done](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.status_in_progress](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.status_ready](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_issue_label.status_review](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_collaborator.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator) | resource |
| [github_repository_deploy_key.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) | resource |
| [github_repository_file.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_project.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| --- | --- | --- | --- | :-: |
| <a name="input_is_git_flow"></a> [is_git_flow](#input_is_git_flow) | Git Flow - Github Flow | `bool` | `false` | no |
| <a name="input_files"></a> [files](#input_files) | list files for repository | <pre>list(object({<br> branch = string<br> file = string<br> content = string<br> commit_message = string<br> commit_author = string<br> commit_email = string<br> overwrite_on_create = bool<br> }))</pre> | `[]` | no |
| <a name="input_deploy_keys"></a> [deploy_keys](#input_deploy_keys) | The name of repositories. | <pre>list(object({<br> title = string<br> key = string<br> read_only = bool<br> }))</pre> | `[]` | no |
| <a name="input_collaborators"></a> [collaborators](#input_collaborators) | List of Collaborator Objects | <pre>list(object({<br> username = string<br> permission = string<br> }))</pre> | `[]` | no |
| <a name="input_topics"></a> [topics](#input_topics) | topics of project. | `list(string)` | `[]` | no |
| <a name="input_pages"></a> [pages](#input_pages) | Configuration block for GitHub Pages | `map(any)` | `{}` | no |
| <a name="input_secrets"></a> [secrets](#input_secrets) | secrets for repository | `map(any)` | `{}` | no |
| <a name="input_settings"></a> [settings](#input_settings) | Create and manage settings. | `map(any)` | `{}` | no |
| <a name="input_template"></a> [template](#input_template) | Template Repository to use when creating the Repository | `map(string)` | `{}` | no |
| <a name="input_default_branch"></a> [default_branch](#input_default_branch) | Name of the Default Branch of the Repository | `string` | `"develop"` | no |
| <a name="input_description"></a> [description](#input_description) | The description of the repository. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input_name) | The name of the repository. | `string` | n/a | yes |
| <a name="input_visibility"></a> [visibility](#input_visibility) | The visibility of the repository private or public. | `string` | `"private"` | no |

## Outputs

| Name | Description |
| --- | --- |
| <a name="output_deploy_key"></a> [deploy_key](#output_deploy_key) | output instance deploy_key |
| <a name="output_files"></a> [files](#output_files) | output instance github files |
| <a name="output_instance"></a> [instance](#output_instance) | output instance repository |
| <a name="output_name"></a> [name](#output_name) | output name repository |
| <a name="output_secrets"></a> [secrets](#output_secrets) | output instance github actions secrets |

<!-- END_TF_DOCS -->

## Help

**Got a question?**

File a GitHub [issue](https://github.com/hadenlabs/terraform-github-repository/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/hadenlabs/terraform-github-repository/issues) to report any bugs or file feature requests.

### Development

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

1.  **Fork** the repo on GitHub
2.  **Clone** the project to your own machine
3.  **Commit** changes to your own branch
4.  **Push** your work back up to your fork
5.  Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to rebase the latest changes from "upstream" before making a pull request!

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)](https://semver.org/).

Using the given version number of `MAJOR.MINOR.PATCH`, we apply the following constructs:

1. Use the `MAJOR` version for incompatible changes.
1. Use the `MINOR` version when adding functionality in a backwards compatible manner.
1. Use the `PATCH` version when introducing backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- In the context of initial development, backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- In the context of pre-release, backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)

## Copyright

Copyright © 2018-2021 [Hadenlabs](https://hadenlabs.com)

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## License

The code and styles are licensed under the LGPLV3 license [See project license.](LICENSE).

## Don't forget to 🌟 Star 🌟 the repo if you like terraform-github-repository

[Your feedback is appreciated](https://github.com/hadenlabs/terraform-github-repository/issues)
