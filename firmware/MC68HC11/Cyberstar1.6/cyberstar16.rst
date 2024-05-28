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
   80D0 BD A3 41      [ 6]  186         jsr     LA341           ; fire 3 bits on board 2
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
   8276 BD 9B 19      [ 6]  363         jsr     L9B19           ; do the random motions if enabled
   8279 96 60         [ 3]  364         ldaa    (0x0060)
   827B 27 06         [ 3]  365         beq     L8283
   827D BD A9 7C      [ 6]  366         jsr     LA97C
   8280 7E F8 00      [ 3]  367         jmp     RESET           ; reset controller
   8283                     368 L8283:
   8283 B6 18 04      [ 4]  369         ldaa    PIA0PRA 
   8286 84 06         [ 2]  370         anda    #0x06
   8288 26 08         [ 3]  371         bne     L8292           ; skip credits if up and down are pressed?
   828A BD 9C F1      [ 6]  372         jsr     L9CF1           ; print credits
   828D C6 32         [ 2]  373         ldab    #0x32
   828F BD 8C 22      [ 6]  374         jsr     DLYSECSBY100    ; delay 0.5 sec
   8292                     375 L8292:
   8292 BD 8E 95      [ 6]  376         jsr     L8E95           ; Was ENTER pressed?
   8295 81 0D         [ 2]  377         cmpa    #0x0D
   8297 26 03         [ 3]  378         bne     L829C
   8299 7E 92 92      [ 3]  379         jmp     L9292           ; If so, go to diagnostics menu
   829C                     380 L829C:
   829C BD F9 45      [ 6]  381         jsr     SERIALR
   829F 25 03         [ 3]  382         bcs     L82A4
   82A1                     383 L82A1:
   82A1 7E 83 33      [ 3]  384         jmp     L8333
   82A4                     385 L82A4:
   82A4 81 44         [ 2]  386         cmpa    #0x44           ;'$'
   82A6 26 03         [ 3]  387         bne     L82AB
   82A8 7E A3 66      [ 3]  388         jmp     LA366           ; go to security code & setup utility
   82AB                     389 L82AB:
   82AB 81 53         [ 2]  390         cmpa    #0x53           ;'S'
   82AD 26 F2         [ 3]  391         bne     L82A1
                            392 
   82AF BD F9 D8      [ 6]  393         jsr     SERMSGW      
   82B2 0A 0D 45 6E 74 65   394         .ascis  '\n\rEnter security code: '
        72 20 73 65 63 75
        72 69 74 79 20 63
        6F 64 65 3A A0
                            395 
   82C9 0F            [ 2]  396         sei
   82CA BD A2 EA      [ 6]  397         jsr     LA2EA
   82CD 0E            [ 2]  398         cli
   82CE 25 61         [ 3]  399         bcs     L8331
                            400 
   82D0 BD F9 D8      [ 6]  401         jsr     SERMSGW      
   82D3 0A 0D 45 45 50 52   402         .ascii '\n\rEEPROM serial number programming enabled.'
        4F 4D 20 73 65 72
        69 61 6C 20 6E 75
        6D 62 65 72 20 70
        72 6F 67 72 61 6D
        6D 69 6E 67 20 65
        6E 61 62 6C 65 64
        2E
   82FE 0A 0D 50 6C 65 61   403         .ascis '\n\rPlease RESET the processor to continue\n\r'
        73 65 20 52 45 53
        45 54 20 74 68 65
        20 70 72 6F 63 65
        73 73 6F 72 20 74
        6F 20 63 6F 6E 74
        69 6E 75 65 0A 8D
                            404 
   8328 86 01         [ 2]  405         ldaa    #0x01           ; enable EEPROM erase
   832A B7 04 0F      [ 4]  406         staa    ERASEFLG
   832D 86 DB         [ 2]  407         ldaa    #0xDB
   832F 97 07         [ 3]  408         staa    (0x0007)
                            409 ; need to reset to get out of this 
   8331 20 FE         [ 3]  410 L8331:  bra     L8331           ; infinite loop
                            411 
   8333                     412 L8333:
   8333 96 AA         [ 3]  413         ldaa    (0x00AA)
   8335 27 12         [ 3]  414         beq     L8349
   8337 DC 1B         [ 4]  415         ldd     CDTIMR1
   8339 26 0E         [ 3]  416         bne     L8349
   833B D6 62         [ 3]  417         ldab    (0x0062)
   833D C8 20         [ 2]  418         eorb    #0x20
   833F D7 62         [ 3]  419         stab    (0x0062)
   8341 BD F9 C5      [ 6]  420         jsr     BUTNLIT 
   8344 CC 00 32      [ 3]  421         ldd     #0x0032
   8347 DD 1B         [ 4]  422         std     CDTIMR1
   8349                     423 L8349:
   8349 BD 86 A4      [ 6]  424         jsr     L86A4
   834C 24 03         [ 3]  425         bcc     L8351
   834E 7E 82 76      [ 3]  426         jmp     (0x8276)
   8351                     427 L8351:
   8351 F6 10 2D      [ 4]  428         ldab    SCCR2  
   8354 CA 20         [ 2]  429         orab    #0x20
   8356 F7 10 2D      [ 4]  430         stab    SCCR2  
   8359 7F 00 AA      [ 6]  431         clr     (0x00AA)
   835C D6 62         [ 3]  432         ldab    (0x0062)
   835E C4 DF         [ 2]  433         andb    #0xDF
   8360 D7 62         [ 3]  434         stab    (0x0062)
   8362 BD F9 C5      [ 6]  435         jsr     BUTNLIT 
   8365 C6 02         [ 2]  436         ldab    #0x02           ; delay 2 secs
   8367 BD 8C 02      [ 6]  437         jsr     DLYSECS         ;
   836A 96 7C         [ 3]  438         ldaa    (0x007C)
   836C 27 2D         [ 3]  439         beq     L839B
   836E 96 7F         [ 3]  440         ldaa    (0x007F)
   8370 97 4E         [ 3]  441         staa    (0x004E)
   8372 D6 81         [ 3]  442         ldab    (0x0081)
   8374 BD 87 48      [ 6]  443         jsr     L8748   
   8377 96 82         [ 3]  444         ldaa    (0x0082)
   8379 85 01         [ 2]  445         bita    #0x01
   837B 26 06         [ 3]  446         bne     L8383
   837D 96 AC         [ 3]  447         ldaa    (0x00AC)
   837F 84 FD         [ 2]  448         anda    #0xFD
   8381 20 04         [ 3]  449         bra     L8387
   8383                     450 L8383:
   8383 96 AC         [ 3]  451         ldaa    (0x00AC)
   8385 8A 02         [ 2]  452         oraa    #0x02
   8387                     453 L8387:
   8387 97 AC         [ 3]  454         staa    (0x00AC)
   8389 B7 18 06      [ 4]  455         staa    PIA0PRB 
   838C B6 18 04      [ 4]  456         ldaa    PIA0PRA 
   838F 8A 20         [ 2]  457         oraa    #0x20
   8391 B7 18 04      [ 4]  458         staa    PIA0PRA 
   8394 84 DF         [ 2]  459         anda    #0xDF
   8396 B7 18 04      [ 4]  460         staa    PIA0PRA 
   8399 20 14         [ 3]  461         bra     L83AF
   839B                     462 L839B:
   839B FC 04 0D      [ 5]  463         ldd     (0x040D)
   839E 1A 83 FD E8   [ 5]  464         cpd     #0xFDE8         ; 65000?
   83A2 22 06         [ 3]  465         bhi     L83AA
   83A4 C3 00 01      [ 4]  466         addd    #0x0001
   83A7 FD 04 0D      [ 5]  467         std     (0x040D)
   83AA                     468 L83AA:
   83AA C6 F7         [ 2]  469         ldab    #0xF7           ; tape deck REWIND
   83AC BD 86 E7      [ 6]  470         jsr     L86E7
   83AF                     471 L83AF:
   83AF 7F 00 30      [ 6]  472         clr     (0x0030)
   83B2 7F 00 31      [ 6]  473         clr     (0x0031)
   83B5 7F 00 32      [ 6]  474         clr     (0x0032)
   83B8 BD 9B 19      [ 6]  475         jsr     L9B19           ; do the random motions if enabled   
   83BB BD 86 A4      [ 6]  476         jsr     L86A4
   83BE 25 EF         [ 3]  477         bcs     L83AF
   83C0 96 79         [ 3]  478         ldaa    (0x0079)
   83C2 27 17         [ 3]  479         beq     L83DB
   83C4 7F 00 79      [ 6]  480         clr     (0x0079)
   83C7 96 B5         [ 3]  481         ldaa    (0x00B5)
   83C9 81 01         [ 2]  482         cmpa    #0x01
   83CB 26 07         [ 3]  483         bne     L83D4
   83CD 7F 00 B5      [ 6]  484         clr     (0x00B5)
   83D0 86 01         [ 2]  485         ldaa    #0x01
   83D2 97 7C         [ 3]  486         staa    (0x007C)
   83D4                     487 L83D4:
   83D4 86 01         [ 2]  488         ldaa    #0x01
   83D6 97 AA         [ 3]  489         staa    (0x00AA)
   83D8 7E 9A 7F      [ 3]  490         jmp     L9A7F
   83DB                     491 L83DB:
   83DB BD 8D E4      [ 6]  492         jsr     LCDMSG1 
   83DE 20 20 20 54 61 70   493         .ascis  '   Tape start   '
        65 20 73 74 61 72
        74 20 20 A0
                            494 
   83EE D6 62         [ 3]  495         ldab    (0x0062)
   83F0 CA 80         [ 2]  496         orab    #0x80
   83F2 D7 62         [ 3]  497         stab    (0x0062)
   83F4 BD F9 C5      [ 6]  498         jsr     BUTNLIT 
   83F7 C6 FB         [ 2]  499         ldab    #0xFB           ; tape deck PLAY
   83F9 BD 86 E7      [ 6]  500         jsr     L86E7
                            501 
   83FC BD 8D CF      [ 6]  502         jsr     LCDMSG1A
   83FF 36 38 48 43 31 31   503         .ascis  '68HC11 Proto'
        20 50 72 6F 74 EF
                            504 
   840B BD 8D D6      [ 6]  505         jsr     LCDMSG2A
   840E 64 62 F0            506         .ascis  'dbp'
                            507 
   8411 C6 03         [ 2]  508         ldab    #0x03           ; delay 3 secs
   8413 BD 8C 02      [ 6]  509         jsr     DLYSECS         ;
   8416 7D 00 7C      [ 6]  510         tst     (0x007C)
   8419 27 15         [ 3]  511         beq     L8430
   841B D6 80         [ 3]  512         ldab    (0x0080)
   841D D7 62         [ 3]  513         stab    (0x0062)
   841F BD F9 C5      [ 6]  514         jsr     BUTNLIT 
   8422 D6 7D         [ 3]  515         ldab    (0x007D)
   8424 D7 78         [ 3]  516         stab    (0x0078)
   8426 D6 7E         [ 3]  517         ldab    (0x007E)
   8428 F7 10 8A      [ 4]  518         stab    (0x108A)
   842B 7F 00 7C      [ 6]  519         clr     (0x007C)
   842E 20 1D         [ 3]  520         bra     L844D
   8430                     521 L8430:
   8430 BD 8D 03      [ 6]  522         jsr     L8D03
   8433 BD 9D 18      [ 6]  523         jsr     L9D18
   8436 24 08         [ 3]  524         bcc     L8440
   8438 7D 00 B8      [ 6]  525         tst     (0x00B8)
   843B 27 F3         [ 3]  526         beq     L8430
   843D 7E 9A 60      [ 3]  527         jmp     L9A60
   8440                     528 L8440:
   8440 7D 00 B8      [ 6]  529         tst     (0x00B8)
   8443 27 EB         [ 3]  530         beq     L8430
   8445 7F 00 30      [ 6]  531         clr     (0x0030)
   8448 7F 00 31      [ 6]  532         clr     (0x0031)
   844B 20 00         [ 3]  533         bra     L844D
   844D                     534 L844D:
   844D 96 49         [ 3]  535         ldaa    (0x0049)
   844F 26 03         [ 3]  536         bne     L8454
   8451 7E 85 A4      [ 3]  537         jmp     L85A4
   8454                     538 L8454:
   8454 7F 00 49      [ 6]  539         clr     (0x0049)
   8457 81 31         [ 2]  540         cmpa    #0x31
   8459 26 08         [ 3]  541         bne     L8463
   845B BD A3 26      [ 6]  542         jsr     LA326
   845E BD 8D 42      [ 6]  543         jsr     L8D42
   8461 20 EA         [ 3]  544         bra     L844D
   8463                     545 L8463:
   8463 81 32         [ 2]  546         cmpa    #0x32
   8465 26 08         [ 3]  547         bne     L846F
   8467 BD A3 26      [ 6]  548         jsr     LA326
   846A BD 8D 35      [ 6]  549         jsr     L8D35
   846D 20 DE         [ 3]  550         bra     L844D
   846F                     551 L846F:
   846F 81 54         [ 2]  552         cmpa    #0x54
   8471 26 08         [ 3]  553         bne     L847B
   8473 BD A3 26      [ 6]  554         jsr     LA326
   8476 BD 8D 42      [ 6]  555         jsr     L8D42
   8479 20 D2         [ 3]  556         bra     L844D
   847B                     557 L847B:
   847B 81 5A         [ 2]  558         cmpa    #0x5A
   847D 26 1C         [ 3]  559         bne     L849B
   847F                     560 L847F:
   847F BD A3 1E      [ 6]  561         jsr     LA31E
   8482 BD 8E 95      [ 6]  562         jsr     L8E95
   8485 7F 00 32      [ 6]  563         clr     (0x0032)
   8488 7F 00 31      [ 6]  564         clr     (0x0031)
   848B 7F 00 30      [ 6]  565         clr     (0x0030)
   848E BD 99 A6      [ 6]  566         jsr     L99A6
   8491 D6 7B         [ 3]  567         ldab    (0x007B)
   8493 CA 0C         [ 2]  568         orab    #0x0C
   8495 BD 87 48      [ 6]  569         jsr     L8748   
   8498 7E 81 BD      [ 3]  570         jmp     L81BD
   849B                     571 L849B:
   849B 81 42         [ 2]  572         cmpa    #0x42
   849D 26 03         [ 3]  573         bne     L84A2
   849F 7E 98 3C      [ 3]  574         jmp     L983C
   84A2                     575 L84A2:
   84A2 81 4D         [ 2]  576         cmpa    #0x4D
   84A4 26 03         [ 3]  577         bne     L84A9
   84A6 7E 98 24      [ 3]  578         jmp     L9824
   84A9                     579 L84A9:
   84A9 81 45         [ 2]  580         cmpa    #0x45
   84AB 26 03         [ 3]  581         bne     L84B0
   84AD 7E 98 02      [ 3]  582         jmp     L9802
   84B0                     583 L84B0:
   84B0 81 58         [ 2]  584         cmpa    #0x58
   84B2 26 05         [ 3]  585         bne     L84B9
   84B4 7E 99 3F      [ 3]  586         jmp     L993F
   84B7 20 94         [ 3]  587         bra     L844D
   84B9                     588 L84B9:
   84B9 81 46         [ 2]  589         cmpa    #0x46
   84BB 26 03         [ 3]  590         bne     L84C0
   84BD 7E 99 71      [ 3]  591         jmp     L9971
   84C0                     592 L84C0:
   84C0 81 47         [ 2]  593         cmpa    #0x47
   84C2 26 03         [ 3]  594         bne     L84C7
   84C4 7E 99 7B      [ 3]  595         jmp     L997B
   84C7                     596 L84C7:
   84C7 81 48         [ 2]  597         cmpa    #0x48
   84C9 26 03         [ 3]  598         bne     L84CE
   84CB 7E 99 85      [ 3]  599         jmp     L9985
   84CE                     600 L84CE:
   84CE 81 49         [ 2]  601         cmpa    #0x49
   84D0 26 03         [ 3]  602         bne     L84D5
   84D2 7E 99 8F      [ 3]  603         jmp     L998F
   84D5                     604 L84D5:
   84D5 81 53         [ 2]  605         cmpa    #0x53
   84D7 26 03         [ 3]  606         bne     L84DC
   84D9 7E 97 BA      [ 3]  607         jmp     L97BA
   84DC                     608 L84DC:
   84DC 81 59         [ 2]  609         cmpa    #0x59
   84DE 26 03         [ 3]  610         bne     L84E3
   84E0 7E 99 D2      [ 3]  611         jmp     L99D2
   84E3                     612 L84E3:
   84E3 81 57         [ 2]  613         cmpa    #0x57
   84E5 26 03         [ 3]  614         bne     L84EA
   84E7 7E 9A A4      [ 3]  615         jmp     L9AA4
   84EA                     616 L84EA:
   84EA 81 41         [ 2]  617         cmpa    #0x41
   84EC 26 17         [ 3]  618         bne     L8505
   84EE BD 9D 18      [ 6]  619         jsr     L9D18
   84F1 25 09         [ 3]  620         bcs     L84FC
   84F3 7F 00 30      [ 6]  621         clr     (0x0030)
   84F6 7F 00 31      [ 6]  622         clr     (0x0031)
   84F9 7E 85 A4      [ 3]  623         jmp     L85A4
   84FC                     624 L84FC:
   84FC 7F 00 30      [ 6]  625         clr     (0x0030)
   84FF 7F 00 31      [ 6]  626         clr     (0x0031)
   8502 7E 9A 7F      [ 3]  627         jmp     L9A7F
   8505                     628 L8505:
   8505 81 4B         [ 2]  629         cmpa    #0x4B
   8507 26 0B         [ 3]  630         bne     L8514
   8509 BD 9D 18      [ 6]  631         jsr     L9D18
   850C 25 03         [ 3]  632         bcs     L8511
   850E 7E 85 A4      [ 3]  633         jmp     L85A4
   8511                     634 L8511:
   8511 7E 9A 7F      [ 3]  635         jmp     L9A7F
   8514                     636 L8514:
   8514 81 4A         [ 2]  637         cmpa    #0x4A
   8516 26 07         [ 3]  638         bne     L851F
   8518 86 01         [ 2]  639         ldaa    #0x01
   851A 97 AF         [ 3]  640         staa    (0x00AF)
   851C 7E 98 3C      [ 3]  641         jmp     L983C
   851F                     642 L851F:
   851F 81 4E         [ 2]  643         cmpa    #0x4E
   8521 26 0B         [ 3]  644         bne     L852E
   8523 B6 10 8A      [ 4]  645         ldaa    (0x108A)
   8526 8A 02         [ 2]  646         oraa    #0x02
   8528 B7 10 8A      [ 4]  647         staa    (0x108A)
   852B 7E 84 4D      [ 3]  648         jmp     L844D
   852E                     649 L852E:
   852E 81 4F         [ 2]  650         cmpa    #0x4F
   8530 26 06         [ 3]  651         bne     L8538
   8532 BD 9D 18      [ 6]  652         jsr     L9D18
   8535 7E 84 4D      [ 3]  653         jmp     L844D
   8538                     654 L8538:
   8538 81 50         [ 2]  655         cmpa    #0x50
   853A 26 06         [ 3]  656         bne     L8542
   853C BD 9D 18      [ 6]  657         jsr     L9D18
   853F 7E 84 4D      [ 3]  658         jmp     L844D
   8542                     659 L8542:
   8542 81 51         [ 2]  660         cmpa    #0x51
   8544 26 0B         [ 3]  661         bne     L8551
   8546 B6 10 8A      [ 4]  662         ldaa    (0x108A)
   8549 8A 04         [ 2]  663         oraa    #0x04
   854B B7 10 8A      [ 4]  664         staa    (0x108A)
   854E 7E 84 4D      [ 3]  665         jmp     L844D
   8551                     666 L8551:
   8551 81 55         [ 2]  667         cmpa    #0x55
   8553 26 07         [ 3]  668         bne     L855C
   8555 C6 01         [ 2]  669         ldab    #0x01
   8557 D7 B6         [ 3]  670         stab    (0x00B6)
   8559 7E 84 4D      [ 3]  671         jmp     L844D
   855C                     672 L855C:
   855C 81 4C         [ 2]  673         cmpa    #0x4C
   855E 26 19         [ 3]  674         bne     L8579
   8560 7F 00 49      [ 6]  675         clr     (0x0049)
   8563 BD 9D 18      [ 6]  676         jsr     L9D18
   8566 25 0E         [ 3]  677         bcs     L8576
   8568 BD AA E8      [ 6]  678         jsr     LAAE8
   856B BD AB 56      [ 6]  679         jsr     LAB56
   856E 24 06         [ 3]  680         bcc     L8576
   8570 BD AB 25      [ 6]  681         jsr     LAB25
   8573 BD AB 46      [ 6]  682         jsr     LAB46
   8576                     683 L8576:
   8576 7E 84 4D      [ 3]  684         jmp     L844D
   8579                     685 L8579:
   8579 81 52         [ 2]  686         cmpa    #0x52
   857B 26 1A         [ 3]  687         bne     L8597
   857D 7F 00 49      [ 6]  688         clr     (0x0049)
   8580 BD 9D 18      [ 6]  689         jsr     L9D18
   8583 25 0F         [ 3]  690         bcs     L8594
   8585 BD AA E8      [ 6]  691         jsr     LAAE8
   8588 BD AB 56      [ 6]  692         jsr     LAB56
   858B 25 07         [ 3]  693         bcs     L8594
   858D 86 FF         [ 2]  694         ldaa    #0xFF
   858F A7 00         [ 4]  695         staa    0,X
   8591 BD AA E8      [ 6]  696         jsr     LAAE8
   8594                     697 L8594:
   8594 7E 84 4D      [ 3]  698         jmp     L844D
   8597                     699 L8597:
   8597 81 44         [ 2]  700         cmpa    #0x44
   8599 26 09         [ 3]  701         bne     L85A4
   859B 7F 00 49      [ 6]  702         clr     (0x0049)
   859E BD AB AE      [ 6]  703         jsr     LABAE
   85A1 7E 84 4D      [ 3]  704         jmp     L844D
   85A4                     705 L85A4:
   85A4 7D 00 75      [ 6]  706         tst     (0x0075)
   85A7 26 56         [ 3]  707         bne     L85FF
   85A9 7D 00 79      [ 6]  708         tst     (0x0079)
   85AC 26 51         [ 3]  709         bne     L85FF
   85AE 7D 00 30      [ 6]  710         tst     (0x0030)
   85B1 26 07         [ 3]  711         bne     L85BA
   85B3 96 5B         [ 3]  712         ldaa    (0x005B)
   85B5 27 48         [ 3]  713         beq     L85FF
   85B7 7F 00 5B      [ 6]  714         clr     (0x005B)
   85BA                     715 L85BA:
   85BA CC 00 64      [ 3]  716         ldd     #0x0064
   85BD DD 23         [ 4]  717         std     CDTIMR5
   85BF                     718 L85BF:
   85BF DC 23         [ 4]  719         ldd     CDTIMR5
   85C1 27 14         [ 3]  720         beq     L85D7
   85C3 BD 9B 19      [ 6]  721         jsr     L9B19           ; do the random motions if enabled
   85C6 B6 18 04      [ 4]  722         ldaa    PIA0PRA 
   85C9 88 FF         [ 2]  723         eora    #0xFF
   85CB 84 06         [ 2]  724         anda    #0x06
   85CD 81 06         [ 2]  725         cmpa    #0x06
   85CF 26 EE         [ 3]  726         bne     L85BF
   85D1 7F 00 30      [ 6]  727         clr     (0x0030)
   85D4 7E 86 80      [ 3]  728         jmp     L8680
   85D7                     729 L85D7:
   85D7 7F 00 30      [ 6]  730         clr     (0x0030)
   85DA D6 62         [ 3]  731         ldab    (0x0062)
   85DC C8 02         [ 2]  732         eorb    #0x02
   85DE D7 62         [ 3]  733         stab    (0x0062)
   85E0 BD F9 C5      [ 6]  734         jsr     BUTNLIT 
   85E3 C4 02         [ 2]  735         andb    #0x02
   85E5 27 0D         [ 3]  736         beq     L85F4
   85E7 BD AA 18      [ 6]  737         jsr     LAA18
   85EA C6 1E         [ 2]  738         ldab    #0x1E
   85EC BD 8C 22      [ 6]  739         jsr     DLYSECSBY100    ; delay 0.3 sec
   85EF 7F 00 30      [ 6]  740         clr     (0x0030)
   85F2 20 0B         [ 3]  741         bra     L85FF
   85F4                     742 L85F4:
   85F4 BD AA 1D      [ 6]  743         jsr     LAA1D
   85F7 C6 1E         [ 2]  744         ldab    #0x1E
   85F9 BD 8C 22      [ 6]  745         jsr     DLYSECSBY100    ; delay 0.3 sec
   85FC 7F 00 30      [ 6]  746         clr     (0x0030)
   85FF                     747 L85FF:
   85FF BD 9B 19      [ 6]  748         jsr     L9B19           ; do the random motions if enabled
   8602 B6 10 0A      [ 4]  749         ldaa    PORTE
   8605 84 10         [ 2]  750         anda    #0x10
   8607 27 0B         [ 3]  751         beq     L8614
   8609 B6 18 04      [ 4]  752         ldaa    PIA0PRA 
   860C 88 FF         [ 2]  753         eora    #0xFF
   860E 84 07         [ 2]  754         anda    #0x07
   8610 81 06         [ 2]  755         cmpa    #0x06
   8612 26 1C         [ 3]  756         bne     L8630
   8614                     757 L8614:
   8614 7D 00 76      [ 6]  758         tst     (0x0076)
   8617 26 17         [ 3]  759         bne     L8630
   8619 7D 00 75      [ 6]  760         tst     (0x0075)
   861C 26 12         [ 3]  761         bne     L8630
   861E D6 62         [ 3]  762         ldab    (0x0062)
   8620 C4 FC         [ 2]  763         andb    #0xFC
   8622 D7 62         [ 3]  764         stab    (0x0062)
   8624 BD F9 C5      [ 6]  765         jsr     BUTNLIT 
   8627 BD AA 13      [ 6]  766         jsr     LAA13
   862A BD AA 1D      [ 6]  767         jsr     LAA1D
   862D 7E 9A 60      [ 3]  768         jmp     L9A60
   8630                     769 L8630:
   8630 7D 00 31      [ 6]  770         tst     (0x0031)
   8633 26 07         [ 3]  771         bne     L863C
   8635 96 5A         [ 3]  772         ldaa    (0x005A)
   8637 27 47         [ 3]  773         beq     L8680
   8639 7F 00 5A      [ 6]  774         clr     (0x005A)
   863C                     775 L863C:
   863C CC 00 64      [ 3]  776         ldd     #0x0064
   863F DD 23         [ 4]  777         std     CDTIMR5
   8641                     778 L8641:
   8641 DC 23         [ 4]  779         ldd     CDTIMR5
   8643 27 13         [ 3]  780         beq     L8658
   8645 BD 9B 19      [ 6]  781         jsr     L9B19           ; do the random motions if enabled
   8648 B6 18 04      [ 4]  782         ldaa    PIA0PRA 
   864B 88 FF         [ 2]  783         eora    #0xFF
   864D 84 06         [ 2]  784         anda    #0x06
   864F 81 06         [ 2]  785         cmpa    #0x06
   8651 26 EE         [ 3]  786         bne     L8641
   8653 7F 00 31      [ 6]  787         clr     (0x0031)
   8656 20 28         [ 3]  788         bra     L8680
   8658                     789 L8658:
   8658 7F 00 31      [ 6]  790         clr     (0x0031)
   865B D6 62         [ 3]  791         ldab    (0x0062)
   865D C8 01         [ 2]  792         eorb    #0x01
   865F D7 62         [ 3]  793         stab    (0x0062)
   8661 BD F9 C5      [ 6]  794         jsr     BUTNLIT 
   8664 C4 01         [ 2]  795         andb    #0x01
   8666 27 0D         [ 3]  796         beq     L8675
   8668 BD AA 0C      [ 6]  797         jsr     LAA0C
   866B C6 1E         [ 2]  798         ldab    #0x1E
   866D BD 8C 22      [ 6]  799         jsr     DLYSECSBY100    ; delay 0.3 sec
   8670 7F 00 31      [ 6]  800         clr     (0x0031)
   8673 20 0B         [ 3]  801         bra     L8680
   8675                     802 L8675:
   8675 BD AA 13      [ 6]  803         jsr     LAA13
   8678 C6 1E         [ 2]  804         ldab    #0x1E
   867A BD 8C 22      [ 6]  805         jsr     DLYSECSBY100    ; delay 0.3 sec
   867D 7F 00 31      [ 6]  806         clr     (0x0031)
   8680                     807 L8680:
   8680 BD 86 A4      [ 6]  808         jsr     L86A4
   8683 25 1C         [ 3]  809         bcs     L86A1
   8685 7F 00 4E      [ 6]  810         clr     (0x004E)
   8688 BD 99 A6      [ 6]  811         jsr     L99A6
   868B BD 86 C4      [ 6]  812         jsr     L86C4           ; Reset boards 1-10
   868E 5F            [ 2]  813         clrb
   868F D7 62         [ 3]  814         stab    (0x0062)
   8691 BD F9 C5      [ 6]  815         jsr     BUTNLIT 
   8694 C6 FD         [ 2]  816         ldab    #0xFD           ; tape deck STOP
   8696 BD 86 E7      [ 6]  817         jsr     L86E7
   8699 C6 04         [ 2]  818         ldab    #0x04           ; delay 4 secs
   869B BD 8C 02      [ 6]  819         jsr     DLYSECS         ;
   869E 7E 84 7F      [ 3]  820         jmp     L847F
   86A1                     821 L86A1:
   86A1 7E 84 4D      [ 3]  822         jmp     L844D
   86A4                     823 L86A4:
   86A4 BD 9B 19      [ 6]  824         jsr     L9B19           ; do the random motions if enabled
   86A7 7F 00 23      [ 6]  825         clr     CDTIMR5
   86AA 86 19         [ 2]  826         ldaa    #0x19
   86AC 97 24         [ 3]  827         staa    CDTIMR5+1
   86AE B6 10 0A      [ 4]  828         ldaa    PORTE
   86B1 84 80         [ 2]  829         anda    #0x80
   86B3 27 02         [ 3]  830         beq     L86B7
   86B5                     831 L86B5:
   86B5 0D            [ 2]  832         sec
   86B6 39            [ 5]  833         rts
                            834 
   86B7                     835 L86B7:
   86B7 B6 10 0A      [ 4]  836         ldaa    PORTE
   86BA 84 80         [ 2]  837         anda    #0x80
   86BC 26 F7         [ 3]  838         bne     L86B5
   86BE 96 24         [ 3]  839         ldaa    CDTIMR5+1
   86C0 26 F5         [ 3]  840         bne     L86B7
   86C2 0C            [ 2]  841         clc
   86C3 39            [ 5]  842         rts
                            843 
                            844 ; Reset boards 1-10 at:
                            845 ;         0x1080, 0x1084, 0x1088, 0x108c
                            846 ;         0x1090, 0x1094, 0x1098, 0x109c
                            847 ;         0x10a0, 0x10a4
                            848 
   86C4                     849 L86C4:
   86C4 CE 10 80      [ 3]  850         ldx     #0x1080
   86C7                     851 L86C7:
   86C7 86 30         [ 2]  852         ldaa    #0x30
   86C9 A7 01         [ 4]  853         staa    1,X             ; 0x30 -> PIAxCRA, CA2 low, DDR
   86CB A7 03         [ 4]  854         staa    3,X             ; 0x30 -> PIAxCRB, CB2 low, DDR
   86CD 86 FF         [ 2]  855         ldaa    #0xFF
   86CF A7 00         [ 4]  856         staa    0,X             ; 0xFF -> PIAxDDRA, all outputs
   86D1 A7 02         [ 4]  857         staa    2,X             ; 0xFF -> PIAxDDRB, all outputs
   86D3 86 34         [ 2]  858         ldaa    #0x34
   86D5 A7 01         [ 4]  859         staa    1,X             ; 0x34 -> PIAxCRA, CA2 low, PR
   86D7 A7 03         [ 4]  860         staa    3,X             ; 0x34 -> PIAxCRB, CA2 low, PR
   86D9 6F 00         [ 6]  861         clr     0,X             ; 0x00 -> PIAxPRA, all outputs low
   86DB 6F 02         [ 6]  862         clr     2,X             ; 0x00 -> PIAxPRB, all outputs low
   86DD 08            [ 3]  863         inx
   86DE 08            [ 3]  864         inx
   86DF 08            [ 3]  865         inx
   86E0 08            [ 3]  866         inx
   86E1 8C 10 A4      [ 4]  867         cpx     #0x10A4
   86E4 2F E1         [ 3]  868         ble     L86C7
   86E6 39            [ 5]  869         rts
                            870 
                            871 ; Set the tape deck to STOP, PLAY, REWIND, or EJECT
                            872 ;                B =   0xFD, 0xFB,   0xF7, or  0xEF
   86E7                     873 L86E7:
   86E7 36            [ 3]  874         psha
   86E8 BD 9B 19      [ 6]  875         jsr     L9B19           ; do the random motions if enabled
   86EB 96 AC         [ 3]  876         ldaa    (0x00AC)        ; A = diag buffer?
   86ED C1 FB         [ 2]  877         cmpb    #0xFB           ; if bit 2 of B is 0 (PLAY)
   86EF 26 04         [ 3]  878         bne     L86F5
   86F1 84 FE         [ 2]  879         anda    #0xFE           ; clear A bit 0 (top)
   86F3 20 0E         [ 3]  880         bra     L8703
   86F5                     881 L86F5:
   86F5 C1 F7         [ 2]  882         cmpb    #0xF7           ; if bit 3 of B is 0 (REWIND)
   86F7 26 04         [ 3]  883         bne     L86FD
   86F9 84 BF         [ 2]  884         anda    #0xBF           ; clear A bit 6 (middle)
   86FB 20 06         [ 3]  885         bra     L8703
   86FD                     886 L86FD:
   86FD C1 FD         [ 2]  887         cmpb    #0xFD           ; if bit 1 of B is 0 (STOP)
   86FF 26 02         [ 3]  888         bne     L8703
   8701 84 F7         [ 2]  889         anda    #0xF7           ; clear A bit 3 (bottom)
   8703                     890 L8703:
   8703 97 AC         [ 3]  891         staa    (0x00AC)        ; update diag display buffer
   8705 B7 18 06      [ 4]  892         staa    PIA0PRB         ; init bus based on A
   8708 BD 87 3A      [ 6]  893         jsr     L873A           ; clock diagnostic indicator
   870B 96 7A         [ 3]  894         ldaa    (0x007A)        ; buffer for tape deck / av switcher?
   870D 84 01         [ 2]  895         anda    #0x01           ; preserve a/v switcher bit
   870F 97 7A         [ 3]  896         staa    (0x007A)        ; 
   8711 C4 FE         [ 2]  897         andb    #0xFE           ; set bits 7-1 based on B arg
   8713 DA 7A         [ 3]  898         orab    (0x007A)        
   8715 F7 18 06      [ 4]  899         stab    PIA0PRB         ; put that on the bus
   8718 BD 87 75      [ 6]  900         jsr     L8775           ; clock the tape deck
   871B C6 32         [ 2]  901         ldab    #0x32
   871D BD 8C 22      [ 6]  902         jsr     DLYSECSBY100    ; delay 0.5 sec
   8720 C6 FE         [ 2]  903         ldab    #0xFE
   8722 DA 7A         [ 3]  904         orab    (0x007A)        ; all tape bits off
   8724 F7 18 06      [ 4]  905         stab    PIA0PRB         ; unpress tape buttons
   8727 D7 7A         [ 3]  906         stab    (0x007A)
   8729 BD 87 75      [ 6]  907         jsr     L8775           ; clock the tape deck
   872C 96 AC         [ 3]  908         ldaa    (0x00AC)
   872E 8A 49         [ 2]  909         oraa    #0x49           ; reset bits top,mid,bot
   8730 97 AC         [ 3]  910         staa    (0x00AC)
   8732 B7 18 06      [ 4]  911         staa    PIA0PRB 
   8735 BD 87 3A      [ 6]  912         jsr     L873A           ; clock diagnostic indicator
   8738 32            [ 4]  913         pula
   8739 39            [ 5]  914         rts
                            915 
                            916 ; clock diagnostic indicator
   873A                     917 L873A:
   873A B6 18 04      [ 4]  918         ldaa    PIA0PRA 
   873D 8A 20         [ 2]  919         oraa    #0x20
   873F B7 18 04      [ 4]  920         staa    PIA0PRA 
   8742 84 DF         [ 2]  921         anda    #0xDF
   8744 B7 18 04      [ 4]  922         staa    PIA0PRA 
   8747 39            [ 5]  923         rts
                            924 
   8748                     925 L8748:
   8748 36            [ 3]  926         psha
   8749 37            [ 3]  927         pshb
   874A 96 AC         [ 3]  928         ldaa    (0x00AC)        ; update state machine at AC?
                            929                                 ;      gfedcba
   874C 8A 30         [ 2]  930         oraa    #0x30           ; set bb11bbbb
   874E 84 FD         [ 2]  931         anda    #0xFD           ; clr bb11bb0b
   8750 C5 20         [ 2]  932         bitb    #0x20           ; tst bit 5 (f)
   8752 26 02         [ 3]  933         bne     L8756           ; 
   8754 8A 02         [ 2]  934         oraa    #0x02           ; set bit 1 (b)
   8756                     935 L8756:
   8756 C5 04         [ 2]  936         bitb    #0x04           ; tst bit 2 (c)
   8758 26 02         [ 3]  937         bne     L875C
   875A 84 EF         [ 2]  938         anda    #0xEF           ; clr bit 4 (e)
   875C                     939 L875C:
   875C C5 08         [ 2]  940         bitb    #0x08           ; tst bit 3 (d)
   875E 26 02         [ 3]  941         bne     L8762
   8760 84 DF         [ 2]  942         anda    #0xDF           ; clr bit 5 (f)
   8762                     943 L8762:
   8762 B7 18 06      [ 4]  944         staa    PIA0PRB 
   8765 97 AC         [ 3]  945         staa    (0x00AC)
   8767 BD 87 3A      [ 6]  946         jsr     L873A           ; clock diagnostic indicator
   876A 33            [ 4]  947         pulb
   876B F7 18 06      [ 4]  948         stab    PIA0PRB 
   876E D7 7B         [ 3]  949         stab    (0x007B)
   8770 BD 87 83      [ 6]  950         jsr     L8783
   8773 32            [ 4]  951         pula
   8774 39            [ 5]  952         rts
                            953 
                            954 ; High pulse on CB2, clock bits0-4 - 4 tape deck and 1 A/V switcher bit
   8775                     955 L8775:
   8775 B6 18 07      [ 4]  956         ldaa    PIA0CRB 
   8778 8A 38         [ 2]  957         oraa    #0x38           
   877A B7 18 07      [ 4]  958         staa    PIA0CRB         ; CB2 High
   877D 84 F7         [ 2]  959         anda    #0xF7
   877F B7 18 07      [ 4]  960         staa    PIA0CRB         ; CB2 Low
   8782 39            [ 5]  961         rts
                            962 
                            963 ; High pulse on CA2
   8783                     964 L8783:
   8783 B6 18 05      [ 4]  965         ldaa    PIA0CRA 
   8786 8A 38         [ 2]  966         oraa    #0x38
   8788 B7 18 05      [ 4]  967         staa    PIA0CRA         ; CA2 High
   878B 84 F7         [ 2]  968         anda    #0xF7
   878D B7 18 05      [ 4]  969         staa    PIA0CRA         ; CA2 High
   8790 39            [ 5]  970         rts
                            971 
                            972 ; AVSEL1 = 0
   8791                     973 L8791:
   8791 96 7A         [ 3]  974         ldaa    (0x007A)
   8793 84 FE         [ 2]  975         anda    #0xFE
   8795 36            [ 3]  976         psha
   8796 96 AC         [ 3]  977         ldaa    (0x00AC)
   8798 8A 04         [ 2]  978         oraa    #0x04           ; clear segment C (lower right)
   879A 97 AC         [ 3]  979         staa    (0x00AC)
   879C 32            [ 4]  980         pula
   879D                     981 L879D:
   879D 97 7A         [ 3]  982         staa    (0x007A)        
   879F B7 18 06      [ 4]  983         staa    PIA0PRB 
   87A2 BD 87 75      [ 6]  984         jsr     L8775           ; AVSEL1 = low
   87A5 96 AC         [ 3]  985         ldaa    (0x00AC)
   87A7 B7 18 06      [ 4]  986         staa    PIA0PRB 
   87AA BD 87 3A      [ 6]  987         jsr     L873A           ; clock diagnostic indicator
   87AD 39            [ 5]  988         rts
                            989 
   87AE                     990 L87AE:
   87AE 96 7A         [ 3]  991         ldaa    (0x007A)
   87B0 8A 01         [ 2]  992         oraa    #0x01
   87B2 36            [ 3]  993         psha
   87B3 96 AC         [ 3]  994         ldaa    (0x00AC)
   87B5 84 FB         [ 2]  995         anda    #0xFB
   87B7 97 AC         [ 3]  996         staa    (0x00AC)
   87B9 32            [ 4]  997         pula
   87BA 20 E1         [ 3]  998         bra     L879D
                            999 
                           1000 ; SCC init, aux serial
   87BC                    1001 L87BC:
   87BC CE 87 D2      [ 3] 1002         ldx     #L87D2
   87BF                    1003 L87BF:
   87BF A6 00         [ 4] 1004         ldaa    0,X
   87C1 81 FF         [ 2] 1005         cmpa    #0xFF
   87C3 27 0C         [ 3] 1006         beq     L87D1
   87C5 08            [ 3] 1007         inx
   87C6 B7 18 0D      [ 4] 1008         staa    SCCCTRLA
   87C9 A6 00         [ 4] 1009         ldaa    0,X
   87CB 08            [ 3] 1010         inx
   87CC B7 18 0D      [ 4] 1011         staa    SCCCTRLA
   87CF 20 EE         [ 3] 1012         bra     L87BF
   87D1                    1013 L87D1:
   87D1 39            [ 5] 1014         rts
                           1015 
                           1016 ; data table for aux serial config
   87D2                    1017 L87D2:
   87D2 09 8A              1018         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   87D4 01 00              1019         .byte   0x01,0x00       ; irq on special condition only
   87D6 0C 18              1020         .byte   0x0c,0x18       ; Lower byte of time constant
   87D8 0D 00              1021         .byte   0x0d,0x00       ; Upper byte of time constant
   87DA 04 44              1022         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   87DC 0E 63              1023         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   87DE 05 68              1024         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   87E0 0B 56              1025         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   87E2 03 C1              1026         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           1027         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           1028         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   87E4 0F 00              1029         .byte   0x0f,0x00       ; end of table marker
   87E6 FF FF              1030         .byte   0xff,0xff
                           1031 
                           1032 ; SCC init, sync tape data
   87E8                    1033 L87E8:
   87E8 CE F8 57      [ 3] 1034         ldx     #LF857
   87EB                    1035 L87EB:
   87EB A6 00         [ 4] 1036         ldaa    0,X
   87ED 81 FF         [ 2] 1037         cmpa    #0xFF
   87EF 27 0C         [ 3] 1038         beq     L87FD
   87F1 08            [ 3] 1039         inx
   87F2 B7 18 0C      [ 4] 1040         staa    SCCCTRLB
   87F5 A6 00         [ 4] 1041         ldaa    0,X
   87F7 08            [ 3] 1042         inx
   87F8 B7 18 0C      [ 4] 1043         staa    SCCCTRLB
   87FB 20 EE         [ 3] 1044         bra     L87EB
   87FD                    1045 L87FD:
   87FD 20 16         [ 3] 1046         bra     L8815
                           1047 
                           1048 ; data table for sync tape data config
   87FF 09 8A              1049         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   8801 01 10              1050         .byte   0x01,0x10       ; irq on all character received
   8803 0C 18              1051         .byte   0x0c,0x18       ; Lower byte of time constant
   8805 0D 00              1052         .byte   0x0d,0x00       ; Upper byte of time constant
   8807 04 04              1053         .byte   0x04,0x04       ; X1 clock mode, 8-bit sync char, 1 stop bit, no parity
   8809 0E 63              1054         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   880B 05 68              1055         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   880D 0B 01              1056         .byte   0x0b,0x01       ; ~RTxC pin is Recv/Xmit clock, ~TRxC is xmit clk
   880F 03 C1              1057         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
   8811 0F 00              1058         .byte   0x0f,0x00       ; end of table marker
   8813 FF FF              1059         .byte   0xff,0xff
                           1060 
                           1061 ; Install IRQ and SCI interrupt handlers
   8815                    1062 L8815:
   8815 CE 88 3E      [ 3] 1063         ldx     #L883E          ; Install IRQ interrupt handler
   8818 FF 01 28      [ 5] 1064         stx     (0x0128)
   881B 86 7E         [ 2] 1065         ldaa    #0x7E
   881D B7 01 27      [ 4] 1066         staa    (0x0127)
   8820 CE 88 32      [ 3] 1067         ldx     #L8832          ; Install SCI interrupt handler
   8823 FF 01 01      [ 5] 1068         stx     (0x0101)
   8826 B7 01 00      [ 4] 1069         staa    (0x0100)
   8829 B6 10 2D      [ 4] 1070         ldaa    SCCR2           ; enable SCI receive interrupts
   882C 8A 20         [ 2] 1071         oraa    #0x20
   882E B7 10 2D      [ 4] 1072         staa    SCCR2  
   8831 39            [ 5] 1073         rts
                           1074 
                           1075 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1076 
                           1077 ; SCI Interrupt handler, normal serial
                           1078 
   8832                    1079 L8832:
   8832 B6 10 2E      [ 4] 1080         ldaa    SCSR
   8835 B6 10 2F      [ 4] 1081         ldaa    SCDR
   8838 7C 00 48      [ 6] 1082         inc     (0x0048)        ; increment bytes received
   883B 7E 88 62      [ 3] 1083         jmp     L8862           ; handle incoming data the same from SCI or SCC
                           1084 
                           1085 ; IRQ Interrupt handler, aux serial
                           1086 
   883E                    1087 L883E:
   883E 86 01         [ 2] 1088         ldaa    #0x01
   8840 B7 18 0C      [ 4] 1089         staa    SCCCTRLB
   8843 B6 18 0C      [ 4] 1090         ldaa    SCCCTRLB        ; read 3 error bits
   8846 84 70         [ 2] 1091         anda    #0x70
   8848 26 1F         [ 3] 1092         bne     L8869           ; if errors, jump ahead
   884A 86 0A         [ 2] 1093         ldaa    #0x0A
   884C B7 18 0C      [ 4] 1094         staa    SCCCTRLB
   884F B6 18 0C      [ 4] 1095         ldaa    SCCCTRLB        ; read clocks missing bits
   8852 84 C0         [ 2] 1096         anda    #0xC0
   8854 26 22         [ 3] 1097         bne     L8878           ; clocks missing, jump ahead
   8856 B6 18 0C      [ 4] 1098         ldaa    SCCCTRLB        ; check character available
   8859 44            [ 2] 1099         lsra
   885A 24 35         [ 3] 1100         bcc     L8891           ; if no char available, clear register and exit
   885C 7C 00 48      [ 6] 1101         inc     (0x0048)        ; increment bytes received
   885F B6 18 0E      [ 4] 1102         ldaa    SCCDATAB        ; read good data byte
                           1103 
                           1104 ; handle incoming data byte
   8862                    1105 L8862:
   8862 BD F9 6F      [ 6] 1106         jsr     SERIALW         ; echo it to serial
   8865 97 4A         [ 3] 1107         staa    (0x004A)        ; store it here
   8867 20 2D         [ 3] 1108         bra     L8896
                           1109 
                           1110 ; errors reading from SCC
   8869                    1111 L8869:
   8869 B6 18 0E      [ 4] 1112         ldaa    SCCDATAB        ; read bad byte
   886C 86 30         [ 2] 1113         ldaa    #0x30
   886E B7 18 0C      [ 4] 1114         staa    SCCCTRLB        ; send error reset (Register 0)
   8871 86 07         [ 2] 1115         ldaa    #0x07
   8873 BD F9 6F      [ 6] 1116         jsr     SERIALW         ; send bell to serial
   8876 0C            [ 2] 1117         clc
   8877 3B            [12] 1118         rti
                           1119 
                           1120 ; clocks missing?
   8878                    1121 L8878:
   8878 86 07         [ 2] 1122         ldaa    #0x07
   887A BD F9 6F      [ 6] 1123         jsr     SERIALW         ; send bell to serial
   887D 86 0E         [ 2] 1124         ldaa    #0x0E
   887F B7 18 0C      [ 4] 1125         staa    SCCCTRLB
   8882 86 43         [ 2] 1126         ldaa    #0x43
   8884 B7 18 0C      [ 4] 1127         staa    SCCCTRLB        ; send reset missing clock
   8887 B6 18 0E      [ 4] 1128         ldaa    SCCDATAB
   888A 86 07         [ 2] 1129         ldaa    #0x07
   888C BD F9 6F      [ 6] 1130         jsr     SERIALW         ; send 2nd bell to serial
   888F 0D            [ 2] 1131         sec
   8890 3B            [12] 1132         rti
                           1133 
                           1134 ; clear receive data reg and return
   8891                    1135 L8891:
   8891 B6 18 0E      [ 4] 1136         ldaa    SCCDATAB
   8894 0C            [ 2] 1137         clc
   8895 3B            [12] 1138         rti
                           1139 
                           1140 ; Parse byte from tape
   8896                    1141 L8896:
   8896 84 7F         [ 2] 1142         anda    #0x7F           ; should all be 7-bits, ignore bit 7
   8898 81 24         [ 2] 1143         cmpa    #0x24           ;'$'
   889A 27 44         [ 3] 1144         beq     L88E0           ; count it and exit
   889C 81 25         [ 2] 1145         cmpa    #0x25           ;'%'
   889E 27 40         [ 3] 1146         beq     L88E0           ; count it and exit
   88A0 81 20         [ 2] 1147         cmpa    #0x20           ;' '
   88A2 27 3A         [ 3] 1148         beq     L88DE           ; just exit
   88A4 81 30         [ 2] 1149         cmpa    #0x30           ;'0'
   88A6 25 35         [ 3] 1150         bcs     L88DD           ; < 0x30, exit
   88A8 97 12         [ 3] 1151         staa    (0x0012)        ; store it here
   88AA 96 4D         [ 3] 1152         ldaa    (0x004D)        ; check number of '$' or '%'
   88AC 81 02         [ 2] 1153         cmpa    #0x02
   88AE 25 09         [ 3] 1154         bcs     L88B9           ; < 2, jump ahead
   88B0 7F 00 4D      [ 6] 1155         clr     (0x004D)        ; clear number of '$' or '%'
   88B3 96 12         [ 3] 1156         ldaa    (0x0012)
   88B5 97 49         [ 3] 1157         staa    (0x0049)        ; store the character here - character is 0x30 or higher
   88B7 20 24         [ 3] 1158         bra     L88DD           ; exit
   88B9                    1159 L88B9:
   88B9 7D 00 4E      [ 6] 1160         tst     (0x004E)        ; is 4E 0??? (related to random motions?)
   88BC 27 1F         [ 3] 1161         beq     L88DD           ; if so, exit
   88BE 86 78         [ 2] 1162         ldaa    #0x78           ; 120
   88C0 97 63         [ 3] 1163         staa    (0x0063)        ; start 12 second timer
   88C2 97 64         [ 3] 1164         staa    (0x0064)        ; reset boards before next random motion
   88C4 96 12         [ 3] 1165         ldaa    (0x0012)
   88C6 81 40         [ 2] 1166         cmpa    #0x40
   88C8 24 07         [ 3] 1167         bcc     L88D1           ; if char >= 0x40, jump ahead
   88CA 97 4C         [ 3] 1168         staa    (0x004C)        ; store code from 0x30 to 0x3F here
   88CC 7F 00 4D      [ 6] 1169         clr     (0x004D)        ; more code to process
   88CF 20 0C         [ 3] 1170         bra     L88DD           ; go to rti
   88D1                    1171 L88D1:
   88D1 81 60         [ 2] 1172         cmpa    #0x60       
   88D3 24 08         [ 3] 1173         bcc     L88DD           ; if char >= 0x60, exit
   88D5 97 4B         [ 3] 1174         staa    (0x004B)        ; store code from 0x40 to 0x5F here
   88D7 7F 00 4D      [ 6] 1175         clr     (0x004D)        ; more code to process
   88DA BD 88 E5      [ 6] 1176         jsr     L88E5           ; jump ahead
   88DD                    1177 L88DD:
   88DD 3B            [12] 1178         rti
                           1179 
   88DE                    1180 L88DE:
   88DE 20 FD         [ 3] 1181         bra     L88DD           ; go to rti
   88E0                    1182 L88E0:
   88E0 7C 00 4D      [ 6] 1183         inc     (0x004D)        ; count $ or %
   88E3 20 F9         [ 3] 1184         bra     L88DE           ; exit
   88E5                    1185 L88E5:
   88E5 D6 4B         [ 3] 1186         ldab    (0x004B)        
   88E7 96 4C         [ 3] 1187         ldaa    (0x004C)
   88E9 7D 04 5C      [ 6] 1188         tst     (0x045C)        ; R12/CNR?
   88EC 27 0D         [ 3] 1189         beq     L88FB           ; if R12, jump ahead
   88EE 81 3C         [ 2] 1190         cmpa    #0x3C
   88F0 25 09         [ 3] 1191         bcs     L88FB           ; if char < 0x3C, jump ahead
   88F2 81 3F         [ 2] 1192         cmpa    #0x3F
   88F4 22 05         [ 3] 1193         bhi     L88FB           ; if char > 0x3F, jump ahead 
   88F6 BD 89 93      [ 6] 1194         jsr     L8993           ; process char (0x3C-0x3F)
   88F9 20 65         [ 3] 1195         bra     L8960           ; rts
   88FB                    1196 L88FB:
   88FB 1A 83 30 48   [ 5] 1197         cpd     #0x3048
   88FF 27 79         [ 3] 1198         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8901 1A 83 31 48   [ 5] 1199         cpd     #0x3148
   8905 27 5A         [ 3] 1200         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8907 1A 83 34 4D   [ 5] 1201         cpd     #0x344D
   890B 27 6D         [ 3] 1202         beq     L897A           ; turn off 3 bits on boards 1,3,4
   890D 1A 83 35 4D   [ 5] 1203         cpd     #0x354D
   8911 27 4E         [ 3] 1204         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8913 1A 83 36 4D   [ 5] 1205         cpd     #0x364D
   8917 27 61         [ 3] 1206         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8919 1A 83 37 4D   [ 5] 1207         cpd     #0x374D
   891D 27 42         [ 3] 1208         beq     L8961           ; turn on 3 bits on boards 1,3,4
   891F CE 10 80      [ 3] 1209         ldx     #0x1080
   8922 D6 4C         [ 3] 1210         ldab    (0x004C)
   8924 C0 30         [ 2] 1211         subb    #0x30
   8926 54            [ 2] 1212         lsrb
   8927 58            [ 2] 1213         aslb
   8928 58            [ 2] 1214         aslb
   8929 3A            [ 3] 1215         abx
   892A D6 4B         [ 3] 1216         ldab    (0x004B)
   892C C1 50         [ 2] 1217         cmpb    #0x50
   892E 24 30         [ 3] 1218         bcc     L8960           ; if char >= 0x50, return
   8930 C1 47         [ 2] 1219         cmpb    #0x47           
   8932 23 02         [ 3] 1220         bls     L8936           ; if char <= 0x47, skip increments
   8934 08            [ 3] 1221         inx                     ; skip to port B of this PIA
   8935 08            [ 3] 1222         inx
   8936                    1223 L8936:
   8936 C0 40         [ 2] 1224         subb    #0x40           ; 
   8938 C4 07         [ 2] 1225         andb    #0x07
   893A 4F            [ 2] 1226         clra
   893B 0D            [ 2] 1227         sec
   893C 49            [ 2] 1228         rola
   893D 5D            [ 2] 1229         tstb
   893E 27 04         [ 3] 1230         beq     L8944  
   8940                    1231 L8940:
   8940 49            [ 2] 1232         rola
   8941 5A            [ 2] 1233         decb
   8942 26 FC         [ 3] 1234         bne     L8940  
   8944                    1235 L8944:
   8944 97 50         [ 3] 1236         staa    (0x0050)
   8946 96 4C         [ 3] 1237         ldaa    (0x004C)
   8948 84 01         [ 2] 1238         anda    #0x01
   894A 27 08         [ 3] 1239         beq     L8954
                           1240 ; set bit to a 1 using the mask
   894C A6 00         [ 4] 1241         ldaa    0,X
   894E 9A 50         [ 3] 1242         oraa    (0x0050)
   8950 A7 00         [ 4] 1243         staa    0,X
   8952 20 0C         [ 3] 1244         bra     L8960
                           1245 ; set bit to 0 using the mask
   8954                    1246 L8954:
   8954 96 50         [ 3] 1247         ldaa    (0x0050)
   8956 88 FF         [ 2] 1248         eora    #0xFF
   8958 97 50         [ 3] 1249         staa    (0x0050)
   895A A6 00         [ 4] 1250         ldaa    0,X
   895C 94 50         [ 3] 1251         anda    (0x0050)
   895E A7 00         [ 4] 1252         staa    0,X
   8960                    1253 L8960:
   8960 39            [ 5] 1254         rts
                           1255 
                           1256 ; turn on 3 bits on boards 1,3,4
   8961                    1257 L8961:
   8961 B6 10 82      [ 4] 1258         ldaa    (0x1082)
   8964 8A 01         [ 2] 1259         oraa    #0x01           ; board 1, PIA A, bit 0
   8966 B7 10 82      [ 4] 1260         staa    (0x1082)
   8969 B6 10 8A      [ 4] 1261         ldaa    (0x108A)
   896C 8A 20         [ 2] 1262         oraa    #0x20           ; board 3, PIA B, bit 5
   896E B7 10 8A      [ 4] 1263         staa    (0x108A)
   8971 B6 10 8E      [ 4] 1264         ldaa    (0x108E)        ; board 4, PIA B, bit 5
   8974 8A 20         [ 2] 1265         oraa    #0x20
   8976 B7 10 8E      [ 4] 1266         staa    (0x108E)
   8979 39            [ 5] 1267         rts
                           1268 
                           1269 ; turn off 3 bits on boards 1,3,4
   897A                    1270 L897A:
   897A B6 10 82      [ 4] 1271         ldaa    (0x1082)
   897D 84 FE         [ 2] 1272         anda    #0xFE
   897F B7 10 82      [ 4] 1273         staa    (0x1082)
   8982 B6 10 8A      [ 4] 1274         ldaa    (0x108A)
   8985 84 DF         [ 2] 1275         anda    #0xDF
   8987 B7 10 8A      [ 4] 1276         staa    (0x108A)
   898A B6 10 8E      [ 4] 1277         ldaa    (0x108E)
   898D 84 DF         [ 2] 1278         anda    #0xDF
   898F B7 10 8E      [ 4] 1279         staa    (0x108E)
   8992 39            [ 5] 1280         rts
                           1281 
                           1282 ; process 0x3C-0x3F in CNR mode
   8993                    1283 L8993:
   8993 3C            [ 4] 1284         pshx
   8994 81 3D         [ 2] 1285         cmpa    #0x3D
   8996 22 05         [ 3] 1286         bhi     L899D           ; if char > 0x3D use second table
   8998 CE F7 80      [ 3] 1287         ldx     #LF780          ; table at the end
   899B 20 03         [ 3] 1288         bra     L89A0           ; else use first table
   899D                    1289 L899D:
   899D CE F7 A0      [ 3] 1290         ldx     #LF7A0          ; table at the end
   89A0                    1291 L89A0:
   89A0 C0 40         [ 2] 1292         subb    #0x40           
   89A2 58            [ 2] 1293         aslb
   89A3 3A            [ 3] 1294         abx
   89A4 81 3C         [ 2] 1295         cmpa    #0x3C
   89A6 27 34         [ 3] 1296         beq     L89DC           ; board 7 - turn off A & B with table value mask 
   89A8 81 3D         [ 2] 1297         cmpa    #0x3D
   89AA 27 0A         [ 3] 1298         beq     L89B6           ; board 7 - turn on A & B with table value mask
   89AC 81 3E         [ 2] 1299         cmpa    #0x3E
   89AE 27 4B         [ 3] 1300         beq     L89FB           ; board 8 - turn off A & B with table value mask 
   89B0 81 3F         [ 2] 1301         cmpa    #0x3F
   89B2 27 15         [ 3] 1302         beq     L89C9           ; board 8 - turn on A & B with table value mask
   89B4 38            [ 5] 1303         pulx
   89B5 39            [ 5] 1304         rts
                           1305 
                           1306 ; board 7 - turn on A & B with table value mask
   89B6                    1307 L89B6:
   89B6 B6 10 98      [ 4] 1308         ldaa    (0x1098)
   89B9 AA 00         [ 4] 1309         oraa    0,X
   89BB B7 10 98      [ 4] 1310         staa    (0x1098)
   89BE 08            [ 3] 1311         inx
   89BF B6 10 9A      [ 4] 1312         ldaa    (0x109A)
   89C2 AA 00         [ 4] 1313         oraa    0,X
   89C4 B7 10 9A      [ 4] 1314         staa    (0x109A)
   89C7 38            [ 5] 1315         pulx
   89C8 39            [ 5] 1316         rts
                           1317 
                           1318 ; board 8 - turn on A & B with table value mask
   89C9                    1319 L89C9:
   89C9 B6 10 9C      [ 4] 1320         ldaa    (0x109C)
   89CC AA 00         [ 4] 1321         oraa    0,X
   89CE B7 10 9C      [ 4] 1322         staa    (0x109C)
   89D1 08            [ 3] 1323         inx
   89D2 B6 10 9E      [ 4] 1324         ldaa    (0x109E)
   89D5 AA 00         [ 4] 1325         oraa    0,X
   89D7 B7 10 9E      [ 4] 1326         staa    (0x109E)
   89DA 38            [ 5] 1327         pulx
   89DB 39            [ 5] 1328         rts
                           1329 
                           1330 ; board 7 - turn off A & B with table value mask
   89DC                    1331 L89DC:
   89DC E6 00         [ 4] 1332         ldab    0,X
   89DE C8 FF         [ 2] 1333         eorb    #0xFF
   89E0 D7 12         [ 3] 1334         stab    (0x0012)
   89E2 B6 10 98      [ 4] 1335         ldaa    (0x1098)
   89E5 94 12         [ 3] 1336         anda    (0x0012)
   89E7 B7 10 98      [ 4] 1337         staa    (0x1098)
   89EA 08            [ 3] 1338         inx
   89EB E6 00         [ 4] 1339         ldab    0,X
   89ED C8 FF         [ 2] 1340         eorb    #0xFF
   89EF D7 12         [ 3] 1341         stab    (0x0012)
   89F1 B6 10 9A      [ 4] 1342         ldaa    (0x109A)
   89F4 94 12         [ 3] 1343         anda    (0x0012)
   89F6 B7 10 9A      [ 4] 1344         staa    (0x109A)
   89F9 38            [ 5] 1345         pulx
   89FA 39            [ 5] 1346         rts
                           1347 
                           1348 ; board 8 - turn off A & B with table value mask
   89FB                    1349 L89FB:
   89FB E6 00         [ 4] 1350         ldab    0,X
   89FD C8 FF         [ 2] 1351         eorb    #0xFF
   89FF D7 12         [ 3] 1352         stab    (0x0012)
   8A01 B6 10 9C      [ 4] 1353         ldaa    (0x109C)
   8A04 94 12         [ 3] 1354         anda    (0x0012)
   8A06 B7 10 9C      [ 4] 1355         staa    (0x109C)
   8A09 08            [ 3] 1356         inx
   8A0A E6 00         [ 4] 1357         ldab    0,X
   8A0C C8 FF         [ 2] 1358         eorb    #0xFF
   8A0E D7 12         [ 3] 1359         stab    (0x0012)
   8A10 B6 10 9E      [ 4] 1360         ldaa    (0x109E)
   8A13 94 12         [ 3] 1361         anda    (0x0012)
   8A15 B7 10 9E      [ 4] 1362         staa    (0x109E)
   8A18 38            [ 5] 1363         pulx
   8A19 39            [ 5] 1364         rts
                           1365 
                           1366 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1367 
   8A1A                    1368 L8A1A:
                           1369 ; Parse text with compressed ANSI stuff from table location in X
   8A1A 3C            [ 4] 1370         pshx
   8A1B                    1371 L8A1B:
   8A1B 86 04         [ 2] 1372         ldaa    #0x04
   8A1D B5 18 0D      [ 4] 1373         bita    SCCCTRLA
   8A20 27 F9         [ 3] 1374         beq     L8A1B  
   8A22 A6 00         [ 4] 1375         ldaa    0,X     
   8A24 26 03         [ 3] 1376         bne     L8A29           ; if not nul, continue
   8A26 7E 8B 21      [ 3] 1377         jmp     L8B21           ; else jump to exit
                           1378 ; process ^0123 into ESC[01;23H - ANSI Cursor positioning - (1 based)
   8A29                    1379 L8A29:
   8A29 08            [ 3] 1380         inx
   8A2A 81 5E         [ 2] 1381         cmpa    #0x5E           ; is it a '^' ?
   8A2C 26 1D         [ 3] 1382         bne     L8A4B           ; no, jump ahead
   8A2E A6 00         [ 4] 1383         ldaa    0,X             ; yes, get the next char
   8A30 08            [ 3] 1384         inx
   8A31 B7 05 92      [ 4] 1385         staa    (0x0592)    
   8A34 A6 00         [ 4] 1386         ldaa    0,X     
   8A36 08            [ 3] 1387         inx
   8A37 B7 05 93      [ 4] 1388         staa    (0x0593)
   8A3A A6 00         [ 4] 1389         ldaa    0,X     
   8A3C 08            [ 3] 1390         inx
   8A3D B7 05 95      [ 4] 1391         staa    (0x0595)
   8A40 A6 00         [ 4] 1392         ldaa    0,X     
   8A42 08            [ 3] 1393         inx
   8A43 B7 05 96      [ 4] 1394         staa    (0x0596)
   8A46 BD 8B 23      [ 6] 1395         jsr     L8B23
   8A49 20 D0         [ 3] 1396         bra     L8A1B  
                           1397 ; process @...
   8A4B                    1398 L8A4B:
   8A4B 81 40         [ 2] 1399         cmpa    #0x40           ; is it a '@' ?
   8A4D 26 3B         [ 3] 1400         bne     L8A8A  
   8A4F 1A EE 00      [ 6] 1401         ldy     0,X
   8A52 08            [ 3] 1402         inx
   8A53 08            [ 3] 1403         inx
   8A54 86 30         [ 2] 1404         ldaa    #0x30
   8A56 97 B1         [ 3] 1405         staa    (0x00B1)
   8A58 18 A6 00      [ 5] 1406         ldaa    0,Y
   8A5B                    1407 L8A5B:
   8A5B 81 64         [ 2] 1408         cmpa    #0x64
   8A5D 25 07         [ 3] 1409         bcs     L8A66  
   8A5F 7C 00 B1      [ 6] 1410         inc     (0x00B1)
   8A62 80 64         [ 2] 1411         suba    #0x64
   8A64 20 F5         [ 3] 1412         bra     L8A5B  
   8A66                    1413 L8A66:
   8A66 36            [ 3] 1414         psha
   8A67 96 B1         [ 3] 1415         ldaa    (0x00B1)
   8A69 BD 8B 3B      [ 6] 1416         jsr     L8B3B
   8A6C 86 30         [ 2] 1417         ldaa    #0x30
   8A6E 97 B1         [ 3] 1418         staa    (0x00B1)
   8A70 32            [ 4] 1419         pula
   8A71                    1420 L8A71:
   8A71 81 0A         [ 2] 1421         cmpa    #0x0A
   8A73 25 07         [ 3] 1422         bcs     L8A7C  
   8A75 7C 00 B1      [ 6] 1423         inc     (0x00B1)
   8A78 80 0A         [ 2] 1424         suba    #0x0A
   8A7A 20 F5         [ 3] 1425         bra     L8A71  
   8A7C                    1426 L8A7C:
   8A7C 36            [ 3] 1427         psha
   8A7D 96 B1         [ 3] 1428         ldaa    (0x00B1)
   8A7F BD 8B 3B      [ 6] 1429         jsr     L8B3B
   8A82 32            [ 4] 1430         pula
   8A83 8B 30         [ 2] 1431         adda    #0x30
   8A85 BD 8B 3B      [ 6] 1432         jsr     L8B3B
   8A88 20 91         [ 3] 1433         bra     L8A1B
                           1434 ; process |...
   8A8A                    1435 L8A8A:
   8A8A 81 7C         [ 2] 1436         cmpa    #0x7C           ; is it a '|' ?
   8A8C 26 59         [ 3] 1437         bne     L8AE7  
   8A8E 1A EE 00      [ 6] 1438         ldy     0,X     
   8A91 08            [ 3] 1439         inx
   8A92 08            [ 3] 1440         inx
   8A93 86 30         [ 2] 1441         ldaa    #0x30
   8A95 97 B1         [ 3] 1442         staa    (0x00B1)
   8A97 18 EC 00      [ 6] 1443         ldd     0,Y     
   8A9A                    1444 L8A9A:
   8A9A 1A 83 27 10   [ 5] 1445         cpd     #0x2710
   8A9E 25 08         [ 3] 1446         bcs     L8AA8  
   8AA0 7C 00 B1      [ 6] 1447         inc     (0x00B1)
   8AA3 83 27 10      [ 4] 1448         subd    #0x2710
   8AA6 20 F2         [ 3] 1449         bra     L8A9A  
   8AA8                    1450 L8AA8:
   8AA8 36            [ 3] 1451         psha
   8AA9 96 B1         [ 3] 1452         ldaa    (0x00B1)
   8AAB BD 8B 3B      [ 6] 1453         jsr     L8B3B
   8AAE 86 30         [ 2] 1454         ldaa    #0x30
   8AB0 97 B1         [ 3] 1455         staa    (0x00B1)
   8AB2 32            [ 4] 1456         pula
   8AB3                    1457 L8AB3:
   8AB3 1A 83 03 E8   [ 5] 1458         cpd     #0x03E8
   8AB7 25 08         [ 3] 1459         bcs     L8AC1  
   8AB9 7C 00 B1      [ 6] 1460         inc     (0x00B1)
   8ABC 83 03 E8      [ 4] 1461         subd    #0x03E8
   8ABF 20 F2         [ 3] 1462         bra     L8AB3  
   8AC1                    1463 L8AC1:
   8AC1 36            [ 3] 1464         psha
   8AC2 96 B1         [ 3] 1465         ldaa    (0x00B1)
   8AC4 BD 8B 3B      [ 6] 1466         jsr     L8B3B
   8AC7 86 30         [ 2] 1467         ldaa    #0x30
   8AC9 97 B1         [ 3] 1468         staa    (0x00B1)
   8ACB 32            [ 4] 1469         pula
   8ACC                    1470 L8ACC:
   8ACC 1A 83 00 64   [ 5] 1471         cpd     #0x0064
   8AD0 25 08         [ 3] 1472         bcs     L8ADA  
   8AD2 7C 00 B1      [ 6] 1473         inc     (0x00B1)
   8AD5 83 00 64      [ 4] 1474         subd    #0x0064
   8AD8 20 F2         [ 3] 1475         bra     L8ACC  
   8ADA                    1476 L8ADA:
   8ADA 96 B1         [ 3] 1477         ldaa    (0x00B1)
   8ADC BD 8B 3B      [ 6] 1478         jsr     L8B3B
   8ADF 86 30         [ 2] 1479         ldaa    #0x30
   8AE1 97 B1         [ 3] 1480         staa    (0x00B1)
   8AE3 17            [ 2] 1481         tba
   8AE4 7E 8A 71      [ 3] 1482         jmp     L8A71
                           1483 ; process ~...
   8AE7                    1484 L8AE7:
   8AE7 81 7E         [ 2] 1485         cmpa    #0x7E           ; is it a '~' ?
   8AE9 26 18         [ 3] 1486         bne     L8B03  
   8AEB E6 00         [ 4] 1487         ldab    0,X     
   8AED C0 30         [ 2] 1488         subb    #0x30
   8AEF 08            [ 3] 1489         inx
   8AF0 1A EE 00      [ 6] 1490         ldy     0,X     
   8AF3 08            [ 3] 1491         inx
   8AF4 08            [ 3] 1492         inx
   8AF5                    1493 L8AF5:
   8AF5 18 A6 00      [ 5] 1494         ldaa    0,Y     
   8AF8 18 08         [ 4] 1495         iny
   8AFA BD 8B 3B      [ 6] 1496         jsr     L8B3B
   8AFD 5A            [ 2] 1497         decb
   8AFE 26 F5         [ 3] 1498         bne     L8AF5  
   8B00 7E 8A 1B      [ 3] 1499         jmp     L8A1B
                           1500 ; process %...
   8B03                    1501 L8B03:
   8B03 81 25         [ 2] 1502         cmpa    #0x25           ; is it a '%' ?
   8B05 26 14         [ 3] 1503         bne     L8B1B  
   8B07 CE 05 90      [ 3] 1504         ldx     #0x0590
   8B0A CC 1B 5B      [ 3] 1505         ldd     #0x1B5B
   8B0D ED 00         [ 5] 1506         std     0,X     
   8B0F 86 4B         [ 2] 1507         ldaa    #0x4B
   8B11 A7 02         [ 4] 1508         staa    2,X
   8B13 6F 03         [ 6] 1509         clr     3,X
   8B15 BD 8A 1A      [ 6] 1510         jsr     L8A1A  
   8B18 7E 8A 1B      [ 3] 1511         jmp     L8A1B
   8B1B                    1512 L8B1B:
   8B1B B7 18 0F      [ 4] 1513         staa    SCCDATAA
   8B1E 7E 8A 1B      [ 3] 1514         jmp     L8A1B
   8B21                    1515 L8B21:
   8B21 38            [ 5] 1516         pulx
   8B22 39            [ 5] 1517         rts
                           1518 
                           1519 ; generate cursor positioning code
   8B23                    1520 L8B23:
   8B23 3C            [ 4] 1521         pshx
   8B24 CE 05 90      [ 3] 1522         ldx     #0x0590
   8B27 CC 1B 5B      [ 3] 1523         ldd     #0x1B5B
   8B2A ED 00         [ 5] 1524         std     0,X     
   8B2C 86 48         [ 2] 1525         ldaa    #0x48           ;'H'
   8B2E A7 07         [ 4] 1526         staa    7,X
   8B30 86 3B         [ 2] 1527         ldaa    #0x3B           ;';'
   8B32 A7 04         [ 4] 1528         staa    4,X
   8B34 6F 08         [ 6] 1529         clr     8,X
   8B36 BD 8A 1A      [ 6] 1530         jsr     L8A1A           ;012345678 - esc[01;23H;
   8B39 38            [ 5] 1531         pulx
   8B3A 39            [ 5] 1532         rts
                           1533 
                           1534 ;
   8B3B                    1535 L8B3B:
   8B3B 36            [ 3] 1536         psha
   8B3C                    1537 L8B3C:
   8B3C 86 04         [ 2] 1538         ldaa    #0x04
   8B3E B5 18 0D      [ 4] 1539         bita    SCCCTRLA
   8B41 27 F9         [ 3] 1540         beq     L8B3C
   8B43 32            [ 4] 1541         pula
   8B44 B7 18 0F      [ 4] 1542         staa    SCCDATAA
   8B47 39            [ 5] 1543         rts
                           1544 
   8B48                    1545 L8B48:
   8B48 BD A3 2E      [ 6] 1546         jsr     LA32E
                           1547 
   8B4B BD 8D E4      [ 6] 1548         jsr     LCDMSG1 
   8B4E 4C 69 67 68 74 20  1549         .ascis  'Light Diagnostic'
        44 69 61 67 6E 6F
        73 74 69 E3
                           1550 
   8B5E BD 8D DD      [ 6] 1551         jsr     LCDMSG2 
   8B61 43 75 72 74 61 69  1552         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           1553 
   8B71 C6 14         [ 2] 1554         ldab    #0x14
   8B73 BD 8C 30      [ 6] 1555         jsr     DLYSECSBY2      ; delay 10 sec
   8B76 C6 FF         [ 2] 1556         ldab    #0xFF
   8B78 F7 10 98      [ 4] 1557         stab    (0x1098)
   8B7B F7 10 9A      [ 4] 1558         stab    (0x109A)
   8B7E F7 10 9C      [ 4] 1559         stab    (0x109C)
   8B81 F7 10 9E      [ 4] 1560         stab    (0x109E)
   8B84 BD F9 C5      [ 6] 1561         jsr     BUTNLIT 
   8B87 B6 18 04      [ 4] 1562         ldaa    PIA0PRA 
   8B8A 8A 40         [ 2] 1563         oraa    #0x40
   8B8C B7 18 04      [ 4] 1564         staa    PIA0PRA 
                           1565 
   8B8F BD 8D E4      [ 6] 1566         jsr     LCDMSG1 
   8B92 20 50 72 65 73 73  1567         .ascis  ' Press ENTER to '
        20 45 4E 54 45 52
        20 74 6F A0
                           1568 
   8BA2 BD 8D DD      [ 6] 1569         jsr     LCDMSG2 
   8BA5 74 75 72 6E 20 6C  1570         .ascis  'turn lights  off'
        69 67 68 74 73 20
        20 6F 66 E6
                           1571 
   8BB5                    1572 L8BB5:
   8BB5 BD 8E 95      [ 6] 1573         jsr     L8E95
   8BB8 81 0D         [ 2] 1574         cmpa    #0x0D
   8BBA 26 F9         [ 3] 1575         bne     L8BB5  
   8BBC BD A3 41      [ 6] 1576         jsr     LA341
   8BBF 39            [ 5] 1577         rts
                           1578 
                           1579 ; setup IRQ handlers!
   8BC0                    1580 L8BC0:
   8BC0 86 80         [ 2] 1581         ldaa    #0x80
   8BC2 B7 10 22      [ 4] 1582         staa    TMSK1
   8BC5 CE AB CC      [ 3] 1583         ldx     #LABCC
   8BC8 FF 01 19      [ 5] 1584         stx     (0x0119)        ; setup T1OC handler
   8BCB CE AD 0C      [ 3] 1585         ldx     #LAD0C
                           1586 
   8BCE FF 01 16      [ 5] 1587         stx     (0x0116)        ; setup T2OC handler
   8BD1 CE AD 0C      [ 3] 1588         ldx     #LAD0C
   8BD4 FF 01 2E      [ 5] 1589         stx     (0x012E)        ; doubles as SWI handler
   8BD7 86 7E         [ 2] 1590         ldaa    #0x7E
   8BD9 B7 01 18      [ 4] 1591         staa    (0x0118)
   8BDC B7 01 15      [ 4] 1592         staa    (0x0115)
   8BDF B7 01 2D      [ 4] 1593         staa    (0x012D)
   8BE2 4F            [ 2] 1594         clra
   8BE3 5F            [ 2] 1595         clrb
   8BE4 DD 1B         [ 4] 1596         std     CDTIMR1         ; Reset all the countdown timers
   8BE6 DD 1D         [ 4] 1597         std     CDTIMR2
   8BE8 DD 1F         [ 4] 1598         std     CDTIMR3
   8BEA DD 21         [ 4] 1599         std     CDTIMR4
   8BEC DD 23         [ 4] 1600         std     CDTIMR5
                           1601 
   8BEE                    1602 L8BEE:
   8BEE 86 C0         [ 2] 1603         ldaa    #0xC0
   8BF0 B7 10 23      [ 4] 1604         staa    TFLG1
   8BF3 39            [ 5] 1605         rts
                           1606 
   8BF4                    1607 L8BF4:
   8BF4 B6 10 0A      [ 4] 1608         ldaa    PORTE
   8BF7 88 FF         [ 2] 1609         eora    #0xFF
   8BF9 16            [ 2] 1610         tab
   8BFA D7 62         [ 3] 1611         stab    (0x0062)
   8BFC BD F9 C5      [ 6] 1612         jsr     BUTNLIT 
   8BFF 20 F3         [ 3] 1613         bra     L8BF4  
   8C01 39            [ 5] 1614         rts
                           1615 
                           1616 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1617 
                           1618 ; Delay B seconds, with random motions if enabled
   8C02                    1619 DLYSECS:
   8C02 36            [ 3] 1620         psha
   8C03 86 64         [ 2] 1621         ldaa    #0x64
   8C05 3D            [10] 1622         mul
   8C06 DD 23         [ 4] 1623         std     CDTIMR5         ; store B*100 here
   8C08                    1624 L8C08:
   8C08 BD 9B 19      [ 6] 1625         jsr     L9B19           ; do the random motions if enabled
   8C0B DC 23         [ 4] 1626         ldd     CDTIMR5
   8C0D 26 F9         [ 3] 1627         bne     L8C08  
   8C0F 32            [ 4] 1628         pula
   8C10 39            [ 5] 1629         rts
                           1630 
                           1631 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1632 
                           1633 ; Delay 1 minute, with random motions if enabled - unused?
   8C11                    1634 DLY1MIN:
   8C11 36            [ 3] 1635         psha
   8C12 86 3C         [ 2] 1636         ldaa    #0x3C
   8C14                    1637 L8C14:
   8C14 97 28         [ 3] 1638         staa    (0x0028)
   8C16 C6 01         [ 2] 1639         ldab    #0x01           ; delay 1 sec
   8C18 BD 8C 02      [ 6] 1640         jsr     DLYSECS         ;
   8C1B 96 28         [ 3] 1641         ldaa    (0x0028)
   8C1D 4A            [ 2] 1642         deca
   8C1E 26 F4         [ 3] 1643         bne     L8C14  
   8C20 32            [ 4] 1644         pula
   8C21 39            [ 5] 1645         rts
                           1646 
                           1647 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1648 
                           1649 ; Delay by B hundreths of a second, with random motions if enabled
   8C22                    1650 DLYSECSBY100:
   8C22 36            [ 3] 1651         psha
   8C23 4F            [ 2] 1652         clra
   8C24 DD 23         [ 4] 1653         std     CDTIMR5
   8C26                    1654 L8C26:
   8C26 BD 9B 19      [ 6] 1655         jsr     L9B19           ; do the random motions if enabled
   8C29 7D 00 24      [ 6] 1656         tst     CDTIMR5+1
   8C2C 26 F8         [ 3] 1657         bne     L8C26
   8C2E 32            [ 4] 1658         pula
   8C2F 39            [ 5] 1659         rts
                           1660 
                           1661 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1662 
                           1663 ; Delay by B half-seconds
   8C30                    1664 DLYSECSBY2:
   8C30 36            [ 3] 1665         psha
   8C31 86 32         [ 2] 1666         ldaa    #0x32           ; 50
   8C33 3D            [10] 1667         mul
   8C34 DD 23         [ 4] 1668         std     CDTIMR5
   8C36                    1669 L8C36:
   8C36 DC 23         [ 4] 1670         ldd     CDTIMR5
   8C38 26 FC         [ 3] 1671         bne     L8C36
   8C3A 32            [ 4] 1672         pula
   8C3B 39            [ 5] 1673         rts
                           1674 
                           1675 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1676 ; LCD routines
                           1677 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1678 
   8C3C                    1679 L8C3C:
   8C3C 86 FF         [ 2] 1680         ldaa    #0xFF
   8C3E B7 10 01      [ 4] 1681         staa    DDRA  
   8C41 86 FF         [ 2] 1682         ldaa    #0xFF
   8C43 B7 10 03      [ 4] 1683         staa    DDRG 
   8C46 B6 10 02      [ 4] 1684         ldaa    PORTG  
   8C49 8A 02         [ 2] 1685         oraa    #0x02
   8C4B B7 10 02      [ 4] 1686         staa    PORTG  
   8C4E 86 38         [ 2] 1687         ldaa    #0x38
   8C50 BD 8C 86      [ 6] 1688         jsr     L8C86           ; write byte to LCD
   8C53 86 38         [ 2] 1689         ldaa    #0x38
   8C55 BD 8C 86      [ 6] 1690         jsr     L8C86           ; write byte to LCD
   8C58 86 06         [ 2] 1691         ldaa    #0x06
   8C5A BD 8C 86      [ 6] 1692         jsr     L8C86           ; write byte to LCD
   8C5D 86 0E         [ 2] 1693         ldaa    #0x0E
   8C5F BD 8C 86      [ 6] 1694         jsr     L8C86           ; write byte to LCD
   8C62 86 01         [ 2] 1695         ldaa    #0x01
   8C64 BD 8C 86      [ 6] 1696         jsr     L8C86           ; write byte to LCD
   8C67 CE 00 FF      [ 3] 1697         ldx     #0x00FF
   8C6A                    1698 L8C6A:
   8C6A 01            [ 2] 1699         nop
   8C6B 01            [ 2] 1700         nop
   8C6C 09            [ 3] 1701         dex
   8C6D 26 FB         [ 3] 1702         bne     L8C6A  
   8C6F 39            [ 5] 1703         rts
                           1704 
                           1705 ; toggle LCD ENABLE
   8C70                    1706 L8C70:
   8C70 B6 10 02      [ 4] 1707         ldaa    PORTG  
   8C73 84 FD         [ 2] 1708         anda    #0xFD           ; clear LCD ENABLE
   8C75 B7 10 02      [ 4] 1709         staa    PORTG  
   8C78 8A 02         [ 2] 1710         oraa    #0x02           ; set LCD ENABLE
   8C7A B7 10 02      [ 4] 1711         staa    PORTG  
   8C7D 39            [ 5] 1712         rts
                           1713 
                           1714 ; Reset LCD buffer?
   8C7E                    1715 L8C7E:
   8C7E CC 05 00      [ 3] 1716         ldd     #0x0500         ; Reset LCD queue?
   8C81 DD 46         [ 4] 1717         std     (0x0046)        ; write pointer
   8C83 DD 44         [ 4] 1718         std     (0x0044)        ; read pointer?
   8C85 39            [ 5] 1719         rts
                           1720 
                           1721 ; write byte to LCD
   8C86                    1722 L8C86:
   8C86 BD 8C BD      [ 6] 1723         jsr     L8CBD           ; wait for LCD not busy
   8C89 B7 10 00      [ 4] 1724         staa    PORTA  
   8C8C B6 10 02      [ 4] 1725         ldaa    PORTG       
   8C8F 84 F3         [ 2] 1726         anda    #0xF3           ; LCD RS and LCD RW low
   8C91                    1727 L8C91:
   8C91 B7 10 02      [ 4] 1728         staa    PORTG  
   8C94 BD 8C 70      [ 6] 1729         jsr     L8C70           ; toggle LCD ENABLE
   8C97 39            [ 5] 1730         rts
                           1731 
                           1732 ; ???
   8C98                    1733 L8C98:
   8C98 BD 8C BD      [ 6] 1734         jsr     L8CBD           ; wait for LCD not busy
   8C9B B7 10 00      [ 4] 1735         staa    PORTA  
   8C9E B6 10 02      [ 4] 1736         ldaa    PORTG  
   8CA1 84 FB         [ 2] 1737         anda    #0xFB
   8CA3 8A 08         [ 2] 1738         oraa    #0x08
   8CA5 20 EA         [ 3] 1739         bra     L8C91  
   8CA7 BD 8C BD      [ 6] 1740         jsr     L8CBD           ; wait for LCD not busy
   8CAA B6 10 02      [ 4] 1741         ldaa    PORTG  
   8CAD 84 F7         [ 2] 1742         anda    #0xF7
   8CAF 8A 08         [ 2] 1743         oraa    #0x08
   8CB1 20 DE         [ 3] 1744         bra     L8C91  
   8CB3 BD 8C BD      [ 6] 1745         jsr     L8CBD           ; wait for LCD not busy
   8CB6 B6 10 02      [ 4] 1746         ldaa    PORTG  
   8CB9 8A 0C         [ 2] 1747         oraa    #0x0C
   8CBB 20 D4         [ 3] 1748         bra     L8C91  
                           1749 
                           1750 ; wait for LCD not busy (or timeout)
   8CBD                    1751 L8CBD:
   8CBD 36            [ 3] 1752         psha
   8CBE 37            [ 3] 1753         pshb
   8CBF C6 FF         [ 2] 1754         ldab    #0xFF           ; init timeout counter
   8CC1                    1755 L8CC1:
   8CC1 5D            [ 2] 1756         tstb
   8CC2 27 1A         [ 3] 1757         beq     L8CDE           ; times up, exit
   8CC4 B6 10 02      [ 4] 1758         ldaa    PORTG  
   8CC7 84 F7         [ 2] 1759         anda    #0xF7           ; bit 3 low
   8CC9 8A 04         [ 2] 1760         oraa    #0x04           ; bit 3 high
   8CCB B7 10 02      [ 4] 1761         staa    PORTG           ; LCD RS high
   8CCE BD 8C 70      [ 6] 1762         jsr     L8C70           ; toggle LCD ENABLE
   8CD1 7F 10 01      [ 6] 1763         clr     DDRA  
   8CD4 B6 10 00      [ 4] 1764         ldaa    PORTA           ; read busy flag from LCD
   8CD7 2B 08         [ 3] 1765         bmi     L8CE1           ; if busy, keep looping
   8CD9 86 FF         [ 2] 1766         ldaa    #0xFF
   8CDB B7 10 01      [ 4] 1767         staa    DDRA            ; port A back to outputs
   8CDE                    1768 L8CDE:
   8CDE 33            [ 4] 1769         pulb                    ; and exit
   8CDF 32            [ 4] 1770         pula
   8CE0 39            [ 5] 1771         rts
                           1772 
   8CE1                    1773 L8CE1:
   8CE1 5A            [ 2] 1774         decb                    ; decrement timer
   8CE2 86 FF         [ 2] 1775         ldaa    #0xFF
   8CE4 B7 10 01      [ 4] 1776         staa    DDRA            ; port A back to outputs
   8CE7 20 D8         [ 3] 1777         bra     L8CC1           ; loop
                           1778 
   8CE9                    1779 L8CE9:
   8CE9 BD 8C BD      [ 6] 1780         jsr     L8CBD           ; wait for LCD not busy
   8CEC 86 01         [ 2] 1781         ldaa    #0x01
   8CEE BD 8C 86      [ 6] 1782         jsr     L8C86           ; write byte to LCD
   8CF1 39            [ 5] 1783         rts
                           1784 
   8CF2                    1785 L8CF2:
   8CF2 BD 8C BD      [ 6] 1786         jsr     L8CBD           ; wait for LCD not busy
   8CF5 86 80         [ 2] 1787         ldaa    #0x80
   8CF7 BD 8D 14      [ 6] 1788         jsr     L8D14
   8CFA BD 8C BD      [ 6] 1789         jsr     L8CBD           ; wait for LCD not busy
   8CFD 86 80         [ 2] 1790         ldaa    #0x80
   8CFF BD 8C 86      [ 6] 1791         jsr     L8C86           ; write byte to LCD
   8D02 39            [ 5] 1792         rts
                           1793 
   8D03                    1794 L8D03:
   8D03 BD 8C BD      [ 6] 1795         jsr     L8CBD           ; wait for LCD not busy
   8D06 86 C0         [ 2] 1796         ldaa    #0xC0
   8D08 BD 8D 14      [ 6] 1797         jsr     L8D14
   8D0B BD 8C BD      [ 6] 1798         jsr     L8CBD           ; wait for LCD not busy
   8D0E 86 C0         [ 2] 1799         ldaa    #0xC0
   8D10 BD 8C 86      [ 6] 1800         jsr     L8C86           ; write byte to LCD
   8D13 39            [ 5] 1801         rts
                           1802 
   8D14                    1803 L8D14:
   8D14 BD 8C 86      [ 6] 1804         jsr     L8C86           ; write byte to LCD
   8D17 86 10         [ 2] 1805         ldaa    #0x10
   8D19 97 14         [ 3] 1806         staa    (0x0014)
   8D1B                    1807 L8D1B:
   8D1B BD 8C BD      [ 6] 1808         jsr     L8CBD           ; wait for LCD not busy
   8D1E 86 20         [ 2] 1809         ldaa    #0x20
   8D20 BD 8C 98      [ 6] 1810         jsr     L8C98
   8D23 7A 00 14      [ 6] 1811         dec     (0x0014)
   8D26 26 F3         [ 3] 1812         bne     L8D1B  
   8D28 39            [ 5] 1813         rts
                           1814 
   8D29                    1815 L8D29:
   8D29 86 0C         [ 2] 1816         ldaa    #0x0C
   8D2B BD 8E 4B      [ 6] 1817         jsr     L8E4B
   8D2E 39            [ 5] 1818         rts
                           1819 
                           1820 ; Unused?
   8D2F                    1821 L8D2F:
   8D2F 86 0E         [ 2] 1822         ldaa    #0x0E
   8D31 BD 8E 4B      [ 6] 1823         jsr     L8E4B
   8D34 39            [ 5] 1824         rts
                           1825 
   8D35                    1826 L8D35:
   8D35 7F 00 4A      [ 6] 1827         clr     (0x004A)
   8D38 7F 00 43      [ 6] 1828         clr     (0x0043)
   8D3B 18 DE 46      [ 5] 1829         ldy     (0x0046)
   8D3E 86 C0         [ 2] 1830         ldaa    #0xC0
   8D40 20 0B         [ 3] 1831         bra     L8D4D
                           1832 
   8D42                    1833 L8D42:
   8D42 7F 00 4A      [ 6] 1834         clr     (0x004A)
   8D45 7F 00 43      [ 6] 1835         clr     (0x0043)
   8D48 18 DE 46      [ 5] 1836         ldy     (0x0046)
   8D4B 86 80         [ 2] 1837         ldaa    #0x80
   8D4D                    1838 L8D4D:
   8D4D 18 A7 00      [ 5] 1839         staa    0,Y     
   8D50 18 6F 01      [ 7] 1840         clr     1,Y     
   8D53 18 08         [ 4] 1841         iny
   8D55 18 08         [ 4] 1842         iny
   8D57 18 8C 05 80   [ 5] 1843         cpy     #0x0580
   8D5B 25 04         [ 3] 1844         bcs     L8D61  
   8D5D 18 CE 05 00   [ 4] 1845         ldy     #0x0500
   8D61                    1846 L8D61:
   8D61 C6 0F         [ 2] 1847         ldab    #0x0F
   8D63                    1848 L8D63:
   8D63 96 4A         [ 3] 1849         ldaa    (0x004A)
   8D65 27 FC         [ 3] 1850         beq     L8D63  
   8D67 7F 00 4A      [ 6] 1851         clr     (0x004A)
   8D6A 5A            [ 2] 1852         decb
   8D6B 27 1A         [ 3] 1853         beq     L8D87  
   8D6D 81 24         [ 2] 1854         cmpa    #0x24
   8D6F 27 16         [ 3] 1855         beq     L8D87  
   8D71 18 6F 00      [ 7] 1856         clr     0,Y     
   8D74 18 A7 01      [ 5] 1857         staa    1,Y     
   8D77 18 08         [ 4] 1858         iny
   8D79 18 08         [ 4] 1859         iny
   8D7B 18 8C 05 80   [ 5] 1860         cpy     #0x0580
   8D7F 25 04         [ 3] 1861         bcs     L8D85  
   8D81 18 CE 05 00   [ 4] 1862         ldy     #0x0500
   8D85                    1863 L8D85:
   8D85 20 DC         [ 3] 1864         bra     L8D63  
   8D87                    1865 L8D87:
   8D87 5D            [ 2] 1866         tstb
   8D88 27 19         [ 3] 1867         beq     L8DA3  
   8D8A 86 20         [ 2] 1868         ldaa    #0x20
   8D8C                    1869 L8D8C:
   8D8C 18 6F 00      [ 7] 1870         clr     0,Y     
   8D8F 18 A7 01      [ 5] 1871         staa    1,Y     
   8D92 18 08         [ 4] 1872         iny
   8D94 18 08         [ 4] 1873         iny
   8D96 18 8C 05 80   [ 5] 1874         cpy     #0x0580
   8D9A 25 04         [ 3] 1875         bcs     L8DA0  
   8D9C 18 CE 05 00   [ 4] 1876         ldy     #0x0500
   8DA0                    1877 L8DA0:
   8DA0 5A            [ 2] 1878         decb
   8DA1 26 E9         [ 3] 1879         bne     L8D8C  
   8DA3                    1880 L8DA3:
   8DA3 18 6F 00      [ 7] 1881         clr     0,Y     
   8DA6 18 6F 01      [ 7] 1882         clr     1,Y     
   8DA9 18 DF 46      [ 5] 1883         sty     (0x0046)
   8DAC 96 19         [ 3] 1884         ldaa    (0x0019)
   8DAE 97 4E         [ 3] 1885         staa    (0x004E)
   8DB0 86 01         [ 2] 1886         ldaa    #0x01
   8DB2 97 43         [ 3] 1887         staa    (0x0043)
   8DB4 39            [ 5] 1888         rts
                           1889 
                           1890 ; display ASCII in B at location
   8DB5                    1891 L8DB5:
   8DB5 36            [ 3] 1892         psha
   8DB6 37            [ 3] 1893         pshb
   8DB7 C1 4F         [ 2] 1894         cmpb    #0x4F
   8DB9 22 13         [ 3] 1895         bhi     L8DCE  
   8DBB C1 28         [ 2] 1896         cmpb    #0x28
   8DBD 25 03         [ 3] 1897         bcs     L8DC2  
   8DBF 0C            [ 2] 1898         clc
   8DC0 C9 18         [ 2] 1899         adcb    #0x18
   8DC2                    1900 L8DC2:
   8DC2 0C            [ 2] 1901         clc
   8DC3 C9 80         [ 2] 1902         adcb    #0x80
   8DC5 17            [ 2] 1903         tba
   8DC6 BD 8E 4B      [ 6] 1904         jsr     L8E4B           ; send lcd command
   8DC9 33            [ 4] 1905         pulb
   8DCA 32            [ 4] 1906         pula
   8DCB BD 8E 70      [ 6] 1907         jsr     L8E70           ; send lcd char
   8DCE                    1908 L8DCE:
   8DCE 39            [ 5] 1909         rts
                           1910 
                           1911 ; 4 routines to write to the LCD display
                           1912 
                           1913 ; Write to the LCD 1st line - extend past the end of a normal display
   8DCF                    1914 LCDMSG1A:
   8DCF 18 DE 46      [ 5] 1915         ldy     (0x0046)        ; get buffer pointer
   8DD2 86 90         [ 2] 1916         ldaa    #0x90           ; command to set LCD RAM ptr to chr 0x10
   8DD4 20 13         [ 3] 1917         bra     L8DE9  
                           1918 
                           1919 ; Write to the LCD 2st line - extend past the end of a normal display
   8DD6                    1920 LCDMSG2A:
   8DD6 18 DE 46      [ 5] 1921         ldy     (0x0046)        ; get buffer pointer
   8DD9 86 D0         [ 2] 1922         ldaa    #0xD0           ; command to set LCD RAM ptr to chr 0x50
   8DDB 20 0C         [ 3] 1923         bra     L8DE9  
                           1924 
                           1925 ; Write to the LCD 2nd line
   8DDD                    1926 LCDMSG2:
   8DDD 18 DE 46      [ 5] 1927         ldy     (0x0046)        ; get buffer pointer
   8DE0 86 C0         [ 2] 1928         ldaa    #0xC0           ; command to set LCD RAM ptr to chr 0x40
   8DE2 20 05         [ 3] 1929         bra     L8DE9  
                           1930 
                           1931 ; Write to the LCD 1st line
   8DE4                    1932 LCDMSG1:
   8DE4 18 DE 46      [ 5] 1933         ldy     (0x0046)        ; get buffer pointer
   8DE7 86 80         [ 2] 1934         ldaa    #0x80           ; command to load LCD RAM ptr to chr 0x00
                           1935 
                           1936 ; Put LCD command into a buffer, 4 bytes for each entry?
   8DE9                    1937 L8DE9:
   8DE9 18 A7 00      [ 5] 1938         staa    0,Y             ; store command here
   8DEC 18 6F 01      [ 7] 1939         clr     1,Y             ; clear next byte
   8DEF 18 08         [ 4] 1940         iny
   8DF1 18 08         [ 4] 1941         iny
                           1942 
                           1943 ; Add characters at return address to LCD buffer
   8DF3 18 8C 05 80   [ 5] 1944         cpy     #0x0580         ; check for buffer overflow
   8DF7 25 04         [ 3] 1945         bcs     L8DFD           
   8DF9 18 CE 05 00   [ 4] 1946         ldy     #0x0500
   8DFD                    1947 L8DFD:
   8DFD 38            [ 5] 1948         pulx                    ; get start of data
   8DFE DF 17         [ 4] 1949         stx     (0x0017)        ; save this here
   8E00                    1950 L8E00:
   8E00 A6 00         [ 4] 1951         ldaa    0,X             ; get character
   8E02 27 36         [ 3] 1952         beq     L8E3A           ; is it 00, if so jump ahead
   8E04 2B 17         [ 3] 1953         bmi     L8E1D           ; high bit set, if so jump ahead
   8E06 18 6F 00      [ 7] 1954         clr     0,Y             ; add character
   8E09 18 A7 01      [ 5] 1955         staa    1,Y     
   8E0C 08            [ 3] 1956         inx
   8E0D 18 08         [ 4] 1957         iny
   8E0F 18 08         [ 4] 1958         iny
   8E11 18 8C 05 80   [ 5] 1959         cpy     #0x0580         ; check for buffer overflow
   8E15 25 E9         [ 3] 1960         bcs     L8E00  
   8E17 18 CE 05 00   [ 4] 1961         ldy     #0x0500
   8E1B 20 E3         [ 3] 1962         bra     L8E00  
                           1963 
   8E1D                    1964 L8E1D:
   8E1D 84 7F         [ 2] 1965         anda    #0x7F
   8E1F 18 6F 00      [ 7] 1966         clr     0,Y             ; add character
   8E22 18 A7 01      [ 5] 1967         staa    1,Y     
   8E25 18 6F 02      [ 7] 1968         clr     2,Y     
   8E28 18 6F 03      [ 7] 1969         clr     3,Y     
   8E2B 08            [ 3] 1970         inx
   8E2C 18 08         [ 4] 1971         iny
   8E2E 18 08         [ 4] 1972         iny
   8E30 18 8C 05 80   [ 5] 1973         cpy     #0x0580         ; check for overflow
   8E34 25 04         [ 3] 1974         bcs     L8E3A  
   8E36 18 CE 05 00   [ 4] 1975         ldy     #0x0500
                           1976 
   8E3A                    1977 L8E3A:
   8E3A 3C            [ 4] 1978         pshx                    ; put SP back
   8E3B 86 01         [ 2] 1979         ldaa    #0x01
   8E3D 97 43         [ 3] 1980         staa    (0x0043)        ; semaphore?
   8E3F DC 46         [ 4] 1981         ldd     (0x0046)
   8E41 18 6F 00      [ 7] 1982         clr     0,Y     
   8E44 18 6F 01      [ 7] 1983         clr     1,Y     
   8E47 18 DF 46      [ 5] 1984         sty     (0x0046)        ; save buffer pointer
   8E4A 39            [ 5] 1985         rts
                           1986 
                           1987 ; buffer LCD command?
   8E4B                    1988 L8E4B:
   8E4B 18 DE 46      [ 5] 1989         ldy     (0x0046)
   8E4E 18 A7 00      [ 5] 1990         staa    0,Y     
   8E51 18 6F 01      [ 7] 1991         clr     1,Y     
   8E54 18 08         [ 4] 1992         iny
   8E56 18 08         [ 4] 1993         iny
   8E58 18 8C 05 80   [ 5] 1994         cpy     #0x0580
   8E5C 25 04         [ 3] 1995         bcs     L8E62  
   8E5E 18 CE 05 00   [ 4] 1996         ldy     #0x0500
   8E62                    1997 L8E62:
   8E62 18 6F 00      [ 7] 1998         clr     0,Y     
   8E65 18 6F 01      [ 7] 1999         clr     1,Y     
   8E68 86 01         [ 2] 2000         ldaa    #0x01
   8E6A 97 43         [ 3] 2001         staa    (0x0043)
   8E6C 18 DF 46      [ 5] 2002         sty     (0x0046)
   8E6F 39            [ 5] 2003         rts
                           2004 
   8E70                    2005 L8E70:
   8E70 18 DE 46      [ 5] 2006         ldy     (0x0046)
   8E73 18 6F 00      [ 7] 2007         clr     0,Y     
   8E76 18 A7 01      [ 5] 2008         staa    1,Y     
   8E79 18 08         [ 4] 2009         iny
   8E7B 18 08         [ 4] 2010         iny
   8E7D 18 8C 05 80   [ 5] 2011         cpy     #0x0580
   8E81 25 04         [ 3] 2012         bcs     L8E87  
   8E83 18 CE 05 00   [ 4] 2013         ldy     #0x0500
   8E87                    2014 L8E87:
   8E87 18 6F 00      [ 7] 2015         clr     0,Y     
   8E8A 18 6F 01      [ 7] 2016         clr     1,Y     
   8E8D 86 01         [ 2] 2017         ldaa    #0x01
   8E8F 97 43         [ 3] 2018         staa    (0x0043)
   8E91 18 DF 46      [ 5] 2019         sty     (0x0046)
   8E94 39            [ 5] 2020         rts
                           2021 
                           2022 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2023 
                           2024 ; Read SCD switches
   8E95                    2025 L8E95:
   8E95 96 30         [ 3] 2026         ldaa    (0x0030)
   8E97 26 09         [ 3] 2027         bne     L8EA2       ; UP - return A=0x01
   8E99 96 31         [ 3] 2028         ldaa    (0x0031)
   8E9B 26 11         [ 3] 2029         bne     L8EAE       ; DOWN - return A=0x02
   8E9D 96 32         [ 3] 2030         ldaa    (0x0032)
   8E9F 26 19         [ 3] 2031         bne     L8EBA       ; ENTER - return A=0x0D
   8EA1 39            [ 5] 2032         rts                 ; return A=0x00
                           2033 
   8EA2                    2034 L8EA2:
   8EA2 7F 00 30      [ 6] 2035         clr     (0x0030)
   8EA5 7F 00 32      [ 6] 2036         clr     (0x0032)
   8EA8 7F 00 31      [ 6] 2037         clr     (0x0031)
   8EAB 86 01         [ 2] 2038         ldaa    #0x01
   8EAD 39            [ 5] 2039         rts
                           2040 
   8EAE                    2041 L8EAE:
   8EAE 7F 00 31      [ 6] 2042         clr     (0x0031)
   8EB1 7F 00 30      [ 6] 2043         clr     (0x0030)
   8EB4 7F 00 32      [ 6] 2044         clr     (0x0032)
   8EB7 86 02         [ 2] 2045         ldaa    #0x02
   8EB9 39            [ 5] 2046         rts
                           2047 
   8EBA                    2048 L8EBA:
   8EBA 7F 00 32      [ 6] 2049         clr     (0x0032)
   8EBD 7F 00 30      [ 6] 2050         clr     (0x0030)
   8EC0 7F 00 31      [ 6] 2051         clr     (0x0031)
   8EC3 86 0D         [ 2] 2052         ldaa    #0x0D
   8EC5 39            [ 5] 2053         rts
                           2054 
                           2055 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2056 
                           2057 ; Scan SCD keys into up=0x30,down=0x31,enter=0x32
   8EC6                    2058 L8EC6:
   8EC6 B6 18 04      [ 4] 2059         ldaa    PIA0PRA 
   8EC9 84 07         [ 2] 2060         anda    #0x07       ; get button state
   8ECB 97 2C         [ 3] 2061         staa    (0x002C)
   8ECD 78 00 2C      [ 6] 2062         asl     (0x002C)
   8ED0 78 00 2C      [ 6] 2063         asl     (0x002C)
   8ED3 78 00 2C      [ 6] 2064         asl     (0x002C)
   8ED6 78 00 2C      [ 6] 2065         asl     (0x002C)
   8ED9 78 00 2C      [ 6] 2066         asl     (0x002C)    ; put in upper 3 bits of 002C 
   8EDC CE 00 00      [ 3] 2067         ldx     #0x0000
   8EDF                    2068 L8EDF:
   8EDF 8C 00 03      [ 4] 2069         cpx     #0x0003
   8EE2 27 24         [ 3] 2070         beq     L8F08
   8EE4 78 00 2C      [ 6] 2071         asl     (0x002C)    
   8EE7 25 12         [ 3] 2072         bcs     L8EFB       ; if button not pressed, jump
   8EE9 A6 2D         [ 4] 2073         ldaa    0x2D,X
   8EEB 81 0F         [ 2] 2074         cmpa    #0x0F       ; has it been pressed for 15
   8EED 24 1A         [ 3] 2075         bcc     L8F09       ; do key repeat, if not enter
   8EEF 6C 2D         [ 6] 2076         inc     0x2D,X      ; nope, inc it
   8EF1 A6 2D         [ 4] 2077         ldaa    0x2D,X
   8EF3 81 02         [ 2] 2078         cmpa    #0x02       ; has it been pressed for 2?
   8EF5 26 02         [ 3] 2079         bne     L8EF9       ; nope
   8EF7 A7 30         [ 4] 2080         staa    0x30,X      ; short press - store count (2) in 0x30/0x31/0x32
   8EF9                    2081 L8EF9:
   8EF9 20 0A         [ 3] 2082         bra     L8F05  
   8EFB                    2083 L8EFB:                      ; 
   8EFB 6F 2D         [ 6] 2084         clr     0x2D,X      ; clear 2D/2E/2F if not pressed
   8EFD 20 06         [ 3] 2085         bra     L8F05  
   8EFF A6 2D         [ 4] 2086         ldaa    0x2D,X
   8F01 27 02         [ 3] 2087         beq     L8F05  
   8F03 6A 2D         [ 6] 2088         dec     0x2D,X
   8F05                    2089 L8F05:
   8F05 08            [ 3] 2090         inx
   8F06 20 D7         [ 3] 2091         bra     L8EDF  
   8F08                    2092 L8F08:
   8F08 39            [ 5] 2093         rts
                           2094 
   8F09                    2095 L8F09:
   8F09 8C 00 02      [ 4] 2096         cpx     #0x0002
   8F0C 27 02         [ 3] 2097         beq     L8F10  
   8F0E 6F 2D         [ 6] 2098         clr     0x2D,X      ; do kbd repeat for up and down
   8F10                    2099 L8F10:
   8F10 20 F3         [ 3] 2100         bra     L8F05
                           2101 
                           2102 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2103 
                           2104 ; Read Front Panel Switches
   8F12                    2105 L8F12:
   8F12 B6 10 0A      [ 4] 2106         ldaa    PORTE
   8F15 97 51         [ 3] 2107         staa    (0x0051)
   8F17 CE 00 00      [ 3] 2108         ldx     #0x0000
   8F1A                    2109 L8F1A:
   8F1A 8C 00 08      [ 4] 2110         cpx     #0x0008
   8F1D 27 22         [ 3] 2111         beq     L8F41  
   8F1F 77 00 51      [ 6] 2112         asr     (0x0051)
   8F22 25 10         [ 3] 2113         bcs     L8F34  
   8F24 A6 52         [ 4] 2114         ldaa    0x52,X
   8F26 81 0F         [ 2] 2115         cmpa    #0x0F
   8F28 6C 52         [ 6] 2116         inc     0x52,X
   8F2A A6 52         [ 4] 2117         ldaa    0x52,X
   8F2C 81 04         [ 2] 2118         cmpa    #0x04
   8F2E 26 02         [ 3] 2119         bne     L8F32  
   8F30 A7 5A         [ 4] 2120         staa    0x5A,X
   8F32                    2121 L8F32:
   8F32 20 0A         [ 3] 2122         bra     L8F3E  
   8F34                    2123 L8F34:
   8F34 6F 52         [ 6] 2124         clr     0x52,X
   8F36 20 06         [ 3] 2125         bra     L8F3E  
   8F38 A6 52         [ 4] 2126         ldaa    0x52,X
   8F3A 27 02         [ 3] 2127         beq     L8F3E  
   8F3C 6A 52         [ 6] 2128         dec     0x52,X
   8F3E                    2129 L8F3E:
   8F3E 08            [ 3] 2130         inx
   8F3F 20 D9         [ 3] 2131         bra     L8F1A  
   8F41                    2132 L8F41:
   8F41 39            [ 5] 2133         rts
                           2134 
   8F42 6F 52         [ 6] 2135         clr     0x52,X
   8F44 20 F8         [ 3] 2136         bra     L8F3E  
                           2137 
                           2138 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2139 
   8F46                    2140 L8F46:
   8F46 30 2E 35           2141         .ascii      '0.5'
   8F49 31 2E 30           2142         .ascii      '1.0'
   8F4C 31 2E 35           2143         .ascii      '1.5'
   8F4F 32 2E 30           2144         .ascii      '2.0'
   8F52 32 2E 35           2145         .ascii      '2.5'
   8F55 33 2E 30           2146         .ascii      '3.0'
                           2147 
   8F58                    2148 L8F58:
   8F58 3C            [ 4] 2149         pshx
   8F59 96 12         [ 3] 2150         ldaa    (0x0012)
   8F5B 80 01         [ 2] 2151         suba    #0x01
   8F5D C6 03         [ 2] 2152         ldab    #0x03
   8F5F 3D            [10] 2153         mul
   8F60 CE 8F 46      [ 3] 2154         ldx     #L8F46
   8F63 3A            [ 3] 2155         abx
   8F64 C6 2C         [ 2] 2156         ldab    #0x2C
   8F66                    2157 L8F66:
   8F66 A6 00         [ 4] 2158         ldaa    0,X     
   8F68 08            [ 3] 2159         inx
   8F69 BD 8D B5      [ 6] 2160         jsr     L8DB5           ; display char here on LCD display
   8F6C 5C            [ 2] 2161         incb
   8F6D C1 2F         [ 2] 2162         cmpb    #0x2F
   8F6F 26 F5         [ 3] 2163         bne     L8F66  
   8F71 38            [ 5] 2164         pulx
   8F72 39            [ 5] 2165         rts
                           2166 
   8F73                    2167 L8F73:
   8F73 36            [ 3] 2168         psha
   8F74 BD 8C F2      [ 6] 2169         jsr     L8CF2
   8F77 C6 02         [ 2] 2170         ldab    #0x02
   8F79 BD 8C 30      [ 6] 2171         jsr     DLYSECSBY2   
   8F7C 32            [ 4] 2172         pula
   8F7D 97 B4         [ 3] 2173         staa    (0x00B4)
   8F7F 81 03         [ 2] 2174         cmpa    #0x03
   8F81 26 11         [ 3] 2175         bne     L8F94  
                           2176 
   8F83 BD 8D E4      [ 6] 2177         jsr     LCDMSG1 
   8F86 43 68 75 63 6B 20  2178         .ascis  'Chuck    '
        20 20 A0
                           2179 
   8F8F CE 90 72      [ 3] 2180         ldx     #L9072
   8F92 20 4D         [ 3] 2181         bra     L8FE1  
   8F94                    2182 L8F94:
   8F94 81 04         [ 2] 2183         cmpa    #0x04
   8F96 26 11         [ 3] 2184         bne     L8FA9  
                           2185 
   8F98 BD 8D E4      [ 6] 2186         jsr     LCDMSG1 
   8F9B 4A 61 73 70 65 72  2187         .ascis  'Jasper   '
        20 20 A0
                           2188 
   8FA4 CE 90 DE      [ 3] 2189         ldx     #L90DE
   8FA7 20 38         [ 3] 2190         bra     L8FE1  
   8FA9                    2191 L8FA9:
   8FA9 81 05         [ 2] 2192         cmpa    #0x05
   8FAB 26 11         [ 3] 2193         bne     L8FBE  
                           2194 
   8FAD BD 8D E4      [ 6] 2195         jsr     LCDMSG1 
   8FB0 50 61 73 71 75 61  2196         .ascis  'Pasqually'
        6C 6C F9
                           2197 
   8FB9 CE 91 45      [ 3] 2198         ldx     #L9145
   8FBC 20 23         [ 3] 2199         bra     L8FE1  
   8FBE                    2200 L8FBE:
   8FBE 81 06         [ 2] 2201         cmpa    #0x06
   8FC0 26 11         [ 3] 2202         bne     L8FD3  
                           2203 
   8FC2 BD 8D E4      [ 6] 2204         jsr     LCDMSG1 
   8FC5 4D 75 6E 63 68 20  2205         .ascis  'Munch    '
        20 20 A0
                           2206 
   8FCE CE 91 BA      [ 3] 2207         ldx     #L91BA
   8FD1 20 0E         [ 3] 2208         bra     L8FE1  
   8FD3                    2209 L8FD3:
   8FD3 BD 8D E4      [ 6] 2210         jsr     LCDMSG1 
   8FD6 48 65 6C 65 6E 20  2211         .ascis  'Helen   '
        20 A0
                           2212 
   8FDE CE 92 26      [ 3] 2213         ldx     #L9226
   8FE1                    2214 L8FE1:
   8FE1 96 B4         [ 3] 2215         ldaa    (0x00B4)
   8FE3 80 03         [ 2] 2216         suba    #0x03
   8FE5 48            [ 2] 2217         asla
   8FE6 48            [ 2] 2218         asla
   8FE7 97 4B         [ 3] 2219         staa    (0x004B)
   8FE9 BD 95 04      [ 6] 2220         jsr     L9504
   8FEC 97 4C         [ 3] 2221         staa    (0x004C)
   8FEE 81 0F         [ 2] 2222         cmpa    #0x0F
   8FF0 26 01         [ 3] 2223         bne     L8FF3  
   8FF2 39            [ 5] 2224         rts
                           2225 
   8FF3                    2226 L8FF3:
   8FF3 81 08         [ 2] 2227         cmpa    #0x08
   8FF5 23 08         [ 3] 2228         bls     L8FFF  
   8FF7 80 08         [ 2] 2229         suba    #0x08
   8FF9 D6 4B         [ 3] 2230         ldab    (0x004B)
   8FFB CB 02         [ 2] 2231         addb    #0x02
   8FFD D7 4B         [ 3] 2232         stab    (0x004B)
   8FFF                    2233 L8FFF:
   8FFF 36            [ 3] 2234         psha
   9000 18 DE 46      [ 5] 2235         ldy     (0x0046)
   9003 32            [ 4] 2236         pula
   9004 5F            [ 2] 2237         clrb
   9005 0D            [ 2] 2238         sec
   9006                    2239 L9006:
   9006 59            [ 2] 2240         rolb
   9007 4A            [ 2] 2241         deca
   9008 26 FC         [ 3] 2242         bne     L9006  
   900A D7 50         [ 3] 2243         stab    (0x0050)
   900C D6 4B         [ 3] 2244         ldab    (0x004B)
   900E CE 10 80      [ 3] 2245         ldx     #0x1080
   9011 3A            [ 3] 2246         abx
   9012 86 02         [ 2] 2247         ldaa    #0x02
   9014 97 12         [ 3] 2248         staa    (0x0012)
   9016                    2249 L9016:
   9016 A6 00         [ 4] 2250         ldaa    0,X     
   9018 98 50         [ 3] 2251         eora    (0x0050)
   901A A7 00         [ 4] 2252         staa    0,X     
   901C 6D 00         [ 6] 2253         tst     0,X     
   901E 27 16         [ 3] 2254         beq     L9036  
   9020 86 4F         [ 2] 2255         ldaa    #0x4F           ;'O'
   9022 C6 0C         [ 2] 2256         ldab    #0x0C        
   9024 BD 8D B5      [ 6] 2257         jsr     L8DB5           ; display char here on LCD display
   9027 86 6E         [ 2] 2258         ldaa    #0x6E           ;'n'
   9029 C6 0D         [ 2] 2259         ldab    #0x0D
   902B BD 8D B5      [ 6] 2260         jsr     L8DB5           ; display char here on LCD display
   902E CC 20 0E      [ 3] 2261         ldd     #0x200E         ;' '
   9031 BD 8D B5      [ 6] 2262         jsr     L8DB5           ; display char here on LCD display
   9034 20 0E         [ 3] 2263         bra     L9044  
   9036                    2264 L9036:
   9036 86 66         [ 2] 2265         ldaa    #0x66           ;'f'
   9038 C6 0D         [ 2] 2266         ldab    #0x0D
   903A BD 8D B5      [ 6] 2267         jsr     L8DB5           ; display char here on LCD display
   903D 86 66         [ 2] 2268         ldaa    #0x66           ;'f'
   903F C6 0E         [ 2] 2269         ldab    #0x0E
   9041 BD 8D B5      [ 6] 2270         jsr     L8DB5           ; display char here on LCD display
   9044                    2271 L9044:
   9044 D6 12         [ 3] 2272         ldab    (0x0012)
   9046 BD 8C 30      [ 6] 2273         jsr     DLYSECSBY2      ; delay in half-seconds
   9049 BD 8E 95      [ 6] 2274         jsr     L8E95
   904C 81 0D         [ 2] 2275         cmpa    #0x0D
   904E 27 14         [ 3] 2276         beq     L9064  
   9050 20 C4         [ 3] 2277         bra     L9016  
   9052 81 02         [ 2] 2278         cmpa    #0x02
   9054 26 C0         [ 3] 2279         bne     L9016  
   9056 96 12         [ 3] 2280         ldaa    (0x0012)
   9058 81 06         [ 2] 2281         cmpa    #0x06
   905A 27 BA         [ 3] 2282         beq     L9016  
   905C 4C            [ 2] 2283         inca
   905D 97 12         [ 3] 2284         staa    (0x0012)
   905F BD 8F 58      [ 6] 2285         jsr     L8F58
   9062 20 B2         [ 3] 2286         bra     L9016  
   9064                    2287 L9064:
   9064 A6 00         [ 4] 2288         ldaa    0,X     
   9066 9A 50         [ 3] 2289         oraa    (0x0050)
   9068 98 50         [ 3] 2290         eora    (0x0050)
   906A A7 00         [ 4] 2291         staa    0,X     
   906C 96 B4         [ 3] 2292         ldaa    (0x00B4)
   906E 7E 8F 73      [ 3] 2293         jmp     L8F73
   9071 39            [ 5] 2294         rts
                           2295 
   9072                    2296 L9072:
   9072 4D 6F 75 74 68 2C  2297         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   90DE                    2298 L90DE:
   90DE 4D 6F 75 74 68 2C  2299         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Hands,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9145                    2300 L9145:
   9145 4D 6F 75 74 68 2D  2301         .ascis  'Mouth-Mustache,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   91BA                    2302 L91BA:
   91BA 4D 6F 75 74 68 2C  2303         .ascis  'Mouth,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9226                    2304 L9226:
   9226 4D 6F 75 74 68 2C  2305         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
                           2306         
                           2307 ; code again
   9292                    2308 L9292:
   9292 BD 86 C4      [ 6] 2309         jsr     L86C4           ; Reset boards 1-10
   9295                    2310 L9295:
   9295 C6 01         [ 2] 2311         ldab    #0x01
   9297 BD 8C 30      [ 6] 2312         jsr     DLYSECSBY2      ; delay 0.5 sec
                           2313 
   929A BD 8D E4      [ 6] 2314         jsr     LCDMSG1 
   929D 20 20 44 69 61 67  2315         .ascis  '  Diagnostics   '
        6E 6F 73 74 69 63
        73 20 20 A0
                           2316 
   92AD BD 8D DD      [ 6] 2317         jsr     LCDMSG2 
   92B0 20 20 20 20 20 20  2318         .ascis  '                '
        20 20 20 20 20 20
        20 20 20 A0
                           2319 
   92C0 C6 01         [ 2] 2320         ldab    #0x01
   92C2 BD 8C 30      [ 6] 2321         jsr     DLYSECSBY2      ; delay 0.5 sec
   92C5 BD 8D 03      [ 6] 2322         jsr     L8D03
   92C8 CE 93 D3      [ 3] 2323         ldx     #L93D3
   92CB BD 95 04      [ 6] 2324         jsr     L9504
   92CE 81 11         [ 2] 2325         cmpa    #0x11
   92D0 26 14         [ 3] 2326         bne     L92E6
   92D2                    2327 L92D2:
   92D2 BD 86 C4      [ 6] 2328         jsr     L86C4           ; Reset boards 1-10
   92D5 5F            [ 2] 2329         clrb
   92D6 D7 62         [ 3] 2330         stab    (0x0062)
   92D8 BD F9 C5      [ 6] 2331         jsr     BUTNLIT 
   92DB B6 18 04      [ 4] 2332         ldaa    PIA0PRA 
   92DE 84 BF         [ 2] 2333         anda    #0xBF
   92E0 B7 18 04      [ 4] 2334         staa    PIA0PRA 
   92E3 7E 81 D7      [ 3] 2335         jmp     L81D7
   92E6                    2336 L92E6:
   92E6 81 03         [ 2] 2337         cmpa    #0x03
   92E8 25 09         [ 3] 2338         bcs     L92F3  
   92EA 81 08         [ 2] 2339         cmpa    #0x08
   92EC 24 05         [ 3] 2340         bcc     L92F3  
   92EE BD 8F 73      [ 6] 2341         jsr     L8F73
   92F1 20 A2         [ 3] 2342         bra     L9295  
   92F3                    2343 L92F3:
   92F3 81 02         [ 2] 2344         cmpa    #0x02
   92F5 26 08         [ 3] 2345         bne     L92FF  
   92F7 BD 9F 1E      [ 6] 2346         jsr     L9F1E
   92FA 25 99         [ 3] 2347         bcs     L9295  
   92FC 7E 96 75      [ 3] 2348         jmp     L9675
   92FF                    2349 L92FF:
   92FF 81 0B         [ 2] 2350         cmpa    #0x0B
   9301 26 0D         [ 3] 2351         bne     L9310  
   9303 BD 8D 03      [ 6] 2352         jsr     L8D03
   9306 BD 9E CC      [ 6] 2353         jsr     L9ECC
   9309 C6 03         [ 2] 2354         ldab    #0x03
   930B BD 8C 30      [ 6] 2355         jsr     DLYSECSBY2      ; delay 1.5 sec
   930E 20 85         [ 3] 2356         bra     L9295  
   9310                    2357 L9310:
   9310 81 09         [ 2] 2358         cmpa    #0x09
   9312 26 0E         [ 3] 2359         bne     L9322  
   9314 BD 9F 1E      [ 6] 2360         jsr     L9F1E
   9317 24 03         [ 3] 2361         bcc     L931C  
   9319 7E 92 95      [ 3] 2362         jmp     L9295
   931C                    2363 L931C:
   931C BD 9E 92      [ 6] 2364         jsr     L9E92           ; reset R counts
   931F 7E 92 95      [ 3] 2365         jmp     L9295
   9322                    2366 L9322:
   9322 81 0A         [ 2] 2367         cmpa    #0x0A
   9324 26 0B         [ 3] 2368         bne     L9331  
   9326 BD 9F 1E      [ 6] 2369         jsr     L9F1E
   9329 25 03         [ 3] 2370         bcs     L932E  
   932B BD 9E AF      [ 6] 2371         jsr     L9EAF           ; reset L counts
   932E                    2372 L932E:
   932E 7E 92 95      [ 3] 2373         jmp     L9295
   9331                    2374 L9331:
   9331 81 01         [ 2] 2375         cmpa    #0x01
   9333 26 03         [ 3] 2376         bne     L9338  
   9335 7E A0 E9      [ 3] 2377         jmp     LA0E9
   9338                    2378 L9338:
   9338 81 08         [ 2] 2379         cmpa    #0x08
   933A 26 1F         [ 3] 2380         bne     L935B  
   933C BD 9F 1E      [ 6] 2381         jsr     L9F1E
   933F 25 1A         [ 3] 2382         bcs     L935B  
                           2383 
   9341 BD 8D E4      [ 6] 2384         jsr     LCDMSG1 
   9344 52 65 73 65 74 20  2385         .ascis  'Reset System!'
        53 79 73 74 65 6D
        A1
                           2386 
   9351 7E A2 49      [ 3] 2387         jmp     LA249
   9354 C6 02         [ 2] 2388         ldab    #0x02
   9356 BD 8C 30      [ 6] 2389         jsr     DLYSECSBY2      ; delay 1 sec
   9359 20 18         [ 3] 2390         bra     L9373  
   935B                    2391 L935B:
   935B 81 0C         [ 2] 2392         cmpa    #0x0C
   935D 26 14         [ 3] 2393         bne     L9373  
   935F BD 8B 48      [ 6] 2394         jsr     L8B48
   9362 5F            [ 2] 2395         clrb
   9363 D7 62         [ 3] 2396         stab    (0x0062)
   9365 BD F9 C5      [ 6] 2397         jsr     BUTNLIT 
   9368 B6 18 04      [ 4] 2398         ldaa    PIA0PRA 
   936B 84 BF         [ 2] 2399         anda    #0xBF
   936D B7 18 04      [ 4] 2400         staa    PIA0PRA 
   9370 7E 92 92      [ 3] 2401         jmp     L9292
   9373                    2402 L9373:
   9373 81 0D         [ 2] 2403         cmpa    #0x0D
   9375 26 2E         [ 3] 2404         bne     L93A5  
   9377 BD 8C E9      [ 6] 2405         jsr     L8CE9
                           2406 
   937A BD 8D E4      [ 6] 2407         jsr     LCDMSG1 
   937D 20 20 42 75 74 74  2408         .ascis  '  Button  test'
        6F 6E 20 20 74 65
        73 F4
                           2409 
   938B BD 8D DD      [ 6] 2410         jsr     LCDMSG2 
   938E 20 20 20 50 52 4F  2411         .ascis  '   PROG exits'
        47 20 65 78 69 74
        F3
                           2412 
   939B BD A5 26      [ 6] 2413         jsr     LA526
   939E 5F            [ 2] 2414         clrb
   939F BD F9 C5      [ 6] 2415         jsr     BUTNLIT 
   93A2 7E 92 95      [ 3] 2416         jmp     L9295
   93A5                    2417 L93A5:
   93A5 81 0E         [ 2] 2418         cmpa    #0x0E
   93A7 26 10         [ 3] 2419         bne     L93B9  
   93A9 BD 9F 1E      [ 6] 2420         jsr     L9F1E
   93AC 24 03         [ 3] 2421         bcc     L93B1  
   93AE 7E 92 95      [ 3] 2422         jmp     L9295
   93B1                    2423 L93B1:
   93B1 C6 01         [ 2] 2424         ldab    #0x01
   93B3 BD 8C 30      [ 6] 2425         jsr     DLYSECSBY2      ; delay 0.5 sec
   93B6 7E 94 9A      [ 3] 2426         jmp     L949A
   93B9                    2427 L93B9:
   93B9 81 0F         [ 2] 2428         cmpa    #0x0F
   93BB 26 06         [ 3] 2429         bne     L93C3  
   93BD BD A8 6A      [ 6] 2430         jsr     LA86A
   93C0 7E 92 95      [ 3] 2431         jmp     L9295
   93C3                    2432 L93C3:
   93C3 81 10         [ 2] 2433         cmpa    #0x10
   93C5 26 09         [ 3] 2434         bne     L93D0  
   93C7 BD 9F 1E      [ 6] 2435         jsr     L9F1E
   93CA BD 95 BA      [ 6] 2436         jsr     L95BA
   93CD 7E 92 95      [ 3] 2437         jmp     L9295
                           2438 
   93D0                    2439 L93D0:
   93D0 7E 92 D2      [ 3] 2440         jmp     L92D2
                           2441 
   93D3                    2442 L93D3:
   93D3 56 43 52 20 61 64  2443         .ascis  "VCR adjust,Set Random,Chuck E. Cheese,Jasper,Pasqually,Munch,Helen,Reset System,Reset reg tape#,Reset liv tape#,View Tape #'s,All Lights On,Button test,King enable,Warm-Up,Show Type,Quit Diagnostics"
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
   9499 00                 2444         .byte   0x00
                           2445 
   949A                    2446 L949A:
   949A 7D 04 2A      [ 6] 2447         tst     (0x042A)
   949D 27 27         [ 3] 2448         beq     L94C6  
                           2449 
   949F BD 8D E4      [ 6] 2450         jsr     LCDMSG1 
   94A2 4B 69 6E 67 20 69  2451         .ascis  'King is Enabled'
        73 20 45 6E 61 62
        6C 65 E4
                           2452 
   94B1 BD 8D DD      [ 6] 2453         jsr     LCDMSG2 
   94B4 45 4E 54 45 52 20  2454         .ascis  'ENTER to disable'
        74 6F 20 64 69 73
        61 62 6C E5
                           2455 
   94C4 20 25         [ 3] 2456         bra     L94EB  
                           2457 
   94C6                    2458 L94C6:
   94C6 BD 8D E4      [ 6] 2459         jsr     LCDMSG1 
   94C9 4B 69 6E 67 20 69  2460         .ascis  'King is Disabled'
        73 20 44 69 73 61
        62 6C 65 E4
                           2461 
   94D9 BD 8D DD      [ 6] 2462         jsr     LCDMSG2 
   94DC 45 4E 54 45 52 20  2463         .ascis  'ENTER to enable'
        74 6F 20 65 6E 61
        62 6C E5
                           2464 
   94EB                    2465 L94EB:
   94EB BD 8E 95      [ 6] 2466         jsr     L8E95
   94EE 4D            [ 2] 2467         tsta
   94EF 27 FA         [ 3] 2468         beq     L94EB  
   94F1 81 0D         [ 2] 2469         cmpa    #0x0D
   94F3 27 02         [ 3] 2470         beq     L94F7  
   94F5 20 0A         [ 3] 2471         bra     L9501  
   94F7                    2472 L94F7:
   94F7 B6 04 2A      [ 4] 2473         ldaa    (0x042A)
   94FA 84 01         [ 2] 2474         anda    #0x01
   94FC 88 01         [ 2] 2475         eora    #0x01
   94FE B7 04 2A      [ 4] 2476         staa    (0x042A)
   9501                    2477 L9501:
   9501 7E 92 95      [ 3] 2478         jmp     L9295
   9504                    2479 L9504:
   9504 86 01         [ 2] 2480         ldaa    #0x01
   9506 97 A6         [ 3] 2481         staa    (0x00A6)
   9508 97 A7         [ 3] 2482         staa    (0x00A7)
   950A DF 12         [ 4] 2483         stx     (0x0012)
   950C 20 09         [ 3] 2484         bra     L9517  
   950E 86 01         [ 2] 2485         ldaa    #0x01
   9510 97 A7         [ 3] 2486         staa    (0x00A7)
   9512 7F 00 A6      [ 6] 2487         clr     (0x00A6)
   9515 DF 12         [ 4] 2488         stx     (0x0012)
   9517                    2489 L9517:
   9517 7F 00 16      [ 6] 2490         clr     (0x0016)
   951A 18 DE 46      [ 5] 2491         ldy     (0x0046)
   951D 7D 00 A6      [ 6] 2492         tst     (0x00A6)
   9520 26 07         [ 3] 2493         bne     L9529  
   9522 BD 8C F2      [ 6] 2494         jsr     L8CF2
   9525 86 80         [ 2] 2495         ldaa    #0x80
   9527 20 05         [ 3] 2496         bra     L952E  
   9529                    2497 L9529:
   9529 BD 8D 03      [ 6] 2498         jsr     L8D03
   952C 86 C0         [ 2] 2499         ldaa    #0xC0
   952E                    2500 L952E:
   952E 18 A7 00      [ 5] 2501         staa    0,Y     
   9531 18 6F 01      [ 7] 2502         clr     1,Y     
   9534 18 08         [ 4] 2503         iny
   9536 18 08         [ 4] 2504         iny
   9538 18 8C 05 80   [ 5] 2505         cpy     #0x0580
   953C 25 04         [ 3] 2506         bcs     L9542  
   953E 18 CE 05 00   [ 4] 2507         ldy     #0x0500
   9542                    2508 L9542:
   9542 DF 14         [ 4] 2509         stx     (0x0014)
   9544                    2510 L9544:
   9544 A6 00         [ 4] 2511         ldaa    0,X     
   9546 2A 04         [ 3] 2512         bpl     L954C  
   9548 C6 01         [ 2] 2513         ldab    #0x01
   954A D7 16         [ 3] 2514         stab    (0x0016)
   954C                    2515 L954C:
   954C 81 2C         [ 2] 2516         cmpa    #0x2C
   954E 27 1E         [ 3] 2517         beq     L956E  
   9550 18 6F 00      [ 7] 2518         clr     0,Y     
   9553 84 7F         [ 2] 2519         anda    #0x7F
   9555 18 A7 01      [ 5] 2520         staa    1,Y     
   9558 18 08         [ 4] 2521         iny
   955A 18 08         [ 4] 2522         iny
   955C 18 8C 05 80   [ 5] 2523         cpy     #0x0580
   9560 25 04         [ 3] 2524         bcs     L9566  
   9562 18 CE 05 00   [ 4] 2525         ldy     #0x0500
   9566                    2526 L9566:
   9566 7D 00 16      [ 6] 2527         tst     (0x0016)
   9569 26 03         [ 3] 2528         bne     L956E  
   956B 08            [ 3] 2529         inx
   956C 20 D6         [ 3] 2530         bra     L9544  
   956E                    2531 L956E:
   956E 08            [ 3] 2532         inx
   956F 86 01         [ 2] 2533         ldaa    #0x01
   9571 97 43         [ 3] 2534         staa    (0x0043)
   9573 18 6F 00      [ 7] 2535         clr     0,Y     
   9576 18 6F 01      [ 7] 2536         clr     1,Y     
   9579 18 DF 46      [ 5] 2537         sty     (0x0046)
   957C                    2538 L957C:
   957C BD 8E 95      [ 6] 2539         jsr     L8E95
   957F 27 FB         [ 3] 2540         beq     L957C  
   9581 81 02         [ 2] 2541         cmpa    #0x02
   9583 26 0A         [ 3] 2542         bne     L958F  
   9585 7D 00 16      [ 6] 2543         tst     (0x0016)
   9588 26 05         [ 3] 2544         bne     L958F  
   958A 7C 00 A7      [ 6] 2545         inc     (0x00A7)
   958D 20 88         [ 3] 2546         bra     L9517  
   958F                    2547 L958F:
   958F 81 01         [ 2] 2548         cmpa    #0x01
   9591 26 20         [ 3] 2549         bne     L95B3  
   9593 18 DE 14      [ 5] 2550         ldy     (0x0014)
   9596 18 9C 12      [ 6] 2551         cpy     (0x0012)
   9599 23 E1         [ 3] 2552         bls     L957C  
   959B 7A 00 A7      [ 6] 2553         dec     (0x00A7)
   959E DE 14         [ 4] 2554         ldx     (0x0014)
   95A0 09            [ 3] 2555         dex
   95A1                    2556 L95A1:
   95A1 09            [ 3] 2557         dex
   95A2 9C 12         [ 5] 2558         cpx     (0x0012)
   95A4 26 03         [ 3] 2559         bne     L95A9  
   95A6 7E 95 17      [ 3] 2560         jmp     L9517
   95A9                    2561 L95A9:
   95A9 A6 00         [ 4] 2562         ldaa    0,X     
   95AB 81 2C         [ 2] 2563         cmpa    #0x2C
   95AD 26 F2         [ 3] 2564         bne     L95A1  
   95AF 08            [ 3] 2565         inx
   95B0 7E 95 17      [ 3] 2566         jmp     L9517
   95B3                    2567 L95B3:
   95B3 81 0D         [ 2] 2568         cmpa    #0x0D
   95B5 26 C5         [ 3] 2569         bne     L957C  
   95B7 96 A7         [ 3] 2570         ldaa    (0x00A7)
   95B9 39            [ 5] 2571         rts
                           2572 
   95BA                    2573 L95BA:
   95BA B6 04 5C      [ 4] 2574         ldaa    (0x045C)
   95BD 27 14         [ 3] 2575         beq     L95D3  
                           2576 
   95BF BD 8D E4      [ 6] 2577         jsr     LCDMSG1 
   95C2 43 75 72 72 65 6E  2578         .ascis  'Current: CNR   '
        74 3A 20 43 4E 52
        20 20 A0
                           2579 
   95D1 20 12         [ 3] 2580         bra     L95E5  
                           2581 
   95D3                    2582 L95D3:
   95D3 BD 8D E4      [ 6] 2583         jsr     LCDMSG1 
   95D6 43 75 72 72 65 6E  2584         .ascis  'Current: R12   '
        74 3A 20 52 31 32
        20 20 A0
                           2585 
   95E5                    2586 L95E5:
   95E5 BD 8D DD      [ 6] 2587         jsr     LCDMSG2 
   95E8 3C 45 6E 74 65 72  2588         .ascis  '<Enter> to chg.'
        3E 20 74 6F 20 63
        68 67 AE
                           2589 
   95F7                    2590 L95F7:
   95F7 BD 8E 95      [ 6] 2591         jsr     L8E95
   95FA 27 FB         [ 3] 2592         beq     L95F7  
   95FC 81 0D         [ 2] 2593         cmpa    #0x0D
   95FE 26 0F         [ 3] 2594         bne     L960F  
   9600 B6 04 5C      [ 4] 2595         ldaa    (0x045C)
   9603 27 05         [ 3] 2596         beq     L960A  
   9605 7F 04 5C      [ 6] 2597         clr     (0x045C)
   9608 20 05         [ 3] 2598         bra     L960F  
   960A                    2599 L960A:
   960A 86 01         [ 2] 2600         ldaa    #0x01
   960C B7 04 5C      [ 4] 2601         staa    (0x045C)
   960F                    2602 L960F:
   960F 39            [ 5] 2603         rts
                           2604 
   9610                    2605 L9610:
   9610 43 68 75 63 6B 2C  2606         .ascis  "Chuck,Jasper,Pasqually,Munch,Helen,Light 1,Light 2,Light 3,Star EFX,Wink Spot,Gobo,Clear All Rnd,Exit"
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
                           2607 
   9675                    2608 L9675:
   9675 BD 8D E4      [ 6] 2609         jsr     LCDMSG1 
   9678 52 61 6E 64 6F 6D  2610         .ascis  'Random          '
        20 20 20 20 20 20
        20 20 20 A0
                           2611 
   9688 CE 96 10      [ 3] 2612         ldx     #L9610
   968B BD 95 04      [ 6] 2613         jsr     L9504
   968E 5F            [ 2] 2614         clrb
   968F 37            [ 3] 2615         pshb
   9690 81 0D         [ 2] 2616         cmpa    #0x0D
   9692 26 03         [ 3] 2617         bne     L9697  
   9694 7E 97 5B      [ 3] 2618         jmp     L975B
   9697                    2619 L9697:
   9697 81 0C         [ 2] 2620         cmpa    #0x0C
   9699 26 21         [ 3] 2621         bne     L96BC  
   969B 7F 04 01      [ 6] 2622         clr     (0x0401)
   969E 7F 04 2B      [ 6] 2623         clr     (0x042B)
                           2624 
   96A1 BD 8D E4      [ 6] 2625         jsr     LCDMSG1 
   96A4 41 6C 6C 20 52 6E  2626         .ascis  'All Rnd Cleared!'
        64 20 43 6C 65 61
        72 65 64 A1
                           2627 
   96B4 C6 64         [ 2] 2628         ldab    #0x64           ; delay 1 sec
   96B6 BD 8C 22      [ 6] 2629         jsr     DLYSECSBY100
   96B9 7E 97 5B      [ 3] 2630         jmp     L975B
   96BC                    2631 L96BC:
   96BC 81 09         [ 2] 2632         cmpa    #0x09
   96BE 25 05         [ 3] 2633         bcs     L96C5  
   96C0 80 08         [ 2] 2634         suba    #0x08
   96C2 33            [ 4] 2635         pulb
   96C3 5C            [ 2] 2636         incb
   96C4 37            [ 3] 2637         pshb
   96C5                    2638 L96C5:
   96C5 5F            [ 2] 2639         clrb
   96C6 0D            [ 2] 2640         sec
   96C7                    2641 L96C7:
   96C7 59            [ 2] 2642         rolb
   96C8 4A            [ 2] 2643         deca
   96C9 26 FC         [ 3] 2644         bne     L96C7  
   96CB D7 12         [ 3] 2645         stab    (0x0012)
   96CD C8 FF         [ 2] 2646         eorb    #0xFF
   96CF D7 13         [ 3] 2647         stab    (0x0013)
   96D1                    2648 L96D1:
   96D1 CC 20 34      [ 3] 2649         ldd     #0x2034         ;' '
   96D4 BD 8D B5      [ 6] 2650         jsr     L8DB5           ; display char here on LCD display
   96D7 33            [ 4] 2651         pulb
   96D8 37            [ 3] 2652         pshb
   96D9 5D            [ 2] 2653         tstb
   96DA 27 05         [ 3] 2654         beq     L96E1  
   96DC B6 04 2B      [ 4] 2655         ldaa    (0x042B)
   96DF 20 03         [ 3] 2656         bra     L96E4  
   96E1                    2657 L96E1:
   96E1 B6 04 01      [ 4] 2658         ldaa    (0x0401)
   96E4                    2659 L96E4:
   96E4 94 12         [ 3] 2660         anda    (0x0012)
   96E6 27 0A         [ 3] 2661         beq     L96F2  
   96E8 18 DE 46      [ 5] 2662         ldy     (0x0046)
   96EB BD 8D FD      [ 6] 2663         jsr     L8DFD
   96EE 4F            [ 2] 2664         clra
   96EF EE 20         [ 5] 2665         ldx     0x20,X
   96F1 09            [ 3] 2666         dex
   96F2                    2667 L96F2:
   96F2 18 DE 46      [ 5] 2668         ldy     (0x0046)
   96F5 BD 8D FD      [ 6] 2669         jsr     L8DFD
   96F8 4F            [ 2] 2670         clra
   96F9 66 E6         [ 6] 2671         ror     0xE6,X
   96FB CC 20 34      [ 3] 2672         ldd     #0x2034         ;' '
   96FE BD 8D B5      [ 6] 2673         jsr     L8DB5           ; display char here on LCD display
   9701                    2674 L9701:
   9701 BD 8E 95      [ 6] 2675         jsr     L8E95           ; wait for an SCD key
   9704 27 FB         [ 3] 2676         beq     L9701  
   9706 81 01         [ 2] 2677         cmpa    #0x01           ; is it up?
   9708 26 22         [ 3] 2678         bne     L972C           ; no jump ahead
   970A 33            [ 4] 2679         pulb
   970B 37            [ 3] 2680         pshb
   970C 5D            [ 2] 2681         tstb
   970D 27 0A         [ 3] 2682         beq     L9719           ; if B=0, modify 0401 mask  
   970F B6 04 2B      [ 4] 2683         ldaa    (0x042B)        ; else modify 042B mask
   9712 9A 12         [ 3] 2684         oraa    (0x0012)
   9714 B7 04 2B      [ 4] 2685         staa    (0x042B)
   9717 20 08         [ 3] 2686         bra     L9721  
   9719                    2687 L9719:
   9719 B6 04 01      [ 4] 2688         ldaa    (0x0401)
   971C 9A 12         [ 3] 2689         oraa    (0x0012)
   971E B7 04 01      [ 4] 2690         staa    (0x0401)
   9721                    2691 L9721:
   9721 18 DE 46      [ 5] 2692         ldy     (0x0046)
   9724 BD 8D FD      [ 6] 2693         jsr     L8DFD
   9727 4F            [ 2] 2694         clra
   9728 6E A0         [ 3] 2695         jmp     0xA0,X
   972A 20 A5         [ 3] 2696         bra     L96D1  
   972C                    2697 L972C:
   972C 81 02         [ 2] 2698         cmpa    #0x02
   972E 26 23         [ 3] 2699         bne     L9753  
   9730 33            [ 4] 2700         pulb
   9731 37            [ 3] 2701         pshb
   9732 5D            [ 2] 2702         tstb
   9733 27 0A         [ 3] 2703         beq     L973F  
   9735 B6 04 2B      [ 4] 2704         ldaa    (0x042B)
   9738 94 13         [ 3] 2705         anda    (0x0013)
   973A B7 04 2B      [ 4] 2706         staa    (0x042B)
   973D 20 08         [ 3] 2707         bra     L9747  
   973F                    2708 L973F:
   973F B6 04 01      [ 4] 2709         ldaa    (0x0401)
   9742 94 13         [ 3] 2710         anda    (0x0013)
   9744 B7 04 01      [ 4] 2711         staa    (0x0401)
   9747                    2712 L9747:
   9747 18 DE 46      [ 5] 2713         ldy     (0x0046)
   974A BD 8D FD      [ 6] 2714         jsr     L8DFD
   974D 4F            [ 2] 2715         clra
   974E 66 E6         [ 6] 2716         ror     0xE6,X
   9750 7E 96 D1      [ 3] 2717         jmp     L96D1
   9753                    2718 L9753:
   9753 81 0D         [ 2] 2719         cmpa    #0x0D
   9755 26 AA         [ 3] 2720         bne     L9701  
   9757 33            [ 4] 2721         pulb
   9758 7E 96 75      [ 3] 2722         jmp     L9675
   975B                    2723 L975B:
   975B 33            [ 4] 2724         pulb
   975C 7E 92 92      [ 3] 2725         jmp     L9292
                           2726 
                           2727 ; do program rom checksum, and display it on the LCD screen
   975F                    2728 L975F:
   975F CE 00 00      [ 3] 2729         ldx     #0x0000
   9762 18 CE 80 00   [ 4] 2730         ldy     #0x8000
   9766                    2731 L9766:
   9766 18 E6 00      [ 5] 2732         ldab    0,Y     
   9769 18 08         [ 4] 2733         iny
   976B 3A            [ 3] 2734         abx
   976C 18 8C 00 00   [ 5] 2735         cpy     #0x0000
   9770 26 F4         [ 3] 2736         bne     L9766  
   9772 DF 17         [ 4] 2737         stx     (0x0017)        ; store rom checksum here
   9774 96 17         [ 3] 2738         ldaa    (0x0017)        ; get high byte of checksum
   9776 BD 97 9B      [ 6] 2739         jsr     L979B           ; convert it to 2 hex chars
   9779 96 12         [ 3] 2740         ldaa    (0x0012)
   977B C6 33         [ 2] 2741         ldab    #0x33
   977D BD 8D B5      [ 6] 2742         jsr     L8DB5           ; display char 1 here on LCD display
   9780 96 13         [ 3] 2743         ldaa    (0x0013)
   9782 C6 34         [ 2] 2744         ldab    #0x34
   9784 BD 8D B5      [ 6] 2745         jsr     L8DB5           ; display char 2 here on LCD display
   9787 96 18         [ 3] 2746         ldaa    (0x0018)        ; get low byte of checksum
   9789 BD 97 9B      [ 6] 2747         jsr     L979B           ; convert it to 2 hex chars
   978C 96 12         [ 3] 2748         ldaa    (0x0012)
   978E C6 35         [ 2] 2749         ldab    #0x35
   9790 BD 8D B5      [ 6] 2750         jsr     L8DB5           ; display char 1 here on LCD display
   9793 96 13         [ 3] 2751         ldaa    (0x0013)
   9795 C6 36         [ 2] 2752         ldab    #0x36
   9797 BD 8D B5      [ 6] 2753         jsr     L8DB5           ; display char 2 here on LCD display
   979A 39            [ 5] 2754         rts
                           2755 
                           2756 ; convert A to ASCII hex digit, store in (0x0012:0x0013)
   979B                    2757 L979B:
   979B 36            [ 3] 2758         psha
   979C 84 0F         [ 2] 2759         anda    #0x0F
   979E 8B 30         [ 2] 2760         adda    #0x30
   97A0 81 39         [ 2] 2761         cmpa    #0x39
   97A2 23 02         [ 3] 2762         bls     L97A6  
   97A4 8B 07         [ 2] 2763         adda    #0x07
   97A6                    2764 L97A6:
   97A6 97 13         [ 3] 2765         staa    (0x0013)
   97A8 32            [ 4] 2766         pula
   97A9 84 F0         [ 2] 2767         anda    #0xF0
   97AB 44            [ 2] 2768         lsra
   97AC 44            [ 2] 2769         lsra
   97AD 44            [ 2] 2770         lsra
   97AE 44            [ 2] 2771         lsra
   97AF 8B 30         [ 2] 2772         adda    #0x30
   97B1 81 39         [ 2] 2773         cmpa    #0x39
   97B3 23 02         [ 3] 2774         bls     L97B7  
   97B5 8B 07         [ 2] 2775         adda    #0x07
   97B7                    2776 L97B7:
   97B7 97 12         [ 3] 2777         staa    (0x0012)
   97B9 39            [ 5] 2778         rts
                           2779 
   97BA                    2780 L97BA:
   97BA BD 9D 18      [ 6] 2781         jsr     L9D18
   97BD 24 03         [ 3] 2782         bcc     L97C2  
   97BF 7E 9A 7F      [ 3] 2783         jmp     L9A7F
   97C2                    2784 L97C2:
   97C2 7D 00 79      [ 6] 2785         tst     (0x0079)
   97C5 26 0B         [ 3] 2786         bne     L97D2  
   97C7 FC 04 10      [ 5] 2787         ldd     (0x0410)
   97CA C3 00 01      [ 4] 2788         addd    #0x0001
   97CD FD 04 10      [ 5] 2789         std     (0x0410)
   97D0 20 09         [ 3] 2790         bra     L97DB  
   97D2                    2791 L97D2:
   97D2 FC 04 12      [ 5] 2792         ldd     (0x0412)
   97D5 C3 00 01      [ 4] 2793         addd    #0x0001
   97D8 FD 04 12      [ 5] 2794         std     (0x0412)
   97DB                    2795 L97DB:
   97DB 86 78         [ 2] 2796         ldaa    #0x78
   97DD 97 63         [ 3] 2797         staa    (0x0063)
   97DF 97 64         [ 3] 2798         staa    (0x0064)
   97E1 BD A3 13      [ 6] 2799         jsr     LA313
   97E4 BD AA DB      [ 6] 2800         jsr     LAADB
   97E7 86 01         [ 2] 2801         ldaa    #0x01
   97E9 97 4E         [ 3] 2802         staa    (0x004E)
   97EB 97 76         [ 3] 2803         staa    (0x0076)
   97ED 7F 00 75      [ 6] 2804         clr     (0x0075)
   97F0 7F 00 77      [ 6] 2805         clr     (0x0077)
   97F3 BD 87 AE      [ 6] 2806         jsr     L87AE
   97F6 D6 7B         [ 3] 2807         ldab    (0x007B)
   97F8 CA 20         [ 2] 2808         orab    #0x20
   97FA C4 F7         [ 2] 2809         andb    #0xF7
   97FC BD 87 48      [ 6] 2810         jsr     L8748   
   97FF 7E 85 A4      [ 3] 2811         jmp     L85A4
   9802                    2812 L9802:
   9802 7F 00 76      [ 6] 2813         clr     (0x0076)
   9805 7F 00 75      [ 6] 2814         clr     (0x0075)
   9808 7F 00 77      [ 6] 2815         clr     (0x0077)
   980B 7F 00 4E      [ 6] 2816         clr     (0x004E)
   980E D6 7B         [ 3] 2817         ldab    (0x007B)
   9810 CA 0C         [ 2] 2818         orab    #0x0C
   9812 BD 87 48      [ 6] 2819         jsr     L8748
   9815                    2820 L9815:
   9815 BD A3 1E      [ 6] 2821         jsr     LA31E
   9818 BD 86 C4      [ 6] 2822         jsr     L86C4           ; Reset boards 1-10
   981B BD 9C 51      [ 6] 2823         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   981E BD 8E 95      [ 6] 2824         jsr     L8E95
   9821 7E 84 4D      [ 3] 2825         jmp     L844D
   9824                    2826 L9824:
   9824 BD 9C 51      [ 6] 2827         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9827 7F 00 4E      [ 6] 2828         clr     (0x004E)
   982A D6 7B         [ 3] 2829         ldab    (0x007B)
   982C CA 24         [ 2] 2830         orab    #0x24
   982E C4 F7         [ 2] 2831         andb    #0xF7
   9830 BD 87 48      [ 6] 2832         jsr     L8748   
   9833 BD 87 AE      [ 6] 2833         jsr     L87AE
   9836 BD 8E 95      [ 6] 2834         jsr     L8E95
   9839 7E 84 4D      [ 3] 2835         jmp     L844D
   983C                    2836 L983C:
   983C 7F 00 78      [ 6] 2837         clr     (0x0078)
   983F B6 10 8A      [ 4] 2838         ldaa    (0x108A)
   9842 84 F9         [ 2] 2839         anda    #0xF9
   9844 B7 10 8A      [ 4] 2840         staa    (0x108A)
   9847 7D 00 AF      [ 6] 2841         tst     (0x00AF)
   984A 26 61         [ 3] 2842         bne     L98AD  
   984C 96 62         [ 3] 2843         ldaa    (0x0062)
   984E 84 01         [ 2] 2844         anda    #0x01
   9850 27 5B         [ 3] 2845         beq     L98AD  
   9852 C6 FD         [ 2] 2846         ldab    #0xFD           ; tape deck STOP
   9854 BD 86 E7      [ 6] 2847         jsr     L86E7
   9857 CC 00 32      [ 3] 2848         ldd     #0x0032
   985A DD 1B         [ 4] 2849         std     CDTIMR1
   985C CC 75 30      [ 3] 2850         ldd     #0x7530
   985F DD 1D         [ 4] 2851         std     CDTIMR2
   9861 7F 00 5A      [ 6] 2852         clr     (0x005A)
   9864                    2853 L9864:
   9864 BD 9B 19      [ 6] 2854         jsr     L9B19           ; do the random motions if enabled
   9867 7D 00 31      [ 6] 2855         tst     (0x0031)
   986A 26 04         [ 3] 2856         bne     L9870  
   986C 96 5A         [ 3] 2857         ldaa    (0x005A)
   986E 27 19         [ 3] 2858         beq     L9889  
   9870                    2859 L9870:
   9870 7F 00 31      [ 6] 2860         clr     (0x0031)
   9873 D6 62         [ 3] 2861         ldab    (0x0062)
   9875 C4 FE         [ 2] 2862         andb    #0xFE
   9877 D7 62         [ 3] 2863         stab    (0x0062)
   9879 BD F9 C5      [ 6] 2864         jsr     BUTNLIT 
   987C BD AA 13      [ 6] 2865         jsr     LAA13
   987F C6 FB         [ 2] 2866         ldab    #0xFB           ; tape deck PLAY
   9881 BD 86 E7      [ 6] 2867         jsr     L86E7
   9884 7F 00 5A      [ 6] 2868         clr     (0x005A)
   9887 20 4B         [ 3] 2869         bra     L98D4  
   9889                    2870 L9889:
   9889 DC 1B         [ 4] 2871         ldd     CDTIMR1
   988B 26 D7         [ 3] 2872         bne     L9864  
   988D D6 62         [ 3] 2873         ldab    (0x0062)
   988F C8 01         [ 2] 2874         eorb    #0x01
   9891 D7 62         [ 3] 2875         stab    (0x0062)
   9893 BD F9 C5      [ 6] 2876         jsr     BUTNLIT 
   9896 C4 01         [ 2] 2877         andb    #0x01
   9898 26 05         [ 3] 2878         bne     L989F  
   989A BD AA 0C      [ 6] 2879         jsr     LAA0C
   989D 20 03         [ 3] 2880         bra     L98A2  
   989F                    2881 L989F:
   989F BD AA 13      [ 6] 2882         jsr     LAA13
   98A2                    2883 L98A2:
   98A2 CC 00 32      [ 3] 2884         ldd     #0x0032
   98A5 DD 1B         [ 4] 2885         std     CDTIMR1
   98A7 DC 1D         [ 4] 2886         ldd     CDTIMR2
   98A9 27 C5         [ 3] 2887         beq     L9870  
   98AB 20 B7         [ 3] 2888         bra     L9864  
   98AD                    2889 L98AD:
   98AD 7D 00 75      [ 6] 2890         tst     (0x0075)
   98B0 27 03         [ 3] 2891         beq     L98B5  
   98B2 7E 99 39      [ 3] 2892         jmp     L9939
   98B5                    2893 L98B5:
   98B5 96 62         [ 3] 2894         ldaa    (0x0062)
   98B7 84 02         [ 2] 2895         anda    #0x02
   98B9 27 4E         [ 3] 2896         beq     L9909  
   98BB 7D 00 AF      [ 6] 2897         tst     (0x00AF)
   98BE 26 0B         [ 3] 2898         bne     L98CB  
   98C0 FC 04 24      [ 5] 2899         ldd     (0x0424)
   98C3 C3 00 01      [ 4] 2900         addd    #0x0001
   98C6 FD 04 24      [ 5] 2901         std     (0x0424)
   98C9 20 09         [ 3] 2902         bra     L98D4  
   98CB                    2903 L98CB:
   98CB FC 04 22      [ 5] 2904         ldd     (0x0422)
   98CE C3 00 01      [ 4] 2905         addd    #0x0001
   98D1 FD 04 22      [ 5] 2906         std     (0x0422)
   98D4                    2907 L98D4:
   98D4 FC 04 18      [ 5] 2908         ldd     (0x0418)
   98D7 C3 00 01      [ 4] 2909         addd    #0x0001
   98DA FD 04 18      [ 5] 2910         std     (0x0418)
   98DD 86 78         [ 2] 2911         ldaa    #0x78
   98DF 97 63         [ 3] 2912         staa    (0x0063)
   98E1 97 64         [ 3] 2913         staa    (0x0064)
   98E3 D6 62         [ 3] 2914         ldab    (0x0062)
   98E5 C4 F7         [ 2] 2915         andb    #0xF7
   98E7 CA 02         [ 2] 2916         orab    #0x02
   98E9 D7 62         [ 3] 2917         stab    (0x0062)
   98EB BD F9 C5      [ 6] 2918         jsr     BUTNLIT 
   98EE BD AA 18      [ 6] 2919         jsr     LAA18
   98F1 86 01         [ 2] 2920         ldaa    #0x01
   98F3 97 4E         [ 3] 2921         staa    (0x004E)
   98F5 97 75         [ 3] 2922         staa    (0x0075)
   98F7 D6 7B         [ 3] 2923         ldab    (0x007B)
   98F9 C4 DF         [ 2] 2924         andb    #0xDF
   98FB BD 87 48      [ 6] 2925         jsr     L8748   
   98FE BD 87 AE      [ 6] 2926         jsr     L87AE
   9901 BD A3 13      [ 6] 2927         jsr     LA313
   9904 BD AA DB      [ 6] 2928         jsr     LAADB
   9907 20 30         [ 3] 2929         bra     L9939  
   9909                    2930 L9909:
   9909 D6 62         [ 3] 2931         ldab    (0x0062)
   990B C4 F5         [ 2] 2932         andb    #0xF5
   990D CA 40         [ 2] 2933         orab    #0x40
   990F D7 62         [ 3] 2934         stab    (0x0062)
   9911 BD F9 C5      [ 6] 2935         jsr     BUTNLIT 
   9914 BD AA 1D      [ 6] 2936         jsr     LAA1D
   9917 7D 00 AF      [ 6] 2937         tst     (0x00AF)
   991A 26 04         [ 3] 2938         bne     L9920  
   991C C6 01         [ 2] 2939         ldab    #0x01
   991E D7 B6         [ 3] 2940         stab    (0x00B6)
   9920                    2941 L9920:
   9920 BD 9C 51      [ 6] 2942         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9923 7F 00 4E      [ 6] 2943         clr     (0x004E)
   9926 7F 00 75      [ 6] 2944         clr     (0x0075)
   9929 86 01         [ 2] 2945         ldaa    #0x01
   992B 97 77         [ 3] 2946         staa    (0x0077)
   992D D6 7B         [ 3] 2947         ldab    (0x007B)
   992F CA 24         [ 2] 2948         orab    #0x24
   9931 C4 F7         [ 2] 2949         andb    #0xF7
   9933 BD 87 48      [ 6] 2950         jsr     L8748   
   9936 BD 87 91      [ 6] 2951         jsr     L8791   
   9939                    2952 L9939:
   9939 7F 00 AF      [ 6] 2953         clr     (0x00AF)
   993C 7E 85 A4      [ 3] 2954         jmp     L85A4
   993F                    2955 L993F:
   993F 7F 00 77      [ 6] 2956         clr     (0x0077)
   9942 BD 9C 51      [ 6] 2957         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9945 7F 00 4E      [ 6] 2958         clr     (0x004E)
   9948 D6 62         [ 3] 2959         ldab    (0x0062)
   994A C4 BF         [ 2] 2960         andb    #0xBF
   994C 7D 00 75      [ 6] 2961         tst     (0x0075)
   994F 27 02         [ 3] 2962         beq     L9953  
   9951 C4 FD         [ 2] 2963         andb    #0xFD
   9953                    2964 L9953:
   9953 D7 62         [ 3] 2965         stab    (0x0062)
   9955 BD F9 C5      [ 6] 2966         jsr     BUTNLIT 
   9958 BD AA 1D      [ 6] 2967         jsr     LAA1D
   995B 7F 00 5B      [ 6] 2968         clr     (0x005B)
   995E BD 87 AE      [ 6] 2969         jsr     L87AE
   9961 D6 7B         [ 3] 2970         ldab    (0x007B)
   9963 CA 20         [ 2] 2971         orab    #0x20
   9965 BD 87 48      [ 6] 2972         jsr     L8748   
   9968 7F 00 75      [ 6] 2973         clr     (0x0075)
   996B 7F 00 76      [ 6] 2974         clr     (0x0076)
   996E 7E 98 15      [ 3] 2975         jmp     L9815
   9971                    2976 L9971:
   9971 D6 7B         [ 3] 2977         ldab    (0x007B)
   9973 C4 FB         [ 2] 2978         andb    #0xFB
   9975 BD 87 48      [ 6] 2979         jsr     L8748   
   9978 7E 85 A4      [ 3] 2980         jmp     L85A4
   997B                    2981 L997B:
   997B D6 7B         [ 3] 2982         ldab    (0x007B)
   997D CA 04         [ 2] 2983         orab    #0x04
   997F BD 87 48      [ 6] 2984         jsr     L8748   
   9982 7E 85 A4      [ 3] 2985         jmp     L85A4
   9985                    2986 L9985:
   9985 D6 7B         [ 3] 2987         ldab    (0x007B)
   9987 C4 F7         [ 2] 2988         andb    #0xF7
   9989 BD 87 48      [ 6] 2989         jsr     L8748   
   998C 7E 85 A4      [ 3] 2990         jmp     L85A4
   998F                    2991 L998F:
   998F 7D 00 77      [ 6] 2992         tst     (0x0077)
   9992 26 07         [ 3] 2993         bne     L999B
   9994 D6 7B         [ 3] 2994         ldab    (0x007B)
   9996 CA 08         [ 2] 2995         orab    #0x08
   9998 BD 87 48      [ 6] 2996         jsr     L8748   
   999B                    2997 L999B:
   999B 7E 85 A4      [ 3] 2998         jmp     L85A4
   999E                    2999 L999E:
   999E D6 7B         [ 3] 3000         ldab    (0x007B)
   99A0 C4 F3         [ 2] 3001         andb    #0xF3
   99A2 BD 87 48      [ 6] 3002         jsr     L8748   
   99A5 39            [ 5] 3003         rts
                           3004 
                           3005 ; main2
   99A6                    3006 L99A6:
   99A6 D6 7B         [ 3] 3007         ldab    (0x007B)
   99A8 C4 DF         [ 2] 3008         andb    #0xDF           ; clear bit 5
   99AA BD 87 48      [ 6] 3009         jsr     L8748
   99AD BD 87 91      [ 6] 3010         jsr     L8791   
   99B0 39            [ 5] 3011         rts
                           3012 
   99B1                    3013 L99B1:
   99B1 D6 7B         [ 3] 3014         ldab    (0x007B)
   99B3 CA 20         [ 2] 3015         orab    #0x20
   99B5 BD 87 48      [ 6] 3016         jsr     L8748   
   99B8 BD 87 AE      [ 6] 3017         jsr     L87AE
   99BB 39            [ 5] 3018         rts
                           3019 
   99BC D6 7B         [ 3] 3020         ldab    (0x007B)
   99BE C4 DF         [ 2] 3021         andb    #0xDF
   99C0 BD 87 48      [ 6] 3022         jsr     L8748   
   99C3 BD 87 AE      [ 6] 3023         jsr     L87AE
   99C6 39            [ 5] 3024         rts
                           3025 
   99C7 D6 7B         [ 3] 3026         ldab    (0x007B)
   99C9 CA 20         [ 2] 3027         orab    #0x20
   99CB BD 87 48      [ 6] 3028         jsr     L8748   
   99CE BD 87 91      [ 6] 3029         jsr     L8791   
   99D1 39            [ 5] 3030         rts
                           3031 
   99D2                    3032 L99D2:
   99D2 86 01         [ 2] 3033         ldaa    #0x01
   99D4 97 78         [ 3] 3034         staa    (0x0078)
   99D6 7E 85 A4      [ 3] 3035         jmp     L85A4
   99D9                    3036 L99D9:
   99D9 CE 0E 20      [ 3] 3037         ldx     #0x0E20
   99DC A6 00         [ 4] 3038         ldaa    0,X     
   99DE 80 30         [ 2] 3039         suba    #0x30
   99E0 C6 0A         [ 2] 3040         ldab    #0x0A
   99E2 3D            [10] 3041         mul
   99E3 17            [ 2] 3042         tba                     ; (0E20)*10 into A
   99E4 C6 64         [ 2] 3043         ldab    #0x64
   99E6 3D            [10] 3044         mul
   99E7 DD 17         [ 4] 3045         std     (0x0017)        ; (0E20)*1000 into 17:18
   99E9 A6 01         [ 4] 3046         ldaa    1,X
   99EB 80 30         [ 2] 3047         suba    #0x30
   99ED C6 64         [ 2] 3048         ldab    #0x64
   99EF 3D            [10] 3049         mul
   99F0 D3 17         [ 5] 3050         addd    (0x0017)
   99F2 DD 17         [ 4] 3051         std     (0x0017)        ; (0E20)*1000+(0E21)*100 into 17:18
   99F4 A6 02         [ 4] 3052         ldaa    2,X     
   99F6 80 30         [ 2] 3053         suba    #0x30
   99F8 C6 0A         [ 2] 3054         ldab    #0x0A
   99FA 3D            [10] 3055         mul
   99FB D3 17         [ 5] 3056         addd    (0x0017)    
   99FD DD 17         [ 4] 3057         std     (0x0017)        ; (0E20)*1000+(0E21)*100+(0E22)*10 into 17:18
   99FF 4F            [ 2] 3058         clra
   9A00 E6 03         [ 4] 3059         ldab    3,X     
   9A02 C0 30         [ 2] 3060         subb    #0x30
   9A04 D3 17         [ 5] 3061         addd    (0x0017)    
   9A06 FD 02 9C      [ 5] 3062         std     (0x029C)        ; (0E20)*1000+(0E21)*100+(0E22)*10+(0E23) into (029C:029D)
   9A09 CE 0E 20      [ 3] 3063         ldx     #0x0E20
   9A0C                    3064 L9A0C:
   9A0C A6 00         [ 4] 3065         ldaa    0,X         
   9A0E 81 30         [ 2] 3066         cmpa    #0x30
   9A10 25 13         [ 3] 3067         bcs     L9A25  
   9A12 81 39         [ 2] 3068         cmpa    #0x39
   9A14 22 0F         [ 3] 3069         bhi     L9A25  
   9A16 08            [ 3] 3070         inx
   9A17 8C 0E 24      [ 4] 3071         cpx     #0x0E24
   9A1A 26 F0         [ 3] 3072         bne     L9A0C  
   9A1C B6 0E 24      [ 4] 3073         ldaa    (0x0E24)        ; check EEPROM signature
   9A1F 81 DB         [ 2] 3074         cmpa    #0xDB
   9A21 26 02         [ 3] 3075         bne     L9A25  
   9A23 0C            [ 2] 3076         clc                     ; if sig good, return carry clear
   9A24 39            [ 5] 3077         rts
                           3078 
   9A25                    3079 L9A25:
   9A25 0D            [ 2] 3080         sec                     ; if sig bad, return carry clear
   9A26 39            [ 5] 3081         rts
                           3082 
   9A27                    3083 L9A27:
   9A27 BD 8D E4      [ 6] 3084         jsr     LCDMSG1 
   9A2A 53 65 72 69 61 6C  3085         .ascis  'Serial# '
        23 A0
                           3086 
   9A32 BD 8D DD      [ 6] 3087         jsr     LCDMSG2 
   9A35 20 20 20 20 20 20  3088         .ascis  '               '
        20 20 20 20 20 20
        20 20 A0
                           3089 
                           3090 ; display 4-digit serial number
   9A44 C6 08         [ 2] 3091         ldab    #0x08
   9A46 18 CE 0E 20   [ 4] 3092         ldy     #0x0E20
   9A4A                    3093 L9A4A:
   9A4A 18 A6 00      [ 5] 3094         ldaa    0,Y     
   9A4D 18 3C         [ 5] 3095         pshy
   9A4F 37            [ 3] 3096         pshb
   9A50 BD 8D B5      [ 6] 3097         jsr     L8DB5            ; display char here on LCD display
   9A53 33            [ 4] 3098         pulb
   9A54 18 38         [ 6] 3099         puly
   9A56 5C            [ 2] 3100         incb
   9A57 18 08         [ 4] 3101         iny
   9A59 18 8C 0E 24   [ 5] 3102         cpy     #0x0E24
   9A5D 26 EB         [ 3] 3103         bne     L9A4A  
   9A5F 39            [ 5] 3104         rts
                           3105 
                           3106 ; Unused?
   9A60                    3107 L9A60:
   9A60 86 01         [ 2] 3108         ldaa    #0x01
   9A62 97 B5         [ 3] 3109         staa    (0x00B5)
   9A64 96 4E         [ 3] 3110         ldaa    (0x004E)
   9A66 97 7F         [ 3] 3111         staa    (0x007F)
   9A68 96 62         [ 3] 3112         ldaa    (0x0062)
   9A6A 97 80         [ 3] 3113         staa    (0x0080)
   9A6C 96 7B         [ 3] 3114         ldaa    (0x007B)
   9A6E 97 81         [ 3] 3115         staa    (0x0081)
   9A70 96 7A         [ 3] 3116         ldaa    (0x007A)
   9A72 97 82         [ 3] 3117         staa    (0x0082)
   9A74 96 78         [ 3] 3118         ldaa    (0x0078)
   9A76 97 7D         [ 3] 3119         staa    (0x007D)
   9A78 B6 10 8A      [ 4] 3120         ldaa    (0x108A)
   9A7B 84 06         [ 2] 3121         anda    #0x06
   9A7D 97 7E         [ 3] 3122         staa    (0x007E)
   9A7F                    3123 L9A7F:
   9A7F C6 EF         [ 2] 3124         ldab    #0xEF           ; tape deck EJECT
   9A81 BD 86 E7      [ 6] 3125         jsr     L86E7
   9A84 D6 7B         [ 3] 3126         ldab    (0x007B)
   9A86 CA 0C         [ 2] 3127         orab    #0x0C
   9A88 C4 DF         [ 2] 3128         andb    #0xDF
   9A8A BD 87 48      [ 6] 3129         jsr     L8748   
   9A8D BD 87 91      [ 6] 3130         jsr     L8791   
   9A90 BD 86 C4      [ 6] 3131         jsr     L86C4           ; Reset boards 1-10
   9A93 BD 9C 51      [ 6] 3132         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9A96 C6 06         [ 2] 3133         ldab    #0x06           ; delay 6 secs
   9A98 BD 8C 02      [ 6] 3134         jsr     DLYSECS         ;
   9A9B BD 8E 95      [ 6] 3135         jsr     L8E95
   9A9E BD 99 A6      [ 6] 3136         jsr     L99A6
   9AA1 7E 81 BD      [ 3] 3137         jmp     L81BD
   9AA4                    3138 L9AA4:
   9AA4 7F 00 5C      [ 6] 3139         clr     (0x005C)
   9AA7 86 01         [ 2] 3140         ldaa    #0x01
   9AA9 97 79         [ 3] 3141         staa    (0x0079)
   9AAB C6 FD         [ 2] 3142         ldab    #0xFD           ; tape deck STOP
   9AAD BD 86 E7      [ 6] 3143         jsr     L86E7
   9AB0 BD 8E 95      [ 6] 3144         jsr     L8E95
   9AB3 CC 75 30      [ 3] 3145         ldd     #0x7530
   9AB6 DD 1D         [ 4] 3146         std     CDTIMR2
   9AB8                    3147 L9AB8:
   9AB8 BD 9B 19      [ 6] 3148         jsr     L9B19           ; do the random motions if enabled
   9ABB D6 62         [ 3] 3149         ldab    (0x0062)
   9ABD C8 04         [ 2] 3150         eorb    #0x04
   9ABF D7 62         [ 3] 3151         stab    (0x0062)
   9AC1 BD F9 C5      [ 6] 3152         jsr     BUTNLIT 
   9AC4 F6 18 04      [ 4] 3153         ldab    PIA0PRA 
   9AC7 C8 08         [ 2] 3154         eorb    #0x08
   9AC9 F7 18 04      [ 4] 3155         stab    PIA0PRA 
   9ACC 7D 00 5C      [ 6] 3156         tst     (0x005C)
   9ACF 26 12         [ 3] 3157         bne     L9AE3  
   9AD1 BD 8E 95      [ 6] 3158         jsr     L8E95
   9AD4 81 0D         [ 2] 3159         cmpa    #0x0D
   9AD6 27 0B         [ 3] 3160         beq     L9AE3  
   9AD8 C6 32         [ 2] 3161         ldab    #0x32           ; delay 0.5 sec
   9ADA BD 8C 22      [ 6] 3162         jsr     DLYSECSBY100
   9ADD DC 1D         [ 4] 3163         ldd     CDTIMR2
   9ADF 27 02         [ 3] 3164         beq     L9AE3  
   9AE1 20 D5         [ 3] 3165         bra     L9AB8  
   9AE3                    3166 L9AE3:
   9AE3 D6 62         [ 3] 3167         ldab    (0x0062)
   9AE5 C4 FB         [ 2] 3168         andb    #0xFB
   9AE7 D7 62         [ 3] 3169         stab    (0x0062)
   9AE9 BD F9 C5      [ 6] 3170         jsr     BUTNLIT 
   9AEC BD A3 54      [ 6] 3171         jsr     LA354
   9AEF C6 FB         [ 2] 3172         ldab    #0xFB           ; tape deck PLAY
   9AF1 BD 86 E7      [ 6] 3173         jsr     L86E7
   9AF4 7E 85 A4      [ 3] 3174         jmp     L85A4
   9AF7                    3175 L9AF7:
   9AF7 7F 00 75      [ 6] 3176         clr     (0x0075)
   9AFA 7F 00 76      [ 6] 3177         clr     (0x0076)
   9AFD 7F 00 77      [ 6] 3178         clr     (0x0077)
   9B00 7F 00 78      [ 6] 3179         clr     (0x0078)
   9B03 7F 00 25      [ 6] 3180         clr     (0x0025)
   9B06 7F 00 26      [ 6] 3181         clr     (0x0026)
   9B09 7F 00 4E      [ 6] 3182         clr     (0x004E)
   9B0C 7F 00 30      [ 6] 3183         clr     (0x0030)        ; clear SCD key states
   9B0F 7F 00 31      [ 6] 3184         clr     (0x0031)
   9B12 7F 00 32      [ 6] 3185         clr     (0x0032)
   9B15 7F 00 AF      [ 6] 3186         clr     (0x00AF)
   9B18 39            [ 5] 3187         rts
                           3188 
                           3189 ; do the random motions if enabled
   9B19                    3190 L9B19:
   9B19 36            [ 3] 3191         psha
   9B1A 37            [ 3] 3192         pshb
   9B1B 96 4E         [ 3] 3193         ldaa    (0x004E)
   9B1D 27 17         [ 3] 3194         beq     L9B36           ; go to 0401 logic
   9B1F 96 63         [ 3] 3195         ldaa    (0x0063)        ; check countdown timer
   9B21 26 10         [ 3] 3196         bne     L9B33           ; exit
   9B23 7D 00 64      [ 6] 3197         tst     (0x0064)
   9B26 27 09         [ 3] 3198         beq     L9B31           ; go to 0401 logic
   9B28 BD 86 C4      [ 6] 3199         jsr     L86C4           ; Reset boards 1-10
   9B2B BD 9C 51      [ 6] 3200         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9B2E 7F 00 64      [ 6] 3201         clr     (0x0064)
   9B31                    3202 L9B31:
   9B31 20 03         [ 3] 3203         bra     L9B36           ; go to 0401 logic
   9B33                    3204 L9B33:
   9B33 33            [ 4] 3205         pulb
   9B34 32            [ 4] 3206         pula
   9B35 39            [ 5] 3207         rts
                           3208 
                           3209 ; end up here immediately if:
                           3210 ; 0x004E == 00 or
                           3211 ; 0x0063, 0x0064 == 0 or
                           3212 ; 
                           3213 ; do subroutines based on bits 0-4 of 0x0401?
   9B36                    3214 L9B36:
   9B36 B6 04 01      [ 4] 3215         ldaa    (0x0401)
   9B39 84 01         [ 2] 3216         anda    #0x01
   9B3B 27 03         [ 3] 3217         beq     L9B40  
   9B3D BD 9B 6B      [ 6] 3218         jsr     L9B6B           ; bit 0 routine
   9B40                    3219 L9B40:
   9B40 B6 04 01      [ 4] 3220         ldaa    (0x0401)
   9B43 84 02         [ 2] 3221         anda    #0x02
   9B45 27 03         [ 3] 3222         beq     L9B4A  
   9B47 BD 9B 99      [ 6] 3223         jsr     L9B99           ; bit 1 routine
   9B4A                    3224 L9B4A:
   9B4A B6 04 01      [ 4] 3225         ldaa    (0x0401)
   9B4D 84 04         [ 2] 3226         anda    #0x04
   9B4F 27 03         [ 3] 3227         beq     L9B54  
   9B51 BD 9B C7      [ 6] 3228         jsr     L9BC7           ; bit 2 routine
   9B54                    3229 L9B54:
   9B54 B6 04 01      [ 4] 3230         ldaa    (0x0401)
   9B57 84 08         [ 2] 3231         anda    #0x08
   9B59 27 03         [ 3] 3232         beq     L9B5E  
   9B5B BD 9B F5      [ 6] 3233         jsr     L9BF5           ; bit 3 routine
   9B5E                    3234 L9B5E:
   9B5E B6 04 01      [ 4] 3235         ldaa    (0x0401)
   9B61 84 10         [ 2] 3236         anda    #0x10
   9B63 27 03         [ 3] 3237         beq     L9B68  
   9B65 BD 9C 23      [ 6] 3238         jsr     L9C23           ; bit 4 routine
   9B68                    3239 L9B68:
   9B68 33            [ 4] 3240         pulb
   9B69 32            [ 4] 3241         pula
   9B6A 39            [ 5] 3242         rts
                           3243 
                           3244 ; bit 0 routine
   9B6B                    3245 L9B6B:
   9B6B 18 3C         [ 5] 3246         pshy
   9B6D 18 DE 65      [ 5] 3247         ldy     (0x0065)
   9B70 18 A6 00      [ 5] 3248         ldaa    0,Y     
   9B73 81 FF         [ 2] 3249         cmpa    #0xFF
   9B75 27 14         [ 3] 3250         beq     L9B8B  
   9B77 91 70         [ 3] 3251         cmpa    OFFCNT1
   9B79 25 0D         [ 3] 3252         bcs     L9B88  
   9B7B 18 08         [ 4] 3253         iny
   9B7D 18 A6 00      [ 5] 3254         ldaa    0,Y     
   9B80 B7 10 80      [ 4] 3255         staa    (0x1080)        ; do some stuff to board 1
   9B83 18 08         [ 4] 3256         iny
   9B85 18 DF 65      [ 5] 3257         sty     (0x0065)
   9B88                    3258 L9B88:
   9B88 18 38         [ 6] 3259         puly
   9B8A 39            [ 5] 3260         rts
   9B8B                    3261 L9B8B:
   9B8B 18 CE B2 EB   [ 4] 3262         ldy     #LB2EB
   9B8F 18 DF 65      [ 5] 3263         sty     (0x0065)
   9B92 86 FA         [ 2] 3264         ldaa    #0xFA
   9B94 97 70         [ 3] 3265         staa    OFFCNT1
   9B96 7E 9B 88      [ 3] 3266         jmp     L9B88
                           3267 
                           3268 ; bit 1 routine
   9B99                    3269 L9B99:
   9B99 18 3C         [ 5] 3270         pshy
   9B9B 18 DE 67      [ 5] 3271         ldy     (0x0067)
   9B9E 18 A6 00      [ 5] 3272         ldaa    0,Y     
   9BA1 81 FF         [ 2] 3273         cmpa    #0xFF
   9BA3 27 14         [ 3] 3274         beq     L9BB9  
   9BA5 91 71         [ 3] 3275         cmpa    OFFCNT2
   9BA7 25 0D         [ 3] 3276         bcs     L9BB6  
   9BA9 18 08         [ 4] 3277         iny
   9BAB 18 A6 00      [ 5] 3278         ldaa    0,Y     
   9BAE B7 10 84      [ 4] 3279         staa    (0x1084)        ; do some stuff to board 2
   9BB1 18 08         [ 4] 3280         iny
   9BB3 18 DF 67      [ 5] 3281         sty     (0x0067)
   9BB6                    3282 L9BB6:
   9BB6 18 38         [ 6] 3283         puly
   9BB8 39            [ 5] 3284         rts
   9BB9                    3285 L9BB9:
   9BB9 18 CE B3 BD   [ 4] 3286         ldy     #LB3BD
   9BBD 18 DF 67      [ 5] 3287         sty     (0x0067)
   9BC0 86 E6         [ 2] 3288         ldaa    #0xE6
   9BC2 97 71         [ 3] 3289         staa    OFFCNT2
   9BC4 7E 9B B6      [ 3] 3290         jmp     L9BB6
                           3291 
                           3292 ; bit 2 routine
   9BC7                    3293 L9BC7:
   9BC7 18 3C         [ 5] 3294         pshy
   9BC9 18 DE 69      [ 5] 3295         ldy     (0x0069)
   9BCC 18 A6 00      [ 5] 3296         ldaa    0,Y     
   9BCF 81 FF         [ 2] 3297         cmpa    #0xFF
   9BD1 27 14         [ 3] 3298         beq     L9BE7  
   9BD3 91 72         [ 3] 3299         cmpa    OFFCNT3
   9BD5 25 0D         [ 3] 3300         bcs     L9BE4  
   9BD7 18 08         [ 4] 3301         iny
   9BD9 18 A6 00      [ 5] 3302         ldaa    0,Y     
   9BDC B7 10 88      [ 4] 3303         staa    (0x1088)        ; do some stuff to board 3
   9BDF 18 08         [ 4] 3304         iny
   9BE1 18 DF 69      [ 5] 3305         sty     (0x0069)
   9BE4                    3306 L9BE4:
   9BE4 18 38         [ 6] 3307         puly
   9BE6 39            [ 5] 3308         rts
   9BE7                    3309 L9BE7:
   9BE7 18 CE B5 31   [ 4] 3310         ldy     #LB531
   9BEB 18 DF 69      [ 5] 3311         sty     (0x0069)
   9BEE 86 D2         [ 2] 3312         ldaa    #0xD2
   9BF0 97 72         [ 3] 3313         staa    OFFCNT3
   9BF2 7E 9B E4      [ 3] 3314         jmp     L9BE4
                           3315 
                           3316 ; bit 3 routine
   9BF5                    3317 L9BF5:
   9BF5 18 3C         [ 5] 3318         pshy
   9BF7 18 DE 6B      [ 5] 3319         ldy     (0x006B)
   9BFA 18 A6 00      [ 5] 3320         ldaa    0,Y     
   9BFD 81 FF         [ 2] 3321         cmpa    #0xFF
   9BFF 27 14         [ 3] 3322         beq     L9C15  
   9C01 91 73         [ 3] 3323         cmpa    OFFCNT4
   9C03 25 0D         [ 3] 3324         bcs     L9C12  
   9C05 18 08         [ 4] 3325         iny
   9C07 18 A6 00      [ 5] 3326         ldaa    0,Y     
   9C0A B7 10 8C      [ 4] 3327         staa    (0x108C)        ; do some stuff to board 4
   9C0D 18 08         [ 4] 3328         iny
   9C0F 18 DF 6B      [ 5] 3329         sty     (0x006B)
   9C12                    3330 L9C12:
   9C12 18 38         [ 6] 3331         puly
   9C14 39            [ 5] 3332         rts
   9C15                    3333 L9C15:
   9C15 18 CE B4 75   [ 4] 3334         ldy     #LB475
   9C19 18 DF 6B      [ 5] 3335         sty     (0x006B)
   9C1C 86 BE         [ 2] 3336         ldaa    #0xBE
   9C1E 97 73         [ 3] 3337         staa    OFFCNT4
   9C20 7E 9C 12      [ 3] 3338         jmp     L9C12
                           3339 
                           3340 ; bit 4 routine
   9C23                    3341 L9C23:
   9C23 18 3C         [ 5] 3342         pshy
   9C25 18 DE 6D      [ 5] 3343         ldy     (0x006D)
   9C28 18 A6 00      [ 5] 3344         ldaa    0,Y     
   9C2B 81 FF         [ 2] 3345         cmpa    #0xFF
   9C2D 27 14         [ 3] 3346         beq     L9C43  
   9C2F 91 74         [ 3] 3347         cmpa    OFFCNT5
   9C31 25 0D         [ 3] 3348         bcs     L9C40  
   9C33 18 08         [ 4] 3349         iny
   9C35 18 A6 00      [ 5] 3350         ldaa    0,Y     
   9C38 B7 10 90      [ 4] 3351         staa    (0x1090)        ; do some stuff to board 5
   9C3B 18 08         [ 4] 3352         iny
   9C3D 18 DF 6D      [ 5] 3353         sty     (0x006D)
   9C40                    3354 L9C40:
   9C40 18 38         [ 6] 3355         puly
   9C42 39            [ 5] 3356         rts
   9C43                    3357 L9C43:
   9C43 18 CE B5 C3   [ 4] 3358         ldy     #LB5C3
   9C47 18 DF 6D      [ 5] 3359         sty     (0x006D)
   9C4A 86 AA         [ 2] 3360         ldaa    #0xAA
   9C4C 97 74         [ 3] 3361         staa    OFFCNT5
   9C4E 7E 9C 40      [ 3] 3362         jmp     L9C40
                           3363 
                           3364 ; Reset offset counters to initial values
   9C51                    3365 L9C51:
   9C51 86 FA         [ 2] 3366         ldaa    #0xFA
   9C53 97 70         [ 3] 3367         staa    OFFCNT1
   9C55 86 E6         [ 2] 3368         ldaa    #0xE6
   9C57 97 71         [ 3] 3369         staa    OFFCNT2
   9C59 86 D2         [ 2] 3370         ldaa    #0xD2
   9C5B 97 72         [ 3] 3371         staa    OFFCNT3
   9C5D 86 BE         [ 2] 3372         ldaa    #0xBE
   9C5F 97 73         [ 3] 3373         staa    OFFCNT4
   9C61 86 AA         [ 2] 3374         ldaa    #0xAA
   9C63 97 74         [ 3] 3375         staa    OFFCNT5
                           3376 
                           3377         ; int random movement table pointers
   9C65 18 CE B2 EB   [ 4] 3378         ldy     #LB2EB
   9C69 18 DF 65      [ 5] 3379         sty     (0x0065)
   9C6C 18 CE B3 BD   [ 4] 3380         ldy     #LB3BD
   9C70 18 DF 67      [ 5] 3381         sty     (0x0067)
   9C73 18 CE B5 31   [ 4] 3382         ldy     #LB531
   9C77 18 DF 69      [ 5] 3383         sty     (0x0069)
   9C7A 18 CE B4 75   [ 4] 3384         ldy     #LB475
   9C7E 18 DF 6B      [ 5] 3385         sty     (0x006B)
   9C81 18 CE B5 C3   [ 4] 3386         ldy     #LB5C3
   9C85 18 DF 6D      [ 5] 3387         sty     (0x006D)
                           3388 
                           3389         ; clear board 8
   9C88 7F 10 9C      [ 6] 3390         clr     (0x109C)
   9C8B 7F 10 9E      [ 6] 3391         clr     (0x109E)
                           3392 
                           3393         ; if bit 5 of 0401 is set, turn on 3 bits on board 8
   9C8E B6 04 01      [ 4] 3394         ldaa    (0x0401)
   9C91 84 20         [ 2] 3395         anda    #0x20
   9C93 27 08         [ 3] 3396         beq     L9C9D
   9C95 B6 10 9C      [ 4] 3397         ldaa    (0x109C)
   9C98 8A 19         [ 2] 3398         oraa    #0x19
   9C9A B7 10 9C      [ 4] 3399         staa    (0x109C)
                           3400         ; if bit 6 of 0401 is set, turn on 3 bits on board 8
   9C9D                    3401 L9C9D:
   9C9D B6 04 01      [ 4] 3402         ldaa    (0x0401)
   9CA0 84 40         [ 2] 3403         anda    #0x40
   9CA2 27 10         [ 3] 3404         beq     L9CB4  
   9CA4 B6 10 9C      [ 4] 3405         ldaa    (0x109C)
   9CA7 8A 44         [ 2] 3406         oraa    #0x44
   9CA9 B7 10 9C      [ 4] 3407         staa    (0x109C)
   9CAC B6 10 9E      [ 4] 3408         ldaa    (0x109E)
   9CAF 8A 40         [ 2] 3409         oraa    #0x40
   9CB1 B7 10 9E      [ 4] 3410         staa    (0x109E)
                           3411         ; if bit 7 of 0401 is set, turn on 3 bits on board 8
   9CB4                    3412 L9CB4:
   9CB4 B6 04 01      [ 4] 3413         ldaa    (0x0401)
   9CB7 84 80         [ 2] 3414         anda    #0x80
   9CB9 27 08         [ 3] 3415         beq     L9CC3  
   9CBB B6 10 9C      [ 4] 3416         ldaa    (0x109C)
   9CBE 8A A2         [ 2] 3417         oraa    #0xA2
   9CC0 B7 10 9C      [ 4] 3418         staa    (0x109C)
                           3419 
   9CC3                    3420 L9CC3:
                           3421         ; if bit 0 of 042B is set, turn on 1 bit on board 7
   9CC3 B6 04 2B      [ 4] 3422         ldaa    (0x042B)
   9CC6 84 01         [ 2] 3423         anda    #0x01
   9CC8 27 08         [ 3] 3424         beq     L9CD2  
   9CCA B6 10 9A      [ 4] 3425         ldaa    (0x109A)
   9CCD 8A 80         [ 2] 3426         oraa    #0x80
   9CCF B7 10 9A      [ 4] 3427         staa    (0x109A)
   9CD2                    3428 L9CD2:
                           3429         ; if bit 1 of 042B is set, turn on 1 bit on board 8
   9CD2 B6 04 2B      [ 4] 3430         ldaa    (0x042B)
   9CD5 84 02         [ 2] 3431         anda    #0x02
   9CD7 27 08         [ 3] 3432         beq     L9CE1  
   9CD9 B6 10 9E      [ 4] 3433         ldaa    (0x109E)
   9CDC 8A 04         [ 2] 3434         oraa    #0x04
   9CDE B7 10 9E      [ 4] 3435         staa    (0x109E)
   9CE1                    3436 L9CE1:
                           3437         ; if bit 2 of 042B is set, turn on 1 bit on board 8
   9CE1 B6 04 2B      [ 4] 3438         ldaa    (0x042B)
   9CE4 84 04         [ 2] 3439         anda    #0x04
   9CE6 27 08         [ 3] 3440         beq     L9CF0  
   9CE8 B6 10 9E      [ 4] 3441         ldaa    (0x109E)
   9CEB 8A 08         [ 2] 3442         oraa    #0x08
   9CED B7 10 9E      [ 4] 3443         staa    (0x109E)
   9CF0                    3444 L9CF0:
   9CF0 39            [ 5] 3445         rts
                           3446 
                           3447 ; Display Credits
   9CF1                    3448 L9CF1:
   9CF1 BD 8D E4      [ 6] 3449         jsr     LCDMSG1 
   9CF4 20 20 20 50 72 6F  3450         .ascis  '   Program by   '
        67 72 61 6D 20 62
        79 20 20 A0
                           3451 
   9D04 BD 8D DD      [ 6] 3452         jsr     LCDMSG2 
   9D07 44 61 76 69 64 20  3453         .ascis  'David  Philipsen'
        20 50 68 69 6C 69
        70 73 65 EE
                           3454 
   9D17 39            [ 5] 3455         rts
                           3456 
   9D18                    3457 L9D18:
   9D18 97 49         [ 3] 3458         staa    (0x0049)
   9D1A 7F 00 B8      [ 6] 3459         clr     (0x00B8)
   9D1D BD 8D 03      [ 6] 3460         jsr     L8D03
   9D20 86 2A         [ 2] 3461         ldaa    #0x2A           ;'*'
   9D22 C6 28         [ 2] 3462         ldab    #0x28
   9D24 BD 8D B5      [ 6] 3463         jsr     L8DB5           ; display char here on LCD display
   9D27 CC 0B B8      [ 3] 3464         ldd     #0x0BB8         ; start 30 second timer?
   9D2A DD 1B         [ 4] 3465         std     CDTIMR1
   9D2C                    3466 L9D2C:
   9D2C BD 9B 19      [ 6] 3467         jsr     L9B19           ; do the random motions if enabled
   9D2F 96 49         [ 3] 3468         ldaa    (0x0049)
   9D31 81 41         [ 2] 3469         cmpa    #0x41
   9D33 27 04         [ 3] 3470         beq     L9D39  
   9D35 81 4B         [ 2] 3471         cmpa    #0x4B
   9D37 26 04         [ 3] 3472         bne     L9D3D  
   9D39                    3473 L9D39:
   9D39 C6 01         [ 2] 3474         ldab    #0x01
   9D3B D7 B8         [ 3] 3475         stab    (0x00B8)
   9D3D                    3476 L9D3D:
   9D3D 81 41         [ 2] 3477         cmpa    #0x41
   9D3F 27 04         [ 3] 3478         beq     L9D45  
   9D41 81 4F         [ 2] 3479         cmpa    #0x4F
   9D43 26 07         [ 3] 3480         bne     L9D4C  
   9D45                    3481 L9D45:
   9D45 86 01         [ 2] 3482         ldaa    #0x01
   9D47 B7 02 98      [ 4] 3483         staa    (0x0298)
   9D4A 20 32         [ 3] 3484         bra     L9D7E  
   9D4C                    3485 L9D4C:
   9D4C 81 4B         [ 2] 3486         cmpa    #0x4B
   9D4E 27 04         [ 3] 3487         beq     L9D54  
   9D50 81 50         [ 2] 3488         cmpa    #0x50
   9D52 26 07         [ 3] 3489         bne     L9D5B  
   9D54                    3490 L9D54:
   9D54 86 02         [ 2] 3491         ldaa    #0x02
   9D56 B7 02 98      [ 4] 3492         staa    (0x0298)
   9D59 20 23         [ 3] 3493         bra     L9D7E  
   9D5B                    3494 L9D5B:
   9D5B 81 4C         [ 2] 3495         cmpa    #0x4C
   9D5D 26 07         [ 3] 3496         bne     L9D66  
   9D5F 86 03         [ 2] 3497         ldaa    #0x03
   9D61 B7 02 98      [ 4] 3498         staa    (0x0298)
   9D64 20 18         [ 3] 3499         bra     L9D7E  
   9D66                    3500 L9D66:
   9D66 81 52         [ 2] 3501         cmpa    #0x52
   9D68 26 07         [ 3] 3502         bne     L9D71  
   9D6A 86 04         [ 2] 3503         ldaa    #0x04
   9D6C B7 02 98      [ 4] 3504         staa    (0x0298)
   9D6F 20 0D         [ 3] 3505         bra     L9D7E  
   9D71                    3506 L9D71:
   9D71 DC 1B         [ 4] 3507         ldd     CDTIMR1
   9D73 26 B7         [ 3] 3508         bne     L9D2C  
   9D75 86 23         [ 2] 3509         ldaa    #0x23           ;'#'
   9D77 C6 29         [ 2] 3510         ldab    #0x29
   9D79 BD 8D B5      [ 6] 3511         jsr     L8DB5           ; display char here on LCD display
   9D7C 20 6C         [ 3] 3512         bra     L9DEA  
   9D7E                    3513 L9D7E:
   9D7E 7F 00 49      [ 6] 3514         clr     (0x0049)
   9D81 86 2A         [ 2] 3515         ldaa    #0x2A           ;'*'
   9D83 C6 29         [ 2] 3516         ldab    #0x29
   9D85 BD 8D B5      [ 6] 3517         jsr     L8DB5           ; display char here on LCD display
   9D88 7F 00 4A      [ 6] 3518         clr     (0x004A)
   9D8B CE 02 99      [ 3] 3519         ldx     #0x0299
   9D8E                    3520 L9D8E:
   9D8E BD 9B 19      [ 6] 3521         jsr     L9B19           ; do the random motions if enabled
   9D91 96 4A         [ 3] 3522         ldaa    (0x004A)
   9D93 27 F9         [ 3] 3523         beq     L9D8E  
   9D95 7F 00 4A      [ 6] 3524         clr     (0x004A)
   9D98 84 3F         [ 2] 3525         anda    #0x3F
   9D9A A7 00         [ 4] 3526         staa    0,X     
   9D9C 08            [ 3] 3527         inx
   9D9D 8C 02 9C      [ 4] 3528         cpx     #0x029C
   9DA0 26 EC         [ 3] 3529         bne     L9D8E  
   9DA2 BD 9D F5      [ 6] 3530         jsr     L9DF5
   9DA5 24 09         [ 3] 3531         bcc     L9DB0  
   9DA7 86 23         [ 2] 3532         ldaa    #0x23           ;'#'
   9DA9 C6 2A         [ 2] 3533         ldab    #0x2A
   9DAB BD 8D B5      [ 6] 3534         jsr     L8DB5           ; display char here on LCD display
   9DAE 20 3A         [ 3] 3535         bra     L9DEA  
   9DB0                    3536 L9DB0:
   9DB0 86 2A         [ 2] 3537         ldaa    #0x2A           ;'*'
   9DB2 C6 2A         [ 2] 3538         ldab    #0x2A
   9DB4 BD 8D B5      [ 6] 3539         jsr     L8DB5           ; display char here on LCD display
   9DB7 B6 02 99      [ 4] 3540         ldaa    (0x0299)
   9DBA 81 39         [ 2] 3541         cmpa    #0x39
   9DBC 26 15         [ 3] 3542         bne     L9DD3  
                           3543 
   9DBE BD 8D DD      [ 6] 3544         jsr     LCDMSG2 
   9DC1 47 65 6E 65 72 69  3545         .ascis  'Generic Showtape'
        63 20 53 68 6F 77
        74 61 70 E5
                           3546 
   9DD1 0C            [ 2] 3547         clc
   9DD2 39            [ 5] 3548         rts
                           3549 
   9DD3                    3550 L9DD3:
   9DD3 B6 02 98      [ 4] 3551         ldaa    (0x0298)
   9DD6 81 03         [ 2] 3552         cmpa    #0x03
   9DD8 27 0E         [ 3] 3553         beq     L9DE8  
   9DDA 81 04         [ 2] 3554         cmpa    #0x04
   9DDC 27 0A         [ 3] 3555         beq     L9DE8  
   9DDE 96 76         [ 3] 3556         ldaa    (0x0076)
   9DE0 26 06         [ 3] 3557         bne     L9DE8  
   9DE2 BD 9E 73      [ 6] 3558         jsr     L9E73
   9DE5 BD 9E CC      [ 6] 3559         jsr     L9ECC
   9DE8                    3560 L9DE8:
   9DE8 0C            [ 2] 3561         clc
   9DE9 39            [ 5] 3562         rts
                           3563 
   9DEA                    3564 L9DEA:
   9DEA FC 04 20      [ 5] 3565         ldd     (0x0420)
   9DED C3 00 01      [ 4] 3566         addd    #0x0001
   9DF0 FD 04 20      [ 5] 3567         std     (0x0420)
   9DF3 0D            [ 2] 3568         sec
   9DF4 39            [ 5] 3569         rts
                           3570 
   9DF5                    3571 L9DF5:
   9DF5 B6 02 99      [ 4] 3572         ldaa    (0x0299)
   9DF8 81 39         [ 2] 3573         cmpa    #0x39
   9DFA 27 6C         [ 3] 3574         beq     L9E68  
   9DFC CE 00 A8      [ 3] 3575         ldx     #0x00A8
   9DFF                    3576 L9DFF:
   9DFF BD 9B 19      [ 6] 3577         jsr     L9B19           ; do the random motions if enabled
   9E02 96 4A         [ 3] 3578         ldaa    (0x004A)
   9E04 27 F9         [ 3] 3579         beq     L9DFF  
   9E06 7F 00 4A      [ 6] 3580         clr     (0x004A)
   9E09 A7 00         [ 4] 3581         staa    0,X     
   9E0B 08            [ 3] 3582         inx
   9E0C 8C 00 AA      [ 4] 3583         cpx     #0x00AA
   9E0F 26 EE         [ 3] 3584         bne     L9DFF  
   9E11 BD 9E FA      [ 6] 3585         jsr     L9EFA
   9E14 CE 02 99      [ 3] 3586         ldx     #0x0299
   9E17 7F 00 13      [ 6] 3587         clr     (0x0013)
   9E1A                    3588 L9E1A:
   9E1A A6 00         [ 4] 3589         ldaa    0,X     
   9E1C 9B 13         [ 3] 3590         adda    (0x0013)
   9E1E 97 13         [ 3] 3591         staa    (0x0013)
   9E20 08            [ 3] 3592         inx
   9E21 8C 02 9C      [ 4] 3593         cpx     #0x029C
   9E24 26 F4         [ 3] 3594         bne     L9E1A  
   9E26 91 A8         [ 3] 3595         cmpa    (0x00A8)
   9E28 26 47         [ 3] 3596         bne     L9E71  
   9E2A CE 04 02      [ 3] 3597         ldx     #0x0402
   9E2D B6 02 98      [ 4] 3598         ldaa    (0x0298)
   9E30 81 02         [ 2] 3599         cmpa    #0x02
   9E32 26 03         [ 3] 3600         bne     L9E37  
   9E34 CE 04 05      [ 3] 3601         ldx     #0x0405
   9E37                    3602 L9E37:
   9E37 3C            [ 4] 3603         pshx
   9E38 BD AB 56      [ 6] 3604         jsr     LAB56
   9E3B 38            [ 5] 3605         pulx
   9E3C 25 07         [ 3] 3606         bcs     L9E45  
   9E3E 86 03         [ 2] 3607         ldaa    #0x03
   9E40 B7 02 98      [ 4] 3608         staa    (0x0298)
   9E43 20 23         [ 3] 3609         bra     L9E68  
   9E45                    3610 L9E45:
   9E45 B6 02 99      [ 4] 3611         ldaa    (0x0299)
   9E48 A1 00         [ 4] 3612         cmpa    0,X     
   9E4A 25 1E         [ 3] 3613         bcs     L9E6A  
   9E4C 27 02         [ 3] 3614         beq     L9E50  
   9E4E 24 18         [ 3] 3615         bcc     L9E68  
   9E50                    3616 L9E50:
   9E50 08            [ 3] 3617         inx
   9E51 B6 02 9A      [ 4] 3618         ldaa    (0x029A)
   9E54 A1 00         [ 4] 3619         cmpa    0,X     
   9E56 25 12         [ 3] 3620         bcs     L9E6A  
   9E58 27 02         [ 3] 3621         beq     L9E5C  
   9E5A 24 0C         [ 3] 3622         bcc     L9E68  
   9E5C                    3623 L9E5C:
   9E5C 08            [ 3] 3624         inx
   9E5D B6 02 9B      [ 4] 3625         ldaa    (0x029B)
   9E60 A1 00         [ 4] 3626         cmpa    0,X     
   9E62 25 06         [ 3] 3627         bcs     L9E6A  
   9E64 27 02         [ 3] 3628         beq     L9E68  
   9E66 24 00         [ 3] 3629         bcc     L9E68  
   9E68                    3630 L9E68:
   9E68 0C            [ 2] 3631         clc
   9E69 39            [ 5] 3632         rts
                           3633 
   9E6A                    3634 L9E6A:
   9E6A B6 02 98      [ 4] 3635         ldaa    (0x0298)
   9E6D 81 03         [ 2] 3636         cmpa    #0x03
   9E6F 27 F7         [ 3] 3637         beq     L9E68  
   9E71                    3638 L9E71:
   9E71 0D            [ 2] 3639         sec
   9E72 39            [ 5] 3640         rts
                           3641 
   9E73                    3642 L9E73:
   9E73 CE 04 02      [ 3] 3643         ldx     #0x0402
   9E76 B6 02 98      [ 4] 3644         ldaa    (0x0298)
   9E79 81 02         [ 2] 3645         cmpa    #0x02
   9E7B 26 03         [ 3] 3646         bne     L9E80  
   9E7D CE 04 05      [ 3] 3647         ldx     #0x0405
   9E80                    3648 L9E80:
   9E80 B6 02 99      [ 4] 3649         ldaa    (0x0299)
   9E83 A7 00         [ 4] 3650         staa    0,X     
   9E85 08            [ 3] 3651         inx
   9E86 B6 02 9A      [ 4] 3652         ldaa    (0x029A)
   9E89 A7 00         [ 4] 3653         staa    0,X     
   9E8B 08            [ 3] 3654         inx
   9E8C B6 02 9B      [ 4] 3655         ldaa    (0x029B)
   9E8F A7 00         [ 4] 3656         staa    0,X     
   9E91 39            [ 5] 3657         rts
                           3658 
                           3659 ; reset R counts
   9E92                    3660 L9E92:
   9E92 86 30         [ 2] 3661         ldaa    #0x30        
   9E94 B7 04 02      [ 4] 3662         staa    (0x0402)
   9E97 B7 04 03      [ 4] 3663         staa    (0x0403)
   9E9A B7 04 04      [ 4] 3664         staa    (0x0404)
                           3665 
   9E9D BD 8D DD      [ 6] 3666         jsr     LCDMSG2 
   9EA0 52 65 67 20 23 20  3667         .ascis  'Reg # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3668 
   9EAE 39            [ 5] 3669         rts
                           3670 
                           3671 ; reset L counts
   9EAF                    3672 L9EAF:
   9EAF 86 30         [ 2] 3673         ldaa    #0x30
   9EB1 B7 04 05      [ 4] 3674         staa    (0x0405)
   9EB4 B7 04 06      [ 4] 3675         staa    (0x0406)
   9EB7 B7 04 07      [ 4] 3676         staa    (0x0407)
                           3677 
   9EBA BD 8D DD      [ 6] 3678         jsr     LCDMSG2 
   9EBD 4C 69 76 20 23 20  3679         .ascis  'Liv # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3680 
   9ECB 39            [ 5] 3681         rts
                           3682 
                           3683 ; display R and L counts?
   9ECC                    3684 L9ECC:
   9ECC 86 52         [ 2] 3685         ldaa    #0x52           ;'R'
   9ECE C6 2B         [ 2] 3686         ldab    #0x2B
   9ED0 BD 8D B5      [ 6] 3687         jsr     L8DB5           ; display char here on LCD display
   9ED3 86 4C         [ 2] 3688         ldaa    #0x4C           ;'L'
   9ED5 C6 32         [ 2] 3689         ldab    #0x32
   9ED7 BD 8D B5      [ 6] 3690         jsr     L8DB5           ; display char here on LCD display
   9EDA CE 04 02      [ 3] 3691         ldx     #0x0402
   9EDD C6 2C         [ 2] 3692         ldab    #0x2C
   9EDF                    3693 L9EDF:
   9EDF A6 00         [ 4] 3694         ldaa    0,X     
   9EE1 BD 8D B5      [ 6] 3695         jsr     L8DB5           ; display 3 chars here on LCD display
   9EE4 5C            [ 2] 3696         incb
   9EE5 08            [ 3] 3697         inx
   9EE6 8C 04 05      [ 4] 3698         cpx     #0x0405
   9EE9 26 F4         [ 3] 3699         bne     L9EDF  
   9EEB C6 33         [ 2] 3700         ldab    #0x33
   9EED                    3701 L9EED:
   9EED A6 00         [ 4] 3702         ldaa    0,X     
   9EEF BD 8D B5      [ 6] 3703         jsr     L8DB5           ; display 3 chars here on LCD display
   9EF2 5C            [ 2] 3704         incb
   9EF3 08            [ 3] 3705         inx
   9EF4 8C 04 08      [ 4] 3706         cpx     #0x0408
   9EF7 26 F4         [ 3] 3707         bne     L9EED  
   9EF9 39            [ 5] 3708         rts
                           3709 
   9EFA                    3710 L9EFA:
   9EFA 96 A8         [ 3] 3711         ldaa    (0x00A8)
   9EFC BD 9F 0F      [ 6] 3712         jsr     L9F0F
   9EFF 48            [ 2] 3713         asla
   9F00 48            [ 2] 3714         asla
   9F01 48            [ 2] 3715         asla
   9F02 48            [ 2] 3716         asla
   9F03 97 13         [ 3] 3717         staa    (0x0013)
   9F05 96 A9         [ 3] 3718         ldaa    (0x00A9)
   9F07 BD 9F 0F      [ 6] 3719         jsr     L9F0F
   9F0A 9B 13         [ 3] 3720         adda    (0x0013)
   9F0C 97 A8         [ 3] 3721         staa    (0x00A8)
   9F0E 39            [ 5] 3722         rts
                           3723 
   9F0F                    3724 L9F0F:
   9F0F 81 2F         [ 2] 3725         cmpa    #0x2F
   9F11 24 02         [ 3] 3726         bcc     L9F15  
   9F13 86 30         [ 2] 3727         ldaa    #0x30
   9F15                    3728 L9F15:
   9F15 81 3A         [ 2] 3729         cmpa    #0x3A
   9F17 25 02         [ 3] 3730         bcs     L9F1B  
   9F19 80 07         [ 2] 3731         suba    #0x07
   9F1B                    3732 L9F1B:
   9F1B 80 30         [ 2] 3733         suba    #0x30
   9F1D 39            [ 5] 3734         rts
                           3735 
                           3736 ; different behavior based on serial number
   9F1E                    3737 L9F1E:
   9F1E FC 02 9C      [ 5] 3738         ldd     (0x029C)
   9F21 1A 83 00 01   [ 5] 3739         cpd     #0x0001         ; if 1, password bypass
   9F25 27 0C         [ 3] 3740         beq     L9F33           ;
   9F27 1A 83 03 E8   [ 5] 3741         cpd     #0x03E8         ; 1000
   9F2B 25 20         [ 3] 3742         bcs     L9F4D           ; if > 1000, code
   9F2D 1A 83 04 4B   [ 5] 3743         cpd     #0x044B         ; 1099
   9F31 22 1A         [ 3] 3744         bhi     L9F4D           ; if < 1099, code
                           3745                                 ; else 1 < x < 1000, bypass
                           3746 
   9F33                    3747 L9F33:
   9F33 BD 8D E4      [ 6] 3748         jsr     LCDMSG1 
   9F36 50 61 73 73 77 6F  3749         .ascis  'Password bypass '
        72 64 20 62 79 70
        61 73 73 A0
                           3750 
   9F46 C6 04         [ 2] 3751         ldab    #0x04
   9F48 BD 8C 30      [ 6] 3752         jsr     DLYSECSBY2      ; delay 2 sec
   9F4B 0C            [ 2] 3753         clc
   9F4C 39            [ 5] 3754         rts
                           3755 
   9F4D                    3756 L9F4D:
   9F4D BD 8C F2      [ 6] 3757         jsr     L8CF2
   9F50 BD 8D 03      [ 6] 3758         jsr     L8D03
                           3759 
   9F53 BD 8D E4      [ 6] 3760         jsr     LCDMSG1 
   9F56 43 6F 64 65 BA     3761         .ascis  'Code:'
                           3762 
                           3763 ; Generate a random 5-digit code in 0x0290-0x0294, and display to user
                           3764 
   9F5B CE 02 90      [ 3] 3765         ldx     #0x0290
   9F5E 7F 00 16      [ 6] 3766         clr     (0x0016)        ; 0x00
   9F61                    3767 L9F61:
   9F61 86 41         [ 2] 3768         ldaa    #0x41           ; 'A'
   9F63                    3769 L9F63:
   9F63 97 15         [ 3] 3770         staa    (0x0015)        ; 0x41
   9F65 BD 8E 95      [ 6] 3771         jsr     L8E95           ; read SCD keys
   9F68 81 0D         [ 2] 3772         cmpa    #0x0D
   9F6A 26 11         [ 3] 3773         bne     L9F7D
   9F6C 96 15         [ 3] 3774         ldaa    (0x0015)
   9F6E A7 00         [ 4] 3775         staa    0,X     
   9F70 08            [ 3] 3776         inx
   9F71 BD 8C 98      [ 6] 3777         jsr     L8C98
   9F74 96 16         [ 3] 3778         ldaa    (0x0016)
   9F76 4C            [ 2] 3779         inca
   9F77 97 16         [ 3] 3780         staa    (0x0016)
   9F79 81 05         [ 2] 3781         cmpa    #0x05
   9F7B 27 09         [ 3] 3782         beq     L9F86  
   9F7D                    3783 L9F7D:
   9F7D 96 15         [ 3] 3784         ldaa    (0x0015)
   9F7F 4C            [ 2] 3785         inca
   9F80 81 5B         [ 2] 3786         cmpa    #0x5B           ; '['
   9F82 27 DD         [ 3] 3787         beq     L9F61  
   9F84 20 DD         [ 3] 3788         bra     L9F63  
                           3789 
                           3790 ; Let the user type in a corresponding password to the code
   9F86                    3791 L9F86:
   9F86 BD 8D DD      [ 6] 3792         jsr     LCDMSG2 
   9F89 50 73 77 64 BA     3793         .ascis  'Pswd:'
                           3794 
   9F8E CE 02 88      [ 3] 3795         ldx     #0x0288
   9F91 86 41         [ 2] 3796         ldaa    #0x41           ; 'A'
   9F93 97 16         [ 3] 3797         staa    (0x0016)
   9F95 86 C5         [ 2] 3798         ldaa    #0xC5           ; 
   9F97 97 15         [ 3] 3799         staa    (0x0015)
   9F99                    3800 L9F99:
   9F99 96 15         [ 3] 3801         ldaa    (0x0015)
   9F9B BD 8C 86      [ 6] 3802         jsr     L8C86           ; write byte to LCD
   9F9E 96 16         [ 3] 3803         ldaa    (0x0016)
   9FA0 BD 8C 98      [ 6] 3804         jsr     L8C98
   9FA3                    3805 L9FA3:
   9FA3 BD 8E 95      [ 6] 3806         jsr     L8E95
   9FA6 27 FB         [ 3] 3807         beq     L9FA3  
   9FA8 81 0D         [ 2] 3808         cmpa    #0x0D
   9FAA 26 10         [ 3] 3809         bne     L9FBC  
   9FAC 96 16         [ 3] 3810         ldaa    (0x0016)
   9FAE A7 00         [ 4] 3811         staa    0,X     
   9FB0 08            [ 3] 3812         inx
   9FB1 96 15         [ 3] 3813         ldaa    (0x0015)
   9FB3 4C            [ 2] 3814         inca
   9FB4 97 15         [ 3] 3815         staa    (0x0015)
   9FB6 81 CA         [ 2] 3816         cmpa    #0xCA
   9FB8 27 28         [ 3] 3817         beq     L9FE2  
   9FBA 20 DD         [ 3] 3818         bra     L9F99  
   9FBC                    3819 L9FBC:
   9FBC 81 01         [ 2] 3820         cmpa    #0x01
   9FBE 26 0F         [ 3] 3821         bne     L9FCF  
   9FC0 96 16         [ 3] 3822         ldaa    (0x0016)
   9FC2 4C            [ 2] 3823         inca
   9FC3 97 16         [ 3] 3824         staa    (0x0016)
   9FC5 81 5B         [ 2] 3825         cmpa    #0x5B
   9FC7 26 D0         [ 3] 3826         bne     L9F99  
   9FC9 86 41         [ 2] 3827         ldaa    #0x41
   9FCB 97 16         [ 3] 3828         staa    (0x0016)
   9FCD 20 CA         [ 3] 3829         bra     L9F99  
   9FCF                    3830 L9FCF:
   9FCF 81 02         [ 2] 3831         cmpa    #0x02
   9FD1 26 D0         [ 3] 3832         bne     L9FA3  
   9FD3 96 16         [ 3] 3833         ldaa    (0x0016)
   9FD5 4A            [ 2] 3834         deca
   9FD6 97 16         [ 3] 3835         staa    (0x0016)
   9FD8 81 40         [ 2] 3836         cmpa    #0x40
   9FDA 26 BD         [ 3] 3837         bne     L9F99  
   9FDC 86 5A         [ 2] 3838         ldaa    #0x5A
   9FDE 97 16         [ 3] 3839         staa    (0x0016)
   9FE0 20 B7         [ 3] 3840         bra     L9F99  
   9FE2                    3841 L9FE2:
   9FE2 BD A0 01      [ 6] 3842         jsr     LA001           ; validate
   9FE5 25 0F         [ 3] 3843         bcs     L9FF6           ; if bad, jump
   9FE7 86 DB         [ 2] 3844         ldaa    #0xDB
   9FE9 97 AB         [ 3] 3845         staa    (0x00AB)        ; good password
   9FEB FC 04 16      [ 5] 3846         ldd     (0x0416)        ; increment number of good validations counter
   9FEE C3 00 01      [ 4] 3847         addd    #0x0001
   9FF1 FD 04 16      [ 5] 3848         std     (0x0416)
   9FF4 0C            [ 2] 3849         clc
   9FF5 39            [ 5] 3850         rts
                           3851 
   9FF6                    3852 L9FF6:
   9FF6 FC 04 14      [ 5] 3853         ldd     (0x0414)        ; increment number of bad validations counter
   9FF9 C3 00 01      [ 4] 3854         addd    #0x0001
   9FFC FD 04 14      [ 5] 3855         std     (0x0414)
   9FFF 0D            [ 2] 3856         sec
   A000 39            [ 5] 3857         rts
                           3858 
                           3859 ; Validate password?
   A001                    3860 LA001:
                           3861         ; scramble 5 letters
   A001 B6 02 90      [ 4] 3862         ldaa    (0x0290)        ; 0 -> 1
   A004 B7 02 81      [ 4] 3863         staa    (0x0281)
   A007 B6 02 91      [ 4] 3864         ldaa    (0x0291)        ; 1 -> 3
   A00A B7 02 83      [ 4] 3865         staa    (0x0283)
   A00D B6 02 92      [ 4] 3866         ldaa    (0x0292)        ; 2 -> 4
   A010 B7 02 84      [ 4] 3867         staa    (0x0284)
   A013 B6 02 93      [ 4] 3868         ldaa    (0x0293)        ; 3 -> 0
   A016 B7 02 80      [ 4] 3869         staa    (0x0280)
   A019 B6 02 94      [ 4] 3870         ldaa    (0x0294)        ; 4 -> 2
   A01C B7 02 82      [ 4] 3871         staa    (0x0282)
                           3872         ; transform each letter
   A01F B6 02 80      [ 4] 3873         ldaa    (0x0280)    
   A022 88 13         [ 2] 3874         eora    #0x13
   A024 8B 03         [ 2] 3875         adda    #0x03
   A026 B7 02 80      [ 4] 3876         staa    (0x0280)
   A029 B6 02 81      [ 4] 3877         ldaa    (0x0281)
   A02C 88 04         [ 2] 3878         eora    #0x04
   A02E 8B 12         [ 2] 3879         adda    #0x12
   A030 B7 02 81      [ 4] 3880         staa    (0x0281)
   A033 B6 02 82      [ 4] 3881         ldaa    (0x0282)
   A036 88 06         [ 2] 3882         eora    #0x06
   A038 8B 04         [ 2] 3883         adda    #0x04
   A03A B7 02 82      [ 4] 3884         staa    (0x0282)
   A03D B6 02 83      [ 4] 3885         ldaa    (0x0283)
   A040 88 11         [ 2] 3886         eora    #0x11
   A042 8B 07         [ 2] 3887         adda    #0x07
   A044 B7 02 83      [ 4] 3888         staa    (0x0283)
   A047 B6 02 84      [ 4] 3889         ldaa    (0x0284)
   A04A 88 01         [ 2] 3890         eora    #0x01
   A04C 8B 10         [ 2] 3891         adda    #0x10
   A04E B7 02 84      [ 4] 3892         staa    (0x0284)
                           3893         ; keep them modulo 26 (A-Z)
   A051 BD A0 AF      [ 6] 3894         jsr     LA0AF
                           3895         ; put some of the original bits into 0x0015/0x0016
   A054 B6 02 94      [ 4] 3896         ldaa    (0x0294)
   A057 84 17         [ 2] 3897         anda    #0x17
   A059 97 15         [ 3] 3898         staa    (0x0015)
   A05B B6 02 90      [ 4] 3899         ldaa    (0x0290)
   A05E 84 17         [ 2] 3900         anda    #0x17
   A060 97 16         [ 3] 3901         staa    (0x0016)
                           3902         ; do some eoring with these bits
   A062 CE 02 80      [ 3] 3903         ldx     #0x0280
   A065                    3904 LA065:
   A065 A6 00         [ 4] 3905         ldaa    0,X
   A067 98 15         [ 3] 3906         eora    (0x0015)
   A069 98 16         [ 3] 3907         eora    (0x0016)
   A06B A7 00         [ 4] 3908         staa    0,X
   A06D 08            [ 3] 3909         inx
   A06E 8C 02 85      [ 4] 3910         cpx     #0x0285
   A071 26 F2         [ 3] 3911         bne     LA065
                           3912         ; keep them modulo 26 (A-Z)
   A073 BD A0 AF      [ 6] 3913         jsr     LA0AF
                           3914         ; compare them to code in 0x0288-0x028C
   A076 CE 02 80      [ 3] 3915         ldx     #0x0280
   A079 18 CE 02 88   [ 4] 3916         ldy     #0x0288
   A07D                    3917 LA07D:
   A07D A6 00         [ 4] 3918         ldaa    0,X     
   A07F 18 A1 00      [ 5] 3919         cmpa    0,Y     
   A082 26 0A         [ 3] 3920         bne     LA08E  
   A084 08            [ 3] 3921         inx
   A085 18 08         [ 4] 3922         iny
   A087 8C 02 85      [ 4] 3923         cpx     #0x0285
   A08A 26 F1         [ 3] 3924         bne     LA07D  
   A08C 0C            [ 2] 3925         clc                     ; carry clear if good
   A08D 39            [ 5] 3926         rts
                           3927 
   A08E                    3928 LA08E:
   A08E 0D            [ 2] 3929         sec                     ; carry set if bad
   A08F 39            [ 5] 3930         rts
                           3931 
                           3932 ; trivial password validation - not used??
   A090                    3933 LA090:
   A090 59 41 44 44 41     3934         .ascii  'YADDA'
                           3935 
   A095 CE 02 88      [ 3] 3936         ldx     #0x0288
   A098 18 CE A0 90   [ 4] 3937         ldy     #LA090
   A09C                    3938 LA09C:
   A09C A6 00         [ 4] 3939         ldaa    0,X
   A09E 18 A1 00      [ 5] 3940         cmpa    0,Y
   A0A1 26 0A         [ 3] 3941         bne     LA0AD
   A0A3 08            [ 3] 3942         inx
   A0A4 18 08         [ 4] 3943         iny
   A0A6 8C 02 8D      [ 4] 3944         cpx     #0x028D
   A0A9 26 F1         [ 3] 3945         bne     LA09C
   A0AB 0C            [ 2] 3946         clc
   A0AC 39            [ 5] 3947         rts
   A0AD                    3948 LA0AD:
   A0AD 0D            [ 2] 3949         sec
   A0AE 39            [ 5] 3950         rts
                           3951 
                           3952 ; keep the password modulo 26, each letter in range 'A-Z'
   A0AF                    3953 LA0AF:
   A0AF CE 02 80      [ 3] 3954         ldx     #0x0280
   A0B2                    3955 LA0B2:
   A0B2 A6 00         [ 4] 3956         ldaa    0,X
   A0B4 81 5B         [ 2] 3957         cmpa    #0x5B
   A0B6 25 06         [ 3] 3958         bcs     LA0BE
   A0B8 80 1A         [ 2] 3959         suba    #0x1A
   A0BA A7 00         [ 4] 3960         staa    0,X
   A0BC 20 08         [ 3] 3961         bra     LA0C6
   A0BE                    3962 LA0BE:
   A0BE 81 41         [ 2] 3963         cmpa    #0x41
   A0C0 24 04         [ 3] 3964         bcc     LA0C6
   A0C2 8B 1A         [ 2] 3965         adda    #0x1A
   A0C4 A7 00         [ 4] 3966         staa    0,X
   A0C6                    3967 LA0C6:
   A0C6 08            [ 3] 3968         inx
   A0C7 8C 02 85      [ 4] 3969         cpx     #0x0285
   A0CA 26 E6         [ 3] 3970         bne     LA0B2  
   A0CC 39            [ 5] 3971         rts
                           3972 
   A0CD BD 8C F2      [ 6] 3973         jsr     L8CF2
                           3974 
   A0D0 BD 8D DD      [ 6] 3975         jsr     LCDMSG2 
   A0D3 46 61 69 6C 65 64  3976         .ascis  'Failed!         '
        21 20 20 20 20 20
        20 20 20 A0
                           3977 
   A0E3 C6 02         [ 2] 3978         ldab    #0x02
   A0E5 BD 8C 30      [ 6] 3979         jsr     DLYSECSBY2      ; delay 1 sec
   A0E8 39            [ 5] 3980         rts
                           3981 
   A0E9                    3982 LA0E9:
   A0E9 C6 01         [ 2] 3983         ldab    #0x01
   A0EB BD 8C 30      [ 6] 3984         jsr     DLYSECSBY2      ; delay 0.5 sec
   A0EE 7F 00 4E      [ 6] 3985         clr     (0x004E)
   A0F1 C6 D3         [ 2] 3986         ldab    #0xD3
   A0F3 BD 87 48      [ 6] 3987         jsr     L8748   
   A0F6 BD 87 AE      [ 6] 3988         jsr     L87AE
   A0F9 BD 8C E9      [ 6] 3989         jsr     L8CE9
                           3990 
   A0FC BD 8D E4      [ 6] 3991         jsr     LCDMSG1 
   A0FF 20 20 20 56 43 52  3992         .ascis  '   VCR adjust'
        20 61 64 6A 75 73
        F4
                           3993 
   A10C BD 8D DD      [ 6] 3994         jsr     LCDMSG2 
   A10F 55 50 20 74 6F 20  3995         .ascis  'UP to clear bits'
        63 6C 65 61 72 20
        62 69 74 F3
                           3996 
   A11F 5F            [ 2] 3997         clrb
   A120 D7 62         [ 3] 3998         stab    (0x0062)
   A122 BD F9 C5      [ 6] 3999         jsr     BUTNLIT 
   A125 B6 18 04      [ 4] 4000         ldaa    PIA0PRA 
   A128 84 BF         [ 2] 4001         anda    #0xBF
   A12A B7 18 04      [ 4] 4002         staa    PIA0PRA 
   A12D BD 8E 95      [ 6] 4003         jsr     L8E95
   A130 7F 00 48      [ 6] 4004         clr     (0x0048)
   A133 7F 00 49      [ 6] 4005         clr     (0x0049)
   A136 BD 86 C4      [ 6] 4006         jsr     L86C4           ; Reset boards 1-10
   A139 86 28         [ 2] 4007         ldaa    #0x28
   A13B 97 63         [ 3] 4008         staa    (0x0063)
   A13D C6 FD         [ 2] 4009         ldab    #0xFD           ; tape deck STOP
   A13F BD 86 E7      [ 6] 4010         jsr     L86E7
   A142 BD A3 2E      [ 6] 4011         jsr     LA32E
   A145 7C 00 76      [ 6] 4012         inc     (0x0076)
   A148 7F 00 32      [ 6] 4013         clr     (0x0032)
   A14B                    4014 LA14B:
   A14B BD 8E 95      [ 6] 4015         jsr     L8E95
   A14E 81 0D         [ 2] 4016         cmpa    #0x0D
   A150 26 03         [ 3] 4017         bne     LA155  
   A152 7E A1 C4      [ 3] 4018         jmp     LA1C4
   A155                    4019 LA155:
   A155 86 28         [ 2] 4020         ldaa    #0x28
   A157 97 63         [ 3] 4021         staa    (0x0063)
   A159 BD 86 A4      [ 6] 4022         jsr     L86A4
   A15C 25 ED         [ 3] 4023         bcs     LA14B  
   A15E FC 04 1A      [ 5] 4024         ldd     (0x041A)
   A161 C3 00 01      [ 4] 4025         addd    #0x0001
   A164 FD 04 1A      [ 5] 4026         std     (0x041A)
   A167 BD 86 C4      [ 6] 4027         jsr     L86C4           ; Reset boards 1-10
   A16A 7C 00 4E      [ 6] 4028         inc     (0x004E)
   A16D C6 D3         [ 2] 4029         ldab    #0xD3
   A16F BD 87 48      [ 6] 4030         jsr     L8748   
   A172 BD 87 AE      [ 6] 4031         jsr     L87AE
   A175                    4032 LA175:
   A175 96 49         [ 3] 4033         ldaa    (0x0049)
   A177 81 43         [ 2] 4034         cmpa    #0x43
   A179 26 06         [ 3] 4035         bne     LA181  
   A17B 7F 00 49      [ 6] 4036         clr     (0x0049)
   A17E 7F 00 48      [ 6] 4037         clr     (0x0048)
   A181                    4038 LA181:
   A181 96 48         [ 3] 4039         ldaa    (0x0048)
   A183 81 C8         [ 2] 4040         cmpa    #0xC8
   A185 25 1F         [ 3] 4041         bcs     LA1A6  
   A187 FC 02 9C      [ 5] 4042         ldd     (0x029C)
   A18A 1A 83 00 01   [ 5] 4043         cpd     #0x0001
   A18E 27 16         [ 3] 4044         beq     LA1A6  
   A190 C6 EF         [ 2] 4045         ldab    #0xEF           ; tape deck EJECT
   A192 BD 86 E7      [ 6] 4046         jsr     L86E7
   A195 BD 86 C4      [ 6] 4047         jsr     L86C4           ; Reset boards 1-10
   A198 7F 00 4E      [ 6] 4048         clr     (0x004E)
   A19B 7F 00 76      [ 6] 4049         clr     (0x0076)
   A19E C6 0A         [ 2] 4050         ldab    #0x0A
   A1A0 BD 8C 30      [ 6] 4051         jsr     DLYSECSBY2      ; delay 5 sec
   A1A3 7E 81 D7      [ 3] 4052         jmp     L81D7
   A1A6                    4053 LA1A6:
   A1A6 BD 8E 95      [ 6] 4054         jsr     L8E95
   A1A9 81 01         [ 2] 4055         cmpa    #0x01
   A1AB 26 10         [ 3] 4056         bne     LA1BD  
   A1AD CE 10 80      [ 3] 4057         ldx     #0x1080
   A1B0 86 34         [ 2] 4058         ldaa    #0x34
   A1B2                    4059 LA1B2:
   A1B2 6F 00         [ 6] 4060         clr     0,X     
   A1B4 A7 01         [ 4] 4061         staa    1,X     
   A1B6 08            [ 3] 4062         inx
   A1B7 08            [ 3] 4063         inx
   A1B8 8C 10 A0      [ 4] 4064         cpx     #0x10A0
   A1BB 25 F5         [ 3] 4065         bcs     LA1B2  
   A1BD                    4066 LA1BD:
   A1BD 81 0D         [ 2] 4067         cmpa    #0x0D
   A1BF 27 03         [ 3] 4068         beq     LA1C4  
   A1C1 7E A1 75      [ 3] 4069         jmp     LA175
   A1C4                    4070 LA1C4:
   A1C4 7F 00 76      [ 6] 4071         clr     (0x0076)
   A1C7 7F 00 4E      [ 6] 4072         clr     (0x004E)
   A1CA C6 DF         [ 2] 4073         ldab    #0xDF
   A1CC BD 87 48      [ 6] 4074         jsr     L8748   
   A1CF BD 87 91      [ 6] 4075         jsr     L8791   
   A1D2 7E 81 D7      [ 3] 4076         jmp     L81D7
                           4077 
                           4078 ; reprogram EEPROM signature if needed
   A1D5                    4079 LA1D5:
   A1D5 86 07         [ 2] 4080         ldaa    #0x07
   A1D7 B7 04 00      [ 4] 4081         staa    (0x0400)
   A1DA CC 0E 09      [ 3] 4082         ldd     #0x0E09
   A1DD 81 65         [ 2] 4083         cmpa    #0x65           ;'e'
   A1DF 26 05         [ 3] 4084         bne     LA1E6
   A1E1 C1 63         [ 2] 4085         cmpb    #0x63           ;'c'
   A1E3 26 01         [ 3] 4086         bne     LA1E6
   A1E5 39            [ 5] 4087         rts
                           4088 
                           4089 ; erase and reprogram EEPROM signature
   A1E6                    4090 LA1E6:
   A1E6 86 0E         [ 2] 4091         ldaa    #0x0E
   A1E8 B7 10 3B      [ 4] 4092         staa    PPROG
   A1EB 86 FF         [ 2] 4093         ldaa    #0xFF
   A1ED B7 0E 00      [ 4] 4094         staa    (0x0E00)
   A1F0 B6 10 3B      [ 4] 4095         ldaa    PPROG  
   A1F3 8A 01         [ 2] 4096         oraa    #0x01
   A1F5 B7 10 3B      [ 4] 4097         staa    PPROG  
   A1F8 CE 1B 58      [ 3] 4098         ldx     #0x1B58         ; 7000
   A1FB                    4099 LA1FB:
   A1FB 09            [ 3] 4100         dex
   A1FC 26 FD         [ 3] 4101         bne     LA1FB  
   A1FE B6 10 3B      [ 4] 4102         ldaa    PPROG  
   A201 84 FE         [ 2] 4103         anda    #0xFE
   A203 B7 10 3B      [ 4] 4104         staa    PPROG  
   A206 CE 0E 00      [ 3] 4105         ldx     #0x0E00
   A209 18 CE A2 26   [ 4] 4106         ldy     #LA226
   A20D                    4107 LA20D:
   A20D C6 02         [ 2] 4108         ldab    #0x02
   A20F F7 10 3B      [ 4] 4109         stab    PPROG  
   A212 18 A6 00      [ 5] 4110         ldaa    0,Y     
   A215 18 08         [ 4] 4111         iny
   A217 A7 00         [ 4] 4112         staa    0,X     
   A219 BD A2 32      [ 6] 4113         jsr     LA232
   A21C 08            [ 3] 4114         inx
   A21D 8C 0E 0C      [ 4] 4115         cpx     #0x0E0C
   A220 26 EB         [ 3] 4116         bne     LA20D  
   A222 7F 10 3B      [ 6] 4117         clr     PPROG  
   A225 39            [ 5] 4118         rts
                           4119 
                           4120 ; data for 0x0E00-0x0E0B EEPROM
   A226                    4121 LA226:
   A226 29 64 2A 21 32 3A  4122         .ascii  ')d*!2::4!ecq'
        3A 34 21 65 63 71
                           4123 
                           4124 ; program EEPROM
   A232                    4125 LA232:
   A232 18 3C         [ 5] 4126         pshy
   A234 C6 03         [ 2] 4127         ldab    #0x03
   A236 F7 10 3B      [ 4] 4128         stab    PPROG           ; start program
   A239 18 CE 1B 58   [ 4] 4129         ldy     #0x1B58
   A23D                    4130 LA23D:
   A23D 18 09         [ 4] 4131         dey
   A23F 26 FC         [ 3] 4132         bne     LA23D  
   A241 C6 02         [ 2] 4133         ldab    #0x02
   A243 F7 10 3B      [ 4] 4134         stab    PPROG           ; stop program
   A246 18 38         [ 6] 4135         puly
   A248 39            [ 5] 4136         rts
                           4137 
   A249                    4138 LA249:
   A249 0F            [ 2] 4139         sei
   A24A CE 00 10      [ 3] 4140         ldx     #0x0010
   A24D                    4141 LA24D:
   A24D 6F 00         [ 6] 4142         clr     0,X     
   A24F 08            [ 3] 4143         inx
   A250 8C 0E 00      [ 4] 4144         cpx     #0x0E00
   A253 26 F8         [ 3] 4145         bne     LA24D  
   A255 BD 9E AF      [ 6] 4146         jsr     L9EAF           ; reset L counts
   A258 BD 9E 92      [ 6] 4147         jsr     L9E92           ; reset R counts
   A25B 7E F8 00      [ 3] 4148         jmp     RESET           ; reset controller
                           4149 
                           4150 ; Compute and store copyright checksum
   A25E                    4151 LA25E:
   A25E 18 CE 80 03   [ 4] 4152         ldy     #CPYRTMSG       ; copyright message
   A262 CE 00 00      [ 3] 4153         ldx     #0x0000
   A265                    4154 LA265:
   A265 18 E6 00      [ 5] 4155         ldab    0,Y
   A268 3A            [ 3] 4156         abx
   A269 18 08         [ 4] 4157         iny
   A26B 18 8C 80 50   [ 5] 4158         cpy     #0x8050
   A26F 26 F4         [ 3] 4159         bne     LA265
   A271 FF 04 0B      [ 5] 4160         stx     CPYRTCS         ; store checksum here
   A274 39            [ 5] 4161         rts
                           4162 
                           4163 ; Erase EEPROM routine
   A275                    4164 LA275:
   A275 0F            [ 2] 4165         sei
   A276 7F 04 0F      [ 6] 4166         clr     ERASEFLG        ; Reset EEPROM Erase flag
   A279 86 0E         [ 2] 4167         ldaa    #0x0E
   A27B B7 10 3B      [ 4] 4168         staa    PPROG           ; ERASE mode!
   A27E 86 FF         [ 2] 4169         ldaa    #0xFF
   A280 B7 0E 20      [ 4] 4170         staa    (0x0E20)        ; save in NVRAM
   A283 B6 10 3B      [ 4] 4171         ldaa    PPROG  
   A286 8A 01         [ 2] 4172         oraa    #0x01
   A288 B7 10 3B      [ 4] 4173         staa    PPROG           ; do the ERASE
   A28B CE 1B 58      [ 3] 4174         ldx     #0x1B58         ; delay a bit
   A28E                    4175 LA28E:
   A28E 09            [ 3] 4176         dex
   A28F 26 FD         [ 3] 4177         bne     LA28E  
   A291 B6 10 3B      [ 4] 4178         ldaa    PPROG  
   A294 84 FE         [ 2] 4179         anda    #0xFE           ; stop erasing
   A296 7F 10 3B      [ 6] 4180         clr     PPROG  
                           4181 
   A299 BD F9 D8      [ 6] 4182         jsr     SERMSGW         ; display "enter serial number"
   A29C 45 6E 74 65 72 20  4183         .ascis  'Enter serial #: '
        73 65 72 69 61 6C
        20 23 3A A0
                           4184 
   A2AC CE 0E 20      [ 3] 4185         ldx     #0x0E20
   A2AF                    4186 LA2AF:
   A2AF BD F9 45      [ 6] 4187         jsr     SERIALR         ; wait for serial data
   A2B2 24 FB         [ 3] 4188         bcc     LA2AF  
                           4189 
   A2B4 BD F9 6F      [ 6] 4190         jsr     SERIALW         ; read serial data
   A2B7 C6 02         [ 2] 4191         ldab    #0x02
   A2B9 F7 10 3B      [ 4] 4192         stab    PPROG           ; protect only 0x0e20-0x0e5f
   A2BC A7 00         [ 4] 4193         staa    0,X         
   A2BE BD A2 32      [ 6] 4194         jsr     LA232           ; program byte
   A2C1 08            [ 3] 4195         inx
   A2C2 8C 0E 24      [ 4] 4196         cpx     #0x0E24
   A2C5 26 E8         [ 3] 4197         bne     LA2AF  
   A2C7 C6 02         [ 2] 4198         ldab    #0x02
   A2C9 F7 10 3B      [ 4] 4199         stab    PPROG  
   A2CC 86 DB         [ 2] 4200         ldaa    #0xDB           ; it's official
   A2CE B7 0E 24      [ 4] 4201         staa    (0x0E24)
   A2D1 BD A2 32      [ 6] 4202         jsr     LA232           ; program byte
   A2D4 7F 10 3B      [ 6] 4203         clr     PPROG  
   A2D7 86 1E         [ 2] 4204         ldaa    #0x1E
   A2D9 B7 10 35      [ 4] 4205         staa    BPROT           ; protect all but 0x0e00-0x0e1f
   A2DC 7E F8 00      [ 3] 4206         jmp     RESET           ; reset controller
                           4207 
   A2DF                    4208 LA2DF:
   A2DF 38            [ 5] 4209         pulx
   A2E0 3C            [ 4] 4210         pshx
   A2E1 8C 80 00      [ 4] 4211         cpx     #0x8000
   A2E4 25 02         [ 3] 4212         bcs     LA2E8           ; if 0x8000 < calling address (should be)
   A2E6 0C            [ 2] 4213         clc
   A2E7 39            [ 5] 4214         rts
                           4215 
   A2E8                    4216 LA2E8:
   A2E8 0D            [ 2] 4217         sec
   A2E9 39            [ 5] 4218         rts
                           4219 
                           4220 ; enter and validate security code via serial
   A2EA                    4221 LA2EA:
   A2EA CE 02 88      [ 3] 4222         ldx     #0x0288
   A2ED C6 03         [ 2] 4223         ldab    #0x03           ; 3 character code
                           4224 
   A2EF                    4225 LA2EF:
   A2EF BD F9 45      [ 6] 4226         jsr     SERIALR         ; check if available
   A2F2 24 FB         [ 3] 4227         bcc     LA2EF  
   A2F4 A7 00         [ 4] 4228         staa    0,X     
   A2F6 08            [ 3] 4229         inx
   A2F7 5A            [ 2] 4230         decb
   A2F8 26 F5         [ 3] 4231         bne     LA2EF  
                           4232 
   A2FA B6 02 88      [ 4] 4233         ldaa    (0x0288)
   A2FD 81 13         [ 2] 4234         cmpa    #0x13           ; 0x13
   A2FF 26 10         [ 3] 4235         bne     LA311  
   A301 B6 02 89      [ 4] 4236         ldaa    (0x0289)
   A304 81 10         [ 2] 4237         cmpa    #0x10           ; 0x10
   A306 26 09         [ 3] 4238         bne     LA311  
   A308 B6 02 8A      [ 4] 4239         ldaa    (0x028A)
   A30B 81 14         [ 2] 4240         cmpa    #0x14           ; 0x14
   A30D 26 02         [ 3] 4241         bne     LA311  
   A30F 0C            [ 2] 4242         clc
   A310 39            [ 5] 4243         rts
                           4244 
   A311                    4245 LA311:
   A311 0D            [ 2] 4246         sec
   A312 39            [ 5] 4247         rts
                           4248 
   A313                    4249 LA313:
   A313 36            [ 3] 4250         psha
   A314 B6 10 92      [ 4] 4251         ldaa    (0x1092)
   A317 8A 01         [ 2] 4252         oraa    #0x01
   A319                    4253 LA319:
   A319 B7 10 92      [ 4] 4254         staa    (0x1092)
   A31C 32            [ 4] 4255         pula
   A31D 39            [ 5] 4256         rts
                           4257 
   A31E                    4258 LA31E:
   A31E 36            [ 3] 4259         psha
   A31F B6 10 92      [ 4] 4260         ldaa    (0x1092)
   A322 84 FE         [ 2] 4261         anda    #0xFE
   A324 20 F3         [ 3] 4262         bra     LA319
                           4263 
   A326                    4264 LA326:
   A326 96 4E         [ 3] 4265         ldaa    (0x004E)
   A328 97 19         [ 3] 4266         staa    (0x0019)
   A32A 7F 00 4E      [ 6] 4267         clr     (0x004E)
   A32D 39            [ 5] 4268         rts
                           4269 
   A32E                    4270 LA32E:
   A32E B6 10 86      [ 4] 4271         ldaa    (0x1086)
   A331 8A 15         [ 2] 4272         oraa    #0x15
   A333 B7 10 86      [ 4] 4273         staa    (0x1086)
   A336 C6 01         [ 2] 4274         ldab    #0x01
   A338 BD 8C 30      [ 6] 4275         jsr     DLYSECSBY2      ; delay 0.5 sec
   A33B 84 EA         [ 2] 4276         anda    #0xEA
   A33D B7 10 86      [ 4] 4277         staa    (0x1086)
   A340 39            [ 5] 4278         rts
                           4279 
   A341                    4280 LA341:
   A341 B6 10 86      [ 4] 4281         ldaa    (0x1086)
   A344 8A 2A         [ 2] 4282         oraa    #0x2A           ; xx1x1x1x
   A346 B7 10 86      [ 4] 4283         staa    (0x1086)
   A349 C6 01         [ 2] 4284         ldab    #0x01
   A34B BD 8C 30      [ 6] 4285         jsr     DLYSECSBY2      ; delay 0.5 sec
   A34E 84 D5         [ 2] 4286         anda    #0xD5           ; xx0x0x0x
   A350 B7 10 86      [ 4] 4287         staa    (0x1086)
   A353 39            [ 5] 4288         rts
                           4289 
   A354                    4290 LA354:
   A354 F6 18 04      [ 4] 4291         ldab    PIA0PRA 
   A357 CA 08         [ 2] 4292         orab    #0x08
   A359 F7 18 04      [ 4] 4293         stab    PIA0PRA 
   A35C 39            [ 5] 4294         rts
                           4295 
   A35D F6 18 04      [ 4] 4296         ldab    PIA0PRA 
   A360 C4 F7         [ 2] 4297         andb    #0xF7
   A362 F7 18 04      [ 4] 4298         stab    PIA0PRA 
   A365 39            [ 5] 4299         rts
                           4300 
                           4301 ;'$' command goes here?
   A366                    4302 LA366:
   A366 7F 00 4E      [ 6] 4303         clr     (0x004E)
   A369 BD 86 C4      [ 6] 4304         jsr     L86C4           ; Reset boards 1-10
   A36C 7F 04 2A      [ 6] 4305         clr     (0x042A)
                           4306 
   A36F BD F9 D8      [ 6] 4307         jsr     SERMSGW
   A372 45 6E 74 65 72 20  4308         .ascis  'Enter security code:' 
        73 65 63 75 72 69
        74 79 20 63 6F 64
        65 BA
                           4309 
   A386 BD A2 EA      [ 6] 4310         jsr     LA2EA
   A389 24 03         [ 3] 4311         bcc     LA38E
   A38B 7E 83 31      [ 3] 4312         jmp     L8331
                           4313 
   A38E                    4314 LA38E:
   A38E BD F9 D8      [ 6] 4315         jsr     SERMSGW      
   A391 0C 0A 0D 44 61 76  4316         .ascii  "\f\n\rDave's Setup Utility\n\r"
        65 27 73 20 53 65
        74 75 70 20 55 74
        69 6C 69 74 79 0A
        0D
   A3AA 3C 4B 3E 69 6E 67  4317         .ascii  '<K>ing enable\n\r'
        20 65 6E 61 62 6C
        65 0A 0D
   A3B9 3C 43 3E 6C 65 61  4318         .ascii  '<C>lear random\n\r'
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A3C9 3C 35 3E 20 63 68  4319         .ascii  '<5> character random\n\r'
        61 72 61 63 74 65
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A3DF 3C 4C 3E 69 76 65  4320         .ascii  '<L>ive tape number clear\n\r'
        20 74 61 70 65 20
        6E 75 6D 62 65 72
        20 63 6C 65 61 72
        0A 0D
   A3F9 3C 52 3E 65 67 75  4321         .ascii  '<R>egular tape number clear\n\r'
        6C 61 72 20 74 61
        70 65 20 6E 75 6D
        62 65 72 20 63 6C
        65 61 72 0A 0D
   A416 3C 54 3E 65 73 74  4322         .ascii  '<T>est driver boards\n\r'
        20 64 72 69 76 65
        72 20 62 6F 61 72
        64 73 0A 0D
   A42C 3C 42 3E 75 62 20  4323         .ascii  '<B>ub test\n\r'
        74 65 73 74 0A 0D
   A438 3C 44 3E 65 63 6B  4324         .ascii  '<D>eck test (with tape inserted)\n\r'
        20 74 65 73 74 20
        28 77 69 74 68 20
        74 61 70 65 20 69
        6E 73 65 72 74 65
        64 29 0A 0D
   A45A 3C 37 3E 35 25 20  4325         .ascii  '<7>5% adjustment\n\r'
        61 64 6A 75 73 74
        6D 65 6E 74 0A 0D
   A46C 3C 53 3E 68 6F 77  4326         .ascii  '<S>how re-valid tapes\n\r'
        20 72 65 2D 76 61
        6C 69 64 20 74 61
        70 65 73 0A 0D
   A483 3C 4A 3E 75 6D 70  4327         .ascis  '<J>ump to system\n\r'
        20 74 6F 20 73 79
        73 74 65 6D 0A 8D
                           4328 
   A495                    4329 LA495:
   A495 BD F9 45      [ 6] 4330         jsr     SERIALR     
   A498 24 FB         [ 3] 4331         bcc     LA495  
   A49A 81 43         [ 2] 4332         cmpa    #0x43           ;'C'
   A49C 26 09         [ 3] 4333         bne     LA4A7  
   A49E 7F 04 01      [ 6] 4334         clr     (0x0401)        ;clear random
   A4A1 7F 04 2B      [ 6] 4335         clr     (0x042B)
   A4A4 7E A5 14      [ 3] 4336         jmp     LA514
   A4A7                    4337 LA4A7:
   A4A7 81 35         [ 2] 4338         cmpa    #0x35           ;'5'
   A4A9 26 0D         [ 3] 4339         bne     LA4B8  
   A4AB B6 04 01      [ 4] 4340         ldaa    (0x0401)        ;5 character random
   A4AE 84 7F         [ 2] 4341         anda    #0x7F
   A4B0 8A 7F         [ 2] 4342         oraa    #0x7F
   A4B2 B7 04 01      [ 4] 4343         staa    (0x0401)
   A4B5 7E A5 14      [ 3] 4344         jmp     LA514
   A4B8                    4345 LA4B8:
   A4B8 81 4C         [ 2] 4346         cmpa    #0x4C           ;'L'
   A4BA 26 06         [ 3] 4347         bne     LA4C2
   A4BC BD 9E AF      [ 6] 4348         jsr     L9EAF           ; reset Liv counts
   A4BF 7E A5 14      [ 3] 4349         jmp     LA514
   A4C2                    4350 LA4C2:
   A4C2 81 52         [ 2] 4351         cmpa    #0x52           ;'R'
   A4C4 26 06         [ 3] 4352         bne     LA4CC  
   A4C6 BD 9E 92      [ 6] 4353         jsr     L9E92           ; reset Reg counts
   A4C9 7E A5 14      [ 3] 4354         jmp     LA514
   A4CC                    4355 LA4CC:
   A4CC 81 54         [ 2] 4356         cmpa    #0x54           ;'T'
   A4CE 26 06         [ 3] 4357         bne     LA4D6  
   A4D0 BD A5 65      [ 6] 4358         jsr     LA565           ; test driver boards
   A4D3 7E A5 14      [ 3] 4359         jmp     LA514
   A4D6                    4360 LA4D6:
   A4D6 81 42         [ 2] 4361         cmpa    #0x42           ;'B'
   A4D8 26 06         [ 3] 4362         bne     LA4E0  
   A4DA BD A5 26      [ 6] 4363         jsr     LA526           ; bulb test?
   A4DD 7E A5 14      [ 3] 4364         jmp     LA514
   A4E0                    4365 LA4E0:
   A4E0 81 44         [ 2] 4366         cmpa    #0x44           ;'D'
   A4E2 26 06         [ 3] 4367         bne     LA4EA  
   A4E4 BD A5 3C      [ 6] 4368         jsr     LA53C           ; deck test
   A4E7 7E A5 14      [ 3] 4369         jmp     LA514
   A4EA                    4370 LA4EA:
   A4EA 81 37         [ 2] 4371         cmpa    #0x37           ;'7'
   A4EC 26 08         [ 3] 4372         bne     LA4F6  
   A4EE C6 FB         [ 2] 4373         ldab    #0xFB           ; tape deck PLAY
   A4F0 BD 86 E7      [ 6] 4374         jsr     L86E7           ; 5% adjustment
   A4F3 7E A5 14      [ 3] 4375         jmp     LA514
   A4F6                    4376 LA4F6:
   A4F6 81 4A         [ 2] 4377         cmpa    #0x4A           ;'J'
   A4F8 26 03         [ 3] 4378         bne     LA4FD  
   A4FA 7E F8 00      [ 3] 4379         jmp     RESET           ; jump to system (reset)
   A4FD                    4380 LA4FD:
   A4FD 81 4B         [ 2] 4381         cmpa    #0x4B           ;'K'
   A4FF 26 06         [ 3] 4382         bne     LA507  
   A501 7C 04 2A      [ 6] 4383         inc     (0x042A)        ; King enable
   A504 7E A5 14      [ 3] 4384         jmp     LA514
   A507                    4385 LA507:
   A507 81 53         [ 2] 4386         cmpa    #0x53           ;'S'
   A509 26 06         [ 3] 4387         bne     LA511  
   A50B BD AB 7C      [ 6] 4388         jsr     LAB7C           ; show re-valid tapes
   A50E 7E A5 14      [ 3] 4389         jmp     LA514
   A511                    4390 LA511:
   A511 7E A4 95      [ 3] 4391         jmp     LA495
   A514                    4392 LA514:
   A514 86 07         [ 2] 4393         ldaa    #0x07
   A516 BD F9 6F      [ 6] 4394         jsr     SERIALW      
   A519 C6 01         [ 2] 4395         ldab    #0x01
   A51B BD 8C 30      [ 6] 4396         jsr     DLYSECSBY2      ; delay 0.5 sec
   A51E 86 07         [ 2] 4397         ldaa    #0x07
   A520 BD F9 6F      [ 6] 4398         jsr     SERIALW      
   A523 7E A3 8E      [ 3] 4399         jmp     LA38E
                           4400 
                           4401 ; bulb test
   A526                    4402 LA526:
   A526 5F            [ 2] 4403         clrb
   A527 BD F9 C5      [ 6] 4404         jsr     BUTNLIT 
   A52A                    4405 LA52A:
   A52A F6 10 0A      [ 4] 4406         ldab    PORTE
   A52D C8 FF         [ 2] 4407         eorb    #0xFF
   A52F BD F9 C5      [ 6] 4408         jsr     BUTNLIT 
   A532 C1 80         [ 2] 4409         cmpb    #0x80
   A534 26 F4         [ 3] 4410         bne     LA52A  
   A536 C6 02         [ 2] 4411         ldab    #0x02
   A538 BD 8C 30      [ 6] 4412         jsr     DLYSECSBY2      ; delay 1 sec
   A53B 39            [ 5] 4413         rts
                           4414 
                           4415 ; deck test
   A53C                    4416 LA53C:
   A53C C6 FD         [ 2] 4417         ldab    #0xFD           ; tape deck STOP
   A53E BD 86 E7      [ 6] 4418         jsr     L86E7
   A541 C6 06         [ 2] 4419         ldab    #0x06
   A543 BD 8C 30      [ 6] 4420         jsr     DLYSECSBY2      ; delay 3 sec
   A546 C6 FB         [ 2] 4421         ldab    #0xFB           ; tape deck PLAY
   A548 BD 86 E7      [ 6] 4422         jsr     L86E7
   A54B C6 06         [ 2] 4423         ldab    #0x06
   A54D BD 8C 30      [ 6] 4424         jsr     DLYSECSBY2      ; delay 3 sec
   A550 C6 FD         [ 2] 4425         ldab    #0xFD           ; tape deck STOP
   A552 BD 86 E7      [ 6] 4426         jsr     L86E7
   A555 C6 F7         [ 2] 4427         ldab    #0xF7
   A557 BD 86 E7      [ 6] 4428         jsr     L86E7           ; tape deck REWIND
   A55A C6 06         [ 2] 4429         ldab    #0x06
   A55C BD 8C 30      [ 6] 4430         jsr     DLYSECSBY2      ; delay 3 sec
   A55F C6 EF         [ 2] 4431         ldab    #0xEF           ; tape deck EJECT
   A561 BD 86 E7      [ 6] 4432         jsr     L86E7
   A564 39            [ 5] 4433         rts
                           4434 
                           4435 ; test driver boards
   A565                    4436 LA565:
   A565 BD F9 45      [ 6] 4437         jsr     SERIALR     
   A568 24 08         [ 3] 4438         bcc     LA572  
   A56A 81 1B         [ 2] 4439         cmpa    #0x1B
   A56C 26 04         [ 3] 4440         bne     LA572  
   A56E BD 86 C4      [ 6] 4441         jsr     L86C4           ; Reset boards 1-10
   A571 39            [ 5] 4442         rts
   A572                    4443 LA572:
   A572 86 08         [ 2] 4444         ldaa    #0x08
   A574 97 15         [ 3] 4445         staa    (0x0015)
   A576 BD 86 C4      [ 6] 4446         jsr     L86C4           ; Reset boards 1-10
   A579 86 01         [ 2] 4447         ldaa    #0x01
   A57B                    4448 LA57B:
   A57B 36            [ 3] 4449         psha
   A57C 16            [ 2] 4450         tab
   A57D BD F9 C5      [ 6] 4451         jsr     BUTNLIT 
   A580 B6 18 04      [ 4] 4452         ldaa    PIA0PRA 
   A583 88 08         [ 2] 4453         eora    #0x08
   A585 B7 18 04      [ 4] 4454         staa    PIA0PRA 
   A588 32            [ 4] 4455         pula
   A589 B7 10 80      [ 4] 4456         staa    (0x1080)
   A58C B7 10 84      [ 4] 4457         staa    (0x1084)
   A58F B7 10 88      [ 4] 4458         staa    (0x1088)
   A592 B7 10 8C      [ 4] 4459         staa    (0x108C)
   A595 B7 10 90      [ 4] 4460         staa    (0x1090)
   A598 B7 10 94      [ 4] 4461         staa    (0x1094)
   A59B B7 10 98      [ 4] 4462         staa    (0x1098)
   A59E B7 10 9C      [ 4] 4463         staa    (0x109C)
   A5A1 C6 14         [ 2] 4464         ldab    #0x14
   A5A3 BD A6 52      [ 6] 4465         jsr     LA652
   A5A6 49            [ 2] 4466         rola
   A5A7 36            [ 3] 4467         psha
   A5A8 D6 15         [ 3] 4468         ldab    (0x0015)
   A5AA 5A            [ 2] 4469         decb
   A5AB D7 15         [ 3] 4470         stab    (0x0015)
   A5AD BD F9 95      [ 6] 4471         jsr     DIAGDGT         ; write digit to the diag display
   A5B0 37            [ 3] 4472         pshb
   A5B1 C6 27         [ 2] 4473         ldab    #0x27
   A5B3 96 15         [ 3] 4474         ldaa    (0x0015)
   A5B5 0C            [ 2] 4475         clc
   A5B6 89 30         [ 2] 4476         adca    #0x30
   A5B8 BD 8D B5      [ 6] 4477         jsr     L8DB5           ; display char here on LCD display
   A5BB 33            [ 4] 4478         pulb
   A5BC 32            [ 4] 4479         pula
   A5BD 5D            [ 2] 4480         tstb
   A5BE 26 BB         [ 3] 4481         bne     LA57B  
   A5C0 86 08         [ 2] 4482         ldaa    #0x08
   A5C2 97 15         [ 3] 4483         staa    (0x0015)
   A5C4 BD 86 C4      [ 6] 4484         jsr     L86C4           ; Reset boards 1-10
   A5C7 86 01         [ 2] 4485         ldaa    #0x01
   A5C9                    4486 LA5C9:
   A5C9 B7 10 82      [ 4] 4487         staa    (0x1082)
   A5CC B7 10 86      [ 4] 4488         staa    (0x1086)
   A5CF B7 10 8A      [ 4] 4489         staa    (0x108A)
   A5D2 B7 10 8E      [ 4] 4490         staa    (0x108E)
   A5D5 B7 10 92      [ 4] 4491         staa    (0x1092)
   A5D8 B7 10 96      [ 4] 4492         staa    (0x1096)
   A5DB B7 10 9A      [ 4] 4493         staa    (0x109A)
   A5DE B7 10 9E      [ 4] 4494         staa    (0x109E)
   A5E1 C6 14         [ 2] 4495         ldab    #0x14
   A5E3 BD A6 52      [ 6] 4496         jsr     LA652
   A5E6 49            [ 2] 4497         rola
   A5E7 36            [ 3] 4498         psha
   A5E8 D6 15         [ 3] 4499         ldab    (0x0015)
   A5EA 5A            [ 2] 4500         decb
   A5EB D7 15         [ 3] 4501         stab    (0x0015)
   A5ED BD F9 95      [ 6] 4502         jsr     DIAGDGT         ; write digit to the diag display
   A5F0 37            [ 3] 4503         pshb
   A5F1 C6 27         [ 2] 4504         ldab    #0x27
   A5F3 96 15         [ 3] 4505         ldaa    (0x0015)
   A5F5 0C            [ 2] 4506         clc
   A5F6 89 30         [ 2] 4507         adca    #0x30
   A5F8 BD 8D B5      [ 6] 4508         jsr     L8DB5           ; display char here on LCD display
   A5FB 33            [ 4] 4509         pulb
   A5FC 32            [ 4] 4510         pula
   A5FD 7D 00 15      [ 6] 4511         tst     (0x0015)
   A600 26 C7         [ 3] 4512         bne     LA5C9  
   A602 BD 86 C4      [ 6] 4513         jsr     L86C4           ; Reset boards 1-10
   A605 CE 10 80      [ 3] 4514         ldx     #0x1080
   A608 C6 00         [ 2] 4515         ldab    #0x00
   A60A                    4516 LA60A:
   A60A 86 FF         [ 2] 4517         ldaa    #0xFF
   A60C A7 00         [ 4] 4518         staa    0,X
   A60E A7 02         [ 4] 4519         staa    2,X     
   A610 37            [ 3] 4520         pshb
   A611 C6 1E         [ 2] 4521         ldab    #0x1E
   A613 BD A6 52      [ 6] 4522         jsr     LA652
   A616 33            [ 4] 4523         pulb
   A617 86 00         [ 2] 4524         ldaa    #0x00
   A619 A7 00         [ 4] 4525         staa    0,X     
   A61B A7 02         [ 4] 4526         staa    2,X     
   A61D 5C            [ 2] 4527         incb
   A61E 3C            [ 4] 4528         pshx
   A61F BD F9 95      [ 6] 4529         jsr     DIAGDGT         ; write digit to the diag display
   A622 37            [ 3] 4530         pshb
   A623 C6 27         [ 2] 4531         ldab    #0x27
   A625 32            [ 4] 4532         pula
   A626 36            [ 3] 4533         psha
   A627 0C            [ 2] 4534         clc
   A628 89 30         [ 2] 4535         adca    #0x30
   A62A BD 8D B5      [ 6] 4536         jsr     L8DB5           ; display char here on LCD display
   A62D 33            [ 4] 4537         pulb
   A62E 38            [ 5] 4538         pulx
   A62F 08            [ 3] 4539         inx
   A630 08            [ 3] 4540         inx
   A631 08            [ 3] 4541         inx
   A632 08            [ 3] 4542         inx
   A633 8C 10 9D      [ 4] 4543         cpx     #0x109D
   A636 25 D2         [ 3] 4544         bcs     LA60A  
   A638 CE 10 80      [ 3] 4545         ldx     #0x1080
   A63B                    4546 LA63B:
   A63B 86 FF         [ 2] 4547         ldaa    #0xFF
   A63D A7 00         [ 4] 4548         staa    0,X     
   A63F A7 02         [ 4] 4549         staa    2,X     
   A641 08            [ 3] 4550         inx
   A642 08            [ 3] 4551         inx
   A643 08            [ 3] 4552         inx
   A644 08            [ 3] 4553         inx
   A645 8C 10 9D      [ 4] 4554         cpx     #0x109D
   A648 25 F1         [ 3] 4555         bcs     LA63B  
   A64A C6 06         [ 2] 4556         ldab    #0x06
   A64C BD 8C 30      [ 6] 4557         jsr     DLYSECSBY2      ; delay 3 sec
   A64F 7E A5 65      [ 3] 4558         jmp     LA565
   A652                    4559 LA652:
   A652 36            [ 3] 4560         psha
   A653 4F            [ 2] 4561         clra
   A654 DD 23         [ 4] 4562         std     CDTIMR5
   A656                    4563 LA656:
   A656 7D 00 24      [ 6] 4564         tst     CDTIMR5+1
   A659 26 FB         [ 3] 4565         bne     LA656  
   A65B 32            [ 4] 4566         pula
   A65C 39            [ 5] 4567         rts
                           4568 
                           4569 ; Comma-seperated text
   A65D                    4570 LA65D:
   A65D 30 2C 43 68 75 63  4571         .ascii  '0,Chuck,Mouth,'
        6B 2C 4D 6F 75 74
        68 2C
   A66B 31 2C 48 65 61 64  4572         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A677 32 2C 48 65 61 64  4573         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A684 32 2C 48 65 61 64  4574         .ascii  '2,Head up,'
        20 75 70 2C
   A68E 32 2C 45 79 65 73  4575         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A69B 31 2C 45 79 65 6C  4576         .ascii  '1,Eyelids,'
        69 64 73 2C
   A6A5 31 2C 52 69 67 68  4577         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A6B2 32 2C 45 79 65 73  4578         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A6BE 31 2C 38 2C 48 65  4579         .ascii  '1,8,Helen,Mouth,'
        6C 65 6E 2C 4D 6F
        75 74 68 2C
   A6CE 31 2C 48 65 61 64  4580         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A6DA 32 2C 48 65 61 64  4581         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A6E7 32 2C 48 65 61 64  4582         .ascii  '2,Head up,'
        20 75 70 2C
   A6F1 32 2C 45 79 65 73  4583         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A6FE 31 2C 45 79 65 6C  4584         .ascii  '1,Eyelids,'
        69 64 73 2C
   A708 31 2C 52 69 67 68  4585         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A715 32 2C 45 79 65 73  4586         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A721 31 2C 36 2C 4D 75  4587         .ascii  '1,6,Munch,Mouth,'
        6E 63 68 2C 4D 6F
        75 74 68 2C
   A731 31 2C 48 65 61 64  4588         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A73D 32 2C 48 65 61 64  4589         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A74A 32 2C 4C 65 66 74  4590         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A755 32 2C 45 79 65 73  4591         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A762 31 2C 45 79 65 6C  4592         .ascii  '1,Eyelids,'
        69 64 73 2C
   A76C 31 2C 52 69 67 68  4593         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A778 32 2C 45 79 65 73  4594         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A784 31 2C 32 2C 4A 61  4595         .ascii  '1,2,Jasper,Mouth,'
        73 70 65 72 2C 4D
        6F 75 74 68 2C
   A795 31 2C 48 65 61 64  4596         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A7A1 32 2C 48 65 61 64  4597         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A7AE 32 2C 48 65 61 64  4598         .ascii  '2,Head up,'
        20 75 70 2C
   A7B8 32 2C 45 79 65 73  4599         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A7C5 31 2C 45 79 65 6C  4600         .ascii  '1,Eyelids,'
        69 64 73 2C
   A7CF 31 2C 48 61 6E 64  4601         .ascii  '1,Hands,'
        73 2C
   A7D7 32 2C 45 79 65 73  4602         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A7E3 31 2C 34 2C 50 61  4603         .ascii  '1,4,Pasqually,Mouth-Mustache,'
        73 71 75 61 6C 6C
        79 2C 4D 6F 75 74
        68 2D 4D 75 73 74
        61 63 68 65 2C
   A800 31 2C 48 65 61 64  4604         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A80C 32 2C 48 65 61 64  4605         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A819 32 2C 4C 65 66 74  4606         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A824 32 2C 45 79 65 73  4607         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A831 31 2C 45 79 65 6C  4608         .ascii  '1,Eyelids,'
        69 64 73 2C
   A83B 31 2C 52 69 67 68  4609         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A847 32 2C 45 79 65 73  4610         .ascii  '2,Eyes left,1,'
        20 6C 65 66 74 2C
        31 2C
                           4611 
   A855                    4612 LA855:
   A855 3C            [ 4] 4613         pshx
   A856 BD 86 C4      [ 6] 4614         jsr     L86C4           ; Reset boards 1-10
   A859 CE 10 80      [ 3] 4615         ldx     #0x1080
   A85C 86 20         [ 2] 4616         ldaa    #0x20
   A85E A7 00         [ 4] 4617         staa    0,X
   A860 A7 04         [ 4] 4618         staa    4,X
   A862 A7 08         [ 4] 4619         staa    8,X
   A864 A7 0C         [ 4] 4620         staa    12,X
   A866 A7 10         [ 4] 4621         staa    16,X
   A868 38            [ 5] 4622         pulx
   A869 39            [ 5] 4623         rts
                           4624 
   A86A                    4625 LA86A:
   A86A BD A3 2E      [ 6] 4626         jsr     LA32E
                           4627 
   A86D BD 8D E4      [ 6] 4628         jsr     LCDMSG1 
   A870 20 20 20 20 57 61  4629         .ascis  '    Warm-Up  '
        72 6D 2D 55 70 20
        A0
                           4630 
   A87D BD 8D DD      [ 6] 4631         jsr     LCDMSG2 
   A880 43 75 72 74 61 69  4632         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           4633 
   A890 C6 14         [ 2] 4634         ldab    #0x14
   A892 BD 8C 30      [ 6] 4635         jsr     DLYSECSBY2      ; delay 10 sec
   A895                    4636 LA895:
   A895 BD A8 55      [ 6] 4637         jsr     LA855
   A898 C6 02         [ 2] 4638         ldab    #0x02
   A89A BD 8C 30      [ 6] 4639         jsr     DLYSECSBY2      ; delay 1 sec
   A89D CE A6 5D      [ 3] 4640         ldx     #LA65D
   A8A0 C6 05         [ 2] 4641         ldab    #0x05
   A8A2 D7 12         [ 3] 4642         stab    (0x0012)
   A8A4                    4643 LA8A4:
   A8A4 C6 08         [ 2] 4644         ldab    #0x08
   A8A6 D7 13         [ 3] 4645         stab    (0x0013)
   A8A8 BD A9 41      [ 6] 4646         jsr     LA941
   A8AB BD A9 4C      [ 6] 4647         jsr     LA94C
   A8AE C6 02         [ 2] 4648         ldab    #0x02
   A8B0 BD 8C 30      [ 6] 4649         jsr     DLYSECSBY2      ; delay 1 sec
   A8B3                    4650 LA8B3:
   A8B3 BD A9 5E      [ 6] 4651         jsr     LA95E
   A8B6 A6 00         [ 4] 4652         ldaa    0,X     
   A8B8 80 30         [ 2] 4653         suba    #0x30
   A8BA 08            [ 3] 4654         inx
   A8BB 08            [ 3] 4655         inx
   A8BC 36            [ 3] 4656         psha
   A8BD 7C 00 4C      [ 6] 4657         inc     (0x004C)
   A8C0 3C            [ 4] 4658         pshx
   A8C1 BD 88 E5      [ 6] 4659         jsr     L88E5
   A8C4 38            [ 5] 4660         pulx
   A8C5 86 4F         [ 2] 4661         ldaa    #0x4F           ;'O'
   A8C7 C6 0C         [ 2] 4662         ldab    #0x0C
   A8C9 BD 8D B5      [ 6] 4663         jsr     L8DB5           ; display char here on LCD display
   A8CC 86 6E         [ 2] 4664         ldaa    #0x6E           ;'n'
   A8CE C6 0D         [ 2] 4665         ldab    #0x0D
   A8D0 BD 8D B5      [ 6] 4666         jsr     L8DB5           ; display char here on LCD display
   A8D3 CC 20 0E      [ 3] 4667         ldd     #0x200E         ;' '
   A8D6 BD 8D B5      [ 6] 4668         jsr     L8DB5           ; display char here on LCD display
   A8D9 7A 00 4C      [ 6] 4669         dec     (0x004C)
   A8DC 32            [ 4] 4670         pula
   A8DD 36            [ 3] 4671         psha
   A8DE C6 64         [ 2] 4672         ldab    #0x64
   A8E0 3D            [10] 4673         mul
   A8E1 DD 23         [ 4] 4674         std     CDTIMR5
   A8E3                    4675 LA8E3:
   A8E3 DC 23         [ 4] 4676         ldd     CDTIMR5
   A8E5 26 FC         [ 3] 4677         bne     LA8E3  
   A8E7 BD 8E 95      [ 6] 4678         jsr     L8E95
   A8EA 81 0D         [ 2] 4679         cmpa    #0x0D
   A8EC 26 05         [ 3] 4680         bne     LA8F3  
   A8EE BD A9 75      [ 6] 4681         jsr     LA975           ; Wait for SCD Keypress
   A8F1 20 10         [ 3] 4682         bra     LA903  
   A8F3                    4683 LA8F3:
   A8F3 81 01         [ 2] 4684         cmpa    #0x01
   A8F5 26 04         [ 3] 4685         bne     LA8FB  
   A8F7 32            [ 4] 4686         pula
   A8F8 7E A8 95      [ 3] 4687         jmp     LA895
   A8FB                    4688 LA8FB:
   A8FB 81 02         [ 2] 4689         cmpa    #0x02
   A8FD 26 04         [ 3] 4690         bne     LA903  
   A8FF 32            [ 4] 4691         pula
   A900 7E A9 35      [ 3] 4692         jmp     LA935
   A903                    4693 LA903:
   A903 3C            [ 4] 4694         pshx
   A904 BD 88 E5      [ 6] 4695         jsr     L88E5
   A907 38            [ 5] 4696         pulx
   A908 86 66         [ 2] 4697         ldaa    #0x66           ;'f'
   A90A C6 0D         [ 2] 4698         ldab    #0x0D
   A90C BD 8D B5      [ 6] 4699         jsr     L8DB5           ; display char here on LCD display
   A90F 86 66         [ 2] 4700         ldaa    #0x66           ;'f'
   A911 C6 0E         [ 2] 4701         ldab    #0x0E
   A913 BD 8D B5      [ 6] 4702         jsr     L8DB5           ; display char here on LCD display
   A916 32            [ 4] 4703         pula
   A917 C6 64         [ 2] 4704         ldab    #0x64
   A919 3D            [10] 4705         mul
   A91A DD 23         [ 4] 4706         std     CDTIMR5
   A91C                    4707 LA91C:
   A91C DC 23         [ 4] 4708         ldd     CDTIMR5
   A91E 26 FC         [ 3] 4709         bne     LA91C  
   A920 BD A8 55      [ 6] 4710         jsr     LA855
   A923 7C 00 4B      [ 6] 4711         inc     (0x004B)
   A926 96 4B         [ 3] 4712         ldaa    (0x004B)
   A928 81 48         [ 2] 4713         cmpa    #0x48
   A92A 25 87         [ 3] 4714         bcs     LA8B3  
   A92C 96 4C         [ 3] 4715         ldaa    (0x004C)
   A92E 81 34         [ 2] 4716         cmpa    #0x34
   A930 27 03         [ 3] 4717         beq     LA935  
   A932 7E A8 A4      [ 3] 4718         jmp     LA8A4
   A935                    4719 LA935:
   A935 C6 02         [ 2] 4720         ldab    #0x02
   A937 BD 8C 30      [ 6] 4721         jsr     DLYSECSBY2      ; delay 1 sec
   A93A BD 86 C4      [ 6] 4722         jsr     L86C4           ; Reset boards 1-10
   A93D BD A3 41      [ 6] 4723         jsr     LA341
   A940 39            [ 5] 4724         rts
                           4725 
   A941                    4726 LA941:
   A941 A6 00         [ 4] 4727         ldaa    0,X     
   A943 08            [ 3] 4728         inx
   A944 08            [ 3] 4729         inx
   A945 97 4C         [ 3] 4730         staa    (0x004C)
   A947 86 40         [ 2] 4731         ldaa    #0x40
   A949 97 4B         [ 3] 4732         staa    (0x004B)
   A94B 39            [ 5] 4733         rts
                           4734 
   A94C                    4735 LA94C:
   A94C BD 8C F2      [ 6] 4736         jsr     L8CF2
   A94F                    4737 LA94F:
   A94F A6 00         [ 4] 4738         ldaa    0,X     
   A951 08            [ 3] 4739         inx
   A952 81 2C         [ 2] 4740         cmpa    #0x2C
   A954 27 07         [ 3] 4741         beq     LA95D  
   A956 36            [ 3] 4742         psha
   A957 BD 8E 70      [ 6] 4743         jsr     L8E70
   A95A 32            [ 4] 4744         pula
   A95B 20 F2         [ 3] 4745         bra     LA94F  
   A95D                    4746 LA95D:
   A95D 39            [ 5] 4747         rts
                           4748 
   A95E                    4749 LA95E:
   A95E BD 8D 03      [ 6] 4750         jsr     L8D03
   A961 86 C0         [ 2] 4751         ldaa    #0xC0
   A963 BD 8E 4B      [ 6] 4752         jsr     L8E4B
   A966                    4753 LA966:
   A966 A6 00         [ 4] 4754         ldaa    0,X     
   A968 08            [ 3] 4755         inx
   A969 81 2C         [ 2] 4756         cmpa    #0x2C
   A96B 27 07         [ 3] 4757         beq     LA974  
   A96D 36            [ 3] 4758         psha
   A96E BD 8E 70      [ 6] 4759         jsr     L8E70
   A971 32            [ 4] 4760         pula
   A972 20 F2         [ 3] 4761         bra     LA966  
   A974                    4762 LA974:
   A974 39            [ 5] 4763         rts
                           4764 
                           4765 ; Wait for SCD Keypress
   A975                    4766 LA975:
   A975 BD 8E 95      [ 6] 4767         jsr     L8E95
   A978 4D            [ 2] 4768         tsta
   A979 27 FA         [ 3] 4769         beq     LA975  
   A97B 39            [ 5] 4770         rts
                           4771 
   A97C                    4772 LA97C:
   A97C 7F 00 60      [ 6] 4773         clr     (0x0060)
   A97F FC 02 9C      [ 5] 4774         ldd     (0x029C)
   A982 1A 83 00 01   [ 5] 4775         cpd     #0x0001
   A986 27 0C         [ 3] 4776         beq     LA994  
   A988 1A 83 03 E8   [ 5] 4777         cpd     #0x03E8
   A98C 2D 7D         [ 3] 4778         blt     LAA0B  
   A98E 1A 83 04 4B   [ 5] 4779         cpd     #0x044B
   A992 22 77         [ 3] 4780         bhi     LAA0B  
   A994                    4781 LA994:
   A994 C6 40         [ 2] 4782         ldab    #0x40
   A996 D7 62         [ 3] 4783         stab    (0x0062)
   A998 BD F9 C5      [ 6] 4784         jsr     BUTNLIT 
   A99B C6 64         [ 2] 4785         ldab    #0x64           ; delay 1 sec
   A99D BD 8C 22      [ 6] 4786         jsr     DLYSECSBY100
   A9A0 BD 86 C4      [ 6] 4787         jsr     L86C4           ; Reset boards 1-10
   A9A3 BD 8C E9      [ 6] 4788         jsr     L8CE9
                           4789 
   A9A6 BD 8D E4      [ 6] 4790         jsr     LCDMSG1 
   A9A9 20 20 20 20 20 53  4791         .ascis  '     STUDIO'
        54 55 44 49 CF
                           4792 
   A9B4 BD 8D DD      [ 6] 4793         jsr     LCDMSG2 
   A9B7 70 72 6F 67 72 61  4794         .ascis  'programming mode'
        6D 6D 69 6E 67 20
        6D 6F 64 E5
                           4795 
   A9C7 BD A3 2E      [ 6] 4796         jsr     LA32E
   A9CA BD 99 9E      [ 6] 4797         jsr     L999E
   A9CD BD 99 B1      [ 6] 4798         jsr     L99B1
   A9D0 CE 20 00      [ 3] 4799         ldx     #0x2000
   A9D3                    4800 LA9D3:
   A9D3 18 CE 00 C0   [ 4] 4801         ldy     #0x00C0
   A9D7                    4802 LA9D7:
   A9D7 18 09         [ 4] 4803         dey
   A9D9 26 0A         [ 3] 4804         bne     LA9E5  
   A9DB BD A9 F4      [ 6] 4805         jsr     LA9F4
   A9DE 96 60         [ 3] 4806         ldaa    (0x0060)
   A9E0 26 29         [ 3] 4807         bne     LAA0B  
   A9E2 CE 20 00      [ 3] 4808         ldx     #0x2000
   A9E5                    4809 LA9E5:
   A9E5 B6 10 A8      [ 4] 4810         ldaa    (0x10A8)
   A9E8 84 01         [ 2] 4811         anda    #0x01
   A9EA 27 EB         [ 3] 4812         beq     LA9D7  
   A9EC B6 10 A9      [ 4] 4813         ldaa    (0x10A9)
   A9EF A7 00         [ 4] 4814         staa    0,X     
   A9F1 08            [ 3] 4815         inx
   A9F2 20 DF         [ 3] 4816         bra     LA9D3
                           4817 
   A9F4                    4818 LA9F4:
   A9F4 CE 20 00      [ 3] 4819         ldx     #0x2000
   A9F7 18 CE 10 80   [ 4] 4820         ldy     #0x1080
   A9FB                    4821 LA9FB:
   A9FB A6 00         [ 4] 4822         ldaa    0,X     
   A9FD 18 A7 00      [ 5] 4823         staa    0,Y     
   AA00 08            [ 3] 4824         inx
   AA01 18 08         [ 4] 4825         iny
   AA03 18 08         [ 4] 4826         iny
   AA05 8C 20 10      [ 4] 4827         cpx     #0x2010
   AA08 25 F1         [ 3] 4828         bcs     LA9FB  
   AA0A 39            [ 5] 4829         rts
   AA0B                    4830 LAA0B:
   AA0B 39            [ 5] 4831         rts
                           4832 
   AA0C                    4833 LAA0C:
   AA0C CC 48 37      [ 3] 4834         ldd     #0x4837         ;'H'
   AA0F                    4835 LAA0F:
   AA0F BD 8D B5      [ 6] 4836         jsr     L8DB5           ; display char here on LCD display
   AA12 39            [ 5] 4837         rts
                           4838 
   AA13                    4839 LAA13:
   AA13 CC 20 37      [ 3] 4840         ldd     #0x2037         ;' '
   AA16 20 F7         [ 3] 4841         bra     LAA0F
                           4842 
   AA18                    4843 LAA18:
   AA18 CC 42 0F      [ 3] 4844         ldd     #0x420F         ;'B'
   AA1B 20 F2         [ 3] 4845         bra     LAA0F
                           4846 
   AA1D                    4847 LAA1D:
   AA1D CC 20 0F      [ 3] 4848         ldd     #0x200F         ;' '
   AA20 20 ED         [ 3] 4849         bra     LAA0F
                           4850 
   AA22                    4851 LAA22: 
   AA22 7F 00 4F      [ 6] 4852         clr     (0x004F)
   AA25 CC 00 01      [ 3] 4853         ldd     #0x0001
   AA28 DD 1B         [ 4] 4854         std     CDTIMR1
   AA2A CE 20 00      [ 3] 4855         ldx     #0x2000
   AA2D                    4856 LAA2D:
   AA2D B6 10 A8      [ 4] 4857         ldaa    (0x10A8)
   AA30 84 01         [ 2] 4858         anda    #0x01
   AA32 27 F9         [ 3] 4859         beq     LAA2D  
   AA34 DC 1B         [ 4] 4860         ldd     CDTIMR1
   AA36 0F            [ 2] 4861         sei
   AA37 26 03         [ 3] 4862         bne     LAA3C  
   AA39 CE 20 00      [ 3] 4863         ldx     #0x2000
   AA3C                    4864 LAA3C:
   AA3C B6 10 A9      [ 4] 4865         ldaa    (0x10A9)
   AA3F A7 00         [ 4] 4866         staa    0,X     
   AA41 0E            [ 2] 4867         cli
   AA42 BD F9 6F      [ 6] 4868         jsr     SERIALW      
   AA45 08            [ 3] 4869         inx
   AA46 7F 00 4F      [ 6] 4870         clr     (0x004F)
   AA49 CC 00 01      [ 3] 4871         ldd     #0x0001
   AA4C DD 1B         [ 4] 4872         std     CDTIMR1
   AA4E 8C 20 23      [ 4] 4873         cpx     #0x2023
   AA51 26 DA         [ 3] 4874         bne     LAA2D  
   AA53 CE 20 00      [ 3] 4875         ldx     #0x2000
   AA56 7F 00 B7      [ 6] 4876         clr     (0x00B7)
   AA59                    4877 LAA59:
   AA59 A6 00         [ 4] 4878         ldaa    0,X     
   AA5B 9B B7         [ 3] 4879         adda    (0x00B7)
   AA5D 97 B7         [ 3] 4880         staa    (0x00B7)
   AA5F 08            [ 3] 4881         inx
   AA60 8C 20 22      [ 4] 4882         cpx     #0x2022
   AA63 25 F4         [ 3] 4883         bcs     LAA59  
   AA65 96 B7         [ 3] 4884         ldaa    (0x00B7)
   AA67 88 FF         [ 2] 4885         eora    #0xFF
   AA69 A1 00         [ 4] 4886         cmpa    0,X     
   AA6B CE 20 00      [ 3] 4887         ldx     #0x2000
   AA6E A6 20         [ 4] 4888         ldaa    0x20,X
   AA70 2B 03         [ 3] 4889         bmi     LAA75  
   AA72 7E AA 22      [ 3] 4890         jmp     LAA22
   AA75                    4891 LAA75:
   AA75 A6 00         [ 4] 4892         ldaa    0,X     
   AA77 B7 10 80      [ 4] 4893         staa    (0x1080)
   AA7A 08            [ 3] 4894         inx
   AA7B A6 00         [ 4] 4895         ldaa    0,X     
   AA7D B7 10 82      [ 4] 4896         staa    (0x1082)
   AA80 08            [ 3] 4897         inx
   AA81 A6 00         [ 4] 4898         ldaa    0,X     
   AA83 B7 10 84      [ 4] 4899         staa    (0x1084)
   AA86 08            [ 3] 4900         inx
   AA87 A6 00         [ 4] 4901         ldaa    0,X     
   AA89 B7 10 86      [ 4] 4902         staa    (0x1086)
   AA8C 08            [ 3] 4903         inx
   AA8D A6 00         [ 4] 4904         ldaa    0,X     
   AA8F B7 10 88      [ 4] 4905         staa    (0x1088)
   AA92 08            [ 3] 4906         inx
   AA93 A6 00         [ 4] 4907         ldaa    0,X     
   AA95 B7 10 8A      [ 4] 4908         staa    (0x108A)
   AA98 08            [ 3] 4909         inx
   AA99 A6 00         [ 4] 4910         ldaa    0,X     
   AA9B B7 10 8C      [ 4] 4911         staa    (0x108C)
   AA9E 08            [ 3] 4912         inx
   AA9F A6 00         [ 4] 4913         ldaa    0,X     
   AAA1 B7 10 8E      [ 4] 4914         staa    (0x108E)
   AAA4 08            [ 3] 4915         inx
   AAA5 A6 00         [ 4] 4916         ldaa    0,X     
   AAA7 B7 10 90      [ 4] 4917         staa    (0x1090)
   AAAA 08            [ 3] 4918         inx
   AAAB A6 00         [ 4] 4919         ldaa    0,X     
   AAAD B7 10 92      [ 4] 4920         staa    (0x1092)
   AAB0 08            [ 3] 4921         inx
   AAB1 A6 00         [ 4] 4922         ldaa    0,X     
   AAB3 8A 80         [ 2] 4923         oraa    #0x80
   AAB5 B7 10 94      [ 4] 4924         staa    (0x1094)
   AAB8 08            [ 3] 4925         inx
   AAB9 A6 00         [ 4] 4926         ldaa    0,X     
   AABB 8A 01         [ 2] 4927         oraa    #0x01
   AABD B7 10 96      [ 4] 4928         staa    (0x1096)
   AAC0 08            [ 3] 4929         inx
   AAC1 A6 00         [ 4] 4930         ldaa    0,X     
   AAC3 B7 10 98      [ 4] 4931         staa    (0x1098)
   AAC6 08            [ 3] 4932         inx
   AAC7 A6 00         [ 4] 4933         ldaa    0,X     
   AAC9 B7 10 9A      [ 4] 4934         staa    (0x109A)
   AACC 08            [ 3] 4935         inx
   AACD A6 00         [ 4] 4936         ldaa    0,X     
   AACF B7 10 9C      [ 4] 4937         staa    (0x109C)
   AAD2 08            [ 3] 4938         inx
   AAD3 A6 00         [ 4] 4939         ldaa    0,X     
   AAD5 B7 10 9E      [ 4] 4940         staa    (0x109E)
   AAD8 7E AA 22      [ 3] 4941         jmp     LAA22
                           4942 
   AADB                    4943 LAADB:
   AADB 7F 10 98      [ 6] 4944         clr     (0x1098)
   AADE 7F 10 9A      [ 6] 4945         clr     (0x109A)
   AAE1 7F 10 9C      [ 6] 4946         clr     (0x109C)
   AAE4 7F 10 9E      [ 6] 4947         clr     (0x109E)
   AAE7 39            [ 5] 4948         rts
   AAE8                    4949 LAAE8:
   AAE8 CE 04 2C      [ 3] 4950         ldx     #0x042C
   AAEB C6 10         [ 2] 4951         ldab    #0x10
   AAED                    4952 LAAED:
   AAED 5D            [ 2] 4953         tstb
   AAEE 27 12         [ 3] 4954         beq     LAB02  
   AAF0 A6 00         [ 4] 4955         ldaa    0,X     
   AAF2 81 30         [ 2] 4956         cmpa    #0x30
   AAF4 25 0D         [ 3] 4957         bcs     LAB03  
   AAF6 81 39         [ 2] 4958         cmpa    #0x39
   AAF8 22 09         [ 3] 4959         bhi     LAB03  
   AAFA 08            [ 3] 4960         inx
   AAFB 08            [ 3] 4961         inx
   AAFC 08            [ 3] 4962         inx
   AAFD 8C 04 59      [ 4] 4963         cpx     #0x0459
   AB00 23 EB         [ 3] 4964         bls     LAAED  
   AB02                    4965 LAB02:
   AB02 39            [ 5] 4966         rts
                           4967 
   AB03                    4968 LAB03:
   AB03 5A            [ 2] 4969         decb
   AB04 3C            [ 4] 4970         pshx
   AB05                    4971 LAB05:
   AB05 A6 03         [ 4] 4972         ldaa    3,X     
   AB07 A7 00         [ 4] 4973         staa    0,X     
   AB09 08            [ 3] 4974         inx
   AB0A 8C 04 5C      [ 4] 4975         cpx     #0x045C
   AB0D 25 F6         [ 3] 4976         bcs     LAB05  
   AB0F 86 FF         [ 2] 4977         ldaa    #0xFF
   AB11 B7 04 59      [ 4] 4978         staa    (0x0459)
   AB14 38            [ 5] 4979         pulx
   AB15 20 D6         [ 3] 4980         bra     LAAED
                           4981 
                           4982 ; erase revalid tape section in EEPROM
   AB17                    4983 LAB17:
   AB17 CE 04 2C      [ 3] 4984         ldx     #0x042C
   AB1A 86 FF         [ 2] 4985         ldaa    #0xFF
   AB1C                    4986 LAB1C:
   AB1C A7 00         [ 4] 4987         staa    0,X     
   AB1E 08            [ 3] 4988         inx
   AB1F 8C 04 5C      [ 4] 4989         cpx     #0x045C
   AB22 25 F8         [ 3] 4990         bcs     LAB1C
   AB24 39            [ 5] 4991         rts
                           4992 
   AB25                    4993 LAB25:
   AB25 CE 04 2C      [ 3] 4994         ldx     #0x042C
   AB28                    4995 LAB28:
   AB28 A6 00         [ 4] 4996         ldaa    0,X     
   AB2A 81 30         [ 2] 4997         cmpa    #0x30
   AB2C 25 17         [ 3] 4998         bcs     LAB45  
   AB2E 81 39         [ 2] 4999         cmpa    #0x39
   AB30 22 13         [ 3] 5000         bhi     LAB45  
   AB32 08            [ 3] 5001         inx
   AB33 08            [ 3] 5002         inx
   AB34 08            [ 3] 5003         inx
   AB35 8C 04 5C      [ 4] 5004         cpx     #0x045C
   AB38 25 EE         [ 3] 5005         bcs     LAB28  
   AB3A 86 FF         [ 2] 5006         ldaa    #0xFF
   AB3C B7 04 2C      [ 4] 5007         staa    (0x042C)
   AB3F BD AA E8      [ 6] 5008         jsr     LAAE8
   AB42 CE 04 59      [ 3] 5009         ldx     #0x0459
   AB45                    5010 LAB45:
   AB45 39            [ 5] 5011         rts
                           5012 
   AB46                    5013 LAB46:
   AB46 B6 02 99      [ 4] 5014         ldaa    (0x0299)
   AB49 A7 00         [ 4] 5015         staa    0,X     
   AB4B B6 02 9A      [ 4] 5016         ldaa    (0x029A)
   AB4E A7 01         [ 4] 5017         staa    1,X     
   AB50 B6 02 9B      [ 4] 5018         ldaa    (0x029B)
   AB53 A7 02         [ 4] 5019         staa    2,X     
   AB55 39            [ 5] 5020         rts
                           5021 
   AB56                    5022 LAB56:
   AB56 CE 04 2C      [ 3] 5023         ldx     #0x042C
   AB59                    5024 LAB59:
   AB59 B6 02 99      [ 4] 5025         ldaa    (0x0299)
   AB5C A1 00         [ 4] 5026         cmpa    0,X     
   AB5E 26 10         [ 3] 5027         bne     LAB70  
   AB60 B6 02 9A      [ 4] 5028         ldaa    (0x029A)
   AB63 A1 01         [ 4] 5029         cmpa    1,X     
   AB65 26 09         [ 3] 5030         bne     LAB70  
   AB67 B6 02 9B      [ 4] 5031         ldaa    (0x029B)
   AB6A A1 02         [ 4] 5032         cmpa    2,X     
   AB6C 26 02         [ 3] 5033         bne     LAB70  
   AB6E 20 0A         [ 3] 5034         bra     LAB7A  
   AB70                    5035 LAB70:
   AB70 08            [ 3] 5036         inx
   AB71 08            [ 3] 5037         inx
   AB72 08            [ 3] 5038         inx
   AB73 8C 04 5C      [ 4] 5039         cpx     #0x045C
   AB76 25 E1         [ 3] 5040         bcs     LAB59  
   AB78 0D            [ 2] 5041         sec
   AB79 39            [ 5] 5042         rts
                           5043 
   AB7A                    5044 LAB7A:
   AB7A 0C            [ 2] 5045         clc
   AB7B 39            [ 5] 5046         rts
                           5047 
                           5048 ;show re-valid tapes
   AB7C                    5049 LAB7C:
   AB7C CE 04 2C      [ 3] 5050         ldx     #0x042C
   AB7F                    5051 LAB7F:
   AB7F A6 00         [ 4] 5052         ldaa    0,X     
   AB81 81 30         [ 2] 5053         cmpa    #0x30
   AB83 25 1E         [ 3] 5054         bcs     LABA3  
   AB85 81 39         [ 2] 5055         cmpa    #0x39
   AB87 22 1A         [ 3] 5056         bhi     LABA3  
   AB89 BD F9 6F      [ 6] 5057         jsr     SERIALW      
   AB8C 08            [ 3] 5058         inx
   AB8D A6 00         [ 4] 5059         ldaa    0,X     
   AB8F BD F9 6F      [ 6] 5060         jsr     SERIALW      
   AB92 08            [ 3] 5061         inx
   AB93 A6 00         [ 4] 5062         ldaa    0,X     
   AB95 BD F9 6F      [ 6] 5063         jsr     SERIALW      
   AB98 08            [ 3] 5064         inx
   AB99 86 20         [ 2] 5065         ldaa    #0x20
   AB9B BD F9 6F      [ 6] 5066         jsr     SERIALW      
   AB9E 8C 04 5C      [ 4] 5067         cpx     #0x045C
   ABA1 25 DC         [ 3] 5068         bcs     LAB7F  
   ABA3                    5069 LABA3:
   ABA3 86 0D         [ 2] 5070         ldaa    #0x0D
   ABA5 BD F9 6F      [ 6] 5071         jsr     SERIALW      
   ABA8 86 0A         [ 2] 5072         ldaa    #0x0A
   ABAA BD F9 6F      [ 6] 5073         jsr     SERIALW      
   ABAD 39            [ 5] 5074         rts
                           5075 
   ABAE                    5076 LABAE:
   ABAE 7F 00 4A      [ 6] 5077         clr     (0x004A)
   ABB1 CC 00 64      [ 3] 5078         ldd     #0x0064
   ABB4 DD 23         [ 4] 5079         std     CDTIMR5
   ABB6                    5080 LABB6:
   ABB6 96 4A         [ 3] 5081         ldaa    (0x004A)
   ABB8 26 08         [ 3] 5082         bne     LABC2  
   ABBA BD 9B 19      [ 6] 5083         jsr     L9B19           ; do the random motions if enabled
   ABBD DC 23         [ 4] 5084         ldd     CDTIMR5
   ABBF 26 F5         [ 3] 5085         bne     LABB6  
   ABC1                    5086 LABC1:
   ABC1 39            [ 5] 5087         rts
                           5088 
   ABC2                    5089 LABC2:
   ABC2 81 31         [ 2] 5090         cmpa    #0x31
   ABC4 26 04         [ 3] 5091         bne     LABCA  
   ABC6 BD AB 17      [ 6] 5092         jsr     LAB17
   ABC9 39            [ 5] 5093         rts
                           5094 
   ABCA                    5095 LABCA:
   ABCA 20 F5         [ 3] 5096         bra     LABC1  
                           5097 
                           5098 ; TOC1 timer handler
                           5099 ;
                           5100 ; Timer is running at:
                           5101 ; EXTAL = 16Mhz
                           5102 ; E Clk = 4Mhz
                           5103 ; Timer Prescaler = /16 = 250Khz
                           5104 ; Timer Period = 4us
                           5105 ; T1OC is set to previous value +625
                           5106 ; So, this routine is called every 2.5ms
                           5107 ;
   ABCC                    5108 LABCC:
   ABCC DC 10         [ 4] 5109         ldd     T1NXT           ; get ready for next time
   ABCE C3 02 71      [ 4] 5110         addd    #0x0271         ; add 625
   ABD1 FD 10 16      [ 5] 5111         std     TOC1  
   ABD4 DD 10         [ 4] 5112         std     T1NXT
                           5113 
   ABD6 86 80         [ 2] 5114         ldaa    #0x80
   ABD8 B7 10 23      [ 4] 5115         staa    TFLG1           ; clear timer1 flag
                           5116 
                           5117 ; Some blinking SPECIAL button every half second,
                           5118 ; if 0x0078 is non zero
                           5119 
   ABDB 7D 00 78      [ 6] 5120         tst     (0x0078)        ; if 78 is zero, skip ahead
   ABDE 27 1C         [ 3] 5121         beq     LABFC           ; else do some blinking button lights
   ABE0 DC 25         [ 4] 5122         ldd     (0x0025)        ; else inc 25/26
   ABE2 C3 00 01      [ 4] 5123         addd    #0x0001
   ABE5 DD 25         [ 4] 5124         std     (0x0025)
   ABE7 1A 83 00 C8   [ 5] 5125         cpd     #0x00C8         ; is it 200?
   ABEB 26 0F         [ 3] 5126         bne     LABFC           ; no, keep going
   ABED 7F 00 25      [ 6] 5127         clr     (0x0025)        ; reset 25/26
   ABF0 7F 00 26      [ 6] 5128         clr     (0x0026)
   ABF3 D6 62         [ 3] 5129         ldab    (0x0062)        ; and toggle bit 3 of 62
   ABF5 C8 08         [ 2] 5130         eorb    #0x08
   ABF7 D7 62         [ 3] 5131         stab    (0x0062)
   ABF9 BD F9 C5      [ 6] 5132         jsr     BUTNLIT         ; and toggle the "special" button light
                           5133 
                           5134 ; 
   ABFC                    5135 LABFC:
   ABFC 7C 00 6F      [ 6] 5136         inc     (0x006F)        ; count every 2.5ms
   ABFF 96 6F         [ 3] 5137         ldaa    (0x006F)
   AC01 81 28         [ 2] 5138         cmpa    #0x28           ; is it 40 intervals? (0.1 sec?)
   AC03 25 42         [ 3] 5139         bcs     LAC47           ; if not yet, jump ahead
   AC05 7F 00 6F      [ 6] 5140         clr     (0x006F)        ; clear it 2.5ms counter
   AC08 7D 00 63      [ 6] 5141         tst     (0x0063)        ; decrement 0.1s counter here
   AC0B 27 03         [ 3] 5142         beq     LAC10           ; if it's not already zero
   AC0D 7A 00 63      [ 6] 5143         dec     (0x0063)
                           5144 
                           5145 ; staggered counters - here every 100ms
                           5146 
                           5147 ; 0x0070 counts from 250 to 1, period is 25 secs
   AC10                    5148 LAC10:
   AC10 96 70         [ 3] 5149         ldaa    OFFCNT1         ; decrement 0.1s counter here
   AC12 4A            [ 2] 5150         deca
   AC13 97 70         [ 3] 5151         staa    OFFCNT1
   AC15 26 04         [ 3] 5152         bne     LAC1B       
   AC17 86 FA         [ 2] 5153         ldaa    #0xFA           ; 250
   AC19 97 70         [ 3] 5154         staa    OFFCNT1
                           5155 
                           5156 ; 0x0071 counts from 230 to 1, period is 23 secs
   AC1B                    5157 LAC1B:
   AC1B 96 71         [ 3] 5158         ldaa    OFFCNT2
   AC1D 4A            [ 2] 5159         deca
   AC1E 97 71         [ 3] 5160         staa    OFFCNT2
   AC20 26 04         [ 3] 5161         bne     LAC26  
   AC22 86 E6         [ 2] 5162         ldaa    #0xE6           ; 230
   AC24 97 71         [ 3] 5163         staa    OFFCNT2
                           5164 
                           5165 ; 0x0072 counts from 210 to 1, period is 21 secs
   AC26                    5166 LAC26:
   AC26 96 72         [ 3] 5167         ldaa    OFFCNT3
   AC28 4A            [ 2] 5168         deca
   AC29 97 72         [ 3] 5169         staa    OFFCNT3
   AC2B 26 04         [ 3] 5170         bne     LAC31  
   AC2D 86 D2         [ 2] 5171         ldaa    #0xD2           ; 210
   AC2F 97 72         [ 3] 5172         staa    OFFCNT3
                           5173 
                           5174 ; 0x0073 counts from 190 to 1, period is 19 secs
   AC31                    5175 LAC31:
   AC31 96 73         [ 3] 5176         ldaa    OFFCNT4
   AC33 4A            [ 2] 5177         deca
   AC34 97 73         [ 3] 5178         staa    OFFCNT4
   AC36 26 04         [ 3] 5179         bne     LAC3C  
   AC38 86 BE         [ 2] 5180         ldaa    #0xBE           ; 190
   AC3A 97 73         [ 3] 5181         staa    OFFCNT4
                           5182 
                           5183 ; 0x0074 counts from 170 to 1, period is 17 secs
   AC3C                    5184 LAC3C:
   AC3C 96 74         [ 3] 5185         ldaa    OFFCNT5
   AC3E 4A            [ 2] 5186         deca
   AC3F 97 74         [ 3] 5187         staa    OFFCNT5
   AC41 26 04         [ 3] 5188         bne     LAC47  
   AC43 86 AA         [ 2] 5189         ldaa    #0xAA           ; 170
   AC45 97 74         [ 3] 5190         staa    OFFCNT5
                           5191 
                           5192 ; back to 2.5ms period here
                           5193 
   AC47                    5194 LAC47:
   AC47 96 27         [ 3] 5195         ldaa    T30MS
   AC49 4C            [ 2] 5196         inca
   AC4A 97 27         [ 3] 5197         staa    T30MS
   AC4C 81 0C         [ 2] 5198         cmpa    #0x0C           ; 12 = 30ms?
   AC4E 23 09         [ 3] 5199         bls     LAC59  
   AC50 7F 00 27      [ 6] 5200         clr     T30MS
                           5201 
                           5202 ; do these two tasks every 30ms
   AC53 BD 8E C6      [ 6] 5203         jsr     L8EC6           ; Scan SCD keys
   AC56 BD 8F 12      [ 6] 5204         jsr     L8F12           ; Scan Front Panel Switches
                           5205 
                           5206 ; back to every 2.5ms here
                           5207 ; LCD update???
                           5208 
   AC59                    5209 LAC59:
   AC59 96 43         [ 3] 5210         ldaa    (0x0043)
   AC5B 27 55         [ 3] 5211         beq     LACB2  
   AC5D DE 44         [ 4] 5212         ldx     (0x0044)
   AC5F A6 00         [ 4] 5213         ldaa    0,X     
   AC61 27 23         [ 3] 5214         beq     LAC86  
   AC63 B7 10 00      [ 4] 5215         staa    PORTA  
   AC66 B6 10 02      [ 4] 5216         ldaa    PORTG  
   AC69 84 F3         [ 2] 5217         anda    #0xF3
   AC6B B7 10 02      [ 4] 5218         staa    PORTG  
   AC6E 84 FD         [ 2] 5219         anda    #0xFD
   AC70 B7 10 02      [ 4] 5220         staa    PORTG  
   AC73 8A 02         [ 2] 5221         oraa    #0x02
   AC75 B7 10 02      [ 4] 5222         staa    PORTG  
   AC78 08            [ 3] 5223         inx
   AC79 08            [ 3] 5224         inx
   AC7A 8C 05 80      [ 4] 5225         cpx     #0x0580
   AC7D 25 03         [ 3] 5226         bcs     LAC82  
   AC7F CE 05 00      [ 3] 5227         ldx     #0x0500
   AC82                    5228 LAC82:
   AC82 DF 44         [ 4] 5229         stx     (0x0044)
   AC84 20 2C         [ 3] 5230         bra     LACB2  
   AC86                    5231 LAC86:
   AC86 A6 01         [ 4] 5232         ldaa    1,X     
   AC88 27 25         [ 3] 5233         beq     LACAF  
   AC8A B7 10 00      [ 4] 5234         staa    PORTA  
   AC8D B6 10 02      [ 4] 5235         ldaa    PORTG  
   AC90 84 FB         [ 2] 5236         anda    #0xFB
   AC92 8A 08         [ 2] 5237         oraa    #0x08
   AC94 B7 10 02      [ 4] 5238         staa    PORTG  
   AC97 84 FD         [ 2] 5239         anda    #0xFD
   AC99 B7 10 02      [ 4] 5240         staa    PORTG  
   AC9C 8A 02         [ 2] 5241         oraa    #0x02
   AC9E B7 10 02      [ 4] 5242         staa    PORTG  
   ACA1 08            [ 3] 5243         inx
   ACA2 08            [ 3] 5244         inx
   ACA3 8C 05 80      [ 4] 5245         cpx     #0x0580
   ACA6 25 03         [ 3] 5246         bcs     LACAB  
   ACA8 CE 05 00      [ 3] 5247         ldx     #0x0500
   ACAB                    5248 LACAB:
   ACAB DF 44         [ 4] 5249         stx     (0x0044)
   ACAD 20 03         [ 3] 5250         bra     LACB2  
   ACAF                    5251 LACAF:
   ACAF 7F 00 43      [ 6] 5252         clr     (0x0043)
                           5253 
                           5254 ; divide by 4
   ACB2                    5255 LACB2:
   ACB2 96 4F         [ 3] 5256         ldaa    (0x004F)
   ACB4 4C            [ 2] 5257         inca
   ACB5 97 4F         [ 3] 5258         staa    (0x004F)
   ACB7 81 04         [ 2] 5259         cmpa    #0x04
   ACB9 26 30         [ 3] 5260         bne     LACEB  
   ACBB 7F 00 4F      [ 6] 5261         clr     (0x004F)
                           5262 
                           5263 ; here every 10ms
                           5264 ; Five big countdown timers available here
                           5265 ; up to 655.35 seconds each
                           5266 
   ACBE DC 1B         [ 4] 5267         ldd     CDTIMR1         ; countdown 0x001B/1C every 10ms
   ACC0 27 05         [ 3] 5268         beq     LACC7           ; if not already 0
   ACC2 83 00 01      [ 4] 5269         subd    #0x0001
   ACC5 DD 1B         [ 4] 5270         std     CDTIMR1
                           5271 
   ACC7                    5272 LACC7:
   ACC7 DC 1D         [ 4] 5273         ldd     CDTIMR2         ; same with 0x001D/1E
   ACC9 27 05         [ 3] 5274         beq     LACD0  
   ACCB 83 00 01      [ 4] 5275         subd    #0x0001
   ACCE DD 1D         [ 4] 5276         std     CDTIMR2
                           5277 
   ACD0                    5278 LACD0:
   ACD0 DC 1F         [ 4] 5279         ldd     CDTIMR3         ; same with 0x001F/20
   ACD2 27 05         [ 3] 5280         beq     LACD9  
   ACD4 83 00 01      [ 4] 5281         subd    #0x0001
   ACD7 DD 1F         [ 4] 5282         std     CDTIMR3
                           5283 
   ACD9                    5284 LACD9:
   ACD9 DC 21         [ 4] 5285         ldd     CDTIMR4         ; same with 0x0021/22
   ACDB 27 05         [ 3] 5286         beq     LACE2  
   ACDD 83 00 01      [ 4] 5287         subd    #0x0001
   ACE0 DD 21         [ 4] 5288         std     CDTIMR4
                           5289 
   ACE2                    5290 LACE2:
   ACE2 DC 23         [ 4] 5291         ldd     CDTIMR5         ; same with 0x0023/24
   ACE4 27 05         [ 3] 5292         beq     LACEB  
   ACE6 83 00 01      [ 4] 5293         subd    #0x0001
   ACE9 DD 23         [ 4] 5294         std     CDTIMR5
                           5295 
                           5296 ; every other time through this, setup a task switch?
   ACEB                    5297 LACEB:
   ACEB 96 B0         [ 3] 5298         ldaa    (TSCNT)
   ACED 88 01         [ 2] 5299         eora    #0x01
   ACEF 97 B0         [ 3] 5300         staa    (TSCNT)
   ACF1 27 18         [ 3] 5301         beq     LAD0B  
                           5302 
   ACF3 BF 01 3C      [ 5] 5303         sts     (0x013C)        ; switch stacks???
   ACF6 BE 01 3E      [ 5] 5304         lds     (0x013E)
   ACF9 DC 10         [ 4] 5305         ldd     T1NXT
   ACFB 83 01 F4      [ 4] 5306         subd    #0x01F4         ; 625-500 = 125?
   ACFE FD 10 18      [ 5] 5307         std     TOC2            ; set this TOC2 to happen 0.5ms
   AD01 86 40         [ 2] 5308         ldaa    #0x40           ; after the current TOC1 but before the next TOC1
   AD03 B7 10 23      [ 4] 5309         staa    TFLG1           ; clear timer2 irq flag, just in case?
   AD06 86 C0         [ 2] 5310         ldaa    #0xC0           ;
   AD08 B7 10 22      [ 4] 5311         staa    TMSK1           ; enable TOC1 and TOC2
   AD0B                    5312 LAD0B:
   AD0B 3B            [12] 5313         rti
                           5314 
                           5315 ; TOC2 Timer handler and SWI handler
   AD0C                    5316 LAD0C:
   AD0C 86 40         [ 2] 5317         ldaa    #0x40
   AD0E B7 10 23      [ 4] 5318         staa    TFLG1           ; clear timer2 flag
   AD11 BF 01 3E      [ 5] 5319         sts     (0x013E)        ; switch stacks back???
   AD14 BE 01 3C      [ 5] 5320         lds     (0x013C)
   AD17 86 80         [ 2] 5321         ldaa    #0x80
   AD19 B7 10 22      [ 4] 5322         staa    TMSK1           ; enable TOC1 only
   AD1C 3B            [12] 5323         rti
                           5324 
                           5325 ; Secondary task??
                           5326 
   AD1D                    5327 TASK2:
   AD1D 7D 04 2A      [ 6] 5328         tst     (0x042A)
   AD20 27 35         [ 3] 5329         beq     LAD57
   AD22 96 B6         [ 3] 5330         ldaa    (0x00B6)
   AD24 26 03         [ 3] 5331         bne     LAD29
   AD26 3F            [14] 5332         swi
   AD27 20 F4         [ 3] 5333         bra     TASK2
   AD29                    5334 LAD29:
   AD29 7F 00 B6      [ 6] 5335         clr     (0x00B6)
   AD2C C6 04         [ 2] 5336         ldab    #0x04
   AD2E                    5337 LAD2E:
   AD2E 37            [ 3] 5338         pshb
   AD2F CE AD 3C      [ 3] 5339         ldx     #LAD3C
   AD32 BD 8A 1A      [ 6] 5340         jsr     L8A1A  
   AD35 3F            [14] 5341         swi
   AD36 33            [ 4] 5342         pulb
   AD37 5A            [ 2] 5343         decb
   AD38 26 F4         [ 3] 5344         bne     LAD2E  
   AD3A 20 E1         [ 3] 5345         bra     TASK2
                           5346 
   AD3C                    5347 LAD3C:
   AD3C 53 31 00           5348         .asciz     'S1'
                           5349 
   AD3F FC 02 9C      [ 5] 5350         ldd     (0x029C)
   AD42 1A 83 00 01   [ 5] 5351         cpd     #0x0001         ; 1
   AD46 27 0C         [ 3] 5352         beq     LAD54  
   AD48 1A 83 03 E8   [ 5] 5353         cpd     #0x03E8         ; 1000
   AD4C 2D 09         [ 3] 5354         blt     LAD57  
   AD4E 1A 83 04 4B   [ 5] 5355         cpd     #0x044B         ; 1099
   AD52 22 03         [ 3] 5356         bhi     LAD57  
   AD54                    5357 LAD54:
   AD54 3F            [14] 5358         swi
   AD55 20 C6         [ 3] 5359         bra     TASK2
   AD57                    5360 LAD57:
   AD57 7F 00 B3      [ 6] 5361         clr     (0x00B3)
   AD5A BD AD 7E      [ 6] 5362         jsr     LAD7E
   AD5D BD AD A0      [ 6] 5363         jsr     LADA0
   AD60 25 BB         [ 3] 5364         bcs     TASK2
   AD62 C6 0A         [ 2] 5365         ldab    #0x0A
   AD64 BD AE 13      [ 6] 5366         jsr     LAE13
   AD67 BD AD AE      [ 6] 5367         jsr     LADAE
   AD6A 25 B1         [ 3] 5368         bcs     TASK2
   AD6C C6 14         [ 2] 5369         ldab    #0x14
   AD6E BD AE 13      [ 6] 5370         jsr     LAE13
   AD71 BD AD B6      [ 6] 5371         jsr     LADB6
   AD74 25 A7         [ 3] 5372         bcs     TASK2
   AD76                    5373 LAD76:
   AD76 BD AD B8      [ 6] 5374         jsr     LADB8
   AD79 0D            [ 2] 5375         sec
   AD7A 25 A1         [ 3] 5376         bcs     TASK2
   AD7C 20 F8         [ 3] 5377         bra     LAD76
   AD7E                    5378 LAD7E:
   AD7E CE AE 1E      [ 3] 5379         ldx     #LAE1E          ;+++
   AD81 BD 8A 1A      [ 6] 5380         jsr     L8A1A  
   AD84 C6 1E         [ 2] 5381         ldab    #0x1E
   AD86 BD AE 13      [ 6] 5382         jsr     LAE13
   AD89 CE AE 22      [ 3] 5383         ldx     #LAE22          ;ATH
   AD8C BD 8A 1A      [ 6] 5384         jsr     L8A1A  
   AD8F C6 1E         [ 2] 5385         ldab    #0x1E
   AD91 BD AE 13      [ 6] 5386         jsr     LAE13
   AD94 CE AE 27      [ 3] 5387         ldx     #LAE27          ;ATZ
   AD97 BD 8A 1A      [ 6] 5388         jsr     L8A1A  
   AD9A C6 1E         [ 2] 5389         ldab    #0x1E
   AD9C BD AE 13      [ 6] 5390         jsr     LAE13
   AD9F 39            [ 5] 5391         rts
   ADA0                    5392 LADA0:
   ADA0 BD B1 DD      [ 6] 5393         jsr     LB1DD
   ADA3 25 FB         [ 3] 5394         bcs     LADA0  
   ADA5 BD B2 4F      [ 6] 5395         jsr     LB24F
                           5396 
   ADA8 52 49 4E 47 00     5397         .asciz  'RING'
                           5398 
   ADAD 39            [ 5] 5399         rts
                           5400 
   ADAE                    5401 LADAE:
   ADAE CE AE 2C      [ 3] 5402         ldx     #LAE2C
   ADB1 BD 8A 1A      [ 6] 5403         jsr     L8A1A           ;ATA
   ADB4 0C            [ 2] 5404         clc
   ADB5 39            [ 5] 5405         rts
   ADB6                    5406 LADB6:
   ADB6 0C            [ 2] 5407         clc
   ADB7 39            [ 5] 5408         rts
                           5409 
   ADB8                    5410 LADB8:
   ADB8 BD B1 D2      [ 6] 5411         jsr     LB1D2
   ADBB BD AE 31      [ 6] 5412         jsr     LAE31
   ADBE 86 01         [ 2] 5413         ldaa    #0x01
   ADC0 97 B3         [ 3] 5414         staa    (0x00B3)
   ADC2 BD B1 DD      [ 6] 5415         jsr     LB1DD
   ADC5 BD B2 71      [ 6] 5416         jsr     LB271
   ADC8 36            [ 3] 5417         psha
   ADC9 BD B2 C0      [ 6] 5418         jsr     LB2C0
   ADCC 32            [ 4] 5419         pula
   ADCD 81 01         [ 2] 5420         cmpa    #0x01
   ADCF 26 08         [ 3] 5421         bne     LADD9  
   ADD1 CE B2 95      [ 3] 5422         ldx     #LB295
   ADD4 BD 8A 1A      [ 6] 5423         jsr     L8A1A           ;'You have selected #1'
   ADD7 20 31         [ 3] 5424         bra     LAE0A  
   ADD9                    5425 LADD9:
   ADD9 81 02         [ 2] 5426         cmpa    #0x02
   ADDB 26 00         [ 3] 5427         bne     LADDD  
   ADDD                    5428 LADDD:
   ADDD 81 03         [ 2] 5429         cmpa    #0x03
   ADDF 26 00         [ 3] 5430         bne     LADE1  
   ADE1                    5431 LADE1:
   ADE1 81 04         [ 2] 5432         cmpa    #0x04
   ADE3 26 00         [ 3] 5433         bne     LADE5  
   ADE5                    5434 LADE5:
   ADE5 81 05         [ 2] 5435         cmpa    #0x05
   ADE7 26 00         [ 3] 5436         bne     LADE9  
   ADE9                    5437 LADE9:
   ADE9 81 06         [ 2] 5438         cmpa    #0x06
   ADEB 26 00         [ 3] 5439         bne     LADED  
   ADED                    5440 LADED:
   ADED 81 07         [ 2] 5441         cmpa    #0x07
   ADEF 26 00         [ 3] 5442         bne     LADF1  
   ADF1                    5443 LADF1:
   ADF1 81 08         [ 2] 5444         cmpa    #0x08
   ADF3 26 00         [ 3] 5445         bne     LADF5  
   ADF5                    5446 LADF5:
   ADF5 81 09         [ 2] 5447         cmpa    #0x09
   ADF7 26 00         [ 3] 5448         bne     LADF9  
   ADF9                    5449 LADF9:
   ADF9 81 0A         [ 2] 5450         cmpa    #0x0A
   ADFB 26 00         [ 3] 5451         bne     LADFD  
   ADFD                    5452 LADFD:
   ADFD 81 0B         [ 2] 5453         cmpa    #0x0B
   ADFF 26 09         [ 3] 5454         bne     LAE0A  
   AE01 CE B2 AA      [ 3] 5455         ldx     #LB2AA          ;'You have selected #11'
   AE04 BD 8A 1A      [ 6] 5456         jsr     L8A1A  
   AE07 7E AE 0A      [ 3] 5457         jmp     LAE0A
   AE0A                    5458 LAE0A:
   AE0A C6 14         [ 2] 5459         ldab    #0x14
   AE0C BD AE 13      [ 6] 5460         jsr     LAE13
   AE0F 7F 00 B3      [ 6] 5461         clr     (0x00B3)
   AE12 39            [ 5] 5462         rts
                           5463 
   AE13                    5464 LAE13:
   AE13 CE 00 20      [ 3] 5465         ldx     #0x0020
   AE16                    5466 LAE16:
   AE16 3F            [14] 5467         swi
   AE17 09            [ 3] 5468         dex
   AE18 26 FC         [ 3] 5469         bne     LAE16  
   AE1A 5A            [ 2] 5470         decb
   AE1B 26 F6         [ 3] 5471         bne     LAE13  
   AE1D 39            [ 5] 5472         rts
                           5473 
                           5474 ; text??
   AE1E                    5475 LAE1E:
   AE1E 2B 2B 2B 00        5476         .asciz      '+++'
   AE22                    5477 LAE22:
   AE22 41 54 48 0D 00     5478         .asciz      'ATH\r'
   AE27                    5479 LAE27:
   AE27 41 54 5A 0D 00     5480         .asciz      'ATZ\r'
   AE2C                    5481 LAE2C:
   AE2C 41 54 41 0D 00     5482         .asciz      'ATA\r'
                           5483 
   AE31                    5484 LAE31:
   AE31 CE AE 38      [ 3] 5485         ldx     #LAE38          ; big long string of stats, with compressed ansi codes
   AE34 BD 8A 1A      [ 6] 5486         jsr     L8A1A  
   AE37 39            [ 5] 5487         rts
                           5488 
   AE38                    5489 LAE38:
   AE38 5E 30 31 30 31 53  5490         .ascii  "^0101Serial #:^0140#0000^0111~4"
        65 72 69 61 6C 20
        23 3A 5E 30 31 34
        30 23 30 30 30 30
        5E 30 31 31 31 7E
        34
   AE57 0E 20              5491         .byte   0x0E,0x20
   AE59 5E 30 31 34 31 7C  5492         .ascii  "^0141|"
   AE5F 04 28              5493         .byte   0x04,0x28
   AE61 5E 30 33 30 31 43  5494         .ascii  "^0301CURRENT^0340HISTORY^0501Show Status:^0540Total # reg. shows:^0601Random Status:^0570|"
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
   AEBB 04 10              5495         .byte   0x04,0x10
   AEBD 5E 30 36 34 30 54  5496         .ascii  "^0640Total # live shows:^0701Current Reg Tape #:^0670|"
        6F 74 61 6C 20 23
        20 6C 69 76 65 20
        73 68 6F 77 73 3A
        5E 30 37 30 31 43
        75 72 72 65 6E 74
        20 52 65 67 20 54
        61 70 65 20 23 3A
        5E 30 36 37 30 7C
   AEF3 04 12              5497         .byte   0x04,0x12
   AEF5 5E 30 37 33 30 7E  5498         .ascii  "^0730~3"
        33
   AEFC 04 02              5499         .byte   0x04,0x02
   AEFE 5E 30 37 34 30 54  5500         .ascii  "^0740Total # failed pswd attempts:^0801Current Live Tape #:^0770|"
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
   AF3F 04 14              5501         .byte   0x04,0x14
   AF41 5E 30 38 33 30 7E  5502         .ascii  "^0830~3"
        33
   AF48 04 05              5503         .byte   0x04,0x05
   AF4A 5E 30 38 34 30 54  5504         .ascii  "^0840Total # successful pswd:^0901Current Version #:^0870|"
        6F 74 61 6C 20 23
        20 73 75 63 63 65
        73 73 66 75 6C 20
        70 73 77 64 3A 5E
        30 39 30 31 43 75
        72 72 65 6E 74 20
        56 65 72 73 69 6F
        6E 20 23 3A 5E 30
        38 37 30 7C
   AF84 04 16              5505         .byte   0x04,0x16
   AF86 5E 30 39 33 30 40  5506         .ascii  "^0930@"
   AF8C 04 00              5507         .byte   0x04,0x00
   AF8E 5E 30 39 34 30 54  5508         .ascii  "^0940Total # bdays played:^1040Total # VCR adjusts:^0970|"
        6F 74 61 6C 20 23
        20 62 64 61 79 73
        20 70 6C 61 79 65
        64 3A 5E 31 30 34
        30 54 6F 74 61 6C
        20 23 20 56 43 52
        20 61 64 6A 75 73
        74 73 3A 5E 30 39
        37 30 7C
   AFC7 04 18              5509         .byte   0x04,0x18
   AFC9 5E 31 30 37 30 7C  5510         .ascii  "^1070|"
   AFCF 04 1A              5511         .byte   0x04,0x1A
   AFD1 5E 31 31 34 30 54  5512         .ascii  "^1140Total # remote accesses:^1240Total # access attempts:^1170|"
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
   B011 04 1C              5513         .byte   0x04,0x1C
   B013 5E 31 32 37 30 7C  5514         .ascii  "^1270|"
   B019 04 1E              5515         .byte   0x04,0x1E
   B01B 5E 31 33 34 30 54  5516         .ascii  "^1340Total # rejected showtapes:^1440Total # Short bdays:^1370|"
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
   B05A 04 20              5517         .byte   0x04,0x20
   B05C 5E 31 34 37 30 7C  5518         .ascii  "^1470|"
   B062 04 22              5519         .byte   0x04,0x22
   B064 5E 31 35 34 30 54  5520         .ascii  "^1540Total # Reg bdays:^1640Total # resets-pwr ups:^1570|"
        6F 74 61 6C 20 23
        20 52 65 67 20 62
        64 61 79 73 3A 5E
        31 36 34 30 54 6F
        74 61 6C 20 23 20
        72 65 73 65 74 73
        2D 70 77 72 20 75
        70 73 3A 5E 31 35
        37 30 7C
   B09D 04 24              5521         .byte   0x04,0x24
   B09F 5E 31 36 37 30 7C  5522         .ascii  "^1670|"
   B0A5 04 26              5523         .byte   0x04,0x26
   B0A7 5E 31 38 30 31 46  5524         .ascii  "^1801FUNCTIONS^1823Select Function:^20011.Clear rnd enables^2028 6.Set loc name-#^205411.Diagnostics^21012.Set rnd enables^2128 7.Set Time^215412.^22013.Set reg tape #^2228 8.Disbl-enbl show^225413.^23014.Set liv tape #^2328 9.Upload program^235414.^24015.Reset history^242810.Debugger^245415.^1840"
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
   B1D1 00                 5525         .byte   0x00
                           5526 
   B1D2                    5527 LB1D2:
   B1D2 CE B1 D8      [ 3] 5528         ldx     #LB1D8          ; escape sequence?
   B1D5 7E 8A 1A      [ 3] 5529         jmp     L8A1A  
                           5530 
                           5531 ; ANSI control sequence - Clear Screen and Home Cursor
   B1D8                    5532 LB1D8:
                           5533         ; esc[2J
   B1D8 1B                 5534         .byte   0x1b
   B1D9 5B 32 4A 00        5535         .asciz  '[2J'
                           5536 
   B1DD                    5537 LB1DD:
   B1DD CE 05 A0      [ 3] 5538         ldx     #0x05A0
   B1E0 CC 00 00      [ 3] 5539         ldd     #0x0000
   B1E3 FD 02 9E      [ 5] 5540         std     (0x029E)
   B1E6                    5541 LB1E6:
   B1E6 FC 02 9E      [ 5] 5542         ldd     (0x029E)
   B1E9 C3 00 01      [ 4] 5543         addd    #0x0001
   B1EC FD 02 9E      [ 5] 5544         std     (0x029E)
   B1EF 1A 83 0F A0   [ 5] 5545         cpd     #0x0FA0
   B1F3 24 28         [ 3] 5546         bcc     LB21D  
   B1F5 BD B2 23      [ 6] 5547         jsr     LB223
   B1F8 25 04         [ 3] 5548         bcs     LB1FE  
   B1FA 3F            [14] 5549         swi
   B1FB 20 E9         [ 3] 5550         bra     LB1E6  
   B1FD 39            [ 5] 5551         rts
                           5552 
   B1FE                    5553 LB1FE:
   B1FE A7 00         [ 4] 5554         staa    0,X     
   B200 08            [ 3] 5555         inx
   B201 81 0D         [ 2] 5556         cmpa    #0x0D
   B203 26 02         [ 3] 5557         bne     LB207  
   B205 20 18         [ 3] 5558         bra     LB21F  
   B207                    5559 LB207:
   B207 81 1B         [ 2] 5560         cmpa    #0x1B
   B209 26 02         [ 3] 5561         bne     LB20D  
   B20B 20 10         [ 3] 5562         bra     LB21D  
   B20D                    5563 LB20D:
   B20D 7D 00 B3      [ 6] 5564         tst     (0x00B3)
   B210 27 03         [ 3] 5565         beq     LB215  
   B212 BD 8B 3B      [ 6] 5566         jsr     L8B3B
   B215                    5567 LB215:
   B215 CC 00 00      [ 3] 5568         ldd     #0x0000
   B218 FD 02 9E      [ 5] 5569         std     (0x029E)
   B21B 20 C9         [ 3] 5570         bra     LB1E6  
   B21D                    5571 LB21D:
   B21D 0D            [ 2] 5572         sec
   B21E 39            [ 5] 5573         rts
                           5574 
   B21F                    5575 LB21F:
   B21F 6F 00         [ 6] 5576         clr     0,X     
   B221 0C            [ 2] 5577         clc
   B222 39            [ 5] 5578         rts
                           5579 
   B223                    5580 LB223:
   B223 B6 18 0D      [ 4] 5581         ldaa    SCCCTRLA
   B226 44            [ 2] 5582         lsra
   B227 25 0B         [ 3] 5583         bcs     LB234  
   B229 4F            [ 2] 5584         clra
   B22A B7 18 0D      [ 4] 5585         staa    SCCCTRLA
   B22D 86 30         [ 2] 5586         ldaa    #0x30
   B22F B7 18 0D      [ 4] 5587         staa    SCCCTRLA
   B232 0C            [ 2] 5588         clc
   B233 39            [ 5] 5589         rts
                           5590 
   B234                    5591 LB234:
   B234 86 01         [ 2] 5592         ldaa    #0x01
   B236 B7 18 0D      [ 4] 5593         staa    SCCCTRLA
   B239 86 70         [ 2] 5594         ldaa    #0x70
   B23B B5 18 0D      [ 4] 5595         bita    SCCCTRLA
   B23E 26 05         [ 3] 5596         bne     LB245  
   B240 0D            [ 2] 5597         sec
   B241 B6 18 0F      [ 4] 5598         ldaa    SCCDATAA
   B244 39            [ 5] 5599         rts
                           5600 
   B245                    5601 LB245:
   B245 B6 18 0F      [ 4] 5602         ldaa    SCCDATAA
   B248 86 30         [ 2] 5603         ldaa    #0x30
   B24A B7 18 0C      [ 4] 5604         staa    SCCCTRLB
   B24D 0C            [ 2] 5605         clc
   B24E 39            [ 5] 5606         rts
                           5607 
   B24F                    5608 LB24F:
   B24F 38            [ 5] 5609         pulx
   B250 18 CE 05 A0   [ 4] 5610         ldy     #0x05A0
   B254                    5611 LB254:
   B254 A6 00         [ 4] 5612         ldaa    0,X
   B256 27 11         [ 3] 5613         beq     LB269
   B258 08            [ 3] 5614         inx
   B259 18 A1 00      [ 5] 5615         cmpa    0,Y
   B25C 26 04         [ 3] 5616         bne     LB262
   B25E 18 08         [ 4] 5617         iny
   B260 20 F2         [ 3] 5618         bra     LB254
   B262                    5619 LB262:
   B262 A6 00         [ 4] 5620         ldaa    0,X
   B264 27 07         [ 3] 5621         beq     LB26D
   B266 08            [ 3] 5622         inx
   B267 20 F9         [ 3] 5623         bra     LB262
   B269                    5624 LB269:
   B269 08            [ 3] 5625         inx
   B26A 3C            [ 4] 5626         pshx
   B26B 0C            [ 2] 5627         clc
   B26C 39            [ 5] 5628         rts
   B26D                    5629 LB26D:
   B26D 08            [ 3] 5630         inx
   B26E 3C            [ 4] 5631         pshx
   B26F 0D            [ 2] 5632         sec
   B270 39            [ 5] 5633         rts
                           5634 
   B271                    5635 LB271:
   B271 CE 05 A0      [ 3] 5636         ldx     #0x05A0
   B274                    5637 LB274:
   B274 A6 00         [ 4] 5638         ldaa    0,X
   B276 08            [ 3] 5639         inx
   B277 81 0D         [ 2] 5640         cmpa    #0x0D
   B279 26 F9         [ 3] 5641         bne     LB274
   B27B 09            [ 3] 5642         dex
   B27C 09            [ 3] 5643         dex
   B27D A6 00         [ 4] 5644         ldaa    0,X
   B27F 09            [ 3] 5645         dex
   B280 80 30         [ 2] 5646         suba    #0x30
   B282 97 B2         [ 3] 5647         staa    (0x00B2)
   B284 8C 05 9F      [ 4] 5648         cpx     #0x059F
   B287 27 0B         [ 3] 5649         beq     LB294
   B289 A6 00         [ 4] 5650         ldaa    0,X
   B28B 09            [ 3] 5651         dex
   B28C 80 30         [ 2] 5652         suba    #0x30
   B28E C6 0A         [ 2] 5653         ldab    #0x0A
   B290 3D            [10] 5654         mul
   B291 17            [ 2] 5655         tba
   B292 9B B2         [ 3] 5656         adda    (0x00B2)
   B294                    5657 LB294:
   B294 39            [ 5] 5658         rts
                           5659 
   B295                    5660 LB295:
   B295 59 6F 75 20 68 61  5661         .asciz  'You have selected #1'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 00
   B2AA                    5662 LB2AA:
   B2AA 59 6F 75 20 68 61  5663         .asciz  'You have selected #11'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 31 00
                           5664 
   B2C0                    5665 LB2C0:
   B2C0 CE B2 C7      [ 3] 5666         ldx     #LB2C7          ; Table with compressed ANSI cursor controls
   B2C3 BD 8A 1A      [ 6] 5667         jsr     L8A1A  
   B2C6 39            [ 5] 5668         rts
                           5669 
   B2C7                    5670 LB2C7:
   B2C7 5E 32 30 30 31 25  5671         .asciz  "^2001%^2101%^2201%^2301%^2401%^2001"
        5E 32 31 30 31 25
        5E 32 32 30 31 25
        5E 32 33 30 31 25
        5E 32 34 30 31 25
        5E 32 30 30 31 00
                           5672 
                           5673 ; Random movement tables
                           5674 
                           5675 ; board 1
   B2EB                    5676 LB2EB:
   B2EB FA 20 FA 20 F6 22  5677         .byte   0xfa,0x20,0xfa,0x20,0xf6,0x22,0xf5,0x20
        F5 20
   B2F3 F5 20 F3 22 F2 20  5678         .byte   0xf5,0x20,0xf3,0x22,0xf2,0x20,0xe5,0x22
        E5 22
   B2FB E5 22 E2 20 D2 20  5679         .byte   0xe5,0x22,0xe2,0x20,0xd2,0x20,0xbe,0x00
        BE 00
   B303 BC 22 BB 30 B9 32  5680         .byte   0xbc,0x22,0xbb,0x30,0xb9,0x32,0xb9,0x32
        B9 32
   B30B B7 30 B6 32 B5 30  5681         .byte   0xb7,0x30,0xb6,0x32,0xb5,0x30,0xb4,0x32
        B4 32
   B313 B4 32 B3 20 B3 20  5682         .byte   0xb4,0x32,0xb3,0x20,0xb3,0x20,0xb1,0xa0
        B1 A0
   B31B B1 A0 B0 A2 AF A0  5683         .byte   0xb1,0xa0,0xb0,0xa2,0xaf,0xa0,0xaf,0xa6
        AF A6
   B323 AE A0 AE A6 AD A4  5684         .byte   0xae,0xa0,0xae,0xa6,0xad,0xa4,0xac,0xa0
        AC A0
   B32B AC A0 AB A0 AA A0  5685         .byte   0xac,0xa0,0xab,0xa0,0xaa,0xa0,0xaa,0xa0
        AA A0
   B333 A2 80 A0 A0 A0 A0  5686         .byte   0xa2,0x80,0xa0,0xa0,0xa0,0xa0,0x8d,0x80
        8D 80
   B33B 8A A0 7E 80 7B A0  5687         .byte   0x8a,0xa0,0x7e,0x80,0x7b,0xa0,0x79,0xa4
        79 A4
   B343 78 A0 77 A4 76 A0  5688         .byte   0x78,0xa0,0x77,0xa4,0x76,0xa0,0x75,0xa4
        75 A4
   B34B 74 A0 73 A4 72 A0  5689         .byte   0x74,0xa0,0x73,0xa4,0x72,0xa0,0x71,0xa4
        71 A4
   B353 70 A0 6F A4 6E A0  5690         .byte   0x70,0xa0,0x6f,0xa4,0x6e,0xa0,0x6d,0xa4
        6D A4
   B35B 6C A0 69 80 69 80  5691         .byte   0x6c,0xa0,0x69,0x80,0x69,0x80,0x67,0xa0
        67 A0
   B363 5E 20 58 24 57 20  5692         .byte   0x5e,0x20,0x58,0x24,0x57,0x20,0x57,0x20
        57 20
   B36B 56 24 55 20 54 24  5693         .byte   0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24
        54 24
   B373 53 20 52 24 52 24  5694         .byte   0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20
        50 20
   B37B 4F 24 4E 20 4D 24  5695         .byte   0x4f,0x24,0x4e,0x20,0x4d,0x24,0x4c,0x20
        4C 20
   B383 4C 20 4B 24 4A 20  5696         .byte   0x4c,0x20,0x4b,0x24,0x4a,0x20,0x49,0x20
        49 20
   B38B 49 00 48 20 47 20  5697         .byte   0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20
        47 20
   B393 46 20 45 24 45 24  5698         .byte   0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20
        44 20
   B39B 42 20 42 20 37 04  5699         .byte   0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20
        35 20
   B3A3 2E 04 2E 04 2D 20  5700         .byte   0x2e,0x04,0x2e,0x04,0x2d,0x20,0x23,0x24
        23 24
   B3AB 21 20 17 24 13 00  5701         .byte   0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24
        11 24
   B3B3 10 30 07 34 06 30  5702         .byte   0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30
        05 30
   B3BB FF FF              5703         .byte   0xff,0xff
                           5704 
                           5705 ; board 2
   B3BD                    5706 LB3BD:
   B3BD D7 22 D5 20 C9 22  5707         .byte   0xd7,0x22,0xd5,0x20,0xc9,0x22,0xc7,0x20
        C7 20
   B3C5 C4 24 C3 20 C2 24  5708         .byte   0xc4,0x24,0xc3,0x20,0xc2,0x24,0xc1,0x20
        C1 20
   B3CD BF 24 BF 24 BE 20  5709         .byte   0xbf,0x24,0xbf,0x24,0xbe,0x20,0xbd,0x24
        BD 24
   B3D5 BC 20 BB 24 BA 20  5710         .byte   0xbc,0x20,0xbb,0x24,0xba,0x20,0xb9,0x20
        B9 20
   B3DD B8 24 B7 20 B4 00  5711         .byte   0xb8,0x24,0xb7,0x20,0xb4,0x00,0xb4,0x00
        B4 00
   B3E5 B2 20 A9 20 A3 20  5712         .byte   0xb2,0x20,0xa9,0x20,0xa3,0x20,0xa2,0x20
        A2 20
   B3ED A1 20 A0 20 A0 20  5713         .byte   0xa1,0x20,0xa0,0x20,0xa0,0x20,0x9f,0x20
        9F 20
   B3F5 9F 20 9E 20 9D 24  5714         .byte   0x9f,0x20,0x9e,0x20,0x9d,0x24,0x9d,0x24
        9D 24
   B3FD 9B 20 9A 24 99 20  5715         .byte   0x9b,0x20,0x9a,0x24,0x99,0x20,0x98,0x20
        98 20
   B405 97 24 97 24 95 20  5716         .byte   0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20
        95 20
   B40D 94 00 94 00 93 20  5717         .byte   0x94,0x00,0x94,0x00,0x93,0x20,0x92,0x00
        92 00
   B415 92 00 91 20 90 20  5718         .byte   0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20
        90 20
   B41D 8F 20 8D 20 8D 20  5719         .byte   0x8f,0x20,0x8d,0x20,0x8d,0x20,0x81,0x00
        81 00
   B425 7F 20 79 00 79 00  5720         .byte   0x7f,0x20,0x79,0x00,0x79,0x00,0x78,0x20
        78 20
   B42D 76 20 6B 00 69 20  5721         .byte   0x76,0x20,0x6b,0x00,0x69,0x20,0x5e,0x00
        5E 00
   B435 5C 20 5B 30 52 10  5722         .byte   0x5c,0x20,0x5b,0x30,0x52,0x10,0x51,0x30
        51 30
   B43D 50 30 50 30 4F 20  5723         .byte   0x50,0x30,0x50,0x30,0x4f,0x20,0x4e,0x20
        4E 20
   B445 4E 20 4D 20 46 A0  5724         .byte   0x4e,0x20,0x4d,0x20,0x46,0xa0,0x45,0xa0
        45 A0
   B44D 3D A0 3D A0 39 20  5725         .byte   0x3d,0xa0,0x3d,0xa0,0x39,0x20,0x2a,0x00
        2A 00
   B455 28 20 1E 00 1C 22  5726         .byte   0x28,0x20,0x1e,0x00,0x1c,0x22,0x1c,0x22
        1C 22
   B45D 1B 20 1A 22 19 20  5727         .byte   0x1b,0x20,0x1a,0x22,0x19,0x20,0x18,0x22
        18 22
   B465 18 22 16 20 15 22  5728         .byte   0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22
        15 22
   B46D 14 A0 13 A2 11 A0  5729         .byte   0x14,0xa0,0x13,0xa2,0x11,0xa0,0xff,0xff
        FF FF
                           5730 
                           5731 ; board 4
   B475                    5732 LB475:
   B475 BE 00 BC 22 BB 30  5733         .byte   0xbe,0x00,0xbc,0x22,0xbb,0x30,0xb9,0x32
        B9 32
   B47D B9 32 B7 30 B6 32  5734         .byte   0xb9,0x32,0xb7,0x30,0xb6,0x32,0xb5,0x30
        B5 30
   B485 B4 32 B4 32 B3 20  5735         .byte   0xb4,0x32,0xb4,0x32,0xb3,0x20,0xb3,0x20
        B3 20
   B48D B1 A0 B1 A0 B0 A2  5736         .byte   0xb1,0xa0,0xb1,0xa0,0xb0,0xa2,0xaf,0xa0
        AF A0
   B495 AF A6 AE A0 AE A6  5737         .byte   0xaf,0xa6,0xae,0xa0,0xae,0xa6,0xad,0xa4
        AD A4
   B49D AC A0 AC A0 AB A0  5738         .byte   0xac,0xa0,0xac,0xa0,0xab,0xa0,0xaa,0xa0
        AA A0
   B4A5 AA A0 A2 80 A0 A0  5739         .byte   0xaa,0xa0,0xa2,0x80,0xa0,0xa0,0xa0,0xa0
        A0 A0
   B4AD 8D 80 8A A0 7E 80  5740         .byte   0x8d,0x80,0x8a,0xa0,0x7e,0x80,0x7b,0xa0
        7B A0
   B4B5 79 A4 78 A0 77 A4  5741         .byte   0x79,0xa4,0x78,0xa0,0x77,0xa4,0x76,0xa0
        76 A0
   B4BD 75 A4 74 A0 73 A4  5742         .byte   0x75,0xa4,0x74,0xa0,0x73,0xa4,0x72,0xa0
        72 A0
   B4C5 71 A4 70 A0 6F A4  5743         .byte   0x71,0xa4,0x70,0xa0,0x6f,0xa4,0x6e,0xa0
        6E A0
   B4CD 6D A4 6C A0 69 80  5744         .byte   0x6d,0xa4,0x6c,0xa0,0x69,0x80,0x69,0x80
        69 80
   B4D5 67 A0 5E 20 58 24  5745         .byte   0x67,0xa0,0x5e,0x20,0x58,0x24,0x57,0x20
        57 20
   B4DD 57 20 56 24 55 20  5746         .byte   0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24
        54 24
   B4E5 54 24 53 20 52 24  5747         .byte   0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24
        52 24
   B4ED 50 20 4F 24 4E 20  5748         .byte   0x50,0x20,0x4f,0x24,0x4e,0x20,0x4d,0x24
        4D 24
   B4F5 4C 20 4C 20 4B 24  5749         .byte   0x4c,0x20,0x4c,0x20,0x4b,0x24,0x4a,0x20
        4A 20
   B4FD 49 20 49 00 48 20  5750         .byte   0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20
        47 20
   B505 47 20 46 20 45 24  5751         .byte   0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24
        45 24
   B50D 44 20 42 20 42 20  5752         .byte   0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04
        37 04
   B515 35 20 2E 04 2E 04  5753         .byte   0x35,0x20,0x2e,0x04,0x2e,0x04,0x2d,0x20
        2D 20
   B51D 23 24 21 20 17 24  5754         .byte   0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00
        13 00
   B525 11 24 10 30 07 34  5755         .byte   0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30
        06 30
   B52D 05 30 FF FF        5756         .byte   0x05,0x30,0xff,0xff
                           5757 
                           5758 ; board 3
   B531                    5759 LB531:
   B531 CD 20 CC 20 CB 20  5760         .byte   0xcd,0x20,0xcc,0x20,0xcb,0x20,0xcb,0x20
        CB 20
   B539 CA 00 C9 20 C9 20  5761         .byte   0xca,0x00,0xc9,0x20,0xc9,0x20,0xc8,0x20
        C8 20
   B541 C1 A0 C0 A0 B8 A0  5762         .byte   0xc1,0xa0,0xc0,0xa0,0xb8,0xa0,0xb8,0x20
        B8 20
   B549 B4 20 A6 00 A4 20  5763         .byte   0xb4,0x20,0xa6,0x00,0xa4,0x20,0x99,0x00
        99 00
   B551 97 22 97 22 96 20  5764         .byte   0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22
        95 22
   B559 94 20 93 22 93 22  5765         .byte   0x94,0x20,0x93,0x22,0x93,0x22,0x91,0x20
        91 20
   B561 90 20 90 20 8D A0  5766         .byte   0x90,0x20,0x90,0x20,0x8d,0xa0,0x8c,0xa0
        8C A0
   B569 7D A2 7D A2 7B A0  5767         .byte   0x7d,0xa2,0x7d,0xa2,0x7b,0xa0,0x7b,0xa0
        7B A0
   B571 79 A2 79 A2 77 A0  5768         .byte   0x79,0xa2,0x79,0xa2,0x77,0xa0,0x77,0xa0
        77 A0
   B579 76 80 75 A0 6E 20  5769         .byte   0x76,0x80,0x75,0xa0,0x6e,0x20,0x67,0x24
        67 24
   B581 66 20 65 24 64 20  5770         .byte   0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24
        63 24
   B589 63 24 61 20 60 24  5771         .byte   0x63,0x24,0x61,0x20,0x60,0x24,0x5f,0x20
        5F 20
   B591 5E 20 5D 24 5C 20  5772         .byte   0x5e,0x20,0x5d,0x24,0x5c,0x20,0x5b,0x24
        5B 24
   B599 5A 20 59 24 58 20  5773         .byte   0x5a,0x20,0x59,0x24,0x58,0x20,0x56,0x20
        56 20
   B5A1 55 04 54 00 53 24  5774         .byte   0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20
        52 20
   B5A9 52 20 4F 24 4F 24  5775         .byte   0x52,0x20,0x4f,0x24,0x4f,0x24,0x4e,0x30
        4E 30
   B5B1 4D 30 47 10 45 30  5776         .byte   0x4d,0x30,0x47,0x10,0x45,0x30,0x35,0x30
        35 30
   B5B9 33 10 31 30 31 30  5777         .byte   0x33,0x10,0x31,0x30,0x31,0x30,0x1d,0x20
        1D 20
   B5C1 FF FF              5778         .byte   0xff,0xff
                           5779 
                           5780 ; board 5
   B5C3                    5781 LB5C3:
   B5C3 A9 20 A3 20 A2 20  5782         .byte   0xa9,0x20,0xa3,0x20,0xa2,0x20,0xa1,0x20
        A1 20
   B5CB A0 20 A0 20 9F 20  5783         .byte   0xa0,0x20,0xa0,0x20,0x9f,0x20,0x9f,0x20
        9F 20
   B5D3 9E 20 9D 24 9D 24  5784         .byte   0x9e,0x20,0x9d,0x24,0x9d,0x24,0x9b,0x20
        9B 20
   B5DB 9A 24 99 20 98 20  5785         .byte   0x9a,0x24,0x99,0x20,0x98,0x20,0x97,0x24
        97 24
   B5E3 97 24 95 20 95 20  5786         .byte   0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00
        94 00
   B5EB 94 00 93 20 92 00  5787         .byte   0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00
        92 00
   B5F3 91 20 90 20 90 20  5788         .byte   0x91,0x20,0x90,0x20,0x90,0x20,0x8f,0x20
        8F 20
   B5FB 8D 20 8D 20 81 00  5789         .byte   0x8d,0x20,0x8d,0x20,0x81,0x00,0x7f,0x20
        7F 20
   B603 79 00 79 00 78 20  5790         .byte   0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20
        76 20
   B60B 6B 00 69 20 5E 00  5791         .byte   0x6b,0x00,0x69,0x20,0x5e,0x00,0x5c,0x20
        5C 20
   B613 5B 30 52 10 51 30  5792         .byte   0x5b,0x30,0x52,0x10,0x51,0x30,0x50,0x30
        50 30
   B61B 50 30 4F 20 4E 20  5793         .byte   0x50,0x30,0x4f,0x20,0x4e,0x20,0x4e,0x20
        4E 20
   B623 4D 20 46 A0 45 A0  5794         .byte   0x4d,0x20,0x46,0xa0,0x45,0xa0,0x3d,0xa0
        3D A0
   B62B 3D A0 39 20 2A 00  5795         .byte   0x3d,0xa0,0x39,0x20,0x2a,0x00,0x28,0x20
        28 20
   B633 1E 00 1C 22 1C 22  5796         .byte   0x1e,0x00,0x1c,0x22,0x1c,0x22,0x1b,0x20
        1B 20
   B63B 1A 22 19 20 18 22  5797         .byte   0x1a,0x22,0x19,0x20,0x18,0x22,0x18,0x22
        18 22
   B643 16 20 15 22 15 22  5798         .byte   0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xa0
        14 A0
   B64B 13 A2 11 A0        5799         .byte   0x13,0xa2,0x11,0xa0
                           5800 
                           5801 ; All empty (0xFFs) in this gap
                           5802 
   F780                    5803         .org    0xF780
                           5804 
                           5805 ; Two Tables used by data protocol handler
                           5806 
   F780                    5807 LF780:
   F780 57 0B 00 00 00 00  5808         .byte   0x57,0x0b,0x00,0x00,0x00,0x00,0x08,0x00
        08 00
   F788 00 00 20 00 00 00  5809         .byte   0x00,0x00,0x20,0x00,0x00,0x00,0x80,0x00
        80 00
   F790 00 00 00 00 00 04  5810         .byte   0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
        00 00
   F798 00 10 00 00 00 00  5811         .byte   0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
                           5812 
   F7A0                    5813 LF7A0:
   F7A0 40 12 20 09 80 24  5814         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x02,0x00
        02 00
   F7A8 40 12 20 09 80 24  5815         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x04,0x00
        04 00
   F7B0 00 00 00 00 00 00  5816         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
   F7B8 00 00 00 00 08 00  5817         .byte   0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        00 00
                           5818 
   F7C0                    5819 LF7C0:
   F7C0 00                 5820         .byte   0x00
                           5821 ;
                           5822 ; All empty (0xFFs) in this gap
                           5823 ;
   F800                    5824         .org    0xF800
                           5825 ; Reset
   F800                    5826 RESET:
   F800 0F            [ 2] 5827         sei                     ; disable interrupts
   F801 86 03         [ 2] 5828         ldaa    #0x03
   F803 B7 10 24      [ 4] 5829         staa    TMSK2           ; disable irqs, set prescaler to 16
   F806 86 80         [ 2] 5830         ldaa    #0x80
   F808 B7 10 22      [ 4] 5831         staa    TMSK1           ; enable OC1 irq
   F80B 86 FE         [ 2] 5832         ldaa    #0xFE
   F80D B7 10 35      [ 4] 5833         staa    BPROT           ; protect everything except $xE00-$xE1F
   F810 96 07         [ 3] 5834         ldaa    0x0007          ;
   F812 81 DB         [ 2] 5835         cmpa    #0xDB           ; special unprotect mode???
   F814 26 06         [ 3] 5836         bne     LF81C           ; if not, jump ahead
   F816 7F 10 35      [ 6] 5837         clr     BPROT           ; else unprotect everything
   F819 7F 00 07      [ 6] 5838         clr     0x0007          ; reset special unprotect mode???
   F81C                    5839 LF81C:
   F81C 8E 01 FF      [ 3] 5840         lds     #0x01FF         ; init SP
   F81F 86 A5         [ 2] 5841         ldaa    #0xA5
   F821 B7 10 5D      [ 4] 5842         staa    CSCTL           ; enable external IO:
                           5843                                 ; IO1EN,  BUSSEL, active LOW
                           5844                                 ; IO2EN,  PIA/SCCSEL, active LOW
                           5845                                 ; CSPROG, ROMSEL priority over RAMSEL 
                           5846                                 ; CSPROG, ROMSEL enabled, 32K, $8000-$FFFF
   F824 86 01         [ 2] 5847         ldaa    #0x01
   F826 B7 10 5F      [ 4] 5848         staa    CSGSIZ          ; CSGEN,  RAMSEL active low
                           5849                                 ; CSGEN,  RAMSEL 32K
   F829 86 00         [ 2] 5850         ldaa    #0x00
   F82B B7 10 5E      [ 4] 5851         staa    CSGADR          ; CSGEN,  RAMSEL = $0000-$7FFF (except internal regs)
   F82E 86 F0         [ 2] 5852         ldaa    #0xF0
   F830 B7 10 5C      [ 4] 5853         staa    CSSTRH          ; 3 cycle clock stretching on BUSSEL and LCRS
   F833 7F 00 00      [ 6] 5854         clr     0x0000          ; ????? Done with basic init?
                           5855 
                           5856 ; Initialize Main PIA
   F836 86 30         [ 2] 5857         ldaa    #0x30           ;
   F838 B7 18 05      [ 4] 5858         staa    PIA0CRA         ; control register A, CA2=0, sel DDRA
   F83B B7 18 07      [ 4] 5859         staa    PIA0CRB         ; control register B, CB2=0, sel DDRB
   F83E 86 FF         [ 2] 5860         ldaa    #0xFF
   F840 B7 18 06      [ 4] 5861         staa    PIA0DDRB        ; select B0-B7 to be outputs
   F843 86 78         [ 2] 5862         ldaa    #0x78           ;
   F845 B7 18 04      [ 4] 5863         staa    PIA0DDRA        ; select A3-A6 to be outputs
   F848 86 34         [ 2] 5864         ldaa    #0x34           ;
   F84A B7 18 05      [ 4] 5865         staa    PIA0CRA         ; select output register A
   F84D B7 18 07      [ 4] 5866         staa    PIA0CRB         ; select output register B
   F850 C6 FF         [ 2] 5867         ldab    #0xFF
   F852 BD F9 C5      [ 6] 5868         jsr     BUTNLIT         ; turn on all button lights
   F855 20 13         [ 3] 5869         bra     LF86A           ; jump past data table
                           5870 
                           5871 ; data table for aux serial config
   F857                    5872 LF857:
   F857 09 4A              5873         .byte   0x09,0x4a       ; channel reset B, MIE off, DLC on, no vector
   F859 01 10              5874         .byte   0x01,0x10       ; irq on all character received
   F85B 0C 18              5875         .byte   0x0c,0x18       ; Lower byte of time constant
   F85D 0D 00              5876         .byte   0x0d,0x00       ; Upper byte of time constant
   F85F 04 44              5877         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   F861 0E 63              5878         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   F863 05 68              5879         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   F865 0B 56              5880         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   F867 03 C1              5881         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           5882         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           5883         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   F869 FF                 5884         .byte   0xff            ; end of table marker
                           5885 
                           5886 ; init SCC (8530), aux serial config
   F86A                    5887 LF86A:
   F86A CE F8 57      [ 3] 5888         ldx     #LF857
   F86D                    5889 LF86D:
   F86D A6 00         [ 4] 5890         ldaa    0,X
   F86F 81 FF         [ 2] 5891         cmpa    #0xFF
   F871 27 06         [ 3] 5892         beq     LF879
   F873 B7 18 0D      [ 4] 5893         staa    SCCCTRLA
   F876 08            [ 3] 5894         inx
   F877 20 F4         [ 3] 5895         bra     LF86D
                           5896 
                           5897 ; Setup normal SCI, 8 data bits, 1 stop bit
                           5898 ; Interrupts disabled, Transmitter and Receiver enabled
                           5899 ; prescaler = /13, SCR=/2, rate = 9600 baud at 16Mhz clock
                           5900 
   F879                    5901 LF879:
   F879 86 00         [ 2] 5902         ldaa    #0x00
   F87B B7 10 2C      [ 4] 5903         staa    SCCR1
   F87E 86 0C         [ 2] 5904         ldaa    #0x0C
   F880 B7 10 2D      [ 4] 5905         staa    SCCR2
   F883 86 31         [ 2] 5906         ldaa    #0x31
   F885 B7 10 2B      [ 4] 5907         staa    BAUD
                           5908 
                           5909 ; Initialize all RAM vectors to RTI: 
                           5910 ; Opcode 0x3b into vectors at 0x0100 through 0x0139
                           5911 
   F888 CE 01 00      [ 3] 5912         ldx     #0x0100
   F88B 86 3B         [ 2] 5913         ldaa    #0x3B           ; RTI opcode
   F88D                    5914 LF88D:
   F88D A7 00         [ 4] 5915         staa    0,X
   F88F 08            [ 3] 5916         inx
   F890 08            [ 3] 5917         inx
   F891 08            [ 3] 5918         inx
   F892 8C 01 3C      [ 4] 5919         cpx     #0x013C
   F895 25 F6         [ 3] 5920         bcs     LF88D
   F897 C6 F0         [ 2] 5921         ldab    #0xF0
   F899 F7 18 04      [ 4] 5922         stab    PIA0PRA         ; enable LCD backlight, disable RESET button light
   F89C 86 7E         [ 2] 5923         ldaa    #0x7E
   F89E 97 03         [ 3] 5924         staa    (0x0003)        ; Put a jump instruction here???
                           5925 
                           5926 ; Non-destructive ram test:
                           5927 ;
                           5928 ; HC11 Internal RAM: 0x0000-0x3ff
                           5929 ; External NVRAM:    0x2000-0x7fff
                           5930 ;
                           5931 ; Note:
                           5932 ; External NVRAM:    0x0400-0xfff is also available, but not tested
                           5933 
   F8A0 CE 00 00      [ 3] 5934         ldx     #0x0000
   F8A3                    5935 LF8A3:
   F8A3 E6 00         [ 4] 5936         ldab    0,X             ; save value
   F8A5 86 55         [ 2] 5937         ldaa    #0x55
   F8A7 A7 00         [ 4] 5938         staa    0,X
   F8A9 A1 00         [ 4] 5939         cmpa    0,X
   F8AB 26 19         [ 3] 5940         bne     LF8C6
   F8AD 49            [ 2] 5941         rola
   F8AE A7 00         [ 4] 5942         staa    0,X
   F8B0 A1 00         [ 4] 5943         cmpa    0,X
   F8B2 26 12         [ 3] 5944         bne     LF8C6
   F8B4 E7 00         [ 4] 5945         stab    0,X             ; restore value
   F8B6 08            [ 3] 5946         inx
   F8B7 8C 04 00      [ 4] 5947         cpx     #0x0400
   F8BA 26 03         [ 3] 5948         bne     LF8BF
   F8BC CE 20 00      [ 3] 5949         ldx     #0x2000
   F8BF                    5950 LF8BF:  
   F8BF 8C 80 00      [ 4] 5951         cpx     #0x8000
   F8C2 26 DF         [ 3] 5952         bne     LF8A3
   F8C4 20 04         [ 3] 5953         bra     LF8CA
                           5954 
   F8C6                    5955 LF8C6:
   F8C6 86 01         [ 2] 5956         ldaa    #0x01           ; Mark Failed RAM test
   F8C8 97 00         [ 3] 5957         staa    (0x0000)
                           5958 ; 
   F8CA                    5959 LF8CA:
   F8CA C6 01         [ 2] 5960         ldab    #0x01
   F8CC BD F9 95      [ 6] 5961         jsr     DIAGDGT         ; write digit 1 to diag display
   F8CF B6 10 35      [ 4] 5962         ldaa    BPROT  
   F8D2 26 0F         [ 3] 5963         bne     LF8E3           ; if something is protected, jump ahead
   F8D4 B6 30 00      [ 4] 5964         ldaa    (0x3000)        ; NVRAM
   F8D7 81 7E         [ 2] 5965         cmpa    #0x7E
   F8D9 26 08         [ 3] 5966         bne     LF8E3           ; if RAM(0x3000) == 0x7E, jump ahead anyway (special unlock?)
                           5967 
                           5968 ; error?
   F8DB C6 0E         [ 2] 5969         ldab    #0x0E
   F8DD BD F9 95      [ 6] 5970         jsr     DIAGDGT         ; write digit E to diag display
   F8E0 7E 30 00      [ 3] 5971         jmp     (0x3000)        ; jump to routine in NVRAM?
                           5972 
                           5973 ; checking for serial connection
                           5974 
   F8E3                    5975 LF8E3:
   F8E3 CE F0 00      [ 3] 5976         ldx     #0xF000         ; timeout counter
   F8E6                    5977 LF8E6:
   F8E6 01            [ 2] 5978         nop
   F8E7 01            [ 2] 5979         nop
   F8E8 09            [ 3] 5980         dex
   F8E9 27 0B         [ 3] 5981         beq     LF8F6           ; if time is up, jump ahead
   F8EB BD F9 45      [ 6] 5982         jsr     SERIALR         ; else read serial data if available
   F8EE 24 F6         [ 3] 5983         bcc     LF8E6           ; if no data available, loop
   F8F0 81 1B         [ 2] 5984         cmpa    #0x1B           ; if serial data was read, is it an ESC?
   F8F2 27 29         [ 3] 5985         beq     LF91D           ; if so, jump to echo hex char routine?
   F8F4 20 F0         [ 3] 5986         bra     LF8E6           ; else loop
   F8F6                    5987 LF8F6:
   F8F6 B6 80 00      [ 4] 5988         ldaa    L8000           ; check if this is a regular rom?
   F8F9 81 7E         [ 2] 5989         cmpa    #0x7E        
   F8FB 26 0B         [ 3] 5990         bne     MINIMON         ; if not, jump ahead
                           5991 
   F8FD C6 0A         [ 2] 5992         ldab    #0x0A
   F8FF BD F9 95      [ 6] 5993         jsr     DIAGDGT         ; else write digit A to diag display
                           5994 
   F902 BD 80 00      [ 6] 5995         jsr     L8000           ; jump to start of rom routine
   F905 0F            [ 2] 5996         sei                     ; if we ever come return, just loop and do it all again
   F906 20 EE         [ 3] 5997         bra     LF8F6
                           5998 
                           5999 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6000 
   F908                    6001 MINIMON:
   F908 C6 10         [ 2] 6002         ldab    #0x10           ; not a regular rom
   F90A BD F9 95      [ 6] 6003         jsr     DIAGDGT         ; blank the diag display
                           6004 
   F90D BD F9 D8      [ 6] 6005         jsr     SERMSGW         ; enter the mini-monitor???
   F910 4D 49 4E 49 2D 4D  6006         .ascis  'MINI-MON'
        4F CE
                           6007 
   F918 C6 10         [ 2] 6008         ldab    #0x10
   F91A BD F9 95      [ 6] 6009         jsr     DIAGDGT         ; blank the diag display
                           6010 
   F91D                    6011 LF91D:
   F91D 7F 00 05      [ 6] 6012         clr     (0x0005)
   F920 7F 00 04      [ 6] 6013         clr     (0x0004)
   F923 7F 00 02      [ 6] 6014         clr     (0x0002)
   F926 7F 00 06      [ 6] 6015         clr     (0x0006)
                           6016 
   F929 BD F9 D8      [ 6] 6017         jsr     SERMSGW
   F92C 0D 0A BE           6018         .ascis  '\r\n>'
                           6019 
                           6020 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6021 
                           6022 ; convert A to 2 hex digits and transmit
   F92F                    6023 SERHEXW:
   F92F 36            [ 3] 6024         psha
   F930 44            [ 2] 6025         lsra
   F931 44            [ 2] 6026         lsra
   F932 44            [ 2] 6027         lsra
   F933 44            [ 2] 6028         lsra
   F934 BD F9 38      [ 6] 6029         jsr     LF938
   F937 32            [ 4] 6030         pula
   F938                    6031 LF938:
   F938 84 0F         [ 2] 6032         anda    #0x0F
   F93A 8A 30         [ 2] 6033         oraa    #0x30
   F93C 81 3A         [ 2] 6034         cmpa    #0x3A
   F93E 25 02         [ 3] 6035         bcs     LF942
   F940 8B 07         [ 2] 6036         adda    #0x07
   F942                    6037 LF942:
   F942 7E F9 6F      [ 3] 6038         jmp     SERIALW
                           6039 
                           6040 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6041 
                           6042 ; serial read non-blocking
   F945                    6043 SERIALR:
   F945 B6 10 2E      [ 4] 6044         ldaa    SCSR  
   F948 85 20         [ 2] 6045         bita    #0x20
   F94A 26 09         [ 3] 6046         bne     LF955
   F94C 0C            [ 2] 6047         clc
   F94D 39            [ 5] 6048         rts
                           6049 
                           6050 ; serial blocking read
   F94E                    6051 SERBLKR:
   F94E B6 10 2E      [ 4] 6052         ldaa    SCSR            ; read serial status
   F951 85 20         [ 2] 6053         bita    #0x20
   F953 27 F9         [ 3] 6054         beq     SERBLKR         ; if RDRF=0, loop
                           6055 
                           6056 ; read serial data, (assumes it's ready)
   F955                    6057 LF955:
   F955 B6 10 2E      [ 4] 6058         ldaa    SCSR            ; read serial status
   F958 85 02         [ 2] 6059         bita    #0x02
   F95A 26 09         [ 3] 6060         bne     LF965           ; if FE=1, clear it
   F95C 85 08         [ 2] 6061         bita    #0x08
   F95E 26 05         [ 3] 6062         bne     LF965           ; if OR=1, clear it
   F960 B6 10 2F      [ 4] 6063         ldaa    SCDR            ; otherwise, good data
   F963 0D            [ 2] 6064         sec
   F964 39            [ 5] 6065         rts
                           6066 
   F965                    6067 LF965:
   F965 B6 10 2F      [ 4] 6068         ldaa    SCDR            ; clear any error
   F968 86 2F         [ 2] 6069         ldaa    #0x2F           ; '/'   
   F96A BD F9 6F      [ 6] 6070         jsr     SERIALW
   F96D 20 DF         [ 3] 6071         bra     SERBLKR         ; go to wait for a character
                           6072 
                           6073 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6074 
                           6075 ; Send A to SCI with CR turned to CRLF
   F96F                    6076 SERIALW:
   F96F 81 0D         [ 2] 6077         cmpa    #0x0D           ; CR?
   F971 27 02         [ 3] 6078         beq     LF975           ; if so echo CR+LF
   F973 20 07         [ 3] 6079         bra     SERRAWW         ; else just echo it
   F975                    6080 LF975:
   F975 86 0D         [ 2] 6081         ldaa    #0x0D
   F977 BD F9 7C      [ 6] 6082         jsr     SERRAWW
   F97A 86 0A         [ 2] 6083         ldaa    #0x0A
                           6084 
                           6085 ; send a char to SCI
   F97C                    6086 SERRAWW:
   F97C F6 10 2E      [ 4] 6087         ldab    SCSR            ; wait for ready to send
   F97F C5 40         [ 2] 6088         bitb    #0x40
   F981 27 F9         [ 3] 6089         beq     SERRAWW
   F983 B7 10 2F      [ 4] 6090         staa    SCDR            ; send it
   F986 39            [ 5] 6091         rts
                           6092 
                           6093 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6094 
                           6095 ; Unused?
   F987                    6096 LF987:
   F987 BD F9 4E      [ 6] 6097         jsr     SERBLKR         ; get a serial char
   F98A 81 7A         [ 2] 6098         cmpa    #0x7A           ;'z'
   F98C 22 06         [ 3] 6099         bhi     LF994
   F98E 81 61         [ 2] 6100         cmpa    #0x61           ;'a'
   F990 25 02         [ 3] 6101         bcs     LF994
   F992 82 20         [ 2] 6102         sbca    #0x20           ;convert to upper case?
   F994                    6103 LF994:
   F994 39            [ 5] 6104         rts
                           6105 
                           6106 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6107 
                           6108 ; Write hex digit arg in B to diagnostic lights
                           6109 ; or B=0x10 or higher for blank
                           6110 
   F995                    6111 DIAGDGT:
   F995 36            [ 3] 6112         psha
   F996 C1 11         [ 2] 6113         cmpb    #0x11
   F998 25 02         [ 3] 6114         bcs     LF99C
   F99A C6 10         [ 2] 6115         ldab    #0x10
   F99C                    6116 LF99C:
   F99C CE F9 B4      [ 3] 6117         ldx     #LF9B4
   F99F 3A            [ 3] 6118         abx
   F9A0 A6 00         [ 4] 6119         ldaa    0,X
   F9A2 B7 18 06      [ 4] 6120         staa    PIA0PRB         ; write arg to local data bus
   F9A5 B6 18 04      [ 4] 6121         ldaa    PIA0PRA         ; read from Port A
   F9A8 8A 20         [ 2] 6122         oraa    #0x20           ; bit 5 high
   F9AA B7 18 04      [ 4] 6123         staa    PIA0PRA         ; write back to Port A
   F9AD 84 DF         [ 2] 6124         anda    #0xDF           ; bit 5 low
   F9AF B7 18 04      [ 4] 6125         staa    PIA0PRA         ; write back to Port A
   F9B2 32            [ 4] 6126         pula
   F9B3 39            [ 5] 6127         rts
                           6128 
                           6129 ; 7 segment patterns - XGFEDCBA
   F9B4                    6130 LF9B4:
   F9B4 C0                 6131         .byte   0xc0            ; 0
   F9B5 F9                 6132         .byte   0xf9            ; 1
   F9B6 A4                 6133         .byte   0xa4            ; 2
   F9B7 B0                 6134         .byte   0xb0            ; 3
   F9B8 99                 6135         .byte   0x99            ; 4
   F9B9 92                 6136         .byte   0x92            ; 5
   F9BA 82                 6137         .byte   0x82            ; 6
   F9BB F8                 6138         .byte   0xf8            ; 7
   F9BC 80                 6139         .byte   0x80            ; 8
   F9BD 90                 6140         .byte   0x90            ; 9
   F9BE 88                 6141         .byte   0x88            ; A 
   F9BF 83                 6142         .byte   0x83            ; b
   F9C0 C6                 6143         .byte   0xc6            ; C
   F9C1 A1                 6144         .byte   0xa1            ; d
   F9C2 86                 6145         .byte   0x86            ; E
   F9C3 8E                 6146         .byte   0x8e            ; F
   F9C4 FF                 6147         .byte   0xff            ; blank
                           6148 
                           6149 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6150 
                           6151 ; Write arg in B to Button Lights
   F9C5                    6152 BUTNLIT:
   F9C5 36            [ 3] 6153         psha
   F9C6 F7 18 06      [ 4] 6154         stab    PIA0PRB         ; write arg to local data bus
   F9C9 B6 18 04      [ 4] 6155         ldaa    PIA0PRA         ; read from Port A
   F9CC 84 EF         [ 2] 6156         anda    #0xEF           ; bit 4 low
   F9CE B7 18 04      [ 4] 6157         staa    PIA0PRA         ; write back to Port A
   F9D1 8A 10         [ 2] 6158         oraa    #0x10           ; bit 4 high
   F9D3 B7 18 04      [ 4] 6159         staa    PIA0PRA         ; write this to Port A
   F9D6 32            [ 4] 6160         pula
   F9D7 39            [ 5] 6161         rts
                           6162 
                           6163 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6164 
                           6165 ; Send rom message via SCI
   F9D8                    6166 SERMSGW:
   F9D8 18 38         [ 6] 6167         puly
   F9DA                    6168 LF9DA:
   F9DA 18 A6 00      [ 5] 6169         ldaa    0,Y
   F9DD 27 09         [ 3] 6170         beq     LF9E8           ; if zero terminated, return
   F9DF 2B 0C         [ 3] 6171         bmi     LF9ED           ; if high bit set..do last char and return
   F9E1 BD F9 7C      [ 6] 6172         jsr     SERRAWW         ; else send char
   F9E4 18 08         [ 4] 6173         iny
   F9E6 20 F2         [ 3] 6174         bra     LF9DA           ; and loop for next one
                           6175 
   F9E8                    6176 LF9E8:
   F9E8 18 08         [ 4] 6177         iny                     ; setup return address and return
   F9EA 18 3C         [ 5] 6178         pshy
   F9EC 39            [ 5] 6179         rts
                           6180 
   F9ED                    6181 LF9ED:
   F9ED 84 7F         [ 2] 6182         anda    #0x7F           ; remove top bit
   F9EF BD F9 7C      [ 6] 6183         jsr     SERRAWW         ; send char
   F9F2 20 F4         [ 3] 6184         bra     LF9E8           ; and we're done
   F9F4 39            [ 5] 6185         rts
                           6186 
   F9F5                    6187 DORTS:
   F9F5 39            [ 5] 6188         rts
   F9F6                    6189 DORTI:        
   F9F6 3B            [12] 6190         rti
                           6191 
                           6192 ; all 0xffs in this gap
                           6193 
   FFA0                    6194         .org    0xFFA0
                           6195 
   FFA0 7E F9 F5      [ 3] 6196         jmp     DORTS
   FFA3 7E F9 F5      [ 3] 6197         jmp     DORTS
   FFA6 7E F9 F5      [ 3] 6198         jmp     DORTS
   FFA9 7E F9 2F      [ 3] 6199         jmp     SERHEXW
   FFAC 7E F9 D8      [ 3] 6200         jmp     SERMSGW      
   FFAF 7E F9 45      [ 3] 6201         jmp     SERIALR     
   FFB2 7E F9 6F      [ 3] 6202         jmp     SERIALW      
   FFB5 7E F9 08      [ 3] 6203         jmp     MINIMON
   FFB8 7E F9 95      [ 3] 6204         jmp     DIAGDGT 
   FFBB 7E F9 C5      [ 3] 6205         jmp     BUTNLIT 
                           6206 
   FFBE FF                 6207        .byte    0xff
   FFBF FF                 6208        .byte    0xff
                           6209 
                           6210 ; Vectors
                           6211 
   FFC0 F9 F6              6212        .word   DORTI            ; Stub RTI
   FFC2 F9 F6              6213        .word   DORTI            ; Stub RTI
   FFC4 F9 F6              6214        .word   DORTI            ; Stub RTI
   FFC6 F9 F6              6215        .word   DORTI            ; Stub RTI
   FFC8 F9 F6              6216        .word   DORTI            ; Stub RTI
   FFCA F9 F6              6217        .word   DORTI            ; Stub RTI
   FFCC F9 F6              6218        .word   DORTI            ; Stub RTI
   FFCE F9 F6              6219        .word   DORTI            ; Stub RTI
   FFD0 F9 F6              6220        .word   DORTI            ; Stub RTI
   FFD2 F9 F6              6221        .word   DORTI            ; Stub RTI
   FFD4 F9 F6              6222        .word   DORTI            ; Stub RTI
                           6223 
   FFD6 01 00              6224         .word  0x0100           ; SCI
   FFD8 01 03              6225         .word  0x0103           ; SPI
   FFDA 01 06              6226         .word  0x0106           ; PA accum. input edge
   FFDC 01 09              6227         .word  0x0109           ; PA Overflow
                           6228 
   FFDE F9 F6              6229         .word  DORTI            ; Stub RTI
                           6230 
   FFE0 01 0C              6231         .word  0x010c           ; TI4O5
   FFE2 01 0F              6232         .word  0x010f           ; TOC4
   FFE4 01 12              6233         .word  0x0112           ; TOC3
   FFE6 01 15              6234         .word  0x0115           ; TOC2
   FFE8 01 18              6235         .word  0x0118           ; TOC1
   FFEA 01 1B              6236         .word  0x011b           ; TIC3
   FFEC 01 1E              6237         .word  0x011e           ; TIC2
   FFEE 01 21              6238         .word  0x0121           ; TIC1
   FFF0 01 24              6239         .word  0x0124           ; RTI
   FFF2 01 27              6240         .word  0x0127           ; ~IRQ
   FFF4 01 2A              6241         .word  0x012a           ; XIRQ
   FFF6 01 2D              6242         .word  0x012d           ; SWI
   FFF8 01 30              6243         .word  0x0130           ; ILLEGAL OPCODE
   FFFA 01 33              6244         .word  0x0133           ; COP Failure
   FFFC 01 36              6245         .word  0x0136           ; COP Clock Monitor Fail
                           6246 
   FFFE F8 00              6247         .word  RESET            ; Reset
                           6248 
