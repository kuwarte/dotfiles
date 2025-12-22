local old_notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("nvim%-lspconfig.*deprecated") then
    return
  end
  old_notify(msg, level, opts)
end

vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  init_options = {
    preferences = {
      includeCompletionsForModuleExports = true,
      includeCompletionsWithInsertText = true,
    },
  },
})

lspconfig.html.setup({
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact" },
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

