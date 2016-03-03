#!/usr/bin/env bash
# ______________________________________________________________________________
#
# DVG001
# Introduktion till Linux och små nätverk
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Author:   Jonas Sjöberg
#           tel12jsg@student.hig.se
#
# License:  Creative Commons Attribution-NonCommercial-ShareAlike 
#           4.0 International
#           See LICENSE.md for full licensing information.
# Date:     2016-03-03 --
# ______________________________________________________________________________


# Den här filens namn, utan fullständig sökväg.
SCRIPT_NAME=$(basename $0)


function msg_error()
{
    FORMAT="%s
    printf
}

function create_fil_ett()
{
    local dest="$1"

    if [ -z "$dest_path" ]
    then
        msg_error "Missing argument"
        return 1
    elif [ -e "$dest" ] 
    then
        msg_error "Destination already exists"
        return 1
    else
        if [ ! -w "$dest" ]
        then
            msg_error "Need write permissions for destination"
            return 1
        else
            # Skapar en fil med innehållet 'fil ett'.  
            echo 'fil ett' > "$dest"
            # Använd returvärdet från echo-operationen som returvärde för
            # funktionen 'create_fil_ett'.
            return $*
        fi
    fi
}





