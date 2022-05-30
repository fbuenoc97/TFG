#! /bin/bash
#uso: ./generate_IL_data.sh /ruta/herramientas/ (con archivos .uri dentro de herramienta/pcap)

RUTA_URI=$1
RUTA_SCRIPT=$PWD
RUTA_IL=/home/kali/Downloads/inspectorlog
cd $RUTA_URI
echo "Seleccionar conjunto de reglas para utilizar IL";
echo "1) Reglas Snort";
echo "2) Reglas Nemesida";
echo "3) OWASP Coreruleset";
read -p "Selección: " opcion;
case ${opcion} in 
1)
	RUTA_RULES=/home/kali/Downloads/reglas_javi/snort
               for i in $(ls $PWD | grep .short)
              	do
                       	RUTA_SNORT=/home/kali/TFG/ficheros_uris_completos/$RUTA_URI/snort
                       	nombre_fich=${i%.*}
                       	echo "Analizando con IL+Reglas Snort el fichero" $i;
                       	$RUTA_IL/inspectorlog -l $i -r $RUTA_RULES -t list -o $RUTA_SNORT/$nombre_fich"_short".clean > $RUTA_SNORT/$nombre_fich"_short".attacks;
                       	echo "-----------------------------------------------------------------------------------";
               	done
	;;
2)
	RUTA_RULES=/home/kali/Downloads/reglas_javi/nemesida
               	for i in $(ls $PWD | grep .short)
               	do
                       	RUTA_NEMESIDA=/home/kali/TFG/ficheros_uris_completos/$RUTA_URI/nemesida
                       	nombre_fich=${i%.*}
                       	echo "Analizando con IL+Reglas Nemesida el fichero" $i;
                       	$RUTA_IL/inspectorlog -l $i -m $RUTA_RULES/nemesida-rules-bin-20220109.txt -t list -o $RUTA_NEMESIDA/$nombre_fich"_short".clean > $RUTA_NEMESIDA/$nombre_fich"_short".attacks;
                       	echo "-----------------------------------------------------------------------------------";
               	done
	;;
3)
	LD_LIBRARY_PATH="/usr/local/modsecurity/lib"
	export LD_LIBRARY_PATH
	RUTA_MS_IL=/home/dit/Downloads/inspectorlog
               	for i in $(ls $PWD | grep .short)
               	do

                       	RUTA_MODSECURITY=/home/dit/TFG/ficheros_uris_completos/$RUTA_URI/modsecurity
                       	nombre_fich=${i%.*}
                       	echo "Analizando con IL+Reglas modsecurity el fichero" $i;
                       	$RUTA_MS_IL/ms-inspectorlog -l $i -t list -r $RUTA_MS_IL/etc/basic_rules.conf -o $RUTA_MODSECURITY/$nombre_fich"_short".clean > $RUTA_MODSECURITY/$nombre_fich"_short".attacks;
                       	echo "-----------------------------------------------------------------------------------";
               	done
	;;

esac
cd $RUTA_SCRIPT
