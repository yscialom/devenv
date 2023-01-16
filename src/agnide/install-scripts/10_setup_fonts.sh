#!/bin/bash
set -x
set -o pipefail

# hack from @ManiaciaChao, see <https://github.com/coder/code-server/issues/1374#issuecomment-1014203683>
install_dir=/app/code-server
mainpage="$(find "${install_dir}" -type f -name workbench.html)"

sed -i "s,<head>,<head><style>@import url('https://github.com/ryanoasis/nerd-fonts/raw/v2.2.2/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf');</style>," "${mainpage}"

grep -rl "style-src 'self' 'unsafe-inline'" "${install_dir}" \
    | sudo xargs sed -i "s/style-src 'self' 'unsafe-inline'/style-src 'self' 'unsafe-inline' github.com/g"

grep -rl "font-src 'self' blob:" "${install_dir}" \
    | sudo xargs sed -i "s/font-src 'self' blob:/font-src 'self' blob: github.com/g"
