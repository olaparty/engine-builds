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

# disable dart timeline
sed -i '' -e "s/#define SUPPORT_TIMELINE 1/#define SUPPORT_TIMELINE 0/g"  engine/src/third_party/dart/runtime/vm/globals.h
cat engine/src/third_party/dart/runtime/vm/globals.h

#include "third_party/dart/runtime/include/dart_api.h"
cp patches/32106.diff engine/src/flutter/
cd engine/src/flutter 

#ls -al shell/gpu

git apply 32106.diff

git status

