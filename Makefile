SHELL := /bin/bash
ACTIVATE = source ~/.venvs/ansible/bin/activate

.PHONY: playbook common desktop all

playbook: all

common:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags common

desktop:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags desktop

all:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml
