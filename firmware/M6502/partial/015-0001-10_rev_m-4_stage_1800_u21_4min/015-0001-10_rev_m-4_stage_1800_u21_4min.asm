
        .area   region1 (ABS)

        .include "../../include/ptt6502.def"

        .org    0x1800

L1800:
        cld
        sei
        ldx     #0xF0
        txs
        lda     #0x00
        ldx     #0x10


L1809:
        sta     0x00,x
        inx
        cpx     #0x80
        bne     L1809
        lda     #0x00
        sta     transport_control_reg_a
        sta     U18_PORTB
        sta     audio_control_reg_a
        sta     audio_control_reg_b
        sta     U18_edge_detect_control_DI_pos
        sta     transport_control_reg_b
        sta     U18_DDRA
        lda     #0x02
        sta     U19_DDRA
        sta     U19_PORTA
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
        sta     audio_control_reg_b
        sta     audio_control_reg_a
        lda     #0x10
        sta     audio_periph$ddr_reg_b
        sta     U19_PORTB
        lda     #0x00
        sta     0x63
        lda     #0x64
        sta     0x53


L185F:
        lda     #0x02
        sta     U19_PORTA
        lda     #0x10
        jsr     L1B0B
        lda     #0x28
        sta     0x54


L186D:
        jsr     L1B28
        lda     0x54
        bne     L186D
        jsr     0x1C52
        jsr     0x1DED
        lda     U18_PORTA
        eor     #0xFF
        cmp     #0x10
        bne     L1893
        lda     #0xFF
        sta     0x98
        sta     0x9A
        sta     0x9C
        sta     0x9E
        sta     U18_PORTB


L1890:
        jmp     L1890


L1893:
        lda     #0x40
        jsr     L1B0B
        lda     0x5A
        sta     U19_PORTB


L189D:
        lda     #0x00
        sta     0x5E


L18A1:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x5E
        lda     0x5E
        cmp     #0x64
        bcs     L18BF


L18B0:
        jsr     L1B28
        lda     0x50
        beq     L189D
        lda     transport_control_reg_b
        bpl     L18B0
        jmp     L18A1


L18BF:
        lda     #0x20
        jsr     L1B0B
        lda     #0x19
        sta     0x54


L18C8:
        jsr     L1B28
        lda     0x54
        bne     L18C8
        lda     #0x00
        sta     0x5A
        lda     #0x02
        sta     0x5B
        sta     0x5C
        jsr     L1A49
        lda     #0x00
        sta     U19_PORTA
        lda     #0x00
        sta     0x68


L18E5:
        lda     #0x18
        sta     0x58


L18E9:
        lda     #0x0A
        sta     0x54


L18ED:
        jsr     L1B28
        lda     0x68
        bmi     L18F7
        jsr     L1BEC


L18F7:
        lda     0x74
        bmi     L1942
        bne     L190E
        lda     #0x64
        sta     0x55
        lda     #0x80
        sta     transport_periph$ddr_reg_b
        lda     #0x03
        sta     0x74
        lda     #0xA0
        sta     0x51


L190E:
        lda     0x74
        ror
        bcc     L191E
        lda     0x55
        bne     L191E
        lda     #0x02
        sta     0x74
        jmp     L1935


L191E:
        lda     transport_periph$ddr_reg_b
        ror
        bcs     L1928
        lda     #0xA0
        sta     0x51


L1928:
        lda     0x51
        bne     L193D
        lda     #0x10
        sta     transport_periph$ddr_reg_b
        lda     #0x80
        sta     0x74


L1935:
        lda     #0x80
        and     U18_PORTB
        sta     U18_PORTB


L193D:
        lda     0x74
        ror
        bcs     L18ED


L1942:
        jsr     L1B62
        jsr     L1BB9
        lda     0x5F
        bne     L18ED
        lda     U18_PORTB
        bpl     L18E5
        rol
        rol
        bcc     L1958
        jmp     L1984


L1958:
        rol
        bcc     L195E
        jmp     L1972


