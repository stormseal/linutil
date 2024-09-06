#!/bin/sh -e

. ../common-script.sh

FlatpakSetup() {
    case $PACKAGER in
        pacman)
            $ESCALATION_TOOL ${PACKAGER} -S --noconfirm flatpak
            echo "Now restart your system"
            ;;
        apt-get|nala)
           # $ESCALATION_TOOL ${PACKAGER} 
           # if [ "$ID" = ubuntu ]; then
            #    $ESCALATION_TOOL apt-mark hold snapd
            #fi
            ;;
        dnf)
            $ESCALATION_TOOL ${PACKAGER} install flatpak -y
            flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
            ;;
        zypper)
           # $ESCALATION_TOOL ${PACKAGER} install flatpak
           # flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
           # echo "Now restart your system"
            ;;
        *)
            echo "Installing flatpaks is not implemented for this package manager"
            ;;
    esac
}

checkEnv
FlatpakSetup
