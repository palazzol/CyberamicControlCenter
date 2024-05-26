
        .area   region1 (ABS)

;
;       Pizza Time Theatre
;       The Beagles/King Program
;       Version Unknown
;
;       This image was recovered from an unmarked 2708
;

; start of RAM
RAM_start = 0x0000

RAM_50    = 0x0050
RAM_51    = 0x0051
RAM_52    = 0x0052
RAM_53    = 0x0053
RAM_54    = 0x0054
RAM_55    = 0x0055
RAM_56    = 0x0056
RAM_57    = 0x0057
RAM_58    = 0x0058
RAM_59    = 0x0059
RAM_5A    = 0x005A
RAM_5B    = 0x005B
RAM_5C    = 0x005C
RAM_5D    = 0x005D
RAM_5E    = 0x005E
RAM_5F    = 0x005F

RAM_64    = 0x0064

        .include "../include/ptt6502.def"

        .org     0x1C00
;
RESET:
        cld
        sei                                             ; no decimal mode
        ldx     #0xF0                                   ; interrupts are not used
        txs                                             ; stack is at 0x01F0
        lda     #0x00                                   ; Clear and Test RAM 
        ldx     #0x10                                   ; from 0x0010 to 0x007F
L1C09:
        sta     RAM_start,x
        inx
        cpx     #0x80
        bne     L1C09
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
        lda     #0x64
        sta     RAM_56                                  ; 100 - init a 1000 sec = 16 min counter?
        lda     #0xF0
        sta     audio_periph$ddr_reg_b                  ; DAC08 outputs - upper 4 bits only?
        sta     U19_PORTB                               ; turn on CPU LEDs 5-8
        lda     #0x10
        jsr     L1D60                                   ; STOP tape
        lda     #0x28                                   ; this will count 4 seconds
        sta     RAM_54
        lda     #0x64                                   ; reset master timer
        sta     RAM_53
L1C6C:
        jsr     L1E72                                   ; do not much for 4 seconds
        lda     RAM_54
        bne     L1C6C
L1C73:
        lda     #0x40
        jsr     L1D74                                   ; REWIND tape
L1C78:
        lda     #0x00
        sta     RAM_58                                  ; counter to zero
L1C7C:
        jsr     L1E72                                   ; housekeeping
        lda     transport_control_reg_b                 ; loop until we see tone marking beginning of tape
        bpl     L1C7C
        lda     #0x06
        sta     RAM_54                                  ; set 0.6 second timer
        lda     #0x64                                   ; 100 rising edge transitions
        sta     RAM_53
L1C8C:
        jsr     L1E72                                   ; housekeeping
        lda     transport_control_reg_b                 ; loop until 100 transport CB1 rising edges or 0.6 secs expired
        bpl     L1C9F
        inc     RAM_58                                  ; count transistions
        lda     transport_periph$ddr_reg_b
        lda     RAM_58
        cmp     #0x64
        bcs     L1CAA                                   ; happened 100 times, tape is at the beginning, jump ahead
L1C9F:
        lda     RAM_54
        bne     L1C8C
        jmp     L1C78
; unused instructions start
        cmp     #0x60
        bcc     L1CAA
; unused instructions end
;
L1CAA:
        lda     #0x20
        jsr     L1D74                                   ; FFWD tape
        lda     #0x19
        sta     RAM_54                                  ; for 2.5 secs
        lda     #0x64
        sta     RAM_53
L1CB7:
        jsr     L1E72                                   ; do housekeeping stuff
        lda     RAM_54
        bne     L1CB7
        lda     #0x00
        sta     RAM_59
        jsr     L1D83                                   ; look for start of data??
        inc     RAM_59
        lda     #0x10
        jsr     L1D60                                   ; STOP tape
        lda     #0x80
        jsr     L1D60                                   ; PLAY tape
        jsr     L1DA6                                   ; go up to carrier?
        lda     #0x10
        jsr     L1D60                                   ; STOP Tape
        jsr     L1D33                                   ; init the boards and audio to stopped
        lda     #0x00
        sta     RAM_5A                                  ; set state to not playing
L1CE0:
        jsr     L1E72                           
        lda     RAM_5A                                  ; wait until we are triggered
        bne     L1CF4                                   ; then jump
        lda     #0x02                                   ; else
        sta     U19_PORTA                               ; turn on RESET button light
        lda     #0x00
        sta     U18_PORTB                               ; turn on all other button lights
        jmp     L1CE0
