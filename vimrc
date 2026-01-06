set background=dark
set nocompatible
set backspace=2 " 设置backspace 插入模式下无法删除问题
set number  " 显示行号
set foldenable    " 开始折叠
set foldmethod=marker
set foldcolumn=0  " 设置折叠区域的宽度
set foldlevelstart=0    " 打开文件默认不折叠
" set foldclose=all     " 设置为自动关闭折叠
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 折叠使用方法
" zf 创建折叠
" zd 删除折叠
" zD 循环删除折叠
" zE 去除窗口中的所有折叠
" zc 折叠
" zC 对所在范围内所有嵌套的折叠进行折叠
" zo 展开折叠
" zO 对所在的范围内所有嵌套的折叠点展开 [z 到当前打开的折叠处的开始位置 ]z
" 到当前打开折叠处的末尾处
" zj 向下移动，到达下一个折叠的开始处 zk 向上移动，到到上一个折叠的结尾处

" 突出当前行和列
set cursorcolumn
set cursorline

set tabstop=4       " 设置tab的宽度
set softtabstop=4   " 设置 删除 tab的宽度
set shiftwidth=4    " 设置智能缩进的宽度
set expandtab       " 将tab转成4个空格

set textwidth=120    "设置每行的最大字符数，超过的话，将换行
set colorcolumn=+2
" 关闭未保存文件时进行提示
set confirm
" tab键就会显示为 ^I ，$ 显示在行尾。这样页就能看到哪里有空格了
" set list

set wildmenu
set wildmode=list:longest,full

highlight ExtraWhitespace ctermbg=red guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

" 按照等号对齐的插件
" Bundle 'godlygeek/tabular'
" 使用方法 :Tab /= 即可。意思按照=进行对齐
" 可执行 :Tab /|。       意思是按照|进行对齐

Plugin 'scrooloose/nerdtree'
nmap <F2> :NERDTreeToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinPos='left'
" 设置窗口的宽度
let NERDTreeWinSize=35
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 终端启动vim时，共享NERDTree
let g:neocomplcache_enable_at_startup=1
" 忽略该文件的展示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 当vim中没有其他文件打开只剩下NERDTree时，自动关闭窗口
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 修改箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


Plugin 'Xuyuanp/nerdtree-git-plugin'
"let g:NERDTreeIndicatorMapCustom = {
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" let g:NERDTreeShowIgnoredStatus = 1

" 底部状态栏
Plugin 'vim-airline'
set laststatus=2

" 快速注释插件
Bundle 'scrooloose/nerdcommenter'
" 注释的时候自动添加空格
let g:NERDSpaceDelims=1
" 注释使用方法 <leader>cc 添加注释  <leader>cu 放开注释 <leader>c<space> 添加注释OR解开注释只能判断 <leader>cy 先复制，再注释(p可以进行粘贴)

" go 主要插件
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_imports_autoupdate = 1          " 自动更新 import
let g:go_fmt_command = "goimports"       " 使用 goimports（比 gofmt 更好）
let g:go_fmt_autosave = 1                " 保存时自动格式化 + 整理 import
" 可选：快捷键手动整理
au FileType go nmap <leader>i <Plug>(go-imports)

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plugin 'jiangmiao/auto-pairs'

" 相比 taglist，Tagbar 对现代编程语言（尤其是面向对象语言）的支持更好，且与 universal-ctags 配合更默契。
Plugin 'preservim/tagbar'
" 设置 F3 键快速切换 Tagbar 窗口
nmap <F3> :TagbarToggle<CR>
" 核心：指向 Homebrew 安装的 universal-ctags 路径
" Apple Silicon (M1/M2/M3) 路径通常是：
let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'

" 如果是 Intel Mac，路径通常是：
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" 常用优化设置  设置窗口宽度
let g:tagbar_width = 30
" 打开时自动将光标跳到 Tagbar 窗口
let g:tagbar_autofocus = 1

" 自动文档插件
Plugin 'DoxygenToolkit.vim'
" 自动生成文档注释、函数注释和行注释等
let g:DoxygenToolkit_briefTag_pre="@synopsis  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="mzm0301@gmail.com"
let g:DoxygenToolkit_licenseTag="GPL 2.0"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

