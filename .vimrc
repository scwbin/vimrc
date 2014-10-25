""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"                                                       .vimrc By scwbin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置菜单语言
set langmenu=zh_CN

"启动时不显示捐赠提示
set shortmess=atl

" 在所有模式下都允许使用鼠标，还可以是n,v,i,c等             
"set mouse=a   

" 设定VIM默认工作目录
lcd ~/Documents/CODE/ 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    -> 常规设定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 检测文件类型
filetype on

" 检测文件类型插件，实现全能补全功能                 
filetype plugin indent on

" 设置leader为,
let mapleader = ","
let g:mapleader = ","

" 自动重新读入
set autoread  

" 不兼容vi模式      
set nocompatible 

" 覆盖文件时不备份           
set nobackup    

" 保留历史记录            
set history=500   

" 显示行号         
set number                 

" 状态栏显示目前所执行的指令
set showcmd

" 搜索时忽略大小写
set ignorecase

" 有一个或以上大写字母时仍大小写敏感              
set smartcase

" 实时搜索，逐字符显示搜索结果               
set incsearch 

" 高亮显示搜索结果              
set hlsearch 

" 搜索到文件两端时不重新搜索               
set nowrapscan 

" 在状态行上显示光标所在位置的行号和列号              
set ruler   

" 标尺格式                
set rulerformat=%15(%c%V\ %p%%%) 

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l       

" 不设定在插入状态无法用退格键和 Delete 键删除回车符      
set backspace=eol,start,indent      

" 自动语法高亮
syntax on
syntax enable

" 控制台响铃
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" 快速保存
nmap <leader>w :w!<cr>

" 在编辑模式下实现撤消
inoremap <C-U> <C-G>u<C-U>  

" 不要使用Ex模式，使用Q格式化
map Q gq  

" 快速重载.gvimrc文件                  
map <silent> <leader>s :source ~/.gvimrc<cr>

" 快速编辑.gvimrc文件    
map <silent> <leader>ee :e ~/.gvimrc<cr>

" 当.gvimrc文件编辑完成自动重新加载        
autocmd! bufwritepost .vimrc source ~/.gvimrc   

" 当启动Evim时，evim.vim已经做了这些设置
if v:progname =~? "evim"
  finish
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM用户界面
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 上下可视行数
set scrolloff=6

"显示括号配对情况
set showmatch

" 增强模式中的命令行自动完成操作 
set wildmenu

" 设定命令行的行数
set cmdheight=2

" 设置在状态行显示的信息
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" 解决自动换行格式下, 如高度在折行之后超过窗口高度结果这一行看不到的问题
set display=lastline

" 当运行宏时，不重绘 
set lazyredraw

" 使用正则时，除了$ . * ^以外的元字符都要加反斜线
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" 显示Tab符
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" Alt-W切换自动换行
"noremap <a-w> :exe &wrap==1 ? 'set nowrap' : 'set wrap'<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 配色方案及字体设定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定配色方案
set background=dark
colorscheme desert

"自动补全窗口的配色
"Pmenu 是所有项的配色
"PmenuSel 是选中项的配色
"guibg 和 guifg 分别对应背景色和前景色
highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black


" 设置为utf8作为标准的标准语言的编码
set encoding=utf8

"设置提示信息语言
language messages zh_CN.utf-8

" 使用Unix文件类型作为标准
set ffs=unix,dos,mac

" 多语言环境，默认为 UTF-8 编码
if has("multi_byte")

    if has('win32')
        language english
        let &termencoding=&encoding
    endif

    set fencs=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "这个版本的(G)Vim不能被multi_byte编译！"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件操作及备份
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动切换当前目录为当前文件所在的目录
set autochdir

" 关闭文件备份
set nowb

" 关闭交换文件
set noswapfile

" 选中模式 Ctrl+c 复制选中的文本
"vnoremap <c-c> "+y

" 普通模式下 Ctrl+c 复制文件路径
"nnoremap <c-c> :let @+ = expand('%:p')<cr>

" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set hidden

" 忽略编译后的文件
set wildignore=*.o,*~,*.pyc

"blank      空白
"buffers    缓冲区
"curdir     当前目录
"folds      折叠
"help       帮助
"options    选项
"tabpages   选项卡
"winsize    窗口大小
"slash      转换文件路径中的\为/以使session文件兼容unix
"unix       设置session文件中的换行模式为unix
"set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,slash,unix,resize

