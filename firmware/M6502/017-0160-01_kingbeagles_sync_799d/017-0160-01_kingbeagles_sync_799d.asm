
        .area   region1 (ABS)

        .include "../include/ptt6502.def"
        
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
        lda     #0x03
        sta     UART_02
        nop
        lda     #0x09
        sta     UART_02
        lda     #0x10
        jsr     L1234
        lda     #0x28
        sta     0x54
        lda     #0x64
        sta     0x53


L10C9:
        lda     0x54
        bne     L10C9
        jsr     L1201


L10D0:
        lda     #0xFA
        sta     0x64
        lda     #0x00
        sta     0x65
        sta     0x66
        lda     #0x30
        lda     #0x40
        jsr     L1234


L10E1:
        lda     #0x00
        sta     0x58


L10E5:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x58
        lda     0x58
        cmp     #0x64
        bcs     L1103


L10F4:
        jsr     L13F3
        lda     0x50
        beq     L10E1
        lda     transport_control_reg_b
        bpl     L10F4
        jmp     L10E5


L1103:
        lda     #0x20
        jsr     L1234
        lda     #0x19
        sta     0x54
        lda     #0x64
        sta     0x53


L1110:
        jsr     L13F3
        lda     0x54
        bne     L1110
        lda     #0x00
        sta     0x59
        jsr     L124F
        lda     #0x40
        jsr     L1234
        jsr     L124F
        lda     #0xFA
        sta     0x50


L112A:
        jsr     L13F3
        lda     0x50
        bne     L112A
        lda     #0x20
        jsr     L1234
        jsr     L124F
        inc     0x59
        lda     #0x10
        jsr     L1234
        lda     #0x80
        jsr     L1234
        jsr     L1272
        lda     #0x10
        jsr     L1234


L114D:
        lda     #0x64
        sta     0x69
        lda     #0x13
        sta     0x6A
        jsr     L13AF
        jsr     L13F3
        jsr     L12D9
        lda     UART_02
        and     #0x05
        beq     L1188
        lda     0x67
        bne     L1175
        lda     UART_01
        cmp     #0x53
        bne     L1188
        inc     0x67
        jmp     L1188


L1175:
        lda     #0x00
        sta     0x67
        lda     UART_01
        cmp     #0x31
        beq     L11B6
        cmp     #0x32
        beq     L118E
        cmp     #0x33
        beq     L11A3


L1188:
        jmp     L114D
        jmp     L10D0


L118E:
        lda     #0xFF
        sta     0x98
        sta     0x9A
        sta     0x9C
        sta     0x9E
        sta     U18_PORTB
        lda     #0x02
        sta     U19_PORTA
        jmp     L114D


L11A3:
        lda     #0x00
        sta     0x98
        sta     0x9A
        sta     0x9C
        sta     0x9E
        sta     U18_PORTB
        sta     U19_PORTA
        jmp     L114D


L11B6:
        jsr     L1201
        lda     #0x62
        sta     0x69
        lda     #0x13
        sta     0x6A
        lda     #0x00
        sta     U19_PORTA
        lda     #0xA0
        sta     U18_PORTB
        lda     #0x80
        jsr     L1234
        jsr     L1272
        jsr     L1298
        jsr     L1201
        lda     #0x80
        sta     U18_PORTB
        inc     0x59
        lda     0x59
        cmp     #0x1A
        bcc     L11E9
        jmp     L10D0


L11E9:
        lda     #0x00
        sta     0x65
        sta     0x66
        lda     #0xFA
        sta     0x64
        jsr     L1272
        lda     #0x10
        jsr     L1234
        jsr     L1366
        jmp     L114D


L1201:
        lda     #0x3C
        sta     audio_control_reg_b
        lda     #0x34
        sta     audio_control_reg_a
        ldx     #0x00


L120D:
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
        bcc     L120D
        lda     #0x00
        sta     0x5D
        sta     0x63
        rts


L1234:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     0x50


L123B:
        jsr     L13F3
        lda     0x50
        bne     L123B
        lda     transport_periph$ddr_reg_b
        and     #0x60
        bne     L124E
        lda     #0x00
        sta     transport_periph$ddr_reg_b


L124E:
        rts


L124F:
        lda     #0x00
        sta     0x58


L1253:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x58
        lda     0x58
        cmp     #0x21
        bcs     L1271


L1262:
        jsr     L13F3
        lda     0x50
        beq     L124F
        lda     transport_control_reg_b
        bpl     L1262
        jmp     L1253


L1271:
        rts


L1272:
        lda     #0xFA
        sta     0x50


L1276:
        jsr     L13F3
        lda     0x50
        bne     L1276


L127D:
        jsr     L13F3
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L127D
        lda     #0xA0
        sta     0x50


L128A:
        jsr     L13F3
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L127D
        lda     0x50
        bne     L128A
        rts


L1298:
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


