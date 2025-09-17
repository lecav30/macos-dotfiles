# Quick edits
alias ea="nvim ~/.config/zsh/aliases.zsh"
alias ef="nvim ~/.zshrc"
alias eg="nvim ~/.gitconfig"

# Common
alias g="git"
alias cls="clear"
alias home="cd ~"
alias vimfiles="cd ~/.config/nvim"
alias synct="syncthing --no-browser"

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

# Git

# 🧹 Borrar ramas locales que ya no existen en el remoto
function clean_git_branches() {
  echo "🧠 Fetching and pruning remotes..."
  git fetch --prune

  echo "🧹 Eliminando ramas locales que ya no existen en el remoto..."
  for branch in $(git branch | sed 's/*//'); do
    remote_branch=$(git branch -r | grep "origin/$branch" | xargs)
    if [ -z "$remote_branch" ]; then
      echo "❌ Borrando rama local: $branch"
      git branch -D $branch
    fi
  done
  echo "✅ Limpieza completada."
}

# Alias más corto
alias gcb="clean_git_branches"

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
