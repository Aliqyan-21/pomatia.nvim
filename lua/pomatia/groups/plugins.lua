local M = {}

function M.get(c, opts)
  local bg = opts.transparent and c.none or c.bg_popup

  return {
    -- telescope.nvim --
    TelescopeNormal         = { fg = c.fg, bg = bg },
    TelescopeBorder         = { fg = c.dark_cyan, bg = bg },
    TelescopeTitle          = { fg = c.magenta, bold = true },

    TelescopePromptNormal   = { fg = c.fg, bg = opts.transparent and c.none or c.bg_hl },
    TelescopePromptBorder   = { fg = c.gold, bg = opts.transparent and c.none or c.bg_hl },
    TelescopePromptTitle    = { fg = c.black, bg = c.gold, bold = true },
    TelescopePromptPrefix   = { fg = c.gold },
    TelescopePromptCounter  = { fg = c.fg_muted },

    TelescopeResultsNormal  = { fg = c.fg, bg = bg },
    TelescopeResultsBorder  = { fg = c.dark_cyan, bg = bg },
    TelescopeResultsTitle   = { fg = c.black, bg = c.dark_cyan, bold = true },

    TelescopePreviewNormal  = { fg = c.fg, bg = opts.transparent and c.none or c.bg_dark },
    TelescopePreviewBorder  = { fg = c.blue, bg = opts.transparent and c.none or c.bg_dark },
    TelescopePreviewTitle   = { fg = c.black, bg = c.blue, bold = true },

    TelescopeSelection      = { fg = c.fg, bg = c.bg_hl, bold = true },
    TelescopeSelectionCaret = { fg = c.gold },
    TelescopeMultiSelection = { fg = c.yellow },
    TelescopeMultiIcon      = { fg = c.orange },
    TelescopeMatching       = { fg = c.orange, bold = true },

    -- fzf-lua / snacks.picker compat aliases
    FzfLuaNormal            = { link = "TelescopeNormal" },
    FzfLuaBorder            = { link = "TelescopeBorder" },
    FzfLuaTitle             = { link = "TelescopeTitle" },

    -- gitsigns.nvim --
    GitSignsAdd             = { fg = c.git_add },
    GitSignsChange          = { fg = c.git_change },
    GitSignsDelete          = { fg = c.git_delete },
    GitSignsTopDelete       = { fg = c.git_delete },
    GitSignsChangeDelete    = { fg = c.git_change },
    GitSignsUntracked       = { fg = c.fg_muted },
    GitSignsAddNr           = { link = "GitSignsAdd" },
    GitSignsChangeNr        = { link = "GitSignsChange" },
    GitSignsDeleteNr        = { link = "GitSignsDelete" },
    GitSignsAddLn           = { bg = c.diff_add },
    GitSignsChangeLn        = { bg = c.diff_chg },
    GitSignsDeleteLn        = { bg = c.diff_del },

    -- nvim-cmp ─-
    CmpItemAbbr             = { fg = c.fg },
    CmpItemAbbrDeprecated   = { fg = c.fg_muted, strikethrough = true },
    CmpItemAbbrMatch        = { fg = c.orange, bold = true },
    CmpItemAbbrMatchFuzzy   = { fg = c.orange },
    CmpItemKind             = { fg = c.cyan },
    CmpItemMenu             = { fg = c.fg_muted },
    CmpDocumentation        = { fg = c.fg, bg = opts.transparent and c.none or c.bg_popup },
    CmpDocumentationBorder  = { fg = c.dark_cyan, bg = opts.transparent and c.none or c.bg_popup },

    IblIndent               = { fg = "#444444" },
    IblScope                = { fg = "#666666" },
  }
end

return M
