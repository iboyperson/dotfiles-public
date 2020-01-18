# Load ZPlugin Module
#module_path+=( "/home/iboyperson/.zplugin/bin/zmodules/Src" )
#zmodload zdharma/zplugin

# Load ZPlugin
source '/home/iboyperson/.zplugin/bin/zplugin.zsh'

# =============== [Libs] ===============
#zplugin ice lucid; zplugin snippet OMZ::lib/completion.zsh
# Helpful for working with colors
#zplugin ice wait'1'; zpl snippet OMZ::lib/spectrum.zsh
#zplugin light zdharma/zui

# =============== [Completions] ===============
_zsh-completions_reload() {
    echo "Updating ZSH Completions..."
    zplugin cclear > /dev/null
    zplugin creinstall zsh-users/zsh-completions > /dev/null
    compinit -C
}
zplugin light-mode lucid atpull"_zsh-completions_reload" as"completion" for zsh-users/zsh-completions
zplugin light-mode lucid as"completion" for iboyperson/zsh-windscribe-completions
zplugin is-snippet lucid for https://github.com/pyenv/pyenv/blob/master/completions/pyenv.zsh
zplugin light-mode lucid for gradle/gradle-completion
zplugin light-mode lucid for lukechilds/zsh-better-npm-completion

# =============== [QOL] ===============
zplugin light-mode lucid for iboyperson/zsh-pipenv
# Local version for dev purposes
#zplugin light-mode lucid for $HOME/projects/zsh-pipenv

zplugin light-mode lucid for iboyperson/zsh-gradle
# zplugin ice lucid; zplugin light iboyperson/zsh-gradle
#zplugin ice lucid; zplugin light $HOME/projects/zsh-gradle

# =============== [Prompt] ===============
# zplugin light-mode lucid for iboyperson/p9k-theme-pastel
zplugin light-mode lucid for $HOME/projects/p9k-theme-pastel
zplugin light-mode lucid depth=1 for romkatv/powerlevel10k

#zplugin light-mode lucid for iboyperson/pastel
# Local version for dev purposes
#zplugin light-mode lucid for $HOME/projects/pastel

# =============== [Plugins] ===============
zplugin light-mode lucid wait for ael-code/zsh-colored-man-pages
zplugin light-mode lucid wait for wfxr/forgit

# Syntax Highlighting should always be last!
zplugin light-mode lucid wait atinit"_run_compinit; zpcdreplay" for zdharma/fast-syntax-highlighting
