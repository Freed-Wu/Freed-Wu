-- luacheck: ignore 111 113
---@diagnostic disable: undefined-global
home = require 'os'.getenv('HOME')
rocks_path = home .. '/.local'
luarocks_config_path = home .. '/.config/luarocks/config-5.3.lua'
