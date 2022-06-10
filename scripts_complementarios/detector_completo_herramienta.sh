#! /bin/bash

RUTA=$1
cd $RUTA
cd modsecurity/
for i in $(ls $PWD | grep .attacks)
	do	
		cp $i ../completas/
          
	done
cd ../nemesida/
for j in $(ls $PWD | grep .attacks)
	do	
		cat $j >> ../completas/$j
          
	done
cd ../snort/
for x in $(ls $PWD | grep .attacks)
	do	
		cat $x >> ../completas/$x
          
	done
cd ../completas/
for y in $(ls $PWD | grep .attacks)
	do	
		nombre_fich=${i%.*}
 		cut -f 2 $y > $nombre_fich.tmp
		awk ' /^Uri/{print $2}' $nombre_fich.tmp > $nombre_fich.tmp1
		sort $nombre_fich.tmp1 | uniq > $nombre_fich.tmp2            # 1) Eliminar repeticiones 
		LANG=C sort -f $nombre_fich.tmp2 > $y       # 2) Ordenar alfanumericamente (ignore case)
		rm -f $nombre_fich.tmp  2>&1 1>/dev/null  
		rm -f $nombre_fich.tmp1  2>&1 1>/dev/null 
		rm -f $nombre_fich.tmp2  2>&1 1>/dev/null   
		wc -l $y >> resumen.txt    # Contar URIs (líneas)
          
	done

	   
