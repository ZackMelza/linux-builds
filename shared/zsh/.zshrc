# Omarchy environment (adds ~/.local/bin to PATH when present).
[[ -r "$HOME/.local/share/../bin/env" ]] && . "$HOME/.local/share/../bin/env"

# History: keep it across sessions and avoid repeated entries.
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Friendly command-line behavior.
# Show completion candidates in a selectable menu when Tab is pressed.
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-prompt '%S%M matches%s'
zstyle ':completion:*' select-prompt '%S%p%s'
autoload -Uz compinit && compinit
bindkey -e
setopt AUTO_CD

# Modern tools, enabled only when installed.
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if [[ -r /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi
if [[ -r /usr/share/fzf/completion.zsh ]]; then
  source /usr/share/fzf/completion.zsh
fi

# Suggest previous and valid directory paths while typing commands such as cd.
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# Keep Tab on zsh's completion menu; fzf remains available through its other
# key bindings and can still be invoked explicitly when needed.
bindkey '^I' complete-word
bindkey -M emacs '^I' complete-word
bindkey -M viins '^I' complete-word

# Convenient aliases (the original commands remain available).
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --group-directories-first'
  alias ll='eza -la --group-directories-first'
  alias la='eza -a --group-directories-first'
fi
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi
alias ..='cd ..'
alias ...='cd ../..'

# Show a compact system summary in interactive terminals.
if [[ -o interactive ]] && command -v fastfetch >/dev/null 2>&1; then
  fastfetch
fi