" 模糊文件名搜索
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
" 定义忽略名单
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
" 设置为 0 表示 CtrlP 会以 Vim 当前的工作目录为准进行搜索。
let g:ctrlp_working_path_mode=0
" 将搜索结果窗口固定在 Vim 的底部。
let g:ctrlp_match_window_bottom=1
" 设置窗口最大显示 15 行 结果。
let g:ctrlp_max_height=15
" 设置结果不反转。默认（1）时，最匹配的结果在最下面，光标也在最下面。设置为 0 后，最匹配的结果在最上面，光标也在最上面。这符合大多数人从上往下看的习惯
let g:ctrlp_match_window_reversed=0
" 设置“最近使用的文件列表”（MRU）的最大存储数量为 500 个。
let g:ctrlp_mruf_max=500
" 跟随符号链接（软连接）。在 PHP 或 Go 开发中，有些库或配置文件是通过软连接（ln -s）关联的。开启它，CtrlP 才能搜到这些软连接指向的真实文件
let g:ctrlp_follow_symlinks=1
" 如果系统中有 rg (ripgrep)，则使用它来搜索文件列表
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " 使用 rg 后，g:ctrlp_custom_ignore 将失效，rg 会自动使用 .gitignore
  let g:ctrlp_use_cache = 0
endif


" ctrlp 的扩展插件，在当前文件中快速提取并搜索函数列表（或方法名）。
Plugin 'tacahiroy/ctrlp-funky'
" 弹出一个窗口，列出当前文件中所有的函数。你可以输入字符进行模糊过滤，按回车直接跳转到该函数定义处。
nnoremap <Leader>fu :CtrlPFunky<Cr>
" 搜索光标下的单词。如果你的光标正停留在某个函数名上，按这个键会直接在
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" 让弹出的函数列表窗口也带上语法高亮（和你的代码颜色一致），看起来更直观。
let g:ctrlp_funky_syntax_highlight = 1
" 告诉基础插件 CtrlP 加载这个扩展。
let g:ctrlp_extensions = ['funky']

"全文搜索
Plugin 'dyng/ctrlsf.vim'
" 定义搜索结果列表窗口的位置。0 表示不固定在左边
let g:ctrlsf_open_left = 0
"但在OS X 则
" let g:ctrlsf_position = 'right'
nnoremap <Leader>ff :CtrlSF<Space>
" 将其设置为 “紧凑模式” compact 正常模式 normal
" let g:ctrlsf_default_view_mode = 'compact'
" 开启异步搜索
let g:ctrlsf_search_mode = 'async'
" 自动预览：当你在搜索结果列表中下移动光标时，Vim 会自动在另一个小窗口显示该结果对应的文件上下文，非常方便。
let g:ctrlsf_auto_preview = 1
" 告诉 CtrlSF 去使用ripgrep 进行搜索
let g:ctrlsf_backend = 'rg'

" 强化版检索式移动 https://github.com/easymotion/vim-easymotion
Plugin 'easymotion/vim-easymotion'

" PHP, Python, Perl, Ruby, etc 等调试工具
"Plugin 'vim-vdebug/vdebug'
"let g:vdebug_options = {}
"let g:vdebug_options['server'] = 'localhost'
"let g:vdebug_options['port'] = 9003
" Plugin 'puremourning/vimspector'

" 代码补全
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用回车确认补全 (Confirm completion)
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 保存时自动格式化及整理 import
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" 安装一个庞大的 Vim 配色方案合集包
Plugin 'flazz/vim-colorschemes'

" 当你按下这个快捷键时，Vim 会在屏幕底部（命令行区域）显示当前行代码的 提交人、提交时间和提交摘要
Plugin 'zivyangll/git-blame.vim'
" 快捷键
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

call vundle#end()

" 开启 Vim 的文件类型插件支持。
filetype plugin on

" 强制告诉 Vim 使用 256 色模式渲染界面
set t_Co=256

" 确保只有在能显示颜色的环境下才开启高亮，避免在古老的黑白终端上产生乱码。
if &t_Co > 2 || has('gui_running')
  syntax enable
  syntax on
  set hlsearch
endif
  colorscheme desert
  " colorscheme iceberg
  " colorscheme lucius


