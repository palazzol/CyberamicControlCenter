
;;;;;;;;;;;;;;;;;;;;;
; Cyberstar v1.6
;   by
; David B. Philipsen
;
; Reverse-engineering
;   by
; Frank Palazzolo
;;;;;;;;;;;;;;;;;;;;;

; 68HC11 Register definitions

PORTA       .equ    0x1000
DDRA        .equ    0x1001
PORTG       .equ    0x1002
DDRG        .equ    0x1003
PORTE       .equ    0x100a
TOC1        .equ    0x1016
TOC2        .equ    0x1018
TMSK1       .equ    0x1022
TFLG1       .equ    0x1023
TMSK2       .equ    0x1024
BAUD        .equ    0x102b
SCCR1       .equ    0x102c
SCCR2       .equ    0x102d
SCSR        .equ    0x102e
SCDR        .equ    0x102f
BPROT       .equ    0x1035
PPROG       .equ    0x103b
CSSTRH      .equ    0x105c
CSCTL       .equ    0x105d
CSGADR      .equ    0x105e
CSGSIZ      .equ    0x105f

; Constants
CHKSUM      .equ    0x197B

; RAM locations

T1NXT       .equ    0x0010      ; 0x0010/0x0011

; if not zero, these are decremented every 0.1 second by the timer 
CDTIMR1     .equ    0x001b      ; 0x001b/0x001c
CDTIMR2     .equ    0x001d      ; 0x001d/0x001e
CDTIMR3     .equ    0x001f      ; 0x001f/0x0020
CDTIMR4     .equ    0x0021      ; 0x0021/0x0022
CDTIMR5     .equ    0x0023      ; 0x0023/0x0024

T30MS       .equ    0x0027      ; used to count t1 irqs for 30ms tasks

; offset counters
OFFCNT1     .equ    0x0070
OFFCNT2     .equ    0x0071
OFFCNT3     .equ    0x0072
OFFCNT4     .equ    0x0073
OFFCNT5     .equ    0x0074

; bottom bit counts every other T1OC
TSCNT       .equ    0x00B0

; NVRAM locations

;           .equ    0x0400          ; 0x07 - CPU test at boot, others?
;           .equ    0x0401          ; Rnd bits? (clears to 0x00)
;           .equ    0x0402-0x0404   ; Reg digits (BCD)
;           .equ    0x0405-0x0407   ; Liv digits (BCD)
;           .equ    0x0408          ; 0x39 (rts) for CPU test?

CPYRTCS     .equ    0x040B          ; 0x040B/0x040C - copyright message checksum
;           .equ    0x040D-0x040E   ; some counter? (600/65000?)
ERASEFLG    .equ    0x040F          ; 0 = normal boot, 1 = erasing EEPROM
;           .equ    0x0410-0x0411   ; some counter
;           .equ    0x0412-0x0413   ; some counter
;           .equ    0x0414-0x0415   ; counter - number of bad code validations
;           .equ    0x0416-0x0417   ; counter - number of good code validations
;           .equ    0x0418-0x0419   ; some counter
;           .equ    0x041A-0x041B   ; some counter

;           .equ    0x0420-0x0421   ; some counter
;           .equ    0x0422-0x0423   ; some counter
;           .equ    0x0424-0x0425   ; some counter
NUMBOOT     .equ    0x0426          ; counter - number of boots (0x0426/0x0427)

;           .equ    0x042A          ; King enable (bit 0?)
;           .equ    0x042B          ; other Rnd? (clears to 0x00)
;           .equ    0x042C-0x45B?   ; clears to 0xFF (revalid tapes?)
;                                   ; relates to 0x0299-0x29B?
;           .equ    0x045C          ; 00 from F7C0 stored here, R12/CNR?

;           .equ    0x0500-0x057F   ; LCD buffer: 32, 4-byte entries

;           .equ    0x0590-0x0598   ; buffer?
;           .equ    0x05A0-         ; buffer?

;           .equ    0x2000-         ; STUDIO - programming mode ?
;           .equ    0x3000-         ; ???

; EEPROM locations

;           .equ    0x0E00-0x0E0B   ; signature?

;           .equ    0x0E20-0x0E24   ; 4 bcd digit serial number + 0xDB

; Main PIA on CPU card
PIA0PRA     .equ    0x1804      ; CRA-2 = 1
PIA0DDRA    .equ    0x1804      ; CRA-2 = 0
PIA0CRA     .equ    0x1805
PIA0PRB     .equ    0x1806      ; CRB-2 = 1
PIA0DDRB    .equ    0x1806      ; CRB-2 = 0
PIA0CRB     .equ    0x1807

; Zilog 8530 SCC - A is aux serial, B is sync data
SCCCTRLB    .equ    0x180C
SCCCTRLA    .equ    0x180D
SCCDATAB    .equ    0x180E
SCCDATAA    .equ    0x180F

        .area   region1 (ABS)
        .org    0x8000

; Disassembly originally from unidasm

L8000:
        jmp     L8050           ; jump past copyright message

CPYRTMSG:
        .ascii  'Copyright (c) 1993 by David B. Philipsen Licensed by ShowBiz Pizza Time, Inc.'

L8050:
        sei

        ldd     NUMBOOT         ; increment boot cycle counter?
        addd    #0x0001
        std     NUMBOOT

        ldx     #TASK2          ;
        stx     (0x01CE)        ; store this vector here?
        clr     (0x01C7)        ; clear this vector?
        ldd     #0x01C6         ;
        std     (0x013E)        ; store this vector here? Some sort of RTI setup
        clr     TSCNT
        clr     (0x004E)
        clr     (0x00B6)
        clr     (0x004D)
        ldaa    #0x03           ; ddr mode, enable CA1 L->H irq on
        staa    (0x10A8)        ;   board 11
        ldy     #0x0080         ; delay loop
L807E:
        dey
        bne     L807E
        ldaa    #0x11           ; ddr mode, enable CA1 H->L irq on
        staa    (0x10A8)        ;   board 11

        ldab    #0x10
        jsr     DIAGDGT         ; blank the diag display

        ldaa    PIA0PRA         ; turn off reset button light
        anda    #0xBF
        staa    PIA0PRA 
        ldaa    #0xFF
        staa    (0x00AC)        ; diagnostic indicator (all off)

        jsr     L86C4           ; Reset boards 1-10
        jsr     L99A6           ; do some stuff with diag digit??
        jsr     L8C3C           ; reset LCD?
        jsr     L87E8           ; SCC - init aux serial
        jsr     L87BC           ; SCC - init sync data
        jsr     L8C7E           ; reset LCD buffer
        jsr     L8D29           ; some LCD command? (0C?)
        jsr     L8BC0           ; setup Timer/SWI handlers
        jsr     L8BEE           ; ??? redundant?
        cli
        jsr     LA25E           ; compute and store copyright checksum
        ldaa    ERASEFLG
        cmpa    #0x01           ; 1 means erase EEPROM!
        bne     L80C1
        jmp     LA275           ; erase EEPROM: skipped if ERASEFLG !=1
L80C1:
        ldd     CPYRTCS         ; copyright checksum
        cpd     #CHKSUM         ; check against copyright checksum value
        bne     LOCKUP          ; if fail, bye bye
        clrb
        stab    (0x0062)        ; button light buffer?
        jsr     BUTNLIT         ; turn off all button lights
        jsr     LA341           ; fire 3 bits on board 2
        ldaa    (0x0400)
        cmpa    #0x07
        beq     L811C           ; if 7, go directly to CPU test
        bcs     L8105           ; higher than 7, go to init setup, retaining L/R counts
        cmpa    #0x06
        beq     L8105           ; 6, go to init setup, retaining L/R counts
        ldd     #0x0000         ; 5 or lower...
        std     (0x040D)        ; clear 040D/040E counter
        ldd     #0x00C8         ; wait up to 2 seconds for a serial byte
        std     CDTIMR1 
L80EB:
        ldd     CDTIMR1
        beq     L80FA           ; timeout
        jsr     SERIALR
        bcc     L80EB
        cmpa    #0x44           ; if it's a 'D', do init setup + reset L/R counts
        bne     L80EB           ; else keep looping for 2 seconds
        bra     L80FF           ; go to init setup
L80FA:
        jsr     L9F1E
        bcs     LOCKUP          ; bye bye
; init setup + reset L and R counts
L80FF:
        jsr     L9EAF           ; reset L counts
        jsr     L9E92           ; reset R counts
; init setup
L8105:
        ldaa    #0x39
        staa    0x0408          ; set rts here for later CPU test
        jsr     LA1D5           ; set 0400 to 7, reprogram EE sig if needed
        jsr     LAB17           ; erase revalid tape section
        ldaa    LF7C0           ; a 00
        staa    0x045C          ; set to R12 mode?
        jmp     RESET           ; reset!

LOCKUP: jmp     LOCKUP          ; infinite loop

; CPU test?
L811C:
        clr     (0x0079)
        clr     (0x007C)
        jsr     0x0408          ; rts should be here
        jsr     (0x8013)        ; rts is here '9'
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7
        ldab    #0xDF
        jsr     L8748   
        jsr     L8791   
        jsr     L9AF7
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        clr     (0x0062)
        jsr     L99D9
        bcc     L8159           ; if carry clear, test is passed

        jsr     LCDMSG1 
        .ascis  'Invalid CPU!'

        ldaa    #0x53
        jmp     L82A4
L8157:  bra     L8157           ; infinite loop

L8159:
        jsr     LA354
        clr     (0x00AA)
        tst     (0x0000)
        beq     L8179

        jsr     LCDMSG1 
        .ascis  'RAM test failed!'

        bra     L81BD

L8179:
        jsr     LCDMSG1 
        .ascis  '32K RAM OK'

; R12 or CNR mode???
        tst     (0x045C)        ; if this location is 0, good
        bne     L8193
        ldd     #0x520F         ; else print 'R' on the far left of the first line
        jsr     L8DB5           ; display char here on LCD display
        bra     L8199
L8193:
        ldd     #0x430F         ; print 'C' on the far left of the first line
        jsr     L8DB5           ; display char here on LCD display

L8199:
        jsr     LCDMSG2 
        .ascis  'ROM Chksum='

        jsr     L975F           ; print the checksum on the LCD

        ldab    #0x02           ; delay 2 secs
        jsr     DLYSECS         ;

        jsr     L9A27           ; display Serial #
        jsr     L9ECC           ; display R and L counts
        jsr     L9B19           ; do the random motions if enabled

        ldab    #0x02           ; delay 2 secs
        jsr     DLYSECS         ;

L81BD:
        ldab    SCCR2           ; disable SCI receive data interrupts
        andb    #0xDF
        stab    SCCR2

        jsr     L9AF7           ; clear a bunch of ram
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7           ;
        jsr     L8791           ; Reset AVSEL1

        ldab    #0x00           ; turn off button lights
        stab    (0x0062)
        jsr     BUTNLIT

L81D7:
        jsr     LCDMSG1 
        .ascis  ' Cyberstar v1.6'

        jsr     LA2DF
        bcc     L81FF
        ldd     #0x520F
        jsr     L8DB5           ; display 'R' at far right of 1st line
        tst     (0x042A)
        beq     L81FF
        ldd     #0x4B0F
        jsr     L8DB5           ; display 'K' at far right of 1st line
L81FF:
        jsr     L8D03
        ldd     (0x029C)
        cpd     #0x0001
        bne     L8220

        jsr     LCDMSG2 
        .ascis  " Dave's system  "

        bra     L8267
L8220:
        cpd     #0x03E8
        blt     L8241
        cpd     #0x044B
        bhi     L8241

        jsr     LCDMSG2 
        .ascis  '   SPT Studio   '

        bra L8267

L8241:
        ldd     #0x0E0C
        std     (0x00AD)
        ldd     (0x040D)
        cpd     #0x0258         ; 600?
        bhi     L8254
        ldd     #0x0E09
        std     (0x00AD)
L8254:
        ldab    #0x29
        ldx     #0x0E00
L8259:
        ldaa    0,X
        deca
        inx
        incb
        pshx
        jsr     L8DB5           ; display char here on LCD display
        pulx
        cpx     (0x00AD)
        bne     L8259
L8267:
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        clr     (0x005B)
        clr     (0x005A)
        clr     (0x005E)
        clr     (0x0060)
        jsr     L9B19           ; do the random motions if enabled
        ldaa    (0x0060)
        beq     L8283
        jsr     LA97C
        jmp     RESET           ; reset controller
L8283:
        ldaa    PIA0PRA 
        anda    #0x06
        bne     L8292           ; skip credits if up and down are pressed?
        jsr     L9CF1           ; print credits
        ldab    #0x32
        jsr     DLYSECSBY100    ; delay 0.5 sec
L8292:
        jsr     L8E95           ; Was ENTER pressed?
        cmpa    #0x0D
        bne     L829C
        jmp     L9292           ; If so, go to diagnostics menu
L829C:
        jsr     SERIALR
        bcs     L82A4
L82A1:
        jmp     L8333
L82A4:
        cmpa    #0x44           ;'$'
        bne     L82AB
        jmp     LA366           ; go to security code & setup utility
L82AB:
        cmpa    #0x53           ;'S'
        bne     L82A1

        jsr     SERMSGW      
        .ascis  '\n\rEnter security code: '

        sei
        jsr     LA2EA
        cli
        bcs     L8331

        jsr     SERMSGW      
        .ascii '\n\rEEPROM serial number programming enabled.'
        .ascis '\n\rPlease RESET the processor to continue\n\r'

        ldaa    #0x01           ; enable EEPROM erase
        staa    ERASEFLG
        ldaa    #0xDB
        staa    (0x0007)
; need to reset to get out of this 
L8331:  bra     L8331           ; infinite loop

L8333:
        ldaa    (0x00AA)
        beq     L8349
        ldd     CDTIMR1
        bne     L8349
        ldab    (0x0062)
        eorb    #0x20
        stab    (0x0062)
        jsr     BUTNLIT 
        ldd     #0x0032
        std     CDTIMR1
L8349:
        jsr     L86A4
        bcc     L8351
        jmp     (0x8276)
L8351:
        ldab    SCCR2  
        orab    #0x20
        stab    SCCR2  
        clr     (0x00AA)
        ldab    (0x0062)
        andb    #0xDF
        stab    (0x0062)
        jsr     BUTNLIT 
        ldab    #0x02           ; delay 2 secs
        jsr     DLYSECS         ;
        ldaa    (0x007C)
        beq     L839B
        ldaa    (0x007F)
        staa    (0x004E)
        ldab    (0x0081)
        jsr     L8748   
        ldaa    (0x0082)
        bita    #0x01
        bne     L8383
        ldaa    (0x00AC)
        anda    #0xFD
        bra     L8387
L8383:
        ldaa    (0x00AC)
        oraa    #0x02
L8387:
        staa    (0x00AC)
        staa    PIA0PRB 
        ldaa    PIA0PRA 
        oraa    #0x20
        staa    PIA0PRA 
        anda    #0xDF
        staa    PIA0PRA 
        bra     L83AF
L839B:
        ldd     (0x040D)
        cpd     #0xFDE8         ; 65000?
        bhi     L83AA
        addd    #0x0001
        std     (0x040D)
L83AA:
        ldab    #0xF7           ; tape deck REWIND
        jsr     L86E7
L83AF:
        clr     (0x0030)
        clr     (0x0031)
        clr     (0x0032)
        jsr     L9B19           ; do the random motions if enabled   
        jsr     L86A4
        bcs     L83AF
        ldaa    (0x0079)
        beq     L83DB
        clr     (0x0079)
        ldaa    (0x00B5)
        cmpa    #0x01
        bne     L83D4
        clr     (0x00B5)
        ldaa    #0x01
        staa    (0x007C)
L83D4:
        ldaa    #0x01
        staa    (0x00AA)
        jmp     L9A7F
L83DB:
        jsr     LCDMSG1 
        .ascis  '   Tape start   '

        ldab    (0x0062)
        orab    #0x80
        stab    (0x0062)
        jsr     BUTNLIT 
        ldab    #0xFB           ; tape deck PLAY
        jsr     L86E7

        jsr     LCDMSG1A
        .ascis  '68HC11 Proto'

        jsr     LCDMSG2A
        .ascis  'dbp'

        ldab    #0x03           ; delay 3 secs
        jsr     DLYSECS         ;
        tst     (0x007C)
        beq     L8430
        ldab    (0x0080)
        stab    (0x0062)
        jsr     BUTNLIT 
        ldab    (0x007D)
        stab    (0x0078)
        ldab    (0x007E)
        stab    (0x108A)
        clr     (0x007C)
        bra     L844D
L8430:
        jsr     L8D03
        jsr     L9D18
        bcc     L8440
        tst     (0x00B8)
        beq     L8430
        jmp     L9A60
L8440:
        tst     (0x00B8)
        beq     L8430
        clr     (0x0030)
        clr     (0x0031)
        bra     L844D
L844D:
        ldaa    (0x0049)
        bne     L8454
        jmp     L85A4
L8454:
        clr     (0x0049)
        cmpa    #0x31
        bne     L8463
        jsr     LA326
        jsr     L8D42
        bra     L844D
L8463:
        cmpa    #0x32
        bne     L846F
        jsr     LA326
        jsr     L8D35
        bra     L844D
L846F:
        cmpa    #0x54
        bne     L847B
        jsr     LA326
        jsr     L8D42
        bra     L844D
L847B:
        cmpa    #0x5A
        bne     L849B
L847F:
        jsr     LA31E
        jsr     L8E95
        clr     (0x0032)
        clr     (0x0031)
        clr     (0x0030)
        jsr     L99A6
        ldab    (0x007B)
        orab    #0x0C
        jsr     L8748   
        jmp     L81BD
L849B:
        cmpa    #0x42
        bne     L84A2
        jmp     L983C
L84A2:
        cmpa    #0x4D
        bne     L84A9
        jmp     L9824
L84A9:
        cmpa    #0x45
        bne     L84B0
        jmp     L9802
L84B0:
        cmpa    #0x58
        bne     L84B9
        jmp     L993F
        bra     L844D
L84B9:
        cmpa    #0x46
        bne     L84C0
        jmp     L9971
L84C0:
        cmpa    #0x47
        bne     L84C7
        jmp     L997B
L84C7:
        cmpa    #0x48
        bne     L84CE
        jmp     L9985
L84CE:
        cmpa    #0x49
        bne     L84D5
        jmp     L998F
L84D5:
        cmpa    #0x53
        bne     L84DC
        jmp     L97BA
L84DC:
        cmpa    #0x59
        bne     L84E3
        jmp     L99D2
L84E3:
        cmpa    #0x57
        bne     L84EA
        jmp     L9AA4
L84EA:
        cmpa    #0x41
        bne     L8505
        jsr     L9D18
        bcs     L84FC
        clr     (0x0030)
        clr     (0x0031)
        jmp     L85A4
L84FC:
        clr     (0x0030)
        clr     (0x0031)
        jmp     L9A7F
L8505:
        cmpa    #0x4B
        bne     L8514
        jsr     L9D18
        bcs     L8511
        jmp     L85A4
L8511:
        jmp     L9A7F
L8514:
        cmpa    #0x4A
        bne     L851F
        ldaa    #0x01
        staa    (0x00AF)
        jmp     L983C
L851F:
        cmpa    #0x4E
        bne     L852E
        ldaa    (0x108A)
        oraa    #0x02
        staa    (0x108A)
        jmp     L844D
L852E:
        cmpa    #0x4F
        bne     L8538
        jsr     L9D18
        jmp     L844D
L8538:
        cmpa    #0x50
        bne     L8542
        jsr     L9D18
        jmp     L844D
L8542:
        cmpa    #0x51
        bne     L8551
        ldaa    (0x108A)
        oraa    #0x04
        staa    (0x108A)
        jmp     L844D
L8551:
        cmpa    #0x55
        bne     L855C
        ldab    #0x01
        stab    (0x00B6)
        jmp     L844D
L855C:
        cmpa    #0x4C
        bne     L8579
        clr     (0x0049)
        jsr     L9D18
        bcs     L8576
        jsr     LAAE8
        jsr     LAB56
        bcc     L8576
        jsr     LAB25
        jsr     LAB46
L8576:
        jmp     L844D
L8579:
        cmpa    #0x52
        bne     L8597
        clr     (0x0049)
        jsr     L9D18
        bcs     L8594
        jsr     LAAE8
        jsr     LAB56
        bcs     L8594
        ldaa    #0xFF
        staa    0,X
        jsr     LAAE8
L8594:
        jmp     L844D
L8597:
        cmpa    #0x44
        bne     L85A4
        clr     (0x0049)
        jsr     LABAE
        jmp     L844D
L85A4:
        tst     (0x0075)
        bne     L85FF
        tst     (0x0079)
        bne     L85FF
        tst     (0x0030)
        bne     L85BA
        ldaa    (0x005B)
        beq     L85FF
        clr     (0x005B)
