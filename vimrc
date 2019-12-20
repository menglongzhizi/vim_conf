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
" 折叠使用方法 zf 创建折叠 zd 删除折叠 zD 循环删除折叠 zE 去除窗口中的所有折叠 zc 折叠 zC 对所在范围内所有嵌套的折叠进行折叠 
" zo 展开折叠 zO 对所在的范围内所有嵌套的折叠点展开 [z 到当前打开的折叠处的开始位置 ]z 到当前打开折叠处的末尾处 
" zj 向下移动，到达下一个折叠的开始处 zk 向上移动，到到上一个折叠的结尾处

" 突出当前行和列
set cursorcolumn
set cursorline

set tabstop=4       " 设置tab的宽度
set softtabstop=4   " 设置 删除 tab的宽度
set shiftwidth=4    " 设置智能缩进的宽度
set expandtab       " 将tab转成4个空格

set textwidth=90    "设置每行的最大字符数，超过的话，将换行
set colorcolumn=+2
" 关闭未保存文件时进行提示
set confirm

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

" 按照等号对齐的插件
Bundle 'godlygeek/tabular'
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
let g:NERDTreeIndicatorMapCustom = {
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

Plugin 'vim-airline'
set laststatus=2

" 快速注释插件
Bundle 'scrooloose/nerdcommenter'
" 注释的时候自动添加空格
let g:NERDSpaceDelims=1
" 注释使用方法 <leader>cc 添加注释  <leader>cu 放开注释 <leader>c<space> 添加注释OR解开注释只能判断 <leader>cy 先复制，再注释(p可以进行粘贴)

" go 主要插件
"Plugin 'fatih/vim-go', { 'tag': '*'  }
" go 中的代码追踪，输入 gd 就可以自动跳转
"Plugin 'dgryski/vim-godef'"

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plugin 'jiangmiao/auto-pairs'

Plugin 'Valloric/YouCompleteMe'
"YCM允许自动加载.ycm_extra_conf.py不在提示
let g:ycm_confirm_extra_conf=0
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 开启tags补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 键入第一个字符时就开始罗列匹配
let g:ycm_min_num_of_chars_for_completion=1
" YCM 相关快捷键, 分别是\gl,\gf,\gg
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 直接出发自动补全
let g:ycm_key_invoke_completion = '<C-Space>'

Bundle 'taglist.vim'
" 热键设置，我设置成Leader+t来呼出和关闭Taglist
map <F3> :TlistToggle<CR>
" 设置窗体宽度为32，可以根据自己喜好设置
let Tlist_WinWidth = 30
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" taglist窗口打开时，立刻切换为有焦点状态
let Tlist_GainFocus_On_ToggleOpen = 1
" Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_Sort_Type='name'
" 只显示一个文件中的tag，默认为显示多个
let Tlist_Show_One_File = 1
" 当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_File_Fold_Auto_Close = 1
" 让taglist窗口出现在Vim的右边
let Tlist_Use_Right_Window = 1
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联 

" 自动文档插件
Plugin 'DoxygenToolkit.vim'
" 自动生成文档注释、函数注释和行注释等
let g:DoxygenToolkit_briefTag_pre="@synopsis  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="mazhaomeng@xin.com"
let g:DoxygenToolkit_licenseTag="GPL 2.0"
let g:DoxygenToolkit_authorName="mazhaomeng@xin.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1

" 模糊文件搜索
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" ctrlp 的扩展插件，可实现模糊文本函数搜索
Plugin 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

call vundle#end()
filetype plugin on

set t_Co=256

if &t_Co > 2 || has('gui_running')
  syntax enable
  syntax on
  set hlsearch
endif
  colorscheme desert

" 只有在是PHP文件时，才启用PHP补全
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
  set dictionary-=~/.vim/function_list.txt dictionary+=~/.vim/function_list.txt
  set complete-=k complete+=k
endfunction
