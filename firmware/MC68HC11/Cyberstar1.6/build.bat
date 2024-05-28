..\tools\as6811.exe -o -p -s -l cyberstar16.asm
..\tools\aslink.exe -n -m -u -s cyberstar16.rel
..\tools\srec2bin -q -o 8000 -a 8000 -f ff cyberstar16.s19 cyberstar16.bin
fc Cyberamic_1.6_R12_27C256.BIN cyberstar16.bin


