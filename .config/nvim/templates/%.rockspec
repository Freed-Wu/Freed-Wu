---{{ join(split(expand('%:t:r'), '-')[0:-3], '-') }}
-- luacheck: ignore 111
-- LuaFormatter off

-- LuaFormatter on
---@diagnostic disable: lowercase-global
package = "{{ join(split(expand('%:t:r'), '-')[0:-3], '-') }}"
version = "{{ join(split(expand('%:t:r'), '-')[-2:], '-') }}"
source = {
    url = "{{ g:snips_github }}/{{ join(split(expand('%:t:r'), '-')[0:-3], '-') }}.lua",
}
description = {
    summary = "",
    detailed = [[{% here %}]],
    homepage = "{{ g:snips_github }}/{{ join(split(expand('%:t:r'), '-')[0:-3], '-') }}",
    license = "GPL3 <https://www.gnu.org/licenses>"
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {["prompt-style"] = "prompt-style.lua"}
}
