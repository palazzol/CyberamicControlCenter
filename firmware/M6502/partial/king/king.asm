
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
        sta     0x66
        lda     #0x64
        sta     0x53
        lda     #0x24
        sta     0x74


L1863:
        lda     #0x02
        sta     U19_PORTA
        lda     #0x10
        jsr     L1B46
        lda     #0x28
        sta     0x54


L1871:
        jsr     L1B63
        lda     0x54
        bne     L1871
        jsr     0x1D61
        jsr     0x1D39
        lda     #0x40
        jsr     L1B46
        lda     0x5D
        sta     U19_PORTB


L1888:
        lda     #0x00
        sta     0x61


L188C:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x61
        lda     0x61
        cmp     #0x64
        bcs     L18AA


L189B:
        jsr     L1B63
        lda     0x50
        beq     L1888
        lda     transport_control_reg_b
        bpl     L189B
        jmp     L188C


L18AA:
        lda     #0x20
        jsr     L1B46
        lda     #0x19
        sta     0x54


L18B3:
        jsr     L1B63
        lda     0x54
        bne     L18B3
        lda     #0x00
        sta     0x5D
        lda     #0x02
        sta     0x5E
        sta     0x5F
        jsr     L1A84
        lda     #0x00
        sta     U19_PORTA
        lda     #0x00
        sta     0x6B


L18D0:
        lda     0x74
        sta     0x58


L18D4:
        lda     #0x0A
        sta     0x54


L18D8:
        jsr     L1B63
        lda     0x6B
        bmi     L18E2
        jsr     0x1C4D


L18E2:
        lda     0x72
        bmi     L192D
        bne     L18F9
        lda     #0x64
        sta     0x55
        lda     #0x80
        sta     transport_periph$ddr_reg_b
        lda     #0x03
        sta     0x72
        lda     #0xA0
        sta     0x51


L18F9:
        lda     0x72
        ror
        bcc     L1909
        lda     0x55
        bne     L1909
        lda     #0x02
        sta     0x72
        jmp     L1920


L1909:
        lda     transport_periph$ddr_reg_b
        ror
        bcs     L1913
        lda     #0xA0
        sta     0x51


L1913:
        lda     0x51
        bne     L1928
        lda     #0x10
        sta     transport_periph$ddr_reg_b
        lda     #0x80
        sta     0x72


L1920:
        lda     #0x20
        and     U18_PORTB
        sta     U18_PORTB


L1928:
        lda     0x72
        ror
        bcs     L18D8


L192D:
        jsr     L1BBF
        jsr     0x1C1A
        lda     0x62
        bne     L18D8
        lda     U18_PORTB
        and     #0x20
        beq     L1966
        lda     0x5A
        beq     L1945
        jmp     L19B6


L1945:
        rol
        bcc     L194B
        jmp     L19CA


L194B:
        rol
        rol
        bcc     L1952
        jmp     L1A71


L1952:
        and     #0xB0
        beq     L1959
        jmp     L19F9


L1959:
        lda     0x74
        beq     L1963
        lda     0x58
        bne     L1963
        inc     0x5A


L1963:
        jmp     L18D8


L1966:
        lda     0x72
        bpl     L1963
        lda     #0x00
        sta     U18_PORTB


L196F:
        jsr     L1B63
        lda     U18_PORTA
        eor     #0xFF
        sta     U18_PORTB
        beq     L196F
        cmp     #0x20
        bne     L1987
        lda     #0x00
        sta     U18_PORTB
        beq     L1963


L1987:
        cmp     #0x10
        bne     L196F
        lda     U19_PORTA
        eor     #0xFF
        lsr
        lsr
        lsr
        lsr
        tax
        cmp     #0x09
        bne     L19A2
        lda     #0x00
        sta     0x74
        sta     U19_PORTB
        beq     L1966


L19A2:
        lda     #0x00


L19A4:
        dex
        bmi     L19AC
        clc
        adc     #0x03
        bne     L19A4


L19AC:
        clc
        adc     #0x1B
        sta     U19_PORTB
        sta     0x74
        bne     L1966


L19B6:
        lda     #0xA0
        sta     U18_PORTB
        lda     0x5F
        sta     0x5E
        jsr     L1A84
        jsr     L1AE9
        dec     0x5A
        jsr     0x1CB3


L19CA:
        lda     0x5F
        cmp     0x5E
        bne     L19F1
        inc     0x5F
        lda     0x5F
        cmp     #0x06
        beq     L19EC
        cmp     #0x10
        beq     L19EC
        cmp     #0x1A
        bne     L19F1
        lda     #0x02
        sta     0x5F
        lda     #0x02
        sta     U19_PORTA
        jmp     L1863


L19EC:
        clc
        adc     #0x06
        sta     0x5F


L19F1:
        inc     0x5E
        jsr     L1A94
        jmp     L18D0


L19F9:
        lda     0x58
        sta     0x73
        lda     U18_PORTB
        and     #0x0F
        sta     0x64
        sta     0x65
        ror
        bcc     L1A1C
        clc
        lda     #0x06
        adc     0x60
        inc     0x60
        ldx     0x60
        cpx     #0x03
        bcc     L1A1E
        ldx     #0x00
        stx     0x60
        beq     L1A1E


L1A1C:
        lda     #0x0A


L1A1E:
        ldx     0x5F
        cpx     #0x0E
        bcc     L1A27
        clc
        adc     #0x0A


L1A27:
        sta     0x5E
        jsr     L1A84
        jsr     L1AE9
        jsr     0x1D39


