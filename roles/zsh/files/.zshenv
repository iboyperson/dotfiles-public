# Set Path
export PATH=/usr/local/bin:$PATH

# SSH Key Management
export SSH_ASKPASS=/usr/bin/ksshaskpass

# Zsh History
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$HOME/.zsh_history

# GPG Key
export GPG_TTY=$(tty)

# Set Editor
export EDITOR=nvim

# load zsh config files
config_files=(~/.zsh/env/*.zsh(N))
for file in ${config_files}
do
	source $file
done
