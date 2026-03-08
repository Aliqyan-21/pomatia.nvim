local M             = {}

local CACHE_DIR     = vim.fn.stdpath("cache") .. "/pomatia"
local CACHE_FILE    = CACHE_DIR .. "/highlights.lua"

local SOME_CONSTANT = "1"

-- make the key from setup,
-- making something like this => 'A=1|theme=dark|transparent=true'
local function make_key(opts)
  local parts = { "A=" .. SOME_CONSTANT }
  local keys = vim.tbl_keys(opts)
  table.sort(keys)
  for _, k in ipairs(keys) do
    local v = opts[k]
    if type(v) == "table" then
      local ok = vim.tbl_keys(v)
      table.sort(ok)
      parts[#parts + 1] = k .. "={" .. table.concat(ok, ",") .. "}"
    else
      parts[#parts + 1] = k .. "=" .. tostring(v)
    end
  end
  return table.concat(parts, "|")
end

-- for converting basic lua values to strings,
-- so that we can write it in file
local function ser_val(v)
  local t = type(v)
  if t == "boolean" then
    return tostring(v)
  elseif t == "number" then
    return tostring(v)
  elseif t == "string" then
    return string.format("%q", v)
  else
    return "nil"
  end
end

-- for single highlight group
local function ser_spec(spec)
  local parts = {}
  local keys = vim.tbl_keys(spec)
  table.sort(keys)
  for _, k in ipairs(keys) do
    parts[#parts + 1] = string.format("[%q]=%s", k, ser_val(spec[k]))
  end
  return "{" .. table.concat(parts, ",") .. "}"
end

-- for building the valid lua file
local function serialize(key, all_specs)
  local lines = {
    "-- pomatia.nvim highlight cache — do not edit",
    "return {",
    string.format("  %q,", key),
    "  {",
  }

  local groups = vim.tbl_keys(all_specs)
  table.sort(groups)
  for _, group in ipairs(groups) do
    local spec = all_specs[group]
    lines[#lines + 1] = string.format("    [%q]=%s,", group, ser_spec(spec))
  end

  lines[#lines + 1] = "  },"
  lines[#lines + 1] = "}"
  return table.concat(lines, "\n")
end

function M.load(opts)
  local key = make_key(opts)

  local chunk, _ = loadfile(CACHE_FILE)
  if not chunk then
    return nil
  end

  local ok, result = pcall(chunk)
  if not ok or type(result) ~= "table" or #result ~= 2 then
    return nil
  end

  local cached_key, specs = result[1], result[2]
  if cached_key ~= key then
    return nil
  end

  return specs
end

function M.save(opts, all_specs)
  vim.fn.mkdir(CACHE_DIR, "p")

  local key    = make_key(opts)
  local data   = serialize(key, all_specs)

  local f, err = io.open(CACHE_FILE, "w")
  if not f then
    vim.notify(
      "pomatia: could not write cache: " .. (err or "unknown error"),
      vim.log.levels.WARN
    )
    return
  end
  f:write(data)
  f:close()
end

-- for manual deletioin of cache file
function M.clear()
  os.remove(CACHE_FILE)
  vim.notify("pomatia: cache cleared", vim.log.levels.INFO)
end

return M
