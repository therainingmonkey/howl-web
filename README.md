# WEB - A simple web viewer for the Howl editor

Web downloads html from a given URL, converts it to markdown and shows it in a new buffer.
![screenshot](screenshot.png?raw=true)

## Installation
Ensure you have wget installed, then clone this repo into your bundles folder.

```bash
cd ~/.howl/bundles
git clone --recursive https://github.com/therainingmonkey/howl-web
```

## Usage
Open the command line and type `web-go`, followed by a URL, then press enter.

If you set `web_hide_urls` to `true`, web will hide the URL half of a link, and only show the link text.
This will give you much prettier pages.
