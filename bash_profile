#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# keychain stuff for ubuntu/arch
[[ -f keychain ]] && eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
