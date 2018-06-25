" Auto add head info
" .py file into add header
function HeaderPython()
    call setline(1, "#!/usr/bin python")
    call append(1, "# -*- coding: utf-8 -*-")
    normal G
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 在这里添加你想安装的Vim插件
" vim +PluginInstall +qall 安装命令，安装所有
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'vim-syntastic/syntastic'
call vundle#end()            " required
filetype plugin indent on    " required


"nathanaelkane/vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4



""""""""""""""""""""""""""""""  
" miniBufexplorer Config  
""""""""""""""""""""""""""""""  
let g:miniBufExplMapWindowNavArrows = 1  
let g:miniBufExplMapWindowNavVim = 1  
let g:miniBufExplMapCTabSwitchWindows = 1  
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
   
"解决FileExplorer窗口变小问题  
let g:miniBufExplForceSyntaxEnable = 1  
let g:miniBufExplorerMoreThanOne=2 








syntax on           " 语法高亮  
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set showcmd         " 输入的命令显示出来，看的清楚些  
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
 

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
" 设置当文件被改动时自动载入
set autoread
"允许插件  
"filetype plugin on
"
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 显示行号
set number
" 历史记录数
set history=1000
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
set gdefault
"编码设置
set enc=utf-8
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set laststatus=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

"ctags插件
set tags=/Users/renqiang/Documents/Develop/python/trunk/tags
set tags=/Users/renqiang/Documents/workspace/AsiainfoWorkspace/nWeb662/tags
set tags=/Users/renqiang/Documents/workspace/AsiainfoWorkspace/nMsm662/tags

"TagList插件
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"自动开启taglist
let Tlist_Auto_Open=0

"winmanager插件
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:AutoOpenWinManager=1
let g:winManagerWidth=50
let g:defaultExplorer=1
nmap wt :WMToggle<cr>


autocmd filetype python set omnifunc=pythoncomplete#Complete

filetype plugin indent on


map <F5> :call CompileRunGcc()<CR>
func!  CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
	elseif &filetype == 'go'
		exec "!time go run %"
	endif
endfunc


"jedi-vim
let g:jedi#goto_command = 'd'
let g:jedi#goto_assignments_command = 'g'
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "r"
let g:jedi#popup_on_dot = 1
