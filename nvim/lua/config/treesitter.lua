local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter_configs.setup({
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", 
    "javascript", "typescript", "python", "java",
    "tsx", "jsx", "html", "css", "json", "yaml"
  },
  sync_install = false,
  auto_install = true,
  
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = false,
    filetypes = {
      'html', 'javascript', 'typescript', 
      'javascriptreact', 'typescriptreact', 
      'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'xml', 'php', 'markdown', 'glimmer',
      'handlebars', 'hbs'
    },
  },
  
  indent = {
    enable = true,
  },
  
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
