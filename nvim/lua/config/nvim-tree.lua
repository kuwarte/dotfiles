require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = function()
    if vim.o.columns < 120 then
      return 30
    end
    return 40
  end,
    side = "right",
    float = {
      enable = true,
      open_win_config = function()
        local width = 40
        local height = vim.o.lines - 4
        return {
          relative = "editor",
          width = width,
          height = height,
          row = 1,
          col = vim.o.columns - width - 1,
          border = "single",
        }
      end,
    },
  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "├",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      show = {
        git = true,  
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "▶ ",
          arrow_open = "▼ ",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "@",
          symlink_open = "@",
        }, 
        git = {
          unstaged = "[M]",
          staged = "[S]",
          unmerged = "[!]",
          renamed = "[R]",
          untracked = "[??]",
          deleted = "[D]",
          ignored = "[I]",
        },
      },
    },
    add_trailing = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 2000,
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  on_attach = function(bufnr)
    local api = require "nvim-tree.api"
    
    api.config.mappings.default_on_attach(bufnr)
    
    vim.keymap.set('n', 'C', api.tree.change_root_to_node, { buffer = bufnr, noremap = true, silent = true })
  end,
})

vim.keymap.set('n', '<Space>/', ':NvimTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '<Space>.', ':NvimTreeFocus<CR>', { silent = true })

vim.cmd([[
  highlight NvimTreeFolderName guifg=#74c0fc ctermfg=blue gui=bold cterm=bold
  highlight NvimTreeOpenedFolderName guifg=#a5d8ff ctermfg=lightblue gui=bold cterm=bold
  highlight NvimTreeModifiedFile guifg=#ffa94d ctermfg=214 gui=underline cterm=underline
  highlight NvimTreeGitDirty guifg=#ff6b6b ctermfg=red gui=italic cterm=italic
  highlight NvimTreeGitStaged guifg=#51cf66 ctermfg=green gui=italic cterm=italic
  highlight NvimTreeGitMerge guifg=#ffd43b ctermfg=yellow gui=italic cterm=italic
  highlight NvimTreeGitRenamed guifg=#74c0fc ctermfg=blue gui=italic cterm=italic
  highlight NvimTreeGitNew guifg=#ffd43b ctermfg=yellow gui=italic cterm=italic
  highlight NvimTreeGitDeleted guifg=#ff8787 ctermfg=red gui=italic cterm=italic
  highlight NvimTreeGitIgnored guifg=#868e96 ctermfg=gray gui=italic cterm=italic
]])

vim.cmd([[
  highlight NormalFloat guibg=NONE guifg=#c0c0c0
  highlight FloatBorder guibg=NONE guifg=#6e6a86
]])
