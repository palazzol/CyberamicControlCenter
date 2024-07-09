
        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       The Beagles/King Program
;       Version Unknown - Newer?
;
;       AGC mic logic included
;       "Double seek" to find next track marker
;       Bug Fixes:
;           Don't queue PROG button presses
;           Make sure serial command mode is reset between tracks
;           Serial protocol can't activate bits 14 and 15 on boards
;       Unified TAPECMD routine
;
;       This image was recovered from the last quarter of a 2732 with a black label
;

RAM_50  = 0x0050    ; decremented every 1ms
RAM_51  = 0x0051    ; decremented every 1ms
RAM_52  = 0x0052    ; decremented every 1ms
RAM_53  = 0x0053    ; decremented every 1ms, resets to 100
RAM_54  = 0x0054    ; decremented every 0.1s
RAM_55  = 0x0055    ; decremented every 0.1s, resets to 100
RAM_56  = 0x0056    ; decremented every 10s
RAM_57  = 0x0057    ; temp timer storage
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
RAM_64  = 0x0064    ; current channel port address

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
        lda     #0x3C
        sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
        sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
        lda     #0x64
        sta     RAM_53                                  ; 100 - init 1 msec master counter
        lda     #0x1E
        sta     RAM_56                                  ; Init a 5 minute timer
        lda     #0x64
        sta     RAM_55                                  ; 100 - init 0.1 sec master counter
        lda     #0x10                                   ; 16
        sta     RAM_63                                  ; Set initial AGC gain value
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #0x28                                   ; this will count 4 seconds
        sta     RAM_54
        lda     #0x64                                   ; reset master timer
        sta     RAM_53
$1:
        jsr     TUPDATE                                 ; do not much for 4 seconds
        lda     RAM_54
        bne     $1
REWIND:
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD                                 ; REWIND tape
$22:
        lda     #0x00
        sta     RAM_58                                  ; counter to zero
; Look for the long tone at the beginning of tape
$2:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     RAM_50                                  ; set a 10ms timer
        inc     RAM_58                                  ; inc transition counter
        lda     RAM_58
        cmp     #0x64
        bcs     FINDTRK                                 ; if we got 100 without a 10ms break, go forward
$3:
        jsr     TUPDATE                                 ; housekeeping
        lda     RAM_50
        beq     $22
        lda     transport_control_reg_b                 ; did we get a rising edge?
        bpl     $3                                      ; no, keep looping
        jmp     $2                                      ; yes, increment counter
;
FINDTRK:
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        lda     #0x19
        sta     RAM_54                                  ; 2.5 secs
        lda     #0x64
        sta     RAM_53
$5:
        jsr     TUPDATE                                 ; do housekeeping stuff
        lda     RAM_54
        bne     $5
        lda     #0x00
        sta     RAM_59
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD                                 ; REWIND tape
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        lda     #0xFA
        sta     RAM_50
$30:
        jsr     TUPDATE                                 ; housekeeping
        lda     RAM_50
        bne     $30                                     ; delay for 250 ms
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        inc     RAM_59
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD                                 ; PLAY tape
        jsr     WAITCD                                  ; wait for carrier
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP Tape
        jsr     INITBRDS
WAITPLAY:
        jmp     CALLP1                                  ; code patch - dont queue PROG button presses
;
RETP1:
        jsr     AGCUPD                                  ; do AGC Mic Logic
        lda     RAM_5A                                  ; wait until we are triggered
        bne     STARTPLAY                               ; then jump
        lda     #0x02                                   ; else
        sta     U19_PORTA                               ; turn on RESET button light
        lda     #0x00
        sta     U18_PORTB                               ; turn on all other button lights
        jmp     WAITPLAY                                ; keep looping
;
        nop
        nop
        nop
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
        lda     #0x1E
        sta     RAM_56                                  ; set a 5 min timer
        lda     #0x64
        sta     RAM_55
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
        lda     #0x00                                   ; bug fix!
        sta     RAM_5E                                  ; reset current channel serial byte
        sta     RAM_64                                  ; reset current channel port address
        rts
