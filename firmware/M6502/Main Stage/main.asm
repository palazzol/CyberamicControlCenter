
        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Main Stage Program
;       Version Unknown
;
;       This image was recovered from an unmarked 2732
;

; start of RAM
RAM_start = 0x0000

X0030   = 0x0030
X0031   = 0x0031
X0032   = 0x0032
X0033   = 0x0033

; Table Addresses go here
X0034   = 0x0034
X0035   = 0x0035
X0036   = 0x0036
X0037   = 0x0037
X0038   = 0x0038
X0039   = 0x0039
X003A   = 0x003A
X003B   = 0x003B
X003C   = 0x003C
X003D   = 0x003D

; IRQ timer section 1
X003E   = 0x003E
X003F   = 0x003F
X0040   = 0x0040
X0041   = 0x0041
X0042   = 0x0042

X0044   = 0x0044
X0045   = 0x0045
X0046   = 0x0046
X0047   = 0x0047
X0048   = 0x0048
X0049   = 0x0049
X004A   = 0x004A

; IRQ timer section 2
X004B   = 0x004B
X004C   = 0x004C
X004D   = 0x004D
X004E   = 0x004E
X004F   = 0x004F
X0050   = 0x0050
X0051   = 0x0051
X0052   = 0x0052
X0053   = 0x0053

X0055   = 0x0055
X0056   = 0x0056
X0057   = 0x0057
X0058   = 0x0058
X0059   = 0x0059
X005A   = 0x005A
X005B   = 0x005B
X005C   = 0x005C
X005D   = 0x005D
X005E   = 0x005E
X005F   = 0x005F
X0060   = 0x0060
X0061   = 0x0061
X0062   = 0x0062
X0063   = 0x0063
X0064   = 0x0064    ; Command byte
X0065   = 0x0065    ; Channel byte
X0066   = 0x0066    ; Two byte address of current memory
X0067   = 0x0067    ;   address to write to cards
X0068   = 0x0068    ; Current Bitmask
X0069   = 0x0069
X006A   = 0x006A
X006B   = 0x006B
X006C   = 0x006C
X006D   = 0x006D

X0070   = 0x0070

        .include "../include/ptt6502.def"

        .org    0x1000
;
;       IRQ handler
;
IRQ:
        pha
        lda     U18_edge_detect_control_DI_pos  ; clear PA7 flag
        lda     U19_edge_detect_control_DI_pos  ; clear PA7 flag
        lda     #0x7D
        sta     U18_1D                  ; div by 8, enable interrupt
        lda     X004B                   ; timer
        beq     L1012
        dec     X004B
L1012:
        lda     X004C                   ; timer
        beq     L1018
        dec     X004C
L1018:
        lda     X004D                   ; timer
        beq     L101E
        dec     X004D
L101E:
        dec     X004E                   ; timer
        bne     L1064
        lda     #0x64
        sta     X004E
        lda     X004F                   ; timer
        beq     L102C
        dec     X004F
L102C:
        lda     X0050                   ; timer
        beq     L1032
        dec     X0050
L1032:
        lda     X0051                   ; timer
        beq     L1038
        dec     X0051
L1038:
        lda     X003E                   ; timer
        beq     L103E
        dec     X003E
L103E:
        lda     X003F                   ; timer
        beq     L1044
        dec     X003F
L1044:
        lda     X0040                   ; timer
        beq     L104A
        dec     X0040
L104A:
        lda     X0041                   ; timer
        beq     L1050
        dec     X0041
L1050:
        lda     X0042                   ; timer
        beq     L1056
        dec     X0042
L1056:
        dec     X0052                   ; timer
        bne     L1064
        lda     #0x64
        sta     X0052
        lda     X0053                   ; timer
        beq     L1064
        dec     X0053
L1064:
        pla
        rti
;
;       Main Program Start
;
RESET:
        cld
        sei
        ldx     #0xF0
        txs
        lda     #0x00
        ldx     #0x10
L106F:
        sta     RAM_start,x
        inx
        cpx     #0x80
        bne     L106F
        lda     #0x00
        sta     transport_control_reg_a
        sta     U18_PORTB
        sta     audio_control_reg_a
        sta     audio_control_reg_b
        sta     U18_edge_detect_control_DI_pos
        sta     U19_edge_detect_control_DI_pos
        sta     U18_06
        sta     U19_86
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
        sta     X005E
        lda     #0x64
        sta     X004E
        cli
        sta     U18_1C
        lda     #0x09
        sta     X0102
        jsr     L18FC
        jsr     L1699
        lda     #0x02
        sta     U19_PORTA
        lda     #0x33
        jsr     L170F
        lda     #0x10
        jsr     L158C
        lda     #0x28
        sta     X004F
L10F0:
        jsr     L1939
        lda     X004F
        bne     L10F0
        jsr     L1699
        jsr     L18AA
        lda     U18_PORTA
        eor     #0xFF
        cmp     #0x10
        bne     L111B
        lda     #0xFF
        sta     board_7_periph$ddr_reg_a
        sta     board_7_periph$ddr_reg_b
        sta     board_8_periph$ddr_reg_a
        sta     board_8_periph$ddr_reg_b
        sta     U18_PORTB
L1113:
        lda     #0x32
        jsr     L170F
        jmp     L1113
;
L111B:
        lda     #0x40
        jsr     L158C
        lda     X0055
        sta     U19_PORTB
L1125:
        lda     #0x00
        sta     X0059
L1129:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     X004B
        inc     X0059
        lda     X0059
        cmp     #0x64
        bcs     L1147
L1138:
        jsr     L1939
        lda     X004B
        beq     L1125
        lda     transport_control_reg_b
        bpl     L1138
        jmp     L1129
;
L1147:
        lda     #0x20
        jsr     L158C
        lda     #0x19
        sta     X004F
L1150:
        jsr     L1939
        lda     X004F
        bne     L1150
        lda     #0x00
        sta     X0055
        lda     #0x01
        sta     X0056
        sta     X0057
        jsr     L14C7
        lda     #0x80
        jsr     L158C
        jsr     L152C
        lda     #0x96
        sta     X004F
        lda     #0x80
        jsr     L158C
        jsr     L158C
L1178:
        jsr     L11F1
        cmp     #0x24
        bne     L1178
L117F:
        jsr     L11F1
        cmp     #0x24
        beq     L117F
        and     #0x3F
        cmp     X0056
        beq     L1193
        jmp     RESET
;
        lda     #0x00
        sta     X0049
L1193:
        jsr     L11F1
        cmp     #0x28
        bne     L1193
        jsr     L11F1
        cmp     #0x47
        bcc     L11CC
        cmp     #0x5A
        bcs     L11CC
        and     #0x1F
        ldx     #0x00
        ldy     #0x00
