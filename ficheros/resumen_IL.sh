#! /bin/bash
#uso: . generate_http_data.sh /ruta/herramientas (con carpeta /pcap dentro)

#IMPORTANTE: el '.' y el espacio

RUTA_IL_DATA=$1
RUTA_SCRIPT=$PWD
cd $RUTA_IL_DATA
for i in $(ls $PWD | grep .attacks)
do
        nombre_herr=$(echo $PWD | awk -F "/" '{print $NF}')
        nombre_fich=${i%.*}
        echo "Extrayendo datos del fichero" $i;
        echo $nombre_fich >> resumen.txt
        awk ' /^# N. packets/{print}' $i >> resumen.txt
        echo "-----------------------------------------------------------------------------"
done
cd $RUTA_SCRIPT

