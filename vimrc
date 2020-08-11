"语法高亮"
syntax on			" 当前配置缺省时则用vim的缺省值覆盖
"set cul				" 高亮光标所在行
"set cuc				" ............列
set scrolloff=5		" 光标移动到buffer的顶部和底部保持3行距离
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2	" 显示状态行
set nocompatible	" 去掉有关vi一致性的模式
if version >= 603	" 显示中文帮助
    set helplang=cn
    set encoding=utf-8
endif
set nu				" 设置行号
set autoindent		" 自动缩进
set cindent
set tabstop=4		" Tab宽度
set softtabstop=4	" 统一缩进为4           ""
set shiftwidth=4                              "使<和>命令正常工作
set expandtab		" 使用空格代替制表符    ""
set smarttab        " 在行和段开始处使用制表符
"set foldmethod=indent   " 按缩进折叠
set foldmethod=manual   "手工定义折叠
set history=1000    " 历史记录数
set hlsearch        " 搜索逐字符高亮
set incsearch
set langmenu=zh_CN.UTF-8    " 语言设置
set helplang=cn
filetype on         " 侦测文件类型
filetype plugin on  " 载入文件类型插件 
filetype indent on  " 为特定文件载入相关缩进文件
set iskeyword+=_,$,@,%,#,-  " 带有这些符号的单词不要被换行分割
inoremap jj <esc>	            " 映射jj为<esc>
nnoremap <F2> :g/^\s*$/d<CR>    " 去空行
"C，C++,Python,bash,Java,HTML,go,mkd 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
set autowrite       " 自动保存 
set nobackup        " 禁止生成临时文件
set noswapfile
" 解决中文显示乱码问题
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb1830
