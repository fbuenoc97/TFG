#! /bin/bash
#uso: . generate_http_data.sh /ruta/herramientas (con carpeta /pcap dentro)

#IMPORTANTE: el '.' y el espacio

RUTA_PCAP=$1
RUTA_SCRIPT=$PWD
cd $RUTA_PCAP
for j in $(ls $PWD)
	do
	cd $j/pcap
	echo $PWD
	num_pcap=$(ls | grep pcap | wc -l);
		if [ $num_pcap -gt "1" ]
		then 
			echo "Generando el .pcap completo de " $j;			
			mergecap *.pcap -w $j.pcap
			echo "Generando el .csv con tshark del fichero" $j;
			tshark -r $j.pcap -T fields -Y "http.request" -E header=y -e http.accept -e http.accept_encoding -e http.accept_language -e http.authbasic -e http.authcitrix -e http.authcitrix.domain -e http.authcitrix.password -e http.authcitrix.session -e http.authcitrix.user -e http.authorization -e http.bad_header_name -e http.cache_control -e http.chat -e http.chunk_boundary -e http.chunk_size -e http.chunkd_and_length -e http.chunked_trailer_part -e http.connection -e http.content_encoding -e http.content_length -e http.content_length_header -e http.content_type -e http.cookie_pair -e http.date -e http.decompression_disabled -e http.decompression_failed -e http.file_data -e http.host -e http.http2_settings -e http.http2_settings_uri -e http.last_modified -e http.leading_crlf -e http.location -e http.next_request_in -e http.next_response_in -e http.notification -e http.prev_request_in -e http.proxy_authenticate -e http.proxy_authorization -e http.proxy_connect_host -e http.proxy_connect_port -e http.referer -e http.request -e http.request.full_uri -e http.request.line -e http.request.method -e http.request.uri.path -e http.request.uri.query -e http.request.uri.query.parameter -e http.request.version -e http.request_in -e http.request_number -e http.sec_websocket_accept -e http.sec_websocket_extensions -e http.sec_websocket_key -e http.sec_websocket_protocol -e http.sec_websocket_version -e http.server -e http.set_cookie -e http.ssl_port -e http.subdissector_failed -e http.te_and_length -e http.te_unknown -e http.time -e http.tls_port -e http.transfer_encoding -e http.unknown_header -e http.upgrade -e http.user_agent -e http.www_authenticate -e http.x_forwarded_for -e http.cookie -e http.request.uri > $j.csv
			echo "Generando el .uri con tshark del fichero" $j;
			tshark -r $j.pcap -T fields -Y "http.request" -e http.request.uri > $j.uri;
		fi		
	cp $j.uri /home/dit/Downloads/IL_MS/web_dinamica
	cd ../..
	done
cd $RUTA_SCRIPT
