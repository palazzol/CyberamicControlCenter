
        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       The Beagles/King Program
;       Version Unknown
;
;       This image was recovered from a 2708 with an orange label
;
; start of RAM
RAM_start = 0x0000

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
RAM_64 = 0x0064

board_1_periph$ddr_reg_a   = 0x0080
board_1_control_reg_a      = 0x0081
board_1_periph$ddr_reg_b   = 0x0082
board_1_control_reg_b      = 0x0083
board_2_periph$ddr_reg_b   = 0x0086
board_3_periph$ddr_reg_b   = 0x008A
board_4_periph$ddr_reg_b   = 0x008E
U18_PORTA                  = 0x0200
U18_DDRA                   = 0x0201
U18_PORTB                  = 0x0202
U18_DDRB                   = 0x0203
U18_edge_detect_control_DI_neg = 0x0204
U18_edge_detect_control_DI_pos = 0x0205
U18_timer_8T_DI            = 0x0215
U19_PORTA                  = 0x0280
U19_DDRA                   = 0x0281
U19_PORTB                  = 0x0282
U19_DDRB                   = 0x0283
transport_periph$ddr_reg_a = 0x0300
transport_control_reg_a    = 0x0301
transport_periph$ddr_reg_b = 0x0302
transport_control_reg_b    = 0x0303
audio_periph$ddr_reg_a     = 0x0380
audio_control_reg_a        = 0x0381
audio_periph$ddr_reg_b     = 0x0382
audio_control_reg_b        = 0x0383

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
        lda     #0x30
        sta     RAM_56
        lda     #0x64
        sta     RAM_55
        lda     #0x10
        sta     RAM_63
        lda     #0x10
        jsr     L1D55
        lda     #0x28
        sta     RAM_54
        lda     #0x64
        sta     RAM_53
L1C6A:
        jsr     L1E6B
        lda     RAM_54
        bne     L1C6A
L1C71:
        lda     #0x40
        jsr     L1D69
L1C76:
        lda     #0x00
        sta     RAM_58
L1C7A:
        jsr     L1E6B
        lda     transport_control_reg_b
        bpl     L1C7A
        lda     #0x06
        sta     RAM_54
        lda     #0x64
        sta     RAM_53
L1C8A:
        jsr     L1E6B
        lda     transport_control_reg_b
        bpl     L1C9D
        inc     RAM_58
        lda     transport_periph$ddr_reg_b
        lda     RAM_58
        cmp     #0x64
        bcs     L1CA8
L1C9D:
        lda     RAM_54
        bne     L1C8A
        jmp     L1C76
;
        ; this code is skipped
        cmp     #0x60
        bcc     L1CA8
L1CA8:
        lda     #0x20
        jsr     L1D69
        lda     #0x19
        sta     RAM_54
        lda     #0x64
        sta     RAM_53
L1CB5:
        jsr     L1E6B
        lda     RAM_54
        bne     L1CB5
        lda     #0x00
        sta     RAM_59
        jsr     L1D78
        inc     RAM_59
        lda     #0x10
        jsr     L1D55
        lda     #0x80
        jsr     L1D55
        jsr     L1DA6
        lda     #0x10
        jsr     L1D55
        jsr     L1D32
L1CDA:
        jsr     L1E6B
        jsr     L1F0C
        lda     RAM_5A
        bne     L1CF4
        lda     #0x02
        sta     U19_PORTA
        lda     #0x00
        sta     U18_PORTB
        lda     RAM_56
        bne     L1CDA
        inc     RAM_5A
L1CF4:
        jsr     L1D32
        lda     #0x00
        sta     U19_PORTA
        lda     #0x80
        sta     U18_PORTB
        lda     #0x80
        jsr     L1D55
        jsr     L1DA6
        dec     RAM_5A
        jsr     L1DCC
        jsr     L1D32
        lda     #0x30
        sta     RAM_56
        lda     #0x64
        sta     RAM_55
        inc     RAM_59
        lda     RAM_59
        cmp     #0x1A
        bcc     L1D24
        jmp     L1C71
;
L1D24:
        jsr     L1DA6
        lda     #0x10
        jsr     L1D55
        jsr     L1EC3
        jmp     L1CDA
;
L1D32:
        ldx     #0x00
L1D34:
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
        bcc     L1D34
        rts
;
L1D55:
        sta     transport_periph$ddr_reg_b
        lda     #0xFF
        sta     RAM_50
L1D5C:
        jsr     L1E6B
        lda     RAM_50
        bne     L1D5C
        lda     #0x00
        sta     transport_periph$ddr_reg_b
        rts
;
L1D69:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     RAM_50
L1D70:
        jsr     L1E6B
        lda     RAM_50
        bne     L1D70
        rts
;
L1D78:
        lda     #0x00
        sta     RAM_58
L1D7C:
        jsr     L1E6B
        lda     transport_control_reg_b
        bpl     L1D7C
        lda     #0xFA
        sta     RAM_50
L1D88:
        jsr     L1E6B
        lda     transport_control_reg_b
        bpl     L1D9B
        inc     RAM_58
        lda     transport_periph$ddr_reg_b
        lda     RAM_58
        cmp     #0x60
        bcs     L1DA5
L1D9B:
        lda     RAM_50
        bne     L1D88
        lda     RAM_58
        cmp     #0x20
        bcc     L1D78
L1DA5:
        rts
;
L1DA6:
        lda     #0xFA
        sta     RAM_50
