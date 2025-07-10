---ldoc config
-- luacheck: ignore 111
---@diagnostic disable: lowercase-global
project = "{{ expand('%:p:h:t') }}"
title = "{{ expand('%:p:h:t') }}"
format = "discount"
dir = "_readthedocs/html"
readme = {
    "README.md"
}
description = title
full_description = description
