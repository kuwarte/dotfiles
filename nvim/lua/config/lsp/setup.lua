local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup({
  capabilities = capabilities,
})

lspconfig.html.setup({
  capabilities = capabilities,
})

lspconfig.cssls.setup({
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
})

