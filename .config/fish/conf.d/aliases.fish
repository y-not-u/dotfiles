#!/bin/bash
alias v='nvim'
alias nv='neovide --fork'
alias ls='eza --header --color=always --long --no-time --icons=always --group-directories-first'
alias cp='xcp'
alias cd='z'
alias pn="pnpm"
alias pnpx="pnpm dlx"
alias s="proxychains4"
alias ra="ranger"
alias jo="joshuto"
alias ze="zellij"
alias lg='lazygit'
alias ld='DOCKER_HOST=unix:///run/user/1000/podman/podman.sock lazydocker'
alias mf='musicfox'
alias zh="trans :zh-cn"
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# Alias for unsetting proxy variables
alias unproxy 'set -e http_proxy; set -e https_proxy; set -e all_proxy'

# Function to set proxy variables
function proxy
    set -x http_proxy http://127.0.0.1:7890
    set -x https_proxy http://127.0.0.1:7890
    set -x no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
    set -x all_proxy socks5://127.0.0.1:7890
    echo -e "🚀 已开启代理" (curl -s myip.ipip.net)
end

# Function to transfer files
function transfer
    curl --progress-bar --upload-file $argv[1] "https://transfer.sh/(basename $argv[1])" | tee /dev/null
    echo
end

# Alias for the transfer function
alias transfer transfer