L11AB:
        sta     X0070,x
        inx
        jsr     L11F1
        cmp     X11E9,y
        beq     L11AB
        iny
        cmp     X11E9,y
        bne     L11CC
        cpy     #0x07
        bne     L11AB
        dex
        cpx     X0070
        bne     L11CC
        lda     #0x00
        sta     X0049
        jmp     L1211
;
L11CC:
        lda     X0049
        beq     L11E2
L11D0:
        lda     #0xFF
        sta     X0049
        sta     U18_PORTB
        sta     U19_PORTB
        lda     #0x10
        jsr     L158C
        jmp     L11D0
;
L11E2:
        lda     #0x80
        sta     X0049
        jmp     L1193
;
X11E9:
        .ascii  "DRBCSIR)"
;
L11F1:
        lda     X004F
        beq     L1200
        lda     transport_control_reg_a             ; Wait for Transport Byte
        bpl     L11F1
        lda     transport_periph$ddr_reg_a          ; Read Transport Byte
        and     #0x7F
        rts
;
L1200:
        lda     X0049
        beq     L1207
        jmp     L11D0
;
L1207:
        lda     #0x0F
        sta     X0049
        lda     #0x02
        sta     X0057
        pla
        pla
L1211:
        jsr     L18FC
        lda     #0x02
        sta     X0056
        jsr     L14C7
        lda     #0x00
        sta     U19_PORTA
        lda     #0x00
        sta     X0063
L1224:
        lda     #0x18
        sta     X0053
L1228:
        lda     #0x0A
        sta     X004F
L122C:
        jsr     L1939
        lda     X0063
        bmi     L1236
        jsr     L1633
L1236:
        lda     X006B
        bmi     L1281
        bne     L124D
        lda     #0x64
        sta     X0050
        lda     #0x80
        jsr     L158C
        lda     #0x03
        sta     X006B
        lda     #0xA0
        sta     X004C
L124D:
        lda     X006B
        ror     a
        bcc     L125D
        lda     X0050
        bne     L125D
        lda     #0x02
        sta     X006B
        jmp     L1274
;
L125D:
        lda     transport_periph$ddr_reg_b
        ror     a
        bcs     L1267
        lda     #0xA0
        sta     X004C
L1267:
        lda     X004C
        bne     L127C
        lda     #0x10
        jsr     L158C
        lda     #0x80
        sta     X006B
L1274:
        lda     #0x80
        and     U18_PORTB
        sta     U18_PORTB
L127C:
        lda     X006B
        ror     a
        bcs     L122C
L1281:
        jsr     L15A9
        jsr     L1600
        lda     X005A
        bne     L122C
        lda     U18_PORTB
        bpl     L1224
        rol     a
        rol     a
        bcc     L1297
        jmp     L1364
;
L1297:
        rol     a
        bcc     L129D
        jmp     L1315
;
L129D:
        rol     a
        bcc     L12A3
        jmp     L12C4
;
L12A3:
        and     #0xF0
        beq     L12AA
        jmp     L136D
;
L12AA:
        jsr     L16CD
        lda     X0032
        cmp     #0x01
        beq     L12C1
        jsr     L18AA
        lda     #0x40
        sta     board_5_periph$ddr_reg_b
        lda     X0053
        beq     L1315
        jmp     L122C
L12C1:
        jmp     L1224
;
L12C4:
        lda     #0x01
        sta     X0056
        jsr     L14C7
        jsr     L152C
        jsr     L173F
        inc     X0056
        jsr     L14D7
        jmp     L1224
;
L12D9:
        inc     X0031
        jsr     L16CD
        lda     X0032
        cmp     #0x02
        beq     L12E7
        jmp     L122C
;
L12E7:
        lda     #0x31
        jsr     L170F
        lda     #0x28
        sta     X004F
L12F0:
        jsr     L1939
        lda     X004F
        bne     L12F0
        jsr     L16CD
        lda     X0032
        cmp     #0x01
        beq     L1303
        jmp     L122C
;
L1303:
        lda     U18_PORTB
        and     #0x80
        sta     U18_PORTB
        jsr     L18B5
        lda     #0x41
        sta     board_5_periph$ddr_reg_b
        jmp     L1224
;
L1315:
        lda     X0031
        beq     L12D9
        lda     X0049
        cmp     #0x0F
        beq     L1376
        lda     #0x52
        sta     X004A
        ldx     X0044
        jsr     L14B7
        stx     X0044
        lda     #0xA0
        sta     U18_PORTB
        jsr     L14C7
        jsr     L152C
L1335:
        jsr     L1939
        jsr     L16CD
        lda     X0032
        cmp     #0x02
        beq     L1345
        cmp     #0x01
        beq     L1335
L1345:
        lda     #0x00
        sta     X0031
        jsr     L173F
L134C:
        lda     X0056
        cmp     X0070
        bcs     L135A
        inc     X0056
        jsr     L14D7
        jmp     L1224
;
L135A:
        lda     #0x02
        sta     X0056
        jsr     L14F0
        jmp     L1224
;
L1364:
        lda     X0049
        cmp     #0x0F
        beq     L139C
        jmp     L134C
;
L136D:
        lda     X0049
        cmp     #0x0F
        beq     L13CB
        jmp     L1461
;
L1376:
        lda     #0xA0
        sta     U18_PORTB
        lda     X0057
        sta     X0056
        jsr     L14C7
        jsr     L152C
L1385:
        jsr     L1939
        jsr     L16CD
        lda     X0032
        cmp     #0x02
        beq     L1395
        cmp     #0x01
        beq     L1385
L1395:
        lda     #0x00
        sta     X0031
        jsr     L173F
L139C:
        lda     X0057
        cmp     X0056
        bne     L13C3
        inc     X0057
        lda     X0057
        cmp     #0x06
        beq     L13BE
        cmp     #0x10
        beq     L13BE
        cmp     #0x1A
        bne     L13C3
        lda     #0x02
        sta     X0057
        lda     #0x02
        sta     U19_PORTA
        jmp     L1211
;
L13BE:
        clc
        adc     #0x06
        sta     X0057
L13C3:
        inc     X0056
        jsr     L14D7
        jmp     L1224
;
L13CB:
        lda     U18_PORTB
        sta     X005C
        and     #0x0F
        sta     X005D
        ror     a
        bcc     L13DB
        lda     #0x09
        bne     L13FA
L13DB:
        ror     a
        bcc     L13F1
        clc
        lda     #0x06
        adc     X0058
        inc     X0058
        ldx     X0058
        cpx     #0x03
        bcc     L13FA
        ldx     #0x00
        stx     X0058
        beq     L13FA
