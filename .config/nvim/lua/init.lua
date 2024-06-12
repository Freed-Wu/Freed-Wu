-- https://github.com/nvim-neorocks/rocks.nvim#rocket-bootstrapping-script
-- luacheck: ignore 111 112 113
---@diagnostic disable: lowercase-global
local home = vim.fn.expand("$HOME")
local ext = "so"
if vim.fn.has("osx") == 1 then
    ext = "dynlib"
elseif vim.fn.has("win32") == 1 then
    ext = "dll"
end
local version, _ = _VERSION:gsub(".* ", "")
package.path = package.path
    .. ";./share/lua/" .. version .. "/?.lua;./?.lua;./?/init.lua;;"
    .. ";" .. home .. "/.local/share/lua/" .. version .. "/?.lua"
    .. ";" .. home .. "/.local/share/lua/" .. version .. "/?/init.lua"
    .. ";" .. home .. "/.local/state/nix/profile/share/lua/" .. version .. "/?.lua"
    .. ";" .. home .. "/.local/state/nix/profile/share/lua/" .. version .. "/?/init.lua"
package.cpath = package.cpath
    .. ";./lib/lua/" .. version .. "/?." .. ext .. ";./?." .. ext
    .. ";" .. home .. "/.local/lib/lua/" .. version .. "/?." .. ext
    .. ";" .. home .. "/.local/state/nix/profile/share/lua/" .. version .. "/?." .. ext
if vim.fn.filereadable("/run/current-system/nixos-version") == 1 then
    package.path = package.path
        .. ";" .. "/run/current-system/sw/share/lua/" .. version .. "/?.lua"
        .. ";" .. "/run/current-system/sw/share/lua/" .. version .. "/?/init.lua"
    package.cpath = package.cpath
        .. ";" .. "/run/current-system/sw/lib/lua/" .. version .. "/?." .. ext
end

do
    if vim.fn.has('nvim-0.10.0') == 0 then
        return
    end
    vim.g.rocks_nvim = {
        rocks_path = vim.fs.normalize(vim.fs.joinpath(
            vim.fn.stdpath("data"), "..", "..")),
        -- ~/.config/luarocks/config-5.1.lua
        luarocks_config = vim.fs.normalize(vim.fs.joinpath(
            vim.fn.stdpath("config"), "..", "luarocks", "config-" .. version .. ".lua")),
    }

    -- ~/.local/lib/luarocks/rocks-5.1/rocks.nvim
    vim.opt.runtimepath:append(vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
        "lib", "luarocks", "rocks-" .. version .. "", "rocks.nvim", "*"))
end
