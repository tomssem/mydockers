CPP_VERSION=10
INC_DIR=/usr/include/c++/$CPP_VERSION
CPP_TARGET=x86_64-linux-gnu
SYSTEM=/usr/lib/gcc/x86_64-linux-gnu/10/include

ctags -f cpp_tags --c-kinds=cdefgmstuv --c++-kinds=cdefgmstuv --fields=+iaSmKz --extra=+q --langmap=c++:+.tcc. --languages=c,c++ -I "_GLIBCXX_BEGIN_NAMESPACE_VERSION _GLIBCXX_END_NAMESPACE_VERSION _GLIBCXX_VISIBILITY+" -n $INC_DIR/* /usr/include/$CPP_TARGET/c++/$CPP_VERSION/bits/* /usr/include/$CPP_TARGET/c++/$CPP_VERSION/ext/* $INC_DIR/bits/* $INC_DIR/ext $SYSTEM/* $SYSTEM2/*

