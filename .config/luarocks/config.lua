---luarocks config.
-- luacheck: ignore 111
-- LuaFormatter off

-- LuaFormatter on
---@diagnostic disable: lowercase-global
home = home or ""
rocks_trees = {
    { name = "user", root = home .. "/.local" }
}
rocks_servers = {
    "https://luarocks.cn"
}
os_getenv = os_getenv or function(_) end
if os_getenv("NIXPKGS_CONFIG") == "/etc/nix/nixpkgs-config.nix" then
    external_deps_dirs = { "/run/current-system/sw", home .. "/.local/state/nix/profile" }
else
    external_deps_dirs = { os_getenv("PREFIX") or "/usr" }
end
if os_getenv("CMAKE_GENERATOR") then
    cmake_generator = os_getenv("CMAKE_GENERATOR")
end
