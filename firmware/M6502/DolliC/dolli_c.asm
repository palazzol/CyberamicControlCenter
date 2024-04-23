        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Dolli Dimples Program
;       Version C ?
;
;       This image was recovered from a 2708 with a label "Dolli C 1C00"
;
X0000 = 0x0000
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
X005B = 0x005B
X005C = 0x005C
X005D = 0x005D
X005E = 0x005E
X005F = 0x005F
X0060 = 0x0060
X0061 = 0x0061
X0062 = 0x0062
X0063 = 0x0063
X0084 = 0x0084
X0086 = 0x0086
X0088 = 0x0088
X008A = 0x008A
X0201 = 0x0201
X0202 = 0x0202
X0203 = 0x0203
X0204 = 0x0204
X0205 = 0x0205
X0217 = 0x0217
X0280 = 0x0280
X0281 = 0x0281
X0282 = 0x0282
X0283 = 0x0283
X0300 = 0x0300
X0301 = 0x0301
X0302 = 0x0302
X0303 = 0x0303
X0380 = 0x0380
X0381 = 0x0381
X0382 = 0x0382
X0383 = 0x0383

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
        sta     X0000,x
        inx
        cpx     #0x80
        bne     L1C09
        lda     #0x00
        sta     X0301
        sta     X0300
        sta     X0381
        sta     X0380
        sta     X0383
        sta     X0205
        sta     X0303
        sta     X0201
        lda     #0x02
        sta     X0281
        lda     #0xFF
        sta     X0382
        sta     X0203
        sta     X0283
        lda     #0xFC
        sta     X0302
        lda     #0x2E
        sta     X0301
        sta     X0303
        sta     X0383
        sta     X0381
        lda     #0x64
        sta     X0053
        lda     #0x2B
        sta     X0057
        lda     #0x10
        sta     X0063
        lda     #0x10
        jsr     L1D1F
        lda     #0x28
        sta     X0054
L1C62:
        jsr     L1E13
        lda     X0054
        bne     L1C62
L1C69:
        lda     #0x40
        jsr     L1D1F
L1C6E:
        jsr     L1D33
        lda     X0058
        cmp     #0x60
        bcc     L1C6E
        lda     #0x20
        jsr     L1D1F
        lda     #0x19
        sta     X0054
L1C80:
        jsr     L1E13
        lda     X0054
        bne     L1C80
        lda     #0x00
        sta     X0059
        jsr     L1D33
        inc     X0059
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
        lda     X005A
        bne     L1CBF
        lda     #0x02
        sta     X0280
        lda     #0x00
        sta     X0202
        lda     X0057
        bne     L1CA5
        inc     X005A
L1CBF:
        jsr     L1CF9
        lda     #0x00
        sta     X0280
        lda     #0x80
        sta     X0202
        lda     #0x80
        jsr     L1D1F
        jsr     L1D61
        dec     X005A
        jsr     L1D87
        jsr     L1CF9
        lda     #0x2B
        sta     X0057
        inc     X0059
        lda     X0059
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
        sta     X0084,x
        sta     X0086,x
        sta     X0088,x
        sta     X008A,x
        rts
;
L1D1F:
        sta     X0302
        lda     #0xFF
        sta     X0050
L1D26:
        jsr     L1E13
        lda     X0050
        bne     L1D26
        lda     #0x00
        sta     X0302
        rts
;
L1D33:
        lda     #0x00
        sta     X0058
L1D37:
        jsr     L1E13
        lda     X0303
        bpl     L1D37
        lda     #0x04
        sta     X0054
L1D43:
        jsr     L1E13
        lda     X0303
        bpl     L1D56
        inc     X0058
        lda     X0302
        lda     X0058
        cmp     #0x60
        bcs     L1D60
L1D56:
        lda     X0054
        bne     L1D43
        lda     X0058
        cmp     #0x20
        bcc     L1D33
L1D60:
        rts
;
L1D61:
        lda     #0xFA
        sta     X0050
L1D65:
        jsr     L1E13
        lda     X0050
        bne     L1D65
L1D6C:
        jsr     L1E13
        lda     X0302
        ror     a
        bcc     L1D6C
        lda     #0xA0
        sta     X0050
L1D79:
        jsr     L1E13
        lda     X0302
        ror     a
        bcc     L1D6C
        lda     X0050
        bne     L1D79
        rts
;
L1D87:
        lda     X0300
        lda     #0x40
        sta     X0086
        sta     X008A
L1D90:
        lda     X0302
        lsr     a
        bcc     L1DA7
        jsr     L1EA0
        jsr     L1E13
        lda     X0301
        bpl     L1D90
        jsr     L1DB9
        jmp     L1D90
;
L1DA7:
        lda     #0x64
        sta     X0050
L1DAB:
        jsr     L1E13
        lda     X0302
        lsr     a
        bcs     L1D87
        lda     X0050
        bne     L1DAB
        rts
;
L1DB9:
        lda     X0300
        and     #0x7F
        sta     X005C
        and     #0x7E
        cmp     #0x22
        beq     L1DFE
        cmp     #0x36
        beq     L1DFE
        lda     X005C
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
        sta     X005D
        lda     X005E
        lsr     a
        bcs     L1DF7
        lda     X005D
        eor     #0xFF
        and     X0000,x
        sta     X0000,x
        rts
;
L1DF7:
        lda     X005D
        ora     X0000,x
        sta     X0000,x
        rts
;
L1DFE:
        lda     X005C
        sta     X005E
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
        lda     X0205
        sta     X005F
        beq     L1E5E
        lda     X005B
        bmi     L1E2C
        lda     X005F
        and     #0x40
        beq     L1E3A
        lda     #0x80
        sta     X005B
        lda     #0xFA
        sta     X0051
L1E2C:
        lda     X0051
        bne     L1E36
        lda     #0x00
        sta     X005B
        inc     X005A
L1E36:
        lda     X005F
        bpl     L1E5E
L1E3A:
        lda     X0204
        lda     #0x01
        sta     X0217
        dec     X0050
        dec     X0051
        dec     X0052
        dec     X0053
        bne     L1E5E
        lda     #0x64
        sta     X0053
        dec     X0054
        dec     X0055
        dec     X0056
        bne     L1E5E
        lda     #0x64
        sta     X0056
        dec     X0057
L1E5E:
        rts
;
L1E5F:
        lda     #0x00
        sta     X0061
        sta     X0062
        lda     #0x0A
        sta     X0054
L1E69:
        jsr     L1E13
        lda     X0054
        bne     L1E69
        lda     #0x0A
        sta     X0054
        lda     X0062
        cmp     #0x08
        beq     L1E8F
        inc     X0062
        ldx     #0x09
        sec
        lda     X0380
L1E82:
        rol     a
        dex
        bcc     L1E82
        clc
        txa
        adc     X0061
        sta     X0061
        jmp     L1E69
;
L1E8F:
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
L1EA0:
        lda     X0280
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     X0060
        tax
        lda     X1ED3,x
        sta     X0063
        lda     X0052
        bne     L1ECC
        lda     #0x0A
        sta     X0052
        lda     X0063
        cmp     X0382
        bcc     L1EC9
        beq     L1ECC
        inc     X0382
        jmp     L1ECC
;
L1EC9:
        dec     X0382
L1ECC:
        lda     X0382
        sta     X0282
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