;   we have been started!
L1CF4:
        jsr     L1D33                                   ; init the boards and audio to stopped
        lda     #0x00
        sta     U19_PORTA                               ; turn off RESET button light
        lda     #0x80
        sta     U18_PORTB                               ; turn off all but PROG light
        lda     #0x80
        jsr     L1D60                                   ; PLAY tape
        jsr     L1DA6                                   ; go up to carrier?
        dec     RAM_5A                                  ; no longer triggered
        jsr     L1DCC                                   ; play a track!
        jsr     L1D33                                   ; init the boards and audio to stopped
        lda     #0x30
        sta     RAM_56                                  ; 8 minute timer?
        lda     #0x64
        sta     RAM_55
        inc     RAM_59                                  ; track counter
        lda     RAM_59
        cmp     #0x1A                                   ; 26?
        bcc     L1D24
        jmp     L1C73                                   ; rewind the tape after the total number of tracks are done
;
L1D24:
        jsr     L1DA6                                   ; go up to carrier?
        lda     #0x10
        jsr     L1D60                                   ; STOP tape
        lda     #0x00
        sta     RAM_5A                                  ; no longer triggered
        jmp     L1CE0
;
L1D33:
        lda     #0x3C
        sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
        lda     #0x34
        sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
        ldx     #0x00
L1D3F:
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
        bcc     L1D3F
        rts
;
;       Send Transport command for 0.255 sec
;       and then unassert it
;       (Used for STOP and PLAY)
;
L1D60:
        sta     transport_periph$ddr_reg_b              ; enable output line
        lda     #0xFF
        sta     RAM_50
L1D67:
        jsr     L1E72                                   ; check for PROG button push
        lda     RAM_50
        bne     L1D67
        lda     #0x00
        sta     transport_periph$ddr_reg_b
        rts
;
;       Send Transport command for 0.250 sec
;       and keep it asserted on return
;       (Used for Rewind and FFwd)
;
L1D74:
        sta     transport_periph$ddr_reg_b
        lda     #0xFA
        sta     RAM_50
L1D7B:
        jsr     L1E72
        lda     RAM_50
        bne     L1D7B
        rts
;
;       Look for header / start of data?
;
L1D83:
        lda     #0x00
        sta     RAM_58
L1D87:
        lda     transport_periph$ddr_reg_b
        lda     #0x0A
        sta     RAM_50                                  ; 10 msec
        inc     RAM_58
        lda     RAM_58
        cmp     #0x21                                   ; wait for 330 msec?
        bcs     L1DA5                                   ; timeout - exit
L1D96:
        jsr     L1E72                                   ; housekeeping
        lda     RAM_50
        beq     L1D83                                   ; 10 msec done yet? then loop
        lda     transport_control_reg_b                 ; transport CB1 rising edge?
        bpl     L1D96                                   ; if so, extend the looping
        jmp     L1D87                                   ; else loop but keep timeout going
L1DA5:
        rts
;
L1DA6:
        lda     #0xFA
        sta     RAM_50                                  ; 250 msec
L1DAA:
        jsr     L1E72                                   ; housekeeping
        lda     RAM_50
        bne     L1DAA
L1DB1:
        jsr     L1E72
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1DB1
        lda     #0xA0                                   ; 160 msec
        sta     RAM_50
L1DBE:
        jsr     L1E72
        lda     transport_periph$ddr_reg_b
        ror     a
        bcc     L1DB1
        lda     RAM_50
        bne     L1DBE
        rts
;
L1DCC:
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
L1DE3:
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcc     L1DF7                                   ; b0=0, no carrier, exit
        jsr     L1E72                                   ; housekeeping
        lda     transport_control_reg_a                 ; Did we get a byte?
        bpl     L1DE3                                   ; No, loop
        jsr     L1E09                                   ; Yes, Process Incoming Byte 
        jmp     L1DE3
;
L1DF7:
        lda     #0x64                                   ; 100 msec
        sta     RAM_50
L1DFB:
        jsr     L1E72
        lda     transport_periph$ddr_reg_b
        lsr     a
        bcs     L1DCC                                   ; carrier 
        lda     RAM_50
        bne     L1DFB
        rts
