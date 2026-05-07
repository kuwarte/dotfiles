" |==================================== == NeoVIM Config
" ======================================================
" Plugins: use VimPlug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ======================================================

call plug#begin(stdpath('data') . '/plugged')

" --- Essentials ---
Plug 'folke/tokyonight.nvim'
" Plug 'nvim-lualine/lualine.nvim'
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
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
" Plug 'itchyny/lightline.vim'          
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
	" syntaxToggleTagbar: <Space>tb 
Plug 'junegunn/fzf'     
Plug 'junegunn/fzf.vim'    
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'v0.2.0' }
	" syntaxFileFinder: <Space>ff
	" syntaxGitFileFinder: <Space>fg
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
Plug 'tpope/vim-fugitive'                      
	" Git Integration
Plug 'matze/vim-move'                          
	" syntaxMoveUpInNormalAndVisualMode: <Alt>k
	" syntaxMoveDownInNormalAndVisualMode: <Alt>j
Plug 'voldikss/vim-floaterm'
Plug 'akinsho/toggleterm.nvim'
	" syntaxToggleFloaterm: <F6>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
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
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'neovim/nvim-lspconfig', { 'tag': 'v1.4.0' }
Plug 'stevearc/conform.nvim'

call plug#end()

set nocompatible
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
set cmdheight=1
set pumheight=10
set conceallevel=0
set fileencoding=utf-8
set ruler
set iskeyword+=-
set mouse=a
set splitbelow
set splitright
set t_Co=256
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set autoindent
set laststatus=2
set number
set relativenumber
set nocursorline
set background=dark
set showmode
set nobackup
set nowritebackup
set noswapfile
set clipboard=unnamedplus
set scrolloff=8
set sidescrolloff=8
set statusline=
set statusline+=%{SidePadding()}
set statusline+=\ %f
set statusline+=%{GitBranch()}
set statusline+=%{FileReadonly()}
set statusline+=%{FileModified()}
set statusline+=%=
set statusline+=%{GitDiff()}
set statusline+=%{LspErrorCount()}
set statusline+=%l:%c
set statusline+=\ %p%%
set statusline+=%{SidePadding()}

syntax enable
filetype plugin indent on


" Load lua config
lua require('init')

" FZF Configuration
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0, 'border': 'single' } }
" let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" let g:fzf_colors = {
"   \ 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }


" Ctags config
let g:tagbar_ctags_bin = '/usr/bin/ctags'


" NERD Tree config
" let g:undotree_DiffAuto = 0
" let g:NERDTreeGitStatusUseNerdFonts = 0

" let g:NERDTreeGitStatusIndicatorMap = {
"       \ 'Modified'  : 'M',
"       \ 'Staged'    : 'S',
"       \ 'Untracked' : '?',
"       \ 'Renamed'   : 'R',
"       \ 'Deleted'   : 'D',
"       \ 'Dirty'     : '!',
"       \ 'Clean'     : 'C',
"       \ 'Unknown'   : 'U',
"       \ }

highlight LineNr guifg=#393744 gui=BOLD

if has("title")
    set title
    let &titlestring = 'NVIM: ' . expand('%:t')
endif
autocmd BufEnter * let &titlestring = 'nv@' . (expand('%:t') == '' ? '[No File]' : expand('%:t'))


" Status line config
function! SidePadding()
  return '  '
endfunction

function! GitBranch()
  if exists('*FugitiveHead')
    let l:branch = FugitiveHead()
    if l:branch != ''
      return ' [git:' . l:branch . ']'
    endif
  endif
  return ''
endfunction

function! LspErrorCount()
  let l:errors = luaeval("#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })")
  let l:warnings = luaeval("#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })")

  let l:out = ''

  if l:errors > 0
    let l:out .= ' [E:' . l:errors . ']'
  endif

  if l:warnings > 0
    let l:out .= ' [W:' . l:warnings . ']'
  endif

  return l:out != '' ? l:out . ' ' : ''
endfunction

function! GitDiff()
  if !isdirectory('.git')
    return ''
  endif

  let l:output = system("git diff --numstat")
  let l:add = 0
  let l:del = 0

  for line in split(l:output, "\n")
    if line != ''
      let parts = split(line)
      let l:add += str2nr(parts[0])
      let l:del += str2nr(parts[1])
    endif
  endfor

  if l:add == 0 && l:del == 0
    return ''
  endif

  return ' [+' . l:add . ' -' . l:del . '] '
endfunction

function! FileModified()
  return &modified ? ' [+]' : ''
endfunction

function! FileReadonly()
  return &readonly ? ' [-]' : ''
endfunction
