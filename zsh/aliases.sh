# ls
alias ls='ls --color=auto'
alias tree='tree -C'
alias ll='ls -lah'
alias nn='~/Softwares/Neovim/Nightly/nvim-linux64/bin/nvim'

# git
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# dir stack
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# pnpm
alias pn='pnpm'
