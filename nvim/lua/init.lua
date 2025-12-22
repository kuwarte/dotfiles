local function safe_require(module)
  local ok, result = pcall(require, module)
  if not ok then
    vim.notify("Failed to load " .. module .. ": " .. result, vim.log.levels.ERROR)
    return nil
  end
  return result
end

local modules = {
  "config.lsp.setup",
  "config.lsp.java", 
  "config.cmp",
  "config.colorizer",
  "config.autopairs",
  "config.keymaps",
  "config.todo-comments",
  "config.rosepine",
  "config.nerdtree",
  "config.treesitter",
  "autocmd"
}

for _, module in ipairs(modules) do
  safe_require(module)
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1