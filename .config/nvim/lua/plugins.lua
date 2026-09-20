-- https://github.com/nvim-neorocks/rocks.nvim#rocket-bootstrapping-script
-- luacheck: ignore 111 112 113
---@diagnostic disable: undefined-global
local uv = require 'luv'
local fs = require 'vim.fs'
local M = {}

---@param varname string
---@return string?
function M.os_getenv(varname)
    return require "os".getenv(varname)
end

---@return string version
function M.get_version()
    return _VERSION:match("%d[%d.]*%d") or "5.1"
end

---@return table
function M.get_luarocks_config()
    local version = M.get_version()
    local luarocks_config = { os_getenv = M.os_getenv, home = M.os_getenv("HOME") or '.' }

    -- ~/.config/luarocks/config-5.1.lua
    loadfile(fs.normalize(fs.joinpath(
        fs.dirname(vim.fn.stdpath("config")), "luarocks", "config-" .. version .. ".lua"
    )), "t", luarocks_config)()
    luarocks_config.os_getenv = nil
    if luarocks_config.variables == nil then
        luarocks_config.variables = {}
    end
    for path in os.getenv("PATH"):gmatch('([^:]+)') do
        local bin = fs.joinpath(path, "lua")
        if vim.fn.executable(bin) == 1 then
            luarocks_config.variables.LUA_INCDIR = fs.joinpath(
                fs.dirname(fs.dirname(uv.fs_realpath(bin))), "include")
            break
        end
    end
    return luarocks_config
end

---@return string
function M.get_rocks_path()
    return fs.dirname(fs.dirname(fs.joinpath(vim.fn.stdpath("data"))))
end

---@return table
function M.get_rocks_nvim()
    return {
        rocks_path = M.get_rocks_path(),
        luarocks_config = M.get_luarocks_config(),
        autosync = "disable",
    }
end

--- ~/.local/lib/luarocks/rocks-5.1/rocks.nvim
---@return string
function M.get_runtimepath()
    local version = M.get_version()
    return fs.joinpath(vim.g.rocks_nvim.rocks_path,
        "lib", "luarocks", "rocks-" .. version .. "", "rocks.nvim", "*")
end

---@return boolean? flag if should finish init.vim early
function M.main()
    -- config rocks.nvim
    vim.g.rocks_nvim = M.get_rocks_nvim()
    -- add ~/.local/lib/luarocks/rocks-5.1/rocks.nvim/X.Y.Z-1 to runtimepath
    vim.opt.runtimepath:append(M.get_runtimepath())
    M.set_path()
    if M.is_batch(vim.v.argv) then
        return true
    end
    -- config neovim
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.o.foldmethod = "expr"
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("init", { clear = false }),
        callback = function()
            vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
        end
    })
end

---@param argv string[]
---@return boolean
function M.is_batch(argv)
    for _, arg in ipairs(argv) do
        if arg == "-l" then
            return true
        end
    end
    return false
end

---@return boolean
function M.is_venv()
    local version = M.get_version()
    local env = "LUA_PATH_" .. version:gsub("%.", "_")
    return (os.getenv "LUA_PATH" or os.getenv(env)) ~= nil
end

---add ~/.local/share/lua/5.1 to package.path
---add ~/.local/lib/lua/5.1 to package.cpath
function M.set_path()
    if M.is_venv() then
        return
    end
    local expand = vim.fn.expand
    local version = M.get_version()
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

return M
