#! /bin/bash
#uso: ./generate_IL_data.sh /ruta/herramientas/ (con archivos .uri dentro de herramienta/pcap)

RUTA_URI=$1
RUTA_SCRIPT=$PWD
RUTA_IL=/home/kali/Downloads/inspectorlog
echo "Seleccionar conjunto de reglas para utilizar IL";
echo "1) Reglas Snort";
echo "2) Reglas Nemesida";
echo "3) OWASP Coreruleset";
read -p "Selección: " opcion;
case ${opcion} in 
1)
	RUTA_RULES=/home/kali/Downloads/reglas_javi/snort
	cd $RUTA_URI
       	for j in $(ls $PWD)
       	do
       	cd $j  
       	RUTA_HERR=$(echo $PWD | awk -F "capturas" '{print $2}')
       	echo "Procesando ficheros de la ruta" $RUTA_HERR;
       	cd pcap
               for i in $(ls $PWD | grep .uri)
              	do
                       	RUTA_SNORT=/home/kali/TFG/inspectorlog/snort$RUTA_HERR
			mkdir -p $RUTA_SNORT
                       	nombre_fich=${i%.*}
                       	echo "Analizando con IL+Reglas Snort el fichero" $i;
                       	$RUTA_IL/inspectorlog -l $i -r $RUTA_RULES -t list -o $RUTA_SNORT/$nombre_fich.clean > $RUTA_SNORT/$nombre_fich.attacks;
                       	echo "-----------------------------------------------------------------------------------";
               	done
       	cd ../..
       	done
	;;
2)
	RUTA_RULES=/home/kali/Downloads/reglas_javi/nemesida
	cd $RUTA_URI
       	for j in $(ls $PWD)
       	do
       	cd $j  
       	RUTA_HERR=$(echo $PWD | awk -F "capturas" '{print $2}')
       	echo "Procesando ficheros de la ruta" $RUTA_HERR;
       	cd pcap
               	for i in $(ls $PWD | grep .uri)
               	do
                       	RUTA_NEMESIDA=/home/kali/TFG/inspectorlog/nemesida$RUTA_HERR
			mkdir -p $RUTA_NEMESIDA
                       	nombre_fich=${i%.*}
                       	echo "Analizando con IL+Reglas Nemesida el fichero" $i;
                       	$RUTA_IL/inspectorlog -l $i -m $RUTA_RULES/nemesida-rules-bin-20220109.txt -t list -o $RUTA_NEMESIDA/$nombre_fich.clean > $RUTA_NEMESIDA/$nombre_fich.attacks;
                       	echo "-----------------------------------------------------------------------------------";
               	done
       	cd ../..
       	done
	;;
3)
	RUTA_MS_IL=/home/dit/Downloads/inspectorlog
	cd $RUTA_URI
       	for j in $(ls $PWD)
       	do
       	cd $j  
       	RUTA_HERR=$(echo $PWD | awk -F "capturas-full" '{print $2}')
       	echo "Procesando ficheros de la ruta" $RUTA_HERR;
       	cd pcap
               	for i in $(ls $PWD | grep .uri)
               	do

                       	RUTA_MODSECURITY=/home/dit/TFG/inspectorlog/modsecurity$RUTA_HERR
			mkdir -p $RUTA_MODSECURITY
                       	nombre_fich=${i%.*}
                       	echo "Analizando con IL+Reglas modsecurity el fichero" $i;
                       	$RUTA_MS_IL/ms-inspectorlog -l $i -t list -r $RUTA_MS_IL/etc/basic_rules.conf -o $RUTA_MODSECURITY/$nombre_fich.clean > $RUTA_MODSECURITY/$nombre_fich.attacks;
                       	echo "-----------------------------------------------------------------------------------";
               	done
       	cd ../..
       	done
	;;

esac
cd $RUTA_SCRIPT
