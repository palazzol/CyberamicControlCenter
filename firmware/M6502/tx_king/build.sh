#python ../../../../../pydisass6502/disass.py -nc -d ./datafile.json -i $1_ref.bin -a 0x1000 -o $1.asm

run () {
    echo "    $@"
    $@
    if [ $? -ne 0 ]; then
        echo -e "\e[41mError(s) during build.\e[0m"
        exit 1
    fi
}

echo "Assembling..."
run ../tools/as6500 -o -p -s -l $1.asm

echo "Linking..."
run ../tools/aslink -n -m -u -s $1.rel

echo "Converting s19 to bin..."
run objcopy -I srec -O binary --gap-fill 0xff $1.s19 $1.bin
echo

echo "Comparing..."
run cmp -b "$1_ref.bin" "$1.bin"
echo

echo -e  "\e[32mSuccess!\e[0m"
