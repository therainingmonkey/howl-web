local web = bundle_load "web"

local function get_url()
	local url = howl.interact.read_text()
	return url
end



-- Register everything with Howl

howl.command.register({
	name = "web-go",
	description = "View a web page",
	input = get_url,
	handler = web.display
})

local function unload ()
	howl.command.unregister("web-go")
end

return {
	info = {
		author = "M. Drake <therainingmonkey@googlemail.com>",
		description = "A simple web viewer for Howl",
		license = "MIT",
		},
	unload = unload
}
