local M = {}

local palettes = {
  default = {
    -- backgrounds --
    bg         = "#2b2b2b",
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
    yellow     = "#ffff60", -- statement yellow (softer than pure #ffff00)
    gold       = "#ffff00", -- raw yellow for line numbers, search
    magenta    = "#ff80ff", -- preproc pink
    orange     = "#ffa500", -- special
    red        = "#ff0000",
    blue       = "#80a0ff", -- periwinkle comments
    pink       = "#ffa0a0", -- constants/strings (salmon)
    teal       = "#00cdcd",

    -- UI --
    dark_red   = "#8b0000", -- color column
    dark_blue  = "#00008b",
    dark_cyan  = "#008b8b",
    dark_green = "#2e8b57",
    crimson    = "#cd0000",
    dark_mag   = "#8b008b",

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
  },
  -- a softer variant to pomatia variant="default"
  soft = {
    -- backgrounds --
    bg         = "#2d2a2e",
    bg_dark    = "#27252a",
    bg_dim     = "#3a3740",
    bg_hl      = "#5a5660",
    bg_popup   = "#423f4a",
    bg_alt     = "#3f3c47",

    -- foregrounds --
    fg         = "#f8f8f2",
    fg_dim     = "#cfcfcf",
    fg_dark    = "#b0b0b0",
    fg_muted   = "#8a8a8a",

    -- core colors --
    cyan       = "#66d9ef",
    green      = "#a9dc76",
    yellow     = "#e5c07b",
    gold       = "#d4b44a",
    magenta    = "#c678dd",
    orange     = "#fc9867",
    red        = "#ff6188",
    blue       = "#82aaff",
    pink       = "#e6a0b0",
    teal       = "#5eccd8",

    -- UI --
    dark_red   = "#7a3040",
    dark_blue  = "#1a3a6b",
    dark_cyan  = "#1a5f6b",
    dark_green = "#2a6b42",
    crimson    = "#b02040",
    dark_mag   = "#6b2080",

    -- git diff --
    diff_add   = "#3a5f3a",
    diff_chg   = "#3a5070",
    diff_del   = "#6b3a6b",
    diff_txt   = "#b8b8b8",

    -- diagnostic --
    error      = "#ff6188",
    warn       = "#e5c07b",
    info       = "#82aaff",
    hint       = "#66d9ef",

    -- gitsigns plug --
    git_add    = "#a9dc76",
    git_change = "#e5c07b",
    git_delete = "#ff6188",

    -- terminal --
    black      = "#000000",
    br_black   = "#7f7f7f",
    br_red     = "#ff6188",
    br_green   = "#a9dc76",
    br_yellow  = "#e5c07b",
    br_blue    = "#5c5cff",
    br_magenta = "#c678dd",
    br_cyan    = "#66d9ef",
    white      = "#e5e5e5",
    br_white   = "#ffffff",
    none       = "NONE",
  },
  -- inspired by vim-orbital
  noble = {
    -- backgrounds --
    bg         = "#0e1628",
    bg_dark    = "#0a1020",
    bg_dim     = "#1a2540",
    bg_hl      = "#2a3a5a",
    bg_popup   = "#162035",
    bg_alt     = "#1e2d4a",

    -- foregrounds --
    fg         = "#ffd7af",
    fg_dim     = "#d7af87",
    fg_dark    = "#af875f",
    fg_muted   = "#7a6a50",

    -- core colors --
    cyan       = "#5fafff",
    green      = "#87afd7",
    yellow     = "#d4a847",
    gold       = "#c9922a",
    magenta    = "#87afd7",
    orange     = "#d7af87",
    red        = "#d75f5f",
    blue       = "#5f87af",
    pink       = "#ffd7af",
    teal       = "#5f87d7",

    -- UI --
    dark_red   = "#5f0000",
    dark_blue  = "#00005f",
    dark_cyan  = "#005f87",
    dark_green = "#005f5f",
    crimson    = "#af0000",
    dark_mag   = "#5f005f",

    -- git diff --
    diff_add   = "#1a3a2a",
    diff_chg   = "#1a2a4a",
    diff_del   = "#3a1a1a",
    diff_txt   = "#d7af87",

    -- diagnostic --
    error      = "#d75f5f",
    warn       = "#d4a847",
    info       = "#5f87af",
    hint       = "#5fafff",

    -- gitsigns plug --
    git_add    = "#5faf87",
    git_change = "#d4a847",
    git_delete = "#d75f5f",

    -- terminal --
    black      = "#000000",
    br_black   = "#7f7f7f",
    br_red     = "#d75f5f",
    br_green   = "#87afd7",
    br_yellow  = "#d4a847",
    br_blue    = "#0087d7",
    br_magenta = "#5f87d7",
    br_cyan    = "#5fafff",
    white      = "#ffd7af",
    br_white   = "#e4e4e4",
    none       = "NONE",
  },
}

function M.get(variant)
  local base = palettes.default
  local override = palettes[variant]
  if not override or override == base then
    return base
  end
  return vim.tbl_extend("force", base, override)
end

return M
