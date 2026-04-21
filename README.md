# rose-pine-tmux

A minimal tmux TPM plugin inspired by Rosé Pine.

It renders only:
- session name on the left
- window list in the center
- mode indicator on the right

The status bar itself uses a transparent background (`bg=default`), while the session name, active window, and mode indicator get a Pine-colored background.

## Install with TPM

```tmux
set -g @plugin 'MunifTanjim/tmux-mode-indicator'
set -g @plugin 'yourname/rose-pine-tmux'

# Theme selection:
#   auto  -> follow tmux client light/dark hooks (tmux 3.6+)
#   dark  -> force dark
#   light -> force light
set -g @rose_pine_variant 'auto'

run '~/.tmux/plugins/tpm/tpm'
```

## Important

This plugin assumes you are using `MunifTanjim/tmux-mode-indicator`, which exposes `#{tmux_mode_indicator}`.

## Options

```tmux
set -g @rose_pine_variant 'auto'
set -g @rose_pine_reset 'false'
set -g @rose_pine_mode_indicator_format '#{tmux_mode_indicator}'
set -g @rose_pine_status_left_length '30'
set -g @rose_pine_status_right_length '30'
```

### Auto switching

Like Catppuccin, this plugin can use tmux's `client-dark-theme` and `client-light-theme` hooks. In `auto` mode, the plugin installs those hooks, updates the current variant, and reapplies the theme.

If you switch themes manually and want a clean reapply, you can do:

```tmux
set -g @rose_pine_reset 'true'
run '~/.tmux/plugins/rose-pine-tmux/rose-pine-tmux.tmux'
```
