
        .area   region1 (ABS)

        .include "../../include/ptt6502.def"

        .org    0x1000
        
        .byte   0xff                    ; Need this, or .s19 file wont start here

        .org    0x1A00

RESET:
        cld
        sei
        ldx     #0xF0
        txs
        lda     #0x00
        ldx     #0x10

ZERORAM:
        sta     RAM_start,x
        inx
        cpx     #0x80
        bne     ZERORAM
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
        sta     0x54
        lda     #0x18
        sta     0x57
        lda     #0x64
        sta     0x56
        lda     #0x0A
        sta     0x64
        lda     #TAPEMODE_STOP
        jsr     TAPECMD
        lda     #0x28
        sta     0x55
        lda     #0x64
        sta     0x54
$1:
        jsr     TUPDATE
        lda     0x55
        bne     $1
        jsr     INITBRDS
REWIND:
        lda     #0xFA
        sta     0x66
        lda     #0x00
        sta     0x67
        sta     0x68
        lda     #0x30
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD


L1A87:
        lda     #0x00
        sta     0x59


L1A8B:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x59
        lda     0x59
        cmp     #0x64
        bcs     FINDTRK


L1A9A:
        jsr     TUPDATE
        jsr     L1DAB
        lda     0x50
        beq     L1A87
        lda     transport_control_reg_b
        bpl     L1A9A
        jmp     L1A8B


FINDTRK:
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD
        lda     #0x19
        sta     0x55
        lda     #0x64
        sta     0x54


L1AB9:
        jsr     TUPDATE
        jsr     L1DAB
        lda     0x55
        bne     L1AB9
        lda     #0x00
        sta     0x5A
        jsr     WAITTONE
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD
        jsr     WAITTONE
        lda     #0xFA
        sta     0x50


L1AD6:
        jsr     TUPDATE
        jsr     L1DAB
        lda     0x50
        bne     L1AD6
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD
        jsr     WAITTONE
        inc     0x5A
        lda     #TAPEMODE_STOP
        jsr     TAPECMD
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD
        jsr     WAITCD
        lda     #TAPEMODE_STOP
        jsr     TAPECMD
        jsr     INITBRDS


WAITPLAY:
        jsr     TUPDATE
        jsr     AGCUPD
        jsr     L1DAB
        lda     0x5B
        bne     STARTPLAY
        lda     #0x02
        sta     U19_PORTA
        lda     #0x00
        sta     U18_PORTB
        lda     0x57
        bne     WAITPLAY
        inc     0x5B


STARTPLAY:
        jsr     INITBRDS
        lda     #0x00
        sta     U19_PORTA
        lda     #0x80
        sta     U18_PORTB
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD
        jsr     WAITCD
        dec     0x5B
        jsr     PLAYTRK
        jsr     INITBRDS
        lda     #0x18
        sta     0x57
        lda     #0x64
        sta     0x56
        inc     0x5A
        lda     0x5A
        cmp     #0x1A
        bcc     NEXTTRK
        jmp     REWIND


NEXTTRK:
        lda     #0x00
        sta     0x67
        sta     0x68
        lda     #0xFA
        sta     0x66
        jsr     WAITCD
        lda     #TAPEMODE_STOP
        jsr     TAPECMD
        jsr     AGCMICRD
        jmp     WAITPLAY
;
;       Init boards
;
INITBRDS:
        lda     #0x3C
        sta     audio_control_reg_b
        lda     #0x34
        sta     audio_control_reg_a
        ldx     #0x00
NEXTBRD:
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
        bcc     NEXTBRD

        lda     #0x00
        sta     0x5F
        sta     0x65
        rts


TAPECMD:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     0x50


L1B9E:
        jsr     TUPDATE
        jsr     L1DAB
        lda     0x50
        bne     L1B9E
        lda     transport_periph$ddr_reg_b
        and     #0x60
        bne     L1BB4
        lda     #0x00
        sta     transport_periph$ddr_reg_b


L1BB4:
        rts


WAITTONE:
        lda     #0x00
        sta     0x59
L1BB9:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     0x50
        inc     0x59
        lda     0x59
        cmp     #0x21
        bcs     L1BDA
L1BC8:
        jsr     TUPDATE
        jsr     L1DAB
        lda     0x50
        beq     WAITTONE
        lda     transport_control_reg_b
        bpl     L1BC8
        jmp     L1BB9
L1BDA:
        rts


