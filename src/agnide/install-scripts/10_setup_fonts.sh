#!/bin/bash
set -x
set -o pipefail

html=/usr/local/share/.config/yarn/global/node_modules/code-server/src/browser/pages/vscode.html
font=/ysc/fonts/fonts.html
sed -i "/<head>/r ${font}" "${html}"
