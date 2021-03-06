# OhMyZsh
ZSH_THEME=""

plugins=(
    git
    yarn
    httpie
    kubectl
)

source $ZSH/oh-my-zsh.sh

# SWRC
echo -n 'Loading SWRC ... '

swrc_dir="$(dirname $0)"

## Path
export PATH=$HOME/bin:$PATH

## Aliases
alias q="exit"
alias clr="clear"
alias rrc="source ~/.zshrc"

## Editor
export EDITOR='nvim'
alias view="nvim -R"

## Theme
source "$swrc_dir/af-magic-s.zsh-theme"

## Plugins
swrc_plugins=(
    diff
    git
    nvm
    xcode
    jabba
    rbenv
    lsd
    fuck
    yarn
)

loadPlugins() {
    for plugin ($swrc_plugins); do
        if [ -f "$swrc_dir/plugins/$plugin/_plugin.sh" ]; then
            plugin_dir="$swrc_dir/plugins/$plugin"
            source "$swrc_dir/plugins/$plugin/_plugin.sh"
        else
            echo "Plugin $plugin not found"
        fi
    done
}

loadPlugins

alias useidea="$swrc_dir/extern/useidea.rb"

#TODO: Move these
## Android
export ANDROID_SDK_ROOT=/Users/swhisler/.android/my-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools

echo 'Done'
