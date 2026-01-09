autoload -Uz compinit; compinit

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

#prompt
eval "$(starship init zsh)"

#PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/local/bin:$PATH"
export PATH="/Applications/WezTerm.app/Contents/MacOS:$PATH"

#alias
alias ls="gls --color=auto"
alias la="ls -a"
alias ll="ls -lahS"
alias mvim="nvim -u none"
alias kali="docker start -ai kali"

gac() {
  git add -A
  # "$*" と書くと、後ろに打った文字を全部繋げて一つのメッセージにする
  git commit -m "$*"
}

#directory stack
#setopt AUTO_PUSHD           # Push the current directory visited on the stack.
#setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
#setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
#alias d='dirs -v'
#for index ({1..9}) alias "$index"="cd +${index}"; unset index

#vi mode
bindkey -v

#plugins
eval "$(sheldon source)"
zstyle ':completion:*' tag-order '! commands' -

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
#source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

# vim mode config
# Remove mode switching delay.
KEYTIMEOUT=5
# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
	    [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
echo -ne '\e[6 q'
    fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[6 q'

# Use beam shape cursor for each new prompt.
preexec() {
    echo -ne '\e[6 q'
}

#history
setopt HIST_IGNORE_DUPS        # 直前と同じコマンドは保存しない
setopt HIST_IGNORE_ALL_DUPS    # 過去の重複をすべて削除（上書き）
setopt HIST_SAVE_NO_DUPS       # 保存時に重複を削除
setopt HIST_REDUCE_BLANKS      # 余計な空白を削除
setopt HIST_IGNORE_SPACE       # 先頭にスペースをつけたコマンドは保存しない
setopt HIST_NO_STORE           # history コマンドを履歴に入れない
