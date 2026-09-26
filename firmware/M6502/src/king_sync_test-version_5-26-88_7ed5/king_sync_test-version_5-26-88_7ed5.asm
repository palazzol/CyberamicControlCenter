
        .area   region1 (ABS)

        .include "../../include/ptt6502.def"

        .org    0x1000

TIMER_1MS_A     = 0x0050    ; 1ms timer
TIMER_1MS_B     = 0x0051    ; 1ms timer
TIMER_1MS_C     = 0x0052    ; 1ms timer
TIMER_1MS_R     = 0x0053    ; 1ms timer, autoload to 100
TIMER_100MS_A   = 0x0054    ; 0.1s timer
TIMER_100MS_B   = 0x0055    ; 0.1s timer
TIMER_100MS_R   = 0x0056    ; 0.1s timer, autoload to 100
TIMER_10S       = 0x0057    ; 10s timer
ZEROCROSS_CTR   = 0x0058    ; zero crossing counter
TRACK_CTR       = 0x0059    ; track counter

TAPE_BYTE       = 0x005B    ; storage for incoming serial byte (& 0x7F)
SOL_MASK        = 0x005C    ; bitmask for solenoids
CURR_CHANNEL    = 0x005D    ; current channel serial byte

AGC_LEVEL       = 0x005F    ; agc mic level
AGC_ACCUM       = 0x0060    ; agc mic level accumulator
AGC_SAMPLES     = 0x0061    ; agc mic sample counter
AGC_GAIN        = 0x0062    ; agc calculated gain value
CURR_PORT       = 0x0063    ; current channel port address
TIMER_100MS_C   = 0x0064    ; 0.1s timer
RAM_65          = 0x0065    ; TBD?
RAM_66          = 0x0066    ; TBD?
RAM_67          = 0x0067    ; TBD?
RAM_68          = 0x0068    ; TBD?
RAM_69          = 0x0069    ; TBD?
;
;       IRQ handler
;
IRQ:
        pha
        lda     U18_edge_detect_control_DI_pos          ; clear PA7 flag
        lda     U19_edge_detect_control_DI_pos          ; clear PA7 flag
        lda     #0x7D                                   ; expire every 125*8=1000us=1ms
        sta     U18_1D                                  ; div by 8, enable interrupt
        lda     TIMER_1MS_A                             ; 1ms timer
        beq     L1012
        dec     TIMER_1MS_A
L1012:
        lda     TIMER_1MS_B                             ; 1ms timer
        beq     L1018
        dec     TIMER_1MS_B
L1018:
        lda     TIMER_1MS_C                             ; 1ms timer
        beq     L101E
        dec     TIMER_1MS_C
L101E:
        dec     TIMER_1MS_R
        bne     L1046
        lda     #0x64
        sta     TIMER_1MS_R
        lda     TIMER_100MS_A
        beq     L102C
        dec     TIMER_100MS_A
L102C:
        lda     TIMER_100MS_C
        beq     L1032
        dec     TIMER_100MS_C
L1032:
        lda     TIMER_100MS_B
        beq     L1038
        dec     TIMER_100MS_B
L1038:
        dec     TIMER_100MS_R
        bne     L1046
        lda     #0x64
        sta     TIMER_100MS_R
        lda     TIMER_10S
        beq     L1046
        dec     TIMER_10S
L1046:
        pla
        rti
;
;       Main Program Start
;
RESET:
        cld                                             ; No decimal mode
        sei                                             ; Interrupts are not used
        ldx     #0xF0                                   ; Stack is at 0x01F0
        txs
        lda     #0x00                                   ; Clear RAM
        ldx     #0x10                                   ; from 0x0010 to 0x007F
