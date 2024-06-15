                              1 
                              2 ;;;;;;;;;;;;;;;;;;;;;
                              3 ; Cyberstar v1.6
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
                             36 ; Constants
                     197B    37 CHKSUM      .equ    0x197B
                             38 
                             39 ; RAM locations
                             40 
                     0010    41 T1NXT       .equ    0x0010      ; 0x0010/0x0011
                             42 
                             43 ; if not zero, these are decremented every 0.1 second by the timer 
                     001B    44 CDTIMR1     .equ    0x001b      ; 0x001b/0x001c
                     001D    45 CDTIMR2     .equ    0x001d      ; 0x001d/0x001e
                     001F    46 CDTIMR3     .equ    0x001f      ; 0x001f/0x0020
                     0021    47 CDTIMR4     .equ    0x0021      ; 0x0021/0x0022
                     0023    48 CDTIMR5     .equ    0x0023      ; 0x0023/0x0024
                             49 
                     0027    50 T30MS       .equ    0x0027      ; used to count t1 irqs for 30ms tasks
                             51 
                             52 ; offset counters
                     0070    53 OFFCNT1     .equ    0x0070
                     0071    54 OFFCNT2     .equ    0x0071
                     0072    55 OFFCNT3     .equ    0x0072
                     0073    56 OFFCNT4     .equ    0x0073
                     0074    57 OFFCNT5     .equ    0x0074
                             58 
                             59 ; bottom bit counts every other T1OC
                     00B0    60 TSCNT       .equ    0x00B0
                             61 
                             62 ; NVRAM locations
                             63 
                             64 ;           .equ    0x0400          ; 0x07 - CPU test at boot, others?
                             65 ;           .equ    0x0401          ; Rnd bits? (clears to 0x00)
                             66 ;           .equ    0x0402-0x0404   ; Reg digits (BCD)
                             67 ;           .equ    0x0405-0x0407   ; Liv digits (BCD)
                             68 ;           .equ    0x0408          ; 0x39 (rts) for CPU test?
                             69 
                     040B    70 CPYRTCS     .equ    0x040B          ; 0x040B/0x040C - copyright message checksum
                             71 ;           .equ    0x040D-0x040E   ; some counter? (600/65000?)
                     040F    72 ERASEFLG    .equ    0x040F          ; 0 = normal boot, 1 = erasing EEPROM
                             73 ;           .equ    0x0410-0x0411   ; some counter
                             74 ;           .equ    0x0412-0x0413   ; some counter
                             75 ;           .equ    0x0414-0x0415   ; counter - number of bad code validations
                             76 ;           .equ    0x0416-0x0417   ; counter - number of good code validations
                             77 ;           .equ    0x0418-0x0419   ; some counter
                             78 ;           .equ    0x041A-0x041B   ; some counter
                             79 
                             80 ;           .equ    0x0420-0x0421   ; some counter
                             81 ;           .equ    0x0422-0x0423   ; some counter
                             82 ;           .equ    0x0424-0x0425   ; some counter
                     0426    83 NUMBOOT     .equ    0x0426          ; counter - number of boots (0x0426/0x0427)
                             84 
                             85 ;           .equ    0x042A          ; King enable (bit 0?)
                             86 ;           .equ    0x042B          ; other Rnd? (clears to 0x00)
                             87 ;           .equ    0x042C-0x45B?   ; clears to 0xFF (revalid tapes?)
                             88 ;                                   ; relates to 0x0299-0x29B?
                             89 ;           .equ    0x045C          ; 00 from F7C0 stored here, R12/CNR?
                             90 
                             91 ;           .equ    0x0500-0x057F   ; LCD buffer: 32, 4-byte entries
                             92 
                             93 ;           .equ    0x0590-0x0598   ; buffer?
                             94 ;           .equ    0x05A0-         ; buffer?
                             95 
                             96 ;           .equ    0x2000-         ; STUDIO - programming mode ?
                             97 ;           .equ    0x3000-         ; ???
                             98 
                             99 ; EEPROM locations
                            100 
                            101 ;           .equ    0x0E00-0x0E0B   ; signature?
                            102 
                            103 ;           .equ    0x0E20-0x0E24   ; 4 bcd digit serial number + 0xDB
                            104 
                            105 ; Main PIA on CPU card
                     1804   106 PIA0PRA     .equ    0x1804      ; CRA-2 = 1
                     1804   107 PIA0DDRA    .equ    0x1804      ; CRA-2 = 0
                     1805   108 PIA0CRA     .equ    0x1805
                     1806   109 PIA0PRB     .equ    0x1806      ; CRB-2 = 1
                     1806   110 PIA0DDRB    .equ    0x1806      ; CRB-2 = 0
                     1807   111 PIA0CRB     .equ    0x1807
                            112 
                            113 ; Zilog 8530 SCC - A is aux serial, B is sync data
                     180C   114 SCCCTRLB    .equ    0x180C
                     180D   115 SCCCTRLA    .equ    0x180D
                     180E   116 SCCDATAB    .equ    0x180E
                     180F   117 SCCDATAA    .equ    0x180F
                            118 
                            119         .area   region1 (ABS)
   8000                     120         .org    0x8000
                            121 
                            122 ; Disassembly originally from unidasm
                            123 
   8000                     124 L8000:
   8000 7E 80 50      [ 3]  125         jmp     L8050           ; jump past copyright message
                            126 
   8003                     127 CPYRTMSG:
   8003 43 6F 70 79 72 69   128         .ascii  'Copyright (c) 1993 by David B. Philipsen Licensed by ShowBiz Pizza Time, Inc.'
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
                            129 
   8050                     130 L8050:
   8050 0F            [ 2]  131         sei
                            132 
   8051 FC 04 26      [ 5]  133         ldd     NUMBOOT         ; increment boot cycle counter?
   8054 C3 00 01      [ 4]  134         addd    #0x0001
   8057 FD 04 26      [ 5]  135         std     NUMBOOT
                            136 
   805A CE AD 1D      [ 3]  137         ldx     #TASK2          ;
   805D FF 01 CE      [ 5]  138         stx     (0x01CE)        ; store this vector here?
   8060 7F 01 C7      [ 6]  139         clr     (0x01C7)        ; clear this vector?
   8063 CC 01 C6      [ 3]  140         ldd     #0x01C6         ;
   8066 FD 01 3E      [ 5]  141         std     (0x013E)        ; store this vector here? Some sort of RTI setup
   8069 7F 00 B0      [ 6]  142         clr     TSCNT
   806C 7F 00 4E      [ 6]  143         clr     (0x004E)
   806F 7F 00 B6      [ 6]  144         clr     (0x00B6)
   8072 7F 00 4D      [ 6]  145         clr     (0x004D)
   8075 86 03         [ 2]  146         ldaa    #0x03           ; ddr mode, enable CA1 L->H irq on
   8077 B7 10 A8      [ 4]  147         staa    (0x10A8)        ;   board 11
   807A 18 CE 00 80   [ 4]  148         ldy     #0x0080         ; delay loop
   807E                     149 L807E:
   807E 18 09         [ 4]  150         dey
   8080 26 FC         [ 3]  151         bne     L807E
   8082 86 11         [ 2]  152         ldaa    #0x11           ; ddr mode, enable CA1 H->L irq on
   8084 B7 10 A8      [ 4]  153         staa    (0x10A8)        ;   board 11
                            154 
   8087 C6 10         [ 2]  155         ldab    #0x10
   8089 BD F9 95      [ 6]  156         jsr     DIAGDGT         ; blank the diag display
                            157 
   808C B6 18 04      [ 4]  158         ldaa    PIA0PRA         ; turn off reset button light
   808F 84 BF         [ 2]  159         anda    #0xBF
   8091 B7 18 04      [ 4]  160         staa    PIA0PRA 
   8094 86 FF         [ 2]  161         ldaa    #0xFF
   8096 97 AC         [ 3]  162         staa    (0x00AC)        ; diagnostic indicator (all off)
                            163 
   8098 BD 86 C4      [ 6]  164         jsr     L86C4           ; Reset boards 1-10
   809B BD 99 A6      [ 6]  165         jsr     L99A6           ; do some stuff with diag digit??
   809E BD 8C 3C      [ 6]  166         jsr     L8C3C           ; reset LCD?
   80A1 BD 87 E8      [ 6]  167         jsr     L87E8           ; SCC - init aux serial
   80A4 BD 87 BC      [ 6]  168         jsr     L87BC           ; SCC - init sync data
   80A7 BD 8C 7E      [ 6]  169         jsr     L8C7E           ; reset LCD buffer
   80AA BD 8D 29      [ 6]  170         jsr     L8D29           ; some LCD command? (0C?)
   80AD BD 8B C0      [ 6]  171         jsr     L8BC0           ; setup Timer/SWI handlers
   80B0 BD 8B EE      [ 6]  172         jsr     L8BEE           ; ??? redundant?
   80B3 0E            [ 2]  173         cli
   80B4 BD A2 5E      [ 6]  174         jsr     LA25E           ; compute and store copyright checksum
   80B7 B6 04 0F      [ 4]  175         ldaa    ERASEFLG
   80BA 81 01         [ 2]  176         cmpa    #0x01           ; 1 means erase EEPROM!
   80BC 26 03         [ 3]  177         bne     L80C1
   80BE 7E A2 75      [ 3]  178         jmp     LA275           ; erase EEPROM: skipped if ERASEFLG !=1
   80C1                     179 L80C1:
   80C1 FC 04 0B      [ 5]  180         ldd     CPYRTCS         ; copyright checksum
   80C4 1A 83 19 7B   [ 5]  181         cpd     #CHKSUM         ; check against copyright checksum value
   80C8 26 4F         [ 3]  182         bne     LOCKUP          ; if fail, bye bye
   80CA 5F            [ 2]  183         clrb
   80CB D7 62         [ 3]  184         stab    (0x0062)        ; button light buffer?
   80CD BD F9 C5      [ 6]  185         jsr     BUTNLIT         ; turn off all button lights
   80D0 BD A3 41      [ 6]  186         jsr     LA341           ; close curtains - fire 3 bits on board 2
   80D3 B6 04 00      [ 4]  187         ldaa    (0x0400)
   80D6 81 07         [ 2]  188         cmpa    #0x07
   80D8 27 42         [ 3]  189         beq     L811C           ; if 7, go directly to CPU test
   80DA 25 29         [ 3]  190         bcs     L8105           ; higher than 7, go to init setup, retaining L/R counts
   80DC 81 06         [ 2]  191         cmpa    #0x06
   80DE 27 25         [ 3]  192         beq     L8105           ; 6, go to init setup, retaining L/R counts
   80E0 CC 00 00      [ 3]  193         ldd     #0x0000         ; 5 or lower...
   80E3 FD 04 0D      [ 5]  194         std     (0x040D)        ; clear 040D/040E counter
   80E6 CC 00 C8      [ 3]  195         ldd     #0x00C8         ; wait up to 2 seconds for a serial byte
   80E9 DD 1B         [ 4]  196         std     CDTIMR1 
   80EB                     197 L80EB:
   80EB DC 1B         [ 4]  198         ldd     CDTIMR1
   80ED 27 0B         [ 3]  199         beq     L80FA           ; timeout
   80EF BD F9 45      [ 6]  200         jsr     SERIALR
   80F2 24 F7         [ 3]  201         bcc     L80EB
   80F4 81 44         [ 2]  202         cmpa    #0x44           ; if it's a 'D', do init setup + reset L/R counts
   80F6 26 F3         [ 3]  203         bne     L80EB           ; else keep looping for 2 seconds
   80F8 20 05         [ 3]  204         bra     L80FF           ; go to init setup
   80FA                     205 L80FA:
   80FA BD 9F 1E      [ 6]  206         jsr     L9F1E
   80FD 25 1A         [ 3]  207         bcs     LOCKUP          ; bye bye
                            208 ; init setup + reset L and R counts
   80FF                     209 L80FF:
   80FF BD 9E AF      [ 6]  210         jsr     L9EAF           ; reset L counts
   8102 BD 9E 92      [ 6]  211         jsr     L9E92           ; reset R counts
                            212 ; init setup
   8105                     213 L8105:
   8105 86 39         [ 2]  214         ldaa    #0x39
   8107 B7 04 08      [ 4]  215         staa    0x0408          ; set rts here for later CPU test
   810A BD A1 D5      [ 6]  216         jsr     LA1D5           ; set 0400 to 7, reprogram EE sig if needed
   810D BD AB 17      [ 6]  217         jsr     LAB17           ; erase revalid tape section
   8110 B6 F7 C0      [ 4]  218         ldaa    LF7C0           ; a 00
   8113 B7 04 5C      [ 4]  219         staa    0x045C          ; set to R12 mode?
   8116 7E F8 00      [ 3]  220         jmp     RESET           ; reset!
                            221 
   8119 7E 81 19      [ 3]  222 LOCKUP: jmp     LOCKUP          ; infinite loop
                            223 
                            224 ; CPU test?
   811C                     225 L811C:
   811C 7F 00 79      [ 6]  226         clr     (0x0079)
   811F 7F 00 7C      [ 6]  227         clr     (0x007C)
   8122 BD 04 08      [ 6]  228         jsr     0x0408          ; rts should be here
   8125 BD 80 13      [ 6]  229         jsr     (0x8013)        ; rts is here '9'
   8128 C6 FD         [ 2]  230         ldab    #0xFD           ; tape deck STOP
   812A BD 86 E7      [ 6]  231         jsr     L86E7
   812D C6 DF         [ 2]  232         ldab    #0xDF
   812F BD 87 48      [ 6]  233         jsr     L8748   
   8132 BD 87 91      [ 6]  234         jsr     L8791   
   8135 BD 9A F7      [ 6]  235         jsr     L9AF7
   8138 BD 9C 51      [ 6]  236         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   813B 7F 00 62      [ 6]  237         clr     (0x0062)
   813E BD 99 D9      [ 6]  238         jsr     L99D9
   8141 24 16         [ 3]  239         bcc     L8159           ; if carry clear, test is passed
                            240 
   8143 BD 8D E4      [ 6]  241         jsr     LCDMSG1 
   8146 49 6E 76 61 6C 69   242         .ascis  'Invalid CPU!'
        64 20 43 50 55 A1
                            243 
   8152 86 53         [ 2]  244         ldaa    #0x53
   8154 7E 82 A4      [ 3]  245         jmp     L82A4
   8157 20 FE         [ 3]  246 L8157:  bra     L8157           ; infinite loop
                            247 
   8159                     248 L8159:
   8159 BD A3 54      [ 6]  249         jsr     LA354
   815C 7F 00 AA      [ 6]  250         clr     (0x00AA)
   815F 7D 00 00      [ 6]  251         tst     (0x0000)
   8162 27 15         [ 3]  252         beq     L8179
                            253 
   8164 BD 8D E4      [ 6]  254         jsr     LCDMSG1 
   8167 52 41 4D 20 74 65   255         .ascis  'RAM test failed!'
        73 74 20 66 61 69
        6C 65 64 A1
                            256 
   8177 20 44         [ 3]  257         bra     L81BD
                            258 
   8179                     259 L8179:
   8179 BD 8D E4      [ 6]  260         jsr     LCDMSG1 
   817C 33 32 4B 20 52 41   261         .ascis  '32K RAM OK'
        4D 20 4F CB
                            262 
                            263 ; R12 or CNR mode???
   8186 7D 04 5C      [ 6]  264         tst     (0x045C)        ; if this location is 0, good
   8189 26 08         [ 3]  265         bne     L8193
   818B CC 52 0F      [ 3]  266         ldd     #0x520F         ; else print 'R' on the far left of the first line
   818E BD 8D B5      [ 6]  267         jsr     L8DB5           ; display char here on LCD display
   8191 20 06         [ 3]  268         bra     L8199
   8193                     269 L8193:
   8193 CC 43 0F      [ 3]  270         ldd     #0x430F         ; print 'C' on the far left of the first line
   8196 BD 8D B5      [ 6]  271         jsr     L8DB5           ; display char here on LCD display
                            272 
   8199                     273 L8199:
   8199 BD 8D DD      [ 6]  274         jsr     LCDMSG2 
   819C 52 4F 4D 20 43 68   275         .ascis  'ROM Chksum='
        6B 73 75 6D BD
                            276 
   81A7 BD 97 5F      [ 6]  277         jsr     L975F           ; print the checksum on the LCD
                            278 
   81AA C6 02         [ 2]  279         ldab    #0x02           ; delay 2 secs
   81AC BD 8C 02      [ 6]  280         jsr     DLYSECS         ;
                            281 
   81AF BD 9A 27      [ 6]  282         jsr     L9A27           ; display Serial #
   81B2 BD 9E CC      [ 6]  283         jsr     L9ECC           ; display R and L counts
   81B5 BD 9B 19      [ 6]  284         jsr     L9B19           ; do the random motions if enabled
                            285 
   81B8 C6 02         [ 2]  286         ldab    #0x02           ; delay 2 secs
   81BA BD 8C 02      [ 6]  287         jsr     DLYSECS         ;
                            288 
   81BD                     289 L81BD:
   81BD F6 10 2D      [ 4]  290         ldab    SCCR2           ; disable SCI receive data interrupts
   81C0 C4 DF         [ 2]  291         andb    #0xDF
   81C2 F7 10 2D      [ 4]  292         stab    SCCR2
                            293 
   81C5 BD 9A F7      [ 6]  294         jsr     L9AF7           ; clear a bunch of ram
   81C8 C6 FD         [ 2]  295         ldab    #0xFD           ; tape deck STOP
   81CA BD 86 E7      [ 6]  296         jsr     L86E7           ;
   81CD BD 87 91      [ 6]  297         jsr     L8791           ; Reset AVSEL1
                            298 
   81D0 C6 00         [ 2]  299         ldab    #0x00           ; turn off button lights
   81D2 D7 62         [ 3]  300         stab    (0x0062)
   81D4 BD F9 C5      [ 6]  301         jsr     BUTNLIT
                            302 
   81D7                     303 L81D7:
   81D7 BD 8D E4      [ 6]  304         jsr     LCDMSG1 
   81DA 20 43 79 62 65 72   305         .ascis  ' Cyberstar v1.6'
        73 74 61 72 20 76
        31 2E B6
                            306 
   81E9 BD A2 DF      [ 6]  307         jsr     LA2DF
   81EC 24 11         [ 3]  308         bcc     L81FF
   81EE CC 52 0F      [ 3]  309         ldd     #0x520F
   81F1 BD 8D B5      [ 6]  310         jsr     L8DB5           ; display 'R' at far right of 1st line
   81F4 7D 04 2A      [ 6]  311         tst     (0x042A)
   81F7 27 06         [ 3]  312         beq     L81FF
   81F9 CC 4B 0F      [ 3]  313         ldd     #0x4B0F
   81FC BD 8D B5      [ 6]  314         jsr     L8DB5           ; display 'K' at far right of 1st line
   81FF                     315 L81FF:
   81FF BD 8D 03      [ 6]  316         jsr     L8D03
   8202 FC 02 9C      [ 5]  317         ldd     (0x029C)
   8205 1A 83 00 01   [ 5]  318         cpd     #0x0001
   8209 26 15         [ 3]  319         bne     L8220
                            320 
   820B BD 8D DD      [ 6]  321         jsr     LCDMSG2 
   820E 20 44 61 76 65 27   322         .ascis  " Dave's system  "
        73 20 73 79 73 74
        65 6D 20 A0
                            323 
   821E 20 47         [ 3]  324         bra     L8267
   8220                     325 L8220:
   8220 1A 83 03 E8   [ 5]  326         cpd     #0x03E8
   8224 2D 1B         [ 3]  327         blt     L8241
   8226 1A 83 04 4B   [ 5]  328         cpd     #0x044B
   822A 22 15         [ 3]  329         bhi     L8241
                            330 
   822C BD 8D DD      [ 6]  331         jsr     LCDMSG2 
   822F 20 20 20 53 50 54   332         .ascis  '   SPT Studio   '
        20 53 74 75 64 69
        6F 20 20 A0
                            333 
   823F 20 26         [ 3]  334         bra L8267
                            335 
   8241                     336 L8241:
   8241 CC 0E 0C      [ 3]  337         ldd     #0x0E0C
   8244 DD AD         [ 4]  338         std     (0x00AD)
   8246 FC 04 0D      [ 5]  339         ldd     (0x040D)
   8249 1A 83 02 58   [ 5]  340         cpd     #0x0258         ; 600?
   824D 22 05         [ 3]  341         bhi     L8254
   824F CC 0E 09      [ 3]  342         ldd     #0x0E09
   8252 DD AD         [ 4]  343         std     (0x00AD)
   8254                     344 L8254:
   8254 C6 29         [ 2]  345         ldab    #0x29
   8256 CE 0E 00      [ 3]  346         ldx     #0x0E00
   8259                     347 L8259:
   8259 A6 00         [ 4]  348         ldaa    0,X
   825B 4A            [ 2]  349         deca
   825C 08            [ 3]  350         inx
   825D 5C            [ 2]  351         incb
   825E 3C            [ 4]  352         pshx
   825F BD 8D B5      [ 6]  353         jsr     L8DB5           ; display char here on LCD display
   8262 38            [ 5]  354         pulx
   8263 9C AD         [ 5]  355         cpx     (0x00AD)
   8265 26 F2         [ 3]  356         bne     L8259
   8267                     357 L8267:
   8267 BD 9C 51      [ 6]  358         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   826A 7F 00 5B      [ 6]  359         clr     (0x005B)
   826D 7F 00 5A      [ 6]  360         clr     (0x005A)
   8270 7F 00 5E      [ 6]  361         clr     (0x005E)
   8273 7F 00 60      [ 6]  362         clr     (0x0060)
   8276                     363 L8276:
   8276 BD 9B 19      [ 6]  364         jsr     L9B19           ; do the random motions if enabled
   8279 96 60         [ 3]  365         ldaa    (0x0060)
   827B 27 06         [ 3]  366         beq     L8283
   827D BD A9 7C      [ 6]  367         jsr     LA97C
   8280 7E F8 00      [ 3]  368         jmp     RESET           ; reset controller
   8283                     369 L8283:
   8283 B6 18 04      [ 4]  370         ldaa    PIA0PRA 
   8286 84 06         [ 2]  371         anda    #0x06
   8288 26 08         [ 3]  372         bne     L8292           ; skip credits if up and down are pressed?
   828A BD 9C F1      [ 6]  373         jsr     L9CF1           ; print credits
   828D C6 32         [ 2]  374         ldab    #0x32
   828F BD 8C 22      [ 6]  375         jsr     DLYSECSBY100    ; delay 0.5 sec
   8292                     376 L8292:
   8292 BD 8E 95      [ 6]  377         jsr     L8E95           ; Was ENTER pressed?
   8295 81 0D         [ 2]  378         cmpa    #0x0D
   8297 26 03         [ 3]  379         bne     L829C
   8299 7E 92 92      [ 3]  380         jmp     L9292           ; If so, go to diagnostics menu
   829C                     381 L829C:
   829C BD F9 45      [ 6]  382         jsr     SERIALR
   829F 25 03         [ 3]  383         bcs     L82A4
   82A1                     384 L82A1:
   82A1 7E 83 33      [ 3]  385         jmp     L8333
   82A4                     386 L82A4:
   82A4 81 44         [ 2]  387         cmpa    #0x44           ;'D'
   82A6 26 03         [ 3]  388         bne     L82AB
   82A8 7E A3 66      [ 3]  389         jmp     LA366           ; go to Dave's Setup Utility
   82AB                     390 L82AB:
   82AB 81 53         [ 2]  391         cmpa    #0x53           ;'S'
   82AD 26 F2         [ 3]  392         bne     L82A1
                            393 
                            394 ; Serial Number Programming
                            395 
   82AF BD F9 D8      [ 6]  396         jsr     SERMSGW      
   82B2 0A 0D 45 6E 74 65   397         .ascis  '\n\rEnter security code: '
        72 20 73 65 63 75
        72 69 74 79 20 63
        6F 64 65 3A A0
                            398 
   82C9 0F            [ 2]  399         sei
   82CA BD A2 EA      [ 6]  400         jsr     LA2EA
   82CD 0E            [ 2]  401         cli
   82CE 25 61         [ 3]  402         bcs     L8331
                            403 
   82D0 BD F9 D8      [ 6]  404         jsr     SERMSGW      
   82D3 0A 0D 45 45 50 52   405         .ascii '\n\rEEPROM serial number programming enabled.'
        4F 4D 20 73 65 72
        69 61 6C 20 6E 75
        6D 62 65 72 20 70
        72 6F 67 72 61 6D
        6D 69 6E 67 20 65
        6E 61 62 6C 65 64
        2E
   82FE 0A 0D 50 6C 65 61   406         .ascis '\n\rPlease RESET the processor to continue\n\r'
        73 65 20 52 45 53
        45 54 20 74 68 65
        20 70 72 6F 63 65
        73 73 6F 72 20 74
        6F 20 63 6F 6E 74
        69 6E 75 65 0A 8D
                            407 
   8328 86 01         [ 2]  408         ldaa    #0x01           ; enable EEPROM erase
   832A B7 04 0F      [ 4]  409         staa    ERASEFLG
   832D 86 DB         [ 2]  410         ldaa    #0xDB
   832F 97 07         [ 3]  411         staa    (0x0007)
                            412 ; need to reset to get out of this 
   8331 20 FE         [ 3]  413 L8331:  bra     L8331           ; infinite loop
                            414 
   8333                     415 L8333:
   8333 96 AA         [ 3]  416         ldaa    (0x00AA)
   8335 27 12         [ 3]  417         beq     L8349
   8337 DC 1B         [ 4]  418         ldd     CDTIMR1
   8339 26 0E         [ 3]  419         bne     L8349
   833B D6 62         [ 3]  420         ldab    (0x0062)
   833D C8 20         [ 2]  421         eorb    #0x20
   833F D7 62         [ 3]  422         stab    (0x0062)
   8341 BD F9 C5      [ 6]  423         jsr     BUTNLIT 
   8344 CC 00 32      [ 3]  424         ldd     #0x0032
   8347 DD 1B         [ 4]  425         std     CDTIMR1
   8349                     426 L8349:
   8349 BD 86 A4      [ 6]  427         jsr     L86A4
   834C 24 03         [ 3]  428         bcc     L8351
   834E 7E 82 76      [ 3]  429         jmp     L8276
   8351                     430 L8351:
   8351 F6 10 2D      [ 4]  431         ldab    SCCR2  
   8354 CA 20         [ 2]  432         orab    #0x20
   8356 F7 10 2D      [ 4]  433         stab    SCCR2  
   8359 7F 00 AA      [ 6]  434         clr     (0x00AA)
   835C D6 62         [ 3]  435         ldab    (0x0062)
   835E C4 DF         [ 2]  436         andb    #0xDF
   8360 D7 62         [ 3]  437         stab    (0x0062)
   8362 BD F9 C5      [ 6]  438         jsr     BUTNLIT 
   8365 C6 02         [ 2]  439         ldab    #0x02           ; delay 2 secs
   8367 BD 8C 02      [ 6]  440         jsr     DLYSECS         ;
   836A 96 7C         [ 3]  441         ldaa    (0x007C)
   836C 27 2D         [ 3]  442         beq     L839B
   836E 96 7F         [ 3]  443         ldaa    (0x007F)
   8370 97 4E         [ 3]  444         staa    (0x004E)
   8372 D6 81         [ 3]  445         ldab    (0x0081)
   8374 BD 87 48      [ 6]  446         jsr     L8748   
   8377 96 82         [ 3]  447         ldaa    (0x0082)
   8379 85 01         [ 2]  448         bita    #0x01
   837B 26 06         [ 3]  449         bne     L8383
   837D 96 AC         [ 3]  450         ldaa    (0x00AC)
   837F 84 FD         [ 2]  451         anda    #0xFD
   8381 20 04         [ 3]  452         bra     L8387
   8383                     453 L8383:
   8383 96 AC         [ 3]  454         ldaa    (0x00AC)
   8385 8A 02         [ 2]  455         oraa    #0x02
   8387                     456 L8387:
   8387 97 AC         [ 3]  457         staa    (0x00AC)
   8389 B7 18 06      [ 4]  458         staa    PIA0PRB 
   838C B6 18 04      [ 4]  459         ldaa    PIA0PRA 
   838F 8A 20         [ 2]  460         oraa    #0x20
   8391 B7 18 04      [ 4]  461         staa    PIA0PRA 
   8394 84 DF         [ 2]  462         anda    #0xDF
   8396 B7 18 04      [ 4]  463         staa    PIA0PRA 
   8399 20 14         [ 3]  464         bra     L83AF
   839B                     465 L839B:
   839B FC 04 0D      [ 5]  466         ldd     (0x040D)
   839E 1A 83 FD E8   [ 5]  467         cpd     #0xFDE8         ; 65000?
   83A2 22 06         [ 3]  468         bhi     L83AA
   83A4 C3 00 01      [ 4]  469         addd    #0x0001
   83A7 FD 04 0D      [ 5]  470         std     (0x040D)
   83AA                     471 L83AA:
   83AA C6 F7         [ 2]  472         ldab    #0xF7           ; tape deck REWIND
   83AC BD 86 E7      [ 6]  473         jsr     L86E7
   83AF                     474 L83AF:
   83AF 7F 00 30      [ 6]  475         clr     (0x0030)
   83B2 7F 00 31      [ 6]  476         clr     (0x0031)
   83B5 7F 00 32      [ 6]  477         clr     (0x0032)
   83B8 BD 9B 19      [ 6]  478         jsr     L9B19           ; do the random motions if enabled   
   83BB BD 86 A4      [ 6]  479         jsr     L86A4
   83BE 25 EF         [ 3]  480         bcs     L83AF
   83C0 96 79         [ 3]  481         ldaa    (0x0079)
   83C2 27 17         [ 3]  482         beq     L83DB
   83C4 7F 00 79      [ 6]  483         clr     (0x0079)
   83C7 96 B5         [ 3]  484         ldaa    (0x00B5)
   83C9 81 01         [ 2]  485         cmpa    #0x01
   83CB 26 07         [ 3]  486         bne     L83D4
   83CD 7F 00 B5      [ 6]  487         clr     (0x00B5)
   83D0 86 01         [ 2]  488         ldaa    #0x01
   83D2 97 7C         [ 3]  489         staa    (0x007C)
   83D4                     490 L83D4:
   83D4 86 01         [ 2]  491         ldaa    #0x01
   83D6 97 AA         [ 3]  492         staa    (0x00AA)
   83D8 7E 9A 7F      [ 3]  493         jmp     L9A7F
   83DB                     494 L83DB:
   83DB BD 8D E4      [ 6]  495         jsr     LCDMSG1 
   83DE 20 20 20 54 61 70   496         .ascis  '   Tape start   '
        65 20 73 74 61 72
        74 20 20 A0
                            497 
   83EE D6 62         [ 3]  498         ldab    (0x0062)
   83F0 CA 80         [ 2]  499         orab    #0x80
   83F2 D7 62         [ 3]  500         stab    (0x0062)
   83F4 BD F9 C5      [ 6]  501         jsr     BUTNLIT 
   83F7 C6 FB         [ 2]  502         ldab    #0xFB           ; tape deck PLAY
   83F9 BD 86 E7      [ 6]  503         jsr     L86E7
                            504 
   83FC BD 8D CF      [ 6]  505         jsr     LCDMSG1A
   83FF 36 38 48 43 31 31   506         .ascis  '68HC11 Proto'
        20 50 72 6F 74 EF
                            507 
   840B BD 8D D6      [ 6]  508         jsr     LCDMSG2A
   840E 64 62 F0            509         .ascis  'dbp'
                            510 
   8411 C6 03         [ 2]  511         ldab    #0x03           ; delay 3 secs
   8413 BD 8C 02      [ 6]  512         jsr     DLYSECS         ;
   8416 7D 00 7C      [ 6]  513         tst     (0x007C)
   8419 27 15         [ 3]  514         beq     L8430
   841B D6 80         [ 3]  515         ldab    (0x0080)
   841D D7 62         [ 3]  516         stab    (0x0062)
   841F BD F9 C5      [ 6]  517         jsr     BUTNLIT 
   8422 D6 7D         [ 3]  518         ldab    (0x007D)
   8424 D7 78         [ 3]  519         stab    (0x0078)
   8426 D6 7E         [ 3]  520         ldab    (0x007E)
   8428 F7 10 8A      [ 4]  521         stab    (0x108A)
   842B 7F 00 7C      [ 6]  522         clr     (0x007C)
   842E 20 1D         [ 3]  523         bra     L844D
   8430                     524 L8430:
   8430 BD 8D 03      [ 6]  525         jsr     L8D03
   8433 BD 9D 18      [ 6]  526         jsr     L9D18
   8436 24 08         [ 3]  527         bcc     L8440
   8438 7D 00 B8      [ 6]  528         tst     (0x00B8)
   843B 27 F3         [ 3]  529         beq     L8430
   843D 7E 9A 60      [ 3]  530         jmp     L9A60
   8440                     531 L8440:
   8440 7D 00 B8      [ 6]  532         tst     (0x00B8)
   8443 27 EB         [ 3]  533         beq     L8430
   8445 7F 00 30      [ 6]  534         clr     (0x0030)
   8448 7F 00 31      [ 6]  535         clr     (0x0031)
   844B 20 00         [ 3]  536         bra     L844D
   844D                     537 L844D:
   844D 96 49         [ 3]  538         ldaa    (0x0049)
   844F 26 03         [ 3]  539         bne     L8454
   8451 7E 85 A4      [ 3]  540         jmp     L85A4
   8454                     541 L8454:
   8454 7F 00 49      [ 6]  542         clr     (0x0049)
   8457 81 31         [ 2]  543         cmpa    #0x31
   8459 26 08         [ 3]  544         bne     L8463
   845B BD A3 26      [ 6]  545         jsr     LA326
   845E BD 8D 42      [ 6]  546         jsr     L8D42
   8461 20 EA         [ 3]  547         bra     L844D
   8463                     548 L8463:
   8463 81 32         [ 2]  549         cmpa    #0x32
   8465 26 08         [ 3]  550         bne     L846F
   8467 BD A3 26      [ 6]  551         jsr     LA326
   846A BD 8D 35      [ 6]  552         jsr     L8D35
   846D 20 DE         [ 3]  553         bra     L844D
   846F                     554 L846F:
   846F 81 54         [ 2]  555         cmpa    #0x54
   8471 26 08         [ 3]  556         bne     L847B
   8473 BD A3 26      [ 6]  557         jsr     LA326
   8476 BD 8D 42      [ 6]  558         jsr     L8D42
   8479 20 D2         [ 3]  559         bra     L844D
   847B                     560 L847B:
   847B 81 5A         [ 2]  561         cmpa    #0x5A
   847D 26 1C         [ 3]  562         bne     L849B
   847F                     563 L847F:
   847F BD A3 1E      [ 6]  564         jsr     LA31E
   8482 BD 8E 95      [ 6]  565         jsr     L8E95
   8485 7F 00 32      [ 6]  566         clr     (0x0032)
   8488 7F 00 31      [ 6]  567         clr     (0x0031)
   848B 7F 00 30      [ 6]  568         clr     (0x0030)
   848E BD 99 A6      [ 6]  569         jsr     L99A6
   8491 D6 7B         [ 3]  570         ldab    (0x007B)
   8493 CA 0C         [ 2]  571         orab    #0x0C
   8495 BD 87 48      [ 6]  572         jsr     L8748   
   8498 7E 81 BD      [ 3]  573         jmp     L81BD
   849B                     574 L849B:
   849B 81 42         [ 2]  575         cmpa    #0x42
   849D 26 03         [ 3]  576         bne     L84A2
   849F 7E 98 3C      [ 3]  577         jmp     L983C
   84A2                     578 L84A2:
   84A2 81 4D         [ 2]  579         cmpa    #0x4D
   84A4 26 03         [ 3]  580         bne     L84A9
   84A6 7E 98 24      [ 3]  581         jmp     L9824
   84A9                     582 L84A9:
   84A9 81 45         [ 2]  583         cmpa    #0x45
   84AB 26 03         [ 3]  584         bne     L84B0
   84AD 7E 98 02      [ 3]  585         jmp     L9802
   84B0                     586 L84B0:
   84B0 81 58         [ 2]  587         cmpa    #0x58
   84B2 26 05         [ 3]  588         bne     L84B9
   84B4 7E 99 3F      [ 3]  589         jmp     L993F
   84B7 20 94         [ 3]  590         bra     L844D
   84B9                     591 L84B9:
   84B9 81 46         [ 2]  592         cmpa    #0x46
   84BB 26 03         [ 3]  593         bne     L84C0
   84BD 7E 99 71      [ 3]  594         jmp     L9971
   84C0                     595 L84C0:
   84C0 81 47         [ 2]  596         cmpa    #0x47
   84C2 26 03         [ 3]  597         bne     L84C7
   84C4 7E 99 7B      [ 3]  598         jmp     L997B
   84C7                     599 L84C7:
   84C7 81 48         [ 2]  600         cmpa    #0x48
   84C9 26 03         [ 3]  601         bne     L84CE
   84CB 7E 99 85      [ 3]  602         jmp     L9985
   84CE                     603 L84CE:
   84CE 81 49         [ 2]  604         cmpa    #0x49
   84D0 26 03         [ 3]  605         bne     L84D5
   84D2 7E 99 8F      [ 3]  606         jmp     L998F
   84D5                     607 L84D5:
   84D5 81 53         [ 2]  608         cmpa    #0x53
   84D7 26 03         [ 3]  609         bne     L84DC
   84D9 7E 97 BA      [ 3]  610         jmp     L97BA
   84DC                     611 L84DC:
   84DC 81 59         [ 2]  612         cmpa    #0x59
   84DE 26 03         [ 3]  613         bne     L84E3
   84E0 7E 99 D2      [ 3]  614         jmp     L99D2
   84E3                     615 L84E3:
   84E3 81 57         [ 2]  616         cmpa    #0x57
   84E5 26 03         [ 3]  617         bne     L84EA
   84E7 7E 9A A4      [ 3]  618         jmp     L9AA4
   84EA                     619 L84EA:
   84EA 81 41         [ 2]  620         cmpa    #0x41
   84EC 26 17         [ 3]  621         bne     L8505
   84EE BD 9D 18      [ 6]  622         jsr     L9D18
   84F1 25 09         [ 3]  623         bcs     L84FC
   84F3 7F 00 30      [ 6]  624         clr     (0x0030)
   84F6 7F 00 31      [ 6]  625         clr     (0x0031)
   84F9 7E 85 A4      [ 3]  626         jmp     L85A4
   84FC                     627 L84FC:
   84FC 7F 00 30      [ 6]  628         clr     (0x0030)
   84FF 7F 00 31      [ 6]  629         clr     (0x0031)
   8502 7E 9A 7F      [ 3]  630         jmp     L9A7F
   8505                     631 L8505:
   8505 81 4B         [ 2]  632         cmpa    #0x4B
   8507 26 0B         [ 3]  633         bne     L8514
   8509 BD 9D 18      [ 6]  634         jsr     L9D18
   850C 25 03         [ 3]  635         bcs     L8511
   850E 7E 85 A4      [ 3]  636         jmp     L85A4
   8511                     637 L8511:
   8511 7E 9A 7F      [ 3]  638         jmp     L9A7F
   8514                     639 L8514:
   8514 81 4A         [ 2]  640         cmpa    #0x4A
   8516 26 07         [ 3]  641         bne     L851F
   8518 86 01         [ 2]  642         ldaa    #0x01
   851A 97 AF         [ 3]  643         staa    (0x00AF)
   851C 7E 98 3C      [ 3]  644         jmp     L983C
   851F                     645 L851F:
   851F 81 4E         [ 2]  646         cmpa    #0x4E
   8521 26 0B         [ 3]  647         bne     L852E
   8523 B6 10 8A      [ 4]  648         ldaa    (0x108A)
   8526 8A 02         [ 2]  649         oraa    #0x02
   8528 B7 10 8A      [ 4]  650         staa    (0x108A)
   852B 7E 84 4D      [ 3]  651         jmp     L844D
   852E                     652 L852E:
   852E 81 4F         [ 2]  653         cmpa    #0x4F
   8530 26 06         [ 3]  654         bne     L8538
   8532 BD 9D 18      [ 6]  655         jsr     L9D18
   8535 7E 84 4D      [ 3]  656         jmp     L844D
   8538                     657 L8538:
   8538 81 50         [ 2]  658         cmpa    #0x50
   853A 26 06         [ 3]  659         bne     L8542
   853C BD 9D 18      [ 6]  660         jsr     L9D18
   853F 7E 84 4D      [ 3]  661         jmp     L844D
   8542                     662 L8542:
   8542 81 51         [ 2]  663         cmpa    #0x51
   8544 26 0B         [ 3]  664         bne     L8551
   8546 B6 10 8A      [ 4]  665         ldaa    (0x108A)
   8549 8A 04         [ 2]  666         oraa    #0x04
   854B B7 10 8A      [ 4]  667         staa    (0x108A)
   854E 7E 84 4D      [ 3]  668         jmp     L844D
   8551                     669 L8551:
   8551 81 55         [ 2]  670         cmpa    #0x55
   8553 26 07         [ 3]  671         bne     L855C
   8555 C6 01         [ 2]  672         ldab    #0x01
   8557 D7 B6         [ 3]  673         stab    (0x00B6)
   8559 7E 84 4D      [ 3]  674         jmp     L844D
   855C                     675 L855C:
   855C 81 4C         [ 2]  676         cmpa    #0x4C
   855E 26 19         [ 3]  677         bne     L8579
   8560 7F 00 49      [ 6]  678         clr     (0x0049)
   8563 BD 9D 18      [ 6]  679         jsr     L9D18
   8566 25 0E         [ 3]  680         bcs     L8576
   8568 BD AA E8      [ 6]  681         jsr     LAAE8
   856B BD AB 56      [ 6]  682         jsr     LAB56
   856E 24 06         [ 3]  683         bcc     L8576
   8570 BD AB 25      [ 6]  684         jsr     LAB25
   8573 BD AB 46      [ 6]  685         jsr     LAB46
   8576                     686 L8576:
   8576 7E 84 4D      [ 3]  687         jmp     L844D
   8579                     688 L8579:
   8579 81 52         [ 2]  689         cmpa    #0x52
   857B 26 1A         [ 3]  690         bne     L8597
   857D 7F 00 49      [ 6]  691         clr     (0x0049)
   8580 BD 9D 18      [ 6]  692         jsr     L9D18
   8583 25 0F         [ 3]  693         bcs     L8594
   8585 BD AA E8      [ 6]  694         jsr     LAAE8
   8588 BD AB 56      [ 6]  695         jsr     LAB56
   858B 25 07         [ 3]  696         bcs     L8594
   858D 86 FF         [ 2]  697         ldaa    #0xFF
   858F A7 00         [ 4]  698         staa    0,X
   8591 BD AA E8      [ 6]  699         jsr     LAAE8
   8594                     700 L8594:
   8594 7E 84 4D      [ 3]  701         jmp     L844D
   8597                     702 L8597:
   8597 81 44         [ 2]  703         cmpa    #0x44
   8599 26 09         [ 3]  704         bne     L85A4
   859B 7F 00 49      [ 6]  705         clr     (0x0049)
   859E BD AB AE      [ 6]  706         jsr     LABAE
   85A1 7E 84 4D      [ 3]  707         jmp     L844D
   85A4                     708 L85A4:
   85A4 7D 00 75      [ 6]  709         tst     (0x0075)
   85A7 26 56         [ 3]  710         bne     L85FF
   85A9 7D 00 79      [ 6]  711         tst     (0x0079)
   85AC 26 51         [ 3]  712         bne     L85FF
   85AE 7D 00 30      [ 6]  713         tst     (0x0030)
   85B1 26 07         [ 3]  714         bne     L85BA
   85B3 96 5B         [ 3]  715         ldaa    (0x005B)
   85B5 27 48         [ 3]  716         beq     L85FF
   85B7 7F 00 5B      [ 6]  717         clr     (0x005B)
   85BA                     718 L85BA:
   85BA CC 00 64      [ 3]  719         ldd     #0x0064
   85BD DD 23         [ 4]  720         std     CDTIMR5
   85BF                     721 L85BF:
   85BF DC 23         [ 4]  722         ldd     CDTIMR5
   85C1 27 14         [ 3]  723         beq     L85D7
   85C3 BD 9B 19      [ 6]  724         jsr     L9B19           ; do the random motions if enabled
   85C6 B6 18 04      [ 4]  725         ldaa    PIA0PRA 
   85C9 88 FF         [ 2]  726         eora    #0xFF
   85CB 84 06         [ 2]  727         anda    #0x06
   85CD 81 06         [ 2]  728         cmpa    #0x06
   85CF 26 EE         [ 3]  729         bne     L85BF
   85D1 7F 00 30      [ 6]  730         clr     (0x0030)
   85D4 7E 86 80      [ 3]  731         jmp     L8680
   85D7                     732 L85D7:
   85D7 7F 00 30      [ 6]  733         clr     (0x0030)
   85DA D6 62         [ 3]  734         ldab    (0x0062)
   85DC C8 02         [ 2]  735         eorb    #0x02
   85DE D7 62         [ 3]  736         stab    (0x0062)
   85E0 BD F9 C5      [ 6]  737         jsr     BUTNLIT 
   85E3 C4 02         [ 2]  738         andb    #0x02
   85E5 27 0D         [ 3]  739         beq     L85F4
   85E7 BD AA 18      [ 6]  740         jsr     LAA18
   85EA C6 1E         [ 2]  741         ldab    #0x1E
   85EC BD 8C 22      [ 6]  742         jsr     DLYSECSBY100    ; delay 0.3 sec
   85EF 7F 00 30      [ 6]  743         clr     (0x0030)
   85F2 20 0B         [ 3]  744         bra     L85FF
   85F4                     745 L85F4:
   85F4 BD AA 1D      [ 6]  746         jsr     LAA1D
   85F7 C6 1E         [ 2]  747         ldab    #0x1E
   85F9 BD 8C 22      [ 6]  748         jsr     DLYSECSBY100    ; delay 0.3 sec
   85FC 7F 00 30      [ 6]  749         clr     (0x0030)
   85FF                     750 L85FF:
   85FF BD 9B 19      [ 6]  751         jsr     L9B19           ; do the random motions if enabled
   8602 B6 10 0A      [ 4]  752         ldaa    PORTE
   8605 84 10         [ 2]  753         anda    #0x10
   8607 27 0B         [ 3]  754         beq     L8614
   8609 B6 18 04      [ 4]  755         ldaa    PIA0PRA 
   860C 88 FF         [ 2]  756         eora    #0xFF
   860E 84 07         [ 2]  757         anda    #0x07
   8610 81 06         [ 2]  758         cmpa    #0x06
   8612 26 1C         [ 3]  759         bne     L8630
   8614                     760 L8614:
   8614 7D 00 76      [ 6]  761         tst     (0x0076)
   8617 26 17         [ 3]  762         bne     L8630
   8619 7D 00 75      [ 6]  763         tst     (0x0075)
   861C 26 12         [ 3]  764         bne     L8630
   861E D6 62         [ 3]  765         ldab    (0x0062)
   8620 C4 FC         [ 2]  766         andb    #0xFC
   8622 D7 62         [ 3]  767         stab    (0x0062)
   8624 BD F9 C5      [ 6]  768         jsr     BUTNLIT 
   8627 BD AA 13      [ 6]  769         jsr     LAA13
   862A BD AA 1D      [ 6]  770         jsr     LAA1D
   862D 7E 9A 60      [ 3]  771         jmp     L9A60
   8630                     772 L8630:
   8630 7D 00 31      [ 6]  773         tst     (0x0031)
   8633 26 07         [ 3]  774         bne     L863C
   8635 96 5A         [ 3]  775         ldaa    (0x005A)
   8637 27 47         [ 3]  776         beq     L8680
   8639 7F 00 5A      [ 6]  777         clr     (0x005A)
   863C                     778 L863C:
   863C CC 00 64      [ 3]  779         ldd     #0x0064
   863F DD 23         [ 4]  780         std     CDTIMR5
   8641                     781 L8641:
   8641 DC 23         [ 4]  782         ldd     CDTIMR5
   8643 27 13         [ 3]  783         beq     L8658
   8645 BD 9B 19      [ 6]  784         jsr     L9B19           ; do the random motions if enabled
   8648 B6 18 04      [ 4]  785         ldaa    PIA0PRA 
   864B 88 FF         [ 2]  786         eora    #0xFF
   864D 84 06         [ 2]  787         anda    #0x06
   864F 81 06         [ 2]  788         cmpa    #0x06
   8651 26 EE         [ 3]  789         bne     L8641
   8653 7F 00 31      [ 6]  790         clr     (0x0031)
   8656 20 28         [ 3]  791         bra     L8680
   8658                     792 L8658:
   8658 7F 00 31      [ 6]  793         clr     (0x0031)
   865B D6 62         [ 3]  794         ldab    (0x0062)
   865D C8 01         [ 2]  795         eorb    #0x01
   865F D7 62         [ 3]  796         stab    (0x0062)
   8661 BD F9 C5      [ 6]  797         jsr     BUTNLIT 
   8664 C4 01         [ 2]  798         andb    #0x01
   8666 27 0D         [ 3]  799         beq     L8675
   8668 BD AA 0C      [ 6]  800         jsr     LAA0C
   866B C6 1E         [ 2]  801         ldab    #0x1E
   866D BD 8C 22      [ 6]  802         jsr     DLYSECSBY100    ; delay 0.3 sec
   8670 7F 00 31      [ 6]  803         clr     (0x0031)
   8673 20 0B         [ 3]  804         bra     L8680
   8675                     805 L8675:
   8675 BD AA 13      [ 6]  806         jsr     LAA13
   8678 C6 1E         [ 2]  807         ldab    #0x1E
   867A BD 8C 22      [ 6]  808         jsr     DLYSECSBY100    ; delay 0.3 sec
   867D 7F 00 31      [ 6]  809         clr     (0x0031)
   8680                     810 L8680:
   8680 BD 86 A4      [ 6]  811         jsr     L86A4
   8683 25 1C         [ 3]  812         bcs     L86A1
   8685 7F 00 4E      [ 6]  813         clr     (0x004E)
   8688 BD 99 A6      [ 6]  814         jsr     L99A6
   868B BD 86 C4      [ 6]  815         jsr     L86C4           ; Reset boards 1-10
   868E 5F            [ 2]  816         clrb
   868F D7 62         [ 3]  817         stab    (0x0062)
   8691 BD F9 C5      [ 6]  818         jsr     BUTNLIT 
   8694 C6 FD         [ 2]  819         ldab    #0xFD           ; tape deck STOP
   8696 BD 86 E7      [ 6]  820         jsr     L86E7
   8699 C6 04         [ 2]  821         ldab    #0x04           ; delay 4 secs
   869B BD 8C 02      [ 6]  822         jsr     DLYSECS         ;
   869E 7E 84 7F      [ 3]  823         jmp     L847F
   86A1                     824 L86A1:
   86A1 7E 84 4D      [ 3]  825         jmp     L844D
   86A4                     826 L86A4:
   86A4 BD 9B 19      [ 6]  827         jsr     L9B19           ; do the random motions if enabled
   86A7 7F 00 23      [ 6]  828         clr     CDTIMR5
   86AA 86 19         [ 2]  829         ldaa    #0x19
   86AC 97 24         [ 3]  830         staa    CDTIMR5+1
   86AE B6 10 0A      [ 4]  831         ldaa    PORTE
   86B1 84 80         [ 2]  832         anda    #0x80
   86B3 27 02         [ 3]  833         beq     L86B7
   86B5                     834 L86B5:
   86B5 0D            [ 2]  835         sec
   86B6 39            [ 5]  836         rts
                            837 
   86B7                     838 L86B7:
   86B7 B6 10 0A      [ 4]  839         ldaa    PORTE
   86BA 84 80         [ 2]  840         anda    #0x80
   86BC 26 F7         [ 3]  841         bne     L86B5
   86BE 96 24         [ 3]  842         ldaa    CDTIMR5+1
   86C0 26 F5         [ 3]  843         bne     L86B7
   86C2 0C            [ 2]  844         clc
   86C3 39            [ 5]  845         rts
                            846 
                            847 ; Reset boards 1-10 at:
                            848 ;         0x1080, 0x1084, 0x1088, 0x108c
                            849 ;         0x1090, 0x1094, 0x1098, 0x109c
                            850 ;         0x10a0, 0x10a4
                            851 
   86C4                     852 L86C4:
   86C4 CE 10 80      [ 3]  853         ldx     #0x1080
   86C7                     854 L86C7:
   86C7 86 30         [ 2]  855         ldaa    #0x30
   86C9 A7 01         [ 4]  856         staa    1,X             ; 0x30 -> PIAxCRA, CA2 low, DDR
   86CB A7 03         [ 4]  857         staa    3,X             ; 0x30 -> PIAxCRB, CB2 low, DDR
   86CD 86 FF         [ 2]  858         ldaa    #0xFF
   86CF A7 00         [ 4]  859         staa    0,X             ; 0xFF -> PIAxDDRA, all outputs
   86D1 A7 02         [ 4]  860         staa    2,X             ; 0xFF -> PIAxDDRB, all outputs
   86D3 86 34         [ 2]  861         ldaa    #0x34
   86D5 A7 01         [ 4]  862         staa    1,X             ; 0x34 -> PIAxCRA, CA2 low, PR
   86D7 A7 03         [ 4]  863         staa    3,X             ; 0x34 -> PIAxCRB, CA2 low, PR
   86D9 6F 00         [ 6]  864         clr     0,X             ; 0x00 -> PIAxPRA, all outputs low
   86DB 6F 02         [ 6]  865         clr     2,X             ; 0x00 -> PIAxPRB, all outputs low
   86DD 08            [ 3]  866         inx
   86DE 08            [ 3]  867         inx
   86DF 08            [ 3]  868         inx
   86E0 08            [ 3]  869         inx
   86E1 8C 10 A4      [ 4]  870         cpx     #0x10A4
   86E4 2F E1         [ 3]  871         ble     L86C7
   86E6 39            [ 5]  872         rts
                            873 
                            874 ; Set the tape deck to STOP, PLAY, REWIND, or EJECT
                            875 ;                B =   0xFD, 0xFB,   0xF7, or  0xEF
   86E7                     876 L86E7:
   86E7 36            [ 3]  877         psha
   86E8 BD 9B 19      [ 6]  878         jsr     L9B19           ; do the random motions if enabled
   86EB 96 AC         [ 3]  879         ldaa    (0x00AC)        ; A = diag buffer?
   86ED C1 FB         [ 2]  880         cmpb    #0xFB           ; if bit 2 of B is 0 (PLAY)
   86EF 26 04         [ 3]  881         bne     L86F5
   86F1 84 FE         [ 2]  882         anda    #0xFE           ; clear A bit 0 (top)
   86F3 20 0E         [ 3]  883         bra     L8703
   86F5                     884 L86F5:
   86F5 C1 F7         [ 2]  885         cmpb    #0xF7           ; if bit 3 of B is 0 (REWIND)
   86F7 26 04         [ 3]  886         bne     L86FD
   86F9 84 BF         [ 2]  887         anda    #0xBF           ; clear A bit 6 (middle)
   86FB 20 06         [ 3]  888         bra     L8703
   86FD                     889 L86FD:
   86FD C1 FD         [ 2]  890         cmpb    #0xFD           ; if bit 1 of B is 0 (STOP)
   86FF 26 02         [ 3]  891         bne     L8703
   8701 84 F7         [ 2]  892         anda    #0xF7           ; clear A bit 3 (bottom)
   8703                     893 L8703:
   8703 97 AC         [ 3]  894         staa    (0x00AC)        ; update diag display buffer
   8705 B7 18 06      [ 4]  895         staa    PIA0PRB         ; init bus based on A
   8708 BD 87 3A      [ 6]  896         jsr     L873A           ; clock diagnostic indicator
   870B 96 7A         [ 3]  897         ldaa    (0x007A)        ; buffer for tape deck / av switcher?
   870D 84 01         [ 2]  898         anda    #0x01           ; preserve a/v switcher bit
   870F 97 7A         [ 3]  899         staa    (0x007A)        ; 
   8711 C4 FE         [ 2]  900         andb    #0xFE           ; set bits 7-1 based on B arg
   8713 DA 7A         [ 3]  901         orab    (0x007A)        
   8715 F7 18 06      [ 4]  902         stab    PIA0PRB         ; put that on the bus
   8718 BD 87 75      [ 6]  903         jsr     L8775           ; clock the tape deck
   871B C6 32         [ 2]  904         ldab    #0x32
   871D BD 8C 22      [ 6]  905         jsr     DLYSECSBY100    ; delay 0.5 sec
   8720 C6 FE         [ 2]  906         ldab    #0xFE
   8722 DA 7A         [ 3]  907         orab    (0x007A)        ; all tape bits off
   8724 F7 18 06      [ 4]  908         stab    PIA0PRB         ; unpress tape buttons
   8727 D7 7A         [ 3]  909         stab    (0x007A)
   8729 BD 87 75      [ 6]  910         jsr     L8775           ; clock the tape deck
   872C 96 AC         [ 3]  911         ldaa    (0x00AC)
   872E 8A 49         [ 2]  912         oraa    #0x49           ; reset bits top,mid,bot
   8730 97 AC         [ 3]  913         staa    (0x00AC)
   8732 B7 18 06      [ 4]  914         staa    PIA0PRB 
   8735 BD 87 3A      [ 6]  915         jsr     L873A           ; clock diagnostic indicator
   8738 32            [ 4]  916         pula
   8739 39            [ 5]  917         rts
                            918 
                            919 ; clock diagnostic indicator
   873A                     920 L873A:
   873A B6 18 04      [ 4]  921         ldaa    PIA0PRA 
   873D 8A 20         [ 2]  922         oraa    #0x20
   873F B7 18 04      [ 4]  923         staa    PIA0PRA 
   8742 84 DF         [ 2]  924         anda    #0xDF
   8744 B7 18 04      [ 4]  925         staa    PIA0PRA 
   8747 39            [ 5]  926         rts
                            927 
   8748                     928 L8748:
   8748 36            [ 3]  929         psha
   8749 37            [ 3]  930         pshb
   874A 96 AC         [ 3]  931         ldaa    (0x00AC)        ; update state machine at AC?
                            932                                 ;      gfedcba
   874C 8A 30         [ 2]  933         oraa    #0x30           ; set bb11bbbb
   874E 84 FD         [ 2]  934         anda    #0xFD           ; clr bb11bb0b
   8750 C5 20         [ 2]  935         bitb    #0x20           ; tst bit 5 (f)
   8752 26 02         [ 3]  936         bne     L8756           ; 
   8754 8A 02         [ 2]  937         oraa    #0x02           ; set bit 1 (b)
   8756                     938 L8756:
   8756 C5 04         [ 2]  939         bitb    #0x04           ; tst bit 2 (c)
   8758 26 02         [ 3]  940         bne     L875C
   875A 84 EF         [ 2]  941         anda    #0xEF           ; clr bit 4 (e)
   875C                     942 L875C:
   875C C5 08         [ 2]  943         bitb    #0x08           ; tst bit 3 (d)
   875E 26 02         [ 3]  944         bne     L8762
   8760 84 DF         [ 2]  945         anda    #0xDF           ; clr bit 5 (f)
   8762                     946 L8762:
   8762 B7 18 06      [ 4]  947         staa    PIA0PRB 
   8765 97 AC         [ 3]  948         staa    (0x00AC)
   8767 BD 87 3A      [ 6]  949         jsr     L873A           ; clock diagnostic indicator
   876A 33            [ 4]  950         pulb
   876B F7 18 06      [ 4]  951         stab    PIA0PRB 
   876E D7 7B         [ 3]  952         stab    (0x007B)
   8770 BD 87 83      [ 6]  953         jsr     L8783
   8773 32            [ 4]  954         pula
   8774 39            [ 5]  955         rts
                            956 
                            957 ; High pulse on CB2, clock bits0-4 - 4 tape deck and 1 A/V switcher bit
   8775                     958 L8775:
   8775 B6 18 07      [ 4]  959         ldaa    PIA0CRB 
   8778 8A 38         [ 2]  960         oraa    #0x38           
   877A B7 18 07      [ 4]  961         staa    PIA0CRB         ; CB2 High
   877D 84 F7         [ 2]  962         anda    #0xF7
   877F B7 18 07      [ 4]  963         staa    PIA0CRB         ; CB2 Low
   8782 39            [ 5]  964         rts
                            965 
                            966 ; High pulse on CA2
   8783                     967 L8783:
   8783 B6 18 05      [ 4]  968         ldaa    PIA0CRA 
   8786 8A 38         [ 2]  969         oraa    #0x38
   8788 B7 18 05      [ 4]  970         staa    PIA0CRA         ; CA2 High
   878B 84 F7         [ 2]  971         anda    #0xF7
   878D B7 18 05      [ 4]  972         staa    PIA0CRA         ; CA2 High
   8790 39            [ 5]  973         rts
                            974 
                            975 ; AVSEL1 = 0
   8791                     976 L8791:
   8791 96 7A         [ 3]  977         ldaa    (0x007A)
   8793 84 FE         [ 2]  978         anda    #0xFE
   8795 36            [ 3]  979         psha
   8796 96 AC         [ 3]  980         ldaa    (0x00AC)
   8798 8A 04         [ 2]  981         oraa    #0x04           ; clear segment C (lower right)
   879A 97 AC         [ 3]  982         staa    (0x00AC)
   879C 32            [ 4]  983         pula
   879D                     984 L879D:
   879D 97 7A         [ 3]  985         staa    (0x007A)        
   879F B7 18 06      [ 4]  986         staa    PIA0PRB 
   87A2 BD 87 75      [ 6]  987         jsr     L8775           ; AVSEL1 = low
   87A5 96 AC         [ 3]  988         ldaa    (0x00AC)
   87A7 B7 18 06      [ 4]  989         staa    PIA0PRB 
   87AA BD 87 3A      [ 6]  990         jsr     L873A           ; clock diagnostic indicator
   87AD 39            [ 5]  991         rts
                            992 
   87AE                     993 L87AE:
   87AE 96 7A         [ 3]  994         ldaa    (0x007A)
   87B0 8A 01         [ 2]  995         oraa    #0x01
   87B2 36            [ 3]  996         psha
   87B3 96 AC         [ 3]  997         ldaa    (0x00AC)
   87B5 84 FB         [ 2]  998         anda    #0xFB
   87B7 97 AC         [ 3]  999         staa    (0x00AC)
   87B9 32            [ 4] 1000         pula
   87BA 20 E1         [ 3] 1001         bra     L879D
                           1002 
                           1003 ; SCC init, aux serial
   87BC                    1004 L87BC:
   87BC CE 87 D2      [ 3] 1005         ldx     #L87D2
   87BF                    1006 L87BF:
   87BF A6 00         [ 4] 1007         ldaa    0,X
   87C1 81 FF         [ 2] 1008         cmpa    #0xFF
   87C3 27 0C         [ 3] 1009         beq     L87D1
   87C5 08            [ 3] 1010         inx
   87C6 B7 18 0D      [ 4] 1011         staa    SCCCTRLA
   87C9 A6 00         [ 4] 1012         ldaa    0,X
   87CB 08            [ 3] 1013         inx
   87CC B7 18 0D      [ 4] 1014         staa    SCCCTRLA
   87CF 20 EE         [ 3] 1015         bra     L87BF
   87D1                    1016 L87D1:
   87D1 39            [ 5] 1017         rts
                           1018 
                           1019 ; data table for aux serial config
   87D2                    1020 L87D2:
   87D2 09 8A              1021         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   87D4 01 00              1022         .byte   0x01,0x00       ; irq on special condition only
   87D6 0C 18              1023         .byte   0x0c,0x18       ; Lower byte of time constant
   87D8 0D 00              1024         .byte   0x0d,0x00       ; Upper byte of time constant
   87DA 04 44              1025         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   87DC 0E 63              1026         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   87DE 05 68              1027         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   87E0 0B 56              1028         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   87E2 03 C1              1029         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           1030         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           1031         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   87E4 0F 00              1032         .byte   0x0f,0x00       ; end of table marker
   87E6 FF FF              1033         .byte   0xff,0xff
                           1034 
                           1035 ; SCC init, sync tape data
   87E8                    1036 L87E8:
   87E8 CE F8 57      [ 3] 1037         ldx     #LF857
   87EB                    1038 L87EB:
   87EB A6 00         [ 4] 1039         ldaa    0,X
   87ED 81 FF         [ 2] 1040         cmpa    #0xFF
   87EF 27 0C         [ 3] 1041         beq     L87FD
   87F1 08            [ 3] 1042         inx
   87F2 B7 18 0C      [ 4] 1043         staa    SCCCTRLB
   87F5 A6 00         [ 4] 1044         ldaa    0,X
   87F7 08            [ 3] 1045         inx
   87F8 B7 18 0C      [ 4] 1046         staa    SCCCTRLB
   87FB 20 EE         [ 3] 1047         bra     L87EB
   87FD                    1048 L87FD:
   87FD 20 16         [ 3] 1049         bra     L8815
                           1050 
                           1051 ; data table for sync tape data config
   87FF 09 8A              1052         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   8801 01 10              1053         .byte   0x01,0x10       ; irq on all character received
   8803 0C 18              1054         .byte   0x0c,0x18       ; Lower byte of time constant
   8805 0D 00              1055         .byte   0x0d,0x00       ; Upper byte of time constant
   8807 04 04              1056         .byte   0x04,0x04       ; X1 clock mode, 8-bit sync char, 1 stop bit, no parity
   8809 0E 63              1057         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   880B 05 68              1058         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   880D 0B 01              1059         .byte   0x0b,0x01       ; ~RTxC pin is Recv/Xmit clock, ~TRxC is xmit clk
   880F 03 C1              1060         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
   8811 0F 00              1061         .byte   0x0f,0x00       ; end of table marker
   8813 FF FF              1062         .byte   0xff,0xff
                           1063 
                           1064 ; Install IRQ and SCI interrupt handlers
   8815                    1065 L8815:
   8815 CE 88 3E      [ 3] 1066         ldx     #L883E          ; Install IRQ interrupt handler
   8818 FF 01 28      [ 5] 1067         stx     (0x0128)
   881B 86 7E         [ 2] 1068         ldaa    #0x7E
   881D B7 01 27      [ 4] 1069         staa    (0x0127)
   8820 CE 88 32      [ 3] 1070         ldx     #L8832          ; Install SCI interrupt handler
   8823 FF 01 01      [ 5] 1071         stx     (0x0101)
   8826 B7 01 00      [ 4] 1072         staa    (0x0100)
   8829 B6 10 2D      [ 4] 1073         ldaa    SCCR2           ; enable SCI receive interrupts
   882C 8A 20         [ 2] 1074         oraa    #0x20
   882E B7 10 2D      [ 4] 1075         staa    SCCR2  
   8831 39            [ 5] 1076         rts
                           1077 
                           1078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1079 
                           1080 ; SCI Interrupt handler, normal serial
                           1081 
   8832                    1082 L8832:
   8832 B6 10 2E      [ 4] 1083         ldaa    SCSR
   8835 B6 10 2F      [ 4] 1084         ldaa    SCDR
   8838 7C 00 48      [ 6] 1085         inc     (0x0048)        ; increment bytes received
   883B 7E 88 62      [ 3] 1086         jmp     L8862           ; handle incoming data the same from SCI or SCC
                           1087 
                           1088 ; IRQ Interrupt handler, aux serial
                           1089 
   883E                    1090 L883E:
   883E 86 01         [ 2] 1091         ldaa    #0x01
   8840 B7 18 0C      [ 4] 1092         staa    SCCCTRLB
   8843 B6 18 0C      [ 4] 1093         ldaa    SCCCTRLB        ; read 3 error bits
   8846 84 70         [ 2] 1094         anda    #0x70
   8848 26 1F         [ 3] 1095         bne     L8869           ; if errors, jump ahead
   884A 86 0A         [ 2] 1096         ldaa    #0x0A
   884C B7 18 0C      [ 4] 1097         staa    SCCCTRLB
   884F B6 18 0C      [ 4] 1098         ldaa    SCCCTRLB        ; read clocks missing bits
   8852 84 C0         [ 2] 1099         anda    #0xC0
   8854 26 22         [ 3] 1100         bne     L8878           ; clocks missing, jump ahead
   8856 B6 18 0C      [ 4] 1101         ldaa    SCCCTRLB        ; check character available
   8859 44            [ 2] 1102         lsra
   885A 24 35         [ 3] 1103         bcc     L8891           ; if no char available, clear register and exit
   885C 7C 00 48      [ 6] 1104         inc     (0x0048)        ; increment bytes received
   885F B6 18 0E      [ 4] 1105         ldaa    SCCDATAB        ; read good data byte
                           1106 
                           1107 ; handle incoming data byte
   8862                    1108 L8862:
   8862 BD F9 6F      [ 6] 1109         jsr     SERIALW         ; echo it to serial
   8865 97 4A         [ 3] 1110         staa    (0x004A)        ; store it here
   8867 20 2D         [ 3] 1111         bra     L8896
                           1112 
                           1113 ; errors reading from SCC
   8869                    1114 L8869:
   8869 B6 18 0E      [ 4] 1115         ldaa    SCCDATAB        ; read bad byte
   886C 86 30         [ 2] 1116         ldaa    #0x30
   886E B7 18 0C      [ 4] 1117         staa    SCCCTRLB        ; send error reset (Register 0)
   8871 86 07         [ 2] 1118         ldaa    #0x07
   8873 BD F9 6F      [ 6] 1119         jsr     SERIALW         ; send bell to serial
   8876 0C            [ 2] 1120         clc
   8877 3B            [12] 1121         rti
                           1122 
                           1123 ; clocks missing?
   8878                    1124 L8878:
   8878 86 07         [ 2] 1125         ldaa    #0x07
   887A BD F9 6F      [ 6] 1126         jsr     SERIALW         ; send bell to serial
   887D 86 0E         [ 2] 1127         ldaa    #0x0E
   887F B7 18 0C      [ 4] 1128         staa    SCCCTRLB
   8882 86 43         [ 2] 1129         ldaa    #0x43
   8884 B7 18 0C      [ 4] 1130         staa    SCCCTRLB        ; send reset missing clock
   8887 B6 18 0E      [ 4] 1131         ldaa    SCCDATAB
   888A 86 07         [ 2] 1132         ldaa    #0x07
   888C BD F9 6F      [ 6] 1133         jsr     SERIALW         ; send 2nd bell to serial
   888F 0D            [ 2] 1134         sec
   8890 3B            [12] 1135         rti
                           1136 
                           1137 ; clear receive data reg and return
   8891                    1138 L8891:
   8891 B6 18 0E      [ 4] 1139         ldaa    SCCDATAB
   8894 0C            [ 2] 1140         clc
   8895 3B            [12] 1141         rti
                           1142 
                           1143 ; Parse byte from tape
   8896                    1144 L8896:
   8896 84 7F         [ 2] 1145         anda    #0x7F           ; should all be 7-bits, ignore bit 7
   8898 81 24         [ 2] 1146         cmpa    #0x24           ;'$'
   889A 27 44         [ 3] 1147         beq     L88E0           ; count it and exit
   889C 81 25         [ 2] 1148         cmpa    #0x25           ;'%'
   889E 27 40         [ 3] 1149         beq     L88E0           ; count it and exit
   88A0 81 20         [ 2] 1150         cmpa    #0x20           ;' '
   88A2 27 3A         [ 3] 1151         beq     L88DE           ; just exit
   88A4 81 30         [ 2] 1152         cmpa    #0x30           ;'0'
   88A6 25 35         [ 3] 1153         bcs     L88DD           ; < 0x30, exit
   88A8 97 12         [ 3] 1154         staa    (0x0012)        ; store it here
   88AA 96 4D         [ 3] 1155         ldaa    (0x004D)        ; check number of '$' or '%'
   88AC 81 02         [ 2] 1156         cmpa    #0x02
   88AE 25 09         [ 3] 1157         bcs     L88B9           ; < 2, jump ahead
   88B0 7F 00 4D      [ 6] 1158         clr     (0x004D)        ; clear number of '$' or '%'
   88B3 96 12         [ 3] 1159         ldaa    (0x0012)
   88B5 97 49         [ 3] 1160         staa    (0x0049)        ; store the character here - character is 0x30 or higher
   88B7 20 24         [ 3] 1161         bra     L88DD           ; exit
   88B9                    1162 L88B9:
   88B9 7D 00 4E      [ 6] 1163         tst     (0x004E)        ; is 4E 0??? (related to random motions?)
   88BC 27 1F         [ 3] 1164         beq     L88DD           ; if so, exit
   88BE 86 78         [ 2] 1165         ldaa    #0x78           ; 120
   88C0 97 63         [ 3] 1166         staa    (0x0063)        ; start 12 second timer
   88C2 97 64         [ 3] 1167         staa    (0x0064)        ; reset boards before next random motion
   88C4 96 12         [ 3] 1168         ldaa    (0x0012)
   88C6 81 40         [ 2] 1169         cmpa    #0x40
   88C8 24 07         [ 3] 1170         bcc     L88D1           ; if char >= 0x40, jump ahead
   88CA 97 4C         [ 3] 1171         staa    (0x004C)        ; store code from 0x30 to 0x3F here
   88CC 7F 00 4D      [ 6] 1172         clr     (0x004D)        ; more code to process
   88CF 20 0C         [ 3] 1173         bra     L88DD           ; go to rti
   88D1                    1174 L88D1:
   88D1 81 60         [ 2] 1175         cmpa    #0x60       
   88D3 24 08         [ 3] 1176         bcc     L88DD           ; if char >= 0x60, exit
   88D5 97 4B         [ 3] 1177         staa    (0x004B)        ; store code from 0x40 to 0x5F here
   88D7 7F 00 4D      [ 6] 1178         clr     (0x004D)        ; more code to process
   88DA BD 88 E5      [ 6] 1179         jsr     L88E5           ; jump ahead
   88DD                    1180 L88DD:
   88DD 3B            [12] 1181         rti
                           1182 
   88DE                    1183 L88DE:
   88DE 20 FD         [ 3] 1184         bra     L88DD           ; go to rti
   88E0                    1185 L88E0:
   88E0 7C 00 4D      [ 6] 1186         inc     (0x004D)        ; count $ or %
   88E3 20 F9         [ 3] 1187         bra     L88DE           ; exit
   88E5                    1188 L88E5:
   88E5 D6 4B         [ 3] 1189         ldab    (0x004B)        
   88E7 96 4C         [ 3] 1190         ldaa    (0x004C)
   88E9 7D 04 5C      [ 6] 1191         tst     (0x045C)        ; R12/CNR?
   88EC 27 0D         [ 3] 1192         beq     L88FB           ; if R12, jump ahead
   88EE 81 3C         [ 2] 1193         cmpa    #0x3C
   88F0 25 09         [ 3] 1194         bcs     L88FB           ; if char < 0x3C, jump ahead
   88F2 81 3F         [ 2] 1195         cmpa    #0x3F
   88F4 22 05         [ 3] 1196         bhi     L88FB           ; if char > 0x3F, jump ahead 
   88F6 BD 89 93      [ 6] 1197         jsr     L8993           ; process char (0x3C-0x3F)
   88F9 20 65         [ 3] 1198         bra     L8960           ; rts
   88FB                    1199 L88FB:
   88FB 1A 83 30 48   [ 5] 1200         cpd     #0x3048
   88FF 27 79         [ 3] 1201         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8901 1A 83 31 48   [ 5] 1202         cpd     #0x3148
   8905 27 5A         [ 3] 1203         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8907 1A 83 34 4D   [ 5] 1204         cpd     #0x344D
   890B 27 6D         [ 3] 1205         beq     L897A           ; turn off 3 bits on boards 1,3,4
   890D 1A 83 35 4D   [ 5] 1206         cpd     #0x354D
   8911 27 4E         [ 3] 1207         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8913 1A 83 36 4D   [ 5] 1208         cpd     #0x364D
   8917 27 61         [ 3] 1209         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8919 1A 83 37 4D   [ 5] 1210         cpd     #0x374D
   891D 27 42         [ 3] 1211         beq     L8961           ; turn on 3 bits on boards 1,3,4
   891F CE 10 80      [ 3] 1212         ldx     #0x1080
   8922 D6 4C         [ 3] 1213         ldab    (0x004C)
   8924 C0 30         [ 2] 1214         subb    #0x30
   8926 54            [ 2] 1215         lsrb
   8927 58            [ 2] 1216         aslb
   8928 58            [ 2] 1217         aslb
   8929 3A            [ 3] 1218         abx
   892A D6 4B         [ 3] 1219         ldab    (0x004B)
   892C C1 50         [ 2] 1220         cmpb    #0x50
   892E 24 30         [ 3] 1221         bcc     L8960           ; if char >= 0x50, return
   8930 C1 47         [ 2] 1222         cmpb    #0x47           
   8932 23 02         [ 3] 1223         bls     L8936           ; if char <= 0x47, skip increments
   8934 08            [ 3] 1224         inx                     ; skip to port B of this PIA
   8935 08            [ 3] 1225         inx
   8936                    1226 L8936:
   8936 C0 40         [ 2] 1227         subb    #0x40           ; 
   8938 C4 07         [ 2] 1228         andb    #0x07
   893A 4F            [ 2] 1229         clra
   893B 0D            [ 2] 1230         sec
   893C 49            [ 2] 1231         rola
   893D 5D            [ 2] 1232         tstb
   893E 27 04         [ 3] 1233         beq     L8944  
   8940                    1234 L8940:
   8940 49            [ 2] 1235         rola
   8941 5A            [ 2] 1236         decb
   8942 26 FC         [ 3] 1237         bne     L8940  
   8944                    1238 L8944:
   8944 97 50         [ 3] 1239         staa    (0x0050)
   8946 96 4C         [ 3] 1240         ldaa    (0x004C)
   8948 84 01         [ 2] 1241         anda    #0x01
   894A 27 08         [ 3] 1242         beq     L8954
                           1243 ; set bit to a 1 using the mask
   894C A6 00         [ 4] 1244         ldaa    0,X
   894E 9A 50         [ 3] 1245         oraa    (0x0050)
   8950 A7 00         [ 4] 1246         staa    0,X
   8952 20 0C         [ 3] 1247         bra     L8960
                           1248 ; set bit to 0 using the mask
   8954                    1249 L8954:
   8954 96 50         [ 3] 1250         ldaa    (0x0050)
   8956 88 FF         [ 2] 1251         eora    #0xFF
   8958 97 50         [ 3] 1252         staa    (0x0050)
   895A A6 00         [ 4] 1253         ldaa    0,X
   895C 94 50         [ 3] 1254         anda    (0x0050)
   895E A7 00         [ 4] 1255         staa    0,X
   8960                    1256 L8960:
   8960 39            [ 5] 1257         rts
                           1258 
                           1259 ; turn on 3 bits on boards 1,3,4
   8961                    1260 L8961:
   8961 B6 10 82      [ 4] 1261         ldaa    (0x1082)
   8964 8A 01         [ 2] 1262         oraa    #0x01           ; board 1, PIA A, bit 0
   8966 B7 10 82      [ 4] 1263         staa    (0x1082)
   8969 B6 10 8A      [ 4] 1264         ldaa    (0x108A)
   896C 8A 20         [ 2] 1265         oraa    #0x20           ; board 3, PIA B, bit 5
   896E B7 10 8A      [ 4] 1266         staa    (0x108A)
   8971 B6 10 8E      [ 4] 1267         ldaa    (0x108E)        ; board 4, PIA B, bit 5
   8974 8A 20         [ 2] 1268         oraa    #0x20
   8976 B7 10 8E      [ 4] 1269         staa    (0x108E)
   8979 39            [ 5] 1270         rts
                           1271 
                           1272 ; turn off 3 bits on boards 1,3,4
   897A                    1273 L897A:
   897A B6 10 82      [ 4] 1274         ldaa    (0x1082)
   897D 84 FE         [ 2] 1275         anda    #0xFE
   897F B7 10 82      [ 4] 1276         staa    (0x1082)
   8982 B6 10 8A      [ 4] 1277         ldaa    (0x108A)
   8985 84 DF         [ 2] 1278         anda    #0xDF
   8987 B7 10 8A      [ 4] 1279         staa    (0x108A)
   898A B6 10 8E      [ 4] 1280         ldaa    (0x108E)
   898D 84 DF         [ 2] 1281         anda    #0xDF
   898F B7 10 8E      [ 4] 1282         staa    (0x108E)
   8992 39            [ 5] 1283         rts
                           1284 
                           1285 ; process 0x3C-0x3F in CNR mode
   8993                    1286 L8993:
   8993 3C            [ 4] 1287         pshx
   8994 81 3D         [ 2] 1288         cmpa    #0x3D
   8996 22 05         [ 3] 1289         bhi     L899D           ; if char > 0x3D use second table
   8998 CE F7 80      [ 3] 1290         ldx     #LF780          ; table at the end
   899B 20 03         [ 3] 1291         bra     L89A0           ; else use first table
   899D                    1292 L899D:
   899D CE F7 A0      [ 3] 1293         ldx     #LF7A0          ; table at the end
   89A0                    1294 L89A0:
   89A0 C0 40         [ 2] 1295         subb    #0x40           
   89A2 58            [ 2] 1296         aslb
   89A3 3A            [ 3] 1297         abx
   89A4 81 3C         [ 2] 1298         cmpa    #0x3C
   89A6 27 34         [ 3] 1299         beq     L89DC           ; board 7 - turn off A & B with table value mask 
   89A8 81 3D         [ 2] 1300         cmpa    #0x3D
   89AA 27 0A         [ 3] 1301         beq     L89B6           ; board 7 - turn on A & B with table value mask
   89AC 81 3E         [ 2] 1302         cmpa    #0x3E
   89AE 27 4B         [ 3] 1303         beq     L89FB           ; board 8 - turn off A & B with table value mask 
   89B0 81 3F         [ 2] 1304         cmpa    #0x3F
   89B2 27 15         [ 3] 1305         beq     L89C9           ; board 8 - turn on A & B with table value mask
   89B4 38            [ 5] 1306         pulx
   89B5 39            [ 5] 1307         rts
                           1308 
                           1309 ; board 7 - turn on A & B with table value mask
   89B6                    1310 L89B6:
   89B6 B6 10 98      [ 4] 1311         ldaa    (0x1098)
   89B9 AA 00         [ 4] 1312         oraa    0,X
   89BB B7 10 98      [ 4] 1313         staa    (0x1098)
   89BE 08            [ 3] 1314         inx
   89BF B6 10 9A      [ 4] 1315         ldaa    (0x109A)
   89C2 AA 00         [ 4] 1316         oraa    0,X
   89C4 B7 10 9A      [ 4] 1317         staa    (0x109A)
   89C7 38            [ 5] 1318         pulx
   89C8 39            [ 5] 1319         rts
                           1320 
                           1321 ; board 8 - turn on A & B with table value mask
   89C9                    1322 L89C9:
   89C9 B6 10 9C      [ 4] 1323         ldaa    (0x109C)
   89CC AA 00         [ 4] 1324         oraa    0,X
   89CE B7 10 9C      [ 4] 1325         staa    (0x109C)
   89D1 08            [ 3] 1326         inx
   89D2 B6 10 9E      [ 4] 1327         ldaa    (0x109E)
   89D5 AA 00         [ 4] 1328         oraa    0,X
   89D7 B7 10 9E      [ 4] 1329         staa    (0x109E)
   89DA 38            [ 5] 1330         pulx
   89DB 39            [ 5] 1331         rts
                           1332 
                           1333 ; board 7 - turn off A & B with table value mask
   89DC                    1334 L89DC:
   89DC E6 00         [ 4] 1335         ldab    0,X
   89DE C8 FF         [ 2] 1336         eorb    #0xFF
   89E0 D7 12         [ 3] 1337         stab    (0x0012)
   89E2 B6 10 98      [ 4] 1338         ldaa    (0x1098)
   89E5 94 12         [ 3] 1339         anda    (0x0012)
   89E7 B7 10 98      [ 4] 1340         staa    (0x1098)
   89EA 08            [ 3] 1341         inx
   89EB E6 00         [ 4] 1342         ldab    0,X
   89ED C8 FF         [ 2] 1343         eorb    #0xFF
   89EF D7 12         [ 3] 1344         stab    (0x0012)
   89F1 B6 10 9A      [ 4] 1345         ldaa    (0x109A)
   89F4 94 12         [ 3] 1346         anda    (0x0012)
   89F6 B7 10 9A      [ 4] 1347         staa    (0x109A)
   89F9 38            [ 5] 1348         pulx
   89FA 39            [ 5] 1349         rts
                           1350 
                           1351 ; board 8 - turn off A & B with table value mask
   89FB                    1352 L89FB:
   89FB E6 00         [ 4] 1353         ldab    0,X
   89FD C8 FF         [ 2] 1354         eorb    #0xFF
   89FF D7 12         [ 3] 1355         stab    (0x0012)
   8A01 B6 10 9C      [ 4] 1356         ldaa    (0x109C)
   8A04 94 12         [ 3] 1357         anda    (0x0012)
   8A06 B7 10 9C      [ 4] 1358         staa    (0x109C)
   8A09 08            [ 3] 1359         inx
   8A0A E6 00         [ 4] 1360         ldab    0,X
   8A0C C8 FF         [ 2] 1361         eorb    #0xFF
   8A0E D7 12         [ 3] 1362         stab    (0x0012)
   8A10 B6 10 9E      [ 4] 1363         ldaa    (0x109E)
   8A13 94 12         [ 3] 1364         anda    (0x0012)
   8A15 B7 10 9E      [ 4] 1365         staa    (0x109E)
   8A18 38            [ 5] 1366         pulx
   8A19 39            [ 5] 1367         rts
                           1368 
                           1369 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1370 
   8A1A                    1371 L8A1A:
                           1372 ; Parse text with compressed ANSI stuff from table location in X
   8A1A 3C            [ 4] 1373         pshx
   8A1B                    1374 L8A1B:
   8A1B 86 04         [ 2] 1375         ldaa    #0x04
   8A1D B5 18 0D      [ 4] 1376         bita    SCCCTRLA
   8A20 27 F9         [ 3] 1377         beq     L8A1B  
   8A22 A6 00         [ 4] 1378         ldaa    0,X     
   8A24 26 03         [ 3] 1379         bne     L8A29           ; if not nul, continue
   8A26 7E 8B 21      [ 3] 1380         jmp     L8B21           ; else jump to exit
                           1381 ; process ^0123 into ESC[01;23H - ANSI Cursor positioning - (1 based)
   8A29                    1382 L8A29:
   8A29 08            [ 3] 1383         inx
   8A2A 81 5E         [ 2] 1384         cmpa    #0x5E           ; is it a '^' ?
   8A2C 26 1D         [ 3] 1385         bne     L8A4B           ; no, jump ahead
   8A2E A6 00         [ 4] 1386         ldaa    0,X             ; yes, get the next char
   8A30 08            [ 3] 1387         inx
   8A31 B7 05 92      [ 4] 1388         staa    (0x0592)    
   8A34 A6 00         [ 4] 1389         ldaa    0,X     
   8A36 08            [ 3] 1390         inx
   8A37 B7 05 93      [ 4] 1391         staa    (0x0593)
   8A3A A6 00         [ 4] 1392         ldaa    0,X     
   8A3C 08            [ 3] 1393         inx
   8A3D B7 05 95      [ 4] 1394         staa    (0x0595)
   8A40 A6 00         [ 4] 1395         ldaa    0,X     
   8A42 08            [ 3] 1396         inx
   8A43 B7 05 96      [ 4] 1397         staa    (0x0596)
   8A46 BD 8B 23      [ 6] 1398         jsr     L8B23
   8A49 20 D0         [ 3] 1399         bra     L8A1B  
                           1400 ; process @...
   8A4B                    1401 L8A4B:
   8A4B 81 40         [ 2] 1402         cmpa    #0x40           ; is it a '@' ?
   8A4D 26 3B         [ 3] 1403         bne     L8A8A  
   8A4F 1A EE 00      [ 6] 1404         ldy     0,X
   8A52 08            [ 3] 1405         inx
   8A53 08            [ 3] 1406         inx
   8A54 86 30         [ 2] 1407         ldaa    #0x30
   8A56 97 B1         [ 3] 1408         staa    (0x00B1)
   8A58 18 A6 00      [ 5] 1409         ldaa    0,Y
   8A5B                    1410 L8A5B:
   8A5B 81 64         [ 2] 1411         cmpa    #0x64
   8A5D 25 07         [ 3] 1412         bcs     L8A66  
   8A5F 7C 00 B1      [ 6] 1413         inc     (0x00B1)
   8A62 80 64         [ 2] 1414         suba    #0x64
   8A64 20 F5         [ 3] 1415         bra     L8A5B  
   8A66                    1416 L8A66:
   8A66 36            [ 3] 1417         psha
   8A67 96 B1         [ 3] 1418         ldaa    (0x00B1)
   8A69 BD 8B 3B      [ 6] 1419         jsr     L8B3B
   8A6C 86 30         [ 2] 1420         ldaa    #0x30
   8A6E 97 B1         [ 3] 1421         staa    (0x00B1)
   8A70 32            [ 4] 1422         pula
   8A71                    1423 L8A71:
   8A71 81 0A         [ 2] 1424         cmpa    #0x0A
   8A73 25 07         [ 3] 1425         bcs     L8A7C  
   8A75 7C 00 B1      [ 6] 1426         inc     (0x00B1)
   8A78 80 0A         [ 2] 1427         suba    #0x0A
   8A7A 20 F5         [ 3] 1428         bra     L8A71  
   8A7C                    1429 L8A7C:
   8A7C 36            [ 3] 1430         psha
   8A7D 96 B1         [ 3] 1431         ldaa    (0x00B1)
   8A7F BD 8B 3B      [ 6] 1432         jsr     L8B3B
   8A82 32            [ 4] 1433         pula
   8A83 8B 30         [ 2] 1434         adda    #0x30
   8A85 BD 8B 3B      [ 6] 1435         jsr     L8B3B
   8A88 20 91         [ 3] 1436         bra     L8A1B
                           1437 ; process |...
   8A8A                    1438 L8A8A:
   8A8A 81 7C         [ 2] 1439         cmpa    #0x7C           ; is it a '|' ?
   8A8C 26 59         [ 3] 1440         bne     L8AE7  
   8A8E 1A EE 00      [ 6] 1441         ldy     0,X     
   8A91 08            [ 3] 1442         inx
   8A92 08            [ 3] 1443         inx
   8A93 86 30         [ 2] 1444         ldaa    #0x30
   8A95 97 B1         [ 3] 1445         staa    (0x00B1)
   8A97 18 EC 00      [ 6] 1446         ldd     0,Y     
   8A9A                    1447 L8A9A:
   8A9A 1A 83 27 10   [ 5] 1448         cpd     #0x2710
   8A9E 25 08         [ 3] 1449         bcs     L8AA8  
   8AA0 7C 00 B1      [ 6] 1450         inc     (0x00B1)
   8AA3 83 27 10      [ 4] 1451         subd    #0x2710
   8AA6 20 F2         [ 3] 1452         bra     L8A9A  
   8AA8                    1453 L8AA8:
   8AA8 36            [ 3] 1454         psha
   8AA9 96 B1         [ 3] 1455         ldaa    (0x00B1)
   8AAB BD 8B 3B      [ 6] 1456         jsr     L8B3B
   8AAE 86 30         [ 2] 1457         ldaa    #0x30
   8AB0 97 B1         [ 3] 1458         staa    (0x00B1)
   8AB2 32            [ 4] 1459         pula
   8AB3                    1460 L8AB3:
   8AB3 1A 83 03 E8   [ 5] 1461         cpd     #0x03E8
   8AB7 25 08         [ 3] 1462         bcs     L8AC1  
   8AB9 7C 00 B1      [ 6] 1463         inc     (0x00B1)
   8ABC 83 03 E8      [ 4] 1464         subd    #0x03E8
   8ABF 20 F2         [ 3] 1465         bra     L8AB3  
   8AC1                    1466 L8AC1:
   8AC1 36            [ 3] 1467         psha
   8AC2 96 B1         [ 3] 1468         ldaa    (0x00B1)
   8AC4 BD 8B 3B      [ 6] 1469         jsr     L8B3B
   8AC7 86 30         [ 2] 1470         ldaa    #0x30
   8AC9 97 B1         [ 3] 1471         staa    (0x00B1)
   8ACB 32            [ 4] 1472         pula
   8ACC                    1473 L8ACC:
   8ACC 1A 83 00 64   [ 5] 1474         cpd     #0x0064
   8AD0 25 08         [ 3] 1475         bcs     L8ADA  
   8AD2 7C 00 B1      [ 6] 1476         inc     (0x00B1)
   8AD5 83 00 64      [ 4] 1477         subd    #0x0064
   8AD8 20 F2         [ 3] 1478         bra     L8ACC  
   8ADA                    1479 L8ADA:
   8ADA 96 B1         [ 3] 1480         ldaa    (0x00B1)
   8ADC BD 8B 3B      [ 6] 1481         jsr     L8B3B
   8ADF 86 30         [ 2] 1482         ldaa    #0x30
   8AE1 97 B1         [ 3] 1483         staa    (0x00B1)
   8AE3 17            [ 2] 1484         tba
   8AE4 7E 8A 71      [ 3] 1485         jmp     L8A71
                           1486 ; process ~...
   8AE7                    1487 L8AE7:
   8AE7 81 7E         [ 2] 1488         cmpa    #0x7E           ; is it a '~' ?
   8AE9 26 18         [ 3] 1489         bne     L8B03  
   8AEB E6 00         [ 4] 1490         ldab    0,X     
   8AED C0 30         [ 2] 1491         subb    #0x30
   8AEF 08            [ 3] 1492         inx
   8AF0 1A EE 00      [ 6] 1493         ldy     0,X     
   8AF3 08            [ 3] 1494         inx
   8AF4 08            [ 3] 1495         inx
   8AF5                    1496 L8AF5:
   8AF5 18 A6 00      [ 5] 1497         ldaa    0,Y     
   8AF8 18 08         [ 4] 1498         iny
   8AFA BD 8B 3B      [ 6] 1499         jsr     L8B3B
   8AFD 5A            [ 2] 1500         decb
   8AFE 26 F5         [ 3] 1501         bne     L8AF5  
   8B00 7E 8A 1B      [ 3] 1502         jmp     L8A1B
                           1503 ; process %...
   8B03                    1504 L8B03:
   8B03 81 25         [ 2] 1505         cmpa    #0x25           ; is it a '%' ?
   8B05 26 14         [ 3] 1506         bne     L8B1B  
   8B07 CE 05 90      [ 3] 1507         ldx     #0x0590
   8B0A CC 1B 5B      [ 3] 1508         ldd     #0x1B5B
   8B0D ED 00         [ 5] 1509         std     0,X     
   8B0F 86 4B         [ 2] 1510         ldaa    #0x4B
   8B11 A7 02         [ 4] 1511         staa    2,X
   8B13 6F 03         [ 6] 1512         clr     3,X
   8B15 BD 8A 1A      [ 6] 1513         jsr     L8A1A  
   8B18 7E 8A 1B      [ 3] 1514         jmp     L8A1B
   8B1B                    1515 L8B1B:
   8B1B B7 18 0F      [ 4] 1516         staa    SCCDATAA
   8B1E 7E 8A 1B      [ 3] 1517         jmp     L8A1B
   8B21                    1518 L8B21:
   8B21 38            [ 5] 1519         pulx
   8B22 39            [ 5] 1520         rts
                           1521 
                           1522 ; generate cursor positioning code
   8B23                    1523 L8B23:
   8B23 3C            [ 4] 1524         pshx
   8B24 CE 05 90      [ 3] 1525         ldx     #0x0590
   8B27 CC 1B 5B      [ 3] 1526         ldd     #0x1B5B
   8B2A ED 00         [ 5] 1527         std     0,X     
   8B2C 86 48         [ 2] 1528         ldaa    #0x48           ;'H'
   8B2E A7 07         [ 4] 1529         staa    7,X
   8B30 86 3B         [ 2] 1530         ldaa    #0x3B           ;';'
   8B32 A7 04         [ 4] 1531         staa    4,X
   8B34 6F 08         [ 6] 1532         clr     8,X
   8B36 BD 8A 1A      [ 6] 1533         jsr     L8A1A           ;012345678 - esc[01;23H;
   8B39 38            [ 5] 1534         pulx
   8B3A 39            [ 5] 1535         rts
                           1536 
                           1537 ;
   8B3B                    1538 L8B3B:
   8B3B 36            [ 3] 1539         psha
   8B3C                    1540 L8B3C:
   8B3C 86 04         [ 2] 1541         ldaa    #0x04
   8B3E B5 18 0D      [ 4] 1542         bita    SCCCTRLA
   8B41 27 F9         [ 3] 1543         beq     L8B3C
   8B43 32            [ 4] 1544         pula
   8B44 B7 18 0F      [ 4] 1545         staa    SCCDATAA
   8B47 39            [ 5] 1546         rts
                           1547 
   8B48                    1548 L8B48:
   8B48 BD A3 2E      [ 6] 1549         jsr     LA32E           ; open curtains
                           1550 
   8B4B BD 8D E4      [ 6] 1551         jsr     LCDMSG1 
   8B4E 4C 69 67 68 74 20  1552         .ascis  'Light Diagnostic'
        44 69 61 67 6E 6F
        73 74 69 E3
                           1553 
   8B5E BD 8D DD      [ 6] 1554         jsr     LCDMSG2 
   8B61 43 75 72 74 61 69  1555         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           1556 
   8B71 C6 14         [ 2] 1557         ldab    #0x14
   8B73 BD 8C 30      [ 6] 1558         jsr     DLYSECSBY2      ; delay 10 sec
   8B76 C6 FF         [ 2] 1559         ldab    #0xFF
   8B78 F7 10 98      [ 4] 1560         stab    (0x1098)
   8B7B F7 10 9A      [ 4] 1561         stab    (0x109A)
   8B7E F7 10 9C      [ 4] 1562         stab    (0x109C)
   8B81 F7 10 9E      [ 4] 1563         stab    (0x109E)
   8B84 BD F9 C5      [ 6] 1564         jsr     BUTNLIT 
   8B87 B6 18 04      [ 4] 1565         ldaa    PIA0PRA 
   8B8A 8A 40         [ 2] 1566         oraa    #0x40
   8B8C B7 18 04      [ 4] 1567         staa    PIA0PRA 
                           1568 
   8B8F BD 8D E4      [ 6] 1569         jsr     LCDMSG1 
   8B92 20 50 72 65 73 73  1570         .ascis  ' Press ENTER to '
        20 45 4E 54 45 52
        20 74 6F A0
                           1571 
   8BA2 BD 8D DD      [ 6] 1572         jsr     LCDMSG2 
   8BA5 74 75 72 6E 20 6C  1573         .ascis  'turn lights  off'
        69 67 68 74 73 20
        20 6F 66 E6
                           1574 
   8BB5                    1575 L8BB5:
   8BB5 BD 8E 95      [ 6] 1576         jsr     L8E95
   8BB8 81 0D         [ 2] 1577         cmpa    #0x0D
   8BBA 26 F9         [ 3] 1578         bne     L8BB5  
   8BBC BD A3 41      [ 6] 1579         jsr     LA341           ; close curtains
   8BBF 39            [ 5] 1580         rts
                           1581 
                           1582 ; setup IRQ handlers!
   8BC0                    1583 L8BC0:
   8BC0 86 80         [ 2] 1584         ldaa    #0x80
   8BC2 B7 10 22      [ 4] 1585         staa    TMSK1
   8BC5 CE AB CC      [ 3] 1586         ldx     #LABCC
   8BC8 FF 01 19      [ 5] 1587         stx     (0x0119)        ; setup T1OC handler
   8BCB CE AD 0C      [ 3] 1588         ldx     #LAD0C
                           1589 
   8BCE FF 01 16      [ 5] 1590         stx     (0x0116)        ; setup T2OC handler
   8BD1 CE AD 0C      [ 3] 1591         ldx     #LAD0C
   8BD4 FF 01 2E      [ 5] 1592         stx     (0x012E)        ; doubles as SWI handler
   8BD7 86 7E         [ 2] 1593         ldaa    #0x7E
   8BD9 B7 01 18      [ 4] 1594         staa    (0x0118)
   8BDC B7 01 15      [ 4] 1595         staa    (0x0115)
   8BDF B7 01 2D      [ 4] 1596         staa    (0x012D)
   8BE2 4F            [ 2] 1597         clra
   8BE3 5F            [ 2] 1598         clrb
   8BE4 DD 1B         [ 4] 1599         std     CDTIMR1         ; Reset all the countdown timers
   8BE6 DD 1D         [ 4] 1600         std     CDTIMR2
   8BE8 DD 1F         [ 4] 1601         std     CDTIMR3
   8BEA DD 21         [ 4] 1602         std     CDTIMR4
   8BEC DD 23         [ 4] 1603         std     CDTIMR5
                           1604 
   8BEE                    1605 L8BEE:
   8BEE 86 C0         [ 2] 1606         ldaa    #0xC0
   8BF0 B7 10 23      [ 4] 1607         staa    TFLG1
   8BF3 39            [ 5] 1608         rts
                           1609 
   8BF4                    1610 L8BF4:
   8BF4 B6 10 0A      [ 4] 1611         ldaa    PORTE
   8BF7 88 FF         [ 2] 1612         eora    #0xFF
   8BF9 16            [ 2] 1613         tab
   8BFA D7 62         [ 3] 1614         stab    (0x0062)
   8BFC BD F9 C5      [ 6] 1615         jsr     BUTNLIT 
   8BFF 20 F3         [ 3] 1616         bra     L8BF4  
   8C01 39            [ 5] 1617         rts
                           1618 
                           1619 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1620 
                           1621 ; Delay B seconds, with random motions if enabled
   8C02                    1622 DLYSECS:
   8C02 36            [ 3] 1623         psha
   8C03 86 64         [ 2] 1624         ldaa    #0x64
   8C05 3D            [10] 1625         mul
   8C06 DD 23         [ 4] 1626         std     CDTIMR5         ; store B*100 here
   8C08                    1627 L8C08:
   8C08 BD 9B 19      [ 6] 1628         jsr     L9B19           ; do the random motions if enabled
   8C0B DC 23         [ 4] 1629         ldd     CDTIMR5
   8C0D 26 F9         [ 3] 1630         bne     L8C08  
   8C0F 32            [ 4] 1631         pula
   8C10 39            [ 5] 1632         rts
                           1633 
                           1634 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1635 
                           1636 ; Delay 1 minute, with random motions if enabled - unused?
   8C11                    1637 DLY1MIN:
   8C11 36            [ 3] 1638         psha
   8C12 86 3C         [ 2] 1639         ldaa    #0x3C
   8C14                    1640 L8C14:
   8C14 97 28         [ 3] 1641         staa    (0x0028)
   8C16 C6 01         [ 2] 1642         ldab    #0x01           ; delay 1 sec
   8C18 BD 8C 02      [ 6] 1643         jsr     DLYSECS         ;
   8C1B 96 28         [ 3] 1644         ldaa    (0x0028)
   8C1D 4A            [ 2] 1645         deca
   8C1E 26 F4         [ 3] 1646         bne     L8C14  
   8C20 32            [ 4] 1647         pula
   8C21 39            [ 5] 1648         rts
                           1649 
                           1650 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1651 
                           1652 ; Delay by B hundreths of a second, with random motions if enabled
   8C22                    1653 DLYSECSBY100:
   8C22 36            [ 3] 1654         psha
   8C23 4F            [ 2] 1655         clra
   8C24 DD 23         [ 4] 1656         std     CDTIMR5
   8C26                    1657 L8C26:
   8C26 BD 9B 19      [ 6] 1658         jsr     L9B19           ; do the random motions if enabled
   8C29 7D 00 24      [ 6] 1659         tst     CDTIMR5+1
   8C2C 26 F8         [ 3] 1660         bne     L8C26
   8C2E 32            [ 4] 1661         pula
   8C2F 39            [ 5] 1662         rts
                           1663 
                           1664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1665 
                           1666 ; Delay by B half-seconds
   8C30                    1667 DLYSECSBY2:
   8C30 36            [ 3] 1668         psha
   8C31 86 32         [ 2] 1669         ldaa    #0x32           ; 50
   8C33 3D            [10] 1670         mul
   8C34 DD 23         [ 4] 1671         std     CDTIMR5
   8C36                    1672 L8C36:
   8C36 DC 23         [ 4] 1673         ldd     CDTIMR5
   8C38 26 FC         [ 3] 1674         bne     L8C36
   8C3A 32            [ 4] 1675         pula
   8C3B 39            [ 5] 1676         rts
                           1677 
                           1678 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1679 ; LCD routines
                           1680 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1681 
   8C3C                    1682 L8C3C:
   8C3C 86 FF         [ 2] 1683         ldaa    #0xFF
   8C3E B7 10 01      [ 4] 1684         staa    DDRA  
   8C41 86 FF         [ 2] 1685         ldaa    #0xFF
   8C43 B7 10 03      [ 4] 1686         staa    DDRG 
   8C46 B6 10 02      [ 4] 1687         ldaa    PORTG  
   8C49 8A 02         [ 2] 1688         oraa    #0x02
   8C4B B7 10 02      [ 4] 1689         staa    PORTG  
   8C4E 86 38         [ 2] 1690         ldaa    #0x38
   8C50 BD 8C 86      [ 6] 1691         jsr     L8C86           ; write byte to LCD
   8C53 86 38         [ 2] 1692         ldaa    #0x38
   8C55 BD 8C 86      [ 6] 1693         jsr     L8C86           ; write byte to LCD
   8C58 86 06         [ 2] 1694         ldaa    #0x06
   8C5A BD 8C 86      [ 6] 1695         jsr     L8C86           ; write byte to LCD
   8C5D 86 0E         [ 2] 1696         ldaa    #0x0E
   8C5F BD 8C 86      [ 6] 1697         jsr     L8C86           ; write byte to LCD
   8C62 86 01         [ 2] 1698         ldaa    #0x01
   8C64 BD 8C 86      [ 6] 1699         jsr     L8C86           ; write byte to LCD
   8C67 CE 00 FF      [ 3] 1700         ldx     #0x00FF
   8C6A                    1701 L8C6A:
   8C6A 01            [ 2] 1702         nop
   8C6B 01            [ 2] 1703         nop
   8C6C 09            [ 3] 1704         dex
   8C6D 26 FB         [ 3] 1705         bne     L8C6A  
   8C6F 39            [ 5] 1706         rts
                           1707 
                           1708 ; toggle LCD ENABLE
   8C70                    1709 L8C70:
   8C70 B6 10 02      [ 4] 1710         ldaa    PORTG  
   8C73 84 FD         [ 2] 1711         anda    #0xFD           ; clear LCD ENABLE
   8C75 B7 10 02      [ 4] 1712         staa    PORTG  
   8C78 8A 02         [ 2] 1713         oraa    #0x02           ; set LCD ENABLE
   8C7A B7 10 02      [ 4] 1714         staa    PORTG  
   8C7D 39            [ 5] 1715         rts
                           1716 
                           1717 ; Reset LCD buffer?
   8C7E                    1718 L8C7E:
   8C7E CC 05 00      [ 3] 1719         ldd     #0x0500         ; Reset LCD queue?
   8C81 DD 46         [ 4] 1720         std     (0x0046)        ; write pointer
   8C83 DD 44         [ 4] 1721         std     (0x0044)        ; read pointer?
   8C85 39            [ 5] 1722         rts
                           1723 
                           1724 ; write byte to LCD
   8C86                    1725 L8C86:
   8C86 BD 8C BD      [ 6] 1726         jsr     L8CBD           ; wait for LCD not busy
   8C89 B7 10 00      [ 4] 1727         staa    PORTA  
   8C8C B6 10 02      [ 4] 1728         ldaa    PORTG       
   8C8F 84 F3         [ 2] 1729         anda    #0xF3           ; LCD RS and LCD RW low
   8C91                    1730 L8C91:
   8C91 B7 10 02      [ 4] 1731         staa    PORTG  
   8C94 BD 8C 70      [ 6] 1732         jsr     L8C70           ; toggle LCD ENABLE
   8C97 39            [ 5] 1733         rts
                           1734 
                           1735 ; ???
   8C98                    1736 L8C98:
   8C98 BD 8C BD      [ 6] 1737         jsr     L8CBD           ; wait for LCD not busy
   8C9B B7 10 00      [ 4] 1738         staa    PORTA  
   8C9E B6 10 02      [ 4] 1739         ldaa    PORTG  
   8CA1 84 FB         [ 2] 1740         anda    #0xFB
   8CA3 8A 08         [ 2] 1741         oraa    #0x08
   8CA5 20 EA         [ 3] 1742         bra     L8C91  
   8CA7 BD 8C BD      [ 6] 1743         jsr     L8CBD           ; wait for LCD not busy
   8CAA B6 10 02      [ 4] 1744         ldaa    PORTG  
   8CAD 84 F7         [ 2] 1745         anda    #0xF7
   8CAF 8A 08         [ 2] 1746         oraa    #0x08
   8CB1 20 DE         [ 3] 1747         bra     L8C91  
   8CB3 BD 8C BD      [ 6] 1748         jsr     L8CBD           ; wait for LCD not busy
   8CB6 B6 10 02      [ 4] 1749         ldaa    PORTG  
   8CB9 8A 0C         [ 2] 1750         oraa    #0x0C
   8CBB 20 D4         [ 3] 1751         bra     L8C91  
                           1752 
                           1753 ; wait for LCD not busy (or timeout)
   8CBD                    1754 L8CBD:
   8CBD 36            [ 3] 1755         psha
   8CBE 37            [ 3] 1756         pshb
   8CBF C6 FF         [ 2] 1757         ldab    #0xFF           ; init timeout counter
   8CC1                    1758 L8CC1:
   8CC1 5D            [ 2] 1759         tstb
   8CC2 27 1A         [ 3] 1760         beq     L8CDE           ; times up, exit
   8CC4 B6 10 02      [ 4] 1761         ldaa    PORTG  
   8CC7 84 F7         [ 2] 1762         anda    #0xF7           ; bit 3 low
   8CC9 8A 04         [ 2] 1763         oraa    #0x04           ; bit 3 high
   8CCB B7 10 02      [ 4] 1764         staa    PORTG           ; LCD RS high
   8CCE BD 8C 70      [ 6] 1765         jsr     L8C70           ; toggle LCD ENABLE
   8CD1 7F 10 01      [ 6] 1766         clr     DDRA  
   8CD4 B6 10 00      [ 4] 1767         ldaa    PORTA           ; read busy flag from LCD
   8CD7 2B 08         [ 3] 1768         bmi     L8CE1           ; if busy, keep looping
   8CD9 86 FF         [ 2] 1769         ldaa    #0xFF
   8CDB B7 10 01      [ 4] 1770         staa    DDRA            ; port A back to outputs
   8CDE                    1771 L8CDE:
   8CDE 33            [ 4] 1772         pulb                    ; and exit
   8CDF 32            [ 4] 1773         pula
   8CE0 39            [ 5] 1774         rts
                           1775 
   8CE1                    1776 L8CE1:
   8CE1 5A            [ 2] 1777         decb                    ; decrement timer
   8CE2 86 FF         [ 2] 1778         ldaa    #0xFF
   8CE4 B7 10 01      [ 4] 1779         staa    DDRA            ; port A back to outputs
   8CE7 20 D8         [ 3] 1780         bra     L8CC1           ; loop
                           1781 
   8CE9                    1782 L8CE9:
   8CE9 BD 8C BD      [ 6] 1783         jsr     L8CBD           ; wait for LCD not busy
   8CEC 86 01         [ 2] 1784         ldaa    #0x01
   8CEE BD 8C 86      [ 6] 1785         jsr     L8C86           ; write byte to LCD
   8CF1 39            [ 5] 1786         rts
                           1787 
   8CF2                    1788 L8CF2:
   8CF2 BD 8C BD      [ 6] 1789         jsr     L8CBD           ; wait for LCD not busy
   8CF5 86 80         [ 2] 1790         ldaa    #0x80
   8CF7 BD 8D 14      [ 6] 1791         jsr     L8D14
   8CFA BD 8C BD      [ 6] 1792         jsr     L8CBD           ; wait for LCD not busy
   8CFD 86 80         [ 2] 1793         ldaa    #0x80
   8CFF BD 8C 86      [ 6] 1794         jsr     L8C86           ; write byte to LCD
   8D02 39            [ 5] 1795         rts
                           1796 
   8D03                    1797 L8D03:
   8D03 BD 8C BD      [ 6] 1798         jsr     L8CBD           ; wait for LCD not busy
   8D06 86 C0         [ 2] 1799         ldaa    #0xC0
   8D08 BD 8D 14      [ 6] 1800         jsr     L8D14
   8D0B BD 8C BD      [ 6] 1801         jsr     L8CBD           ; wait for LCD not busy
   8D0E 86 C0         [ 2] 1802         ldaa    #0xC0
   8D10 BD 8C 86      [ 6] 1803         jsr     L8C86           ; write byte to LCD
   8D13 39            [ 5] 1804         rts
                           1805 
   8D14                    1806 L8D14:
   8D14 BD 8C 86      [ 6] 1807         jsr     L8C86           ; write byte to LCD
   8D17 86 10         [ 2] 1808         ldaa    #0x10
   8D19 97 14         [ 3] 1809         staa    (0x0014)
   8D1B                    1810 L8D1B:
   8D1B BD 8C BD      [ 6] 1811         jsr     L8CBD           ; wait for LCD not busy
   8D1E 86 20         [ 2] 1812         ldaa    #0x20
   8D20 BD 8C 98      [ 6] 1813         jsr     L8C98
   8D23 7A 00 14      [ 6] 1814         dec     (0x0014)
   8D26 26 F3         [ 3] 1815         bne     L8D1B  
   8D28 39            [ 5] 1816         rts
                           1817 
   8D29                    1818 L8D29:
   8D29 86 0C         [ 2] 1819         ldaa    #0x0C
   8D2B BD 8E 4B      [ 6] 1820         jsr     L8E4B
   8D2E 39            [ 5] 1821         rts
                           1822 
                           1823 ; Unused?
   8D2F                    1824 L8D2F:
   8D2F 86 0E         [ 2] 1825         ldaa    #0x0E
   8D31 BD 8E 4B      [ 6] 1826         jsr     L8E4B
   8D34 39            [ 5] 1827         rts
                           1828 
   8D35                    1829 L8D35:
   8D35 7F 00 4A      [ 6] 1830         clr     (0x004A)
   8D38 7F 00 43      [ 6] 1831         clr     (0x0043)
   8D3B 18 DE 46      [ 5] 1832         ldy     (0x0046)
   8D3E 86 C0         [ 2] 1833         ldaa    #0xC0
   8D40 20 0B         [ 3] 1834         bra     L8D4D
                           1835 
   8D42                    1836 L8D42:
   8D42 7F 00 4A      [ 6] 1837         clr     (0x004A)
   8D45 7F 00 43      [ 6] 1838         clr     (0x0043)
   8D48 18 DE 46      [ 5] 1839         ldy     (0x0046)
   8D4B 86 80         [ 2] 1840         ldaa    #0x80
   8D4D                    1841 L8D4D:
   8D4D 18 A7 00      [ 5] 1842         staa    0,Y     
   8D50 18 6F 01      [ 7] 1843         clr     1,Y     
   8D53 18 08         [ 4] 1844         iny
   8D55 18 08         [ 4] 1845         iny
   8D57 18 8C 05 80   [ 5] 1846         cpy     #0x0580
   8D5B 25 04         [ 3] 1847         bcs     L8D61  
   8D5D 18 CE 05 00   [ 4] 1848         ldy     #0x0500
   8D61                    1849 L8D61:
   8D61 C6 0F         [ 2] 1850         ldab    #0x0F
   8D63                    1851 L8D63:
   8D63 96 4A         [ 3] 1852         ldaa    (0x004A)
   8D65 27 FC         [ 3] 1853         beq     L8D63  
   8D67 7F 00 4A      [ 6] 1854         clr     (0x004A)
   8D6A 5A            [ 2] 1855         decb
   8D6B 27 1A         [ 3] 1856         beq     L8D87  
   8D6D 81 24         [ 2] 1857         cmpa    #0x24
   8D6F 27 16         [ 3] 1858         beq     L8D87  
   8D71 18 6F 00      [ 7] 1859         clr     0,Y     
   8D74 18 A7 01      [ 5] 1860         staa    1,Y     
   8D77 18 08         [ 4] 1861         iny
   8D79 18 08         [ 4] 1862         iny
   8D7B 18 8C 05 80   [ 5] 1863         cpy     #0x0580
   8D7F 25 04         [ 3] 1864         bcs     L8D85  
   8D81 18 CE 05 00   [ 4] 1865         ldy     #0x0500
   8D85                    1866 L8D85:
   8D85 20 DC         [ 3] 1867         bra     L8D63  
   8D87                    1868 L8D87:
   8D87 5D            [ 2] 1869         tstb
   8D88 27 19         [ 3] 1870         beq     L8DA3  
   8D8A 86 20         [ 2] 1871         ldaa    #0x20
   8D8C                    1872 L8D8C:
   8D8C 18 6F 00      [ 7] 1873         clr     0,Y     
   8D8F 18 A7 01      [ 5] 1874         staa    1,Y     
   8D92 18 08         [ 4] 1875         iny
   8D94 18 08         [ 4] 1876         iny
   8D96 18 8C 05 80   [ 5] 1877         cpy     #0x0580
   8D9A 25 04         [ 3] 1878         bcs     L8DA0  
   8D9C 18 CE 05 00   [ 4] 1879         ldy     #0x0500
   8DA0                    1880 L8DA0:
   8DA0 5A            [ 2] 1881         decb
   8DA1 26 E9         [ 3] 1882         bne     L8D8C  
   8DA3                    1883 L8DA3:
   8DA3 18 6F 00      [ 7] 1884         clr     0,Y     
   8DA6 18 6F 01      [ 7] 1885         clr     1,Y     
   8DA9 18 DF 46      [ 5] 1886         sty     (0x0046)
   8DAC 96 19         [ 3] 1887         ldaa    (0x0019)
   8DAE 97 4E         [ 3] 1888         staa    (0x004E)
   8DB0 86 01         [ 2] 1889         ldaa    #0x01
   8DB2 97 43         [ 3] 1890         staa    (0x0043)
   8DB4 39            [ 5] 1891         rts
                           1892 
                           1893 ; display ASCII in B at location
   8DB5                    1894 L8DB5:
   8DB5 36            [ 3] 1895         psha
   8DB6 37            [ 3] 1896         pshb
   8DB7 C1 4F         [ 2] 1897         cmpb    #0x4F
   8DB9 22 13         [ 3] 1898         bhi     L8DCE  
   8DBB C1 28         [ 2] 1899         cmpb    #0x28
   8DBD 25 03         [ 3] 1900         bcs     L8DC2  
   8DBF 0C            [ 2] 1901         clc
   8DC0 C9 18         [ 2] 1902         adcb    #0x18
   8DC2                    1903 L8DC2:
   8DC2 0C            [ 2] 1904         clc
   8DC3 C9 80         [ 2] 1905         adcb    #0x80
   8DC5 17            [ 2] 1906         tba
   8DC6 BD 8E 4B      [ 6] 1907         jsr     L8E4B           ; send lcd command
   8DC9 33            [ 4] 1908         pulb
   8DCA 32            [ 4] 1909         pula
   8DCB BD 8E 70      [ 6] 1910         jsr     L8E70           ; send lcd char
   8DCE                    1911 L8DCE:
   8DCE 39            [ 5] 1912         rts
                           1913 
                           1914 ; 4 routines to write to the LCD display
                           1915 
                           1916 ; Write to the LCD 1st line - extend past the end of a normal display
   8DCF                    1917 LCDMSG1A:
   8DCF 18 DE 46      [ 5] 1918         ldy     (0x0046)        ; get buffer pointer
   8DD2 86 90         [ 2] 1919         ldaa    #0x90           ; command to set LCD RAM ptr to chr 0x10
   8DD4 20 13         [ 3] 1920         bra     L8DE9  
                           1921 
                           1922 ; Write to the LCD 2st line - extend past the end of a normal display
   8DD6                    1923 LCDMSG2A:
   8DD6 18 DE 46      [ 5] 1924         ldy     (0x0046)        ; get buffer pointer
   8DD9 86 D0         [ 2] 1925         ldaa    #0xD0           ; command to set LCD RAM ptr to chr 0x50
   8DDB 20 0C         [ 3] 1926         bra     L8DE9  
                           1927 
                           1928 ; Write to the LCD 2nd line
   8DDD                    1929 LCDMSG2:
   8DDD 18 DE 46      [ 5] 1930         ldy     (0x0046)        ; get buffer pointer
   8DE0 86 C0         [ 2] 1931         ldaa    #0xC0           ; command to set LCD RAM ptr to chr 0x40
   8DE2 20 05         [ 3] 1932         bra     L8DE9  
                           1933 
                           1934 ; Write to the LCD 1st line
   8DE4                    1935 LCDMSG1:
   8DE4 18 DE 46      [ 5] 1936         ldy     (0x0046)        ; get buffer pointer
   8DE7 86 80         [ 2] 1937         ldaa    #0x80           ; command to load LCD RAM ptr to chr 0x00
                           1938 
                           1939 ; Put LCD command into a buffer, 4 bytes for each entry?
   8DE9                    1940 L8DE9:
   8DE9 18 A7 00      [ 5] 1941         staa    0,Y             ; store command here
   8DEC 18 6F 01      [ 7] 1942         clr     1,Y             ; clear next byte
   8DEF 18 08         [ 4] 1943         iny
   8DF1 18 08         [ 4] 1944         iny
                           1945 
                           1946 ; Add characters at return address to LCD buffer
   8DF3 18 8C 05 80   [ 5] 1947         cpy     #0x0580         ; check for buffer overflow
   8DF7 25 04         [ 3] 1948         bcs     L8DFD           
   8DF9 18 CE 05 00   [ 4] 1949         ldy     #0x0500
   8DFD                    1950 L8DFD:
   8DFD 38            [ 5] 1951         pulx                    ; get start of data
   8DFE DF 17         [ 4] 1952         stx     (0x0017)        ; save this here
   8E00                    1953 L8E00:
   8E00 A6 00         [ 4] 1954         ldaa    0,X             ; get character
   8E02 27 36         [ 3] 1955         beq     L8E3A           ; is it 00, if so jump ahead
   8E04 2B 17         [ 3] 1956         bmi     L8E1D           ; high bit set, if so jump ahead
   8E06 18 6F 00      [ 7] 1957         clr     0,Y             ; add character
   8E09 18 A7 01      [ 5] 1958         staa    1,Y     
   8E0C 08            [ 3] 1959         inx
   8E0D 18 08         [ 4] 1960         iny
   8E0F 18 08         [ 4] 1961         iny
   8E11 18 8C 05 80   [ 5] 1962         cpy     #0x0580         ; check for buffer overflow
   8E15 25 E9         [ 3] 1963         bcs     L8E00  
   8E17 18 CE 05 00   [ 4] 1964         ldy     #0x0500
   8E1B 20 E3         [ 3] 1965         bra     L8E00  
                           1966 
   8E1D                    1967 L8E1D:
   8E1D 84 7F         [ 2] 1968         anda    #0x7F
   8E1F 18 6F 00      [ 7] 1969         clr     0,Y             ; add character
   8E22 18 A7 01      [ 5] 1970         staa    1,Y     
   8E25 18 6F 02      [ 7] 1971         clr     2,Y     
   8E28 18 6F 03      [ 7] 1972         clr     3,Y     
   8E2B 08            [ 3] 1973         inx
   8E2C 18 08         [ 4] 1974         iny
   8E2E 18 08         [ 4] 1975         iny
   8E30 18 8C 05 80   [ 5] 1976         cpy     #0x0580         ; check for overflow
   8E34 25 04         [ 3] 1977         bcs     L8E3A  
   8E36 18 CE 05 00   [ 4] 1978         ldy     #0x0500
                           1979 
   8E3A                    1980 L8E3A:
   8E3A 3C            [ 4] 1981         pshx                    ; put SP back
   8E3B 86 01         [ 2] 1982         ldaa    #0x01
   8E3D 97 43         [ 3] 1983         staa    (0x0043)        ; semaphore?
   8E3F DC 46         [ 4] 1984         ldd     (0x0046)
   8E41 18 6F 00      [ 7] 1985         clr     0,Y     
   8E44 18 6F 01      [ 7] 1986         clr     1,Y     
   8E47 18 DF 46      [ 5] 1987         sty     (0x0046)        ; save buffer pointer
   8E4A 39            [ 5] 1988         rts
                           1989 
                           1990 ; buffer LCD command?
   8E4B                    1991 L8E4B:
   8E4B 18 DE 46      [ 5] 1992         ldy     (0x0046)
   8E4E 18 A7 00      [ 5] 1993         staa    0,Y     
   8E51 18 6F 01      [ 7] 1994         clr     1,Y     
   8E54 18 08         [ 4] 1995         iny
   8E56 18 08         [ 4] 1996         iny
   8E58 18 8C 05 80   [ 5] 1997         cpy     #0x0580
   8E5C 25 04         [ 3] 1998         bcs     L8E62  
   8E5E 18 CE 05 00   [ 4] 1999         ldy     #0x0500
   8E62                    2000 L8E62:
   8E62 18 6F 00      [ 7] 2001         clr     0,Y     
   8E65 18 6F 01      [ 7] 2002         clr     1,Y     
   8E68 86 01         [ 2] 2003         ldaa    #0x01
   8E6A 97 43         [ 3] 2004         staa    (0x0043)
   8E6C 18 DF 46      [ 5] 2005         sty     (0x0046)
   8E6F 39            [ 5] 2006         rts
                           2007 
   8E70                    2008 L8E70:
   8E70 18 DE 46      [ 5] 2009         ldy     (0x0046)
   8E73 18 6F 00      [ 7] 2010         clr     0,Y     
   8E76 18 A7 01      [ 5] 2011         staa    1,Y     
   8E79 18 08         [ 4] 2012         iny
   8E7B 18 08         [ 4] 2013         iny
   8E7D 18 8C 05 80   [ 5] 2014         cpy     #0x0580
   8E81 25 04         [ 3] 2015         bcs     L8E87  
   8E83 18 CE 05 00   [ 4] 2016         ldy     #0x0500
   8E87                    2017 L8E87:
   8E87 18 6F 00      [ 7] 2018         clr     0,Y     
   8E8A 18 6F 01      [ 7] 2019         clr     1,Y     
   8E8D 86 01         [ 2] 2020         ldaa    #0x01
   8E8F 97 43         [ 3] 2021         staa    (0x0043)
   8E91 18 DF 46      [ 5] 2022         sty     (0x0046)
   8E94 39            [ 5] 2023         rts
                           2024 
                           2025 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2026 
                           2027 ; Read SCD switches
   8E95                    2028 L8E95:
   8E95 96 30         [ 3] 2029         ldaa    (0x0030)
   8E97 26 09         [ 3] 2030         bne     L8EA2       ; UP - return A=0x01
   8E99 96 31         [ 3] 2031         ldaa    (0x0031)
   8E9B 26 11         [ 3] 2032         bne     L8EAE       ; DOWN - return A=0x02
   8E9D 96 32         [ 3] 2033         ldaa    (0x0032)
   8E9F 26 19         [ 3] 2034         bne     L8EBA       ; ENTER - return A=0x0D
   8EA1 39            [ 5] 2035         rts                 ; return A=0x00
                           2036 
   8EA2                    2037 L8EA2:
   8EA2 7F 00 30      [ 6] 2038         clr     (0x0030)
   8EA5 7F 00 32      [ 6] 2039         clr     (0x0032)
   8EA8 7F 00 31      [ 6] 2040         clr     (0x0031)
   8EAB 86 01         [ 2] 2041         ldaa    #0x01
   8EAD 39            [ 5] 2042         rts
                           2043 
   8EAE                    2044 L8EAE:
   8EAE 7F 00 31      [ 6] 2045         clr     (0x0031)
   8EB1 7F 00 30      [ 6] 2046         clr     (0x0030)
   8EB4 7F 00 32      [ 6] 2047         clr     (0x0032)
   8EB7 86 02         [ 2] 2048         ldaa    #0x02
   8EB9 39            [ 5] 2049         rts
                           2050 
   8EBA                    2051 L8EBA:
   8EBA 7F 00 32      [ 6] 2052         clr     (0x0032)
   8EBD 7F 00 30      [ 6] 2053         clr     (0x0030)
   8EC0 7F 00 31      [ 6] 2054         clr     (0x0031)
   8EC3 86 0D         [ 2] 2055         ldaa    #0x0D
   8EC5 39            [ 5] 2056         rts
                           2057 
                           2058 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2059 
                           2060 ; Scan SCD keys into up=0x30,down=0x31,enter=0x32
   8EC6                    2061 L8EC6:
   8EC6 B6 18 04      [ 4] 2062         ldaa    PIA0PRA 
   8EC9 84 07         [ 2] 2063         anda    #0x07       ; get button state
   8ECB 97 2C         [ 3] 2064         staa    (0x002C)
   8ECD 78 00 2C      [ 6] 2065         asl     (0x002C)
   8ED0 78 00 2C      [ 6] 2066         asl     (0x002C)
   8ED3 78 00 2C      [ 6] 2067         asl     (0x002C)
   8ED6 78 00 2C      [ 6] 2068         asl     (0x002C)
   8ED9 78 00 2C      [ 6] 2069         asl     (0x002C)    ; put in upper 3 bits of 002C 
   8EDC CE 00 00      [ 3] 2070         ldx     #0x0000
   8EDF                    2071 L8EDF:
   8EDF 8C 00 03      [ 4] 2072         cpx     #0x0003
   8EE2 27 24         [ 3] 2073         beq     L8F08
   8EE4 78 00 2C      [ 6] 2074         asl     (0x002C)    
   8EE7 25 12         [ 3] 2075         bcs     L8EFB       ; if button not pressed, jump
   8EE9 A6 2D         [ 4] 2076         ldaa    0x2D,X
   8EEB 81 0F         [ 2] 2077         cmpa    #0x0F       ; has it been pressed for 15
   8EED 24 1A         [ 3] 2078         bcc     L8F09       ; do key repeat, if not enter
   8EEF 6C 2D         [ 6] 2079         inc     0x2D,X      ; nope, inc it
   8EF1 A6 2D         [ 4] 2080         ldaa    0x2D,X
   8EF3 81 02         [ 2] 2081         cmpa    #0x02       ; has it been pressed for 2?
   8EF5 26 02         [ 3] 2082         bne     L8EF9       ; nope
   8EF7 A7 30         [ 4] 2083         staa    0x30,X      ; short press - store count (2) in 0x30/0x31/0x32
   8EF9                    2084 L8EF9:
   8EF9 20 0A         [ 3] 2085         bra     L8F05  
   8EFB                    2086 L8EFB:                      ; 
   8EFB 6F 2D         [ 6] 2087         clr     0x2D,X      ; clear 2D/2E/2F if not pressed
   8EFD 20 06         [ 3] 2088         bra     L8F05  
   8EFF A6 2D         [ 4] 2089         ldaa    0x2D,X
   8F01 27 02         [ 3] 2090         beq     L8F05  
   8F03 6A 2D         [ 6] 2091         dec     0x2D,X
   8F05                    2092 L8F05:
   8F05 08            [ 3] 2093         inx
   8F06 20 D7         [ 3] 2094         bra     L8EDF  
   8F08                    2095 L8F08:
   8F08 39            [ 5] 2096         rts
                           2097 
   8F09                    2098 L8F09:
   8F09 8C 00 02      [ 4] 2099         cpx     #0x0002
   8F0C 27 02         [ 3] 2100         beq     L8F10  
   8F0E 6F 2D         [ 6] 2101         clr     0x2D,X      ; do kbd repeat for up and down
   8F10                    2102 L8F10:
   8F10 20 F3         [ 3] 2103         bra     L8F05
                           2104 
                           2105 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2106 
                           2107 ; Read Front Panel Switches
   8F12                    2108 L8F12:
   8F12 B6 10 0A      [ 4] 2109         ldaa    PORTE
   8F15 97 51         [ 3] 2110         staa    (0x0051)
   8F17 CE 00 00      [ 3] 2111         ldx     #0x0000
   8F1A                    2112 L8F1A:
   8F1A 8C 00 08      [ 4] 2113         cpx     #0x0008
   8F1D 27 22         [ 3] 2114         beq     L8F41  
   8F1F 77 00 51      [ 6] 2115         asr     (0x0051)
   8F22 25 10         [ 3] 2116         bcs     L8F34  
   8F24 A6 52         [ 4] 2117         ldaa    0x52,X
   8F26 81 0F         [ 2] 2118         cmpa    #0x0F
   8F28 6C 52         [ 6] 2119         inc     0x52,X
   8F2A A6 52         [ 4] 2120         ldaa    0x52,X
   8F2C 81 04         [ 2] 2121         cmpa    #0x04
   8F2E 26 02         [ 3] 2122         bne     L8F32  
   8F30 A7 5A         [ 4] 2123         staa    0x5A,X
   8F32                    2124 L8F32:
   8F32 20 0A         [ 3] 2125         bra     L8F3E  
   8F34                    2126 L8F34:
   8F34 6F 52         [ 6] 2127         clr     0x52,X
   8F36 20 06         [ 3] 2128         bra     L8F3E  
   8F38 A6 52         [ 4] 2129         ldaa    0x52,X
   8F3A 27 02         [ 3] 2130         beq     L8F3E  
   8F3C 6A 52         [ 6] 2131         dec     0x52,X
   8F3E                    2132 L8F3E:
   8F3E 08            [ 3] 2133         inx
   8F3F 20 D9         [ 3] 2134         bra     L8F1A  
   8F41                    2135 L8F41:
   8F41 39            [ 5] 2136         rts
                           2137 
   8F42 6F 52         [ 6] 2138         clr     0x52,X
   8F44 20 F8         [ 3] 2139         bra     L8F3E  
                           2140 
                           2141 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2142 
   8F46                    2143 L8F46:
   8F46 30 2E 35           2144         .ascii      '0.5'
   8F49 31 2E 30           2145         .ascii      '1.0'
   8F4C 31 2E 35           2146         .ascii      '1.5'
   8F4F 32 2E 30           2147         .ascii      '2.0'
   8F52 32 2E 35           2148         .ascii      '2.5'
   8F55 33 2E 30           2149         .ascii      '3.0'
                           2150 
   8F58                    2151 L8F58:
   8F58 3C            [ 4] 2152         pshx
   8F59 96 12         [ 3] 2153         ldaa    (0x0012)
   8F5B 80 01         [ 2] 2154         suba    #0x01
   8F5D C6 03         [ 2] 2155         ldab    #0x03
   8F5F 3D            [10] 2156         mul
   8F60 CE 8F 46      [ 3] 2157         ldx     #L8F46
   8F63 3A            [ 3] 2158         abx
   8F64 C6 2C         [ 2] 2159         ldab    #0x2C
   8F66                    2160 L8F66:
   8F66 A6 00         [ 4] 2161         ldaa    0,X     
   8F68 08            [ 3] 2162         inx
   8F69 BD 8D B5      [ 6] 2163         jsr     L8DB5           ; display char here on LCD display
   8F6C 5C            [ 2] 2164         incb
   8F6D C1 2F         [ 2] 2165         cmpb    #0x2F
   8F6F 26 F5         [ 3] 2166         bne     L8F66  
   8F71 38            [ 5] 2167         pulx
   8F72 39            [ 5] 2168         rts
                           2169 
   8F73                    2170 L8F73:
   8F73 36            [ 3] 2171         psha
   8F74 BD 8C F2      [ 6] 2172         jsr     L8CF2
   8F77 C6 02         [ 2] 2173         ldab    #0x02
   8F79 BD 8C 30      [ 6] 2174         jsr     DLYSECSBY2   
   8F7C 32            [ 4] 2175         pula
   8F7D 97 B4         [ 3] 2176         staa    (0x00B4)
   8F7F 81 03         [ 2] 2177         cmpa    #0x03
   8F81 26 11         [ 3] 2178         bne     L8F94  
                           2179 
   8F83 BD 8D E4      [ 6] 2180         jsr     LCDMSG1 
   8F86 43 68 75 63 6B 20  2181         .ascis  'Chuck    '
        20 20 A0
                           2182 
   8F8F CE 90 72      [ 3] 2183         ldx     #L9072
   8F92 20 4D         [ 3] 2184         bra     L8FE1  
   8F94                    2185 L8F94:
   8F94 81 04         [ 2] 2186         cmpa    #0x04
   8F96 26 11         [ 3] 2187         bne     L8FA9  
                           2188 
   8F98 BD 8D E4      [ 6] 2189         jsr     LCDMSG1 
   8F9B 4A 61 73 70 65 72  2190         .ascis  'Jasper   '
        20 20 A0
                           2191 
   8FA4 CE 90 DE      [ 3] 2192         ldx     #L90DE
   8FA7 20 38         [ 3] 2193         bra     L8FE1  
   8FA9                    2194 L8FA9:
   8FA9 81 05         [ 2] 2195         cmpa    #0x05
   8FAB 26 11         [ 3] 2196         bne     L8FBE  
                           2197 
   8FAD BD 8D E4      [ 6] 2198         jsr     LCDMSG1 
   8FB0 50 61 73 71 75 61  2199         .ascis  'Pasqually'
        6C 6C F9
                           2200 
   8FB9 CE 91 45      [ 3] 2201         ldx     #L9145
   8FBC 20 23         [ 3] 2202         bra     L8FE1  
   8FBE                    2203 L8FBE:
   8FBE 81 06         [ 2] 2204         cmpa    #0x06
   8FC0 26 11         [ 3] 2205         bne     L8FD3  
                           2206 
   8FC2 BD 8D E4      [ 6] 2207         jsr     LCDMSG1 
   8FC5 4D 75 6E 63 68 20  2208         .ascis  'Munch    '
        20 20 A0
                           2209 
   8FCE CE 91 BA      [ 3] 2210         ldx     #L91BA
   8FD1 20 0E         [ 3] 2211         bra     L8FE1  
   8FD3                    2212 L8FD3:
   8FD3 BD 8D E4      [ 6] 2213         jsr     LCDMSG1 
   8FD6 48 65 6C 65 6E 20  2214         .ascis  'Helen   '
        20 A0
                           2215 
   8FDE CE 92 26      [ 3] 2216         ldx     #L9226
   8FE1                    2217 L8FE1:
   8FE1 96 B4         [ 3] 2218         ldaa    (0x00B4)
   8FE3 80 03         [ 2] 2219         suba    #0x03
   8FE5 48            [ 2] 2220         asla
   8FE6 48            [ 2] 2221         asla
   8FE7 97 4B         [ 3] 2222         staa    (0x004B)
   8FE9 BD 95 04      [ 6] 2223         jsr     L9504
   8FEC 97 4C         [ 3] 2224         staa    (0x004C)
   8FEE 81 0F         [ 2] 2225         cmpa    #0x0F
   8FF0 26 01         [ 3] 2226         bne     L8FF3  
   8FF2 39            [ 5] 2227         rts
                           2228 
   8FF3                    2229 L8FF3:
   8FF3 81 08         [ 2] 2230         cmpa    #0x08
   8FF5 23 08         [ 3] 2231         bls     L8FFF  
   8FF7 80 08         [ 2] 2232         suba    #0x08
   8FF9 D6 4B         [ 3] 2233         ldab    (0x004B)
   8FFB CB 02         [ 2] 2234         addb    #0x02
   8FFD D7 4B         [ 3] 2235         stab    (0x004B)
   8FFF                    2236 L8FFF:
   8FFF 36            [ 3] 2237         psha
   9000 18 DE 46      [ 5] 2238         ldy     (0x0046)
   9003 32            [ 4] 2239         pula
   9004 5F            [ 2] 2240         clrb
   9005 0D            [ 2] 2241         sec
   9006                    2242 L9006:
   9006 59            [ 2] 2243         rolb
   9007 4A            [ 2] 2244         deca
   9008 26 FC         [ 3] 2245         bne     L9006  
   900A D7 50         [ 3] 2246         stab    (0x0050)
   900C D6 4B         [ 3] 2247         ldab    (0x004B)
   900E CE 10 80      [ 3] 2248         ldx     #0x1080
   9011 3A            [ 3] 2249         abx
   9012 86 02         [ 2] 2250         ldaa    #0x02
   9014 97 12         [ 3] 2251         staa    (0x0012)
   9016                    2252 L9016:
   9016 A6 00         [ 4] 2253         ldaa    0,X     
   9018 98 50         [ 3] 2254         eora    (0x0050)
   901A A7 00         [ 4] 2255         staa    0,X     
   901C 6D 00         [ 6] 2256         tst     0,X     
   901E 27 16         [ 3] 2257         beq     L9036  
   9020 86 4F         [ 2] 2258         ldaa    #0x4F           ;'O'
   9022 C6 0C         [ 2] 2259         ldab    #0x0C        
   9024 BD 8D B5      [ 6] 2260         jsr     L8DB5           ; display char here on LCD display
   9027 86 6E         [ 2] 2261         ldaa    #0x6E           ;'n'
   9029 C6 0D         [ 2] 2262         ldab    #0x0D
   902B BD 8D B5      [ 6] 2263         jsr     L8DB5           ; display char here on LCD display
   902E CC 20 0E      [ 3] 2264         ldd     #0x200E         ;' '
   9031 BD 8D B5      [ 6] 2265         jsr     L8DB5           ; display char here on LCD display
   9034 20 0E         [ 3] 2266         bra     L9044  
   9036                    2267 L9036:
   9036 86 66         [ 2] 2268         ldaa    #0x66           ;'f'
   9038 C6 0D         [ 2] 2269         ldab    #0x0D
   903A BD 8D B5      [ 6] 2270         jsr     L8DB5           ; display char here on LCD display
   903D 86 66         [ 2] 2271         ldaa    #0x66           ;'f'
   903F C6 0E         [ 2] 2272         ldab    #0x0E
   9041 BD 8D B5      [ 6] 2273         jsr     L8DB5           ; display char here on LCD display
   9044                    2274 L9044:
   9044 D6 12         [ 3] 2275         ldab    (0x0012)
   9046 BD 8C 30      [ 6] 2276         jsr     DLYSECSBY2      ; delay in half-seconds
   9049 BD 8E 95      [ 6] 2277         jsr     L8E95
   904C 81 0D         [ 2] 2278         cmpa    #0x0D
   904E 27 14         [ 3] 2279         beq     L9064  
   9050 20 C4         [ 3] 2280         bra     L9016  
   9052 81 02         [ 2] 2281         cmpa    #0x02
   9054 26 C0         [ 3] 2282         bne     L9016  
   9056 96 12         [ 3] 2283         ldaa    (0x0012)
   9058 81 06         [ 2] 2284         cmpa    #0x06
   905A 27 BA         [ 3] 2285         beq     L9016  
   905C 4C            [ 2] 2286         inca
   905D 97 12         [ 3] 2287         staa    (0x0012)
   905F BD 8F 58      [ 6] 2288         jsr     L8F58
   9062 20 B2         [ 3] 2289         bra     L9016  
   9064                    2290 L9064:
   9064 A6 00         [ 4] 2291         ldaa    0,X     
   9066 9A 50         [ 3] 2292         oraa    (0x0050)
   9068 98 50         [ 3] 2293         eora    (0x0050)
   906A A7 00         [ 4] 2294         staa    0,X     
   906C 96 B4         [ 3] 2295         ldaa    (0x00B4)
   906E 7E 8F 73      [ 3] 2296         jmp     L8F73
   9071 39            [ 5] 2297         rts
                           2298 
   9072                    2299 L9072:
   9072 4D 6F 75 74 68 2C  2300         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   90DE                    2301 L90DE:
   90DE 4D 6F 75 74 68 2C  2302         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Hands,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9145                    2303 L9145:
   9145 4D 6F 75 74 68 2D  2304         .ascis  'Mouth-Mustache,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   91BA                    2305 L91BA:
   91BA 4D 6F 75 74 68 2C  2306         .ascis  'Mouth,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9226                    2307 L9226:
   9226 4D 6F 75 74 68 2C  2308         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
                           2309         
                           2310 ; code again
   9292                    2311 L9292:
   9292 BD 86 C4      [ 6] 2312         jsr     L86C4           ; Reset boards 1-10
   9295                    2313 L9295:
   9295 C6 01         [ 2] 2314         ldab    #0x01
   9297 BD 8C 30      [ 6] 2315         jsr     DLYSECSBY2      ; delay 0.5 sec
                           2316 
   929A BD 8D E4      [ 6] 2317         jsr     LCDMSG1 
   929D 20 20 44 69 61 67  2318         .ascis  '  Diagnostics   '
        6E 6F 73 74 69 63
        73 20 20 A0
                           2319 
   92AD BD 8D DD      [ 6] 2320         jsr     LCDMSG2 
   92B0 20 20 20 20 20 20  2321         .ascis  '                '
        20 20 20 20 20 20
        20 20 20 A0
                           2322 
   92C0 C6 01         [ 2] 2323         ldab    #0x01
   92C2 BD 8C 30      [ 6] 2324         jsr     DLYSECSBY2      ; delay 0.5 sec
   92C5 BD 8D 03      [ 6] 2325         jsr     L8D03
   92C8 CE 93 D3      [ 3] 2326         ldx     #L93D3
   92CB BD 95 04      [ 6] 2327         jsr     L9504
   92CE 81 11         [ 2] 2328         cmpa    #0x11
   92D0 26 14         [ 3] 2329         bne     L92E6
   92D2                    2330 L92D2:
   92D2 BD 86 C4      [ 6] 2331         jsr     L86C4           ; Reset boards 1-10
   92D5 5F            [ 2] 2332         clrb
   92D6 D7 62         [ 3] 2333         stab    (0x0062)
   92D8 BD F9 C5      [ 6] 2334         jsr     BUTNLIT 
   92DB B6 18 04      [ 4] 2335         ldaa    PIA0PRA 
   92DE 84 BF         [ 2] 2336         anda    #0xBF
   92E0 B7 18 04      [ 4] 2337         staa    PIA0PRA 
   92E3 7E 81 D7      [ 3] 2338         jmp     L81D7
   92E6                    2339 L92E6:
   92E6 81 03         [ 2] 2340         cmpa    #0x03
   92E8 25 09         [ 3] 2341         bcs     L92F3  
   92EA 81 08         [ 2] 2342         cmpa    #0x08
   92EC 24 05         [ 3] 2343         bcc     L92F3  
   92EE BD 8F 73      [ 6] 2344         jsr     L8F73
   92F1 20 A2         [ 3] 2345         bra     L9295  
   92F3                    2346 L92F3:
   92F3 81 02         [ 2] 2347         cmpa    #0x02
   92F5 26 08         [ 3] 2348         bne     L92FF  
   92F7 BD 9F 1E      [ 6] 2349         jsr     L9F1E
   92FA 25 99         [ 3] 2350         bcs     L9295  
   92FC 7E 96 75      [ 3] 2351         jmp     L9675
   92FF                    2352 L92FF:
   92FF 81 0B         [ 2] 2353         cmpa    #0x0B
   9301 26 0D         [ 3] 2354         bne     L9310  
   9303 BD 8D 03      [ 6] 2355         jsr     L8D03
   9306 BD 9E CC      [ 6] 2356         jsr     L9ECC
   9309 C6 03         [ 2] 2357         ldab    #0x03
   930B BD 8C 30      [ 6] 2358         jsr     DLYSECSBY2      ; delay 1.5 sec
   930E 20 85         [ 3] 2359         bra     L9295  
   9310                    2360 L9310:
   9310 81 09         [ 2] 2361         cmpa    #0x09
   9312 26 0E         [ 3] 2362         bne     L9322  
   9314 BD 9F 1E      [ 6] 2363         jsr     L9F1E
   9317 24 03         [ 3] 2364         bcc     L931C  
   9319 7E 92 95      [ 3] 2365         jmp     L9295
   931C                    2366 L931C:
   931C BD 9E 92      [ 6] 2367         jsr     L9E92           ; reset R counts
   931F 7E 92 95      [ 3] 2368         jmp     L9295
   9322                    2369 L9322:
   9322 81 0A         [ 2] 2370         cmpa    #0x0A
   9324 26 0B         [ 3] 2371         bne     L9331  
   9326 BD 9F 1E      [ 6] 2372         jsr     L9F1E
   9329 25 03         [ 3] 2373         bcs     L932E  
   932B BD 9E AF      [ 6] 2374         jsr     L9EAF           ; reset L counts
   932E                    2375 L932E:
   932E 7E 92 95      [ 3] 2376         jmp     L9295
   9331                    2377 L9331:
   9331 81 01         [ 2] 2378         cmpa    #0x01
   9333 26 03         [ 3] 2379         bne     L9338  
   9335 7E A0 E9      [ 3] 2380         jmp     LA0E9
   9338                    2381 L9338:
   9338 81 08         [ 2] 2382         cmpa    #0x08
   933A 26 1F         [ 3] 2383         bne     L935B  
   933C BD 9F 1E      [ 6] 2384         jsr     L9F1E
   933F 25 1A         [ 3] 2385         bcs     L935B  
                           2386 
   9341 BD 8D E4      [ 6] 2387         jsr     LCDMSG1 
   9344 52 65 73 65 74 20  2388         .ascis  'Reset System!'
        53 79 73 74 65 6D
        A1
                           2389 
   9351 7E A2 49      [ 3] 2390         jmp     LA249
   9354 C6 02         [ 2] 2391         ldab    #0x02
   9356 BD 8C 30      [ 6] 2392         jsr     DLYSECSBY2      ; delay 1 sec
   9359 20 18         [ 3] 2393         bra     L9373  
   935B                    2394 L935B:
   935B 81 0C         [ 2] 2395         cmpa    #0x0C
   935D 26 14         [ 3] 2396         bne     L9373  
   935F BD 8B 48      [ 6] 2397         jsr     L8B48
   9362 5F            [ 2] 2398         clrb
   9363 D7 62         [ 3] 2399         stab    (0x0062)
   9365 BD F9 C5      [ 6] 2400         jsr     BUTNLIT 
   9368 B6 18 04      [ 4] 2401         ldaa    PIA0PRA 
   936B 84 BF         [ 2] 2402         anda    #0xBF
   936D B7 18 04      [ 4] 2403         staa    PIA0PRA 
   9370 7E 92 92      [ 3] 2404         jmp     L9292
   9373                    2405 L9373:
   9373 81 0D         [ 2] 2406         cmpa    #0x0D
   9375 26 2E         [ 3] 2407         bne     L93A5  
   9377 BD 8C E9      [ 6] 2408         jsr     L8CE9
                           2409 
   937A BD 8D E4      [ 6] 2410         jsr     LCDMSG1 
   937D 20 20 42 75 74 74  2411         .ascis  '  Button  test'
        6F 6E 20 20 74 65
        73 F4
                           2412 
   938B BD 8D DD      [ 6] 2413         jsr     LCDMSG2 
   938E 20 20 20 50 52 4F  2414         .ascis  '   PROG exits'
        47 20 65 78 69 74
        F3
                           2415 
   939B BD A5 26      [ 6] 2416         jsr     LA526
   939E 5F            [ 2] 2417         clrb
   939F BD F9 C5      [ 6] 2418         jsr     BUTNLIT 
   93A2 7E 92 95      [ 3] 2419         jmp     L9295
   93A5                    2420 L93A5:
   93A5 81 0E         [ 2] 2421         cmpa    #0x0E
   93A7 26 10         [ 3] 2422         bne     L93B9  
   93A9 BD 9F 1E      [ 6] 2423         jsr     L9F1E
   93AC 24 03         [ 3] 2424         bcc     L93B1  
   93AE 7E 92 95      [ 3] 2425         jmp     L9295
   93B1                    2426 L93B1:
   93B1 C6 01         [ 2] 2427         ldab    #0x01
   93B3 BD 8C 30      [ 6] 2428         jsr     DLYSECSBY2      ; delay 0.5 sec
   93B6 7E 94 9A      [ 3] 2429         jmp     L949A
   93B9                    2430 L93B9:
   93B9 81 0F         [ 2] 2431         cmpa    #0x0F
   93BB 26 06         [ 3] 2432         bne     L93C3  
   93BD BD A8 6A      [ 6] 2433         jsr     LA86A
   93C0 7E 92 95      [ 3] 2434         jmp     L9295
   93C3                    2435 L93C3:
   93C3 81 10         [ 2] 2436         cmpa    #0x10
   93C5 26 09         [ 3] 2437         bne     L93D0  
   93C7 BD 9F 1E      [ 6] 2438         jsr     L9F1E
   93CA BD 95 BA      [ 6] 2439         jsr     L95BA
   93CD 7E 92 95      [ 3] 2440         jmp     L9295
                           2441 
   93D0                    2442 L93D0:
   93D0 7E 92 D2      [ 3] 2443         jmp     L92D2
                           2444 
   93D3                    2445 L93D3:
   93D3 56 43 52 20 61 64  2446         .ascis  "VCR adjust,Set Random,Chuck E. Cheese,Jasper,Pasqually,Munch,Helen,Reset System,Reset reg tape#,Reset liv tape#,View Tape #'s,All Lights On,Button test,King enable,Warm-Up,Show Type,Quit Diagnostics"
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
   9499 00                 2447         .byte   0x00
                           2448 
   949A                    2449 L949A:
   949A 7D 04 2A      [ 6] 2450         tst     (0x042A)
   949D 27 27         [ 3] 2451         beq     L94C6  
                           2452 
   949F BD 8D E4      [ 6] 2453         jsr     LCDMSG1 
   94A2 4B 69 6E 67 20 69  2454         .ascis  'King is Enabled'
        73 20 45 6E 61 62
        6C 65 E4
                           2455 
   94B1 BD 8D DD      [ 6] 2456         jsr     LCDMSG2 
   94B4 45 4E 54 45 52 20  2457         .ascis  'ENTER to disable'
        74 6F 20 64 69 73
        61 62 6C E5
                           2458 
   94C4 20 25         [ 3] 2459         bra     L94EB  
                           2460 
   94C6                    2461 L94C6:
   94C6 BD 8D E4      [ 6] 2462         jsr     LCDMSG1 
   94C9 4B 69 6E 67 20 69  2463         .ascis  'King is Disabled'
        73 20 44 69 73 61
        62 6C 65 E4
                           2464 
   94D9 BD 8D DD      [ 6] 2465         jsr     LCDMSG2 
   94DC 45 4E 54 45 52 20  2466         .ascis  'ENTER to enable'
        74 6F 20 65 6E 61
        62 6C E5
                           2467 
   94EB                    2468 L94EB:
   94EB BD 8E 95      [ 6] 2469         jsr     L8E95
   94EE 4D            [ 2] 2470         tsta
   94EF 27 FA         [ 3] 2471         beq     L94EB  
   94F1 81 0D         [ 2] 2472         cmpa    #0x0D
   94F3 27 02         [ 3] 2473         beq     L94F7  
   94F5 20 0A         [ 3] 2474         bra     L9501  
   94F7                    2475 L94F7:
   94F7 B6 04 2A      [ 4] 2476         ldaa    (0x042A)
   94FA 84 01         [ 2] 2477         anda    #0x01
   94FC 88 01         [ 2] 2478         eora    #0x01
   94FE B7 04 2A      [ 4] 2479         staa    (0x042A)
   9501                    2480 L9501:
   9501 7E 92 95      [ 3] 2481         jmp     L9295
   9504                    2482 L9504:
   9504 86 01         [ 2] 2483         ldaa    #0x01
   9506 97 A6         [ 3] 2484         staa    (0x00A6)
   9508 97 A7         [ 3] 2485         staa    (0x00A7)
   950A DF 12         [ 4] 2486         stx     (0x0012)
   950C 20 09         [ 3] 2487         bra     L9517  
   950E 86 01         [ 2] 2488         ldaa    #0x01
   9510 97 A7         [ 3] 2489         staa    (0x00A7)
   9512 7F 00 A6      [ 6] 2490         clr     (0x00A6)
   9515 DF 12         [ 4] 2491         stx     (0x0012)
   9517                    2492 L9517:
   9517 7F 00 16      [ 6] 2493         clr     (0x0016)
   951A 18 DE 46      [ 5] 2494         ldy     (0x0046)
   951D 7D 00 A6      [ 6] 2495         tst     (0x00A6)
   9520 26 07         [ 3] 2496         bne     L9529  
   9522 BD 8C F2      [ 6] 2497         jsr     L8CF2
   9525 86 80         [ 2] 2498         ldaa    #0x80
   9527 20 05         [ 3] 2499         bra     L952E  
   9529                    2500 L9529:
   9529 BD 8D 03      [ 6] 2501         jsr     L8D03
   952C 86 C0         [ 2] 2502         ldaa    #0xC0
   952E                    2503 L952E:
   952E 18 A7 00      [ 5] 2504         staa    0,Y     
   9531 18 6F 01      [ 7] 2505         clr     1,Y     
   9534 18 08         [ 4] 2506         iny
   9536 18 08         [ 4] 2507         iny
   9538 18 8C 05 80   [ 5] 2508         cpy     #0x0580
   953C 25 04         [ 3] 2509         bcs     L9542  
   953E 18 CE 05 00   [ 4] 2510         ldy     #0x0500
   9542                    2511 L9542:
   9542 DF 14         [ 4] 2512         stx     (0x0014)
   9544                    2513 L9544:
   9544 A6 00         [ 4] 2514         ldaa    0,X     
   9546 2A 04         [ 3] 2515         bpl     L954C  
   9548 C6 01         [ 2] 2516         ldab    #0x01
   954A D7 16         [ 3] 2517         stab    (0x0016)
   954C                    2518 L954C:
   954C 81 2C         [ 2] 2519         cmpa    #0x2C
   954E 27 1E         [ 3] 2520         beq     L956E  
   9550 18 6F 00      [ 7] 2521         clr     0,Y     
   9553 84 7F         [ 2] 2522         anda    #0x7F
   9555 18 A7 01      [ 5] 2523         staa    1,Y     
   9558 18 08         [ 4] 2524         iny
   955A 18 08         [ 4] 2525         iny
   955C 18 8C 05 80   [ 5] 2526         cpy     #0x0580
   9560 25 04         [ 3] 2527         bcs     L9566  
   9562 18 CE 05 00   [ 4] 2528         ldy     #0x0500
   9566                    2529 L9566:
   9566 7D 00 16      [ 6] 2530         tst     (0x0016)
   9569 26 03         [ 3] 2531         bne     L956E  
   956B 08            [ 3] 2532         inx
   956C 20 D6         [ 3] 2533         bra     L9544  
   956E                    2534 L956E:
   956E 08            [ 3] 2535         inx
   956F 86 01         [ 2] 2536         ldaa    #0x01
   9571 97 43         [ 3] 2537         staa    (0x0043)
   9573 18 6F 00      [ 7] 2538         clr     0,Y     
   9576 18 6F 01      [ 7] 2539         clr     1,Y     
   9579 18 DF 46      [ 5] 2540         sty     (0x0046)
   957C                    2541 L957C:
   957C BD 8E 95      [ 6] 2542         jsr     L8E95
   957F 27 FB         [ 3] 2543         beq     L957C  
   9581 81 02         [ 2] 2544         cmpa    #0x02
   9583 26 0A         [ 3] 2545         bne     L958F  
   9585 7D 00 16      [ 6] 2546         tst     (0x0016)
   9588 26 05         [ 3] 2547         bne     L958F  
   958A 7C 00 A7      [ 6] 2548         inc     (0x00A7)
   958D 20 88         [ 3] 2549         bra     L9517  
   958F                    2550 L958F:
   958F 81 01         [ 2] 2551         cmpa    #0x01
   9591 26 20         [ 3] 2552         bne     L95B3  
   9593 18 DE 14      [ 5] 2553         ldy     (0x0014)
   9596 18 9C 12      [ 6] 2554         cpy     (0x0012)
   9599 23 E1         [ 3] 2555         bls     L957C  
   959B 7A 00 A7      [ 6] 2556         dec     (0x00A7)
   959E DE 14         [ 4] 2557         ldx     (0x0014)
   95A0 09            [ 3] 2558         dex
   95A1                    2559 L95A1:
   95A1 09            [ 3] 2560         dex
   95A2 9C 12         [ 5] 2561         cpx     (0x0012)
   95A4 26 03         [ 3] 2562         bne     L95A9  
   95A6 7E 95 17      [ 3] 2563         jmp     L9517
   95A9                    2564 L95A9:
   95A9 A6 00         [ 4] 2565         ldaa    0,X     
   95AB 81 2C         [ 2] 2566         cmpa    #0x2C
   95AD 26 F2         [ 3] 2567         bne     L95A1  
   95AF 08            [ 3] 2568         inx
   95B0 7E 95 17      [ 3] 2569         jmp     L9517
   95B3                    2570 L95B3:
   95B3 81 0D         [ 2] 2571         cmpa    #0x0D
   95B5 26 C5         [ 3] 2572         bne     L957C  
   95B7 96 A7         [ 3] 2573         ldaa    (0x00A7)
   95B9 39            [ 5] 2574         rts
                           2575 
   95BA                    2576 L95BA:
   95BA B6 04 5C      [ 4] 2577         ldaa    (0x045C)
   95BD 27 14         [ 3] 2578         beq     L95D3  
                           2579 
   95BF BD 8D E4      [ 6] 2580         jsr     LCDMSG1 
   95C2 43 75 72 72 65 6E  2581         .ascis  'Current: CNR   '
        74 3A 20 43 4E 52
        20 20 A0
                           2582 
   95D1 20 12         [ 3] 2583         bra     L95E5  
                           2584 
   95D3                    2585 L95D3:
   95D3 BD 8D E4      [ 6] 2586         jsr     LCDMSG1 
   95D6 43 75 72 72 65 6E  2587         .ascis  'Current: R12   '
        74 3A 20 52 31 32
        20 20 A0
                           2588 
   95E5                    2589 L95E5:
   95E5 BD 8D DD      [ 6] 2590         jsr     LCDMSG2 
   95E8 3C 45 6E 74 65 72  2591         .ascis  '<Enter> to chg.'
        3E 20 74 6F 20 63
        68 67 AE
                           2592 
   95F7                    2593 L95F7:
   95F7 BD 8E 95      [ 6] 2594         jsr     L8E95
   95FA 27 FB         [ 3] 2595         beq     L95F7  
   95FC 81 0D         [ 2] 2596         cmpa    #0x0D
   95FE 26 0F         [ 3] 2597         bne     L960F  
   9600 B6 04 5C      [ 4] 2598         ldaa    (0x045C)
   9603 27 05         [ 3] 2599         beq     L960A  
   9605 7F 04 5C      [ 6] 2600         clr     (0x045C)
   9608 20 05         [ 3] 2601         bra     L960F  
   960A                    2602 L960A:
   960A 86 01         [ 2] 2603         ldaa    #0x01
   960C B7 04 5C      [ 4] 2604         staa    (0x045C)
   960F                    2605 L960F:
   960F 39            [ 5] 2606         rts
                           2607 
   9610                    2608 L9610:
   9610 43 68 75 63 6B 2C  2609         .ascis  "Chuck,Jasper,Pasqually,Munch,Helen,Light 1,Light 2,Light 3,Star EFX,Wink Spot,Gobo,Clear All Rnd,Exit"
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
                           2610 
   9675                    2611 L9675:
   9675 BD 8D E4      [ 6] 2612         jsr     LCDMSG1 
   9678 52 61 6E 64 6F 6D  2613         .ascis  'Random          '
        20 20 20 20 20 20
        20 20 20 A0
                           2614 
   9688 CE 96 10      [ 3] 2615         ldx     #L9610
   968B BD 95 04      [ 6] 2616         jsr     L9504
   968E 5F            [ 2] 2617         clrb
   968F 37            [ 3] 2618         pshb
   9690 81 0D         [ 2] 2619         cmpa    #0x0D
   9692 26 03         [ 3] 2620         bne     L9697  
   9694 7E 97 5B      [ 3] 2621         jmp     L975B
   9697                    2622 L9697:
   9697 81 0C         [ 2] 2623         cmpa    #0x0C
   9699 26 21         [ 3] 2624         bne     L96BC  
   969B 7F 04 01      [ 6] 2625         clr     (0x0401)
   969E 7F 04 2B      [ 6] 2626         clr     (0x042B)
                           2627 
   96A1 BD 8D E4      [ 6] 2628         jsr     LCDMSG1 
   96A4 41 6C 6C 20 52 6E  2629         .ascis  'All Rnd Cleared!'
        64 20 43 6C 65 61
        72 65 64 A1
                           2630 
   96B4 C6 64         [ 2] 2631         ldab    #0x64           ; delay 1 sec
   96B6 BD 8C 22      [ 6] 2632         jsr     DLYSECSBY100
   96B9 7E 97 5B      [ 3] 2633         jmp     L975B
   96BC                    2634 L96BC:
   96BC 81 09         [ 2] 2635         cmpa    #0x09
   96BE 25 05         [ 3] 2636         bcs     L96C5  
   96C0 80 08         [ 2] 2637         suba    #0x08
   96C2 33            [ 4] 2638         pulb
   96C3 5C            [ 2] 2639         incb
   96C4 37            [ 3] 2640         pshb
   96C5                    2641 L96C5:
   96C5 5F            [ 2] 2642         clrb
   96C6 0D            [ 2] 2643         sec
   96C7                    2644 L96C7:
   96C7 59            [ 2] 2645         rolb
   96C8 4A            [ 2] 2646         deca
   96C9 26 FC         [ 3] 2647         bne     L96C7  
   96CB D7 12         [ 3] 2648         stab    (0x0012)
   96CD C8 FF         [ 2] 2649         eorb    #0xFF
   96CF D7 13         [ 3] 2650         stab    (0x0013)
   96D1                    2651 L96D1:
   96D1 CC 20 34      [ 3] 2652         ldd     #0x2034         ;' '
   96D4 BD 8D B5      [ 6] 2653         jsr     L8DB5           ; display char here on LCD display
   96D7 33            [ 4] 2654         pulb
   96D8 37            [ 3] 2655         pshb
   96D9 5D            [ 2] 2656         tstb
   96DA 27 05         [ 3] 2657         beq     L96E1  
   96DC B6 04 2B      [ 4] 2658         ldaa    (0x042B)
   96DF 20 03         [ 3] 2659         bra     L96E4  
   96E1                    2660 L96E1:
   96E1 B6 04 01      [ 4] 2661         ldaa    (0x0401)
   96E4                    2662 L96E4:
   96E4 94 12         [ 3] 2663         anda    (0x0012)
   96E6 27 0A         [ 3] 2664         beq     L96F2  
   96E8 18 DE 46      [ 5] 2665         ldy     (0x0046)
   96EB BD 8D FD      [ 6] 2666         jsr     L8DFD
   96EE 4F            [ 2] 2667         clra
   96EF EE 20         [ 5] 2668         ldx     0x20,X
   96F1 09            [ 3] 2669         dex
   96F2                    2670 L96F2:
   96F2 18 DE 46      [ 5] 2671         ldy     (0x0046)
   96F5 BD 8D FD      [ 6] 2672         jsr     L8DFD
   96F8 4F            [ 2] 2673         clra
   96F9 66 E6         [ 6] 2674         ror     0xE6,X
   96FB CC 20 34      [ 3] 2675         ldd     #0x2034         ;' '
   96FE BD 8D B5      [ 6] 2676         jsr     L8DB5           ; display char here on LCD display
   9701                    2677 L9701:
   9701 BD 8E 95      [ 6] 2678         jsr     L8E95           ; wait for an SCD key
   9704 27 FB         [ 3] 2679         beq     L9701  
   9706 81 01         [ 2] 2680         cmpa    #0x01           ; is it up?
   9708 26 22         [ 3] 2681         bne     L972C           ; no jump ahead
   970A 33            [ 4] 2682         pulb
   970B 37            [ 3] 2683         pshb
   970C 5D            [ 2] 2684         tstb
   970D 27 0A         [ 3] 2685         beq     L9719           ; if B=0, modify 0401 mask  
   970F B6 04 2B      [ 4] 2686         ldaa    (0x042B)        ; else modify 042B mask
   9712 9A 12         [ 3] 2687         oraa    (0x0012)
   9714 B7 04 2B      [ 4] 2688         staa    (0x042B)
   9717 20 08         [ 3] 2689         bra     L9721  
   9719                    2690 L9719:
   9719 B6 04 01      [ 4] 2691         ldaa    (0x0401)
   971C 9A 12         [ 3] 2692         oraa    (0x0012)
   971E B7 04 01      [ 4] 2693         staa    (0x0401)
   9721                    2694 L9721:
   9721 18 DE 46      [ 5] 2695         ldy     (0x0046)
   9724 BD 8D FD      [ 6] 2696         jsr     L8DFD
   9727 4F            [ 2] 2697         clra
   9728 6E A0         [ 3] 2698         jmp     0xA0,X
   972A 20 A5         [ 3] 2699         bra     L96D1  
   972C                    2700 L972C:
   972C 81 02         [ 2] 2701         cmpa    #0x02
   972E 26 23         [ 3] 2702         bne     L9753  
   9730 33            [ 4] 2703         pulb
   9731 37            [ 3] 2704         pshb
   9732 5D            [ 2] 2705         tstb
   9733 27 0A         [ 3] 2706         beq     L973F  
   9735 B6 04 2B      [ 4] 2707         ldaa    (0x042B)
   9738 94 13         [ 3] 2708         anda    (0x0013)
   973A B7 04 2B      [ 4] 2709         staa    (0x042B)
   973D 20 08         [ 3] 2710         bra     L9747  
   973F                    2711 L973F:
   973F B6 04 01      [ 4] 2712         ldaa    (0x0401)
   9742 94 13         [ 3] 2713         anda    (0x0013)
   9744 B7 04 01      [ 4] 2714         staa    (0x0401)
   9747                    2715 L9747:
   9747 18 DE 46      [ 5] 2716         ldy     (0x0046)
   974A BD 8D FD      [ 6] 2717         jsr     L8DFD
   974D 4F            [ 2] 2718         clra
   974E 66 E6         [ 6] 2719         ror     0xE6,X
   9750 7E 96 D1      [ 3] 2720         jmp     L96D1
   9753                    2721 L9753:
   9753 81 0D         [ 2] 2722         cmpa    #0x0D
   9755 26 AA         [ 3] 2723         bne     L9701  
   9757 33            [ 4] 2724         pulb
   9758 7E 96 75      [ 3] 2725         jmp     L9675
   975B                    2726 L975B:
   975B 33            [ 4] 2727         pulb
   975C 7E 92 92      [ 3] 2728         jmp     L9292
                           2729 
                           2730 ; do program rom checksum, and display it on the LCD screen
   975F                    2731 L975F:
   975F CE 00 00      [ 3] 2732         ldx     #0x0000
   9762 18 CE 80 00   [ 4] 2733         ldy     #0x8000
   9766                    2734 L9766:
   9766 18 E6 00      [ 5] 2735         ldab    0,Y     
   9769 18 08         [ 4] 2736         iny
   976B 3A            [ 3] 2737         abx
   976C 18 8C 00 00   [ 5] 2738         cpy     #0x0000
   9770 26 F4         [ 3] 2739         bne     L9766  
   9772 DF 17         [ 4] 2740         stx     (0x0017)        ; store rom checksum here
   9774 96 17         [ 3] 2741         ldaa    (0x0017)        ; get high byte of checksum
   9776 BD 97 9B      [ 6] 2742         jsr     L979B           ; convert it to 2 hex chars
   9779 96 12         [ 3] 2743         ldaa    (0x0012)
   977B C6 33         [ 2] 2744         ldab    #0x33
   977D BD 8D B5      [ 6] 2745         jsr     L8DB5           ; display char 1 here on LCD display
   9780 96 13         [ 3] 2746         ldaa    (0x0013)
   9782 C6 34         [ 2] 2747         ldab    #0x34
   9784 BD 8D B5      [ 6] 2748         jsr     L8DB5           ; display char 2 here on LCD display
   9787 96 18         [ 3] 2749         ldaa    (0x0018)        ; get low byte of checksum
   9789 BD 97 9B      [ 6] 2750         jsr     L979B           ; convert it to 2 hex chars
   978C 96 12         [ 3] 2751         ldaa    (0x0012)
   978E C6 35         [ 2] 2752         ldab    #0x35
   9790 BD 8D B5      [ 6] 2753         jsr     L8DB5           ; display char 1 here on LCD display
   9793 96 13         [ 3] 2754         ldaa    (0x0013)
   9795 C6 36         [ 2] 2755         ldab    #0x36
   9797 BD 8D B5      [ 6] 2756         jsr     L8DB5           ; display char 2 here on LCD display
   979A 39            [ 5] 2757         rts
                           2758 
                           2759 ; convert A to ASCII hex digit, store in (0x0012:0x0013)
   979B                    2760 L979B:
   979B 36            [ 3] 2761         psha
   979C 84 0F         [ 2] 2762         anda    #0x0F
   979E 8B 30         [ 2] 2763         adda    #0x30
   97A0 81 39         [ 2] 2764         cmpa    #0x39
   97A2 23 02         [ 3] 2765         bls     L97A6  
   97A4 8B 07         [ 2] 2766         adda    #0x07
   97A6                    2767 L97A6:
   97A6 97 13         [ 3] 2768         staa    (0x0013)
   97A8 32            [ 4] 2769         pula
   97A9 84 F0         [ 2] 2770         anda    #0xF0
   97AB 44            [ 2] 2771         lsra
   97AC 44            [ 2] 2772         lsra
   97AD 44            [ 2] 2773         lsra
   97AE 44            [ 2] 2774         lsra
   97AF 8B 30         [ 2] 2775         adda    #0x30
   97B1 81 39         [ 2] 2776         cmpa    #0x39
   97B3 23 02         [ 3] 2777         bls     L97B7  
   97B5 8B 07         [ 2] 2778         adda    #0x07
   97B7                    2779 L97B7:
   97B7 97 12         [ 3] 2780         staa    (0x0012)
   97B9 39            [ 5] 2781         rts
                           2782 
   97BA                    2783 L97BA:
   97BA BD 9D 18      [ 6] 2784         jsr     L9D18
   97BD 24 03         [ 3] 2785         bcc     L97C2  
   97BF 7E 9A 7F      [ 3] 2786         jmp     L9A7F
   97C2                    2787 L97C2:
   97C2 7D 00 79      [ 6] 2788         tst     (0x0079)
   97C5 26 0B         [ 3] 2789         bne     L97D2  
   97C7 FC 04 10      [ 5] 2790         ldd     (0x0410)
   97CA C3 00 01      [ 4] 2791         addd    #0x0001
   97CD FD 04 10      [ 5] 2792         std     (0x0410)
   97D0 20 09         [ 3] 2793         bra     L97DB  
   97D2                    2794 L97D2:
   97D2 FC 04 12      [ 5] 2795         ldd     (0x0412)
   97D5 C3 00 01      [ 4] 2796         addd    #0x0001
   97D8 FD 04 12      [ 5] 2797         std     (0x0412)
   97DB                    2798 L97DB:
   97DB 86 78         [ 2] 2799         ldaa    #0x78
   97DD 97 63         [ 3] 2800         staa    (0x0063)
   97DF 97 64         [ 3] 2801         staa    (0x0064)
   97E1 BD A3 13      [ 6] 2802         jsr     LA313
   97E4 BD AA DB      [ 6] 2803         jsr     LAADB
   97E7 86 01         [ 2] 2804         ldaa    #0x01
   97E9 97 4E         [ 3] 2805         staa    (0x004E)
   97EB 97 76         [ 3] 2806         staa    (0x0076)
   97ED 7F 00 75      [ 6] 2807         clr     (0x0075)
   97F0 7F 00 77      [ 6] 2808         clr     (0x0077)
   97F3 BD 87 AE      [ 6] 2809         jsr     L87AE
   97F6 D6 7B         [ 3] 2810         ldab    (0x007B)
   97F8 CA 20         [ 2] 2811         orab    #0x20
   97FA C4 F7         [ 2] 2812         andb    #0xF7
   97FC BD 87 48      [ 6] 2813         jsr     L8748   
   97FF 7E 85 A4      [ 3] 2814         jmp     L85A4
   9802                    2815 L9802:
   9802 7F 00 76      [ 6] 2816         clr     (0x0076)
   9805 7F 00 75      [ 6] 2817         clr     (0x0075)
   9808 7F 00 77      [ 6] 2818         clr     (0x0077)
   980B 7F 00 4E      [ 6] 2819         clr     (0x004E)
   980E D6 7B         [ 3] 2820         ldab    (0x007B)
   9810 CA 0C         [ 2] 2821         orab    #0x0C
   9812 BD 87 48      [ 6] 2822         jsr     L8748
   9815                    2823 L9815:
   9815 BD A3 1E      [ 6] 2824         jsr     LA31E
   9818 BD 86 C4      [ 6] 2825         jsr     L86C4           ; Reset boards 1-10
   981B BD 9C 51      [ 6] 2826         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   981E BD 8E 95      [ 6] 2827         jsr     L8E95
   9821 7E 84 4D      [ 3] 2828         jmp     L844D
   9824                    2829 L9824:
   9824 BD 9C 51      [ 6] 2830         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9827 7F 00 4E      [ 6] 2831         clr     (0x004E)
   982A D6 7B         [ 3] 2832         ldab    (0x007B)
   982C CA 24         [ 2] 2833         orab    #0x24
   982E C4 F7         [ 2] 2834         andb    #0xF7
   9830 BD 87 48      [ 6] 2835         jsr     L8748   
   9833 BD 87 AE      [ 6] 2836         jsr     L87AE
   9836 BD 8E 95      [ 6] 2837         jsr     L8E95
   9839 7E 84 4D      [ 3] 2838         jmp     L844D
   983C                    2839 L983C:
   983C 7F 00 78      [ 6] 2840         clr     (0x0078)
   983F B6 10 8A      [ 4] 2841         ldaa    (0x108A)
   9842 84 F9         [ 2] 2842         anda    #0xF9
   9844 B7 10 8A      [ 4] 2843         staa    (0x108A)
   9847 7D 00 AF      [ 6] 2844         tst     (0x00AF)
   984A 26 61         [ 3] 2845         bne     L98AD  
   984C 96 62         [ 3] 2846         ldaa    (0x0062)
   984E 84 01         [ 2] 2847         anda    #0x01
   9850 27 5B         [ 3] 2848         beq     L98AD  
   9852 C6 FD         [ 2] 2849         ldab    #0xFD           ; tape deck STOP
   9854 BD 86 E7      [ 6] 2850         jsr     L86E7
   9857 CC 00 32      [ 3] 2851         ldd     #0x0032
   985A DD 1B         [ 4] 2852         std     CDTIMR1
   985C CC 75 30      [ 3] 2853         ldd     #0x7530
   985F DD 1D         [ 4] 2854         std     CDTIMR2
   9861 7F 00 5A      [ 6] 2855         clr     (0x005A)
   9864                    2856 L9864:
   9864 BD 9B 19      [ 6] 2857         jsr     L9B19           ; do the random motions if enabled
   9867 7D 00 31      [ 6] 2858         tst     (0x0031)
   986A 26 04         [ 3] 2859         bne     L9870  
   986C 96 5A         [ 3] 2860         ldaa    (0x005A)
   986E 27 19         [ 3] 2861         beq     L9889  
   9870                    2862 L9870:
   9870 7F 00 31      [ 6] 2863         clr     (0x0031)
   9873 D6 62         [ 3] 2864         ldab    (0x0062)
   9875 C4 FE         [ 2] 2865         andb    #0xFE
   9877 D7 62         [ 3] 2866         stab    (0x0062)
   9879 BD F9 C5      [ 6] 2867         jsr     BUTNLIT 
   987C BD AA 13      [ 6] 2868         jsr     LAA13
   987F C6 FB         [ 2] 2869         ldab    #0xFB           ; tape deck PLAY
   9881 BD 86 E7      [ 6] 2870         jsr     L86E7
   9884 7F 00 5A      [ 6] 2871         clr     (0x005A)
   9887 20 4B         [ 3] 2872         bra     L98D4  
   9889                    2873 L9889:
   9889 DC 1B         [ 4] 2874         ldd     CDTIMR1
   988B 26 D7         [ 3] 2875         bne     L9864  
   988D D6 62         [ 3] 2876         ldab    (0x0062)
   988F C8 01         [ 2] 2877         eorb    #0x01
   9891 D7 62         [ 3] 2878         stab    (0x0062)
   9893 BD F9 C5      [ 6] 2879         jsr     BUTNLIT 
   9896 C4 01         [ 2] 2880         andb    #0x01
   9898 26 05         [ 3] 2881         bne     L989F  
   989A BD AA 0C      [ 6] 2882         jsr     LAA0C
   989D 20 03         [ 3] 2883         bra     L98A2  
   989F                    2884 L989F:
   989F BD AA 13      [ 6] 2885         jsr     LAA13
   98A2                    2886 L98A2:
   98A2 CC 00 32      [ 3] 2887         ldd     #0x0032
   98A5 DD 1B         [ 4] 2888         std     CDTIMR1
   98A7 DC 1D         [ 4] 2889         ldd     CDTIMR2
   98A9 27 C5         [ 3] 2890         beq     L9870  
   98AB 20 B7         [ 3] 2891         bra     L9864  
   98AD                    2892 L98AD:
   98AD 7D 00 75      [ 6] 2893         tst     (0x0075)
   98B0 27 03         [ 3] 2894         beq     L98B5  
   98B2 7E 99 39      [ 3] 2895         jmp     L9939
   98B5                    2896 L98B5:
   98B5 96 62         [ 3] 2897         ldaa    (0x0062)
   98B7 84 02         [ 2] 2898         anda    #0x02
   98B9 27 4E         [ 3] 2899         beq     L9909  
   98BB 7D 00 AF      [ 6] 2900         tst     (0x00AF)
   98BE 26 0B         [ 3] 2901         bne     L98CB  
   98C0 FC 04 24      [ 5] 2902         ldd     (0x0424)
   98C3 C3 00 01      [ 4] 2903         addd    #0x0001
   98C6 FD 04 24      [ 5] 2904         std     (0x0424)
   98C9 20 09         [ 3] 2905         bra     L98D4  
   98CB                    2906 L98CB:
   98CB FC 04 22      [ 5] 2907         ldd     (0x0422)
   98CE C3 00 01      [ 4] 2908         addd    #0x0001
   98D1 FD 04 22      [ 5] 2909         std     (0x0422)
   98D4                    2910 L98D4:
   98D4 FC 04 18      [ 5] 2911         ldd     (0x0418)
   98D7 C3 00 01      [ 4] 2912         addd    #0x0001
   98DA FD 04 18      [ 5] 2913         std     (0x0418)
   98DD 86 78         [ 2] 2914         ldaa    #0x78
   98DF 97 63         [ 3] 2915         staa    (0x0063)
   98E1 97 64         [ 3] 2916         staa    (0x0064)
   98E3 D6 62         [ 3] 2917         ldab    (0x0062)
   98E5 C4 F7         [ 2] 2918         andb    #0xF7
   98E7 CA 02         [ 2] 2919         orab    #0x02
   98E9 D7 62         [ 3] 2920         stab    (0x0062)
   98EB BD F9 C5      [ 6] 2921         jsr     BUTNLIT 
   98EE BD AA 18      [ 6] 2922         jsr     LAA18
   98F1 86 01         [ 2] 2923         ldaa    #0x01
   98F3 97 4E         [ 3] 2924         staa    (0x004E)
   98F5 97 75         [ 3] 2925         staa    (0x0075)
   98F7 D6 7B         [ 3] 2926         ldab    (0x007B)
   98F9 C4 DF         [ 2] 2927         andb    #0xDF
   98FB BD 87 48      [ 6] 2928         jsr     L8748   
   98FE BD 87 AE      [ 6] 2929         jsr     L87AE
   9901 BD A3 13      [ 6] 2930         jsr     LA313
   9904 BD AA DB      [ 6] 2931         jsr     LAADB
   9907 20 30         [ 3] 2932         bra     L9939  
   9909                    2933 L9909:
   9909 D6 62         [ 3] 2934         ldab    (0x0062)
   990B C4 F5         [ 2] 2935         andb    #0xF5
   990D CA 40         [ 2] 2936         orab    #0x40
   990F D7 62         [ 3] 2937         stab    (0x0062)
   9911 BD F9 C5      [ 6] 2938         jsr     BUTNLIT 
   9914 BD AA 1D      [ 6] 2939         jsr     LAA1D
   9917 7D 00 AF      [ 6] 2940         tst     (0x00AF)
   991A 26 04         [ 3] 2941         bne     L9920  
   991C C6 01         [ 2] 2942         ldab    #0x01
   991E D7 B6         [ 3] 2943         stab    (0x00B6)
   9920                    2944 L9920:
   9920 BD 9C 51      [ 6] 2945         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9923 7F 00 4E      [ 6] 2946         clr     (0x004E)
   9926 7F 00 75      [ 6] 2947         clr     (0x0075)
   9929 86 01         [ 2] 2948         ldaa    #0x01
   992B 97 77         [ 3] 2949         staa    (0x0077)
   992D D6 7B         [ 3] 2950         ldab    (0x007B)
   992F CA 24         [ 2] 2951         orab    #0x24
   9931 C4 F7         [ 2] 2952         andb    #0xF7
   9933 BD 87 48      [ 6] 2953         jsr     L8748   
   9936 BD 87 91      [ 6] 2954         jsr     L8791   
   9939                    2955 L9939:
   9939 7F 00 AF      [ 6] 2956         clr     (0x00AF)
   993C 7E 85 A4      [ 3] 2957         jmp     L85A4
   993F                    2958 L993F:
   993F 7F 00 77      [ 6] 2959         clr     (0x0077)
   9942 BD 9C 51      [ 6] 2960         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9945 7F 00 4E      [ 6] 2961         clr     (0x004E)
   9948 D6 62         [ 3] 2962         ldab    (0x0062)
   994A C4 BF         [ 2] 2963         andb    #0xBF
   994C 7D 00 75      [ 6] 2964         tst     (0x0075)
   994F 27 02         [ 3] 2965         beq     L9953  
   9951 C4 FD         [ 2] 2966         andb    #0xFD
   9953                    2967 L9953:
   9953 D7 62         [ 3] 2968         stab    (0x0062)
   9955 BD F9 C5      [ 6] 2969         jsr     BUTNLIT 
   9958 BD AA 1D      [ 6] 2970         jsr     LAA1D
   995B 7F 00 5B      [ 6] 2971         clr     (0x005B)
   995E BD 87 AE      [ 6] 2972         jsr     L87AE
   9961 D6 7B         [ 3] 2973         ldab    (0x007B)
   9963 CA 20         [ 2] 2974         orab    #0x20
   9965 BD 87 48      [ 6] 2975         jsr     L8748   
   9968 7F 00 75      [ 6] 2976         clr     (0x0075)
   996B 7F 00 76      [ 6] 2977         clr     (0x0076)
   996E 7E 98 15      [ 3] 2978         jmp     L9815
   9971                    2979 L9971:
   9971 D6 7B         [ 3] 2980         ldab    (0x007B)
   9973 C4 FB         [ 2] 2981         andb    #0xFB
   9975 BD 87 48      [ 6] 2982         jsr     L8748   
   9978 7E 85 A4      [ 3] 2983         jmp     L85A4
   997B                    2984 L997B:
   997B D6 7B         [ 3] 2985         ldab    (0x007B)
   997D CA 04         [ 2] 2986         orab    #0x04
   997F BD 87 48      [ 6] 2987         jsr     L8748   
   9982 7E 85 A4      [ 3] 2988         jmp     L85A4
   9985                    2989 L9985:
   9985 D6 7B         [ 3] 2990         ldab    (0x007B)
   9987 C4 F7         [ 2] 2991         andb    #0xF7
   9989 BD 87 48      [ 6] 2992         jsr     L8748   
   998C 7E 85 A4      [ 3] 2993         jmp     L85A4
   998F                    2994 L998F:
   998F 7D 00 77      [ 6] 2995         tst     (0x0077)
   9992 26 07         [ 3] 2996         bne     L999B
   9994 D6 7B         [ 3] 2997         ldab    (0x007B)
   9996 CA 08         [ 2] 2998         orab    #0x08
   9998 BD 87 48      [ 6] 2999         jsr     L8748   
   999B                    3000 L999B:
   999B 7E 85 A4      [ 3] 3001         jmp     L85A4
   999E                    3002 L999E:
   999E D6 7B         [ 3] 3003         ldab    (0x007B)
   99A0 C4 F3         [ 2] 3004         andb    #0xF3
   99A2 BD 87 48      [ 6] 3005         jsr     L8748   
   99A5 39            [ 5] 3006         rts
                           3007 
                           3008 ; main2
   99A6                    3009 L99A6:
   99A6 D6 7B         [ 3] 3010         ldab    (0x007B)
   99A8 C4 DF         [ 2] 3011         andb    #0xDF           ; clear bit 5
   99AA BD 87 48      [ 6] 3012         jsr     L8748
   99AD BD 87 91      [ 6] 3013         jsr     L8791   
   99B0 39            [ 5] 3014         rts
                           3015 
   99B1                    3016 L99B1:
   99B1 D6 7B         [ 3] 3017         ldab    (0x007B)
   99B3 CA 20         [ 2] 3018         orab    #0x20
   99B5 BD 87 48      [ 6] 3019         jsr     L8748   
   99B8 BD 87 AE      [ 6] 3020         jsr     L87AE
   99BB 39            [ 5] 3021         rts
                           3022 
   99BC D6 7B         [ 3] 3023         ldab    (0x007B)
   99BE C4 DF         [ 2] 3024         andb    #0xDF
   99C0 BD 87 48      [ 6] 3025         jsr     L8748   
   99C3 BD 87 AE      [ 6] 3026         jsr     L87AE
   99C6 39            [ 5] 3027         rts
                           3028 
   99C7 D6 7B         [ 3] 3029         ldab    (0x007B)
   99C9 CA 20         [ 2] 3030         orab    #0x20
   99CB BD 87 48      [ 6] 3031         jsr     L8748   
   99CE BD 87 91      [ 6] 3032         jsr     L8791   
   99D1 39            [ 5] 3033         rts
                           3034 
   99D2                    3035 L99D2:
   99D2 86 01         [ 2] 3036         ldaa    #0x01
   99D4 97 78         [ 3] 3037         staa    (0x0078)
   99D6 7E 85 A4      [ 3] 3038         jmp     L85A4
   99D9                    3039 L99D9:
   99D9 CE 0E 20      [ 3] 3040         ldx     #0x0E20
   99DC A6 00         [ 4] 3041         ldaa    0,X     
   99DE 80 30         [ 2] 3042         suba    #0x30
   99E0 C6 0A         [ 2] 3043         ldab    #0x0A
   99E2 3D            [10] 3044         mul
   99E3 17            [ 2] 3045         tba                     ; (0E20)*10 into A
   99E4 C6 64         [ 2] 3046         ldab    #0x64
   99E6 3D            [10] 3047         mul
   99E7 DD 17         [ 4] 3048         std     (0x0017)        ; (0E20)*1000 into 17:18
   99E9 A6 01         [ 4] 3049         ldaa    1,X
   99EB 80 30         [ 2] 3050         suba    #0x30
   99ED C6 64         [ 2] 3051         ldab    #0x64
   99EF 3D            [10] 3052         mul
   99F0 D3 17         [ 5] 3053         addd    (0x0017)
   99F2 DD 17         [ 4] 3054         std     (0x0017)        ; (0E20)*1000+(0E21)*100 into 17:18
   99F4 A6 02         [ 4] 3055         ldaa    2,X     
   99F6 80 30         [ 2] 3056         suba    #0x30
   99F8 C6 0A         [ 2] 3057         ldab    #0x0A
   99FA 3D            [10] 3058         mul
   99FB D3 17         [ 5] 3059         addd    (0x0017)    
   99FD DD 17         [ 4] 3060         std     (0x0017)        ; (0E20)*1000+(0E21)*100+(0E22)*10 into 17:18
   99FF 4F            [ 2] 3061         clra
   9A00 E6 03         [ 4] 3062         ldab    3,X     
   9A02 C0 30         [ 2] 3063         subb    #0x30
   9A04 D3 17         [ 5] 3064         addd    (0x0017)    
   9A06 FD 02 9C      [ 5] 3065         std     (0x029C)        ; (0E20)*1000+(0E21)*100+(0E22)*10+(0E23) into (029C:029D)
   9A09 CE 0E 20      [ 3] 3066         ldx     #0x0E20
   9A0C                    3067 L9A0C:
   9A0C A6 00         [ 4] 3068         ldaa    0,X         
   9A0E 81 30         [ 2] 3069         cmpa    #0x30
   9A10 25 13         [ 3] 3070         bcs     L9A25  
   9A12 81 39         [ 2] 3071         cmpa    #0x39
   9A14 22 0F         [ 3] 3072         bhi     L9A25  
   9A16 08            [ 3] 3073         inx
   9A17 8C 0E 24      [ 4] 3074         cpx     #0x0E24
   9A1A 26 F0         [ 3] 3075         bne     L9A0C  
   9A1C B6 0E 24      [ 4] 3076         ldaa    (0x0E24)        ; check EEPROM signature
   9A1F 81 DB         [ 2] 3077         cmpa    #0xDB
   9A21 26 02         [ 3] 3078         bne     L9A25  
   9A23 0C            [ 2] 3079         clc                     ; if sig good, return carry clear
   9A24 39            [ 5] 3080         rts
                           3081 
   9A25                    3082 L9A25:
   9A25 0D            [ 2] 3083         sec                     ; if sig bad, return carry clear
   9A26 39            [ 5] 3084         rts
                           3085 
   9A27                    3086 L9A27:
   9A27 BD 8D E4      [ 6] 3087         jsr     LCDMSG1 
   9A2A 53 65 72 69 61 6C  3088         .ascis  'Serial# '
        23 A0
                           3089 
   9A32 BD 8D DD      [ 6] 3090         jsr     LCDMSG2 
   9A35 20 20 20 20 20 20  3091         .ascis  '               '
        20 20 20 20 20 20
        20 20 A0
                           3092 
                           3093 ; display 4-digit serial number
   9A44 C6 08         [ 2] 3094         ldab    #0x08
   9A46 18 CE 0E 20   [ 4] 3095         ldy     #0x0E20
   9A4A                    3096 L9A4A:
   9A4A 18 A6 00      [ 5] 3097         ldaa    0,Y     
   9A4D 18 3C         [ 5] 3098         pshy
   9A4F 37            [ 3] 3099         pshb
   9A50 BD 8D B5      [ 6] 3100         jsr     L8DB5            ; display char here on LCD display
   9A53 33            [ 4] 3101         pulb
   9A54 18 38         [ 6] 3102         puly
   9A56 5C            [ 2] 3103         incb
   9A57 18 08         [ 4] 3104         iny
   9A59 18 8C 0E 24   [ 5] 3105         cpy     #0x0E24
   9A5D 26 EB         [ 3] 3106         bne     L9A4A  
   9A5F 39            [ 5] 3107         rts
                           3108 
                           3109 ; Unused?
   9A60                    3110 L9A60:
   9A60 86 01         [ 2] 3111         ldaa    #0x01
   9A62 97 B5         [ 3] 3112         staa    (0x00B5)
   9A64 96 4E         [ 3] 3113         ldaa    (0x004E)
   9A66 97 7F         [ 3] 3114         staa    (0x007F)
   9A68 96 62         [ 3] 3115         ldaa    (0x0062)
   9A6A 97 80         [ 3] 3116         staa    (0x0080)
   9A6C 96 7B         [ 3] 3117         ldaa    (0x007B)
   9A6E 97 81         [ 3] 3118         staa    (0x0081)
   9A70 96 7A         [ 3] 3119         ldaa    (0x007A)
   9A72 97 82         [ 3] 3120         staa    (0x0082)
   9A74 96 78         [ 3] 3121         ldaa    (0x0078)
   9A76 97 7D         [ 3] 3122         staa    (0x007D)
   9A78 B6 10 8A      [ 4] 3123         ldaa    (0x108A)
   9A7B 84 06         [ 2] 3124         anda    #0x06
   9A7D 97 7E         [ 3] 3125         staa    (0x007E)
   9A7F                    3126 L9A7F:
   9A7F C6 EF         [ 2] 3127         ldab    #0xEF           ; tape deck EJECT
   9A81 BD 86 E7      [ 6] 3128         jsr     L86E7
   9A84 D6 7B         [ 3] 3129         ldab    (0x007B)
   9A86 CA 0C         [ 2] 3130         orab    #0x0C
   9A88 C4 DF         [ 2] 3131         andb    #0xDF
   9A8A BD 87 48      [ 6] 3132         jsr     L8748   
   9A8D BD 87 91      [ 6] 3133         jsr     L8791   
   9A90 BD 86 C4      [ 6] 3134         jsr     L86C4           ; Reset boards 1-10
   9A93 BD 9C 51      [ 6] 3135         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9A96 C6 06         [ 2] 3136         ldab    #0x06           ; delay 6 secs
   9A98 BD 8C 02      [ 6] 3137         jsr     DLYSECS         ;
   9A9B BD 8E 95      [ 6] 3138         jsr     L8E95
   9A9E BD 99 A6      [ 6] 3139         jsr     L99A6
   9AA1 7E 81 BD      [ 3] 3140         jmp     L81BD
   9AA4                    3141 L9AA4:
   9AA4 7F 00 5C      [ 6] 3142         clr     (0x005C)
   9AA7 86 01         [ 2] 3143         ldaa    #0x01
   9AA9 97 79         [ 3] 3144         staa    (0x0079)
   9AAB C6 FD         [ 2] 3145         ldab    #0xFD           ; tape deck STOP
   9AAD BD 86 E7      [ 6] 3146         jsr     L86E7
   9AB0 BD 8E 95      [ 6] 3147         jsr     L8E95
   9AB3 CC 75 30      [ 3] 3148         ldd     #0x7530
   9AB6 DD 1D         [ 4] 3149         std     CDTIMR2
   9AB8                    3150 L9AB8:
   9AB8 BD 9B 19      [ 6] 3151         jsr     L9B19           ; do the random motions if enabled
   9ABB D6 62         [ 3] 3152         ldab    (0x0062)
   9ABD C8 04         [ 2] 3153         eorb    #0x04
   9ABF D7 62         [ 3] 3154         stab    (0x0062)
   9AC1 BD F9 C5      [ 6] 3155         jsr     BUTNLIT 
   9AC4 F6 18 04      [ 4] 3156         ldab    PIA0PRA 
   9AC7 C8 08         [ 2] 3157         eorb    #0x08
   9AC9 F7 18 04      [ 4] 3158         stab    PIA0PRA 
   9ACC 7D 00 5C      [ 6] 3159         tst     (0x005C)
   9ACF 26 12         [ 3] 3160         bne     L9AE3  
   9AD1 BD 8E 95      [ 6] 3161         jsr     L8E95
   9AD4 81 0D         [ 2] 3162         cmpa    #0x0D
   9AD6 27 0B         [ 3] 3163         beq     L9AE3  
   9AD8 C6 32         [ 2] 3164         ldab    #0x32           ; delay 0.5 sec
   9ADA BD 8C 22      [ 6] 3165         jsr     DLYSECSBY100
   9ADD DC 1D         [ 4] 3166         ldd     CDTIMR2
   9ADF 27 02         [ 3] 3167         beq     L9AE3  
   9AE1 20 D5         [ 3] 3168         bra     L9AB8  
   9AE3                    3169 L9AE3:
   9AE3 D6 62         [ 3] 3170         ldab    (0x0062)
   9AE5 C4 FB         [ 2] 3171         andb    #0xFB
   9AE7 D7 62         [ 3] 3172         stab    (0x0062)
   9AE9 BD F9 C5      [ 6] 3173         jsr     BUTNLIT 
   9AEC BD A3 54      [ 6] 3174         jsr     LA354
   9AEF C6 FB         [ 2] 3175         ldab    #0xFB           ; tape deck PLAY
   9AF1 BD 86 E7      [ 6] 3176         jsr     L86E7
   9AF4 7E 85 A4      [ 3] 3177         jmp     L85A4
   9AF7                    3178 L9AF7:
   9AF7 7F 00 75      [ 6] 3179         clr     (0x0075)
   9AFA 7F 00 76      [ 6] 3180         clr     (0x0076)
   9AFD 7F 00 77      [ 6] 3181         clr     (0x0077)
   9B00 7F 00 78      [ 6] 3182         clr     (0x0078)
   9B03 7F 00 25      [ 6] 3183         clr     (0x0025)
   9B06 7F 00 26      [ 6] 3184         clr     (0x0026)
   9B09 7F 00 4E      [ 6] 3185         clr     (0x004E)
   9B0C 7F 00 30      [ 6] 3186         clr     (0x0030)        ; clear SCD key states
   9B0F 7F 00 31      [ 6] 3187         clr     (0x0031)
   9B12 7F 00 32      [ 6] 3188         clr     (0x0032)
   9B15 7F 00 AF      [ 6] 3189         clr     (0x00AF)
   9B18 39            [ 5] 3190         rts
                           3191 
                           3192 ; do the random motions if enabled
   9B19                    3193 L9B19:
   9B19 36            [ 3] 3194         psha
   9B1A 37            [ 3] 3195         pshb
   9B1B 96 4E         [ 3] 3196         ldaa    (0x004E)
   9B1D 27 17         [ 3] 3197         beq     L9B36           ; go to 0401 logic
   9B1F 96 63         [ 3] 3198         ldaa    (0x0063)        ; check countdown timer
   9B21 26 10         [ 3] 3199         bne     L9B33           ; exit
   9B23 7D 00 64      [ 6] 3200         tst     (0x0064)
   9B26 27 09         [ 3] 3201         beq     L9B31           ; go to 0401 logic
   9B28 BD 86 C4      [ 6] 3202         jsr     L86C4           ; Reset boards 1-10
   9B2B BD 9C 51      [ 6] 3203         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9B2E 7F 00 64      [ 6] 3204         clr     (0x0064)
   9B31                    3205 L9B31:
   9B31 20 03         [ 3] 3206         bra     L9B36           ; go to 0401 logic
   9B33                    3207 L9B33:
   9B33 33            [ 4] 3208         pulb
   9B34 32            [ 4] 3209         pula
   9B35 39            [ 5] 3210         rts
                           3211 
                           3212 ; end up here immediately if:
                           3213 ; 0x004E == 00 or
                           3214 ; 0x0063, 0x0064 == 0 or
                           3215 ; 
                           3216 ; do subroutines based on bits 0-4 of 0x0401?
   9B36                    3217 L9B36:
   9B36 B6 04 01      [ 4] 3218         ldaa    (0x0401)
   9B39 84 01         [ 2] 3219         anda    #0x01
   9B3B 27 03         [ 3] 3220         beq     L9B40  
   9B3D BD 9B 6B      [ 6] 3221         jsr     L9B6B           ; bit 0 routine
   9B40                    3222 L9B40:
   9B40 B6 04 01      [ 4] 3223         ldaa    (0x0401)
   9B43 84 02         [ 2] 3224         anda    #0x02
   9B45 27 03         [ 3] 3225         beq     L9B4A  
   9B47 BD 9B 99      [ 6] 3226         jsr     L9B99           ; bit 1 routine
   9B4A                    3227 L9B4A:
   9B4A B6 04 01      [ 4] 3228         ldaa    (0x0401)
   9B4D 84 04         [ 2] 3229         anda    #0x04
   9B4F 27 03         [ 3] 3230         beq     L9B54  
   9B51 BD 9B C7      [ 6] 3231         jsr     L9BC7           ; bit 2 routine
   9B54                    3232 L9B54:
   9B54 B6 04 01      [ 4] 3233         ldaa    (0x0401)
   9B57 84 08         [ 2] 3234         anda    #0x08
   9B59 27 03         [ 3] 3235         beq     L9B5E  
   9B5B BD 9B F5      [ 6] 3236         jsr     L9BF5           ; bit 3 routine
   9B5E                    3237 L9B5E:
   9B5E B6 04 01      [ 4] 3238         ldaa    (0x0401)
   9B61 84 10         [ 2] 3239         anda    #0x10
   9B63 27 03         [ 3] 3240         beq     L9B68  
   9B65 BD 9C 23      [ 6] 3241         jsr     L9C23           ; bit 4 routine
   9B68                    3242 L9B68:
   9B68 33            [ 4] 3243         pulb
   9B69 32            [ 4] 3244         pula
   9B6A 39            [ 5] 3245         rts
                           3246 
                           3247 ; bit 0 routine
   9B6B                    3248 L9B6B:
   9B6B 18 3C         [ 5] 3249         pshy
   9B6D 18 DE 65      [ 5] 3250         ldy     (0x0065)
   9B70 18 A6 00      [ 5] 3251         ldaa    0,Y     
   9B73 81 FF         [ 2] 3252         cmpa    #0xFF
   9B75 27 14         [ 3] 3253         beq     L9B8B  
   9B77 91 70         [ 3] 3254         cmpa    OFFCNT1
   9B79 25 0D         [ 3] 3255         bcs     L9B88  
   9B7B 18 08         [ 4] 3256         iny
   9B7D 18 A6 00      [ 5] 3257         ldaa    0,Y     
   9B80 B7 10 80      [ 4] 3258         staa    (0x1080)        ; do some stuff to board 1
   9B83 18 08         [ 4] 3259         iny
   9B85 18 DF 65      [ 5] 3260         sty     (0x0065)
   9B88                    3261 L9B88:
   9B88 18 38         [ 6] 3262         puly
   9B8A 39            [ 5] 3263         rts
   9B8B                    3264 L9B8B:
   9B8B 18 CE B2 EB   [ 4] 3265         ldy     #LB2EB
   9B8F 18 DF 65      [ 5] 3266         sty     (0x0065)
   9B92 86 FA         [ 2] 3267         ldaa    #0xFA
   9B94 97 70         [ 3] 3268         staa    OFFCNT1
   9B96 7E 9B 88      [ 3] 3269         jmp     L9B88
                           3270 
                           3271 ; bit 1 routine
   9B99                    3272 L9B99:
   9B99 18 3C         [ 5] 3273         pshy
   9B9B 18 DE 67      [ 5] 3274         ldy     (0x0067)
   9B9E 18 A6 00      [ 5] 3275         ldaa    0,Y     
   9BA1 81 FF         [ 2] 3276         cmpa    #0xFF
   9BA3 27 14         [ 3] 3277         beq     L9BB9  
   9BA5 91 71         [ 3] 3278         cmpa    OFFCNT2
   9BA7 25 0D         [ 3] 3279         bcs     L9BB6  
   9BA9 18 08         [ 4] 3280         iny
   9BAB 18 A6 00      [ 5] 3281         ldaa    0,Y     
   9BAE B7 10 84      [ 4] 3282         staa    (0x1084)        ; do some stuff to board 2
   9BB1 18 08         [ 4] 3283         iny
   9BB3 18 DF 67      [ 5] 3284         sty     (0x0067)
   9BB6                    3285 L9BB6:
   9BB6 18 38         [ 6] 3286         puly
   9BB8 39            [ 5] 3287         rts
   9BB9                    3288 L9BB9:
   9BB9 18 CE B3 BD   [ 4] 3289         ldy     #LB3BD
   9BBD 18 DF 67      [ 5] 3290         sty     (0x0067)
   9BC0 86 E6         [ 2] 3291         ldaa    #0xE6
   9BC2 97 71         [ 3] 3292         staa    OFFCNT2
   9BC4 7E 9B B6      [ 3] 3293         jmp     L9BB6
                           3294 
                           3295 ; bit 2 routine
   9BC7                    3296 L9BC7:
   9BC7 18 3C         [ 5] 3297         pshy
   9BC9 18 DE 69      [ 5] 3298         ldy     (0x0069)
   9BCC 18 A6 00      [ 5] 3299         ldaa    0,Y     
   9BCF 81 FF         [ 2] 3300         cmpa    #0xFF
   9BD1 27 14         [ 3] 3301         beq     L9BE7  
   9BD3 91 72         [ 3] 3302         cmpa    OFFCNT3
   9BD5 25 0D         [ 3] 3303         bcs     L9BE4  
   9BD7 18 08         [ 4] 3304         iny
   9BD9 18 A6 00      [ 5] 3305         ldaa    0,Y     
   9BDC B7 10 88      [ 4] 3306         staa    (0x1088)        ; do some stuff to board 3
   9BDF 18 08         [ 4] 3307         iny
   9BE1 18 DF 69      [ 5] 3308         sty     (0x0069)
   9BE4                    3309 L9BE4:
   9BE4 18 38         [ 6] 3310         puly
   9BE6 39            [ 5] 3311         rts
   9BE7                    3312 L9BE7:
   9BE7 18 CE B5 31   [ 4] 3313         ldy     #LB531
   9BEB 18 DF 69      [ 5] 3314         sty     (0x0069)
   9BEE 86 D2         [ 2] 3315         ldaa    #0xD2
   9BF0 97 72         [ 3] 3316         staa    OFFCNT3
   9BF2 7E 9B E4      [ 3] 3317         jmp     L9BE4
                           3318 
                           3319 ; bit 3 routine
   9BF5                    3320 L9BF5:
   9BF5 18 3C         [ 5] 3321         pshy
   9BF7 18 DE 6B      [ 5] 3322         ldy     (0x006B)
   9BFA 18 A6 00      [ 5] 3323         ldaa    0,Y     
   9BFD 81 FF         [ 2] 3324         cmpa    #0xFF
   9BFF 27 14         [ 3] 3325         beq     L9C15  
   9C01 91 73         [ 3] 3326         cmpa    OFFCNT4
   9C03 25 0D         [ 3] 3327         bcs     L9C12  
   9C05 18 08         [ 4] 3328         iny
   9C07 18 A6 00      [ 5] 3329         ldaa    0,Y     
   9C0A B7 10 8C      [ 4] 3330         staa    (0x108C)        ; do some stuff to board 4
   9C0D 18 08         [ 4] 3331         iny
   9C0F 18 DF 6B      [ 5] 3332         sty     (0x006B)
   9C12                    3333 L9C12:
   9C12 18 38         [ 6] 3334         puly
   9C14 39            [ 5] 3335         rts
   9C15                    3336 L9C15:
   9C15 18 CE B4 75   [ 4] 3337         ldy     #LB475
   9C19 18 DF 6B      [ 5] 3338         sty     (0x006B)
   9C1C 86 BE         [ 2] 3339         ldaa    #0xBE
   9C1E 97 73         [ 3] 3340         staa    OFFCNT4
   9C20 7E 9C 12      [ 3] 3341         jmp     L9C12
                           3342 
                           3343 ; bit 4 routine
   9C23                    3344 L9C23:
   9C23 18 3C         [ 5] 3345         pshy
   9C25 18 DE 6D      [ 5] 3346         ldy     (0x006D)
   9C28 18 A6 00      [ 5] 3347         ldaa    0,Y     
   9C2B 81 FF         [ 2] 3348         cmpa    #0xFF
   9C2D 27 14         [ 3] 3349         beq     L9C43  
   9C2F 91 74         [ 3] 3350         cmpa    OFFCNT5
   9C31 25 0D         [ 3] 3351         bcs     L9C40  
   9C33 18 08         [ 4] 3352         iny
   9C35 18 A6 00      [ 5] 3353         ldaa    0,Y     
   9C38 B7 10 90      [ 4] 3354         staa    (0x1090)        ; do some stuff to board 5
   9C3B 18 08         [ 4] 3355         iny
   9C3D 18 DF 6D      [ 5] 3356         sty     (0x006D)
   9C40                    3357 L9C40:
   9C40 18 38         [ 6] 3358         puly
   9C42 39            [ 5] 3359         rts
   9C43                    3360 L9C43:
   9C43 18 CE B5 C3   [ 4] 3361         ldy     #LB5C3
   9C47 18 DF 6D      [ 5] 3362         sty     (0x006D)
   9C4A 86 AA         [ 2] 3363         ldaa    #0xAA
   9C4C 97 74         [ 3] 3364         staa    OFFCNT5
   9C4E 7E 9C 40      [ 3] 3365         jmp     L9C40
                           3366 
                           3367 ; Reset offset counters to initial values
   9C51                    3368 L9C51:
   9C51 86 FA         [ 2] 3369         ldaa    #0xFA
   9C53 97 70         [ 3] 3370         staa    OFFCNT1
   9C55 86 E6         [ 2] 3371         ldaa    #0xE6
   9C57 97 71         [ 3] 3372         staa    OFFCNT2
   9C59 86 D2         [ 2] 3373         ldaa    #0xD2
   9C5B 97 72         [ 3] 3374         staa    OFFCNT3
   9C5D 86 BE         [ 2] 3375         ldaa    #0xBE
   9C5F 97 73         [ 3] 3376         staa    OFFCNT4
   9C61 86 AA         [ 2] 3377         ldaa    #0xAA
   9C63 97 74         [ 3] 3378         staa    OFFCNT5
                           3379 
                           3380         ; int random movement table pointers
   9C65 18 CE B2 EB   [ 4] 3381         ldy     #LB2EB
   9C69 18 DF 65      [ 5] 3382         sty     (0x0065)
   9C6C 18 CE B3 BD   [ 4] 3383         ldy     #LB3BD
   9C70 18 DF 67      [ 5] 3384         sty     (0x0067)
   9C73 18 CE B5 31   [ 4] 3385         ldy     #LB531
   9C77 18 DF 69      [ 5] 3386         sty     (0x0069)
   9C7A 18 CE B4 75   [ 4] 3387         ldy     #LB475
   9C7E 18 DF 6B      [ 5] 3388         sty     (0x006B)
   9C81 18 CE B5 C3   [ 4] 3389         ldy     #LB5C3
   9C85 18 DF 6D      [ 5] 3390         sty     (0x006D)
                           3391 
                           3392         ; clear board 8
   9C88 7F 10 9C      [ 6] 3393         clr     (0x109C)
   9C8B 7F 10 9E      [ 6] 3394         clr     (0x109E)
                           3395 
                           3396         ; if bit 5 of 0401 is set, turn on 3 bits on board 8
   9C8E B6 04 01      [ 4] 3397         ldaa    (0x0401)
   9C91 84 20         [ 2] 3398         anda    #0x20
   9C93 27 08         [ 3] 3399         beq     L9C9D
   9C95 B6 10 9C      [ 4] 3400         ldaa    (0x109C)
   9C98 8A 19         [ 2] 3401         oraa    #0x19
   9C9A B7 10 9C      [ 4] 3402         staa    (0x109C)
                           3403         ; if bit 6 of 0401 is set, turn on 3 bits on board 8
   9C9D                    3404 L9C9D:
   9C9D B6 04 01      [ 4] 3405         ldaa    (0x0401)
   9CA0 84 40         [ 2] 3406         anda    #0x40
   9CA2 27 10         [ 3] 3407         beq     L9CB4  
   9CA4 B6 10 9C      [ 4] 3408         ldaa    (0x109C)
   9CA7 8A 44         [ 2] 3409         oraa    #0x44
   9CA9 B7 10 9C      [ 4] 3410         staa    (0x109C)
   9CAC B6 10 9E      [ 4] 3411         ldaa    (0x109E)
   9CAF 8A 40         [ 2] 3412         oraa    #0x40
   9CB1 B7 10 9E      [ 4] 3413         staa    (0x109E)
                           3414         ; if bit 7 of 0401 is set, turn on 3 bits on board 8
   9CB4                    3415 L9CB4:
   9CB4 B6 04 01      [ 4] 3416         ldaa    (0x0401)
   9CB7 84 80         [ 2] 3417         anda    #0x80
   9CB9 27 08         [ 3] 3418         beq     L9CC3  
   9CBB B6 10 9C      [ 4] 3419         ldaa    (0x109C)
   9CBE 8A A2         [ 2] 3420         oraa    #0xA2
   9CC0 B7 10 9C      [ 4] 3421         staa    (0x109C)
                           3422 
   9CC3                    3423 L9CC3:
                           3424         ; if bit 0 of 042B is set, turn on 1 bit on board 7
   9CC3 B6 04 2B      [ 4] 3425         ldaa    (0x042B)
   9CC6 84 01         [ 2] 3426         anda    #0x01
   9CC8 27 08         [ 3] 3427         beq     L9CD2  
   9CCA B6 10 9A      [ 4] 3428         ldaa    (0x109A)
   9CCD 8A 80         [ 2] 3429         oraa    #0x80
   9CCF B7 10 9A      [ 4] 3430         staa    (0x109A)
   9CD2                    3431 L9CD2:
                           3432         ; if bit 1 of 042B is set, turn on 1 bit on board 8
   9CD2 B6 04 2B      [ 4] 3433         ldaa    (0x042B)
   9CD5 84 02         [ 2] 3434         anda    #0x02
   9CD7 27 08         [ 3] 3435         beq     L9CE1  
   9CD9 B6 10 9E      [ 4] 3436         ldaa    (0x109E)
   9CDC 8A 04         [ 2] 3437         oraa    #0x04
   9CDE B7 10 9E      [ 4] 3438         staa    (0x109E)
   9CE1                    3439 L9CE1:
                           3440         ; if bit 2 of 042B is set, turn on 1 bit on board 8
   9CE1 B6 04 2B      [ 4] 3441         ldaa    (0x042B)
   9CE4 84 04         [ 2] 3442         anda    #0x04
   9CE6 27 08         [ 3] 3443         beq     L9CF0  
   9CE8 B6 10 9E      [ 4] 3444         ldaa    (0x109E)
   9CEB 8A 08         [ 2] 3445         oraa    #0x08
   9CED B7 10 9E      [ 4] 3446         staa    (0x109E)
   9CF0                    3447 L9CF0:
   9CF0 39            [ 5] 3448         rts
                           3449 
                           3450 ; Display Credits
   9CF1                    3451 L9CF1:
   9CF1 BD 8D E4      [ 6] 3452         jsr     LCDMSG1 
   9CF4 20 20 20 50 72 6F  3453         .ascis  '   Program by   '
        67 72 61 6D 20 62
        79 20 20 A0
                           3454 
   9D04 BD 8D DD      [ 6] 3455         jsr     LCDMSG2 
   9D07 44 61 76 69 64 20  3456         .ascis  'David  Philipsen'
        20 50 68 69 6C 69
        70 73 65 EE
                           3457 
   9D17 39            [ 5] 3458         rts
                           3459 
   9D18                    3460 L9D18:
   9D18 97 49         [ 3] 3461         staa    (0x0049)
   9D1A 7F 00 B8      [ 6] 3462         clr     (0x00B8)
   9D1D BD 8D 03      [ 6] 3463         jsr     L8D03
   9D20 86 2A         [ 2] 3464         ldaa    #0x2A           ;'*'
   9D22 C6 28         [ 2] 3465         ldab    #0x28
   9D24 BD 8D B5      [ 6] 3466         jsr     L8DB5           ; display char here on LCD display
   9D27 CC 0B B8      [ 3] 3467         ldd     #0x0BB8         ; start 30 second timer?
   9D2A DD 1B         [ 4] 3468         std     CDTIMR1
   9D2C                    3469 L9D2C:
   9D2C BD 9B 19      [ 6] 3470         jsr     L9B19           ; do the random motions if enabled
   9D2F 96 49         [ 3] 3471         ldaa    (0x0049)
   9D31 81 41         [ 2] 3472         cmpa    #0x41
   9D33 27 04         [ 3] 3473         beq     L9D39  
   9D35 81 4B         [ 2] 3474         cmpa    #0x4B
   9D37 26 04         [ 3] 3475         bne     L9D3D  
   9D39                    3476 L9D39:
   9D39 C6 01         [ 2] 3477         ldab    #0x01
   9D3B D7 B8         [ 3] 3478         stab    (0x00B8)
   9D3D                    3479 L9D3D:
   9D3D 81 41         [ 2] 3480         cmpa    #0x41
   9D3F 27 04         [ 3] 3481         beq     L9D45  
   9D41 81 4F         [ 2] 3482         cmpa    #0x4F
   9D43 26 07         [ 3] 3483         bne     L9D4C  
   9D45                    3484 L9D45:
   9D45 86 01         [ 2] 3485         ldaa    #0x01
   9D47 B7 02 98      [ 4] 3486         staa    (0x0298)
   9D4A 20 32         [ 3] 3487         bra     L9D7E  
   9D4C                    3488 L9D4C:
   9D4C 81 4B         [ 2] 3489         cmpa    #0x4B
   9D4E 27 04         [ 3] 3490         beq     L9D54  
   9D50 81 50         [ 2] 3491         cmpa    #0x50
   9D52 26 07         [ 3] 3492         bne     L9D5B  
   9D54                    3493 L9D54:
   9D54 86 02         [ 2] 3494         ldaa    #0x02
   9D56 B7 02 98      [ 4] 3495         staa    (0x0298)
   9D59 20 23         [ 3] 3496         bra     L9D7E  
   9D5B                    3497 L9D5B:
   9D5B 81 4C         [ 2] 3498         cmpa    #0x4C
   9D5D 26 07         [ 3] 3499         bne     L9D66  
   9D5F 86 03         [ 2] 3500         ldaa    #0x03
   9D61 B7 02 98      [ 4] 3501         staa    (0x0298)
   9D64 20 18         [ 3] 3502         bra     L9D7E  
   9D66                    3503 L9D66:
   9D66 81 52         [ 2] 3504         cmpa    #0x52
   9D68 26 07         [ 3] 3505         bne     L9D71  
   9D6A 86 04         [ 2] 3506         ldaa    #0x04
   9D6C B7 02 98      [ 4] 3507         staa    (0x0298)
   9D6F 20 0D         [ 3] 3508         bra     L9D7E  
   9D71                    3509 L9D71:
   9D71 DC 1B         [ 4] 3510         ldd     CDTIMR1
   9D73 26 B7         [ 3] 3511         bne     L9D2C  
   9D75 86 23         [ 2] 3512         ldaa    #0x23           ;'#'
   9D77 C6 29         [ 2] 3513         ldab    #0x29
   9D79 BD 8D B5      [ 6] 3514         jsr     L8DB5           ; display char here on LCD display
   9D7C 20 6C         [ 3] 3515         bra     L9DEA  
   9D7E                    3516 L9D7E:
   9D7E 7F 00 49      [ 6] 3517         clr     (0x0049)
   9D81 86 2A         [ 2] 3518         ldaa    #0x2A           ;'*'
   9D83 C6 29         [ 2] 3519         ldab    #0x29
   9D85 BD 8D B5      [ 6] 3520         jsr     L8DB5           ; display char here on LCD display
   9D88 7F 00 4A      [ 6] 3521         clr     (0x004A)
   9D8B CE 02 99      [ 3] 3522         ldx     #0x0299
   9D8E                    3523 L9D8E:
   9D8E BD 9B 19      [ 6] 3524         jsr     L9B19           ; do the random motions if enabled
   9D91 96 4A         [ 3] 3525         ldaa    (0x004A)
   9D93 27 F9         [ 3] 3526         beq     L9D8E  
   9D95 7F 00 4A      [ 6] 3527         clr     (0x004A)
   9D98 84 3F         [ 2] 3528         anda    #0x3F
   9D9A A7 00         [ 4] 3529         staa    0,X     
   9D9C 08            [ 3] 3530         inx
   9D9D 8C 02 9C      [ 4] 3531         cpx     #0x029C
   9DA0 26 EC         [ 3] 3532         bne     L9D8E  
   9DA2 BD 9D F5      [ 6] 3533         jsr     L9DF5
   9DA5 24 09         [ 3] 3534         bcc     L9DB0  
   9DA7 86 23         [ 2] 3535         ldaa    #0x23           ;'#'
   9DA9 C6 2A         [ 2] 3536         ldab    #0x2A
   9DAB BD 8D B5      [ 6] 3537         jsr     L8DB5           ; display char here on LCD display
   9DAE 20 3A         [ 3] 3538         bra     L9DEA  
   9DB0                    3539 L9DB0:
   9DB0 86 2A         [ 2] 3540         ldaa    #0x2A           ;'*'
   9DB2 C6 2A         [ 2] 3541         ldab    #0x2A
   9DB4 BD 8D B5      [ 6] 3542         jsr     L8DB5           ; display char here on LCD display
   9DB7 B6 02 99      [ 4] 3543         ldaa    (0x0299)
   9DBA 81 39         [ 2] 3544         cmpa    #0x39
   9DBC 26 15         [ 3] 3545         bne     L9DD3  
                           3546 
   9DBE BD 8D DD      [ 6] 3547         jsr     LCDMSG2 
   9DC1 47 65 6E 65 72 69  3548         .ascis  'Generic Showtape'
        63 20 53 68 6F 77
        74 61 70 E5
                           3549 
   9DD1 0C            [ 2] 3550         clc
   9DD2 39            [ 5] 3551         rts
                           3552 
   9DD3                    3553 L9DD3:
   9DD3 B6 02 98      [ 4] 3554         ldaa    (0x0298)
   9DD6 81 03         [ 2] 3555         cmpa    #0x03
   9DD8 27 0E         [ 3] 3556         beq     L9DE8  
   9DDA 81 04         [ 2] 3557         cmpa    #0x04
   9DDC 27 0A         [ 3] 3558         beq     L9DE8  
   9DDE 96 76         [ 3] 3559         ldaa    (0x0076)
   9DE0 26 06         [ 3] 3560         bne     L9DE8  
   9DE2 BD 9E 73      [ 6] 3561         jsr     L9E73
   9DE5 BD 9E CC      [ 6] 3562         jsr     L9ECC
   9DE8                    3563 L9DE8:
   9DE8 0C            [ 2] 3564         clc
   9DE9 39            [ 5] 3565         rts
                           3566 
   9DEA                    3567 L9DEA:
   9DEA FC 04 20      [ 5] 3568         ldd     (0x0420)
   9DED C3 00 01      [ 4] 3569         addd    #0x0001
   9DF0 FD 04 20      [ 5] 3570         std     (0x0420)
   9DF3 0D            [ 2] 3571         sec
   9DF4 39            [ 5] 3572         rts
                           3573 
   9DF5                    3574 L9DF5:
   9DF5 B6 02 99      [ 4] 3575         ldaa    (0x0299)
   9DF8 81 39         [ 2] 3576         cmpa    #0x39
   9DFA 27 6C         [ 3] 3577         beq     L9E68  
   9DFC CE 00 A8      [ 3] 3578         ldx     #0x00A8
   9DFF                    3579 L9DFF:
   9DFF BD 9B 19      [ 6] 3580         jsr     L9B19           ; do the random motions if enabled
   9E02 96 4A         [ 3] 3581         ldaa    (0x004A)
   9E04 27 F9         [ 3] 3582         beq     L9DFF  
   9E06 7F 00 4A      [ 6] 3583         clr     (0x004A)
   9E09 A7 00         [ 4] 3584         staa    0,X     
   9E0B 08            [ 3] 3585         inx
   9E0C 8C 00 AA      [ 4] 3586         cpx     #0x00AA
   9E0F 26 EE         [ 3] 3587         bne     L9DFF  
   9E11 BD 9E FA      [ 6] 3588         jsr     L9EFA
   9E14 CE 02 99      [ 3] 3589         ldx     #0x0299
   9E17 7F 00 13      [ 6] 3590         clr     (0x0013)
   9E1A                    3591 L9E1A:
   9E1A A6 00         [ 4] 3592         ldaa    0,X     
   9E1C 9B 13         [ 3] 3593         adda    (0x0013)
   9E1E 97 13         [ 3] 3594         staa    (0x0013)
   9E20 08            [ 3] 3595         inx
   9E21 8C 02 9C      [ 4] 3596         cpx     #0x029C
   9E24 26 F4         [ 3] 3597         bne     L9E1A  
   9E26 91 A8         [ 3] 3598         cmpa    (0x00A8)
   9E28 26 47         [ 3] 3599         bne     L9E71  
   9E2A CE 04 02      [ 3] 3600         ldx     #0x0402
   9E2D B6 02 98      [ 4] 3601         ldaa    (0x0298)
   9E30 81 02         [ 2] 3602         cmpa    #0x02
   9E32 26 03         [ 3] 3603         bne     L9E37  
   9E34 CE 04 05      [ 3] 3604         ldx     #0x0405
   9E37                    3605 L9E37:
   9E37 3C            [ 4] 3606         pshx
   9E38 BD AB 56      [ 6] 3607         jsr     LAB56
   9E3B 38            [ 5] 3608         pulx
   9E3C 25 07         [ 3] 3609         bcs     L9E45  
   9E3E 86 03         [ 2] 3610         ldaa    #0x03
   9E40 B7 02 98      [ 4] 3611         staa    (0x0298)
   9E43 20 23         [ 3] 3612         bra     L9E68  
   9E45                    3613 L9E45:
   9E45 B6 02 99      [ 4] 3614         ldaa    (0x0299)
   9E48 A1 00         [ 4] 3615         cmpa    0,X     
   9E4A 25 1E         [ 3] 3616         bcs     L9E6A  
   9E4C 27 02         [ 3] 3617         beq     L9E50  
   9E4E 24 18         [ 3] 3618         bcc     L9E68  
   9E50                    3619 L9E50:
   9E50 08            [ 3] 3620         inx
   9E51 B6 02 9A      [ 4] 3621         ldaa    (0x029A)
   9E54 A1 00         [ 4] 3622         cmpa    0,X     
   9E56 25 12         [ 3] 3623         bcs     L9E6A  
   9E58 27 02         [ 3] 3624         beq     L9E5C  
   9E5A 24 0C         [ 3] 3625         bcc     L9E68  
   9E5C                    3626 L9E5C:
   9E5C 08            [ 3] 3627         inx
   9E5D B6 02 9B      [ 4] 3628         ldaa    (0x029B)
   9E60 A1 00         [ 4] 3629         cmpa    0,X     
   9E62 25 06         [ 3] 3630         bcs     L9E6A  
   9E64 27 02         [ 3] 3631         beq     L9E68  
   9E66 24 00         [ 3] 3632         bcc     L9E68  
   9E68                    3633 L9E68:
   9E68 0C            [ 2] 3634         clc
   9E69 39            [ 5] 3635         rts
                           3636 
   9E6A                    3637 L9E6A:
   9E6A B6 02 98      [ 4] 3638         ldaa    (0x0298)
   9E6D 81 03         [ 2] 3639         cmpa    #0x03
   9E6F 27 F7         [ 3] 3640         beq     L9E68  
   9E71                    3641 L9E71:
   9E71 0D            [ 2] 3642         sec
   9E72 39            [ 5] 3643         rts
                           3644 
   9E73                    3645 L9E73:
   9E73 CE 04 02      [ 3] 3646         ldx     #0x0402
   9E76 B6 02 98      [ 4] 3647         ldaa    (0x0298)
   9E79 81 02         [ 2] 3648         cmpa    #0x02
   9E7B 26 03         [ 3] 3649         bne     L9E80  
   9E7D CE 04 05      [ 3] 3650         ldx     #0x0405
   9E80                    3651 L9E80:
   9E80 B6 02 99      [ 4] 3652         ldaa    (0x0299)
   9E83 A7 00         [ 4] 3653         staa    0,X     
   9E85 08            [ 3] 3654         inx
   9E86 B6 02 9A      [ 4] 3655         ldaa    (0x029A)
   9E89 A7 00         [ 4] 3656         staa    0,X     
   9E8B 08            [ 3] 3657         inx
   9E8C B6 02 9B      [ 4] 3658         ldaa    (0x029B)
   9E8F A7 00         [ 4] 3659         staa    0,X     
   9E91 39            [ 5] 3660         rts
                           3661 
                           3662 ; reset R counts
   9E92                    3663 L9E92:
   9E92 86 30         [ 2] 3664         ldaa    #0x30        
   9E94 B7 04 02      [ 4] 3665         staa    (0x0402)
   9E97 B7 04 03      [ 4] 3666         staa    (0x0403)
   9E9A B7 04 04      [ 4] 3667         staa    (0x0404)
                           3668 
   9E9D BD 8D DD      [ 6] 3669         jsr     LCDMSG2 
   9EA0 52 65 67 20 23 20  3670         .ascis  'Reg # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3671 
   9EAE 39            [ 5] 3672         rts
                           3673 
                           3674 ; reset L counts
   9EAF                    3675 L9EAF:
   9EAF 86 30         [ 2] 3676         ldaa    #0x30
   9EB1 B7 04 05      [ 4] 3677         staa    (0x0405)
   9EB4 B7 04 06      [ 4] 3678         staa    (0x0406)
   9EB7 B7 04 07      [ 4] 3679         staa    (0x0407)
                           3680 
   9EBA BD 8D DD      [ 6] 3681         jsr     LCDMSG2 
   9EBD 4C 69 76 20 23 20  3682         .ascis  'Liv # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3683 
   9ECB 39            [ 5] 3684         rts
                           3685 
                           3686 ; display R and L counts?
   9ECC                    3687 L9ECC:
   9ECC 86 52         [ 2] 3688         ldaa    #0x52           ;'R'
   9ECE C6 2B         [ 2] 3689         ldab    #0x2B
   9ED0 BD 8D B5      [ 6] 3690         jsr     L8DB5           ; display char here on LCD display
   9ED3 86 4C         [ 2] 3691         ldaa    #0x4C           ;'L'
   9ED5 C6 32         [ 2] 3692         ldab    #0x32
   9ED7 BD 8D B5      [ 6] 3693         jsr     L8DB5           ; display char here on LCD display
   9EDA CE 04 02      [ 3] 3694         ldx     #0x0402
   9EDD C6 2C         [ 2] 3695         ldab    #0x2C
   9EDF                    3696 L9EDF:
   9EDF A6 00         [ 4] 3697         ldaa    0,X     
   9EE1 BD 8D B5      [ 6] 3698         jsr     L8DB5           ; display 3 chars here on LCD display
   9EE4 5C            [ 2] 3699         incb
   9EE5 08            [ 3] 3700         inx
   9EE6 8C 04 05      [ 4] 3701         cpx     #0x0405
   9EE9 26 F4         [ 3] 3702         bne     L9EDF  
   9EEB C6 33         [ 2] 3703         ldab    #0x33
   9EED                    3704 L9EED:
   9EED A6 00         [ 4] 3705         ldaa    0,X     
   9EEF BD 8D B5      [ 6] 3706         jsr     L8DB5           ; display 3 chars here on LCD display
   9EF2 5C            [ 2] 3707         incb
   9EF3 08            [ 3] 3708         inx
   9EF4 8C 04 08      [ 4] 3709         cpx     #0x0408
   9EF7 26 F4         [ 3] 3710         bne     L9EED  
   9EF9 39            [ 5] 3711         rts
                           3712 
   9EFA                    3713 L9EFA:
   9EFA 96 A8         [ 3] 3714         ldaa    (0x00A8)
   9EFC BD 9F 0F      [ 6] 3715         jsr     L9F0F
   9EFF 48            [ 2] 3716         asla
   9F00 48            [ 2] 3717         asla
   9F01 48            [ 2] 3718         asla
   9F02 48            [ 2] 3719         asla
   9F03 97 13         [ 3] 3720         staa    (0x0013)
   9F05 96 A9         [ 3] 3721         ldaa    (0x00A9)
   9F07 BD 9F 0F      [ 6] 3722         jsr     L9F0F
   9F0A 9B 13         [ 3] 3723         adda    (0x0013)
   9F0C 97 A8         [ 3] 3724         staa    (0x00A8)
   9F0E 39            [ 5] 3725         rts
                           3726 
   9F0F                    3727 L9F0F:
   9F0F 81 2F         [ 2] 3728         cmpa    #0x2F
   9F11 24 02         [ 3] 3729         bcc     L9F15  
   9F13 86 30         [ 2] 3730         ldaa    #0x30
   9F15                    3731 L9F15:
   9F15 81 3A         [ 2] 3732         cmpa    #0x3A
   9F17 25 02         [ 3] 3733         bcs     L9F1B  
   9F19 80 07         [ 2] 3734         suba    #0x07
   9F1B                    3735 L9F1B:
   9F1B 80 30         [ 2] 3736         suba    #0x30
   9F1D 39            [ 5] 3737         rts
                           3738 
                           3739 ; different behavior based on serial number
   9F1E                    3740 L9F1E:
   9F1E FC 02 9C      [ 5] 3741         ldd     (0x029C)
   9F21 1A 83 00 01   [ 5] 3742         cpd     #0x0001         ; if 1, password bypass
   9F25 27 0C         [ 3] 3743         beq     L9F33           ;
   9F27 1A 83 03 E8   [ 5] 3744         cpd     #0x03E8         ; 1000
   9F2B 25 20         [ 3] 3745         bcs     L9F4D           ; if > 1000, code
   9F2D 1A 83 04 4B   [ 5] 3746         cpd     #0x044B         ; 1099
   9F31 22 1A         [ 3] 3747         bhi     L9F4D           ; if < 1099, code
                           3748                                 ; else 1 < x < 1000, bypass
                           3749 
   9F33                    3750 L9F33:
   9F33 BD 8D E4      [ 6] 3751         jsr     LCDMSG1 
   9F36 50 61 73 73 77 6F  3752         .ascis  'Password bypass '
        72 64 20 62 79 70
        61 73 73 A0
                           3753 
   9F46 C6 04         [ 2] 3754         ldab    #0x04
   9F48 BD 8C 30      [ 6] 3755         jsr     DLYSECSBY2      ; delay 2 sec
   9F4B 0C            [ 2] 3756         clc
   9F4C 39            [ 5] 3757         rts
                           3758 
   9F4D                    3759 L9F4D:
   9F4D BD 8C F2      [ 6] 3760         jsr     L8CF2
   9F50 BD 8D 03      [ 6] 3761         jsr     L8D03
                           3762 
   9F53 BD 8D E4      [ 6] 3763         jsr     LCDMSG1 
   9F56 43 6F 64 65 BA     3764         .ascis  'Code:'
                           3765 
                           3766 ; Generate a random 5-digit code in 0x0290-0x0294, and display to user
                           3767 
   9F5B CE 02 90      [ 3] 3768         ldx     #0x0290
   9F5E 7F 00 16      [ 6] 3769         clr     (0x0016)        ; 0x00
   9F61                    3770 L9F61:
   9F61 86 41         [ 2] 3771         ldaa    #0x41           ; 'A'
   9F63                    3772 L9F63:
   9F63 97 15         [ 3] 3773         staa    (0x0015)        ; 0x41
   9F65 BD 8E 95      [ 6] 3774         jsr     L8E95           ; read SCD keys
   9F68 81 0D         [ 2] 3775         cmpa    #0x0D
   9F6A 26 11         [ 3] 3776         bne     L9F7D
   9F6C 96 15         [ 3] 3777         ldaa    (0x0015)
   9F6E A7 00         [ 4] 3778         staa    0,X     
   9F70 08            [ 3] 3779         inx
   9F71 BD 8C 98      [ 6] 3780         jsr     L8C98
   9F74 96 16         [ 3] 3781         ldaa    (0x0016)
   9F76 4C            [ 2] 3782         inca
   9F77 97 16         [ 3] 3783         staa    (0x0016)
   9F79 81 05         [ 2] 3784         cmpa    #0x05
   9F7B 27 09         [ 3] 3785         beq     L9F86  
   9F7D                    3786 L9F7D:
   9F7D 96 15         [ 3] 3787         ldaa    (0x0015)
   9F7F 4C            [ 2] 3788         inca
   9F80 81 5B         [ 2] 3789         cmpa    #0x5B           ; '['
   9F82 27 DD         [ 3] 3790         beq     L9F61  
   9F84 20 DD         [ 3] 3791         bra     L9F63  
                           3792 
                           3793 ; Let the user type in a corresponding password to the code
   9F86                    3794 L9F86:
   9F86 BD 8D DD      [ 6] 3795         jsr     LCDMSG2 
   9F89 50 73 77 64 BA     3796         .ascis  'Pswd:'
                           3797 
   9F8E CE 02 88      [ 3] 3798         ldx     #0x0288
   9F91 86 41         [ 2] 3799         ldaa    #0x41           ; 'A'
   9F93 97 16         [ 3] 3800         staa    (0x0016)
   9F95 86 C5         [ 2] 3801         ldaa    #0xC5           ; 
   9F97 97 15         [ 3] 3802         staa    (0x0015)
   9F99                    3803 L9F99:
   9F99 96 15         [ 3] 3804         ldaa    (0x0015)
   9F9B BD 8C 86      [ 6] 3805         jsr     L8C86           ; write byte to LCD
   9F9E 96 16         [ 3] 3806         ldaa    (0x0016)
   9FA0 BD 8C 98      [ 6] 3807         jsr     L8C98
   9FA3                    3808 L9FA3:
   9FA3 BD 8E 95      [ 6] 3809         jsr     L8E95
   9FA6 27 FB         [ 3] 3810         beq     L9FA3  
   9FA8 81 0D         [ 2] 3811         cmpa    #0x0D
   9FAA 26 10         [ 3] 3812         bne     L9FBC  
   9FAC 96 16         [ 3] 3813         ldaa    (0x0016)
   9FAE A7 00         [ 4] 3814         staa    0,X     
   9FB0 08            [ 3] 3815         inx
   9FB1 96 15         [ 3] 3816         ldaa    (0x0015)
   9FB3 4C            [ 2] 3817         inca
   9FB4 97 15         [ 3] 3818         staa    (0x0015)
   9FB6 81 CA         [ 2] 3819         cmpa    #0xCA
   9FB8 27 28         [ 3] 3820         beq     L9FE2  
   9FBA 20 DD         [ 3] 3821         bra     L9F99  
   9FBC                    3822 L9FBC:
   9FBC 81 01         [ 2] 3823         cmpa    #0x01
   9FBE 26 0F         [ 3] 3824         bne     L9FCF  
   9FC0 96 16         [ 3] 3825         ldaa    (0x0016)
   9FC2 4C            [ 2] 3826         inca
   9FC3 97 16         [ 3] 3827         staa    (0x0016)
   9FC5 81 5B         [ 2] 3828         cmpa    #0x5B
   9FC7 26 D0         [ 3] 3829         bne     L9F99  
   9FC9 86 41         [ 2] 3830         ldaa    #0x41
   9FCB 97 16         [ 3] 3831         staa    (0x0016)
   9FCD 20 CA         [ 3] 3832         bra     L9F99  
   9FCF                    3833 L9FCF:
   9FCF 81 02         [ 2] 3834         cmpa    #0x02
   9FD1 26 D0         [ 3] 3835         bne     L9FA3  
   9FD3 96 16         [ 3] 3836         ldaa    (0x0016)
   9FD5 4A            [ 2] 3837         deca
   9FD6 97 16         [ 3] 3838         staa    (0x0016)
   9FD8 81 40         [ 2] 3839         cmpa    #0x40
   9FDA 26 BD         [ 3] 3840         bne     L9F99  
   9FDC 86 5A         [ 2] 3841         ldaa    #0x5A
   9FDE 97 16         [ 3] 3842         staa    (0x0016)
   9FE0 20 B7         [ 3] 3843         bra     L9F99  
   9FE2                    3844 L9FE2:
   9FE2 BD A0 01      [ 6] 3845         jsr     LA001           ; validate
   9FE5 25 0F         [ 3] 3846         bcs     L9FF6           ; if bad, jump
   9FE7 86 DB         [ 2] 3847         ldaa    #0xDB
   9FE9 97 AB         [ 3] 3848         staa    (0x00AB)        ; good password
   9FEB FC 04 16      [ 5] 3849         ldd     (0x0416)        ; increment number of good validations counter
   9FEE C3 00 01      [ 4] 3850         addd    #0x0001
   9FF1 FD 04 16      [ 5] 3851         std     (0x0416)
   9FF4 0C            [ 2] 3852         clc
   9FF5 39            [ 5] 3853         rts
                           3854 
   9FF6                    3855 L9FF6:
   9FF6 FC 04 14      [ 5] 3856         ldd     (0x0414)        ; increment number of bad validations counter
   9FF9 C3 00 01      [ 4] 3857         addd    #0x0001
   9FFC FD 04 14      [ 5] 3858         std     (0x0414)
   9FFF 0D            [ 2] 3859         sec
   A000 39            [ 5] 3860         rts
                           3861 
                           3862 ; Validate password?
   A001                    3863 LA001:
                           3864         ; scramble 5 letters
   A001 B6 02 90      [ 4] 3865         ldaa    (0x0290)        ; 0 -> 1
   A004 B7 02 81      [ 4] 3866         staa    (0x0281)
   A007 B6 02 91      [ 4] 3867         ldaa    (0x0291)        ; 1 -> 3
   A00A B7 02 83      [ 4] 3868         staa    (0x0283)
   A00D B6 02 92      [ 4] 3869         ldaa    (0x0292)        ; 2 -> 4
   A010 B7 02 84      [ 4] 3870         staa    (0x0284)
   A013 B6 02 93      [ 4] 3871         ldaa    (0x0293)        ; 3 -> 0
   A016 B7 02 80      [ 4] 3872         staa    (0x0280)
   A019 B6 02 94      [ 4] 3873         ldaa    (0x0294)        ; 4 -> 2
   A01C B7 02 82      [ 4] 3874         staa    (0x0282)
                           3875         ; transform each letter
   A01F B6 02 80      [ 4] 3876         ldaa    (0x0280)    
   A022 88 13         [ 2] 3877         eora    #0x13
   A024 8B 03         [ 2] 3878         adda    #0x03
   A026 B7 02 80      [ 4] 3879         staa    (0x0280)
   A029 B6 02 81      [ 4] 3880         ldaa    (0x0281)
   A02C 88 04         [ 2] 3881         eora    #0x04
   A02E 8B 12         [ 2] 3882         adda    #0x12
   A030 B7 02 81      [ 4] 3883         staa    (0x0281)
   A033 B6 02 82      [ 4] 3884         ldaa    (0x0282)
   A036 88 06         [ 2] 3885         eora    #0x06
   A038 8B 04         [ 2] 3886         adda    #0x04
   A03A B7 02 82      [ 4] 3887         staa    (0x0282)
   A03D B6 02 83      [ 4] 3888         ldaa    (0x0283)
   A040 88 11         [ 2] 3889         eora    #0x11
   A042 8B 07         [ 2] 3890         adda    #0x07
   A044 B7 02 83      [ 4] 3891         staa    (0x0283)
   A047 B6 02 84      [ 4] 3892         ldaa    (0x0284)
   A04A 88 01         [ 2] 3893         eora    #0x01
   A04C 8B 10         [ 2] 3894         adda    #0x10
   A04E B7 02 84      [ 4] 3895         staa    (0x0284)
                           3896         ; keep them modulo 26 (A-Z)
   A051 BD A0 AF      [ 6] 3897         jsr     LA0AF
                           3898         ; put some of the original bits into 0x0015/0x0016
   A054 B6 02 94      [ 4] 3899         ldaa    (0x0294)
   A057 84 17         [ 2] 3900         anda    #0x17
   A059 97 15         [ 3] 3901         staa    (0x0015)
   A05B B6 02 90      [ 4] 3902         ldaa    (0x0290)
   A05E 84 17         [ 2] 3903         anda    #0x17
   A060 97 16         [ 3] 3904         staa    (0x0016)
                           3905         ; do some eoring with these bits
   A062 CE 02 80      [ 3] 3906         ldx     #0x0280
   A065                    3907 LA065:
   A065 A6 00         [ 4] 3908         ldaa    0,X
   A067 98 15         [ 3] 3909         eora    (0x0015)
   A069 98 16         [ 3] 3910         eora    (0x0016)
   A06B A7 00         [ 4] 3911         staa    0,X
   A06D 08            [ 3] 3912         inx
   A06E 8C 02 85      [ 4] 3913         cpx     #0x0285
   A071 26 F2         [ 3] 3914         bne     LA065
                           3915         ; keep them modulo 26 (A-Z)
   A073 BD A0 AF      [ 6] 3916         jsr     LA0AF
                           3917         ; compare them to code in 0x0288-0x028C
   A076 CE 02 80      [ 3] 3918         ldx     #0x0280
   A079 18 CE 02 88   [ 4] 3919         ldy     #0x0288
   A07D                    3920 LA07D:
   A07D A6 00         [ 4] 3921         ldaa    0,X     
   A07F 18 A1 00      [ 5] 3922         cmpa    0,Y     
   A082 26 0A         [ 3] 3923         bne     LA08E  
   A084 08            [ 3] 3924         inx
   A085 18 08         [ 4] 3925         iny
   A087 8C 02 85      [ 4] 3926         cpx     #0x0285
   A08A 26 F1         [ 3] 3927         bne     LA07D  
   A08C 0C            [ 2] 3928         clc                     ; carry clear if good
   A08D 39            [ 5] 3929         rts
                           3930 
   A08E                    3931 LA08E:
   A08E 0D            [ 2] 3932         sec                     ; carry set if bad
   A08F 39            [ 5] 3933         rts
                           3934 
                           3935 ; trivial password validation - not used??
   A090                    3936 LA090:
   A090 59 41 44 44 41     3937         .ascii  'YADDA'
                           3938 
   A095 CE 02 88      [ 3] 3939         ldx     #0x0288
   A098 18 CE A0 90   [ 4] 3940         ldy     #LA090
   A09C                    3941 LA09C:
   A09C A6 00         [ 4] 3942         ldaa    0,X
   A09E 18 A1 00      [ 5] 3943         cmpa    0,Y
   A0A1 26 0A         [ 3] 3944         bne     LA0AD
   A0A3 08            [ 3] 3945         inx
   A0A4 18 08         [ 4] 3946         iny
   A0A6 8C 02 8D      [ 4] 3947         cpx     #0x028D
   A0A9 26 F1         [ 3] 3948         bne     LA09C
   A0AB 0C            [ 2] 3949         clc
   A0AC 39            [ 5] 3950         rts
   A0AD                    3951 LA0AD:
   A0AD 0D            [ 2] 3952         sec
   A0AE 39            [ 5] 3953         rts
                           3954 
                           3955 ; keep the password modulo 26, each letter in range 'A-Z'
   A0AF                    3956 LA0AF:
   A0AF CE 02 80      [ 3] 3957         ldx     #0x0280
   A0B2                    3958 LA0B2:
   A0B2 A6 00         [ 4] 3959         ldaa    0,X
   A0B4 81 5B         [ 2] 3960         cmpa    #0x5B
   A0B6 25 06         [ 3] 3961         bcs     LA0BE
   A0B8 80 1A         [ 2] 3962         suba    #0x1A
   A0BA A7 00         [ 4] 3963         staa    0,X
   A0BC 20 08         [ 3] 3964         bra     LA0C6
   A0BE                    3965 LA0BE:
   A0BE 81 41         [ 2] 3966         cmpa    #0x41
   A0C0 24 04         [ 3] 3967         bcc     LA0C6
   A0C2 8B 1A         [ 2] 3968         adda    #0x1A
   A0C4 A7 00         [ 4] 3969         staa    0,X
   A0C6                    3970 LA0C6:
   A0C6 08            [ 3] 3971         inx
   A0C7 8C 02 85      [ 4] 3972         cpx     #0x0285
   A0CA 26 E6         [ 3] 3973         bne     LA0B2  
   A0CC 39            [ 5] 3974         rts
                           3975 
   A0CD BD 8C F2      [ 6] 3976         jsr     L8CF2
                           3977 
   A0D0 BD 8D DD      [ 6] 3978         jsr     LCDMSG2 
   A0D3 46 61 69 6C 65 64  3979         .ascis  'Failed!         '
        21 20 20 20 20 20
        20 20 20 A0
                           3980 
   A0E3 C6 02         [ 2] 3981         ldab    #0x02
   A0E5 BD 8C 30      [ 6] 3982         jsr     DLYSECSBY2      ; delay 1 sec
   A0E8 39            [ 5] 3983         rts
                           3984 
   A0E9                    3985 LA0E9:
   A0E9 C6 01         [ 2] 3986         ldab    #0x01
   A0EB BD 8C 30      [ 6] 3987         jsr     DLYSECSBY2      ; delay 0.5 sec
   A0EE 7F 00 4E      [ 6] 3988         clr     (0x004E)
   A0F1 C6 D3         [ 2] 3989         ldab    #0xD3
   A0F3 BD 87 48      [ 6] 3990         jsr     L8748   
   A0F6 BD 87 AE      [ 6] 3991         jsr     L87AE
   A0F9 BD 8C E9      [ 6] 3992         jsr     L8CE9
                           3993 
   A0FC BD 8D E4      [ 6] 3994         jsr     LCDMSG1 
   A0FF 20 20 20 56 43 52  3995         .ascis  '   VCR adjust'
        20 61 64 6A 75 73
        F4
                           3996 
   A10C BD 8D DD      [ 6] 3997         jsr     LCDMSG2 
   A10F 55 50 20 74 6F 20  3998         .ascis  'UP to clear bits'
        63 6C 65 61 72 20
        62 69 74 F3
                           3999 
   A11F 5F            [ 2] 4000         clrb
   A120 D7 62         [ 3] 4001         stab    (0x0062)
   A122 BD F9 C5      [ 6] 4002         jsr     BUTNLIT 
   A125 B6 18 04      [ 4] 4003         ldaa    PIA0PRA 
   A128 84 BF         [ 2] 4004         anda    #0xBF
   A12A B7 18 04      [ 4] 4005         staa    PIA0PRA 
   A12D BD 8E 95      [ 6] 4006         jsr     L8E95
   A130 7F 00 48      [ 6] 4007         clr     (0x0048)
   A133 7F 00 49      [ 6] 4008         clr     (0x0049)
   A136 BD 86 C4      [ 6] 4009         jsr     L86C4           ; Reset boards 1-10
   A139 86 28         [ 2] 4010         ldaa    #0x28
   A13B 97 63         [ 3] 4011         staa    (0x0063)
   A13D C6 FD         [ 2] 4012         ldab    #0xFD           ; tape deck STOP
   A13F BD 86 E7      [ 6] 4013         jsr     L86E7
   A142 BD A3 2E      [ 6] 4014         jsr     LA32E           ; open curtains
   A145 7C 00 76      [ 6] 4015         inc     (0x0076)
   A148 7F 00 32      [ 6] 4016         clr     (0x0032)
   A14B                    4017 LA14B:
   A14B BD 8E 95      [ 6] 4018         jsr     L8E95
   A14E 81 0D         [ 2] 4019         cmpa    #0x0D
   A150 26 03         [ 3] 4020         bne     LA155  
   A152 7E A1 C4      [ 3] 4021         jmp     LA1C4
   A155                    4022 LA155:
   A155 86 28         [ 2] 4023         ldaa    #0x28
   A157 97 63         [ 3] 4024         staa    (0x0063)
   A159 BD 86 A4      [ 6] 4025         jsr     L86A4
   A15C 25 ED         [ 3] 4026         bcs     LA14B  
   A15E FC 04 1A      [ 5] 4027         ldd     (0x041A)
   A161 C3 00 01      [ 4] 4028         addd    #0x0001
   A164 FD 04 1A      [ 5] 4029         std     (0x041A)
   A167 BD 86 C4      [ 6] 4030         jsr     L86C4           ; Reset boards 1-10
   A16A 7C 00 4E      [ 6] 4031         inc     (0x004E)
   A16D C6 D3         [ 2] 4032         ldab    #0xD3
   A16F BD 87 48      [ 6] 4033         jsr     L8748   
   A172 BD 87 AE      [ 6] 4034         jsr     L87AE
   A175                    4035 LA175:
   A175 96 49         [ 3] 4036         ldaa    (0x0049)
   A177 81 43         [ 2] 4037         cmpa    #0x43
   A179 26 06         [ 3] 4038         bne     LA181  
   A17B 7F 00 49      [ 6] 4039         clr     (0x0049)
   A17E 7F 00 48      [ 6] 4040         clr     (0x0048)
   A181                    4041 LA181:
   A181 96 48         [ 3] 4042         ldaa    (0x0048)
   A183 81 C8         [ 2] 4043         cmpa    #0xC8
   A185 25 1F         [ 3] 4044         bcs     LA1A6  
   A187 FC 02 9C      [ 5] 4045         ldd     (0x029C)
   A18A 1A 83 00 01   [ 5] 4046         cpd     #0x0001
   A18E 27 16         [ 3] 4047         beq     LA1A6  
   A190 C6 EF         [ 2] 4048         ldab    #0xEF           ; tape deck EJECT
   A192 BD 86 E7      [ 6] 4049         jsr     L86E7
   A195 BD 86 C4      [ 6] 4050         jsr     L86C4           ; Reset boards 1-10
   A198 7F 00 4E      [ 6] 4051         clr     (0x004E)
   A19B 7F 00 76      [ 6] 4052         clr     (0x0076)
   A19E C6 0A         [ 2] 4053         ldab    #0x0A
   A1A0 BD 8C 30      [ 6] 4054         jsr     DLYSECSBY2      ; delay 5 sec
   A1A3 7E 81 D7      [ 3] 4055         jmp     L81D7
   A1A6                    4056 LA1A6:
   A1A6 BD 8E 95      [ 6] 4057         jsr     L8E95
   A1A9 81 01         [ 2] 4058         cmpa    #0x01
   A1AB 26 10         [ 3] 4059         bne     LA1BD  
   A1AD CE 10 80      [ 3] 4060         ldx     #0x1080
   A1B0 86 34         [ 2] 4061         ldaa    #0x34
   A1B2                    4062 LA1B2:
   A1B2 6F 00         [ 6] 4063         clr     0,X     
   A1B4 A7 01         [ 4] 4064         staa    1,X     
   A1B6 08            [ 3] 4065         inx
   A1B7 08            [ 3] 4066         inx
   A1B8 8C 10 A0      [ 4] 4067         cpx     #0x10A0
   A1BB 25 F5         [ 3] 4068         bcs     LA1B2  
   A1BD                    4069 LA1BD:
   A1BD 81 0D         [ 2] 4070         cmpa    #0x0D
   A1BF 27 03         [ 3] 4071         beq     LA1C4  
   A1C1 7E A1 75      [ 3] 4072         jmp     LA175
   A1C4                    4073 LA1C4:
   A1C4 7F 00 76      [ 6] 4074         clr     (0x0076)
   A1C7 7F 00 4E      [ 6] 4075         clr     (0x004E)
   A1CA C6 DF         [ 2] 4076         ldab    #0xDF
   A1CC BD 87 48      [ 6] 4077         jsr     L8748   
   A1CF BD 87 91      [ 6] 4078         jsr     L8791   
   A1D2 7E 81 D7      [ 3] 4079         jmp     L81D7
                           4080 
                           4081 ; reprogram EEPROM signature if needed
   A1D5                    4082 LA1D5:
   A1D5 86 07         [ 2] 4083         ldaa    #0x07
   A1D7 B7 04 00      [ 4] 4084         staa    (0x0400)
   A1DA CC 0E 09      [ 3] 4085         ldd     #0x0E09
   A1DD 81 65         [ 2] 4086         cmpa    #0x65           ;'e'
   A1DF 26 05         [ 3] 4087         bne     LA1E6
   A1E1 C1 63         [ 2] 4088         cmpb    #0x63           ;'c'
   A1E3 26 01         [ 3] 4089         bne     LA1E6
   A1E5 39            [ 5] 4090         rts
                           4091 
                           4092 ; erase and reprogram EEPROM signature
   A1E6                    4093 LA1E6:
   A1E6 86 0E         [ 2] 4094         ldaa    #0x0E
   A1E8 B7 10 3B      [ 4] 4095         staa    PPROG
   A1EB 86 FF         [ 2] 4096         ldaa    #0xFF
   A1ED B7 0E 00      [ 4] 4097         staa    (0x0E00)
   A1F0 B6 10 3B      [ 4] 4098         ldaa    PPROG  
   A1F3 8A 01         [ 2] 4099         oraa    #0x01
   A1F5 B7 10 3B      [ 4] 4100         staa    PPROG  
   A1F8 CE 1B 58      [ 3] 4101         ldx     #0x1B58         ; 7000
   A1FB                    4102 LA1FB:
   A1FB 09            [ 3] 4103         dex
   A1FC 26 FD         [ 3] 4104         bne     LA1FB  
   A1FE B6 10 3B      [ 4] 4105         ldaa    PPROG  
   A201 84 FE         [ 2] 4106         anda    #0xFE
   A203 B7 10 3B      [ 4] 4107         staa    PPROG  
   A206 CE 0E 00      [ 3] 4108         ldx     #0x0E00
   A209 18 CE A2 26   [ 4] 4109         ldy     #LA226
   A20D                    4110 LA20D:
   A20D C6 02         [ 2] 4111         ldab    #0x02
   A20F F7 10 3B      [ 4] 4112         stab    PPROG  
   A212 18 A6 00      [ 5] 4113         ldaa    0,Y     
   A215 18 08         [ 4] 4114         iny
   A217 A7 00         [ 4] 4115         staa    0,X     
   A219 BD A2 32      [ 6] 4116         jsr     LA232
   A21C 08            [ 3] 4117         inx
   A21D 8C 0E 0C      [ 4] 4118         cpx     #0x0E0C
   A220 26 EB         [ 3] 4119         bne     LA20D  
   A222 7F 10 3B      [ 6] 4120         clr     PPROG  
   A225 39            [ 5] 4121         rts
                           4122 
                           4123 ; data for 0x0E00-0x0E0B EEPROM
   A226                    4124 LA226:
   A226 29 64 2A 21 32 3A  4125         .ascii  ')d*!2::4!ecq'
        3A 34 21 65 63 71
                           4126 
                           4127 ; program EEPROM
   A232                    4128 LA232:
   A232 18 3C         [ 5] 4129         pshy
   A234 C6 03         [ 2] 4130         ldab    #0x03
   A236 F7 10 3B      [ 4] 4131         stab    PPROG           ; start program
   A239 18 CE 1B 58   [ 4] 4132         ldy     #0x1B58
   A23D                    4133 LA23D:
   A23D 18 09         [ 4] 4134         dey
   A23F 26 FC         [ 3] 4135         bne     LA23D  
   A241 C6 02         [ 2] 4136         ldab    #0x02
   A243 F7 10 3B      [ 4] 4137         stab    PPROG           ; stop program
   A246 18 38         [ 6] 4138         puly
   A248 39            [ 5] 4139         rts
                           4140 
   A249                    4141 LA249:
   A249 0F            [ 2] 4142         sei
   A24A CE 00 10      [ 3] 4143         ldx     #0x0010
   A24D                    4144 LA24D:
   A24D 6F 00         [ 6] 4145         clr     0,X     
   A24F 08            [ 3] 4146         inx
   A250 8C 0E 00      [ 4] 4147         cpx     #0x0E00
   A253 26 F8         [ 3] 4148         bne     LA24D  
   A255 BD 9E AF      [ 6] 4149         jsr     L9EAF           ; reset L counts
   A258 BD 9E 92      [ 6] 4150         jsr     L9E92           ; reset R counts
   A25B 7E F8 00      [ 3] 4151         jmp     RESET           ; reset controller
                           4152 
                           4153 ; Compute and store copyright checksum
   A25E                    4154 LA25E:
   A25E 18 CE 80 03   [ 4] 4155         ldy     #CPYRTMSG       ; copyright message
   A262 CE 00 00      [ 3] 4156         ldx     #0x0000
   A265                    4157 LA265:
   A265 18 E6 00      [ 5] 4158         ldab    0,Y
   A268 3A            [ 3] 4159         abx
   A269 18 08         [ 4] 4160         iny
   A26B 18 8C 80 50   [ 5] 4161         cpy     #0x8050
   A26F 26 F4         [ 3] 4162         bne     LA265
   A271 FF 04 0B      [ 5] 4163         stx     CPYRTCS         ; store checksum here
   A274 39            [ 5] 4164         rts
                           4165 
                           4166 ; Erase EEPROM routine
   A275                    4167 LA275:
   A275 0F            [ 2] 4168         sei
   A276 7F 04 0F      [ 6] 4169         clr     ERASEFLG        ; Reset EEPROM Erase flag
   A279 86 0E         [ 2] 4170         ldaa    #0x0E
   A27B B7 10 3B      [ 4] 4171         staa    PPROG           ; ERASE mode!
   A27E 86 FF         [ 2] 4172         ldaa    #0xFF
   A280 B7 0E 20      [ 4] 4173         staa    (0x0E20)        ; save in NVRAM
   A283 B6 10 3B      [ 4] 4174         ldaa    PPROG  
   A286 8A 01         [ 2] 4175         oraa    #0x01
   A288 B7 10 3B      [ 4] 4176         staa    PPROG           ; do the ERASE
   A28B CE 1B 58      [ 3] 4177         ldx     #0x1B58         ; delay a bit
   A28E                    4178 LA28E:
   A28E 09            [ 3] 4179         dex
   A28F 26 FD         [ 3] 4180         bne     LA28E  
   A291 B6 10 3B      [ 4] 4181         ldaa    PPROG  
   A294 84 FE         [ 2] 4182         anda    #0xFE           ; stop erasing
   A296 7F 10 3B      [ 6] 4183         clr     PPROG  
                           4184 
   A299 BD F9 D8      [ 6] 4185         jsr     SERMSGW         ; display "enter serial number"
   A29C 45 6E 74 65 72 20  4186         .ascis  'Enter serial #: '
        73 65 72 69 61 6C
        20 23 3A A0
                           4187 
   A2AC CE 0E 20      [ 3] 4188         ldx     #0x0E20
   A2AF                    4189 LA2AF:
   A2AF BD F9 45      [ 6] 4190         jsr     SERIALR         ; wait for serial data
   A2B2 24 FB         [ 3] 4191         bcc     LA2AF  
                           4192 
   A2B4 BD F9 6F      [ 6] 4193         jsr     SERIALW         ; read serial data
   A2B7 C6 02         [ 2] 4194         ldab    #0x02
   A2B9 F7 10 3B      [ 4] 4195         stab    PPROG           ; protect only 0x0e20-0x0e5f
   A2BC A7 00         [ 4] 4196         staa    0,X         
   A2BE BD A2 32      [ 6] 4197         jsr     LA232           ; program byte
   A2C1 08            [ 3] 4198         inx
   A2C2 8C 0E 24      [ 4] 4199         cpx     #0x0E24
   A2C5 26 E8         [ 3] 4200         bne     LA2AF  
   A2C7 C6 02         [ 2] 4201         ldab    #0x02
   A2C9 F7 10 3B      [ 4] 4202         stab    PPROG  
   A2CC 86 DB         [ 2] 4203         ldaa    #0xDB           ; it's official
   A2CE B7 0E 24      [ 4] 4204         staa    (0x0E24)
   A2D1 BD A2 32      [ 6] 4205         jsr     LA232           ; program byte
   A2D4 7F 10 3B      [ 6] 4206         clr     PPROG  
   A2D7 86 1E         [ 2] 4207         ldaa    #0x1E
   A2D9 B7 10 35      [ 4] 4208         staa    BPROT           ; protect all but 0x0e00-0x0e1f
   A2DC 7E F8 00      [ 3] 4209         jmp     RESET           ; reset controller
                           4210 
   A2DF                    4211 LA2DF:
   A2DF 38            [ 5] 4212         pulx
   A2E0 3C            [ 4] 4213         pshx
   A2E1 8C 80 00      [ 4] 4214         cpx     #0x8000
   A2E4 25 02         [ 3] 4215         bcs     LA2E8           ; if 0x8000 < calling address (should be)
   A2E6 0C            [ 2] 4216         clc
   A2E7 39            [ 5] 4217         rts
                           4218 
   A2E8                    4219 LA2E8:
   A2E8 0D            [ 2] 4220         sec
   A2E9 39            [ 5] 4221         rts
                           4222 
                           4223 ; enter and validate security code via serial
   A2EA                    4224 LA2EA:
   A2EA CE 02 88      [ 3] 4225         ldx     #0x0288
   A2ED C6 03         [ 2] 4226         ldab    #0x03           ; 3 character code
                           4227 
   A2EF                    4228 LA2EF:
   A2EF BD F9 45      [ 6] 4229         jsr     SERIALR         ; check if available
   A2F2 24 FB         [ 3] 4230         bcc     LA2EF  
   A2F4 A7 00         [ 4] 4231         staa    0,X     
   A2F6 08            [ 3] 4232         inx
   A2F7 5A            [ 2] 4233         decb
   A2F8 26 F5         [ 3] 4234         bne     LA2EF  
                           4235 
   A2FA B6 02 88      [ 4] 4236         ldaa    (0x0288)
   A2FD 81 13         [ 2] 4237         cmpa    #0x13           ; 0x13
   A2FF 26 10         [ 3] 4238         bne     LA311  
   A301 B6 02 89      [ 4] 4239         ldaa    (0x0289)
   A304 81 10         [ 2] 4240         cmpa    #0x10           ; 0x10
   A306 26 09         [ 3] 4241         bne     LA311  
   A308 B6 02 8A      [ 4] 4242         ldaa    (0x028A)
   A30B 81 14         [ 2] 4243         cmpa    #0x14           ; 0x14
   A30D 26 02         [ 3] 4244         bne     LA311  
   A30F 0C            [ 2] 4245         clc
   A310 39            [ 5] 4246         rts
                           4247 
   A311                    4248 LA311:
   A311 0D            [ 2] 4249         sec
   A312 39            [ 5] 4250         rts
                           4251 
   A313                    4252 LA313:
   A313 36            [ 3] 4253         psha
   A314 B6 10 92      [ 4] 4254         ldaa    (0x1092)
   A317 8A 01         [ 2] 4255         oraa    #0x01
   A319                    4256 LA319:
   A319 B7 10 92      [ 4] 4257         staa    (0x1092)
   A31C 32            [ 4] 4258         pula
   A31D 39            [ 5] 4259         rts
                           4260 
   A31E                    4261 LA31E:
   A31E 36            [ 3] 4262         psha
   A31F B6 10 92      [ 4] 4263         ldaa    (0x1092)
   A322 84 FE         [ 2] 4264         anda    #0xFE
   A324 20 F3         [ 3] 4265         bra     LA319
                           4266 
   A326                    4267 LA326:
   A326 96 4E         [ 3] 4268         ldaa    (0x004E)
   A328 97 19         [ 3] 4269         staa    (0x0019)
   A32A 7F 00 4E      [ 6] 4270         clr     (0x004E)
   A32D 39            [ 5] 4271         rts
                           4272 
                           4273         ; open curtains
   A32E                    4274 LA32E:
   A32E B6 10 86      [ 4] 4275         ldaa    (0x1086)
   A331 8A 15         [ 2] 4276         oraa    #0x15           ; xxx1x1x1
   A333 B7 10 86      [ 4] 4277         staa    (0x1086)
   A336 C6 01         [ 2] 4278         ldab    #0x01
   A338 BD 8C 30      [ 6] 4279         jsr     DLYSECSBY2      ; delay 0.5 sec
   A33B 84 EA         [ 2] 4280         anda    #0xEA           ; xxx0x0x0
   A33D B7 10 86      [ 4] 4281         staa    (0x1086)
   A340 39            [ 5] 4282         rts
                           4283 
                           4284         ; close curtains
   A341                    4285 LA341:
   A341 B6 10 86      [ 4] 4286         ldaa    (0x1086)
   A344 8A 2A         [ 2] 4287         oraa    #0x2A           ; xx1x1x1x
   A346 B7 10 86      [ 4] 4288         staa    (0x1086)
   A349 C6 01         [ 2] 4289         ldab    #0x01
   A34B BD 8C 30      [ 6] 4290         jsr     DLYSECSBY2      ; delay 0.5 sec
   A34E 84 D5         [ 2] 4291         anda    #0xD5           ; xx0x0x0x
   A350 B7 10 86      [ 4] 4292         staa    (0x1086)
   A353 39            [ 5] 4293         rts
                           4294 
   A354                    4295 LA354:
   A354 F6 18 04      [ 4] 4296         ldab    PIA0PRA 
   A357 CA 08         [ 2] 4297         orab    #0x08
   A359 F7 18 04      [ 4] 4298         stab    PIA0PRA 
   A35C 39            [ 5] 4299         rts
                           4300 
   A35D F6 18 04      [ 4] 4301         ldab    PIA0PRA 
   A360 C4 F7         [ 2] 4302         andb    #0xF7
   A362 F7 18 04      [ 4] 4303         stab    PIA0PRA 
   A365 39            [ 5] 4304         rts
                           4305 
                           4306 ;'$' command goes here?
   A366                    4307 LA366:
   A366 7F 00 4E      [ 6] 4308         clr     (0x004E)
   A369 BD 86 C4      [ 6] 4309         jsr     L86C4           ; Reset boards 1-10
   A36C 7F 04 2A      [ 6] 4310         clr     (0x042A)
                           4311 
   A36F BD F9 D8      [ 6] 4312         jsr     SERMSGW
   A372 45 6E 74 65 72 20  4313         .ascis  'Enter security code:' 
        73 65 63 75 72 69
        74 79 20 63 6F 64
        65 BA
                           4314 
   A386 BD A2 EA      [ 6] 4315         jsr     LA2EA
   A389 24 03         [ 3] 4316         bcc     LA38E
   A38B 7E 83 31      [ 3] 4317         jmp     L8331
                           4318 
   A38E                    4319 LA38E:
   A38E BD F9 D8      [ 6] 4320         jsr     SERMSGW      
   A391 0C 0A 0D 44 61 76  4321         .ascii  "\f\n\rDave's Setup Utility\n\r"
        65 27 73 20 53 65
        74 75 70 20 55 74
        69 6C 69 74 79 0A
        0D
   A3AA 3C 4B 3E 69 6E 67  4322         .ascii  '<K>ing enable\n\r'
        20 65 6E 61 62 6C
        65 0A 0D
   A3B9 3C 43 3E 6C 65 61  4323         .ascii  '<C>lear random\n\r'
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A3C9 3C 35 3E 20 63 68  4324         .ascii  '<5> character random\n\r'
        61 72 61 63 74 65
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A3DF 3C 4C 3E 69 76 65  4325         .ascii  '<L>ive tape number clear\n\r'
        20 74 61 70 65 20
        6E 75 6D 62 65 72
        20 63 6C 65 61 72
        0A 0D
   A3F9 3C 52 3E 65 67 75  4326         .ascii  '<R>egular tape number clear\n\r'
        6C 61 72 20 74 61
        70 65 20 6E 75 6D
        62 65 72 20 63 6C
        65 61 72 0A 0D
   A416 3C 54 3E 65 73 74  4327         .ascii  '<T>est driver boards\n\r'
        20 64 72 69 76 65
        72 20 62 6F 61 72
        64 73 0A 0D
   A42C 3C 42 3E 75 62 20  4328         .ascii  '<B>ub test\n\r'
        74 65 73 74 0A 0D
   A438 3C 44 3E 65 63 6B  4329         .ascii  '<D>eck test (with tape inserted)\n\r'
        20 74 65 73 74 20
        28 77 69 74 68 20
        74 61 70 65 20 69
        6E 73 65 72 74 65
        64 29 0A 0D
   A45A 3C 37 3E 35 25 20  4330         .ascii  '<7>5% adjustment\n\r'
        61 64 6A 75 73 74
        6D 65 6E 74 0A 0D
   A46C 3C 53 3E 68 6F 77  4331         .ascii  '<S>how re-valid tapes\n\r'
        20 72 65 2D 76 61
        6C 69 64 20 74 61
        70 65 73 0A 0D
   A483 3C 4A 3E 75 6D 70  4332         .ascis  '<J>ump to system\n\r'
        20 74 6F 20 73 79
        73 74 65 6D 0A 8D
                           4333 
   A495                    4334 LA495:
   A495 BD F9 45      [ 6] 4335         jsr     SERIALR     
   A498 24 FB         [ 3] 4336         bcc     LA495  
   A49A 81 43         [ 2] 4337         cmpa    #0x43           ;'C'
   A49C 26 09         [ 3] 4338         bne     LA4A7  
   A49E 7F 04 01      [ 6] 4339         clr     (0x0401)        ;clear random
   A4A1 7F 04 2B      [ 6] 4340         clr     (0x042B)
   A4A4 7E A5 14      [ 3] 4341         jmp     LA514
   A4A7                    4342 LA4A7:
   A4A7 81 35         [ 2] 4343         cmpa    #0x35           ;'5'
   A4A9 26 0D         [ 3] 4344         bne     LA4B8  
   A4AB B6 04 01      [ 4] 4345         ldaa    (0x0401)        ;5 character random
   A4AE 84 7F         [ 2] 4346         anda    #0x7F
   A4B0 8A 7F         [ 2] 4347         oraa    #0x7F
   A4B2 B7 04 01      [ 4] 4348         staa    (0x0401)
   A4B5 7E A5 14      [ 3] 4349         jmp     LA514
   A4B8                    4350 LA4B8:
   A4B8 81 4C         [ 2] 4351         cmpa    #0x4C           ;'L'
   A4BA 26 06         [ 3] 4352         bne     LA4C2
   A4BC BD 9E AF      [ 6] 4353         jsr     L9EAF           ; reset Liv counts
   A4BF 7E A5 14      [ 3] 4354         jmp     LA514
   A4C2                    4355 LA4C2:
   A4C2 81 52         [ 2] 4356         cmpa    #0x52           ;'R'
   A4C4 26 06         [ 3] 4357         bne     LA4CC  
   A4C6 BD 9E 92      [ 6] 4358         jsr     L9E92           ; reset Reg counts
   A4C9 7E A5 14      [ 3] 4359         jmp     LA514
   A4CC                    4360 LA4CC:
   A4CC 81 54         [ 2] 4361         cmpa    #0x54           ;'T'
   A4CE 26 06         [ 3] 4362         bne     LA4D6  
   A4D0 BD A5 65      [ 6] 4363         jsr     LA565           ; test driver boards
   A4D3 7E A5 14      [ 3] 4364         jmp     LA514
   A4D6                    4365 LA4D6:
   A4D6 81 42         [ 2] 4366         cmpa    #0x42           ;'B'
   A4D8 26 06         [ 3] 4367         bne     LA4E0  
   A4DA BD A5 26      [ 6] 4368         jsr     LA526           ; bulb test?
   A4DD 7E A5 14      [ 3] 4369         jmp     LA514
   A4E0                    4370 LA4E0:
   A4E0 81 44         [ 2] 4371         cmpa    #0x44           ;'D'
   A4E2 26 06         [ 3] 4372         bne     LA4EA  
   A4E4 BD A5 3C      [ 6] 4373         jsr     LA53C           ; deck test
   A4E7 7E A5 14      [ 3] 4374         jmp     LA514
   A4EA                    4375 LA4EA:
   A4EA 81 37         [ 2] 4376         cmpa    #0x37           ;'7'
   A4EC 26 08         [ 3] 4377         bne     LA4F6  
   A4EE C6 FB         [ 2] 4378         ldab    #0xFB           ; tape deck PLAY
   A4F0 BD 86 E7      [ 6] 4379         jsr     L86E7           ; 5% adjustment
   A4F3 7E A5 14      [ 3] 4380         jmp     LA514
   A4F6                    4381 LA4F6:
   A4F6 81 4A         [ 2] 4382         cmpa    #0x4A           ;'J'
   A4F8 26 03         [ 3] 4383         bne     LA4FD  
   A4FA 7E F8 00      [ 3] 4384         jmp     RESET           ; jump to system (reset)
   A4FD                    4385 LA4FD:
   A4FD 81 4B         [ 2] 4386         cmpa    #0x4B           ;'K'
   A4FF 26 06         [ 3] 4387         bne     LA507  
   A501 7C 04 2A      [ 6] 4388         inc     (0x042A)        ; King enable
   A504 7E A5 14      [ 3] 4389         jmp     LA514
   A507                    4390 LA507:
   A507 81 53         [ 2] 4391         cmpa    #0x53           ;'S'
   A509 26 06         [ 3] 4392         bne     LA511  
   A50B BD AB 7C      [ 6] 4393         jsr     LAB7C           ; show re-valid tapes
   A50E 7E A5 14      [ 3] 4394         jmp     LA514
   A511                    4395 LA511:
   A511 7E A4 95      [ 3] 4396         jmp     LA495
   A514                    4397 LA514:
   A514 86 07         [ 2] 4398         ldaa    #0x07
   A516 BD F9 6F      [ 6] 4399         jsr     SERIALW      
   A519 C6 01         [ 2] 4400         ldab    #0x01
   A51B BD 8C 30      [ 6] 4401         jsr     DLYSECSBY2      ; delay 0.5 sec
   A51E 86 07         [ 2] 4402         ldaa    #0x07
   A520 BD F9 6F      [ 6] 4403         jsr     SERIALW      
   A523 7E A3 8E      [ 3] 4404         jmp     LA38E
                           4405 
                           4406 ; bulb test
   A526                    4407 LA526:
   A526 5F            [ 2] 4408         clrb
   A527 BD F9 C5      [ 6] 4409         jsr     BUTNLIT 
   A52A                    4410 LA52A:
   A52A F6 10 0A      [ 4] 4411         ldab    PORTE
   A52D C8 FF         [ 2] 4412         eorb    #0xFF
   A52F BD F9 C5      [ 6] 4413         jsr     BUTNLIT 
   A532 C1 80         [ 2] 4414         cmpb    #0x80
   A534 26 F4         [ 3] 4415         bne     LA52A  
   A536 C6 02         [ 2] 4416         ldab    #0x02
   A538 BD 8C 30      [ 6] 4417         jsr     DLYSECSBY2      ; delay 1 sec
   A53B 39            [ 5] 4418         rts
                           4419 
                           4420 ; deck test
   A53C                    4421 LA53C:
   A53C C6 FD         [ 2] 4422         ldab    #0xFD           ; tape deck STOP
   A53E BD 86 E7      [ 6] 4423         jsr     L86E7
   A541 C6 06         [ 2] 4424         ldab    #0x06
   A543 BD 8C 30      [ 6] 4425         jsr     DLYSECSBY2      ; delay 3 sec
   A546 C6 FB         [ 2] 4426         ldab    #0xFB           ; tape deck PLAY
   A548 BD 86 E7      [ 6] 4427         jsr     L86E7
   A54B C6 06         [ 2] 4428         ldab    #0x06
   A54D BD 8C 30      [ 6] 4429         jsr     DLYSECSBY2      ; delay 3 sec
   A550 C6 FD         [ 2] 4430         ldab    #0xFD           ; tape deck STOP
   A552 BD 86 E7      [ 6] 4431         jsr     L86E7
   A555 C6 F7         [ 2] 4432         ldab    #0xF7
   A557 BD 86 E7      [ 6] 4433         jsr     L86E7           ; tape deck REWIND
   A55A C6 06         [ 2] 4434         ldab    #0x06
   A55C BD 8C 30      [ 6] 4435         jsr     DLYSECSBY2      ; delay 3 sec
   A55F C6 EF         [ 2] 4436         ldab    #0xEF           ; tape deck EJECT
   A561 BD 86 E7      [ 6] 4437         jsr     L86E7
   A564 39            [ 5] 4438         rts
                           4439 
                           4440 ; test driver boards
   A565                    4441 LA565:
   A565 BD F9 45      [ 6] 4442         jsr     SERIALR     
   A568 24 08         [ 3] 4443         bcc     LA572  
   A56A 81 1B         [ 2] 4444         cmpa    #0x1B
   A56C 26 04         [ 3] 4445         bne     LA572  
   A56E BD 86 C4      [ 6] 4446         jsr     L86C4           ; Reset boards 1-10
   A571 39            [ 5] 4447         rts
   A572                    4448 LA572:
   A572 86 08         [ 2] 4449         ldaa    #0x08
   A574 97 15         [ 3] 4450         staa    (0x0015)
   A576 BD 86 C4      [ 6] 4451         jsr     L86C4           ; Reset boards 1-10
   A579 86 01         [ 2] 4452         ldaa    #0x01
   A57B                    4453 LA57B:
   A57B 36            [ 3] 4454         psha
   A57C 16            [ 2] 4455         tab
   A57D BD F9 C5      [ 6] 4456         jsr     BUTNLIT 
   A580 B6 18 04      [ 4] 4457         ldaa    PIA0PRA 
   A583 88 08         [ 2] 4458         eora    #0x08
   A585 B7 18 04      [ 4] 4459         staa    PIA0PRA 
   A588 32            [ 4] 4460         pula
   A589 B7 10 80      [ 4] 4461         staa    (0x1080)
   A58C B7 10 84      [ 4] 4462         staa    (0x1084)
   A58F B7 10 88      [ 4] 4463         staa    (0x1088)
   A592 B7 10 8C      [ 4] 4464         staa    (0x108C)
   A595 B7 10 90      [ 4] 4465         staa    (0x1090)
   A598 B7 10 94      [ 4] 4466         staa    (0x1094)
   A59B B7 10 98      [ 4] 4467         staa    (0x1098)
   A59E B7 10 9C      [ 4] 4468         staa    (0x109C)
   A5A1 C6 14         [ 2] 4469         ldab    #0x14
   A5A3 BD A6 52      [ 6] 4470         jsr     LA652
   A5A6 49            [ 2] 4471         rola
   A5A7 36            [ 3] 4472         psha
   A5A8 D6 15         [ 3] 4473         ldab    (0x0015)
   A5AA 5A            [ 2] 4474         decb
   A5AB D7 15         [ 3] 4475         stab    (0x0015)
   A5AD BD F9 95      [ 6] 4476         jsr     DIAGDGT         ; write digit to the diag display
   A5B0 37            [ 3] 4477         pshb
   A5B1 C6 27         [ 2] 4478         ldab    #0x27
   A5B3 96 15         [ 3] 4479         ldaa    (0x0015)
   A5B5 0C            [ 2] 4480         clc
   A5B6 89 30         [ 2] 4481         adca    #0x30
   A5B8 BD 8D B5      [ 6] 4482         jsr     L8DB5           ; display char here on LCD display
   A5BB 33            [ 4] 4483         pulb
   A5BC 32            [ 4] 4484         pula
   A5BD 5D            [ 2] 4485         tstb
   A5BE 26 BB         [ 3] 4486         bne     LA57B  
   A5C0 86 08         [ 2] 4487         ldaa    #0x08
   A5C2 97 15         [ 3] 4488         staa    (0x0015)
   A5C4 BD 86 C4      [ 6] 4489         jsr     L86C4           ; Reset boards 1-10
   A5C7 86 01         [ 2] 4490         ldaa    #0x01
   A5C9                    4491 LA5C9:
   A5C9 B7 10 82      [ 4] 4492         staa    (0x1082)
   A5CC B7 10 86      [ 4] 4493         staa    (0x1086)
   A5CF B7 10 8A      [ 4] 4494         staa    (0x108A)
   A5D2 B7 10 8E      [ 4] 4495         staa    (0x108E)
   A5D5 B7 10 92      [ 4] 4496         staa    (0x1092)
   A5D8 B7 10 96      [ 4] 4497         staa    (0x1096)
   A5DB B7 10 9A      [ 4] 4498         staa    (0x109A)
   A5DE B7 10 9E      [ 4] 4499         staa    (0x109E)
   A5E1 C6 14         [ 2] 4500         ldab    #0x14
   A5E3 BD A6 52      [ 6] 4501         jsr     LA652
   A5E6 49            [ 2] 4502         rola
   A5E7 36            [ 3] 4503         psha
   A5E8 D6 15         [ 3] 4504         ldab    (0x0015)
   A5EA 5A            [ 2] 4505         decb
   A5EB D7 15         [ 3] 4506         stab    (0x0015)
   A5ED BD F9 95      [ 6] 4507         jsr     DIAGDGT         ; write digit to the diag display
   A5F0 37            [ 3] 4508         pshb
   A5F1 C6 27         [ 2] 4509         ldab    #0x27
   A5F3 96 15         [ 3] 4510         ldaa    (0x0015)
   A5F5 0C            [ 2] 4511         clc
   A5F6 89 30         [ 2] 4512         adca    #0x30
   A5F8 BD 8D B5      [ 6] 4513         jsr     L8DB5           ; display char here on LCD display
   A5FB 33            [ 4] 4514         pulb
   A5FC 32            [ 4] 4515         pula
   A5FD 7D 00 15      [ 6] 4516         tst     (0x0015)
   A600 26 C7         [ 3] 4517         bne     LA5C9  
   A602 BD 86 C4      [ 6] 4518         jsr     L86C4           ; Reset boards 1-10
   A605 CE 10 80      [ 3] 4519         ldx     #0x1080
   A608 C6 00         [ 2] 4520         ldab    #0x00
   A60A                    4521 LA60A:
   A60A 86 FF         [ 2] 4522         ldaa    #0xFF
   A60C A7 00         [ 4] 4523         staa    0,X
   A60E A7 02         [ 4] 4524         staa    2,X     
   A610 37            [ 3] 4525         pshb
   A611 C6 1E         [ 2] 4526         ldab    #0x1E
   A613 BD A6 52      [ 6] 4527         jsr     LA652
   A616 33            [ 4] 4528         pulb
   A617 86 00         [ 2] 4529         ldaa    #0x00
   A619 A7 00         [ 4] 4530         staa    0,X     
   A61B A7 02         [ 4] 4531         staa    2,X     
   A61D 5C            [ 2] 4532         incb
   A61E 3C            [ 4] 4533         pshx
   A61F BD F9 95      [ 6] 4534         jsr     DIAGDGT         ; write digit to the diag display
   A622 37            [ 3] 4535         pshb
   A623 C6 27         [ 2] 4536         ldab    #0x27
   A625 32            [ 4] 4537         pula
   A626 36            [ 3] 4538         psha
   A627 0C            [ 2] 4539         clc
   A628 89 30         [ 2] 4540         adca    #0x30
   A62A BD 8D B5      [ 6] 4541         jsr     L8DB5           ; display char here on LCD display
   A62D 33            [ 4] 4542         pulb
   A62E 38            [ 5] 4543         pulx
   A62F 08            [ 3] 4544         inx
   A630 08            [ 3] 4545         inx
   A631 08            [ 3] 4546         inx
   A632 08            [ 3] 4547         inx
   A633 8C 10 9D      [ 4] 4548         cpx     #0x109D
   A636 25 D2         [ 3] 4549         bcs     LA60A  
   A638 CE 10 80      [ 3] 4550         ldx     #0x1080
   A63B                    4551 LA63B:
   A63B 86 FF         [ 2] 4552         ldaa    #0xFF
   A63D A7 00         [ 4] 4553         staa    0,X     
   A63F A7 02         [ 4] 4554         staa    2,X     
   A641 08            [ 3] 4555         inx
   A642 08            [ 3] 4556         inx
   A643 08            [ 3] 4557         inx
   A644 08            [ 3] 4558         inx
   A645 8C 10 9D      [ 4] 4559         cpx     #0x109D
   A648 25 F1         [ 3] 4560         bcs     LA63B  
   A64A C6 06         [ 2] 4561         ldab    #0x06
   A64C BD 8C 30      [ 6] 4562         jsr     DLYSECSBY2      ; delay 3 sec
   A64F 7E A5 65      [ 3] 4563         jmp     LA565
   A652                    4564 LA652:
   A652 36            [ 3] 4565         psha
   A653 4F            [ 2] 4566         clra
   A654 DD 23         [ 4] 4567         std     CDTIMR5
   A656                    4568 LA656:
   A656 7D 00 24      [ 6] 4569         tst     CDTIMR5+1
   A659 26 FB         [ 3] 4570         bne     LA656  
   A65B 32            [ 4] 4571         pula
   A65C 39            [ 5] 4572         rts
                           4573 
                           4574 ; Comma-seperated text
   A65D                    4575 LA65D:
   A65D 30 2C 43 68 75 63  4576         .ascii  '0,Chuck,Mouth,'
        6B 2C 4D 6F 75 74
        68 2C
   A66B 31 2C 48 65 61 64  4577         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A677 32 2C 48 65 61 64  4578         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A684 32 2C 48 65 61 64  4579         .ascii  '2,Head up,'
        20 75 70 2C
   A68E 32 2C 45 79 65 73  4580         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A69B 31 2C 45 79 65 6C  4581         .ascii  '1,Eyelids,'
        69 64 73 2C
   A6A5 31 2C 52 69 67 68  4582         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A6B2 32 2C 45 79 65 73  4583         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A6BE 31 2C 38 2C 48 65  4584         .ascii  '1,8,Helen,Mouth,'
        6C 65 6E 2C 4D 6F
        75 74 68 2C
   A6CE 31 2C 48 65 61 64  4585         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A6DA 32 2C 48 65 61 64  4586         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A6E7 32 2C 48 65 61 64  4587         .ascii  '2,Head up,'
        20 75 70 2C
   A6F1 32 2C 45 79 65 73  4588         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A6FE 31 2C 45 79 65 6C  4589         .ascii  '1,Eyelids,'
        69 64 73 2C
   A708 31 2C 52 69 67 68  4590         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A715 32 2C 45 79 65 73  4591         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A721 31 2C 36 2C 4D 75  4592         .ascii  '1,6,Munch,Mouth,'
        6E 63 68 2C 4D 6F
        75 74 68 2C
   A731 31 2C 48 65 61 64  4593         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A73D 32 2C 48 65 61 64  4594         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A74A 32 2C 4C 65 66 74  4595         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A755 32 2C 45 79 65 73  4596         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A762 31 2C 45 79 65 6C  4597         .ascii  '1,Eyelids,'
        69 64 73 2C
   A76C 31 2C 52 69 67 68  4598         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A778 32 2C 45 79 65 73  4599         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A784 31 2C 32 2C 4A 61  4600         .ascii  '1,2,Jasper,Mouth,'
        73 70 65 72 2C 4D
        6F 75 74 68 2C
   A795 31 2C 48 65 61 64  4601         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A7A1 32 2C 48 65 61 64  4602         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A7AE 32 2C 48 65 61 64  4603         .ascii  '2,Head up,'
        20 75 70 2C
   A7B8 32 2C 45 79 65 73  4604         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A7C5 31 2C 45 79 65 6C  4605         .ascii  '1,Eyelids,'
        69 64 73 2C
   A7CF 31 2C 48 61 6E 64  4606         .ascii  '1,Hands,'
        73 2C
   A7D7 32 2C 45 79 65 73  4607         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A7E3 31 2C 34 2C 50 61  4608         .ascii  '1,4,Pasqually,Mouth-Mustache,'
        73 71 75 61 6C 6C
        79 2C 4D 6F 75 74
        68 2D 4D 75 73 74
        61 63 68 65 2C
   A800 31 2C 48 65 61 64  4609         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A80C 32 2C 48 65 61 64  4610         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A819 32 2C 4C 65 66 74  4611         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A824 32 2C 45 79 65 73  4612         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A831 31 2C 45 79 65 6C  4613         .ascii  '1,Eyelids,'
        69 64 73 2C
   A83B 31 2C 52 69 67 68  4614         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A847 32 2C 45 79 65 73  4615         .ascii  '2,Eyes left,1,'
        20 6C 65 66 74 2C
        31 2C
                           4616 
   A855                    4617 LA855:
   A855 3C            [ 4] 4618         pshx
   A856 BD 86 C4      [ 6] 4619         jsr     L86C4           ; Reset boards 1-10
   A859 CE 10 80      [ 3] 4620         ldx     #0x1080
   A85C 86 20         [ 2] 4621         ldaa    #0x20
   A85E A7 00         [ 4] 4622         staa    0,X
   A860 A7 04         [ 4] 4623         staa    4,X
   A862 A7 08         [ 4] 4624         staa    8,X
   A864 A7 0C         [ 4] 4625         staa    12,X
   A866 A7 10         [ 4] 4626         staa    16,X
   A868 38            [ 5] 4627         pulx
   A869 39            [ 5] 4628         rts
                           4629 
   A86A                    4630 LA86A:
   A86A BD A3 2E      [ 6] 4631         jsr     LA32E           ; open curtains
                           4632 
   A86D BD 8D E4      [ 6] 4633         jsr     LCDMSG1 
   A870 20 20 20 20 57 61  4634         .ascis  '    Warm-Up  '
        72 6D 2D 55 70 20
        A0
                           4635 
   A87D BD 8D DD      [ 6] 4636         jsr     LCDMSG2 
   A880 43 75 72 74 61 69  4637         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           4638 
   A890 C6 14         [ 2] 4639         ldab    #0x14
   A892 BD 8C 30      [ 6] 4640         jsr     DLYSECSBY2      ; delay 10 sec
   A895                    4641 LA895:
   A895 BD A8 55      [ 6] 4642         jsr     LA855
   A898 C6 02         [ 2] 4643         ldab    #0x02
   A89A BD 8C 30      [ 6] 4644         jsr     DLYSECSBY2      ; delay 1 sec
   A89D CE A6 5D      [ 3] 4645         ldx     #LA65D
   A8A0 C6 05         [ 2] 4646         ldab    #0x05
   A8A2 D7 12         [ 3] 4647         stab    (0x0012)
   A8A4                    4648 LA8A4:
   A8A4 C6 08         [ 2] 4649         ldab    #0x08
   A8A6 D7 13         [ 3] 4650         stab    (0x0013)
   A8A8 BD A9 41      [ 6] 4651         jsr     LA941
   A8AB BD A9 4C      [ 6] 4652         jsr     LA94C
   A8AE C6 02         [ 2] 4653         ldab    #0x02
   A8B0 BD 8C 30      [ 6] 4654         jsr     DLYSECSBY2      ; delay 1 sec
   A8B3                    4655 LA8B3:
   A8B3 BD A9 5E      [ 6] 4656         jsr     LA95E
   A8B6 A6 00         [ 4] 4657         ldaa    0,X     
   A8B8 80 30         [ 2] 4658         suba    #0x30
   A8BA 08            [ 3] 4659         inx
   A8BB 08            [ 3] 4660         inx
   A8BC 36            [ 3] 4661         psha
   A8BD 7C 00 4C      [ 6] 4662         inc     (0x004C)
   A8C0 3C            [ 4] 4663         pshx
   A8C1 BD 88 E5      [ 6] 4664         jsr     L88E5
   A8C4 38            [ 5] 4665         pulx
   A8C5 86 4F         [ 2] 4666         ldaa    #0x4F           ;'O'
   A8C7 C6 0C         [ 2] 4667         ldab    #0x0C
   A8C9 BD 8D B5      [ 6] 4668         jsr     L8DB5           ; display char here on LCD display
   A8CC 86 6E         [ 2] 4669         ldaa    #0x6E           ;'n'
   A8CE C6 0D         [ 2] 4670         ldab    #0x0D
   A8D0 BD 8D B5      [ 6] 4671         jsr     L8DB5           ; display char here on LCD display
   A8D3 CC 20 0E      [ 3] 4672         ldd     #0x200E         ;' '
   A8D6 BD 8D B5      [ 6] 4673         jsr     L8DB5           ; display char here on LCD display
   A8D9 7A 00 4C      [ 6] 4674         dec     (0x004C)
   A8DC 32            [ 4] 4675         pula
   A8DD 36            [ 3] 4676         psha
   A8DE C6 64         [ 2] 4677         ldab    #0x64
   A8E0 3D            [10] 4678         mul
   A8E1 DD 23         [ 4] 4679         std     CDTIMR5
   A8E3                    4680 LA8E3:
   A8E3 DC 23         [ 4] 4681         ldd     CDTIMR5
   A8E5 26 FC         [ 3] 4682         bne     LA8E3  
   A8E7 BD 8E 95      [ 6] 4683         jsr     L8E95
   A8EA 81 0D         [ 2] 4684         cmpa    #0x0D
   A8EC 26 05         [ 3] 4685         bne     LA8F3  
   A8EE BD A9 75      [ 6] 4686         jsr     LA975           ; Wait for SCD Keypress
   A8F1 20 10         [ 3] 4687         bra     LA903  
   A8F3                    4688 LA8F3:
   A8F3 81 01         [ 2] 4689         cmpa    #0x01
   A8F5 26 04         [ 3] 4690         bne     LA8FB  
   A8F7 32            [ 4] 4691         pula
   A8F8 7E A8 95      [ 3] 4692         jmp     LA895
   A8FB                    4693 LA8FB:
   A8FB 81 02         [ 2] 4694         cmpa    #0x02
   A8FD 26 04         [ 3] 4695         bne     LA903  
   A8FF 32            [ 4] 4696         pula
   A900 7E A9 35      [ 3] 4697         jmp     LA935
   A903                    4698 LA903:
   A903 3C            [ 4] 4699         pshx
   A904 BD 88 E5      [ 6] 4700         jsr     L88E5
   A907 38            [ 5] 4701         pulx
   A908 86 66         [ 2] 4702         ldaa    #0x66           ;'f'
   A90A C6 0D         [ 2] 4703         ldab    #0x0D
   A90C BD 8D B5      [ 6] 4704         jsr     L8DB5           ; display char here on LCD display
   A90F 86 66         [ 2] 4705         ldaa    #0x66           ;'f'
   A911 C6 0E         [ 2] 4706         ldab    #0x0E
   A913 BD 8D B5      [ 6] 4707         jsr     L8DB5           ; display char here on LCD display
   A916 32            [ 4] 4708         pula
   A917 C6 64         [ 2] 4709         ldab    #0x64
   A919 3D            [10] 4710         mul
   A91A DD 23         [ 4] 4711         std     CDTIMR5
   A91C                    4712 LA91C:
   A91C DC 23         [ 4] 4713         ldd     CDTIMR5
   A91E 26 FC         [ 3] 4714         bne     LA91C  
   A920 BD A8 55      [ 6] 4715         jsr     LA855
   A923 7C 00 4B      [ 6] 4716         inc     (0x004B)
   A926 96 4B         [ 3] 4717         ldaa    (0x004B)
   A928 81 48         [ 2] 4718         cmpa    #0x48
   A92A 25 87         [ 3] 4719         bcs     LA8B3  
   A92C 96 4C         [ 3] 4720         ldaa    (0x004C)
   A92E 81 34         [ 2] 4721         cmpa    #0x34
   A930 27 03         [ 3] 4722         beq     LA935  
   A932 7E A8 A4      [ 3] 4723         jmp     LA8A4
   A935                    4724 LA935:
   A935 C6 02         [ 2] 4725         ldab    #0x02
   A937 BD 8C 30      [ 6] 4726         jsr     DLYSECSBY2      ; delay 1 sec
   A93A BD 86 C4      [ 6] 4727         jsr     L86C4           ; Reset boards 1-10
   A93D BD A3 41      [ 6] 4728         jsr     LA341           ; close curtains
   A940 39            [ 5] 4729         rts
                           4730 
   A941                    4731 LA941:
   A941 A6 00         [ 4] 4732         ldaa    0,X     
   A943 08            [ 3] 4733         inx
   A944 08            [ 3] 4734         inx
   A945 97 4C         [ 3] 4735         staa    (0x004C)
   A947 86 40         [ 2] 4736         ldaa    #0x40
   A949 97 4B         [ 3] 4737         staa    (0x004B)
   A94B 39            [ 5] 4738         rts
                           4739 
   A94C                    4740 LA94C:
   A94C BD 8C F2      [ 6] 4741         jsr     L8CF2
   A94F                    4742 LA94F:
   A94F A6 00         [ 4] 4743         ldaa    0,X     
   A951 08            [ 3] 4744         inx
   A952 81 2C         [ 2] 4745         cmpa    #0x2C
   A954 27 07         [ 3] 4746         beq     LA95D  
   A956 36            [ 3] 4747         psha
   A957 BD 8E 70      [ 6] 4748         jsr     L8E70
   A95A 32            [ 4] 4749         pula
   A95B 20 F2         [ 3] 4750         bra     LA94F  
   A95D                    4751 LA95D:
   A95D 39            [ 5] 4752         rts
                           4753 
   A95E                    4754 LA95E:
   A95E BD 8D 03      [ 6] 4755         jsr     L8D03
   A961 86 C0         [ 2] 4756         ldaa    #0xC0
   A963 BD 8E 4B      [ 6] 4757         jsr     L8E4B
   A966                    4758 LA966:
   A966 A6 00         [ 4] 4759         ldaa    0,X     
   A968 08            [ 3] 4760         inx
   A969 81 2C         [ 2] 4761         cmpa    #0x2C
   A96B 27 07         [ 3] 4762         beq     LA974  
   A96D 36            [ 3] 4763         psha
   A96E BD 8E 70      [ 6] 4764         jsr     L8E70
   A971 32            [ 4] 4765         pula
   A972 20 F2         [ 3] 4766         bra     LA966  
   A974                    4767 LA974:
   A974 39            [ 5] 4768         rts
                           4769 
                           4770 ; Wait for SCD Keypress
   A975                    4771 LA975:
   A975 BD 8E 95      [ 6] 4772         jsr     L8E95
   A978 4D            [ 2] 4773         tsta
   A979 27 FA         [ 3] 4774         beq     LA975  
   A97B 39            [ 5] 4775         rts
                           4776 
   A97C                    4777 LA97C:
   A97C 7F 00 60      [ 6] 4778         clr     (0x0060)
   A97F FC 02 9C      [ 5] 4779         ldd     (0x029C)
   A982 1A 83 00 01   [ 5] 4780         cpd     #0x0001
   A986 27 0C         [ 3] 4781         beq     LA994  
   A988 1A 83 03 E8   [ 5] 4782         cpd     #0x03E8
   A98C 2D 7D         [ 3] 4783         blt     LAA0B  
   A98E 1A 83 04 4B   [ 5] 4784         cpd     #0x044B
   A992 22 77         [ 3] 4785         bhi     LAA0B  
   A994                    4786 LA994:
   A994 C6 40         [ 2] 4787         ldab    #0x40
   A996 D7 62         [ 3] 4788         stab    (0x0062)
   A998 BD F9 C5      [ 6] 4789         jsr     BUTNLIT 
   A99B C6 64         [ 2] 4790         ldab    #0x64           ; delay 1 sec
   A99D BD 8C 22      [ 6] 4791         jsr     DLYSECSBY100
   A9A0 BD 86 C4      [ 6] 4792         jsr     L86C4           ; Reset boards 1-10
   A9A3 BD 8C E9      [ 6] 4793         jsr     L8CE9
                           4794 
   A9A6 BD 8D E4      [ 6] 4795         jsr     LCDMSG1 
   A9A9 20 20 20 20 20 53  4796         .ascis  '     STUDIO'
        54 55 44 49 CF
                           4797 
   A9B4 BD 8D DD      [ 6] 4798         jsr     LCDMSG2 
   A9B7 70 72 6F 67 72 61  4799         .ascis  'programming mode'
        6D 6D 69 6E 67 20
        6D 6F 64 E5
                           4800 
   A9C7 BD A3 2E      [ 6] 4801         jsr     LA32E           ; open curtains
   A9CA BD 99 9E      [ 6] 4802         jsr     L999E
   A9CD BD 99 B1      [ 6] 4803         jsr     L99B1
   A9D0 CE 20 00      [ 3] 4804         ldx     #0x2000
   A9D3                    4805 LA9D3:
   A9D3 18 CE 00 C0   [ 4] 4806         ldy     #0x00C0
   A9D7                    4807 LA9D7:
   A9D7 18 09         [ 4] 4808         dey
   A9D9 26 0A         [ 3] 4809         bne     LA9E5  
   A9DB BD A9 F4      [ 6] 4810         jsr     LA9F4
   A9DE 96 60         [ 3] 4811         ldaa    (0x0060)
   A9E0 26 29         [ 3] 4812         bne     LAA0B  
   A9E2 CE 20 00      [ 3] 4813         ldx     #0x2000
   A9E5                    4814 LA9E5:
   A9E5 B6 10 A8      [ 4] 4815         ldaa    (0x10A8)
   A9E8 84 01         [ 2] 4816         anda    #0x01
   A9EA 27 EB         [ 3] 4817         beq     LA9D7  
   A9EC B6 10 A9      [ 4] 4818         ldaa    (0x10A9)
   A9EF A7 00         [ 4] 4819         staa    0,X     
   A9F1 08            [ 3] 4820         inx
   A9F2 20 DF         [ 3] 4821         bra     LA9D3
                           4822 
   A9F4                    4823 LA9F4:
   A9F4 CE 20 00      [ 3] 4824         ldx     #0x2000
   A9F7 18 CE 10 80   [ 4] 4825         ldy     #0x1080
   A9FB                    4826 LA9FB:
   A9FB A6 00         [ 4] 4827         ldaa    0,X     
   A9FD 18 A7 00      [ 5] 4828         staa    0,Y     
   AA00 08            [ 3] 4829         inx
   AA01 18 08         [ 4] 4830         iny
   AA03 18 08         [ 4] 4831         iny
   AA05 8C 20 10      [ 4] 4832         cpx     #0x2010
   AA08 25 F1         [ 3] 4833         bcs     LA9FB  
   AA0A 39            [ 5] 4834         rts
   AA0B                    4835 LAA0B:
   AA0B 39            [ 5] 4836         rts
                           4837 
   AA0C                    4838 LAA0C:
   AA0C CC 48 37      [ 3] 4839         ldd     #0x4837         ;'H'
   AA0F                    4840 LAA0F:
   AA0F BD 8D B5      [ 6] 4841         jsr     L8DB5           ; display char here on LCD display
   AA12 39            [ 5] 4842         rts
                           4843 
   AA13                    4844 LAA13:
   AA13 CC 20 37      [ 3] 4845         ldd     #0x2037         ;' '
   AA16 20 F7         [ 3] 4846         bra     LAA0F
                           4847 
   AA18                    4848 LAA18:
   AA18 CC 42 0F      [ 3] 4849         ldd     #0x420F         ;'B'
   AA1B 20 F2         [ 3] 4850         bra     LAA0F
                           4851 
   AA1D                    4852 LAA1D:
   AA1D CC 20 0F      [ 3] 4853         ldd     #0x200F         ;' '
   AA20 20 ED         [ 3] 4854         bra     LAA0F
                           4855 
   AA22                    4856 LAA22: 
   AA22 7F 00 4F      [ 6] 4857         clr     (0x004F)
   AA25 CC 00 01      [ 3] 4858         ldd     #0x0001
   AA28 DD 1B         [ 4] 4859         std     CDTIMR1
   AA2A CE 20 00      [ 3] 4860         ldx     #0x2000
   AA2D                    4861 LAA2D:
   AA2D B6 10 A8      [ 4] 4862         ldaa    (0x10A8)
   AA30 84 01         [ 2] 4863         anda    #0x01
   AA32 27 F9         [ 3] 4864         beq     LAA2D  
   AA34 DC 1B         [ 4] 4865         ldd     CDTIMR1
   AA36 0F            [ 2] 4866         sei
   AA37 26 03         [ 3] 4867         bne     LAA3C  
   AA39 CE 20 00      [ 3] 4868         ldx     #0x2000
   AA3C                    4869 LAA3C:
   AA3C B6 10 A9      [ 4] 4870         ldaa    (0x10A9)
   AA3F A7 00         [ 4] 4871         staa    0,X     
   AA41 0E            [ 2] 4872         cli
   AA42 BD F9 6F      [ 6] 4873         jsr     SERIALW      
   AA45 08            [ 3] 4874         inx
   AA46 7F 00 4F      [ 6] 4875         clr     (0x004F)
   AA49 CC 00 01      [ 3] 4876         ldd     #0x0001
   AA4C DD 1B         [ 4] 4877         std     CDTIMR1
   AA4E 8C 20 23      [ 4] 4878         cpx     #0x2023
   AA51 26 DA         [ 3] 4879         bne     LAA2D  
   AA53 CE 20 00      [ 3] 4880         ldx     #0x2000
   AA56 7F 00 B7      [ 6] 4881         clr     (0x00B7)
   AA59                    4882 LAA59:
   AA59 A6 00         [ 4] 4883         ldaa    0,X     
   AA5B 9B B7         [ 3] 4884         adda    (0x00B7)
   AA5D 97 B7         [ 3] 4885         staa    (0x00B7)
   AA5F 08            [ 3] 4886         inx
   AA60 8C 20 22      [ 4] 4887         cpx     #0x2022
   AA63 25 F4         [ 3] 4888         bcs     LAA59  
   AA65 96 B7         [ 3] 4889         ldaa    (0x00B7)
   AA67 88 FF         [ 2] 4890         eora    #0xFF
   AA69 A1 00         [ 4] 4891         cmpa    0,X     
   AA6B CE 20 00      [ 3] 4892         ldx     #0x2000
   AA6E A6 20         [ 4] 4893         ldaa    0x20,X
   AA70 2B 03         [ 3] 4894         bmi     LAA75  
   AA72 7E AA 22      [ 3] 4895         jmp     LAA22
   AA75                    4896 LAA75:
   AA75 A6 00         [ 4] 4897         ldaa    0,X     
   AA77 B7 10 80      [ 4] 4898         staa    (0x1080)
   AA7A 08            [ 3] 4899         inx
   AA7B A6 00         [ 4] 4900         ldaa    0,X     
   AA7D B7 10 82      [ 4] 4901         staa    (0x1082)
   AA80 08            [ 3] 4902         inx
   AA81 A6 00         [ 4] 4903         ldaa    0,X     
   AA83 B7 10 84      [ 4] 4904         staa    (0x1084)
   AA86 08            [ 3] 4905         inx
   AA87 A6 00         [ 4] 4906         ldaa    0,X     
   AA89 B7 10 86      [ 4] 4907         staa    (0x1086)
   AA8C 08            [ 3] 4908         inx
   AA8D A6 00         [ 4] 4909         ldaa    0,X     
   AA8F B7 10 88      [ 4] 4910         staa    (0x1088)
   AA92 08            [ 3] 4911         inx
   AA93 A6 00         [ 4] 4912         ldaa    0,X     
   AA95 B7 10 8A      [ 4] 4913         staa    (0x108A)
   AA98 08            [ 3] 4914         inx
   AA99 A6 00         [ 4] 4915         ldaa    0,X     
   AA9B B7 10 8C      [ 4] 4916         staa    (0x108C)
   AA9E 08            [ 3] 4917         inx
   AA9F A6 00         [ 4] 4918         ldaa    0,X     
   AAA1 B7 10 8E      [ 4] 4919         staa    (0x108E)
   AAA4 08            [ 3] 4920         inx
   AAA5 A6 00         [ 4] 4921         ldaa    0,X     
   AAA7 B7 10 90      [ 4] 4922         staa    (0x1090)
   AAAA 08            [ 3] 4923         inx
   AAAB A6 00         [ 4] 4924         ldaa    0,X     
   AAAD B7 10 92      [ 4] 4925         staa    (0x1092)
   AAB0 08            [ 3] 4926         inx
   AAB1 A6 00         [ 4] 4927         ldaa    0,X     
   AAB3 8A 80         [ 2] 4928         oraa    #0x80
   AAB5 B7 10 94      [ 4] 4929         staa    (0x1094)
   AAB8 08            [ 3] 4930         inx
   AAB9 A6 00         [ 4] 4931         ldaa    0,X     
   AABB 8A 01         [ 2] 4932         oraa    #0x01
   AABD B7 10 96      [ 4] 4933         staa    (0x1096)
   AAC0 08            [ 3] 4934         inx
   AAC1 A6 00         [ 4] 4935         ldaa    0,X     
   AAC3 B7 10 98      [ 4] 4936         staa    (0x1098)
   AAC6 08            [ 3] 4937         inx
   AAC7 A6 00         [ 4] 4938         ldaa    0,X     
   AAC9 B7 10 9A      [ 4] 4939         staa    (0x109A)
   AACC 08            [ 3] 4940         inx
   AACD A6 00         [ 4] 4941         ldaa    0,X     
   AACF B7 10 9C      [ 4] 4942         staa    (0x109C)
   AAD2 08            [ 3] 4943         inx
   AAD3 A6 00         [ 4] 4944         ldaa    0,X     
   AAD5 B7 10 9E      [ 4] 4945         staa    (0x109E)
   AAD8 7E AA 22      [ 3] 4946         jmp     LAA22
                           4947 
   AADB                    4948 LAADB:
   AADB 7F 10 98      [ 6] 4949         clr     (0x1098)
   AADE 7F 10 9A      [ 6] 4950         clr     (0x109A)
   AAE1 7F 10 9C      [ 6] 4951         clr     (0x109C)
   AAE4 7F 10 9E      [ 6] 4952         clr     (0x109E)
   AAE7 39            [ 5] 4953         rts
   AAE8                    4954 LAAE8:
   AAE8 CE 04 2C      [ 3] 4955         ldx     #0x042C
   AAEB C6 10         [ 2] 4956         ldab    #0x10
   AAED                    4957 LAAED:
   AAED 5D            [ 2] 4958         tstb
   AAEE 27 12         [ 3] 4959         beq     LAB02  
   AAF0 A6 00         [ 4] 4960         ldaa    0,X     
   AAF2 81 30         [ 2] 4961         cmpa    #0x30
   AAF4 25 0D         [ 3] 4962         bcs     LAB03  
   AAF6 81 39         [ 2] 4963         cmpa    #0x39
   AAF8 22 09         [ 3] 4964         bhi     LAB03  
   AAFA 08            [ 3] 4965         inx
   AAFB 08            [ 3] 4966         inx
   AAFC 08            [ 3] 4967         inx
   AAFD 8C 04 59      [ 4] 4968         cpx     #0x0459
   AB00 23 EB         [ 3] 4969         bls     LAAED  
   AB02                    4970 LAB02:
   AB02 39            [ 5] 4971         rts
                           4972 
   AB03                    4973 LAB03:
   AB03 5A            [ 2] 4974         decb
   AB04 3C            [ 4] 4975         pshx
   AB05                    4976 LAB05:
   AB05 A6 03         [ 4] 4977         ldaa    3,X     
   AB07 A7 00         [ 4] 4978         staa    0,X     
   AB09 08            [ 3] 4979         inx
   AB0A 8C 04 5C      [ 4] 4980         cpx     #0x045C
   AB0D 25 F6         [ 3] 4981         bcs     LAB05  
   AB0F 86 FF         [ 2] 4982         ldaa    #0xFF
   AB11 B7 04 59      [ 4] 4983         staa    (0x0459)
   AB14 38            [ 5] 4984         pulx
   AB15 20 D6         [ 3] 4985         bra     LAAED
                           4986 
                           4987 ; erase revalid tape section in EEPROM
   AB17                    4988 LAB17:
   AB17 CE 04 2C      [ 3] 4989         ldx     #0x042C
   AB1A 86 FF         [ 2] 4990         ldaa    #0xFF
   AB1C                    4991 LAB1C:
   AB1C A7 00         [ 4] 4992         staa    0,X     
   AB1E 08            [ 3] 4993         inx
   AB1F 8C 04 5C      [ 4] 4994         cpx     #0x045C
   AB22 25 F8         [ 3] 4995         bcs     LAB1C
   AB24 39            [ 5] 4996         rts
                           4997 
   AB25                    4998 LAB25:
   AB25 CE 04 2C      [ 3] 4999         ldx     #0x042C
   AB28                    5000 LAB28:
   AB28 A6 00         [ 4] 5001         ldaa    0,X     
   AB2A 81 30         [ 2] 5002         cmpa    #0x30
   AB2C 25 17         [ 3] 5003         bcs     LAB45  
   AB2E 81 39         [ 2] 5004         cmpa    #0x39
   AB30 22 13         [ 3] 5005         bhi     LAB45  
   AB32 08            [ 3] 5006         inx
   AB33 08            [ 3] 5007         inx
   AB34 08            [ 3] 5008         inx
   AB35 8C 04 5C      [ 4] 5009         cpx     #0x045C
   AB38 25 EE         [ 3] 5010         bcs     LAB28  
   AB3A 86 FF         [ 2] 5011         ldaa    #0xFF
   AB3C B7 04 2C      [ 4] 5012         staa    (0x042C)
   AB3F BD AA E8      [ 6] 5013         jsr     LAAE8
   AB42 CE 04 59      [ 3] 5014         ldx     #0x0459
   AB45                    5015 LAB45:
   AB45 39            [ 5] 5016         rts
                           5017 
   AB46                    5018 LAB46:
   AB46 B6 02 99      [ 4] 5019         ldaa    (0x0299)
   AB49 A7 00         [ 4] 5020         staa    0,X     
   AB4B B6 02 9A      [ 4] 5021         ldaa    (0x029A)
   AB4E A7 01         [ 4] 5022         staa    1,X     
   AB50 B6 02 9B      [ 4] 5023         ldaa    (0x029B)
   AB53 A7 02         [ 4] 5024         staa    2,X     
   AB55 39            [ 5] 5025         rts
                           5026 
   AB56                    5027 LAB56:
   AB56 CE 04 2C      [ 3] 5028         ldx     #0x042C
   AB59                    5029 LAB59:
   AB59 B6 02 99      [ 4] 5030         ldaa    (0x0299)
   AB5C A1 00         [ 4] 5031         cmpa    0,X     
   AB5E 26 10         [ 3] 5032         bne     LAB70  
   AB60 B6 02 9A      [ 4] 5033         ldaa    (0x029A)
   AB63 A1 01         [ 4] 5034         cmpa    1,X     
   AB65 26 09         [ 3] 5035         bne     LAB70  
   AB67 B6 02 9B      [ 4] 5036         ldaa    (0x029B)
   AB6A A1 02         [ 4] 5037         cmpa    2,X     
   AB6C 26 02         [ 3] 5038         bne     LAB70  
   AB6E 20 0A         [ 3] 5039         bra     LAB7A  
   AB70                    5040 LAB70:
   AB70 08            [ 3] 5041         inx
   AB71 08            [ 3] 5042         inx
   AB72 08            [ 3] 5043         inx
   AB73 8C 04 5C      [ 4] 5044         cpx     #0x045C
   AB76 25 E1         [ 3] 5045         bcs     LAB59  
   AB78 0D            [ 2] 5046         sec
   AB79 39            [ 5] 5047         rts
                           5048 
   AB7A                    5049 LAB7A:
   AB7A 0C            [ 2] 5050         clc
   AB7B 39            [ 5] 5051         rts
                           5052 
                           5053 ;show re-valid tapes
   AB7C                    5054 LAB7C:
   AB7C CE 04 2C      [ 3] 5055         ldx     #0x042C
   AB7F                    5056 LAB7F:
   AB7F A6 00         [ 4] 5057         ldaa    0,X     
   AB81 81 30         [ 2] 5058         cmpa    #0x30
   AB83 25 1E         [ 3] 5059         bcs     LABA3  
   AB85 81 39         [ 2] 5060         cmpa    #0x39
   AB87 22 1A         [ 3] 5061         bhi     LABA3  
   AB89 BD F9 6F      [ 6] 5062         jsr     SERIALW      
   AB8C 08            [ 3] 5063         inx
   AB8D A6 00         [ 4] 5064         ldaa    0,X     
   AB8F BD F9 6F      [ 6] 5065         jsr     SERIALW      
   AB92 08            [ 3] 5066         inx
   AB93 A6 00         [ 4] 5067         ldaa    0,X     
   AB95 BD F9 6F      [ 6] 5068         jsr     SERIALW      
   AB98 08            [ 3] 5069         inx
   AB99 86 20         [ 2] 5070         ldaa    #0x20
   AB9B BD F9 6F      [ 6] 5071         jsr     SERIALW      
   AB9E 8C 04 5C      [ 4] 5072         cpx     #0x045C
   ABA1 25 DC         [ 3] 5073         bcs     LAB7F  
   ABA3                    5074 LABA3:
   ABA3 86 0D         [ 2] 5075         ldaa    #0x0D
   ABA5 BD F9 6F      [ 6] 5076         jsr     SERIALW      
   ABA8 86 0A         [ 2] 5077         ldaa    #0x0A
   ABAA BD F9 6F      [ 6] 5078         jsr     SERIALW      
   ABAD 39            [ 5] 5079         rts
                           5080 
   ABAE                    5081 LABAE:
   ABAE 7F 00 4A      [ 6] 5082         clr     (0x004A)
   ABB1 CC 00 64      [ 3] 5083         ldd     #0x0064
   ABB4 DD 23         [ 4] 5084         std     CDTIMR5
   ABB6                    5085 LABB6:
   ABB6 96 4A         [ 3] 5086         ldaa    (0x004A)
   ABB8 26 08         [ 3] 5087         bne     LABC2  
   ABBA BD 9B 19      [ 6] 5088         jsr     L9B19           ; do the random motions if enabled
   ABBD DC 23         [ 4] 5089         ldd     CDTIMR5
   ABBF 26 F5         [ 3] 5090         bne     LABB6  
   ABC1                    5091 LABC1:
   ABC1 39            [ 5] 5092         rts
                           5093 
   ABC2                    5094 LABC2:
   ABC2 81 31         [ 2] 5095         cmpa    #0x31
   ABC4 26 04         [ 3] 5096         bne     LABCA  
   ABC6 BD AB 17      [ 6] 5097         jsr     LAB17
   ABC9 39            [ 5] 5098         rts
                           5099 
   ABCA                    5100 LABCA:
   ABCA 20 F5         [ 3] 5101         bra     LABC1  
                           5102 
                           5103 ; TOC1 timer handler
                           5104 ;
                           5105 ; Timer is running at:
                           5106 ; EXTAL = 16Mhz
                           5107 ; E Clk = 4Mhz
                           5108 ; Timer Prescaler = /16 = 250Khz
                           5109 ; Timer Period = 4us
                           5110 ; T1OC is set to previous value +625
                           5111 ; So, this routine is called every 2.5ms
                           5112 ;
   ABCC                    5113 LABCC:
   ABCC DC 10         [ 4] 5114         ldd     T1NXT           ; get ready for next time
   ABCE C3 02 71      [ 4] 5115         addd    #0x0271         ; add 625
   ABD1 FD 10 16      [ 5] 5116         std     TOC1  
   ABD4 DD 10         [ 4] 5117         std     T1NXT
                           5118 
   ABD6 86 80         [ 2] 5119         ldaa    #0x80
   ABD8 B7 10 23      [ 4] 5120         staa    TFLG1           ; clear timer1 flag
                           5121 
                           5122 ; Some blinking SPECIAL button every half second,
                           5123 ; if 0x0078 is non zero
                           5124 
   ABDB 7D 00 78      [ 6] 5125         tst     (0x0078)        ; if 78 is zero, skip ahead
   ABDE 27 1C         [ 3] 5126         beq     LABFC           ; else do some blinking button lights
   ABE0 DC 25         [ 4] 5127         ldd     (0x0025)        ; else inc 25/26
   ABE2 C3 00 01      [ 4] 5128         addd    #0x0001
   ABE5 DD 25         [ 4] 5129         std     (0x0025)
   ABE7 1A 83 00 C8   [ 5] 5130         cpd     #0x00C8         ; is it 200?
   ABEB 26 0F         [ 3] 5131         bne     LABFC           ; no, keep going
   ABED 7F 00 25      [ 6] 5132         clr     (0x0025)        ; reset 25/26
   ABF0 7F 00 26      [ 6] 5133         clr     (0x0026)
   ABF3 D6 62         [ 3] 5134         ldab    (0x0062)        ; and toggle bit 3 of 62
   ABF5 C8 08         [ 2] 5135         eorb    #0x08
   ABF7 D7 62         [ 3] 5136         stab    (0x0062)
   ABF9 BD F9 C5      [ 6] 5137         jsr     BUTNLIT         ; and toggle the "special" button light
                           5138 
                           5139 ; 
   ABFC                    5140 LABFC:
   ABFC 7C 00 6F      [ 6] 5141         inc     (0x006F)        ; count every 2.5ms
   ABFF 96 6F         [ 3] 5142         ldaa    (0x006F)
   AC01 81 28         [ 2] 5143         cmpa    #0x28           ; is it 40 intervals? (0.1 sec?)
   AC03 25 42         [ 3] 5144         bcs     LAC47           ; if not yet, jump ahead
   AC05 7F 00 6F      [ 6] 5145         clr     (0x006F)        ; clear it 2.5ms counter
   AC08 7D 00 63      [ 6] 5146         tst     (0x0063)        ; decrement 0.1s counter here
   AC0B 27 03         [ 3] 5147         beq     LAC10           ; if it's not already zero
   AC0D 7A 00 63      [ 6] 5148         dec     (0x0063)
                           5149 
                           5150 ; staggered counters - here every 100ms
                           5151 
                           5152 ; 0x0070 counts from 250 to 1, period is 25 secs
   AC10                    5153 LAC10:
   AC10 96 70         [ 3] 5154         ldaa    OFFCNT1         ; decrement 0.1s counter here
   AC12 4A            [ 2] 5155         deca
   AC13 97 70         [ 3] 5156         staa    OFFCNT1
   AC15 26 04         [ 3] 5157         bne     LAC1B       
   AC17 86 FA         [ 2] 5158         ldaa    #0xFA           ; 250
   AC19 97 70         [ 3] 5159         staa    OFFCNT1
                           5160 
                           5161 ; 0x0071 counts from 230 to 1, period is 23 secs
   AC1B                    5162 LAC1B:
   AC1B 96 71         [ 3] 5163         ldaa    OFFCNT2
   AC1D 4A            [ 2] 5164         deca
   AC1E 97 71         [ 3] 5165         staa    OFFCNT2
   AC20 26 04         [ 3] 5166         bne     LAC26  
   AC22 86 E6         [ 2] 5167         ldaa    #0xE6           ; 230
   AC24 97 71         [ 3] 5168         staa    OFFCNT2
                           5169 
                           5170 ; 0x0072 counts from 210 to 1, period is 21 secs
   AC26                    5171 LAC26:
   AC26 96 72         [ 3] 5172         ldaa    OFFCNT3
   AC28 4A            [ 2] 5173         deca
   AC29 97 72         [ 3] 5174         staa    OFFCNT3
   AC2B 26 04         [ 3] 5175         bne     LAC31  
   AC2D 86 D2         [ 2] 5176         ldaa    #0xD2           ; 210
   AC2F 97 72         [ 3] 5177         staa    OFFCNT3
                           5178 
                           5179 ; 0x0073 counts from 190 to 1, period is 19 secs
   AC31                    5180 LAC31:
   AC31 96 73         [ 3] 5181         ldaa    OFFCNT4
   AC33 4A            [ 2] 5182         deca
   AC34 97 73         [ 3] 5183         staa    OFFCNT4
   AC36 26 04         [ 3] 5184         bne     LAC3C  
   AC38 86 BE         [ 2] 5185         ldaa    #0xBE           ; 190
   AC3A 97 73         [ 3] 5186         staa    OFFCNT4
                           5187 
                           5188 ; 0x0074 counts from 170 to 1, period is 17 secs
   AC3C                    5189 LAC3C:
   AC3C 96 74         [ 3] 5190         ldaa    OFFCNT5
   AC3E 4A            [ 2] 5191         deca
   AC3F 97 74         [ 3] 5192         staa    OFFCNT5
   AC41 26 04         [ 3] 5193         bne     LAC47  
   AC43 86 AA         [ 2] 5194         ldaa    #0xAA           ; 170
   AC45 97 74         [ 3] 5195         staa    OFFCNT5
                           5196 
                           5197 ; back to 2.5ms period here
                           5198 
   AC47                    5199 LAC47:
   AC47 96 27         [ 3] 5200         ldaa    T30MS
   AC49 4C            [ 2] 5201         inca
   AC4A 97 27         [ 3] 5202         staa    T30MS
   AC4C 81 0C         [ 2] 5203         cmpa    #0x0C           ; 12 = 30ms?
   AC4E 23 09         [ 3] 5204         bls     LAC59  
   AC50 7F 00 27      [ 6] 5205         clr     T30MS
                           5206 
                           5207 ; do these two tasks every 30ms
   AC53 BD 8E C6      [ 6] 5208         jsr     L8EC6           ; Scan SCD keys
   AC56 BD 8F 12      [ 6] 5209         jsr     L8F12           ; Scan Front Panel Switches
                           5210 
                           5211 ; back to every 2.5ms here
                           5212 ; LCD update???
                           5213 
   AC59                    5214 LAC59:
   AC59 96 43         [ 3] 5215         ldaa    (0x0043)
   AC5B 27 55         [ 3] 5216         beq     LACB2  
   AC5D DE 44         [ 4] 5217         ldx     (0x0044)
   AC5F A6 00         [ 4] 5218         ldaa    0,X     
   AC61 27 23         [ 3] 5219         beq     LAC86  
   AC63 B7 10 00      [ 4] 5220         staa    PORTA  
   AC66 B6 10 02      [ 4] 5221         ldaa    PORTG  
   AC69 84 F3         [ 2] 5222         anda    #0xF3
   AC6B B7 10 02      [ 4] 5223         staa    PORTG  
   AC6E 84 FD         [ 2] 5224         anda    #0xFD
   AC70 B7 10 02      [ 4] 5225         staa    PORTG  
   AC73 8A 02         [ 2] 5226         oraa    #0x02
   AC75 B7 10 02      [ 4] 5227         staa    PORTG  
   AC78 08            [ 3] 5228         inx
   AC79 08            [ 3] 5229         inx
   AC7A 8C 05 80      [ 4] 5230         cpx     #0x0580
   AC7D 25 03         [ 3] 5231         bcs     LAC82  
   AC7F CE 05 00      [ 3] 5232         ldx     #0x0500
   AC82                    5233 LAC82:
   AC82 DF 44         [ 4] 5234         stx     (0x0044)
   AC84 20 2C         [ 3] 5235         bra     LACB2  
   AC86                    5236 LAC86:
   AC86 A6 01         [ 4] 5237         ldaa    1,X     
   AC88 27 25         [ 3] 5238         beq     LACAF  
   AC8A B7 10 00      [ 4] 5239         staa    PORTA  
   AC8D B6 10 02      [ 4] 5240         ldaa    PORTG  
   AC90 84 FB         [ 2] 5241         anda    #0xFB
   AC92 8A 08         [ 2] 5242         oraa    #0x08
   AC94 B7 10 02      [ 4] 5243         staa    PORTG  
   AC97 84 FD         [ 2] 5244         anda    #0xFD
   AC99 B7 10 02      [ 4] 5245         staa    PORTG  
   AC9C 8A 02         [ 2] 5246         oraa    #0x02
   AC9E B7 10 02      [ 4] 5247         staa    PORTG  
   ACA1 08            [ 3] 5248         inx
   ACA2 08            [ 3] 5249         inx
   ACA3 8C 05 80      [ 4] 5250         cpx     #0x0580
   ACA6 25 03         [ 3] 5251         bcs     LACAB  
   ACA8 CE 05 00      [ 3] 5252         ldx     #0x0500
   ACAB                    5253 LACAB:
   ACAB DF 44         [ 4] 5254         stx     (0x0044)
   ACAD 20 03         [ 3] 5255         bra     LACB2  
   ACAF                    5256 LACAF:
   ACAF 7F 00 43      [ 6] 5257         clr     (0x0043)
                           5258 
                           5259 ; divide by 4
   ACB2                    5260 LACB2:
   ACB2 96 4F         [ 3] 5261         ldaa    (0x004F)
   ACB4 4C            [ 2] 5262         inca
   ACB5 97 4F         [ 3] 5263         staa    (0x004F)
   ACB7 81 04         [ 2] 5264         cmpa    #0x04
   ACB9 26 30         [ 3] 5265         bne     LACEB  
   ACBB 7F 00 4F      [ 6] 5266         clr     (0x004F)
                           5267 
                           5268 ; here every 10ms
                           5269 ; Five big countdown timers available here
                           5270 ; up to 655.35 seconds each
                           5271 
   ACBE DC 1B         [ 4] 5272         ldd     CDTIMR1         ; countdown 0x001B/1C every 10ms
   ACC0 27 05         [ 3] 5273         beq     LACC7           ; if not already 0
   ACC2 83 00 01      [ 4] 5274         subd    #0x0001
   ACC5 DD 1B         [ 4] 5275         std     CDTIMR1
                           5276 
   ACC7                    5277 LACC7:
   ACC7 DC 1D         [ 4] 5278         ldd     CDTIMR2         ; same with 0x001D/1E
   ACC9 27 05         [ 3] 5279         beq     LACD0  
   ACCB 83 00 01      [ 4] 5280         subd    #0x0001
   ACCE DD 1D         [ 4] 5281         std     CDTIMR2
                           5282 
   ACD0                    5283 LACD0:
   ACD0 DC 1F         [ 4] 5284         ldd     CDTIMR3         ; same with 0x001F/20
   ACD2 27 05         [ 3] 5285         beq     LACD9  
   ACD4 83 00 01      [ 4] 5286         subd    #0x0001
   ACD7 DD 1F         [ 4] 5287         std     CDTIMR3
                           5288 
   ACD9                    5289 LACD9:
   ACD9 DC 21         [ 4] 5290         ldd     CDTIMR4         ; same with 0x0021/22
   ACDB 27 05         [ 3] 5291         beq     LACE2  
   ACDD 83 00 01      [ 4] 5292         subd    #0x0001
   ACE0 DD 21         [ 4] 5293         std     CDTIMR4
                           5294 
   ACE2                    5295 LACE2:
   ACE2 DC 23         [ 4] 5296         ldd     CDTIMR5         ; same with 0x0023/24
   ACE4 27 05         [ 3] 5297         beq     LACEB  
   ACE6 83 00 01      [ 4] 5298         subd    #0x0001
   ACE9 DD 23         [ 4] 5299         std     CDTIMR5
                           5300 
                           5301 ; every other time through this, setup a task switch?
   ACEB                    5302 LACEB:
   ACEB 96 B0         [ 3] 5303         ldaa    (TSCNT)
   ACED 88 01         [ 2] 5304         eora    #0x01
   ACEF 97 B0         [ 3] 5305         staa    (TSCNT)
   ACF1 27 18         [ 3] 5306         beq     LAD0B  
                           5307 
   ACF3 BF 01 3C      [ 5] 5308         sts     (0x013C)        ; switch stacks???
   ACF6 BE 01 3E      [ 5] 5309         lds     (0x013E)
   ACF9 DC 10         [ 4] 5310         ldd     T1NXT
   ACFB 83 01 F4      [ 4] 5311         subd    #0x01F4         ; 625-500 = 125?
   ACFE FD 10 18      [ 5] 5312         std     TOC2            ; set this TOC2 to happen 0.5ms
   AD01 86 40         [ 2] 5313         ldaa    #0x40           ; after the current TOC1 but before the next TOC1
   AD03 B7 10 23      [ 4] 5314         staa    TFLG1           ; clear timer2 irq flag, just in case?
   AD06 86 C0         [ 2] 5315         ldaa    #0xC0           ;
   AD08 B7 10 22      [ 4] 5316         staa    TMSK1           ; enable TOC1 and TOC2
   AD0B                    5317 LAD0B:
   AD0B 3B            [12] 5318         rti
                           5319 
                           5320 ; TOC2 Timer handler and SWI handler
   AD0C                    5321 LAD0C:
   AD0C 86 40         [ 2] 5322         ldaa    #0x40
   AD0E B7 10 23      [ 4] 5323         staa    TFLG1           ; clear timer2 flag
   AD11 BF 01 3E      [ 5] 5324         sts     (0x013E)        ; switch stacks back???
   AD14 BE 01 3C      [ 5] 5325         lds     (0x013C)
   AD17 86 80         [ 2] 5326         ldaa    #0x80
   AD19 B7 10 22      [ 4] 5327         staa    TMSK1           ; enable TOC1 only
   AD1C 3B            [12] 5328         rti
                           5329 
                           5330 ; Secondary task??
                           5331 
   AD1D                    5332 TASK2:
   AD1D 7D 04 2A      [ 6] 5333         tst     (0x042A)
   AD20 27 35         [ 3] 5334         beq     LAD57
   AD22 96 B6         [ 3] 5335         ldaa    (0x00B6)
   AD24 26 03         [ 3] 5336         bne     LAD29
   AD26 3F            [14] 5337         swi
   AD27 20 F4         [ 3] 5338         bra     TASK2
   AD29                    5339 LAD29:
   AD29 7F 00 B6      [ 6] 5340         clr     (0x00B6)
   AD2C C6 04         [ 2] 5341         ldab    #0x04
   AD2E                    5342 LAD2E:
   AD2E 37            [ 3] 5343         pshb
   AD2F CE AD 3C      [ 3] 5344         ldx     #LAD3C
   AD32 BD 8A 1A      [ 6] 5345         jsr     L8A1A  
   AD35 3F            [14] 5346         swi
   AD36 33            [ 4] 5347         pulb
   AD37 5A            [ 2] 5348         decb
   AD38 26 F4         [ 3] 5349         bne     LAD2E  
   AD3A 20 E1         [ 3] 5350         bra     TASK2
                           5351 
   AD3C                    5352 LAD3C:
   AD3C 53 31 00           5353         .asciz     'S1'
                           5354 
   AD3F FC 02 9C      [ 5] 5355         ldd     (0x029C)
   AD42 1A 83 00 01   [ 5] 5356         cpd     #0x0001         ; 1
   AD46 27 0C         [ 3] 5357         beq     LAD54  
   AD48 1A 83 03 E8   [ 5] 5358         cpd     #0x03E8         ; 1000
   AD4C 2D 09         [ 3] 5359         blt     LAD57  
   AD4E 1A 83 04 4B   [ 5] 5360         cpd     #0x044B         ; 1099
   AD52 22 03         [ 3] 5361         bhi     LAD57  
   AD54                    5362 LAD54:
   AD54 3F            [14] 5363         swi
   AD55 20 C6         [ 3] 5364         bra     TASK2
   AD57                    5365 LAD57:
   AD57 7F 00 B3      [ 6] 5366         clr     (0x00B3)
   AD5A BD AD 7E      [ 6] 5367         jsr     LAD7E
   AD5D BD AD A0      [ 6] 5368         jsr     LADA0
   AD60 25 BB         [ 3] 5369         bcs     TASK2
   AD62 C6 0A         [ 2] 5370         ldab    #0x0A
   AD64 BD AE 13      [ 6] 5371         jsr     LAE13
   AD67 BD AD AE      [ 6] 5372         jsr     LADAE
   AD6A 25 B1         [ 3] 5373         bcs     TASK2
   AD6C C6 14         [ 2] 5374         ldab    #0x14
   AD6E BD AE 13      [ 6] 5375         jsr     LAE13
   AD71 BD AD B6      [ 6] 5376         jsr     LADB6
   AD74 25 A7         [ 3] 5377         bcs     TASK2
   AD76                    5378 LAD76:
   AD76 BD AD B8      [ 6] 5379         jsr     LADB8
   AD79 0D            [ 2] 5380         sec
   AD7A 25 A1         [ 3] 5381         bcs     TASK2
   AD7C 20 F8         [ 3] 5382         bra     LAD76
   AD7E                    5383 LAD7E:
   AD7E CE AE 1E      [ 3] 5384         ldx     #LAE1E          ;+++
   AD81 BD 8A 1A      [ 6] 5385         jsr     L8A1A  
   AD84 C6 1E         [ 2] 5386         ldab    #0x1E
   AD86 BD AE 13      [ 6] 5387         jsr     LAE13
   AD89 CE AE 22      [ 3] 5388         ldx     #LAE22          ;ATH
   AD8C BD 8A 1A      [ 6] 5389         jsr     L8A1A  
   AD8F C6 1E         [ 2] 5390         ldab    #0x1E
   AD91 BD AE 13      [ 6] 5391         jsr     LAE13
   AD94 CE AE 27      [ 3] 5392         ldx     #LAE27          ;ATZ
   AD97 BD 8A 1A      [ 6] 5393         jsr     L8A1A  
   AD9A C6 1E         [ 2] 5394         ldab    #0x1E
   AD9C BD AE 13      [ 6] 5395         jsr     LAE13
   AD9F 39            [ 5] 5396         rts
   ADA0                    5397 LADA0:
   ADA0 BD B1 DD      [ 6] 5398         jsr     LB1DD
   ADA3 25 FB         [ 3] 5399         bcs     LADA0  
   ADA5 BD B2 4F      [ 6] 5400         jsr     LB24F
                           5401 
   ADA8 52 49 4E 47 00     5402         .asciz  'RING'
                           5403 
   ADAD 39            [ 5] 5404         rts
                           5405 
   ADAE                    5406 LADAE:
   ADAE CE AE 2C      [ 3] 5407         ldx     #LAE2C
   ADB1 BD 8A 1A      [ 6] 5408         jsr     L8A1A           ;ATA
   ADB4 0C            [ 2] 5409         clc
   ADB5 39            [ 5] 5410         rts
   ADB6                    5411 LADB6:
   ADB6 0C            [ 2] 5412         clc
   ADB7 39            [ 5] 5413         rts
                           5414 
   ADB8                    5415 LADB8:
   ADB8 BD B1 D2      [ 6] 5416         jsr     LB1D2
   ADBB BD AE 31      [ 6] 5417         jsr     LAE31
   ADBE 86 01         [ 2] 5418         ldaa    #0x01
   ADC0 97 B3         [ 3] 5419         staa    (0x00B3)
   ADC2 BD B1 DD      [ 6] 5420         jsr     LB1DD
   ADC5 BD B2 71      [ 6] 5421         jsr     LB271
   ADC8 36            [ 3] 5422         psha
   ADC9 BD B2 C0      [ 6] 5423         jsr     LB2C0
   ADCC 32            [ 4] 5424         pula
   ADCD 81 01         [ 2] 5425         cmpa    #0x01
   ADCF 26 08         [ 3] 5426         bne     LADD9  
   ADD1 CE B2 95      [ 3] 5427         ldx     #LB295
   ADD4 BD 8A 1A      [ 6] 5428         jsr     L8A1A           ;'You have selected #1'
   ADD7 20 31         [ 3] 5429         bra     LAE0A  
   ADD9                    5430 LADD9:
   ADD9 81 02         [ 2] 5431         cmpa    #0x02
   ADDB 26 00         [ 3] 5432         bne     LADDD  
   ADDD                    5433 LADDD:
   ADDD 81 03         [ 2] 5434         cmpa    #0x03
   ADDF 26 00         [ 3] 5435         bne     LADE1  
   ADE1                    5436 LADE1:
   ADE1 81 04         [ 2] 5437         cmpa    #0x04
   ADE3 26 00         [ 3] 5438         bne     LADE5  
   ADE5                    5439 LADE5:
   ADE5 81 05         [ 2] 5440         cmpa    #0x05
   ADE7 26 00         [ 3] 5441         bne     LADE9  
   ADE9                    5442 LADE9:
   ADE9 81 06         [ 2] 5443         cmpa    #0x06
   ADEB 26 00         [ 3] 5444         bne     LADED  
   ADED                    5445 LADED:
   ADED 81 07         [ 2] 5446         cmpa    #0x07
   ADEF 26 00         [ 3] 5447         bne     LADF1  
   ADF1                    5448 LADF1:
   ADF1 81 08         [ 2] 5449         cmpa    #0x08
   ADF3 26 00         [ 3] 5450         bne     LADF5  
   ADF5                    5451 LADF5:
   ADF5 81 09         [ 2] 5452         cmpa    #0x09
   ADF7 26 00         [ 3] 5453         bne     LADF9  
   ADF9                    5454 LADF9:
   ADF9 81 0A         [ 2] 5455         cmpa    #0x0A
   ADFB 26 00         [ 3] 5456         bne     LADFD  
   ADFD                    5457 LADFD:
   ADFD 81 0B         [ 2] 5458         cmpa    #0x0B
   ADFF 26 09         [ 3] 5459         bne     LAE0A  
   AE01 CE B2 AA      [ 3] 5460         ldx     #LB2AA          ;'You have selected #11'
   AE04 BD 8A 1A      [ 6] 5461         jsr     L8A1A  
   AE07 7E AE 0A      [ 3] 5462         jmp     LAE0A
   AE0A                    5463 LAE0A:
   AE0A C6 14         [ 2] 5464         ldab    #0x14
   AE0C BD AE 13      [ 6] 5465         jsr     LAE13
   AE0F 7F 00 B3      [ 6] 5466         clr     (0x00B3)
   AE12 39            [ 5] 5467         rts
                           5468 
   AE13                    5469 LAE13:
   AE13 CE 00 20      [ 3] 5470         ldx     #0x0020
   AE16                    5471 LAE16:
   AE16 3F            [14] 5472         swi
   AE17 09            [ 3] 5473         dex
   AE18 26 FC         [ 3] 5474         bne     LAE16  
   AE1A 5A            [ 2] 5475         decb
   AE1B 26 F6         [ 3] 5476         bne     LAE13  
   AE1D 39            [ 5] 5477         rts
                           5478 
                           5479 ; text??
   AE1E                    5480 LAE1E:
   AE1E 2B 2B 2B 00        5481         .asciz      '+++'
   AE22                    5482 LAE22:
   AE22 41 54 48 0D 00     5483         .asciz      'ATH\r'
   AE27                    5484 LAE27:
   AE27 41 54 5A 0D 00     5485         .asciz      'ATZ\r'
   AE2C                    5486 LAE2C:
   AE2C 41 54 41 0D 00     5487         .asciz      'ATA\r'
                           5488 
   AE31                    5489 LAE31:
   AE31 CE AE 38      [ 3] 5490         ldx     #LAE38          ; big long string of stats, with compressed ansi codes
   AE34 BD 8A 1A      [ 6] 5491         jsr     L8A1A  
   AE37 39            [ 5] 5492         rts
                           5493 
   AE38                    5494 LAE38:
   AE38 5E 30 31 30 31 53  5495         .ascii  "^0101Serial #:^0140#0000^0111~4"
        65 72 69 61 6C 20
        23 3A 5E 30 31 34
        30 23 30 30 30 30
        5E 30 31 31 31 7E
        34
   AE57 0E 20              5496         .byte   0x0E,0x20
   AE59 5E 30 31 34 31 7C  5497         .ascii  "^0141|"
   AE5F 04 28              5498         .byte   0x04,0x28
   AE61 5E 30 33 30 31 43  5499         .ascii  "^0301CURRENT^0340HISTORY^0501Show Status:^0540Total # reg. shows:^0601Random Status:^0570|"
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
   AEBB 04 10              5500         .byte   0x04,0x10
   AEBD 5E 30 36 34 30 54  5501         .ascii  "^0640Total # live shows:^0701Current Reg Tape #:^0670|"
        6F 74 61 6C 20 23
        20 6C 69 76 65 20
        73 68 6F 77 73 3A
        5E 30 37 30 31 43
        75 72 72 65 6E 74
        20 52 65 67 20 54
        61 70 65 20 23 3A
        5E 30 36 37 30 7C
   AEF3 04 12              5502         .byte   0x04,0x12
   AEF5 5E 30 37 33 30 7E  5503         .ascii  "^0730~3"
        33
   AEFC 04 02              5504         .byte   0x04,0x02
   AEFE 5E 30 37 34 30 54  5505         .ascii  "^0740Total # failed pswd attempts:^0801Current Live Tape #:^0770|"
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
   AF3F 04 14              5506         .byte   0x04,0x14
   AF41 5E 30 38 33 30 7E  5507         .ascii  "^0830~3"
        33
   AF48 04 05              5508         .byte   0x04,0x05
   AF4A 5E 30 38 34 30 54  5509         .ascii  "^0840Total # successful pswd:^0901Current Version #:^0870|"
        6F 74 61 6C 20 23
        20 73 75 63 63 65
        73 73 66 75 6C 20
        70 73 77 64 3A 5E
        30 39 30 31 43 75
        72 72 65 6E 74 20
        56 65 72 73 69 6F
        6E 20 23 3A 5E 30
        38 37 30 7C
   AF84 04 16              5510         .byte   0x04,0x16
   AF86 5E 30 39 33 30 40  5511         .ascii  "^0930@"
   AF8C 04 00              5512         .byte   0x04,0x00
   AF8E 5E 30 39 34 30 54  5513         .ascii  "^0940Total # bdays played:^1040Total # VCR adjusts:^0970|"
        6F 74 61 6C 20 23
        20 62 64 61 79 73
        20 70 6C 61 79 65
        64 3A 5E 31 30 34
        30 54 6F 74 61 6C
        20 23 20 56 43 52
        20 61 64 6A 75 73
        74 73 3A 5E 30 39
        37 30 7C
   AFC7 04 18              5514         .byte   0x04,0x18
   AFC9 5E 31 30 37 30 7C  5515         .ascii  "^1070|"
   AFCF 04 1A              5516         .byte   0x04,0x1A
   AFD1 5E 31 31 34 30 54  5517         .ascii  "^1140Total # remote accesses:^1240Total # access attempts:^1170|"
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
   B011 04 1C              5518         .byte   0x04,0x1C
   B013 5E 31 32 37 30 7C  5519         .ascii  "^1270|"
   B019 04 1E              5520         .byte   0x04,0x1E
   B01B 5E 31 33 34 30 54  5521         .ascii  "^1340Total # rejected showtapes:^1440Total # Short bdays:^1370|"
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
   B05A 04 20              5522         .byte   0x04,0x20
   B05C 5E 31 34 37 30 7C  5523         .ascii  "^1470|"
   B062 04 22              5524         .byte   0x04,0x22
   B064 5E 31 35 34 30 54  5525         .ascii  "^1540Total # Reg bdays:^1640Total # resets-pwr ups:^1570|"
        6F 74 61 6C 20 23
        20 52 65 67 20 62
        64 61 79 73 3A 5E
        31 36 34 30 54 6F
        74 61 6C 20 23 20
        72 65 73 65 74 73
        2D 70 77 72 20 75
        70 73 3A 5E 31 35
        37 30 7C
   B09D 04 24              5526         .byte   0x04,0x24
   B09F 5E 31 36 37 30 7C  5527         .ascii  "^1670|"
   B0A5 04 26              5528         .byte   0x04,0x26
   B0A7 5E 31 38 30 31 46  5529         .ascii  "^1801FUNCTIONS^1823Select Function:^20011.Clear rnd enables^2028 6.Set loc name-#^205411.Diagnostics^21012.Set rnd enables^2128 7.Set Time^215412.^22013.Set reg tape #^2228 8.Disbl-enbl show^225413.^23014.Set liv tape #^2328 9.Upload program^235414.^24015.Reset history^242810.Debugger^245415.^1840"
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
   B1D1 00                 5530         .byte   0x00
                           5531 
   B1D2                    5532 LB1D2:
   B1D2 CE B1 D8      [ 3] 5533         ldx     #LB1D8          ; escape sequence?
   B1D5 7E 8A 1A      [ 3] 5534         jmp     L8A1A  
                           5535 
                           5536 ; ANSI control sequence - Clear Screen and Home Cursor
   B1D8                    5537 LB1D8:
                           5538         ; esc[2J
   B1D8 1B                 5539         .byte   0x1b
   B1D9 5B 32 4A 00        5540         .asciz  '[2J'
                           5541 
   B1DD                    5542 LB1DD:
   B1DD CE 05 A0      [ 3] 5543         ldx     #0x05A0
   B1E0 CC 00 00      [ 3] 5544         ldd     #0x0000
   B1E3 FD 02 9E      [ 5] 5545         std     (0x029E)
   B1E6                    5546 LB1E6:
   B1E6 FC 02 9E      [ 5] 5547         ldd     (0x029E)
   B1E9 C3 00 01      [ 4] 5548         addd    #0x0001
   B1EC FD 02 9E      [ 5] 5549         std     (0x029E)
   B1EF 1A 83 0F A0   [ 5] 5550         cpd     #0x0FA0
   B1F3 24 28         [ 3] 5551         bcc     LB21D  
   B1F5 BD B2 23      [ 6] 5552         jsr     LB223
   B1F8 25 04         [ 3] 5553         bcs     LB1FE  
   B1FA 3F            [14] 5554         swi
   B1FB 20 E9         [ 3] 5555         bra     LB1E6  
   B1FD 39            [ 5] 5556         rts
                           5557 
   B1FE                    5558 LB1FE:
   B1FE A7 00         [ 4] 5559         staa    0,X     
   B200 08            [ 3] 5560         inx
   B201 81 0D         [ 2] 5561         cmpa    #0x0D
   B203 26 02         [ 3] 5562         bne     LB207  
   B205 20 18         [ 3] 5563         bra     LB21F  
   B207                    5564 LB207:
   B207 81 1B         [ 2] 5565         cmpa    #0x1B
   B209 26 02         [ 3] 5566         bne     LB20D  
   B20B 20 10         [ 3] 5567         bra     LB21D  
   B20D                    5568 LB20D:
   B20D 7D 00 B3      [ 6] 5569         tst     (0x00B3)
   B210 27 03         [ 3] 5570         beq     LB215  
   B212 BD 8B 3B      [ 6] 5571         jsr     L8B3B
   B215                    5572 LB215:
   B215 CC 00 00      [ 3] 5573         ldd     #0x0000
   B218 FD 02 9E      [ 5] 5574         std     (0x029E)
   B21B 20 C9         [ 3] 5575         bra     LB1E6  
   B21D                    5576 LB21D:
   B21D 0D            [ 2] 5577         sec
   B21E 39            [ 5] 5578         rts
                           5579 
   B21F                    5580 LB21F:
   B21F 6F 00         [ 6] 5581         clr     0,X     
   B221 0C            [ 2] 5582         clc
   B222 39            [ 5] 5583         rts
                           5584 
   B223                    5585 LB223:
   B223 B6 18 0D      [ 4] 5586         ldaa    SCCCTRLA
   B226 44            [ 2] 5587         lsra
   B227 25 0B         [ 3] 5588         bcs     LB234  
   B229 4F            [ 2] 5589         clra
   B22A B7 18 0D      [ 4] 5590         staa    SCCCTRLA
   B22D 86 30         [ 2] 5591         ldaa    #0x30
   B22F B7 18 0D      [ 4] 5592         staa    SCCCTRLA
   B232 0C            [ 2] 5593         clc
   B233 39            [ 5] 5594         rts
                           5595 
   B234                    5596 LB234:
   B234 86 01         [ 2] 5597         ldaa    #0x01
   B236 B7 18 0D      [ 4] 5598         staa    SCCCTRLA
   B239 86 70         [ 2] 5599         ldaa    #0x70
   B23B B5 18 0D      [ 4] 5600         bita    SCCCTRLA
   B23E 26 05         [ 3] 5601         bne     LB245  
   B240 0D            [ 2] 5602         sec
   B241 B6 18 0F      [ 4] 5603         ldaa    SCCDATAA
   B244 39            [ 5] 5604         rts
                           5605 
   B245                    5606 LB245:
   B245 B6 18 0F      [ 4] 5607         ldaa    SCCDATAA
   B248 86 30         [ 2] 5608         ldaa    #0x30
   B24A B7 18 0C      [ 4] 5609         staa    SCCCTRLB
   B24D 0C            [ 2] 5610         clc
   B24E 39            [ 5] 5611         rts
                           5612 
   B24F                    5613 LB24F:
   B24F 38            [ 5] 5614         pulx
   B250 18 CE 05 A0   [ 4] 5615         ldy     #0x05A0
   B254                    5616 LB254:
   B254 A6 00         [ 4] 5617         ldaa    0,X
   B256 27 11         [ 3] 5618         beq     LB269
   B258 08            [ 3] 5619         inx
   B259 18 A1 00      [ 5] 5620         cmpa    0,Y
   B25C 26 04         [ 3] 5621         bne     LB262
   B25E 18 08         [ 4] 5622         iny
   B260 20 F2         [ 3] 5623         bra     LB254
   B262                    5624 LB262:
   B262 A6 00         [ 4] 5625         ldaa    0,X
   B264 27 07         [ 3] 5626         beq     LB26D
   B266 08            [ 3] 5627         inx
   B267 20 F9         [ 3] 5628         bra     LB262
   B269                    5629 LB269:
   B269 08            [ 3] 5630         inx
   B26A 3C            [ 4] 5631         pshx
   B26B 0C            [ 2] 5632         clc
   B26C 39            [ 5] 5633         rts
   B26D                    5634 LB26D:
   B26D 08            [ 3] 5635         inx
   B26E 3C            [ 4] 5636         pshx
   B26F 0D            [ 2] 5637         sec
   B270 39            [ 5] 5638         rts
                           5639 
   B271                    5640 LB271:
   B271 CE 05 A0      [ 3] 5641         ldx     #0x05A0
   B274                    5642 LB274:
   B274 A6 00         [ 4] 5643         ldaa    0,X
   B276 08            [ 3] 5644         inx
   B277 81 0D         [ 2] 5645         cmpa    #0x0D
   B279 26 F9         [ 3] 5646         bne     LB274
   B27B 09            [ 3] 5647         dex
   B27C 09            [ 3] 5648         dex
   B27D A6 00         [ 4] 5649         ldaa    0,X
   B27F 09            [ 3] 5650         dex
   B280 80 30         [ 2] 5651         suba    #0x30
   B282 97 B2         [ 3] 5652         staa    (0x00B2)
   B284 8C 05 9F      [ 4] 5653         cpx     #0x059F
   B287 27 0B         [ 3] 5654         beq     LB294
   B289 A6 00         [ 4] 5655         ldaa    0,X
   B28B 09            [ 3] 5656         dex
   B28C 80 30         [ 2] 5657         suba    #0x30
   B28E C6 0A         [ 2] 5658         ldab    #0x0A
   B290 3D            [10] 5659         mul
   B291 17            [ 2] 5660         tba
   B292 9B B2         [ 3] 5661         adda    (0x00B2)
   B294                    5662 LB294:
   B294 39            [ 5] 5663         rts
                           5664 
   B295                    5665 LB295:
   B295 59 6F 75 20 68 61  5666         .asciz  'You have selected #1'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 00
   B2AA                    5667 LB2AA:
   B2AA 59 6F 75 20 68 61  5668         .asciz  'You have selected #11'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 31 00
                           5669 
   B2C0                    5670 LB2C0:
   B2C0 CE B2 C7      [ 3] 5671         ldx     #LB2C7          ; Table with compressed ANSI cursor controls
   B2C3 BD 8A 1A      [ 6] 5672         jsr     L8A1A  
   B2C6 39            [ 5] 5673         rts
                           5674 
   B2C7                    5675 LB2C7:
   B2C7 5E 32 30 30 31 25  5676         .asciz  "^2001%^2101%^2201%^2301%^2401%^2001"
        5E 32 31 30 31 25
        5E 32 32 30 31 25
        5E 32 33 30 31 25
        5E 32 34 30 31 25
        5E 32 30 30 31 00
                           5677 
                           5678 ; Random movement tables
                           5679 
                           5680 ; board 1
   B2EB                    5681 LB2EB:
   B2EB FA 20 FA 20 F6 22  5682         .byte   0xfa,0x20,0xfa,0x20,0xf6,0x22,0xf5,0x20
        F5 20
   B2F3 F5 20 F3 22 F2 20  5683         .byte   0xf5,0x20,0xf3,0x22,0xf2,0x20,0xe5,0x22
        E5 22
   B2FB E5 22 E2 20 D2 20  5684         .byte   0xe5,0x22,0xe2,0x20,0xd2,0x20,0xbe,0x00
        BE 00
   B303 BC 22 BB 30 B9 32  5685         .byte   0xbc,0x22,0xbb,0x30,0xb9,0x32,0xb9,0x32
        B9 32
   B30B B7 30 B6 32 B5 30  5686         .byte   0xb7,0x30,0xb6,0x32,0xb5,0x30,0xb4,0x32
        B4 32
   B313 B4 32 B3 20 B3 20  5687         .byte   0xb4,0x32,0xb3,0x20,0xb3,0x20,0xb1,0xa0
        B1 A0
   B31B B1 A0 B0 A2 AF A0  5688         .byte   0xb1,0xa0,0xb0,0xa2,0xaf,0xa0,0xaf,0xa6
        AF A6
   B323 AE A0 AE A6 AD A4  5689         .byte   0xae,0xa0,0xae,0xa6,0xad,0xa4,0xac,0xa0
        AC A0
   B32B AC A0 AB A0 AA A0  5690         .byte   0xac,0xa0,0xab,0xa0,0xaa,0xa0,0xaa,0xa0
        AA A0
   B333 A2 80 A0 A0 A0 A0  5691         .byte   0xa2,0x80,0xa0,0xa0,0xa0,0xa0,0x8d,0x80
        8D 80
   B33B 8A A0 7E 80 7B A0  5692         .byte   0x8a,0xa0,0x7e,0x80,0x7b,0xa0,0x79,0xa4
        79 A4
   B343 78 A0 77 A4 76 A0  5693         .byte   0x78,0xa0,0x77,0xa4,0x76,0xa0,0x75,0xa4
        75 A4
   B34B 74 A0 73 A4 72 A0  5694         .byte   0x74,0xa0,0x73,0xa4,0x72,0xa0,0x71,0xa4
        71 A4
   B353 70 A0 6F A4 6E A0  5695         .byte   0x70,0xa0,0x6f,0xa4,0x6e,0xa0,0x6d,0xa4
        6D A4
   B35B 6C A0 69 80 69 80  5696         .byte   0x6c,0xa0,0x69,0x80,0x69,0x80,0x67,0xa0
        67 A0
   B363 5E 20 58 24 57 20  5697         .byte   0x5e,0x20,0x58,0x24,0x57,0x20,0x57,0x20
        57 20
   B36B 56 24 55 20 54 24  5698         .byte   0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24
        54 24
   B373 53 20 52 24 52 24  5699         .byte   0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20
        50 20
   B37B 4F 24 4E 20 4D 24  5700         .byte   0x4f,0x24,0x4e,0x20,0x4d,0x24,0x4c,0x20
        4C 20
   B383 4C 20 4B 24 4A 20  5701         .byte   0x4c,0x20,0x4b,0x24,0x4a,0x20,0x49,0x20
        49 20
   B38B 49 00 48 20 47 20  5702         .byte   0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20
        47 20
   B393 46 20 45 24 45 24  5703         .byte   0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20
        44 20
   B39B 42 20 42 20 37 04  5704         .byte   0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20
        35 20
   B3A3 2E 04 2E 04 2D 20  5705         .byte   0x2e,0x04,0x2e,0x04,0x2d,0x20,0x23,0x24
        23 24
   B3AB 21 20 17 24 13 00  5706         .byte   0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24
        11 24
   B3B3 10 30 07 34 06 30  5707         .byte   0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30
        05 30
   B3BB FF FF              5708         .byte   0xff,0xff
                           5709 
                           5710 ; board 2
   B3BD                    5711 LB3BD:
   B3BD D7 22 D5 20 C9 22  5712         .byte   0xd7,0x22,0xd5,0x20,0xc9,0x22,0xc7,0x20
        C7 20
   B3C5 C4 24 C3 20 C2 24  5713         .byte   0xc4,0x24,0xc3,0x20,0xc2,0x24,0xc1,0x20
        C1 20
   B3CD BF 24 BF 24 BE 20  5714         .byte   0xbf,0x24,0xbf,0x24,0xbe,0x20,0xbd,0x24
        BD 24
   B3D5 BC 20 BB 24 BA 20  5715         .byte   0xbc,0x20,0xbb,0x24,0xba,0x20,0xb9,0x20
        B9 20
   B3DD B8 24 B7 20 B4 00  5716         .byte   0xb8,0x24,0xb7,0x20,0xb4,0x00,0xb4,0x00
        B4 00
   B3E5 B2 20 A9 20 A3 20  5717         .byte   0xb2,0x20,0xa9,0x20,0xa3,0x20,0xa2,0x20
        A2 20
   B3ED A1 20 A0 20 A0 20  5718         .byte   0xa1,0x20,0xa0,0x20,0xa0,0x20,0x9f,0x20
        9F 20
   B3F5 9F 20 9E 20 9D 24  5719         .byte   0x9f,0x20,0x9e,0x20,0x9d,0x24,0x9d,0x24
        9D 24
   B3FD 9B 20 9A 24 99 20  5720         .byte   0x9b,0x20,0x9a,0x24,0x99,0x20,0x98,0x20
        98 20
   B405 97 24 97 24 95 20  5721         .byte   0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20
        95 20
   B40D 94 00 94 00 93 20  5722         .byte   0x94,0x00,0x94,0x00,0x93,0x20,0x92,0x00
        92 00
   B415 92 00 91 20 90 20  5723         .byte   0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20
        90 20
   B41D 8F 20 8D 20 8D 20  5724         .byte   0x8f,0x20,0x8d,0x20,0x8d,0x20,0x81,0x00
        81 00
   B425 7F 20 79 00 79 00  5725         .byte   0x7f,0x20,0x79,0x00,0x79,0x00,0x78,0x20
        78 20
   B42D 76 20 6B 00 69 20  5726         .byte   0x76,0x20,0x6b,0x00,0x69,0x20,0x5e,0x00
        5E 00
   B435 5C 20 5B 30 52 10  5727         .byte   0x5c,0x20,0x5b,0x30,0x52,0x10,0x51,0x30
        51 30
   B43D 50 30 50 30 4F 20  5728         .byte   0x50,0x30,0x50,0x30,0x4f,0x20,0x4e,0x20
        4E 20
   B445 4E 20 4D 20 46 A0  5729         .byte   0x4e,0x20,0x4d,0x20,0x46,0xa0,0x45,0xa0
        45 A0
   B44D 3D A0 3D A0 39 20  5730         .byte   0x3d,0xa0,0x3d,0xa0,0x39,0x20,0x2a,0x00
        2A 00
   B455 28 20 1E 00 1C 22  5731         .byte   0x28,0x20,0x1e,0x00,0x1c,0x22,0x1c,0x22
        1C 22
   B45D 1B 20 1A 22 19 20  5732         .byte   0x1b,0x20,0x1a,0x22,0x19,0x20,0x18,0x22
        18 22
   B465 18 22 16 20 15 22  5733         .byte   0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22
        15 22
   B46D 14 A0 13 A2 11 A0  5734         .byte   0x14,0xa0,0x13,0xa2,0x11,0xa0,0xff,0xff
        FF FF
                           5735 
                           5736 ; board 4
   B475                    5737 LB475:
   B475 BE 00 BC 22 BB 30  5738         .byte   0xbe,0x00,0xbc,0x22,0xbb,0x30,0xb9,0x32
        B9 32
   B47D B9 32 B7 30 B6 32  5739         .byte   0xb9,0x32,0xb7,0x30,0xb6,0x32,0xb5,0x30
        B5 30
   B485 B4 32 B4 32 B3 20  5740         .byte   0xb4,0x32,0xb4,0x32,0xb3,0x20,0xb3,0x20
        B3 20
   B48D B1 A0 B1 A0 B0 A2  5741         .byte   0xb1,0xa0,0xb1,0xa0,0xb0,0xa2,0xaf,0xa0
        AF A0
   B495 AF A6 AE A0 AE A6  5742         .byte   0xaf,0xa6,0xae,0xa0,0xae,0xa6,0xad,0xa4
        AD A4
   B49D AC A0 AC A0 AB A0  5743         .byte   0xac,0xa0,0xac,0xa0,0xab,0xa0,0xaa,0xa0
        AA A0
   B4A5 AA A0 A2 80 A0 A0  5744         .byte   0xaa,0xa0,0xa2,0x80,0xa0,0xa0,0xa0,0xa0
        A0 A0
   B4AD 8D 80 8A A0 7E 80  5745         .byte   0x8d,0x80,0x8a,0xa0,0x7e,0x80,0x7b,0xa0
        7B A0
   B4B5 79 A4 78 A0 77 A4  5746         .byte   0x79,0xa4,0x78,0xa0,0x77,0xa4,0x76,0xa0
        76 A0
   B4BD 75 A4 74 A0 73 A4  5747         .byte   0x75,0xa4,0x74,0xa0,0x73,0xa4,0x72,0xa0
        72 A0
   B4C5 71 A4 70 A0 6F A4  5748         .byte   0x71,0xa4,0x70,0xa0,0x6f,0xa4,0x6e,0xa0
        6E A0
   B4CD 6D A4 6C A0 69 80  5749         .byte   0x6d,0xa4,0x6c,0xa0,0x69,0x80,0x69,0x80
        69 80
   B4D5 67 A0 5E 20 58 24  5750         .byte   0x67,0xa0,0x5e,0x20,0x58,0x24,0x57,0x20
        57 20
   B4DD 57 20 56 24 55 20  5751         .byte   0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24
        54 24
   B4E5 54 24 53 20 52 24  5752         .byte   0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24
        52 24
   B4ED 50 20 4F 24 4E 20  5753         .byte   0x50,0x20,0x4f,0x24,0x4e,0x20,0x4d,0x24
        4D 24
   B4F5 4C 20 4C 20 4B 24  5754         .byte   0x4c,0x20,0x4c,0x20,0x4b,0x24,0x4a,0x20
        4A 20
   B4FD 49 20 49 00 48 20  5755         .byte   0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20
        47 20
   B505 47 20 46 20 45 24  5756         .byte   0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24
        45 24
   B50D 44 20 42 20 42 20  5757         .byte   0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04
        37 04
   B515 35 20 2E 04 2E 04  5758         .byte   0x35,0x20,0x2e,0x04,0x2e,0x04,0x2d,0x20
        2D 20
   B51D 23 24 21 20 17 24  5759         .byte   0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00
        13 00
   B525 11 24 10 30 07 34  5760         .byte   0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30
        06 30
   B52D 05 30 FF FF        5761         .byte   0x05,0x30,0xff,0xff
                           5762 
                           5763 ; board 3
   B531                    5764 LB531:
   B531 CD 20 CC 20 CB 20  5765         .byte   0xcd,0x20,0xcc,0x20,0xcb,0x20,0xcb,0x20
        CB 20
   B539 CA 00 C9 20 C9 20  5766         .byte   0xca,0x00,0xc9,0x20,0xc9,0x20,0xc8,0x20
        C8 20
   B541 C1 A0 C0 A0 B8 A0  5767         .byte   0xc1,0xa0,0xc0,0xa0,0xb8,0xa0,0xb8,0x20
        B8 20
   B549 B4 20 A6 00 A4 20  5768         .byte   0xb4,0x20,0xa6,0x00,0xa4,0x20,0x99,0x00
        99 00
   B551 97 22 97 22 96 20  5769         .byte   0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22
        95 22
   B559 94 20 93 22 93 22  5770         .byte   0x94,0x20,0x93,0x22,0x93,0x22,0x91,0x20
        91 20
   B561 90 20 90 20 8D A0  5771         .byte   0x90,0x20,0x90,0x20,0x8d,0xa0,0x8c,0xa0
        8C A0
   B569 7D A2 7D A2 7B A0  5772         .byte   0x7d,0xa2,0x7d,0xa2,0x7b,0xa0,0x7b,0xa0
        7B A0
   B571 79 A2 79 A2 77 A0  5773         .byte   0x79,0xa2,0x79,0xa2,0x77,0xa0,0x77,0xa0
        77 A0
   B579 76 80 75 A0 6E 20  5774         .byte   0x76,0x80,0x75,0xa0,0x6e,0x20,0x67,0x24
        67 24
   B581 66 20 65 24 64 20  5775         .byte   0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24
        63 24
   B589 63 24 61 20 60 24  5776         .byte   0x63,0x24,0x61,0x20,0x60,0x24,0x5f,0x20
        5F 20
   B591 5E 20 5D 24 5C 20  5777         .byte   0x5e,0x20,0x5d,0x24,0x5c,0x20,0x5b,0x24
        5B 24
   B599 5A 20 59 24 58 20  5778         .byte   0x5a,0x20,0x59,0x24,0x58,0x20,0x56,0x20
        56 20
   B5A1 55 04 54 00 53 24  5779         .byte   0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20
        52 20
   B5A9 52 20 4F 24 4F 24  5780         .byte   0x52,0x20,0x4f,0x24,0x4f,0x24,0x4e,0x30
        4E 30
   B5B1 4D 30 47 10 45 30  5781         .byte   0x4d,0x30,0x47,0x10,0x45,0x30,0x35,0x30
        35 30
   B5B9 33 10 31 30 31 30  5782         .byte   0x33,0x10,0x31,0x30,0x31,0x30,0x1d,0x20
        1D 20
   B5C1 FF FF              5783         .byte   0xff,0xff
                           5784 
                           5785 ; board 5
   B5C3                    5786 LB5C3:
   B5C3 A9 20 A3 20 A2 20  5787         .byte   0xa9,0x20,0xa3,0x20,0xa2,0x20,0xa1,0x20
        A1 20
   B5CB A0 20 A0 20 9F 20  5788         .byte   0xa0,0x20,0xa0,0x20,0x9f,0x20,0x9f,0x20
        9F 20
   B5D3 9E 20 9D 24 9D 24  5789         .byte   0x9e,0x20,0x9d,0x24,0x9d,0x24,0x9b,0x20
        9B 20
   B5DB 9A 24 99 20 98 20  5790         .byte   0x9a,0x24,0x99,0x20,0x98,0x20,0x97,0x24
        97 24
   B5E3 97 24 95 20 95 20  5791         .byte   0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00
        94 00
   B5EB 94 00 93 20 92 00  5792         .byte   0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00
        92 00
   B5F3 91 20 90 20 90 20  5793         .byte   0x91,0x20,0x90,0x20,0x90,0x20,0x8f,0x20
        8F 20
   B5FB 8D 20 8D 20 81 00  5794         .byte   0x8d,0x20,0x8d,0x20,0x81,0x00,0x7f,0x20
        7F 20
   B603 79 00 79 00 78 20  5795         .byte   0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20
        76 20
   B60B 6B 00 69 20 5E 00  5796         .byte   0x6b,0x00,0x69,0x20,0x5e,0x00,0x5c,0x20
        5C 20
   B613 5B 30 52 10 51 30  5797         .byte   0x5b,0x30,0x52,0x10,0x51,0x30,0x50,0x30
        50 30
   B61B 50 30 4F 20 4E 20  5798         .byte   0x50,0x30,0x4f,0x20,0x4e,0x20,0x4e,0x20
        4E 20
   B623 4D 20 46 A0 45 A0  5799         .byte   0x4d,0x20,0x46,0xa0,0x45,0xa0,0x3d,0xa0
        3D A0
   B62B 3D A0 39 20 2A 00  5800         .byte   0x3d,0xa0,0x39,0x20,0x2a,0x00,0x28,0x20
        28 20
   B633 1E 00 1C 22 1C 22  5801         .byte   0x1e,0x00,0x1c,0x22,0x1c,0x22,0x1b,0x20
        1B 20
   B63B 1A 22 19 20 18 22  5802         .byte   0x1a,0x22,0x19,0x20,0x18,0x22,0x18,0x22
        18 22
   B643 16 20 15 22 15 22  5803         .byte   0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xa0
        14 A0
   B64B 13 A2 11 A0        5804         .byte   0x13,0xa2,0x11,0xa0
                           5805 
                           5806 ; All empty (0xFFs) in this gap
                           5807 
   F780                    5808         .org    0xF780
                           5809 
                           5810 ; Two Tables used by data protocol handler
                           5811 
   F780                    5812 LF780:
   F780 57 0B 00 00 00 00  5813         .byte   0x57,0x0b,0x00,0x00,0x00,0x00,0x08,0x00
        08 00
   F788 00 00 20 00 00 00  5814         .byte   0x00,0x00,0x20,0x00,0x00,0x00,0x80,0x00
        80 00
   F790 00 00 00 00 00 04  5815         .byte   0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
        00 00
   F798 00 10 00 00 00 00  5816         .byte   0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
                           5817 
   F7A0                    5818 LF7A0:
   F7A0 40 12 20 09 80 24  5819         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x02,0x00
        02 00
   F7A8 40 12 20 09 80 24  5820         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x04,0x00
        04 00
   F7B0 00 00 00 00 00 00  5821         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
   F7B8 00 00 00 00 08 00  5822         .byte   0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        00 00
                           5823 
   F7C0                    5824 LF7C0:
   F7C0 00                 5825         .byte   0x00
                           5826 ;
                           5827 ; All empty (0xFFs) in this gap
                           5828 ;
   F800                    5829         .org    0xF800
                           5830 ; Reset
   F800                    5831 RESET:
   F800 0F            [ 2] 5832         sei                     ; disable interrupts
   F801 86 03         [ 2] 5833         ldaa    #0x03
   F803 B7 10 24      [ 4] 5834         staa    TMSK2           ; disable irqs, set prescaler to 16
   F806 86 80         [ 2] 5835         ldaa    #0x80
   F808 B7 10 22      [ 4] 5836         staa    TMSK1           ; enable OC1 irq
   F80B 86 FE         [ 2] 5837         ldaa    #0xFE
   F80D B7 10 35      [ 4] 5838         staa    BPROT           ; protect everything except $xE00-$xE1F
   F810 96 07         [ 3] 5839         ldaa    0x0007          ;
   F812 81 DB         [ 2] 5840         cmpa    #0xDB           ; special unprotect mode???
   F814 26 06         [ 3] 5841         bne     LF81C           ; if not, jump ahead
   F816 7F 10 35      [ 6] 5842         clr     BPROT           ; else unprotect everything
   F819 7F 00 07      [ 6] 5843         clr     0x0007          ; reset special unprotect mode???
   F81C                    5844 LF81C:
   F81C 8E 01 FF      [ 3] 5845         lds     #0x01FF         ; init SP
   F81F 86 A5         [ 2] 5846         ldaa    #0xA5
   F821 B7 10 5D      [ 4] 5847         staa    CSCTL           ; enable external IO:
                           5848                                 ; IO1EN,  BUSSEL, active LOW
                           5849                                 ; IO2EN,  PIA/SCCSEL, active LOW
                           5850                                 ; CSPROG, ROMSEL priority over RAMSEL 
                           5851                                 ; CSPROG, ROMSEL enabled, 32K, $8000-$FFFF
   F824 86 01         [ 2] 5852         ldaa    #0x01
   F826 B7 10 5F      [ 4] 5853         staa    CSGSIZ          ; CSGEN,  RAMSEL active low
                           5854                                 ; CSGEN,  RAMSEL 32K
   F829 86 00         [ 2] 5855         ldaa    #0x00
   F82B B7 10 5E      [ 4] 5856         staa    CSGADR          ; CSGEN,  RAMSEL = $0000-$7FFF (except internal regs)
   F82E 86 F0         [ 2] 5857         ldaa    #0xF0
   F830 B7 10 5C      [ 4] 5858         staa    CSSTRH          ; 3 cycle clock stretching on BUSSEL and LCRS
   F833 7F 00 00      [ 6] 5859         clr     0x0000          ; ????? Done with basic init?
                           5860 
                           5861 ; Initialize Main PIA
   F836 86 30         [ 2] 5862         ldaa    #0x30           ;
   F838 B7 18 05      [ 4] 5863         staa    PIA0CRA         ; control register A, CA2=0, sel DDRA
   F83B B7 18 07      [ 4] 5864         staa    PIA0CRB         ; control register B, CB2=0, sel DDRB
   F83E 86 FF         [ 2] 5865         ldaa    #0xFF
   F840 B7 18 06      [ 4] 5866         staa    PIA0DDRB        ; select B0-B7 to be outputs
   F843 86 78         [ 2] 5867         ldaa    #0x78           ;
   F845 B7 18 04      [ 4] 5868         staa    PIA0DDRA        ; select A3-A6 to be outputs
   F848 86 34         [ 2] 5869         ldaa    #0x34           ;
   F84A B7 18 05      [ 4] 5870         staa    PIA0CRA         ; select output register A
   F84D B7 18 07      [ 4] 5871         staa    PIA0CRB         ; select output register B
   F850 C6 FF         [ 2] 5872         ldab    #0xFF
   F852 BD F9 C5      [ 6] 5873         jsr     BUTNLIT         ; turn on all button lights
   F855 20 13         [ 3] 5874         bra     LF86A           ; jump past data table
                           5875 
                           5876 ; data table for aux serial config
   F857                    5877 LF857:
   F857 09 4A              5878         .byte   0x09,0x4a       ; channel reset B, MIE off, DLC on, no vector
   F859 01 10              5879         .byte   0x01,0x10       ; irq on all character received
   F85B 0C 18              5880         .byte   0x0c,0x18       ; Lower byte of time constant
   F85D 0D 00              5881         .byte   0x0d,0x00       ; Upper byte of time constant
   F85F 04 44              5882         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   F861 0E 63              5883         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   F863 05 68              5884         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   F865 0B 56              5885         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   F867 03 C1              5886         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           5887         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           5888         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   F869 FF                 5889         .byte   0xff            ; end of table marker
                           5890 
                           5891 ; init SCC (8530), aux serial config
   F86A                    5892 LF86A:
   F86A CE F8 57      [ 3] 5893         ldx     #LF857
   F86D                    5894 LF86D:
   F86D A6 00         [ 4] 5895         ldaa    0,X
   F86F 81 FF         [ 2] 5896         cmpa    #0xFF
   F871 27 06         [ 3] 5897         beq     LF879
   F873 B7 18 0D      [ 4] 5898         staa    SCCCTRLA
   F876 08            [ 3] 5899         inx
   F877 20 F4         [ 3] 5900         bra     LF86D
                           5901 
                           5902 ; Setup normal SCI, 8 data bits, 1 stop bit
                           5903 ; Interrupts disabled, Transmitter and Receiver enabled
                           5904 ; prescaler = /13, SCR=/2, rate = 9600 baud at 16Mhz clock
                           5905 
   F879                    5906 LF879:
   F879 86 00         [ 2] 5907         ldaa    #0x00
   F87B B7 10 2C      [ 4] 5908         staa    SCCR1
   F87E 86 0C         [ 2] 5909         ldaa    #0x0C
   F880 B7 10 2D      [ 4] 5910         staa    SCCR2
   F883 86 31         [ 2] 5911         ldaa    #0x31
   F885 B7 10 2B      [ 4] 5912         staa    BAUD
                           5913 
                           5914 ; Initialize all RAM vectors to RTI: 
                           5915 ; Opcode 0x3b into vectors at 0x0100 through 0x0139
                           5916 
   F888 CE 01 00      [ 3] 5917         ldx     #0x0100
   F88B 86 3B         [ 2] 5918         ldaa    #0x3B           ; RTI opcode
   F88D                    5919 LF88D:
   F88D A7 00         [ 4] 5920         staa    0,X
   F88F 08            [ 3] 5921         inx
   F890 08            [ 3] 5922         inx
   F891 08            [ 3] 5923         inx
   F892 8C 01 3C      [ 4] 5924         cpx     #0x013C
   F895 25 F6         [ 3] 5925         bcs     LF88D
   F897 C6 F0         [ 2] 5926         ldab    #0xF0
   F899 F7 18 04      [ 4] 5927         stab    PIA0PRA         ; enable LCD backlight, disable RESET button light
   F89C 86 7E         [ 2] 5928         ldaa    #0x7E
   F89E 97 03         [ 3] 5929         staa    (0x0003)        ; Put a jump instruction here???
                           5930 
                           5931 ; Non-destructive ram test:
                           5932 ;
                           5933 ; HC11 Internal RAM: 0x0000-0x3ff
                           5934 ; External NVRAM:    0x2000-0x7fff
                           5935 ;
                           5936 ; Note:
                           5937 ; External NVRAM:    0x0400-0xfff is also available, but not tested
                           5938 
   F8A0 CE 00 00      [ 3] 5939         ldx     #0x0000
   F8A3                    5940 LF8A3:
   F8A3 E6 00         [ 4] 5941         ldab    0,X             ; save value
   F8A5 86 55         [ 2] 5942         ldaa    #0x55
   F8A7 A7 00         [ 4] 5943         staa    0,X
   F8A9 A1 00         [ 4] 5944         cmpa    0,X
   F8AB 26 19         [ 3] 5945         bne     LF8C6
   F8AD 49            [ 2] 5946         rola
   F8AE A7 00         [ 4] 5947         staa    0,X
   F8B0 A1 00         [ 4] 5948         cmpa    0,X
   F8B2 26 12         [ 3] 5949         bne     LF8C6
   F8B4 E7 00         [ 4] 5950         stab    0,X             ; restore value
   F8B6 08            [ 3] 5951         inx
   F8B7 8C 04 00      [ 4] 5952         cpx     #0x0400
   F8BA 26 03         [ 3] 5953         bne     LF8BF
   F8BC CE 20 00      [ 3] 5954         ldx     #0x2000
   F8BF                    5955 LF8BF:  
   F8BF 8C 80 00      [ 4] 5956         cpx     #0x8000
   F8C2 26 DF         [ 3] 5957         bne     LF8A3
   F8C4 20 04         [ 3] 5958         bra     LF8CA
                           5959 
   F8C6                    5960 LF8C6:
   F8C6 86 01         [ 2] 5961         ldaa    #0x01           ; Mark Failed RAM test
   F8C8 97 00         [ 3] 5962         staa    (0x0000)
                           5963 ; 
   F8CA                    5964 LF8CA:
   F8CA C6 01         [ 2] 5965         ldab    #0x01
   F8CC BD F9 95      [ 6] 5966         jsr     DIAGDGT         ; write digit 1 to diag display
   F8CF B6 10 35      [ 4] 5967         ldaa    BPROT  
   F8D2 26 0F         [ 3] 5968         bne     LF8E3           ; if something is protected, jump ahead
   F8D4 B6 30 00      [ 4] 5969         ldaa    (0x3000)        ; NVRAM
   F8D7 81 7E         [ 2] 5970         cmpa    #0x7E
   F8D9 26 08         [ 3] 5971         bne     LF8E3           ; if RAM(0x3000) == 0x7E, jump ahead anyway (special unlock?)
                           5972 
                           5973 ; error?
   F8DB C6 0E         [ 2] 5974         ldab    #0x0E
   F8DD BD F9 95      [ 6] 5975         jsr     DIAGDGT         ; write digit E to diag display
   F8E0 7E 30 00      [ 3] 5976         jmp     (0x3000)        ; jump to routine in NVRAM?
                           5977 
                           5978 ; checking for serial connection
                           5979 
   F8E3                    5980 LF8E3:
   F8E3 CE F0 00      [ 3] 5981         ldx     #0xF000         ; timeout counter
   F8E6                    5982 LF8E6:
   F8E6 01            [ 2] 5983         nop
   F8E7 01            [ 2] 5984         nop
   F8E8 09            [ 3] 5985         dex
   F8E9 27 0B         [ 3] 5986         beq     LF8F6           ; if time is up, jump ahead
   F8EB BD F9 45      [ 6] 5987         jsr     SERIALR         ; else read serial data if available
   F8EE 24 F6         [ 3] 5988         bcc     LF8E6           ; if no data available, loop
   F8F0 81 1B         [ 2] 5989         cmpa    #0x1B           ; if serial data was read, is it an ESC?
   F8F2 27 29         [ 3] 5990         beq     LF91D           ; if so, jump to echo hex char routine?
   F8F4 20 F0         [ 3] 5991         bra     LF8E6           ; else loop
   F8F6                    5992 LF8F6:
   F8F6 B6 80 00      [ 4] 5993         ldaa    L8000           ; check if this is a regular rom?
   F8F9 81 7E         [ 2] 5994         cmpa    #0x7E        
   F8FB 26 0B         [ 3] 5995         bne     MINIMON         ; if not, jump ahead
                           5996 
   F8FD C6 0A         [ 2] 5997         ldab    #0x0A
   F8FF BD F9 95      [ 6] 5998         jsr     DIAGDGT         ; else write digit A to diag display
                           5999 
   F902 BD 80 00      [ 6] 6000         jsr     L8000           ; jump to start of rom routine
   F905 0F            [ 2] 6001         sei                     ; if we ever come return, just loop and do it all again
   F906 20 EE         [ 3] 6002         bra     LF8F6
                           6003 
                           6004 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6005 
   F908                    6006 MINIMON:
   F908 C6 10         [ 2] 6007         ldab    #0x10           ; not a regular rom
   F90A BD F9 95      [ 6] 6008         jsr     DIAGDGT         ; blank the diag display
                           6009 
   F90D BD F9 D8      [ 6] 6010         jsr     SERMSGW         ; enter the mini-monitor???
   F910 4D 49 4E 49 2D 4D  6011         .ascis  'MINI-MON'
        4F CE
                           6012 
   F918 C6 10         [ 2] 6013         ldab    #0x10
   F91A BD F9 95      [ 6] 6014         jsr     DIAGDGT         ; blank the diag display
                           6015 
   F91D                    6016 LF91D:
   F91D 7F 00 05      [ 6] 6017         clr     (0x0005)
   F920 7F 00 04      [ 6] 6018         clr     (0x0004)
   F923 7F 00 02      [ 6] 6019         clr     (0x0002)
   F926 7F 00 06      [ 6] 6020         clr     (0x0006)
                           6021 
   F929 BD F9 D8      [ 6] 6022         jsr     SERMSGW
   F92C 0D 0A BE           6023         .ascis  '\r\n>'
                           6024 
                           6025 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6026 
                           6027 ; convert A to 2 hex digits and transmit
   F92F                    6028 SERHEXW:
   F92F 36            [ 3] 6029         psha
   F930 44            [ 2] 6030         lsra
   F931 44            [ 2] 6031         lsra
   F932 44            [ 2] 6032         lsra
   F933 44            [ 2] 6033         lsra
   F934 BD F9 38      [ 6] 6034         jsr     LF938
   F937 32            [ 4] 6035         pula
   F938                    6036 LF938:
   F938 84 0F         [ 2] 6037         anda    #0x0F
   F93A 8A 30         [ 2] 6038         oraa    #0x30
   F93C 81 3A         [ 2] 6039         cmpa    #0x3A
   F93E 25 02         [ 3] 6040         bcs     LF942
   F940 8B 07         [ 2] 6041         adda    #0x07
   F942                    6042 LF942:
   F942 7E F9 6F      [ 3] 6043         jmp     SERIALW
                           6044 
                           6045 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6046 
                           6047 ; serial read non-blocking
   F945                    6048 SERIALR:
   F945 B6 10 2E      [ 4] 6049         ldaa    SCSR  
   F948 85 20         [ 2] 6050         bita    #0x20
   F94A 26 09         [ 3] 6051         bne     LF955
   F94C 0C            [ 2] 6052         clc
   F94D 39            [ 5] 6053         rts
                           6054 
                           6055 ; serial blocking read
   F94E                    6056 SERBLKR:
   F94E B6 10 2E      [ 4] 6057         ldaa    SCSR            ; read serial status
   F951 85 20         [ 2] 6058         bita    #0x20
   F953 27 F9         [ 3] 6059         beq     SERBLKR         ; if RDRF=0, loop
                           6060 
                           6061 ; read serial data, (assumes it's ready)
   F955                    6062 LF955:
   F955 B6 10 2E      [ 4] 6063         ldaa    SCSR            ; read serial status
   F958 85 02         [ 2] 6064         bita    #0x02
   F95A 26 09         [ 3] 6065         bne     LF965           ; if FE=1, clear it
   F95C 85 08         [ 2] 6066         bita    #0x08
   F95E 26 05         [ 3] 6067         bne     LF965           ; if OR=1, clear it
   F960 B6 10 2F      [ 4] 6068         ldaa    SCDR            ; otherwise, good data
   F963 0D            [ 2] 6069         sec
   F964 39            [ 5] 6070         rts
                           6071 
   F965                    6072 LF965:
   F965 B6 10 2F      [ 4] 6073         ldaa    SCDR            ; clear any error
   F968 86 2F         [ 2] 6074         ldaa    #0x2F           ; '/'   
   F96A BD F9 6F      [ 6] 6075         jsr     SERIALW
   F96D 20 DF         [ 3] 6076         bra     SERBLKR         ; go to wait for a character
                           6077 
                           6078 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6079 
                           6080 ; Send A to SCI with CR turned to CRLF
   F96F                    6081 SERIALW:
   F96F 81 0D         [ 2] 6082         cmpa    #0x0D           ; CR?
   F971 27 02         [ 3] 6083         beq     LF975           ; if so echo CR+LF
   F973 20 07         [ 3] 6084         bra     SERRAWW         ; else just echo it
   F975                    6085 LF975:
   F975 86 0D         [ 2] 6086         ldaa    #0x0D
   F977 BD F9 7C      [ 6] 6087         jsr     SERRAWW
   F97A 86 0A         [ 2] 6088         ldaa    #0x0A
                           6089 
                           6090 ; send a char to SCI
   F97C                    6091 SERRAWW:
   F97C F6 10 2E      [ 4] 6092         ldab    SCSR            ; wait for ready to send
   F97F C5 40         [ 2] 6093         bitb    #0x40
   F981 27 F9         [ 3] 6094         beq     SERRAWW
   F983 B7 10 2F      [ 4] 6095         staa    SCDR            ; send it
   F986 39            [ 5] 6096         rts
                           6097 
                           6098 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6099 
                           6100 ; Unused?
   F987                    6101 LF987:
   F987 BD F9 4E      [ 6] 6102         jsr     SERBLKR         ; get a serial char
   F98A 81 7A         [ 2] 6103         cmpa    #0x7A           ;'z'
   F98C 22 06         [ 3] 6104         bhi     LF994
   F98E 81 61         [ 2] 6105         cmpa    #0x61           ;'a'
   F990 25 02         [ 3] 6106         bcs     LF994
   F992 82 20         [ 2] 6107         sbca    #0x20           ;convert to upper case?
   F994                    6108 LF994:
   F994 39            [ 5] 6109         rts
                           6110 
                           6111 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6112 
                           6113 ; Write hex digit arg in B to diagnostic lights
                           6114 ; or B=0x10 or higher for blank
                           6115 
   F995                    6116 DIAGDGT:
   F995 36            [ 3] 6117         psha
   F996 C1 11         [ 2] 6118         cmpb    #0x11
   F998 25 02         [ 3] 6119         bcs     LF99C
   F99A C6 10         [ 2] 6120         ldab    #0x10
   F99C                    6121 LF99C:
   F99C CE F9 B4      [ 3] 6122         ldx     #LF9B4
   F99F 3A            [ 3] 6123         abx
   F9A0 A6 00         [ 4] 6124         ldaa    0,X
   F9A2 B7 18 06      [ 4] 6125         staa    PIA0PRB         ; write arg to local data bus
   F9A5 B6 18 04      [ 4] 6126         ldaa    PIA0PRA         ; read from Port A
   F9A8 8A 20         [ 2] 6127         oraa    #0x20           ; bit 5 high
   F9AA B7 18 04      [ 4] 6128         staa    PIA0PRA         ; write back to Port A
   F9AD 84 DF         [ 2] 6129         anda    #0xDF           ; bit 5 low
   F9AF B7 18 04      [ 4] 6130         staa    PIA0PRA         ; write back to Port A
   F9B2 32            [ 4] 6131         pula
   F9B3 39            [ 5] 6132         rts
                           6133 
                           6134 ; 7 segment patterns - XGFEDCBA
   F9B4                    6135 LF9B4:
   F9B4 C0                 6136         .byte   0xc0            ; 0
   F9B5 F9                 6137         .byte   0xf9            ; 1
   F9B6 A4                 6138         .byte   0xa4            ; 2
   F9B7 B0                 6139         .byte   0xb0            ; 3
   F9B8 99                 6140         .byte   0x99            ; 4
   F9B9 92                 6141         .byte   0x92            ; 5
   F9BA 82                 6142         .byte   0x82            ; 6
   F9BB F8                 6143         .byte   0xf8            ; 7
   F9BC 80                 6144         .byte   0x80            ; 8
   F9BD 90                 6145         .byte   0x90            ; 9
   F9BE 88                 6146         .byte   0x88            ; A 
   F9BF 83                 6147         .byte   0x83            ; b
   F9C0 C6                 6148         .byte   0xc6            ; C
   F9C1 A1                 6149         .byte   0xa1            ; d
   F9C2 86                 6150         .byte   0x86            ; E
   F9C3 8E                 6151         .byte   0x8e            ; F
   F9C4 FF                 6152         .byte   0xff            ; blank
                           6153 
                           6154 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6155 
                           6156 ; Write arg in B to Button Lights
   F9C5                    6157 BUTNLIT:
   F9C5 36            [ 3] 6158         psha
   F9C6 F7 18 06      [ 4] 6159         stab    PIA0PRB         ; write arg to local data bus
   F9C9 B6 18 04      [ 4] 6160         ldaa    PIA0PRA         ; read from Port A
   F9CC 84 EF         [ 2] 6161         anda    #0xEF           ; bit 4 low
   F9CE B7 18 04      [ 4] 6162         staa    PIA0PRA         ; write back to Port A
   F9D1 8A 10         [ 2] 6163         oraa    #0x10           ; bit 4 high
   F9D3 B7 18 04      [ 4] 6164         staa    PIA0PRA         ; write this to Port A
   F9D6 32            [ 4] 6165         pula
   F9D7 39            [ 5] 6166         rts
                           6167 
                           6168 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6169 
                           6170 ; Send rom message via SCI
   F9D8                    6171 SERMSGW:
   F9D8 18 38         [ 6] 6172         puly
   F9DA                    6173 LF9DA:
   F9DA 18 A6 00      [ 5] 6174         ldaa    0,Y
   F9DD 27 09         [ 3] 6175         beq     LF9E8           ; if zero terminated, return
   F9DF 2B 0C         [ 3] 6176         bmi     LF9ED           ; if high bit set..do last char and return
   F9E1 BD F9 7C      [ 6] 6177         jsr     SERRAWW         ; else send char
   F9E4 18 08         [ 4] 6178         iny
   F9E6 20 F2         [ 3] 6179         bra     LF9DA           ; and loop for next one
                           6180 
   F9E8                    6181 LF9E8:
   F9E8 18 08         [ 4] 6182         iny                     ; setup return address and return
   F9EA 18 3C         [ 5] 6183         pshy
   F9EC 39            [ 5] 6184         rts
                           6185 
   F9ED                    6186 LF9ED:
   F9ED 84 7F         [ 2] 6187         anda    #0x7F           ; remove top bit
   F9EF BD F9 7C      [ 6] 6188         jsr     SERRAWW         ; send char
   F9F2 20 F4         [ 3] 6189         bra     LF9E8           ; and we're done
   F9F4 39            [ 5] 6190         rts
                           6191 
   F9F5                    6192 DORTS:
   F9F5 39            [ 5] 6193         rts
   F9F6                    6194 DORTI:        
   F9F6 3B            [12] 6195         rti
                           6196 
                           6197 ; all 0xffs in this gap
                           6198 
   FFA0                    6199         .org    0xFFA0
                           6200 
   FFA0 7E F9 F5      [ 3] 6201         jmp     DORTS
   FFA3 7E F9 F5      [ 3] 6202         jmp     DORTS
   FFA6 7E F9 F5      [ 3] 6203         jmp     DORTS
   FFA9 7E F9 2F      [ 3] 6204         jmp     SERHEXW
   FFAC 7E F9 D8      [ 3] 6205         jmp     SERMSGW      
   FFAF 7E F9 45      [ 3] 6206         jmp     SERIALR     
   FFB2 7E F9 6F      [ 3] 6207         jmp     SERIALW      
   FFB5 7E F9 08      [ 3] 6208         jmp     MINIMON
   FFB8 7E F9 95      [ 3] 6209         jmp     DIAGDGT 
   FFBB 7E F9 C5      [ 3] 6210         jmp     BUTNLIT 
                           6211 
   FFBE FF                 6212        .byte    0xff
   FFBF FF                 6213        .byte    0xff
                           6214 
                           6215 ; Vectors
                           6216 
   FFC0 F9 F6              6217        .word   DORTI            ; Stub RTI
   FFC2 F9 F6              6218        .word   DORTI            ; Stub RTI
   FFC4 F9 F6              6219        .word   DORTI            ; Stub RTI
   FFC6 F9 F6              6220        .word   DORTI            ; Stub RTI
   FFC8 F9 F6              6221        .word   DORTI            ; Stub RTI
   FFCA F9 F6              6222        .word   DORTI            ; Stub RTI
   FFCC F9 F6              6223        .word   DORTI            ; Stub RTI
   FFCE F9 F6              6224        .word   DORTI            ; Stub RTI
   FFD0 F9 F6              6225        .word   DORTI            ; Stub RTI
   FFD2 F9 F6              6226        .word   DORTI            ; Stub RTI
   FFD4 F9 F6              6227        .word   DORTI            ; Stub RTI
                           6228 
   FFD6 01 00              6229         .word  0x0100           ; SCI
   FFD8 01 03              6230         .word  0x0103           ; SPI
   FFDA 01 06              6231         .word  0x0106           ; PA accum. input edge
   FFDC 01 09              6232         .word  0x0109           ; PA Overflow
                           6233 
   FFDE F9 F6              6234         .word  DORTI            ; Stub RTI
                           6235 
   FFE0 01 0C              6236         .word  0x010c           ; TI4O5
   FFE2 01 0F              6237         .word  0x010f           ; TOC4
   FFE4 01 12              6238         .word  0x0112           ; TOC3
   FFE6 01 15              6239         .word  0x0115           ; TOC2
   FFE8 01 18              6240         .word  0x0118           ; TOC1
   FFEA 01 1B              6241         .word  0x011b           ; TIC3
   FFEC 01 1E              6242         .word  0x011e           ; TIC2
   FFEE 01 21              6243         .word  0x0121           ; TIC1
   FFF0 01 24              6244         .word  0x0124           ; RTI
   FFF2 01 27              6245         .word  0x0127           ; ~IRQ
   FFF4 01 2A              6246         .word  0x012a           ; XIRQ
   FFF6 01 2D              6247         .word  0x012d           ; SWI
   FFF8 01 30              6248         .word  0x0130           ; ILLEGAL OPCODE
   FFFA 01 33              6249         .word  0x0133           ; COP Failure
   FFFC 01 36              6250         .word  0x0136           ; COP Clock Monitor Fail
                           6251 
   FFFE F8 00              6252         .word  RESET            ; Reset
                           6253 
