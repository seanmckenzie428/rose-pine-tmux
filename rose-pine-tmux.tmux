#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Defaults
 tmux set-option -gq @rose_pine_variant "auto"
 tmux set-option -gq @rose_pine_session_bg_dark "#31748f"
 tmux set-option -gq @rose_pine_session_fg_dark "#1f1d2e"
 tmux set-option -gq @rose_pine_active_window_bg_dark "#31748f"
 tmux set-option -gq @rose_pine_active_window_fg_dark "#1f1d2e"
 tmux set-option -gq @rose_pine_mode_bg_dark "#31748f"
 tmux set-option -gq @rose_pine_mode_fg_dark "#1f1d2e"
 tmux set-option -gq @rose_pine_status_fg_dark "#e0def4"
 tmux set-option -gq @rose_pine_inactive_fg_dark "#908caa"

 tmux set-option -gq @rose_pine_session_bg_light "#286983"
 tmux set-option -gq @rose_pine_session_fg_light "#fffaf3"
 tmux set-option -gq @rose_pine_active_window_bg_light "#286983"
 tmux set-option -gq @rose_pine_active_window_fg_light "#fffaf3"
 tmux set-option -gq @rose_pine_mode_bg_light "#286983"
 tmux set-option -gq @rose_pine_mode_fg_light "#fffaf3"
 tmux set-option -gq @rose_pine_status_fg_light "#575279"
 tmux set-option -gq @rose_pine_inactive_fg_light "#797593"

 # MunifTanjim/tmux-mode-indicator uses #{tmux_mode_indicator}
 tmux set-option -gq @rose_pine_mode_indicator_format "#{tmux_mode_indicator}"
 tmux set-option -gq @rose_pine_status_left_length "30"
 tmux set-option -gq @rose_pine_status_right_length "30"
 tmux set-option -gq @rose_pine_reset "false"

variant="$(tmux show-option -gqv @rose_pine_variant || true)"

if [ "$variant" = "auto" ]; then
  tmux set-hook -g client-dark-theme  "set-option -gq @rose_pine_current_variant dark \; run-shell '$CURRENT_DIR/scripts/apply-theme.sh'"
  tmux set-hook -g client-light-theme "set-option -gq @rose_pine_current_variant light \; run-shell '$CURRENT_DIR/scripts/apply-theme.sh'"
fi

"$CURRENT_DIR/scripts/apply-theme.sh"
