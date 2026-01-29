local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 120,
        horizontal = {
          width = 0.9,
          height = 0.8,
          preview_width = 0.6,
          preview_cutoff = 0,
          prompt_position = "top",
        },
        vertical = {
          width = 0.8,
          height = 0.9,
          preview_height = 0.7,
          preview_cutoff = 0,
          prompt_position = "top",
          mirror = false,
        },
      },
    },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    mappings = {
      n = {
        ['<C-q>'] = actions.close,
        ['<Leader>,'] = actions.close,
      },
      i = {
        ['<C-q>'] = actions.close,
        ['<Leader>,'] = actions.close,
      },
    },
    winblend = 10,
    border = true,
    sorting_strategy = "ascending",
    preview_title = false,
    only_if_window = false,
  },
  pickers = {
    live_grep = {
      preview_title = "",
      layout_config = {
        flex = {
          flip_columns = 120,
          horizontal = {
            width = 0.95,
            height = 0.85,
            preview_width = 0.55,
            preview_cutoff = 0,
          },
          vertical = {
            width = 0.85,
            height = 0.9,
            preview_height = 0.65,
            preview_cutoff = 0,
          },
        }
      }
    },
    find_files = {
      preview_title = "",
      layout_config = {
        flex = {
          flip_columns = 100,
          horizontal = {
            width = 0.85,
            height = 0.75,
            preview_width = 0.6,
            preview_cutoff = 0,
          },
          vertical = {
            width = 0.75,
            height = 0.85,
            preview_height = 0.6,
            preview_cutoff = 0,
          },
        }
      }
    },
    buffers = {
      preview_title = "",
    },
    tags = {
      preview_title = "",
    },
  },
})

vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { silent = true, desc = "Find files" })
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', { silent = true, desc = "Find buffers" })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { silent = true, desc = "Live grep" })
vim.keymap.set('n', '<Leader>ft', '<cmd>Telescope tags<CR>', { silent = true, desc = "Find tags" })

vim.cmd([[
  highlight TelescopeBorder guifg=#555555
  highlight TelescopePromptBorder guifg=#555555
  highlight TelescopeResultsBorder guifg=#555555
  highlight TelescopePreviewBorder guifg=#555555
  highlight TelescopePreviewTitle guifg=bg guibg=bg
]])


-- vim.api.nvim_create_autocmd("User", {
--   pattern = "TelescopePreviewerLoaded",
--   callback = function()
--     vim.cmd([[
--       highlight TelescopeNormal guibg=#292929 guifg=#c0c0c0
--       highlight TelescopeBorder guibg=#292929 guifg=#6e6a86
--       highlight TelescopePromptNormal guibg=#292929 guifg=#c0c0c0
--       highlight TelescopePromptBorder guibg=#292929 guifg=#6e6a86
--       highlight TelescopePromptPrefix guifg=#c4a7e7
--       highlight TelescopePreviewNormal guibg=#292929 guifg=#c0c0c0
--       highlight TelescopePreviewBorder guibg=#292929 guifg=#6e6a86
--       highlight TelescopeResultsNormal guibg=#292929 guifg=#c0c0c0
--       highlight TelescopeResultsBorder guibg=#292929 guifg=#6e6a86
--       highlight TelescopePreviewTitle guibg=#292929 guifg=#c0c0c0
--       highlight TelescopeResultsTitle guibg=#292929 guifg=#c0c0c0
--     ]])
--   end,
-- })
