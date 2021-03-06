[ -f $HOME/.zshrc.local.path ] && source $HOME/.zshrc.local.path

autoload -Uz vcs_info
autoload -Uz colors && colors # black red green yellow blue magenta cyan white

setopt prompt_subst # プロンプトの中で変数を参照する
zstyle ':vcs_info:git:*' check-for-changes true      #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' unstagedstr "%F{blue}[A]"   #add されていないファイルがある → %uに格納される
zstyle ':vcs_info:git:*' stagedstr "%F{red}[C]"      #commit されていないファイルがある → %cに格納される
zstyle ':vcs_info:*' formats "%F{green} (%b)%u%c%f"  #通常
zstyle ':vcs_info:*' actionformats ' (%b|%a)'        #rebase 途中,merge コンフリクト等 formats 外の表示

precmd() {vcs_info}
PROMPT='%{$fg[yellow]%}%(4~,%-1~/../%2~,%~)>%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} '

autoload -U compinit && compinit
setopt correct

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_reduce_blanks
setopt share_history
setopt nonomatch

export LSCOLORS=GxgxdxbxCxegedabagacad
export LS_COLORS='no=00:fi=00:di=01;36:ln=36:pi=31:so=33:bd=44;37:cd=44;37:ex=01;32:mi=00:or=36'

# alias
alias sz='source ~/.zshrc; echo reloaded .zshrc'
alias ls='ls -aG'
alias ll='ls -lG'

alias gs='git status --short --branch'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit -m'
alias gn='git checkout -b'
alias gb='git branch -a'
alias gck='git checkout'
alias gd='git diff'
alias ghead='git rev-parse --short HEAD'

[ ((${+commands[gh]})) ] && eval "$(gh completion -s zsh)"

function fzf-ghq-look() {
    local ghq_roots=$(ghq root --all)
    local ghq_root_str=(${ghq_roots/$'\n'/|})
    local selected_dir=$(ghq list --full-path | \
        xargs -I@ stat -f "%a %N" @/.git | sort -nr | awk '{print $2}' | \
        sed -E "s#($ghq_root_str)##g" | sed -e "s#/\.git##g" | sed -e "s#^\/##g" | \
        awk -F'[/]' '{print $2"/"$3}' | \
        fzf --prompt="choose repo > " --no-multi)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq list --full-path | grep --color=never -E $selected_dir\$)"
        zle accept-line
    fi
}
zle -N fzf-ghq-look
bindkey '^G' fzf-ghq-look

alias ta='task add'
alias tdn='task $(task +ACTIVE ids) done; task list'
alias tl='task list'
typeset -gU PATH

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