L13F1:
        ror     a
        bcc     L13F8
        lda     #0x0B
        bne     L13FA
L13F8:
        lda     #0x0A
L13FA:
        ldx     X0057
        cpx     #0x0E
        bcc     L1403
        clc
        adc     #0x0A
L1403:
        sta     X0056
L1405:
        jsr     L14C7
        jsr     L152C
        jsr     L18AA
L140E:
        jsr     L1939
        jsr     L16CD
        lda     X0032
        cmp     #0x02
        beq     L141E
        cmp     #0x01
        beq     L140E
L141E:
        lda     #0x3C
        sta     X0053
L1422:
        lda     #0xFA
        sta     X004C
L1426:
        jsr     L15A9
        lda     X005A
        bne     L1442
        lda     X0053
        beq     L1453
        jsr     L1939
        lda     X004C
        bne     L1426
        lda     U18_PORTB
        eor     X005D
        sta     U18_PORTB
        bne     L1422
L1442:
        jsr     L1939
        jsr     L15A9
        lda     X005A
        bne     L1442
        lda     U18_PORTB
        cmp     X005C
        beq     L1456
L1453:
        jmp     L1228
;
L1456:
        jsr     L173F
        inc     X0056
        jsr     L14D7
        jmp     L1224
;
L1461:
        lda     U18_PORTB
        sta     X005C
        and     #0x0F
        sta     X005D
        ror     a
        bcc     L1470
        jmp     L148D
;
L1470:
        ror     a
        bcc     L1476
        jmp     L147F
;
L1476:
        ror     a
        bcc     L147C
        jmp     L14A9
L147C:
        jmp     L149B
;
L147F:
        lda     #0x42
        sta     X004A
        ldx     X0045
        jsr     L14B7
        stx     X0045
        jmp     L1405
;
L148D:
        lda     #0x43
        sta     X004A
        ldx     X0046
        jsr     L14B7
        stx     X0046
        jmp     L1405
;
L149B:
        lda     #0x53
        sta     X004A
        ldx     X0047
        jsr     L14B7
        stx     X0047
        jmp     L1405
;
L14A9:
        lda     #0x49
        sta     X004A
        ldx     X0048
        jsr     L14B7
        stx     X0048
        jmp     L1405
;
L14B7:
        inx
        cpx     #0x1F
        bne     L14BE
        ldx     #0x02
L14BE:
        lda     X0070,x
        cmp     X004A
        bne     L14B7
        stx     X0056
        rts
;
L14C7:
        lda     X0056
        cmp     X0055
        bcc     L14D3
        beq     L14D2
        jsr     L14D7
L14D2:
        rts
;
L14D3:
        jsr     L14F0
        rts
;
L14D7:
        lda     #0x20
        jsr     L158C
        jsr     L1564
        inc     X0055
        lda     X0055
        sta     U19_PORTB
        lda     X0056
        cmp     X0055
        bne     L14D7
        jsr     L150B
        rts
;
L14F0:
        inc     X0055
L14F2:
        lda     #0x40
        jsr     L158C
        jsr     L1564
        dec     X0055
        lda     X0055
        sta     U19_PORTB
        lda     X0056
        cmp     X0055
        bne     L14F2
        jsr     L151E
        rts
;
L150B:
        lda     #0x40
        jsr     L158C
        jsr     L1564
        lda     #0x03
        sta     X004F
L1517:
        jsr     L1939
        lda     X004F
        bne     L1517
L151E:
        lda     #0x20
        jsr     L158C
        jsr     L1564
        lda     #0x10
        jsr     L158C
        rts
;
L152C:
        lda     X006B
        bmi     L1563
        lda     #0x80
        jsr     L158C
        lda     #0xFA
        sta     X004B
L1539:
        jsr     L1939
        lda     X004B
        bne     L1539
L1540:
        jsr     L1939
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1540
        lda     #0xA0
        sta     X004B
L154D:
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1539
        jsr     L1939
        lda     X004B
        bne     L154D
        lda     #0x10
        jsr     L158C
        lda     #0x80
        sta     X006B
L1563:
        rts
;
L1564:
        lda     X0055
        sta     U19_PORTB
L1569:
        lda     #0x00
        sta     X0059
L156D:
        lda     transport_periph$ddr_reg_b
        lda     #0x14
        sta     X004B
        inc     X0059
        lda     X0059
        cmp     #0x21
        bcs     L158B
L157C:
        jsr     L1939
        lda     X004B
        beq     L1569
        lda     transport_control_reg_b
        bpl     L157C
        jmp     L156D
L158B:
        rts
;
L158C:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     X004B
L1593:
        jsr     L1939
        lda     X004B
        bne     L1593
        lda     transport_periph$ddr_reg_b
        and     #0x60
        bne     L15A8
        lda     #0x00
        sta     transport_periph$ddr_reg_b
        sta     X006B
L15A8:
        rts
;
L15A9:
        lda     X005A
        bne     L15D6
        lda     U18_PORTA
        eor     #0xFF
        beq     L15D5
        sta     X005B
        bpl     L15C1
        eor     U18_PORTB
        sta     U18_PORTB
        jmp     L15CD
;
L15C1:
        lda     U18_PORTB
        and     #0x80
        beq     L15D5
        ora     X005B
        sta     U18_PORTB
L15CD:
        lda     #0x80
        sta     X005A
        lda     #0x14
        sta     X004B
L15D5:
        rts
;
L15D6:
        lda     X005A
        rol     a
        bcc     L15E4
        lda     X004B
        bne     L15FF
        lda     #0x40
        sta     X005A
        rts
;
L15E4:
        rol     a
        bcc     L15F7
        lda     U18_PORTA
        eor     #0xFF
        bne     L15FF
        lda     #0x20
        sta     X005A
        lda     #0x14
        sta     X004B
        rts
;
L15F7:
        lda     X004B
        bne     L15FF
        lda     #0x00
        sta     X005A
L15FF:
        rts
;
;       AGC audio stuff
;
L1600:
        lda     U19_PORTA
        eor     #0xFF
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     X005E
        tax
        lda     X1688,x
        sta     X0062
        lda     X004D
        bne     L162C
        lda     #0x0A
        sta     X004D
        lda     X0062
        cmp     audio_periph$ddr_reg_b
        bcc     L1629
        beq     L162C
        inc     audio_periph$ddr_reg_b
        jmp     L162C
;
L1629:
        dec     audio_periph$ddr_reg_b
