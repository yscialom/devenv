#!/bin/bash
set -o pipefail
set -x

## Is it the first startup?
if [[ -f /ysc/installed ]] ; then
    echo "$0: already installed, exit normally"
    exit
fi

# Install the installation scripts
for script in $(ls /ysc/install-scripts/**/*.sh | sort | xargs) ; do
    ${script}
done

# Register work done
touch /ysc/installed
