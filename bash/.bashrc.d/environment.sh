# ~/.bashrc.d/environment.sh
export HISTSIZE=100000

export EDITOR="nvim"

# Add system wide go path
export PATH=$PATH:/usr/local/go/bin 

# Add user programs to go path
export PATH=$PATH:~/go/bin

# Source rust/cargo environment
. "$HOME/.cargo/env"

# Add bun innstall path
export BUN_INSTALL="$HOME/.bun"

export PATH="$BUN_INSTALL/bin:$PATH"

# Source LLM API keys
. "$HOME/.llm-api-keys.env"
