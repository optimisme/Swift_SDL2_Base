#!/bin/bash

# Ubuntu dependencies
dependencies=(
    "libsdl2-2.0-0"
    "libsdl2-dev"
    "libsdl2-image-2.0-0"
    "libsdl2-image-dev"
    "libsdl2-mixer-2.0-0"
    "libsdl2-mixer-dev"
    "libsdl2-ttf-2.0-0"
    "libsdl2-ttf-dev"
)

# Check if 'sudo'
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root."
    echo "Please run the script with sudo:"
    echo "sudo $0"
    exit 1
fi

apt update

# Check and insall
for dep in "${dependencies[@]}"; do
    dpkg -s $dep &> /dev/null

    if [ $? -ne 0 ]; then
        echo "Error: $dep no está instalado."
        echo "Por favor, instala las dependencias necesarias ejecutando:"
        echo "sudo apt install ${dependencies[@]}"
        exit 1
    fi
done

echo "All dependencies are installed."
