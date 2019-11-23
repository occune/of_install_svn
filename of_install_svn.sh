#!/bin/bash
echo "Open Fortress install script"
echo "If something is broken, contact me in Discord occune#2816"

if which svn >/dev/null; then
    echo "Subversion installed"
else
    echo "Please, install these packages: subversion" >&2
    exit 0
fi

if [[ "$PWD" =~ sourcemods ]]; then
    echo "Script is placed in a correct directory"
else
    echo "Please, place script in the sourcemods folder, exiting" >&2
    exit 0
fi

if [ -d "open_fortress" ]; then
    echo "Updating current installation"
    cd open_fortress
    svn cleanup
    svn update
    cd ..
else
   echo "Starting the download of a new copy"
   svn checkout --username ofs --password '' --depth infinity https://svn.openfortress.fun/svn/open_fortress
fi