ZERORAM:
        sta     0x00,x
        inx
        cpx     #0x80
        bne     ZERORAM
        lda     #0x00
        sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
        sta     transport_periph$ddr_reg_a              ; UART data inputs
        sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
        sta     audio_periph$ddr_reg_a                  ; Comparator inputs
        sta     audio_control_reg_b                     ; Clear audio control B
        sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
        sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
        sta     U18_06                                  ; ???
        sta     U19_06                                  ; ???
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
        cli
        sta     U18_1C
        lda     #0x64
        sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
        lda     #0x18
        sta     TIMER_10S                               ; Init a 4 minute timer
        lda     #0x64
        sta     TIMER_100MS_R                           ; 100 - init 0.1 sec master counter
        lda     #0x0A                                   ; 10
        sta     AGC_GAIN                                ; Set initial AGC gain value
        lda     #0x09
        sta     UART_02                                 ; ???
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #0x28                                   ; this will count 4 seconds
        sta     TIMER_100MS_A
        lda     #0x64                                   ; reset master timer
        sta     TIMER_1MS_R
$1:
        lda     TIMER_100MS_A                           ; do not much for 4 seconds
        bne     $1
        jsr     INITBRDS
REWIND:
        lda     #0xFA
        sta     TIMER_100MS_C
        lda     #0x00
        sta     RAM_65
        sta     RAM_66
        lda     #0x30
        lda     #TAPEMODE_REWIND
        jsr     TAPECMD                                 ; REWIND tape
$22:
        lda     #0x00
        sta     ZEROCROSS_CTR                           ; counter to zero
$3:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     TIMER_1MS_A                             ; set a 10ms timer
        inc     ZEROCROSS_CTR                           ; count transitions
        lda     ZEROCROSS_CTR
        cmp     #0x64
        bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
$4:
        jsr     L13ED
        lda     TIMER_1MS_A
        beq     $22
        lda     transport_control_reg_b
        bpl     $4
        jmp     $3

;
FINDTRK:
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD                                 ; FFWD tape
        lda     #0x19
        sta     TIMER_100MS_A                           ; 2.5 secs
        lda     #0x64
        sta     TIMER_1MS_R
$5:
        jsr     L13ED
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
        jsr     L13ED
        lda     TIMER_1MS_A
        bne     $30                                     ; delay for 250 ms
        lda     #TAPEMODE_FFWD
        jsr     TAPECMD
        jsr     WAITTONE                                ; wait for tone signaling beginning of track
        inc     TRACK_CTR
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD                                 ; PLAY tape
        jsr     WAITCD                                  ; wait for carrier
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP Tape


L1147:
        lda     #0x5E
        sta     RAM_69
        lda     #0x13
        sta     0x6A                                    ; set address to 0x135E?
        jsr     AGCUPD
        jsr     L13ED
        jsr     L12D3
        lda     UART_02
        and     #0x05
        beq     L1182
        lda     0x67
        bne     L116F
        lda     UART_01
        cmp     #0x53                                   ; 'S' - start command?
       bne     L1182
        inc     0x67
        jmp     L1182
L116F:
        lda     #0x00
        sta     RAM_67
        lda     UART_01
        cmp     #0x31                                   ; '1' - 2nd byte startplay command?
        beq     STARTPLAY
        cmp     #0x32                                   ; '2' - 2nd byte lights command?
        beq     L1188
        cmp     #0x33                                   ; '3' - 2nd byte lights command?
        beq     L119D
L1182:
        jmp     L1147
        jmp     REWIND
; lights to all ones
L1188:
        lda     #0xFF
        sta     board_7_periph$ddr_reg_a
        sta     board_7_periph$ddr_reg_b
        sta     board_8_periph$ddr_reg_a
        sta     board_8_periph$ddr_reg_b
        sta     U18_PORTB
        lda     #0x02
        sta     U19_PORTA
        jmp     L1147
; lights to all zeros
L119D:
        lda     #0x00
        sta     board_7_periph$ddr_reg_a
        sta     board_7_periph$ddr_reg_b
        sta     board_8_periph$ddr_reg_a
        sta     board_8_periph$ddr_reg_b
        sta     U18_PORTB
        sta     U19_PORTA
        jmp     L1147

