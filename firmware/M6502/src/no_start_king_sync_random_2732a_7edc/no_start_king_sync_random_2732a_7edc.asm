
        .area   region1 (ABS)

        .include "../../include/ptt6502.def"

        .org    0x1000

L1000:
        pha
        lda     U18_edge_detect_control_DI_pos
        lda     U19_edge_detect_control_DI_pos
        lda     #0x7D
        sta     U18_1D
        lda     0x50
        beq     L1012
        dec     0x50


L1012:
        lda     0x51
        beq     L1018
        dec     0x51


L1018:
        lda     0x52
        beq     L101E
        dec     0x52


L101E:
        dec     0x53
        bne     L1046
        lda     #0x64
        sta     0x53
        lda     0x54
        beq     L102C
        dec     0x54


L102C:
        lda     0x64
        beq     L1032
        dec     0x64


L1032:
        lda     0x55
        beq     L1038
        dec     0x55


L1038:
        dec     0x56
        bne     L1046
        lda     #0x64
        sta     0x56
        lda     0x57
        beq     L1046
        dec     0x57


L1046:
        pla
        rti

L1048:
        cld
        sei
        ldx     #0xF0
        txs
        lda     #0x00
        ldx     #0x10


L1051:
        sta     0x00,x
        inx
        cpx     #0x80
        bne     L1051
        lda     #0x00
        sta     transport_control_reg_a
        sta     transport_periph$ddr_reg_a
        sta     audio_control_reg_a
        sta     audio_periph$ddr_reg_a
        sta     audio_control_reg_b
        sta     U18_edge_detect_control_DI_pos
        sta     transport_control_reg_b
        sta     U18_06
        sta     U19_06
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
        cli
        sta     U18_1C
        lda     #0x64
        sta     0x53
        lda     #0x18
        sta     0x57
        lda     #0x64
        sta     0x56
        lda     #0x0A
        sta     0x62
        lda     #0x09
        sta     UART_02
        lda     #0x10
        jsr     L122E
        lda     #0x28
        sta     0x54
        lda     #0x64
        sta     0x53


L10C3:
        lda     0x54
        bne     L10C3
        jsr     L11FB


L10CA:
        lda     #0xFA
        sta     0x64
        lda     #0x00
        sta     0x65
        sta     0x66
        lda     #0x30
        lda     #0x40
        jsr     L122E


L10DB:
        lda     #0x00
        sta     0x58


L10DF:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x58
        lda     0x58
        cmp     #0x64
        bcs     L10FD


L10EE:
        jsr     L13ED
        lda     0x50
        beq     L10DB
        lda     transport_control_reg_b
        bpl     L10EE
        jmp     L10DF


L10FD:
        lda     #0x20
        jsr     L122E
        lda     #0x19
        sta     0x54
        lda     #0x64
        sta     0x53


L110A:
        jsr     L13ED
        lda     0x54
        bne     L110A
        lda     #0x00
        sta     0x59
        jsr     L1249
        lda     #0x40
        jsr     L122E
        jsr     L1249
        lda     #0xFA
        sta     0x50


L1124:
        jsr     L13ED
        lda     0x50
        bne     L1124
        lda     #0x20
        jsr     L122E
        jsr     L1249
        inc     0x59
        lda     #0x10
        jsr     L122E
        lda     #0x80
        jsr     L122E
        jsr     L126C
        lda     #0x10
        jsr     L122E


L1147:
        lda     #0x5E
        sta     0x69
        lda     #0x13
        sta     0x6A
        jsr     L13A9
        jsr     L13ED
        jsr     L12D3
        lda     UART_02
        and     #0x05
        beq     L1182
        lda     0x67
        bne     L116F
        lda     UART_01
        cmp     #0x53
        bne     L1182
        inc     0x67
        jmp     L1182


L116F:
        lda     #0x00
        sta     0x67
        lda     UART_01
        cmp     #0x31
        beq     L11B0
        cmp     #0x32
        beq     L1188
        cmp     #0x33
        beq     L119D


L1182:
        jmp     L1147
        jmp     L10CA


L1188:
        lda     #0xFF
        sta     0x98
        sta     0x9A
        sta     0x9C
        sta     0x9E
        sta     U18_PORTB
        lda     #0x02
        sta     U19_PORTA
        jmp     L1147


L119D:
        lda     #0x00
        sta     0x98
        sta     0x9A
        sta     0x9C
        sta     0x9E
        sta     U18_PORTB
        sta     U19_PORTA
        jmp     L1147


