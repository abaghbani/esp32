#!/bin/bash
# This script builds a Zigbee project for ESP32-H2 using Docker and the Espressif IDF environment.

docker run --rm \
  -v $PWD:/project \
  -w /project \
  -u $UID \
  -e HOME=/tmp \
  -it \
  espressif/idf:latest


# idf.py set-target esp32h2
# idf.py build
# idf.py merge-bin -o my-merged-binary.bin -f raw
  