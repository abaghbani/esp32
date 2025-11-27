# this info is from this line:
# https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-docker-image.html

# IDF Docker Image

docker run --rm \
  -v $PWD:/project \
  -w /project \
  -u $UID \
  -e HOME=/tmp \
  -it \
  espressif/idf:latest \
  # idf.py set-target esp32h2
  # idf.py build
  # idf.py merge-bin -o my-merged-binary.bin -f raw
  
  
# -u $UID: makes the command run with your user ID so that files are created as you (instead of root).
# -e HOME=/tmp: gives the user a home directory for storing temporary files created by idf.py in ~/.cache.

##### Note
# Commands which communicate with the development board, such as idf.py flash and idf.py monitor does not work in the container, unless the serial port is passed through into the container.
# important-1: before build a project set-target should be implied
# important-2: output is usually 3 files (bootloader(0x0), partition-table(0x8000), application(0x10000))
# merge-bin can merge all 3 binary files and make a single files flashing from address 0x0
