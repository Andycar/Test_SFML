@echo off
set SFMLpath=D:/SDK/SFML3
set SFMLpathDLL=D:\SDK\SFML3\bin
call "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
@REM set compilerflags=/Od /Zi /EHsc /std:c++latest /I include
set compilerflags=/Od /Zi /EHsc /std:c++17 /I %SFMLpath%/include/
set linkerflags=/OUT:bin\main.exe /LIBPATH:%SFMLpath%/lib sfml-window-d.lib sfml-graphics-d.lib sfml-system-d.lib

cl.exe %compilerflags% src\*.cpp /link %linkerflags%
del bin\*.ilk *.obj *.pdb
copy %SFMLpathDLL%\sfml-graphics-d-3.dll bin\
copy %SFMLpathDLL%\sfml-window-d-3.dll bin\
copy %SFMLpathDLL%\sfml-system-d-3.dll bin\