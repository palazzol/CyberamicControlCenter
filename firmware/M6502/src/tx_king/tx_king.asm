
        .area   region1 (ABS)

TIMER_1MS_A     = 0x0050    ; decremented every 1ms
TIMER_1MS_B     = 0x0051    ; decremented every 1ms

TIMER_1MS_C     = 0x0053    ; decremented every 1ms
TIMER_1MS_R     = 0x0054    ; decremented every 1ms, resets to 100
TIMER_100MS_A   = 0X0055    ; decremented every 0.1s
TIMER_100MS_R   = 0x0056    ; decremented every 0.1s, resets to 100
TIMER_10S       = 0x0057    ; decremented every 10s
TIMER_TMP1      = 0x0058    ; temp timer storage
ZEROCROSS_CTR   = 0x0059    ; zero crossing counter
TRACK_CTR       = 0x005A    ; track counter
PROG_CTR        = 0x005B    ; number of PROG button presses
PROG_STATE      = 0x005C    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
TAPE_BYTE       = 0x005D    ; storage for incoming serial byte (& 0x7F)
SOL_MASK        = 0x005E    ; bitmask for solenoids
CURR_CHANNEL    = 0x005F    ; current channel serial byte
TIMER_TMP       = 0x0060    ; temp timer storage
AGC_LEVEL       = 0x0061    ; agc mic level
AGC_ACCUM       = 0x0062    ; agc mic level accumulator
AGC_SAMPLES     = 0x0063    ; agc mic sample counter
AGC_GAIN        = 0x0064    ; agc calculated gain value
CURR_PORT       = 0x0065    ; current channel port address
TIMER_100MS_R25 = 0x0066    ; decremented every 0.1s, resets to 250
RAM_67          = 0x0067    ; TBD?
RAM_68          = 0x0068    ; TBD?

        .include "../../include/ptt6502.def"

        .org    0x1000
        
        .byte   0xff                    ; Need this, or .s19 file wont start here

        .org    0x1A00

RESET:
        cld                                             ; No decimal mode
        sei                                             ; Interrupts are not used
        ldx     #0xF0                                   ; Stack is at 0x01F0
        txs
        lda     #0x00                                   ; Clear RAM
        ldx     #0x10                                   ; from 0x0010 to 0x007F
ZERORAM:
        sta     RAM_start,x
        inx
        cpx     #0x80
        bne     ZERORAM
        lda     #0x00                                   ; Initialize these registers to 0x00
        sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
        sta     transport_periph$ddr_reg_a              ; UART data inputs
        sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
        sta     audio_periph$ddr_reg_a                  ; Comparator inputs
        sta     audio_control_reg_b                     ; Clear audio control B
        sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
        sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
        sta     U18_DDRA                                ; Buttons are inputs
        lda     #0x02
        sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
        lda     #0xFF
        sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
        sta     U18_DDRB                                ; Button lights are outputs
        sta     U19_DDRB                                ; CPU card lights are outputs
        lda     #0xFC
        sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
        lda     #0x2E
        sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
        sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
        lda     #0x3C
        sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
        sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
        lda     #0x64
        sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
        lda     #0x18
        sta     TIMER_10S                               ; Init a 4 minute timer
        lda     #0x64
        sta     TIMER_100MS_R                           ; 100 - init 0.1 sec master counter
        lda     #0x0a                                   ; 10
        sta     AGC_GAIN                                ; Set initial AGC gain value
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #0x28                                   ; this will count 4 seconds
        sta     TIMER_100MS_A
        lda     #0x64                                   ; reset master timer
        sta     TIMER_1MS_R
$1:
        jsr     TUPDATE                                 ; do not much for 4 seconds
        lda     TIMER_100MS_A
        bne     $1
        jsr     INITBRDS
REWIND:
        lda     #0xFA
        sta     TIMER_100MS_R25
        lda     #0x00
        sta     RAM_67
        sta     RAM_68
        lda     #0x30
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD


L1A87:
        lda     #0x00
        sta     ZEROCROSS_CTR


L1A8B:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     TIMER_1MS_A
        inc     ZEROCROSS_CTR
        lda     ZEROCROSS_CTR
        cmp     #0x64
        bcs     FINDTRK


L1A9A:
        jsr     TUPDATE
        jsr     L1DAB
        lda     TIMER_1MS_A
        beq     L1A87
        lda     transport_control_reg_b
        bpl     L1A9A
        jmp     L1A8B


