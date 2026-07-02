SHELL := /bin/bash
ACTIVATE = source ~/.venvs/ansible/bin/activate

.PHONY: playbook common desktop all update-tools update-rust-tools update-npm-tools
.PHONY: update-go-tools
.PHONY: packages stow rust go node neovim

playbook: all

# Baseline roles (everything except desktop GUI apps)
common:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags common

desktop:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags desktop

all:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml

# Individual roles (each is independently runnable via its tag)
packages:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags packages
stow:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags stow
rust:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags rust
go:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags go
node:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags node
neovim:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags neovim

# Force refresh of language toolchains (canary-gated, skipped by default)
update-rust-tools:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags rust --extra-vars update_rust_tools=true
update-npm-tools:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags node --extra-vars update_npm_tools=true
update-go-tools:
	$(ACTIVATE) && ansible-playbook -i inventory.ini playbook.yaml --tags go --extra-vars update_go_tools=true

# Refresh all language toolchains at once
update-tools: update-rust-tools update-npm-tools update-go-tools
