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

-- Register web-specific settings
howl.config.define({
    name = "web_display_urls",
    description = "Hide link URLs and show only link text.",
    -- Global scope is allowed, not just local
    scope = "global",
    -- Setting type_of provides options list & validation for free
    type_of = "string",
	-- Available options
	options = {
		"show",
		"hide",
		"footnote"
	},
})
-- Set an initial value
if howl.config.web_display_urls == nil then howl.config.web_display_urls = "footnote" end

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