L12B3:
        lda     transport_periph$ddr_reg_b
        lsr
        bcc     L12CA
        jsr     L12D9
        jsr     L13AF
        lda     transport_control_reg_a
        bpl     L12B3
        jsr     L12F9
        jmp     L12B3


L12CA:
        lda     #0x64
        sta     0x50


L12CE:
        lda     transport_periph$ddr_reg_b
        lsr
        bcs     L1298
        lda     0x50
        bne     L12CE
        rts


L12D9:
        lda     UART_02
        and     #0x02
        beq     L12F8
        lda     0x68
        bne     L12ED
        ldy     #0x00
        lda     [0x69],y
        inc     0x68
        jmp     L12F5


L12ED:
        lda     #0x00
        sta     0x68
        ldy     #0x01
        lda     [0x69],y


L12F5:
        sta     UART_01


L12F8:
        rts


L12F9:
        lda     transport_periph$ddr_reg_a


L12FC:
        and     #0x7F
        sta     0x5B
        and     #0x7E
        cmp     #0x22
        beq     L1340
        cmp     #0x32
        bcc     L1359
        cmp     #0x3A
        bcc     L1340
        lda     0x5B
        cmp     #0x41
        bcc     L1359
        cmp     #0x4F
        bcs     L1359
        ldx     0x63
        sec
        sbc     #0x41
        cmp     #0x08
        bcc     L1323
        inx
        inx


L1323:
        and     #0x07
        tay
        lda     X135A,y
        sta     0x5C
        lda     0x5D
        lsr
        bcs     L1339
        lda     0x5C
        eor     #0xFF
        and     0x00,x
        sta     0x00,x
        rts


L1339:
        lda     0x5C
        ora     0x00,x
        sta     0x00,x
        rts


L1340:
        lda     0x5B
        sta     0x5D
        and     #0x7E
        cmp     #0x22
        bne     L134F
        lda     #0x98
        sta     0x63
        rts


L134F:
        sec
        sbc     #0x32
        asl
        clc
        adc     #0x80
        sta     0x63
        rts


L1359:
        rts


X135A:
        .byte   0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x4D,0x31,0x4D,0x32

L1366:
        lda     #0x00
        sta     0x60
        sta     0x61
        lda     #0x0A
        sta     0x54
        lda     #0x64
        sta     0x53


L1374:
        jsr     L13F3
        lda     0x54
        bne     L1374
        lda     #0x0A
        sta     0x54
        lda     #0x64
        sta     0x53
        lda     0x61
        cmp     #0x08
        beq     L139E
        inc     0x61
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a


L1391:
        rol
        dex
        bcc     L1391
        clc
        txa
        adc     0x60
        sta     0x60
        jmp     L1374


L139E:
        lsr     0x60
        lsr     0x60
        lsr     0x60
        lda     0x60
        sta     0x5F
        lda     #0x00
        sta     0x60
        sta     0x61
        rts


L13AF:
        lda     U19_PORTA
        eor     #0xFF
        lsr
        lsr
        lsr
        lsr
        clc
        adc     0x5F
        tax
        lda     X13E2,x
        sta     0x62
        lda     0x52
        bne     L13DB
        lda     #0x0A
        sta     0x52
        lda     0x62
        cmp     audio_periph$ddr_reg_b
        bcc     L13D8
        beq     L13DB
        inc     audio_periph$ddr_reg_b
        jmp     L13DB


L13D8:
        dec     audio_periph$ddr_reg_b


L13DB:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts


X13E2:
        .byte   0x03,0x04,0x06,0x08,0x10,0x16,0x20,0x2D,0x40,0x5A,0x80,0xBF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF

L13F3:
        lda     0x65
        tax
        lda     0x66
        bne     L1431
        lda     X145F,x
        cmp     #0xFE
        beq     L1428
        cmp     #0xFF
        bne     L1410
        lda     #0x00
        sta     0x65
        lda     #0xFA
        sta     0x64
        jmp     L1427


L1410:
        cmp     0x64
        bne     L1427
        lda     X1460,x
        jsr     L12FC
        lda     X1461,x
        jsr     L12FC
        lda     0x65
        clc
        adc     #0x03
        sta     0x65


L1427:
        rts


L1428:
        inc     0x66
        lda     #0x00
        sta     0x65
        jmp     L1427


L1431:
        lda     X1549,x
        cmp     #0xFF
        bne     L1445
        lda     #0x00
        sta     0x65
        sta     0x66
        lda     #0xFA
        sta     0x64
        jmp     L1427


L1445:
        cmp     0x64
        bne     L1427
        lda     X154A,x
        jsr     L12FC
        lda     X154B,x
        jsr     L12FC
        lda     0x65
        clc
        adc     #0x03
        sta     0x65
        jmp     L1427


X145F:
        .byte   0xF5

X1460:
        .byte   0x35

X1461:
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

X1549:
        .byte   0x50

X154A:
        .byte   0x33

X154B:
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
