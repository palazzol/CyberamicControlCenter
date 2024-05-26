
        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Unknown Program (2)
;       Version Unknown
;
;       This image was recovered from the last quarter of a 2732
;
RAM_start = 0x0000
X0002 = 0x0002
X0008 = 0x0008
X0050 = 0x0050
X0051 = 0x0051
X0052 = 0x0052
X0053 = 0x0053
X0054 = 0x0054
X0055 = 0x0055
X0056 = 0x0056
X0057 = 0x0057
X0058 = 0x0058
X0059 = 0x0059
X005A = 0x005A
X005C = 0x005C
X005D = 0x005D
X005E = 0x005E
X005F = 0x005F
X0060 = 0x0060
X0061 = 0x0061
X0062 = 0x0062
X0063 = 0x0063
X0064 = 0x0064

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
        lda     #0x3C
        sta     audio_control_reg_a
        sta     audio_control_reg_b
        lda     #0x64
        sta     X0053
        lda     #0x1E
        sta     X0056
        lda     #0x64
        sta     X0055
        lda     #0x10
        sta     X0063
        lda     #0x10
        jsr     L1D7C
        lda     #0x28
        sta     X0054
        lda     #0x64
        sta     X0053
L1C6C:
        jsr     L1E8D
        lda     X0054
        bne     L1C6C
L1C73:
        lda     #0x40
        jsr     L1D7C
L1C78:
        lda     #0x00
        sta     X0058
L1C7C:
        jsr     L1E8D
        lda     transport_control_reg_b
        bpl     L1C7C
        lda     #0x06
        sta     X0054
        lda     #0x64
        sta     X0053
L1C8C:
        jsr     L1E8D
        lda     transport_control_reg_b
        bpl     L1C9F
        inc     X0058
        lda     transport_periph$ddr_reg_b
        lda     X0058
        cmp     #0x64
        bcs     L1CAA
L1C9F:
        lda     X0054
        bne     L1C8C
        jmp     L1C78
;
        cmp     #0x60
        bcc     L1CAA
L1CAA:
        lda     #0x20
        jsr     L1D7C
        lda     #0x19
        sta     X0054
        lda     #0x64
        sta     X0053
L1CB7:
        jsr     L1E8D
        lda     X0054
        bne     L1CB7
        lda     #0x00
        sta     X0059
        jsr     L1D97
        lda     #0x40
        jsr     L1D7C
        jsr     L1D97
        lda     #0xFA
        sta     X0050
L1CD1:
        jsr     L1E8D
        lda     X0050
        bne     L1CD1
        lda     #0x20
        jsr     L1D7C
        jsr     L1D97
        inc     X0059
        lda     #0x10
        jsr     L1D7C
        lda     #0x80
        jsr     L1D7C
        jsr     L1DBA
        lda     #0x10
        jsr     L1D7C
        jsr     L1D4F
L1CF7:
        jsr     L1E8D
        jsr     L1F1A
        lda     X005A
        bne     L1D11
        lda     #0x02
        sta     U19_PORTA
        lda     #0x00
        sta     U18_PORTB
        lda     X0056
        bne     L1CF7
        inc     X005A
L1D11:
        jsr     L1D4F
        lda     #0x00
        sta     U19_PORTA
        lda     #0x80
        sta     U18_PORTB
        lda     #0x80
        jsr     L1D7C
        jsr     L1DBA
        dec     X005A
        jsr     L1DE0
        jsr     L1D4F
        lda     #0x1E
        sta     X0056
        lda     #0x64
        sta     X0055
        inc     X0059
        lda     X0059
        cmp     #0x1A
        bcc     L1D41
        jmp     L1C73
;
L1D41:
        jsr     L1DBA
        lda     #0x10
        jsr     L1D7C
        jsr     L1ED1
        jmp     L1CF7
;
L1D4F:
        lda     #0x3C
        sta     audio_control_reg_b
        lda     #0x34
        sta     audio_control_reg_a
        ldx     #0x00
L1D5B:
        lda     #0x30
        sta     board_1_control_reg_a,x
        sta     board_1_control_reg_b,x
        lda     #0xFF
        sta     board_1_periph$ddr_reg_a,x
        sta     board_1_periph$ddr_reg_b,x
        lda     #0x34
        sta     board_1_control_reg_a,x
        sta     board_1_control_reg_b,x
        lda     #0x00
        sta     board_1_periph$ddr_reg_a,x
        sta     board_1_periph$ddr_reg_b,x
        inx
        inx
        inx
        inx
        cpx     #0x20
        bcc     L1D5B
        rts
;
L1D7C:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     X0050
L1D83:
        jsr     L1E8D
        lda     X0050
        bne     L1D83
        lda     transport_periph$ddr_reg_b
        and     #0x60
        bne     L1D96
        lda     #0x00
        sta     transport_periph$ddr_reg_b
L1D96:
        rts
;
L1D97:
        lda     #0x00
        sta     X0058
L1D9B:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     X0050
        inc     X0058
        lda     X0058
        cmp     #0x21
        bcs     L1DB9
L1DAA:
        jsr     L1E8D
        lda     X0050
        beq     L1D97
        lda     transport_control_reg_b
        bpl     L1DAA
        jmp     L1D9B
