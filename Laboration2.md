---
title: Laboration 2
       Introduktion till Linux och små nätverk
author:
- name: Anders Jackson
  affiliation: Högskolan i Gävle
  email: 
date: 2015-09-08
abstract: 
...


Inlämningsuppgift två
================================================================================

I denna inlämningsuppgift skall ni laborerar med kommandoraden, det s.k. kommandoskalet. 
Ni skall lämna in en rapport och programmet inlupp.sh.

I den här delen vill jag att ni dokumenterar hur ni har skapat följande katalogstruktur med följande
innehåll. Berätta var ni hittade information om de kommandon som ni använder.

Vad jag vill ha är alltså ett skript som heter inlupp.sh och som skapar följande katalogstruktur och filer när det körs.

inlupp.sh                               ett program.
filett.txt                              innehåll: ”fil ett”.
laborationett/
laborationett/filtvaa.txt               innehåll: ”fil två”.
laborationett/filtree.txt               innehåll: ”fil tre”.
laborationett/katalogen/
laborationett/katalogen/skalpgm.sh      ett program.
laborationett/katalogen/data.txt        innehåll: godtycklig text, hitta på något.
laborationett/katalogto/data.txt        innehåll: godtycklig text, något annat.
laborationett/katalogto/filfyra.txt     innehåll: ”fil fyra”.

## Programmet inlupp.sh 
skall skapa filen filett.txt och katalogen laborationett/ samt de filer som den innehåller.

## Programmet skalpgm.sh 
skall skriva ut antal rader i de två data.txt-filerna i katalogerna katalogen/ och katalogto/ när programmet körs

Det behöver bara fungera korrekt när man står i katalogen laborationett/katalogen/, men det är bra om man kan köra
det när man står i vilken annan katalog som helst och kör programmet därifrån. Då skall det
fortfarande räkna rader i data.txt-filerna i de angivna katalogerna ovan. 

Tips här är att titta på kommandot pwd(1) och även variabeln $PWD. De kan användas när skalpgm.sh skapas.
Använd gärna omstyrning av stdin i programmet inlupp.sh för att skapa innehållet i filerna.
När ni skapar innehåll i filer med flera rader än en, så skall ni använda HERE-dokument och lämp- ligen cat(1)-kommandot1.

Glöm inte att göra skalprogrammet exekverbart när det skapas av inlupp.sh.


1   När man skriver cat(1) så menar man att kommandot finns dokumenterat bland Linux manualsidor, sektion ett.
    Prova då följande i kommandoskalet: man 1 cat eller man cat.


Rapporten
--------------------------------------------------------------------------------
Den rapport som ni skriver skall innehålla ett försättsblad som innehåller laborationens namn,
datum, ert namn, födelsedatum/personnummer samt datorpostadress (den som ni har fått här på
högskolan).

Rapporten skall vara skriven så att jag kan följa vad ni har gjort. Ingen roman behövs dock, ca 4-7


                                                 Sida 1 av 2                                  Anders Jackson
Laboration 2                   Introduktion till Linux och små nätverk                     2015-09-08

sidor totalt med text och bilagor som i det här laborationsunderlaget. Då räknar jag in alla sidor,
inklusive försättsblad.

Följande delar/rubriker kan vara bra att ha i rapporten.
   1. Försättsblad
   2. Innehållsförteckning (ej nödvändig om rapporten bara innehåller två sidor)
   3. Inledning: Ni beskriver problemet och vilka frågor som skall besvaras
   4. Genomförande: Här beskriver ni hur ni har löst laborationen
   5. Slutsatser: Här beskriver ni svaren på frågorna i Inledning:en
   6. Övrigt: Om ni vill lägga till något som inte får plats i Slutsatser
   7. Referenser: Här anger ni de dokument och URL:er som ni använt er av för att hitta
      information. Notera att ni bör referera till dem från texten.
   8. Bilagor: Här lägger ni stora bilder och programlistningar. Ni bör även här referera till dem
      från texten i rapporten.
Rapporten skall lämnas in i PDF-format och inget annat. Rapporten och programmet inlupp.sh
lägger ni i en katalog samt använd programmet tar eller gzip för att skapa ett arkiv som ni skickar
in i BlackBoard. D.v.s. så här kan ni göra för att skapa filen för att skicka in i BlackBoard. Byt ut
mitt-namn mot ert egna namn. :-)
    $   mkdir laboration2-mitt-namn
    $   cp rapport-lab2.pdf laboration2-mitt-namn
    $   cp inlupp.sh laboration2-mitt-namn
    $   tar -cvf laboration2-mitt-namn.tar laboration2-mitt-namn
Nu har ni det som behövs i arkivfilen laboration2-mitt-namn.tar, skicka in, klart!
Om ni lägger programmen inlupp.sh och skalpgm.sh som bilagor i rapporten, så behöver ni
inte skicka dem. Det räcker att ni skickar in rapporten som PDF:dokument.

Om uppgiften och forum
Om ni får problem, så ställ frågor i forumet som finns i BlackBoard. Att lära sig att administrera
datorer handlar om att i forum kunna ställa rätt frågor, så det kan ni gärna öva på här.
När ni ställer en fråga, så skall ni beskriva vad ni vill göra, vad ni har gjort samt vad ni förväntat
er skall ske samt vad som skett. Om ni beskriver för dåligt, så kommer ni att få frågor om mer
information. Tänk på att de som läser era frågor inte har sett vad ni gjort, så det är ert ansvar
att förklara så att de andra förstår ert problem och kan besvara frågan.
Ni får även gärna svara på frågor i BlackBoard, där medstudenter förklarat vad de försökt med och
vad som inte gått som de tänkt. Begär mer information om ni inte har fått tillräckligt med
information så att ni förstått vad som frågats efter.
Lycka till!
Anders Jackson


                                             Sida 2 av 2                               

