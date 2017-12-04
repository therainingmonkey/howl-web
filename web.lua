--TODO: Don't block while getting pages
--TODO: Set option to show/hide urls

local html2md = bundle_load "lib.lua-html2md.html2md"


local web = {}

function web.display(url)
  local html, err = howl.io.Process.execute("wget -O - " .. url)
  local md = html2md.parse(html, false)

    local mdMode = howl.mode.by_name("markdown")
	local b = howl.app:new_buffer(mdMode)
	b.text = md or err
	b.modified = false
	howl.app:add_buffer(b)
	howl.app.editor.buffer = b
end

return web