L1DB9:
        rts
;
L1DBA:
        lda     #0xFA
        sta     X0050
L1DBE:
        jsr     L1E8D
        lda     X0050
        bne     L1DBE
L1DC5:
        jsr     L1E8D
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1DC5
        lda     #0xA0
        sta     X0050
L1DD2:
        jsr     L1E8D
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1DC5
        lda     X0050
        bne     L1DD2
        rts
;
L1DE0:
        lda     transport_periph$ddr_reg_a
        lda     #0x40
        sta     board_1_periph$ddr_reg_b
        sta     board_2_periph$ddr_reg_b
        sta     board_3_periph$ddr_reg_b
        sta     board_4_periph$ddr_reg_b
        lda     #0x3C
        sta     audio_control_reg_a
        lda     #0x34
        sta     audio_control_reg_b
        lda     #0x60
        sta     board_1_periph$ddr_reg_b
L1DFB:
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcc     L1E12
        jsr     L1F1A
        jsr     L1E8D
        lda     transport_control_reg_a
        bpl     L1DFB
        jsr     L1E24
        jmp     L1DFB
;
L1E12:
        lda     #0x64
        sta     X0050
L1E16:
        jsr     L1E8D
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcs     L1DE0
        lda     X0050
        bne     L1E16
        rts
;
L1E24:
        lda     transport_periph$ddr_reg_a
        and     #0x7F
        sta     X005C
        and     #0x7E
        cmp     #0x22
        beq     L1E6B
        cmp     #0x32
        bcc     L1E84
        cmp     #0x3A
        bcc     L1E6B
        lda     X005C
        cmp     #0x41
        bcc     L1E84
        cmp     #0x51
        bcs     L1E84
        ldx     X0064
        sec
        sbc     #0x41
        cmp     #0x08
        bcc     L1E4E
        inx
        inx
L1E4E:
        and     #0x07
        tay
        lda     X1E85,y
        sta     X005D
        lda     X005E
        lsr     a
        bcs     L1E64
        lda     X005D
        eor     #0xFF
        and     RAM_start,x
        sta     RAM_start,x
        rts
;
L1E64:
        lda     X005D
        ora     RAM_start,x
        sta     RAM_start,x
        rts
;
L1E6B:
        lda     X005C
        sta     X005E
        and     #0x7E
        cmp     #0x22
        bne     L1E7A
        lda     #0x98
        sta     X0064
        rts
;
L1E7A:
        sec
        sbc     #0x32
        asl     a
        clc
        adc     #0x80
        sta     X0064
        rts
L1E84:
        rts
;
X1E85:
        .db     0x01,0x02,0x04,0x08
        .db     0x10,0x20,0x40,0x80
;
L1E8D:
        lda     U18_edge_detect_control_DI_pos
        sta     X005F
        beq     L1ED0
        and     #0x40
        beq     L1E9C
        lda     #0x01
        sta     X005A
L1E9C:
        lda     X005F
        bpl     L1ED0
        lda     U18_timer
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        sta     X0057
        bcc     L1EAE
        inc     X0057
L1EAE:
        lda     #0x7A
        sec
        sbc     X0057
        sta     U18_timer_8T_DI
        dec     X0050
        dec     X0051
        dec     X0052
        dec     X0053
        bne     L1ED0
        lda     #0x64
        sta     X0053
        dec     X0054
        dec     X0055
        bne     L1ED0
        lda     #0x64
        sta     X0055
        dec     X0056
L1ED0:
        rts
;
L1ED1:
        lda     #0x00
        sta     X0061
        sta     X0062
        lda     #0x0A
        sta     X0054
        lda     #0x64
        sta     X0053
L1EDF:
        jsr     L1E8D
        lda     X0054
        bne     L1EDF
        lda     #0x0A
        sta     X0054
        lda     #0x64
        sta     X0053
        lda     X0062
        cmp     #0x08
        beq     L1F09
        inc     X0062
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a
L1EFC:
        rol     a
        dex
        bcc     L1EFC
        clc
        txa
        adc     X0061
        sta     X0061
        jmp     L1EDF
;
L1F09:
        lsr     X0061
        lsr     X0061
        lsr     X0061
        lda     X0061
        sta     X0060
        lda     #0x00
        sta     X0061
        sta     X0062
        rts
;
L1F1A:
        lda     U19_PORTA
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     X0060
        tax
        lda     X1F4D,x
        sta     X0063
        lda     X0052
        bne     L1F46
        lda     #0x0A
        sta     X0052
        lda     X0063
        cmp     audio_periph$ddr_reg_b
        bcc     L1F43
        beq     L1F46
        inc     audio_periph$ddr_reg_b
        jmp     L1F46
;
L1F43:
        dec     audio_periph$ddr_reg_b
L1F46:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts
;
X1F4D:
        .db     0x03, 0x04, 0x06, 0x08
        .db     0x10, 0x16, 0x20, 0x2D
        .db     0x40, 0x5A, 0x80, 0xBF
        .db     0xFF, 0xFF, 0xFF, 0xFF
        .db     0xFF
;
; all zeros in this gap
;
        .org    0x1FFC
;
; vectors
;
RESETVEC:
        .dw     RESET
IRQVEC:
        .dw     RAM_start