;   we have been started!
STARTPLAY:
        jsr     INITBRDS
        lda     #0x5C
        sta     RAM_69
        lda     #0x13
        sta     0x6A                                    ; set address to 0x1362?
        lda     #0x00
        sta     U19_PORTA                               ; turn off RESET button light
        lda     #0xA0
        sta     U18_PORTB                               ; turn off some lights - TBD
        lda     #TAPEMODE_PLAY
        jsr     TAPECMD                                 ; PLAY tape
        jsr     WAITCD                                  ; wait for carrier
        jsr     PLAYTRK                                 ; play a track!
        jsr     INITBRDS                                ; init the boards
        lda     #0x80
        sta     U18_PORTB                               ; turn off all but PROG light
        inc     TRACK_CTR                               ; track counter
        lda     TRACK_CTR
        cmp     #0x1A                                   ; 26?
        bcc     NEXTTRK
        jmp     REWIND                                  ; rewind the tape after the total number of tracks are done

NEXTTRK:
        lda     #0x00
        sta     RAM_65
        sta     RAM_66
        lda     #0xFA
        sta     TIMER_100MS_C
        jsr     WAITCD                                  ; wait for carrier
        lda     #TAPEMODE_STOP
        jsr     TAPECMD                                 ; STOP tape
        jsr     AGCMICRD                                ; Read the AGC mic level
        jmp     L1147
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
        sta     CURR_CHANNEL                            ; reset current channel serial byte
        sta     CURR_PORT                               ; reset current channel port address
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
        jsr     L13ED                               ; check for PROG button push??
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
        jsr     L13ED
        lda     TIMER_1MS_A
        beq     WAITTONE                                ; 10 msec done yet? then loop
        lda     transport_control_reg_b                 ; transport CB1 rising edge?
        bpl     $9                                      ; if not, extend the looping
        jmp     $8      

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
        jsr     L13ED
        lda     TIMER_1MS_A
        bne     $11

; Wait for 160ms of consecutive zero crossings
$12:
        jsr     L13ED
        lda     transport_periph$ddr_reg_b
        ror
        bcc     $12
        lda     #0xA0                                   ; 160 msec
        sta     TIMER_1MS_A


$13:
        jsr     L13ED
        lda     transport_periph$ddr_reg_b
        ror
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
        jsr     L12D3                                   ; ??? Unknown UART routine
        jsr     AGCUPD
        lda     transport_control_reg_a                 ; Did we get a byte?
        bpl     $14                                     ; No, loop
        jsr     PROTOHAND                               ; Yes, Process Incoming Byte
        jmp     $14

;       Lost carrier - wait 100 msec for more data before giving up
LOSTCD:
        lda     #0x64                                   ; 100 msec
        sta     TIMER_1MS_A
$15:
        lda     transport_periph$ddr_reg_b
        lsr
        bcs     PLAYTRK
        lda     TIMER_1MS_A
        bne     $15
        rts
;
;   TBD - Unknown UART routine
;
L12D3:
        lda     UART_02
        and     #0x02
        beq     L12F2
        lda     RAM_68
        bne     L12E7
        ldy     #0x00
        lda     [RAM_69],y
        inc     RAM_68
        jmp     L12EF
L12E7:
        lda     #0x00
        sta     RAM_68
        ldy     #0x01
        lda     [RAM_69],y
L12EF:
        sta     UART_01
L12F2:
        rts
;
; Protocol handler
;
PROTOHAND:
        lda     transport_periph$ddr_reg_a
PROCBYTE:
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
        cmp     #0x4F                                   ; is it >= 0x4F?
        bcs     $18                                     ; ignore it
        ldx     CURR_PORT                               ; X = current board address
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
        .byte   0x01,0x02,0x04,0x08
        .byte   0x10,0x20,0x40,0x80
;
; This table is referenced by UART code
        .byte   0x4D,0x31                               ; M1
        .byte   0x4D,0x32                               ; M2
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
        jsr     L13ED                                   ; housekeeping
        lda     TIMER_100MS_A
        bne     $23                                     ; if 1 sec, do housekeeping
        lda     #0x0A
        sta     TIMER_100MS_A
        lda     #0x64
        sta     TIMER_1MS_R                             ; reset timer
        lda     AGC_SAMPLES
        cmp     #0x08                                   ; 8 samples?
        beq     $27
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
;       Process RAM_65 and RAM_66
;
L13ED:
        lda     RAM_65
        tax
        lda     RAM_66
        bne     L142B
        lda     X1459,x
        cmp     #0xFE
        beq     L1422
        cmp     #0xFF
        bne     L140A
        lda     #0x00
        sta     RAM_65
        lda     #0xFA
        sta     TIMER_100MS_C
        jmp     L1421


