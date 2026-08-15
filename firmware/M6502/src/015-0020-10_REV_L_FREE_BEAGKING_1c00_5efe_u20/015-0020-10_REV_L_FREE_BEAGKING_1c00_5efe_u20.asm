
        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Unknown Program (2)
;       Version 015-0020-10_REV_L_FREE_BEAGKING
;
;       This image was recovered from the last quarter of a 2732 and a 2708
;
TIMER_1MS_A     = 0x0050    ; decremented every 1ms
TIMER_1MS_B     = 0x0051    ; decremented every 1ms
TIMER_1MS_C     = 0x0052    ; decremented every 1ms
TIMER_1MS_R     = 0x0053    ; decremented every 1ms, resets to 100
TIMER_100MS_A   = 0x0054    ; decremented every 0.1s
TIMER_100MS_R   = 0x0055    ; decremented every 0.1s, resets to 100
TIMER_10S       = 0x0056    ; decremented every 10s
TIMER_TMP1      = 0x0057    ; temp timer storage
ZEROCROSS_CTR   = 0x0058    ; zero crossing counter
TRACK_CTR       = 0x0059    ; track counter
PROG_CTR        = 0x005A    ; number of PROG button presses

TAPE_BYTE       = 0x005C    ; storage for incoming serial byte (& 0x7F)
SOL_MASK        = 0x005D    ; bitmask for solenoids
CURR_CHANNEL    = 0x005E    ; current channel serial byte
TIMER_TMP       = 0x005F    ; temp timer storage
AGC_LEVEL       = 0x0060    ; agc mic level
AGC_ACCUM       = 0x0061    ; agc mic level accumulator
AGC_SAMPLES     = 0x0062    ; agc mic sample counter
AGC_GAIN        = 0x0063    ; agc calculated gain value
CURR_PORT       = 0x0064    ; current channel port address

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
        lda     #0x3C
        sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
        sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
        lda     #0x64
        sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
        lda     #0x1E
        sta     TIMER_10S                               ; Init a 5 minute timer
        lda     #0x64
        sta     TIMER_100MS_R                           ; 100 - init 0.1 sec master counter
        lda     #0x10                                   ; 16
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
REWIND:
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD                                 ; REWIND tape
$22:
        lda     #0x00
        sta     ZEROCROSS_CTR                           ; counter to zero
; Look for the long tone at the beginning of tape
$2:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_control_reg_b                 ; loop until we see tone marking beginning of tape
        bpl     $2
        lda     #0x06
        sta     TIMER_100MS_A                           ; set 0.6 second timer
        lda     #0x64                                   ; 100 rising edge transitions
        sta     TIMER_1MS_R
$3:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_control_reg_b                 ; loop until 100 transport CB1 rising edges or 0.6 secs expired
        bpl     $4                                      ; (> 83.333 Hz for 100 zero crossings)
        inc     ZEROCROSS_CTR                           ; count transitions
        lda     transport_periph$ddr_reg_b
        lda     ZEROCROSS_CTR
        cmp     #0x64
        bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
$4:
        lda     TIMER_100MS_A
        bne     $3
        jmp     $22
; unused instructions start
        cmp     #0x60
        bcc     FINDTRK
; unused instructions end
;
FINDTRK:
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        lda     #0x19
        sta     TIMER_100MS_A                           ; 2.5 secs
        lda     #0x64
        sta     TIMER_1MS_R
$5:
        jsr     TUPDATE                                 ; do housekeeping stuff
        lda     TIMER_100MS_A
        bne     $5
        lda     #0x00
        sta     TRACK_CTR
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD                                 ; REWIND tape
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        lda     #0xFA
        sta     TIMER_1MS_A
$30:
        jsr     TUPDATE                                 ; housekeeping
        lda     TIMER_1MS_A
        bne     $30                                     ; delay for 250 ms
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        inc     TRACK_CTR
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD                                 ; PLAY tape
        jsr     WAITCD                                  ; wait for carrier
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP Tape
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
        lda     TIMER_10S                               ; has the 8 minute timer run out?
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
        dec     PROG_CTR                                  ; no longer triggered
        jsr     PLAYTRK                                 ; play a track!
        jsr     INITBRDS                                ; init the boards
        lda     #0x1E
        sta     TIMER_10S                               ; set a 5 min timer
        lda     #0x64
        sta     TIMER_100MS_R
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
        lda     #0x3C
        sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
        lda     #0x34
        sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
        ldx     #0x00
NEXTBRD:
        lda     #0x30
        sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
        sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
        lda     #0xFF
        sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
        sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
        lda     #0x34
        sta     board_1_control_reg_a,x                 ; A peripheral selected
        sta     board_1_control_reg_b,x                 ; B peripheral selected
        lda     #0x00
        sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
        sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
        inx
        inx
        inx
        inx
        cpx     #0x20                                   ; do for boards 1-8
        bcc     NEXTBRD
        rts
;
;       Send Transport command for 0.250 sec
;       (Unified)
;
TAPECMD:
        sta     transport_periph$ddr_reg_b              ; enable output line
        lda     #0xFA
        sta     TIMER_1MS_A
