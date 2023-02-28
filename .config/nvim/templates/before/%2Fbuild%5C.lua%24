---l3build config.
-- luacheck: ignore 111
-- LuaFormatter off

-- LuaFormatter on
---@diagnostic disable: lowercase-global
module = "{{ expand('%:p:h:t') }}" -- luacheck: ignore 121
cleanfiles = {"*.curlopt"}
demofiles = {"latexmkrc", "Makefile"}
docfiles = {"*.md", "*.cfg"}
tagfiles = {"*.dtx", "build.lua"}
typesetexe = "xelatex"
typesetopts =
    "-shell-escape -file-line-error -8bit -halt-on-error -interaction=nonstopmode"

local repository = "{{ g:snips_github }}/" .. module
uploadconfig = {
    announcement = "Release the package.",
    author = "{{ g:snips_author }}",
    ctanPath = "/macros/latex/contrib/" .. module,
    email = "{{ g:snips_email }}",
    license = "gpl3+",
    pkg = module,
    summary = [[]],
    uploader = "{{ g:snips_author }}",
    version = "{{ strftime('%Y/%m/%d') }} v0.0.1",

    bugtracker = repository .. "/issues",
    description = [[]],
    development = repository,
    home = "https://ctan.org/pkg/" .. module,
    note = [[Uploaded automatically by l3build.]],
    repository = repository,
    support = repository .. "/issues",
    topic = "std-conform;doc-templ;class;chinese;dissertation"
}

---l3build tag tagname.
-- replace YYYY/MM/DD vX.Y.Z
---@param file string
---@param content string
---@param tagname string
---@param tagdate string
---@return string
function update_tag(file, content, tagname, tagdate) -- luacheck: ignore 212
    if tagname then
        tagdate = string.gsub(tagdate, "-", "/")
        content = string.gsub(content, "%d%d%d%d/%d%d/%d%d v[0-9.]+",
                              tagdate .. " v" .. tagname)
    end
    return content
end