L11B0:
        jsr     L11FB
        lda     #0x5C
        sta     0x69
        lda     #0x13
        sta     0x6A
        lda     #0x00
        sta     U19_PORTA
        lda     #0xA0
        sta     U18_PORTB
        lda     #0x80
        jsr     L122E
        jsr     L126C
        jsr     L1292
        jsr     L11FB
        lda     #0x80
        sta     U18_PORTB
        inc     0x59
        lda     0x59
        cmp     #0x1A
        bcc     L11E3
        jmp     L10CA


L11E3:
        lda     #0x00
        sta     0x65
        sta     0x66
        lda     #0xFA
        sta     0x64
        jsr     L126C
        lda     #0x10
        jsr     L122E
        jsr     L1360
        jmp     L1147


L11FB:
        lda     #0x3C
        sta     audio_control_reg_b
        lda     #0x34
        sta     audio_control_reg_a
        ldx     #0x00


L1207:
        lda     #0x30
        sta     0x81,x
        sta     0x83,x
        lda     #0xFF
        sta     0x80,x
        sta     0x82,x
        lda     #0x34
        sta     0x81,x
        sta     0x83,x
        lda     #0x00
        sta     0x80,x
        sta     0x82,x
        inx
        inx
        inx
        inx
        cpx     #0x20
        bcc     L1207
        lda     #0x00
        sta     0x5D
        sta     0x63
        rts


L122E:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     0x50


L1235:
        jsr     L13ED
        lda     0x50
        bne     L1235
        lda     transport_periph$ddr_reg_b
        and     #0x60
        bne     L1248
        lda     #0x00
        sta     transport_periph$ddr_reg_b


L1248:
        rts


L1249:
        lda     #0x00
        sta     0x58


L124D:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x58
        lda     0x58
        cmp     #0x21
        bcs     L126B


L125C:
        jsr     L13ED
        lda     0x50
        beq     L1249
        lda     transport_control_reg_b
        bpl     L125C
        jmp     L124D


L126B:
        rts


L126C:
        lda     #0xFA
        sta     0x50


L1270:
        jsr     L13ED
        lda     0x50
        bne     L1270


L1277:
        jsr     L13ED
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1277
        lda     #0xA0
        sta     0x50


L1284:
        jsr     L13ED
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1277
        lda     0x50
        bne     L1284
        rts


L1292:
        lda     transport_periph$ddr_reg_a
        lda     #0x40
        sta     0x82
        sta     0x86
        sta     0x8A
        sta     0x8E
        lda     #0x3C
        sta     audio_control_reg_a
        lda     #0x34
        sta     audio_control_reg_b
        lda     #0x60
        sta     0x82


L12AD:
        lda     transport_periph$ddr_reg_b
        lsr
        bcc     L12C4
        jsr     L12D3
        jsr     L13A9
        lda     transport_control_reg_a
        bpl     L12AD
        jsr     L12F3
        jmp     L12AD


L12C4:
        lda     #0x64
        sta     0x50


L12C8:
        lda     transport_periph$ddr_reg_b
        lsr
        bcs     L1292
        lda     0x50
        bne     L12C8
        rts


L12D3:
        lda     UART_02
        and     #0x02
        beq     L12F2
        lda     0x68
        bne     L12E7
        ldy     #0x00
        lda     [0x69],y
        inc     0x68
        jmp     L12EF


L12E7:
        lda     #0x00
        sta     0x68
        ldy     #0x01
        lda     [0x69],y


L12EF:
        sta     UART_01


L12F2:
        rts


L12F3:
        lda     transport_periph$ddr_reg_a


L12F6:
        and     #0x7F
        sta     0x5B
        and     #0x7E
        cmp     #0x22
        beq     L133A
        cmp     #0x32
        bcc     L1353
        cmp     #0x3A
        bcc     L133A
        lda     0x5B
        cmp     #0x41
        bcc     L1353
        cmp     #0x4F
        bcs     L1353
        ldx     0x63
        sec
        sbc     #0x41
        cmp     #0x08
        bcc     L131D
        inx
        inx


L131D:
        and     #0x07
        tay
        lda     X1354,y
        sta     0x5C
        lda     0x5D
        lsr
        bcs     L1333
        lda     0x5C
        eor     #0xFF
        and     0x00,x
        sta     0x00,x
        rts


L1333:
        lda     0x5C
        ora     0x00,x
        sta     0x00,x
        rts


L133A:
        lda     0x5B
        sta     0x5D
        and     #0x7E
        cmp     #0x22
        bne     L1349
        lda     #0x98
        sta     0x63
        rts


