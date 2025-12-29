local Terminal  = require('toggleterm.terminal').Terminal

function _LAZYGIT_TOGGLE()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = { border = "double" },
  })
  lazygit:toggle()
end

