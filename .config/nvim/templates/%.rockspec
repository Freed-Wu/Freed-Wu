---{{ join(split(expand('%:t:r'), '-')[0:-3], '-') }}
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
    modules = {["{{ join(split(expand('%:t:r'), '-')[0:-3], '-') }}"] = "{{ join(split(expand('%:t:r'), '-')[0:-3], '-') }}.lua"}
}
