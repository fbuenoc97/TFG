#! /bin/bash

RUTA=$1
cd $RUTA
for i in $(ls $PWD)
	do	
	    nombre_fich=${i%.*}
            sort $i | uniq > $nombre_fich.tmp          # 1) Eliminar repeticiones 
            LANG=C sort -f $nombre_fich.tmp > $nombre_fich.short       # 2) Ordenar alfanumericamente (ignore case)
            rm -f $nombre_fich.tmp  2>&1 1>/dev/null  
            wc -l $nombre_fich.short >> resumen.txt    # Contar URIs (líneas)
	done
