#!/usr/bin/env lua
---expand ~ to `$HOME`
---@param dir string
---@return string
local function expand(dir)
    if dir:sub(1, 2) == '~/' then
        return (os.getenv("HOME") or ".") .. dir:sub(2)
    end
    return dir
end

loadfile(expand("~/.config/luaprc.lua"))()
local fs = require "vim.fs"
local version = require("version")

---get index
---@param array string[]
---@param value string
---@return nil | integer
local function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
end

-- luacheck: ignore 111 113
---@diagnostic disable: undefined-global
loadfile(arg[1])()
local lines = {}

local prefix = os.getenv("PREFIX") or "/usr"
local f = io.open("/run/current-system/nixos-version")
if f then
    f:close()
    prefix = "/run/current-system/sw"
end
-- https://github.com/lumen-oss/nurr/issues/57
local disabled_languages = { "cli", "systemverilog", "idris", "org", "runescript" }
for file in fs.dir(fs.joinpath(prefix, "lib/nvim/parser")) do
    table.insert(disabled_languages, file:match("^[^.]+"))
end
local scm_languages = {}
for name, repo in pairs(repository) do
    if name:sub(1, 12) == "tree-sitter-" then
        local latest_v = "0.0.1-1"
        if indexOf(scm_languages, name:sub(13)) ~= nil then
            latest_v = "scm-1"
        end
        if latest_v ~= "scm-1" then
            for v, _ in pairs(repo) do
                if version(v) > version(latest_v) then
                    latest_v = v
                end
            end
        end
        local comment = ""
        if indexOf(disabled_languages, name:sub(13)) ~= nil then
            comment = "# "
        end
        latest_v, _ = latest_v:gsub("-.*", "")
        table.insert(lines, string.format('%s%s = "%s"', comment, name, latest_v))
    end
end
table.sort(lines, function(a, b)
    return a:match('^%s*#*%s*(.*)') < b:match('^%s*#*%s*(.*)')
end)
print(table.concat(lines, "\n"))
