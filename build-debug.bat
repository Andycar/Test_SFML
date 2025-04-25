@echo off
set SZ_SFML_ROOT=D:/SDK/SFML3
set SZ_SFML_ROOTDLL=D:\SDK\SFML3\bin
call "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
@REM set compilerflags=/Od /Zi /EHsc /std:c++latest /I include
set compilerflags=/Od /Zi /EHsc /std:c++17 /I %SZ_SFML_ROOT%/include/
set linkerflags=/OUT:bin\main.exe /LIBPATH:%SZ_SFML_ROOT%/lib sfml-window-d.lib sfml-graphics-d.lib sfml-system-d.lib

cl.exe %compilerflags% src\*.cpp /link %linkerflags%
del bin\*.ilk *.obj *.pdb
copy %SZ_SFML_ROOTDLL%\sfml-graphics-d-3.dll bin\
copy %SZ_SFML_ROOTDLL%\sfml-window-d-3.dll bin\
copy %SZ_SFML_ROOTDLL%\sfml-system-d-3.dll bin\