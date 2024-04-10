@echo off
rem run in vs command prompt

mkdir tmp

dumpbin /EXPORTS libName.dll > tmp\libName.exports
rem TODO: make exports.def file

lib /def:tmp/exports.def /machine:x64 /out:libName.lib

rmdir tmp