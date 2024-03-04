;
;	Disassembled by:
;		DASMx object code disassembler
;		(c) Copyright 1996-2003   Conquest Consultants
;		Version 1.40 (Oct 18 2003)
;
;	File:		halfchuckorange.bin
;
;	Size:		1024 bytes
;	Checksum:	58C0
;	CRC-32:		92503808
;
;	Date:		Thu Feb 29 14:35:35 2024
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
	sta	audio_control_reg_b
	sta	audio_control_reg_a
	lda	#$64
	sta	RAM_53
	lda	#$30
	sta	RAM_56
	lda	#$64
	sta	RAM_55
	lda	#$10
	sta	RAM_63
	lda	#$10
	jsr	L1D55
	lda	#$28
	sta	RAM_54
	lda	#$64
	sta	RAM_53
L1C6A:
	jsr	L1E6B
	lda	RAM_54
	bne	L1C6A
L1C71:
	lda	#$40
	jsr	L1D69
L1C76:
	lda	#$00
	sta	RAM_58
L1C7A:
	jsr	L1E6B
	lda	transport_control_reg_b
	bpl	L1C7A
	lda	#$06
	sta	RAM_54
	lda	#$64
	sta	RAM_53
L1C8A:
	jsr	L1E6B
	lda	transport_control_reg_b
	bpl	L1C9D
	inc	RAM_58
	lda	transport_periph/ddr_reg_b
	lda	RAM_58
	cmp	#$64
	bcs	L1CA8
L1C9D:
	lda	RAM_54
	bne	L1C8A
	jmp	L1C76
;
	db	$C9, $60, $90, $00
;
L1CA8:
	lda	#$20
	jsr	L1D69
	lda	#$19
	sta	RAM_54
	lda	#$64
	sta	RAM_53
L1CB5:
	jsr	L1E6B
	lda	RAM_54
	bne	L1CB5
	lda	#$00
	sta	RAM_59
	jsr	L1D78
	inc	RAM_59
	lda	#$10
	jsr	L1D55
	lda	#$80
	jsr	L1D55
	jsr	L1DA6
	lda	#$10
	jsr	L1D55
	jsr	L1D32
L1CDA:
	jsr	L1E6B
	jsr	L1F0C
	lda	RAM_5A
	bne	L1CF4
	lda	#$02
	sta	U19_PORTA
	lda	#$00
	sta	U18_PORTB
	lda	RAM_56
	bne	L1CDA
	inc	RAM_5A
L1CF4:
	jsr	L1D32
	lda	#$00
	sta	U19_PORTA
	lda	#$80
	sta	U18_PORTB
	lda	#$80
	jsr	L1D55
	jsr	L1DA6
	dec	RAM_5A
	jsr	L1DCC
	jsr	L1D32
	lda	#$30
	sta	RAM_56
	lda	#$64
	sta	RAM_55
	inc	RAM_59
	lda	RAM_59
	cmp	#$1A
	bcc	L1D24
	jmp	L1C71
;
L1D24:
	jsr	L1DA6
	lda	#$10
	jsr	L1D55
	jsr	L1EC3
	jmp	L1CDA
;
L1D32:
	ldx	#$00
L1D34:
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
	bcc	L1D34
	rts
;
L1D55:
	sta	transport_periph/ddr_reg_b
	lda	#$FF
	sta	RAM_50
L1D5C:
	jsr	L1E6B
	lda	RAM_50
	bne	L1D5C
	lda	#$00
	sta	transport_periph/ddr_reg_b
	rts
;
L1D69:
	sta	transport_periph/ddr_reg_b
	lda	#$FA
	sta	RAM_50
L1D70:
	jsr	L1E6B
	lda	RAM_50
	bne	L1D70
	rts
;
L1D78:
	lda	#$00
	sta	RAM_58
L1D7C:
	jsr	L1E6B
	lda	transport_control_reg_b
	bpl	L1D7C
	lda	#$FA
	sta	RAM_50
L1D88:
	jsr	L1E6B
	lda	transport_control_reg_b
	bpl	L1D9B
	inc	RAM_58
	lda	transport_periph/ddr_reg_b
	lda	RAM_58
	cmp	#$60
	bcs	L1DA5
L1D9B:
	lda	RAM_50
	bne	L1D88
	lda	RAM_58
	cmp	#$20
	bcc	L1D78
L1DA5:
	rts
;
L1DA6:
	lda	#$FA
	sta	RAM_50
L1DAA:
	jsr	L1E6B
	lda	RAM_50
	bne	L1DAA
L1DB1:
	jsr	L1E6B
	lda	transport_periph/ddr_reg_b
	ror	a
	bcc	L1DB1
	lda	#$A0
	sta	RAM_50
L1DBE:
	jsr	L1E6B
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
L1DD9:
	lda	transport_periph/ddr_reg_b
	lsr	a
	bcc	L1DF0
	jsr	L1F0C
	jsr	L1E6B
	lda	transport_control_reg_a
	bpl	L1DD9
	jsr	L1E02
	jmp	L1DD9
