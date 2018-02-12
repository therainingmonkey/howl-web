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

web-go introduces the setting `web_display_urls` which control how URLs are rendered. available options:

* "footnote" (default) - Links are shown in footnote style[1].
* "show" - URLs are shown [inline](example.com) with links.
* "hide" - URLs aren't shown, only [link text].

[1](http://einchan.god.jp)
