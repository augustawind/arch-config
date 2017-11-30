#
# ~/.bashrc
#

# check for an interactive session
[ -z "$PS1" ] && return

# environment variables ------------------------------------------------------

export PATH=$PATH:$HOME/bin                 # local bin directory
export PATH="$HOME/.npm-global/bin:$PATH"   # npm global directory
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH" # ruby gem directory
export LANG="en_US.UTF-8"
export EDITOR="/usr/bin/vim"
export SUDO_EDITOR="vim"

if [ "$TERM" != "screen" ] && [ "$TERM" != "screen-256color" ] ; then
    export TERM="rxvt-unicode"
fi

# imports --------------------------------------------------------------------

source /usr/bin/virtualenvwrapper.sh
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

eval $(keychain --eval --quiet id_rsa)

# aliases --------------------------------------------------------------------

# utilities
alias "local-npm"="local-npm -d $HOME/.local-npm"
alias "tmux"="tmux -2"
alias "git"="hub"
alias "ischeme"="rlwrap -r -c -f $HOME/scripts/scheme-completion.txt scheme"

# convenience
alias ..='cd ..'
alias ...='cd ...'
alias ll='ls -laF'
alias la='ls -a'
alias df='df -h'
alias du='du -c -h'
alias mkdr='mkdir -p -v'
alias unboot='shutdown -h now'
alias untmux='tmux kill-session'
alias vim='nvim'

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
                                                            
# priveleged access
if [ $VID 0 ]; then
    alias spacman='sudo pacman --color auto'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias shutdown='sudo shutdown'
fi 

# git
alias gs='git status'
alias gl='git log --decorate --graph'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -am'
alias gp='git push'
alias gitflow='git commit -a && git push'
alias gb='git branch'
alias gch='git checkout'

# colored output -------------------------------------------------------------

alias ghcic='ghci 2>&1 | HsColour -tty'
alias pacman='pacman --color auto'
alias diff='colordiff'
export GREP_COLOR="1;33"
alias grep='grep --color=auto'
export LESS="-R"
alias ls='ls -hF --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
eval $(dircolors -b)

# colored man pages
man() {
    env \
            LESS_TERMCAP_mb=$(printf "\e[1;37m") \
            LESS_TERMCAP_md=$(printf "\e[1;37m") \
            LESS_TERMCAP_me=$(printf "\e[0m") \
            LESS_TERMCAP_se=$(printf "\e[0m") \
            LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
            LESS_TERMCAP_ue=$(printf "\e[0m") \
            LESS_TERMCAP_us=$(printf "\e[0;36m") \
                    man "$@"
}

# tab completion -------------------------------------------------------------

complete -cf sudo
complete -cf man
complete -cf start
complete -cf stop
complete -cf restart
complete -cf reload
complete -cf spawn

# bash history ---------------------------------------------------------------

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

# set prompt -----------------------------------------------------------------

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# miscellanious --------------------------------------------------------------

# Enable '**' glob pattern matching
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
