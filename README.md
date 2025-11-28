# ESP32
## building with docker image
- complete information is [here](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/tools/idf-docker-image.html)

- to start building a project just run this: 
```
docker run --rm -v $PWD:/project -w /project -u $UID -e HOME=/tmp espressif/idf:latest idf.py build
```
- to access al command of idf.py we can run as interactive:
```
docker run --rm -v $PWD:/project -w /project -u $UID -e HOME=/tmp -it espressif/idf:latest
```

Note: before start build a project we should set target (esp32, esp32s2, esp32s3, esp32c3, esp32c6, esp32h2, ...):
```
idf.py set-target esp32c6
```
**Commands which communicate with the development board, such as idf.py flash and idf.py monitor does not work in the container, unless the serial port is passed through into the container.**\

Note: output is usually 3 files: 
- bootloader(0x0) 
- partition-table(0x8000)
- application(0x10000)

merge-bin can merge all 3 binary files and make a single files flashing start from address 0x0000
```
iidf.py merge-bin -o my-merged-binary.bin -f raw
```
---
## install build tools (locally):
- just clone [esp-idf](https://github.com/espressif/esp-idf), currently I'm using release/V5.3 branch.\
mkdir -p /your/custom/path\
cd /your/custom/path
```
git clone --recursive https://github.com/espressif/esp-idf.git
```

- in root of this folder, run `install.bat` or `install.sh` to install all required tools.\
**note: if you want to install tools in specific folder:**\
1- export IDF_TOOLS_PATH="/your/costum/folder/idf_tools/" \
2- /yourpath/esp-idf/install.sh esp32c6 esp32c5

- there is `my_install.bat`, `my_install.sh` in this repo that can do all.

## Export all setting before Build a project:
- going to root of project run `export.bat` or `export.sh`\
**note: in case of toolchain from specific folder:**\
1- export IDF_TOOLS_PATH="/your/costum/folder/idf_tools/" \
2- /yourpath/esp-idf/export.sh \
- we can use `my_export.bat` or `my_export.sh` instead, these two files are in root of this repo.

## Build project
now we should go to root of our project:
- set target \
idf.py set-target esp32c6
- before build the project if need configuration\
idf.py menuconfig
- build project \
idf.py build
- flash output on target board \
idf.py -p PORT flash \
**note: PORT should be found in your devic list** \
@macos command is like this:\
idf.py -p /dev/cu.wchusbserial58FC0539021 flash

## Debugging
for debugging we can use any terminal
- in macocX (terminal or zsh of vscode): 
```
screen /dev/cu.wchusbserial58FC0539021 115200
```
- in macosX bash (vscode):\
idf.py -p /dev/cu.wchusbserial58FC0539021 monitir\
*to exit: press Ctrl + ] (Control key + Right Bracket).*
- in windows:\
idf.py -p COM\# monitor


