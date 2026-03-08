local M = {}

local config   = require("pomatia.config")
local palette  = require("pomatia.palette")

local groups = {
  require("pomatia.groups.base"),
  require("pomatia.groups.treesitter"),
  require("pomatia.groups.plugins"),
}

local function apply_highlights(specs)
  for group, spec in pairs(specs) do
    if spec.link then
      vim.api.nvim_set_hl(0, group, { link = spec.link })
    else
      vim.api.nvim_set_hl(0, group, spec)
    end
  end
end

local function set_terminal_colors(c)
  vim.g.terminal_color_0  = c.black
  vim.g.terminal_color_1  = c.crimson
  vim.g.terminal_color_2  = "#00cd00"
  vim.g.terminal_color_3  = "#cdcd00"
  vim.g.terminal_color_4  = "#0087ff"
  vim.g.terminal_color_5  = "#cd00cd"
  vim.g.terminal_color_6  = c.teal
  vim.g.terminal_color_7  = c.white
  vim.g.terminal_color_8  = c.br_black
  vim.g.terminal_color_9  = c.br_red
  vim.g.terminal_color_10 = c.br_green
  vim.g.terminal_color_11 = c.br_yellow
  vim.g.terminal_color_12 = c.br_blue
  vim.g.terminal_color_13 = c.br_magenta
  vim.g.terminal_color_14 = c.br_cyan
  vim.g.terminal_color_15 = c.br_white
end

function M.setup(opts)
  config.setup(opts)
end

function M.load()
  local opts = config.get()
  if vim.tbl_isempty(opts) then
    opts = config.defaults
  end

  local c = palette.colors

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.opt.background = "dark"
  vim.g.colors_name = "pomatia"

  for _, mod in ipairs(groups) do
    apply_highlights(mod.get(c, opts))
  end

  if opts.overrides and not vim.tbl_isempty(opts.overrides) then
    apply_highlights(opts.overrides)
  end

  if opts.terminal_colors then
    set_terminal_colors(c)
  end
end

return M
