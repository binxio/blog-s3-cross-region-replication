.PHONY: help create update delete

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deploy: ## deploy the stack
	sceptre launch-env example

delete: ## delete the stack
	sceptre delete-env example

info: ## info about the stack
	sceptre describe-stack-outputs example/eu-west-1 bucket
	sceptre describe-stack-outputs example/us-east-1 replicated-bucket


