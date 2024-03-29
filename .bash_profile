source ~/.bashrc

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=1

export LC_ALL="en_AU.UTF-8"
export LANG="en_GB.UTF-8"

# Larger bash history (allow 2^17 entries; default is 500)
export HISTSIZE=131072;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export PROMPT_COMMAND='history -a';

# Highlight section titles in manual pages
# https://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X";
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
# * Case-insensitive globbing (used in pathname expansion)
for option in autocd globstar nocaseglob histappend cdspell; do
   shopt -s "$option" 2> /dev/null;
done;

# Bind history search to up and down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Case-insensitive tab completion
bind "set completion-ignore-case on"

# added by Anaconda2 5.1.0 installer
export PATH="/anaconda2/bin:$PATH"

# added by Anaconda3 5.1.0 installer
export PATH="/anaconda3/bin:$PATH"

# Print options if ambigious, prevents having to tab twice
bind "set show-all-if-ambiguous on"

export GOPATH=~/gocode
export PATH=$PATH:$GOPATH/bin

export BITCOIN_TEST_DIR="$HOME/lightning-test/.bitcoin"

alias regtestd="bitcoind -datadir=$BITCOIN_TEST_DIR -deprecatedrpc=generate"
alias regtest-cli="bitcoin-cli -datadir=$BITCOIN_TEST_DIR"

export LND1_DIR="$HOME/lightning-test/.lnd1"
export LND2_DIR="$HOME/lightning-test/.lnd2"

alias lnd1="lnd --lnddir=$LND1_DIR";
alias lncli1="lncli -n regtest --lnddir=$LND1_DIR"
alias lnd2="lnd --lnddir=$LND2_DIR";
alias lncli2="lncli -n regtest --lnddir=$LND2_DIR --rpcserver=localhost:11009"

export PATH="$HOME/.cargo/bin:$PATH"

export PS1="\[\033[1;31m\]\h\[\033[0;37m\]: \[\e[32;0;37m\]\W \[\e[0;31m\]\u\[\e[0;37m\]$\[\e[0m\] "

# opam configuration
test -r /Users/christophediederichs/.opam/opam-init/init.sh && . /Users/christophediederichs/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. /usr/local/etc/profile.d/z.sh
alias albums="echo >> $HOME/Documents/albums.txt"
alias python=python3
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
