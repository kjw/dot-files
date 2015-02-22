#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# keychain stuff for ubuntu/arch
#eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)

# set ruby path
export PATH=$PATH:~/.gem/ruby/2.2.0/bin

# look and feel
export L_DMENU_FONT="ClearSans-20"
export L_DMENU_NB="#002b36"
export L_DMENU_NF="#93a1a1"
export L_DMENU_SB="#073642"
export L_DEMNU_SF="#cb4b16"
export L_DMENU_TOP="dmenu -b -i -l 8 -fn $L_DMENU_FONT -nb $L_DMENU_NB -nf $L_DMENU_NF -sb $L_DMENU_SB -sf $L_DEMNU_SF"
export L_DMENU_BOTTOM="dmenu -b -fn $L_DMENU_FONT -nb $L_DMENU_NB -nf $L_DMENU_NF -sb $L_DMENU_SB -sf $L_DEMNU_SF"
export L_DZEN_FONT="Inconsolata-40"
export L_DZEN_BG="#4E5157"
export L_DZEN_FG="#F5F5F5"
