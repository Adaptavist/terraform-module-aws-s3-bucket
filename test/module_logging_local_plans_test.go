package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestModuleLoggingLocalPlans(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "..",
		Vars: map[string]interface{}{
			"domain": "my-example-website.com",
			"logging_enabled": true,
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndPlan(t, terraformOptions)
}