L85BA:
        ldd     #0x0064
        std     CDTIMR5
L85BF:
        ldd     CDTIMR5
        beq     L85D7
        jsr     L9B19           ; do the random motions if enabled
        ldaa    PIA0PRA 
        eora    #0xFF
        anda    #0x06
        cmpa    #0x06
        bne     L85BF
        clr     (0x0030)
        jmp     L8680
L85D7:
        clr     (0x0030)
        ldab    (0x0062)
        eorb    #0x02
        stab    (0x0062)
        jsr     BUTNLIT 
        andb    #0x02
        beq     L85F4
        jsr     LAA18
        ldab    #0x1E
        jsr     DLYSECSBY100    ; delay 0.3 sec
        clr     (0x0030)
        bra     L85FF
L85F4:
        jsr     LAA1D
        ldab    #0x1E
        jsr     DLYSECSBY100    ; delay 0.3 sec
        clr     (0x0030)
L85FF:
        jsr     L9B19           ; do the random motions if enabled
        ldaa    PORTE
        anda    #0x10
        beq     L8614
        ldaa    PIA0PRA 
        eora    #0xFF
        anda    #0x07
        cmpa    #0x06
        bne     L8630
L8614:
        tst     (0x0076)
        bne     L8630
        tst     (0x0075)
        bne     L8630
        ldab    (0x0062)
        andb    #0xFC
        stab    (0x0062)
        jsr     BUTNLIT 
        jsr     LAA13
        jsr     LAA1D
        jmp     L9A60
L8630:
        tst     (0x0031)
        bne     L863C
        ldaa    (0x005A)
        beq     L8680
        clr     (0x005A)
L863C:
        ldd     #0x0064
        std     CDTIMR5
L8641:
        ldd     CDTIMR5
        beq     L8658
        jsr     L9B19           ; do the random motions if enabled
        ldaa    PIA0PRA 
        eora    #0xFF
        anda    #0x06
        cmpa    #0x06
        bne     L8641
        clr     (0x0031)
        bra     L8680
L8658:
        clr     (0x0031)
        ldab    (0x0062)
        eorb    #0x01
        stab    (0x0062)
        jsr     BUTNLIT 
        andb    #0x01
        beq     L8675
        jsr     LAA0C
        ldab    #0x1E
        jsr     DLYSECSBY100    ; delay 0.3 sec
        clr     (0x0031)
        bra     L8680
L8675:
        jsr     LAA13
        ldab    #0x1E
        jsr     DLYSECSBY100    ; delay 0.3 sec
        clr     (0x0031)
L8680:
        jsr     L86A4
        bcs     L86A1
        clr     (0x004E)
        jsr     L99A6
        jsr     L86C4           ; Reset boards 1-10
        clrb
        stab    (0x0062)
        jsr     BUTNLIT 
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7
        ldab    #0x04           ; delay 4 secs
        jsr     DLYSECS         ;
        jmp     L847F
L86A1:
        jmp     L844D
L86A4:
        jsr     L9B19           ; do the random motions if enabled
        clr     CDTIMR5
        ldaa    #0x19
        staa    CDTIMR5+1
        ldaa    PORTE
        anda    #0x80
        beq     L86B7
L86B5:
        sec
        rts

L86B7:
        ldaa    PORTE
        anda    #0x80
        bne     L86B5
        ldaa    CDTIMR5+1
        bne     L86B7
        clc
        rts

; Reset boards 1-10 at:
;         0x1080, 0x1084, 0x1088, 0x108c
;         0x1090, 0x1094, 0x1098, 0x109c
;         0x10a0, 0x10a4

L86C4:
        ldx     #0x1080
L86C7:
        ldaa    #0x30
        staa    1,X             ; 0x30 -> PIAxCRA, CA2 low, DDR
        staa    3,X             ; 0x30 -> PIAxCRB, CB2 low, DDR
        ldaa    #0xFF
        staa    0,X             ; 0xFF -> PIAxDDRA, all outputs
        staa    2,X             ; 0xFF -> PIAxDDRB, all outputs
        ldaa    #0x34
        staa    1,X             ; 0x34 -> PIAxCRA, CA2 low, PR
        staa    3,X             ; 0x34 -> PIAxCRB, CA2 low, PR
        clr     0,X             ; 0x00 -> PIAxPRA, all outputs low
        clr     2,X             ; 0x00 -> PIAxPRB, all outputs low
        inx
        inx
        inx
        inx
        cpx     #0x10A4
        ble     L86C7
        rts

; Set the tape deck to STOP, PLAY, REWIND, or EJECT
;                B =   0xFD, 0xFB,   0xF7, or  0xEF
L86E7:
        psha
        jsr     L9B19           ; do the random motions if enabled
        ldaa    (0x00AC)        ; A = diag buffer?
        cmpb    #0xFB           ; if bit 2 of B is 0 (PLAY)
        bne     L86F5
        anda    #0xFE           ; clear A bit 0 (top)
        bra     L8703
L86F5:
        cmpb    #0xF7           ; if bit 3 of B is 0 (REWIND)
        bne     L86FD
        anda    #0xBF           ; clear A bit 6 (middle)
        bra     L8703
L86FD:
        cmpb    #0xFD           ; if bit 1 of B is 0 (STOP)
        bne     L8703
        anda    #0xF7           ; clear A bit 3 (bottom)
L8703:
        staa    (0x00AC)        ; update diag display buffer
        staa    PIA0PRB         ; init bus based on A
        jsr     L873A           ; clock diagnostic indicator
        ldaa    (0x007A)        ; buffer for tape deck / av switcher?
        anda    #0x01           ; preserve a/v switcher bit
        staa    (0x007A)        ; 
        andb    #0xFE           ; set bits 7-1 based on B arg
        orab    (0x007A)        
        stab    PIA0PRB         ; put that on the bus
        jsr     L8775           ; clock the tape deck
        ldab    #0x32
        jsr     DLYSECSBY100    ; delay 0.5 sec
        ldab    #0xFE
        orab    (0x007A)        ; all tape bits off
        stab    PIA0PRB         ; unpress tape buttons
        stab    (0x007A)
        jsr     L8775           ; clock the tape deck
        ldaa    (0x00AC)
        oraa    #0x49           ; reset bits top,mid,bot
        staa    (0x00AC)
        staa    PIA0PRB 
        jsr     L873A           ; clock diagnostic indicator
        pula
        rts

; clock diagnostic indicator
L873A:
        ldaa    PIA0PRA 
        oraa    #0x20
        staa    PIA0PRA 
        anda    #0xDF
        staa    PIA0PRA 
        rts

L8748:
        psha
        pshb
        ldaa    (0x00AC)        ; update state machine at AC?
                                ;      gfedcba
        oraa    #0x30           ; set bb11bbbb
        anda    #0xFD           ; clr bb11bb0b
        bitb    #0x20           ; tst bit 5 (f)
        bne     L8756           ; 
        oraa    #0x02           ; set bit 1 (b)
L8756:
        bitb    #0x04           ; tst bit 2 (c)
        bne     L875C
        anda    #0xEF           ; clr bit 4 (e)
L875C:
        bitb    #0x08           ; tst bit 3 (d)
        bne     L8762
        anda    #0xDF           ; clr bit 5 (f)
L8762:
        staa    PIA0PRB 
        staa    (0x00AC)
        jsr     L873A           ; clock diagnostic indicator
        pulb
        stab    PIA0PRB 
        stab    (0x007B)
        jsr     L8783
        pula
        rts

; High pulse on CB2, clock bits0-4 - 4 tape deck and 1 A/V switcher bit
L8775:
        ldaa    PIA0CRB 
        oraa    #0x38           
        staa    PIA0CRB         ; CB2 High
        anda    #0xF7
        staa    PIA0CRB         ; CB2 Low
        rts

; High pulse on CA2
L8783:
        ldaa    PIA0CRA 
        oraa    #0x38
        staa    PIA0CRA         ; CA2 High
        anda    #0xF7
        staa    PIA0CRA         ; CA2 High
        rts

; AVSEL1 = 0
L8791:
        ldaa    (0x007A)
        anda    #0xFE
        psha
        ldaa    (0x00AC)
        oraa    #0x04           ; clear segment C (lower right)
        staa    (0x00AC)
        pula
L879D:
        staa    (0x007A)        
        staa    PIA0PRB 
        jsr     L8775           ; AVSEL1 = low
        ldaa    (0x00AC)
        staa    PIA0PRB 
        jsr     L873A           ; clock diagnostic indicator
        rts

L87AE:
        ldaa    (0x007A)
        oraa    #0x01
        psha
        ldaa    (0x00AC)
        anda    #0xFB
        staa    (0x00AC)
        pula
        bra     L879D

; SCC init, aux serial
L87BC:
        ldx     #L87D2
L87BF:
        ldaa    0,X
        cmpa    #0xFF
        beq     L87D1
        inx
        staa    SCCCTRLA
        ldaa    0,X
        inx
        staa    SCCCTRLA
        bra     L87BF
L87D1:
        rts

; data table for aux serial config
L87D2:
        .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
        .byte   0x01,0x00       ; irq on special condition only
        .byte   0x0c,0x18       ; Lower byte of time constant
        .byte   0x0d,0x00       ; Upper byte of time constant
        .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
        .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
        .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
        .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
        .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
        ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
        ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
        .byte   0x0f,0x00       ; end of table marker
        .byte   0xff,0xff

; SCC init, sync tape data
L87E8:
        ldx     #LF857
L87EB:
        ldaa    0,X
        cmpa    #0xFF
        beq     L87FD
        inx
        staa    SCCCTRLB
        ldaa    0,X
        inx
        staa    SCCCTRLB
        bra     L87EB
L87FD:
        bra     L8815

; data table for sync tape data config
        .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
        .byte   0x01,0x10       ; irq on all character received
        .byte   0x0c,0x18       ; Lower byte of time constant
        .byte   0x0d,0x00       ; Upper byte of time constant
        .byte   0x04,0x04       ; X1 clock mode, 8-bit sync char, 1 stop bit, no parity
        .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
        .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
        .byte   0x0b,0x01       ; ~RTxC pin is Recv/Xmit clock, ~TRxC is xmit clk
        .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
        .byte   0x0f,0x00       ; end of table marker
        .byte   0xff,0xff

; Install IRQ and SCI interrupt handlers
L8815:
        ldx     #L883E          ; Install IRQ interrupt handler
        stx     (0x0128)
        ldaa    #0x7E
        staa    (0x0127)
        ldx     #L8832          ; Install SCI interrupt handler
        stx     (0x0101)
        staa    (0x0100)
        ldaa    SCCR2           ; enable SCI receive interrupts
        oraa    #0x20
        staa    SCCR2  
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; SCI Interrupt handler, normal serial

L8832:
        ldaa    SCSR
        ldaa    SCDR
        inc     (0x0048)        ; increment bytes received
        jmp     L8862           ; handle incoming data the same from SCI or SCC

; IRQ Interrupt handler, aux serial

L883E:
        ldaa    #0x01
        staa    SCCCTRLB
        ldaa    SCCCTRLB        ; read 3 error bits
        anda    #0x70
        bne     L8869           ; if errors, jump ahead
        ldaa    #0x0A
        staa    SCCCTRLB
        ldaa    SCCCTRLB        ; read clocks missing bits
        anda    #0xC0
        bne     L8878           ; clocks missing, jump ahead
        ldaa    SCCCTRLB        ; check character available
        lsra
        bcc     L8891           ; if no char available, clear register and exit
        inc     (0x0048)        ; increment bytes received
        ldaa    SCCDATAB        ; read good data byte

; handle incoming data byte
L8862:
        jsr     SERIALW         ; echo it to serial
        staa    (0x004A)        ; store it here
        bra     L8896

; errors reading from SCC
L8869:
        ldaa    SCCDATAB        ; read bad byte
        ldaa    #0x30
        staa    SCCCTRLB        ; send error reset (Register 0)
        ldaa    #0x07
        jsr     SERIALW         ; send bell to serial
        clc
        rti

; clocks missing?
L8878:
        ldaa    #0x07
        jsr     SERIALW         ; send bell to serial
        ldaa    #0x0E
        staa    SCCCTRLB
        ldaa    #0x43
        staa    SCCCTRLB        ; send reset missing clock
        ldaa    SCCDATAB
        ldaa    #0x07
        jsr     SERIALW         ; send 2nd bell to serial
        sec
        rti

; clear receive data reg and return
L8891:
        ldaa    SCCDATAB
        clc
        rti

; Parse byte from tape
L8896:
        anda    #0x7F           ; should all be 7-bits, ignore bit 7
        cmpa    #0x24           ;'$'
        beq     L88E0           ; count it and exit
        cmpa    #0x25           ;'%'
        beq     L88E0           ; count it and exit
        cmpa    #0x20           ;' '
        beq     L88DE           ; just exit
        cmpa    #0x30           ;'0'
        bcs     L88DD           ; < 0x30, exit
        staa    (0x0012)        ; store it here
        ldaa    (0x004D)        ; check number of '$' or '%'
        cmpa    #0x02
        bcs     L88B9           ; < 2, jump ahead
        clr     (0x004D)        ; clear number of '$' or '%'
        ldaa    (0x0012)
        staa    (0x0049)        ; store the character here - character is 0x30 or higher
        bra     L88DD           ; exit
L88B9:
        tst     (0x004E)        ; is 4E 0??? (related to random motions?)
        beq     L88DD           ; if so, exit
        ldaa    #0x78           ; 120
        staa    (0x0063)        ; start 12 second timer
        staa    (0x0064)        ; reset boards before next random motion
        ldaa    (0x0012)
        cmpa    #0x40
        bcc     L88D1           ; if char >= 0x40, jump ahead
        staa    (0x004C)        ; store code from 0x30 to 0x3F here
        clr     (0x004D)        ; more code to process
        bra     L88DD           ; go to rti
L88D1:
        cmpa    #0x60       
        bcc     L88DD           ; if char >= 0x60, exit
        staa    (0x004B)        ; store code from 0x40 to 0x5F here
        clr     (0x004D)        ; more code to process
        jsr     L88E5           ; jump ahead
L88DD:
        rti

L88DE:
        bra     L88DD           ; go to rti
L88E0:
        inc     (0x004D)        ; count $ or %
        bra     L88DE           ; exit
L88E5:
        ldab    (0x004B)        
        ldaa    (0x004C)
        tst     (0x045C)        ; R12/CNR?
        beq     L88FB           ; if R12, jump ahead
        cmpa    #0x3C
        bcs     L88FB           ; if char < 0x3C, jump ahead
        cmpa    #0x3F
        bhi     L88FB           ; if char > 0x3F, jump ahead 
        jsr     L8993           ; process char (0x3C-0x3F)
        bra     L8960           ; rts
L88FB:
        cpd     #0x3048
        beq     L897A           ; turn off 3 bits on boards 1,3,4
        cpd     #0x3148
        beq     L8961           ; turn on 3 bits on boards 1,3,4
        cpd     #0x344D
        beq     L897A           ; turn off 3 bits on boards 1,3,4
        cpd     #0x354D
        beq     L8961           ; turn on 3 bits on boards 1,3,4
        cpd     #0x364D
        beq     L897A           ; turn off 3 bits on boards 1,3,4
        cpd     #0x374D
        beq     L8961           ; turn on 3 bits on boards 1,3,4
        ldx     #0x1080
        ldab    (0x004C)
        subb    #0x30
        lsrb
        aslb
        aslb
        abx
        ldab    (0x004B)
        cmpb    #0x50
        bcc     L8960           ; if char >= 0x50, return
        cmpb    #0x47           
        bls     L8936           ; if char <= 0x47, skip increments
        inx                     ; skip to port B of this PIA
        inx
L8936:
        subb    #0x40           ; 
        andb    #0x07
        clra
        sec
        rola
        tstb
        beq     L8944  
L8940:
        rola
        decb
        bne     L8940  
L8944:
        staa    (0x0050)
        ldaa    (0x004C)
        anda    #0x01
        beq     L8954
; set bit to a 1 using the mask
        ldaa    0,X
        oraa    (0x0050)
        staa    0,X
        bra     L8960
; set bit to 0 using the mask
L8954:
        ldaa    (0x0050)
        eora    #0xFF
        staa    (0x0050)
        ldaa    0,X
        anda    (0x0050)
        staa    0,X
L8960:
        rts

; turn on 3 bits on boards 1,3,4
L8961:
        ldaa    (0x1082)
        oraa    #0x01           ; board 1, PIA A, bit 0
        staa    (0x1082)
        ldaa    (0x108A)
        oraa    #0x20           ; board 3, PIA B, bit 5
        staa    (0x108A)
        ldaa    (0x108E)        ; board 4, PIA B, bit 5
        oraa    #0x20
        staa    (0x108E)
        rts

; turn off 3 bits on boards 1,3,4
L897A:
        ldaa    (0x1082)
        anda    #0xFE
        staa    (0x1082)
        ldaa    (0x108A)
        anda    #0xDF
        staa    (0x108A)
        ldaa    (0x108E)
        anda    #0xDF
        staa    (0x108E)
        rts

; process 0x3C-0x3F in CNR mode
L8993:
        pshx
        cmpa    #0x3D
        bhi     L899D           ; if char > 0x3D use second table
        ldx     #LF780          ; table at the end
        bra     L89A0           ; else use first table
L899D:
        ldx     #LF7A0          ; table at the end
L89A0:
        subb    #0x40           
        aslb
        abx
        cmpa    #0x3C
        beq     L89DC           ; board 7 - turn off A & B with table value mask 
        cmpa    #0x3D
        beq     L89B6           ; board 7 - turn on A & B with table value mask
        cmpa    #0x3E
        beq     L89FB           ; board 8 - turn off A & B with table value mask 
        cmpa    #0x3F
        beq     L89C9           ; board 8 - turn on A & B with table value mask
        pulx
        rts

; board 7 - turn on A & B with table value mask
L89B6:
        ldaa    (0x1098)
        oraa    0,X
        staa    (0x1098)
        inx
        ldaa    (0x109A)
        oraa    0,X
        staa    (0x109A)
        pulx
        rts

; board 8 - turn on A & B with table value mask
L89C9:
        ldaa    (0x109C)
        oraa    0,X
        staa    (0x109C)
        inx
        ldaa    (0x109E)
        oraa    0,X
        staa    (0x109E)
        pulx
        rts

; board 7 - turn off A & B with table value mask
L89DC:
        ldab    0,X
        eorb    #0xFF
        stab    (0x0012)
        ldaa    (0x1098)
        anda    (0x0012)
        staa    (0x1098)
        inx
        ldab    0,X
        eorb    #0xFF
        stab    (0x0012)
        ldaa    (0x109A)
        anda    (0x0012)
        staa    (0x109A)
        pulx
        rts

; board 8 - turn off A & B with table value mask
L89FB:
        ldab    0,X
        eorb    #0xFF
        stab    (0x0012)
        ldaa    (0x109C)
        anda    (0x0012)
        staa    (0x109C)
        inx
        ldab    0,X
        eorb    #0xFF
        stab    (0x0012)
        ldaa    (0x109E)
        anda    (0x0012)
        staa    (0x109E)
        pulx
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

L8A1A:
; Parse text with compressed ANSI stuff from table location in X
        pshx
L8A1B:
        ldaa    #0x04
        bita    SCCCTRLA
        beq     L8A1B  
        ldaa    0,X     
        bne     L8A29           ; if not nul, continue
        jmp     L8B21           ; else jump to exit
