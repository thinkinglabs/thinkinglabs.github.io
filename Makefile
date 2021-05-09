.DEFAULT_GOAL := help
.PHONY: install serve serve-draft help

install: ## Install required gems
	bundle install

serve: ## Serve the website
	bundle exec jekyll serve --livereload .

serve-draft: ## Serve the website including draft posts
	bundle exec jekyll serve --livereload --draft .

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
