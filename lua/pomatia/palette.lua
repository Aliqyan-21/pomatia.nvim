local M = {}

M.colors = {
  -- backgrounds --
  bg         = "#333333",
  bg_dark    = "#282828",
  bg_dim     = "#3d3d3d",
  bg_hl      = "#666666",
  bg_popup   = "#4d4d4d",
  bg_alt     = "#4c4c4c",

  -- foregrounds --
  fg         = "#ffffff",
  fg_dim     = "#d3d3d3",
  fg_dark    = "#bebebe",
  fg_muted   = "#999999",

  -- core colors --
  cyan       = "#00ffff",
  green      = "#00ff00",
  yellow     = "#ffff60",  -- statement yellow (softer than pure #ffff00)
  gold       = "#ffff00",  -- raw yellow for line numbers, search
  magenta    = "#ff80ff",  -- preproc pink
  orange     = "#ffa500",  -- special
  red        = "#ff0000",
  blue       = "#80a0ff",  -- periwinkle comments
  pink       = "#ffa0a0",  -- constants/strings (salmon)
  teal       = "#00cdcd",

  -- UI --
  dark_red   = "#8b0000",  -- color column
  dark_blue  = "#00008b",
  dark_cyan  = "#008b8b",
  dark_green = "#2e8b57",
  crimson    = "#cd0000",

  -- git diff --
  diff_add   = "#5f875f",
  diff_chg   = "#5f87af",
  diff_del   = "#af5faf",
  diff_txt   = "#c6c6c6",

  -- diagnostic --
  error      = "#ff0000",
  warn       = "#ffff00",
  info       = "#80a0ff",
  hint       = "#00ffff",

  -- gitsigns plug --
  git_add    = "#00cd00",
  git_change = "#cdcd00",
  git_delete = "#cd0000",

  -- terminal --
  black      = "#000000",
  br_black   = "#7f7f7f",
  br_red     = "#ff0000",
  br_green   = "#00ff00",
  br_yellow  = "#ffff00",
  br_blue    = "#5c5cff",
  br_magenta = "#ff00ff",
  br_cyan    = "#00ffff",
  white      = "#e5e5e5",
  br_white   = "#ffffff",
  none       = "NONE",
}

return M
