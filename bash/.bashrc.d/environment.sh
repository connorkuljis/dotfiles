# ~/.bashrc.d/environment.sh
export EDITOR="nvim"

# Add system wide go path
export PATH=$PATH:/usr/local/go/bin 

# Add user programs to go path
export PATH=$PATH:~/go/bin

# Source rust/cargo environment
. "$HOME/.cargo/env"


