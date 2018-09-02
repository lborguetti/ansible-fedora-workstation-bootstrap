include help.mk

.DEFAULT_GOAL := help

tags ?= all
playbook ?= playbook

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo "Variable '$*' not set"; \
		exit 1; \
	fi

.PHONY: setup
setup: ##@setup Build and copy the tools needed to run this project.
	@echo "Ensure ansible && molecule install"
	sudo dnf -y install python-virtualenv
	virtualenv --no-site-packages .venv
	source .venv/bin/activate
	pip install ansible

.PHONY: ansible-playbook
ansible-playbook: guard-playbook ##@ansible-playbook Execute Ansible playbooks.
	source .venv/bin/activate)
	cd ansible && ansible-galaxy requirements.yml && ansible-playbook $(playbook).yaml -t $(tags) $(args)

.PHONY: test
test: guard-playbook ##@test Execute tests.
	@echo "Execute Ansible playbook syntax check"
	source .venv/bin/activate)
	cd ansible && ansible-galaxy requirements.yml && ansible-playbook $(playbook).yaml -t $(tags) --syntax-check
