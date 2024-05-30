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
   82A4 81 44         [ 2]  387         cmpa    #0x44           ;'$'
   82A6 26 03         [ 3]  388         bne     L82AB
   82A8 7E A3 66      [ 3]  389         jmp     LA366           ; go to security code & setup utility
   82AB                     390 L82AB:
   82AB 81 53         [ 2]  391         cmpa    #0x53           ;'S'
   82AD 26 F2         [ 3]  392         bne     L82A1
                            393 
   82AF BD F9 D8      [ 6]  394         jsr     SERMSGW      
   82B2 0A 0D 45 6E 74 65   395         .ascis  '\n\rEnter security code: '
        72 20 73 65 63 75
        72 69 74 79 20 63
        6F 64 65 3A A0
                            396 
   82C9 0F            [ 2]  397         sei
   82CA BD A2 EA      [ 6]  398         jsr     LA2EA
   82CD 0E            [ 2]  399         cli
   82CE 25 61         [ 3]  400         bcs     L8331
                            401 
   82D0 BD F9 D8      [ 6]  402         jsr     SERMSGW      
   82D3 0A 0D 45 45 50 52   403         .ascii '\n\rEEPROM serial number programming enabled.'
        4F 4D 20 73 65 72
        69 61 6C 20 6E 75
        6D 62 65 72 20 70
        72 6F 67 72 61 6D
        6D 69 6E 67 20 65
        6E 61 62 6C 65 64
        2E
   82FE 0A 0D 50 6C 65 61   404         .ascis '\n\rPlease RESET the processor to continue\n\r'
        73 65 20 52 45 53
        45 54 20 74 68 65
        20 70 72 6F 63 65
        73 73 6F 72 20 74
        6F 20 63 6F 6E 74
        69 6E 75 65 0A 8D
                            405 
   8328 86 01         [ 2]  406         ldaa    #0x01           ; enable EEPROM erase
   832A B7 04 0F      [ 4]  407         staa    ERASEFLG
   832D 86 DB         [ 2]  408         ldaa    #0xDB
   832F 97 07         [ 3]  409         staa    (0x0007)
                            410 ; need to reset to get out of this 
   8331 20 FE         [ 3]  411 L8331:  bra     L8331           ; infinite loop
                            412 
   8333                     413 L8333:
   8333 96 AA         [ 3]  414         ldaa    (0x00AA)
   8335 27 12         [ 3]  415         beq     L8349
   8337 DC 1B         [ 4]  416         ldd     CDTIMR1
   8339 26 0E         [ 3]  417         bne     L8349
   833B D6 62         [ 3]  418         ldab    (0x0062)
   833D C8 20         [ 2]  419         eorb    #0x20
   833F D7 62         [ 3]  420         stab    (0x0062)
   8341 BD F9 C5      [ 6]  421         jsr     BUTNLIT 
   8344 CC 00 32      [ 3]  422         ldd     #0x0032
   8347 DD 1B         [ 4]  423         std     CDTIMR1
   8349                     424 L8349:
   8349 BD 86 A4      [ 6]  425         jsr     L86A4
   834C 24 03         [ 3]  426         bcc     L8351
   834E 7E 82 76      [ 3]  427         jmp     L8276
   8351                     428 L8351:
   8351 F6 10 2D      [ 4]  429         ldab    SCCR2  
   8354 CA 20         [ 2]  430         orab    #0x20
   8356 F7 10 2D      [ 4]  431         stab    SCCR2  
   8359 7F 00 AA      [ 6]  432         clr     (0x00AA)
   835C D6 62         [ 3]  433         ldab    (0x0062)
   835E C4 DF         [ 2]  434         andb    #0xDF
   8360 D7 62         [ 3]  435         stab    (0x0062)
   8362 BD F9 C5      [ 6]  436         jsr     BUTNLIT 
   8365 C6 02         [ 2]  437         ldab    #0x02           ; delay 2 secs
   8367 BD 8C 02      [ 6]  438         jsr     DLYSECS         ;
   836A 96 7C         [ 3]  439         ldaa    (0x007C)
   836C 27 2D         [ 3]  440         beq     L839B
   836E 96 7F         [ 3]  441         ldaa    (0x007F)
   8370 97 4E         [ 3]  442         staa    (0x004E)
   8372 D6 81         [ 3]  443         ldab    (0x0081)
   8374 BD 87 48      [ 6]  444         jsr     L8748   
   8377 96 82         [ 3]  445         ldaa    (0x0082)
   8379 85 01         [ 2]  446         bita    #0x01
   837B 26 06         [ 3]  447         bne     L8383
   837D 96 AC         [ 3]  448         ldaa    (0x00AC)
   837F 84 FD         [ 2]  449         anda    #0xFD
   8381 20 04         [ 3]  450         bra     L8387
   8383                     451 L8383:
   8383 96 AC         [ 3]  452         ldaa    (0x00AC)
   8385 8A 02         [ 2]  453         oraa    #0x02
   8387                     454 L8387:
   8387 97 AC         [ 3]  455         staa    (0x00AC)
   8389 B7 18 06      [ 4]  456         staa    PIA0PRB 
   838C B6 18 04      [ 4]  457         ldaa    PIA0PRA 
   838F 8A 20         [ 2]  458         oraa    #0x20
   8391 B7 18 04      [ 4]  459         staa    PIA0PRA 
   8394 84 DF         [ 2]  460         anda    #0xDF
   8396 B7 18 04      [ 4]  461         staa    PIA0PRA 
   8399 20 14         [ 3]  462         bra     L83AF
   839B                     463 L839B:
   839B FC 04 0D      [ 5]  464         ldd     (0x040D)
   839E 1A 83 FD E8   [ 5]  465         cpd     #0xFDE8         ; 65000?
   83A2 22 06         [ 3]  466         bhi     L83AA
   83A4 C3 00 01      [ 4]  467         addd    #0x0001
   83A7 FD 04 0D      [ 5]  468         std     (0x040D)
   83AA                     469 L83AA:
   83AA C6 F7         [ 2]  470         ldab    #0xF7           ; tape deck REWIND
   83AC BD 86 E7      [ 6]  471         jsr     L86E7
   83AF                     472 L83AF:
   83AF 7F 00 30      [ 6]  473         clr     (0x0030)
   83B2 7F 00 31      [ 6]  474         clr     (0x0031)
   83B5 7F 00 32      [ 6]  475         clr     (0x0032)
   83B8 BD 9B 19      [ 6]  476         jsr     L9B19           ; do the random motions if enabled   
   83BB BD 86 A4      [ 6]  477         jsr     L86A4
   83BE 25 EF         [ 3]  478         bcs     L83AF
   83C0 96 79         [ 3]  479         ldaa    (0x0079)
   83C2 27 17         [ 3]  480         beq     L83DB
   83C4 7F 00 79      [ 6]  481         clr     (0x0079)
   83C7 96 B5         [ 3]  482         ldaa    (0x00B5)
   83C9 81 01         [ 2]  483         cmpa    #0x01
   83CB 26 07         [ 3]  484         bne     L83D4
   83CD 7F 00 B5      [ 6]  485         clr     (0x00B5)
   83D0 86 01         [ 2]  486         ldaa    #0x01
   83D2 97 7C         [ 3]  487         staa    (0x007C)
   83D4                     488 L83D4:
   83D4 86 01         [ 2]  489         ldaa    #0x01
   83D6 97 AA         [ 3]  490         staa    (0x00AA)
   83D8 7E 9A 7F      [ 3]  491         jmp     L9A7F
   83DB                     492 L83DB:
   83DB BD 8D E4      [ 6]  493         jsr     LCDMSG1 
   83DE 20 20 20 54 61 70   494         .ascis  '   Tape start   '
        65 20 73 74 61 72
        74 20 20 A0
                            495 
   83EE D6 62         [ 3]  496         ldab    (0x0062)
   83F0 CA 80         [ 2]  497         orab    #0x80
   83F2 D7 62         [ 3]  498         stab    (0x0062)
   83F4 BD F9 C5      [ 6]  499         jsr     BUTNLIT 
   83F7 C6 FB         [ 2]  500         ldab    #0xFB           ; tape deck PLAY
   83F9 BD 86 E7      [ 6]  501         jsr     L86E7
                            502 
   83FC BD 8D CF      [ 6]  503         jsr     LCDMSG1A
   83FF 36 38 48 43 31 31   504         .ascis  '68HC11 Proto'
        20 50 72 6F 74 EF
                            505 
   840B BD 8D D6      [ 6]  506         jsr     LCDMSG2A
   840E 64 62 F0            507         .ascis  'dbp'
                            508 
   8411 C6 03         [ 2]  509         ldab    #0x03           ; delay 3 secs
   8413 BD 8C 02      [ 6]  510         jsr     DLYSECS         ;
   8416 7D 00 7C      [ 6]  511         tst     (0x007C)
   8419 27 15         [ 3]  512         beq     L8430
   841B D6 80         [ 3]  513         ldab    (0x0080)
   841D D7 62         [ 3]  514         stab    (0x0062)
   841F BD F9 C5      [ 6]  515         jsr     BUTNLIT 
   8422 D6 7D         [ 3]  516         ldab    (0x007D)
   8424 D7 78         [ 3]  517         stab    (0x0078)
   8426 D6 7E         [ 3]  518         ldab    (0x007E)
   8428 F7 10 8A      [ 4]  519         stab    (0x108A)
   842B 7F 00 7C      [ 6]  520         clr     (0x007C)
   842E 20 1D         [ 3]  521         bra     L844D
   8430                     522 L8430:
   8430 BD 8D 03      [ 6]  523         jsr     L8D03
   8433 BD 9D 18      [ 6]  524         jsr     L9D18
   8436 24 08         [ 3]  525         bcc     L8440
   8438 7D 00 B8      [ 6]  526         tst     (0x00B8)
   843B 27 F3         [ 3]  527         beq     L8430
   843D 7E 9A 60      [ 3]  528         jmp     L9A60
   8440                     529 L8440:
   8440 7D 00 B8      [ 6]  530         tst     (0x00B8)
   8443 27 EB         [ 3]  531         beq     L8430
   8445 7F 00 30      [ 6]  532         clr     (0x0030)
   8448 7F 00 31      [ 6]  533         clr     (0x0031)
   844B 20 00         [ 3]  534         bra     L844D
   844D                     535 L844D:
   844D 96 49         [ 3]  536         ldaa    (0x0049)
   844F 26 03         [ 3]  537         bne     L8454
   8451 7E 85 A4      [ 3]  538         jmp     L85A4
   8454                     539 L8454:
   8454 7F 00 49      [ 6]  540         clr     (0x0049)
   8457 81 31         [ 2]  541         cmpa    #0x31
   8459 26 08         [ 3]  542         bne     L8463
   845B BD A3 26      [ 6]  543         jsr     LA326
   845E BD 8D 42      [ 6]  544         jsr     L8D42
   8461 20 EA         [ 3]  545         bra     L844D
   8463                     546 L8463:
   8463 81 32         [ 2]  547         cmpa    #0x32
   8465 26 08         [ 3]  548         bne     L846F
   8467 BD A3 26      [ 6]  549         jsr     LA326
   846A BD 8D 35      [ 6]  550         jsr     L8D35
   846D 20 DE         [ 3]  551         bra     L844D
   846F                     552 L846F:
   846F 81 54         [ 2]  553         cmpa    #0x54
   8471 26 08         [ 3]  554         bne     L847B
   8473 BD A3 26      [ 6]  555         jsr     LA326
   8476 BD 8D 42      [ 6]  556         jsr     L8D42
   8479 20 D2         [ 3]  557         bra     L844D
   847B                     558 L847B:
   847B 81 5A         [ 2]  559         cmpa    #0x5A
   847D 26 1C         [ 3]  560         bne     L849B
   847F                     561 L847F:
   847F BD A3 1E      [ 6]  562         jsr     LA31E
   8482 BD 8E 95      [ 6]  563         jsr     L8E95
   8485 7F 00 32      [ 6]  564         clr     (0x0032)
   8488 7F 00 31      [ 6]  565         clr     (0x0031)
   848B 7F 00 30      [ 6]  566         clr     (0x0030)
   848E BD 99 A6      [ 6]  567         jsr     L99A6
   8491 D6 7B         [ 3]  568         ldab    (0x007B)
   8493 CA 0C         [ 2]  569         orab    #0x0C
   8495 BD 87 48      [ 6]  570         jsr     L8748   
   8498 7E 81 BD      [ 3]  571         jmp     L81BD
   849B                     572 L849B:
   849B 81 42         [ 2]  573         cmpa    #0x42
   849D 26 03         [ 3]  574         bne     L84A2
   849F 7E 98 3C      [ 3]  575         jmp     L983C
   84A2                     576 L84A2:
   84A2 81 4D         [ 2]  577         cmpa    #0x4D
   84A4 26 03         [ 3]  578         bne     L84A9
   84A6 7E 98 24      [ 3]  579         jmp     L9824
   84A9                     580 L84A9:
   84A9 81 45         [ 2]  581         cmpa    #0x45
   84AB 26 03         [ 3]  582         bne     L84B0
   84AD 7E 98 02      [ 3]  583         jmp     L9802
   84B0                     584 L84B0:
   84B0 81 58         [ 2]  585         cmpa    #0x58
   84B2 26 05         [ 3]  586         bne     L84B9
   84B4 7E 99 3F      [ 3]  587         jmp     L993F
   84B7 20 94         [ 3]  588         bra     L844D
   84B9                     589 L84B9:
   84B9 81 46         [ 2]  590         cmpa    #0x46
   84BB 26 03         [ 3]  591         bne     L84C0
   84BD 7E 99 71      [ 3]  592         jmp     L9971
   84C0                     593 L84C0:
   84C0 81 47         [ 2]  594         cmpa    #0x47
   84C2 26 03         [ 3]  595         bne     L84C7
   84C4 7E 99 7B      [ 3]  596         jmp     L997B
   84C7                     597 L84C7:
   84C7 81 48         [ 2]  598         cmpa    #0x48
   84C9 26 03         [ 3]  599         bne     L84CE
   84CB 7E 99 85      [ 3]  600         jmp     L9985
   84CE                     601 L84CE:
   84CE 81 49         [ 2]  602         cmpa    #0x49
   84D0 26 03         [ 3]  603         bne     L84D5
   84D2 7E 99 8F      [ 3]  604         jmp     L998F
   84D5                     605 L84D5:
   84D5 81 53         [ 2]  606         cmpa    #0x53
   84D7 26 03         [ 3]  607         bne     L84DC
   84D9 7E 97 BA      [ 3]  608         jmp     L97BA
   84DC                     609 L84DC:
   84DC 81 59         [ 2]  610         cmpa    #0x59
   84DE 26 03         [ 3]  611         bne     L84E3
   84E0 7E 99 D2      [ 3]  612         jmp     L99D2
   84E3                     613 L84E3:
   84E3 81 57         [ 2]  614         cmpa    #0x57
   84E5 26 03         [ 3]  615         bne     L84EA
   84E7 7E 9A A4      [ 3]  616         jmp     L9AA4
   84EA                     617 L84EA:
   84EA 81 41         [ 2]  618         cmpa    #0x41
   84EC 26 17         [ 3]  619         bne     L8505
   84EE BD 9D 18      [ 6]  620         jsr     L9D18
   84F1 25 09         [ 3]  621         bcs     L84FC
   84F3 7F 00 30      [ 6]  622         clr     (0x0030)
   84F6 7F 00 31      [ 6]  623         clr     (0x0031)
   84F9 7E 85 A4      [ 3]  624         jmp     L85A4
   84FC                     625 L84FC:
   84FC 7F 00 30      [ 6]  626         clr     (0x0030)
   84FF 7F 00 31      [ 6]  627         clr     (0x0031)
   8502 7E 9A 7F      [ 3]  628         jmp     L9A7F
   8505                     629 L8505:
   8505 81 4B         [ 2]  630         cmpa    #0x4B
   8507 26 0B         [ 3]  631         bne     L8514
   8509 BD 9D 18      [ 6]  632         jsr     L9D18
   850C 25 03         [ 3]  633         bcs     L8511
   850E 7E 85 A4      [ 3]  634         jmp     L85A4
   8511                     635 L8511:
   8511 7E 9A 7F      [ 3]  636         jmp     L9A7F
   8514                     637 L8514:
   8514 81 4A         [ 2]  638         cmpa    #0x4A
   8516 26 07         [ 3]  639         bne     L851F
   8518 86 01         [ 2]  640         ldaa    #0x01
   851A 97 AF         [ 3]  641         staa    (0x00AF)
   851C 7E 98 3C      [ 3]  642         jmp     L983C
   851F                     643 L851F:
   851F 81 4E         [ 2]  644         cmpa    #0x4E
   8521 26 0B         [ 3]  645         bne     L852E
   8523 B6 10 8A      [ 4]  646         ldaa    (0x108A)
   8526 8A 02         [ 2]  647         oraa    #0x02
   8528 B7 10 8A      [ 4]  648         staa    (0x108A)
   852B 7E 84 4D      [ 3]  649         jmp     L844D
   852E                     650 L852E:
   852E 81 4F         [ 2]  651         cmpa    #0x4F
   8530 26 06         [ 3]  652         bne     L8538
   8532 BD 9D 18      [ 6]  653         jsr     L9D18
   8535 7E 84 4D      [ 3]  654         jmp     L844D
   8538                     655 L8538:
   8538 81 50         [ 2]  656         cmpa    #0x50
   853A 26 06         [ 3]  657         bne     L8542
   853C BD 9D 18      [ 6]  658         jsr     L9D18
   853F 7E 84 4D      [ 3]  659         jmp     L844D
   8542                     660 L8542:
   8542 81 51         [ 2]  661         cmpa    #0x51
   8544 26 0B         [ 3]  662         bne     L8551
   8546 B6 10 8A      [ 4]  663         ldaa    (0x108A)
   8549 8A 04         [ 2]  664         oraa    #0x04
   854B B7 10 8A      [ 4]  665         staa    (0x108A)
   854E 7E 84 4D      [ 3]  666         jmp     L844D
   8551                     667 L8551:
   8551 81 55         [ 2]  668         cmpa    #0x55
   8553 26 07         [ 3]  669         bne     L855C
   8555 C6 01         [ 2]  670         ldab    #0x01
   8557 D7 B6         [ 3]  671         stab    (0x00B6)
   8559 7E 84 4D      [ 3]  672         jmp     L844D
   855C                     673 L855C:
   855C 81 4C         [ 2]  674         cmpa    #0x4C
   855E 26 19         [ 3]  675         bne     L8579
   8560 7F 00 49      [ 6]  676         clr     (0x0049)
   8563 BD 9D 18      [ 6]  677         jsr     L9D18
   8566 25 0E         [ 3]  678         bcs     L8576
   8568 BD AA E8      [ 6]  679         jsr     LAAE8
   856B BD AB 56      [ 6]  680         jsr     LAB56
   856E 24 06         [ 3]  681         bcc     L8576
   8570 BD AB 25      [ 6]  682         jsr     LAB25
   8573 BD AB 46      [ 6]  683         jsr     LAB46
   8576                     684 L8576:
   8576 7E 84 4D      [ 3]  685         jmp     L844D
   8579                     686 L8579:
   8579 81 52         [ 2]  687         cmpa    #0x52
   857B 26 1A         [ 3]  688         bne     L8597
   857D 7F 00 49      [ 6]  689         clr     (0x0049)
   8580 BD 9D 18      [ 6]  690         jsr     L9D18
   8583 25 0F         [ 3]  691         bcs     L8594
   8585 BD AA E8      [ 6]  692         jsr     LAAE8
   8588 BD AB 56      [ 6]  693         jsr     LAB56
   858B 25 07         [ 3]  694         bcs     L8594
   858D 86 FF         [ 2]  695         ldaa    #0xFF
   858F A7 00         [ 4]  696         staa    0,X
   8591 BD AA E8      [ 6]  697         jsr     LAAE8
   8594                     698 L8594:
   8594 7E 84 4D      [ 3]  699         jmp     L844D
   8597                     700 L8597:
   8597 81 44         [ 2]  701         cmpa    #0x44
   8599 26 09         [ 3]  702         bne     L85A4
   859B 7F 00 49      [ 6]  703         clr     (0x0049)
   859E BD AB AE      [ 6]  704         jsr     LABAE
   85A1 7E 84 4D      [ 3]  705         jmp     L844D
   85A4                     706 L85A4:
   85A4 7D 00 75      [ 6]  707         tst     (0x0075)
   85A7 26 56         [ 3]  708         bne     L85FF
   85A9 7D 00 79      [ 6]  709         tst     (0x0079)
   85AC 26 51         [ 3]  710         bne     L85FF
   85AE 7D 00 30      [ 6]  711         tst     (0x0030)
   85B1 26 07         [ 3]  712         bne     L85BA
   85B3 96 5B         [ 3]  713         ldaa    (0x005B)
   85B5 27 48         [ 3]  714         beq     L85FF
   85B7 7F 00 5B      [ 6]  715         clr     (0x005B)
   85BA                     716 L85BA:
   85BA CC 00 64      [ 3]  717         ldd     #0x0064
   85BD DD 23         [ 4]  718         std     CDTIMR5
   85BF                     719 L85BF:
   85BF DC 23         [ 4]  720         ldd     CDTIMR5
   85C1 27 14         [ 3]  721         beq     L85D7
   85C3 BD 9B 19      [ 6]  722         jsr     L9B19           ; do the random motions if enabled
   85C6 B6 18 04      [ 4]  723         ldaa    PIA0PRA 
   85C9 88 FF         [ 2]  724         eora    #0xFF
   85CB 84 06         [ 2]  725         anda    #0x06
   85CD 81 06         [ 2]  726         cmpa    #0x06
   85CF 26 EE         [ 3]  727         bne     L85BF
   85D1 7F 00 30      [ 6]  728         clr     (0x0030)
   85D4 7E 86 80      [ 3]  729         jmp     L8680
   85D7                     730 L85D7:
   85D7 7F 00 30      [ 6]  731         clr     (0x0030)
   85DA D6 62         [ 3]  732         ldab    (0x0062)
   85DC C8 02         [ 2]  733         eorb    #0x02
   85DE D7 62         [ 3]  734         stab    (0x0062)
   85E0 BD F9 C5      [ 6]  735         jsr     BUTNLIT 
   85E3 C4 02         [ 2]  736         andb    #0x02
   85E5 27 0D         [ 3]  737         beq     L85F4
   85E7 BD AA 18      [ 6]  738         jsr     LAA18
   85EA C6 1E         [ 2]  739         ldab    #0x1E
   85EC BD 8C 22      [ 6]  740         jsr     DLYSECSBY100    ; delay 0.3 sec
   85EF 7F 00 30      [ 6]  741         clr     (0x0030)
   85F2 20 0B         [ 3]  742         bra     L85FF
   85F4                     743 L85F4:
   85F4 BD AA 1D      [ 6]  744         jsr     LAA1D
   85F7 C6 1E         [ 2]  745         ldab    #0x1E
   85F9 BD 8C 22      [ 6]  746         jsr     DLYSECSBY100    ; delay 0.3 sec
   85FC 7F 00 30      [ 6]  747         clr     (0x0030)
   85FF                     748 L85FF:
   85FF BD 9B 19      [ 6]  749         jsr     L9B19           ; do the random motions if enabled
   8602 B6 10 0A      [ 4]  750         ldaa    PORTE
   8605 84 10         [ 2]  751         anda    #0x10
   8607 27 0B         [ 3]  752         beq     L8614
   8609 B6 18 04      [ 4]  753         ldaa    PIA0PRA 
   860C 88 FF         [ 2]  754         eora    #0xFF
   860E 84 07         [ 2]  755         anda    #0x07
   8610 81 06         [ 2]  756         cmpa    #0x06
   8612 26 1C         [ 3]  757         bne     L8630
   8614                     758 L8614:
   8614 7D 00 76      [ 6]  759         tst     (0x0076)
   8617 26 17         [ 3]  760         bne     L8630
   8619 7D 00 75      [ 6]  761         tst     (0x0075)
   861C 26 12         [ 3]  762         bne     L8630
   861E D6 62         [ 3]  763         ldab    (0x0062)
   8620 C4 FC         [ 2]  764         andb    #0xFC
   8622 D7 62         [ 3]  765         stab    (0x0062)
   8624 BD F9 C5      [ 6]  766         jsr     BUTNLIT 
   8627 BD AA 13      [ 6]  767         jsr     LAA13
   862A BD AA 1D      [ 6]  768         jsr     LAA1D
   862D 7E 9A 60      [ 3]  769         jmp     L9A60
   8630                     770 L8630:
   8630 7D 00 31      [ 6]  771         tst     (0x0031)
   8633 26 07         [ 3]  772         bne     L863C
   8635 96 5A         [ 3]  773         ldaa    (0x005A)
   8637 27 47         [ 3]  774         beq     L8680
   8639 7F 00 5A      [ 6]  775         clr     (0x005A)
   863C                     776 L863C:
   863C CC 00 64      [ 3]  777         ldd     #0x0064
   863F DD 23         [ 4]  778         std     CDTIMR5
   8641                     779 L8641:
   8641 DC 23         [ 4]  780         ldd     CDTIMR5
   8643 27 13         [ 3]  781         beq     L8658
   8645 BD 9B 19      [ 6]  782         jsr     L9B19           ; do the random motions if enabled
   8648 B6 18 04      [ 4]  783         ldaa    PIA0PRA 
   864B 88 FF         [ 2]  784         eora    #0xFF
   864D 84 06         [ 2]  785         anda    #0x06
   864F 81 06         [ 2]  786         cmpa    #0x06
   8651 26 EE         [ 3]  787         bne     L8641
   8653 7F 00 31      [ 6]  788         clr     (0x0031)
   8656 20 28         [ 3]  789         bra     L8680
   8658                     790 L8658:
   8658 7F 00 31      [ 6]  791         clr     (0x0031)
   865B D6 62         [ 3]  792         ldab    (0x0062)
   865D C8 01         [ 2]  793         eorb    #0x01
   865F D7 62         [ 3]  794         stab    (0x0062)
   8661 BD F9 C5      [ 6]  795         jsr     BUTNLIT 
   8664 C4 01         [ 2]  796         andb    #0x01
   8666 27 0D         [ 3]  797         beq     L8675
   8668 BD AA 0C      [ 6]  798         jsr     LAA0C
   866B C6 1E         [ 2]  799         ldab    #0x1E
   866D BD 8C 22      [ 6]  800         jsr     DLYSECSBY100    ; delay 0.3 sec
   8670 7F 00 31      [ 6]  801         clr     (0x0031)
   8673 20 0B         [ 3]  802         bra     L8680
   8675                     803 L8675:
   8675 BD AA 13      [ 6]  804         jsr     LAA13
   8678 C6 1E         [ 2]  805         ldab    #0x1E
   867A BD 8C 22      [ 6]  806         jsr     DLYSECSBY100    ; delay 0.3 sec
   867D 7F 00 31      [ 6]  807         clr     (0x0031)
   8680                     808 L8680:
   8680 BD 86 A4      [ 6]  809         jsr     L86A4
   8683 25 1C         [ 3]  810         bcs     L86A1
   8685 7F 00 4E      [ 6]  811         clr     (0x004E)
   8688 BD 99 A6      [ 6]  812         jsr     L99A6
   868B BD 86 C4      [ 6]  813         jsr     L86C4           ; Reset boards 1-10
   868E 5F            [ 2]  814         clrb
   868F D7 62         [ 3]  815         stab    (0x0062)
   8691 BD F9 C5      [ 6]  816         jsr     BUTNLIT 
   8694 C6 FD         [ 2]  817         ldab    #0xFD           ; tape deck STOP
   8696 BD 86 E7      [ 6]  818         jsr     L86E7
   8699 C6 04         [ 2]  819         ldab    #0x04           ; delay 4 secs
   869B BD 8C 02      [ 6]  820         jsr     DLYSECS         ;
   869E 7E 84 7F      [ 3]  821         jmp     L847F
   86A1                     822 L86A1:
   86A1 7E 84 4D      [ 3]  823         jmp     L844D
   86A4                     824 L86A4:
   86A4 BD 9B 19      [ 6]  825         jsr     L9B19           ; do the random motions if enabled
   86A7 7F 00 23      [ 6]  826         clr     CDTIMR5
   86AA 86 19         [ 2]  827         ldaa    #0x19
   86AC 97 24         [ 3]  828         staa    CDTIMR5+1
   86AE B6 10 0A      [ 4]  829         ldaa    PORTE
   86B1 84 80         [ 2]  830         anda    #0x80
   86B3 27 02         [ 3]  831         beq     L86B7
   86B5                     832 L86B5:
   86B5 0D            [ 2]  833         sec
   86B6 39            [ 5]  834         rts
                            835 
   86B7                     836 L86B7:
   86B7 B6 10 0A      [ 4]  837         ldaa    PORTE
   86BA 84 80         [ 2]  838         anda    #0x80
   86BC 26 F7         [ 3]  839         bne     L86B5
   86BE 96 24         [ 3]  840         ldaa    CDTIMR5+1
   86C0 26 F5         [ 3]  841         bne     L86B7
   86C2 0C            [ 2]  842         clc
   86C3 39            [ 5]  843         rts
                            844 
                            845 ; Reset boards 1-10 at:
                            846 ;         0x1080, 0x1084, 0x1088, 0x108c
                            847 ;         0x1090, 0x1094, 0x1098, 0x109c
                            848 ;         0x10a0, 0x10a4
                            849 
   86C4                     850 L86C4:
   86C4 CE 10 80      [ 3]  851         ldx     #0x1080
   86C7                     852 L86C7:
   86C7 86 30         [ 2]  853         ldaa    #0x30
   86C9 A7 01         [ 4]  854         staa    1,X             ; 0x30 -> PIAxCRA, CA2 low, DDR
   86CB A7 03         [ 4]  855         staa    3,X             ; 0x30 -> PIAxCRB, CB2 low, DDR
   86CD 86 FF         [ 2]  856         ldaa    #0xFF
   86CF A7 00         [ 4]  857         staa    0,X             ; 0xFF -> PIAxDDRA, all outputs
   86D1 A7 02         [ 4]  858         staa    2,X             ; 0xFF -> PIAxDDRB, all outputs
   86D3 86 34         [ 2]  859         ldaa    #0x34
   86D5 A7 01         [ 4]  860         staa    1,X             ; 0x34 -> PIAxCRA, CA2 low, PR
   86D7 A7 03         [ 4]  861         staa    3,X             ; 0x34 -> PIAxCRB, CA2 low, PR
   86D9 6F 00         [ 6]  862         clr     0,X             ; 0x00 -> PIAxPRA, all outputs low
   86DB 6F 02         [ 6]  863         clr     2,X             ; 0x00 -> PIAxPRB, all outputs low
   86DD 08            [ 3]  864         inx
   86DE 08            [ 3]  865         inx
   86DF 08            [ 3]  866         inx
   86E0 08            [ 3]  867         inx
   86E1 8C 10 A4      [ 4]  868         cpx     #0x10A4
   86E4 2F E1         [ 3]  869         ble     L86C7
   86E6 39            [ 5]  870         rts
                            871 
                            872 ; Set the tape deck to STOP, PLAY, REWIND, or EJECT
                            873 ;                B =   0xFD, 0xFB,   0xF7, or  0xEF
   86E7                     874 L86E7:
   86E7 36            [ 3]  875         psha
   86E8 BD 9B 19      [ 6]  876         jsr     L9B19           ; do the random motions if enabled
   86EB 96 AC         [ 3]  877         ldaa    (0x00AC)        ; A = diag buffer?
   86ED C1 FB         [ 2]  878         cmpb    #0xFB           ; if bit 2 of B is 0 (PLAY)
   86EF 26 04         [ 3]  879         bne     L86F5
   86F1 84 FE         [ 2]  880         anda    #0xFE           ; clear A bit 0 (top)
   86F3 20 0E         [ 3]  881         bra     L8703
   86F5                     882 L86F5:
   86F5 C1 F7         [ 2]  883         cmpb    #0xF7           ; if bit 3 of B is 0 (REWIND)
   86F7 26 04         [ 3]  884         bne     L86FD
   86F9 84 BF         [ 2]  885         anda    #0xBF           ; clear A bit 6 (middle)
   86FB 20 06         [ 3]  886         bra     L8703
   86FD                     887 L86FD:
   86FD C1 FD         [ 2]  888         cmpb    #0xFD           ; if bit 1 of B is 0 (STOP)
   86FF 26 02         [ 3]  889         bne     L8703
   8701 84 F7         [ 2]  890         anda    #0xF7           ; clear A bit 3 (bottom)
   8703                     891 L8703:
   8703 97 AC         [ 3]  892         staa    (0x00AC)        ; update diag display buffer
   8705 B7 18 06      [ 4]  893         staa    PIA0PRB         ; init bus based on A
   8708 BD 87 3A      [ 6]  894         jsr     L873A           ; clock diagnostic indicator
   870B 96 7A         [ 3]  895         ldaa    (0x007A)        ; buffer for tape deck / av switcher?
   870D 84 01         [ 2]  896         anda    #0x01           ; preserve a/v switcher bit
   870F 97 7A         [ 3]  897         staa    (0x007A)        ; 
   8711 C4 FE         [ 2]  898         andb    #0xFE           ; set bits 7-1 based on B arg
   8713 DA 7A         [ 3]  899         orab    (0x007A)        
   8715 F7 18 06      [ 4]  900         stab    PIA0PRB         ; put that on the bus
   8718 BD 87 75      [ 6]  901         jsr     L8775           ; clock the tape deck
   871B C6 32         [ 2]  902         ldab    #0x32
   871D BD 8C 22      [ 6]  903         jsr     DLYSECSBY100    ; delay 0.5 sec
   8720 C6 FE         [ 2]  904         ldab    #0xFE
   8722 DA 7A         [ 3]  905         orab    (0x007A)        ; all tape bits off
   8724 F7 18 06      [ 4]  906         stab    PIA0PRB         ; unpress tape buttons
   8727 D7 7A         [ 3]  907         stab    (0x007A)
   8729 BD 87 75      [ 6]  908         jsr     L8775           ; clock the tape deck
   872C 96 AC         [ 3]  909         ldaa    (0x00AC)
   872E 8A 49         [ 2]  910         oraa    #0x49           ; reset bits top,mid,bot
   8730 97 AC         [ 3]  911         staa    (0x00AC)
   8732 B7 18 06      [ 4]  912         staa    PIA0PRB 
   8735 BD 87 3A      [ 6]  913         jsr     L873A           ; clock diagnostic indicator
   8738 32            [ 4]  914         pula
   8739 39            [ 5]  915         rts
                            916 
                            917 ; clock diagnostic indicator
   873A                     918 L873A:
   873A B6 18 04      [ 4]  919         ldaa    PIA0PRA 
   873D 8A 20         [ 2]  920         oraa    #0x20
   873F B7 18 04      [ 4]  921         staa    PIA0PRA 
   8742 84 DF         [ 2]  922         anda    #0xDF
   8744 B7 18 04      [ 4]  923         staa    PIA0PRA 
   8747 39            [ 5]  924         rts
                            925 
   8748                     926 L8748:
   8748 36            [ 3]  927         psha
   8749 37            [ 3]  928         pshb
   874A 96 AC         [ 3]  929         ldaa    (0x00AC)        ; update state machine at AC?
                            930                                 ;      gfedcba
   874C 8A 30         [ 2]  931         oraa    #0x30           ; set bb11bbbb
   874E 84 FD         [ 2]  932         anda    #0xFD           ; clr bb11bb0b
   8750 C5 20         [ 2]  933         bitb    #0x20           ; tst bit 5 (f)
   8752 26 02         [ 3]  934         bne     L8756           ; 
   8754 8A 02         [ 2]  935         oraa    #0x02           ; set bit 1 (b)
   8756                     936 L8756:
   8756 C5 04         [ 2]  937         bitb    #0x04           ; tst bit 2 (c)
   8758 26 02         [ 3]  938         bne     L875C
   875A 84 EF         [ 2]  939         anda    #0xEF           ; clr bit 4 (e)
   875C                     940 L875C:
   875C C5 08         [ 2]  941         bitb    #0x08           ; tst bit 3 (d)
   875E 26 02         [ 3]  942         bne     L8762
   8760 84 DF         [ 2]  943         anda    #0xDF           ; clr bit 5 (f)
   8762                     944 L8762:
   8762 B7 18 06      [ 4]  945         staa    PIA0PRB 
   8765 97 AC         [ 3]  946         staa    (0x00AC)
   8767 BD 87 3A      [ 6]  947         jsr     L873A           ; clock diagnostic indicator
   876A 33            [ 4]  948         pulb
   876B F7 18 06      [ 4]  949         stab    PIA0PRB 
   876E D7 7B         [ 3]  950         stab    (0x007B)
   8770 BD 87 83      [ 6]  951         jsr     L8783
   8773 32            [ 4]  952         pula
   8774 39            [ 5]  953         rts
                            954 
                            955 ; High pulse on CB2, clock bits0-4 - 4 tape deck and 1 A/V switcher bit
   8775                     956 L8775:
   8775 B6 18 07      [ 4]  957         ldaa    PIA0CRB 
   8778 8A 38         [ 2]  958         oraa    #0x38           
   877A B7 18 07      [ 4]  959         staa    PIA0CRB         ; CB2 High
   877D 84 F7         [ 2]  960         anda    #0xF7
   877F B7 18 07      [ 4]  961         staa    PIA0CRB         ; CB2 Low
   8782 39            [ 5]  962         rts
                            963 
                            964 ; High pulse on CA2
   8783                     965 L8783:
   8783 B6 18 05      [ 4]  966         ldaa    PIA0CRA 
   8786 8A 38         [ 2]  967         oraa    #0x38
   8788 B7 18 05      [ 4]  968         staa    PIA0CRA         ; CA2 High
   878B 84 F7         [ 2]  969         anda    #0xF7
   878D B7 18 05      [ 4]  970         staa    PIA0CRA         ; CA2 High
   8790 39            [ 5]  971         rts
                            972 
                            973 ; AVSEL1 = 0
   8791                     974 L8791:
   8791 96 7A         [ 3]  975         ldaa    (0x007A)
   8793 84 FE         [ 2]  976         anda    #0xFE
   8795 36            [ 3]  977         psha
   8796 96 AC         [ 3]  978         ldaa    (0x00AC)
   8798 8A 04         [ 2]  979         oraa    #0x04           ; clear segment C (lower right)
   879A 97 AC         [ 3]  980         staa    (0x00AC)
   879C 32            [ 4]  981         pula
   879D                     982 L879D:
   879D 97 7A         [ 3]  983         staa    (0x007A)        
   879F B7 18 06      [ 4]  984         staa    PIA0PRB 
   87A2 BD 87 75      [ 6]  985         jsr     L8775           ; AVSEL1 = low
   87A5 96 AC         [ 3]  986         ldaa    (0x00AC)
   87A7 B7 18 06      [ 4]  987         staa    PIA0PRB 
   87AA BD 87 3A      [ 6]  988         jsr     L873A           ; clock diagnostic indicator
   87AD 39            [ 5]  989         rts
                            990 
   87AE                     991 L87AE:
   87AE 96 7A         [ 3]  992         ldaa    (0x007A)
   87B0 8A 01         [ 2]  993         oraa    #0x01
   87B2 36            [ 3]  994         psha
   87B3 96 AC         [ 3]  995         ldaa    (0x00AC)
   87B5 84 FB         [ 2]  996         anda    #0xFB
   87B7 97 AC         [ 3]  997         staa    (0x00AC)
   87B9 32            [ 4]  998         pula
   87BA 20 E1         [ 3]  999         bra     L879D
                           1000 
                           1001 ; SCC init, aux serial
   87BC                    1002 L87BC:
   87BC CE 87 D2      [ 3] 1003         ldx     #L87D2
   87BF                    1004 L87BF:
   87BF A6 00         [ 4] 1005         ldaa    0,X
   87C1 81 FF         [ 2] 1006         cmpa    #0xFF
   87C3 27 0C         [ 3] 1007         beq     L87D1
   87C5 08            [ 3] 1008         inx
   87C6 B7 18 0D      [ 4] 1009         staa    SCCCTRLA
   87C9 A6 00         [ 4] 1010         ldaa    0,X
   87CB 08            [ 3] 1011         inx
   87CC B7 18 0D      [ 4] 1012         staa    SCCCTRLA
   87CF 20 EE         [ 3] 1013         bra     L87BF
   87D1                    1014 L87D1:
   87D1 39            [ 5] 1015         rts
                           1016 
                           1017 ; data table for aux serial config
   87D2                    1018 L87D2:
   87D2 09 8A              1019         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   87D4 01 00              1020         .byte   0x01,0x00       ; irq on special condition only
   87D6 0C 18              1021         .byte   0x0c,0x18       ; Lower byte of time constant
   87D8 0D 00              1022         .byte   0x0d,0x00       ; Upper byte of time constant
   87DA 04 44              1023         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   87DC 0E 63              1024         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   87DE 05 68              1025         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   87E0 0B 56              1026         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   87E2 03 C1              1027         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           1028         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           1029         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   87E4 0F 00              1030         .byte   0x0f,0x00       ; end of table marker
   87E6 FF FF              1031         .byte   0xff,0xff
                           1032 
                           1033 ; SCC init, sync tape data
   87E8                    1034 L87E8:
   87E8 CE F8 57      [ 3] 1035         ldx     #LF857
   87EB                    1036 L87EB:
   87EB A6 00         [ 4] 1037         ldaa    0,X
   87ED 81 FF         [ 2] 1038         cmpa    #0xFF
   87EF 27 0C         [ 3] 1039         beq     L87FD
   87F1 08            [ 3] 1040         inx
   87F2 B7 18 0C      [ 4] 1041         staa    SCCCTRLB
   87F5 A6 00         [ 4] 1042         ldaa    0,X
   87F7 08            [ 3] 1043         inx
   87F8 B7 18 0C      [ 4] 1044         staa    SCCCTRLB
   87FB 20 EE         [ 3] 1045         bra     L87EB
   87FD                    1046 L87FD:
   87FD 20 16         [ 3] 1047         bra     L8815
                           1048 
                           1049 ; data table for sync tape data config
   87FF 09 8A              1050         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   8801 01 10              1051         .byte   0x01,0x10       ; irq on all character received
   8803 0C 18              1052         .byte   0x0c,0x18       ; Lower byte of time constant
   8805 0D 00              1053         .byte   0x0d,0x00       ; Upper byte of time constant
   8807 04 04              1054         .byte   0x04,0x04       ; X1 clock mode, 8-bit sync char, 1 stop bit, no parity
   8809 0E 63              1055         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   880B 05 68              1056         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   880D 0B 01              1057         .byte   0x0b,0x01       ; ~RTxC pin is Recv/Xmit clock, ~TRxC is xmit clk
   880F 03 C1              1058         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
   8811 0F 00              1059         .byte   0x0f,0x00       ; end of table marker
   8813 FF FF              1060         .byte   0xff,0xff
                           1061 
                           1062 ; Install IRQ and SCI interrupt handlers
   8815                    1063 L8815:
   8815 CE 88 3E      [ 3] 1064         ldx     #L883E          ; Install IRQ interrupt handler
   8818 FF 01 28      [ 5] 1065         stx     (0x0128)
   881B 86 7E         [ 2] 1066         ldaa    #0x7E
   881D B7 01 27      [ 4] 1067         staa    (0x0127)
   8820 CE 88 32      [ 3] 1068         ldx     #L8832          ; Install SCI interrupt handler
   8823 FF 01 01      [ 5] 1069         stx     (0x0101)
   8826 B7 01 00      [ 4] 1070         staa    (0x0100)
   8829 B6 10 2D      [ 4] 1071         ldaa    SCCR2           ; enable SCI receive interrupts
   882C 8A 20         [ 2] 1072         oraa    #0x20
   882E B7 10 2D      [ 4] 1073         staa    SCCR2  
   8831 39            [ 5] 1074         rts
                           1075 
                           1076 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1077 
                           1078 ; SCI Interrupt handler, normal serial
                           1079 
   8832                    1080 L8832:
   8832 B6 10 2E      [ 4] 1081         ldaa    SCSR
   8835 B6 10 2F      [ 4] 1082         ldaa    SCDR
   8838 7C 00 48      [ 6] 1083         inc     (0x0048)        ; increment bytes received
   883B 7E 88 62      [ 3] 1084         jmp     L8862           ; handle incoming data the same from SCI or SCC
                           1085 
                           1086 ; IRQ Interrupt handler, aux serial
                           1087 
   883E                    1088 L883E:
   883E 86 01         [ 2] 1089         ldaa    #0x01
   8840 B7 18 0C      [ 4] 1090         staa    SCCCTRLB
   8843 B6 18 0C      [ 4] 1091         ldaa    SCCCTRLB        ; read 3 error bits
   8846 84 70         [ 2] 1092         anda    #0x70
   8848 26 1F         [ 3] 1093         bne     L8869           ; if errors, jump ahead
   884A 86 0A         [ 2] 1094         ldaa    #0x0A
   884C B7 18 0C      [ 4] 1095         staa    SCCCTRLB
   884F B6 18 0C      [ 4] 1096         ldaa    SCCCTRLB        ; read clocks missing bits
   8852 84 C0         [ 2] 1097         anda    #0xC0
   8854 26 22         [ 3] 1098         bne     L8878           ; clocks missing, jump ahead
   8856 B6 18 0C      [ 4] 1099         ldaa    SCCCTRLB        ; check character available
   8859 44            [ 2] 1100         lsra
   885A 24 35         [ 3] 1101         bcc     L8891           ; if no char available, clear register and exit
   885C 7C 00 48      [ 6] 1102         inc     (0x0048)        ; increment bytes received
   885F B6 18 0E      [ 4] 1103         ldaa    SCCDATAB        ; read good data byte
                           1104 
                           1105 ; handle incoming data byte
   8862                    1106 L8862:
   8862 BD F9 6F      [ 6] 1107         jsr     SERIALW         ; echo it to serial
   8865 97 4A         [ 3] 1108         staa    (0x004A)        ; store it here
   8867 20 2D         [ 3] 1109         bra     L8896
                           1110 
                           1111 ; errors reading from SCC
   8869                    1112 L8869:
   8869 B6 18 0E      [ 4] 1113         ldaa    SCCDATAB        ; read bad byte
   886C 86 30         [ 2] 1114         ldaa    #0x30
   886E B7 18 0C      [ 4] 1115         staa    SCCCTRLB        ; send error reset (Register 0)
   8871 86 07         [ 2] 1116         ldaa    #0x07
   8873 BD F9 6F      [ 6] 1117         jsr     SERIALW         ; send bell to serial
   8876 0C            [ 2] 1118         clc
   8877 3B            [12] 1119         rti
                           1120 
                           1121 ; clocks missing?
   8878                    1122 L8878:
   8878 86 07         [ 2] 1123         ldaa    #0x07
   887A BD F9 6F      [ 6] 1124         jsr     SERIALW         ; send bell to serial
   887D 86 0E         [ 2] 1125         ldaa    #0x0E
   887F B7 18 0C      [ 4] 1126         staa    SCCCTRLB
   8882 86 43         [ 2] 1127         ldaa    #0x43
   8884 B7 18 0C      [ 4] 1128         staa    SCCCTRLB        ; send reset missing clock
   8887 B6 18 0E      [ 4] 1129         ldaa    SCCDATAB
   888A 86 07         [ 2] 1130         ldaa    #0x07
   888C BD F9 6F      [ 6] 1131         jsr     SERIALW         ; send 2nd bell to serial
   888F 0D            [ 2] 1132         sec
   8890 3B            [12] 1133         rti
                           1134 
                           1135 ; clear receive data reg and return
   8891                    1136 L8891:
   8891 B6 18 0E      [ 4] 1137         ldaa    SCCDATAB
   8894 0C            [ 2] 1138         clc
   8895 3B            [12] 1139         rti
                           1140 
                           1141 ; Parse byte from tape
   8896                    1142 L8896:
   8896 84 7F         [ 2] 1143         anda    #0x7F           ; should all be 7-bits, ignore bit 7
   8898 81 24         [ 2] 1144         cmpa    #0x24           ;'$'
   889A 27 44         [ 3] 1145         beq     L88E0           ; count it and exit
   889C 81 25         [ 2] 1146         cmpa    #0x25           ;'%'
   889E 27 40         [ 3] 1147         beq     L88E0           ; count it and exit
   88A0 81 20         [ 2] 1148         cmpa    #0x20           ;' '
   88A2 27 3A         [ 3] 1149         beq     L88DE           ; just exit
   88A4 81 30         [ 2] 1150         cmpa    #0x30           ;'0'
   88A6 25 35         [ 3] 1151         bcs     L88DD           ; < 0x30, exit
   88A8 97 12         [ 3] 1152         staa    (0x0012)        ; store it here
   88AA 96 4D         [ 3] 1153         ldaa    (0x004D)        ; check number of '$' or '%'
   88AC 81 02         [ 2] 1154         cmpa    #0x02
   88AE 25 09         [ 3] 1155         bcs     L88B9           ; < 2, jump ahead
   88B0 7F 00 4D      [ 6] 1156         clr     (0x004D)        ; clear number of '$' or '%'
   88B3 96 12         [ 3] 1157         ldaa    (0x0012)
   88B5 97 49         [ 3] 1158         staa    (0x0049)        ; store the character here - character is 0x30 or higher
   88B7 20 24         [ 3] 1159         bra     L88DD           ; exit
   88B9                    1160 L88B9:
   88B9 7D 00 4E      [ 6] 1161         tst     (0x004E)        ; is 4E 0??? (related to random motions?)
   88BC 27 1F         [ 3] 1162         beq     L88DD           ; if so, exit
   88BE 86 78         [ 2] 1163         ldaa    #0x78           ; 120
   88C0 97 63         [ 3] 1164         staa    (0x0063)        ; start 12 second timer
   88C2 97 64         [ 3] 1165         staa    (0x0064)        ; reset boards before next random motion
   88C4 96 12         [ 3] 1166         ldaa    (0x0012)
   88C6 81 40         [ 2] 1167         cmpa    #0x40
   88C8 24 07         [ 3] 1168         bcc     L88D1           ; if char >= 0x40, jump ahead
   88CA 97 4C         [ 3] 1169         staa    (0x004C)        ; store code from 0x30 to 0x3F here
   88CC 7F 00 4D      [ 6] 1170         clr     (0x004D)        ; more code to process
   88CF 20 0C         [ 3] 1171         bra     L88DD           ; go to rti
   88D1                    1172 L88D1:
   88D1 81 60         [ 2] 1173         cmpa    #0x60       
   88D3 24 08         [ 3] 1174         bcc     L88DD           ; if char >= 0x60, exit
   88D5 97 4B         [ 3] 1175         staa    (0x004B)        ; store code from 0x40 to 0x5F here
   88D7 7F 00 4D      [ 6] 1176         clr     (0x004D)        ; more code to process
   88DA BD 88 E5      [ 6] 1177         jsr     L88E5           ; jump ahead
   88DD                    1178 L88DD:
   88DD 3B            [12] 1179         rti
                           1180 
   88DE                    1181 L88DE:
   88DE 20 FD         [ 3] 1182         bra     L88DD           ; go to rti
   88E0                    1183 L88E0:
   88E0 7C 00 4D      [ 6] 1184         inc     (0x004D)        ; count $ or %
   88E3 20 F9         [ 3] 1185         bra     L88DE           ; exit
   88E5                    1186 L88E5:
   88E5 D6 4B         [ 3] 1187         ldab    (0x004B)        
   88E7 96 4C         [ 3] 1188         ldaa    (0x004C)
   88E9 7D 04 5C      [ 6] 1189         tst     (0x045C)        ; R12/CNR?
   88EC 27 0D         [ 3] 1190         beq     L88FB           ; if R12, jump ahead
   88EE 81 3C         [ 2] 1191         cmpa    #0x3C
   88F0 25 09         [ 3] 1192         bcs     L88FB           ; if char < 0x3C, jump ahead
   88F2 81 3F         [ 2] 1193         cmpa    #0x3F
   88F4 22 05         [ 3] 1194         bhi     L88FB           ; if char > 0x3F, jump ahead 
   88F6 BD 89 93      [ 6] 1195         jsr     L8993           ; process char (0x3C-0x3F)
   88F9 20 65         [ 3] 1196         bra     L8960           ; rts
   88FB                    1197 L88FB:
   88FB 1A 83 30 48   [ 5] 1198         cpd     #0x3048
   88FF 27 79         [ 3] 1199         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8901 1A 83 31 48   [ 5] 1200         cpd     #0x3148
   8905 27 5A         [ 3] 1201         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8907 1A 83 34 4D   [ 5] 1202         cpd     #0x344D
   890B 27 6D         [ 3] 1203         beq     L897A           ; turn off 3 bits on boards 1,3,4
   890D 1A 83 35 4D   [ 5] 1204         cpd     #0x354D
   8911 27 4E         [ 3] 1205         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8913 1A 83 36 4D   [ 5] 1206         cpd     #0x364D
   8917 27 61         [ 3] 1207         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8919 1A 83 37 4D   [ 5] 1208         cpd     #0x374D
   891D 27 42         [ 3] 1209         beq     L8961           ; turn on 3 bits on boards 1,3,4
   891F CE 10 80      [ 3] 1210         ldx     #0x1080
   8922 D6 4C         [ 3] 1211         ldab    (0x004C)
   8924 C0 30         [ 2] 1212         subb    #0x30
   8926 54            [ 2] 1213         lsrb
   8927 58            [ 2] 1214         aslb
   8928 58            [ 2] 1215         aslb
   8929 3A            [ 3] 1216         abx
   892A D6 4B         [ 3] 1217         ldab    (0x004B)
   892C C1 50         [ 2] 1218         cmpb    #0x50
   892E 24 30         [ 3] 1219         bcc     L8960           ; if char >= 0x50, return
   8930 C1 47         [ 2] 1220         cmpb    #0x47           
   8932 23 02         [ 3] 1221         bls     L8936           ; if char <= 0x47, skip increments
   8934 08            [ 3] 1222         inx                     ; skip to port B of this PIA
   8935 08            [ 3] 1223         inx
   8936                    1224 L8936:
   8936 C0 40         [ 2] 1225         subb    #0x40           ; 
   8938 C4 07         [ 2] 1226         andb    #0x07
   893A 4F            [ 2] 1227         clra
   893B 0D            [ 2] 1228         sec
   893C 49            [ 2] 1229         rola
   893D 5D            [ 2] 1230         tstb
   893E 27 04         [ 3] 1231         beq     L8944  
   8940                    1232 L8940:
   8940 49            [ 2] 1233         rola
   8941 5A            [ 2] 1234         decb
   8942 26 FC         [ 3] 1235         bne     L8940  
   8944                    1236 L8944:
   8944 97 50         [ 3] 1237         staa    (0x0050)
   8946 96 4C         [ 3] 1238         ldaa    (0x004C)
   8948 84 01         [ 2] 1239         anda    #0x01
   894A 27 08         [ 3] 1240         beq     L8954
                           1241 ; set bit to a 1 using the mask
   894C A6 00         [ 4] 1242         ldaa    0,X
   894E 9A 50         [ 3] 1243         oraa    (0x0050)
   8950 A7 00         [ 4] 1244         staa    0,X
   8952 20 0C         [ 3] 1245         bra     L8960
                           1246 ; set bit to 0 using the mask
   8954                    1247 L8954:
   8954 96 50         [ 3] 1248         ldaa    (0x0050)
   8956 88 FF         [ 2] 1249         eora    #0xFF
   8958 97 50         [ 3] 1250         staa    (0x0050)
   895A A6 00         [ 4] 1251         ldaa    0,X
   895C 94 50         [ 3] 1252         anda    (0x0050)
   895E A7 00         [ 4] 1253         staa    0,X
   8960                    1254 L8960:
   8960 39            [ 5] 1255         rts
                           1256 
                           1257 ; turn on 3 bits on boards 1,3,4
   8961                    1258 L8961:
   8961 B6 10 82      [ 4] 1259         ldaa    (0x1082)
   8964 8A 01         [ 2] 1260         oraa    #0x01           ; board 1, PIA A, bit 0
   8966 B7 10 82      [ 4] 1261         staa    (0x1082)
   8969 B6 10 8A      [ 4] 1262         ldaa    (0x108A)
   896C 8A 20         [ 2] 1263         oraa    #0x20           ; board 3, PIA B, bit 5
   896E B7 10 8A      [ 4] 1264         staa    (0x108A)
   8971 B6 10 8E      [ 4] 1265         ldaa    (0x108E)        ; board 4, PIA B, bit 5
   8974 8A 20         [ 2] 1266         oraa    #0x20
   8976 B7 10 8E      [ 4] 1267         staa    (0x108E)
   8979 39            [ 5] 1268         rts
                           1269 
                           1270 ; turn off 3 bits on boards 1,3,4
   897A                    1271 L897A:
   897A B6 10 82      [ 4] 1272         ldaa    (0x1082)
   897D 84 FE         [ 2] 1273         anda    #0xFE
   897F B7 10 82      [ 4] 1274         staa    (0x1082)
   8982 B6 10 8A      [ 4] 1275         ldaa    (0x108A)
   8985 84 DF         [ 2] 1276         anda    #0xDF
   8987 B7 10 8A      [ 4] 1277         staa    (0x108A)
   898A B6 10 8E      [ 4] 1278         ldaa    (0x108E)
   898D 84 DF         [ 2] 1279         anda    #0xDF
   898F B7 10 8E      [ 4] 1280         staa    (0x108E)
   8992 39            [ 5] 1281         rts
                           1282 
                           1283 ; process 0x3C-0x3F in CNR mode
   8993                    1284 L8993:
   8993 3C            [ 4] 1285         pshx
   8994 81 3D         [ 2] 1286         cmpa    #0x3D
   8996 22 05         [ 3] 1287         bhi     L899D           ; if char > 0x3D use second table
   8998 CE F7 80      [ 3] 1288         ldx     #LF780          ; table at the end
   899B 20 03         [ 3] 1289         bra     L89A0           ; else use first table
   899D                    1290 L899D:
   899D CE F7 A0      [ 3] 1291         ldx     #LF7A0          ; table at the end
   89A0                    1292 L89A0:
   89A0 C0 40         [ 2] 1293         subb    #0x40           
   89A2 58            [ 2] 1294         aslb
   89A3 3A            [ 3] 1295         abx
   89A4 81 3C         [ 2] 1296         cmpa    #0x3C
   89A6 27 34         [ 3] 1297         beq     L89DC           ; board 7 - turn off A & B with table value mask 
   89A8 81 3D         [ 2] 1298         cmpa    #0x3D
   89AA 27 0A         [ 3] 1299         beq     L89B6           ; board 7 - turn on A & B with table value mask
   89AC 81 3E         [ 2] 1300         cmpa    #0x3E
   89AE 27 4B         [ 3] 1301         beq     L89FB           ; board 8 - turn off A & B with table value mask 
   89B0 81 3F         [ 2] 1302         cmpa    #0x3F
   89B2 27 15         [ 3] 1303         beq     L89C9           ; board 8 - turn on A & B with table value mask
   89B4 38            [ 5] 1304         pulx
   89B5 39            [ 5] 1305         rts
                           1306 
                           1307 ; board 7 - turn on A & B with table value mask
   89B6                    1308 L89B6:
   89B6 B6 10 98      [ 4] 1309         ldaa    (0x1098)
   89B9 AA 00         [ 4] 1310         oraa    0,X
   89BB B7 10 98      [ 4] 1311         staa    (0x1098)
   89BE 08            [ 3] 1312         inx
   89BF B6 10 9A      [ 4] 1313         ldaa    (0x109A)
   89C2 AA 00         [ 4] 1314         oraa    0,X
   89C4 B7 10 9A      [ 4] 1315         staa    (0x109A)
   89C7 38            [ 5] 1316         pulx
   89C8 39            [ 5] 1317         rts
                           1318 
                           1319 ; board 8 - turn on A & B with table value mask
   89C9                    1320 L89C9:
   89C9 B6 10 9C      [ 4] 1321         ldaa    (0x109C)
   89CC AA 00         [ 4] 1322         oraa    0,X
   89CE B7 10 9C      [ 4] 1323         staa    (0x109C)
   89D1 08            [ 3] 1324         inx
   89D2 B6 10 9E      [ 4] 1325         ldaa    (0x109E)
   89D5 AA 00         [ 4] 1326         oraa    0,X
   89D7 B7 10 9E      [ 4] 1327         staa    (0x109E)
   89DA 38            [ 5] 1328         pulx
   89DB 39            [ 5] 1329         rts
                           1330 
                           1331 ; board 7 - turn off A & B with table value mask
   89DC                    1332 L89DC:
   89DC E6 00         [ 4] 1333         ldab    0,X
   89DE C8 FF         [ 2] 1334         eorb    #0xFF
   89E0 D7 12         [ 3] 1335         stab    (0x0012)
   89E2 B6 10 98      [ 4] 1336         ldaa    (0x1098)
   89E5 94 12         [ 3] 1337         anda    (0x0012)
   89E7 B7 10 98      [ 4] 1338         staa    (0x1098)
   89EA 08            [ 3] 1339         inx
   89EB E6 00         [ 4] 1340         ldab    0,X
   89ED C8 FF         [ 2] 1341         eorb    #0xFF
   89EF D7 12         [ 3] 1342         stab    (0x0012)
   89F1 B6 10 9A      [ 4] 1343         ldaa    (0x109A)
   89F4 94 12         [ 3] 1344         anda    (0x0012)
   89F6 B7 10 9A      [ 4] 1345         staa    (0x109A)
   89F9 38            [ 5] 1346         pulx
   89FA 39            [ 5] 1347         rts
                           1348 
                           1349 ; board 8 - turn off A & B with table value mask
   89FB                    1350 L89FB:
   89FB E6 00         [ 4] 1351         ldab    0,X
   89FD C8 FF         [ 2] 1352         eorb    #0xFF
   89FF D7 12         [ 3] 1353         stab    (0x0012)
   8A01 B6 10 9C      [ 4] 1354         ldaa    (0x109C)
   8A04 94 12         [ 3] 1355         anda    (0x0012)
   8A06 B7 10 9C      [ 4] 1356         staa    (0x109C)
   8A09 08            [ 3] 1357         inx
   8A0A E6 00         [ 4] 1358         ldab    0,X
   8A0C C8 FF         [ 2] 1359         eorb    #0xFF
   8A0E D7 12         [ 3] 1360         stab    (0x0012)
   8A10 B6 10 9E      [ 4] 1361         ldaa    (0x109E)
   8A13 94 12         [ 3] 1362         anda    (0x0012)
   8A15 B7 10 9E      [ 4] 1363         staa    (0x109E)
   8A18 38            [ 5] 1364         pulx
   8A19 39            [ 5] 1365         rts
                           1366 
                           1367 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1368 
   8A1A                    1369 L8A1A:
                           1370 ; Parse text with compressed ANSI stuff from table location in X
   8A1A 3C            [ 4] 1371         pshx
   8A1B                    1372 L8A1B:
   8A1B 86 04         [ 2] 1373         ldaa    #0x04
   8A1D B5 18 0D      [ 4] 1374         bita    SCCCTRLA
   8A20 27 F9         [ 3] 1375         beq     L8A1B  
   8A22 A6 00         [ 4] 1376         ldaa    0,X     
   8A24 26 03         [ 3] 1377         bne     L8A29           ; if not nul, continue
   8A26 7E 8B 21      [ 3] 1378         jmp     L8B21           ; else jump to exit
                           1379 ; process ^0123 into ESC[01;23H - ANSI Cursor positioning - (1 based)
   8A29                    1380 L8A29:
   8A29 08            [ 3] 1381         inx
   8A2A 81 5E         [ 2] 1382         cmpa    #0x5E           ; is it a '^' ?
   8A2C 26 1D         [ 3] 1383         bne     L8A4B           ; no, jump ahead
   8A2E A6 00         [ 4] 1384         ldaa    0,X             ; yes, get the next char
   8A30 08            [ 3] 1385         inx
   8A31 B7 05 92      [ 4] 1386         staa    (0x0592)    
   8A34 A6 00         [ 4] 1387         ldaa    0,X     
   8A36 08            [ 3] 1388         inx
   8A37 B7 05 93      [ 4] 1389         staa    (0x0593)
   8A3A A6 00         [ 4] 1390         ldaa    0,X     
   8A3C 08            [ 3] 1391         inx
   8A3D B7 05 95      [ 4] 1392         staa    (0x0595)
   8A40 A6 00         [ 4] 1393         ldaa    0,X     
   8A42 08            [ 3] 1394         inx
   8A43 B7 05 96      [ 4] 1395         staa    (0x0596)
   8A46 BD 8B 23      [ 6] 1396         jsr     L8B23
   8A49 20 D0         [ 3] 1397         bra     L8A1B  
                           1398 ; process @...
   8A4B                    1399 L8A4B:
   8A4B 81 40         [ 2] 1400         cmpa    #0x40           ; is it a '@' ?
   8A4D 26 3B         [ 3] 1401         bne     L8A8A  
   8A4F 1A EE 00      [ 6] 1402         ldy     0,X
   8A52 08            [ 3] 1403         inx
   8A53 08            [ 3] 1404         inx
   8A54 86 30         [ 2] 1405         ldaa    #0x30
   8A56 97 B1         [ 3] 1406         staa    (0x00B1)
   8A58 18 A6 00      [ 5] 1407         ldaa    0,Y
   8A5B                    1408 L8A5B:
   8A5B 81 64         [ 2] 1409         cmpa    #0x64
   8A5D 25 07         [ 3] 1410         bcs     L8A66  
   8A5F 7C 00 B1      [ 6] 1411         inc     (0x00B1)
   8A62 80 64         [ 2] 1412         suba    #0x64
   8A64 20 F5         [ 3] 1413         bra     L8A5B  
   8A66                    1414 L8A66:
   8A66 36            [ 3] 1415         psha
   8A67 96 B1         [ 3] 1416         ldaa    (0x00B1)
   8A69 BD 8B 3B      [ 6] 1417         jsr     L8B3B
   8A6C 86 30         [ 2] 1418         ldaa    #0x30
   8A6E 97 B1         [ 3] 1419         staa    (0x00B1)
   8A70 32            [ 4] 1420         pula
   8A71                    1421 L8A71:
   8A71 81 0A         [ 2] 1422         cmpa    #0x0A
   8A73 25 07         [ 3] 1423         bcs     L8A7C  
   8A75 7C 00 B1      [ 6] 1424         inc     (0x00B1)
   8A78 80 0A         [ 2] 1425         suba    #0x0A
   8A7A 20 F5         [ 3] 1426         bra     L8A71  
   8A7C                    1427 L8A7C:
   8A7C 36            [ 3] 1428         psha
   8A7D 96 B1         [ 3] 1429         ldaa    (0x00B1)
   8A7F BD 8B 3B      [ 6] 1430         jsr     L8B3B
   8A82 32            [ 4] 1431         pula
   8A83 8B 30         [ 2] 1432         adda    #0x30
   8A85 BD 8B 3B      [ 6] 1433         jsr     L8B3B
   8A88 20 91         [ 3] 1434         bra     L8A1B
                           1435 ; process |...
   8A8A                    1436 L8A8A:
   8A8A 81 7C         [ 2] 1437         cmpa    #0x7C           ; is it a '|' ?
   8A8C 26 59         [ 3] 1438         bne     L8AE7  
   8A8E 1A EE 00      [ 6] 1439         ldy     0,X     
   8A91 08            [ 3] 1440         inx
   8A92 08            [ 3] 1441         inx
   8A93 86 30         [ 2] 1442         ldaa    #0x30
   8A95 97 B1         [ 3] 1443         staa    (0x00B1)
   8A97 18 EC 00      [ 6] 1444         ldd     0,Y     
   8A9A                    1445 L8A9A:
   8A9A 1A 83 27 10   [ 5] 1446         cpd     #0x2710
   8A9E 25 08         [ 3] 1447         bcs     L8AA8  
   8AA0 7C 00 B1      [ 6] 1448         inc     (0x00B1)
   8AA3 83 27 10      [ 4] 1449         subd    #0x2710
   8AA6 20 F2         [ 3] 1450         bra     L8A9A  
   8AA8                    1451 L8AA8:
   8AA8 36            [ 3] 1452         psha
   8AA9 96 B1         [ 3] 1453         ldaa    (0x00B1)
   8AAB BD 8B 3B      [ 6] 1454         jsr     L8B3B
   8AAE 86 30         [ 2] 1455         ldaa    #0x30
   8AB0 97 B1         [ 3] 1456         staa    (0x00B1)
   8AB2 32            [ 4] 1457         pula
   8AB3                    1458 L8AB3:
   8AB3 1A 83 03 E8   [ 5] 1459         cpd     #0x03E8
   8AB7 25 08         [ 3] 1460         bcs     L8AC1  
   8AB9 7C 00 B1      [ 6] 1461         inc     (0x00B1)
   8ABC 83 03 E8      [ 4] 1462         subd    #0x03E8
   8ABF 20 F2         [ 3] 1463         bra     L8AB3  
   8AC1                    1464 L8AC1:
   8AC1 36            [ 3] 1465         psha
   8AC2 96 B1         [ 3] 1466         ldaa    (0x00B1)
   8AC4 BD 8B 3B      [ 6] 1467         jsr     L8B3B
   8AC7 86 30         [ 2] 1468         ldaa    #0x30
   8AC9 97 B1         [ 3] 1469         staa    (0x00B1)
   8ACB 32            [ 4] 1470         pula
   8ACC                    1471 L8ACC:
   8ACC 1A 83 00 64   [ 5] 1472         cpd     #0x0064
   8AD0 25 08         [ 3] 1473         bcs     L8ADA  
   8AD2 7C 00 B1      [ 6] 1474         inc     (0x00B1)
   8AD5 83 00 64      [ 4] 1475         subd    #0x0064
   8AD8 20 F2         [ 3] 1476         bra     L8ACC  
   8ADA                    1477 L8ADA:
   8ADA 96 B1         [ 3] 1478         ldaa    (0x00B1)
   8ADC BD 8B 3B      [ 6] 1479         jsr     L8B3B
   8ADF 86 30         [ 2] 1480         ldaa    #0x30
   8AE1 97 B1         [ 3] 1481         staa    (0x00B1)
   8AE3 17            [ 2] 1482         tba
   8AE4 7E 8A 71      [ 3] 1483         jmp     L8A71
                           1484 ; process ~...
   8AE7                    1485 L8AE7:
   8AE7 81 7E         [ 2] 1486         cmpa    #0x7E           ; is it a '~' ?
   8AE9 26 18         [ 3] 1487         bne     L8B03  
   8AEB E6 00         [ 4] 1488         ldab    0,X     
   8AED C0 30         [ 2] 1489         subb    #0x30
   8AEF 08            [ 3] 1490         inx
   8AF0 1A EE 00      [ 6] 1491         ldy     0,X     
   8AF3 08            [ 3] 1492         inx
   8AF4 08            [ 3] 1493         inx
   8AF5                    1494 L8AF5:
   8AF5 18 A6 00      [ 5] 1495         ldaa    0,Y     
   8AF8 18 08         [ 4] 1496         iny
   8AFA BD 8B 3B      [ 6] 1497         jsr     L8B3B
   8AFD 5A            [ 2] 1498         decb
   8AFE 26 F5         [ 3] 1499         bne     L8AF5  
   8B00 7E 8A 1B      [ 3] 1500         jmp     L8A1B
                           1501 ; process %...
   8B03                    1502 L8B03:
   8B03 81 25         [ 2] 1503         cmpa    #0x25           ; is it a '%' ?
   8B05 26 14         [ 3] 1504         bne     L8B1B  
   8B07 CE 05 90      [ 3] 1505         ldx     #0x0590
   8B0A CC 1B 5B      [ 3] 1506         ldd     #0x1B5B
   8B0D ED 00         [ 5] 1507         std     0,X     
   8B0F 86 4B         [ 2] 1508         ldaa    #0x4B
   8B11 A7 02         [ 4] 1509         staa    2,X
   8B13 6F 03         [ 6] 1510         clr     3,X
   8B15 BD 8A 1A      [ 6] 1511         jsr     L8A1A  
   8B18 7E 8A 1B      [ 3] 1512         jmp     L8A1B
   8B1B                    1513 L8B1B:
   8B1B B7 18 0F      [ 4] 1514         staa    SCCDATAA
   8B1E 7E 8A 1B      [ 3] 1515         jmp     L8A1B
   8B21                    1516 L8B21:
   8B21 38            [ 5] 1517         pulx
   8B22 39            [ 5] 1518         rts
                           1519 
                           1520 ; generate cursor positioning code
   8B23                    1521 L8B23:
   8B23 3C            [ 4] 1522         pshx
   8B24 CE 05 90      [ 3] 1523         ldx     #0x0590
   8B27 CC 1B 5B      [ 3] 1524         ldd     #0x1B5B
   8B2A ED 00         [ 5] 1525         std     0,X     
   8B2C 86 48         [ 2] 1526         ldaa    #0x48           ;'H'
   8B2E A7 07         [ 4] 1527         staa    7,X
   8B30 86 3B         [ 2] 1528         ldaa    #0x3B           ;';'
   8B32 A7 04         [ 4] 1529         staa    4,X
   8B34 6F 08         [ 6] 1530         clr     8,X
   8B36 BD 8A 1A      [ 6] 1531         jsr     L8A1A           ;012345678 - esc[01;23H;
   8B39 38            [ 5] 1532         pulx
   8B3A 39            [ 5] 1533         rts
                           1534 
                           1535 ;
   8B3B                    1536 L8B3B:
   8B3B 36            [ 3] 1537         psha
   8B3C                    1538 L8B3C:
   8B3C 86 04         [ 2] 1539         ldaa    #0x04
   8B3E B5 18 0D      [ 4] 1540         bita    SCCCTRLA
   8B41 27 F9         [ 3] 1541         beq     L8B3C
   8B43 32            [ 4] 1542         pula
   8B44 B7 18 0F      [ 4] 1543         staa    SCCDATAA
   8B47 39            [ 5] 1544         rts
                           1545 
   8B48                    1546 L8B48:
   8B48 BD A3 2E      [ 6] 1547         jsr     LA32E
                           1548 
   8B4B BD 8D E4      [ 6] 1549         jsr     LCDMSG1 
   8B4E 4C 69 67 68 74 20  1550         .ascis  'Light Diagnostic'
        44 69 61 67 6E 6F
        73 74 69 E3
                           1551 
   8B5E BD 8D DD      [ 6] 1552         jsr     LCDMSG2 
   8B61 43 75 72 74 61 69  1553         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           1554 
   8B71 C6 14         [ 2] 1555         ldab    #0x14
   8B73 BD 8C 30      [ 6] 1556         jsr     DLYSECSBY2      ; delay 10 sec
   8B76 C6 FF         [ 2] 1557         ldab    #0xFF
   8B78 F7 10 98      [ 4] 1558         stab    (0x1098)
   8B7B F7 10 9A      [ 4] 1559         stab    (0x109A)
   8B7E F7 10 9C      [ 4] 1560         stab    (0x109C)
   8B81 F7 10 9E      [ 4] 1561         stab    (0x109E)
   8B84 BD F9 C5      [ 6] 1562         jsr     BUTNLIT 
   8B87 B6 18 04      [ 4] 1563         ldaa    PIA0PRA 
   8B8A 8A 40         [ 2] 1564         oraa    #0x40
   8B8C B7 18 04      [ 4] 1565         staa    PIA0PRA 
                           1566 
   8B8F BD 8D E4      [ 6] 1567         jsr     LCDMSG1 
   8B92 20 50 72 65 73 73  1568         .ascis  ' Press ENTER to '
        20 45 4E 54 45 52
        20 74 6F A0
                           1569 
   8BA2 BD 8D DD      [ 6] 1570         jsr     LCDMSG2 
   8BA5 74 75 72 6E 20 6C  1571         .ascis  'turn lights  off'
        69 67 68 74 73 20
        20 6F 66 E6
                           1572 
   8BB5                    1573 L8BB5:
   8BB5 BD 8E 95      [ 6] 1574         jsr     L8E95
   8BB8 81 0D         [ 2] 1575         cmpa    #0x0D
   8BBA 26 F9         [ 3] 1576         bne     L8BB5  
   8BBC BD A3 41      [ 6] 1577         jsr     LA341
   8BBF 39            [ 5] 1578         rts
                           1579 
                           1580 ; setup IRQ handlers!
   8BC0                    1581 L8BC0:
   8BC0 86 80         [ 2] 1582         ldaa    #0x80
   8BC2 B7 10 22      [ 4] 1583         staa    TMSK1
   8BC5 CE AB CC      [ 3] 1584         ldx     #LABCC
   8BC8 FF 01 19      [ 5] 1585         stx     (0x0119)        ; setup T1OC handler
   8BCB CE AD 0C      [ 3] 1586         ldx     #LAD0C
                           1587 
   8BCE FF 01 16      [ 5] 1588         stx     (0x0116)        ; setup T2OC handler
   8BD1 CE AD 0C      [ 3] 1589         ldx     #LAD0C
   8BD4 FF 01 2E      [ 5] 1590         stx     (0x012E)        ; doubles as SWI handler
   8BD7 86 7E         [ 2] 1591         ldaa    #0x7E
   8BD9 B7 01 18      [ 4] 1592         staa    (0x0118)
   8BDC B7 01 15      [ 4] 1593         staa    (0x0115)
   8BDF B7 01 2D      [ 4] 1594         staa    (0x012D)
   8BE2 4F            [ 2] 1595         clra
   8BE3 5F            [ 2] 1596         clrb
   8BE4 DD 1B         [ 4] 1597         std     CDTIMR1         ; Reset all the countdown timers
   8BE6 DD 1D         [ 4] 1598         std     CDTIMR2
   8BE8 DD 1F         [ 4] 1599         std     CDTIMR3
   8BEA DD 21         [ 4] 1600         std     CDTIMR4
   8BEC DD 23         [ 4] 1601         std     CDTIMR5
                           1602 
   8BEE                    1603 L8BEE:
   8BEE 86 C0         [ 2] 1604         ldaa    #0xC0
   8BF0 B7 10 23      [ 4] 1605         staa    TFLG1
   8BF3 39            [ 5] 1606         rts
                           1607 
   8BF4                    1608 L8BF4:
   8BF4 B6 10 0A      [ 4] 1609         ldaa    PORTE
   8BF7 88 FF         [ 2] 1610         eora    #0xFF
   8BF9 16            [ 2] 1611         tab
   8BFA D7 62         [ 3] 1612         stab    (0x0062)
   8BFC BD F9 C5      [ 6] 1613         jsr     BUTNLIT 
   8BFF 20 F3         [ 3] 1614         bra     L8BF4  
   8C01 39            [ 5] 1615         rts
                           1616 
                           1617 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1618 
                           1619 ; Delay B seconds, with random motions if enabled
   8C02                    1620 DLYSECS:
   8C02 36            [ 3] 1621         psha
   8C03 86 64         [ 2] 1622         ldaa    #0x64
   8C05 3D            [10] 1623         mul
   8C06 DD 23         [ 4] 1624         std     CDTIMR5         ; store B*100 here
   8C08                    1625 L8C08:
   8C08 BD 9B 19      [ 6] 1626         jsr     L9B19           ; do the random motions if enabled
   8C0B DC 23         [ 4] 1627         ldd     CDTIMR5
   8C0D 26 F9         [ 3] 1628         bne     L8C08  
   8C0F 32            [ 4] 1629         pula
   8C10 39            [ 5] 1630         rts
                           1631 
                           1632 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1633 
                           1634 ; Delay 1 minute, with random motions if enabled - unused?
   8C11                    1635 DLY1MIN:
   8C11 36            [ 3] 1636         psha
   8C12 86 3C         [ 2] 1637         ldaa    #0x3C
   8C14                    1638 L8C14:
   8C14 97 28         [ 3] 1639         staa    (0x0028)
   8C16 C6 01         [ 2] 1640         ldab    #0x01           ; delay 1 sec
   8C18 BD 8C 02      [ 6] 1641         jsr     DLYSECS         ;
   8C1B 96 28         [ 3] 1642         ldaa    (0x0028)
   8C1D 4A            [ 2] 1643         deca
   8C1E 26 F4         [ 3] 1644         bne     L8C14  
   8C20 32            [ 4] 1645         pula
   8C21 39            [ 5] 1646         rts
                           1647 
                           1648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1649 
                           1650 ; Delay by B hundreths of a second, with random motions if enabled
   8C22                    1651 DLYSECSBY100:
   8C22 36            [ 3] 1652         psha
   8C23 4F            [ 2] 1653         clra
   8C24 DD 23         [ 4] 1654         std     CDTIMR5
   8C26                    1655 L8C26:
   8C26 BD 9B 19      [ 6] 1656         jsr     L9B19           ; do the random motions if enabled
   8C29 7D 00 24      [ 6] 1657         tst     CDTIMR5+1
   8C2C 26 F8         [ 3] 1658         bne     L8C26
   8C2E 32            [ 4] 1659         pula
   8C2F 39            [ 5] 1660         rts
                           1661 
                           1662 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1663 
                           1664 ; Delay by B half-seconds
   8C30                    1665 DLYSECSBY2:
   8C30 36            [ 3] 1666         psha
   8C31 86 32         [ 2] 1667         ldaa    #0x32           ; 50
   8C33 3D            [10] 1668         mul
   8C34 DD 23         [ 4] 1669         std     CDTIMR5
   8C36                    1670 L8C36:
   8C36 DC 23         [ 4] 1671         ldd     CDTIMR5
   8C38 26 FC         [ 3] 1672         bne     L8C36
   8C3A 32            [ 4] 1673         pula
   8C3B 39            [ 5] 1674         rts
                           1675 
                           1676 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1677 ; LCD routines
                           1678 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1679 
   8C3C                    1680 L8C3C:
   8C3C 86 FF         [ 2] 1681         ldaa    #0xFF
   8C3E B7 10 01      [ 4] 1682         staa    DDRA  
   8C41 86 FF         [ 2] 1683         ldaa    #0xFF
   8C43 B7 10 03      [ 4] 1684         staa    DDRG 
   8C46 B6 10 02      [ 4] 1685         ldaa    PORTG  
   8C49 8A 02         [ 2] 1686         oraa    #0x02
   8C4B B7 10 02      [ 4] 1687         staa    PORTG  
   8C4E 86 38         [ 2] 1688         ldaa    #0x38
   8C50 BD 8C 86      [ 6] 1689         jsr     L8C86           ; write byte to LCD
   8C53 86 38         [ 2] 1690         ldaa    #0x38
   8C55 BD 8C 86      [ 6] 1691         jsr     L8C86           ; write byte to LCD
   8C58 86 06         [ 2] 1692         ldaa    #0x06
   8C5A BD 8C 86      [ 6] 1693         jsr     L8C86           ; write byte to LCD
   8C5D 86 0E         [ 2] 1694         ldaa    #0x0E
   8C5F BD 8C 86      [ 6] 1695         jsr     L8C86           ; write byte to LCD
   8C62 86 01         [ 2] 1696         ldaa    #0x01
   8C64 BD 8C 86      [ 6] 1697         jsr     L8C86           ; write byte to LCD
   8C67 CE 00 FF      [ 3] 1698         ldx     #0x00FF
   8C6A                    1699 L8C6A:
   8C6A 01            [ 2] 1700         nop
   8C6B 01            [ 2] 1701         nop
   8C6C 09            [ 3] 1702         dex
   8C6D 26 FB         [ 3] 1703         bne     L8C6A  
   8C6F 39            [ 5] 1704         rts
                           1705 
                           1706 ; toggle LCD ENABLE
   8C70                    1707 L8C70:
   8C70 B6 10 02      [ 4] 1708         ldaa    PORTG  
   8C73 84 FD         [ 2] 1709         anda    #0xFD           ; clear LCD ENABLE
   8C75 B7 10 02      [ 4] 1710         staa    PORTG  
   8C78 8A 02         [ 2] 1711         oraa    #0x02           ; set LCD ENABLE
   8C7A B7 10 02      [ 4] 1712         staa    PORTG  
   8C7D 39            [ 5] 1713         rts
                           1714 
                           1715 ; Reset LCD buffer?
   8C7E                    1716 L8C7E:
   8C7E CC 05 00      [ 3] 1717         ldd     #0x0500         ; Reset LCD queue?
   8C81 DD 46         [ 4] 1718         std     (0x0046)        ; write pointer
   8C83 DD 44         [ 4] 1719         std     (0x0044)        ; read pointer?
   8C85 39            [ 5] 1720         rts
                           1721 
                           1722 ; write byte to LCD
   8C86                    1723 L8C86:
   8C86 BD 8C BD      [ 6] 1724         jsr     L8CBD           ; wait for LCD not busy
   8C89 B7 10 00      [ 4] 1725         staa    PORTA  
   8C8C B6 10 02      [ 4] 1726         ldaa    PORTG       
   8C8F 84 F3         [ 2] 1727         anda    #0xF3           ; LCD RS and LCD RW low
   8C91                    1728 L8C91:
   8C91 B7 10 02      [ 4] 1729         staa    PORTG  
   8C94 BD 8C 70      [ 6] 1730         jsr     L8C70           ; toggle LCD ENABLE
   8C97 39            [ 5] 1731         rts
                           1732 
                           1733 ; ???
   8C98                    1734 L8C98:
   8C98 BD 8C BD      [ 6] 1735         jsr     L8CBD           ; wait for LCD not busy
   8C9B B7 10 00      [ 4] 1736         staa    PORTA  
   8C9E B6 10 02      [ 4] 1737         ldaa    PORTG  
   8CA1 84 FB         [ 2] 1738         anda    #0xFB
   8CA3 8A 08         [ 2] 1739         oraa    #0x08
   8CA5 20 EA         [ 3] 1740         bra     L8C91  
   8CA7 BD 8C BD      [ 6] 1741         jsr     L8CBD           ; wait for LCD not busy
   8CAA B6 10 02      [ 4] 1742         ldaa    PORTG  
   8CAD 84 F7         [ 2] 1743         anda    #0xF7
   8CAF 8A 08         [ 2] 1744         oraa    #0x08
   8CB1 20 DE         [ 3] 1745         bra     L8C91  
   8CB3 BD 8C BD      [ 6] 1746         jsr     L8CBD           ; wait for LCD not busy
   8CB6 B6 10 02      [ 4] 1747         ldaa    PORTG  
   8CB9 8A 0C         [ 2] 1748         oraa    #0x0C
   8CBB 20 D4         [ 3] 1749         bra     L8C91  
                           1750 
                           1751 ; wait for LCD not busy (or timeout)
   8CBD                    1752 L8CBD:
   8CBD 36            [ 3] 1753         psha
   8CBE 37            [ 3] 1754         pshb
   8CBF C6 FF         [ 2] 1755         ldab    #0xFF           ; init timeout counter
   8CC1                    1756 L8CC1:
   8CC1 5D            [ 2] 1757         tstb
   8CC2 27 1A         [ 3] 1758         beq     L8CDE           ; times up, exit
   8CC4 B6 10 02      [ 4] 1759         ldaa    PORTG  
   8CC7 84 F7         [ 2] 1760         anda    #0xF7           ; bit 3 low
   8CC9 8A 04         [ 2] 1761         oraa    #0x04           ; bit 3 high
   8CCB B7 10 02      [ 4] 1762         staa    PORTG           ; LCD RS high
   8CCE BD 8C 70      [ 6] 1763         jsr     L8C70           ; toggle LCD ENABLE
   8CD1 7F 10 01      [ 6] 1764         clr     DDRA  
   8CD4 B6 10 00      [ 4] 1765         ldaa    PORTA           ; read busy flag from LCD
   8CD7 2B 08         [ 3] 1766         bmi     L8CE1           ; if busy, keep looping
   8CD9 86 FF         [ 2] 1767         ldaa    #0xFF
   8CDB B7 10 01      [ 4] 1768         staa    DDRA            ; port A back to outputs
   8CDE                    1769 L8CDE:
   8CDE 33            [ 4] 1770         pulb                    ; and exit
   8CDF 32            [ 4] 1771         pula
   8CE0 39            [ 5] 1772         rts
                           1773 
   8CE1                    1774 L8CE1:
   8CE1 5A            [ 2] 1775         decb                    ; decrement timer
   8CE2 86 FF         [ 2] 1776         ldaa    #0xFF
   8CE4 B7 10 01      [ 4] 1777         staa    DDRA            ; port A back to outputs
   8CE7 20 D8         [ 3] 1778         bra     L8CC1           ; loop
                           1779 
   8CE9                    1780 L8CE9:
   8CE9 BD 8C BD      [ 6] 1781         jsr     L8CBD           ; wait for LCD not busy
   8CEC 86 01         [ 2] 1782         ldaa    #0x01
   8CEE BD 8C 86      [ 6] 1783         jsr     L8C86           ; write byte to LCD
   8CF1 39            [ 5] 1784         rts
                           1785 
   8CF2                    1786 L8CF2:
   8CF2 BD 8C BD      [ 6] 1787         jsr     L8CBD           ; wait for LCD not busy
   8CF5 86 80         [ 2] 1788         ldaa    #0x80
   8CF7 BD 8D 14      [ 6] 1789         jsr     L8D14
   8CFA BD 8C BD      [ 6] 1790         jsr     L8CBD           ; wait for LCD not busy
   8CFD 86 80         [ 2] 1791         ldaa    #0x80
   8CFF BD 8C 86      [ 6] 1792         jsr     L8C86           ; write byte to LCD
   8D02 39            [ 5] 1793         rts
                           1794 
   8D03                    1795 L8D03:
   8D03 BD 8C BD      [ 6] 1796         jsr     L8CBD           ; wait for LCD not busy
   8D06 86 C0         [ 2] 1797         ldaa    #0xC0
   8D08 BD 8D 14      [ 6] 1798         jsr     L8D14
   8D0B BD 8C BD      [ 6] 1799         jsr     L8CBD           ; wait for LCD not busy
   8D0E 86 C0         [ 2] 1800         ldaa    #0xC0
   8D10 BD 8C 86      [ 6] 1801         jsr     L8C86           ; write byte to LCD
   8D13 39            [ 5] 1802         rts
                           1803 
   8D14                    1804 L8D14:
   8D14 BD 8C 86      [ 6] 1805         jsr     L8C86           ; write byte to LCD
   8D17 86 10         [ 2] 1806         ldaa    #0x10
   8D19 97 14         [ 3] 1807         staa    (0x0014)
   8D1B                    1808 L8D1B:
   8D1B BD 8C BD      [ 6] 1809         jsr     L8CBD           ; wait for LCD not busy
   8D1E 86 20         [ 2] 1810         ldaa    #0x20
   8D20 BD 8C 98      [ 6] 1811         jsr     L8C98
   8D23 7A 00 14      [ 6] 1812         dec     (0x0014)
   8D26 26 F3         [ 3] 1813         bne     L8D1B  
   8D28 39            [ 5] 1814         rts
                           1815 
   8D29                    1816 L8D29:
   8D29 86 0C         [ 2] 1817         ldaa    #0x0C
   8D2B BD 8E 4B      [ 6] 1818         jsr     L8E4B
   8D2E 39            [ 5] 1819         rts
                           1820 
                           1821 ; Unused?
   8D2F                    1822 L8D2F:
   8D2F 86 0E         [ 2] 1823         ldaa    #0x0E
   8D31 BD 8E 4B      [ 6] 1824         jsr     L8E4B
   8D34 39            [ 5] 1825         rts
                           1826 
   8D35                    1827 L8D35:
   8D35 7F 00 4A      [ 6] 1828         clr     (0x004A)
   8D38 7F 00 43      [ 6] 1829         clr     (0x0043)
   8D3B 18 DE 46      [ 5] 1830         ldy     (0x0046)
   8D3E 86 C0         [ 2] 1831         ldaa    #0xC0
   8D40 20 0B         [ 3] 1832         bra     L8D4D
                           1833 
   8D42                    1834 L8D42:
   8D42 7F 00 4A      [ 6] 1835         clr     (0x004A)
   8D45 7F 00 43      [ 6] 1836         clr     (0x0043)
   8D48 18 DE 46      [ 5] 1837         ldy     (0x0046)
   8D4B 86 80         [ 2] 1838         ldaa    #0x80
   8D4D                    1839 L8D4D:
   8D4D 18 A7 00      [ 5] 1840         staa    0,Y     
   8D50 18 6F 01      [ 7] 1841         clr     1,Y     
   8D53 18 08         [ 4] 1842         iny
   8D55 18 08         [ 4] 1843         iny
   8D57 18 8C 05 80   [ 5] 1844         cpy     #0x0580
   8D5B 25 04         [ 3] 1845         bcs     L8D61  
   8D5D 18 CE 05 00   [ 4] 1846         ldy     #0x0500
   8D61                    1847 L8D61:
   8D61 C6 0F         [ 2] 1848         ldab    #0x0F
   8D63                    1849 L8D63:
   8D63 96 4A         [ 3] 1850         ldaa    (0x004A)
   8D65 27 FC         [ 3] 1851         beq     L8D63  
   8D67 7F 00 4A      [ 6] 1852         clr     (0x004A)
   8D6A 5A            [ 2] 1853         decb
   8D6B 27 1A         [ 3] 1854         beq     L8D87  
   8D6D 81 24         [ 2] 1855         cmpa    #0x24
   8D6F 27 16         [ 3] 1856         beq     L8D87  
   8D71 18 6F 00      [ 7] 1857         clr     0,Y     
   8D74 18 A7 01      [ 5] 1858         staa    1,Y     
   8D77 18 08         [ 4] 1859         iny
   8D79 18 08         [ 4] 1860         iny
   8D7B 18 8C 05 80   [ 5] 1861         cpy     #0x0580
   8D7F 25 04         [ 3] 1862         bcs     L8D85  
   8D81 18 CE 05 00   [ 4] 1863         ldy     #0x0500
   8D85                    1864 L8D85:
   8D85 20 DC         [ 3] 1865         bra     L8D63  
   8D87                    1866 L8D87:
   8D87 5D            [ 2] 1867         tstb
   8D88 27 19         [ 3] 1868         beq     L8DA3  
   8D8A 86 20         [ 2] 1869         ldaa    #0x20
   8D8C                    1870 L8D8C:
   8D8C 18 6F 00      [ 7] 1871         clr     0,Y     
   8D8F 18 A7 01      [ 5] 1872         staa    1,Y     
   8D92 18 08         [ 4] 1873         iny
   8D94 18 08         [ 4] 1874         iny
   8D96 18 8C 05 80   [ 5] 1875         cpy     #0x0580
   8D9A 25 04         [ 3] 1876         bcs     L8DA0  
   8D9C 18 CE 05 00   [ 4] 1877         ldy     #0x0500
   8DA0                    1878 L8DA0:
   8DA0 5A            [ 2] 1879         decb
   8DA1 26 E9         [ 3] 1880         bne     L8D8C  
   8DA3                    1881 L8DA3:
   8DA3 18 6F 00      [ 7] 1882         clr     0,Y     
   8DA6 18 6F 01      [ 7] 1883         clr     1,Y     
   8DA9 18 DF 46      [ 5] 1884         sty     (0x0046)
   8DAC 96 19         [ 3] 1885         ldaa    (0x0019)
   8DAE 97 4E         [ 3] 1886         staa    (0x004E)
   8DB0 86 01         [ 2] 1887         ldaa    #0x01
   8DB2 97 43         [ 3] 1888         staa    (0x0043)
   8DB4 39            [ 5] 1889         rts
                           1890 
                           1891 ; display ASCII in B at location
   8DB5                    1892 L8DB5:
   8DB5 36            [ 3] 1893         psha
   8DB6 37            [ 3] 1894         pshb
   8DB7 C1 4F         [ 2] 1895         cmpb    #0x4F
   8DB9 22 13         [ 3] 1896         bhi     L8DCE  
   8DBB C1 28         [ 2] 1897         cmpb    #0x28
   8DBD 25 03         [ 3] 1898         bcs     L8DC2  
   8DBF 0C            [ 2] 1899         clc
   8DC0 C9 18         [ 2] 1900         adcb    #0x18
   8DC2                    1901 L8DC2:
   8DC2 0C            [ 2] 1902         clc
   8DC3 C9 80         [ 2] 1903         adcb    #0x80
   8DC5 17            [ 2] 1904         tba
   8DC6 BD 8E 4B      [ 6] 1905         jsr     L8E4B           ; send lcd command
   8DC9 33            [ 4] 1906         pulb
   8DCA 32            [ 4] 1907         pula
   8DCB BD 8E 70      [ 6] 1908         jsr     L8E70           ; send lcd char
   8DCE                    1909 L8DCE:
   8DCE 39            [ 5] 1910         rts
                           1911 
                           1912 ; 4 routines to write to the LCD display
                           1913 
                           1914 ; Write to the LCD 1st line - extend past the end of a normal display
   8DCF                    1915 LCDMSG1A:
   8DCF 18 DE 46      [ 5] 1916         ldy     (0x0046)        ; get buffer pointer
   8DD2 86 90         [ 2] 1917         ldaa    #0x90           ; command to set LCD RAM ptr to chr 0x10
   8DD4 20 13         [ 3] 1918         bra     L8DE9  
                           1919 
                           1920 ; Write to the LCD 2st line - extend past the end of a normal display
   8DD6                    1921 LCDMSG2A:
   8DD6 18 DE 46      [ 5] 1922         ldy     (0x0046)        ; get buffer pointer
   8DD9 86 D0         [ 2] 1923         ldaa    #0xD0           ; command to set LCD RAM ptr to chr 0x50
   8DDB 20 0C         [ 3] 1924         bra     L8DE9  
                           1925 
                           1926 ; Write to the LCD 2nd line
   8DDD                    1927 LCDMSG2:
   8DDD 18 DE 46      [ 5] 1928         ldy     (0x0046)        ; get buffer pointer
   8DE0 86 C0         [ 2] 1929         ldaa    #0xC0           ; command to set LCD RAM ptr to chr 0x40
   8DE2 20 05         [ 3] 1930         bra     L8DE9  
                           1931 
                           1932 ; Write to the LCD 1st line
   8DE4                    1933 LCDMSG1:
   8DE4 18 DE 46      [ 5] 1934         ldy     (0x0046)        ; get buffer pointer
   8DE7 86 80         [ 2] 1935         ldaa    #0x80           ; command to load LCD RAM ptr to chr 0x00
                           1936 
                           1937 ; Put LCD command into a buffer, 4 bytes for each entry?
   8DE9                    1938 L8DE9:
   8DE9 18 A7 00      [ 5] 1939         staa    0,Y             ; store command here
   8DEC 18 6F 01      [ 7] 1940         clr     1,Y             ; clear next byte
   8DEF 18 08         [ 4] 1941         iny
   8DF1 18 08         [ 4] 1942         iny
                           1943 
                           1944 ; Add characters at return address to LCD buffer
   8DF3 18 8C 05 80   [ 5] 1945         cpy     #0x0580         ; check for buffer overflow
   8DF7 25 04         [ 3] 1946         bcs     L8DFD           
   8DF9 18 CE 05 00   [ 4] 1947         ldy     #0x0500
   8DFD                    1948 L8DFD:
   8DFD 38            [ 5] 1949         pulx                    ; get start of data
   8DFE DF 17         [ 4] 1950         stx     (0x0017)        ; save this here
   8E00                    1951 L8E00:
   8E00 A6 00         [ 4] 1952         ldaa    0,X             ; get character
   8E02 27 36         [ 3] 1953         beq     L8E3A           ; is it 00, if so jump ahead
   8E04 2B 17         [ 3] 1954         bmi     L8E1D           ; high bit set, if so jump ahead
   8E06 18 6F 00      [ 7] 1955         clr     0,Y             ; add character
   8E09 18 A7 01      [ 5] 1956         staa    1,Y     
   8E0C 08            [ 3] 1957         inx
   8E0D 18 08         [ 4] 1958         iny
   8E0F 18 08         [ 4] 1959         iny
   8E11 18 8C 05 80   [ 5] 1960         cpy     #0x0580         ; check for buffer overflow
   8E15 25 E9         [ 3] 1961         bcs     L8E00  
   8E17 18 CE 05 00   [ 4] 1962         ldy     #0x0500
   8E1B 20 E3         [ 3] 1963         bra     L8E00  
                           1964 
   8E1D                    1965 L8E1D:
   8E1D 84 7F         [ 2] 1966         anda    #0x7F
   8E1F 18 6F 00      [ 7] 1967         clr     0,Y             ; add character
   8E22 18 A7 01      [ 5] 1968         staa    1,Y     
   8E25 18 6F 02      [ 7] 1969         clr     2,Y     
   8E28 18 6F 03      [ 7] 1970         clr     3,Y     
   8E2B 08            [ 3] 1971         inx
   8E2C 18 08         [ 4] 1972         iny
   8E2E 18 08         [ 4] 1973         iny
   8E30 18 8C 05 80   [ 5] 1974         cpy     #0x0580         ; check for overflow
   8E34 25 04         [ 3] 1975         bcs     L8E3A  
   8E36 18 CE 05 00   [ 4] 1976         ldy     #0x0500
                           1977 
   8E3A                    1978 L8E3A:
   8E3A 3C            [ 4] 1979         pshx                    ; put SP back
   8E3B 86 01         [ 2] 1980         ldaa    #0x01
   8E3D 97 43         [ 3] 1981         staa    (0x0043)        ; semaphore?
   8E3F DC 46         [ 4] 1982         ldd     (0x0046)
   8E41 18 6F 00      [ 7] 1983         clr     0,Y     
   8E44 18 6F 01      [ 7] 1984         clr     1,Y     
   8E47 18 DF 46      [ 5] 1985         sty     (0x0046)        ; save buffer pointer
   8E4A 39            [ 5] 1986         rts
                           1987 
                           1988 ; buffer LCD command?
   8E4B                    1989 L8E4B:
   8E4B 18 DE 46      [ 5] 1990         ldy     (0x0046)
   8E4E 18 A7 00      [ 5] 1991         staa    0,Y     
   8E51 18 6F 01      [ 7] 1992         clr     1,Y     
   8E54 18 08         [ 4] 1993         iny
   8E56 18 08         [ 4] 1994         iny
   8E58 18 8C 05 80   [ 5] 1995         cpy     #0x0580
   8E5C 25 04         [ 3] 1996         bcs     L8E62  
   8E5E 18 CE 05 00   [ 4] 1997         ldy     #0x0500
   8E62                    1998 L8E62:
   8E62 18 6F 00      [ 7] 1999         clr     0,Y     
   8E65 18 6F 01      [ 7] 2000         clr     1,Y     
   8E68 86 01         [ 2] 2001         ldaa    #0x01
   8E6A 97 43         [ 3] 2002         staa    (0x0043)
   8E6C 18 DF 46      [ 5] 2003         sty     (0x0046)
   8E6F 39            [ 5] 2004         rts
                           2005 
   8E70                    2006 L8E70:
   8E70 18 DE 46      [ 5] 2007         ldy     (0x0046)
   8E73 18 6F 00      [ 7] 2008         clr     0,Y     
   8E76 18 A7 01      [ 5] 2009         staa    1,Y     
   8E79 18 08         [ 4] 2010         iny
   8E7B 18 08         [ 4] 2011         iny
   8E7D 18 8C 05 80   [ 5] 2012         cpy     #0x0580
   8E81 25 04         [ 3] 2013         bcs     L8E87  
   8E83 18 CE 05 00   [ 4] 2014         ldy     #0x0500
   8E87                    2015 L8E87:
   8E87 18 6F 00      [ 7] 2016         clr     0,Y     
   8E8A 18 6F 01      [ 7] 2017         clr     1,Y     
   8E8D 86 01         [ 2] 2018         ldaa    #0x01
   8E8F 97 43         [ 3] 2019         staa    (0x0043)
   8E91 18 DF 46      [ 5] 2020         sty     (0x0046)
   8E94 39            [ 5] 2021         rts
                           2022 
                           2023 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2024 
                           2025 ; Read SCD switches
   8E95                    2026 L8E95:
   8E95 96 30         [ 3] 2027         ldaa    (0x0030)
   8E97 26 09         [ 3] 2028         bne     L8EA2       ; UP - return A=0x01
   8E99 96 31         [ 3] 2029         ldaa    (0x0031)
   8E9B 26 11         [ 3] 2030         bne     L8EAE       ; DOWN - return A=0x02
   8E9D 96 32         [ 3] 2031         ldaa    (0x0032)
   8E9F 26 19         [ 3] 2032         bne     L8EBA       ; ENTER - return A=0x0D
   8EA1 39            [ 5] 2033         rts                 ; return A=0x00
                           2034 
   8EA2                    2035 L8EA2:
   8EA2 7F 00 30      [ 6] 2036         clr     (0x0030)
   8EA5 7F 00 32      [ 6] 2037         clr     (0x0032)
   8EA8 7F 00 31      [ 6] 2038         clr     (0x0031)
   8EAB 86 01         [ 2] 2039         ldaa    #0x01
   8EAD 39            [ 5] 2040         rts
                           2041 
   8EAE                    2042 L8EAE:
   8EAE 7F 00 31      [ 6] 2043         clr     (0x0031)
   8EB1 7F 00 30      [ 6] 2044         clr     (0x0030)
   8EB4 7F 00 32      [ 6] 2045         clr     (0x0032)
   8EB7 86 02         [ 2] 2046         ldaa    #0x02
   8EB9 39            [ 5] 2047         rts
                           2048 
   8EBA                    2049 L8EBA:
   8EBA 7F 00 32      [ 6] 2050         clr     (0x0032)
   8EBD 7F 00 30      [ 6] 2051         clr     (0x0030)
   8EC0 7F 00 31      [ 6] 2052         clr     (0x0031)
   8EC3 86 0D         [ 2] 2053         ldaa    #0x0D
   8EC5 39            [ 5] 2054         rts
                           2055 
                           2056 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2057 
                           2058 ; Scan SCD keys into up=0x30,down=0x31,enter=0x32
   8EC6                    2059 L8EC6:
   8EC6 B6 18 04      [ 4] 2060         ldaa    PIA0PRA 
   8EC9 84 07         [ 2] 2061         anda    #0x07       ; get button state
   8ECB 97 2C         [ 3] 2062         staa    (0x002C)
   8ECD 78 00 2C      [ 6] 2063         asl     (0x002C)
   8ED0 78 00 2C      [ 6] 2064         asl     (0x002C)
   8ED3 78 00 2C      [ 6] 2065         asl     (0x002C)
   8ED6 78 00 2C      [ 6] 2066         asl     (0x002C)
   8ED9 78 00 2C      [ 6] 2067         asl     (0x002C)    ; put in upper 3 bits of 002C 
   8EDC CE 00 00      [ 3] 2068         ldx     #0x0000
   8EDF                    2069 L8EDF:
   8EDF 8C 00 03      [ 4] 2070         cpx     #0x0003
   8EE2 27 24         [ 3] 2071         beq     L8F08
   8EE4 78 00 2C      [ 6] 2072         asl     (0x002C)    
   8EE7 25 12         [ 3] 2073         bcs     L8EFB       ; if button not pressed, jump
   8EE9 A6 2D         [ 4] 2074         ldaa    0x2D,X
   8EEB 81 0F         [ 2] 2075         cmpa    #0x0F       ; has it been pressed for 15
   8EED 24 1A         [ 3] 2076         bcc     L8F09       ; do key repeat, if not enter
   8EEF 6C 2D         [ 6] 2077         inc     0x2D,X      ; nope, inc it
   8EF1 A6 2D         [ 4] 2078         ldaa    0x2D,X
   8EF3 81 02         [ 2] 2079         cmpa    #0x02       ; has it been pressed for 2?
   8EF5 26 02         [ 3] 2080         bne     L8EF9       ; nope
   8EF7 A7 30         [ 4] 2081         staa    0x30,X      ; short press - store count (2) in 0x30/0x31/0x32
   8EF9                    2082 L8EF9:
   8EF9 20 0A         [ 3] 2083         bra     L8F05  
   8EFB                    2084 L8EFB:                      ; 
   8EFB 6F 2D         [ 6] 2085         clr     0x2D,X      ; clear 2D/2E/2F if not pressed
   8EFD 20 06         [ 3] 2086         bra     L8F05  
   8EFF A6 2D         [ 4] 2087         ldaa    0x2D,X
   8F01 27 02         [ 3] 2088         beq     L8F05  
   8F03 6A 2D         [ 6] 2089         dec     0x2D,X
   8F05                    2090 L8F05:
   8F05 08            [ 3] 2091         inx
   8F06 20 D7         [ 3] 2092         bra     L8EDF  
   8F08                    2093 L8F08:
   8F08 39            [ 5] 2094         rts
                           2095 
   8F09                    2096 L8F09:
   8F09 8C 00 02      [ 4] 2097         cpx     #0x0002
   8F0C 27 02         [ 3] 2098         beq     L8F10  
   8F0E 6F 2D         [ 6] 2099         clr     0x2D,X      ; do kbd repeat for up and down
   8F10                    2100 L8F10:
   8F10 20 F3         [ 3] 2101         bra     L8F05
                           2102 
                           2103 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2104 
                           2105 ; Read Front Panel Switches
   8F12                    2106 L8F12:
   8F12 B6 10 0A      [ 4] 2107         ldaa    PORTE
   8F15 97 51         [ 3] 2108         staa    (0x0051)
   8F17 CE 00 00      [ 3] 2109         ldx     #0x0000
   8F1A                    2110 L8F1A:
   8F1A 8C 00 08      [ 4] 2111         cpx     #0x0008
   8F1D 27 22         [ 3] 2112         beq     L8F41  
   8F1F 77 00 51      [ 6] 2113         asr     (0x0051)
   8F22 25 10         [ 3] 2114         bcs     L8F34  
   8F24 A6 52         [ 4] 2115         ldaa    0x52,X
   8F26 81 0F         [ 2] 2116         cmpa    #0x0F
   8F28 6C 52         [ 6] 2117         inc     0x52,X
   8F2A A6 52         [ 4] 2118         ldaa    0x52,X
   8F2C 81 04         [ 2] 2119         cmpa    #0x04
   8F2E 26 02         [ 3] 2120         bne     L8F32  
   8F30 A7 5A         [ 4] 2121         staa    0x5A,X
   8F32                    2122 L8F32:
   8F32 20 0A         [ 3] 2123         bra     L8F3E  
   8F34                    2124 L8F34:
   8F34 6F 52         [ 6] 2125         clr     0x52,X
   8F36 20 06         [ 3] 2126         bra     L8F3E  
   8F38 A6 52         [ 4] 2127         ldaa    0x52,X
   8F3A 27 02         [ 3] 2128         beq     L8F3E  
   8F3C 6A 52         [ 6] 2129         dec     0x52,X
   8F3E                    2130 L8F3E:
   8F3E 08            [ 3] 2131         inx
   8F3F 20 D9         [ 3] 2132         bra     L8F1A  
   8F41                    2133 L8F41:
   8F41 39            [ 5] 2134         rts
                           2135 
   8F42 6F 52         [ 6] 2136         clr     0x52,X
   8F44 20 F8         [ 3] 2137         bra     L8F3E  
                           2138 
                           2139 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2140 
   8F46                    2141 L8F46:
   8F46 30 2E 35           2142         .ascii      '0.5'
   8F49 31 2E 30           2143         .ascii      '1.0'
   8F4C 31 2E 35           2144         .ascii      '1.5'
   8F4F 32 2E 30           2145         .ascii      '2.0'
   8F52 32 2E 35           2146         .ascii      '2.5'
   8F55 33 2E 30           2147         .ascii      '3.0'
                           2148 
   8F58                    2149 L8F58:
   8F58 3C            [ 4] 2150         pshx
   8F59 96 12         [ 3] 2151         ldaa    (0x0012)
   8F5B 80 01         [ 2] 2152         suba    #0x01
   8F5D C6 03         [ 2] 2153         ldab    #0x03
   8F5F 3D            [10] 2154         mul
   8F60 CE 8F 46      [ 3] 2155         ldx     #L8F46
   8F63 3A            [ 3] 2156         abx
   8F64 C6 2C         [ 2] 2157         ldab    #0x2C
   8F66                    2158 L8F66:
   8F66 A6 00         [ 4] 2159         ldaa    0,X     
   8F68 08            [ 3] 2160         inx
   8F69 BD 8D B5      [ 6] 2161         jsr     L8DB5           ; display char here on LCD display
   8F6C 5C            [ 2] 2162         incb
   8F6D C1 2F         [ 2] 2163         cmpb    #0x2F
   8F6F 26 F5         [ 3] 2164         bne     L8F66  
   8F71 38            [ 5] 2165         pulx
   8F72 39            [ 5] 2166         rts
                           2167 
   8F73                    2168 L8F73:
   8F73 36            [ 3] 2169         psha
   8F74 BD 8C F2      [ 6] 2170         jsr     L8CF2
   8F77 C6 02         [ 2] 2171         ldab    #0x02
   8F79 BD 8C 30      [ 6] 2172         jsr     DLYSECSBY2   
   8F7C 32            [ 4] 2173         pula
   8F7D 97 B4         [ 3] 2174         staa    (0x00B4)
   8F7F 81 03         [ 2] 2175         cmpa    #0x03
   8F81 26 11         [ 3] 2176         bne     L8F94  
                           2177 
   8F83 BD 8D E4      [ 6] 2178         jsr     LCDMSG1 
   8F86 43 68 75 63 6B 20  2179         .ascis  'Chuck    '
        20 20 A0
                           2180 
   8F8F CE 90 72      [ 3] 2181         ldx     #L9072
   8F92 20 4D         [ 3] 2182         bra     L8FE1  
   8F94                    2183 L8F94:
   8F94 81 04         [ 2] 2184         cmpa    #0x04
   8F96 26 11         [ 3] 2185         bne     L8FA9  
                           2186 
   8F98 BD 8D E4      [ 6] 2187         jsr     LCDMSG1 
   8F9B 4A 61 73 70 65 72  2188         .ascis  'Jasper   '
        20 20 A0
                           2189 
   8FA4 CE 90 DE      [ 3] 2190         ldx     #L90DE
   8FA7 20 38         [ 3] 2191         bra     L8FE1  
   8FA9                    2192 L8FA9:
   8FA9 81 05         [ 2] 2193         cmpa    #0x05
   8FAB 26 11         [ 3] 2194         bne     L8FBE  
                           2195 
   8FAD BD 8D E4      [ 6] 2196         jsr     LCDMSG1 
   8FB0 50 61 73 71 75 61  2197         .ascis  'Pasqually'
        6C 6C F9
                           2198 
   8FB9 CE 91 45      [ 3] 2199         ldx     #L9145
   8FBC 20 23         [ 3] 2200         bra     L8FE1  
   8FBE                    2201 L8FBE:
   8FBE 81 06         [ 2] 2202         cmpa    #0x06
   8FC0 26 11         [ 3] 2203         bne     L8FD3  
                           2204 
   8FC2 BD 8D E4      [ 6] 2205         jsr     LCDMSG1 
   8FC5 4D 75 6E 63 68 20  2206         .ascis  'Munch    '
        20 20 A0
                           2207 
   8FCE CE 91 BA      [ 3] 2208         ldx     #L91BA
   8FD1 20 0E         [ 3] 2209         bra     L8FE1  
   8FD3                    2210 L8FD3:
   8FD3 BD 8D E4      [ 6] 2211         jsr     LCDMSG1 
   8FD6 48 65 6C 65 6E 20  2212         .ascis  'Helen   '
        20 A0
                           2213 
   8FDE CE 92 26      [ 3] 2214         ldx     #L9226
   8FE1                    2215 L8FE1:
   8FE1 96 B4         [ 3] 2216         ldaa    (0x00B4)
   8FE3 80 03         [ 2] 2217         suba    #0x03
   8FE5 48            [ 2] 2218         asla
   8FE6 48            [ 2] 2219         asla
   8FE7 97 4B         [ 3] 2220         staa    (0x004B)
   8FE9 BD 95 04      [ 6] 2221         jsr     L9504
   8FEC 97 4C         [ 3] 2222         staa    (0x004C)
   8FEE 81 0F         [ 2] 2223         cmpa    #0x0F
   8FF0 26 01         [ 3] 2224         bne     L8FF3  
   8FF2 39            [ 5] 2225         rts
                           2226 
   8FF3                    2227 L8FF3:
   8FF3 81 08         [ 2] 2228         cmpa    #0x08
   8FF5 23 08         [ 3] 2229         bls     L8FFF  
   8FF7 80 08         [ 2] 2230         suba    #0x08
   8FF9 D6 4B         [ 3] 2231         ldab    (0x004B)
   8FFB CB 02         [ 2] 2232         addb    #0x02
   8FFD D7 4B         [ 3] 2233         stab    (0x004B)
   8FFF                    2234 L8FFF:
   8FFF 36            [ 3] 2235         psha
   9000 18 DE 46      [ 5] 2236         ldy     (0x0046)
   9003 32            [ 4] 2237         pula
   9004 5F            [ 2] 2238         clrb
   9005 0D            [ 2] 2239         sec
   9006                    2240 L9006:
   9006 59            [ 2] 2241         rolb
   9007 4A            [ 2] 2242         deca
   9008 26 FC         [ 3] 2243         bne     L9006  
   900A D7 50         [ 3] 2244         stab    (0x0050)
   900C D6 4B         [ 3] 2245         ldab    (0x004B)
   900E CE 10 80      [ 3] 2246         ldx     #0x1080
   9011 3A            [ 3] 2247         abx
   9012 86 02         [ 2] 2248         ldaa    #0x02
   9014 97 12         [ 3] 2249         staa    (0x0012)
   9016                    2250 L9016:
   9016 A6 00         [ 4] 2251         ldaa    0,X     
   9018 98 50         [ 3] 2252         eora    (0x0050)
   901A A7 00         [ 4] 2253         staa    0,X     
   901C 6D 00         [ 6] 2254         tst     0,X     
   901E 27 16         [ 3] 2255         beq     L9036  
   9020 86 4F         [ 2] 2256         ldaa    #0x4F           ;'O'
   9022 C6 0C         [ 2] 2257         ldab    #0x0C        
   9024 BD 8D B5      [ 6] 2258         jsr     L8DB5           ; display char here on LCD display
   9027 86 6E         [ 2] 2259         ldaa    #0x6E           ;'n'
   9029 C6 0D         [ 2] 2260         ldab    #0x0D
   902B BD 8D B5      [ 6] 2261         jsr     L8DB5           ; display char here on LCD display
   902E CC 20 0E      [ 3] 2262         ldd     #0x200E         ;' '
   9031 BD 8D B5      [ 6] 2263         jsr     L8DB5           ; display char here on LCD display
   9034 20 0E         [ 3] 2264         bra     L9044  
   9036                    2265 L9036:
   9036 86 66         [ 2] 2266         ldaa    #0x66           ;'f'
   9038 C6 0D         [ 2] 2267         ldab    #0x0D
   903A BD 8D B5      [ 6] 2268         jsr     L8DB5           ; display char here on LCD display
   903D 86 66         [ 2] 2269         ldaa    #0x66           ;'f'
   903F C6 0E         [ 2] 2270         ldab    #0x0E
   9041 BD 8D B5      [ 6] 2271         jsr     L8DB5           ; display char here on LCD display
   9044                    2272 L9044:
   9044 D6 12         [ 3] 2273         ldab    (0x0012)
   9046 BD 8C 30      [ 6] 2274         jsr     DLYSECSBY2      ; delay in half-seconds
   9049 BD 8E 95      [ 6] 2275         jsr     L8E95
   904C 81 0D         [ 2] 2276         cmpa    #0x0D
   904E 27 14         [ 3] 2277         beq     L9064  
   9050 20 C4         [ 3] 2278         bra     L9016  
   9052 81 02         [ 2] 2279         cmpa    #0x02
   9054 26 C0         [ 3] 2280         bne     L9016  
   9056 96 12         [ 3] 2281         ldaa    (0x0012)
   9058 81 06         [ 2] 2282         cmpa    #0x06
   905A 27 BA         [ 3] 2283         beq     L9016  
   905C 4C            [ 2] 2284         inca
   905D 97 12         [ 3] 2285         staa    (0x0012)
   905F BD 8F 58      [ 6] 2286         jsr     L8F58
   9062 20 B2         [ 3] 2287         bra     L9016  
   9064                    2288 L9064:
   9064 A6 00         [ 4] 2289         ldaa    0,X     
   9066 9A 50         [ 3] 2290         oraa    (0x0050)
   9068 98 50         [ 3] 2291         eora    (0x0050)
   906A A7 00         [ 4] 2292         staa    0,X     
   906C 96 B4         [ 3] 2293         ldaa    (0x00B4)
   906E 7E 8F 73      [ 3] 2294         jmp     L8F73
   9071 39            [ 5] 2295         rts
                           2296 
   9072                    2297 L9072:
   9072 4D 6F 75 74 68 2C  2298         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   90DE                    2299 L90DE:
   90DE 4D 6F 75 74 68 2C  2300         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Hands,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9145                    2301 L9145:
   9145 4D 6F 75 74 68 2D  2302         .ascis  'Mouth-Mustache,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   91BA                    2303 L91BA:
   91BA 4D 6F 75 74 68 2C  2304         .ascis  'Mouth,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9226                    2305 L9226:
   9226 4D 6F 75 74 68 2C  2306         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
                           2307         
                           2308 ; code again
   9292                    2309 L9292:
   9292 BD 86 C4      [ 6] 2310         jsr     L86C4           ; Reset boards 1-10
   9295                    2311 L9295:
   9295 C6 01         [ 2] 2312         ldab    #0x01
   9297 BD 8C 30      [ 6] 2313         jsr     DLYSECSBY2      ; delay 0.5 sec
                           2314 
   929A BD 8D E4      [ 6] 2315         jsr     LCDMSG1 
   929D 20 20 44 69 61 67  2316         .ascis  '  Diagnostics   '
        6E 6F 73 74 69 63
        73 20 20 A0
                           2317 
   92AD BD 8D DD      [ 6] 2318         jsr     LCDMSG2 
   92B0 20 20 20 20 20 20  2319         .ascis  '                '
        20 20 20 20 20 20
        20 20 20 A0
                           2320 
   92C0 C6 01         [ 2] 2321         ldab    #0x01
   92C2 BD 8C 30      [ 6] 2322         jsr     DLYSECSBY2      ; delay 0.5 sec
   92C5 BD 8D 03      [ 6] 2323         jsr     L8D03
   92C8 CE 93 D3      [ 3] 2324         ldx     #L93D3
   92CB BD 95 04      [ 6] 2325         jsr     L9504
   92CE 81 11         [ 2] 2326         cmpa    #0x11
   92D0 26 14         [ 3] 2327         bne     L92E6
   92D2                    2328 L92D2:
   92D2 BD 86 C4      [ 6] 2329         jsr     L86C4           ; Reset boards 1-10
   92D5 5F            [ 2] 2330         clrb
   92D6 D7 62         [ 3] 2331         stab    (0x0062)
   92D8 BD F9 C5      [ 6] 2332         jsr     BUTNLIT 
   92DB B6 18 04      [ 4] 2333         ldaa    PIA0PRA 
   92DE 84 BF         [ 2] 2334         anda    #0xBF
   92E0 B7 18 04      [ 4] 2335         staa    PIA0PRA 
   92E3 7E 81 D7      [ 3] 2336         jmp     L81D7
   92E6                    2337 L92E6:
   92E6 81 03         [ 2] 2338         cmpa    #0x03
   92E8 25 09         [ 3] 2339         bcs     L92F3  
   92EA 81 08         [ 2] 2340         cmpa    #0x08
   92EC 24 05         [ 3] 2341         bcc     L92F3  
   92EE BD 8F 73      [ 6] 2342         jsr     L8F73
   92F1 20 A2         [ 3] 2343         bra     L9295  
   92F3                    2344 L92F3:
   92F3 81 02         [ 2] 2345         cmpa    #0x02
   92F5 26 08         [ 3] 2346         bne     L92FF  
   92F7 BD 9F 1E      [ 6] 2347         jsr     L9F1E
   92FA 25 99         [ 3] 2348         bcs     L9295  
   92FC 7E 96 75      [ 3] 2349         jmp     L9675
   92FF                    2350 L92FF:
   92FF 81 0B         [ 2] 2351         cmpa    #0x0B
   9301 26 0D         [ 3] 2352         bne     L9310  
   9303 BD 8D 03      [ 6] 2353         jsr     L8D03
   9306 BD 9E CC      [ 6] 2354         jsr     L9ECC
   9309 C6 03         [ 2] 2355         ldab    #0x03
   930B BD 8C 30      [ 6] 2356         jsr     DLYSECSBY2      ; delay 1.5 sec
   930E 20 85         [ 3] 2357         bra     L9295  
   9310                    2358 L9310:
   9310 81 09         [ 2] 2359         cmpa    #0x09
   9312 26 0E         [ 3] 2360         bne     L9322  
   9314 BD 9F 1E      [ 6] 2361         jsr     L9F1E
   9317 24 03         [ 3] 2362         bcc     L931C  
   9319 7E 92 95      [ 3] 2363         jmp     L9295
   931C                    2364 L931C:
   931C BD 9E 92      [ 6] 2365         jsr     L9E92           ; reset R counts
   931F 7E 92 95      [ 3] 2366         jmp     L9295
   9322                    2367 L9322:
   9322 81 0A         [ 2] 2368         cmpa    #0x0A
   9324 26 0B         [ 3] 2369         bne     L9331  
   9326 BD 9F 1E      [ 6] 2370         jsr     L9F1E
   9329 25 03         [ 3] 2371         bcs     L932E  
   932B BD 9E AF      [ 6] 2372         jsr     L9EAF           ; reset L counts
   932E                    2373 L932E:
   932E 7E 92 95      [ 3] 2374         jmp     L9295
   9331                    2375 L9331:
   9331 81 01         [ 2] 2376         cmpa    #0x01
   9333 26 03         [ 3] 2377         bne     L9338  
   9335 7E A0 E9      [ 3] 2378         jmp     LA0E9
   9338                    2379 L9338:
   9338 81 08         [ 2] 2380         cmpa    #0x08
   933A 26 1F         [ 3] 2381         bne     L935B  
   933C BD 9F 1E      [ 6] 2382         jsr     L9F1E
   933F 25 1A         [ 3] 2383         bcs     L935B  
                           2384 
   9341 BD 8D E4      [ 6] 2385         jsr     LCDMSG1 
   9344 52 65 73 65 74 20  2386         .ascis  'Reset System!'
        53 79 73 74 65 6D
        A1
                           2387 
   9351 7E A2 49      [ 3] 2388         jmp     LA249
   9354 C6 02         [ 2] 2389         ldab    #0x02
   9356 BD 8C 30      [ 6] 2390         jsr     DLYSECSBY2      ; delay 1 sec
   9359 20 18         [ 3] 2391         bra     L9373  
   935B                    2392 L935B:
   935B 81 0C         [ 2] 2393         cmpa    #0x0C
   935D 26 14         [ 3] 2394         bne     L9373  
   935F BD 8B 48      [ 6] 2395         jsr     L8B48
   9362 5F            [ 2] 2396         clrb
   9363 D7 62         [ 3] 2397         stab    (0x0062)
   9365 BD F9 C5      [ 6] 2398         jsr     BUTNLIT 
   9368 B6 18 04      [ 4] 2399         ldaa    PIA0PRA 
   936B 84 BF         [ 2] 2400         anda    #0xBF
   936D B7 18 04      [ 4] 2401         staa    PIA0PRA 
   9370 7E 92 92      [ 3] 2402         jmp     L9292
   9373                    2403 L9373:
   9373 81 0D         [ 2] 2404         cmpa    #0x0D
   9375 26 2E         [ 3] 2405         bne     L93A5  
   9377 BD 8C E9      [ 6] 2406         jsr     L8CE9
                           2407 
   937A BD 8D E4      [ 6] 2408         jsr     LCDMSG1 
   937D 20 20 42 75 74 74  2409         .ascis  '  Button  test'
        6F 6E 20 20 74 65
        73 F4
                           2410 
   938B BD 8D DD      [ 6] 2411         jsr     LCDMSG2 
   938E 20 20 20 50 52 4F  2412         .ascis  '   PROG exits'
        47 20 65 78 69 74
        F3
                           2413 
   939B BD A5 26      [ 6] 2414         jsr     LA526
   939E 5F            [ 2] 2415         clrb
   939F BD F9 C5      [ 6] 2416         jsr     BUTNLIT 
   93A2 7E 92 95      [ 3] 2417         jmp     L9295
   93A5                    2418 L93A5:
   93A5 81 0E         [ 2] 2419         cmpa    #0x0E
   93A7 26 10         [ 3] 2420         bne     L93B9  
   93A9 BD 9F 1E      [ 6] 2421         jsr     L9F1E
   93AC 24 03         [ 3] 2422         bcc     L93B1  
   93AE 7E 92 95      [ 3] 2423         jmp     L9295
   93B1                    2424 L93B1:
   93B1 C6 01         [ 2] 2425         ldab    #0x01
   93B3 BD 8C 30      [ 6] 2426         jsr     DLYSECSBY2      ; delay 0.5 sec
   93B6 7E 94 9A      [ 3] 2427         jmp     L949A
   93B9                    2428 L93B9:
   93B9 81 0F         [ 2] 2429         cmpa    #0x0F
   93BB 26 06         [ 3] 2430         bne     L93C3  
   93BD BD A8 6A      [ 6] 2431         jsr     LA86A
   93C0 7E 92 95      [ 3] 2432         jmp     L9295
   93C3                    2433 L93C3:
   93C3 81 10         [ 2] 2434         cmpa    #0x10
   93C5 26 09         [ 3] 2435         bne     L93D0  
   93C7 BD 9F 1E      [ 6] 2436         jsr     L9F1E
   93CA BD 95 BA      [ 6] 2437         jsr     L95BA
   93CD 7E 92 95      [ 3] 2438         jmp     L9295
                           2439 
   93D0                    2440 L93D0:
   93D0 7E 92 D2      [ 3] 2441         jmp     L92D2
                           2442 
   93D3                    2443 L93D3:
   93D3 56 43 52 20 61 64  2444         .ascis  "VCR adjust,Set Random,Chuck E. Cheese,Jasper,Pasqually,Munch,Helen,Reset System,Reset reg tape#,Reset liv tape#,View Tape #'s,All Lights On,Button test,King enable,Warm-Up,Show Type,Quit Diagnostics"
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
   9499 00                 2445         .byte   0x00
                           2446 
   949A                    2447 L949A:
   949A 7D 04 2A      [ 6] 2448         tst     (0x042A)
   949D 27 27         [ 3] 2449         beq     L94C6  
                           2450 
   949F BD 8D E4      [ 6] 2451         jsr     LCDMSG1 
   94A2 4B 69 6E 67 20 69  2452         .ascis  'King is Enabled'
        73 20 45 6E 61 62
        6C 65 E4
                           2453 
   94B1 BD 8D DD      [ 6] 2454         jsr     LCDMSG2 
   94B4 45 4E 54 45 52 20  2455         .ascis  'ENTER to disable'
        74 6F 20 64 69 73
        61 62 6C E5
                           2456 
   94C4 20 25         [ 3] 2457         bra     L94EB  
                           2458 
   94C6                    2459 L94C6:
   94C6 BD 8D E4      [ 6] 2460         jsr     LCDMSG1 
   94C9 4B 69 6E 67 20 69  2461         .ascis  'King is Disabled'
        73 20 44 69 73 61
        62 6C 65 E4
                           2462 
   94D9 BD 8D DD      [ 6] 2463         jsr     LCDMSG2 
   94DC 45 4E 54 45 52 20  2464         .ascis  'ENTER to enable'
        74 6F 20 65 6E 61
        62 6C E5
                           2465 
   94EB                    2466 L94EB:
   94EB BD 8E 95      [ 6] 2467         jsr     L8E95
   94EE 4D            [ 2] 2468         tsta
   94EF 27 FA         [ 3] 2469         beq     L94EB  
   94F1 81 0D         [ 2] 2470         cmpa    #0x0D
   94F3 27 02         [ 3] 2471         beq     L94F7  
   94F5 20 0A         [ 3] 2472         bra     L9501  
   94F7                    2473 L94F7:
   94F7 B6 04 2A      [ 4] 2474         ldaa    (0x042A)
   94FA 84 01         [ 2] 2475         anda    #0x01
   94FC 88 01         [ 2] 2476         eora    #0x01
   94FE B7 04 2A      [ 4] 2477         staa    (0x042A)
   9501                    2478 L9501:
   9501 7E 92 95      [ 3] 2479         jmp     L9295
   9504                    2480 L9504:
   9504 86 01         [ 2] 2481         ldaa    #0x01
   9506 97 A6         [ 3] 2482         staa    (0x00A6)
   9508 97 A7         [ 3] 2483         staa    (0x00A7)
   950A DF 12         [ 4] 2484         stx     (0x0012)
   950C 20 09         [ 3] 2485         bra     L9517  
   950E 86 01         [ 2] 2486         ldaa    #0x01
   9510 97 A7         [ 3] 2487         staa    (0x00A7)
   9512 7F 00 A6      [ 6] 2488         clr     (0x00A6)
   9515 DF 12         [ 4] 2489         stx     (0x0012)
   9517                    2490 L9517:
   9517 7F 00 16      [ 6] 2491         clr     (0x0016)
   951A 18 DE 46      [ 5] 2492         ldy     (0x0046)
   951D 7D 00 A6      [ 6] 2493         tst     (0x00A6)
   9520 26 07         [ 3] 2494         bne     L9529  
   9522 BD 8C F2      [ 6] 2495         jsr     L8CF2
   9525 86 80         [ 2] 2496         ldaa    #0x80
   9527 20 05         [ 3] 2497         bra     L952E  
   9529                    2498 L9529:
   9529 BD 8D 03      [ 6] 2499         jsr     L8D03
   952C 86 C0         [ 2] 2500         ldaa    #0xC0
   952E                    2501 L952E:
   952E 18 A7 00      [ 5] 2502         staa    0,Y     
   9531 18 6F 01      [ 7] 2503         clr     1,Y     
   9534 18 08         [ 4] 2504         iny
   9536 18 08         [ 4] 2505         iny
   9538 18 8C 05 80   [ 5] 2506         cpy     #0x0580
   953C 25 04         [ 3] 2507         bcs     L9542  
   953E 18 CE 05 00   [ 4] 2508         ldy     #0x0500
   9542                    2509 L9542:
   9542 DF 14         [ 4] 2510         stx     (0x0014)
   9544                    2511 L9544:
   9544 A6 00         [ 4] 2512         ldaa    0,X     
   9546 2A 04         [ 3] 2513         bpl     L954C  
   9548 C6 01         [ 2] 2514         ldab    #0x01
   954A D7 16         [ 3] 2515         stab    (0x0016)
   954C                    2516 L954C:
   954C 81 2C         [ 2] 2517         cmpa    #0x2C
   954E 27 1E         [ 3] 2518         beq     L956E  
   9550 18 6F 00      [ 7] 2519         clr     0,Y     
   9553 84 7F         [ 2] 2520         anda    #0x7F
   9555 18 A7 01      [ 5] 2521         staa    1,Y     
   9558 18 08         [ 4] 2522         iny
   955A 18 08         [ 4] 2523         iny
   955C 18 8C 05 80   [ 5] 2524         cpy     #0x0580
   9560 25 04         [ 3] 2525         bcs     L9566  
   9562 18 CE 05 00   [ 4] 2526         ldy     #0x0500
   9566                    2527 L9566:
   9566 7D 00 16      [ 6] 2528         tst     (0x0016)
   9569 26 03         [ 3] 2529         bne     L956E  
   956B 08            [ 3] 2530         inx
   956C 20 D6         [ 3] 2531         bra     L9544  
   956E                    2532 L956E:
   956E 08            [ 3] 2533         inx
   956F 86 01         [ 2] 2534         ldaa    #0x01
   9571 97 43         [ 3] 2535         staa    (0x0043)
   9573 18 6F 00      [ 7] 2536         clr     0,Y     
   9576 18 6F 01      [ 7] 2537         clr     1,Y     
   9579 18 DF 46      [ 5] 2538         sty     (0x0046)
   957C                    2539 L957C:
   957C BD 8E 95      [ 6] 2540         jsr     L8E95
   957F 27 FB         [ 3] 2541         beq     L957C  
   9581 81 02         [ 2] 2542         cmpa    #0x02
   9583 26 0A         [ 3] 2543         bne     L958F  
   9585 7D 00 16      [ 6] 2544         tst     (0x0016)
   9588 26 05         [ 3] 2545         bne     L958F  
   958A 7C 00 A7      [ 6] 2546         inc     (0x00A7)
   958D 20 88         [ 3] 2547         bra     L9517  
   958F                    2548 L958F:
   958F 81 01         [ 2] 2549         cmpa    #0x01
   9591 26 20         [ 3] 2550         bne     L95B3  
   9593 18 DE 14      [ 5] 2551         ldy     (0x0014)
   9596 18 9C 12      [ 6] 2552         cpy     (0x0012)
   9599 23 E1         [ 3] 2553         bls     L957C  
   959B 7A 00 A7      [ 6] 2554         dec     (0x00A7)
   959E DE 14         [ 4] 2555         ldx     (0x0014)
   95A0 09            [ 3] 2556         dex
   95A1                    2557 L95A1:
   95A1 09            [ 3] 2558         dex
   95A2 9C 12         [ 5] 2559         cpx     (0x0012)
   95A4 26 03         [ 3] 2560         bne     L95A9  
   95A6 7E 95 17      [ 3] 2561         jmp     L9517
   95A9                    2562 L95A9:
   95A9 A6 00         [ 4] 2563         ldaa    0,X     
   95AB 81 2C         [ 2] 2564         cmpa    #0x2C
   95AD 26 F2         [ 3] 2565         bne     L95A1  
   95AF 08            [ 3] 2566         inx
   95B0 7E 95 17      [ 3] 2567         jmp     L9517
   95B3                    2568 L95B3:
   95B3 81 0D         [ 2] 2569         cmpa    #0x0D
   95B5 26 C5         [ 3] 2570         bne     L957C  
   95B7 96 A7         [ 3] 2571         ldaa    (0x00A7)
   95B9 39            [ 5] 2572         rts
                           2573 
   95BA                    2574 L95BA:
   95BA B6 04 5C      [ 4] 2575         ldaa    (0x045C)
   95BD 27 14         [ 3] 2576         beq     L95D3  
                           2577 
   95BF BD 8D E4      [ 6] 2578         jsr     LCDMSG1 
   95C2 43 75 72 72 65 6E  2579         .ascis  'Current: CNR   '
        74 3A 20 43 4E 52
        20 20 A0
                           2580 
   95D1 20 12         [ 3] 2581         bra     L95E5  
                           2582 
   95D3                    2583 L95D3:
   95D3 BD 8D E4      [ 6] 2584         jsr     LCDMSG1 
   95D6 43 75 72 72 65 6E  2585         .ascis  'Current: R12   '
        74 3A 20 52 31 32
        20 20 A0
                           2586 
   95E5                    2587 L95E5:
   95E5 BD 8D DD      [ 6] 2588         jsr     LCDMSG2 
   95E8 3C 45 6E 74 65 72  2589         .ascis  '<Enter> to chg.'
        3E 20 74 6F 20 63
        68 67 AE
                           2590 
   95F7                    2591 L95F7:
   95F7 BD 8E 95      [ 6] 2592         jsr     L8E95
   95FA 27 FB         [ 3] 2593         beq     L95F7  
   95FC 81 0D         [ 2] 2594         cmpa    #0x0D
   95FE 26 0F         [ 3] 2595         bne     L960F  
   9600 B6 04 5C      [ 4] 2596         ldaa    (0x045C)
   9603 27 05         [ 3] 2597         beq     L960A  
   9605 7F 04 5C      [ 6] 2598         clr     (0x045C)
   9608 20 05         [ 3] 2599         bra     L960F  
   960A                    2600 L960A:
   960A 86 01         [ 2] 2601         ldaa    #0x01
   960C B7 04 5C      [ 4] 2602         staa    (0x045C)
   960F                    2603 L960F:
   960F 39            [ 5] 2604         rts
                           2605 
   9610                    2606 L9610:
   9610 43 68 75 63 6B 2C  2607         .ascis  "Chuck,Jasper,Pasqually,Munch,Helen,Light 1,Light 2,Light 3,Star EFX,Wink Spot,Gobo,Clear All Rnd,Exit"
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
                           2608 
   9675                    2609 L9675:
   9675 BD 8D E4      [ 6] 2610         jsr     LCDMSG1 
   9678 52 61 6E 64 6F 6D  2611         .ascis  'Random          '
        20 20 20 20 20 20
        20 20 20 A0
                           2612 
   9688 CE 96 10      [ 3] 2613         ldx     #L9610
   968B BD 95 04      [ 6] 2614         jsr     L9504
   968E 5F            [ 2] 2615         clrb
   968F 37            [ 3] 2616         pshb
   9690 81 0D         [ 2] 2617         cmpa    #0x0D
   9692 26 03         [ 3] 2618         bne     L9697  
   9694 7E 97 5B      [ 3] 2619         jmp     L975B
   9697                    2620 L9697:
   9697 81 0C         [ 2] 2621         cmpa    #0x0C
   9699 26 21         [ 3] 2622         bne     L96BC  
   969B 7F 04 01      [ 6] 2623         clr     (0x0401)
   969E 7F 04 2B      [ 6] 2624         clr     (0x042B)
                           2625 
   96A1 BD 8D E4      [ 6] 2626         jsr     LCDMSG1 
   96A4 41 6C 6C 20 52 6E  2627         .ascis  'All Rnd Cleared!'
        64 20 43 6C 65 61
        72 65 64 A1
                           2628 
   96B4 C6 64         [ 2] 2629         ldab    #0x64           ; delay 1 sec
   96B6 BD 8C 22      [ 6] 2630         jsr     DLYSECSBY100
   96B9 7E 97 5B      [ 3] 2631         jmp     L975B
   96BC                    2632 L96BC:
   96BC 81 09         [ 2] 2633         cmpa    #0x09
   96BE 25 05         [ 3] 2634         bcs     L96C5  
   96C0 80 08         [ 2] 2635         suba    #0x08
   96C2 33            [ 4] 2636         pulb
   96C3 5C            [ 2] 2637         incb
   96C4 37            [ 3] 2638         pshb
   96C5                    2639 L96C5:
   96C5 5F            [ 2] 2640         clrb
   96C6 0D            [ 2] 2641         sec
   96C7                    2642 L96C7:
   96C7 59            [ 2] 2643         rolb
   96C8 4A            [ 2] 2644         deca
   96C9 26 FC         [ 3] 2645         bne     L96C7  
   96CB D7 12         [ 3] 2646         stab    (0x0012)
   96CD C8 FF         [ 2] 2647         eorb    #0xFF
   96CF D7 13         [ 3] 2648         stab    (0x0013)
   96D1                    2649 L96D1:
   96D1 CC 20 34      [ 3] 2650         ldd     #0x2034         ;' '
   96D4 BD 8D B5      [ 6] 2651         jsr     L8DB5           ; display char here on LCD display
   96D7 33            [ 4] 2652         pulb
   96D8 37            [ 3] 2653         pshb
   96D9 5D            [ 2] 2654         tstb
   96DA 27 05         [ 3] 2655         beq     L96E1  
   96DC B6 04 2B      [ 4] 2656         ldaa    (0x042B)
   96DF 20 03         [ 3] 2657         bra     L96E4  
   96E1                    2658 L96E1:
   96E1 B6 04 01      [ 4] 2659         ldaa    (0x0401)
   96E4                    2660 L96E4:
   96E4 94 12         [ 3] 2661         anda    (0x0012)
   96E6 27 0A         [ 3] 2662         beq     L96F2  
   96E8 18 DE 46      [ 5] 2663         ldy     (0x0046)
   96EB BD 8D FD      [ 6] 2664         jsr     L8DFD
   96EE 4F            [ 2] 2665         clra
   96EF EE 20         [ 5] 2666         ldx     0x20,X
   96F1 09            [ 3] 2667         dex
   96F2                    2668 L96F2:
   96F2 18 DE 46      [ 5] 2669         ldy     (0x0046)
   96F5 BD 8D FD      [ 6] 2670         jsr     L8DFD
   96F8 4F            [ 2] 2671         clra
   96F9 66 E6         [ 6] 2672         ror     0xE6,X
   96FB CC 20 34      [ 3] 2673         ldd     #0x2034         ;' '
   96FE BD 8D B5      [ 6] 2674         jsr     L8DB5           ; display char here on LCD display
   9701                    2675 L9701:
   9701 BD 8E 95      [ 6] 2676         jsr     L8E95           ; wait for an SCD key
   9704 27 FB         [ 3] 2677         beq     L9701  
   9706 81 01         [ 2] 2678         cmpa    #0x01           ; is it up?
   9708 26 22         [ 3] 2679         bne     L972C           ; no jump ahead
   970A 33            [ 4] 2680         pulb
   970B 37            [ 3] 2681         pshb
   970C 5D            [ 2] 2682         tstb
   970D 27 0A         [ 3] 2683         beq     L9719           ; if B=0, modify 0401 mask  
   970F B6 04 2B      [ 4] 2684         ldaa    (0x042B)        ; else modify 042B mask
   9712 9A 12         [ 3] 2685         oraa    (0x0012)
   9714 B7 04 2B      [ 4] 2686         staa    (0x042B)
   9717 20 08         [ 3] 2687         bra     L9721  
   9719                    2688 L9719:
   9719 B6 04 01      [ 4] 2689         ldaa    (0x0401)
   971C 9A 12         [ 3] 2690         oraa    (0x0012)
   971E B7 04 01      [ 4] 2691         staa    (0x0401)
   9721                    2692 L9721:
   9721 18 DE 46      [ 5] 2693         ldy     (0x0046)
   9724 BD 8D FD      [ 6] 2694         jsr     L8DFD
   9727 4F            [ 2] 2695         clra
   9728 6E A0         [ 3] 2696         jmp     0xA0,X
   972A 20 A5         [ 3] 2697         bra     L96D1  
   972C                    2698 L972C:
   972C 81 02         [ 2] 2699         cmpa    #0x02
   972E 26 23         [ 3] 2700         bne     L9753  
   9730 33            [ 4] 2701         pulb
   9731 37            [ 3] 2702         pshb
   9732 5D            [ 2] 2703         tstb
   9733 27 0A         [ 3] 2704         beq     L973F  
   9735 B6 04 2B      [ 4] 2705         ldaa    (0x042B)
   9738 94 13         [ 3] 2706         anda    (0x0013)
   973A B7 04 2B      [ 4] 2707         staa    (0x042B)
   973D 20 08         [ 3] 2708         bra     L9747  
   973F                    2709 L973F:
   973F B6 04 01      [ 4] 2710         ldaa    (0x0401)
   9742 94 13         [ 3] 2711         anda    (0x0013)
   9744 B7 04 01      [ 4] 2712         staa    (0x0401)
   9747                    2713 L9747:
   9747 18 DE 46      [ 5] 2714         ldy     (0x0046)
   974A BD 8D FD      [ 6] 2715         jsr     L8DFD
   974D 4F            [ 2] 2716         clra
   974E 66 E6         [ 6] 2717         ror     0xE6,X
   9750 7E 96 D1      [ 3] 2718         jmp     L96D1
   9753                    2719 L9753:
   9753 81 0D         [ 2] 2720         cmpa    #0x0D
   9755 26 AA         [ 3] 2721         bne     L9701  
   9757 33            [ 4] 2722         pulb
   9758 7E 96 75      [ 3] 2723         jmp     L9675
   975B                    2724 L975B:
   975B 33            [ 4] 2725         pulb
   975C 7E 92 92      [ 3] 2726         jmp     L9292
                           2727 
                           2728 ; do program rom checksum, and display it on the LCD screen
   975F                    2729 L975F:
   975F CE 00 00      [ 3] 2730         ldx     #0x0000
   9762 18 CE 80 00   [ 4] 2731         ldy     #0x8000
   9766                    2732 L9766:
   9766 18 E6 00      [ 5] 2733         ldab    0,Y     
   9769 18 08         [ 4] 2734         iny
   976B 3A            [ 3] 2735         abx
   976C 18 8C 00 00   [ 5] 2736         cpy     #0x0000
   9770 26 F4         [ 3] 2737         bne     L9766  
   9772 DF 17         [ 4] 2738         stx     (0x0017)        ; store rom checksum here
   9774 96 17         [ 3] 2739         ldaa    (0x0017)        ; get high byte of checksum
   9776 BD 97 9B      [ 6] 2740         jsr     L979B           ; convert it to 2 hex chars
   9779 96 12         [ 3] 2741         ldaa    (0x0012)
   977B C6 33         [ 2] 2742         ldab    #0x33
   977D BD 8D B5      [ 6] 2743         jsr     L8DB5           ; display char 1 here on LCD display
   9780 96 13         [ 3] 2744         ldaa    (0x0013)
   9782 C6 34         [ 2] 2745         ldab    #0x34
   9784 BD 8D B5      [ 6] 2746         jsr     L8DB5           ; display char 2 here on LCD display
   9787 96 18         [ 3] 2747         ldaa    (0x0018)        ; get low byte of checksum
   9789 BD 97 9B      [ 6] 2748         jsr     L979B           ; convert it to 2 hex chars
   978C 96 12         [ 3] 2749         ldaa    (0x0012)
   978E C6 35         [ 2] 2750         ldab    #0x35
   9790 BD 8D B5      [ 6] 2751         jsr     L8DB5           ; display char 1 here on LCD display
   9793 96 13         [ 3] 2752         ldaa    (0x0013)
   9795 C6 36         [ 2] 2753         ldab    #0x36
   9797 BD 8D B5      [ 6] 2754         jsr     L8DB5           ; display char 2 here on LCD display
   979A 39            [ 5] 2755         rts
                           2756 
                           2757 ; convert A to ASCII hex digit, store in (0x0012:0x0013)
   979B                    2758 L979B:
   979B 36            [ 3] 2759         psha
   979C 84 0F         [ 2] 2760         anda    #0x0F
   979E 8B 30         [ 2] 2761         adda    #0x30
   97A0 81 39         [ 2] 2762         cmpa    #0x39
   97A2 23 02         [ 3] 2763         bls     L97A6  
   97A4 8B 07         [ 2] 2764         adda    #0x07
   97A6                    2765 L97A6:
   97A6 97 13         [ 3] 2766         staa    (0x0013)
   97A8 32            [ 4] 2767         pula
   97A9 84 F0         [ 2] 2768         anda    #0xF0
   97AB 44            [ 2] 2769         lsra
   97AC 44            [ 2] 2770         lsra
   97AD 44            [ 2] 2771         lsra
   97AE 44            [ 2] 2772         lsra
   97AF 8B 30         [ 2] 2773         adda    #0x30
   97B1 81 39         [ 2] 2774         cmpa    #0x39
   97B3 23 02         [ 3] 2775         bls     L97B7  
   97B5 8B 07         [ 2] 2776         adda    #0x07
   97B7                    2777 L97B7:
   97B7 97 12         [ 3] 2778         staa    (0x0012)
   97B9 39            [ 5] 2779         rts
                           2780 
   97BA                    2781 L97BA:
   97BA BD 9D 18      [ 6] 2782         jsr     L9D18
   97BD 24 03         [ 3] 2783         bcc     L97C2  
   97BF 7E 9A 7F      [ 3] 2784         jmp     L9A7F
   97C2                    2785 L97C2:
   97C2 7D 00 79      [ 6] 2786         tst     (0x0079)
   97C5 26 0B         [ 3] 2787         bne     L97D2  
   97C7 FC 04 10      [ 5] 2788         ldd     (0x0410)
   97CA C3 00 01      [ 4] 2789         addd    #0x0001
   97CD FD 04 10      [ 5] 2790         std     (0x0410)
   97D0 20 09         [ 3] 2791         bra     L97DB  
   97D2                    2792 L97D2:
   97D2 FC 04 12      [ 5] 2793         ldd     (0x0412)
   97D5 C3 00 01      [ 4] 2794         addd    #0x0001
   97D8 FD 04 12      [ 5] 2795         std     (0x0412)
   97DB                    2796 L97DB:
   97DB 86 78         [ 2] 2797         ldaa    #0x78
   97DD 97 63         [ 3] 2798         staa    (0x0063)
   97DF 97 64         [ 3] 2799         staa    (0x0064)
   97E1 BD A3 13      [ 6] 2800         jsr     LA313
   97E4 BD AA DB      [ 6] 2801         jsr     LAADB
   97E7 86 01         [ 2] 2802         ldaa    #0x01
   97E9 97 4E         [ 3] 2803         staa    (0x004E)
   97EB 97 76         [ 3] 2804         staa    (0x0076)
   97ED 7F 00 75      [ 6] 2805         clr     (0x0075)
   97F0 7F 00 77      [ 6] 2806         clr     (0x0077)
   97F3 BD 87 AE      [ 6] 2807         jsr     L87AE
   97F6 D6 7B         [ 3] 2808         ldab    (0x007B)
   97F8 CA 20         [ 2] 2809         orab    #0x20
   97FA C4 F7         [ 2] 2810         andb    #0xF7
   97FC BD 87 48      [ 6] 2811         jsr     L8748   
   97FF 7E 85 A4      [ 3] 2812         jmp     L85A4
   9802                    2813 L9802:
   9802 7F 00 76      [ 6] 2814         clr     (0x0076)
   9805 7F 00 75      [ 6] 2815         clr     (0x0075)
   9808 7F 00 77      [ 6] 2816         clr     (0x0077)
   980B 7F 00 4E      [ 6] 2817         clr     (0x004E)
   980E D6 7B         [ 3] 2818         ldab    (0x007B)
   9810 CA 0C         [ 2] 2819         orab    #0x0C
   9812 BD 87 48      [ 6] 2820         jsr     L8748
   9815                    2821 L9815:
   9815 BD A3 1E      [ 6] 2822         jsr     LA31E
   9818 BD 86 C4      [ 6] 2823         jsr     L86C4           ; Reset boards 1-10
   981B BD 9C 51      [ 6] 2824         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   981E BD 8E 95      [ 6] 2825         jsr     L8E95
   9821 7E 84 4D      [ 3] 2826         jmp     L844D
   9824                    2827 L9824:
   9824 BD 9C 51      [ 6] 2828         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9827 7F 00 4E      [ 6] 2829         clr     (0x004E)
   982A D6 7B         [ 3] 2830         ldab    (0x007B)
   982C CA 24         [ 2] 2831         orab    #0x24
   982E C4 F7         [ 2] 2832         andb    #0xF7
   9830 BD 87 48      [ 6] 2833         jsr     L8748   
   9833 BD 87 AE      [ 6] 2834         jsr     L87AE
   9836 BD 8E 95      [ 6] 2835         jsr     L8E95
   9839 7E 84 4D      [ 3] 2836         jmp     L844D
   983C                    2837 L983C:
   983C 7F 00 78      [ 6] 2838         clr     (0x0078)
   983F B6 10 8A      [ 4] 2839         ldaa    (0x108A)
   9842 84 F9         [ 2] 2840         anda    #0xF9
   9844 B7 10 8A      [ 4] 2841         staa    (0x108A)
   9847 7D 00 AF      [ 6] 2842         tst     (0x00AF)
   984A 26 61         [ 3] 2843         bne     L98AD  
   984C 96 62         [ 3] 2844         ldaa    (0x0062)
   984E 84 01         [ 2] 2845         anda    #0x01
   9850 27 5B         [ 3] 2846         beq     L98AD  
   9852 C6 FD         [ 2] 2847         ldab    #0xFD           ; tape deck STOP
   9854 BD 86 E7      [ 6] 2848         jsr     L86E7
   9857 CC 00 32      [ 3] 2849         ldd     #0x0032
   985A DD 1B         [ 4] 2850         std     CDTIMR1
   985C CC 75 30      [ 3] 2851         ldd     #0x7530
   985F DD 1D         [ 4] 2852         std     CDTIMR2
   9861 7F 00 5A      [ 6] 2853         clr     (0x005A)
   9864                    2854 L9864:
   9864 BD 9B 19      [ 6] 2855         jsr     L9B19           ; do the random motions if enabled
   9867 7D 00 31      [ 6] 2856         tst     (0x0031)
   986A 26 04         [ 3] 2857         bne     L9870  
   986C 96 5A         [ 3] 2858         ldaa    (0x005A)
   986E 27 19         [ 3] 2859         beq     L9889  
   9870                    2860 L9870:
   9870 7F 00 31      [ 6] 2861         clr     (0x0031)
   9873 D6 62         [ 3] 2862         ldab    (0x0062)
   9875 C4 FE         [ 2] 2863         andb    #0xFE
   9877 D7 62         [ 3] 2864         stab    (0x0062)
   9879 BD F9 C5      [ 6] 2865         jsr     BUTNLIT 
   987C BD AA 13      [ 6] 2866         jsr     LAA13
   987F C6 FB         [ 2] 2867         ldab    #0xFB           ; tape deck PLAY
   9881 BD 86 E7      [ 6] 2868         jsr     L86E7
   9884 7F 00 5A      [ 6] 2869         clr     (0x005A)
   9887 20 4B         [ 3] 2870         bra     L98D4  
   9889                    2871 L9889:
   9889 DC 1B         [ 4] 2872         ldd     CDTIMR1
   988B 26 D7         [ 3] 2873         bne     L9864  
   988D D6 62         [ 3] 2874         ldab    (0x0062)
   988F C8 01         [ 2] 2875         eorb    #0x01
   9891 D7 62         [ 3] 2876         stab    (0x0062)
   9893 BD F9 C5      [ 6] 2877         jsr     BUTNLIT 
   9896 C4 01         [ 2] 2878         andb    #0x01
   9898 26 05         [ 3] 2879         bne     L989F  
   989A BD AA 0C      [ 6] 2880         jsr     LAA0C
   989D 20 03         [ 3] 2881         bra     L98A2  
   989F                    2882 L989F:
   989F BD AA 13      [ 6] 2883         jsr     LAA13
   98A2                    2884 L98A2:
   98A2 CC 00 32      [ 3] 2885         ldd     #0x0032
   98A5 DD 1B         [ 4] 2886         std     CDTIMR1
   98A7 DC 1D         [ 4] 2887         ldd     CDTIMR2
   98A9 27 C5         [ 3] 2888         beq     L9870  
   98AB 20 B7         [ 3] 2889         bra     L9864  
   98AD                    2890 L98AD:
   98AD 7D 00 75      [ 6] 2891         tst     (0x0075)
   98B0 27 03         [ 3] 2892         beq     L98B5  
   98B2 7E 99 39      [ 3] 2893         jmp     L9939
   98B5                    2894 L98B5:
   98B5 96 62         [ 3] 2895         ldaa    (0x0062)
   98B7 84 02         [ 2] 2896         anda    #0x02
   98B9 27 4E         [ 3] 2897         beq     L9909  
   98BB 7D 00 AF      [ 6] 2898         tst     (0x00AF)
   98BE 26 0B         [ 3] 2899         bne     L98CB  
   98C0 FC 04 24      [ 5] 2900         ldd     (0x0424)
   98C3 C3 00 01      [ 4] 2901         addd    #0x0001
   98C6 FD 04 24      [ 5] 2902         std     (0x0424)
   98C9 20 09         [ 3] 2903         bra     L98D4  
   98CB                    2904 L98CB:
   98CB FC 04 22      [ 5] 2905         ldd     (0x0422)
   98CE C3 00 01      [ 4] 2906         addd    #0x0001
   98D1 FD 04 22      [ 5] 2907         std     (0x0422)
   98D4                    2908 L98D4:
   98D4 FC 04 18      [ 5] 2909         ldd     (0x0418)
   98D7 C3 00 01      [ 4] 2910         addd    #0x0001
   98DA FD 04 18      [ 5] 2911         std     (0x0418)
   98DD 86 78         [ 2] 2912         ldaa    #0x78
   98DF 97 63         [ 3] 2913         staa    (0x0063)
   98E1 97 64         [ 3] 2914         staa    (0x0064)
   98E3 D6 62         [ 3] 2915         ldab    (0x0062)
   98E5 C4 F7         [ 2] 2916         andb    #0xF7
   98E7 CA 02         [ 2] 2917         orab    #0x02
   98E9 D7 62         [ 3] 2918         stab    (0x0062)
   98EB BD F9 C5      [ 6] 2919         jsr     BUTNLIT 
   98EE BD AA 18      [ 6] 2920         jsr     LAA18
   98F1 86 01         [ 2] 2921         ldaa    #0x01
   98F3 97 4E         [ 3] 2922         staa    (0x004E)
   98F5 97 75         [ 3] 2923         staa    (0x0075)
   98F7 D6 7B         [ 3] 2924         ldab    (0x007B)
   98F9 C4 DF         [ 2] 2925         andb    #0xDF
   98FB BD 87 48      [ 6] 2926         jsr     L8748   
   98FE BD 87 AE      [ 6] 2927         jsr     L87AE
   9901 BD A3 13      [ 6] 2928         jsr     LA313
   9904 BD AA DB      [ 6] 2929         jsr     LAADB
   9907 20 30         [ 3] 2930         bra     L9939  
   9909                    2931 L9909:
   9909 D6 62         [ 3] 2932         ldab    (0x0062)
   990B C4 F5         [ 2] 2933         andb    #0xF5
   990D CA 40         [ 2] 2934         orab    #0x40
   990F D7 62         [ 3] 2935         stab    (0x0062)
   9911 BD F9 C5      [ 6] 2936         jsr     BUTNLIT 
   9914 BD AA 1D      [ 6] 2937         jsr     LAA1D
   9917 7D 00 AF      [ 6] 2938         tst     (0x00AF)
   991A 26 04         [ 3] 2939         bne     L9920  
   991C C6 01         [ 2] 2940         ldab    #0x01
   991E D7 B6         [ 3] 2941         stab    (0x00B6)
   9920                    2942 L9920:
   9920 BD 9C 51      [ 6] 2943         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9923 7F 00 4E      [ 6] 2944         clr     (0x004E)
   9926 7F 00 75      [ 6] 2945         clr     (0x0075)
   9929 86 01         [ 2] 2946         ldaa    #0x01
   992B 97 77         [ 3] 2947         staa    (0x0077)
   992D D6 7B         [ 3] 2948         ldab    (0x007B)
   992F CA 24         [ 2] 2949         orab    #0x24
   9931 C4 F7         [ 2] 2950         andb    #0xF7
   9933 BD 87 48      [ 6] 2951         jsr     L8748   
   9936 BD 87 91      [ 6] 2952         jsr     L8791   
   9939                    2953 L9939:
   9939 7F 00 AF      [ 6] 2954         clr     (0x00AF)
   993C 7E 85 A4      [ 3] 2955         jmp     L85A4
   993F                    2956 L993F:
   993F 7F 00 77      [ 6] 2957         clr     (0x0077)
   9942 BD 9C 51      [ 6] 2958         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9945 7F 00 4E      [ 6] 2959         clr     (0x004E)
   9948 D6 62         [ 3] 2960         ldab    (0x0062)
   994A C4 BF         [ 2] 2961         andb    #0xBF
   994C 7D 00 75      [ 6] 2962         tst     (0x0075)
   994F 27 02         [ 3] 2963         beq     L9953  
   9951 C4 FD         [ 2] 2964         andb    #0xFD
   9953                    2965 L9953:
   9953 D7 62         [ 3] 2966         stab    (0x0062)
   9955 BD F9 C5      [ 6] 2967         jsr     BUTNLIT 
   9958 BD AA 1D      [ 6] 2968         jsr     LAA1D
   995B 7F 00 5B      [ 6] 2969         clr     (0x005B)
   995E BD 87 AE      [ 6] 2970         jsr     L87AE
   9961 D6 7B         [ 3] 2971         ldab    (0x007B)
   9963 CA 20         [ 2] 2972         orab    #0x20
   9965 BD 87 48      [ 6] 2973         jsr     L8748   
   9968 7F 00 75      [ 6] 2974         clr     (0x0075)
   996B 7F 00 76      [ 6] 2975         clr     (0x0076)
   996E 7E 98 15      [ 3] 2976         jmp     L9815
   9971                    2977 L9971:
   9971 D6 7B         [ 3] 2978         ldab    (0x007B)
   9973 C4 FB         [ 2] 2979         andb    #0xFB
   9975 BD 87 48      [ 6] 2980         jsr     L8748   
   9978 7E 85 A4      [ 3] 2981         jmp     L85A4
   997B                    2982 L997B:
   997B D6 7B         [ 3] 2983         ldab    (0x007B)
   997D CA 04         [ 2] 2984         orab    #0x04
   997F BD 87 48      [ 6] 2985         jsr     L8748   
   9982 7E 85 A4      [ 3] 2986         jmp     L85A4
   9985                    2987 L9985:
   9985 D6 7B         [ 3] 2988         ldab    (0x007B)
   9987 C4 F7         [ 2] 2989         andb    #0xF7
   9989 BD 87 48      [ 6] 2990         jsr     L8748   
   998C 7E 85 A4      [ 3] 2991         jmp     L85A4
   998F                    2992 L998F:
   998F 7D 00 77      [ 6] 2993         tst     (0x0077)
   9992 26 07         [ 3] 2994         bne     L999B
   9994 D6 7B         [ 3] 2995         ldab    (0x007B)
   9996 CA 08         [ 2] 2996         orab    #0x08
   9998 BD 87 48      [ 6] 2997         jsr     L8748   
   999B                    2998 L999B:
   999B 7E 85 A4      [ 3] 2999         jmp     L85A4
   999E                    3000 L999E:
   999E D6 7B         [ 3] 3001         ldab    (0x007B)
   99A0 C4 F3         [ 2] 3002         andb    #0xF3
   99A2 BD 87 48      [ 6] 3003         jsr     L8748   
   99A5 39            [ 5] 3004         rts
                           3005 
                           3006 ; main2
   99A6                    3007 L99A6:
   99A6 D6 7B         [ 3] 3008         ldab    (0x007B)
   99A8 C4 DF         [ 2] 3009         andb    #0xDF           ; clear bit 5
   99AA BD 87 48      [ 6] 3010         jsr     L8748
   99AD BD 87 91      [ 6] 3011         jsr     L8791   
   99B0 39            [ 5] 3012         rts
                           3013 
   99B1                    3014 L99B1:
   99B1 D6 7B         [ 3] 3015         ldab    (0x007B)
   99B3 CA 20         [ 2] 3016         orab    #0x20
   99B5 BD 87 48      [ 6] 3017         jsr     L8748   
   99B8 BD 87 AE      [ 6] 3018         jsr     L87AE
   99BB 39            [ 5] 3019         rts
                           3020 
   99BC D6 7B         [ 3] 3021         ldab    (0x007B)
   99BE C4 DF         [ 2] 3022         andb    #0xDF
   99C0 BD 87 48      [ 6] 3023         jsr     L8748   
   99C3 BD 87 AE      [ 6] 3024         jsr     L87AE
   99C6 39            [ 5] 3025         rts
                           3026 
   99C7 D6 7B         [ 3] 3027         ldab    (0x007B)
   99C9 CA 20         [ 2] 3028         orab    #0x20
   99CB BD 87 48      [ 6] 3029         jsr     L8748   
   99CE BD 87 91      [ 6] 3030         jsr     L8791   
   99D1 39            [ 5] 3031         rts
                           3032 
   99D2                    3033 L99D2:
   99D2 86 01         [ 2] 3034         ldaa    #0x01
   99D4 97 78         [ 3] 3035         staa    (0x0078)
   99D6 7E 85 A4      [ 3] 3036         jmp     L85A4
   99D9                    3037 L99D9:
   99D9 CE 0E 20      [ 3] 3038         ldx     #0x0E20
   99DC A6 00         [ 4] 3039         ldaa    0,X     
   99DE 80 30         [ 2] 3040         suba    #0x30
   99E0 C6 0A         [ 2] 3041         ldab    #0x0A
   99E2 3D            [10] 3042         mul
   99E3 17            [ 2] 3043         tba                     ; (0E20)*10 into A
   99E4 C6 64         [ 2] 3044         ldab    #0x64
   99E6 3D            [10] 3045         mul
   99E7 DD 17         [ 4] 3046         std     (0x0017)        ; (0E20)*1000 into 17:18
   99E9 A6 01         [ 4] 3047         ldaa    1,X
   99EB 80 30         [ 2] 3048         suba    #0x30
   99ED C6 64         [ 2] 3049         ldab    #0x64
   99EF 3D            [10] 3050         mul
   99F0 D3 17         [ 5] 3051         addd    (0x0017)
   99F2 DD 17         [ 4] 3052         std     (0x0017)        ; (0E20)*1000+(0E21)*100 into 17:18
   99F4 A6 02         [ 4] 3053         ldaa    2,X     
   99F6 80 30         [ 2] 3054         suba    #0x30
   99F8 C6 0A         [ 2] 3055         ldab    #0x0A
   99FA 3D            [10] 3056         mul
   99FB D3 17         [ 5] 3057         addd    (0x0017)    
   99FD DD 17         [ 4] 3058         std     (0x0017)        ; (0E20)*1000+(0E21)*100+(0E22)*10 into 17:18
   99FF 4F            [ 2] 3059         clra
   9A00 E6 03         [ 4] 3060         ldab    3,X     
   9A02 C0 30         [ 2] 3061         subb    #0x30
   9A04 D3 17         [ 5] 3062         addd    (0x0017)    
   9A06 FD 02 9C      [ 5] 3063         std     (0x029C)        ; (0E20)*1000+(0E21)*100+(0E22)*10+(0E23) into (029C:029D)
   9A09 CE 0E 20      [ 3] 3064         ldx     #0x0E20
   9A0C                    3065 L9A0C:
   9A0C A6 00         [ 4] 3066         ldaa    0,X         
   9A0E 81 30         [ 2] 3067         cmpa    #0x30
   9A10 25 13         [ 3] 3068         bcs     L9A25  
   9A12 81 39         [ 2] 3069         cmpa    #0x39
   9A14 22 0F         [ 3] 3070         bhi     L9A25  
   9A16 08            [ 3] 3071         inx
   9A17 8C 0E 24      [ 4] 3072         cpx     #0x0E24
   9A1A 26 F0         [ 3] 3073         bne     L9A0C  
   9A1C B6 0E 24      [ 4] 3074         ldaa    (0x0E24)        ; check EEPROM signature
   9A1F 81 DB         [ 2] 3075         cmpa    #0xDB
   9A21 26 02         [ 3] 3076         bne     L9A25  
   9A23 0C            [ 2] 3077         clc                     ; if sig good, return carry clear
   9A24 39            [ 5] 3078         rts
                           3079 
   9A25                    3080 L9A25:
   9A25 0D            [ 2] 3081         sec                     ; if sig bad, return carry clear
   9A26 39            [ 5] 3082         rts
                           3083 
   9A27                    3084 L9A27:
   9A27 BD 8D E4      [ 6] 3085         jsr     LCDMSG1 
   9A2A 53 65 72 69 61 6C  3086         .ascis  'Serial# '
        23 A0
                           3087 
   9A32 BD 8D DD      [ 6] 3088         jsr     LCDMSG2 
   9A35 20 20 20 20 20 20  3089         .ascis  '               '
        20 20 20 20 20 20
        20 20 A0
                           3090 
                           3091 ; display 4-digit serial number
   9A44 C6 08         [ 2] 3092         ldab    #0x08
   9A46 18 CE 0E 20   [ 4] 3093         ldy     #0x0E20
   9A4A                    3094 L9A4A:
   9A4A 18 A6 00      [ 5] 3095         ldaa    0,Y     
   9A4D 18 3C         [ 5] 3096         pshy
   9A4F 37            [ 3] 3097         pshb
   9A50 BD 8D B5      [ 6] 3098         jsr     L8DB5            ; display char here on LCD display
   9A53 33            [ 4] 3099         pulb
   9A54 18 38         [ 6] 3100         puly
   9A56 5C            [ 2] 3101         incb
   9A57 18 08         [ 4] 3102         iny
   9A59 18 8C 0E 24   [ 5] 3103         cpy     #0x0E24
   9A5D 26 EB         [ 3] 3104         bne     L9A4A  
   9A5F 39            [ 5] 3105         rts
                           3106 
                           3107 ; Unused?
   9A60                    3108 L9A60:
   9A60 86 01         [ 2] 3109         ldaa    #0x01
   9A62 97 B5         [ 3] 3110         staa    (0x00B5)
   9A64 96 4E         [ 3] 3111         ldaa    (0x004E)
   9A66 97 7F         [ 3] 3112         staa    (0x007F)
   9A68 96 62         [ 3] 3113         ldaa    (0x0062)
   9A6A 97 80         [ 3] 3114         staa    (0x0080)
   9A6C 96 7B         [ 3] 3115         ldaa    (0x007B)
   9A6E 97 81         [ 3] 3116         staa    (0x0081)
   9A70 96 7A         [ 3] 3117         ldaa    (0x007A)
   9A72 97 82         [ 3] 3118         staa    (0x0082)
   9A74 96 78         [ 3] 3119         ldaa    (0x0078)
   9A76 97 7D         [ 3] 3120         staa    (0x007D)
   9A78 B6 10 8A      [ 4] 3121         ldaa    (0x108A)
   9A7B 84 06         [ 2] 3122         anda    #0x06
   9A7D 97 7E         [ 3] 3123         staa    (0x007E)
   9A7F                    3124 L9A7F:
   9A7F C6 EF         [ 2] 3125         ldab    #0xEF           ; tape deck EJECT
   9A81 BD 86 E7      [ 6] 3126         jsr     L86E7
   9A84 D6 7B         [ 3] 3127         ldab    (0x007B)
   9A86 CA 0C         [ 2] 3128         orab    #0x0C
   9A88 C4 DF         [ 2] 3129         andb    #0xDF
   9A8A BD 87 48      [ 6] 3130         jsr     L8748   
   9A8D BD 87 91      [ 6] 3131         jsr     L8791   
   9A90 BD 86 C4      [ 6] 3132         jsr     L86C4           ; Reset boards 1-10
   9A93 BD 9C 51      [ 6] 3133         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9A96 C6 06         [ 2] 3134         ldab    #0x06           ; delay 6 secs
   9A98 BD 8C 02      [ 6] 3135         jsr     DLYSECS         ;
   9A9B BD 8E 95      [ 6] 3136         jsr     L8E95
   9A9E BD 99 A6      [ 6] 3137         jsr     L99A6
   9AA1 7E 81 BD      [ 3] 3138         jmp     L81BD
   9AA4                    3139 L9AA4:
   9AA4 7F 00 5C      [ 6] 3140         clr     (0x005C)
   9AA7 86 01         [ 2] 3141         ldaa    #0x01
   9AA9 97 79         [ 3] 3142         staa    (0x0079)
   9AAB C6 FD         [ 2] 3143         ldab    #0xFD           ; tape deck STOP
   9AAD BD 86 E7      [ 6] 3144         jsr     L86E7
   9AB0 BD 8E 95      [ 6] 3145         jsr     L8E95
   9AB3 CC 75 30      [ 3] 3146         ldd     #0x7530
   9AB6 DD 1D         [ 4] 3147         std     CDTIMR2
   9AB8                    3148 L9AB8:
   9AB8 BD 9B 19      [ 6] 3149         jsr     L9B19           ; do the random motions if enabled
   9ABB D6 62         [ 3] 3150         ldab    (0x0062)
   9ABD C8 04         [ 2] 3151         eorb    #0x04
   9ABF D7 62         [ 3] 3152         stab    (0x0062)
   9AC1 BD F9 C5      [ 6] 3153         jsr     BUTNLIT 
   9AC4 F6 18 04      [ 4] 3154         ldab    PIA0PRA 
   9AC7 C8 08         [ 2] 3155         eorb    #0x08
   9AC9 F7 18 04      [ 4] 3156         stab    PIA0PRA 
   9ACC 7D 00 5C      [ 6] 3157         tst     (0x005C)
   9ACF 26 12         [ 3] 3158         bne     L9AE3  
   9AD1 BD 8E 95      [ 6] 3159         jsr     L8E95
   9AD4 81 0D         [ 2] 3160         cmpa    #0x0D
   9AD6 27 0B         [ 3] 3161         beq     L9AE3  
   9AD8 C6 32         [ 2] 3162         ldab    #0x32           ; delay 0.5 sec
   9ADA BD 8C 22      [ 6] 3163         jsr     DLYSECSBY100
   9ADD DC 1D         [ 4] 3164         ldd     CDTIMR2
   9ADF 27 02         [ 3] 3165         beq     L9AE3  
   9AE1 20 D5         [ 3] 3166         bra     L9AB8  
   9AE3                    3167 L9AE3:
   9AE3 D6 62         [ 3] 3168         ldab    (0x0062)
   9AE5 C4 FB         [ 2] 3169         andb    #0xFB
   9AE7 D7 62         [ 3] 3170         stab    (0x0062)
   9AE9 BD F9 C5      [ 6] 3171         jsr     BUTNLIT 
   9AEC BD A3 54      [ 6] 3172         jsr     LA354
   9AEF C6 FB         [ 2] 3173         ldab    #0xFB           ; tape deck PLAY
   9AF1 BD 86 E7      [ 6] 3174         jsr     L86E7
   9AF4 7E 85 A4      [ 3] 3175         jmp     L85A4
   9AF7                    3176 L9AF7:
   9AF7 7F 00 75      [ 6] 3177         clr     (0x0075)
   9AFA 7F 00 76      [ 6] 3178         clr     (0x0076)
   9AFD 7F 00 77      [ 6] 3179         clr     (0x0077)
   9B00 7F 00 78      [ 6] 3180         clr     (0x0078)
   9B03 7F 00 25      [ 6] 3181         clr     (0x0025)
   9B06 7F 00 26      [ 6] 3182         clr     (0x0026)
   9B09 7F 00 4E      [ 6] 3183         clr     (0x004E)
   9B0C 7F 00 30      [ 6] 3184         clr     (0x0030)        ; clear SCD key states
   9B0F 7F 00 31      [ 6] 3185         clr     (0x0031)
   9B12 7F 00 32      [ 6] 3186         clr     (0x0032)
   9B15 7F 00 AF      [ 6] 3187         clr     (0x00AF)
   9B18 39            [ 5] 3188         rts
                           3189 
                           3190 ; do the random motions if enabled
   9B19                    3191 L9B19:
   9B19 36            [ 3] 3192         psha
   9B1A 37            [ 3] 3193         pshb
   9B1B 96 4E         [ 3] 3194         ldaa    (0x004E)
   9B1D 27 17         [ 3] 3195         beq     L9B36           ; go to 0401 logic
   9B1F 96 63         [ 3] 3196         ldaa    (0x0063)        ; check countdown timer
   9B21 26 10         [ 3] 3197         bne     L9B33           ; exit
   9B23 7D 00 64      [ 6] 3198         tst     (0x0064)
   9B26 27 09         [ 3] 3199         beq     L9B31           ; go to 0401 logic
   9B28 BD 86 C4      [ 6] 3200         jsr     L86C4           ; Reset boards 1-10
   9B2B BD 9C 51      [ 6] 3201         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9B2E 7F 00 64      [ 6] 3202         clr     (0x0064)
   9B31                    3203 L9B31:
   9B31 20 03         [ 3] 3204         bra     L9B36           ; go to 0401 logic
   9B33                    3205 L9B33:
   9B33 33            [ 4] 3206         pulb
   9B34 32            [ 4] 3207         pula
   9B35 39            [ 5] 3208         rts
                           3209 
                           3210 ; end up here immediately if:
                           3211 ; 0x004E == 00 or
                           3212 ; 0x0063, 0x0064 == 0 or
                           3213 ; 
                           3214 ; do subroutines based on bits 0-4 of 0x0401?
   9B36                    3215 L9B36:
   9B36 B6 04 01      [ 4] 3216         ldaa    (0x0401)
   9B39 84 01         [ 2] 3217         anda    #0x01
   9B3B 27 03         [ 3] 3218         beq     L9B40  
   9B3D BD 9B 6B      [ 6] 3219         jsr     L9B6B           ; bit 0 routine
   9B40                    3220 L9B40:
   9B40 B6 04 01      [ 4] 3221         ldaa    (0x0401)
   9B43 84 02         [ 2] 3222         anda    #0x02
   9B45 27 03         [ 3] 3223         beq     L9B4A  
   9B47 BD 9B 99      [ 6] 3224         jsr     L9B99           ; bit 1 routine
   9B4A                    3225 L9B4A:
   9B4A B6 04 01      [ 4] 3226         ldaa    (0x0401)
   9B4D 84 04         [ 2] 3227         anda    #0x04
   9B4F 27 03         [ 3] 3228         beq     L9B54  
   9B51 BD 9B C7      [ 6] 3229         jsr     L9BC7           ; bit 2 routine
   9B54                    3230 L9B54:
   9B54 B6 04 01      [ 4] 3231         ldaa    (0x0401)
   9B57 84 08         [ 2] 3232         anda    #0x08
   9B59 27 03         [ 3] 3233         beq     L9B5E  
   9B5B BD 9B F5      [ 6] 3234         jsr     L9BF5           ; bit 3 routine
   9B5E                    3235 L9B5E:
   9B5E B6 04 01      [ 4] 3236         ldaa    (0x0401)
   9B61 84 10         [ 2] 3237         anda    #0x10
   9B63 27 03         [ 3] 3238         beq     L9B68  
   9B65 BD 9C 23      [ 6] 3239         jsr     L9C23           ; bit 4 routine
   9B68                    3240 L9B68:
   9B68 33            [ 4] 3241         pulb
   9B69 32            [ 4] 3242         pula
   9B6A 39            [ 5] 3243         rts
                           3244 
                           3245 ; bit 0 routine
   9B6B                    3246 L9B6B:
   9B6B 18 3C         [ 5] 3247         pshy
   9B6D 18 DE 65      [ 5] 3248         ldy     (0x0065)
   9B70 18 A6 00      [ 5] 3249         ldaa    0,Y     
   9B73 81 FF         [ 2] 3250         cmpa    #0xFF
   9B75 27 14         [ 3] 3251         beq     L9B8B  
   9B77 91 70         [ 3] 3252         cmpa    OFFCNT1
   9B79 25 0D         [ 3] 3253         bcs     L9B88  
   9B7B 18 08         [ 4] 3254         iny
   9B7D 18 A6 00      [ 5] 3255         ldaa    0,Y     
   9B80 B7 10 80      [ 4] 3256         staa    (0x1080)        ; do some stuff to board 1
   9B83 18 08         [ 4] 3257         iny
   9B85 18 DF 65      [ 5] 3258         sty     (0x0065)
   9B88                    3259 L9B88:
   9B88 18 38         [ 6] 3260         puly
   9B8A 39            [ 5] 3261         rts
   9B8B                    3262 L9B8B:
   9B8B 18 CE B2 EB   [ 4] 3263         ldy     #LB2EB
   9B8F 18 DF 65      [ 5] 3264         sty     (0x0065)
   9B92 86 FA         [ 2] 3265         ldaa    #0xFA
   9B94 97 70         [ 3] 3266         staa    OFFCNT1
   9B96 7E 9B 88      [ 3] 3267         jmp     L9B88
                           3268 
                           3269 ; bit 1 routine
   9B99                    3270 L9B99:
   9B99 18 3C         [ 5] 3271         pshy
   9B9B 18 DE 67      [ 5] 3272         ldy     (0x0067)
   9B9E 18 A6 00      [ 5] 3273         ldaa    0,Y     
   9BA1 81 FF         [ 2] 3274         cmpa    #0xFF
   9BA3 27 14         [ 3] 3275         beq     L9BB9  
   9BA5 91 71         [ 3] 3276         cmpa    OFFCNT2
   9BA7 25 0D         [ 3] 3277         bcs     L9BB6  
   9BA9 18 08         [ 4] 3278         iny
   9BAB 18 A6 00      [ 5] 3279         ldaa    0,Y     
   9BAE B7 10 84      [ 4] 3280         staa    (0x1084)        ; do some stuff to board 2
   9BB1 18 08         [ 4] 3281         iny
   9BB3 18 DF 67      [ 5] 3282         sty     (0x0067)
   9BB6                    3283 L9BB6:
   9BB6 18 38         [ 6] 3284         puly
   9BB8 39            [ 5] 3285         rts
   9BB9                    3286 L9BB9:
   9BB9 18 CE B3 BD   [ 4] 3287         ldy     #LB3BD
   9BBD 18 DF 67      [ 5] 3288         sty     (0x0067)
   9BC0 86 E6         [ 2] 3289         ldaa    #0xE6
   9BC2 97 71         [ 3] 3290         staa    OFFCNT2
   9BC4 7E 9B B6      [ 3] 3291         jmp     L9BB6
                           3292 
                           3293 ; bit 2 routine
   9BC7                    3294 L9BC7:
   9BC7 18 3C         [ 5] 3295         pshy
   9BC9 18 DE 69      [ 5] 3296         ldy     (0x0069)
   9BCC 18 A6 00      [ 5] 3297         ldaa    0,Y     
   9BCF 81 FF         [ 2] 3298         cmpa    #0xFF
   9BD1 27 14         [ 3] 3299         beq     L9BE7  
   9BD3 91 72         [ 3] 3300         cmpa    OFFCNT3
   9BD5 25 0D         [ 3] 3301         bcs     L9BE4  
   9BD7 18 08         [ 4] 3302         iny
   9BD9 18 A6 00      [ 5] 3303         ldaa    0,Y     
   9BDC B7 10 88      [ 4] 3304         staa    (0x1088)        ; do some stuff to board 3
   9BDF 18 08         [ 4] 3305         iny
   9BE1 18 DF 69      [ 5] 3306         sty     (0x0069)
   9BE4                    3307 L9BE4:
   9BE4 18 38         [ 6] 3308         puly
   9BE6 39            [ 5] 3309         rts
   9BE7                    3310 L9BE7:
   9BE7 18 CE B5 31   [ 4] 3311         ldy     #LB531
   9BEB 18 DF 69      [ 5] 3312         sty     (0x0069)
   9BEE 86 D2         [ 2] 3313         ldaa    #0xD2
   9BF0 97 72         [ 3] 3314         staa    OFFCNT3
   9BF2 7E 9B E4      [ 3] 3315         jmp     L9BE4
                           3316 
                           3317 ; bit 3 routine
   9BF5                    3318 L9BF5:
   9BF5 18 3C         [ 5] 3319         pshy
   9BF7 18 DE 6B      [ 5] 3320         ldy     (0x006B)
   9BFA 18 A6 00      [ 5] 3321         ldaa    0,Y     
   9BFD 81 FF         [ 2] 3322         cmpa    #0xFF
   9BFF 27 14         [ 3] 3323         beq     L9C15  
   9C01 91 73         [ 3] 3324         cmpa    OFFCNT4
   9C03 25 0D         [ 3] 3325         bcs     L9C12  
   9C05 18 08         [ 4] 3326         iny
   9C07 18 A6 00      [ 5] 3327         ldaa    0,Y     
   9C0A B7 10 8C      [ 4] 3328         staa    (0x108C)        ; do some stuff to board 4
   9C0D 18 08         [ 4] 3329         iny
   9C0F 18 DF 6B      [ 5] 3330         sty     (0x006B)
   9C12                    3331 L9C12:
   9C12 18 38         [ 6] 3332         puly
   9C14 39            [ 5] 3333         rts
   9C15                    3334 L9C15:
   9C15 18 CE B4 75   [ 4] 3335         ldy     #LB475
   9C19 18 DF 6B      [ 5] 3336         sty     (0x006B)
   9C1C 86 BE         [ 2] 3337         ldaa    #0xBE
   9C1E 97 73         [ 3] 3338         staa    OFFCNT4
   9C20 7E 9C 12      [ 3] 3339         jmp     L9C12
                           3340 
                           3341 ; bit 4 routine
   9C23                    3342 L9C23:
   9C23 18 3C         [ 5] 3343         pshy
   9C25 18 DE 6D      [ 5] 3344         ldy     (0x006D)
   9C28 18 A6 00      [ 5] 3345         ldaa    0,Y     
   9C2B 81 FF         [ 2] 3346         cmpa    #0xFF
   9C2D 27 14         [ 3] 3347         beq     L9C43  
   9C2F 91 74         [ 3] 3348         cmpa    OFFCNT5
   9C31 25 0D         [ 3] 3349         bcs     L9C40  
   9C33 18 08         [ 4] 3350         iny
   9C35 18 A6 00      [ 5] 3351         ldaa    0,Y     
   9C38 B7 10 90      [ 4] 3352         staa    (0x1090)        ; do some stuff to board 5
   9C3B 18 08         [ 4] 3353         iny
   9C3D 18 DF 6D      [ 5] 3354         sty     (0x006D)
   9C40                    3355 L9C40:
   9C40 18 38         [ 6] 3356         puly
   9C42 39            [ 5] 3357         rts
   9C43                    3358 L9C43:
   9C43 18 CE B5 C3   [ 4] 3359         ldy     #LB5C3
   9C47 18 DF 6D      [ 5] 3360         sty     (0x006D)
   9C4A 86 AA         [ 2] 3361         ldaa    #0xAA
   9C4C 97 74         [ 3] 3362         staa    OFFCNT5
   9C4E 7E 9C 40      [ 3] 3363         jmp     L9C40
                           3364 
                           3365 ; Reset offset counters to initial values
   9C51                    3366 L9C51:
   9C51 86 FA         [ 2] 3367         ldaa    #0xFA
   9C53 97 70         [ 3] 3368         staa    OFFCNT1
   9C55 86 E6         [ 2] 3369         ldaa    #0xE6
   9C57 97 71         [ 3] 3370         staa    OFFCNT2
   9C59 86 D2         [ 2] 3371         ldaa    #0xD2
   9C5B 97 72         [ 3] 3372         staa    OFFCNT3
   9C5D 86 BE         [ 2] 3373         ldaa    #0xBE
   9C5F 97 73         [ 3] 3374         staa    OFFCNT4
   9C61 86 AA         [ 2] 3375         ldaa    #0xAA
   9C63 97 74         [ 3] 3376         staa    OFFCNT5
                           3377 
                           3378         ; int random movement table pointers
   9C65 18 CE B2 EB   [ 4] 3379         ldy     #LB2EB
   9C69 18 DF 65      [ 5] 3380         sty     (0x0065)
   9C6C 18 CE B3 BD   [ 4] 3381         ldy     #LB3BD
   9C70 18 DF 67      [ 5] 3382         sty     (0x0067)
   9C73 18 CE B5 31   [ 4] 3383         ldy     #LB531
   9C77 18 DF 69      [ 5] 3384         sty     (0x0069)
   9C7A 18 CE B4 75   [ 4] 3385         ldy     #LB475
   9C7E 18 DF 6B      [ 5] 3386         sty     (0x006B)
   9C81 18 CE B5 C3   [ 4] 3387         ldy     #LB5C3
   9C85 18 DF 6D      [ 5] 3388         sty     (0x006D)
                           3389 
                           3390         ; clear board 8
   9C88 7F 10 9C      [ 6] 3391         clr     (0x109C)
   9C8B 7F 10 9E      [ 6] 3392         clr     (0x109E)
                           3393 
                           3394         ; if bit 5 of 0401 is set, turn on 3 bits on board 8
   9C8E B6 04 01      [ 4] 3395         ldaa    (0x0401)
   9C91 84 20         [ 2] 3396         anda    #0x20
   9C93 27 08         [ 3] 3397         beq     L9C9D
   9C95 B6 10 9C      [ 4] 3398         ldaa    (0x109C)
   9C98 8A 19         [ 2] 3399         oraa    #0x19
   9C9A B7 10 9C      [ 4] 3400         staa    (0x109C)
                           3401         ; if bit 6 of 0401 is set, turn on 3 bits on board 8
   9C9D                    3402 L9C9D:
   9C9D B6 04 01      [ 4] 3403         ldaa    (0x0401)
   9CA0 84 40         [ 2] 3404         anda    #0x40
   9CA2 27 10         [ 3] 3405         beq     L9CB4  
   9CA4 B6 10 9C      [ 4] 3406         ldaa    (0x109C)
   9CA7 8A 44         [ 2] 3407         oraa    #0x44
   9CA9 B7 10 9C      [ 4] 3408         staa    (0x109C)
   9CAC B6 10 9E      [ 4] 3409         ldaa    (0x109E)
   9CAF 8A 40         [ 2] 3410         oraa    #0x40
   9CB1 B7 10 9E      [ 4] 3411         staa    (0x109E)
                           3412         ; if bit 7 of 0401 is set, turn on 3 bits on board 8
   9CB4                    3413 L9CB4:
   9CB4 B6 04 01      [ 4] 3414         ldaa    (0x0401)
   9CB7 84 80         [ 2] 3415         anda    #0x80
   9CB9 27 08         [ 3] 3416         beq     L9CC3  
   9CBB B6 10 9C      [ 4] 3417         ldaa    (0x109C)
   9CBE 8A A2         [ 2] 3418         oraa    #0xA2
   9CC0 B7 10 9C      [ 4] 3419         staa    (0x109C)
                           3420 
   9CC3                    3421 L9CC3:
                           3422         ; if bit 0 of 042B is set, turn on 1 bit on board 7
   9CC3 B6 04 2B      [ 4] 3423         ldaa    (0x042B)
   9CC6 84 01         [ 2] 3424         anda    #0x01
   9CC8 27 08         [ 3] 3425         beq     L9CD2  
   9CCA B6 10 9A      [ 4] 3426         ldaa    (0x109A)
   9CCD 8A 80         [ 2] 3427         oraa    #0x80
   9CCF B7 10 9A      [ 4] 3428         staa    (0x109A)
   9CD2                    3429 L9CD2:
                           3430         ; if bit 1 of 042B is set, turn on 1 bit on board 8
   9CD2 B6 04 2B      [ 4] 3431         ldaa    (0x042B)
   9CD5 84 02         [ 2] 3432         anda    #0x02
   9CD7 27 08         [ 3] 3433         beq     L9CE1  
   9CD9 B6 10 9E      [ 4] 3434         ldaa    (0x109E)
   9CDC 8A 04         [ 2] 3435         oraa    #0x04
   9CDE B7 10 9E      [ 4] 3436         staa    (0x109E)
   9CE1                    3437 L9CE1:
                           3438         ; if bit 2 of 042B is set, turn on 1 bit on board 8
   9CE1 B6 04 2B      [ 4] 3439         ldaa    (0x042B)
   9CE4 84 04         [ 2] 3440         anda    #0x04
   9CE6 27 08         [ 3] 3441         beq     L9CF0  
   9CE8 B6 10 9E      [ 4] 3442         ldaa    (0x109E)
   9CEB 8A 08         [ 2] 3443         oraa    #0x08
   9CED B7 10 9E      [ 4] 3444         staa    (0x109E)
   9CF0                    3445 L9CF0:
   9CF0 39            [ 5] 3446         rts
                           3447 
                           3448 ; Display Credits
   9CF1                    3449 L9CF1:
   9CF1 BD 8D E4      [ 6] 3450         jsr     LCDMSG1 
   9CF4 20 20 20 50 72 6F  3451         .ascis  '   Program by   '
        67 72 61 6D 20 62
        79 20 20 A0
                           3452 
   9D04 BD 8D DD      [ 6] 3453         jsr     LCDMSG2 
   9D07 44 61 76 69 64 20  3454         .ascis  'David  Philipsen'
        20 50 68 69 6C 69
        70 73 65 EE
                           3455 
   9D17 39            [ 5] 3456         rts
                           3457 
   9D18                    3458 L9D18:
   9D18 97 49         [ 3] 3459         staa    (0x0049)
   9D1A 7F 00 B8      [ 6] 3460         clr     (0x00B8)
   9D1D BD 8D 03      [ 6] 3461         jsr     L8D03
   9D20 86 2A         [ 2] 3462         ldaa    #0x2A           ;'*'
   9D22 C6 28         [ 2] 3463         ldab    #0x28
   9D24 BD 8D B5      [ 6] 3464         jsr     L8DB5           ; display char here on LCD display
   9D27 CC 0B B8      [ 3] 3465         ldd     #0x0BB8         ; start 30 second timer?
   9D2A DD 1B         [ 4] 3466         std     CDTIMR1
   9D2C                    3467 L9D2C:
   9D2C BD 9B 19      [ 6] 3468         jsr     L9B19           ; do the random motions if enabled
   9D2F 96 49         [ 3] 3469         ldaa    (0x0049)
   9D31 81 41         [ 2] 3470         cmpa    #0x41
   9D33 27 04         [ 3] 3471         beq     L9D39  
   9D35 81 4B         [ 2] 3472         cmpa    #0x4B
   9D37 26 04         [ 3] 3473         bne     L9D3D  
   9D39                    3474 L9D39:
   9D39 C6 01         [ 2] 3475         ldab    #0x01
   9D3B D7 B8         [ 3] 3476         stab    (0x00B8)
   9D3D                    3477 L9D3D:
   9D3D 81 41         [ 2] 3478         cmpa    #0x41
   9D3F 27 04         [ 3] 3479         beq     L9D45  
   9D41 81 4F         [ 2] 3480         cmpa    #0x4F
   9D43 26 07         [ 3] 3481         bne     L9D4C  
   9D45                    3482 L9D45:
   9D45 86 01         [ 2] 3483         ldaa    #0x01
   9D47 B7 02 98      [ 4] 3484         staa    (0x0298)
   9D4A 20 32         [ 3] 3485         bra     L9D7E  
   9D4C                    3486 L9D4C:
   9D4C 81 4B         [ 2] 3487         cmpa    #0x4B
   9D4E 27 04         [ 3] 3488         beq     L9D54  
   9D50 81 50         [ 2] 3489         cmpa    #0x50
   9D52 26 07         [ 3] 3490         bne     L9D5B  
   9D54                    3491 L9D54:
   9D54 86 02         [ 2] 3492         ldaa    #0x02
   9D56 B7 02 98      [ 4] 3493         staa    (0x0298)
   9D59 20 23         [ 3] 3494         bra     L9D7E  
   9D5B                    3495 L9D5B:
   9D5B 81 4C         [ 2] 3496         cmpa    #0x4C
   9D5D 26 07         [ 3] 3497         bne     L9D66  
   9D5F 86 03         [ 2] 3498         ldaa    #0x03
   9D61 B7 02 98      [ 4] 3499         staa    (0x0298)
   9D64 20 18         [ 3] 3500         bra     L9D7E  
   9D66                    3501 L9D66:
   9D66 81 52         [ 2] 3502         cmpa    #0x52
   9D68 26 07         [ 3] 3503         bne     L9D71  
   9D6A 86 04         [ 2] 3504         ldaa    #0x04
   9D6C B7 02 98      [ 4] 3505         staa    (0x0298)
   9D6F 20 0D         [ 3] 3506         bra     L9D7E  
   9D71                    3507 L9D71:
   9D71 DC 1B         [ 4] 3508         ldd     CDTIMR1
   9D73 26 B7         [ 3] 3509         bne     L9D2C  
   9D75 86 23         [ 2] 3510         ldaa    #0x23           ;'#'
   9D77 C6 29         [ 2] 3511         ldab    #0x29
   9D79 BD 8D B5      [ 6] 3512         jsr     L8DB5           ; display char here on LCD display
   9D7C 20 6C         [ 3] 3513         bra     L9DEA  
   9D7E                    3514 L9D7E:
   9D7E 7F 00 49      [ 6] 3515         clr     (0x0049)
   9D81 86 2A         [ 2] 3516         ldaa    #0x2A           ;'*'
   9D83 C6 29         [ 2] 3517         ldab    #0x29
   9D85 BD 8D B5      [ 6] 3518         jsr     L8DB5           ; display char here on LCD display
   9D88 7F 00 4A      [ 6] 3519         clr     (0x004A)
   9D8B CE 02 99      [ 3] 3520         ldx     #0x0299
   9D8E                    3521 L9D8E:
   9D8E BD 9B 19      [ 6] 3522         jsr     L9B19           ; do the random motions if enabled
   9D91 96 4A         [ 3] 3523         ldaa    (0x004A)
   9D93 27 F9         [ 3] 3524         beq     L9D8E  
   9D95 7F 00 4A      [ 6] 3525         clr     (0x004A)
   9D98 84 3F         [ 2] 3526         anda    #0x3F
   9D9A A7 00         [ 4] 3527         staa    0,X     
   9D9C 08            [ 3] 3528         inx
   9D9D 8C 02 9C      [ 4] 3529         cpx     #0x029C
   9DA0 26 EC         [ 3] 3530         bne     L9D8E  
   9DA2 BD 9D F5      [ 6] 3531         jsr     L9DF5
   9DA5 24 09         [ 3] 3532         bcc     L9DB0  
   9DA7 86 23         [ 2] 3533         ldaa    #0x23           ;'#'
   9DA9 C6 2A         [ 2] 3534         ldab    #0x2A
   9DAB BD 8D B5      [ 6] 3535         jsr     L8DB5           ; display char here on LCD display
   9DAE 20 3A         [ 3] 3536         bra     L9DEA  
   9DB0                    3537 L9DB0:
   9DB0 86 2A         [ 2] 3538         ldaa    #0x2A           ;'*'
   9DB2 C6 2A         [ 2] 3539         ldab    #0x2A
   9DB4 BD 8D B5      [ 6] 3540         jsr     L8DB5           ; display char here on LCD display
   9DB7 B6 02 99      [ 4] 3541         ldaa    (0x0299)
   9DBA 81 39         [ 2] 3542         cmpa    #0x39
   9DBC 26 15         [ 3] 3543         bne     L9DD3  
                           3544 
   9DBE BD 8D DD      [ 6] 3545         jsr     LCDMSG2 
   9DC1 47 65 6E 65 72 69  3546         .ascis  'Generic Showtape'
        63 20 53 68 6F 77
        74 61 70 E5
                           3547 
   9DD1 0C            [ 2] 3548         clc
   9DD2 39            [ 5] 3549         rts
                           3550 
   9DD3                    3551 L9DD3:
   9DD3 B6 02 98      [ 4] 3552         ldaa    (0x0298)
   9DD6 81 03         [ 2] 3553         cmpa    #0x03
   9DD8 27 0E         [ 3] 3554         beq     L9DE8  
   9DDA 81 04         [ 2] 3555         cmpa    #0x04
   9DDC 27 0A         [ 3] 3556         beq     L9DE8  
   9DDE 96 76         [ 3] 3557         ldaa    (0x0076)
   9DE0 26 06         [ 3] 3558         bne     L9DE8  
   9DE2 BD 9E 73      [ 6] 3559         jsr     L9E73
   9DE5 BD 9E CC      [ 6] 3560         jsr     L9ECC
   9DE8                    3561 L9DE8:
   9DE8 0C            [ 2] 3562         clc
   9DE9 39            [ 5] 3563         rts
                           3564 
   9DEA                    3565 L9DEA:
   9DEA FC 04 20      [ 5] 3566         ldd     (0x0420)
   9DED C3 00 01      [ 4] 3567         addd    #0x0001
   9DF0 FD 04 20      [ 5] 3568         std     (0x0420)
   9DF3 0D            [ 2] 3569         sec
   9DF4 39            [ 5] 3570         rts
                           3571 
   9DF5                    3572 L9DF5:
   9DF5 B6 02 99      [ 4] 3573         ldaa    (0x0299)
   9DF8 81 39         [ 2] 3574         cmpa    #0x39
   9DFA 27 6C         [ 3] 3575         beq     L9E68  
   9DFC CE 00 A8      [ 3] 3576         ldx     #0x00A8
   9DFF                    3577 L9DFF:
   9DFF BD 9B 19      [ 6] 3578         jsr     L9B19           ; do the random motions if enabled
   9E02 96 4A         [ 3] 3579         ldaa    (0x004A)
   9E04 27 F9         [ 3] 3580         beq     L9DFF  
   9E06 7F 00 4A      [ 6] 3581         clr     (0x004A)
   9E09 A7 00         [ 4] 3582         staa    0,X     
   9E0B 08            [ 3] 3583         inx
   9E0C 8C 00 AA      [ 4] 3584         cpx     #0x00AA
   9E0F 26 EE         [ 3] 3585         bne     L9DFF  
   9E11 BD 9E FA      [ 6] 3586         jsr     L9EFA
   9E14 CE 02 99      [ 3] 3587         ldx     #0x0299
   9E17 7F 00 13      [ 6] 3588         clr     (0x0013)
   9E1A                    3589 L9E1A:
   9E1A A6 00         [ 4] 3590         ldaa    0,X     
   9E1C 9B 13         [ 3] 3591         adda    (0x0013)
   9E1E 97 13         [ 3] 3592         staa    (0x0013)
   9E20 08            [ 3] 3593         inx
   9E21 8C 02 9C      [ 4] 3594         cpx     #0x029C
   9E24 26 F4         [ 3] 3595         bne     L9E1A  
   9E26 91 A8         [ 3] 3596         cmpa    (0x00A8)
   9E28 26 47         [ 3] 3597         bne     L9E71  
   9E2A CE 04 02      [ 3] 3598         ldx     #0x0402
   9E2D B6 02 98      [ 4] 3599         ldaa    (0x0298)
   9E30 81 02         [ 2] 3600         cmpa    #0x02
   9E32 26 03         [ 3] 3601         bne     L9E37  
   9E34 CE 04 05      [ 3] 3602         ldx     #0x0405
   9E37                    3603 L9E37:
   9E37 3C            [ 4] 3604         pshx
   9E38 BD AB 56      [ 6] 3605         jsr     LAB56
   9E3B 38            [ 5] 3606         pulx
   9E3C 25 07         [ 3] 3607         bcs     L9E45  
   9E3E 86 03         [ 2] 3608         ldaa    #0x03
   9E40 B7 02 98      [ 4] 3609         staa    (0x0298)
   9E43 20 23         [ 3] 3610         bra     L9E68  
   9E45                    3611 L9E45:
   9E45 B6 02 99      [ 4] 3612         ldaa    (0x0299)
   9E48 A1 00         [ 4] 3613         cmpa    0,X     
   9E4A 25 1E         [ 3] 3614         bcs     L9E6A  
   9E4C 27 02         [ 3] 3615         beq     L9E50  
   9E4E 24 18         [ 3] 3616         bcc     L9E68  
   9E50                    3617 L9E50:
   9E50 08            [ 3] 3618         inx
   9E51 B6 02 9A      [ 4] 3619         ldaa    (0x029A)
   9E54 A1 00         [ 4] 3620         cmpa    0,X     
   9E56 25 12         [ 3] 3621         bcs     L9E6A  
   9E58 27 02         [ 3] 3622         beq     L9E5C  
   9E5A 24 0C         [ 3] 3623         bcc     L9E68  
   9E5C                    3624 L9E5C:
   9E5C 08            [ 3] 3625         inx
   9E5D B6 02 9B      [ 4] 3626         ldaa    (0x029B)
   9E60 A1 00         [ 4] 3627         cmpa    0,X     
   9E62 25 06         [ 3] 3628         bcs     L9E6A  
   9E64 27 02         [ 3] 3629         beq     L9E68  
   9E66 24 00         [ 3] 3630         bcc     L9E68  
   9E68                    3631 L9E68:
   9E68 0C            [ 2] 3632         clc
   9E69 39            [ 5] 3633         rts
                           3634 
   9E6A                    3635 L9E6A:
   9E6A B6 02 98      [ 4] 3636         ldaa    (0x0298)
   9E6D 81 03         [ 2] 3637         cmpa    #0x03
   9E6F 27 F7         [ 3] 3638         beq     L9E68  
   9E71                    3639 L9E71:
   9E71 0D            [ 2] 3640         sec
   9E72 39            [ 5] 3641         rts
                           3642 
   9E73                    3643 L9E73:
   9E73 CE 04 02      [ 3] 3644         ldx     #0x0402
   9E76 B6 02 98      [ 4] 3645         ldaa    (0x0298)
   9E79 81 02         [ 2] 3646         cmpa    #0x02
   9E7B 26 03         [ 3] 3647         bne     L9E80  
   9E7D CE 04 05      [ 3] 3648         ldx     #0x0405
   9E80                    3649 L9E80:
   9E80 B6 02 99      [ 4] 3650         ldaa    (0x0299)
   9E83 A7 00         [ 4] 3651         staa    0,X     
   9E85 08            [ 3] 3652         inx
   9E86 B6 02 9A      [ 4] 3653         ldaa    (0x029A)
   9E89 A7 00         [ 4] 3654         staa    0,X     
   9E8B 08            [ 3] 3655         inx
   9E8C B6 02 9B      [ 4] 3656         ldaa    (0x029B)
   9E8F A7 00         [ 4] 3657         staa    0,X     
   9E91 39            [ 5] 3658         rts
                           3659 
                           3660 ; reset R counts
   9E92                    3661 L9E92:
   9E92 86 30         [ 2] 3662         ldaa    #0x30        
   9E94 B7 04 02      [ 4] 3663         staa    (0x0402)
   9E97 B7 04 03      [ 4] 3664         staa    (0x0403)
   9E9A B7 04 04      [ 4] 3665         staa    (0x0404)
                           3666 
   9E9D BD 8D DD      [ 6] 3667         jsr     LCDMSG2 
   9EA0 52 65 67 20 23 20  3668         .ascis  'Reg # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3669 
   9EAE 39            [ 5] 3670         rts
                           3671 
                           3672 ; reset L counts
   9EAF                    3673 L9EAF:
   9EAF 86 30         [ 2] 3674         ldaa    #0x30
   9EB1 B7 04 05      [ 4] 3675         staa    (0x0405)
   9EB4 B7 04 06      [ 4] 3676         staa    (0x0406)
   9EB7 B7 04 07      [ 4] 3677         staa    (0x0407)
                           3678 
   9EBA BD 8D DD      [ 6] 3679         jsr     LCDMSG2 
   9EBD 4C 69 76 20 23 20  3680         .ascis  'Liv # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3681 
   9ECB 39            [ 5] 3682         rts
                           3683 
                           3684 ; display R and L counts?
   9ECC                    3685 L9ECC:
   9ECC 86 52         [ 2] 3686         ldaa    #0x52           ;'R'
   9ECE C6 2B         [ 2] 3687         ldab    #0x2B
   9ED0 BD 8D B5      [ 6] 3688         jsr     L8DB5           ; display char here on LCD display
   9ED3 86 4C         [ 2] 3689         ldaa    #0x4C           ;'L'
   9ED5 C6 32         [ 2] 3690         ldab    #0x32
   9ED7 BD 8D B5      [ 6] 3691         jsr     L8DB5           ; display char here on LCD display
   9EDA CE 04 02      [ 3] 3692         ldx     #0x0402
   9EDD C6 2C         [ 2] 3693         ldab    #0x2C
   9EDF                    3694 L9EDF:
   9EDF A6 00         [ 4] 3695         ldaa    0,X     
   9EE1 BD 8D B5      [ 6] 3696         jsr     L8DB5           ; display 3 chars here on LCD display
   9EE4 5C            [ 2] 3697         incb
   9EE5 08            [ 3] 3698         inx
   9EE6 8C 04 05      [ 4] 3699         cpx     #0x0405
   9EE9 26 F4         [ 3] 3700         bne     L9EDF  
   9EEB C6 33         [ 2] 3701         ldab    #0x33
   9EED                    3702 L9EED:
   9EED A6 00         [ 4] 3703         ldaa    0,X     
   9EEF BD 8D B5      [ 6] 3704         jsr     L8DB5           ; display 3 chars here on LCD display
   9EF2 5C            [ 2] 3705         incb
   9EF3 08            [ 3] 3706         inx
   9EF4 8C 04 08      [ 4] 3707         cpx     #0x0408
   9EF7 26 F4         [ 3] 3708         bne     L9EED  
   9EF9 39            [ 5] 3709         rts
                           3710 
   9EFA                    3711 L9EFA:
   9EFA 96 A8         [ 3] 3712         ldaa    (0x00A8)
   9EFC BD 9F 0F      [ 6] 3713         jsr     L9F0F
   9EFF 48            [ 2] 3714         asla
   9F00 48            [ 2] 3715         asla
   9F01 48            [ 2] 3716         asla
   9F02 48            [ 2] 3717         asla
   9F03 97 13         [ 3] 3718         staa    (0x0013)
   9F05 96 A9         [ 3] 3719         ldaa    (0x00A9)
   9F07 BD 9F 0F      [ 6] 3720         jsr     L9F0F
   9F0A 9B 13         [ 3] 3721         adda    (0x0013)
   9F0C 97 A8         [ 3] 3722         staa    (0x00A8)
   9F0E 39            [ 5] 3723         rts
                           3724 
   9F0F                    3725 L9F0F:
   9F0F 81 2F         [ 2] 3726         cmpa    #0x2F
   9F11 24 02         [ 3] 3727         bcc     L9F15  
   9F13 86 30         [ 2] 3728         ldaa    #0x30
   9F15                    3729 L9F15:
   9F15 81 3A         [ 2] 3730         cmpa    #0x3A
   9F17 25 02         [ 3] 3731         bcs     L9F1B  
   9F19 80 07         [ 2] 3732         suba    #0x07
   9F1B                    3733 L9F1B:
   9F1B 80 30         [ 2] 3734         suba    #0x30
   9F1D 39            [ 5] 3735         rts
                           3736 
                           3737 ; different behavior based on serial number
   9F1E                    3738 L9F1E:
   9F1E FC 02 9C      [ 5] 3739         ldd     (0x029C)
   9F21 1A 83 00 01   [ 5] 3740         cpd     #0x0001         ; if 1, password bypass
   9F25 27 0C         [ 3] 3741         beq     L9F33           ;
   9F27 1A 83 03 E8   [ 5] 3742         cpd     #0x03E8         ; 1000
   9F2B 25 20         [ 3] 3743         bcs     L9F4D           ; if > 1000, code
   9F2D 1A 83 04 4B   [ 5] 3744         cpd     #0x044B         ; 1099
   9F31 22 1A         [ 3] 3745         bhi     L9F4D           ; if < 1099, code
                           3746                                 ; else 1 < x < 1000, bypass
                           3747 
   9F33                    3748 L9F33:
   9F33 BD 8D E4      [ 6] 3749         jsr     LCDMSG1 
   9F36 50 61 73 73 77 6F  3750         .ascis  'Password bypass '
        72 64 20 62 79 70
        61 73 73 A0
                           3751 
   9F46 C6 04         [ 2] 3752         ldab    #0x04
   9F48 BD 8C 30      [ 6] 3753         jsr     DLYSECSBY2      ; delay 2 sec
   9F4B 0C            [ 2] 3754         clc
   9F4C 39            [ 5] 3755         rts
                           3756 
   9F4D                    3757 L9F4D:
   9F4D BD 8C F2      [ 6] 3758         jsr     L8CF2
   9F50 BD 8D 03      [ 6] 3759         jsr     L8D03
                           3760 
   9F53 BD 8D E4      [ 6] 3761         jsr     LCDMSG1 
   9F56 43 6F 64 65 BA     3762         .ascis  'Code:'
                           3763 
                           3764 ; Generate a random 5-digit code in 0x0290-0x0294, and display to user
                           3765 
   9F5B CE 02 90      [ 3] 3766         ldx     #0x0290
   9F5E 7F 00 16      [ 6] 3767         clr     (0x0016)        ; 0x00
   9F61                    3768 L9F61:
   9F61 86 41         [ 2] 3769         ldaa    #0x41           ; 'A'
   9F63                    3770 L9F63:
   9F63 97 15         [ 3] 3771         staa    (0x0015)        ; 0x41
   9F65 BD 8E 95      [ 6] 3772         jsr     L8E95           ; read SCD keys
   9F68 81 0D         [ 2] 3773         cmpa    #0x0D
   9F6A 26 11         [ 3] 3774         bne     L9F7D
   9F6C 96 15         [ 3] 3775         ldaa    (0x0015)
   9F6E A7 00         [ 4] 3776         staa    0,X     
   9F70 08            [ 3] 3777         inx
   9F71 BD 8C 98      [ 6] 3778         jsr     L8C98
   9F74 96 16         [ 3] 3779         ldaa    (0x0016)
   9F76 4C            [ 2] 3780         inca
   9F77 97 16         [ 3] 3781         staa    (0x0016)
   9F79 81 05         [ 2] 3782         cmpa    #0x05
   9F7B 27 09         [ 3] 3783         beq     L9F86  
   9F7D                    3784 L9F7D:
   9F7D 96 15         [ 3] 3785         ldaa    (0x0015)
   9F7F 4C            [ 2] 3786         inca
   9F80 81 5B         [ 2] 3787         cmpa    #0x5B           ; '['
   9F82 27 DD         [ 3] 3788         beq     L9F61  
   9F84 20 DD         [ 3] 3789         bra     L9F63  
                           3790 
                           3791 ; Let the user type in a corresponding password to the code
   9F86                    3792 L9F86:
   9F86 BD 8D DD      [ 6] 3793         jsr     LCDMSG2 
   9F89 50 73 77 64 BA     3794         .ascis  'Pswd:'
                           3795 
   9F8E CE 02 88      [ 3] 3796         ldx     #0x0288
   9F91 86 41         [ 2] 3797         ldaa    #0x41           ; 'A'
   9F93 97 16         [ 3] 3798         staa    (0x0016)
   9F95 86 C5         [ 2] 3799         ldaa    #0xC5           ; 
   9F97 97 15         [ 3] 3800         staa    (0x0015)
   9F99                    3801 L9F99:
   9F99 96 15         [ 3] 3802         ldaa    (0x0015)
   9F9B BD 8C 86      [ 6] 3803         jsr     L8C86           ; write byte to LCD
   9F9E 96 16         [ 3] 3804         ldaa    (0x0016)
   9FA0 BD 8C 98      [ 6] 3805         jsr     L8C98
   9FA3                    3806 L9FA3:
   9FA3 BD 8E 95      [ 6] 3807         jsr     L8E95
   9FA6 27 FB         [ 3] 3808         beq     L9FA3  
   9FA8 81 0D         [ 2] 3809         cmpa    #0x0D
   9FAA 26 10         [ 3] 3810         bne     L9FBC  
   9FAC 96 16         [ 3] 3811         ldaa    (0x0016)
   9FAE A7 00         [ 4] 3812         staa    0,X     
   9FB0 08            [ 3] 3813         inx
   9FB1 96 15         [ 3] 3814         ldaa    (0x0015)
   9FB3 4C            [ 2] 3815         inca
   9FB4 97 15         [ 3] 3816         staa    (0x0015)
   9FB6 81 CA         [ 2] 3817         cmpa    #0xCA
   9FB8 27 28         [ 3] 3818         beq     L9FE2  
   9FBA 20 DD         [ 3] 3819         bra     L9F99  
   9FBC                    3820 L9FBC:
   9FBC 81 01         [ 2] 3821         cmpa    #0x01
   9FBE 26 0F         [ 3] 3822         bne     L9FCF  
   9FC0 96 16         [ 3] 3823         ldaa    (0x0016)
   9FC2 4C            [ 2] 3824         inca
   9FC3 97 16         [ 3] 3825         staa    (0x0016)
   9FC5 81 5B         [ 2] 3826         cmpa    #0x5B
   9FC7 26 D0         [ 3] 3827         bne     L9F99  
   9FC9 86 41         [ 2] 3828         ldaa    #0x41
   9FCB 97 16         [ 3] 3829         staa    (0x0016)
   9FCD 20 CA         [ 3] 3830         bra     L9F99  
   9FCF                    3831 L9FCF:
   9FCF 81 02         [ 2] 3832         cmpa    #0x02
   9FD1 26 D0         [ 3] 3833         bne     L9FA3  
   9FD3 96 16         [ 3] 3834         ldaa    (0x0016)
   9FD5 4A            [ 2] 3835         deca
   9FD6 97 16         [ 3] 3836         staa    (0x0016)
   9FD8 81 40         [ 2] 3837         cmpa    #0x40
   9FDA 26 BD         [ 3] 3838         bne     L9F99  
   9FDC 86 5A         [ 2] 3839         ldaa    #0x5A
   9FDE 97 16         [ 3] 3840         staa    (0x0016)
   9FE0 20 B7         [ 3] 3841         bra     L9F99  
   9FE2                    3842 L9FE2:
   9FE2 BD A0 01      [ 6] 3843         jsr     LA001           ; validate
   9FE5 25 0F         [ 3] 3844         bcs     L9FF6           ; if bad, jump
   9FE7 86 DB         [ 2] 3845         ldaa    #0xDB
   9FE9 97 AB         [ 3] 3846         staa    (0x00AB)        ; good password
   9FEB FC 04 16      [ 5] 3847         ldd     (0x0416)        ; increment number of good validations counter
   9FEE C3 00 01      [ 4] 3848         addd    #0x0001
   9FF1 FD 04 16      [ 5] 3849         std     (0x0416)
   9FF4 0C            [ 2] 3850         clc
   9FF5 39            [ 5] 3851         rts
                           3852 
   9FF6                    3853 L9FF6:
   9FF6 FC 04 14      [ 5] 3854         ldd     (0x0414)        ; increment number of bad validations counter
   9FF9 C3 00 01      [ 4] 3855         addd    #0x0001
   9FFC FD 04 14      [ 5] 3856         std     (0x0414)
   9FFF 0D            [ 2] 3857         sec
   A000 39            [ 5] 3858         rts
                           3859 
                           3860 ; Validate password?
   A001                    3861 LA001:
                           3862         ; scramble 5 letters
   A001 B6 02 90      [ 4] 3863         ldaa    (0x0290)        ; 0 -> 1
   A004 B7 02 81      [ 4] 3864         staa    (0x0281)
   A007 B6 02 91      [ 4] 3865         ldaa    (0x0291)        ; 1 -> 3
   A00A B7 02 83      [ 4] 3866         staa    (0x0283)
   A00D B6 02 92      [ 4] 3867         ldaa    (0x0292)        ; 2 -> 4
   A010 B7 02 84      [ 4] 3868         staa    (0x0284)
   A013 B6 02 93      [ 4] 3869         ldaa    (0x0293)        ; 3 -> 0
   A016 B7 02 80      [ 4] 3870         staa    (0x0280)
   A019 B6 02 94      [ 4] 3871         ldaa    (0x0294)        ; 4 -> 2
   A01C B7 02 82      [ 4] 3872         staa    (0x0282)
                           3873         ; transform each letter
   A01F B6 02 80      [ 4] 3874         ldaa    (0x0280)    
   A022 88 13         [ 2] 3875         eora    #0x13
   A024 8B 03         [ 2] 3876         adda    #0x03
   A026 B7 02 80      [ 4] 3877         staa    (0x0280)
   A029 B6 02 81      [ 4] 3878         ldaa    (0x0281)
   A02C 88 04         [ 2] 3879         eora    #0x04
   A02E 8B 12         [ 2] 3880         adda    #0x12
   A030 B7 02 81      [ 4] 3881         staa    (0x0281)
   A033 B6 02 82      [ 4] 3882         ldaa    (0x0282)
   A036 88 06         [ 2] 3883         eora    #0x06
   A038 8B 04         [ 2] 3884         adda    #0x04
   A03A B7 02 82      [ 4] 3885         staa    (0x0282)
   A03D B6 02 83      [ 4] 3886         ldaa    (0x0283)
   A040 88 11         [ 2] 3887         eora    #0x11
   A042 8B 07         [ 2] 3888         adda    #0x07
   A044 B7 02 83      [ 4] 3889         staa    (0x0283)
   A047 B6 02 84      [ 4] 3890         ldaa    (0x0284)
   A04A 88 01         [ 2] 3891         eora    #0x01
   A04C 8B 10         [ 2] 3892         adda    #0x10
   A04E B7 02 84      [ 4] 3893         staa    (0x0284)
                           3894         ; keep them modulo 26 (A-Z)
   A051 BD A0 AF      [ 6] 3895         jsr     LA0AF
                           3896         ; put some of the original bits into 0x0015/0x0016
   A054 B6 02 94      [ 4] 3897         ldaa    (0x0294)
   A057 84 17         [ 2] 3898         anda    #0x17
   A059 97 15         [ 3] 3899         staa    (0x0015)
   A05B B6 02 90      [ 4] 3900         ldaa    (0x0290)
   A05E 84 17         [ 2] 3901         anda    #0x17
   A060 97 16         [ 3] 3902         staa    (0x0016)
                           3903         ; do some eoring with these bits
   A062 CE 02 80      [ 3] 3904         ldx     #0x0280
   A065                    3905 LA065:
   A065 A6 00         [ 4] 3906         ldaa    0,X
   A067 98 15         [ 3] 3907         eora    (0x0015)
   A069 98 16         [ 3] 3908         eora    (0x0016)
   A06B A7 00         [ 4] 3909         staa    0,X
   A06D 08            [ 3] 3910         inx
   A06E 8C 02 85      [ 4] 3911         cpx     #0x0285
   A071 26 F2         [ 3] 3912         bne     LA065
                           3913         ; keep them modulo 26 (A-Z)
   A073 BD A0 AF      [ 6] 3914         jsr     LA0AF
                           3915         ; compare them to code in 0x0288-0x028C
   A076 CE 02 80      [ 3] 3916         ldx     #0x0280
   A079 18 CE 02 88   [ 4] 3917         ldy     #0x0288
   A07D                    3918 LA07D:
   A07D A6 00         [ 4] 3919         ldaa    0,X     
   A07F 18 A1 00      [ 5] 3920         cmpa    0,Y     
   A082 26 0A         [ 3] 3921         bne     LA08E  
   A084 08            [ 3] 3922         inx
   A085 18 08         [ 4] 3923         iny
   A087 8C 02 85      [ 4] 3924         cpx     #0x0285
   A08A 26 F1         [ 3] 3925         bne     LA07D  
   A08C 0C            [ 2] 3926         clc                     ; carry clear if good
   A08D 39            [ 5] 3927         rts
                           3928 
   A08E                    3929 LA08E:
   A08E 0D            [ 2] 3930         sec                     ; carry set if bad
   A08F 39            [ 5] 3931         rts
                           3932 
                           3933 ; trivial password validation - not used??
   A090                    3934 LA090:
   A090 59 41 44 44 41     3935         .ascii  'YADDA'
                           3936 
   A095 CE 02 88      [ 3] 3937         ldx     #0x0288
   A098 18 CE A0 90   [ 4] 3938         ldy     #LA090
   A09C                    3939 LA09C:
   A09C A6 00         [ 4] 3940         ldaa    0,X
   A09E 18 A1 00      [ 5] 3941         cmpa    0,Y
   A0A1 26 0A         [ 3] 3942         bne     LA0AD
   A0A3 08            [ 3] 3943         inx
   A0A4 18 08         [ 4] 3944         iny
   A0A6 8C 02 8D      [ 4] 3945         cpx     #0x028D
   A0A9 26 F1         [ 3] 3946         bne     LA09C
   A0AB 0C            [ 2] 3947         clc
   A0AC 39            [ 5] 3948         rts
   A0AD                    3949 LA0AD:
   A0AD 0D            [ 2] 3950         sec
   A0AE 39            [ 5] 3951         rts
                           3952 
                           3953 ; keep the password modulo 26, each letter in range 'A-Z'
   A0AF                    3954 LA0AF:
   A0AF CE 02 80      [ 3] 3955         ldx     #0x0280
   A0B2                    3956 LA0B2:
   A0B2 A6 00         [ 4] 3957         ldaa    0,X
   A0B4 81 5B         [ 2] 3958         cmpa    #0x5B
   A0B6 25 06         [ 3] 3959         bcs     LA0BE
   A0B8 80 1A         [ 2] 3960         suba    #0x1A
   A0BA A7 00         [ 4] 3961         staa    0,X
   A0BC 20 08         [ 3] 3962         bra     LA0C6
   A0BE                    3963 LA0BE:
   A0BE 81 41         [ 2] 3964         cmpa    #0x41
   A0C0 24 04         [ 3] 3965         bcc     LA0C6
   A0C2 8B 1A         [ 2] 3966         adda    #0x1A
   A0C4 A7 00         [ 4] 3967         staa    0,X
   A0C6                    3968 LA0C6:
   A0C6 08            [ 3] 3969         inx
   A0C7 8C 02 85      [ 4] 3970         cpx     #0x0285
   A0CA 26 E6         [ 3] 3971         bne     LA0B2  
   A0CC 39            [ 5] 3972         rts
                           3973 
   A0CD BD 8C F2      [ 6] 3974         jsr     L8CF2
                           3975 
   A0D0 BD 8D DD      [ 6] 3976         jsr     LCDMSG2 
   A0D3 46 61 69 6C 65 64  3977         .ascis  'Failed!         '
        21 20 20 20 20 20
        20 20 20 A0
                           3978 
   A0E3 C6 02         [ 2] 3979         ldab    #0x02
   A0E5 BD 8C 30      [ 6] 3980         jsr     DLYSECSBY2      ; delay 1 sec
   A0E8 39            [ 5] 3981         rts
                           3982 
   A0E9                    3983 LA0E9:
   A0E9 C6 01         [ 2] 3984         ldab    #0x01
   A0EB BD 8C 30      [ 6] 3985         jsr     DLYSECSBY2      ; delay 0.5 sec
   A0EE 7F 00 4E      [ 6] 3986         clr     (0x004E)
   A0F1 C6 D3         [ 2] 3987         ldab    #0xD3
   A0F3 BD 87 48      [ 6] 3988         jsr     L8748   
   A0F6 BD 87 AE      [ 6] 3989         jsr     L87AE
   A0F9 BD 8C E9      [ 6] 3990         jsr     L8CE9
                           3991 
   A0FC BD 8D E4      [ 6] 3992         jsr     LCDMSG1 
   A0FF 20 20 20 56 43 52  3993         .ascis  '   VCR adjust'
        20 61 64 6A 75 73
        F4
                           3994 
   A10C BD 8D DD      [ 6] 3995         jsr     LCDMSG2 
   A10F 55 50 20 74 6F 20  3996         .ascis  'UP to clear bits'
        63 6C 65 61 72 20
        62 69 74 F3
                           3997 
   A11F 5F            [ 2] 3998         clrb
   A120 D7 62         [ 3] 3999         stab    (0x0062)
   A122 BD F9 C5      [ 6] 4000         jsr     BUTNLIT 
   A125 B6 18 04      [ 4] 4001         ldaa    PIA0PRA 
   A128 84 BF         [ 2] 4002         anda    #0xBF
   A12A B7 18 04      [ 4] 4003         staa    PIA0PRA 
   A12D BD 8E 95      [ 6] 4004         jsr     L8E95
   A130 7F 00 48      [ 6] 4005         clr     (0x0048)
   A133 7F 00 49      [ 6] 4006         clr     (0x0049)
   A136 BD 86 C4      [ 6] 4007         jsr     L86C4           ; Reset boards 1-10
   A139 86 28         [ 2] 4008         ldaa    #0x28
   A13B 97 63         [ 3] 4009         staa    (0x0063)
   A13D C6 FD         [ 2] 4010         ldab    #0xFD           ; tape deck STOP
   A13F BD 86 E7      [ 6] 4011         jsr     L86E7
   A142 BD A3 2E      [ 6] 4012         jsr     LA32E
   A145 7C 00 76      [ 6] 4013         inc     (0x0076)
   A148 7F 00 32      [ 6] 4014         clr     (0x0032)
   A14B                    4015 LA14B:
   A14B BD 8E 95      [ 6] 4016         jsr     L8E95
   A14E 81 0D         [ 2] 4017         cmpa    #0x0D
   A150 26 03         [ 3] 4018         bne     LA155  
   A152 7E A1 C4      [ 3] 4019         jmp     LA1C4
   A155                    4020 LA155:
   A155 86 28         [ 2] 4021         ldaa    #0x28
   A157 97 63         [ 3] 4022         staa    (0x0063)
   A159 BD 86 A4      [ 6] 4023         jsr     L86A4
   A15C 25 ED         [ 3] 4024         bcs     LA14B  
   A15E FC 04 1A      [ 5] 4025         ldd     (0x041A)
   A161 C3 00 01      [ 4] 4026         addd    #0x0001
   A164 FD 04 1A      [ 5] 4027         std     (0x041A)
   A167 BD 86 C4      [ 6] 4028         jsr     L86C4           ; Reset boards 1-10
   A16A 7C 00 4E      [ 6] 4029         inc     (0x004E)
   A16D C6 D3         [ 2] 4030         ldab    #0xD3
   A16F BD 87 48      [ 6] 4031         jsr     L8748   
   A172 BD 87 AE      [ 6] 4032         jsr     L87AE
   A175                    4033 LA175:
   A175 96 49         [ 3] 4034         ldaa    (0x0049)
   A177 81 43         [ 2] 4035         cmpa    #0x43
   A179 26 06         [ 3] 4036         bne     LA181  
   A17B 7F 00 49      [ 6] 4037         clr     (0x0049)
   A17E 7F 00 48      [ 6] 4038         clr     (0x0048)
   A181                    4039 LA181:
   A181 96 48         [ 3] 4040         ldaa    (0x0048)
   A183 81 C8         [ 2] 4041         cmpa    #0xC8
   A185 25 1F         [ 3] 4042         bcs     LA1A6  
   A187 FC 02 9C      [ 5] 4043         ldd     (0x029C)
   A18A 1A 83 00 01   [ 5] 4044         cpd     #0x0001
   A18E 27 16         [ 3] 4045         beq     LA1A6  
   A190 C6 EF         [ 2] 4046         ldab    #0xEF           ; tape deck EJECT
   A192 BD 86 E7      [ 6] 4047         jsr     L86E7
   A195 BD 86 C4      [ 6] 4048         jsr     L86C4           ; Reset boards 1-10
   A198 7F 00 4E      [ 6] 4049         clr     (0x004E)
   A19B 7F 00 76      [ 6] 4050         clr     (0x0076)
   A19E C6 0A         [ 2] 4051         ldab    #0x0A
   A1A0 BD 8C 30      [ 6] 4052         jsr     DLYSECSBY2      ; delay 5 sec
   A1A3 7E 81 D7      [ 3] 4053         jmp     L81D7
   A1A6                    4054 LA1A6:
   A1A6 BD 8E 95      [ 6] 4055         jsr     L8E95
   A1A9 81 01         [ 2] 4056         cmpa    #0x01
   A1AB 26 10         [ 3] 4057         bne     LA1BD  
   A1AD CE 10 80      [ 3] 4058         ldx     #0x1080
   A1B0 86 34         [ 2] 4059         ldaa    #0x34
   A1B2                    4060 LA1B2:
   A1B2 6F 00         [ 6] 4061         clr     0,X     
   A1B4 A7 01         [ 4] 4062         staa    1,X     
   A1B6 08            [ 3] 4063         inx
   A1B7 08            [ 3] 4064         inx
   A1B8 8C 10 A0      [ 4] 4065         cpx     #0x10A0
   A1BB 25 F5         [ 3] 4066         bcs     LA1B2  
   A1BD                    4067 LA1BD:
   A1BD 81 0D         [ 2] 4068         cmpa    #0x0D
   A1BF 27 03         [ 3] 4069         beq     LA1C4  
   A1C1 7E A1 75      [ 3] 4070         jmp     LA175
   A1C4                    4071 LA1C4:
   A1C4 7F 00 76      [ 6] 4072         clr     (0x0076)
   A1C7 7F 00 4E      [ 6] 4073         clr     (0x004E)
   A1CA C6 DF         [ 2] 4074         ldab    #0xDF
   A1CC BD 87 48      [ 6] 4075         jsr     L8748   
   A1CF BD 87 91      [ 6] 4076         jsr     L8791   
   A1D2 7E 81 D7      [ 3] 4077         jmp     L81D7
                           4078 
                           4079 ; reprogram EEPROM signature if needed
   A1D5                    4080 LA1D5:
   A1D5 86 07         [ 2] 4081         ldaa    #0x07
   A1D7 B7 04 00      [ 4] 4082         staa    (0x0400)
   A1DA CC 0E 09      [ 3] 4083         ldd     #0x0E09
   A1DD 81 65         [ 2] 4084         cmpa    #0x65           ;'e'
   A1DF 26 05         [ 3] 4085         bne     LA1E6
   A1E1 C1 63         [ 2] 4086         cmpb    #0x63           ;'c'
   A1E3 26 01         [ 3] 4087         bne     LA1E6
   A1E5 39            [ 5] 4088         rts
                           4089 
                           4090 ; erase and reprogram EEPROM signature
   A1E6                    4091 LA1E6:
   A1E6 86 0E         [ 2] 4092         ldaa    #0x0E
   A1E8 B7 10 3B      [ 4] 4093         staa    PPROG
   A1EB 86 FF         [ 2] 4094         ldaa    #0xFF
   A1ED B7 0E 00      [ 4] 4095         staa    (0x0E00)
   A1F0 B6 10 3B      [ 4] 4096         ldaa    PPROG  
   A1F3 8A 01         [ 2] 4097         oraa    #0x01
   A1F5 B7 10 3B      [ 4] 4098         staa    PPROG  
   A1F8 CE 1B 58      [ 3] 4099         ldx     #0x1B58         ; 7000
   A1FB                    4100 LA1FB:
   A1FB 09            [ 3] 4101         dex
   A1FC 26 FD         [ 3] 4102         bne     LA1FB  
   A1FE B6 10 3B      [ 4] 4103         ldaa    PPROG  
   A201 84 FE         [ 2] 4104         anda    #0xFE
   A203 B7 10 3B      [ 4] 4105         staa    PPROG  
   A206 CE 0E 00      [ 3] 4106         ldx     #0x0E00
   A209 18 CE A2 26   [ 4] 4107         ldy     #LA226
   A20D                    4108 LA20D:
   A20D C6 02         [ 2] 4109         ldab    #0x02
   A20F F7 10 3B      [ 4] 4110         stab    PPROG  
   A212 18 A6 00      [ 5] 4111         ldaa    0,Y     
   A215 18 08         [ 4] 4112         iny
   A217 A7 00         [ 4] 4113         staa    0,X     
   A219 BD A2 32      [ 6] 4114         jsr     LA232
   A21C 08            [ 3] 4115         inx
   A21D 8C 0E 0C      [ 4] 4116         cpx     #0x0E0C
   A220 26 EB         [ 3] 4117         bne     LA20D  
   A222 7F 10 3B      [ 6] 4118         clr     PPROG  
   A225 39            [ 5] 4119         rts
                           4120 
                           4121 ; data for 0x0E00-0x0E0B EEPROM
   A226                    4122 LA226:
   A226 29 64 2A 21 32 3A  4123         .ascii  ')d*!2::4!ecq'
        3A 34 21 65 63 71
                           4124 
                           4125 ; program EEPROM
   A232                    4126 LA232:
   A232 18 3C         [ 5] 4127         pshy
   A234 C6 03         [ 2] 4128         ldab    #0x03
   A236 F7 10 3B      [ 4] 4129         stab    PPROG           ; start program
   A239 18 CE 1B 58   [ 4] 4130         ldy     #0x1B58
   A23D                    4131 LA23D:
   A23D 18 09         [ 4] 4132         dey
   A23F 26 FC         [ 3] 4133         bne     LA23D  
   A241 C6 02         [ 2] 4134         ldab    #0x02
   A243 F7 10 3B      [ 4] 4135         stab    PPROG           ; stop program
   A246 18 38         [ 6] 4136         puly
   A248 39            [ 5] 4137         rts
                           4138 
   A249                    4139 LA249:
   A249 0F            [ 2] 4140         sei
   A24A CE 00 10      [ 3] 4141         ldx     #0x0010
   A24D                    4142 LA24D:
   A24D 6F 00         [ 6] 4143         clr     0,X     
   A24F 08            [ 3] 4144         inx
   A250 8C 0E 00      [ 4] 4145         cpx     #0x0E00
   A253 26 F8         [ 3] 4146         bne     LA24D  
   A255 BD 9E AF      [ 6] 4147         jsr     L9EAF           ; reset L counts
   A258 BD 9E 92      [ 6] 4148         jsr     L9E92           ; reset R counts
   A25B 7E F8 00      [ 3] 4149         jmp     RESET           ; reset controller
                           4150 
                           4151 ; Compute and store copyright checksum
   A25E                    4152 LA25E:
   A25E 18 CE 80 03   [ 4] 4153         ldy     #CPYRTMSG       ; copyright message
   A262 CE 00 00      [ 3] 4154         ldx     #0x0000
   A265                    4155 LA265:
   A265 18 E6 00      [ 5] 4156         ldab    0,Y
   A268 3A            [ 3] 4157         abx
   A269 18 08         [ 4] 4158         iny
   A26B 18 8C 80 50   [ 5] 4159         cpy     #0x8050
   A26F 26 F4         [ 3] 4160         bne     LA265
   A271 FF 04 0B      [ 5] 4161         stx     CPYRTCS         ; store checksum here
   A274 39            [ 5] 4162         rts
                           4163 
                           4164 ; Erase EEPROM routine
   A275                    4165 LA275:
   A275 0F            [ 2] 4166         sei
   A276 7F 04 0F      [ 6] 4167         clr     ERASEFLG        ; Reset EEPROM Erase flag
   A279 86 0E         [ 2] 4168         ldaa    #0x0E
   A27B B7 10 3B      [ 4] 4169         staa    PPROG           ; ERASE mode!
   A27E 86 FF         [ 2] 4170         ldaa    #0xFF
   A280 B7 0E 20      [ 4] 4171         staa    (0x0E20)        ; save in NVRAM
   A283 B6 10 3B      [ 4] 4172         ldaa    PPROG  
   A286 8A 01         [ 2] 4173         oraa    #0x01
   A288 B7 10 3B      [ 4] 4174         staa    PPROG           ; do the ERASE
   A28B CE 1B 58      [ 3] 4175         ldx     #0x1B58         ; delay a bit
   A28E                    4176 LA28E:
   A28E 09            [ 3] 4177         dex
   A28F 26 FD         [ 3] 4178         bne     LA28E  
   A291 B6 10 3B      [ 4] 4179         ldaa    PPROG  
   A294 84 FE         [ 2] 4180         anda    #0xFE           ; stop erasing
   A296 7F 10 3B      [ 6] 4181         clr     PPROG  
                           4182 
   A299 BD F9 D8      [ 6] 4183         jsr     SERMSGW         ; display "enter serial number"
   A29C 45 6E 74 65 72 20  4184         .ascis  'Enter serial #: '
        73 65 72 69 61 6C
        20 23 3A A0
                           4185 
   A2AC CE 0E 20      [ 3] 4186         ldx     #0x0E20
   A2AF                    4187 LA2AF:
   A2AF BD F9 45      [ 6] 4188         jsr     SERIALR         ; wait for serial data
   A2B2 24 FB         [ 3] 4189         bcc     LA2AF  
                           4190 
   A2B4 BD F9 6F      [ 6] 4191         jsr     SERIALW         ; read serial data
   A2B7 C6 02         [ 2] 4192         ldab    #0x02
   A2B9 F7 10 3B      [ 4] 4193         stab    PPROG           ; protect only 0x0e20-0x0e5f
   A2BC A7 00         [ 4] 4194         staa    0,X         
   A2BE BD A2 32      [ 6] 4195         jsr     LA232           ; program byte
   A2C1 08            [ 3] 4196         inx
   A2C2 8C 0E 24      [ 4] 4197         cpx     #0x0E24
   A2C5 26 E8         [ 3] 4198         bne     LA2AF  
   A2C7 C6 02         [ 2] 4199         ldab    #0x02
   A2C9 F7 10 3B      [ 4] 4200         stab    PPROG  
   A2CC 86 DB         [ 2] 4201         ldaa    #0xDB           ; it's official
   A2CE B7 0E 24      [ 4] 4202         staa    (0x0E24)
   A2D1 BD A2 32      [ 6] 4203         jsr     LA232           ; program byte
   A2D4 7F 10 3B      [ 6] 4204         clr     PPROG  
   A2D7 86 1E         [ 2] 4205         ldaa    #0x1E
   A2D9 B7 10 35      [ 4] 4206         staa    BPROT           ; protect all but 0x0e00-0x0e1f
   A2DC 7E F8 00      [ 3] 4207         jmp     RESET           ; reset controller
                           4208 
   A2DF                    4209 LA2DF:
   A2DF 38            [ 5] 4210         pulx
   A2E0 3C            [ 4] 4211         pshx
   A2E1 8C 80 00      [ 4] 4212         cpx     #0x8000
   A2E4 25 02         [ 3] 4213         bcs     LA2E8           ; if 0x8000 < calling address (should be)
   A2E6 0C            [ 2] 4214         clc
   A2E7 39            [ 5] 4215         rts
                           4216 
   A2E8                    4217 LA2E8:
   A2E8 0D            [ 2] 4218         sec
   A2E9 39            [ 5] 4219         rts
                           4220 
                           4221 ; enter and validate security code via serial
   A2EA                    4222 LA2EA:
   A2EA CE 02 88      [ 3] 4223         ldx     #0x0288
   A2ED C6 03         [ 2] 4224         ldab    #0x03           ; 3 character code
                           4225 
   A2EF                    4226 LA2EF:
   A2EF BD F9 45      [ 6] 4227         jsr     SERIALR         ; check if available
   A2F2 24 FB         [ 3] 4228         bcc     LA2EF  
   A2F4 A7 00         [ 4] 4229         staa    0,X     
   A2F6 08            [ 3] 4230         inx
   A2F7 5A            [ 2] 4231         decb
   A2F8 26 F5         [ 3] 4232         bne     LA2EF  
                           4233 
   A2FA B6 02 88      [ 4] 4234         ldaa    (0x0288)
   A2FD 81 13         [ 2] 4235         cmpa    #0x13           ; 0x13
   A2FF 26 10         [ 3] 4236         bne     LA311  
   A301 B6 02 89      [ 4] 4237         ldaa    (0x0289)
   A304 81 10         [ 2] 4238         cmpa    #0x10           ; 0x10
   A306 26 09         [ 3] 4239         bne     LA311  
   A308 B6 02 8A      [ 4] 4240         ldaa    (0x028A)
   A30B 81 14         [ 2] 4241         cmpa    #0x14           ; 0x14
   A30D 26 02         [ 3] 4242         bne     LA311  
   A30F 0C            [ 2] 4243         clc
   A310 39            [ 5] 4244         rts
                           4245 
   A311                    4246 LA311:
   A311 0D            [ 2] 4247         sec
   A312 39            [ 5] 4248         rts
                           4249 
   A313                    4250 LA313:
   A313 36            [ 3] 4251         psha
   A314 B6 10 92      [ 4] 4252         ldaa    (0x1092)
   A317 8A 01         [ 2] 4253         oraa    #0x01
   A319                    4254 LA319:
   A319 B7 10 92      [ 4] 4255         staa    (0x1092)
   A31C 32            [ 4] 4256         pula
   A31D 39            [ 5] 4257         rts
                           4258 
   A31E                    4259 LA31E:
   A31E 36            [ 3] 4260         psha
   A31F B6 10 92      [ 4] 4261         ldaa    (0x1092)
   A322 84 FE         [ 2] 4262         anda    #0xFE
   A324 20 F3         [ 3] 4263         bra     LA319
                           4264 
   A326                    4265 LA326:
   A326 96 4E         [ 3] 4266         ldaa    (0x004E)
   A328 97 19         [ 3] 4267         staa    (0x0019)
   A32A 7F 00 4E      [ 6] 4268         clr     (0x004E)
   A32D 39            [ 5] 4269         rts
                           4270 
   A32E                    4271 LA32E:
   A32E B6 10 86      [ 4] 4272         ldaa    (0x1086)
   A331 8A 15         [ 2] 4273         oraa    #0x15
   A333 B7 10 86      [ 4] 4274         staa    (0x1086)
   A336 C6 01         [ 2] 4275         ldab    #0x01
   A338 BD 8C 30      [ 6] 4276         jsr     DLYSECSBY2      ; delay 0.5 sec
   A33B 84 EA         [ 2] 4277         anda    #0xEA
   A33D B7 10 86      [ 4] 4278         staa    (0x1086)
   A340 39            [ 5] 4279         rts
                           4280 
   A341                    4281 LA341:
   A341 B6 10 86      [ 4] 4282         ldaa    (0x1086)
   A344 8A 2A         [ 2] 4283         oraa    #0x2A           ; xx1x1x1x
   A346 B7 10 86      [ 4] 4284         staa    (0x1086)
   A349 C6 01         [ 2] 4285         ldab    #0x01
   A34B BD 8C 30      [ 6] 4286         jsr     DLYSECSBY2      ; delay 0.5 sec
   A34E 84 D5         [ 2] 4287         anda    #0xD5           ; xx0x0x0x
   A350 B7 10 86      [ 4] 4288         staa    (0x1086)
   A353 39            [ 5] 4289         rts
                           4290 
   A354                    4291 LA354:
   A354 F6 18 04      [ 4] 4292         ldab    PIA0PRA 
   A357 CA 08         [ 2] 4293         orab    #0x08
   A359 F7 18 04      [ 4] 4294         stab    PIA0PRA 
   A35C 39            [ 5] 4295         rts
                           4296 
   A35D F6 18 04      [ 4] 4297         ldab    PIA0PRA 
   A360 C4 F7         [ 2] 4298         andb    #0xF7
   A362 F7 18 04      [ 4] 4299         stab    PIA0PRA 
   A365 39            [ 5] 4300         rts
                           4301 
                           4302 ;'$' command goes here?
   A366                    4303 LA366:
   A366 7F 00 4E      [ 6] 4304         clr     (0x004E)
   A369 BD 86 C4      [ 6] 4305         jsr     L86C4           ; Reset boards 1-10
   A36C 7F 04 2A      [ 6] 4306         clr     (0x042A)
                           4307 
   A36F BD F9 D8      [ 6] 4308         jsr     SERMSGW
   A372 45 6E 74 65 72 20  4309         .ascis  'Enter security code:' 
        73 65 63 75 72 69
        74 79 20 63 6F 64
        65 BA
                           4310 
   A386 BD A2 EA      [ 6] 4311         jsr     LA2EA
   A389 24 03         [ 3] 4312         bcc     LA38E
   A38B 7E 83 31      [ 3] 4313         jmp     L8331
                           4314 
   A38E                    4315 LA38E:
   A38E BD F9 D8      [ 6] 4316         jsr     SERMSGW      
   A391 0C 0A 0D 44 61 76  4317         .ascii  "\f\n\rDave's Setup Utility\n\r"
        65 27 73 20 53 65
        74 75 70 20 55 74
        69 6C 69 74 79 0A
        0D
   A3AA 3C 4B 3E 69 6E 67  4318         .ascii  '<K>ing enable\n\r'
        20 65 6E 61 62 6C
        65 0A 0D
   A3B9 3C 43 3E 6C 65 61  4319         .ascii  '<C>lear random\n\r'
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A3C9 3C 35 3E 20 63 68  4320         .ascii  '<5> character random\n\r'
        61 72 61 63 74 65
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A3DF 3C 4C 3E 69 76 65  4321         .ascii  '<L>ive tape number clear\n\r'
        20 74 61 70 65 20
        6E 75 6D 62 65 72
        20 63 6C 65 61 72
        0A 0D
   A3F9 3C 52 3E 65 67 75  4322         .ascii  '<R>egular tape number clear\n\r'
        6C 61 72 20 74 61
        70 65 20 6E 75 6D
        62 65 72 20 63 6C
        65 61 72 0A 0D
   A416 3C 54 3E 65 73 74  4323         .ascii  '<T>est driver boards\n\r'
        20 64 72 69 76 65
        72 20 62 6F 61 72
        64 73 0A 0D
   A42C 3C 42 3E 75 62 20  4324         .ascii  '<B>ub test\n\r'
        74 65 73 74 0A 0D
   A438 3C 44 3E 65 63 6B  4325         .ascii  '<D>eck test (with tape inserted)\n\r'
        20 74 65 73 74 20
        28 77 69 74 68 20
        74 61 70 65 20 69
        6E 73 65 72 74 65
        64 29 0A 0D
   A45A 3C 37 3E 35 25 20  4326         .ascii  '<7>5% adjustment\n\r'
        61 64 6A 75 73 74
        6D 65 6E 74 0A 0D
   A46C 3C 53 3E 68 6F 77  4327         .ascii  '<S>how re-valid tapes\n\r'
        20 72 65 2D 76 61
        6C 69 64 20 74 61
        70 65 73 0A 0D
   A483 3C 4A 3E 75 6D 70  4328         .ascis  '<J>ump to system\n\r'
        20 74 6F 20 73 79
        73 74 65 6D 0A 8D
                           4329 
   A495                    4330 LA495:
   A495 BD F9 45      [ 6] 4331         jsr     SERIALR     
   A498 24 FB         [ 3] 4332         bcc     LA495  
   A49A 81 43         [ 2] 4333         cmpa    #0x43           ;'C'
   A49C 26 09         [ 3] 4334         bne     LA4A7  
   A49E 7F 04 01      [ 6] 4335         clr     (0x0401)        ;clear random
   A4A1 7F 04 2B      [ 6] 4336         clr     (0x042B)
   A4A4 7E A5 14      [ 3] 4337         jmp     LA514
   A4A7                    4338 LA4A7:
   A4A7 81 35         [ 2] 4339         cmpa    #0x35           ;'5'
   A4A9 26 0D         [ 3] 4340         bne     LA4B8  
   A4AB B6 04 01      [ 4] 4341         ldaa    (0x0401)        ;5 character random
   A4AE 84 7F         [ 2] 4342         anda    #0x7F
   A4B0 8A 7F         [ 2] 4343         oraa    #0x7F
   A4B2 B7 04 01      [ 4] 4344         staa    (0x0401)
   A4B5 7E A5 14      [ 3] 4345         jmp     LA514
   A4B8                    4346 LA4B8:
   A4B8 81 4C         [ 2] 4347         cmpa    #0x4C           ;'L'
   A4BA 26 06         [ 3] 4348         bne     LA4C2
   A4BC BD 9E AF      [ 6] 4349         jsr     L9EAF           ; reset Liv counts
   A4BF 7E A5 14      [ 3] 4350         jmp     LA514
   A4C2                    4351 LA4C2:
   A4C2 81 52         [ 2] 4352         cmpa    #0x52           ;'R'
   A4C4 26 06         [ 3] 4353         bne     LA4CC  
   A4C6 BD 9E 92      [ 6] 4354         jsr     L9E92           ; reset Reg counts
   A4C9 7E A5 14      [ 3] 4355         jmp     LA514
   A4CC                    4356 LA4CC:
   A4CC 81 54         [ 2] 4357         cmpa    #0x54           ;'T'
   A4CE 26 06         [ 3] 4358         bne     LA4D6  
   A4D0 BD A5 65      [ 6] 4359         jsr     LA565           ; test driver boards
   A4D3 7E A5 14      [ 3] 4360         jmp     LA514
   A4D6                    4361 LA4D6:
   A4D6 81 42         [ 2] 4362         cmpa    #0x42           ;'B'
   A4D8 26 06         [ 3] 4363         bne     LA4E0  
   A4DA BD A5 26      [ 6] 4364         jsr     LA526           ; bulb test?
   A4DD 7E A5 14      [ 3] 4365         jmp     LA514
   A4E0                    4366 LA4E0:
   A4E0 81 44         [ 2] 4367         cmpa    #0x44           ;'D'
   A4E2 26 06         [ 3] 4368         bne     LA4EA  
   A4E4 BD A5 3C      [ 6] 4369         jsr     LA53C           ; deck test
   A4E7 7E A5 14      [ 3] 4370         jmp     LA514
   A4EA                    4371 LA4EA:
   A4EA 81 37         [ 2] 4372         cmpa    #0x37           ;'7'
   A4EC 26 08         [ 3] 4373         bne     LA4F6  
   A4EE C6 FB         [ 2] 4374         ldab    #0xFB           ; tape deck PLAY
   A4F0 BD 86 E7      [ 6] 4375         jsr     L86E7           ; 5% adjustment
   A4F3 7E A5 14      [ 3] 4376         jmp     LA514
   A4F6                    4377 LA4F6:
   A4F6 81 4A         [ 2] 4378         cmpa    #0x4A           ;'J'
   A4F8 26 03         [ 3] 4379         bne     LA4FD  
   A4FA 7E F8 00      [ 3] 4380         jmp     RESET           ; jump to system (reset)
   A4FD                    4381 LA4FD:
   A4FD 81 4B         [ 2] 4382         cmpa    #0x4B           ;'K'
   A4FF 26 06         [ 3] 4383         bne     LA507  
   A501 7C 04 2A      [ 6] 4384         inc     (0x042A)        ; King enable
   A504 7E A5 14      [ 3] 4385         jmp     LA514
   A507                    4386 LA507:
   A507 81 53         [ 2] 4387         cmpa    #0x53           ;'S'
   A509 26 06         [ 3] 4388         bne     LA511  
   A50B BD AB 7C      [ 6] 4389         jsr     LAB7C           ; show re-valid tapes
   A50E 7E A5 14      [ 3] 4390         jmp     LA514
   A511                    4391 LA511:
   A511 7E A4 95      [ 3] 4392         jmp     LA495
   A514                    4393 LA514:
   A514 86 07         [ 2] 4394         ldaa    #0x07
   A516 BD F9 6F      [ 6] 4395         jsr     SERIALW      
   A519 C6 01         [ 2] 4396         ldab    #0x01
   A51B BD 8C 30      [ 6] 4397         jsr     DLYSECSBY2      ; delay 0.5 sec
   A51E 86 07         [ 2] 4398         ldaa    #0x07
   A520 BD F9 6F      [ 6] 4399         jsr     SERIALW      
   A523 7E A3 8E      [ 3] 4400         jmp     LA38E
                           4401 
                           4402 ; bulb test
   A526                    4403 LA526:
   A526 5F            [ 2] 4404         clrb
   A527 BD F9 C5      [ 6] 4405         jsr     BUTNLIT 
   A52A                    4406 LA52A:
   A52A F6 10 0A      [ 4] 4407         ldab    PORTE
   A52D C8 FF         [ 2] 4408         eorb    #0xFF
   A52F BD F9 C5      [ 6] 4409         jsr     BUTNLIT 
   A532 C1 80         [ 2] 4410         cmpb    #0x80
   A534 26 F4         [ 3] 4411         bne     LA52A  
   A536 C6 02         [ 2] 4412         ldab    #0x02
   A538 BD 8C 30      [ 6] 4413         jsr     DLYSECSBY2      ; delay 1 sec
   A53B 39            [ 5] 4414         rts
                           4415 
                           4416 ; deck test
   A53C                    4417 LA53C:
   A53C C6 FD         [ 2] 4418         ldab    #0xFD           ; tape deck STOP
   A53E BD 86 E7      [ 6] 4419         jsr     L86E7
   A541 C6 06         [ 2] 4420         ldab    #0x06
   A543 BD 8C 30      [ 6] 4421         jsr     DLYSECSBY2      ; delay 3 sec
   A546 C6 FB         [ 2] 4422         ldab    #0xFB           ; tape deck PLAY
   A548 BD 86 E7      [ 6] 4423         jsr     L86E7
   A54B C6 06         [ 2] 4424         ldab    #0x06
   A54D BD 8C 30      [ 6] 4425         jsr     DLYSECSBY2      ; delay 3 sec
   A550 C6 FD         [ 2] 4426         ldab    #0xFD           ; tape deck STOP
   A552 BD 86 E7      [ 6] 4427         jsr     L86E7
   A555 C6 F7         [ 2] 4428         ldab    #0xF7
   A557 BD 86 E7      [ 6] 4429         jsr     L86E7           ; tape deck REWIND
   A55A C6 06         [ 2] 4430         ldab    #0x06
   A55C BD 8C 30      [ 6] 4431         jsr     DLYSECSBY2      ; delay 3 sec
   A55F C6 EF         [ 2] 4432         ldab    #0xEF           ; tape deck EJECT
   A561 BD 86 E7      [ 6] 4433         jsr     L86E7
   A564 39            [ 5] 4434         rts
                           4435 
                           4436 ; test driver boards
   A565                    4437 LA565:
   A565 BD F9 45      [ 6] 4438         jsr     SERIALR     
   A568 24 08         [ 3] 4439         bcc     LA572  
   A56A 81 1B         [ 2] 4440         cmpa    #0x1B
   A56C 26 04         [ 3] 4441         bne     LA572  
   A56E BD 86 C4      [ 6] 4442         jsr     L86C4           ; Reset boards 1-10
   A571 39            [ 5] 4443         rts
   A572                    4444 LA572:
   A572 86 08         [ 2] 4445         ldaa    #0x08
   A574 97 15         [ 3] 4446         staa    (0x0015)
   A576 BD 86 C4      [ 6] 4447         jsr     L86C4           ; Reset boards 1-10
   A579 86 01         [ 2] 4448         ldaa    #0x01
   A57B                    4449 LA57B:
   A57B 36            [ 3] 4450         psha
   A57C 16            [ 2] 4451         tab
   A57D BD F9 C5      [ 6] 4452         jsr     BUTNLIT 
   A580 B6 18 04      [ 4] 4453         ldaa    PIA0PRA 
   A583 88 08         [ 2] 4454         eora    #0x08
   A585 B7 18 04      [ 4] 4455         staa    PIA0PRA 
   A588 32            [ 4] 4456         pula
   A589 B7 10 80      [ 4] 4457         staa    (0x1080)
   A58C B7 10 84      [ 4] 4458         staa    (0x1084)
   A58F B7 10 88      [ 4] 4459         staa    (0x1088)
   A592 B7 10 8C      [ 4] 4460         staa    (0x108C)
   A595 B7 10 90      [ 4] 4461         staa    (0x1090)
   A598 B7 10 94      [ 4] 4462         staa    (0x1094)
   A59B B7 10 98      [ 4] 4463         staa    (0x1098)
   A59E B7 10 9C      [ 4] 4464         staa    (0x109C)
   A5A1 C6 14         [ 2] 4465         ldab    #0x14
   A5A3 BD A6 52      [ 6] 4466         jsr     LA652
   A5A6 49            [ 2] 4467         rola
   A5A7 36            [ 3] 4468         psha
   A5A8 D6 15         [ 3] 4469         ldab    (0x0015)
   A5AA 5A            [ 2] 4470         decb
   A5AB D7 15         [ 3] 4471         stab    (0x0015)
   A5AD BD F9 95      [ 6] 4472         jsr     DIAGDGT         ; write digit to the diag display
   A5B0 37            [ 3] 4473         pshb
   A5B1 C6 27         [ 2] 4474         ldab    #0x27
   A5B3 96 15         [ 3] 4475         ldaa    (0x0015)
   A5B5 0C            [ 2] 4476         clc
   A5B6 89 30         [ 2] 4477         adca    #0x30
   A5B8 BD 8D B5      [ 6] 4478         jsr     L8DB5           ; display char here on LCD display
   A5BB 33            [ 4] 4479         pulb
   A5BC 32            [ 4] 4480         pula
   A5BD 5D            [ 2] 4481         tstb
   A5BE 26 BB         [ 3] 4482         bne     LA57B  
   A5C0 86 08         [ 2] 4483         ldaa    #0x08
   A5C2 97 15         [ 3] 4484         staa    (0x0015)
   A5C4 BD 86 C4      [ 6] 4485         jsr     L86C4           ; Reset boards 1-10
   A5C7 86 01         [ 2] 4486         ldaa    #0x01
   A5C9                    4487 LA5C9:
   A5C9 B7 10 82      [ 4] 4488         staa    (0x1082)
   A5CC B7 10 86      [ 4] 4489         staa    (0x1086)
   A5CF B7 10 8A      [ 4] 4490         staa    (0x108A)
   A5D2 B7 10 8E      [ 4] 4491         staa    (0x108E)
   A5D5 B7 10 92      [ 4] 4492         staa    (0x1092)
   A5D8 B7 10 96      [ 4] 4493         staa    (0x1096)
   A5DB B7 10 9A      [ 4] 4494         staa    (0x109A)
   A5DE B7 10 9E      [ 4] 4495         staa    (0x109E)
   A5E1 C6 14         [ 2] 4496         ldab    #0x14
   A5E3 BD A6 52      [ 6] 4497         jsr     LA652
   A5E6 49            [ 2] 4498         rola
   A5E7 36            [ 3] 4499         psha
   A5E8 D6 15         [ 3] 4500         ldab    (0x0015)
   A5EA 5A            [ 2] 4501         decb
   A5EB D7 15         [ 3] 4502         stab    (0x0015)
   A5ED BD F9 95      [ 6] 4503         jsr     DIAGDGT         ; write digit to the diag display
   A5F0 37            [ 3] 4504         pshb
   A5F1 C6 27         [ 2] 4505         ldab    #0x27
   A5F3 96 15         [ 3] 4506         ldaa    (0x0015)
   A5F5 0C            [ 2] 4507         clc
   A5F6 89 30         [ 2] 4508         adca    #0x30
   A5F8 BD 8D B5      [ 6] 4509         jsr     L8DB5           ; display char here on LCD display
   A5FB 33            [ 4] 4510         pulb
   A5FC 32            [ 4] 4511         pula
   A5FD 7D 00 15      [ 6] 4512         tst     (0x0015)
   A600 26 C7         [ 3] 4513         bne     LA5C9  
   A602 BD 86 C4      [ 6] 4514         jsr     L86C4           ; Reset boards 1-10
   A605 CE 10 80      [ 3] 4515         ldx     #0x1080
   A608 C6 00         [ 2] 4516         ldab    #0x00
   A60A                    4517 LA60A:
   A60A 86 FF         [ 2] 4518         ldaa    #0xFF
   A60C A7 00         [ 4] 4519         staa    0,X
   A60E A7 02         [ 4] 4520         staa    2,X     
   A610 37            [ 3] 4521         pshb
   A611 C6 1E         [ 2] 4522         ldab    #0x1E
   A613 BD A6 52      [ 6] 4523         jsr     LA652
   A616 33            [ 4] 4524         pulb
   A617 86 00         [ 2] 4525         ldaa    #0x00
   A619 A7 00         [ 4] 4526         staa    0,X     
   A61B A7 02         [ 4] 4527         staa    2,X     
   A61D 5C            [ 2] 4528         incb
   A61E 3C            [ 4] 4529         pshx
   A61F BD F9 95      [ 6] 4530         jsr     DIAGDGT         ; write digit to the diag display
   A622 37            [ 3] 4531         pshb
   A623 C6 27         [ 2] 4532         ldab    #0x27
   A625 32            [ 4] 4533         pula
   A626 36            [ 3] 4534         psha
   A627 0C            [ 2] 4535         clc
   A628 89 30         [ 2] 4536         adca    #0x30
   A62A BD 8D B5      [ 6] 4537         jsr     L8DB5           ; display char here on LCD display
   A62D 33            [ 4] 4538         pulb
   A62E 38            [ 5] 4539         pulx
   A62F 08            [ 3] 4540         inx
   A630 08            [ 3] 4541         inx
   A631 08            [ 3] 4542         inx
   A632 08            [ 3] 4543         inx
   A633 8C 10 9D      [ 4] 4544         cpx     #0x109D
   A636 25 D2         [ 3] 4545         bcs     LA60A  
   A638 CE 10 80      [ 3] 4546         ldx     #0x1080
   A63B                    4547 LA63B:
   A63B 86 FF         [ 2] 4548         ldaa    #0xFF
   A63D A7 00         [ 4] 4549         staa    0,X     
   A63F A7 02         [ 4] 4550         staa    2,X     
   A641 08            [ 3] 4551         inx
   A642 08            [ 3] 4552         inx
   A643 08            [ 3] 4553         inx
   A644 08            [ 3] 4554         inx
   A645 8C 10 9D      [ 4] 4555         cpx     #0x109D
   A648 25 F1         [ 3] 4556         bcs     LA63B  
   A64A C6 06         [ 2] 4557         ldab    #0x06
   A64C BD 8C 30      [ 6] 4558         jsr     DLYSECSBY2      ; delay 3 sec
   A64F 7E A5 65      [ 3] 4559         jmp     LA565
   A652                    4560 LA652:
   A652 36            [ 3] 4561         psha
   A653 4F            [ 2] 4562         clra
   A654 DD 23         [ 4] 4563         std     CDTIMR5
   A656                    4564 LA656:
   A656 7D 00 24      [ 6] 4565         tst     CDTIMR5+1
   A659 26 FB         [ 3] 4566         bne     LA656  
   A65B 32            [ 4] 4567         pula
   A65C 39            [ 5] 4568         rts
                           4569 
                           4570 ; Comma-seperated text
   A65D                    4571 LA65D:
   A65D 30 2C 43 68 75 63  4572         .ascii  '0,Chuck,Mouth,'
        6B 2C 4D 6F 75 74
        68 2C
   A66B 31 2C 48 65 61 64  4573         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A677 32 2C 48 65 61 64  4574         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A684 32 2C 48 65 61 64  4575         .ascii  '2,Head up,'
        20 75 70 2C
   A68E 32 2C 45 79 65 73  4576         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A69B 31 2C 45 79 65 6C  4577         .ascii  '1,Eyelids,'
        69 64 73 2C
   A6A5 31 2C 52 69 67 68  4578         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A6B2 32 2C 45 79 65 73  4579         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A6BE 31 2C 38 2C 48 65  4580         .ascii  '1,8,Helen,Mouth,'
        6C 65 6E 2C 4D 6F
        75 74 68 2C
   A6CE 31 2C 48 65 61 64  4581         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A6DA 32 2C 48 65 61 64  4582         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A6E7 32 2C 48 65 61 64  4583         .ascii  '2,Head up,'
        20 75 70 2C
   A6F1 32 2C 45 79 65 73  4584         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A6FE 31 2C 45 79 65 6C  4585         .ascii  '1,Eyelids,'
        69 64 73 2C
   A708 31 2C 52 69 67 68  4586         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A715 32 2C 45 79 65 73  4587         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A721 31 2C 36 2C 4D 75  4588         .ascii  '1,6,Munch,Mouth,'
        6E 63 68 2C 4D 6F
        75 74 68 2C
   A731 31 2C 48 65 61 64  4589         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A73D 32 2C 48 65 61 64  4590         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A74A 32 2C 4C 65 66 74  4591         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A755 32 2C 45 79 65 73  4592         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A762 31 2C 45 79 65 6C  4593         .ascii  '1,Eyelids,'
        69 64 73 2C
   A76C 31 2C 52 69 67 68  4594         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A778 32 2C 45 79 65 73  4595         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A784 31 2C 32 2C 4A 61  4596         .ascii  '1,2,Jasper,Mouth,'
        73 70 65 72 2C 4D
        6F 75 74 68 2C
   A795 31 2C 48 65 61 64  4597         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A7A1 32 2C 48 65 61 64  4598         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A7AE 32 2C 48 65 61 64  4599         .ascii  '2,Head up,'
        20 75 70 2C
   A7B8 32 2C 45 79 65 73  4600         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A7C5 31 2C 45 79 65 6C  4601         .ascii  '1,Eyelids,'
        69 64 73 2C
   A7CF 31 2C 48 61 6E 64  4602         .ascii  '1,Hands,'
        73 2C
   A7D7 32 2C 45 79 65 73  4603         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A7E3 31 2C 34 2C 50 61  4604         .ascii  '1,4,Pasqually,Mouth-Mustache,'
        73 71 75 61 6C 6C
        79 2C 4D 6F 75 74
        68 2D 4D 75 73 74
        61 63 68 65 2C
   A800 31 2C 48 65 61 64  4605         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A80C 32 2C 48 65 61 64  4606         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A819 32 2C 4C 65 66 74  4607         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A824 32 2C 45 79 65 73  4608         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A831 31 2C 45 79 65 6C  4609         .ascii  '1,Eyelids,'
        69 64 73 2C
   A83B 31 2C 52 69 67 68  4610         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A847 32 2C 45 79 65 73  4611         .ascii  '2,Eyes left,1,'
        20 6C 65 66 74 2C
        31 2C
                           4612 
   A855                    4613 LA855:
   A855 3C            [ 4] 4614         pshx
   A856 BD 86 C4      [ 6] 4615         jsr     L86C4           ; Reset boards 1-10
   A859 CE 10 80      [ 3] 4616         ldx     #0x1080
   A85C 86 20         [ 2] 4617         ldaa    #0x20
   A85E A7 00         [ 4] 4618         staa    0,X
   A860 A7 04         [ 4] 4619         staa    4,X
   A862 A7 08         [ 4] 4620         staa    8,X
   A864 A7 0C         [ 4] 4621         staa    12,X
   A866 A7 10         [ 4] 4622         staa    16,X
   A868 38            [ 5] 4623         pulx
   A869 39            [ 5] 4624         rts
                           4625 
   A86A                    4626 LA86A:
   A86A BD A3 2E      [ 6] 4627         jsr     LA32E
                           4628 
   A86D BD 8D E4      [ 6] 4629         jsr     LCDMSG1 
   A870 20 20 20 20 57 61  4630         .ascis  '    Warm-Up  '
        72 6D 2D 55 70 20
        A0
                           4631 
   A87D BD 8D DD      [ 6] 4632         jsr     LCDMSG2 
   A880 43 75 72 74 61 69  4633         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           4634 
   A890 C6 14         [ 2] 4635         ldab    #0x14
   A892 BD 8C 30      [ 6] 4636         jsr     DLYSECSBY2      ; delay 10 sec
   A895                    4637 LA895:
   A895 BD A8 55      [ 6] 4638         jsr     LA855
   A898 C6 02         [ 2] 4639         ldab    #0x02
   A89A BD 8C 30      [ 6] 4640         jsr     DLYSECSBY2      ; delay 1 sec
   A89D CE A6 5D      [ 3] 4641         ldx     #LA65D
   A8A0 C6 05         [ 2] 4642         ldab    #0x05
   A8A2 D7 12         [ 3] 4643         stab    (0x0012)
   A8A4                    4644 LA8A4:
   A8A4 C6 08         [ 2] 4645         ldab    #0x08
   A8A6 D7 13         [ 3] 4646         stab    (0x0013)
   A8A8 BD A9 41      [ 6] 4647         jsr     LA941
   A8AB BD A9 4C      [ 6] 4648         jsr     LA94C
   A8AE C6 02         [ 2] 4649         ldab    #0x02
   A8B0 BD 8C 30      [ 6] 4650         jsr     DLYSECSBY2      ; delay 1 sec
   A8B3                    4651 LA8B3:
   A8B3 BD A9 5E      [ 6] 4652         jsr     LA95E
   A8B6 A6 00         [ 4] 4653         ldaa    0,X     
   A8B8 80 30         [ 2] 4654         suba    #0x30
   A8BA 08            [ 3] 4655         inx
   A8BB 08            [ 3] 4656         inx
   A8BC 36            [ 3] 4657         psha
   A8BD 7C 00 4C      [ 6] 4658         inc     (0x004C)
   A8C0 3C            [ 4] 4659         pshx
   A8C1 BD 88 E5      [ 6] 4660         jsr     L88E5
   A8C4 38            [ 5] 4661         pulx
   A8C5 86 4F         [ 2] 4662         ldaa    #0x4F           ;'O'
   A8C7 C6 0C         [ 2] 4663         ldab    #0x0C
   A8C9 BD 8D B5      [ 6] 4664         jsr     L8DB5           ; display char here on LCD display
   A8CC 86 6E         [ 2] 4665         ldaa    #0x6E           ;'n'
   A8CE C6 0D         [ 2] 4666         ldab    #0x0D
   A8D0 BD 8D B5      [ 6] 4667         jsr     L8DB5           ; display char here on LCD display
   A8D3 CC 20 0E      [ 3] 4668         ldd     #0x200E         ;' '
   A8D6 BD 8D B5      [ 6] 4669         jsr     L8DB5           ; display char here on LCD display
   A8D9 7A 00 4C      [ 6] 4670         dec     (0x004C)
   A8DC 32            [ 4] 4671         pula
   A8DD 36            [ 3] 4672         psha
   A8DE C6 64         [ 2] 4673         ldab    #0x64
   A8E0 3D            [10] 4674         mul
   A8E1 DD 23         [ 4] 4675         std     CDTIMR5
   A8E3                    4676 LA8E3:
   A8E3 DC 23         [ 4] 4677         ldd     CDTIMR5
   A8E5 26 FC         [ 3] 4678         bne     LA8E3  
   A8E7 BD 8E 95      [ 6] 4679         jsr     L8E95
   A8EA 81 0D         [ 2] 4680         cmpa    #0x0D
   A8EC 26 05         [ 3] 4681         bne     LA8F3  
   A8EE BD A9 75      [ 6] 4682         jsr     LA975           ; Wait for SCD Keypress
   A8F1 20 10         [ 3] 4683         bra     LA903  
   A8F3                    4684 LA8F3:
   A8F3 81 01         [ 2] 4685         cmpa    #0x01
   A8F5 26 04         [ 3] 4686         bne     LA8FB  
   A8F7 32            [ 4] 4687         pula
   A8F8 7E A8 95      [ 3] 4688         jmp     LA895
   A8FB                    4689 LA8FB:
   A8FB 81 02         [ 2] 4690         cmpa    #0x02
   A8FD 26 04         [ 3] 4691         bne     LA903  
   A8FF 32            [ 4] 4692         pula
   A900 7E A9 35      [ 3] 4693         jmp     LA935
   A903                    4694 LA903:
   A903 3C            [ 4] 4695         pshx
   A904 BD 88 E5      [ 6] 4696         jsr     L88E5
   A907 38            [ 5] 4697         pulx
   A908 86 66         [ 2] 4698         ldaa    #0x66           ;'f'
   A90A C6 0D         [ 2] 4699         ldab    #0x0D
   A90C BD 8D B5      [ 6] 4700         jsr     L8DB5           ; display char here on LCD display
   A90F 86 66         [ 2] 4701         ldaa    #0x66           ;'f'
   A911 C6 0E         [ 2] 4702         ldab    #0x0E
   A913 BD 8D B5      [ 6] 4703         jsr     L8DB5           ; display char here on LCD display
   A916 32            [ 4] 4704         pula
   A917 C6 64         [ 2] 4705         ldab    #0x64
   A919 3D            [10] 4706         mul
   A91A DD 23         [ 4] 4707         std     CDTIMR5
   A91C                    4708 LA91C:
   A91C DC 23         [ 4] 4709         ldd     CDTIMR5
   A91E 26 FC         [ 3] 4710         bne     LA91C  
   A920 BD A8 55      [ 6] 4711         jsr     LA855
   A923 7C 00 4B      [ 6] 4712         inc     (0x004B)
   A926 96 4B         [ 3] 4713         ldaa    (0x004B)
   A928 81 48         [ 2] 4714         cmpa    #0x48
   A92A 25 87         [ 3] 4715         bcs     LA8B3  
   A92C 96 4C         [ 3] 4716         ldaa    (0x004C)
   A92E 81 34         [ 2] 4717         cmpa    #0x34
   A930 27 03         [ 3] 4718         beq     LA935  
   A932 7E A8 A4      [ 3] 4719         jmp     LA8A4
   A935                    4720 LA935:
   A935 C6 02         [ 2] 4721         ldab    #0x02
   A937 BD 8C 30      [ 6] 4722         jsr     DLYSECSBY2      ; delay 1 sec
   A93A BD 86 C4      [ 6] 4723         jsr     L86C4           ; Reset boards 1-10
   A93D BD A3 41      [ 6] 4724         jsr     LA341
   A940 39            [ 5] 4725         rts
                           4726 
   A941                    4727 LA941:
   A941 A6 00         [ 4] 4728         ldaa    0,X     
   A943 08            [ 3] 4729         inx
   A944 08            [ 3] 4730         inx
   A945 97 4C         [ 3] 4731         staa    (0x004C)
   A947 86 40         [ 2] 4732         ldaa    #0x40
   A949 97 4B         [ 3] 4733         staa    (0x004B)
   A94B 39            [ 5] 4734         rts
                           4735 
   A94C                    4736 LA94C:
   A94C BD 8C F2      [ 6] 4737         jsr     L8CF2
   A94F                    4738 LA94F:
   A94F A6 00         [ 4] 4739         ldaa    0,X     
   A951 08            [ 3] 4740         inx
   A952 81 2C         [ 2] 4741         cmpa    #0x2C
   A954 27 07         [ 3] 4742         beq     LA95D  
   A956 36            [ 3] 4743         psha
   A957 BD 8E 70      [ 6] 4744         jsr     L8E70
   A95A 32            [ 4] 4745         pula
   A95B 20 F2         [ 3] 4746         bra     LA94F  
   A95D                    4747 LA95D:
   A95D 39            [ 5] 4748         rts
                           4749 
   A95E                    4750 LA95E:
   A95E BD 8D 03      [ 6] 4751         jsr     L8D03
   A961 86 C0         [ 2] 4752         ldaa    #0xC0
   A963 BD 8E 4B      [ 6] 4753         jsr     L8E4B
   A966                    4754 LA966:
   A966 A6 00         [ 4] 4755         ldaa    0,X     
   A968 08            [ 3] 4756         inx
   A969 81 2C         [ 2] 4757         cmpa    #0x2C
   A96B 27 07         [ 3] 4758         beq     LA974  
   A96D 36            [ 3] 4759         psha
   A96E BD 8E 70      [ 6] 4760         jsr     L8E70
   A971 32            [ 4] 4761         pula
   A972 20 F2         [ 3] 4762         bra     LA966  
   A974                    4763 LA974:
   A974 39            [ 5] 4764         rts
                           4765 
                           4766 ; Wait for SCD Keypress
   A975                    4767 LA975:
   A975 BD 8E 95      [ 6] 4768         jsr     L8E95
   A978 4D            [ 2] 4769         tsta
   A979 27 FA         [ 3] 4770         beq     LA975  
   A97B 39            [ 5] 4771         rts
                           4772 
   A97C                    4773 LA97C:
   A97C 7F 00 60      [ 6] 4774         clr     (0x0060)
   A97F FC 02 9C      [ 5] 4775         ldd     (0x029C)
   A982 1A 83 00 01   [ 5] 4776         cpd     #0x0001
   A986 27 0C         [ 3] 4777         beq     LA994  
   A988 1A 83 03 E8   [ 5] 4778         cpd     #0x03E8
   A98C 2D 7D         [ 3] 4779         blt     LAA0B  
   A98E 1A 83 04 4B   [ 5] 4780         cpd     #0x044B
   A992 22 77         [ 3] 4781         bhi     LAA0B  
   A994                    4782 LA994:
   A994 C6 40         [ 2] 4783         ldab    #0x40
   A996 D7 62         [ 3] 4784         stab    (0x0062)
   A998 BD F9 C5      [ 6] 4785         jsr     BUTNLIT 
   A99B C6 64         [ 2] 4786         ldab    #0x64           ; delay 1 sec
   A99D BD 8C 22      [ 6] 4787         jsr     DLYSECSBY100
   A9A0 BD 86 C4      [ 6] 4788         jsr     L86C4           ; Reset boards 1-10
   A9A3 BD 8C E9      [ 6] 4789         jsr     L8CE9
                           4790 
   A9A6 BD 8D E4      [ 6] 4791         jsr     LCDMSG1 
   A9A9 20 20 20 20 20 53  4792         .ascis  '     STUDIO'
        54 55 44 49 CF
                           4793 
   A9B4 BD 8D DD      [ 6] 4794         jsr     LCDMSG2 
   A9B7 70 72 6F 67 72 61  4795         .ascis  'programming mode'
        6D 6D 69 6E 67 20
        6D 6F 64 E5
                           4796 
   A9C7 BD A3 2E      [ 6] 4797         jsr     LA32E
   A9CA BD 99 9E      [ 6] 4798         jsr     L999E
   A9CD BD 99 B1      [ 6] 4799         jsr     L99B1
   A9D0 CE 20 00      [ 3] 4800         ldx     #0x2000
   A9D3                    4801 LA9D3:
   A9D3 18 CE 00 C0   [ 4] 4802         ldy     #0x00C0
   A9D7                    4803 LA9D7:
   A9D7 18 09         [ 4] 4804         dey
   A9D9 26 0A         [ 3] 4805         bne     LA9E5  
   A9DB BD A9 F4      [ 6] 4806         jsr     LA9F4
   A9DE 96 60         [ 3] 4807         ldaa    (0x0060)
   A9E0 26 29         [ 3] 4808         bne     LAA0B  
   A9E2 CE 20 00      [ 3] 4809         ldx     #0x2000
   A9E5                    4810 LA9E5:
   A9E5 B6 10 A8      [ 4] 4811         ldaa    (0x10A8)
   A9E8 84 01         [ 2] 4812         anda    #0x01
   A9EA 27 EB         [ 3] 4813         beq     LA9D7  
   A9EC B6 10 A9      [ 4] 4814         ldaa    (0x10A9)
   A9EF A7 00         [ 4] 4815         staa    0,X     
   A9F1 08            [ 3] 4816         inx
   A9F2 20 DF         [ 3] 4817         bra     LA9D3
                           4818 
   A9F4                    4819 LA9F4:
   A9F4 CE 20 00      [ 3] 4820         ldx     #0x2000
   A9F7 18 CE 10 80   [ 4] 4821         ldy     #0x1080
   A9FB                    4822 LA9FB:
   A9FB A6 00         [ 4] 4823         ldaa    0,X     
   A9FD 18 A7 00      [ 5] 4824         staa    0,Y     
   AA00 08            [ 3] 4825         inx
   AA01 18 08         [ 4] 4826         iny
   AA03 18 08         [ 4] 4827         iny
   AA05 8C 20 10      [ 4] 4828         cpx     #0x2010
   AA08 25 F1         [ 3] 4829         bcs     LA9FB  
   AA0A 39            [ 5] 4830         rts
   AA0B                    4831 LAA0B:
   AA0B 39            [ 5] 4832         rts
                           4833 
   AA0C                    4834 LAA0C:
   AA0C CC 48 37      [ 3] 4835         ldd     #0x4837         ;'H'
   AA0F                    4836 LAA0F:
   AA0F BD 8D B5      [ 6] 4837         jsr     L8DB5           ; display char here on LCD display
   AA12 39            [ 5] 4838         rts
                           4839 
   AA13                    4840 LAA13:
   AA13 CC 20 37      [ 3] 4841         ldd     #0x2037         ;' '
   AA16 20 F7         [ 3] 4842         bra     LAA0F
                           4843 
   AA18                    4844 LAA18:
   AA18 CC 42 0F      [ 3] 4845         ldd     #0x420F         ;'B'
   AA1B 20 F2         [ 3] 4846         bra     LAA0F
                           4847 
   AA1D                    4848 LAA1D:
   AA1D CC 20 0F      [ 3] 4849         ldd     #0x200F         ;' '
   AA20 20 ED         [ 3] 4850         bra     LAA0F
                           4851 
   AA22                    4852 LAA22: 
   AA22 7F 00 4F      [ 6] 4853         clr     (0x004F)
   AA25 CC 00 01      [ 3] 4854         ldd     #0x0001
   AA28 DD 1B         [ 4] 4855         std     CDTIMR1
   AA2A CE 20 00      [ 3] 4856         ldx     #0x2000
   AA2D                    4857 LAA2D:
   AA2D B6 10 A8      [ 4] 4858         ldaa    (0x10A8)
   AA30 84 01         [ 2] 4859         anda    #0x01
   AA32 27 F9         [ 3] 4860         beq     LAA2D  
   AA34 DC 1B         [ 4] 4861         ldd     CDTIMR1
   AA36 0F            [ 2] 4862         sei
   AA37 26 03         [ 3] 4863         bne     LAA3C  
   AA39 CE 20 00      [ 3] 4864         ldx     #0x2000
   AA3C                    4865 LAA3C:
   AA3C B6 10 A9      [ 4] 4866         ldaa    (0x10A9)
   AA3F A7 00         [ 4] 4867         staa    0,X     
   AA41 0E            [ 2] 4868         cli
   AA42 BD F9 6F      [ 6] 4869         jsr     SERIALW      
   AA45 08            [ 3] 4870         inx
   AA46 7F 00 4F      [ 6] 4871         clr     (0x004F)
   AA49 CC 00 01      [ 3] 4872         ldd     #0x0001
   AA4C DD 1B         [ 4] 4873         std     CDTIMR1
   AA4E 8C 20 23      [ 4] 4874         cpx     #0x2023
   AA51 26 DA         [ 3] 4875         bne     LAA2D  
   AA53 CE 20 00      [ 3] 4876         ldx     #0x2000
   AA56 7F 00 B7      [ 6] 4877         clr     (0x00B7)
   AA59                    4878 LAA59:
   AA59 A6 00         [ 4] 4879         ldaa    0,X     
   AA5B 9B B7         [ 3] 4880         adda    (0x00B7)
   AA5D 97 B7         [ 3] 4881         staa    (0x00B7)
   AA5F 08            [ 3] 4882         inx
   AA60 8C 20 22      [ 4] 4883         cpx     #0x2022
   AA63 25 F4         [ 3] 4884         bcs     LAA59  
   AA65 96 B7         [ 3] 4885         ldaa    (0x00B7)
   AA67 88 FF         [ 2] 4886         eora    #0xFF
   AA69 A1 00         [ 4] 4887         cmpa    0,X     
   AA6B CE 20 00      [ 3] 4888         ldx     #0x2000
   AA6E A6 20         [ 4] 4889         ldaa    0x20,X
   AA70 2B 03         [ 3] 4890         bmi     LAA75  
   AA72 7E AA 22      [ 3] 4891         jmp     LAA22
   AA75                    4892 LAA75:
   AA75 A6 00         [ 4] 4893         ldaa    0,X     
   AA77 B7 10 80      [ 4] 4894         staa    (0x1080)
   AA7A 08            [ 3] 4895         inx
   AA7B A6 00         [ 4] 4896         ldaa    0,X     
   AA7D B7 10 82      [ 4] 4897         staa    (0x1082)
   AA80 08            [ 3] 4898         inx
   AA81 A6 00         [ 4] 4899         ldaa    0,X     
   AA83 B7 10 84      [ 4] 4900         staa    (0x1084)
   AA86 08            [ 3] 4901         inx
   AA87 A6 00         [ 4] 4902         ldaa    0,X     
   AA89 B7 10 86      [ 4] 4903         staa    (0x1086)
   AA8C 08            [ 3] 4904         inx
   AA8D A6 00         [ 4] 4905         ldaa    0,X     
   AA8F B7 10 88      [ 4] 4906         staa    (0x1088)
   AA92 08            [ 3] 4907         inx
   AA93 A6 00         [ 4] 4908         ldaa    0,X     
   AA95 B7 10 8A      [ 4] 4909         staa    (0x108A)
   AA98 08            [ 3] 4910         inx
   AA99 A6 00         [ 4] 4911         ldaa    0,X     
   AA9B B7 10 8C      [ 4] 4912         staa    (0x108C)
   AA9E 08            [ 3] 4913         inx
   AA9F A6 00         [ 4] 4914         ldaa    0,X     
   AAA1 B7 10 8E      [ 4] 4915         staa    (0x108E)
   AAA4 08            [ 3] 4916         inx
   AAA5 A6 00         [ 4] 4917         ldaa    0,X     
   AAA7 B7 10 90      [ 4] 4918         staa    (0x1090)
   AAAA 08            [ 3] 4919         inx
   AAAB A6 00         [ 4] 4920         ldaa    0,X     
   AAAD B7 10 92      [ 4] 4921         staa    (0x1092)
   AAB0 08            [ 3] 4922         inx
   AAB1 A6 00         [ 4] 4923         ldaa    0,X     
   AAB3 8A 80         [ 2] 4924         oraa    #0x80
   AAB5 B7 10 94      [ 4] 4925         staa    (0x1094)
   AAB8 08            [ 3] 4926         inx
   AAB9 A6 00         [ 4] 4927         ldaa    0,X     
   AABB 8A 01         [ 2] 4928         oraa    #0x01
   AABD B7 10 96      [ 4] 4929         staa    (0x1096)
   AAC0 08            [ 3] 4930         inx
   AAC1 A6 00         [ 4] 4931         ldaa    0,X     
   AAC3 B7 10 98      [ 4] 4932         staa    (0x1098)
   AAC6 08            [ 3] 4933         inx
   AAC7 A6 00         [ 4] 4934         ldaa    0,X     
   AAC9 B7 10 9A      [ 4] 4935         staa    (0x109A)
   AACC 08            [ 3] 4936         inx
   AACD A6 00         [ 4] 4937         ldaa    0,X     
   AACF B7 10 9C      [ 4] 4938         staa    (0x109C)
   AAD2 08            [ 3] 4939         inx
   AAD3 A6 00         [ 4] 4940         ldaa    0,X     
   AAD5 B7 10 9E      [ 4] 4941         staa    (0x109E)
   AAD8 7E AA 22      [ 3] 4942         jmp     LAA22
                           4943 
   AADB                    4944 LAADB:
   AADB 7F 10 98      [ 6] 4945         clr     (0x1098)
   AADE 7F 10 9A      [ 6] 4946         clr     (0x109A)
   AAE1 7F 10 9C      [ 6] 4947         clr     (0x109C)
   AAE4 7F 10 9E      [ 6] 4948         clr     (0x109E)
   AAE7 39            [ 5] 4949         rts
   AAE8                    4950 LAAE8:
   AAE8 CE 04 2C      [ 3] 4951         ldx     #0x042C
   AAEB C6 10         [ 2] 4952         ldab    #0x10
   AAED                    4953 LAAED:
   AAED 5D            [ 2] 4954         tstb
   AAEE 27 12         [ 3] 4955         beq     LAB02  
   AAF0 A6 00         [ 4] 4956         ldaa    0,X     
   AAF2 81 30         [ 2] 4957         cmpa    #0x30
   AAF4 25 0D         [ 3] 4958         bcs     LAB03  
   AAF6 81 39         [ 2] 4959         cmpa    #0x39
   AAF8 22 09         [ 3] 4960         bhi     LAB03  
   AAFA 08            [ 3] 4961         inx
   AAFB 08            [ 3] 4962         inx
   AAFC 08            [ 3] 4963         inx
   AAFD 8C 04 59      [ 4] 4964         cpx     #0x0459
   AB00 23 EB         [ 3] 4965         bls     LAAED  
   AB02                    4966 LAB02:
   AB02 39            [ 5] 4967         rts
                           4968 
   AB03                    4969 LAB03:
   AB03 5A            [ 2] 4970         decb
   AB04 3C            [ 4] 4971         pshx
   AB05                    4972 LAB05:
   AB05 A6 03         [ 4] 4973         ldaa    3,X     
   AB07 A7 00         [ 4] 4974         staa    0,X     
   AB09 08            [ 3] 4975         inx
   AB0A 8C 04 5C      [ 4] 4976         cpx     #0x045C
   AB0D 25 F6         [ 3] 4977         bcs     LAB05  
   AB0F 86 FF         [ 2] 4978         ldaa    #0xFF
   AB11 B7 04 59      [ 4] 4979         staa    (0x0459)
   AB14 38            [ 5] 4980         pulx
   AB15 20 D6         [ 3] 4981         bra     LAAED
                           4982 
                           4983 ; erase revalid tape section in EEPROM
   AB17                    4984 LAB17:
   AB17 CE 04 2C      [ 3] 4985         ldx     #0x042C
   AB1A 86 FF         [ 2] 4986         ldaa    #0xFF
   AB1C                    4987 LAB1C:
   AB1C A7 00         [ 4] 4988         staa    0,X     
   AB1E 08            [ 3] 4989         inx
   AB1F 8C 04 5C      [ 4] 4990         cpx     #0x045C
   AB22 25 F8         [ 3] 4991         bcs     LAB1C
   AB24 39            [ 5] 4992         rts
                           4993 
   AB25                    4994 LAB25:
   AB25 CE 04 2C      [ 3] 4995         ldx     #0x042C
   AB28                    4996 LAB28:
   AB28 A6 00         [ 4] 4997         ldaa    0,X     
   AB2A 81 30         [ 2] 4998         cmpa    #0x30
   AB2C 25 17         [ 3] 4999         bcs     LAB45  
   AB2E 81 39         [ 2] 5000         cmpa    #0x39
   AB30 22 13         [ 3] 5001         bhi     LAB45  
   AB32 08            [ 3] 5002         inx
   AB33 08            [ 3] 5003         inx
   AB34 08            [ 3] 5004         inx
   AB35 8C 04 5C      [ 4] 5005         cpx     #0x045C
   AB38 25 EE         [ 3] 5006         bcs     LAB28  
   AB3A 86 FF         [ 2] 5007         ldaa    #0xFF
   AB3C B7 04 2C      [ 4] 5008         staa    (0x042C)
   AB3F BD AA E8      [ 6] 5009         jsr     LAAE8
   AB42 CE 04 59      [ 3] 5010         ldx     #0x0459
   AB45                    5011 LAB45:
   AB45 39            [ 5] 5012         rts
                           5013 
   AB46                    5014 LAB46:
   AB46 B6 02 99      [ 4] 5015         ldaa    (0x0299)
   AB49 A7 00         [ 4] 5016         staa    0,X     
   AB4B B6 02 9A      [ 4] 5017         ldaa    (0x029A)
   AB4E A7 01         [ 4] 5018         staa    1,X     
   AB50 B6 02 9B      [ 4] 5019         ldaa    (0x029B)
   AB53 A7 02         [ 4] 5020         staa    2,X     
   AB55 39            [ 5] 5021         rts
                           5022 
   AB56                    5023 LAB56:
   AB56 CE 04 2C      [ 3] 5024         ldx     #0x042C
   AB59                    5025 LAB59:
   AB59 B6 02 99      [ 4] 5026         ldaa    (0x0299)
   AB5C A1 00         [ 4] 5027         cmpa    0,X     
   AB5E 26 10         [ 3] 5028         bne     LAB70  
   AB60 B6 02 9A      [ 4] 5029         ldaa    (0x029A)
   AB63 A1 01         [ 4] 5030         cmpa    1,X     
   AB65 26 09         [ 3] 5031         bne     LAB70  
   AB67 B6 02 9B      [ 4] 5032         ldaa    (0x029B)
   AB6A A1 02         [ 4] 5033         cmpa    2,X     
   AB6C 26 02         [ 3] 5034         bne     LAB70  
   AB6E 20 0A         [ 3] 5035         bra     LAB7A  
   AB70                    5036 LAB70:
   AB70 08            [ 3] 5037         inx
   AB71 08            [ 3] 5038         inx
   AB72 08            [ 3] 5039         inx
   AB73 8C 04 5C      [ 4] 5040         cpx     #0x045C
   AB76 25 E1         [ 3] 5041         bcs     LAB59  
   AB78 0D            [ 2] 5042         sec
   AB79 39            [ 5] 5043         rts
                           5044 
   AB7A                    5045 LAB7A:
   AB7A 0C            [ 2] 5046         clc
   AB7B 39            [ 5] 5047         rts
                           5048 
                           5049 ;show re-valid tapes
   AB7C                    5050 LAB7C:
   AB7C CE 04 2C      [ 3] 5051         ldx     #0x042C
   AB7F                    5052 LAB7F:
   AB7F A6 00         [ 4] 5053         ldaa    0,X     
   AB81 81 30         [ 2] 5054         cmpa    #0x30
   AB83 25 1E         [ 3] 5055         bcs     LABA3  
   AB85 81 39         [ 2] 5056         cmpa    #0x39
   AB87 22 1A         [ 3] 5057         bhi     LABA3  
   AB89 BD F9 6F      [ 6] 5058         jsr     SERIALW      
   AB8C 08            [ 3] 5059         inx
   AB8D A6 00         [ 4] 5060         ldaa    0,X     
   AB8F BD F9 6F      [ 6] 5061         jsr     SERIALW      
   AB92 08            [ 3] 5062         inx
   AB93 A6 00         [ 4] 5063         ldaa    0,X     
   AB95 BD F9 6F      [ 6] 5064         jsr     SERIALW      
   AB98 08            [ 3] 5065         inx
   AB99 86 20         [ 2] 5066         ldaa    #0x20
   AB9B BD F9 6F      [ 6] 5067         jsr     SERIALW      
   AB9E 8C 04 5C      [ 4] 5068         cpx     #0x045C
   ABA1 25 DC         [ 3] 5069         bcs     LAB7F  
   ABA3                    5070 LABA3:
   ABA3 86 0D         [ 2] 5071         ldaa    #0x0D
   ABA5 BD F9 6F      [ 6] 5072         jsr     SERIALW      
   ABA8 86 0A         [ 2] 5073         ldaa    #0x0A
   ABAA BD F9 6F      [ 6] 5074         jsr     SERIALW      
   ABAD 39            [ 5] 5075         rts
                           5076 
   ABAE                    5077 LABAE:
   ABAE 7F 00 4A      [ 6] 5078         clr     (0x004A)
   ABB1 CC 00 64      [ 3] 5079         ldd     #0x0064
   ABB4 DD 23         [ 4] 5080         std     CDTIMR5
   ABB6                    5081 LABB6:
   ABB6 96 4A         [ 3] 5082         ldaa    (0x004A)
   ABB8 26 08         [ 3] 5083         bne     LABC2  
   ABBA BD 9B 19      [ 6] 5084         jsr     L9B19           ; do the random motions if enabled
   ABBD DC 23         [ 4] 5085         ldd     CDTIMR5
   ABBF 26 F5         [ 3] 5086         bne     LABB6  
   ABC1                    5087 LABC1:
   ABC1 39            [ 5] 5088         rts
                           5089 
   ABC2                    5090 LABC2:
   ABC2 81 31         [ 2] 5091         cmpa    #0x31
   ABC4 26 04         [ 3] 5092         bne     LABCA  
   ABC6 BD AB 17      [ 6] 5093         jsr     LAB17
   ABC9 39            [ 5] 5094         rts
                           5095 
   ABCA                    5096 LABCA:
   ABCA 20 F5         [ 3] 5097         bra     LABC1  
                           5098 
                           5099 ; TOC1 timer handler
                           5100 ;
                           5101 ; Timer is running at:
                           5102 ; EXTAL = 16Mhz
                           5103 ; E Clk = 4Mhz
                           5104 ; Timer Prescaler = /16 = 250Khz
                           5105 ; Timer Period = 4us
                           5106 ; T1OC is set to previous value +625
                           5107 ; So, this routine is called every 2.5ms
                           5108 ;
   ABCC                    5109 LABCC:
   ABCC DC 10         [ 4] 5110         ldd     T1NXT           ; get ready for next time
   ABCE C3 02 71      [ 4] 5111         addd    #0x0271         ; add 625
   ABD1 FD 10 16      [ 5] 5112         std     TOC1  
   ABD4 DD 10         [ 4] 5113         std     T1NXT
                           5114 
   ABD6 86 80         [ 2] 5115         ldaa    #0x80
   ABD8 B7 10 23      [ 4] 5116         staa    TFLG1           ; clear timer1 flag
                           5117 
                           5118 ; Some blinking SPECIAL button every half second,
                           5119 ; if 0x0078 is non zero
                           5120 
   ABDB 7D 00 78      [ 6] 5121         tst     (0x0078)        ; if 78 is zero, skip ahead
   ABDE 27 1C         [ 3] 5122         beq     LABFC           ; else do some blinking button lights
   ABE0 DC 25         [ 4] 5123         ldd     (0x0025)        ; else inc 25/26
   ABE2 C3 00 01      [ 4] 5124         addd    #0x0001
   ABE5 DD 25         [ 4] 5125         std     (0x0025)
   ABE7 1A 83 00 C8   [ 5] 5126         cpd     #0x00C8         ; is it 200?
   ABEB 26 0F         [ 3] 5127         bne     LABFC           ; no, keep going
   ABED 7F 00 25      [ 6] 5128         clr     (0x0025)        ; reset 25/26
   ABF0 7F 00 26      [ 6] 5129         clr     (0x0026)
   ABF3 D6 62         [ 3] 5130         ldab    (0x0062)        ; and toggle bit 3 of 62
   ABF5 C8 08         [ 2] 5131         eorb    #0x08
   ABF7 D7 62         [ 3] 5132         stab    (0x0062)
   ABF9 BD F9 C5      [ 6] 5133         jsr     BUTNLIT         ; and toggle the "special" button light
                           5134 
                           5135 ; 
   ABFC                    5136 LABFC:
   ABFC 7C 00 6F      [ 6] 5137         inc     (0x006F)        ; count every 2.5ms
   ABFF 96 6F         [ 3] 5138         ldaa    (0x006F)
   AC01 81 28         [ 2] 5139         cmpa    #0x28           ; is it 40 intervals? (0.1 sec?)
   AC03 25 42         [ 3] 5140         bcs     LAC47           ; if not yet, jump ahead
   AC05 7F 00 6F      [ 6] 5141         clr     (0x006F)        ; clear it 2.5ms counter
   AC08 7D 00 63      [ 6] 5142         tst     (0x0063)        ; decrement 0.1s counter here
   AC0B 27 03         [ 3] 5143         beq     LAC10           ; if it's not already zero
   AC0D 7A 00 63      [ 6] 5144         dec     (0x0063)
                           5145 
                           5146 ; staggered counters - here every 100ms
                           5147 
                           5148 ; 0x0070 counts from 250 to 1, period is 25 secs
   AC10                    5149 LAC10:
   AC10 96 70         [ 3] 5150         ldaa    OFFCNT1         ; decrement 0.1s counter here
   AC12 4A            [ 2] 5151         deca
   AC13 97 70         [ 3] 5152         staa    OFFCNT1
   AC15 26 04         [ 3] 5153         bne     LAC1B       
   AC17 86 FA         [ 2] 5154         ldaa    #0xFA           ; 250
   AC19 97 70         [ 3] 5155         staa    OFFCNT1
                           5156 
                           5157 ; 0x0071 counts from 230 to 1, period is 23 secs
   AC1B                    5158 LAC1B:
   AC1B 96 71         [ 3] 5159         ldaa    OFFCNT2
   AC1D 4A            [ 2] 5160         deca
   AC1E 97 71         [ 3] 5161         staa    OFFCNT2
   AC20 26 04         [ 3] 5162         bne     LAC26  
   AC22 86 E6         [ 2] 5163         ldaa    #0xE6           ; 230
   AC24 97 71         [ 3] 5164         staa    OFFCNT2
                           5165 
                           5166 ; 0x0072 counts from 210 to 1, period is 21 secs
   AC26                    5167 LAC26:
   AC26 96 72         [ 3] 5168         ldaa    OFFCNT3
   AC28 4A            [ 2] 5169         deca
   AC29 97 72         [ 3] 5170         staa    OFFCNT3
   AC2B 26 04         [ 3] 5171         bne     LAC31  
   AC2D 86 D2         [ 2] 5172         ldaa    #0xD2           ; 210
   AC2F 97 72         [ 3] 5173         staa    OFFCNT3
                           5174 
                           5175 ; 0x0073 counts from 190 to 1, period is 19 secs
   AC31                    5176 LAC31:
   AC31 96 73         [ 3] 5177         ldaa    OFFCNT4
   AC33 4A            [ 2] 5178         deca
   AC34 97 73         [ 3] 5179         staa    OFFCNT4
   AC36 26 04         [ 3] 5180         bne     LAC3C  
   AC38 86 BE         [ 2] 5181         ldaa    #0xBE           ; 190
   AC3A 97 73         [ 3] 5182         staa    OFFCNT4
                           5183 
                           5184 ; 0x0074 counts from 170 to 1, period is 17 secs
   AC3C                    5185 LAC3C:
   AC3C 96 74         [ 3] 5186         ldaa    OFFCNT5
   AC3E 4A            [ 2] 5187         deca
   AC3F 97 74         [ 3] 5188         staa    OFFCNT5
   AC41 26 04         [ 3] 5189         bne     LAC47  
   AC43 86 AA         [ 2] 5190         ldaa    #0xAA           ; 170
   AC45 97 74         [ 3] 5191         staa    OFFCNT5
                           5192 
                           5193 ; back to 2.5ms period here
                           5194 
   AC47                    5195 LAC47:
   AC47 96 27         [ 3] 5196         ldaa    T30MS
   AC49 4C            [ 2] 5197         inca
   AC4A 97 27         [ 3] 5198         staa    T30MS
   AC4C 81 0C         [ 2] 5199         cmpa    #0x0C           ; 12 = 30ms?
   AC4E 23 09         [ 3] 5200         bls     LAC59  
   AC50 7F 00 27      [ 6] 5201         clr     T30MS
                           5202 
                           5203 ; do these two tasks every 30ms
   AC53 BD 8E C6      [ 6] 5204         jsr     L8EC6           ; Scan SCD keys
   AC56 BD 8F 12      [ 6] 5205         jsr     L8F12           ; Scan Front Panel Switches
                           5206 
                           5207 ; back to every 2.5ms here
                           5208 ; LCD update???
                           5209 
   AC59                    5210 LAC59:
   AC59 96 43         [ 3] 5211         ldaa    (0x0043)
   AC5B 27 55         [ 3] 5212         beq     LACB2  
   AC5D DE 44         [ 4] 5213         ldx     (0x0044)
   AC5F A6 00         [ 4] 5214         ldaa    0,X     
   AC61 27 23         [ 3] 5215         beq     LAC86  
   AC63 B7 10 00      [ 4] 5216         staa    PORTA  
   AC66 B6 10 02      [ 4] 5217         ldaa    PORTG  
   AC69 84 F3         [ 2] 5218         anda    #0xF3
   AC6B B7 10 02      [ 4] 5219         staa    PORTG  
   AC6E 84 FD         [ 2] 5220         anda    #0xFD
   AC70 B7 10 02      [ 4] 5221         staa    PORTG  
   AC73 8A 02         [ 2] 5222         oraa    #0x02
   AC75 B7 10 02      [ 4] 5223         staa    PORTG  
   AC78 08            [ 3] 5224         inx
   AC79 08            [ 3] 5225         inx
   AC7A 8C 05 80      [ 4] 5226         cpx     #0x0580
   AC7D 25 03         [ 3] 5227         bcs     LAC82  
   AC7F CE 05 00      [ 3] 5228         ldx     #0x0500
   AC82                    5229 LAC82:
   AC82 DF 44         [ 4] 5230         stx     (0x0044)
   AC84 20 2C         [ 3] 5231         bra     LACB2  
   AC86                    5232 LAC86:
   AC86 A6 01         [ 4] 5233         ldaa    1,X     
   AC88 27 25         [ 3] 5234         beq     LACAF  
   AC8A B7 10 00      [ 4] 5235         staa    PORTA  
   AC8D B6 10 02      [ 4] 5236         ldaa    PORTG  
   AC90 84 FB         [ 2] 5237         anda    #0xFB
   AC92 8A 08         [ 2] 5238         oraa    #0x08
   AC94 B7 10 02      [ 4] 5239         staa    PORTG  
   AC97 84 FD         [ 2] 5240         anda    #0xFD
   AC99 B7 10 02      [ 4] 5241         staa    PORTG  
   AC9C 8A 02         [ 2] 5242         oraa    #0x02
   AC9E B7 10 02      [ 4] 5243         staa    PORTG  
   ACA1 08            [ 3] 5244         inx
   ACA2 08            [ 3] 5245         inx
   ACA3 8C 05 80      [ 4] 5246         cpx     #0x0580
   ACA6 25 03         [ 3] 5247         bcs     LACAB  
   ACA8 CE 05 00      [ 3] 5248         ldx     #0x0500
   ACAB                    5249 LACAB:
   ACAB DF 44         [ 4] 5250         stx     (0x0044)
   ACAD 20 03         [ 3] 5251         bra     LACB2  
   ACAF                    5252 LACAF:
   ACAF 7F 00 43      [ 6] 5253         clr     (0x0043)
                           5254 
                           5255 ; divide by 4
   ACB2                    5256 LACB2:
   ACB2 96 4F         [ 3] 5257         ldaa    (0x004F)
   ACB4 4C            [ 2] 5258         inca
   ACB5 97 4F         [ 3] 5259         staa    (0x004F)
   ACB7 81 04         [ 2] 5260         cmpa    #0x04
   ACB9 26 30         [ 3] 5261         bne     LACEB  
   ACBB 7F 00 4F      [ 6] 5262         clr     (0x004F)
                           5263 
                           5264 ; here every 10ms
                           5265 ; Five big countdown timers available here
                           5266 ; up to 655.35 seconds each
                           5267 
   ACBE DC 1B         [ 4] 5268         ldd     CDTIMR1         ; countdown 0x001B/1C every 10ms
   ACC0 27 05         [ 3] 5269         beq     LACC7           ; if not already 0
   ACC2 83 00 01      [ 4] 5270         subd    #0x0001
   ACC5 DD 1B         [ 4] 5271         std     CDTIMR1
                           5272 
   ACC7                    5273 LACC7:
   ACC7 DC 1D         [ 4] 5274         ldd     CDTIMR2         ; same with 0x001D/1E
   ACC9 27 05         [ 3] 5275         beq     LACD0  
   ACCB 83 00 01      [ 4] 5276         subd    #0x0001
   ACCE DD 1D         [ 4] 5277         std     CDTIMR2
                           5278 
   ACD0                    5279 LACD0:
   ACD0 DC 1F         [ 4] 5280         ldd     CDTIMR3         ; same with 0x001F/20
   ACD2 27 05         [ 3] 5281         beq     LACD9  
   ACD4 83 00 01      [ 4] 5282         subd    #0x0001
   ACD7 DD 1F         [ 4] 5283         std     CDTIMR3
                           5284 
   ACD9                    5285 LACD9:
   ACD9 DC 21         [ 4] 5286         ldd     CDTIMR4         ; same with 0x0021/22
   ACDB 27 05         [ 3] 5287         beq     LACE2  
   ACDD 83 00 01      [ 4] 5288         subd    #0x0001
   ACE0 DD 21         [ 4] 5289         std     CDTIMR4
                           5290 
   ACE2                    5291 LACE2:
   ACE2 DC 23         [ 4] 5292         ldd     CDTIMR5         ; same with 0x0023/24
   ACE4 27 05         [ 3] 5293         beq     LACEB  
   ACE6 83 00 01      [ 4] 5294         subd    #0x0001
   ACE9 DD 23         [ 4] 5295         std     CDTIMR5
                           5296 
                           5297 ; every other time through this, setup a task switch?
   ACEB                    5298 LACEB:
   ACEB 96 B0         [ 3] 5299         ldaa    (TSCNT)
   ACED 88 01         [ 2] 5300         eora    #0x01
   ACEF 97 B0         [ 3] 5301         staa    (TSCNT)
   ACF1 27 18         [ 3] 5302         beq     LAD0B  
                           5303 
   ACF3 BF 01 3C      [ 5] 5304         sts     (0x013C)        ; switch stacks???
   ACF6 BE 01 3E      [ 5] 5305         lds     (0x013E)
   ACF9 DC 10         [ 4] 5306         ldd     T1NXT
   ACFB 83 01 F4      [ 4] 5307         subd    #0x01F4         ; 625-500 = 125?
   ACFE FD 10 18      [ 5] 5308         std     TOC2            ; set this TOC2 to happen 0.5ms
   AD01 86 40         [ 2] 5309         ldaa    #0x40           ; after the current TOC1 but before the next TOC1
   AD03 B7 10 23      [ 4] 5310         staa    TFLG1           ; clear timer2 irq flag, just in case?
   AD06 86 C0         [ 2] 5311         ldaa    #0xC0           ;
   AD08 B7 10 22      [ 4] 5312         staa    TMSK1           ; enable TOC1 and TOC2
   AD0B                    5313 LAD0B:
   AD0B 3B            [12] 5314         rti
                           5315 
                           5316 ; TOC2 Timer handler and SWI handler
   AD0C                    5317 LAD0C:
   AD0C 86 40         [ 2] 5318         ldaa    #0x40
   AD0E B7 10 23      [ 4] 5319         staa    TFLG1           ; clear timer2 flag
   AD11 BF 01 3E      [ 5] 5320         sts     (0x013E)        ; switch stacks back???
   AD14 BE 01 3C      [ 5] 5321         lds     (0x013C)
   AD17 86 80         [ 2] 5322         ldaa    #0x80
   AD19 B7 10 22      [ 4] 5323         staa    TMSK1           ; enable TOC1 only
   AD1C 3B            [12] 5324         rti
                           5325 
                           5326 ; Secondary task??
                           5327 
   AD1D                    5328 TASK2:
   AD1D 7D 04 2A      [ 6] 5329         tst     (0x042A)
   AD20 27 35         [ 3] 5330         beq     LAD57
   AD22 96 B6         [ 3] 5331         ldaa    (0x00B6)
   AD24 26 03         [ 3] 5332         bne     LAD29
   AD26 3F            [14] 5333         swi
   AD27 20 F4         [ 3] 5334         bra     TASK2
   AD29                    5335 LAD29:
   AD29 7F 00 B6      [ 6] 5336         clr     (0x00B6)
   AD2C C6 04         [ 2] 5337         ldab    #0x04
   AD2E                    5338 LAD2E:
   AD2E 37            [ 3] 5339         pshb
   AD2F CE AD 3C      [ 3] 5340         ldx     #LAD3C
   AD32 BD 8A 1A      [ 6] 5341         jsr     L8A1A  
   AD35 3F            [14] 5342         swi
   AD36 33            [ 4] 5343         pulb
   AD37 5A            [ 2] 5344         decb
   AD38 26 F4         [ 3] 5345         bne     LAD2E  
   AD3A 20 E1         [ 3] 5346         bra     TASK2
                           5347 
   AD3C                    5348 LAD3C:
   AD3C 53 31 00           5349         .asciz     'S1'
                           5350 
   AD3F FC 02 9C      [ 5] 5351         ldd     (0x029C)
   AD42 1A 83 00 01   [ 5] 5352         cpd     #0x0001         ; 1
   AD46 27 0C         [ 3] 5353         beq     LAD54  
   AD48 1A 83 03 E8   [ 5] 5354         cpd     #0x03E8         ; 1000
   AD4C 2D 09         [ 3] 5355         blt     LAD57  
   AD4E 1A 83 04 4B   [ 5] 5356         cpd     #0x044B         ; 1099
   AD52 22 03         [ 3] 5357         bhi     LAD57  
   AD54                    5358 LAD54:
   AD54 3F            [14] 5359         swi
   AD55 20 C6         [ 3] 5360         bra     TASK2
   AD57                    5361 LAD57:
   AD57 7F 00 B3      [ 6] 5362         clr     (0x00B3)
   AD5A BD AD 7E      [ 6] 5363         jsr     LAD7E
   AD5D BD AD A0      [ 6] 5364         jsr     LADA0
   AD60 25 BB         [ 3] 5365         bcs     TASK2
   AD62 C6 0A         [ 2] 5366         ldab    #0x0A
   AD64 BD AE 13      [ 6] 5367         jsr     LAE13
   AD67 BD AD AE      [ 6] 5368         jsr     LADAE
   AD6A 25 B1         [ 3] 5369         bcs     TASK2
   AD6C C6 14         [ 2] 5370         ldab    #0x14
   AD6E BD AE 13      [ 6] 5371         jsr     LAE13
   AD71 BD AD B6      [ 6] 5372         jsr     LADB6
   AD74 25 A7         [ 3] 5373         bcs     TASK2
   AD76                    5374 LAD76:
   AD76 BD AD B8      [ 6] 5375         jsr     LADB8
   AD79 0D            [ 2] 5376         sec
   AD7A 25 A1         [ 3] 5377         bcs     TASK2
   AD7C 20 F8         [ 3] 5378         bra     LAD76
   AD7E                    5379 LAD7E:
   AD7E CE AE 1E      [ 3] 5380         ldx     #LAE1E          ;+++
   AD81 BD 8A 1A      [ 6] 5381         jsr     L8A1A  
   AD84 C6 1E         [ 2] 5382         ldab    #0x1E
   AD86 BD AE 13      [ 6] 5383         jsr     LAE13
   AD89 CE AE 22      [ 3] 5384         ldx     #LAE22          ;ATH
   AD8C BD 8A 1A      [ 6] 5385         jsr     L8A1A  
   AD8F C6 1E         [ 2] 5386         ldab    #0x1E
   AD91 BD AE 13      [ 6] 5387         jsr     LAE13
   AD94 CE AE 27      [ 3] 5388         ldx     #LAE27          ;ATZ
   AD97 BD 8A 1A      [ 6] 5389         jsr     L8A1A  
   AD9A C6 1E         [ 2] 5390         ldab    #0x1E
   AD9C BD AE 13      [ 6] 5391         jsr     LAE13
   AD9F 39            [ 5] 5392         rts
   ADA0                    5393 LADA0:
   ADA0 BD B1 DD      [ 6] 5394         jsr     LB1DD
   ADA3 25 FB         [ 3] 5395         bcs     LADA0  
   ADA5 BD B2 4F      [ 6] 5396         jsr     LB24F
                           5397 
   ADA8 52 49 4E 47 00     5398         .asciz  'RING'
                           5399 
   ADAD 39            [ 5] 5400         rts
                           5401 
   ADAE                    5402 LADAE:
   ADAE CE AE 2C      [ 3] 5403         ldx     #LAE2C
   ADB1 BD 8A 1A      [ 6] 5404         jsr     L8A1A           ;ATA
   ADB4 0C            [ 2] 5405         clc
   ADB5 39            [ 5] 5406         rts
   ADB6                    5407 LADB6:
   ADB6 0C            [ 2] 5408         clc
   ADB7 39            [ 5] 5409         rts
                           5410 
   ADB8                    5411 LADB8:
   ADB8 BD B1 D2      [ 6] 5412         jsr     LB1D2
   ADBB BD AE 31      [ 6] 5413         jsr     LAE31
   ADBE 86 01         [ 2] 5414         ldaa    #0x01
   ADC0 97 B3         [ 3] 5415         staa    (0x00B3)
   ADC2 BD B1 DD      [ 6] 5416         jsr     LB1DD
   ADC5 BD B2 71      [ 6] 5417         jsr     LB271
   ADC8 36            [ 3] 5418         psha
   ADC9 BD B2 C0      [ 6] 5419         jsr     LB2C0
   ADCC 32            [ 4] 5420         pula
   ADCD 81 01         [ 2] 5421         cmpa    #0x01
   ADCF 26 08         [ 3] 5422         bne     LADD9  
   ADD1 CE B2 95      [ 3] 5423         ldx     #LB295
   ADD4 BD 8A 1A      [ 6] 5424         jsr     L8A1A           ;'You have selected #1'
   ADD7 20 31         [ 3] 5425         bra     LAE0A  
   ADD9                    5426 LADD9:
   ADD9 81 02         [ 2] 5427         cmpa    #0x02
   ADDB 26 00         [ 3] 5428         bne     LADDD  
   ADDD                    5429 LADDD:
   ADDD 81 03         [ 2] 5430         cmpa    #0x03
   ADDF 26 00         [ 3] 5431         bne     LADE1  
   ADE1                    5432 LADE1:
   ADE1 81 04         [ 2] 5433         cmpa    #0x04
   ADE3 26 00         [ 3] 5434         bne     LADE5  
   ADE5                    5435 LADE5:
   ADE5 81 05         [ 2] 5436         cmpa    #0x05
   ADE7 26 00         [ 3] 5437         bne     LADE9  
   ADE9                    5438 LADE9:
   ADE9 81 06         [ 2] 5439         cmpa    #0x06
   ADEB 26 00         [ 3] 5440         bne     LADED  
   ADED                    5441 LADED:
   ADED 81 07         [ 2] 5442         cmpa    #0x07
   ADEF 26 00         [ 3] 5443         bne     LADF1  
   ADF1                    5444 LADF1:
   ADF1 81 08         [ 2] 5445         cmpa    #0x08
   ADF3 26 00         [ 3] 5446         bne     LADF5  
   ADF5                    5447 LADF5:
   ADF5 81 09         [ 2] 5448         cmpa    #0x09
   ADF7 26 00         [ 3] 5449         bne     LADF9  
   ADF9                    5450 LADF9:
   ADF9 81 0A         [ 2] 5451         cmpa    #0x0A
   ADFB 26 00         [ 3] 5452         bne     LADFD  
   ADFD                    5453 LADFD:
   ADFD 81 0B         [ 2] 5454         cmpa    #0x0B
   ADFF 26 09         [ 3] 5455         bne     LAE0A  
   AE01 CE B2 AA      [ 3] 5456         ldx     #LB2AA          ;'You have selected #11'
   AE04 BD 8A 1A      [ 6] 5457         jsr     L8A1A  
   AE07 7E AE 0A      [ 3] 5458         jmp     LAE0A
   AE0A                    5459 LAE0A:
   AE0A C6 14         [ 2] 5460         ldab    #0x14
   AE0C BD AE 13      [ 6] 5461         jsr     LAE13
   AE0F 7F 00 B3      [ 6] 5462         clr     (0x00B3)
   AE12 39            [ 5] 5463         rts
                           5464 
   AE13                    5465 LAE13:
   AE13 CE 00 20      [ 3] 5466         ldx     #0x0020
   AE16                    5467 LAE16:
   AE16 3F            [14] 5468         swi
   AE17 09            [ 3] 5469         dex
   AE18 26 FC         [ 3] 5470         bne     LAE16  
   AE1A 5A            [ 2] 5471         decb
   AE1B 26 F6         [ 3] 5472         bne     LAE13  
   AE1D 39            [ 5] 5473         rts
                           5474 
                           5475 ; text??
   AE1E                    5476 LAE1E:
   AE1E 2B 2B 2B 00        5477         .asciz      '+++'
   AE22                    5478 LAE22:
   AE22 41 54 48 0D 00     5479         .asciz      'ATH\r'
   AE27                    5480 LAE27:
   AE27 41 54 5A 0D 00     5481         .asciz      'ATZ\r'
   AE2C                    5482 LAE2C:
   AE2C 41 54 41 0D 00     5483         .asciz      'ATA\r'
                           5484 
   AE31                    5485 LAE31:
   AE31 CE AE 38      [ 3] 5486         ldx     #LAE38          ; big long string of stats, with compressed ansi codes
   AE34 BD 8A 1A      [ 6] 5487         jsr     L8A1A  
   AE37 39            [ 5] 5488         rts
                           5489 
   AE38                    5490 LAE38:
   AE38 5E 30 31 30 31 53  5491         .ascii  "^0101Serial #:^0140#0000^0111~4"
        65 72 69 61 6C 20
        23 3A 5E 30 31 34
        30 23 30 30 30 30
        5E 30 31 31 31 7E
        34
   AE57 0E 20              5492         .byte   0x0E,0x20
   AE59 5E 30 31 34 31 7C  5493         .ascii  "^0141|"
   AE5F 04 28              5494         .byte   0x04,0x28
   AE61 5E 30 33 30 31 43  5495         .ascii  "^0301CURRENT^0340HISTORY^0501Show Status:^0540Total # reg. shows:^0601Random Status:^0570|"
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
   AEBB 04 10              5496         .byte   0x04,0x10
   AEBD 5E 30 36 34 30 54  5497         .ascii  "^0640Total # live shows:^0701Current Reg Tape #:^0670|"
        6F 74 61 6C 20 23
        20 6C 69 76 65 20
        73 68 6F 77 73 3A
        5E 30 37 30 31 43
        75 72 72 65 6E 74
        20 52 65 67 20 54
        61 70 65 20 23 3A
        5E 30 36 37 30 7C
   AEF3 04 12              5498         .byte   0x04,0x12
   AEF5 5E 30 37 33 30 7E  5499         .ascii  "^0730~3"
        33
   AEFC 04 02              5500         .byte   0x04,0x02
   AEFE 5E 30 37 34 30 54  5501         .ascii  "^0740Total # failed pswd attempts:^0801Current Live Tape #:^0770|"
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
   AF3F 04 14              5502         .byte   0x04,0x14
   AF41 5E 30 38 33 30 7E  5503         .ascii  "^0830~3"
        33
   AF48 04 05              5504         .byte   0x04,0x05
   AF4A 5E 30 38 34 30 54  5505         .ascii  "^0840Total # successful pswd:^0901Current Version #:^0870|"
        6F 74 61 6C 20 23
        20 73 75 63 63 65
        73 73 66 75 6C 20
        70 73 77 64 3A 5E
        30 39 30 31 43 75
        72 72 65 6E 74 20
        56 65 72 73 69 6F
        6E 20 23 3A 5E 30
        38 37 30 7C
   AF84 04 16              5506         .byte   0x04,0x16
   AF86 5E 30 39 33 30 40  5507         .ascii  "^0930@"
   AF8C 04 00              5508         .byte   0x04,0x00
   AF8E 5E 30 39 34 30 54  5509         .ascii  "^0940Total # bdays played:^1040Total # VCR adjusts:^0970|"
        6F 74 61 6C 20 23
        20 62 64 61 79 73
        20 70 6C 61 79 65
        64 3A 5E 31 30 34
        30 54 6F 74 61 6C
        20 23 20 56 43 52
        20 61 64 6A 75 73
        74 73 3A 5E 30 39
        37 30 7C
   AFC7 04 18              5510         .byte   0x04,0x18
   AFC9 5E 31 30 37 30 7C  5511         .ascii  "^1070|"
   AFCF 04 1A              5512         .byte   0x04,0x1A
   AFD1 5E 31 31 34 30 54  5513         .ascii  "^1140Total # remote accesses:^1240Total # access attempts:^1170|"
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
   B011 04 1C              5514         .byte   0x04,0x1C
   B013 5E 31 32 37 30 7C  5515         .ascii  "^1270|"
   B019 04 1E              5516         .byte   0x04,0x1E
   B01B 5E 31 33 34 30 54  5517         .ascii  "^1340Total # rejected showtapes:^1440Total # Short bdays:^1370|"
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
   B05A 04 20              5518         .byte   0x04,0x20
   B05C 5E 31 34 37 30 7C  5519         .ascii  "^1470|"
   B062 04 22              5520         .byte   0x04,0x22
   B064 5E 31 35 34 30 54  5521         .ascii  "^1540Total # Reg bdays:^1640Total # resets-pwr ups:^1570|"
        6F 74 61 6C 20 23
        20 52 65 67 20 62
        64 61 79 73 3A 5E
        31 36 34 30 54 6F
        74 61 6C 20 23 20
        72 65 73 65 74 73
        2D 70 77 72 20 75
        70 73 3A 5E 31 35
        37 30 7C
   B09D 04 24              5522         .byte   0x04,0x24
   B09F 5E 31 36 37 30 7C  5523         .ascii  "^1670|"
   B0A5 04 26              5524         .byte   0x04,0x26
   B0A7 5E 31 38 30 31 46  5525         .ascii  "^1801FUNCTIONS^1823Select Function:^20011.Clear rnd enables^2028 6.Set loc name-#^205411.Diagnostics^21012.Set rnd enables^2128 7.Set Time^215412.^22013.Set reg tape #^2228 8.Disbl-enbl show^225413.^23014.Set liv tape #^2328 9.Upload program^235414.^24015.Reset history^242810.Debugger^245415.^1840"
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
   B1D1 00                 5526         .byte   0x00
                           5527 
   B1D2                    5528 LB1D2:
   B1D2 CE B1 D8      [ 3] 5529         ldx     #LB1D8          ; escape sequence?
   B1D5 7E 8A 1A      [ 3] 5530         jmp     L8A1A  
                           5531 
                           5532 ; ANSI control sequence - Clear Screen and Home Cursor
   B1D8                    5533 LB1D8:
                           5534         ; esc[2J
   B1D8 1B                 5535         .byte   0x1b
   B1D9 5B 32 4A 00        5536         .asciz  '[2J'
                           5537 
   B1DD                    5538 LB1DD:
   B1DD CE 05 A0      [ 3] 5539         ldx     #0x05A0
   B1E0 CC 00 00      [ 3] 5540         ldd     #0x0000
   B1E3 FD 02 9E      [ 5] 5541         std     (0x029E)
   B1E6                    5542 LB1E6:
   B1E6 FC 02 9E      [ 5] 5543         ldd     (0x029E)
   B1E9 C3 00 01      [ 4] 5544         addd    #0x0001
   B1EC FD 02 9E      [ 5] 5545         std     (0x029E)
   B1EF 1A 83 0F A0   [ 5] 5546         cpd     #0x0FA0
   B1F3 24 28         [ 3] 5547         bcc     LB21D  
   B1F5 BD B2 23      [ 6] 5548         jsr     LB223
   B1F8 25 04         [ 3] 5549         bcs     LB1FE  
   B1FA 3F            [14] 5550         swi
   B1FB 20 E9         [ 3] 5551         bra     LB1E6  
   B1FD 39            [ 5] 5552         rts
                           5553 
   B1FE                    5554 LB1FE:
   B1FE A7 00         [ 4] 5555         staa    0,X     
   B200 08            [ 3] 5556         inx
   B201 81 0D         [ 2] 5557         cmpa    #0x0D
   B203 26 02         [ 3] 5558         bne     LB207  
   B205 20 18         [ 3] 5559         bra     LB21F  
   B207                    5560 LB207:
   B207 81 1B         [ 2] 5561         cmpa    #0x1B
   B209 26 02         [ 3] 5562         bne     LB20D  
   B20B 20 10         [ 3] 5563         bra     LB21D  
   B20D                    5564 LB20D:
   B20D 7D 00 B3      [ 6] 5565         tst     (0x00B3)
   B210 27 03         [ 3] 5566         beq     LB215  
   B212 BD 8B 3B      [ 6] 5567         jsr     L8B3B
   B215                    5568 LB215:
   B215 CC 00 00      [ 3] 5569         ldd     #0x0000
   B218 FD 02 9E      [ 5] 5570         std     (0x029E)
   B21B 20 C9         [ 3] 5571         bra     LB1E6  
   B21D                    5572 LB21D:
   B21D 0D            [ 2] 5573         sec
   B21E 39            [ 5] 5574         rts
                           5575 
   B21F                    5576 LB21F:
   B21F 6F 00         [ 6] 5577         clr     0,X     
   B221 0C            [ 2] 5578         clc
   B222 39            [ 5] 5579         rts
                           5580 
   B223                    5581 LB223:
   B223 B6 18 0D      [ 4] 5582         ldaa    SCCCTRLA
   B226 44            [ 2] 5583         lsra
   B227 25 0B         [ 3] 5584         bcs     LB234  
   B229 4F            [ 2] 5585         clra
   B22A B7 18 0D      [ 4] 5586         staa    SCCCTRLA
   B22D 86 30         [ 2] 5587         ldaa    #0x30
   B22F B7 18 0D      [ 4] 5588         staa    SCCCTRLA
   B232 0C            [ 2] 5589         clc
   B233 39            [ 5] 5590         rts
                           5591 
   B234                    5592 LB234:
   B234 86 01         [ 2] 5593         ldaa    #0x01
   B236 B7 18 0D      [ 4] 5594         staa    SCCCTRLA
   B239 86 70         [ 2] 5595         ldaa    #0x70
   B23B B5 18 0D      [ 4] 5596         bita    SCCCTRLA
   B23E 26 05         [ 3] 5597         bne     LB245  
   B240 0D            [ 2] 5598         sec
   B241 B6 18 0F      [ 4] 5599         ldaa    SCCDATAA
   B244 39            [ 5] 5600         rts
                           5601 
   B245                    5602 LB245:
   B245 B6 18 0F      [ 4] 5603         ldaa    SCCDATAA
   B248 86 30         [ 2] 5604         ldaa    #0x30
   B24A B7 18 0C      [ 4] 5605         staa    SCCCTRLB
   B24D 0C            [ 2] 5606         clc
   B24E 39            [ 5] 5607         rts
                           5608 
   B24F                    5609 LB24F:
   B24F 38            [ 5] 5610         pulx
   B250 18 CE 05 A0   [ 4] 5611         ldy     #0x05A0
   B254                    5612 LB254:
   B254 A6 00         [ 4] 5613         ldaa    0,X
   B256 27 11         [ 3] 5614         beq     LB269
   B258 08            [ 3] 5615         inx
   B259 18 A1 00      [ 5] 5616         cmpa    0,Y
   B25C 26 04         [ 3] 5617         bne     LB262
   B25E 18 08         [ 4] 5618         iny
   B260 20 F2         [ 3] 5619         bra     LB254
   B262                    5620 LB262:
   B262 A6 00         [ 4] 5621         ldaa    0,X
   B264 27 07         [ 3] 5622         beq     LB26D
   B266 08            [ 3] 5623         inx
   B267 20 F9         [ 3] 5624         bra     LB262
   B269                    5625 LB269:
   B269 08            [ 3] 5626         inx
   B26A 3C            [ 4] 5627         pshx
   B26B 0C            [ 2] 5628         clc
   B26C 39            [ 5] 5629         rts
   B26D                    5630 LB26D:
   B26D 08            [ 3] 5631         inx
   B26E 3C            [ 4] 5632         pshx
   B26F 0D            [ 2] 5633         sec
   B270 39            [ 5] 5634         rts
                           5635 
   B271                    5636 LB271:
   B271 CE 05 A0      [ 3] 5637         ldx     #0x05A0
   B274                    5638 LB274:
   B274 A6 00         [ 4] 5639         ldaa    0,X
   B276 08            [ 3] 5640         inx
   B277 81 0D         [ 2] 5641         cmpa    #0x0D
   B279 26 F9         [ 3] 5642         bne     LB274
   B27B 09            [ 3] 5643         dex
   B27C 09            [ 3] 5644         dex
   B27D A6 00         [ 4] 5645         ldaa    0,X
   B27F 09            [ 3] 5646         dex
   B280 80 30         [ 2] 5647         suba    #0x30
   B282 97 B2         [ 3] 5648         staa    (0x00B2)
   B284 8C 05 9F      [ 4] 5649         cpx     #0x059F
   B287 27 0B         [ 3] 5650         beq     LB294
   B289 A6 00         [ 4] 5651         ldaa    0,X
   B28B 09            [ 3] 5652         dex
   B28C 80 30         [ 2] 5653         suba    #0x30
   B28E C6 0A         [ 2] 5654         ldab    #0x0A
   B290 3D            [10] 5655         mul
   B291 17            [ 2] 5656         tba
   B292 9B B2         [ 3] 5657         adda    (0x00B2)
   B294                    5658 LB294:
   B294 39            [ 5] 5659         rts
                           5660 
   B295                    5661 LB295:
   B295 59 6F 75 20 68 61  5662         .asciz  'You have selected #1'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 00
   B2AA                    5663 LB2AA:
   B2AA 59 6F 75 20 68 61  5664         .asciz  'You have selected #11'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 31 00
                           5665 
   B2C0                    5666 LB2C0:
   B2C0 CE B2 C7      [ 3] 5667         ldx     #LB2C7          ; Table with compressed ANSI cursor controls
   B2C3 BD 8A 1A      [ 6] 5668         jsr     L8A1A  
   B2C6 39            [ 5] 5669         rts
                           5670 
   B2C7                    5671 LB2C7:
   B2C7 5E 32 30 30 31 25  5672         .asciz  "^2001%^2101%^2201%^2301%^2401%^2001"
        5E 32 31 30 31 25
        5E 32 32 30 31 25
        5E 32 33 30 31 25
        5E 32 34 30 31 25
        5E 32 30 30 31 00
                           5673 
                           5674 ; Random movement tables
                           5675 
                           5676 ; board 1
   B2EB                    5677 LB2EB:
   B2EB FA 20 FA 20 F6 22  5678         .byte   0xfa,0x20,0xfa,0x20,0xf6,0x22,0xf5,0x20
        F5 20
   B2F3 F5 20 F3 22 F2 20  5679         .byte   0xf5,0x20,0xf3,0x22,0xf2,0x20,0xe5,0x22
        E5 22
   B2FB E5 22 E2 20 D2 20  5680         .byte   0xe5,0x22,0xe2,0x20,0xd2,0x20,0xbe,0x00
        BE 00
   B303 BC 22 BB 30 B9 32  5681         .byte   0xbc,0x22,0xbb,0x30,0xb9,0x32,0xb9,0x32
        B9 32
   B30B B7 30 B6 32 B5 30  5682         .byte   0xb7,0x30,0xb6,0x32,0xb5,0x30,0xb4,0x32
        B4 32
   B313 B4 32 B3 20 B3 20  5683         .byte   0xb4,0x32,0xb3,0x20,0xb3,0x20,0xb1,0xa0
        B1 A0
   B31B B1 A0 B0 A2 AF A0  5684         .byte   0xb1,0xa0,0xb0,0xa2,0xaf,0xa0,0xaf,0xa6
        AF A6
   B323 AE A0 AE A6 AD A4  5685         .byte   0xae,0xa0,0xae,0xa6,0xad,0xa4,0xac,0xa0
        AC A0
   B32B AC A0 AB A0 AA A0  5686         .byte   0xac,0xa0,0xab,0xa0,0xaa,0xa0,0xaa,0xa0
        AA A0
   B333 A2 80 A0 A0 A0 A0  5687         .byte   0xa2,0x80,0xa0,0xa0,0xa0,0xa0,0x8d,0x80
        8D 80
   B33B 8A A0 7E 80 7B A0  5688         .byte   0x8a,0xa0,0x7e,0x80,0x7b,0xa0,0x79,0xa4
        79 A4
   B343 78 A0 77 A4 76 A0  5689         .byte   0x78,0xa0,0x77,0xa4,0x76,0xa0,0x75,0xa4
        75 A4
   B34B 74 A0 73 A4 72 A0  5690         .byte   0x74,0xa0,0x73,0xa4,0x72,0xa0,0x71,0xa4
        71 A4
   B353 70 A0 6F A4 6E A0  5691         .byte   0x70,0xa0,0x6f,0xa4,0x6e,0xa0,0x6d,0xa4
        6D A4
   B35B 6C A0 69 80 69 80  5692         .byte   0x6c,0xa0,0x69,0x80,0x69,0x80,0x67,0xa0
        67 A0
   B363 5E 20 58 24 57 20  5693         .byte   0x5e,0x20,0x58,0x24,0x57,0x20,0x57,0x20
        57 20
   B36B 56 24 55 20 54 24  5694         .byte   0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24
        54 24
   B373 53 20 52 24 52 24  5695         .byte   0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20
        50 20
   B37B 4F 24 4E 20 4D 24  5696         .byte   0x4f,0x24,0x4e,0x20,0x4d,0x24,0x4c,0x20
        4C 20
   B383 4C 20 4B 24 4A 20  5697         .byte   0x4c,0x20,0x4b,0x24,0x4a,0x20,0x49,0x20
        49 20
   B38B 49 00 48 20 47 20  5698         .byte   0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20
        47 20
   B393 46 20 45 24 45 24  5699         .byte   0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20
        44 20
   B39B 42 20 42 20 37 04  5700         .byte   0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20
        35 20
   B3A3 2E 04 2E 04 2D 20  5701         .byte   0x2e,0x04,0x2e,0x04,0x2d,0x20,0x23,0x24
        23 24
   B3AB 21 20 17 24 13 00  5702         .byte   0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24
        11 24
   B3B3 10 30 07 34 06 30  5703         .byte   0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30
        05 30
   B3BB FF FF              5704         .byte   0xff,0xff
                           5705 
                           5706 ; board 2
   B3BD                    5707 LB3BD:
   B3BD D7 22 D5 20 C9 22  5708         .byte   0xd7,0x22,0xd5,0x20,0xc9,0x22,0xc7,0x20
        C7 20
   B3C5 C4 24 C3 20 C2 24  5709         .byte   0xc4,0x24,0xc3,0x20,0xc2,0x24,0xc1,0x20
        C1 20
   B3CD BF 24 BF 24 BE 20  5710         .byte   0xbf,0x24,0xbf,0x24,0xbe,0x20,0xbd,0x24
        BD 24
   B3D5 BC 20 BB 24 BA 20  5711         .byte   0xbc,0x20,0xbb,0x24,0xba,0x20,0xb9,0x20
        B9 20
   B3DD B8 24 B7 20 B4 00  5712         .byte   0xb8,0x24,0xb7,0x20,0xb4,0x00,0xb4,0x00
        B4 00
   B3E5 B2 20 A9 20 A3 20  5713         .byte   0xb2,0x20,0xa9,0x20,0xa3,0x20,0xa2,0x20
        A2 20
   B3ED A1 20 A0 20 A0 20  5714         .byte   0xa1,0x20,0xa0,0x20,0xa0,0x20,0x9f,0x20
        9F 20
   B3F5 9F 20 9E 20 9D 24  5715         .byte   0x9f,0x20,0x9e,0x20,0x9d,0x24,0x9d,0x24
        9D 24
   B3FD 9B 20 9A 24 99 20  5716         .byte   0x9b,0x20,0x9a,0x24,0x99,0x20,0x98,0x20
        98 20
   B405 97 24 97 24 95 20  5717         .byte   0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20
        95 20
   B40D 94 00 94 00 93 20  5718         .byte   0x94,0x00,0x94,0x00,0x93,0x20,0x92,0x00
        92 00
   B415 92 00 91 20 90 20  5719         .byte   0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20
        90 20
   B41D 8F 20 8D 20 8D 20  5720         .byte   0x8f,0x20,0x8d,0x20,0x8d,0x20,0x81,0x00
        81 00
   B425 7F 20 79 00 79 00  5721         .byte   0x7f,0x20,0x79,0x00,0x79,0x00,0x78,0x20
        78 20
   B42D 76 20 6B 00 69 20  5722         .byte   0x76,0x20,0x6b,0x00,0x69,0x20,0x5e,0x00
        5E 00
   B435 5C 20 5B 30 52 10  5723         .byte   0x5c,0x20,0x5b,0x30,0x52,0x10,0x51,0x30
        51 30
   B43D 50 30 50 30 4F 20  5724         .byte   0x50,0x30,0x50,0x30,0x4f,0x20,0x4e,0x20
        4E 20
   B445 4E 20 4D 20 46 A0  5725         .byte   0x4e,0x20,0x4d,0x20,0x46,0xa0,0x45,0xa0
        45 A0
   B44D 3D A0 3D A0 39 20  5726         .byte   0x3d,0xa0,0x3d,0xa0,0x39,0x20,0x2a,0x00
        2A 00
   B455 28 20 1E 00 1C 22  5727         .byte   0x28,0x20,0x1e,0x00,0x1c,0x22,0x1c,0x22
        1C 22
   B45D 1B 20 1A 22 19 20  5728         .byte   0x1b,0x20,0x1a,0x22,0x19,0x20,0x18,0x22
        18 22
   B465 18 22 16 20 15 22  5729         .byte   0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22
        15 22
   B46D 14 A0 13 A2 11 A0  5730         .byte   0x14,0xa0,0x13,0xa2,0x11,0xa0,0xff,0xff
        FF FF
                           5731 
                           5732 ; board 4
   B475                    5733 LB475:
   B475 BE 00 BC 22 BB 30  5734         .byte   0xbe,0x00,0xbc,0x22,0xbb,0x30,0xb9,0x32
        B9 32
   B47D B9 32 B7 30 B6 32  5735         .byte   0xb9,0x32,0xb7,0x30,0xb6,0x32,0xb5,0x30
        B5 30
   B485 B4 32 B4 32 B3 20  5736         .byte   0xb4,0x32,0xb4,0x32,0xb3,0x20,0xb3,0x20
        B3 20
   B48D B1 A0 B1 A0 B0 A2  5737         .byte   0xb1,0xa0,0xb1,0xa0,0xb0,0xa2,0xaf,0xa0
        AF A0
   B495 AF A6 AE A0 AE A6  5738         .byte   0xaf,0xa6,0xae,0xa0,0xae,0xa6,0xad,0xa4
        AD A4
   B49D AC A0 AC A0 AB A0  5739         .byte   0xac,0xa0,0xac,0xa0,0xab,0xa0,0xaa,0xa0
        AA A0
   B4A5 AA A0 A2 80 A0 A0  5740         .byte   0xaa,0xa0,0xa2,0x80,0xa0,0xa0,0xa0,0xa0
        A0 A0
   B4AD 8D 80 8A A0 7E 80  5741         .byte   0x8d,0x80,0x8a,0xa0,0x7e,0x80,0x7b,0xa0
        7B A0
   B4B5 79 A4 78 A0 77 A4  5742         .byte   0x79,0xa4,0x78,0xa0,0x77,0xa4,0x76,0xa0
        76 A0
   B4BD 75 A4 74 A0 73 A4  5743         .byte   0x75,0xa4,0x74,0xa0,0x73,0xa4,0x72,0xa0
        72 A0
   B4C5 71 A4 70 A0 6F A4  5744         .byte   0x71,0xa4,0x70,0xa0,0x6f,0xa4,0x6e,0xa0
        6E A0
   B4CD 6D A4 6C A0 69 80  5745         .byte   0x6d,0xa4,0x6c,0xa0,0x69,0x80,0x69,0x80
        69 80
   B4D5 67 A0 5E 20 58 24  5746         .byte   0x67,0xa0,0x5e,0x20,0x58,0x24,0x57,0x20
        57 20
   B4DD 57 20 56 24 55 20  5747         .byte   0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24
        54 24
   B4E5 54 24 53 20 52 24  5748         .byte   0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24
        52 24
   B4ED 50 20 4F 24 4E 20  5749         .byte   0x50,0x20,0x4f,0x24,0x4e,0x20,0x4d,0x24
        4D 24
   B4F5 4C 20 4C 20 4B 24  5750         .byte   0x4c,0x20,0x4c,0x20,0x4b,0x24,0x4a,0x20
        4A 20
   B4FD 49 20 49 00 48 20  5751         .byte   0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20
        47 20
   B505 47 20 46 20 45 24  5752         .byte   0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24
        45 24
   B50D 44 20 42 20 42 20  5753         .byte   0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04
        37 04
   B515 35 20 2E 04 2E 04  5754         .byte   0x35,0x20,0x2e,0x04,0x2e,0x04,0x2d,0x20
        2D 20
   B51D 23 24 21 20 17 24  5755         .byte   0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00
        13 00
   B525 11 24 10 30 07 34  5756         .byte   0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30
        06 30
   B52D 05 30 FF FF        5757         .byte   0x05,0x30,0xff,0xff
                           5758 
                           5759 ; board 3
   B531                    5760 LB531:
   B531 CD 20 CC 20 CB 20  5761         .byte   0xcd,0x20,0xcc,0x20,0xcb,0x20,0xcb,0x20
        CB 20
   B539 CA 00 C9 20 C9 20  5762         .byte   0xca,0x00,0xc9,0x20,0xc9,0x20,0xc8,0x20
        C8 20
   B541 C1 A0 C0 A0 B8 A0  5763         .byte   0xc1,0xa0,0xc0,0xa0,0xb8,0xa0,0xb8,0x20
        B8 20
   B549 B4 20 A6 00 A4 20  5764         .byte   0xb4,0x20,0xa6,0x00,0xa4,0x20,0x99,0x00
        99 00
   B551 97 22 97 22 96 20  5765         .byte   0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22
        95 22
   B559 94 20 93 22 93 22  5766         .byte   0x94,0x20,0x93,0x22,0x93,0x22,0x91,0x20
        91 20
   B561 90 20 90 20 8D A0  5767         .byte   0x90,0x20,0x90,0x20,0x8d,0xa0,0x8c,0xa0
        8C A0
   B569 7D A2 7D A2 7B A0  5768         .byte   0x7d,0xa2,0x7d,0xa2,0x7b,0xa0,0x7b,0xa0
        7B A0
   B571 79 A2 79 A2 77 A0  5769         .byte   0x79,0xa2,0x79,0xa2,0x77,0xa0,0x77,0xa0
        77 A0
   B579 76 80 75 A0 6E 20  5770         .byte   0x76,0x80,0x75,0xa0,0x6e,0x20,0x67,0x24
        67 24
   B581 66 20 65 24 64 20  5771         .byte   0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24
        63 24
   B589 63 24 61 20 60 24  5772         .byte   0x63,0x24,0x61,0x20,0x60,0x24,0x5f,0x20
        5F 20
   B591 5E 20 5D 24 5C 20  5773         .byte   0x5e,0x20,0x5d,0x24,0x5c,0x20,0x5b,0x24
        5B 24
   B599 5A 20 59 24 58 20  5774         .byte   0x5a,0x20,0x59,0x24,0x58,0x20,0x56,0x20
        56 20
   B5A1 55 04 54 00 53 24  5775         .byte   0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20
        52 20
   B5A9 52 20 4F 24 4F 24  5776         .byte   0x52,0x20,0x4f,0x24,0x4f,0x24,0x4e,0x30
        4E 30
   B5B1 4D 30 47 10 45 30  5777         .byte   0x4d,0x30,0x47,0x10,0x45,0x30,0x35,0x30
        35 30
   B5B9 33 10 31 30 31 30  5778         .byte   0x33,0x10,0x31,0x30,0x31,0x30,0x1d,0x20
        1D 20
   B5C1 FF FF              5779         .byte   0xff,0xff
                           5780 
                           5781 ; board 5
   B5C3                    5782 LB5C3:
   B5C3 A9 20 A3 20 A2 20  5783         .byte   0xa9,0x20,0xa3,0x20,0xa2,0x20,0xa1,0x20
        A1 20
   B5CB A0 20 A0 20 9F 20  5784         .byte   0xa0,0x20,0xa0,0x20,0x9f,0x20,0x9f,0x20
        9F 20
   B5D3 9E 20 9D 24 9D 24  5785         .byte   0x9e,0x20,0x9d,0x24,0x9d,0x24,0x9b,0x20
        9B 20
   B5DB 9A 24 99 20 98 20  5786         .byte   0x9a,0x24,0x99,0x20,0x98,0x20,0x97,0x24
        97 24
   B5E3 97 24 95 20 95 20  5787         .byte   0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00
        94 00
   B5EB 94 00 93 20 92 00  5788         .byte   0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00
        92 00
   B5F3 91 20 90 20 90 20  5789         .byte   0x91,0x20,0x90,0x20,0x90,0x20,0x8f,0x20
        8F 20
   B5FB 8D 20 8D 20 81 00  5790         .byte   0x8d,0x20,0x8d,0x20,0x81,0x00,0x7f,0x20
        7F 20
   B603 79 00 79 00 78 20  5791         .byte   0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20
        76 20
   B60B 6B 00 69 20 5E 00  5792         .byte   0x6b,0x00,0x69,0x20,0x5e,0x00,0x5c,0x20
        5C 20
   B613 5B 30 52 10 51 30  5793         .byte   0x5b,0x30,0x52,0x10,0x51,0x30,0x50,0x30
        50 30
   B61B 50 30 4F 20 4E 20  5794         .byte   0x50,0x30,0x4f,0x20,0x4e,0x20,0x4e,0x20
        4E 20
   B623 4D 20 46 A0 45 A0  5795         .byte   0x4d,0x20,0x46,0xa0,0x45,0xa0,0x3d,0xa0
        3D A0
   B62B 3D A0 39 20 2A 00  5796         .byte   0x3d,0xa0,0x39,0x20,0x2a,0x00,0x28,0x20
        28 20
   B633 1E 00 1C 22 1C 22  5797         .byte   0x1e,0x00,0x1c,0x22,0x1c,0x22,0x1b,0x20
        1B 20
   B63B 1A 22 19 20 18 22  5798         .byte   0x1a,0x22,0x19,0x20,0x18,0x22,0x18,0x22
        18 22
   B643 16 20 15 22 15 22  5799         .byte   0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xa0
        14 A0
   B64B 13 A2 11 A0        5800         .byte   0x13,0xa2,0x11,0xa0
                           5801 
                           5802 ; All empty (0xFFs) in this gap
                           5803 
   F780                    5804         .org    0xF780
                           5805 
                           5806 ; Two Tables used by data protocol handler
                           5807 
   F780                    5808 LF780:
   F780 57 0B 00 00 00 00  5809         .byte   0x57,0x0b,0x00,0x00,0x00,0x00,0x08,0x00
        08 00
   F788 00 00 20 00 00 00  5810         .byte   0x00,0x00,0x20,0x00,0x00,0x00,0x80,0x00
        80 00
   F790 00 00 00 00 00 04  5811         .byte   0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
        00 00
   F798 00 10 00 00 00 00  5812         .byte   0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
                           5813 
   F7A0                    5814 LF7A0:
   F7A0 40 12 20 09 80 24  5815         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x02,0x00
        02 00
   F7A8 40 12 20 09 80 24  5816         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x04,0x00
        04 00
   F7B0 00 00 00 00 00 00  5817         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
   F7B8 00 00 00 00 08 00  5818         .byte   0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        00 00
                           5819 
   F7C0                    5820 LF7C0:
   F7C0 00                 5821         .byte   0x00
                           5822 ;
                           5823 ; All empty (0xFFs) in this gap
                           5824 ;
   F800                    5825         .org    0xF800
                           5826 ; Reset
   F800                    5827 RESET:
   F800 0F            [ 2] 5828         sei                     ; disable interrupts
   F801 86 03         [ 2] 5829         ldaa    #0x03
   F803 B7 10 24      [ 4] 5830         staa    TMSK2           ; disable irqs, set prescaler to 16
   F806 86 80         [ 2] 5831         ldaa    #0x80
   F808 B7 10 22      [ 4] 5832         staa    TMSK1           ; enable OC1 irq
   F80B 86 FE         [ 2] 5833         ldaa    #0xFE
   F80D B7 10 35      [ 4] 5834         staa    BPROT           ; protect everything except $xE00-$xE1F
   F810 96 07         [ 3] 5835         ldaa    0x0007          ;
   F812 81 DB         [ 2] 5836         cmpa    #0xDB           ; special unprotect mode???
   F814 26 06         [ 3] 5837         bne     LF81C           ; if not, jump ahead
   F816 7F 10 35      [ 6] 5838         clr     BPROT           ; else unprotect everything
   F819 7F 00 07      [ 6] 5839         clr     0x0007          ; reset special unprotect mode???
   F81C                    5840 LF81C:
   F81C 8E 01 FF      [ 3] 5841         lds     #0x01FF         ; init SP
   F81F 86 A5         [ 2] 5842         ldaa    #0xA5
   F821 B7 10 5D      [ 4] 5843         staa    CSCTL           ; enable external IO:
                           5844                                 ; IO1EN,  BUSSEL, active LOW
                           5845                                 ; IO2EN,  PIA/SCCSEL, active LOW
                           5846                                 ; CSPROG, ROMSEL priority over RAMSEL 
                           5847                                 ; CSPROG, ROMSEL enabled, 32K, $8000-$FFFF
   F824 86 01         [ 2] 5848         ldaa    #0x01
   F826 B7 10 5F      [ 4] 5849         staa    CSGSIZ          ; CSGEN,  RAMSEL active low
                           5850                                 ; CSGEN,  RAMSEL 32K
   F829 86 00         [ 2] 5851         ldaa    #0x00
   F82B B7 10 5E      [ 4] 5852         staa    CSGADR          ; CSGEN,  RAMSEL = $0000-$7FFF (except internal regs)
   F82E 86 F0         [ 2] 5853         ldaa    #0xF0
   F830 B7 10 5C      [ 4] 5854         staa    CSSTRH          ; 3 cycle clock stretching on BUSSEL and LCRS
   F833 7F 00 00      [ 6] 5855         clr     0x0000          ; ????? Done with basic init?
                           5856 
                           5857 ; Initialize Main PIA
   F836 86 30         [ 2] 5858         ldaa    #0x30           ;
   F838 B7 18 05      [ 4] 5859         staa    PIA0CRA         ; control register A, CA2=0, sel DDRA
   F83B B7 18 07      [ 4] 5860         staa    PIA0CRB         ; control register B, CB2=0, sel DDRB
   F83E 86 FF         [ 2] 5861         ldaa    #0xFF
   F840 B7 18 06      [ 4] 5862         staa    PIA0DDRB        ; select B0-B7 to be outputs
   F843 86 78         [ 2] 5863         ldaa    #0x78           ;
   F845 B7 18 04      [ 4] 5864         staa    PIA0DDRA        ; select A3-A6 to be outputs
   F848 86 34         [ 2] 5865         ldaa    #0x34           ;
   F84A B7 18 05      [ 4] 5866         staa    PIA0CRA         ; select output register A
   F84D B7 18 07      [ 4] 5867         staa    PIA0CRB         ; select output register B
   F850 C6 FF         [ 2] 5868         ldab    #0xFF
   F852 BD F9 C5      [ 6] 5869         jsr     BUTNLIT         ; turn on all button lights
   F855 20 13         [ 3] 5870         bra     LF86A           ; jump past data table
                           5871 
                           5872 ; data table for aux serial config
   F857                    5873 LF857:
   F857 09 4A              5874         .byte   0x09,0x4a       ; channel reset B, MIE off, DLC on, no vector
   F859 01 10              5875         .byte   0x01,0x10       ; irq on all character received
   F85B 0C 18              5876         .byte   0x0c,0x18       ; Lower byte of time constant
   F85D 0D 00              5877         .byte   0x0d,0x00       ; Upper byte of time constant
   F85F 04 44              5878         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   F861 0E 63              5879         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   F863 05 68              5880         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   F865 0B 56              5881         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   F867 03 C1              5882         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           5883         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           5884         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   F869 FF                 5885         .byte   0xff            ; end of table marker
                           5886 
                           5887 ; init SCC (8530), aux serial config
   F86A                    5888 LF86A:
   F86A CE F8 57      [ 3] 5889         ldx     #LF857
   F86D                    5890 LF86D:
   F86D A6 00         [ 4] 5891         ldaa    0,X
   F86F 81 FF         [ 2] 5892         cmpa    #0xFF
   F871 27 06         [ 3] 5893         beq     LF879
   F873 B7 18 0D      [ 4] 5894         staa    SCCCTRLA
   F876 08            [ 3] 5895         inx
   F877 20 F4         [ 3] 5896         bra     LF86D
                           5897 
                           5898 ; Setup normal SCI, 8 data bits, 1 stop bit
                           5899 ; Interrupts disabled, Transmitter and Receiver enabled
                           5900 ; prescaler = /13, SCR=/2, rate = 9600 baud at 16Mhz clock
                           5901 
   F879                    5902 LF879:
   F879 86 00         [ 2] 5903         ldaa    #0x00
   F87B B7 10 2C      [ 4] 5904         staa    SCCR1
   F87E 86 0C         [ 2] 5905         ldaa    #0x0C
   F880 B7 10 2D      [ 4] 5906         staa    SCCR2
   F883 86 31         [ 2] 5907         ldaa    #0x31
   F885 B7 10 2B      [ 4] 5908         staa    BAUD
                           5909 
                           5910 ; Initialize all RAM vectors to RTI: 
                           5911 ; Opcode 0x3b into vectors at 0x0100 through 0x0139
                           5912 
   F888 CE 01 00      [ 3] 5913         ldx     #0x0100
   F88B 86 3B         [ 2] 5914         ldaa    #0x3B           ; RTI opcode
   F88D                    5915 LF88D:
   F88D A7 00         [ 4] 5916         staa    0,X
   F88F 08            [ 3] 5917         inx
   F890 08            [ 3] 5918         inx
   F891 08            [ 3] 5919         inx
   F892 8C 01 3C      [ 4] 5920         cpx     #0x013C
   F895 25 F6         [ 3] 5921         bcs     LF88D
   F897 C6 F0         [ 2] 5922         ldab    #0xF0
   F899 F7 18 04      [ 4] 5923         stab    PIA0PRA         ; enable LCD backlight, disable RESET button light
   F89C 86 7E         [ 2] 5924         ldaa    #0x7E
   F89E 97 03         [ 3] 5925         staa    (0x0003)        ; Put a jump instruction here???
                           5926 
                           5927 ; Non-destructive ram test:
                           5928 ;
                           5929 ; HC11 Internal RAM: 0x0000-0x3ff
                           5930 ; External NVRAM:    0x2000-0x7fff
                           5931 ;
                           5932 ; Note:
                           5933 ; External NVRAM:    0x0400-0xfff is also available, but not tested
                           5934 
   F8A0 CE 00 00      [ 3] 5935         ldx     #0x0000
   F8A3                    5936 LF8A3:
   F8A3 E6 00         [ 4] 5937         ldab    0,X             ; save value
   F8A5 86 55         [ 2] 5938         ldaa    #0x55
   F8A7 A7 00         [ 4] 5939         staa    0,X
   F8A9 A1 00         [ 4] 5940         cmpa    0,X
   F8AB 26 19         [ 3] 5941         bne     LF8C6
   F8AD 49            [ 2] 5942         rola
   F8AE A7 00         [ 4] 5943         staa    0,X
   F8B0 A1 00         [ 4] 5944         cmpa    0,X
   F8B2 26 12         [ 3] 5945         bne     LF8C6
   F8B4 E7 00         [ 4] 5946         stab    0,X             ; restore value
   F8B6 08            [ 3] 5947         inx
   F8B7 8C 04 00      [ 4] 5948         cpx     #0x0400
   F8BA 26 03         [ 3] 5949         bne     LF8BF
   F8BC CE 20 00      [ 3] 5950         ldx     #0x2000
   F8BF                    5951 LF8BF:  
   F8BF 8C 80 00      [ 4] 5952         cpx     #0x8000
   F8C2 26 DF         [ 3] 5953         bne     LF8A3
   F8C4 20 04         [ 3] 5954         bra     LF8CA
                           5955 
   F8C6                    5956 LF8C6:
   F8C6 86 01         [ 2] 5957         ldaa    #0x01           ; Mark Failed RAM test
   F8C8 97 00         [ 3] 5958         staa    (0x0000)
                           5959 ; 
   F8CA                    5960 LF8CA:
   F8CA C6 01         [ 2] 5961         ldab    #0x01
   F8CC BD F9 95      [ 6] 5962         jsr     DIAGDGT         ; write digit 1 to diag display
   F8CF B6 10 35      [ 4] 5963         ldaa    BPROT  
   F8D2 26 0F         [ 3] 5964         bne     LF8E3           ; if something is protected, jump ahead
   F8D4 B6 30 00      [ 4] 5965         ldaa    (0x3000)        ; NVRAM
   F8D7 81 7E         [ 2] 5966         cmpa    #0x7E
   F8D9 26 08         [ 3] 5967         bne     LF8E3           ; if RAM(0x3000) == 0x7E, jump ahead anyway (special unlock?)
                           5968 
                           5969 ; error?
   F8DB C6 0E         [ 2] 5970         ldab    #0x0E
   F8DD BD F9 95      [ 6] 5971         jsr     DIAGDGT         ; write digit E to diag display
   F8E0 7E 30 00      [ 3] 5972         jmp     (0x3000)        ; jump to routine in NVRAM?
                           5973 
                           5974 ; checking for serial connection
                           5975 
   F8E3                    5976 LF8E3:
   F8E3 CE F0 00      [ 3] 5977         ldx     #0xF000         ; timeout counter
   F8E6                    5978 LF8E6:
   F8E6 01            [ 2] 5979         nop
   F8E7 01            [ 2] 5980         nop
   F8E8 09            [ 3] 5981         dex
   F8E9 27 0B         [ 3] 5982         beq     LF8F6           ; if time is up, jump ahead
   F8EB BD F9 45      [ 6] 5983         jsr     SERIALR         ; else read serial data if available
   F8EE 24 F6         [ 3] 5984         bcc     LF8E6           ; if no data available, loop
   F8F0 81 1B         [ 2] 5985         cmpa    #0x1B           ; if serial data was read, is it an ESC?
   F8F2 27 29         [ 3] 5986         beq     LF91D           ; if so, jump to echo hex char routine?
   F8F4 20 F0         [ 3] 5987         bra     LF8E6           ; else loop
   F8F6                    5988 LF8F6:
   F8F6 B6 80 00      [ 4] 5989         ldaa    L8000           ; check if this is a regular rom?
   F8F9 81 7E         [ 2] 5990         cmpa    #0x7E        
   F8FB 26 0B         [ 3] 5991         bne     MINIMON         ; if not, jump ahead
                           5992 
   F8FD C6 0A         [ 2] 5993         ldab    #0x0A
   F8FF BD F9 95      [ 6] 5994         jsr     DIAGDGT         ; else write digit A to diag display
                           5995 
   F902 BD 80 00      [ 6] 5996         jsr     L8000           ; jump to start of rom routine
   F905 0F            [ 2] 5997         sei                     ; if we ever come return, just loop and do it all again
   F906 20 EE         [ 3] 5998         bra     LF8F6
                           5999 
                           6000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6001 
   F908                    6002 MINIMON:
   F908 C6 10         [ 2] 6003         ldab    #0x10           ; not a regular rom
   F90A BD F9 95      [ 6] 6004         jsr     DIAGDGT         ; blank the diag display
                           6005 
   F90D BD F9 D8      [ 6] 6006         jsr     SERMSGW         ; enter the mini-monitor???
   F910 4D 49 4E 49 2D 4D  6007         .ascis  'MINI-MON'
        4F CE
                           6008 
   F918 C6 10         [ 2] 6009         ldab    #0x10
   F91A BD F9 95      [ 6] 6010         jsr     DIAGDGT         ; blank the diag display
                           6011 
   F91D                    6012 LF91D:
   F91D 7F 00 05      [ 6] 6013         clr     (0x0005)
   F920 7F 00 04      [ 6] 6014         clr     (0x0004)
   F923 7F 00 02      [ 6] 6015         clr     (0x0002)
   F926 7F 00 06      [ 6] 6016         clr     (0x0006)
                           6017 
   F929 BD F9 D8      [ 6] 6018         jsr     SERMSGW
   F92C 0D 0A BE           6019         .ascis  '\r\n>'
                           6020 
                           6021 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6022 
                           6023 ; convert A to 2 hex digits and transmit
   F92F                    6024 SERHEXW:
   F92F 36            [ 3] 6025         psha
   F930 44            [ 2] 6026         lsra
   F931 44            [ 2] 6027         lsra
   F932 44            [ 2] 6028         lsra
   F933 44            [ 2] 6029         lsra
   F934 BD F9 38      [ 6] 6030         jsr     LF938
   F937 32            [ 4] 6031         pula
   F938                    6032 LF938:
   F938 84 0F         [ 2] 6033         anda    #0x0F
   F93A 8A 30         [ 2] 6034         oraa    #0x30
   F93C 81 3A         [ 2] 6035         cmpa    #0x3A
   F93E 25 02         [ 3] 6036         bcs     LF942
   F940 8B 07         [ 2] 6037         adda    #0x07
   F942                    6038 LF942:
   F942 7E F9 6F      [ 3] 6039         jmp     SERIALW
                           6040 
                           6041 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6042 
                           6043 ; serial read non-blocking
   F945                    6044 SERIALR:
   F945 B6 10 2E      [ 4] 6045         ldaa    SCSR  
   F948 85 20         [ 2] 6046         bita    #0x20
   F94A 26 09         [ 3] 6047         bne     LF955
   F94C 0C            [ 2] 6048         clc
   F94D 39            [ 5] 6049         rts
                           6050 
                           6051 ; serial blocking read
   F94E                    6052 SERBLKR:
   F94E B6 10 2E      [ 4] 6053         ldaa    SCSR            ; read serial status
   F951 85 20         [ 2] 6054         bita    #0x20
   F953 27 F9         [ 3] 6055         beq     SERBLKR         ; if RDRF=0, loop
                           6056 
                           6057 ; read serial data, (assumes it's ready)
   F955                    6058 LF955:
   F955 B6 10 2E      [ 4] 6059         ldaa    SCSR            ; read serial status
   F958 85 02         [ 2] 6060         bita    #0x02
   F95A 26 09         [ 3] 6061         bne     LF965           ; if FE=1, clear it
   F95C 85 08         [ 2] 6062         bita    #0x08
   F95E 26 05         [ 3] 6063         bne     LF965           ; if OR=1, clear it
   F960 B6 10 2F      [ 4] 6064         ldaa    SCDR            ; otherwise, good data
   F963 0D            [ 2] 6065         sec
   F964 39            [ 5] 6066         rts
                           6067 
   F965                    6068 LF965:
   F965 B6 10 2F      [ 4] 6069         ldaa    SCDR            ; clear any error
   F968 86 2F         [ 2] 6070         ldaa    #0x2F           ; '/'   
   F96A BD F9 6F      [ 6] 6071         jsr     SERIALW
   F96D 20 DF         [ 3] 6072         bra     SERBLKR         ; go to wait for a character
                           6073 
                           6074 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6075 
                           6076 ; Send A to SCI with CR turned to CRLF
   F96F                    6077 SERIALW:
   F96F 81 0D         [ 2] 6078         cmpa    #0x0D           ; CR?
   F971 27 02         [ 3] 6079         beq     LF975           ; if so echo CR+LF
   F973 20 07         [ 3] 6080         bra     SERRAWW         ; else just echo it
   F975                    6081 LF975:
   F975 86 0D         [ 2] 6082         ldaa    #0x0D
   F977 BD F9 7C      [ 6] 6083         jsr     SERRAWW
   F97A 86 0A         [ 2] 6084         ldaa    #0x0A
                           6085 
                           6086 ; send a char to SCI
   F97C                    6087 SERRAWW:
   F97C F6 10 2E      [ 4] 6088         ldab    SCSR            ; wait for ready to send
   F97F C5 40         [ 2] 6089         bitb    #0x40
   F981 27 F9         [ 3] 6090         beq     SERRAWW
   F983 B7 10 2F      [ 4] 6091         staa    SCDR            ; send it
   F986 39            [ 5] 6092         rts
                           6093 
                           6094 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6095 
                           6096 ; Unused?
   F987                    6097 LF987:
   F987 BD F9 4E      [ 6] 6098         jsr     SERBLKR         ; get a serial char
   F98A 81 7A         [ 2] 6099         cmpa    #0x7A           ;'z'
   F98C 22 06         [ 3] 6100         bhi     LF994
   F98E 81 61         [ 2] 6101         cmpa    #0x61           ;'a'
   F990 25 02         [ 3] 6102         bcs     LF994
   F992 82 20         [ 2] 6103         sbca    #0x20           ;convert to upper case?
   F994                    6104 LF994:
   F994 39            [ 5] 6105         rts
                           6106 
                           6107 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6108 
                           6109 ; Write hex digit arg in B to diagnostic lights
                           6110 ; or B=0x10 or higher for blank
                           6111 
   F995                    6112 DIAGDGT:
   F995 36            [ 3] 6113         psha
   F996 C1 11         [ 2] 6114         cmpb    #0x11
   F998 25 02         [ 3] 6115         bcs     LF99C
   F99A C6 10         [ 2] 6116         ldab    #0x10
   F99C                    6117 LF99C:
   F99C CE F9 B4      [ 3] 6118         ldx     #LF9B4
   F99F 3A            [ 3] 6119         abx
   F9A0 A6 00         [ 4] 6120         ldaa    0,X
   F9A2 B7 18 06      [ 4] 6121         staa    PIA0PRB         ; write arg to local data bus
   F9A5 B6 18 04      [ 4] 6122         ldaa    PIA0PRA         ; read from Port A
   F9A8 8A 20         [ 2] 6123         oraa    #0x20           ; bit 5 high
   F9AA B7 18 04      [ 4] 6124         staa    PIA0PRA         ; write back to Port A
   F9AD 84 DF         [ 2] 6125         anda    #0xDF           ; bit 5 low
   F9AF B7 18 04      [ 4] 6126         staa    PIA0PRA         ; write back to Port A
   F9B2 32            [ 4] 6127         pula
   F9B3 39            [ 5] 6128         rts
                           6129 
                           6130 ; 7 segment patterns - XGFEDCBA
   F9B4                    6131 LF9B4:
   F9B4 C0                 6132         .byte   0xc0            ; 0
   F9B5 F9                 6133         .byte   0xf9            ; 1
   F9B6 A4                 6134         .byte   0xa4            ; 2
   F9B7 B0                 6135         .byte   0xb0            ; 3
   F9B8 99                 6136         .byte   0x99            ; 4
   F9B9 92                 6137         .byte   0x92            ; 5
   F9BA 82                 6138         .byte   0x82            ; 6
   F9BB F8                 6139         .byte   0xf8            ; 7
   F9BC 80                 6140         .byte   0x80            ; 8
   F9BD 90                 6141         .byte   0x90            ; 9
   F9BE 88                 6142         .byte   0x88            ; A 
   F9BF 83                 6143         .byte   0x83            ; b
   F9C0 C6                 6144         .byte   0xc6            ; C
   F9C1 A1                 6145         .byte   0xa1            ; d
   F9C2 86                 6146         .byte   0x86            ; E
   F9C3 8E                 6147         .byte   0x8e            ; F
   F9C4 FF                 6148         .byte   0xff            ; blank
                           6149 
                           6150 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6151 
                           6152 ; Write arg in B to Button Lights
   F9C5                    6153 BUTNLIT:
   F9C5 36            [ 3] 6154         psha
   F9C6 F7 18 06      [ 4] 6155         stab    PIA0PRB         ; write arg to local data bus
   F9C9 B6 18 04      [ 4] 6156         ldaa    PIA0PRA         ; read from Port A
   F9CC 84 EF         [ 2] 6157         anda    #0xEF           ; bit 4 low
   F9CE B7 18 04      [ 4] 6158         staa    PIA0PRA         ; write back to Port A
   F9D1 8A 10         [ 2] 6159         oraa    #0x10           ; bit 4 high
   F9D3 B7 18 04      [ 4] 6160         staa    PIA0PRA         ; write this to Port A
   F9D6 32            [ 4] 6161         pula
   F9D7 39            [ 5] 6162         rts
                           6163 
                           6164 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6165 
                           6166 ; Send rom message via SCI
   F9D8                    6167 SERMSGW:
   F9D8 18 38         [ 6] 6168         puly
   F9DA                    6169 LF9DA:
   F9DA 18 A6 00      [ 5] 6170         ldaa    0,Y
   F9DD 27 09         [ 3] 6171         beq     LF9E8           ; if zero terminated, return
   F9DF 2B 0C         [ 3] 6172         bmi     LF9ED           ; if high bit set..do last char and return
   F9E1 BD F9 7C      [ 6] 6173         jsr     SERRAWW         ; else send char
   F9E4 18 08         [ 4] 6174         iny
   F9E6 20 F2         [ 3] 6175         bra     LF9DA           ; and loop for next one
                           6176 
   F9E8                    6177 LF9E8:
   F9E8 18 08         [ 4] 6178         iny                     ; setup return address and return
   F9EA 18 3C         [ 5] 6179         pshy
   F9EC 39            [ 5] 6180         rts
                           6181 
   F9ED                    6182 LF9ED:
   F9ED 84 7F         [ 2] 6183         anda    #0x7F           ; remove top bit
   F9EF BD F9 7C      [ 6] 6184         jsr     SERRAWW         ; send char
   F9F2 20 F4         [ 3] 6185         bra     LF9E8           ; and we're done
   F9F4 39            [ 5] 6186         rts
                           6187 
   F9F5                    6188 DORTS:
   F9F5 39            [ 5] 6189         rts
   F9F6                    6190 DORTI:        
   F9F6 3B            [12] 6191         rti
                           6192 
                           6193 ; all 0xffs in this gap
                           6194 
   FFA0                    6195         .org    0xFFA0
                           6196 
   FFA0 7E F9 F5      [ 3] 6197         jmp     DORTS
   FFA3 7E F9 F5      [ 3] 6198         jmp     DORTS
   FFA6 7E F9 F5      [ 3] 6199         jmp     DORTS
   FFA9 7E F9 2F      [ 3] 6200         jmp     SERHEXW
   FFAC 7E F9 D8      [ 3] 6201         jmp     SERMSGW      
   FFAF 7E F9 45      [ 3] 6202         jmp     SERIALR     
   FFB2 7E F9 6F      [ 3] 6203         jmp     SERIALW      
   FFB5 7E F9 08      [ 3] 6204         jmp     MINIMON
   FFB8 7E F9 95      [ 3] 6205         jmp     DIAGDGT 
   FFBB 7E F9 C5      [ 3] 6206         jmp     BUTNLIT 
                           6207 
   FFBE FF                 6208        .byte    0xff
   FFBF FF                 6209        .byte    0xff
                           6210 
                           6211 ; Vectors
                           6212 
   FFC0 F9 F6              6213        .word   DORTI            ; Stub RTI
   FFC2 F9 F6              6214        .word   DORTI            ; Stub RTI
   FFC4 F9 F6              6215        .word   DORTI            ; Stub RTI
   FFC6 F9 F6              6216        .word   DORTI            ; Stub RTI
   FFC8 F9 F6              6217        .word   DORTI            ; Stub RTI
   FFCA F9 F6              6218        .word   DORTI            ; Stub RTI
   FFCC F9 F6              6219        .word   DORTI            ; Stub RTI
   FFCE F9 F6              6220        .word   DORTI            ; Stub RTI
   FFD0 F9 F6              6221        .word   DORTI            ; Stub RTI
   FFD2 F9 F6              6222        .word   DORTI            ; Stub RTI
   FFD4 F9 F6              6223        .word   DORTI            ; Stub RTI
                           6224 
   FFD6 01 00              6225         .word  0x0100           ; SCI
   FFD8 01 03              6226         .word  0x0103           ; SPI
   FFDA 01 06              6227         .word  0x0106           ; PA accum. input edge
   FFDC 01 09              6228         .word  0x0109           ; PA Overflow
                           6229 
   FFDE F9 F6              6230         .word  DORTI            ; Stub RTI
                           6231 
   FFE0 01 0C              6232         .word  0x010c           ; TI4O5
   FFE2 01 0F              6233         .word  0x010f           ; TOC4
   FFE4 01 12              6234         .word  0x0112           ; TOC3
   FFE6 01 15              6235         .word  0x0115           ; TOC2
   FFE8 01 18              6236         .word  0x0118           ; TOC1
   FFEA 01 1B              6237         .word  0x011b           ; TIC3
   FFEC 01 1E              6238         .word  0x011e           ; TIC2
   FFEE 01 21              6239         .word  0x0121           ; TIC1
   FFF0 01 24              6240         .word  0x0124           ; RTI
   FFF2 01 27              6241         .word  0x0127           ; ~IRQ
   FFF4 01 2A              6242         .word  0x012a           ; XIRQ
   FFF6 01 2D              6243         .word  0x012d           ; SWI
   FFF8 01 30              6244         .word  0x0130           ; ILLEGAL OPCODE
   FFFA 01 33              6245         .word  0x0133           ; COP Failure
   FFFC 01 36              6246         .word  0x0136           ; COP Clock Monitor Fail
                           6247 
   FFFE F8 00              6248         .word  RESET            ; Reset
                           6249 
