-- https://github.com/nvim-neorocks/rocks.nvim#rocket-bootstrapping-script
-- luacheck: ignore 111 112 113
---@diagnostic disable: undefined-global
local l_flag = false
for _, arg in ipairs(vim.v.argv) do
    if l_flag == true then
        vim.g.script_name = vim.fs.basename(arg)
        break
    end
    if arg == "-l" then
        l_flag = true
    end
end
if vim.g.script_name == "nvimp" then
    require"prompt".name = "nvim"
    loadfile(vim.fs.joinpath(os.getenv("HOME"), ".config", "luaprc.lua"))()
end

if vim.treesitter.language.register then
    -- https://github.com/nvim-treesitter/nvim-treesitter/pull/6096/
    vim.treesitter.language.register("comment", "text")
    vim.treesitter.language.register("bash", "apkbuild")
    vim.treesitter.language.register("bash", "PKGBUILD")
    vim.treesitter.language.register("bash", "ebuild")
end
vim.api.nvim_create_autocmd("FileType", {
    pattern = "liquid",
    callback = function(args)
        vim.treesitter.start(args.buf, vim.b.liquid_subtype)
        -- only if additional legacy syntax is needed
        -- vim.bo[args.buf].syntax = "on"
    end
})

local version, _ = _VERSION:gsub(".* ", "")
-- firenvim
if vim.env.LUA_PATH_5_1 == nil then
    local ext = "so"
    if vim.fn.has("osx") == 1 then
        ext = "dynlib"
    elseif vim.fn.has("win32") == 1 then
        ext = "dll"
    end
    package.path = package.path
        .. ";./share/lua/" .. version .. "/?.lua;./?.lua;./?/init.lua;;"
        .. ";" .. vim.fn.expand("~/.local/share/lua/") .. version .. "/?.lua"
        .. ";" .. vim.fn.expand("~/.local/share/lua/") .. version .. "/?/init.lua"
        .. ";" .. vim.fn.expand("~/.local/state/nix/profile/share/lua/") .. version .. "/?.lua"
        .. ";" .. vim.fn.expand("~/.local/state/nix/profile/share/lua/") .. version .. "/?/init.lua"
    package.cpath = package.cpath
        .. ";./lib/lua/" .. version .. "/?." .. ext .. ";./?." .. ext
        .. ";" .. vim.fn.expand("~/.local/lib/lua/") .. version .. "/?." .. ext
        .. ";" .. vim.fn.expand("~/.local/state/nix/profile/share/lua/") .. version .. "/?." .. ext
    if vim.fn.filereadable("/run/current-system/nixos-version") == 1 then
        package.path = package.path
            .. ";/run/current-system/sw/share/lua/" .. version .. "/?.lua"
            .. ";/run/current-system/sw/share/lua/" .. version .. "/?/init.lua"
        package.cpath = package.cpath
            .. ";/run/current-system/sw/lib/lua/" .. version .. "/?." .. ext
    end
end

if not vim.g.script_name then
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("init", { clear = false }),
        callback = function()
            vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
        end
    })
end

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
            ---@diagnostic disable-next-line: inject-field
            variables.LUA_INCDIR = vim.fs.joinpath(vim.fs.dirname(vim.fs.dirname(vim.uv.fs_realpath(bin))), "include")
            break
        end
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
    ---@diagnostic disable: lowercase-global
    rocks_trees = nil
    rocks_servers = nil
    external_deps_dirs = nil
    cmake_generator = nil
    variables = nil

    -- ~/.local/lib/luarocks/rocks-5.1/rocks.nvim
    vim.opt.runtimepath:append(vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
        "lib", "luarocks", "rocks-" .. version .. "", "rocks.nvim", "*"))
end
