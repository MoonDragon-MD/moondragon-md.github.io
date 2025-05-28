#!/bin/bash
## StampaPDF-editabile_da_HTML
## Versione dello script: 1.3
##    Creato da MoonDragon 
##    Creato il 6 Giugno 2014
##    Sito ufficiale: http://www.moondragon.comule.com
##    Mi trovate anche su http://forum.ubuntu-it.org
# controllo se le dipendenze sono installate
inst=`dpkg -l wkhtmltopdf 2> /dev/null | tail -1 | cut -d " " -f1`
if [ "$inst" = "ii" ]
then
  echo installato
else
  echo non installato
  xterm -e 'sudo apt-get install wkhtmltopdf' | zenity --progress --pulsate --title="Controllo dipendenze" --text="Attendere il termine di installazione"
fi
while [ $# -gt 0 ]; do
    htmlfile=$1
/usr/bin/wkhtmltopdf "$htmlfile" ${HOME}/Scrivania/`date +%k%M`.pdf
    shift
done
