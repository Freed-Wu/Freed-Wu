-- https://github.com/nvim-neorocks/rocks.nvim#rocket-bootstrapping-script
-- luacheck: ignore 111 112 113
---@diagnostic disable: undefined-global
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

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

local augroup_id = vim.api.nvim_create_augroup("init", { clear = false })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup_id,
    callback = function()
        vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
    end
})

do
    -- https://github.com/neovim/neovim/issues/30212
    if vim.fn.has('nvim-0.10.0') == 0 or vim.fn.has('win32') == 1 then
        return
    end
    -- ~/.config/luarocks/config-5.1.lua
    loadfile(vim.fs.normalize(vim.fs.joinpath(
        vim.fs.dirname(vim.fn.stdpath("config")), "luarocks", "config-" .. version .. ".lua"
    )))()
    for path in os.getenv("PATH"):gmatch('([^:]+)') do
        local bin = vim.fs.joinpath(path, "lua")
        if vim.fn.executable(bin) == 1 then
            variables.LUA_INCDIR = vim.fs.joinpath(vim.fs.dirname(vim.fs.dirname(vim.uv.fs_realpath(bin))), "include")
            break
        end
    end
    if vim.fn.filereadable("/run/current-system/nixos-version") == 1 then
        loadstring("variables.STDCPP_LIBDIR = " ..
        io.popen(vim.fs.joinpath(os.getenv("HOME"), "script", "get-NIX_LD_LIBRARY_PATH.nix")):read())()
        loadstring("variables.OPENSSL_INCDIR = " ..
        io.popen(vim.fs.joinpath(os.getenv("HOME"), "script", "get-OPENSSL_INCDIR.nix")):read())()
        loadstring("variables.OPENSSL_LIBDIR = " ..
        io.popen(vim.fs.joinpath(os.getenv("HOME"), "script", "get-OPENSSL_LIBDIR.nix")):read())()
    end
    vim.g.rocks_nvim = {
        rocks_path = vim.fs.dirname(vim.fs.dirname(vim.fs.joinpath(vim.fn.stdpath("data")))),
        luarocks_config = {
            rocks_trees = rocks_trees,
            rocks_servers = rocks_servers,
            external_deps_dirs = external_deps_dirs,
            cmake_generator = cmake_generator,
            variables = variables,
        },
    }

    -- ~/.local/lib/luarocks/rocks-5.1/rocks.nvim
    vim.opt.runtimepath:append(vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
        "lib", "luarocks", "rocks-" .. version .. "", "rocks.nvim", "*"))
end
