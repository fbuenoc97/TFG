#! /bin/bash

RUTA=$1
cd $RUTA
for i in $(ls $PWD)
	cd $i
	for j in $(ls $PWD | grep .pcap)
		do
		nombre_fich=${j%.*}	
		nfpcapd -r $j -l ../$i -t 10000000000000
		mv nfcapd* $nombre_fich.ipfix	
		done
	cd ..
	done

