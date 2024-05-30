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
   82AD 81 44         [ 2]  409         cmpa    #0x44           ;'$'
   82AF 26 03         [ 3]  410         bne     L82AB
   82B1 7E A3 A3      [ 3]  411         jmp     LA366           ; go to security code & setup utility
   82B4                     412 L82AB:
   82B4 81 53         [ 2]  413         cmpa    #0x53           ;'S'
   82B6 26 F2         [ 3]  414         bne     L82A1
                            415 
   82B8 BD FB 0C      [ 6]  416         jsr     SERMSGW      
   82BB 0A 0D 45 6E 74 65   417         .ascis  '\n\rEnter security code: '
        72 20 73 65 63 75
        72 69 74 79 20 63
        6F 64 65 3A A0
                            418 
   82D2 0F            [ 2]  419         sei
   82D3 BD A3 27      [ 6]  420         jsr     LA2EA
   82D6 0E            [ 2]  421         cli
   82D7 25 61         [ 3]  422         bcs     L8331
                            423 
   82D9 BD FB 0C      [ 6]  424         jsr     SERMSGW      
   82DC 0A 0D 45 45 50 52   425         .ascii '\n\rEEPROM serial number programming enabled.'
        4F 4D 20 73 65 72
        69 61 6C 20 6E 75
        6D 62 65 72 20 70
        72 6F 67 72 61 6D
        6D 69 6E 67 20 65
        6E 61 62 6C 65 64
        2E
   8307 0A 0D 50 6C 65 61   426         .ascis '\n\rPlease RESET the processor to continue\n\r'
        73 65 20 52 45 53
        45 54 20 74 68 65
        20 70 72 6F 63 65
        73 73 6F 72 20 74
        6F 20 63 6F 6E 74
        69 6E 75 65 0A 8D
                            427 
   8331 86 01         [ 2]  428         ldaa    #0x01           ; enable EEPROM erase
   8333 B7 04 0F      [ 4]  429         staa    ERASEFLG
   8336 86 DB         [ 2]  430         ldaa    #0xDB
   8338 97 07         [ 3]  431         staa    (0x0007)
                            432 ; need to reset to get out of this 
   833A 20 FE         [ 3]  433 L8331:  bra     L8331           ; infinite loop
                            434 
   833C                     435 L8333:
   833C 96 AA         [ 3]  436         ldaa    (0x00AA)
   833E 27 12         [ 3]  437         beq     L8349
   8340 DC 1B         [ 4]  438         ldd     CDTIMR1
   8342 26 0E         [ 3]  439         bne     L8349
   8344 D6 62         [ 3]  440         ldab    (0x0062)
   8346 C8 20         [ 2]  441         eorb    #0x20
   8348 D7 62         [ 3]  442         stab    (0x0062)
   834A BD FA F9      [ 6]  443         jsr     BUTNLIT 
   834D CC 00 32      [ 3]  444         ldd     #0x0032
   8350 DD 1B         [ 4]  445         std     CDTIMR1
   8352                     446 L8349:
   8352 BD 86 B2      [ 6]  447         jsr     L86A4
   8355 24 03         [ 3]  448         bcc     L8351
   8357 7E 82 73      [ 3]  449         jmp     L8276
   835A                     450 L8351:
   835A F6 10 2D      [ 4]  451         ldab    SCCR2  
   835D CA 20         [ 2]  452         orab    #0x20
   835F F7 10 2D      [ 4]  453         stab    SCCR2  
   8362 7F 00 AA      [ 6]  454         clr     (0x00AA)
   8365 D6 62         [ 3]  455         ldab    (0x0062)
   8367 C4 DF         [ 2]  456         andb    #0xDF
   8369 D7 62         [ 3]  457         stab    (0x0062)
   836B BD FA F9      [ 6]  458         jsr     BUTNLIT 
   836E C6 02         [ 2]  459         ldab    #0x02           ; delay 2 secs
   8370 BD 8C 12      [ 6]  460         jsr     DLYSECS         ;
   8373 96 7C         [ 3]  461         ldaa    (0x007C)
   8375 27 2D         [ 3]  462         beq     L839B
   8377 96 7F         [ 3]  463         ldaa    (0x007F)
   8379 97 4E         [ 3]  464         staa    (0x004E)
   837B D6 81         [ 3]  465         ldab    (0x0081)
   837D BD 87 58      [ 6]  466         jsr     L8748   
   8380 96 82         [ 3]  467         ldaa    (0x0082)
   8382 85 01         [ 2]  468         bita    #0x01
   8384 26 06         [ 3]  469         bne     L8383
   8386 96 AC         [ 3]  470         ldaa    (0x00AC)
   8388 84 FD         [ 2]  471         anda    #0xFD
   838A 20 04         [ 3]  472         bra     L8387
   838C                     473 L8383:
   838C 96 AC         [ 3]  474         ldaa    (0x00AC)
   838E 8A 02         [ 2]  475         oraa    #0x02
   8390                     476 L8387:
   8390 97 AC         [ 3]  477         staa    (0x00AC)
   8392 B7 18 06      [ 4]  478         staa    PIA0PRB 
   8395 B6 18 04      [ 4]  479         ldaa    PIA0PRA 
   8398 8A 20         [ 2]  480         oraa    #0x20
   839A B7 18 04      [ 4]  481         staa    PIA0PRA 
   839D 84 DF         [ 2]  482         anda    #0xDF
   839F B7 18 04      [ 4]  483         staa    PIA0PRA 
   83A2 20 14         [ 3]  484         bra     L83AF
   83A4                     485 L839B:
   83A4 FC 04 0D      [ 5]  486         ldd     (0x040D)
   83A7 1A 83 FD E8   [ 5]  487         cpd     #0xFDE8         ; 65000?
   83AB 22 06         [ 3]  488         bhi     L83AA
   83AD C3 00 01      [ 4]  489         addd    #0x0001
   83B0 FD 04 0D      [ 5]  490         std     (0x040D)
   83B3                     491 L83AA:
   83B3 C6 F7         [ 2]  492         ldab    #0xF7           ; tape deck REWIND
   83B5 BD 86 F7      [ 6]  493         jsr     L86E7
   83B8                     494 L83AF:
   83B8 7F 00 30      [ 6]  495         clr     (0x0030)
   83BB 7F 00 31      [ 6]  496         clr     (0x0031)
   83BE 7F 00 32      [ 6]  497         clr     (0x0032)
   83C1 BD 9B 29      [ 6]  498         jsr     L9B19           ; do the random motions if enabled   
   83C4 BD 86 B2      [ 6]  499         jsr     L86A4
   83C7 25 EF         [ 3]  500         bcs     L83AF
   83C9 96 79         [ 3]  501         ldaa    (0x0079)
   83CB 27 17         [ 3]  502         beq     L83DB
   83CD 7F 00 79      [ 6]  503         clr     (0x0079)
   83D0 96 B5         [ 3]  504         ldaa    (0x00B5)
   83D2 81 01         [ 2]  505         cmpa    #0x01
   83D4 26 07         [ 3]  506         bne     L83D4
   83D6 7F 00 B5      [ 6]  507         clr     (0x00B5)
   83D9 86 01         [ 2]  508         ldaa    #0x01
   83DB 97 7C         [ 3]  509         staa    (0x007C)
   83DD                     510 L83D4:
   83DD 86 01         [ 2]  511         ldaa    #0x01
   83DF 97 AA         [ 3]  512         staa    (0x00AA)
   83E1 7E 9A 8F      [ 3]  513         jmp     L9A7F
   83E4                     514 L83DB:
   83E4 BD 8D F4      [ 6]  515         jsr     LCDMSG1 
   83E7 20 20 20 44 56 44   516         .ascis  '   DVD  data    '
        20 20 64 61 74 61
        20 20 20 A0
                            517 
   83F7 D6 62         [ 3]  518         ldab    (0x0062)
   83F9 CA 80         [ 2]  519         orab    #0x80
   83FB D7 62         [ 3]  520         stab    (0x0062)
   83FD BD FA F9      [ 6]  521         jsr     BUTNLIT 
   8400 C6 FB         [ 2]  522         ldab    #0xFB           ; tape deck PLAY
   8402 BD 86 F7      [ 6]  523         jsr     L86E7
                            524 
   8405 BD 8D DF      [ 6]  525         jsr     LCDMSG1A
   8408 36 38 48 43 31 31   526         .ascis  '68HC11 Proto'
        20 50 72 6F 74 EF
                            527 
   8414 BD 8D E6      [ 6]  528         jsr     LCDMSG2A
   8417 64 62 F0            529         .ascis  'dbp'
                            530 
   841A C6 03         [ 2]  531         ldab    #0x03           ; delay 3 secs
   841C BD 8C 12      [ 6]  532         jsr     DLYSECS         ;
   841F 7D 00 7C      [ 6]  533         tst     (0x007C)
   8422 27 15         [ 3]  534         beq     L8430
   8424 D6 80         [ 3]  535         ldab    (0x0080)
   8426 D7 62         [ 3]  536         stab    (0x0062)
   8428 BD FA F9      [ 6]  537         jsr     BUTNLIT 
   842B D6 7D         [ 3]  538         ldab    (0x007D)
   842D D7 78         [ 3]  539         stab    (0x0078)
   842F D6 7E         [ 3]  540         ldab    (0x007E)
   8431 F7 10 8A      [ 4]  541         stab    (0x108A)
   8434 7F 00 7C      [ 6]  542         clr     (0x007C)
   8437 20 1D         [ 3]  543         bra     L844D
   8439                     544 L8430:
   8439 BD 8D 13      [ 6]  545         jsr     L8D03
   843C BD 9D 4F      [ 6]  546         jsr     L9D18
   843F 24 08         [ 3]  547         bcc     L8440
   8441 7D 00 B8      [ 6]  548         tst     (0x00B8)
   8444 27 F3         [ 3]  549         beq     L8430
   8446 7E 9A 70      [ 3]  550         jmp     L9A60
   8449                     551 L8440:
   8449 7D 00 B8      [ 6]  552         tst     (0x00B8)
   844C 27 EB         [ 3]  553         beq     L8430
   844E 7F 00 30      [ 6]  554         clr     (0x0030)
   8451 7F 00 31      [ 6]  555         clr     (0x0031)
   8454 20 00         [ 3]  556         bra     L844D
   8456                     557 L844D:
   8456 96 49         [ 3]  558         ldaa    (0x0049)
   8458 26 03         [ 3]  559         bne     L8454
   845A 7E 85 AD      [ 3]  560         jmp     L85A4
   845D                     561 L8454:
   845D 7F 00 49      [ 6]  562         clr     (0x0049)
   8460 81 31         [ 2]  563         cmpa    #0x31
   8462 26 08         [ 3]  564         bne     L8463
   8464 BD A3 63      [ 6]  565         jsr     LA326
   8467 BD 8D 52      [ 6]  566         jsr     L8D42
   846A 20 EA         [ 3]  567         bra     L844D
   846C                     568 L8463:
   846C 81 32         [ 2]  569         cmpa    #0x32
   846E 26 08         [ 3]  570         bne     L846F
   8470 BD A3 63      [ 6]  571         jsr     LA326
   8473 BD 8D 45      [ 6]  572         jsr     L8D35
   8476 20 DE         [ 3]  573         bra     L844D
   8478                     574 L846F:
   8478 81 54         [ 2]  575         cmpa    #0x54
   847A 26 08         [ 3]  576         bne     L847B
   847C BD A3 63      [ 6]  577         jsr     LA326
   847F BD 8D 52      [ 6]  578         jsr     L8D42
   8482 20 D2         [ 3]  579         bra     L844D
   8484                     580 L847B:
   8484 81 5A         [ 2]  581         cmpa    #0x5A
   8486 26 1C         [ 3]  582         bne     L849B
   8488                     583 L847F:
   8488 BD A3 5B      [ 6]  584         jsr     LA31E
   848B BD 8E A5      [ 6]  585         jsr     L8E95
   848E 7F 00 32      [ 6]  586         clr     (0x0032)
   8491 7F 00 31      [ 6]  587         clr     (0x0031)
   8494 7F 00 30      [ 6]  588         clr     (0x0030)
   8497 BD 99 B6      [ 6]  589         jsr     L99A6
   849A D6 7B         [ 3]  590         ldab    (0x007B)
   849C CA 0C         [ 2]  591         orab    #0x0C
   849E BD 87 58      [ 6]  592         jsr     L8748   
   84A1 7E 81 BA      [ 3]  593         jmp     L81BD
   84A4                     594 L849B:
   84A4 81 42         [ 2]  595         cmpa    #0x42
   84A6 26 03         [ 3]  596         bne     L84A2
   84A8 7E 98 4C      [ 3]  597         jmp     L983C
   84AB                     598 L84A2:
   84AB 81 4D         [ 2]  599         cmpa    #0x4D
   84AD 26 03         [ 3]  600         bne     L84A9
   84AF 7E 98 34      [ 3]  601         jmp     L9824
   84B2                     602 L84A9:
   84B2 81 45         [ 2]  603         cmpa    #0x45
   84B4 26 03         [ 3]  604         bne     L84B0
   84B6 7E 98 12      [ 3]  605         jmp     L9802
   84B9                     606 L84B0:
   84B9 81 58         [ 2]  607         cmpa    #0x58
   84BB 26 05         [ 3]  608         bne     L84B9
   84BD 7E 99 4F      [ 3]  609         jmp     L993F
   84C0 20 94         [ 3]  610         bra     L844D
   84C2                     611 L84B9:
   84C2 81 46         [ 2]  612         cmpa    #0x46
   84C4 26 03         [ 3]  613         bne     L84C0
   84C6 7E 99 81      [ 3]  614         jmp     L9971
   84C9                     615 L84C0:
   84C9 81 47         [ 2]  616         cmpa    #0x47
   84CB 26 03         [ 3]  617         bne     L84C7
   84CD 7E 99 8B      [ 3]  618         jmp     L997B
   84D0                     619 L84C7:
   84D0 81 48         [ 2]  620         cmpa    #0x48
   84D2 26 03         [ 3]  621         bne     L84CE
   84D4 7E 99 95      [ 3]  622         jmp     L9985
   84D7                     623 L84CE:
   84D7 81 49         [ 2]  624         cmpa    #0x49
   84D9 26 03         [ 3]  625         bne     L84D5
   84DB 7E 99 9F      [ 3]  626         jmp     L998F
   84DE                     627 L84D5:
   84DE 81 53         [ 2]  628         cmpa    #0x53
   84E0 26 03         [ 3]  629         bne     L84DC
   84E2 7E 97 CA      [ 3]  630         jmp     L97BA
   84E5                     631 L84DC:
   84E5 81 59         [ 2]  632         cmpa    #0x59
   84E7 26 03         [ 3]  633         bne     L84E3
   84E9 7E 99 E2      [ 3]  634         jmp     L99D2
   84EC                     635 L84E3:
   84EC 81 57         [ 2]  636         cmpa    #0x57
   84EE 26 03         [ 3]  637         bne     L84EA
   84F0 7E 9A B4      [ 3]  638         jmp     L9AA4
   84F3                     639 L84EA:
   84F3 81 41         [ 2]  640         cmpa    #0x41
   84F5 26 17         [ 3]  641         bne     L8505
   84F7 BD 9D 4F      [ 6]  642         jsr     L9D18
   84FA 25 09         [ 3]  643         bcs     L84FC
   84FC 7F 00 30      [ 6]  644         clr     (0x0030)
   84FF 7F 00 31      [ 6]  645         clr     (0x0031)
   8502 7E 85 AD      [ 3]  646         jmp     L85A4
   8505                     647 L84FC:
   8505 7F 00 30      [ 6]  648         clr     (0x0030)
   8508 7F 00 31      [ 6]  649         clr     (0x0031)
   850B 7E 9A 8F      [ 3]  650         jmp     L9A7F
   850E                     651 L8505:
   850E 81 4B         [ 2]  652         cmpa    #0x4B
   8510 26 0B         [ 3]  653         bne     L8514
   8512 BD 9D 4F      [ 6]  654         jsr     L9D18
   8515 25 03         [ 3]  655         bcs     L8511
   8517 7E 85 AD      [ 3]  656         jmp     L85A4
   851A                     657 L8511:
   851A 7E 9A 8F      [ 3]  658         jmp     L9A7F
   851D                     659 L8514:
   851D 81 4A         [ 2]  660         cmpa    #0x4A
   851F 26 07         [ 3]  661         bne     L851F
   8521 86 01         [ 2]  662         ldaa    #0x01
   8523 97 AF         [ 3]  663         staa    (0x00AF)
   8525 7E 98 4C      [ 3]  664         jmp     L983C
   8528                     665 L851F:
   8528 81 4E         [ 2]  666         cmpa    #0x4E
   852A 26 0B         [ 3]  667         bne     L852E
   852C B6 10 8A      [ 4]  668         ldaa    (0x108A)
   852F 8A 02         [ 2]  669         oraa    #0x02
   8531 B7 10 8A      [ 4]  670         staa    (0x108A)
   8534 7E 84 56      [ 3]  671         jmp     L844D
   8537                     672 L852E:
   8537 81 4F         [ 2]  673         cmpa    #0x4F
   8539 26 06         [ 3]  674         bne     L8538
   853B BD 9D 4F      [ 6]  675         jsr     L9D18
   853E 7E 84 56      [ 3]  676         jmp     L844D
   8541                     677 L8538:
   8541 81 50         [ 2]  678         cmpa    #0x50
   8543 26 06         [ 3]  679         bne     L8542
   8545 BD 9D 4F      [ 6]  680         jsr     L9D18
   8548 7E 84 56      [ 3]  681         jmp     L844D
   854B                     682 L8542:
   854B 81 51         [ 2]  683         cmpa    #0x51
   854D 26 0B         [ 3]  684         bne     L8551
   854F B6 10 8A      [ 4]  685         ldaa    (0x108A)
   8552 8A 04         [ 2]  686         oraa    #0x04
   8554 B7 10 8A      [ 4]  687         staa    (0x108A)
   8557 7E 84 56      [ 3]  688         jmp     L844D
   855A                     689 L8551:
   855A 81 55         [ 2]  690         cmpa    #0x55
   855C 26 07         [ 3]  691         bne     L855C
   855E C6 01         [ 2]  692         ldab    #0x01
   8560 D7 B6         [ 3]  693         stab    (0x00B6)
   8562 7E 84 56      [ 3]  694         jmp     L844D
   8565                     695 L855C:
   8565 81 4C         [ 2]  696         cmpa    #0x4C
   8567 26 19         [ 3]  697         bne     L8579
   8569 7F 00 49      [ 6]  698         clr     (0x0049)
   856C BD 9D 4F      [ 6]  699         jsr     L9D18
   856F 25 0E         [ 3]  700         bcs     L8576
   8571 BD AB 25      [ 6]  701         jsr     LAAE8
   8574 BD AB 93      [ 6]  702         jsr     LAB56
   8577 24 06         [ 3]  703         bcc     L8576
   8579 BD AB 62      [ 6]  704         jsr     LAB25
   857C BD AB 83      [ 6]  705         jsr     LAB46
   857F                     706 L8576:
   857F 7E 84 56      [ 3]  707         jmp     L844D
   8582                     708 L8579:
   8582 81 52         [ 2]  709         cmpa    #0x52
   8584 26 1A         [ 3]  710         bne     L8597
   8586 7F 00 49      [ 6]  711         clr     (0x0049)
   8589 BD 9D 4F      [ 6]  712         jsr     L9D18
   858C 25 0F         [ 3]  713         bcs     L8594
   858E BD AB 25      [ 6]  714         jsr     LAAE8
   8591 BD AB 93      [ 6]  715         jsr     LAB56
   8594 25 07         [ 3]  716         bcs     L8594
   8596 86 FF         [ 2]  717         ldaa    #0xFF
   8598 A7 00         [ 4]  718         staa    0,X
   859A BD AB 25      [ 6]  719         jsr     LAAE8
   859D                     720 L8594:
   859D 7E 84 56      [ 3]  721         jmp     L844D
   85A0                     722 L8597:
   85A0 81 44         [ 2]  723         cmpa    #0x44
   85A2 26 09         [ 3]  724         bne     L85A4
   85A4 7F 00 49      [ 6]  725         clr     (0x0049)
   85A7 BD AB EB      [ 6]  726         jsr     LABAE
   85AA 7E 84 56      [ 3]  727         jmp     L844D
   85AD                     728 L85A4:
   85AD 7D 00 75      [ 6]  729         tst     (0x0075)
   85B0 26 56         [ 3]  730         bne     L85FF
   85B2 7D 00 79      [ 6]  731         tst     (0x0079)
   85B5 26 51         [ 3]  732         bne     L85FF
   85B7 7D 00 30      [ 6]  733         tst     (0x0030)
   85BA 26 07         [ 3]  734         bne     L85BA
   85BC 96 5B         [ 3]  735         ldaa    (0x005B)
   85BE 27 48         [ 3]  736         beq     L85FF
   85C0 7F 00 5B      [ 6]  737         clr     (0x005B)
   85C3                     738 L85BA:
   85C3 CC 00 64      [ 3]  739         ldd     #0x0064
   85C6 DD 23         [ 4]  740         std     CDTIMR5
   85C8                     741 L85BF:
   85C8 DC 23         [ 4]  742         ldd     CDTIMR5
   85CA 27 14         [ 3]  743         beq     L85D7
   85CC BD 9B 29      [ 6]  744         jsr     L9B19           ; do the random motions if enabled
   85CF B6 18 04      [ 4]  745         ldaa    PIA0PRA 
   85D2 88 FF         [ 2]  746         eora    #0xFF
   85D4 84 06         [ 2]  747         anda    #0x06
   85D6 81 06         [ 2]  748         cmpa    #0x06
   85D8 26 EE         [ 3]  749         bne     L85BF
   85DA 7F 00 30      [ 6]  750         clr     (0x0030)
   85DD 7E 86 89      [ 3]  751         jmp     L8680
   85E0                     752 L85D7:
   85E0 7F 00 30      [ 6]  753         clr     (0x0030)
   85E3 D6 62         [ 3]  754         ldab    (0x0062)
   85E5 C8 02         [ 2]  755         eorb    #0x02
   85E7 D7 62         [ 3]  756         stab    (0x0062)
   85E9 BD FA F9      [ 6]  757         jsr     BUTNLIT 
   85EC C4 02         [ 2]  758         andb    #0x02
   85EE 27 0D         [ 3]  759         beq     L85F4
   85F0 BD AA 55      [ 6]  760         jsr     LAA18
   85F3 C6 1E         [ 2]  761         ldab    #0x1E
   85F5 BD 8C 32      [ 6]  762         jsr     DLYSECSBY100    ; delay 0.3 sec
   85F8 7F 00 30      [ 6]  763         clr     (0x0030)
   85FB 20 0B         [ 3]  764         bra     L85FF
   85FD                     765 L85F4:
   85FD BD AA 5A      [ 6]  766         jsr     LAA1D
   8600 C6 1E         [ 2]  767         ldab    #0x1E
   8602 BD 8C 32      [ 6]  768         jsr     DLYSECSBY100    ; delay 0.3 sec
   8605 7F 00 30      [ 6]  769         clr     (0x0030)
   8608                     770 L85FF:
   8608 BD 9B 29      [ 6]  771         jsr     L9B19           ; do the random motions if enabled
   860B B6 10 0A      [ 4]  772         ldaa    PORTE
   860E 84 10         [ 2]  773         anda    #0x10
   8610 27 0B         [ 3]  774         beq     L8614
   8612 B6 18 04      [ 4]  775         ldaa    PIA0PRA 
   8615 88 FF         [ 2]  776         eora    #0xFF
   8617 84 07         [ 2]  777         anda    #0x07
   8619 81 06         [ 2]  778         cmpa    #0x06
   861B 26 1C         [ 3]  779         bne     L8630
   861D                     780 L8614:
   861D 7D 00 76      [ 6]  781         tst     (0x0076)
   8620 26 17         [ 3]  782         bne     L8630
   8622 7D 00 75      [ 6]  783         tst     (0x0075)
   8625 26 12         [ 3]  784         bne     L8630
   8627 D6 62         [ 3]  785         ldab    (0x0062)
   8629 C4 FC         [ 2]  786         andb    #0xFC
   862B D7 62         [ 3]  787         stab    (0x0062)
   862D BD FA F9      [ 6]  788         jsr     BUTNLIT 
   8630 BD AA 50      [ 6]  789         jsr     LAA13
   8633 BD AA 5A      [ 6]  790         jsr     LAA1D
   8636 7E 9A 70      [ 3]  791         jmp     L9A60
   8639                     792 L8630:
   8639 7D 00 31      [ 6]  793         tst     (0x0031)
   863C 26 07         [ 3]  794         bne     L863C
   863E 96 5A         [ 3]  795         ldaa    (0x005A)
   8640 27 47         [ 3]  796         beq     L8680
   8642 7F 00 5A      [ 6]  797         clr     (0x005A)
   8645                     798 L863C:
   8645 CC 00 64      [ 3]  799         ldd     #0x0064
   8648 DD 23         [ 4]  800         std     CDTIMR5
   864A                     801 L8641:
   864A DC 23         [ 4]  802         ldd     CDTIMR5
   864C 27 13         [ 3]  803         beq     L8658
   864E BD 9B 29      [ 6]  804         jsr     L9B19           ; do the random motions if enabled
   8651 B6 18 04      [ 4]  805         ldaa    PIA0PRA 
   8654 88 FF         [ 2]  806         eora    #0xFF
   8656 84 06         [ 2]  807         anda    #0x06
   8658 81 06         [ 2]  808         cmpa    #0x06
   865A 26 EE         [ 3]  809         bne     L8641
   865C 7F 00 31      [ 6]  810         clr     (0x0031)
   865F 20 28         [ 3]  811         bra     L8680
   8661                     812 L8658:
   8661 7F 00 31      [ 6]  813         clr     (0x0031)
   8664 D6 62         [ 3]  814         ldab    (0x0062)
   8666 C8 01         [ 2]  815         eorb    #0x01
   8668 D7 62         [ 3]  816         stab    (0x0062)
   866A BD FA F9      [ 6]  817         jsr     BUTNLIT 
   866D C4 01         [ 2]  818         andb    #0x01
   866F 27 0D         [ 3]  819         beq     L8675
   8671 BD AA 49      [ 6]  820         jsr     LAA0C
   8674 C6 1E         [ 2]  821         ldab    #0x1E
   8676 BD 8C 32      [ 6]  822         jsr     DLYSECSBY100    ; delay 0.3 sec
   8679 7F 00 31      [ 6]  823         clr     (0x0031)
   867C 20 0B         [ 3]  824         bra     L8680
   867E                     825 L8675:
   867E BD AA 50      [ 6]  826         jsr     LAA13
   8681 C6 1E         [ 2]  827         ldab    #0x1E
   8683 BD 8C 32      [ 6]  828         jsr     DLYSECSBY100    ; delay 0.3 sec
   8686 7F 00 31      [ 6]  829         clr     (0x0031)
   8689                     830 L8680:
   8689 20 24         [ 3]  831         bra     L86A1           ; NEW
   868B BD 86 B2      [ 6]  832         jsr     L86A4
   868E 25 1F         [ 3]  833         bcs     L86A1
   8690 7E 86 AF      [ 3]  834         jmp     L86A1           ; NEW
   8693 7F 00 4E      [ 6]  835         clr     (0x004E)
   8696 BD 99 B6      [ 6]  836         jsr     L99A6
   8699 BD 86 D4      [ 6]  837         jsr     L86C4           ; Reset boards 1-10
   869C 5F            [ 2]  838         clrb
   869D D7 62         [ 3]  839         stab    (0x0062)
   869F BD FA F9      [ 6]  840         jsr     BUTNLIT 
   86A2 C6 FD         [ 2]  841         ldab    #0xFD           ; tape deck STOP
   86A4 BD 86 F7      [ 6]  842         jsr     L86E7
   86A7 C6 04         [ 2]  843         ldab    #0x04           ; delay 4 secs
   86A9 BD 8C 12      [ 6]  844         jsr     DLYSECS         ;
   86AC 7E 84 88      [ 3]  845         jmp     L847F
   86AF                     846 L86A1:
   86AF 7E 84 56      [ 3]  847         jmp     L844D
                            848 
   86B2                     849 L86A4:
   86B2 BD 9B 29      [ 6]  850         jsr     L9B19           ; do the random motions if enabled
   86B5 7F 00 23      [ 6]  851         clr     CDTIMR5
   86B8 86 19         [ 2]  852         ldaa    #0x19
   86BA 97 24         [ 3]  853         staa    CDTIMR5+1
   86BC 0C            [ 2]  854         clc                     ; NEW
   86BD 39            [ 5]  855         rts                     ; NEW
   86BE B6 10 0A      [ 4]  856         ldaa    PORTE
   86C1 84 80         [ 2]  857         anda    #0x80
   86C3 27 02         [ 3]  858         beq     L86B7
   86C5                     859 L86B5:
   86C5 0D            [ 2]  860         sec
   86C6 39            [ 5]  861         rts
                            862 
   86C7                     863 L86B7:
   86C7 B6 10 0A      [ 4]  864         ldaa    PORTE
   86CA 84 80         [ 2]  865         anda    #0x80
   86CC 26 F7         [ 3]  866         bne     L86B5
   86CE 96 24         [ 3]  867         ldaa    CDTIMR5+1
   86D0 26 F5         [ 3]  868         bne     L86B7
   86D2 0C            [ 2]  869         clc
   86D3 39            [ 5]  870         rts
                            871 
                            872 ; Reset boards 1-10 at:
                            873 ;         0x1080, 0x1084, 0x1088, 0x108c
                            874 ;         0x1090, 0x1094, 0x1098, 0x109c
                            875 ;         0x10a0, 0x10a4
                            876 
   86D4                     877 L86C4:
   86D4 CE 10 80      [ 3]  878         ldx     #0x1080
   86D7                     879 L86C7:
   86D7 86 30         [ 2]  880         ldaa    #0x30
   86D9 A7 01         [ 4]  881         staa    1,X             ; 0x30 -> PIAxCRA, CA2 low, DDR
   86DB A7 03         [ 4]  882         staa    3,X             ; 0x30 -> PIAxCRB, CB2 low, DDR
   86DD 86 FF         [ 2]  883         ldaa    #0xFF
   86DF A7 00         [ 4]  884         staa    0,X             ; 0xFF -> PIAxDDRA, all outputs
   86E1 A7 02         [ 4]  885         staa    2,X             ; 0xFF -> PIAxDDRB, all outputs
   86E3 86 34         [ 2]  886         ldaa    #0x34
   86E5 A7 01         [ 4]  887         staa    1,X             ; 0x34 -> PIAxCRA, CA2 low, PR
   86E7 A7 03         [ 4]  888         staa    3,X             ; 0x34 -> PIAxCRB, CA2 low, PR
   86E9 6F 00         [ 6]  889         clr     0,X             ; 0x00 -> PIAxPRA, all outputs low
   86EB 6F 02         [ 6]  890         clr     2,X             ; 0x00 -> PIAxPRB, all outputs low
   86ED 08            [ 3]  891         inx
   86EE 08            [ 3]  892         inx
   86EF 08            [ 3]  893         inx
   86F0 08            [ 3]  894         inx
   86F1 8C 10 A4      [ 4]  895         cpx     #0x10A4
   86F4 2F E1         [ 3]  896         ble     L86C7
   86F6 39            [ 5]  897         rts
                            898 
                            899 ; Set the tape deck to STOP, PLAY, REWIND, or EJECT
                            900 ;                B =   0xFD, 0xFB,   0xF7, or  0xEF
   86F7                     901 L86E7:
   86F7 36            [ 3]  902         psha
   86F8 BD 9B 29      [ 6]  903         jsr     L9B19           ; do the random motions if enabled
   86FB 96 AC         [ 3]  904         ldaa    (0x00AC)        ; A = diag buffer?
   86FD C1 FB         [ 2]  905         cmpb    #0xFB           ; if bit 2 of B is 0 (PLAY)
   86FF 26 04         [ 3]  906         bne     L86F5
   8701 84 FE         [ 2]  907         anda    #0xFE           ; clear A bit 0 (top)
   8703 20 0E         [ 3]  908         bra     L8703
   8705                     909 L86F5:
   8705 C1 F7         [ 2]  910         cmpb    #0xF7           ; if bit 3 of B is 0 (REWIND)
   8707 26 04         [ 3]  911         bne     L86FD
   8709 84 BF         [ 2]  912         anda    #0xBF           ; clear A bit 6 (middle)
   870B 20 06         [ 3]  913         bra     L8703
   870D                     914 L86FD:
   870D C1 FD         [ 2]  915         cmpb    #0xFD           ; if bit 1 of B is 0 (STOP)
   870F 26 02         [ 3]  916         bne     L8703
   8711 84 F7         [ 2]  917         anda    #0xF7           ; clear A bit 3 (bottom)
   8713                     918 L8703:
   8713 97 AC         [ 3]  919         staa    (0x00AC)        ; update diag display buffer
   8715 B7 18 06      [ 4]  920         staa    PIA0PRB         ; init bus based on A
   8718 BD 87 4A      [ 6]  921         jsr     L873A           ; clock diagnostic indicator
   871B 96 7A         [ 3]  922         ldaa    (0x007A)        ; buffer for tape deck / av switcher?
   871D 84 01         [ 2]  923         anda    #0x01           ; preserve a/v switcher bit
   871F 97 7A         [ 3]  924         staa    (0x007A)        ; 
   8721 C4 FE         [ 2]  925         andb    #0xFE           ; set bits 7-1 based on B arg
   8723 DA 7A         [ 3]  926         orab    (0x007A)        
   8725 F7 18 06      [ 4]  927         stab    PIA0PRB         ; put that on the bus
   8728 BD 87 85      [ 6]  928         jsr     L8775           ; clock the tape deck
   872B C6 32         [ 2]  929         ldab    #0x32
   872D BD 8C 32      [ 6]  930         jsr     DLYSECSBY100    ; delay 0.5 sec
   8730 C6 FE         [ 2]  931         ldab    #0xFE
   8732 DA 7A         [ 3]  932         orab    (0x007A)        ; all tape bits off
   8734 F7 18 06      [ 4]  933         stab    PIA0PRB         ; unpress tape buttons
   8737 D7 7A         [ 3]  934         stab    (0x007A)
   8739 BD 87 85      [ 6]  935         jsr     L8775           ; clock the tape deck
   873C 96 AC         [ 3]  936         ldaa    (0x00AC)
   873E 8A 49         [ 2]  937         oraa    #0x49           ; reset bits top,mid,bot
   8740 97 AC         [ 3]  938         staa    (0x00AC)
   8742 B7 18 06      [ 4]  939         staa    PIA0PRB 
   8745 BD 87 4A      [ 6]  940         jsr     L873A           ; clock diagnostic indicator
   8748 32            [ 4]  941         pula
   8749 39            [ 5]  942         rts
                            943 
                            944 ; clock diagnostic indicator
   874A                     945 L873A:
   874A B6 18 04      [ 4]  946         ldaa    PIA0PRA 
   874D 8A 20         [ 2]  947         oraa    #0x20
   874F B7 18 04      [ 4]  948         staa    PIA0PRA 
   8752 84 DF         [ 2]  949         anda    #0xDF
   8754 B7 18 04      [ 4]  950         staa    PIA0PRA 
   8757 39            [ 5]  951         rts
                            952 
   8758                     953 L8748:
   8758 36            [ 3]  954         psha
   8759 37            [ 3]  955         pshb
   875A 96 AC         [ 3]  956         ldaa    (0x00AC)        ; update state machine at AC?
                            957                                 ;      gfedcba
   875C 8A 30         [ 2]  958         oraa    #0x30           ; set bb11bbbb
   875E 84 FD         [ 2]  959         anda    #0xFD           ; clr bb11bb0b
   8760 C5 20         [ 2]  960         bitb    #0x20           ; tst bit 5 (f)
   8762 26 02         [ 3]  961         bne     L8756           ; 
   8764 8A 02         [ 2]  962         oraa    #0x02           ; set bit 1 (b)
   8766                     963 L8756:
   8766 C5 04         [ 2]  964         bitb    #0x04           ; tst bit 2 (c)
   8768 26 02         [ 3]  965         bne     L875C
   876A 84 EF         [ 2]  966         anda    #0xEF           ; clr bit 4 (e)
   876C                     967 L875C:
   876C C5 08         [ 2]  968         bitb    #0x08           ; tst bit 3 (d)
   876E 26 02         [ 3]  969         bne     L8762
   8770 84 DF         [ 2]  970         anda    #0xDF           ; clr bit 5 (f)
   8772                     971 L8762:
   8772 B7 18 06      [ 4]  972         staa    PIA0PRB 
   8775 97 AC         [ 3]  973         staa    (0x00AC)
   8777 BD 87 4A      [ 6]  974         jsr     L873A           ; clock diagnostic indicator
   877A 33            [ 4]  975         pulb
   877B F7 18 06      [ 4]  976         stab    PIA0PRB 
   877E D7 7B         [ 3]  977         stab    (0x007B)
   8780 BD 87 93      [ 6]  978         jsr     L8783
   8783 32            [ 4]  979         pula
   8784 39            [ 5]  980         rts
                            981 
                            982 ; High pulse on CB2, clock bits0-4 - 4 tape deck and 1 A/V switcher bit
   8785                     983 L8775:
   8785 B6 18 07      [ 4]  984         ldaa    PIA0CRB 
   8788 8A 38         [ 2]  985         oraa    #0x38           
   878A B7 18 07      [ 4]  986         staa    PIA0CRB         ; CB2 High
   878D 84 F7         [ 2]  987         anda    #0xF7
   878F B7 18 07      [ 4]  988         staa    PIA0CRB         ; CB2 Low
   8792 39            [ 5]  989         rts
                            990 
                            991 ; High pulse on CA2
   8793                     992 L8783:
   8793 B6 18 05      [ 4]  993         ldaa    PIA0CRA 
   8796 8A 38         [ 2]  994         oraa    #0x38
   8798 B7 18 05      [ 4]  995         staa    PIA0CRA         ; CA2 High
   879B 84 F7         [ 2]  996         anda    #0xF7
   879D B7 18 05      [ 4]  997         staa    PIA0CRA         ; CA2 High
   87A0 39            [ 5]  998         rts
                            999 
                           1000 ; AVSEL1 = 0
   87A1                    1001 L8791:
   87A1 96 7A         [ 3] 1002         ldaa    (0x007A)
   87A3 84 FE         [ 2] 1003         anda    #0xFE
   87A5 36            [ 3] 1004         psha
   87A6 96 AC         [ 3] 1005         ldaa    (0x00AC)
   87A8 8A 04         [ 2] 1006         oraa    #0x04           ; clear segment C (lower right)
   87AA 97 AC         [ 3] 1007         staa    (0x00AC)
   87AC 32            [ 4] 1008         pula
   87AD                    1009 L879D:
   87AD 97 7A         [ 3] 1010         staa    (0x007A)        
   87AF B7 18 06      [ 4] 1011         staa    PIA0PRB 
   87B2 BD 87 85      [ 6] 1012         jsr     L8775           ; AVSEL1 = low
   87B5 96 AC         [ 3] 1013         ldaa    (0x00AC)
   87B7 B7 18 06      [ 4] 1014         staa    PIA0PRB 
   87BA BD 87 4A      [ 6] 1015         jsr     L873A           ; clock diagnostic indicator
   87BD 39            [ 5] 1016         rts
                           1017 
   87BE                    1018 L87AE:
   87BE 96 7A         [ 3] 1019         ldaa    (0x007A)
   87C0 8A 01         [ 2] 1020         oraa    #0x01
   87C2 36            [ 3] 1021         psha
   87C3 96 AC         [ 3] 1022         ldaa    (0x00AC)
   87C5 84 FB         [ 2] 1023         anda    #0xFB
   87C7 97 AC         [ 3] 1024         staa    (0x00AC)
   87C9 32            [ 4] 1025         pula
   87CA 20 E1         [ 3] 1026         bra     L879D
                           1027 
                           1028 ; SCC init, aux serial
   87CC                    1029 L87BC:
   87CC CE 87 E2      [ 3] 1030         ldx     #L87D2
   87CF                    1031 L87BF:
   87CF A6 00         [ 4] 1032         ldaa    0,X
   87D1 81 FF         [ 2] 1033         cmpa    #0xFF
   87D3 27 0C         [ 3] 1034         beq     L87D1
   87D5 08            [ 3] 1035         inx
   87D6 B7 18 0D      [ 4] 1036         staa    SCCCTRLA
   87D9 A6 00         [ 4] 1037         ldaa    0,X
   87DB 08            [ 3] 1038         inx
   87DC B7 18 0D      [ 4] 1039         staa    SCCCTRLA
   87DF 20 EE         [ 3] 1040         bra     L87BF
   87E1                    1041 L87D1:
   87E1 39            [ 5] 1042         rts
                           1043 
                           1044 ; data table for aux serial config
   87E2                    1045 L87D2:
   87E2 09 8A              1046         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   87E4 01 00              1047         .byte   0x01,0x00       ; irq on special condition only
   87E6 0C 18              1048         .byte   0x0c,0x18       ; Lower byte of time constant
   87E8 0D 00              1049         .byte   0x0d,0x00       ; Upper byte of time constant
   87EA 04 44              1050         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   87EC 0E 63              1051         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   87EE 05 68              1052         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   87F0 0B 56              1053         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   87F2 03 C1              1054         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           1055         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           1056         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   87F4 0F 00              1057         .byte   0x0f,0x00       ; end of table marker
   87F6 FF FF              1058         .byte   0xff,0xff
                           1059 
                           1060 ; SCC init, sync tape data
   87F8                    1061 L87E8:
   87F8 CE F8 57      [ 3] 1062         ldx     #LF857
   87FB                    1063 L87EB:
   87FB A6 00         [ 4] 1064         ldaa    0,X
   87FD 81 FF         [ 2] 1065         cmpa    #0xFF
   87FF 27 0C         [ 3] 1066         beq     L87FD
   8801 08            [ 3] 1067         inx
   8802 B7 18 0C      [ 4] 1068         staa    SCCCTRLB
   8805 A6 00         [ 4] 1069         ldaa    0,X
   8807 08            [ 3] 1070         inx
   8808 B7 18 0C      [ 4] 1071         staa    SCCCTRLB
   880B 20 EE         [ 3] 1072         bra     L87EB
   880D                    1073 L87FD:
   880D 20 16         [ 3] 1074         bra     L8815
                           1075 
                           1076 ; data table for sync tape data config
   880F 09 8A              1077         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   8811 01 10              1078         .byte   0x01,0x10       ; irq on all character received
   8813 0C 18              1079         .byte   0x0c,0x18       ; Lower byte of time constant
   8815 0D 00              1080         .byte   0x0d,0x00       ; Upper byte of time constant
   8817 04 04              1081         .byte   0x04,0x04       ; X1 clock mode, 8-bit sync char, 1 stop bit, no parity
   8819 0E 63              1082         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   881B 05 68              1083         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   881D 0B 01              1084         .byte   0x0b,0x01       ; ~RTxC pin is Recv/Xmit clock, ~TRxC is xmit clk
   881F 03 C1              1085         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
   8821 0F 00              1086         .byte   0x0f,0x00       ; end of table marker
   8823 FF FF              1087         .byte   0xff,0xff
                           1088 
                           1089 ; Install IRQ and SCI interrupt handlers
   8825                    1090 L8815:
   8825 CE 88 4E      [ 3] 1091         ldx     #L883E          ; Install IRQ interrupt handler
   8828 FF 01 28      [ 5] 1092         stx     (0x0128)
   882B 86 7E         [ 2] 1093         ldaa    #0x7E
   882D B7 01 27      [ 4] 1094         staa    (0x0127)
   8830 CE 88 42      [ 3] 1095         ldx     #L8832          ; Install SCI interrupt handler
   8833 FF 01 01      [ 5] 1096         stx     (0x0101)
   8836 B7 01 00      [ 4] 1097         staa    (0x0100)
   8839 B6 10 2D      [ 4] 1098         ldaa    SCCR2           ; enable SCI receive interrupts
   883C 8A 20         [ 2] 1099         oraa    #0x20
   883E B7 10 2D      [ 4] 1100         staa    SCCR2  
   8841 39            [ 5] 1101         rts
                           1102 
                           1103 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1104 
                           1105 ; SCI Interrupt handler, normal serial
                           1106 
   8842                    1107 L8832:
   8842 B6 10 2E      [ 4] 1108         ldaa    SCSR
   8845 B6 10 2F      [ 4] 1109         ldaa    SCDR
   8848 7C 00 48      [ 6] 1110         inc     (0x0048)        ; increment bytes received
   884B 7E 88 72      [ 3] 1111         jmp     L8862           ; handle incoming data the same from SCI or SCC
                           1112 
                           1113 ; IRQ Interrupt handler, aux serial
                           1114 
   884E                    1115 L883E:
   884E 86 01         [ 2] 1116         ldaa    #0x01
   8850 B7 18 0C      [ 4] 1117         staa    SCCCTRLB
   8853 B6 18 0C      [ 4] 1118         ldaa    SCCCTRLB        ; read 3 error bits
   8856 84 70         [ 2] 1119         anda    #0x70
   8858 26 1F         [ 3] 1120         bne     L8869           ; if errors, jump ahead
   885A 86 0A         [ 2] 1121         ldaa    #0x0A
   885C B7 18 0C      [ 4] 1122         staa    SCCCTRLB
   885F B6 18 0C      [ 4] 1123         ldaa    SCCCTRLB        ; read clocks missing bits
   8862 84 C0         [ 2] 1124         anda    #0xC0
   8864 26 22         [ 3] 1125         bne     L8878           ; clocks missing, jump ahead
   8866 B6 18 0C      [ 4] 1126         ldaa    SCCCTRLB        ; check character available
   8869 44            [ 2] 1127         lsra
   886A 24 35         [ 3] 1128         bcc     L8891           ; if no char available, clear register and exit
   886C 7C 00 48      [ 6] 1129         inc     (0x0048)        ; increment bytes received
   886F B6 18 0E      [ 4] 1130         ldaa    SCCDATAB        ; read good data byte
                           1131 
                           1132 ; handle incoming data byte
   8872                    1133 L8862:
   8872 BD FA A3      [ 6] 1134         jsr     SERIALW         ; echo it to serial
   8875 97 4A         [ 3] 1135         staa    (0x004A)        ; store it here
   8877 20 2D         [ 3] 1136         bra     L8896
                           1137 
                           1138 ; errors reading from SCC
   8879                    1139 L8869:
   8879 B6 18 0E      [ 4] 1140         ldaa    SCCDATAB        ; read bad byte
   887C 86 30         [ 2] 1141         ldaa    #0x30
   887E B7 18 0C      [ 4] 1142         staa    SCCCTRLB        ; send error reset (Register 0)
   8881 86 07         [ 2] 1143         ldaa    #0x07
   8883 BD FA A3      [ 6] 1144         jsr     SERIALW         ; send bell to serial
   8886 0C            [ 2] 1145         clc
   8887 3B            [12] 1146         rti
                           1147 
                           1148 ; clocks missing?
   8888                    1149 L8878:
   8888 86 07         [ 2] 1150         ldaa    #0x07
   888A BD FA A3      [ 6] 1151         jsr     SERIALW         ; send bell to serial
   888D 86 0E         [ 2] 1152         ldaa    #0x0E
   888F B7 18 0C      [ 4] 1153         staa    SCCCTRLB
   8892 86 43         [ 2] 1154         ldaa    #0x43
   8894 B7 18 0C      [ 4] 1155         staa    SCCCTRLB        ; send reset missing clock
   8897 B6 18 0E      [ 4] 1156         ldaa    SCCDATAB
   889A 86 07         [ 2] 1157         ldaa    #0x07
   889C BD FA A3      [ 6] 1158         jsr     SERIALW         ; send 2nd bell to serial
   889F 0D            [ 2] 1159         sec
   88A0 3B            [12] 1160         rti
                           1161 
                           1162 ; clear receive data reg and return
   88A1                    1163 L8891:
   88A1 B6 18 0E      [ 4] 1164         ldaa    SCCDATAB
   88A4 0C            [ 2] 1165         clc
   88A5 3B            [12] 1166         rti
                           1167 
                           1168 ; Parse byte from tape
   88A6                    1169 L8896:
   88A6 84 7F         [ 2] 1170         anda    #0x7F           ; should all be 7-bits, ignore bit 7
   88A8 81 24         [ 2] 1171         cmpa    #0x24           ;'$'
   88AA 27 44         [ 3] 1172         beq     L88E0           ; count it and exit
   88AC 81 25         [ 2] 1173         cmpa    #0x25           ;'%'
   88AE 27 40         [ 3] 1174         beq     L88E0           ; count it and exit
   88B0 81 20         [ 2] 1175         cmpa    #0x20           ;' '
   88B2 27 3A         [ 3] 1176         beq     L88DE           ; just exit
   88B4 81 30         [ 2] 1177         cmpa    #0x30           ;'0'
   88B6 25 35         [ 3] 1178         bcs     L88DD           ; < 0x30, exit
   88B8 97 12         [ 3] 1179         staa    (0x0012)        ; store it here
   88BA 96 4D         [ 3] 1180         ldaa    (0x004D)        ; check number of '$' or '%'
   88BC 81 02         [ 2] 1181         cmpa    #0x02
   88BE 25 09         [ 3] 1182         bcs     L88B9           ; < 2, jump ahead
   88C0 7F 00 4D      [ 6] 1183         clr     (0x004D)        ; clear number of '$' or '%'
   88C3 96 12         [ 3] 1184         ldaa    (0x0012)
   88C5 97 49         [ 3] 1185         staa    (0x0049)        ; store the character here - character is 0x30 or higher
   88C7 20 24         [ 3] 1186         bra     L88DD           ; exit
   88C9                    1187 L88B9:
   88C9 7D 00 4E      [ 6] 1188         tst     (0x004E)        ; is 4E 0??? (related to random motions?)
   88CC 27 1F         [ 3] 1189         beq     L88DD           ; if so, exit
   88CE 86 78         [ 2] 1190         ldaa    #0x78           ; 120
   88D0 97 63         [ 3] 1191         staa    (0x0063)        ; start 12 second timer
   88D2 97 64         [ 3] 1192         staa    (0x0064)        ; reset boards before next random motion
   88D4 96 12         [ 3] 1193         ldaa    (0x0012)
   88D6 81 40         [ 2] 1194         cmpa    #0x40
   88D8 24 07         [ 3] 1195         bcc     L88D1           ; if char >= 0x40, jump ahead
   88DA 97 4C         [ 3] 1196         staa    (0x004C)        ; store code from 0x30 to 0x3F here
   88DC 7F 00 4D      [ 6] 1197         clr     (0x004D)        ; more code to process
   88DF 20 0C         [ 3] 1198         bra     L88DD           ; go to rti
   88E1                    1199 L88D1:
   88E1 81 60         [ 2] 1200         cmpa    #0x60       
   88E3 24 08         [ 3] 1201         bcc     L88DD           ; if char >= 0x60, exit
   88E5 97 4B         [ 3] 1202         staa    (0x004B)        ; store code from 0x40 to 0x5F here
   88E7 7F 00 4D      [ 6] 1203         clr     (0x004D)        ; more code to process
   88EA BD 88 F5      [ 6] 1204         jsr     L88E5           ; jump ahead
   88ED                    1205 L88DD:
   88ED 3B            [12] 1206         rti
                           1207 
   88EE                    1208 L88DE:
   88EE 20 FD         [ 3] 1209         bra     L88DD           ; go to rti
   88F0                    1210 L88E0:
   88F0 7C 00 4D      [ 6] 1211         inc     (0x004D)        ; count $ or %
   88F3 20 F9         [ 3] 1212         bra     L88DE           ; exit
   88F5                    1213 L88E5:
   88F5 D6 4B         [ 3] 1214         ldab    (0x004B)        
   88F7 96 4C         [ 3] 1215         ldaa    (0x004C)
   88F9 7D 04 5C      [ 6] 1216         tst     (0x045C)        ; R12/CNR?
   88FC 27 0D         [ 3] 1217         beq     L88FB           ; if R12, jump ahead
   88FE 81 3C         [ 2] 1218         cmpa    #0x3C
   8900 25 09         [ 3] 1219         bcs     L88FB           ; if char < 0x3C, jump ahead
   8902 81 3F         [ 2] 1220         cmpa    #0x3F
   8904 22 05         [ 3] 1221         bhi     L88FB           ; if char > 0x3F, jump ahead 
   8906 BD 89 A3      [ 6] 1222         jsr     L8993           ; process char (0x3C-0x3F)
   8909 20 65         [ 3] 1223         bra     L8960           ; rts
   890B                    1224 L88FB:
   890B 1A 83 30 48   [ 5] 1225         cpd     #0x3048
   890F 27 79         [ 3] 1226         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8911 1A 83 31 48   [ 5] 1227         cpd     #0x3148
   8915 27 5A         [ 3] 1228         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8917 1A 83 34 4D   [ 5] 1229         cpd     #0x344D
   891B 27 6D         [ 3] 1230         beq     L897A           ; turn off 3 bits on boards 1,3,4
   891D 1A 83 35 4D   [ 5] 1231         cpd     #0x354D
   8921 27 4E         [ 3] 1232         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8923 1A 83 36 4D   [ 5] 1233         cpd     #0x364D
   8927 27 61         [ 3] 1234         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8929 1A 83 37 4D   [ 5] 1235         cpd     #0x374D
   892D 27 42         [ 3] 1236         beq     L8961           ; turn on 3 bits on boards 1,3,4
   892F CE 10 80      [ 3] 1237         ldx     #0x1080
   8932 D6 4C         [ 3] 1238         ldab    (0x004C)
   8934 C0 30         [ 2] 1239         subb    #0x30
   8936 54            [ 2] 1240         lsrb
   8937 58            [ 2] 1241         aslb
   8938 58            [ 2] 1242         aslb
   8939 3A            [ 3] 1243         abx
   893A D6 4B         [ 3] 1244         ldab    (0x004B)
   893C C1 50         [ 2] 1245         cmpb    #0x50
   893E 24 30         [ 3] 1246         bcc     L8960           ; if char >= 0x50, return
   8940 C1 47         [ 2] 1247         cmpb    #0x47           
   8942 23 02         [ 3] 1248         bls     L8936           ; if char <= 0x47, skip increments
   8944 08            [ 3] 1249         inx                     ; skip to port B of this PIA
   8945 08            [ 3] 1250         inx
   8946                    1251 L8936:
   8946 C0 40         [ 2] 1252         subb    #0x40           ; 
   8948 C4 07         [ 2] 1253         andb    #0x07
   894A 4F            [ 2] 1254         clra
   894B 0D            [ 2] 1255         sec
   894C 49            [ 2] 1256         rola
   894D 5D            [ 2] 1257         tstb
   894E 27 04         [ 3] 1258         beq     L8944  
   8950                    1259 L8940:
   8950 49            [ 2] 1260         rola
   8951 5A            [ 2] 1261         decb
   8952 26 FC         [ 3] 1262         bne     L8940  
   8954                    1263 L8944:
   8954 97 50         [ 3] 1264         staa    (0x0050)
   8956 96 4C         [ 3] 1265         ldaa    (0x004C)
   8958 84 01         [ 2] 1266         anda    #0x01
   895A 27 08         [ 3] 1267         beq     L8954
                           1268 ; set bit to a 1 using the mask
   895C A6 00         [ 4] 1269         ldaa    0,X
   895E 9A 50         [ 3] 1270         oraa    (0x0050)
   8960 A7 00         [ 4] 1271         staa    0,X
   8962 20 0C         [ 3] 1272         bra     L8960
                           1273 ; set bit to 0 using the mask
   8964                    1274 L8954:
   8964 96 50         [ 3] 1275         ldaa    (0x0050)
   8966 88 FF         [ 2] 1276         eora    #0xFF
   8968 97 50         [ 3] 1277         staa    (0x0050)
   896A A6 00         [ 4] 1278         ldaa    0,X
   896C 94 50         [ 3] 1279         anda    (0x0050)
   896E A7 00         [ 4] 1280         staa    0,X
   8970                    1281 L8960:
   8970 39            [ 5] 1282         rts
                           1283 
                           1284 ; turn on 3 bits on boards 1,3,4
   8971                    1285 L8961:
   8971 B6 10 82      [ 4] 1286         ldaa    (0x1082)
   8974 8A 01         [ 2] 1287         oraa    #0x01           ; board 1, PIA A, bit 0
   8976 B7 10 82      [ 4] 1288         staa    (0x1082)
   8979 B6 10 8A      [ 4] 1289         ldaa    (0x108A)
   897C 8A 20         [ 2] 1290         oraa    #0x20           ; board 3, PIA B, bit 5
   897E B7 10 8A      [ 4] 1291         staa    (0x108A)
   8981 B6 10 8E      [ 4] 1292         ldaa    (0x108E)        ; board 4, PIA B, bit 5
   8984 8A 20         [ 2] 1293         oraa    #0x20
   8986 B7 10 8E      [ 4] 1294         staa    (0x108E)
   8989 39            [ 5] 1295         rts
                           1296 
                           1297 ; turn off 3 bits on boards 1,3,4
   898A                    1298 L897A:
   898A B6 10 82      [ 4] 1299         ldaa    (0x1082)
   898D 84 FE         [ 2] 1300         anda    #0xFE
   898F B7 10 82      [ 4] 1301         staa    (0x1082)
   8992 B6 10 8A      [ 4] 1302         ldaa    (0x108A)
   8995 84 DF         [ 2] 1303         anda    #0xDF
   8997 B7 10 8A      [ 4] 1304         staa    (0x108A)
   899A B6 10 8E      [ 4] 1305         ldaa    (0x108E)
   899D 84 DF         [ 2] 1306         anda    #0xDF
   899F B7 10 8E      [ 4] 1307         staa    (0x108E)
   89A2 39            [ 5] 1308         rts
                           1309 
                           1310 ; process 0x3C-0x3F in CNR mode
   89A3                    1311 L8993:
   89A3 3C            [ 4] 1312         pshx
   89A4 81 3D         [ 2] 1313         cmpa    #0x3D
   89A6 22 05         [ 3] 1314         bhi     L899D           ; if char > 0x3D use second table
   89A8 CE F7 80      [ 3] 1315         ldx     #LF780          ; table at the end
   89AB 20 03         [ 3] 1316         bra     L89A0           ; else use first table
   89AD                    1317 L899D:
   89AD CE F7 A0      [ 3] 1318         ldx     #LF7A0          ; table at the end
   89B0                    1319 L89A0:
   89B0 C0 40         [ 2] 1320         subb    #0x40           
   89B2 58            [ 2] 1321         aslb
   89B3 3A            [ 3] 1322         abx
   89B4 81 3C         [ 2] 1323         cmpa    #0x3C
   89B6 27 34         [ 3] 1324         beq     L89DC           ; board 7 - turn off A & B with table value mask 
   89B8 81 3D         [ 2] 1325         cmpa    #0x3D
   89BA 27 0A         [ 3] 1326         beq     L89B6           ; board 7 - turn on A & B with table value mask
   89BC 81 3E         [ 2] 1327         cmpa    #0x3E
   89BE 27 4B         [ 3] 1328         beq     L89FB           ; board 8 - turn off A & B with table value mask 
   89C0 81 3F         [ 2] 1329         cmpa    #0x3F
   89C2 27 15         [ 3] 1330         beq     L89C9           ; board 8 - turn on A & B with table value mask
   89C4 38            [ 5] 1331         pulx
   89C5 39            [ 5] 1332         rts
                           1333 
                           1334 ; board 7 - turn on A & B with table value mask
   89C6                    1335 L89B6:
   89C6 B6 10 98      [ 4] 1336         ldaa    (0x1098)
   89C9 AA 00         [ 4] 1337         oraa    0,X
   89CB B7 10 98      [ 4] 1338         staa    (0x1098)
   89CE 08            [ 3] 1339         inx
   89CF B6 10 9A      [ 4] 1340         ldaa    (0x109A)
   89D2 AA 00         [ 4] 1341         oraa    0,X
   89D4 B7 10 9A      [ 4] 1342         staa    (0x109A)
   89D7 38            [ 5] 1343         pulx
   89D8 39            [ 5] 1344         rts
                           1345 
                           1346 ; board 8 - turn on A & B with table value mask
   89D9                    1347 L89C9:
   89D9 B6 10 9C      [ 4] 1348         ldaa    (0x109C)
   89DC AA 00         [ 4] 1349         oraa    0,X
   89DE B7 10 9C      [ 4] 1350         staa    (0x109C)
   89E1 08            [ 3] 1351         inx
   89E2 B6 10 9E      [ 4] 1352         ldaa    (0x109E)
   89E5 AA 00         [ 4] 1353         oraa    0,X
   89E7 B7 10 9E      [ 4] 1354         staa    (0x109E)
   89EA 38            [ 5] 1355         pulx
   89EB 39            [ 5] 1356         rts
                           1357 
                           1358 ; board 7 - turn off A & B with table value mask
   89EC                    1359 L89DC:
   89EC E6 00         [ 4] 1360         ldab    0,X
   89EE C8 FF         [ 2] 1361         eorb    #0xFF
   89F0 D7 12         [ 3] 1362         stab    (0x0012)
   89F2 B6 10 98      [ 4] 1363         ldaa    (0x1098)
   89F5 94 12         [ 3] 1364         anda    (0x0012)
   89F7 B7 10 98      [ 4] 1365         staa    (0x1098)
   89FA 08            [ 3] 1366         inx
   89FB E6 00         [ 4] 1367         ldab    0,X
   89FD C8 FF         [ 2] 1368         eorb    #0xFF
   89FF D7 12         [ 3] 1369         stab    (0x0012)
   8A01 B6 10 9A      [ 4] 1370         ldaa    (0x109A)
   8A04 94 12         [ 3] 1371         anda    (0x0012)
   8A06 B7 10 9A      [ 4] 1372         staa    (0x109A)
   8A09 38            [ 5] 1373         pulx
   8A0A 39            [ 5] 1374         rts
                           1375 
                           1376 ; board 8 - turn off A & B with table value mask
   8A0B                    1377 L89FB:
   8A0B E6 00         [ 4] 1378         ldab    0,X
   8A0D C8 FF         [ 2] 1379         eorb    #0xFF
   8A0F D7 12         [ 3] 1380         stab    (0x0012)
   8A11 B6 10 9C      [ 4] 1381         ldaa    (0x109C)
   8A14 94 12         [ 3] 1382         anda    (0x0012)
   8A16 B7 10 9C      [ 4] 1383         staa    (0x109C)
   8A19 08            [ 3] 1384         inx
   8A1A E6 00         [ 4] 1385         ldab    0,X
   8A1C C8 FF         [ 2] 1386         eorb    #0xFF
   8A1E D7 12         [ 3] 1387         stab    (0x0012)
   8A20 B6 10 9E      [ 4] 1388         ldaa    (0x109E)
   8A23 94 12         [ 3] 1389         anda    (0x0012)
   8A25 B7 10 9E      [ 4] 1390         staa    (0x109E)
   8A28 38            [ 5] 1391         pulx
   8A29 39            [ 5] 1392         rts
                           1393 
                           1394 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1395 
   8A2A                    1396 L8A1A:
                           1397 ; Parse text with compressed ANSI stuff from table location in X
   8A2A 3C            [ 4] 1398         pshx
   8A2B                    1399 L8A1B:
   8A2B 86 04         [ 2] 1400         ldaa    #0x04
   8A2D B5 18 0D      [ 4] 1401         bita    SCCCTRLA
   8A30 27 F9         [ 3] 1402         beq     L8A1B  
   8A32 A6 00         [ 4] 1403         ldaa    0,X     
   8A34 26 03         [ 3] 1404         bne     L8A29           ; if not nul, continue
   8A36 7E 8B 31      [ 3] 1405         jmp     L8B21           ; else jump to exit
                           1406 ; process ^0123 into ESC[01;23H - ANSI Cursor positioning - (1 based)
   8A39                    1407 L8A29:
   8A39 08            [ 3] 1408         inx
   8A3A 81 5E         [ 2] 1409         cmpa    #0x5E           ; is it a '^' ?
   8A3C 26 1D         [ 3] 1410         bne     L8A4B           ; no, jump ahead
   8A3E A6 00         [ 4] 1411         ldaa    0,X             ; yes, get the next char
   8A40 08            [ 3] 1412         inx
   8A41 B7 05 92      [ 4] 1413         staa    (0x0592)    
   8A44 A6 00         [ 4] 1414         ldaa    0,X     
   8A46 08            [ 3] 1415         inx
   8A47 B7 05 93      [ 4] 1416         staa    (0x0593)
   8A4A A6 00         [ 4] 1417         ldaa    0,X     
   8A4C 08            [ 3] 1418         inx
   8A4D B7 05 95      [ 4] 1419         staa    (0x0595)
   8A50 A6 00         [ 4] 1420         ldaa    0,X     
   8A52 08            [ 3] 1421         inx
   8A53 B7 05 96      [ 4] 1422         staa    (0x0596)
   8A56 BD 8B 33      [ 6] 1423         jsr     L8B23
   8A59 20 D0         [ 3] 1424         bra     L8A1B  
                           1425 ; process @...
   8A5B                    1426 L8A4B:
   8A5B 81 40         [ 2] 1427         cmpa    #0x40           ; is it a '@' ?
   8A5D 26 3B         [ 3] 1428         bne     L8A8A  
   8A5F 1A EE 00      [ 6] 1429         ldy     0,X
   8A62 08            [ 3] 1430         inx
   8A63 08            [ 3] 1431         inx
   8A64 86 30         [ 2] 1432         ldaa    #0x30
   8A66 97 B1         [ 3] 1433         staa    (0x00B1)
   8A68 18 A6 00      [ 5] 1434         ldaa    0,Y
   8A6B                    1435 L8A5B:
   8A6B 81 64         [ 2] 1436         cmpa    #0x64
   8A6D 25 07         [ 3] 1437         bcs     L8A66  
   8A6F 7C 00 B1      [ 6] 1438         inc     (0x00B1)
   8A72 80 64         [ 2] 1439         suba    #0x64
   8A74 20 F5         [ 3] 1440         bra     L8A5B  
   8A76                    1441 L8A66:
   8A76 36            [ 3] 1442         psha
   8A77 96 B1         [ 3] 1443         ldaa    (0x00B1)
   8A79 BD 8B 4B      [ 6] 1444         jsr     L8B3B
   8A7C 86 30         [ 2] 1445         ldaa    #0x30
   8A7E 97 B1         [ 3] 1446         staa    (0x00B1)
   8A80 32            [ 4] 1447         pula
   8A81                    1448 L8A71:
   8A81 81 0A         [ 2] 1449         cmpa    #0x0A
   8A83 25 07         [ 3] 1450         bcs     L8A7C  
   8A85 7C 00 B1      [ 6] 1451         inc     (0x00B1)
   8A88 80 0A         [ 2] 1452         suba    #0x0A
   8A8A 20 F5         [ 3] 1453         bra     L8A71  
   8A8C                    1454 L8A7C:
   8A8C 36            [ 3] 1455         psha
   8A8D 96 B1         [ 3] 1456         ldaa    (0x00B1)
   8A8F BD 8B 4B      [ 6] 1457         jsr     L8B3B
   8A92 32            [ 4] 1458         pula
   8A93 8B 30         [ 2] 1459         adda    #0x30
   8A95 BD 8B 4B      [ 6] 1460         jsr     L8B3B
   8A98 20 91         [ 3] 1461         bra     L8A1B
                           1462 ; process |...
   8A9A                    1463 L8A8A:
   8A9A 81 7C         [ 2] 1464         cmpa    #0x7C           ; is it a '|' ?
   8A9C 26 59         [ 3] 1465         bne     L8AE7  
   8A9E 1A EE 00      [ 6] 1466         ldy     0,X     
   8AA1 08            [ 3] 1467         inx
   8AA2 08            [ 3] 1468         inx
   8AA3 86 30         [ 2] 1469         ldaa    #0x30
   8AA5 97 B1         [ 3] 1470         staa    (0x00B1)
   8AA7 18 EC 00      [ 6] 1471         ldd     0,Y     
   8AAA                    1472 L8A9A:
   8AAA 1A 83 27 10   [ 5] 1473         cpd     #0x2710
   8AAE 25 08         [ 3] 1474         bcs     L8AA8  
   8AB0 7C 00 B1      [ 6] 1475         inc     (0x00B1)
   8AB3 83 27 10      [ 4] 1476         subd    #0x2710
   8AB6 20 F2         [ 3] 1477         bra     L8A9A  
   8AB8                    1478 L8AA8:
   8AB8 36            [ 3] 1479         psha
   8AB9 96 B1         [ 3] 1480         ldaa    (0x00B1)
   8ABB BD 8B 4B      [ 6] 1481         jsr     L8B3B
   8ABE 86 30         [ 2] 1482         ldaa    #0x30
   8AC0 97 B1         [ 3] 1483         staa    (0x00B1)
   8AC2 32            [ 4] 1484         pula
   8AC3                    1485 L8AB3:
   8AC3 1A 83 03 E8   [ 5] 1486         cpd     #0x03E8
   8AC7 25 08         [ 3] 1487         bcs     L8AC1  
   8AC9 7C 00 B1      [ 6] 1488         inc     (0x00B1)
   8ACC 83 03 E8      [ 4] 1489         subd    #0x03E8
   8ACF 20 F2         [ 3] 1490         bra     L8AB3  
   8AD1                    1491 L8AC1:
   8AD1 36            [ 3] 1492         psha
   8AD2 96 B1         [ 3] 1493         ldaa    (0x00B1)
   8AD4 BD 8B 4B      [ 6] 1494         jsr     L8B3B
   8AD7 86 30         [ 2] 1495         ldaa    #0x30
   8AD9 97 B1         [ 3] 1496         staa    (0x00B1)
   8ADB 32            [ 4] 1497         pula
   8ADC                    1498 L8ACC:
   8ADC 1A 83 00 64   [ 5] 1499         cpd     #0x0064
   8AE0 25 08         [ 3] 1500         bcs     L8ADA  
   8AE2 7C 00 B1      [ 6] 1501         inc     (0x00B1)
   8AE5 83 00 64      [ 4] 1502         subd    #0x0064
   8AE8 20 F2         [ 3] 1503         bra     L8ACC  
   8AEA                    1504 L8ADA:
   8AEA 96 B1         [ 3] 1505         ldaa    (0x00B1)
   8AEC BD 8B 4B      [ 6] 1506         jsr     L8B3B
   8AEF 86 30         [ 2] 1507         ldaa    #0x30
   8AF1 97 B1         [ 3] 1508         staa    (0x00B1)
   8AF3 17            [ 2] 1509         tba
   8AF4 7E 8A 81      [ 3] 1510         jmp     L8A71
                           1511 ; process ~...
   8AF7                    1512 L8AE7:
   8AF7 81 7E         [ 2] 1513         cmpa    #0x7E           ; is it a '~' ?
   8AF9 26 18         [ 3] 1514         bne     L8B03  
   8AFB E6 00         [ 4] 1515         ldab    0,X     
   8AFD C0 30         [ 2] 1516         subb    #0x30
   8AFF 08            [ 3] 1517         inx
   8B00 1A EE 00      [ 6] 1518         ldy     0,X     
   8B03 08            [ 3] 1519         inx
   8B04 08            [ 3] 1520         inx
   8B05                    1521 L8AF5:
   8B05 18 A6 00      [ 5] 1522         ldaa    0,Y     
   8B08 18 08         [ 4] 1523         iny
   8B0A BD 8B 4B      [ 6] 1524         jsr     L8B3B
   8B0D 5A            [ 2] 1525         decb
   8B0E 26 F5         [ 3] 1526         bne     L8AF5  
   8B10 7E 8A 2B      [ 3] 1527         jmp     L8A1B
                           1528 ; process %...
   8B13                    1529 L8B03:
   8B13 81 25         [ 2] 1530         cmpa    #0x25           ; is it a '%' ?
   8B15 26 14         [ 3] 1531         bne     L8B1B  
   8B17 CE 05 90      [ 3] 1532         ldx     #0x0590
   8B1A CC 1B 5B      [ 3] 1533         ldd     #0x1B5B
   8B1D ED 00         [ 5] 1534         std     0,X     
   8B1F 86 4B         [ 2] 1535         ldaa    #0x4B
   8B21 A7 02         [ 4] 1536         staa    2,X
   8B23 6F 03         [ 6] 1537         clr     3,X
   8B25 BD 8A 2A      [ 6] 1538         jsr     L8A1A  
   8B28 7E 8A 2B      [ 3] 1539         jmp     L8A1B
   8B2B                    1540 L8B1B:
   8B2B B7 18 0F      [ 4] 1541         staa    SCCDATAA
   8B2E 7E 8A 2B      [ 3] 1542         jmp     L8A1B
   8B31                    1543 L8B21:
   8B31 38            [ 5] 1544         pulx
   8B32 39            [ 5] 1545         rts
                           1546 
                           1547 ; generate cursor positioning code
   8B33                    1548 L8B23:
   8B33 3C            [ 4] 1549         pshx
   8B34 CE 05 90      [ 3] 1550         ldx     #0x0590
   8B37 CC 1B 5B      [ 3] 1551         ldd     #0x1B5B
   8B3A ED 00         [ 5] 1552         std     0,X     
   8B3C 86 48         [ 2] 1553         ldaa    #0x48           ;'H'
   8B3E A7 07         [ 4] 1554         staa    7,X
   8B40 86 3B         [ 2] 1555         ldaa    #0x3B           ;';'
   8B42 A7 04         [ 4] 1556         staa    4,X
   8B44 6F 08         [ 6] 1557         clr     8,X
   8B46 BD 8A 2A      [ 6] 1558         jsr     L8A1A           ;012345678 - esc[01;23H;
   8B49 38            [ 5] 1559         pulx
   8B4A 39            [ 5] 1560         rts
                           1561 
                           1562 ;
   8B4B                    1563 L8B3B:
   8B4B 36            [ 3] 1564         psha
   8B4C                    1565 L8B3C:
   8B4C 86 04         [ 2] 1566         ldaa    #0x04
   8B4E B5 18 0D      [ 4] 1567         bita    SCCCTRLA
   8B51 27 F9         [ 3] 1568         beq     L8B3C
   8B53 32            [ 4] 1569         pula
   8B54 B7 18 0F      [ 4] 1570         staa    SCCDATAA
   8B57 39            [ 5] 1571         rts
                           1572 
   8B58                    1573 L8B48:
   8B58 BD A3 6B      [ 6] 1574         jsr     LA32E
                           1575 
   8B5B BD 8D F4      [ 6] 1576         jsr     LCDMSG1 
   8B5E 4C 69 67 68 74 20  1577         .ascis  'Light Diagnostic'
        44 69 61 67 6E 6F
        73 74 69 E3
                           1578 
   8B6E BD 8D ED      [ 6] 1579         jsr     LCDMSG2 
   8B71 43 75 72 74 61 69  1580         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           1581 
   8B81 C6 14         [ 2] 1582         ldab    #0x14
   8B83 BD 8C 40      [ 6] 1583         jsr     DLYSECSBY2      ; delay 10 sec
   8B86 C6 FF         [ 2] 1584         ldab    #0xFF
   8B88 F7 10 98      [ 4] 1585         stab    (0x1098)
   8B8B F7 10 9A      [ 4] 1586         stab    (0x109A)
   8B8E F7 10 9C      [ 4] 1587         stab    (0x109C)
   8B91 F7 10 9E      [ 4] 1588         stab    (0x109E)
   8B94 BD FA F9      [ 6] 1589         jsr     BUTNLIT 
   8B97 B6 18 04      [ 4] 1590         ldaa    PIA0PRA 
   8B9A 8A 40         [ 2] 1591         oraa    #0x40
   8B9C B7 18 04      [ 4] 1592         staa    PIA0PRA 
                           1593 
   8B9F BD 8D F4      [ 6] 1594         jsr     LCDMSG1 
   8BA2 20 50 72 65 73 73  1595         .ascis  ' Press ENTER to '
        20 45 4E 54 45 52
        20 74 6F A0
                           1596 
   8BB2 BD 8D ED      [ 6] 1597         jsr     LCDMSG2 
   8BB5 74 75 72 6E 20 6C  1598         .ascis  'turn lights  off'
        69 67 68 74 73 20
        20 6F 66 E6
                           1599 
   8BC5                    1600 L8BB5:
   8BC5 BD 8E A5      [ 6] 1601         jsr     L8E95
   8BC8 81 0D         [ 2] 1602         cmpa    #0x0D
   8BCA 26 F9         [ 3] 1603         bne     L8BB5  
   8BCC BD A3 7E      [ 6] 1604         jsr     LA341
   8BCF 39            [ 5] 1605         rts
                           1606 
                           1607 ; setup IRQ handlers!
   8BD0                    1608 L8BC0:
   8BD0 86 80         [ 2] 1609         ldaa    #0x80
   8BD2 B7 10 22      [ 4] 1610         staa    TMSK1
   8BD5 CE AC 09      [ 3] 1611         ldx     #LABCC
   8BD8 FF 01 19      [ 5] 1612         stx     (0x0119)        ; setup T1OC handler
   8BDB CE AD 49      [ 3] 1613         ldx     #LAD0C
                           1614 
   8BDE FF 01 16      [ 5] 1615         stx     (0x0116)        ; setup T2OC handler
   8BE1 CE AD 49      [ 3] 1616         ldx     #LAD0C
   8BE4 FF 01 2E      [ 5] 1617         stx     (0x012E)        ; doubles as SWI handler
   8BE7 86 7E         [ 2] 1618         ldaa    #0x7E
   8BE9 B7 01 18      [ 4] 1619         staa    (0x0118)
   8BEC B7 01 15      [ 4] 1620         staa    (0x0115)
   8BEF B7 01 2D      [ 4] 1621         staa    (0x012D)
   8BF2 4F            [ 2] 1622         clra
   8BF3 5F            [ 2] 1623         clrb
   8BF4 DD 1B         [ 4] 1624         std     CDTIMR1         ; Reset all the countdown timers
   8BF6 DD 1D         [ 4] 1625         std     CDTIMR2
   8BF8 DD 1F         [ 4] 1626         std     CDTIMR3
   8BFA DD 21         [ 4] 1627         std     CDTIMR4
   8BFC DD 23         [ 4] 1628         std     CDTIMR5
                           1629 
   8BFE                    1630 L8BEE:
   8BFE 86 C0         [ 2] 1631         ldaa    #0xC0
   8C00 B7 10 23      [ 4] 1632         staa    TFLG1
   8C03 39            [ 5] 1633         rts
                           1634 
   8C04                    1635 L8BF4:
   8C04 B6 10 0A      [ 4] 1636         ldaa    PORTE
   8C07 88 FF         [ 2] 1637         eora    #0xFF
   8C09 16            [ 2] 1638         tab
   8C0A D7 62         [ 3] 1639         stab    (0x0062)
   8C0C BD FA F9      [ 6] 1640         jsr     BUTNLIT 
   8C0F 20 F3         [ 3] 1641         bra     L8BF4  
   8C11 39            [ 5] 1642         rts
                           1643 
                           1644 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1645 
                           1646 ; Delay B seconds, with random motions if enabled
   8C12                    1647 DLYSECS:
   8C12 36            [ 3] 1648         psha
   8C13 86 64         [ 2] 1649         ldaa    #0x64
   8C15 3D            [10] 1650         mul
   8C16 DD 23         [ 4] 1651         std     CDTIMR5         ; store B*100 here
   8C18                    1652 L8C08:
   8C18 BD 9B 29      [ 6] 1653         jsr     L9B19           ; do the random motions if enabled
   8C1B DC 23         [ 4] 1654         ldd     CDTIMR5
   8C1D 26 F9         [ 3] 1655         bne     L8C08  
   8C1F 32            [ 4] 1656         pula
   8C20 39            [ 5] 1657         rts
                           1658 
                           1659 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1660 
                           1661 ; Delay 1 minute, with random motions if enabled - unused?
   8C21                    1662 DLY1MIN:
   8C21 36            [ 3] 1663         psha
   8C22 86 3C         [ 2] 1664         ldaa    #0x3C
   8C24                    1665 L8C14:
   8C24 97 28         [ 3] 1666         staa    (0x0028)
   8C26 C6 01         [ 2] 1667         ldab    #0x01           ; delay 1 sec
   8C28 BD 8C 12      [ 6] 1668         jsr     DLYSECS         ;
   8C2B 96 28         [ 3] 1669         ldaa    (0x0028)
   8C2D 4A            [ 2] 1670         deca
   8C2E 26 F4         [ 3] 1671         bne     L8C14  
   8C30 32            [ 4] 1672         pula
   8C31 39            [ 5] 1673         rts
                           1674 
                           1675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1676 
                           1677 ; Delay by B hundreths of a second, with random motions if enabled
   8C32                    1678 DLYSECSBY100:
   8C32 36            [ 3] 1679         psha
   8C33 4F            [ 2] 1680         clra
   8C34 DD 23         [ 4] 1681         std     CDTIMR5
   8C36                    1682 L8C26:
   8C36 BD 9B 29      [ 6] 1683         jsr     L9B19           ; do the random motions if enabled
   8C39 7D 00 24      [ 6] 1684         tst     CDTIMR5+1
   8C3C 26 F8         [ 3] 1685         bne     L8C26
   8C3E 32            [ 4] 1686         pula
   8C3F 39            [ 5] 1687         rts
                           1688 
                           1689 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1690 
                           1691 ; Delay by B half-seconds
   8C40                    1692 DLYSECSBY2:
   8C40 36            [ 3] 1693         psha
   8C41 86 32         [ 2] 1694         ldaa    #0x32           ; 50
   8C43 3D            [10] 1695         mul
   8C44 DD 23         [ 4] 1696         std     CDTIMR5
   8C46                    1697 L8C36:
   8C46 DC 23         [ 4] 1698         ldd     CDTIMR5
   8C48 26 FC         [ 3] 1699         bne     L8C36
   8C4A 32            [ 4] 1700         pula
   8C4B 39            [ 5] 1701         rts
                           1702 
                           1703 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1704 ; LCD routines
                           1705 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1706 
   8C4C                    1707 L8C3C:
   8C4C 86 FF         [ 2] 1708         ldaa    #0xFF
   8C4E B7 10 01      [ 4] 1709         staa    DDRA  
   8C51 86 FF         [ 2] 1710         ldaa    #0xFF
   8C53 B7 10 03      [ 4] 1711         staa    DDRG 
   8C56 B6 10 02      [ 4] 1712         ldaa    PORTG  
   8C59 8A 02         [ 2] 1713         oraa    #0x02
   8C5B B7 10 02      [ 4] 1714         staa    PORTG  
   8C5E 86 38         [ 2] 1715         ldaa    #0x38
   8C60 BD 8C 96      [ 6] 1716         jsr     L8C86           ; write byte to LCD
   8C63 86 38         [ 2] 1717         ldaa    #0x38
   8C65 BD 8C 96      [ 6] 1718         jsr     L8C86           ; write byte to LCD
   8C68 86 06         [ 2] 1719         ldaa    #0x06
   8C6A BD 8C 96      [ 6] 1720         jsr     L8C86           ; write byte to LCD
   8C6D 86 0E         [ 2] 1721         ldaa    #0x0E
   8C6F BD 8C 96      [ 6] 1722         jsr     L8C86           ; write byte to LCD
   8C72 86 01         [ 2] 1723         ldaa    #0x01
   8C74 BD 8C 96      [ 6] 1724         jsr     L8C86           ; write byte to LCD
   8C77 CE 00 FF      [ 3] 1725         ldx     #0x00FF
   8C7A                    1726 L8C6A:
   8C7A 01            [ 2] 1727         nop
   8C7B 01            [ 2] 1728         nop
   8C7C 09            [ 3] 1729         dex
   8C7D 26 FB         [ 3] 1730         bne     L8C6A  
   8C7F 39            [ 5] 1731         rts
                           1732 
                           1733 ; toggle LCD ENABLE
   8C80                    1734 L8C70:
   8C80 B6 10 02      [ 4] 1735         ldaa    PORTG  
   8C83 84 FD         [ 2] 1736         anda    #0xFD           ; clear LCD ENABLE
   8C85 B7 10 02      [ 4] 1737         staa    PORTG  
   8C88 8A 02         [ 2] 1738         oraa    #0x02           ; set LCD ENABLE
   8C8A B7 10 02      [ 4] 1739         staa    PORTG  
   8C8D 39            [ 5] 1740         rts
                           1741 
                           1742 ; Reset LCD buffer?
   8C8E                    1743 L8C7E:
   8C8E CC 05 00      [ 3] 1744         ldd     #0x0500         ; Reset LCD queue?
   8C91 DD 46         [ 4] 1745         std     (0x0046)        ; write pointer
   8C93 DD 44         [ 4] 1746         std     (0x0044)        ; read pointer?
   8C95 39            [ 5] 1747         rts
                           1748 
                           1749 ; write byte to LCD
   8C96                    1750 L8C86:
   8C96 BD 8C CD      [ 6] 1751         jsr     L8CBD           ; wait for LCD not busy
   8C99 B7 10 00      [ 4] 1752         staa    PORTA  
   8C9C B6 10 02      [ 4] 1753         ldaa    PORTG       
   8C9F 84 F3         [ 2] 1754         anda    #0xF3           ; LCD RS and LCD RW low
   8CA1                    1755 L8C91:
   8CA1 B7 10 02      [ 4] 1756         staa    PORTG  
   8CA4 BD 8C 80      [ 6] 1757         jsr     L8C70           ; toggle LCD ENABLE
   8CA7 39            [ 5] 1758         rts
                           1759 
                           1760 ; ???
   8CA8                    1761 L8C98:
   8CA8 BD 8C CD      [ 6] 1762         jsr     L8CBD           ; wait for LCD not busy
   8CAB B7 10 00      [ 4] 1763         staa    PORTA  
   8CAE B6 10 02      [ 4] 1764         ldaa    PORTG  
   8CB1 84 FB         [ 2] 1765         anda    #0xFB
   8CB3 8A 08         [ 2] 1766         oraa    #0x08
   8CB5 20 EA         [ 3] 1767         bra     L8C91  
   8CB7 BD 8C CD      [ 6] 1768         jsr     L8CBD           ; wait for LCD not busy
   8CBA B6 10 02      [ 4] 1769         ldaa    PORTG  
   8CBD 84 F7         [ 2] 1770         anda    #0xF7
   8CBF 8A 08         [ 2] 1771         oraa    #0x08
   8CC1 20 DE         [ 3] 1772         bra     L8C91  
   8CC3 BD 8C CD      [ 6] 1773         jsr     L8CBD           ; wait for LCD not busy
   8CC6 B6 10 02      [ 4] 1774         ldaa    PORTG  
   8CC9 8A 0C         [ 2] 1775         oraa    #0x0C
   8CCB 20 D4         [ 3] 1776         bra     L8C91  
                           1777 
                           1778 ; wait for LCD not busy (or timeout)
   8CCD                    1779 L8CBD:
   8CCD 36            [ 3] 1780         psha
   8CCE 37            [ 3] 1781         pshb
   8CCF C6 FF         [ 2] 1782         ldab    #0xFF           ; init timeout counter
   8CD1                    1783 L8CC1:
   8CD1 5D            [ 2] 1784         tstb
   8CD2 27 1A         [ 3] 1785         beq     L8CDE           ; times up, exit
   8CD4 B6 10 02      [ 4] 1786         ldaa    PORTG  
   8CD7 84 F7         [ 2] 1787         anda    #0xF7           ; bit 3 low
   8CD9 8A 04         [ 2] 1788         oraa    #0x04           ; bit 3 high
   8CDB B7 10 02      [ 4] 1789         staa    PORTG           ; LCD RS high
   8CDE BD 8C 80      [ 6] 1790         jsr     L8C70           ; toggle LCD ENABLE
   8CE1 7F 10 01      [ 6] 1791         clr     DDRA  
   8CE4 B6 10 00      [ 4] 1792         ldaa    PORTA           ; read busy flag from LCD
   8CE7 2B 08         [ 3] 1793         bmi     L8CE1           ; if busy, keep looping
   8CE9 86 FF         [ 2] 1794         ldaa    #0xFF
   8CEB B7 10 01      [ 4] 1795         staa    DDRA            ; port A back to outputs
   8CEE                    1796 L8CDE:
   8CEE 33            [ 4] 1797         pulb                    ; and exit
   8CEF 32            [ 4] 1798         pula
   8CF0 39            [ 5] 1799         rts
                           1800 
   8CF1                    1801 L8CE1:
   8CF1 5A            [ 2] 1802         decb                    ; decrement timer
   8CF2 86 FF         [ 2] 1803         ldaa    #0xFF
   8CF4 B7 10 01      [ 4] 1804         staa    DDRA            ; port A back to outputs
   8CF7 20 D8         [ 3] 1805         bra     L8CC1           ; loop
                           1806 
   8CF9                    1807 L8CE9:
   8CF9 BD 8C CD      [ 6] 1808         jsr     L8CBD           ; wait for LCD not busy
   8CFC 86 01         [ 2] 1809         ldaa    #0x01
   8CFE BD 8C 96      [ 6] 1810         jsr     L8C86           ; write byte to LCD
   8D01 39            [ 5] 1811         rts
                           1812 
   8D02                    1813 L8CF2:
   8D02 BD 8C CD      [ 6] 1814         jsr     L8CBD           ; wait for LCD not busy
   8D05 86 80         [ 2] 1815         ldaa    #0x80
   8D07 BD 8D 24      [ 6] 1816         jsr     L8D14
   8D0A BD 8C CD      [ 6] 1817         jsr     L8CBD           ; wait for LCD not busy
   8D0D 86 80         [ 2] 1818         ldaa    #0x80
   8D0F BD 8C 96      [ 6] 1819         jsr     L8C86           ; write byte to LCD
   8D12 39            [ 5] 1820         rts
                           1821 
   8D13                    1822 L8D03:
   8D13 BD 8C CD      [ 6] 1823         jsr     L8CBD           ; wait for LCD not busy
   8D16 86 C0         [ 2] 1824         ldaa    #0xC0
   8D18 BD 8D 24      [ 6] 1825         jsr     L8D14
   8D1B BD 8C CD      [ 6] 1826         jsr     L8CBD           ; wait for LCD not busy
   8D1E 86 C0         [ 2] 1827         ldaa    #0xC0
   8D20 BD 8C 96      [ 6] 1828         jsr     L8C86           ; write byte to LCD
   8D23 39            [ 5] 1829         rts
                           1830 
   8D24                    1831 L8D14:
   8D24 BD 8C 96      [ 6] 1832         jsr     L8C86           ; write byte to LCD
   8D27 86 10         [ 2] 1833         ldaa    #0x10
   8D29 97 14         [ 3] 1834         staa    (0x0014)
   8D2B                    1835 L8D1B:
   8D2B BD 8C CD      [ 6] 1836         jsr     L8CBD           ; wait for LCD not busy
   8D2E 86 20         [ 2] 1837         ldaa    #0x20
   8D30 BD 8C A8      [ 6] 1838         jsr     L8C98
   8D33 7A 00 14      [ 6] 1839         dec     (0x0014)
   8D36 26 F3         [ 3] 1840         bne     L8D1B  
   8D38 39            [ 5] 1841         rts
                           1842 
   8D39                    1843 L8D29:
   8D39 86 0C         [ 2] 1844         ldaa    #0x0C
   8D3B BD 8E 5B      [ 6] 1845         jsr     L8E4B
   8D3E 39            [ 5] 1846         rts
                           1847 
                           1848 ; Unused?
   8D3F                    1849 L8D2F:
   8D3F 86 0E         [ 2] 1850         ldaa    #0x0E
   8D41 BD 8E 5B      [ 6] 1851         jsr     L8E4B
   8D44 39            [ 5] 1852         rts
                           1853 
   8D45                    1854 L8D35:
   8D45 7F 00 4A      [ 6] 1855         clr     (0x004A)
   8D48 7F 00 43      [ 6] 1856         clr     (0x0043)
   8D4B 18 DE 46      [ 5] 1857         ldy     (0x0046)
   8D4E 86 C0         [ 2] 1858         ldaa    #0xC0
   8D50 20 0B         [ 3] 1859         bra     L8D4D
                           1860 
   8D52                    1861 L8D42:
   8D52 7F 00 4A      [ 6] 1862         clr     (0x004A)
   8D55 7F 00 43      [ 6] 1863         clr     (0x0043)
   8D58 18 DE 46      [ 5] 1864         ldy     (0x0046)
   8D5B 86 80         [ 2] 1865         ldaa    #0x80
   8D5D                    1866 L8D4D:
   8D5D 18 A7 00      [ 5] 1867         staa    0,Y     
   8D60 18 6F 01      [ 7] 1868         clr     1,Y     
   8D63 18 08         [ 4] 1869         iny
   8D65 18 08         [ 4] 1870         iny
   8D67 18 8C 05 80   [ 5] 1871         cpy     #0x0580
   8D6B 25 04         [ 3] 1872         bcs     L8D61  
   8D6D 18 CE 05 00   [ 4] 1873         ldy     #0x0500
   8D71                    1874 L8D61:
   8D71 C6 0F         [ 2] 1875         ldab    #0x0F
   8D73                    1876 L8D63:
   8D73 96 4A         [ 3] 1877         ldaa    (0x004A)
   8D75 27 FC         [ 3] 1878         beq     L8D63  
   8D77 7F 00 4A      [ 6] 1879         clr     (0x004A)
   8D7A 5A            [ 2] 1880         decb
   8D7B 27 1A         [ 3] 1881         beq     L8D87  
   8D7D 81 24         [ 2] 1882         cmpa    #0x24
   8D7F 27 16         [ 3] 1883         beq     L8D87  
   8D81 18 6F 00      [ 7] 1884         clr     0,Y     
   8D84 18 A7 01      [ 5] 1885         staa    1,Y     
   8D87 18 08         [ 4] 1886         iny
   8D89 18 08         [ 4] 1887         iny
   8D8B 18 8C 05 80   [ 5] 1888         cpy     #0x0580
   8D8F 25 04         [ 3] 1889         bcs     L8D85  
   8D91 18 CE 05 00   [ 4] 1890         ldy     #0x0500
   8D95                    1891 L8D85:
   8D95 20 DC         [ 3] 1892         bra     L8D63  
   8D97                    1893 L8D87:
   8D97 5D            [ 2] 1894         tstb
   8D98 27 19         [ 3] 1895         beq     L8DA3  
   8D9A 86 20         [ 2] 1896         ldaa    #0x20
   8D9C                    1897 L8D8C:
   8D9C 18 6F 00      [ 7] 1898         clr     0,Y     
   8D9F 18 A7 01      [ 5] 1899         staa    1,Y     
   8DA2 18 08         [ 4] 1900         iny
   8DA4 18 08         [ 4] 1901         iny
   8DA6 18 8C 05 80   [ 5] 1902         cpy     #0x0580
   8DAA 25 04         [ 3] 1903         bcs     L8DA0  
   8DAC 18 CE 05 00   [ 4] 1904         ldy     #0x0500
   8DB0                    1905 L8DA0:
   8DB0 5A            [ 2] 1906         decb
   8DB1 26 E9         [ 3] 1907         bne     L8D8C  
   8DB3                    1908 L8DA3:
   8DB3 18 6F 00      [ 7] 1909         clr     0,Y     
   8DB6 18 6F 01      [ 7] 1910         clr     1,Y     
   8DB9 18 DF 46      [ 5] 1911         sty     (0x0046)
   8DBC 96 19         [ 3] 1912         ldaa    (0x0019)
   8DBE 97 4E         [ 3] 1913         staa    (0x004E)
   8DC0 86 01         [ 2] 1914         ldaa    #0x01
   8DC2 97 43         [ 3] 1915         staa    (0x0043)
   8DC4 39            [ 5] 1916         rts
                           1917 
                           1918 ; display ASCII in B at location
   8DC5                    1919 L8DB5:
   8DC5 36            [ 3] 1920         psha
   8DC6 37            [ 3] 1921         pshb
   8DC7 C1 4F         [ 2] 1922         cmpb    #0x4F
   8DC9 22 13         [ 3] 1923         bhi     L8DCE  
   8DCB C1 28         [ 2] 1924         cmpb    #0x28
   8DCD 25 03         [ 3] 1925         bcs     L8DC2  
   8DCF 0C            [ 2] 1926         clc
   8DD0 C9 18         [ 2] 1927         adcb    #0x18
   8DD2                    1928 L8DC2:
   8DD2 0C            [ 2] 1929         clc
   8DD3 C9 80         [ 2] 1930         adcb    #0x80
   8DD5 17            [ 2] 1931         tba
   8DD6 BD 8E 5B      [ 6] 1932         jsr     L8E4B           ; send lcd command
   8DD9 33            [ 4] 1933         pulb
   8DDA 32            [ 4] 1934         pula
   8DDB BD 8E 80      [ 6] 1935         jsr     L8E70           ; send lcd char
   8DDE                    1936 L8DCE:
   8DDE 39            [ 5] 1937         rts
                           1938 
                           1939 ; 4 routines to write to the LCD display
                           1940 
                           1941 ; Write to the LCD 1st line - extend past the end of a normal display
   8DDF                    1942 LCDMSG1A:
   8DDF 18 DE 46      [ 5] 1943         ldy     (0x0046)        ; get buffer pointer
   8DE2 86 90         [ 2] 1944         ldaa    #0x90           ; command to set LCD RAM ptr to chr 0x10
   8DE4 20 13         [ 3] 1945         bra     L8DE9  
                           1946 
                           1947 ; Write to the LCD 2st line - extend past the end of a normal display
   8DE6                    1948 LCDMSG2A:
   8DE6 18 DE 46      [ 5] 1949         ldy     (0x0046)        ; get buffer pointer
   8DE9 86 D0         [ 2] 1950         ldaa    #0xD0           ; command to set LCD RAM ptr to chr 0x50
   8DEB 20 0C         [ 3] 1951         bra     L8DE9  
                           1952 
                           1953 ; Write to the LCD 2nd line
   8DED                    1954 LCDMSG2:
   8DED 18 DE 46      [ 5] 1955         ldy     (0x0046)        ; get buffer pointer
   8DF0 86 C0         [ 2] 1956         ldaa    #0xC0           ; command to set LCD RAM ptr to chr 0x40
   8DF2 20 05         [ 3] 1957         bra     L8DE9  
                           1958 
                           1959 ; Write to the LCD 1st line
   8DF4                    1960 LCDMSG1:
   8DF4 18 DE 46      [ 5] 1961         ldy     (0x0046)        ; get buffer pointer
   8DF7 86 80         [ 2] 1962         ldaa    #0x80           ; command to load LCD RAM ptr to chr 0x00
                           1963 
                           1964 ; Put LCD command into a buffer, 4 bytes for each entry?
   8DF9                    1965 L8DE9:
   8DF9 18 A7 00      [ 5] 1966         staa    0,Y             ; store command here
   8DFC 18 6F 01      [ 7] 1967         clr     1,Y             ; clear next byte
   8DFF 18 08         [ 4] 1968         iny
   8E01 18 08         [ 4] 1969         iny
                           1970 
                           1971 ; Add characters at return address to LCD buffer
   8E03 18 8C 05 80   [ 5] 1972         cpy     #0x0580         ; check for buffer overflow
   8E07 25 04         [ 3] 1973         bcs     L8DFD           
   8E09 18 CE 05 00   [ 4] 1974         ldy     #0x0500
   8E0D                    1975 L8DFD:
   8E0D 38            [ 5] 1976         pulx                    ; get start of data
   8E0E DF 17         [ 4] 1977         stx     (0x0017)        ; save this here
   8E10                    1978 L8E00:
   8E10 A6 00         [ 4] 1979         ldaa    0,X             ; get character
   8E12 27 36         [ 3] 1980         beq     L8E3A           ; is it 00, if so jump ahead
   8E14 2B 17         [ 3] 1981         bmi     L8E1D           ; high bit set, if so jump ahead
   8E16 18 6F 00      [ 7] 1982         clr     0,Y             ; add character
   8E19 18 A7 01      [ 5] 1983         staa    1,Y     
   8E1C 08            [ 3] 1984         inx
   8E1D 18 08         [ 4] 1985         iny
   8E1F 18 08         [ 4] 1986         iny
   8E21 18 8C 05 80   [ 5] 1987         cpy     #0x0580         ; check for buffer overflow
   8E25 25 E9         [ 3] 1988         bcs     L8E00  
   8E27 18 CE 05 00   [ 4] 1989         ldy     #0x0500
   8E2B 20 E3         [ 3] 1990         bra     L8E00  
                           1991 
   8E2D                    1992 L8E1D:
   8E2D 84 7F         [ 2] 1993         anda    #0x7F
   8E2F 18 6F 00      [ 7] 1994         clr     0,Y             ; add character
   8E32 18 A7 01      [ 5] 1995         staa    1,Y     
   8E35 18 6F 02      [ 7] 1996         clr     2,Y     
   8E38 18 6F 03      [ 7] 1997         clr     3,Y     
   8E3B 08            [ 3] 1998         inx
   8E3C 18 08         [ 4] 1999         iny
   8E3E 18 08         [ 4] 2000         iny
   8E40 18 8C 05 80   [ 5] 2001         cpy     #0x0580         ; check for overflow
   8E44 25 04         [ 3] 2002         bcs     L8E3A  
   8E46 18 CE 05 00   [ 4] 2003         ldy     #0x0500
                           2004 
   8E4A                    2005 L8E3A:
   8E4A 3C            [ 4] 2006         pshx                    ; put SP back
   8E4B 86 01         [ 2] 2007         ldaa    #0x01
   8E4D 97 43         [ 3] 2008         staa    (0x0043)        ; semaphore?
   8E4F DC 46         [ 4] 2009         ldd     (0x0046)
   8E51 18 6F 00      [ 7] 2010         clr     0,Y     
   8E54 18 6F 01      [ 7] 2011         clr     1,Y     
   8E57 18 DF 46      [ 5] 2012         sty     (0x0046)        ; save buffer pointer
   8E5A 39            [ 5] 2013         rts
                           2014 
                           2015 ; buffer LCD command?
   8E5B                    2016 L8E4B:
   8E5B 18 DE 46      [ 5] 2017         ldy     (0x0046)
   8E5E 18 A7 00      [ 5] 2018         staa    0,Y     
   8E61 18 6F 01      [ 7] 2019         clr     1,Y     
   8E64 18 08         [ 4] 2020         iny
   8E66 18 08         [ 4] 2021         iny
   8E68 18 8C 05 80   [ 5] 2022         cpy     #0x0580
   8E6C 25 04         [ 3] 2023         bcs     L8E62  
   8E6E 18 CE 05 00   [ 4] 2024         ldy     #0x0500
   8E72                    2025 L8E62:
   8E72 18 6F 00      [ 7] 2026         clr     0,Y     
   8E75 18 6F 01      [ 7] 2027         clr     1,Y     
   8E78 86 01         [ 2] 2028         ldaa    #0x01
   8E7A 97 43         [ 3] 2029         staa    (0x0043)
   8E7C 18 DF 46      [ 5] 2030         sty     (0x0046)
   8E7F 39            [ 5] 2031         rts
                           2032 
   8E80                    2033 L8E70:
   8E80 18 DE 46      [ 5] 2034         ldy     (0x0046)
   8E83 18 6F 00      [ 7] 2035         clr     0,Y     
   8E86 18 A7 01      [ 5] 2036         staa    1,Y     
   8E89 18 08         [ 4] 2037         iny
   8E8B 18 08         [ 4] 2038         iny
   8E8D 18 8C 05 80   [ 5] 2039         cpy     #0x0580
   8E91 25 04         [ 3] 2040         bcs     L8E87  
   8E93 18 CE 05 00   [ 4] 2041         ldy     #0x0500
   8E97                    2042 L8E87:
   8E97 18 6F 00      [ 7] 2043         clr     0,Y     
   8E9A 18 6F 01      [ 7] 2044         clr     1,Y     
   8E9D 86 01         [ 2] 2045         ldaa    #0x01
   8E9F 97 43         [ 3] 2046         staa    (0x0043)
   8EA1 18 DF 46      [ 5] 2047         sty     (0x0046)
   8EA4 39            [ 5] 2048         rts
                           2049 
                           2050 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2051 
                           2052 ; Read SCD switches
   8EA5                    2053 L8E95:
   8EA5 96 30         [ 3] 2054         ldaa    (0x0030)
   8EA7 26 09         [ 3] 2055         bne     L8EA2       ; UP - return A=0x01
   8EA9 96 31         [ 3] 2056         ldaa    (0x0031)
   8EAB 26 11         [ 3] 2057         bne     L8EAE       ; DOWN - return A=0x02
   8EAD 96 32         [ 3] 2058         ldaa    (0x0032)
   8EAF 26 19         [ 3] 2059         bne     L8EBA       ; ENTER - return A=0x0D
   8EB1 39            [ 5] 2060         rts                 ; return A=0x00
                           2061 
   8EB2                    2062 L8EA2:
   8EB2 7F 00 30      [ 6] 2063         clr     (0x0030)
   8EB5 7F 00 32      [ 6] 2064         clr     (0x0032)
   8EB8 7F 00 31      [ 6] 2065         clr     (0x0031)
   8EBB 86 01         [ 2] 2066         ldaa    #0x01
   8EBD 39            [ 5] 2067         rts
                           2068 
   8EBE                    2069 L8EAE:
   8EBE 7F 00 31      [ 6] 2070         clr     (0x0031)
   8EC1 7F 00 30      [ 6] 2071         clr     (0x0030)
   8EC4 7F 00 32      [ 6] 2072         clr     (0x0032)
   8EC7 86 02         [ 2] 2073         ldaa    #0x02
   8EC9 39            [ 5] 2074         rts
                           2075 
   8ECA                    2076 L8EBA:
   8ECA 7F 00 32      [ 6] 2077         clr     (0x0032)
   8ECD 7F 00 30      [ 6] 2078         clr     (0x0030)
   8ED0 7F 00 31      [ 6] 2079         clr     (0x0031)
   8ED3 86 0D         [ 2] 2080         ldaa    #0x0D
   8ED5 39            [ 5] 2081         rts
                           2082 
                           2083 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2084 
                           2085 ; Scan SCD keys into up=0x30,down=0x31,enter=0x32
   8ED6                    2086 L8EC6:
   8ED6 B6 18 04      [ 4] 2087         ldaa    PIA0PRA 
   8ED9 84 07         [ 2] 2088         anda    #0x07       ; get button state
   8EDB 97 2C         [ 3] 2089         staa    (0x002C)
   8EDD 78 00 2C      [ 6] 2090         asl     (0x002C)
   8EE0 78 00 2C      [ 6] 2091         asl     (0x002C)
   8EE3 78 00 2C      [ 6] 2092         asl     (0x002C)
   8EE6 78 00 2C      [ 6] 2093         asl     (0x002C)
   8EE9 78 00 2C      [ 6] 2094         asl     (0x002C)    ; put in upper 3 bits of 002C 
   8EEC CE 00 00      [ 3] 2095         ldx     #0x0000
   8EEF                    2096 L8EDF:
   8EEF 8C 00 03      [ 4] 2097         cpx     #0x0003
   8EF2 27 24         [ 3] 2098         beq     L8F08
   8EF4 78 00 2C      [ 6] 2099         asl     (0x002C)    
   8EF7 25 12         [ 3] 2100         bcs     L8EFB       ; if button not pressed, jump
   8EF9 A6 2D         [ 4] 2101         ldaa    0x2D,X
   8EFB 81 0F         [ 2] 2102         cmpa    #0x0F       ; has it been pressed for 15
   8EFD 24 1A         [ 3] 2103         bcc     L8F09       ; do key repeat, if not enter
   8EFF 6C 2D         [ 6] 2104         inc     0x2D,X      ; nope, inc it
   8F01 A6 2D         [ 4] 2105         ldaa    0x2D,X
   8F03 81 02         [ 2] 2106         cmpa    #0x02       ; has it been pressed for 2?
   8F05 26 02         [ 3] 2107         bne     L8EF9       ; nope
   8F07 A7 30         [ 4] 2108         staa    0x30,X      ; short press - store count (2) in 0x30/0x31/0x32
   8F09                    2109 L8EF9:
   8F09 20 0A         [ 3] 2110         bra     L8F05  
   8F0B                    2111 L8EFB:                      ; 
   8F0B 6F 2D         [ 6] 2112         clr     0x2D,X      ; clear 2D/2E/2F if not pressed
   8F0D 20 06         [ 3] 2113         bra     L8F05  
   8F0F A6 2D         [ 4] 2114         ldaa    0x2D,X
   8F11 27 02         [ 3] 2115         beq     L8F05  
   8F13 6A 2D         [ 6] 2116         dec     0x2D,X
   8F15                    2117 L8F05:
   8F15 08            [ 3] 2118         inx
   8F16 20 D7         [ 3] 2119         bra     L8EDF  
   8F18                    2120 L8F08:
   8F18 39            [ 5] 2121         rts
                           2122 
   8F19                    2123 L8F09:
   8F19 8C 00 02      [ 4] 2124         cpx     #0x0002
   8F1C 27 02         [ 3] 2125         beq     L8F10  
   8F1E 6F 2D         [ 6] 2126         clr     0x2D,X      ; do kbd repeat for up and down
   8F20                    2127 L8F10:
   8F20 20 F3         [ 3] 2128         bra     L8F05
                           2129 
                           2130 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2131 
                           2132 ; Read Front Panel Switches
   8F22                    2133 L8F12:
   8F22 B6 10 0A      [ 4] 2134         ldaa    PORTE
   8F25 97 51         [ 3] 2135         staa    (0x0051)
   8F27 CE 00 00      [ 3] 2136         ldx     #0x0000
   8F2A                    2137 L8F1A:
   8F2A 8C 00 08      [ 4] 2138         cpx     #0x0008
   8F2D 27 22         [ 3] 2139         beq     L8F41  
   8F2F 77 00 51      [ 6] 2140         asr     (0x0051)
   8F32 25 10         [ 3] 2141         bcs     L8F34  
   8F34 A6 52         [ 4] 2142         ldaa    0x52,X
   8F36 81 0F         [ 2] 2143         cmpa    #0x0F
   8F38 6C 52         [ 6] 2144         inc     0x52,X
   8F3A A6 52         [ 4] 2145         ldaa    0x52,X
   8F3C 81 04         [ 2] 2146         cmpa    #0x04
   8F3E 26 02         [ 3] 2147         bne     L8F32  
   8F40 A7 5A         [ 4] 2148         staa    0x5A,X
   8F42                    2149 L8F32:
   8F42 20 0A         [ 3] 2150         bra     L8F3E  
   8F44                    2151 L8F34:
   8F44 6F 52         [ 6] 2152         clr     0x52,X
   8F46 20 06         [ 3] 2153         bra     L8F3E  
   8F48 A6 52         [ 4] 2154         ldaa    0x52,X
   8F4A 27 02         [ 3] 2155         beq     L8F3E  
   8F4C 6A 52         [ 6] 2156         dec     0x52,X
   8F4E                    2157 L8F3E:
   8F4E 08            [ 3] 2158         inx
   8F4F 20 D9         [ 3] 2159         bra     L8F1A  
   8F51                    2160 L8F41:
   8F51 39            [ 5] 2161         rts
                           2162 
   8F52 6F 52         [ 6] 2163         clr     0x52,X
   8F54 20 F8         [ 3] 2164         bra     L8F3E  
                           2165 
                           2166 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2167 
   8F56                    2168 L8F46:
   8F56 30 2E 35           2169         .ascii      '0.5'
   8F59 31 2E 30           2170         .ascii      '1.0'
   8F5C 31 2E 35           2171         .ascii      '1.5'
   8F5F 32 2E 30           2172         .ascii      '2.0'
   8F62 32 2E 35           2173         .ascii      '2.5'
   8F65 33 2E 30           2174         .ascii      '3.0'
                           2175 
   8F68                    2176 L8F58:
   8F68 3C            [ 4] 2177         pshx
   8F69 96 12         [ 3] 2178         ldaa    (0x0012)
   8F6B 80 01         [ 2] 2179         suba    #0x01
   8F6D C6 03         [ 2] 2180         ldab    #0x03
   8F6F 3D            [10] 2181         mul
   8F70 CE 8F 56      [ 3] 2182         ldx     #L8F46
   8F73 3A            [ 3] 2183         abx
   8F74 C6 2C         [ 2] 2184         ldab    #0x2C
   8F76                    2185 L8F66:
   8F76 A6 00         [ 4] 2186         ldaa    0,X     
   8F78 08            [ 3] 2187         inx
   8F79 BD 8D C5      [ 6] 2188         jsr     L8DB5           ; display char here on LCD display
   8F7C 5C            [ 2] 2189         incb
   8F7D C1 2F         [ 2] 2190         cmpb    #0x2F
   8F7F 26 F5         [ 3] 2191         bne     L8F66  
   8F81 38            [ 5] 2192         pulx
   8F82 39            [ 5] 2193         rts
                           2194 
   8F83                    2195 L8F73:
   8F83 36            [ 3] 2196         psha
   8F84 BD 8D 02      [ 6] 2197         jsr     L8CF2
   8F87 C6 02         [ 2] 2198         ldab    #0x02
   8F89 BD 8C 40      [ 6] 2199         jsr     DLYSECSBY2   
   8F8C 32            [ 4] 2200         pula
   8F8D 97 B4         [ 3] 2201         staa    (0x00B4)
   8F8F 81 03         [ 2] 2202         cmpa    #0x03
   8F91 26 11         [ 3] 2203         bne     L8F94  
                           2204 
   8F93 BD 8D F4      [ 6] 2205         jsr     LCDMSG1 
   8F96 43 68 75 63 6B 20  2206         .ascis  'Chuck    '
        20 20 A0
                           2207 
   8F9F CE 90 82      [ 3] 2208         ldx     #L9072
   8FA2 20 4D         [ 3] 2209         bra     L8FE1  
   8FA4                    2210 L8F94:
   8FA4 81 04         [ 2] 2211         cmpa    #0x04
   8FA6 26 11         [ 3] 2212         bne     L8FA9  
                           2213 
   8FA8 BD 8D F4      [ 6] 2214         jsr     LCDMSG1 
   8FAB 4A 61 73 70 65 72  2215         .ascis  'Jasper   '
        20 20 A0
                           2216 
   8FB4 CE 90 EE      [ 3] 2217         ldx     #L90DE
   8FB7 20 38         [ 3] 2218         bra     L8FE1  
   8FB9                    2219 L8FA9:
   8FB9 81 05         [ 2] 2220         cmpa    #0x05
   8FBB 26 11         [ 3] 2221         bne     L8FBE  
                           2222 
   8FBD BD 8D F4      [ 6] 2223         jsr     LCDMSG1 
   8FC0 50 61 73 71 75 61  2224         .ascis  'Pasqually'
        6C 6C F9
                           2225 
   8FC9 CE 91 55      [ 3] 2226         ldx     #L9145
   8FCC 20 23         [ 3] 2227         bra     L8FE1  
   8FCE                    2228 L8FBE:
   8FCE 81 06         [ 2] 2229         cmpa    #0x06
   8FD0 26 11         [ 3] 2230         bne     L8FD3  
                           2231 
   8FD2 BD 8D F4      [ 6] 2232         jsr     LCDMSG1 
   8FD5 4D 75 6E 63 68 20  2233         .ascis  'Munch    '
        20 20 A0
                           2234 
   8FDE CE 91 CA      [ 3] 2235         ldx     #L91BA
   8FE1 20 0E         [ 3] 2236         bra     L8FE1  
   8FE3                    2237 L8FD3:
   8FE3 BD 8D F4      [ 6] 2238         jsr     LCDMSG1 
   8FE6 48 65 6C 65 6E 20  2239         .ascis  'Helen   '
        20 A0
                           2240 
   8FEE CE 92 36      [ 3] 2241         ldx     #L9226
   8FF1                    2242 L8FE1:
   8FF1 96 B4         [ 3] 2243         ldaa    (0x00B4)
   8FF3 80 03         [ 2] 2244         suba    #0x03
   8FF5 48            [ 2] 2245         asla
   8FF6 48            [ 2] 2246         asla
   8FF7 97 4B         [ 3] 2247         staa    (0x004B)
   8FF9 BD 95 14      [ 6] 2248         jsr     L9504
   8FFC 97 4C         [ 3] 2249         staa    (0x004C)
   8FFE 81 0F         [ 2] 2250         cmpa    #0x0F
   9000 26 01         [ 3] 2251         bne     L8FF3  
   9002 39            [ 5] 2252         rts
                           2253 
   9003                    2254 L8FF3:
   9003 81 08         [ 2] 2255         cmpa    #0x08
   9005 23 08         [ 3] 2256         bls     L8FFF  
   9007 80 08         [ 2] 2257         suba    #0x08
   9009 D6 4B         [ 3] 2258         ldab    (0x004B)
   900B CB 02         [ 2] 2259         addb    #0x02
   900D D7 4B         [ 3] 2260         stab    (0x004B)
   900F                    2261 L8FFF:
   900F 36            [ 3] 2262         psha
   9010 18 DE 46      [ 5] 2263         ldy     (0x0046)
   9013 32            [ 4] 2264         pula
   9014 5F            [ 2] 2265         clrb
   9015 0D            [ 2] 2266         sec
   9016                    2267 L9006:
   9016 59            [ 2] 2268         rolb
   9017 4A            [ 2] 2269         deca
   9018 26 FC         [ 3] 2270         bne     L9006  
   901A D7 50         [ 3] 2271         stab    (0x0050)
   901C D6 4B         [ 3] 2272         ldab    (0x004B)
   901E CE 10 80      [ 3] 2273         ldx     #0x1080
   9021 3A            [ 3] 2274         abx
   9022 86 02         [ 2] 2275         ldaa    #0x02
   9024 97 12         [ 3] 2276         staa    (0x0012)
   9026                    2277 L9016:
   9026 A6 00         [ 4] 2278         ldaa    0,X     
   9028 98 50         [ 3] 2279         eora    (0x0050)
   902A A7 00         [ 4] 2280         staa    0,X     
   902C 6D 00         [ 6] 2281         tst     0,X     
   902E 27 16         [ 3] 2282         beq     L9036  
   9030 86 4F         [ 2] 2283         ldaa    #0x4F           ;'O'
   9032 C6 0C         [ 2] 2284         ldab    #0x0C        
   9034 BD 8D C5      [ 6] 2285         jsr     L8DB5           ; display char here on LCD display
   9037 86 6E         [ 2] 2286         ldaa    #0x6E           ;'n'
   9039 C6 0D         [ 2] 2287         ldab    #0x0D
   903B BD 8D C5      [ 6] 2288         jsr     L8DB5           ; display char here on LCD display
   903E CC 20 0E      [ 3] 2289         ldd     #0x200E         ;' '
   9041 BD 8D C5      [ 6] 2290         jsr     L8DB5           ; display char here on LCD display
   9044 20 0E         [ 3] 2291         bra     L9044  
   9046                    2292 L9036:
   9046 86 66         [ 2] 2293         ldaa    #0x66           ;'f'
   9048 C6 0D         [ 2] 2294         ldab    #0x0D
   904A BD 8D C5      [ 6] 2295         jsr     L8DB5           ; display char here on LCD display
   904D 86 66         [ 2] 2296         ldaa    #0x66           ;'f'
   904F C6 0E         [ 2] 2297         ldab    #0x0E
   9051 BD 8D C5      [ 6] 2298         jsr     L8DB5           ; display char here on LCD display
   9054                    2299 L9044:
   9054 D6 12         [ 3] 2300         ldab    (0x0012)
   9056 BD 8C 40      [ 6] 2301         jsr     DLYSECSBY2      ; delay in half-seconds
   9059 BD 8E A5      [ 6] 2302         jsr     L8E95
   905C 81 0D         [ 2] 2303         cmpa    #0x0D
   905E 27 14         [ 3] 2304         beq     L9064  
   9060 20 C4         [ 3] 2305         bra     L9016  
   9062 81 02         [ 2] 2306         cmpa    #0x02
   9064 26 C0         [ 3] 2307         bne     L9016  
   9066 96 12         [ 3] 2308         ldaa    (0x0012)
   9068 81 06         [ 2] 2309         cmpa    #0x06
   906A 27 BA         [ 3] 2310         beq     L9016  
   906C 4C            [ 2] 2311         inca
   906D 97 12         [ 3] 2312         staa    (0x0012)
   906F BD 8F 68      [ 6] 2313         jsr     L8F58
   9072 20 B2         [ 3] 2314         bra     L9016  
   9074                    2315 L9064:
   9074 A6 00         [ 4] 2316         ldaa    0,X     
   9076 9A 50         [ 3] 2317         oraa    (0x0050)
   9078 98 50         [ 3] 2318         eora    (0x0050)
   907A A7 00         [ 4] 2319         staa    0,X     
   907C 96 B4         [ 3] 2320         ldaa    (0x00B4)
   907E 7E 8F 83      [ 3] 2321         jmp     L8F73
   9081 39            [ 5] 2322         rts
                           2323 
   9082                    2324 L9072:
   9082 4D 6F 75 74 68 2C  2325         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   90EE                    2326 L90DE:
   90EE 4D 6F 75 74 68 2C  2327         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Hands,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9155                    2328 L9145:
   9155 4D 6F 75 74 68 2D  2329         .ascis  'Mouth-Mustache,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   91CA                    2330 L91BA:
   91CA 4D 6F 75 74 68 2C  2331         .ascis  'Mouth,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9236                    2332 L9226:
   9236 4D 6F 75 74 68 2C  2333         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
                           2334         
                           2335 ; code again
   92A2                    2336 L9292:
   92A2 BD 86 D4      [ 6] 2337         jsr     L86C4           ; Reset boards 1-10
   92A5                    2338 L9295:
   92A5 C6 01         [ 2] 2339         ldab    #0x01
   92A7 BD 8C 40      [ 6] 2340         jsr     DLYSECSBY2      ; delay 0.5 sec
                           2341 
   92AA BD 8D F4      [ 6] 2342         jsr     LCDMSG1 
   92AD 20 20 44 69 61 67  2343         .ascis  '  Diagnostics   '
        6E 6F 73 74 69 63
        73 20 20 A0
                           2344 
   92BD BD 8D ED      [ 6] 2345         jsr     LCDMSG2 
   92C0 20 20 20 20 20 20  2346         .ascis  '                '
        20 20 20 20 20 20
        20 20 20 A0
                           2347 
   92D0 C6 01         [ 2] 2348         ldab    #0x01
   92D2 BD 8C 40      [ 6] 2349         jsr     DLYSECSBY2      ; delay 0.5 sec
   92D5 BD 8D 13      [ 6] 2350         jsr     L8D03
   92D8 CE 93 E3      [ 3] 2351         ldx     #L93D3
   92DB BD 95 14      [ 6] 2352         jsr     L9504
   92DE 81 11         [ 2] 2353         cmpa    #0x11
   92E0 26 14         [ 3] 2354         bne     L92E6
   92E2                    2355 L92D2:
   92E2 BD 86 D4      [ 6] 2356         jsr     L86C4           ; Reset boards 1-10
   92E5 5F            [ 2] 2357         clrb
   92E6 D7 62         [ 3] 2358         stab    (0x0062)
   92E8 BD FA F9      [ 6] 2359         jsr     BUTNLIT 
   92EB B6 18 04      [ 4] 2360         ldaa    PIA0PRA 
   92EE 84 BF         [ 2] 2361         anda    #0xBF
   92F0 B7 18 04      [ 4] 2362         staa    PIA0PRA 
   92F3 7E 81 D4      [ 3] 2363         jmp     L81D7
   92F6                    2364 L92E6:
   92F6 81 03         [ 2] 2365         cmpa    #0x03
   92F8 25 09         [ 3] 2366         bcs     L92F3  
   92FA 81 08         [ 2] 2367         cmpa    #0x08
   92FC 24 05         [ 3] 2368         bcc     L92F3  
   92FE BD 8F 83      [ 6] 2369         jsr     L8F73
   9301 20 A2         [ 3] 2370         bra     L9295  
   9303                    2371 L92F3:
   9303 81 02         [ 2] 2372         cmpa    #0x02
   9305 26 08         [ 3] 2373         bne     L92FF  
   9307 BD 9F 5B      [ 6] 2374         jsr     L9F1E
   930A 25 99         [ 3] 2375         bcs     L9295  
   930C 7E 96 85      [ 3] 2376         jmp     L9675
   930F                    2377 L92FF:
   930F 81 0B         [ 2] 2378         cmpa    #0x0B
   9311 26 0D         [ 3] 2379         bne     L9310  
   9313 BD 8D 13      [ 6] 2380         jsr     L8D03
   9316 BD 9F 09      [ 6] 2381         jsr     L9ECC
   9319 C6 03         [ 2] 2382         ldab    #0x03
   931B BD 8C 40      [ 6] 2383         jsr     DLYSECSBY2      ; delay 1.5 sec
   931E 20 85         [ 3] 2384         bra     L9295  
   9320                    2385 L9310:
   9320 81 09         [ 2] 2386         cmpa    #0x09
   9322 26 0E         [ 3] 2387         bne     L9322  
   9324 BD 9F 5B      [ 6] 2388         jsr     L9F1E
   9327 24 03         [ 3] 2389         bcc     L931C  
   9329 7E 92 A5      [ 3] 2390         jmp     L9295
   932C                    2391 L931C:
   932C BD 9E CF      [ 6] 2392         jsr     L9E92           ; reset R counts
   932F 7E 92 A5      [ 3] 2393         jmp     L9295
   9332                    2394 L9322:
   9332 81 0A         [ 2] 2395         cmpa    #0x0A
   9334 26 0B         [ 3] 2396         bne     L9331  
   9336 BD 9F 5B      [ 6] 2397         jsr     L9F1E
   9339 25 03         [ 3] 2398         bcs     L932E  
   933B BD 9E EC      [ 6] 2399         jsr     L9EAF           ; reset L counts
   933E                    2400 L932E:
   933E 7E 92 A5      [ 3] 2401         jmp     L9295
   9341                    2402 L9331:
   9341 81 01         [ 2] 2403         cmpa    #0x01
   9343 26 03         [ 3] 2404         bne     L9338  
   9345 7E A1 26      [ 3] 2405         jmp     LA0E9
   9348                    2406 L9338:
   9348 81 08         [ 2] 2407         cmpa    #0x08
   934A 26 1F         [ 3] 2408         bne     L935B  
   934C BD 9F 5B      [ 6] 2409         jsr     L9F1E
   934F 25 1A         [ 3] 2410         bcs     L935B  
                           2411 
   9351 BD 8D F4      [ 6] 2412         jsr     LCDMSG1 
   9354 52 65 73 65 74 20  2413         .ascis  'Reset System!'
        53 79 73 74 65 6D
        A1
                           2414 
   9361 7E A2 86      [ 3] 2415         jmp     LA249
   9364 C6 02         [ 2] 2416         ldab    #0x02
   9366 BD 8C 40      [ 6] 2417         jsr     DLYSECSBY2      ; delay 1 sec
   9369 20 18         [ 3] 2418         bra     L9373  
   936B                    2419 L935B:
   936B 81 0C         [ 2] 2420         cmpa    #0x0C
   936D 26 14         [ 3] 2421         bne     L9373  
   936F BD 8B 58      [ 6] 2422         jsr     L8B48
   9372 5F            [ 2] 2423         clrb
   9373 D7 62         [ 3] 2424         stab    (0x0062)
   9375 BD FA F9      [ 6] 2425         jsr     BUTNLIT 
   9378 B6 18 04      [ 4] 2426         ldaa    PIA0PRA 
   937B 84 BF         [ 2] 2427         anda    #0xBF
   937D B7 18 04      [ 4] 2428         staa    PIA0PRA 
   9380 7E 92 A2      [ 3] 2429         jmp     L9292
   9383                    2430 L9373:
   9383 81 0D         [ 2] 2431         cmpa    #0x0D
   9385 26 2E         [ 3] 2432         bne     L93A5  
   9387 BD 8C F9      [ 6] 2433         jsr     L8CE9
                           2434 
   938A BD 8D F4      [ 6] 2435         jsr     LCDMSG1 
   938D 20 20 42 75 74 74  2436         .ascis  '  Button  test'
        6F 6E 20 20 74 65
        73 F4
                           2437 
   939B BD 8D ED      [ 6] 2438         jsr     LCDMSG2 
   939E 20 20 20 50 52 4F  2439         .ascis  '   PROG exits'
        47 20 65 78 69 74
        F3
                           2440 
   93AB BD A5 63      [ 6] 2441         jsr     LA526
   93AE 5F            [ 2] 2442         clrb
   93AF BD FA F9      [ 6] 2443         jsr     BUTNLIT 
   93B2 7E 92 A5      [ 3] 2444         jmp     L9295
   93B5                    2445 L93A5:
   93B5 81 0E         [ 2] 2446         cmpa    #0x0E
   93B7 26 10         [ 3] 2447         bne     L93B9  
   93B9 BD 9F 5B      [ 6] 2448         jsr     L9F1E
   93BC 24 03         [ 3] 2449         bcc     L93B1  
   93BE 7E 92 A5      [ 3] 2450         jmp     L9295
   93C1                    2451 L93B1:
   93C1 C6 01         [ 2] 2452         ldab    #0x01
   93C3 BD 8C 40      [ 6] 2453         jsr     DLYSECSBY2      ; delay 0.5 sec
   93C6 7E 94 AA      [ 3] 2454         jmp     L949A
   93C9                    2455 L93B9:
   93C9 81 0F         [ 2] 2456         cmpa    #0x0F
   93CB 26 06         [ 3] 2457         bne     L93C3  
   93CD BD A8 A7      [ 6] 2458         jsr     LA86A
   93D0 7E 92 A5      [ 3] 2459         jmp     L9295
   93D3                    2460 L93C3:
   93D3 81 10         [ 2] 2461         cmpa    #0x10
   93D5 26 09         [ 3] 2462         bne     L93D0  
   93D7 BD 9F 5B      [ 6] 2463         jsr     L9F1E
   93DA BD 95 CA      [ 6] 2464         jsr     L95BA
   93DD 7E 92 A5      [ 3] 2465         jmp     L9295
                           2466 
   93E0                    2467 L93D0:
   93E0 7E 92 E2      [ 3] 2468         jmp     L92D2
                           2469 
   93E3                    2470 L93D3:
   93E3 56 43 52 20 61 64  2471         .ascis  "VCR adjust,Set Random,Chuck E. Cheese,Jasper,Pasqually,Munch,Helen,Reset System,Reset reg tape#,Reset liv tape#,View Tape #'s,All Lights On,Button test,King enable,Warm-Up,Show Type,Quit Diagnostics"
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
   94A9 00                 2472         .byte   0x00
                           2473 
   94AA                    2474 L949A:
   94AA 7D 04 2A      [ 6] 2475         tst     (0x042A)
   94AD 27 27         [ 3] 2476         beq     L94C6  
                           2477 
   94AF BD 8D F4      [ 6] 2478         jsr     LCDMSG1 
   94B2 4B 69 6E 67 20 69  2479         .ascis  'King is Enabled'
        73 20 45 6E 61 62
        6C 65 E4
                           2480 
   94C1 BD 8D ED      [ 6] 2481         jsr     LCDMSG2 
   94C4 45 4E 54 45 52 20  2482         .ascis  'ENTER to disable'
        74 6F 20 64 69 73
        61 62 6C E5
                           2483 
   94D4 20 25         [ 3] 2484         bra     L94EB  
                           2485 
   94D6                    2486 L94C6:
   94D6 BD 8D F4      [ 6] 2487         jsr     LCDMSG1 
   94D9 4B 69 6E 67 20 69  2488         .ascis  'King is Disabled'
        73 20 44 69 73 61
        62 6C 65 E4
                           2489 
   94E9 BD 8D ED      [ 6] 2490         jsr     LCDMSG2 
   94EC 45 4E 54 45 52 20  2491         .ascis  'ENTER to enable'
        74 6F 20 65 6E 61
        62 6C E5
                           2492 
   94FB                    2493 L94EB:
   94FB BD 8E A5      [ 6] 2494         jsr     L8E95
   94FE 4D            [ 2] 2495         tsta
   94FF 27 FA         [ 3] 2496         beq     L94EB  
   9501 81 0D         [ 2] 2497         cmpa    #0x0D
   9503 27 02         [ 3] 2498         beq     L94F7  
   9505 20 0A         [ 3] 2499         bra     L9501  
   9507                    2500 L94F7:
   9507 B6 04 2A      [ 4] 2501         ldaa    (0x042A)
   950A 84 01         [ 2] 2502         anda    #0x01
   950C 88 01         [ 2] 2503         eora    #0x01
   950E B7 04 2A      [ 4] 2504         staa    (0x042A)
   9511                    2505 L9501:
   9511 7E 92 A5      [ 3] 2506         jmp     L9295
   9514                    2507 L9504:
   9514 86 01         [ 2] 2508         ldaa    #0x01
   9516 97 A6         [ 3] 2509         staa    (0x00A6)
   9518 97 A7         [ 3] 2510         staa    (0x00A7)
   951A DF 12         [ 4] 2511         stx     (0x0012)
   951C 20 09         [ 3] 2512         bra     L9517  
   951E 86 01         [ 2] 2513         ldaa    #0x01
   9520 97 A7         [ 3] 2514         staa    (0x00A7)
   9522 7F 00 A6      [ 6] 2515         clr     (0x00A6)
   9525 DF 12         [ 4] 2516         stx     (0x0012)
   9527                    2517 L9517:
   9527 7F 00 16      [ 6] 2518         clr     (0x0016)
   952A 18 DE 46      [ 5] 2519         ldy     (0x0046)
   952D 7D 00 A6      [ 6] 2520         tst     (0x00A6)
   9530 26 07         [ 3] 2521         bne     L9529  
   9532 BD 8D 02      [ 6] 2522         jsr     L8CF2
   9535 86 80         [ 2] 2523         ldaa    #0x80
   9537 20 05         [ 3] 2524         bra     L952E  
   9539                    2525 L9529:
   9539 BD 8D 13      [ 6] 2526         jsr     L8D03
   953C 86 C0         [ 2] 2527         ldaa    #0xC0
   953E                    2528 L952E:
   953E 18 A7 00      [ 5] 2529         staa    0,Y     
   9541 18 6F 01      [ 7] 2530         clr     1,Y     
   9544 18 08         [ 4] 2531         iny
   9546 18 08         [ 4] 2532         iny
   9548 18 8C 05 80   [ 5] 2533         cpy     #0x0580
   954C 25 04         [ 3] 2534         bcs     L9542  
   954E 18 CE 05 00   [ 4] 2535         ldy     #0x0500
   9552                    2536 L9542:
   9552 DF 14         [ 4] 2537         stx     (0x0014)
   9554                    2538 L9544:
   9554 A6 00         [ 4] 2539         ldaa    0,X     
   9556 2A 04         [ 3] 2540         bpl     L954C  
   9558 C6 01         [ 2] 2541         ldab    #0x01
   955A D7 16         [ 3] 2542         stab    (0x0016)
   955C                    2543 L954C:
   955C 81 2C         [ 2] 2544         cmpa    #0x2C
   955E 27 1E         [ 3] 2545         beq     L956E  
   9560 18 6F 00      [ 7] 2546         clr     0,Y     
   9563 84 7F         [ 2] 2547         anda    #0x7F
   9565 18 A7 01      [ 5] 2548         staa    1,Y     
   9568 18 08         [ 4] 2549         iny
   956A 18 08         [ 4] 2550         iny
   956C 18 8C 05 80   [ 5] 2551         cpy     #0x0580
   9570 25 04         [ 3] 2552         bcs     L9566  
   9572 18 CE 05 00   [ 4] 2553         ldy     #0x0500
   9576                    2554 L9566:
   9576 7D 00 16      [ 6] 2555         tst     (0x0016)
   9579 26 03         [ 3] 2556         bne     L956E  
   957B 08            [ 3] 2557         inx
   957C 20 D6         [ 3] 2558         bra     L9544  
   957E                    2559 L956E:
   957E 08            [ 3] 2560         inx
   957F 86 01         [ 2] 2561         ldaa    #0x01
   9581 97 43         [ 3] 2562         staa    (0x0043)
   9583 18 6F 00      [ 7] 2563         clr     0,Y     
   9586 18 6F 01      [ 7] 2564         clr     1,Y     
   9589 18 DF 46      [ 5] 2565         sty     (0x0046)
   958C                    2566 L957C:
   958C BD 8E A5      [ 6] 2567         jsr     L8E95
   958F 27 FB         [ 3] 2568         beq     L957C  
   9591 81 02         [ 2] 2569         cmpa    #0x02
   9593 26 0A         [ 3] 2570         bne     L958F  
   9595 7D 00 16      [ 6] 2571         tst     (0x0016)
   9598 26 05         [ 3] 2572         bne     L958F  
   959A 7C 00 A7      [ 6] 2573         inc     (0x00A7)
   959D 20 88         [ 3] 2574         bra     L9517  
   959F                    2575 L958F:
   959F 81 01         [ 2] 2576         cmpa    #0x01
   95A1 26 20         [ 3] 2577         bne     L95B3  
   95A3 18 DE 14      [ 5] 2578         ldy     (0x0014)
   95A6 18 9C 12      [ 6] 2579         cpy     (0x0012)
   95A9 23 E1         [ 3] 2580         bls     L957C  
   95AB 7A 00 A7      [ 6] 2581         dec     (0x00A7)
   95AE DE 14         [ 4] 2582         ldx     (0x0014)
   95B0 09            [ 3] 2583         dex
   95B1                    2584 L95A1:
   95B1 09            [ 3] 2585         dex
   95B2 9C 12         [ 5] 2586         cpx     (0x0012)
   95B4 26 03         [ 3] 2587         bne     L95A9  
   95B6 7E 95 27      [ 3] 2588         jmp     L9517
   95B9                    2589 L95A9:
   95B9 A6 00         [ 4] 2590         ldaa    0,X     
   95BB 81 2C         [ 2] 2591         cmpa    #0x2C
   95BD 26 F2         [ 3] 2592         bne     L95A1  
   95BF 08            [ 3] 2593         inx
   95C0 7E 95 27      [ 3] 2594         jmp     L9517
   95C3                    2595 L95B3:
   95C3 81 0D         [ 2] 2596         cmpa    #0x0D
   95C5 26 C5         [ 3] 2597         bne     L957C  
   95C7 96 A7         [ 3] 2598         ldaa    (0x00A7)
   95C9 39            [ 5] 2599         rts
                           2600 
   95CA                    2601 L95BA:
   95CA B6 04 5C      [ 4] 2602         ldaa    (0x045C)
   95CD 27 14         [ 3] 2603         beq     L95D3  
                           2604 
   95CF BD 8D F4      [ 6] 2605         jsr     LCDMSG1 
   95D2 43 75 72 72 65 6E  2606         .ascis  'Current: CNR   '
        74 3A 20 43 4E 52
        20 20 A0
                           2607 
   95E1 20 12         [ 3] 2608         bra     L95E5  
                           2609 
   95E3                    2610 L95D3:
   95E3 BD 8D F4      [ 6] 2611         jsr     LCDMSG1 
   95E6 43 75 72 72 65 6E  2612         .ascis  'Current: R12   '
        74 3A 20 52 31 32
        20 20 A0
                           2613 
   95F5                    2614 L95E5:
   95F5 BD 8D ED      [ 6] 2615         jsr     LCDMSG2 
   95F8 3C 45 6E 74 65 72  2616         .ascis  '<Enter> to chg.'
        3E 20 74 6F 20 63
        68 67 AE
                           2617 
   9607                    2618 L95F7:
   9607 BD 8E A5      [ 6] 2619         jsr     L8E95
   960A 27 FB         [ 3] 2620         beq     L95F7  
   960C 81 0D         [ 2] 2621         cmpa    #0x0D
   960E 26 0F         [ 3] 2622         bne     L960F  
   9610 B6 04 5C      [ 4] 2623         ldaa    (0x045C)
   9613 27 05         [ 3] 2624         beq     L960A  
   9615 7F 04 5C      [ 6] 2625         clr     (0x045C)
   9618 20 05         [ 3] 2626         bra     L960F  
   961A                    2627 L960A:
   961A 86 01         [ 2] 2628         ldaa    #0x01
   961C B7 04 5C      [ 4] 2629         staa    (0x045C)
   961F                    2630 L960F:
   961F 39            [ 5] 2631         rts
                           2632 
   9620                    2633 L9610:
   9620 43 68 75 63 6B 2C  2634         .ascis  "Chuck,Jasper,Pasqually,Munch,Helen,Light 1,Light 2,Light 3,Star EFX,Wink Spot,Gobo,Clear All Rnd,Exit"
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
                           2635 
   9685                    2636 L9675:
   9685 BD 8D F4      [ 6] 2637         jsr     LCDMSG1 
   9688 52 61 6E 64 6F 6D  2638         .ascis  'Random          '
        20 20 20 20 20 20
        20 20 20 A0
                           2639 
   9698 CE 96 20      [ 3] 2640         ldx     #L9610
   969B BD 95 14      [ 6] 2641         jsr     L9504
   969E 5F            [ 2] 2642         clrb
   969F 37            [ 3] 2643         pshb
   96A0 81 0D         [ 2] 2644         cmpa    #0x0D
   96A2 26 03         [ 3] 2645         bne     L9697  
   96A4 7E 97 6B      [ 3] 2646         jmp     L975B
   96A7                    2647 L9697:
   96A7 81 0C         [ 2] 2648         cmpa    #0x0C
   96A9 26 21         [ 3] 2649         bne     L96BC  
   96AB 7F 04 01      [ 6] 2650         clr     (0x0401)
   96AE 7F 04 2B      [ 6] 2651         clr     (0x042B)
                           2652 
   96B1 BD 8D F4      [ 6] 2653         jsr     LCDMSG1 
   96B4 41 6C 6C 20 52 6E  2654         .ascis  'All Rnd Cleared!'
        64 20 43 6C 65 61
        72 65 64 A1
                           2655 
   96C4 C6 64         [ 2] 2656         ldab    #0x64           ; delay 1 sec
   96C6 BD 8C 32      [ 6] 2657         jsr     DLYSECSBY100
   96C9 7E 97 6B      [ 3] 2658         jmp     L975B
   96CC                    2659 L96BC:
   96CC 81 09         [ 2] 2660         cmpa    #0x09
   96CE 25 05         [ 3] 2661         bcs     L96C5  
   96D0 80 08         [ 2] 2662         suba    #0x08
   96D2 33            [ 4] 2663         pulb
   96D3 5C            [ 2] 2664         incb
   96D4 37            [ 3] 2665         pshb
   96D5                    2666 L96C5:
   96D5 5F            [ 2] 2667         clrb
   96D6 0D            [ 2] 2668         sec
   96D7                    2669 L96C7:
   96D7 59            [ 2] 2670         rolb
   96D8 4A            [ 2] 2671         deca
   96D9 26 FC         [ 3] 2672         bne     L96C7  
   96DB D7 12         [ 3] 2673         stab    (0x0012)
   96DD C8 FF         [ 2] 2674         eorb    #0xFF
   96DF D7 13         [ 3] 2675         stab    (0x0013)
   96E1                    2676 L96D1:
   96E1 CC 20 34      [ 3] 2677         ldd     #0x2034         ;' '
   96E4 BD 8D C5      [ 6] 2678         jsr     L8DB5           ; display char here on LCD display
   96E7 33            [ 4] 2679         pulb
   96E8 37            [ 3] 2680         pshb
   96E9 5D            [ 2] 2681         tstb
   96EA 27 05         [ 3] 2682         beq     L96E1  
   96EC B6 04 2B      [ 4] 2683         ldaa    (0x042B)
   96EF 20 03         [ 3] 2684         bra     L96E4  
   96F1                    2685 L96E1:
   96F1 B6 04 01      [ 4] 2686         ldaa    (0x0401)
   96F4                    2687 L96E4:
   96F4 94 12         [ 3] 2688         anda    (0x0012)
   96F6 27 0A         [ 3] 2689         beq     L96F2  
   96F8 18 DE 46      [ 5] 2690         ldy     (0x0046)
   96FB BD 8E 0D      [ 6] 2691         jsr     L8DFD
   96FE 4F            [ 2] 2692         clra
   96FF EE 20         [ 5] 2693         ldx     0x20,X
   9701 09            [ 3] 2694         dex
   9702                    2695 L96F2:
   9702 18 DE 46      [ 5] 2696         ldy     (0x0046)
   9705 BD 8E 0D      [ 6] 2697         jsr     L8DFD
   9708 4F            [ 2] 2698         clra
   9709 66 E6         [ 6] 2699         ror     0xE6,X
   970B CC 20 34      [ 3] 2700         ldd     #0x2034         ;' '
   970E BD 8D C5      [ 6] 2701         jsr     L8DB5           ; display char here on LCD display
   9711                    2702 L9701:
   9711 BD 8E A5      [ 6] 2703         jsr     L8E95           ; wait for an SCD key
   9714 27 FB         [ 3] 2704         beq     L9701  
   9716 81 01         [ 2] 2705         cmpa    #0x01           ; is it up?
   9718 26 22         [ 3] 2706         bne     L972C           ; no jump ahead
   971A 33            [ 4] 2707         pulb
   971B 37            [ 3] 2708         pshb
   971C 5D            [ 2] 2709         tstb
   971D 27 0A         [ 3] 2710         beq     L9719           ; if B=0, modify 0401 mask  
   971F B6 04 2B      [ 4] 2711         ldaa    (0x042B)        ; else modify 042B mask
   9722 9A 12         [ 3] 2712         oraa    (0x0012)
   9724 B7 04 2B      [ 4] 2713         staa    (0x042B)
   9727 20 08         [ 3] 2714         bra     L9721  
   9729                    2715 L9719:
   9729 B6 04 01      [ 4] 2716         ldaa    (0x0401)
   972C 9A 12         [ 3] 2717         oraa    (0x0012)
   972E B7 04 01      [ 4] 2718         staa    (0x0401)
   9731                    2719 L9721:
   9731 18 DE 46      [ 5] 2720         ldy     (0x0046)
   9734 BD 8E 0D      [ 6] 2721         jsr     L8DFD
   9737 4F            [ 2] 2722         clra
   9738 6E A0         [ 3] 2723         jmp     0xA0,X
   973A 20 A5         [ 3] 2724         bra     L96D1  
   973C                    2725 L972C:
   973C 81 02         [ 2] 2726         cmpa    #0x02
   973E 26 23         [ 3] 2727         bne     L9753  
   9740 33            [ 4] 2728         pulb
   9741 37            [ 3] 2729         pshb
   9742 5D            [ 2] 2730         tstb
   9743 27 0A         [ 3] 2731         beq     L973F  
   9745 B6 04 2B      [ 4] 2732         ldaa    (0x042B)
   9748 94 13         [ 3] 2733         anda    (0x0013)
   974A B7 04 2B      [ 4] 2734         staa    (0x042B)
   974D 20 08         [ 3] 2735         bra     L9747  
   974F                    2736 L973F:
   974F B6 04 01      [ 4] 2737         ldaa    (0x0401)
   9752 94 13         [ 3] 2738         anda    (0x0013)
   9754 B7 04 01      [ 4] 2739         staa    (0x0401)
   9757                    2740 L9747:
   9757 18 DE 46      [ 5] 2741         ldy     (0x0046)
   975A BD 8E 0D      [ 6] 2742         jsr     L8DFD
   975D 4F            [ 2] 2743         clra
   975E 66 E6         [ 6] 2744         ror     0xE6,X
   9760 7E 96 E1      [ 3] 2745         jmp     L96D1
   9763                    2746 L9753:
   9763 81 0D         [ 2] 2747         cmpa    #0x0D
   9765 26 AA         [ 3] 2748         bne     L9701  
   9767 33            [ 4] 2749         pulb
   9768 7E 96 85      [ 3] 2750         jmp     L9675
   976B                    2751 L975B:
   976B 33            [ 4] 2752         pulb
   976C 7E 92 A2      [ 3] 2753         jmp     L9292
                           2754 
                           2755 ; do program rom checksum, and display it on the LCD screen
   976F                    2756 L975F:
   976F CE 00 00      [ 3] 2757         ldx     #0x0000
   9772 18 CE 80 00   [ 4] 2758         ldy     #0x8000
   9776                    2759 L9766:
   9776 18 E6 00      [ 5] 2760         ldab    0,Y     
   9779 18 08         [ 4] 2761         iny
   977B 3A            [ 3] 2762         abx
   977C 18 8C 00 00   [ 5] 2763         cpy     #0x0000
   9780 26 F4         [ 3] 2764         bne     L9766  
   9782 DF 17         [ 4] 2765         stx     (0x0017)        ; store rom checksum here
   9784 96 17         [ 3] 2766         ldaa    (0x0017)        ; get high byte of checksum
   9786 BD 97 AB      [ 6] 2767         jsr     L979B           ; convert it to 2 hex chars
   9789 96 12         [ 3] 2768         ldaa    (0x0012)
   978B C6 33         [ 2] 2769         ldab    #0x33
   978D BD 8D C5      [ 6] 2770         jsr     L8DB5           ; display char 1 here on LCD display
   9790 96 13         [ 3] 2771         ldaa    (0x0013)
   9792 C6 34         [ 2] 2772         ldab    #0x34
   9794 BD 8D C5      [ 6] 2773         jsr     L8DB5           ; display char 2 here on LCD display
   9797 96 18         [ 3] 2774         ldaa    (0x0018)        ; get low byte of checksum
   9799 BD 97 AB      [ 6] 2775         jsr     L979B           ; convert it to 2 hex chars
   979C 96 12         [ 3] 2776         ldaa    (0x0012)
   979E C6 35         [ 2] 2777         ldab    #0x35
   97A0 BD 8D C5      [ 6] 2778         jsr     L8DB5           ; display char 1 here on LCD display
   97A3 96 13         [ 3] 2779         ldaa    (0x0013)
   97A5 C6 36         [ 2] 2780         ldab    #0x36
   97A7 BD 8D C5      [ 6] 2781         jsr     L8DB5           ; display char 2 here on LCD display
   97AA 39            [ 5] 2782         rts
                           2783 
                           2784 ; convert A to ASCII hex digit, store in (0x0012:0x0013)
   97AB                    2785 L979B:
   97AB 36            [ 3] 2786         psha
   97AC 84 0F         [ 2] 2787         anda    #0x0F
   97AE 8B 30         [ 2] 2788         adda    #0x30
   97B0 81 39         [ 2] 2789         cmpa    #0x39
   97B2 23 02         [ 3] 2790         bls     L97A6  
   97B4 8B 07         [ 2] 2791         adda    #0x07
   97B6                    2792 L97A6:
   97B6 97 13         [ 3] 2793         staa    (0x0013)
   97B8 32            [ 4] 2794         pula
   97B9 84 F0         [ 2] 2795         anda    #0xF0
   97BB 44            [ 2] 2796         lsra
   97BC 44            [ 2] 2797         lsra
   97BD 44            [ 2] 2798         lsra
   97BE 44            [ 2] 2799         lsra
   97BF 8B 30         [ 2] 2800         adda    #0x30
   97C1 81 39         [ 2] 2801         cmpa    #0x39
   97C3 23 02         [ 3] 2802         bls     L97B7  
   97C5 8B 07         [ 2] 2803         adda    #0x07
   97C7                    2804 L97B7:
   97C7 97 12         [ 3] 2805         staa    (0x0012)
   97C9 39            [ 5] 2806         rts
                           2807 
   97CA                    2808 L97BA:
   97CA BD 9D 4F      [ 6] 2809         jsr     L9D18
   97CD 24 03         [ 3] 2810         bcc     L97C2  
   97CF 7E 9A 8F      [ 3] 2811         jmp     L9A7F
   97D2                    2812 L97C2:
   97D2 7D 00 79      [ 6] 2813         tst     (0x0079)
   97D5 26 0B         [ 3] 2814         bne     L97D2  
   97D7 FC 04 10      [ 5] 2815         ldd     (0x0410)
   97DA C3 00 01      [ 4] 2816         addd    #0x0001
   97DD FD 04 10      [ 5] 2817         std     (0x0410)
   97E0 20 09         [ 3] 2818         bra     L97DB  
   97E2                    2819 L97D2:
   97E2 FC 04 12      [ 5] 2820         ldd     (0x0412)
   97E5 C3 00 01      [ 4] 2821         addd    #0x0001
   97E8 FD 04 12      [ 5] 2822         std     (0x0412)
   97EB                    2823 L97DB:
   97EB 86 78         [ 2] 2824         ldaa    #0x78
   97ED 97 63         [ 3] 2825         staa    (0x0063)
   97EF 97 64         [ 3] 2826         staa    (0x0064)
   97F1 BD A3 50      [ 6] 2827         jsr     LA313
   97F4 BD AB 18      [ 6] 2828         jsr     LAADB
   97F7 86 01         [ 2] 2829         ldaa    #0x01
   97F9 97 4E         [ 3] 2830         staa    (0x004E)
   97FB 97 76         [ 3] 2831         staa    (0x0076)
   97FD 7F 00 75      [ 6] 2832         clr     (0x0075)
   9800 7F 00 77      [ 6] 2833         clr     (0x0077)
   9803 BD 87 BE      [ 6] 2834         jsr     L87AE
   9806 D6 7B         [ 3] 2835         ldab    (0x007B)
   9808 CA 20         [ 2] 2836         orab    #0x20
   980A C4 F7         [ 2] 2837         andb    #0xF7
   980C BD 87 58      [ 6] 2838         jsr     L8748   
   980F 7E 85 AD      [ 3] 2839         jmp     L85A4
   9812                    2840 L9802:
   9812 7F 00 76      [ 6] 2841         clr     (0x0076)
   9815 7F 00 75      [ 6] 2842         clr     (0x0075)
   9818 7F 00 77      [ 6] 2843         clr     (0x0077)
   981B 7F 00 4E      [ 6] 2844         clr     (0x004E)
   981E D6 7B         [ 3] 2845         ldab    (0x007B)
   9820 CA 0C         [ 2] 2846         orab    #0x0C
   9822 BD 87 58      [ 6] 2847         jsr     L8748
   9825                    2848 L9815:
   9825 BD A3 5B      [ 6] 2849         jsr     LA31E
   9828 BD 86 D4      [ 6] 2850         jsr     L86C4           ; Reset boards 1-10
   982B BD 9C 61      [ 6] 2851         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   982E BD 8E A5      [ 6] 2852         jsr     L8E95
   9831 7E 84 56      [ 3] 2853         jmp     L844D
   9834                    2854 L9824:
   9834 BD 9C 61      [ 6] 2855         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9837 7F 00 4E      [ 6] 2856         clr     (0x004E)
   983A D6 7B         [ 3] 2857         ldab    (0x007B)
   983C CA 24         [ 2] 2858         orab    #0x24
   983E C4 F7         [ 2] 2859         andb    #0xF7
   9840 BD 87 58      [ 6] 2860         jsr     L8748   
   9843 BD 87 BE      [ 6] 2861         jsr     L87AE
   9846 BD 8E A5      [ 6] 2862         jsr     L8E95
   9849 7E 84 56      [ 3] 2863         jmp     L844D
   984C                    2864 L983C:
   984C 7F 00 78      [ 6] 2865         clr     (0x0078)
   984F B6 10 8A      [ 4] 2866         ldaa    (0x108A)
   9852 84 F9         [ 2] 2867         anda    #0xF9
   9854 B7 10 8A      [ 4] 2868         staa    (0x108A)
   9857 7D 00 AF      [ 6] 2869         tst     (0x00AF)
   985A 26 61         [ 3] 2870         bne     L98AD  
   985C 96 62         [ 3] 2871         ldaa    (0x0062)
   985E 84 01         [ 2] 2872         anda    #0x01
   9860 27 5B         [ 3] 2873         beq     L98AD  
   9862 C6 FD         [ 2] 2874         ldab    #0xFD           ; tape deck STOP
   9864 BD 86 F7      [ 6] 2875         jsr     L86E7
   9867 CC 00 32      [ 3] 2876         ldd     #0x0032
   986A DD 1B         [ 4] 2877         std     CDTIMR1
   986C CC 75 30      [ 3] 2878         ldd     #0x7530
   986F DD 1D         [ 4] 2879         std     CDTIMR2
   9871 7F 00 5A      [ 6] 2880         clr     (0x005A)
   9874                    2881 L9864:
   9874 BD 9B 29      [ 6] 2882         jsr     L9B19           ; do the random motions if enabled
   9877 7D 00 31      [ 6] 2883         tst     (0x0031)
   987A 26 04         [ 3] 2884         bne     L9870  
   987C 96 5A         [ 3] 2885         ldaa    (0x005A)
   987E 27 19         [ 3] 2886         beq     L9889  
   9880                    2887 L9870:
   9880 7F 00 31      [ 6] 2888         clr     (0x0031)
   9883 D6 62         [ 3] 2889         ldab    (0x0062)
   9885 C4 FE         [ 2] 2890         andb    #0xFE
   9887 D7 62         [ 3] 2891         stab    (0x0062)
   9889 BD FA F9      [ 6] 2892         jsr     BUTNLIT 
   988C BD AA 50      [ 6] 2893         jsr     LAA13
   988F C6 FB         [ 2] 2894         ldab    #0xFB           ; tape deck PLAY
   9891 BD 86 F7      [ 6] 2895         jsr     L86E7
   9894 7F 00 5A      [ 6] 2896         clr     (0x005A)
   9897 20 4B         [ 3] 2897         bra     L98D4  
   9899                    2898 L9889:
   9899 DC 1B         [ 4] 2899         ldd     CDTIMR1
   989B 26 D7         [ 3] 2900         bne     L9864  
   989D D6 62         [ 3] 2901         ldab    (0x0062)
   989F C8 01         [ 2] 2902         eorb    #0x01
   98A1 D7 62         [ 3] 2903         stab    (0x0062)
   98A3 BD FA F9      [ 6] 2904         jsr     BUTNLIT 
   98A6 C4 01         [ 2] 2905         andb    #0x01
   98A8 26 05         [ 3] 2906         bne     L989F  
   98AA BD AA 49      [ 6] 2907         jsr     LAA0C
   98AD 20 03         [ 3] 2908         bra     L98A2  
   98AF                    2909 L989F:
   98AF BD AA 50      [ 6] 2910         jsr     LAA13
   98B2                    2911 L98A2:
   98B2 CC 00 32      [ 3] 2912         ldd     #0x0032
   98B5 DD 1B         [ 4] 2913         std     CDTIMR1
   98B7 DC 1D         [ 4] 2914         ldd     CDTIMR2
   98B9 27 C5         [ 3] 2915         beq     L9870  
   98BB 20 B7         [ 3] 2916         bra     L9864  
   98BD                    2917 L98AD:
   98BD 7D 00 75      [ 6] 2918         tst     (0x0075)
   98C0 27 03         [ 3] 2919         beq     L98B5  
   98C2 7E 99 49      [ 3] 2920         jmp     L9939
   98C5                    2921 L98B5:
   98C5 96 62         [ 3] 2922         ldaa    (0x0062)
   98C7 84 02         [ 2] 2923         anda    #0x02
   98C9 27 4E         [ 3] 2924         beq     L9909  
   98CB 7D 00 AF      [ 6] 2925         tst     (0x00AF)
   98CE 26 0B         [ 3] 2926         bne     L98CB  
   98D0 FC 04 24      [ 5] 2927         ldd     (0x0424)
   98D3 C3 00 01      [ 4] 2928         addd    #0x0001
   98D6 FD 04 24      [ 5] 2929         std     (0x0424)
   98D9 20 09         [ 3] 2930         bra     L98D4  
   98DB                    2931 L98CB:
   98DB FC 04 22      [ 5] 2932         ldd     (0x0422)
   98DE C3 00 01      [ 4] 2933         addd    #0x0001
   98E1 FD 04 22      [ 5] 2934         std     (0x0422)
   98E4                    2935 L98D4:
   98E4 FC 04 18      [ 5] 2936         ldd     (0x0418)
   98E7 C3 00 01      [ 4] 2937         addd    #0x0001
   98EA FD 04 18      [ 5] 2938         std     (0x0418)
   98ED 86 78         [ 2] 2939         ldaa    #0x78
   98EF 97 63         [ 3] 2940         staa    (0x0063)
   98F1 97 64         [ 3] 2941         staa    (0x0064)
   98F3 D6 62         [ 3] 2942         ldab    (0x0062)
   98F5 C4 F7         [ 2] 2943         andb    #0xF7
   98F7 CA 02         [ 2] 2944         orab    #0x02
   98F9 D7 62         [ 3] 2945         stab    (0x0062)
   98FB BD FA F9      [ 6] 2946         jsr     BUTNLIT 
   98FE BD AA 55      [ 6] 2947         jsr     LAA18
   9901 86 01         [ 2] 2948         ldaa    #0x01
   9903 97 4E         [ 3] 2949         staa    (0x004E)
   9905 97 75         [ 3] 2950         staa    (0x0075)
   9907 D6 7B         [ 3] 2951         ldab    (0x007B)
   9909 C4 DF         [ 2] 2952         andb    #0xDF
   990B BD 87 58      [ 6] 2953         jsr     L8748   
   990E BD 87 BE      [ 6] 2954         jsr     L87AE
   9911 BD A3 50      [ 6] 2955         jsr     LA313
   9914 BD AB 18      [ 6] 2956         jsr     LAADB
   9917 20 30         [ 3] 2957         bra     L9939  
   9919                    2958 L9909:
   9919 D6 62         [ 3] 2959         ldab    (0x0062)
   991B C4 F5         [ 2] 2960         andb    #0xF5
   991D CA 40         [ 2] 2961         orab    #0x40
   991F D7 62         [ 3] 2962         stab    (0x0062)
   9921 BD FA F9      [ 6] 2963         jsr     BUTNLIT 
   9924 BD AA 5A      [ 6] 2964         jsr     LAA1D
   9927 7D 00 AF      [ 6] 2965         tst     (0x00AF)
   992A 26 04         [ 3] 2966         bne     L9920  
   992C C6 01         [ 2] 2967         ldab    #0x01
   992E D7 B6         [ 3] 2968         stab    (0x00B6)
   9930                    2969 L9920:
   9930 BD 9C 61      [ 6] 2970         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9933 7F 00 4E      [ 6] 2971         clr     (0x004E)
   9936 7F 00 75      [ 6] 2972         clr     (0x0075)
   9939 86 01         [ 2] 2973         ldaa    #0x01
   993B 97 77         [ 3] 2974         staa    (0x0077)
   993D D6 7B         [ 3] 2975         ldab    (0x007B)
   993F CA 24         [ 2] 2976         orab    #0x24
   9941 C4 F7         [ 2] 2977         andb    #0xF7
   9943 BD 87 58      [ 6] 2978         jsr     L8748   
   9946 BD 87 A1      [ 6] 2979         jsr     L8791   
   9949                    2980 L9939:
   9949 7F 00 AF      [ 6] 2981         clr     (0x00AF)
   994C 7E 85 AD      [ 3] 2982         jmp     L85A4
   994F                    2983 L993F:
   994F 7F 00 77      [ 6] 2984         clr     (0x0077)
   9952 BD 9C 61      [ 6] 2985         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9955 7F 00 4E      [ 6] 2986         clr     (0x004E)
   9958 D6 62         [ 3] 2987         ldab    (0x0062)
   995A C4 BF         [ 2] 2988         andb    #0xBF
   995C 7D 00 75      [ 6] 2989         tst     (0x0075)
   995F 27 02         [ 3] 2990         beq     L9953  
   9961 C4 FD         [ 2] 2991         andb    #0xFD
   9963                    2992 L9953:
   9963 D7 62         [ 3] 2993         stab    (0x0062)
   9965 BD FA F9      [ 6] 2994         jsr     BUTNLIT 
   9968 BD AA 5A      [ 6] 2995         jsr     LAA1D
   996B 7F 00 5B      [ 6] 2996         clr     (0x005B)
   996E BD 87 BE      [ 6] 2997         jsr     L87AE
   9971 D6 7B         [ 3] 2998         ldab    (0x007B)
   9973 CA 20         [ 2] 2999         orab    #0x20
   9975 BD 87 58      [ 6] 3000         jsr     L8748   
   9978 7F 00 75      [ 6] 3001         clr     (0x0075)
   997B 7F 00 76      [ 6] 3002         clr     (0x0076)
   997E 7E 98 25      [ 3] 3003         jmp     L9815
   9981                    3004 L9971:
   9981 D6 7B         [ 3] 3005         ldab    (0x007B)
   9983 C4 FB         [ 2] 3006         andb    #0xFB
   9985 BD 87 58      [ 6] 3007         jsr     L8748   
   9988 7E 85 AD      [ 3] 3008         jmp     L85A4
   998B                    3009 L997B:
   998B D6 7B         [ 3] 3010         ldab    (0x007B)
   998D CA 04         [ 2] 3011         orab    #0x04
   998F BD 87 58      [ 6] 3012         jsr     L8748   
   9992 7E 85 AD      [ 3] 3013         jmp     L85A4
   9995                    3014 L9985:
   9995 D6 7B         [ 3] 3015         ldab    (0x007B)
   9997 C4 F7         [ 2] 3016         andb    #0xF7
   9999 BD 87 58      [ 6] 3017         jsr     L8748   
   999C 7E 85 AD      [ 3] 3018         jmp     L85A4
   999F                    3019 L998F:
   999F 7D 00 77      [ 6] 3020         tst     (0x0077)
   99A2 26 07         [ 3] 3021         bne     L999B
   99A4 D6 7B         [ 3] 3022         ldab    (0x007B)
   99A6 CA 08         [ 2] 3023         orab    #0x08
   99A8 BD 87 58      [ 6] 3024         jsr     L8748   
   99AB                    3025 L999B:
   99AB 7E 85 AD      [ 3] 3026         jmp     L85A4
   99AE                    3027 L999E:
   99AE D6 7B         [ 3] 3028         ldab    (0x007B)
   99B0 C4 F3         [ 2] 3029         andb    #0xF3
   99B2 BD 87 58      [ 6] 3030         jsr     L8748   
   99B5 39            [ 5] 3031         rts
                           3032 
                           3033 ; main2
   99B6                    3034 L99A6:
   99B6 D6 7B         [ 3] 3035         ldab    (0x007B)
   99B8 C4 DF         [ 2] 3036         andb    #0xDF           ; clear bit 5
   99BA BD 87 58      [ 6] 3037         jsr     L8748
   99BD BD 87 A1      [ 6] 3038         jsr     L8791   
   99C0 39            [ 5] 3039         rts
                           3040 
   99C1                    3041 L99B1:
   99C1 D6 7B         [ 3] 3042         ldab    (0x007B)
   99C3 CA 20         [ 2] 3043         orab    #0x20
   99C5 BD 87 58      [ 6] 3044         jsr     L8748   
   99C8 BD 87 BE      [ 6] 3045         jsr     L87AE
   99CB 39            [ 5] 3046         rts
                           3047 
   99CC D6 7B         [ 3] 3048         ldab    (0x007B)
   99CE C4 DF         [ 2] 3049         andb    #0xDF
   99D0 BD 87 58      [ 6] 3050         jsr     L8748   
   99D3 BD 87 BE      [ 6] 3051         jsr     L87AE
   99D6 39            [ 5] 3052         rts
                           3053 
   99D7 D6 7B         [ 3] 3054         ldab    (0x007B)
   99D9 CA 20         [ 2] 3055         orab    #0x20
   99DB BD 87 58      [ 6] 3056         jsr     L8748   
   99DE BD 87 A1      [ 6] 3057         jsr     L8791   
   99E1 39            [ 5] 3058         rts
                           3059 
   99E2                    3060 L99D2:
   99E2 86 01         [ 2] 3061         ldaa    #0x01
   99E4 97 78         [ 3] 3062         staa    (0x0078)
   99E6 7E 85 AD      [ 3] 3063         jmp     L85A4
   99E9                    3064 L99D9:
   99E9 CE 0E 20      [ 3] 3065         ldx     #0x0E20
   99EC A6 00         [ 4] 3066         ldaa    0,X     
   99EE 80 30         [ 2] 3067         suba    #0x30
   99F0 C6 0A         [ 2] 3068         ldab    #0x0A
   99F2 3D            [10] 3069         mul
   99F3 17            [ 2] 3070         tba                     ; (0E20)*10 into A
   99F4 C6 64         [ 2] 3071         ldab    #0x64
   99F6 3D            [10] 3072         mul
   99F7 DD 17         [ 4] 3073         std     (0x0017)        ; (0E20)*1000 into 17:18
   99F9 A6 01         [ 4] 3074         ldaa    1,X
   99FB 80 30         [ 2] 3075         suba    #0x30
   99FD C6 64         [ 2] 3076         ldab    #0x64
   99FF 3D            [10] 3077         mul
   9A00 D3 17         [ 5] 3078         addd    (0x0017)
   9A02 DD 17         [ 4] 3079         std     (0x0017)        ; (0E20)*1000+(0E21)*100 into 17:18
   9A04 A6 02         [ 4] 3080         ldaa    2,X     
   9A06 80 30         [ 2] 3081         suba    #0x30
   9A08 C6 0A         [ 2] 3082         ldab    #0x0A
   9A0A 3D            [10] 3083         mul
   9A0B D3 17         [ 5] 3084         addd    (0x0017)    
   9A0D DD 17         [ 4] 3085         std     (0x0017)        ; (0E20)*1000+(0E21)*100+(0E22)*10 into 17:18
   9A0F 4F            [ 2] 3086         clra
   9A10 E6 03         [ 4] 3087         ldab    3,X     
   9A12 C0 30         [ 2] 3088         subb    #0x30
   9A14 D3 17         [ 5] 3089         addd    (0x0017)    
   9A16 FD 02 9C      [ 5] 3090         std     (0x029C)        ; (0E20)*1000+(0E21)*100+(0E22)*10+(0E23) into (029C:029D)
   9A19 CE 0E 20      [ 3] 3091         ldx     #0x0E20
   9A1C                    3092 L9A0C:
   9A1C A6 00         [ 4] 3093         ldaa    0,X         
   9A1E 81 30         [ 2] 3094         cmpa    #0x30
   9A20 25 13         [ 3] 3095         bcs     L9A25  
   9A22 81 39         [ 2] 3096         cmpa    #0x39
   9A24 22 0F         [ 3] 3097         bhi     L9A25  
   9A26 08            [ 3] 3098         inx
   9A27 8C 0E 24      [ 4] 3099         cpx     #0x0E24
   9A2A 26 F0         [ 3] 3100         bne     L9A0C  
   9A2C B6 0E 24      [ 4] 3101         ldaa    (0x0E24)        ; check EEPROM signature
   9A2F 81 DB         [ 2] 3102         cmpa    #0xDB
   9A31 26 02         [ 3] 3103         bne     L9A25  
   9A33 0C            [ 2] 3104         clc                     ; if sig good, return carry clear
   9A34 39            [ 5] 3105         rts
                           3106 
   9A35                    3107 L9A25:
   9A35 0D            [ 2] 3108         sec                     ; if sig bad, return carry clear
   9A36 39            [ 5] 3109         rts
                           3110 
   9A37                    3111 L9A27:
   9A37 BD 8D F4      [ 6] 3112         jsr     LCDMSG1 
   9A3A 53 65 72 69 61 6C  3113         .ascis  'Serial# '
        23 A0
                           3114 
   9A42 BD 8D ED      [ 6] 3115         jsr     LCDMSG2 
   9A45 20 20 20 20 20 20  3116         .ascis  '               '
        20 20 20 20 20 20
        20 20 A0
                           3117 
                           3118 ; display 4-digit serial number
   9A54 C6 08         [ 2] 3119         ldab    #0x08
   9A56 18 CE 0E 20   [ 4] 3120         ldy     #0x0E20
   9A5A                    3121 L9A4A:
   9A5A 18 A6 00      [ 5] 3122         ldaa    0,Y     
   9A5D 18 3C         [ 5] 3123         pshy
   9A5F 37            [ 3] 3124         pshb
   9A60 BD 8D C5      [ 6] 3125         jsr     L8DB5            ; display char here on LCD display
   9A63 33            [ 4] 3126         pulb
   9A64 18 38         [ 6] 3127         puly
   9A66 5C            [ 2] 3128         incb
   9A67 18 08         [ 4] 3129         iny
   9A69 18 8C 0E 24   [ 5] 3130         cpy     #0x0E24
   9A6D 26 EB         [ 3] 3131         bne     L9A4A  
   9A6F 39            [ 5] 3132         rts
                           3133 
                           3134 ; Unused?
   9A70                    3135 L9A60:
   9A70 86 01         [ 2] 3136         ldaa    #0x01
   9A72 97 B5         [ 3] 3137         staa    (0x00B5)
   9A74 96 4E         [ 3] 3138         ldaa    (0x004E)
   9A76 97 7F         [ 3] 3139         staa    (0x007F)
   9A78 96 62         [ 3] 3140         ldaa    (0x0062)
   9A7A 97 80         [ 3] 3141         staa    (0x0080)
   9A7C 96 7B         [ 3] 3142         ldaa    (0x007B)
   9A7E 97 81         [ 3] 3143         staa    (0x0081)
   9A80 96 7A         [ 3] 3144         ldaa    (0x007A)
   9A82 97 82         [ 3] 3145         staa    (0x0082)
   9A84 96 78         [ 3] 3146         ldaa    (0x0078)
   9A86 97 7D         [ 3] 3147         staa    (0x007D)
   9A88 B6 10 8A      [ 4] 3148         ldaa    (0x108A)
   9A8B 84 06         [ 2] 3149         anda    #0x06
   9A8D 97 7E         [ 3] 3150         staa    (0x007E)
   9A8F                    3151 L9A7F:
   9A8F C6 EF         [ 2] 3152         ldab    #0xEF           ; tape deck EJECT
   9A91 BD 86 F7      [ 6] 3153         jsr     L86E7
   9A94 D6 7B         [ 3] 3154         ldab    (0x007B)
   9A96 CA 0C         [ 2] 3155         orab    #0x0C
   9A98 C4 DF         [ 2] 3156         andb    #0xDF
   9A9A BD 87 58      [ 6] 3157         jsr     L8748   
   9A9D BD 87 A1      [ 6] 3158         jsr     L8791   
   9AA0 BD 86 D4      [ 6] 3159         jsr     L86C4           ; Reset boards 1-10
   9AA3 BD 9C 61      [ 6] 3160         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9AA6 C6 06         [ 2] 3161         ldab    #0x06           ; delay 6 secs
   9AA8 BD 8C 12      [ 6] 3162         jsr     DLYSECS         ;
   9AAB BD 8E A5      [ 6] 3163         jsr     L8E95
   9AAE BD 99 B6      [ 6] 3164         jsr     L99A6
   9AB1 7E 81 BA      [ 3] 3165         jmp     L81BD
   9AB4                    3166 L9AA4:
   9AB4 7F 00 5C      [ 6] 3167         clr     (0x005C)
   9AB7 86 01         [ 2] 3168         ldaa    #0x01
   9AB9 97 79         [ 3] 3169         staa    (0x0079)
   9ABB C6 FD         [ 2] 3170         ldab    #0xFD           ; tape deck STOP
   9ABD BD 86 F7      [ 6] 3171         jsr     L86E7
   9AC0 BD 8E A5      [ 6] 3172         jsr     L8E95
   9AC3 CC 75 30      [ 3] 3173         ldd     #0x7530
   9AC6 DD 1D         [ 4] 3174         std     CDTIMR2
   9AC8                    3175 L9AB8:
   9AC8 BD 9B 29      [ 6] 3176         jsr     L9B19           ; do the random motions if enabled
   9ACB D6 62         [ 3] 3177         ldab    (0x0062)
   9ACD C8 04         [ 2] 3178         eorb    #0x04
   9ACF D7 62         [ 3] 3179         stab    (0x0062)
   9AD1 BD FA F9      [ 6] 3180         jsr     BUTNLIT 
   9AD4 F6 18 04      [ 4] 3181         ldab    PIA0PRA 
   9AD7 C8 08         [ 2] 3182         eorb    #0x08
   9AD9 F7 18 04      [ 4] 3183         stab    PIA0PRA 
   9ADC 7D 00 5C      [ 6] 3184         tst     (0x005C)
   9ADF 26 12         [ 3] 3185         bne     L9AE3  
   9AE1 BD 8E A5      [ 6] 3186         jsr     L8E95
   9AE4 81 0D         [ 2] 3187         cmpa    #0x0D
   9AE6 27 0B         [ 3] 3188         beq     L9AE3  
   9AE8 C6 32         [ 2] 3189         ldab    #0x32           ; delay 0.5 sec
   9AEA BD 8C 32      [ 6] 3190         jsr     DLYSECSBY100
   9AED DC 1D         [ 4] 3191         ldd     CDTIMR2
   9AEF 27 02         [ 3] 3192         beq     L9AE3  
   9AF1 20 D5         [ 3] 3193         bra     L9AB8  
   9AF3                    3194 L9AE3:
   9AF3 D6 62         [ 3] 3195         ldab    (0x0062)
   9AF5 C4 FB         [ 2] 3196         andb    #0xFB
   9AF7 D7 62         [ 3] 3197         stab    (0x0062)
   9AF9 BD FA F9      [ 6] 3198         jsr     BUTNLIT 
   9AFC BD A3 91      [ 6] 3199         jsr     LA354
   9AFF C6 FB         [ 2] 3200         ldab    #0xFB           ; tape deck PLAY
   9B01 BD 86 F7      [ 6] 3201         jsr     L86E7
   9B04 7E 85 AD      [ 3] 3202         jmp     L85A4
   9B07                    3203 L9AF7:
   9B07 7F 00 75      [ 6] 3204         clr     (0x0075)
   9B0A 7F 00 76      [ 6] 3205         clr     (0x0076)
   9B0D 7F 00 77      [ 6] 3206         clr     (0x0077)
   9B10 7F 00 78      [ 6] 3207         clr     (0x0078)
   9B13 7F 00 25      [ 6] 3208         clr     (0x0025)
   9B16 7F 00 26      [ 6] 3209         clr     (0x0026)
   9B19 7F 00 4E      [ 6] 3210         clr     (0x004E)
   9B1C 7F 00 30      [ 6] 3211         clr     (0x0030)        ; clear SCD key states
   9B1F 7F 00 31      [ 6] 3212         clr     (0x0031)
   9B22 7F 00 32      [ 6] 3213         clr     (0x0032)
   9B25 7F 00 AF      [ 6] 3214         clr     (0x00AF)
   9B28 39            [ 5] 3215         rts
                           3216 
                           3217 ; do the random motions if enabled
   9B29                    3218 L9B19:
   9B29 36            [ 3] 3219         psha
   9B2A 37            [ 3] 3220         pshb
   9B2B 96 4E         [ 3] 3221         ldaa    (0x004E)
   9B2D 27 17         [ 3] 3222         beq     L9B36           ; go to 0401 logic
   9B2F 96 63         [ 3] 3223         ldaa    (0x0063)        ; check countdown timer
   9B31 26 10         [ 3] 3224         bne     L9B33           ; exit
   9B33 7D 00 64      [ 6] 3225         tst     (0x0064)
   9B36 27 09         [ 3] 3226         beq     L9B31           ; go to 0401 logic
   9B38 BD 86 D4      [ 6] 3227         jsr     L86C4           ; Reset boards 1-10
   9B3B BD 9C 61      [ 6] 3228         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9B3E 7F 00 64      [ 6] 3229         clr     (0x0064)
   9B41                    3230 L9B31:
   9B41 20 03         [ 3] 3231         bra     L9B36           ; go to 0401 logic
   9B43                    3232 L9B33:
   9B43 33            [ 4] 3233         pulb
   9B44 32            [ 4] 3234         pula
   9B45 39            [ 5] 3235         rts
                           3236 
                           3237 ; end up here immediately if:
                           3238 ; 0x004E == 00 or
                           3239 ; 0x0063, 0x0064 == 0 or
                           3240 ; 
                           3241 ; do subroutines based on bits 0-4 of 0x0401?
   9B46                    3242 L9B36:
   9B46 B6 04 01      [ 4] 3243         ldaa    (0x0401)
   9B49 84 01         [ 2] 3244         anda    #0x01
   9B4B 27 03         [ 3] 3245         beq     L9B40  
   9B4D BD 9B 7B      [ 6] 3246         jsr     L9B6B           ; bit 0 routine
   9B50                    3247 L9B40:
   9B50 B6 04 01      [ 4] 3248         ldaa    (0x0401)
   9B53 84 02         [ 2] 3249         anda    #0x02
   9B55 27 03         [ 3] 3250         beq     L9B4A  
   9B57 BD 9B A9      [ 6] 3251         jsr     L9B99           ; bit 1 routine
   9B5A                    3252 L9B4A:
   9B5A B6 04 01      [ 4] 3253         ldaa    (0x0401)
   9B5D 84 04         [ 2] 3254         anda    #0x04
   9B5F 27 03         [ 3] 3255         beq     L9B54  
   9B61 BD 9B D7      [ 6] 3256         jsr     L9BC7           ; bit 2 routine
   9B64                    3257 L9B54:
   9B64 B6 04 01      [ 4] 3258         ldaa    (0x0401)
   9B67 84 08         [ 2] 3259         anda    #0x08
   9B69 27 03         [ 3] 3260         beq     L9B5E  
   9B6B BD 9C 05      [ 6] 3261         jsr     L9BF5           ; bit 3 routine
   9B6E                    3262 L9B5E:
   9B6E B6 04 01      [ 4] 3263         ldaa    (0x0401)
   9B71 84 10         [ 2] 3264         anda    #0x10
   9B73 27 03         [ 3] 3265         beq     L9B68  
   9B75 BD 9C 33      [ 6] 3266         jsr     L9C23           ; bit 4 routine
   9B78                    3267 L9B68:
   9B78 33            [ 4] 3268         pulb
   9B79 32            [ 4] 3269         pula
   9B7A 39            [ 5] 3270         rts
                           3271 
                           3272 ; bit 0 routine
   9B7B                    3273 L9B6B:
   9B7B 18 3C         [ 5] 3274         pshy
   9B7D 18 DE 65      [ 5] 3275         ldy     (0x0065)
   9B80 18 A6 00      [ 5] 3276         ldaa    0,Y     
   9B83 81 FF         [ 2] 3277         cmpa    #0xFF
   9B85 27 14         [ 3] 3278         beq     L9B8B  
   9B87 91 70         [ 3] 3279         cmpa    OFFCNT1
   9B89 25 0D         [ 3] 3280         bcs     L9B88  
   9B8B 18 08         [ 4] 3281         iny
   9B8D 18 A6 00      [ 5] 3282         ldaa    0,Y     
   9B90 B7 10 80      [ 4] 3283         staa    (0x1080)        ; do some stuff to board 1
   9B93 18 08         [ 4] 3284         iny
   9B95 18 DF 65      [ 5] 3285         sty     (0x0065)
   9B98                    3286 L9B88:
   9B98 18 38         [ 6] 3287         puly
   9B9A 39            [ 5] 3288         rts
   9B9B                    3289 L9B8B:
   9B9B 18 CE B3 28   [ 4] 3290         ldy     #LB2EB
   9B9F 18 DF 65      [ 5] 3291         sty     (0x0065)
   9BA2 86 FA         [ 2] 3292         ldaa    #0xFA
   9BA4 97 70         [ 3] 3293         staa    OFFCNT1
   9BA6 7E 9B 98      [ 3] 3294         jmp     L9B88
                           3295 
                           3296 ; bit 1 routine
   9BA9                    3297 L9B99:
   9BA9 18 3C         [ 5] 3298         pshy
   9BAB 18 DE 67      [ 5] 3299         ldy     (0x0067)
   9BAE 18 A6 00      [ 5] 3300         ldaa    0,Y     
   9BB1 81 FF         [ 2] 3301         cmpa    #0xFF
   9BB3 27 14         [ 3] 3302         beq     L9BB9  
   9BB5 91 71         [ 3] 3303         cmpa    OFFCNT2
   9BB7 25 0D         [ 3] 3304         bcs     L9BB6  
   9BB9 18 08         [ 4] 3305         iny
   9BBB 18 A6 00      [ 5] 3306         ldaa    0,Y     
   9BBE B7 10 84      [ 4] 3307         staa    (0x1084)        ; do some stuff to board 2
   9BC1 18 08         [ 4] 3308         iny
   9BC3 18 DF 67      [ 5] 3309         sty     (0x0067)
   9BC6                    3310 L9BB6:
   9BC6 18 38         [ 6] 3311         puly
   9BC8 39            [ 5] 3312         rts
   9BC9                    3313 L9BB9:
   9BC9 18 CE B3 FA   [ 4] 3314         ldy     #LB3BD
   9BCD 18 DF 67      [ 5] 3315         sty     (0x0067)
   9BD0 86 E6         [ 2] 3316         ldaa    #0xE6
   9BD2 97 71         [ 3] 3317         staa    OFFCNT2
   9BD4 7E 9B C6      [ 3] 3318         jmp     L9BB6
                           3319 
                           3320 ; bit 2 routine
   9BD7                    3321 L9BC7:
   9BD7 18 3C         [ 5] 3322         pshy
   9BD9 18 DE 69      [ 5] 3323         ldy     (0x0069)
   9BDC 18 A6 00      [ 5] 3324         ldaa    0,Y     
   9BDF 81 FF         [ 2] 3325         cmpa    #0xFF
   9BE1 27 14         [ 3] 3326         beq     L9BE7  
   9BE3 91 72         [ 3] 3327         cmpa    OFFCNT3
   9BE5 25 0D         [ 3] 3328         bcs     L9BE4  
   9BE7 18 08         [ 4] 3329         iny
   9BE9 18 A6 00      [ 5] 3330         ldaa    0,Y     
   9BEC B7 10 88      [ 4] 3331         staa    (0x1088)        ; do some stuff to board 3
   9BEF 18 08         [ 4] 3332         iny
   9BF1 18 DF 69      [ 5] 3333         sty     (0x0069)
   9BF4                    3334 L9BE4:
   9BF4 18 38         [ 6] 3335         puly
   9BF6 39            [ 5] 3336         rts
   9BF7                    3337 L9BE7:
   9BF7 18 CE B5 6E   [ 4] 3338         ldy     #LB531
   9BFB 18 DF 69      [ 5] 3339         sty     (0x0069)
   9BFE 86 D2         [ 2] 3340         ldaa    #0xD2
   9C00 97 72         [ 3] 3341         staa    OFFCNT3
   9C02 7E 9B F4      [ 3] 3342         jmp     L9BE4
                           3343 
                           3344 ; bit 3 routine
   9C05                    3345 L9BF5:
   9C05 18 3C         [ 5] 3346         pshy
   9C07 18 DE 6B      [ 5] 3347         ldy     (0x006B)
   9C0A 18 A6 00      [ 5] 3348         ldaa    0,Y     
   9C0D 81 FF         [ 2] 3349         cmpa    #0xFF
   9C0F 27 14         [ 3] 3350         beq     L9C15  
   9C11 91 73         [ 3] 3351         cmpa    OFFCNT4
   9C13 25 0D         [ 3] 3352         bcs     L9C12  
   9C15 18 08         [ 4] 3353         iny
   9C17 18 A6 00      [ 5] 3354         ldaa    0,Y     
   9C1A B7 10 8C      [ 4] 3355         staa    (0x108C)        ; do some stuff to board 4
   9C1D 18 08         [ 4] 3356         iny
   9C1F 18 DF 6B      [ 5] 3357         sty     (0x006B)
   9C22                    3358 L9C12:
   9C22 18 38         [ 6] 3359         puly
   9C24 39            [ 5] 3360         rts
   9C25                    3361 L9C15:
   9C25 18 CE B4 B2   [ 4] 3362         ldy     #LB475
   9C29 18 DF 6B      [ 5] 3363         sty     (0x006B)
   9C2C 86 BE         [ 2] 3364         ldaa    #0xBE
   9C2E 97 73         [ 3] 3365         staa    OFFCNT4
   9C30 7E 9C 22      [ 3] 3366         jmp     L9C12
                           3367 
                           3368 ; bit 4 routine
   9C33                    3369 L9C23:
   9C33 18 3C         [ 5] 3370         pshy
   9C35 18 DE 6D      [ 5] 3371         ldy     (0x006D)
   9C38 18 A6 00      [ 5] 3372         ldaa    0,Y     
   9C3B 81 FF         [ 2] 3373         cmpa    #0xFF
   9C3D 27 14         [ 3] 3374         beq     L9C43  
   9C3F 91 74         [ 3] 3375         cmpa    OFFCNT5
   9C41 25 0D         [ 3] 3376         bcs     L9C40  
   9C43 18 08         [ 4] 3377         iny
   9C45 18 A6 00      [ 5] 3378         ldaa    0,Y     
   9C48 B7 10 90      [ 4] 3379         staa    (0x1090)        ; do some stuff to board 5
   9C4B 18 08         [ 4] 3380         iny
   9C4D 18 DF 6D      [ 5] 3381         sty     (0x006D)
   9C50                    3382 L9C40:
   9C50 18 38         [ 6] 3383         puly
   9C52 39            [ 5] 3384         rts
   9C53                    3385 L9C43:
   9C53 18 CE B6 00   [ 4] 3386         ldy     #LB5C3
   9C57 18 DF 6D      [ 5] 3387         sty     (0x006D)
   9C5A 86 AA         [ 2] 3388         ldaa    #0xAA
   9C5C 97 74         [ 3] 3389         staa    OFFCNT5
   9C5E 7E 9C 50      [ 3] 3390         jmp     L9C40
                           3391 
                           3392 ; Reset offset counters to initial values
   9C61                    3393 L9C51:
   9C61 86 FA         [ 2] 3394         ldaa    #0xFA
   9C63 97 70         [ 3] 3395         staa    OFFCNT1
   9C65 86 E6         [ 2] 3396         ldaa    #0xE6
   9C67 97 71         [ 3] 3397         staa    OFFCNT2
   9C69 86 D2         [ 2] 3398         ldaa    #0xD2
   9C6B 97 72         [ 3] 3399         staa    OFFCNT3
   9C6D 86 BE         [ 2] 3400         ldaa    #0xBE
   9C6F 97 73         [ 3] 3401         staa    OFFCNT4
   9C71 86 AA         [ 2] 3402         ldaa    #0xAA
   9C73 97 74         [ 3] 3403         staa    OFFCNT5
                           3404 
                           3405         ; int random movement table pointers
   9C75 18 CE B3 28   [ 4] 3406         ldy     #LB2EB
   9C79 18 DF 65      [ 5] 3407         sty     (0x0065)
   9C7C 18 CE B3 FA   [ 4] 3408         ldy     #LB3BD
   9C80 18 DF 67      [ 5] 3409         sty     (0x0067)
   9C83 18 CE B5 6E   [ 4] 3410         ldy     #LB531
   9C87 18 DF 69      [ 5] 3411         sty     (0x0069)
   9C8A 18 CE B4 B2   [ 4] 3412         ldy     #LB475
   9C8E 18 DF 6B      [ 5] 3413         sty     (0x006B)
   9C91 18 CE B6 00   [ 4] 3414         ldy     #LB5C3
   9C95 18 DF 6D      [ 5] 3415         sty     (0x006D)
                           3416 
                           3417         ; clear board 8
   9C98 7F 10 9C      [ 6] 3418         clr     (0x109C)
   9C9B 7F 10 9E      [ 6] 3419         clr     (0x109E)
                           3420 
                           3421         ; if bit 5 of 0401 is set, turn on 3 bits on board 8
   9C9E B6 04 01      [ 4] 3422         ldaa    (0x0401)
   9CA1 84 20         [ 2] 3423         anda    #0x20
   9CA3 27 08         [ 3] 3424         beq     L9C9D
   9CA5 B6 10 9C      [ 4] 3425         ldaa    (0x109C)
   9CA8 8A 19         [ 2] 3426         oraa    #0x19
   9CAA B7 10 9C      [ 4] 3427         staa    (0x109C)
                           3428         ; if bit 6 of 0401 is set, turn on 3 bits on board 8
   9CAD                    3429 L9C9D:
   9CAD B6 04 01      [ 4] 3430         ldaa    (0x0401)
   9CB0 84 40         [ 2] 3431         anda    #0x40
   9CB2 27 10         [ 3] 3432         beq     L9CB4  
   9CB4 B6 10 9C      [ 4] 3433         ldaa    (0x109C)
   9CB7 8A 44         [ 2] 3434         oraa    #0x44
   9CB9 B7 10 9C      [ 4] 3435         staa    (0x109C)
   9CBC B6 10 9E      [ 4] 3436         ldaa    (0x109E)
   9CBF 8A 40         [ 2] 3437         oraa    #0x40
   9CC1 B7 10 9E      [ 4] 3438         staa    (0x109E)
                           3439         ; if bit 7 of 0401 is set, turn on 3 bits on board 8
   9CC4                    3440 L9CB4:
   9CC4 B6 04 01      [ 4] 3441         ldaa    (0x0401)
   9CC7 84 80         [ 2] 3442         anda    #0x80
   9CC9 27 08         [ 3] 3443         beq     L9CC3  
   9CCB B6 10 9C      [ 4] 3444         ldaa    (0x109C)
   9CCE 8A A2         [ 2] 3445         oraa    #0xA2
   9CD0 B7 10 9C      [ 4] 3446         staa    (0x109C)
                           3447 
   9CD3                    3448 L9CC3:
                           3449         ; if bit 0 of 042B is set, turn on 1 bit on board 7
   9CD3 B6 04 2B      [ 4] 3450         ldaa    (0x042B)
   9CD6 84 01         [ 2] 3451         anda    #0x01
   9CD8 27 08         [ 3] 3452         beq     L9CD2  
   9CDA B6 10 9A      [ 4] 3453         ldaa    (0x109A)
   9CDD 8A 80         [ 2] 3454         oraa    #0x80
   9CDF B7 10 9A      [ 4] 3455         staa    (0x109A)
   9CE2                    3456 L9CD2:
                           3457         ; if bit 1 of 042B is set, turn on 1 bit on board 8
   9CE2 B6 04 2B      [ 4] 3458         ldaa    (0x042B)
   9CE5 84 02         [ 2] 3459         anda    #0x02
   9CE7 27 08         [ 3] 3460         beq     L9CE1  
   9CE9 B6 10 9E      [ 4] 3461         ldaa    (0x109E)
   9CEC 8A 04         [ 2] 3462         oraa    #0x04
   9CEE B7 10 9E      [ 4] 3463         staa    (0x109E)
   9CF1                    3464 L9CE1:
                           3465         ; if bit 2 of 042B is set, turn on 1 bit on board 8
   9CF1 B6 04 2B      [ 4] 3466         ldaa    (0x042B)
   9CF4 84 04         [ 2] 3467         anda    #0x04
   9CF6 27 08         [ 3] 3468         beq     L9CF0  
   9CF8 B6 10 9E      [ 4] 3469         ldaa    (0x109E)
   9CFB 8A 08         [ 2] 3470         oraa    #0x08
   9CFD B7 10 9E      [ 4] 3471         staa    (0x109E)
   9D00                    3472 L9CF0:
   9D00 39            [ 5] 3473         rts
                           3474 
                           3475 ; Display Credits
   9D01                    3476 L9CF1:
   9D01 BD 8D F4      [ 6] 3477         jsr     LCDMSG1 
   9D04 20 20 20 50 72 6F  3478         .ascis  '   Program by   '
        67 72 61 6D 20 62
        79 20 20 A0
   9D14 BD 8D ED      [ 6] 3479         jsr     LCDMSG2 
   9D17 44 61 76 69 64 20  3480         .ascis  'David  Philipsen'
        20 50 68 69 6C 69
        70 73 65 EE
   9D27 39            [ 5] 3481         rts
                           3482 
   9D28                    3483 L9D28N:
   9D28 BD 8D F4      [ 6] 3484         jsr     LCDMSG1                 ; NEW
   9D2B 50 72 65 73 73 20  3485         .ascis  'Press Enter for '      ; NEW
        45 6E 74 65 72 20
        66 6F 72 A0
   9D3B BD 8D ED      [ 6] 3486         jsr     LCDMSG2                 ; NEW
   9D3E 44 69 61 67 6E 6F  3487         .ascis  'Diagnostics     '      ; NEW
        73 74 69 63 73 20
        20 20 20 A0
   9D4E 39            [ 5] 3488         rts                             ; NEW
                           3489 
   9D4F                    3490 L9D18:
   9D4F 0C            [ 2] 3491         clc                             ; NEW
   9D50 C6 01         [ 2] 3492         ldab    #0x01                   ; NEW
   9D52 D7 B8         [ 3] 3493         stab    (0x00B8)                ; NEW
   9D54 39            [ 5] 3494         rts                             ; NEW
                           3495 
   9D55 97 49         [ 3] 3496         staa    (0x0049)
   9D57 7F 00 B8      [ 6] 3497         clr     (0x00B8)
   9D5A BD 8D 13      [ 6] 3498         jsr     L8D03
   9D5D 86 2A         [ 2] 3499         ldaa    #0x2A           ;'*'
   9D5F C6 28         [ 2] 3500         ldab    #0x28
   9D61 BD 8D C5      [ 6] 3501         jsr     L8DB5           ; display char here on LCD display
   9D64 CC 0B B8      [ 3] 3502         ldd     #0x0BB8         ; start 30 second timer?
   9D67 DD 1B         [ 4] 3503         std     CDTIMR1
   9D69                    3504 L9D2C:
   9D69 BD 9B 29      [ 6] 3505         jsr     L9B19           ; do the random motions if enabled
   9D6C 96 49         [ 3] 3506         ldaa    (0x0049)
   9D6E 81 41         [ 2] 3507         cmpa    #0x41
   9D70 27 04         [ 3] 3508         beq     L9D39  
   9D72 81 4B         [ 2] 3509         cmpa    #0x4B
   9D74 26 04         [ 3] 3510         bne     L9D3D  
   9D76                    3511 L9D39:
   9D76 C6 01         [ 2] 3512         ldab    #0x01
   9D78 D7 B8         [ 3] 3513         stab    (0x00B8)
   9D7A                    3514 L9D3D:
   9D7A 81 41         [ 2] 3515         cmpa    #0x41
   9D7C 27 04         [ 3] 3516         beq     L9D45  
   9D7E 81 4F         [ 2] 3517         cmpa    #0x4F
   9D80 26 07         [ 3] 3518         bne     L9D4C  
   9D82                    3519 L9D45:
   9D82 86 01         [ 2] 3520         ldaa    #0x01
   9D84 B7 02 98      [ 4] 3521         staa    (0x0298)
   9D87 20 32         [ 3] 3522         bra     L9D7E  
   9D89                    3523 L9D4C:
   9D89 81 4B         [ 2] 3524         cmpa    #0x4B
   9D8B 27 04         [ 3] 3525         beq     L9D54  
   9D8D 81 50         [ 2] 3526         cmpa    #0x50
   9D8F 26 07         [ 3] 3527         bne     L9D5B  
   9D91                    3528 L9D54:
   9D91 86 02         [ 2] 3529         ldaa    #0x02
   9D93 B7 02 98      [ 4] 3530         staa    (0x0298)
   9D96 20 23         [ 3] 3531         bra     L9D7E  
   9D98                    3532 L9D5B:
   9D98 81 4C         [ 2] 3533         cmpa    #0x4C
   9D9A 26 07         [ 3] 3534         bne     L9D66  
   9D9C 86 03         [ 2] 3535         ldaa    #0x03
   9D9E B7 02 98      [ 4] 3536         staa    (0x0298)
   9DA1 20 18         [ 3] 3537         bra     L9D7E  
   9DA3                    3538 L9D66:
   9DA3 81 52         [ 2] 3539         cmpa    #0x52
   9DA5 26 07         [ 3] 3540         bne     L9D71  
   9DA7 86 04         [ 2] 3541         ldaa    #0x04
   9DA9 B7 02 98      [ 4] 3542         staa    (0x0298)
   9DAC 20 0D         [ 3] 3543         bra     L9D7E  
   9DAE                    3544 L9D71:
   9DAE DC 1B         [ 4] 3545         ldd     CDTIMR1
   9DB0 26 B7         [ 3] 3546         bne     L9D2C  
   9DB2 86 23         [ 2] 3547         ldaa    #0x23           ;'#'
   9DB4 C6 29         [ 2] 3548         ldab    #0x29
   9DB6 BD 8D C5      [ 6] 3549         jsr     L8DB5           ; display char here on LCD display
   9DB9 20 6C         [ 3] 3550         bra     L9DEA  
   9DBB                    3551 L9D7E:
   9DBB 7F 00 49      [ 6] 3552         clr     (0x0049)
   9DBE 86 2A         [ 2] 3553         ldaa    #0x2A           ;'*'
   9DC0 C6 29         [ 2] 3554         ldab    #0x29
   9DC2 BD 8D C5      [ 6] 3555         jsr     L8DB5           ; display char here on LCD display
   9DC5 7F 00 4A      [ 6] 3556         clr     (0x004A)
   9DC8 CE 02 99      [ 3] 3557         ldx     #0x0299
   9DCB                    3558 L9D8E:
   9DCB BD 9B 29      [ 6] 3559         jsr     L9B19           ; do the random motions if enabled
   9DCE 96 4A         [ 3] 3560         ldaa    (0x004A)
   9DD0 27 F9         [ 3] 3561         beq     L9D8E  
   9DD2 7F 00 4A      [ 6] 3562         clr     (0x004A)
   9DD5 84 3F         [ 2] 3563         anda    #0x3F
   9DD7 A7 00         [ 4] 3564         staa    0,X     
   9DD9 08            [ 3] 3565         inx
   9DDA 8C 02 9C      [ 4] 3566         cpx     #0x029C
   9DDD 26 EC         [ 3] 3567         bne     L9D8E  
   9DDF BD 9E 32      [ 6] 3568         jsr     L9DF5
   9DE2 24 09         [ 3] 3569         bcc     L9DB0  
   9DE4 86 23         [ 2] 3570         ldaa    #0x23           ;'#'
   9DE6 C6 2A         [ 2] 3571         ldab    #0x2A
   9DE8 BD 8D C5      [ 6] 3572         jsr     L8DB5           ; display char here on LCD display
   9DEB 20 3A         [ 3] 3573         bra     L9DEA  
   9DED                    3574 L9DB0:
   9DED 86 2A         [ 2] 3575         ldaa    #0x2A           ;'*'
   9DEF C6 2A         [ 2] 3576         ldab    #0x2A
   9DF1 BD 8D C5      [ 6] 3577         jsr     L8DB5           ; display char here on LCD display
   9DF4 B6 02 99      [ 4] 3578         ldaa    (0x0299)
   9DF7 81 39         [ 2] 3579         cmpa    #0x39
   9DF9 26 15         [ 3] 3580         bne     L9DD3  
                           3581 
   9DFB BD 8D ED      [ 6] 3582         jsr     LCDMSG2 
   9DFE 47 65 6E 65 72 69  3583         .ascis  'Generic Showtape'
        63 20 53 68 6F 77
        74 61 70 E5
                           3584 
   9E0E 0C            [ 2] 3585         clc
   9E0F 39            [ 5] 3586         rts
                           3587 
   9E10                    3588 L9DD3:
   9E10 B6 02 98      [ 4] 3589         ldaa    (0x0298)
   9E13 81 03         [ 2] 3590         cmpa    #0x03
   9E15 27 0E         [ 3] 3591         beq     L9DE8  
   9E17 81 04         [ 2] 3592         cmpa    #0x04
   9E19 27 0A         [ 3] 3593         beq     L9DE8  
   9E1B 96 76         [ 3] 3594         ldaa    (0x0076)
   9E1D 26 06         [ 3] 3595         bne     L9DE8  
   9E1F BD 9E B0      [ 6] 3596         jsr     L9E73
   9E22 BD 9F 09      [ 6] 3597         jsr     L9ECC
   9E25                    3598 L9DE8:
   9E25 0C            [ 2] 3599         clc
   9E26 39            [ 5] 3600         rts
                           3601 
   9E27                    3602 L9DEA:
   9E27 FC 04 20      [ 5] 3603         ldd     (0x0420)
   9E2A C3 00 01      [ 4] 3604         addd    #0x0001
   9E2D FD 04 20      [ 5] 3605         std     (0x0420)
   9E30 0D            [ 2] 3606         sec
   9E31 39            [ 5] 3607         rts
                           3608 
   9E32                    3609 L9DF5:
   9E32 B6 02 99      [ 4] 3610         ldaa    (0x0299)
   9E35 81 39         [ 2] 3611         cmpa    #0x39
   9E37 27 6C         [ 3] 3612         beq     L9E68  
   9E39 CE 00 A8      [ 3] 3613         ldx     #0x00A8
   9E3C                    3614 L9DFF:
   9E3C BD 9B 29      [ 6] 3615         jsr     L9B19           ; do the random motions if enabled
   9E3F 96 4A         [ 3] 3616         ldaa    (0x004A)
   9E41 27 F9         [ 3] 3617         beq     L9DFF  
   9E43 7F 00 4A      [ 6] 3618         clr     (0x004A)
   9E46 A7 00         [ 4] 3619         staa    0,X     
   9E48 08            [ 3] 3620         inx
   9E49 8C 00 AA      [ 4] 3621         cpx     #0x00AA
   9E4C 26 EE         [ 3] 3622         bne     L9DFF  
   9E4E BD 9F 37      [ 6] 3623         jsr     L9EFA
   9E51 CE 02 99      [ 3] 3624         ldx     #0x0299
   9E54 7F 00 13      [ 6] 3625         clr     (0x0013)
   9E57                    3626 L9E1A:
   9E57 A6 00         [ 4] 3627         ldaa    0,X     
   9E59 9B 13         [ 3] 3628         adda    (0x0013)
   9E5B 97 13         [ 3] 3629         staa    (0x0013)
   9E5D 08            [ 3] 3630         inx
   9E5E 8C 02 9C      [ 4] 3631         cpx     #0x029C
   9E61 26 F4         [ 3] 3632         bne     L9E1A  
   9E63 91 A8         [ 3] 3633         cmpa    (0x00A8)
   9E65 26 47         [ 3] 3634         bne     L9E71  
   9E67 CE 04 02      [ 3] 3635         ldx     #0x0402
   9E6A B6 02 98      [ 4] 3636         ldaa    (0x0298)
   9E6D 81 02         [ 2] 3637         cmpa    #0x02
   9E6F 26 03         [ 3] 3638         bne     L9E37  
   9E71 CE 04 05      [ 3] 3639         ldx     #0x0405
   9E74                    3640 L9E37:
   9E74 3C            [ 4] 3641         pshx
   9E75 BD AB 93      [ 6] 3642         jsr     LAB56
   9E78 38            [ 5] 3643         pulx
   9E79 25 07         [ 3] 3644         bcs     L9E45  
   9E7B 86 03         [ 2] 3645         ldaa    #0x03
   9E7D B7 02 98      [ 4] 3646         staa    (0x0298)
   9E80 20 23         [ 3] 3647         bra     L9E68  
   9E82                    3648 L9E45:
   9E82 B6 02 99      [ 4] 3649         ldaa    (0x0299)
   9E85 A1 00         [ 4] 3650         cmpa    0,X     
   9E87 25 1E         [ 3] 3651         bcs     L9E6A  
   9E89 27 02         [ 3] 3652         beq     L9E50  
   9E8B 24 18         [ 3] 3653         bcc     L9E68  
   9E8D                    3654 L9E50:
   9E8D 08            [ 3] 3655         inx
   9E8E B6 02 9A      [ 4] 3656         ldaa    (0x029A)
   9E91 A1 00         [ 4] 3657         cmpa    0,X     
   9E93 25 12         [ 3] 3658         bcs     L9E6A  
   9E95 27 02         [ 3] 3659         beq     L9E5C  
   9E97 24 0C         [ 3] 3660         bcc     L9E68  
   9E99                    3661 L9E5C:
   9E99 08            [ 3] 3662         inx
   9E9A B6 02 9B      [ 4] 3663         ldaa    (0x029B)
   9E9D A1 00         [ 4] 3664         cmpa    0,X     
   9E9F 25 06         [ 3] 3665         bcs     L9E6A  
   9EA1 27 02         [ 3] 3666         beq     L9E68  
   9EA3 24 00         [ 3] 3667         bcc     L9E68  
   9EA5                    3668 L9E68:
   9EA5 0C            [ 2] 3669         clc
   9EA6 39            [ 5] 3670         rts
                           3671 
   9EA7                    3672 L9E6A:
   9EA7 B6 02 98      [ 4] 3673         ldaa    (0x0298)
   9EAA 81 03         [ 2] 3674         cmpa    #0x03
   9EAC 27 F7         [ 3] 3675         beq     L9E68  
   9EAE                    3676 L9E71:
   9EAE 0D            [ 2] 3677         sec
   9EAF 39            [ 5] 3678         rts
                           3679 
   9EB0                    3680 L9E73:
   9EB0 CE 04 02      [ 3] 3681         ldx     #0x0402
   9EB3 B6 02 98      [ 4] 3682         ldaa    (0x0298)
   9EB6 81 02         [ 2] 3683         cmpa    #0x02
   9EB8 26 03         [ 3] 3684         bne     L9E80  
   9EBA CE 04 05      [ 3] 3685         ldx     #0x0405
   9EBD                    3686 L9E80:
   9EBD B6 02 99      [ 4] 3687         ldaa    (0x0299)
   9EC0 A7 00         [ 4] 3688         staa    0,X     
   9EC2 08            [ 3] 3689         inx
   9EC3 B6 02 9A      [ 4] 3690         ldaa    (0x029A)
   9EC6 A7 00         [ 4] 3691         staa    0,X     
   9EC8 08            [ 3] 3692         inx
   9EC9 B6 02 9B      [ 4] 3693         ldaa    (0x029B)
   9ECC A7 00         [ 4] 3694         staa    0,X     
   9ECE 39            [ 5] 3695         rts
                           3696 
                           3697 ; reset R counts
   9ECF                    3698 L9E92:
   9ECF 86 30         [ 2] 3699         ldaa    #0x30        
   9ED1 B7 04 02      [ 4] 3700         staa    (0x0402)
   9ED4 B7 04 03      [ 4] 3701         staa    (0x0403)
   9ED7 B7 04 04      [ 4] 3702         staa    (0x0404)
                           3703 
   9EDA BD 8D ED      [ 6] 3704         jsr     LCDMSG2 
   9EDD 52 65 67 20 23 20  3705         .ascis  'Reg # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3706 
   9EEB 39            [ 5] 3707         rts
                           3708 
                           3709 ; reset L counts
   9EEC                    3710 L9EAF:
   9EEC 86 30         [ 2] 3711         ldaa    #0x30
   9EEE B7 04 05      [ 4] 3712         staa    (0x0405)
   9EF1 B7 04 06      [ 4] 3713         staa    (0x0406)
   9EF4 B7 04 07      [ 4] 3714         staa    (0x0407)
                           3715 
   9EF7 BD 8D ED      [ 6] 3716         jsr     LCDMSG2 
   9EFA 4C 69 76 20 23 20  3717         .ascis  'Liv # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3718 
   9F08 39            [ 5] 3719         rts
                           3720 
                           3721 ; display R and L counts?
   9F09                    3722 L9ECC:
   9F09 86 52         [ 2] 3723         ldaa    #0x52           ;'R'
   9F0B C6 2B         [ 2] 3724         ldab    #0x2B
   9F0D BD 8D C5      [ 6] 3725         jsr     L8DB5           ; display char here on LCD display
   9F10 86 4C         [ 2] 3726         ldaa    #0x4C           ;'L'
   9F12 C6 32         [ 2] 3727         ldab    #0x32
   9F14 BD 8D C5      [ 6] 3728         jsr     L8DB5           ; display char here on LCD display
   9F17 CE 04 02      [ 3] 3729         ldx     #0x0402
   9F1A C6 2C         [ 2] 3730         ldab    #0x2C
   9F1C                    3731 L9EDF:
   9F1C A6 00         [ 4] 3732         ldaa    0,X     
   9F1E BD 8D C5      [ 6] 3733         jsr     L8DB5           ; display 3 chars here on LCD display
   9F21 5C            [ 2] 3734         incb
   9F22 08            [ 3] 3735         inx
   9F23 8C 04 05      [ 4] 3736         cpx     #0x0405
   9F26 26 F4         [ 3] 3737         bne     L9EDF  
   9F28 C6 33         [ 2] 3738         ldab    #0x33
   9F2A                    3739 L9EED:
   9F2A A6 00         [ 4] 3740         ldaa    0,X     
   9F2C BD 8D C5      [ 6] 3741         jsr     L8DB5           ; display 3 chars here on LCD display
   9F2F 5C            [ 2] 3742         incb
   9F30 08            [ 3] 3743         inx
   9F31 8C 04 08      [ 4] 3744         cpx     #0x0408
   9F34 26 F4         [ 3] 3745         bne     L9EED  
   9F36 39            [ 5] 3746         rts
                           3747 
   9F37                    3748 L9EFA:
   9F37 96 A8         [ 3] 3749         ldaa    (0x00A8)
   9F39 BD 9F 4C      [ 6] 3750         jsr     L9F0F
   9F3C 48            [ 2] 3751         asla
   9F3D 48            [ 2] 3752         asla
   9F3E 48            [ 2] 3753         asla
   9F3F 48            [ 2] 3754         asla
   9F40 97 13         [ 3] 3755         staa    (0x0013)
   9F42 96 A9         [ 3] 3756         ldaa    (0x00A9)
   9F44 BD 9F 4C      [ 6] 3757         jsr     L9F0F
   9F47 9B 13         [ 3] 3758         adda    (0x0013)
   9F49 97 A8         [ 3] 3759         staa    (0x00A8)
   9F4B 39            [ 5] 3760         rts
                           3761 
   9F4C                    3762 L9F0F:
   9F4C 81 2F         [ 2] 3763         cmpa    #0x2F
   9F4E 24 02         [ 3] 3764         bcc     L9F15  
   9F50 86 30         [ 2] 3765         ldaa    #0x30
   9F52                    3766 L9F15:
   9F52 81 3A         [ 2] 3767         cmpa    #0x3A
   9F54 25 02         [ 3] 3768         bcs     L9F1B  
   9F56 80 07         [ 2] 3769         suba    #0x07
   9F58                    3770 L9F1B:
   9F58 80 30         [ 2] 3771         suba    #0x30
   9F5A 39            [ 5] 3772         rts
                           3773 
                           3774 ; different behavior based on serial number
   9F5B                    3775 L9F1E:
   9F5B FC 02 9C      [ 5] 3776         ldd     (0x029C)
   9F5E 1A 83 00 01   [ 5] 3777         cpd     #0x0001         ; if 1, password bypass
   9F62 27 0C         [ 3] 3778         beq     L9F33           ;
   9F64 1A 83 03 E8   [ 5] 3779         cpd     #0x03E8         ; 1000
   9F68 25 20         [ 3] 3780         bcs     L9F4D           ; if > 1000, code
   9F6A 1A 83 04 4B   [ 5] 3781         cpd     #0x044B         ; 1099
   9F6E 22 1A         [ 3] 3782         bhi     L9F4D           ; if < 1099, code
                           3783                                 ; else 1 < x < 1000, bypass
                           3784 
   9F70                    3785 L9F33:
   9F70 BD 8D F4      [ 6] 3786         jsr     LCDMSG1 
   9F73 50 61 73 73 77 6F  3787         .ascis  'Password bypass '
        72 64 20 62 79 70
        61 73 73 A0
                           3788 
   9F83 C6 04         [ 2] 3789         ldab    #0x04
   9F85 BD 8C 40      [ 6] 3790         jsr     DLYSECSBY2      ; delay 2 sec
   9F88 0C            [ 2] 3791         clc
   9F89 39            [ 5] 3792         rts
                           3793 
   9F8A                    3794 L9F4D:
   9F8A BD 8D 02      [ 6] 3795         jsr     L8CF2
   9F8D BD 8D 13      [ 6] 3796         jsr     L8D03
                           3797 
   9F90 BD 8D F4      [ 6] 3798         jsr     LCDMSG1 
   9F93 43 6F 64 65 BA     3799         .ascis  'Code:'
                           3800 
                           3801 ; Generate a random 5-digit code in 0x0290-0x0294, and display to user
                           3802 
   9F98 CE 02 90      [ 3] 3803         ldx     #0x0290
   9F9B 7F 00 16      [ 6] 3804         clr     (0x0016)        ; 0x00
   9F9E                    3805 L9F61:
   9F9E 86 41         [ 2] 3806         ldaa    #0x41           ; 'A'
   9FA0                    3807 L9F63:
   9FA0 97 15         [ 3] 3808         staa    (0x0015)        ; 0x41
   9FA2 BD 8E A5      [ 6] 3809         jsr     L8E95           ; read SCD keys
   9FA5 81 0D         [ 2] 3810         cmpa    #0x0D
   9FA7 26 11         [ 3] 3811         bne     L9F7D
   9FA9 96 15         [ 3] 3812         ldaa    (0x0015)
   9FAB A7 00         [ 4] 3813         staa    0,X     
   9FAD 08            [ 3] 3814         inx
   9FAE BD 8C A8      [ 6] 3815         jsr     L8C98
   9FB1 96 16         [ 3] 3816         ldaa    (0x0016)
   9FB3 4C            [ 2] 3817         inca
   9FB4 97 16         [ 3] 3818         staa    (0x0016)
   9FB6 81 05         [ 2] 3819         cmpa    #0x05
   9FB8 27 09         [ 3] 3820         beq     L9F86  
   9FBA                    3821 L9F7D:
   9FBA 96 15         [ 3] 3822         ldaa    (0x0015)
   9FBC 4C            [ 2] 3823         inca
   9FBD 81 5B         [ 2] 3824         cmpa    #0x5B           ; '['
   9FBF 27 DD         [ 3] 3825         beq     L9F61  
   9FC1 20 DD         [ 3] 3826         bra     L9F63  
                           3827 
                           3828 ; Let the user type in a corresponding password to the code
   9FC3                    3829 L9F86:
   9FC3 BD 8D ED      [ 6] 3830         jsr     LCDMSG2 
   9FC6 50 73 77 64 BA     3831         .ascis  'Pswd:'
                           3832 
   9FCB CE 02 88      [ 3] 3833         ldx     #0x0288
   9FCE 86 41         [ 2] 3834         ldaa    #0x41           ; 'A'
   9FD0 97 16         [ 3] 3835         staa    (0x0016)
   9FD2 86 C5         [ 2] 3836         ldaa    #0xC5           ; 
   9FD4 97 15         [ 3] 3837         staa    (0x0015)
   9FD6                    3838 L9F99:
   9FD6 96 15         [ 3] 3839         ldaa    (0x0015)
   9FD8 BD 8C 96      [ 6] 3840         jsr     L8C86           ; write byte to LCD
   9FDB 96 16         [ 3] 3841         ldaa    (0x0016)
   9FDD BD 8C A8      [ 6] 3842         jsr     L8C98
   9FE0                    3843 L9FA3:
   9FE0 BD 8E A5      [ 6] 3844         jsr     L8E95
   9FE3 27 FB         [ 3] 3845         beq     L9FA3  
   9FE5 81 0D         [ 2] 3846         cmpa    #0x0D
   9FE7 26 10         [ 3] 3847         bne     L9FBC  
   9FE9 96 16         [ 3] 3848         ldaa    (0x0016)
   9FEB A7 00         [ 4] 3849         staa    0,X     
   9FED 08            [ 3] 3850         inx
   9FEE 96 15         [ 3] 3851         ldaa    (0x0015)
   9FF0 4C            [ 2] 3852         inca
   9FF1 97 15         [ 3] 3853         staa    (0x0015)
   9FF3 81 CA         [ 2] 3854         cmpa    #0xCA
   9FF5 27 28         [ 3] 3855         beq     L9FE2  
   9FF7 20 DD         [ 3] 3856         bra     L9F99  
   9FF9                    3857 L9FBC:
   9FF9 81 01         [ 2] 3858         cmpa    #0x01
   9FFB 26 0F         [ 3] 3859         bne     L9FCF  
   9FFD 96 16         [ 3] 3860         ldaa    (0x0016)
   9FFF 4C            [ 2] 3861         inca
   A000 97 16         [ 3] 3862         staa    (0x0016)
   A002 81 5B         [ 2] 3863         cmpa    #0x5B
   A004 26 D0         [ 3] 3864         bne     L9F99  
   A006 86 41         [ 2] 3865         ldaa    #0x41
   A008 97 16         [ 3] 3866         staa    (0x0016)
   A00A 20 CA         [ 3] 3867         bra     L9F99  
   A00C                    3868 L9FCF:
   A00C 81 02         [ 2] 3869         cmpa    #0x02
   A00E 26 D0         [ 3] 3870         bne     L9FA3  
   A010 96 16         [ 3] 3871         ldaa    (0x0016)
   A012 4A            [ 2] 3872         deca
   A013 97 16         [ 3] 3873         staa    (0x0016)
   A015 81 40         [ 2] 3874         cmpa    #0x40
   A017 26 BD         [ 3] 3875         bne     L9F99  
   A019 86 5A         [ 2] 3876         ldaa    #0x5A
   A01B 97 16         [ 3] 3877         staa    (0x0016)
   A01D 20 B7         [ 3] 3878         bra     L9F99  
   A01F                    3879 L9FE2:
   A01F BD A0 3E      [ 6] 3880         jsr     LA001           ; validate
   A022 25 0F         [ 3] 3881         bcs     L9FF6           ; if bad, jump
   A024 86 DB         [ 2] 3882         ldaa    #0xDB
   A026 97 AB         [ 3] 3883         staa    (0x00AB)        ; good password
   A028 FC 04 16      [ 5] 3884         ldd     (0x0416)        ; increment number of good validations counter
   A02B C3 00 01      [ 4] 3885         addd    #0x0001
   A02E FD 04 16      [ 5] 3886         std     (0x0416)
   A031 0C            [ 2] 3887         clc
   A032 39            [ 5] 3888         rts
                           3889 
   A033                    3890 L9FF6:
   A033 FC 04 14      [ 5] 3891         ldd     (0x0414)        ; increment number of bad validations counter
   A036 C3 00 01      [ 4] 3892         addd    #0x0001
   A039 FD 04 14      [ 5] 3893         std     (0x0414)
   A03C 0D            [ 2] 3894         sec
   A03D 39            [ 5] 3895         rts
                           3896 
                           3897 ; Validate password?
   A03E                    3898 LA001:
                           3899         ; scramble 5 letters
   A03E B6 02 90      [ 4] 3900         ldaa    (0x0290)        ; 0 -> 1
   A041 B7 02 81      [ 4] 3901         staa    (0x0281)
   A044 B6 02 91      [ 4] 3902         ldaa    (0x0291)        ; 1 -> 3
   A047 B7 02 83      [ 4] 3903         staa    (0x0283)
   A04A B6 02 92      [ 4] 3904         ldaa    (0x0292)        ; 2 -> 4
   A04D B7 02 84      [ 4] 3905         staa    (0x0284)
   A050 B6 02 93      [ 4] 3906         ldaa    (0x0293)        ; 3 -> 0
   A053 B7 02 80      [ 4] 3907         staa    (0x0280)
   A056 B6 02 94      [ 4] 3908         ldaa    (0x0294)        ; 4 -> 2
   A059 B7 02 82      [ 4] 3909         staa    (0x0282)
                           3910         ; transform each letter
   A05C B6 02 80      [ 4] 3911         ldaa    (0x0280)    
   A05F 88 13         [ 2] 3912         eora    #0x13
   A061 8B 03         [ 2] 3913         adda    #0x03
   A063 B7 02 80      [ 4] 3914         staa    (0x0280)
   A066 B6 02 81      [ 4] 3915         ldaa    (0x0281)
   A069 88 04         [ 2] 3916         eora    #0x04
   A06B 8B 12         [ 2] 3917         adda    #0x12
   A06D B7 02 81      [ 4] 3918         staa    (0x0281)
   A070 B6 02 82      [ 4] 3919         ldaa    (0x0282)
   A073 88 06         [ 2] 3920         eora    #0x06
   A075 8B 04         [ 2] 3921         adda    #0x04
   A077 B7 02 82      [ 4] 3922         staa    (0x0282)
   A07A B6 02 83      [ 4] 3923         ldaa    (0x0283)
   A07D 88 11         [ 2] 3924         eora    #0x11
   A07F 8B 07         [ 2] 3925         adda    #0x07
   A081 B7 02 83      [ 4] 3926         staa    (0x0283)
   A084 B6 02 84      [ 4] 3927         ldaa    (0x0284)
   A087 88 01         [ 2] 3928         eora    #0x01
   A089 8B 10         [ 2] 3929         adda    #0x10
   A08B B7 02 84      [ 4] 3930         staa    (0x0284)
                           3931         ; keep them modulo 26 (A-Z)
   A08E BD A0 EC      [ 6] 3932         jsr     LA0AF
                           3933         ; put some of the original bits into 0x0015/0x0016
   A091 B6 02 94      [ 4] 3934         ldaa    (0x0294)
   A094 84 17         [ 2] 3935         anda    #0x17
   A096 97 15         [ 3] 3936         staa    (0x0015)
   A098 B6 02 90      [ 4] 3937         ldaa    (0x0290)
   A09B 84 17         [ 2] 3938         anda    #0x17
   A09D 97 16         [ 3] 3939         staa    (0x0016)
                           3940         ; do some eoring with these bits
   A09F CE 02 80      [ 3] 3941         ldx     #0x0280
   A0A2                    3942 LA065:
   A0A2 A6 00         [ 4] 3943         ldaa    0,X
   A0A4 98 15         [ 3] 3944         eora    (0x0015)
   A0A6 98 16         [ 3] 3945         eora    (0x0016)
   A0A8 A7 00         [ 4] 3946         staa    0,X
   A0AA 08            [ 3] 3947         inx
   A0AB 8C 02 85      [ 4] 3948         cpx     #0x0285
   A0AE 26 F2         [ 3] 3949         bne     LA065
                           3950         ; keep them modulo 26 (A-Z)
   A0B0 BD A0 EC      [ 6] 3951         jsr     LA0AF
                           3952         ; compare them to code in 0x0288-0x028C
   A0B3 CE 02 80      [ 3] 3953         ldx     #0x0280
   A0B6 18 CE 02 88   [ 4] 3954         ldy     #0x0288
   A0BA                    3955 LA07D:
   A0BA A6 00         [ 4] 3956         ldaa    0,X     
   A0BC 18 A1 00      [ 5] 3957         cmpa    0,Y     
   A0BF 26 0A         [ 3] 3958         bne     LA08E  
   A0C1 08            [ 3] 3959         inx
   A0C2 18 08         [ 4] 3960         iny
   A0C4 8C 02 85      [ 4] 3961         cpx     #0x0285
   A0C7 26 F1         [ 3] 3962         bne     LA07D  
   A0C9 0C            [ 2] 3963         clc                     ; carry clear if good
   A0CA 39            [ 5] 3964         rts
                           3965 
   A0CB                    3966 LA08E:
   A0CB 0D            [ 2] 3967         sec                     ; carry set if bad
   A0CC 39            [ 5] 3968         rts
                           3969 
                           3970 ; trivial password validation - not used??
   A0CD                    3971 LA090:
   A0CD 59 41 44 44 41     3972         .ascii  'YADDA'
                           3973 
   A0D2 CE 02 88      [ 3] 3974         ldx     #0x0288
   A0D5 18 CE A0 CD   [ 4] 3975         ldy     #LA090
   A0D9                    3976 LA09C:
   A0D9 A6 00         [ 4] 3977         ldaa    0,X
   A0DB 18 A1 00      [ 5] 3978         cmpa    0,Y
   A0DE 26 0A         [ 3] 3979         bne     LA0AD
   A0E0 08            [ 3] 3980         inx
   A0E1 18 08         [ 4] 3981         iny
   A0E3 8C 02 8D      [ 4] 3982         cpx     #0x028D
   A0E6 26 F1         [ 3] 3983         bne     LA09C
   A0E8 0C            [ 2] 3984         clc
   A0E9 39            [ 5] 3985         rts
   A0EA                    3986 LA0AD:
   A0EA 0D            [ 2] 3987         sec
   A0EB 39            [ 5] 3988         rts
                           3989 
                           3990 ; keep the password modulo 26, each letter in range 'A-Z'
   A0EC                    3991 LA0AF:
   A0EC CE 02 80      [ 3] 3992         ldx     #0x0280
   A0EF                    3993 LA0B2:
   A0EF A6 00         [ 4] 3994         ldaa    0,X
   A0F1 81 5B         [ 2] 3995         cmpa    #0x5B
   A0F3 25 06         [ 3] 3996         bcs     LA0BE
   A0F5 80 1A         [ 2] 3997         suba    #0x1A
   A0F7 A7 00         [ 4] 3998         staa    0,X
   A0F9 20 08         [ 3] 3999         bra     LA0C6
   A0FB                    4000 LA0BE:
   A0FB 81 41         [ 2] 4001         cmpa    #0x41
   A0FD 24 04         [ 3] 4002         bcc     LA0C6
   A0FF 8B 1A         [ 2] 4003         adda    #0x1A
   A101 A7 00         [ 4] 4004         staa    0,X
   A103                    4005 LA0C6:
   A103 08            [ 3] 4006         inx
   A104 8C 02 85      [ 4] 4007         cpx     #0x0285
   A107 26 E6         [ 3] 4008         bne     LA0B2  
   A109 39            [ 5] 4009         rts
                           4010 
   A10A BD 8D 02      [ 6] 4011         jsr     L8CF2
                           4012 
   A10D BD 8D ED      [ 6] 4013         jsr     LCDMSG2 
   A110 46 61 69 6C 65 64  4014         .ascis  'Failed!         '
        21 20 20 20 20 20
        20 20 20 A0
                           4015 
   A120 C6 02         [ 2] 4016         ldab    #0x02
   A122 BD 8C 40      [ 6] 4017         jsr     DLYSECSBY2      ; delay 1 sec
   A125 39            [ 5] 4018         rts
                           4019 
   A126                    4020 LA0E9:
   A126 C6 01         [ 2] 4021         ldab    #0x01
   A128 BD 8C 40      [ 6] 4022         jsr     DLYSECSBY2      ; delay 0.5 sec
   A12B 7F 00 4E      [ 6] 4023         clr     (0x004E)
   A12E C6 D3         [ 2] 4024         ldab    #0xD3
   A130 BD 87 58      [ 6] 4025         jsr     L8748   
   A133 BD 87 BE      [ 6] 4026         jsr     L87AE
   A136 BD 8C F9      [ 6] 4027         jsr     L8CE9
                           4028 
   A139 BD 8D F4      [ 6] 4029         jsr     LCDMSG1 
   A13C 20 20 20 56 43 52  4030         .ascis  '   VCR adjust'
        20 61 64 6A 75 73
        F4
                           4031 
   A149 BD 8D ED      [ 6] 4032         jsr     LCDMSG2 
   A14C 55 50 20 74 6F 20  4033         .ascis  'UP to clear bits'
        63 6C 65 61 72 20
        62 69 74 F3
                           4034 
   A15C 5F            [ 2] 4035         clrb
   A15D D7 62         [ 3] 4036         stab    (0x0062)
   A15F BD FA F9      [ 6] 4037         jsr     BUTNLIT 
   A162 B6 18 04      [ 4] 4038         ldaa    PIA0PRA 
   A165 84 BF         [ 2] 4039         anda    #0xBF
   A167 B7 18 04      [ 4] 4040         staa    PIA0PRA 
   A16A BD 8E A5      [ 6] 4041         jsr     L8E95
   A16D 7F 00 48      [ 6] 4042         clr     (0x0048)
   A170 7F 00 49      [ 6] 4043         clr     (0x0049)
   A173 BD 86 D4      [ 6] 4044         jsr     L86C4           ; Reset boards 1-10
   A176 86 28         [ 2] 4045         ldaa    #0x28
   A178 97 63         [ 3] 4046         staa    (0x0063)
   A17A C6 FD         [ 2] 4047         ldab    #0xFD           ; tape deck STOP
   A17C BD 86 F7      [ 6] 4048         jsr     L86E7
   A17F BD A3 6B      [ 6] 4049         jsr     LA32E
   A182 7C 00 76      [ 6] 4050         inc     (0x0076)
   A185 7F 00 32      [ 6] 4051         clr     (0x0032)
   A188                    4052 LA14B:
   A188 BD 8E A5      [ 6] 4053         jsr     L8E95
   A18B 81 0D         [ 2] 4054         cmpa    #0x0D
   A18D 26 03         [ 3] 4055         bne     LA155  
   A18F 7E A2 01      [ 3] 4056         jmp     LA1C4
   A192                    4057 LA155:
   A192 86 28         [ 2] 4058         ldaa    #0x28
   A194 97 63         [ 3] 4059         staa    (0x0063)
   A196 BD 86 B2      [ 6] 4060         jsr     L86A4
   A199 25 ED         [ 3] 4061         bcs     LA14B  
   A19B FC 04 1A      [ 5] 4062         ldd     (0x041A)
   A19E C3 00 01      [ 4] 4063         addd    #0x0001
   A1A1 FD 04 1A      [ 5] 4064         std     (0x041A)
   A1A4 BD 86 D4      [ 6] 4065         jsr     L86C4           ; Reset boards 1-10
   A1A7 7C 00 4E      [ 6] 4066         inc     (0x004E)
   A1AA C6 D3         [ 2] 4067         ldab    #0xD3
   A1AC BD 87 58      [ 6] 4068         jsr     L8748   
   A1AF BD 87 BE      [ 6] 4069         jsr     L87AE
   A1B2                    4070 LA175:
   A1B2 96 49         [ 3] 4071         ldaa    (0x0049)
   A1B4 81 43         [ 2] 4072         cmpa    #0x43
   A1B6 26 06         [ 3] 4073         bne     LA181  
   A1B8 7F 00 49      [ 6] 4074         clr     (0x0049)
   A1BB 7F 00 48      [ 6] 4075         clr     (0x0048)
   A1BE                    4076 LA181:
   A1BE 96 48         [ 3] 4077         ldaa    (0x0048)
   A1C0 81 C8         [ 2] 4078         cmpa    #0xC8
   A1C2 25 1F         [ 3] 4079         bcs     LA1A6  
   A1C4 FC 02 9C      [ 5] 4080         ldd     (0x029C)
   A1C7 1A 83 00 01   [ 5] 4081         cpd     #0x0001
   A1CB 27 16         [ 3] 4082         beq     LA1A6  
   A1CD C6 EF         [ 2] 4083         ldab    #0xEF           ; tape deck EJECT
   A1CF BD 86 F7      [ 6] 4084         jsr     L86E7
   A1D2 BD 86 D4      [ 6] 4085         jsr     L86C4           ; Reset boards 1-10
   A1D5 7F 00 4E      [ 6] 4086         clr     (0x004E)
   A1D8 7F 00 76      [ 6] 4087         clr     (0x0076)
   A1DB C6 0A         [ 2] 4088         ldab    #0x0A
   A1DD BD 8C 40      [ 6] 4089         jsr     DLYSECSBY2      ; delay 5 sec
   A1E0 7E 81 D4      [ 3] 4090         jmp     L81D7
   A1E3                    4091 LA1A6:
   A1E3 BD 8E A5      [ 6] 4092         jsr     L8E95
   A1E6 81 01         [ 2] 4093         cmpa    #0x01
   A1E8 26 10         [ 3] 4094         bne     LA1BD  
   A1EA CE 10 80      [ 3] 4095         ldx     #0x1080
   A1ED 86 34         [ 2] 4096         ldaa    #0x34
   A1EF                    4097 LA1B2:
   A1EF 6F 00         [ 6] 4098         clr     0,X     
   A1F1 A7 01         [ 4] 4099         staa    1,X     
   A1F3 08            [ 3] 4100         inx
   A1F4 08            [ 3] 4101         inx
   A1F5 8C 10 A0      [ 4] 4102         cpx     #0x10A0
   A1F8 25 F5         [ 3] 4103         bcs     LA1B2  
   A1FA                    4104 LA1BD:
   A1FA 81 0D         [ 2] 4105         cmpa    #0x0D
   A1FC 27 03         [ 3] 4106         beq     LA1C4  
   A1FE 7E A1 B2      [ 3] 4107         jmp     LA175
   A201                    4108 LA1C4:
   A201 7F 00 76      [ 6] 4109         clr     (0x0076)
   A204 7F 00 4E      [ 6] 4110         clr     (0x004E)
   A207 C6 DF         [ 2] 4111         ldab    #0xDF
   A209 BD 87 58      [ 6] 4112         jsr     L8748   
   A20C BD 87 A1      [ 6] 4113         jsr     L8791   
   A20F 7E 81 D4      [ 3] 4114         jmp     L81D7
                           4115 
                           4116 ; reprogram EEPROM signature if needed
   A212                    4117 LA1D5:
   A212 86 08         [ 2] 4118         ldaa    #0x08
   A214 B7 04 00      [ 4] 4119         staa    (0x0400)
   A217 CC 0E 09      [ 3] 4120         ldd     #0x0E09
   A21A 81 65         [ 2] 4121         cmpa    #0x65           ;'e'
   A21C 26 05         [ 3] 4122         bne     LA1E6
   A21E C1 63         [ 2] 4123         cmpb    #0x63           ;'c'
   A220 26 01         [ 3] 4124         bne     LA1E6
   A222 39            [ 5] 4125         rts
                           4126 
                           4127 ; erase and reprogram EEPROM signature
   A223                    4128 LA1E6:
   A223 86 0E         [ 2] 4129         ldaa    #0x0E
   A225 B7 10 3B      [ 4] 4130         staa    PPROG
   A228 86 FF         [ 2] 4131         ldaa    #0xFF
   A22A B7 0E 00      [ 4] 4132         staa    (0x0E00)
   A22D B6 10 3B      [ 4] 4133         ldaa    PPROG  
   A230 8A 01         [ 2] 4134         oraa    #0x01
   A232 B7 10 3B      [ 4] 4135         staa    PPROG  
   A235 CE 1B 58      [ 3] 4136         ldx     #0x1B58         ; 7000
   A238                    4137 LA1FB:
   A238 09            [ 3] 4138         dex
   A239 26 FD         [ 3] 4139         bne     LA1FB  
   A23B B6 10 3B      [ 4] 4140         ldaa    PPROG  
   A23E 84 FE         [ 2] 4141         anda    #0xFE
   A240 B7 10 3B      [ 4] 4142         staa    PPROG  
   A243 CE 0E 00      [ 3] 4143         ldx     #0x0E00
   A246 18 CE A2 63   [ 4] 4144         ldy     #LA226
   A24A                    4145 LA20D:
   A24A C6 02         [ 2] 4146         ldab    #0x02
   A24C F7 10 3B      [ 4] 4147         stab    PPROG  
   A24F 18 A6 00      [ 5] 4148         ldaa    0,Y     
   A252 18 08         [ 4] 4149         iny
   A254 A7 00         [ 4] 4150         staa    0,X     
   A256 BD A2 6F      [ 6] 4151         jsr     LA232
   A259 08            [ 3] 4152         inx
   A25A 8C 0E 0C      [ 4] 4153         cpx     #0x0E0C
   A25D 26 EB         [ 3] 4154         bne     LA20D  
   A25F 7F 10 3B      [ 6] 4155         clr     PPROG  
   A262 39            [ 5] 4156         rts
                           4157 
                           4158 ; data for 0x0E00-0x0E0B EEPROM
   A263                    4159 LA226:
   A263 29 64 2A 21 32 3A  4160         .ascii  ')d*!2::4!ecq'
        3A 34 21 65 63 71
                           4161 
                           4162 ; program EEPROM
   A26F                    4163 LA232:
   A26F 18 3C         [ 5] 4164         pshy
   A271 C6 03         [ 2] 4165         ldab    #0x03
   A273 F7 10 3B      [ 4] 4166         stab    PPROG           ; start program
   A276 18 CE 1B 58   [ 4] 4167         ldy     #0x1B58
   A27A                    4168 LA23D:
   A27A 18 09         [ 4] 4169         dey
   A27C 26 FC         [ 3] 4170         bne     LA23D  
   A27E C6 02         [ 2] 4171         ldab    #0x02
   A280 F7 10 3B      [ 4] 4172         stab    PPROG           ; stop program
   A283 18 38         [ 6] 4173         puly
   A285 39            [ 5] 4174         rts
                           4175 
   A286                    4176 LA249:
   A286 0F            [ 2] 4177         sei
   A287 CE 00 10      [ 3] 4178         ldx     #0x0010
   A28A                    4179 LA24D:
   A28A 6F 00         [ 6] 4180         clr     0,X     
   A28C 08            [ 3] 4181         inx
   A28D 8C 0E 00      [ 4] 4182         cpx     #0x0E00
   A290 26 F8         [ 3] 4183         bne     LA24D  
   A292 BD 9E EC      [ 6] 4184         jsr     L9EAF           ; reset L counts
   A295 BD 9E CF      [ 6] 4185         jsr     L9E92           ; reset R counts
   A298 7E F8 00      [ 3] 4186         jmp     RESET           ; reset controller
                           4187 
                           4188 ; Compute and store copyright checksum
   A29B                    4189 LA25E:
   A29B 18 CE 80 03   [ 4] 4190         ldy     #CPYRTMSG       ; copyright message
   A29F CE 00 00      [ 3] 4191         ldx     #0x0000
   A2A2                    4192 LA265:
   A2A2 18 E6 00      [ 5] 4193         ldab    0,Y
   A2A5 3A            [ 3] 4194         abx
   A2A6 18 08         [ 4] 4195         iny
   A2A8 18 8C 80 50   [ 5] 4196         cpy     #0x8050
   A2AC 26 F4         [ 3] 4197         bne     LA265
   A2AE FF 04 0B      [ 5] 4198         stx     CPYRTCS         ; store checksum here
   A2B1 39            [ 5] 4199         rts
                           4200 
                           4201 ; Erase EEPROM routine
   A2B2                    4202 LA275:
   A2B2 0F            [ 2] 4203         sei
   A2B3 7F 04 0F      [ 6] 4204         clr     ERASEFLG        ; Reset EEPROM Erase flag
   A2B6 86 0E         [ 2] 4205         ldaa    #0x0E
   A2B8 B7 10 3B      [ 4] 4206         staa    PPROG           ; ERASE mode!
   A2BB 86 FF         [ 2] 4207         ldaa    #0xFF
   A2BD B7 0E 20      [ 4] 4208         staa    (0x0E20)        ; save in NVRAM
   A2C0 B6 10 3B      [ 4] 4209         ldaa    PPROG  
   A2C3 8A 01         [ 2] 4210         oraa    #0x01
   A2C5 B7 10 3B      [ 4] 4211         staa    PPROG           ; do the ERASE
   A2C8 CE 1B 58      [ 3] 4212         ldx     #0x1B58         ; delay a bit
   A2CB                    4213 LA28E:
   A2CB 09            [ 3] 4214         dex
   A2CC 26 FD         [ 3] 4215         bne     LA28E  
   A2CE B6 10 3B      [ 4] 4216         ldaa    PPROG  
   A2D1 84 FE         [ 2] 4217         anda    #0xFE           ; stop erasing
   A2D3 7F 10 3B      [ 6] 4218         clr     PPROG  
                           4219 
   A2D6 BD FB 0C      [ 6] 4220         jsr     SERMSGW         ; display "enter serial number"
   A2D9 45 6E 74 65 72 20  4221         .ascis  'Enter serial #: '
        73 65 72 69 61 6C
        20 23 3A A0
                           4222 
   A2E9 CE 0E 20      [ 3] 4223         ldx     #0x0E20
   A2EC                    4224 LA2AF:
   A2EC BD FA 79      [ 6] 4225         jsr     SERIALR         ; wait for serial data
   A2EF 24 FB         [ 3] 4226         bcc     LA2AF  
                           4227 
   A2F1 BD FA A3      [ 6] 4228         jsr     SERIALW         ; read serial data
   A2F4 C6 02         [ 2] 4229         ldab    #0x02
   A2F6 F7 10 3B      [ 4] 4230         stab    PPROG           ; protect only 0x0e20-0x0e5f
   A2F9 A7 00         [ 4] 4231         staa    0,X         
   A2FB BD A2 6F      [ 6] 4232         jsr     LA232           ; program byte
   A2FE 08            [ 3] 4233         inx
   A2FF 8C 0E 24      [ 4] 4234         cpx     #0x0E24
   A302 26 E8         [ 3] 4235         bne     LA2AF  
   A304 C6 02         [ 2] 4236         ldab    #0x02
   A306 F7 10 3B      [ 4] 4237         stab    PPROG  
   A309 86 DB         [ 2] 4238         ldaa    #0xDB           ; it's official
   A30B B7 0E 24      [ 4] 4239         staa    (0x0E24)
   A30E BD A2 6F      [ 6] 4240         jsr     LA232           ; program byte
   A311 7F 10 3B      [ 6] 4241         clr     PPROG  
   A314 86 1E         [ 2] 4242         ldaa    #0x1E
   A316 B7 10 35      [ 4] 4243         staa    BPROT           ; protect all but 0x0e00-0x0e1f
   A319 7E F8 00      [ 3] 4244         jmp     RESET           ; reset controller
                           4245 
   A31C                    4246 LA2DF:
   A31C 38            [ 5] 4247         pulx
   A31D 3C            [ 4] 4248         pshx
   A31E 8C 80 00      [ 4] 4249         cpx     #0x8000
   A321 25 02         [ 3] 4250         bcs     LA2E8           ; if 0x8000 < calling address (should be)
   A323 0C            [ 2] 4251         clc
   A324 39            [ 5] 4252         rts
                           4253 
   A325                    4254 LA2E8:
   A325 0D            [ 2] 4255         sec
   A326 39            [ 5] 4256         rts
                           4257 
                           4258 ; enter and validate security code via serial
   A327                    4259 LA2EA:
   A327 CE 02 88      [ 3] 4260         ldx     #0x0288
   A32A C6 03         [ 2] 4261         ldab    #0x03           ; 3 character code
                           4262 
   A32C                    4263 LA2EF:
   A32C BD FA 79      [ 6] 4264         jsr     SERIALR         ; check if available
   A32F 24 FB         [ 3] 4265         bcc     LA2EF  
   A331 A7 00         [ 4] 4266         staa    0,X     
   A333 08            [ 3] 4267         inx
   A334 5A            [ 2] 4268         decb
   A335 26 F5         [ 3] 4269         bne     LA2EF  
                           4270 
   A337 B6 02 88      [ 4] 4271         ldaa    (0x0288)
   A33A 81 13         [ 2] 4272         cmpa    #0x13           ; 0x13
   A33C 26 10         [ 3] 4273         bne     LA311  
   A33E B6 02 89      [ 4] 4274         ldaa    (0x0289)
   A341 81 10         [ 2] 4275         cmpa    #0x10           ; 0x10
   A343 26 09         [ 3] 4276         bne     LA311  
   A345 B6 02 8A      [ 4] 4277         ldaa    (0x028A)
   A348 81 14         [ 2] 4278         cmpa    #0x14           ; 0x14
   A34A 26 02         [ 3] 4279         bne     LA311  
   A34C 0C            [ 2] 4280         clc
   A34D 39            [ 5] 4281         rts
                           4282 
   A34E                    4283 LA311:
   A34E 0D            [ 2] 4284         sec
   A34F 39            [ 5] 4285         rts
                           4286 
   A350                    4287 LA313:
   A350 36            [ 3] 4288         psha
   A351 B6 10 92      [ 4] 4289         ldaa    (0x1092)
   A354 8A 01         [ 2] 4290         oraa    #0x01
   A356                    4291 LA319:
   A356 B7 10 92      [ 4] 4292         staa    (0x1092)
   A359 32            [ 4] 4293         pula
   A35A 39            [ 5] 4294         rts
                           4295 
   A35B                    4296 LA31E:
   A35B 36            [ 3] 4297         psha
   A35C B6 10 92      [ 4] 4298         ldaa    (0x1092)
   A35F 84 FE         [ 2] 4299         anda    #0xFE
   A361 20 F3         [ 3] 4300         bra     LA319
                           4301 
   A363                    4302 LA326:
   A363 96 4E         [ 3] 4303         ldaa    (0x004E)
   A365 97 19         [ 3] 4304         staa    (0x0019)
   A367 7F 00 4E      [ 6] 4305         clr     (0x004E)
   A36A 39            [ 5] 4306         rts
                           4307 
   A36B                    4308 LA32E:
   A36B B6 10 86      [ 4] 4309         ldaa    (0x1086)
   A36E 8A 15         [ 2] 4310         oraa    #0x15
   A370 B7 10 86      [ 4] 4311         staa    (0x1086)
   A373 C6 01         [ 2] 4312         ldab    #0x01
   A375 BD 8C 40      [ 6] 4313         jsr     DLYSECSBY2      ; delay 0.5 sec
   A378 84 EA         [ 2] 4314         anda    #0xEA
   A37A B7 10 86      [ 4] 4315         staa    (0x1086)
   A37D 39            [ 5] 4316         rts
                           4317 
   A37E                    4318 LA341:
   A37E B6 10 86      [ 4] 4319         ldaa    (0x1086)
   A381 8A 2A         [ 2] 4320         oraa    #0x2A           ; xx1x1x1x
   A383 B7 10 86      [ 4] 4321         staa    (0x1086)
   A386 C6 01         [ 2] 4322         ldab    #0x01
   A388 BD 8C 40      [ 6] 4323         jsr     DLYSECSBY2      ; delay 0.5 sec
   A38B 84 D5         [ 2] 4324         anda    #0xD5           ; xx0x0x0x
   A38D B7 10 86      [ 4] 4325         staa    (0x1086)
   A390 39            [ 5] 4326         rts
                           4327 
   A391                    4328 LA354:
   A391 F6 18 04      [ 4] 4329         ldab    PIA0PRA 
   A394 CA 08         [ 2] 4330         orab    #0x08
   A396 F7 18 04      [ 4] 4331         stab    PIA0PRA 
   A399 39            [ 5] 4332         rts
                           4333 
   A39A F6 18 04      [ 4] 4334         ldab    PIA0PRA 
   A39D C4 F7         [ 2] 4335         andb    #0xF7
   A39F F7 18 04      [ 4] 4336         stab    PIA0PRA 
   A3A2 39            [ 5] 4337         rts
                           4338 
                           4339 ;'$' command goes here?
   A3A3                    4340 LA366:
   A3A3 7F 00 4E      [ 6] 4341         clr     (0x004E)
   A3A6 BD 86 D4      [ 6] 4342         jsr     L86C4           ; Reset boards 1-10
   A3A9 7F 04 2A      [ 6] 4343         clr     (0x042A)
                           4344 
   A3AC BD FB 0C      [ 6] 4345         jsr     SERMSGW
   A3AF 45 6E 74 65 72 20  4346         .ascis  'Enter security code:' 
        73 65 63 75 72 69
        74 79 20 63 6F 64
        65 BA
                           4347 
   A3C3 BD A3 27      [ 6] 4348         jsr     LA2EA
   A3C6 24 03         [ 3] 4349         bcc     LA38E
   A3C8 7E 83 3A      [ 3] 4350         jmp     L8331
                           4351 
   A3CB                    4352 LA38E:
   A3CB BD FB 0C      [ 6] 4353         jsr     SERMSGW      
   A3CE 0C 0A 0D 44 61 76  4354         .ascii  "\f\n\rDave's Setup Utility\n\r"
        65 27 73 20 53 65
        74 75 70 20 55 74
        69 6C 69 74 79 0A
        0D
   A3E7 3C 4B 3E 69 6E 67  4355         .ascii  '<K>ing enable\n\r'
        20 65 6E 61 62 6C
        65 0A 0D
   A3F6 3C 43 3E 6C 65 61  4356         .ascii  '<C>lear random\n\r'
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A406 3C 35 3E 20 63 68  4357         .ascii  '<5> character random\n\r'
        61 72 61 63 74 65
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A41C 3C 4C 3E 69 76 65  4358         .ascii  '<L>ive tape number clear\n\r'
        20 74 61 70 65 20
        6E 75 6D 62 65 72
        20 63 6C 65 61 72
        0A 0D
   A436 3C 52 3E 65 67 75  4359         .ascii  '<R>egular tape number clear\n\r'
        6C 61 72 20 74 61
        70 65 20 6E 75 6D
        62 65 72 20 63 6C
        65 61 72 0A 0D
   A453 3C 54 3E 65 73 74  4360         .ascii  '<T>est driver boards\n\r'
        20 64 72 69 76 65
        72 20 62 6F 61 72
        64 73 0A 0D
   A469 3C 42 3E 75 62 20  4361         .ascii  '<B>ub test\n\r'
        74 65 73 74 0A 0D
   A475 3C 44 3E 65 63 6B  4362         .ascii  '<D>eck test (with tape inserted)\n\r'
        20 74 65 73 74 20
        28 77 69 74 68 20
        74 61 70 65 20 69
        6E 73 65 72 74 65
        64 29 0A 0D
   A497 3C 37 3E 35 25 20  4363         .ascii  '<7>5% adjustment\n\r'
        61 64 6A 75 73 74
        6D 65 6E 74 0A 0D
   A4A9 3C 53 3E 68 6F 77  4364         .ascii  '<S>how re-valid tapes\n\r'
        20 72 65 2D 76 61
        6C 69 64 20 74 61
        70 65 73 0A 0D
   A4C0 3C 4A 3E 75 6D 70  4365         .ascis  '<J>ump to system\n\r'
        20 74 6F 20 73 79
        73 74 65 6D 0A 8D
                           4366 
   A4D2                    4367 LA495:
   A4D2 BD FA 79      [ 6] 4368         jsr     SERIALR     
   A4D5 24 FB         [ 3] 4369         bcc     LA495  
   A4D7 81 43         [ 2] 4370         cmpa    #0x43           ;'C'
   A4D9 26 09         [ 3] 4371         bne     LA4A7  
   A4DB 7F 04 01      [ 6] 4372         clr     (0x0401)        ;clear random
   A4DE 7F 04 2B      [ 6] 4373         clr     (0x042B)
   A4E1 7E A5 51      [ 3] 4374         jmp     LA514
   A4E4                    4375 LA4A7:
   A4E4 81 35         [ 2] 4376         cmpa    #0x35           ;'5'
   A4E6 26 0D         [ 3] 4377         bne     LA4B8  
   A4E8 B6 04 01      [ 4] 4378         ldaa    (0x0401)        ;5 character random
   A4EB 84 7F         [ 2] 4379         anda    #0x7F
   A4ED 8A 7F         [ 2] 4380         oraa    #0x7F
   A4EF B7 04 01      [ 4] 4381         staa    (0x0401)
   A4F2 7E A5 51      [ 3] 4382         jmp     LA514
   A4F5                    4383 LA4B8:
   A4F5 81 4C         [ 2] 4384         cmpa    #0x4C           ;'L'
   A4F7 26 06         [ 3] 4385         bne     LA4C2
   A4F9 BD 9E EC      [ 6] 4386         jsr     L9EAF           ; reset Liv counts
   A4FC 7E A5 51      [ 3] 4387         jmp     LA514
   A4FF                    4388 LA4C2:
   A4FF 81 52         [ 2] 4389         cmpa    #0x52           ;'R'
   A501 26 06         [ 3] 4390         bne     LA4CC  
   A503 BD 9E CF      [ 6] 4391         jsr     L9E92           ; reset Reg counts
   A506 7E A5 51      [ 3] 4392         jmp     LA514
   A509                    4393 LA4CC:
   A509 81 54         [ 2] 4394         cmpa    #0x54           ;'T'
   A50B 26 06         [ 3] 4395         bne     LA4D6  
   A50D BD A5 A2      [ 6] 4396         jsr     LA565           ; test driver boards
   A510 7E A5 51      [ 3] 4397         jmp     LA514
   A513                    4398 LA4D6:
   A513 81 42         [ 2] 4399         cmpa    #0x42           ;'B'
   A515 26 06         [ 3] 4400         bne     LA4E0  
   A517 BD A5 63      [ 6] 4401         jsr     LA526           ; bulb test?
   A51A 7E A5 51      [ 3] 4402         jmp     LA514
   A51D                    4403 LA4E0:
   A51D 81 44         [ 2] 4404         cmpa    #0x44           ;'D'
   A51F 26 06         [ 3] 4405         bne     LA4EA  
   A521 BD A5 79      [ 6] 4406         jsr     LA53C           ; deck test
   A524 7E A5 51      [ 3] 4407         jmp     LA514
   A527                    4408 LA4EA:
   A527 81 37         [ 2] 4409         cmpa    #0x37           ;'7'
   A529 26 08         [ 3] 4410         bne     LA4F6  
   A52B C6 FB         [ 2] 4411         ldab    #0xFB           ; tape deck PLAY
   A52D BD 86 F7      [ 6] 4412         jsr     L86E7           ; 5% adjustment
   A530 7E A5 51      [ 3] 4413         jmp     LA514
   A533                    4414 LA4F6:
   A533 81 4A         [ 2] 4415         cmpa    #0x4A           ;'J'
   A535 26 03         [ 3] 4416         bne     LA4FD  
   A537 7E F8 00      [ 3] 4417         jmp     RESET           ; jump to system (reset)
   A53A                    4418 LA4FD:
   A53A 81 4B         [ 2] 4419         cmpa    #0x4B           ;'K'
   A53C 26 06         [ 3] 4420         bne     LA507  
   A53E 7C 04 2A      [ 6] 4421         inc     (0x042A)        ; King enable
   A541 7E A5 51      [ 3] 4422         jmp     LA514
   A544                    4423 LA507:
   A544 81 53         [ 2] 4424         cmpa    #0x53           ;'S'
   A546 26 06         [ 3] 4425         bne     LA511  
   A548 BD AB B9      [ 6] 4426         jsr     LAB7C           ; show re-valid tapes
   A54B 7E A5 51      [ 3] 4427         jmp     LA514
   A54E                    4428 LA511:
   A54E 7E A4 D2      [ 3] 4429         jmp     LA495
   A551                    4430 LA514:
   A551 86 07         [ 2] 4431         ldaa    #0x07
   A553 BD FA A3      [ 6] 4432         jsr     SERIALW      
   A556 C6 01         [ 2] 4433         ldab    #0x01
   A558 BD 8C 40      [ 6] 4434         jsr     DLYSECSBY2      ; delay 0.5 sec
   A55B 86 07         [ 2] 4435         ldaa    #0x07
   A55D BD FA A3      [ 6] 4436         jsr     SERIALW      
   A560 7E A3 CB      [ 3] 4437         jmp     LA38E
                           4438 
                           4439 ; bulb test
   A563                    4440 LA526:
   A563 5F            [ 2] 4441         clrb
   A564 BD FA F9      [ 6] 4442         jsr     BUTNLIT 
   A567                    4443 LA52A:
   A567 F6 10 0A      [ 4] 4444         ldab    PORTE
   A56A C8 FF         [ 2] 4445         eorb    #0xFF
   A56C BD FA F9      [ 6] 4446         jsr     BUTNLIT 
   A56F C1 80         [ 2] 4447         cmpb    #0x80
   A571 26 F4         [ 3] 4448         bne     LA52A  
   A573 C6 02         [ 2] 4449         ldab    #0x02
   A575 BD 8C 40      [ 6] 4450         jsr     DLYSECSBY2      ; delay 1 sec
   A578 39            [ 5] 4451         rts
                           4452 
                           4453 ; deck test
   A579                    4454 LA53C:
   A579 C6 FD         [ 2] 4455         ldab    #0xFD           ; tape deck STOP
   A57B BD 86 F7      [ 6] 4456         jsr     L86E7
   A57E C6 06         [ 2] 4457         ldab    #0x06
   A580 BD 8C 40      [ 6] 4458         jsr     DLYSECSBY2      ; delay 3 sec
   A583 C6 FB         [ 2] 4459         ldab    #0xFB           ; tape deck PLAY
   A585 BD 86 F7      [ 6] 4460         jsr     L86E7
   A588 C6 06         [ 2] 4461         ldab    #0x06
   A58A BD 8C 40      [ 6] 4462         jsr     DLYSECSBY2      ; delay 3 sec
   A58D C6 FD         [ 2] 4463         ldab    #0xFD           ; tape deck STOP
   A58F BD 86 F7      [ 6] 4464         jsr     L86E7
   A592 C6 F7         [ 2] 4465         ldab    #0xF7
   A594 BD 86 F7      [ 6] 4466         jsr     L86E7           ; tape deck REWIND
   A597 C6 06         [ 2] 4467         ldab    #0x06
   A599 BD 8C 40      [ 6] 4468         jsr     DLYSECSBY2      ; delay 3 sec
   A59C C6 EF         [ 2] 4469         ldab    #0xEF           ; tape deck EJECT
   A59E BD 86 F7      [ 6] 4470         jsr     L86E7
   A5A1 39            [ 5] 4471         rts
                           4472 
                           4473 ; test driver boards
   A5A2                    4474 LA565:
   A5A2 BD FA 79      [ 6] 4475         jsr     SERIALR     
   A5A5 24 08         [ 3] 4476         bcc     LA572  
   A5A7 81 1B         [ 2] 4477         cmpa    #0x1B
   A5A9 26 04         [ 3] 4478         bne     LA572  
   A5AB BD 86 D4      [ 6] 4479         jsr     L86C4           ; Reset boards 1-10
   A5AE 39            [ 5] 4480         rts
   A5AF                    4481 LA572:
   A5AF 86 08         [ 2] 4482         ldaa    #0x08
   A5B1 97 15         [ 3] 4483         staa    (0x0015)
   A5B3 BD 86 D4      [ 6] 4484         jsr     L86C4           ; Reset boards 1-10
   A5B6 86 01         [ 2] 4485         ldaa    #0x01
   A5B8                    4486 LA57B:
   A5B8 36            [ 3] 4487         psha
   A5B9 16            [ 2] 4488         tab
   A5BA BD FA F9      [ 6] 4489         jsr     BUTNLIT 
   A5BD B6 18 04      [ 4] 4490         ldaa    PIA0PRA 
   A5C0 88 08         [ 2] 4491         eora    #0x08
   A5C2 B7 18 04      [ 4] 4492         staa    PIA0PRA 
   A5C5 32            [ 4] 4493         pula
   A5C6 B7 10 80      [ 4] 4494         staa    (0x1080)
   A5C9 B7 10 84      [ 4] 4495         staa    (0x1084)
   A5CC B7 10 88      [ 4] 4496         staa    (0x1088)
   A5CF B7 10 8C      [ 4] 4497         staa    (0x108C)
   A5D2 B7 10 90      [ 4] 4498         staa    (0x1090)
   A5D5 B7 10 94      [ 4] 4499         staa    (0x1094)
   A5D8 B7 10 98      [ 4] 4500         staa    (0x1098)
   A5DB B7 10 9C      [ 4] 4501         staa    (0x109C)
   A5DE C6 14         [ 2] 4502         ldab    #0x14
   A5E0 BD A6 8F      [ 6] 4503         jsr     LA652
   A5E3 49            [ 2] 4504         rola
   A5E4 36            [ 3] 4505         psha
   A5E5 D6 15         [ 3] 4506         ldab    (0x0015)
   A5E7 5A            [ 2] 4507         decb
   A5E8 D7 15         [ 3] 4508         stab    (0x0015)
   A5EA BD FA C9      [ 6] 4509         jsr     DIAGDGT         ; write digit to the diag display
   A5ED 37            [ 3] 4510         pshb
   A5EE C6 27         [ 2] 4511         ldab    #0x27
   A5F0 96 15         [ 3] 4512         ldaa    (0x0015)
   A5F2 0C            [ 2] 4513         clc
   A5F3 89 30         [ 2] 4514         adca    #0x30
   A5F5 BD 8D C5      [ 6] 4515         jsr     L8DB5           ; display char here on LCD display
   A5F8 33            [ 4] 4516         pulb
   A5F9 32            [ 4] 4517         pula
   A5FA 5D            [ 2] 4518         tstb
   A5FB 26 BB         [ 3] 4519         bne     LA57B  
   A5FD 86 08         [ 2] 4520         ldaa    #0x08
   A5FF 97 15         [ 3] 4521         staa    (0x0015)
   A601 BD 86 D4      [ 6] 4522         jsr     L86C4           ; Reset boards 1-10
   A604 86 01         [ 2] 4523         ldaa    #0x01
   A606                    4524 LA5C9:
   A606 B7 10 82      [ 4] 4525         staa    (0x1082)
   A609 B7 10 86      [ 4] 4526         staa    (0x1086)
   A60C B7 10 8A      [ 4] 4527         staa    (0x108A)
   A60F B7 10 8E      [ 4] 4528         staa    (0x108E)
   A612 B7 10 92      [ 4] 4529         staa    (0x1092)
   A615 B7 10 96      [ 4] 4530         staa    (0x1096)
   A618 B7 10 9A      [ 4] 4531         staa    (0x109A)
   A61B B7 10 9E      [ 4] 4532         staa    (0x109E)
   A61E C6 14         [ 2] 4533         ldab    #0x14
   A620 BD A6 8F      [ 6] 4534         jsr     LA652
   A623 49            [ 2] 4535         rola
   A624 36            [ 3] 4536         psha
   A625 D6 15         [ 3] 4537         ldab    (0x0015)
   A627 5A            [ 2] 4538         decb
   A628 D7 15         [ 3] 4539         stab    (0x0015)
   A62A BD FA C9      [ 6] 4540         jsr     DIAGDGT         ; write digit to the diag display
   A62D 37            [ 3] 4541         pshb
   A62E C6 27         [ 2] 4542         ldab    #0x27
   A630 96 15         [ 3] 4543         ldaa    (0x0015)
   A632 0C            [ 2] 4544         clc
   A633 89 30         [ 2] 4545         adca    #0x30
   A635 BD 8D C5      [ 6] 4546         jsr     L8DB5           ; display char here on LCD display
   A638 33            [ 4] 4547         pulb
   A639 32            [ 4] 4548         pula
   A63A 7D 00 15      [ 6] 4549         tst     (0x0015)
   A63D 26 C7         [ 3] 4550         bne     LA5C9  
   A63F BD 86 D4      [ 6] 4551         jsr     L86C4           ; Reset boards 1-10
   A642 CE 10 80      [ 3] 4552         ldx     #0x1080
   A645 C6 00         [ 2] 4553         ldab    #0x00
   A647                    4554 LA60A:
   A647 86 FF         [ 2] 4555         ldaa    #0xFF
   A649 A7 00         [ 4] 4556         staa    0,X
   A64B A7 02         [ 4] 4557         staa    2,X     
   A64D 37            [ 3] 4558         pshb
   A64E C6 1E         [ 2] 4559         ldab    #0x1E
   A650 BD A6 8F      [ 6] 4560         jsr     LA652
   A653 33            [ 4] 4561         pulb
   A654 86 00         [ 2] 4562         ldaa    #0x00
   A656 A7 00         [ 4] 4563         staa    0,X     
   A658 A7 02         [ 4] 4564         staa    2,X     
   A65A 5C            [ 2] 4565         incb
   A65B 3C            [ 4] 4566         pshx
   A65C BD FA C9      [ 6] 4567         jsr     DIAGDGT         ; write digit to the diag display
   A65F 37            [ 3] 4568         pshb
   A660 C6 27         [ 2] 4569         ldab    #0x27
   A662 32            [ 4] 4570         pula
   A663 36            [ 3] 4571         psha
   A664 0C            [ 2] 4572         clc
   A665 89 30         [ 2] 4573         adca    #0x30
   A667 BD 8D C5      [ 6] 4574         jsr     L8DB5           ; display char here on LCD display
   A66A 33            [ 4] 4575         pulb
   A66B 38            [ 5] 4576         pulx
   A66C 08            [ 3] 4577         inx
   A66D 08            [ 3] 4578         inx
   A66E 08            [ 3] 4579         inx
   A66F 08            [ 3] 4580         inx
   A670 8C 10 9D      [ 4] 4581         cpx     #0x109D
   A673 25 D2         [ 3] 4582         bcs     LA60A  
   A675 CE 10 80      [ 3] 4583         ldx     #0x1080
   A678                    4584 LA63B:
   A678 86 FF         [ 2] 4585         ldaa    #0xFF
   A67A A7 00         [ 4] 4586         staa    0,X     
   A67C A7 02         [ 4] 4587         staa    2,X     
   A67E 08            [ 3] 4588         inx
   A67F 08            [ 3] 4589         inx
   A680 08            [ 3] 4590         inx
   A681 08            [ 3] 4591         inx
   A682 8C 10 9D      [ 4] 4592         cpx     #0x109D
   A685 25 F1         [ 3] 4593         bcs     LA63B  
   A687 C6 06         [ 2] 4594         ldab    #0x06
   A689 BD 8C 40      [ 6] 4595         jsr     DLYSECSBY2      ; delay 3 sec
   A68C 7E A5 A2      [ 3] 4596         jmp     LA565
   A68F                    4597 LA652:
   A68F 36            [ 3] 4598         psha
   A690 4F            [ 2] 4599         clra
   A691 DD 23         [ 4] 4600         std     CDTIMR5
   A693                    4601 LA656:
   A693 7D 00 24      [ 6] 4602         tst     CDTIMR5+1
   A696 26 FB         [ 3] 4603         bne     LA656  
   A698 32            [ 4] 4604         pula
   A699 39            [ 5] 4605         rts
                           4606 
                           4607 ; Comma-seperated text
   A69A                    4608 LA65D:
   A69A 30 2C 43 68 75 63  4609         .ascii  '0,Chuck,Mouth,'
        6B 2C 4D 6F 75 74
        68 2C
   A6A8 31 2C 48 65 61 64  4610         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A6B4 32 2C 48 65 61 64  4611         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A6C1 32 2C 48 65 61 64  4612         .ascii  '2,Head up,'
        20 75 70 2C
   A6CB 32 2C 45 79 65 73  4613         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A6D8 31 2C 45 79 65 6C  4614         .ascii  '1,Eyelids,'
        69 64 73 2C
   A6E2 31 2C 52 69 67 68  4615         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A6EF 32 2C 45 79 65 73  4616         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A6FB 31 2C 38 2C 48 65  4617         .ascii  '1,8,Helen,Mouth,'
        6C 65 6E 2C 4D 6F
        75 74 68 2C
   A70B 31 2C 48 65 61 64  4618         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A717 32 2C 48 65 61 64  4619         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A724 32 2C 48 65 61 64  4620         .ascii  '2,Head up,'
        20 75 70 2C
   A72E 32 2C 45 79 65 73  4621         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A73B 31 2C 45 79 65 6C  4622         .ascii  '1,Eyelids,'
        69 64 73 2C
   A745 31 2C 52 69 67 68  4623         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A752 32 2C 45 79 65 73  4624         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A75E 31 2C 36 2C 4D 75  4625         .ascii  '1,6,Munch,Mouth,'
        6E 63 68 2C 4D 6F
        75 74 68 2C
   A76E 31 2C 48 65 61 64  4626         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A77A 32 2C 48 65 61 64  4627         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A787 32 2C 4C 65 66 74  4628         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A792 32 2C 45 79 65 73  4629         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A79F 31 2C 45 79 65 6C  4630         .ascii  '1,Eyelids,'
        69 64 73 2C
   A7A9 31 2C 52 69 67 68  4631         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A7B5 32 2C 45 79 65 73  4632         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A7C1 31 2C 32 2C 4A 61  4633         .ascii  '1,2,Jasper,Mouth,'
        73 70 65 72 2C 4D
        6F 75 74 68 2C
   A7D2 31 2C 48 65 61 64  4634         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A7DE 32 2C 48 65 61 64  4635         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A7EB 32 2C 48 65 61 64  4636         .ascii  '2,Head up,'
        20 75 70 2C
   A7F5 32 2C 45 79 65 73  4637         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A802 31 2C 45 79 65 6C  4638         .ascii  '1,Eyelids,'
        69 64 73 2C
   A80C 31 2C 48 61 6E 64  4639         .ascii  '1,Hands,'
        73 2C
   A814 32 2C 45 79 65 73  4640         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A820 31 2C 34 2C 50 61  4641         .ascii  '1,4,Pasqually,Mouth-Mustache,'
        73 71 75 61 6C 6C
        79 2C 4D 6F 75 74
        68 2D 4D 75 73 74
        61 63 68 65 2C
   A83D 31 2C 48 65 61 64  4642         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A849 32 2C 48 65 61 64  4643         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A856 32 2C 4C 65 66 74  4644         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A861 32 2C 45 79 65 73  4645         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A86E 31 2C 45 79 65 6C  4646         .ascii  '1,Eyelids,'
        69 64 73 2C
   A878 31 2C 52 69 67 68  4647         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A884 32 2C 45 79 65 73  4648         .ascii  '2,Eyes left,1,'
        20 6C 65 66 74 2C
        31 2C
                           4649 
   A892                    4650 LA855:
   A892 3C            [ 4] 4651         pshx
   A893 BD 86 D4      [ 6] 4652         jsr     L86C4           ; Reset boards 1-10
   A896 CE 10 80      [ 3] 4653         ldx     #0x1080
   A899 86 20         [ 2] 4654         ldaa    #0x20
   A89B A7 00         [ 4] 4655         staa    0,X
   A89D A7 04         [ 4] 4656         staa    4,X
   A89F A7 08         [ 4] 4657         staa    8,X
   A8A1 A7 0C         [ 4] 4658         staa    12,X
   A8A3 A7 10         [ 4] 4659         staa    16,X
   A8A5 38            [ 5] 4660         pulx
   A8A6 39            [ 5] 4661         rts
                           4662 
   A8A7                    4663 LA86A:
   A8A7 BD A3 6B      [ 6] 4664         jsr     LA32E
                           4665 
   A8AA BD 8D F4      [ 6] 4666         jsr     LCDMSG1 
   A8AD 20 20 20 20 57 61  4667         .ascis  '    Warm-Up  '
        72 6D 2D 55 70 20
        A0
                           4668 
   A8BA BD 8D ED      [ 6] 4669         jsr     LCDMSG2 
   A8BD 43 75 72 74 61 69  4670         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           4671 
   A8CD C6 14         [ 2] 4672         ldab    #0x14
   A8CF BD 8C 40      [ 6] 4673         jsr     DLYSECSBY2      ; delay 10 sec
   A8D2                    4674 LA895:
   A8D2 BD A8 92      [ 6] 4675         jsr     LA855
   A8D5 C6 02         [ 2] 4676         ldab    #0x02
   A8D7 BD 8C 40      [ 6] 4677         jsr     DLYSECSBY2      ; delay 1 sec
   A8DA CE A6 9A      [ 3] 4678         ldx     #LA65D
   A8DD C6 05         [ 2] 4679         ldab    #0x05
   A8DF D7 12         [ 3] 4680         stab    (0x0012)
   A8E1                    4681 LA8A4:
   A8E1 C6 08         [ 2] 4682         ldab    #0x08
   A8E3 D7 13         [ 3] 4683         stab    (0x0013)
   A8E5 BD A9 7E      [ 6] 4684         jsr     LA941
   A8E8 BD A9 89      [ 6] 4685         jsr     LA94C
   A8EB C6 02         [ 2] 4686         ldab    #0x02
   A8ED BD 8C 40      [ 6] 4687         jsr     DLYSECSBY2      ; delay 1 sec
   A8F0                    4688 LA8B3:
   A8F0 BD A9 9B      [ 6] 4689         jsr     LA95E
   A8F3 A6 00         [ 4] 4690         ldaa    0,X     
   A8F5 80 30         [ 2] 4691         suba    #0x30
   A8F7 08            [ 3] 4692         inx
   A8F8 08            [ 3] 4693         inx
   A8F9 36            [ 3] 4694         psha
   A8FA 7C 00 4C      [ 6] 4695         inc     (0x004C)
   A8FD 3C            [ 4] 4696         pshx
   A8FE BD 88 F5      [ 6] 4697         jsr     L88E5
   A901 38            [ 5] 4698         pulx
   A902 86 4F         [ 2] 4699         ldaa    #0x4F           ;'O'
   A904 C6 0C         [ 2] 4700         ldab    #0x0C
   A906 BD 8D C5      [ 6] 4701         jsr     L8DB5           ; display char here on LCD display
   A909 86 6E         [ 2] 4702         ldaa    #0x6E           ;'n'
   A90B C6 0D         [ 2] 4703         ldab    #0x0D
   A90D BD 8D C5      [ 6] 4704         jsr     L8DB5           ; display char here on LCD display
   A910 CC 20 0E      [ 3] 4705         ldd     #0x200E         ;' '
   A913 BD 8D C5      [ 6] 4706         jsr     L8DB5           ; display char here on LCD display
   A916 7A 00 4C      [ 6] 4707         dec     (0x004C)
   A919 32            [ 4] 4708         pula
   A91A 36            [ 3] 4709         psha
   A91B C6 64         [ 2] 4710         ldab    #0x64
   A91D 3D            [10] 4711         mul
   A91E DD 23         [ 4] 4712         std     CDTIMR5
   A920                    4713 LA8E3:
   A920 DC 23         [ 4] 4714         ldd     CDTIMR5
   A922 26 FC         [ 3] 4715         bne     LA8E3  
   A924 BD 8E A5      [ 6] 4716         jsr     L8E95
   A927 81 0D         [ 2] 4717         cmpa    #0x0D
   A929 26 05         [ 3] 4718         bne     LA8F3  
   A92B BD A9 B2      [ 6] 4719         jsr     LA975           ; Wait for SCD Keypress
   A92E 20 10         [ 3] 4720         bra     LA903  
   A930                    4721 LA8F3:
   A930 81 01         [ 2] 4722         cmpa    #0x01
   A932 26 04         [ 3] 4723         bne     LA8FB  
   A934 32            [ 4] 4724         pula
   A935 7E A8 D2      [ 3] 4725         jmp     LA895
   A938                    4726 LA8FB:
   A938 81 02         [ 2] 4727         cmpa    #0x02
   A93A 26 04         [ 3] 4728         bne     LA903  
   A93C 32            [ 4] 4729         pula
   A93D 7E A9 72      [ 3] 4730         jmp     LA935
   A940                    4731 LA903:
   A940 3C            [ 4] 4732         pshx
   A941 BD 88 F5      [ 6] 4733         jsr     L88E5
   A944 38            [ 5] 4734         pulx
   A945 86 66         [ 2] 4735         ldaa    #0x66           ;'f'
   A947 C6 0D         [ 2] 4736         ldab    #0x0D
   A949 BD 8D C5      [ 6] 4737         jsr     L8DB5           ; display char here on LCD display
   A94C 86 66         [ 2] 4738         ldaa    #0x66           ;'f'
   A94E C6 0E         [ 2] 4739         ldab    #0x0E
   A950 BD 8D C5      [ 6] 4740         jsr     L8DB5           ; display char here on LCD display
   A953 32            [ 4] 4741         pula
   A954 C6 64         [ 2] 4742         ldab    #0x64
   A956 3D            [10] 4743         mul
   A957 DD 23         [ 4] 4744         std     CDTIMR5
   A959                    4745 LA91C:
   A959 DC 23         [ 4] 4746         ldd     CDTIMR5
   A95B 26 FC         [ 3] 4747         bne     LA91C  
   A95D BD A8 92      [ 6] 4748         jsr     LA855
   A960 7C 00 4B      [ 6] 4749         inc     (0x004B)
   A963 96 4B         [ 3] 4750         ldaa    (0x004B)
   A965 81 48         [ 2] 4751         cmpa    #0x48
   A967 25 87         [ 3] 4752         bcs     LA8B3  
   A969 96 4C         [ 3] 4753         ldaa    (0x004C)
   A96B 81 34         [ 2] 4754         cmpa    #0x34
   A96D 27 03         [ 3] 4755         beq     LA935  
   A96F 7E A8 E1      [ 3] 4756         jmp     LA8A4
   A972                    4757 LA935:
   A972 C6 02         [ 2] 4758         ldab    #0x02
   A974 BD 8C 40      [ 6] 4759         jsr     DLYSECSBY2      ; delay 1 sec
   A977 BD 86 D4      [ 6] 4760         jsr     L86C4           ; Reset boards 1-10
   A97A BD A3 7E      [ 6] 4761         jsr     LA341
   A97D 39            [ 5] 4762         rts
                           4763 
   A97E                    4764 LA941:
   A97E A6 00         [ 4] 4765         ldaa    0,X     
   A980 08            [ 3] 4766         inx
   A981 08            [ 3] 4767         inx
   A982 97 4C         [ 3] 4768         staa    (0x004C)
   A984 86 40         [ 2] 4769         ldaa    #0x40
   A986 97 4B         [ 3] 4770         staa    (0x004B)
   A988 39            [ 5] 4771         rts
                           4772 
   A989                    4773 LA94C:
   A989 BD 8D 02      [ 6] 4774         jsr     L8CF2
   A98C                    4775 LA94F:
   A98C A6 00         [ 4] 4776         ldaa    0,X     
   A98E 08            [ 3] 4777         inx
   A98F 81 2C         [ 2] 4778         cmpa    #0x2C
   A991 27 07         [ 3] 4779         beq     LA95D  
   A993 36            [ 3] 4780         psha
   A994 BD 8E 80      [ 6] 4781         jsr     L8E70
   A997 32            [ 4] 4782         pula
   A998 20 F2         [ 3] 4783         bra     LA94F  
   A99A                    4784 LA95D:
   A99A 39            [ 5] 4785         rts
                           4786 
   A99B                    4787 LA95E:
   A99B BD 8D 13      [ 6] 4788         jsr     L8D03
   A99E 86 C0         [ 2] 4789         ldaa    #0xC0
   A9A0 BD 8E 5B      [ 6] 4790         jsr     L8E4B
   A9A3                    4791 LA966:
   A9A3 A6 00         [ 4] 4792         ldaa    0,X     
   A9A5 08            [ 3] 4793         inx
   A9A6 81 2C         [ 2] 4794         cmpa    #0x2C
   A9A8 27 07         [ 3] 4795         beq     LA974  
   A9AA 36            [ 3] 4796         psha
   A9AB BD 8E 80      [ 6] 4797         jsr     L8E70
   A9AE 32            [ 4] 4798         pula
   A9AF 20 F2         [ 3] 4799         bra     LA966  
   A9B1                    4800 LA974:
   A9B1 39            [ 5] 4801         rts
                           4802 
                           4803 ; Wait for SCD Keypress
   A9B2                    4804 LA975:
   A9B2 BD 8E A5      [ 6] 4805         jsr     L8E95
   A9B5 4D            [ 2] 4806         tsta
   A9B6 27 FA         [ 3] 4807         beq     LA975  
   A9B8 39            [ 5] 4808         rts
                           4809 
   A9B9                    4810 LA97C:
   A9B9 7F 00 60      [ 6] 4811         clr     (0x0060)
   A9BC FC 02 9C      [ 5] 4812         ldd     (0x029C)
   A9BF 1A 83 00 01   [ 5] 4813         cpd     #0x0001
   A9C3 27 0C         [ 3] 4814         beq     LA994  
   A9C5 1A 83 03 E8   [ 5] 4815         cpd     #0x03E8
   A9C9 2D 7D         [ 3] 4816         blt     LAA0B  
   A9CB 1A 83 04 4B   [ 5] 4817         cpd     #0x044B
   A9CF 22 77         [ 3] 4818         bhi     LAA0B  
   A9D1                    4819 LA994:
   A9D1 C6 40         [ 2] 4820         ldab    #0x40
   A9D3 D7 62         [ 3] 4821         stab    (0x0062)
   A9D5 BD FA F9      [ 6] 4822         jsr     BUTNLIT 
   A9D8 C6 64         [ 2] 4823         ldab    #0x64           ; delay 1 sec
   A9DA BD 8C 32      [ 6] 4824         jsr     DLYSECSBY100
   A9DD BD 86 D4      [ 6] 4825         jsr     L86C4           ; Reset boards 1-10
   A9E0 BD 8C F9      [ 6] 4826         jsr     L8CE9
                           4827 
   A9E3 BD 8D F4      [ 6] 4828         jsr     LCDMSG1 
   A9E6 20 20 20 20 20 53  4829         .ascis  '     STUDIO'
        54 55 44 49 CF
                           4830 
   A9F1 BD 8D ED      [ 6] 4831         jsr     LCDMSG2 
   A9F4 70 72 6F 67 72 61  4832         .ascis  'programming mode'
        6D 6D 69 6E 67 20
        6D 6F 64 E5
                           4833 
   AA04 BD A3 6B      [ 6] 4834         jsr     LA32E
   AA07 BD 99 AE      [ 6] 4835         jsr     L999E
   AA0A BD 99 C1      [ 6] 4836         jsr     L99B1
   AA0D CE 20 00      [ 3] 4837         ldx     #0x2000
   AA10                    4838 LA9D3:
   AA10 18 CE 00 C0   [ 4] 4839         ldy     #0x00C0
   AA14                    4840 LA9D7:
   AA14 18 09         [ 4] 4841         dey
   AA16 26 0A         [ 3] 4842         bne     LA9E5  
   AA18 BD AA 31      [ 6] 4843         jsr     LA9F4
   AA1B 96 60         [ 3] 4844         ldaa    (0x0060)
   AA1D 26 29         [ 3] 4845         bne     LAA0B  
   AA1F CE 20 00      [ 3] 4846         ldx     #0x2000
   AA22                    4847 LA9E5:
   AA22 B6 10 A8      [ 4] 4848         ldaa    (0x10A8)
   AA25 84 01         [ 2] 4849         anda    #0x01
   AA27 27 EB         [ 3] 4850         beq     LA9D7  
   AA29 B6 10 A9      [ 4] 4851         ldaa    (0x10A9)
   AA2C A7 00         [ 4] 4852         staa    0,X     
   AA2E 08            [ 3] 4853         inx
   AA2F 20 DF         [ 3] 4854         bra     LA9D3
                           4855 
   AA31                    4856 LA9F4:
   AA31 CE 20 00      [ 3] 4857         ldx     #0x2000
   AA34 18 CE 10 80   [ 4] 4858         ldy     #0x1080
   AA38                    4859 LA9FB:
   AA38 A6 00         [ 4] 4860         ldaa    0,X     
   AA3A 18 A7 00      [ 5] 4861         staa    0,Y     
   AA3D 08            [ 3] 4862         inx
   AA3E 18 08         [ 4] 4863         iny
   AA40 18 08         [ 4] 4864         iny
   AA42 8C 20 10      [ 4] 4865         cpx     #0x2010
   AA45 25 F1         [ 3] 4866         bcs     LA9FB  
   AA47 39            [ 5] 4867         rts
   AA48                    4868 LAA0B:
   AA48 39            [ 5] 4869         rts
                           4870 
   AA49                    4871 LAA0C:
   AA49 CC 48 37      [ 3] 4872         ldd     #0x4837         ;'H'
   AA4C                    4873 LAA0F:
   AA4C BD 8D C5      [ 6] 4874         jsr     L8DB5           ; display char here on LCD display
   AA4F 39            [ 5] 4875         rts
                           4876 
   AA50                    4877 LAA13:
   AA50 CC 20 37      [ 3] 4878         ldd     #0x2037         ;' '
   AA53 20 F7         [ 3] 4879         bra     LAA0F
                           4880 
   AA55                    4881 LAA18:
   AA55 CC 42 0F      [ 3] 4882         ldd     #0x420F         ;'B'
   AA58 20 F2         [ 3] 4883         bra     LAA0F
                           4884 
   AA5A                    4885 LAA1D:
   AA5A CC 20 0F      [ 3] 4886         ldd     #0x200F         ;' '
   AA5D 20 ED         [ 3] 4887         bra     LAA0F
                           4888 
   AA5F                    4889 LAA22: 
   AA5F 7F 00 4F      [ 6] 4890         clr     (0x004F)
   AA62 CC 00 01      [ 3] 4891         ldd     #0x0001
   AA65 DD 1B         [ 4] 4892         std     CDTIMR1
   AA67 CE 20 00      [ 3] 4893         ldx     #0x2000
   AA6A                    4894 LAA2D:
   AA6A B6 10 A8      [ 4] 4895         ldaa    (0x10A8)
   AA6D 84 01         [ 2] 4896         anda    #0x01
   AA6F 27 F9         [ 3] 4897         beq     LAA2D  
   AA71 DC 1B         [ 4] 4898         ldd     CDTIMR1
   AA73 0F            [ 2] 4899         sei
   AA74 26 03         [ 3] 4900         bne     LAA3C  
   AA76 CE 20 00      [ 3] 4901         ldx     #0x2000
   AA79                    4902 LAA3C:
   AA79 B6 10 A9      [ 4] 4903         ldaa    (0x10A9)
   AA7C A7 00         [ 4] 4904         staa    0,X     
   AA7E 0E            [ 2] 4905         cli
   AA7F BD FA A3      [ 6] 4906         jsr     SERIALW      
   AA82 08            [ 3] 4907         inx
   AA83 7F 00 4F      [ 6] 4908         clr     (0x004F)
   AA86 CC 00 01      [ 3] 4909         ldd     #0x0001
   AA89 DD 1B         [ 4] 4910         std     CDTIMR1
   AA8B 8C 20 23      [ 4] 4911         cpx     #0x2023
   AA8E 26 DA         [ 3] 4912         bne     LAA2D  
   AA90 CE 20 00      [ 3] 4913         ldx     #0x2000
   AA93 7F 00 B7      [ 6] 4914         clr     (0x00B7)
   AA96                    4915 LAA59:
   AA96 A6 00         [ 4] 4916         ldaa    0,X     
   AA98 9B B7         [ 3] 4917         adda    (0x00B7)
   AA9A 97 B7         [ 3] 4918         staa    (0x00B7)
   AA9C 08            [ 3] 4919         inx
   AA9D 8C 20 22      [ 4] 4920         cpx     #0x2022
   AAA0 25 F4         [ 3] 4921         bcs     LAA59  
   AAA2 96 B7         [ 3] 4922         ldaa    (0x00B7)
   AAA4 88 FF         [ 2] 4923         eora    #0xFF
   AAA6 A1 00         [ 4] 4924         cmpa    0,X     
   AAA8 CE 20 00      [ 3] 4925         ldx     #0x2000
   AAAB A6 20         [ 4] 4926         ldaa    0x20,X
   AAAD 2B 03         [ 3] 4927         bmi     LAA75  
   AAAF 7E AA 5F      [ 3] 4928         jmp     LAA22
   AAB2                    4929 LAA75:
   AAB2 A6 00         [ 4] 4930         ldaa    0,X     
   AAB4 B7 10 80      [ 4] 4931         staa    (0x1080)
   AAB7 08            [ 3] 4932         inx
   AAB8 A6 00         [ 4] 4933         ldaa    0,X     
   AABA B7 10 82      [ 4] 4934         staa    (0x1082)
   AABD 08            [ 3] 4935         inx
   AABE A6 00         [ 4] 4936         ldaa    0,X     
   AAC0 B7 10 84      [ 4] 4937         staa    (0x1084)
   AAC3 08            [ 3] 4938         inx
   AAC4 A6 00         [ 4] 4939         ldaa    0,X     
   AAC6 B7 10 86      [ 4] 4940         staa    (0x1086)
   AAC9 08            [ 3] 4941         inx
   AACA A6 00         [ 4] 4942         ldaa    0,X     
   AACC B7 10 88      [ 4] 4943         staa    (0x1088)
   AACF 08            [ 3] 4944         inx
   AAD0 A6 00         [ 4] 4945         ldaa    0,X     
   AAD2 B7 10 8A      [ 4] 4946         staa    (0x108A)
   AAD5 08            [ 3] 4947         inx
   AAD6 A6 00         [ 4] 4948         ldaa    0,X     
   AAD8 B7 10 8C      [ 4] 4949         staa    (0x108C)
   AADB 08            [ 3] 4950         inx
   AADC A6 00         [ 4] 4951         ldaa    0,X     
   AADE B7 10 8E      [ 4] 4952         staa    (0x108E)
   AAE1 08            [ 3] 4953         inx
   AAE2 A6 00         [ 4] 4954         ldaa    0,X     
   AAE4 B7 10 90      [ 4] 4955         staa    (0x1090)
   AAE7 08            [ 3] 4956         inx
   AAE8 A6 00         [ 4] 4957         ldaa    0,X     
   AAEA B7 10 92      [ 4] 4958         staa    (0x1092)
   AAED 08            [ 3] 4959         inx
   AAEE A6 00         [ 4] 4960         ldaa    0,X     
   AAF0 8A 80         [ 2] 4961         oraa    #0x80
   AAF2 B7 10 94      [ 4] 4962         staa    (0x1094)
   AAF5 08            [ 3] 4963         inx
   AAF6 A6 00         [ 4] 4964         ldaa    0,X     
   AAF8 8A 01         [ 2] 4965         oraa    #0x01
   AAFA B7 10 96      [ 4] 4966         staa    (0x1096)
   AAFD 08            [ 3] 4967         inx
   AAFE A6 00         [ 4] 4968         ldaa    0,X     
   AB00 B7 10 98      [ 4] 4969         staa    (0x1098)
   AB03 08            [ 3] 4970         inx
   AB04 A6 00         [ 4] 4971         ldaa    0,X     
   AB06 B7 10 9A      [ 4] 4972         staa    (0x109A)
   AB09 08            [ 3] 4973         inx
   AB0A A6 00         [ 4] 4974         ldaa    0,X     
   AB0C B7 10 9C      [ 4] 4975         staa    (0x109C)
   AB0F 08            [ 3] 4976         inx
   AB10 A6 00         [ 4] 4977         ldaa    0,X     
   AB12 B7 10 9E      [ 4] 4978         staa    (0x109E)
   AB15 7E AA 5F      [ 3] 4979         jmp     LAA22
                           4980 
   AB18                    4981 LAADB:
   AB18 7F 10 98      [ 6] 4982         clr     (0x1098)
   AB1B 7F 10 9A      [ 6] 4983         clr     (0x109A)
   AB1E 7F 10 9C      [ 6] 4984         clr     (0x109C)
   AB21 7F 10 9E      [ 6] 4985         clr     (0x109E)
   AB24 39            [ 5] 4986         rts
   AB25                    4987 LAAE8:
   AB25 CE 04 2C      [ 3] 4988         ldx     #0x042C
   AB28 C6 10         [ 2] 4989         ldab    #0x10
   AB2A                    4990 LAAED:
   AB2A 5D            [ 2] 4991         tstb
   AB2B 27 12         [ 3] 4992         beq     LAB02  
   AB2D A6 00         [ 4] 4993         ldaa    0,X     
   AB2F 81 30         [ 2] 4994         cmpa    #0x30
   AB31 25 0D         [ 3] 4995         bcs     LAB03  
   AB33 81 39         [ 2] 4996         cmpa    #0x39
   AB35 22 09         [ 3] 4997         bhi     LAB03  
   AB37 08            [ 3] 4998         inx
   AB38 08            [ 3] 4999         inx
   AB39 08            [ 3] 5000         inx
   AB3A 8C 04 59      [ 4] 5001         cpx     #0x0459
   AB3D 23 EB         [ 3] 5002         bls     LAAED  
   AB3F                    5003 LAB02:
   AB3F 39            [ 5] 5004         rts
                           5005 
   AB40                    5006 LAB03:
   AB40 5A            [ 2] 5007         decb
   AB41 3C            [ 4] 5008         pshx
   AB42                    5009 LAB05:
   AB42 A6 03         [ 4] 5010         ldaa    3,X     
   AB44 A7 00         [ 4] 5011         staa    0,X     
   AB46 08            [ 3] 5012         inx
   AB47 8C 04 5C      [ 4] 5013         cpx     #0x045C
   AB4A 25 F6         [ 3] 5014         bcs     LAB05  
   AB4C 86 FF         [ 2] 5015         ldaa    #0xFF
   AB4E B7 04 59      [ 4] 5016         staa    (0x0459)
   AB51 38            [ 5] 5017         pulx
   AB52 20 D6         [ 3] 5018         bra     LAAED
                           5019 
                           5020 ; erase revalid tape section in EEPROM
   AB54                    5021 LAB17:
   AB54 CE 04 2C      [ 3] 5022         ldx     #0x042C
   AB57 86 FF         [ 2] 5023         ldaa    #0xFF
   AB59                    5024 LAB1C:
   AB59 A7 00         [ 4] 5025         staa    0,X     
   AB5B 08            [ 3] 5026         inx
   AB5C 8C 04 5C      [ 4] 5027         cpx     #0x045C
   AB5F 25 F8         [ 3] 5028         bcs     LAB1C
   AB61 39            [ 5] 5029         rts
                           5030 
   AB62                    5031 LAB25:
   AB62 CE 04 2C      [ 3] 5032         ldx     #0x042C
   AB65                    5033 LAB28:
   AB65 A6 00         [ 4] 5034         ldaa    0,X     
   AB67 81 30         [ 2] 5035         cmpa    #0x30
   AB69 25 17         [ 3] 5036         bcs     LAB45  
   AB6B 81 39         [ 2] 5037         cmpa    #0x39
   AB6D 22 13         [ 3] 5038         bhi     LAB45  
   AB6F 08            [ 3] 5039         inx
   AB70 08            [ 3] 5040         inx
   AB71 08            [ 3] 5041         inx
   AB72 8C 04 5C      [ 4] 5042         cpx     #0x045C
   AB75 25 EE         [ 3] 5043         bcs     LAB28  
   AB77 86 FF         [ 2] 5044         ldaa    #0xFF
   AB79 B7 04 2C      [ 4] 5045         staa    (0x042C)
   AB7C BD AB 25      [ 6] 5046         jsr     LAAE8
   AB7F CE 04 59      [ 3] 5047         ldx     #0x0459
   AB82                    5048 LAB45:
   AB82 39            [ 5] 5049         rts
                           5050 
   AB83                    5051 LAB46:
   AB83 B6 02 99      [ 4] 5052         ldaa    (0x0299)
   AB86 A7 00         [ 4] 5053         staa    0,X     
   AB88 B6 02 9A      [ 4] 5054         ldaa    (0x029A)
   AB8B A7 01         [ 4] 5055         staa    1,X     
   AB8D B6 02 9B      [ 4] 5056         ldaa    (0x029B)
   AB90 A7 02         [ 4] 5057         staa    2,X     
   AB92 39            [ 5] 5058         rts
                           5059 
   AB93                    5060 LAB56:
   AB93 CE 04 2C      [ 3] 5061         ldx     #0x042C
   AB96                    5062 LAB59:
   AB96 B6 02 99      [ 4] 5063         ldaa    (0x0299)
   AB99 A1 00         [ 4] 5064         cmpa    0,X     
   AB9B 26 10         [ 3] 5065         bne     LAB70  
   AB9D B6 02 9A      [ 4] 5066         ldaa    (0x029A)
   ABA0 A1 01         [ 4] 5067         cmpa    1,X     
   ABA2 26 09         [ 3] 5068         bne     LAB70  
   ABA4 B6 02 9B      [ 4] 5069         ldaa    (0x029B)
   ABA7 A1 02         [ 4] 5070         cmpa    2,X     
   ABA9 26 02         [ 3] 5071         bne     LAB70  
   ABAB 20 0A         [ 3] 5072         bra     LAB7A  
   ABAD                    5073 LAB70:
   ABAD 08            [ 3] 5074         inx
   ABAE 08            [ 3] 5075         inx
   ABAF 08            [ 3] 5076         inx
   ABB0 8C 04 5C      [ 4] 5077         cpx     #0x045C
   ABB3 25 E1         [ 3] 5078         bcs     LAB59  
   ABB5 0D            [ 2] 5079         sec
   ABB6 39            [ 5] 5080         rts
                           5081 
   ABB7                    5082 LAB7A:
   ABB7 0C            [ 2] 5083         clc
   ABB8 39            [ 5] 5084         rts
                           5085 
                           5086 ;show re-valid tapes
   ABB9                    5087 LAB7C:
   ABB9 CE 04 2C      [ 3] 5088         ldx     #0x042C
   ABBC                    5089 LAB7F:
   ABBC A6 00         [ 4] 5090         ldaa    0,X     
   ABBE 81 30         [ 2] 5091         cmpa    #0x30
   ABC0 25 1E         [ 3] 5092         bcs     LABA3  
   ABC2 81 39         [ 2] 5093         cmpa    #0x39
   ABC4 22 1A         [ 3] 5094         bhi     LABA3  
   ABC6 BD FA A3      [ 6] 5095         jsr     SERIALW      
   ABC9 08            [ 3] 5096         inx
   ABCA A6 00         [ 4] 5097         ldaa    0,X     
   ABCC BD FA A3      [ 6] 5098         jsr     SERIALW      
   ABCF 08            [ 3] 5099         inx
   ABD0 A6 00         [ 4] 5100         ldaa    0,X     
   ABD2 BD FA A3      [ 6] 5101         jsr     SERIALW      
   ABD5 08            [ 3] 5102         inx
   ABD6 86 20         [ 2] 5103         ldaa    #0x20
   ABD8 BD FA A3      [ 6] 5104         jsr     SERIALW      
   ABDB 8C 04 5C      [ 4] 5105         cpx     #0x045C
   ABDE 25 DC         [ 3] 5106         bcs     LAB7F  
   ABE0                    5107 LABA3:
   ABE0 86 0D         [ 2] 5108         ldaa    #0x0D
   ABE2 BD FA A3      [ 6] 5109         jsr     SERIALW      
   ABE5 86 0A         [ 2] 5110         ldaa    #0x0A
   ABE7 BD FA A3      [ 6] 5111         jsr     SERIALW      
   ABEA 39            [ 5] 5112         rts
                           5113 
   ABEB                    5114 LABAE:
   ABEB 7F 00 4A      [ 6] 5115         clr     (0x004A)
   ABEE CC 00 64      [ 3] 5116         ldd     #0x0064
   ABF1 DD 23         [ 4] 5117         std     CDTIMR5
   ABF3                    5118 LABB6:
   ABF3 96 4A         [ 3] 5119         ldaa    (0x004A)
   ABF5 26 08         [ 3] 5120         bne     LABC2  
   ABF7 BD 9B 29      [ 6] 5121         jsr     L9B19           ; do the random motions if enabled
   ABFA DC 23         [ 4] 5122         ldd     CDTIMR5
   ABFC 26 F5         [ 3] 5123         bne     LABB6  
   ABFE                    5124 LABC1:
   ABFE 39            [ 5] 5125         rts
                           5126 
   ABFF                    5127 LABC2:
   ABFF 81 31         [ 2] 5128         cmpa    #0x31
   AC01 26 04         [ 3] 5129         bne     LABCA  
   AC03 BD AB 54      [ 6] 5130         jsr     LAB17
   AC06 39            [ 5] 5131         rts
                           5132 
   AC07                    5133 LABCA:
   AC07 20 F5         [ 3] 5134         bra     LABC1  
                           5135 
                           5136 ; TOC1 timer handler
                           5137 ;
                           5138 ; Timer is running at:
                           5139 ; EXTAL = 16Mhz
                           5140 ; E Clk = 4Mhz
                           5141 ; Timer Prescaler = /16 = 250Khz
                           5142 ; Timer Period = 4us
                           5143 ; T1OC is set to previous value +625
                           5144 ; So, this routine is called every 2.5ms
                           5145 ;
   AC09                    5146 LABCC:
   AC09 DC 10         [ 4] 5147         ldd     T1NXT           ; get ready for next time
   AC0B C3 02 71      [ 4] 5148         addd    #0x0271         ; add 625
   AC0E FD 10 16      [ 5] 5149         std     TOC1  
   AC11 DD 10         [ 4] 5150         std     T1NXT
                           5151 
   AC13 86 80         [ 2] 5152         ldaa    #0x80
   AC15 B7 10 23      [ 4] 5153         staa    TFLG1           ; clear timer1 flag
                           5154 
                           5155 ; Some blinking SPECIAL button every half second,
                           5156 ; if 0x0078 is non zero
                           5157 
   AC18 7D 00 78      [ 6] 5158         tst     (0x0078)        ; if 78 is zero, skip ahead
   AC1B 27 1C         [ 3] 5159         beq     LABFC           ; else do some blinking button lights
   AC1D DC 25         [ 4] 5160         ldd     (0x0025)        ; else inc 25/26
   AC1F C3 00 01      [ 4] 5161         addd    #0x0001
   AC22 DD 25         [ 4] 5162         std     (0x0025)
   AC24 1A 83 00 C8   [ 5] 5163         cpd     #0x00C8         ; is it 200?
   AC28 26 0F         [ 3] 5164         bne     LABFC           ; no, keep going
   AC2A 7F 00 25      [ 6] 5165         clr     (0x0025)        ; reset 25/26
   AC2D 7F 00 26      [ 6] 5166         clr     (0x0026)
   AC30 D6 62         [ 3] 5167         ldab    (0x0062)        ; and toggle bit 3 of 62
   AC32 C8 08         [ 2] 5168         eorb    #0x08
   AC34 D7 62         [ 3] 5169         stab    (0x0062)
   AC36 BD FA F9      [ 6] 5170         jsr     BUTNLIT         ; and toggle the "special" button light
                           5171 
                           5172 ; 
   AC39                    5173 LABFC:
   AC39 7C 00 6F      [ 6] 5174         inc     (0x006F)        ; count every 2.5ms
   AC3C 96 6F         [ 3] 5175         ldaa    (0x006F)
   AC3E 81 28         [ 2] 5176         cmpa    #0x28           ; is it 40 intervals? (0.1 sec?)
   AC40 25 42         [ 3] 5177         bcs     LAC47           ; if not yet, jump ahead
   AC42 7F 00 6F      [ 6] 5178         clr     (0x006F)        ; clear it 2.5ms counter
   AC45 7D 00 63      [ 6] 5179         tst     (0x0063)        ; decrement 0.1s counter here
   AC48 27 03         [ 3] 5180         beq     LAC10           ; if it's not already zero
   AC4A 7A 00 63      [ 6] 5181         dec     (0x0063)
                           5182 
                           5183 ; staggered counters - here every 100ms
                           5184 
                           5185 ; 0x0070 counts from 250 to 1, period is 25 secs
   AC4D                    5186 LAC10:
   AC4D 96 70         [ 3] 5187         ldaa    OFFCNT1         ; decrement 0.1s counter here
   AC4F 4A            [ 2] 5188         deca
   AC50 97 70         [ 3] 5189         staa    OFFCNT1
   AC52 26 04         [ 3] 5190         bne     LAC1B       
   AC54 86 FA         [ 2] 5191         ldaa    #0xFA           ; 250
   AC56 97 70         [ 3] 5192         staa    OFFCNT1
                           5193 
                           5194 ; 0x0071 counts from 230 to 1, period is 23 secs
   AC58                    5195 LAC1B:
   AC58 96 71         [ 3] 5196         ldaa    OFFCNT2
   AC5A 4A            [ 2] 5197         deca
   AC5B 97 71         [ 3] 5198         staa    OFFCNT2
   AC5D 26 04         [ 3] 5199         bne     LAC26  
   AC5F 86 E6         [ 2] 5200         ldaa    #0xE6           ; 230
   AC61 97 71         [ 3] 5201         staa    OFFCNT2
                           5202 
                           5203 ; 0x0072 counts from 210 to 1, period is 21 secs
   AC63                    5204 LAC26:
   AC63 96 72         [ 3] 5205         ldaa    OFFCNT3
   AC65 4A            [ 2] 5206         deca
   AC66 97 72         [ 3] 5207         staa    OFFCNT3
   AC68 26 04         [ 3] 5208         bne     LAC31  
   AC6A 86 D2         [ 2] 5209         ldaa    #0xD2           ; 210
   AC6C 97 72         [ 3] 5210         staa    OFFCNT3
                           5211 
                           5212 ; 0x0073 counts from 190 to 1, period is 19 secs
   AC6E                    5213 LAC31:
   AC6E 96 73         [ 3] 5214         ldaa    OFFCNT4
   AC70 4A            [ 2] 5215         deca
   AC71 97 73         [ 3] 5216         staa    OFFCNT4
   AC73 26 04         [ 3] 5217         bne     LAC3C  
   AC75 86 BE         [ 2] 5218         ldaa    #0xBE           ; 190
   AC77 97 73         [ 3] 5219         staa    OFFCNT4
                           5220 
                           5221 ; 0x0074 counts from 170 to 1, period is 17 secs
   AC79                    5222 LAC3C:
   AC79 96 74         [ 3] 5223         ldaa    OFFCNT5
   AC7B 4A            [ 2] 5224         deca
   AC7C 97 74         [ 3] 5225         staa    OFFCNT5
   AC7E 26 04         [ 3] 5226         bne     LAC47  
   AC80 86 AA         [ 2] 5227         ldaa    #0xAA           ; 170
   AC82 97 74         [ 3] 5228         staa    OFFCNT5
                           5229 
                           5230 ; back to 2.5ms period here
                           5231 
   AC84                    5232 LAC47:
   AC84 96 27         [ 3] 5233         ldaa    T30MS
   AC86 4C            [ 2] 5234         inca
   AC87 97 27         [ 3] 5235         staa    T30MS
   AC89 81 0C         [ 2] 5236         cmpa    #0x0C           ; 12 = 30ms?
   AC8B 23 09         [ 3] 5237         bls     LAC59  
   AC8D 7F 00 27      [ 6] 5238         clr     T30MS
                           5239 
                           5240 ; do these two tasks every 30ms
   AC90 BD 8E D6      [ 6] 5241         jsr     L8EC6           ; Scan SCD keys
   AC93 BD 8F 22      [ 6] 5242         jsr     L8F12           ; Scan Front Panel Switches
                           5243 
                           5244 ; back to every 2.5ms here
                           5245 ; LCD update???
                           5246 
   AC96                    5247 LAC59:
   AC96 96 43         [ 3] 5248         ldaa    (0x0043)
   AC98 27 55         [ 3] 5249         beq     LACB2  
   AC9A DE 44         [ 4] 5250         ldx     (0x0044)
   AC9C A6 00         [ 4] 5251         ldaa    0,X     
   AC9E 27 23         [ 3] 5252         beq     LAC86  
   ACA0 B7 10 00      [ 4] 5253         staa    PORTA  
   ACA3 B6 10 02      [ 4] 5254         ldaa    PORTG  
   ACA6 84 F3         [ 2] 5255         anda    #0xF3
   ACA8 B7 10 02      [ 4] 5256         staa    PORTG  
   ACAB 84 FD         [ 2] 5257         anda    #0xFD
   ACAD B7 10 02      [ 4] 5258         staa    PORTG  
   ACB0 8A 02         [ 2] 5259         oraa    #0x02
   ACB2 B7 10 02      [ 4] 5260         staa    PORTG  
   ACB5 08            [ 3] 5261         inx
   ACB6 08            [ 3] 5262         inx
   ACB7 8C 05 80      [ 4] 5263         cpx     #0x0580
   ACBA 25 03         [ 3] 5264         bcs     LAC82  
   ACBC CE 05 00      [ 3] 5265         ldx     #0x0500
   ACBF                    5266 LAC82:
   ACBF DF 44         [ 4] 5267         stx     (0x0044)
   ACC1 20 2C         [ 3] 5268         bra     LACB2  
   ACC3                    5269 LAC86:
   ACC3 A6 01         [ 4] 5270         ldaa    1,X     
   ACC5 27 25         [ 3] 5271         beq     LACAF  
   ACC7 B7 10 00      [ 4] 5272         staa    PORTA  
   ACCA B6 10 02      [ 4] 5273         ldaa    PORTG  
   ACCD 84 FB         [ 2] 5274         anda    #0xFB
   ACCF 8A 08         [ 2] 5275         oraa    #0x08
   ACD1 B7 10 02      [ 4] 5276         staa    PORTG  
   ACD4 84 FD         [ 2] 5277         anda    #0xFD
   ACD6 B7 10 02      [ 4] 5278         staa    PORTG  
   ACD9 8A 02         [ 2] 5279         oraa    #0x02
   ACDB B7 10 02      [ 4] 5280         staa    PORTG  
   ACDE 08            [ 3] 5281         inx
   ACDF 08            [ 3] 5282         inx
   ACE0 8C 05 80      [ 4] 5283         cpx     #0x0580
   ACE3 25 03         [ 3] 5284         bcs     LACAB  
   ACE5 CE 05 00      [ 3] 5285         ldx     #0x0500
   ACE8                    5286 LACAB:
   ACE8 DF 44         [ 4] 5287         stx     (0x0044)
   ACEA 20 03         [ 3] 5288         bra     LACB2  
   ACEC                    5289 LACAF:
   ACEC 7F 00 43      [ 6] 5290         clr     (0x0043)
                           5291 
                           5292 ; divide by 4
   ACEF                    5293 LACB2:
   ACEF 96 4F         [ 3] 5294         ldaa    (0x004F)
   ACF1 4C            [ 2] 5295         inca
   ACF2 97 4F         [ 3] 5296         staa    (0x004F)
   ACF4 81 04         [ 2] 5297         cmpa    #0x04
   ACF6 26 30         [ 3] 5298         bne     LACEB  
   ACF8 7F 00 4F      [ 6] 5299         clr     (0x004F)
                           5300 
                           5301 ; here every 10ms
                           5302 ; Five big countdown timers available here
                           5303 ; up to 655.35 seconds each
                           5304 
   ACFB DC 1B         [ 4] 5305         ldd     CDTIMR1         ; countdown 0x001B/1C every 10ms
   ACFD 27 05         [ 3] 5306         beq     LACC7           ; if not already 0
   ACFF 83 00 01      [ 4] 5307         subd    #0x0001
   AD02 DD 1B         [ 4] 5308         std     CDTIMR1
                           5309 
   AD04                    5310 LACC7:
   AD04 DC 1D         [ 4] 5311         ldd     CDTIMR2         ; same with 0x001D/1E
   AD06 27 05         [ 3] 5312         beq     LACD0  
   AD08 83 00 01      [ 4] 5313         subd    #0x0001
   AD0B DD 1D         [ 4] 5314         std     CDTIMR2
                           5315 
   AD0D                    5316 LACD0:
   AD0D DC 1F         [ 4] 5317         ldd     CDTIMR3         ; same with 0x001F/20
   AD0F 27 05         [ 3] 5318         beq     LACD9  
   AD11 83 00 01      [ 4] 5319         subd    #0x0001
   AD14 DD 1F         [ 4] 5320         std     CDTIMR3
                           5321 
   AD16                    5322 LACD9:
   AD16 DC 21         [ 4] 5323         ldd     CDTIMR4         ; same with 0x0021/22
   AD18 27 05         [ 3] 5324         beq     LACE2  
   AD1A 83 00 01      [ 4] 5325         subd    #0x0001
   AD1D DD 21         [ 4] 5326         std     CDTIMR4
                           5327 
   AD1F                    5328 LACE2:
   AD1F DC 23         [ 4] 5329         ldd     CDTIMR5         ; same with 0x0023/24
   AD21 27 05         [ 3] 5330         beq     LACEB  
   AD23 83 00 01      [ 4] 5331         subd    #0x0001
   AD26 DD 23         [ 4] 5332         std     CDTIMR5
                           5333 
                           5334 ; every other time through this, setup a task switch?
   AD28                    5335 LACEB:
   AD28 96 B0         [ 3] 5336         ldaa    (TSCNT)
   AD2A 88 01         [ 2] 5337         eora    #0x01
   AD2C 97 B0         [ 3] 5338         staa    (TSCNT)
   AD2E 27 18         [ 3] 5339         beq     LAD0B  
                           5340 
   AD30 BF 01 3C      [ 5] 5341         sts     (0x013C)        ; switch stacks???
   AD33 BE 01 3E      [ 5] 5342         lds     (0x013E)
   AD36 DC 10         [ 4] 5343         ldd     T1NXT
   AD38 83 01 F4      [ 4] 5344         subd    #0x01F4         ; 625-500 = 125?
   AD3B FD 10 18      [ 5] 5345         std     TOC2            ; set this TOC2 to happen 0.5ms
   AD3E 86 40         [ 2] 5346         ldaa    #0x40           ; after the current TOC1 but before the next TOC1
   AD40 B7 10 23      [ 4] 5347         staa    TFLG1           ; clear timer2 irq flag, just in case?
   AD43 86 C0         [ 2] 5348         ldaa    #0xC0           ;
   AD45 B7 10 22      [ 4] 5349         staa    TMSK1           ; enable TOC1 and TOC2
   AD48                    5350 LAD0B:
   AD48 3B            [12] 5351         rti
                           5352 
                           5353 ; TOC2 Timer handler and SWI handler
   AD49                    5354 LAD0C:
   AD49 86 40         [ 2] 5355         ldaa    #0x40
   AD4B B7 10 23      [ 4] 5356         staa    TFLG1           ; clear timer2 flag
   AD4E BF 01 3E      [ 5] 5357         sts     (0x013E)        ; switch stacks back???
   AD51 BE 01 3C      [ 5] 5358         lds     (0x013C)
   AD54 86 80         [ 2] 5359         ldaa    #0x80
   AD56 B7 10 22      [ 4] 5360         staa    TMSK1           ; enable TOC1 only
   AD59 3B            [12] 5361         rti
                           5362 
                           5363 ; Secondary task??
                           5364 
   AD5A                    5365 TASK2:
   AD5A 7D 04 2A      [ 6] 5366         tst     (0x042A)
   AD5D 27 35         [ 3] 5367         beq     LAD57
   AD5F 96 B6         [ 3] 5368         ldaa    (0x00B6)
   AD61 26 03         [ 3] 5369         bne     LAD29
   AD63 3F            [14] 5370         swi
   AD64 20 F4         [ 3] 5371         bra     TASK2
   AD66                    5372 LAD29:
   AD66 7F 00 B6      [ 6] 5373         clr     (0x00B6)
   AD69 C6 04         [ 2] 5374         ldab    #0x04
   AD6B                    5375 LAD2E:
   AD6B 37            [ 3] 5376         pshb
   AD6C CE AD 79      [ 3] 5377         ldx     #LAD3C
   AD6F BD 8A 2A      [ 6] 5378         jsr     L8A1A  
   AD72 3F            [14] 5379         swi
   AD73 33            [ 4] 5380         pulb
   AD74 5A            [ 2] 5381         decb
   AD75 26 F4         [ 3] 5382         bne     LAD2E  
   AD77 20 E1         [ 3] 5383         bra     TASK2
                           5384 
   AD79                    5385 LAD3C:
   AD79 53 31 00           5386         .asciz     'S1'
                           5387 
   AD7C FC 02 9C      [ 5] 5388         ldd     (0x029C)
   AD7F 1A 83 00 01   [ 5] 5389         cpd     #0x0001         ; 1
   AD83 27 0C         [ 3] 5390         beq     LAD54  
   AD85 1A 83 03 E8   [ 5] 5391         cpd     #0x03E8         ; 1000
   AD89 2D 09         [ 3] 5392         blt     LAD57  
   AD8B 1A 83 04 4B   [ 5] 5393         cpd     #0x044B         ; 1099
   AD8F 22 03         [ 3] 5394         bhi     LAD57  
   AD91                    5395 LAD54:
   AD91 3F            [14] 5396         swi
   AD92 20 C6         [ 3] 5397         bra     TASK2
   AD94                    5398 LAD57:
   AD94 7F 00 B3      [ 6] 5399         clr     (0x00B3)
   AD97 BD AD BB      [ 6] 5400         jsr     LAD7E
   AD9A BD AD DD      [ 6] 5401         jsr     LADA0
   AD9D 25 BB         [ 3] 5402         bcs     TASK2
   AD9F C6 0A         [ 2] 5403         ldab    #0x0A
   ADA1 BD AE 50      [ 6] 5404         jsr     LAE13
   ADA4 BD AD EB      [ 6] 5405         jsr     LADAE
   ADA7 25 B1         [ 3] 5406         bcs     TASK2
   ADA9 C6 14         [ 2] 5407         ldab    #0x14
   ADAB BD AE 50      [ 6] 5408         jsr     LAE13
   ADAE BD AD F3      [ 6] 5409         jsr     LADB6
   ADB1 25 A7         [ 3] 5410         bcs     TASK2
   ADB3                    5411 LAD76:
   ADB3 BD AD F5      [ 6] 5412         jsr     LADB8
   ADB6 0D            [ 2] 5413         sec
   ADB7 25 A1         [ 3] 5414         bcs     TASK2
   ADB9 20 F8         [ 3] 5415         bra     LAD76
   ADBB                    5416 LAD7E:
   ADBB CE AE 5B      [ 3] 5417         ldx     #LAE1E          ;+++
   ADBE BD 8A 2A      [ 6] 5418         jsr     L8A1A  
   ADC1 C6 1E         [ 2] 5419         ldab    #0x1E
   ADC3 BD AE 50      [ 6] 5420         jsr     LAE13
   ADC6 CE AE 5F      [ 3] 5421         ldx     #LAE22          ;ATH
   ADC9 BD 8A 2A      [ 6] 5422         jsr     L8A1A  
   ADCC C6 1E         [ 2] 5423         ldab    #0x1E
   ADCE BD AE 50      [ 6] 5424         jsr     LAE13
   ADD1 CE AE 64      [ 3] 5425         ldx     #LAE27          ;ATZ
   ADD4 BD 8A 2A      [ 6] 5426         jsr     L8A1A  
   ADD7 C6 1E         [ 2] 5427         ldab    #0x1E
   ADD9 BD AE 50      [ 6] 5428         jsr     LAE13
   ADDC 39            [ 5] 5429         rts
   ADDD                    5430 LADA0:
   ADDD BD B2 1A      [ 6] 5431         jsr     LB1DD
   ADE0 25 FB         [ 3] 5432         bcs     LADA0  
   ADE2 BD B2 8C      [ 6] 5433         jsr     LB24F
                           5434 
   ADE5 52 49 4E 47 00     5435         .asciz  'RING'
                           5436 
   ADEA 39            [ 5] 5437         rts
                           5438 
   ADEB                    5439 LADAE:
   ADEB CE AE 69      [ 3] 5440         ldx     #LAE2C
   ADEE BD 8A 2A      [ 6] 5441         jsr     L8A1A           ;ATA
   ADF1 0C            [ 2] 5442         clc
   ADF2 39            [ 5] 5443         rts
   ADF3                    5444 LADB6:
   ADF3 0C            [ 2] 5445         clc
   ADF4 39            [ 5] 5446         rts
                           5447 
   ADF5                    5448 LADB8:
   ADF5 BD B2 0F      [ 6] 5449         jsr     LB1D2
   ADF8 BD AE 6E      [ 6] 5450         jsr     LAE31
   ADFB 86 01         [ 2] 5451         ldaa    #0x01
   ADFD 97 B3         [ 3] 5452         staa    (0x00B3)
   ADFF BD B2 1A      [ 6] 5453         jsr     LB1DD
   AE02 BD B2 AE      [ 6] 5454         jsr     LB271
   AE05 36            [ 3] 5455         psha
   AE06 BD B2 FD      [ 6] 5456         jsr     LB2C0
   AE09 32            [ 4] 5457         pula
   AE0A 81 01         [ 2] 5458         cmpa    #0x01
   AE0C 26 08         [ 3] 5459         bne     LADD9  
   AE0E CE B2 D2      [ 3] 5460         ldx     #LB295
   AE11 BD 8A 2A      [ 6] 5461         jsr     L8A1A           ;'You have selected #1'
   AE14 20 31         [ 3] 5462         bra     LAE0A  
   AE16                    5463 LADD9:
   AE16 81 02         [ 2] 5464         cmpa    #0x02
   AE18 26 00         [ 3] 5465         bne     LADDD  
   AE1A                    5466 LADDD:
   AE1A 81 03         [ 2] 5467         cmpa    #0x03
   AE1C 26 00         [ 3] 5468         bne     LADE1  
   AE1E                    5469 LADE1:
   AE1E 81 04         [ 2] 5470         cmpa    #0x04
   AE20 26 00         [ 3] 5471         bne     LADE5  
   AE22                    5472 LADE5:
   AE22 81 05         [ 2] 5473         cmpa    #0x05
   AE24 26 00         [ 3] 5474         bne     LADE9  
   AE26                    5475 LADE9:
   AE26 81 06         [ 2] 5476         cmpa    #0x06
   AE28 26 00         [ 3] 5477         bne     LADED  
   AE2A                    5478 LADED:
   AE2A 81 07         [ 2] 5479         cmpa    #0x07
   AE2C 26 00         [ 3] 5480         bne     LADF1  
   AE2E                    5481 LADF1:
   AE2E 81 08         [ 2] 5482         cmpa    #0x08
   AE30 26 00         [ 3] 5483         bne     LADF5  
   AE32                    5484 LADF5:
   AE32 81 09         [ 2] 5485         cmpa    #0x09
   AE34 26 00         [ 3] 5486         bne     LADF9  
   AE36                    5487 LADF9:
   AE36 81 0A         [ 2] 5488         cmpa    #0x0A
   AE38 26 00         [ 3] 5489         bne     LADFD  
   AE3A                    5490 LADFD:
   AE3A 81 0B         [ 2] 5491         cmpa    #0x0B
   AE3C 26 09         [ 3] 5492         bne     LAE0A  
   AE3E CE B2 E7      [ 3] 5493         ldx     #LB2AA          ;'You have selected #11'
   AE41 BD 8A 2A      [ 6] 5494         jsr     L8A1A  
   AE44 7E AE 47      [ 3] 5495         jmp     LAE0A
   AE47                    5496 LAE0A:
   AE47 C6 14         [ 2] 5497         ldab    #0x14
   AE49 BD AE 50      [ 6] 5498         jsr     LAE13
   AE4C 7F 00 B3      [ 6] 5499         clr     (0x00B3)
   AE4F 39            [ 5] 5500         rts
                           5501 
   AE50                    5502 LAE13:
   AE50 CE 00 20      [ 3] 5503         ldx     #0x0020
   AE53                    5504 LAE16:
   AE53 3F            [14] 5505         swi
   AE54 09            [ 3] 5506         dex
   AE55 26 FC         [ 3] 5507         bne     LAE16  
   AE57 5A            [ 2] 5508         decb
   AE58 26 F6         [ 3] 5509         bne     LAE13  
   AE5A 39            [ 5] 5510         rts
                           5511 
                           5512 ; text??
   AE5B                    5513 LAE1E:
   AE5B 2B 2B 2B 00        5514         .asciz      '+++'
   AE5F                    5515 LAE22:
   AE5F 41 54 48 0D 00     5516         .asciz      'ATH\r'
   AE64                    5517 LAE27:
   AE64 41 54 5A 0D 00     5518         .asciz      'ATZ\r'
   AE69                    5519 LAE2C:
   AE69 41 54 41 0D 00     5520         .asciz      'ATA\r'
                           5521 
   AE6E                    5522 LAE31:
   AE6E CE AE 75      [ 3] 5523         ldx     #LAE38          ; big long string of stats, with compressed ansi codes
   AE71 BD 8A 2A      [ 6] 5524         jsr     L8A1A  
   AE74 39            [ 5] 5525         rts
                           5526 
   AE75                    5527 LAE38:
   AE75 5E 30 31 30 31 53  5528         .ascii  "^0101Serial #:^0140#0000^0111~4"
        65 72 69 61 6C 20
        23 3A 5E 30 31 34
        30 23 30 30 30 30
        5E 30 31 31 31 7E
        34
   AE94 0E 20              5529         .byte   0x0E,0x20
   AE96 5E 30 31 34 31 7C  5530         .ascii  "^0141|"
   AE9C 04 28              5531         .byte   0x04,0x28
   AE9E 5E 30 33 30 31 43  5532         .ascii  "^0301CURRENT^0340HISTORY^0501Show Status:^0540Total # reg. shows:^0601Random Status:^0570|"
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
   AEF8 04 10              5533         .byte   0x04,0x10
   AEFA 5E 30 36 34 30 54  5534         .ascii  "^0640Total # live shows:^0701Current Reg Tape #:^0670|"
        6F 74 61 6C 20 23
        20 6C 69 76 65 20
        73 68 6F 77 73 3A
        5E 30 37 30 31 43
        75 72 72 65 6E 74
        20 52 65 67 20 54
        61 70 65 20 23 3A
        5E 30 36 37 30 7C
   AF30 04 12              5535         .byte   0x04,0x12
   AF32 5E 30 37 33 30 7E  5536         .ascii  "^0730~3"
        33
   AF39 04 02              5537         .byte   0x04,0x02
   AF3B 5E 30 37 34 30 54  5538         .ascii  "^0740Total # failed pswd attempts:^0801Current Live Tape #:^0770|"
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
   AF7C 04 14              5539         .byte   0x04,0x14
   AF7E 5E 30 38 33 30 7E  5540         .ascii  "^0830~3"
        33
   AF85 04 05              5541         .byte   0x04,0x05
   AF87 5E 30 38 34 30 54  5542         .ascii  "^0840Total # successful pswd:^0901Current Version #:^0870|"
        6F 74 61 6C 20 23
        20 73 75 63 63 65
        73 73 66 75 6C 20
        70 73 77 64 3A 5E
        30 39 30 31 43 75
        72 72 65 6E 74 20
        56 65 72 73 69 6F
        6E 20 23 3A 5E 30
        38 37 30 7C
   AFC1 04 16              5543         .byte   0x04,0x16
   AFC3 5E 30 39 33 30 40  5544         .ascii  "^0930@"
   AFC9 04 00              5545         .byte   0x04,0x00
   AFCB 5E 30 39 34 30 54  5546         .ascii  "^0940Total # bdays played:^1040Total # VCR adjusts:^0970|"
        6F 74 61 6C 20 23
        20 62 64 61 79 73
        20 70 6C 61 79 65
        64 3A 5E 31 30 34
        30 54 6F 74 61 6C
        20 23 20 56 43 52
        20 61 64 6A 75 73
        74 73 3A 5E 30 39
        37 30 7C
   B004 04 18              5547         .byte   0x04,0x18
   B006 5E 31 30 37 30 7C  5548         .ascii  "^1070|"
   B00C 04 1A              5549         .byte   0x04,0x1A
   B00E 5E 31 31 34 30 54  5550         .ascii  "^1140Total # remote accesses:^1240Total # access attempts:^1170|"
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
   B04E 04 1C              5551         .byte   0x04,0x1C
   B050 5E 31 32 37 30 7C  5552         .ascii  "^1270|"
   B056 04 1E              5553         .byte   0x04,0x1E
   B058 5E 31 33 34 30 54  5554         .ascii  "^1340Total # rejected showtapes:^1440Total # Short bdays:^1370|"
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
   B097 04 20              5555         .byte   0x04,0x20
   B099 5E 31 34 37 30 7C  5556         .ascii  "^1470|"
   B09F 04 22              5557         .byte   0x04,0x22
   B0A1 5E 31 35 34 30 54  5558         .ascii  "^1540Total # Reg bdays:^1640Total # resets-pwr ups:^1570|"
        6F 74 61 6C 20 23
        20 52 65 67 20 62
        64 61 79 73 3A 5E
        31 36 34 30 54 6F
        74 61 6C 20 23 20
        72 65 73 65 74 73
        2D 70 77 72 20 75
        70 73 3A 5E 31 35
        37 30 7C
   B0DA 04 24              5559         .byte   0x04,0x24
   B0DC 5E 31 36 37 30 7C  5560         .ascii  "^1670|"
   B0E2 04 26              5561         .byte   0x04,0x26
   B0E4 5E 31 38 30 31 46  5562         .ascii  "^1801FUNCTIONS^1823Select Function:^20011.Clear rnd enables^2028 6.Set loc name-#^205411.Diagnostics^21012.Set rnd enables^2128 7.Set Time^215412.^22013.Set reg tape #^2228 8.Disbl-enbl show^225413.^23014.Set liv tape #^2328 9.Upload program^235414.^24015.Reset history^242810.Debugger^245415.^1840"
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
   B20E 00                 5563         .byte   0x00
                           5564 
   B20F                    5565 LB1D2:
   B20F CE B2 15      [ 3] 5566         ldx     #LB1D8          ; escape sequence?
   B212 7E 8A 2A      [ 3] 5567         jmp     L8A1A  
                           5568 
                           5569 ; ANSI control sequence - Clear Screen and Home Cursor
   B215                    5570 LB1D8:
                           5571         ; esc[2J
   B215 1B                 5572         .byte   0x1b
   B216 5B 32 4A 00        5573         .asciz  '[2J'
                           5574 
   B21A                    5575 LB1DD:
   B21A CE 05 A0      [ 3] 5576         ldx     #0x05A0
   B21D CC 00 00      [ 3] 5577         ldd     #0x0000
   B220 FD 02 9E      [ 5] 5578         std     (0x029E)
   B223                    5579 LB1E6:
   B223 FC 02 9E      [ 5] 5580         ldd     (0x029E)
   B226 C3 00 01      [ 4] 5581         addd    #0x0001
   B229 FD 02 9E      [ 5] 5582         std     (0x029E)
   B22C 1A 83 0F A0   [ 5] 5583         cpd     #0x0FA0
   B230 24 28         [ 3] 5584         bcc     LB21D  
   B232 BD B2 60      [ 6] 5585         jsr     LB223
   B235 25 04         [ 3] 5586         bcs     LB1FE  
   B237 3F            [14] 5587         swi
   B238 20 E9         [ 3] 5588         bra     LB1E6  
   B23A 39            [ 5] 5589         rts
                           5590 
   B23B                    5591 LB1FE:
   B23B A7 00         [ 4] 5592         staa    0,X     
   B23D 08            [ 3] 5593         inx
   B23E 81 0D         [ 2] 5594         cmpa    #0x0D
   B240 26 02         [ 3] 5595         bne     LB207  
   B242 20 18         [ 3] 5596         bra     LB21F  
   B244                    5597 LB207:
   B244 81 1B         [ 2] 5598         cmpa    #0x1B
   B246 26 02         [ 3] 5599         bne     LB20D  
   B248 20 10         [ 3] 5600         bra     LB21D  
   B24A                    5601 LB20D:
   B24A 7D 00 B3      [ 6] 5602         tst     (0x00B3)
   B24D 27 03         [ 3] 5603         beq     LB215  
   B24F BD 8B 4B      [ 6] 5604         jsr     L8B3B
   B252                    5605 LB215:
   B252 CC 00 00      [ 3] 5606         ldd     #0x0000
   B255 FD 02 9E      [ 5] 5607         std     (0x029E)
   B258 20 C9         [ 3] 5608         bra     LB1E6  
   B25A                    5609 LB21D:
   B25A 0D            [ 2] 5610         sec
   B25B 39            [ 5] 5611         rts
                           5612 
   B25C                    5613 LB21F:
   B25C 6F 00         [ 6] 5614         clr     0,X     
   B25E 0C            [ 2] 5615         clc
   B25F 39            [ 5] 5616         rts
                           5617 
   B260                    5618 LB223:
   B260 B6 18 0D      [ 4] 5619         ldaa    SCCCTRLA
   B263 44            [ 2] 5620         lsra
   B264 25 0B         [ 3] 5621         bcs     LB234  
   B266 4F            [ 2] 5622         clra
   B267 B7 18 0D      [ 4] 5623         staa    SCCCTRLA
   B26A 86 30         [ 2] 5624         ldaa    #0x30
   B26C B7 18 0D      [ 4] 5625         staa    SCCCTRLA
   B26F 0C            [ 2] 5626         clc
   B270 39            [ 5] 5627         rts
                           5628 
   B271                    5629 LB234:
   B271 86 01         [ 2] 5630         ldaa    #0x01
   B273 B7 18 0D      [ 4] 5631         staa    SCCCTRLA
   B276 86 70         [ 2] 5632         ldaa    #0x70
   B278 B5 18 0D      [ 4] 5633         bita    SCCCTRLA
   B27B 26 05         [ 3] 5634         bne     LB245  
   B27D 0D            [ 2] 5635         sec
   B27E B6 18 0F      [ 4] 5636         ldaa    SCCDATAA
   B281 39            [ 5] 5637         rts
                           5638 
   B282                    5639 LB245:
   B282 B6 18 0F      [ 4] 5640         ldaa    SCCDATAA
   B285 86 30         [ 2] 5641         ldaa    #0x30
   B287 B7 18 0C      [ 4] 5642         staa    SCCCTRLB
   B28A 0C            [ 2] 5643         clc
   B28B 39            [ 5] 5644         rts
                           5645 
   B28C                    5646 LB24F:
   B28C 38            [ 5] 5647         pulx
   B28D 18 CE 05 A0   [ 4] 5648         ldy     #0x05A0
   B291                    5649 LB254:
   B291 A6 00         [ 4] 5650         ldaa    0,X
   B293 27 11         [ 3] 5651         beq     LB269
   B295 08            [ 3] 5652         inx
   B296 18 A1 00      [ 5] 5653         cmpa    0,Y
   B299 26 04         [ 3] 5654         bne     LB262
   B29B 18 08         [ 4] 5655         iny
   B29D 20 F2         [ 3] 5656         bra     LB254
   B29F                    5657 LB262:
   B29F A6 00         [ 4] 5658         ldaa    0,X
   B2A1 27 07         [ 3] 5659         beq     LB26D
   B2A3 08            [ 3] 5660         inx
   B2A4 20 F9         [ 3] 5661         bra     LB262
   B2A6                    5662 LB269:
   B2A6 08            [ 3] 5663         inx
   B2A7 3C            [ 4] 5664         pshx
   B2A8 0C            [ 2] 5665         clc
   B2A9 39            [ 5] 5666         rts
   B2AA                    5667 LB26D:
   B2AA 08            [ 3] 5668         inx
   B2AB 3C            [ 4] 5669         pshx
   B2AC 0D            [ 2] 5670         sec
   B2AD 39            [ 5] 5671         rts
                           5672 
   B2AE                    5673 LB271:
   B2AE CE 05 A0      [ 3] 5674         ldx     #0x05A0
   B2B1                    5675 LB274:
   B2B1 A6 00         [ 4] 5676         ldaa    0,X
   B2B3 08            [ 3] 5677         inx
   B2B4 81 0D         [ 2] 5678         cmpa    #0x0D
   B2B6 26 F9         [ 3] 5679         bne     LB274
   B2B8 09            [ 3] 5680         dex
   B2B9 09            [ 3] 5681         dex
   B2BA A6 00         [ 4] 5682         ldaa    0,X
   B2BC 09            [ 3] 5683         dex
   B2BD 80 30         [ 2] 5684         suba    #0x30
   B2BF 97 B2         [ 3] 5685         staa    (0x00B2)
   B2C1 8C 05 9F      [ 4] 5686         cpx     #0x059F
   B2C4 27 0B         [ 3] 5687         beq     LB294
   B2C6 A6 00         [ 4] 5688         ldaa    0,X
   B2C8 09            [ 3] 5689         dex
   B2C9 80 30         [ 2] 5690         suba    #0x30
   B2CB C6 0A         [ 2] 5691         ldab    #0x0A
   B2CD 3D            [10] 5692         mul
   B2CE 17            [ 2] 5693         tba
   B2CF 9B B2         [ 3] 5694         adda    (0x00B2)
   B2D1                    5695 LB294:
   B2D1 39            [ 5] 5696         rts
                           5697 
   B2D2                    5698 LB295:
   B2D2 59 6F 75 20 68 61  5699         .asciz  'You have selected #1'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 00
   B2E7                    5700 LB2AA:
   B2E7 59 6F 75 20 68 61  5701         .asciz  'You have selected #11'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 31 00
                           5702 
   B2FD                    5703 LB2C0:
   B2FD CE B3 04      [ 3] 5704         ldx     #LB2C7          ; Table with compressed ANSI cursor controls
   B300 BD 8A 2A      [ 6] 5705         jsr     L8A1A  
   B303 39            [ 5] 5706         rts
                           5707 
   B304                    5708 LB2C7:
   B304 5E 32 30 30 31 25  5709         .asciz  "^2001%^2101%^2201%^2301%^2401%^2001"
        5E 32 31 30 31 25
        5E 32 32 30 31 25
        5E 32 33 30 31 25
        5E 32 34 30 31 25
        5E 32 30 30 31 00
                           5710 
                           5711 ; Random movement tables
                           5712 
                           5713 ; board 1
   B328                    5714 LB2EB:
   B328 FA 20 FA 20 F6 22  5715         .byte   0xfa,0x20,0xfa,0x20,0xf6,0x22,0xf5,0x20
        F5 20
   B330 F5 20 F3 22 F2 20  5716         .byte   0xf5,0x20,0xf3,0x22,0xf2,0x20,0xe5,0x22
        E5 22
   B338 E5 22 E2 20 D2 20  5717         .byte   0xe5,0x22,0xe2,0x20,0xd2,0x20,0xbe,0x00
        BE 00
   B340 BC 22 BB 30 B9 32  5718         .byte   0xbc,0x22,0xbb,0x30,0xb9,0x32,0xb9,0x32
        B9 32
   B348 B7 30 B6 32 B5 30  5719         .byte   0xb7,0x30,0xb6,0x32,0xb5,0x30,0xb4,0x32
        B4 32
   B350 B4 32 B3 20 B3 20  5720         .byte   0xb4,0x32,0xb3,0x20,0xb3,0x20,0xb1,0xa0
        B1 A0
   B358 B1 A0 B0 A2 AF A0  5721         .byte   0xb1,0xa0,0xb0,0xa2,0xaf,0xa0,0xaf,0xa6
        AF A6
   B360 AE A0 AE A6 AD A4  5722         .byte   0xae,0xa0,0xae,0xa6,0xad,0xa4,0xac,0xa0
        AC A0
   B368 AC A0 AB A0 AA A0  5723         .byte   0xac,0xa0,0xab,0xa0,0xaa,0xa0,0xaa,0xa0
        AA A0
   B370 A2 80 A0 A0 A0 A0  5724         .byte   0xa2,0x80,0xa0,0xa0,0xa0,0xa0,0x8d,0x80
        8D 80
   B378 8A A0 7E 80 7B A0  5725         .byte   0x8a,0xa0,0x7e,0x80,0x7b,0xa0,0x79,0xa4
        79 A4
   B380 78 A0 77 A4 76 A0  5726         .byte   0x78,0xa0,0x77,0xa4,0x76,0xa0,0x75,0xa4
        75 A4
   B388 74 A0 73 A4 72 A0  5727         .byte   0x74,0xa0,0x73,0xa4,0x72,0xa0,0x71,0xa4
        71 A4
   B390 70 A0 6F A4 6E A0  5728         .byte   0x70,0xa0,0x6f,0xa4,0x6e,0xa0,0x6d,0xa4
        6D A4
   B398 6C A0 69 80 69 80  5729         .byte   0x6c,0xa0,0x69,0x80,0x69,0x80,0x67,0xa0
        67 A0
   B3A0 5E 20 58 24 57 20  5730         .byte   0x5e,0x20,0x58,0x24,0x57,0x20,0x57,0x20
        57 20
   B3A8 56 24 55 20 54 24  5731         .byte   0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24
        54 24
   B3B0 53 20 52 24 52 24  5732         .byte   0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20
        50 20
   B3B8 4F 24 4E 20 4D 24  5733         .byte   0x4f,0x24,0x4e,0x20,0x4d,0x24,0x4c,0x20
        4C 20
   B3C0 4C 20 4B 24 4A 20  5734         .byte   0x4c,0x20,0x4b,0x24,0x4a,0x20,0x49,0x20
        49 20
   B3C8 49 00 48 20 47 20  5735         .byte   0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20
        47 20
   B3D0 46 20 45 24 45 24  5736         .byte   0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20
        44 20
   B3D8 42 20 42 20 37 04  5737         .byte   0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20
        35 20
   B3E0 2E 04 2E 04 2D 20  5738         .byte   0x2e,0x04,0x2e,0x04,0x2d,0x20,0x23,0x24
        23 24
   B3E8 21 20 17 24 13 00  5739         .byte   0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24
        11 24
   B3F0 10 30 07 34 06 30  5740         .byte   0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30
        05 30
   B3F8 FF FF              5741         .byte   0xff,0xff
                           5742 
                           5743 ; board 2
   B3FA                    5744 LB3BD:
   B3FA D7 22 D5 20 C9 22  5745         .byte   0xd7,0x22,0xd5,0x20,0xc9,0x22,0xc7,0x20
        C7 20
   B402 C4 24 C3 20 C2 24  5746         .byte   0xc4,0x24,0xc3,0x20,0xc2,0x24,0xc1,0x20
        C1 20
   B40A BF 24 BF 24 BE 20  5747         .byte   0xbf,0x24,0xbf,0x24,0xbe,0x20,0xbd,0x24
        BD 24
   B412 BC 20 BB 24 BA 20  5748         .byte   0xbc,0x20,0xbb,0x24,0xba,0x20,0xb9,0x20
        B9 20
   B41A B8 24 B7 20 B4 00  5749         .byte   0xb8,0x24,0xb7,0x20,0xb4,0x00,0xb4,0x00
        B4 00
   B422 B2 20 A9 20 A3 20  5750         .byte   0xb2,0x20,0xa9,0x20,0xa3,0x20,0xa2,0x20
        A2 20
   B42A A1 20 A0 20 A0 20  5751         .byte   0xa1,0x20,0xa0,0x20,0xa0,0x20,0x9f,0x20
        9F 20
   B432 9F 20 9E 20 9D 24  5752         .byte   0x9f,0x20,0x9e,0x20,0x9d,0x24,0x9d,0x24
        9D 24
   B43A 9B 20 9A 24 99 20  5753         .byte   0x9b,0x20,0x9a,0x24,0x99,0x20,0x98,0x20
        98 20
   B442 97 24 97 24 95 20  5754         .byte   0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20
        95 20
   B44A 94 00 94 00 93 20  5755         .byte   0x94,0x00,0x94,0x00,0x93,0x20,0x92,0x00
        92 00
   B452 92 00 91 20 90 20  5756         .byte   0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20
        90 20
   B45A 8F 20 8D 20 8D 20  5757         .byte   0x8f,0x20,0x8d,0x20,0x8d,0x20,0x81,0x00
        81 00
   B462 7F 20 79 00 79 00  5758         .byte   0x7f,0x20,0x79,0x00,0x79,0x00,0x78,0x20
        78 20
   B46A 76 20 6B 00 69 20  5759         .byte   0x76,0x20,0x6b,0x00,0x69,0x20,0x5e,0x00
        5E 00
   B472 5C 20 5B 30 52 10  5760         .byte   0x5c,0x20,0x5b,0x30,0x52,0x10,0x51,0x30
        51 30
   B47A 50 30 50 30 4F 20  5761         .byte   0x50,0x30,0x50,0x30,0x4f,0x20,0x4e,0x20
        4E 20
   B482 4E 20 4D 20 46 A0  5762         .byte   0x4e,0x20,0x4d,0x20,0x46,0xa0,0x45,0xa0
        45 A0
   B48A 3D A0 3D A0 39 20  5763         .byte   0x3d,0xa0,0x3d,0xa0,0x39,0x20,0x2a,0x00
        2A 00
   B492 28 20 1E 00 1C 22  5764         .byte   0x28,0x20,0x1e,0x00,0x1c,0x22,0x1c,0x22
        1C 22
   B49A 1B 20 1A 22 19 20  5765         .byte   0x1b,0x20,0x1a,0x22,0x19,0x20,0x18,0x22
        18 22
   B4A2 18 22 16 20 15 22  5766         .byte   0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22
        15 22
   B4AA 14 A0 13 A2 11 A0  5767         .byte   0x14,0xa0,0x13,0xa2,0x11,0xa0,0xff,0xff
        FF FF
                           5768 
                           5769 ; board 4
   B4B2                    5770 LB475:
   B4B2 BE 00 BC 22 BB 30  5771         .byte   0xbe,0x00,0xbc,0x22,0xbb,0x30,0xb9,0x32
        B9 32
   B4BA B9 32 B7 30 B6 32  5772         .byte   0xb9,0x32,0xb7,0x30,0xb6,0x32,0xb5,0x30
        B5 30
   B4C2 B4 32 B4 32 B3 20  5773         .byte   0xb4,0x32,0xb4,0x32,0xb3,0x20,0xb3,0x20
        B3 20
   B4CA B1 A0 B1 A0 B0 A2  5774         .byte   0xb1,0xa0,0xb1,0xa0,0xb0,0xa2,0xaf,0xa0
        AF A0
   B4D2 AF A6 AE A0 AE A6  5775         .byte   0xaf,0xa6,0xae,0xa0,0xae,0xa6,0xad,0xa4
        AD A4
   B4DA AC A0 AC A0 AB A0  5776         .byte   0xac,0xa0,0xac,0xa0,0xab,0xa0,0xaa,0xa0
        AA A0
   B4E2 AA A0 A2 80 A0 A0  5777         .byte   0xaa,0xa0,0xa2,0x80,0xa0,0xa0,0xa0,0xa0
        A0 A0
   B4EA 8D 80 8A A0 7E 80  5778         .byte   0x8d,0x80,0x8a,0xa0,0x7e,0x80,0x7b,0xa0
        7B A0
   B4F2 79 A4 78 A0 77 A4  5779         .byte   0x79,0xa4,0x78,0xa0,0x77,0xa4,0x76,0xa0
        76 A0
   B4FA 75 A4 74 A0 73 A4  5780         .byte   0x75,0xa4,0x74,0xa0,0x73,0xa4,0x72,0xa0
        72 A0
   B502 71 A4 70 A0 6F A4  5781         .byte   0x71,0xa4,0x70,0xa0,0x6f,0xa4,0x6e,0xa0
        6E A0
   B50A 6D A4 6C A0 69 80  5782         .byte   0x6d,0xa4,0x6c,0xa0,0x69,0x80,0x69,0x80
        69 80
   B512 67 A0 5E 20 58 24  5783         .byte   0x67,0xa0,0x5e,0x20,0x58,0x24,0x57,0x20
        57 20
   B51A 57 20 56 24 55 20  5784         .byte   0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24
        54 24
   B522 54 24 53 20 52 24  5785         .byte   0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24
        52 24
   B52A 50 20 4F 24 4E 20  5786         .byte   0x50,0x20,0x4f,0x24,0x4e,0x20,0x4d,0x24
        4D 24
   B532 4C 20 4C 20 4B 24  5787         .byte   0x4c,0x20,0x4c,0x20,0x4b,0x24,0x4a,0x20
        4A 20
   B53A 49 20 49 00 48 20  5788         .byte   0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20
        47 20
   B542 47 20 46 20 45 24  5789         .byte   0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24
        45 24
   B54A 44 20 42 20 42 20  5790         .byte   0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04
        37 04
   B552 35 20 2E 04 2E 04  5791         .byte   0x35,0x20,0x2e,0x04,0x2e,0x04,0x2d,0x20
        2D 20
   B55A 23 24 21 20 17 24  5792         .byte   0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00
        13 00
   B562 11 24 10 30 07 34  5793         .byte   0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30
        06 30
   B56A 05 30 FF FF        5794         .byte   0x05,0x30,0xff,0xff
                           5795 
                           5796 ; board 3
   B56E                    5797 LB531:
   B56E CD 20 CC 20 CB 20  5798         .byte   0xcd,0x20,0xcc,0x20,0xcb,0x20,0xcb,0x20
        CB 20
   B576 CA 00 C9 20 C9 20  5799         .byte   0xca,0x00,0xc9,0x20,0xc9,0x20,0xc8,0x20
        C8 20
   B57E C1 A0 C0 A0 B8 A0  5800         .byte   0xc1,0xa0,0xc0,0xa0,0xb8,0xa0,0xb8,0x20
        B8 20
   B586 B4 20 A6 00 A4 20  5801         .byte   0xb4,0x20,0xa6,0x00,0xa4,0x20,0x99,0x00
        99 00
   B58E 97 22 97 22 96 20  5802         .byte   0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22
        95 22
   B596 94 20 93 22 93 22  5803         .byte   0x94,0x20,0x93,0x22,0x93,0x22,0x91,0x20
        91 20
   B59E 90 20 90 20 8D A0  5804         .byte   0x90,0x20,0x90,0x20,0x8d,0xa0,0x8c,0xa0
        8C A0
   B5A6 7D A2 7D A2 7B A0  5805         .byte   0x7d,0xa2,0x7d,0xa2,0x7b,0xa0,0x7b,0xa0
        7B A0
   B5AE 79 A2 79 A2 77 A0  5806         .byte   0x79,0xa2,0x79,0xa2,0x77,0xa0,0x77,0xa0
        77 A0
   B5B6 76 80 75 A0 6E 20  5807         .byte   0x76,0x80,0x75,0xa0,0x6e,0x20,0x67,0x24
        67 24
   B5BE 66 20 65 24 64 20  5808         .byte   0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24
        63 24
   B5C6 63 24 61 20 60 24  5809         .byte   0x63,0x24,0x61,0x20,0x60,0x24,0x5f,0x20
        5F 20
   B5CE 5E 20 5D 24 5C 20  5810         .byte   0x5e,0x20,0x5d,0x24,0x5c,0x20,0x5b,0x24
        5B 24
   B5D6 5A 20 59 24 58 20  5811         .byte   0x5a,0x20,0x59,0x24,0x58,0x20,0x56,0x20
        56 20
   B5DE 55 04 54 00 53 24  5812         .byte   0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20
        52 20
   B5E6 52 20 4F 24 4F 24  5813         .byte   0x52,0x20,0x4f,0x24,0x4f,0x24,0x4e,0x30
        4E 30
   B5EE 4D 30 47 10 45 30  5814         .byte   0x4d,0x30,0x47,0x10,0x45,0x30,0x35,0x30
        35 30
   B5F6 33 10 31 30 31 30  5815         .byte   0x33,0x10,0x31,0x30,0x31,0x30,0x1d,0x20
        1D 20
   B5FE FF FF              5816         .byte   0xff,0xff
                           5817 
                           5818 ; board 5
   B600                    5819 LB5C3:
   B600 A9 20 A3 20 A2 20  5820         .byte   0xa9,0x20,0xa3,0x20,0xa2,0x20,0xa1,0x20
        A1 20
   B608 A0 20 A0 20 9F 20  5821         .byte   0xa0,0x20,0xa0,0x20,0x9f,0x20,0x9f,0x20
        9F 20
   B610 9E 20 9D 24 9D 24  5822         .byte   0x9e,0x20,0x9d,0x24,0x9d,0x24,0x9b,0x20
        9B 20
   B618 9A 24 99 20 98 20  5823         .byte   0x9a,0x24,0x99,0x20,0x98,0x20,0x97,0x24
        97 24
   B620 97 24 95 20 95 20  5824         .byte   0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00
        94 00
   B628 94 00 93 20 92 00  5825         .byte   0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00
        92 00
   B630 91 20 90 20 90 20  5826         .byte   0x91,0x20,0x90,0x20,0x90,0x20,0x8f,0x20
        8F 20
   B638 8D 20 8D 20 81 00  5827         .byte   0x8d,0x20,0x8d,0x20,0x81,0x00,0x7f,0x20
        7F 20
   B640 79 00 79 00 78 20  5828         .byte   0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20
        76 20
   B648 6B 00 69 20 5E 00  5829         .byte   0x6b,0x00,0x69,0x20,0x5e,0x00,0x5c,0x20
        5C 20
   B650 5B 30 52 10 51 30  5830         .byte   0x5b,0x30,0x52,0x10,0x51,0x30,0x50,0x30
        50 30
   B658 50 30 4F 20 4E 20  5831         .byte   0x50,0x30,0x4f,0x20,0x4e,0x20,0x4e,0x20
        4E 20
   B660 4D 20 46 A0 45 A0  5832         .byte   0x4d,0x20,0x46,0xa0,0x45,0xa0,0x3d,0xa0
        3D A0
   B668 3D A0 39 20 2A 00  5833         .byte   0x3d,0xa0,0x39,0x20,0x2a,0x00,0x28,0x20
        28 20
   B670 1E 00 1C 22 1C 22  5834         .byte   0x1e,0x00,0x1c,0x22,0x1c,0x22,0x1b,0x20
        1B 20
   B678 1A 22 19 20 18 22  5835         .byte   0x1a,0x22,0x19,0x20,0x18,0x22,0x18,0x22
        18 22
   B680 16 20 15 22 15 22  5836         .byte   0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xa0
        14 A0
   B688 13 A2 11 A0        5837         .byte   0x13,0xa2,0x11,0xa0
                           5838 
                           5839 ; All empty (0xFFs) in this gap
                           5840 
   F780                    5841         .org    0xF780
                           5842 
                           5843 ; Two Tables used by data protocol handler
                           5844 
   F780                    5845 LF780:
   F780 57 0B 00 00 00 00  5846         .byte   0x57,0x0b,0x00,0x00,0x00,0x00,0x08,0x00
        08 00
   F788 00 00 20 00 00 00  5847         .byte   0x00,0x00,0x20,0x00,0x00,0x00,0x80,0x00
        80 00
   F790 00 00 00 00 00 04  5848         .byte   0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
        00 00
   F798 00 10 00 00 00 00  5849         .byte   0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
                           5850 
   F7A0                    5851 LF7A0:
   F7A0 40 12 20 09 80 24  5852         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x02,0x00
        02 00
   F7A8 40 12 20 09 80 24  5853         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x04,0x00
        04 00
   F7B0 00 00 00 00 00 00  5854         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
   F7B8 00 00 00 00 08 00  5855         .byte   0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        00 00
                           5856 
   F7C0                    5857 LF7C0:
   F7C0 01                 5858         .byte   0x01
                           5859 ;
                           5860 ; All empty (0xFFs) in this gap
                           5861 ;
   F800                    5862         .org    0xF800
                           5863 ; Reset
   F800                    5864 RESET:
   F800 0F            [ 2] 5865         sei                     ; disable interrupts
   F801 86 03         [ 2] 5866         ldaa    #0x03
   F803 B7 10 24      [ 4] 5867         staa    TMSK2           ; disable irqs, set prescaler to 16
   F806 86 80         [ 2] 5868         ldaa    #0x80
   F808 B7 10 22      [ 4] 5869         staa    TMSK1           ; enable OC1 irq
   F80B 86 00         [ 2] 5870         ldaa    #0x00
   F80D B7 10 35      [ 4] 5871         staa    BPROT           ; protect ????
   F810 96 07         [ 3] 5872         ldaa    0x0007          ;
   F812 81 DB         [ 2] 5873         cmpa    #0xDB           ; special unprotect mode???
   F814 26 06         [ 3] 5874         bne     LF81C           ; if not, jump ahead
   F816 7F 10 35      [ 6] 5875         clr     BPROT           ; else unprotect everything
   F819 7F 00 07      [ 6] 5876         clr     0x0007          ; reset special unprotect mode???
   F81C                    5877 LF81C:
   F81C 8E 01 FF      [ 3] 5878         lds     #0x01FF         ; init SP
   F81F 86 A5         [ 2] 5879         ldaa    #0xA5
   F821 B7 10 5D      [ 4] 5880         staa    CSCTL           ; enable external IO:
                           5881                                 ; IO1EN,  BUSSEL, active LOW
                           5882                                 ; IO2EN,  PIA/SCCSEL, active LOW
                           5883                                 ; CSPROG, ROMSEL priority over RAMSEL 
                           5884                                 ; CSPROG, ROMSEL enabled, 32K, $8000-$FFFF
   F824 86 01         [ 2] 5885         ldaa    #0x01
   F826 B7 10 5F      [ 4] 5886         staa    CSGSIZ          ; CSGEN,  RAMSEL active low
                           5887                                 ; CSGEN,  RAMSEL 32K
   F829 86 00         [ 2] 5888         ldaa    #0x00
   F82B B7 10 5E      [ 4] 5889         staa    CSGADR          ; CSGEN,  RAMSEL = $0000-$7FFF (except internal regs)
   F82E 86 F0         [ 2] 5890         ldaa    #0xF0
   F830 B7 10 5C      [ 4] 5891         staa    CSSTRH          ; 3 cycle clock stretching on BUSSEL and LCRS
   F833 7F 00 00      [ 6] 5892         clr     0x0000          ; ????? Done with basic init?
                           5893 
                           5894 ; Initialize Main PIA
   F836 86 30         [ 2] 5895         ldaa    #0x30           ;
   F838 B7 18 05      [ 4] 5896         staa    PIA0CRA         ; control register A, CA2=0, sel DDRA
   F83B B7 18 07      [ 4] 5897         staa    PIA0CRB         ; control register B, CB2=0, sel DDRB
   F83E 86 FF         [ 2] 5898         ldaa    #0xFF
   F840 B7 18 06      [ 4] 5899         staa    PIA0DDRB        ; select B0-B7 to be outputs
   F843 86 78         [ 2] 5900         ldaa    #0x78           ;
   F845 B7 18 04      [ 4] 5901         staa    PIA0DDRA        ; select A3-A6 to be outputs
   F848 86 34         [ 2] 5902         ldaa    #0x34           ;
   F84A B7 18 05      [ 4] 5903         staa    PIA0CRA         ; select output register A
   F84D B7 18 07      [ 4] 5904         staa    PIA0CRB         ; select output register B
   F850 C6 FF         [ 2] 5905         ldab    #0xFF
   F852 BD FA F9      [ 6] 5906         jsr     BUTNLIT         ; turn on all button lights
   F855 20 13         [ 3] 5907         bra     LF86A           ; jump past data table
                           5908 
                           5909 ; data table for aux serial config
   F857                    5910 LF857:
   F857 09 4A              5911         .byte   0x09,0x4a       ; channel reset B, MIE off, DLC on, no vector
   F859 01 10              5912         .byte   0x01,0x10       ; irq on all character received
   F85B 0C 18              5913         .byte   0x0c,0x18       ; Lower byte of time constant
   F85D 0D 00              5914         .byte   0x0d,0x00       ; Upper byte of time constant
   F85F 04 44              5915         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   F861 0E 63              5916         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   F863 05 68              5917         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   F865 0B 56              5918         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   F867 03 C1              5919         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           5920         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           5921         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   F869 FF                 5922         .byte   0xff            ; end of table marker
                           5923 
                           5924 ; init SCC (8530), aux serial config
   F86A                    5925 LF86A:
   F86A CE F8 57      [ 3] 5926         ldx     #LF857
   F86D                    5927 LF86D:
   F86D A6 00         [ 4] 5928         ldaa    0,X
   F86F 81 FF         [ 2] 5929         cmpa    #0xFF
   F871 27 06         [ 3] 5930         beq     LF879
   F873 B7 18 0D      [ 4] 5931         staa    SCCCTRLA
   F876 08            [ 3] 5932         inx
   F877 20 F4         [ 3] 5933         bra     LF86D
                           5934 
                           5935 ; Setup normal SCI, 8 data bits, 1 stop bit
                           5936 ; Interrupts disabled, Transmitter and Receiver enabled
                           5937 ; prescaler = /13, SCR=/2, rate = 9600 baud at 16Mhz clock
                           5938 
   F879                    5939 LF879:
   F879 86 00         [ 2] 5940         ldaa    #0x00
   F87B B7 10 2C      [ 4] 5941         staa    SCCR1
   F87E 86 0C         [ 2] 5942         ldaa    #0x0C
   F880 B7 10 2D      [ 4] 5943         staa    SCCR2
   F883 86 30         [ 2] 5944         ldaa    #0x30           ; NEW value
   F885 B7 10 2B      [ 4] 5945         staa    BAUD
                           5946 
                           5947 ; Initialize all RAM vectors to RTI: 
                           5948 ; Opcode 0x3b into vectors at 0x0100 through 0x0139
                           5949 
   F888 CE 01 00      [ 3] 5950         ldx     #0x0100
   F88B 86 3B         [ 2] 5951         ldaa    #0x3B           ; RTI opcode
   F88D                    5952 LF88D:
   F88D A7 00         [ 4] 5953         staa    0,X
   F88F 08            [ 3] 5954         inx
   F890 08            [ 3] 5955         inx
   F891 08            [ 3] 5956         inx
   F892 8C 01 3C      [ 4] 5957         cpx     #0x013C
   F895 25 F6         [ 3] 5958         bcs     LF88D
   F897 C6 F0         [ 2] 5959         ldab    #0xF0
   F899 F7 18 04      [ 4] 5960         stab    PIA0PRA         ; enable LCD backlight, disable RESET button light
   F89C 86 7E         [ 2] 5961         ldaa    #0x7E
   F89E 97 03         [ 3] 5962         staa    (0x0003)        ; Put a jump instruction here???
                           5963 
                           5964 ; Non-destructive ram test:
                           5965 ;
                           5966 ; HC11 Internal RAM: 0x0000-0x3ff
                           5967 ; External NVRAM:    0x2000-0x7fff
                           5968 ;
                           5969 ; Note:
                           5970 ; External NVRAM:    0x0400-0xfff is also available, but not tested
                           5971 
   F8A0 CE 00 00      [ 3] 5972         ldx     #0x0000
   F8A3                    5973 LF8A3:
   F8A3 E6 00         [ 4] 5974         ldab    0,X             ; save value
   F8A5 86 55         [ 2] 5975         ldaa    #0x55
   F8A7 A7 00         [ 4] 5976         staa    0,X
   F8A9 A1 00         [ 4] 5977         cmpa    0,X
   F8AB 26 19         [ 3] 5978         bne     LF8C6
   F8AD 49            [ 2] 5979         rola
   F8AE A7 00         [ 4] 5980         staa    0,X
   F8B0 A1 00         [ 4] 5981         cmpa    0,X
   F8B2 26 12         [ 3] 5982         bne     LF8C6
   F8B4 E7 00         [ 4] 5983         stab    0,X             ; restore value
   F8B6 08            [ 3] 5984         inx
   F8B7 8C 04 00      [ 4] 5985         cpx     #0x0400
   F8BA 26 03         [ 3] 5986         bne     LF8BF
   F8BC CE 20 00      [ 3] 5987         ldx     #0x2000
   F8BF                    5988 LF8BF:  
   F8BF 8C 80 00      [ 4] 5989         cpx     #0x8000
   F8C2 26 DF         [ 3] 5990         bne     LF8A3
   F8C4 20 04         [ 3] 5991         bra     LF8CA
                           5992 
   F8C6                    5993 LF8C6:
   F8C6 86 01         [ 2] 5994         ldaa    #0x01           ; Mark Failed RAM test
   F8C8 97 00         [ 3] 5995         staa    (0x0000)
                           5996 ; 
   F8CA                    5997 LF8CA:
   F8CA C6 01         [ 2] 5998         ldab    #0x01
   F8CC BD FA C9      [ 6] 5999         jsr     DIAGDGT         ; write digit 1 to diag display
   F8CF B6 10 35      [ 4] 6000         ldaa    BPROT  
   F8D2 26 0F         [ 3] 6001         bne     LF8E3           ; if something is protected, jump ahead
   F8D4 B6 30 00      [ 4] 6002         ldaa    (0x3000)        ; NVRAM
   F8D7 81 7E         [ 2] 6003         cmpa    #0x7E
   F8D9 26 08         [ 3] 6004         bne     LF8E3           ; if RAM(0x3000) == 0x7E, jump ahead anyway (special unlock?)
                           6005 
                           6006 ; error?
   F8DB C6 0E         [ 2] 6007         ldab    #0x0E
   F8DD BD FA C9      [ 6] 6008         jsr     DIAGDGT         ; write digit E to diag display
   F8E0 7E 30 00      [ 3] 6009         jmp     (0x3000)        ; jump to routine in NVRAM?
                           6010 
                           6011 ; checking for serial connection
                           6012 
   F8E3                    6013 LF8E3:
   F8E3 CE F0 00      [ 3] 6014         ldx     #0xF000         ; timeout counter
   F8E6                    6015 LF8E6:
   F8E6 01            [ 2] 6016         nop
   F8E7 01            [ 2] 6017         nop
   F8E8 09            [ 3] 6018         dex
   F8E9 27 0B         [ 3] 6019         beq     LF8F6           ; if time is up, jump ahead
   F8EB BD FA 79      [ 6] 6020         jsr     SERIALR         ; else read serial data if available
   F8EE 24 F6         [ 3] 6021         bcc     LF8E6           ; if no data available, loop
   F8F0 81 1B         [ 2] 6022         cmpa    #0x1B           ; if serial data was read, is it an ESC?
   F8F2 27 3B         [ 3] 6023         beq     LF91D           ; if so, jump to echo hex char routine?
   F8F4 20 F0         [ 3] 6024         bra     LF8E6           ; else loop
   F8F6                    6025 LF8F6:
   F8F6 B6 40 00      [ 4] 6026         ldaa    0x4000          ; NEW
   F8F9 81 7E         [ 2] 6027         cmpa    #0x7E        
   F8FB 26 0B         [ 3] 6028         bne     LF908N
                           6029 
   F8FD C6 0A         [ 2] 6030         ldab    #0x0A
   F8FF BD FA C9      [ 6] 6031         jsr     DIAGDGT         ; else write digit A to diag display
                           6032 
   F902 BD 40 00      [ 6] 6033         jsr     0x4000          ; NEW - jump to ????
   F905 0F            [ 2] 6034         sei                     ; if we ever come return, just loop and do it all again
   F906 20 27         [ 3] 6035         bra     LF91D
   F908                    6036 LF908N:
   F908 B6 80 00      [ 4] 6037         ldaa    L8000           ; check if this is a regular rom?
   F90B 81 7E         [ 2] 6038         cmpa    #0x7E        
   F90D 26 0B         [ 3] 6039         bne     MINIMON
                           6040 
                           6041 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6042 
   F90F C6 0A         [ 2] 6043         ldab    #0x0A           ; NEW - ??
   F911 BD FA C9      [ 6] 6044         jsr     DIAGDGT         ; NEW - A to display?
   F914 BD 80 00      [ 6] 6045         jsr     0x8000          ; NEW
   F917 0F            [ 2] 6046         sei                     ; NEW
   F918 20 15         [ 3] 6047         bra     LF91D           ; NEW
                           6048 
   F91A                    6049 MINIMON:
   F91A C6 10         [ 2] 6050         ldab    #0x10           ; not a regular rom
   F91C BD FA C9      [ 6] 6051         jsr     DIAGDGT         ; blank the diag display
                           6052 
   F91F BD FB 0C      [ 6] 6053         jsr     SERMSGW         ; enter the mini-monitor???
   F922 4D 49 4E 49 2D 4D  6054         .ascis  'MINI-MON'
        4F CE
                           6055 
   F92A C6 10         [ 2] 6056         ldab    #0x10
   F92C BD FA C9      [ 6] 6057         jsr     DIAGDGT         ; blank the diag display
                           6058 
   F92F                    6059 LF91D:
   F92F 7F 00 05      [ 6] 6060         clr     (0x0005)
   F932 7F 00 04      [ 6] 6061         clr     (0x0004)
   F935 7F 00 02      [ 6] 6062         clr     (0x0002)
   F938 7F 00 06      [ 6] 6063         clr     (0x0006)
                           6064 
   F93B BD FB 0C      [ 6] 6065         jsr     SERMSGW
   F93E 0D 0A BE           6066         .ascis  '\r\n>'
                           6067 
                           6068 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6069 
                           6070 ; NEW - All new code here
   F941                    6071 LF941N:
   F941 BD FA BB      [ 6] 6072         jsr     LF987
   F944 97 01         [ 3] 6073         staa    (0x0001)
   F946 81 30         [ 2] 6074         cmpa    #0x30
   F948 25 3B         [ 3] 6075         bcs     LF985N
   F94A 81 39         [ 2] 6076         cmpa    #0x39
   F94C 22 0D         [ 3] 6077         bhi     LF95BN
   F94E                    6078 LF94EN:
   F94E 48            [ 2] 6079         asla
   F94F 48            [ 2] 6080         asla
   F950 48            [ 2] 6081         asla
   F951 48            [ 2] 6082         asla
   F952 C6 04         [ 2] 6083         ldab    #0x04
   F954 7D 00 02      [ 6] 6084         tst     (0x0002)
   F957 2A 0E         [ 3] 6085         bpl     LF967N
   F959 2B 18         [ 3] 6086         bmi     LF973N
   F95B                    6087 LF95BN:
   F95B 81 41         [ 2] 6088         cmpa    #0x41
   F95D 25 26         [ 3] 6089         bcs     LF985N
   F95F 81 47         [ 2] 6090         cmpa    #0x47
   F961 24 22         [ 3] 6091         bcc     LF985N
   F963 80 37         [ 2] 6092         suba    #0x37
   F965 20 E7         [ 3] 6093         bra     LF94EN
   F967                    6094 LF967N:
   F967 49            [ 2] 6095         rola
   F968 79 00 05      [ 6] 6096         rol     (0x0005)
   F96B 79 00 04      [ 6] 6097         rol     (0x0004)
   F96E 5A            [ 2] 6098         decb
   F96F 26 F6         [ 3] 6099         bne     LF967N
   F971 27 0B         [ 3] 6100         beq     LF97EN
   F973                    6101 LF973N:
   F973 49            [ 2] 6102         rola
   F974 79 00 06      [ 6] 6103         rol     0x0006
   F977 5A            [ 2] 6104         decb
   F978 26 F9         [ 3] 6105         bne     LF973N
   F97A 86 C0         [ 2] 6106         ldaa    #0xC0
   F97C 97 02         [ 3] 6107         staa    0x0002
   F97E                    6108 LF97EN:
   F97E 96 01         [ 3] 6109         ldaa    0x0001
   F980                    6110 LF980N:
   F980 BD FA A3      [ 6] 6111         jsr     SERIALW
   F983 20 BC         [ 3] 6112         bra     LF941N
   F985                    6113 LF985N:
   F985 81 3A         [ 2] 6114         cmpa    #0x3A
   F987 26 06         [ 3] 6115         bne     LF98FN
   F989 C6 80         [ 2] 6116         ldab    #0x80
   F98B D7 02         [ 3] 6117         stab    0x0002
   F98D 20 F1         [ 3] 6118         bra     LF980N
   F98F                    6119 LF98FN:
   F98F 81 47         [ 2] 6120         cmpa    #0x47
   F991 26 08         [ 3] 6121         bne     LF99BN
   F993 BD FA A3      [ 6] 6122         jsr     SERIALW
   F996 9D 03         [ 5] 6123         jsr     0x0003
   F998 7E F9 2F      [ 3] 6124         jmp     LF91D
   F99B                    6125 LF99BN:
   F99B 81 2F         [ 2] 6126         cmpa    #0x2F
   F99D 26 0D         [ 3] 6127         bne     LF9ACN
   F99F 20 1C         [ 3] 6128         bra     LF9BDN
   F9A1                    6129 LF9A1N:
   F9A1 BD FA A3      [ 6] 6130         jsr     SERIALW
   F9A4 BD F9 D9      [ 6] 6131         jsr     LF9D9N
   F9A7 7F 00 02      [ 6] 6132         clr     0x0002
   F9AA 20 95         [ 3] 6133         bra     LF941N
   F9AC                    6134 LF9ACN:
   F9AC 81 2E         [ 2] 6135         cmpa    #0x2E
   F9AE 26 14         [ 3] 6136         bne     LF9C4N
   F9B0 86 5E         [ 2] 6137         ldaa    #0x5E
   F9B2 BD FA A3      [ 6] 6138         jsr     SERIALW
   F9B5 7C 00 05      [ 6] 6139         inc     0x0005
   F9B8 26 03         [ 3] 6140         bne     LF9BDN
   F9BA 7C 00 04      [ 6] 6141         inc     0x0004
   F9BD                    6142 LF9BDN:
   F9BD BD FA 6C      [ 6] 6143         jsr     LFA6CN
   F9C0 86 2F         [ 2] 6144         ldaa    #0x2F
   F9C2 20 DD         [ 3] 6145         bra     LF9A1N
   F9C4                    6146 LF9C4N:
   F9C4 81 2C         [ 2] 6147         cmpa    #0x2C
   F9C6 26 2D         [ 3] 6148         bne     LF9F5N
   F9C8 86 21         [ 2] 6149         ldaa    #0x21
   F9CA BD FA A3      [ 6] 6150         jsr     SERIALW
   F9CD 96 05         [ 3] 6151         ldaa    0x0005
   F9CF 26 03         [ 3] 6152         bne     LF9D4N
   F9D1 7A 00 04      [ 6] 6153         dec     0x0004
   F9D4                    6154 LF9D4N:
   F9D4 7A 00 05      [ 6] 6155         dec     0x0005
   F9D7 20 E4         [ 3] 6156         bra     LF9BDN
   F9D9                    6157 LF9D9N:
   F9D9 18 DE 04      [ 5] 6158         ldy     0x0004
   F9DC 18 A6 00      [ 5] 6159         ldaa    0,Y
                           6160 
                           6161 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6162 
                           6163 ; convert A to 2 hex digits and transmit
   F9DF                    6164 SERHEXW:
   F9DF 36            [ 3] 6165         psha
   F9E0 44            [ 2] 6166         lsra
   F9E1 44            [ 2] 6167         lsra
   F9E2 44            [ 2] 6168         lsra
   F9E3 44            [ 2] 6169         lsra
   F9E4 BD F9 E8      [ 6] 6170         jsr     LF938
   F9E7 32            [ 4] 6171         pula
   F9E8                    6172 LF938:
   F9E8 84 0F         [ 2] 6173         anda    #0x0F
   F9EA 8A 30         [ 2] 6174         oraa    #0x30
   F9EC 81 3A         [ 2] 6175         cmpa    #0x3A
   F9EE 25 02         [ 3] 6176         bcs     LF942
   F9F0 8B 07         [ 2] 6177         adda    #0x07
   F9F2                    6178 LF942:
   F9F2 7E FA A3      [ 3] 6179         jmp     SERIALW
                           6180 
                           6181 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6182 
                           6183 ; NEW - - All new code here
   F9F5                    6184 LF9F5N:
   F9F5 81 0D         [ 2] 6185         cmpa    #0x0D
   F9F7 26 20         [ 3] 6186         bne     LFA19N
   F9F9 4F            [ 2] 6187         clra
   F9FA                    6188 LF9FAN:
   F9FA D6 02         [ 3] 6189         ldab    0x0002
   F9FC C4 40         [ 2] 6190         andb    #0x40
   F9FE 97 02         [ 3] 6191         staa    0x0002
   FA00 5D            [ 2] 6192         tstb
   FA01 27 10         [ 3] 6193         beq     LFA13N
   FA03 96 06         [ 3] 6194         ldaa    0x0006
   FA05 18 DE 04      [ 5] 6195         ldy     0x0004
   FA08 18 A7 00      [ 5] 6196         staa    0,Y
   FA0B 7C 00 05      [ 6] 6197         inc     0x0005
   FA0E 26 03         [ 3] 6198         bne     LFA13N
   FA10 7C 00 04      [ 6] 6199         inc     0x0004
   FA13                    6200 LFA13N:
   FA13 7F 00 06      [ 6] 6201         clr     0x0006
   FA16 7E F9 7E      [ 3] 6202         jmp     LF97EN
   FA19                    6203 LFA19N:
   FA19 81 20         [ 2] 6204         cmpa    #0x20
   FA1B 26 04         [ 3] 6205         bne     LFA21N
   FA1D 86 80         [ 2] 6206         ldaa    #0x80
   FA1F 20 D9         [ 3] 6207         bra     LF9FAN
   FA21                    6208 LFA21N:
   FA21 81 0A         [ 2] 6209         cmpa    #0x0A
   FA23 26 03         [ 3] 6210         bne     LFA28N
   FA25 7E F9 2F      [ 3] 6211         jmp     LF91D
   FA28                    6212 LFA28N:
   FA28 81 57         [ 2] 6213         cmpa    #0x57
   FA2A 26 08         [ 3] 6214         bne     LFA34N
   FA2C BD FB 0C      [ 6] 6215         jsr     SERMSGW
   FA2F 57 4F 4F 46 A1     6216         .ascis  'WOOF!'
   FA34                    6217 LFA34N:
   FA34 81 4C         [ 2] 6218         cmpa    #0x4C
   FA36 26 2F         [ 3] 6219         bne     LFA67N
   FA38 BD FA A9      [ 6] 6220         jsr     LF975
   FA3B                    6221 LFA3BN:
   FA3B CE 00 00      [ 3] 6222         ldx     #0x0000
   FA3E BD FA 6F      [ 6] 6223         jsr     LFA6FN
   FA41 86 3A         [ 2] 6224         ldaa    #0x3A
   FA43 BD FA A3      [ 6] 6225         jsr     SERIALW
   FA46                    6226 LFA46N:
   FA46 BD F9 D9      [ 6] 6227         jsr     LF9D9N
   FA49 86 20         [ 2] 6228         ldaa    #0x20
   FA4B 08            [ 3] 6229         inx
   FA4C 8C 00 10      [ 4] 6230         cpx     #0x0010
   FA4F 25 02         [ 3] 6231         bcs     LFA53N
   FA51 86 0D         [ 2] 6232         ldaa    #0x0D
   FA53                    6233 LFA53N:
   FA53 7C 00 05      [ 6] 6234         inc     0x0005
   FA56 26 03         [ 3] 6235         bne     LFA5BN
   FA58 7C 00 04      [ 6] 6236         inc     0x0004
   FA5B                    6237 LFA5BN:
   FA5B BD FA A3      [ 6] 6238         jsr     SERIALW
   FA5E 81 20         [ 2] 6239         cmpa    #0x20
   FA60 27 E4         [ 3] 6240         beq     LFA46N
   FA62 BD FA 79      [ 6] 6241         jsr     SERIALR
   FA65 24 D4         [ 3] 6242         bcc     LFA3BN
   FA67                    6243 LFA67N:
   FA67 86 07         [ 2] 6244         ldaa    #0x07
   FA69 7E F9 80      [ 3] 6245         jmp     LF980N
   FA6C                    6246 LFA6CN:
   FA6C BD FA A9      [ 6] 6247         jsr     LF975
   FA6F                    6248 LFA6FN:
   FA6F 96 04         [ 3] 6249         ldaa    0x0004
   FA71 BD F9 DF      [ 6] 6250         jsr     SERHEXW
   FA74 96 05         [ 3] 6251         ldaa    0x0005
   FA76 7E F9 DF      [ 3] 6252         jmp     SERHEXW
                           6253 
                           6254 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6255 
                           6256 ; serial read non-blocking
   FA79                    6257 SERIALR:
   FA79 B6 10 2E      [ 4] 6258         ldaa    SCSR  
   FA7C 85 20         [ 2] 6259         bita    #0x20
   FA7E 26 09         [ 3] 6260         bne     LF955
   FA80 0C            [ 2] 6261         clc
   FA81 39            [ 5] 6262         rts
                           6263 
                           6264 ; serial blocking read
   FA82                    6265 SERBLKR:
   FA82 B6 10 2E      [ 4] 6266         ldaa    SCSR            ; read serial status
   FA85 85 20         [ 2] 6267         bita    #0x20
   FA87 27 F9         [ 3] 6268         beq     SERBLKR         ; if RDRF=0, loop
                           6269 
                           6270 ; read serial data, (assumes it's ready)
   FA89                    6271 LF955:
   FA89 B6 10 2E      [ 4] 6272         ldaa    SCSR            ; read serial status
   FA8C 85 02         [ 2] 6273         bita    #0x02
   FA8E 26 09         [ 3] 6274         bne     LF965           ; if FE=1, clear it
   FA90 85 08         [ 2] 6275         bita    #0x08
   FA92 26 05         [ 3] 6276         bne     LF965           ; if OR=1, clear it
   FA94 B6 10 2F      [ 4] 6277         ldaa    SCDR            ; otherwise, good data
   FA97 0D            [ 2] 6278         sec
   FA98 39            [ 5] 6279         rts
                           6280 
   FA99                    6281 LF965:
   FA99 B6 10 2F      [ 4] 6282         ldaa    SCDR            ; clear any error
   FA9C 86 2F         [ 2] 6283         ldaa    #0x2F           ; '/'   
   FA9E BD FA A3      [ 6] 6284         jsr     SERIALW
   FAA1 20 DF         [ 3] 6285         bra     SERBLKR         ; go to wait for a character
                           6286 
                           6287 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6288 
                           6289 ; Send A to SCI with CR turned to CRLF
   FAA3                    6290 SERIALW:
   FAA3 81 0D         [ 2] 6291         cmpa    #0x0D           ; CR?
   FAA5 27 02         [ 3] 6292         beq     LF975           ; if so echo CR+LF
   FAA7 20 07         [ 3] 6293         bra     SERRAWW         ; else just echo it
   FAA9                    6294 LF975:
   FAA9 86 0D         [ 2] 6295         ldaa    #0x0D
   FAAB BD FA B0      [ 6] 6296         jsr     SERRAWW
   FAAE 86 0A         [ 2] 6297         ldaa    #0x0A
                           6298 
                           6299 ; send a char to SCI
   FAB0                    6300 SERRAWW:
   FAB0 F6 10 2E      [ 4] 6301         ldab    SCSR            ; wait for ready to send
   FAB3 C5 40         [ 2] 6302         bitb    #0x40
   FAB5 27 F9         [ 3] 6303         beq     SERRAWW
   FAB7 B7 10 2F      [ 4] 6304         staa    SCDR            ; send it
   FABA 39            [ 5] 6305         rts
                           6306 
                           6307 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6308 
   FABB                    6309 LF987:
   FABB BD FA 82      [ 6] 6310         jsr     SERBLKR         ; get a serial char
   FABE 81 7A         [ 2] 6311         cmpa    #0x7A           ;'z'
   FAC0 22 06         [ 3] 6312         bhi     LF994
   FAC2 81 61         [ 2] 6313         cmpa    #0x61           ;'a'
   FAC4 25 02         [ 3] 6314         bcs     LF994
   FAC6 82 20         [ 2] 6315         sbca    #0x20           ;convert to upper case?
   FAC8                    6316 LF994:
   FAC8 39            [ 5] 6317         rts
                           6318 
                           6319 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6320 
                           6321 ; Write hex digit arg in B to diagnostic lights
                           6322 ; or B=0x10 or higher for blank
                           6323 
   FAC9                    6324 DIAGDGT:
   FAC9 36            [ 3] 6325         psha
   FACA C1 11         [ 2] 6326         cmpb    #0x11
   FACC 25 02         [ 3] 6327         bcs     LF99C
   FACE C6 10         [ 2] 6328         ldab    #0x10
   FAD0                    6329 LF99C:
   FAD0 CE FA E8      [ 3] 6330         ldx     #LF9B4
   FAD3 3A            [ 3] 6331         abx
   FAD4 A6 00         [ 4] 6332         ldaa    0,X
   FAD6 B7 18 06      [ 4] 6333         staa    PIA0PRB         ; write arg to local data bus
   FAD9 B6 18 04      [ 4] 6334         ldaa    PIA0PRA         ; read from Port A
   FADC 8A 20         [ 2] 6335         oraa    #0x20           ; bit 5 high
   FADE B7 18 04      [ 4] 6336         staa    PIA0PRA         ; write back to Port A
   FAE1 84 DF         [ 2] 6337         anda    #0xDF           ; bit 5 low
   FAE3 B7 18 04      [ 4] 6338         staa    PIA0PRA         ; write back to Port A
   FAE6 32            [ 4] 6339         pula
   FAE7 39            [ 5] 6340         rts
                           6341 
                           6342 ; 7 segment patterns - XGFEDCBA
   FAE8                    6343 LF9B4:
   FAE8 C0                 6344         .byte   0xc0            ; 0
   FAE9 F9                 6345         .byte   0xf9            ; 1
   FAEA A4                 6346         .byte   0xa4            ; 2
   FAEB B0                 6347         .byte   0xb0            ; 3
   FAEC 99                 6348         .byte   0x99            ; 4
   FAED 92                 6349         .byte   0x92            ; 5
   FAEE 82                 6350         .byte   0x82            ; 6
   FAEF F8                 6351         .byte   0xf8            ; 7
   FAF0 80                 6352         .byte   0x80            ; 8
   FAF1 90                 6353         .byte   0x90            ; 9
   FAF2 88                 6354         .byte   0x88            ; A 
   FAF3 83                 6355         .byte   0x83            ; b
   FAF4 C6                 6356         .byte   0xc6            ; C
   FAF5 A1                 6357         .byte   0xa1            ; d
   FAF6 86                 6358         .byte   0x86            ; E
   FAF7 8E                 6359         .byte   0x8e            ; F
   FAF8 FF                 6360         .byte   0xff            ; blank
                           6361 
                           6362 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6363 
                           6364 ; Write arg in B to Button Lights
   FAF9                    6365 BUTNLIT:
   FAF9 36            [ 3] 6366         psha
   FAFA F7 18 06      [ 4] 6367         stab    PIA0PRB         ; write arg to local data bus
   FAFD B6 18 04      [ 4] 6368         ldaa    PIA0PRA         ; read from Port A
   FB00 84 EF         [ 2] 6369         anda    #0xEF           ; bit 4 low
   FB02 B7 18 04      [ 4] 6370         staa    PIA0PRA         ; write back to Port A
   FB05 8A 10         [ 2] 6371         oraa    #0x10           ; bit 4 high
   FB07 B7 18 04      [ 4] 6372         staa    PIA0PRA         ; write this to Port A
   FB0A 32            [ 4] 6373         pula
   FB0B 39            [ 5] 6374         rts
                           6375 
                           6376 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6377 
                           6378 ; Send rom message via SCI
   FB0C                    6379 SERMSGW:
   FB0C 18 38         [ 6] 6380         puly
   FB0E                    6381 LF9DA:
   FB0E 18 A6 00      [ 5] 6382         ldaa    0,Y
   FB11 27 09         [ 3] 6383         beq     LF9E8           ; if zero terminated, return
   FB13 2B 0C         [ 3] 6384         bmi     LF9ED           ; if high bit set..do last char and return
   FB15 BD FA B0      [ 6] 6385         jsr     SERRAWW         ; else send char
   FB18 18 08         [ 4] 6386         iny
   FB1A 20 F2         [ 3] 6387         bra     LF9DA           ; and loop for next one
                           6388 
   FB1C                    6389 LF9E8:
   FB1C 18 08         [ 4] 6390         iny                     ; setup return address and return
   FB1E 18 3C         [ 5] 6391         pshy
   FB20 39            [ 5] 6392         rts
                           6393 
   FB21                    6394 LF9ED:
   FB21 84 7F         [ 2] 6395         anda    #0x7F           ; remove top bit
   FB23 BD FA B0      [ 6] 6396         jsr     SERRAWW         ; send char
   FB26 20 F4         [ 3] 6397         bra     LF9E8           ; and we're done
   FB28 39            [ 5] 6398         rts
                           6399 
   FB29                    6400 DORTS:
   FB29 39            [ 5] 6401         rts
   FB2A                    6402 DORTI:        
   FB2A 3B            [12] 6403         rti
                           6404 
                           6405 ; all 0xffs in this gap
                           6406 
   FFA0                    6407         .org    0xFFA0
                           6408 
   FFA0 7E FB 29      [ 3] 6409         jmp     DORTS
   FFA3 7E FB 29      [ 3] 6410         jmp     DORTS
   FFA6 7E FB 29      [ 3] 6411         jmp     DORTS
   FFA9 7E F9 DF      [ 3] 6412         jmp     SERHEXW
   FFAC 7E FB 0C      [ 3] 6413         jmp     SERMSGW      
   FFAF 7E FA 79      [ 3] 6414         jmp     SERIALR     
   FFB2 7E FA A3      [ 3] 6415         jmp     SERIALW      
   FFB5 7E F9 1A      [ 3] 6416         jmp     MINIMON
   FFB8 7E FA C9      [ 3] 6417         jmp     DIAGDGT 
   FFBB 7E FA F9      [ 3] 6418         jmp     BUTNLIT 
                           6419 
   FFBE FF                 6420        .byte    0xff
   FFBF FF                 6421        .byte    0xff
                           6422 
                           6423 ; Vectors
                           6424 
   FFC0 FB 2A              6425        .word   DORTI            ; Stub RTI
   FFC2 FB 2A              6426        .word   DORTI            ; Stub RTI
   FFC4 FB 2A              6427        .word   DORTI            ; Stub RTI
   FFC6 FB 2A              6428        .word   DORTI            ; Stub RTI
   FFC8 FB 2A              6429        .word   DORTI            ; Stub RTI
   FFCA FB 2A              6430        .word   DORTI            ; Stub RTI
   FFCC FB 2A              6431        .word   DORTI            ; Stub RTI
   FFCE FB 2A              6432        .word   DORTI            ; Stub RTI
   FFD0 FB 2A              6433        .word   DORTI            ; Stub RTI
   FFD2 FB 2A              6434        .word   DORTI            ; Stub RTI
   FFD4 FB 2A              6435        .word   DORTI            ; Stub RTI
                           6436 
   FFD6 01 00              6437         .word  0x0100           ; SCI
   FFD8 01 03              6438         .word  0x0103           ; SPI
   FFDA 01 06              6439         .word  0x0106           ; PA accum. input edge
   FFDC 01 09              6440         .word  0x0109           ; PA Overflow
                           6441 
   FFDE FB 2A              6442         .word  DORTI            ; Stub RTI
                           6443 
   FFE0 01 0C              6444         .word  0x010c           ; TI4O5
   FFE2 01 0F              6445         .word  0x010f           ; TOC4
   FFE4 01 12              6446         .word  0x0112           ; TOC3
   FFE6 01 15              6447         .word  0x0115           ; TOC2
   FFE8 01 18              6448         .word  0x0118           ; TOC1
   FFEA 01 1B              6449         .word  0x011b           ; TIC3
   FFEC 01 1E              6450         .word  0x011e           ; TIC2
   FFEE 01 21              6451         .word  0x0121           ; TIC1
   FFF0 01 24              6452         .word  0x0124           ; RTI
   FFF2 01 27              6453         .word  0x0127           ; ~IRQ
   FFF4 01 2A              6454         .word  0x012a           ; XIRQ
   FFF6 01 2D              6455         .word  0x012d           ; SWI
   FFF8 01 30              6456         .word  0x0130           ; ILLEGAL OPCODE
   FFFA 01 33              6457         .word  0x0133           ; COP Failure
   FFFC 01 36              6458         .word  0x0136           ; COP Clock Monitor Fail
                           6459 
   FFFE F8 00              6460         .word  RESET            ; Reset
                           6461 
