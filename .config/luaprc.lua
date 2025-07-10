---expand ~ to `$HOME`
---@param dir string
---@return string
local function expand(dir)
    if dir:sub(1, 2) == '~/' then
        return (os.getenv("HOME") or ".") .. dir:sub(2)
    end
    return dir
end

local version, _ = _VERSION:gsub(".* ", "")
if os.getenv "LUA_PATH" == nil or os.getenv("LUA_PATH_" .. version:gsub("%.", "_")) == nil then
    local ext = package.cpath:match('([^.]+)$')
    package.path = package.path
        .. ";./share/lua/" .. version .. "/?.lua;./?.lua;./?/init.lua;;"
        .. ";" .. expand("~/.local/share/lua/") .. version .. "/?.lua"
        .. ";" .. expand("~/.local/share/lua/") .. version .. "/?/init.lua"
        .. ";" .. expand("~/.local/state/nix/profile/share/lua/") .. version .. "/?.lua"
        .. ";" .. expand("~/.local/state/nix/profile/share/lua/") .. version .. "/?/init.lua"
    package.cpath = package.cpath
        .. ";./lib/lua/" .. version .. "/?." .. ext .. ";./?." .. ext
        .. ";" .. expand("~/.local/lib/lua/") .. version .. "/?." .. ext
        .. ";" .. expand("~/.local/state/nix/profile/share/lua/") .. version .. "/?." .. ext
    local f = io.open("/run/current-system/nixos-version")
    if f then
        f:close()
        package.path = package.path
            .. ";/run/current-system/sw/share/lua/" .. version .. "/?.lua"
            .. ";/run/current-system/sw/share/lua/" .. version .. "/?/init.lua"
        package.cpath = package.cpath
            .. ";/run/current-system/sw/lib/lua/" .. version .. "/?." .. ext
    else
        if package.path:gsub("/usr/share/lua/" .. version .. "/?.lua", "") == package.path then
            package.path = package.path
                .. ";/usr/share/lua/" .. version .. "/?.lua"
                .. ";/usr/share/lua/" .. version .. "/?/init.lua"
        end
        if package.cpath:gsub("/usr/lib/lua/" .. version .. "/?" .. ext, "") == package.cpath then
            package.cpath = package.cpath
                .. ";/usr/lib/lua/" .. version .. "/?." .. ext
        end
    end
end

local ok, prompt = pcall(require, "prompt")
if ok then
    local os = require "os"
    local style = require "prompt.style"

    -- luacheck: ignore 111 113
    ---@diagnostic disable: undefined-global
    if vim then
        prompt.name = "nvim"
    end
    prompt.prompts = { style.generate_ps1(), "    " }
    prompt.history = os.getenv("HOME") .. "/.lua_history"
end
