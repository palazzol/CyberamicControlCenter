;
;	Disassembled by:
;		DASMx object code disassembler
;		(c) Copyright 1996-2003   Conquest Consultants
;		Version 1.40 (Oct 18 2003)
;
;	File:		halfchuck.bin
;
;	Size:		1024 bytes
;	Checksum:	275F
;	CRC-32:		3111EF44
;
;	Date:		Thu Feb 29 14:35:15 2024
;
;	CPU:		MOS Technology 6502 (MCS6500 family)
;
;
;
	org	$1C00
;
RESET:
	cld
	sei
	ldx	#$F0
	txs
	lda	#$00
	ldx	#$10
L1C09:
	sta	RAM_start,x
	inx
	cpx	#$80
	bne	L1C09
	lda	#$00
	sta	transport_control_reg_a
	sta	transport_periph/ddr_reg_a
	sta	audio_control_reg_a
	sta	audio_periph/ddr_reg_a
	sta	audio_control_reg_b
	sta	U18_edge_detect_control_DI_pos
	sta	transport_control_reg_b
	sta	U18_DDRA
	lda	#$02
	sta	U19_DDRA
	lda	#$FF
	sta	audio_periph/ddr_reg_b
	sta	U18_DDRB
	sta	U19_DDRB
	lda	#$FC
	sta	transport_periph/ddr_reg_b
	lda	#$2E
	sta	transport_control_reg_a
	sta	transport_control_reg_b
	lda	#$3C
	sta	audio_control_reg_a
	sta	audio_control_reg_b
	lda	#$64
	sta	RAM_53
	lda	#$64
	sta	RAM_56
	lda	#$F0
	sta	audio_periph/ddr_reg_b
	sta	U19_PORTB
	lda	#$10
	jsr	L1D60
	lda	#$28
	sta	RAM_54
	lda	#$64
	sta	RAM_53
L1C6C:
	jsr	L1E72
	lda	RAM_54
	bne	L1C6C
L1C73:
	lda	#$40
	jsr	L1D74
L1C78:
	lda	#$00
	sta	RAM_58
L1C7C:
	jsr	L1E72
	lda	transport_control_reg_b
	bpl	L1C7C
	lda	#$06
	sta	RAM_54
	lda	#$64
	sta	RAM_53
L1C8C:
	jsr	L1E72
	lda	transport_control_reg_b
	bpl	L1C9F
	inc	RAM_58
	lda	transport_periph/ddr_reg_b
	lda	RAM_58
	cmp	#$64
	bcs	L1CAA
L1C9F:
	lda	RAM_54
	bne	L1C8C
	jmp	L1C78
;
	db	$C9, $60, $90, $00
;
L1CAA:
	lda	#$20
	jsr	L1D74
	lda	#$19
	sta	RAM_54
	lda	#$64
	sta	RAM_53
L1CB7:
	jsr	L1E72
	lda	RAM_54
	bne	L1CB7
	lda	#$00
	sta	RAM_59
	jsr	L1D83
	inc	RAM_59
	lda	#$10
	jsr	L1D60
	lda	#$80
	jsr	L1D60
	jsr	L1DA6
	lda	#$10
	jsr	L1D60
	jsr	L1D33
	lda	#$00
	sta	RAM_5A
L1CE0:
	jsr	L1E72
	lda	RAM_5A
	bne	L1CF4
	lda	#$02
	sta	U19_PORTA
	lda	#$00
	sta	U18_PORTB
	jmp	L1CE0
;
L1CF4:
	jsr	L1D33
	lda	#$00
	sta	U19_PORTA
	lda	#$80
	sta	U18_PORTB
	lda	#$80
	jsr	L1D60
	jsr	L1DA6
	dec	RAM_5A
	jsr	L1DCC
	jsr	L1D33
	lda	#$30
	sta	RAM_56
	lda	#$64
	sta	RAM_55
	inc	RAM_59
	lda	RAM_59
	cmp	#$1A
	bcc	L1D24
	jmp	L1C73
;
L1D24:
	jsr	L1DA6
	lda	#$10
	jsr	L1D60
	lda	#$00
	sta	RAM_5A
	jmp	L1CE0
;
L1D33:
	lda	#$3C
	sta	audio_control_reg_b
	lda	#$34
	sta	audio_control_reg_a
	ldx	#$00
L1D3F:
	lda	#$30
	sta	board_0_control_reg_a,x
	sta	board_0_control_reg_b,x
	lda	#$FF
	sta	board_0_periph/ddr_reg_a,x
	sta	board_0_periph/ddr_reg_b,x
	lda	#$34
	sta	board_0_control_reg_a,x
	sta	board_0_control_reg_b,x
	lda	#$00
	sta	board_0_periph/ddr_reg_a,x
	sta	board_0_periph/ddr_reg_b,x
	inx
	inx
	inx
	inx
	cpx	#$20
	bcc	L1D3F
	rts
;
L1D60:
	sta	transport_periph/ddr_reg_b
	lda	#$FF
	sta	RAM_50
L1D67:
	jsr	L1E72
	lda	RAM_50
	bne	L1D67
	lda	#$00
	sta	transport_periph/ddr_reg_b
	rts