;
;       Send Transport command for 0.250 sec
;       (Unified)
;
TAPECMD:
        sta     transport_periph$ddr_reg_b              ; enable output line
        lda     #0xFA
        sta     RAM_50
$6:
        jsr     TUPDATE                                 ; check for PROG button push
        lda     RAM_50
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
        sta     RAM_58
$8:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     RAM_50                                  ; 10 msec
        inc     RAM_58
        lda     RAM_58
        cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
        bcs     $10                                     ; timeout - exit
$9:
        jsr     TUPDATE                                 ; housekeeping
        lda     RAM_50
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
        sta     board_1_periph$ddr_reg_b
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
        cmp     #0x32                                   ; is it < 0x32 ?
        bcc     $18                                     ; ignore it
        cmp     #0x3A                                   ; is it < 0x3A
        bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
        lda     RAM_5C
        cmp     #0x41                                   ; is it < 0x41?
        bcc     $18                                     ; ignore it
        cmp     #0x4F                                   ; is it >= 0x4F?
        bcs     $18                                     ; ignore it
        ldx     RAM_64                                  ; X = current board address
        sec                                             ; (it's 0x41 to 0x4E)
        sbc     #0x41                                   ; subtract 0x41
        cmp     #0x08
        bcc     $16                                     ; process as command
        inx
        inx
$16:
        and     #0x07                                   ; lookup bitmask in A
        tay
        lda     MASKTBL,y
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
        lda     RAM_5C                                  ; put channel byte in RAM_5E
        sta     RAM_5E
        and     #0x7E
        cmp     #0x22
        bne     CONVCHNL
        lda     #0x98                                   ; process 0x22 or 0x23
        sta     RAM_64                                  ; set this to 0x98 - board 7
        rts
;
CONVCHNL:
        sec                                             ; process channel
        sbc     #0x32
        asl     a
        clc
        adc     #0x80
        sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
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
;       RAM_50 used on entry
;
TUPDATE:
        lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
        sta     RAM_5F                                  ; store this state in 5F
        beq     TEXIT                                   ; No flags set, return
        lda     RAM_5B                                  ; Are we already running?
        bmi     $19                                     ; yes, jump ahead
        lda     RAM_5F                                  ; else check flags
        and     #0x40                                   ; PROG pushed?
        beq     ADJTMR                                  ; if not, go to adjust timer
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
; Adjust Timer routine
ADJTMR:
        lda     U18_timer                               ; read timer in U18
        eor     #0xFF                                   ; flip the bits
        lsr     a                                       ; keep the top 5 bits
        lsr     a
        lsr     a
        sta     RAM_57                                  ; store them
        bcc     $21                                     ; bcc on timer bit D2
        inc     RAM_57                                  ; round up?
                                                        ; now RAM_57 has the number of 8us 
                                                        ;   intervals since timer expired
$21:
        lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
        sec                                             ; with programming delays, this is 1 msec
        sbc     RAM_57
        sta     U18_timer_8T_DI                         ; set timer
        dec     RAM_50                                  ; decrement these timers every timer reset (1ms)
        dec     RAM_51
        dec     RAM_52
        dec     RAM_53
        bne     TEXIT                                   ; if timer RAM_53 expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     RAM_53
        dec     RAM_54
        dec     RAM_55
        bne     TEXIT                                   ; if timer RAM_55 expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     RAM_55
        dec     RAM_56
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
        lda     #0x64
        sta     RAM_53
$23:
        jsr     TUPDATE                                 ; housekeeping
        lda     RAM_54
        bne     $23                                     ; if 1 sec, do housekeeping
        lda     #0x0A
        sta     RAM_54
        lda     #0x64
        sta     RAM_53                                  ; reset timer
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
;       Code Patch
;
CALLP1:
        lda     #0x00
        sta     RAM_5A                                  ; clear pending PROG button presses
        jsr     TUPDATE                                 ; housekeeping
        jmp     RETP1
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