FINDTRK:
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        lda     #0x19
        sta     TIMER_100MS_A                           ; 2.5 secs
        lda     #0x64
        sta     TIMER_1MS_R


L1AB9:
        jsr     TUPDATE
        jsr     L1DAB
        lda     TIMER_100MS_A
        bne     L1AB9
        lda     #0x00
        sta     TRACK_CTR
        jsr     WAITTONE
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD
        jsr     WAITTONE
        lda     #0xFA
        sta     TIMER_1MS_A


L1AD6:
        jsr     TUPDATE
        jsr     L1DAB
        lda     TIMER_1MS_A
        bne     L1AD6
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD
        jsr     WAITTONE
        inc     TRACK_CTR
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
        lda     PROG_CTR
        bne     STARTPLAY
        lda     #0x02
        sta     U19_PORTA
        lda     #0x00
        sta     U18_PORTB
        lda     TIMER_10S
        bne     WAITPLAY
        inc     PROG_CTR


STARTPLAY:
        jsr     INITBRDS
        lda     #0x00
        sta     U19_PORTA
        lda     #0x80
        sta     U18_PORTB
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD
        jsr     WAITCD
        dec     PROG_CTR
        jsr     PLAYTRK
        jsr     INITBRDS
        lda     #0x18
        sta     TIMER_10S
        lda     #0x64
        sta     TIMER_100MS_R
        inc     TRACK_CTR
        lda     TRACK_CTR
        cmp     #0x1A
        bcc     NEXTTRK
        jmp     REWIND


NEXTTRK:
        lda     #0x00
        sta     RAM_67
        sta     RAM_68
        lda     #0xFA
        sta     TIMER_100MS_R25
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
        sta     CURR_CHANNEL
        sta     CURR_PORT
        rts


TAPECMD:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     TIMER_1MS_A


L1B9E:
        jsr     TUPDATE
        jsr     L1DAB
        lda     TIMER_1MS_A
        bne     L1B9E
        lda     transport_periph$ddr_reg_b
        and     #TIMER_TMP
        bne     L1BB4
        lda     #0x00
        sta     transport_periph$ddr_reg_b


L1BB4:
        rts


WAITTONE:
        lda     #0x00
        sta     ZEROCROSS_CTR
L1BB9:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     TIMER_1MS_A
        inc     ZEROCROSS_CTR
        lda     ZEROCROSS_CTR
        cmp     #0x21
        bcs     L1BDA
L1BC8:
        jsr     TUPDATE
        jsr     L1DAB
        lda     TIMER_1MS_A
        beq     WAITTONE
        lda     transport_control_reg_b
        bpl     L1BC8
        jmp     L1BB9
L1BDA:
        rts


WAITCD:
        lda     #0xFA
        sta     TIMER_1MS_A
L1BDF:
        jsr     TUPDATE
        jsr     L1DAB
        lda     TIMER_1MS_A
        bne     L1BDF


L1BE9:
        jsr     TUPDATE
        jsr     L1DAB
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1BE9
        lda     #0xA0
        sta     TIMER_1MS_A
L1BF9:
        jsr     TUPDATE
        jsr     L1DAB
        lda     transport_periph$ddr_reg_b
        ror
        bcc     L1BE9
        lda     TIMER_1MS_A
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
        lda     #TIMER_TMP
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
        sta     TIMER_1MS_A
L1C40:
        jsr     TUPDATE
        lda     transport_periph$ddr_reg_b
        lsr
        bcs     PLAYTRK
        lda     TIMER_1MS_A
        bne     L1C40
        rts
;
; Protocol handler
;
PROTOHAND:
        lda     transport_periph$ddr_reg_a
PROCBYTE:
        and     #0x7F
        sta     TAPE_BYTE
        and     #0x7E
        cmp     #0x22
        beq     PROCCHNL
        cmp     #0x32
        bcc     $18
        cmp     #0x3A
        bcc     PROCCHNL
        lda     TAPE_BYTE
        cmp     #0x41
        bcc     $18
        cmp     #0x4F                           ; is it >= 0x4F?
        bcs     $18
        ldx     CURR_PORT
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
        sta     SOL_MASK
        lda     CURR_CHANNEL
        lsr
        bcs     $17
        lda     SOL_MASK
        eor     #0xFF
        and     0x00,x
        sta     0x00,x
        rts
;
$17:
        lda     SOL_MASK
        ora     0x00,x
        sta     0x00,x
        rts
;
PROCCHNL:
        lda     TAPE_BYTE
        sta     CURR_CHANNEL
        and     #0x7E
        cmp     #0x22
        bne     CONVCHNL
        lda     #0x98
        sta     CURR_PORT
        rts
