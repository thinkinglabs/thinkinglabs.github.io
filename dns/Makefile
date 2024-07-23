SHELL := /bin/bash
.DEFAULT_GOAL := help
.PHONY: clean init check workspace validate plan apply help

ifdef env
ifeq ($(shell echo $(env) | egrep "staging|production"),)
$(error env should be one of staging|production)
endif
endif

clean: ## Remove temporary files from local folders
	rm -rf .terraform tfplan src/tfplan.json

init: ## Terraform init
	$(info initialising ...)
	terraform init ${args} && tflint --init

check:
	if [[ -z "${env}" ]]; then echo "env must be set to staging|production";false; fi

ws-list: ## Lists Terraform workspaces
	terraform workspace list

ws-new: ## Creates a new Terraform workspace
	terraform workspace new $(env)

ws-select: check ## Switches between Terraform workspaces
	$(info switching workspace to $(env) ...)
	terraform workspace select $(env)

workspace: check ## Switches between Terraform workspaces
	$(info switching workspace to $(env) ...)
	terraform workspace select $(env)

validate: ## Static code analysis
	$(info validating ...)
	terraform validate
	tflint

plan: validate ## Terraform plan
	$(info creating a plan ...)
	terraform plan -out=tfplan -input=false -var-file=.ovh.tfvar

apply: ## Terraform apply
	$(info applying the plan ...)
	terraform apply -input=false tfplan

test: compliance e2e ## Executes all tests

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
