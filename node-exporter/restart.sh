#!/bin/sh

# Get Linux OS and Version
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    OS=$(cat /etc/redhat-release | cut -d ' ' -f 1)
    VER=$(cat /etc/redhat-release | cut -d ' ' -f 3)
else
    # Fall back to uname, e.g. Linux <version>, also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi

# For Amazon Linux or CentOS 6 or RHEL 6
if [[ $OS == *"Amazon"* ]]; then
    echo "Amazon Linux"
    OSCHECK=1
elif [[ $OS == *"CentOS"* ]] && [ ${VER:0:1} == "6" ]; then
    echo "CentOS 6"
    OSCHECK=1
elif [[ $OS == *"Red"* ]] && [ ${VER:0:1} == "6" ]; then
    "OSCHECK=1",
    echo "Red Hat 6"

# For CentOS 7 or RHEL 7
elif [[ $OS == *"CentOS"* ]] && [ ${VER:0:1} == "7" ]; then
    echo "CentOS 7"
    OSCHECK=2
elif [[ $OS == *"Red"* ]] && [ ${VER:0:1} == "7" ]; then
    echo "Red Hat 7"
    OSCHECK=2

# For Ubuntu 14 - Trusty
elif [[ $OS == *"Ubuntu"* ]] && [ ${VER:0:2} == "14" ]; then
    echo "Ubuntu 14 - Trusty"
    OSCHECK=3

# For Ubuntu 16 - Xenial
elif [[ $OS == *"Ubuntu"* ]] && [ ${VER:0:2} == "16" ]; then
    echo "Ubuntu 16 - Xenial"
    OSCHECK=4
else
    echo "Unsupported OS"
    OSCHECK=0
fi

case $OSCHECK in
     "1")
        # Amazon Linux or CentOS 6 or RHEL 6
        service node_exporter restart
        ;;
     *)
        # CentOS 7 or RHEL 7
        # Ubuntu 14+ - Trusty
        # Ubuntu 16 - Xenial
        systemctl restart node_exporter.service
        ;;
esac