;
CONVCHNL:
        sec
        sbc     #0x32
        asl
        clc
        adc     #0x80
        sta     CURR_PORT
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
        sta     TIMER_TMP
        beq     TEXIT
        lda     PROG_STATE
        bmi     $20_A
        lda     TIMER_TMP
        and     #0x40
        beq     $20_B
        lda     #0x80
        sta     PROG_STATE
        lda     #0xFA
        sta     TIMER_1MS_B
$20_A:
        lda     TIMER_1MS_B
        bne     $20
        lda     #0x00
        sta     PROG_STATE
        lda     PROG_CTR
        bne     $20
        inc     PROG_CTR
$20:
        lda     TIMER_TMP
        bpl     TEXIT
; Adjust Timer routine
$20_B:
        lda     U18_timer
        eor     #0xFF
        lsr
        lsr
        lsr
        sta     TIMER_TMP1
        bcc     $21
        inc     TIMER_TMP1


$21:
        lda     #0x7A
        sec
        sbc     TIMER_TMP1
        sta     U18_timer_8T_DI
        dec     TIMER_1MS_A
        dec     TIMER_1MS_B
        dec     TIMER_1MS_C
        dec     TIMER_1MS_R
        bne     TEXIT
        lda     #0x64
        sta     TIMER_1MS_R
        dec     TIMER_100MS_A
        dec     TIMER_100MS_R25
        bne     $21_A
        lda     #0xFA                   ; reset to 2.5 seconds?
        sta     TIMER_100MS_R25
$21_A:
        dec     TIMER_100MS_R
        bne     TEXIT
        lda     #0x64                   ; reset to 10 seconds?
        sta     TIMER_100MS_R
        dec     TIMER_10S
TEXIT:
        rts
;
;       Read the AGC mic level
;       Take the average of 8 samples
;
AGCMICRD:
        lda     #0x00
        sta     AGC_ACCUM
        sta     AGC_SAMPLES
        lda     #0x0A
        sta     TIMER_100MS_A
        lda     #0x64
        sta     TIMER_1MS_R
$23:
        jsr     TUPDATE
        jsr     L1DAB
        lda     TIMER_100MS_A
        bne     $23
        lda     #0x0A
        sta     TIMER_100MS_A
        lda     #0x64
        sta     TIMER_1MS_R
        lda     AGC_SAMPLES
        cmp     #0x08
        beq     $27
        inc     AGC_SAMPLES
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a
$24:
        rol
        dex
        bcc     $24
        clc
        txa
        adc     AGC_ACCUM
        sta     AGC_ACCUM
        jmp     $23
;
$27:
        lsr     AGC_ACCUM
        lsr     AGC_ACCUM
        lsr     AGC_ACCUM
        lda     AGC_ACCUM
        sta     AGC_LEVEL
        lda     #0x00
        sta     AGC_ACCUM
        sta     AGC_SAMPLES
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
        adc     AGC_LEVEL
        tax
        lda     AGCTABLE,x
        sta     AGC_GAIN
        lda     TIMER_1MS_C
        bne     $26
        lda     #0x0A
        sta     TIMER_1MS_C
        lda     AGC_GAIN
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
        lda     RAM_67
        tax
        lda     RAM_68
        bne     L1DE5
        lda     X1E0F,x
        cmp     #0xFE
        beq     L1DDC
        cmp     #0xFF
        bne     L1DC4
        lda     #0x00
        sta     RAM_67
        jmp     L1DDB


L1DC4:
        cmp     TIMER_100MS_R25
        bne     L1DDB
        lda     X1E10,x
        jsr     PROCBYTE
        lda     X1E11,x
        jsr     PROCBYTE
        lda     RAM_67
        clc
        adc     #0x03
        sta     RAM_67


L1DDB:
        rts


L1DDC:
        inc     RAM_68
        lda     #0x00
        sta     RAM_67
        jmp     L1DDB


L1DE5:
        lda     X1EF3,x
        cmp     #0xFF
        bne     L1DF5
        lda     #0x00
        sta     RAM_67
        sta     RAM_68
        jmp     L1DDB


L1DF5:
        cmp     TIMER_100MS_R25
        bne     L1DDB
        lda     X1EF4,x
        jsr     PROCBYTE
        lda     X1EF5,x
        jsr     PROCBYTE
        lda     RAM_67
        clc
        adc     #0x03
        sta     RAM_67
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
