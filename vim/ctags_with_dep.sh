#!/bin/bash

# ./ctags_with_dep.sh file1.c file2.c ... to generate a tags file for these files.


echo `find -name "*.cpp"`

gcc -M `find -name "*.cpp"` | sed -e 's/[\\ ]/\n/g' | \
        sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
        ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q /usr/include
