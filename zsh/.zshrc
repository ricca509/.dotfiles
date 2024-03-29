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
  zsh-fzf-history-search
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
alias gpo="git pull origin $(git_main_branch)"
# Nodejs
alias npnuke='rm -rf node_modules && npm install'

setopt HIST_IGNORE_ALL_DUPS

# thefuck
eval $(thefuck --alias)

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

# Google cloud business
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# Android setup
export ANDROID_SDK=$HOME/Library/Android/sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$PATH

# Kube
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

echo -e "\e[0;34m Welcome back, Master \e[0m"
