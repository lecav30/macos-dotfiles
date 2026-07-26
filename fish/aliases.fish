# Quick edits
alias ea 'nvim ~/.config/fish/aliases.fish'
alias ef 'nvim ~/.config/fish/config.fish'
alias eg 'nvim ~/.gitconfig'

# Common
alias g git
alias cls clear
alias home 'cd ~'
alias vimfiles 'cd ~/.config/nvim'
alias synct 'syncthing --no-browser'

# Neovim
alias v nvim
alias vim nvim

# Move up directories
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# Eza (ls alternative)
alias ld 'eza -lD'
alias lf 'eza -lF --color=always | grep -v /'
alias lh 'eza -dl .* --group-directories-first'
alias ll 'eza -al --group-directories-first'
alias ls 'eza -alF --color=always --sort=size | grep -v /'
alias lt 'eza -al --sort=modified'

# Git
function clean_git_branches
    echo '🧠 Fetching and pruning remotes...'
    git fetch --prune

    echo '🧹 Eliminando ramas locales que ya no existen en el remoto...'
    for branch in (git branch --format='%(refname:short)')
        if not git show-ref --verify --quiet "refs/remotes/origin/$branch"
            echo "❌ Borrando rama local: $branch"
            git branch -D $branch
        end
    end
    echo '✅ Limpieza completada.'
end

alias gcb clean_git_branches
alias undo 'git reset --soft HEAD~1'

# FZF
function ff
    fzf --preview "bat --style=numbers --color=always --line-range :500 {}"
end

# Yazi functions
function yy
    set -l tmp (mktemp -t 'yazi-cwd.XXXXXX')
    yazi $argv --cwd-file="$tmp"
    if set -l cwd (cat -- "$tmp"); and test -n "$cwd"; and test "$cwd" != "$PWD"
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# WebP conversion
function png2webp
    set -l files *.png
    if test (count $files) -eq 0
        echo 'No se encontraron archivos PNG.'
        return 1
    end

    for file in $files
        set -l output (string replace -r '\\.png$' .webp -- "$file")
        echo "Convirtiendo: $file"
        cwebp -q 90 -m 6 -mt -sharp_yuv -af "$file" -o "$output"
    end
end

function png2webp-clean
    set -l files *.png
    if test (count $files) -eq 0
        echo 'No se encontraron archivos PNG.'
        return 1
    end

    for file in $files
        set -l output (string replace -r '\\.png$' .webp -- "$file")
        echo "Convirtiendo: $file"
        if cwebp -q 90 -m 6 -mt -sharp_yuv -af "$file" -o "$output"
            rm -- "$file"
            echo "✓ $output"
        else
            echo '✗ Error al convertir '$file
        end
    end
end
