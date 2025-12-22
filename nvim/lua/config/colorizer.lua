local ok, colorizer = pcall(require, "colorizer")
if not ok then
  vim.notify("nvim-colorizer not found", vim.log.levels.WARN)
  return
end

colorizer.setup({
  filetypes = {
    "css",
    "scss",
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "lua",
    "vim",
  },
  user_default_options = {
    names = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
    tailwind = true,
    mode = "background",
    virtualtext = "■",
  }
})

