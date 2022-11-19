if not %0==MS_ASM386.cmd ren %0 MS_ASM386.cmd
mode 95,30
@echo off
cls
Title Assembler .386 --- Prepared by: Ass. Prof. Mina S. Younan
echo ---------------------------( Assembler .386 )----------------------------(2021)
echo   - Courese code  : CS318	
echo   - Courese title : Assembly Programming Language
echo   - Prepared by   : Ass. Prof. Mina S. Younan
echo   - Email	  : mina.younan@mu.edue.eg
echo -------------------------------------------------------------------------(Files)
set /p FileName=".   Enter Assembly File name without extension: "
echo   --------------------------------------- 
echo   - Source code file:	%FileName%.asm
echo   - Object file: 	%FileName%.obj
echo   - Listing file: 	%FileName%.lst
echo   - Execution file:	%FileName%.exe
echo -------------------------------------------------------------------------(Run)
ml /c /coff /Zi /Fl %FileName%.asm
link /debug /subsystem:console /entry:start /out:%FileName%.exe %FileName%.obj io.obj kernel32.lib
CALL %FileName%
echo -------------------------------------------------------------------------(End)
pause