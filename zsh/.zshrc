# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Dotfiles repo
export DOTFILES="$HOME/.dotfiles"

# PATH manipulation
export PATH=$HOME/bin:$DOTFILES/bin:${PATH}

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Source secrets
if [[ -a $HOME/.zshrc-secrets ]]
then
  source $HOME/.zshrc-secrets
fi

# Load functions
for f in $DOTFILES/functions/*; do source $f; done

# For a full list of active aliases, run `alias`.
# Personal aliases
alias tss="tmux-sessionizer"
alias tmuxa="tmux attach"
alias tmuxk9="tmux kill-server"
alias tmuxk="tmux kill-session"
alias sourcezsh="source $HOME/.zshrc"
# Nodejs
alias npnuke='rm -rf node_modules && npm install'

# Bindings
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^s "tmux-new-session\n"

# ASDF business
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/plugins/java/set-java-home.zsh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Android setup
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH

# GCloud
# The next line enables shell command completion for gcloud.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
# The next line updates PATH for the Google Cloud SDK.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

echo -e "\e[0;34m Welcome back, Master \e[0m"