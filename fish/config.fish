# Shell aliases and functions
if test -f ~/.config/fish/aliases.fish
    source ~/.config/fish/aliases.fish
end

# Homebrew and interactive tools
eval (/opt/homebrew/bin/brew shellenv fish)

if status is-interactive
    starship init fish | source
    zoxide init fish | source
    atuin init fish | source
end

# Development paths shared with Zsh.
fish_add_path -g /usr/local/bin /usr/local/sbin
fish_add_path -g $HOME/development/flutter/bin /usr/local/mysql/bin
fish_add_path -g /opt/homebrew/opt/llvm/bin /opt/homebrew/opt/gradle@8/bin
fish_add_path -g $HOME/.local/share/nvim/mason/bin $HOME/.local/bin
fish_add_path -g $HOME/.jenv/bin $HOME/.jenv/shims

set -gx EDITOR nvim
set -gx LANG en_US.UTF-8
set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include

# Ruby
if test -d /opt/homebrew/opt/ruby/bin
    fish_add_path -g /opt/homebrew/opt/ruby/bin (gem env gemdir)/bin
end

# Bun and pnpm
set -gx BUN_INSTALL $HOME/.bun
fish_add_path -g $BUN_INSTALL/bin
set -gx PNPM_HOME $HOME/Library/pnpm
fish_add_path -g $PNPM_HOME

# Android
set -gx ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set -gx ANDROID_HOME $ANDROID_SDK_ROOT
fish_add_path -g $ANDROID_SDK_ROOT/emulator $ANDROID_SDK_ROOT/platform-tools

# NVM's shell functions are Bash/Zsh-specific. Use Zsh to switch Node versions;
# Fish can still run the Node binary already available on PATH.