L162C:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts
;
L1633:
        lda     X0063
        bne     L164C
        lda     #0x7F
        sta     X0063
        jsr     L18B5
        lda     #0x0A
        sta     X0051
        lda     X005E
        sta     X005F
        lda     #0x00
        sta     X0061
        sta     X0060
L164C:
        lda     X0051
        bne     L166C
        lda     #0x0A
        sta     X0051
        lda     X0060
        cmp     #0x08
        beq     L166D
        inc     X0060
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a
L1662:
        rol     a
        dex
        bcc     L1662
        clc
        txa
        adc     X0061
        sta     X0061
L166C:
        rts
;
L166D:
        lsr     X0061
        lsr     X0061
        lsr     X0061
        lda     X0061
        clc
        adc     X005F
        lsr     a
        sta     X005E
        lda     #0x00
        sta     X0061
        sta     X0060
        lda     #0xFF
        sta     X0063
        jmp     L18AA
;
;   AGC Mic table
;
X1688:
        .db     0x03, 0x04, 0x06, 0x08
        .db     0x10, 0x16, 0x20, 0x2D
        .db     0x40, 0x5A, 0x80, 0xBF
        .db     0xFF, 0xFF, 0xFF, 0xFF
        .db     0xFF
;
L1699:
        ldx     #0x00
L169B:
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
        bcc     L169B
        lda     #0x24
        sta     X0064
        lda     #0x00
        sta     X0067
        sta     X0069
        sta     X006A
        lda     transport_periph$ddr_reg_a          ; Read Transport Byte
        ldy     #0x00
        rts
;
L16CD:
        lda     #0x00
        sta     X0033
        lda     #0x02
        sta     X004F
L16D5:
        lda     X0102
        and     #0x05
        beq     L16FB
        lda     X0033
        bne     L16EC
        lda     X0101
        cmp     #0x4D
        bne     L16FB
        inc     X0033
        jmp     L16FB
;
L16EC:
        lda     #0x00
        sta     X0033
        lda     X0101
        cmp     #0x31
        beq     L1707
        cmp     #0x32
        beq     L170B
L16FB:
        jsr     L1939
        lda     X004F
        bne     L16D5
        lda     #0x00
L1704:
        sta     X0032
        rts
;
L1707:
        lda     #0x01
        bne     L1704
L170B:
        lda     #0x02
        bne     L1704
L170F:
        pha
        lda     #0x02
        sta     X004F
        lda     #0x04
        sta     X0030
        pla
L1719:
        pha
        jsr     L1939
        lda     #0x53
        jsr     L172B
        pla
        jsr     L172B
        dec     X0030
        bne     L1719
        rts
;
L172B:
        pha
L172C:
        jsr     L1939
        lda     X004F
        beq     L173A
        lda     X0102
        and     #0x02
        beq     L172C
L173A:
        pla
        sta     X0101
        rts
;
L173F:
        lda     #0x80
        jsr     L158C
        jsr     L158C
L1747:
        lda     transport_control_reg_a             ; Wait for Transport Byte
        asl     a
        bcc     L1747
        lda     transport_periph$ddr_reg_a          ; Read Transport Byte
        and     #0x7F
        cmp     #0x24                               ; 0x24 code
        bne     L1747
L1756:
        lda     transport_control_reg_a             ; Wait for Transport Byte
        asl     a
        bcc     L1756
        lda     transport_periph$ddr_reg_a          ; Read Transport Byte
        and     #0x7F
        cmp     #0x24                               ; 0x24 code
        beq     L1756
        and     #0x3F
        cmp     X0056
        beq     L176E
        jmp     RESET
;
L176E:
        jsr     L1699
        jsr     L189F
        lda     #0x41
        sta     board_5_periph$ddr_reg_b
L1778:
        lda     transport_control_reg_a             ; Wait for Transport Byte
        asl     a
        bcc     L178F
        lda     transport_periph$ddr_reg_a          ; Read Transport Byte
        and     #0x7F
        sta     X0065                               ; First byte into 0065
        cmp     #0x22
        bcc     L1778                               ; ignore if < 0x22
        cmp     #0x40
        bcs     L1792                               ; jump if >= 0x40
        sta     X0064                               ; put it here if it's >= 0x22 and < 0x40
L178F:
        jmp     L181A
;
L1792:
        lda     X0064                               ; read the last command byte
        and     #0x7E
        sec
        sbc     #0x22
        tax
        lda     X1D93,x
        sta     X006C
        lda     X1D93+1,x
        sta     X006D
        jsr     L17AA
        jmp     L1778
L17AA:
        jmp     [X006C]                              ;INFO: indirect jump
;
;       Decode command byte in 0064 and channel byte in 0065
;       to a command offset in 0066 and bit mask in 0068, return with carry clear
;
L17AD:
        lda     X0064                               ; read the last command byte?
L17AF:
        sec
        sbc     #0x26
        lsr     a
        tay
        lda     X1DB2,y
        sta     X0066                               ; table value goes here
        tya
        asl     a
        asl     a
        asl     a
        tay                                         ; times 8
        lda     #0x01
        sta     X0068                               ; set bit 0 here
        lda     X0065                               ; get current byte
L17C4:
        cmp     X1E04,y
        beq     L17D0
        iny
        asl     X0068                               ; now X0068 has the right bit
        bcc     L17C4
        clc                                         ; code not found, return
        rts
;
L17D0:
        ldy     #0x00
        lda     X0064
        lsr     a                                   ; get bottom bit on/off into carry
        lda     X0068                               ; get bitmask
        bcs     L17E1                               ; if on, jump ahead
        eor     #0xFF
        and     [X0066],y
L17DD:
        sta     [X0066],y                           ; set bit in 0066
        sec                                         ; code found
        rts
;
L17E1:
        ora     [X0066],y
        jmp     L17DD
;
;       Act like call to L17AD, but if code not found, act like a you got a 0028
;
L17E6:
        jsr     L17AD
        bcc     L17EC
        rts
;
L17EC:
        lda     #0x28
        jmp     L17AF
;
L17F1:
        lda     X0065
        cmp     #0x40
        bcc     L180D
        cmp     #0x60
        bcs     L180D
        sec
        sbc     #0x40
        asl     a
        tay
        lda     X1DC2,y
        sta     X0066
        lda     X1DC2+1,y
        sta     X0068
        jmp     L17D0
L180D:
        rts
;
;       Act like call to L17AD, but if code not found, act like a you got a 0030
;
L180E:
        jsr     L17AD
        bcs     L1818
        lda     #0x30
        jsr     L17AF
L1818:
        rts
;
L1819:
        rts
;
L181A:
        lda     U18_edge_detect_control_DI_pos
        bmi     L1822
        jmp     L1778
