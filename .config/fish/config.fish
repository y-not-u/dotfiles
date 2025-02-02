set fish_greeting

if test (uname) = Darwin
    source ~/.config/fish/config_macos.fish
else if test (uname) = Linux
    source ~/.config/fish/config_linux.fish
end

# Start with Zellij
if status is-interactive
    source $HOME/.config/fish/functions/zellij.fish
end

# You may need to manually set your language environment
set -x LANG en_US.UTF-8

# Preferred editor for local and remote sessions
if set -q SSH_CONNECTION
    set -x EDITOR vim
else
    set -x EDITOR nvim
end

# Compilation flags
set -x ARCHFLAGS "-arch x86_64"

# Setting environment variables
set -x BUN_INSTALL "$HOME/.bun"
set -x ANDROID_USER_HOME "$XDG_DATA_HOME"/android
set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -x GOPATH "$XDG_DATA_HOME"/go
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -x PKG_CACHE_PATH "$XDG_CACHE_HOME"/pkg-cache
set -x RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -x VOLTA_HOME "$XDG_DATA_HOME"/volta
set -x _Z_DATA "$XDG_DATA_HOME/z"
set -x HISTFILE "$XDG_STATE_HOME"/zsh/history

# aliases
#if test -f ~/.aliases
#    source ~/.aliases
#end

# pnpm
set -x PNPM_HOME "$HOME/.local/share/pnpm"
if not contains $PNPM_HOME $PATH
    set -x PATH $PNPM_HOME $PATH
end

# Update PATH
set -x PATH $VOLTA_HOME/bin $CARGO_HOME/bin $BUN_INSTALL/bin $PATH

# bun completions
#if test -s "$BUN_INSTALL/_bun"
#    source "$BUN_INSTALL/_bun"
#end

# starship
if type -q starship
    starship init fish | source
end


# zoxide init
if type -q zoxide
    zoxide init fish | source
end
