# some more ls aliases

if command -v lsd &> /dev/null
then
    alias ls='lsd -lah'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls -lah'

alias rimraf='rm -rf'

alias serve='python3 -m http.server'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -x /usr/bin/dircolors ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Pipe to and from Clipboard like a Mac. Neat!
if ! command -v pbpaste &> /dev/null
then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi


# Refresh changes to the dotfiles.
alias refresh='source ~/.bashrc'


if ! command -v hub &> /dev/null
then
     alias git='hub'
fi

if ! command -v nvim &> /dev/null
then
    alias vim='nvim'
fi

