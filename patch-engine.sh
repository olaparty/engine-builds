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

cp patches/ios_emoji_textinput.diff engine/src/flutter/
cd engine/src/flutter 

git apply ios_emoji_textinput.diff
git status

cd ../third_party/skia 
curl https://github.com/google/skia/commit/6f70deed3a8af62b2c0d0c69c481d2f5393339bf.diff -o patch.diff
git apply patch.diff
git status

cd -
