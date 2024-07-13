---luarocks config.

-- luacheck: ignore 111 113 211
---@diagnostic disable: lowercase-global
if vim then
    local rocks_trees
    local rocks_servers
    local external_deps_dirs
    local cmake_generator
    local variables
end
local home = home or ""
rocks_trees = {
    { name = "user", root = home .. "/.local" }
}
rocks_servers = {
    "https://nvim-neorocks.github.io/rocks-binaries",
    "https://luarocks.cn",
    "https://luarocks.cn/dev",
    "https://luarocks.org",
    "https://luarocks.org/dev"
}
local os_getenv = os_getenv or function(varname)
    return require "os".getenv(varname)
end
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
