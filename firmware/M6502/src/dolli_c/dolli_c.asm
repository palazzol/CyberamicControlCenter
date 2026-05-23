        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Dolli Dimples Program
;       Version C ?
;
;       This image was recovered from a 2708 with a label "Dolli C 1C00"
;

TIMER_1MS_A     = 0x0050    ; decremented every 1ms
TIMER_1MS_B     = 0x0051    ; decremented every 1ms
TIMER_1MS_C     = 0x0052    ; decremented every 1ms
TIMER_1MS_R     = 0x0053    ; decremented every 1ms, resets to 100
TIMER_100MS_A   = 0x0054    ; decremented every 0.1s
TIMER_100MS_B   = 0x0055    ; decremented every 0.1s
TIMER_100MS_R   = 0x0056    ; decremented every 0.1s, resets to 100
TIMER_10S       = 0x0057    ; decremented every 10s
ZEROCROSS_CTR   = 0x0058    ; zero crossing counter
TRACK_CTR       = 0x0059    ; track counter
PROG_CTR        = 0x005A    ; number of PROG button presses
PROG_STATE      = 0x005B    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
TAPE_BYTE       = 0x005C    ; storage for incoming serial byte (& 0x7F)
SOL_MASK        = 0x005D    ; bitmask for solenoids
CURR_CHANNEL    = 0x005E    ; current channel serial byte
TIMER_TMP       = 0x005F    ; temp timer storage
AGC_LEVEL       = 0x0060    ; agc mic level
AGC_ACCUM       = 0x0061    ; agc mic level accumulator
AGC_SAMPLES     = 0x0062    ; agc mic sample counter
AGC_GAIN        = 0x0063    ; agc calculated gain value

        .include "../../include/ptt6502.def"

        .org    0x1C00
;
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
        sta     audio_control_reg_b                     ; audio CB2 is Write strobe (Unused)
        sta     audio_control_reg_a                     ; audio CA2 is Read strobe (Unused)
        lda     #0x64
        sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
        lda     #0x2B
        sta     TIMER_10S                               ; ~5 minute timer?
        lda     #0x10                                   ; 16
        sta     AGC_GAIN                                ; Set initial AGC gain value
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #0x28                                   ; this will count 4 seconds
        sta     TIMER_100MS_A
$1:
        jsr     TUPDATE                                 ; do not much for 4 seconds
        lda     TIMER_100MS_A
        bne     $1
REWIND:
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD                                 ; REWIND tape
FINDSTART:
        jsr     WAITTONE
        lda     ZEROCROSS_CTR
        cmp     #0x60                                   ; 96 edges?
        bcc     FINDSTART                               ; no, loop
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        lda     #0x19
        sta     TIMER_100MS_A                           ; ~2.5 secs?
$5:
        jsr     TUPDATE                                 ; do housekeeping stuff
        lda     TIMER_100MS_A
        bne     $5
        lda     #0x00
        sta     TRACK_CTR
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        inc     TRACK_CTR
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD                                 ; PLAY tape
        jsr     WAITCD                                  ; wait for carrier
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        jsr     INITBRDS                                ; init the boards
WAITPLAY:
        jsr     TUPDATE                                 ; do housekeeping stuff
        jsr     AGCUPD                                  ; do AGC Mic Logic
        lda     PROG_CTR                                ; wait until we are triggered
        bne     STARTPLAY                               ; then jump
        lda     #0x02                                   ; else
        sta     U19_PORTA                               ; turn on RESET button light
        lda     #0x00
        sta     U18_PORTB                               ; turn on all other button lights
        lda     TIMER_10S                               ; has the ~5 minute timer run out?
        bne     WAITPLAY                                ; no, keep looping
        inc     PROG_CTR                                ; yes, simulate a PROG button press
;   we have been started!
STARTPLAY:
        jsr     INITBRDS                                ; init the boards
        lda     #0x00
        sta     U19_PORTA                               ; turn off RESET button light
        lda     #0x80
        sta     U18_PORTB                               ; turn off all but PROG light
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD                                 ; PLAY tape
        jsr     WAITCD                                  ; wait for carrier
        dec     PROG_CTR                                ; no longer triggered
        jsr     PLAYTRK                                 ; play a track!
        jsr     INITBRDS                                ; init the boards
        lda     #0x2B
        sta     TIMER_10S                               ; set a ~5 minute timer
        inc     TRACK_CTR                               ; track counter
        lda     TRACK_CTR
        cmp     #0x1A                                   ; 26?
        bcc     NEXTTRK
        jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
; go to next track
NEXTTRK:
        jsr     WAITCD                                  ; wait for carrier
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        jsr     AGCMICRD                                ; Read the AGC mic level
        jmp     WAITPLAY
