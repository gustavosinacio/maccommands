# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

# ------------------------------------------------------------------------------
# THEME CONFIG -----------------------------------------------------------------

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="agnoster"

# This next line enables spaceship theme
# if using it, disable the ZSH_THEME line above

CPU="$(sysctl -n machdep.cpu.brand_string | grep Intel)"

if [[ $CPU == *"Intel"* ]]; then
    echo "\x1b[32mIntel"
    source "/usr/local/opt/spaceship/spaceship.zsh"
else
    echo "M1"
    source "/opt/homebrew/opt/spaceship/spaceship.zsh"
fi

source "$HOME/.spaceship.zsh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "spaceship" )

# THEME CONFIG -----------------------------------------------------------------
# ------------------------------------------------------------------------------
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    vscode
    yarn
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#fa33ac,bg=#222,bold,underline"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ffe135,bg=#222,bold"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Agnoster theme prompt config
prompt_context() {
    # Custom (Random emoji)
    emojis=("⚡️" "🔥" "💀" "👑" "😎" "🍻" "🚀" "💡" "🔑" "🕸")
    RAND_EMOJI_N=$(($RANDOM % ${#emojis[@]} + 1))
    prompt_segment black default "${emojis[$RAND_EMOJI_N]} "
    prompt_segment green black "$(arch)"
}

export NVM_COLORS='rcgWy'

fpath=($fpath "/Users/$USER/.zfunctions")

[ -f ~/.profile ] && source ~/.profile || echo " ❌ profile"

eval "$(rbenv init - zsh)"

# Node installed from brew config
export LDFLAGS="-L/usr/local/opt/node@16/lib"
export CPPFLAGS="-I/usr/local/opt/node@16/include"
export PATH="/usr/local/opt/node@16/bin:$PATH"

# set Java home
# export "JAVA_HOME=$(/usr/libexec/java_home -v 17)"
export "JAVA_HOME=$(/usr/libexec/java_home -v 11)"

if [ -f ./.nvmrc ]; then
    nvm use
else
    # echo " ❌ nvmrc"
fi
