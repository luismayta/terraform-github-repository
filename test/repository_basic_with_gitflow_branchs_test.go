package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestBasicWithGitflowBranchsSuccess(t *testing.T) {
	t.Parallel()

	visibility := "public"
	repository := "test-repository"
	description := "description"
  isGitFlow := true
	settings := map[string]interface{}{
		"auto_init": true,
	}

	terraformOptions := &terraform.Options{
		// The path to where your Terraform code is located
		TerraformDir: "repository-basic-with-gitflow-branchs",
		Upgrade:      true,
		Vars: map[string]interface{}{
			"description": description,
			"name":        repository,
			"settings":    settings,
			"visibility":  visibility,
      "is_git_flow": isGitFlow,
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
	outputRepository := terraform.Output(t, terraformOptions, "instance")
	assert.NotEmpty(t, outputRepository, outputRepository)
}
