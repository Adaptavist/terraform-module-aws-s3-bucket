package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestModuleDefaultPlans(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "..",
		Vars: map[string]interface{}{
			"domain": "my-example-website.com",
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndPlan(t, terraformOptions)
}
