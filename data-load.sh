#!/bin/bash
#
#  Command Line Interface to start all services associated with the Entity-Relationships Tutorial
#
#  For this tutorial the commands are merely a convenience script to run docker compose
#

set -e

CONTEXT="http://context/user-context.jsonld"
CORE_CONTEXT="https://uri.etsi.org/ngsi-ld/v1/ngsi-ld-core-context-v1.8.jsonld"
DATA_LOADER="http://tutorial:3000"
IOT_DEVICES="http://iot-sensors:3001"


docker run -v $(pwd)/import-data-static:/import-data-static \
	    -v $(pwd)/data/:/home/curl_user/data \
		--network fiware_default \
		-e CONTEXT_BROKER=${CONTEXT_BROKER} \
		-e DATA_LOADER=${DATA_LOADER} \
		-e IOT_DEVICES=${IOT_DEVICES} \
		-e TUTORIAL_DATA_MODELS_CONTEXT="http://context/user-context.jsonld" \
		--entrypoint /bin/ash quay.io/curl/curl:8.4.0 /import-data-static
