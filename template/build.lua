module = "foo"
cleanfiles = {"*.curlopt"}
demofiles = {"latexmkrc", "Makefile"}
docfiles = {"*.md", "*.cfg"}
tagfiles = {"*.dtx", "build.lua"}
typesetexe = "xelatex"
typesetopts = "-shell-escape -file-line-error -8bit -halt-on-error -interaction=nonstopmode"

repository = "%GITHUB%/" .. module
cmd = "gh repo view --json description -q .description " .. repository
summary = io.popen(cmd):read()

uploadconfig = {
  announcement = "Release the package.",
  author = "%USER%",
  ctanPath = "/macros/latex/contrib/" .. module,
  email = "%MAIL%",
  license = "gpl3+",
  pkg = module,
  summary = summary,
  uploader = "%USER%",
  version = "%DATE% 0.0.1",

  bugtracker = repository .. "/issues",
  description = summary,
  development = repository,
  home = "https://ctan.org/pkg/" .. module,
  note = [[Uploaded automatically by l3build...]],
  repository = repository,
  support = repository .. "/issues",
  topic = "latex209",
}

-- l3build tag <tagname>
function update_tag(file, content, tagname, tagdate)
  if string.match(file, "%.dtx$") then
    content = string.gsub(content,
      "%d%d%d%d[-]%d%d[-]%d%d [0-9.]+",
      tagdate .. " " .. tagname)
    content = string.gsub(content,
      "\\def\\filedate{%d%d%d%d[-]%d%d[-]%d%d}",
      "\\def\\filedate{" .. tagdate .. "}")
    content = string.gsub(content,
      "\\def\\fileversion{[0-9.]+}",
      "\\def\\fileversion{" .. tagname .. "}")
  end
  if string.match(file, "^build.lua$") then
    content = string.gsub(content,
      "%d%d%d%d[-]%d%d[-]%d%d [0-9.]+",
      tagdate .. " " .. tagname)
  end
  return content
end

-- compatible with old l3build
---@diagnostic disable-next-line: undefined-global
if not release_date then
---@diagnostic disable-next-line: undefined-global
  dofile(kpse.lookup("l3build.lua"))
end
