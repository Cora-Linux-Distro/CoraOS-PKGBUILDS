if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZDOTDIR="$HOME"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt AUTO_CD
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt NO_BEEP
setopt PROMPT_SUBST
setopt MENU_COMPLETE

export EDITOR=nano
export PAGER=less
export LESS='-R'
export TERMINAL=kitty
export BROWSER=firefox
export CLICOLOR=1
export COLORTERM=truecolor
export BAT_THEME="Catppuccin Mocha"

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

mkdir -p ~/.cache/zsh

autoload -Uz compinit
zmodload zsh/complist
compinit -d ~/.cache/zcompdump

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

[[ -r /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]] && source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
if [[ -f ~/.p10k.zsh ]]; then
    source ~/.p10k.zsh
elif [[ -f /usr/share/coraos/zsh/coraos.p10k.zsh ]]; then
    source /usr/share/coraos/zsh/coraos.p10k.zsh
fi

source /usr/share/coraos/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/coraos/zsh/plugins/history-substring-search/zsh-history-substring-search.zsh
source /usr/share/coraos/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down



eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

alias ls='eza --icons --group-directories-first'
alias l='eza --icons'
alias ll='eza -lah --icons --git --group-directories-first'
alias la='eza -a --icons'
alias lt='eza --tree --icons'
alias tree='eza --tree --icons'
alias c='clear'
alias cls='clear'
alias reload='exec zsh'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rmd='rmdir -v'
alias rmde='rmdir -v --ignore-fail-on-non-empty'
alias rm='rm -Iv'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ip='ip -c'
alias ping='ping -c 5'

alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias autoremove='sudo pacman -Rns $(pacman -Qtdq)'
alias search='pacman -Ss'
alias info='pacman -Si'
alias files='pacman -Ql'
alias orphan='pacman -Qtdq'
alias clean='sudo pacman -Sc'
alias mirrors='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

alias gst='git status'
alias gaa='git add .'
alias gcm='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
