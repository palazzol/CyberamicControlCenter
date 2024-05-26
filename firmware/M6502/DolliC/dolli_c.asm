        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Dolli Dimples Program
;       Version C ?
;
;       This image was recovered from a 2708 with a label "Dolli C 1C00"
;
RAM_02 = 0x0002
RAM_08 = 0x0008
RAM_50 = 0x0050
RAM_51 = 0x0051
RAM_52 = 0x0052
RAM_53 = 0x0053
RAM_54 = 0x0054
RAM_55 = 0x0055
RAM_56 = 0x0056
RAM_57 = 0x0057
RAM_58 = 0x0058
RAM_59 = 0x0059
RAM_5A = 0x005A
RAM_5B = 0x005B
RAM_5C = 0x005C
RAM_5D = 0x005D
RAM_5E = 0x005E
RAM_5F = 0x005F
RAM_60 = 0x0060
RAM_61 = 0x0061
RAM_62 = 0x0062
RAM_63 = 0x0063

        .include "../include/ptt6502.def"

        .org    0x1C00
;
RESET:
        cld
        sei
        ldx     #0xF0
        txs
        lda     #0x00
        ldx     #0x10
L1C09:
        sta     RAM_start,x
        inx
        cpx     #0x80
        bne     L1C09
        lda     #0x00
        sta     transport_control_reg_a
        sta     transport_periph$ddr_reg_a
        sta     audio_control_reg_a
        sta     audio_periph$ddr_reg_a
        sta     audio_control_reg_b
        sta     U18_edge_detect_control_DI_pos
        sta     transport_control_reg_b
        sta     U18_DDRA
        lda     #0x02
        sta     U19_DDRA
        lda     #0xFF
        sta     audio_periph$ddr_reg_b
        sta     U18_DDRB
        sta     U19_DDRB
        lda     #0xFC
        sta     transport_periph$ddr_reg_b
        lda     #0x2E
        sta     transport_control_reg_a
        sta     transport_control_reg_b
        sta     audio_control_reg_b
        sta     audio_control_reg_a
        lda     #0x64
        sta     RAM_53
        lda     #0x2B
        sta     RAM_57
        lda     #0x10
        sta     RAM_63
        lda     #0x10
        jsr     L1D1F
        lda     #0x28
        sta     RAM_54
L1C62:
        jsr     L1E13
        lda     RAM_54
        bne     L1C62
L1C69:
        lda     #0x40
        jsr     L1D1F
L1C6E:
        jsr     L1D33
        lda     RAM_58
        cmp     #0x60
        bcc     L1C6E
        lda     #0x20
        jsr     L1D1F
        lda     #0x19
        sta     RAM_54
L1C80:
        jsr     L1E13
        lda     RAM_54
        bne     L1C80
        lda     #0x00
        sta     RAM_59
        jsr     L1D33
        inc     RAM_59
        lda     #0x10
        jsr     L1D1F
        lda     #0x80
        jsr     L1D1F
        jsr     L1D61
        lda     #0x10
        jsr     L1D1F
        jsr     L1CF9
L1CA5:
        jsr     L1E13
        jsr     L1EA0
        lda     RAM_5A
        bne     L1CBF
        lda     #0x02
        sta     U19_PORTA
        lda     #0x00
        sta     U18_PORTB
        lda     RAM_57
        bne     L1CA5
        inc     RAM_5A
L1CBF:
        jsr     L1CF9
        lda     #0x00
        sta     U19_PORTA
        lda     #0x80
        sta     U18_PORTB
        lda     #0x80
        jsr     L1D1F
        jsr     L1D61
        dec     RAM_5A
        jsr     L1D87
        jsr     L1CF9
        lda     #0x2B
        sta     RAM_57
        inc     RAM_59
        lda     RAM_59
        cmp     #0x1A
        bcc     L1CEB
        jmp     L1C69
;
L1CEB:
        jsr     L1D61
        lda     #0x10
        jsr     L1D1F
        jsr     L1E5F
        jmp     L1CA5
;
L1CF9:
        lda     #0x00
        ldx     #0x01
        jsr     L1D16
        lda     #0xFF
        ldx     #0x00
        jsr     L1D16
        lda     #0x34
        ldx     #0x01
        jsr     L1D16
        lda     #0x00
        ldx     #0x00
        jsr     L1D16
        rts
;
L1D16:
        sta     board_2_periph$ddr_reg_a,x
        sta     board_2_periph$ddr_reg_b,x
        sta     board_3_periph$ddr_reg_a,x
        sta     board_3_periph$ddr_reg_b,x
        rts
;
L1D1F:
        sta     transport_periph$ddr_reg_b
        lda     #0xFF
        sta     RAM_50
L1D26:
        jsr     L1E13
        lda     RAM_50
        bne     L1D26
        lda     #0x00
        sta     transport_periph$ddr_reg_b
        rts
;
L1D33:
        lda     #0x00
        sta     RAM_58
L1D37:
        jsr     L1E13
        lda     transport_control_reg_b
        bpl     L1D37
        lda     #0x04
        sta     RAM_54
L1D43:
        jsr     L1E13
        lda     transport_control_reg_b
        bpl     L1D56
        inc     RAM_58
        lda     transport_periph$ddr_reg_b
        lda     RAM_58
        cmp     #0x60
        bcs     L1D60
