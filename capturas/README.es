En este repositorio se incluyen capturas del tráfico web de ataque generado por las principales herramientas de análisis de vulnerabilidades de categoría opensource, y algunas otras de categoría comercial.
Este tráfico ha sido generado contra una página web dinámica y una estática para comprobar las diferencias que presenta dicho tráfico.
Las capturas están organizadas según la web contra la que han sido lanzados esos ataques, y dentro de cada web según las herramientas que los han lanzado. Dentro de cada herramienta, encontraremos 4 tipos de ficheros con extensiones distintas:
-pcap: Captura tipo pcap de todo el tráfico generado
-csv:Captura organizada por columnas con todas las cabeceras http
-uri: Fichero que contiene todas las uris lanzadas en el ataque
-ipfix: Captura tipo netflow del tráfico generado.

Para la mayoría de las herramientas se ha realizado una sola captura completa del uso de la misma, no obstante, existen varias de ellas donde se han generado los ataques con varios plugins/módulos/scripts, luego para dichas herramientas, tenemos una captura para cada ataque, guardando dicha captura con la misma nomenclatura del tipo de ataque que realizó la herramienta.
