#! /bin/bash

cd $1
mkdir opensource comerciales
mv burpsuite_short.attacks nexploit_short.attacks nexpose_short.attacks smartscanner_short.attacks webcruiser_short.attacks wpscan_short.attacks comerciales/
mv * opensource/
cd opensource/
mv comerciales/ ../
mv resumen.txt ../

