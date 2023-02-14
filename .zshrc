#=========================================#
# 8b   d8           8    8888 888b. .d88b #
# 8YbmdP8 Yb  dP    8    8www 8  .8 8P    #
# 8  "  8  YbdP     8    8    8wwK' 8b    #
# 8     8   dP      8888 8    8  Yb `Y88P #
#          dP                             #
#=========================================#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set ZSH THEME
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set magic functions off
DISABLE_MAGIC_FUNCTIONS=true

# source files
source "$HOME/.config/zsh/.zsh_env"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source "$HOME/.config/zsh/.zsh_plugins"

source "$ZSH/oh-my-zsh.sh"

source "$HOME/.config/zsh/.zsh_aliases"

source "$HOME/.config/zsh/.zsh_fzf"
