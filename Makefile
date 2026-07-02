SHELL := /bin/bash
ACTIVATE = source ~/.venvs/ansible/bin/activate

.PHONY: playbook common desktop all update-tools

playbook: all

common:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags common

desktop:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags desktop

all:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml

# Force cargo-binstall to re-check crate versions and upgrade even when the
# tools are already installed (skipped by default for speed).
update-tools:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags common --extra-vars update_rust_tools=true
