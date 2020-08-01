include help.mk

.DEFAULT_GOAL := help

tags ?= all
playbook ?= playbook

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo "Variable '$*' not set"; \
		exit 1; \
	fi

.PHONY: provision
provision: guard-playbook ##@provision execute workstation provision.
	ansible-playbook $(playbook).yaml -i inventory -t $(tags) $(args) --ask-become-pass

.PHONY: test
test: guard-playbook ##@test execute syntax check.
	@echo "Execute Ansible playbook syntax check"
	ansible-playbook $(playbook).yaml -t $(tags) --syntax-check --ask-become-pass
