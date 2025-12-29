local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>z", ":wa<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>qq", ":qa<CR>", opts)

map("n", "<Leader>.", ":NvimTreeFocus<CR>", opts)
map("n", "<C-n>", ":NvimTreeOpen<CR>", opts)
map("n", "<Leader>/", ":NvimTreeToggle<CR>", opts)
map("n", "<C-l>", ":UndotreeToggle<CR>", opts)

map("n", "<Leader>1", "<Plug>lightline#bufferline#go(1)", {})
map("n", "<Leader>2", "<Plug>lightline#bufferline#go(2)", {})
map("n", "<Leader>3", "<Plug>lightline#bufferline#go(3)", {})
map("n", "<Leader>4", "<Plug>lightline#bufferline#go(4)", {})
map("n", "<Leader>5", "<Plug>lightline#bufferline#go(5)", {})
map("n", "<Leader>6", "<Plug>lightline#bufferline#go(6)", {})
map("n", "<Leader>7", "<Plug>lightline#bufferline#go(7)", {})
map("n", "<Leader>8", "<Plug>lightline#bufferline#go(8)", {})
map("n", "<Leader>9", "<Plug>lightline#bufferline#go(9)", {})

map("n", "<Tab>", "<Plug>lightline#bufferline#go_next()", {})
map("n", "<leader>gp", "<Plug>lightline#bufferline#go_previous()", {})
map("n", "<Leader>mbn", "<Plug>lightline#bufferline#move_next()", {})
map("n", "<Leader>mbp", "<Plug>lightline#bufferline#move_previous()", {})
map("n", "<leader>db", ":bnext<bar>bd#<CR>", opts)

map("n", "<Leader>,", "<cmd>Telescope find_files<CR>", opts)
map("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<Leader>ft", "<cmd>Telescope tags<CR>", opts)

map("t", "<F6>", [[<C-\><C-n>:FloatermToggle<CR>]], opts)
map("n", "<F6>", ":FloatermToggle<CR>", opts)
vim.g.floaterm_keymap_new  = "<F7>"
vim.g.floaterm_keymap_prev = "<F8>"
vim.g.floaterm_keymap_next = "<F9>"

map("n", "<Leader>tb", ":TagbarToggle<CR>", opts)

map("i", "fd", "<Esc>", opts)

map("n", "<F3>", ":noh<CR>", opts)

local keys = { "<MiddleMouse>", "<2-MiddleMouse>", "<3-MiddleMouse>", "<4-MiddleMouse>" }

for _, key in ipairs(keys) do
    vim.keymap.set("n", key, "<Nop>")
    vim.keymap.set("i", key, "<Nop>")
    vim.keymap.set("v", key, "<Nop>")
end

map("n", "<Leader>ca", function()
  vim.lsp.buf.code_action()
end, opts)

map("n", "<Leader>oi", function() require('jdtls').organize_imports() end, opts)

map("n", "<Leader>rn", function() vim.lsp.buf.rename() end, opts)

map("n", "<Leader>gd", function() vim.lsp.buf.definition() end, opts)

map("n", "<Leader>gr", function() vim.lsp.buf.references() end, opts)

map("n", "<Leader>K", function() vim.lsp.buf.hover() end, opts)

map("n", "<leader>gi", function() require('jdtls').goto_implementation() end, opts)

map("v", "<Leader>ev", function() require('jdtls').extract_variable(true) end, opts)

map("v", "<Leader>em", function() require('jdtls').extract_method(true) end, opts)

map("n", "<Leader>rc", function() require('jdtls').compile() end, opts)
map("n", "<Leader>rr", function() require('jdtls').run() end, opts)

map("n", "<Leader>gg", ":lua _LAZYGIT_TOGGLE() <CR>", opts)
