# Sourcing aliases
if [ -f ~/.config/zsh/aliases.zsh ]; then
  source ~/.config/zsh/aliases.zsh
fi

# Initialize inshellisense
# is init zsh

# Initialize Homebrew shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize Starship prompt
eval "$(/opt/homebrew/bin/starship init zsh)"

# Initialize Zoxide
eval "$(/opt/homebrew/bin/zoxide init zsh)"

# Add paths to PATH variable
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/development/flutter/bin:/usr/local/mysql/bin:/opt/homebrew/bin:/opt/homebrew/opt/llvm/bin:$HOME/.local/share/nvim/mason/bin:$PATH"

# Environment variables
export EDITOR="nvim"
export LANG="en_US.UTF-8"

# Clang
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Vcpkg
# Uncomment if needed
# export VCPKG_ROOT="$HOME/development/vcpkg"
# export PATH="$VCPKG_ROOT:$PATH"

# Java (using jenv)
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# Use: `jenv enable-plugin export` 
# to enable jenv-autoload.plugin.zsh and allow JAVA_HOME to be set
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
# export PATH=$JAVA_HOME/bin:$PATH

# Add Ruby bin paths if they exist
if [ -d /opt/homebrew/opt/ruby/bin ]; then
  export PATH="/opt/homebrew/opt/ruby/bin:$(gem env gemdir)/bin:$PATH"
fi

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/lecav/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/gradle@8/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# uv
export PATH="$HOME/.local/bin:$PATH"
