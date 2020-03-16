#!/bin/sh
set -x

rm tags cscope.in.out cscope.out cscope.po.out cscope.files
dir=$(pwd)
#includefile=" -name '*.[ch]' -o -name '*.cpp' "
ignoredir="-path "$dir/build/" -prune -o "


#find `pwd` $ignoredir -name "*.[csSh]" -o -name "*.cpp" -o -name "*.hh" -o -name "*.cc" -o -name Makefile > cscope.files
find `pwd` -path "$dir/build" -prune -o \
	-name "*.[csCShH]" -print -o\
	-name "*.cpp" -print -o\
	-name "*.hh" -print -o\
	-name "*.cc" -print -o\
	-name Makefile  -print> cscope.files
#sed -i 's/[ ]/\\ /g' cscope.files
ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q -L cscope.files
sed -i 's/^/"/;s/$/"/' cscope.files
cscope -b -q -k
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=build/*
#sed -i 's/^/"/;s/$/"/' cscope.files

#find $dir $ignoredir  $includefile -print > cscope.files;