;
L1822:
        jsr     L1600
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcc     L182F
        lda     #0x06
        sta     X004B
L182F:
        lda     X004B
        beq     L183A
        lda     U18_PORTA
        and     #0x40
        bne     L1848
L183A:
        jsr     L1699
        jsr     L18FC
        jsr     L18B5
        lda     #0x00
        sta     X0063
        rts
;
L1848:
        lda     X006A
        tax
        and     #0x04
        beq     L185F
        lda     X004C
        cmp     #0x2B
        bcs     L186A
        cmp     #0x00
        beq     L1863
        txa
        and     #0xFB
        jmp     L1868
;
L185F:
        lda     #0x64
        sta     X004F
L1863:
        lda     #0x3C
        sta     X004C
        txa
L1868:
        sta     board_6_periph$ddr_reg_a
L186A:
        lda     X006A
        and     #0x04
        beq     L187A
        lda     X004F
        bne     L187A
        lda     X006A
        and     #0xFB
        sta     X006A
L187A:
        lda     X0069
        and     #0x3E
        sta     X0068
        bne     L1886
L1882:
        lda     #0x0C
        sta     X0050
L1886:
        lda     X0050
        cmp     #0x07
        bcs     L1894
        cmp     #0x00
        beq     L1882
        lda     #0x00
        sta     X0068
L1894:
        lda     board_5_periph$ddr_reg_b
        and     #0xC1
        ora     X0068
        sta     board_5_periph$ddr_reg_b
        jmp     L1778
;
L189F:
        lda     #0x34
        pha
        lda     #0x40
        ldy     #0x34
        ldx     #0x3C
        bne     L18BE
L18AA:
        lda     #0x34
        pha
        lda     #0x00
        ldy     #0x3C
        ldx     #0x34
        bne     L18BE
L18B5:
        lda     #0x3C
        pha
        lda     #0x00
        ldy     #0x3C
        ldx     #0x3C
L18BE:
        stx     audio_control_reg_a
        sty     audio_control_reg_b
        ldx     #0x00
        jsr     L18D0
        pla
        ldx     #0x01
        jsr     L18D0
        rts
;
L18D0:
        sta     board_1_periph$ddr_reg_b,x
        inx
        inx
        inx
        inx
        cpx     #0x17
        bcc     L18D0
        rts
;
;       Act like call to L17AD, but if code not found, act like a you got a 002C
;
L18DB:
        jsr     L17AD
        bcc     L18E1
        rts
;
L18E1:
        lda     #0x2C
        jmp     L17AF
;
;       Act like call to L17AD, but if code not found, act like a you got a 002E
;
L18E6:
        jsr     L17AD
        bcc     L18EC
        rts
;
L18EC:
        lda     #0x2E
        jmp     L17AF
;
;       Act like call to L17AD, but if code not found, act like a you got a 0040
;
L18F1:
        jsr     L17AD
        bcc     L18F7
        rts
;
L18F7:
        lda     #0x40
        jmp     L17AF
;
L18FC:
        lda     #0xFA
        sta     X003E
        lda     #0xE6
        sta     X003F
        lda     #0xD2
        sta     X0040
        lda     #0xBE
        sta     X0041
        lda     #0xAA
        sta     X0042

        ;       Init Table addresses

        lda     #0x2F                   ; X1A2F - board 1 related?
        sta     X0038
        lda     #0x1A
        sta     X0039

        lda     #0x01                   ; X1B01 - board 2 related?
        sta     X0034
        lda     #0x1B
        sta     X0035

        lda     #0xB9                   ; X1BB9 - board 5 related?
        sta     X0036
        lda     #0x1B
        sta     X0037

        lda     #0x4B                   ; X1C4B - board 4 related?
        sta     X003A
        lda     #0x1C
        sta     X003B

        lda     #0x05                   ; X1D05 - board 3 related?
        sta     X003C
        lda     #0x1D
        sta     X003D
        rts
;
L1939:
        jsr     L1949
        jsr     L1977
        jsr     L19A5
        jsr     L19D3
        jsr     L1A01
        rts
;
L1949:
        ldy     #0x00
        lda     [X0038],y
        cmp     #0xFF
        beq     L1968
        cmp     X003E
        bne     L1967
        iny
        lda     [X0038],y
        sta     board_1_periph$ddr_reg_a
        clc
        lda     X0038
        adc     #0x02
        sta     X0038
        lda     X0039
        adc     #0x00
        sta     X0039
L1967:
        rts
;
L1968:
        lda     #0x2F
        sta     X0038
        lda     #0x1A
        sta     X0039
        lda     #0xFA
        sta     X003E
        jmp     L1967
;
L1977:
        ldy     #0x00
        lda     [X0034],y
        cmp     #0xFF
        beq     L1996
        cmp     X003F
        bne     L1995
        iny
        lda     [X0034],y
        sta     board_2_periph$ddr_reg_a
        clc
        lda     X0034
        adc     #0x02
        sta     X0034
        lda     X0035
        adc     #0x00
        sta     X0035
L1995:
        rts
;
L1996:
        lda     #0x01
        sta     X0034
        lda     #0x1B
        sta     X0035
        lda     #0xE6
        sta     X003F
        jmp     L1995
;
L19A5:
        ldy     #0x00
        lda     [X0036],y
        cmp     #0xFF
        beq     L19C4
        cmp     X0040
        bne     L19C3
        iny
        lda     [X0036],y
        sta     board_5_periph$ddr_reg_a
        clc
        lda     X0036
        adc     #0x02
        sta     X0036
        lda     X0037
        adc     #0x00
        sta     X0037
L19C3:
        rts
;
L19C4:
        lda     #0xB9
        sta     X0036
        lda     #0x1B
        sta     X0037
        lda     #0xD2
        sta     X0040
        jmp     L19C3
;
L19D3:
        ldy     #0x00
        lda     [X003A],y
        cmp     #0xFF
        beq     L19F2
        cmp     X0041
        bne     L19F1
        iny
        lda     [X003A],y
        sta     board_4_periph$ddr_reg_a
        clc
        lda     X003A
        adc     #0x02
        sta     X003A
        lda     X003B
        adc     #0x00
        sta     X003B
L19F1:
        rts
;
L19F2:
        lda     #0x4B
        sta     X003A
        lda     #0x1C
        sta     X003B
        lda     #0xBE
        sta     X0041
        jmp     L19F1
;
L1A01:
        ldy     #0x00
        lda     [X003C],y
L1A05:
        cmp     #0xFF
        beq     L1A20
        cmp     X0042
        bne     L1A1F
        iny
        lda     [X003C],y
        sta     board_3_periph$ddr_reg_a
        clc
        lda     X003C
        adc     #0x02
        sta     X003C
        lda     X003D
        adc     #0x00
        sta     X003D
