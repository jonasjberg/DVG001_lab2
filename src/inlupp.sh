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


# Avbryt direkt om ett kommando returnerar ett felvärde (nollskiljt)
set -e                         

# Den här filens namn, utan fullständig sökväg.
SCRIPT_NAME=$(basename $0)

# Fullständig sökväg katalogen som scriptet ligger i.
SCRIPT_DIR=$(dirname $0)

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



d1="${SCRIPT_DIR}/laborationett"
d2="${d1}/katalogen"
d3="${d1}/katalogto"

echo 'fil ett' > "${SCRIPT_DIR}/filett.txt"

mkdir "$d1"
echo 'fil två' > "${d1}/filtvaa.txt"
echo 'fil tre' > "${d1}/filtree.txt"

#create_file 'fil två' "${d1}/filtvaa.txt"
#create_file 'fil tre' "${d1}/filtree.txt"

mkdir "${d2}"
cat << EOF > "${d2}/skalpgm.sh" 
#!/usr/bin/env bash
wc -l 
EOF

# Spara godtycklig text i filen "data.txt" med ett "here document".
# Referens: Advanced Bash-Scripting Guide
#           http://tldp.org/LDP/abs/html/here-docs.html
cat << EOF > "${d2}/data.txt"
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

# Skapa katalog och fil "data.txt" med godtyckligt innehåll.
mkdir -v "${d3}"
cat << EOF > "${d3}/data.txt"
II.

SCYLD'S SUCCESSORS.--HROTHGAR'S GREAT MEAD-HALL.


{Beowulf succeeds his father Scyld}

          In the boroughs then Beowulf, bairn of the Scyldings,
          Belovèd land-prince, for long-lasting season
          Was famed mid the folk (his father departed,
          The prince from his dwelling), till afterward sprang
        5 Great-minded Healfdene; the Danes in his lifetime
          He graciously governed, grim-mooded, agèd
EOF

# Skapa filfyra.txt med innehåll "fil fyra"
echo 'fil fyra' > "${d3}/filfyra.txt"
