..\tools\as6500.exe -o -p -s -l unknown1.asm
..\tools\aslink -n -m -u -s unknown1.rel
..\tools\srec2bin.exe -q -o 1C00 -a 0400 -f 00 unknown1.s19 unknown1.bin
fc unknown1.bin unknown1_ref.bin
