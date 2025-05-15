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

local function sort(a, b)
    local a_ = a
    local b_ = b
    if a:sub(1, 2) == '# ' then
        a_ = a:sub(3)
    end
    if b:sub(1, 2) == '# ' then
        b_ = b:sub(3)
    end
    return a_ < b_
end

loadfile(expand("~/.config/luaprc.lua"))()
local version = require("version")

-- luacheck: ignore 111 113
---@diagnostic disable: undefined-global
-- loadfile(expand("~/.cache/luarocks/https___nvim-neorocks.github.io_rocks-binaries-dev/manifest-5.1"))()
-- local repository_dev = repository
loadfile(expand("~/.cache/luarocks/https___nvim-neorocks.github.io_rocks-binaries/manifest-5.1"))()
local lines = {}
local disabled_languages = { "c", "lua", "query", "vim", "vimdoc", "markdown", "markdown_inline" }
-- https://github.com/nvim-neorocks/rocks-binaries/issues/7
for _, language in ipairs({ "systemverilog" }) do
    table.insert(disabled_languages, language)
end
for _, language in ipairs({ "idris", "org", "runescript" }) do
    table.insert(disabled_languages, language)
end
local scm_languages = {}
for name, repo in pairs(repository) do
    if name:sub(1, 12) == "tree-sitter-" then
        local latest_v = "0.0.1-1"
        -- if repository_dev[name] then
        --     for _, info in pairs(repository_dev[name]["scm-1"]) do
        --         if info.arch == "linux-x86_64" then
        --             latest_v = "scm-1"
        --             break
        --         end
        --     end
        -- end
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
table.sort(lines, sort)
print(table.concat(lines, "\n"))