L195E:
        rol
        bcc     L1964
        jmp     L1A39


L1964:
        and     #0xF0
        beq     L196B
        jmp     L19B3


L196B:
        lda     0x58
        bmi     L1972
        jmp     L18ED


L1972:
        lda     #0xA0
        sta     U18_PORTB
        lda     0x5C
        sta     0x5B
        jsr     L1A49
        jsr     L1AAE
        jsr     0x1C86


L1984:
        lda     0x5C
        cmp     0x5B
        bne     L19AB
        inc     0x5C
        lda     0x5C
        cmp     #0x06
        beq     L19A6
        cmp     #0x10
        beq     L19A6
        cmp     #0x1A
        bne     L19AB
        lda     #0x02
        sta     0x5C
        lda     #0x02
        sta     U19_PORTA
        jmp     L185F


L19A6:
        clc
        adc     #0x06
        sta     0x5C


L19AB:
        inc     0x5B
        jsr     L1A59
        jmp     L18E5


L19B3:
        lda     0x58
        sta     0x75
        lda     U18_PORTB
        sta     0x61
        and     #0x0F
        sta     0x62
        ror
        bcc     L19C7
        lda     #0x09
        bne     L19E6


L19C7:
        ror
        bcc     L19DD
        clc
        lda     #0x06
        adc     0x5D
        inc     0x5D
        ldx     0x5D
        cpx     #0x03
        bcc     L19E6
        ldx     #0x00
        stx     0x5D
        beq     L19E6


L19DD:
        ror
        bcc     L19E4
        lda     #0x0B
        bne     L19E6


L19E4:
        lda     #0x0A


L19E6:
        ldx     0x5C
        cpx     #0x0E
        bcc     L19EF
        clc
        adc     #0x0A


L19EF:
        sta     0x5B
        jsr     L1A49
        jsr     L1AAE
        jsr     0x1DED


L19FA:
        lda     #0xFA
        sta     0x51


L19FE:
        jsr     L1B62
        lda     0x5F
        bne     L1A16
        jsr     L1B28
        lda     0x51
        bne     L19FE
        lda     U18_PORTB
        eor     0x62
        sta     U18_PORTB
        bne     L19FA


L1A16:
        jsr     L1B28
        jsr     L1B62
        lda     0x5F
        bne     L1A16
        lda     U18_PORTB
        cmp     0x61
        beq     L1A2A
        jmp     L18E9


L1A2A:
        jsr     0x1C86


L1A2D:
        inc     0x5B
        jsr     L1A59
        lda     0x75
        sta     0x58
        jmp     L18E5


L1A39:
        lda     #0x01
        sta     0x5B
        jsr     L1A49
        jsr     L1AAE
        jsr     0x1C86
        jmp     L1A2D


L1A49:
        lda     0x5B
        cmp     0x5A
        bcc     L1A55
        beq     L1A54
        jsr     L1A59


L1A54:
        rts


L1A55:
        jsr     L1A72
        rts


L1A59:
        lda     #0x20
        jsr     L1B0B
        jsr     L1AE3
        inc     0x5A
        lda     0x5A
        sta     U19_PORTB
        lda     0x5B
        cmp     0x5A
        bne     L1A59
        jsr     L1A8D
        rts


L1A72:
        inc     0x5A


L1A74:
        lda     #0x40
        jsr     L1B0B
        jsr     L1AE3
        dec     0x5A
        lda     0x5A
        sta     U19_PORTB
        lda     0x5B
        cmp     0x5A
        bne     L1A74
        jsr     L1AA0
        rts


L1A8D:
        lda     #0x40
        jsr     L1B0B
        jsr     L1AE3
        lda     #0x03
        sta     0x54


L1A99:
        jsr     L1B28
        lda     0x54
        bne     L1A99


L1AA0:
        lda     #0x20
        jsr     L1B0B
        jsr     L1AE3
        lda     #0x10
        jsr     L1B0B
        rts


L1AAE:
        lda     0x74
        bmi     L1AE2
        lda     #0x80
        jsr     L1B0B
        lda     #0xFA
        sta     0x50


