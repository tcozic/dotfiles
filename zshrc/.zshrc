ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
OHMYPOSH_BIN="${XDG_DATA_HOME:-${HOME}/.local/bin}/oh-my-posh"

export PATH=$PATH:/home/tcozic/.local/bin
source "${ZINIT_HOME}/zinit.zsh"
eval "$(oh-my-posh init zsh --config 'amro')"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias c='clear'

FZF_KEY_BINDINGS_PATH="/usr/share/doc/fzf/examples/key-bindings.zsh"
FZF_COMPLETION_PATH="/usr/share/doc/fzf/examples/completion.zsh"

echo "Loading FZF key bindings..."
if [ -f "$FZF_KEY_BINDINGS_PATH" ]; then
    # Use direct sourcing as a robust, non-version-dependent method
    source "$FZF_KEY_BINDINGS_PATH"
    echo "✅ FZF key-bindings loaded successfully from: $FZF_KEY_BINDINGS_PATH"
else
    echo "❌ FZF key-bindings file not found at $FZF_KEY_BINDINGS_PATH. Skipping."
fi


echo "Loading FZF completion logic..."
if [ -f "$FZF_COMPLETION_PATH" ]; then
    source "$FZF_COMPLETION_PATH"
    echo "✅ FZF completion loaded successfully from: $FZF_COMPLETION_PATH"
else
    echo "⚠️ Warning: FZF completion file not found at $FZF_COMPLETION_PATH. Skipping."
fi
eval "$(zoxide init --cmd cd zsh)"


