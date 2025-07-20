# ESP32

## install tools:
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


