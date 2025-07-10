-- https://github.com/nvim-neorocks/rocks.nvim#rocket-bootstrapping-script
-- luacheck: ignore 111 112 113
---@diagnostic disable: undefined-global
loadfile(vim.fn.expand("~/.config/luaprc.lua"))()

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

if vim.treesitter.language.register then
    vim.treesitter.language.register("comment", "text")
    -- https://github.com/nvim-treesitter/nvim-treesitter/pull/6096/
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

if not vim.g.script_name then
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("init", { clear = false }),
        callback = function()
            vim.o.foldmethod = "expr"
        end
    })
    vim.api.nvim_create_autocmd("TextYankPost", {
        group = vim.api.nvim_create_augroup("init", { clear = false }),
        callback = function()
            vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
        end
    })
end

do
    local version, _ = _VERSION:gsub(".* ", "")
    -- ~/.config/luarocks/config-5.1.lua
    local luarocks_config = { require = require }
    loadfile(vim.fs.normalize(vim.fs.joinpath(
        vim.fs.dirname(vim.fn.stdpath("config")), "luarocks", "config-" .. version .. ".lua"
    )), "t", luarocks_config)()
    luarocks_config.require = nil
    if luarocks_config.variables == nil then
        luarocks_config.variables = {}
    end
    for path in os.getenv("PATH"):gmatch('([^:]+)') do
        local bin = vim.fs.joinpath(path, "lua")
        if vim.fn.executable(bin) == 1 then
            ---@diagnostic disable-next-line: inject-field
            luarocks_config.variables.LUA_INCDIR = vim.fs.joinpath(
                vim.fs.dirname(vim.fs.dirname(vim.uv.fs_realpath(bin))), "include")
            break
        end
    end
    vim.g.rocks_nvim = {
        rocks_path = vim.fs.dirname(vim.fs.dirname(vim.fs.joinpath(vim.fn.stdpath("data")))),
        luarocks_config = luarocks_config,
    }

    -- ~/.local/lib/luarocks/rocks-5.1/rocks.nvim
    vim.opt.runtimepath:append(vim.fs.joinpath(vim.g.rocks_nvim.rocks_path,
        "lib", "luarocks", "rocks-" .. version .. "", "rocks.nvim", "*"))
end
