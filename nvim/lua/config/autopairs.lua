local ok_npairs, npairs = pcall(require, "nvim-autopairs")
if not ok_npairs then
  vim.notify("`nvim-autopairs` NOT FOUND", vim.log.levels.WARN)
  return
end

local ok_rule, Rule = pcall(require, 'nvim-autopairs.rule')
local ok_cond, cond = pcall(require, 'nvim-autopairs.conds')

if not ok_rule or not ok_cond then
  vim.notify("`nvim-autopairs` COMPONENTS NOT FOUND", vim.log.levels.WARN)
  return
end

npairs.setup({
  check_ts = true,
  ts_config = {
    javascript = {'template_string'},
    javascriptreact = {'template_string'},
    typescript = {'template_string'},
    typescriptreact = {'template_string'},
  },
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
  disable_filetype = { "TelescopePrompt", "vim" },
})

local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end
