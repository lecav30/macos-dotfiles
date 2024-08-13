# Sourcing aliases
if test -f ~/.config/fish/aliases.fish
    . ~/.config/fish/aliases.fish
end

# Initialize Starship prompt
/opt/homebrew/bin/starship init fish | source

# Add paths to PATH variable
fish_add_path -g /usr/local/bin
fish_add_path -g /usr/local/sbin
fish_add_path -g $HOME/development/flutter/bin
fish_add_path -g /usr/local/mysql/bin
fish_add_path -g /opt/homebrew/bin
# set -Ux DYLD_LIBRARY_PATH (brew --prefix)/lib $DYLD_LIBRARY_PATH

set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/azul-17.0.12/Contents/Home"
set -x JAVA_HOME (/usr/libexec/java_home -v17.0.12)

# Add Ruby bin paths if they exist
if test -d /opt/homebrew/opt/ruby/bin
    set -gx PATH /opt/homebrew/opt/ruby/bin $PATH
    set -gx PATH (gem env gemdir)/bin $PATH
end

# bun
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH $BUN_INSTALL/bin $PATH
# bun end

# pnpm
set -gx PNPM_HOME "/Users/lecav/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Android
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x PATH "$PATH $ANDROID_HOME/emulator"
set -x PATH "$PATH $ANDROID_HOME/platform-tools"
# Android end

# Initialize Homebrew shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Warp shell integration (if needed)
if status is-interactive
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'
end