;
;       Init boards
;
INITBRDS:
        lda     #0x00
        ldx     #0x01
        jsr     DOBOARD                                 ; write 0x00 to port+1
        lda     #0xFF                                   ; set DDRx to all outputs
        ldx     #0x00
        jsr     DOBOARD                                 ; write 0xFF to port
        lda     #0x34
        ldx     #0x01
        jsr     DOBOARD                                 ; write 0x34 to port+1
        lda     #0x00                                   ; Cx2 low, port all low
        ldx     #0x00
        jsr     DOBOARD                                 ; write 0x00 to port
        rts
;
DOBOARD:
        sta     board_2_periph$ddr_reg_a,x
        sta     board_2_periph$ddr_reg_b,x
        sta     board_3_periph$ddr_reg_a,x
        sta     board_3_periph$ddr_reg_b,x
        rts
;
;       Send Transport command for 0.255 sec
;       and then unassert it
;
TAPECMD:
        sta     transport_periph$ddr_reg_b              ; enable output line
        lda     #0xFF
        sta     TIMER_1MS_A
$6:
        jsr     TUPDATE                                 ; check for PROG button push
        lda     TIMER_1MS_A
        bne     $6
        lda     #0x00
        sta     transport_periph$ddr_reg_b
        rts
;
;       Wait for tone during Fast Forward, signaling beginning of track
;       (64 Hz for ~.4s, or higher for proportionally less)
;
WAITTONE:
        lda     #0x00
        sta     ZEROCROSS_CTR
; wait for tone start
$8:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_control_reg_b
        bpl     $8
        lda     #0x04
        sta     TIMER_100MS_A                           ; ~.4 secs?
$29:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_control_reg_b                 ; transport CB1 rising edge?
        bpl     $28                                     ; if not, jump ahead
        inc     ZEROCROSS_CTR                           ; count edges
        lda     transport_periph$ddr_reg_b
        lda     ZEROCROSS_CTR
        cmp     #0x60                                   ; 96 edges?
        bcs     $10                                     ; exit
$28:
        lda     TIMER_100MS_A                           ; ~.4 secs?
        bne     $29
        lda     ZEROCROSS_CTR
        cmp     #0x20                                   ; 32 edges?
        bcc     WAITTONE                                ; no, loop
$10:
        rts
;
;       Wait for carrier / start of data
;

; Wait for 250ms
WAITCD:
        lda     #0xFA
        sta     TIMER_1MS_A                             ; 250 msec
$11:
        jsr     TUPDATE                                 ; housekeeping
        lda     TIMER_1MS_A
        bne     $11

; Wait for 160ms of consecutive zero crossings
$12:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     $12
        lda     #0xA0                                   ; 160 msec
        sta     TIMER_1MS_A
$13:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     $12
        lda     TIMER_1MS_A
        bne     $13
        rts
;
PLAYTRK:
        lda     transport_periph$ddr_reg_a
        lda     #0x40
        sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
        sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
$14:
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcc     LOSTCD                                  ; b0=0, no carrier, exit
        jsr     AGCUPD                                  ; do AGC Mic Logic
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_control_reg_a                 ; Did we get a byte?
        bpl     $14                                     ; No, loop
        jsr     PROTOHAND                               ; Yes, Process Incoming Byte
        jmp     $14

;       Lost carrier - wait 100 msec for more data before giving up
LOSTCD:
        lda     #0x64                                   ; 100 msec
        sta     TIMER_1MS_A
$15:
        jsr     TUPDATE
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcs     PLAYTRK                                 ; carrier
        lda     TIMER_1MS_A
        bne     $15
        rts
;
; Protocol handler
;
PROTOHAND:
        lda     transport_periph$ddr_reg_a
        and     #0x7F                                   ; insure data is ASCII
        sta     TAPE_BYTE                               ; store it here
        and     #0x7E                                   ; ignore bottom bit
        cmp     #0x22                                   ; is it 0x22 or 0x23?
        beq     PROCCHNL                                ; if so, process as channel
        cmp     #0x36                                   ; is it 0x36 or 0x37?
        beq     PROCCHNL                                ; if so, process as channel
        lda     TAPE_BYTE                               ; get original byte
        sec
        sbc     #0x41                                   ; subtract 0x41
        tay                                             ; filter (0x41 to 0x50)
        bmi     $18                                     ; if original < 0x41, exit
        cmp     #0x10
        bcs     $18                                     ; if original >= 0x51, exit
        ldx     #0x84                                   ; x = port offset
        cmp     #0x08
        bcc     $16                                     ; if original is 0x41 to 0x48, use offset 0x84 (board 2A)
        ldx     #0x88
        cmp     #0x0E                                   ; if original is 0x49 to 0x4E, use offset 0x88 (board 3A)
        bcc     $16
        ldx     #0x8A                                   ; if original is 0x4F to 0x50, use offset 0x8A (board 3B)
$16:
        lda     MASKTBL,y                               ; lookup bitmask
        sta     SOL_MASK                                ; store mask in SOL_MASK
        lda     CURR_CHANNEL
        lsr     a                                       ; get on/off in carry
        bcs     $17                                     ; if on, jump
        lda     SOL_MASK
        eor     #0xFF
        and     RAM_start,x
        sta     RAM_start,x                             ; turn off solenoid
        rts
