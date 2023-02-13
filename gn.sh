set -e
DEPOT_TOOLS_PATH="${PWD}/depot_tools"
ENGINE_PATH="${PWD}/engine"
export PATH="$PATH:$DEPOT_TOOLS_PATH"
export ANDROID_HOME=$ENGINE_PATH/src/third_party/android_tools/sdk

cd $ENGINE_PATH/src
./flutter/tools/gn $@
