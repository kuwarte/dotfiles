local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("FAILED TO LOAD `" .. module .. "`: " .. result, vim.log.levels.ERROR)
    return nil
  end
  return result
end

local function require_and_init(module)
  local mod = safe_require(module)
  
  if mod == nil then
    return
  end
  
  if type(mod) == "table" then
    if mod.init and type(mod.init) == "function" then
      local init_ok, init_err = pcall(mod.init)
      if not init_ok then
        vim.notify("ERROR INITIALIZING `" .. module .. "`: " .. init_err, vim.log.levels.ERROR)
      end
    elseif mod.setup and type(mod.setup) == "function" then
      local setup_ok, setup_err = pcall(mod.setup)
      if not setup_ok then
        vim.notify("ERROR SETTING UP `" .. module .. "`: " .. setup_err, vim.log.levels.ERROR)
      end
    end
  elseif type(mod) == "function" then
    local setup_ok, setup_err = pcall(mod)
    if not setup_ok then
      vim.notify("ERROR EXECUTING MODULE FUNCTION `" .. module .. "`: " .. setup_err, vim.log.levels.ERROR)
    end
  end
end

require_and_init("config.rosepine")
local modules = {
  "config.lsp.setup",
  "config.lsp.java", 
  "config.cmp",
  "config.colorizer",
  "config.autopairs",
  "config.keymaps",
  "config.todo-comments",
  "config.nvim-tree",
  "config.treesitter",
  "config.lazygit",
  "config.telescope",
  "config.toggleterm", 
  "autocmd"
}

for _, module in ipairs(modules) do
  require_and_init(module)
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

