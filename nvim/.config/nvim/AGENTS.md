AGENTS.md

Build / Lint / Test
- Run Neovim config lint (luacheck): luacheck . || echo "install luacheck"
- Run a single Lua test (if using busted): busted -o verbose path/to/test.lua
- Run full test suite: busted
- Check formatting: stylua --check .

Code style guidelines
- Formatting: use stylua (indent 2, spaces). Run `stylua .` to format.
- Imports/Requires: use local variables: local mod = require("plugins.mod")
- Types: prefer simple tables and explicit checks; use comments for complex shapes.
- Naming: use snake_case for module/files, lower_case_with_underscores for functions and variables, PascalCase for modules/objects.
- Error handling: return nil, err or use assert when bootstrapping; avoid silent failures.
- Side effects: keep plugin configs idempotent and avoid global state when possible.

Cursor / Copilot rules
- If .cursor/rules or .cursorrules exist, follow repository rules for automated edits.
- Follow GitHub Copilot instructions in .github/copilot-instructions.md if present.

Notes
- This file is for autonomous agents operating in this repo. Keep changes minimal, run formatter and tests after edits.
