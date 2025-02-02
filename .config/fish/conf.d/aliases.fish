alias v='NVIM_APPNAME=nvim-lazyvim nvim'
alias nv='neovide --fork'
alias ls='eza --header --color=always --long --no-time --icons=always --group-directories-first'
alias cp='xcp'
alias cd='z'
alias pn="pnpm"
alias pnpx="pnpm dlx"
alias ze="zellij"
alias lg='lazygit'
alias mf='musicfox'
alias c="clear"

function l
    ls -lh $argv
end