;
L1DF0:
	lda	#$64
	sta	RAM_50
L1DF4:
	jsr	L1E6B
	lda	transport_periph/ddr_reg_b
	lsr	a
	bcs	L1DCC
	lda	RAM_50
	bne	L1DF4
	rts
;
L1E02:
	lda	transport_periph/ddr_reg_a
	and	#$7F
	sta	RAM_5C
	and	#$7E
	cmp	#$22
	beq	L1E49
	cmp	#$32
	bcc	L1E62
	cmp	#$3A
	bcc	L1E49
	lda	RAM_5C
	cmp	#$41
	bcc	L1E62
	cmp	#$51
	bcs	L1E62
	ldx	RAM_64
	sec
	sbc	#$41
	cmp	#$08
	bcc	L1E2C
	inx
	inx
L1E2C:
	and	#$07
	tay
	lda	X1E63,y
	sta	RAM_5D
	lda	RAM_5E
	lsr	a
	bcs	L1E42
	lda	RAM_5D
	eor	#$FF
	and	RAM_start,x
	sta	RAM_start,x
	rts
;
L1E42:
	lda	RAM_5D
	ora	RAM_start,x
	sta	RAM_start,x
	rts
;
L1E49:
	lda	RAM_5C
	sta	RAM_5E
	and	#$7E
	cmp	#$22
	bne	L1E58
	lda	#$98
	sta	RAM_64
	rts
;
L1E58:
	sec
	sbc	#$32
	asl	a
	clc
	adc	#$80
	sta	RAM_64
	rts
L1E62:
	rts
;
X1E63:
	db	$01, $02, $04, $08
	db	$10, $20, $40, $80
;
L1E6B:
	lda	U18_edge_detect_control_DI_pos
	sta	RAM_5F
	beq	L1EC2
	lda	RAM_5B
	bmi	L1E84
	lda	RAM_5F
	and	#$40
	beq	L1E92
	lda	#$80
	sta	RAM_5B
	lda	#$FA
	sta	RAM_51
L1E84:
	lda	RAM_51
	bne	L1E8E
	lda	#$00
	sta	RAM_5B
	inc	RAM_5A
L1E8E:
	lda	RAM_5F
	bpl	L1EC2
L1E92:
	lda	U18_edge_detect_control_DI_neg
	eor	#$FF
	lsr	a
	lsr	a
	lsr	a
	sta	RAM_57
	bcc	L1EA0
	inc	RAM_57
L1EA0:
	lda	#$7A
	sec
	sbc	RAM_57
	sta	U18_timer_8T_DI
	dec	RAM_50
	dec	RAM_51
	dec	RAM_52
	dec	RAM_53
	bne	L1EC2
	lda	#$64
	sta	RAM_53
	dec	RAM_54
	dec	RAM_55
	bne	L1EC2
	lda	#$64
	sta	RAM_55
	dec	RAM_56
L1EC2:
	rts
;
L1EC3:
	lda	#$00
	sta	RAM_61
	sta	RAM_62
	lda	#$0A
	sta	RAM_54
	lda	#$64
	sta	RAM_53
L1ED1:
	jsr	L1E6B
	lda	RAM_54
	bne	L1ED1
	lda	#$0A
	sta	RAM_54
	lda	#$64
	sta	RAM_53
	lda	RAM_62
	cmp	#$08
	beq	L1EFB
	inc	RAM_62
	ldx	#$09
	sec
	lda	audio_periph/ddr_reg_a
L1EEE:
	rol	a
	dex
	bcc	L1EEE
	clc
	txa
	adc	RAM_61
	sta	RAM_61
	jmp	L1ED1
;
L1EFB:
	lsr	RAM_61
	lsr	RAM_61
	lsr	RAM_61
	lda	RAM_61
	sta	RAM_60
	lda	#$00
	sta	RAM_61
	sta	RAM_62
	rts
;
L1F0C:
	lda	U19_PORTA
	eor	#$FF
	lsr	a
	lsr	a
	lsr	a
	lsr	a
	clc
	adc	RAM_60
	tax
	lda	X1F3F,x
	sta	RAM_63
	lda	RAM_52
	bne	L1F38
	lda	#$0A
	sta	RAM_52
	lda	RAM_63
	cmp	audio_periph/ddr_reg_b
	bcc	L1F35
	beq	L1F38
	inc	audio_periph/ddr_reg_b
	jmp	L1F38
;
L1F35:
	dec	audio_periph/ddr_reg_b
L1F38:
	lda	audio_periph/ddr_reg_b
	sta	U19_PORTB
	rts
;
X1F3F:
	db	$03, $04, $06, $08
	db	$10, $16, $20, $2D
	db	$40, $5A, $80, $BF
	db	$FF, $FF, $FF, $FF
	db	$FF, $00, $00, $00
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
	db	$00, $00, $00
NMIVEC:
	dw	RAM_start
RESETVEC:
	dw	RESET
IRQVEC:
	dw	RAM_start
