        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       Dolli Dimples Program
;       Version C ?
;
;       This image was recovered from a 2708 with a label "Dolli C 1C00"
;

RAM_50  = 0x0050    ; decremented every 1ms
RAM_51  = 0x0051    ; decremented every 1ms
RAM_52  = 0x0052    ; decremented every 1ms
RAM_53  = 0x0053    ; decremented every 1ms, resets to 100
RAM_54  = 0x0054    ; decremented every 0.1s
RAM_55  = 0x0055    ; decremented every 0.1s
RAM_56  = 0x0056    ; decremented every 0.1s, resets to 100
RAM_57  = 0x0057    ; decremented every 10s
RAM_58  = 0x0058    ; zero crossing counter
RAM_59  = 0x0059    ; track counter
RAM_5A  = 0x005A    ; number of PROG button presses
RAM_5B  = 0x005B    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
RAM_5C  = 0x005C    ; storage for incoming serial byte (& 0x7F)
RAM_5D  = 0x005D    ; bitmask for solenoids
RAM_5E  = 0x005E    ; current channel serial byte
RAM_5F  = 0x005F    ; temp timer storage
RAM_60  = 0x0060    ; agc mic level
RAM_61  = 0x0061    ; agc mic level accumulator
RAM_62  = 0x0062    ; agc mic sample counter
RAM_63  = 0x0063    ; agc calculated gain value

        .include "../include/ptt6502.def"

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
        sta     RAM_53                                  ; 100 - init 1 msec master counter
        lda     #0x2B
        sta     RAM_57                                  ; ~5 minute timer?
        lda     #0x10                                   ; 16
        sta     RAM_63                                  ; Set initial AGC gain value
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #0x28                                   ; this will count 4 seconds
        sta     RAM_54
$1:
        jsr     TUPDATE                                 ; do not much for 4 seconds
        lda     RAM_54
        bne     $1
REWIND:
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD                                 ; REWIND tape
FINDSTART:
        jsr     WAITTONE
        lda     RAM_58
        cmp     #0x60                                   ; 96 edges?
        bcc     FINDSTART                               ; no, loop
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        lda     #0x19
        sta     RAM_54                                  ; ~2.5 secs?
$5:
        jsr     TUPDATE                                 ; do housekeeping stuff
        lda     RAM_54
        bne     $5
        lda     #0x00
        sta     RAM_59
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        inc     RAM_59
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
        lda     RAM_5A                                  ; wait until we are triggered
        bne     STARTPLAY                                   ; then jump
        lda     #0x02                                   ; else
        sta     U19_PORTA                               ; turn on RESET button light
        lda     #0x00
        sta     U18_PORTB                               ; turn on all other button lights
        lda     RAM_57                                  ; has the ~5 minute timer run out?
        bne     WAITPLAY                                ; no, keep looping
        inc     RAM_5A                                  ; yes, simulate a PROG button press
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
        dec     RAM_5A                                  ; no longer triggered
        jsr     PLAYTRK                                 ; play a track!
        jsr     INITBRDS                                ; init the boards
        lda     #0x2B
        sta     RAM_57                                  ; set a ~5 minute timer
        inc     RAM_59                                  ; track counter
        lda     RAM_59
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
        sta     RAM_50
$6:
        jsr     TUPDATE                                 ; check for PROG button push
        lda     RAM_50
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
        sta     RAM_58
; wait for tone start
$8:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_control_reg_b
        bpl     $8
        lda     #0x04
        sta     RAM_54                                  ; ~.4 secs?
$29:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_control_reg_b                 ; transport CB1 rising edge?
        bpl     $28                                     ; if not, jump ahead
        inc     RAM_58                                  ; count edges
        lda     transport_periph$ddr_reg_b
        lda     RAM_58
        cmp     #0x60                                   ; 96 edges?
        bcs     $10                                     ; exit
$28:
        lda     RAM_54                                  ; ~.4 secs?
        bne     $29
        lda     RAM_58
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
        sta     RAM_50                                  ; 250 msec
$11:
        jsr     TUPDATE                                 ; housekeeping
        lda     RAM_50
        bne     $11

; Wait for 160ms of consecutive zero crossings
$12:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     $12
        lda     #0xA0                                   ; 160 msec
        sta     RAM_50
$13:
        jsr     TUPDATE                                 ; housekeeping
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     $12
        lda     RAM_50
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
        sta     RAM_50
$15:
        jsr     TUPDATE
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcs     PLAYTRK                                 ; carrier
        lda     RAM_50
        bne     $15
        rts
