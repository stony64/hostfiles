###############################
#
# => Aliases
#
###############################

alias ip6='curl --connect-timeout 5 ifconfig.co'

alias tree='tree -F --dirsfirst'

# View dd progress.
alias dd='dd status=progress '

# Typo...
alias exi="exit"
alias exti="exit"

alias rm='rm -i'

alias reload='source ~/.bashrc'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors
    if [[ $? == 0 ]]; then
        eval "$(dircolors -b ~/.dircolors)";
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto'
    #alias l='ls -CF'
    #alias la='ls -A'
    #alias ls='ls --color=auto'
    #alias ll='ls -lha --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
