local ok_cmp, cmp = pcall(require, "cmp")
local ok_luasnip, luasnip = pcall(require, "luasnip")

if not ok_cmp then
  vim.notify("`nvim-cmp` NOT FOUND", vim.log.levels.ERROR)
  return
end

if not ok_luasnip then
  vim.notify("`LuaSnip` NOT FOUND", vim.log.levels.ERROR)
  return
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 1000 },
		{ name = "luasnip", priority = 750 },
		{ name = "path", priority = 500 },
		{ name = "buffer", priority = 250, keyword_length = 3 },
	}),
    window = {
        completion = cmp.config.window.bordered({
			max_height = 8,
            border = "rounded",
            winhighlight = "Normal:Panel,FloatBorder:Border,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Panel,FloatBorder:Border,CursorLine:PmenuSel,Search:None",
        }),
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
})

