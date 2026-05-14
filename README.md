# tmux-config

A simple tmux configuration inspired by [samoshkin/tmux-config](https://github.com/samoshkin/tmux-config) and [tony/tmux-config](https://github.com/tony/tmux-config).

---

## Neovim Integration

Navigation between tmux panes and Neovim splits is handled by [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator). The tmux side is already configured. You just need to add the corresponding plugin to your Neovim config.

**lazy.nvim example:**

```lua
return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
    },
    keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
}
```

### Also recommended: vim-tpipeline

[vimpostor/vim-tpipeline](https://github.com/vimpostor/vim-tpipeline) moves your Neovim statusline into the tmux status bar, giving you a unified status line across panes. Worth adding if you want a cleaner look.

---

## Pywal Integration

The color theme is sourced from [pywal](https://github.com/dylanaraps/pywal) if a generated theme is found at `~/.cache/wal/pywal.tmux`. If not, it falls back to default colors so everything works fine without pywal.

### Setup

To use pywal colors, place the following template at `~/.config/wal/templates/pywal.tmux`:

```tmux
# Pywal tmux template

## Base status bar styling (transparent background, default foreground)
set -g status-style bg=default,fg="{foreground}"

## -------------------------------------------------------------------
## Window Status
## -------------------------------------------------------------------
setw -g window-status-format '#[fg={color8},bg=default] #I #W #[default]'
setw -g window-status-current-format '#[fg={color4},bg=default,bold] #I #W #[default]'
setw -g window-status-activity-style fg="{color4}",bg=default,none

## -------------------------------------------------------------------
## Panes
## -------------------------------------------------------------------
set -g pane-border-style bg=default,fg="{color8}"
set -g pane-active-border-style bg=default,fg="{color7}"

## -------------------------------------------------------------------
## Clock & Messages
## -------------------------------------------------------------------
set -g clock-mode-colour "{color4}"
set -g clock-mode-style 24

set -g message-style bg="{color5}",fg="{color15}",bold
set -g message-command-style bg="{color5}",fg="{color15}",bold

# Copy mode highlight
set -g mode-style bg="{color4}",fg="{color0}"

## -------------------------------------------------------------------
## Status Right
## -------------------------------------------------------------------
set -g status-right-length 100
set -g status-right '#[fg={color4},bg=default] %H:%M #[fg={color8}]| #[fg={color7}]%y.%m.%d '
```

Feel free to adjust any of the colors or format strings to your liking.

### Applying the theme

After running `wal`, apply the generated tmux theme with:

```sh
tmux source-file ~/.cache/wal/pywal.tmux
```

You can automate this by hooking it into your pywal command

> For more on pywal, see the [pywal repo](https://github.com/dylanaraps/pywal) or [pywal16](https://github.com/eylles/pywal16) for an actively maintained fork with 16-color support.
