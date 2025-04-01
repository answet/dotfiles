set -g fish_autosuggestion_enabled 0

alias cls="clear"
alias ya="yazi"
alias ls="exa"
alias la="exa --all --sort name"
alias ll="exa -la"
alias lt="exa --tree --level=2 --icons"
alias U="sudo apt update && sudo apt upgrade"
alias ff="clear && fastfetch"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

fish_add_path /home/answet/.spicetify
