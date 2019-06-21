[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz vcs_info
autoload -Uz colors && colors # black red green yellow blue magenta cyan white

setopt prompt_subst # プロンプトの中で変数を参照する
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' unstagedstr "%F{blue}[A]" #add されていないファイルがある → %uに格納される
zstyle ':vcs_info:git:*' stagedstr "%F{red}[C]" #commit されていないファイルがある → %cに格納される
zstyle ':vcs_info:*' formats "%F{green} (%b)%u%c%f" #通常
zstyle ':vcs_info:*' actionformats ' (%b|%a)' #rebase 途中,merge コンフリクト等 formats 外の表示

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


# alias
alias ls='ls -aG'
alias ll='ls -lG'

alias gs='git status'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit -m'
alias gn='git checkout -b'
alias gb='git branch -a'
alias gck='git checkout'
alias gd='git diff'
