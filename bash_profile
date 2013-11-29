#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# keychain stuff for ubuntu/arch
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

# set user bin path
export PATH=$PATH:~/bin

# set ruby path
export PATH=$PATH:~/.gem/ruby/2.0.0/bin