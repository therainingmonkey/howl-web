
local html2md = bundle_load "lib.lua-html2md.html2md"


local web = {}

function web.display(url)
	local display_urls = howl.config.web_display_urls or "footnote"

	local html, err = howl.io.Process.execute("wget -O - " .. url)
	local md = html2md.parse(html, display_urls)

	local mdMode = howl.mode.by_name("markdown")
	local b = howl.app:new_buffer(mdMode)
    if md == "" then md = err end
	b.text = md
	b.modified = false
	howl.app:add_buffer(b)
howl.app.editor.buffer = b
end

return web