L1A1F:
        rts
;
L1A20:
        lda     #0x05
        sta     X003C
        lda     #0x1D
        sta     X003D
        lda     #0xAA
        sta     X0042
        jmp     L1A1F
;
;
;
X1A2F:
        .db     0xFA, 0x20
        .db     0xFA, 0x20
        .db     0xF6, 0x22
        .db     0xF5, 0x20
        .db     0xF5, 0x20
        .db     0xF3, 0x22
        .db     0xF2, 0x20
        .db     0xE5, 0x22
        .db     0xE5, 0x22
        .db     0xE2, 0x20
        .db     0xD2, 0x20
        .db     0xBE, 0x00
        .db     0xBC, 0x22
        .db     0xBB, 0x30
        .db     0xB9, 0x32
        .db     0xB9, 0x32
        .db     0xB7, 0x30
        .db     0xB6, 0x32
        .db     0xB5, 0x30
        .db     0xB4, 0x32
        .db     0xB4, 0x32
        .db     0xB3, 0x20
        .db     0xB3, 0x20
        .db     0xB1, 0xA0
        .db     0xB1, 0xA0
        .db     0xB0, 0xA2
        .db     0xAF, 0xA0
        .db     0xAF, 0xA6
        .db     0xAE, 0xA0
        .db     0xAE, 0xA6
        .db     0xAD, 0xA4
        .db     0xAC, 0xA0
        .db     0xAC, 0xA0
        .db     0xAB, 0xA0
        .db     0xAA, 0xA0
        .db     0xAA, 0xA0
        .db     0xA2, 0x80
        .db     0xA0, 0xA0
        .db     0xA0, 0xA0
        .db     0x8D, 0x80
        .db     0x8A, 0xA0
        .db     0x7E, 0x80
        .db     0x7B, 0xA0
        .db     0x79, 0xA4
        .db     0x78, 0xA0
        .db     0x77, 0xA4
        .db     0x76, 0xA0
        .db     0x75, 0xA4
        .db     0x74, 0xA0
        .db     0x73, 0xA4
        .db     0x72, 0xA0
        .db     0x71, 0xA4
        .db     0x70, 0xA0
        .db     0x6F, 0xA4
        .db     0x6E, 0xA0
        .db     0x6D, 0xA4
        .db     0x6C, 0xA0
        .db     0x69, 0x80
        .db     0x69, 0x80
        .db     0x67, 0xA0
        .db     0x5E, 0x20
        .db     0x58, 0x24
        .db     0x57, 0x20
        .db     0x57, 0x20
        .db     0x56, 0x24
        .db     0x55, 0x20
        .db     0x54, 0x24
        .db     0x54, 0x24
        .db     0x53, 0x20
        .db     0x52, 0x24
        .db     0x52, 0x24
        .db     0x50, 0x20
        .db     0x4F, 0x24
        .db     0x4E, 0x20
        .db     0x4D, 0x24
        .db     0x4C, 0x20
        .db     0x4C, 0x20
        .db     0x4B, 0x24
        .db     0x4A, 0x20
        .db     0x49, 0x20
        .db     0x49, 0x00
        .db     0x48, 0x20
        .db     0x47, 0x20
        .db     0x47, 0x20
        .db     0x46, 0x20
        .db     0x45, 0x24
        .db     0x45, 0x24
        .db     0x44, 0x20
        .db     0x42, 0x20
        .db     0x42, 0x20
        .db     0x37, 0x04
        .db     0x35, 0x20
        .db     0x2E, 0x04
        .db     0x2E, 0x04
        .db     0x2D, 0x20
        .db     0x23, 0x24
        .db     0x21, 0x20
        .db     0x17, 0x24
        .db     0x13, 0x00
        .db     0x11, 0x24
        .db     0x10, 0x30
        .db     0x07, 0x34
        .db     0x06, 0x30
        .db     0x05, 0x30
        .db     0xFF, 0xFF
;
X1B01:
        .db     0xD7, 0x22
        .db     0xD5, 0x20
        .db     0xC9, 0x22
        .db     0xC7, 0x20
        .db     0xC4, 0x24
        .db     0xC3, 0x20
        .db     0xC2, 0x24
        .db     0xC1, 0x20
        .db     0xBF, 0x24
        .db     0xBF, 0x24
        .db     0xBE, 0x20
        .db     0xBD, 0x24
        .db     0xBC, 0x20
        .db     0xBB, 0x24
        .db     0xBA, 0x20
        .db     0xB9, 0x20
        .db     0xB8, 0x24
        .db     0xB7, 0x20
        .db     0xB4, 0x00
        .db     0xB4, 0x00
        .db     0xB2, 0x20
        .db     0xA9, 0x20
        .db     0xA3, 0x20
        .db     0xA2, 0x20
        .db     0xA1, 0x20
        .db     0xA0, 0x20
        .db     0xA0, 0x20
        .db     0x9F, 0x20
        .db     0x9F, 0x20
        .db     0x9E, 0x20
        .db     0x9D, 0x24
        .db     0x9D, 0x24
        .db     0x9B, 0x20
        .db     0x9A, 0x24
        .db     0x99, 0x20
        .db     0x98, 0x20
        .db     0x97, 0x24
        .db     0x97, 0x24
        .db     0x95, 0x20
        .db     0x95, 0x20
        .db     0x94, 0x00
        .db     0x94, 0x00
        .db     0x93, 0x20
        .db     0x92, 0x00
        .db     0x92, 0x00
        .db     0x91, 0x20
        .db     0x90, 0x20
        .db     0x90, 0x20
        .db     0x8F, 0x20
        .db     0x8D, 0x20
        .db     0x8D, 0x20
        .db     0x81, 0x00
        .db     0x7F, 0x20
        .db     0x79, 0x00
        .db     0x79, 0x00
        .db     0x78, 0x20
        .db     0x76, 0x20
        .db     0x6B, 0x00
        .db     0x69, 0x20
        .db     0x5E, 0x00
        .db     0x5C, 0x20
        .db     0x5B, 0x30
        .db     0x52, 0x10
        .db     0x51, 0x30
        .db     0x50, 0x30
        .db     0x50, 0x30
        .db     0x4F, 0x20
        .db     0x4E, 0x20
        .db     0x4E, 0x20
        .db     0x4D, 0x20
        .db     0x46, 0xA0
        .db     0x45, 0xA0
        .db     0x3D, 0xA0
        .db     0x3D, 0xA0
        .db     0x39, 0x20
        .db     0x2A, 0x00
        .db     0x28, 0x20
        .db     0x1E, 0x00
        .db     0x1C, 0x22
        .db     0x1C, 0x22
        .db     0x1B, 0x20
        .db     0x1A, 0x22
        .db     0x19, 0x20
        .db     0x18, 0x22
        .db     0x18, 0x22
        .db     0x16, 0x20
        .db     0x15, 0x22
        .db     0x15, 0x22
        .db     0x14, 0xA0
        .db     0x13, 0xA2
        .db     0x11, 0xA0
        .db     0xFF, 0xFF
