#!/usr/bin/env bash
set -euo pipefail

get_opt() {
  local key="$1"
  local default="${2-}"
  local value
  value="$(tmux show-option -gqv "$key" 2>/dev/null || true)"
  if [ -z "$value" ]; then
    printf '%s' "$default"
  else
    printf '%s' "$value"
  fi
}

variant="$(get_opt '@rose_pine_minimal_variant' 'auto')"
current_variant="$(get_opt '@rose_pine_minimal_current_variant' '')"

case "$variant" in
  dark|light)
    resolved="$variant"
    ;;
  auto)
    if [ -n "$current_variant" ]; then
      resolved="$current_variant"
    else
      # Fallback until tmux fires client-light-theme/client-dark-theme.
      resolved="dark"
    fi
    ;;
  *)
    resolved="dark"
    ;;
esac

status_fg="$(get_opt "@rose_pine_minimal_status_fg_${resolved}")"
inactive_fg="$(get_opt "@rose_pine_minimal_inactive_fg_${resolved}")"
session_bg="$(get_opt "@rose_pine_minimal_session_bg_${resolved}")"
session_fg="$(get_opt "@rose_pine_minimal_session_fg_${resolved}")"
active_bg="$(get_opt "@rose_pine_minimal_active_window_bg_${resolved}")"
active_fg="$(get_opt "@rose_pine_minimal_active_window_fg_${resolved}")"
mode_bg="$(get_opt "@rose_pine_minimal_mode_bg_${resolved}")"
mode_fg="$(get_opt "@rose_pine_minimal_mode_fg_${resolved}")"
mode_indicator_format="$(get_opt '@rose_pine_minimal_mode_indicator_format' '#{mode_indicator}')"
left_len="$(get_opt '@rose_pine_minimal_status_left_length' '50')"
right_len="$(get_opt '@rose_pine_minimal_status_right_length' '50')"

# Core layout
 tmux set-option -gq status on
 tmux set-option -gq status-justify centre
 tmux set-option -gq status-interval 5
 tmux set-option -gq window-status-separator ""
 tmux set-option -gq status-style "bg=default,fg=${status_fg}"
 tmux set-option -gq status-left-length "$left_len"
 tmux set-option -gq status-right-length "$right_len"
 tmux set-option -gq status-left "#[bg=${session_bg},fg=${session_fg},bold] #S #[default]"
 tmux set-option -gq status-right "#[bg=${mode_bg},fg=${mode_fg},bold] ${mode_indicator_format} #[default]"
 tmux set-option -gq window-status-format "#[bg=default,fg=${inactive_fg}] #W #[default]"
 tmux set-option -gq window-status-current-format "#[bg=${active_bg},fg=${active_fg},bold] #W #[default]"

# Plugin-specific mode indicator colors, if the user's chosen mode-indicator plugin supports them.
 tmux set-option -gq @mode_indicator_prefix_mode_style "bg=${mode_bg},fg=${mode_fg}"
 tmux set-option -gq @mode_indicator_copy_mode_style "bg=${mode_bg},fg=${mode_fg}"
 tmux set-option -gq @mode_indicator_sync_mode_style "bg=${mode_bg},fg=${mode_fg}"
