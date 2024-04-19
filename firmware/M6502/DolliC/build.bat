..\tools\as6500.exe -o -p -s -l dolli_c.asm
..\tools\aslink -n -m -u -s dolli_c.rel
..\tools\srec2bin.exe -q -o 1C00 -a 0400 -f ff dolli_c.s19 dolli_c.bin
fc dolli_c.bin dolli_c_ref.bin
