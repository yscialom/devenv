#!/bin/bash
set -x

cat > /etc/motd <<EOF
Welcome to ${USER_NAME}'s development environment.

Version: ${VERSION}
More information: https://github.com/yscialom/devenv
EOF