;
L1D74:
	sta	transport_periph/ddr_reg_b
	lda	#$FA
	sta	RAM_50
L1D7B:
	jsr	L1E72
	lda	RAM_50
	bne	L1D7B
	rts
;
L1D83:
	lda	#$00
	sta	RAM_58
L1D87:
	lda	transport_periph/ddr_reg_b
	lda	#$0A
	sta	RAM_50
	inc	RAM_58
	lda	RAM_58
	cmp	#$21
	bcs	L1DA5
L1D96:
	jsr	L1E72
	lda	RAM_50
	beq	L1D83
	lda	transport_control_reg_b
	bpl	L1D96
	jmp	L1D87
L1DA5:
	rts
;
L1DA6:
	lda	#$FA
	sta	RAM_50
L1DAA:
	jsr	L1E72
	lda	RAM_50
	bne	L1DAA
L1DB1:
	jsr	L1E72
	lda	transport_periph/ddr_reg_b
	ror	a
	bcc	L1DB1
	lda	#$A0
	sta	RAM_50
L1DBE:
	jsr	L1E72
	lda	transport_periph/ddr_reg_b
	ror	a
	bcc	L1DB1
	lda	RAM_50
	bne	L1DBE
	rts
;
L1DCC:
	lda	transport_periph/ddr_reg_a
	lda	#$40
	sta	board_0_periph/ddr_reg_b
	sta	board_1_periph/ddr_reg_b
	sta	board_3_periph/ddr_reg_b
	sta	board_4_periph/ddr_reg_b
	lda	#$3C
	sta	audio_control_reg_a
	lda	#$34
	sta	audio_control_reg_b
L1DE3:
	lda	transport_periph/ddr_reg_b
	lsr	a
	bcc	L1DF7
	jsr	L1E72
	lda	transport_control_reg_a
	bpl	L1DE3
	jsr	L1E09
	jmp	L1DE3
;
L1DF7:
	lda	#$64
	sta	RAM_50
L1DFB:
	jsr	L1E72
	lda	transport_periph/ddr_reg_b
	lsr	a
	bcs	L1DCC
	lda	RAM_50
	bne	L1DFB
	rts
;
L1E09:
	lda	transport_periph/ddr_reg_a
	and	#$7F
	sta	RAM_5C
	and	#$7E
	cmp	#$22
	beq	L1E50
	cmp	#$32
	bcc	L1E69
	cmp	#$3A
	bcc	L1E50
	lda	RAM_5C
	cmp	#$41
	bcc	L1E69
	cmp	#$51
	bcs	L1E69
	ldx	RAM_64
	sec
	sbc	#$41
	cmp	#$08
	bcc	L1E33
	inx
	inx
L1E33:
	and	#$07
	tay
	lda	X1E6A,y
	sta	RAM_5D
	lda	RAM_5E
	lsr	a
	bcs	L1E49
	lda	RAM_5D
	eor	#$FF
	and	RAM_start,x
	sta	RAM_start,x
	rts
;
L1E49:
	lda	RAM_5D
	ora	RAM_start,x
	sta	RAM_start,x
	rts
;
L1E50:
	lda	RAM_5C
	sta	RAM_5E
	and	#$7E
	cmp	#$22
	bne	L1E5F
	lda	#$98
	sta	RAM_64
	rts
;
L1E5F:
	sec
	sbc	#$32
	asl	a
	clc
	adc	#$80
	sta	RAM_64
	rts
L1E69:
	rts
;
X1E6A:
	db	$01, $02, $04, $08
	db	$10, $20, $40, $80
;
L1E72:
	lda	U18_edge_detect_control_DI_pos
	sta	RAM_5F
	beq	L1EC9
	lda	RAM_5B
	bmi	L1E8B
	lda	RAM_5F
	and	#$40
	beq	L1E99
	lda	#$80
	sta	RAM_5B
	lda	#$FA
	sta	RAM_51
L1E8B:
	lda	RAM_51
	bne	L1E95
	lda	#$00
	sta	RAM_5B
	inc	RAM_5A
L1E95:
	lda	RAM_5F
	bpl	L1EC9
L1E99:
	lda	X0204
	eor	#$FF
	lsr	a
	lsr	a
	lsr	a
	sta	RAM_57
	bcc	L1EA7
	inc	RAM_57
L1EA7:
	lda	#$7A
	sec
	sbc	RAM_57
	sta	U18_timer_8T_DI
	dec	RAM_50
	dec	RAM_51
	dec	RAM_52
	dec	RAM_53
	bne	L1EC9
	lda	#$64
	sta	RAM_53
	dec	RAM_54
	dec	RAM_55
	bne	L1EC9
	lda	#$64
	sta	RAM_55
	dec	RAM_56
L1EC9:
	rts
;
	db	$03, $04, $06, $08
	db	$10, $16, $20, $2D
	db	$40, $5A, $80, $BF
	db	$FF, $FF, $FF, $FF
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
	db	$00, $00, $00, $00
NMIVEC:
	dw	RAM_start
RESETVEC:
	dw	RESET
IRQVEC:
	dw	RAM_start
