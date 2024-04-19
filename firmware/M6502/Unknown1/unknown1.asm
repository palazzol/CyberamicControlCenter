
        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Unknown Program (1)
;       Version Unknown
;
;       This image was recovered from the last quarter of a 2732 with a black label
;
RAM_start = 0x0000
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
X0064 = 0x0064

X0080 = 0x0080
X0081 = 0x0081
X0082 = 0x0082
X0083 = 0x0083
X0086 = 0x0086
X008A = 0x008A
X008E = 0x008E
X0201 = 0x0201
X0202 = 0x0202
X0203 = 0x0203
X0204 = 0x0204
X0205 = 0x0205
X0215 = 0x0215
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
        sta     RAM_start,x
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
        lda     #0x3C
        sta     X0381
        sta     X0383
        lda     #0x64
        sta     X0053
        lda     #0x1E
        sta     X0056
        lda     #0x64
        sta     X0055
        lda     #0x10
        sta     X0063
        lda     #0x10
        jsr     L1D72
        lda     #0x28
        sta     X0054
        lda     #0x64
        sta     X0053
L1C6C:
        jsr     L1E83
        lda     X0054
        bne     L1C6C
L1C73:
        lda     #0x40
        jsr     L1D72
L1C78:
        lda     #0x00
        sta     X0058
L1C7C:
        lda     X0302
        lda     #0x0A
        sta     X0050
        inc     X0058
        lda     X0058
        cmp     #0x64
        bcs     L1C9A
L1C8B:
        jsr     L1E83
        lda     X0050
        beq     L1C78
        lda     X0303
        bpl     L1C8B
        jmp     L1C7C
;
L1C9A:
        lda     #0x20
        jsr     L1D72
        lda     #0x19
        sta     X0054
        lda     #0x64
        sta     X0053
L1CA7:
        jsr     L1E83
        lda     X0054
        bne     L1CA7
        lda     #0x00
        sta     X0059
        jsr     L1D8D
        lda     #0x40
        jsr     L1D72
        jsr     L1D8D
        lda     #0xFA
        sta     X0050
L1CC1:
        jsr     L1E83
        lda     X0050
        bne     L1CC1
        lda     #0x20
        jsr     L1D72
        jsr     L1D8D
        inc     X0059
        lda     #0x10
        jsr     L1D72
        lda     #0x80
        jsr     L1D72
        jsr     L1DB0
        lda     #0x10
        jsr     L1D72
        jsr     L1D3F
L1CE7:
        jmp     L1F68
;
L1CEA:
        jsr     L1F24
        lda     X005A
        bne     L1D01
        lda     #0x02
        sta     X0280
        lda     #0x00
        sta     X0202
        jmp     L1CE7
;
        nop
        nop
        nop
L1D01:
        jsr     L1D3F
        lda     #0x00
        sta     X0280
        lda     #0x80
        sta     X0202
        lda     #0x80
        jsr     L1D72
        jsr     L1DB0
        dec     X005A
        jsr     L1DD6
        jsr     L1D3F
        lda     #0x1E
        sta     X0056
        lda     #0x64
        sta     X0055
        inc     X0059
        lda     X0059
        cmp     #0x1A
        bcc     L1D31
        jmp     L1C73
;
L1D31:
        jsr     L1DB0
        lda     #0x10
        jsr     L1D72
        jsr     L1EDB
        jmp     L1CE7
;
L1D3F:
        lda     #0x3C
        sta     X0383
        lda     #0x34
        sta     X0381
        ldx     #0x00
L1D4B:
        lda     #0x30
        sta     X0081,x
        sta     X0083,x
        lda     #0xFF
        sta     X0080,x
        sta     X0082,x
        lda     #0x34
        sta     X0081,x
        sta     X0083,x
        lda     #0x00
        sta     X0080,x
        sta     X0082,x
        inx
        inx
        inx
        inx
        cpx     #0x20
        bcc     L1D4B
        lda     #0x00
        sta     X005E
        sta     X0064
        rts
;
L1D72:
        sta     X0302
        lda     #0xFA
        sta     X0050
L1D79:
        jsr     L1E83
        lda     X0050
        bne     L1D79
        lda     X0302
        and     #0x60
        bne     L1D8C
        lda     #0x00
        sta     X0302
L1D8C:
        rts
;
L1D8D:
        lda     #0x00
        sta     X0058
L1D91:
        lda     X0302
        lda     #0x0A
        sta     X0050
        inc     X0058
        lda     X0058
        cmp     #0x21
        bcs     L1DAF
L1DA0:
        jsr     L1E83
        lda     X0050
        beq     L1D8D
        lda     X0303
        bpl     L1DA0
        jmp     L1D91
L1DAF:
        rts
;
L1DB0:
        lda     #0xFA
        sta     X0050
L1DB4:
        jsr     L1E83
        lda     X0050
        bne     L1DB4