WAITCD:
        lda     #0xFA
        sta     0x50
L1BDF:
        jsr     TUPDATE
        jsr     L1DAB
        lda     0x50
        bne     L1BDF


L1BE9:
        jsr     TUPDATE
        jsr     L1DAB
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1BE9
        lda     #0xA0
        sta     0x50
L1BF9:
        jsr     TUPDATE
        jsr     L1DAB
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1BE9
        lda     0x50
        bne     L1BF9
        rts


PLAYTRK:
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
L1C25:
        lda     transport_periph$ddr_reg_b
        lsr
        bcc     LOSTCD
        jsr     AGCUPD
        jsr     TUPDATE
        lda     transport_control_reg_a
        bpl     L1C25
        jsr     PROTOHAND
        jmp     L1C25


LOSTCD:
        lda     #0x64
        sta     0x50
L1C40:
        jsr     TUPDATE
        lda     transport_periph$ddr_reg_b
        lsr
        bcs     PLAYTRK
        lda     0x50
        bne     L1C40
        rts
;
; Protocol handler
;
PROTOHAND:
        lda     transport_periph$ddr_reg_a
PROCBYTE:
        and     #0x7F
        sta     0x5D
        and     #0x7E
        cmp     #0x22
        beq     PROCCHNL
        cmp     #0x32
        bcc     $18
        cmp     #0x3A
        bcc     PROCCHNL
        lda     0x5D
        cmp     #0x41
        bcc     $18
        cmp     #0x4F                           ; is it >= 0x4F?
        bcs     $18
        ldx     0x65
        sec                                     ; (it's 0x41 to 0x4E)
        sbc     #0x41
        cmp     #0x08
        bcc     $16
        inx
        inx
$16:
        and     #0x07
        tay
        lda     MASKTBL,y
        sta     0x5E
        lda     0x5F
        lsr
        bcs     $17
        lda     0x5E
        eor     #0xFF
        and     0x00,x
        sta     0x00,x
        rts
;
$17:
        lda     0x5E
        ora     0x00,x
        sta     0x00,x
        rts
;
PROCCHNL:
        lda     0x5D
        sta     0x5F
        and     #0x7E
        cmp     #0x22
        bne     CONVCHNL
        lda     #0x98
        sta     0x65
        rts
;
CONVCHNL:
        sec
        sbc     #0x32
        asl
        clc
        adc     #0x80
        sta     0x65
        rts
$18:
        rts
;
; bit mask table
;
MASKTBL:
        .db     0x01,0x02,0x04,0x08
        .db     0x10,0x20,0x40,0x80
;
;       Housekeeping routine
;
;
TUPDATE:
        lda     U18_edge_detect_control_DI_pos
        sta     0x60
        beq     TEXIT
        lda     0x5C
        bmi     $20_A
        lda     0x60
        and     #0x40
        beq     $20_B
        lda     #0x80
        sta     0x5C
        lda     #0xFA
        sta     0x51
$20_A:
        lda     0x51
        bne     $20
        lda     #0x00
        sta     0x5C
        lda     0x5B
        bne     $20
        inc     0x5B
$20:
        lda     0x60
        bpl     TEXIT
; Adjust Timer routine
$20_B:
        lda     U18_timer
        eor     #0xFF
        lsr
        lsr
        lsr
        sta     0x58
        bcc     $21
        inc     0x58


$21:
        lda     #0x7A
        sec
        sbc     0x58
        sta     U18_timer_8T_DI
        dec     0x50
        dec     0x51
        dec     0x53
        dec     0x54
        bne     TEXIT
        lda     #0x64
        sta     0x54
        dec     0x55
        dec     0x66
        bne     $21_A
        lda     #0xFA
        sta     0x66
$21_A:
        dec     0x56
        bne     TEXIT
        lda     #0x64
        sta     0x56
        dec     0x57
TEXIT:
        rts
;
;       Read the AGC mic level
;       Take the average of 8 samples
;
AGCMICRD:
        lda     #0x00
        sta     0x62
        sta     0x63
        lda     #0x0A
        sta     0x55
        lda     #0x64
        sta     0x54
$23:
        jsr     TUPDATE
        jsr     L1DAB
        lda     0x55
        bne     $23
        lda     #0x0A
        sta     0x55
        lda     #0x64
        sta     0x54
        lda     0x63
        cmp     #0x08
        beq     $27
        inc     0x63
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a
$24:
        rol
        dex
        bcc     $24
        clc
        txa
        adc     0x62
        sta     0x62
        jmp     $23
;
$27:
        lsr     0x62
        lsr     0x62
        lsr     0x62
        lda     0x62
        sta     0x61
        lda     #0x00
        sta     0x62
        sta     0x63
        rts
;
;        Do AGC Mic Logic
;
AGCUPD:
        lda     U19_PORTA
        eor     #0xFF
        lsr
        lsr
        lsr
        lsr
        clc
        adc     0x61
        tax
        lda     AGCTABLE,x
        sta     0x64
        lda     0x53
        bne     $26
        lda     #0x0A
        sta     0x53
        lda     0x64
        cmp     audio_periph$ddr_reg_b
        bcc     $25
        beq     $26
        inc     audio_periph$ddr_reg_b
        jmp     $26
;
$25:
        dec     audio_periph$ddr_reg_b
$26:
        lda     audio_periph$ddr_reg_b
        sta     U19_PORTB
        rts
;
;       AGC table
;
AGCTABLE:
        .db     0x03, 0x04, 0x06, 0x08
        .db     0x10, 0x16, 0x20, 0x2D
        .db     0x40, 0x5A, 0x80, 0xBF
        .db     0xFF, 0xFF, 0xFF, 0xFF
        .db     0xFF

L1DAB:
        lda     0x67
        tax
        lda     0x68
        bne     L1DE5
        lda     X1E0F,x
        cmp     #0xFE
        beq     L1DDC
        cmp     #0xFF
        bne     L1DC4
        lda     #0x00
        sta     0x67
        jmp     L1DDB


L1DC4:
        cmp     0x66
        bne     L1DDB
        lda     X1E10,x
        jsr     PROCBYTE
        lda     X1E11,x
        jsr     PROCBYTE
        lda     0x67
        clc
        adc     #0x03
        sta     0x67


L1DDB:
        rts


L1DDC:
        inc     0x68
        lda     #0x00
        sta     0x67
        jmp     L1DDB


L1DE5:
        lda     X1EF3,x
        cmp     #0xFF
        bne     L1DF5
        lda     #0x00
        sta     0x67
        sta     0x68
        jmp     L1DDB


L1DF5:
        cmp     0x66
        bne     L1DDB
        lda     X1EF4,x
        jsr     PROCBYTE
        lda     X1EF5,x
        jsr     PROCBYTE
        lda     0x67
        clc
        adc     #0x03
        sta     0x67
        jmp     L1DDB
;
;       Table of pairs of bytes to process
;
X1E0F:
        .byte   0xEE

X1E10:
        .byte   0x35

X1E11:
        .byte   0x46,0xEB,0x35,0x49,0xE9,0x35,0x4A,0xE9,0x33,0x42,0xE8,0x33,0x46,0xE7,0x32,0x46
        .byte   0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3,0x32,0x46,0xE2,0x33,0x46,0xE1
        .byte   0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33,0x46,0xDD,0x32,0x46,0xDD,0x34
        .byte   0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46,0xDA,0x33,0x46,0xD9,0x32,0x46
        .byte   0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5,0x32,0x47,0xC3,0x34,0x46,0xC2
        .byte   0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34,0x46,0xB9,0x32,0x43,0xB7,0x35
        .byte   0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46,0xA8,0x32,0x42,0x9D,0x33,0x47
        .byte   0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A,0x34,0x46,0x99,0x33,0x47,0x99
        .byte   0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33,0x47,0x94,0x32,0x47,0x93,0x33
        .byte   0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47,0x87,0x33,0x42,0x86,0x32,0x43
        .byte   0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77,0x34,0x46,0x75,0x32,0x43,0x75
        .byte   0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33,0x46,0x66,0x32,0x46,0x66,0x32
        .byte   0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42,0x56,0x33,0x46,0x55,0x32,0x46
        .byte   0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52,0x33,0x46,0x51,0x32,0x46,0xFE
        .byte   0xFE,0xFE

X1EF3:
        .byte   0x50

X1EF4:
        .byte   0x33

X1EF5:
        .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        .byte   0xFF,0xFF,0xFF,0xFF,0xFF

        .org    0x1FFA
        ;
        ; vectors
        ;
NMIVEC:
        .dw     0xFFFF
RESETVEC:
        .dw     RESET
IRQVEC:
        .dw     0xFFFF
