# Different ls flavors
alias l="ls"
alias ll="ls -al" # List all files in current directory in long list format
alias ldir="ls -al | grep ^d" # List all directories in current directory in long list format

alias o="open ." # Open the current directory in Finder

alias rb="source ~/.aliases/.profile" # Reload aliases
alias bp="vim ~/.aliases/" # Edit aliases

alias cpsshkey="cat ~/.ssh/id_rsa.pub | pbcopy" # copy public key to clipboard

alias local_ip="ifconfig | grep inet"
alias public_ip="curl -s http://whatismyip.akamai.com/"
