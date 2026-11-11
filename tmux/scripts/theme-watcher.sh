#!/bin/zsh
# Fired by the local.tmux-theme-watcher LaunchAgent whenever macOS
# rewrites .GlobalPreferences.plist (WatchPaths). That file gets
# touched on a light/dark switch, but also occasionally for unrelated
# reasons, so we debounce by comparing against the last mode applied.

STATE_FILE="$HOME/.cache/tmux-theme-mode"
TMUX_DIR="$HOME/.dotfiles/tmux"

mkdir -p "$(dirname "$STATE_FILE")"

if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -qi dark; then
  MODE="mocha"
else
  MODE="latte"
fi

LAST_MODE="$(cat "$STATE_FILE" 2>/dev/null || echo "")"
if [[ "$MODE" == "$LAST_MODE" ]]; then
  exit 0
fi
echo "$MODE" > "$STATE_FILE"

# Push the change into the running tmux server (default socket).
if tmux list-sessions >/dev/null 2>&1; then
  tmux source-file "$TMUX_DIR/theme-$MODE.conf"
  tmux run-shell "~/.tmux/plugins/tmux/catppuccin.tmux"
  tmux refresh-client -S
fi
