-- luacheck: ignore 111 113
---@diagnostic disable: undefined-global
-- https://github.com/SuperBo/fugit2.nvim/issues/97
---@diagnostic disable: lowercase-global
setting = {}
local ext = "so"
if vim.fn.has("osx") == 1 then
    ext = "dynlib"
elseif vim.fn.has("win32") == 1 then
    ext = "dll"
end
if vim.fn.filereadable("/run/current-system/nixos-version") == 1 then
    loadstring("setting.libgit2_path = " ..
        io.popen(vim.fs.joinpath(os.getenv("HOME"), "script", "get-libgit2_path.nix")):read() ..
        " .. '" .. ext .. "'")()
end
require('fugit2').setup(setting)
setting = nil
