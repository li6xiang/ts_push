set encoding=utf-8
" set termencoding=gb18030
" "set fileencoding=chinese 
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set nocp
filetype plugin on
filetype indent on
filetype on
set title

set nocompatible                 "去掉有关vi一致性模式，避免以前版本的bug和局限    
set history=1000                  "记录历史的行数
set autoindent                       "vim使用自动对齐，也就是把当前行的对齐格式应用到下一行(自动缩进）
set cindent                             "（cindent是特别针对 C语言语法自动缩进）
set smartindent                    "依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用   
set tabstop=4                        "设置tab键为4个空格，
set shiftwidth =4                   "设置当行之间交错时使用4个空格     
set showmatch                     "设置匹配模式，类似当输入一个左括号时会匹配相应的右括号      
set guioptions-=T                 "去除vim的GUI版本中得toolbar   
set vb t_vb=                            "当vim进行编辑时，如果命令错误，会发出警报，该设置去掉警报       
set ruler                                  "在编辑过程中，在右下角显示光标位置的状态行     
set incsearch                        "在程序中查询一单词，自动匹配单词的位置；如查询desk单词，当输到/d时，会自动找到第一个d开头的单词，当输入到/de时，会自动找到第一个以ds开头的单词，以此类推，进行查找；当找到要匹配的单词时，别忘记回车
set backspace=2           " 设置退格键可用
"修改一个文件后，自动进行备份，备份的文件名为原文件名加“~”后缀
"if has("vms")
"	set nobackup
"else
"	set backup
"endif

set nu
set ai
set ts=4
set tags=tags
"十字光标
set cursorline
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" highlight search
set hlsearch
" set cscope
set csto=0
set nocst
set nocsverb
cs add cscope.out
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-Space><C-Space>s
		\:vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g
		\:vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c
		\:vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t
		\:vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e
		\:vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i
		\:vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space><C-Space>d
		\:vert scs find d <C-R>=expand("<cword>")<CR><CR>

nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
syntax enable
"set t_Co=256
"set background=dark
"colorscheme molokai
syntax on

"colorscheme github
"hi Function term=underline cterm=bold ctermfg=LightGray
	
" shift+f 查取单词

function! Mydict()
	let expl=system('sdcv -n ' .
		\  expand("<cword>"))
	windo if
		\ expand("%")=="diCt-tmp" |
		\ q!|endif
	25vsp diCt-tmp
	setlocal buftype=nofile bufhidden=hide noswapfile
	1s/^/\=expl/
	1
endfunction
nmap F :call Mydict()<CR>

"-- omnicppcomplete setting --
"" 按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
imap <C-K> <C-X><C-O>
" 按下F2根据头文件内关键字补全
imap <C-J> <C-X><C-I>
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 1 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

"vim 配色
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
"let g:cpp_no_function_highlight = 1

"使dd仅仅删除不复制
nnoremap dd "_dd


function! Refresh_tag_and_rest_connect()
	exec "!mytag.sh"
	exec "cs reset"
endfunction
map <F5> :call Refresh_tag_and_rest_connect()<CR>

"注释插件配置
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a	region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" 语法检测插件配置
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
			\ "mode": "passive",
			\ "active_filetypes": [],
			\ "passive_filetypes": [] }

nmap <Tab> %
"set path to current dir ,so gf can find head file
let &path .= getcwd().'/**'
nnoremap gf :vsp<CR>gf

" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle()"
" 加入注释
func SetComment()
	call setline(1,"/*================================================================")
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
	call append(line(".")+1, "*   ")
	call append(line(".")+2, "*   文件名称：".expand("%:t"))
	call append(line(".")+3, "*   创 建 者：lixiang fire")
	call append(line(".")+4, "*   创建日期：".strftime("%Y年%m月%d日"))
	call append(line(".")+5, "*   描    述：")
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/")
	call append(line(".")+8, "")
	call append(line(".")+9, "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
	call setline(3, "#================================================================")
	call setline(4, "#   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
	call setline(5, "#   ")
	call setline(6, "#   文件名称：".expand("%:t"))
	call setline(7, "#   创 建 者：lixiang fire")
	call setline(8, "#   创建日期：".strftime("%Y年%m月%d日"))
	call setline(9, "#   描    述：")
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
	call setline(13, "")
endfunc
" 定义函数SetTitle，自动插入文件头
func SetTitle()
	if &filetype == 'make'
		call setline(1,"")
		call setline(2,"")
		call SetComment_sh()

	elseif &filetype == 'sh'
		call setline(1,"#!/bin/sh")
		call setline(2,"")
		call SetComment_sh()

	else
		call SetComment()
		if expand("%:e") == 'hpp'
			call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_HPP_")
			call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_HPP_")
			call append(line(".")+12, "#ifdef __cplusplus")
			call append(line(".")+13, "extern \"C\"")
			call append(line(".")+14, "{")
			call append(line(".")+15, "#endif")
			call append(line(".")+16, "")
			call append(line(".")+17, "#ifdef __cplusplus")
			call append(line(".")+18, "}")
			call append(line(".")+19, "#endif")
			call append(line(".")+20, "")
			call append(line(".")+21, "")
			call append(line(".")+22, "")
			call append(line(".")+23, "#endif //".toupper(expand("%:t:r"))."_HPP")

		elseif expand("%:e") == 'h'
			call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H_")
			call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H_")
			call append(line(".")+12, "")
			call append(line(".")+13, "")
			call append(line(".")+14, "")
			call append(line(".")+15, "#endif //".toupper(expand("%:t:r"))."_H")
			" call append(line(".")+10, "#pragma once")
		elseif &filetype == 'c'
			call append(line(".")+10,"#include \"".expand("%:t:r").".h\"")
		elseif &filetype == 'cpp'
			call append(line(".")+10, "#include \"".expand("%:t:r").".h\"")
		endif
	endif
endfunc


function! Mysearch()
	let mycmd = 'grep -rn '.expand("<cword>").' ./'.'  --exclude=".*" --exclude="*.tmp" --exclude="*.o"'
	silent execute mycmd
endfunction
map gs :call Mysearch()<CR><C-O>:botright cwindow<CR><C-W>j<C-L>
" let g:EasyGrepRecursive = 1
" let g:EasyGrepWindowPosition = botright
" let g:EasyGrepCommand = 1
" let g:EasyGrepJumpToMatch = 0
