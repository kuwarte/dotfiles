local M = {}

M.setup = function()
  local toggleterm = require("toggleterm")
  
  toggleterm.setup({
    size = function(term)
      if term.direction == "horizontal" then
        return math.floor(vim.o.lines * 0.3)
      else
        return math.floor(vim.o.lines * 0.4)
      end
    end,
    
    open_mapping = false,
    
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = 1,
    
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
    
    float_opts = {
      border = "single",
      width = function()
        return math.floor(vim.o.columns * 0.9)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
      row = function()
        return math.floor(vim.o.lines * 0.05) 
      end,
      winblend = 10,
    },
  })
  
  vim.cmd("highlight! ToggleTermBorder guifg=#555555 guibg=NONE")
  
  vim.api.nvim_create_autocmd("TermOpen", {
    callback = function(args)
      if vim.bo[args.buf].filetype == "toggleterm" then
        vim.cmd("highlight! ToggleTermBorder guifg=#555555 guibg=NONE")
      end
    end,
  })
  
  vim.api.nvim_create_autocmd({"ColorScheme", "VimEnter", "UIEnter"}, {
    callback = function()
      vim.cmd("highlight! ToggleTermBorder guifg=#555555 guibg=NONE")
    end,
  })
end

M.create_terminals = function()
  local Terminal = require("toggleterm.terminal").Terminal
  
  M.float = Terminal:new({
    direction = "float",
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
      if term.window then
    vim.api.nvim_win_set_option(
      term.window,
      "winhighlight",
    "Normal:ToggleTermNormal,FloatBorder:ToggleTermBorder"
    )
      end
    end,
  })
  
  M.horizontal = Terminal:new({
    direction = "horizontal",
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  })
  
  M.vertical = Terminal:new({
    direction = "vertical",
    hidden = true,
    on_open = function(term)
      vim.cmd("startinsert!")
    end,
  })
end

 vim.keymap.set({"n", "i", "t"}, "<F6>", function()
      safe_toggle(M.float)
    end, opts)

    vim.keymap.set({"n", "i", "t"}, "<F7>", function()
      safe_toggle(M.horizontal)
    end, opts)  

M.setup_keymaps = function()
  local opts = { noremap = true, silent = true }
  
 vim.keymap.set({"n", "i", "t"}, "<F6>", function() 
     if M.float then 
         M.float:toggle() 
     else vim.cmd("ToggleTerm direction=float") 
     end 
 end, opts) 

 vim.keymap.set({"n", "i", "t"}, "<F7>", function() 
     if M.horizontal then 
         M.horizontal:toggle() 
     else vim.cmd("ToggleTerm direction=horizontal") 
     end 
 end, opts)

  vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
  vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
  vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
  vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
  vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
end

M.init = function()
  M.setup()
  M.create_terminals()
  M.setup_keymaps()
  
  vim.defer_fn(function()
    vim.cmd("highlight! ToggleTermBorder guifg=#555555 guibg=NONE")
  end, 100)
end

vim.cmd([[
  highlight! ToggleTermNormal guibg=NONE
]])


return M