L1A32:
        lda     #0xFA
        sta     0x51


L1A36:
        jsr     L1BBF
        lda     0x62
        bne     L1A4E
        jsr     L1B63
        lda     0x51
        bne     L1A36
        lda     U18_PORTB
        eor     0x65
        sta     U18_PORTB
        bne     L1A32


L1A4E:
        jsr     L1B63
        jsr     L1BBF
        lda     0x62
        bne     L1A4E
        lda     U18_PORTB
        and     0x64
        bne     L1A62
        jmp     L18D4


L1A62:
        jsr     0x1CB3


L1A65:
        inc     0x5E
        jsr     L1A94
        lda     0x73
        sta     0x58
        jmp     L18D4


L1A71:
        lda     #0x01
        sta     0x5E
        jsr     L1A84
        jsr     L1AE9
        jsr     0x1C4D
        jsr     0x1CB3
        jmp     L1A65


L1A84:
        lda     0x5E
        cmp     0x5D
        bcc     L1A90
        beq     L1A8F
        jsr     L1A94


L1A8F:
        rts


L1A90:
        jsr     L1AAD
        rts


L1A94:
        lda     #0x20
        jsr     L1B46
        jsr     L1B1E
        inc     0x5D
        lda     0x5D
        sta     U19_PORTB
        lda     0x5E
        cmp     0x5D
        bne     L1A94
        jsr     L1AC8
        rts


L1AAD:
        inc     0x5D


L1AAF:
        lda     #0x40
        jsr     L1B46
        jsr     L1B1E
        dec     0x5D
        lda     0x5D
        sta     U19_PORTB
        lda     0x5E
        cmp     0x5D
        bne     L1AAF
        jsr     L1ADB
        rts


L1AC8:
        lda     #0x40
        jsr     L1B46
        jsr     L1B1E
        lda     #0x03
        sta     0x54


L1AD4:
        jsr     L1B63
        lda     0x54
        bne     L1AD4


L1ADB:
        lda     #0x20
        jsr     L1B46
        jsr     L1B1E
        lda     #0x10
        jsr     L1B46
        rts


L1AE9:
        lda     0x72
        bmi     L1B1D
        lda     #0x80
        jsr     L1B46
        lda     #0xFA
        sta     0x50


L1AF6:
        jsr     L1B63
        lda     0x50
        bne     L1AF6


L1AFD:
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1AFD
        lda     #0xA0
        sta     0x50


L1B07:
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1AF6
        jsr     L1B63
        lda     0x50
        bne     L1B07
        lda     #0x10
        jsr     L1B46
        lda     #0x80
        sta     0x72


L1B1D:
        rts


L1B1E:
        lda     0x5D
        sta     U19_PORTB


L1B23:
        lda     #0x00
        sta     0x61


L1B27:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x61
        lda     0x61
        cmp     #0x21
        bcs     L1B45


L1B36:
        jsr     L1B63
        lda     0x50
        beq     L1B23
        lda     transport_control_reg_b
        bpl     L1B36
        jmp     L1B27


L1B45:
        rts


L1B46:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     0x50


L1B4D:
        jsr     L1B63
        lda     0x50
        bne     L1B4D
        lda     transport_periph$ddr_reg_b
        and     #0x60
        bne     L1B62
        lda     #0x00
        sta     transport_periph$ddr_reg_b
        sta     0x72


L1B62:
        rts


L1B63:
        lda     U18_edge_detect_control_DI_pos
        sta     0x5C
        beq     L1BBE
        lda     0x5B
        bmi     L1B7C
        lda     0x5C
        and     #0x40
        beq     L1B8A
        lda     #0x80
        sta     0x5B
        lda     #0xFA
        sta     0x51


L1B7C:
        lda     0x51
        bne     L1B86
        lda     #0x00
        sta     0x5B
        inc     0x5A


L1B86:
        lda     0x5C
        bpl     L1BBE


L1B8A:
        lda     U18_timer
        eor     #0xFF
        lsr
        lsr
        lsr
        sta     0x59
        bcc     L1B98
        inc     0x59


L1B98:
        lda     #0x7A
        sec
        sbc     0x59
        sta     U18_timer_8T_DI
        dec     0x50
        dec     0x51
        dec     0x52
        dec     0x53
        bne     L1BBE
        lda     #0x64
        sta     0x53
        dec     0x54
        dec     0x55
        dec     0x56
        dec     0x57
        bne     L1BBE
        lda     #0x64
        sta     0x57
        dec     0x58


L1BBE:
        rts


L1BBF:
        lda     0x62
        bne     L1BF0
        lda     U18_PORTA
        eor     #0xFF
        and     #0xE9
        beq     L1BEF
        sta     0x63
        and     #0x20
        beq     L1BDB
        eor     U18_PORTB
        sta     U18_PORTB
        jmp     L1BE7


L1BDB:
        lda     U18_PORTB
        and     #0x20
        beq     L1BEF
        ora     0x63
        sta     U18_PORTB


L1BE7:
        lda     #0x80
        sta     0x62
        lda     #0x14
        sta     0x50


L1BEF:
        rts


L1BF0:
        lda     0x62
        rol
        bcc     L1BFE
        lda     0x50
        bne     L1C19
        lda     #0x40
        sta     0x62
        rts


L1BFE:
        rol

;        bcc     0xhh                   ; incomplete instruction
        .byte   0x90                    ; put first byte here

; Symbols out of range
L1C19   =       0x1C19