;
; Protocol handler
;
PROTOHAND:
        lda     transport_periph$ddr_reg_a
        and     #0x7F                                   ; insure data is ASCII
        sta     RAM_5C                                  ; store it here
        and     #0x7E                                   ; ignore bottom bit
        cmp     #0x22                                   ; is it 0x22 or 0x23?
        beq     PROCCHNL                                ; if so, process as channel
        cmp     #0x36                                   ; is it 0x36 or 0x37?
        beq     PROCCHNL                                ; if so, process as channel
        lda     RAM_5C                                  ; get original byte
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
        sta     RAM_5D                                  ; store mask in RAM_5D
        lda     RAM_5E
        lsr     a                                       ; get on/off in carry
        bcs     $17                                     ; if on, jump
        lda     RAM_5D
        eor     #0xFF
        and     RAM_start,x
        sta     RAM_start,x                             ; turn off solenoid
        rts
;
$17:
        lda     RAM_5D
        ora     RAM_start,x
        sta     RAM_start,x                             ; turn on solenoid
        rts
;
PROCCHNL:
        lda     RAM_5C
        sta     RAM_5E
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
        sta     RAM_5F                                  ; store this state in 5F
        beq     TEXIT                                   ; No flags set, return
        lda     RAM_5B                                  ; Are we already running?
        bmi     $19                                     ; yes, jump ahead
        lda     RAM_5F                                  ; else check flags
        and     #0x40                                   ; PROG pushed?
        beq     RDTIMER                                 ; if not, go to read timer
        lda     #0x80
        sta     RAM_5B                                  ; PROG Button pushed
        lda     #0xFA
        sta     RAM_51
$19:
        lda     RAM_51                                  ; for 250ms?
        bne     $20                                     ; no, exit
        lda     #0x00
        sta     RAM_5B                                  ; yes, reset PROG button state
        inc     RAM_5A                                  ; and mark as running
$20:
        lda     RAM_5F                                  ; check timer irq bit
        bpl     TEXIT                                   ; if timer not expired, return
RDTIMER:
        lda     U18_timer                               ; ???
        lda     #0x01
        sta     U18_17                                  ; ???
        dec     RAM_50                                  ; decrement these timers every timer reset (1ms)
        dec     RAM_51
        dec     RAM_52
        dec     RAM_53
        bne     TEXIT                                   ; if timer RAM_53 expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     RAM_53
        dec     RAM_54
        dec     RAM_55
        dec     RAM_56
        bne     TEXIT                                   ; if timer RAM_56 expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     RAM_56
        dec     RAM_57
TEXIT:
        rts
;
;       Read the AGC mic level
;       Take the average of 8 samples, and put it into RAM_60 (range is 0 to 8)
;
AGCMICRD:
        lda     #0x00
        sta     RAM_61                                  ; init final agc value
        sta     RAM_62                                  ; init agc sample counter
        lda     #0x0A
        sta     RAM_54                                  ; Start a 1 second timer
$23:
        jsr     TUPDATE                                 ; housekeeping
        lda     RAM_54
        bne     $23                                     ; if 1 sec, do housekeeping
        lda     #0x0A
        sta     RAM_54                                  ; reset timer
        lda     RAM_62
        cmp     #0x08                                   ; 8 samples?
        beq     $27                                     ; yes - jump to final calculation
        inc     RAM_62                                  ; increment the sample counter
        ldx     #0x09
        sec
        lda     audio_periph$ddr_reg_a                  ; read the agc mic level
$24:                                                    ; read the most significant high bit
        rol     a
        dex
        bcc     $24
        clc
        txa                                             ; 8=high bit7, 0=no high bits
        adc     RAM_61                                  ; add it into RAM_61 (do this 8 times)
        sta     RAM_61
        jmp     $23
;
$27:
        lsr     RAM_61                                  ; divide by 8 (average of 8 samples)
        lsr     RAM_61
        lsr     RAM_61
        lda     RAM_61
        sta     RAM_60                                  ; store agc value in RAM_60
        lda     #0x00
        sta     RAM_61                                  ; clear these 2 and return
        sta     RAM_62
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
        adc     RAM_60                                  ; add audio level to it
        tax
        lda     AGCTABLE,x                              ; and get the table value
        sta     RAM_63                                  ; store this value in RAM_63
        lda     RAM_52                                  ; 10ms timer expired?
        bne     $26                                     ; no, just update CPU Leds
        lda     #0x0A
        sta     RAM_52                                  ; restart 10ms timer
        lda     RAM_63                                  ; every 10ms, adjust gain by 1 if needed
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
