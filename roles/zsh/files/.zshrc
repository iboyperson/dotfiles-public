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

# Zplugin
source ~/.zplugin-init.zsh

# load zsh config files
setopt extendedglob
config_files=(~/.zsh/^(completions|env)/*.zsh(N))
unsetopt extendedglob
for file in ${config_files}
do
	source $file
done

# fzf completions and key-bindings
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"

travis() {
    unfunction "$0"
    source "/usr/lib/ruby/gems/$(ruby --version | grep -Po "(?<=ruby )(...)").0/gems/travis-$(travis --version)/assets/travis.sh"
    $0 "$@"
}
