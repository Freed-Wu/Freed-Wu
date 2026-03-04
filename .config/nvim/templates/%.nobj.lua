-- luacheck: ignore 113
---@diagnostic disable: undefined-global
c_module "{{ expand('%:p:t:r:r') }}" {
    use_globals = true,
    include "{{ expand('%:p:t:r:r') }}.h",
    c_function "{{ expand('%:p:t:r:r') }}" {
        c_call "{% here %}" "{{ expand('%:p:t:r:r') }}" {}
    }
}
