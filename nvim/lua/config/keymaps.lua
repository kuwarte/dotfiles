local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>w", ":w<CR>", opts)   -- Save File
map("n", "<leader>z", ":wa<CR>", opts)	-- Save All File
map("n", "<leader>q", ":q<CR>", opts)	-- Quit File
map("n", "<leader>qq", ":qa<CR>", opts) -- Quit All Files

map("n", "<Leader>.", ":NERDTreeFocus<CR>", opts)	-- Focus Tree
map("n", "<C-n>", ":NERDTree<CR>", opts)			
map("n", "<Leader>/", ":NERDTreeToggle<CR>", opts)	-- Toggle Tree 
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

map("n", "<Tab>", "<Plug>lightline#bufferline#go_next()", {})				-- Buffer Tab Switching 
map("n", "<leader>gp", "<Plug>lightline#bufferline#go_previous()", {})		-- Go Prev
map("n", "<Leader>mbn", "<Plug>lightline#bufferline#move_next()", {})		-- Move Buffer Next
map("n", "<Leader>mbp", "<Plug>lightline#bufferline#move_previous()", {})	-- Move Buffer Previous
map("n", "<leader>db", ":bnext<bar>bd#<CR>", opts)							-- Delete Buffer

-- FZF
map("n", "<Leader>,", ":Files<CR>", opts)		-- Find Files
map("n", "<Leader>fb", ":Buffers<CR>", opts)	-- Find Buffer
map("n", "<Leader>fg", ":GFiles<CR>", opts)		-- Find Git Files
map("n", "<Leader>ft", ":Tags<CR>", opts)		-- Find Tags

-- Floaterm
map("t", "<F6>", [[<C-\><C-n>:FloatermToggle<CR>]], opts)	-- Terminal Close
map("n", "<F6>", ":FloatermToggle<CR>", opts)				-- Terminal Open
vim.g.floaterm_keymap_new  = "<F7>"
vim.g.floaterm_keymap_prev = "<F8>"
vim.g.floaterm_keymap_next = "<F9>"

-- Tagbar
map("n", "<Leader>tb", ":TagbarToggle<CR>", opts)	-- Tagbar

-- Quick escape
map("i", "fd", "<Esc>", opts)

-- Others
map("n", "<F3>", ":noh<CR>", opts)	-- Rem Highlight

local keys = { "<MiddleMouse>", "<2-MiddleMouse>", "<3-MiddleMouse>", "<4-MiddleMouse>" }

for _, key in ipairs(keys) do
    vim.keymap.set("n", key, "<Nop>")
    vim.keymap.set("i", key, "<Nop>")
    vim.keymap.set("v", key, "<Nop>")
end

-- =========================
-- JDTLS / Java LSP Shortcuts
-- =========================
-- Code actions (e.g., implement unimplemented methods, fix imports)
map("n", "<Leader>ca", function()
  vim.lsp.buf.code_action()
end, opts)

-- Organize imports
map("n", "<Leader>oi", function() require('jdtls').organize_imports() end, opts)

-- Rename symbol under cursor
map("n", "<Leader>rn", function() vim.lsp.buf.rename() end, opts)

-- Go to definition
map("n", "<Leader>gd", function() vim.lsp.buf.definition() end, opts)

-- Find references
map("n", "<Leader>gr", function() vim.lsp.buf.references() end, opts)

-- Show documentation / hover
map("n", "<Leader>K", function() vim.lsp.buf.hover() end, opts)

-- Go to implementation
map("n", "<leader>gi", function() require('jdtls').goto_implementation() end, opts)

-- Extract variable
map("v", "<Leader>ev", function() require('jdtls').extract_variable(true) end, opts)

-- Extract method
map("v", "<Leader>em", function() require('jdtls').extract_method(true) end, opts)

-- Compile and run main class
map("n", "<Leader>rc", function() require('jdtls').compile() end, opts)
map("n", "<Leader>rr", function() require('jdtls').run() end, opts)
