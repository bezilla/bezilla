.DEFAULT_GOAL := help

help: ## List targets
	@grep -hE '^[a-z][a-zA-Z0-9_-]*:.*?## ' $(MAKEFILE_LIST) \
		| awk 'BEGIN{FS=":.*?## "}{printf "  %-10s %s\n", $$1, $$2}'

init: ## Step 1 for any clone: install the pre-push gate
	@git config core.hooksPath .githooks
	@echo "core.hooksPath = $$(git config --get core.hooksPath)"
	@command -v gitleaks >/dev/null 2>&1 \
		|| { echo "gitleaks is not installed. The pre-push gate fails closed without it: brew install gitleaks"; exit 1; }
	@echo "pre-push gate installed"

check: ## Run the gate over all history, as CI does
	@./.githooks/pre-push --all-history

selftest: ## Prove the gate rejects and accepts what it claims
	@./.githooks/selftest.sh

.PHONY: help init check selftest
