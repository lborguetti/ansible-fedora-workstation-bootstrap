.DEFAULT_GOAL := setup

tags ?= all

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Variable '$*' not set"; \
		exit 1; \
		fi

.PHONY: setup
setup:
	@echo "Ensure ansible install"
	@sudo dnf -y install ansible \
		python2-rpm \
		libselinux-python

.PHONY: ansible-playbook
ansible-playbook: guard-playbook
	@ansible-playbook $(playbook).yaml -t $(tags)