if has("autocmd")

  augroup vimrcEx
  au!

  " 对于所有的文本文件textwidth设置80个字符。
  autocmd FileType text setlocal textwidth=80

  " 恢复上次文件打开位置
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" 使用":DiffOrig"查看当前缓冲区和它刚从文件里载入时的不同之处。
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文本，制符表及缩进相关项
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定 tab 长度为 4
set tabstop=4

" 设定 << 和 >> 命令移动时的宽度为 4
set shiftwidth=4

" 设置按BackSpace的时候可以一次删除掉4个空格
set softtabstop=4

" 使用空格代替制表符
set expandtab

" 在行和段开始处使用制表符
set smarttab

" 不突出显示当前行
set nocursorline

" 删除所有行未尾空格
nnoremap <f10> :%s/[ \t\r]\+$//g<cr>

" 自动换行
set wrap 

" 代码折叠方式为 自动
"set foldmethod=syntax

"设置代码折叠方式为 手工
"set foldmethod=indent

"设置代码块折叠后显示的行数
"set foldexpr=1

" 自动缩进
set autoindent

" 智能自动缩进
set smartindent

" 行控制
set linebreak
set textwidth=80


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 可视化模式相关项
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在图形模式下运行时额外的设置选项
if has("gui_running")
    set guioptions-=T " 隐藏工具栏
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    "set guioptions-=m " 隐藏菜单栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    "set guioptions-=b " 隐藏底部滚动条
    "set showtabline=0 " 隐藏Tab栏

    " 只显示菜单
    "set guioptions=mcr
    
    " 显示状态栏 (默认值为 1, 无法显示状态栏)
    set laststatus=2

    " 标签页
    set showtabline=2

    " Specify the behavior when switching between buffers 
    try
        set switchbuf=useopen,usetab,newtab
        set showtabline=2
      catch
    endtry
endif

" 图形界面
if has('gui_running')
    if has("win32") 
        " Windows 兼容配置
        source $VIMRUNTIME/mswin.vim

        " F11 最大化
        map <f11> :call libcallnr('fullscreen.dll', 'ToggleFullScreen', 0)<cr>

        " Windows字体配置
        exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h11:cANSI'
        exec 'set guifontwide='.iconv('微软雅黑', &enc, 'gbk').':h11'
    endif

    if has("unix") && !has('gui_macvim')
        " Linux字体配置
        set guifont=Courier\ 10\ Pitch\ 11
        set guifontwide=YaHei\ Consolas\ Hybrid\ 11
    endif
      
    if has("mac") || has("gui_macvim")
        " Mac字体配置
        set guifont=Courier\ New:h14.00
        "set guifontwide=Monaco\ YouYuan\ Droid\ Sans\ Mono\ YaHei\ Consolas\ Hybrid
    endif
endif

" Mac下的图形界面(MacVim)
if has("gui_macvim")
    
    " Mac 下，按 ,ff 切换全屏
    map <silent> <Leader>ff :call FullScreenToggle()<cr>

    " 让 xcin 在 insert mode 不自动出现(gvim)
    set imdisable

    " Set QuickTemplatePath
    let g:QuickTemplatePath = $HOME.'/.vim/templates/'
    
    "set transparency=4
    set lines=42 columns=158

    let s:lines=&lines
    let s:columns=&columns
    func! FullScreenEnter()
        set lines=999 columns=999
        set fu
    endf

    func! FullScreenLeave()
        let &lines=s:lines
        let &columns=s:columns
        set nofu
    endf

    func! FullScreenToggle()
        if &fullscreen
            call FullScreenLeave()
        else
            call FullScreenEnter()
        endif
    endf
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 移动，标签，窗口及缓冲区
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 标签相关的快捷键 Ctrl
map tn :tabnext<cr>             " 下一个标签
map tp :tabprevious<cr>         " 上一个标签
map <leader>tn :tabnew<cr>      " 新建标签
map <leader>to :tabonly<cr>     " 
map <leader>tc :tabclose<cr>    " 关闭标签
map <leader>tm :tabmove         " 移动标签
map gf :tabnew <cfile><cr>      " 在文件名上按gf时，在新的tab中打开

" 使用 <C-h、j、k、l> 向"左,下,上,右"切换窗口<C-ww>顺序切换窗口
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 关闭最近的Buffer
map <leader>bc :Bclose<cr>

" 关闭所有的Buffers
map <leader>ba :1,1000 bd!<cr>

" 关闭前记住打开的Buffers
set viminfo^=%

