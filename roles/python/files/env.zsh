# Set Path
export PATH="$HOME/.local/bin:$HOME/.poetry/bin:$PATH"

if [ -z $PYENV_ROOT ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi

