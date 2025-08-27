#!/bin/bash
set -x
set -o pipefail

# jinjahtml
code-server --verbose --install-extension samuelcolvin.jinjahtml

# continue
code-server --verbose --install-extension continue.continue@1.3.1
cp /ysc/config/continue-config.yaml /config/.continue/config.yaml
