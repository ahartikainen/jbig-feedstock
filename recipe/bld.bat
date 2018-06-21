# Patch (support old gcc)
bash "sed -i.bak 's/-Wno-unused-result//g' Makefile"

# Build
bash "make lib"

# Test
bash "make test"

# Install
bash "mkdir -p \"${PREFIX}/lib\" \"${PREFIX}/include\""
bash cp "libjbig/*.a \"${PREFIX}/lib\""
bash cp "libjbig/*.h \"${PREFIX}/include\""
