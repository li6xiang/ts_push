del tags cscope.in.out cscope.out cscope.po.out cscope.files
dir /s /b *.c *.h *.C *.H *.S *.s *.cc *.hh *.cpp> cscope.files
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -L cscope.files
REM  set path=C:\Program Files (x86)\Vim\vim81;E:\mstar\MSC8336\Cygwin\App\Runtime\Cygwin\bin
cscope -b -k
