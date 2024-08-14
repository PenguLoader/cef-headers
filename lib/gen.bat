@echo off
setlocal enabledelayedexpansion

set SPACES=  

set libname=libcef

set input=win\%libname%.dll
set output=win\%libname%.lib

set dump_file=tmp\%libname%.dump
set def_file=tmp\%libname%.def

mkdir tmp
dumpbin /EXPORTS %input% > %dump_file%

echo LIBRARY > %def_file%
echo EXPORTS >> %def_file%

for /F "tokens=4" %%A in ('findstr "cef_" %dump_file%') do (
    @echo %SPACES%%%A >> %def_file%
)

lib /def:%def_file% /machine:x64 /out:%output%

del /s /q win\*.exp
del /s /q tmp\*
rmdir tmp