;
X1BB9:
        .db     0xCD, 0x20
        .db     0xCC, 0x20
        .db     0xCB, 0x20
        .db     0xCB, 0x20
        .db     0xCA, 0x00
        .db     0xC9, 0x20
        .db     0xC9, 0x20
        .db     0xC8, 0x20
        .db     0xC1, 0xA0
        .db     0xC0, 0xA0
        .db     0xB8, 0xA0
        .db     0xB8, 0x20
        .db     0xB4, 0x20
        .db     0xA6, 0x00
        .db     0xA4, 0x20
        .db     0x99, 0x00
        .db     0x97, 0x22
        .db     0x97, 0x22
        .db     0x96, 0x20
        .db     0x95, 0x22
        .db     0x94, 0x20
        .db     0x93, 0x22
        .db     0x93, 0x22
        .db     0x91, 0x20
        .db     0x90, 0x20
        .db     0x90, 0x20
        .db     0x8D, 0xA0
        .db     0x8C, 0xA0
        .db     0x7D, 0xA2
        .db     0x7D, 0xA2
        .db     0x7B, 0xA0
        .db     0x7B, 0xA0
        .db     0x79, 0xA2
        .db     0x79, 0xA2
        .db     0x77, 0xA0
        .db     0x77, 0xA0
        .db     0x76, 0x80
        .db     0x75, 0xA0
        .db     0x6E, 0x20
        .db     0x67, 0x24
        .db     0x66, 0x20
        .db     0x65, 0x24
        .db     0x64, 0x20
        .db     0x63, 0x24
        .db     0x63, 0x24
        .db     0x61, 0x20
        .db     0x60, 0x24
        .db     0x5F, 0x20
        .db     0x5E, 0x20
        .db     0x5D, 0x24
        .db     0x5C, 0x20
        .db     0x5B, 0x24
        .db     0x5A, 0x20
        .db     0x59, 0x24
        .db     0x58, 0x20
        .db     0x56, 0x20
        .db     0x55, 0x04
        .db     0x54, 0x00
        .db     0x53, 0x24
        .db     0x52, 0x20
        .db     0x52, 0x20
        .db     0x4F, 0x24
        .db     0x4F, 0x24
        .db     0x4E, 0x30
        .db     0x4D, 0x30
        .db     0x47, 0x10
        .db     0x45, 0x30
        .db     0x35, 0x30
        .db     0x33, 0x10
        .db     0x31, 0x30
        .db     0x31, 0x30
        .db     0x1D, 0x20
        .db     0xFF, 0xFF
;
X1C4B:
        .db     0xBE, 0x00
        .db     0xBC, 0x22
        .db     0xBB, 0x30
        .db     0xB9, 0x32
        .db     0xB7, 0x30
        .db     0xB6, 0x32
        .db     0xB5, 0x30
        .db     0xB4, 0x32
        .db     0xB4, 0x32
        .db     0xB3, 0x20
        .db     0xB3, 0x20
        .db     0xB1, 0xA0
        .db     0xB1, 0xA0
        .db     0xB0, 0xA2
        .db     0xAF, 0xA0
        .db     0xAF, 0xA6
        .db     0xAE, 0xA0
        .db     0xAE, 0xA6
        .db     0xAD, 0xA4
        .db     0xAC, 0xA0
        .db     0xAC, 0xA0
        .db     0xAB, 0xA0
        .db     0xAA, 0xA0
        .db     0xAA, 0xA0
        .db     0xA2, 0x80
        .db     0xA0, 0xA0
        .db     0xA0, 0xA0
        .db     0x8D, 0x80
        .db     0x8A, 0xA0
        .db     0x7E, 0x80
        .db     0x7B, 0xA0
        .db     0x79, 0xA4
        .db     0x78, 0xA0
        .db     0x77, 0xA4
        .db     0x76, 0xA0
        .db     0x75, 0xA4
        .db     0x74, 0xA0
        .db     0x73, 0xA4
        .db     0x72, 0xA0
        .db     0x71, 0xA4
        .db     0x70, 0xA0
        .db     0x6F, 0xA4
        .db     0x6E, 0xA0
        .db     0x6D, 0xA4
        .db     0x6C, 0xA0
        .db     0x69, 0x80
        .db     0x69, 0x80
        .db     0x67, 0xA0
        .db     0x5E, 0x20
        .db     0x58, 0x24
        .db     0x57, 0x20
        .db     0x57, 0x20
        .db     0x56, 0x24
        .db     0x55, 0x20
        .db     0x54, 0x24
        .db     0x54, 0x24
        .db     0x53, 0x20
        .db     0x52, 0x24
        .db     0x52, 0x24
        .db     0x50, 0x20
        .db     0x4F, 0x24
        .db     0x4E, 0x20
        .db     0x4D, 0x24
        .db     0x4C, 0x20
        .db     0x4C, 0x20
        .db     0x4B, 0x24
        .db     0x4A, 0x20
        .db     0x49, 0x20
        .db     0x49, 0x00
        .db     0x48, 0x20
        .db     0x47, 0x20
        .db     0x47, 0x20
        .db     0x46, 0x20
        .db     0x45, 0x24
        .db     0x45, 0x24
        .db     0x44, 0x20
        .db     0x42, 0x20
        .db     0x42, 0x20
        .db     0x37, 0x04
        .db     0x35, 0x20
        .db     0x2E, 0x04
        .db     0x2E, 0x04
        .db     0x2D, 0x20
        .db     0x23, 0x24
        .db     0x21, 0x20
        .db     0x17, 0x24
        .db     0x13, 0x00
        .db     0x11, 0x24
        .db     0x10, 0x30
        .db     0x07, 0x34
        .db     0x06, 0x30
        .db     0x05, 0x30
        .db     0xFF, 0xFF
