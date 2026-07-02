# ~/.bashrc.d/environment.sh
export HISTSIZE=100000

export EDITOR="nvim"

# Add system wide go path
export PATH=$PATH:/usr/local/go/bin 

# Add user programs to go path
export PATH=$PATH:~/go/bin

# Set cargo home to user directory
export CARGO_HOME="$HOME/.cargo"

# Source rust/cargo environment
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
elif [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Add bun install path
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ -f "$HOME/.secrets" ]; then
    source "$HOME/.secrets"
fi
