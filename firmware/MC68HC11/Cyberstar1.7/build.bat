..\tools\as6811.exe -o -p -s -l cyberstar17.asm
..\tools\aslink.exe -n -m -u -s cyberstar17.rel
..\tools\srec2bin -q -o 8000 -a 8000 -f ff cyberstar17.s19 cyberstar17.bin
fc Cyberstar_1.7_68hc11_cpu_dvd_27c256.bin cyberstar17.bin



