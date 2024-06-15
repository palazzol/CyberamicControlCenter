                              1 
                              2 ;;;;;;;;;;;;;;;;;;;;;
                              3 ; Cyberstar v1.7
                              4 ;   by
                              5 ; David B. Philipsen
                              6 ;
                              7 ; Reverse-engineering
                              8 ;   by
                              9 ; Frank Palazzolo
                             10 ;;;;;;;;;;;;;;;;;;;;;
                             11 
                             12 ; 68HC11 Register definitions
                             13 
                     1000    14 PORTA       .equ    0x1000
                     1001    15 DDRA        .equ    0x1001
                     1002    16 PORTG       .equ    0x1002
                     1003    17 DDRG        .equ    0x1003
                     100A    18 PORTE       .equ    0x100a
                     1016    19 TOC1        .equ    0x1016
                     1018    20 TOC2        .equ    0x1018
                     1022    21 TMSK1       .equ    0x1022
                     1023    22 TFLG1       .equ    0x1023
                     1024    23 TMSK2       .equ    0x1024
                     102B    24 BAUD        .equ    0x102b
                     102C    25 SCCR1       .equ    0x102c
                     102D    26 SCCR2       .equ    0x102d
                     102E    27 SCSR        .equ    0x102e
                     102F    28 SCDR        .equ    0x102f
                     1035    29 BPROT       .equ    0x1035
                     103B    30 PPROG       .equ    0x103b
                     105C    31 CSSTRH      .equ    0x105c
                     105D    32 CSCTL       .equ    0x105d
                     105E    33 CSGADR      .equ    0x105e
                     105F    34 CSGSIZ      .equ    0x105f
                             35 
                             36 ;
                             37 ; An important note about Labels:
                             38 ;
                             39 ; Labels of the form LXXXX originally came from disassembly of Cyberstar1.6
                             40 ; Hence, the XXXX portion may not match the memory location in Cyberstar1.7
                             41 ; Preserving these label names allows easy comparisons between Cyberstar1.6 and 1.7
                             42 ;
                             43 ; Labels of the form LXXXXN come from new references in Cyberstar1.7
                             44 ; and the XXXX should match the routine location
                             45 ;
                             46 
                             47 ; Constants
                     197B    48 CHKSUM      .equ    0x197B
                             49 
                             50 ; RAM locations
                             51 
                     0010    52 T1NXT       .equ    0x0010      ; 0x0010/0x0011
                             53 
                             54 ; if not zero, these are decremented every 0.1 second by the timer 
                     001B    55 CDTIMR1     .equ    0x001b      ; 0x001b/0x001c
                     001D    56 CDTIMR2     .equ    0x001d      ; 0x001d/0x001e
                     001F    57 CDTIMR3     .equ    0x001f      ; 0x001f/0x0020
                     0021    58 CDTIMR4     .equ    0x0021      ; 0x0021/0x0022
                     0023    59 CDTIMR5     .equ    0x0023      ; 0x0023/0x0024
                             60 
                     0027    61 T30MS       .equ    0x0027      ; used to count t1 irqs for 30ms tasks
                             62 
                             63 ; offset counters
                     0070    64 OFFCNT1     .equ    0x0070
                     0071    65 OFFCNT2     .equ    0x0071
                     0072    66 OFFCNT3     .equ    0x0072
                     0073    67 OFFCNT4     .equ    0x0073
                     0074    68 OFFCNT5     .equ    0x0074
                             69 
                             70 ; bottom bit counts every other T1OC
                     00B0    71 TSCNT       .equ    0x00B0
                             72 
                             73 ; NVRAM locations
                             74 
                             75 ;           .equ    0x0400          ; 0x08 - CPU test at boot, others?
                             76 ;           .equ    0x0401          ; Rnd bits? (clears to 0x00)
                             77 ;           .equ    0x0402-0x0404   ; Reg digits (BCD)
                             78 ;           .equ    0x0405-0x0407   ; Liv digits (BCD)
                             79 ;           .equ    0x0408          ; 0x39 (rts) for CPU test?
                             80 
                     040B    81 CPYRTCS     .equ    0x040B          ; 0x040B/0x040C - copyright message checksum
                             82 ;           .equ    0x040D-0x040E   ; some counter? (600/65000?)
                     040F    83 ERASEFLG    .equ    0x040F          ; 0 = normal boot, 1 = erasing EEPROM
                             84 ;           .equ    0x0410-0x0411   ; some counter
                             85 ;           .equ    0x0412-0x0413   ; some counter
                             86 ;           .equ    0x0414-0x0415   ; counter - number of bad code validations
                             87 ;           .equ    0x0416-0x0417   ; counter - number of good code validations
                             88 ;           .equ    0x0418-0x0419   ; some counter
                             89 ;           .equ    0x041A-0x041B   ; some counter
                             90 
                             91 ;           .equ    0x0420-0x0421   ; some counter
                             92 ;           .equ    0x0422-0x0423   ; some counter
                             93 ;           .equ    0x0424-0x0425   ; some counter
                     0426    94 NUMBOOT     .equ    0x0426          ; counter - number of boots (0x0426/0x0427)
                             95 
                             96 ;           .equ    0x042A          ; King enable (bit 0?)
                             97 ;           .equ    0x042B          ; other Rnd? (clears to 0x00)
                             98 ;           .equ    0x042C-0x45B?   ; clears to 0xFF (revalid tapes?)
                             99 ;                                   ; relates to 0x0299-0x29B?
                            100 ;           .equ    0x045C          ; 00 from F7C0 stored here, R12/CNR?
                            101 
                            102 ;           .equ    0x0500-0x057F   ; LCD buffer: 32, 4-byte entries
                            103 
                            104 ;           .equ    0x0590-0x0598   ; buffer?
                            105 ;           .equ    0x05A0-         ; buffer?
                            106 
                            107 ;           .equ    0x2000-         ; STUDIO - programming mode ?
                            108 ;           .equ    0x3000-         ; ???
                            109 
                            110 ; EEPROM locations
                            111 
                            112 ;           .equ    0x0E00-0x0E0B   ; signature?
                            113 
                            114 ;           .equ    0x0E20-0x0E24   ; 4 bcd digit serial number + 0xDB
                            115 
                            116 ; Main PIA on CPU card
                     1804   117 PIA0PRA     .equ    0x1804      ; CRA-2 = 1
                     1804   118 PIA0DDRA    .equ    0x1804      ; CRA-2 = 0
                     1805   119 PIA0CRA     .equ    0x1805
                     1806   120 PIA0PRB     .equ    0x1806      ; CRB-2 = 1
                     1806   121 PIA0DDRB    .equ    0x1806      ; CRB-2 = 0
                     1807   122 PIA0CRB     .equ    0x1807
                            123 
                            124 ; Zilog 8530 SCC - A is aux serial, B is sync data
                     180C   125 SCCCTRLB    .equ    0x180C
                     180D   126 SCCCTRLA    .equ    0x180D
                     180E   127 SCCDATAB    .equ    0x180E
                     180F   128 SCCDATAA    .equ    0x180F
                            129 
                            130         .area   region1 (ABS)
   8000                     131         .org    0x8000
                            132 
                            133 ; Disassembly originally from unidasm
                            134 
   8000                     135 L8000:
   8000 7E 80 50      [ 3]  136         jmp     L8050           ; jump past copyright message
                            137 
   8003                     138 CPYRTMSG:
   8003 43 6F 70 79 72 69   139         .ascii  'Copyright (c) 1993 by David B. Philipsen Licensed by ShowBiz Pizza Time, Inc.'
        67 68 74 20 28 63
        29 20 31 39 39 33
        20 62 79 20 44 61
        76 69 64 20 42 2E
        20 50 68 69 6C 69
        70 73 65 6E 20 4C
        69 63 65 6E 73 65
        64 20 62 79 20 53
        68 6F 77 42 69 7A
        20 50 69 7A 7A 61
        20 54 69 6D 65 2C
        20 49 6E 63 2E
                            140 
   8050                     141 L8050:
   8050 0F            [ 2]  142         sei
                            143 
   8051 FC 04 26      [ 5]  144         ldd     NUMBOOT         ; increment boot cycle counter?
   8054 C3 00 01      [ 4]  145         addd    #0x0001
   8057 FD 04 26      [ 5]  146         std     NUMBOOT
                            147 
   805A CE AD 5A      [ 3]  148         ldx     #TASK2          ;
   805D FF 01 CE      [ 5]  149         stx     (0x01CE)        ; store this vector here?
   8060 7F 01 C7      [ 6]  150         clr     (0x01C7)        ; clear this vector?
   8063 CC 01 C6      [ 3]  151         ldd     #0x01C6         ;
   8066 FD 01 3E      [ 5]  152         std     (0x013E)        ; store this vector here? Some sort of RTI setup
   8069 7F 00 B0      [ 6]  153         clr     TSCNT
   806C 7F 00 4E      [ 6]  154         clr     (0x004E)
   806F 7F 00 B6      [ 6]  155         clr     (0x00B6)
   8072 7F 00 4D      [ 6]  156         clr     (0x004D)
   8075 86 03         [ 2]  157         ldaa    #0x03           ; ddr mode, enable CA1 L->H irq on
   8077 B7 10 A8      [ 4]  158         staa    (0x10A8)        ;   board 11
   807A 18 CE 00 80   [ 4]  159         ldy     #0x0080         ; delay loop
   807E                     160 L807E:
   807E 18 09         [ 4]  161         dey
   8080 26 FC         [ 3]  162         bne     L807E
   8082 86 11         [ 2]  163         ldaa    #0x11           ; ddr mode, enable CA1 H->L irq on
   8084 B7 10 A8      [ 4]  164         staa    (0x10A8)        ;   board 11
                            165 
   8087 C6 10         [ 2]  166         ldab    #0x10
   8089 BD FA C9      [ 6]  167         jsr     DIAGDGT         ; blank the diag display
                            168 
   808C B6 18 04      [ 4]  169         ldaa    PIA0PRA         ; turn off reset button light
   808F 84 BF         [ 2]  170         anda    #0xBF
   8091 B7 18 04      [ 4]  171         staa    PIA0PRA 
   8094 86 FF         [ 2]  172         ldaa    #0xFF
   8096 97 AC         [ 3]  173         staa    (0x00AC)        ; diagnostic indicator (all off)
                            174 
   8098 BD 86 D4      [ 6]  175         jsr     L86C4           ; Reset boards 1-10
   809B BD 99 B6      [ 6]  176         jsr     L99A6           ; do some stuff with diag digit??
   809E BD 8C 4C      [ 6]  177         jsr     L8C3C           ; reset LCD?
   80A1 BD 87 F8      [ 6]  178         jsr     L87E8           ; SCC - init aux serial
   80A4 BD 87 CC      [ 6]  179         jsr     L87BC           ; SCC - init sync data
   80A7 BD 8C 8E      [ 6]  180         jsr     L8C7E           ; reset LCD buffer
   80AA BD 8D 39      [ 6]  181         jsr     L8D29           ; some LCD command? (0C?)
   80AD BD 8B D0      [ 6]  182         jsr     L8BC0           ; setup Timer/SWI handlers
   80B0 BD 8B FE      [ 6]  183         jsr     L8BEE           ; ??? redundant?
   80B3 0E            [ 2]  184         cli
   80B4 BD A2 9B      [ 6]  185         jsr     LA25E           ; compute and store copyright checksum
   80B7 B6 04 0F      [ 4]  186         ldaa    ERASEFLG
   80BA 81 01         [ 2]  187         cmpa    #0x01           ; 1 means erase EEPROM!
   80BC 26 03         [ 3]  188         bne     L80C1
   80BE 7E A2 B2      [ 3]  189         jmp     LA275           ; erase EEPROM: skipped if ERASEFLG !=1
   80C1                     190 L80C1:
   80C1 FC 04 0B      [ 5]  191         ldd     CPYRTCS         ; copyright checksum
   80C4 1A 83 19 7B   [ 5]  192         cpd     #CHKSUM         ; check against copyright checksum value
   80C8 26 4C         [ 3]  193         bne     LOCKUP          ; if fail, bye bye
   80CA 5F            [ 2]  194         clrb
   80CB D7 62         [ 3]  195         stab    (0x0062)        ; button light buffer?
   80CD BD FA F9      [ 6]  196         jsr     BUTNLIT         ; turn off all button lights
   80D0 BD A3 7E      [ 6]  197         jsr     LA341           ; fire 3 bits on board 2
   80D3 B6 04 00      [ 4]  198         ldaa    (0x0400)
   80D6 81 08         [ 2]  199         cmpa    #0x08
   80D8 27 3F         [ 3]  200         beq     L811C           ; if 8, go directly to CPU test
   80DA 25 29         [ 3]  201         bcs     L8105           ; higher than 8, go to init setup, retaining L/R counts
   80DC 81 07         [ 2]  202         cmpa    #0x07
   80DE 27 25         [ 3]  203         beq     L8105           ; 7, go to init setup, retaining L/R counts
   80E0 CC 00 00      [ 3]  204         ldd     #0x0000         ; 6 or lower...
   80E3 FD 04 0D      [ 5]  205         std     (0x040D)        ; clear 040D/040E counter
   80E6 CC 00 C8      [ 3]  206         ldd     #0x00C8         ; wait up to 2 seconds for a serial byte
   80E9 DD 1B         [ 4]  207         std     CDTIMR1 
   80EB                     208 L80EB:
   80EB DC 1B         [ 4]  209         ldd     CDTIMR1
   80ED 27 0B         [ 3]  210         beq     L80FA           ; timeout
   80EF BD FA 79      [ 6]  211         jsr     SERIALR
   80F2 24 F7         [ 3]  212         bcc     L80EB
   80F4 81 44         [ 2]  213         cmpa    #0x44           ; if it's a 'D', do init setup + reset L/R counts
   80F6 26 F3         [ 3]  214         bne     L80EB           ; else keep looping for 2 seconds
   80F8 20 05         [ 3]  215         bra     L80FF           ; go to init setup
   80FA                     216 L80FA:
   80FA BD 9F 5B      [ 6]  217         jsr     L9F1E
   80FD 25 17         [ 3]  218         bcs     LOCKUP          ; bye bye
                            219 ; init setup + reset L and R counts
   80FF                     220 L80FF:
   80FF BD 9E EC      [ 6]  221         jsr     L9EAF           ; reset L counts
   8102 BD 9E CF      [ 6]  222         jsr     L9E92           ; reset R counts
                            223 ; init setup
   8105                     224 L8105:
   8105 86 39         [ 2]  225         ldaa    #0x39
   8107 B7 04 08      [ 4]  226         staa    0x0408          ; set rts here for later CPU test
   810A BD A2 12      [ 6]  227         jsr     LA1D5           ; set 0400 to 8, reprogram EE sig if needed
   810D B6 F7 C0      [ 4]  228         ldaa    LF7C0           ; a 00
   8110 B7 04 5C      [ 4]  229         staa    0x045C          ; set to R12 mode?
   8113 7E F8 00      [ 3]  230         jmp     RESET           ; reset!
                            231 
   8116 7E 81 16      [ 3]  232 LOCKUP: jmp     LOCKUP          ; infinite loop
                            233 
                            234 ; CPU test?
   8119                     235 L811C:
   8119 7F 00 79      [ 6]  236         clr     (0x0079)
   811C 7F 00 7C      [ 6]  237         clr     (0x007C)
   811F BD 04 08      [ 6]  238         jsr     0x0408          ; rts should be here
   8122 BD 80 13      [ 6]  239         jsr     (0x8013)        ; rts is here '9'
   8125 C6 FD         [ 2]  240         ldab    #0xFD           ; tape deck STOP
   8127 BD 86 F7      [ 6]  241         jsr     L86E7
   812A C6 DF         [ 2]  242         ldab    #0xDF
   812C BD 87 58      [ 6]  243         jsr     L8748   
   812F BD 87 A1      [ 6]  244         jsr     L8791   
   8132 BD 9B 07      [ 6]  245         jsr     L9AF7
   8135 BD 9C 61      [ 6]  246         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   8138 7F 00 62      [ 6]  247         clr     (0x0062)
   813B BD 99 E9      [ 6]  248         jsr     L99D9
   813E 24 16         [ 3]  249         bcc     L8159           ; if carry clear, test is passed
                            250 
   8140 BD 8D F4      [ 6]  251         jsr     LCDMSG1 
   8143 49 6E 76 61 6C 69   252         .ascis  'Invalid CPU!'
        64 20 43 50 55 A1
                            253 
   814F 86 53         [ 2]  254         ldaa    #0x53
   8151 7E 82 AD      [ 3]  255         jmp     L82A4
   8154 20 FE         [ 3]  256 L8157:  bra     L8157           ; infinite loop
                            257 
   8156                     258 L8159:
   8156 BD A3 91      [ 6]  259         jsr     LA354
   8159 7F 00 AA      [ 6]  260         clr     (0x00AA)
   815C 7D 00 00      [ 6]  261         tst     (0x0000)
   815F 27 15         [ 3]  262         beq     L8179
                            263 
   8161 BD 8D F4      [ 6]  264         jsr     LCDMSG1 
   8164 52 41 4D 20 74 65   265         .ascis  'RAM test failed!'
        73 74 20 66 61 69
        6C 65 64 A1
                            266 
   8174 20 44         [ 3]  267         bra     L81BD
                            268 
   8176                     269 L8179:
   8176 BD 8D F4      [ 6]  270         jsr     LCDMSG1 
   8179 33 32 4B 20 52 41   271         .ascis  '32K RAM OK'
        4D 20 4F CB
                            272 
                            273 ; R12 or CNR mode???
   8183 7D 04 5C      [ 6]  274         tst     (0x045C)        ; if this location is 0, good
   8186 26 08         [ 3]  275         bne     L8193
   8188 CC 52 0F      [ 3]  276         ldd     #0x520F         ; else print 'R' on the far left of the first line
   818B BD 8D C5      [ 6]  277         jsr     L8DB5           ; display char here on LCD display
   818E 20 06         [ 3]  278         bra     L8199
   8190                     279 L8193:
   8190 CC 43 0F      [ 3]  280         ldd     #0x430F         ; print 'C' on the far left of the first line
   8193 BD 8D C5      [ 6]  281         jsr     L8DB5           ; display char here on LCD display
                            282 
   8196                     283 L8199:
   8196 BD 8D ED      [ 6]  284         jsr     LCDMSG2 
   8199 52 4F 4D 20 43 68   285         .ascis  'ROM Chksum='
        6B 73 75 6D BD
                            286 
   81A4 BD 97 6F      [ 6]  287         jsr     L975F           ; print the checksum on the LCD
                            288 
   81A7 C6 02         [ 2]  289         ldab    #0x02           ; delay 2 secs
   81A9 BD 8C 12      [ 6]  290         jsr     DLYSECS         ;
                            291 
   81AC BD 9A 37      [ 6]  292         jsr     L9A27           ; display Serial #
   81AF BD 9F 09      [ 6]  293         jsr     L9ECC           ; display R and L counts
   81B2 BD 9B 29      [ 6]  294         jsr     L9B19           ; do the random motions if enabled
                            295 
   81B5 C6 02         [ 2]  296         ldab    #0x02           ; delay 2 secs
   81B7 BD 8C 12      [ 6]  297         jsr     DLYSECS         ;
                            298 
   81BA                     299 L81BD:
   81BA F6 10 2D      [ 4]  300         ldab    SCCR2           ; disable SCI receive data interrupts
   81BD C4 DF         [ 2]  301         andb    #0xDF
   81BF F7 10 2D      [ 4]  302         stab    SCCR2
                            303 
   81C2 BD 9B 07      [ 6]  304         jsr     L9AF7           ; clear a bunch of ram
   81C5 C6 FD         [ 2]  305         ldab    #0xFD           ; tape deck STOP
   81C7 BD 86 F7      [ 6]  306         jsr     L86E7           ;
   81CA BD 87 A1      [ 6]  307         jsr     L8791           ; Reset AVSEL1
                            308 
   81CD C6 00         [ 2]  309         ldab    #0x00           ; turn off button lights
   81CF D7 62         [ 3]  310         stab    (0x0062)
   81D1 BD FA F9      [ 6]  311         jsr     BUTNLIT
                            312 
   81D4                     313 L81D7:
   81D4 BD 8D F4      [ 6]  314         jsr     LCDMSG1 
   81D7 20 43 79 62 65 72   315         .ascis  ' Cyberstar v1.7'
        73 74 61 72 20 76
        31 2E B7
                            316 
   81E6 BD A3 1C      [ 6]  317         jsr     LA2DF
   81E9 24 11         [ 3]  318         bcc     L81FF
   81EB CC 52 0F      [ 3]  319         ldd     #0x520F
   81EE BD 8D C5      [ 6]  320         jsr     L8DB5           ; display 'R' at far right of 1st line
   81F1 7D 04 2A      [ 6]  321         tst     (0x042A)
   81F4 27 06         [ 3]  322         beq     L81FF
   81F6 CC 4B 0F      [ 3]  323         ldd     #0x4B0F
   81F9 BD 8D C5      [ 6]  324         jsr     L8DB5           ; display 'K' at far right of 1st line
   81FC                     325 L81FF:
   81FC BD 8D 13      [ 6]  326         jsr     L8D03
   81FF FC 02 9C      [ 5]  327         ldd     (0x029C)
   8202 1A 83 00 01   [ 5]  328         cpd     #0x0001
   8206 26 15         [ 3]  329         bne     L8220
                            330 
   8208 BD 8D ED      [ 6]  331         jsr     LCDMSG2 
   820B 20 44 61 76 65 27   332         .ascis  " Dave's system  "
        73 20 73 79 73 74
        65 6D 20 A0
                            333 
   821B 20 47         [ 3]  334         bra     L8267
   821D                     335 L8220:
   821D 1A 83 03 E8   [ 5]  336         cpd     #0x03E8
   8221 2D 1B         [ 3]  337         blt     L8241
   8223 1A 83 04 4B   [ 5]  338         cpd     #0x044B
   8227 22 15         [ 3]  339         bhi     L8241
                            340 
   8229 BD 8D ED      [ 6]  341         jsr     LCDMSG2 
   822C 20 20 20 53 50 54   342         .ascis  '   SPT Studio   '
        20 53 74 75 64 69
        6F 20 20 A0
                            343 
   823C 20 26         [ 3]  344         bra L8267
                            345 
   823E                     346 L8241:
   823E CC 0E 0C      [ 3]  347         ldd     #0x0E0C
   8241 DD AD         [ 4]  348         std     (0x00AD)
   8243 FC 04 0D      [ 5]  349         ldd     (0x040D)
   8246 1A 83 02 58   [ 5]  350         cpd     #0x0258         ; 600?
   824A 22 05         [ 3]  351         bhi     L8254
   824C CC 0E 09      [ 3]  352         ldd     #0x0E09
   824F DD AD         [ 4]  353         std     (0x00AD)
   8251                     354 L8254:
   8251 C6 29         [ 2]  355         ldab    #0x29
   8253 CE 0E 00      [ 3]  356         ldx     #0x0E00
   8256                     357 L8259:
   8256 A6 00         [ 4]  358         ldaa    0,X
   8258 4A            [ 2]  359         deca
   8259 08            [ 3]  360         inx
   825A 5C            [ 2]  361         incb
   825B 3C            [ 4]  362         pshx
   825C BD 8D C5      [ 6]  363         jsr     L8DB5           ; display char here on LCD display
   825F 38            [ 5]  364         pulx
   8260 9C AD         [ 5]  365         cpx     (0x00AD)
   8262 26 F2         [ 3]  366         bne     L8259
   8264                     367 L8267:
   8264 BD 9C 61      [ 6]  368         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   8267 7F 00 5B      [ 6]  369         clr     (0x005B)
   826A 7F 00 5A      [ 6]  370         clr     (0x005A)
   826D 7F 00 5E      [ 6]  371         clr     (0x005E)
   8270 7F 00 60      [ 6]  372         clr     (0x0060)
   8273                     373 L8276:
   8273 BD 9B 29      [ 6]  374         jsr     L9B19           ; do the random motions if enabled
   8276 96 60         [ 3]  375         ldaa    (0x0060)
   8278 27 06         [ 3]  376         beq     L8283
   827A BD A9 B9      [ 6]  377         jsr     LA97C
   827D 7E F8 00      [ 3]  378         jmp     RESET           ; reset controller
                            379 
   8280                     380 L8283:
                            381 ;        ldaa    PIA0PRA 
                            382 ;        anda    #0x06
                            383 ;        bne     L8292           ; skip credits if up and down are pressed?
   8280 BD 9D 01      [ 6]  384         jsr     L9CF1           ; print credits
   8283 C6 32         [ 2]  385         ldab    #0x32
   8285 BD 8C 32      [ 6]  386         jsr     DLYSECSBY100    ; delay 0.5 sec
                            387 
   8288 BD 9D 28      [ 6]  388         jsr     L9D28N          ; NEW
   828B CC 01 2C      [ 3]  389         ldd     #0x012C         ; NEW
   828E DD 23         [ 4]  390         std     0x0023          ; NEW
   8290                     391 L8290N:
   8290 BD 9B 29      [ 6]  392         jsr     L9B19           ; NEW
   8293 DC 23         [ 4]  393         ldd     0x0023          ; NEW
   8295 1A 83 00 00   [ 5]  394         cpd     #0x0000         ; NEW
   8299 27 0A         [ 3]  395         beq     L829C           ; NEW
                            396 
   829B                     397 L8292:
   829B BD 8E A5      [ 6]  398         jsr     L8E95           ; Was ENTER pressed?
   829E 81 0D         [ 2]  399         cmpa    #0x0D
   82A0 26 EE         [ 3]  400         bne     L8290N
   82A2 7E 92 A2      [ 3]  401         jmp     L9292           ; If so, go to diagnostics menu
   82A5                     402 L829C:
   82A5 BD FA 79      [ 6]  403         jsr     SERIALR
   82A8 25 03         [ 3]  404         bcs     L82A4
   82AA                     405 L82A1:
   82AA 7E 83 3C      [ 3]  406         jmp     L8333
                            407 
   82AD                     408 L82A4:
   82AD 81 44         [ 2]  409         cmpa    #0x44           ;'D'
   82AF 26 03         [ 3]  410         bne     L82AB
   82B1 7E A3 A3      [ 3]  411         jmp     LA366           ; go to Dave's Setup Utility
   82B4                     412 L82AB:
   82B4 81 53         [ 2]  413         cmpa    #0x53           ;'S'
   82B6 26 F2         [ 3]  414         bne     L82A1
                            415 
                            416 ; Serial Number Programming
                            417 
   82B8 BD FB 0C      [ 6]  418         jsr     SERMSGW         
   82BB 0A 0D 45 6E 74 65   419         .ascis  '\n\rEnter security code: '
        72 20 73 65 63 75
        72 69 74 79 20 63
        6F 64 65 3A A0
                            420 
   82D2 0F            [ 2]  421         sei
   82D3 BD A3 27      [ 6]  422         jsr     LA2EA
   82D6 0E            [ 2]  423         cli
   82D7 25 61         [ 3]  424         bcs     L8331
                            425 
   82D9 BD FB 0C      [ 6]  426         jsr     SERMSGW      
   82DC 0A 0D 45 45 50 52   427         .ascii '\n\rEEPROM serial number programming enabled.'
        4F 4D 20 73 65 72
        69 61 6C 20 6E 75
        6D 62 65 72 20 70
        72 6F 67 72 61 6D
        6D 69 6E 67 20 65
        6E 61 62 6C 65 64
        2E
   8307 0A 0D 50 6C 65 61   428         .ascis '\n\rPlease RESET the processor to continue\n\r'
        73 65 20 52 45 53
        45 54 20 74 68 65
        20 70 72 6F 63 65
        73 73 6F 72 20 74
        6F 20 63 6F 6E 74
        69 6E 75 65 0A 8D
                            429 
   8331 86 01         [ 2]  430         ldaa    #0x01           ; enable EEPROM erase
   8333 B7 04 0F      [ 4]  431         staa    ERASEFLG
   8336 86 DB         [ 2]  432         ldaa    #0xDB
   8338 97 07         [ 3]  433         staa    (0x0007)
                            434 ; need to reset to get out of this 
   833A 20 FE         [ 3]  435 L8331:  bra     L8331           ; infinite loop
                            436 
   833C                     437 L8333:
   833C 96 AA         [ 3]  438         ldaa    (0x00AA)
   833E 27 12         [ 3]  439         beq     L8349
   8340 DC 1B         [ 4]  440         ldd     CDTIMR1
   8342 26 0E         [ 3]  441         bne     L8349
   8344 D6 62         [ 3]  442         ldab    (0x0062)
   8346 C8 20         [ 2]  443         eorb    #0x20
   8348 D7 62         [ 3]  444         stab    (0x0062)
   834A BD FA F9      [ 6]  445         jsr     BUTNLIT 
   834D CC 00 32      [ 3]  446         ldd     #0x0032
   8350 DD 1B         [ 4]  447         std     CDTIMR1
   8352                     448 L8349:
   8352 BD 86 B2      [ 6]  449         jsr     L86A4
   8355 24 03         [ 3]  450         bcc     L8351
   8357 7E 82 73      [ 3]  451         jmp     L8276
   835A                     452 L8351:
   835A F6 10 2D      [ 4]  453         ldab    SCCR2  
   835D CA 20         [ 2]  454         orab    #0x20
   835F F7 10 2D      [ 4]  455         stab    SCCR2  
   8362 7F 00 AA      [ 6]  456         clr     (0x00AA)
   8365 D6 62         [ 3]  457         ldab    (0x0062)
   8367 C4 DF         [ 2]  458         andb    #0xDF
   8369 D7 62         [ 3]  459         stab    (0x0062)
   836B BD FA F9      [ 6]  460         jsr     BUTNLIT 
   836E C6 02         [ 2]  461         ldab    #0x02           ; delay 2 secs
   8370 BD 8C 12      [ 6]  462         jsr     DLYSECS         ;
   8373 96 7C         [ 3]  463         ldaa    (0x007C)
   8375 27 2D         [ 3]  464         beq     L839B
   8377 96 7F         [ 3]  465         ldaa    (0x007F)
   8379 97 4E         [ 3]  466         staa    (0x004E)
   837B D6 81         [ 3]  467         ldab    (0x0081)
   837D BD 87 58      [ 6]  468         jsr     L8748   
   8380 96 82         [ 3]  469         ldaa    (0x0082)
   8382 85 01         [ 2]  470         bita    #0x01
   8384 26 06         [ 3]  471         bne     L8383
   8386 96 AC         [ 3]  472         ldaa    (0x00AC)
   8388 84 FD         [ 2]  473         anda    #0xFD
   838A 20 04         [ 3]  474         bra     L8387
   838C                     475 L8383:
   838C 96 AC         [ 3]  476         ldaa    (0x00AC)
   838E 8A 02         [ 2]  477         oraa    #0x02
   8390                     478 L8387:
   8390 97 AC         [ 3]  479         staa    (0x00AC)
   8392 B7 18 06      [ 4]  480         staa    PIA0PRB 
   8395 B6 18 04      [ 4]  481         ldaa    PIA0PRA 
   8398 8A 20         [ 2]  482         oraa    #0x20
   839A B7 18 04      [ 4]  483         staa    PIA0PRA 
   839D 84 DF         [ 2]  484         anda    #0xDF
   839F B7 18 04      [ 4]  485         staa    PIA0PRA 
   83A2 20 14         [ 3]  486         bra     L83AF
   83A4                     487 L839B:
   83A4 FC 04 0D      [ 5]  488         ldd     (0x040D)
   83A7 1A 83 FD E8   [ 5]  489         cpd     #0xFDE8         ; 65000?
   83AB 22 06         [ 3]  490         bhi     L83AA
   83AD C3 00 01      [ 4]  491         addd    #0x0001
   83B0 FD 04 0D      [ 5]  492         std     (0x040D)
   83B3                     493 L83AA:
   83B3 C6 F7         [ 2]  494         ldab    #0xF7           ; tape deck REWIND
   83B5 BD 86 F7      [ 6]  495         jsr     L86E7
   83B8                     496 L83AF:
   83B8 7F 00 30      [ 6]  497         clr     (0x0030)
   83BB 7F 00 31      [ 6]  498         clr     (0x0031)
   83BE 7F 00 32      [ 6]  499         clr     (0x0032)
   83C1 BD 9B 29      [ 6]  500         jsr     L9B19           ; do the random motions if enabled   
   83C4 BD 86 B2      [ 6]  501         jsr     L86A4
   83C7 25 EF         [ 3]  502         bcs     L83AF
   83C9 96 79         [ 3]  503         ldaa    (0x0079)
   83CB 27 17         [ 3]  504         beq     L83DB
   83CD 7F 00 79      [ 6]  505         clr     (0x0079)
   83D0 96 B5         [ 3]  506         ldaa    (0x00B5)
   83D2 81 01         [ 2]  507         cmpa    #0x01
   83D4 26 07         [ 3]  508         bne     L83D4
   83D6 7F 00 B5      [ 6]  509         clr     (0x00B5)
   83D9 86 01         [ 2]  510         ldaa    #0x01
   83DB 97 7C         [ 3]  511         staa    (0x007C)
   83DD                     512 L83D4:
   83DD 86 01         [ 2]  513         ldaa    #0x01
   83DF 97 AA         [ 3]  514         staa    (0x00AA)
   83E1 7E 9A 8F      [ 3]  515         jmp     L9A7F
   83E4                     516 L83DB:
   83E4 BD 8D F4      [ 6]  517         jsr     LCDMSG1 
   83E7 20 20 20 44 56 44   518         .ascis  '   DVD  data    '
        20 20 64 61 74 61
        20 20 20 A0
                            519 
   83F7 D6 62         [ 3]  520         ldab    (0x0062)
   83F9 CA 80         [ 2]  521         orab    #0x80
   83FB D7 62         [ 3]  522         stab    (0x0062)
   83FD BD FA F9      [ 6]  523         jsr     BUTNLIT 
   8400 C6 FB         [ 2]  524         ldab    #0xFB           ; tape deck PLAY
   8402 BD 86 F7      [ 6]  525         jsr     L86E7
                            526 
   8405 BD 8D DF      [ 6]  527         jsr     LCDMSG1A
   8408 36 38 48 43 31 31   528         .ascis  '68HC11 Proto'
        20 50 72 6F 74 EF
                            529 
   8414 BD 8D E6      [ 6]  530         jsr     LCDMSG2A
   8417 64 62 F0            531         .ascis  'dbp'
                            532 
   841A C6 03         [ 2]  533         ldab    #0x03           ; delay 3 secs
   841C BD 8C 12      [ 6]  534         jsr     DLYSECS         ;
   841F 7D 00 7C      [ 6]  535         tst     (0x007C)
   8422 27 15         [ 3]  536         beq     L8430
   8424 D6 80         [ 3]  537         ldab    (0x0080)
   8426 D7 62         [ 3]  538         stab    (0x0062)
   8428 BD FA F9      [ 6]  539         jsr     BUTNLIT 
   842B D6 7D         [ 3]  540         ldab    (0x007D)
   842D D7 78         [ 3]  541         stab    (0x0078)
   842F D6 7E         [ 3]  542         ldab    (0x007E)
   8431 F7 10 8A      [ 4]  543         stab    (0x108A)
   8434 7F 00 7C      [ 6]  544         clr     (0x007C)
   8437 20 1D         [ 3]  545         bra     L844D
   8439                     546 L8430:
   8439 BD 8D 13      [ 6]  547         jsr     L8D03
   843C BD 9D 4F      [ 6]  548         jsr     L9D18
   843F 24 08         [ 3]  549         bcc     L8440
   8441 7D 00 B8      [ 6]  550         tst     (0x00B8)
   8444 27 F3         [ 3]  551         beq     L8430
   8446 7E 9A 70      [ 3]  552         jmp     L9A60
   8449                     553 L8440:
   8449 7D 00 B8      [ 6]  554         tst     (0x00B8)
   844C 27 EB         [ 3]  555         beq     L8430
   844E 7F 00 30      [ 6]  556         clr     (0x0030)
   8451 7F 00 31      [ 6]  557         clr     (0x0031)
   8454 20 00         [ 3]  558         bra     L844D
   8456                     559 L844D:
   8456 96 49         [ 3]  560         ldaa    (0x0049)
   8458 26 03         [ 3]  561         bne     L8454
   845A 7E 85 AD      [ 3]  562         jmp     L85A4
   845D                     563 L8454:
   845D 7F 00 49      [ 6]  564         clr     (0x0049)
   8460 81 31         [ 2]  565         cmpa    #0x31
   8462 26 08         [ 3]  566         bne     L8463
   8464 BD A3 63      [ 6]  567         jsr     LA326
   8467 BD 8D 52      [ 6]  568         jsr     L8D42
   846A 20 EA         [ 3]  569         bra     L844D
   846C                     570 L8463:
   846C 81 32         [ 2]  571         cmpa    #0x32
   846E 26 08         [ 3]  572         bne     L846F
   8470 BD A3 63      [ 6]  573         jsr     LA326
   8473 BD 8D 45      [ 6]  574         jsr     L8D35
   8476 20 DE         [ 3]  575         bra     L844D
   8478                     576 L846F:
   8478 81 54         [ 2]  577         cmpa    #0x54
   847A 26 08         [ 3]  578         bne     L847B
   847C BD A3 63      [ 6]  579         jsr     LA326
   847F BD 8D 52      [ 6]  580         jsr     L8D42
   8482 20 D2         [ 3]  581         bra     L844D
   8484                     582 L847B:
   8484 81 5A         [ 2]  583         cmpa    #0x5A
   8486 26 1C         [ 3]  584         bne     L849B
   8488                     585 L847F:
   8488 BD A3 5B      [ 6]  586         jsr     LA31E
   848B BD 8E A5      [ 6]  587         jsr     L8E95
   848E 7F 00 32      [ 6]  588         clr     (0x0032)
   8491 7F 00 31      [ 6]  589         clr     (0x0031)
   8494 7F 00 30      [ 6]  590         clr     (0x0030)
   8497 BD 99 B6      [ 6]  591         jsr     L99A6
   849A D6 7B         [ 3]  592         ldab    (0x007B)
   849C CA 0C         [ 2]  593         orab    #0x0C
   849E BD 87 58      [ 6]  594         jsr     L8748   
   84A1 7E 81 BA      [ 3]  595         jmp     L81BD
   84A4                     596 L849B:
   84A4 81 42         [ 2]  597         cmpa    #0x42
   84A6 26 03         [ 3]  598         bne     L84A2
   84A8 7E 98 4C      [ 3]  599         jmp     L983C
   84AB                     600 L84A2:
   84AB 81 4D         [ 2]  601         cmpa    #0x4D
   84AD 26 03         [ 3]  602         bne     L84A9
   84AF 7E 98 34      [ 3]  603         jmp     L9824
   84B2                     604 L84A9:
   84B2 81 45         [ 2]  605         cmpa    #0x45
   84B4 26 03         [ 3]  606         bne     L84B0
   84B6 7E 98 12      [ 3]  607         jmp     L9802
   84B9                     608 L84B0:
   84B9 81 58         [ 2]  609         cmpa    #0x58
   84BB 26 05         [ 3]  610         bne     L84B9
   84BD 7E 99 4F      [ 3]  611         jmp     L993F
   84C0 20 94         [ 3]  612         bra     L844D
   84C2                     613 L84B9:
   84C2 81 46         [ 2]  614         cmpa    #0x46
   84C4 26 03         [ 3]  615         bne     L84C0
   84C6 7E 99 81      [ 3]  616         jmp     L9971
   84C9                     617 L84C0:
   84C9 81 47         [ 2]  618         cmpa    #0x47
   84CB 26 03         [ 3]  619         bne     L84C7
   84CD 7E 99 8B      [ 3]  620         jmp     L997B
   84D0                     621 L84C7:
   84D0 81 48         [ 2]  622         cmpa    #0x48
   84D2 26 03         [ 3]  623         bne     L84CE
   84D4 7E 99 95      [ 3]  624         jmp     L9985
   84D7                     625 L84CE:
   84D7 81 49         [ 2]  626         cmpa    #0x49
   84D9 26 03         [ 3]  627         bne     L84D5
   84DB 7E 99 9F      [ 3]  628         jmp     L998F
   84DE                     629 L84D5:
   84DE 81 53         [ 2]  630         cmpa    #0x53
   84E0 26 03         [ 3]  631         bne     L84DC
   84E2 7E 97 CA      [ 3]  632         jmp     L97BA
   84E5                     633 L84DC:
   84E5 81 59         [ 2]  634         cmpa    #0x59
   84E7 26 03         [ 3]  635         bne     L84E3
   84E9 7E 99 E2      [ 3]  636         jmp     L99D2
   84EC                     637 L84E3:
   84EC 81 57         [ 2]  638         cmpa    #0x57
   84EE 26 03         [ 3]  639         bne     L84EA
   84F0 7E 9A B4      [ 3]  640         jmp     L9AA4
   84F3                     641 L84EA:
   84F3 81 41         [ 2]  642         cmpa    #0x41
   84F5 26 17         [ 3]  643         bne     L8505
   84F7 BD 9D 4F      [ 6]  644         jsr     L9D18
   84FA 25 09         [ 3]  645         bcs     L84FC
   84FC 7F 00 30      [ 6]  646         clr     (0x0030)
   84FF 7F 00 31      [ 6]  647         clr     (0x0031)
   8502 7E 85 AD      [ 3]  648         jmp     L85A4
   8505                     649 L84FC:
   8505 7F 00 30      [ 6]  650         clr     (0x0030)
   8508 7F 00 31      [ 6]  651         clr     (0x0031)
   850B 7E 9A 8F      [ 3]  652         jmp     L9A7F
   850E                     653 L8505:
   850E 81 4B         [ 2]  654         cmpa    #0x4B
   8510 26 0B         [ 3]  655         bne     L8514
   8512 BD 9D 4F      [ 6]  656         jsr     L9D18
   8515 25 03         [ 3]  657         bcs     L8511
   8517 7E 85 AD      [ 3]  658         jmp     L85A4
   851A                     659 L8511:
   851A 7E 9A 8F      [ 3]  660         jmp     L9A7F
   851D                     661 L8514:
   851D 81 4A         [ 2]  662         cmpa    #0x4A
   851F 26 07         [ 3]  663         bne     L851F
   8521 86 01         [ 2]  664         ldaa    #0x01
   8523 97 AF         [ 3]  665         staa    (0x00AF)
   8525 7E 98 4C      [ 3]  666         jmp     L983C
   8528                     667 L851F:
   8528 81 4E         [ 2]  668         cmpa    #0x4E
   852A 26 0B         [ 3]  669         bne     L852E
   852C B6 10 8A      [ 4]  670         ldaa    (0x108A)
   852F 8A 02         [ 2]  671         oraa    #0x02
   8531 B7 10 8A      [ 4]  672         staa    (0x108A)
   8534 7E 84 56      [ 3]  673         jmp     L844D
   8537                     674 L852E:
   8537 81 4F         [ 2]  675         cmpa    #0x4F
   8539 26 06         [ 3]  676         bne     L8538
   853B BD 9D 4F      [ 6]  677         jsr     L9D18
   853E 7E 84 56      [ 3]  678         jmp     L844D
   8541                     679 L8538:
   8541 81 50         [ 2]  680         cmpa    #0x50
   8543 26 06         [ 3]  681         bne     L8542
   8545 BD 9D 4F      [ 6]  682         jsr     L9D18
   8548 7E 84 56      [ 3]  683         jmp     L844D
   854B                     684 L8542:
   854B 81 51         [ 2]  685         cmpa    #0x51
   854D 26 0B         [ 3]  686         bne     L8551
   854F B6 10 8A      [ 4]  687         ldaa    (0x108A)
   8552 8A 04         [ 2]  688         oraa    #0x04
   8554 B7 10 8A      [ 4]  689         staa    (0x108A)
   8557 7E 84 56      [ 3]  690         jmp     L844D
   855A                     691 L8551:
   855A 81 55         [ 2]  692         cmpa    #0x55
   855C 26 07         [ 3]  693         bne     L855C
   855E C6 01         [ 2]  694         ldab    #0x01
   8560 D7 B6         [ 3]  695         stab    (0x00B6)
   8562 7E 84 56      [ 3]  696         jmp     L844D
   8565                     697 L855C:
   8565 81 4C         [ 2]  698         cmpa    #0x4C
   8567 26 19         [ 3]  699         bne     L8579
   8569 7F 00 49      [ 6]  700         clr     (0x0049)
   856C BD 9D 4F      [ 6]  701         jsr     L9D18
   856F 25 0E         [ 3]  702         bcs     L8576
   8571 BD AB 25      [ 6]  703         jsr     LAAE8
   8574 BD AB 93      [ 6]  704         jsr     LAB56
   8577 24 06         [ 3]  705         bcc     L8576
   8579 BD AB 62      [ 6]  706         jsr     LAB25
   857C BD AB 83      [ 6]  707         jsr     LAB46
   857F                     708 L8576:
   857F 7E 84 56      [ 3]  709         jmp     L844D
   8582                     710 L8579:
   8582 81 52         [ 2]  711         cmpa    #0x52
   8584 26 1A         [ 3]  712         bne     L8597
   8586 7F 00 49      [ 6]  713         clr     (0x0049)
   8589 BD 9D 4F      [ 6]  714         jsr     L9D18
   858C 25 0F         [ 3]  715         bcs     L8594
   858E BD AB 25      [ 6]  716         jsr     LAAE8
   8591 BD AB 93      [ 6]  717         jsr     LAB56
   8594 25 07         [ 3]  718         bcs     L8594
   8596 86 FF         [ 2]  719         ldaa    #0xFF
   8598 A7 00         [ 4]  720         staa    0,X
   859A BD AB 25      [ 6]  721         jsr     LAAE8
   859D                     722 L8594:
   859D 7E 84 56      [ 3]  723         jmp     L844D
   85A0                     724 L8597:
   85A0 81 44         [ 2]  725         cmpa    #0x44
   85A2 26 09         [ 3]  726         bne     L85A4
   85A4 7F 00 49      [ 6]  727         clr     (0x0049)
   85A7 BD AB EB      [ 6]  728         jsr     LABAE
   85AA 7E 84 56      [ 3]  729         jmp     L844D
   85AD                     730 L85A4:
   85AD 7D 00 75      [ 6]  731         tst     (0x0075)
   85B0 26 56         [ 3]  732         bne     L85FF
   85B2 7D 00 79      [ 6]  733         tst     (0x0079)
   85B5 26 51         [ 3]  734         bne     L85FF
   85B7 7D 00 30      [ 6]  735         tst     (0x0030)
   85BA 26 07         [ 3]  736         bne     L85BA
   85BC 96 5B         [ 3]  737         ldaa    (0x005B)
   85BE 27 48         [ 3]  738         beq     L85FF
   85C0 7F 00 5B      [ 6]  739         clr     (0x005B)
   85C3                     740 L85BA:
   85C3 CC 00 64      [ 3]  741         ldd     #0x0064
   85C6 DD 23         [ 4]  742         std     CDTIMR5
   85C8                     743 L85BF:
   85C8 DC 23         [ 4]  744         ldd     CDTIMR5
   85CA 27 14         [ 3]  745         beq     L85D7
   85CC BD 9B 29      [ 6]  746         jsr     L9B19           ; do the random motions if enabled
   85CF B6 18 04      [ 4]  747         ldaa    PIA0PRA 
   85D2 88 FF         [ 2]  748         eora    #0xFF
   85D4 84 06         [ 2]  749         anda    #0x06
   85D6 81 06         [ 2]  750         cmpa    #0x06
   85D8 26 EE         [ 3]  751         bne     L85BF
   85DA 7F 00 30      [ 6]  752         clr     (0x0030)
   85DD 7E 86 89      [ 3]  753         jmp     L8680
   85E0                     754 L85D7:
   85E0 7F 00 30      [ 6]  755         clr     (0x0030)
   85E3 D6 62         [ 3]  756         ldab    (0x0062)
   85E5 C8 02         [ 2]  757         eorb    #0x02
   85E7 D7 62         [ 3]  758         stab    (0x0062)
   85E9 BD FA F9      [ 6]  759         jsr     BUTNLIT 
   85EC C4 02         [ 2]  760         andb    #0x02
   85EE 27 0D         [ 3]  761         beq     L85F4
   85F0 BD AA 55      [ 6]  762         jsr     LAA18
   85F3 C6 1E         [ 2]  763         ldab    #0x1E
   85F5 BD 8C 32      [ 6]  764         jsr     DLYSECSBY100    ; delay 0.3 sec
   85F8 7F 00 30      [ 6]  765         clr     (0x0030)
   85FB 20 0B         [ 3]  766         bra     L85FF
   85FD                     767 L85F4:
   85FD BD AA 5A      [ 6]  768         jsr     LAA1D
   8600 C6 1E         [ 2]  769         ldab    #0x1E
   8602 BD 8C 32      [ 6]  770         jsr     DLYSECSBY100    ; delay 0.3 sec
   8605 7F 00 30      [ 6]  771         clr     (0x0030)
   8608                     772 L85FF:
   8608 BD 9B 29      [ 6]  773         jsr     L9B19           ; do the random motions if enabled
   860B B6 10 0A      [ 4]  774         ldaa    PORTE
   860E 84 10         [ 2]  775         anda    #0x10
   8610 27 0B         [ 3]  776         beq     L8614
   8612 B6 18 04      [ 4]  777         ldaa    PIA0PRA 
   8615 88 FF         [ 2]  778         eora    #0xFF
   8617 84 07         [ 2]  779         anda    #0x07
   8619 81 06         [ 2]  780         cmpa    #0x06
   861B 26 1C         [ 3]  781         bne     L8630
   861D                     782 L8614:
   861D 7D 00 76      [ 6]  783         tst     (0x0076)
   8620 26 17         [ 3]  784         bne     L8630
   8622 7D 00 75      [ 6]  785         tst     (0x0075)
   8625 26 12         [ 3]  786         bne     L8630
   8627 D6 62         [ 3]  787         ldab    (0x0062)
   8629 C4 FC         [ 2]  788         andb    #0xFC
   862B D7 62         [ 3]  789         stab    (0x0062)
   862D BD FA F9      [ 6]  790         jsr     BUTNLIT 
   8630 BD AA 50      [ 6]  791         jsr     LAA13
   8633 BD AA 5A      [ 6]  792         jsr     LAA1D
   8636 7E 9A 70      [ 3]  793         jmp     L9A60
   8639                     794 L8630:
   8639 7D 00 31      [ 6]  795         tst     (0x0031)
   863C 26 07         [ 3]  796         bne     L863C
   863E 96 5A         [ 3]  797         ldaa    (0x005A)
   8640 27 47         [ 3]  798         beq     L8680
   8642 7F 00 5A      [ 6]  799         clr     (0x005A)
   8645                     800 L863C:
   8645 CC 00 64      [ 3]  801         ldd     #0x0064
   8648 DD 23         [ 4]  802         std     CDTIMR5
   864A                     803 L8641:
   864A DC 23         [ 4]  804         ldd     CDTIMR5
   864C 27 13         [ 3]  805         beq     L8658
   864E BD 9B 29      [ 6]  806         jsr     L9B19           ; do the random motions if enabled
   8651 B6 18 04      [ 4]  807         ldaa    PIA0PRA 
   8654 88 FF         [ 2]  808         eora    #0xFF
   8656 84 06         [ 2]  809         anda    #0x06
   8658 81 06         [ 2]  810         cmpa    #0x06
   865A 26 EE         [ 3]  811         bne     L8641
   865C 7F 00 31      [ 6]  812         clr     (0x0031)
   865F 20 28         [ 3]  813         bra     L8680
   8661                     814 L8658:
   8661 7F 00 31      [ 6]  815         clr     (0x0031)
   8664 D6 62         [ 3]  816         ldab    (0x0062)
   8666 C8 01         [ 2]  817         eorb    #0x01
   8668 D7 62         [ 3]  818         stab    (0x0062)
   866A BD FA F9      [ 6]  819         jsr     BUTNLIT 
   866D C4 01         [ 2]  820         andb    #0x01
   866F 27 0D         [ 3]  821         beq     L8675
   8671 BD AA 49      [ 6]  822         jsr     LAA0C
   8674 C6 1E         [ 2]  823         ldab    #0x1E
   8676 BD 8C 32      [ 6]  824         jsr     DLYSECSBY100    ; delay 0.3 sec
   8679 7F 00 31      [ 6]  825         clr     (0x0031)
   867C 20 0B         [ 3]  826         bra     L8680
   867E                     827 L8675:
   867E BD AA 50      [ 6]  828         jsr     LAA13
   8681 C6 1E         [ 2]  829         ldab    #0x1E
   8683 BD 8C 32      [ 6]  830         jsr     DLYSECSBY100    ; delay 0.3 sec
   8686 7F 00 31      [ 6]  831         clr     (0x0031)
   8689                     832 L8680:
   8689 20 24         [ 3]  833         bra     L86A1           ; NEW
   868B BD 86 B2      [ 6]  834         jsr     L86A4
   868E 25 1F         [ 3]  835         bcs     L86A1
   8690 7E 86 AF      [ 3]  836         jmp     L86A1           ; NEW
   8693 7F 00 4E      [ 6]  837         clr     (0x004E)
   8696 BD 99 B6      [ 6]  838         jsr     L99A6
   8699 BD 86 D4      [ 6]  839         jsr     L86C4           ; Reset boards 1-10
   869C 5F            [ 2]  840         clrb
   869D D7 62         [ 3]  841         stab    (0x0062)
   869F BD FA F9      [ 6]  842         jsr     BUTNLIT 
   86A2 C6 FD         [ 2]  843         ldab    #0xFD           ; tape deck STOP
   86A4 BD 86 F7      [ 6]  844         jsr     L86E7
   86A7 C6 04         [ 2]  845         ldab    #0x04           ; delay 4 secs
   86A9 BD 8C 12      [ 6]  846         jsr     DLYSECS         ;
   86AC 7E 84 88      [ 3]  847         jmp     L847F
   86AF                     848 L86A1:
   86AF 7E 84 56      [ 3]  849         jmp     L844D
                            850 
   86B2                     851 L86A4:
   86B2 BD 9B 29      [ 6]  852         jsr     L9B19           ; do the random motions if enabled
   86B5 7F 00 23      [ 6]  853         clr     CDTIMR5
   86B8 86 19         [ 2]  854         ldaa    #0x19
   86BA 97 24         [ 3]  855         staa    CDTIMR5+1
   86BC 0C            [ 2]  856         clc                     ; NEW
   86BD 39            [ 5]  857         rts                     ; NEW
   86BE B6 10 0A      [ 4]  858         ldaa    PORTE
   86C1 84 80         [ 2]  859         anda    #0x80
   86C3 27 02         [ 3]  860         beq     L86B7
   86C5                     861 L86B5:
   86C5 0D            [ 2]  862         sec
   86C6 39            [ 5]  863         rts
                            864 
   86C7                     865 L86B7:
   86C7 B6 10 0A      [ 4]  866         ldaa    PORTE
   86CA 84 80         [ 2]  867         anda    #0x80
   86CC 26 F7         [ 3]  868         bne     L86B5
   86CE 96 24         [ 3]  869         ldaa    CDTIMR5+1
   86D0 26 F5         [ 3]  870         bne     L86B7
   86D2 0C            [ 2]  871         clc
   86D3 39            [ 5]  872         rts
                            873 
                            874 ; Reset boards 1-10 at:
                            875 ;         0x1080, 0x1084, 0x1088, 0x108c
                            876 ;         0x1090, 0x1094, 0x1098, 0x109c
                            877 ;         0x10a0, 0x10a4
                            878 
   86D4                     879 L86C4:
   86D4 CE 10 80      [ 3]  880         ldx     #0x1080
   86D7                     881 L86C7:
   86D7 86 30         [ 2]  882         ldaa    #0x30
   86D9 A7 01         [ 4]  883         staa    1,X             ; 0x30 -> PIAxCRA, CA2 low, DDR
   86DB A7 03         [ 4]  884         staa    3,X             ; 0x30 -> PIAxCRB, CB2 low, DDR
   86DD 86 FF         [ 2]  885         ldaa    #0xFF
   86DF A7 00         [ 4]  886         staa    0,X             ; 0xFF -> PIAxDDRA, all outputs
   86E1 A7 02         [ 4]  887         staa    2,X             ; 0xFF -> PIAxDDRB, all outputs
   86E3 86 34         [ 2]  888         ldaa    #0x34
   86E5 A7 01         [ 4]  889         staa    1,X             ; 0x34 -> PIAxCRA, CA2 low, PR
   86E7 A7 03         [ 4]  890         staa    3,X             ; 0x34 -> PIAxCRB, CA2 low, PR
   86E9 6F 00         [ 6]  891         clr     0,X             ; 0x00 -> PIAxPRA, all outputs low
   86EB 6F 02         [ 6]  892         clr     2,X             ; 0x00 -> PIAxPRB, all outputs low
   86ED 08            [ 3]  893         inx
   86EE 08            [ 3]  894         inx
   86EF 08            [ 3]  895         inx
   86F0 08            [ 3]  896         inx
   86F1 8C 10 A4      [ 4]  897         cpx     #0x10A4
   86F4 2F E1         [ 3]  898         ble     L86C7
   86F6 39            [ 5]  899         rts
                            900 
                            901 ; Set the tape deck to STOP, PLAY, REWIND, or EJECT
                            902 ;                B =   0xFD, 0xFB,   0xF7, or  0xEF
   86F7                     903 L86E7:
   86F7 36            [ 3]  904         psha
   86F8 BD 9B 29      [ 6]  905         jsr     L9B19           ; do the random motions if enabled
   86FB 96 AC         [ 3]  906         ldaa    (0x00AC)        ; A = diag buffer?
   86FD C1 FB         [ 2]  907         cmpb    #0xFB           ; if bit 2 of B is 0 (PLAY)
   86FF 26 04         [ 3]  908         bne     L86F5
   8701 84 FE         [ 2]  909         anda    #0xFE           ; clear A bit 0 (top)
   8703 20 0E         [ 3]  910         bra     L8703
   8705                     911 L86F5:
   8705 C1 F7         [ 2]  912         cmpb    #0xF7           ; if bit 3 of B is 0 (REWIND)
   8707 26 04         [ 3]  913         bne     L86FD
   8709 84 BF         [ 2]  914         anda    #0xBF           ; clear A bit 6 (middle)
   870B 20 06         [ 3]  915         bra     L8703
   870D                     916 L86FD:
   870D C1 FD         [ 2]  917         cmpb    #0xFD           ; if bit 1 of B is 0 (STOP)
   870F 26 02         [ 3]  918         bne     L8703
   8711 84 F7         [ 2]  919         anda    #0xF7           ; clear A bit 3 (bottom)
   8713                     920 L8703:
   8713 97 AC         [ 3]  921         staa    (0x00AC)        ; update diag display buffer
   8715 B7 18 06      [ 4]  922         staa    PIA0PRB         ; init bus based on A
   8718 BD 87 4A      [ 6]  923         jsr     L873A           ; clock diagnostic indicator
   871B 96 7A         [ 3]  924         ldaa    (0x007A)        ; buffer for tape deck / av switcher?
   871D 84 01         [ 2]  925         anda    #0x01           ; preserve a/v switcher bit
   871F 97 7A         [ 3]  926         staa    (0x007A)        ; 
   8721 C4 FE         [ 2]  927         andb    #0xFE           ; set bits 7-1 based on B arg
   8723 DA 7A         [ 3]  928         orab    (0x007A)        
   8725 F7 18 06      [ 4]  929         stab    PIA0PRB         ; put that on the bus
   8728 BD 87 85      [ 6]  930         jsr     L8775           ; clock the tape deck
   872B C6 32         [ 2]  931         ldab    #0x32
   872D BD 8C 32      [ 6]  932         jsr     DLYSECSBY100    ; delay 0.5 sec
   8730 C6 FE         [ 2]  933         ldab    #0xFE
   8732 DA 7A         [ 3]  934         orab    (0x007A)        ; all tape bits off
   8734 F7 18 06      [ 4]  935         stab    PIA0PRB         ; unpress tape buttons
   8737 D7 7A         [ 3]  936         stab    (0x007A)
   8739 BD 87 85      [ 6]  937         jsr     L8775           ; clock the tape deck
   873C 96 AC         [ 3]  938         ldaa    (0x00AC)
   873E 8A 49         [ 2]  939         oraa    #0x49           ; reset bits top,mid,bot
   8740 97 AC         [ 3]  940         staa    (0x00AC)
   8742 B7 18 06      [ 4]  941         staa    PIA0PRB 
   8745 BD 87 4A      [ 6]  942         jsr     L873A           ; clock diagnostic indicator
   8748 32            [ 4]  943         pula
   8749 39            [ 5]  944         rts
                            945 
                            946 ; clock diagnostic indicator
   874A                     947 L873A:
   874A B6 18 04      [ 4]  948         ldaa    PIA0PRA 
   874D 8A 20         [ 2]  949         oraa    #0x20
   874F B7 18 04      [ 4]  950         staa    PIA0PRA 
   8752 84 DF         [ 2]  951         anda    #0xDF
   8754 B7 18 04      [ 4]  952         staa    PIA0PRA 
   8757 39            [ 5]  953         rts
                            954 
   8758                     955 L8748:
   8758 36            [ 3]  956         psha
   8759 37            [ 3]  957         pshb
   875A 96 AC         [ 3]  958         ldaa    (0x00AC)        ; update state machine at AC?
                            959                                 ;      gfedcba
   875C 8A 30         [ 2]  960         oraa    #0x30           ; set bb11bbbb
   875E 84 FD         [ 2]  961         anda    #0xFD           ; clr bb11bb0b
   8760 C5 20         [ 2]  962         bitb    #0x20           ; tst bit 5 (f)
   8762 26 02         [ 3]  963         bne     L8756           ; 
   8764 8A 02         [ 2]  964         oraa    #0x02           ; set bit 1 (b)
   8766                     965 L8756:
   8766 C5 04         [ 2]  966         bitb    #0x04           ; tst bit 2 (c)
   8768 26 02         [ 3]  967         bne     L875C
   876A 84 EF         [ 2]  968         anda    #0xEF           ; clr bit 4 (e)
   876C                     969 L875C:
   876C C5 08         [ 2]  970         bitb    #0x08           ; tst bit 3 (d)
   876E 26 02         [ 3]  971         bne     L8762
   8770 84 DF         [ 2]  972         anda    #0xDF           ; clr bit 5 (f)
   8772                     973 L8762:
   8772 B7 18 06      [ 4]  974         staa    PIA0PRB 
   8775 97 AC         [ 3]  975         staa    (0x00AC)
   8777 BD 87 4A      [ 6]  976         jsr     L873A           ; clock diagnostic indicator
   877A 33            [ 4]  977         pulb
   877B F7 18 06      [ 4]  978         stab    PIA0PRB 
   877E D7 7B         [ 3]  979         stab    (0x007B)
   8780 BD 87 93      [ 6]  980         jsr     L8783
   8783 32            [ 4]  981         pula
   8784 39            [ 5]  982         rts
                            983 
                            984 ; High pulse on CB2, clock bits0-4 - 4 tape deck and 1 A/V switcher bit
   8785                     985 L8775:
   8785 B6 18 07      [ 4]  986         ldaa    PIA0CRB 
   8788 8A 38         [ 2]  987         oraa    #0x38           
   878A B7 18 07      [ 4]  988         staa    PIA0CRB         ; CB2 High
   878D 84 F7         [ 2]  989         anda    #0xF7
   878F B7 18 07      [ 4]  990         staa    PIA0CRB         ; CB2 Low
   8792 39            [ 5]  991         rts
                            992 
                            993 ; High pulse on CA2
   8793                     994 L8783:
   8793 B6 18 05      [ 4]  995         ldaa    PIA0CRA 
   8796 8A 38         [ 2]  996         oraa    #0x38
   8798 B7 18 05      [ 4]  997         staa    PIA0CRA         ; CA2 High
   879B 84 F7         [ 2]  998         anda    #0xF7
   879D B7 18 05      [ 4]  999         staa    PIA0CRA         ; CA2 High
   87A0 39            [ 5] 1000         rts
                           1001 
                           1002 ; AVSEL1 = 0
   87A1                    1003 L8791:
   87A1 96 7A         [ 3] 1004         ldaa    (0x007A)
   87A3 84 FE         [ 2] 1005         anda    #0xFE
   87A5 36            [ 3] 1006         psha
   87A6 96 AC         [ 3] 1007         ldaa    (0x00AC)
   87A8 8A 04         [ 2] 1008         oraa    #0x04           ; clear segment C (lower right)
   87AA 97 AC         [ 3] 1009         staa    (0x00AC)
   87AC 32            [ 4] 1010         pula
   87AD                    1011 L879D:
   87AD 97 7A         [ 3] 1012         staa    (0x007A)        
   87AF B7 18 06      [ 4] 1013         staa    PIA0PRB 
   87B2 BD 87 85      [ 6] 1014         jsr     L8775           ; AVSEL1 = low
   87B5 96 AC         [ 3] 1015         ldaa    (0x00AC)
   87B7 B7 18 06      [ 4] 1016         staa    PIA0PRB 
   87BA BD 87 4A      [ 6] 1017         jsr     L873A           ; clock diagnostic indicator
   87BD 39            [ 5] 1018         rts
                           1019 
   87BE                    1020 L87AE:
   87BE 96 7A         [ 3] 1021         ldaa    (0x007A)
   87C0 8A 01         [ 2] 1022         oraa    #0x01
   87C2 36            [ 3] 1023         psha
   87C3 96 AC         [ 3] 1024         ldaa    (0x00AC)
   87C5 84 FB         [ 2] 1025         anda    #0xFB
   87C7 97 AC         [ 3] 1026         staa    (0x00AC)
   87C9 32            [ 4] 1027         pula
   87CA 20 E1         [ 3] 1028         bra     L879D
                           1029 
                           1030 ; SCC init, aux serial
   87CC                    1031 L87BC:
   87CC CE 87 E2      [ 3] 1032         ldx     #L87D2
   87CF                    1033 L87BF:
   87CF A6 00         [ 4] 1034         ldaa    0,X
   87D1 81 FF         [ 2] 1035         cmpa    #0xFF
   87D3 27 0C         [ 3] 1036         beq     L87D1
   87D5 08            [ 3] 1037         inx
   87D6 B7 18 0D      [ 4] 1038         staa    SCCCTRLA
   87D9 A6 00         [ 4] 1039         ldaa    0,X
   87DB 08            [ 3] 1040         inx
   87DC B7 18 0D      [ 4] 1041         staa    SCCCTRLA
   87DF 20 EE         [ 3] 1042         bra     L87BF
   87E1                    1043 L87D1:
   87E1 39            [ 5] 1044         rts
                           1045 
                           1046 ; data table for aux serial config
   87E2                    1047 L87D2:
   87E2 09 8A              1048         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   87E4 01 00              1049         .byte   0x01,0x00       ; irq on special condition only
   87E6 0C 18              1050         .byte   0x0c,0x18       ; Lower byte of time constant
   87E8 0D 00              1051         .byte   0x0d,0x00       ; Upper byte of time constant
   87EA 04 44              1052         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   87EC 0E 63              1053         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   87EE 05 68              1054         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   87F0 0B 56              1055         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   87F2 03 C1              1056         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           1057         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           1058         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   87F4 0F 00              1059         .byte   0x0f,0x00       ; end of table marker
   87F6 FF FF              1060         .byte   0xff,0xff
                           1061 
                           1062 ; SCC init, sync tape data
   87F8                    1063 L87E8:
   87F8 CE F8 57      [ 3] 1064         ldx     #LF857
   87FB                    1065 L87EB:
   87FB A6 00         [ 4] 1066         ldaa    0,X
   87FD 81 FF         [ 2] 1067         cmpa    #0xFF
   87FF 27 0C         [ 3] 1068         beq     L87FD
   8801 08            [ 3] 1069         inx
   8802 B7 18 0C      [ 4] 1070         staa    SCCCTRLB
   8805 A6 00         [ 4] 1071         ldaa    0,X
   8807 08            [ 3] 1072         inx
   8808 B7 18 0C      [ 4] 1073         staa    SCCCTRLB
   880B 20 EE         [ 3] 1074         bra     L87EB
   880D                    1075 L87FD:
   880D 20 16         [ 3] 1076         bra     L8815
                           1077 
                           1078 ; data table for sync tape data config
   880F 09 8A              1079         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   8811 01 10              1080         .byte   0x01,0x10       ; irq on all character received
   8813 0C 18              1081         .byte   0x0c,0x18       ; Lower byte of time constant
   8815 0D 00              1082         .byte   0x0d,0x00       ; Upper byte of time constant
   8817 04 04              1083         .byte   0x04,0x04       ; X1 clock mode, 8-bit sync char, 1 stop bit, no parity
   8819 0E 63              1084         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   881B 05 68              1085         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   881D 0B 01              1086         .byte   0x0b,0x01       ; ~RTxC pin is Recv/Xmit clock, ~TRxC is xmit clk
   881F 03 C1              1087         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
   8821 0F 00              1088         .byte   0x0f,0x00       ; end of table marker
   8823 FF FF              1089         .byte   0xff,0xff
                           1090 
                           1091 ; Install IRQ and SCI interrupt handlers
   8825                    1092 L8815:
   8825 CE 88 4E      [ 3] 1093         ldx     #L883E          ; Install IRQ interrupt handler
   8828 FF 01 28      [ 5] 1094         stx     (0x0128)
   882B 86 7E         [ 2] 1095         ldaa    #0x7E
   882D B7 01 27      [ 4] 1096         staa    (0x0127)
   8830 CE 88 42      [ 3] 1097         ldx     #L8832          ; Install SCI interrupt handler
   8833 FF 01 01      [ 5] 1098         stx     (0x0101)
   8836 B7 01 00      [ 4] 1099         staa    (0x0100)
   8839 B6 10 2D      [ 4] 1100         ldaa    SCCR2           ; enable SCI receive interrupts
   883C 8A 20         [ 2] 1101         oraa    #0x20
   883E B7 10 2D      [ 4] 1102         staa    SCCR2  
   8841 39            [ 5] 1103         rts
                           1104 
                           1105 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1106 
                           1107 ; SCI Interrupt handler, normal serial
                           1108 
   8842                    1109 L8832:
   8842 B6 10 2E      [ 4] 1110         ldaa    SCSR
   8845 B6 10 2F      [ 4] 1111         ldaa    SCDR
   8848 7C 00 48      [ 6] 1112         inc     (0x0048)        ; increment bytes received
   884B 7E 88 72      [ 3] 1113         jmp     L8862           ; handle incoming data the same from SCI or SCC
                           1114 
                           1115 ; IRQ Interrupt handler, aux serial
                           1116 
   884E                    1117 L883E:
   884E 86 01         [ 2] 1118         ldaa    #0x01
   8850 B7 18 0C      [ 4] 1119         staa    SCCCTRLB
   8853 B6 18 0C      [ 4] 1120         ldaa    SCCCTRLB        ; read 3 error bits
   8856 84 70         [ 2] 1121         anda    #0x70
   8858 26 1F         [ 3] 1122         bne     L8869           ; if errors, jump ahead
   885A 86 0A         [ 2] 1123         ldaa    #0x0A
   885C B7 18 0C      [ 4] 1124         staa    SCCCTRLB
   885F B6 18 0C      [ 4] 1125         ldaa    SCCCTRLB        ; read clocks missing bits
   8862 84 C0         [ 2] 1126         anda    #0xC0
   8864 26 22         [ 3] 1127         bne     L8878           ; clocks missing, jump ahead
   8866 B6 18 0C      [ 4] 1128         ldaa    SCCCTRLB        ; check character available
   8869 44            [ 2] 1129         lsra
   886A 24 35         [ 3] 1130         bcc     L8891           ; if no char available, clear register and exit
   886C 7C 00 48      [ 6] 1131         inc     (0x0048)        ; increment bytes received
   886F B6 18 0E      [ 4] 1132         ldaa    SCCDATAB        ; read good data byte
                           1133 
                           1134 ; handle incoming data byte
   8872                    1135 L8862:
   8872 BD FA A3      [ 6] 1136         jsr     SERIALW         ; echo it to serial
   8875 97 4A         [ 3] 1137         staa    (0x004A)        ; store it here
   8877 20 2D         [ 3] 1138         bra     L8896
                           1139 
                           1140 ; errors reading from SCC
   8879                    1141 L8869:
   8879 B6 18 0E      [ 4] 1142         ldaa    SCCDATAB        ; read bad byte
   887C 86 30         [ 2] 1143         ldaa    #0x30
   887E B7 18 0C      [ 4] 1144         staa    SCCCTRLB        ; send error reset (Register 0)
   8881 86 07         [ 2] 1145         ldaa    #0x07
   8883 BD FA A3      [ 6] 1146         jsr     SERIALW         ; send bell to serial
   8886 0C            [ 2] 1147         clc
   8887 3B            [12] 1148         rti
                           1149 
                           1150 ; clocks missing?
   8888                    1151 L8878:
   8888 86 07         [ 2] 1152         ldaa    #0x07
   888A BD FA A3      [ 6] 1153         jsr     SERIALW         ; send bell to serial
   888D 86 0E         [ 2] 1154         ldaa    #0x0E
   888F B7 18 0C      [ 4] 1155         staa    SCCCTRLB
   8892 86 43         [ 2] 1156         ldaa    #0x43
   8894 B7 18 0C      [ 4] 1157         staa    SCCCTRLB        ; send reset missing clock
   8897 B6 18 0E      [ 4] 1158         ldaa    SCCDATAB
   889A 86 07         [ 2] 1159         ldaa    #0x07
   889C BD FA A3      [ 6] 1160         jsr     SERIALW         ; send 2nd bell to serial
   889F 0D            [ 2] 1161         sec
   88A0 3B            [12] 1162         rti
                           1163 
                           1164 ; clear receive data reg and return
   88A1                    1165 L8891:
   88A1 B6 18 0E      [ 4] 1166         ldaa    SCCDATAB
   88A4 0C            [ 2] 1167         clc
   88A5 3B            [12] 1168         rti
                           1169 
                           1170 ; Parse byte from tape
   88A6                    1171 L8896:
   88A6 84 7F         [ 2] 1172         anda    #0x7F           ; should all be 7-bits, ignore bit 7
   88A8 81 24         [ 2] 1173         cmpa    #0x24           ;'$'
   88AA 27 44         [ 3] 1174         beq     L88E0           ; count it and exit
   88AC 81 25         [ 2] 1175         cmpa    #0x25           ;'%'
   88AE 27 40         [ 3] 1176         beq     L88E0           ; count it and exit
   88B0 81 20         [ 2] 1177         cmpa    #0x20           ;' '
   88B2 27 3A         [ 3] 1178         beq     L88DE           ; just exit
   88B4 81 30         [ 2] 1179         cmpa    #0x30           ;'0'
   88B6 25 35         [ 3] 1180         bcs     L88DD           ; < 0x30, exit
   88B8 97 12         [ 3] 1181         staa    (0x0012)        ; store it here
   88BA 96 4D         [ 3] 1182         ldaa    (0x004D)        ; check number of '$' or '%'
   88BC 81 02         [ 2] 1183         cmpa    #0x02
   88BE 25 09         [ 3] 1184         bcs     L88B9           ; < 2, jump ahead
   88C0 7F 00 4D      [ 6] 1185         clr     (0x004D)        ; clear number of '$' or '%'
   88C3 96 12         [ 3] 1186         ldaa    (0x0012)
   88C5 97 49         [ 3] 1187         staa    (0x0049)        ; store the character here - character is 0x30 or higher
   88C7 20 24         [ 3] 1188         bra     L88DD           ; exit
   88C9                    1189 L88B9:
   88C9 7D 00 4E      [ 6] 1190         tst     (0x004E)        ; is 4E 0??? (related to random motions?)
   88CC 27 1F         [ 3] 1191         beq     L88DD           ; if so, exit
   88CE 86 78         [ 2] 1192         ldaa    #0x78           ; 120
   88D0 97 63         [ 3] 1193         staa    (0x0063)        ; start 12 second timer
   88D2 97 64         [ 3] 1194         staa    (0x0064)        ; reset boards before next random motion
   88D4 96 12         [ 3] 1195         ldaa    (0x0012)
   88D6 81 40         [ 2] 1196         cmpa    #0x40
   88D8 24 07         [ 3] 1197         bcc     L88D1           ; if char >= 0x40, jump ahead
   88DA 97 4C         [ 3] 1198         staa    (0x004C)        ; store code from 0x30 to 0x3F here
   88DC 7F 00 4D      [ 6] 1199         clr     (0x004D)        ; more code to process
   88DF 20 0C         [ 3] 1200         bra     L88DD           ; go to rti
   88E1                    1201 L88D1:
   88E1 81 60         [ 2] 1202         cmpa    #0x60       
   88E3 24 08         [ 3] 1203         bcc     L88DD           ; if char >= 0x60, exit
   88E5 97 4B         [ 3] 1204         staa    (0x004B)        ; store code from 0x40 to 0x5F here
   88E7 7F 00 4D      [ 6] 1205         clr     (0x004D)        ; more code to process
   88EA BD 88 F5      [ 6] 1206         jsr     L88E5           ; jump ahead
   88ED                    1207 L88DD:
   88ED 3B            [12] 1208         rti
                           1209 
   88EE                    1210 L88DE:
   88EE 20 FD         [ 3] 1211         bra     L88DD           ; go to rti
   88F0                    1212 L88E0:
   88F0 7C 00 4D      [ 6] 1213         inc     (0x004D)        ; count $ or %
   88F3 20 F9         [ 3] 1214         bra     L88DE           ; exit
   88F5                    1215 L88E5:
   88F5 D6 4B         [ 3] 1216         ldab    (0x004B)        
   88F7 96 4C         [ 3] 1217         ldaa    (0x004C)
   88F9 7D 04 5C      [ 6] 1218         tst     (0x045C)        ; R12/CNR?
   88FC 27 0D         [ 3] 1219         beq     L88FB           ; if R12, jump ahead
   88FE 81 3C         [ 2] 1220         cmpa    #0x3C
   8900 25 09         [ 3] 1221         bcs     L88FB           ; if char < 0x3C, jump ahead
   8902 81 3F         [ 2] 1222         cmpa    #0x3F
   8904 22 05         [ 3] 1223         bhi     L88FB           ; if char > 0x3F, jump ahead 
   8906 BD 89 A3      [ 6] 1224         jsr     L8993           ; process char (0x3C-0x3F)
   8909 20 65         [ 3] 1225         bra     L8960           ; rts
   890B                    1226 L88FB:
   890B 1A 83 30 48   [ 5] 1227         cpd     #0x3048
   890F 27 79         [ 3] 1228         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8911 1A 83 31 48   [ 5] 1229         cpd     #0x3148
   8915 27 5A         [ 3] 1230         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8917 1A 83 34 4D   [ 5] 1231         cpd     #0x344D
   891B 27 6D         [ 3] 1232         beq     L897A           ; turn off 3 bits on boards 1,3,4
   891D 1A 83 35 4D   [ 5] 1233         cpd     #0x354D
   8921 27 4E         [ 3] 1234         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8923 1A 83 36 4D   [ 5] 1235         cpd     #0x364D
   8927 27 61         [ 3] 1236         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8929 1A 83 37 4D   [ 5] 1237         cpd     #0x374D
   892D 27 42         [ 3] 1238         beq     L8961           ; turn on 3 bits on boards 1,3,4
   892F CE 10 80      [ 3] 1239         ldx     #0x1080
   8932 D6 4C         [ 3] 1240         ldab    (0x004C)
   8934 C0 30         [ 2] 1241         subb    #0x30
   8936 54            [ 2] 1242         lsrb
   8937 58            [ 2] 1243         aslb
   8938 58            [ 2] 1244         aslb
   8939 3A            [ 3] 1245         abx
   893A D6 4B         [ 3] 1246         ldab    (0x004B)
   893C C1 50         [ 2] 1247         cmpb    #0x50
   893E 24 30         [ 3] 1248         bcc     L8960           ; if char >= 0x50, return
   8940 C1 47         [ 2] 1249         cmpb    #0x47           
   8942 23 02         [ 3] 1250         bls     L8936           ; if char <= 0x47, skip increments
   8944 08            [ 3] 1251         inx                     ; skip to port B of this PIA
   8945 08            [ 3] 1252         inx
   8946                    1253 L8936:
   8946 C0 40         [ 2] 1254         subb    #0x40           ; 
   8948 C4 07         [ 2] 1255         andb    #0x07
   894A 4F            [ 2] 1256         clra
   894B 0D            [ 2] 1257         sec
   894C 49            [ 2] 1258         rola
   894D 5D            [ 2] 1259         tstb
   894E 27 04         [ 3] 1260         beq     L8944  
   8950                    1261 L8940:
   8950 49            [ 2] 1262         rola
   8951 5A            [ 2] 1263         decb
   8952 26 FC         [ 3] 1264         bne     L8940  
   8954                    1265 L8944:
   8954 97 50         [ 3] 1266         staa    (0x0050)
   8956 96 4C         [ 3] 1267         ldaa    (0x004C)
   8958 84 01         [ 2] 1268         anda    #0x01
   895A 27 08         [ 3] 1269         beq     L8954
                           1270 ; set bit to a 1 using the mask
   895C A6 00         [ 4] 1271         ldaa    0,X
   895E 9A 50         [ 3] 1272         oraa    (0x0050)
   8960 A7 00         [ 4] 1273         staa    0,X
   8962 20 0C         [ 3] 1274         bra     L8960
                           1275 ; set bit to 0 using the mask
   8964                    1276 L8954:
   8964 96 50         [ 3] 1277         ldaa    (0x0050)
   8966 88 FF         [ 2] 1278         eora    #0xFF
   8968 97 50         [ 3] 1279         staa    (0x0050)
   896A A6 00         [ 4] 1280         ldaa    0,X
   896C 94 50         [ 3] 1281         anda    (0x0050)
   896E A7 00         [ 4] 1282         staa    0,X
   8970                    1283 L8960:
   8970 39            [ 5] 1284         rts
                           1285 
                           1286 ; turn on 3 bits on boards 1,3,4
   8971                    1287 L8961:
   8971 B6 10 82      [ 4] 1288         ldaa    (0x1082)
   8974 8A 01         [ 2] 1289         oraa    #0x01           ; board 1, PIA A, bit 0
   8976 B7 10 82      [ 4] 1290         staa    (0x1082)
   8979 B6 10 8A      [ 4] 1291         ldaa    (0x108A)
   897C 8A 20         [ 2] 1292         oraa    #0x20           ; board 3, PIA B, bit 5
   897E B7 10 8A      [ 4] 1293         staa    (0x108A)
   8981 B6 10 8E      [ 4] 1294         ldaa    (0x108E)        ; board 4, PIA B, bit 5
   8984 8A 20         [ 2] 1295         oraa    #0x20
   8986 B7 10 8E      [ 4] 1296         staa    (0x108E)
   8989 39            [ 5] 1297         rts
                           1298 
                           1299 ; turn off 3 bits on boards 1,3,4
   898A                    1300 L897A:
   898A B6 10 82      [ 4] 1301         ldaa    (0x1082)
   898D 84 FE         [ 2] 1302         anda    #0xFE
   898F B7 10 82      [ 4] 1303         staa    (0x1082)
   8992 B6 10 8A      [ 4] 1304         ldaa    (0x108A)
   8995 84 DF         [ 2] 1305         anda    #0xDF
   8997 B7 10 8A      [ 4] 1306         staa    (0x108A)
   899A B6 10 8E      [ 4] 1307         ldaa    (0x108E)
   899D 84 DF         [ 2] 1308         anda    #0xDF
   899F B7 10 8E      [ 4] 1309         staa    (0x108E)
   89A2 39            [ 5] 1310         rts
                           1311 
                           1312 ; process 0x3C-0x3F in CNR mode
   89A3                    1313 L8993:
   89A3 3C            [ 4] 1314         pshx
   89A4 81 3D         [ 2] 1315         cmpa    #0x3D
   89A6 22 05         [ 3] 1316         bhi     L899D           ; if char > 0x3D use second table
   89A8 CE F7 80      [ 3] 1317         ldx     #LF780          ; table at the end
   89AB 20 03         [ 3] 1318         bra     L89A0           ; else use first table
   89AD                    1319 L899D:
   89AD CE F7 A0      [ 3] 1320         ldx     #LF7A0          ; table at the end
   89B0                    1321 L89A0:
   89B0 C0 40         [ 2] 1322         subb    #0x40           
   89B2 58            [ 2] 1323         aslb
   89B3 3A            [ 3] 1324         abx
   89B4 81 3C         [ 2] 1325         cmpa    #0x3C
   89B6 27 34         [ 3] 1326         beq     L89DC           ; board 7 - turn off A & B with table value mask 
   89B8 81 3D         [ 2] 1327         cmpa    #0x3D
   89BA 27 0A         [ 3] 1328         beq     L89B6           ; board 7 - turn on A & B with table value mask
   89BC 81 3E         [ 2] 1329         cmpa    #0x3E
   89BE 27 4B         [ 3] 1330         beq     L89FB           ; board 8 - turn off A & B with table value mask 
   89C0 81 3F         [ 2] 1331         cmpa    #0x3F
   89C2 27 15         [ 3] 1332         beq     L89C9           ; board 8 - turn on A & B with table value mask
   89C4 38            [ 5] 1333         pulx
   89C5 39            [ 5] 1334         rts
                           1335 
                           1336 ; board 7 - turn on A & B with table value mask
   89C6                    1337 L89B6:
   89C6 B6 10 98      [ 4] 1338         ldaa    (0x1098)
   89C9 AA 00         [ 4] 1339         oraa    0,X
   89CB B7 10 98      [ 4] 1340         staa    (0x1098)
   89CE 08            [ 3] 1341         inx
   89CF B6 10 9A      [ 4] 1342         ldaa    (0x109A)
   89D2 AA 00         [ 4] 1343         oraa    0,X
   89D4 B7 10 9A      [ 4] 1344         staa    (0x109A)
   89D7 38            [ 5] 1345         pulx
   89D8 39            [ 5] 1346         rts
                           1347 
                           1348 ; board 8 - turn on A & B with table value mask
   89D9                    1349 L89C9:
   89D9 B6 10 9C      [ 4] 1350         ldaa    (0x109C)
   89DC AA 00         [ 4] 1351         oraa    0,X
   89DE B7 10 9C      [ 4] 1352         staa    (0x109C)
   89E1 08            [ 3] 1353         inx
   89E2 B6 10 9E      [ 4] 1354         ldaa    (0x109E)
   89E5 AA 00         [ 4] 1355         oraa    0,X
   89E7 B7 10 9E      [ 4] 1356         staa    (0x109E)
   89EA 38            [ 5] 1357         pulx
   89EB 39            [ 5] 1358         rts
                           1359 
                           1360 ; board 7 - turn off A & B with table value mask
   89EC                    1361 L89DC:
   89EC E6 00         [ 4] 1362         ldab    0,X
   89EE C8 FF         [ 2] 1363         eorb    #0xFF
   89F0 D7 12         [ 3] 1364         stab    (0x0012)
   89F2 B6 10 98      [ 4] 1365         ldaa    (0x1098)
   89F5 94 12         [ 3] 1366         anda    (0x0012)
   89F7 B7 10 98      [ 4] 1367         staa    (0x1098)
   89FA 08            [ 3] 1368         inx
   89FB E6 00         [ 4] 1369         ldab    0,X
   89FD C8 FF         [ 2] 1370         eorb    #0xFF
   89FF D7 12         [ 3] 1371         stab    (0x0012)
   8A01 B6 10 9A      [ 4] 1372         ldaa    (0x109A)
   8A04 94 12         [ 3] 1373         anda    (0x0012)
   8A06 B7 10 9A      [ 4] 1374         staa    (0x109A)
   8A09 38            [ 5] 1375         pulx
   8A0A 39            [ 5] 1376         rts
                           1377 
                           1378 ; board 8 - turn off A & B with table value mask
   8A0B                    1379 L89FB:
   8A0B E6 00         [ 4] 1380         ldab    0,X
   8A0D C8 FF         [ 2] 1381         eorb    #0xFF
   8A0F D7 12         [ 3] 1382         stab    (0x0012)
   8A11 B6 10 9C      [ 4] 1383         ldaa    (0x109C)
   8A14 94 12         [ 3] 1384         anda    (0x0012)
   8A16 B7 10 9C      [ 4] 1385         staa    (0x109C)
   8A19 08            [ 3] 1386         inx
   8A1A E6 00         [ 4] 1387         ldab    0,X
   8A1C C8 FF         [ 2] 1388         eorb    #0xFF
   8A1E D7 12         [ 3] 1389         stab    (0x0012)
   8A20 B6 10 9E      [ 4] 1390         ldaa    (0x109E)
   8A23 94 12         [ 3] 1391         anda    (0x0012)
   8A25 B7 10 9E      [ 4] 1392         staa    (0x109E)
   8A28 38            [ 5] 1393         pulx
   8A29 39            [ 5] 1394         rts
                           1395 
                           1396 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1397 
   8A2A                    1398 L8A1A:
                           1399 ; Parse text with compressed ANSI stuff from table location in X
   8A2A 3C            [ 4] 1400         pshx
   8A2B                    1401 L8A1B:
   8A2B 86 04         [ 2] 1402         ldaa    #0x04
   8A2D B5 18 0D      [ 4] 1403         bita    SCCCTRLA
   8A30 27 F9         [ 3] 1404         beq     L8A1B  
   8A32 A6 00         [ 4] 1405         ldaa    0,X     
   8A34 26 03         [ 3] 1406         bne     L8A29           ; if not nul, continue
   8A36 7E 8B 31      [ 3] 1407         jmp     L8B21           ; else jump to exit
                           1408 ; process ^0123 into ESC[01;23H - ANSI Cursor positioning - (1 based)
   8A39                    1409 L8A29:
   8A39 08            [ 3] 1410         inx
   8A3A 81 5E         [ 2] 1411         cmpa    #0x5E           ; is it a '^' ?
   8A3C 26 1D         [ 3] 1412         bne     L8A4B           ; no, jump ahead
   8A3E A6 00         [ 4] 1413         ldaa    0,X             ; yes, get the next char
   8A40 08            [ 3] 1414         inx
   8A41 B7 05 92      [ 4] 1415         staa    (0x0592)    
   8A44 A6 00         [ 4] 1416         ldaa    0,X     
   8A46 08            [ 3] 1417         inx
   8A47 B7 05 93      [ 4] 1418         staa    (0x0593)
   8A4A A6 00         [ 4] 1419         ldaa    0,X     
   8A4C 08            [ 3] 1420         inx
   8A4D B7 05 95      [ 4] 1421         staa    (0x0595)
   8A50 A6 00         [ 4] 1422         ldaa    0,X     
   8A52 08            [ 3] 1423         inx
   8A53 B7 05 96      [ 4] 1424         staa    (0x0596)
   8A56 BD 8B 33      [ 6] 1425         jsr     L8B23
   8A59 20 D0         [ 3] 1426         bra     L8A1B  
                           1427 ; process @...
   8A5B                    1428 L8A4B:
   8A5B 81 40         [ 2] 1429         cmpa    #0x40           ; is it a '@' ?
   8A5D 26 3B         [ 3] 1430         bne     L8A8A  
   8A5F 1A EE 00      [ 6] 1431         ldy     0,X
   8A62 08            [ 3] 1432         inx
   8A63 08            [ 3] 1433         inx
   8A64 86 30         [ 2] 1434         ldaa    #0x30
   8A66 97 B1         [ 3] 1435         staa    (0x00B1)
   8A68 18 A6 00      [ 5] 1436         ldaa    0,Y
   8A6B                    1437 L8A5B:
   8A6B 81 64         [ 2] 1438         cmpa    #0x64
   8A6D 25 07         [ 3] 1439         bcs     L8A66  
   8A6F 7C 00 B1      [ 6] 1440         inc     (0x00B1)
   8A72 80 64         [ 2] 1441         suba    #0x64
   8A74 20 F5         [ 3] 1442         bra     L8A5B  
   8A76                    1443 L8A66:
   8A76 36            [ 3] 1444         psha
   8A77 96 B1         [ 3] 1445         ldaa    (0x00B1)
   8A79 BD 8B 4B      [ 6] 1446         jsr     L8B3B
   8A7C 86 30         [ 2] 1447         ldaa    #0x30
   8A7E 97 B1         [ 3] 1448         staa    (0x00B1)
   8A80 32            [ 4] 1449         pula
   8A81                    1450 L8A71:
   8A81 81 0A         [ 2] 1451         cmpa    #0x0A
   8A83 25 07         [ 3] 1452         bcs     L8A7C  
   8A85 7C 00 B1      [ 6] 1453         inc     (0x00B1)
   8A88 80 0A         [ 2] 1454         suba    #0x0A
   8A8A 20 F5         [ 3] 1455         bra     L8A71  
   8A8C                    1456 L8A7C:
   8A8C 36            [ 3] 1457         psha
   8A8D 96 B1         [ 3] 1458         ldaa    (0x00B1)
   8A8F BD 8B 4B      [ 6] 1459         jsr     L8B3B
   8A92 32            [ 4] 1460         pula
   8A93 8B 30         [ 2] 1461         adda    #0x30
   8A95 BD 8B 4B      [ 6] 1462         jsr     L8B3B
   8A98 20 91         [ 3] 1463         bra     L8A1B
                           1464 ; process |...
   8A9A                    1465 L8A8A:
   8A9A 81 7C         [ 2] 1466         cmpa    #0x7C           ; is it a '|' ?
   8A9C 26 59         [ 3] 1467         bne     L8AE7  
   8A9E 1A EE 00      [ 6] 1468         ldy     0,X     
   8AA1 08            [ 3] 1469         inx
   8AA2 08            [ 3] 1470         inx
   8AA3 86 30         [ 2] 1471         ldaa    #0x30
   8AA5 97 B1         [ 3] 1472         staa    (0x00B1)
   8AA7 18 EC 00      [ 6] 1473         ldd     0,Y     
   8AAA                    1474 L8A9A:
   8AAA 1A 83 27 10   [ 5] 1475         cpd     #0x2710
   8AAE 25 08         [ 3] 1476         bcs     L8AA8  
   8AB0 7C 00 B1      [ 6] 1477         inc     (0x00B1)
   8AB3 83 27 10      [ 4] 1478         subd    #0x2710
   8AB6 20 F2         [ 3] 1479         bra     L8A9A  
   8AB8                    1480 L8AA8:
   8AB8 36            [ 3] 1481         psha
   8AB9 96 B1         [ 3] 1482         ldaa    (0x00B1)
   8ABB BD 8B 4B      [ 6] 1483         jsr     L8B3B
   8ABE 86 30         [ 2] 1484         ldaa    #0x30
   8AC0 97 B1         [ 3] 1485         staa    (0x00B1)
   8AC2 32            [ 4] 1486         pula
   8AC3                    1487 L8AB3:
   8AC3 1A 83 03 E8   [ 5] 1488         cpd     #0x03E8
   8AC7 25 08         [ 3] 1489         bcs     L8AC1  
   8AC9 7C 00 B1      [ 6] 1490         inc     (0x00B1)
   8ACC 83 03 E8      [ 4] 1491         subd    #0x03E8
   8ACF 20 F2         [ 3] 1492         bra     L8AB3  
   8AD1                    1493 L8AC1:
   8AD1 36            [ 3] 1494         psha
   8AD2 96 B1         [ 3] 1495         ldaa    (0x00B1)
   8AD4 BD 8B 4B      [ 6] 1496         jsr     L8B3B
   8AD7 86 30         [ 2] 1497         ldaa    #0x30
   8AD9 97 B1         [ 3] 1498         staa    (0x00B1)
   8ADB 32            [ 4] 1499         pula
   8ADC                    1500 L8ACC:
   8ADC 1A 83 00 64   [ 5] 1501         cpd     #0x0064
   8AE0 25 08         [ 3] 1502         bcs     L8ADA  
   8AE2 7C 00 B1      [ 6] 1503         inc     (0x00B1)
   8AE5 83 00 64      [ 4] 1504         subd    #0x0064
   8AE8 20 F2         [ 3] 1505         bra     L8ACC  
   8AEA                    1506 L8ADA:
   8AEA 96 B1         [ 3] 1507         ldaa    (0x00B1)
   8AEC BD 8B 4B      [ 6] 1508         jsr     L8B3B
   8AEF 86 30         [ 2] 1509         ldaa    #0x30
   8AF1 97 B1         [ 3] 1510         staa    (0x00B1)
   8AF3 17            [ 2] 1511         tba
   8AF4 7E 8A 81      [ 3] 1512         jmp     L8A71
                           1513 ; process ~...
   8AF7                    1514 L8AE7:
   8AF7 81 7E         [ 2] 1515         cmpa    #0x7E           ; is it a '~' ?
   8AF9 26 18         [ 3] 1516         bne     L8B03  
   8AFB E6 00         [ 4] 1517         ldab    0,X     
   8AFD C0 30         [ 2] 1518         subb    #0x30
   8AFF 08            [ 3] 1519         inx
   8B00 1A EE 00      [ 6] 1520         ldy     0,X     
   8B03 08            [ 3] 1521         inx
   8B04 08            [ 3] 1522         inx
   8B05                    1523 L8AF5:
   8B05 18 A6 00      [ 5] 1524         ldaa    0,Y     
   8B08 18 08         [ 4] 1525         iny
   8B0A BD 8B 4B      [ 6] 1526         jsr     L8B3B
   8B0D 5A            [ 2] 1527         decb
   8B0E 26 F5         [ 3] 1528         bne     L8AF5  
   8B10 7E 8A 2B      [ 3] 1529         jmp     L8A1B
                           1530 ; process %...
   8B13                    1531 L8B03:
   8B13 81 25         [ 2] 1532         cmpa    #0x25           ; is it a '%' ?
   8B15 26 14         [ 3] 1533         bne     L8B1B  
   8B17 CE 05 90      [ 3] 1534         ldx     #0x0590
   8B1A CC 1B 5B      [ 3] 1535         ldd     #0x1B5B
   8B1D ED 00         [ 5] 1536         std     0,X     
   8B1F 86 4B         [ 2] 1537         ldaa    #0x4B
   8B21 A7 02         [ 4] 1538         staa    2,X
   8B23 6F 03         [ 6] 1539         clr     3,X
   8B25 BD 8A 2A      [ 6] 1540         jsr     L8A1A  
   8B28 7E 8A 2B      [ 3] 1541         jmp     L8A1B
   8B2B                    1542 L8B1B:
   8B2B B7 18 0F      [ 4] 1543         staa    SCCDATAA
   8B2E 7E 8A 2B      [ 3] 1544         jmp     L8A1B
   8B31                    1545 L8B21:
   8B31 38            [ 5] 1546         pulx
   8B32 39            [ 5] 1547         rts
                           1548 
                           1549 ; generate cursor positioning code
   8B33                    1550 L8B23:
   8B33 3C            [ 4] 1551         pshx
   8B34 CE 05 90      [ 3] 1552         ldx     #0x0590
   8B37 CC 1B 5B      [ 3] 1553         ldd     #0x1B5B
   8B3A ED 00         [ 5] 1554         std     0,X     
   8B3C 86 48         [ 2] 1555         ldaa    #0x48           ;'H'
   8B3E A7 07         [ 4] 1556         staa    7,X
   8B40 86 3B         [ 2] 1557         ldaa    #0x3B           ;';'
   8B42 A7 04         [ 4] 1558         staa    4,X
   8B44 6F 08         [ 6] 1559         clr     8,X
   8B46 BD 8A 2A      [ 6] 1560         jsr     L8A1A           ;012345678 - esc[01;23H;
   8B49 38            [ 5] 1561         pulx
   8B4A 39            [ 5] 1562         rts
                           1563 
                           1564 ;
   8B4B                    1565 L8B3B:
   8B4B 36            [ 3] 1566         psha
   8B4C                    1567 L8B3C:
   8B4C 86 04         [ 2] 1568         ldaa    #0x04
   8B4E B5 18 0D      [ 4] 1569         bita    SCCCTRLA
   8B51 27 F9         [ 3] 1570         beq     L8B3C
   8B53 32            [ 4] 1571         pula
   8B54 B7 18 0F      [ 4] 1572         staa    SCCDATAA
   8B57 39            [ 5] 1573         rts
                           1574 
   8B58                    1575 L8B48:
   8B58 BD A3 6B      [ 6] 1576         jsr     LA32E
                           1577 
   8B5B BD 8D F4      [ 6] 1578         jsr     LCDMSG1 
   8B5E 4C 69 67 68 74 20  1579         .ascis  'Light Diagnostic'
        44 69 61 67 6E 6F
        73 74 69 E3
                           1580 
   8B6E BD 8D ED      [ 6] 1581         jsr     LCDMSG2 
   8B71 43 75 72 74 61 69  1582         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           1583 
   8B81 C6 14         [ 2] 1584         ldab    #0x14
   8B83 BD 8C 40      [ 6] 1585         jsr     DLYSECSBY2      ; delay 10 sec
   8B86 C6 FF         [ 2] 1586         ldab    #0xFF
   8B88 F7 10 98      [ 4] 1587         stab    (0x1098)
   8B8B F7 10 9A      [ 4] 1588         stab    (0x109A)
   8B8E F7 10 9C      [ 4] 1589         stab    (0x109C)
   8B91 F7 10 9E      [ 4] 1590         stab    (0x109E)
   8B94 BD FA F9      [ 6] 1591         jsr     BUTNLIT 
   8B97 B6 18 04      [ 4] 1592         ldaa    PIA0PRA 
   8B9A 8A 40         [ 2] 1593         oraa    #0x40
   8B9C B7 18 04      [ 4] 1594         staa    PIA0PRA 
                           1595 
   8B9F BD 8D F4      [ 6] 1596         jsr     LCDMSG1 
   8BA2 20 50 72 65 73 73  1597         .ascis  ' Press ENTER to '
        20 45 4E 54 45 52
        20 74 6F A0
                           1598 
   8BB2 BD 8D ED      [ 6] 1599         jsr     LCDMSG2 
   8BB5 74 75 72 6E 20 6C  1600         .ascis  'turn lights  off'
        69 67 68 74 73 20
        20 6F 66 E6
                           1601 
   8BC5                    1602 L8BB5:
   8BC5 BD 8E A5      [ 6] 1603         jsr     L8E95
   8BC8 81 0D         [ 2] 1604         cmpa    #0x0D
   8BCA 26 F9         [ 3] 1605         bne     L8BB5  
   8BCC BD A3 7E      [ 6] 1606         jsr     LA341
   8BCF 39            [ 5] 1607         rts
                           1608 
                           1609 ; setup IRQ handlers!
   8BD0                    1610 L8BC0:
   8BD0 86 80         [ 2] 1611         ldaa    #0x80
   8BD2 B7 10 22      [ 4] 1612         staa    TMSK1
   8BD5 CE AC 09      [ 3] 1613         ldx     #LABCC
   8BD8 FF 01 19      [ 5] 1614         stx     (0x0119)        ; setup T1OC handler
   8BDB CE AD 49      [ 3] 1615         ldx     #LAD0C
                           1616 
   8BDE FF 01 16      [ 5] 1617         stx     (0x0116)        ; setup T2OC handler
   8BE1 CE AD 49      [ 3] 1618         ldx     #LAD0C
   8BE4 FF 01 2E      [ 5] 1619         stx     (0x012E)        ; doubles as SWI handler
   8BE7 86 7E         [ 2] 1620         ldaa    #0x7E
   8BE9 B7 01 18      [ 4] 1621         staa    (0x0118)
   8BEC B7 01 15      [ 4] 1622         staa    (0x0115)
   8BEF B7 01 2D      [ 4] 1623         staa    (0x012D)
   8BF2 4F            [ 2] 1624         clra
   8BF3 5F            [ 2] 1625         clrb
   8BF4 DD 1B         [ 4] 1626         std     CDTIMR1         ; Reset all the countdown timers
   8BF6 DD 1D         [ 4] 1627         std     CDTIMR2
   8BF8 DD 1F         [ 4] 1628         std     CDTIMR3
   8BFA DD 21         [ 4] 1629         std     CDTIMR4
   8BFC DD 23         [ 4] 1630         std     CDTIMR5
                           1631 
   8BFE                    1632 L8BEE:
   8BFE 86 C0         [ 2] 1633         ldaa    #0xC0
   8C00 B7 10 23      [ 4] 1634         staa    TFLG1
   8C03 39            [ 5] 1635         rts
                           1636 
   8C04                    1637 L8BF4:
   8C04 B6 10 0A      [ 4] 1638         ldaa    PORTE
   8C07 88 FF         [ 2] 1639         eora    #0xFF
   8C09 16            [ 2] 1640         tab
   8C0A D7 62         [ 3] 1641         stab    (0x0062)
   8C0C BD FA F9      [ 6] 1642         jsr     BUTNLIT 
   8C0F 20 F3         [ 3] 1643         bra     L8BF4  
   8C11 39            [ 5] 1644         rts
                           1645 
                           1646 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1647 
                           1648 ; Delay B seconds, with random motions if enabled
   8C12                    1649 DLYSECS:
   8C12 36            [ 3] 1650         psha
   8C13 86 64         [ 2] 1651         ldaa    #0x64
   8C15 3D            [10] 1652         mul
   8C16 DD 23         [ 4] 1653         std     CDTIMR5         ; store B*100 here
   8C18                    1654 L8C08:
   8C18 BD 9B 29      [ 6] 1655         jsr     L9B19           ; do the random motions if enabled
   8C1B DC 23         [ 4] 1656         ldd     CDTIMR5
   8C1D 26 F9         [ 3] 1657         bne     L8C08  
   8C1F 32            [ 4] 1658         pula
   8C20 39            [ 5] 1659         rts
                           1660 
                           1661 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1662 
                           1663 ; Delay 1 minute, with random motions if enabled - unused?
   8C21                    1664 DLY1MIN:
   8C21 36            [ 3] 1665         psha
   8C22 86 3C         [ 2] 1666         ldaa    #0x3C
   8C24                    1667 L8C14:
   8C24 97 28         [ 3] 1668         staa    (0x0028)
   8C26 C6 01         [ 2] 1669         ldab    #0x01           ; delay 1 sec
   8C28 BD 8C 12      [ 6] 1670         jsr     DLYSECS         ;
   8C2B 96 28         [ 3] 1671         ldaa    (0x0028)
   8C2D 4A            [ 2] 1672         deca
   8C2E 26 F4         [ 3] 1673         bne     L8C14  
   8C30 32            [ 4] 1674         pula
   8C31 39            [ 5] 1675         rts
                           1676 
                           1677 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1678 
                           1679 ; Delay by B hundreths of a second, with random motions if enabled
   8C32                    1680 DLYSECSBY100:
   8C32 36            [ 3] 1681         psha
   8C33 4F            [ 2] 1682         clra
   8C34 DD 23         [ 4] 1683         std     CDTIMR5
   8C36                    1684 L8C26:
   8C36 BD 9B 29      [ 6] 1685         jsr     L9B19           ; do the random motions if enabled
   8C39 7D 00 24      [ 6] 1686         tst     CDTIMR5+1
   8C3C 26 F8         [ 3] 1687         bne     L8C26
   8C3E 32            [ 4] 1688         pula
   8C3F 39            [ 5] 1689         rts
                           1690 
                           1691 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1692 
                           1693 ; Delay by B half-seconds
   8C40                    1694 DLYSECSBY2:
   8C40 36            [ 3] 1695         psha
   8C41 86 32         [ 2] 1696         ldaa    #0x32           ; 50
   8C43 3D            [10] 1697         mul
   8C44 DD 23         [ 4] 1698         std     CDTIMR5
   8C46                    1699 L8C36:
   8C46 DC 23         [ 4] 1700         ldd     CDTIMR5
   8C48 26 FC         [ 3] 1701         bne     L8C36
   8C4A 32            [ 4] 1702         pula
   8C4B 39            [ 5] 1703         rts
                           1704 
                           1705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1706 ; LCD routines
                           1707 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1708 
   8C4C                    1709 L8C3C:
   8C4C 86 FF         [ 2] 1710         ldaa    #0xFF
   8C4E B7 10 01      [ 4] 1711         staa    DDRA  
   8C51 86 FF         [ 2] 1712         ldaa    #0xFF
   8C53 B7 10 03      [ 4] 1713         staa    DDRG 
   8C56 B6 10 02      [ 4] 1714         ldaa    PORTG  
   8C59 8A 02         [ 2] 1715         oraa    #0x02
   8C5B B7 10 02      [ 4] 1716         staa    PORTG  
   8C5E 86 38         [ 2] 1717         ldaa    #0x38
   8C60 BD 8C 96      [ 6] 1718         jsr     L8C86           ; write byte to LCD
   8C63 86 38         [ 2] 1719         ldaa    #0x38
   8C65 BD 8C 96      [ 6] 1720         jsr     L8C86           ; write byte to LCD
   8C68 86 06         [ 2] 1721         ldaa    #0x06
   8C6A BD 8C 96      [ 6] 1722         jsr     L8C86           ; write byte to LCD
   8C6D 86 0E         [ 2] 1723         ldaa    #0x0E
   8C6F BD 8C 96      [ 6] 1724         jsr     L8C86           ; write byte to LCD
   8C72 86 01         [ 2] 1725         ldaa    #0x01
   8C74 BD 8C 96      [ 6] 1726         jsr     L8C86           ; write byte to LCD
   8C77 CE 00 FF      [ 3] 1727         ldx     #0x00FF
   8C7A                    1728 L8C6A:
   8C7A 01            [ 2] 1729         nop
   8C7B 01            [ 2] 1730         nop
   8C7C 09            [ 3] 1731         dex
   8C7D 26 FB         [ 3] 1732         bne     L8C6A  
   8C7F 39            [ 5] 1733         rts
                           1734 
                           1735 ; toggle LCD ENABLE
   8C80                    1736 L8C70:
   8C80 B6 10 02      [ 4] 1737         ldaa    PORTG  
   8C83 84 FD         [ 2] 1738         anda    #0xFD           ; clear LCD ENABLE
   8C85 B7 10 02      [ 4] 1739         staa    PORTG  
   8C88 8A 02         [ 2] 1740         oraa    #0x02           ; set LCD ENABLE
   8C8A B7 10 02      [ 4] 1741         staa    PORTG  
   8C8D 39            [ 5] 1742         rts
                           1743 
                           1744 ; Reset LCD buffer?
   8C8E                    1745 L8C7E:
   8C8E CC 05 00      [ 3] 1746         ldd     #0x0500         ; Reset LCD queue?
   8C91 DD 46         [ 4] 1747         std     (0x0046)        ; write pointer
   8C93 DD 44         [ 4] 1748         std     (0x0044)        ; read pointer?
   8C95 39            [ 5] 1749         rts
                           1750 
                           1751 ; write byte to LCD
   8C96                    1752 L8C86:
   8C96 BD 8C CD      [ 6] 1753         jsr     L8CBD           ; wait for LCD not busy
   8C99 B7 10 00      [ 4] 1754         staa    PORTA  
   8C9C B6 10 02      [ 4] 1755         ldaa    PORTG       
   8C9F 84 F3         [ 2] 1756         anda    #0xF3           ; LCD RS and LCD RW low
   8CA1                    1757 L8C91:
   8CA1 B7 10 02      [ 4] 1758         staa    PORTG  
   8CA4 BD 8C 80      [ 6] 1759         jsr     L8C70           ; toggle LCD ENABLE
   8CA7 39            [ 5] 1760         rts
                           1761 
                           1762 ; ???
   8CA8                    1763 L8C98:
   8CA8 BD 8C CD      [ 6] 1764         jsr     L8CBD           ; wait for LCD not busy
   8CAB B7 10 00      [ 4] 1765         staa    PORTA  
   8CAE B6 10 02      [ 4] 1766         ldaa    PORTG  
   8CB1 84 FB         [ 2] 1767         anda    #0xFB
   8CB3 8A 08         [ 2] 1768         oraa    #0x08
   8CB5 20 EA         [ 3] 1769         bra     L8C91  
   8CB7 BD 8C CD      [ 6] 1770         jsr     L8CBD           ; wait for LCD not busy
   8CBA B6 10 02      [ 4] 1771         ldaa    PORTG  
   8CBD 84 F7         [ 2] 1772         anda    #0xF7
   8CBF 8A 08         [ 2] 1773         oraa    #0x08
   8CC1 20 DE         [ 3] 1774         bra     L8C91  
   8CC3 BD 8C CD      [ 6] 1775         jsr     L8CBD           ; wait for LCD not busy
   8CC6 B6 10 02      [ 4] 1776         ldaa    PORTG  
   8CC9 8A 0C         [ 2] 1777         oraa    #0x0C
   8CCB 20 D4         [ 3] 1778         bra     L8C91  
                           1779 
                           1780 ; wait for LCD not busy (or timeout)
   8CCD                    1781 L8CBD:
   8CCD 36            [ 3] 1782         psha
   8CCE 37            [ 3] 1783         pshb
   8CCF C6 FF         [ 2] 1784         ldab    #0xFF           ; init timeout counter
   8CD1                    1785 L8CC1:
   8CD1 5D            [ 2] 1786         tstb
   8CD2 27 1A         [ 3] 1787         beq     L8CDE           ; times up, exit
   8CD4 B6 10 02      [ 4] 1788         ldaa    PORTG  
   8CD7 84 F7         [ 2] 1789         anda    #0xF7           ; bit 3 low
   8CD9 8A 04         [ 2] 1790         oraa    #0x04           ; bit 3 high
   8CDB B7 10 02      [ 4] 1791         staa    PORTG           ; LCD RS high
   8CDE BD 8C 80      [ 6] 1792         jsr     L8C70           ; toggle LCD ENABLE
   8CE1 7F 10 01      [ 6] 1793         clr     DDRA  
   8CE4 B6 10 00      [ 4] 1794         ldaa    PORTA           ; read busy flag from LCD
   8CE7 2B 08         [ 3] 1795         bmi     L8CE1           ; if busy, keep looping
   8CE9 86 FF         [ 2] 1796         ldaa    #0xFF
   8CEB B7 10 01      [ 4] 1797         staa    DDRA            ; port A back to outputs
   8CEE                    1798 L8CDE:
   8CEE 33            [ 4] 1799         pulb                    ; and exit
   8CEF 32            [ 4] 1800         pula
   8CF0 39            [ 5] 1801         rts
                           1802 
   8CF1                    1803 L8CE1:
   8CF1 5A            [ 2] 1804         decb                    ; decrement timer
   8CF2 86 FF         [ 2] 1805         ldaa    #0xFF
   8CF4 B7 10 01      [ 4] 1806         staa    DDRA            ; port A back to outputs
   8CF7 20 D8         [ 3] 1807         bra     L8CC1           ; loop
                           1808 
   8CF9                    1809 L8CE9:
   8CF9 BD 8C CD      [ 6] 1810         jsr     L8CBD           ; wait for LCD not busy
   8CFC 86 01         [ 2] 1811         ldaa    #0x01
   8CFE BD 8C 96      [ 6] 1812         jsr     L8C86           ; write byte to LCD
   8D01 39            [ 5] 1813         rts
                           1814 
   8D02                    1815 L8CF2:
   8D02 BD 8C CD      [ 6] 1816         jsr     L8CBD           ; wait for LCD not busy
   8D05 86 80         [ 2] 1817         ldaa    #0x80
   8D07 BD 8D 24      [ 6] 1818         jsr     L8D14
   8D0A BD 8C CD      [ 6] 1819         jsr     L8CBD           ; wait for LCD not busy
   8D0D 86 80         [ 2] 1820         ldaa    #0x80
   8D0F BD 8C 96      [ 6] 1821         jsr     L8C86           ; write byte to LCD
   8D12 39            [ 5] 1822         rts
                           1823 
   8D13                    1824 L8D03:
   8D13 BD 8C CD      [ 6] 1825         jsr     L8CBD           ; wait for LCD not busy
   8D16 86 C0         [ 2] 1826         ldaa    #0xC0
   8D18 BD 8D 24      [ 6] 1827         jsr     L8D14
   8D1B BD 8C CD      [ 6] 1828         jsr     L8CBD           ; wait for LCD not busy
   8D1E 86 C0         [ 2] 1829         ldaa    #0xC0
   8D20 BD 8C 96      [ 6] 1830         jsr     L8C86           ; write byte to LCD
   8D23 39            [ 5] 1831         rts
                           1832 
   8D24                    1833 L8D14:
   8D24 BD 8C 96      [ 6] 1834         jsr     L8C86           ; write byte to LCD
   8D27 86 10         [ 2] 1835         ldaa    #0x10
   8D29 97 14         [ 3] 1836         staa    (0x0014)
   8D2B                    1837 L8D1B:
   8D2B BD 8C CD      [ 6] 1838         jsr     L8CBD           ; wait for LCD not busy
   8D2E 86 20         [ 2] 1839         ldaa    #0x20
   8D30 BD 8C A8      [ 6] 1840         jsr     L8C98
   8D33 7A 00 14      [ 6] 1841         dec     (0x0014)
   8D36 26 F3         [ 3] 1842         bne     L8D1B  
   8D38 39            [ 5] 1843         rts
                           1844 
   8D39                    1845 L8D29:
   8D39 86 0C         [ 2] 1846         ldaa    #0x0C
   8D3B BD 8E 5B      [ 6] 1847         jsr     L8E4B
   8D3E 39            [ 5] 1848         rts
                           1849 
                           1850 ; Unused?
   8D3F                    1851 L8D2F:
   8D3F 86 0E         [ 2] 1852         ldaa    #0x0E
   8D41 BD 8E 5B      [ 6] 1853         jsr     L8E4B
   8D44 39            [ 5] 1854         rts
                           1855 
   8D45                    1856 L8D35:
   8D45 7F 00 4A      [ 6] 1857         clr     (0x004A)
   8D48 7F 00 43      [ 6] 1858         clr     (0x0043)
   8D4B 18 DE 46      [ 5] 1859         ldy     (0x0046)
   8D4E 86 C0         [ 2] 1860         ldaa    #0xC0
   8D50 20 0B         [ 3] 1861         bra     L8D4D
                           1862 
   8D52                    1863 L8D42:
   8D52 7F 00 4A      [ 6] 1864         clr     (0x004A)
   8D55 7F 00 43      [ 6] 1865         clr     (0x0043)
   8D58 18 DE 46      [ 5] 1866         ldy     (0x0046)
   8D5B 86 80         [ 2] 1867         ldaa    #0x80
   8D5D                    1868 L8D4D:
   8D5D 18 A7 00      [ 5] 1869         staa    0,Y     
   8D60 18 6F 01      [ 7] 1870         clr     1,Y     
   8D63 18 08         [ 4] 1871         iny
   8D65 18 08         [ 4] 1872         iny
   8D67 18 8C 05 80   [ 5] 1873         cpy     #0x0580
   8D6B 25 04         [ 3] 1874         bcs     L8D61  
   8D6D 18 CE 05 00   [ 4] 1875         ldy     #0x0500
   8D71                    1876 L8D61:
   8D71 C6 0F         [ 2] 1877         ldab    #0x0F
   8D73                    1878 L8D63:
   8D73 96 4A         [ 3] 1879         ldaa    (0x004A)
   8D75 27 FC         [ 3] 1880         beq     L8D63  
   8D77 7F 00 4A      [ 6] 1881         clr     (0x004A)
   8D7A 5A            [ 2] 1882         decb
   8D7B 27 1A         [ 3] 1883         beq     L8D87  
   8D7D 81 24         [ 2] 1884         cmpa    #0x24
   8D7F 27 16         [ 3] 1885         beq     L8D87  
   8D81 18 6F 00      [ 7] 1886         clr     0,Y     
   8D84 18 A7 01      [ 5] 1887         staa    1,Y     
   8D87 18 08         [ 4] 1888         iny
   8D89 18 08         [ 4] 1889         iny
   8D8B 18 8C 05 80   [ 5] 1890         cpy     #0x0580
   8D8F 25 04         [ 3] 1891         bcs     L8D85  
   8D91 18 CE 05 00   [ 4] 1892         ldy     #0x0500
   8D95                    1893 L8D85:
   8D95 20 DC         [ 3] 1894         bra     L8D63  
   8D97                    1895 L8D87:
   8D97 5D            [ 2] 1896         tstb
   8D98 27 19         [ 3] 1897         beq     L8DA3  
   8D9A 86 20         [ 2] 1898         ldaa    #0x20
   8D9C                    1899 L8D8C:
   8D9C 18 6F 00      [ 7] 1900         clr     0,Y     
   8D9F 18 A7 01      [ 5] 1901         staa    1,Y     
   8DA2 18 08         [ 4] 1902         iny
   8DA4 18 08         [ 4] 1903         iny
   8DA6 18 8C 05 80   [ 5] 1904         cpy     #0x0580
   8DAA 25 04         [ 3] 1905         bcs     L8DA0  
   8DAC 18 CE 05 00   [ 4] 1906         ldy     #0x0500
   8DB0                    1907 L8DA0:
   8DB0 5A            [ 2] 1908         decb
   8DB1 26 E9         [ 3] 1909         bne     L8D8C  
   8DB3                    1910 L8DA3:
   8DB3 18 6F 00      [ 7] 1911         clr     0,Y     
   8DB6 18 6F 01      [ 7] 1912         clr     1,Y     
   8DB9 18 DF 46      [ 5] 1913         sty     (0x0046)
   8DBC 96 19         [ 3] 1914         ldaa    (0x0019)
   8DBE 97 4E         [ 3] 1915         staa    (0x004E)
   8DC0 86 01         [ 2] 1916         ldaa    #0x01
   8DC2 97 43         [ 3] 1917         staa    (0x0043)
   8DC4 39            [ 5] 1918         rts
                           1919 
                           1920 ; display ASCII in B at location
   8DC5                    1921 L8DB5:
   8DC5 36            [ 3] 1922         psha
   8DC6 37            [ 3] 1923         pshb
   8DC7 C1 4F         [ 2] 1924         cmpb    #0x4F
   8DC9 22 13         [ 3] 1925         bhi     L8DCE  
   8DCB C1 28         [ 2] 1926         cmpb    #0x28
   8DCD 25 03         [ 3] 1927         bcs     L8DC2  
   8DCF 0C            [ 2] 1928         clc
   8DD0 C9 18         [ 2] 1929         adcb    #0x18
   8DD2                    1930 L8DC2:
   8DD2 0C            [ 2] 1931         clc
   8DD3 C9 80         [ 2] 1932         adcb    #0x80
   8DD5 17            [ 2] 1933         tba
   8DD6 BD 8E 5B      [ 6] 1934         jsr     L8E4B           ; send lcd command
   8DD9 33            [ 4] 1935         pulb
   8DDA 32            [ 4] 1936         pula
   8DDB BD 8E 80      [ 6] 1937         jsr     L8E70           ; send lcd char
   8DDE                    1938 L8DCE:
   8DDE 39            [ 5] 1939         rts
                           1940 
                           1941 ; 4 routines to write to the LCD display
                           1942 
                           1943 ; Write to the LCD 1st line - extend past the end of a normal display
   8DDF                    1944 LCDMSG1A:
   8DDF 18 DE 46      [ 5] 1945         ldy     (0x0046)        ; get buffer pointer
   8DE2 86 90         [ 2] 1946         ldaa    #0x90           ; command to set LCD RAM ptr to chr 0x10
   8DE4 20 13         [ 3] 1947         bra     L8DE9  
                           1948 
                           1949 ; Write to the LCD 2st line - extend past the end of a normal display
   8DE6                    1950 LCDMSG2A:
   8DE6 18 DE 46      [ 5] 1951         ldy     (0x0046)        ; get buffer pointer
   8DE9 86 D0         [ 2] 1952         ldaa    #0xD0           ; command to set LCD RAM ptr to chr 0x50
   8DEB 20 0C         [ 3] 1953         bra     L8DE9  
                           1954 
                           1955 ; Write to the LCD 2nd line
   8DED                    1956 LCDMSG2:
   8DED 18 DE 46      [ 5] 1957         ldy     (0x0046)        ; get buffer pointer
   8DF0 86 C0         [ 2] 1958         ldaa    #0xC0           ; command to set LCD RAM ptr to chr 0x40
   8DF2 20 05         [ 3] 1959         bra     L8DE9  
                           1960 
                           1961 ; Write to the LCD 1st line
   8DF4                    1962 LCDMSG1:
   8DF4 18 DE 46      [ 5] 1963         ldy     (0x0046)        ; get buffer pointer
   8DF7 86 80         [ 2] 1964         ldaa    #0x80           ; command to load LCD RAM ptr to chr 0x00
                           1965 
                           1966 ; Put LCD command into a buffer, 4 bytes for each entry?
   8DF9                    1967 L8DE9:
   8DF9 18 A7 00      [ 5] 1968         staa    0,Y             ; store command here
   8DFC 18 6F 01      [ 7] 1969         clr     1,Y             ; clear next byte
   8DFF 18 08         [ 4] 1970         iny
   8E01 18 08         [ 4] 1971         iny
                           1972 
                           1973 ; Add characters at return address to LCD buffer
   8E03 18 8C 05 80   [ 5] 1974         cpy     #0x0580         ; check for buffer overflow
   8E07 25 04         [ 3] 1975         bcs     L8DFD           
   8E09 18 CE 05 00   [ 4] 1976         ldy     #0x0500
   8E0D                    1977 L8DFD:
   8E0D 38            [ 5] 1978         pulx                    ; get start of data
   8E0E DF 17         [ 4] 1979         stx     (0x0017)        ; save this here
   8E10                    1980 L8E00:
   8E10 A6 00         [ 4] 1981         ldaa    0,X             ; get character
   8E12 27 36         [ 3] 1982         beq     L8E3A           ; is it 00, if so jump ahead
   8E14 2B 17         [ 3] 1983         bmi     L8E1D           ; high bit set, if so jump ahead
   8E16 18 6F 00      [ 7] 1984         clr     0,Y             ; add character
   8E19 18 A7 01      [ 5] 1985         staa    1,Y     
   8E1C 08            [ 3] 1986         inx
   8E1D 18 08         [ 4] 1987         iny
   8E1F 18 08         [ 4] 1988         iny
   8E21 18 8C 05 80   [ 5] 1989         cpy     #0x0580         ; check for buffer overflow
   8E25 25 E9         [ 3] 1990         bcs     L8E00  
   8E27 18 CE 05 00   [ 4] 1991         ldy     #0x0500
   8E2B 20 E3         [ 3] 1992         bra     L8E00  
                           1993 
   8E2D                    1994 L8E1D:
   8E2D 84 7F         [ 2] 1995         anda    #0x7F
   8E2F 18 6F 00      [ 7] 1996         clr     0,Y             ; add character
   8E32 18 A7 01      [ 5] 1997         staa    1,Y     
   8E35 18 6F 02      [ 7] 1998         clr     2,Y     
   8E38 18 6F 03      [ 7] 1999         clr     3,Y     
   8E3B 08            [ 3] 2000         inx
   8E3C 18 08         [ 4] 2001         iny
   8E3E 18 08         [ 4] 2002         iny
   8E40 18 8C 05 80   [ 5] 2003         cpy     #0x0580         ; check for overflow
   8E44 25 04         [ 3] 2004         bcs     L8E3A  
   8E46 18 CE 05 00   [ 4] 2005         ldy     #0x0500
                           2006 
   8E4A                    2007 L8E3A:
   8E4A 3C            [ 4] 2008         pshx                    ; put SP back
   8E4B 86 01         [ 2] 2009         ldaa    #0x01
   8E4D 97 43         [ 3] 2010         staa    (0x0043)        ; semaphore?
   8E4F DC 46         [ 4] 2011         ldd     (0x0046)
   8E51 18 6F 00      [ 7] 2012         clr     0,Y     
   8E54 18 6F 01      [ 7] 2013         clr     1,Y     
   8E57 18 DF 46      [ 5] 2014         sty     (0x0046)        ; save buffer pointer
   8E5A 39            [ 5] 2015         rts
                           2016 
                           2017 ; buffer LCD command?
   8E5B                    2018 L8E4B:
   8E5B 18 DE 46      [ 5] 2019         ldy     (0x0046)
   8E5E 18 A7 00      [ 5] 2020         staa    0,Y     
   8E61 18 6F 01      [ 7] 2021         clr     1,Y     
   8E64 18 08         [ 4] 2022         iny
   8E66 18 08         [ 4] 2023         iny
   8E68 18 8C 05 80   [ 5] 2024         cpy     #0x0580
   8E6C 25 04         [ 3] 2025         bcs     L8E62  
   8E6E 18 CE 05 00   [ 4] 2026         ldy     #0x0500
   8E72                    2027 L8E62:
   8E72 18 6F 00      [ 7] 2028         clr     0,Y     
   8E75 18 6F 01      [ 7] 2029         clr     1,Y     
   8E78 86 01         [ 2] 2030         ldaa    #0x01
   8E7A 97 43         [ 3] 2031         staa    (0x0043)
   8E7C 18 DF 46      [ 5] 2032         sty     (0x0046)
   8E7F 39            [ 5] 2033         rts
                           2034 
   8E80                    2035 L8E70:
   8E80 18 DE 46      [ 5] 2036         ldy     (0x0046)
   8E83 18 6F 00      [ 7] 2037         clr     0,Y     
   8E86 18 A7 01      [ 5] 2038         staa    1,Y     
   8E89 18 08         [ 4] 2039         iny
   8E8B 18 08         [ 4] 2040         iny
   8E8D 18 8C 05 80   [ 5] 2041         cpy     #0x0580
   8E91 25 04         [ 3] 2042         bcs     L8E87  
   8E93 18 CE 05 00   [ 4] 2043         ldy     #0x0500
   8E97                    2044 L8E87:
   8E97 18 6F 00      [ 7] 2045         clr     0,Y     
   8E9A 18 6F 01      [ 7] 2046         clr     1,Y     
   8E9D 86 01         [ 2] 2047         ldaa    #0x01
   8E9F 97 43         [ 3] 2048         staa    (0x0043)
   8EA1 18 DF 46      [ 5] 2049         sty     (0x0046)
   8EA4 39            [ 5] 2050         rts
                           2051 
                           2052 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2053 
                           2054 ; Read SCD switches
   8EA5                    2055 L8E95:
   8EA5 96 30         [ 3] 2056         ldaa    (0x0030)
   8EA7 26 09         [ 3] 2057         bne     L8EA2       ; UP - return A=0x01
   8EA9 96 31         [ 3] 2058         ldaa    (0x0031)
   8EAB 26 11         [ 3] 2059         bne     L8EAE       ; DOWN - return A=0x02
   8EAD 96 32         [ 3] 2060         ldaa    (0x0032)
   8EAF 26 19         [ 3] 2061         bne     L8EBA       ; ENTER - return A=0x0D
   8EB1 39            [ 5] 2062         rts                 ; return A=0x00
                           2063 
   8EB2                    2064 L8EA2:
   8EB2 7F 00 30      [ 6] 2065         clr     (0x0030)
   8EB5 7F 00 32      [ 6] 2066         clr     (0x0032)
   8EB8 7F 00 31      [ 6] 2067         clr     (0x0031)
   8EBB 86 01         [ 2] 2068         ldaa    #0x01
   8EBD 39            [ 5] 2069         rts
                           2070 
   8EBE                    2071 L8EAE:
   8EBE 7F 00 31      [ 6] 2072         clr     (0x0031)
   8EC1 7F 00 30      [ 6] 2073         clr     (0x0030)
   8EC4 7F 00 32      [ 6] 2074         clr     (0x0032)
   8EC7 86 02         [ 2] 2075         ldaa    #0x02
   8EC9 39            [ 5] 2076         rts
                           2077 
   8ECA                    2078 L8EBA:
   8ECA 7F 00 32      [ 6] 2079         clr     (0x0032)
   8ECD 7F 00 30      [ 6] 2080         clr     (0x0030)
   8ED0 7F 00 31      [ 6] 2081         clr     (0x0031)
   8ED3 86 0D         [ 2] 2082         ldaa    #0x0D
   8ED5 39            [ 5] 2083         rts
                           2084 
                           2085 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2086 
                           2087 ; Scan SCD keys into up=0x30,down=0x31,enter=0x32
   8ED6                    2088 L8EC6:
   8ED6 B6 18 04      [ 4] 2089         ldaa    PIA0PRA 
   8ED9 84 07         [ 2] 2090         anda    #0x07       ; get button state
   8EDB 97 2C         [ 3] 2091         staa    (0x002C)
   8EDD 78 00 2C      [ 6] 2092         asl     (0x002C)
   8EE0 78 00 2C      [ 6] 2093         asl     (0x002C)
   8EE3 78 00 2C      [ 6] 2094         asl     (0x002C)
   8EE6 78 00 2C      [ 6] 2095         asl     (0x002C)
   8EE9 78 00 2C      [ 6] 2096         asl     (0x002C)    ; put in upper 3 bits of 002C 
   8EEC CE 00 00      [ 3] 2097         ldx     #0x0000
   8EEF                    2098 L8EDF:
   8EEF 8C 00 03      [ 4] 2099         cpx     #0x0003
   8EF2 27 24         [ 3] 2100         beq     L8F08
   8EF4 78 00 2C      [ 6] 2101         asl     (0x002C)    
   8EF7 25 12         [ 3] 2102         bcs     L8EFB       ; if button not pressed, jump
   8EF9 A6 2D         [ 4] 2103         ldaa    0x2D,X
   8EFB 81 0F         [ 2] 2104         cmpa    #0x0F       ; has it been pressed for 15
   8EFD 24 1A         [ 3] 2105         bcc     L8F09       ; do key repeat, if not enter
   8EFF 6C 2D         [ 6] 2106         inc     0x2D,X      ; nope, inc it
   8F01 A6 2D         [ 4] 2107         ldaa    0x2D,X
   8F03 81 02         [ 2] 2108         cmpa    #0x02       ; has it been pressed for 2?
   8F05 26 02         [ 3] 2109         bne     L8EF9       ; nope
   8F07 A7 30         [ 4] 2110         staa    0x30,X      ; short press - store count (2) in 0x30/0x31/0x32
   8F09                    2111 L8EF9:
   8F09 20 0A         [ 3] 2112         bra     L8F05  
   8F0B                    2113 L8EFB:                      ; 
   8F0B 6F 2D         [ 6] 2114         clr     0x2D,X      ; clear 2D/2E/2F if not pressed
   8F0D 20 06         [ 3] 2115         bra     L8F05  
   8F0F A6 2D         [ 4] 2116         ldaa    0x2D,X
   8F11 27 02         [ 3] 2117         beq     L8F05  
   8F13 6A 2D         [ 6] 2118         dec     0x2D,X
   8F15                    2119 L8F05:
   8F15 08            [ 3] 2120         inx
   8F16 20 D7         [ 3] 2121         bra     L8EDF  
   8F18                    2122 L8F08:
   8F18 39            [ 5] 2123         rts
                           2124 
   8F19                    2125 L8F09:
   8F19 8C 00 02      [ 4] 2126         cpx     #0x0002
   8F1C 27 02         [ 3] 2127         beq     L8F10  
   8F1E 6F 2D         [ 6] 2128         clr     0x2D,X      ; do kbd repeat for up and down
   8F20                    2129 L8F10:
   8F20 20 F3         [ 3] 2130         bra     L8F05
                           2131 
                           2132 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2133 
                           2134 ; Read Front Panel Switches
   8F22                    2135 L8F12:
   8F22 B6 10 0A      [ 4] 2136         ldaa    PORTE
   8F25 97 51         [ 3] 2137         staa    (0x0051)
   8F27 CE 00 00      [ 3] 2138         ldx     #0x0000
   8F2A                    2139 L8F1A:
   8F2A 8C 00 08      [ 4] 2140         cpx     #0x0008
   8F2D 27 22         [ 3] 2141         beq     L8F41  
   8F2F 77 00 51      [ 6] 2142         asr     (0x0051)
   8F32 25 10         [ 3] 2143         bcs     L8F34  
   8F34 A6 52         [ 4] 2144         ldaa    0x52,X
   8F36 81 0F         [ 2] 2145         cmpa    #0x0F
   8F38 6C 52         [ 6] 2146         inc     0x52,X
   8F3A A6 52         [ 4] 2147         ldaa    0x52,X
   8F3C 81 04         [ 2] 2148         cmpa    #0x04
   8F3E 26 02         [ 3] 2149         bne     L8F32  
   8F40 A7 5A         [ 4] 2150         staa    0x5A,X
   8F42                    2151 L8F32:
   8F42 20 0A         [ 3] 2152         bra     L8F3E  
   8F44                    2153 L8F34:
   8F44 6F 52         [ 6] 2154         clr     0x52,X
   8F46 20 06         [ 3] 2155         bra     L8F3E  
   8F48 A6 52         [ 4] 2156         ldaa    0x52,X
   8F4A 27 02         [ 3] 2157         beq     L8F3E  
   8F4C 6A 52         [ 6] 2158         dec     0x52,X
   8F4E                    2159 L8F3E:
   8F4E 08            [ 3] 2160         inx
   8F4F 20 D9         [ 3] 2161         bra     L8F1A  
   8F51                    2162 L8F41:
   8F51 39            [ 5] 2163         rts
                           2164 
   8F52 6F 52         [ 6] 2165         clr     0x52,X
   8F54 20 F8         [ 3] 2166         bra     L8F3E  
                           2167 
                           2168 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2169 
   8F56                    2170 L8F46:
   8F56 30 2E 35           2171         .ascii      '0.5'
   8F59 31 2E 30           2172         .ascii      '1.0'
   8F5C 31 2E 35           2173         .ascii      '1.5'
   8F5F 32 2E 30           2174         .ascii      '2.0'
   8F62 32 2E 35           2175         .ascii      '2.5'
   8F65 33 2E 30           2176         .ascii      '3.0'
                           2177 
   8F68                    2178 L8F58:
   8F68 3C            [ 4] 2179         pshx
   8F69 96 12         [ 3] 2180         ldaa    (0x0012)
   8F6B 80 01         [ 2] 2181         suba    #0x01
   8F6D C6 03         [ 2] 2182         ldab    #0x03
   8F6F 3D            [10] 2183         mul
   8F70 CE 8F 56      [ 3] 2184         ldx     #L8F46
   8F73 3A            [ 3] 2185         abx
   8F74 C6 2C         [ 2] 2186         ldab    #0x2C
   8F76                    2187 L8F66:
   8F76 A6 00         [ 4] 2188         ldaa    0,X     
   8F78 08            [ 3] 2189         inx
   8F79 BD 8D C5      [ 6] 2190         jsr     L8DB5           ; display char here on LCD display
   8F7C 5C            [ 2] 2191         incb
   8F7D C1 2F         [ 2] 2192         cmpb    #0x2F
   8F7F 26 F5         [ 3] 2193         bne     L8F66  
   8F81 38            [ 5] 2194         pulx
   8F82 39            [ 5] 2195         rts
                           2196 
   8F83                    2197 L8F73:
   8F83 36            [ 3] 2198         psha
   8F84 BD 8D 02      [ 6] 2199         jsr     L8CF2
   8F87 C6 02         [ 2] 2200         ldab    #0x02
   8F89 BD 8C 40      [ 6] 2201         jsr     DLYSECSBY2   
   8F8C 32            [ 4] 2202         pula
   8F8D 97 B4         [ 3] 2203         staa    (0x00B4)
   8F8F 81 03         [ 2] 2204         cmpa    #0x03
   8F91 26 11         [ 3] 2205         bne     L8F94  
                           2206 
   8F93 BD 8D F4      [ 6] 2207         jsr     LCDMSG1 
   8F96 43 68 75 63 6B 20  2208         .ascis  'Chuck    '
        20 20 A0
                           2209 
   8F9F CE 90 82      [ 3] 2210         ldx     #L9072
   8FA2 20 4D         [ 3] 2211         bra     L8FE1  
   8FA4                    2212 L8F94:
   8FA4 81 04         [ 2] 2213         cmpa    #0x04
   8FA6 26 11         [ 3] 2214         bne     L8FA9  
                           2215 
   8FA8 BD 8D F4      [ 6] 2216         jsr     LCDMSG1 
   8FAB 4A 61 73 70 65 72  2217         .ascis  'Jasper   '
        20 20 A0
                           2218 
   8FB4 CE 90 EE      [ 3] 2219         ldx     #L90DE
   8FB7 20 38         [ 3] 2220         bra     L8FE1  
   8FB9                    2221 L8FA9:
   8FB9 81 05         [ 2] 2222         cmpa    #0x05
   8FBB 26 11         [ 3] 2223         bne     L8FBE  
                           2224 
   8FBD BD 8D F4      [ 6] 2225         jsr     LCDMSG1 
   8FC0 50 61 73 71 75 61  2226         .ascis  'Pasqually'
        6C 6C F9
                           2227 
   8FC9 CE 91 55      [ 3] 2228         ldx     #L9145
   8FCC 20 23         [ 3] 2229         bra     L8FE1  
   8FCE                    2230 L8FBE:
   8FCE 81 06         [ 2] 2231         cmpa    #0x06
   8FD0 26 11         [ 3] 2232         bne     L8FD3  
                           2233 
   8FD2 BD 8D F4      [ 6] 2234         jsr     LCDMSG1 
   8FD5 4D 75 6E 63 68 20  2235         .ascis  'Munch    '
        20 20 A0
                           2236 
   8FDE CE 91 CA      [ 3] 2237         ldx     #L91BA
   8FE1 20 0E         [ 3] 2238         bra     L8FE1  
   8FE3                    2239 L8FD3:
   8FE3 BD 8D F4      [ 6] 2240         jsr     LCDMSG1 
   8FE6 48 65 6C 65 6E 20  2241         .ascis  'Helen   '
        20 A0
                           2242 
   8FEE CE 92 36      [ 3] 2243         ldx     #L9226
   8FF1                    2244 L8FE1:
   8FF1 96 B4         [ 3] 2245         ldaa    (0x00B4)
   8FF3 80 03         [ 2] 2246         suba    #0x03
   8FF5 48            [ 2] 2247         asla
   8FF6 48            [ 2] 2248         asla
   8FF7 97 4B         [ 3] 2249         staa    (0x004B)
   8FF9 BD 95 14      [ 6] 2250         jsr     L9504
   8FFC 97 4C         [ 3] 2251         staa    (0x004C)
   8FFE 81 0F         [ 2] 2252         cmpa    #0x0F
   9000 26 01         [ 3] 2253         bne     L8FF3  
   9002 39            [ 5] 2254         rts
                           2255 
   9003                    2256 L8FF3:
   9003 81 08         [ 2] 2257         cmpa    #0x08
   9005 23 08         [ 3] 2258         bls     L8FFF  
   9007 80 08         [ 2] 2259         suba    #0x08
   9009 D6 4B         [ 3] 2260         ldab    (0x004B)
   900B CB 02         [ 2] 2261         addb    #0x02
   900D D7 4B         [ 3] 2262         stab    (0x004B)
   900F                    2263 L8FFF:
   900F 36            [ 3] 2264         psha
   9010 18 DE 46      [ 5] 2265         ldy     (0x0046)
   9013 32            [ 4] 2266         pula
   9014 5F            [ 2] 2267         clrb
   9015 0D            [ 2] 2268         sec
   9016                    2269 L9006:
   9016 59            [ 2] 2270         rolb
   9017 4A            [ 2] 2271         deca
   9018 26 FC         [ 3] 2272         bne     L9006  
   901A D7 50         [ 3] 2273         stab    (0x0050)
   901C D6 4B         [ 3] 2274         ldab    (0x004B)
   901E CE 10 80      [ 3] 2275         ldx     #0x1080
   9021 3A            [ 3] 2276         abx
   9022 86 02         [ 2] 2277         ldaa    #0x02
   9024 97 12         [ 3] 2278         staa    (0x0012)
   9026                    2279 L9016:
   9026 A6 00         [ 4] 2280         ldaa    0,X     
   9028 98 50         [ 3] 2281         eora    (0x0050)
   902A A7 00         [ 4] 2282         staa    0,X     
   902C 6D 00         [ 6] 2283         tst     0,X     
   902E 27 16         [ 3] 2284         beq     L9036  
   9030 86 4F         [ 2] 2285         ldaa    #0x4F           ;'O'
   9032 C6 0C         [ 2] 2286         ldab    #0x0C        
   9034 BD 8D C5      [ 6] 2287         jsr     L8DB5           ; display char here on LCD display
   9037 86 6E         [ 2] 2288         ldaa    #0x6E           ;'n'
   9039 C6 0D         [ 2] 2289         ldab    #0x0D
   903B BD 8D C5      [ 6] 2290         jsr     L8DB5           ; display char here on LCD display
   903E CC 20 0E      [ 3] 2291         ldd     #0x200E         ;' '
   9041 BD 8D C5      [ 6] 2292         jsr     L8DB5           ; display char here on LCD display
   9044 20 0E         [ 3] 2293         bra     L9044  
   9046                    2294 L9036:
   9046 86 66         [ 2] 2295         ldaa    #0x66           ;'f'
   9048 C6 0D         [ 2] 2296         ldab    #0x0D
   904A BD 8D C5      [ 6] 2297         jsr     L8DB5           ; display char here on LCD display
   904D 86 66         [ 2] 2298         ldaa    #0x66           ;'f'
   904F C6 0E         [ 2] 2299         ldab    #0x0E
   9051 BD 8D C5      [ 6] 2300         jsr     L8DB5           ; display char here on LCD display
   9054                    2301 L9044:
   9054 D6 12         [ 3] 2302         ldab    (0x0012)
   9056 BD 8C 40      [ 6] 2303         jsr     DLYSECSBY2      ; delay in half-seconds
   9059 BD 8E A5      [ 6] 2304         jsr     L8E95
   905C 81 0D         [ 2] 2305         cmpa    #0x0D
   905E 27 14         [ 3] 2306         beq     L9064  
   9060 20 C4         [ 3] 2307         bra     L9016  
   9062 81 02         [ 2] 2308         cmpa    #0x02
   9064 26 C0         [ 3] 2309         bne     L9016  
   9066 96 12         [ 3] 2310         ldaa    (0x0012)
   9068 81 06         [ 2] 2311         cmpa    #0x06
   906A 27 BA         [ 3] 2312         beq     L9016  
   906C 4C            [ 2] 2313         inca
   906D 97 12         [ 3] 2314         staa    (0x0012)
   906F BD 8F 68      [ 6] 2315         jsr     L8F58
   9072 20 B2         [ 3] 2316         bra     L9016  
   9074                    2317 L9064:
   9074 A6 00         [ 4] 2318         ldaa    0,X     
   9076 9A 50         [ 3] 2319         oraa    (0x0050)
   9078 98 50         [ 3] 2320         eora    (0x0050)
   907A A7 00         [ 4] 2321         staa    0,X     
   907C 96 B4         [ 3] 2322         ldaa    (0x00B4)
   907E 7E 8F 83      [ 3] 2323         jmp     L8F73
   9081 39            [ 5] 2324         rts
                           2325 
   9082                    2326 L9072:
   9082 4D 6F 75 74 68 2C  2327         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
        48 65 61 64 20 6C
        65 66 74 2C 48 65
        61 64 20 72 69 67
        68 74 2C 48 65 61
        64 20 75 70 2C 45
        79 65 73 20 72 69
        67 68 74 2C 45 79
        65 6C 69 64 73 2C
        52 69 67 68 74 20
        68 61 6E 64 2C 45
        79 65 73 20 6C 65
        66 74 2C 44 53 39
        2C 44 53 31 30 2C
        44 53 31 31 2C 44
        53 31 32 2C 44 53
        31 33 2C 44 53 31
        34 2C 45 78 69 F4
   90EE                    2328 L90DE:
   90EE 4D 6F 75 74 68 2C  2329         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Hands,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
        48 65 61 64 20 6C
        65 66 74 2C 48 65
        61 64 20 72 69 67
        68 74 2C 48 65 61
        64 20 75 70 2C 45
        79 65 73 20 72 69
        67 68 74 2C 45 79
        65 6C 69 64 73 2C
        48 61 6E 64 73 2C
        45 79 65 73 20 6C
        65 66 74 2C 44 53
        39 2C 44 53 31 30
        2C 44 53 31 31 2C
        44 53 31 32 2C 44
        53 31 33 2C 44 53
        31 34 2C 45 78 69
        F4
   9155                    2330 L9145:
   9155 4D 6F 75 74 68 2D  2331         .ascis  'Mouth-Mustache,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
        4D 75 73 74 61 63
        68 65 2C 48 65 61
        64 20 6C 65 66 74
        2C 48 65 61 64 20
        72 69 67 68 74 2C
        4C 65 66 74 20 61
        72 6D 2C 45 79 65
        73 20 72 69 67 68
        74 2C 45 79 65 6C
        69 64 73 2C 52 69
        67 68 74 20 61 72
        6D 2C 45 79 65 73
        20 6C 65 66 74 2C
        44 53 39 2C 44 53
        31 30 2C 44 53 31
        31 2C 44 53 31 32
        2C 44 53 31 33 2C
        44 53 31 34 2C 45
        78 69 F4
   91CA                    2332 L91BA:
   91CA 4D 6F 75 74 68 2C  2333         .ascis  'Mouth,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
        48 65 61 64 20 6C
        65 66 74 2C 48 65
        61 64 20 72 69 67
        68 74 2C 4C 65 66
        74 20 61 72 6D 2C
        45 79 65 73 20 72
        69 67 68 74 2C 45
        79 65 6C 69 64 73
        2C 52 69 67 68 74
        20 61 72 6D 2C 45
        79 65 73 20 6C 65
        66 74 2C 44 53 39
        2C 44 53 31 30 2C
        44 53 31 31 2C 44
        53 31 32 2C 44 53
        31 33 2C 44 53 31
        34 2C 45 78 69 F4
   9236                    2334 L9226:
   9236 4D 6F 75 74 68 2C  2335         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
        48 65 61 64 20 6C
        65 66 74 2C 48 65
        61 64 20 72 69 67
        68 74 2C 48 65 61
        64 20 75 70 2C 45
        79 65 73 20 72 69
        67 68 74 2C 45 79
        65 6C 69 64 73 2C
        52 69 67 68 74 20
        68 61 6E 64 2C 45
        79 65 73 20 6C 65
        66 74 2C 44 53 39
        2C 44 53 31 30 2C
        44 53 31 31 2C 44
        53 31 32 2C 44 53
        31 33 2C 44 53 31
        34 2C 45 78 69 F4
                           2336         
                           2337 ; code again
   92A2                    2338 L9292:
   92A2 BD 86 D4      [ 6] 2339         jsr     L86C4           ; Reset boards 1-10
   92A5                    2340 L9295:
   92A5 C6 01         [ 2] 2341         ldab    #0x01
   92A7 BD 8C 40      [ 6] 2342         jsr     DLYSECSBY2      ; delay 0.5 sec
                           2343 
   92AA BD 8D F4      [ 6] 2344         jsr     LCDMSG1 
   92AD 20 20 44 69 61 67  2345         .ascis  '  Diagnostics   '
        6E 6F 73 74 69 63
        73 20 20 A0
                           2346 
   92BD BD 8D ED      [ 6] 2347         jsr     LCDMSG2 
   92C0 20 20 20 20 20 20  2348         .ascis  '                '
        20 20 20 20 20 20
        20 20 20 A0
                           2349 
   92D0 C6 01         [ 2] 2350         ldab    #0x01
   92D2 BD 8C 40      [ 6] 2351         jsr     DLYSECSBY2      ; delay 0.5 sec
   92D5 BD 8D 13      [ 6] 2352         jsr     L8D03
   92D8 CE 93 E3      [ 3] 2353         ldx     #L93D3
   92DB BD 95 14      [ 6] 2354         jsr     L9504
   92DE 81 11         [ 2] 2355         cmpa    #0x11
   92E0 26 14         [ 3] 2356         bne     L92E6
   92E2                    2357 L92D2:
   92E2 BD 86 D4      [ 6] 2358         jsr     L86C4           ; Reset boards 1-10
   92E5 5F            [ 2] 2359         clrb
   92E6 D7 62         [ 3] 2360         stab    (0x0062)
   92E8 BD FA F9      [ 6] 2361         jsr     BUTNLIT 
   92EB B6 18 04      [ 4] 2362         ldaa    PIA0PRA 
   92EE 84 BF         [ 2] 2363         anda    #0xBF
   92F0 B7 18 04      [ 4] 2364         staa    PIA0PRA 
   92F3 7E 81 D4      [ 3] 2365         jmp     L81D7
   92F6                    2366 L92E6:
   92F6 81 03         [ 2] 2367         cmpa    #0x03
   92F8 25 09         [ 3] 2368         bcs     L92F3  
   92FA 81 08         [ 2] 2369         cmpa    #0x08
   92FC 24 05         [ 3] 2370         bcc     L92F3  
   92FE BD 8F 83      [ 6] 2371         jsr     L8F73
   9301 20 A2         [ 3] 2372         bra     L9295  
   9303                    2373 L92F3:
   9303 81 02         [ 2] 2374         cmpa    #0x02
   9305 26 08         [ 3] 2375         bne     L92FF  
   9307 BD 9F 5B      [ 6] 2376         jsr     L9F1E
   930A 25 99         [ 3] 2377         bcs     L9295  
   930C 7E 96 85      [ 3] 2378         jmp     L9675
   930F                    2379 L92FF:
   930F 81 0B         [ 2] 2380         cmpa    #0x0B
   9311 26 0D         [ 3] 2381         bne     L9310  
   9313 BD 8D 13      [ 6] 2382         jsr     L8D03
   9316 BD 9F 09      [ 6] 2383         jsr     L9ECC
   9319 C6 03         [ 2] 2384         ldab    #0x03
   931B BD 8C 40      [ 6] 2385         jsr     DLYSECSBY2      ; delay 1.5 sec
   931E 20 85         [ 3] 2386         bra     L9295  
   9320                    2387 L9310:
   9320 81 09         [ 2] 2388         cmpa    #0x09
   9322 26 0E         [ 3] 2389         bne     L9322  
   9324 BD 9F 5B      [ 6] 2390         jsr     L9F1E
   9327 24 03         [ 3] 2391         bcc     L931C  
   9329 7E 92 A5      [ 3] 2392         jmp     L9295
   932C                    2393 L931C:
   932C BD 9E CF      [ 6] 2394         jsr     L9E92           ; reset R counts
   932F 7E 92 A5      [ 3] 2395         jmp     L9295
   9332                    2396 L9322:
   9332 81 0A         [ 2] 2397         cmpa    #0x0A
   9334 26 0B         [ 3] 2398         bne     L9331  
   9336 BD 9F 5B      [ 6] 2399         jsr     L9F1E
   9339 25 03         [ 3] 2400         bcs     L932E  
   933B BD 9E EC      [ 6] 2401         jsr     L9EAF           ; reset L counts
   933E                    2402 L932E:
   933E 7E 92 A5      [ 3] 2403         jmp     L9295
   9341                    2404 L9331:
   9341 81 01         [ 2] 2405         cmpa    #0x01
   9343 26 03         [ 3] 2406         bne     L9338  
   9345 7E A1 26      [ 3] 2407         jmp     LA0E9
   9348                    2408 L9338:
   9348 81 08         [ 2] 2409         cmpa    #0x08
   934A 26 1F         [ 3] 2410         bne     L935B  
   934C BD 9F 5B      [ 6] 2411         jsr     L9F1E
   934F 25 1A         [ 3] 2412         bcs     L935B  
                           2413 
   9351 BD 8D F4      [ 6] 2414         jsr     LCDMSG1 
   9354 52 65 73 65 74 20  2415         .ascis  'Reset System!'
        53 79 73 74 65 6D
        A1
                           2416 
   9361 7E A2 86      [ 3] 2417         jmp     LA249
   9364 C6 02         [ 2] 2418         ldab    #0x02
   9366 BD 8C 40      [ 6] 2419         jsr     DLYSECSBY2      ; delay 1 sec
   9369 20 18         [ 3] 2420         bra     L9373  
   936B                    2421 L935B:
   936B 81 0C         [ 2] 2422         cmpa    #0x0C
   936D 26 14         [ 3] 2423         bne     L9373  
   936F BD 8B 58      [ 6] 2424         jsr     L8B48
   9372 5F            [ 2] 2425         clrb
   9373 D7 62         [ 3] 2426         stab    (0x0062)
   9375 BD FA F9      [ 6] 2427         jsr     BUTNLIT 
   9378 B6 18 04      [ 4] 2428         ldaa    PIA0PRA 
   937B 84 BF         [ 2] 2429         anda    #0xBF
   937D B7 18 04      [ 4] 2430         staa    PIA0PRA 
   9380 7E 92 A2      [ 3] 2431         jmp     L9292
   9383                    2432 L9373:
   9383 81 0D         [ 2] 2433         cmpa    #0x0D
   9385 26 2E         [ 3] 2434         bne     L93A5  
   9387 BD 8C F9      [ 6] 2435         jsr     L8CE9
                           2436 
   938A BD 8D F4      [ 6] 2437         jsr     LCDMSG1 
   938D 20 20 42 75 74 74  2438         .ascis  '  Button  test'
        6F 6E 20 20 74 65
        73 F4
                           2439 
   939B BD 8D ED      [ 6] 2440         jsr     LCDMSG2 
   939E 20 20 20 50 52 4F  2441         .ascis  '   PROG exits'
        47 20 65 78 69 74
        F3
                           2442 
   93AB BD A5 63      [ 6] 2443         jsr     LA526
   93AE 5F            [ 2] 2444         clrb
   93AF BD FA F9      [ 6] 2445         jsr     BUTNLIT 
   93B2 7E 92 A5      [ 3] 2446         jmp     L9295
   93B5                    2447 L93A5:
   93B5 81 0E         [ 2] 2448         cmpa    #0x0E
   93B7 26 10         [ 3] 2449         bne     L93B9  
   93B9 BD 9F 5B      [ 6] 2450         jsr     L9F1E
   93BC 24 03         [ 3] 2451         bcc     L93B1  
   93BE 7E 92 A5      [ 3] 2452         jmp     L9295
   93C1                    2453 L93B1:
   93C1 C6 01         [ 2] 2454         ldab    #0x01
   93C3 BD 8C 40      [ 6] 2455         jsr     DLYSECSBY2      ; delay 0.5 sec
   93C6 7E 94 AA      [ 3] 2456         jmp     L949A
   93C9                    2457 L93B9:
   93C9 81 0F         [ 2] 2458         cmpa    #0x0F
   93CB 26 06         [ 3] 2459         bne     L93C3  
   93CD BD A8 A7      [ 6] 2460         jsr     LA86A
   93D0 7E 92 A5      [ 3] 2461         jmp     L9295
   93D3                    2462 L93C3:
   93D3 81 10         [ 2] 2463         cmpa    #0x10
   93D5 26 09         [ 3] 2464         bne     L93D0  
   93D7 BD 9F 5B      [ 6] 2465         jsr     L9F1E
   93DA BD 95 CA      [ 6] 2466         jsr     L95BA
   93DD 7E 92 A5      [ 3] 2467         jmp     L9295
                           2468 
   93E0                    2469 L93D0:
   93E0 7E 92 E2      [ 3] 2470         jmp     L92D2
                           2471 
   93E3                    2472 L93D3:
   93E3 56 43 52 20 61 64  2473         .ascis  "VCR adjust,Set Random,Chuck E. Cheese,Jasper,Pasqually,Munch,Helen,Reset System,Reset reg tape#,Reset liv tape#,View Tape #'s,All Lights On,Button test,King enable,Warm-Up,Show Type,Quit Diagnostics"
        6A 75 73 74 2C 53
        65 74 20 52 61 6E
        64 6F 6D 2C 43 68
        75 63 6B 20 45 2E
        20 43 68 65 65 73
        65 2C 4A 61 73 70
        65 72 2C 50 61 73
        71 75 61 6C 6C 79
        2C 4D 75 6E 63 68
        2C 48 65 6C 65 6E
        2C 52 65 73 65 74
        20 53 79 73 74 65
        6D 2C 52 65 73 65
        74 20 72 65 67 20
        74 61 70 65 23 2C
        52 65 73 65 74 20
        6C 69 76 20 74 61
        70 65 23 2C 56 69
        65 77 20 54 61 70
        65 20 23 27 73 2C
        41 6C 6C 20 4C 69
        67 68 74 73 20 4F
        6E 2C 42 75 74 74
        6F 6E 20 74 65 73
        74 2C 4B 69 6E 67
        20 65 6E 61 62 6C
        65 2C 57 61 72 6D
        2D 55 70 2C 53 68
        6F 77 20 54 79 70
        65 2C 51 75 69 74
        20 44 69 61 67 6E
        6F 73 74 69 63 F3
   94A9 00                 2474         .byte   0x00
                           2475 
   94AA                    2476 L949A:
   94AA 7D 04 2A      [ 6] 2477         tst     (0x042A)
   94AD 27 27         [ 3] 2478         beq     L94C6  
                           2479 
   94AF BD 8D F4      [ 6] 2480         jsr     LCDMSG1 
   94B2 4B 69 6E 67 20 69  2481         .ascis  'King is Enabled'
        73 20 45 6E 61 62
        6C 65 E4
                           2482 
   94C1 BD 8D ED      [ 6] 2483         jsr     LCDMSG2 
   94C4 45 4E 54 45 52 20  2484         .ascis  'ENTER to disable'
        74 6F 20 64 69 73
        61 62 6C E5
                           2485 
   94D4 20 25         [ 3] 2486         bra     L94EB  
                           2487 
   94D6                    2488 L94C6:
   94D6 BD 8D F4      [ 6] 2489         jsr     LCDMSG1 
   94D9 4B 69 6E 67 20 69  2490         .ascis  'King is Disabled'
        73 20 44 69 73 61
        62 6C 65 E4
                           2491 
   94E9 BD 8D ED      [ 6] 2492         jsr     LCDMSG2 
   94EC 45 4E 54 45 52 20  2493         .ascis  'ENTER to enable'
        74 6F 20 65 6E 61
        62 6C E5
                           2494 
   94FB                    2495 L94EB:
   94FB BD 8E A5      [ 6] 2496         jsr     L8E95
   94FE 4D            [ 2] 2497         tsta
   94FF 27 FA         [ 3] 2498         beq     L94EB  
   9501 81 0D         [ 2] 2499         cmpa    #0x0D
   9503 27 02         [ 3] 2500         beq     L94F7  
   9505 20 0A         [ 3] 2501         bra     L9501  
   9507                    2502 L94F7:
   9507 B6 04 2A      [ 4] 2503         ldaa    (0x042A)
   950A 84 01         [ 2] 2504         anda    #0x01
   950C 88 01         [ 2] 2505         eora    #0x01
   950E B7 04 2A      [ 4] 2506         staa    (0x042A)
   9511                    2507 L9501:
   9511 7E 92 A5      [ 3] 2508         jmp     L9295
   9514                    2509 L9504:
   9514 86 01         [ 2] 2510         ldaa    #0x01
   9516 97 A6         [ 3] 2511         staa    (0x00A6)
   9518 97 A7         [ 3] 2512         staa    (0x00A7)
   951A DF 12         [ 4] 2513         stx     (0x0012)
   951C 20 09         [ 3] 2514         bra     L9517  
   951E 86 01         [ 2] 2515         ldaa    #0x01
   9520 97 A7         [ 3] 2516         staa    (0x00A7)
   9522 7F 00 A6      [ 6] 2517         clr     (0x00A6)
   9525 DF 12         [ 4] 2518         stx     (0x0012)
   9527                    2519 L9517:
   9527 7F 00 16      [ 6] 2520         clr     (0x0016)
   952A 18 DE 46      [ 5] 2521         ldy     (0x0046)
   952D 7D 00 A6      [ 6] 2522         tst     (0x00A6)
   9530 26 07         [ 3] 2523         bne     L9529  
   9532 BD 8D 02      [ 6] 2524         jsr     L8CF2
   9535 86 80         [ 2] 2525         ldaa    #0x80
   9537 20 05         [ 3] 2526         bra     L952E  
   9539                    2527 L9529:
   9539 BD 8D 13      [ 6] 2528         jsr     L8D03
   953C 86 C0         [ 2] 2529         ldaa    #0xC0
   953E                    2530 L952E:
   953E 18 A7 00      [ 5] 2531         staa    0,Y     
   9541 18 6F 01      [ 7] 2532         clr     1,Y     
   9544 18 08         [ 4] 2533         iny
   9546 18 08         [ 4] 2534         iny
   9548 18 8C 05 80   [ 5] 2535         cpy     #0x0580
   954C 25 04         [ 3] 2536         bcs     L9542  
   954E 18 CE 05 00   [ 4] 2537         ldy     #0x0500
   9552                    2538 L9542:
   9552 DF 14         [ 4] 2539         stx     (0x0014)
   9554                    2540 L9544:
   9554 A6 00         [ 4] 2541         ldaa    0,X     
   9556 2A 04         [ 3] 2542         bpl     L954C  
   9558 C6 01         [ 2] 2543         ldab    #0x01
   955A D7 16         [ 3] 2544         stab    (0x0016)
   955C                    2545 L954C:
   955C 81 2C         [ 2] 2546         cmpa    #0x2C
   955E 27 1E         [ 3] 2547         beq     L956E  
   9560 18 6F 00      [ 7] 2548         clr     0,Y     
   9563 84 7F         [ 2] 2549         anda    #0x7F
   9565 18 A7 01      [ 5] 2550         staa    1,Y     
   9568 18 08         [ 4] 2551         iny
   956A 18 08         [ 4] 2552         iny
   956C 18 8C 05 80   [ 5] 2553         cpy     #0x0580
   9570 25 04         [ 3] 2554         bcs     L9566  
   9572 18 CE 05 00   [ 4] 2555         ldy     #0x0500
   9576                    2556 L9566:
   9576 7D 00 16      [ 6] 2557         tst     (0x0016)
   9579 26 03         [ 3] 2558         bne     L956E  
   957B 08            [ 3] 2559         inx
   957C 20 D6         [ 3] 2560         bra     L9544  
   957E                    2561 L956E:
   957E 08            [ 3] 2562         inx
   957F 86 01         [ 2] 2563         ldaa    #0x01
   9581 97 43         [ 3] 2564         staa    (0x0043)
   9583 18 6F 00      [ 7] 2565         clr     0,Y     
   9586 18 6F 01      [ 7] 2566         clr     1,Y     
   9589 18 DF 46      [ 5] 2567         sty     (0x0046)
   958C                    2568 L957C:
   958C BD 8E A5      [ 6] 2569         jsr     L8E95
   958F 27 FB         [ 3] 2570         beq     L957C  
   9591 81 02         [ 2] 2571         cmpa    #0x02
   9593 26 0A         [ 3] 2572         bne     L958F  
   9595 7D 00 16      [ 6] 2573         tst     (0x0016)
   9598 26 05         [ 3] 2574         bne     L958F  
   959A 7C 00 A7      [ 6] 2575         inc     (0x00A7)
   959D 20 88         [ 3] 2576         bra     L9517  
   959F                    2577 L958F:
   959F 81 01         [ 2] 2578         cmpa    #0x01
   95A1 26 20         [ 3] 2579         bne     L95B3  
   95A3 18 DE 14      [ 5] 2580         ldy     (0x0014)
   95A6 18 9C 12      [ 6] 2581         cpy     (0x0012)
   95A9 23 E1         [ 3] 2582         bls     L957C  
   95AB 7A 00 A7      [ 6] 2583         dec     (0x00A7)
   95AE DE 14         [ 4] 2584         ldx     (0x0014)
   95B0 09            [ 3] 2585         dex
   95B1                    2586 L95A1:
   95B1 09            [ 3] 2587         dex
   95B2 9C 12         [ 5] 2588         cpx     (0x0012)
   95B4 26 03         [ 3] 2589         bne     L95A9  
   95B6 7E 95 27      [ 3] 2590         jmp     L9517
   95B9                    2591 L95A9:
   95B9 A6 00         [ 4] 2592         ldaa    0,X     
   95BB 81 2C         [ 2] 2593         cmpa    #0x2C
   95BD 26 F2         [ 3] 2594         bne     L95A1  
   95BF 08            [ 3] 2595         inx
   95C0 7E 95 27      [ 3] 2596         jmp     L9517
   95C3                    2597 L95B3:
   95C3 81 0D         [ 2] 2598         cmpa    #0x0D
   95C5 26 C5         [ 3] 2599         bne     L957C  
   95C7 96 A7         [ 3] 2600         ldaa    (0x00A7)
   95C9 39            [ 5] 2601         rts
                           2602 
   95CA                    2603 L95BA:
   95CA B6 04 5C      [ 4] 2604         ldaa    (0x045C)
   95CD 27 14         [ 3] 2605         beq     L95D3  
                           2606 
   95CF BD 8D F4      [ 6] 2607         jsr     LCDMSG1 
   95D2 43 75 72 72 65 6E  2608         .ascis  'Current: CNR   '
        74 3A 20 43 4E 52
        20 20 A0
                           2609 
   95E1 20 12         [ 3] 2610         bra     L95E5  
                           2611 
   95E3                    2612 L95D3:
   95E3 BD 8D F4      [ 6] 2613         jsr     LCDMSG1 
   95E6 43 75 72 72 65 6E  2614         .ascis  'Current: R12   '
        74 3A 20 52 31 32
        20 20 A0
                           2615 
   95F5                    2616 L95E5:
   95F5 BD 8D ED      [ 6] 2617         jsr     LCDMSG2 
   95F8 3C 45 6E 74 65 72  2618         .ascis  '<Enter> to chg.'
        3E 20 74 6F 20 63
        68 67 AE
                           2619 
   9607                    2620 L95F7:
   9607 BD 8E A5      [ 6] 2621         jsr     L8E95
   960A 27 FB         [ 3] 2622         beq     L95F7  
   960C 81 0D         [ 2] 2623         cmpa    #0x0D
   960E 26 0F         [ 3] 2624         bne     L960F  
   9610 B6 04 5C      [ 4] 2625         ldaa    (0x045C)
   9613 27 05         [ 3] 2626         beq     L960A  
   9615 7F 04 5C      [ 6] 2627         clr     (0x045C)
   9618 20 05         [ 3] 2628         bra     L960F  
   961A                    2629 L960A:
   961A 86 01         [ 2] 2630         ldaa    #0x01
   961C B7 04 5C      [ 4] 2631         staa    (0x045C)
   961F                    2632 L960F:
   961F 39            [ 5] 2633         rts
                           2634 
   9620                    2635 L9610:
   9620 43 68 75 63 6B 2C  2636         .ascis  "Chuck,Jasper,Pasqually,Munch,Helen,Light 1,Light 2,Light 3,Star EFX,Wink Spot,Gobo,Clear All Rnd,Exit"
        4A 61 73 70 65 72
        2C 50 61 73 71 75
        61 6C 6C 79 2C 4D
        75 6E 63 68 2C 48
        65 6C 65 6E 2C 4C
        69 67 68 74 20 31
        2C 4C 69 67 68 74
        20 32 2C 4C 69 67
        68 74 20 33 2C 53
        74 61 72 20 45 46
        58 2C 57 69 6E 6B
        20 53 70 6F 74 2C
        47 6F 62 6F 2C 43
        6C 65 61 72 20 41
        6C 6C 20 52 6E 64
        2C 45 78 69 F4
                           2637 
   9685                    2638 L9675:
   9685 BD 8D F4      [ 6] 2639         jsr     LCDMSG1 
   9688 52 61 6E 64 6F 6D  2640         .ascis  'Random          '
        20 20 20 20 20 20
        20 20 20 A0
                           2641 
   9698 CE 96 20      [ 3] 2642         ldx     #L9610
   969B BD 95 14      [ 6] 2643         jsr     L9504
   969E 5F            [ 2] 2644         clrb
   969F 37            [ 3] 2645         pshb
   96A0 81 0D         [ 2] 2646         cmpa    #0x0D
   96A2 26 03         [ 3] 2647         bne     L9697  
   96A4 7E 97 6B      [ 3] 2648         jmp     L975B
   96A7                    2649 L9697:
   96A7 81 0C         [ 2] 2650         cmpa    #0x0C
   96A9 26 21         [ 3] 2651         bne     L96BC  
   96AB 7F 04 01      [ 6] 2652         clr     (0x0401)
   96AE 7F 04 2B      [ 6] 2653         clr     (0x042B)
                           2654 
   96B1 BD 8D F4      [ 6] 2655         jsr     LCDMSG1 
   96B4 41 6C 6C 20 52 6E  2656         .ascis  'All Rnd Cleared!'
        64 20 43 6C 65 61
        72 65 64 A1
                           2657 
   96C4 C6 64         [ 2] 2658         ldab    #0x64           ; delay 1 sec
   96C6 BD 8C 32      [ 6] 2659         jsr     DLYSECSBY100
   96C9 7E 97 6B      [ 3] 2660         jmp     L975B
   96CC                    2661 L96BC:
   96CC 81 09         [ 2] 2662         cmpa    #0x09
   96CE 25 05         [ 3] 2663         bcs     L96C5  
   96D0 80 08         [ 2] 2664         suba    #0x08
   96D2 33            [ 4] 2665         pulb
   96D3 5C            [ 2] 2666         incb
   96D4 37            [ 3] 2667         pshb
   96D5                    2668 L96C5:
   96D5 5F            [ 2] 2669         clrb
   96D6 0D            [ 2] 2670         sec
   96D7                    2671 L96C7:
   96D7 59            [ 2] 2672         rolb
   96D8 4A            [ 2] 2673         deca
   96D9 26 FC         [ 3] 2674         bne     L96C7  
   96DB D7 12         [ 3] 2675         stab    (0x0012)
   96DD C8 FF         [ 2] 2676         eorb    #0xFF
   96DF D7 13         [ 3] 2677         stab    (0x0013)
   96E1                    2678 L96D1:
   96E1 CC 20 34      [ 3] 2679         ldd     #0x2034         ;' '
   96E4 BD 8D C5      [ 6] 2680         jsr     L8DB5           ; display char here on LCD display
   96E7 33            [ 4] 2681         pulb
   96E8 37            [ 3] 2682         pshb
   96E9 5D            [ 2] 2683         tstb
   96EA 27 05         [ 3] 2684         beq     L96E1  
   96EC B6 04 2B      [ 4] 2685         ldaa    (0x042B)
   96EF 20 03         [ 3] 2686         bra     L96E4  
   96F1                    2687 L96E1:
   96F1 B6 04 01      [ 4] 2688         ldaa    (0x0401)
   96F4                    2689 L96E4:
   96F4 94 12         [ 3] 2690         anda    (0x0012)
   96F6 27 0A         [ 3] 2691         beq     L96F2  
   96F8 18 DE 46      [ 5] 2692         ldy     (0x0046)
   96FB BD 8E 0D      [ 6] 2693         jsr     L8DFD
   96FE 4F            [ 2] 2694         clra
   96FF EE 20         [ 5] 2695         ldx     0x20,X
   9701 09            [ 3] 2696         dex
   9702                    2697 L96F2:
   9702 18 DE 46      [ 5] 2698         ldy     (0x0046)
   9705 BD 8E 0D      [ 6] 2699         jsr     L8DFD
   9708 4F            [ 2] 2700         clra
   9709 66 E6         [ 6] 2701         ror     0xE6,X
   970B CC 20 34      [ 3] 2702         ldd     #0x2034         ;' '
   970E BD 8D C5      [ 6] 2703         jsr     L8DB5           ; display char here on LCD display
   9711                    2704 L9701:
   9711 BD 8E A5      [ 6] 2705         jsr     L8E95           ; wait for an SCD key
   9714 27 FB         [ 3] 2706         beq     L9701  
   9716 81 01         [ 2] 2707         cmpa    #0x01           ; is it up?
   9718 26 22         [ 3] 2708         bne     L972C           ; no jump ahead
   971A 33            [ 4] 2709         pulb
   971B 37            [ 3] 2710         pshb
   971C 5D            [ 2] 2711         tstb
   971D 27 0A         [ 3] 2712         beq     L9719           ; if B=0, modify 0401 mask  
   971F B6 04 2B      [ 4] 2713         ldaa    (0x042B)        ; else modify 042B mask
   9722 9A 12         [ 3] 2714         oraa    (0x0012)
   9724 B7 04 2B      [ 4] 2715         staa    (0x042B)
   9727 20 08         [ 3] 2716         bra     L9721  
   9729                    2717 L9719:
   9729 B6 04 01      [ 4] 2718         ldaa    (0x0401)
   972C 9A 12         [ 3] 2719         oraa    (0x0012)
   972E B7 04 01      [ 4] 2720         staa    (0x0401)
   9731                    2721 L9721:
   9731 18 DE 46      [ 5] 2722         ldy     (0x0046)
   9734 BD 8E 0D      [ 6] 2723         jsr     L8DFD
   9737 4F            [ 2] 2724         clra
   9738 6E A0         [ 3] 2725         jmp     0xA0,X
   973A 20 A5         [ 3] 2726         bra     L96D1  
   973C                    2727 L972C:
   973C 81 02         [ 2] 2728         cmpa    #0x02
   973E 26 23         [ 3] 2729         bne     L9753  
   9740 33            [ 4] 2730         pulb
   9741 37            [ 3] 2731         pshb
   9742 5D            [ 2] 2732         tstb
   9743 27 0A         [ 3] 2733         beq     L973F  
   9745 B6 04 2B      [ 4] 2734         ldaa    (0x042B)
   9748 94 13         [ 3] 2735         anda    (0x0013)
   974A B7 04 2B      [ 4] 2736         staa    (0x042B)
   974D 20 08         [ 3] 2737         bra     L9747  
   974F                    2738 L973F:
   974F B6 04 01      [ 4] 2739         ldaa    (0x0401)
   9752 94 13         [ 3] 2740         anda    (0x0013)
   9754 B7 04 01      [ 4] 2741         staa    (0x0401)
   9757                    2742 L9747:
   9757 18 DE 46      [ 5] 2743         ldy     (0x0046)
   975A BD 8E 0D      [ 6] 2744         jsr     L8DFD
   975D 4F            [ 2] 2745         clra
   975E 66 E6         [ 6] 2746         ror     0xE6,X
   9760 7E 96 E1      [ 3] 2747         jmp     L96D1
   9763                    2748 L9753:
   9763 81 0D         [ 2] 2749         cmpa    #0x0D
   9765 26 AA         [ 3] 2750         bne     L9701  
   9767 33            [ 4] 2751         pulb
   9768 7E 96 85      [ 3] 2752         jmp     L9675
   976B                    2753 L975B:
   976B 33            [ 4] 2754         pulb
   976C 7E 92 A2      [ 3] 2755         jmp     L9292
                           2756 
                           2757 ; do program rom checksum, and display it on the LCD screen
   976F                    2758 L975F:
   976F CE 00 00      [ 3] 2759         ldx     #0x0000
   9772 18 CE 80 00   [ 4] 2760         ldy     #0x8000
   9776                    2761 L9766:
   9776 18 E6 00      [ 5] 2762         ldab    0,Y     
   9779 18 08         [ 4] 2763         iny
   977B 3A            [ 3] 2764         abx
   977C 18 8C 00 00   [ 5] 2765         cpy     #0x0000
   9780 26 F4         [ 3] 2766         bne     L9766  
   9782 DF 17         [ 4] 2767         stx     (0x0017)        ; store rom checksum here
   9784 96 17         [ 3] 2768         ldaa    (0x0017)        ; get high byte of checksum
   9786 BD 97 AB      [ 6] 2769         jsr     L979B           ; convert it to 2 hex chars
   9789 96 12         [ 3] 2770         ldaa    (0x0012)
   978B C6 33         [ 2] 2771         ldab    #0x33
   978D BD 8D C5      [ 6] 2772         jsr     L8DB5           ; display char 1 here on LCD display
   9790 96 13         [ 3] 2773         ldaa    (0x0013)
   9792 C6 34         [ 2] 2774         ldab    #0x34
   9794 BD 8D C5      [ 6] 2775         jsr     L8DB5           ; display char 2 here on LCD display
   9797 96 18         [ 3] 2776         ldaa    (0x0018)        ; get low byte of checksum
   9799 BD 97 AB      [ 6] 2777         jsr     L979B           ; convert it to 2 hex chars
   979C 96 12         [ 3] 2778         ldaa    (0x0012)
   979E C6 35         [ 2] 2779         ldab    #0x35
   97A0 BD 8D C5      [ 6] 2780         jsr     L8DB5           ; display char 1 here on LCD display
   97A3 96 13         [ 3] 2781         ldaa    (0x0013)
   97A5 C6 36         [ 2] 2782         ldab    #0x36
   97A7 BD 8D C5      [ 6] 2783         jsr     L8DB5           ; display char 2 here on LCD display
   97AA 39            [ 5] 2784         rts
                           2785 
                           2786 ; convert A to ASCII hex digit, store in (0x0012:0x0013)
   97AB                    2787 L979B:
   97AB 36            [ 3] 2788         psha
   97AC 84 0F         [ 2] 2789         anda    #0x0F
   97AE 8B 30         [ 2] 2790         adda    #0x30
   97B0 81 39         [ 2] 2791         cmpa    #0x39
   97B2 23 02         [ 3] 2792         bls     L97A6  
   97B4 8B 07         [ 2] 2793         adda    #0x07
   97B6                    2794 L97A6:
   97B6 97 13         [ 3] 2795         staa    (0x0013)
   97B8 32            [ 4] 2796         pula
   97B9 84 F0         [ 2] 2797         anda    #0xF0
   97BB 44            [ 2] 2798         lsra
   97BC 44            [ 2] 2799         lsra
   97BD 44            [ 2] 2800         lsra
   97BE 44            [ 2] 2801         lsra
   97BF 8B 30         [ 2] 2802         adda    #0x30
   97C1 81 39         [ 2] 2803         cmpa    #0x39
   97C3 23 02         [ 3] 2804         bls     L97B7  
   97C5 8B 07         [ 2] 2805         adda    #0x07
   97C7                    2806 L97B7:
   97C7 97 12         [ 3] 2807         staa    (0x0012)
   97C9 39            [ 5] 2808         rts
                           2809 
   97CA                    2810 L97BA:
   97CA BD 9D 4F      [ 6] 2811         jsr     L9D18
   97CD 24 03         [ 3] 2812         bcc     L97C2  
   97CF 7E 9A 8F      [ 3] 2813         jmp     L9A7F
   97D2                    2814 L97C2:
   97D2 7D 00 79      [ 6] 2815         tst     (0x0079)
   97D5 26 0B         [ 3] 2816         bne     L97D2  
   97D7 FC 04 10      [ 5] 2817         ldd     (0x0410)
   97DA C3 00 01      [ 4] 2818         addd    #0x0001
   97DD FD 04 10      [ 5] 2819         std     (0x0410)
   97E0 20 09         [ 3] 2820         bra     L97DB  
   97E2                    2821 L97D2:
   97E2 FC 04 12      [ 5] 2822         ldd     (0x0412)
   97E5 C3 00 01      [ 4] 2823         addd    #0x0001
   97E8 FD 04 12      [ 5] 2824         std     (0x0412)
   97EB                    2825 L97DB:
   97EB 86 78         [ 2] 2826         ldaa    #0x78
   97ED 97 63         [ 3] 2827         staa    (0x0063)
   97EF 97 64         [ 3] 2828         staa    (0x0064)
   97F1 BD A3 50      [ 6] 2829         jsr     LA313
   97F4 BD AB 18      [ 6] 2830         jsr     LAADB
   97F7 86 01         [ 2] 2831         ldaa    #0x01
   97F9 97 4E         [ 3] 2832         staa    (0x004E)
   97FB 97 76         [ 3] 2833         staa    (0x0076)
   97FD 7F 00 75      [ 6] 2834         clr     (0x0075)
   9800 7F 00 77      [ 6] 2835         clr     (0x0077)
   9803 BD 87 BE      [ 6] 2836         jsr     L87AE
   9806 D6 7B         [ 3] 2837         ldab    (0x007B)
   9808 CA 20         [ 2] 2838         orab    #0x20
   980A C4 F7         [ 2] 2839         andb    #0xF7
   980C BD 87 58      [ 6] 2840         jsr     L8748   
   980F 7E 85 AD      [ 3] 2841         jmp     L85A4
   9812                    2842 L9802:
   9812 7F 00 76      [ 6] 2843         clr     (0x0076)
   9815 7F 00 75      [ 6] 2844         clr     (0x0075)
   9818 7F 00 77      [ 6] 2845         clr     (0x0077)
   981B 7F 00 4E      [ 6] 2846         clr     (0x004E)
   981E D6 7B         [ 3] 2847         ldab    (0x007B)
   9820 CA 0C         [ 2] 2848         orab    #0x0C
   9822 BD 87 58      [ 6] 2849         jsr     L8748
   9825                    2850 L9815:
   9825 BD A3 5B      [ 6] 2851         jsr     LA31E
   9828 BD 86 D4      [ 6] 2852         jsr     L86C4           ; Reset boards 1-10
   982B BD 9C 61      [ 6] 2853         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   982E BD 8E A5      [ 6] 2854         jsr     L8E95
   9831 7E 84 56      [ 3] 2855         jmp     L844D
   9834                    2856 L9824:
   9834 BD 9C 61      [ 6] 2857         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9837 7F 00 4E      [ 6] 2858         clr     (0x004E)
   983A D6 7B         [ 3] 2859         ldab    (0x007B)
   983C CA 24         [ 2] 2860         orab    #0x24
   983E C4 F7         [ 2] 2861         andb    #0xF7
   9840 BD 87 58      [ 6] 2862         jsr     L8748   
   9843 BD 87 BE      [ 6] 2863         jsr     L87AE
   9846 BD 8E A5      [ 6] 2864         jsr     L8E95
   9849 7E 84 56      [ 3] 2865         jmp     L844D
   984C                    2866 L983C:
   984C 7F 00 78      [ 6] 2867         clr     (0x0078)
   984F B6 10 8A      [ 4] 2868         ldaa    (0x108A)
   9852 84 F9         [ 2] 2869         anda    #0xF9
   9854 B7 10 8A      [ 4] 2870         staa    (0x108A)
   9857 7D 00 AF      [ 6] 2871         tst     (0x00AF)
   985A 26 61         [ 3] 2872         bne     L98AD  
   985C 96 62         [ 3] 2873         ldaa    (0x0062)
   985E 84 01         [ 2] 2874         anda    #0x01
   9860 27 5B         [ 3] 2875         beq     L98AD  
   9862 C6 FD         [ 2] 2876         ldab    #0xFD           ; tape deck STOP
   9864 BD 86 F7      [ 6] 2877         jsr     L86E7
   9867 CC 00 32      [ 3] 2878         ldd     #0x0032
   986A DD 1B         [ 4] 2879         std     CDTIMR1
   986C CC 75 30      [ 3] 2880         ldd     #0x7530
   986F DD 1D         [ 4] 2881         std     CDTIMR2
   9871 7F 00 5A      [ 6] 2882         clr     (0x005A)
   9874                    2883 L9864:
   9874 BD 9B 29      [ 6] 2884         jsr     L9B19           ; do the random motions if enabled
   9877 7D 00 31      [ 6] 2885         tst     (0x0031)
   987A 26 04         [ 3] 2886         bne     L9870  
   987C 96 5A         [ 3] 2887         ldaa    (0x005A)
   987E 27 19         [ 3] 2888         beq     L9889  
   9880                    2889 L9870:
   9880 7F 00 31      [ 6] 2890         clr     (0x0031)
   9883 D6 62         [ 3] 2891         ldab    (0x0062)
   9885 C4 FE         [ 2] 2892         andb    #0xFE
   9887 D7 62         [ 3] 2893         stab    (0x0062)
   9889 BD FA F9      [ 6] 2894         jsr     BUTNLIT 
   988C BD AA 50      [ 6] 2895         jsr     LAA13
   988F C6 FB         [ 2] 2896         ldab    #0xFB           ; tape deck PLAY
   9891 BD 86 F7      [ 6] 2897         jsr     L86E7
   9894 7F 00 5A      [ 6] 2898         clr     (0x005A)
   9897 20 4B         [ 3] 2899         bra     L98D4  
   9899                    2900 L9889:
   9899 DC 1B         [ 4] 2901         ldd     CDTIMR1
   989B 26 D7         [ 3] 2902         bne     L9864  
   989D D6 62         [ 3] 2903         ldab    (0x0062)
   989F C8 01         [ 2] 2904         eorb    #0x01
   98A1 D7 62         [ 3] 2905         stab    (0x0062)
   98A3 BD FA F9      [ 6] 2906         jsr     BUTNLIT 
   98A6 C4 01         [ 2] 2907         andb    #0x01
   98A8 26 05         [ 3] 2908         bne     L989F  
   98AA BD AA 49      [ 6] 2909         jsr     LAA0C
   98AD 20 03         [ 3] 2910         bra     L98A2  
   98AF                    2911 L989F:
   98AF BD AA 50      [ 6] 2912         jsr     LAA13
   98B2                    2913 L98A2:
   98B2 CC 00 32      [ 3] 2914         ldd     #0x0032
   98B5 DD 1B         [ 4] 2915         std     CDTIMR1
   98B7 DC 1D         [ 4] 2916         ldd     CDTIMR2
   98B9 27 C5         [ 3] 2917         beq     L9870  
   98BB 20 B7         [ 3] 2918         bra     L9864  
   98BD                    2919 L98AD:
   98BD 7D 00 75      [ 6] 2920         tst     (0x0075)
   98C0 27 03         [ 3] 2921         beq     L98B5  
   98C2 7E 99 49      [ 3] 2922         jmp     L9939
   98C5                    2923 L98B5:
   98C5 96 62         [ 3] 2924         ldaa    (0x0062)
   98C7 84 02         [ 2] 2925         anda    #0x02
   98C9 27 4E         [ 3] 2926         beq     L9909  
   98CB 7D 00 AF      [ 6] 2927         tst     (0x00AF)
   98CE 26 0B         [ 3] 2928         bne     L98CB  
   98D0 FC 04 24      [ 5] 2929         ldd     (0x0424)
   98D3 C3 00 01      [ 4] 2930         addd    #0x0001
   98D6 FD 04 24      [ 5] 2931         std     (0x0424)
   98D9 20 09         [ 3] 2932         bra     L98D4  
   98DB                    2933 L98CB:
   98DB FC 04 22      [ 5] 2934         ldd     (0x0422)
   98DE C3 00 01      [ 4] 2935         addd    #0x0001
   98E1 FD 04 22      [ 5] 2936         std     (0x0422)
   98E4                    2937 L98D4:
   98E4 FC 04 18      [ 5] 2938         ldd     (0x0418)
   98E7 C3 00 01      [ 4] 2939         addd    #0x0001
   98EA FD 04 18      [ 5] 2940         std     (0x0418)
   98ED 86 78         [ 2] 2941         ldaa    #0x78
   98EF 97 63         [ 3] 2942         staa    (0x0063)
   98F1 97 64         [ 3] 2943         staa    (0x0064)
   98F3 D6 62         [ 3] 2944         ldab    (0x0062)
   98F5 C4 F7         [ 2] 2945         andb    #0xF7
   98F7 CA 02         [ 2] 2946         orab    #0x02
   98F9 D7 62         [ 3] 2947         stab    (0x0062)
   98FB BD FA F9      [ 6] 2948         jsr     BUTNLIT 
   98FE BD AA 55      [ 6] 2949         jsr     LAA18
   9901 86 01         [ 2] 2950         ldaa    #0x01
   9903 97 4E         [ 3] 2951         staa    (0x004E)
   9905 97 75         [ 3] 2952         staa    (0x0075)
   9907 D6 7B         [ 3] 2953         ldab    (0x007B)
   9909 C4 DF         [ 2] 2954         andb    #0xDF
   990B BD 87 58      [ 6] 2955         jsr     L8748   
   990E BD 87 BE      [ 6] 2956         jsr     L87AE
   9911 BD A3 50      [ 6] 2957         jsr     LA313
   9914 BD AB 18      [ 6] 2958         jsr     LAADB
   9917 20 30         [ 3] 2959         bra     L9939  
   9919                    2960 L9909:
   9919 D6 62         [ 3] 2961         ldab    (0x0062)
   991B C4 F5         [ 2] 2962         andb    #0xF5
   991D CA 40         [ 2] 2963         orab    #0x40
   991F D7 62         [ 3] 2964         stab    (0x0062)
   9921 BD FA F9      [ 6] 2965         jsr     BUTNLIT 
   9924 BD AA 5A      [ 6] 2966         jsr     LAA1D
   9927 7D 00 AF      [ 6] 2967         tst     (0x00AF)
   992A 26 04         [ 3] 2968         bne     L9920  
   992C C6 01         [ 2] 2969         ldab    #0x01
   992E D7 B6         [ 3] 2970         stab    (0x00B6)
   9930                    2971 L9920:
   9930 BD 9C 61      [ 6] 2972         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9933 7F 00 4E      [ 6] 2973         clr     (0x004E)
   9936 7F 00 75      [ 6] 2974         clr     (0x0075)
   9939 86 01         [ 2] 2975         ldaa    #0x01
   993B 97 77         [ 3] 2976         staa    (0x0077)
   993D D6 7B         [ 3] 2977         ldab    (0x007B)
   993F CA 24         [ 2] 2978         orab    #0x24
   9941 C4 F7         [ 2] 2979         andb    #0xF7
   9943 BD 87 58      [ 6] 2980         jsr     L8748   
   9946 BD 87 A1      [ 6] 2981         jsr     L8791   
   9949                    2982 L9939:
   9949 7F 00 AF      [ 6] 2983         clr     (0x00AF)
   994C 7E 85 AD      [ 3] 2984         jmp     L85A4
   994F                    2985 L993F:
   994F 7F 00 77      [ 6] 2986         clr     (0x0077)
   9952 BD 9C 61      [ 6] 2987         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9955 7F 00 4E      [ 6] 2988         clr     (0x004E)
   9958 D6 62         [ 3] 2989         ldab    (0x0062)
   995A C4 BF         [ 2] 2990         andb    #0xBF
   995C 7D 00 75      [ 6] 2991         tst     (0x0075)
   995F 27 02         [ 3] 2992         beq     L9953  
   9961 C4 FD         [ 2] 2993         andb    #0xFD
   9963                    2994 L9953:
   9963 D7 62         [ 3] 2995         stab    (0x0062)
   9965 BD FA F9      [ 6] 2996         jsr     BUTNLIT 
   9968 BD AA 5A      [ 6] 2997         jsr     LAA1D
   996B 7F 00 5B      [ 6] 2998         clr     (0x005B)
   996E BD 87 BE      [ 6] 2999         jsr     L87AE
   9971 D6 7B         [ 3] 3000         ldab    (0x007B)
   9973 CA 20         [ 2] 3001         orab    #0x20
   9975 BD 87 58      [ 6] 3002         jsr     L8748   
   9978 7F 00 75      [ 6] 3003         clr     (0x0075)
   997B 7F 00 76      [ 6] 3004         clr     (0x0076)
   997E 7E 98 25      [ 3] 3005         jmp     L9815
   9981                    3006 L9971:
   9981 D6 7B         [ 3] 3007         ldab    (0x007B)
   9983 C4 FB         [ 2] 3008         andb    #0xFB
   9985 BD 87 58      [ 6] 3009         jsr     L8748   
   9988 7E 85 AD      [ 3] 3010         jmp     L85A4
   998B                    3011 L997B:
   998B D6 7B         [ 3] 3012         ldab    (0x007B)
   998D CA 04         [ 2] 3013         orab    #0x04
   998F BD 87 58      [ 6] 3014         jsr     L8748   
   9992 7E 85 AD      [ 3] 3015         jmp     L85A4
   9995                    3016 L9985:
   9995 D6 7B         [ 3] 3017         ldab    (0x007B)
   9997 C4 F7         [ 2] 3018         andb    #0xF7
   9999 BD 87 58      [ 6] 3019         jsr     L8748   
   999C 7E 85 AD      [ 3] 3020         jmp     L85A4
   999F                    3021 L998F:
   999F 7D 00 77      [ 6] 3022         tst     (0x0077)
   99A2 26 07         [ 3] 3023         bne     L999B
   99A4 D6 7B         [ 3] 3024         ldab    (0x007B)
   99A6 CA 08         [ 2] 3025         orab    #0x08
   99A8 BD 87 58      [ 6] 3026         jsr     L8748   
   99AB                    3027 L999B:
   99AB 7E 85 AD      [ 3] 3028         jmp     L85A4
   99AE                    3029 L999E:
   99AE D6 7B         [ 3] 3030         ldab    (0x007B)
   99B0 C4 F3         [ 2] 3031         andb    #0xF3
   99B2 BD 87 58      [ 6] 3032         jsr     L8748   
   99B5 39            [ 5] 3033         rts
                           3034 
                           3035 ; main2
   99B6                    3036 L99A6:
   99B6 D6 7B         [ 3] 3037         ldab    (0x007B)
   99B8 C4 DF         [ 2] 3038         andb    #0xDF           ; clear bit 5
   99BA BD 87 58      [ 6] 3039         jsr     L8748
   99BD BD 87 A1      [ 6] 3040         jsr     L8791   
   99C0 39            [ 5] 3041         rts
                           3042 
   99C1                    3043 L99B1:
   99C1 D6 7B         [ 3] 3044         ldab    (0x007B)
   99C3 CA 20         [ 2] 3045         orab    #0x20
   99C5 BD 87 58      [ 6] 3046         jsr     L8748   
   99C8 BD 87 BE      [ 6] 3047         jsr     L87AE
   99CB 39            [ 5] 3048         rts
                           3049 
   99CC D6 7B         [ 3] 3050         ldab    (0x007B)
   99CE C4 DF         [ 2] 3051         andb    #0xDF
   99D0 BD 87 58      [ 6] 3052         jsr     L8748   
   99D3 BD 87 BE      [ 6] 3053         jsr     L87AE
   99D6 39            [ 5] 3054         rts
                           3055 
   99D7 D6 7B         [ 3] 3056         ldab    (0x007B)
   99D9 CA 20         [ 2] 3057         orab    #0x20
   99DB BD 87 58      [ 6] 3058         jsr     L8748   
   99DE BD 87 A1      [ 6] 3059         jsr     L8791   
   99E1 39            [ 5] 3060         rts
                           3061 
   99E2                    3062 L99D2:
   99E2 86 01         [ 2] 3063         ldaa    #0x01
   99E4 97 78         [ 3] 3064         staa    (0x0078)
   99E6 7E 85 AD      [ 3] 3065         jmp     L85A4
   99E9                    3066 L99D9:
   99E9 CE 0E 20      [ 3] 3067         ldx     #0x0E20
   99EC A6 00         [ 4] 3068         ldaa    0,X     
   99EE 80 30         [ 2] 3069         suba    #0x30
   99F0 C6 0A         [ 2] 3070         ldab    #0x0A
   99F2 3D            [10] 3071         mul
   99F3 17            [ 2] 3072         tba                     ; (0E20)*10 into A
   99F4 C6 64         [ 2] 3073         ldab    #0x64
   99F6 3D            [10] 3074         mul
   99F7 DD 17         [ 4] 3075         std     (0x0017)        ; (0E20)*1000 into 17:18
   99F9 A6 01         [ 4] 3076         ldaa    1,X
   99FB 80 30         [ 2] 3077         suba    #0x30
   99FD C6 64         [ 2] 3078         ldab    #0x64
   99FF 3D            [10] 3079         mul
   9A00 D3 17         [ 5] 3080         addd    (0x0017)
   9A02 DD 17         [ 4] 3081         std     (0x0017)        ; (0E20)*1000+(0E21)*100 into 17:18
   9A04 A6 02         [ 4] 3082         ldaa    2,X     
   9A06 80 30         [ 2] 3083         suba    #0x30
   9A08 C6 0A         [ 2] 3084         ldab    #0x0A
   9A0A 3D            [10] 3085         mul
   9A0B D3 17         [ 5] 3086         addd    (0x0017)    
   9A0D DD 17         [ 4] 3087         std     (0x0017)        ; (0E20)*1000+(0E21)*100+(0E22)*10 into 17:18
   9A0F 4F            [ 2] 3088         clra
   9A10 E6 03         [ 4] 3089         ldab    3,X     
   9A12 C0 30         [ 2] 3090         subb    #0x30
   9A14 D3 17         [ 5] 3091         addd    (0x0017)    
   9A16 FD 02 9C      [ 5] 3092         std     (0x029C)        ; (0E20)*1000+(0E21)*100+(0E22)*10+(0E23) into (029C:029D)
   9A19 CE 0E 20      [ 3] 3093         ldx     #0x0E20
   9A1C                    3094 L9A0C:
   9A1C A6 00         [ 4] 3095         ldaa    0,X         
   9A1E 81 30         [ 2] 3096         cmpa    #0x30
   9A20 25 13         [ 3] 3097         bcs     L9A25  
   9A22 81 39         [ 2] 3098         cmpa    #0x39
   9A24 22 0F         [ 3] 3099         bhi     L9A25  
   9A26 08            [ 3] 3100         inx
   9A27 8C 0E 24      [ 4] 3101         cpx     #0x0E24
   9A2A 26 F0         [ 3] 3102         bne     L9A0C  
   9A2C B6 0E 24      [ 4] 3103         ldaa    (0x0E24)        ; check EEPROM signature
   9A2F 81 DB         [ 2] 3104         cmpa    #0xDB
   9A31 26 02         [ 3] 3105         bne     L9A25  
   9A33 0C            [ 2] 3106         clc                     ; if sig good, return carry clear
   9A34 39            [ 5] 3107         rts
                           3108 
   9A35                    3109 L9A25:
   9A35 0D            [ 2] 3110         sec                     ; if sig bad, return carry clear
   9A36 39            [ 5] 3111         rts
                           3112 
   9A37                    3113 L9A27:
   9A37 BD 8D F4      [ 6] 3114         jsr     LCDMSG1 
   9A3A 53 65 72 69 61 6C  3115         .ascis  'Serial# '
        23 A0
                           3116 
   9A42 BD 8D ED      [ 6] 3117         jsr     LCDMSG2 
   9A45 20 20 20 20 20 20  3118         .ascis  '               '
        20 20 20 20 20 20
        20 20 A0
                           3119 
                           3120 ; display 4-digit serial number
   9A54 C6 08         [ 2] 3121         ldab    #0x08
   9A56 18 CE 0E 20   [ 4] 3122         ldy     #0x0E20
   9A5A                    3123 L9A4A:
   9A5A 18 A6 00      [ 5] 3124         ldaa    0,Y     
   9A5D 18 3C         [ 5] 3125         pshy
   9A5F 37            [ 3] 3126         pshb
   9A60 BD 8D C5      [ 6] 3127         jsr     L8DB5            ; display char here on LCD display
   9A63 33            [ 4] 3128         pulb
   9A64 18 38         [ 6] 3129         puly
   9A66 5C            [ 2] 3130         incb
   9A67 18 08         [ 4] 3131         iny
   9A69 18 8C 0E 24   [ 5] 3132         cpy     #0x0E24
   9A6D 26 EB         [ 3] 3133         bne     L9A4A  
   9A6F 39            [ 5] 3134         rts
                           3135 
                           3136 ; Unused?
   9A70                    3137 L9A60:
   9A70 86 01         [ 2] 3138         ldaa    #0x01
   9A72 97 B5         [ 3] 3139         staa    (0x00B5)
   9A74 96 4E         [ 3] 3140         ldaa    (0x004E)
   9A76 97 7F         [ 3] 3141         staa    (0x007F)
   9A78 96 62         [ 3] 3142         ldaa    (0x0062)
   9A7A 97 80         [ 3] 3143         staa    (0x0080)
   9A7C 96 7B         [ 3] 3144         ldaa    (0x007B)
   9A7E 97 81         [ 3] 3145         staa    (0x0081)
   9A80 96 7A         [ 3] 3146         ldaa    (0x007A)
   9A82 97 82         [ 3] 3147         staa    (0x0082)
   9A84 96 78         [ 3] 3148         ldaa    (0x0078)
   9A86 97 7D         [ 3] 3149         staa    (0x007D)
   9A88 B6 10 8A      [ 4] 3150         ldaa    (0x108A)
   9A8B 84 06         [ 2] 3151         anda    #0x06
   9A8D 97 7E         [ 3] 3152         staa    (0x007E)
   9A8F                    3153 L9A7F:
   9A8F C6 EF         [ 2] 3154         ldab    #0xEF           ; tape deck EJECT
   9A91 BD 86 F7      [ 6] 3155         jsr     L86E7
   9A94 D6 7B         [ 3] 3156         ldab    (0x007B)
   9A96 CA 0C         [ 2] 3157         orab    #0x0C
   9A98 C4 DF         [ 2] 3158         andb    #0xDF
   9A9A BD 87 58      [ 6] 3159         jsr     L8748   
   9A9D BD 87 A1      [ 6] 3160         jsr     L8791   
   9AA0 BD 86 D4      [ 6] 3161         jsr     L86C4           ; Reset boards 1-10
   9AA3 BD 9C 61      [ 6] 3162         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9AA6 C6 06         [ 2] 3163         ldab    #0x06           ; delay 6 secs
   9AA8 BD 8C 12      [ 6] 3164         jsr     DLYSECS         ;
   9AAB BD 8E A5      [ 6] 3165         jsr     L8E95
   9AAE BD 99 B6      [ 6] 3166         jsr     L99A6
   9AB1 7E 81 BA      [ 3] 3167         jmp     L81BD
   9AB4                    3168 L9AA4:
   9AB4 7F 00 5C      [ 6] 3169         clr     (0x005C)
   9AB7 86 01         [ 2] 3170         ldaa    #0x01
   9AB9 97 79         [ 3] 3171         staa    (0x0079)
   9ABB C6 FD         [ 2] 3172         ldab    #0xFD           ; tape deck STOP
   9ABD BD 86 F7      [ 6] 3173         jsr     L86E7
   9AC0 BD 8E A5      [ 6] 3174         jsr     L8E95
   9AC3 CC 75 30      [ 3] 3175         ldd     #0x7530
   9AC6 DD 1D         [ 4] 3176         std     CDTIMR2
   9AC8                    3177 L9AB8:
   9AC8 BD 9B 29      [ 6] 3178         jsr     L9B19           ; do the random motions if enabled
   9ACB D6 62         [ 3] 3179         ldab    (0x0062)
   9ACD C8 04         [ 2] 3180         eorb    #0x04
   9ACF D7 62         [ 3] 3181         stab    (0x0062)
   9AD1 BD FA F9      [ 6] 3182         jsr     BUTNLIT 
   9AD4 F6 18 04      [ 4] 3183         ldab    PIA0PRA 
   9AD7 C8 08         [ 2] 3184         eorb    #0x08
   9AD9 F7 18 04      [ 4] 3185         stab    PIA0PRA 
   9ADC 7D 00 5C      [ 6] 3186         tst     (0x005C)
   9ADF 26 12         [ 3] 3187         bne     L9AE3  
   9AE1 BD 8E A5      [ 6] 3188         jsr     L8E95
   9AE4 81 0D         [ 2] 3189         cmpa    #0x0D
   9AE6 27 0B         [ 3] 3190         beq     L9AE3  
   9AE8 C6 32         [ 2] 3191         ldab    #0x32           ; delay 0.5 sec
   9AEA BD 8C 32      [ 6] 3192         jsr     DLYSECSBY100
   9AED DC 1D         [ 4] 3193         ldd     CDTIMR2
   9AEF 27 02         [ 3] 3194         beq     L9AE3  
   9AF1 20 D5         [ 3] 3195         bra     L9AB8  
   9AF3                    3196 L9AE3:
   9AF3 D6 62         [ 3] 3197         ldab    (0x0062)
   9AF5 C4 FB         [ 2] 3198         andb    #0xFB
   9AF7 D7 62         [ 3] 3199         stab    (0x0062)
   9AF9 BD FA F9      [ 6] 3200         jsr     BUTNLIT 
   9AFC BD A3 91      [ 6] 3201         jsr     LA354
   9AFF C6 FB         [ 2] 3202         ldab    #0xFB           ; tape deck PLAY
   9B01 BD 86 F7      [ 6] 3203         jsr     L86E7
   9B04 7E 85 AD      [ 3] 3204         jmp     L85A4
   9B07                    3205 L9AF7:
   9B07 7F 00 75      [ 6] 3206         clr     (0x0075)
   9B0A 7F 00 76      [ 6] 3207         clr     (0x0076)
   9B0D 7F 00 77      [ 6] 3208         clr     (0x0077)
   9B10 7F 00 78      [ 6] 3209         clr     (0x0078)
   9B13 7F 00 25      [ 6] 3210         clr     (0x0025)
   9B16 7F 00 26      [ 6] 3211         clr     (0x0026)
   9B19 7F 00 4E      [ 6] 3212         clr     (0x004E)
   9B1C 7F 00 30      [ 6] 3213         clr     (0x0030)        ; clear SCD key states
   9B1F 7F 00 31      [ 6] 3214         clr     (0x0031)
   9B22 7F 00 32      [ 6] 3215         clr     (0x0032)
   9B25 7F 00 AF      [ 6] 3216         clr     (0x00AF)
   9B28 39            [ 5] 3217         rts
                           3218 
                           3219 ; do the random motions if enabled
   9B29                    3220 L9B19:
   9B29 36            [ 3] 3221         psha
   9B2A 37            [ 3] 3222         pshb
   9B2B 96 4E         [ 3] 3223         ldaa    (0x004E)
   9B2D 27 17         [ 3] 3224         beq     L9B36           ; go to 0401 logic
   9B2F 96 63         [ 3] 3225         ldaa    (0x0063)        ; check countdown timer
   9B31 26 10         [ 3] 3226         bne     L9B33           ; exit
   9B33 7D 00 64      [ 6] 3227         tst     (0x0064)
   9B36 27 09         [ 3] 3228         beq     L9B31           ; go to 0401 logic
   9B38 BD 86 D4      [ 6] 3229         jsr     L86C4           ; Reset boards 1-10
   9B3B BD 9C 61      [ 6] 3230         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9B3E 7F 00 64      [ 6] 3231         clr     (0x0064)
   9B41                    3232 L9B31:
   9B41 20 03         [ 3] 3233         bra     L9B36           ; go to 0401 logic
   9B43                    3234 L9B33:
   9B43 33            [ 4] 3235         pulb
   9B44 32            [ 4] 3236         pula
   9B45 39            [ 5] 3237         rts
                           3238 
                           3239 ; end up here immediately if:
                           3240 ; 0x004E == 00 or
                           3241 ; 0x0063, 0x0064 == 0 or
                           3242 ; 
                           3243 ; do subroutines based on bits 0-4 of 0x0401?
   9B46                    3244 L9B36:
   9B46 B6 04 01      [ 4] 3245         ldaa    (0x0401)
   9B49 84 01         [ 2] 3246         anda    #0x01
   9B4B 27 03         [ 3] 3247         beq     L9B40  
   9B4D BD 9B 7B      [ 6] 3248         jsr     L9B6B           ; bit 0 routine
   9B50                    3249 L9B40:
   9B50 B6 04 01      [ 4] 3250         ldaa    (0x0401)
   9B53 84 02         [ 2] 3251         anda    #0x02
   9B55 27 03         [ 3] 3252         beq     L9B4A  
   9B57 BD 9B A9      [ 6] 3253         jsr     L9B99           ; bit 1 routine
   9B5A                    3254 L9B4A:
   9B5A B6 04 01      [ 4] 3255         ldaa    (0x0401)
   9B5D 84 04         [ 2] 3256         anda    #0x04
   9B5F 27 03         [ 3] 3257         beq     L9B54  
   9B61 BD 9B D7      [ 6] 3258         jsr     L9BC7           ; bit 2 routine
   9B64                    3259 L9B54:
   9B64 B6 04 01      [ 4] 3260         ldaa    (0x0401)
   9B67 84 08         [ 2] 3261         anda    #0x08
   9B69 27 03         [ 3] 3262         beq     L9B5E  
   9B6B BD 9C 05      [ 6] 3263         jsr     L9BF5           ; bit 3 routine
   9B6E                    3264 L9B5E:
   9B6E B6 04 01      [ 4] 3265         ldaa    (0x0401)
   9B71 84 10         [ 2] 3266         anda    #0x10
   9B73 27 03         [ 3] 3267         beq     L9B68  
   9B75 BD 9C 33      [ 6] 3268         jsr     L9C23           ; bit 4 routine
   9B78                    3269 L9B68:
   9B78 33            [ 4] 3270         pulb
   9B79 32            [ 4] 3271         pula
   9B7A 39            [ 5] 3272         rts
                           3273 
                           3274 ; bit 0 routine
   9B7B                    3275 L9B6B:
   9B7B 18 3C         [ 5] 3276         pshy
   9B7D 18 DE 65      [ 5] 3277         ldy     (0x0065)
   9B80 18 A6 00      [ 5] 3278         ldaa    0,Y     
   9B83 81 FF         [ 2] 3279         cmpa    #0xFF
   9B85 27 14         [ 3] 3280         beq     L9B8B  
   9B87 91 70         [ 3] 3281         cmpa    OFFCNT1
   9B89 25 0D         [ 3] 3282         bcs     L9B88  
   9B8B 18 08         [ 4] 3283         iny
   9B8D 18 A6 00      [ 5] 3284         ldaa    0,Y     
   9B90 B7 10 80      [ 4] 3285         staa    (0x1080)        ; do some stuff to board 1
   9B93 18 08         [ 4] 3286         iny
   9B95 18 DF 65      [ 5] 3287         sty     (0x0065)
   9B98                    3288 L9B88:
   9B98 18 38         [ 6] 3289         puly
   9B9A 39            [ 5] 3290         rts
   9B9B                    3291 L9B8B:
   9B9B 18 CE B3 28   [ 4] 3292         ldy     #LB2EB
   9B9F 18 DF 65      [ 5] 3293         sty     (0x0065)
   9BA2 86 FA         [ 2] 3294         ldaa    #0xFA
   9BA4 97 70         [ 3] 3295         staa    OFFCNT1
   9BA6 7E 9B 98      [ 3] 3296         jmp     L9B88
                           3297 
                           3298 ; bit 1 routine
   9BA9                    3299 L9B99:
   9BA9 18 3C         [ 5] 3300         pshy
   9BAB 18 DE 67      [ 5] 3301         ldy     (0x0067)
   9BAE 18 A6 00      [ 5] 3302         ldaa    0,Y     
   9BB1 81 FF         [ 2] 3303         cmpa    #0xFF
   9BB3 27 14         [ 3] 3304         beq     L9BB9  
   9BB5 91 71         [ 3] 3305         cmpa    OFFCNT2
   9BB7 25 0D         [ 3] 3306         bcs     L9BB6  
   9BB9 18 08         [ 4] 3307         iny
   9BBB 18 A6 00      [ 5] 3308         ldaa    0,Y     
   9BBE B7 10 84      [ 4] 3309         staa    (0x1084)        ; do some stuff to board 2
   9BC1 18 08         [ 4] 3310         iny
   9BC3 18 DF 67      [ 5] 3311         sty     (0x0067)
   9BC6                    3312 L9BB6:
   9BC6 18 38         [ 6] 3313         puly
   9BC8 39            [ 5] 3314         rts
   9BC9                    3315 L9BB9:
   9BC9 18 CE B3 FA   [ 4] 3316         ldy     #LB3BD
   9BCD 18 DF 67      [ 5] 3317         sty     (0x0067)
   9BD0 86 E6         [ 2] 3318         ldaa    #0xE6
   9BD2 97 71         [ 3] 3319         staa    OFFCNT2
   9BD4 7E 9B C6      [ 3] 3320         jmp     L9BB6
                           3321 
                           3322 ; bit 2 routine
   9BD7                    3323 L9BC7:
   9BD7 18 3C         [ 5] 3324         pshy
   9BD9 18 DE 69      [ 5] 3325         ldy     (0x0069)
   9BDC 18 A6 00      [ 5] 3326         ldaa    0,Y     
   9BDF 81 FF         [ 2] 3327         cmpa    #0xFF
   9BE1 27 14         [ 3] 3328         beq     L9BE7  
   9BE3 91 72         [ 3] 3329         cmpa    OFFCNT3
   9BE5 25 0D         [ 3] 3330         bcs     L9BE4  
   9BE7 18 08         [ 4] 3331         iny
   9BE9 18 A6 00      [ 5] 3332         ldaa    0,Y     
   9BEC B7 10 88      [ 4] 3333         staa    (0x1088)        ; do some stuff to board 3
   9BEF 18 08         [ 4] 3334         iny
   9BF1 18 DF 69      [ 5] 3335         sty     (0x0069)
   9BF4                    3336 L9BE4:
   9BF4 18 38         [ 6] 3337         puly
   9BF6 39            [ 5] 3338         rts
   9BF7                    3339 L9BE7:
   9BF7 18 CE B5 6E   [ 4] 3340         ldy     #LB531
   9BFB 18 DF 69      [ 5] 3341         sty     (0x0069)
   9BFE 86 D2         [ 2] 3342         ldaa    #0xD2
   9C00 97 72         [ 3] 3343         staa    OFFCNT3
   9C02 7E 9B F4      [ 3] 3344         jmp     L9BE4
                           3345 
                           3346 ; bit 3 routine
   9C05                    3347 L9BF5:
   9C05 18 3C         [ 5] 3348         pshy
   9C07 18 DE 6B      [ 5] 3349         ldy     (0x006B)
   9C0A 18 A6 00      [ 5] 3350         ldaa    0,Y     
   9C0D 81 FF         [ 2] 3351         cmpa    #0xFF
   9C0F 27 14         [ 3] 3352         beq     L9C15  
   9C11 91 73         [ 3] 3353         cmpa    OFFCNT4
   9C13 25 0D         [ 3] 3354         bcs     L9C12  
   9C15 18 08         [ 4] 3355         iny
   9C17 18 A6 00      [ 5] 3356         ldaa    0,Y     
   9C1A B7 10 8C      [ 4] 3357         staa    (0x108C)        ; do some stuff to board 4
   9C1D 18 08         [ 4] 3358         iny
   9C1F 18 DF 6B      [ 5] 3359         sty     (0x006B)
   9C22                    3360 L9C12:
   9C22 18 38         [ 6] 3361         puly
   9C24 39            [ 5] 3362         rts
   9C25                    3363 L9C15:
   9C25 18 CE B4 B2   [ 4] 3364         ldy     #LB475
   9C29 18 DF 6B      [ 5] 3365         sty     (0x006B)
   9C2C 86 BE         [ 2] 3366         ldaa    #0xBE
   9C2E 97 73         [ 3] 3367         staa    OFFCNT4
   9C30 7E 9C 22      [ 3] 3368         jmp     L9C12
                           3369 
                           3370 ; bit 4 routine
   9C33                    3371 L9C23:
   9C33 18 3C         [ 5] 3372         pshy
   9C35 18 DE 6D      [ 5] 3373         ldy     (0x006D)
   9C38 18 A6 00      [ 5] 3374         ldaa    0,Y     
   9C3B 81 FF         [ 2] 3375         cmpa    #0xFF
   9C3D 27 14         [ 3] 3376         beq     L9C43  
   9C3F 91 74         [ 3] 3377         cmpa    OFFCNT5
   9C41 25 0D         [ 3] 3378         bcs     L9C40  
   9C43 18 08         [ 4] 3379         iny
   9C45 18 A6 00      [ 5] 3380         ldaa    0,Y     
   9C48 B7 10 90      [ 4] 3381         staa    (0x1090)        ; do some stuff to board 5
   9C4B 18 08         [ 4] 3382         iny
   9C4D 18 DF 6D      [ 5] 3383         sty     (0x006D)
   9C50                    3384 L9C40:
   9C50 18 38         [ 6] 3385         puly
   9C52 39            [ 5] 3386         rts
   9C53                    3387 L9C43:
   9C53 18 CE B6 00   [ 4] 3388         ldy     #LB5C3
   9C57 18 DF 6D      [ 5] 3389         sty     (0x006D)
   9C5A 86 AA         [ 2] 3390         ldaa    #0xAA
   9C5C 97 74         [ 3] 3391         staa    OFFCNT5
   9C5E 7E 9C 50      [ 3] 3392         jmp     L9C40
                           3393 
                           3394 ; Reset offset counters to initial values
   9C61                    3395 L9C51:
   9C61 86 FA         [ 2] 3396         ldaa    #0xFA
   9C63 97 70         [ 3] 3397         staa    OFFCNT1
   9C65 86 E6         [ 2] 3398         ldaa    #0xE6
   9C67 97 71         [ 3] 3399         staa    OFFCNT2
   9C69 86 D2         [ 2] 3400         ldaa    #0xD2
   9C6B 97 72         [ 3] 3401         staa    OFFCNT3
   9C6D 86 BE         [ 2] 3402         ldaa    #0xBE
   9C6F 97 73         [ 3] 3403         staa    OFFCNT4
   9C71 86 AA         [ 2] 3404         ldaa    #0xAA
   9C73 97 74         [ 3] 3405         staa    OFFCNT5
                           3406 
                           3407         ; int random movement table pointers
   9C75 18 CE B3 28   [ 4] 3408         ldy     #LB2EB
   9C79 18 DF 65      [ 5] 3409         sty     (0x0065)
   9C7C 18 CE B3 FA   [ 4] 3410         ldy     #LB3BD
   9C80 18 DF 67      [ 5] 3411         sty     (0x0067)
   9C83 18 CE B5 6E   [ 4] 3412         ldy     #LB531
   9C87 18 DF 69      [ 5] 3413         sty     (0x0069)
   9C8A 18 CE B4 B2   [ 4] 3414         ldy     #LB475
   9C8E 18 DF 6B      [ 5] 3415         sty     (0x006B)
   9C91 18 CE B6 00   [ 4] 3416         ldy     #LB5C3
   9C95 18 DF 6D      [ 5] 3417         sty     (0x006D)
                           3418 
                           3419         ; clear board 8
   9C98 7F 10 9C      [ 6] 3420         clr     (0x109C)
   9C9B 7F 10 9E      [ 6] 3421         clr     (0x109E)
                           3422 
                           3423         ; if bit 5 of 0401 is set, turn on 3 bits on board 8
   9C9E B6 04 01      [ 4] 3424         ldaa    (0x0401)
   9CA1 84 20         [ 2] 3425         anda    #0x20
   9CA3 27 08         [ 3] 3426         beq     L9C9D
   9CA5 B6 10 9C      [ 4] 3427         ldaa    (0x109C)
   9CA8 8A 19         [ 2] 3428         oraa    #0x19
   9CAA B7 10 9C      [ 4] 3429         staa    (0x109C)
                           3430         ; if bit 6 of 0401 is set, turn on 3 bits on board 8
   9CAD                    3431 L9C9D:
   9CAD B6 04 01      [ 4] 3432         ldaa    (0x0401)
   9CB0 84 40         [ 2] 3433         anda    #0x40
   9CB2 27 10         [ 3] 3434         beq     L9CB4  
   9CB4 B6 10 9C      [ 4] 3435         ldaa    (0x109C)
   9CB7 8A 44         [ 2] 3436         oraa    #0x44
   9CB9 B7 10 9C      [ 4] 3437         staa    (0x109C)
   9CBC B6 10 9E      [ 4] 3438         ldaa    (0x109E)
   9CBF 8A 40         [ 2] 3439         oraa    #0x40
   9CC1 B7 10 9E      [ 4] 3440         staa    (0x109E)
                           3441         ; if bit 7 of 0401 is set, turn on 3 bits on board 8
   9CC4                    3442 L9CB4:
   9CC4 B6 04 01      [ 4] 3443         ldaa    (0x0401)
   9CC7 84 80         [ 2] 3444         anda    #0x80
   9CC9 27 08         [ 3] 3445         beq     L9CC3  
   9CCB B6 10 9C      [ 4] 3446         ldaa    (0x109C)
   9CCE 8A A2         [ 2] 3447         oraa    #0xA2
   9CD0 B7 10 9C      [ 4] 3448         staa    (0x109C)
                           3449 
   9CD3                    3450 L9CC3:
                           3451         ; if bit 0 of 042B is set, turn on 1 bit on board 7
   9CD3 B6 04 2B      [ 4] 3452         ldaa    (0x042B)
   9CD6 84 01         [ 2] 3453         anda    #0x01
   9CD8 27 08         [ 3] 3454         beq     L9CD2  
   9CDA B6 10 9A      [ 4] 3455         ldaa    (0x109A)
   9CDD 8A 80         [ 2] 3456         oraa    #0x80
   9CDF B7 10 9A      [ 4] 3457         staa    (0x109A)
   9CE2                    3458 L9CD2:
                           3459         ; if bit 1 of 042B is set, turn on 1 bit on board 8
   9CE2 B6 04 2B      [ 4] 3460         ldaa    (0x042B)
   9CE5 84 02         [ 2] 3461         anda    #0x02
   9CE7 27 08         [ 3] 3462         beq     L9CE1  
   9CE9 B6 10 9E      [ 4] 3463         ldaa    (0x109E)
   9CEC 8A 04         [ 2] 3464         oraa    #0x04
   9CEE B7 10 9E      [ 4] 3465         staa    (0x109E)
   9CF1                    3466 L9CE1:
                           3467         ; if bit 2 of 042B is set, turn on 1 bit on board 8
   9CF1 B6 04 2B      [ 4] 3468         ldaa    (0x042B)
   9CF4 84 04         [ 2] 3469         anda    #0x04
   9CF6 27 08         [ 3] 3470         beq     L9CF0  
   9CF8 B6 10 9E      [ 4] 3471         ldaa    (0x109E)
   9CFB 8A 08         [ 2] 3472         oraa    #0x08
   9CFD B7 10 9E      [ 4] 3473         staa    (0x109E)
   9D00                    3474 L9CF0:
   9D00 39            [ 5] 3475         rts
                           3476 
                           3477 ; Display Credits
   9D01                    3478 L9CF1:
   9D01 BD 8D F4      [ 6] 3479         jsr     LCDMSG1 
   9D04 20 20 20 50 72 6F  3480         .ascis  '   Program by   '
        67 72 61 6D 20 62
        79 20 20 A0
   9D14 BD 8D ED      [ 6] 3481         jsr     LCDMSG2 
   9D17 44 61 76 69 64 20  3482         .ascis  'David  Philipsen'
        20 50 68 69 6C 69
        70 73 65 EE
   9D27 39            [ 5] 3483         rts
                           3484 
   9D28                    3485 L9D28N:
   9D28 BD 8D F4      [ 6] 3486         jsr     LCDMSG1                 ; NEW
   9D2B 50 72 65 73 73 20  3487         .ascis  'Press Enter for '      ; NEW
        45 6E 74 65 72 20
        66 6F 72 A0
   9D3B BD 8D ED      [ 6] 3488         jsr     LCDMSG2                 ; NEW
   9D3E 44 69 61 67 6E 6F  3489         .ascis  'Diagnostics     '      ; NEW
        73 74 69 63 73 20
        20 20 20 A0
   9D4E 39            [ 5] 3490         rts                             ; NEW
                           3491 
   9D4F                    3492 L9D18:
   9D4F 0C            [ 2] 3493         clc                             ; NEW
   9D50 C6 01         [ 2] 3494         ldab    #0x01                   ; NEW
   9D52 D7 B8         [ 3] 3495         stab    (0x00B8)                ; NEW
   9D54 39            [ 5] 3496         rts                             ; NEW
                           3497 
   9D55 97 49         [ 3] 3498         staa    (0x0049)
   9D57 7F 00 B8      [ 6] 3499         clr     (0x00B8)
   9D5A BD 8D 13      [ 6] 3500         jsr     L8D03
   9D5D 86 2A         [ 2] 3501         ldaa    #0x2A           ;'*'
   9D5F C6 28         [ 2] 3502         ldab    #0x28
   9D61 BD 8D C5      [ 6] 3503         jsr     L8DB5           ; display char here on LCD display
   9D64 CC 0B B8      [ 3] 3504         ldd     #0x0BB8         ; start 30 second timer?
   9D67 DD 1B         [ 4] 3505         std     CDTIMR1
   9D69                    3506 L9D2C:
   9D69 BD 9B 29      [ 6] 3507         jsr     L9B19           ; do the random motions if enabled
   9D6C 96 49         [ 3] 3508         ldaa    (0x0049)
   9D6E 81 41         [ 2] 3509         cmpa    #0x41
   9D70 27 04         [ 3] 3510         beq     L9D39  
   9D72 81 4B         [ 2] 3511         cmpa    #0x4B
   9D74 26 04         [ 3] 3512         bne     L9D3D  
   9D76                    3513 L9D39:
   9D76 C6 01         [ 2] 3514         ldab    #0x01
   9D78 D7 B8         [ 3] 3515         stab    (0x00B8)
   9D7A                    3516 L9D3D:
   9D7A 81 41         [ 2] 3517         cmpa    #0x41
   9D7C 27 04         [ 3] 3518         beq     L9D45  
   9D7E 81 4F         [ 2] 3519         cmpa    #0x4F
   9D80 26 07         [ 3] 3520         bne     L9D4C  
   9D82                    3521 L9D45:
   9D82 86 01         [ 2] 3522         ldaa    #0x01
   9D84 B7 02 98      [ 4] 3523         staa    (0x0298)
   9D87 20 32         [ 3] 3524         bra     L9D7E  
   9D89                    3525 L9D4C:
   9D89 81 4B         [ 2] 3526         cmpa    #0x4B
   9D8B 27 04         [ 3] 3527         beq     L9D54  
   9D8D 81 50         [ 2] 3528         cmpa    #0x50
   9D8F 26 07         [ 3] 3529         bne     L9D5B  
   9D91                    3530 L9D54:
   9D91 86 02         [ 2] 3531         ldaa    #0x02
   9D93 B7 02 98      [ 4] 3532         staa    (0x0298)
   9D96 20 23         [ 3] 3533         bra     L9D7E  
   9D98                    3534 L9D5B:
   9D98 81 4C         [ 2] 3535         cmpa    #0x4C
   9D9A 26 07         [ 3] 3536         bne     L9D66  
   9D9C 86 03         [ 2] 3537         ldaa    #0x03
   9D9E B7 02 98      [ 4] 3538         staa    (0x0298)
   9DA1 20 18         [ 3] 3539         bra     L9D7E  
   9DA3                    3540 L9D66:
   9DA3 81 52         [ 2] 3541         cmpa    #0x52
   9DA5 26 07         [ 3] 3542         bne     L9D71  
   9DA7 86 04         [ 2] 3543         ldaa    #0x04
   9DA9 B7 02 98      [ 4] 3544         staa    (0x0298)
   9DAC 20 0D         [ 3] 3545         bra     L9D7E  
   9DAE                    3546 L9D71:
   9DAE DC 1B         [ 4] 3547         ldd     CDTIMR1
   9DB0 26 B7         [ 3] 3548         bne     L9D2C  
   9DB2 86 23         [ 2] 3549         ldaa    #0x23           ;'#'
   9DB4 C6 29         [ 2] 3550         ldab    #0x29
   9DB6 BD 8D C5      [ 6] 3551         jsr     L8DB5           ; display char here on LCD display
   9DB9 20 6C         [ 3] 3552         bra     L9DEA  
   9DBB                    3553 L9D7E:
   9DBB 7F 00 49      [ 6] 3554         clr     (0x0049)
   9DBE 86 2A         [ 2] 3555         ldaa    #0x2A           ;'*'
   9DC0 C6 29         [ 2] 3556         ldab    #0x29
   9DC2 BD 8D C5      [ 6] 3557         jsr     L8DB5           ; display char here on LCD display
   9DC5 7F 00 4A      [ 6] 3558         clr     (0x004A)
   9DC8 CE 02 99      [ 3] 3559         ldx     #0x0299
   9DCB                    3560 L9D8E:
   9DCB BD 9B 29      [ 6] 3561         jsr     L9B19           ; do the random motions if enabled
   9DCE 96 4A         [ 3] 3562         ldaa    (0x004A)
   9DD0 27 F9         [ 3] 3563         beq     L9D8E  
   9DD2 7F 00 4A      [ 6] 3564         clr     (0x004A)
   9DD5 84 3F         [ 2] 3565         anda    #0x3F
   9DD7 A7 00         [ 4] 3566         staa    0,X     
   9DD9 08            [ 3] 3567         inx
   9DDA 8C 02 9C      [ 4] 3568         cpx     #0x029C
   9DDD 26 EC         [ 3] 3569         bne     L9D8E  
   9DDF BD 9E 32      [ 6] 3570         jsr     L9DF5
   9DE2 24 09         [ 3] 3571         bcc     L9DB0  
   9DE4 86 23         [ 2] 3572         ldaa    #0x23           ;'#'
   9DE6 C6 2A         [ 2] 3573         ldab    #0x2A
   9DE8 BD 8D C5      [ 6] 3574         jsr     L8DB5           ; display char here on LCD display
   9DEB 20 3A         [ 3] 3575         bra     L9DEA  
   9DED                    3576 L9DB0:
   9DED 86 2A         [ 2] 3577         ldaa    #0x2A           ;'*'
   9DEF C6 2A         [ 2] 3578         ldab    #0x2A
   9DF1 BD 8D C5      [ 6] 3579         jsr     L8DB5           ; display char here on LCD display
   9DF4 B6 02 99      [ 4] 3580         ldaa    (0x0299)
   9DF7 81 39         [ 2] 3581         cmpa    #0x39
   9DF9 26 15         [ 3] 3582         bne     L9DD3  
                           3583 
   9DFB BD 8D ED      [ 6] 3584         jsr     LCDMSG2 
   9DFE 47 65 6E 65 72 69  3585         .ascis  'Generic Showtape'
        63 20 53 68 6F 77
        74 61 70 E5
                           3586 
   9E0E 0C            [ 2] 3587         clc
   9E0F 39            [ 5] 3588         rts
                           3589 
   9E10                    3590 L9DD3:
   9E10 B6 02 98      [ 4] 3591         ldaa    (0x0298)
   9E13 81 03         [ 2] 3592         cmpa    #0x03
   9E15 27 0E         [ 3] 3593         beq     L9DE8  
   9E17 81 04         [ 2] 3594         cmpa    #0x04
   9E19 27 0A         [ 3] 3595         beq     L9DE8  
   9E1B 96 76         [ 3] 3596         ldaa    (0x0076)
   9E1D 26 06         [ 3] 3597         bne     L9DE8  
   9E1F BD 9E B0      [ 6] 3598         jsr     L9E73
   9E22 BD 9F 09      [ 6] 3599         jsr     L9ECC
   9E25                    3600 L9DE8:
   9E25 0C            [ 2] 3601         clc
   9E26 39            [ 5] 3602         rts
                           3603 
   9E27                    3604 L9DEA:
   9E27 FC 04 20      [ 5] 3605         ldd     (0x0420)
   9E2A C3 00 01      [ 4] 3606         addd    #0x0001
   9E2D FD 04 20      [ 5] 3607         std     (0x0420)
   9E30 0D            [ 2] 3608         sec
   9E31 39            [ 5] 3609         rts
                           3610 
   9E32                    3611 L9DF5:
   9E32 B6 02 99      [ 4] 3612         ldaa    (0x0299)
   9E35 81 39         [ 2] 3613         cmpa    #0x39
   9E37 27 6C         [ 3] 3614         beq     L9E68  
   9E39 CE 00 A8      [ 3] 3615         ldx     #0x00A8
   9E3C                    3616 L9DFF:
   9E3C BD 9B 29      [ 6] 3617         jsr     L9B19           ; do the random motions if enabled
   9E3F 96 4A         [ 3] 3618         ldaa    (0x004A)
   9E41 27 F9         [ 3] 3619         beq     L9DFF  
   9E43 7F 00 4A      [ 6] 3620         clr     (0x004A)
   9E46 A7 00         [ 4] 3621         staa    0,X     
   9E48 08            [ 3] 3622         inx
   9E49 8C 00 AA      [ 4] 3623         cpx     #0x00AA
   9E4C 26 EE         [ 3] 3624         bne     L9DFF  
   9E4E BD 9F 37      [ 6] 3625         jsr     L9EFA
   9E51 CE 02 99      [ 3] 3626         ldx     #0x0299
   9E54 7F 00 13      [ 6] 3627         clr     (0x0013)
   9E57                    3628 L9E1A:
   9E57 A6 00         [ 4] 3629         ldaa    0,X     
   9E59 9B 13         [ 3] 3630         adda    (0x0013)
   9E5B 97 13         [ 3] 3631         staa    (0x0013)
   9E5D 08            [ 3] 3632         inx
   9E5E 8C 02 9C      [ 4] 3633         cpx     #0x029C
   9E61 26 F4         [ 3] 3634         bne     L9E1A  
   9E63 91 A8         [ 3] 3635         cmpa    (0x00A8)
   9E65 26 47         [ 3] 3636         bne     L9E71  
   9E67 CE 04 02      [ 3] 3637         ldx     #0x0402
   9E6A B6 02 98      [ 4] 3638         ldaa    (0x0298)
   9E6D 81 02         [ 2] 3639         cmpa    #0x02
   9E6F 26 03         [ 3] 3640         bne     L9E37  
   9E71 CE 04 05      [ 3] 3641         ldx     #0x0405
   9E74                    3642 L9E37:
   9E74 3C            [ 4] 3643         pshx
   9E75 BD AB 93      [ 6] 3644         jsr     LAB56
   9E78 38            [ 5] 3645         pulx
   9E79 25 07         [ 3] 3646         bcs     L9E45  
   9E7B 86 03         [ 2] 3647         ldaa    #0x03
   9E7D B7 02 98      [ 4] 3648         staa    (0x0298)
   9E80 20 23         [ 3] 3649         bra     L9E68  
   9E82                    3650 L9E45:
   9E82 B6 02 99      [ 4] 3651         ldaa    (0x0299)
   9E85 A1 00         [ 4] 3652         cmpa    0,X     
   9E87 25 1E         [ 3] 3653         bcs     L9E6A  
   9E89 27 02         [ 3] 3654         beq     L9E50  
   9E8B 24 18         [ 3] 3655         bcc     L9E68  
   9E8D                    3656 L9E50:
   9E8D 08            [ 3] 3657         inx
   9E8E B6 02 9A      [ 4] 3658         ldaa    (0x029A)
   9E91 A1 00         [ 4] 3659         cmpa    0,X     
   9E93 25 12         [ 3] 3660         bcs     L9E6A  
   9E95 27 02         [ 3] 3661         beq     L9E5C  
   9E97 24 0C         [ 3] 3662         bcc     L9E68  
   9E99                    3663 L9E5C:
   9E99 08            [ 3] 3664         inx
   9E9A B6 02 9B      [ 4] 3665         ldaa    (0x029B)
   9E9D A1 00         [ 4] 3666         cmpa    0,X     
   9E9F 25 06         [ 3] 3667         bcs     L9E6A  
   9EA1 27 02         [ 3] 3668         beq     L9E68  
   9EA3 24 00         [ 3] 3669         bcc     L9E68  
   9EA5                    3670 L9E68:
   9EA5 0C            [ 2] 3671         clc
   9EA6 39            [ 5] 3672         rts
                           3673 
   9EA7                    3674 L9E6A:
   9EA7 B6 02 98      [ 4] 3675         ldaa    (0x0298)
   9EAA 81 03         [ 2] 3676         cmpa    #0x03
   9EAC 27 F7         [ 3] 3677         beq     L9E68  
   9EAE                    3678 L9E71:
   9EAE 0D            [ 2] 3679         sec
   9EAF 39            [ 5] 3680         rts
                           3681 
   9EB0                    3682 L9E73:
   9EB0 CE 04 02      [ 3] 3683         ldx     #0x0402
   9EB3 B6 02 98      [ 4] 3684         ldaa    (0x0298)
   9EB6 81 02         [ 2] 3685         cmpa    #0x02
   9EB8 26 03         [ 3] 3686         bne     L9E80  
   9EBA CE 04 05      [ 3] 3687         ldx     #0x0405
   9EBD                    3688 L9E80:
   9EBD B6 02 99      [ 4] 3689         ldaa    (0x0299)
   9EC0 A7 00         [ 4] 3690         staa    0,X     
   9EC2 08            [ 3] 3691         inx
   9EC3 B6 02 9A      [ 4] 3692         ldaa    (0x029A)
   9EC6 A7 00         [ 4] 3693         staa    0,X     
   9EC8 08            [ 3] 3694         inx
   9EC9 B6 02 9B      [ 4] 3695         ldaa    (0x029B)
   9ECC A7 00         [ 4] 3696         staa    0,X     
   9ECE 39            [ 5] 3697         rts
                           3698 
                           3699 ; reset R counts
   9ECF                    3700 L9E92:
   9ECF 86 30         [ 2] 3701         ldaa    #0x30        
   9ED1 B7 04 02      [ 4] 3702         staa    (0x0402)
   9ED4 B7 04 03      [ 4] 3703         staa    (0x0403)
   9ED7 B7 04 04      [ 4] 3704         staa    (0x0404)
                           3705 
   9EDA BD 8D ED      [ 6] 3706         jsr     LCDMSG2 
   9EDD 52 65 67 20 23 20  3707         .ascis  'Reg # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3708 
   9EEB 39            [ 5] 3709         rts
                           3710 
                           3711 ; reset L counts
   9EEC                    3712 L9EAF:
   9EEC 86 30         [ 2] 3713         ldaa    #0x30
   9EEE B7 04 05      [ 4] 3714         staa    (0x0405)
   9EF1 B7 04 06      [ 4] 3715         staa    (0x0406)
   9EF4 B7 04 07      [ 4] 3716         staa    (0x0407)
                           3717 
   9EF7 BD 8D ED      [ 6] 3718         jsr     LCDMSG2 
   9EFA 4C 69 76 20 23 20  3719         .ascis  'Liv # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3720 
   9F08 39            [ 5] 3721         rts
                           3722 
                           3723 ; display R and L counts?
   9F09                    3724 L9ECC:
   9F09 86 52         [ 2] 3725         ldaa    #0x52           ;'R'
   9F0B C6 2B         [ 2] 3726         ldab    #0x2B
   9F0D BD 8D C5      [ 6] 3727         jsr     L8DB5           ; display char here on LCD display
   9F10 86 4C         [ 2] 3728         ldaa    #0x4C           ;'L'
   9F12 C6 32         [ 2] 3729         ldab    #0x32
   9F14 BD 8D C5      [ 6] 3730         jsr     L8DB5           ; display char here on LCD display
   9F17 CE 04 02      [ 3] 3731         ldx     #0x0402
   9F1A C6 2C         [ 2] 3732         ldab    #0x2C
   9F1C                    3733 L9EDF:
   9F1C A6 00         [ 4] 3734         ldaa    0,X     
   9F1E BD 8D C5      [ 6] 3735         jsr     L8DB5           ; display 3 chars here on LCD display
   9F21 5C            [ 2] 3736         incb
   9F22 08            [ 3] 3737         inx
   9F23 8C 04 05      [ 4] 3738         cpx     #0x0405
   9F26 26 F4         [ 3] 3739         bne     L9EDF  
   9F28 C6 33         [ 2] 3740         ldab    #0x33
   9F2A                    3741 L9EED:
   9F2A A6 00         [ 4] 3742         ldaa    0,X     
   9F2C BD 8D C5      [ 6] 3743         jsr     L8DB5           ; display 3 chars here on LCD display
   9F2F 5C            [ 2] 3744         incb
   9F30 08            [ 3] 3745         inx
   9F31 8C 04 08      [ 4] 3746         cpx     #0x0408
   9F34 26 F4         [ 3] 3747         bne     L9EED  
   9F36 39            [ 5] 3748         rts
                           3749 
   9F37                    3750 L9EFA:
   9F37 96 A8         [ 3] 3751         ldaa    (0x00A8)
   9F39 BD 9F 4C      [ 6] 3752         jsr     L9F0F
   9F3C 48            [ 2] 3753         asla
   9F3D 48            [ 2] 3754         asla
   9F3E 48            [ 2] 3755         asla
   9F3F 48            [ 2] 3756         asla
   9F40 97 13         [ 3] 3757         staa    (0x0013)
   9F42 96 A9         [ 3] 3758         ldaa    (0x00A9)
   9F44 BD 9F 4C      [ 6] 3759         jsr     L9F0F
   9F47 9B 13         [ 3] 3760         adda    (0x0013)
   9F49 97 A8         [ 3] 3761         staa    (0x00A8)
   9F4B 39            [ 5] 3762         rts
                           3763 
   9F4C                    3764 L9F0F:
   9F4C 81 2F         [ 2] 3765         cmpa    #0x2F
   9F4E 24 02         [ 3] 3766         bcc     L9F15  
   9F50 86 30         [ 2] 3767         ldaa    #0x30
   9F52                    3768 L9F15:
   9F52 81 3A         [ 2] 3769         cmpa    #0x3A
   9F54 25 02         [ 3] 3770         bcs     L9F1B  
   9F56 80 07         [ 2] 3771         suba    #0x07
   9F58                    3772 L9F1B:
   9F58 80 30         [ 2] 3773         suba    #0x30
   9F5A 39            [ 5] 3774         rts
                           3775 
                           3776 ; different behavior based on serial number
   9F5B                    3777 L9F1E:
   9F5B FC 02 9C      [ 5] 3778         ldd     (0x029C)
   9F5E 1A 83 00 01   [ 5] 3779         cpd     #0x0001         ; if 1, password bypass
   9F62 27 0C         [ 3] 3780         beq     L9F33           ;
   9F64 1A 83 03 E8   [ 5] 3781         cpd     #0x03E8         ; 1000
   9F68 25 20         [ 3] 3782         bcs     L9F4D           ; if > 1000, code
   9F6A 1A 83 04 4B   [ 5] 3783         cpd     #0x044B         ; 1099
   9F6E 22 1A         [ 3] 3784         bhi     L9F4D           ; if < 1099, code
                           3785                                 ; else 1 < x < 1000, bypass
                           3786 
   9F70                    3787 L9F33:
   9F70 BD 8D F4      [ 6] 3788         jsr     LCDMSG1 
   9F73 50 61 73 73 77 6F  3789         .ascis  'Password bypass '
        72 64 20 62 79 70
        61 73 73 A0
                           3790 
   9F83 C6 04         [ 2] 3791         ldab    #0x04
   9F85 BD 8C 40      [ 6] 3792         jsr     DLYSECSBY2      ; delay 2 sec
   9F88 0C            [ 2] 3793         clc
   9F89 39            [ 5] 3794         rts
                           3795 
   9F8A                    3796 L9F4D:
   9F8A BD 8D 02      [ 6] 3797         jsr     L8CF2
   9F8D BD 8D 13      [ 6] 3798         jsr     L8D03
                           3799 
   9F90 BD 8D F4      [ 6] 3800         jsr     LCDMSG1 
   9F93 43 6F 64 65 BA     3801         .ascis  'Code:'
                           3802 
                           3803 ; Generate a random 5-digit code in 0x0290-0x0294, and display to user
                           3804 
   9F98 CE 02 90      [ 3] 3805         ldx     #0x0290
   9F9B 7F 00 16      [ 6] 3806         clr     (0x0016)        ; 0x00
   9F9E                    3807 L9F61:
   9F9E 86 41         [ 2] 3808         ldaa    #0x41           ; 'A'
   9FA0                    3809 L9F63:
   9FA0 97 15         [ 3] 3810         staa    (0x0015)        ; 0x41
   9FA2 BD 8E A5      [ 6] 3811         jsr     L8E95           ; read SCD keys
   9FA5 81 0D         [ 2] 3812         cmpa    #0x0D
   9FA7 26 11         [ 3] 3813         bne     L9F7D
   9FA9 96 15         [ 3] 3814         ldaa    (0x0015)
   9FAB A7 00         [ 4] 3815         staa    0,X     
   9FAD 08            [ 3] 3816         inx
   9FAE BD 8C A8      [ 6] 3817         jsr     L8C98
   9FB1 96 16         [ 3] 3818         ldaa    (0x0016)
   9FB3 4C            [ 2] 3819         inca
   9FB4 97 16         [ 3] 3820         staa    (0x0016)
   9FB6 81 05         [ 2] 3821         cmpa    #0x05
   9FB8 27 09         [ 3] 3822         beq     L9F86  
   9FBA                    3823 L9F7D:
   9FBA 96 15         [ 3] 3824         ldaa    (0x0015)
   9FBC 4C            [ 2] 3825         inca
   9FBD 81 5B         [ 2] 3826         cmpa    #0x5B           ; '['
   9FBF 27 DD         [ 3] 3827         beq     L9F61  
   9FC1 20 DD         [ 3] 3828         bra     L9F63  
                           3829 
                           3830 ; Let the user type in a corresponding password to the code
   9FC3                    3831 L9F86:
   9FC3 BD 8D ED      [ 6] 3832         jsr     LCDMSG2 
   9FC6 50 73 77 64 BA     3833         .ascis  'Pswd:'
                           3834 
   9FCB CE 02 88      [ 3] 3835         ldx     #0x0288
   9FCE 86 41         [ 2] 3836         ldaa    #0x41           ; 'A'
   9FD0 97 16         [ 3] 3837         staa    (0x0016)
   9FD2 86 C5         [ 2] 3838         ldaa    #0xC5           ; 
   9FD4 97 15         [ 3] 3839         staa    (0x0015)
   9FD6                    3840 L9F99:
   9FD6 96 15         [ 3] 3841         ldaa    (0x0015)
   9FD8 BD 8C 96      [ 6] 3842         jsr     L8C86           ; write byte to LCD
   9FDB 96 16         [ 3] 3843         ldaa    (0x0016)
   9FDD BD 8C A8      [ 6] 3844         jsr     L8C98
   9FE0                    3845 L9FA3:
   9FE0 BD 8E A5      [ 6] 3846         jsr     L8E95
   9FE3 27 FB         [ 3] 3847         beq     L9FA3  
   9FE5 81 0D         [ 2] 3848         cmpa    #0x0D
   9FE7 26 10         [ 3] 3849         bne     L9FBC  
   9FE9 96 16         [ 3] 3850         ldaa    (0x0016)
   9FEB A7 00         [ 4] 3851         staa    0,X     
   9FED 08            [ 3] 3852         inx
   9FEE 96 15         [ 3] 3853         ldaa    (0x0015)
   9FF0 4C            [ 2] 3854         inca
   9FF1 97 15         [ 3] 3855         staa    (0x0015)
   9FF3 81 CA         [ 2] 3856         cmpa    #0xCA
   9FF5 27 28         [ 3] 3857         beq     L9FE2  
   9FF7 20 DD         [ 3] 3858         bra     L9F99  
   9FF9                    3859 L9FBC:
   9FF9 81 01         [ 2] 3860         cmpa    #0x01
   9FFB 26 0F         [ 3] 3861         bne     L9FCF  
   9FFD 96 16         [ 3] 3862         ldaa    (0x0016)
   9FFF 4C            [ 2] 3863         inca
   A000 97 16         [ 3] 3864         staa    (0x0016)
   A002 81 5B         [ 2] 3865         cmpa    #0x5B
   A004 26 D0         [ 3] 3866         bne     L9F99  
   A006 86 41         [ 2] 3867         ldaa    #0x41
   A008 97 16         [ 3] 3868         staa    (0x0016)
   A00A 20 CA         [ 3] 3869         bra     L9F99  
   A00C                    3870 L9FCF:
   A00C 81 02         [ 2] 3871         cmpa    #0x02
   A00E 26 D0         [ 3] 3872         bne     L9FA3  
   A010 96 16         [ 3] 3873         ldaa    (0x0016)
   A012 4A            [ 2] 3874         deca
   A013 97 16         [ 3] 3875         staa    (0x0016)
   A015 81 40         [ 2] 3876         cmpa    #0x40
   A017 26 BD         [ 3] 3877         bne     L9F99  
   A019 86 5A         [ 2] 3878         ldaa    #0x5A
   A01B 97 16         [ 3] 3879         staa    (0x0016)
   A01D 20 B7         [ 3] 3880         bra     L9F99  
   A01F                    3881 L9FE2:
   A01F BD A0 3E      [ 6] 3882         jsr     LA001           ; validate
   A022 25 0F         [ 3] 3883         bcs     L9FF6           ; if bad, jump
   A024 86 DB         [ 2] 3884         ldaa    #0xDB
   A026 97 AB         [ 3] 3885         staa    (0x00AB)        ; good password
   A028 FC 04 16      [ 5] 3886         ldd     (0x0416)        ; increment number of good validations counter
   A02B C3 00 01      [ 4] 3887         addd    #0x0001
   A02E FD 04 16      [ 5] 3888         std     (0x0416)
   A031 0C            [ 2] 3889         clc
   A032 39            [ 5] 3890         rts
                           3891 
   A033                    3892 L9FF6:
   A033 FC 04 14      [ 5] 3893         ldd     (0x0414)        ; increment number of bad validations counter
   A036 C3 00 01      [ 4] 3894         addd    #0x0001
   A039 FD 04 14      [ 5] 3895         std     (0x0414)
   A03C 0D            [ 2] 3896         sec
   A03D 39            [ 5] 3897         rts
                           3898 
                           3899 ; Validate password?
   A03E                    3900 LA001:
                           3901         ; scramble 5 letters
   A03E B6 02 90      [ 4] 3902         ldaa    (0x0290)        ; 0 -> 1
   A041 B7 02 81      [ 4] 3903         staa    (0x0281)
   A044 B6 02 91      [ 4] 3904         ldaa    (0x0291)        ; 1 -> 3
   A047 B7 02 83      [ 4] 3905         staa    (0x0283)
   A04A B6 02 92      [ 4] 3906         ldaa    (0x0292)        ; 2 -> 4
   A04D B7 02 84      [ 4] 3907         staa    (0x0284)
   A050 B6 02 93      [ 4] 3908         ldaa    (0x0293)        ; 3 -> 0
   A053 B7 02 80      [ 4] 3909         staa    (0x0280)
   A056 B6 02 94      [ 4] 3910         ldaa    (0x0294)        ; 4 -> 2
   A059 B7 02 82      [ 4] 3911         staa    (0x0282)
                           3912         ; transform each letter
   A05C B6 02 80      [ 4] 3913         ldaa    (0x0280)    
   A05F 88 13         [ 2] 3914         eora    #0x13
   A061 8B 03         [ 2] 3915         adda    #0x03
   A063 B7 02 80      [ 4] 3916         staa    (0x0280)
   A066 B6 02 81      [ 4] 3917         ldaa    (0x0281)
   A069 88 04         [ 2] 3918         eora    #0x04
   A06B 8B 12         [ 2] 3919         adda    #0x12
   A06D B7 02 81      [ 4] 3920         staa    (0x0281)
   A070 B6 02 82      [ 4] 3921         ldaa    (0x0282)
   A073 88 06         [ 2] 3922         eora    #0x06
   A075 8B 04         [ 2] 3923         adda    #0x04
   A077 B7 02 82      [ 4] 3924         staa    (0x0282)
   A07A B6 02 83      [ 4] 3925         ldaa    (0x0283)
   A07D 88 11         [ 2] 3926         eora    #0x11
   A07F 8B 07         [ 2] 3927         adda    #0x07
   A081 B7 02 83      [ 4] 3928         staa    (0x0283)
   A084 B6 02 84      [ 4] 3929         ldaa    (0x0284)
   A087 88 01         [ 2] 3930         eora    #0x01
   A089 8B 10         [ 2] 3931         adda    #0x10
   A08B B7 02 84      [ 4] 3932         staa    (0x0284)
                           3933         ; keep them modulo 26 (A-Z)
   A08E BD A0 EC      [ 6] 3934         jsr     LA0AF
                           3935         ; put some of the original bits into 0x0015/0x0016
   A091 B6 02 94      [ 4] 3936         ldaa    (0x0294)
   A094 84 17         [ 2] 3937         anda    #0x17
   A096 97 15         [ 3] 3938         staa    (0x0015)
   A098 B6 02 90      [ 4] 3939         ldaa    (0x0290)
   A09B 84 17         [ 2] 3940         anda    #0x17
   A09D 97 16         [ 3] 3941         staa    (0x0016)
                           3942         ; do some eoring with these bits
   A09F CE 02 80      [ 3] 3943         ldx     #0x0280
   A0A2                    3944 LA065:
   A0A2 A6 00         [ 4] 3945         ldaa    0,X
   A0A4 98 15         [ 3] 3946         eora    (0x0015)
   A0A6 98 16         [ 3] 3947         eora    (0x0016)
   A0A8 A7 00         [ 4] 3948         staa    0,X
   A0AA 08            [ 3] 3949         inx
   A0AB 8C 02 85      [ 4] 3950         cpx     #0x0285
   A0AE 26 F2         [ 3] 3951         bne     LA065
                           3952         ; keep them modulo 26 (A-Z)
   A0B0 BD A0 EC      [ 6] 3953         jsr     LA0AF
                           3954         ; compare them to code in 0x0288-0x028C
   A0B3 CE 02 80      [ 3] 3955         ldx     #0x0280
   A0B6 18 CE 02 88   [ 4] 3956         ldy     #0x0288
   A0BA                    3957 LA07D:
   A0BA A6 00         [ 4] 3958         ldaa    0,X     
   A0BC 18 A1 00      [ 5] 3959         cmpa    0,Y     
   A0BF 26 0A         [ 3] 3960         bne     LA08E  
   A0C1 08            [ 3] 3961         inx
   A0C2 18 08         [ 4] 3962         iny
   A0C4 8C 02 85      [ 4] 3963         cpx     #0x0285
   A0C7 26 F1         [ 3] 3964         bne     LA07D  
   A0C9 0C            [ 2] 3965         clc                     ; carry clear if good
   A0CA 39            [ 5] 3966         rts
                           3967 
   A0CB                    3968 LA08E:
   A0CB 0D            [ 2] 3969         sec                     ; carry set if bad
   A0CC 39            [ 5] 3970         rts
                           3971 
                           3972 ; trivial password validation - not used??
   A0CD                    3973 LA090:
   A0CD 59 41 44 44 41     3974         .ascii  'YADDA'
                           3975 
   A0D2 CE 02 88      [ 3] 3976         ldx     #0x0288
   A0D5 18 CE A0 CD   [ 4] 3977         ldy     #LA090
   A0D9                    3978 LA09C:
   A0D9 A6 00         [ 4] 3979         ldaa    0,X
   A0DB 18 A1 00      [ 5] 3980         cmpa    0,Y
   A0DE 26 0A         [ 3] 3981         bne     LA0AD
   A0E0 08            [ 3] 3982         inx
   A0E1 18 08         [ 4] 3983         iny
   A0E3 8C 02 8D      [ 4] 3984         cpx     #0x028D
   A0E6 26 F1         [ 3] 3985         bne     LA09C
   A0E8 0C            [ 2] 3986         clc
   A0E9 39            [ 5] 3987         rts
   A0EA                    3988 LA0AD:
   A0EA 0D            [ 2] 3989         sec
   A0EB 39            [ 5] 3990         rts
                           3991 
                           3992 ; keep the password modulo 26, each letter in range 'A-Z'
   A0EC                    3993 LA0AF:
   A0EC CE 02 80      [ 3] 3994         ldx     #0x0280
   A0EF                    3995 LA0B2:
   A0EF A6 00         [ 4] 3996         ldaa    0,X
   A0F1 81 5B         [ 2] 3997         cmpa    #0x5B
   A0F3 25 06         [ 3] 3998         bcs     LA0BE
   A0F5 80 1A         [ 2] 3999         suba    #0x1A
   A0F7 A7 00         [ 4] 4000         staa    0,X
   A0F9 20 08         [ 3] 4001         bra     LA0C6
   A0FB                    4002 LA0BE:
   A0FB 81 41         [ 2] 4003         cmpa    #0x41
   A0FD 24 04         [ 3] 4004         bcc     LA0C6
   A0FF 8B 1A         [ 2] 4005         adda    #0x1A
   A101 A7 00         [ 4] 4006         staa    0,X
   A103                    4007 LA0C6:
   A103 08            [ 3] 4008         inx
   A104 8C 02 85      [ 4] 4009         cpx     #0x0285
   A107 26 E6         [ 3] 4010         bne     LA0B2  
   A109 39            [ 5] 4011         rts
                           4012 
   A10A BD 8D 02      [ 6] 4013         jsr     L8CF2
                           4014 
   A10D BD 8D ED      [ 6] 4015         jsr     LCDMSG2 
   A110 46 61 69 6C 65 64  4016         .ascis  'Failed!         '
        21 20 20 20 20 20
        20 20 20 A0
                           4017 
   A120 C6 02         [ 2] 4018         ldab    #0x02
   A122 BD 8C 40      [ 6] 4019         jsr     DLYSECSBY2      ; delay 1 sec
   A125 39            [ 5] 4020         rts
                           4021 
   A126                    4022 LA0E9:
   A126 C6 01         [ 2] 4023         ldab    #0x01
   A128 BD 8C 40      [ 6] 4024         jsr     DLYSECSBY2      ; delay 0.5 sec
   A12B 7F 00 4E      [ 6] 4025         clr     (0x004E)
   A12E C6 D3         [ 2] 4026         ldab    #0xD3
   A130 BD 87 58      [ 6] 4027         jsr     L8748   
   A133 BD 87 BE      [ 6] 4028         jsr     L87AE
   A136 BD 8C F9      [ 6] 4029         jsr     L8CE9
                           4030 
   A139 BD 8D F4      [ 6] 4031         jsr     LCDMSG1 
   A13C 20 20 20 56 43 52  4032         .ascis  '   VCR adjust'
        20 61 64 6A 75 73
        F4
                           4033 
   A149 BD 8D ED      [ 6] 4034         jsr     LCDMSG2 
   A14C 55 50 20 74 6F 20  4035         .ascis  'UP to clear bits'
        63 6C 65 61 72 20
        62 69 74 F3
                           4036 
   A15C 5F            [ 2] 4037         clrb
   A15D D7 62         [ 3] 4038         stab    (0x0062)
   A15F BD FA F9      [ 6] 4039         jsr     BUTNLIT 
   A162 B6 18 04      [ 4] 4040         ldaa    PIA0PRA 
   A165 84 BF         [ 2] 4041         anda    #0xBF
   A167 B7 18 04      [ 4] 4042         staa    PIA0PRA 
   A16A BD 8E A5      [ 6] 4043         jsr     L8E95
   A16D 7F 00 48      [ 6] 4044         clr     (0x0048)
   A170 7F 00 49      [ 6] 4045         clr     (0x0049)
   A173 BD 86 D4      [ 6] 4046         jsr     L86C4           ; Reset boards 1-10
   A176 86 28         [ 2] 4047         ldaa    #0x28
   A178 97 63         [ 3] 4048         staa    (0x0063)
   A17A C6 FD         [ 2] 4049         ldab    #0xFD           ; tape deck STOP
   A17C BD 86 F7      [ 6] 4050         jsr     L86E7
   A17F BD A3 6B      [ 6] 4051         jsr     LA32E
   A182 7C 00 76      [ 6] 4052         inc     (0x0076)
   A185 7F 00 32      [ 6] 4053         clr     (0x0032)
   A188                    4054 LA14B:
   A188 BD 8E A5      [ 6] 4055         jsr     L8E95
   A18B 81 0D         [ 2] 4056         cmpa    #0x0D
   A18D 26 03         [ 3] 4057         bne     LA155  
   A18F 7E A2 01      [ 3] 4058         jmp     LA1C4
   A192                    4059 LA155:
   A192 86 28         [ 2] 4060         ldaa    #0x28
   A194 97 63         [ 3] 4061         staa    (0x0063)
   A196 BD 86 B2      [ 6] 4062         jsr     L86A4
   A199 25 ED         [ 3] 4063         bcs     LA14B  
   A19B FC 04 1A      [ 5] 4064         ldd     (0x041A)
   A19E C3 00 01      [ 4] 4065         addd    #0x0001
   A1A1 FD 04 1A      [ 5] 4066         std     (0x041A)
   A1A4 BD 86 D4      [ 6] 4067         jsr     L86C4           ; Reset boards 1-10
   A1A7 7C 00 4E      [ 6] 4068         inc     (0x004E)
   A1AA C6 D3         [ 2] 4069         ldab    #0xD3
   A1AC BD 87 58      [ 6] 4070         jsr     L8748   
   A1AF BD 87 BE      [ 6] 4071         jsr     L87AE
   A1B2                    4072 LA175:
   A1B2 96 49         [ 3] 4073         ldaa    (0x0049)
   A1B4 81 43         [ 2] 4074         cmpa    #0x43
   A1B6 26 06         [ 3] 4075         bne     LA181  
   A1B8 7F 00 49      [ 6] 4076         clr     (0x0049)
   A1BB 7F 00 48      [ 6] 4077         clr     (0x0048)
   A1BE                    4078 LA181:
   A1BE 96 48         [ 3] 4079         ldaa    (0x0048)
   A1C0 81 C8         [ 2] 4080         cmpa    #0xC8
   A1C2 25 1F         [ 3] 4081         bcs     LA1A6  
   A1C4 FC 02 9C      [ 5] 4082         ldd     (0x029C)
   A1C7 1A 83 00 01   [ 5] 4083         cpd     #0x0001
   A1CB 27 16         [ 3] 4084         beq     LA1A6  
   A1CD C6 EF         [ 2] 4085         ldab    #0xEF           ; tape deck EJECT
   A1CF BD 86 F7      [ 6] 4086         jsr     L86E7
   A1D2 BD 86 D4      [ 6] 4087         jsr     L86C4           ; Reset boards 1-10
   A1D5 7F 00 4E      [ 6] 4088         clr     (0x004E)
   A1D8 7F 00 76      [ 6] 4089         clr     (0x0076)
   A1DB C6 0A         [ 2] 4090         ldab    #0x0A
   A1DD BD 8C 40      [ 6] 4091         jsr     DLYSECSBY2      ; delay 5 sec
   A1E0 7E 81 D4      [ 3] 4092         jmp     L81D7
   A1E3                    4093 LA1A6:
   A1E3 BD 8E A5      [ 6] 4094         jsr     L8E95
   A1E6 81 01         [ 2] 4095         cmpa    #0x01
   A1E8 26 10         [ 3] 4096         bne     LA1BD  
   A1EA CE 10 80      [ 3] 4097         ldx     #0x1080
   A1ED 86 34         [ 2] 4098         ldaa    #0x34
   A1EF                    4099 LA1B2:
   A1EF 6F 00         [ 6] 4100         clr     0,X     
   A1F1 A7 01         [ 4] 4101         staa    1,X     
   A1F3 08            [ 3] 4102         inx
   A1F4 08            [ 3] 4103         inx
   A1F5 8C 10 A0      [ 4] 4104         cpx     #0x10A0
   A1F8 25 F5         [ 3] 4105         bcs     LA1B2  
   A1FA                    4106 LA1BD:
   A1FA 81 0D         [ 2] 4107         cmpa    #0x0D
   A1FC 27 03         [ 3] 4108         beq     LA1C4  
   A1FE 7E A1 B2      [ 3] 4109         jmp     LA175
   A201                    4110 LA1C4:
   A201 7F 00 76      [ 6] 4111         clr     (0x0076)
   A204 7F 00 4E      [ 6] 4112         clr     (0x004E)
   A207 C6 DF         [ 2] 4113         ldab    #0xDF
   A209 BD 87 58      [ 6] 4114         jsr     L8748   
   A20C BD 87 A1      [ 6] 4115         jsr     L8791   
   A20F 7E 81 D4      [ 3] 4116         jmp     L81D7
                           4117 
                           4118 ; reprogram EEPROM signature if needed
   A212                    4119 LA1D5:
   A212 86 08         [ 2] 4120         ldaa    #0x08
   A214 B7 04 00      [ 4] 4121         staa    (0x0400)
   A217 CC 0E 09      [ 3] 4122         ldd     #0x0E09
   A21A 81 65         [ 2] 4123         cmpa    #0x65           ;'e'
   A21C 26 05         [ 3] 4124         bne     LA1E6
   A21E C1 63         [ 2] 4125         cmpb    #0x63           ;'c'
   A220 26 01         [ 3] 4126         bne     LA1E6
   A222 39            [ 5] 4127         rts
                           4128 
                           4129 ; erase and reprogram EEPROM signature
   A223                    4130 LA1E6:
   A223 86 0E         [ 2] 4131         ldaa    #0x0E
   A225 B7 10 3B      [ 4] 4132         staa    PPROG
   A228 86 FF         [ 2] 4133         ldaa    #0xFF
   A22A B7 0E 00      [ 4] 4134         staa    (0x0E00)
   A22D B6 10 3B      [ 4] 4135         ldaa    PPROG  
   A230 8A 01         [ 2] 4136         oraa    #0x01
   A232 B7 10 3B      [ 4] 4137         staa    PPROG  
   A235 CE 1B 58      [ 3] 4138         ldx     #0x1B58         ; 7000
   A238                    4139 LA1FB:
   A238 09            [ 3] 4140         dex
   A239 26 FD         [ 3] 4141         bne     LA1FB  
   A23B B6 10 3B      [ 4] 4142         ldaa    PPROG  
   A23E 84 FE         [ 2] 4143         anda    #0xFE
   A240 B7 10 3B      [ 4] 4144         staa    PPROG  
   A243 CE 0E 00      [ 3] 4145         ldx     #0x0E00
   A246 18 CE A2 63   [ 4] 4146         ldy     #LA226
   A24A                    4147 LA20D:
   A24A C6 02         [ 2] 4148         ldab    #0x02
   A24C F7 10 3B      [ 4] 4149         stab    PPROG  
   A24F 18 A6 00      [ 5] 4150         ldaa    0,Y     
   A252 18 08         [ 4] 4151         iny
   A254 A7 00         [ 4] 4152         staa    0,X     
   A256 BD A2 6F      [ 6] 4153         jsr     LA232
   A259 08            [ 3] 4154         inx
   A25A 8C 0E 0C      [ 4] 4155         cpx     #0x0E0C
   A25D 26 EB         [ 3] 4156         bne     LA20D  
   A25F 7F 10 3B      [ 6] 4157         clr     PPROG  
   A262 39            [ 5] 4158         rts
                           4159 
                           4160 ; data for 0x0E00-0x0E0B EEPROM
   A263                    4161 LA226:
   A263 29 64 2A 21 32 3A  4162         .ascii  ')d*!2::4!ecq'
        3A 34 21 65 63 71
                           4163 
                           4164 ; program EEPROM
   A26F                    4165 LA232:
   A26F 18 3C         [ 5] 4166         pshy
   A271 C6 03         [ 2] 4167         ldab    #0x03
   A273 F7 10 3B      [ 4] 4168         stab    PPROG           ; start program
   A276 18 CE 1B 58   [ 4] 4169         ldy     #0x1B58
   A27A                    4170 LA23D:
   A27A 18 09         [ 4] 4171         dey
   A27C 26 FC         [ 3] 4172         bne     LA23D  
   A27E C6 02         [ 2] 4173         ldab    #0x02
   A280 F7 10 3B      [ 4] 4174         stab    PPROG           ; stop program
   A283 18 38         [ 6] 4175         puly
   A285 39            [ 5] 4176         rts
                           4177 
   A286                    4178 LA249:
   A286 0F            [ 2] 4179         sei
   A287 CE 00 10      [ 3] 4180         ldx     #0x0010
   A28A                    4181 LA24D:
   A28A 6F 00         [ 6] 4182         clr     0,X     
   A28C 08            [ 3] 4183         inx
   A28D 8C 0E 00      [ 4] 4184         cpx     #0x0E00
   A290 26 F8         [ 3] 4185         bne     LA24D  
   A292 BD 9E EC      [ 6] 4186         jsr     L9EAF           ; reset L counts
   A295 BD 9E CF      [ 6] 4187         jsr     L9E92           ; reset R counts
   A298 7E F8 00      [ 3] 4188         jmp     RESET           ; reset controller
                           4189 
                           4190 ; Compute and store copyright checksum
   A29B                    4191 LA25E:
   A29B 18 CE 80 03   [ 4] 4192         ldy     #CPYRTMSG       ; copyright message
   A29F CE 00 00      [ 3] 4193         ldx     #0x0000
   A2A2                    4194 LA265:
   A2A2 18 E6 00      [ 5] 4195         ldab    0,Y
   A2A5 3A            [ 3] 4196         abx
   A2A6 18 08         [ 4] 4197         iny
   A2A8 18 8C 80 50   [ 5] 4198         cpy     #0x8050
   A2AC 26 F4         [ 3] 4199         bne     LA265
   A2AE FF 04 0B      [ 5] 4200         stx     CPYRTCS         ; store checksum here
   A2B1 39            [ 5] 4201         rts
                           4202 
                           4203 ; Erase EEPROM routine
   A2B2                    4204 LA275:
   A2B2 0F            [ 2] 4205         sei
   A2B3 7F 04 0F      [ 6] 4206         clr     ERASEFLG        ; Reset EEPROM Erase flag
   A2B6 86 0E         [ 2] 4207         ldaa    #0x0E
   A2B8 B7 10 3B      [ 4] 4208         staa    PPROG           ; ERASE mode!
   A2BB 86 FF         [ 2] 4209         ldaa    #0xFF
   A2BD B7 0E 20      [ 4] 4210         staa    (0x0E20)        ; save in NVRAM
   A2C0 B6 10 3B      [ 4] 4211         ldaa    PPROG  
   A2C3 8A 01         [ 2] 4212         oraa    #0x01
   A2C5 B7 10 3B      [ 4] 4213         staa    PPROG           ; do the ERASE
   A2C8 CE 1B 58      [ 3] 4214         ldx     #0x1B58         ; delay a bit
   A2CB                    4215 LA28E:
   A2CB 09            [ 3] 4216         dex
   A2CC 26 FD         [ 3] 4217         bne     LA28E  
   A2CE B6 10 3B      [ 4] 4218         ldaa    PPROG  
   A2D1 84 FE         [ 2] 4219         anda    #0xFE           ; stop erasing
   A2D3 7F 10 3B      [ 6] 4220         clr     PPROG  
                           4221 
   A2D6 BD FB 0C      [ 6] 4222         jsr     SERMSGW         ; display "enter serial number"
   A2D9 45 6E 74 65 72 20  4223         .ascis  'Enter serial #: '
        73 65 72 69 61 6C
        20 23 3A A0
                           4224 
   A2E9 CE 0E 20      [ 3] 4225         ldx     #0x0E20
   A2EC                    4226 LA2AF:
   A2EC BD FA 79      [ 6] 4227         jsr     SERIALR         ; wait for serial data
   A2EF 24 FB         [ 3] 4228         bcc     LA2AF  
                           4229 
   A2F1 BD FA A3      [ 6] 4230         jsr     SERIALW         ; read serial data
   A2F4 C6 02         [ 2] 4231         ldab    #0x02
   A2F6 F7 10 3B      [ 4] 4232         stab    PPROG           ; protect only 0x0e20-0x0e5f
   A2F9 A7 00         [ 4] 4233         staa    0,X         
   A2FB BD A2 6F      [ 6] 4234         jsr     LA232           ; program byte
   A2FE 08            [ 3] 4235         inx
   A2FF 8C 0E 24      [ 4] 4236         cpx     #0x0E24
   A302 26 E8         [ 3] 4237         bne     LA2AF  
   A304 C6 02         [ 2] 4238         ldab    #0x02
   A306 F7 10 3B      [ 4] 4239         stab    PPROG  
   A309 86 DB         [ 2] 4240         ldaa    #0xDB           ; it's official
   A30B B7 0E 24      [ 4] 4241         staa    (0x0E24)
   A30E BD A2 6F      [ 6] 4242         jsr     LA232           ; program byte
   A311 7F 10 3B      [ 6] 4243         clr     PPROG  
   A314 86 1E         [ 2] 4244         ldaa    #0x1E
   A316 B7 10 35      [ 4] 4245         staa    BPROT           ; protect all but 0x0e00-0x0e1f
   A319 7E F8 00      [ 3] 4246         jmp     RESET           ; reset controller
                           4247 
   A31C                    4248 LA2DF:
   A31C 38            [ 5] 4249         pulx
   A31D 3C            [ 4] 4250         pshx
   A31E 8C 80 00      [ 4] 4251         cpx     #0x8000
   A321 25 02         [ 3] 4252         bcs     LA2E8           ; if 0x8000 < calling address (should be)
   A323 0C            [ 2] 4253         clc
   A324 39            [ 5] 4254         rts
                           4255 
   A325                    4256 LA2E8:
   A325 0D            [ 2] 4257         sec
   A326 39            [ 5] 4258         rts
                           4259 
                           4260 ; enter and validate security code via serial
   A327                    4261 LA2EA:
   A327 CE 02 88      [ 3] 4262         ldx     #0x0288
   A32A C6 03         [ 2] 4263         ldab    #0x03           ; 3 character code
                           4264 
   A32C                    4265 LA2EF:
   A32C BD FA 79      [ 6] 4266         jsr     SERIALR         ; check if available
   A32F 24 FB         [ 3] 4267         bcc     LA2EF  
   A331 A7 00         [ 4] 4268         staa    0,X     
   A333 08            [ 3] 4269         inx
   A334 5A            [ 2] 4270         decb
   A335 26 F5         [ 3] 4271         bne     LA2EF  
                           4272 
   A337 B6 02 88      [ 4] 4273         ldaa    (0x0288)
   A33A 81 13         [ 2] 4274         cmpa    #0x13           ; 0x13
   A33C 26 10         [ 3] 4275         bne     LA311  
   A33E B6 02 89      [ 4] 4276         ldaa    (0x0289)
   A341 81 10         [ 2] 4277         cmpa    #0x10           ; 0x10
   A343 26 09         [ 3] 4278         bne     LA311  
   A345 B6 02 8A      [ 4] 4279         ldaa    (0x028A)
   A348 81 14         [ 2] 4280         cmpa    #0x14           ; 0x14
   A34A 26 02         [ 3] 4281         bne     LA311  
   A34C 0C            [ 2] 4282         clc
   A34D 39            [ 5] 4283         rts
                           4284 
   A34E                    4285 LA311:
   A34E 0D            [ 2] 4286         sec
   A34F 39            [ 5] 4287         rts
                           4288 
   A350                    4289 LA313:
   A350 36            [ 3] 4290         psha
   A351 B6 10 92      [ 4] 4291         ldaa    (0x1092)
   A354 8A 01         [ 2] 4292         oraa    #0x01
   A356                    4293 LA319:
   A356 B7 10 92      [ 4] 4294         staa    (0x1092)
   A359 32            [ 4] 4295         pula
   A35A 39            [ 5] 4296         rts
                           4297 
   A35B                    4298 LA31E:
   A35B 36            [ 3] 4299         psha
   A35C B6 10 92      [ 4] 4300         ldaa    (0x1092)
   A35F 84 FE         [ 2] 4301         anda    #0xFE
   A361 20 F3         [ 3] 4302         bra     LA319
                           4303 
   A363                    4304 LA326:
   A363 96 4E         [ 3] 4305         ldaa    (0x004E)
   A365 97 19         [ 3] 4306         staa    (0x0019)
   A367 7F 00 4E      [ 6] 4307         clr     (0x004E)
   A36A 39            [ 5] 4308         rts
                           4309 
   A36B                    4310 LA32E:
   A36B B6 10 86      [ 4] 4311         ldaa    (0x1086)
   A36E 8A 15         [ 2] 4312         oraa    #0x15
   A370 B7 10 86      [ 4] 4313         staa    (0x1086)
   A373 C6 01         [ 2] 4314         ldab    #0x01
   A375 BD 8C 40      [ 6] 4315         jsr     DLYSECSBY2      ; delay 0.5 sec
   A378 84 EA         [ 2] 4316         anda    #0xEA
   A37A B7 10 86      [ 4] 4317         staa    (0x1086)
   A37D 39            [ 5] 4318         rts
                           4319 
   A37E                    4320 LA341:
   A37E B6 10 86      [ 4] 4321         ldaa    (0x1086)
   A381 8A 2A         [ 2] 4322         oraa    #0x2A           ; xx1x1x1x
   A383 B7 10 86      [ 4] 4323         staa    (0x1086)
   A386 C6 01         [ 2] 4324         ldab    #0x01
   A388 BD 8C 40      [ 6] 4325         jsr     DLYSECSBY2      ; delay 0.5 sec
   A38B 84 D5         [ 2] 4326         anda    #0xD5           ; xx0x0x0x
   A38D B7 10 86      [ 4] 4327         staa    (0x1086)
   A390 39            [ 5] 4328         rts
                           4329 
   A391                    4330 LA354:
   A391 F6 18 04      [ 4] 4331         ldab    PIA0PRA 
   A394 CA 08         [ 2] 4332         orab    #0x08
   A396 F7 18 04      [ 4] 4333         stab    PIA0PRA 
   A399 39            [ 5] 4334         rts
                           4335 
   A39A F6 18 04      [ 4] 4336         ldab    PIA0PRA 
   A39D C4 F7         [ 2] 4337         andb    #0xF7
   A39F F7 18 04      [ 4] 4338         stab    PIA0PRA 
   A3A2 39            [ 5] 4339         rts
                           4340 
                           4341 ;'$' command goes here?
   A3A3                    4342 LA366:
   A3A3 7F 00 4E      [ 6] 4343         clr     (0x004E)
   A3A6 BD 86 D4      [ 6] 4344         jsr     L86C4           ; Reset boards 1-10
   A3A9 7F 04 2A      [ 6] 4345         clr     (0x042A)
                           4346 
   A3AC BD FB 0C      [ 6] 4347         jsr     SERMSGW
   A3AF 45 6E 74 65 72 20  4348         .ascis  'Enter security code:' 
        73 65 63 75 72 69
        74 79 20 63 6F 64
        65 BA
                           4349 
   A3C3 BD A3 27      [ 6] 4350         jsr     LA2EA
   A3C6 24 03         [ 3] 4351         bcc     LA38E
   A3C8 7E 83 3A      [ 3] 4352         jmp     L8331
                           4353 
   A3CB                    4354 LA38E:
   A3CB BD FB 0C      [ 6] 4355         jsr     SERMSGW      
   A3CE 0C 0A 0D 44 61 76  4356         .ascii  "\f\n\rDave's Setup Utility\n\r"
        65 27 73 20 53 65
        74 75 70 20 55 74
        69 6C 69 74 79 0A
        0D
   A3E7 3C 4B 3E 69 6E 67  4357         .ascii  '<K>ing enable\n\r'
        20 65 6E 61 62 6C
        65 0A 0D
   A3F6 3C 43 3E 6C 65 61  4358         .ascii  '<C>lear random\n\r'
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A406 3C 35 3E 20 63 68  4359         .ascii  '<5> character random\n\r'
        61 72 61 63 74 65
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A41C 3C 4C 3E 69 76 65  4360         .ascii  '<L>ive tape number clear\n\r'
        20 74 61 70 65 20
        6E 75 6D 62 65 72
        20 63 6C 65 61 72
        0A 0D
   A436 3C 52 3E 65 67 75  4361         .ascii  '<R>egular tape number clear\n\r'
        6C 61 72 20 74 61
        70 65 20 6E 75 6D
        62 65 72 20 63 6C
        65 61 72 0A 0D
   A453 3C 54 3E 65 73 74  4362         .ascii  '<T>est driver boards\n\r'
        20 64 72 69 76 65
        72 20 62 6F 61 72
        64 73 0A 0D
   A469 3C 42 3E 75 62 20  4363         .ascii  '<B>ub test\n\r'
        74 65 73 74 0A 0D
   A475 3C 44 3E 65 63 6B  4364         .ascii  '<D>eck test (with tape inserted)\n\r'
        20 74 65 73 74 20
        28 77 69 74 68 20
        74 61 70 65 20 69
        6E 73 65 72 74 65
        64 29 0A 0D
   A497 3C 37 3E 35 25 20  4365         .ascii  '<7>5% adjustment\n\r'
        61 64 6A 75 73 74
        6D 65 6E 74 0A 0D
   A4A9 3C 53 3E 68 6F 77  4366         .ascii  '<S>how re-valid tapes\n\r'
        20 72 65 2D 76 61
        6C 69 64 20 74 61
        70 65 73 0A 0D
   A4C0 3C 4A 3E 75 6D 70  4367         .ascis  '<J>ump to system\n\r'
        20 74 6F 20 73 79
        73 74 65 6D 0A 8D
                           4368 
   A4D2                    4369 LA495:
   A4D2 BD FA 79      [ 6] 4370         jsr     SERIALR     
   A4D5 24 FB         [ 3] 4371         bcc     LA495  
   A4D7 81 43         [ 2] 4372         cmpa    #0x43           ;'C'
   A4D9 26 09         [ 3] 4373         bne     LA4A7  
   A4DB 7F 04 01      [ 6] 4374         clr     (0x0401)        ;clear random
   A4DE 7F 04 2B      [ 6] 4375         clr     (0x042B)
   A4E1 7E A5 51      [ 3] 4376         jmp     LA514
   A4E4                    4377 LA4A7:
   A4E4 81 35         [ 2] 4378         cmpa    #0x35           ;'5'
   A4E6 26 0D         [ 3] 4379         bne     LA4B8  
   A4E8 B6 04 01      [ 4] 4380         ldaa    (0x0401)        ;5 character random
   A4EB 84 7F         [ 2] 4381         anda    #0x7F
   A4ED 8A 7F         [ 2] 4382         oraa    #0x7F
   A4EF B7 04 01      [ 4] 4383         staa    (0x0401)
   A4F2 7E A5 51      [ 3] 4384         jmp     LA514
   A4F5                    4385 LA4B8:
   A4F5 81 4C         [ 2] 4386         cmpa    #0x4C           ;'L'
   A4F7 26 06         [ 3] 4387         bne     LA4C2
   A4F9 BD 9E EC      [ 6] 4388         jsr     L9EAF           ; reset Liv counts
   A4FC 7E A5 51      [ 3] 4389         jmp     LA514
   A4FF                    4390 LA4C2:
   A4FF 81 52         [ 2] 4391         cmpa    #0x52           ;'R'
   A501 26 06         [ 3] 4392         bne     LA4CC  
   A503 BD 9E CF      [ 6] 4393         jsr     L9E92           ; reset Reg counts
   A506 7E A5 51      [ 3] 4394         jmp     LA514
   A509                    4395 LA4CC:
   A509 81 54         [ 2] 4396         cmpa    #0x54           ;'T'
   A50B 26 06         [ 3] 4397         bne     LA4D6  
   A50D BD A5 A2      [ 6] 4398         jsr     LA565           ; test driver boards
   A510 7E A5 51      [ 3] 4399         jmp     LA514
   A513                    4400 LA4D6:
   A513 81 42         [ 2] 4401         cmpa    #0x42           ;'B'
   A515 26 06         [ 3] 4402         bne     LA4E0  
   A517 BD A5 63      [ 6] 4403         jsr     LA526           ; bulb test?
   A51A 7E A5 51      [ 3] 4404         jmp     LA514
   A51D                    4405 LA4E0:
   A51D 81 44         [ 2] 4406         cmpa    #0x44           ;'D'
   A51F 26 06         [ 3] 4407         bne     LA4EA  
   A521 BD A5 79      [ 6] 4408         jsr     LA53C           ; deck test
   A524 7E A5 51      [ 3] 4409         jmp     LA514
   A527                    4410 LA4EA:
   A527 81 37         [ 2] 4411         cmpa    #0x37           ;'7'
   A529 26 08         [ 3] 4412         bne     LA4F6  
   A52B C6 FB         [ 2] 4413         ldab    #0xFB           ; tape deck PLAY
   A52D BD 86 F7      [ 6] 4414         jsr     L86E7           ; 5% adjustment
   A530 7E A5 51      [ 3] 4415         jmp     LA514
   A533                    4416 LA4F6:
   A533 81 4A         [ 2] 4417         cmpa    #0x4A           ;'J'
   A535 26 03         [ 3] 4418         bne     LA4FD  
   A537 7E F8 00      [ 3] 4419         jmp     RESET           ; jump to system (reset)
   A53A                    4420 LA4FD:
   A53A 81 4B         [ 2] 4421         cmpa    #0x4B           ;'K'
   A53C 26 06         [ 3] 4422         bne     LA507  
   A53E 7C 04 2A      [ 6] 4423         inc     (0x042A)        ; King enable
   A541 7E A5 51      [ 3] 4424         jmp     LA514
   A544                    4425 LA507:
   A544 81 53         [ 2] 4426         cmpa    #0x53           ;'S'
   A546 26 06         [ 3] 4427         bne     LA511  
   A548 BD AB B9      [ 6] 4428         jsr     LAB7C           ; show re-valid tapes
   A54B 7E A5 51      [ 3] 4429         jmp     LA514
   A54E                    4430 LA511:
   A54E 7E A4 D2      [ 3] 4431         jmp     LA495
   A551                    4432 LA514:
   A551 86 07         [ 2] 4433         ldaa    #0x07
   A553 BD FA A3      [ 6] 4434         jsr     SERIALW      
   A556 C6 01         [ 2] 4435         ldab    #0x01
   A558 BD 8C 40      [ 6] 4436         jsr     DLYSECSBY2      ; delay 0.5 sec
   A55B 86 07         [ 2] 4437         ldaa    #0x07
   A55D BD FA A3      [ 6] 4438         jsr     SERIALW      
   A560 7E A3 CB      [ 3] 4439         jmp     LA38E
                           4440 
                           4441 ; bulb test
   A563                    4442 LA526:
   A563 5F            [ 2] 4443         clrb
   A564 BD FA F9      [ 6] 4444         jsr     BUTNLIT 
   A567                    4445 LA52A:
   A567 F6 10 0A      [ 4] 4446         ldab    PORTE
   A56A C8 FF         [ 2] 4447         eorb    #0xFF
   A56C BD FA F9      [ 6] 4448         jsr     BUTNLIT 
   A56F C1 80         [ 2] 4449         cmpb    #0x80
   A571 26 F4         [ 3] 4450         bne     LA52A  
   A573 C6 02         [ 2] 4451         ldab    #0x02
   A575 BD 8C 40      [ 6] 4452         jsr     DLYSECSBY2      ; delay 1 sec
   A578 39            [ 5] 4453         rts
                           4454 
                           4455 ; deck test
   A579                    4456 LA53C:
   A579 C6 FD         [ 2] 4457         ldab    #0xFD           ; tape deck STOP
   A57B BD 86 F7      [ 6] 4458         jsr     L86E7
   A57E C6 06         [ 2] 4459         ldab    #0x06
   A580 BD 8C 40      [ 6] 4460         jsr     DLYSECSBY2      ; delay 3 sec
   A583 C6 FB         [ 2] 4461         ldab    #0xFB           ; tape deck PLAY
   A585 BD 86 F7      [ 6] 4462         jsr     L86E7
   A588 C6 06         [ 2] 4463         ldab    #0x06
   A58A BD 8C 40      [ 6] 4464         jsr     DLYSECSBY2      ; delay 3 sec
   A58D C6 FD         [ 2] 4465         ldab    #0xFD           ; tape deck STOP
   A58F BD 86 F7      [ 6] 4466         jsr     L86E7
   A592 C6 F7         [ 2] 4467         ldab    #0xF7
   A594 BD 86 F7      [ 6] 4468         jsr     L86E7           ; tape deck REWIND
   A597 C6 06         [ 2] 4469         ldab    #0x06
   A599 BD 8C 40      [ 6] 4470         jsr     DLYSECSBY2      ; delay 3 sec
   A59C C6 EF         [ 2] 4471         ldab    #0xEF           ; tape deck EJECT
   A59E BD 86 F7      [ 6] 4472         jsr     L86E7
   A5A1 39            [ 5] 4473         rts
                           4474 
                           4475 ; test driver boards
   A5A2                    4476 LA565:
   A5A2 BD FA 79      [ 6] 4477         jsr     SERIALR     
   A5A5 24 08         [ 3] 4478         bcc     LA572  
   A5A7 81 1B         [ 2] 4479         cmpa    #0x1B
   A5A9 26 04         [ 3] 4480         bne     LA572  
   A5AB BD 86 D4      [ 6] 4481         jsr     L86C4           ; Reset boards 1-10
   A5AE 39            [ 5] 4482         rts
   A5AF                    4483 LA572:
   A5AF 86 08         [ 2] 4484         ldaa    #0x08
   A5B1 97 15         [ 3] 4485         staa    (0x0015)
   A5B3 BD 86 D4      [ 6] 4486         jsr     L86C4           ; Reset boards 1-10
   A5B6 86 01         [ 2] 4487         ldaa    #0x01
   A5B8                    4488 LA57B:
   A5B8 36            [ 3] 4489         psha
   A5B9 16            [ 2] 4490         tab
   A5BA BD FA F9      [ 6] 4491         jsr     BUTNLIT 
   A5BD B6 18 04      [ 4] 4492         ldaa    PIA0PRA 
   A5C0 88 08         [ 2] 4493         eora    #0x08
   A5C2 B7 18 04      [ 4] 4494         staa    PIA0PRA 
   A5C5 32            [ 4] 4495         pula
   A5C6 B7 10 80      [ 4] 4496         staa    (0x1080)
   A5C9 B7 10 84      [ 4] 4497         staa    (0x1084)
   A5CC B7 10 88      [ 4] 4498         staa    (0x1088)
   A5CF B7 10 8C      [ 4] 4499         staa    (0x108C)
   A5D2 B7 10 90      [ 4] 4500         staa    (0x1090)
   A5D5 B7 10 94      [ 4] 4501         staa    (0x1094)
   A5D8 B7 10 98      [ 4] 4502         staa    (0x1098)
   A5DB B7 10 9C      [ 4] 4503         staa    (0x109C)
   A5DE C6 14         [ 2] 4504         ldab    #0x14
   A5E0 BD A6 8F      [ 6] 4505         jsr     LA652
   A5E3 49            [ 2] 4506         rola
   A5E4 36            [ 3] 4507         psha
   A5E5 D6 15         [ 3] 4508         ldab    (0x0015)
   A5E7 5A            [ 2] 4509         decb
   A5E8 D7 15         [ 3] 4510         stab    (0x0015)
   A5EA BD FA C9      [ 6] 4511         jsr     DIAGDGT         ; write digit to the diag display
   A5ED 37            [ 3] 4512         pshb
   A5EE C6 27         [ 2] 4513         ldab    #0x27
   A5F0 96 15         [ 3] 4514         ldaa    (0x0015)
   A5F2 0C            [ 2] 4515         clc
   A5F3 89 30         [ 2] 4516         adca    #0x30
   A5F5 BD 8D C5      [ 6] 4517         jsr     L8DB5           ; display char here on LCD display
   A5F8 33            [ 4] 4518         pulb
   A5F9 32            [ 4] 4519         pula
   A5FA 5D            [ 2] 4520         tstb
   A5FB 26 BB         [ 3] 4521         bne     LA57B  
   A5FD 86 08         [ 2] 4522         ldaa    #0x08
   A5FF 97 15         [ 3] 4523         staa    (0x0015)
   A601 BD 86 D4      [ 6] 4524         jsr     L86C4           ; Reset boards 1-10
   A604 86 01         [ 2] 4525         ldaa    #0x01
   A606                    4526 LA5C9:
   A606 B7 10 82      [ 4] 4527         staa    (0x1082)
   A609 B7 10 86      [ 4] 4528         staa    (0x1086)
   A60C B7 10 8A      [ 4] 4529         staa    (0x108A)
   A60F B7 10 8E      [ 4] 4530         staa    (0x108E)
   A612 B7 10 92      [ 4] 4531         staa    (0x1092)
   A615 B7 10 96      [ 4] 4532         staa    (0x1096)
   A618 B7 10 9A      [ 4] 4533         staa    (0x109A)
   A61B B7 10 9E      [ 4] 4534         staa    (0x109E)
   A61E C6 14         [ 2] 4535         ldab    #0x14
   A620 BD A6 8F      [ 6] 4536         jsr     LA652
   A623 49            [ 2] 4537         rola
   A624 36            [ 3] 4538         psha
   A625 D6 15         [ 3] 4539         ldab    (0x0015)
   A627 5A            [ 2] 4540         decb
   A628 D7 15         [ 3] 4541         stab    (0x0015)
   A62A BD FA C9      [ 6] 4542         jsr     DIAGDGT         ; write digit to the diag display
   A62D 37            [ 3] 4543         pshb
   A62E C6 27         [ 2] 4544         ldab    #0x27
   A630 96 15         [ 3] 4545         ldaa    (0x0015)
   A632 0C            [ 2] 4546         clc
   A633 89 30         [ 2] 4547         adca    #0x30
   A635 BD 8D C5      [ 6] 4548         jsr     L8DB5           ; display char here on LCD display
   A638 33            [ 4] 4549         pulb
   A639 32            [ 4] 4550         pula
   A63A 7D 00 15      [ 6] 4551         tst     (0x0015)
   A63D 26 C7         [ 3] 4552         bne     LA5C9  
   A63F BD 86 D4      [ 6] 4553         jsr     L86C4           ; Reset boards 1-10
   A642 CE 10 80      [ 3] 4554         ldx     #0x1080
   A645 C6 00         [ 2] 4555         ldab    #0x00
   A647                    4556 LA60A:
   A647 86 FF         [ 2] 4557         ldaa    #0xFF
   A649 A7 00         [ 4] 4558         staa    0,X
   A64B A7 02         [ 4] 4559         staa    2,X     
   A64D 37            [ 3] 4560         pshb
   A64E C6 1E         [ 2] 4561         ldab    #0x1E
   A650 BD A6 8F      [ 6] 4562         jsr     LA652
   A653 33            [ 4] 4563         pulb
   A654 86 00         [ 2] 4564         ldaa    #0x00
   A656 A7 00         [ 4] 4565         staa    0,X     
   A658 A7 02         [ 4] 4566         staa    2,X     
   A65A 5C            [ 2] 4567         incb
   A65B 3C            [ 4] 4568         pshx
   A65C BD FA C9      [ 6] 4569         jsr     DIAGDGT         ; write digit to the diag display
   A65F 37            [ 3] 4570         pshb
   A660 C6 27         [ 2] 4571         ldab    #0x27
   A662 32            [ 4] 4572         pula
   A663 36            [ 3] 4573         psha
   A664 0C            [ 2] 4574         clc
   A665 89 30         [ 2] 4575         adca    #0x30
   A667 BD 8D C5      [ 6] 4576         jsr     L8DB5           ; display char here on LCD display
   A66A 33            [ 4] 4577         pulb
   A66B 38            [ 5] 4578         pulx
   A66C 08            [ 3] 4579         inx
   A66D 08            [ 3] 4580         inx
   A66E 08            [ 3] 4581         inx
   A66F 08            [ 3] 4582         inx
   A670 8C 10 9D      [ 4] 4583         cpx     #0x109D
   A673 25 D2         [ 3] 4584         bcs     LA60A  
   A675 CE 10 80      [ 3] 4585         ldx     #0x1080
   A678                    4586 LA63B:
   A678 86 FF         [ 2] 4587         ldaa    #0xFF
   A67A A7 00         [ 4] 4588         staa    0,X     
   A67C A7 02         [ 4] 4589         staa    2,X     
   A67E 08            [ 3] 4590         inx
   A67F 08            [ 3] 4591         inx
   A680 08            [ 3] 4592         inx
   A681 08            [ 3] 4593         inx
   A682 8C 10 9D      [ 4] 4594         cpx     #0x109D
   A685 25 F1         [ 3] 4595         bcs     LA63B  
   A687 C6 06         [ 2] 4596         ldab    #0x06
   A689 BD 8C 40      [ 6] 4597         jsr     DLYSECSBY2      ; delay 3 sec
   A68C 7E A5 A2      [ 3] 4598         jmp     LA565
   A68F                    4599 LA652:
   A68F 36            [ 3] 4600         psha
   A690 4F            [ 2] 4601         clra
   A691 DD 23         [ 4] 4602         std     CDTIMR5
   A693                    4603 LA656:
   A693 7D 00 24      [ 6] 4604         tst     CDTIMR5+1
   A696 26 FB         [ 3] 4605         bne     LA656  
   A698 32            [ 4] 4606         pula
   A699 39            [ 5] 4607         rts
                           4608 
                           4609 ; Comma-seperated text
   A69A                    4610 LA65D:
   A69A 30 2C 43 68 75 63  4611         .ascii  '0,Chuck,Mouth,'
        6B 2C 4D 6F 75 74
        68 2C
   A6A8 31 2C 48 65 61 64  4612         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A6B4 32 2C 48 65 61 64  4613         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A6C1 32 2C 48 65 61 64  4614         .ascii  '2,Head up,'
        20 75 70 2C
   A6CB 32 2C 45 79 65 73  4615         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A6D8 31 2C 45 79 65 6C  4616         .ascii  '1,Eyelids,'
        69 64 73 2C
   A6E2 31 2C 52 69 67 68  4617         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A6EF 32 2C 45 79 65 73  4618         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A6FB 31 2C 38 2C 48 65  4619         .ascii  '1,8,Helen,Mouth,'
        6C 65 6E 2C 4D 6F
        75 74 68 2C
   A70B 31 2C 48 65 61 64  4620         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A717 32 2C 48 65 61 64  4621         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A724 32 2C 48 65 61 64  4622         .ascii  '2,Head up,'
        20 75 70 2C
   A72E 32 2C 45 79 65 73  4623         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A73B 31 2C 45 79 65 6C  4624         .ascii  '1,Eyelids,'
        69 64 73 2C
   A745 31 2C 52 69 67 68  4625         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A752 32 2C 45 79 65 73  4626         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A75E 31 2C 36 2C 4D 75  4627         .ascii  '1,6,Munch,Mouth,'
        6E 63 68 2C 4D 6F
        75 74 68 2C
   A76E 31 2C 48 65 61 64  4628         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A77A 32 2C 48 65 61 64  4629         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A787 32 2C 4C 65 66 74  4630         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A792 32 2C 45 79 65 73  4631         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A79F 31 2C 45 79 65 6C  4632         .ascii  '1,Eyelids,'
        69 64 73 2C
   A7A9 31 2C 52 69 67 68  4633         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A7B5 32 2C 45 79 65 73  4634         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A7C1 31 2C 32 2C 4A 61  4635         .ascii  '1,2,Jasper,Mouth,'
        73 70 65 72 2C 4D
        6F 75 74 68 2C
   A7D2 31 2C 48 65 61 64  4636         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A7DE 32 2C 48 65 61 64  4637         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A7EB 32 2C 48 65 61 64  4638         .ascii  '2,Head up,'
        20 75 70 2C
   A7F5 32 2C 45 79 65 73  4639         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A802 31 2C 45 79 65 6C  4640         .ascii  '1,Eyelids,'
        69 64 73 2C
   A80C 31 2C 48 61 6E 64  4641         .ascii  '1,Hands,'
        73 2C
   A814 32 2C 45 79 65 73  4642         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A820 31 2C 34 2C 50 61  4643         .ascii  '1,4,Pasqually,Mouth-Mustache,'
        73 71 75 61 6C 6C
        79 2C 4D 6F 75 74
        68 2D 4D 75 73 74
        61 63 68 65 2C
   A83D 31 2C 48 65 61 64  4644         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A849 32 2C 48 65 61 64  4645         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A856 32 2C 4C 65 66 74  4646         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A861 32 2C 45 79 65 73  4647         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A86E 31 2C 45 79 65 6C  4648         .ascii  '1,Eyelids,'
        69 64 73 2C
   A878 31 2C 52 69 67 68  4649         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A884 32 2C 45 79 65 73  4650         .ascii  '2,Eyes left,1,'
        20 6C 65 66 74 2C
        31 2C
                           4651 
   A892                    4652 LA855:
   A892 3C            [ 4] 4653         pshx
   A893 BD 86 D4      [ 6] 4654         jsr     L86C4           ; Reset boards 1-10
   A896 CE 10 80      [ 3] 4655         ldx     #0x1080
   A899 86 20         [ 2] 4656         ldaa    #0x20
   A89B A7 00         [ 4] 4657         staa    0,X
   A89D A7 04         [ 4] 4658         staa    4,X
   A89F A7 08         [ 4] 4659         staa    8,X
   A8A1 A7 0C         [ 4] 4660         staa    12,X
   A8A3 A7 10         [ 4] 4661         staa    16,X
   A8A5 38            [ 5] 4662         pulx
   A8A6 39            [ 5] 4663         rts
                           4664 
   A8A7                    4665 LA86A:
   A8A7 BD A3 6B      [ 6] 4666         jsr     LA32E
                           4667 
   A8AA BD 8D F4      [ 6] 4668         jsr     LCDMSG1 
   A8AD 20 20 20 20 57 61  4669         .ascis  '    Warm-Up  '
        72 6D 2D 55 70 20
        A0
                           4670 
   A8BA BD 8D ED      [ 6] 4671         jsr     LCDMSG2 
   A8BD 43 75 72 74 61 69  4672         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           4673 
   A8CD C6 14         [ 2] 4674         ldab    #0x14
   A8CF BD 8C 40      [ 6] 4675         jsr     DLYSECSBY2      ; delay 10 sec
   A8D2                    4676 LA895:
   A8D2 BD A8 92      [ 6] 4677         jsr     LA855
   A8D5 C6 02         [ 2] 4678         ldab    #0x02
   A8D7 BD 8C 40      [ 6] 4679         jsr     DLYSECSBY2      ; delay 1 sec
   A8DA CE A6 9A      [ 3] 4680         ldx     #LA65D
   A8DD C6 05         [ 2] 4681         ldab    #0x05
   A8DF D7 12         [ 3] 4682         stab    (0x0012)
   A8E1                    4683 LA8A4:
   A8E1 C6 08         [ 2] 4684         ldab    #0x08
   A8E3 D7 13         [ 3] 4685         stab    (0x0013)
   A8E5 BD A9 7E      [ 6] 4686         jsr     LA941
   A8E8 BD A9 89      [ 6] 4687         jsr     LA94C
   A8EB C6 02         [ 2] 4688         ldab    #0x02
   A8ED BD 8C 40      [ 6] 4689         jsr     DLYSECSBY2      ; delay 1 sec
   A8F0                    4690 LA8B3:
   A8F0 BD A9 9B      [ 6] 4691         jsr     LA95E
   A8F3 A6 00         [ 4] 4692         ldaa    0,X     
   A8F5 80 30         [ 2] 4693         suba    #0x30
   A8F7 08            [ 3] 4694         inx
   A8F8 08            [ 3] 4695         inx
   A8F9 36            [ 3] 4696         psha
   A8FA 7C 00 4C      [ 6] 4697         inc     (0x004C)
   A8FD 3C            [ 4] 4698         pshx
   A8FE BD 88 F5      [ 6] 4699         jsr     L88E5
   A901 38            [ 5] 4700         pulx
   A902 86 4F         [ 2] 4701         ldaa    #0x4F           ;'O'
   A904 C6 0C         [ 2] 4702         ldab    #0x0C
   A906 BD 8D C5      [ 6] 4703         jsr     L8DB5           ; display char here on LCD display
   A909 86 6E         [ 2] 4704         ldaa    #0x6E           ;'n'
   A90B C6 0D         [ 2] 4705         ldab    #0x0D
   A90D BD 8D C5      [ 6] 4706         jsr     L8DB5           ; display char here on LCD display
   A910 CC 20 0E      [ 3] 4707         ldd     #0x200E         ;' '
   A913 BD 8D C5      [ 6] 4708         jsr     L8DB5           ; display char here on LCD display
   A916 7A 00 4C      [ 6] 4709         dec     (0x004C)
   A919 32            [ 4] 4710         pula
   A91A 36            [ 3] 4711         psha
   A91B C6 64         [ 2] 4712         ldab    #0x64
   A91D 3D            [10] 4713         mul
   A91E DD 23         [ 4] 4714         std     CDTIMR5
   A920                    4715 LA8E3:
   A920 DC 23         [ 4] 4716         ldd     CDTIMR5
   A922 26 FC         [ 3] 4717         bne     LA8E3  
   A924 BD 8E A5      [ 6] 4718         jsr     L8E95
   A927 81 0D         [ 2] 4719         cmpa    #0x0D
   A929 26 05         [ 3] 4720         bne     LA8F3  
   A92B BD A9 B2      [ 6] 4721         jsr     LA975           ; Wait for SCD Keypress
   A92E 20 10         [ 3] 4722         bra     LA903  
   A930                    4723 LA8F3:
   A930 81 01         [ 2] 4724         cmpa    #0x01
   A932 26 04         [ 3] 4725         bne     LA8FB  
   A934 32            [ 4] 4726         pula
   A935 7E A8 D2      [ 3] 4727         jmp     LA895
   A938                    4728 LA8FB:
   A938 81 02         [ 2] 4729         cmpa    #0x02
   A93A 26 04         [ 3] 4730         bne     LA903  
   A93C 32            [ 4] 4731         pula
   A93D 7E A9 72      [ 3] 4732         jmp     LA935
   A940                    4733 LA903:
   A940 3C            [ 4] 4734         pshx
   A941 BD 88 F5      [ 6] 4735         jsr     L88E5
   A944 38            [ 5] 4736         pulx
   A945 86 66         [ 2] 4737         ldaa    #0x66           ;'f'
   A947 C6 0D         [ 2] 4738         ldab    #0x0D
   A949 BD 8D C5      [ 6] 4739         jsr     L8DB5           ; display char here on LCD display
   A94C 86 66         [ 2] 4740         ldaa    #0x66           ;'f'
   A94E C6 0E         [ 2] 4741         ldab    #0x0E
   A950 BD 8D C5      [ 6] 4742         jsr     L8DB5           ; display char here on LCD display
   A953 32            [ 4] 4743         pula
   A954 C6 64         [ 2] 4744         ldab    #0x64
   A956 3D            [10] 4745         mul
   A957 DD 23         [ 4] 4746         std     CDTIMR5
   A959                    4747 LA91C:
   A959 DC 23         [ 4] 4748         ldd     CDTIMR5
   A95B 26 FC         [ 3] 4749         bne     LA91C  
   A95D BD A8 92      [ 6] 4750         jsr     LA855
   A960 7C 00 4B      [ 6] 4751         inc     (0x004B)
   A963 96 4B         [ 3] 4752         ldaa    (0x004B)
   A965 81 48         [ 2] 4753         cmpa    #0x48
   A967 25 87         [ 3] 4754         bcs     LA8B3  
   A969 96 4C         [ 3] 4755         ldaa    (0x004C)
   A96B 81 34         [ 2] 4756         cmpa    #0x34
   A96D 27 03         [ 3] 4757         beq     LA935  
   A96F 7E A8 E1      [ 3] 4758         jmp     LA8A4
   A972                    4759 LA935:
   A972 C6 02         [ 2] 4760         ldab    #0x02
   A974 BD 8C 40      [ 6] 4761         jsr     DLYSECSBY2      ; delay 1 sec
   A977 BD 86 D4      [ 6] 4762         jsr     L86C4           ; Reset boards 1-10
   A97A BD A3 7E      [ 6] 4763         jsr     LA341
   A97D 39            [ 5] 4764         rts
                           4765 
   A97E                    4766 LA941:
   A97E A6 00         [ 4] 4767         ldaa    0,X     
   A980 08            [ 3] 4768         inx
   A981 08            [ 3] 4769         inx
   A982 97 4C         [ 3] 4770         staa    (0x004C)
   A984 86 40         [ 2] 4771         ldaa    #0x40
   A986 97 4B         [ 3] 4772         staa    (0x004B)
   A988 39            [ 5] 4773         rts
                           4774 
   A989                    4775 LA94C:
   A989 BD 8D 02      [ 6] 4776         jsr     L8CF2
   A98C                    4777 LA94F:
   A98C A6 00         [ 4] 4778         ldaa    0,X     
   A98E 08            [ 3] 4779         inx
   A98F 81 2C         [ 2] 4780         cmpa    #0x2C
   A991 27 07         [ 3] 4781         beq     LA95D  
   A993 36            [ 3] 4782         psha
   A994 BD 8E 80      [ 6] 4783         jsr     L8E70
   A997 32            [ 4] 4784         pula
   A998 20 F2         [ 3] 4785         bra     LA94F  
   A99A                    4786 LA95D:
   A99A 39            [ 5] 4787         rts
                           4788 
   A99B                    4789 LA95E:
   A99B BD 8D 13      [ 6] 4790         jsr     L8D03
   A99E 86 C0         [ 2] 4791         ldaa    #0xC0
   A9A0 BD 8E 5B      [ 6] 4792         jsr     L8E4B
   A9A3                    4793 LA966:
   A9A3 A6 00         [ 4] 4794         ldaa    0,X     
   A9A5 08            [ 3] 4795         inx
   A9A6 81 2C         [ 2] 4796         cmpa    #0x2C
   A9A8 27 07         [ 3] 4797         beq     LA974  
   A9AA 36            [ 3] 4798         psha
   A9AB BD 8E 80      [ 6] 4799         jsr     L8E70
   A9AE 32            [ 4] 4800         pula
   A9AF 20 F2         [ 3] 4801         bra     LA966  
   A9B1                    4802 LA974:
   A9B1 39            [ 5] 4803         rts
                           4804 
                           4805 ; Wait for SCD Keypress
   A9B2                    4806 LA975:
   A9B2 BD 8E A5      [ 6] 4807         jsr     L8E95
   A9B5 4D            [ 2] 4808         tsta
   A9B6 27 FA         [ 3] 4809         beq     LA975  
   A9B8 39            [ 5] 4810         rts
                           4811 
   A9B9                    4812 LA97C:
   A9B9 7F 00 60      [ 6] 4813         clr     (0x0060)
   A9BC FC 02 9C      [ 5] 4814         ldd     (0x029C)
   A9BF 1A 83 00 01   [ 5] 4815         cpd     #0x0001
   A9C3 27 0C         [ 3] 4816         beq     LA994  
   A9C5 1A 83 03 E8   [ 5] 4817         cpd     #0x03E8
   A9C9 2D 7D         [ 3] 4818         blt     LAA0B  
   A9CB 1A 83 04 4B   [ 5] 4819         cpd     #0x044B
   A9CF 22 77         [ 3] 4820         bhi     LAA0B  
   A9D1                    4821 LA994:
   A9D1 C6 40         [ 2] 4822         ldab    #0x40
   A9D3 D7 62         [ 3] 4823         stab    (0x0062)
   A9D5 BD FA F9      [ 6] 4824         jsr     BUTNLIT 
   A9D8 C6 64         [ 2] 4825         ldab    #0x64           ; delay 1 sec
   A9DA BD 8C 32      [ 6] 4826         jsr     DLYSECSBY100
   A9DD BD 86 D4      [ 6] 4827         jsr     L86C4           ; Reset boards 1-10
   A9E0 BD 8C F9      [ 6] 4828         jsr     L8CE9
                           4829 
   A9E3 BD 8D F4      [ 6] 4830         jsr     LCDMSG1 
   A9E6 20 20 20 20 20 53  4831         .ascis  '     STUDIO'
        54 55 44 49 CF
                           4832 
   A9F1 BD 8D ED      [ 6] 4833         jsr     LCDMSG2 
   A9F4 70 72 6F 67 72 61  4834         .ascis  'programming mode'
        6D 6D 69 6E 67 20
        6D 6F 64 E5
                           4835 
   AA04 BD A3 6B      [ 6] 4836         jsr     LA32E
   AA07 BD 99 AE      [ 6] 4837         jsr     L999E
   AA0A BD 99 C1      [ 6] 4838         jsr     L99B1
   AA0D CE 20 00      [ 3] 4839         ldx     #0x2000
   AA10                    4840 LA9D3:
   AA10 18 CE 00 C0   [ 4] 4841         ldy     #0x00C0
   AA14                    4842 LA9D7:
   AA14 18 09         [ 4] 4843         dey
   AA16 26 0A         [ 3] 4844         bne     LA9E5  
   AA18 BD AA 31      [ 6] 4845         jsr     LA9F4
   AA1B 96 60         [ 3] 4846         ldaa    (0x0060)
   AA1D 26 29         [ 3] 4847         bne     LAA0B  
   AA1F CE 20 00      [ 3] 4848         ldx     #0x2000
   AA22                    4849 LA9E5:
   AA22 B6 10 A8      [ 4] 4850         ldaa    (0x10A8)
   AA25 84 01         [ 2] 4851         anda    #0x01
   AA27 27 EB         [ 3] 4852         beq     LA9D7  
   AA29 B6 10 A9      [ 4] 4853         ldaa    (0x10A9)
   AA2C A7 00         [ 4] 4854         staa    0,X     
   AA2E 08            [ 3] 4855         inx
   AA2F 20 DF         [ 3] 4856         bra     LA9D3
                           4857 
   AA31                    4858 LA9F4:
   AA31 CE 20 00      [ 3] 4859         ldx     #0x2000
   AA34 18 CE 10 80   [ 4] 4860         ldy     #0x1080
   AA38                    4861 LA9FB:
   AA38 A6 00         [ 4] 4862         ldaa    0,X     
   AA3A 18 A7 00      [ 5] 4863         staa    0,Y     
   AA3D 08            [ 3] 4864         inx
   AA3E 18 08         [ 4] 4865         iny
   AA40 18 08         [ 4] 4866         iny
   AA42 8C 20 10      [ 4] 4867         cpx     #0x2010
   AA45 25 F1         [ 3] 4868         bcs     LA9FB  
   AA47 39            [ 5] 4869         rts
   AA48                    4870 LAA0B:
   AA48 39            [ 5] 4871         rts
                           4872 
   AA49                    4873 LAA0C:
   AA49 CC 48 37      [ 3] 4874         ldd     #0x4837         ;'H'
   AA4C                    4875 LAA0F:
   AA4C BD 8D C5      [ 6] 4876         jsr     L8DB5           ; display char here on LCD display
   AA4F 39            [ 5] 4877         rts
                           4878 
   AA50                    4879 LAA13:
   AA50 CC 20 37      [ 3] 4880         ldd     #0x2037         ;' '
   AA53 20 F7         [ 3] 4881         bra     LAA0F
                           4882 
   AA55                    4883 LAA18:
   AA55 CC 42 0F      [ 3] 4884         ldd     #0x420F         ;'B'
   AA58 20 F2         [ 3] 4885         bra     LAA0F
                           4886 
   AA5A                    4887 LAA1D:
   AA5A CC 20 0F      [ 3] 4888         ldd     #0x200F         ;' '
   AA5D 20 ED         [ 3] 4889         bra     LAA0F
                           4890 
   AA5F                    4891 LAA22: 
   AA5F 7F 00 4F      [ 6] 4892         clr     (0x004F)
   AA62 CC 00 01      [ 3] 4893         ldd     #0x0001
   AA65 DD 1B         [ 4] 4894         std     CDTIMR1
   AA67 CE 20 00      [ 3] 4895         ldx     #0x2000
   AA6A                    4896 LAA2D:
   AA6A B6 10 A8      [ 4] 4897         ldaa    (0x10A8)
   AA6D 84 01         [ 2] 4898         anda    #0x01
   AA6F 27 F9         [ 3] 4899         beq     LAA2D  
   AA71 DC 1B         [ 4] 4900         ldd     CDTIMR1
   AA73 0F            [ 2] 4901         sei
   AA74 26 03         [ 3] 4902         bne     LAA3C  
   AA76 CE 20 00      [ 3] 4903         ldx     #0x2000
   AA79                    4904 LAA3C:
   AA79 B6 10 A9      [ 4] 4905         ldaa    (0x10A9)
   AA7C A7 00         [ 4] 4906         staa    0,X     
   AA7E 0E            [ 2] 4907         cli
   AA7F BD FA A3      [ 6] 4908         jsr     SERIALW      
   AA82 08            [ 3] 4909         inx
   AA83 7F 00 4F      [ 6] 4910         clr     (0x004F)
   AA86 CC 00 01      [ 3] 4911         ldd     #0x0001
   AA89 DD 1B         [ 4] 4912         std     CDTIMR1
   AA8B 8C 20 23      [ 4] 4913         cpx     #0x2023
   AA8E 26 DA         [ 3] 4914         bne     LAA2D  
   AA90 CE 20 00      [ 3] 4915         ldx     #0x2000
   AA93 7F 00 B7      [ 6] 4916         clr     (0x00B7)
   AA96                    4917 LAA59:
   AA96 A6 00         [ 4] 4918         ldaa    0,X     
   AA98 9B B7         [ 3] 4919         adda    (0x00B7)
   AA9A 97 B7         [ 3] 4920         staa    (0x00B7)
   AA9C 08            [ 3] 4921         inx
   AA9D 8C 20 22      [ 4] 4922         cpx     #0x2022
   AAA0 25 F4         [ 3] 4923         bcs     LAA59  
   AAA2 96 B7         [ 3] 4924         ldaa    (0x00B7)
   AAA4 88 FF         [ 2] 4925         eora    #0xFF
   AAA6 A1 00         [ 4] 4926         cmpa    0,X     
   AAA8 CE 20 00      [ 3] 4927         ldx     #0x2000
   AAAB A6 20         [ 4] 4928         ldaa    0x20,X
   AAAD 2B 03         [ 3] 4929         bmi     LAA75  
   AAAF 7E AA 5F      [ 3] 4930         jmp     LAA22
   AAB2                    4931 LAA75:
   AAB2 A6 00         [ 4] 4932         ldaa    0,X     
   AAB4 B7 10 80      [ 4] 4933         staa    (0x1080)
   AAB7 08            [ 3] 4934         inx
   AAB8 A6 00         [ 4] 4935         ldaa    0,X     
   AABA B7 10 82      [ 4] 4936         staa    (0x1082)
   AABD 08            [ 3] 4937         inx
   AABE A6 00         [ 4] 4938         ldaa    0,X     
   AAC0 B7 10 84      [ 4] 4939         staa    (0x1084)
   AAC3 08            [ 3] 4940         inx
   AAC4 A6 00         [ 4] 4941         ldaa    0,X     
   AAC6 B7 10 86      [ 4] 4942         staa    (0x1086)
   AAC9 08            [ 3] 4943         inx
   AACA A6 00         [ 4] 4944         ldaa    0,X     
   AACC B7 10 88      [ 4] 4945         staa    (0x1088)
   AACF 08            [ 3] 4946         inx
   AAD0 A6 00         [ 4] 4947         ldaa    0,X     
   AAD2 B7 10 8A      [ 4] 4948         staa    (0x108A)
   AAD5 08            [ 3] 4949         inx
   AAD6 A6 00         [ 4] 4950         ldaa    0,X     
   AAD8 B7 10 8C      [ 4] 4951         staa    (0x108C)
   AADB 08            [ 3] 4952         inx
   AADC A6 00         [ 4] 4953         ldaa    0,X     
   AADE B7 10 8E      [ 4] 4954         staa    (0x108E)
   AAE1 08            [ 3] 4955         inx
   AAE2 A6 00         [ 4] 4956         ldaa    0,X     
   AAE4 B7 10 90      [ 4] 4957         staa    (0x1090)
   AAE7 08            [ 3] 4958         inx
   AAE8 A6 00         [ 4] 4959         ldaa    0,X     
   AAEA B7 10 92      [ 4] 4960         staa    (0x1092)
   AAED 08            [ 3] 4961         inx
   AAEE A6 00         [ 4] 4962         ldaa    0,X     
   AAF0 8A 80         [ 2] 4963         oraa    #0x80
   AAF2 B7 10 94      [ 4] 4964         staa    (0x1094)
   AAF5 08            [ 3] 4965         inx
   AAF6 A6 00         [ 4] 4966         ldaa    0,X     
   AAF8 8A 01         [ 2] 4967         oraa    #0x01
   AAFA B7 10 96      [ 4] 4968         staa    (0x1096)
   AAFD 08            [ 3] 4969         inx
   AAFE A6 00         [ 4] 4970         ldaa    0,X     
   AB00 B7 10 98      [ 4] 4971         staa    (0x1098)
   AB03 08            [ 3] 4972         inx
   AB04 A6 00         [ 4] 4973         ldaa    0,X     
   AB06 B7 10 9A      [ 4] 4974         staa    (0x109A)
   AB09 08            [ 3] 4975         inx
   AB0A A6 00         [ 4] 4976         ldaa    0,X     
   AB0C B7 10 9C      [ 4] 4977         staa    (0x109C)
   AB0F 08            [ 3] 4978         inx
   AB10 A6 00         [ 4] 4979         ldaa    0,X     
   AB12 B7 10 9E      [ 4] 4980         staa    (0x109E)
   AB15 7E AA 5F      [ 3] 4981         jmp     LAA22
                           4982 
   AB18                    4983 LAADB:
   AB18 7F 10 98      [ 6] 4984         clr     (0x1098)
   AB1B 7F 10 9A      [ 6] 4985         clr     (0x109A)
   AB1E 7F 10 9C      [ 6] 4986         clr     (0x109C)
   AB21 7F 10 9E      [ 6] 4987         clr     (0x109E)
   AB24 39            [ 5] 4988         rts
   AB25                    4989 LAAE8:
   AB25 CE 04 2C      [ 3] 4990         ldx     #0x042C
   AB28 C6 10         [ 2] 4991         ldab    #0x10
   AB2A                    4992 LAAED:
   AB2A 5D            [ 2] 4993         tstb
   AB2B 27 12         [ 3] 4994         beq     LAB02  
   AB2D A6 00         [ 4] 4995         ldaa    0,X     
   AB2F 81 30         [ 2] 4996         cmpa    #0x30
   AB31 25 0D         [ 3] 4997         bcs     LAB03  
   AB33 81 39         [ 2] 4998         cmpa    #0x39
   AB35 22 09         [ 3] 4999         bhi     LAB03  
   AB37 08            [ 3] 5000         inx
   AB38 08            [ 3] 5001         inx
   AB39 08            [ 3] 5002         inx
   AB3A 8C 04 59      [ 4] 5003         cpx     #0x0459
   AB3D 23 EB         [ 3] 5004         bls     LAAED  
   AB3F                    5005 LAB02:
   AB3F 39            [ 5] 5006         rts
                           5007 
   AB40                    5008 LAB03:
   AB40 5A            [ 2] 5009         decb
   AB41 3C            [ 4] 5010         pshx
   AB42                    5011 LAB05:
   AB42 A6 03         [ 4] 5012         ldaa    3,X     
   AB44 A7 00         [ 4] 5013         staa    0,X     
   AB46 08            [ 3] 5014         inx
   AB47 8C 04 5C      [ 4] 5015         cpx     #0x045C
   AB4A 25 F6         [ 3] 5016         bcs     LAB05  
   AB4C 86 FF         [ 2] 5017         ldaa    #0xFF
   AB4E B7 04 59      [ 4] 5018         staa    (0x0459)
   AB51 38            [ 5] 5019         pulx
   AB52 20 D6         [ 3] 5020         bra     LAAED
                           5021 
                           5022 ; erase revalid tape section in EEPROM
   AB54                    5023 LAB17:
   AB54 CE 04 2C      [ 3] 5024         ldx     #0x042C
   AB57 86 FF         [ 2] 5025         ldaa    #0xFF
   AB59                    5026 LAB1C:
   AB59 A7 00         [ 4] 5027         staa    0,X     
   AB5B 08            [ 3] 5028         inx
   AB5C 8C 04 5C      [ 4] 5029         cpx     #0x045C
   AB5F 25 F8         [ 3] 5030         bcs     LAB1C
   AB61 39            [ 5] 5031         rts
                           5032 
   AB62                    5033 LAB25:
   AB62 CE 04 2C      [ 3] 5034         ldx     #0x042C
   AB65                    5035 LAB28:
   AB65 A6 00         [ 4] 5036         ldaa    0,X     
   AB67 81 30         [ 2] 5037         cmpa    #0x30
   AB69 25 17         [ 3] 5038         bcs     LAB45  
   AB6B 81 39         [ 2] 5039         cmpa    #0x39
   AB6D 22 13         [ 3] 5040         bhi     LAB45  
   AB6F 08            [ 3] 5041         inx
   AB70 08            [ 3] 5042         inx
   AB71 08            [ 3] 5043         inx
   AB72 8C 04 5C      [ 4] 5044         cpx     #0x045C
   AB75 25 EE         [ 3] 5045         bcs     LAB28  
   AB77 86 FF         [ 2] 5046         ldaa    #0xFF
   AB79 B7 04 2C      [ 4] 5047         staa    (0x042C)
   AB7C BD AB 25      [ 6] 5048         jsr     LAAE8
   AB7F CE 04 59      [ 3] 5049         ldx     #0x0459
   AB82                    5050 LAB45:
   AB82 39            [ 5] 5051         rts
                           5052 
   AB83                    5053 LAB46:
   AB83 B6 02 99      [ 4] 5054         ldaa    (0x0299)
   AB86 A7 00         [ 4] 5055         staa    0,X     
   AB88 B6 02 9A      [ 4] 5056         ldaa    (0x029A)
   AB8B A7 01         [ 4] 5057         staa    1,X     
   AB8D B6 02 9B      [ 4] 5058         ldaa    (0x029B)
   AB90 A7 02         [ 4] 5059         staa    2,X     
   AB92 39            [ 5] 5060         rts
                           5061 
   AB93                    5062 LAB56:
   AB93 CE 04 2C      [ 3] 5063         ldx     #0x042C
   AB96                    5064 LAB59:
   AB96 B6 02 99      [ 4] 5065         ldaa    (0x0299)
   AB99 A1 00         [ 4] 5066         cmpa    0,X     
   AB9B 26 10         [ 3] 5067         bne     LAB70  
   AB9D B6 02 9A      [ 4] 5068         ldaa    (0x029A)
   ABA0 A1 01         [ 4] 5069         cmpa    1,X     
   ABA2 26 09         [ 3] 5070         bne     LAB70  
   ABA4 B6 02 9B      [ 4] 5071         ldaa    (0x029B)
   ABA7 A1 02         [ 4] 5072         cmpa    2,X     
   ABA9 26 02         [ 3] 5073         bne     LAB70  
   ABAB 20 0A         [ 3] 5074         bra     LAB7A  
   ABAD                    5075 LAB70:
   ABAD 08            [ 3] 5076         inx
   ABAE 08            [ 3] 5077         inx
   ABAF 08            [ 3] 5078         inx
   ABB0 8C 04 5C      [ 4] 5079         cpx     #0x045C
   ABB3 25 E1         [ 3] 5080         bcs     LAB59  
   ABB5 0D            [ 2] 5081         sec
   ABB6 39            [ 5] 5082         rts
                           5083 
   ABB7                    5084 LAB7A:
   ABB7 0C            [ 2] 5085         clc
   ABB8 39            [ 5] 5086         rts
                           5087 
                           5088 ;show re-valid tapes
   ABB9                    5089 LAB7C:
   ABB9 CE 04 2C      [ 3] 5090         ldx     #0x042C
   ABBC                    5091 LAB7F:
   ABBC A6 00         [ 4] 5092         ldaa    0,X     
   ABBE 81 30         [ 2] 5093         cmpa    #0x30
   ABC0 25 1E         [ 3] 5094         bcs     LABA3  
   ABC2 81 39         [ 2] 5095         cmpa    #0x39
   ABC4 22 1A         [ 3] 5096         bhi     LABA3  
   ABC6 BD FA A3      [ 6] 5097         jsr     SERIALW      
   ABC9 08            [ 3] 5098         inx
   ABCA A6 00         [ 4] 5099         ldaa    0,X     
   ABCC BD FA A3      [ 6] 5100         jsr     SERIALW      
   ABCF 08            [ 3] 5101         inx
   ABD0 A6 00         [ 4] 5102         ldaa    0,X     
   ABD2 BD FA A3      [ 6] 5103         jsr     SERIALW      
   ABD5 08            [ 3] 5104         inx
   ABD6 86 20         [ 2] 5105         ldaa    #0x20
   ABD8 BD FA A3      [ 6] 5106         jsr     SERIALW      
   ABDB 8C 04 5C      [ 4] 5107         cpx     #0x045C
   ABDE 25 DC         [ 3] 5108         bcs     LAB7F  
   ABE0                    5109 LABA3:
   ABE0 86 0D         [ 2] 5110         ldaa    #0x0D
   ABE2 BD FA A3      [ 6] 5111         jsr     SERIALW      
   ABE5 86 0A         [ 2] 5112         ldaa    #0x0A
   ABE7 BD FA A3      [ 6] 5113         jsr     SERIALW      
   ABEA 39            [ 5] 5114         rts
                           5115 
   ABEB                    5116 LABAE:
   ABEB 7F 00 4A      [ 6] 5117         clr     (0x004A)
   ABEE CC 00 64      [ 3] 5118         ldd     #0x0064
   ABF1 DD 23         [ 4] 5119         std     CDTIMR5
   ABF3                    5120 LABB6:
   ABF3 96 4A         [ 3] 5121         ldaa    (0x004A)
   ABF5 26 08         [ 3] 5122         bne     LABC2  
   ABF7 BD 9B 29      [ 6] 5123         jsr     L9B19           ; do the random motions if enabled
   ABFA DC 23         [ 4] 5124         ldd     CDTIMR5
   ABFC 26 F5         [ 3] 5125         bne     LABB6  
   ABFE                    5126 LABC1:
   ABFE 39            [ 5] 5127         rts
                           5128 
   ABFF                    5129 LABC2:
   ABFF 81 31         [ 2] 5130         cmpa    #0x31
   AC01 26 04         [ 3] 5131         bne     LABCA  
   AC03 BD AB 54      [ 6] 5132         jsr     LAB17
   AC06 39            [ 5] 5133         rts
                           5134 
   AC07                    5135 LABCA:
   AC07 20 F5         [ 3] 5136         bra     LABC1  
                           5137 
                           5138 ; TOC1 timer handler
                           5139 ;
                           5140 ; Timer is running at:
                           5141 ; EXTAL = 16Mhz
                           5142 ; E Clk = 4Mhz
                           5143 ; Timer Prescaler = /16 = 250Khz
                           5144 ; Timer Period = 4us
                           5145 ; T1OC is set to previous value +625
                           5146 ; So, this routine is called every 2.5ms
                           5147 ;
   AC09                    5148 LABCC:
   AC09 DC 10         [ 4] 5149         ldd     T1NXT           ; get ready for next time
   AC0B C3 02 71      [ 4] 5150         addd    #0x0271         ; add 625
   AC0E FD 10 16      [ 5] 5151         std     TOC1  
   AC11 DD 10         [ 4] 5152         std     T1NXT
                           5153 
   AC13 86 80         [ 2] 5154         ldaa    #0x80
   AC15 B7 10 23      [ 4] 5155         staa    TFLG1           ; clear timer1 flag
                           5156 
                           5157 ; Some blinking SPECIAL button every half second,
                           5158 ; if 0x0078 is non zero
                           5159 
   AC18 7D 00 78      [ 6] 5160         tst     (0x0078)        ; if 78 is zero, skip ahead
   AC1B 27 1C         [ 3] 5161         beq     LABFC           ; else do some blinking button lights
   AC1D DC 25         [ 4] 5162         ldd     (0x0025)        ; else inc 25/26
   AC1F C3 00 01      [ 4] 5163         addd    #0x0001
   AC22 DD 25         [ 4] 5164         std     (0x0025)
   AC24 1A 83 00 C8   [ 5] 5165         cpd     #0x00C8         ; is it 200?
   AC28 26 0F         [ 3] 5166         bne     LABFC           ; no, keep going
   AC2A 7F 00 25      [ 6] 5167         clr     (0x0025)        ; reset 25/26
   AC2D 7F 00 26      [ 6] 5168         clr     (0x0026)
   AC30 D6 62         [ 3] 5169         ldab    (0x0062)        ; and toggle bit 3 of 62
   AC32 C8 08         [ 2] 5170         eorb    #0x08
   AC34 D7 62         [ 3] 5171         stab    (0x0062)
   AC36 BD FA F9      [ 6] 5172         jsr     BUTNLIT         ; and toggle the "special" button light
                           5173 
                           5174 ; 
   AC39                    5175 LABFC:
   AC39 7C 00 6F      [ 6] 5176         inc     (0x006F)        ; count every 2.5ms
   AC3C 96 6F         [ 3] 5177         ldaa    (0x006F)
   AC3E 81 28         [ 2] 5178         cmpa    #0x28           ; is it 40 intervals? (0.1 sec?)
   AC40 25 42         [ 3] 5179         bcs     LAC47           ; if not yet, jump ahead
   AC42 7F 00 6F      [ 6] 5180         clr     (0x006F)        ; clear it 2.5ms counter
   AC45 7D 00 63      [ 6] 5181         tst     (0x0063)        ; decrement 0.1s counter here
   AC48 27 03         [ 3] 5182         beq     LAC10           ; if it's not already zero
   AC4A 7A 00 63      [ 6] 5183         dec     (0x0063)
                           5184 
                           5185 ; staggered counters - here every 100ms
                           5186 
                           5187 ; 0x0070 counts from 250 to 1, period is 25 secs
   AC4D                    5188 LAC10:
   AC4D 96 70         [ 3] 5189         ldaa    OFFCNT1         ; decrement 0.1s counter here
   AC4F 4A            [ 2] 5190         deca
   AC50 97 70         [ 3] 5191         staa    OFFCNT1
   AC52 26 04         [ 3] 5192         bne     LAC1B       
   AC54 86 FA         [ 2] 5193         ldaa    #0xFA           ; 250
   AC56 97 70         [ 3] 5194         staa    OFFCNT1
                           5195 
                           5196 ; 0x0071 counts from 230 to 1, period is 23 secs
   AC58                    5197 LAC1B:
   AC58 96 71         [ 3] 5198         ldaa    OFFCNT2
   AC5A 4A            [ 2] 5199         deca
   AC5B 97 71         [ 3] 5200         staa    OFFCNT2
   AC5D 26 04         [ 3] 5201         bne     LAC26  
   AC5F 86 E6         [ 2] 5202         ldaa    #0xE6           ; 230
   AC61 97 71         [ 3] 5203         staa    OFFCNT2
                           5204 
                           5205 ; 0x0072 counts from 210 to 1, period is 21 secs
   AC63                    5206 LAC26:
   AC63 96 72         [ 3] 5207         ldaa    OFFCNT3
   AC65 4A            [ 2] 5208         deca
   AC66 97 72         [ 3] 5209         staa    OFFCNT3
   AC68 26 04         [ 3] 5210         bne     LAC31  
   AC6A 86 D2         [ 2] 5211         ldaa    #0xD2           ; 210
   AC6C 97 72         [ 3] 5212         staa    OFFCNT3
                           5213 
                           5214 ; 0x0073 counts from 190 to 1, period is 19 secs
   AC6E                    5215 LAC31:
   AC6E 96 73         [ 3] 5216         ldaa    OFFCNT4
   AC70 4A            [ 2] 5217         deca
   AC71 97 73         [ 3] 5218         staa    OFFCNT4
   AC73 26 04         [ 3] 5219         bne     LAC3C  
   AC75 86 BE         [ 2] 5220         ldaa    #0xBE           ; 190
   AC77 97 73         [ 3] 5221         staa    OFFCNT4
                           5222 
                           5223 ; 0x0074 counts from 170 to 1, period is 17 secs
   AC79                    5224 LAC3C:
   AC79 96 74         [ 3] 5225         ldaa    OFFCNT5
   AC7B 4A            [ 2] 5226         deca
   AC7C 97 74         [ 3] 5227         staa    OFFCNT5
   AC7E 26 04         [ 3] 5228         bne     LAC47  
   AC80 86 AA         [ 2] 5229         ldaa    #0xAA           ; 170
   AC82 97 74         [ 3] 5230         staa    OFFCNT5
                           5231 
                           5232 ; back to 2.5ms period here
                           5233 
   AC84                    5234 LAC47:
   AC84 96 27         [ 3] 5235         ldaa    T30MS
   AC86 4C            [ 2] 5236         inca
   AC87 97 27         [ 3] 5237         staa    T30MS
   AC89 81 0C         [ 2] 5238         cmpa    #0x0C           ; 12 = 30ms?
   AC8B 23 09         [ 3] 5239         bls     LAC59  
   AC8D 7F 00 27      [ 6] 5240         clr     T30MS
                           5241 
                           5242 ; do these two tasks every 30ms
   AC90 BD 8E D6      [ 6] 5243         jsr     L8EC6           ; Scan SCD keys
   AC93 BD 8F 22      [ 6] 5244         jsr     L8F12           ; Scan Front Panel Switches
                           5245 
                           5246 ; back to every 2.5ms here
                           5247 ; LCD update???
                           5248 
   AC96                    5249 LAC59:
   AC96 96 43         [ 3] 5250         ldaa    (0x0043)
   AC98 27 55         [ 3] 5251         beq     LACB2  
   AC9A DE 44         [ 4] 5252         ldx     (0x0044)
   AC9C A6 00         [ 4] 5253         ldaa    0,X     
   AC9E 27 23         [ 3] 5254         beq     LAC86  
   ACA0 B7 10 00      [ 4] 5255         staa    PORTA  
   ACA3 B6 10 02      [ 4] 5256         ldaa    PORTG  
   ACA6 84 F3         [ 2] 5257         anda    #0xF3
   ACA8 B7 10 02      [ 4] 5258         staa    PORTG  
   ACAB 84 FD         [ 2] 5259         anda    #0xFD
   ACAD B7 10 02      [ 4] 5260         staa    PORTG  
   ACB0 8A 02         [ 2] 5261         oraa    #0x02
   ACB2 B7 10 02      [ 4] 5262         staa    PORTG  
   ACB5 08            [ 3] 5263         inx
   ACB6 08            [ 3] 5264         inx
   ACB7 8C 05 80      [ 4] 5265         cpx     #0x0580
   ACBA 25 03         [ 3] 5266         bcs     LAC82  
   ACBC CE 05 00      [ 3] 5267         ldx     #0x0500
   ACBF                    5268 LAC82:
   ACBF DF 44         [ 4] 5269         stx     (0x0044)
   ACC1 20 2C         [ 3] 5270         bra     LACB2  
   ACC3                    5271 LAC86:
   ACC3 A6 01         [ 4] 5272         ldaa    1,X     
   ACC5 27 25         [ 3] 5273         beq     LACAF  
   ACC7 B7 10 00      [ 4] 5274         staa    PORTA  
   ACCA B6 10 02      [ 4] 5275         ldaa    PORTG  
   ACCD 84 FB         [ 2] 5276         anda    #0xFB
   ACCF 8A 08         [ 2] 5277         oraa    #0x08
   ACD1 B7 10 02      [ 4] 5278         staa    PORTG  
   ACD4 84 FD         [ 2] 5279         anda    #0xFD
   ACD6 B7 10 02      [ 4] 5280         staa    PORTG  
   ACD9 8A 02         [ 2] 5281         oraa    #0x02
   ACDB B7 10 02      [ 4] 5282         staa    PORTG  
   ACDE 08            [ 3] 5283         inx
   ACDF 08            [ 3] 5284         inx
   ACE0 8C 05 80      [ 4] 5285         cpx     #0x0580
   ACE3 25 03         [ 3] 5286         bcs     LACAB  
   ACE5 CE 05 00      [ 3] 5287         ldx     #0x0500
   ACE8                    5288 LACAB:
   ACE8 DF 44         [ 4] 5289         stx     (0x0044)
   ACEA 20 03         [ 3] 5290         bra     LACB2  
   ACEC                    5291 LACAF:
   ACEC 7F 00 43      [ 6] 5292         clr     (0x0043)
                           5293 
                           5294 ; divide by 4
   ACEF                    5295 LACB2:
   ACEF 96 4F         [ 3] 5296         ldaa    (0x004F)
   ACF1 4C            [ 2] 5297         inca
   ACF2 97 4F         [ 3] 5298         staa    (0x004F)
   ACF4 81 04         [ 2] 5299         cmpa    #0x04
   ACF6 26 30         [ 3] 5300         bne     LACEB  
   ACF8 7F 00 4F      [ 6] 5301         clr     (0x004F)
                           5302 
                           5303 ; here every 10ms
                           5304 ; Five big countdown timers available here
                           5305 ; up to 655.35 seconds each
                           5306 
   ACFB DC 1B         [ 4] 5307         ldd     CDTIMR1         ; countdown 0x001B/1C every 10ms
   ACFD 27 05         [ 3] 5308         beq     LACC7           ; if not already 0
   ACFF 83 00 01      [ 4] 5309         subd    #0x0001
   AD02 DD 1B         [ 4] 5310         std     CDTIMR1
                           5311 
   AD04                    5312 LACC7:
   AD04 DC 1D         [ 4] 5313         ldd     CDTIMR2         ; same with 0x001D/1E
   AD06 27 05         [ 3] 5314         beq     LACD0  
   AD08 83 00 01      [ 4] 5315         subd    #0x0001
   AD0B DD 1D         [ 4] 5316         std     CDTIMR2
                           5317 
   AD0D                    5318 LACD0:
   AD0D DC 1F         [ 4] 5319         ldd     CDTIMR3         ; same with 0x001F/20
   AD0F 27 05         [ 3] 5320         beq     LACD9  
   AD11 83 00 01      [ 4] 5321         subd    #0x0001
   AD14 DD 1F         [ 4] 5322         std     CDTIMR3
                           5323 
   AD16                    5324 LACD9:
   AD16 DC 21         [ 4] 5325         ldd     CDTIMR4         ; same with 0x0021/22
   AD18 27 05         [ 3] 5326         beq     LACE2  
   AD1A 83 00 01      [ 4] 5327         subd    #0x0001
   AD1D DD 21         [ 4] 5328         std     CDTIMR4
                           5329 
   AD1F                    5330 LACE2:
   AD1F DC 23         [ 4] 5331         ldd     CDTIMR5         ; same with 0x0023/24
   AD21 27 05         [ 3] 5332         beq     LACEB  
   AD23 83 00 01      [ 4] 5333         subd    #0x0001
   AD26 DD 23         [ 4] 5334         std     CDTIMR5
                           5335 
                           5336 ; every other time through this, setup a task switch?
   AD28                    5337 LACEB:
   AD28 96 B0         [ 3] 5338         ldaa    (TSCNT)
   AD2A 88 01         [ 2] 5339         eora    #0x01
   AD2C 97 B0         [ 3] 5340         staa    (TSCNT)
   AD2E 27 18         [ 3] 5341         beq     LAD0B  
                           5342 
   AD30 BF 01 3C      [ 5] 5343         sts     (0x013C)        ; switch stacks???
   AD33 BE 01 3E      [ 5] 5344         lds     (0x013E)
   AD36 DC 10         [ 4] 5345         ldd     T1NXT
   AD38 83 01 F4      [ 4] 5346         subd    #0x01F4         ; 625-500 = 125?
   AD3B FD 10 18      [ 5] 5347         std     TOC2            ; set this TOC2 to happen 0.5ms
   AD3E 86 40         [ 2] 5348         ldaa    #0x40           ; after the current TOC1 but before the next TOC1
   AD40 B7 10 23      [ 4] 5349         staa    TFLG1           ; clear timer2 irq flag, just in case?
   AD43 86 C0         [ 2] 5350         ldaa    #0xC0           ;
   AD45 B7 10 22      [ 4] 5351         staa    TMSK1           ; enable TOC1 and TOC2
   AD48                    5352 LAD0B:
   AD48 3B            [12] 5353         rti
                           5354 
                           5355 ; TOC2 Timer handler and SWI handler
   AD49                    5356 LAD0C:
   AD49 86 40         [ 2] 5357         ldaa    #0x40
   AD4B B7 10 23      [ 4] 5358         staa    TFLG1           ; clear timer2 flag
   AD4E BF 01 3E      [ 5] 5359         sts     (0x013E)        ; switch stacks back???
   AD51 BE 01 3C      [ 5] 5360         lds     (0x013C)
   AD54 86 80         [ 2] 5361         ldaa    #0x80
   AD56 B7 10 22      [ 4] 5362         staa    TMSK1           ; enable TOC1 only
   AD59 3B            [12] 5363         rti
                           5364 
                           5365 ; Secondary task??
                           5366 
   AD5A                    5367 TASK2:
   AD5A 7D 04 2A      [ 6] 5368         tst     (0x042A)
   AD5D 27 35         [ 3] 5369         beq     LAD57
   AD5F 96 B6         [ 3] 5370         ldaa    (0x00B6)
   AD61 26 03         [ 3] 5371         bne     LAD29
   AD63 3F            [14] 5372         swi
   AD64 20 F4         [ 3] 5373         bra     TASK2
   AD66                    5374 LAD29:
   AD66 7F 00 B6      [ 6] 5375         clr     (0x00B6)
   AD69 C6 04         [ 2] 5376         ldab    #0x04
   AD6B                    5377 LAD2E:
   AD6B 37            [ 3] 5378         pshb
   AD6C CE AD 79      [ 3] 5379         ldx     #LAD3C
   AD6F BD 8A 2A      [ 6] 5380         jsr     L8A1A  
   AD72 3F            [14] 5381         swi
   AD73 33            [ 4] 5382         pulb
   AD74 5A            [ 2] 5383         decb
   AD75 26 F4         [ 3] 5384         bne     LAD2E  
   AD77 20 E1         [ 3] 5385         bra     TASK2
                           5386 
   AD79                    5387 LAD3C:
   AD79 53 31 00           5388         .asciz     'S1'
                           5389 
   AD7C FC 02 9C      [ 5] 5390         ldd     (0x029C)
   AD7F 1A 83 00 01   [ 5] 5391         cpd     #0x0001         ; 1
   AD83 27 0C         [ 3] 5392         beq     LAD54  
   AD85 1A 83 03 E8   [ 5] 5393         cpd     #0x03E8         ; 1000
   AD89 2D 09         [ 3] 5394         blt     LAD57  
   AD8B 1A 83 04 4B   [ 5] 5395         cpd     #0x044B         ; 1099
   AD8F 22 03         [ 3] 5396         bhi     LAD57  
   AD91                    5397 LAD54:
   AD91 3F            [14] 5398         swi
   AD92 20 C6         [ 3] 5399         bra     TASK2
   AD94                    5400 LAD57:
   AD94 7F 00 B3      [ 6] 5401         clr     (0x00B3)
   AD97 BD AD BB      [ 6] 5402         jsr     LAD7E
   AD9A BD AD DD      [ 6] 5403         jsr     LADA0
   AD9D 25 BB         [ 3] 5404         bcs     TASK2
   AD9F C6 0A         [ 2] 5405         ldab    #0x0A
   ADA1 BD AE 50      [ 6] 5406         jsr     LAE13
   ADA4 BD AD EB      [ 6] 5407         jsr     LADAE
   ADA7 25 B1         [ 3] 5408         bcs     TASK2
   ADA9 C6 14         [ 2] 5409         ldab    #0x14
   ADAB BD AE 50      [ 6] 5410         jsr     LAE13
   ADAE BD AD F3      [ 6] 5411         jsr     LADB6
   ADB1 25 A7         [ 3] 5412         bcs     TASK2
   ADB3                    5413 LAD76:
   ADB3 BD AD F5      [ 6] 5414         jsr     LADB8
   ADB6 0D            [ 2] 5415         sec
   ADB7 25 A1         [ 3] 5416         bcs     TASK2
   ADB9 20 F8         [ 3] 5417         bra     LAD76
   ADBB                    5418 LAD7E:
   ADBB CE AE 5B      [ 3] 5419         ldx     #LAE1E          ;+++
   ADBE BD 8A 2A      [ 6] 5420         jsr     L8A1A  
   ADC1 C6 1E         [ 2] 5421         ldab    #0x1E
   ADC3 BD AE 50      [ 6] 5422         jsr     LAE13
   ADC6 CE AE 5F      [ 3] 5423         ldx     #LAE22          ;ATH
   ADC9 BD 8A 2A      [ 6] 5424         jsr     L8A1A  
   ADCC C6 1E         [ 2] 5425         ldab    #0x1E
   ADCE BD AE 50      [ 6] 5426         jsr     LAE13
   ADD1 CE AE 64      [ 3] 5427         ldx     #LAE27          ;ATZ
   ADD4 BD 8A 2A      [ 6] 5428         jsr     L8A1A  
   ADD7 C6 1E         [ 2] 5429         ldab    #0x1E
   ADD9 BD AE 50      [ 6] 5430         jsr     LAE13
   ADDC 39            [ 5] 5431         rts
   ADDD                    5432 LADA0:
   ADDD BD B2 1A      [ 6] 5433         jsr     LB1DD
   ADE0 25 FB         [ 3] 5434         bcs     LADA0  
   ADE2 BD B2 8C      [ 6] 5435         jsr     LB24F
                           5436 
   ADE5 52 49 4E 47 00     5437         .asciz  'RING'
                           5438 
   ADEA 39            [ 5] 5439         rts
                           5440 
   ADEB                    5441 LADAE:
   ADEB CE AE 69      [ 3] 5442         ldx     #LAE2C
   ADEE BD 8A 2A      [ 6] 5443         jsr     L8A1A           ;ATA
   ADF1 0C            [ 2] 5444         clc
   ADF2 39            [ 5] 5445         rts
   ADF3                    5446 LADB6:
   ADF3 0C            [ 2] 5447         clc
   ADF4 39            [ 5] 5448         rts
                           5449 
   ADF5                    5450 LADB8:
   ADF5 BD B2 0F      [ 6] 5451         jsr     LB1D2
   ADF8 BD AE 6E      [ 6] 5452         jsr     LAE31
   ADFB 86 01         [ 2] 5453         ldaa    #0x01
   ADFD 97 B3         [ 3] 5454         staa    (0x00B3)
   ADFF BD B2 1A      [ 6] 5455         jsr     LB1DD
   AE02 BD B2 AE      [ 6] 5456         jsr     LB271
   AE05 36            [ 3] 5457         psha
   AE06 BD B2 FD      [ 6] 5458         jsr     LB2C0
   AE09 32            [ 4] 5459         pula
   AE0A 81 01         [ 2] 5460         cmpa    #0x01
   AE0C 26 08         [ 3] 5461         bne     LADD9  
   AE0E CE B2 D2      [ 3] 5462         ldx     #LB295
   AE11 BD 8A 2A      [ 6] 5463         jsr     L8A1A           ;'You have selected #1'
   AE14 20 31         [ 3] 5464         bra     LAE0A  
   AE16                    5465 LADD9:
   AE16 81 02         [ 2] 5466         cmpa    #0x02
   AE18 26 00         [ 3] 5467         bne     LADDD  
   AE1A                    5468 LADDD:
   AE1A 81 03         [ 2] 5469         cmpa    #0x03
   AE1C 26 00         [ 3] 5470         bne     LADE1  
   AE1E                    5471 LADE1:
   AE1E 81 04         [ 2] 5472         cmpa    #0x04
   AE20 26 00         [ 3] 5473         bne     LADE5  
   AE22                    5474 LADE5:
   AE22 81 05         [ 2] 5475         cmpa    #0x05
   AE24 26 00         [ 3] 5476         bne     LADE9  
   AE26                    5477 LADE9:
   AE26 81 06         [ 2] 5478         cmpa    #0x06
   AE28 26 00         [ 3] 5479         bne     LADED  
   AE2A                    5480 LADED:
   AE2A 81 07         [ 2] 5481         cmpa    #0x07
   AE2C 26 00         [ 3] 5482         bne     LADF1  
   AE2E                    5483 LADF1:
   AE2E 81 08         [ 2] 5484         cmpa    #0x08
   AE30 26 00         [ 3] 5485         bne     LADF5  
   AE32                    5486 LADF5:
   AE32 81 09         [ 2] 5487         cmpa    #0x09
   AE34 26 00         [ 3] 5488         bne     LADF9  
   AE36                    5489 LADF9:
   AE36 81 0A         [ 2] 5490         cmpa    #0x0A
   AE38 26 00         [ 3] 5491         bne     LADFD  
   AE3A                    5492 LADFD:
   AE3A 81 0B         [ 2] 5493         cmpa    #0x0B
   AE3C 26 09         [ 3] 5494         bne     LAE0A  
   AE3E CE B2 E7      [ 3] 5495         ldx     #LB2AA          ;'You have selected #11'
   AE41 BD 8A 2A      [ 6] 5496         jsr     L8A1A  
   AE44 7E AE 47      [ 3] 5497         jmp     LAE0A
   AE47                    5498 LAE0A:
   AE47 C6 14         [ 2] 5499         ldab    #0x14
   AE49 BD AE 50      [ 6] 5500         jsr     LAE13
   AE4C 7F 00 B3      [ 6] 5501         clr     (0x00B3)
   AE4F 39            [ 5] 5502         rts
                           5503 
   AE50                    5504 LAE13:
   AE50 CE 00 20      [ 3] 5505         ldx     #0x0020
   AE53                    5506 LAE16:
   AE53 3F            [14] 5507         swi
   AE54 09            [ 3] 5508         dex
   AE55 26 FC         [ 3] 5509         bne     LAE16  
   AE57 5A            [ 2] 5510         decb
   AE58 26 F6         [ 3] 5511         bne     LAE13  
   AE5A 39            [ 5] 5512         rts
                           5513 
                           5514 ; text??
   AE5B                    5515 LAE1E:
   AE5B 2B 2B 2B 00        5516         .asciz      '+++'
   AE5F                    5517 LAE22:
   AE5F 41 54 48 0D 00     5518         .asciz      'ATH\r'
   AE64                    5519 LAE27:
   AE64 41 54 5A 0D 00     5520         .asciz      'ATZ\r'
   AE69                    5521 LAE2C:
   AE69 41 54 41 0D 00     5522         .asciz      'ATA\r'
                           5523 
   AE6E                    5524 LAE31:
   AE6E CE AE 75      [ 3] 5525         ldx     #LAE38          ; big long string of stats, with compressed ansi codes
   AE71 BD 8A 2A      [ 6] 5526         jsr     L8A1A  
   AE74 39            [ 5] 5527         rts
                           5528 
   AE75                    5529 LAE38:
   AE75 5E 30 31 30 31 53  5530         .ascii  "^0101Serial #:^0140#0000^0111~4"
        65 72 69 61 6C 20
        23 3A 5E 30 31 34
        30 23 30 30 30 30
        5E 30 31 31 31 7E
        34
   AE94 0E 20              5531         .byte   0x0E,0x20
   AE96 5E 30 31 34 31 7C  5532         .ascii  "^0141|"
   AE9C 04 28              5533         .byte   0x04,0x28
   AE9E 5E 30 33 30 31 43  5534         .ascii  "^0301CURRENT^0340HISTORY^0501Show Status:^0540Total # reg. shows:^0601Random Status:^0570|"
        55 52 52 45 4E 54
        5E 30 33 34 30 48
        49 53 54 4F 52 59
        5E 30 35 30 31 53
        68 6F 77 20 53 74
        61 74 75 73 3A 5E
        30 35 34 30 54 6F
        74 61 6C 20 23 20
        72 65 67 2E 20 73
        68 6F 77 73 3A 5E
        30 36 30 31 52 61
        6E 64 6F 6D 20 53
        74 61 74 75 73 3A
        5E 30 35 37 30 7C
   AEF8 04 10              5535         .byte   0x04,0x10
   AEFA 5E 30 36 34 30 54  5536         .ascii  "^0640Total # live shows:^0701Current Reg Tape #:^0670|"
        6F 74 61 6C 20 23
        20 6C 69 76 65 20
        73 68 6F 77 73 3A
        5E 30 37 30 31 43
        75 72 72 65 6E 74
        20 52 65 67 20 54
        61 70 65 20 23 3A
        5E 30 36 37 30 7C
   AF30 04 12              5537         .byte   0x04,0x12
   AF32 5E 30 37 33 30 7E  5538         .ascii  "^0730~3"
        33
   AF39 04 02              5539         .byte   0x04,0x02
   AF3B 5E 30 37 34 30 54  5540         .ascii  "^0740Total # failed pswd attempts:^0801Current Live Tape #:^0770|"
        6F 74 61 6C 20 23
        20 66 61 69 6C 65
        64 20 70 73 77 64
        20 61 74 74 65 6D
        70 74 73 3A 5E 30
        38 30 31 43 75 72
        72 65 6E 74 20 4C
        69 76 65 20 54 61
        70 65 20 23 3A 5E
        30 37 37 30 7C
   AF7C 04 14              5541         .byte   0x04,0x14
   AF7E 5E 30 38 33 30 7E  5542         .ascii  "^0830~3"
        33
   AF85 04 05              5543         .byte   0x04,0x05
   AF87 5E 30 38 34 30 54  5544         .ascii  "^0840Total # successful pswd:^0901Current Version #:^0870|"
        6F 74 61 6C 20 23
        20 73 75 63 63 65
        73 73 66 75 6C 20
        70 73 77 64 3A 5E
        30 39 30 31 43 75
        72 72 65 6E 74 20
        56 65 72 73 69 6F
        6E 20 23 3A 5E 30
        38 37 30 7C
   AFC1 04 16              5545         .byte   0x04,0x16
   AFC3 5E 30 39 33 30 40  5546         .ascii  "^0930@"
   AFC9 04 00              5547         .byte   0x04,0x00
   AFCB 5E 30 39 34 30 54  5548         .ascii  "^0940Total # bdays played:^1040Total # VCR adjusts:^0970|"
        6F 74 61 6C 20 23
        20 62 64 61 79 73
        20 70 6C 61 79 65
        64 3A 5E 31 30 34
        30 54 6F 74 61 6C
        20 23 20 56 43 52
        20 61 64 6A 75 73
        74 73 3A 5E 30 39
        37 30 7C
   B004 04 18              5549         .byte   0x04,0x18
   B006 5E 31 30 37 30 7C  5550         .ascii  "^1070|"
   B00C 04 1A              5551         .byte   0x04,0x1A
   B00E 5E 31 31 34 30 54  5552         .ascii  "^1140Total # remote accesses:^1240Total # access attempts:^1170|"
        6F 74 61 6C 20 23
        20 72 65 6D 6F 74
        65 20 61 63 63 65
        73 73 65 73 3A 5E
        31 32 34 30 54 6F
        74 61 6C 20 23 20
        61 63 63 65 73 73
        20 61 74 74 65 6D
        70 74 73 3A 5E 31
        31 37 30 7C
   B04E 04 1C              5553         .byte   0x04,0x1C
   B050 5E 31 32 37 30 7C  5554         .ascii  "^1270|"
   B056 04 1E              5555         .byte   0x04,0x1E
   B058 5E 31 33 34 30 54  5556         .ascii  "^1340Total # rejected showtapes:^1440Total # Short bdays:^1370|"
        6F 74 61 6C 20 23
        20 72 65 6A 65 63
        74 65 64 20 73 68
        6F 77 74 61 70 65
        73 3A 5E 31 34 34
        30 54 6F 74 61 6C
        20 23 20 53 68 6F
        72 74 20 62 64 61
        79 73 3A 5E 31 33
        37 30 7C
   B097 04 20              5557         .byte   0x04,0x20
   B099 5E 31 34 37 30 7C  5558         .ascii  "^1470|"
   B09F 04 22              5559         .byte   0x04,0x22
   B0A1 5E 31 35 34 30 54  5560         .ascii  "^1540Total # Reg bdays:^1640Total # resets-pwr ups:^1570|"
        6F 74 61 6C 20 23
        20 52 65 67 20 62
        64 61 79 73 3A 5E
        31 36 34 30 54 6F
        74 61 6C 20 23 20
        72 65 73 65 74 73
        2D 70 77 72 20 75
        70 73 3A 5E 31 35
        37 30 7C
   B0DA 04 24              5561         .byte   0x04,0x24
   B0DC 5E 31 36 37 30 7C  5562         .ascii  "^1670|"
   B0E2 04 26              5563         .byte   0x04,0x26
   B0E4 5E 31 38 30 31 46  5564         .ascii  "^1801FUNCTIONS^1823Select Function:^20011.Clear rnd enables^2028 6.Set loc name-#^205411.Diagnostics^21012.Set rnd enables^2128 7.Set Time^215412.^22013.Set reg tape #^2228 8.Disbl-enbl show^225413.^23014.Set liv tape #^2328 9.Upload program^235414.^24015.Reset history^242810.Debugger^245415.^1840"
        55 4E 43 54 49 4F
        4E 53 5E 31 38 32
        33 53 65 6C 65 63
        74 20 46 75 6E 63
        74 69 6F 6E 3A 5E
        32 30 30 31 31 2E
        43 6C 65 61 72 20
        72 6E 64 20 65 6E
        61 62 6C 65 73 5E
        32 30 32 38 20 36
        2E 53 65 74 20 6C
        6F 63 20 6E 61 6D
        65 2D 23 5E 32 30
        35 34 31 31 2E 44
        69 61 67 6E 6F 73
        74 69 63 73 5E 32
        31 30 31 32 2E 53
        65 74 20 72 6E 64
        20 65 6E 61 62 6C
        65 73 5E 32 31 32
        38 20 37 2E 53 65
        74 20 54 69 6D 65
        5E 32 31 35 34 31
        32 2E 5E 32 32 30
        31 33 2E 53 65 74
        20 72 65 67 20 74
        61 70 65 20 23 5E
        32 32 32 38 20 38
        2E 44 69 73 62 6C
        2D 65 6E 62 6C 20
        73 68 6F 77 5E 32
        32 35 34 31 33 2E
        5E 32 33 30 31 34
        2E 53 65 74 20 6C
        69 76 20 74 61 70
        65 20 23 5E 32 33
        32 38 20 39 2E 55
        70 6C 6F 61 64 20
        70 72 6F 67 72 61
        6D 5E 32 33 35 34
        31 34 2E 5E 32 34
        30 31 35 2E 52 65
        73 65 74 20 68 69
        73 74 6F 72 79 5E
        32 34 32 38 31 30
        2E 44 65 62 75 67
        67 65 72 5E 32 34
        35 34 31 35 2E 5E
        31 38 34 30
   B20E 00                 5565         .byte   0x00
                           5566 
   B20F                    5567 LB1D2:
   B20F CE B2 15      [ 3] 5568         ldx     #LB1D8          ; escape sequence?
   B212 7E 8A 2A      [ 3] 5569         jmp     L8A1A  
                           5570 
                           5571 ; ANSI control sequence - Clear Screen and Home Cursor
   B215                    5572 LB1D8:
                           5573         ; esc[2J
   B215 1B                 5574         .byte   0x1b
   B216 5B 32 4A 00        5575         .asciz  '[2J'
                           5576 
   B21A                    5577 LB1DD:
   B21A CE 05 A0      [ 3] 5578         ldx     #0x05A0
   B21D CC 00 00      [ 3] 5579         ldd     #0x0000
   B220 FD 02 9E      [ 5] 5580         std     (0x029E)
   B223                    5581 LB1E6:
   B223 FC 02 9E      [ 5] 5582         ldd     (0x029E)
   B226 C3 00 01      [ 4] 5583         addd    #0x0001
   B229 FD 02 9E      [ 5] 5584         std     (0x029E)
   B22C 1A 83 0F A0   [ 5] 5585         cpd     #0x0FA0
   B230 24 28         [ 3] 5586         bcc     LB21D  
   B232 BD B2 60      [ 6] 5587         jsr     LB223
   B235 25 04         [ 3] 5588         bcs     LB1FE  
   B237 3F            [14] 5589         swi
   B238 20 E9         [ 3] 5590         bra     LB1E6  
   B23A 39            [ 5] 5591         rts
                           5592 
   B23B                    5593 LB1FE:
   B23B A7 00         [ 4] 5594         staa    0,X     
   B23D 08            [ 3] 5595         inx
   B23E 81 0D         [ 2] 5596         cmpa    #0x0D
   B240 26 02         [ 3] 5597         bne     LB207  
   B242 20 18         [ 3] 5598         bra     LB21F  
   B244                    5599 LB207:
   B244 81 1B         [ 2] 5600         cmpa    #0x1B
   B246 26 02         [ 3] 5601         bne     LB20D  
   B248 20 10         [ 3] 5602         bra     LB21D  
   B24A                    5603 LB20D:
   B24A 7D 00 B3      [ 6] 5604         tst     (0x00B3)
   B24D 27 03         [ 3] 5605         beq     LB215  
   B24F BD 8B 4B      [ 6] 5606         jsr     L8B3B
   B252                    5607 LB215:
   B252 CC 00 00      [ 3] 5608         ldd     #0x0000
   B255 FD 02 9E      [ 5] 5609         std     (0x029E)
   B258 20 C9         [ 3] 5610         bra     LB1E6  
   B25A                    5611 LB21D:
   B25A 0D            [ 2] 5612         sec
   B25B 39            [ 5] 5613         rts
                           5614 
   B25C                    5615 LB21F:
   B25C 6F 00         [ 6] 5616         clr     0,X     
   B25E 0C            [ 2] 5617         clc
   B25F 39            [ 5] 5618         rts
                           5619 
   B260                    5620 LB223:
   B260 B6 18 0D      [ 4] 5621         ldaa    SCCCTRLA
   B263 44            [ 2] 5622         lsra
   B264 25 0B         [ 3] 5623         bcs     LB234  
   B266 4F            [ 2] 5624         clra
   B267 B7 18 0D      [ 4] 5625         staa    SCCCTRLA
   B26A 86 30         [ 2] 5626         ldaa    #0x30
   B26C B7 18 0D      [ 4] 5627         staa    SCCCTRLA
   B26F 0C            [ 2] 5628         clc
   B270 39            [ 5] 5629         rts
                           5630 
   B271                    5631 LB234:
   B271 86 01         [ 2] 5632         ldaa    #0x01
   B273 B7 18 0D      [ 4] 5633         staa    SCCCTRLA
   B276 86 70         [ 2] 5634         ldaa    #0x70
   B278 B5 18 0D      [ 4] 5635         bita    SCCCTRLA
   B27B 26 05         [ 3] 5636         bne     LB245  
   B27D 0D            [ 2] 5637         sec
   B27E B6 18 0F      [ 4] 5638         ldaa    SCCDATAA
   B281 39            [ 5] 5639         rts
                           5640 
   B282                    5641 LB245:
   B282 B6 18 0F      [ 4] 5642         ldaa    SCCDATAA
   B285 86 30         [ 2] 5643         ldaa    #0x30
   B287 B7 18 0C      [ 4] 5644         staa    SCCCTRLB
   B28A 0C            [ 2] 5645         clc
   B28B 39            [ 5] 5646         rts
                           5647 
   B28C                    5648 LB24F:
   B28C 38            [ 5] 5649         pulx
   B28D 18 CE 05 A0   [ 4] 5650         ldy     #0x05A0
   B291                    5651 LB254:
   B291 A6 00         [ 4] 5652         ldaa    0,X
   B293 27 11         [ 3] 5653         beq     LB269
   B295 08            [ 3] 5654         inx
   B296 18 A1 00      [ 5] 5655         cmpa    0,Y
   B299 26 04         [ 3] 5656         bne     LB262
   B29B 18 08         [ 4] 5657         iny
   B29D 20 F2         [ 3] 5658         bra     LB254
   B29F                    5659 LB262:
   B29F A6 00         [ 4] 5660         ldaa    0,X
   B2A1 27 07         [ 3] 5661         beq     LB26D
   B2A3 08            [ 3] 5662         inx
   B2A4 20 F9         [ 3] 5663         bra     LB262
   B2A6                    5664 LB269:
   B2A6 08            [ 3] 5665         inx
   B2A7 3C            [ 4] 5666         pshx
   B2A8 0C            [ 2] 5667         clc
   B2A9 39            [ 5] 5668         rts
   B2AA                    5669 LB26D:
   B2AA 08            [ 3] 5670         inx
   B2AB 3C            [ 4] 5671         pshx
   B2AC 0D            [ 2] 5672         sec
   B2AD 39            [ 5] 5673         rts
                           5674 
   B2AE                    5675 LB271:
   B2AE CE 05 A0      [ 3] 5676         ldx     #0x05A0
   B2B1                    5677 LB274:
   B2B1 A6 00         [ 4] 5678         ldaa    0,X
   B2B3 08            [ 3] 5679         inx
   B2B4 81 0D         [ 2] 5680         cmpa    #0x0D
   B2B6 26 F9         [ 3] 5681         bne     LB274
   B2B8 09            [ 3] 5682         dex
   B2B9 09            [ 3] 5683         dex
   B2BA A6 00         [ 4] 5684         ldaa    0,X
   B2BC 09            [ 3] 5685         dex
   B2BD 80 30         [ 2] 5686         suba    #0x30
   B2BF 97 B2         [ 3] 5687         staa    (0x00B2)
   B2C1 8C 05 9F      [ 4] 5688         cpx     #0x059F
   B2C4 27 0B         [ 3] 5689         beq     LB294
   B2C6 A6 00         [ 4] 5690         ldaa    0,X
   B2C8 09            [ 3] 5691         dex
   B2C9 80 30         [ 2] 5692         suba    #0x30
   B2CB C6 0A         [ 2] 5693         ldab    #0x0A
   B2CD 3D            [10] 5694         mul
   B2CE 17            [ 2] 5695         tba
   B2CF 9B B2         [ 3] 5696         adda    (0x00B2)
   B2D1                    5697 LB294:
   B2D1 39            [ 5] 5698         rts
                           5699 
   B2D2                    5700 LB295:
   B2D2 59 6F 75 20 68 61  5701         .asciz  'You have selected #1'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 00
   B2E7                    5702 LB2AA:
   B2E7 59 6F 75 20 68 61  5703         .asciz  'You have selected #11'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 31 00
                           5704 
   B2FD                    5705 LB2C0:
   B2FD CE B3 04      [ 3] 5706         ldx     #LB2C7          ; Table with compressed ANSI cursor controls
   B300 BD 8A 2A      [ 6] 5707         jsr     L8A1A  
   B303 39            [ 5] 5708         rts
                           5709 
   B304                    5710 LB2C7:
   B304 5E 32 30 30 31 25  5711         .asciz  "^2001%^2101%^2201%^2301%^2401%^2001"
        5E 32 31 30 31 25
        5E 32 32 30 31 25
        5E 32 33 30 31 25
        5E 32 34 30 31 25
        5E 32 30 30 31 00
                           5712 
                           5713 ; Random movement tables
                           5714 
                           5715 ; board 1
   B328                    5716 LB2EB:
   B328 FA 20 FA 20 F6 22  5717         .byte   0xfa,0x20,0xfa,0x20,0xf6,0x22,0xf5,0x20
        F5 20
   B330 F5 20 F3 22 F2 20  5718         .byte   0xf5,0x20,0xf3,0x22,0xf2,0x20,0xe5,0x22
        E5 22
   B338 E5 22 E2 20 D2 20  5719         .byte   0xe5,0x22,0xe2,0x20,0xd2,0x20,0xbe,0x00
        BE 00
   B340 BC 22 BB 30 B9 32  5720         .byte   0xbc,0x22,0xbb,0x30,0xb9,0x32,0xb9,0x32
        B9 32
   B348 B7 30 B6 32 B5 30  5721         .byte   0xb7,0x30,0xb6,0x32,0xb5,0x30,0xb4,0x32
        B4 32
   B350 B4 32 B3 20 B3 20  5722         .byte   0xb4,0x32,0xb3,0x20,0xb3,0x20,0xb1,0xa0
        B1 A0
   B358 B1 A0 B0 A2 AF A0  5723         .byte   0xb1,0xa0,0xb0,0xa2,0xaf,0xa0,0xaf,0xa6
        AF A6
   B360 AE A0 AE A6 AD A4  5724         .byte   0xae,0xa0,0xae,0xa6,0xad,0xa4,0xac,0xa0
        AC A0
   B368 AC A0 AB A0 AA A0  5725         .byte   0xac,0xa0,0xab,0xa0,0xaa,0xa0,0xaa,0xa0
        AA A0
   B370 A2 80 A0 A0 A0 A0  5726         .byte   0xa2,0x80,0xa0,0xa0,0xa0,0xa0,0x8d,0x80
        8D 80
   B378 8A A0 7E 80 7B A0  5727         .byte   0x8a,0xa0,0x7e,0x80,0x7b,0xa0,0x79,0xa4
        79 A4
   B380 78 A0 77 A4 76 A0  5728         .byte   0x78,0xa0,0x77,0xa4,0x76,0xa0,0x75,0xa4
        75 A4
   B388 74 A0 73 A4 72 A0  5729         .byte   0x74,0xa0,0x73,0xa4,0x72,0xa0,0x71,0xa4
        71 A4
   B390 70 A0 6F A4 6E A0  5730         .byte   0x70,0xa0,0x6f,0xa4,0x6e,0xa0,0x6d,0xa4
        6D A4
   B398 6C A0 69 80 69 80  5731         .byte   0x6c,0xa0,0x69,0x80,0x69,0x80,0x67,0xa0
        67 A0
   B3A0 5E 20 58 24 57 20  5732         .byte   0x5e,0x20,0x58,0x24,0x57,0x20,0x57,0x20
        57 20
   B3A8 56 24 55 20 54 24  5733         .byte   0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24
        54 24
   B3B0 53 20 52 24 52 24  5734         .byte   0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20
        50 20
   B3B8 4F 24 4E 20 4D 24  5735         .byte   0x4f,0x24,0x4e,0x20,0x4d,0x24,0x4c,0x20
        4C 20
   B3C0 4C 20 4B 24 4A 20  5736         .byte   0x4c,0x20,0x4b,0x24,0x4a,0x20,0x49,0x20
        49 20
   B3C8 49 00 48 20 47 20  5737         .byte   0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20
        47 20
   B3D0 46 20 45 24 45 24  5738         .byte   0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20
        44 20
   B3D8 42 20 42 20 37 04  5739         .byte   0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20
        35 20
   B3E0 2E 04 2E 04 2D 20  5740         .byte   0x2e,0x04,0x2e,0x04,0x2d,0x20,0x23,0x24
        23 24
   B3E8 21 20 17 24 13 00  5741         .byte   0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24
        11 24
   B3F0 10 30 07 34 06 30  5742         .byte   0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30
        05 30
   B3F8 FF FF              5743         .byte   0xff,0xff
                           5744 
                           5745 ; board 2
   B3FA                    5746 LB3BD:
   B3FA D7 22 D5 20 C9 22  5747         .byte   0xd7,0x22,0xd5,0x20,0xc9,0x22,0xc7,0x20
        C7 20
   B402 C4 24 C3 20 C2 24  5748         .byte   0xc4,0x24,0xc3,0x20,0xc2,0x24,0xc1,0x20
        C1 20
   B40A BF 24 BF 24 BE 20  5749         .byte   0xbf,0x24,0xbf,0x24,0xbe,0x20,0xbd,0x24
        BD 24
   B412 BC 20 BB 24 BA 20  5750         .byte   0xbc,0x20,0xbb,0x24,0xba,0x20,0xb9,0x20
        B9 20
   B41A B8 24 B7 20 B4 00  5751         .byte   0xb8,0x24,0xb7,0x20,0xb4,0x00,0xb4,0x00
        B4 00
   B422 B2 20 A9 20 A3 20  5752         .byte   0xb2,0x20,0xa9,0x20,0xa3,0x20,0xa2,0x20
        A2 20
   B42A A1 20 A0 20 A0 20  5753         .byte   0xa1,0x20,0xa0,0x20,0xa0,0x20,0x9f,0x20
        9F 20
   B432 9F 20 9E 20 9D 24  5754         .byte   0x9f,0x20,0x9e,0x20,0x9d,0x24,0x9d,0x24
        9D 24
   B43A 9B 20 9A 24 99 20  5755         .byte   0x9b,0x20,0x9a,0x24,0x99,0x20,0x98,0x20
        98 20
   B442 97 24 97 24 95 20  5756         .byte   0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20
        95 20
   B44A 94 00 94 00 93 20  5757         .byte   0x94,0x00,0x94,0x00,0x93,0x20,0x92,0x00
        92 00
   B452 92 00 91 20 90 20  5758         .byte   0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20
        90 20
   B45A 8F 20 8D 20 8D 20  5759         .byte   0x8f,0x20,0x8d,0x20,0x8d,0x20,0x81,0x00
        81 00
   B462 7F 20 79 00 79 00  5760         .byte   0x7f,0x20,0x79,0x00,0x79,0x00,0x78,0x20
        78 20
   B46A 76 20 6B 00 69 20  5761         .byte   0x76,0x20,0x6b,0x00,0x69,0x20,0x5e,0x00
        5E 00
   B472 5C 20 5B 30 52 10  5762         .byte   0x5c,0x20,0x5b,0x30,0x52,0x10,0x51,0x30
        51 30
   B47A 50 30 50 30 4F 20  5763         .byte   0x50,0x30,0x50,0x30,0x4f,0x20,0x4e,0x20
        4E 20
   B482 4E 20 4D 20 46 A0  5764         .byte   0x4e,0x20,0x4d,0x20,0x46,0xa0,0x45,0xa0
        45 A0
   B48A 3D A0 3D A0 39 20  5765         .byte   0x3d,0xa0,0x3d,0xa0,0x39,0x20,0x2a,0x00
        2A 00
   B492 28 20 1E 00 1C 22  5766         .byte   0x28,0x20,0x1e,0x00,0x1c,0x22,0x1c,0x22
        1C 22
   B49A 1B 20 1A 22 19 20  5767         .byte   0x1b,0x20,0x1a,0x22,0x19,0x20,0x18,0x22
        18 22
   B4A2 18 22 16 20 15 22  5768         .byte   0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22
        15 22
   B4AA 14 A0 13 A2 11 A0  5769         .byte   0x14,0xa0,0x13,0xa2,0x11,0xa0,0xff,0xff
        FF FF
                           5770 
                           5771 ; board 4
   B4B2                    5772 LB475:
   B4B2 BE 00 BC 22 BB 30  5773         .byte   0xbe,0x00,0xbc,0x22,0xbb,0x30,0xb9,0x32
        B9 32
   B4BA B9 32 B7 30 B6 32  5774         .byte   0xb9,0x32,0xb7,0x30,0xb6,0x32,0xb5,0x30
        B5 30
   B4C2 B4 32 B4 32 B3 20  5775         .byte   0xb4,0x32,0xb4,0x32,0xb3,0x20,0xb3,0x20
        B3 20
   B4CA B1 A0 B1 A0 B0 A2  5776         .byte   0xb1,0xa0,0xb1,0xa0,0xb0,0xa2,0xaf,0xa0
        AF A0
   B4D2 AF A6 AE A0 AE A6  5777         .byte   0xaf,0xa6,0xae,0xa0,0xae,0xa6,0xad,0xa4
        AD A4
   B4DA AC A0 AC A0 AB A0  5778         .byte   0xac,0xa0,0xac,0xa0,0xab,0xa0,0xaa,0xa0
        AA A0
   B4E2 AA A0 A2 80 A0 A0  5779         .byte   0xaa,0xa0,0xa2,0x80,0xa0,0xa0,0xa0,0xa0
        A0 A0
   B4EA 8D 80 8A A0 7E 80  5780         .byte   0x8d,0x80,0x8a,0xa0,0x7e,0x80,0x7b,0xa0
        7B A0
   B4F2 79 A4 78 A0 77 A4  5781         .byte   0x79,0xa4,0x78,0xa0,0x77,0xa4,0x76,0xa0
        76 A0
   B4FA 75 A4 74 A0 73 A4  5782         .byte   0x75,0xa4,0x74,0xa0,0x73,0xa4,0x72,0xa0
        72 A0
   B502 71 A4 70 A0 6F A4  5783         .byte   0x71,0xa4,0x70,0xa0,0x6f,0xa4,0x6e,0xa0
        6E A0
   B50A 6D A4 6C A0 69 80  5784         .byte   0x6d,0xa4,0x6c,0xa0,0x69,0x80,0x69,0x80
        69 80
   B512 67 A0 5E 20 58 24  5785         .byte   0x67,0xa0,0x5e,0x20,0x58,0x24,0x57,0x20
        57 20
   B51A 57 20 56 24 55 20  5786         .byte   0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24
        54 24
   B522 54 24 53 20 52 24  5787         .byte   0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24
        52 24
   B52A 50 20 4F 24 4E 20  5788         .byte   0x50,0x20,0x4f,0x24,0x4e,0x20,0x4d,0x24
        4D 24
   B532 4C 20 4C 20 4B 24  5789         .byte   0x4c,0x20,0x4c,0x20,0x4b,0x24,0x4a,0x20
        4A 20
   B53A 49 20 49 00 48 20  5790         .byte   0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20
        47 20
   B542 47 20 46 20 45 24  5791         .byte   0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24
        45 24
   B54A 44 20 42 20 42 20  5792         .byte   0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04
        37 04
   B552 35 20 2E 04 2E 04  5793         .byte   0x35,0x20,0x2e,0x04,0x2e,0x04,0x2d,0x20
        2D 20
   B55A 23 24 21 20 17 24  5794         .byte   0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00
        13 00
   B562 11 24 10 30 07 34  5795         .byte   0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30
        06 30
   B56A 05 30 FF FF        5796         .byte   0x05,0x30,0xff,0xff
                           5797 
                           5798 ; board 3
   B56E                    5799 LB531:
   B56E CD 20 CC 20 CB 20  5800         .byte   0xcd,0x20,0xcc,0x20,0xcb,0x20,0xcb,0x20
        CB 20
   B576 CA 00 C9 20 C9 20  5801         .byte   0xca,0x00,0xc9,0x20,0xc9,0x20,0xc8,0x20
        C8 20
   B57E C1 A0 C0 A0 B8 A0  5802         .byte   0xc1,0xa0,0xc0,0xa0,0xb8,0xa0,0xb8,0x20
        B8 20
   B586 B4 20 A6 00 A4 20  5803         .byte   0xb4,0x20,0xa6,0x00,0xa4,0x20,0x99,0x00
        99 00
   B58E 97 22 97 22 96 20  5804         .byte   0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22
        95 22
   B596 94 20 93 22 93 22  5805         .byte   0x94,0x20,0x93,0x22,0x93,0x22,0x91,0x20
        91 20
   B59E 90 20 90 20 8D A0  5806         .byte   0x90,0x20,0x90,0x20,0x8d,0xa0,0x8c,0xa0
        8C A0
   B5A6 7D A2 7D A2 7B A0  5807         .byte   0x7d,0xa2,0x7d,0xa2,0x7b,0xa0,0x7b,0xa0
        7B A0
   B5AE 79 A2 79 A2 77 A0  5808         .byte   0x79,0xa2,0x79,0xa2,0x77,0xa0,0x77,0xa0
        77 A0
   B5B6 76 80 75 A0 6E 20  5809         .byte   0x76,0x80,0x75,0xa0,0x6e,0x20,0x67,0x24
        67 24
   B5BE 66 20 65 24 64 20  5810         .byte   0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24
        63 24
   B5C6 63 24 61 20 60 24  5811         .byte   0x63,0x24,0x61,0x20,0x60,0x24,0x5f,0x20
        5F 20
   B5CE 5E 20 5D 24 5C 20  5812         .byte   0x5e,0x20,0x5d,0x24,0x5c,0x20,0x5b,0x24
        5B 24
   B5D6 5A 20 59 24 58 20  5813         .byte   0x5a,0x20,0x59,0x24,0x58,0x20,0x56,0x20
        56 20
   B5DE 55 04 54 00 53 24  5814         .byte   0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20
        52 20
   B5E6 52 20 4F 24 4F 24  5815         .byte   0x52,0x20,0x4f,0x24,0x4f,0x24,0x4e,0x30
        4E 30
   B5EE 4D 30 47 10 45 30  5816         .byte   0x4d,0x30,0x47,0x10,0x45,0x30,0x35,0x30
        35 30
   B5F6 33 10 31 30 31 30  5817         .byte   0x33,0x10,0x31,0x30,0x31,0x30,0x1d,0x20
        1D 20
   B5FE FF FF              5818         .byte   0xff,0xff
                           5819 
                           5820 ; board 5
   B600                    5821 LB5C3:
   B600 A9 20 A3 20 A2 20  5822         .byte   0xa9,0x20,0xa3,0x20,0xa2,0x20,0xa1,0x20
        A1 20
   B608 A0 20 A0 20 9F 20  5823         .byte   0xa0,0x20,0xa0,0x20,0x9f,0x20,0x9f,0x20
        9F 20
   B610 9E 20 9D 24 9D 24  5824         .byte   0x9e,0x20,0x9d,0x24,0x9d,0x24,0x9b,0x20
        9B 20
   B618 9A 24 99 20 98 20  5825         .byte   0x9a,0x24,0x99,0x20,0x98,0x20,0x97,0x24
        97 24
   B620 97 24 95 20 95 20  5826         .byte   0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00
        94 00
   B628 94 00 93 20 92 00  5827         .byte   0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00
        92 00
   B630 91 20 90 20 90 20  5828         .byte   0x91,0x20,0x90,0x20,0x90,0x20,0x8f,0x20
        8F 20
   B638 8D 20 8D 20 81 00  5829         .byte   0x8d,0x20,0x8d,0x20,0x81,0x00,0x7f,0x20
        7F 20
   B640 79 00 79 00 78 20  5830         .byte   0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20
        76 20
   B648 6B 00 69 20 5E 00  5831         .byte   0x6b,0x00,0x69,0x20,0x5e,0x00,0x5c,0x20
        5C 20
   B650 5B 30 52 10 51 30  5832         .byte   0x5b,0x30,0x52,0x10,0x51,0x30,0x50,0x30
        50 30
   B658 50 30 4F 20 4E 20  5833         .byte   0x50,0x30,0x4f,0x20,0x4e,0x20,0x4e,0x20
        4E 20
   B660 4D 20 46 A0 45 A0  5834         .byte   0x4d,0x20,0x46,0xa0,0x45,0xa0,0x3d,0xa0
        3D A0
   B668 3D A0 39 20 2A 00  5835         .byte   0x3d,0xa0,0x39,0x20,0x2a,0x00,0x28,0x20
        28 20
   B670 1E 00 1C 22 1C 22  5836         .byte   0x1e,0x00,0x1c,0x22,0x1c,0x22,0x1b,0x20
        1B 20
   B678 1A 22 19 20 18 22  5837         .byte   0x1a,0x22,0x19,0x20,0x18,0x22,0x18,0x22
        18 22
   B680 16 20 15 22 15 22  5838         .byte   0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xa0
        14 A0
   B688 13 A2 11 A0        5839         .byte   0x13,0xa2,0x11,0xa0
                           5840 
                           5841 ; All empty (0xFFs) in this gap
                           5842 
   F780                    5843         .org    0xF780
                           5844 
                           5845 ; Two Tables used by data protocol handler
                           5846 
   F780                    5847 LF780:
   F780 57 0B 00 00 00 00  5848         .byte   0x57,0x0b,0x00,0x00,0x00,0x00,0x08,0x00
        08 00
   F788 00 00 20 00 00 00  5849         .byte   0x00,0x00,0x20,0x00,0x00,0x00,0x80,0x00
        80 00
   F790 00 00 00 00 00 04  5850         .byte   0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
        00 00
   F798 00 10 00 00 00 00  5851         .byte   0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
                           5852 
   F7A0                    5853 LF7A0:
   F7A0 40 12 20 09 80 24  5854         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x02,0x00
        02 00
   F7A8 40 12 20 09 80 24  5855         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x04,0x00
        04 00
   F7B0 00 00 00 00 00 00  5856         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
   F7B8 00 00 00 00 08 00  5857         .byte   0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        00 00
                           5858 
   F7C0                    5859 LF7C0:
   F7C0 01                 5860         .byte   0x01
                           5861 ;
                           5862 ; All empty (0xFFs) in this gap
                           5863 ;
   F800                    5864         .org    0xF800
                           5865 ; Reset
   F800                    5866 RESET:
   F800 0F            [ 2] 5867         sei                     ; disable interrupts
   F801 86 03         [ 2] 5868         ldaa    #0x03
   F803 B7 10 24      [ 4] 5869         staa    TMSK2           ; disable irqs, set prescaler to 16
   F806 86 80         [ 2] 5870         ldaa    #0x80
   F808 B7 10 22      [ 4] 5871         staa    TMSK1           ; enable OC1 irq
   F80B 86 00         [ 2] 5872         ldaa    #0x00
   F80D B7 10 35      [ 4] 5873         staa    BPROT           ; protect ????
   F810 96 07         [ 3] 5874         ldaa    0x0007          ;
   F812 81 DB         [ 2] 5875         cmpa    #0xDB           ; special unprotect mode???
   F814 26 06         [ 3] 5876         bne     LF81C           ; if not, jump ahead
   F816 7F 10 35      [ 6] 5877         clr     BPROT           ; else unprotect everything
   F819 7F 00 07      [ 6] 5878         clr     0x0007          ; reset special unprotect mode???
   F81C                    5879 LF81C:
   F81C 8E 01 FF      [ 3] 5880         lds     #0x01FF         ; init SP
   F81F 86 A5         [ 2] 5881         ldaa    #0xA5
   F821 B7 10 5D      [ 4] 5882         staa    CSCTL           ; enable external IO:
                           5883                                 ; IO1EN,  BUSSEL, active LOW
                           5884                                 ; IO2EN,  PIA/SCCSEL, active LOW
                           5885                                 ; CSPROG, ROMSEL priority over RAMSEL 
                           5886                                 ; CSPROG, ROMSEL enabled, 32K, $8000-$FFFF
   F824 86 01         [ 2] 5887         ldaa    #0x01
   F826 B7 10 5F      [ 4] 5888         staa    CSGSIZ          ; CSGEN,  RAMSEL active low
                           5889                                 ; CSGEN,  RAMSEL 32K
   F829 86 00         [ 2] 5890         ldaa    #0x00
   F82B B7 10 5E      [ 4] 5891         staa    CSGADR          ; CSGEN,  RAMSEL = $0000-$7FFF (except internal regs)
   F82E 86 F0         [ 2] 5892         ldaa    #0xF0
   F830 B7 10 5C      [ 4] 5893         staa    CSSTRH          ; 3 cycle clock stretching on BUSSEL and LCRS
   F833 7F 00 00      [ 6] 5894         clr     0x0000          ; ????? Done with basic init?
                           5895 
                           5896 ; Initialize Main PIA
   F836 86 30         [ 2] 5897         ldaa    #0x30           ;
   F838 B7 18 05      [ 4] 5898         staa    PIA0CRA         ; control register A, CA2=0, sel DDRA
   F83B B7 18 07      [ 4] 5899         staa    PIA0CRB         ; control register B, CB2=0, sel DDRB
   F83E 86 FF         [ 2] 5900         ldaa    #0xFF
   F840 B7 18 06      [ 4] 5901         staa    PIA0DDRB        ; select B0-B7 to be outputs
   F843 86 78         [ 2] 5902         ldaa    #0x78           ;
   F845 B7 18 04      [ 4] 5903         staa    PIA0DDRA        ; select A3-A6 to be outputs
   F848 86 34         [ 2] 5904         ldaa    #0x34           ;
   F84A B7 18 05      [ 4] 5905         staa    PIA0CRA         ; select output register A
   F84D B7 18 07      [ 4] 5906         staa    PIA0CRB         ; select output register B
   F850 C6 FF         [ 2] 5907         ldab    #0xFF
   F852 BD FA F9      [ 6] 5908         jsr     BUTNLIT         ; turn on all button lights
   F855 20 13         [ 3] 5909         bra     LF86A           ; jump past data table
                           5910 
                           5911 ; data table for aux serial config
   F857                    5912 LF857:
   F857 09 4A              5913         .byte   0x09,0x4a       ; channel reset B, MIE off, DLC on, no vector
   F859 01 10              5914         .byte   0x01,0x10       ; irq on all character received
   F85B 0C 18              5915         .byte   0x0c,0x18       ; Lower byte of time constant
   F85D 0D 00              5916         .byte   0x0d,0x00       ; Upper byte of time constant
   F85F 04 44              5917         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   F861 0E 63              5918         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   F863 05 68              5919         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   F865 0B 56              5920         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   F867 03 C1              5921         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           5922         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           5923         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   F869 FF                 5924         .byte   0xff            ; end of table marker
                           5925 
                           5926 ; init SCC (8530), aux serial config
   F86A                    5927 LF86A:
   F86A CE F8 57      [ 3] 5928         ldx     #LF857
   F86D                    5929 LF86D:
   F86D A6 00         [ 4] 5930         ldaa    0,X
   F86F 81 FF         [ 2] 5931         cmpa    #0xFF
   F871 27 06         [ 3] 5932         beq     LF879
   F873 B7 18 0D      [ 4] 5933         staa    SCCCTRLA
   F876 08            [ 3] 5934         inx
   F877 20 F4         [ 3] 5935         bra     LF86D
                           5936 
                           5937 ; Setup normal SCI, 8 data bits, 1 stop bit
                           5938 ; Interrupts disabled, Transmitter and Receiver enabled
                           5939 ; prescaler = /13, SCR=/1, rate = 19200 baud at 16Mhz clock
                           5940 
   F879                    5941 LF879:
   F879 86 00         [ 2] 5942         ldaa    #0x00
   F87B B7 10 2C      [ 4] 5943         staa    SCCR1
   F87E 86 0C         [ 2] 5944         ldaa    #0x0C
   F880 B7 10 2D      [ 4] 5945         staa    SCCR2
   F883 86 30         [ 2] 5946         ldaa    #0x30           ; NEW value
   F885 B7 10 2B      [ 4] 5947         staa    BAUD
                           5948 
                           5949 ; Initialize all RAM vectors to RTI: 
                           5950 ; Opcode 0x3b into vectors at 0x0100 through 0x0139
                           5951 
   F888 CE 01 00      [ 3] 5952         ldx     #0x0100
   F88B 86 3B         [ 2] 5953         ldaa    #0x3B           ; RTI opcode
   F88D                    5954 LF88D:
   F88D A7 00         [ 4] 5955         staa    0,X
   F88F 08            [ 3] 5956         inx
   F890 08            [ 3] 5957         inx
   F891 08            [ 3] 5958         inx
   F892 8C 01 3C      [ 4] 5959         cpx     #0x013C
   F895 25 F6         [ 3] 5960         bcs     LF88D
   F897 C6 F0         [ 2] 5961         ldab    #0xF0
   F899 F7 18 04      [ 4] 5962         stab    PIA0PRA         ; enable LCD backlight, disable RESET button light
   F89C 86 7E         [ 2] 5963         ldaa    #0x7E
   F89E 97 03         [ 3] 5964         staa    (0x0003)        ; Put a jump instruction here???
                           5965 
                           5966 ; Non-destructive ram test:
                           5967 ;
                           5968 ; HC11 Internal RAM: 0x0000-0x3ff
                           5969 ; External NVRAM:    0x2000-0x7fff
                           5970 ;
                           5971 ; Note:
                           5972 ; External NVRAM:    0x0400-0xfff is also available, but not tested
                           5973 
   F8A0 CE 00 00      [ 3] 5974         ldx     #0x0000
   F8A3                    5975 LF8A3:
   F8A3 E6 00         [ 4] 5976         ldab    0,X             ; save value
   F8A5 86 55         [ 2] 5977         ldaa    #0x55
   F8A7 A7 00         [ 4] 5978         staa    0,X
   F8A9 A1 00         [ 4] 5979         cmpa    0,X
   F8AB 26 19         [ 3] 5980         bne     LF8C6
   F8AD 49            [ 2] 5981         rola
   F8AE A7 00         [ 4] 5982         staa    0,X
   F8B0 A1 00         [ 4] 5983         cmpa    0,X
   F8B2 26 12         [ 3] 5984         bne     LF8C6
   F8B4 E7 00         [ 4] 5985         stab    0,X             ; restore value
   F8B6 08            [ 3] 5986         inx
   F8B7 8C 04 00      [ 4] 5987         cpx     #0x0400
   F8BA 26 03         [ 3] 5988         bne     LF8BF
   F8BC CE 20 00      [ 3] 5989         ldx     #0x2000
   F8BF                    5990 LF8BF:  
   F8BF 8C 80 00      [ 4] 5991         cpx     #0x8000
   F8C2 26 DF         [ 3] 5992         bne     LF8A3
   F8C4 20 04         [ 3] 5993         bra     LF8CA
                           5994 
   F8C6                    5995 LF8C6:
   F8C6 86 01         [ 2] 5996         ldaa    #0x01           ; Mark Failed RAM test
   F8C8 97 00         [ 3] 5997         staa    (0x0000)
                           5998 ; 
   F8CA                    5999 LF8CA:
   F8CA C6 01         [ 2] 6000         ldab    #0x01
   F8CC BD FA C9      [ 6] 6001         jsr     DIAGDGT         ; write digit 1 to diag display
   F8CF B6 10 35      [ 4] 6002         ldaa    BPROT  
   F8D2 26 0F         [ 3] 6003         bne     LF8E3           ; if something is protected, jump ahead
   F8D4 B6 30 00      [ 4] 6004         ldaa    (0x3000)        ; NVRAM
   F8D7 81 7E         [ 2] 6005         cmpa    #0x7E
   F8D9 26 08         [ 3] 6006         bne     LF8E3           ; if RAM(0x3000) == 0x7E, jump ahead anyway (special unlock?)
                           6007 
                           6008 ; error?
   F8DB C6 0E         [ 2] 6009         ldab    #0x0E
   F8DD BD FA C9      [ 6] 6010         jsr     DIAGDGT         ; write digit E to diag display
   F8E0 7E 30 00      [ 3] 6011         jmp     (0x3000)        ; jump to routine in NVRAM?
                           6012 
                           6013 ; checking for serial connection
                           6014 
   F8E3                    6015 LF8E3:
   F8E3 CE F0 00      [ 3] 6016         ldx     #0xF000         ; timeout counter
   F8E6                    6017 LF8E6:
   F8E6 01            [ 2] 6018         nop
   F8E7 01            [ 2] 6019         nop
   F8E8 09            [ 3] 6020         dex
   F8E9 27 0B         [ 3] 6021         beq     LF8F6           ; if time is up, jump ahead
   F8EB BD FA 79      [ 6] 6022         jsr     SERIALR         ; else read serial data if available
   F8EE 24 F6         [ 3] 6023         bcc     LF8E6           ; if no data available, loop
   F8F0 81 1B         [ 2] 6024         cmpa    #0x1B           ; if serial data was read, is it an ESC?
   F8F2 27 3B         [ 3] 6025         beq     LF91D           ; if so, jump to echo hex char routine?
   F8F4 20 F0         [ 3] 6026         bra     LF8E6           ; else loop
   F8F6                    6027 LF8F6:
   F8F6 B6 40 00      [ 4] 6028         ldaa    0x4000          ; NEW
   F8F9 81 7E         [ 2] 6029         cmpa    #0x7E        
   F8FB 26 0B         [ 3] 6030         bne     LF908N
                           6031 
   F8FD C6 0A         [ 2] 6032         ldab    #0x0A
   F8FF BD FA C9      [ 6] 6033         jsr     DIAGDGT         ; else write digit A to diag display
                           6034 
   F902 BD 40 00      [ 6] 6035         jsr     0x4000          ; NEW - jump to ????
   F905 0F            [ 2] 6036         sei                     ; if we ever come return, just loop and do it all again
   F906 20 27         [ 3] 6037         bra     LF91D
   F908                    6038 LF908N:
   F908 B6 80 00      [ 4] 6039         ldaa    L8000           ; check if this is a regular rom?
   F90B 81 7E         [ 2] 6040         cmpa    #0x7E        
   F90D 26 0B         [ 3] 6041         bne     MINIMON
                           6042 
                           6043 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6044 
   F90F C6 0A         [ 2] 6045         ldab    #0x0A           ; NEW - ??
   F911 BD FA C9      [ 6] 6046         jsr     DIAGDGT         ; NEW - A to display?
   F914 BD 80 00      [ 6] 6047         jsr     0x8000          ; NEW
   F917 0F            [ 2] 6048         sei                     ; NEW
   F918 20 15         [ 3] 6049         bra     LF91D           ; NEW
                           6050 
   F91A                    6051 MINIMON:
   F91A C6 10         [ 2] 6052         ldab    #0x10           ; not a regular rom
   F91C BD FA C9      [ 6] 6053         jsr     DIAGDGT         ; blank the diag display
                           6054 
   F91F BD FB 0C      [ 6] 6055         jsr     SERMSGW         ; enter the mini-monitor???
   F922 4D 49 4E 49 2D 4D  6056         .ascis  'MINI-MON'
        4F CE
                           6057 
   F92A C6 10         [ 2] 6058         ldab    #0x10
   F92C BD FA C9      [ 6] 6059         jsr     DIAGDGT         ; blank the diag display
                           6060 
   F92F                    6061 LF91D:
   F92F 7F 00 05      [ 6] 6062         clr     (0x0005)
   F932 7F 00 04      [ 6] 6063         clr     (0x0004)
   F935 7F 00 02      [ 6] 6064         clr     (0x0002)
   F938 7F 00 06      [ 6] 6065         clr     (0x0006)
                           6066 
   F93B BD FB 0C      [ 6] 6067         jsr     SERMSGW
   F93E 0D 0A BE           6068         .ascis  '\r\n>'
                           6069 
                           6070 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6071 
                           6072 ; NEW - All new code here
   F941                    6073 LF941N:
   F941 BD FA BB      [ 6] 6074         jsr     LF987               ; get a character from serial
   F944 97 01         [ 3] 6075         staa    (0x0001)            ; save it
   F946 81 30         [ 2] 6076         cmpa    #0x30
   F948 25 3B         [ 3] 6077         bcs     LF985N              ; lower than 0, jump
   F94A 81 39         [ 2] 6078         cmpa    #0x39
   F94C 22 0D         [ 3] 6079         bhi     LF95BN              ; higher that 9, jump
   F94E                    6080 LF94EN:
   F94E 48            [ 2] 6081         asla                        ; get nybble into 
   F94F 48            [ 2] 6082         asla
   F950 48            [ 2] 6083         asla
   F951 48            [ 2] 6084         asla
   F952 C6 04         [ 2] 6085         ldab    #0x04               
   F954 7D 00 02      [ 6] 6086         tst     (0x0002)
   F957 2A 0E         [ 3] 6087         bpl     LF967N
   F959 2B 18         [ 3] 6088         bmi     LF973N
   F95B                    6089 LF95BN:
   F95B 81 41         [ 2] 6090         cmpa    #0x41               ;'A'
   F95D 25 26         [ 3] 6091         bcs     LF985N
   F95F 81 47         [ 2] 6092         cmpa    #0x47               ;'G'
   F961 24 22         [ 3] 6093         bcc     LF985N
   F963 80 37         [ 2] 6094         suba    #0x37               ; convert to nybble
   F965 20 E7         [ 3] 6095         bra     LF94EN
   F967                    6096 LF967N:
   F967 49            [ 2] 6097         rola
   F968 79 00 05      [ 6] 6098         rol     (0x0005)
   F96B 79 00 04      [ 6] 6099         rol     (0x0004)
   F96E 5A            [ 2] 6100         decb
   F96F 26 F6         [ 3] 6101         bne     LF967N
   F971 27 0B         [ 3] 6102         beq     LF97EN
   F973                    6103 LF973N:
   F973 49            [ 2] 6104         rola
   F974 79 00 06      [ 6] 6105         rol     0x0006
   F977 5A            [ 2] 6106         decb
   F978 26 F9         [ 3] 6107         bne     LF973N
   F97A 86 C0         [ 2] 6108         ldaa    #0xC0
   F97C 97 02         [ 3] 6109         staa    0x0002
   F97E                    6110 LF97EN:
   F97E 96 01         [ 3] 6111         ldaa    0x0001
   F980                    6112 LF980N:
   F980 BD FA A3      [ 6] 6113         jsr     SERIALW
   F983 20 BC         [ 3] 6114         bra     LF941N
   F985                    6115 LF985N:
   F985 81 3A         [ 2] 6116         cmpa    #0x3A               ;':'
   F987 26 06         [ 3] 6117         bne     LF98FN
   F989 C6 80         [ 2] 6118         ldab    #0x80
   F98B D7 02         [ 3] 6119         stab    0x0002
   F98D 20 F1         [ 3] 6120         bra     LF980N
   F98F                    6121 LF98FN:
   F98F 81 47         [ 2] 6122         cmpa    #0x47               ;'G'
   F991 26 08         [ 3] 6123         bne     LF99BN
   F993 BD FA A3      [ 6] 6124         jsr     SERIALW
   F996 9D 03         [ 5] 6125         jsr     0x0003
   F998 7E F9 2F      [ 3] 6126         jmp     LF91D
   F99B                    6127 LF99BN:
   F99B 81 2F         [ 2] 6128         cmpa    #0x2F               ;'/'
   F99D 26 0D         [ 3] 6129         bne     LF9ACN
   F99F 20 1C         [ 3] 6130         bra     LF9BDN
   F9A1                    6131 LF9A1N:
   F9A1 BD FA A3      [ 6] 6132         jsr     SERIALW
   F9A4 BD F9 D9      [ 6] 6133         jsr     LF9D9N
   F9A7 7F 00 02      [ 6] 6134         clr     0x0002
   F9AA 20 95         [ 3] 6135         bra     LF941N
   F9AC                    6136 LF9ACN:
   F9AC 81 2E         [ 2] 6137         cmpa    #0x2E               ;'.'
   F9AE 26 14         [ 3] 6138         bne     LF9C4N
   F9B0 86 5E         [ 2] 6139         ldaa    #0x5E               ;'^'
   F9B2 BD FA A3      [ 6] 6140         jsr     SERIALW
   F9B5 7C 00 05      [ 6] 6141         inc     0x0005
   F9B8 26 03         [ 3] 6142         bne     LF9BDN
   F9BA 7C 00 04      [ 6] 6143         inc     0x0004
   F9BD                    6144 LF9BDN:
   F9BD BD FA 6C      [ 6] 6145         jsr     LFA6CN
   F9C0 86 2F         [ 2] 6146         ldaa    #0x2F               ;'/'
   F9C2 20 DD         [ 3] 6147         bra     LF9A1N
   F9C4                    6148 LF9C4N:
   F9C4 81 2C         [ 2] 6149         cmpa    #0x2C               ;','
   F9C6 26 2D         [ 3] 6150         bne     LF9F5N
   F9C8 86 21         [ 2] 6151         ldaa    #0x21               ;'!'
   F9CA BD FA A3      [ 6] 6152         jsr     SERIALW
   F9CD 96 05         [ 3] 6153         ldaa    0x0005
   F9CF 26 03         [ 3] 6154         bne     LF9D4N
   F9D1 7A 00 04      [ 6] 6155         dec     0x0004
   F9D4                    6156 LF9D4N:
   F9D4 7A 00 05      [ 6] 6157         dec     0x0005
   F9D7 20 E4         [ 3] 6158         bra     LF9BDN
   F9D9                    6159 LF9D9N:
   F9D9 18 DE 04      [ 5] 6160         ldy     0x0004
   F9DC 18 A6 00      [ 5] 6161         ldaa    0,Y
                           6162 
                           6163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6164 
                           6165 ; convert A to 2 hex digits and transmit
   F9DF                    6166 SERHEXW:
   F9DF 36            [ 3] 6167         psha
   F9E0 44            [ 2] 6168         lsra
   F9E1 44            [ 2] 6169         lsra
   F9E2 44            [ 2] 6170         lsra
   F9E3 44            [ 2] 6171         lsra
   F9E4 BD F9 E8      [ 6] 6172         jsr     LF938
   F9E7 32            [ 4] 6173         pula
   F9E8                    6174 LF938:
   F9E8 84 0F         [ 2] 6175         anda    #0x0F
   F9EA 8A 30         [ 2] 6176         oraa    #0x30
   F9EC 81 3A         [ 2] 6177         cmpa    #0x3A
   F9EE 25 02         [ 3] 6178         bcs     LF942
   F9F0 8B 07         [ 2] 6179         adda    #0x07
   F9F2                    6180 LF942:
   F9F2 7E FA A3      [ 3] 6181         jmp     SERIALW
                           6182 
                           6183 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6184 
                           6185 ; NEW - - All new code here
   F9F5                    6186 LF9F5N:
   F9F5 81 0D         [ 2] 6187         cmpa    #0x0D               ;CR
   F9F7 26 20         [ 3] 6188         bne     LFA19N
   F9F9 4F            [ 2] 6189         clra
   F9FA                    6190 LF9FAN:
   F9FA D6 02         [ 3] 6191         ldab    0x0002
   F9FC C4 40         [ 2] 6192         andb    #0x40
   F9FE 97 02         [ 3] 6193         staa    0x0002
   FA00 5D            [ 2] 6194         tstb
   FA01 27 10         [ 3] 6195         beq     LFA13N
   FA03 96 06         [ 3] 6196         ldaa    0x0006
   FA05 18 DE 04      [ 5] 6197         ldy     0x0004
   FA08 18 A7 00      [ 5] 6198         staa    0,Y
   FA0B 7C 00 05      [ 6] 6199         inc     0x0005
   FA0E 26 03         [ 3] 6200         bne     LFA13N
   FA10 7C 00 04      [ 6] 6201         inc     0x0004
   FA13                    6202 LFA13N:
   FA13 7F 00 06      [ 6] 6203         clr     0x0006
   FA16 7E F9 7E      [ 3] 6204         jmp     LF97EN
   FA19                    6205 LFA19N:
   FA19 81 20         [ 2] 6206         cmpa    #0x20               ;' '
   FA1B 26 04         [ 3] 6207         bne     LFA21N
   FA1D 86 80         [ 2] 6208         ldaa    #0x80
   FA1F 20 D9         [ 3] 6209         bra     LF9FAN
   FA21                    6210 LFA21N:
   FA21 81 0A         [ 2] 6211         cmpa    #0x0A               ;LF
   FA23 26 03         [ 3] 6212         bne     LFA28N
   FA25 7E F9 2F      [ 3] 6213         jmp     LF91D
   FA28                    6214 LFA28N:
   FA28 81 57         [ 2] 6215         cmpa    #0x57               ;'W'
   FA2A 26 08         [ 3] 6216         bne     LFA34N
   FA2C BD FB 0C      [ 6] 6217         jsr     SERMSGW
   FA2F 57 4F 4F 46 A1     6218         .ascis  'WOOF!'
   FA34                    6219 LFA34N:
   FA34 81 4C         [ 2] 6220         cmpa    #0x4C               ;'L'
   FA36 26 2F         [ 3] 6221         bne     LFA67N
   FA38 BD FA A9      [ 6] 6222         jsr     LF975
   FA3B                    6223 LFA3BN:
   FA3B CE 00 00      [ 3] 6224         ldx     #0x0000
   FA3E BD FA 6F      [ 6] 6225         jsr     LFA6FN
   FA41 86 3A         [ 2] 6226         ldaa    #0x3A               ;':'
   FA43 BD FA A3      [ 6] 6227         jsr     SERIALW
   FA46                    6228 LFA46N:
   FA46 BD F9 D9      [ 6] 6229         jsr     LF9D9N
   FA49 86 20         [ 2] 6230         ldaa    #0x20               ;' '
   FA4B 08            [ 3] 6231         inx
   FA4C 8C 00 10      [ 4] 6232         cpx     #0x0010
   FA4F 25 02         [ 3] 6233         bcs     LFA53N
   FA51 86 0D         [ 2] 6234         ldaa    #0x0D               ;CR
   FA53                    6235 LFA53N:
   FA53 7C 00 05      [ 6] 6236         inc     0x0005
   FA56 26 03         [ 3] 6237         bne     LFA5BN
   FA58 7C 00 04      [ 6] 6238         inc     0x0004
   FA5B                    6239 LFA5BN:
   FA5B BD FA A3      [ 6] 6240         jsr     SERIALW
   FA5E 81 20         [ 2] 6241         cmpa    #0x20               ;' '
   FA60 27 E4         [ 3] 6242         beq     LFA46N
   FA62 BD FA 79      [ 6] 6243         jsr     SERIALR
   FA65 24 D4         [ 3] 6244         bcc     LFA3BN
   FA67                    6245 LFA67N:
   FA67 86 07         [ 2] 6246         ldaa    #0x07               ;BEL
   FA69 7E F9 80      [ 3] 6247         jmp     LF980N
   FA6C                    6248 LFA6CN:
   FA6C BD FA A9      [ 6] 6249         jsr     LF975
   FA6F                    6250 LFA6FN:
   FA6F 96 04         [ 3] 6251         ldaa    0x0004
   FA71 BD F9 DF      [ 6] 6252         jsr     SERHEXW
   FA74 96 05         [ 3] 6253         ldaa    0x0005
   FA76 7E F9 DF      [ 3] 6254         jmp     SERHEXW
                           6255 
                           6256 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6257 
                           6258 ; serial read non-blocking
   FA79                    6259 SERIALR:
   FA79 B6 10 2E      [ 4] 6260         ldaa    SCSR  
   FA7C 85 20         [ 2] 6261         bita    #0x20
   FA7E 26 09         [ 3] 6262         bne     LF955
   FA80 0C            [ 2] 6263         clc
   FA81 39            [ 5] 6264         rts
                           6265 
                           6266 ; serial blocking read
   FA82                    6267 SERBLKR:
   FA82 B6 10 2E      [ 4] 6268         ldaa    SCSR            ; read serial status
   FA85 85 20         [ 2] 6269         bita    #0x20
   FA87 27 F9         [ 3] 6270         beq     SERBLKR         ; if RDRF=0, loop
                           6271 
                           6272 ; read serial data, (assumes it's ready)
   FA89                    6273 LF955:
   FA89 B6 10 2E      [ 4] 6274         ldaa    SCSR            ; read serial status
   FA8C 85 02         [ 2] 6275         bita    #0x02
   FA8E 26 09         [ 3] 6276         bne     LF965           ; if FE=1, clear it
   FA90 85 08         [ 2] 6277         bita    #0x08
   FA92 26 05         [ 3] 6278         bne     LF965           ; if OR=1, clear it
   FA94 B6 10 2F      [ 4] 6279         ldaa    SCDR            ; otherwise, good data
   FA97 0D            [ 2] 6280         sec
   FA98 39            [ 5] 6281         rts
                           6282 
   FA99                    6283 LF965:
   FA99 B6 10 2F      [ 4] 6284         ldaa    SCDR            ; clear any error
   FA9C 86 2F         [ 2] 6285         ldaa    #0x2F           ; '/'   
   FA9E BD FA A3      [ 6] 6286         jsr     SERIALW
   FAA1 20 DF         [ 3] 6287         bra     SERBLKR         ; go to wait for a character
                           6288 
                           6289 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6290 
                           6291 ; Send A to SCI with CR turned to CRLF
   FAA3                    6292 SERIALW:
   FAA3 81 0D         [ 2] 6293         cmpa    #0x0D           ; CR?
   FAA5 27 02         [ 3] 6294         beq     LF975           ; if so echo CR+LF
   FAA7 20 07         [ 3] 6295         bra     SERRAWW         ; else just echo it
   FAA9                    6296 LF975:
   FAA9 86 0D         [ 2] 6297         ldaa    #0x0D
   FAAB BD FA B0      [ 6] 6298         jsr     SERRAWW
   FAAE 86 0A         [ 2] 6299         ldaa    #0x0A
                           6300 
                           6301 ; send a char to SCI
   FAB0                    6302 SERRAWW:
   FAB0 F6 10 2E      [ 4] 6303         ldab    SCSR            ; wait for ready to send
   FAB3 C5 40         [ 2] 6304         bitb    #0x40
   FAB5 27 F9         [ 3] 6305         beq     SERRAWW
   FAB7 B7 10 2F      [ 4] 6306         staa    SCDR            ; send it
   FABA 39            [ 5] 6307         rts
                           6308 
                           6309 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6310 
   FABB                    6311 LF987:
   FABB BD FA 82      [ 6] 6312         jsr     SERBLKR         ; get a serial char
   FABE 81 7A         [ 2] 6313         cmpa    #0x7A           ;'z'
   FAC0 22 06         [ 3] 6314         bhi     LF994
   FAC2 81 61         [ 2] 6315         cmpa    #0x61           ;'a'
   FAC4 25 02         [ 3] 6316         bcs     LF994
   FAC6 82 20         [ 2] 6317         sbca    #0x20           ;convert to upper case?
   FAC8                    6318 LF994:
   FAC8 39            [ 5] 6319         rts
                           6320 
                           6321 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6322 
                           6323 ; Write hex digit arg in B to diagnostic lights
                           6324 ; or B=0x10 or higher for blank
                           6325 
   FAC9                    6326 DIAGDGT:
   FAC9 36            [ 3] 6327         psha
   FACA C1 11         [ 2] 6328         cmpb    #0x11
   FACC 25 02         [ 3] 6329         bcs     LF99C
   FACE C6 10         [ 2] 6330         ldab    #0x10
   FAD0                    6331 LF99C:
   FAD0 CE FA E8      [ 3] 6332         ldx     #LF9B4
   FAD3 3A            [ 3] 6333         abx
   FAD4 A6 00         [ 4] 6334         ldaa    0,X
   FAD6 B7 18 06      [ 4] 6335         staa    PIA0PRB         ; write arg to local data bus
   FAD9 B6 18 04      [ 4] 6336         ldaa    PIA0PRA         ; read from Port A
   FADC 8A 20         [ 2] 6337         oraa    #0x20           ; bit 5 high
   FADE B7 18 04      [ 4] 6338         staa    PIA0PRA         ; write back to Port A
   FAE1 84 DF         [ 2] 6339         anda    #0xDF           ; bit 5 low
   FAE3 B7 18 04      [ 4] 6340         staa    PIA0PRA         ; write back to Port A
   FAE6 32            [ 4] 6341         pula
   FAE7 39            [ 5] 6342         rts
                           6343 
                           6344 ; 7 segment patterns - XGFEDCBA
   FAE8                    6345 LF9B4:
   FAE8 C0                 6346         .byte   0xc0            ; 0
   FAE9 F9                 6347         .byte   0xf9            ; 1
   FAEA A4                 6348         .byte   0xa4            ; 2
   FAEB B0                 6349         .byte   0xb0            ; 3
   FAEC 99                 6350         .byte   0x99            ; 4
   FAED 92                 6351         .byte   0x92            ; 5
   FAEE 82                 6352         .byte   0x82            ; 6
   FAEF F8                 6353         .byte   0xf8            ; 7
   FAF0 80                 6354         .byte   0x80            ; 8
   FAF1 90                 6355         .byte   0x90            ; 9
   FAF2 88                 6356         .byte   0x88            ; A 
   FAF3 83                 6357         .byte   0x83            ; b
   FAF4 C6                 6358         .byte   0xc6            ; C
   FAF5 A1                 6359         .byte   0xa1            ; d
   FAF6 86                 6360         .byte   0x86            ; E
   FAF7 8E                 6361         .byte   0x8e            ; F
   FAF8 FF                 6362         .byte   0xff            ; blank
                           6363 
                           6364 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6365 
                           6366 ; Write arg in B to Button Lights
   FAF9                    6367 BUTNLIT:
   FAF9 36            [ 3] 6368         psha
   FAFA F7 18 06      [ 4] 6369         stab    PIA0PRB         ; write arg to local data bus
   FAFD B6 18 04      [ 4] 6370         ldaa    PIA0PRA         ; read from Port A
   FB00 84 EF         [ 2] 6371         anda    #0xEF           ; bit 4 low
   FB02 B7 18 04      [ 4] 6372         staa    PIA0PRA         ; write back to Port A
   FB05 8A 10         [ 2] 6373         oraa    #0x10           ; bit 4 high
   FB07 B7 18 04      [ 4] 6374         staa    PIA0PRA         ; write this to Port A
   FB0A 32            [ 4] 6375         pula
   FB0B 39            [ 5] 6376         rts
                           6377 
                           6378 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6379 
                           6380 ; Send rom message via SCI
   FB0C                    6381 SERMSGW:
   FB0C 18 38         [ 6] 6382         puly
   FB0E                    6383 LF9DA:
   FB0E 18 A6 00      [ 5] 6384         ldaa    0,Y
   FB11 27 09         [ 3] 6385         beq     LF9E8           ; if zero terminated, return
   FB13 2B 0C         [ 3] 6386         bmi     LF9ED           ; if high bit set..do last char and return
   FB15 BD FA B0      [ 6] 6387         jsr     SERRAWW         ; else send char
   FB18 18 08         [ 4] 6388         iny
   FB1A 20 F2         [ 3] 6389         bra     LF9DA           ; and loop for next one
                           6390 
   FB1C                    6391 LF9E8:
   FB1C 18 08         [ 4] 6392         iny                     ; setup return address and return
   FB1E 18 3C         [ 5] 6393         pshy
   FB20 39            [ 5] 6394         rts
                           6395 
   FB21                    6396 LF9ED:
   FB21 84 7F         [ 2] 6397         anda    #0x7F           ; remove top bit
   FB23 BD FA B0      [ 6] 6398         jsr     SERRAWW         ; send char
   FB26 20 F4         [ 3] 6399         bra     LF9E8           ; and we're done
   FB28 39            [ 5] 6400         rts
                           6401 
   FB29                    6402 DORTS:
   FB29 39            [ 5] 6403         rts
   FB2A                    6404 DORTI:        
   FB2A 3B            [12] 6405         rti
                           6406 
                           6407 ; all 0xffs in this gap
                           6408 
   FFA0                    6409         .org    0xFFA0
                           6410 
   FFA0 7E FB 29      [ 3] 6411         jmp     DORTS
   FFA3 7E FB 29      [ 3] 6412         jmp     DORTS
   FFA6 7E FB 29      [ 3] 6413         jmp     DORTS
   FFA9 7E F9 DF      [ 3] 6414         jmp     SERHEXW
   FFAC 7E FB 0C      [ 3] 6415         jmp     SERMSGW      
   FFAF 7E FA 79      [ 3] 6416         jmp     SERIALR     
   FFB2 7E FA A3      [ 3] 6417         jmp     SERIALW      
   FFB5 7E F9 1A      [ 3] 6418         jmp     MINIMON
   FFB8 7E FA C9      [ 3] 6419         jmp     DIAGDGT 
   FFBB 7E FA F9      [ 3] 6420         jmp     BUTNLIT 
                           6421 
   FFBE FF                 6422        .byte    0xff
   FFBF FF                 6423        .byte    0xff
                           6424 
                           6425 ; Vectors
                           6426 
   FFC0 FB 2A              6427        .word   DORTI            ; Stub RTI
   FFC2 FB 2A              6428        .word   DORTI            ; Stub RTI
   FFC4 FB 2A              6429        .word   DORTI            ; Stub RTI
   FFC6 FB 2A              6430        .word   DORTI            ; Stub RTI
   FFC8 FB 2A              6431        .word   DORTI            ; Stub RTI
   FFCA FB 2A              6432        .word   DORTI            ; Stub RTI
   FFCC FB 2A              6433        .word   DORTI            ; Stub RTI
   FFCE FB 2A              6434        .word   DORTI            ; Stub RTI
   FFD0 FB 2A              6435        .word   DORTI            ; Stub RTI
   FFD2 FB 2A              6436        .word   DORTI            ; Stub RTI
   FFD4 FB 2A              6437        .word   DORTI            ; Stub RTI
                           6438 
   FFD6 01 00              6439         .word  0x0100           ; SCI
   FFD8 01 03              6440         .word  0x0103           ; SPI
   FFDA 01 06              6441         .word  0x0106           ; PA accum. input edge
   FFDC 01 09              6442         .word  0x0109           ; PA Overflow
                           6443 
   FFDE FB 2A              6444         .word  DORTI            ; Stub RTI
                           6445 
   FFE0 01 0C              6446         .word  0x010c           ; TI4O5
   FFE2 01 0F              6447         .word  0x010f           ; TOC4
   FFE4 01 12              6448         .word  0x0112           ; TOC3
   FFE6 01 15              6449         .word  0x0115           ; TOC2
   FFE8 01 18              6450         .word  0x0118           ; TOC1
   FFEA 01 1B              6451         .word  0x011b           ; TIC3
   FFEC 01 1E              6452         .word  0x011e           ; TIC2
   FFEE 01 21              6453         .word  0x0121           ; TIC1
   FFF0 01 24              6454         .word  0x0124           ; RTI
   FFF2 01 27              6455         .word  0x0127           ; ~IRQ
   FFF4 01 2A              6456         .word  0x012a           ; XIRQ
   FFF6 01 2D              6457         .word  0x012d           ; SWI
   FFF8 01 30              6458         .word  0x0130           ; ILLEGAL OPCODE
   FFFA 01 33              6459         .word  0x0133           ; COP Failure
   FFFC 01 36              6460         .word  0x0136           ; COP Clock Monitor Fail
                           6461 
   FFFE F8 00              6462         .word  RESET            ; Reset
                           6463 
