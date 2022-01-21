# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Dotfiles repo
export DOTFILES="$HOME/.dotfiles"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# dotfiles bin 
export PATH=$DOTFILES/bin:${PATH}

# Source secrets
if [[ -a $HOME/.zshrc-secrets ]]
then
  source $HOME/.zshrc-secrets
fi

# Load functions
for f in $DOTFILES/functions/*; do source $f; done

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# For a full list of active aliases, run `alias`.

# Personal aliases
alias tss="tmux-sessionizer"
alias tmuxa="tmux attach"

# Bindings
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^z "tmux-new-session\n"

# ASDF business
. $HOME/.asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh
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
