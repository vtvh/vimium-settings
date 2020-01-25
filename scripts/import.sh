#! /bin/bash
root=/c/Users/andre/_workspace/vimium-settings
cd "$root"

# not working; cmd "/C nircmd killprocess AutoMouseKey.exe"
rm ~/Downloads/vimium-options*.json 2> /dev/null
chrome chrome-extension://dbepggeogbaibhgnhhndojpepiihcmeb/pages/options.html
cmd "/C start /W scripts\get.amk"
mv ~/Downloads/vimium-options.json ./

# read json into seperate files
jq -r .keyMappings vimium-options.json > keymaps
jq -r .searchEngines vimium-options.json > engines

# show it
code -n engines keymaps