L1ABB:
        jsr     L1B28
        lda     0x50
        bne     L1ABB


L1AC2:
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1AC2
        lda     #0xA0
        sta     0x50


L1ACC:
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1ABB
        jsr     L1B28
        lda     0x50
        bne     L1ACC
        lda     #0x10
        jsr     L1B0B
        lda     #0x80
        sta     0x74


L1AE2:
        rts


L1AE3:
        lda     0x5A
        sta     U19_PORTB


L1AE8:
        lda     #0x00
        sta     0x5E


L1AEC:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x5E
        lda     0x5E
        cmp     #0x21
        bcs     L1B0A


L1AFB:
        jsr     L1B28
        lda     0x50
        beq     L1AE8
        lda     transport_control_reg_b
        bpl     L1AFB
        jmp     L1AEC


L1B0A:
        rts


L1B0B:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     0x50


L1B12:
        jsr     L1B28
        lda     0x50
        bne     L1B12
        lda     transport_periph$ddr_reg_b
        and     #0x60
        bne     L1B27
        lda     #0x00
        sta     transport_periph$ddr_reg_b
        sta     0x74


L1B27:
        rts


L1B28:
        lda     U18_edge_detect_control_DI_pos
        bpl     L1B61
        lda     U18_timer
        eor     #0xFF
        lsr
        lsr
        lsr
        sta     0x59
        bcc     L1B3B
        inc     0x59


L1B3B:
        lda     #0x7A
        sec
        sbc     0x59
        sta     U18_timer_8T_DI
        dec     0x50
        dec     0x51
        dec     0x52
        dec     0x53
        bne     L1B61
        lda     #0x64
        sta     0x53
        dec     0x54
        dec     0x55
        dec     0x56
        dec     0x57
        bne     L1B61
        lda     #0x64
        sta     0x57
        dec     0x58


L1B61:
        rts


L1B62:
        lda     0x5F
        bne     L1B8F
        lda     U18_PORTA
        eor     #0xFF
        beq     L1B8E
        sta     0x60
        bpl     L1B7A
        eor     U18_PORTB
        sta     U18_PORTB
        jmp     L1B86


L1B7A:
        lda     U18_PORTB
        and     #0x80
        beq     L1B8E
        ora     0x60
        sta     U18_PORTB


L1B86:
        lda     #0x80
        sta     0x5F
        lda     #0x14
        sta     0x50


L1B8E:
        rts


L1B8F:
        lda     0x5F
        rol
        bcc     L1B9D
        lda     0x50
        bne     L1BB8
        lda     #0x40
        sta     0x5F
        rts


L1B9D:
        rol
        bcc     L1BB0
        lda     U18_PORTA
        eor     #0xFF
        bne     L1BB8
        lda     #0x20
        sta     0x5F
        lda     #0x14
        sta     0x50
        rts


L1BB0:
        lda     0x50
        bne     L1BB8
        lda     #0x00
        sta     0x5F


L1BB8:
        rts


L1BB9:
        lda     U19_PORTA
        eor     #0xFF
        lsr
        lsr
        lsr
        lsr
        clc
        adc     0x63
        tax
        lda     0x1C41,x
        sta     0x67
        lda     0x52
        bne     L1BE5
        lda     #0x0A
        sta     0x52
        lda     0x67
        cmp     audio_periph$ddr_reg_b
        bcc     L1BE2
        beq     L1BE5
        inc     audio_periph$ddr_reg_b
        jmp     L1BE5


L1BE2:
        dec     audio_periph$ddr_reg_b


L1BE5:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts


L1BEC:
        lda     0x68
        bne     L1C05
        lda     #0x7F
        sta     0x68
        jsr     0x1DF8
        lda     #0x0A
        sta     0x56
        lda     0x63
        sta     0x64

;        lda     #0xhh                  ; incomplete instruction
        .byte   0xA9                    ; put first byte here

; Symbols out of range
L1C05   =       0x1C05
L1DF8   =       0x1DF8
