# rose-pine-minimal-tmux

A minimal tmux TPM plugin inspired by Rosé Pine.

It renders only:
- session name on the left
- window list in the center
- mode indicator on the right

The status bar itself uses a transparent background (`bg=default`), while the session name, active window, and mode indicator get a Pine-colored background.

## Install with TPM

```tmux
set -g @plugin 'yourname/rose-pine-minimal-tmux'

# Theme selection:
#   auto  -> follow tmux client light/dark hooks (tmux 3.6+)
#   dark  -> force dark
#   light -> force light
set -g @rose_pine_minimal_variant 'auto'

# Optional: override the mode indicator format if your plugin uses a different token
# set -g @rose_pine_minimal_mode_indicator_format '#{mode_indicator}'

run '~/.tmux/plugins/tpm/tpm'
```

## Options

### Main

```tmux
set -g @rose_pine_minimal_variant 'auto'
set -g @rose_pine_minimal_mode_indicator_format '#{mode_indicator}'
```

### Lengths

```tmux
set -g @rose_pine_minimal_status_left_length '50'
set -g @rose_pine_minimal_status_right_length '50'
```

### Dark colors

```tmux
set -g @rose_pine_minimal_status_fg_dark '#e0def4'
set -g @rose_pine_minimal_inactive_fg_dark '#908caa'
set -g @rose_pine_minimal_session_bg_dark '#31748f'
set -g @rose_pine_minimal_session_fg_dark '#1f1d2e'
set -g @rose_pine_minimal_active_window_bg_dark '#31748f'
set -g @rose_pine_minimal_active_window_fg_dark '#1f1d2e'
set -g @rose_pine_minimal_mode_bg_dark '#31748f'
set -g @rose_pine_minimal_mode_fg_dark '#1f1d2e'
```

### Light colors

```tmux
set -g @rose_pine_minimal_status_fg_light '#575279'
set -g @rose_pine_minimal_inactive_fg_light '#797593'
set -g @rose_pine_minimal_session_bg_light '#286983'
set -g @rose_pine_minimal_session_fg_light '#fffaf3'
set -g @rose_pine_minimal_active_window_bg_light '#286983'
set -g @rose_pine_minimal_active_window_fg_light '#fffaf3'
set -g @rose_pine_minimal_mode_bg_light '#286983'
set -g @rose_pine_minimal_mode_fg_light '#fffaf3'
```

## How auto theme switching works

When `@rose_pine_minimal_variant` is set to `auto`, the plugin installs two tmux hooks:

- `client-dark-theme`
- `client-light-theme`

Each hook updates an internal option and reruns the theme application script. This follows the same general pattern Catppuccin documents for tmux native theme switching.

If your tmux version or terminal does not report theme changes, set the variant to `dark` or `light` explicitly.

## Notes

- Auto switching requires tmux support for the theme-reporting hooks.
- The plugin defaults to `dark` until a light/dark hook fires.
- The mode indicator token defaults to `#{mode_indicator}`. If your mode indicator plugin uses another format variable, override `@rose_pine_minimal_mode_indicator_format`.