L1DAA:
        jsr     L1E6B
        lda     RAM_50
        bne     L1DAA
L1DB1:
        jsr     L1E6B
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1DB1
        lda     #0xA0
        sta     RAM_50
L1DBE:
        jsr     L1E6B
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1DB1
        lda     RAM_50
        bne     L1DBE
        rts
;
L1DCC:
        lda     transport_periph$ddr_reg_a
        lda     #0x40
        sta     board_1_periph$ddr_reg_b
        sta     board_2_periph$ddr_reg_b
        sta     board_3_periph$ddr_reg_b
        sta     board_4_periph$ddr_reg_b
L1DD9:
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcc     L1DF0
        jsr     L1F0C
        jsr     L1E6B
        lda     transport_control_reg_a
        bpl     L1DD9
        jsr     L1E02
        jmp     L1DD9
;
L1DF0:
        lda     #0x64
        sta     RAM_50
L1DF4:
        jsr     L1E6B
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcs     L1DCC
        lda     RAM_50
        bne     L1DF4
        rts
;
L1E02:
        lda     transport_periph$ddr_reg_a
        and     #0x7F
        sta     RAM_5C
        and     #0x7E
        cmp     #0x22
        beq     L1E49
        cmp     #0x32
        bcc     L1E62
        cmp     #0x3A
        bcc     L1E49
        lda     RAM_5C
        cmp     #0x41
        bcc     L1E62
        cmp     #0x51
        bcs     L1E62
        ldx     RAM_64
        sec
        sbc     #0x41
        cmp     #0x08
        bcc     L1E2C
        inx
        inx
L1E2C:
        and     #0x07
        tay
        lda     X1E63,y
        sta     RAM_5D
        lda     RAM_5E
        lsr     a
        bcs     L1E42
        lda     RAM_5D
        eor     #0xFF
        and     RAM_start,x
        sta     RAM_start,x
        rts
;
L1E42:
        lda     RAM_5D
        ora     RAM_start,x
        sta     RAM_start,x
        rts
;
L1E49:
        lda     RAM_5C
        sta     RAM_5E
        and     #0x7E
        cmp     #0x22
        bne     L1E58
        lda     #0x98
        sta     RAM_64
        rts
;
L1E58:
        sec
        sbc     #0x32
        asl     a
        clc
        adc     #0x80
        sta     RAM_64
        rts
L1E62:
        rts
;
X1E63:
        .db     0x01, 0x02, 0x04, 0x08
        .db     0x10, 0x20, 0x40, 0x80
;
L1E6B:
        lda     U18_edge_detect_control_DI_pos
        sta     RAM_5F
        beq     L1EC2
        lda     RAM_5B
        bmi     L1E84
        lda     RAM_5F
        and     #0x40
        beq     L1E92
        lda     #0x80
        sta     RAM_5B
        lda     #0xFA
        sta     RAM_51
L1E84:
        lda     RAM_51
        bne     L1E8E
        lda     #0x00
        sta     RAM_5B
        inc     RAM_5A
L1E8E:
        lda     RAM_5F
        bpl     L1EC2
L1E92:
        lda     U18_edge_detect_control_DI_neg
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        sta     RAM_57
        bcc     L1EA0
        inc     RAM_57
L1EA0:
        lda     #0x7A
        sec
        sbc     RAM_57
        sta     U18_timer_8T_DI
        dec     RAM_50
        dec     RAM_51
        dec     RAM_52
        dec     RAM_53
        bne     L1EC2
        lda     #0x64
        sta     RAM_53
        dec     RAM_54
        dec     RAM_55
        bne     L1EC2
        lda     #0x64
        sta     RAM_55
        dec     RAM_56
L1EC2:
        rts
;
L1EC3:
        lda     #0x00
        sta     RAM_61
        sta     RAM_62
        lda     #0x0A
        sta     RAM_54
        lda     #0x64
        sta     RAM_53
L1ED1:
        jsr     L1E6B
        lda     RAM_54
        bne     L1ED1
        lda     #0x0A
        sta     RAM_54
        lda     #0x64
        sta     RAM_53
        lda     RAM_62
        cmp     #0x08
        beq     L1EFB
        inc     RAM_62
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a
L1EEE:
        rol     a
        dex
        bcc     L1EEE
        clc
        txa
        adc     RAM_61
        sta     RAM_61
        jmp     L1ED1
;
L1EFB:
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
L1F0C:
        lda     U19_PORTA
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     RAM_60
        tax
        lda     X1F3F,x
        sta     RAM_63
        lda     RAM_52
        bne     L1F38
        lda     #0x0A
        sta     RAM_52
        lda     RAM_63
        cmp     audio_periph$ddr_reg_b
        bcc     L1F35
        beq     L1F38
        inc     audio_periph$ddr_reg_b
        jmp     L1F38
;
L1F35:
        dec     audio_periph$ddr_reg_b
L1F38:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts
;
X1F3F:
        .db     0x03, 0x04, 0x06, 0x08
        .db     0x10, 0x16, 0x20, 0x2D
        .db     0x40, 0x5A, 0x80, 0xBF
        .db     0xFF, 0xFF, 0xFF, 0xFF
        .db     0xFF
;
; all zeros in this gap
;
        .org    0x1FFA
;
; vectors
;
NMIVEC:
        .dw     RAM_start
RESETVEC:
        .dw     RESET
IRQVEC:
        .dw     RAM_start
