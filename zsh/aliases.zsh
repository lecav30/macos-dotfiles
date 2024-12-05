# Quick edits
alias ea="nvim ~/.config/zsh/aliases.zsh"
alias ef="nvim ~/.zshrc"
alias eg="nvim ~/.gitconfig"

# Common
alias g="git"
alias cls="clear"
alias home="cd ~"

# Neovim
alias v="nvim"
alias vim="nvim"

# Move up directories
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Eza (ls alternative)
alias ld="eza -lD"
alias lf="eza -lF --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -al --group-directories-first"
alias ls="eza -alF --color=always --sort=size | grep -v /"
alias lt="eza -al –sort=modified"

# FZF
ff() {
    fzf --preview "bat --style=numbers --color=always --line-range :500 {}"
}

# Yazi functions

yy() {
    local tmp
    tmp=$(mktemp -t "yazi-cwd.XXXXXX")

    yazi "$@" --cwd-file="$tmp"

    if [ -s "$tmp" ]; then
        local cwd
        cwd=$(<"$tmp")
        if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            cd -- "$cwd"
        fi
    fi
    rm -f -- "$tmp"
}
