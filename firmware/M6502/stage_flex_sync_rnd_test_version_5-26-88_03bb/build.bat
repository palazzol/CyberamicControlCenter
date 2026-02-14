..\tools\as6500.exe -o -p -s -l main.asm
..\tools\aslink -n -m -u -s main.rel
..\tools\srec2bin.exe -q -o 1000 -a 1000 -f ff main.s19 main.bin
fc main.bin main_ref.bin
