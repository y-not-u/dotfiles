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
alias rm='rmtrash'

function l
    ls -lh $argv
end
