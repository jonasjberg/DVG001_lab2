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

# Hämta färginformation, spara till variabler.
C_NORMAL=$(tput sgr0)
C_RED=$(tput setaf 1)
C_GREEN=$(tput setaf 2)
C_YELLOW=$(tput setaf 3)


function msg()
{
    TAB='  '
    MSG_FORMAT="%s\n"

    printf "${GREEN}[${SCRIPT_NAME}]${NORMAL}${TAB}"
    printf "$MSG_FORMAT" "$@"
}

function msg_error()
{
    TAB='  '
    MSG_FORMAT="%s\n"

    printf "${RED}[${SCRIPT_NAME}]${NORMAL}${TAB}"
    printf "$MSG_FORMAT" "$@"
}

function msg_warning()
{
    TAB='  '
    MSG_FORMAT="%s\n"

    printf "${YELLOW}[${SCRIPT_NAME}]${NORMAL}${TAB}"
    printf "$MSG_FORMAT" "$@"
}

function create_file()
{
    local dest="$1"
    local cont="$2"

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
            echo "$cont" > "$dest"
            # Använd returvärdet från echo-operationen som returvärde för
            # funktionen 'create_fil_ett'.
            return $*
        fi
    fi
}

function create_folder()
{
    local dest="$1"

    mkdir -vp "$1"
}


d1="laborationett"
d2="${d1}/katalogen"
d3="${d1}/katalogto"
cat 'fil ett' > "filett.txt"

mkdir -v "$d1"
cat 'fil två' > "${d1}/filtvaa.txt"
cat 'fil tre' > "${d1}/filtreetxt"

mkdir -v "${d2}"
touch "${d2}/skalpgm.sh" 

touch "${d2}/data.txt"        innehåll: godtycklig text, hitta på något.
cat <<EOF
BEOWULF.




I.

THE LIFE AND DEATH OF SCYLD.


{The famous race of Spear-Danes.}

          Lo! the Spear-Danes' glory through splendid achievements
          The folk-kings' former fame we have heard of,
          How princes displayed then their prowess-in-battle.

{Scyld, their mighty king, in honor of whom they are often called
Scyldings. He is the great-grandfather of Hrothgar, so prominent in the
poem.}

          Oft Scyld the Scefing from scathers in numbers
        5 From many a people their mead-benches tore.
          Since first he found him friendless and wretched,
          The earl had had terror: comfort he got for it,
          Waxed 'neath the welkin, world-honor gained,
          Till all his neighbors o'er sea were compelled to
       10 Bow to his bidding and bring him their tribute:
          An excellent atheling! After was borne him

{A son is born to him, who receives the name of Beowulf--a name afterwards
made so famous by the hero of the poem.}
EOF

laborationett/katalogto/data.txt        innehåll: godtycklig text, något annat.
laborationett/katalogto/filfyra.txt     innehåll: ”fil fyra”.



