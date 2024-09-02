# Quick edits
alias ea 'nvim ~/.config/fish/aliases.fish'
alias ef 'nvim ~/.config/fish/config.fish'
alias eg 'nvim ~/.gitconfig'

# Common
alias g git
alias cls clear
alias home 'cd ~'

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

# FZF
function ff
    fzf --preview "bat --style=numbers --color=always --line-range :500 {}"
end

# Yazi functions
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
