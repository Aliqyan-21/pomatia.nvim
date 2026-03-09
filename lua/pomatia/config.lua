local M = {}

M.defaults = {
  transparent           = false,
  terminal_colors       = true,
  italic_comments       = true,
  bold_keywords         = true,
  dim_inactive_wins     = false,
  underline_diagnostics = "straight",
  caching               = true,
  listchar_bg           = true,
  overrides             = {},
}

M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
end

function M.get()
  return M.options
end

return M
