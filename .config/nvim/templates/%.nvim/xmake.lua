-- luacheck: ignore 113
---@diagnostic disable: undefined-global
add_rules("mode.debug", "mode.release")

add_requires("{{ expand('%:p:h:t:r') }}")

target("{{ expand('%:p:h:t:r') }}")
do
    add_rules("luarocks.module")
    add_files("*.c")
    add_packages("{{ expand('%:p:h:t:r') }}")
end
