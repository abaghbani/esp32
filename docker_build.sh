# this info is from this line:
# https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-docker-image.html

# IDF Docker Image

docker run --rm \
  -v $PWD:/project \
  -w /project \
  -u $UID \
  -e HOME=/tmp \
  espressif/idf:latest \
  idf.py build


# -u $UID: makes the command run with your user ID so that files are created as you (instead of root).
# -e HOME=/tmp: gives the user a home directory for storing temporary files created by idf.py in ~/.cache.

##### Note
# Commands which communicate with the development board, such as idf.py flash and idf.py monitor does not work in the container, unless the serial port is passed through into the container.
