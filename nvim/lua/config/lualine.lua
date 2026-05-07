local M = {}

local loaded = false

function M.setup()
  if loaded then return end
  loaded = true
  require("lualine").setup({
    options = {
      refresh = {
        statusline = 2000
      },

      theme = "tokyonight",
      -- theme = auto,
      icons_enabled = false,

      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "|" },

      globalstatus = true,
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "diagnostics", "filetype", "encoding" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  })

 end

return M
