--TODO: Don't block while getting pages
--TODO: Set option to show/hide urls

local requests = require "requests"
local html2md = bundle_load "lib.lua-html2md.html2md"

local web = {}

function web.check_url(url)
    if url:sub(1, 4) ~= "http" then
        url = "http://" .. url
    end
    if url:sub(-1) ~= "/" then
        url = url .. "/"
    end
    return url
end


function web.display(url)
	url = web.check_url(url)
	local response = requests.get(url)
	if response.status_code == 300 or response.status_code == 301 then
		--Use https -- TODO: Use https first!
		url = "https" .. url:sub(5, -1)
		response = requests.get(url)
	end

	local md = html2md.parse(response.text)
	local mdMode = howl.mode.by_name("markdown")
	local b = howl.app:new_buffer(mdMode)
	b.text = md
	b.modified = false
	howl.app:add_buffer(b)
	howl.app.editor.buffer = b
end

return web
