export STARSHIP_CONFIG=~/starship.toml
eval "$(starship init zsh)"

setopt auto_cd

alias ls="ls --color"
alias _W="cd /Volumes/Workspace"
alias _P="cd /Volumes/Workspace/projects"
alias _dot="cd /Volumes/Workspace/dotfiles"
alias _conf="cd /Volumes/Workspace/configs"
alias _js="cd /Volumes/Workspace/projects/js"
alias gg="git status"
alias _fp='fzf --preview="bat --color=always {}"'

# bindkey              '^I'         menu-complete
# bindkey "$terminfo[kcbt]" reverse-menu-complete

# pnpm
export PNPM_HOME="/Users/andy/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source <(fzf --zsh)

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# bun completions
[ -s "/Users/andy/.bun/_bun" ] && source "/Users/andy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