;
X1D05:
        .db     0xA9, 0x20
        .db     0xA3, 0x20
        .db     0xA2, 0x20
        .db     0xA1, 0x20
        .db     0xA0, 0x20
        .db     0xA0, 0x20
        .db     0x9F, 0x20
        .db     0x9F, 0x20
        .db     0x9E, 0x20
        .db     0x9D, 0x24
        .db     0x9D, 0x24
        .db     0x9B, 0x20
        .db     0x9A, 0x24
        .db     0x99, 0x20
        .db     0x98, 0x20
        .db     0x97, 0x24
        .db     0x97, 0x24
        .db     0x95, 0x20
        .db     0x95, 0x20
        .db     0x94, 0x00
        .db     0x94, 0x00
        .db     0x93, 0x20
        .db     0x92, 0x00
        .db     0x92, 0x00
        .db     0x91, 0x20
        .db     0x90, 0x20
        .db     0x90, 0x20
        .db     0x8F, 0x20
        .db     0x8D, 0x20
        .db     0x8D, 0x20
        .db     0x81, 0x00
        .db     0x7F, 0x20
        .db     0x79, 0x00
        .db     0x79, 0x00
        .db     0x78, 0x20
        .db     0x76, 0x20
        .db     0x6B, 0x00
        .db     0x69, 0x20
        .db     0x5E, 0x00
        .db     0x5C, 0x20
        .db     0x5B, 0x30
        .db     0x52, 0x10
        .db     0x51, 0x30
        .db     0x50, 0x30
        .db     0x50, 0x30
        .db     0x4F, 0x20
        .db     0x4E, 0x20
        .db     0x4E, 0x20
        .db     0x4D, 0x20
        .db     0x46, 0xA0
        .db     0x45, 0xA0
        .db     0x3D, 0xA0
        .db     0x3D, 0xA0
        .db     0x39, 0x20
        .db     0x2A, 0x00
        .db     0x28, 0x20
        .db     0x1E, 0x00
        .db     0x1C, 0x22
        .db     0x1C, 0x22
        .db     0x1B, 0x20
        .db     0x1A, 0x22
        .db     0x19, 0x20
        .db     0x18, 0x22
        .db     0x18, 0x22
        .db     0x16, 0x20
        .db     0x15, 0x22
        .db     0x15, 0x22
        .db     0x14, 0xA0
        .db     0x13, 0xA2
        .db     0x11, 0xA0
        .db     0xFF, 0xFF
;
;       Jump Table - process command bytes
;
X1D93:
        .dw     L17F1                   ; 0x22-23 ( "# card 7?) - extended codes?
        .dw     IGNORE                  ; 0x24-25
        .dw     L17AD                   ; 0x26-27 ( &' ???)
        .dw     IGNORE                  ; 0x28-29
        .dw     L180E                   ; 0x2A-2B ( *+ card 8?) - def 30
        .dw     IGNORE                  ; 0x2C-2D
        .dw     IGNORE                  ; 0x2E-2F
        .dw     IGNORE                  ; 0x30-31
        .dw     L17AD                   ; 0x32-33 ( 23 card 1?)
        .dw     L18DB                   ; 0x34-35 ( 45 card 3?) - def 2C
        .dw     L18F1                   ; 0x36-37 ( 67 card 2?) - def 40
        .dw     L1819                   ; 0x38-39 ( 89 card 6?) - do nothing?
        .dw     L17E6                   ; 0x3A-3B ( :; card 5?) - def 28
        .dw     L18E6                   ; 0x3C-3D ( <= card 4?) - def 2E
        .dw     L17AD                   ; 0x3E-3F ( >? ???)

IGNORE:
        rts
;
;       Memory address codes
;
X1DB2:
        .db     0x6A        ; 0x26 - ???
        .db     0x96        ; 0x28 - board 6B?
        .db     0x96        ; 0x2A - board 6B?
        .db     0x8A        ; 0x2C - board 3B?
        .db     0x8E        ; 0x2E - board 4B?
        .db     0x69        ; 0x30 - ???
        .db     0x80        ; 0x32 - board 1
        .db     0x88        ; 0x34 - board 3
        .db     0x84        ; 0x36 - board 2
        .db     0x00        ; 0x38
        .db     0x90        ; 0x3A - board 5
        .db     0x8C        ; 0x3C - board 4
        .db     0x82        ; 0x3E - board 1B?
        .db     0x86        ; 0x40 - board 2B?
        .db     0x00        ; 0x42
        .db     0x00        ; 0x44
;
;       Extended codes for 0x22-0x23?
;
X1DC2:
        .db     0x9C,0x01
        .db     0x98,0x02
        .db     0x9C,0x08
        .db     0x9C,0x04
        .db     0x9C,0x10
        .db     0x98,0x04
        .db     0x98,0x08
        .db     0x9A,0x20
        .db     0x9A,0x40
        .db     0x9C,0x20
        .db     0x9C,0x40
        .db     0x9C,0x80
        .db     0x9A,0x01
        .db     0x9A,0x08
        .db     0x9A,0x10
        .db     0x98,0x40
        .db     0x98,0x80
        .db     0x9A,0x02
        .db     0x9A,0x04
        .db     0x98,0x10
        .db     0x98,0x20
        .db     0x9C,0x02
        .db     0x9E,0x01
        .db     0x9E,0x08
        .db     0x9E,0x02
        .db     0x98,0x01
        .db     0x00,0x80
        .db     0x9E,0x04
        .db     0x9E,0x10
        .db     0x9E,0x20
        .db     0x9E,0x40
        .db     0x92,0x01
        .db     0x00,0x00
;
;       8 bytes per command, starting with 0x26, 0x28...
;
X1E04:
        .db     'F,'E,'H,'A,'J,'L,'I,'B, 0, 0, 0,'\,'W,'X, 0, 0     ; 0x26, 0x28
        .db     'A,'F,'C, 0, 0, 0, 0, 0,'G,'B,'E,'F,'J,'K, 0, 0     ; 0x2A, 0x2C
        .db     'G,'B,'C,'E,'F,'J, 0, 0, 0,'J,'I,'M,'K,'L, 0, 0     ; 0x2E, 0x30
        .db     'A,'U,'C,'P,'I,'N,'T,'V,'A,'D,'C,'V,'I,'N,'H,'T     ; 0x32, 0x34
        .db     'A,'H,'G,'P,'I,'N,'T,'V, 0, 0, 0, 0, 0, 0, 0, 0     ; 0x36, 0x38
        .db     'A,'D,'C,'P,'F,'N,'K,'L,'A,'H,'L,'D,'I,'N,'T,'V     ; 0x3A, 0x3C
        .db     'A,'D,'C,'P,'I,'B, 0, 0,'B,'C,'D,'E,'F,'J, 0, 0     ; 0x3E, 0x40
;
;       Gap filled with 0xff here
;       
        .org    0x1ffc

RESETVEC:   .dw     RESET
IRQVEC:     .dw     IRQ

