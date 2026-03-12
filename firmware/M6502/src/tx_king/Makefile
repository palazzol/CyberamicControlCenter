
FILEROOT := tx_king

all:
	@echo "Assembling..."
	../tools/as6500 -o -p -s -l $(FILEROOT).asm
	@echo "Linking..."
	../tools/aslink -n -m -u -s $(FILEROOT).rel
	@echo "Converting to binary..."
	objcopy -I srec -O binary $(FILEROOT).s19 $(FILEROOT).bin
	@echo
	@echo "Comparing with reference file..."
	cmp -b $(FILEROOT)_ref.bin $(FILEROOT).bin
	@echo
	@echo "Success!"

.PHONY: clean
clean:
	@rm $(FILEROOT).bin
	@rm $(FILEROOT).s19
	@rm $(FILEROOT).rel
	@rm $(FILEROOT).sym
	@rm $(FILEROOT).rst
	@rm $(FILEROOT).map
	@rm $(FILEROOT).lst
	@rm $(FILEROOT).hlr
	@echo "Success!"
	


