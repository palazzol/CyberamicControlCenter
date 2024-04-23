..\tools\as6500.exe -o -p -s -l halfchuck.asm
..\tools\aslink -n -m -u -s halfchuck.rel
..\tools\srec2bin.exe -q -o 1C00 -a 0400 -f 00 halfchuck.s19 halfchuck.bin
fc halfchuck.bin halfchuck_ref.bin
