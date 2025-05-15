---luarocks config.
-- luacheck: ignore 111 113
---@diagnostic disable: undefined-global
local os_getenv = os_getenv or function(varname)
    return require "os".getenv(varname)
end
local home = home or os_getenv("HOME")
---@diagnostic disable: lowercase-global
rocks_trees = {
    { name = "user", root = home .. "/.local" }
}
-- https://github.com/luarocks/luarocks/issues/1161
root_dir = rocks_trees[1].root
rocks_servers = {
    "https://nvim-neorocks.github.io/rocks-binaries",
    "https://luarocks.org",
    "https://luarocks.org/dev"
}
if os_getenv("NIXPKGS_CONFIG") == "/etc/nix/nixpkgs-config.nix" then
    external_deps_dirs = { "/run/current-system/sw", home .. "/.local/state/nix/profile" }
else
    external_deps_dirs = { os_getenv("PREFIX") or "/usr" }
end
if os_getenv("CMAKE_GENERATOR") then
    cmake_generator = os_getenv("CMAKE_GENERATOR")
end
variables = {
    BUNZIP2 = "7z -y x",
    UNZIP = "7z -y x",
    ZIP = "7z -y a"
}