L1D56:
        lda     RAM_54
        bne     L1D43
        lda     RAM_58
        cmp     #0x20
        bcc     L1D33
L1D60:
        rts
;
L1D61:
        lda     #0xFA
        sta     RAM_50
L1D65:
        jsr     L1E13
        lda     RAM_50
        bne     L1D65
L1D6C:
        jsr     L1E13
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1D6C
        lda     #0xA0
        sta     RAM_50
L1D79:
        jsr     L1E13
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1D6C
        lda     RAM_50
        bne     L1D79
        rts
;
L1D87:
        lda     transport_periph$ddr_reg_a
        lda     #0x40
        sta     board_2_periph$ddr_reg_b
        sta     board_3_periph$ddr_reg_b
L1D90:
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcc     L1DA7
        jsr     L1EA0
        jsr     L1E13
        lda     transport_control_reg_a
        bpl     L1D90
        jsr     L1DB9
        jmp     L1D90
;
L1DA7:
        lda     #0x64
        sta     RAM_50
L1DAB:
        jsr     L1E13
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcs     L1D87
        lda     RAM_50
        bne     L1DAB
        rts
;
L1DB9:
        lda     transport_periph$ddr_reg_a
        and     #0x7F
        sta     RAM_5C
        and     #0x7E
        cmp     #0x22
        beq     L1DFE
        cmp     #0x36
        beq     L1DFE
        lda     RAM_5C
        sec
        sbc     #0x41
        tay
        bmi     L1E02
        cmp     #0x10
        bcs     L1E02
        ldx     #0x84
        cmp     #0x08
        bcc     L1DE4
        ldx     #0x88
        cmp     #0x0E
        bcc     L1DE4
        ldx     #0x8A
L1DE4:
        lda     X1E03,y
        sta     RAM_5D
        lda     RAM_5E
        lsr     a
        bcs     L1DF7
        lda     RAM_5D
        eor     #0xFF
        and     RAM_start,x
        sta     RAM_start,x
        rts
;
L1DF7:
        lda     RAM_5D
        ora     RAM_start,x
        sta     RAM_start,x
        rts
;
L1DFE:
        lda     RAM_5C
        sta     RAM_5E
L1E02:
        rts
;
X1E03:
        .db     0x01,0x02,0x04,0x08
        .db     0x10,0x20,0x40,0x80
        .db     0x01,0x02,0x04,0x08
        .db     0x10,0x20,0x01,0x02
;
L1E13:
        lda     U18_edge_detect_control_DI_pos
        sta     RAM_5F
        beq     L1E5E
        lda     RAM_5B
        bmi     L1E2C
        lda     RAM_5F
        and     #0x40
        beq     L1E3A
        lda     #0x80
        sta     RAM_5B
        lda     #0xFA
        sta     RAM_51
L1E2C:
        lda     RAM_51
        bne     L1E36
        lda     #0x00
        sta     RAM_5B
        inc     RAM_5A
L1E36:
        lda     RAM_5F
        bpl     L1E5E
L1E3A:
        lda     U18_timer
        lda     #0x01
        sta     X0217
        dec     RAM_50
        dec     RAM_51
        dec     RAM_52
        dec     RAM_53
        bne     L1E5E
        lda     #0x64
        sta     RAM_53
        dec     RAM_54
        dec     RAM_55
        dec     RAM_56
        bne     L1E5E
        lda     #0x64
        sta     RAM_56
        dec     RAM_57
L1E5E:
        rts
;
L1E5F:
        lda     #0x00
        sta     RAM_61
        sta     RAM_62
        lda     #0x0A
        sta     RAM_54
L1E69:
        jsr     L1E13
        lda     RAM_54
        bne     L1E69
        lda     #0x0A
        sta     RAM_54
        lda     RAM_62
        cmp     #0x08
        beq     L1E8F
        inc     RAM_62
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a
L1E82:
        rol     a
        dex
        bcc     L1E82
        clc
        txa
        adc     RAM_61
        sta     RAM_61
        jmp     L1E69
;
L1E8F:
        lsr     RAM_61
        lsr     RAM_61
        lsr     RAM_61
        lda     RAM_61
        sta     RAM_60
        lda     #0x00
        sta     RAM_61
        sta     RAM_62
        rts
;
L1EA0:
        lda     U19_PORTA
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     RAM_60
        tax
        lda     X1ED3,x
        sta     RAM_63
        lda     RAM_52
        bne     L1ECC
        lda     #0x0A
        sta     RAM_52
        lda     RAM_63
        cmp     audio_periph$ddr_reg_b
        bcc     L1EC9
        beq     L1ECC
        inc     audio_periph$ddr_reg_b
        jmp     L1ECC
;
L1EC9:
        dec     audio_periph$ddr_reg_b
L1ECC:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts
;
X1ED3:
        .db     0x03, 0x04, 0x06, 0x08
        .db     0x10, 0x16, 0x20, 0x2D
        .db     0x40, 0x5A, 0x80, 0xBF
        .db     0xFF, 0xFF, 0xFF, 0xFF 
        .db     0xFF
;
; all ff's in this gap
;
        .org    0x1FFC
;
; vectors
;
RESETVEC:
        .dw     RESET
IRQVEC:
        .dw     0xFFFF
