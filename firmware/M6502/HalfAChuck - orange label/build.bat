..\tools\as6500.exe -o -p -s -l halfchuckorange.asm
..\tools\aslink -n -m -u -s halfchuckorange.rel
..\tools\srec2bin.exe -q -o 1C00 -a 0400 -f 00 halfchuckorange.s19 halfchuckorange.bin
fc halfchuckorange.bin halfchuckorange.bin