L1DBB:
        jsr     L1E83
        lda     X0302
        ror     a
        bcc     L1DBB
        lda     #0xA0
        sta     X0050
L1DC8:
        jsr     L1E83
        lda     X0302
        ror     a
        bcc     L1DBB
        lda     X0050
        bne     L1DC8
        rts
;
L1DD6:
        lda     X0300
        lda     #0x40
        sta     X0082
        sta     X0086
        sta     X008A
        sta     X008E
        lda     #0x3C
        sta     X0381
        lda     #0x34
        sta     X0383
        lda     #0x60
        sta     X0082
L1DF1:
        lda     X0302
        lsr     a
        bcc     L1E08
        jsr     L1F24
        jsr     L1E83
        lda     X0301
        bpl     L1DF1
        jsr     L1E1A
        jmp     L1DF1
;
L1E08:
        lda     #0x64
        sta     X0050
L1E0C:
        jsr     L1E83
        lda     X0302
        lsr     a
        bcs     L1DD6
        lda     X0050
        bne     L1E0C
        rts
;
L1E1A:
        lda     X0300
        and     #0x7F
        sta     X005C
        and     #0x7E
        cmp     #0x22
        beq     L1E61
        cmp     #0x32
        bcc     L1E7A
        cmp     #0x3A
        bcc     L1E61
        lda     X005C
        cmp     #0x41
        bcc     L1E7A
        cmp     #0x4F
        bcs     L1E7A
        ldx     X0064
        sec
        sbc     #0x41
        cmp     #0x08
        bcc     L1E44
        inx
        inx
L1E44:
        and     #0x07
        tay
        lda     X1E7B,y
        sta     X005D
        lda     X005E
        lsr     a
        bcs     L1E5A
        lda     X005D
        eor     #0xFF
        and     RAM_start,x
        sta     RAM_start,x
        rts
;
L1E5A:
        lda     X005D
        ora     RAM_start,x
        sta     RAM_start,x
        rts
;
L1E61:
        lda     X005C
        sta     X005E
        and     #0x7E
        cmp     #0x22
        bne     L1E70
        lda     #0x98
        sta     X0064
        rts
;
L1E70:
        sec
        sbc     #0x32
        asl     a
        clc
        adc     #0x80
        sta     X0064
        rts
L1E7A:
        rts
;
X1E7B:
        .db     0x01,0x02,0x04,0x08
        .db     0x10,0x20,0x40,0x80
;
L1E83:
        lda     X0205
        sta     X005F
        beq     L1EDA
        lda     X005B
        bmi     L1E9C
        lda     X005F
        and     #0x40
        beq     L1EAA
        lda     #0x80
        sta     X005B
        lda     #0xFA
        sta     X0051
L1E9C:
        lda     X0051
        bne     L1EA6
        lda     #0x00
        sta     X005B
        inc     X005A
L1EA6:
        lda     X005F
        bpl     L1EDA
L1EAA:
        lda     X0204
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        sta     X0057
        bcc     L1EB8
        inc     X0057
L1EB8:
        lda     #0x7A
        sec
        sbc     X0057
        sta     X0215
        dec     X0050
        dec     X0051
        dec     X0052
        dec     X0053
        bne     L1EDA
        lda     #0x64
        sta     X0053
        dec     X0054
        dec     X0055
        bne     L1EDA
        lda     #0x64
        sta     X0055
        dec     X0056
L1EDA:
        rts
;
L1EDB:
        lda     #0x00
        sta     X0061
        sta     X0062
        lda     #0x0A
        sta     X0054
        lda     #0x64
        sta     X0053
L1EE9:
        jsr     L1E83
        lda     X0054
        bne     L1EE9
        lda     #0x0A
        sta     X0054
        lda     #0x64
        sta     X0053
        lda     X0062
        cmp     #0x08
        beq     L1F13
        inc     X0062
        ldx     #0x09
        sec
        lda     X0380
L1F06:
        rol     a
        dex
        bcc     L1F06
        clc
        txa
        adc     X0061
        sta     X0061
        jmp     L1EE9
;
L1F13:
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
L1F24:
        lda     X0280
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     X0060
        tax
        lda     X1F57,x
        sta     X0063
        lda     X0052
        bne     L1F50
        lda     #0x0A
        sta     X0052
        lda     X0063
        cmp     X0382
        bcc     L1F4D
        beq     L1F50
        inc     X0382
        jmp     L1F50
;
L1F4D:
        dec     X0382
L1F50:
        lda     X0382
        sta     X0282
        rts
;
X1F57:
        .db     0x03, 0x04, 0x06, 0x08
        .db     0x10, 0x16, 0x20, 0x2D
        .db     0x40, 0x5A, 0x80, 0xBF
        .db     0xFF, 0xFF, 0xFF, 0xFF 
        .db     0xFF
;
L1F68:
        lda     #0x00
        sta     X005A
        jsr     L1E83
        jmp     L1CEA
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

