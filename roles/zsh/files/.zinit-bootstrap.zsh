source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# =============== [Libs] ===============
#zinit is-snippet lucid for OMZ::lib/completion.zsh
#zinit is-snippet lucid wait'1' for OMZ::lib/spectrum.zsh # Helpful for working with colors
#zinit light-mode lucid for zdharma/zui

# =============== [Completions] ===============
_zsh-completions_reload() {
    echo "Updating ZSH Completions..."
    zinit cclear > /dev/null
    zinit creinstall zsh-users/zsh-completions > /dev/null
    compinit -C
}
zinit light-mode lucid atpull"_zsh-completions_reload" as"completion" for zsh-users/zsh-completions
zinit light-mode lucid as"completion" for iboyperson/zsh-windscribe-completions
zinit is-snippet lucid for https://github.com/pyenv/pyenv/blob/master/completions/pyenv.zsh
zinit light-mode lucid for gradle/gradle-completion
zinit light-mode lucid for lukechilds/zsh-better-npm-completion

# =============== [QOL] ===============
zinit light-mode lucid for iboyperson/zsh-pipenv
#zinit light-mode lucid for $HOME/projects/zsh-pipenv # Local version for dev purposes

zinit light-mode lucid for iboyperson/zsh-gradle
#zinit light-mode lucid for $HOME/projects/zsh-gradle

# =============== [Prompt] ===============
# zinit light-mode lucid for iboyperson/p9k-theme-pastel
zinit light-mode lucid for $HOME/projects/p9k-theme-pastel
zinit light-mode lucid depth=1 for romkatv/powerlevel10k

#zinit light-mode lucid for iboyperson/pastel
#zinit light-mode lucid for $HOME/projects/pastel # Local version for dev purposes

# =============== [Plugins] ===============
zinit light-mode lucid wait for ael-code/zsh-colored-man-pages
zinit light-mode lucid wait for wfxr/forgit

# Syntax Highlighting should always be last!
zinit light-mode lucid wait atinit"_run_compinit; zpcdreplay" for zdharma/fast-syntax-highlighting
