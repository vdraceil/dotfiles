local wezterm = require 'wezterm'

return {
  -- debug overlay
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowDebugOverlay
  },
  -- close pane
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true }
  },
  -- split panes
  {
    key = '/',
    mods = 'CTRL',
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }  -- left & right panes
  },
  {
    key = '-',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }  -- top & bottom panes
  },
  -- select panes
  {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection "Left"
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection "Down"
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection "Up"
  },
  {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection "Right"
  },
  -- resize panes
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Left", 5 }
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Down", 5 }
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Up", 5 }
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Right", 5 }
  },
  -- quick select custom actions
  {
    key = 'o',
    mods = 'CTRL',
    action = wezterm.action.QuickSelectArgs {
      label = 'open url',
      patterns = {
        'https?://\\S+',
      },
      action = wezterm.action_callback(function(window, pane)
        local url = window:get_selection_text_for_pane(pane)
        wezterm.open_with(url)
      end),
    },
  },
}
