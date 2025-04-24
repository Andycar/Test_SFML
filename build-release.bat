@echo off
set SFMLpath=D:/SDK/SFML3
set SFMLpathDLL=D:\SDK\SFML3\bin
call "c:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
@REM set compilerflags=/O2 /EHsc /std:c++latest /I include
set compilerflags=/O2 /GL /EHsc /std:c++17 /I %SFMLpath%/include/
set linkerflags=/OUT:bin\main.exe /OPT:REF /OPT:ICF /LTCG /INCREMENTAL:NO /DYNAMICBASE /LIBPATH:%SFMLpath%/lib sfml-window.lib sfml-graphics.lib sfml-system.lib

cl.exe %compilerflags% src\*.cpp /link %linkerflags%
del *.obj *.pdb
copy %SFMLpathDLL%\sfml-graphics-3.dll bin\
copy %SFMLpathDLL%\sfml-window-3.dll bin\
copy %SFMLpathDLL%\sfml-system-3.dll bin\