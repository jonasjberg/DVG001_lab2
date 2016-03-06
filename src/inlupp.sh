#!/usr/bin/env bash
# ______________________________________________________________________________
#
# DVG001 -- Introduktion till Linux och små nätverk
#                              Inlämningsuppgift #2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Author:   Jonas Sjöberg
#           tel12jsg@student.hig.se
#
# Date:     2016-03-03 -- 2016-03-07
#
# License:  Creative Commons Attribution 4.0 International (CC BY 4.0)
#           <http://creativecommons.org/licenses/by/4.0/legalcode>
#           See LICENSE.md for additional licensing information.
# ______________________________________________________________________________

set -e                     # Avbryt om ett kommando returnerar fel (nollskiljt)
#set -x                    # Avkommentera för debug-läge

SCRIPT_NAME=$(basename $0) # Den här filens namn, utan fullständig sökväg.
SCRIPT_DIR=$(dirname $0)   # Katalogen som den här filen ligger i.


# Funktion 'msg_error'
# Skriver ut meddelanden till stdout och stderror.
function msg_error()
{
    printf "${SCRIPT_NAME} [ERROR] : %s\n" "$*" 2>&1
}

# Funktion 'create_file'
# Skapar en fil med ett visst innehåll.
# Tar två argument: sökväg till målfilen och innehållet som ska användas.
function create_file()
{
    # Avbryt om antalet argument inte är två.
    if [ $# -ne 2 ]
    then
        return 1
    fi

    # Variabelutbyte sätter variabeln dest till det som står mellan
    # minustecknet och högerklammern om variabeln 1 är tom.
    #
    #   ${parameter:-word}
    #   If parameter is unset or null, the expansion of word is substituted.
    #   Otherwise, the value of parameter is substituted.
    #
    # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
    local dest="${1:-}"
    local cont="${2:-}"

    # Avbryt om variabeln dest är tom/null.
    if [ -z "$dest" ]
    then
        msg_error "Missing argument"
        return 1
    fi

    # Avbryt om målfilen redan existerar.
    if [ -e "$dest" ]
    then
        msg_error "Destination already exists"
        return 1
    else

        # Testa om det finns skrivrättigheter för målfilen.
        if [ -w "$dest" ]
        then
            msg_error "Need write permissions for destination"
            return 1
        else
            # Skriv innehållet i variabeln "cont" till sökvägen/filnamnet i
            # variabeln "dest".
            echo "$cont" > "$dest"

            # Använd returvärdet från echo-operationen som returvärde för
            # funktionen 'create_fil_ett'. Kan användas för felkontroll, där
            # nollskiljt returvärde är någon typ av fel.
            return $?
        fi
    fi
}

# Funktion 'create_dir'
# Skapar en katalog. Tar ett argument.
function create_dir()
{
    local dest="${1:-}"

    # Avbryt om argumentet dest är tomt/null.
    if [ -z "$dest" ]
    then
        return 1
    else
        # Flaggan '-p' skapar om nödvändigt underkataloger till målkatalogen.
        mkdir -p "$dest"
    fi
}


# Lagra de kataloger som ska skapas i variabler d1, d2 och d3.
d1="${SCRIPT_DIR}/laborationett"
d2="${d1}/katalogen"
d3="${d1}/katalogto"


# Skapa filen 'filtvaa.txt' med funktionen "create_file".
create_file 'fil två' "${d1}/filtvaa.txt"


# Skapa katalog och två filer.
create_dir "$d1"
create_file "${d1}/filtvaa.txt" 'fil två'
create_file "${d1}/filtree.txt" 'fil tre'


# Skapa katalog och filen 'skalpgm.sh'
# EOF är omringat med '' för att allt i "here-dokumentet" ska tolkas ordgrant
# och inte ersättas med t.ex. variablers värden eller output från "command
# substitution".
create_dir "${d2}"
cat << 'EOF' > "${d2}/skalpgm.sh"
#!/usr/bin/env bash
# Räknar antal rader i './data.txt' och '../katalogto/data.txt'

# Hämta full sökväg till scriptet under många omständigheter.
# Källa: http://stackoverflow.com/a/246128
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Se till att vara i rätt katalog för att nedanstående cat-kommando
# funkar med relativa sökvägar till de båda 'data.txt'-filerna.
cd "$SCRIPT_DIR" && cd ..

# Använd "command substitution" för att spara resultatet av pipelinen
# till variabeln "antal_rader".
antal_rader=$(cat "katalogen/data.txt" "katalogto/data.txt" | wc -l)

# Skriv ut resultatet med printf.
# Referens: "Pro Bash Programming: Scripting the GNU/Linux Shell"
#           Johnson, Chris and Varma, Jayant. 2nd Edition. Apress 2015.
printf "\n%s %s\n" "totalt antal rader:" "$antal_rader"
cd --
EOF


# Gör programmet 'skalpgm.sh' exekverbart.
chmod +x "${d2}/skalpgm.sh"


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
create_dir "${d3}"
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
#echo 'fil fyra' > "${d3}/filfyra.txt"
create_file "${d3}/filfyra.txt" 'fil fyra'


# Avsluta programmet.
# Returnerar koden från det senast avslutade kommandot.
exit $?
