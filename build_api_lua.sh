#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
API_DIR="$DIR/api/lua"
cd "$API_DIR"

lua_binary="${LUA_BINARY:-lua}"

if ! command -v "$lua_binary" &>/dev/null; then
    if [[ -z "${LUA_BINARY+x}" ]]; then
        echo "lua binary not found; please set \$LUA_BINARY manually."
    else
        echo "lua binary not found: $lua_binary"
    fi
    exit 1
fi

if ! command -v "$lua_binary" &>/dev/null; then
    echo "luarocks not found"
    exit 1
fi

lua_version="$("$lua_binary" -v | grep -Po '^Lua \K(\d+)\.(\d+)')"
echo "Detected lua version $lua_version"

# Install dependencies (npm style)
# NOTE: you need to have lua header files installed.
# On debian-based distros: apt install libluaX.X-dev

luarocks_args=(
    "--tree"
    "$API_DIR/lua_modules"
    "--lua-version"
    "$lua_version"
)

(
    cd $DIR/libs/ldoc
    luarocks ${luarocks_args[@]} make
)

(
    cd "$API_DIR/LuaDocsGenerator"

    if ! command -v "dotnet" &>/dev/null; then
        echo "dotnet not found"
        exit 1
    fi

    dotnet build
    dotnet run --no-build
)

ldoc_path=$API_DIR/lua_modules/bin/ldoc

if [[ ! -x "$ldoc_path" ]]; then
    echo "ldoc not found"
    exit 1
fi

cd $API_DIR

rm -rf $DIR/build/api/lua
mkdir $DIR/build/api/lua

"$ldoc_path" .

cp -r ./js/. $DIR/build/api/lua
cp -r ./css/. $DIR/build/api/lua