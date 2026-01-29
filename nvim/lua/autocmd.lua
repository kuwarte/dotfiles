local api = vim.api

vim.o.scrolloff = 5
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.mouse = "a"
vim.o.encoding = "UTF-8"
vim.o.visualbell = true
vim.o.showmode = false
vim.o.swapfile = false
vim.o.timeoutlen = 300
vim.o.clipboard = "unnamedplus"

vim.wo.number = true
vim.wo.relativenumber = true

local function start_menu()
    if vim.fn.argc() ~= 0 then return end

    local project_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
    if vim.v.shell_error == 0 and project_root ~= "" then
        vim.cmd('cd ' .. vim.fn.fnameescape(project_root))
    else
        local fallback = vim.fn.expand("~") .. "/code"
        vim.cmd('cd ' .. vim.fn.fnameescape(fallback))
    end
    
    vim.cmd('enew')
    vim.bo.buftype = 'nofile'
    vim.bo.bufhidden = 'wipe'
    vim.bo.swapfile = false
    vim.bo.buflisted = false
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.cursorline = false
    vim.wo.signcolumn = 'no'
    vim.bo.modifiable = true

    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
        "                                                                                     ",
        "                  +kWM$m[,.                     NeoVIM -- Menu [config: kuwarte]     ",
        "                  `j#mdM@BJ~^.  .'.             =====================================",
        "                  ./@hOZh$@@#r>+Z/'             Open tree with [<Space>/]:           ",
        "               ....($aZkB@@@@@@@Bbc}:'.         [ a ] Create File/Folder             ",
        "               :c@@@@@@@@@@@@@@@@@@@@@['        [ r ] Rename File/Folder             ",
        "  )#*Z~:.     .,xB@@@@@@@@@@@@@@@@@@@vi^. .     [ m ] Move File/Folder               ",
        "  ~@@@@@@WaahaM@@$@*a@@@@@@@@@@@@@@@@@@Wahw     [ d ] Delete File/Folder             ",
        "  .Q@@@@@@@@@@@@$oakpdZW@@@@@@@@@@@@@@@@@C^     [ o ] Open File                      ",
        "   :d@@@@@@@@@#0O*@@@aCzk@@@@@@@@@@@@@@@@@J     [ C ] Change root to node            ",
        "   .:m@@@@@@@@MOQM@@@pXh@@@@@@@@@@@@@@@@@@@     [ <leader>qa ] Exit                  ",
        "   ..<*@@@@@@@$MdObZdZo#Mz!.._w$@@@@@@@@@@@     =====================================",
        "   'XCh@@@@@@@@kXM0v@00@f'>[: ,Z@@@@@@@@@@@     Using Telescope:                     ",
        "     ^c@@@@@@@*Zw#@@@@@@z;.{~'_b@@@@@@@@@@@     [ <leader>ff ] Find Files            ",
        "   ..<a@@@@@#|'``'{#@@@@@ati]O$@@@@@@@@@@@@     [ <leader>fg ] Live Grep             ",
        "   -o@@@@@@BY .</.'t@@@@@@@@@@@@@@@@@@@@@@@     [ <leader>fb ] Find Buffers          ",
        "    .'t@@@@@h_..^,_b@@@@@@@@@@@@@@@@@@@@@@@     [ <leader>ft ] Find Tags             ",
        "    .l$@@@@@@@W#*B@@@@@@@@@@@@@@@@@@@@@@@@@     =====================================",
        "    '|@$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     Keybindings:                         ",
        "    .:lf@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     [ <leader>w ] Save File              ",
        "     .'Y@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     [ <Space>/ ] Toggle NvimTree         ",
        "   .^/d@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     [ <Space>. ] Focus NvimTree          ",
        "   ..^II+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     [ <leader>W ] Save All Buffers       ",
        "                                                                                     ",
        "                                                                                     ",
        "                                                                                     "
    })

    vim.cmd([[
        syntax match AsciiArt /[{}Z\[\]@#.^<$\*0~!:+]/
        syntax match MenuTitle /NeoVIM -- Menu.*/
        syntax match MenuSection /Open tree with.*/
        syntax match MenuSection /Using Telescope:/
        syntax match MenuSection /Keybindings:/
        syntax match MenuKey /\[.*\]/
        syntax match MenuDivider /===*/

        highlight AsciiArt guifg=#a19667 ctermfg=255
        highlight MenuTitle guifg=#a18267 ctermfg=204 gui=bold
        highlight MenuSection guifg=#8dbce3 ctermfg=75
        highlight MenuKey guifg=#a19667 ctermfg=114
        highlight MenuDivider guifg=#ffffff ctermfg=240
    ]])

    vim.cmd('file MENU')
     vim.schedule(function()
        vim.cmd("NvimTreeOpen")
        vim.cmd("NvimTreeFocus")
    end)

    vim.bo.modifiable = false
end

api.nvim_create_autocmd("VimEnter", { callback = start_menu })

api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.buftype ~= 'nofile' then
            vim.wo.number = true
            vim.wo.relativenumber = true
        end
        if vim.fn.bufname('MENU') ~= '' and vim.bo.buftype ~= 'nofile' then
            vim.cmd('bwipeout MENU')
        end
    end
})

api.nvim_create_autocmd({"BufDelete", "BufWritePost", "TextChanged", "TextChangedI"}, {
    callback = function()
        if vim.fn.exists('*lightline#update') == 1 then
            vim.fn['lightline#update']()
        end
    end
})

