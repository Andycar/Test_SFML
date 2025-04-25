@echo off
set SZ_SFML_ROOT=D:/SDK/SFML3
set SZ_SFML_ROOTDLL=D:\SDK\SFML3\bin
call "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
@REM set compilerflags=/O2 /EHsc /std:c++latest /I include
set compilerflags=/O2 /GL /EHsc /std:c++17 /I %SZ_SFML_ROOT%/include/
set linkerflags=/OUT:bin\main.exe /OPT:REF /OPT:ICF /LTCG /INCREMENTAL:NO /DYNAMICBASE /LIBPATH:%SZ_SFML_ROOT%/lib sfml-window.lib sfml-graphics.lib sfml-system.lib

cl.exe %compilerflags% src\*.cpp /link %linkerflags%
del *.obj *.pdb
copy %SZ_SFML_ROOTDLL%\sfml-graphics-3.dll bin\
copy %SZ_SFML_ROOTDLL%\sfml-window-3.dll bin\
copy %SZ_SFML_ROOTDLL%\sfml-system-3.dll bin\

bin\main.exe