L1349:
        sec
        sbc     #0x32
        asl
        clc
        adc     #0x80
        sta     0x63
        rts


L1353:
        rts


X1354:
        .byte   0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x4D,0x31,0x4D,0x32

L1360:
        lda     #0x00
        sta     0x60
        sta     0x61
        lda     #0x0A
        sta     0x54
        lda     #0x64
        sta     0x53


L136E:
        jsr     L13ED
        lda     0x54
        bne     L136E
        lda     #0x0A
        sta     0x54
        lda     #0x64
        sta     0x53
        lda     0x61
        cmp     #0x08
        beq     L1398
        inc     0x61
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a


L138B:
        rol
        dex
        bcc     L138B
        clc
        txa
        adc     0x60
        sta     0x60
        jmp     L136E


L1398:
        lsr     0x60
        lsr     0x60
        lsr     0x60
        lda     0x60
        sta     0x5F
        lda     #0x00
        sta     0x60
        sta     0x61
        rts


L13A9:
        lda     U19_PORTA
        eor     #0xFF
        lsr
        lsr
        lsr
        lsr
        clc
        adc     0x5F
        tax
        lda     X13DC,x
        sta     0x62
        lda     0x52
        bne     L13D5
        lda     #0x0A
        sta     0x52
        lda     0x62
        cmp     audio_periph$ddr_reg_b
        bcc     L13D2
        beq     L13D5
        inc     audio_periph$ddr_reg_b
        jmp     L13D5


L13D2:
        dec     audio_periph$ddr_reg_b


L13D5:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts


X13DC:
        .byte   0x03,0x04,0x06,0x08,0x10,0x16,0x20,0x2D,0x40,0x5A,0x80,0xBF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF

L13ED:
        lda     0x65
        tax
        lda     0x66
        bne     L142B
        lda     X1459,x
        cmp     #0xFE
        beq     L1422
        cmp     #0xFF
        bne     L140A
        lda     #0x00
        sta     0x65
        lda     #0xFA
        sta     0x64
        jmp     L1421


L140A:
        cmp     0x64
        bne     L1421
        lda     X145A,x
        jsr     L12F6
        lda     X145B,x
        jsr     L12F6
        lda     0x65
        clc
        adc     #0x03
        sta     0x65


L1421:
        rts


L1422:
        inc     0x66
        lda     #0x00
        sta     0x65
        jmp     L1421


L142B:
        lda     X1543,x
        cmp     #0xFF
        bne     L143F
        lda     #0x00
        sta     0x65
        sta     0x66
        lda     #0xFA
        sta     0x64
        jmp     L1421


L143F:
        cmp     0x64
        bne     L1421
        lda     X1544,x
        jsr     L12F6
        lda     X1545,x
        jsr     L12F6
        lda     0x65
        clc
        adc     #0x03
        sta     0x65
        jmp     L1421


X1459:
        .byte   0xF5

X145A:
        .byte   0x35

X145B:
        .byte   0x49,0xF5,0x35,0x4A,0xEE,0x35,0x46,0xEB,0x33,0x46,0xE9,0x32,0x46,0xE9,0x33,0x42
        .byte   0xE8,0x33,0x46,0xE7,0x32,0x46,0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3
        .byte   0x32,0x46,0xE2,0x33,0x46,0xE1,0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33
        .byte   0x46,0xDD,0x32,0x46,0xDD,0x34,0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46
        .byte   0xDA,0x33,0x46,0xD9,0x32,0x46,0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5
        .byte   0x32,0x47,0xC3,0x34,0x46,0xC2,0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34
        .byte   0x46,0xB9,0x32,0x43,0xB7,0x35,0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46
        .byte   0xA8,0x32,0x42,0x9D,0x33,0x47,0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A
        .byte   0x34,0x46,0x99,0x33,0x47,0x99,0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33
        .byte   0x47,0x94,0x32,0x47,0x93,0x33,0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47
        .byte   0x87,0x33,0x42,0x86,0x32,0x43,0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77
        .byte   0x34,0x46,0x75,0x32,0x43,0x75,0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33
        .byte   0x46,0x66,0x32,0x46,0x66,0x32,0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42
        .byte   0x56,0x33,0x46,0x55,0x32,0x46,0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52
        .byte   0x33,0x46,0x51,0x32,0x46,0xFE,0xFE,0xFE

X1543:
        .byte   0x50

X1544:
        .byte   0x33

X1545:
        .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF

        .org    0x1FFA
        ;
        ; vectors
        ;
NMIVEC:
        .dw     0xFFFF
RESETVEC:
        .dw     L1048
IRQVEC:
        .dw     L1000