;
$17:
        lda     SOL_MASK
        ora     RAM_start,x
        sta     RAM_start,x                             ; turn on solenoid
        rts
;
PROCCHNL:
        lda     TAPE_BYTE
        sta     CURR_CHANNEL
$18:
        rts
;
; bit mask table
;
MASKTBL:
        .db     0x01,0x02,0x04,0x08
        .db     0x10,0x20,0x40,0x80
        .db     0x01,0x02,0x04,0x08
        .db     0x10,0x20,0x01,0x02
;
TUPDATE:
        lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
        sta     TIMER_TMP                               ; store this state in 5F
        beq     TEXIT                                   ; No flags set, return
        lda     PROG_STATE                              ; Are we already running?
        bmi     $19                                     ; yes, jump ahead
        lda     TIMER_TMP                               ; else check flags
        and     #0x40                                   ; PROG pushed?
        beq     RDTIMER                                 ; if not, go to read timer
        lda     #0x80
        sta     PROG_STATE                              ; PROG Button pushed
        lda     #0xFA
        sta     TIMER_1MS_B
$19:
        lda     TIMER_1MS_B                             ; for 250ms?
        bne     $20                                     ; no, exit
        lda     #0x00
        sta     PROG_STATE                              ; yes, reset PROG button state
        inc     PROG_CTR                                ; and mark as running
$20:
        lda     TIMER_TMP                               ; check timer irq bit
        bpl     TEXIT                                   ; if timer not expired, return
RDTIMER:
        lda     U18_timer                               ; ???
        lda     #0x01
        sta     U18_17                                  ; ???
        dec     TIMER_1MS_A                             ; decrement these timers every timer reset (1ms)
        dec     TIMER_1MS_B
        dec     TIMER_1MS_C
        dec     TIMER_1MS_R
        bne     TEXIT                                   ; if timer TIMER_1MS_R expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     TIMER_1MS_R
        dec     TIMER_100MS_A
        dec     TIMER_100MS_B
        dec     TIMER_100MS_R
        bne     TEXIT                                   ; if timer TIMER_100MS_R expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     TIMER_100MS_R
        dec     TIMER_10S
TEXIT:
        rts
;
;       Read the AGC mic level
;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
;
AGCMICRD:
        lda     #0x00
        sta     AGC_ACCUM                               ; init final agc value
        sta     AGC_SAMPLES                             ; init agc sample counter
        lda     #0x0A
        sta     TIMER_100MS_A                           ; Start a 1 second timer
$23:
        jsr     TUPDATE                                 ; housekeeping
        lda     TIMER_100MS_A
        bne     $23                                     ; if 1 sec, do housekeeping
        lda     #0x0A
        sta     TIMER_100MS_A                           ; reset timer
        lda     AGC_SAMPLES
        cmp     #0x08                                   ; 8 samples?
        beq     $27                                     ; yes - jump to final calculation
        inc     AGC_SAMPLES                             ; increment the sample counter
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a                  ; read the agc mic level
$24:                                                    ; read the most significant high bit
        rol     a
        dex
        bcc     $24
        clc
        txa                                             ; 8=high bit7, 0=no high bits
        adc     AGC_ACCUM                               ; add it into AGC_ACCUM (do this 8 times)
        sta     AGC_ACCUM
        jmp     $23
;
$27:
        lsr     AGC_ACCUM                               ; divide by 8 (average of 8 samples)
        lsr     AGC_ACCUM
        lsr     AGC_ACCUM
        lda     AGC_ACCUM
        sta     AGC_LEVEL                               ; store agc value in AGC_LEVEL
        lda     #0x00
        sta     AGC_ACCUM                               ; clear these 2 and return
        sta     AGC_SAMPLES
        rts
;
;        Do AGC Mic Logic
;
AGCUPD:
        lda     U19_PORTA                               ; read AGC knob
        eor     #0xFF                                   ; invert the bits
        lsr     a                                       ; get into lower nibble
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     AGC_LEVEL                               ; add audio level to it
        tax
        lda     AGCTABLE,x                              ; and get the table value
        sta     AGC_GAIN                                ; store this value in AGC_GAIN
        lda     TIMER_1MS_C                             ; 10ms timer expired?
        bne     $26                                     ; no, just update CPU Leds
        lda     #0x0A
        sta     TIMER_1MS_C                             ; restart 10ms timer
        lda     AGC_GAIN                                ; every 10ms, adjust gain by 1 if needed
        cmp     audio_periph$ddr_reg_b                  ; compare with current value
        bcc     $25
        beq     $26
        inc     audio_periph$ddr_reg_b                  ; increase value
        jmp     $26
;
$25:
        dec     audio_periph$ddr_reg_b                  ; decrease value
$26:
        lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
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
;
; all ff's in this gap
;
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
