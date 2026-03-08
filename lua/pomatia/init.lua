local M             = {}

local config        = require("pomatia.config")
local palette       = require("pomatia.palette")
local cache         = require("pomatia.cache")

local group_modules = {
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

local function build_highlights(c, opts)
  local all = {}
  for _, mod in ipairs(group_modules) do
    for group, spec in pairs(mod.get(c, opts)) do
      all[group] = spec
    end
  end
  return all
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

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.opt.background = "dark"
  vim.g.colors_name  = "pomatia"

  local specs

  if opts.caching then
    specs = cache.load(opts) -- specs from cache if caching configured

    if not specs then
      specs = build_highlights(palette.colors, opts)
      cache.save(opts, specs)
    end
  else
    specs = build_highlights(palette.colors, opts)
  end

  apply_highlights(specs)

  if opts.overrides and not vim.tbl_isempty(opts.overrides) then
    apply_highlights(opts.overrides)
  end

  if opts.terminal_colors then
    set_terminal_colors(palette.colors)
  end
end

function M.clear_cache()
  cache.clear()
  M.load()
end

-- function ':PomatiaClearCache' for user
vim.api.nvim_create_user_command("PomatiaClearCache", function()
  require("pomatia").clear_cache()
end, { desc = "Clear pomatia.nvim highlight cache and reload" })

return M
