..\tools\as6500.exe -o -p -s -l unknown2.asm
..\tools\aslink -n -m -u -s unknown2.rel
..\tools\srec2bin.exe -q -o 1C00 -a 0400 -f 00 unknown2.s19 unknown2.bin
fc unknown2.bin unknown2_ref.bin
