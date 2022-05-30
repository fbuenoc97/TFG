#! /bin/bash

for i in $(ls $PWD | grep .short)
	do
	nombre_fich=${i%.*}
	cp $i /home/dit/TFG/capturas-TFG/web_estatica/$nombre_fich
	done
