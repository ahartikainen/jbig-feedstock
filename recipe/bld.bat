IF "%ARCH%" == "64" (
set GCC_ARCH=x86_64-w64-mingw32
set EXTRA_FLAGS=-DMS_WIN64
) else (
set GCC_ARCH=i686-w64-mingw32
)

set CFLAGS="-I$PREFIX/include $CFLAGS"
set CPPFLAGS="-I$PREFIX/include $CPPFLAGS"
set LDFLAGS="-L$PREFIX/lib $LDFLAGS"

# Patch (support old gcc)
bash -lc "sed -i.bak 's/-Wno-unused-result//g' Makefile"

# Build
bash -lc "make lib"

# Test
bash -lc "make test"

# Install
bash -lc "mkdir -p \"${PREFIX}/lib\" \"${PREFIX}/include\""
bash -lc "cp libjbig/*.a \"${PREFIX}/lib\""
bash -lc "cp libjbig/*.h \"${PREFIX}/include\""