" 在最近的Buffer路径下打开一个新的Table
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" 快速进入当前Buffer文件的目录
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Quickly open a buffer for scripbble
map <leader>bo :e ~/buffer<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" 空格键<space>作为/向下搜索，Ctrl-<Space>作为?向上搜索
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed 
map <silent> <leader><cr> :noh<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编辑映射
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" 整行上下移动移动Comand+j/k
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" 新建 XHTML、Java、Text文件的快捷键
nmap <C-c><C-h> :NewQuickTemplateTab xhtml<cr>
nmap <C-c><C-j> :NewQuickTemplateTab java<cr>
nmap <C-c><C-t> :NewQuickTemplateTab text<cr>

" 括号自动补全
" AutoCmd
if has("autocmd")

    func! AutoClose()
        :inoremap ( ()<ESC>i
        ":inoremap " ""<ESC>i
        ":inoremap ' ''<ESC>i
        :inoremap { {}<ESC>i
        :inoremap [ []<ESC>i
        :inoremap ) <c-r>=ClosePair(')')<CR>
        :inoremap } <c-r>=ClosePair('}')<CR>
        :inoremap ] <c-r>=ClosePair(']')<CR>
    endf

    func! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
            return "\<Right>"
        else
            return a:char
        endif
    endf
endif
    "auto close quotation marks for PHP, Javascript, etc, file
    au FileType java,c,python,javascript exe AutoClose()

" 快去启动取消拼写检查
map <leader>ss :setlocal spell!<cr>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM搜索及显示
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To  to the previous search results do:
"   <legoader>p
"
"map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM插件设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Plugins list
"    --> A.VIM
"    --> C.VIM
"    --> TagList
"    --> NERDTree
"    --> Cscope
"    --> LookupFile
"    --> OmniCppComplete
"    --> nerd_commenter
"    --> SuperTab
"    --> MiniBufExplorerr
"    --> Calendar
"    --> Color Scheme Explore
"
""""""""""""""""""""""""""""""""""""""""
" --> TagList插件设定
""""""""""""""""""""""""""""""""""""""""
set tags=tags; 
map <leader>t :Tlist <cr>
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1     " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1   " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1  " 在右侧窗口中显示taglist窗口

""""""""""""""""""""""""""""""""""""""""
" --> NERD_tree插件设定
""""""""""""""""""""""""""""""""""""""""
" let loaded_nerd_tree=1        " 禁用所有与NERD_tree有关的命令
map <leader>n :NERDTreeToggle<cr>
let NERDTreeQuitOnOpen=1        " 打开文件后, 关闭NERDTrre窗口
let NERDTreeWinSize=30          " 设定NERDTree窗口宽度
let NERDTreeCaseSensitiveSort=0 " 不分大小写排序
"let NERDTreeShowHidden=1        " 0/1(不)显示隐藏文件
nmap <silent> <leader>fe :Sexplore!<cr> 

""""""""""""""""""""""""""""""""""""""""
" --> Cscope插件设定
""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/local/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " 加载最近目录下的cscope.out数据库
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif
"cscope插件快捷键设定
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""""""""
" --> lookupfile 插件设置 
""""""""""""""""""""""""""""""""""""""""
"let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
"let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
"let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
"let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
"let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"let g:LookupFile_SortMethod = ""                "关闭对搜索结果的字母排序

"设置LookupFileTag文件的名字
"if filereadable("/home/scwbin/linux-2.6.34-rc4/filenametags")
"let g:LookupFile_TagExpr ='"/home/scwbin/linux-2.6.34-rc4/filenametags"'
"endif

""""""""""""""""""""""""""""""""""""""""
" --> OmniCppComplete 插件设定 
""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone
let OmniCpp_DisplayMode=1
let OmniCpp_MayCompleteDot = 1      " autocomplete with .
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_SelectFirstItem = 2     " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2     " search namespaces in this and included files
let OmniCpp_MayCompleteArrow = 1    " autocomplete with ->
let OmniCpp_MayCompleteScope = 1    " autocomplete with ::
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_DefaultNamespaces=["std"]

""""""""""""""""""""""""""""""""""""""""
" --> 其他插件配置
""""""""""""""""""""""""""""""""""""""""
map cal :Calendar
map cse :ColorSchemeExplorer
let g:SuperTabDefaultCompletionType =  "<C-X><C-O>" " 设置按下<Tab>后默认的补全方式<C-X><C-O>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 杂项
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 功能函数
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" 如果粘贴模式已启用则返回true
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" 删除一个缓冲区时不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" 返回当前时间
func! GetTimeInfo()
    "return strftime('%Y-%m-%d %A %H:%M:%S')
    return strftime('%Y-%m-%d %H:%M:%S')
endfunction

" 插入模式按 Ctrl + D(ate) 插入当前时间
imap <C-d> <C-r>=GetTimeInfo()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       =>by scwbin                                                   
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
