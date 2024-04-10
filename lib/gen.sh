#!/bin/bash

mkdir -p tmp

nm -gU libName.dylib | awk '{ $1 = substr($3, 2) } { print "void " $1 "() {}" }' > tmp/exports.c
clang -arch x86_64 -shared -dynamiclib -o libName.d.dylib tmp/exports.c

rmdir tmp