include help.mk

.DEFAULT_GOAL := help

tags ?= all
playbook ?= localhost

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo "Variable '$*' not set"; \
		exit 1; \
	fi

.PHONY: setup
setup: ##@setup Build and copy the tools needed to run this project.
	@echo "Ensure ansible install"
	@sudo dnf -y install ansible \
		python2-rpm \
		libselinux-python

.PHONY: ansible-playbook
ansible-playbook: guard-playbook ##@ansible-playbook Execute Ansible playbooks.
	@cd ansible && ansible-playbook $(playbook).yaml -t $(tags) $(args)

.PHONY: test
test: guard-playbook ##@test Execute tests.
	@echo "Execute Ansible playbook syntax check"
	@cd ansible && ansible-playbook $(playbook).yaml -t $(tags) --syntax-check
