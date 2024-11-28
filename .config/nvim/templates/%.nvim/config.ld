---ldoc config
-- luacheck: ignore 111
---@diagnostic disable: lowercase-global
project = "{{ expand('%:p:h:t') }}"
readme = "README.md"
format = "cmark"
dir = "_readthedocs/html"
