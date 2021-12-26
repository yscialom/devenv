#!/bin/bash
set -o pipefail
set -x

## Is it the first startup?
if [[ -f /ysc/installed ]] ; then
    echo "$0: already installed, exit normally"
    exit
fi

# Install the installation scripts
cp -r /ysc/install-scripts/* /config/custom-cont-init.d/.

# Register work done
touch /ysc/installed