$6:
        jsr     TUPDATE                                 ; check for PROG button push
        lda     TIMER_1MS_A
        bne     $6
        lda     transport_periph$ddr_reg_b
        and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
        bne     $31                                     ; Yes, go to exit
        lda     #0x00                                   ; else unassert STOP or PLAY
        sta     transport_periph$ddr_reg_b              ; and then exit
$31:
        rts
;
;       Wait for tone during Fast Forward, signaling beginning of track
;       (50Hz or above, for 33 zero crossing) 
;
WAITTONE:
        lda     #0x00
        sta     ZEROCROSS_CTR
$8:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     TIMER_1MS_A                             ; 10 msec
        inc     ZEROCROSS_CTR
        lda     ZEROCROSS_CTR
        cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
        bcs     $10                                     ; timeout - exit
$9:
        jsr     TUPDATE                                 ; housekeeping
        lda     TIMER_1MS_A
        beq     WAITTONE                                ; 10 msec done yet? then loop
        lda     transport_control_reg_b                 ; transport CB1 rising edge?
        bpl     $9                                      ; if not, extend the looping
        jmp     $8                                      ; else loop but keep timeout going
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
;       Play a track
;
PLAYTRK:
        lda     transport_periph$ddr_reg_a
        lda     #0x40
        sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
        sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
        sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
        sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
        lda     #0x3C
        sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
        lda     #0x34
        sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
        lda     #0x60
        sta     board_1_periph$ddr_reg_b                ; ???
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
        cmp     #0x32                                   ; is it < 0x32 ?
        bcc     $18                                     ; ignore it
        cmp     #0x3A                                   ; is it < 0x3A
        bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
        lda     TAPE_BYTE
        cmp     #0x41                                   ; is it < 0x41?
        bcc     $18                                     ; ignore it
        cmp     #0x51                                   ; is it >= 0x51?
        bcs     $18                                     ; ignore it
        ldx     CURR_PORT                               ; X = current board address
        sec                                             ; (it's 0x41 to 0x50)
        sbc     #0x41                                   ; subtract 0x41
        cmp     #0x08
        bcc     $16                                     ; process as command
        inx
        inx
$16:
        and     #0x07                                   ; lookup bitmask in A
        tay
        lda     MASKTBL,y
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
        lda     TAPE_BYTE                               ; put channel byte in CURR_CHANNEL
        sta     CURR_CHANNEL
        and     #0x7E
        cmp     #0x22
        bne     CONVCHNL
        lda     #0x98                                   ; process 0x22 or 0x23
        sta     CURR_PORT                               ; set this to 0x98 - board 7
        rts
;
CONVCHNL:
        sec                                             ; process channel
        sbc     #0x32
        asl     a
        clc
        adc     #0x80
        sta     CURR_PORT                               ; (X-0x32) * 2 + 0x80
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
;       TIMER_1MS_A used on entry
;
TUPDATE:
        lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
        sta     TIMER_TMP                               ; store this state in 5F
        beq     TEXIT                                   ; No flags set, return
        and     #0x40                                   ; PROG pushed?
        beq     $20                                     ; if not, check if timer expired
        lda     #0x01
        sta     PROG_CTR                                ; Mark as started
$20:
        lda     TIMER_TMP                               ; check timer irq bit
        bpl     TEXIT                                   ; if timer not expired, return
; Adjust Timer routine
        lda     U18_timer                               ; read timer in U18
        eor     #0xFF                                   ; flip the bits
        lsr     a                                       ; keep the top 5 bits
        lsr     a
        lsr     a
        sta     TIMER_TMP1                              ; store them
        bcc     $21                                     ; bcc on timer bit D2
        inc     TIMER_TMP1                              ; round up?
                                                        ; now TIMER_TMP1 has the number of 8us 
                                                        ;   intervals since timer expired
$21:
        lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
        sec                                             ; with programming delays, this is 1 msec
        sbc     TIMER_TMP1
        sta     U18_timer_8T_DI                         ; set timer
        dec     TIMER_1MS_A                             ; decrement these timers every timer reset (1ms)
        dec     TIMER_1MS_B
        dec     TIMER_1MS_C
        dec     TIMER_1MS_R
        bne     TEXIT                                   ; if timer TIMER_1MS_R expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     TIMER_1MS_R
        dec     TIMER_100MS_A
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
        lda     #0x64
        sta     TIMER_1MS_R
$23:
        jsr     TUPDATE                                 ; housekeeping
        lda     TIMER_100MS_A
        bne     $23                                     ; if 1 sec, do housekeeping
        lda     #0x0A
        sta     TIMER_100MS_A
        lda     #0x64
        sta     TIMER_1MS_R                             ; reset timer
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
; all zeros in this gap
;
        .byte   0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00

        .org    0x1FFA
;
; vectors
;
NMIVEC:
        .dw     RAM_start
RESETVEC:
        .dw     RESET
IRQVEC:
        .dw     RAM_start
