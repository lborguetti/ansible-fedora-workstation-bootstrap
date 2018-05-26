.DEFAULT_GOAL := setup

tags ?= all

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo "Variable '$*' not set"; \
		exit 1; \
	fi

.PHONY: setup
setup:
	@echo "Ensure ansible install"
	@doas pkg_add ansible

.PHONY: ansible-playbook
ansible-playbook:
	@ansible-playbook $(playbook).yaml -t $(tags)
