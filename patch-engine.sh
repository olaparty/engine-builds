set -e
# curl -O https://raw.githubusercontent.com/graphitemaster/incbin/main/incbin.h
# echo -e "\n" >> incbin.h
# cp main.gn engine/src/flutter/BUILD.gn
# cp incbin.h engine/src/flutter/shell/platform/embedder/
# echo "
# #define INCBIN_SILENCE_BITCODE_WARNING
# #include \"incbin.h\"
# INCBIN(Icudtl, \"${PWD}/engine/src/third_party/icu/flutter/icudtl.dat\");
# " >> engine/src/flutter/shell/platform/embedder/embedder.cc

cp patches/skia_patch.diff engine/src/flutter/
cd engine/src/flutter 

#ls -al shell/gpu

git apply skia_patch.diff

gclient sync --no-history -r

git status
cd engine/src/third_party/skia 
git rev-list --max-parents=0 HEAD
cd -
