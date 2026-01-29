local conform = require("conform")

local old_notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("nvim%-lspconfig.*deprecated") then
    return
  end
  old_notify(msg, level, opts)
end

vim.diagnostic.config({
  virtual_text = false, 
  signs = true,        
  underline = true,     
  severity_sort = true,
  update_in_insert = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "single",
    source = "if_many",
    header = "",
    prefix = "",
  },
})

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,     
--     virtual_lines = false,   
--     signs = true,
--     underline = true,
--     update_in_insert = false,
--   }
-- )

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "single",
      style = "minimal",
      winblend = 10,
      source = "always",
      header = "",
      prefix = function(diagnostic)
        local icons = {
          [vim.diagnostic.severity.ERROR] = "[E] ",
          [vim.diagnostic.severity.WARN] = "[W] ",
          [vim.diagnostic.severity.INFO] = "[I] ",
          [vim.diagnostic.severity.HINT] = "[H] ",
        }
        return icons[diagnostic.severity] or "> "
      end,
      max_width = 80,
      max_height = 20,
      format = function(diagnostic)
        return diagnostic.message
      end
    })
  end,
})

local keymaps_opts = { noremap = true, silent = true }

vim.keymap.set("n", "df", function()
  -- vim.diagnostic.open_float(nil, {
  --   focusable = false,
  --   border = "single",
  --   source = "always",
  --   header = "",
  --   prefix = "",
  -- })
  vim.diagnostic.setloclist({ open = true })
end, keymaps_opts)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, keymaps_opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, keymaps_opts)
vim.keymap.set("n", "<leader>m", vim.diagnostic.setloclist, keymaps_opts)

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
  end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
  end, bufopts)
end

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
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
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact" },
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

lspconfig.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

local function setup_solidity_lsp()
  local ok1, _ = pcall(function()
    lspconfig.solidity_ls_nomicfoundation.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "solidity" },
      root_dir = lspconfig.util.root_pattern(
        "foundry.toml",
        "hardhat.config.js",
        "hardhat.config.ts",
        "truffle-config.js",
        "package.json",
        ".git"
      ),
    })
  end)
  
  if not ok1 then
    local ok2, _ = pcall(function()
      lspconfig.solidity_ls.setup({
        cmd = { "solidity-language-server", "--stdio" },
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "solidity" },
        root_dir = lspconfig.util.root_pattern(
          "foundry.toml",
          "hardhat.config.js",
          "hardhat.config.ts",
          "truffle-config.js",
          "package.json",
          ".git"
        ),
        settings = {
          solidity = {
            includePath = "node_modules",
            remappings = {
              ["@openzeppelin/"] = "lib/openzeppelin-contracts/",
            },
          },
        },
      })
    end)
    
    if not ok2 then
      vim.notify("SOLIDITY LSP NOT AVAILABLE. INSTALL WITH: `npm install -g @nomicfoundation/solidity-language-server`", vim.log.levels.WARN)
    end
  end
end

setup_solidity_lsp()

vim.diagnostic.config({
  update_in_insert = true,
})

require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#555555", bg = "NONE" })

vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff6b6b", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#feca57", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#48dbfb", bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#1dd1a1", bg = "NONE" })
