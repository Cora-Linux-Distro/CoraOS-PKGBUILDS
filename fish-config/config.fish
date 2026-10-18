# Maintainer: CoraOS <support@coraos.org>

if status is-interactive

    zoxide init fish | source

    alias ls 'eza --icons'
    alias ll 'eza -lah --icons'
    alias la 'eza -a --icons'
    alias cat bat
    alias grep 'grep --color=auto'

    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

end
