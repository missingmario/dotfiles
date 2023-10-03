autoload -U colors && colors
autoload -Uz vcs_info

setopt PROMPT_SUBST

export COLORTERM=1
export CLICOLOR=1

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{yellow}[%r -> %b]%f '

precmd() {
    vcs_info
}

PROMPT='%F{blue}(%~)%f ${vcs_info_msg_0_}%# '

source $ZDOTDIR/aliases.zsh
