_run_compinit() {
    # Compinit
    #
    # https://gist.github.com/ctechols/ca1035271ad134841284
    # https://carlosbecker.com/posts/speeding-up-zsh
    #
    fpath=("$HOME/.zsh/completions" $fpath)
    autoload -Uz compinit
    if [ -f ${ZDOTDIR:-$HOME}/.zcompdump ]; then
        if [ $(date +'%j') != $(/usr/bin/stat -c '%Y' ${ZDOTDIR:-$HOME}/.zcompdump | awk '{print strftime("%j", $1)}') ]; then
            compinit;
        else
            compinit -C;
        fi
    else
        compinit -C;
    fi
}

# Bootstrap Zinit
source ~/.zinit-bootstrap.zsh

# load zsh config files
setopt extendedglob
config_files=(~/.zsh/^(completions|env)/*.zsh(N))
unsetopt extendedglob
for file in ${config_files}
do
	source $file
done