L140A:
        cmp     TIMER_100MS_C
        bne     L1421
        lda     X1459+1,x
        jsr     PROCBYTE
        lda     X1459+2,x
        jsr     PROCBYTE
        lda     RAM_65
        clc
        adc     #0x03
        sta     RAM_65

L1421:
        rts

L1422:
        inc     RAM_66
        lda     #0x00
        sta     RAM_65
        jmp     L1421

L142B:
        lda     X1543,x
        cmp     #0xFF
        bne     L143F
        lda     #0x00
        sta     RAM_65
        sta     RAM_66
        lda     #0xFA
        sta     TIMER_100MS_C
        jmp     L1421

L143F:
        cmp     TIMER_100MS_C
        bne     L1421
        lda     X1543+1,x
        jsr     PROCBYTE
        lda     X1543+2,x
        jsr     PROCBYTE
        lda     RAM_65
        clc
        adc     #0x03
        sta     RAM_65
        jmp     L1421

X1459:
        .byte   0xF5,0x35,0x46, 0xF5,0x35,0x46, 0xEE,0x35,0x46, 0xEB,0x33,0x46 
        .byte   0xE9,0x32,0x46, 0xE9,0x33,0x42, 0xE8,0x33,0x46, 0xE7,0x32,0x46
        .byte   0xE6,0x33,0x46, 0xE5,0x32,0x46, 0xE4,0x33,0x46, 0xE3,0x32,0x46
        .byte   0xE2,0x33,0x46, 0xE1,0x32,0x46, 0xE0,0x33,0x46, 0xDF,0x32,0x46
        .byte   0xDE,0x33,0x46, 0xDD,0x32,0x46, 0xDD,0x34,0x46, 0xDC,0x33,0x46
        .byte   0xDB,0x32,0x46, 0xDB,0x35,0x46, 0xDA,0x33,0x46, 0xD9,0x32,0x46
        .byte   0xD1,0x32,0x42, 0xC6,0x33,0x47, 0xC6,0x33,0x43, 0xC5,0x32,0x47
        .byte   0xC3,0x34,0x46, 0xC2,0x33,0x47, 0xC1,0x32,0x47, 0xC0,0x35,0x46
        .byte   0xB9,0x34,0x46, 0xB9,0x32,0x43, 0xB7,0x35,0x46, 0xB7,0x33,0x42
        .byte   0xB3,0x33,0x46, 0xB2,0x32,0x46, 0xA8,0x32,0x42, 0x9D,0x33,0x47
        .byte   0x9C,0x32,0x47, 0x9B,0x33,0x47, 0x9A,0x32,0x47, 0x9A,0x34,0x46
        .byte   0x99,0x33,0x47, 0x99,0x33,0x43, 0x99,0x35,0x46, 0x98,0x32,0x47
        .byte   0x97,0x33,0x47, 0x94,0x32,0x47, 0x93,0x33,0x47, 0x92,0x32,0x47
        .byte   0x91,0x33,0x47, 0x90,0x32,0x47, 0x87,0x33,0x42, 0x86,0x32,0x43
        .byte   0x7D,0x33,0x46, 0x7C,0x32,0x46, 0x77,0x32,0x42, 0x77,0x34,0x46
        .byte   0x75,0x32,0x43, 0x75,0x35,0x46, 0x6A,0x33,0x46, 0x69,0x32,0x46
        .byte   0x67,0x33,0x46, 0x66,0x32,0x46, 0x66,0x32,0x43, 0x65,0x34,0x46
        .byte   0x62,0x35,0x46, 0x62,0x33,0x42, 0x56,0x33,0x46, 0x55,0x32,0x46
        .byte   0x55,0x32,0x42, 0x54,0x33,0x46, 0x53,0x32,0x46, 0x52,0x33,0x46
        .byte   0x51,0x32,0x46, 0xFE,0xFE,0xFE
X1543:
        .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        
        .org    0x1FFA
        ;
        ; vectors
        ;
NMIVEC:
        .dw     0xFFFF
RESETVEC:
        .dw     RESET
IRQVEC:
        .dw     IRQ