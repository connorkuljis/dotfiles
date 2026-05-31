SHELL := /bin/bash
ACTIVATE = source ~/.venvs/ansible/bin/activate

.PHONY: playbook activate

activate:
	$(ACTIVATE)

playbook: activate
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml
