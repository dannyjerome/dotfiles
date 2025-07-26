# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#eval "$(oh-my-posh init zsh)"

#Functions
# Function to reload .zshrc
reload_zshrc() {
    source ~/.zshrc
    echo "screen cleared!"
}

# Zsh widget to reload .zshrc
zle_reload_zshrc() {
    reload_zshrc
    zle reset-prompt  # This will reset the prompt after sourcing .zshrc
}

# Create a Zsh widget from the function
zle -N zle_reload_zshrc

#Alias
alias ls='ls --color=auto'
#alias ll='ls -l'
alias cl='clear'
alias lf='ls -alh'
alias tls='tmux ls'
# git aliases
alias lx="ls -lXht --color=auto"
alias pn="pnpm"
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gd="git diff"
alias gl="git log"
alias gp="git push"
alias gpl="git pull"
alias gst="git status"
alias gco="git checkout"
alias gcl="git clone"
alias gr="git remote"
alias gmv="git mv"
alias grb="git rebase"
alias gmg="git merge"
alias gsta="git stash"
alias gpop="git stash pop"

# Bind Alt + R to reload .zshrc
bindkey '\er' reload_zshrc
bindkey '^g' clear-screen
# Start tmux automatically if it's not already running
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach || tmux new
fi
# Initialize Starship prompt
eval "$(starship init zsh)"
#eval $(dircolors -b ~/.dircolors)