; process ^0123 into ESC[01;23H - ANSI Cursor positioning - (1 based)
L8A29:
        inx
        cmpa    #0x5E           ; is it a '^' ?
        bne     L8A4B           ; no, jump ahead
        ldaa    0,X             ; yes, get the next char
        inx
        staa    (0x0592)    
        ldaa    0,X     
        inx
        staa    (0x0593)
        ldaa    0,X     
        inx
        staa    (0x0595)
        ldaa    0,X     
        inx
        staa    (0x0596)
        jsr     L8B23
        bra     L8A1B  
; process @...
L8A4B:
        cmpa    #0x40           ; is it a '@' ?
        bne     L8A8A  
        ldy     0,X
        inx
        inx
        ldaa    #0x30
        staa    (0x00B1)
        ldaa    0,Y
L8A5B:
        cmpa    #0x64
        bcs     L8A66  
        inc     (0x00B1)
        suba    #0x64
        bra     L8A5B  
L8A66:
        psha
        ldaa    (0x00B1)
        jsr     L8B3B
        ldaa    #0x30
        staa    (0x00B1)
        pula
L8A71:
        cmpa    #0x0A
        bcs     L8A7C  
        inc     (0x00B1)
        suba    #0x0A
        bra     L8A71  
L8A7C:
        psha
        ldaa    (0x00B1)
        jsr     L8B3B
        pula
        adda    #0x30
        jsr     L8B3B
        bra     L8A1B
; process |...
L8A8A:
        cmpa    #0x7C           ; is it a '|' ?
        bne     L8AE7  
        ldy     0,X     
        inx
        inx
        ldaa    #0x30
        staa    (0x00B1)
        ldd     0,Y     
L8A9A:
        cpd     #0x2710
        bcs     L8AA8  
        inc     (0x00B1)
        subd    #0x2710
        bra     L8A9A  
L8AA8:
        psha
        ldaa    (0x00B1)
        jsr     L8B3B
        ldaa    #0x30
        staa    (0x00B1)
        pula
L8AB3:
        cpd     #0x03E8
        bcs     L8AC1  
        inc     (0x00B1)
        subd    #0x03E8
        bra     L8AB3  
L8AC1:
        psha
        ldaa    (0x00B1)
        jsr     L8B3B
        ldaa    #0x30
        staa    (0x00B1)
        pula
L8ACC:
        cpd     #0x0064
        bcs     L8ADA  
        inc     (0x00B1)
        subd    #0x0064
        bra     L8ACC  
L8ADA:
        ldaa    (0x00B1)
        jsr     L8B3B
        ldaa    #0x30
        staa    (0x00B1)
        tba
        jmp     L8A71
; process ~...
L8AE7:
        cmpa    #0x7E           ; is it a '~' ?
        bne     L8B03  
        ldab    0,X     
        subb    #0x30
        inx
        ldy     0,X     
        inx
        inx
L8AF5:
        ldaa    0,Y     
        iny
        jsr     L8B3B
        decb
        bne     L8AF5  
        jmp     L8A1B
; process %...
L8B03:
        cmpa    #0x25           ; is it a '%' ?
        bne     L8B1B  
        ldx     #0x0590
        ldd     #0x1B5B
        std     0,X     
        ldaa    #0x4B
        staa    2,X
        clr     3,X
        jsr     L8A1A  
        jmp     L8A1B
L8B1B:
        staa    SCCDATAA
        jmp     L8A1B
L8B21:
        pulx
        rts

; generate cursor positioning code
L8B23:
        pshx
        ldx     #0x0590
        ldd     #0x1B5B
        std     0,X     
        ldaa    #0x48           ;'H'
        staa    7,X
        ldaa    #0x3B           ;';'
        staa    4,X
        clr     8,X
        jsr     L8A1A           ;012345678 - esc[01;23H;
        pulx
        rts

;
L8B3B:
        psha
L8B3C:
        ldaa    #0x04
        bita    SCCCTRLA
        beq     L8B3C
        pula
        staa    SCCDATAA
        rts

L8B48:
        jsr     LA32E

        jsr     LCDMSG1 
        .ascis  'Light Diagnostic'

        jsr     LCDMSG2 
        .ascis  'Curtains opening'

        ldab    #0x14
        jsr     DLYSECSBY2      ; delay 10 sec
        ldab    #0xFF
        stab    (0x1098)
        stab    (0x109A)
        stab    (0x109C)
        stab    (0x109E)
        jsr     BUTNLIT 
        ldaa    PIA0PRA 
        oraa    #0x40
        staa    PIA0PRA 

        jsr     LCDMSG1 
        .ascis  ' Press ENTER to '

        jsr     LCDMSG2 
        .ascis  'turn lights  off'

L8BB5:
        jsr     L8E95
        cmpa    #0x0D
        bne     L8BB5  
        jsr     LA341
        rts

; setup IRQ handlers!
L8BC0:
        ldaa    #0x80
        staa    TMSK1
        ldx     #LABCC
        stx     (0x0119)        ; setup T1OC handler
        ldx     #LAD0C

        stx     (0x0116)        ; setup T2OC handler
        ldx     #LAD0C
        stx     (0x012E)        ; doubles as SWI handler
        ldaa    #0x7E
        staa    (0x0118)
        staa    (0x0115)
        staa    (0x012D)
        clra
        clrb
        std     CDTIMR1         ; Reset all the countdown timers
        std     CDTIMR2
        std     CDTIMR3
        std     CDTIMR4
        std     CDTIMR5

L8BEE:
        ldaa    #0xC0
        staa    TFLG1
        rts

L8BF4:
        ldaa    PORTE
        eora    #0xFF
        tab
        stab    (0x0062)
        jsr     BUTNLIT 
        bra     L8BF4  
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Delay B seconds, with random motions if enabled
DLYSECS:
        psha
        ldaa    #0x64
        mul
        std     CDTIMR5         ; store B*100 here
L8C08:
        jsr     L9B19           ; do the random motions if enabled
        ldd     CDTIMR5
        bne     L8C08  
        pula
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Delay 1 minute, with random motions if enabled - unused?
DLY1MIN:
        psha
        ldaa    #0x3C
L8C14:
        staa    (0x0028)
        ldab    #0x01           ; delay 1 sec
        jsr     DLYSECS         ;
        ldaa    (0x0028)
        deca
        bne     L8C14  
        pula
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Delay by B hundreths of a second, with random motions if enabled
DLYSECSBY100:
        psha
        clra
        std     CDTIMR5
L8C26:
        jsr     L9B19           ; do the random motions if enabled
        tst     CDTIMR5+1
        bne     L8C26
        pula
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Delay by B half-seconds
DLYSECSBY2:
        psha
        ldaa    #0x32           ; 50
        mul
        std     CDTIMR5
L8C36:
        ldd     CDTIMR5
        bne     L8C36
        pula
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LCD routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;

L8C3C:
        ldaa    #0xFF
        staa    DDRA  
        ldaa    #0xFF
        staa    DDRG 
        ldaa    PORTG  
        oraa    #0x02
        staa    PORTG  
        ldaa    #0x38
        jsr     L8C86           ; write byte to LCD
        ldaa    #0x38
        jsr     L8C86           ; write byte to LCD
        ldaa    #0x06
        jsr     L8C86           ; write byte to LCD
        ldaa    #0x0E
        jsr     L8C86           ; write byte to LCD
        ldaa    #0x01
        jsr     L8C86           ; write byte to LCD
        ldx     #0x00FF
L8C6A:
        nop
        nop
        dex
        bne     L8C6A  
        rts

; toggle LCD ENABLE
L8C70:
        ldaa    PORTG  
        anda    #0xFD           ; clear LCD ENABLE
        staa    PORTG  
        oraa    #0x02           ; set LCD ENABLE
        staa    PORTG  
        rts

; Reset LCD buffer?
L8C7E:
        ldd     #0x0500         ; Reset LCD queue?
        std     (0x0046)        ; write pointer
        std     (0x0044)        ; read pointer?
        rts

; write byte to LCD
L8C86:
        jsr     L8CBD           ; wait for LCD not busy
        staa    PORTA  
        ldaa    PORTG       
        anda    #0xF3           ; LCD RS and LCD RW low
L8C91:
        staa    PORTG  
        jsr     L8C70           ; toggle LCD ENABLE
        rts

; ???
L8C98:
        jsr     L8CBD           ; wait for LCD not busy
        staa    PORTA  
        ldaa    PORTG  
        anda    #0xFB
        oraa    #0x08
        bra     L8C91  
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    PORTG  
        anda    #0xF7
        oraa    #0x08
        bra     L8C91  
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    PORTG  
        oraa    #0x0C
        bra     L8C91  

; wait for LCD not busy (or timeout)
L8CBD:
        psha
        pshb
        ldab    #0xFF           ; init timeout counter
L8CC1:
        tstb
        beq     L8CDE           ; times up, exit
        ldaa    PORTG  
        anda    #0xF7           ; bit 3 low
        oraa    #0x04           ; bit 3 high
        staa    PORTG           ; LCD RS high
        jsr     L8C70           ; toggle LCD ENABLE
        clr     DDRA  
        ldaa    PORTA           ; read busy flag from LCD
        bmi     L8CE1           ; if busy, keep looping
        ldaa    #0xFF
        staa    DDRA            ; port A back to outputs
L8CDE:
        pulb                    ; and exit
        pula
        rts

L8CE1:
        decb                    ; decrement timer
        ldaa    #0xFF
        staa    DDRA            ; port A back to outputs
        bra     L8CC1           ; loop

L8CE9:
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    #0x01
        jsr     L8C86           ; write byte to LCD
        rts

L8CF2:
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    #0x80
        jsr     L8D14
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    #0x80
        jsr     L8C86           ; write byte to LCD
        rts

L8D03:
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    #0xC0
        jsr     L8D14
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    #0xC0
        jsr     L8C86           ; write byte to LCD
        rts

L8D14:
        jsr     L8C86           ; write byte to LCD
        ldaa    #0x10
        staa    (0x0014)
L8D1B:
        jsr     L8CBD           ; wait for LCD not busy
        ldaa    #0x20
        jsr     L8C98
        dec     (0x0014)
        bne     L8D1B  
        rts

L8D29:
        ldaa    #0x0C
        jsr     L8E4B
        rts

; Unused?
L8D2F:
        ldaa    #0x0E
        jsr     L8E4B
        rts

L8D35:
        clr     (0x004A)
        clr     (0x0043)
        ldy     (0x0046)
        ldaa    #0xC0
        bra     L8D4D

L8D42:
        clr     (0x004A)
        clr     (0x0043)
        ldy     (0x0046)
        ldaa    #0x80
L8D4D:
        staa    0,Y     
        clr     1,Y     
        iny
        iny
        cpy     #0x0580
        bcs     L8D61  
        ldy     #0x0500
L8D61:
        ldab    #0x0F
L8D63:
        ldaa    (0x004A)
        beq     L8D63  
        clr     (0x004A)
        decb
        beq     L8D87  
        cmpa    #0x24
        beq     L8D87  
        clr     0,Y     
        staa    1,Y     
        iny
        iny
        cpy     #0x0580
        bcs     L8D85  
        ldy     #0x0500
L8D85:
        bra     L8D63  
L8D87:
        tstb
        beq     L8DA3  
        ldaa    #0x20
L8D8C:
        clr     0,Y     
        staa    1,Y     
        iny
        iny
        cpy     #0x0580
        bcs     L8DA0  
        ldy     #0x0500
L8DA0:
        decb
        bne     L8D8C  
L8DA3:
        clr     0,Y     
        clr     1,Y     
        sty     (0x0046)
        ldaa    (0x0019)
        staa    (0x004E)
        ldaa    #0x01
        staa    (0x0043)
        rts

; display ASCII in B at location
L8DB5:
        psha
        pshb
        cmpb    #0x4F
        bhi     L8DCE  
        cmpb    #0x28
        bcs     L8DC2  
        clc
        adcb    #0x18
L8DC2:
        clc
        adcb    #0x80
        tba
        jsr     L8E4B           ; send lcd command
        pulb
        pula
        jsr     L8E70           ; send lcd char
L8DCE:
        rts

; 4 routines to write to the LCD display

; Write to the LCD 1st line - extend past the end of a normal display
LCDMSG1A:
        ldy     (0x0046)        ; get buffer pointer
        ldaa    #0x90           ; command to set LCD RAM ptr to chr 0x10
        bra     L8DE9  

; Write to the LCD 2st line - extend past the end of a normal display
LCDMSG2A:
        ldy     (0x0046)        ; get buffer pointer
        ldaa    #0xD0           ; command to set LCD RAM ptr to chr 0x50
        bra     L8DE9  

; Write to the LCD 2nd line
LCDMSG2:
        ldy     (0x0046)        ; get buffer pointer
        ldaa    #0xC0           ; command to set LCD RAM ptr to chr 0x40
        bra     L8DE9  

; Write to the LCD 1st line
LCDMSG1:
        ldy     (0x0046)        ; get buffer pointer
        ldaa    #0x80           ; command to load LCD RAM ptr to chr 0x00

; Put LCD command into a buffer, 4 bytes for each entry?
L8DE9:
        staa    0,Y             ; store command here
        clr     1,Y             ; clear next byte
        iny
        iny

; Add characters at return address to LCD buffer
        cpy     #0x0580         ; check for buffer overflow
        bcs     L8DFD           
        ldy     #0x0500
L8DFD:
        pulx                    ; get start of data
        stx     (0x0017)        ; save this here
L8E00:
        ldaa    0,X             ; get character
        beq     L8E3A           ; is it 00, if so jump ahead
        bmi     L8E1D           ; high bit set, if so jump ahead
        clr     0,Y             ; add character
        staa    1,Y     
        inx
        iny
        iny
        cpy     #0x0580         ; check for buffer overflow
        bcs     L8E00  
        ldy     #0x0500
        bra     L8E00  

L8E1D:
        anda    #0x7F
        clr     0,Y             ; add character
        staa    1,Y     
        clr     2,Y     
        clr     3,Y     
        inx
        iny
        iny
        cpy     #0x0580         ; check for overflow
        bcs     L8E3A  
        ldy     #0x0500

L8E3A:
        pshx                    ; put SP back
        ldaa    #0x01
        staa    (0x0043)        ; semaphore?
        ldd     (0x0046)
        clr     0,Y     
        clr     1,Y     
        sty     (0x0046)        ; save buffer pointer
        rts

; buffer LCD command?
L8E4B:
        ldy     (0x0046)
        staa    0,Y     
        clr     1,Y     
        iny
        iny
        cpy     #0x0580
        bcs     L8E62  
        ldy     #0x0500
L8E62:
        clr     0,Y     
        clr     1,Y     
        ldaa    #0x01
        staa    (0x0043)
        sty     (0x0046)
        rts

L8E70:
        ldy     (0x0046)
        clr     0,Y     
        staa    1,Y     
        iny
        iny
        cpy     #0x0580
        bcs     L8E87  
        ldy     #0x0500
L8E87:
        clr     0,Y     
        clr     1,Y     
        ldaa    #0x01
        staa    (0x0043)
        sty     (0x0046)
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;

; Read SCD switches
L8E95:
        ldaa    (0x0030)
        bne     L8EA2       ; UP - return A=0x01
        ldaa    (0x0031)
        bne     L8EAE       ; DOWN - return A=0x02
        ldaa    (0x0032)
        bne     L8EBA       ; ENTER - return A=0x0D
        rts                 ; return A=0x00

L8EA2:
        clr     (0x0030)
        clr     (0x0032)
        clr     (0x0031)
        ldaa    #0x01
        rts

L8EAE:
        clr     (0x0031)
        clr     (0x0030)
        clr     (0x0032)
        ldaa    #0x02
        rts

L8EBA:
        clr     (0x0032)
        clr     (0x0030)
        clr     (0x0031)
        ldaa    #0x0D
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;

; Scan SCD keys into up=0x30,down=0x31,enter=0x32
L8EC6:
        ldaa    PIA0PRA 
        anda    #0x07       ; get button state
        staa    (0x002C)
        asl     (0x002C)
        asl     (0x002C)
        asl     (0x002C)
        asl     (0x002C)
        asl     (0x002C)    ; put in upper 3 bits of 002C 
        ldx     #0x0000
L8EDF:
        cpx     #0x0003
        beq     L8F08
        asl     (0x002C)    
        bcs     L8EFB       ; if button not pressed, jump
        ldaa    0x2D,X
        cmpa    #0x0F       ; has it been pressed for 15
        bcc     L8F09       ; do key repeat, if not enter
        inc     0x2D,X      ; nope, inc it
        ldaa    0x2D,X
        cmpa    #0x02       ; has it been pressed for 2?
        bne     L8EF9       ; nope
        staa    0x30,X      ; short press - store count (2) in 0x30/0x31/0x32
L8EF9:
        bra     L8F05  
L8EFB:                      ; 
        clr     0x2D,X      ; clear 2D/2E/2F if not pressed
        bra     L8F05  
        ldaa    0x2D,X
        beq     L8F05  
        dec     0x2D,X
L8F05:
        inx
        bra     L8EDF  
L8F08:
        rts

L8F09:
        cpx     #0x0002
        beq     L8F10  
        clr     0x2D,X      ; do kbd repeat for up and down
L8F10:
        bra     L8F05

;;;;;;;;;;;;;;;;;;;;;;;;;;

; Read Front Panel Switches
L8F12:
        ldaa    PORTE
        staa    (0x0051)
        ldx     #0x0000
L8F1A:
        cpx     #0x0008
        beq     L8F41  
        asr     (0x0051)
        bcs     L8F34  
        ldaa    0x52,X
        cmpa    #0x0F
        inc     0x52,X
        ldaa    0x52,X
        cmpa    #0x04
        bne     L8F32  
        staa    0x5A,X
L8F32:
        bra     L8F3E  
L8F34:
        clr     0x52,X
        bra     L8F3E  
        ldaa    0x52,X
        beq     L8F3E  
        dec     0x52,X
L8F3E:
        inx
        bra     L8F1A  
L8F41:
        rts

        clr     0x52,X
        bra     L8F3E  

;;;;;;;;;;;;;;;;;;;;;;;;;;

L8F46:
        .ascii      '0.5'
        .ascii      '1.0'
        .ascii      '1.5'
        .ascii      '2.0'
        .ascii      '2.5'
        .ascii      '3.0'

L8F58:
        pshx
        ldaa    (0x0012)
        suba    #0x01
        ldab    #0x03
        mul
        ldx     #L8F46
        abx
        ldab    #0x2C
L8F66:
        ldaa    0,X     
        inx
        jsr     L8DB5           ; display char here on LCD display
        incb
        cmpb    #0x2F
        bne     L8F66  
        pulx
        rts

L8F73:
        psha
        jsr     L8CF2
        ldab    #0x02
        jsr     DLYSECSBY2   
        pula
        staa    (0x00B4)
        cmpa    #0x03
        bne     L8F94  

        jsr     LCDMSG1 
        .ascis  'Chuck    '

        ldx     #L9072
        bra     L8FE1  
L8F94:
        cmpa    #0x04
        bne     L8FA9  

        jsr     LCDMSG1 
        .ascis  'Jasper   '

        ldx     #L90DE
        bra     L8FE1  
L8FA9:
        cmpa    #0x05
        bne     L8FBE  

        jsr     LCDMSG1 
        .ascis  'Pasqually'

        ldx     #L9145
        bra     L8FE1  
L8FBE:
        cmpa    #0x06
        bne     L8FD3  

        jsr     LCDMSG1 
        .ascis  'Munch    '

        ldx     #L91BA
        bra     L8FE1  
L8FD3:
        jsr     LCDMSG1 
        .ascis  'Helen   '

        ldx     #L9226
L8FE1:
        ldaa    (0x00B4)
        suba    #0x03
        asla
        asla
        staa    (0x004B)
        jsr     L9504
        staa    (0x004C)
        cmpa    #0x0F
        bne     L8FF3  
        rts

L8FF3:
        cmpa    #0x08
        bls     L8FFF  
        suba    #0x08
        ldab    (0x004B)
        addb    #0x02
        stab    (0x004B)
L8FFF:
        psha
        ldy     (0x0046)
        pula
        clrb
        sec
L9006:
        rolb
        deca
        bne     L9006  
        stab    (0x0050)
        ldab    (0x004B)
        ldx     #0x1080
        abx
        ldaa    #0x02
        staa    (0x0012)
L9016:
        ldaa    0,X     
        eora    (0x0050)
        staa    0,X     
        tst     0,X     
        beq     L9036  
        ldaa    #0x4F           ;'O'
        ldab    #0x0C        
        jsr     L8DB5           ; display char here on LCD display
        ldaa    #0x6E           ;'n'
        ldab    #0x0D
        jsr     L8DB5           ; display char here on LCD display
        ldd     #0x200E         ;' '
        jsr     L8DB5           ; display char here on LCD display
        bra     L9044  
L9036:
        ldaa    #0x66           ;'f'
        ldab    #0x0D
        jsr     L8DB5           ; display char here on LCD display
        ldaa    #0x66           ;'f'
        ldab    #0x0E
        jsr     L8DB5           ; display char here on LCD display
L9044:
        ldab    (0x0012)
        jsr     DLYSECSBY2      ; delay in half-seconds
        jsr     L8E95
        cmpa    #0x0D
        beq     L9064  
        bra     L9016  
        cmpa    #0x02
        bne     L9016  
        ldaa    (0x0012)
        cmpa    #0x06
        beq     L9016  
        inca
        staa    (0x0012)
        jsr     L8F58
        bra     L9016  
L9064:
        ldaa    0,X     
        oraa    (0x0050)
        eora    (0x0050)
        staa    0,X     
        ldaa    (0x00B4)
        jmp     L8F73
        rts

L9072:
        .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
L90DE:
        .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Hands,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
L9145:
        .ascis  'Mouth-Mustache,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
L91BA:
        .ascis  'Mouth,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
L9226:
        .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
        
; code again
L9292:
        jsr     L86C4           ; Reset boards 1-10
L9295:
        ldab    #0x01
        jsr     DLYSECSBY2      ; delay 0.5 sec

        jsr     LCDMSG1 
        .ascis  '  Diagnostics   '

        jsr     LCDMSG2 
        .ascis  '                '

        ldab    #0x01
        jsr     DLYSECSBY2      ; delay 0.5 sec
        jsr     L8D03
        ldx     #L93D3
        jsr     L9504
        cmpa    #0x11
        bne     L92E6
L92D2:
        jsr     L86C4           ; Reset boards 1-10
        clrb
        stab    (0x0062)
        jsr     BUTNLIT 
        ldaa    PIA0PRA 
        anda    #0xBF
        staa    PIA0PRA 
        jmp     L81D7
L92E6:
        cmpa    #0x03
        bcs     L92F3  
        cmpa    #0x08
        bcc     L92F3  
        jsr     L8F73
        bra     L9295  
L92F3:
        cmpa    #0x02
        bne     L92FF  
        jsr     L9F1E
        bcs     L9295  
        jmp     L9675
L92FF:
        cmpa    #0x0B
        bne     L9310  
        jsr     L8D03
        jsr     L9ECC
        ldab    #0x03
        jsr     DLYSECSBY2      ; delay 1.5 sec
        bra     L9295  
L9310:
        cmpa    #0x09
        bne     L9322  
        jsr     L9F1E
        bcc     L931C  
        jmp     L9295
L931C:
        jsr     L9E92           ; reset R counts
        jmp     L9295
L9322:
        cmpa    #0x0A
        bne     L9331  
        jsr     L9F1E
        bcs     L932E  
        jsr     L9EAF           ; reset L counts
L932E:
        jmp     L9295
L9331:
        cmpa    #0x01
        bne     L9338  
        jmp     LA0E9
L9338:
        cmpa    #0x08
        bne     L935B  
        jsr     L9F1E
        bcs     L935B  

        jsr     LCDMSG1 
        .ascis  'Reset System!'

        jmp     LA249
        ldab    #0x02
        jsr     DLYSECSBY2      ; delay 1 sec
        bra     L9373  
L935B:
        cmpa    #0x0C
        bne     L9373  
        jsr     L8B48
        clrb
        stab    (0x0062)
        jsr     BUTNLIT 
        ldaa    PIA0PRA 
        anda    #0xBF
        staa    PIA0PRA 
        jmp     L9292
L9373:
        cmpa    #0x0D
        bne     L93A5  
        jsr     L8CE9

        jsr     LCDMSG1 
        .ascis  '  Button  test'

        jsr     LCDMSG2 
        .ascis  '   PROG exits'

        jsr     LA526
        clrb
        jsr     BUTNLIT 
        jmp     L9295
L93A5:
        cmpa    #0x0E
        bne     L93B9  
        jsr     L9F1E
        bcc     L93B1  
        jmp     L9295
L93B1:
        ldab    #0x01
        jsr     DLYSECSBY2      ; delay 0.5 sec
        jmp     L949A
L93B9:
        cmpa    #0x0F
        bne     L93C3  
        jsr     LA86A
        jmp     L9295
L93C3:
        cmpa    #0x10
        bne     L93D0  
        jsr     L9F1E
        jsr     L95BA
        jmp     L9295

L93D0:
        jmp     L92D2

L93D3:
        .ascis  "VCR adjust,Set Random,Chuck E. Cheese,Jasper,Pasqually,Munch,Helen,Reset System,Reset reg tape#,Reset liv tape#,View Tape #'s,All Lights On,Button test,King enable,Warm-Up,Show Type,Quit Diagnostics"
        .byte   0x00

L949A:
        tst     (0x042A)
        beq     L94C6  

        jsr     LCDMSG1 
        .ascis  'King is Enabled'

        jsr     LCDMSG2 
        .ascis  'ENTER to disable'

        bra     L94EB  

L94C6:
        jsr     LCDMSG1 
        .ascis  'King is Disabled'

        jsr     LCDMSG2 
        .ascis  'ENTER to enable'

L94EB:
        jsr     L8E95
        tsta
        beq     L94EB  
        cmpa    #0x0D
        beq     L94F7  
        bra     L9501  
L94F7:
        ldaa    (0x042A)
        anda    #0x01
        eora    #0x01
        staa    (0x042A)
L9501:
        jmp     L9295
L9504:
        ldaa    #0x01
        staa    (0x00A6)
        staa    (0x00A7)
        stx     (0x0012)
        bra     L9517  
        ldaa    #0x01
        staa    (0x00A7)
        clr     (0x00A6)
        stx     (0x0012)
L9517:
        clr     (0x0016)
        ldy     (0x0046)
        tst     (0x00A6)
        bne     L9529  
        jsr     L8CF2
        ldaa    #0x80
        bra     L952E  
L9529:
        jsr     L8D03
        ldaa    #0xC0
L952E:
        staa    0,Y     
        clr     1,Y     
        iny
        iny
        cpy     #0x0580
        bcs     L9542  
        ldy     #0x0500
L9542:
        stx     (0x0014)
L9544:
        ldaa    0,X     
        bpl     L954C  
        ldab    #0x01
        stab    (0x0016)
L954C:
        cmpa    #0x2C
        beq     L956E  
        clr     0,Y     
        anda    #0x7F
        staa    1,Y     
        iny
        iny
        cpy     #0x0580
        bcs     L9566  
        ldy     #0x0500
L9566:
        tst     (0x0016)
        bne     L956E  
        inx
        bra     L9544  
L956E:
        inx
        ldaa    #0x01
        staa    (0x0043)
        clr     0,Y     
        clr     1,Y     
        sty     (0x0046)
L957C:
        jsr     L8E95
        beq     L957C  
        cmpa    #0x02
        bne     L958F  
        tst     (0x0016)
        bne     L958F  
        inc     (0x00A7)
        bra     L9517  
L958F:
        cmpa    #0x01
        bne     L95B3  
        ldy     (0x0014)
        cpy     (0x0012)
        bls     L957C  
        dec     (0x00A7)
        ldx     (0x0014)
        dex
L95A1:
        dex
        cpx     (0x0012)
        bne     L95A9  
        jmp     L9517
L95A9:
        ldaa    0,X     
        cmpa    #0x2C
        bne     L95A1  
        inx
        jmp     L9517
L95B3:
        cmpa    #0x0D
        bne     L957C  
        ldaa    (0x00A7)
        rts

L95BA:
        ldaa    (0x045C)
        beq     L95D3  

        jsr     LCDMSG1 
        .ascis  'Current: CNR   '

        bra     L95E5  

L95D3:
        jsr     LCDMSG1 
        .ascis  'Current: R12   '

L95E5:
        jsr     LCDMSG2 
        .ascis  '<Enter> to chg.'

L95F7:
        jsr     L8E95
        beq     L95F7  
        cmpa    #0x0D
        bne     L960F  
        ldaa    (0x045C)
        beq     L960A  
        clr     (0x045C)
        bra     L960F  
L960A:
        ldaa    #0x01
        staa    (0x045C)
L960F:
        rts

L9610:
        .ascis  "Chuck,Jasper,Pasqually,Munch,Helen,Light 1,Light 2,Light 3,Star EFX,Wink Spot,Gobo,Clear All Rnd,Exit"

L9675:
        jsr     LCDMSG1 
        .ascis  'Random          '

        ldx     #L9610
        jsr     L9504
        clrb
        pshb
        cmpa    #0x0D
        bne     L9697  
        jmp     L975B
L9697:
        cmpa    #0x0C
        bne     L96BC  
        clr     (0x0401)
        clr     (0x042B)

        jsr     LCDMSG1 
        .ascis  'All Rnd Cleared!'

        ldab    #0x64           ; delay 1 sec
        jsr     DLYSECSBY100
        jmp     L975B
L96BC:
        cmpa    #0x09
        bcs     L96C5  
        suba    #0x08
        pulb
        incb
        pshb
L96C5:
        clrb
        sec
L96C7:
        rolb
        deca
        bne     L96C7  
        stab    (0x0012)
        eorb    #0xFF
        stab    (0x0013)
L96D1:
        ldd     #0x2034         ;' '
        jsr     L8DB5           ; display char here on LCD display
        pulb
        pshb
        tstb
        beq     L96E1  
        ldaa    (0x042B)
        bra     L96E4  
L96E1:
        ldaa    (0x0401)
L96E4:
        anda    (0x0012)
        beq     L96F2  
        ldy     (0x0046)
        jsr     L8DFD
        clra
        ldx     0x20,X
        dex
L96F2:
        ldy     (0x0046)
        jsr     L8DFD
        clra
        ror     0xE6,X
        ldd     #0x2034         ;' '
        jsr     L8DB5           ; display char here on LCD display
L9701:
        jsr     L8E95           ; wait for an SCD key
        beq     L9701  
        cmpa    #0x01           ; is it up?
        bne     L972C           ; no jump ahead
        pulb
        pshb
        tstb
        beq     L9719           ; if B=0, modify 0401 mask  
        ldaa    (0x042B)        ; else modify 042B mask
        oraa    (0x0012)
        staa    (0x042B)
        bra     L9721  
L9719:
        ldaa    (0x0401)
        oraa    (0x0012)
        staa    (0x0401)
L9721:
        ldy     (0x0046)
        jsr     L8DFD
        clra
        jmp     0xA0,X
        bra     L96D1  
L972C:
        cmpa    #0x02
        bne     L9753  
        pulb
        pshb
        tstb
        beq     L973F  
        ldaa    (0x042B)
        anda    (0x0013)
        staa    (0x042B)
        bra     L9747  
L973F:
        ldaa    (0x0401)
        anda    (0x0013)
        staa    (0x0401)
L9747:
        ldy     (0x0046)
        jsr     L8DFD
        clra
        ror     0xE6,X
        jmp     L96D1
L9753:
        cmpa    #0x0D
        bne     L9701  
        pulb
        jmp     L9675
L975B:
        pulb
        jmp     L9292

; do program rom checksum, and display it on the LCD screen
L975F:
        ldx     #0x0000
        ldy     #0x8000
L9766:
        ldab    0,Y     
        iny
        abx
        cpy     #0x0000
        bne     L9766  
        stx     (0x0017)        ; store rom checksum here
        ldaa    (0x0017)        ; get high byte of checksum
        jsr     L979B           ; convert it to 2 hex chars
        ldaa    (0x0012)
        ldab    #0x33
        jsr     L8DB5           ; display char 1 here on LCD display
        ldaa    (0x0013)
        ldab    #0x34
        jsr     L8DB5           ; display char 2 here on LCD display
        ldaa    (0x0018)        ; get low byte of checksum
        jsr     L979B           ; convert it to 2 hex chars
        ldaa    (0x0012)
        ldab    #0x35
        jsr     L8DB5           ; display char 1 here on LCD display
        ldaa    (0x0013)
        ldab    #0x36
        jsr     L8DB5           ; display char 2 here on LCD display
        rts

; convert A to ASCII hex digit, store in (0x0012:0x0013)
L979B:
        psha
        anda    #0x0F
        adda    #0x30
        cmpa    #0x39
        bls     L97A6  
        adda    #0x07
L97A6:
        staa    (0x0013)
        pula
        anda    #0xF0
        lsra
        lsra
        lsra
        lsra
        adda    #0x30
        cmpa    #0x39
        bls     L97B7  
        adda    #0x07
L97B7:
        staa    (0x0012)
        rts

L97BA:
        jsr     L9D18
        bcc     L97C2  
        jmp     L9A7F
L97C2:
        tst     (0x0079)
        bne     L97D2  
        ldd     (0x0410)
        addd    #0x0001
        std     (0x0410)
        bra     L97DB  
L97D2:
        ldd     (0x0412)
        addd    #0x0001
        std     (0x0412)
L97DB:
        ldaa    #0x78
        staa    (0x0063)
        staa    (0x0064)
        jsr     LA313
        jsr     LAADB
        ldaa    #0x01
        staa    (0x004E)
        staa    (0x0076)
        clr     (0x0075)
        clr     (0x0077)
        jsr     L87AE
        ldab    (0x007B)
        orab    #0x20
        andb    #0xF7
        jsr     L8748   
        jmp     L85A4
L9802:
        clr     (0x0076)
        clr     (0x0075)
        clr     (0x0077)
        clr     (0x004E)
        ldab    (0x007B)
        orab    #0x0C
        jsr     L8748
L9815:
        jsr     LA31E
        jsr     L86C4           ; Reset boards 1-10
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        jsr     L8E95
        jmp     L844D
L9824:
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        clr     (0x004E)
        ldab    (0x007B)
        orab    #0x24
        andb    #0xF7
        jsr     L8748   
        jsr     L87AE
        jsr     L8E95
        jmp     L844D
L983C:
        clr     (0x0078)
        ldaa    (0x108A)
        anda    #0xF9
        staa    (0x108A)
        tst     (0x00AF)
        bne     L98AD  
        ldaa    (0x0062)
        anda    #0x01
        beq     L98AD  
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7
        ldd     #0x0032
        std     CDTIMR1
        ldd     #0x7530
        std     CDTIMR2
        clr     (0x005A)
L9864:
        jsr     L9B19           ; do the random motions if enabled
        tst     (0x0031)
        bne     L9870  
        ldaa    (0x005A)
        beq     L9889  
L9870:
        clr     (0x0031)
        ldab    (0x0062)
        andb    #0xFE
        stab    (0x0062)
        jsr     BUTNLIT 
        jsr     LAA13
        ldab    #0xFB           ; tape deck PLAY
        jsr     L86E7
        clr     (0x005A)
        bra     L98D4  
L9889:
        ldd     CDTIMR1
        bne     L9864  
        ldab    (0x0062)
        eorb    #0x01
        stab    (0x0062)
        jsr     BUTNLIT 
        andb    #0x01
        bne     L989F  
        jsr     LAA0C
        bra     L98A2  
L989F:
        jsr     LAA13
L98A2:
        ldd     #0x0032
        std     CDTIMR1
        ldd     CDTIMR2
        beq     L9870  
        bra     L9864  
L98AD:
        tst     (0x0075)
        beq     L98B5  
        jmp     L9939
L98B5:
        ldaa    (0x0062)
        anda    #0x02
        beq     L9909  
        tst     (0x00AF)
        bne     L98CB  
        ldd     (0x0424)
        addd    #0x0001
        std     (0x0424)
        bra     L98D4  
L98CB:
        ldd     (0x0422)
        addd    #0x0001
        std     (0x0422)
L98D4:
        ldd     (0x0418)
        addd    #0x0001
        std     (0x0418)
        ldaa    #0x78
        staa    (0x0063)
        staa    (0x0064)
        ldab    (0x0062)
        andb    #0xF7
        orab    #0x02
        stab    (0x0062)
        jsr     BUTNLIT 
        jsr     LAA18
        ldaa    #0x01
        staa    (0x004E)
        staa    (0x0075)
        ldab    (0x007B)
        andb    #0xDF
        jsr     L8748   
        jsr     L87AE
        jsr     LA313
        jsr     LAADB
        bra     L9939  
L9909:
        ldab    (0x0062)
        andb    #0xF5
        orab    #0x40
        stab    (0x0062)
        jsr     BUTNLIT 
        jsr     LAA1D
        tst     (0x00AF)
        bne     L9920  
        ldab    #0x01
        stab    (0x00B6)
L9920:
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        clr     (0x004E)
        clr     (0x0075)
        ldaa    #0x01
        staa    (0x0077)
        ldab    (0x007B)
        orab    #0x24
        andb    #0xF7
        jsr     L8748   
        jsr     L8791   
L9939:
        clr     (0x00AF)
        jmp     L85A4
L993F:
        clr     (0x0077)
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        clr     (0x004E)
        ldab    (0x0062)
        andb    #0xBF
        tst     (0x0075)
        beq     L9953  
        andb    #0xFD
L9953:
        stab    (0x0062)
        jsr     BUTNLIT 
        jsr     LAA1D
        clr     (0x005B)
        jsr     L87AE
        ldab    (0x007B)
        orab    #0x20
        jsr     L8748   
        clr     (0x0075)
        clr     (0x0076)
        jmp     L9815
L9971:
        ldab    (0x007B)
        andb    #0xFB
        jsr     L8748   
        jmp     L85A4
L997B:
        ldab    (0x007B)
        orab    #0x04
        jsr     L8748   
        jmp     L85A4
L9985:
        ldab    (0x007B)
        andb    #0xF7
        jsr     L8748   
        jmp     L85A4
L998F:
        tst     (0x0077)
        bne     L999B
        ldab    (0x007B)
        orab    #0x08
        jsr     L8748   
L999B:
        jmp     L85A4
L999E:
        ldab    (0x007B)
        andb    #0xF3
        jsr     L8748   
        rts

; main2
L99A6:
        ldab    (0x007B)
        andb    #0xDF           ; clear bit 5
        jsr     L8748
        jsr     L8791   
        rts

L99B1:
        ldab    (0x007B)
        orab    #0x20
        jsr     L8748   
        jsr     L87AE
        rts

        ldab    (0x007B)
        andb    #0xDF
        jsr     L8748   
        jsr     L87AE
        rts

        ldab    (0x007B)
        orab    #0x20
        jsr     L8748   
        jsr     L8791   
        rts

L99D2:
        ldaa    #0x01
        staa    (0x0078)
        jmp     L85A4
L99D9:
        ldx     #0x0E20
        ldaa    0,X     
        suba    #0x30
        ldab    #0x0A
        mul
        tba                     ; (0E20)*10 into A
        ldab    #0x64
        mul
        std     (0x0017)        ; (0E20)*1000 into 17:18
        ldaa    1,X
        suba    #0x30
        ldab    #0x64
        mul
        addd    (0x0017)
        std     (0x0017)        ; (0E20)*1000+(0E21)*100 into 17:18
        ldaa    2,X     
        suba    #0x30
        ldab    #0x0A
        mul
        addd    (0x0017)    
        std     (0x0017)        ; (0E20)*1000+(0E21)*100+(0E22)*10 into 17:18
        clra
        ldab    3,X     
        subb    #0x30
        addd    (0x0017)    
        std     (0x029C)        ; (0E20)*1000+(0E21)*100+(0E22)*10+(0E23) into (029C:029D)
        ldx     #0x0E20
L9A0C:
        ldaa    0,X         
        cmpa    #0x30
        bcs     L9A25  
        cmpa    #0x39
        bhi     L9A25  
        inx
        cpx     #0x0E24
        bne     L9A0C  
        ldaa    (0x0E24)        ; check EEPROM signature
        cmpa    #0xDB
        bne     L9A25  
        clc                     ; if sig good, return carry clear
        rts

L9A25:
        sec                     ; if sig bad, return carry clear
        rts

L9A27:
        jsr     LCDMSG1 
        .ascis  'Serial# '

        jsr     LCDMSG2 
        .ascis  '               '

; display 4-digit serial number
        ldab    #0x08
        ldy     #0x0E20
L9A4A:
        ldaa    0,Y     
        pshy
        pshb
        jsr     L8DB5            ; display char here on LCD display
        pulb
        puly
        incb
        iny
        cpy     #0x0E24
        bne     L9A4A  
        rts

; Unused?
L9A60:
        ldaa    #0x01
        staa    (0x00B5)
        ldaa    (0x004E)
        staa    (0x007F)
        ldaa    (0x0062)
        staa    (0x0080)
        ldaa    (0x007B)
        staa    (0x0081)
        ldaa    (0x007A)
        staa    (0x0082)
        ldaa    (0x0078)
        staa    (0x007D)
        ldaa    (0x108A)
        anda    #0x06
        staa    (0x007E)
L9A7F:
        ldab    #0xEF           ; tape deck EJECT
        jsr     L86E7
        ldab    (0x007B)
        orab    #0x0C
        andb    #0xDF
        jsr     L8748   
        jsr     L8791   
        jsr     L86C4           ; Reset boards 1-10
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        ldab    #0x06           ; delay 6 secs
        jsr     DLYSECS         ;
        jsr     L8E95
        jsr     L99A6
        jmp     L81BD
L9AA4:
        clr     (0x005C)
        ldaa    #0x01
        staa    (0x0079)
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7
        jsr     L8E95
        ldd     #0x7530
        std     CDTIMR2
L9AB8:
        jsr     L9B19           ; do the random motions if enabled
        ldab    (0x0062)
        eorb    #0x04
        stab    (0x0062)
        jsr     BUTNLIT 
        ldab    PIA0PRA 
        eorb    #0x08
        stab    PIA0PRA 
        tst     (0x005C)
        bne     L9AE3  
        jsr     L8E95
        cmpa    #0x0D
        beq     L9AE3  
        ldab    #0x32           ; delay 0.5 sec
        jsr     DLYSECSBY100
        ldd     CDTIMR2
        beq     L9AE3  
        bra     L9AB8  
L9AE3:
        ldab    (0x0062)
        andb    #0xFB
        stab    (0x0062)
        jsr     BUTNLIT 
        jsr     LA354
        ldab    #0xFB           ; tape deck PLAY
        jsr     L86E7
        jmp     L85A4
L9AF7:
        clr     (0x0075)
        clr     (0x0076)
        clr     (0x0077)
        clr     (0x0078)
        clr     (0x0025)
        clr     (0x0026)
        clr     (0x004E)
        clr     (0x0030)        ; clear SCD key states
        clr     (0x0031)
        clr     (0x0032)
        clr     (0x00AF)
        rts

; do the random motions if enabled
L9B19:
        psha
        pshb
        ldaa    (0x004E)
        beq     L9B36           ; go to 0401 logic
        ldaa    (0x0063)        ; check countdown timer
        bne     L9B33           ; exit
        tst     (0x0064)
        beq     L9B31           ; go to 0401 logic
        jsr     L86C4           ; Reset boards 1-10
        jsr     L9C51           ; Reset random motions, init board 7/8 bits
        clr     (0x0064)
L9B31:
        bra     L9B36           ; go to 0401 logic
L9B33:
        pulb
        pula
        rts

; end up here immediately if:
; 0x004E == 00 or
; 0x0063, 0x0064 == 0 or
; 
; do subroutines based on bits 0-4 of 0x0401?
L9B36:
        ldaa    (0x0401)
        anda    #0x01
        beq     L9B40  
        jsr     L9B6B           ; bit 0 routine
L9B40:
        ldaa    (0x0401)
        anda    #0x02
        beq     L9B4A  
        jsr     L9B99           ; bit 1 routine
L9B4A:
        ldaa    (0x0401)
        anda    #0x04
        beq     L9B54  
        jsr     L9BC7           ; bit 2 routine
L9B54:
        ldaa    (0x0401)
        anda    #0x08
        beq     L9B5E  
        jsr     L9BF5           ; bit 3 routine
L9B5E:
        ldaa    (0x0401)
        anda    #0x10
        beq     L9B68  
        jsr     L9C23           ; bit 4 routine
L9B68:
        pulb
        pula
        rts

; bit 0 routine
L9B6B:
        pshy
        ldy     (0x0065)
        ldaa    0,Y     
        cmpa    #0xFF
        beq     L9B8B  
        cmpa    OFFCNT1
        bcs     L9B88  
        iny
        ldaa    0,Y     
        staa    (0x1080)        ; do some stuff to board 1
        iny
        sty     (0x0065)
L9B88:
        puly
        rts
L9B8B:
        ldy     #LB2EB
        sty     (0x0065)
        ldaa    #0xFA
        staa    OFFCNT1
        jmp     L9B88

; bit 1 routine
L9B99:
        pshy
        ldy     (0x0067)
        ldaa    0,Y     
        cmpa    #0xFF
        beq     L9BB9  
        cmpa    OFFCNT2
        bcs     L9BB6  
        iny
        ldaa    0,Y     
        staa    (0x1084)        ; do some stuff to board 2
        iny
        sty     (0x0067)
L9BB6:
        puly
        rts
L9BB9:
        ldy     #LB3BD
        sty     (0x0067)
        ldaa    #0xE6
        staa    OFFCNT2
        jmp     L9BB6

; bit 2 routine
L9BC7:
        pshy
        ldy     (0x0069)
        ldaa    0,Y     
        cmpa    #0xFF
        beq     L9BE7  
        cmpa    OFFCNT3
        bcs     L9BE4  
        iny
        ldaa    0,Y     
        staa    (0x1088)        ; do some stuff to board 3
        iny
        sty     (0x0069)
L9BE4:
        puly
        rts
L9BE7:
        ldy     #LB531
        sty     (0x0069)
        ldaa    #0xD2
        staa    OFFCNT3
        jmp     L9BE4

; bit 3 routine
L9BF5:
        pshy
        ldy     (0x006B)
        ldaa    0,Y     
        cmpa    #0xFF
        beq     L9C15  
        cmpa    OFFCNT4
        bcs     L9C12  
        iny
        ldaa    0,Y     
        staa    (0x108C)        ; do some stuff to board 4
        iny
        sty     (0x006B)
L9C12:
        puly
        rts
L9C15:
        ldy     #LB475
        sty     (0x006B)
        ldaa    #0xBE
        staa    OFFCNT4
        jmp     L9C12

; bit 4 routine
L9C23:
        pshy
        ldy     (0x006D)
        ldaa    0,Y     
        cmpa    #0xFF
        beq     L9C43  
        cmpa    OFFCNT5
        bcs     L9C40  
        iny
        ldaa    0,Y     
        staa    (0x1090)        ; do some stuff to board 5
        iny
        sty     (0x006D)
L9C40:
        puly
        rts
L9C43:
        ldy     #LB5C3
        sty     (0x006D)
        ldaa    #0xAA
        staa    OFFCNT5
        jmp     L9C40

; Reset offset counters to initial values
L9C51:
        ldaa    #0xFA
        staa    OFFCNT1
        ldaa    #0xE6
        staa    OFFCNT2
        ldaa    #0xD2
        staa    OFFCNT3
        ldaa    #0xBE
        staa    OFFCNT4
        ldaa    #0xAA
        staa    OFFCNT5

        ; int random movement table pointers
        ldy     #LB2EB
        sty     (0x0065)
        ldy     #LB3BD
        sty     (0x0067)
        ldy     #LB531
        sty     (0x0069)
        ldy     #LB475
        sty     (0x006B)
        ldy     #LB5C3
        sty     (0x006D)

        ; clear board 8
        clr     (0x109C)
        clr     (0x109E)

        ; if bit 5 of 0401 is set, turn on 3 bits on board 8
        ldaa    (0x0401)
        anda    #0x20
        beq     L9C9D
        ldaa    (0x109C)
        oraa    #0x19
        staa    (0x109C)
        ; if bit 6 of 0401 is set, turn on 3 bits on board 8
L9C9D:
        ldaa    (0x0401)
        anda    #0x40
        beq     L9CB4  
        ldaa    (0x109C)
        oraa    #0x44
        staa    (0x109C)
        ldaa    (0x109E)
        oraa    #0x40
        staa    (0x109E)
        ; if bit 7 of 0401 is set, turn on 3 bits on board 8
L9CB4:
        ldaa    (0x0401)
        anda    #0x80
        beq     L9CC3  
        ldaa    (0x109C)
        oraa    #0xA2
        staa    (0x109C)

L9CC3:
        ; if bit 0 of 042B is set, turn on 1 bit on board 7
        ldaa    (0x042B)
        anda    #0x01
        beq     L9CD2  
        ldaa    (0x109A)
        oraa    #0x80
        staa    (0x109A)
L9CD2:
        ; if bit 1 of 042B is set, turn on 1 bit on board 8
        ldaa    (0x042B)
        anda    #0x02
        beq     L9CE1  
        ldaa    (0x109E)
        oraa    #0x04
        staa    (0x109E)
L9CE1:
        ; if bit 2 of 042B is set, turn on 1 bit on board 8
        ldaa    (0x042B)
        anda    #0x04
        beq     L9CF0  
        ldaa    (0x109E)
        oraa    #0x08
        staa    (0x109E)
L9CF0:
        rts

; Display Credits
L9CF1:
        jsr     LCDMSG1 
        .ascis  '   Program by   '

        jsr     LCDMSG2 
        .ascis  'David  Philipsen'

        rts

L9D18:
        staa    (0x0049)
        clr     (0x00B8)
        jsr     L8D03
        ldaa    #0x2A           ;'*'
        ldab    #0x28
        jsr     L8DB5           ; display char here on LCD display
        ldd     #0x0BB8         ; start 30 second timer?
        std     CDTIMR1
L9D2C:
        jsr     L9B19           ; do the random motions if enabled
        ldaa    (0x0049)
        cmpa    #0x41
        beq     L9D39  
        cmpa    #0x4B
        bne     L9D3D  
L9D39:
        ldab    #0x01
        stab    (0x00B8)
L9D3D:
        cmpa    #0x41
        beq     L9D45  
        cmpa    #0x4F
        bne     L9D4C  
L9D45:
        ldaa    #0x01
        staa    (0x0298)
        bra     L9D7E  
L9D4C:
        cmpa    #0x4B
        beq     L9D54  
        cmpa    #0x50
        bne     L9D5B  
L9D54:
        ldaa    #0x02
        staa    (0x0298)
        bra     L9D7E  
L9D5B:
        cmpa    #0x4C
        bne     L9D66  
        ldaa    #0x03
        staa    (0x0298)
        bra     L9D7E  
L9D66:
        cmpa    #0x52
        bne     L9D71  
        ldaa    #0x04
        staa    (0x0298)
        bra     L9D7E  
L9D71:
        ldd     CDTIMR1
        bne     L9D2C  
        ldaa    #0x23           ;'#'
        ldab    #0x29
        jsr     L8DB5           ; display char here on LCD display
        bra     L9DEA  
L9D7E:
        clr     (0x0049)
        ldaa    #0x2A           ;'*'
        ldab    #0x29
        jsr     L8DB5           ; display char here on LCD display
        clr     (0x004A)
        ldx     #0x0299
L9D8E:
        jsr     L9B19           ; do the random motions if enabled
        ldaa    (0x004A)
        beq     L9D8E  
        clr     (0x004A)
        anda    #0x3F
        staa    0,X     
        inx
        cpx     #0x029C
        bne     L9D8E  
        jsr     L9DF5
        bcc     L9DB0  
        ldaa    #0x23           ;'#'
        ldab    #0x2A
        jsr     L8DB5           ; display char here on LCD display
        bra     L9DEA  
L9DB0:
        ldaa    #0x2A           ;'*'
        ldab    #0x2A
        jsr     L8DB5           ; display char here on LCD display
        ldaa    (0x0299)
        cmpa    #0x39
        bne     L9DD3  

        jsr     LCDMSG2 
        .ascis  'Generic Showtape'

        clc
        rts

L9DD3:
        ldaa    (0x0298)
        cmpa    #0x03
        beq     L9DE8  
        cmpa    #0x04
        beq     L9DE8  
        ldaa    (0x0076)
        bne     L9DE8  
        jsr     L9E73
        jsr     L9ECC
L9DE8:
        clc
        rts

L9DEA:
        ldd     (0x0420)
        addd    #0x0001
        std     (0x0420)
        sec
        rts

L9DF5:
        ldaa    (0x0299)
        cmpa    #0x39
        beq     L9E68  
        ldx     #0x00A8
L9DFF:
        jsr     L9B19           ; do the random motions if enabled
        ldaa    (0x004A)
        beq     L9DFF  
        clr     (0x004A)
        staa    0,X     
        inx
        cpx     #0x00AA
        bne     L9DFF  
        jsr     L9EFA
        ldx     #0x0299
        clr     (0x0013)
L9E1A:
        ldaa    0,X     
        adda    (0x0013)
        staa    (0x0013)
        inx
        cpx     #0x029C
        bne     L9E1A  
        cmpa    (0x00A8)
        bne     L9E71  
        ldx     #0x0402
        ldaa    (0x0298)
        cmpa    #0x02
        bne     L9E37  
        ldx     #0x0405
L9E37:
        pshx
        jsr     LAB56
        pulx
        bcs     L9E45  
        ldaa    #0x03
        staa    (0x0298)
        bra     L9E68  
L9E45:
        ldaa    (0x0299)
        cmpa    0,X     
        bcs     L9E6A  
        beq     L9E50  
        bcc     L9E68  
L9E50:
        inx
        ldaa    (0x029A)
        cmpa    0,X     
        bcs     L9E6A  
        beq     L9E5C  
        bcc     L9E68  
L9E5C:
        inx
        ldaa    (0x029B)
        cmpa    0,X     
        bcs     L9E6A  
        beq     L9E68  
        bcc     L9E68  
L9E68:
        clc
        rts

L9E6A:
        ldaa    (0x0298)
        cmpa    #0x03
        beq     L9E68  
L9E71:
        sec
        rts

L9E73:
        ldx     #0x0402
        ldaa    (0x0298)
        cmpa    #0x02
        bne     L9E80  
        ldx     #0x0405
L9E80:
        ldaa    (0x0299)
        staa    0,X     
        inx
        ldaa    (0x029A)
        staa    0,X     
        inx
        ldaa    (0x029B)
        staa    0,X     
        rts

; reset R counts
L9E92:
        ldaa    #0x30        
        staa    (0x0402)
        staa    (0x0403)
        staa    (0x0404)

        jsr     LCDMSG2 
        .ascis  'Reg # cleared!'

        rts

; reset L counts
L9EAF:
        ldaa    #0x30
        staa    (0x0405)
        staa    (0x0406)
        staa    (0x0407)

        jsr     LCDMSG2 
        .ascis  'Liv # cleared!'

        rts

; display R and L counts?
L9ECC:
        ldaa    #0x52           ;'R'
        ldab    #0x2B
        jsr     L8DB5           ; display char here on LCD display
        ldaa    #0x4C           ;'L'
        ldab    #0x32
        jsr     L8DB5           ; display char here on LCD display
        ldx     #0x0402
        ldab    #0x2C
L9EDF:
        ldaa    0,X     
        jsr     L8DB5           ; display 3 chars here on LCD display
        incb
        inx
        cpx     #0x0405
        bne     L9EDF  
        ldab    #0x33
L9EED:
        ldaa    0,X     
        jsr     L8DB5           ; display 3 chars here on LCD display
        incb
        inx
        cpx     #0x0408
        bne     L9EED  
        rts

L9EFA:
        ldaa    (0x00A8)
        jsr     L9F0F
        asla
        asla
        asla
        asla
        staa    (0x0013)
        ldaa    (0x00A9)
        jsr     L9F0F
        adda    (0x0013)
        staa    (0x00A8)
        rts

L9F0F:
        cmpa    #0x2F
        bcc     L9F15  
        ldaa    #0x30
L9F15:
        cmpa    #0x3A
        bcs     L9F1B  
        suba    #0x07
L9F1B:
        suba    #0x30
        rts

; different behavior based on serial number
L9F1E:
        ldd     (0x029C)
        cpd     #0x0001         ; if 1, password bypass
        beq     L9F33           ;
        cpd     #0x03E8         ; 1000
        bcs     L9F4D           ; if > 1000, code
        cpd     #0x044B         ; 1099
        bhi     L9F4D           ; if < 1099, code
                                ; else 1 < x < 1000, bypass

L9F33:
        jsr     LCDMSG1 
        .ascis  'Password bypass '

        ldab    #0x04
        jsr     DLYSECSBY2      ; delay 2 sec
        clc
        rts

L9F4D:
        jsr     L8CF2
        jsr     L8D03

        jsr     LCDMSG1 
        .ascis  'Code:'

; Generate a random 5-digit code in 0x0290-0x0294, and display to user

        ldx     #0x0290
        clr     (0x0016)        ; 0x00
L9F61:
        ldaa    #0x41           ; 'A'
L9F63:
        staa    (0x0015)        ; 0x41
        jsr     L8E95           ; read SCD keys
        cmpa    #0x0D
        bne     L9F7D
        ldaa    (0x0015)
        staa    0,X     
        inx
        jsr     L8C98
        ldaa    (0x0016)
        inca
        staa    (0x0016)
        cmpa    #0x05
        beq     L9F86  
L9F7D:
        ldaa    (0x0015)
        inca
        cmpa    #0x5B           ; '['
        beq     L9F61  
        bra     L9F63  

; Let the user type in a corresponding password to the code
L9F86:
        jsr     LCDMSG2 
        .ascis  'Pswd:'

        ldx     #0x0288
        ldaa    #0x41           ; 'A'
        staa    (0x0016)
        ldaa    #0xC5           ; 
        staa    (0x0015)
L9F99:
        ldaa    (0x0015)
        jsr     L8C86           ; write byte to LCD
        ldaa    (0x0016)
        jsr     L8C98
L9FA3:
        jsr     L8E95
        beq     L9FA3  
        cmpa    #0x0D
        bne     L9FBC  
        ldaa    (0x0016)
        staa    0,X     
        inx
        ldaa    (0x0015)
        inca
        staa    (0x0015)
        cmpa    #0xCA
        beq     L9FE2  
        bra     L9F99  
L9FBC:
        cmpa    #0x01
        bne     L9FCF  
        ldaa    (0x0016)
        inca
        staa    (0x0016)
        cmpa    #0x5B
        bne     L9F99  
        ldaa    #0x41
        staa    (0x0016)
        bra     L9F99  
L9FCF:
        cmpa    #0x02
        bne     L9FA3  
        ldaa    (0x0016)
        deca
        staa    (0x0016)
        cmpa    #0x40
        bne     L9F99  
        ldaa    #0x5A
        staa    (0x0016)
        bra     L9F99  
L9FE2:
        jsr     LA001           ; validate
        bcs     L9FF6           ; if bad, jump
        ldaa    #0xDB
        staa    (0x00AB)        ; good password
        ldd     (0x0416)        ; increment number of good validations counter
        addd    #0x0001
        std     (0x0416)
        clc
        rts

L9FF6:
        ldd     (0x0414)        ; increment number of bad validations counter
        addd    #0x0001
        std     (0x0414)
        sec
        rts

; Validate password?
LA001:
        ; scramble 5 letters
        ldaa    (0x0290)        ; 0 -> 1
        staa    (0x0281)
        ldaa    (0x0291)        ; 1 -> 3
        staa    (0x0283)
        ldaa    (0x0292)        ; 2 -> 4
        staa    (0x0284)
        ldaa    (0x0293)        ; 3 -> 0
        staa    (0x0280)
        ldaa    (0x0294)        ; 4 -> 2
        staa    (0x0282)
        ; transform each letter
        ldaa    (0x0280)    
        eora    #0x13
        adda    #0x03
        staa    (0x0280)
        ldaa    (0x0281)
        eora    #0x04
        adda    #0x12
        staa    (0x0281)
        ldaa    (0x0282)
        eora    #0x06
        adda    #0x04
        staa    (0x0282)
        ldaa    (0x0283)
        eora    #0x11
        adda    #0x07
        staa    (0x0283)
        ldaa    (0x0284)
        eora    #0x01
        adda    #0x10
        staa    (0x0284)
        ; keep them modulo 26 (A-Z)
        jsr     LA0AF
        ; put some of the original bits into 0x0015/0x0016
        ldaa    (0x0294)
        anda    #0x17
        staa    (0x0015)
        ldaa    (0x0290)
        anda    #0x17
        staa    (0x0016)
        ; do some eoring with these bits
        ldx     #0x0280
LA065:
        ldaa    0,X
        eora    (0x0015)
        eora    (0x0016)
        staa    0,X
        inx
        cpx     #0x0285
        bne     LA065
        ; keep them modulo 26 (A-Z)
        jsr     LA0AF
        ; compare them to code in 0x0288-0x028C
        ldx     #0x0280
        ldy     #0x0288
LA07D:
        ldaa    0,X     
        cmpa    0,Y     
        bne     LA08E  
        inx
        iny
        cpx     #0x0285
        bne     LA07D  
        clc                     ; carry clear if good
        rts

LA08E:
        sec                     ; carry set if bad
        rts

; trivial password validation - not used??
LA090:
        .ascii  'YADDA'

        ldx     #0x0288
        ldy     #LA090
LA09C:
        ldaa    0,X
        cmpa    0,Y
        bne     LA0AD
        inx
        iny
        cpx     #0x028D
        bne     LA09C
        clc
        rts
LA0AD:
        sec
        rts

; keep the password modulo 26, each letter in range 'A-Z'
LA0AF:
        ldx     #0x0280
LA0B2:
        ldaa    0,X
        cmpa    #0x5B
        bcs     LA0BE
        suba    #0x1A
        staa    0,X
        bra     LA0C6
LA0BE:
        cmpa    #0x41
        bcc     LA0C6
        adda    #0x1A
        staa    0,X
LA0C6:
        inx
        cpx     #0x0285
        bne     LA0B2  
        rts

        jsr     L8CF2

        jsr     LCDMSG2 
        .ascis  'Failed!         '

        ldab    #0x02
        jsr     DLYSECSBY2      ; delay 1 sec
        rts

LA0E9:
        ldab    #0x01
        jsr     DLYSECSBY2      ; delay 0.5 sec
        clr     (0x004E)
        ldab    #0xD3
        jsr     L8748   
        jsr     L87AE
        jsr     L8CE9

        jsr     LCDMSG1 
        .ascis  '   VCR adjust'

        jsr     LCDMSG2 
        .ascis  'UP to clear bits'

        clrb
        stab    (0x0062)
        jsr     BUTNLIT 
        ldaa    PIA0PRA 
        anda    #0xBF
        staa    PIA0PRA 
        jsr     L8E95
        clr     (0x0048)
        clr     (0x0049)
        jsr     L86C4           ; Reset boards 1-10
        ldaa    #0x28
        staa    (0x0063)
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7
        jsr     LA32E
        inc     (0x0076)
        clr     (0x0032)
LA14B:
        jsr     L8E95
        cmpa    #0x0D
        bne     LA155  
        jmp     LA1C4
LA155:
        ldaa    #0x28
        staa    (0x0063)
        jsr     L86A4
        bcs     LA14B  
        ldd     (0x041A)
        addd    #0x0001
        std     (0x041A)
        jsr     L86C4           ; Reset boards 1-10
        inc     (0x004E)
        ldab    #0xD3
        jsr     L8748   
        jsr     L87AE
LA175:
        ldaa    (0x0049)
        cmpa    #0x43
        bne     LA181  
        clr     (0x0049)
        clr     (0x0048)
LA181:
        ldaa    (0x0048)
        cmpa    #0xC8
        bcs     LA1A6  
        ldd     (0x029C)
        cpd     #0x0001
        beq     LA1A6  
        ldab    #0xEF           ; tape deck EJECT
        jsr     L86E7
        jsr     L86C4           ; Reset boards 1-10
        clr     (0x004E)
        clr     (0x0076)
        ldab    #0x0A
        jsr     DLYSECSBY2      ; delay 5 sec
        jmp     L81D7
LA1A6:
        jsr     L8E95
        cmpa    #0x01
        bne     LA1BD  
        ldx     #0x1080
        ldaa    #0x34
LA1B2:
        clr     0,X     
        staa    1,X     
        inx
        inx
        cpx     #0x10A0
        bcs     LA1B2  
LA1BD:
        cmpa    #0x0D
        beq     LA1C4  
        jmp     LA175
LA1C4:
        clr     (0x0076)
        clr     (0x004E)
        ldab    #0xDF
        jsr     L8748   
        jsr     L8791   
        jmp     L81D7

; reprogram EEPROM signature if needed
LA1D5:
        ldaa    #0x07
        staa    (0x0400)
        ldd     #0x0E09
        cmpa    #0x65           ;'e'
        bne     LA1E6
        cmpb    #0x63           ;'c'
        bne     LA1E6
        rts

; erase and reprogram EEPROM signature
LA1E6:
        ldaa    #0x0E
        staa    PPROG
        ldaa    #0xFF
        staa    (0x0E00)
        ldaa    PPROG  
        oraa    #0x01
        staa    PPROG  
        ldx     #0x1B58         ; 7000
LA1FB:
        dex
        bne     LA1FB  
        ldaa    PPROG  
        anda    #0xFE
        staa    PPROG  
        ldx     #0x0E00
        ldy     #LA226
LA20D:
        ldab    #0x02
        stab    PPROG  
        ldaa    0,Y     
        iny
        staa    0,X     
        jsr     LA232
        inx
        cpx     #0x0E0C
        bne     LA20D  
        clr     PPROG  
        rts

; data for 0x0E00-0x0E0B EEPROM
LA226:
        .ascii  ')d*!2::4!ecq'

; program EEPROM
LA232:
        pshy
        ldab    #0x03
        stab    PPROG           ; start program
        ldy     #0x1B58
LA23D:
        dey
        bne     LA23D  
        ldab    #0x02
        stab    PPROG           ; stop program
        puly
        rts

LA249:
        sei
        ldx     #0x0010
LA24D:
        clr     0,X     
        inx
        cpx     #0x0E00
        bne     LA24D  
        jsr     L9EAF           ; reset L counts
        jsr     L9E92           ; reset R counts
        jmp     RESET           ; reset controller

; Compute and store copyright checksum
LA25E:
        ldy     #CPYRTMSG       ; copyright message
        ldx     #0x0000
LA265:
        ldab    0,Y
        abx
        iny
        cpy     #0x8050
        bne     LA265
        stx     CPYRTCS         ; store checksum here
        rts

; Erase EEPROM routine
LA275:
        sei
        clr     ERASEFLG        ; Reset EEPROM Erase flag
        ldaa    #0x0E
        staa    PPROG           ; ERASE mode!
        ldaa    #0xFF
        staa    (0x0E20)        ; save in NVRAM
        ldaa    PPROG  
        oraa    #0x01
        staa    PPROG           ; do the ERASE
        ldx     #0x1B58         ; delay a bit
LA28E:
        dex
        bne     LA28E  
        ldaa    PPROG  
        anda    #0xFE           ; stop erasing
        clr     PPROG  

        jsr     SERMSGW         ; display "enter serial number"
        .ascis  'Enter serial #: '

        ldx     #0x0E20
LA2AF:
        jsr     SERIALR         ; wait for serial data
        bcc     LA2AF  

        jsr     SERIALW         ; read serial data
        ldab    #0x02
        stab    PPROG           ; protect only 0x0e20-0x0e5f
        staa    0,X         
        jsr     LA232           ; program byte
        inx
        cpx     #0x0E24
        bne     LA2AF  
        ldab    #0x02
        stab    PPROG  
        ldaa    #0xDB           ; it's official
        staa    (0x0E24)
        jsr     LA232           ; program byte
        clr     PPROG  
        ldaa    #0x1E
        staa    BPROT           ; protect all but 0x0e00-0x0e1f
        jmp     RESET           ; reset controller

LA2DF:
        pulx
        pshx
        cpx     #0x8000
        bcs     LA2E8           ; if 0x8000 < calling address (should be)
        clc
        rts

LA2E8:
        sec
        rts

; enter and validate security code via serial
LA2EA:
        ldx     #0x0288
        ldab    #0x03           ; 3 character code

LA2EF:
        jsr     SERIALR         ; check if available
        bcc     LA2EF  
        staa    0,X     
        inx
        decb
        bne     LA2EF  

        ldaa    (0x0288)
        cmpa    #0x13           ; 0x13
        bne     LA311  
        ldaa    (0x0289)
        cmpa    #0x10           ; 0x10
        bne     LA311  
        ldaa    (0x028A)
        cmpa    #0x14           ; 0x14
        bne     LA311  
        clc
        rts

LA311:
        sec
        rts

LA313:
        psha
        ldaa    (0x1092)
        oraa    #0x01
LA319:
        staa    (0x1092)
        pula
        rts

LA31E:
        psha
        ldaa    (0x1092)
        anda    #0xFE
        bra     LA319

LA326:
        ldaa    (0x004E)
        staa    (0x0019)
        clr     (0x004E)
        rts

LA32E:
        ldaa    (0x1086)
        oraa    #0x15
        staa    (0x1086)
        ldab    #0x01
        jsr     DLYSECSBY2      ; delay 0.5 sec
        anda    #0xEA
        staa    (0x1086)
        rts

LA341:
        ldaa    (0x1086)
        oraa    #0x2A           ; xx1x1x1x
        staa    (0x1086)
        ldab    #0x01
        jsr     DLYSECSBY2      ; delay 0.5 sec
        anda    #0xD5           ; xx0x0x0x
        staa    (0x1086)
        rts

LA354:
        ldab    PIA0PRA 
        orab    #0x08
        stab    PIA0PRA 
        rts

        ldab    PIA0PRA 
        andb    #0xF7
        stab    PIA0PRA 
        rts

;'$' command goes here?
LA366:
        clr     (0x004E)
        jsr     L86C4           ; Reset boards 1-10
        clr     (0x042A)

        jsr     SERMSGW
        .ascis  'Enter security code:' 

        jsr     LA2EA
        bcc     LA38E
        jmp     L8331

LA38E:
        jsr     SERMSGW      
        .ascii  "\f\n\rDave's Setup Utility\n\r"
        .ascii  '<K>ing enable\n\r'
        .ascii  '<C>lear random\n\r'
        .ascii  '<5> character random\n\r'
        .ascii  '<L>ive tape number clear\n\r'
        .ascii  '<R>egular tape number clear\n\r'
        .ascii  '<T>est driver boards\n\r'
        .ascii  '<B>ub test\n\r'
        .ascii  '<D>eck test (with tape inserted)\n\r'
        .ascii  '<7>5% adjustment\n\r'
        .ascii  '<S>how re-valid tapes\n\r'
        .ascis  '<J>ump to system\n\r'

LA495:
        jsr     SERIALR     
        bcc     LA495  
        cmpa    #0x43           ;'C'
        bne     LA4A7  
        clr     (0x0401)        ;clear random
        clr     (0x042B)
        jmp     LA514
LA4A7:
        cmpa    #0x35           ;'5'
        bne     LA4B8  
        ldaa    (0x0401)        ;5 character random
        anda    #0x7F
        oraa    #0x7F
        staa    (0x0401)
        jmp     LA514
LA4B8:
        cmpa    #0x4C           ;'L'
        bne     LA4C2
        jsr     L9EAF           ; reset Liv counts
        jmp     LA514
LA4C2:
        cmpa    #0x52           ;'R'
        bne     LA4CC  
        jsr     L9E92           ; reset Reg counts
        jmp     LA514
LA4CC:
        cmpa    #0x54           ;'T'
        bne     LA4D6  
        jsr     LA565           ; test driver boards
        jmp     LA514
LA4D6:
        cmpa    #0x42           ;'B'
        bne     LA4E0  
        jsr     LA526           ; bulb test?
        jmp     LA514
LA4E0:
        cmpa    #0x44           ;'D'
        bne     LA4EA  
        jsr     LA53C           ; deck test
        jmp     LA514
LA4EA:
        cmpa    #0x37           ;'7'
        bne     LA4F6  
        ldab    #0xFB           ; tape deck PLAY
        jsr     L86E7           ; 5% adjustment
        jmp     LA514
LA4F6:
        cmpa    #0x4A           ;'J'
        bne     LA4FD  
        jmp     RESET           ; jump to system (reset)
LA4FD:
        cmpa    #0x4B           ;'K'
        bne     LA507  
        inc     (0x042A)        ; King enable
        jmp     LA514
LA507:
        cmpa    #0x53           ;'S'
        bne     LA511  
        jsr     LAB7C           ; show re-valid tapes
        jmp     LA514
LA511:
        jmp     LA495
LA514:
        ldaa    #0x07
        jsr     SERIALW      
        ldab    #0x01
        jsr     DLYSECSBY2      ; delay 0.5 sec
        ldaa    #0x07
        jsr     SERIALW      
        jmp     LA38E

; bulb test
LA526:
        clrb
        jsr     BUTNLIT 
LA52A:
        ldab    PORTE
        eorb    #0xFF
        jsr     BUTNLIT 
        cmpb    #0x80
        bne     LA52A  
        ldab    #0x02
        jsr     DLYSECSBY2      ; delay 1 sec
        rts

; deck test
LA53C:
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7
        ldab    #0x06
        jsr     DLYSECSBY2      ; delay 3 sec
        ldab    #0xFB           ; tape deck PLAY
        jsr     L86E7
        ldab    #0x06
        jsr     DLYSECSBY2      ; delay 3 sec
        ldab    #0xFD           ; tape deck STOP
        jsr     L86E7
        ldab    #0xF7
        jsr     L86E7           ; tape deck REWIND
        ldab    #0x06
        jsr     DLYSECSBY2      ; delay 3 sec
        ldab    #0xEF           ; tape deck EJECT
        jsr     L86E7
        rts

; test driver boards
LA565:
        jsr     SERIALR     
        bcc     LA572  
        cmpa    #0x1B
        bne     LA572  
        jsr     L86C4           ; Reset boards 1-10
        rts
LA572:
        ldaa    #0x08
        staa    (0x0015)
        jsr     L86C4           ; Reset boards 1-10
        ldaa    #0x01
LA57B:
        psha
        tab
        jsr     BUTNLIT 
        ldaa    PIA0PRA 
        eora    #0x08
        staa    PIA0PRA 
        pula
        staa    (0x1080)
        staa    (0x1084)
        staa    (0x1088)
        staa    (0x108C)
        staa    (0x1090)
        staa    (0x1094)
        staa    (0x1098)
        staa    (0x109C)
        ldab    #0x14
        jsr     LA652
        rola
        psha
        ldab    (0x0015)
        decb
        stab    (0x0015)
        jsr     DIAGDGT         ; write digit to the diag display
        pshb
        ldab    #0x27
        ldaa    (0x0015)
        clc
        adca    #0x30
        jsr     L8DB5           ; display char here on LCD display
        pulb
        pula
        tstb
        bne     LA57B  
        ldaa    #0x08
        staa    (0x0015)
        jsr     L86C4           ; Reset boards 1-10
        ldaa    #0x01
LA5C9:
        staa    (0x1082)
        staa    (0x1086)
        staa    (0x108A)
        staa    (0x108E)
        staa    (0x1092)
        staa    (0x1096)
        staa    (0x109A)
        staa    (0x109E)
        ldab    #0x14
        jsr     LA652
        rola
        psha
        ldab    (0x0015)
        decb
        stab    (0x0015)
        jsr     DIAGDGT         ; write digit to the diag display
        pshb
        ldab    #0x27
        ldaa    (0x0015)
        clc
        adca    #0x30
        jsr     L8DB5           ; display char here on LCD display
        pulb
        pula
        tst     (0x0015)
        bne     LA5C9  
        jsr     L86C4           ; Reset boards 1-10
        ldx     #0x1080
        ldab    #0x00
LA60A:
        ldaa    #0xFF
        staa    0,X
        staa    2,X     
        pshb
        ldab    #0x1E
        jsr     LA652
        pulb
        ldaa    #0x00
        staa    0,X     
        staa    2,X     
        incb
        pshx
        jsr     DIAGDGT         ; write digit to the diag display
        pshb
        ldab    #0x27
        pula
        psha
        clc
        adca    #0x30
        jsr     L8DB5           ; display char here on LCD display
        pulb
        pulx
        inx
        inx
        inx
        inx
        cpx     #0x109D
        bcs     LA60A  
        ldx     #0x1080
LA63B:
        ldaa    #0xFF
        staa    0,X     
        staa    2,X     
        inx
        inx
        inx
        inx
        cpx     #0x109D
        bcs     LA63B  
        ldab    #0x06
        jsr     DLYSECSBY2      ; delay 3 sec
        jmp     LA565
LA652:
        psha
        clra
        std     CDTIMR5
LA656:
        tst     CDTIMR5+1
        bne     LA656  
        pula
        rts

; Comma-seperated text
LA65D:
        .ascii  '0,Chuck,Mouth,'
        .ascii  '1,Head left,'
        .ascii  '2,Head right,'
        .ascii  '2,Head up,'
        .ascii  '2,Eyes right,'
        .ascii  '1,Eyelids,'
        .ascii  '1,Right hand,'
        .ascii  '2,Eyes left,'
        .ascii  '1,8,Helen,Mouth,'
        .ascii  '1,Head left,'
        .ascii  '2,Head right,'
        .ascii  '2,Head up,'
        .ascii  '2,Eyes right,'
        .ascii  '1,Eyelids,'
        .ascii  '1,Right hand,'
        .ascii  '2,Eyes left,'
        .ascii  '1,6,Munch,Mouth,'
        .ascii  '1,Head left,'
        .ascii  '2,Head right,'
        .ascii  '2,Left arm,'
        .ascii  '2,Eyes right,'
        .ascii  '1,Eyelids,'
        .ascii  '1,Right arm,'
        .ascii  '2,Eyes left,'
        .ascii  '1,2,Jasper,Mouth,'
        .ascii  '1,Head left,'
        .ascii  '2,Head right,'
        .ascii  '2,Head up,'
        .ascii  '2,Eyes right,'
        .ascii  '1,Eyelids,'
        .ascii  '1,Hands,'
        .ascii  '2,Eyes left,'
        .ascii  '1,4,Pasqually,Mouth-Mustache,'
        .ascii  '1,Head left,'
        .ascii  '2,Head right,'
        .ascii  '2,Left arm,'
        .ascii  '2,Eyes right,'
        .ascii  '1,Eyelids,'
        .ascii  '1,Right arm,'
        .ascii  '2,Eyes left,1,'

LA855:
        pshx
        jsr     L86C4           ; Reset boards 1-10
        ldx     #0x1080
        ldaa    #0x20
        staa    0,X
        staa    4,X
        staa    8,X
        staa    12,X
        staa    16,X
        pulx
        rts

LA86A:
        jsr     LA32E

        jsr     LCDMSG1 
        .ascis  '    Warm-Up  '

        jsr     LCDMSG2 
        .ascis  'Curtains opening'

        ldab    #0x14
        jsr     DLYSECSBY2      ; delay 10 sec
LA895:
        jsr     LA855
        ldab    #0x02
        jsr     DLYSECSBY2      ; delay 1 sec
        ldx     #LA65D
        ldab    #0x05
        stab    (0x0012)
LA8A4:
        ldab    #0x08
        stab    (0x0013)
        jsr     LA941
        jsr     LA94C
        ldab    #0x02
        jsr     DLYSECSBY2      ; delay 1 sec
LA8B3:
        jsr     LA95E
        ldaa    0,X     
        suba    #0x30
        inx
        inx
        psha
        inc     (0x004C)
        pshx
        jsr     L88E5
        pulx
        ldaa    #0x4F           ;'O'
        ldab    #0x0C
        jsr     L8DB5           ; display char here on LCD display
        ldaa    #0x6E           ;'n'
        ldab    #0x0D
        jsr     L8DB5           ; display char here on LCD display
        ldd     #0x200E         ;' '
        jsr     L8DB5           ; display char here on LCD display
        dec     (0x004C)
        pula
        psha
        ldab    #0x64
        mul
        std     CDTIMR5
LA8E3:
        ldd     CDTIMR5
        bne     LA8E3  
        jsr     L8E95
        cmpa    #0x0D
        bne     LA8F3  
        jsr     LA975           ; Wait for SCD Keypress
        bra     LA903  
LA8F3:
        cmpa    #0x01
        bne     LA8FB  
        pula
        jmp     LA895
LA8FB:
        cmpa    #0x02
        bne     LA903  
        pula
        jmp     LA935
LA903:
        pshx
        jsr     L88E5
        pulx
        ldaa    #0x66           ;'f'
        ldab    #0x0D
        jsr     L8DB5           ; display char here on LCD display
        ldaa    #0x66           ;'f'
        ldab    #0x0E
        jsr     L8DB5           ; display char here on LCD display
        pula
        ldab    #0x64
        mul
        std     CDTIMR5
LA91C:
        ldd     CDTIMR5
        bne     LA91C  
        jsr     LA855
        inc     (0x004B)
        ldaa    (0x004B)
        cmpa    #0x48
        bcs     LA8B3  
        ldaa    (0x004C)
        cmpa    #0x34
        beq     LA935  
        jmp     LA8A4
LA935:
        ldab    #0x02
        jsr     DLYSECSBY2      ; delay 1 sec
        jsr     L86C4           ; Reset boards 1-10
        jsr     LA341
        rts

LA941:
        ldaa    0,X     
        inx
        inx
        staa    (0x004C)
        ldaa    #0x40
        staa    (0x004B)
        rts

LA94C:
        jsr     L8CF2
LA94F:
        ldaa    0,X     
        inx
        cmpa    #0x2C
        beq     LA95D  
        psha
        jsr     L8E70
        pula
        bra     LA94F  
LA95D:
        rts

LA95E:
        jsr     L8D03
        ldaa    #0xC0
        jsr     L8E4B
LA966:
        ldaa    0,X     
        inx
        cmpa    #0x2C
        beq     LA974  
        psha
        jsr     L8E70
        pula
        bra     LA966  
LA974:
        rts

; Wait for SCD Keypress
LA975:
        jsr     L8E95
        tsta
        beq     LA975  
        rts

LA97C:
        clr     (0x0060)
        ldd     (0x029C)
        cpd     #0x0001
        beq     LA994  
        cpd     #0x03E8
        blt     LAA0B  
        cpd     #0x044B
        bhi     LAA0B  
LA994:
        ldab    #0x40
        stab    (0x0062)
        jsr     BUTNLIT 
        ldab    #0x64           ; delay 1 sec
        jsr     DLYSECSBY100
        jsr     L86C4           ; Reset boards 1-10
        jsr     L8CE9

        jsr     LCDMSG1 
        .ascis  '     STUDIO'

        jsr     LCDMSG2 
        .ascis  'programming mode'

        jsr     LA32E
        jsr     L999E
        jsr     L99B1
        ldx     #0x2000
LA9D3:
        ldy     #0x00C0
LA9D7:
        dey
        bne     LA9E5  
        jsr     LA9F4
        ldaa    (0x0060)
        bne     LAA0B  
        ldx     #0x2000
LA9E5:
        ldaa    (0x10A8)
        anda    #0x01
        beq     LA9D7  
        ldaa    (0x10A9)
        staa    0,X     
        inx
        bra     LA9D3

LA9F4:
        ldx     #0x2000
        ldy     #0x1080
LA9FB:
        ldaa    0,X     
        staa    0,Y     
        inx
        iny
        iny
        cpx     #0x2010
        bcs     LA9FB  
        rts
LAA0B:
        rts

LAA0C:
        ldd     #0x4837         ;'H'
LAA0F:
        jsr     L8DB5           ; display char here on LCD display
        rts

LAA13:
        ldd     #0x2037         ;' '
        bra     LAA0F

LAA18:
        ldd     #0x420F         ;'B'
        bra     LAA0F

LAA1D:
        ldd     #0x200F         ;' '
        bra     LAA0F

LAA22: 
        clr     (0x004F)
        ldd     #0x0001
        std     CDTIMR1
        ldx     #0x2000
LAA2D:
        ldaa    (0x10A8)
        anda    #0x01
        beq     LAA2D  
        ldd     CDTIMR1
        sei
        bne     LAA3C  
        ldx     #0x2000
LAA3C:
        ldaa    (0x10A9)
        staa    0,X     
        cli
        jsr     SERIALW      
        inx
        clr     (0x004F)
        ldd     #0x0001
        std     CDTIMR1
        cpx     #0x2023
        bne     LAA2D  
        ldx     #0x2000
        clr     (0x00B7)
LAA59:
        ldaa    0,X     
        adda    (0x00B7)
        staa    (0x00B7)
        inx
        cpx     #0x2022
        bcs     LAA59  
        ldaa    (0x00B7)
        eora    #0xFF
        cmpa    0,X     
        ldx     #0x2000
        ldaa    0x20,X
        bmi     LAA75  
        jmp     LAA22
LAA75:
        ldaa    0,X     
        staa    (0x1080)
        inx
        ldaa    0,X     
        staa    (0x1082)
        inx
        ldaa    0,X     
        staa    (0x1084)
        inx
        ldaa    0,X     
        staa    (0x1086)
        inx
        ldaa    0,X     
        staa    (0x1088)
        inx
        ldaa    0,X     
        staa    (0x108A)
        inx
        ldaa    0,X     
        staa    (0x108C)
        inx
        ldaa    0,X     
        staa    (0x108E)
        inx
        ldaa    0,X     
        staa    (0x1090)
        inx
        ldaa    0,X     
        staa    (0x1092)
        inx
        ldaa    0,X     
        oraa    #0x80
        staa    (0x1094)
        inx
        ldaa    0,X     
        oraa    #0x01
        staa    (0x1096)
        inx
        ldaa    0,X     
        staa    (0x1098)
        inx
        ldaa    0,X     
        staa    (0x109A)
        inx
        ldaa    0,X     
        staa    (0x109C)
        inx
        ldaa    0,X     
        staa    (0x109E)
        jmp     LAA22

LAADB:
        clr     (0x1098)
        clr     (0x109A)
        clr     (0x109C)
        clr     (0x109E)
        rts
LAAE8:
        ldx     #0x042C
        ldab    #0x10
LAAED:
        tstb
        beq     LAB02  
        ldaa    0,X     
        cmpa    #0x30
        bcs     LAB03  
        cmpa    #0x39
        bhi     LAB03  
        inx
        inx
        inx
        cpx     #0x0459
        bls     LAAED  
LAB02:
        rts

LAB03:
        decb
        pshx
LAB05:
        ldaa    3,X     
        staa    0,X     
        inx
        cpx     #0x045C
        bcs     LAB05  
        ldaa    #0xFF
        staa    (0x0459)
        pulx
        bra     LAAED

; erase revalid tape section in EEPROM
LAB17:
        ldx     #0x042C
        ldaa    #0xFF
LAB1C:
        staa    0,X     
        inx
        cpx     #0x045C
        bcs     LAB1C
        rts

LAB25:
        ldx     #0x042C
LAB28:
        ldaa    0,X     
        cmpa    #0x30
        bcs     LAB45  
        cmpa    #0x39
        bhi     LAB45  
        inx
        inx
        inx
        cpx     #0x045C
        bcs     LAB28  
        ldaa    #0xFF
        staa    (0x042C)
        jsr     LAAE8
        ldx     #0x0459
LAB45:
        rts

LAB46:
        ldaa    (0x0299)
        staa    0,X     
        ldaa    (0x029A)
        staa    1,X     
        ldaa    (0x029B)
        staa    2,X     
        rts

LAB56:
        ldx     #0x042C
LAB59:
        ldaa    (0x0299)
        cmpa    0,X     
        bne     LAB70  
        ldaa    (0x029A)
        cmpa    1,X     
        bne     LAB70  
        ldaa    (0x029B)
        cmpa    2,X     
        bne     LAB70  
        bra     LAB7A  
LAB70:
        inx
        inx
        inx
        cpx     #0x045C
        bcs     LAB59  
        sec
        rts

LAB7A:
        clc
        rts

;show re-valid tapes
LAB7C:
        ldx     #0x042C
LAB7F:
        ldaa    0,X     
        cmpa    #0x30
        bcs     LABA3  
        cmpa    #0x39
        bhi     LABA3  
        jsr     SERIALW      
        inx
        ldaa    0,X     
        jsr     SERIALW      
        inx
        ldaa    0,X     
        jsr     SERIALW      
        inx
        ldaa    #0x20
        jsr     SERIALW      
        cpx     #0x045C
        bcs     LAB7F  
LABA3:
        ldaa    #0x0D
        jsr     SERIALW      
        ldaa    #0x0A
        jsr     SERIALW      
        rts

LABAE:
        clr     (0x004A)
        ldd     #0x0064
        std     CDTIMR5
LABB6:
        ldaa    (0x004A)
        bne     LABC2  
        jsr     L9B19           ; do the random motions if enabled
        ldd     CDTIMR5
        bne     LABB6  
LABC1:
        rts

LABC2:
        cmpa    #0x31
        bne     LABCA  
        jsr     LAB17
        rts

LABCA:
        bra     LABC1  

; TOC1 timer handler
;
; Timer is running at:
; EXTAL = 16Mhz
; E Clk = 4Mhz
; Timer Prescaler = /16 = 250Khz
; Timer Period = 4us
; T1OC is set to previous value +625
; So, this routine is called every 2.5ms
;
LABCC:
        ldd     T1NXT           ; get ready for next time
        addd    #0x0271         ; add 625
        std     TOC1  
        std     T1NXT

        ldaa    #0x80
        staa    TFLG1           ; clear timer1 flag

; Some blinking SPECIAL button every half second,
; if 0x0078 is non zero

        tst     (0x0078)        ; if 78 is zero, skip ahead
        beq     LABFC           ; else do some blinking button lights
        ldd     (0x0025)        ; else inc 25/26
        addd    #0x0001
        std     (0x0025)
        cpd     #0x00C8         ; is it 200?
        bne     LABFC           ; no, keep going
        clr     (0x0025)        ; reset 25/26
        clr     (0x0026)
        ldab    (0x0062)        ; and toggle bit 3 of 62
        eorb    #0x08
        stab    (0x0062)
        jsr     BUTNLIT         ; and toggle the "special" button light

; 
LABFC:
        inc     (0x006F)        ; count every 2.5ms
        ldaa    (0x006F)
        cmpa    #0x28           ; is it 40 intervals? (0.1 sec?)
        bcs     LAC47           ; if not yet, jump ahead
        clr     (0x006F)        ; clear it 2.5ms counter
        tst     (0x0063)        ; decrement 0.1s counter here
        beq     LAC10           ; if it's not already zero
        dec     (0x0063)

; staggered counters - here every 100ms

; 0x0070 counts from 250 to 1, period is 25 secs
LAC10:
        ldaa    OFFCNT1         ; decrement 0.1s counter here
        deca
        staa    OFFCNT1
        bne     LAC1B       
        ldaa    #0xFA           ; 250
        staa    OFFCNT1

; 0x0071 counts from 230 to 1, period is 23 secs
LAC1B:
        ldaa    OFFCNT2
        deca
        staa    OFFCNT2
        bne     LAC26  
        ldaa    #0xE6           ; 230
        staa    OFFCNT2

; 0x0072 counts from 210 to 1, period is 21 secs
LAC26:
        ldaa    OFFCNT3
        deca
        staa    OFFCNT3
        bne     LAC31  
        ldaa    #0xD2           ; 210
        staa    OFFCNT3

; 0x0073 counts from 190 to 1, period is 19 secs
LAC31:
        ldaa    OFFCNT4
        deca
        staa    OFFCNT4
        bne     LAC3C  
        ldaa    #0xBE           ; 190
        staa    OFFCNT4

; 0x0074 counts from 170 to 1, period is 17 secs
LAC3C:
        ldaa    OFFCNT5
        deca
        staa    OFFCNT5
        bne     LAC47  
        ldaa    #0xAA           ; 170
        staa    OFFCNT5

; back to 2.5ms period here

LAC47:
        ldaa    T30MS
        inca
        staa    T30MS
        cmpa    #0x0C           ; 12 = 30ms?
        bls     LAC59  
        clr     T30MS

; do these two tasks every 30ms
        jsr     L8EC6           ; Scan SCD keys
        jsr     L8F12           ; Scan Front Panel Switches

; back to every 2.5ms here
; LCD update???

LAC59:
        ldaa    (0x0043)
        beq     LACB2  
        ldx     (0x0044)
        ldaa    0,X     
        beq     LAC86  
        staa    PORTA  
        ldaa    PORTG  
        anda    #0xF3
        staa    PORTG  
        anda    #0xFD
        staa    PORTG  
        oraa    #0x02
        staa    PORTG  
        inx
        inx
        cpx     #0x0580
        bcs     LAC82  
        ldx     #0x0500
LAC82:
        stx     (0x0044)
        bra     LACB2  
LAC86:
        ldaa    1,X     
        beq     LACAF  
        staa    PORTA  
        ldaa    PORTG  
        anda    #0xFB
        oraa    #0x08
        staa    PORTG  
        anda    #0xFD
        staa    PORTG  
        oraa    #0x02
        staa    PORTG  
        inx
        inx
        cpx     #0x0580
        bcs     LACAB  
        ldx     #0x0500
LACAB:
        stx     (0x0044)
        bra     LACB2  
LACAF:
        clr     (0x0043)

; divide by 4
LACB2:
        ldaa    (0x004F)
        inca
        staa    (0x004F)
        cmpa    #0x04
        bne     LACEB  
        clr     (0x004F)

; here every 10ms
; Five big countdown timers available here
; up to 655.35 seconds each

        ldd     CDTIMR1         ; countdown 0x001B/1C every 10ms
        beq     LACC7           ; if not already 0
        subd    #0x0001
        std     CDTIMR1

LACC7:
        ldd     CDTIMR2         ; same with 0x001D/1E
        beq     LACD0  
        subd    #0x0001
        std     CDTIMR2

LACD0:
        ldd     CDTIMR3         ; same with 0x001F/20
        beq     LACD9  
        subd    #0x0001
        std     CDTIMR3

LACD9:
        ldd     CDTIMR4         ; same with 0x0021/22
        beq     LACE2  
        subd    #0x0001
        std     CDTIMR4

LACE2:
        ldd     CDTIMR5         ; same with 0x0023/24
        beq     LACEB  
        subd    #0x0001
        std     CDTIMR5

; every other time through this, setup a task switch?
LACEB:
        ldaa    (TSCNT)
        eora    #0x01
        staa    (TSCNT)
        beq     LAD0B  

        sts     (0x013C)        ; switch stacks???
        lds     (0x013E)
        ldd     T1NXT
        subd    #0x01F4         ; 625-500 = 125?
        std     TOC2            ; set this TOC2 to happen 0.5ms
        ldaa    #0x40           ; after the current TOC1 but before the next TOC1
        staa    TFLG1           ; clear timer2 irq flag, just in case?
        ldaa    #0xC0           ;
        staa    TMSK1           ; enable TOC1 and TOC2
LAD0B:
        rti

; TOC2 Timer handler and SWI handler
LAD0C:
        ldaa    #0x40
        staa    TFLG1           ; clear timer2 flag
        sts     (0x013E)        ; switch stacks back???
        lds     (0x013C)
        ldaa    #0x80
        staa    TMSK1           ; enable TOC1 only
        rti

; Secondary task??

TASK2:
        tst     (0x042A)
        beq     LAD57
        ldaa    (0x00B6)
        bne     LAD29
        swi
        bra     TASK2
LAD29:
        clr     (0x00B6)
        ldab    #0x04
LAD2E:
        pshb
        ldx     #LAD3C
        jsr     L8A1A  
        swi
        pulb
        decb
        bne     LAD2E  
        bra     TASK2

LAD3C:
        .asciz     'S1'

        ldd     (0x029C)
        cpd     #0x0001         ; 1
        beq     LAD54  
        cpd     #0x03E8         ; 1000
        blt     LAD57  
        cpd     #0x044B         ; 1099
        bhi     LAD57  
LAD54:
        swi
        bra     TASK2
LAD57:
        clr     (0x00B3)
        jsr     LAD7E
        jsr     LADA0
        bcs     TASK2
        ldab    #0x0A
        jsr     LAE13
        jsr     LADAE
        bcs     TASK2
        ldab    #0x14
        jsr     LAE13
        jsr     LADB6
        bcs     TASK2
LAD76:
        jsr     LADB8
        sec
        bcs     TASK2
        bra     LAD76
LAD7E:
        ldx     #LAE1E          ;+++
        jsr     L8A1A  
        ldab    #0x1E
        jsr     LAE13
        ldx     #LAE22          ;ATH
        jsr     L8A1A  
        ldab    #0x1E
        jsr     LAE13
        ldx     #LAE27          ;ATZ
        jsr     L8A1A  
        ldab    #0x1E
        jsr     LAE13
        rts
LADA0:
        jsr     LB1DD
        bcs     LADA0  
        jsr     LB24F

        .asciz  'RING'

        rts

LADAE:
        ldx     #LAE2C
        jsr     L8A1A           ;ATA
        clc
        rts
LADB6:
        clc
        rts

LADB8:
        jsr     LB1D2
        jsr     LAE31
        ldaa    #0x01
        staa    (0x00B3)
        jsr     LB1DD
        jsr     LB271
        psha
        jsr     LB2C0
        pula
        cmpa    #0x01
        bne     LADD9  
        ldx     #LB295
        jsr     L8A1A           ;'You have selected #1'
        bra     LAE0A  
LADD9:
        cmpa    #0x02
        bne     LADDD  
LADDD:
        cmpa    #0x03
        bne     LADE1  
LADE1:
        cmpa    #0x04
        bne     LADE5  
LADE5:
        cmpa    #0x05
        bne     LADE9  
LADE9:
        cmpa    #0x06
        bne     LADED  
LADED:
        cmpa    #0x07
        bne     LADF1  
LADF1:
        cmpa    #0x08
        bne     LADF5  
LADF5:
        cmpa    #0x09
        bne     LADF9  
LADF9:
        cmpa    #0x0A
        bne     LADFD  
LADFD:
        cmpa    #0x0B
        bne     LAE0A  
        ldx     #LB2AA          ;'You have selected #11'
        jsr     L8A1A  
        jmp     LAE0A
LAE0A:
        ldab    #0x14
        jsr     LAE13
        clr     (0x00B3)
        rts

LAE13:
        ldx     #0x0020
LAE16:
        swi
        dex
        bne     LAE16  
        decb
        bne     LAE13  
        rts

; text??
LAE1E:
        .asciz      '+++'
LAE22:
        .asciz      'ATH\r'
LAE27:
        .asciz      'ATZ\r'
LAE2C:
        .asciz      'ATA\r'

LAE31:
        ldx     #LAE38          ; big long string of stats, with compressed ansi codes
        jsr     L8A1A  
        rts

LAE38:
        .ascii  "^0101Serial #:^0140#0000^0111~4"
        .byte   0x0E,0x20
        .ascii  "^0141|"
        .byte   0x04,0x28
        .ascii  "^0301CURRENT^0340HISTORY^0501Show Status:^0540Total # reg. shows:^0601Random Status:^0570|"
        .byte   0x04,0x10
        .ascii  "^0640Total # live shows:^0701Current Reg Tape #:^0670|"
        .byte   0x04,0x12
        .ascii  "^0730~3"
        .byte   0x04,0x02
        .ascii  "^0740Total # failed pswd attempts:^0801Current Live Tape #:^0770|"
        .byte   0x04,0x14
        .ascii  "^0830~3"
        .byte   0x04,0x05
        .ascii  "^0840Total # successful pswd:^0901Current Version #:^0870|"
        .byte   0x04,0x16
        .ascii  "^0930@"
        .byte   0x04,0x00
        .ascii  "^0940Total # bdays played:^1040Total # VCR adjusts:^0970|"
        .byte   0x04,0x18
        .ascii  "^1070|"
        .byte   0x04,0x1A
        .ascii  "^1140Total # remote accesses:^1240Total # access attempts:^1170|"
        .byte   0x04,0x1C
        .ascii  "^1270|"
        .byte   0x04,0x1E
        .ascii  "^1340Total # rejected showtapes:^1440Total # Short bdays:^1370|"
        .byte   0x04,0x20
        .ascii  "^1470|"
        .byte   0x04,0x22
        .ascii  "^1540Total # Reg bdays:^1640Total # resets-pwr ups:^1570|"
        .byte   0x04,0x24
        .ascii  "^1670|"
        .byte   0x04,0x26
        .ascii  "^1801FUNCTIONS^1823Select Function:^20011.Clear rnd enables^2028 6.Set loc name-#^205411.Diagnostics^21012.Set rnd enables^2128 7.Set Time^215412.^22013.Set reg tape #^2228 8.Disbl-enbl show^225413.^23014.Set liv tape #^2328 9.Upload program^235414.^24015.Reset history^242810.Debugger^245415.^1840"
        .byte   0x00

LB1D2:
        ldx     #LB1D8          ; escape sequence?
        jmp     L8A1A  

; ANSI control sequence - Clear Screen and Home Cursor
LB1D8:
        ; esc[2J
        .byte   0x1b
        .asciz  '[2J'

LB1DD:
        ldx     #0x05A0
        ldd     #0x0000
        std     (0x029E)
LB1E6:
        ldd     (0x029E)
        addd    #0x0001
        std     (0x029E)
        cpd     #0x0FA0
        bcc     LB21D  
        jsr     LB223
        bcs     LB1FE  
        swi
        bra     LB1E6  
        rts

LB1FE:
        staa    0,X     
        inx
        cmpa    #0x0D
        bne     LB207  
        bra     LB21F  
LB207:
        cmpa    #0x1B
        bne     LB20D  
        bra     LB21D  
LB20D:
        tst     (0x00B3)
        beq     LB215  
        jsr     L8B3B
LB215:
        ldd     #0x0000
        std     (0x029E)
        bra     LB1E6  
LB21D:
        sec
        rts

LB21F:
        clr     0,X     
        clc
        rts

LB223:
        ldaa    SCCCTRLA
        lsra
        bcs     LB234  
        clra
        staa    SCCCTRLA
        ldaa    #0x30
        staa    SCCCTRLA
        clc
        rts

LB234:
        ldaa    #0x01
        staa    SCCCTRLA
        ldaa    #0x70
        bita    SCCCTRLA
        bne     LB245  
        sec
        ldaa    SCCDATAA
        rts

LB245:
        ldaa    SCCDATAA
        ldaa    #0x30
        staa    SCCCTRLB
        clc
        rts

LB24F:
        pulx
        ldy     #0x05A0
LB254:
        ldaa    0,X
        beq     LB269
        inx
        cmpa    0,Y
        bne     LB262
        iny
        bra     LB254
LB262:
        ldaa    0,X
        beq     LB26D
        inx
        bra     LB262
LB269:
        inx
        pshx
        clc
        rts
LB26D:
        inx
        pshx
        sec
        rts

LB271:
        ldx     #0x05A0
LB274:
        ldaa    0,X
        inx
        cmpa    #0x0D
        bne     LB274
        dex
        dex
        ldaa    0,X
        dex
        suba    #0x30
        staa    (0x00B2)
        cpx     #0x059F
        beq     LB294
        ldaa    0,X
        dex
        suba    #0x30
        ldab    #0x0A
        mul
        tba
        adda    (0x00B2)
LB294:
        rts

LB295:
        .asciz  'You have selected #1'
LB2AA:
        .asciz  'You have selected #11'

LB2C0:
        ldx     #LB2C7          ; Table with compressed ANSI cursor controls
        jsr     L8A1A  
        rts

LB2C7:
        .asciz  "^2001%^2101%^2201%^2301%^2401%^2001"

; Random movement tables

; board 1
LB2EB:
        .byte   0xfa,0x20,0xfa,0x20,0xf6,0x22,0xf5,0x20
        .byte   0xf5,0x20,0xf3,0x22,0xf2,0x20,0xe5,0x22
        .byte   0xe5,0x22,0xe2,0x20,0xd2,0x20,0xbe,0x00
        .byte   0xbc,0x22,0xbb,0x30,0xb9,0x32,0xb9,0x32
        .byte   0xb7,0x30,0xb6,0x32,0xb5,0x30,0xb4,0x32
        .byte   0xb4,0x32,0xb3,0x20,0xb3,0x20,0xb1,0xa0
        .byte   0xb1,0xa0,0xb0,0xa2,0xaf,0xa0,0xaf,0xa6
        .byte   0xae,0xa0,0xae,0xa6,0xad,0xa4,0xac,0xa0
        .byte   0xac,0xa0,0xab,0xa0,0xaa,0xa0,0xaa,0xa0
        .byte   0xa2,0x80,0xa0,0xa0,0xa0,0xa0,0x8d,0x80
        .byte   0x8a,0xa0,0x7e,0x80,0x7b,0xa0,0x79,0xa4
        .byte   0x78,0xa0,0x77,0xa4,0x76,0xa0,0x75,0xa4
        .byte   0x74,0xa0,0x73,0xa4,0x72,0xa0,0x71,0xa4
        .byte   0x70,0xa0,0x6f,0xa4,0x6e,0xa0,0x6d,0xa4
        .byte   0x6c,0xa0,0x69,0x80,0x69,0x80,0x67,0xa0
        .byte   0x5e,0x20,0x58,0x24,0x57,0x20,0x57,0x20
        .byte   0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24
        .byte   0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20
        .byte   0x4f,0x24,0x4e,0x20,0x4d,0x24,0x4c,0x20
        .byte   0x4c,0x20,0x4b,0x24,0x4a,0x20,0x49,0x20
        .byte   0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20
        .byte   0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20
        .byte   0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20
        .byte   0x2e,0x04,0x2e,0x04,0x2d,0x20,0x23,0x24
        .byte   0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24
        .byte   0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30
        .byte   0xff,0xff

; board 2
LB3BD:
        .byte   0xd7,0x22,0xd5,0x20,0xc9,0x22,0xc7,0x20
        .byte   0xc4,0x24,0xc3,0x20,0xc2,0x24,0xc1,0x20
        .byte   0xbf,0x24,0xbf,0x24,0xbe,0x20,0xbd,0x24
        .byte   0xbc,0x20,0xbb,0x24,0xba,0x20,0xb9,0x20
        .byte   0xb8,0x24,0xb7,0x20,0xb4,0x00,0xb4,0x00
        .byte   0xb2,0x20,0xa9,0x20,0xa3,0x20,0xa2,0x20
        .byte   0xa1,0x20,0xa0,0x20,0xa0,0x20,0x9f,0x20
        .byte   0x9f,0x20,0x9e,0x20,0x9d,0x24,0x9d,0x24
        .byte   0x9b,0x20,0x9a,0x24,0x99,0x20,0x98,0x20
        .byte   0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20
        .byte   0x94,0x00,0x94,0x00,0x93,0x20,0x92,0x00
        .byte   0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20
        .byte   0x8f,0x20,0x8d,0x20,0x8d,0x20,0x81,0x00
        .byte   0x7f,0x20,0x79,0x00,0x79,0x00,0x78,0x20
        .byte   0x76,0x20,0x6b,0x00,0x69,0x20,0x5e,0x00
        .byte   0x5c,0x20,0x5b,0x30,0x52,0x10,0x51,0x30
        .byte   0x50,0x30,0x50,0x30,0x4f,0x20,0x4e,0x20
        .byte   0x4e,0x20,0x4d,0x20,0x46,0xa0,0x45,0xa0
        .byte   0x3d,0xa0,0x3d,0xa0,0x39,0x20,0x2a,0x00
        .byte   0x28,0x20,0x1e,0x00,0x1c,0x22,0x1c,0x22
        .byte   0x1b,0x20,0x1a,0x22,0x19,0x20,0x18,0x22
        .byte   0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22
        .byte   0x14,0xa0,0x13,0xa2,0x11,0xa0,0xff,0xff

; board 4
LB475:
        .byte   0xbe,0x00,0xbc,0x22,0xbb,0x30,0xb9,0x32
        .byte   0xb9,0x32,0xb7,0x30,0xb6,0x32,0xb5,0x30
        .byte   0xb4,0x32,0xb4,0x32,0xb3,0x20,0xb3,0x20
        .byte   0xb1,0xa0,0xb1,0xa0,0xb0,0xa2,0xaf,0xa0
        .byte   0xaf,0xa6,0xae,0xa0,0xae,0xa6,0xad,0xa4
        .byte   0xac,0xa0,0xac,0xa0,0xab,0xa0,0xaa,0xa0
        .byte   0xaa,0xa0,0xa2,0x80,0xa0,0xa0,0xa0,0xa0
        .byte   0x8d,0x80,0x8a,0xa0,0x7e,0x80,0x7b,0xa0
        .byte   0x79,0xa4,0x78,0xa0,0x77,0xa4,0x76,0xa0
        .byte   0x75,0xa4,0x74,0xa0,0x73,0xa4,0x72,0xa0
        .byte   0x71,0xa4,0x70,0xa0,0x6f,0xa4,0x6e,0xa0
        .byte   0x6d,0xa4,0x6c,0xa0,0x69,0x80,0x69,0x80
        .byte   0x67,0xa0,0x5e,0x20,0x58,0x24,0x57,0x20
        .byte   0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24
        .byte   0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24
        .byte   0x50,0x20,0x4f,0x24,0x4e,0x20,0x4d,0x24
        .byte   0x4c,0x20,0x4c,0x20,0x4b,0x24,0x4a,0x20
        .byte   0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20
        .byte   0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24
        .byte   0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04
        .byte   0x35,0x20,0x2e,0x04,0x2e,0x04,0x2d,0x20
        .byte   0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00
        .byte   0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30
        .byte   0x05,0x30,0xff,0xff

; board 3
LB531:
        .byte   0xcd,0x20,0xcc,0x20,0xcb,0x20,0xcb,0x20
        .byte   0xca,0x00,0xc9,0x20,0xc9,0x20,0xc8,0x20
        .byte   0xc1,0xa0,0xc0,0xa0,0xb8,0xa0,0xb8,0x20
        .byte   0xb4,0x20,0xa6,0x00,0xa4,0x20,0x99,0x00
        .byte   0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22
        .byte   0x94,0x20,0x93,0x22,0x93,0x22,0x91,0x20
        .byte   0x90,0x20,0x90,0x20,0x8d,0xa0,0x8c,0xa0
        .byte   0x7d,0xa2,0x7d,0xa2,0x7b,0xa0,0x7b,0xa0
        .byte   0x79,0xa2,0x79,0xa2,0x77,0xa0,0x77,0xa0
        .byte   0x76,0x80,0x75,0xa0,0x6e,0x20,0x67,0x24
        .byte   0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24
        .byte   0x63,0x24,0x61,0x20,0x60,0x24,0x5f,0x20
        .byte   0x5e,0x20,0x5d,0x24,0x5c,0x20,0x5b,0x24
        .byte   0x5a,0x20,0x59,0x24,0x58,0x20,0x56,0x20
        .byte   0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20
        .byte   0x52,0x20,0x4f,0x24,0x4f,0x24,0x4e,0x30
        .byte   0x4d,0x30,0x47,0x10,0x45,0x30,0x35,0x30
        .byte   0x33,0x10,0x31,0x30,0x31,0x30,0x1d,0x20
        .byte   0xff,0xff

; board 5
LB5C3:
        .byte   0xa9,0x20,0xa3,0x20,0xa2,0x20,0xa1,0x20
        .byte   0xa0,0x20,0xa0,0x20,0x9f,0x20,0x9f,0x20
        .byte   0x9e,0x20,0x9d,0x24,0x9d,0x24,0x9b,0x20
        .byte   0x9a,0x24,0x99,0x20,0x98,0x20,0x97,0x24
        .byte   0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00
        .byte   0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00
        .byte   0x91,0x20,0x90,0x20,0x90,0x20,0x8f,0x20
        .byte   0x8d,0x20,0x8d,0x20,0x81,0x00,0x7f,0x20
        .byte   0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20
        .byte   0x6b,0x00,0x69,0x20,0x5e,0x00,0x5c,0x20
        .byte   0x5b,0x30,0x52,0x10,0x51,0x30,0x50,0x30
        .byte   0x50,0x30,0x4f,0x20,0x4e,0x20,0x4e,0x20
        .byte   0x4d,0x20,0x46,0xa0,0x45,0xa0,0x3d,0xa0
        .byte   0x3d,0xa0,0x39,0x20,0x2a,0x00,0x28,0x20
        .byte   0x1e,0x00,0x1c,0x22,0x1c,0x22,0x1b,0x20
        .byte   0x1a,0x22,0x19,0x20,0x18,0x22,0x18,0x22
        .byte   0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xa0
        .byte   0x13,0xa2,0x11,0xa0

; All empty (0xFFs) in this gap

        .org    0xF780

; Two Tables used by data protocol handler

LF780:
        .byte   0x57,0x0b,0x00,0x00,0x00,0x00,0x08,0x00
        .byte   0x00,0x00,0x20,0x00,0x00,0x00,0x80,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
        .byte   0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00

LF7A0:
        .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x02,0x00
        .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x04,0x00
        .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        .byte   0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00

LF7C0:
        .byte   0x00
;
; All empty (0xFFs) in this gap
;
        .org    0xF800
; Reset
RESET:
        sei                     ; disable interrupts
        ldaa    #0x03
        staa    TMSK2           ; disable irqs, set prescaler to 16
        ldaa    #0x80
        staa    TMSK1           ; enable OC1 irq
        ldaa    #0xFE
        staa    BPROT           ; protect everything except $xE00-$xE1F
        ldaa    0x0007          ;
        cmpa    #0xDB           ; special unprotect mode???
        bne     LF81C           ; if not, jump ahead
        clr     BPROT           ; else unprotect everything
        clr     0x0007          ; reset special unprotect mode???
LF81C:
        lds     #0x01FF         ; init SP
        ldaa    #0xA5
        staa    CSCTL           ; enable external IO:
                                ; IO1EN,  BUSSEL, active LOW
                                ; IO2EN,  PIA/SCCSEL, active LOW
                                ; CSPROG, ROMSEL priority over RAMSEL 
                                ; CSPROG, ROMSEL enabled, 32K, $8000-$FFFF
        ldaa    #0x01
        staa    CSGSIZ          ; CSGEN,  RAMSEL active low
                                ; CSGEN,  RAMSEL 32K
        ldaa    #0x00
        staa    CSGADR          ; CSGEN,  RAMSEL = $0000-$7FFF (except internal regs)
        ldaa    #0xF0
        staa    CSSTRH          ; 3 cycle clock stretching on BUSSEL and LCRS
        clr     0x0000          ; ????? Done with basic init?

; Initialize Main PIA
        ldaa    #0x30           ;
        staa    PIA0CRA         ; control register A, CA2=0, sel DDRA
        staa    PIA0CRB         ; control register B, CB2=0, sel DDRB
        ldaa    #0xFF
        staa    PIA0DDRB        ; select B0-B7 to be outputs
        ldaa    #0x78           ;
        staa    PIA0DDRA        ; select A3-A6 to be outputs
        ldaa    #0x34           ;
        staa    PIA0CRA         ; select output register A
        staa    PIA0CRB         ; select output register B
        ldab    #0xFF
        jsr     BUTNLIT         ; turn on all button lights
        bra     LF86A           ; jump past data table

; data table for aux serial config
LF857:
        .byte   0x09,0x4a       ; channel reset B, MIE off, DLC on, no vector
        .byte   0x01,0x10       ; irq on all character received
        .byte   0x0c,0x18       ; Lower byte of time constant
        .byte   0x0d,0x00       ; Upper byte of time constant
        .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
        .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
        .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
        .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
        .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
        ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
        ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
        .byte   0xff            ; end of table marker

; init SCC (8530), aux serial config
LF86A:
        ldx     #LF857
LF86D:
        ldaa    0,X
        cmpa    #0xFF
        beq     LF879
        staa    SCCCTRLA
        inx
        bra     LF86D

; Setup normal SCI, 8 data bits, 1 stop bit
; Interrupts disabled, Transmitter and Receiver enabled
; prescaler = /13, SCR=/2, rate = 9600 baud at 16Mhz clock

LF879:
        ldaa    #0x00
        staa    SCCR1
        ldaa    #0x0C
        staa    SCCR2
        ldaa    #0x31
        staa    BAUD

; Initialize all RAM vectors to RTI: 
; Opcode 0x3b into vectors at 0x0100 through 0x0139

        ldx     #0x0100
        ldaa    #0x3B           ; RTI opcode
LF88D:
        staa    0,X
        inx
        inx
        inx
        cpx     #0x013C
        bcs     LF88D
        ldab    #0xF0
        stab    PIA0PRA         ; enable LCD backlight, disable RESET button light
        ldaa    #0x7E
        staa    (0x0003)        ; Put a jump instruction here???

; Non-destructive ram test:
;
; HC11 Internal RAM: 0x0000-0x3ff
; External NVRAM:    0x2000-0x7fff
;
; Note:
; External NVRAM:    0x0400-0xfff is also available, but not tested

        ldx     #0x0000
LF8A3:
        ldab    0,X             ; save value
        ldaa    #0x55
        staa    0,X
        cmpa    0,X
        bne     LF8C6
        rola
        staa    0,X
        cmpa    0,X
        bne     LF8C6
        stab    0,X             ; restore value
        inx
        cpx     #0x0400
        bne     LF8BF
        ldx     #0x2000
LF8BF:  
        cpx     #0x8000
        bne     LF8A3
        bra     LF8CA

LF8C6:
        ldaa    #0x01           ; Mark Failed RAM test
        staa    (0x0000)
; 
LF8CA:
        ldab    #0x01
        jsr     DIAGDGT         ; write digit 1 to diag display
        ldaa    BPROT  
        bne     LF8E3           ; if something is protected, jump ahead
        ldaa    (0x3000)        ; NVRAM
        cmpa    #0x7E
        bne     LF8E3           ; if RAM(0x3000) == 0x7E, jump ahead anyway (special unlock?)

; error?
        ldab    #0x0E
        jsr     DIAGDGT         ; write digit E to diag display
        jmp     (0x3000)        ; jump to routine in NVRAM?

; checking for serial connection

LF8E3:
        ldx     #0xF000         ; timeout counter
LF8E6:
        nop
        nop
        dex
        beq     LF8F6           ; if time is up, jump ahead
        jsr     SERIALR         ; else read serial data if available
        bcc     LF8E6           ; if no data available, loop
        cmpa    #0x1B           ; if serial data was read, is it an ESC?
        beq     LF91D           ; if so, jump to echo hex char routine?
        bra     LF8E6           ; else loop
LF8F6:
        ldaa    L8000           ; check if this is a regular rom?
        cmpa    #0x7E        
        bne     MINIMON         ; if not, jump ahead

        ldab    #0x0A
        jsr     DIAGDGT         ; else write digit A to diag display

        jsr     L8000           ; jump to start of rom routine
        sei                     ; if we ever come return, just loop and do it all again
        bra     LF8F6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MINIMON:
        ldab    #0x10           ; not a regular rom
        jsr     DIAGDGT         ; blank the diag display

        jsr     SERMSGW         ; enter the mini-monitor???
        .ascis  'MINI-MON'

        ldab    #0x10
        jsr     DIAGDGT         ; blank the diag display

LF91D:
        clr     (0x0005)
        clr     (0x0004)
        clr     (0x0002)
        clr     (0x0006)

        jsr     SERMSGW
        .ascis  '\r\n>'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; convert A to 2 hex digits and transmit
SERHEXW:
        psha
        lsra
        lsra
        lsra
        lsra
        jsr     LF938
        pula
LF938:
        anda    #0x0F
        oraa    #0x30
        cmpa    #0x3A
        bcs     LF942
        adda    #0x07
LF942:
        jmp     SERIALW

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; serial read non-blocking
SERIALR:
        ldaa    SCSR  
        bita    #0x20
        bne     LF955
        clc
        rts

; serial blocking read
SERBLKR:
        ldaa    SCSR            ; read serial status
        bita    #0x20
        beq     SERBLKR         ; if RDRF=0, loop

; read serial data, (assumes it's ready)
LF955:
        ldaa    SCSR            ; read serial status
        bita    #0x02
        bne     LF965           ; if FE=1, clear it
        bita    #0x08
        bne     LF965           ; if OR=1, clear it
        ldaa    SCDR            ; otherwise, good data
        sec
        rts

LF965:
        ldaa    SCDR            ; clear any error
        ldaa    #0x2F           ; '/'   
        jsr     SERIALW
        bra     SERBLKR         ; go to wait for a character

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Send A to SCI with CR turned to CRLF
SERIALW:
        cmpa    #0x0D           ; CR?
        beq     LF975           ; if so echo CR+LF
        bra     SERRAWW         ; else just echo it
LF975:
        ldaa    #0x0D
        jsr     SERRAWW
        ldaa    #0x0A

; send a char to SCI
SERRAWW:
        ldab    SCSR            ; wait for ready to send
        bitb    #0x40
        beq     SERRAWW
        staa    SCDR            ; send it
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Unused?
LF987:
        jsr     SERBLKR         ; get a serial char
        cmpa    #0x7A           ;'z'
        bhi     LF994
        cmpa    #0x61           ;'a'
        bcs     LF994
        sbca    #0x20           ;convert to upper case?
LF994:
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Write hex digit arg in B to diagnostic lights
; or B=0x10 or higher for blank

DIAGDGT:
        psha
        cmpb    #0x11
        bcs     LF99C
        ldab    #0x10
LF99C:
        ldx     #LF9B4
        abx
        ldaa    0,X
        staa    PIA0PRB         ; write arg to local data bus
        ldaa    PIA0PRA         ; read from Port A
        oraa    #0x20           ; bit 5 high
        staa    PIA0PRA         ; write back to Port A
        anda    #0xDF           ; bit 5 low
        staa    PIA0PRA         ; write back to Port A
        pula
        rts

; 7 segment patterns - XGFEDCBA
LF9B4:
        .byte   0xc0            ; 0
        .byte   0xf9            ; 1
        .byte   0xa4            ; 2
        .byte   0xb0            ; 3
        .byte   0x99            ; 4
        .byte   0x92            ; 5
        .byte   0x82            ; 6
        .byte   0xf8            ; 7
        .byte   0x80            ; 8
        .byte   0x90            ; 9
        .byte   0x88            ; A 
        .byte   0x83            ; b
        .byte   0xc6            ; C
        .byte   0xa1            ; d
        .byte   0x86            ; E
        .byte   0x8e            ; F
        .byte   0xff            ; blank

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Write arg in B to Button Lights
BUTNLIT:
        psha
        stab    PIA0PRB         ; write arg to local data bus
        ldaa    PIA0PRA         ; read from Port A
        anda    #0xEF           ; bit 4 low
        staa    PIA0PRA         ; write back to Port A
        oraa    #0x10           ; bit 4 high
        staa    PIA0PRA         ; write this to Port A
        pula
        rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Send rom message via SCI
SERMSGW:
        puly
LF9DA:
        ldaa    0,Y
        beq     LF9E8           ; if zero terminated, return
        bmi     LF9ED           ; if high bit set..do last char and return
        jsr     SERRAWW         ; else send char
        iny
        bra     LF9DA           ; and loop for next one

LF9E8:
        iny                     ; setup return address and return
        pshy
        rts

LF9ED:
        anda    #0x7F           ; remove top bit
        jsr     SERRAWW         ; send char
        bra     LF9E8           ; and we're done
        rts

DORTS:
        rts
DORTI:        
        rti

; all 0xffs in this gap

        .org    0xFFA0

        jmp     DORTS
        jmp     DORTS
        jmp     DORTS
        jmp     SERHEXW
        jmp     SERMSGW      
        jmp     SERIALR     
        jmp     SERIALW      
        jmp     MINIMON
        jmp     DIAGDGT 
        jmp     BUTNLIT 

       .byte    0xff
       .byte    0xff

; Vectors

       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI
       .word   DORTI            ; Stub RTI

        .word  0x0100           ; SCI
        .word  0x0103           ; SPI
        .word  0x0106           ; PA accum. input edge
        .word  0x0109           ; PA Overflow

        .word  DORTI            ; Stub RTI

        .word  0x010c           ; TI4O5
        .word  0x010f           ; TOC4
        .word  0x0112           ; TOC3
        .word  0x0115           ; TOC2
        .word  0x0118           ; TOC1
        .word  0x011b           ; TIC3
        .word  0x011e           ; TIC2
        .word  0x0121           ; TIC1
        .word  0x0124           ; RTI
        .word  0x0127           ; ~IRQ
        .word  0x012a           ; XIRQ
        .word  0x012d           ; SWI
        .word  0x0130           ; ILLEGAL OPCODE
        .word  0x0133           ; COP Failure
        .word  0x0136           ; COP Clock Monitor Fail

        .word  RESET            ; Reset

