#!/bin/bash
set -x
set -o pipefail

# hack from @ManiaciaChao, see <https://github.com/coder/code-server/issues/1374#issuecomment-1014203683>
install_dir=/app/code-server
mainpage="${install_dir}/vendor/modules/code-oss-dev/out/vs/code/browser/workbench/workbench.html"

sed -i "s,<head>,<head><style>@import url('https://fonts.googleapis.com/css?family=Source+Code+Pro');</style>," "${mainpage}"

grep -rl "style-src 'self' 'unsafe-inline'" "${install_dir}" \
    | sudo xargs sed -i "s/style-src 'self' 'unsafe-inline'/style-src 'self' 'unsafe-inline' fonts.googleapis.com/g"

grep -rl "font-src 'self' blob:" "${install_dir}" \
    | sudo xargs sed -i "s/font-src 'self' blob:/font-src 'self' blob: fonts.gstatic.com/g"
