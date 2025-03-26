#!/bin/sh

cp $PWD/user_config_override.h $PWD/Tasmota/tasmota
cp $PWD/platformio_override.ini $PWD/Tasmota/tasmota
docker run -it --rm -v $PWD/Tasmota:/tasmota -u $UID:$GID docker-tasmota -e tasmota32c3
