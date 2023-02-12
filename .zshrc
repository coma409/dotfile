#=========================================#
# 8b   d8           8    8888 888b. .d88b #
# 8YbmdP8 Yb  dP    8    8www 8  .8 8P    #
# 8  "  8  YbdP     8    8    8wwK' 8b    #
# 8     8   dP      8888 8    8  Yb `Y88P #
#          dP                             #
#=========================================#

# Set ZSH THEME
ZSH_THEME="fishy"

# source environment
source "$HOME/.config/zsh/.zprofile"

source "$ZSH/oh-my-zsh.sh"

source "$ZINIT/zinit.zsh"

source "$HOME/.config/zsh/.zsh_aliases"

# source "$HOME/.config/zsh/.zsh_fzf"


# User plugins
zinit ice lucid wait='0'
zinit light zsh-users/zsh-completions

zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait='0'
zinit light zdharma/fast-syntax-highlighting

zinit ice lucid wait='0'
zinit snippet OMZ::lib/git.zsh

zinit ice lucid wait='0' atload="zpcompinit; zpcdreplay"
zinit snippet OMZ::plugins/git/git.plugin.zsh

autoload compinit; compinit; zinit cdreplay -q

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