;
; Protocol handler
;
L1E09:
        lda     transport_periph$ddr_reg_a
        and     #0x7F                                   ; insure data is ASCII
        sta     RAM_5C                                  ; store it here
        and     #0x7E                                   ; ignore bottom bit
        cmp     #0x22                                   ; is it 0x22 or 0x23?
        beq     L1E50                                   ; if so, process as channel
        cmp     #0x32                                   ; is it < 0x32 ?
        bcc     L1E69                                   ; ignore it
        cmp     #0x3A                                   ; is it < 0x3A
        bcc     L1E50                                   ; process as channel (0x32 to 0x39)
        lda     RAM_5C
        cmp     #0x41                                   ; is it < 0x41?
        bcc     L1E69                                   ; ignore it
        cmp     #0x51                                   ; is it >= 0x51?
        bcs     L1E69                                   ; ignore it
        ldx     RAM_64                                  ; X = current board address
        sec                                             ; (it's 0x42 to 0x50)
        sbc     #0x41                                   ; subtract 0x41
        cmp     #0x08
        bcc     L1E33                                   ; process as command
        inx
        inx
L1E33:
        and     #0x07                                   ; lookup bitmask in A
        tay
        lda     X1E6A,y
        sta     RAM_5D                                  ; store mask in RAM_5D
        lda     RAM_5E
        lsr     a                                       ; get on/off in carry
        bcs     L1E49                                   ; if on, jump
        lda     RAM_5D
        eor     #0xFF
        and     RAM_start,x
        sta     RAM_start,x                             ; turn off solenoid
        rts
;
L1E49:
        lda     RAM_5D
        ora     RAM_start,x
        sta     RAM_start,x                             ; turn on solenoid
        rts
;
L1E50:
        lda     RAM_5C                                  ; put channel byte in RAM_5E
        sta     RAM_5E
        and     #0x7E
        cmp     #0x22
        bne     L1E5F
        lda     #0x98                                   ; process 0x22 or 0x23
        sta     RAM_64                                  ; set this to 0x98 - board 7
        rts
;
L1E5F:
        sec                                             ; process channel
        sbc     #0x32
        asl     a                               
        clc
        adc     #0x80
        sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
        rts
L1E69:
        rts
;
; bit mask table
;
X1E6A:
        .db      0x01, 0x02, 0x04, 0x08
        .db      0x10, 0x20, 0x40, 0x80
;
; RAM_50 used on entry
;
L1E72:
        lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
        sta     RAM_5F                                  ; store this state in 5F
        beq     L1EC9                                   ; No flags set, return
        lda     RAM_5B                                  ; Are we already running?
        bmi     L1E8B                                   ; yes, jump ahead
        lda     RAM_5F                                  ; else check flags                                  
        and     #0x40                                   ; PROG pushed?
        beq     L1E99                                   ; if not, go to AGC
        lda     #0x80
        sta     RAM_5B                                  ; now we are running!
        lda     #0xFA
        sta     RAM_51                                  ; 
L1E8B:
        lda     RAM_51
        bne     L1E95
        lda     #0x00
        sta     RAM_5B                                  ; we are stopped
        inc     RAM_5A
L1E95:
        lda     RAM_5F                                  ; check timer irq bit
        bpl     L1EC9                                   ; if timer not expired, return
L1E99:
        lda     U18_timer                               ; read timer in U18
        eor     #0xFF                                   ; flip the bits
        lsr     a                                       ; keep the top 5 bits
        lsr     a
        lsr     a
        sta     RAM_57                                  ; store them
        bcc     L1EA7                                   ; bcc on timer bit D2
        inc     RAM_57                                  ; round up?
                                                        ; now RAM_57 has the number of 8us 
                                                        ;   intervals since timer expired
L1EA7:
        lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
        sec                                             ; with programming delays, this is 1 msec
        sbc     RAM_57
        sta     U18_timer_8T_DI                         ; set timer
        dec     RAM_50                                  ; decrement these timers every timer reset
        dec     RAM_51
        dec     RAM_52
        dec     RAM_53
        bne     L1EC9                                   ; if timer RAM_53 expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     RAM_53
        dec     RAM_54
        dec     RAM_55                                  
        bne     L1EC9                                   ; if timer RAM_55 expires, then wrap to 100
        lda     #0x64                                   ; 100
        sta     RAM_55
        dec     RAM_56
L1EC9:
        rts
;
; AGC table, unused
;
        .db      0x03, 0x04, 0x06, 0x08
        .db      0x10, 0x16, 0x20, 0x2D
        .db      0x40, 0x5A, 0x80, 0xBF
        .db      0xFF, 0xFF, 0xFF, 0xFF
;
; all zeros in this gap
;
        .org    0x1FFA
;
; vectors
;
NMIVEC:
        .dw      RAM_start
RESETVEC:
        .dw      RESET
IRQVEC:
        .dw      RAM_start
