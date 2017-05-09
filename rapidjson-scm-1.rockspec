package = "rapidjson"
version = "scm-1"
local v = version:gsub("%-%d", "")
source = {
  url = "git://github.com/tvbeat/lua-rapidjson",
  branch = "master"
}
description = {
  summary = "Json module based on the very fast RapidJSON.",
  detailed = "A json module for Lua 5.1/5.2/5.3 and LuaJIT based on the very fast RapidJSON.",
  homepage = "https://github.com/xpol/lua-rapidjson",
  license = "MIT"
}
dependencies = {
  "lua >= 5.1"
}
build = {
  type = "cmake",
  variables = {
    CMAKE_CXX_FLAGS = "$(CFLAGS)",
    CMAKE_MODULE_LINKER_FLAGS = "$(LIBFLAG)",
    BUILD_SHARED_LIBS = "ON",
    CMAKE_INSTALL_PREFIX = "$(PREFIX)",
    LUA_INCLUDE_DIR = "$(LUA_INCDIR)",
    LUA_RAPIDJSON_VERSION = v,
  },
  platforms = { windows = { variables = {
    LUA_LIBRARIES = "$(LUA_LIBDIR)/$(LUALIB)"
  }}}
}
