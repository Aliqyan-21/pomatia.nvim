local M = {}

function M.get(c, opts)
  local bg_normal = opts.transparent and c.none or c.bg
  local diag_line = opts.underline_diagnostics == "curl" and "undercurl" or "underline"

  return {
    Normal                   = { fg = c.fg, bg = bg_normal },
    NormalFloat              = { fg = c.fg, bg = opts.transparent and c.none or c.bg_popup },
    NormalNC                 = { fg = opts.dim_inactive_wins and c.fg_dark or c.fg, bg = bg_normal },

    ColorColumn              = { bg = c.dark_red },
    Conceal                  = { fg = c.bg_hl },
    CursorLine               = { bg = c.bg_hl },
    CursorColumn             = { link = "CursorLine" },
    CursorLineNr             = { fg = c.gold, bg = c.bg_hl },
    CursorLineFold           = { link = "CursorLine" },
    CursorLineSign           = { link = "CursorLine" },

    LineNr                   = { fg = c.gold },
    LineNrAbove              = { link = "LineNr" },
    LineNrBelow              = { link = "LineNr" },
    SignColumn               = { fg = c.dark_cyan },
    FoldColumn               = { fg = "#add8e6" },
    Folded                   = { fg = c.dark_blue, bg = c.diff_txt, bold = true },

    StatusLine               = { fg = c.bg, bg = c.fg, bold = true },
    StatusLineNC             = { fg = c.bg, bg = c.fg_dim },
    StatusLineTerm           = { link = "StatusLine" },
    StatusLineTermNC         = { link = "StatusLineNC" },

    TabLine                  = { fg = c.bg, bg = c.fg_dim },
    TabLineFill              = { link = "TabLine" },
    TabLineSel               = { fg = c.bg, bg = c.fg, bold = true },

    WinSeparator             = { link = "StatusLineNC" },
    VertSplit                = { link = "StatusLineNC" },

    Pmenu                    = { fg = c.fg, bg = c.bg_popup },
    PmenuSel                 = { fg = c.black, bg = c.fg_dark },
    PmenuMatch               = { fg = c.magenta, bg = c.bg_popup },
    PmenuMatchSel            = { fg = c.dark_mag, bg = c.fg_dark },
    PmenuSbar                = { bg = c.bg_popup },
    PmenuThumb               = { bg = c.fg },

    Search                   = { fg = c.black, bg = c.gold },
    IncSearch                = { fg = c.green, reverse = true },
    CurSearch                = { link = "Search" },
    Substitute               = { fg = c.black, bg = c.orange },

    Visual                   = { fg = c.fg, bg = c.fg_muted },
    VisualNOS                = { bold = true, underline = true },

    MatchParen               = { bg = c.dark_cyan },
    WildMenu                 = { fg = c.black, bg = c.gold, bold = true },
    QuickFixLine             = { fg = c.fg, bg = c.dark_mag },

    EndOfBuffer              = { fg = c.eob, bg = opts.transparent and c.none or c.bg_popup },
    NonText                  = { fg = c.eob, bg = opts.transparent and c.none or c.bg_popup },
    SpecialKey               = { fg = c.cyan },
    Whitespace               = { fg = c.fg_dark, bg = opts.listchar_bg and c.bg_hl or c.none },

    DiagnosticError          = { fg = c.error },
    DiagnosticWarn           = { fg = c.warn },
    DiagnosticInfo           = { fg = c.info },
    DiagnosticHint           = { fg = c.hint },
    DiagnosticUnnecessary    = { fg = c.fg_muted },
    DiagnosticUnderlineError = { [diag_line] = true, sp = c.error },
    DiagnosticUnderlineWarn  = { [diag_line] = true, sp = c.warn },
    DiagnosticUnderlineInfo  = { [diag_line] = true, sp = c.info },
    DiagnosticUnderlineHint  = { [diag_line] = true, sp = c.hint },

    SpellBad                 = { fg = c.red, undercurl = true, sp = c.red },
    SpellCap                 = { fg = c.green, undercurl = true, sp = c.green },
    SpellLocal               = { fg = c.cyan, undercurl = true, sp = c.cyan },
    SpellRare                = { fg = c.magenta, undercurl = true, sp = c.magenta },

    DiffAdd                  = { fg = c.fg, bg = c.diff_add },
    DiffChange               = { fg = c.fg, bg = c.diff_chg },
    DiffDelete               = { fg = c.fg, bg = c.diff_del },
    DiffText                 = { fg = c.black, bg = c.diff_txt },
    Added                    = { link = "String" },
    Removed                  = { link = "WarningMsg" },
    Changed                  = { link = "DiffChange" },

    Comment                  = { fg = c.blue, italic = opts.italic_comments },
    Constant                 = { fg = c.pink },
    String                   = { link = "Constant" },
    Character                = { link = "Constant" },
    Number                   = { link = "Constant" },
    Boolean                  = { link = "Constant" },
    Float                    = { link = "Constant" },

    Identifier               = { fg = c.cyan },
    Function                 = { link = "Identifier" },

    Statement                = { fg = c.yellow, bold = opts.bold_keywords },
    Conditional              = { link = "Statement" },
    Repeat                   = { link = "Statement" },
    Label                    = { link = "Statement" },
    Operator                 = { link = "Statement" },
    Keyword                  = { link = "Statement" },
    Exception                = { link = "Statement" },

    PreProc                  = { fg = c.magenta },
    Include                  = { link = "PreProc" },
    Define                   = { link = "PreProc" },
    Macro                    = { link = "PreProc" },
    PreCondit                = { link = "PreProc" },

    Type                     = { fg = c.green, bold = opts.bold_keywords },
    StorageClass             = { link = "Type" },
    Structure                = { link = "Type" },
    Typedef                  = { link = "Type" },

    Special                  = { fg = c.orange },
    SpecialChar              = { link = "Special" },
    Tag                      = { link = "Special" },
    Delimiter                = { link = "Special" },
    SpecialComment           = { link = "Special" },
    Debug                    = { link = "Special" },

    Underlined               = { fg = c.blue, underline = true },
    Ignore                   = { fg = c.bg },
    Error                    = { fg = c.red, bg = c.fg, reverse = true },
    Todo                     = { fg = c.gold, bg = c.blue, reverse = true },

    ErrorMsg                 = { fg = c.fg, bg = c.red },
    WarningMsg               = { fg = c.red },
    ModeMsg                  = { bold = true },
    MoreMsg                  = { fg = c.dark_green },
    Question                 = { fg = c.green },
    Title                    = { fg = c.magenta },
    Directory                = { fg = c.cyan },

    Cursor                   = { fg = c.black, bg = c.green },
    CursorIM                 = { link = "Cursor" },
    lCursor                  = { link = "Cursor" },

    debugBreakpoint          = { fg = c.dark_blue, bg = c.red },
    debugPC                  = { fg = c.dark_blue, bg = c.blue },
  }
end

return M
