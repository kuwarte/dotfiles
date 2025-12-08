                                   "`)@@hr>`.                                        
                                   ".+$@@@@p);.                                      
                                   ".>a@$B@@@BC~`.                                   
                                   " ;Q@BkpM@@@@#t,..                                
                                   " '{@@oZOw#@@@@@o]`.                              
                                   " .+a@WdOOOpM@@@@@WOI.       .'^.                 
                                   " .IJ@@aOOOOZhB@@@@@@hj^   .'+dO^                 
                                   "  '}B@#wOOOmpkW@@@@@@@$Q|v0a@$J'                 
                                   "  .-W@WdOZhMB@@@@@@@@@@@@@@@@b|[i"'.             
                                   "  .[$@$kOmbM@@@@@@@@@@@@@@@@@@@@@@MC1;.          
                              ".;[1(|){v@@@MoB@@@@@@@@@@@@@@@@@@@@@@@@@@@$Ji'.       
    "..'..                     .'_b@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@C~`.     
   ".,d@@h);^...               .'+W@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@k}^.:X[`     
   ".I$@@@@@@$on!'.           .+W@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$Z<'.     `
   ".,d@@@@@@@@@@@$W#akbddba*W@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@MabpwhB
    "`/@@@@@@@@@@@@@@@@@@@@@@@@@@$bh@@@aJk@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@B-
    ".ld@@@@@@@@@@@@@@@@@@@@@@@@@@amh@WwJa@WmQo@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@X[".
     "'_W@@@@@@@@@@@@@@@@@@@@@@@@@$kwo$okBavnb$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$X".
      "`/@@@@@@@@@@@@@@@@@@@@@jiitb@$@@@@@#aWWhp*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@d;
      "."f@@@@@@@@@@@@@@@@@@@@@@#0a@@@@@@@@hn|txb$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@O
       "."r$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
         "^)W@@@@@@@@@@@@@@@@$z[>ih@@@@@@@*r~}z*@@@@@@BWW@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          ".~p@@@@@@@@@@@@@@@@dW@@@@@@@@@@@@$pzk@@@p]^...`|$@@@@@@@@@@@@@@@@@@@@@@@@@
        ".'i0@@@@@@@@@@@@@@@@@@@B);fWX>mMf;nW@@@@b<..... ..`}@@@@@@@@@@@@@@@@@@@@@@@@
      "'-k#@@@@@@@@@@@@@@@@@@@@WI;p@o)>p@$0>/M@@*-...xx`.  .'|@@@@@@@@@@@@@@@@@@@@@@@
      "..^!+}Q@@@@@@@@@@@@@@@@@@*W@@MXxM@@@$@@@@k~. .^w/'  ..l@@@@@@@@@@@@@@@@@@@@@@@
           ""v@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@a+.  .;o-. ..+@@@@@@@@@@@@@@@@@@@@@@@
           ":X@@@@@@@@@@@@@@@dr||jmM@@@@@@@@@@@@@J;.. .I+...>B@@@@@@@@@@@@@@@@@@@@@@@
          ".>Z@@@@@@@@@@@@Bz;......^)d@@@@@@@@@@@@k|:...':)C@@@@@@@@@@@@@@@@@@@@@@@@@
      "...^]d@@@@@@@@@@@@$<.  .Zl.  .;Y@@@@@@@@@@@@@@#mk$@@@@@@@@@@@@@@@@@@@@@@@@@@@@
     "."|O$@@@@@@@@@@@@@@/`    lo".  .+*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
      ".>p$@@@@@@@@@@@@@@]'    '(w'  .>p@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
       "..^<zwa@@@@@@@@@@WI.   .^Y/..`)$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
           "`f$@@@@@@@@@@@M+'   ....;z$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          ".[*@@@@@@@@@@@@@@amOYxCwh@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          ",n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
          "<h@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
         ".[$#kM@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
         ".<v>;Y@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
             ".)o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            "..fB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            ".}o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
         ".."xW@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        "`}p#@@@@$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
        ".',l<+~l_m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
                ".)o@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
	
" |==================================== == NeoVIM Config
" ======================================================
" Plugins: use VimPlug
"
" NOTE: add this config to ~/.config/nvim/
"
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" ======================================================
call plug#begin()

" --- Essentials ---
Plug 'tpope/vim-surround'						
	" syntaxYouSurround: ys{motion}{surround_char}
		" {motion}: {iw} (inner word), {$)} (rest of line), {s(} (whole line), {ap} (paragraph text), {it} (inner text)  
	" syntaxChangeSurround: cs{old}{new}
	" syntaxDeleteSurround: ds{char}
	" syntaxYouSurroundInVisualMode: V{char}
Plug 'tpope/vim-commentary'                    
	" syntaxComment: gcc
	" syntaxCommentInVisualMode: gc
	" syntaxCommentMotion: gc{motion}
Plug 'preservim/nerdtree'
	" syntaxToggleTree: <Space>/
	" syntaxFocusTree: <Space>.
	" syntaxMenu: m
	" syntaxRefresh: R
	" syntaxChangeRootDirectory: C
	" syntaxOpenFileInNewTab: t
	" syntaxOpenFileInHorizontalSplit: i
	" syntaxOpenFileInVerticalSplit: s
Plug 'itchyny/lightline.vim'          
Plug 'mengelbrecht/lightline-bufferline'
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
	" syntaxToggleTagbar: <Space>tb 
Plug 'junegunn/fzf'     
Plug 'junegunn/fzf.vim'    
	" syntaxFileFinder: <Space>ff
	" syntaxGitFileFinder: <Space>fg
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'} 
	" LSP and Intellisense
		"JavaScript
	  	"TypeScript
		"JSX/TSX
Plug 'tpope/vim-fugitive'                      
	" Git Integration
Plug 'matze/vim-move'                          
	" syntaxMoveUpInNormalAndVisualMode: <Alt>k
	" syntaxMoveDownInNormalAndVisualMode: <Alt>j
Plug 'voldikss/vim-floaterm'
	" syntaxToggleFloaterm: <F6>
Plug 'alvan/vim-closetag'                      
	" Auto close HTML tags
Plug 'windwp/nvim-autopairs'
	" Autopairs
Plug 'NvChad/nvim-colorizer.lua'
	" Colorizer for styling
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
	" TODO: and others comments color
	" FIXME:
	" NOTE:
Plug 'mfussenegger/nvim-jdtls'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

lua require("config.lsp.java")
lua require("config.cmp")
lua require("config.colorizer")
lua require("config.autopairs")
lua require("config.keymaps")
lua require("config.todo-comments")
lua require("config.rosepine")
lua require("config.nerdtree")
lua require("autocmd")











" ======================================================
" No Title
" ======================================================
let g:tagbar_ctags_bin = '/usr/bin/ctags'

let g:undotree_DiffAuto = 0

highlight LineNr guifg=#393744 gui=BOLD

if has("title")
    set title
    let &titlestring = 'NVIM: ' . expand('%:t')
endif
autocmd BufEnter * let &titlestring = 'NeoVIM -- ' . (expand('%:t') == '' ? '[No File]' : expand('%:t'))










" ======================================================
" Status Line
" ======================================================

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#smart_path   = 1
let g:lightline#bufferline#unnamed      = '[No Name]'

set laststatus=2
let g:lightline = {
	  \ 'colorscheme': 'simpleblack',
      \ 'active': {
      \   'left': [
      \       [ 'mode', 'paste' ],
	  \		  [ 'gitbranch', 'readonly','buffers' ]
      \   ],
      \   'right': [
	  \       [ ],
	  \       [ ],
	  \		  [ ],
	  \       ['filename', 'fileformat', 'fileencoding', 'filetype', 'percent', 'lineinfo']
      \   ]
      \ },
      \ 'tabline': {
      \   'right': [ [ 'close' ] ],
	  \   'left': [ [ 'buffers' ] ]
      \ },
	  \ 'component_function': {
	  \   'buffers': 'LightlineBufferlineDynamicNumbers',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

function! LightlineBufferDirPath()
    if expand('%:p') == ''
        return '[No File]'
    endif
    let l:dir = fnamemodify(expand('%:p'), ':.:h')
    if l:dir == ''
        return '/'
    endif
    return '[ ' . l:dir . '/% ]'
endfunction
let g:lightline['component_function']['filename'] = 'LightlineBufferDirPath'


function! LightlineFileFormat()
    if winwidth(0) < 100
        return ''
    endif
    return &fileformat
endfunction

function! LightlineFileEncoding()
    if winwidth(0) < 100
        return ''
    endif
    return &fileencoding
endfunction

function! LightlineFileType()
    if winwidth(0) < 100
        return ''
    endif
    return &filetype
endfunction

let g:lightline['component_function']['fileformat'] = 'LightlineFileFormat'
let g:lightline['component_function']['fileencoding'] = 'LightlineFileEncoding'
let g:lightline['component_function']['filetype'] = 'LightlineFileType'

function! LightlineBufferlineMaxWidth() 
	return 6 
endfunction

let g:lightline#bufferline#max_width = 'LightlineBufferlineMaxWidth' 
let g:lightline.component_expand.buffers = 'lightline#bufferline#buffers' 
let g:lightline#bufferline#modified = ' [+]' 
let g:lightline#bufferline#more_buffers = '...' 

let g:lightline#bufferline#composed_ordinal_number_map = {}
for i in range(1, 30)
	let g:lightline#bufferline#composed_ordinal_number_map[i] = '[ ' . i . ' ]'
endfor

function! LightlineBufferlineDynamicNumbers()
    let l:map = {}
    for buf in range(1, bufnr('$'))
        let l:map[buf] = buf . ':'
    endfor
    return l:map
endfunction

function! LightlineGitBranch()
    if exists('*FugitiveHead')
        let l:branch = FugitiveHead()
        return l:branch !=# '' ? l:branch : ''
    endif
    return ''
endfunction

