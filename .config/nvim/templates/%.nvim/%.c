#include <lauxlib.h>

static int {{ expand('%:p:h:t:r') }}(lua_State *L) {
  return 1;
}

static const luaL_Reg functions[] = {
    {"{{ expand('%:p:h:t:r') }}", {{ expand('%:p:h:t:r') }}},
    {NULL, NULL},
};

int luaopen_{{ expand('%:p:h:t:r') }}(lua_State *L) {
#if LUA_VERSION_NUM == 501
  luaL_register(L, "{{ expand('%:p:h:t:r') }}", functions);
#else
  luaL_newlib(L, functions);
#endif
  return 1;
}
