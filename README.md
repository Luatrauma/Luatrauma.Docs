# Luatrauma.Docs

This is the documentation source hosted at https://luatrauma.github.io/Luatrauma.Docs/

## How to build

This documentation has three components:

The manual, which uses mkdocs.
The CSharp API documentation, which uses doxygen.
The Lua API documentation, which uses ldoc.

Note all of the build scripts are written for Linux (windows is a fucking pain), so if you are on Windows, you can use WSL to run the scripts.

### Manual

To build the manual, you need to have material for mkdocs installed. You can install it with pip:

```bash
pip install mkdocs-material
```

Now you can just run `./serve_manual.sh` to build and serve the manual.

### CSharp API

Run `install_doxygen.sh` first and then run `build_api_cs.sh`, the documentation files will be generated at `build/api/cs/client` and `build/api/cs/server`.

### Lua API

First make sure you have Lua 5.2, Lua headers and Luarocks installed in your system.

Run `build_api_lua.sh`, the documentation files will be generated at `build/api/lua/`.