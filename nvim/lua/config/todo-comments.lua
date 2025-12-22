local ok, todo = pcall(require, "todo-comments")
if not ok then
  vim.notify("todo-comments plugin not found", vim.log.levels.WARN)
  return
end

todo.setup({
  signs = true,
  sign_priority = 7,

  keywords = {
    TODO = { icon = "*", color = "info" },
    FIX  = { icon = "!", color = "error", alt = { "FIXME", "BUG" } },
    HACK = { icon = "?", color = "warning" },
    NOTE = { icon = "-", color = "hint", alt = { "INFO" } },
    PERF = { icon = "~", color = "default" },
  },

  highlight = {
    multiline = false,
    keyword = "bg",
    after = "fg",
  },
})

local function safe_keymap(mode, lhs, rhs, opts)
  local success, err = pcall(vim.keymap.set, mode, lhs, rhs, opts)
  if not success then
    vim.notify("Failed to set keymap " .. lhs .. ": " .. err, vim.log.levels.ERROR)
  end
end

safe_keymap("n", "]t", function()
  todo.jump_next()
end, { desc = "Next TODO" })

safe_keymap("n", "[t", function()
  todo.jump_prev()
end, { desc = "Previous TODO" })

