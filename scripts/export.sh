#! /bin/bash
root=/c/Users/andre/_workspace/vimium-settings
cd "$root"

chrome chrome-extension://dbepggeogbaibhgnhhndojpepiihcmeb/pages/options.html
cat engines | win32yank -i
cmd "/C start /W scripts\paste-engines.amk"
cat keymaps | win32yank -i
cmd "/C start /W scripts\paste-keymaps.amk"
nircmd beep 528 68