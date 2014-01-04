#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# keychain stuff for ubuntu/arch
eval $(keychain --eval --agents ssh -Q --quiet)

# set ruby path
export PATH=$PATH:~/.gem/ruby/2.0.0/bin