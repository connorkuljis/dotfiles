SHELL := /bin/bash
ACTIVATE = source ~/.venvs/ansible/bin/activate

.PHONY: playbook

playbook:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml
