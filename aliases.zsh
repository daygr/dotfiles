alias a-v-e='ansible-vault edit --vault-password-file=~/.ansible/.vault_pass.txt'
alias ranger='ranger --choosedir=$HOME/.rangerdir;cd $(cat $HOME/.rangerdir)'
alias fixcompletion='rm -f ~/.zcompdump*; rm -f ~/.antigen/.zcompdump*; exec zsh -l'
alias actaws='source ~/venv2/awscli/bin/activate'
# kitty injects terminfo into ssh for color support etc
alias ssh="kitty +kitten ssh"
