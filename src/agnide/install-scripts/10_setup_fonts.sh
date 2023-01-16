#!/bin/bash
set -x
set -o pipefail

# hack from @ManiaciaChao, see <https://github.com/coder/code-server/issues/1374#issuecomment-1014203683>
install_dir=/app/code-server
mainpage="$(find "${install_dir}" -type f -name workbench.html)"

sed -i "s,<head>,<head><style>\n@font-face {\n  font-family: 'UbuntuMono';\n  font-style: normal;\n  font-weight: 400;\n  src: url(https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v2.2.2/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf) format('ttf');\n}\n</style>," "${mainpage}"

grep -rl "font-src 'self' blob:" "${install_dir}" \
    | sudo xargs sed -i "s/font-src 'self' blob:/font-src 'self' blob: raw.githubusercontent.com/g"
