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
   805A CE AD 5A      [ 3]  137         ldx     #TASK2          ;
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
   8089 BD FA C9      [ 6]  156         jsr     DIAGDGT         ; blank the diag display
                            157 
   808C B6 18 04      [ 4]  158         ldaa    PIA0PRA         ; turn off reset button light
   808F 84 BF         [ 2]  159         anda    #0xBF
   8091 B7 18 04      [ 4]  160         staa    PIA0PRA 
   8094 86 FF         [ 2]  161         ldaa    #0xFF
   8096 97 AC         [ 3]  162         staa    (0x00AC)        ; diagnostic indicator (all off)
                            163 
   8098 BD 86 D4      [ 6]  164         jsr     L86C4           ; Reset boards 1-10
   809B BD 99 B6      [ 6]  165         jsr     L99A6           ; do some stuff with diag digit??
   809E BD 8C 4C      [ 6]  166         jsr     L8C3C           ; reset LCD?
   80A1 BD 87 F8      [ 6]  167         jsr     L87E8           ; SCC - init aux serial
   80A4 BD 87 CC      [ 6]  168         jsr     L87BC           ; SCC - init sync data
   80A7 BD 8C 8E      [ 6]  169         jsr     L8C7E           ; reset LCD buffer
   80AA BD 8D 39      [ 6]  170         jsr     L8D29           ; some LCD command? (0C?)
   80AD BD 8B D0      [ 6]  171         jsr     L8BC0           ; setup Timer/SWI handlers
   80B0 BD 8B FE      [ 6]  172         jsr     L8BEE           ; ??? redundant?
   80B3 0E            [ 2]  173         cli
   80B4 BD A2 9B      [ 6]  174         jsr     LA25E           ; compute and store copyright checksum
   80B7 B6 04 0F      [ 4]  175         ldaa    ERASEFLG
   80BA 81 01         [ 2]  176         cmpa    #0x01           ; 1 means erase EEPROM!
   80BC 26 03         [ 3]  177         bne     L80C1
   80BE 7E A2 B2      [ 3]  178         jmp     LA275           ; erase EEPROM: skipped if ERASEFLG !=1
   80C1                     179 L80C1:
   80C1 FC 04 0B      [ 5]  180         ldd     CPYRTCS         ; copyright checksum
   80C4 1A 83 19 7B   [ 5]  181         cpd     #CHKSUM         ; check against copyright checksum value
   80C8 26 4C         [ 3]  182         bne     LOCKUP          ; if fail, bye bye
   80CA 5F            [ 2]  183         clrb
   80CB D7 62         [ 3]  184         stab    (0x0062)        ; button light buffer?
   80CD BD FA F9      [ 6]  185         jsr     BUTNLIT         ; turn off all button lights
   80D0 BD A3 7E      [ 6]  186         jsr     LA341           ; fire 3 bits on board 2
   80D3 B6 04 00      [ 4]  187         ldaa    (0x0400)
   80D6 81 08         [ 2]  188         cmpa    #0x08
   80D8 27 3F         [ 3]  189         beq     L811C           ; if 8, go directly to CPU test
   80DA 25 29         [ 3]  190         bcs     L8105           ; higher than 8, go to init setup, retaining L/R counts
   80DC 81 07         [ 2]  191         cmpa    #0x07
   80DE 27 25         [ 3]  192         beq     L8105           ; 7, go to init setup, retaining L/R counts
   80E0 CC 00 00      [ 3]  193         ldd     #0x0000         ; 6 or lower...
   80E3 FD 04 0D      [ 5]  194         std     (0x040D)        ; clear 040D/040E counter
   80E6 CC 00 C8      [ 3]  195         ldd     #0x00C8         ; wait up to 2 seconds for a serial byte
   80E9 DD 1B         [ 4]  196         std     CDTIMR1 
   80EB                     197 L80EB:
   80EB DC 1B         [ 4]  198         ldd     CDTIMR1
   80ED 27 0B         [ 3]  199         beq     L80FA           ; timeout
   80EF BD FA 79      [ 6]  200         jsr     SERIALR
   80F2 24 F7         [ 3]  201         bcc     L80EB
   80F4 81 44         [ 2]  202         cmpa    #0x44           ; if it's a 'D', do init setup + reset L/R counts
   80F6 26 F3         [ 3]  203         bne     L80EB           ; else keep looping for 2 seconds
   80F8 20 05         [ 3]  204         bra     L80FF           ; go to init setup
   80FA                     205 L80FA:
   80FA BD 9F 5B      [ 6]  206         jsr     L9F1E
   80FD 25 17         [ 3]  207         bcs     LOCKUP          ; bye bye
                            208 ; init setup + reset L and R counts
   80FF                     209 L80FF:
   80FF BD 9E EC      [ 6]  210         jsr     L9EAF           ; reset L counts
   8102 BD 9E CF      [ 6]  211         jsr     L9E92           ; reset R counts
                            212 ; init setup
   8105                     213 L8105:
   8105 86 39         [ 2]  214         ldaa    #0x39
   8107 B7 04 08      [ 4]  215         staa    0x0408          ; set rts here for later CPU test
   810A BD A2 12      [ 6]  216         jsr     LA1D5           ; set 0400 to 7, reprogram EE sig if needed
   810D B6 F7 C0      [ 4]  217         ldaa    LF7C0           ; a 00
   8110 B7 04 5C      [ 4]  218         staa    0x045C          ; set to R12 mode?
   8113 7E F8 00      [ 3]  219         jmp     RESET           ; reset!
                            220 
   8116 7E 81 16      [ 3]  221 LOCKUP: jmp     LOCKUP          ; infinite loop
                            222 
                            223 ; CPU test?
   8119                     224 L811C:
   8119 7F 00 79      [ 6]  225         clr     (0x0079)
   811C 7F 00 7C      [ 6]  226         clr     (0x007C)
   811F BD 04 08      [ 6]  227         jsr     0x0408          ; rts should be here
   8122 BD 80 13      [ 6]  228         jsr     (0x8013)        ; rts is here '9'
   8125 C6 FD         [ 2]  229         ldab    #0xFD           ; tape deck STOP
   8127 BD 86 F7      [ 6]  230         jsr     L86E7
   812A C6 DF         [ 2]  231         ldab    #0xDF
   812C BD 87 58      [ 6]  232         jsr     L8748   
   812F BD 87 A1      [ 6]  233         jsr     L8791   
   8132 BD 9B 07      [ 6]  234         jsr     L9AF7
   8135 BD 9C 61      [ 6]  235         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   8138 7F 00 62      [ 6]  236         clr     (0x0062)
   813B BD 99 E9      [ 6]  237         jsr     L99D9
   813E 24 16         [ 3]  238         bcc     L8159           ; if carry clear, test is passed
                            239 
   8140 BD 8D F4      [ 6]  240         jsr     LCDMSG1 
   8143 49 6E 76 61 6C 69   241         .ascis  'Invalid CPU!'
        64 20 43 50 55 A1
                            242 
   814F 86 53         [ 2]  243         ldaa    #0x53
   8151 7E 82 AD      [ 3]  244         jmp     L82A4
   8154 20 FE         [ 3]  245 L8157:  bra     L8157           ; infinite loop
                            246 
   8156                     247 L8159:
   8156 BD A3 91      [ 6]  248         jsr     LA354
   8159 7F 00 AA      [ 6]  249         clr     (0x00AA)
   815C 7D 00 00      [ 6]  250         tst     (0x0000)
   815F 27 15         [ 3]  251         beq     L8179
                            252 
   8161 BD 8D F4      [ 6]  253         jsr     LCDMSG1 
   8164 52 41 4D 20 74 65   254         .ascis  'RAM test failed!'
        73 74 20 66 61 69
        6C 65 64 A1
                            255 
   8174 20 44         [ 3]  256         bra     L81BD
                            257 
   8176                     258 L8179:
   8176 BD 8D F4      [ 6]  259         jsr     LCDMSG1 
   8179 33 32 4B 20 52 41   260         .ascis  '32K RAM OK'
        4D 20 4F CB
                            261 
                            262 ; R12 or CNR mode???
   8183 7D 04 5C      [ 6]  263         tst     (0x045C)        ; if this location is 0, good
   8186 26 08         [ 3]  264         bne     L8193
   8188 CC 52 0F      [ 3]  265         ldd     #0x520F         ; else print 'R' on the far left of the first line
   818B BD 8D C5      [ 6]  266         jsr     L8DB5           ; display char here on LCD display
   818E 20 06         [ 3]  267         bra     L8199
   8190                     268 L8193:
   8190 CC 43 0F      [ 3]  269         ldd     #0x430F         ; print 'C' on the far left of the first line
   8193 BD 8D C5      [ 6]  270         jsr     L8DB5           ; display char here on LCD display
                            271 
   8196                     272 L8199:
   8196 BD 8D ED      [ 6]  273         jsr     LCDMSG2 
   8199 52 4F 4D 20 43 68   274         .ascis  'ROM Chksum='
        6B 73 75 6D BD
                            275 
   81A4 BD 97 6F      [ 6]  276         jsr     L975F           ; print the checksum on the LCD
                            277 
   81A7 C6 02         [ 2]  278         ldab    #0x02           ; delay 2 secs
   81A9 BD 8C 12      [ 6]  279         jsr     DLYSECS         ;
                            280 
   81AC BD 9A 37      [ 6]  281         jsr     L9A27           ; display Serial #
   81AF BD 9F 09      [ 6]  282         jsr     L9ECC           ; display R and L counts
   81B2 BD 9B 29      [ 6]  283         jsr     L9B19           ; do the random motions if enabled
                            284 
   81B5 C6 02         [ 2]  285         ldab    #0x02           ; delay 2 secs
   81B7 BD 8C 12      [ 6]  286         jsr     DLYSECS         ;
                            287 
   81BA                     288 L81BD:
   81BA F6 10 2D      [ 4]  289         ldab    SCCR2           ; disable SCI receive data interrupts
   81BD C4 DF         [ 2]  290         andb    #0xDF
   81BF F7 10 2D      [ 4]  291         stab    SCCR2
                            292 
   81C2 BD 9B 07      [ 6]  293         jsr     L9AF7           ; clear a bunch of ram
   81C5 C6 FD         [ 2]  294         ldab    #0xFD           ; tape deck STOP
   81C7 BD 86 F7      [ 6]  295         jsr     L86E7           ;
   81CA BD 87 A1      [ 6]  296         jsr     L8791           ; Reset AVSEL1
                            297 
   81CD C6 00         [ 2]  298         ldab    #0x00           ; turn off button lights
   81CF D7 62         [ 3]  299         stab    (0x0062)
   81D1 BD FA F9      [ 6]  300         jsr     BUTNLIT
                            301 
   81D4                     302 L81D7:
   81D4 BD 8D F4      [ 6]  303         jsr     LCDMSG1 
   81D7 20 43 79 62 65 72   304         .ascis  ' Cyberstar v1.7'
        73 74 61 72 20 76
        31 2E B7
                            305 
   81E6 BD A3 1C      [ 6]  306         jsr     LA2DF
   81E9 24 11         [ 3]  307         bcc     L81FF
   81EB CC 52 0F      [ 3]  308         ldd     #0x520F
   81EE BD 8D C5      [ 6]  309         jsr     L8DB5           ; display 'R' at far right of 1st line
   81F1 7D 04 2A      [ 6]  310         tst     (0x042A)
   81F4 27 06         [ 3]  311         beq     L81FF
   81F6 CC 4B 0F      [ 3]  312         ldd     #0x4B0F
   81F9 BD 8D C5      [ 6]  313         jsr     L8DB5           ; display 'K' at far right of 1st line
   81FC                     314 L81FF:
   81FC BD 8D 13      [ 6]  315         jsr     L8D03
   81FF FC 02 9C      [ 5]  316         ldd     (0x029C)
   8202 1A 83 00 01   [ 5]  317         cpd     #0x0001
   8206 26 15         [ 3]  318         bne     L8220
                            319 
   8208 BD 8D ED      [ 6]  320         jsr     LCDMSG2 
   820B 20 44 61 76 65 27   321         .ascis  " Dave's system  "
        73 20 73 79 73 74
        65 6D 20 A0
                            322 
   821B 20 47         [ 3]  323         bra     L8267
   821D                     324 L8220:
   821D 1A 83 03 E8   [ 5]  325         cpd     #0x03E8
   8221 2D 1B         [ 3]  326         blt     L8241
   8223 1A 83 04 4B   [ 5]  327         cpd     #0x044B
   8227 22 15         [ 3]  328         bhi     L8241
                            329 
   8229 BD 8D ED      [ 6]  330         jsr     LCDMSG2 
   822C 20 20 20 53 50 54   331         .ascis  '   SPT Studio   '
        20 53 74 75 64 69
        6F 20 20 A0
                            332 
   823C 20 26         [ 3]  333         bra L8267
                            334 
   823E                     335 L8241:
   823E CC 0E 0C      [ 3]  336         ldd     #0x0E0C
   8241 DD AD         [ 4]  337         std     (0x00AD)
   8243 FC 04 0D      [ 5]  338         ldd     (0x040D)
   8246 1A 83 02 58   [ 5]  339         cpd     #0x0258         ; 600?
   824A 22 05         [ 3]  340         bhi     L8254
   824C CC 0E 09      [ 3]  341         ldd     #0x0E09
   824F DD AD         [ 4]  342         std     (0x00AD)
   8251                     343 L8254:
   8251 C6 29         [ 2]  344         ldab    #0x29
   8253 CE 0E 00      [ 3]  345         ldx     #0x0E00
   8256                     346 L8259:
   8256 A6 00         [ 4]  347         ldaa    0,X
   8258 4A            [ 2]  348         deca
   8259 08            [ 3]  349         inx
   825A 5C            [ 2]  350         incb
   825B 3C            [ 4]  351         pshx
   825C BD 8D C5      [ 6]  352         jsr     L8DB5           ; display char here on LCD display
   825F 38            [ 5]  353         pulx
   8260 9C AD         [ 5]  354         cpx     (0x00AD)
   8262 26 F2         [ 3]  355         bne     L8259
   8264                     356 L8267:
   8264 BD 9C 61      [ 6]  357         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   8267 7F 00 5B      [ 6]  358         clr     (0x005B)
   826A 7F 00 5A      [ 6]  359         clr     (0x005A)
   826D 7F 00 5E      [ 6]  360         clr     (0x005E)
   8270 7F 00 60      [ 6]  361         clr     (0x0060)
   8273 BD 9B 29      [ 6]  362         jsr     L9B19           ; do the random motions if enabled
   8276 96 60         [ 3]  363         ldaa    (0x0060)
   8278 27 06         [ 3]  364         beq     L8283
   827A BD A9 B9      [ 6]  365         jsr     LA97C
   827D 7E F8 00      [ 3]  366         jmp     RESET           ; reset controller
                            367 
   8280                     368 L8283:
                            369 ;        ldaa    PIA0PRA 
                            370 ;        anda    #0x06
                            371 ;        bne     L8292           ; skip credits if up and down are pressed?
   8280 BD 9D 01      [ 6]  372         jsr     L9CF1           ; print credits
   8283 C6 32         [ 2]  373         ldab    #0x32
   8285 BD 8C 32      [ 6]  374         jsr     DLYSECSBY100    ; delay 0.5 sec
                            375 
   8288 BD 9D 28      [ 6]  376         jsr     0x9D28          ; NEW
   828B CC 01 2C      [ 3]  377         ldd     #0x012C         ; NEW
   828E DD 23         [ 4]  378         std     0x0023          ; NEW
   8290                     379 L8290:
   8290 BD 9B 29      [ 6]  380         jsr     0x9B29          ; NEW
   8293 DC 23         [ 4]  381         ldd     0x0023          ; NEW
   8295 1A 83 00 00   [ 5]  382         cpd     #0x0000         ; NEW
   8299 27 0A         [ 3]  383         beq     0x82A5          ; NEW
                            384 
   829B                     385 L8292:
   829B BD 8E A5      [ 6]  386         jsr     L8E95           ; Was ENTER pressed?
   829E 81 0D         [ 2]  387         cmpa    #0x0D
   82A0 26 EE         [ 3]  388         bne     L8290
   82A2 7E 92 A2      [ 3]  389         jmp     L9292           ; If so, go to diagnostics menu
   82A5                     390 L829C:
   82A5 BD FA 79      [ 6]  391         jsr     SERIALR
   82A8 25 03         [ 3]  392         bcs     L82A4
   82AA                     393 L82A1:
   82AA 7E 83 3C      [ 3]  394         jmp     L8333
                            395 
   82AD                     396 L82A4:
   82AD 81 44         [ 2]  397         cmpa    #0x44           ;'$'
   82AF 26 03         [ 3]  398         bne     L82AB
   82B1 7E A3 A3      [ 3]  399         jmp     LA366           ; go to security code & setup utility
   82B4                     400 L82AB:
   82B4 81 53         [ 2]  401         cmpa    #0x53           ;'S'
   82B6 26 F2         [ 3]  402         bne     L82A1
                            403 
   82B8 BD FB 0C      [ 6]  404         jsr     SERMSGW      
   82BB 0A 0D 45 6E 74 65   405         .ascis  '\n\rEnter security code: '
        72 20 73 65 63 75
        72 69 74 79 20 63
        6F 64 65 3A A0
                            406 
   82D2 0F            [ 2]  407         sei
   82D3 BD A3 27      [ 6]  408         jsr     LA2EA
   82D6 0E            [ 2]  409         cli
   82D7 25 61         [ 3]  410         bcs     L8331
                            411 
   82D9 BD FB 0C      [ 6]  412         jsr     SERMSGW      
   82DC 0A 0D 45 45 50 52   413         .ascii '\n\rEEPROM serial number programming enabled.'
        4F 4D 20 73 65 72
        69 61 6C 20 6E 75
        6D 62 65 72 20 70
        72 6F 67 72 61 6D
        6D 69 6E 67 20 65
        6E 61 62 6C 65 64
        2E
   8307 0A 0D 50 6C 65 61   414         .ascis '\n\rPlease RESET the processor to continue\n\r'
        73 65 20 52 45 53
        45 54 20 74 68 65
        20 70 72 6F 63 65
        73 73 6F 72 20 74
        6F 20 63 6F 6E 74
        69 6E 75 65 0A 8D
                            415 
   8331 86 01         [ 2]  416         ldaa    #0x01           ; enable EEPROM erase
   8333 B7 04 0F      [ 4]  417         staa    ERASEFLG
   8336 86 DB         [ 2]  418         ldaa    #0xDB
   8338 97 07         [ 3]  419         staa    (0x0007)
                            420 ; need to reset to get out of this 
   833A 20 FE         [ 3]  421 L8331:  bra     L8331           ; infinite loop
                            422 
   833C                     423 L8333:
   833C 96 AA         [ 3]  424         ldaa    (0x00AA)
   833E 27 12         [ 3]  425         beq     L8349
   8340 DC 1B         [ 4]  426         ldd     CDTIMR1
   8342 26 0E         [ 3]  427         bne     L8349
   8344 D6 62         [ 3]  428         ldab    (0x0062)
   8346 C8 20         [ 2]  429         eorb    #0x20
   8348 D7 62         [ 3]  430         stab    (0x0062)
   834A BD FA F9      [ 6]  431         jsr     BUTNLIT 
   834D CC 00 32      [ 3]  432         ldd     #0x0032
   8350 DD 1B         [ 4]  433         std     CDTIMR1
   8352                     434 L8349:
   8352 BD 86 B2      [ 6]  435         jsr     L86A4
   8355 24 03         [ 3]  436         bcc     L8351
   8357 7E 82 73      [ 3]  437         jmp     (0x8273)        ; NEW (CHECK)
   835A                     438 L8351:
   835A F6 10 2D      [ 4]  439         ldab    SCCR2  
   835D CA 20         [ 2]  440         orab    #0x20
   835F F7 10 2D      [ 4]  441         stab    SCCR2  
   8362 7F 00 AA      [ 6]  442         clr     (0x00AA)
   8365 D6 62         [ 3]  443         ldab    (0x0062)
   8367 C4 DF         [ 2]  444         andb    #0xDF
   8369 D7 62         [ 3]  445         stab    (0x0062)
   836B BD FA F9      [ 6]  446         jsr     BUTNLIT 
   836E C6 02         [ 2]  447         ldab    #0x02           ; delay 2 secs
   8370 BD 8C 12      [ 6]  448         jsr     DLYSECS         ;
   8373 96 7C         [ 3]  449         ldaa    (0x007C)
   8375 27 2D         [ 3]  450         beq     L839B
   8377 96 7F         [ 3]  451         ldaa    (0x007F)
   8379 97 4E         [ 3]  452         staa    (0x004E)
   837B D6 81         [ 3]  453         ldab    (0x0081)
   837D BD 87 58      [ 6]  454         jsr     L8748   
   8380 96 82         [ 3]  455         ldaa    (0x0082)
   8382 85 01         [ 2]  456         bita    #0x01
   8384 26 06         [ 3]  457         bne     L8383
   8386 96 AC         [ 3]  458         ldaa    (0x00AC)
   8388 84 FD         [ 2]  459         anda    #0xFD
   838A 20 04         [ 3]  460         bra     L8387
   838C                     461 L8383:
   838C 96 AC         [ 3]  462         ldaa    (0x00AC)
   838E 8A 02         [ 2]  463         oraa    #0x02
   8390                     464 L8387:
   8390 97 AC         [ 3]  465         staa    (0x00AC)
   8392 B7 18 06      [ 4]  466         staa    PIA0PRB 
   8395 B6 18 04      [ 4]  467         ldaa    PIA0PRA 
   8398 8A 20         [ 2]  468         oraa    #0x20
   839A B7 18 04      [ 4]  469         staa    PIA0PRA 
   839D 84 DF         [ 2]  470         anda    #0xDF
   839F B7 18 04      [ 4]  471         staa    PIA0PRA 
   83A2 20 14         [ 3]  472         bra     L83AF
   83A4                     473 L839B:
   83A4 FC 04 0D      [ 5]  474         ldd     (0x040D)
   83A7 1A 83 FD E8   [ 5]  475         cpd     #0xFDE8         ; 65000?
   83AB 22 06         [ 3]  476         bhi     L83AA
   83AD C3 00 01      [ 4]  477         addd    #0x0001
   83B0 FD 04 0D      [ 5]  478         std     (0x040D)
   83B3                     479 L83AA:
   83B3 C6 F7         [ 2]  480         ldab    #0xF7           ; tape deck REWIND
   83B5 BD 86 F7      [ 6]  481         jsr     L86E7
   83B8                     482 L83AF:
   83B8 7F 00 30      [ 6]  483         clr     (0x0030)
   83BB 7F 00 31      [ 6]  484         clr     (0x0031)
   83BE 7F 00 32      [ 6]  485         clr     (0x0032)
   83C1 BD 9B 29      [ 6]  486         jsr     L9B19           ; do the random motions if enabled   
   83C4 BD 86 B2      [ 6]  487         jsr     L86A4
   83C7 25 EF         [ 3]  488         bcs     L83AF
   83C9 96 79         [ 3]  489         ldaa    (0x0079)
   83CB 27 17         [ 3]  490         beq     L83DB
   83CD 7F 00 79      [ 6]  491         clr     (0x0079)
   83D0 96 B5         [ 3]  492         ldaa    (0x00B5)
   83D2 81 01         [ 2]  493         cmpa    #0x01
   83D4 26 07         [ 3]  494         bne     L83D4
   83D6 7F 00 B5      [ 6]  495         clr     (0x00B5)
   83D9 86 01         [ 2]  496         ldaa    #0x01
   83DB 97 7C         [ 3]  497         staa    (0x007C)
   83DD                     498 L83D4:
   83DD 86 01         [ 2]  499         ldaa    #0x01
   83DF 97 AA         [ 3]  500         staa    (0x00AA)
   83E1 7E 9A 8F      [ 3]  501         jmp     L9A7F
   83E4                     502 L83DB:
   83E4 BD 8D F4      [ 6]  503         jsr     LCDMSG1 
   83E7 20 20 20 44 56 44   504         .ascis  '   DVD  data    '
        20 20 64 61 74 61
        20 20 20 A0
                            505 
   83F7 D6 62         [ 3]  506         ldab    (0x0062)
   83F9 CA 80         [ 2]  507         orab    #0x80
   83FB D7 62         [ 3]  508         stab    (0x0062)
   83FD BD FA F9      [ 6]  509         jsr     BUTNLIT 
   8400 C6 FB         [ 2]  510         ldab    #0xFB           ; tape deck PLAY
   8402 BD 86 F7      [ 6]  511         jsr     L86E7
                            512 
   8405 BD 8D DF      [ 6]  513         jsr     LCDMSG1A
   8408 36 38 48 43 31 31   514         .ascis  '68HC11 Proto'
        20 50 72 6F 74 EF
                            515 
   8414 BD 8D E6      [ 6]  516         jsr     LCDMSG2A
   8417 64 62 F0            517         .ascis  'dbp'
                            518 
   841A C6 03         [ 2]  519         ldab    #0x03           ; delay 3 secs
   841C BD 8C 12      [ 6]  520         jsr     DLYSECS         ;
   841F 7D 00 7C      [ 6]  521         tst     (0x007C)
   8422 27 15         [ 3]  522         beq     L8430
   8424 D6 80         [ 3]  523         ldab    (0x0080)
   8426 D7 62         [ 3]  524         stab    (0x0062)
   8428 BD FA F9      [ 6]  525         jsr     BUTNLIT 
   842B D6 7D         [ 3]  526         ldab    (0x007D)
   842D D7 78         [ 3]  527         stab    (0x0078)
   842F D6 7E         [ 3]  528         ldab    (0x007E)
   8431 F7 10 8A      [ 4]  529         stab    (0x108A)
   8434 7F 00 7C      [ 6]  530         clr     (0x007C)
   8437 20 1D         [ 3]  531         bra     L844D
   8439                     532 L8430:
   8439 BD 8D 13      [ 6]  533         jsr     L8D03
   843C BD 9D 4F      [ 6]  534         jsr     L9D18
   843F 24 08         [ 3]  535         bcc     L8440
   8441 7D 00 B8      [ 6]  536         tst     (0x00B8)
   8444 27 F3         [ 3]  537         beq     L8430
   8446 7E 9A 70      [ 3]  538         jmp     L9A60
   8449                     539 L8440:
   8449 7D 00 B8      [ 6]  540         tst     (0x00B8)
   844C 27 EB         [ 3]  541         beq     L8430
   844E 7F 00 30      [ 6]  542         clr     (0x0030)
   8451 7F 00 31      [ 6]  543         clr     (0x0031)
   8454 20 00         [ 3]  544         bra     L844D
   8456                     545 L844D:
   8456 96 49         [ 3]  546         ldaa    (0x0049)
   8458 26 03         [ 3]  547         bne     L8454
   845A 7E 85 AD      [ 3]  548         jmp     L85A4
   845D                     549 L8454:
   845D 7F 00 49      [ 6]  550         clr     (0x0049)
   8460 81 31         [ 2]  551         cmpa    #0x31
   8462 26 08         [ 3]  552         bne     L8463
   8464 BD A3 63      [ 6]  553         jsr     LA326
   8467 BD 8D 52      [ 6]  554         jsr     L8D42
   846A 20 EA         [ 3]  555         bra     L844D
   846C                     556 L8463:
   846C 81 32         [ 2]  557         cmpa    #0x32
   846E 26 08         [ 3]  558         bne     L846F
   8470 BD A3 63      [ 6]  559         jsr     LA326
   8473 BD 8D 45      [ 6]  560         jsr     L8D35
   8476 20 DE         [ 3]  561         bra     L844D
   8478                     562 L846F:
   8478 81 54         [ 2]  563         cmpa    #0x54
   847A 26 08         [ 3]  564         bne     L847B
   847C BD A3 63      [ 6]  565         jsr     LA326
   847F BD 8D 52      [ 6]  566         jsr     L8D42
   8482 20 D2         [ 3]  567         bra     L844D
   8484                     568 L847B:
   8484 81 5A         [ 2]  569         cmpa    #0x5A
   8486 26 1C         [ 3]  570         bne     L849B
   8488                     571 L847F:
   8488 BD A3 5B      [ 6]  572         jsr     LA31E
   848B BD 8E A5      [ 6]  573         jsr     L8E95
   848E 7F 00 32      [ 6]  574         clr     (0x0032)
   8491 7F 00 31      [ 6]  575         clr     (0x0031)
   8494 7F 00 30      [ 6]  576         clr     (0x0030)
   8497 BD 99 B6      [ 6]  577         jsr     L99A6
   849A D6 7B         [ 3]  578         ldab    (0x007B)
   849C CA 0C         [ 2]  579         orab    #0x0C
   849E BD 87 58      [ 6]  580         jsr     L8748   
   84A1 7E 81 BA      [ 3]  581         jmp     L81BD
   84A4                     582 L849B:
   84A4 81 42         [ 2]  583         cmpa    #0x42
   84A6 26 03         [ 3]  584         bne     L84A2
   84A8 7E 98 4C      [ 3]  585         jmp     L983C
   84AB                     586 L84A2:
   84AB 81 4D         [ 2]  587         cmpa    #0x4D
   84AD 26 03         [ 3]  588         bne     L84A9
   84AF 7E 98 34      [ 3]  589         jmp     L9824
   84B2                     590 L84A9:
   84B2 81 45         [ 2]  591         cmpa    #0x45
   84B4 26 03         [ 3]  592         bne     L84B0
   84B6 7E 98 12      [ 3]  593         jmp     L9802
   84B9                     594 L84B0:
   84B9 81 58         [ 2]  595         cmpa    #0x58
   84BB 26 05         [ 3]  596         bne     L84B9
   84BD 7E 99 4F      [ 3]  597         jmp     L993F
   84C0 20 94         [ 3]  598         bra     L844D
   84C2                     599 L84B9:
   84C2 81 46         [ 2]  600         cmpa    #0x46
   84C4 26 03         [ 3]  601         bne     L84C0
   84C6 7E 99 81      [ 3]  602         jmp     L9971
   84C9                     603 L84C0:
   84C9 81 47         [ 2]  604         cmpa    #0x47
   84CB 26 03         [ 3]  605         bne     L84C7
   84CD 7E 99 8B      [ 3]  606         jmp     L997B
   84D0                     607 L84C7:
   84D0 81 48         [ 2]  608         cmpa    #0x48
   84D2 26 03         [ 3]  609         bne     L84CE
   84D4 7E 99 95      [ 3]  610         jmp     L9985
   84D7                     611 L84CE:
   84D7 81 49         [ 2]  612         cmpa    #0x49
   84D9 26 03         [ 3]  613         bne     L84D5
   84DB 7E 99 9F      [ 3]  614         jmp     L998F
   84DE                     615 L84D5:
   84DE 81 53         [ 2]  616         cmpa    #0x53
   84E0 26 03         [ 3]  617         bne     L84DC
   84E2 7E 97 CA      [ 3]  618         jmp     L97BA
   84E5                     619 L84DC:
   84E5 81 59         [ 2]  620         cmpa    #0x59
   84E7 26 03         [ 3]  621         bne     L84E3
   84E9 7E 99 E2      [ 3]  622         jmp     L99D2
   84EC                     623 L84E3:
   84EC 81 57         [ 2]  624         cmpa    #0x57
   84EE 26 03         [ 3]  625         bne     L84EA
   84F0 7E 9A B4      [ 3]  626         jmp     L9AA4
   84F3                     627 L84EA:
   84F3 81 41         [ 2]  628         cmpa    #0x41
   84F5 26 17         [ 3]  629         bne     L8505
   84F7 BD 9D 4F      [ 6]  630         jsr     L9D18
   84FA 25 09         [ 3]  631         bcs     L84FC
   84FC 7F 00 30      [ 6]  632         clr     (0x0030)
   84FF 7F 00 31      [ 6]  633         clr     (0x0031)
   8502 7E 85 AD      [ 3]  634         jmp     L85A4
   8505                     635 L84FC:
   8505 7F 00 30      [ 6]  636         clr     (0x0030)
   8508 7F 00 31      [ 6]  637         clr     (0x0031)
   850B 7E 9A 8F      [ 3]  638         jmp     L9A7F
   850E                     639 L8505:
   850E 81 4B         [ 2]  640         cmpa    #0x4B
   8510 26 0B         [ 3]  641         bne     L8514
   8512 BD 9D 4F      [ 6]  642         jsr     L9D18
   8515 25 03         [ 3]  643         bcs     L8511
   8517 7E 85 AD      [ 3]  644         jmp     L85A4
   851A                     645 L8511:
   851A 7E 9A 8F      [ 3]  646         jmp     L9A7F
   851D                     647 L8514:
   851D 81 4A         [ 2]  648         cmpa    #0x4A
   851F 26 07         [ 3]  649         bne     L851F
   8521 86 01         [ 2]  650         ldaa    #0x01
   8523 97 AF         [ 3]  651         staa    (0x00AF)
   8525 7E 98 4C      [ 3]  652         jmp     L983C
   8528                     653 L851F:
   8528 81 4E         [ 2]  654         cmpa    #0x4E
   852A 26 0B         [ 3]  655         bne     L852E
   852C B6 10 8A      [ 4]  656         ldaa    (0x108A)
   852F 8A 02         [ 2]  657         oraa    #0x02
   8531 B7 10 8A      [ 4]  658         staa    (0x108A)
   8534 7E 84 56      [ 3]  659         jmp     L844D
   8537                     660 L852E:
   8537 81 4F         [ 2]  661         cmpa    #0x4F
   8539 26 06         [ 3]  662         bne     L8538
   853B BD 9D 4F      [ 6]  663         jsr     L9D18
   853E 7E 84 56      [ 3]  664         jmp     L844D
   8541                     665 L8538:
   8541 81 50         [ 2]  666         cmpa    #0x50
   8543 26 06         [ 3]  667         bne     L8542
   8545 BD 9D 4F      [ 6]  668         jsr     L9D18
   8548 7E 84 56      [ 3]  669         jmp     L844D
   854B                     670 L8542:
   854B 81 51         [ 2]  671         cmpa    #0x51
   854D 26 0B         [ 3]  672         bne     L8551
   854F B6 10 8A      [ 4]  673         ldaa    (0x108A)
   8552 8A 04         [ 2]  674         oraa    #0x04
   8554 B7 10 8A      [ 4]  675         staa    (0x108A)
   8557 7E 84 56      [ 3]  676         jmp     L844D
   855A                     677 L8551:
   855A 81 55         [ 2]  678         cmpa    #0x55
   855C 26 07         [ 3]  679         bne     L855C
   855E C6 01         [ 2]  680         ldab    #0x01
   8560 D7 B6         [ 3]  681         stab    (0x00B6)
   8562 7E 84 56      [ 3]  682         jmp     L844D
   8565                     683 L855C:
   8565 81 4C         [ 2]  684         cmpa    #0x4C
   8567 26 19         [ 3]  685         bne     L8579
   8569 7F 00 49      [ 6]  686         clr     (0x0049)
   856C BD 9D 4F      [ 6]  687         jsr     L9D18
   856F 25 0E         [ 3]  688         bcs     L8576
   8571 BD AB 25      [ 6]  689         jsr     LAAE8
   8574 BD AB 93      [ 6]  690         jsr     LAB56
   8577 24 06         [ 3]  691         bcc     L8576
   8579 BD AB 62      [ 6]  692         jsr     LAB25
   857C BD AB 83      [ 6]  693         jsr     LAB46
   857F                     694 L8576:
   857F 7E 84 56      [ 3]  695         jmp     L844D
   8582                     696 L8579:
   8582 81 52         [ 2]  697         cmpa    #0x52
   8584 26 1A         [ 3]  698         bne     L8597
   8586 7F 00 49      [ 6]  699         clr     (0x0049)
   8589 BD 9D 4F      [ 6]  700         jsr     L9D18
   858C 25 0F         [ 3]  701         bcs     L8594
   858E BD AB 25      [ 6]  702         jsr     LAAE8
   8591 BD AB 93      [ 6]  703         jsr     LAB56
   8594 25 07         [ 3]  704         bcs     L8594
   8596 86 FF         [ 2]  705         ldaa    #0xFF
   8598 A7 00         [ 4]  706         staa    0,X
   859A BD AB 25      [ 6]  707         jsr     LAAE8
   859D                     708 L8594:
   859D 7E 84 56      [ 3]  709         jmp     L844D
   85A0                     710 L8597:
   85A0 81 44         [ 2]  711         cmpa    #0x44
   85A2 26 09         [ 3]  712         bne     L85A4
   85A4 7F 00 49      [ 6]  713         clr     (0x0049)
   85A7 BD AB EB      [ 6]  714         jsr     LABAE
   85AA 7E 84 56      [ 3]  715         jmp     L844D
   85AD                     716 L85A4:
   85AD 7D 00 75      [ 6]  717         tst     (0x0075)
   85B0 26 56         [ 3]  718         bne     L85FF
   85B2 7D 00 79      [ 6]  719         tst     (0x0079)
   85B5 26 51         [ 3]  720         bne     L85FF
   85B7 7D 00 30      [ 6]  721         tst     (0x0030)
   85BA 26 07         [ 3]  722         bne     L85BA
   85BC 96 5B         [ 3]  723         ldaa    (0x005B)
   85BE 27 48         [ 3]  724         beq     L85FF
   85C0 7F 00 5B      [ 6]  725         clr     (0x005B)
   85C3                     726 L85BA:
   85C3 CC 00 64      [ 3]  727         ldd     #0x0064
   85C6 DD 23         [ 4]  728         std     CDTIMR5
   85C8                     729 L85BF:
   85C8 DC 23         [ 4]  730         ldd     CDTIMR5
   85CA 27 14         [ 3]  731         beq     L85D7
   85CC BD 9B 29      [ 6]  732         jsr     L9B19           ; do the random motions if enabled
   85CF B6 18 04      [ 4]  733         ldaa    PIA0PRA 
   85D2 88 FF         [ 2]  734         eora    #0xFF
   85D4 84 06         [ 2]  735         anda    #0x06
   85D6 81 06         [ 2]  736         cmpa    #0x06
   85D8 26 EE         [ 3]  737         bne     L85BF
   85DA 7F 00 30      [ 6]  738         clr     (0x0030)
   85DD 7E 86 89      [ 3]  739         jmp     L8680
   85E0                     740 L85D7:
   85E0 7F 00 30      [ 6]  741         clr     (0x0030)
   85E3 D6 62         [ 3]  742         ldab    (0x0062)
   85E5 C8 02         [ 2]  743         eorb    #0x02
   85E7 D7 62         [ 3]  744         stab    (0x0062)
   85E9 BD FA F9      [ 6]  745         jsr     BUTNLIT 
   85EC C4 02         [ 2]  746         andb    #0x02
   85EE 27 0D         [ 3]  747         beq     L85F4
   85F0 BD AA 55      [ 6]  748         jsr     LAA18
   85F3 C6 1E         [ 2]  749         ldab    #0x1E
   85F5 BD 8C 32      [ 6]  750         jsr     DLYSECSBY100    ; delay 0.3 sec
   85F8 7F 00 30      [ 6]  751         clr     (0x0030)
   85FB 20 0B         [ 3]  752         bra     L85FF
   85FD                     753 L85F4:
   85FD BD AA 5A      [ 6]  754         jsr     LAA1D
   8600 C6 1E         [ 2]  755         ldab    #0x1E
   8602 BD 8C 32      [ 6]  756         jsr     DLYSECSBY100    ; delay 0.3 sec
   8605 7F 00 30      [ 6]  757         clr     (0x0030)
   8608                     758 L85FF:
   8608 BD 9B 29      [ 6]  759         jsr     L9B19           ; do the random motions if enabled
   860B B6 10 0A      [ 4]  760         ldaa    PORTE
   860E 84 10         [ 2]  761         anda    #0x10
   8610 27 0B         [ 3]  762         beq     L8614
   8612 B6 18 04      [ 4]  763         ldaa    PIA0PRA 
   8615 88 FF         [ 2]  764         eora    #0xFF
   8617 84 07         [ 2]  765         anda    #0x07
   8619 81 06         [ 2]  766         cmpa    #0x06
   861B 26 1C         [ 3]  767         bne     L8630
   861D                     768 L8614:
   861D 7D 00 76      [ 6]  769         tst     (0x0076)
   8620 26 17         [ 3]  770         bne     L8630
   8622 7D 00 75      [ 6]  771         tst     (0x0075)
   8625 26 12         [ 3]  772         bne     L8630
   8627 D6 62         [ 3]  773         ldab    (0x0062)
   8629 C4 FC         [ 2]  774         andb    #0xFC
   862B D7 62         [ 3]  775         stab    (0x0062)
   862D BD FA F9      [ 6]  776         jsr     BUTNLIT 
   8630 BD AA 50      [ 6]  777         jsr     LAA13
   8633 BD AA 5A      [ 6]  778         jsr     LAA1D
   8636 7E 9A 70      [ 3]  779         jmp     L9A60
   8639                     780 L8630:
   8639 7D 00 31      [ 6]  781         tst     (0x0031)
   863C 26 07         [ 3]  782         bne     L863C
   863E 96 5A         [ 3]  783         ldaa    (0x005A)
   8640 27 47         [ 3]  784         beq     L8680
   8642 7F 00 5A      [ 6]  785         clr     (0x005A)
   8645                     786 L863C:
   8645 CC 00 64      [ 3]  787         ldd     #0x0064
   8648 DD 23         [ 4]  788         std     CDTIMR5
   864A                     789 L8641:
   864A DC 23         [ 4]  790         ldd     CDTIMR5
   864C 27 13         [ 3]  791         beq     L8658
   864E BD 9B 29      [ 6]  792         jsr     L9B19           ; do the random motions if enabled
   8651 B6 18 04      [ 4]  793         ldaa    PIA0PRA 
   8654 88 FF         [ 2]  794         eora    #0xFF
   8656 84 06         [ 2]  795         anda    #0x06
   8658 81 06         [ 2]  796         cmpa    #0x06
   865A 26 EE         [ 3]  797         bne     L8641
   865C 7F 00 31      [ 6]  798         clr     (0x0031)
   865F 20 28         [ 3]  799         bra     L8680
   8661                     800 L8658:
   8661 7F 00 31      [ 6]  801         clr     (0x0031)
   8664 D6 62         [ 3]  802         ldab    (0x0062)
   8666 C8 01         [ 2]  803         eorb    #0x01
   8668 D7 62         [ 3]  804         stab    (0x0062)
   866A BD FA F9      [ 6]  805         jsr     BUTNLIT 
   866D C4 01         [ 2]  806         andb    #0x01
   866F 27 0D         [ 3]  807         beq     L8675
   8671 BD AA 49      [ 6]  808         jsr     LAA0C
   8674 C6 1E         [ 2]  809         ldab    #0x1E
   8676 BD 8C 32      [ 6]  810         jsr     DLYSECSBY100    ; delay 0.3 sec
   8679 7F 00 31      [ 6]  811         clr     (0x0031)
   867C 20 0B         [ 3]  812         bra     L8680
   867E                     813 L8675:
   867E BD AA 50      [ 6]  814         jsr     LAA13
   8681 C6 1E         [ 2]  815         ldab    #0x1E
   8683 BD 8C 32      [ 6]  816         jsr     DLYSECSBY100    ; delay 0.3 sec
   8686 7F 00 31      [ 6]  817         clr     (0x0031)
   8689                     818 L8680:
   8689 20 24         [ 3]  819         bra     0x86AF          ; NEW
   868B BD 86 B2      [ 6]  820         jsr     L86A4
   868E 25 1F         [ 3]  821         bcs     0x86AF          ; NEW
   8690 7E 86 AF      [ 3]  822         jmp     0x86AF          ; NEW
   8693 7F 00 4E      [ 6]  823         clr     (0x004E)
   8696 BD 99 B6      [ 6]  824         jsr     L99A6
   8699 BD 86 D4      [ 6]  825         jsr     L86C4           ; Reset boards 1-10
   869C 5F            [ 2]  826         clrb
   869D D7 62         [ 3]  827         stab    (0x0062)
   869F BD FA F9      [ 6]  828         jsr     BUTNLIT 
   86A2 C6 FD         [ 2]  829         ldab    #0xFD           ; tape deck STOP
   86A4 BD 86 F7      [ 6]  830         jsr     L86E7
   86A7 C6 04         [ 2]  831         ldab    #0x04           ; delay 4 secs
   86A9 BD 8C 12      [ 6]  832         jsr     DLYSECS         ;
   86AC 7E 84 88      [ 3]  833         jmp     L847F
   86AF                     834 L86A1:
   86AF 7E 84 56      [ 3]  835         jmp     L844D
                            836 
   86B2                     837 L86A4:
   86B2 BD 9B 29      [ 6]  838         jsr     L9B19           ; do the random motions if enabled
   86B5 7F 00 23      [ 6]  839         clr     CDTIMR5
   86B8 86 19         [ 2]  840         ldaa    #0x19
   86BA 97 24         [ 3]  841         staa    CDTIMR5+1
   86BC 0C            [ 2]  842         clc
   86BD 39            [ 5]  843         rts
   86BE                     844 L86BE:                          ; NEW
   86BE B6 10 0A      [ 4]  845         ldaa    PORTE
   86C1 84 80         [ 2]  846         anda    #0x80
   86C3 27 02         [ 3]  847         beq     L86B7
   86C5                     848 L86B5:
   86C5 0D            [ 2]  849         sec
   86C6 39            [ 5]  850         rts
                            851 
   86C7                     852 L86B7:
   86C7 B6 10 0A      [ 4]  853         ldaa    PORTE
   86CA 84 80         [ 2]  854         anda    #0x80
   86CC 26 F7         [ 3]  855         bne     L86B5
   86CE 96 24         [ 3]  856         ldaa    CDTIMR5+1
   86D0 26 F5         [ 3]  857         bne     L86B7
   86D2 0C            [ 2]  858         clc
   86D3 39            [ 5]  859         rts
                            860 
                            861 ; Reset boards 1-10 at:
                            862 ;         0x1080, 0x1084, 0x1088, 0x108c
                            863 ;         0x1090, 0x1094, 0x1098, 0x109c
                            864 ;         0x10a0, 0x10a4
                            865 
   86D4                     866 L86C4:
   86D4 CE 10 80      [ 3]  867         ldx     #0x1080
   86D7                     868 L86C7:
   86D7 86 30         [ 2]  869         ldaa    #0x30
   86D9 A7 01         [ 4]  870         staa    1,X             ; 0x30 -> PIAxCRA, CA2 low, DDR
   86DB A7 03         [ 4]  871         staa    3,X             ; 0x30 -> PIAxCRB, CB2 low, DDR
   86DD 86 FF         [ 2]  872         ldaa    #0xFF
   86DF A7 00         [ 4]  873         staa    0,X             ; 0xFF -> PIAxDDRA, all outputs
   86E1 A7 02         [ 4]  874         staa    2,X             ; 0xFF -> PIAxDDRB, all outputs
   86E3 86 34         [ 2]  875         ldaa    #0x34
   86E5 A7 01         [ 4]  876         staa    1,X             ; 0x34 -> PIAxCRA, CA2 low, PR
   86E7 A7 03         [ 4]  877         staa    3,X             ; 0x34 -> PIAxCRB, CA2 low, PR
   86E9 6F 00         [ 6]  878         clr     0,X             ; 0x00 -> PIAxPRA, all outputs low
   86EB 6F 02         [ 6]  879         clr     2,X             ; 0x00 -> PIAxPRB, all outputs low
   86ED 08            [ 3]  880         inx
   86EE 08            [ 3]  881         inx
   86EF 08            [ 3]  882         inx
   86F0 08            [ 3]  883         inx
   86F1 8C 10 A4      [ 4]  884         cpx     #0x10A4
   86F4 2F E1         [ 3]  885         ble     L86C7
   86F6 39            [ 5]  886         rts
                            887 
                            888 ; Set the tape deck to STOP, PLAY, REWIND, or EJECT
                            889 ;                B =   0xFD, 0xFB,   0xF7, or  0xEF
   86F7                     890 L86E7:
   86F7 36            [ 3]  891         psha
   86F8 BD 9B 29      [ 6]  892         jsr     L9B19           ; do the random motions if enabled
   86FB 96 AC         [ 3]  893         ldaa    (0x00AC)        ; A = diag buffer?
   86FD C1 FB         [ 2]  894         cmpb    #0xFB           ; if bit 2 of B is 0 (PLAY)
   86FF 26 04         [ 3]  895         bne     L86F5
   8701 84 FE         [ 2]  896         anda    #0xFE           ; clear A bit 0 (top)
   8703 20 0E         [ 3]  897         bra     L8703
   8705                     898 L86F5:
   8705 C1 F7         [ 2]  899         cmpb    #0xF7           ; if bit 3 of B is 0 (REWIND)
   8707 26 04         [ 3]  900         bne     L86FD
   8709 84 BF         [ 2]  901         anda    #0xBF           ; clear A bit 6 (middle)
   870B 20 06         [ 3]  902         bra     L8703
   870D                     903 L86FD:
   870D C1 FD         [ 2]  904         cmpb    #0xFD           ; if bit 1 of B is 0 (STOP)
   870F 26 02         [ 3]  905         bne     L8703
   8711 84 F7         [ 2]  906         anda    #0xF7           ; clear A bit 3 (bottom)
   8713                     907 L8703:
   8713 97 AC         [ 3]  908         staa    (0x00AC)        ; update diag display buffer
   8715 B7 18 06      [ 4]  909         staa    PIA0PRB         ; init bus based on A
   8718 BD 87 4A      [ 6]  910         jsr     L873A           ; clock diagnostic indicator
   871B 96 7A         [ 3]  911         ldaa    (0x007A)        ; buffer for tape deck / av switcher?
   871D 84 01         [ 2]  912         anda    #0x01           ; preserve a/v switcher bit
   871F 97 7A         [ 3]  913         staa    (0x007A)        ; 
   8721 C4 FE         [ 2]  914         andb    #0xFE           ; set bits 7-1 based on B arg
   8723 DA 7A         [ 3]  915         orab    (0x007A)        
   8725 F7 18 06      [ 4]  916         stab    PIA0PRB         ; put that on the bus
   8728 BD 87 85      [ 6]  917         jsr     L8775           ; clock the tape deck
   872B C6 32         [ 2]  918         ldab    #0x32
   872D BD 8C 32      [ 6]  919         jsr     DLYSECSBY100    ; delay 0.5 sec
   8730 C6 FE         [ 2]  920         ldab    #0xFE
   8732 DA 7A         [ 3]  921         orab    (0x007A)        ; all tape bits off
   8734 F7 18 06      [ 4]  922         stab    PIA0PRB         ; unpress tape buttons
   8737 D7 7A         [ 3]  923         stab    (0x007A)
   8739 BD 87 85      [ 6]  924         jsr     L8775           ; clock the tape deck
   873C 96 AC         [ 3]  925         ldaa    (0x00AC)
   873E 8A 49         [ 2]  926         oraa    #0x49           ; reset bits top,mid,bot
   8740 97 AC         [ 3]  927         staa    (0x00AC)
   8742 B7 18 06      [ 4]  928         staa    PIA0PRB 
   8745 BD 87 4A      [ 6]  929         jsr     L873A           ; clock diagnostic indicator
   8748 32            [ 4]  930         pula
   8749 39            [ 5]  931         rts
                            932 
                            933 ; clock diagnostic indicator
   874A                     934 L873A:
   874A B6 18 04      [ 4]  935         ldaa    PIA0PRA 
   874D 8A 20         [ 2]  936         oraa    #0x20
   874F B7 18 04      [ 4]  937         staa    PIA0PRA 
   8752 84 DF         [ 2]  938         anda    #0xDF
   8754 B7 18 04      [ 4]  939         staa    PIA0PRA 
   8757 39            [ 5]  940         rts
                            941 
   8758                     942 L8748:
   8758 36            [ 3]  943         psha
   8759 37            [ 3]  944         pshb
   875A 96 AC         [ 3]  945         ldaa    (0x00AC)        ; update state machine at AC?
                            946                                 ;      gfedcba
   875C 8A 30         [ 2]  947         oraa    #0x30           ; set bb11bbbb
   875E 84 FD         [ 2]  948         anda    #0xFD           ; clr bb11bb0b
   8760 C5 20         [ 2]  949         bitb    #0x20           ; tst bit 5 (f)
   8762 26 02         [ 3]  950         bne     L8756           ; 
   8764 8A 02         [ 2]  951         oraa    #0x02           ; set bit 1 (b)
   8766                     952 L8756:
   8766 C5 04         [ 2]  953         bitb    #0x04           ; tst bit 2 (c)
   8768 26 02         [ 3]  954         bne     L875C
   876A 84 EF         [ 2]  955         anda    #0xEF           ; clr bit 4 (e)
   876C                     956 L875C:
   876C C5 08         [ 2]  957         bitb    #0x08           ; tst bit 3 (d)
   876E 26 02         [ 3]  958         bne     L8762
   8770 84 DF         [ 2]  959         anda    #0xDF           ; clr bit 5 (f)
   8772                     960 L8762:
   8772 B7 18 06      [ 4]  961         staa    PIA0PRB 
   8775 97 AC         [ 3]  962         staa    (0x00AC)
   8777 BD 87 4A      [ 6]  963         jsr     L873A           ; clock diagnostic indicator
   877A 33            [ 4]  964         pulb
   877B F7 18 06      [ 4]  965         stab    PIA0PRB 
   877E D7 7B         [ 3]  966         stab    (0x007B)
   8780 BD 87 93      [ 6]  967         jsr     L8783
   8783 32            [ 4]  968         pula
   8784 39            [ 5]  969         rts
                            970 
                            971 ; High pulse on CB2, clock bits0-4 - 4 tape deck and 1 A/V switcher bit
   8785                     972 L8775:
   8785 B6 18 07      [ 4]  973         ldaa    PIA0CRB 
   8788 8A 38         [ 2]  974         oraa    #0x38           
   878A B7 18 07      [ 4]  975         staa    PIA0CRB         ; CB2 High
   878D 84 F7         [ 2]  976         anda    #0xF7
   878F B7 18 07      [ 4]  977         staa    PIA0CRB         ; CB2 Low
   8792 39            [ 5]  978         rts
                            979 
                            980 ; High pulse on CA2
   8793                     981 L8783:
   8793 B6 18 05      [ 4]  982         ldaa    PIA0CRA 
   8796 8A 38         [ 2]  983         oraa    #0x38
   8798 B7 18 05      [ 4]  984         staa    PIA0CRA         ; CA2 High
   879B 84 F7         [ 2]  985         anda    #0xF7
   879D B7 18 05      [ 4]  986         staa    PIA0CRA         ; CA2 High
   87A0 39            [ 5]  987         rts
                            988 
                            989 ; AVSEL1 = 0
   87A1                     990 L8791:
   87A1 96 7A         [ 3]  991         ldaa    (0x007A)
   87A3 84 FE         [ 2]  992         anda    #0xFE
   87A5 36            [ 3]  993         psha
   87A6 96 AC         [ 3]  994         ldaa    (0x00AC)
   87A8 8A 04         [ 2]  995         oraa    #0x04           ; clear segment C (lower right)
   87AA 97 AC         [ 3]  996         staa    (0x00AC)
   87AC 32            [ 4]  997         pula
   87AD                     998 L879D:
   87AD 97 7A         [ 3]  999         staa    (0x007A)        
   87AF B7 18 06      [ 4] 1000         staa    PIA0PRB 
   87B2 BD 87 85      [ 6] 1001         jsr     L8775           ; AVSEL1 = low
   87B5 96 AC         [ 3] 1002         ldaa    (0x00AC)
   87B7 B7 18 06      [ 4] 1003         staa    PIA0PRB 
   87BA BD 87 4A      [ 6] 1004         jsr     L873A           ; clock diagnostic indicator
   87BD 39            [ 5] 1005         rts
                           1006 
   87BE                    1007 L87AE:
   87BE 96 7A         [ 3] 1008         ldaa    (0x007A)
   87C0 8A 01         [ 2] 1009         oraa    #0x01
   87C2 36            [ 3] 1010         psha
   87C3 96 AC         [ 3] 1011         ldaa    (0x00AC)
   87C5 84 FB         [ 2] 1012         anda    #0xFB
   87C7 97 AC         [ 3] 1013         staa    (0x00AC)
   87C9 32            [ 4] 1014         pula
   87CA 20 E1         [ 3] 1015         bra     L879D
                           1016 
                           1017 ; SCC init, aux serial
   87CC                    1018 L87BC:
   87CC CE 87 E2      [ 3] 1019         ldx     #L87D2
   87CF                    1020 L87BF:
   87CF A6 00         [ 4] 1021         ldaa    0,X
   87D1 81 FF         [ 2] 1022         cmpa    #0xFF
   87D3 27 0C         [ 3] 1023         beq     L87D1
   87D5 08            [ 3] 1024         inx
   87D6 B7 18 0D      [ 4] 1025         staa    SCCCTRLA
   87D9 A6 00         [ 4] 1026         ldaa    0,X
   87DB 08            [ 3] 1027         inx
   87DC B7 18 0D      [ 4] 1028         staa    SCCCTRLA
   87DF 20 EE         [ 3] 1029         bra     L87BF
   87E1                    1030 L87D1:
   87E1 39            [ 5] 1031         rts
                           1032 
                           1033 ; data table for aux serial config
   87E2                    1034 L87D2:
   87E2 09 8A              1035         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   87E4 01 00              1036         .byte   0x01,0x00       ; irq on special condition only
   87E6 0C 18              1037         .byte   0x0c,0x18       ; Lower byte of time constant
   87E8 0D 00              1038         .byte   0x0d,0x00       ; Upper byte of time constant
   87EA 04 44              1039         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   87EC 0E 63              1040         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   87EE 05 68              1041         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   87F0 0B 56              1042         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   87F2 03 C1              1043         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           1044         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           1045         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   87F4 0F 00              1046         .byte   0x0f,0x00       ; end of table marker
   87F6 FF FF              1047         .byte   0xff,0xff
                           1048 
                           1049 ; SCC init, sync tape data
   87F8                    1050 L87E8:
   87F8 CE F8 57      [ 3] 1051         ldx     #LF857
   87FB                    1052 L87EB:
   87FB A6 00         [ 4] 1053         ldaa    0,X
   87FD 81 FF         [ 2] 1054         cmpa    #0xFF
   87FF 27 0C         [ 3] 1055         beq     L87FD
   8801 08            [ 3] 1056         inx
   8802 B7 18 0C      [ 4] 1057         staa    SCCCTRLB
   8805 A6 00         [ 4] 1058         ldaa    0,X
   8807 08            [ 3] 1059         inx
   8808 B7 18 0C      [ 4] 1060         staa    SCCCTRLB
   880B 20 EE         [ 3] 1061         bra     L87EB
   880D                    1062 L87FD:
   880D 20 16         [ 3] 1063         bra     L8815
                           1064 
                           1065 ; data table for sync tape data config
   880F 09 8A              1066         .byte   0x09,0x8a       ; channel reset B, MIE on, DLC off, no vector
   8811 01 10              1067         .byte   0x01,0x10       ; irq on all character received
   8813 0C 18              1068         .byte   0x0c,0x18       ; Lower byte of time constant
   8815 0D 00              1069         .byte   0x0d,0x00       ; Upper byte of time constant
   8817 04 04              1070         .byte   0x04,0x04       ; X1 clock mode, 8-bit sync char, 1 stop bit, no parity
   8819 0E 63              1071         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   881B 05 68              1072         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   881D 0B 01              1073         .byte   0x0b,0x01       ; ~RTxC pin is Recv/Xmit clock, ~TRxC is xmit clk
   881F 03 C1              1074         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
   8821 0F 00              1075         .byte   0x0f,0x00       ; end of table marker
   8823 FF FF              1076         .byte   0xff,0xff
                           1077 
                           1078 ; Install IRQ and SCI interrupt handlers
   8825                    1079 L8815:
   8825 CE 88 4E      [ 3] 1080         ldx     #L883E          ; Install IRQ interrupt handler
   8828 FF 01 28      [ 5] 1081         stx     (0x0128)
   882B 86 7E         [ 2] 1082         ldaa    #0x7E
   882D B7 01 27      [ 4] 1083         staa    (0x0127)
   8830 CE 88 42      [ 3] 1084         ldx     #L8832          ; Install SCI interrupt handler
   8833 FF 01 01      [ 5] 1085         stx     (0x0101)
   8836 B7 01 00      [ 4] 1086         staa    (0x0100)
   8839 B6 10 2D      [ 4] 1087         ldaa    SCCR2           ; enable SCI receive interrupts
   883C 8A 20         [ 2] 1088         oraa    #0x20
   883E B7 10 2D      [ 4] 1089         staa    SCCR2  
   8841 39            [ 5] 1090         rts
                           1091 
                           1092 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1093 
                           1094 ; SCI Interrupt handler, normal serial
                           1095 
   8842                    1096 L8832:
   8842 B6 10 2E      [ 4] 1097         ldaa    SCSR
   8845 B6 10 2F      [ 4] 1098         ldaa    SCDR
   8848 7C 00 48      [ 6] 1099         inc     (0x0048)        ; increment bytes received
   884B 7E 88 72      [ 3] 1100         jmp     L8862           ; handle incoming data the same from SCI or SCC
                           1101 
                           1102 ; IRQ Interrupt handler, aux serial
                           1103 
   884E                    1104 L883E:
   884E 86 01         [ 2] 1105         ldaa    #0x01
   8850 B7 18 0C      [ 4] 1106         staa    SCCCTRLB
   8853 B6 18 0C      [ 4] 1107         ldaa    SCCCTRLB        ; read 3 error bits
   8856 84 70         [ 2] 1108         anda    #0x70
   8858 26 1F         [ 3] 1109         bne     L8869           ; if errors, jump ahead
   885A 86 0A         [ 2] 1110         ldaa    #0x0A
   885C B7 18 0C      [ 4] 1111         staa    SCCCTRLB
   885F B6 18 0C      [ 4] 1112         ldaa    SCCCTRLB        ; read clocks missing bits
   8862 84 C0         [ 2] 1113         anda    #0xC0
   8864 26 22         [ 3] 1114         bne     L8878           ; clocks missing, jump ahead
   8866 B6 18 0C      [ 4] 1115         ldaa    SCCCTRLB        ; check character available
   8869 44            [ 2] 1116         lsra
   886A 24 35         [ 3] 1117         bcc     L8891           ; if no char available, clear register and exit
   886C 7C 00 48      [ 6] 1118         inc     (0x0048)        ; increment bytes received
   886F B6 18 0E      [ 4] 1119         ldaa    SCCDATAB        ; read good data byte
                           1120 
                           1121 ; handle incoming data byte
   8872                    1122 L8862:
   8872 BD FA A3      [ 6] 1123         jsr     SERIALW         ; echo it to serial
   8875 97 4A         [ 3] 1124         staa    (0x004A)        ; store it here
   8877 20 2D         [ 3] 1125         bra     L8896
                           1126 
                           1127 ; errors reading from SCC
   8879                    1128 L8869:
   8879 B6 18 0E      [ 4] 1129         ldaa    SCCDATAB        ; read bad byte
   887C 86 30         [ 2] 1130         ldaa    #0x30
   887E B7 18 0C      [ 4] 1131         staa    SCCCTRLB        ; send error reset (Register 0)
   8881 86 07         [ 2] 1132         ldaa    #0x07
   8883 BD FA A3      [ 6] 1133         jsr     SERIALW         ; send bell to serial
   8886 0C            [ 2] 1134         clc
   8887 3B            [12] 1135         rti
                           1136 
                           1137 ; clocks missing?
   8888                    1138 L8878:
   8888 86 07         [ 2] 1139         ldaa    #0x07
   888A BD FA A3      [ 6] 1140         jsr     SERIALW         ; send bell to serial
   888D 86 0E         [ 2] 1141         ldaa    #0x0E
   888F B7 18 0C      [ 4] 1142         staa    SCCCTRLB
   8892 86 43         [ 2] 1143         ldaa    #0x43
   8894 B7 18 0C      [ 4] 1144         staa    SCCCTRLB        ; send reset missing clock
   8897 B6 18 0E      [ 4] 1145         ldaa    SCCDATAB
   889A 86 07         [ 2] 1146         ldaa    #0x07
   889C BD FA A3      [ 6] 1147         jsr     SERIALW         ; send 2nd bell to serial
   889F 0D            [ 2] 1148         sec
   88A0 3B            [12] 1149         rti
                           1150 
                           1151 ; clear receive data reg and return
   88A1                    1152 L8891:
   88A1 B6 18 0E      [ 4] 1153         ldaa    SCCDATAB
   88A4 0C            [ 2] 1154         clc
   88A5 3B            [12] 1155         rti
                           1156 
                           1157 ; Parse byte from tape
   88A6                    1158 L8896:
   88A6 84 7F         [ 2] 1159         anda    #0x7F           ; should all be 7-bits, ignore bit 7
   88A8 81 24         [ 2] 1160         cmpa    #0x24           ;'$'
   88AA 27 44         [ 3] 1161         beq     L88E0           ; count it and exit
   88AC 81 25         [ 2] 1162         cmpa    #0x25           ;'%'
   88AE 27 40         [ 3] 1163         beq     L88E0           ; count it and exit
   88B0 81 20         [ 2] 1164         cmpa    #0x20           ;' '
   88B2 27 3A         [ 3] 1165         beq     L88DE           ; just exit
   88B4 81 30         [ 2] 1166         cmpa    #0x30           ;'0'
   88B6 25 35         [ 3] 1167         bcs     L88DD           ; < 0x30, exit
   88B8 97 12         [ 3] 1168         staa    (0x0012)        ; store it here
   88BA 96 4D         [ 3] 1169         ldaa    (0x004D)        ; check number of '$' or '%'
   88BC 81 02         [ 2] 1170         cmpa    #0x02
   88BE 25 09         [ 3] 1171         bcs     L88B9           ; < 2, jump ahead
   88C0 7F 00 4D      [ 6] 1172         clr     (0x004D)        ; clear number of '$' or '%'
   88C3 96 12         [ 3] 1173         ldaa    (0x0012)
   88C5 97 49         [ 3] 1174         staa    (0x0049)        ; store the character here - character is 0x30 or higher
   88C7 20 24         [ 3] 1175         bra     L88DD           ; exit
   88C9                    1176 L88B9:
   88C9 7D 00 4E      [ 6] 1177         tst     (0x004E)        ; is 4E 0??? (related to random motions?)
   88CC 27 1F         [ 3] 1178         beq     L88DD           ; if so, exit
   88CE 86 78         [ 2] 1179         ldaa    #0x78           ; 120
   88D0 97 63         [ 3] 1180         staa    (0x0063)        ; start 12 second timer
   88D2 97 64         [ 3] 1181         staa    (0x0064)        ; reset boards before next random motion
   88D4 96 12         [ 3] 1182         ldaa    (0x0012)
   88D6 81 40         [ 2] 1183         cmpa    #0x40
   88D8 24 07         [ 3] 1184         bcc     L88D1           ; if char >= 0x40, jump ahead
   88DA 97 4C         [ 3] 1185         staa    (0x004C)        ; store code from 0x30 to 0x3F here
   88DC 7F 00 4D      [ 6] 1186         clr     (0x004D)        ; more code to process
   88DF 20 0C         [ 3] 1187         bra     L88DD           ; go to rti
   88E1                    1188 L88D1:
   88E1 81 60         [ 2] 1189         cmpa    #0x60       
   88E3 24 08         [ 3] 1190         bcc     L88DD           ; if char >= 0x60, exit
   88E5 97 4B         [ 3] 1191         staa    (0x004B)        ; store code from 0x40 to 0x5F here
   88E7 7F 00 4D      [ 6] 1192         clr     (0x004D)        ; more code to process
   88EA BD 88 F5      [ 6] 1193         jsr     L88E5           ; jump ahead
   88ED                    1194 L88DD:
   88ED 3B            [12] 1195         rti
                           1196 
   88EE                    1197 L88DE:
   88EE 20 FD         [ 3] 1198         bra     L88DD           ; go to rti
   88F0                    1199 L88E0:
   88F0 7C 00 4D      [ 6] 1200         inc     (0x004D)        ; count $ or %
   88F3 20 F9         [ 3] 1201         bra     L88DE           ; exit
   88F5                    1202 L88E5:
   88F5 D6 4B         [ 3] 1203         ldab    (0x004B)        
   88F7 96 4C         [ 3] 1204         ldaa    (0x004C)
   88F9 7D 04 5C      [ 6] 1205         tst     (0x045C)        ; R12/CNR?
   88FC 27 0D         [ 3] 1206         beq     L88FB           ; if R12, jump ahead
   88FE 81 3C         [ 2] 1207         cmpa    #0x3C
   8900 25 09         [ 3] 1208         bcs     L88FB           ; if char < 0x3C, jump ahead
   8902 81 3F         [ 2] 1209         cmpa    #0x3F
   8904 22 05         [ 3] 1210         bhi     L88FB           ; if char > 0x3F, jump ahead 
   8906 BD 89 A3      [ 6] 1211         jsr     L8993           ; process char (0x3C-0x3F)
   8909 20 65         [ 3] 1212         bra     L8960           ; rts
   890B                    1213 L88FB:
   890B 1A 83 30 48   [ 5] 1214         cpd     #0x3048
   890F 27 79         [ 3] 1215         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8911 1A 83 31 48   [ 5] 1216         cpd     #0x3148
   8915 27 5A         [ 3] 1217         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8917 1A 83 34 4D   [ 5] 1218         cpd     #0x344D
   891B 27 6D         [ 3] 1219         beq     L897A           ; turn off 3 bits on boards 1,3,4
   891D 1A 83 35 4D   [ 5] 1220         cpd     #0x354D
   8921 27 4E         [ 3] 1221         beq     L8961           ; turn on 3 bits on boards 1,3,4
   8923 1A 83 36 4D   [ 5] 1222         cpd     #0x364D
   8927 27 61         [ 3] 1223         beq     L897A           ; turn off 3 bits on boards 1,3,4
   8929 1A 83 37 4D   [ 5] 1224         cpd     #0x374D
   892D 27 42         [ 3] 1225         beq     L8961           ; turn on 3 bits on boards 1,3,4
   892F CE 10 80      [ 3] 1226         ldx     #0x1080
   8932 D6 4C         [ 3] 1227         ldab    (0x004C)
   8934 C0 30         [ 2] 1228         subb    #0x30
   8936 54            [ 2] 1229         lsrb
   8937 58            [ 2] 1230         aslb
   8938 58            [ 2] 1231         aslb
   8939 3A            [ 3] 1232         abx
   893A D6 4B         [ 3] 1233         ldab    (0x004B)
   893C C1 50         [ 2] 1234         cmpb    #0x50
   893E 24 30         [ 3] 1235         bcc     L8960           ; if char >= 0x50, return
   8940 C1 47         [ 2] 1236         cmpb    #0x47           
   8942 23 02         [ 3] 1237         bls     L8936           ; if char <= 0x47, skip increments
   8944 08            [ 3] 1238         inx                     ; skip to port B of this PIA
   8945 08            [ 3] 1239         inx
   8946                    1240 L8936:
   8946 C0 40         [ 2] 1241         subb    #0x40           ; 
   8948 C4 07         [ 2] 1242         andb    #0x07
   894A 4F            [ 2] 1243         clra
   894B 0D            [ 2] 1244         sec
   894C 49            [ 2] 1245         rola
   894D 5D            [ 2] 1246         tstb
   894E 27 04         [ 3] 1247         beq     L8944  
   8950                    1248 L8940:
   8950 49            [ 2] 1249         rola
   8951 5A            [ 2] 1250         decb
   8952 26 FC         [ 3] 1251         bne     L8940  
   8954                    1252 L8944:
   8954 97 50         [ 3] 1253         staa    (0x0050)
   8956 96 4C         [ 3] 1254         ldaa    (0x004C)
   8958 84 01         [ 2] 1255         anda    #0x01
   895A 27 08         [ 3] 1256         beq     L8954
                           1257 ; set bit to a 1 using the mask
   895C A6 00         [ 4] 1258         ldaa    0,X
   895E 9A 50         [ 3] 1259         oraa    (0x0050)
   8960 A7 00         [ 4] 1260         staa    0,X
   8962 20 0C         [ 3] 1261         bra     L8960
                           1262 ; set bit to 0 using the mask
   8964                    1263 L8954:
   8964 96 50         [ 3] 1264         ldaa    (0x0050)
   8966 88 FF         [ 2] 1265         eora    #0xFF
   8968 97 50         [ 3] 1266         staa    (0x0050)
   896A A6 00         [ 4] 1267         ldaa    0,X
   896C 94 50         [ 3] 1268         anda    (0x0050)
   896E A7 00         [ 4] 1269         staa    0,X
   8970                    1270 L8960:
   8970 39            [ 5] 1271         rts
                           1272 
                           1273 ; turn on 3 bits on boards 1,3,4
   8971                    1274 L8961:
   8971 B6 10 82      [ 4] 1275         ldaa    (0x1082)
   8974 8A 01         [ 2] 1276         oraa    #0x01           ; board 1, PIA A, bit 0
   8976 B7 10 82      [ 4] 1277         staa    (0x1082)
   8979 B6 10 8A      [ 4] 1278         ldaa    (0x108A)
   897C 8A 20         [ 2] 1279         oraa    #0x20           ; board 3, PIA B, bit 5
   897E B7 10 8A      [ 4] 1280         staa    (0x108A)
   8981 B6 10 8E      [ 4] 1281         ldaa    (0x108E)        ; board 4, PIA B, bit 5
   8984 8A 20         [ 2] 1282         oraa    #0x20
   8986 B7 10 8E      [ 4] 1283         staa    (0x108E)
   8989 39            [ 5] 1284         rts
                           1285 
                           1286 ; turn off 3 bits on boards 1,3,4
   898A                    1287 L897A:
   898A B6 10 82      [ 4] 1288         ldaa    (0x1082)
   898D 84 FE         [ 2] 1289         anda    #0xFE
   898F B7 10 82      [ 4] 1290         staa    (0x1082)
   8992 B6 10 8A      [ 4] 1291         ldaa    (0x108A)
   8995 84 DF         [ 2] 1292         anda    #0xDF
   8997 B7 10 8A      [ 4] 1293         staa    (0x108A)
   899A B6 10 8E      [ 4] 1294         ldaa    (0x108E)
   899D 84 DF         [ 2] 1295         anda    #0xDF
   899F B7 10 8E      [ 4] 1296         staa    (0x108E)
   89A2 39            [ 5] 1297         rts
                           1298 
                           1299 ; process 0x3C-0x3F in CNR mode
   89A3                    1300 L8993:
   89A3 3C            [ 4] 1301         pshx
   89A4 81 3D         [ 2] 1302         cmpa    #0x3D
   89A6 22 05         [ 3] 1303         bhi     L899D           ; if char > 0x3D use second table
   89A8 CE F7 80      [ 3] 1304         ldx     #LF780          ; table at the end
   89AB 20 03         [ 3] 1305         bra     L89A0           ; else use first table
   89AD                    1306 L899D:
   89AD CE F7 A0      [ 3] 1307         ldx     #LF7A0          ; table at the end
   89B0                    1308 L89A0:
   89B0 C0 40         [ 2] 1309         subb    #0x40           
   89B2 58            [ 2] 1310         aslb
   89B3 3A            [ 3] 1311         abx
   89B4 81 3C         [ 2] 1312         cmpa    #0x3C
   89B6 27 34         [ 3] 1313         beq     L89DC           ; board 7 - turn off A & B with table value mask 
   89B8 81 3D         [ 2] 1314         cmpa    #0x3D
   89BA 27 0A         [ 3] 1315         beq     L89B6           ; board 7 - turn on A & B with table value mask
   89BC 81 3E         [ 2] 1316         cmpa    #0x3E
   89BE 27 4B         [ 3] 1317         beq     L89FB           ; board 8 - turn off A & B with table value mask 
   89C0 81 3F         [ 2] 1318         cmpa    #0x3F
   89C2 27 15         [ 3] 1319         beq     L89C9           ; board 8 - turn on A & B with table value mask
   89C4 38            [ 5] 1320         pulx
   89C5 39            [ 5] 1321         rts
                           1322 
                           1323 ; board 7 - turn on A & B with table value mask
   89C6                    1324 L89B6:
   89C6 B6 10 98      [ 4] 1325         ldaa    (0x1098)
   89C9 AA 00         [ 4] 1326         oraa    0,X
   89CB B7 10 98      [ 4] 1327         staa    (0x1098)
   89CE 08            [ 3] 1328         inx
   89CF B6 10 9A      [ 4] 1329         ldaa    (0x109A)
   89D2 AA 00         [ 4] 1330         oraa    0,X
   89D4 B7 10 9A      [ 4] 1331         staa    (0x109A)
   89D7 38            [ 5] 1332         pulx
   89D8 39            [ 5] 1333         rts
                           1334 
                           1335 ; board 8 - turn on A & B with table value mask
   89D9                    1336 L89C9:
   89D9 B6 10 9C      [ 4] 1337         ldaa    (0x109C)
   89DC AA 00         [ 4] 1338         oraa    0,X
   89DE B7 10 9C      [ 4] 1339         staa    (0x109C)
   89E1 08            [ 3] 1340         inx
   89E2 B6 10 9E      [ 4] 1341         ldaa    (0x109E)
   89E5 AA 00         [ 4] 1342         oraa    0,X
   89E7 B7 10 9E      [ 4] 1343         staa    (0x109E)
   89EA 38            [ 5] 1344         pulx
   89EB 39            [ 5] 1345         rts
                           1346 
                           1347 ; board 7 - turn off A & B with table value mask
   89EC                    1348 L89DC:
   89EC E6 00         [ 4] 1349         ldab    0,X
   89EE C8 FF         [ 2] 1350         eorb    #0xFF
   89F0 D7 12         [ 3] 1351         stab    (0x0012)
   89F2 B6 10 98      [ 4] 1352         ldaa    (0x1098)
   89F5 94 12         [ 3] 1353         anda    (0x0012)
   89F7 B7 10 98      [ 4] 1354         staa    (0x1098)
   89FA 08            [ 3] 1355         inx
   89FB E6 00         [ 4] 1356         ldab    0,X
   89FD C8 FF         [ 2] 1357         eorb    #0xFF
   89FF D7 12         [ 3] 1358         stab    (0x0012)
   8A01 B6 10 9A      [ 4] 1359         ldaa    (0x109A)
   8A04 94 12         [ 3] 1360         anda    (0x0012)
   8A06 B7 10 9A      [ 4] 1361         staa    (0x109A)
   8A09 38            [ 5] 1362         pulx
   8A0A 39            [ 5] 1363         rts
                           1364 
                           1365 ; board 8 - turn off A & B with table value mask
   8A0B                    1366 L89FB:
   8A0B E6 00         [ 4] 1367         ldab    0,X
   8A0D C8 FF         [ 2] 1368         eorb    #0xFF
   8A0F D7 12         [ 3] 1369         stab    (0x0012)
   8A11 B6 10 9C      [ 4] 1370         ldaa    (0x109C)
   8A14 94 12         [ 3] 1371         anda    (0x0012)
   8A16 B7 10 9C      [ 4] 1372         staa    (0x109C)
   8A19 08            [ 3] 1373         inx
   8A1A E6 00         [ 4] 1374         ldab    0,X
   8A1C C8 FF         [ 2] 1375         eorb    #0xFF
   8A1E D7 12         [ 3] 1376         stab    (0x0012)
   8A20 B6 10 9E      [ 4] 1377         ldaa    (0x109E)
   8A23 94 12         [ 3] 1378         anda    (0x0012)
   8A25 B7 10 9E      [ 4] 1379         staa    (0x109E)
   8A28 38            [ 5] 1380         pulx
   8A29 39            [ 5] 1381         rts
                           1382 
                           1383 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1384 
   8A2A                    1385 L8A1A:
                           1386 ; Parse text with compressed ANSI stuff from table location in X
   8A2A 3C            [ 4] 1387         pshx
   8A2B                    1388 L8A1B:
   8A2B 86 04         [ 2] 1389         ldaa    #0x04
   8A2D B5 18 0D      [ 4] 1390         bita    SCCCTRLA
   8A30 27 F9         [ 3] 1391         beq     L8A1B  
   8A32 A6 00         [ 4] 1392         ldaa    0,X     
   8A34 26 03         [ 3] 1393         bne     L8A29           ; if not nul, continue
   8A36 7E 8B 31      [ 3] 1394         jmp     L8B21           ; else jump to exit
                           1395 ; process ^0123 into ESC[01;23H - ANSI Cursor positioning - (1 based)
   8A39                    1396 L8A29:
   8A39 08            [ 3] 1397         inx
   8A3A 81 5E         [ 2] 1398         cmpa    #0x5E           ; is it a '^' ?
   8A3C 26 1D         [ 3] 1399         bne     L8A4B           ; no, jump ahead
   8A3E A6 00         [ 4] 1400         ldaa    0,X             ; yes, get the next char
   8A40 08            [ 3] 1401         inx
   8A41 B7 05 92      [ 4] 1402         staa    (0x0592)    
   8A44 A6 00         [ 4] 1403         ldaa    0,X     
   8A46 08            [ 3] 1404         inx
   8A47 B7 05 93      [ 4] 1405         staa    (0x0593)
   8A4A A6 00         [ 4] 1406         ldaa    0,X     
   8A4C 08            [ 3] 1407         inx
   8A4D B7 05 95      [ 4] 1408         staa    (0x0595)
   8A50 A6 00         [ 4] 1409         ldaa    0,X     
   8A52 08            [ 3] 1410         inx
   8A53 B7 05 96      [ 4] 1411         staa    (0x0596)
   8A56 BD 8B 33      [ 6] 1412         jsr     L8B23
   8A59 20 D0         [ 3] 1413         bra     L8A1B  
                           1414 ; process @...
   8A5B                    1415 L8A4B:
   8A5B 81 40         [ 2] 1416         cmpa    #0x40           ; is it a '@' ?
   8A5D 26 3B         [ 3] 1417         bne     L8A8A  
   8A5F 1A EE 00      [ 6] 1418         ldy     0,X
   8A62 08            [ 3] 1419         inx
   8A63 08            [ 3] 1420         inx
   8A64 86 30         [ 2] 1421         ldaa    #0x30
   8A66 97 B1         [ 3] 1422         staa    (0x00B1)
   8A68 18 A6 00      [ 5] 1423         ldaa    0,Y
   8A6B                    1424 L8A5B:
   8A6B 81 64         [ 2] 1425         cmpa    #0x64
   8A6D 25 07         [ 3] 1426         bcs     L8A66  
   8A6F 7C 00 B1      [ 6] 1427         inc     (0x00B1)
   8A72 80 64         [ 2] 1428         suba    #0x64
   8A74 20 F5         [ 3] 1429         bra     L8A5B  
   8A76                    1430 L8A66:
   8A76 36            [ 3] 1431         psha
   8A77 96 B1         [ 3] 1432         ldaa    (0x00B1)
   8A79 BD 8B 4B      [ 6] 1433         jsr     L8B3B
   8A7C 86 30         [ 2] 1434         ldaa    #0x30
   8A7E 97 B1         [ 3] 1435         staa    (0x00B1)
   8A80 32            [ 4] 1436         pula
   8A81                    1437 L8A71:
   8A81 81 0A         [ 2] 1438         cmpa    #0x0A
   8A83 25 07         [ 3] 1439         bcs     L8A7C  
   8A85 7C 00 B1      [ 6] 1440         inc     (0x00B1)
   8A88 80 0A         [ 2] 1441         suba    #0x0A
   8A8A 20 F5         [ 3] 1442         bra     L8A71  
   8A8C                    1443 L8A7C:
   8A8C 36            [ 3] 1444         psha
   8A8D 96 B1         [ 3] 1445         ldaa    (0x00B1)
   8A8F BD 8B 4B      [ 6] 1446         jsr     L8B3B
   8A92 32            [ 4] 1447         pula
   8A93 8B 30         [ 2] 1448         adda    #0x30
   8A95 BD 8B 4B      [ 6] 1449         jsr     L8B3B
   8A98 20 91         [ 3] 1450         bra     L8A1B
                           1451 ; process |...
   8A9A                    1452 L8A8A:
   8A9A 81 7C         [ 2] 1453         cmpa    #0x7C           ; is it a '|' ?
   8A9C 26 59         [ 3] 1454         bne     L8AE7  
   8A9E 1A EE 00      [ 6] 1455         ldy     0,X     
   8AA1 08            [ 3] 1456         inx
   8AA2 08            [ 3] 1457         inx
   8AA3 86 30         [ 2] 1458         ldaa    #0x30
   8AA5 97 B1         [ 3] 1459         staa    (0x00B1)
   8AA7 18 EC 00      [ 6] 1460         ldd     0,Y     
   8AAA                    1461 L8A9A:
   8AAA 1A 83 27 10   [ 5] 1462         cpd     #0x2710
   8AAE 25 08         [ 3] 1463         bcs     L8AA8  
   8AB0 7C 00 B1      [ 6] 1464         inc     (0x00B1)
   8AB3 83 27 10      [ 4] 1465         subd    #0x2710
   8AB6 20 F2         [ 3] 1466         bra     L8A9A  
   8AB8                    1467 L8AA8:
   8AB8 36            [ 3] 1468         psha
   8AB9 96 B1         [ 3] 1469         ldaa    (0x00B1)
   8ABB BD 8B 4B      [ 6] 1470         jsr     L8B3B
   8ABE 86 30         [ 2] 1471         ldaa    #0x30
   8AC0 97 B1         [ 3] 1472         staa    (0x00B1)
   8AC2 32            [ 4] 1473         pula
   8AC3                    1474 L8AB3:
   8AC3 1A 83 03 E8   [ 5] 1475         cpd     #0x03E8
   8AC7 25 08         [ 3] 1476         bcs     L8AC1  
   8AC9 7C 00 B1      [ 6] 1477         inc     (0x00B1)
   8ACC 83 03 E8      [ 4] 1478         subd    #0x03E8
   8ACF 20 F2         [ 3] 1479         bra     L8AB3  
   8AD1                    1480 L8AC1:
   8AD1 36            [ 3] 1481         psha
   8AD2 96 B1         [ 3] 1482         ldaa    (0x00B1)
   8AD4 BD 8B 4B      [ 6] 1483         jsr     L8B3B
   8AD7 86 30         [ 2] 1484         ldaa    #0x30
   8AD9 97 B1         [ 3] 1485         staa    (0x00B1)
   8ADB 32            [ 4] 1486         pula
   8ADC                    1487 L8ACC:
   8ADC 1A 83 00 64   [ 5] 1488         cpd     #0x0064
   8AE0 25 08         [ 3] 1489         bcs     L8ADA  
   8AE2 7C 00 B1      [ 6] 1490         inc     (0x00B1)
   8AE5 83 00 64      [ 4] 1491         subd    #0x0064
   8AE8 20 F2         [ 3] 1492         bra     L8ACC  
   8AEA                    1493 L8ADA:
   8AEA 96 B1         [ 3] 1494         ldaa    (0x00B1)
   8AEC BD 8B 4B      [ 6] 1495         jsr     L8B3B
   8AEF 86 30         [ 2] 1496         ldaa    #0x30
   8AF1 97 B1         [ 3] 1497         staa    (0x00B1)
   8AF3 17            [ 2] 1498         tba
   8AF4 7E 8A 81      [ 3] 1499         jmp     L8A71
                           1500 ; process ~...
   8AF7                    1501 L8AE7:
   8AF7 81 7E         [ 2] 1502         cmpa    #0x7E           ; is it a '~' ?
   8AF9 26 18         [ 3] 1503         bne     L8B03  
   8AFB E6 00         [ 4] 1504         ldab    0,X     
   8AFD C0 30         [ 2] 1505         subb    #0x30
   8AFF 08            [ 3] 1506         inx
   8B00 1A EE 00      [ 6] 1507         ldy     0,X     
   8B03 08            [ 3] 1508         inx
   8B04 08            [ 3] 1509         inx
   8B05                    1510 L8AF5:
   8B05 18 A6 00      [ 5] 1511         ldaa    0,Y     
   8B08 18 08         [ 4] 1512         iny
   8B0A BD 8B 4B      [ 6] 1513         jsr     L8B3B
   8B0D 5A            [ 2] 1514         decb
   8B0E 26 F5         [ 3] 1515         bne     L8AF5  
   8B10 7E 8A 2B      [ 3] 1516         jmp     L8A1B
                           1517 ; process %...
   8B13                    1518 L8B03:
   8B13 81 25         [ 2] 1519         cmpa    #0x25           ; is it a '%' ?
   8B15 26 14         [ 3] 1520         bne     L8B1B  
   8B17 CE 05 90      [ 3] 1521         ldx     #0x0590
   8B1A CC 1B 5B      [ 3] 1522         ldd     #0x1B5B
   8B1D ED 00         [ 5] 1523         std     0,X     
   8B1F 86 4B         [ 2] 1524         ldaa    #0x4B
   8B21 A7 02         [ 4] 1525         staa    2,X
   8B23 6F 03         [ 6] 1526         clr     3,X
   8B25 BD 8A 2A      [ 6] 1527         jsr     L8A1A  
   8B28 7E 8A 2B      [ 3] 1528         jmp     L8A1B
   8B2B                    1529 L8B1B:
   8B2B B7 18 0F      [ 4] 1530         staa    SCCDATAA
   8B2E 7E 8A 2B      [ 3] 1531         jmp     L8A1B
   8B31                    1532 L8B21:
   8B31 38            [ 5] 1533         pulx
   8B32 39            [ 5] 1534         rts
                           1535 
                           1536 ; generate cursor positioning code
   8B33                    1537 L8B23:
   8B33 3C            [ 4] 1538         pshx
   8B34 CE 05 90      [ 3] 1539         ldx     #0x0590
   8B37 CC 1B 5B      [ 3] 1540         ldd     #0x1B5B
   8B3A ED 00         [ 5] 1541         std     0,X     
   8B3C 86 48         [ 2] 1542         ldaa    #0x48           ;'H'
   8B3E A7 07         [ 4] 1543         staa    7,X
   8B40 86 3B         [ 2] 1544         ldaa    #0x3B           ;';'
   8B42 A7 04         [ 4] 1545         staa    4,X
   8B44 6F 08         [ 6] 1546         clr     8,X
   8B46 BD 8A 2A      [ 6] 1547         jsr     L8A1A           ;012345678 - esc[01;23H;
   8B49 38            [ 5] 1548         pulx
   8B4A 39            [ 5] 1549         rts
                           1550 
                           1551 ;
   8B4B                    1552 L8B3B:
   8B4B 36            [ 3] 1553         psha
   8B4C                    1554 L8B3C:
   8B4C 86 04         [ 2] 1555         ldaa    #0x04
   8B4E B5 18 0D      [ 4] 1556         bita    SCCCTRLA
   8B51 27 F9         [ 3] 1557         beq     L8B3C
   8B53 32            [ 4] 1558         pula
   8B54 B7 18 0F      [ 4] 1559         staa    SCCDATAA
   8B57 39            [ 5] 1560         rts
                           1561 
   8B58                    1562 L8B48:
   8B58 BD A3 6B      [ 6] 1563         jsr     LA32E
                           1564 
   8B5B BD 8D F4      [ 6] 1565         jsr     LCDMSG1 
   8B5E 4C 69 67 68 74 20  1566         .ascis  'Light Diagnostic'
        44 69 61 67 6E 6F
        73 74 69 E3
                           1567 
   8B6E BD 8D ED      [ 6] 1568         jsr     LCDMSG2 
   8B71 43 75 72 74 61 69  1569         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           1570 
   8B81 C6 14         [ 2] 1571         ldab    #0x14
   8B83 BD 8C 40      [ 6] 1572         jsr     DLYSECSBY2      ; delay 10 sec
   8B86 C6 FF         [ 2] 1573         ldab    #0xFF
   8B88 F7 10 98      [ 4] 1574         stab    (0x1098)
   8B8B F7 10 9A      [ 4] 1575         stab    (0x109A)
   8B8E F7 10 9C      [ 4] 1576         stab    (0x109C)
   8B91 F7 10 9E      [ 4] 1577         stab    (0x109E)
   8B94 BD FA F9      [ 6] 1578         jsr     BUTNLIT 
   8B97 B6 18 04      [ 4] 1579         ldaa    PIA0PRA 
   8B9A 8A 40         [ 2] 1580         oraa    #0x40
   8B9C B7 18 04      [ 4] 1581         staa    PIA0PRA 
                           1582 
   8B9F BD 8D F4      [ 6] 1583         jsr     LCDMSG1 
   8BA2 20 50 72 65 73 73  1584         .ascis  ' Press ENTER to '
        20 45 4E 54 45 52
        20 74 6F A0
                           1585 
   8BB2 BD 8D ED      [ 6] 1586         jsr     LCDMSG2 
   8BB5 74 75 72 6E 20 6C  1587         .ascis  'turn lights  off'
        69 67 68 74 73 20
        20 6F 66 E6
                           1588 
   8BC5                    1589 L8BB5:
   8BC5 BD 8E A5      [ 6] 1590         jsr     L8E95
   8BC8 81 0D         [ 2] 1591         cmpa    #0x0D
   8BCA 26 F9         [ 3] 1592         bne     L8BB5  
   8BCC BD A3 7E      [ 6] 1593         jsr     LA341
   8BCF 39            [ 5] 1594         rts
                           1595 
                           1596 ; setup IRQ handlers!
   8BD0                    1597 L8BC0:
   8BD0 86 80         [ 2] 1598         ldaa    #0x80
   8BD2 B7 10 22      [ 4] 1599         staa    TMSK1
   8BD5 CE AC 09      [ 3] 1600         ldx     #LABCC
   8BD8 FF 01 19      [ 5] 1601         stx     (0x0119)        ; setup T1OC handler
   8BDB CE AD 49      [ 3] 1602         ldx     #LAD0C
                           1603 
   8BDE FF 01 16      [ 5] 1604         stx     (0x0116)        ; setup T2OC handler
   8BE1 CE AD 49      [ 3] 1605         ldx     #LAD0C
   8BE4 FF 01 2E      [ 5] 1606         stx     (0x012E)        ; doubles as SWI handler
   8BE7 86 7E         [ 2] 1607         ldaa    #0x7E
   8BE9 B7 01 18      [ 4] 1608         staa    (0x0118)
   8BEC B7 01 15      [ 4] 1609         staa    (0x0115)
   8BEF B7 01 2D      [ 4] 1610         staa    (0x012D)
   8BF2 4F            [ 2] 1611         clra
   8BF3 5F            [ 2] 1612         clrb
   8BF4 DD 1B         [ 4] 1613         std     CDTIMR1         ; Reset all the countdown timers
   8BF6 DD 1D         [ 4] 1614         std     CDTIMR2
   8BF8 DD 1F         [ 4] 1615         std     CDTIMR3
   8BFA DD 21         [ 4] 1616         std     CDTIMR4
   8BFC DD 23         [ 4] 1617         std     CDTIMR5
                           1618 
   8BFE                    1619 L8BEE:
   8BFE 86 C0         [ 2] 1620         ldaa    #0xC0
   8C00 B7 10 23      [ 4] 1621         staa    TFLG1
   8C03 39            [ 5] 1622         rts
                           1623 
   8C04                    1624 L8BF4:
   8C04 B6 10 0A      [ 4] 1625         ldaa    PORTE
   8C07 88 FF         [ 2] 1626         eora    #0xFF
   8C09 16            [ 2] 1627         tab
   8C0A D7 62         [ 3] 1628         stab    (0x0062)
   8C0C BD FA F9      [ 6] 1629         jsr     BUTNLIT 
   8C0F 20 F3         [ 3] 1630         bra     L8BF4  
   8C11 39            [ 5] 1631         rts
                           1632 
                           1633 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1634 
                           1635 ; Delay B seconds, with random motions if enabled
   8C12                    1636 DLYSECS:
   8C12 36            [ 3] 1637         psha
   8C13 86 64         [ 2] 1638         ldaa    #0x64
   8C15 3D            [10] 1639         mul
   8C16 DD 23         [ 4] 1640         std     CDTIMR5         ; store B*100 here
   8C18                    1641 L8C08:
   8C18 BD 9B 29      [ 6] 1642         jsr     L9B19           ; do the random motions if enabled
   8C1B DC 23         [ 4] 1643         ldd     CDTIMR5
   8C1D 26 F9         [ 3] 1644         bne     L8C08  
   8C1F 32            [ 4] 1645         pula
   8C20 39            [ 5] 1646         rts
                           1647 
                           1648 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1649 
                           1650 ; Delay 1 minute, with random motions if enabled - unused?
   8C21                    1651 DLY1MIN:
   8C21 36            [ 3] 1652         psha
   8C22 86 3C         [ 2] 1653         ldaa    #0x3C
   8C24                    1654 L8C14:
   8C24 97 28         [ 3] 1655         staa    (0x0028)
   8C26 C6 01         [ 2] 1656         ldab    #0x01           ; delay 1 sec
   8C28 BD 8C 12      [ 6] 1657         jsr     DLYSECS         ;
   8C2B 96 28         [ 3] 1658         ldaa    (0x0028)
   8C2D 4A            [ 2] 1659         deca
   8C2E 26 F4         [ 3] 1660         bne     L8C14  
   8C30 32            [ 4] 1661         pula
   8C31 39            [ 5] 1662         rts
                           1663 
                           1664 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1665 
                           1666 ; Delay by B hundreths of a second, with random motions if enabled
   8C32                    1667 DLYSECSBY100:
   8C32 36            [ 3] 1668         psha
   8C33 4F            [ 2] 1669         clra
   8C34 DD 23         [ 4] 1670         std     CDTIMR5
   8C36                    1671 L8C26:
   8C36 BD 9B 29      [ 6] 1672         jsr     L9B19           ; do the random motions if enabled
   8C39 7D 00 24      [ 6] 1673         tst     CDTIMR5+1
   8C3C 26 F8         [ 3] 1674         bne     L8C26
   8C3E 32            [ 4] 1675         pula
   8C3F 39            [ 5] 1676         rts
                           1677 
                           1678 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1679 
                           1680 ; Delay by B half-seconds
   8C40                    1681 DLYSECSBY2:
   8C40 36            [ 3] 1682         psha
   8C41 86 32         [ 2] 1683         ldaa    #0x32           ; 50
   8C43 3D            [10] 1684         mul
   8C44 DD 23         [ 4] 1685         std     CDTIMR5
   8C46                    1686 L8C36:
   8C46 DC 23         [ 4] 1687         ldd     CDTIMR5
   8C48 26 FC         [ 3] 1688         bne     L8C36
   8C4A 32            [ 4] 1689         pula
   8C4B 39            [ 5] 1690         rts
                           1691 
                           1692 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1693 ; LCD routines
                           1694 ;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           1695 
   8C4C                    1696 L8C3C:
   8C4C 86 FF         [ 2] 1697         ldaa    #0xFF
   8C4E B7 10 01      [ 4] 1698         staa    DDRA  
   8C51 86 FF         [ 2] 1699         ldaa    #0xFF
   8C53 B7 10 03      [ 4] 1700         staa    DDRG 
   8C56 B6 10 02      [ 4] 1701         ldaa    PORTG  
   8C59 8A 02         [ 2] 1702         oraa    #0x02
   8C5B B7 10 02      [ 4] 1703         staa    PORTG  
   8C5E 86 38         [ 2] 1704         ldaa    #0x38
   8C60 BD 8C 96      [ 6] 1705         jsr     L8C86           ; write byte to LCD
   8C63 86 38         [ 2] 1706         ldaa    #0x38
   8C65 BD 8C 96      [ 6] 1707         jsr     L8C86           ; write byte to LCD
   8C68 86 06         [ 2] 1708         ldaa    #0x06
   8C6A BD 8C 96      [ 6] 1709         jsr     L8C86           ; write byte to LCD
   8C6D 86 0E         [ 2] 1710         ldaa    #0x0E
   8C6F BD 8C 96      [ 6] 1711         jsr     L8C86           ; write byte to LCD
   8C72 86 01         [ 2] 1712         ldaa    #0x01
   8C74 BD 8C 96      [ 6] 1713         jsr     L8C86           ; write byte to LCD
   8C77 CE 00 FF      [ 3] 1714         ldx     #0x00FF
   8C7A                    1715 L8C6A:
   8C7A 01            [ 2] 1716         nop
   8C7B 01            [ 2] 1717         nop
   8C7C 09            [ 3] 1718         dex
   8C7D 26 FB         [ 3] 1719         bne     L8C6A  
   8C7F 39            [ 5] 1720         rts
                           1721 
                           1722 ; toggle LCD ENABLE
   8C80                    1723 L8C70:
   8C80 B6 10 02      [ 4] 1724         ldaa    PORTG  
   8C83 84 FD         [ 2] 1725         anda    #0xFD           ; clear LCD ENABLE
   8C85 B7 10 02      [ 4] 1726         staa    PORTG  
   8C88 8A 02         [ 2] 1727         oraa    #0x02           ; set LCD ENABLE
   8C8A B7 10 02      [ 4] 1728         staa    PORTG  
   8C8D 39            [ 5] 1729         rts
                           1730 
                           1731 ; Reset LCD buffer?
   8C8E                    1732 L8C7E:
   8C8E CC 05 00      [ 3] 1733         ldd     #0x0500         ; Reset LCD queue?
   8C91 DD 46         [ 4] 1734         std     (0x0046)        ; write pointer
   8C93 DD 44         [ 4] 1735         std     (0x0044)        ; read pointer?
   8C95 39            [ 5] 1736         rts
                           1737 
                           1738 ; write byte to LCD
   8C96                    1739 L8C86:
   8C96 BD 8C CD      [ 6] 1740         jsr     L8CBD           ; wait for LCD not busy
   8C99 B7 10 00      [ 4] 1741         staa    PORTA  
   8C9C B6 10 02      [ 4] 1742         ldaa    PORTG       
   8C9F 84 F3         [ 2] 1743         anda    #0xF3           ; LCD RS and LCD RW low
   8CA1                    1744 L8C91:
   8CA1 B7 10 02      [ 4] 1745         staa    PORTG  
   8CA4 BD 8C 80      [ 6] 1746         jsr     L8C70           ; toggle LCD ENABLE
   8CA7 39            [ 5] 1747         rts
                           1748 
                           1749 ; ???
   8CA8                    1750 L8C98:
   8CA8 BD 8C CD      [ 6] 1751         jsr     L8CBD           ; wait for LCD not busy
   8CAB B7 10 00      [ 4] 1752         staa    PORTA  
   8CAE B6 10 02      [ 4] 1753         ldaa    PORTG  
   8CB1 84 FB         [ 2] 1754         anda    #0xFB
   8CB3 8A 08         [ 2] 1755         oraa    #0x08
   8CB5 20 EA         [ 3] 1756         bra     L8C91  
   8CB7 BD 8C CD      [ 6] 1757         jsr     L8CBD           ; wait for LCD not busy
   8CBA B6 10 02      [ 4] 1758         ldaa    PORTG  
   8CBD 84 F7         [ 2] 1759         anda    #0xF7
   8CBF 8A 08         [ 2] 1760         oraa    #0x08
   8CC1 20 DE         [ 3] 1761         bra     L8C91  
   8CC3 BD 8C CD      [ 6] 1762         jsr     L8CBD           ; wait for LCD not busy
   8CC6 B6 10 02      [ 4] 1763         ldaa    PORTG  
   8CC9 8A 0C         [ 2] 1764         oraa    #0x0C
   8CCB 20 D4         [ 3] 1765         bra     L8C91  
                           1766 
                           1767 ; wait for LCD not busy (or timeout)
   8CCD                    1768 L8CBD:
   8CCD 36            [ 3] 1769         psha
   8CCE 37            [ 3] 1770         pshb
   8CCF C6 FF         [ 2] 1771         ldab    #0xFF           ; init timeout counter
   8CD1                    1772 L8CC1:
   8CD1 5D            [ 2] 1773         tstb
   8CD2 27 1A         [ 3] 1774         beq     L8CDE           ; times up, exit
   8CD4 B6 10 02      [ 4] 1775         ldaa    PORTG  
   8CD7 84 F7         [ 2] 1776         anda    #0xF7           ; bit 3 low
   8CD9 8A 04         [ 2] 1777         oraa    #0x04           ; bit 3 high
   8CDB B7 10 02      [ 4] 1778         staa    PORTG           ; LCD RS high
   8CDE BD 8C 80      [ 6] 1779         jsr     L8C70           ; toggle LCD ENABLE
   8CE1 7F 10 01      [ 6] 1780         clr     DDRA  
   8CE4 B6 10 00      [ 4] 1781         ldaa    PORTA           ; read busy flag from LCD
   8CE7 2B 08         [ 3] 1782         bmi     L8CE1           ; if busy, keep looping
   8CE9 86 FF         [ 2] 1783         ldaa    #0xFF
   8CEB B7 10 01      [ 4] 1784         staa    DDRA            ; port A back to outputs
   8CEE                    1785 L8CDE:
   8CEE 33            [ 4] 1786         pulb                    ; and exit
   8CEF 32            [ 4] 1787         pula
   8CF0 39            [ 5] 1788         rts
                           1789 
   8CF1                    1790 L8CE1:
   8CF1 5A            [ 2] 1791         decb                    ; decrement timer
   8CF2 86 FF         [ 2] 1792         ldaa    #0xFF
   8CF4 B7 10 01      [ 4] 1793         staa    DDRA            ; port A back to outputs
   8CF7 20 D8         [ 3] 1794         bra     L8CC1           ; loop
                           1795 
   8CF9                    1796 L8CE9:
   8CF9 BD 8C CD      [ 6] 1797         jsr     L8CBD           ; wait for LCD not busy
   8CFC 86 01         [ 2] 1798         ldaa    #0x01
   8CFE BD 8C 96      [ 6] 1799         jsr     L8C86           ; write byte to LCD
   8D01 39            [ 5] 1800         rts
                           1801 
   8D02                    1802 L8CF2:
   8D02 BD 8C CD      [ 6] 1803         jsr     L8CBD           ; wait for LCD not busy
   8D05 86 80         [ 2] 1804         ldaa    #0x80
   8D07 BD 8D 24      [ 6] 1805         jsr     L8D14
   8D0A BD 8C CD      [ 6] 1806         jsr     L8CBD           ; wait for LCD not busy
   8D0D 86 80         [ 2] 1807         ldaa    #0x80
   8D0F BD 8C 96      [ 6] 1808         jsr     L8C86           ; write byte to LCD
   8D12 39            [ 5] 1809         rts
                           1810 
   8D13                    1811 L8D03:
   8D13 BD 8C CD      [ 6] 1812         jsr     L8CBD           ; wait for LCD not busy
   8D16 86 C0         [ 2] 1813         ldaa    #0xC0
   8D18 BD 8D 24      [ 6] 1814         jsr     L8D14
   8D1B BD 8C CD      [ 6] 1815         jsr     L8CBD           ; wait for LCD not busy
   8D1E 86 C0         [ 2] 1816         ldaa    #0xC0
   8D20 BD 8C 96      [ 6] 1817         jsr     L8C86           ; write byte to LCD
   8D23 39            [ 5] 1818         rts
                           1819 
   8D24                    1820 L8D14:
   8D24 BD 8C 96      [ 6] 1821         jsr     L8C86           ; write byte to LCD
   8D27 86 10         [ 2] 1822         ldaa    #0x10
   8D29 97 14         [ 3] 1823         staa    (0x0014)
   8D2B                    1824 L8D1B:
   8D2B BD 8C CD      [ 6] 1825         jsr     L8CBD           ; wait for LCD not busy
   8D2E 86 20         [ 2] 1826         ldaa    #0x20
   8D30 BD 8C A8      [ 6] 1827         jsr     L8C98
   8D33 7A 00 14      [ 6] 1828         dec     (0x0014)
   8D36 26 F3         [ 3] 1829         bne     L8D1B  
   8D38 39            [ 5] 1830         rts
                           1831 
   8D39                    1832 L8D29:
   8D39 86 0C         [ 2] 1833         ldaa    #0x0C
   8D3B BD 8E 5B      [ 6] 1834         jsr     L8E4B
   8D3E 39            [ 5] 1835         rts
                           1836 
                           1837 ; Unused?
   8D3F                    1838 L8D2F:
   8D3F 86 0E         [ 2] 1839         ldaa    #0x0E
   8D41 BD 8E 5B      [ 6] 1840         jsr     L8E4B
   8D44 39            [ 5] 1841         rts
                           1842 
   8D45                    1843 L8D35:
   8D45 7F 00 4A      [ 6] 1844         clr     (0x004A)
   8D48 7F 00 43      [ 6] 1845         clr     (0x0043)
   8D4B 18 DE 46      [ 5] 1846         ldy     (0x0046)
   8D4E 86 C0         [ 2] 1847         ldaa    #0xC0
   8D50 20 0B         [ 3] 1848         bra     L8D4D
                           1849 
   8D52                    1850 L8D42:
   8D52 7F 00 4A      [ 6] 1851         clr     (0x004A)
   8D55 7F 00 43      [ 6] 1852         clr     (0x0043)
   8D58 18 DE 46      [ 5] 1853         ldy     (0x0046)
   8D5B 86 80         [ 2] 1854         ldaa    #0x80
   8D5D                    1855 L8D4D:
   8D5D 18 A7 00      [ 5] 1856         staa    0,Y     
   8D60 18 6F 01      [ 7] 1857         clr     1,Y     
   8D63 18 08         [ 4] 1858         iny
   8D65 18 08         [ 4] 1859         iny
   8D67 18 8C 05 80   [ 5] 1860         cpy     #0x0580
   8D6B 25 04         [ 3] 1861         bcs     L8D61  
   8D6D 18 CE 05 00   [ 4] 1862         ldy     #0x0500
   8D71                    1863 L8D61:
   8D71 C6 0F         [ 2] 1864         ldab    #0x0F
   8D73                    1865 L8D63:
   8D73 96 4A         [ 3] 1866         ldaa    (0x004A)
   8D75 27 FC         [ 3] 1867         beq     L8D63  
   8D77 7F 00 4A      [ 6] 1868         clr     (0x004A)
   8D7A 5A            [ 2] 1869         decb
   8D7B 27 1A         [ 3] 1870         beq     L8D87  
   8D7D 81 24         [ 2] 1871         cmpa    #0x24
   8D7F 27 16         [ 3] 1872         beq     L8D87  
   8D81 18 6F 00      [ 7] 1873         clr     0,Y     
   8D84 18 A7 01      [ 5] 1874         staa    1,Y     
   8D87 18 08         [ 4] 1875         iny
   8D89 18 08         [ 4] 1876         iny
   8D8B 18 8C 05 80   [ 5] 1877         cpy     #0x0580
   8D8F 25 04         [ 3] 1878         bcs     L8D85  
   8D91 18 CE 05 00   [ 4] 1879         ldy     #0x0500
   8D95                    1880 L8D85:
   8D95 20 DC         [ 3] 1881         bra     L8D63  
   8D97                    1882 L8D87:
   8D97 5D            [ 2] 1883         tstb
   8D98 27 19         [ 3] 1884         beq     L8DA3  
   8D9A 86 20         [ 2] 1885         ldaa    #0x20
   8D9C                    1886 L8D8C:
   8D9C 18 6F 00      [ 7] 1887         clr     0,Y     
   8D9F 18 A7 01      [ 5] 1888         staa    1,Y     
   8DA2 18 08         [ 4] 1889         iny
   8DA4 18 08         [ 4] 1890         iny
   8DA6 18 8C 05 80   [ 5] 1891         cpy     #0x0580
   8DAA 25 04         [ 3] 1892         bcs     L8DA0  
   8DAC 18 CE 05 00   [ 4] 1893         ldy     #0x0500
   8DB0                    1894 L8DA0:
   8DB0 5A            [ 2] 1895         decb
   8DB1 26 E9         [ 3] 1896         bne     L8D8C  
   8DB3                    1897 L8DA3:
   8DB3 18 6F 00      [ 7] 1898         clr     0,Y     
   8DB6 18 6F 01      [ 7] 1899         clr     1,Y     
   8DB9 18 DF 46      [ 5] 1900         sty     (0x0046)
   8DBC 96 19         [ 3] 1901         ldaa    (0x0019)
   8DBE 97 4E         [ 3] 1902         staa    (0x004E)
   8DC0 86 01         [ 2] 1903         ldaa    #0x01
   8DC2 97 43         [ 3] 1904         staa    (0x0043)
   8DC4 39            [ 5] 1905         rts
                           1906 
                           1907 ; display ASCII in B at location
   8DC5                    1908 L8DB5:
   8DC5 36            [ 3] 1909         psha
   8DC6 37            [ 3] 1910         pshb
   8DC7 C1 4F         [ 2] 1911         cmpb    #0x4F
   8DC9 22 13         [ 3] 1912         bhi     L8DCE  
   8DCB C1 28         [ 2] 1913         cmpb    #0x28
   8DCD 25 03         [ 3] 1914         bcs     L8DC2  
   8DCF 0C            [ 2] 1915         clc
   8DD0 C9 18         [ 2] 1916         adcb    #0x18
   8DD2                    1917 L8DC2:
   8DD2 0C            [ 2] 1918         clc
   8DD3 C9 80         [ 2] 1919         adcb    #0x80
   8DD5 17            [ 2] 1920         tba
   8DD6 BD 8E 5B      [ 6] 1921         jsr     L8E4B           ; send lcd command
   8DD9 33            [ 4] 1922         pulb
   8DDA 32            [ 4] 1923         pula
   8DDB BD 8E 80      [ 6] 1924         jsr     L8E70           ; send lcd char
   8DDE                    1925 L8DCE:
   8DDE 39            [ 5] 1926         rts
                           1927 
                           1928 ; 4 routines to write to the LCD display
                           1929 
                           1930 ; Write to the LCD 1st line - extend past the end of a normal display
   8DDF                    1931 LCDMSG1A:
   8DDF 18 DE 46      [ 5] 1932         ldy     (0x0046)        ; get buffer pointer
   8DE2 86 90         [ 2] 1933         ldaa    #0x90           ; command to set LCD RAM ptr to chr 0x10
   8DE4 20 13         [ 3] 1934         bra     L8DE9  
                           1935 
                           1936 ; Write to the LCD 2st line - extend past the end of a normal display
   8DE6                    1937 LCDMSG2A:
   8DE6 18 DE 46      [ 5] 1938         ldy     (0x0046)        ; get buffer pointer
   8DE9 86 D0         [ 2] 1939         ldaa    #0xD0           ; command to set LCD RAM ptr to chr 0x50
   8DEB 20 0C         [ 3] 1940         bra     L8DE9  
                           1941 
                           1942 ; Write to the LCD 2nd line
   8DED                    1943 LCDMSG2:
   8DED 18 DE 46      [ 5] 1944         ldy     (0x0046)        ; get buffer pointer
   8DF0 86 C0         [ 2] 1945         ldaa    #0xC0           ; command to set LCD RAM ptr to chr 0x40
   8DF2 20 05         [ 3] 1946         bra     L8DE9  
                           1947 
                           1948 ; Write to the LCD 1st line
   8DF4                    1949 LCDMSG1:
   8DF4 18 DE 46      [ 5] 1950         ldy     (0x0046)        ; get buffer pointer
   8DF7 86 80         [ 2] 1951         ldaa    #0x80           ; command to load LCD RAM ptr to chr 0x00
                           1952 
                           1953 ; Put LCD command into a buffer, 4 bytes for each entry?
   8DF9                    1954 L8DE9:
   8DF9 18 A7 00      [ 5] 1955         staa    0,Y             ; store command here
   8DFC 18 6F 01      [ 7] 1956         clr     1,Y             ; clear next byte
   8DFF 18 08         [ 4] 1957         iny
   8E01 18 08         [ 4] 1958         iny
                           1959 
                           1960 ; Add characters at return address to LCD buffer
   8E03 18 8C 05 80   [ 5] 1961         cpy     #0x0580         ; check for buffer overflow
   8E07 25 04         [ 3] 1962         bcs     L8DFD           
   8E09 18 CE 05 00   [ 4] 1963         ldy     #0x0500
   8E0D                    1964 L8DFD:
   8E0D 38            [ 5] 1965         pulx                    ; get start of data
   8E0E DF 17         [ 4] 1966         stx     (0x0017)        ; save this here
   8E10                    1967 L8E00:
   8E10 A6 00         [ 4] 1968         ldaa    0,X             ; get character
   8E12 27 36         [ 3] 1969         beq     L8E3A           ; is it 00, if so jump ahead
   8E14 2B 17         [ 3] 1970         bmi     L8E1D           ; high bit set, if so jump ahead
   8E16 18 6F 00      [ 7] 1971         clr     0,Y             ; add character
   8E19 18 A7 01      [ 5] 1972         staa    1,Y     
   8E1C 08            [ 3] 1973         inx
   8E1D 18 08         [ 4] 1974         iny
   8E1F 18 08         [ 4] 1975         iny
   8E21 18 8C 05 80   [ 5] 1976         cpy     #0x0580         ; check for buffer overflow
   8E25 25 E9         [ 3] 1977         bcs     L8E00  
   8E27 18 CE 05 00   [ 4] 1978         ldy     #0x0500
   8E2B 20 E3         [ 3] 1979         bra     L8E00  
                           1980 
   8E2D                    1981 L8E1D:
   8E2D 84 7F         [ 2] 1982         anda    #0x7F
   8E2F 18 6F 00      [ 7] 1983         clr     0,Y             ; add character
   8E32 18 A7 01      [ 5] 1984         staa    1,Y     
   8E35 18 6F 02      [ 7] 1985         clr     2,Y     
   8E38 18 6F 03      [ 7] 1986         clr     3,Y     
   8E3B 08            [ 3] 1987         inx
   8E3C 18 08         [ 4] 1988         iny
   8E3E 18 08         [ 4] 1989         iny
   8E40 18 8C 05 80   [ 5] 1990         cpy     #0x0580         ; check for overflow
   8E44 25 04         [ 3] 1991         bcs     L8E3A  
   8E46 18 CE 05 00   [ 4] 1992         ldy     #0x0500
                           1993 
   8E4A                    1994 L8E3A:
   8E4A 3C            [ 4] 1995         pshx                    ; put SP back
   8E4B 86 01         [ 2] 1996         ldaa    #0x01
   8E4D 97 43         [ 3] 1997         staa    (0x0043)        ; semaphore?
   8E4F DC 46         [ 4] 1998         ldd     (0x0046)
   8E51 18 6F 00      [ 7] 1999         clr     0,Y     
   8E54 18 6F 01      [ 7] 2000         clr     1,Y     
   8E57 18 DF 46      [ 5] 2001         sty     (0x0046)        ; save buffer pointer
   8E5A 39            [ 5] 2002         rts
                           2003 
                           2004 ; buffer LCD command?
   8E5B                    2005 L8E4B:
   8E5B 18 DE 46      [ 5] 2006         ldy     (0x0046)
   8E5E 18 A7 00      [ 5] 2007         staa    0,Y     
   8E61 18 6F 01      [ 7] 2008         clr     1,Y     
   8E64 18 08         [ 4] 2009         iny
   8E66 18 08         [ 4] 2010         iny
   8E68 18 8C 05 80   [ 5] 2011         cpy     #0x0580
   8E6C 25 04         [ 3] 2012         bcs     L8E62  
   8E6E 18 CE 05 00   [ 4] 2013         ldy     #0x0500
   8E72                    2014 L8E62:
   8E72 18 6F 00      [ 7] 2015         clr     0,Y     
   8E75 18 6F 01      [ 7] 2016         clr     1,Y     
   8E78 86 01         [ 2] 2017         ldaa    #0x01
   8E7A 97 43         [ 3] 2018         staa    (0x0043)
   8E7C 18 DF 46      [ 5] 2019         sty     (0x0046)
   8E7F 39            [ 5] 2020         rts
                           2021 
   8E80                    2022 L8E70:
   8E80 18 DE 46      [ 5] 2023         ldy     (0x0046)
   8E83 18 6F 00      [ 7] 2024         clr     0,Y     
   8E86 18 A7 01      [ 5] 2025         staa    1,Y     
   8E89 18 08         [ 4] 2026         iny
   8E8B 18 08         [ 4] 2027         iny
   8E8D 18 8C 05 80   [ 5] 2028         cpy     #0x0580
   8E91 25 04         [ 3] 2029         bcs     L8E87  
   8E93 18 CE 05 00   [ 4] 2030         ldy     #0x0500
   8E97                    2031 L8E87:
   8E97 18 6F 00      [ 7] 2032         clr     0,Y     
   8E9A 18 6F 01      [ 7] 2033         clr     1,Y     
   8E9D 86 01         [ 2] 2034         ldaa    #0x01
   8E9F 97 43         [ 3] 2035         staa    (0x0043)
   8EA1 18 DF 46      [ 5] 2036         sty     (0x0046)
   8EA4 39            [ 5] 2037         rts
                           2038 
                           2039 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2040 
                           2041 ; Read SCD switches
   8EA5                    2042 L8E95:
   8EA5 96 30         [ 3] 2043         ldaa    (0x0030)
   8EA7 26 09         [ 3] 2044         bne     L8EA2       ; UP - return A=0x01
   8EA9 96 31         [ 3] 2045         ldaa    (0x0031)
   8EAB 26 11         [ 3] 2046         bne     L8EAE       ; DOWN - return A=0x02
   8EAD 96 32         [ 3] 2047         ldaa    (0x0032)
   8EAF 26 19         [ 3] 2048         bne     L8EBA       ; ENTER - return A=0x0D
   8EB1 39            [ 5] 2049         rts                 ; return A=0x00
                           2050 
   8EB2                    2051 L8EA2:
   8EB2 7F 00 30      [ 6] 2052         clr     (0x0030)
   8EB5 7F 00 32      [ 6] 2053         clr     (0x0032)
   8EB8 7F 00 31      [ 6] 2054         clr     (0x0031)
   8EBB 86 01         [ 2] 2055         ldaa    #0x01
   8EBD 39            [ 5] 2056         rts
                           2057 
   8EBE                    2058 L8EAE:
   8EBE 7F 00 31      [ 6] 2059         clr     (0x0031)
   8EC1 7F 00 30      [ 6] 2060         clr     (0x0030)
   8EC4 7F 00 32      [ 6] 2061         clr     (0x0032)
   8EC7 86 02         [ 2] 2062         ldaa    #0x02
   8EC9 39            [ 5] 2063         rts
                           2064 
   8ECA                    2065 L8EBA:
   8ECA 7F 00 32      [ 6] 2066         clr     (0x0032)
   8ECD 7F 00 30      [ 6] 2067         clr     (0x0030)
   8ED0 7F 00 31      [ 6] 2068         clr     (0x0031)
   8ED3 86 0D         [ 2] 2069         ldaa    #0x0D
   8ED5 39            [ 5] 2070         rts
                           2071 
                           2072 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2073 
                           2074 ; Scan SCD keys into up=0x30,down=0x31,enter=0x32
   8ED6                    2075 L8EC6:
   8ED6 B6 18 04      [ 4] 2076         ldaa    PIA0PRA 
   8ED9 84 07         [ 2] 2077         anda    #0x07       ; get button state
   8EDB 97 2C         [ 3] 2078         staa    (0x002C)
   8EDD 78 00 2C      [ 6] 2079         asl     (0x002C)
   8EE0 78 00 2C      [ 6] 2080         asl     (0x002C)
   8EE3 78 00 2C      [ 6] 2081         asl     (0x002C)
   8EE6 78 00 2C      [ 6] 2082         asl     (0x002C)
   8EE9 78 00 2C      [ 6] 2083         asl     (0x002C)    ; put in upper 3 bits of 002C 
   8EEC CE 00 00      [ 3] 2084         ldx     #0x0000
   8EEF                    2085 L8EDF:
   8EEF 8C 00 03      [ 4] 2086         cpx     #0x0003
   8EF2 27 24         [ 3] 2087         beq     L8F08
   8EF4 78 00 2C      [ 6] 2088         asl     (0x002C)    
   8EF7 25 12         [ 3] 2089         bcs     L8EFB       ; if button not pressed, jump
   8EF9 A6 2D         [ 4] 2090         ldaa    0x2D,X
   8EFB 81 0F         [ 2] 2091         cmpa    #0x0F       ; has it been pressed for 15
   8EFD 24 1A         [ 3] 2092         bcc     L8F09       ; do key repeat, if not enter
   8EFF 6C 2D         [ 6] 2093         inc     0x2D,X      ; nope, inc it
   8F01 A6 2D         [ 4] 2094         ldaa    0x2D,X
   8F03 81 02         [ 2] 2095         cmpa    #0x02       ; has it been pressed for 2?
   8F05 26 02         [ 3] 2096         bne     L8EF9       ; nope
   8F07 A7 30         [ 4] 2097         staa    0x30,X      ; short press - store count (2) in 0x30/0x31/0x32
   8F09                    2098 L8EF9:
   8F09 20 0A         [ 3] 2099         bra     L8F05  
   8F0B                    2100 L8EFB:                      ; 
   8F0B 6F 2D         [ 6] 2101         clr     0x2D,X      ; clear 2D/2E/2F if not pressed
   8F0D 20 06         [ 3] 2102         bra     L8F05  
   8F0F A6 2D         [ 4] 2103         ldaa    0x2D,X
   8F11 27 02         [ 3] 2104         beq     L8F05  
   8F13 6A 2D         [ 6] 2105         dec     0x2D,X
   8F15                    2106 L8F05:
   8F15 08            [ 3] 2107         inx
   8F16 20 D7         [ 3] 2108         bra     L8EDF  
   8F18                    2109 L8F08:
   8F18 39            [ 5] 2110         rts
                           2111 
   8F19                    2112 L8F09:
   8F19 8C 00 02      [ 4] 2113         cpx     #0x0002
   8F1C 27 02         [ 3] 2114         beq     L8F10  
   8F1E 6F 2D         [ 6] 2115         clr     0x2D,X      ; do kbd repeat for up and down
   8F20                    2116 L8F10:
   8F20 20 F3         [ 3] 2117         bra     L8F05
                           2118 
                           2119 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2120 
                           2121 ; Read Front Panel Switches
   8F22                    2122 L8F12:
   8F22 B6 10 0A      [ 4] 2123         ldaa    PORTE
   8F25 97 51         [ 3] 2124         staa    (0x0051)
   8F27 CE 00 00      [ 3] 2125         ldx     #0x0000
   8F2A                    2126 L8F1A:
   8F2A 8C 00 08      [ 4] 2127         cpx     #0x0008
   8F2D 27 22         [ 3] 2128         beq     L8F41  
   8F2F 77 00 51      [ 6] 2129         asr     (0x0051)
   8F32 25 10         [ 3] 2130         bcs     L8F34  
   8F34 A6 52         [ 4] 2131         ldaa    0x52,X
   8F36 81 0F         [ 2] 2132         cmpa    #0x0F
   8F38 6C 52         [ 6] 2133         inc     0x52,X
   8F3A A6 52         [ 4] 2134         ldaa    0x52,X
   8F3C 81 04         [ 2] 2135         cmpa    #0x04
   8F3E 26 02         [ 3] 2136         bne     L8F32  
   8F40 A7 5A         [ 4] 2137         staa    0x5A,X
   8F42                    2138 L8F32:
   8F42 20 0A         [ 3] 2139         bra     L8F3E  
   8F44                    2140 L8F34:
   8F44 6F 52         [ 6] 2141         clr     0x52,X
   8F46 20 06         [ 3] 2142         bra     L8F3E  
   8F48 A6 52         [ 4] 2143         ldaa    0x52,X
   8F4A 27 02         [ 3] 2144         beq     L8F3E  
   8F4C 6A 52         [ 6] 2145         dec     0x52,X
   8F4E                    2146 L8F3E:
   8F4E 08            [ 3] 2147         inx
   8F4F 20 D9         [ 3] 2148         bra     L8F1A  
   8F51                    2149 L8F41:
   8F51 39            [ 5] 2150         rts
                           2151 
   8F52 6F 52         [ 6] 2152         clr     0x52,X
   8F54 20 F8         [ 3] 2153         bra     L8F3E  
                           2154 
                           2155 ;;;;;;;;;;;;;;;;;;;;;;;;;;
                           2156 
   8F56                    2157 L8F46:
   8F56 30 2E 35           2158         .ascii      '0.5'
   8F59 31 2E 30           2159         .ascii      '1.0'
   8F5C 31 2E 35           2160         .ascii      '1.5'
   8F5F 32 2E 30           2161         .ascii      '2.0'
   8F62 32 2E 35           2162         .ascii      '2.5'
   8F65 33 2E 30           2163         .ascii      '3.0'
                           2164 
   8F68                    2165 L8F58:
   8F68 3C            [ 4] 2166         pshx
   8F69 96 12         [ 3] 2167         ldaa    (0x0012)
   8F6B 80 01         [ 2] 2168         suba    #0x01
   8F6D C6 03         [ 2] 2169         ldab    #0x03
   8F6F 3D            [10] 2170         mul
   8F70 CE 8F 56      [ 3] 2171         ldx     #L8F46
   8F73 3A            [ 3] 2172         abx
   8F74 C6 2C         [ 2] 2173         ldab    #0x2C
   8F76                    2174 L8F66:
   8F76 A6 00         [ 4] 2175         ldaa    0,X     
   8F78 08            [ 3] 2176         inx
   8F79 BD 8D C5      [ 6] 2177         jsr     L8DB5           ; display char here on LCD display
   8F7C 5C            [ 2] 2178         incb
   8F7D C1 2F         [ 2] 2179         cmpb    #0x2F
   8F7F 26 F5         [ 3] 2180         bne     L8F66  
   8F81 38            [ 5] 2181         pulx
   8F82 39            [ 5] 2182         rts
                           2183 
   8F83                    2184 L8F73:
   8F83 36            [ 3] 2185         psha
   8F84 BD 8D 02      [ 6] 2186         jsr     L8CF2
   8F87 C6 02         [ 2] 2187         ldab    #0x02
   8F89 BD 8C 40      [ 6] 2188         jsr     DLYSECSBY2   
   8F8C 32            [ 4] 2189         pula
   8F8D 97 B4         [ 3] 2190         staa    (0x00B4)
   8F8F 81 03         [ 2] 2191         cmpa    #0x03
   8F91 26 11         [ 3] 2192         bne     L8F94  
                           2193 
   8F93 BD 8D F4      [ 6] 2194         jsr     LCDMSG1 
   8F96 43 68 75 63 6B 20  2195         .ascis  'Chuck    '
        20 20 A0
                           2196 
   8F9F CE 90 82      [ 3] 2197         ldx     #L9072
   8FA2 20 4D         [ 3] 2198         bra     L8FE1  
   8FA4                    2199 L8F94:
   8FA4 81 04         [ 2] 2200         cmpa    #0x04
   8FA6 26 11         [ 3] 2201         bne     L8FA9  
                           2202 
   8FA8 BD 8D F4      [ 6] 2203         jsr     LCDMSG1 
   8FAB 4A 61 73 70 65 72  2204         .ascis  'Jasper   '
        20 20 A0
                           2205 
   8FB4 CE 90 EE      [ 3] 2206         ldx     #L90DE
   8FB7 20 38         [ 3] 2207         bra     L8FE1  
   8FB9                    2208 L8FA9:
   8FB9 81 05         [ 2] 2209         cmpa    #0x05
   8FBB 26 11         [ 3] 2210         bne     L8FBE  
                           2211 
   8FBD BD 8D F4      [ 6] 2212         jsr     LCDMSG1 
   8FC0 50 61 73 71 75 61  2213         .ascis  'Pasqually'
        6C 6C F9
                           2214 
   8FC9 CE 91 55      [ 3] 2215         ldx     #L9145
   8FCC 20 23         [ 3] 2216         bra     L8FE1  
   8FCE                    2217 L8FBE:
   8FCE 81 06         [ 2] 2218         cmpa    #0x06
   8FD0 26 11         [ 3] 2219         bne     L8FD3  
                           2220 
   8FD2 BD 8D F4      [ 6] 2221         jsr     LCDMSG1 
   8FD5 4D 75 6E 63 68 20  2222         .ascis  'Munch    '
        20 20 A0
                           2223 
   8FDE CE 91 CA      [ 3] 2224         ldx     #L91BA
   8FE1 20 0E         [ 3] 2225         bra     L8FE1  
   8FE3                    2226 L8FD3:
   8FE3 BD 8D F4      [ 6] 2227         jsr     LCDMSG1 
   8FE6 48 65 6C 65 6E 20  2228         .ascis  'Helen   '
        20 A0
                           2229 
   8FEE CE 92 36      [ 3] 2230         ldx     #L9226
   8FF1                    2231 L8FE1:
   8FF1 96 B4         [ 3] 2232         ldaa    (0x00B4)
   8FF3 80 03         [ 2] 2233         suba    #0x03
   8FF5 48            [ 2] 2234         asla
   8FF6 48            [ 2] 2235         asla
   8FF7 97 4B         [ 3] 2236         staa    (0x004B)
   8FF9 BD 95 14      [ 6] 2237         jsr     L9504
   8FFC 97 4C         [ 3] 2238         staa    (0x004C)
   8FFE 81 0F         [ 2] 2239         cmpa    #0x0F
   9000 26 01         [ 3] 2240         bne     L8FF3  
   9002 39            [ 5] 2241         rts
                           2242 
   9003                    2243 L8FF3:
   9003 81 08         [ 2] 2244         cmpa    #0x08
   9005 23 08         [ 3] 2245         bls     L8FFF  
   9007 80 08         [ 2] 2246         suba    #0x08
   9009 D6 4B         [ 3] 2247         ldab    (0x004B)
   900B CB 02         [ 2] 2248         addb    #0x02
   900D D7 4B         [ 3] 2249         stab    (0x004B)
   900F                    2250 L8FFF:
   900F 36            [ 3] 2251         psha
   9010 18 DE 46      [ 5] 2252         ldy     (0x0046)
   9013 32            [ 4] 2253         pula
   9014 5F            [ 2] 2254         clrb
   9015 0D            [ 2] 2255         sec
   9016                    2256 L9006:
   9016 59            [ 2] 2257         rolb
   9017 4A            [ 2] 2258         deca
   9018 26 FC         [ 3] 2259         bne     L9006  
   901A D7 50         [ 3] 2260         stab    (0x0050)
   901C D6 4B         [ 3] 2261         ldab    (0x004B)
   901E CE 10 80      [ 3] 2262         ldx     #0x1080
   9021 3A            [ 3] 2263         abx
   9022 86 02         [ 2] 2264         ldaa    #0x02
   9024 97 12         [ 3] 2265         staa    (0x0012)
   9026                    2266 L9016:
   9026 A6 00         [ 4] 2267         ldaa    0,X     
   9028 98 50         [ 3] 2268         eora    (0x0050)
   902A A7 00         [ 4] 2269         staa    0,X     
   902C 6D 00         [ 6] 2270         tst     0,X     
   902E 27 16         [ 3] 2271         beq     L9036  
   9030 86 4F         [ 2] 2272         ldaa    #0x4F           ;'O'
   9032 C6 0C         [ 2] 2273         ldab    #0x0C        
   9034 BD 8D C5      [ 6] 2274         jsr     L8DB5           ; display char here on LCD display
   9037 86 6E         [ 2] 2275         ldaa    #0x6E           ;'n'
   9039 C6 0D         [ 2] 2276         ldab    #0x0D
   903B BD 8D C5      [ 6] 2277         jsr     L8DB5           ; display char here on LCD display
   903E CC 20 0E      [ 3] 2278         ldd     #0x200E         ;' '
   9041 BD 8D C5      [ 6] 2279         jsr     L8DB5           ; display char here on LCD display
   9044 20 0E         [ 3] 2280         bra     L9044  
   9046                    2281 L9036:
   9046 86 66         [ 2] 2282         ldaa    #0x66           ;'f'
   9048 C6 0D         [ 2] 2283         ldab    #0x0D
   904A BD 8D C5      [ 6] 2284         jsr     L8DB5           ; display char here on LCD display
   904D 86 66         [ 2] 2285         ldaa    #0x66           ;'f'
   904F C6 0E         [ 2] 2286         ldab    #0x0E
   9051 BD 8D C5      [ 6] 2287         jsr     L8DB5           ; display char here on LCD display
   9054                    2288 L9044:
   9054 D6 12         [ 3] 2289         ldab    (0x0012)
   9056 BD 8C 40      [ 6] 2290         jsr     DLYSECSBY2      ; delay in half-seconds
   9059 BD 8E A5      [ 6] 2291         jsr     L8E95
   905C 81 0D         [ 2] 2292         cmpa    #0x0D
   905E 27 14         [ 3] 2293         beq     L9064  
   9060 20 C4         [ 3] 2294         bra     L9016  
   9062 81 02         [ 2] 2295         cmpa    #0x02
   9064 26 C0         [ 3] 2296         bne     L9016  
   9066 96 12         [ 3] 2297         ldaa    (0x0012)
   9068 81 06         [ 2] 2298         cmpa    #0x06
   906A 27 BA         [ 3] 2299         beq     L9016  
   906C 4C            [ 2] 2300         inca
   906D 97 12         [ 3] 2301         staa    (0x0012)
   906F BD 8F 68      [ 6] 2302         jsr     L8F58
   9072 20 B2         [ 3] 2303         bra     L9016  
   9074                    2304 L9064:
   9074 A6 00         [ 4] 2305         ldaa    0,X     
   9076 9A 50         [ 3] 2306         oraa    (0x0050)
   9078 98 50         [ 3] 2307         eora    (0x0050)
   907A A7 00         [ 4] 2308         staa    0,X     
   907C 96 B4         [ 3] 2309         ldaa    (0x00B4)
   907E 7E 8F 83      [ 3] 2310         jmp     L8F73
   9081 39            [ 5] 2311         rts
                           2312 
   9082                    2313 L9072:
   9082 4D 6F 75 74 68 2C  2314         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   90EE                    2315 L90DE:
   90EE 4D 6F 75 74 68 2C  2316         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Hands,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9155                    2317 L9145:
   9155 4D 6F 75 74 68 2D  2318         .ascis  'Mouth-Mustache,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   91CA                    2319 L91BA:
   91CA 4D 6F 75 74 68 2C  2320         .ascis  'Mouth,Head left,Head right,Left arm,Eyes right,Eyelids,Right arm,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
   9236                    2321 L9226:
   9236 4D 6F 75 74 68 2C  2322         .ascis  'Mouth,Head left,Head right,Head up,Eyes right,Eyelids,Right hand,Eyes left,DS9,DS10,DS11,DS12,DS13,DS14,Exit'
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
                           2323         
                           2324 ; code again
   92A2                    2325 L9292:
   92A2 BD 86 D4      [ 6] 2326         jsr     L86C4           ; Reset boards 1-10
   92A5                    2327 L9295:
   92A5 C6 01         [ 2] 2328         ldab    #0x01
   92A7 BD 8C 40      [ 6] 2329         jsr     DLYSECSBY2      ; delay 0.5 sec
                           2330 
   92AA BD 8D F4      [ 6] 2331         jsr     LCDMSG1 
   92AD 20 20 44 69 61 67  2332         .ascis  '  Diagnostics   '
        6E 6F 73 74 69 63
        73 20 20 A0
                           2333 
   92BD BD 8D ED      [ 6] 2334         jsr     LCDMSG2 
   92C0 20 20 20 20 20 20  2335         .ascis  '                '
        20 20 20 20 20 20
        20 20 20 A0
                           2336 
   92D0 C6 01         [ 2] 2337         ldab    #0x01
   92D2 BD 8C 40      [ 6] 2338         jsr     DLYSECSBY2      ; delay 0.5 sec
   92D5 BD 8D 13      [ 6] 2339         jsr     L8D03
   92D8 CE 93 E3      [ 3] 2340         ldx     #L93D3
   92DB BD 95 14      [ 6] 2341         jsr     L9504
   92DE 81 11         [ 2] 2342         cmpa    #0x11
   92E0 26 14         [ 3] 2343         bne     L92E6
   92E2                    2344 L92D2:
   92E2 BD 86 D4      [ 6] 2345         jsr     L86C4           ; Reset boards 1-10
   92E5 5F            [ 2] 2346         clrb
   92E6 D7 62         [ 3] 2347         stab    (0x0062)
   92E8 BD FA F9      [ 6] 2348         jsr     BUTNLIT 
   92EB B6 18 04      [ 4] 2349         ldaa    PIA0PRA 
   92EE 84 BF         [ 2] 2350         anda    #0xBF
   92F0 B7 18 04      [ 4] 2351         staa    PIA0PRA 
   92F3 7E 81 D4      [ 3] 2352         jmp     L81D7
   92F6                    2353 L92E6:
   92F6 81 03         [ 2] 2354         cmpa    #0x03
   92F8 25 09         [ 3] 2355         bcs     L92F3  
   92FA 81 08         [ 2] 2356         cmpa    #0x08
   92FC 24 05         [ 3] 2357         bcc     L92F3  
   92FE BD 8F 83      [ 6] 2358         jsr     L8F73
   9301 20 A2         [ 3] 2359         bra     L9295  
   9303                    2360 L92F3:
   9303 81 02         [ 2] 2361         cmpa    #0x02
   9305 26 08         [ 3] 2362         bne     L92FF  
   9307 BD 9F 5B      [ 6] 2363         jsr     L9F1E
   930A 25 99         [ 3] 2364         bcs     L9295  
   930C 7E 96 85      [ 3] 2365         jmp     L9675
   930F                    2366 L92FF:
   930F 81 0B         [ 2] 2367         cmpa    #0x0B
   9311 26 0D         [ 3] 2368         bne     L9310  
   9313 BD 8D 13      [ 6] 2369         jsr     L8D03
   9316 BD 9F 09      [ 6] 2370         jsr     L9ECC
   9319 C6 03         [ 2] 2371         ldab    #0x03
   931B BD 8C 40      [ 6] 2372         jsr     DLYSECSBY2      ; delay 1.5 sec
   931E 20 85         [ 3] 2373         bra     L9295  
   9320                    2374 L9310:
   9320 81 09         [ 2] 2375         cmpa    #0x09
   9322 26 0E         [ 3] 2376         bne     L9322  
   9324 BD 9F 5B      [ 6] 2377         jsr     L9F1E
   9327 24 03         [ 3] 2378         bcc     L931C  
   9329 7E 92 A5      [ 3] 2379         jmp     L9295
   932C                    2380 L931C:
   932C BD 9E CF      [ 6] 2381         jsr     L9E92           ; reset R counts
   932F 7E 92 A5      [ 3] 2382         jmp     L9295
   9332                    2383 L9322:
   9332 81 0A         [ 2] 2384         cmpa    #0x0A
   9334 26 0B         [ 3] 2385         bne     L9331  
   9336 BD 9F 5B      [ 6] 2386         jsr     L9F1E
   9339 25 03         [ 3] 2387         bcs     L932E  
   933B BD 9E EC      [ 6] 2388         jsr     L9EAF           ; reset L counts
   933E                    2389 L932E:
   933E 7E 92 A5      [ 3] 2390         jmp     L9295
   9341                    2391 L9331:
   9341 81 01         [ 2] 2392         cmpa    #0x01
   9343 26 03         [ 3] 2393         bne     L9338  
   9345 7E A1 26      [ 3] 2394         jmp     LA0E9
   9348                    2395 L9338:
   9348 81 08         [ 2] 2396         cmpa    #0x08
   934A 26 1F         [ 3] 2397         bne     L935B  
   934C BD 9F 5B      [ 6] 2398         jsr     L9F1E
   934F 25 1A         [ 3] 2399         bcs     L935B  
                           2400 
   9351 BD 8D F4      [ 6] 2401         jsr     LCDMSG1 
   9354 52 65 73 65 74 20  2402         .ascis  'Reset System!'
        53 79 73 74 65 6D
        A1
                           2403 
   9361 7E A2 86      [ 3] 2404         jmp     LA249
   9364 C6 02         [ 2] 2405         ldab    #0x02
   9366 BD 8C 40      [ 6] 2406         jsr     DLYSECSBY2      ; delay 1 sec
   9369 20 18         [ 3] 2407         bra     L9373  
   936B                    2408 L935B:
   936B 81 0C         [ 2] 2409         cmpa    #0x0C
   936D 26 14         [ 3] 2410         bne     L9373  
   936F BD 8B 58      [ 6] 2411         jsr     L8B48
   9372 5F            [ 2] 2412         clrb
   9373 D7 62         [ 3] 2413         stab    (0x0062)
   9375 BD FA F9      [ 6] 2414         jsr     BUTNLIT 
   9378 B6 18 04      [ 4] 2415         ldaa    PIA0PRA 
   937B 84 BF         [ 2] 2416         anda    #0xBF
   937D B7 18 04      [ 4] 2417         staa    PIA0PRA 
   9380 7E 92 A2      [ 3] 2418         jmp     L9292
   9383                    2419 L9373:
   9383 81 0D         [ 2] 2420         cmpa    #0x0D
   9385 26 2E         [ 3] 2421         bne     L93A5  
   9387 BD 8C F9      [ 6] 2422         jsr     L8CE9
                           2423 
   938A BD 8D F4      [ 6] 2424         jsr     LCDMSG1 
   938D 20 20 42 75 74 74  2425         .ascis  '  Button  test'
        6F 6E 20 20 74 65
        73 F4
                           2426 
   939B BD 8D ED      [ 6] 2427         jsr     LCDMSG2 
   939E 20 20 20 50 52 4F  2428         .ascis  '   PROG exits'
        47 20 65 78 69 74
        F3
                           2429 
   93AB BD A5 63      [ 6] 2430         jsr     LA526
   93AE 5F            [ 2] 2431         clrb
   93AF BD FA F9      [ 6] 2432         jsr     BUTNLIT 
   93B2 7E 92 A5      [ 3] 2433         jmp     L9295
   93B5                    2434 L93A5:
   93B5 81 0E         [ 2] 2435         cmpa    #0x0E
   93B7 26 10         [ 3] 2436         bne     L93B9  
   93B9 BD 9F 5B      [ 6] 2437         jsr     L9F1E
   93BC 24 03         [ 3] 2438         bcc     L93B1  
   93BE 7E 92 A5      [ 3] 2439         jmp     L9295
   93C1                    2440 L93B1:
   93C1 C6 01         [ 2] 2441         ldab    #0x01
   93C3 BD 8C 40      [ 6] 2442         jsr     DLYSECSBY2      ; delay 0.5 sec
   93C6 7E 94 AA      [ 3] 2443         jmp     L949A
   93C9                    2444 L93B9:
   93C9 81 0F         [ 2] 2445         cmpa    #0x0F
   93CB 26 06         [ 3] 2446         bne     L93C3  
   93CD BD A8 A7      [ 6] 2447         jsr     LA86A
   93D0 7E 92 A5      [ 3] 2448         jmp     L9295
   93D3                    2449 L93C3:
   93D3 81 10         [ 2] 2450         cmpa    #0x10
   93D5 26 09         [ 3] 2451         bne     L93D0  
   93D7 BD 9F 5B      [ 6] 2452         jsr     L9F1E
   93DA BD 95 CA      [ 6] 2453         jsr     L95BA
   93DD 7E 92 A5      [ 3] 2454         jmp     L9295
                           2455 
   93E0                    2456 L93D0:
   93E0 7E 92 E2      [ 3] 2457         jmp     L92D2
                           2458 
   93E3                    2459 L93D3:
   93E3 56 43 52 20 61 64  2460         .ascis  "VCR adjust,Set Random,Chuck E. Cheese,Jasper,Pasqually,Munch,Helen,Reset System,Reset reg tape#,Reset liv tape#,View Tape #'s,All Lights On,Button test,King enable,Warm-Up,Show Type,Quit Diagnostics"
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
   94A9 00                 2461         .byte   0x00
                           2462 
   94AA                    2463 L949A:
   94AA 7D 04 2A      [ 6] 2464         tst     (0x042A)
   94AD 27 27         [ 3] 2465         beq     L94C6  
                           2466 
   94AF BD 8D F4      [ 6] 2467         jsr     LCDMSG1 
   94B2 4B 69 6E 67 20 69  2468         .ascis  'King is Enabled'
        73 20 45 6E 61 62
        6C 65 E4
                           2469 
   94C1 BD 8D ED      [ 6] 2470         jsr     LCDMSG2 
   94C4 45 4E 54 45 52 20  2471         .ascis  'ENTER to disable'
        74 6F 20 64 69 73
        61 62 6C E5
                           2472 
   94D4 20 25         [ 3] 2473         bra     L94EB  
                           2474 
   94D6                    2475 L94C6:
   94D6 BD 8D F4      [ 6] 2476         jsr     LCDMSG1 
   94D9 4B 69 6E 67 20 69  2477         .ascis  'King is Disabled'
        73 20 44 69 73 61
        62 6C 65 E4
                           2478 
   94E9 BD 8D ED      [ 6] 2479         jsr     LCDMSG2 
   94EC 45 4E 54 45 52 20  2480         .ascis  'ENTER to enable'
        74 6F 20 65 6E 61
        62 6C E5
                           2481 
   94FB                    2482 L94EB:
   94FB BD 8E A5      [ 6] 2483         jsr     L8E95
   94FE 4D            [ 2] 2484         tsta
   94FF 27 FA         [ 3] 2485         beq     L94EB  
   9501 81 0D         [ 2] 2486         cmpa    #0x0D
   9503 27 02         [ 3] 2487         beq     L94F7  
   9505 20 0A         [ 3] 2488         bra     L9501  
   9507                    2489 L94F7:
   9507 B6 04 2A      [ 4] 2490         ldaa    (0x042A)
   950A 84 01         [ 2] 2491         anda    #0x01
   950C 88 01         [ 2] 2492         eora    #0x01
   950E B7 04 2A      [ 4] 2493         staa    (0x042A)
   9511                    2494 L9501:
   9511 7E 92 A5      [ 3] 2495         jmp     L9295
   9514                    2496 L9504:
   9514 86 01         [ 2] 2497         ldaa    #0x01
   9516 97 A6         [ 3] 2498         staa    (0x00A6)
   9518 97 A7         [ 3] 2499         staa    (0x00A7)
   951A DF 12         [ 4] 2500         stx     (0x0012)
   951C 20 09         [ 3] 2501         bra     L9517  
   951E 86 01         [ 2] 2502         ldaa    #0x01
   9520 97 A7         [ 3] 2503         staa    (0x00A7)
   9522 7F 00 A6      [ 6] 2504         clr     (0x00A6)
   9525 DF 12         [ 4] 2505         stx     (0x0012)
   9527                    2506 L9517:
   9527 7F 00 16      [ 6] 2507         clr     (0x0016)
   952A 18 DE 46      [ 5] 2508         ldy     (0x0046)
   952D 7D 00 A6      [ 6] 2509         tst     (0x00A6)
   9530 26 07         [ 3] 2510         bne     L9529  
   9532 BD 8D 02      [ 6] 2511         jsr     L8CF2
   9535 86 80         [ 2] 2512         ldaa    #0x80
   9537 20 05         [ 3] 2513         bra     L952E  
   9539                    2514 L9529:
   9539 BD 8D 13      [ 6] 2515         jsr     L8D03
   953C 86 C0         [ 2] 2516         ldaa    #0xC0
   953E                    2517 L952E:
   953E 18 A7 00      [ 5] 2518         staa    0,Y     
   9541 18 6F 01      [ 7] 2519         clr     1,Y     
   9544 18 08         [ 4] 2520         iny
   9546 18 08         [ 4] 2521         iny
   9548 18 8C 05 80   [ 5] 2522         cpy     #0x0580
   954C 25 04         [ 3] 2523         bcs     L9542  
   954E 18 CE 05 00   [ 4] 2524         ldy     #0x0500
   9552                    2525 L9542:
   9552 DF 14         [ 4] 2526         stx     (0x0014)
   9554                    2527 L9544:
   9554 A6 00         [ 4] 2528         ldaa    0,X     
   9556 2A 04         [ 3] 2529         bpl     L954C  
   9558 C6 01         [ 2] 2530         ldab    #0x01
   955A D7 16         [ 3] 2531         stab    (0x0016)
   955C                    2532 L954C:
   955C 81 2C         [ 2] 2533         cmpa    #0x2C
   955E 27 1E         [ 3] 2534         beq     L956E  
   9560 18 6F 00      [ 7] 2535         clr     0,Y     
   9563 84 7F         [ 2] 2536         anda    #0x7F
   9565 18 A7 01      [ 5] 2537         staa    1,Y     
   9568 18 08         [ 4] 2538         iny
   956A 18 08         [ 4] 2539         iny
   956C 18 8C 05 80   [ 5] 2540         cpy     #0x0580
   9570 25 04         [ 3] 2541         bcs     L9566  
   9572 18 CE 05 00   [ 4] 2542         ldy     #0x0500
   9576                    2543 L9566:
   9576 7D 00 16      [ 6] 2544         tst     (0x0016)
   9579 26 03         [ 3] 2545         bne     L956E  
   957B 08            [ 3] 2546         inx
   957C 20 D6         [ 3] 2547         bra     L9544  
   957E                    2548 L956E:
   957E 08            [ 3] 2549         inx
   957F 86 01         [ 2] 2550         ldaa    #0x01
   9581 97 43         [ 3] 2551         staa    (0x0043)
   9583 18 6F 00      [ 7] 2552         clr     0,Y     
   9586 18 6F 01      [ 7] 2553         clr     1,Y     
   9589 18 DF 46      [ 5] 2554         sty     (0x0046)
   958C                    2555 L957C:
   958C BD 8E A5      [ 6] 2556         jsr     L8E95
   958F 27 FB         [ 3] 2557         beq     L957C  
   9591 81 02         [ 2] 2558         cmpa    #0x02
   9593 26 0A         [ 3] 2559         bne     L958F  
   9595 7D 00 16      [ 6] 2560         tst     (0x0016)
   9598 26 05         [ 3] 2561         bne     L958F  
   959A 7C 00 A7      [ 6] 2562         inc     (0x00A7)
   959D 20 88         [ 3] 2563         bra     L9517  
   959F                    2564 L958F:
   959F 81 01         [ 2] 2565         cmpa    #0x01
   95A1 26 20         [ 3] 2566         bne     L95B3  
   95A3 18 DE 14      [ 5] 2567         ldy     (0x0014)
   95A6 18 9C 12      [ 6] 2568         cpy     (0x0012)
   95A9 23 E1         [ 3] 2569         bls     L957C  
   95AB 7A 00 A7      [ 6] 2570         dec     (0x00A7)
   95AE DE 14         [ 4] 2571         ldx     (0x0014)
   95B0 09            [ 3] 2572         dex
   95B1                    2573 L95A1:
   95B1 09            [ 3] 2574         dex
   95B2 9C 12         [ 5] 2575         cpx     (0x0012)
   95B4 26 03         [ 3] 2576         bne     L95A9  
   95B6 7E 95 27      [ 3] 2577         jmp     L9517
   95B9                    2578 L95A9:
   95B9 A6 00         [ 4] 2579         ldaa    0,X     
   95BB 81 2C         [ 2] 2580         cmpa    #0x2C
   95BD 26 F2         [ 3] 2581         bne     L95A1  
   95BF 08            [ 3] 2582         inx
   95C0 7E 95 27      [ 3] 2583         jmp     L9517
   95C3                    2584 L95B3:
   95C3 81 0D         [ 2] 2585         cmpa    #0x0D
   95C5 26 C5         [ 3] 2586         bne     L957C  
   95C7 96 A7         [ 3] 2587         ldaa    (0x00A7)
   95C9 39            [ 5] 2588         rts
                           2589 
   95CA                    2590 L95BA:
   95CA B6 04 5C      [ 4] 2591         ldaa    (0x045C)
   95CD 27 14         [ 3] 2592         beq     L95D3  
                           2593 
   95CF BD 8D F4      [ 6] 2594         jsr     LCDMSG1 
   95D2 43 75 72 72 65 6E  2595         .ascis  'Current: CNR   '
        74 3A 20 43 4E 52
        20 20 A0
                           2596 
   95E1 20 12         [ 3] 2597         bra     L95E5  
                           2598 
   95E3                    2599 L95D3:
   95E3 BD 8D F4      [ 6] 2600         jsr     LCDMSG1 
   95E6 43 75 72 72 65 6E  2601         .ascis  'Current: R12   '
        74 3A 20 52 31 32
        20 20 A0
                           2602 
   95F5                    2603 L95E5:
   95F5 BD 8D ED      [ 6] 2604         jsr     LCDMSG2 
   95F8 3C 45 6E 74 65 72  2605         .ascis  '<Enter> to chg.'
        3E 20 74 6F 20 63
        68 67 AE
                           2606 
   9607                    2607 L95F7:
   9607 BD 8E A5      [ 6] 2608         jsr     L8E95
   960A 27 FB         [ 3] 2609         beq     L95F7  
   960C 81 0D         [ 2] 2610         cmpa    #0x0D
   960E 26 0F         [ 3] 2611         bne     L960F  
   9610 B6 04 5C      [ 4] 2612         ldaa    (0x045C)
   9613 27 05         [ 3] 2613         beq     L960A  
   9615 7F 04 5C      [ 6] 2614         clr     (0x045C)
   9618 20 05         [ 3] 2615         bra     L960F  
   961A                    2616 L960A:
   961A 86 01         [ 2] 2617         ldaa    #0x01
   961C B7 04 5C      [ 4] 2618         staa    (0x045C)
   961F                    2619 L960F:
   961F 39            [ 5] 2620         rts
                           2621 
   9620                    2622 L9610:
   9620 43 68 75 63 6B 2C  2623         .ascis  "Chuck,Jasper,Pasqually,Munch,Helen,Light 1,Light 2,Light 3,Star EFX,Wink Spot,Gobo,Clear All Rnd,Exit"
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
                           2624 
   9685                    2625 L9675:
   9685 BD 8D F4      [ 6] 2626         jsr     LCDMSG1 
   9688 52 61 6E 64 6F 6D  2627         .ascis  'Random          '
        20 20 20 20 20 20
        20 20 20 A0
                           2628 
   9698 CE 96 20      [ 3] 2629         ldx     #L9610
   969B BD 95 14      [ 6] 2630         jsr     L9504
   969E 5F            [ 2] 2631         clrb
   969F 37            [ 3] 2632         pshb
   96A0 81 0D         [ 2] 2633         cmpa    #0x0D
   96A2 26 03         [ 3] 2634         bne     L9697  
   96A4 7E 97 6B      [ 3] 2635         jmp     L975B
   96A7                    2636 L9697:
   96A7 81 0C         [ 2] 2637         cmpa    #0x0C
   96A9 26 21         [ 3] 2638         bne     L96BC  
   96AB 7F 04 01      [ 6] 2639         clr     (0x0401)
   96AE 7F 04 2B      [ 6] 2640         clr     (0x042B)
                           2641 
   96B1 BD 8D F4      [ 6] 2642         jsr     LCDMSG1 
   96B4 41 6C 6C 20 52 6E  2643         .ascis  'All Rnd Cleared!'
        64 20 43 6C 65 61
        72 65 64 A1
                           2644 
   96C4 C6 64         [ 2] 2645         ldab    #0x64           ; delay 1 sec
   96C6 BD 8C 32      [ 6] 2646         jsr     DLYSECSBY100
   96C9 7E 97 6B      [ 3] 2647         jmp     L975B
   96CC                    2648 L96BC:
   96CC 81 09         [ 2] 2649         cmpa    #0x09
   96CE 25 05         [ 3] 2650         bcs     L96C5  
   96D0 80 08         [ 2] 2651         suba    #0x08
   96D2 33            [ 4] 2652         pulb
   96D3 5C            [ 2] 2653         incb
   96D4 37            [ 3] 2654         pshb
   96D5                    2655 L96C5:
   96D5 5F            [ 2] 2656         clrb
   96D6 0D            [ 2] 2657         sec
   96D7                    2658 L96C7:
   96D7 59            [ 2] 2659         rolb
   96D8 4A            [ 2] 2660         deca
   96D9 26 FC         [ 3] 2661         bne     L96C7  
   96DB D7 12         [ 3] 2662         stab    (0x0012)
   96DD C8 FF         [ 2] 2663         eorb    #0xFF
   96DF D7 13         [ 3] 2664         stab    (0x0013)
   96E1                    2665 L96D1:
   96E1 CC 20 34      [ 3] 2666         ldd     #0x2034         ;' '
   96E4 BD 8D C5      [ 6] 2667         jsr     L8DB5           ; display char here on LCD display
   96E7 33            [ 4] 2668         pulb
   96E8 37            [ 3] 2669         pshb
   96E9 5D            [ 2] 2670         tstb
   96EA 27 05         [ 3] 2671         beq     L96E1  
   96EC B6 04 2B      [ 4] 2672         ldaa    (0x042B)
   96EF 20 03         [ 3] 2673         bra     L96E4  
   96F1                    2674 L96E1:
   96F1 B6 04 01      [ 4] 2675         ldaa    (0x0401)
   96F4                    2676 L96E4:
   96F4 94 12         [ 3] 2677         anda    (0x0012)
   96F6 27 0A         [ 3] 2678         beq     L96F2  
   96F8 18 DE 46      [ 5] 2679         ldy     (0x0046)
   96FB BD 8E 0D      [ 6] 2680         jsr     L8DFD
   96FE 4F            [ 2] 2681         clra
   96FF EE 20         [ 5] 2682         ldx     0x20,X
   9701 09            [ 3] 2683         dex
   9702                    2684 L96F2:
   9702 18 DE 46      [ 5] 2685         ldy     (0x0046)
   9705 BD 8E 0D      [ 6] 2686         jsr     L8DFD
   9708 4F            [ 2] 2687         clra
   9709 66 E6         [ 6] 2688         ror     0xE6,X
   970B CC 20 34      [ 3] 2689         ldd     #0x2034         ;' '
   970E BD 8D C5      [ 6] 2690         jsr     L8DB5           ; display char here on LCD display
   9711                    2691 L9701:
   9711 BD 8E A5      [ 6] 2692         jsr     L8E95           ; wait for an SCD key
   9714 27 FB         [ 3] 2693         beq     L9701  
   9716 81 01         [ 2] 2694         cmpa    #0x01           ; is it up?
   9718 26 22         [ 3] 2695         bne     L972C           ; no jump ahead
   971A 33            [ 4] 2696         pulb
   971B 37            [ 3] 2697         pshb
   971C 5D            [ 2] 2698         tstb
   971D 27 0A         [ 3] 2699         beq     L9719           ; if B=0, modify 0401 mask  
   971F B6 04 2B      [ 4] 2700         ldaa    (0x042B)        ; else modify 042B mask
   9722 9A 12         [ 3] 2701         oraa    (0x0012)
   9724 B7 04 2B      [ 4] 2702         staa    (0x042B)
   9727 20 08         [ 3] 2703         bra     L9721  
   9729                    2704 L9719:
   9729 B6 04 01      [ 4] 2705         ldaa    (0x0401)
   972C 9A 12         [ 3] 2706         oraa    (0x0012)
   972E B7 04 01      [ 4] 2707         staa    (0x0401)
   9731                    2708 L9721:
   9731 18 DE 46      [ 5] 2709         ldy     (0x0046)
   9734 BD 8E 0D      [ 6] 2710         jsr     L8DFD
   9737 4F            [ 2] 2711         clra
   9738 6E A0         [ 3] 2712         jmp     0xA0,X
   973A 20 A5         [ 3] 2713         bra     L96D1  
   973C                    2714 L972C:
   973C 81 02         [ 2] 2715         cmpa    #0x02
   973E 26 23         [ 3] 2716         bne     L9753  
   9740 33            [ 4] 2717         pulb
   9741 37            [ 3] 2718         pshb
   9742 5D            [ 2] 2719         tstb
   9743 27 0A         [ 3] 2720         beq     L973F  
   9745 B6 04 2B      [ 4] 2721         ldaa    (0x042B)
   9748 94 13         [ 3] 2722         anda    (0x0013)
   974A B7 04 2B      [ 4] 2723         staa    (0x042B)
   974D 20 08         [ 3] 2724         bra     L9747  
   974F                    2725 L973F:
   974F B6 04 01      [ 4] 2726         ldaa    (0x0401)
   9752 94 13         [ 3] 2727         anda    (0x0013)
   9754 B7 04 01      [ 4] 2728         staa    (0x0401)
   9757                    2729 L9747:
   9757 18 DE 46      [ 5] 2730         ldy     (0x0046)
   975A BD 8E 0D      [ 6] 2731         jsr     L8DFD
   975D 4F            [ 2] 2732         clra
   975E 66 E6         [ 6] 2733         ror     0xE6,X
   9760 7E 96 E1      [ 3] 2734         jmp     L96D1
   9763                    2735 L9753:
   9763 81 0D         [ 2] 2736         cmpa    #0x0D
   9765 26 AA         [ 3] 2737         bne     L9701  
   9767 33            [ 4] 2738         pulb
   9768 7E 96 85      [ 3] 2739         jmp     L9675
   976B                    2740 L975B:
   976B 33            [ 4] 2741         pulb
   976C 7E 92 A2      [ 3] 2742         jmp     L9292
                           2743 
                           2744 ; do program rom checksum, and display it on the LCD screen
   976F                    2745 L975F:
   976F CE 00 00      [ 3] 2746         ldx     #0x0000
   9772 18 CE 80 00   [ 4] 2747         ldy     #0x8000
   9776                    2748 L9766:
   9776 18 E6 00      [ 5] 2749         ldab    0,Y     
   9779 18 08         [ 4] 2750         iny
   977B 3A            [ 3] 2751         abx
   977C 18 8C 00 00   [ 5] 2752         cpy     #0x0000
   9780 26 F4         [ 3] 2753         bne     L9766  
   9782 DF 17         [ 4] 2754         stx     (0x0017)        ; store rom checksum here
   9784 96 17         [ 3] 2755         ldaa    (0x0017)        ; get high byte of checksum
   9786 BD 97 AB      [ 6] 2756         jsr     L979B           ; convert it to 2 hex chars
   9789 96 12         [ 3] 2757         ldaa    (0x0012)
   978B C6 33         [ 2] 2758         ldab    #0x33
   978D BD 8D C5      [ 6] 2759         jsr     L8DB5           ; display char 1 here on LCD display
   9790 96 13         [ 3] 2760         ldaa    (0x0013)
   9792 C6 34         [ 2] 2761         ldab    #0x34
   9794 BD 8D C5      [ 6] 2762         jsr     L8DB5           ; display char 2 here on LCD display
   9797 96 18         [ 3] 2763         ldaa    (0x0018)        ; get low byte of checksum
   9799 BD 97 AB      [ 6] 2764         jsr     L979B           ; convert it to 2 hex chars
   979C 96 12         [ 3] 2765         ldaa    (0x0012)
   979E C6 35         [ 2] 2766         ldab    #0x35
   97A0 BD 8D C5      [ 6] 2767         jsr     L8DB5           ; display char 1 here on LCD display
   97A3 96 13         [ 3] 2768         ldaa    (0x0013)
   97A5 C6 36         [ 2] 2769         ldab    #0x36
   97A7 BD 8D C5      [ 6] 2770         jsr     L8DB5           ; display char 2 here on LCD display
   97AA 39            [ 5] 2771         rts
                           2772 
                           2773 ; convert A to ASCII hex digit, store in (0x0012:0x0013)
   97AB                    2774 L979B:
   97AB 36            [ 3] 2775         psha
   97AC 84 0F         [ 2] 2776         anda    #0x0F
   97AE 8B 30         [ 2] 2777         adda    #0x30
   97B0 81 39         [ 2] 2778         cmpa    #0x39
   97B2 23 02         [ 3] 2779         bls     L97A6  
   97B4 8B 07         [ 2] 2780         adda    #0x07
   97B6                    2781 L97A6:
   97B6 97 13         [ 3] 2782         staa    (0x0013)
   97B8 32            [ 4] 2783         pula
   97B9 84 F0         [ 2] 2784         anda    #0xF0
   97BB 44            [ 2] 2785         lsra
   97BC 44            [ 2] 2786         lsra
   97BD 44            [ 2] 2787         lsra
   97BE 44            [ 2] 2788         lsra
   97BF 8B 30         [ 2] 2789         adda    #0x30
   97C1 81 39         [ 2] 2790         cmpa    #0x39
   97C3 23 02         [ 3] 2791         bls     L97B7  
   97C5 8B 07         [ 2] 2792         adda    #0x07
   97C7                    2793 L97B7:
   97C7 97 12         [ 3] 2794         staa    (0x0012)
   97C9 39            [ 5] 2795         rts
                           2796 
   97CA                    2797 L97BA:
   97CA BD 9D 4F      [ 6] 2798         jsr     L9D18
   97CD 24 03         [ 3] 2799         bcc     L97C2  
   97CF 7E 9A 8F      [ 3] 2800         jmp     L9A7F
   97D2                    2801 L97C2:
   97D2 7D 00 79      [ 6] 2802         tst     (0x0079)
   97D5 26 0B         [ 3] 2803         bne     L97D2  
   97D7 FC 04 10      [ 5] 2804         ldd     (0x0410)
   97DA C3 00 01      [ 4] 2805         addd    #0x0001
   97DD FD 04 10      [ 5] 2806         std     (0x0410)
   97E0 20 09         [ 3] 2807         bra     L97DB  
   97E2                    2808 L97D2:
   97E2 FC 04 12      [ 5] 2809         ldd     (0x0412)
   97E5 C3 00 01      [ 4] 2810         addd    #0x0001
   97E8 FD 04 12      [ 5] 2811         std     (0x0412)
   97EB                    2812 L97DB:
   97EB 86 78         [ 2] 2813         ldaa    #0x78
   97ED 97 63         [ 3] 2814         staa    (0x0063)
   97EF 97 64         [ 3] 2815         staa    (0x0064)
   97F1 BD A3 50      [ 6] 2816         jsr     LA313
   97F4 BD AB 18      [ 6] 2817         jsr     LAADB
   97F7 86 01         [ 2] 2818         ldaa    #0x01
   97F9 97 4E         [ 3] 2819         staa    (0x004E)
   97FB 97 76         [ 3] 2820         staa    (0x0076)
   97FD 7F 00 75      [ 6] 2821         clr     (0x0075)
   9800 7F 00 77      [ 6] 2822         clr     (0x0077)
   9803 BD 87 BE      [ 6] 2823         jsr     L87AE
   9806 D6 7B         [ 3] 2824         ldab    (0x007B)
   9808 CA 20         [ 2] 2825         orab    #0x20
   980A C4 F7         [ 2] 2826         andb    #0xF7
   980C BD 87 58      [ 6] 2827         jsr     L8748   
   980F 7E 85 AD      [ 3] 2828         jmp     L85A4
   9812                    2829 L9802:
   9812 7F 00 76      [ 6] 2830         clr     (0x0076)
   9815 7F 00 75      [ 6] 2831         clr     (0x0075)
   9818 7F 00 77      [ 6] 2832         clr     (0x0077)
   981B 7F 00 4E      [ 6] 2833         clr     (0x004E)
   981E D6 7B         [ 3] 2834         ldab    (0x007B)
   9820 CA 0C         [ 2] 2835         orab    #0x0C
   9822 BD 87 58      [ 6] 2836         jsr     L8748
   9825                    2837 L9815:
   9825 BD A3 5B      [ 6] 2838         jsr     LA31E
   9828 BD 86 D4      [ 6] 2839         jsr     L86C4           ; Reset boards 1-10
   982B BD 9C 61      [ 6] 2840         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   982E BD 8E A5      [ 6] 2841         jsr     L8E95
   9831 7E 84 56      [ 3] 2842         jmp     L844D
   9834                    2843 L9824:
   9834 BD 9C 61      [ 6] 2844         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9837 7F 00 4E      [ 6] 2845         clr     (0x004E)
   983A D6 7B         [ 3] 2846         ldab    (0x007B)
   983C CA 24         [ 2] 2847         orab    #0x24
   983E C4 F7         [ 2] 2848         andb    #0xF7
   9840 BD 87 58      [ 6] 2849         jsr     L8748   
   9843 BD 87 BE      [ 6] 2850         jsr     L87AE
   9846 BD 8E A5      [ 6] 2851         jsr     L8E95
   9849 7E 84 56      [ 3] 2852         jmp     L844D
   984C                    2853 L983C:
   984C 7F 00 78      [ 6] 2854         clr     (0x0078)
   984F B6 10 8A      [ 4] 2855         ldaa    (0x108A)
   9852 84 F9         [ 2] 2856         anda    #0xF9
   9854 B7 10 8A      [ 4] 2857         staa    (0x108A)
   9857 7D 00 AF      [ 6] 2858         tst     (0x00AF)
   985A 26 61         [ 3] 2859         bne     L98AD  
   985C 96 62         [ 3] 2860         ldaa    (0x0062)
   985E 84 01         [ 2] 2861         anda    #0x01
   9860 27 5B         [ 3] 2862         beq     L98AD  
   9862 C6 FD         [ 2] 2863         ldab    #0xFD           ; tape deck STOP
   9864 BD 86 F7      [ 6] 2864         jsr     L86E7
   9867 CC 00 32      [ 3] 2865         ldd     #0x0032
   986A DD 1B         [ 4] 2866         std     CDTIMR1
   986C CC 75 30      [ 3] 2867         ldd     #0x7530
   986F DD 1D         [ 4] 2868         std     CDTIMR2
   9871 7F 00 5A      [ 6] 2869         clr     (0x005A)
   9874                    2870 L9864:
   9874 BD 9B 29      [ 6] 2871         jsr     L9B19           ; do the random motions if enabled
   9877 7D 00 31      [ 6] 2872         tst     (0x0031)
   987A 26 04         [ 3] 2873         bne     L9870  
   987C 96 5A         [ 3] 2874         ldaa    (0x005A)
   987E 27 19         [ 3] 2875         beq     L9889  
   9880                    2876 L9870:
   9880 7F 00 31      [ 6] 2877         clr     (0x0031)
   9883 D6 62         [ 3] 2878         ldab    (0x0062)
   9885 C4 FE         [ 2] 2879         andb    #0xFE
   9887 D7 62         [ 3] 2880         stab    (0x0062)
   9889 BD FA F9      [ 6] 2881         jsr     BUTNLIT 
   988C BD AA 50      [ 6] 2882         jsr     LAA13
   988F C6 FB         [ 2] 2883         ldab    #0xFB           ; tape deck PLAY
   9891 BD 86 F7      [ 6] 2884         jsr     L86E7
   9894 7F 00 5A      [ 6] 2885         clr     (0x005A)
   9897 20 4B         [ 3] 2886         bra     L98D4  
   9899                    2887 L9889:
   9899 DC 1B         [ 4] 2888         ldd     CDTIMR1
   989B 26 D7         [ 3] 2889         bne     L9864  
   989D D6 62         [ 3] 2890         ldab    (0x0062)
   989F C8 01         [ 2] 2891         eorb    #0x01
   98A1 D7 62         [ 3] 2892         stab    (0x0062)
   98A3 BD FA F9      [ 6] 2893         jsr     BUTNLIT 
   98A6 C4 01         [ 2] 2894         andb    #0x01
   98A8 26 05         [ 3] 2895         bne     L989F  
   98AA BD AA 49      [ 6] 2896         jsr     LAA0C
   98AD 20 03         [ 3] 2897         bra     L98A2  
   98AF                    2898 L989F:
   98AF BD AA 50      [ 6] 2899         jsr     LAA13
   98B2                    2900 L98A2:
   98B2 CC 00 32      [ 3] 2901         ldd     #0x0032
   98B5 DD 1B         [ 4] 2902         std     CDTIMR1
   98B7 DC 1D         [ 4] 2903         ldd     CDTIMR2
   98B9 27 C5         [ 3] 2904         beq     L9870  
   98BB 20 B7         [ 3] 2905         bra     L9864  
   98BD                    2906 L98AD:
   98BD 7D 00 75      [ 6] 2907         tst     (0x0075)
   98C0 27 03         [ 3] 2908         beq     L98B5  
   98C2 7E 99 49      [ 3] 2909         jmp     L9939
   98C5                    2910 L98B5:
   98C5 96 62         [ 3] 2911         ldaa    (0x0062)
   98C7 84 02         [ 2] 2912         anda    #0x02
   98C9 27 4E         [ 3] 2913         beq     L9909  
   98CB 7D 00 AF      [ 6] 2914         tst     (0x00AF)
   98CE 26 0B         [ 3] 2915         bne     L98CB  
   98D0 FC 04 24      [ 5] 2916         ldd     (0x0424)
   98D3 C3 00 01      [ 4] 2917         addd    #0x0001
   98D6 FD 04 24      [ 5] 2918         std     (0x0424)
   98D9 20 09         [ 3] 2919         bra     L98D4  
   98DB                    2920 L98CB:
   98DB FC 04 22      [ 5] 2921         ldd     (0x0422)
   98DE C3 00 01      [ 4] 2922         addd    #0x0001
   98E1 FD 04 22      [ 5] 2923         std     (0x0422)
   98E4                    2924 L98D4:
   98E4 FC 04 18      [ 5] 2925         ldd     (0x0418)
   98E7 C3 00 01      [ 4] 2926         addd    #0x0001
   98EA FD 04 18      [ 5] 2927         std     (0x0418)
   98ED 86 78         [ 2] 2928         ldaa    #0x78
   98EF 97 63         [ 3] 2929         staa    (0x0063)
   98F1 97 64         [ 3] 2930         staa    (0x0064)
   98F3 D6 62         [ 3] 2931         ldab    (0x0062)
   98F5 C4 F7         [ 2] 2932         andb    #0xF7
   98F7 CA 02         [ 2] 2933         orab    #0x02
   98F9 D7 62         [ 3] 2934         stab    (0x0062)
   98FB BD FA F9      [ 6] 2935         jsr     BUTNLIT 
   98FE BD AA 55      [ 6] 2936         jsr     LAA18
   9901 86 01         [ 2] 2937         ldaa    #0x01
   9903 97 4E         [ 3] 2938         staa    (0x004E)
   9905 97 75         [ 3] 2939         staa    (0x0075)
   9907 D6 7B         [ 3] 2940         ldab    (0x007B)
   9909 C4 DF         [ 2] 2941         andb    #0xDF
   990B BD 87 58      [ 6] 2942         jsr     L8748   
   990E BD 87 BE      [ 6] 2943         jsr     L87AE
   9911 BD A3 50      [ 6] 2944         jsr     LA313
   9914 BD AB 18      [ 6] 2945         jsr     LAADB
   9917 20 30         [ 3] 2946         bra     L9939  
   9919                    2947 L9909:
   9919 D6 62         [ 3] 2948         ldab    (0x0062)
   991B C4 F5         [ 2] 2949         andb    #0xF5
   991D CA 40         [ 2] 2950         orab    #0x40
   991F D7 62         [ 3] 2951         stab    (0x0062)
   9921 BD FA F9      [ 6] 2952         jsr     BUTNLIT 
   9924 BD AA 5A      [ 6] 2953         jsr     LAA1D
   9927 7D 00 AF      [ 6] 2954         tst     (0x00AF)
   992A 26 04         [ 3] 2955         bne     L9920  
   992C C6 01         [ 2] 2956         ldab    #0x01
   992E D7 B6         [ 3] 2957         stab    (0x00B6)
   9930                    2958 L9920:
   9930 BD 9C 61      [ 6] 2959         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9933 7F 00 4E      [ 6] 2960         clr     (0x004E)
   9936 7F 00 75      [ 6] 2961         clr     (0x0075)
   9939 86 01         [ 2] 2962         ldaa    #0x01
   993B 97 77         [ 3] 2963         staa    (0x0077)
   993D D6 7B         [ 3] 2964         ldab    (0x007B)
   993F CA 24         [ 2] 2965         orab    #0x24
   9941 C4 F7         [ 2] 2966         andb    #0xF7
   9943 BD 87 58      [ 6] 2967         jsr     L8748   
   9946 BD 87 A1      [ 6] 2968         jsr     L8791   
   9949                    2969 L9939:
   9949 7F 00 AF      [ 6] 2970         clr     (0x00AF)
   994C 7E 85 AD      [ 3] 2971         jmp     L85A4
   994F                    2972 L993F:
   994F 7F 00 77      [ 6] 2973         clr     (0x0077)
   9952 BD 9C 61      [ 6] 2974         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9955 7F 00 4E      [ 6] 2975         clr     (0x004E)
   9958 D6 62         [ 3] 2976         ldab    (0x0062)
   995A C4 BF         [ 2] 2977         andb    #0xBF
   995C 7D 00 75      [ 6] 2978         tst     (0x0075)
   995F 27 02         [ 3] 2979         beq     L9953  
   9961 C4 FD         [ 2] 2980         andb    #0xFD
   9963                    2981 L9953:
   9963 D7 62         [ 3] 2982         stab    (0x0062)
   9965 BD FA F9      [ 6] 2983         jsr     BUTNLIT 
   9968 BD AA 5A      [ 6] 2984         jsr     LAA1D
   996B 7F 00 5B      [ 6] 2985         clr     (0x005B)
   996E BD 87 BE      [ 6] 2986         jsr     L87AE
   9971 D6 7B         [ 3] 2987         ldab    (0x007B)
   9973 CA 20         [ 2] 2988         orab    #0x20
   9975 BD 87 58      [ 6] 2989         jsr     L8748   
   9978 7F 00 75      [ 6] 2990         clr     (0x0075)
   997B 7F 00 76      [ 6] 2991         clr     (0x0076)
   997E 7E 98 25      [ 3] 2992         jmp     L9815
   9981                    2993 L9971:
   9981 D6 7B         [ 3] 2994         ldab    (0x007B)
   9983 C4 FB         [ 2] 2995         andb    #0xFB
   9985 BD 87 58      [ 6] 2996         jsr     L8748   
   9988 7E 85 AD      [ 3] 2997         jmp     L85A4
   998B                    2998 L997B:
   998B D6 7B         [ 3] 2999         ldab    (0x007B)
   998D CA 04         [ 2] 3000         orab    #0x04
   998F BD 87 58      [ 6] 3001         jsr     L8748   
   9992 7E 85 AD      [ 3] 3002         jmp     L85A4
   9995                    3003 L9985:
   9995 D6 7B         [ 3] 3004         ldab    (0x007B)
   9997 C4 F7         [ 2] 3005         andb    #0xF7
   9999 BD 87 58      [ 6] 3006         jsr     L8748   
   999C 7E 85 AD      [ 3] 3007         jmp     L85A4
   999F                    3008 L998F:
   999F 7D 00 77      [ 6] 3009         tst     (0x0077)
   99A2 26 07         [ 3] 3010         bne     L999B
   99A4 D6 7B         [ 3] 3011         ldab    (0x007B)
   99A6 CA 08         [ 2] 3012         orab    #0x08
   99A8 BD 87 58      [ 6] 3013         jsr     L8748   
   99AB                    3014 L999B:
   99AB 7E 85 AD      [ 3] 3015         jmp     L85A4
   99AE                    3016 L999E:
   99AE D6 7B         [ 3] 3017         ldab    (0x007B)
   99B0 C4 F3         [ 2] 3018         andb    #0xF3
   99B2 BD 87 58      [ 6] 3019         jsr     L8748   
   99B5 39            [ 5] 3020         rts
                           3021 
                           3022 ; main2
   99B6                    3023 L99A6:
   99B6 D6 7B         [ 3] 3024         ldab    (0x007B)
   99B8 C4 DF         [ 2] 3025         andb    #0xDF           ; clear bit 5
   99BA BD 87 58      [ 6] 3026         jsr     L8748
   99BD BD 87 A1      [ 6] 3027         jsr     L8791   
   99C0 39            [ 5] 3028         rts
                           3029 
   99C1                    3030 L99B1:
   99C1 D6 7B         [ 3] 3031         ldab    (0x007B)
   99C3 CA 20         [ 2] 3032         orab    #0x20
   99C5 BD 87 58      [ 6] 3033         jsr     L8748   
   99C8 BD 87 BE      [ 6] 3034         jsr     L87AE
   99CB 39            [ 5] 3035         rts
                           3036 
   99CC D6 7B         [ 3] 3037         ldab    (0x007B)
   99CE C4 DF         [ 2] 3038         andb    #0xDF
   99D0 BD 87 58      [ 6] 3039         jsr     L8748   
   99D3 BD 87 BE      [ 6] 3040         jsr     L87AE
   99D6 39            [ 5] 3041         rts
                           3042 
   99D7 D6 7B         [ 3] 3043         ldab    (0x007B)
   99D9 CA 20         [ 2] 3044         orab    #0x20
   99DB BD 87 58      [ 6] 3045         jsr     L8748   
   99DE BD 87 A1      [ 6] 3046         jsr     L8791   
   99E1 39            [ 5] 3047         rts
                           3048 
   99E2                    3049 L99D2:
   99E2 86 01         [ 2] 3050         ldaa    #0x01
   99E4 97 78         [ 3] 3051         staa    (0x0078)
   99E6 7E 85 AD      [ 3] 3052         jmp     L85A4
   99E9                    3053 L99D9:
   99E9 CE 0E 20      [ 3] 3054         ldx     #0x0E20
   99EC A6 00         [ 4] 3055         ldaa    0,X     
   99EE 80 30         [ 2] 3056         suba    #0x30
   99F0 C6 0A         [ 2] 3057         ldab    #0x0A
   99F2 3D            [10] 3058         mul
   99F3 17            [ 2] 3059         tba                     ; (0E20)*10 into A
   99F4 C6 64         [ 2] 3060         ldab    #0x64
   99F6 3D            [10] 3061         mul
   99F7 DD 17         [ 4] 3062         std     (0x0017)        ; (0E20)*1000 into 17:18
   99F9 A6 01         [ 4] 3063         ldaa    1,X
   99FB 80 30         [ 2] 3064         suba    #0x30
   99FD C6 64         [ 2] 3065         ldab    #0x64
   99FF 3D            [10] 3066         mul
   9A00 D3 17         [ 5] 3067         addd    (0x0017)
   9A02 DD 17         [ 4] 3068         std     (0x0017)        ; (0E20)*1000+(0E21)*100 into 17:18
   9A04 A6 02         [ 4] 3069         ldaa    2,X     
   9A06 80 30         [ 2] 3070         suba    #0x30
   9A08 C6 0A         [ 2] 3071         ldab    #0x0A
   9A0A 3D            [10] 3072         mul
   9A0B D3 17         [ 5] 3073         addd    (0x0017)    
   9A0D DD 17         [ 4] 3074         std     (0x0017)        ; (0E20)*1000+(0E21)*100+(0E22)*10 into 17:18
   9A0F 4F            [ 2] 3075         clra
   9A10 E6 03         [ 4] 3076         ldab    3,X     
   9A12 C0 30         [ 2] 3077         subb    #0x30
   9A14 D3 17         [ 5] 3078         addd    (0x0017)    
   9A16 FD 02 9C      [ 5] 3079         std     (0x029C)        ; (0E20)*1000+(0E21)*100+(0E22)*10+(0E23) into (029C:029D)
   9A19 CE 0E 20      [ 3] 3080         ldx     #0x0E20
   9A1C                    3081 L9A0C:
   9A1C A6 00         [ 4] 3082         ldaa    0,X         
   9A1E 81 30         [ 2] 3083         cmpa    #0x30
   9A20 25 13         [ 3] 3084         bcs     L9A25  
   9A22 81 39         [ 2] 3085         cmpa    #0x39
   9A24 22 0F         [ 3] 3086         bhi     L9A25  
   9A26 08            [ 3] 3087         inx
   9A27 8C 0E 24      [ 4] 3088         cpx     #0x0E24
   9A2A 26 F0         [ 3] 3089         bne     L9A0C  
   9A2C B6 0E 24      [ 4] 3090         ldaa    (0x0E24)        ; check EEPROM signature
   9A2F 81 DB         [ 2] 3091         cmpa    #0xDB
   9A31 26 02         [ 3] 3092         bne     L9A25  
   9A33 0C            [ 2] 3093         clc                     ; if sig good, return carry clear
   9A34 39            [ 5] 3094         rts
                           3095 
   9A35                    3096 L9A25:
   9A35 0D            [ 2] 3097         sec                     ; if sig bad, return carry clear
   9A36 39            [ 5] 3098         rts
                           3099 
   9A37                    3100 L9A27:
   9A37 BD 8D F4      [ 6] 3101         jsr     LCDMSG1 
   9A3A 53 65 72 69 61 6C  3102         .ascis  'Serial# '
        23 A0
                           3103 
   9A42 BD 8D ED      [ 6] 3104         jsr     LCDMSG2 
   9A45 20 20 20 20 20 20  3105         .ascis  '               '
        20 20 20 20 20 20
        20 20 A0
                           3106 
                           3107 ; display 4-digit serial number
   9A54 C6 08         [ 2] 3108         ldab    #0x08
   9A56 18 CE 0E 20   [ 4] 3109         ldy     #0x0E20
   9A5A                    3110 L9A4A:
   9A5A 18 A6 00      [ 5] 3111         ldaa    0,Y     
   9A5D 18 3C         [ 5] 3112         pshy
   9A5F 37            [ 3] 3113         pshb
   9A60 BD 8D C5      [ 6] 3114         jsr     L8DB5            ; display char here on LCD display
   9A63 33            [ 4] 3115         pulb
   9A64 18 38         [ 6] 3116         puly
   9A66 5C            [ 2] 3117         incb
   9A67 18 08         [ 4] 3118         iny
   9A69 18 8C 0E 24   [ 5] 3119         cpy     #0x0E24
   9A6D 26 EB         [ 3] 3120         bne     L9A4A  
   9A6F 39            [ 5] 3121         rts
                           3122 
                           3123 ; Unused?
   9A70                    3124 L9A60:
   9A70 86 01         [ 2] 3125         ldaa    #0x01
   9A72 97 B5         [ 3] 3126         staa    (0x00B5)
   9A74 96 4E         [ 3] 3127         ldaa    (0x004E)
   9A76 97 7F         [ 3] 3128         staa    (0x007F)
   9A78 96 62         [ 3] 3129         ldaa    (0x0062)
   9A7A 97 80         [ 3] 3130         staa    (0x0080)
   9A7C 96 7B         [ 3] 3131         ldaa    (0x007B)
   9A7E 97 81         [ 3] 3132         staa    (0x0081)
   9A80 96 7A         [ 3] 3133         ldaa    (0x007A)
   9A82 97 82         [ 3] 3134         staa    (0x0082)
   9A84 96 78         [ 3] 3135         ldaa    (0x0078)
   9A86 97 7D         [ 3] 3136         staa    (0x007D)
   9A88 B6 10 8A      [ 4] 3137         ldaa    (0x108A)
   9A8B 84 06         [ 2] 3138         anda    #0x06
   9A8D 97 7E         [ 3] 3139         staa    (0x007E)
   9A8F                    3140 L9A7F:
   9A8F C6 EF         [ 2] 3141         ldab    #0xEF           ; tape deck EJECT
   9A91 BD 86 F7      [ 6] 3142         jsr     L86E7
   9A94 D6 7B         [ 3] 3143         ldab    (0x007B)
   9A96 CA 0C         [ 2] 3144         orab    #0x0C
   9A98 C4 DF         [ 2] 3145         andb    #0xDF
   9A9A BD 87 58      [ 6] 3146         jsr     L8748   
   9A9D BD 87 A1      [ 6] 3147         jsr     L8791   
   9AA0 BD 86 D4      [ 6] 3148         jsr     L86C4           ; Reset boards 1-10
   9AA3 BD 9C 61      [ 6] 3149         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9AA6 C6 06         [ 2] 3150         ldab    #0x06           ; delay 6 secs
   9AA8 BD 8C 12      [ 6] 3151         jsr     DLYSECS         ;
   9AAB BD 8E A5      [ 6] 3152         jsr     L8E95
   9AAE BD 99 B6      [ 6] 3153         jsr     L99A6
   9AB1 7E 81 BA      [ 3] 3154         jmp     L81BD
   9AB4                    3155 L9AA4:
   9AB4 7F 00 5C      [ 6] 3156         clr     (0x005C)
   9AB7 86 01         [ 2] 3157         ldaa    #0x01
   9AB9 97 79         [ 3] 3158         staa    (0x0079)
   9ABB C6 FD         [ 2] 3159         ldab    #0xFD           ; tape deck STOP
   9ABD BD 86 F7      [ 6] 3160         jsr     L86E7
   9AC0 BD 8E A5      [ 6] 3161         jsr     L8E95
   9AC3 CC 75 30      [ 3] 3162         ldd     #0x7530
   9AC6 DD 1D         [ 4] 3163         std     CDTIMR2
   9AC8                    3164 L9AB8:
   9AC8 BD 9B 29      [ 6] 3165         jsr     L9B19           ; do the random motions if enabled
   9ACB D6 62         [ 3] 3166         ldab    (0x0062)
   9ACD C8 04         [ 2] 3167         eorb    #0x04
   9ACF D7 62         [ 3] 3168         stab    (0x0062)
   9AD1 BD FA F9      [ 6] 3169         jsr     BUTNLIT 
   9AD4 F6 18 04      [ 4] 3170         ldab    PIA0PRA 
   9AD7 C8 08         [ 2] 3171         eorb    #0x08
   9AD9 F7 18 04      [ 4] 3172         stab    PIA0PRA 
   9ADC 7D 00 5C      [ 6] 3173         tst     (0x005C)
   9ADF 26 12         [ 3] 3174         bne     L9AE3  
   9AE1 BD 8E A5      [ 6] 3175         jsr     L8E95
   9AE4 81 0D         [ 2] 3176         cmpa    #0x0D
   9AE6 27 0B         [ 3] 3177         beq     L9AE3  
   9AE8 C6 32         [ 2] 3178         ldab    #0x32           ; delay 0.5 sec
   9AEA BD 8C 32      [ 6] 3179         jsr     DLYSECSBY100
   9AED DC 1D         [ 4] 3180         ldd     CDTIMR2
   9AEF 27 02         [ 3] 3181         beq     L9AE3  
   9AF1 20 D5         [ 3] 3182         bra     L9AB8  
   9AF3                    3183 L9AE3:
   9AF3 D6 62         [ 3] 3184         ldab    (0x0062)
   9AF5 C4 FB         [ 2] 3185         andb    #0xFB
   9AF7 D7 62         [ 3] 3186         stab    (0x0062)
   9AF9 BD FA F9      [ 6] 3187         jsr     BUTNLIT 
   9AFC BD A3 91      [ 6] 3188         jsr     LA354
   9AFF C6 FB         [ 2] 3189         ldab    #0xFB           ; tape deck PLAY
   9B01 BD 86 F7      [ 6] 3190         jsr     L86E7
   9B04 7E 85 AD      [ 3] 3191         jmp     L85A4
   9B07                    3192 L9AF7:
   9B07 7F 00 75      [ 6] 3193         clr     (0x0075)
   9B0A 7F 00 76      [ 6] 3194         clr     (0x0076)
   9B0D 7F 00 77      [ 6] 3195         clr     (0x0077)
   9B10 7F 00 78      [ 6] 3196         clr     (0x0078)
   9B13 7F 00 25      [ 6] 3197         clr     (0x0025)
   9B16 7F 00 26      [ 6] 3198         clr     (0x0026)
   9B19 7F 00 4E      [ 6] 3199         clr     (0x004E)
   9B1C 7F 00 30      [ 6] 3200         clr     (0x0030)        ; clear SCD key states
   9B1F 7F 00 31      [ 6] 3201         clr     (0x0031)
   9B22 7F 00 32      [ 6] 3202         clr     (0x0032)
   9B25 7F 00 AF      [ 6] 3203         clr     (0x00AF)
   9B28 39            [ 5] 3204         rts
                           3205 
                           3206 ; do the random motions if enabled
   9B29                    3207 L9B19:
   9B29 36            [ 3] 3208         psha
   9B2A 37            [ 3] 3209         pshb
   9B2B 96 4E         [ 3] 3210         ldaa    (0x004E)
   9B2D 27 17         [ 3] 3211         beq     L9B36           ; go to 0401 logic
   9B2F 96 63         [ 3] 3212         ldaa    (0x0063)        ; check countdown timer
   9B31 26 10         [ 3] 3213         bne     L9B33           ; exit
   9B33 7D 00 64      [ 6] 3214         tst     (0x0064)
   9B36 27 09         [ 3] 3215         beq     L9B31           ; go to 0401 logic
   9B38 BD 86 D4      [ 6] 3216         jsr     L86C4           ; Reset boards 1-10
   9B3B BD 9C 61      [ 6] 3217         jsr     L9C51           ; Reset random motions, init board 7/8 bits
   9B3E 7F 00 64      [ 6] 3218         clr     (0x0064)
   9B41                    3219 L9B31:
   9B41 20 03         [ 3] 3220         bra     L9B36           ; go to 0401 logic
   9B43                    3221 L9B33:
   9B43 33            [ 4] 3222         pulb
   9B44 32            [ 4] 3223         pula
   9B45 39            [ 5] 3224         rts
                           3225 
                           3226 ; end up here immediately if:
                           3227 ; 0x004E == 00 or
                           3228 ; 0x0063, 0x0064 == 0 or
                           3229 ; 
                           3230 ; do subroutines based on bits 0-4 of 0x0401?
   9B46                    3231 L9B36:
   9B46 B6 04 01      [ 4] 3232         ldaa    (0x0401)
   9B49 84 01         [ 2] 3233         anda    #0x01
   9B4B 27 03         [ 3] 3234         beq     L9B40  
   9B4D BD 9B 7B      [ 6] 3235         jsr     L9B6B           ; bit 0 routine
   9B50                    3236 L9B40:
   9B50 B6 04 01      [ 4] 3237         ldaa    (0x0401)
   9B53 84 02         [ 2] 3238         anda    #0x02
   9B55 27 03         [ 3] 3239         beq     L9B4A  
   9B57 BD 9B A9      [ 6] 3240         jsr     L9B99           ; bit 1 routine
   9B5A                    3241 L9B4A:
   9B5A B6 04 01      [ 4] 3242         ldaa    (0x0401)
   9B5D 84 04         [ 2] 3243         anda    #0x04
   9B5F 27 03         [ 3] 3244         beq     L9B54  
   9B61 BD 9B D7      [ 6] 3245         jsr     L9BC7           ; bit 2 routine
   9B64                    3246 L9B54:
   9B64 B6 04 01      [ 4] 3247         ldaa    (0x0401)
   9B67 84 08         [ 2] 3248         anda    #0x08
   9B69 27 03         [ 3] 3249         beq     L9B5E  
   9B6B BD 9C 05      [ 6] 3250         jsr     L9BF5           ; bit 3 routine
   9B6E                    3251 L9B5E:
   9B6E B6 04 01      [ 4] 3252         ldaa    (0x0401)
   9B71 84 10         [ 2] 3253         anda    #0x10
   9B73 27 03         [ 3] 3254         beq     L9B68  
   9B75 BD 9C 33      [ 6] 3255         jsr     L9C23           ; bit 4 routine
   9B78                    3256 L9B68:
   9B78 33            [ 4] 3257         pulb
   9B79 32            [ 4] 3258         pula
   9B7A 39            [ 5] 3259         rts
                           3260 
                           3261 ; bit 0 routine
   9B7B                    3262 L9B6B:
   9B7B 18 3C         [ 5] 3263         pshy
   9B7D 18 DE 65      [ 5] 3264         ldy     (0x0065)
   9B80 18 A6 00      [ 5] 3265         ldaa    0,Y     
   9B83 81 FF         [ 2] 3266         cmpa    #0xFF
   9B85 27 14         [ 3] 3267         beq     L9B8B  
   9B87 91 70         [ 3] 3268         cmpa    OFFCNT1
   9B89 25 0D         [ 3] 3269         bcs     L9B88  
   9B8B 18 08         [ 4] 3270         iny
   9B8D 18 A6 00      [ 5] 3271         ldaa    0,Y     
   9B90 B7 10 80      [ 4] 3272         staa    (0x1080)        ; do some stuff to board 1
   9B93 18 08         [ 4] 3273         iny
   9B95 18 DF 65      [ 5] 3274         sty     (0x0065)
   9B98                    3275 L9B88:
   9B98 18 38         [ 6] 3276         puly
   9B9A 39            [ 5] 3277         rts
   9B9B                    3278 L9B8B:
   9B9B 18 CE B3 28   [ 4] 3279         ldy     #LB2EB
   9B9F 18 DF 65      [ 5] 3280         sty     (0x0065)
   9BA2 86 FA         [ 2] 3281         ldaa    #0xFA
   9BA4 97 70         [ 3] 3282         staa    OFFCNT1
   9BA6 7E 9B 98      [ 3] 3283         jmp     L9B88
                           3284 
                           3285 ; bit 1 routine
   9BA9                    3286 L9B99:
   9BA9 18 3C         [ 5] 3287         pshy
   9BAB 18 DE 67      [ 5] 3288         ldy     (0x0067)
   9BAE 18 A6 00      [ 5] 3289         ldaa    0,Y     
   9BB1 81 FF         [ 2] 3290         cmpa    #0xFF
   9BB3 27 14         [ 3] 3291         beq     L9BB9  
   9BB5 91 71         [ 3] 3292         cmpa    OFFCNT2
   9BB7 25 0D         [ 3] 3293         bcs     L9BB6  
   9BB9 18 08         [ 4] 3294         iny
   9BBB 18 A6 00      [ 5] 3295         ldaa    0,Y     
   9BBE B7 10 84      [ 4] 3296         staa    (0x1084)        ; do some stuff to board 2
   9BC1 18 08         [ 4] 3297         iny
   9BC3 18 DF 67      [ 5] 3298         sty     (0x0067)
   9BC6                    3299 L9BB6:
   9BC6 18 38         [ 6] 3300         puly
   9BC8 39            [ 5] 3301         rts
   9BC9                    3302 L9BB9:
   9BC9 18 CE B3 FA   [ 4] 3303         ldy     #LB3BD
   9BCD 18 DF 67      [ 5] 3304         sty     (0x0067)
   9BD0 86 E6         [ 2] 3305         ldaa    #0xE6
   9BD2 97 71         [ 3] 3306         staa    OFFCNT2
   9BD4 7E 9B C6      [ 3] 3307         jmp     L9BB6
                           3308 
                           3309 ; bit 2 routine
   9BD7                    3310 L9BC7:
   9BD7 18 3C         [ 5] 3311         pshy
   9BD9 18 DE 69      [ 5] 3312         ldy     (0x0069)
   9BDC 18 A6 00      [ 5] 3313         ldaa    0,Y     
   9BDF 81 FF         [ 2] 3314         cmpa    #0xFF
   9BE1 27 14         [ 3] 3315         beq     L9BE7  
   9BE3 91 72         [ 3] 3316         cmpa    OFFCNT3
   9BE5 25 0D         [ 3] 3317         bcs     L9BE4  
   9BE7 18 08         [ 4] 3318         iny
   9BE9 18 A6 00      [ 5] 3319         ldaa    0,Y     
   9BEC B7 10 88      [ 4] 3320         staa    (0x1088)        ; do some stuff to board 3
   9BEF 18 08         [ 4] 3321         iny
   9BF1 18 DF 69      [ 5] 3322         sty     (0x0069)
   9BF4                    3323 L9BE4:
   9BF4 18 38         [ 6] 3324         puly
   9BF6 39            [ 5] 3325         rts
   9BF7                    3326 L9BE7:
   9BF7 18 CE B5 6E   [ 4] 3327         ldy     #LB531
   9BFB 18 DF 69      [ 5] 3328         sty     (0x0069)
   9BFE 86 D2         [ 2] 3329         ldaa    #0xD2
   9C00 97 72         [ 3] 3330         staa    OFFCNT3
   9C02 7E 9B F4      [ 3] 3331         jmp     L9BE4
                           3332 
                           3333 ; bit 3 routine
   9C05                    3334 L9BF5:
   9C05 18 3C         [ 5] 3335         pshy
   9C07 18 DE 6B      [ 5] 3336         ldy     (0x006B)
   9C0A 18 A6 00      [ 5] 3337         ldaa    0,Y     
   9C0D 81 FF         [ 2] 3338         cmpa    #0xFF
   9C0F 27 14         [ 3] 3339         beq     L9C15  
   9C11 91 73         [ 3] 3340         cmpa    OFFCNT4
   9C13 25 0D         [ 3] 3341         bcs     L9C12  
   9C15 18 08         [ 4] 3342         iny
   9C17 18 A6 00      [ 5] 3343         ldaa    0,Y     
   9C1A B7 10 8C      [ 4] 3344         staa    (0x108C)        ; do some stuff to board 4
   9C1D 18 08         [ 4] 3345         iny
   9C1F 18 DF 6B      [ 5] 3346         sty     (0x006B)
   9C22                    3347 L9C12:
   9C22 18 38         [ 6] 3348         puly
   9C24 39            [ 5] 3349         rts
   9C25                    3350 L9C15:
   9C25 18 CE B4 B2   [ 4] 3351         ldy     #LB475
   9C29 18 DF 6B      [ 5] 3352         sty     (0x006B)
   9C2C 86 BE         [ 2] 3353         ldaa    #0xBE
   9C2E 97 73         [ 3] 3354         staa    OFFCNT4
   9C30 7E 9C 22      [ 3] 3355         jmp     L9C12
                           3356 
                           3357 ; bit 4 routine
   9C33                    3358 L9C23:
   9C33 18 3C         [ 5] 3359         pshy
   9C35 18 DE 6D      [ 5] 3360         ldy     (0x006D)
   9C38 18 A6 00      [ 5] 3361         ldaa    0,Y     
   9C3B 81 FF         [ 2] 3362         cmpa    #0xFF
   9C3D 27 14         [ 3] 3363         beq     L9C43  
   9C3F 91 74         [ 3] 3364         cmpa    OFFCNT5
   9C41 25 0D         [ 3] 3365         bcs     L9C40  
   9C43 18 08         [ 4] 3366         iny
   9C45 18 A6 00      [ 5] 3367         ldaa    0,Y     
   9C48 B7 10 90      [ 4] 3368         staa    (0x1090)        ; do some stuff to board 5
   9C4B 18 08         [ 4] 3369         iny
   9C4D 18 DF 6D      [ 5] 3370         sty     (0x006D)
   9C50                    3371 L9C40:
   9C50 18 38         [ 6] 3372         puly
   9C52 39            [ 5] 3373         rts
   9C53                    3374 L9C43:
   9C53 18 CE B6 00   [ 4] 3375         ldy     #LB5C3
   9C57 18 DF 6D      [ 5] 3376         sty     (0x006D)
   9C5A 86 AA         [ 2] 3377         ldaa    #0xAA
   9C5C 97 74         [ 3] 3378         staa    OFFCNT5
   9C5E 7E 9C 50      [ 3] 3379         jmp     L9C40
                           3380 
                           3381 ; Reset offset counters to initial values
   9C61                    3382 L9C51:
   9C61 86 FA         [ 2] 3383         ldaa    #0xFA
   9C63 97 70         [ 3] 3384         staa    OFFCNT1
   9C65 86 E6         [ 2] 3385         ldaa    #0xE6
   9C67 97 71         [ 3] 3386         staa    OFFCNT2
   9C69 86 D2         [ 2] 3387         ldaa    #0xD2
   9C6B 97 72         [ 3] 3388         staa    OFFCNT3
   9C6D 86 BE         [ 2] 3389         ldaa    #0xBE
   9C6F 97 73         [ 3] 3390         staa    OFFCNT4
   9C71 86 AA         [ 2] 3391         ldaa    #0xAA
   9C73 97 74         [ 3] 3392         staa    OFFCNT5
                           3393 
                           3394         ; int random movement table pointers
   9C75 18 CE B3 28   [ 4] 3395         ldy     #LB2EB
   9C79 18 DF 65      [ 5] 3396         sty     (0x0065)
   9C7C 18 CE B3 FA   [ 4] 3397         ldy     #LB3BD
   9C80 18 DF 67      [ 5] 3398         sty     (0x0067)
   9C83 18 CE B5 6E   [ 4] 3399         ldy     #LB531
   9C87 18 DF 69      [ 5] 3400         sty     (0x0069)
   9C8A 18 CE B4 B2   [ 4] 3401         ldy     #LB475
   9C8E 18 DF 6B      [ 5] 3402         sty     (0x006B)
   9C91 18 CE B6 00   [ 4] 3403         ldy     #LB5C3
   9C95 18 DF 6D      [ 5] 3404         sty     (0x006D)
                           3405 
                           3406         ; clear board 8
   9C98 7F 10 9C      [ 6] 3407         clr     (0x109C)
   9C9B 7F 10 9E      [ 6] 3408         clr     (0x109E)
                           3409 
                           3410         ; if bit 5 of 0401 is set, turn on 3 bits on board 8
   9C9E B6 04 01      [ 4] 3411         ldaa    (0x0401)
   9CA1 84 20         [ 2] 3412         anda    #0x20
   9CA3 27 08         [ 3] 3413         beq     L9C9D
   9CA5 B6 10 9C      [ 4] 3414         ldaa    (0x109C)
   9CA8 8A 19         [ 2] 3415         oraa    #0x19
   9CAA B7 10 9C      [ 4] 3416         staa    (0x109C)
                           3417         ; if bit 6 of 0401 is set, turn on 3 bits on board 8
   9CAD                    3418 L9C9D:
   9CAD B6 04 01      [ 4] 3419         ldaa    (0x0401)
   9CB0 84 40         [ 2] 3420         anda    #0x40
   9CB2 27 10         [ 3] 3421         beq     L9CB4  
   9CB4 B6 10 9C      [ 4] 3422         ldaa    (0x109C)
   9CB7 8A 44         [ 2] 3423         oraa    #0x44
   9CB9 B7 10 9C      [ 4] 3424         staa    (0x109C)
   9CBC B6 10 9E      [ 4] 3425         ldaa    (0x109E)
   9CBF 8A 40         [ 2] 3426         oraa    #0x40
   9CC1 B7 10 9E      [ 4] 3427         staa    (0x109E)
                           3428         ; if bit 7 of 0401 is set, turn on 3 bits on board 8
   9CC4                    3429 L9CB4:
   9CC4 B6 04 01      [ 4] 3430         ldaa    (0x0401)
   9CC7 84 80         [ 2] 3431         anda    #0x80
   9CC9 27 08         [ 3] 3432         beq     L9CC3  
   9CCB B6 10 9C      [ 4] 3433         ldaa    (0x109C)
   9CCE 8A A2         [ 2] 3434         oraa    #0xA2
   9CD0 B7 10 9C      [ 4] 3435         staa    (0x109C)
                           3436 
   9CD3                    3437 L9CC3:
                           3438         ; if bit 0 of 042B is set, turn on 1 bit on board 7
   9CD3 B6 04 2B      [ 4] 3439         ldaa    (0x042B)
   9CD6 84 01         [ 2] 3440         anda    #0x01
   9CD8 27 08         [ 3] 3441         beq     L9CD2  
   9CDA B6 10 9A      [ 4] 3442         ldaa    (0x109A)
   9CDD 8A 80         [ 2] 3443         oraa    #0x80
   9CDF B7 10 9A      [ 4] 3444         staa    (0x109A)
   9CE2                    3445 L9CD2:
                           3446         ; if bit 1 of 042B is set, turn on 1 bit on board 8
   9CE2 B6 04 2B      [ 4] 3447         ldaa    (0x042B)
   9CE5 84 02         [ 2] 3448         anda    #0x02
   9CE7 27 08         [ 3] 3449         beq     L9CE1  
   9CE9 B6 10 9E      [ 4] 3450         ldaa    (0x109E)
   9CEC 8A 04         [ 2] 3451         oraa    #0x04
   9CEE B7 10 9E      [ 4] 3452         staa    (0x109E)
   9CF1                    3453 L9CE1:
                           3454         ; if bit 2 of 042B is set, turn on 1 bit on board 8
   9CF1 B6 04 2B      [ 4] 3455         ldaa    (0x042B)
   9CF4 84 04         [ 2] 3456         anda    #0x04
   9CF6 27 08         [ 3] 3457         beq     L9CF0  
   9CF8 B6 10 9E      [ 4] 3458         ldaa    (0x109E)
   9CFB 8A 08         [ 2] 3459         oraa    #0x08
   9CFD B7 10 9E      [ 4] 3460         staa    (0x109E)
   9D00                    3461 L9CF0:
   9D00 39            [ 5] 3462         rts
                           3463 
                           3464 ; Display Credits
   9D01                    3465 L9CF1:
   9D01 BD 8D F4      [ 6] 3466         jsr     LCDMSG1 
   9D04 20 20 20 50 72 6F  3467         .ascis  '   Program by   '
        67 72 61 6D 20 62
        79 20 20 A0
                           3468 
   9D14 BD 8D ED      [ 6] 3469         jsr     LCDMSG2 
   9D17 44 61 76 69 64 20  3470         .ascis  'David  Philipsen'
        20 50 68 69 6C 69
        70 73 65 EE
                           3471 
   9D27 39            [ 5] 3472         rts
                           3473 
   9D28 BD 8D F4      [ 6] 3474         jsr     LCDMSG1                 ; NEW
   9D2B 50 72 65 73 73 20  3475         .ascis  'Press Enter for '      ; NEW
        45 6E 74 65 72 20
        66 6F 72 A0
   9D3B BD 8D ED      [ 6] 3476         jsr     LCDMSG2                 ; NEW
   9D3E 44 69 61 67 6E 6F  3477         .ascis  'Diagnostics     '      ; NEW
        73 74 69 63 73 20
        20 20 20 A0
   9D4E 39            [ 5] 3478         rts                             ; NEW
                           3479 
   9D4F                    3480 L9D18:
   9D4F 0C            [ 2] 3481         clc                             ; NEW
   9D50 C6 01         [ 2] 3482         ldab    #0x01                   ; NEW
   9D52 D7 B8         [ 3] 3483         stab    (0x00B8)                ; NEW
   9D54 39            [ 5] 3484         rts                             ; NEW
                           3485 
   9D55 97 49         [ 3] 3486         staa    (0x0049)
   9D57 7F 00 B8      [ 6] 3487         clr     (0x00B8)
   9D5A BD 8D 13      [ 6] 3488         jsr     L8D03
   9D5D 86 2A         [ 2] 3489         ldaa    #0x2A           ;'*'
   9D5F C6 28         [ 2] 3490         ldab    #0x28
   9D61 BD 8D C5      [ 6] 3491         jsr     L8DB5           ; display char here on LCD display
   9D64 CC 0B B8      [ 3] 3492         ldd     #0x0BB8         ; start 30 second timer?
   9D67 DD 1B         [ 4] 3493         std     CDTIMR1
   9D69                    3494 L9D2C:
   9D69 BD 9B 29      [ 6] 3495         jsr     L9B19           ; do the random motions if enabled
   9D6C 96 49         [ 3] 3496         ldaa    (0x0049)
   9D6E 81 41         [ 2] 3497         cmpa    #0x41
   9D70 27 04         [ 3] 3498         beq     L9D39  
   9D72 81 4B         [ 2] 3499         cmpa    #0x4B
   9D74 26 04         [ 3] 3500         bne     L9D3D  
   9D76                    3501 L9D39:
   9D76 C6 01         [ 2] 3502         ldab    #0x01
   9D78 D7 B8         [ 3] 3503         stab    (0x00B8)
   9D7A                    3504 L9D3D:
   9D7A 81 41         [ 2] 3505         cmpa    #0x41
   9D7C 27 04         [ 3] 3506         beq     L9D45  
   9D7E 81 4F         [ 2] 3507         cmpa    #0x4F
   9D80 26 07         [ 3] 3508         bne     L9D4C  
   9D82                    3509 L9D45:
   9D82 86 01         [ 2] 3510         ldaa    #0x01
   9D84 B7 02 98      [ 4] 3511         staa    (0x0298)
   9D87 20 32         [ 3] 3512         bra     L9D7E  
   9D89                    3513 L9D4C:
   9D89 81 4B         [ 2] 3514         cmpa    #0x4B
   9D8B 27 04         [ 3] 3515         beq     L9D54  
   9D8D 81 50         [ 2] 3516         cmpa    #0x50
   9D8F 26 07         [ 3] 3517         bne     L9D5B  
   9D91                    3518 L9D54:
   9D91 86 02         [ 2] 3519         ldaa    #0x02
   9D93 B7 02 98      [ 4] 3520         staa    (0x0298)
   9D96 20 23         [ 3] 3521         bra     L9D7E  
   9D98                    3522 L9D5B:
   9D98 81 4C         [ 2] 3523         cmpa    #0x4C
   9D9A 26 07         [ 3] 3524         bne     L9D66  
   9D9C 86 03         [ 2] 3525         ldaa    #0x03
   9D9E B7 02 98      [ 4] 3526         staa    (0x0298)
   9DA1 20 18         [ 3] 3527         bra     L9D7E  
   9DA3                    3528 L9D66:
   9DA3 81 52         [ 2] 3529         cmpa    #0x52
   9DA5 26 07         [ 3] 3530         bne     L9D71  
   9DA7 86 04         [ 2] 3531         ldaa    #0x04
   9DA9 B7 02 98      [ 4] 3532         staa    (0x0298)
   9DAC 20 0D         [ 3] 3533         bra     L9D7E  
   9DAE                    3534 L9D71:
   9DAE DC 1B         [ 4] 3535         ldd     CDTIMR1
   9DB0 26 B7         [ 3] 3536         bne     L9D2C  
   9DB2 86 23         [ 2] 3537         ldaa    #0x23           ;'#'
   9DB4 C6 29         [ 2] 3538         ldab    #0x29
   9DB6 BD 8D C5      [ 6] 3539         jsr     L8DB5           ; display char here on LCD display
   9DB9 20 6C         [ 3] 3540         bra     L9DEA  
   9DBB                    3541 L9D7E:
   9DBB 7F 00 49      [ 6] 3542         clr     (0x0049)
   9DBE 86 2A         [ 2] 3543         ldaa    #0x2A           ;'*'
   9DC0 C6 29         [ 2] 3544         ldab    #0x29
   9DC2 BD 8D C5      [ 6] 3545         jsr     L8DB5           ; display char here on LCD display
   9DC5 7F 00 4A      [ 6] 3546         clr     (0x004A)
   9DC8 CE 02 99      [ 3] 3547         ldx     #0x0299
   9DCB                    3548 L9D8E:
   9DCB BD 9B 29      [ 6] 3549         jsr     L9B19           ; do the random motions if enabled
   9DCE 96 4A         [ 3] 3550         ldaa    (0x004A)
   9DD0 27 F9         [ 3] 3551         beq     L9D8E  
   9DD2 7F 00 4A      [ 6] 3552         clr     (0x004A)
   9DD5 84 3F         [ 2] 3553         anda    #0x3F
   9DD7 A7 00         [ 4] 3554         staa    0,X     
   9DD9 08            [ 3] 3555         inx
   9DDA 8C 02 9C      [ 4] 3556         cpx     #0x029C
   9DDD 26 EC         [ 3] 3557         bne     L9D8E  
   9DDF BD 9E 32      [ 6] 3558         jsr     L9DF5
   9DE2 24 09         [ 3] 3559         bcc     L9DB0  
   9DE4 86 23         [ 2] 3560         ldaa    #0x23           ;'#'
   9DE6 C6 2A         [ 2] 3561         ldab    #0x2A
   9DE8 BD 8D C5      [ 6] 3562         jsr     L8DB5           ; display char here on LCD display
   9DEB 20 3A         [ 3] 3563         bra     L9DEA  
   9DED                    3564 L9DB0:
   9DED 86 2A         [ 2] 3565         ldaa    #0x2A           ;'*'
   9DEF C6 2A         [ 2] 3566         ldab    #0x2A
   9DF1 BD 8D C5      [ 6] 3567         jsr     L8DB5           ; display char here on LCD display
   9DF4 B6 02 99      [ 4] 3568         ldaa    (0x0299)
   9DF7 81 39         [ 2] 3569         cmpa    #0x39
   9DF9 26 15         [ 3] 3570         bne     L9DD3  
                           3571 
   9DFB BD 8D ED      [ 6] 3572         jsr     LCDMSG2 
   9DFE 47 65 6E 65 72 69  3573         .ascis  'Generic Showtape'
        63 20 53 68 6F 77
        74 61 70 E5
                           3574 
   9E0E 0C            [ 2] 3575         clc
   9E0F 39            [ 5] 3576         rts
                           3577 
   9E10                    3578 L9DD3:
   9E10 B6 02 98      [ 4] 3579         ldaa    (0x0298)
   9E13 81 03         [ 2] 3580         cmpa    #0x03
   9E15 27 0E         [ 3] 3581         beq     L9DE8  
   9E17 81 04         [ 2] 3582         cmpa    #0x04
   9E19 27 0A         [ 3] 3583         beq     L9DE8  
   9E1B 96 76         [ 3] 3584         ldaa    (0x0076)
   9E1D 26 06         [ 3] 3585         bne     L9DE8  
   9E1F BD 9E B0      [ 6] 3586         jsr     L9E73
   9E22 BD 9F 09      [ 6] 3587         jsr     L9ECC
   9E25                    3588 L9DE8:
   9E25 0C            [ 2] 3589         clc
   9E26 39            [ 5] 3590         rts
                           3591 
   9E27                    3592 L9DEA:
   9E27 FC 04 20      [ 5] 3593         ldd     (0x0420)
   9E2A C3 00 01      [ 4] 3594         addd    #0x0001
   9E2D FD 04 20      [ 5] 3595         std     (0x0420)
   9E30 0D            [ 2] 3596         sec
   9E31 39            [ 5] 3597         rts
                           3598 
   9E32                    3599 L9DF5:
   9E32 B6 02 99      [ 4] 3600         ldaa    (0x0299)
   9E35 81 39         [ 2] 3601         cmpa    #0x39
   9E37 27 6C         [ 3] 3602         beq     L9E68  
   9E39 CE 00 A8      [ 3] 3603         ldx     #0x00A8
   9E3C                    3604 L9DFF:
   9E3C BD 9B 29      [ 6] 3605         jsr     L9B19           ; do the random motions if enabled
   9E3F 96 4A         [ 3] 3606         ldaa    (0x004A)
   9E41 27 F9         [ 3] 3607         beq     L9DFF  
   9E43 7F 00 4A      [ 6] 3608         clr     (0x004A)
   9E46 A7 00         [ 4] 3609         staa    0,X     
   9E48 08            [ 3] 3610         inx
   9E49 8C 00 AA      [ 4] 3611         cpx     #0x00AA
   9E4C 26 EE         [ 3] 3612         bne     L9DFF  
   9E4E BD 9F 37      [ 6] 3613         jsr     L9EFA
   9E51 CE 02 99      [ 3] 3614         ldx     #0x0299
   9E54 7F 00 13      [ 6] 3615         clr     (0x0013)
   9E57                    3616 L9E1A:
   9E57 A6 00         [ 4] 3617         ldaa    0,X     
   9E59 9B 13         [ 3] 3618         adda    (0x0013)
   9E5B 97 13         [ 3] 3619         staa    (0x0013)
   9E5D 08            [ 3] 3620         inx
   9E5E 8C 02 9C      [ 4] 3621         cpx     #0x029C
   9E61 26 F4         [ 3] 3622         bne     L9E1A  
   9E63 91 A8         [ 3] 3623         cmpa    (0x00A8)
   9E65 26 47         [ 3] 3624         bne     L9E71  
   9E67 CE 04 02      [ 3] 3625         ldx     #0x0402
   9E6A B6 02 98      [ 4] 3626         ldaa    (0x0298)
   9E6D 81 02         [ 2] 3627         cmpa    #0x02
   9E6F 26 03         [ 3] 3628         bne     L9E37  
   9E71 CE 04 05      [ 3] 3629         ldx     #0x0405
   9E74                    3630 L9E37:
   9E74 3C            [ 4] 3631         pshx
   9E75 BD AB 93      [ 6] 3632         jsr     LAB56
   9E78 38            [ 5] 3633         pulx
   9E79 25 07         [ 3] 3634         bcs     L9E45  
   9E7B 86 03         [ 2] 3635         ldaa    #0x03
   9E7D B7 02 98      [ 4] 3636         staa    (0x0298)
   9E80 20 23         [ 3] 3637         bra     L9E68  
   9E82                    3638 L9E45:
   9E82 B6 02 99      [ 4] 3639         ldaa    (0x0299)
   9E85 A1 00         [ 4] 3640         cmpa    0,X     
   9E87 25 1E         [ 3] 3641         bcs     L9E6A  
   9E89 27 02         [ 3] 3642         beq     L9E50  
   9E8B 24 18         [ 3] 3643         bcc     L9E68  
   9E8D                    3644 L9E50:
   9E8D 08            [ 3] 3645         inx
   9E8E B6 02 9A      [ 4] 3646         ldaa    (0x029A)
   9E91 A1 00         [ 4] 3647         cmpa    0,X     
   9E93 25 12         [ 3] 3648         bcs     L9E6A  
   9E95 27 02         [ 3] 3649         beq     L9E5C  
   9E97 24 0C         [ 3] 3650         bcc     L9E68  
   9E99                    3651 L9E5C:
   9E99 08            [ 3] 3652         inx
   9E9A B6 02 9B      [ 4] 3653         ldaa    (0x029B)
   9E9D A1 00         [ 4] 3654         cmpa    0,X     
   9E9F 25 06         [ 3] 3655         bcs     L9E6A  
   9EA1 27 02         [ 3] 3656         beq     L9E68  
   9EA3 24 00         [ 3] 3657         bcc     L9E68  
   9EA5                    3658 L9E68:
   9EA5 0C            [ 2] 3659         clc
   9EA6 39            [ 5] 3660         rts
                           3661 
   9EA7                    3662 L9E6A:
   9EA7 B6 02 98      [ 4] 3663         ldaa    (0x0298)
   9EAA 81 03         [ 2] 3664         cmpa    #0x03
   9EAC 27 F7         [ 3] 3665         beq     L9E68  
   9EAE                    3666 L9E71:
   9EAE 0D            [ 2] 3667         sec
   9EAF 39            [ 5] 3668         rts
                           3669 
   9EB0                    3670 L9E73:
   9EB0 CE 04 02      [ 3] 3671         ldx     #0x0402
   9EB3 B6 02 98      [ 4] 3672         ldaa    (0x0298)
   9EB6 81 02         [ 2] 3673         cmpa    #0x02
   9EB8 26 03         [ 3] 3674         bne     L9E80  
   9EBA CE 04 05      [ 3] 3675         ldx     #0x0405
   9EBD                    3676 L9E80:
   9EBD B6 02 99      [ 4] 3677         ldaa    (0x0299)
   9EC0 A7 00         [ 4] 3678         staa    0,X     
   9EC2 08            [ 3] 3679         inx
   9EC3 B6 02 9A      [ 4] 3680         ldaa    (0x029A)
   9EC6 A7 00         [ 4] 3681         staa    0,X     
   9EC8 08            [ 3] 3682         inx
   9EC9 B6 02 9B      [ 4] 3683         ldaa    (0x029B)
   9ECC A7 00         [ 4] 3684         staa    0,X     
   9ECE 39            [ 5] 3685         rts
                           3686 
                           3687 ; reset R counts
   9ECF                    3688 L9E92:
   9ECF 86 30         [ 2] 3689         ldaa    #0x30        
   9ED1 B7 04 02      [ 4] 3690         staa    (0x0402)
   9ED4 B7 04 03      [ 4] 3691         staa    (0x0403)
   9ED7 B7 04 04      [ 4] 3692         staa    (0x0404)
                           3693 
   9EDA BD 8D ED      [ 6] 3694         jsr     LCDMSG2 
   9EDD 52 65 67 20 23 20  3695         .ascis  'Reg # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3696 
   9EEB 39            [ 5] 3697         rts
                           3698 
                           3699 ; reset L counts
   9EEC                    3700 L9EAF:
   9EEC 86 30         [ 2] 3701         ldaa    #0x30
   9EEE B7 04 05      [ 4] 3702         staa    (0x0405)
   9EF1 B7 04 06      [ 4] 3703         staa    (0x0406)
   9EF4 B7 04 07      [ 4] 3704         staa    (0x0407)
                           3705 
   9EF7 BD 8D ED      [ 6] 3706         jsr     LCDMSG2 
   9EFA 4C 69 76 20 23 20  3707         .ascis  'Liv # cleared!'
        63 6C 65 61 72 65
        64 A1
                           3708 
   9F08 39            [ 5] 3709         rts
                           3710 
                           3711 ; display R and L counts?
   9F09                    3712 L9ECC:
   9F09 86 52         [ 2] 3713         ldaa    #0x52           ;'R'
   9F0B C6 2B         [ 2] 3714         ldab    #0x2B
   9F0D BD 8D C5      [ 6] 3715         jsr     L8DB5           ; display char here on LCD display
   9F10 86 4C         [ 2] 3716         ldaa    #0x4C           ;'L'
   9F12 C6 32         [ 2] 3717         ldab    #0x32
   9F14 BD 8D C5      [ 6] 3718         jsr     L8DB5           ; display char here on LCD display
   9F17 CE 04 02      [ 3] 3719         ldx     #0x0402
   9F1A C6 2C         [ 2] 3720         ldab    #0x2C
   9F1C                    3721 L9EDF:
   9F1C A6 00         [ 4] 3722         ldaa    0,X     
   9F1E BD 8D C5      [ 6] 3723         jsr     L8DB5           ; display 3 chars here on LCD display
   9F21 5C            [ 2] 3724         incb
   9F22 08            [ 3] 3725         inx
   9F23 8C 04 05      [ 4] 3726         cpx     #0x0405
   9F26 26 F4         [ 3] 3727         bne     L9EDF  
   9F28 C6 33         [ 2] 3728         ldab    #0x33
   9F2A                    3729 L9EED:
   9F2A A6 00         [ 4] 3730         ldaa    0,X     
   9F2C BD 8D C5      [ 6] 3731         jsr     L8DB5           ; display 3 chars here on LCD display
   9F2F 5C            [ 2] 3732         incb
   9F30 08            [ 3] 3733         inx
   9F31 8C 04 08      [ 4] 3734         cpx     #0x0408
   9F34 26 F4         [ 3] 3735         bne     L9EED  
   9F36 39            [ 5] 3736         rts
                           3737 
   9F37                    3738 L9EFA:
   9F37 96 A8         [ 3] 3739         ldaa    (0x00A8)
   9F39 BD 9F 4C      [ 6] 3740         jsr     L9F0F
   9F3C 48            [ 2] 3741         asla
   9F3D 48            [ 2] 3742         asla
   9F3E 48            [ 2] 3743         asla
   9F3F 48            [ 2] 3744         asla
   9F40 97 13         [ 3] 3745         staa    (0x0013)
   9F42 96 A9         [ 3] 3746         ldaa    (0x00A9)
   9F44 BD 9F 4C      [ 6] 3747         jsr     L9F0F
   9F47 9B 13         [ 3] 3748         adda    (0x0013)
   9F49 97 A8         [ 3] 3749         staa    (0x00A8)
   9F4B 39            [ 5] 3750         rts
                           3751 
   9F4C                    3752 L9F0F:
   9F4C 81 2F         [ 2] 3753         cmpa    #0x2F
   9F4E 24 02         [ 3] 3754         bcc     L9F15  
   9F50 86 30         [ 2] 3755         ldaa    #0x30
   9F52                    3756 L9F15:
   9F52 81 3A         [ 2] 3757         cmpa    #0x3A
   9F54 25 02         [ 3] 3758         bcs     L9F1B  
   9F56 80 07         [ 2] 3759         suba    #0x07
   9F58                    3760 L9F1B:
   9F58 80 30         [ 2] 3761         suba    #0x30
   9F5A 39            [ 5] 3762         rts
                           3763 
                           3764 ; different behavior based on serial number
   9F5B                    3765 L9F1E:
   9F5B FC 02 9C      [ 5] 3766         ldd     (0x029C)
   9F5E 1A 83 00 01   [ 5] 3767         cpd     #0x0001         ; if 1, password bypass
   9F62 27 0C         [ 3] 3768         beq     L9F33           ;
   9F64 1A 83 03 E8   [ 5] 3769         cpd     #0x03E8         ; 1000
   9F68 25 20         [ 3] 3770         bcs     L9F4D           ; if > 1000, code
   9F6A 1A 83 04 4B   [ 5] 3771         cpd     #0x044B         ; 1099
   9F6E 22 1A         [ 3] 3772         bhi     L9F4D           ; if < 1099, code
                           3773                                 ; else 1 < x < 1000, bypass
                           3774 
   9F70                    3775 L9F33:
   9F70 BD 8D F4      [ 6] 3776         jsr     LCDMSG1 
   9F73 50 61 73 73 77 6F  3777         .ascis  'Password bypass '
        72 64 20 62 79 70
        61 73 73 A0
                           3778 
   9F83 C6 04         [ 2] 3779         ldab    #0x04
   9F85 BD 8C 40      [ 6] 3780         jsr     DLYSECSBY2      ; delay 2 sec
   9F88 0C            [ 2] 3781         clc
   9F89 39            [ 5] 3782         rts
                           3783 
   9F8A                    3784 L9F4D:
   9F8A BD 8D 02      [ 6] 3785         jsr     L8CF2
   9F8D BD 8D 13      [ 6] 3786         jsr     L8D03
                           3787 
   9F90 BD 8D F4      [ 6] 3788         jsr     LCDMSG1 
   9F93 43 6F 64 65 BA     3789         .ascis  'Code:'
                           3790 
                           3791 ; Generate a random 5-digit code in 0x0290-0x0294, and display to user
                           3792 
   9F98 CE 02 90      [ 3] 3793         ldx     #0x0290
   9F9B 7F 00 16      [ 6] 3794         clr     (0x0016)        ; 0x00
   9F9E                    3795 L9F61:
   9F9E 86 41         [ 2] 3796         ldaa    #0x41           ; 'A'
   9FA0                    3797 L9F63:
   9FA0 97 15         [ 3] 3798         staa    (0x0015)        ; 0x41
   9FA2 BD 8E A5      [ 6] 3799         jsr     L8E95           ; read SCD keys
   9FA5 81 0D         [ 2] 3800         cmpa    #0x0D
   9FA7 26 11         [ 3] 3801         bne     L9F7D
   9FA9 96 15         [ 3] 3802         ldaa    (0x0015)
   9FAB A7 00         [ 4] 3803         staa    0,X     
   9FAD 08            [ 3] 3804         inx
   9FAE BD 8C A8      [ 6] 3805         jsr     L8C98
   9FB1 96 16         [ 3] 3806         ldaa    (0x0016)
   9FB3 4C            [ 2] 3807         inca
   9FB4 97 16         [ 3] 3808         staa    (0x0016)
   9FB6 81 05         [ 2] 3809         cmpa    #0x05
   9FB8 27 09         [ 3] 3810         beq     L9F86  
   9FBA                    3811 L9F7D:
   9FBA 96 15         [ 3] 3812         ldaa    (0x0015)
   9FBC 4C            [ 2] 3813         inca
   9FBD 81 5B         [ 2] 3814         cmpa    #0x5B           ; '['
   9FBF 27 DD         [ 3] 3815         beq     L9F61  
   9FC1 20 DD         [ 3] 3816         bra     L9F63  
                           3817 
                           3818 ; Let the user type in a corresponding password to the code
   9FC3                    3819 L9F86:
   9FC3 BD 8D ED      [ 6] 3820         jsr     LCDMSG2 
   9FC6 50 73 77 64 BA     3821         .ascis  'Pswd:'
                           3822 
   9FCB CE 02 88      [ 3] 3823         ldx     #0x0288
   9FCE 86 41         [ 2] 3824         ldaa    #0x41           ; 'A'
   9FD0 97 16         [ 3] 3825         staa    (0x0016)
   9FD2 86 C5         [ 2] 3826         ldaa    #0xC5           ; 
   9FD4 97 15         [ 3] 3827         staa    (0x0015)
   9FD6                    3828 L9F99:
   9FD6 96 15         [ 3] 3829         ldaa    (0x0015)
   9FD8 BD 8C 96      [ 6] 3830         jsr     L8C86           ; write byte to LCD
   9FDB 96 16         [ 3] 3831         ldaa    (0x0016)
   9FDD BD 8C A8      [ 6] 3832         jsr     L8C98
   9FE0                    3833 L9FA3:
   9FE0 BD 8E A5      [ 6] 3834         jsr     L8E95
   9FE3 27 FB         [ 3] 3835         beq     L9FA3  
   9FE5 81 0D         [ 2] 3836         cmpa    #0x0D
   9FE7 26 10         [ 3] 3837         bne     L9FBC  
   9FE9 96 16         [ 3] 3838         ldaa    (0x0016)
   9FEB A7 00         [ 4] 3839         staa    0,X     
   9FED 08            [ 3] 3840         inx
   9FEE 96 15         [ 3] 3841         ldaa    (0x0015)
   9FF0 4C            [ 2] 3842         inca
   9FF1 97 15         [ 3] 3843         staa    (0x0015)
   9FF3 81 CA         [ 2] 3844         cmpa    #0xCA
   9FF5 27 28         [ 3] 3845         beq     L9FE2  
   9FF7 20 DD         [ 3] 3846         bra     L9F99  
   9FF9                    3847 L9FBC:
   9FF9 81 01         [ 2] 3848         cmpa    #0x01
   9FFB 26 0F         [ 3] 3849         bne     L9FCF  
   9FFD 96 16         [ 3] 3850         ldaa    (0x0016)
   9FFF 4C            [ 2] 3851         inca
   A000 97 16         [ 3] 3852         staa    (0x0016)
   A002 81 5B         [ 2] 3853         cmpa    #0x5B
   A004 26 D0         [ 3] 3854         bne     L9F99  
   A006 86 41         [ 2] 3855         ldaa    #0x41
   A008 97 16         [ 3] 3856         staa    (0x0016)
   A00A 20 CA         [ 3] 3857         bra     L9F99  
   A00C                    3858 L9FCF:
   A00C 81 02         [ 2] 3859         cmpa    #0x02
   A00E 26 D0         [ 3] 3860         bne     L9FA3  
   A010 96 16         [ 3] 3861         ldaa    (0x0016)
   A012 4A            [ 2] 3862         deca
   A013 97 16         [ 3] 3863         staa    (0x0016)
   A015 81 40         [ 2] 3864         cmpa    #0x40
   A017 26 BD         [ 3] 3865         bne     L9F99  
   A019 86 5A         [ 2] 3866         ldaa    #0x5A
   A01B 97 16         [ 3] 3867         staa    (0x0016)
   A01D 20 B7         [ 3] 3868         bra     L9F99  
   A01F                    3869 L9FE2:
   A01F BD A0 3E      [ 6] 3870         jsr     LA001           ; validate
   A022 25 0F         [ 3] 3871         bcs     L9FF6           ; if bad, jump
   A024 86 DB         [ 2] 3872         ldaa    #0xDB
   A026 97 AB         [ 3] 3873         staa    (0x00AB)        ; good password
   A028 FC 04 16      [ 5] 3874         ldd     (0x0416)        ; increment number of good validations counter
   A02B C3 00 01      [ 4] 3875         addd    #0x0001
   A02E FD 04 16      [ 5] 3876         std     (0x0416)
   A031 0C            [ 2] 3877         clc
   A032 39            [ 5] 3878         rts
                           3879 
   A033                    3880 L9FF6:
   A033 FC 04 14      [ 5] 3881         ldd     (0x0414)        ; increment number of bad validations counter
   A036 C3 00 01      [ 4] 3882         addd    #0x0001
   A039 FD 04 14      [ 5] 3883         std     (0x0414)
   A03C 0D            [ 2] 3884         sec
   A03D 39            [ 5] 3885         rts
                           3886 
                           3887 ; Validate password?
   A03E                    3888 LA001:
                           3889         ; scramble 5 letters
   A03E B6 02 90      [ 4] 3890         ldaa    (0x0290)        ; 0 -> 1
   A041 B7 02 81      [ 4] 3891         staa    (0x0281)
   A044 B6 02 91      [ 4] 3892         ldaa    (0x0291)        ; 1 -> 3
   A047 B7 02 83      [ 4] 3893         staa    (0x0283)
   A04A B6 02 92      [ 4] 3894         ldaa    (0x0292)        ; 2 -> 4
   A04D B7 02 84      [ 4] 3895         staa    (0x0284)
   A050 B6 02 93      [ 4] 3896         ldaa    (0x0293)        ; 3 -> 0
   A053 B7 02 80      [ 4] 3897         staa    (0x0280)
   A056 B6 02 94      [ 4] 3898         ldaa    (0x0294)        ; 4 -> 2
   A059 B7 02 82      [ 4] 3899         staa    (0x0282)
                           3900         ; transform each letter
   A05C B6 02 80      [ 4] 3901         ldaa    (0x0280)    
   A05F 88 13         [ 2] 3902         eora    #0x13
   A061 8B 03         [ 2] 3903         adda    #0x03
   A063 B7 02 80      [ 4] 3904         staa    (0x0280)
   A066 B6 02 81      [ 4] 3905         ldaa    (0x0281)
   A069 88 04         [ 2] 3906         eora    #0x04
   A06B 8B 12         [ 2] 3907         adda    #0x12
   A06D B7 02 81      [ 4] 3908         staa    (0x0281)
   A070 B6 02 82      [ 4] 3909         ldaa    (0x0282)
   A073 88 06         [ 2] 3910         eora    #0x06
   A075 8B 04         [ 2] 3911         adda    #0x04
   A077 B7 02 82      [ 4] 3912         staa    (0x0282)
   A07A B6 02 83      [ 4] 3913         ldaa    (0x0283)
   A07D 88 11         [ 2] 3914         eora    #0x11
   A07F 8B 07         [ 2] 3915         adda    #0x07
   A081 B7 02 83      [ 4] 3916         staa    (0x0283)
   A084 B6 02 84      [ 4] 3917         ldaa    (0x0284)
   A087 88 01         [ 2] 3918         eora    #0x01
   A089 8B 10         [ 2] 3919         adda    #0x10
   A08B B7 02 84      [ 4] 3920         staa    (0x0284)
                           3921         ; keep them modulo 26 (A-Z)
   A08E BD A0 EC      [ 6] 3922         jsr     LA0AF
                           3923         ; put some of the original bits into 0x0015/0x0016
   A091 B6 02 94      [ 4] 3924         ldaa    (0x0294)
   A094 84 17         [ 2] 3925         anda    #0x17
   A096 97 15         [ 3] 3926         staa    (0x0015)
   A098 B6 02 90      [ 4] 3927         ldaa    (0x0290)
   A09B 84 17         [ 2] 3928         anda    #0x17
   A09D 97 16         [ 3] 3929         staa    (0x0016)
                           3930         ; do some eoring with these bits
   A09F CE 02 80      [ 3] 3931         ldx     #0x0280
   A0A2                    3932 LA065:
   A0A2 A6 00         [ 4] 3933         ldaa    0,X
   A0A4 98 15         [ 3] 3934         eora    (0x0015)
   A0A6 98 16         [ 3] 3935         eora    (0x0016)
   A0A8 A7 00         [ 4] 3936         staa    0,X
   A0AA 08            [ 3] 3937         inx
   A0AB 8C 02 85      [ 4] 3938         cpx     #0x0285
   A0AE 26 F2         [ 3] 3939         bne     LA065
                           3940         ; keep them modulo 26 (A-Z)
   A0B0 BD A0 EC      [ 6] 3941         jsr     LA0AF
                           3942         ; compare them to code in 0x0288-0x028C
   A0B3 CE 02 80      [ 3] 3943         ldx     #0x0280
   A0B6 18 CE 02 88   [ 4] 3944         ldy     #0x0288
   A0BA                    3945 LA07D:
   A0BA A6 00         [ 4] 3946         ldaa    0,X     
   A0BC 18 A1 00      [ 5] 3947         cmpa    0,Y     
   A0BF 26 0A         [ 3] 3948         bne     LA08E  
   A0C1 08            [ 3] 3949         inx
   A0C2 18 08         [ 4] 3950         iny
   A0C4 8C 02 85      [ 4] 3951         cpx     #0x0285
   A0C7 26 F1         [ 3] 3952         bne     LA07D  
   A0C9 0C            [ 2] 3953         clc                     ; carry clear if good
   A0CA 39            [ 5] 3954         rts
                           3955 
   A0CB                    3956 LA08E:
   A0CB 0D            [ 2] 3957         sec                     ; carry set if bad
   A0CC 39            [ 5] 3958         rts
                           3959 
                           3960 ; trivial password validation - not used??
   A0CD                    3961 LA090:
   A0CD 59 41 44 44 41     3962         .ascii  'YADDA'
                           3963 
   A0D2 CE 02 88      [ 3] 3964         ldx     #0x0288
   A0D5 18 CE A0 CD   [ 4] 3965         ldy     #LA090
   A0D9                    3966 LA09C:
   A0D9 A6 00         [ 4] 3967         ldaa    0,X
   A0DB 18 A1 00      [ 5] 3968         cmpa    0,Y
   A0DE 26 0A         [ 3] 3969         bne     LA0AD
   A0E0 08            [ 3] 3970         inx
   A0E1 18 08         [ 4] 3971         iny
   A0E3 8C 02 8D      [ 4] 3972         cpx     #0x028D
   A0E6 26 F1         [ 3] 3973         bne     LA09C
   A0E8 0C            [ 2] 3974         clc
   A0E9 39            [ 5] 3975         rts
   A0EA                    3976 LA0AD:
   A0EA 0D            [ 2] 3977         sec
   A0EB 39            [ 5] 3978         rts
                           3979 
                           3980 ; keep the password modulo 26, each letter in range 'A-Z'
   A0EC                    3981 LA0AF:
   A0EC CE 02 80      [ 3] 3982         ldx     #0x0280
   A0EF                    3983 LA0B2:
   A0EF A6 00         [ 4] 3984         ldaa    0,X
   A0F1 81 5B         [ 2] 3985         cmpa    #0x5B
   A0F3 25 06         [ 3] 3986         bcs     LA0BE
   A0F5 80 1A         [ 2] 3987         suba    #0x1A
   A0F7 A7 00         [ 4] 3988         staa    0,X
   A0F9 20 08         [ 3] 3989         bra     LA0C6
   A0FB                    3990 LA0BE:
   A0FB 81 41         [ 2] 3991         cmpa    #0x41
   A0FD 24 04         [ 3] 3992         bcc     LA0C6
   A0FF 8B 1A         [ 2] 3993         adda    #0x1A
   A101 A7 00         [ 4] 3994         staa    0,X
   A103                    3995 LA0C6:
   A103 08            [ 3] 3996         inx
   A104 8C 02 85      [ 4] 3997         cpx     #0x0285
   A107 26 E6         [ 3] 3998         bne     LA0B2  
   A109 39            [ 5] 3999         rts
                           4000 
   A10A BD 8D 02      [ 6] 4001         jsr     L8CF2
                           4002 
   A10D BD 8D ED      [ 6] 4003         jsr     LCDMSG2 
   A110 46 61 69 6C 65 64  4004         .ascis  'Failed!         '
        21 20 20 20 20 20
        20 20 20 A0
                           4005 
   A120 C6 02         [ 2] 4006         ldab    #0x02
   A122 BD 8C 40      [ 6] 4007         jsr     DLYSECSBY2      ; delay 1 sec
   A125 39            [ 5] 4008         rts
                           4009 
   A126                    4010 LA0E9:
   A126 C6 01         [ 2] 4011         ldab    #0x01
   A128 BD 8C 40      [ 6] 4012         jsr     DLYSECSBY2      ; delay 0.5 sec
   A12B 7F 00 4E      [ 6] 4013         clr     (0x004E)
   A12E C6 D3         [ 2] 4014         ldab    #0xD3
   A130 BD 87 58      [ 6] 4015         jsr     L8748   
   A133 BD 87 BE      [ 6] 4016         jsr     L87AE
   A136 BD 8C F9      [ 6] 4017         jsr     L8CE9
                           4018 
   A139 BD 8D F4      [ 6] 4019         jsr     LCDMSG1 
   A13C 20 20 20 56 43 52  4020         .ascis  '   VCR adjust'
        20 61 64 6A 75 73
        F4
                           4021 
   A149 BD 8D ED      [ 6] 4022         jsr     LCDMSG2 
   A14C 55 50 20 74 6F 20  4023         .ascis  'UP to clear bits'
        63 6C 65 61 72 20
        62 69 74 F3
                           4024 
   A15C 5F            [ 2] 4025         clrb
   A15D D7 62         [ 3] 4026         stab    (0x0062)
   A15F BD FA F9      [ 6] 4027         jsr     BUTNLIT 
   A162 B6 18 04      [ 4] 4028         ldaa    PIA0PRA 
   A165 84 BF         [ 2] 4029         anda    #0xBF
   A167 B7 18 04      [ 4] 4030         staa    PIA0PRA 
   A16A BD 8E A5      [ 6] 4031         jsr     L8E95
   A16D 7F 00 48      [ 6] 4032         clr     (0x0048)
   A170 7F 00 49      [ 6] 4033         clr     (0x0049)
   A173 BD 86 D4      [ 6] 4034         jsr     L86C4           ; Reset boards 1-10
   A176 86 28         [ 2] 4035         ldaa    #0x28
   A178 97 63         [ 3] 4036         staa    (0x0063)
   A17A C6 FD         [ 2] 4037         ldab    #0xFD           ; tape deck STOP
   A17C BD 86 F7      [ 6] 4038         jsr     L86E7
   A17F BD A3 6B      [ 6] 4039         jsr     LA32E
   A182 7C 00 76      [ 6] 4040         inc     (0x0076)
   A185 7F 00 32      [ 6] 4041         clr     (0x0032)
   A188                    4042 LA14B:
   A188 BD 8E A5      [ 6] 4043         jsr     L8E95
   A18B 81 0D         [ 2] 4044         cmpa    #0x0D
   A18D 26 03         [ 3] 4045         bne     LA155  
   A18F 7E A2 01      [ 3] 4046         jmp     LA1C4
   A192                    4047 LA155:
   A192 86 28         [ 2] 4048         ldaa    #0x28
   A194 97 63         [ 3] 4049         staa    (0x0063)
   A196 BD 86 B2      [ 6] 4050         jsr     L86A4
   A199 25 ED         [ 3] 4051         bcs     LA14B  
   A19B FC 04 1A      [ 5] 4052         ldd     (0x041A)
   A19E C3 00 01      [ 4] 4053         addd    #0x0001
   A1A1 FD 04 1A      [ 5] 4054         std     (0x041A)
   A1A4 BD 86 D4      [ 6] 4055         jsr     L86C4           ; Reset boards 1-10
   A1A7 7C 00 4E      [ 6] 4056         inc     (0x004E)
   A1AA C6 D3         [ 2] 4057         ldab    #0xD3
   A1AC BD 87 58      [ 6] 4058         jsr     L8748   
   A1AF BD 87 BE      [ 6] 4059         jsr     L87AE
   A1B2                    4060 LA175:
   A1B2 96 49         [ 3] 4061         ldaa    (0x0049)
   A1B4 81 43         [ 2] 4062         cmpa    #0x43
   A1B6 26 06         [ 3] 4063         bne     LA181  
   A1B8 7F 00 49      [ 6] 4064         clr     (0x0049)
   A1BB 7F 00 48      [ 6] 4065         clr     (0x0048)
   A1BE                    4066 LA181:
   A1BE 96 48         [ 3] 4067         ldaa    (0x0048)
   A1C0 81 C8         [ 2] 4068         cmpa    #0xC8
   A1C2 25 1F         [ 3] 4069         bcs     LA1A6  
   A1C4 FC 02 9C      [ 5] 4070         ldd     (0x029C)
   A1C7 1A 83 00 01   [ 5] 4071         cpd     #0x0001
   A1CB 27 16         [ 3] 4072         beq     LA1A6  
   A1CD C6 EF         [ 2] 4073         ldab    #0xEF           ; tape deck EJECT
   A1CF BD 86 F7      [ 6] 4074         jsr     L86E7
   A1D2 BD 86 D4      [ 6] 4075         jsr     L86C4           ; Reset boards 1-10
   A1D5 7F 00 4E      [ 6] 4076         clr     (0x004E)
   A1D8 7F 00 76      [ 6] 4077         clr     (0x0076)
   A1DB C6 0A         [ 2] 4078         ldab    #0x0A
   A1DD BD 8C 40      [ 6] 4079         jsr     DLYSECSBY2      ; delay 5 sec
   A1E0 7E 81 D4      [ 3] 4080         jmp     L81D7
   A1E3                    4081 LA1A6:
   A1E3 BD 8E A5      [ 6] 4082         jsr     L8E95
   A1E6 81 01         [ 2] 4083         cmpa    #0x01
   A1E8 26 10         [ 3] 4084         bne     LA1BD  
   A1EA CE 10 80      [ 3] 4085         ldx     #0x1080
   A1ED 86 34         [ 2] 4086         ldaa    #0x34
   A1EF                    4087 LA1B2:
   A1EF 6F 00         [ 6] 4088         clr     0,X     
   A1F1 A7 01         [ 4] 4089         staa    1,X     
   A1F3 08            [ 3] 4090         inx
   A1F4 08            [ 3] 4091         inx
   A1F5 8C 10 A0      [ 4] 4092         cpx     #0x10A0
   A1F8 25 F5         [ 3] 4093         bcs     LA1B2  
   A1FA                    4094 LA1BD:
   A1FA 81 0D         [ 2] 4095         cmpa    #0x0D
   A1FC 27 03         [ 3] 4096         beq     LA1C4  
   A1FE 7E A1 B2      [ 3] 4097         jmp     LA175
   A201                    4098 LA1C4:
   A201 7F 00 76      [ 6] 4099         clr     (0x0076)
   A204 7F 00 4E      [ 6] 4100         clr     (0x004E)
   A207 C6 DF         [ 2] 4101         ldab    #0xDF
   A209 BD 87 58      [ 6] 4102         jsr     L8748   
   A20C BD 87 A1      [ 6] 4103         jsr     L8791   
   A20F 7E 81 D4      [ 3] 4104         jmp     L81D7
                           4105 
                           4106 ; reprogram EEPROM signature if needed
   A212                    4107 LA1D5:
   A212 86 08         [ 2] 4108         ldaa    #0x08
   A214 B7 04 00      [ 4] 4109         staa    (0x0400)
   A217 CC 0E 09      [ 3] 4110         ldd     #0x0E09
   A21A 81 65         [ 2] 4111         cmpa    #0x65           ;'e'
   A21C 26 05         [ 3] 4112         bne     LA1E6
   A21E C1 63         [ 2] 4113         cmpb    #0x63           ;'c'
   A220 26 01         [ 3] 4114         bne     LA1E6
   A222 39            [ 5] 4115         rts
                           4116 
                           4117 ; erase and reprogram EEPROM signature
   A223                    4118 LA1E6:
   A223 86 0E         [ 2] 4119         ldaa    #0x0E
   A225 B7 10 3B      [ 4] 4120         staa    PPROG
   A228 86 FF         [ 2] 4121         ldaa    #0xFF
   A22A B7 0E 00      [ 4] 4122         staa    (0x0E00)
   A22D B6 10 3B      [ 4] 4123         ldaa    PPROG  
   A230 8A 01         [ 2] 4124         oraa    #0x01
   A232 B7 10 3B      [ 4] 4125         staa    PPROG  
   A235 CE 1B 58      [ 3] 4126         ldx     #0x1B58         ; 7000
   A238                    4127 LA1FB:
   A238 09            [ 3] 4128         dex
   A239 26 FD         [ 3] 4129         bne     LA1FB  
   A23B B6 10 3B      [ 4] 4130         ldaa    PPROG  
   A23E 84 FE         [ 2] 4131         anda    #0xFE
   A240 B7 10 3B      [ 4] 4132         staa    PPROG  
   A243 CE 0E 00      [ 3] 4133         ldx     #0x0E00
   A246 18 CE A2 63   [ 4] 4134         ldy     #LA226
   A24A                    4135 LA20D:
   A24A C6 02         [ 2] 4136         ldab    #0x02
   A24C F7 10 3B      [ 4] 4137         stab    PPROG  
   A24F 18 A6 00      [ 5] 4138         ldaa    0,Y     
   A252 18 08         [ 4] 4139         iny
   A254 A7 00         [ 4] 4140         staa    0,X     
   A256 BD A2 6F      [ 6] 4141         jsr     LA232
   A259 08            [ 3] 4142         inx
   A25A 8C 0E 0C      [ 4] 4143         cpx     #0x0E0C
   A25D 26 EB         [ 3] 4144         bne     LA20D  
   A25F 7F 10 3B      [ 6] 4145         clr     PPROG  
   A262 39            [ 5] 4146         rts
                           4147 
                           4148 ; data for 0x0E00-0x0E0B EEPROM
   A263                    4149 LA226:
   A263 29 64 2A 21 32 3A  4150         .ascii  ')d*!2::4!ecq'
        3A 34 21 65 63 71
                           4151 
                           4152 ; program EEPROM
   A26F                    4153 LA232:
   A26F 18 3C         [ 5] 4154         pshy
   A271 C6 03         [ 2] 4155         ldab    #0x03
   A273 F7 10 3B      [ 4] 4156         stab    PPROG           ; start program
   A276 18 CE 1B 58   [ 4] 4157         ldy     #0x1B58
   A27A                    4158 LA23D:
   A27A 18 09         [ 4] 4159         dey
   A27C 26 FC         [ 3] 4160         bne     LA23D  
   A27E C6 02         [ 2] 4161         ldab    #0x02
   A280 F7 10 3B      [ 4] 4162         stab    PPROG           ; stop program
   A283 18 38         [ 6] 4163         puly
   A285 39            [ 5] 4164         rts
                           4165 
   A286                    4166 LA249:
   A286 0F            [ 2] 4167         sei
   A287 CE 00 10      [ 3] 4168         ldx     #0x0010
   A28A                    4169 LA24D:
   A28A 6F 00         [ 6] 4170         clr     0,X     
   A28C 08            [ 3] 4171         inx
   A28D 8C 0E 00      [ 4] 4172         cpx     #0x0E00
   A290 26 F8         [ 3] 4173         bne     LA24D  
   A292 BD 9E EC      [ 6] 4174         jsr     L9EAF           ; reset L counts
   A295 BD 9E CF      [ 6] 4175         jsr     L9E92           ; reset R counts
   A298 7E F8 00      [ 3] 4176         jmp     RESET           ; reset controller
                           4177 
                           4178 ; Compute and store copyright checksum
   A29B                    4179 LA25E:
   A29B 18 CE 80 03   [ 4] 4180         ldy     #CPYRTMSG       ; copyright message
   A29F CE 00 00      [ 3] 4181         ldx     #0x0000
   A2A2                    4182 LA265:
   A2A2 18 E6 00      [ 5] 4183         ldab    0,Y
   A2A5 3A            [ 3] 4184         abx
   A2A6 18 08         [ 4] 4185         iny
   A2A8 18 8C 80 50   [ 5] 4186         cpy     #0x8050
   A2AC 26 F4         [ 3] 4187         bne     LA265
   A2AE FF 04 0B      [ 5] 4188         stx     CPYRTCS         ; store checksum here
   A2B1 39            [ 5] 4189         rts
                           4190 
                           4191 ; Erase EEPROM routine
   A2B2                    4192 LA275:
   A2B2 0F            [ 2] 4193         sei
   A2B3 7F 04 0F      [ 6] 4194         clr     ERASEFLG        ; Reset EEPROM Erase flag
   A2B6 86 0E         [ 2] 4195         ldaa    #0x0E
   A2B8 B7 10 3B      [ 4] 4196         staa    PPROG           ; ERASE mode!
   A2BB 86 FF         [ 2] 4197         ldaa    #0xFF
   A2BD B7 0E 20      [ 4] 4198         staa    (0x0E20)        ; save in NVRAM
   A2C0 B6 10 3B      [ 4] 4199         ldaa    PPROG  
   A2C3 8A 01         [ 2] 4200         oraa    #0x01
   A2C5 B7 10 3B      [ 4] 4201         staa    PPROG           ; do the ERASE
   A2C8 CE 1B 58      [ 3] 4202         ldx     #0x1B58         ; delay a bit
   A2CB                    4203 LA28E:
   A2CB 09            [ 3] 4204         dex
   A2CC 26 FD         [ 3] 4205         bne     LA28E  
   A2CE B6 10 3B      [ 4] 4206         ldaa    PPROG  
   A2D1 84 FE         [ 2] 4207         anda    #0xFE           ; stop erasing
   A2D3 7F 10 3B      [ 6] 4208         clr     PPROG  
                           4209 
   A2D6 BD FB 0C      [ 6] 4210         jsr     SERMSGW         ; display "enter serial number"
   A2D9 45 6E 74 65 72 20  4211         .ascis  'Enter serial #: '
        73 65 72 69 61 6C
        20 23 3A A0
                           4212 
   A2E9 CE 0E 20      [ 3] 4213         ldx     #0x0E20
   A2EC                    4214 LA2AF:
   A2EC BD FA 79      [ 6] 4215         jsr     SERIALR         ; wait for serial data
   A2EF 24 FB         [ 3] 4216         bcc     LA2AF  
                           4217 
   A2F1 BD FA A3      [ 6] 4218         jsr     SERIALW         ; read serial data
   A2F4 C6 02         [ 2] 4219         ldab    #0x02
   A2F6 F7 10 3B      [ 4] 4220         stab    PPROG           ; protect only 0x0e20-0x0e5f
   A2F9 A7 00         [ 4] 4221         staa    0,X         
   A2FB BD A2 6F      [ 6] 4222         jsr     LA232           ; program byte
   A2FE 08            [ 3] 4223         inx
   A2FF 8C 0E 24      [ 4] 4224         cpx     #0x0E24
   A302 26 E8         [ 3] 4225         bne     LA2AF  
   A304 C6 02         [ 2] 4226         ldab    #0x02
   A306 F7 10 3B      [ 4] 4227         stab    PPROG  
   A309 86 DB         [ 2] 4228         ldaa    #0xDB           ; it's official
   A30B B7 0E 24      [ 4] 4229         staa    (0x0E24)
   A30E BD A2 6F      [ 6] 4230         jsr     LA232           ; program byte
   A311 7F 10 3B      [ 6] 4231         clr     PPROG  
   A314 86 1E         [ 2] 4232         ldaa    #0x1E
   A316 B7 10 35      [ 4] 4233         staa    BPROT           ; protect all but 0x0e00-0x0e1f
   A319 7E F8 00      [ 3] 4234         jmp     RESET           ; reset controller
                           4235 
   A31C                    4236 LA2DF:
   A31C 38            [ 5] 4237         pulx
   A31D 3C            [ 4] 4238         pshx
   A31E 8C 80 00      [ 4] 4239         cpx     #0x8000
   A321 25 02         [ 3] 4240         bcs     LA2E8           ; if 0x8000 < calling address (should be)
   A323 0C            [ 2] 4241         clc
   A324 39            [ 5] 4242         rts
                           4243 
   A325                    4244 LA2E8:
   A325 0D            [ 2] 4245         sec
   A326 39            [ 5] 4246         rts
                           4247 
                           4248 ; enter and validate security code via serial
   A327                    4249 LA2EA:
   A327 CE 02 88      [ 3] 4250         ldx     #0x0288
   A32A C6 03         [ 2] 4251         ldab    #0x03           ; 3 character code
                           4252 
   A32C                    4253 LA2EF:
   A32C BD FA 79      [ 6] 4254         jsr     SERIALR         ; check if available
   A32F 24 FB         [ 3] 4255         bcc     LA2EF  
   A331 A7 00         [ 4] 4256         staa    0,X     
   A333 08            [ 3] 4257         inx
   A334 5A            [ 2] 4258         decb
   A335 26 F5         [ 3] 4259         bne     LA2EF  
                           4260 
   A337 B6 02 88      [ 4] 4261         ldaa    (0x0288)
   A33A 81 13         [ 2] 4262         cmpa    #0x13           ; 0x13
   A33C 26 10         [ 3] 4263         bne     LA311  
   A33E B6 02 89      [ 4] 4264         ldaa    (0x0289)
   A341 81 10         [ 2] 4265         cmpa    #0x10           ; 0x10
   A343 26 09         [ 3] 4266         bne     LA311  
   A345 B6 02 8A      [ 4] 4267         ldaa    (0x028A)
   A348 81 14         [ 2] 4268         cmpa    #0x14           ; 0x14
   A34A 26 02         [ 3] 4269         bne     LA311  
   A34C 0C            [ 2] 4270         clc
   A34D 39            [ 5] 4271         rts
                           4272 
   A34E                    4273 LA311:
   A34E 0D            [ 2] 4274         sec
   A34F 39            [ 5] 4275         rts
                           4276 
   A350                    4277 LA313:
   A350 36            [ 3] 4278         psha
   A351 B6 10 92      [ 4] 4279         ldaa    (0x1092)
   A354 8A 01         [ 2] 4280         oraa    #0x01
   A356                    4281 LA319:
   A356 B7 10 92      [ 4] 4282         staa    (0x1092)
   A359 32            [ 4] 4283         pula
   A35A 39            [ 5] 4284         rts
                           4285 
   A35B                    4286 LA31E:
   A35B 36            [ 3] 4287         psha
   A35C B6 10 92      [ 4] 4288         ldaa    (0x1092)
   A35F 84 FE         [ 2] 4289         anda    #0xFE
   A361 20 F3         [ 3] 4290         bra     LA319
                           4291 
   A363                    4292 LA326:
   A363 96 4E         [ 3] 4293         ldaa    (0x004E)
   A365 97 19         [ 3] 4294         staa    (0x0019)
   A367 7F 00 4E      [ 6] 4295         clr     (0x004E)
   A36A 39            [ 5] 4296         rts
                           4297 
   A36B                    4298 LA32E:
   A36B B6 10 86      [ 4] 4299         ldaa    (0x1086)
   A36E 8A 15         [ 2] 4300         oraa    #0x15
   A370 B7 10 86      [ 4] 4301         staa    (0x1086)
   A373 C6 01         [ 2] 4302         ldab    #0x01
   A375 BD 8C 40      [ 6] 4303         jsr     DLYSECSBY2      ; delay 0.5 sec
   A378 84 EA         [ 2] 4304         anda    #0xEA
   A37A B7 10 86      [ 4] 4305         staa    (0x1086)
   A37D 39            [ 5] 4306         rts
                           4307 
   A37E                    4308 LA341:
   A37E B6 10 86      [ 4] 4309         ldaa    (0x1086)
   A381 8A 2A         [ 2] 4310         oraa    #0x2A           ; xx1x1x1x
   A383 B7 10 86      [ 4] 4311         staa    (0x1086)
   A386 C6 01         [ 2] 4312         ldab    #0x01
   A388 BD 8C 40      [ 6] 4313         jsr     DLYSECSBY2      ; delay 0.5 sec
   A38B 84 D5         [ 2] 4314         anda    #0xD5           ; xx0x0x0x
   A38D B7 10 86      [ 4] 4315         staa    (0x1086)
   A390 39            [ 5] 4316         rts
                           4317 
   A391                    4318 LA354:
   A391 F6 18 04      [ 4] 4319         ldab    PIA0PRA 
   A394 CA 08         [ 2] 4320         orab    #0x08
   A396 F7 18 04      [ 4] 4321         stab    PIA0PRA 
   A399 39            [ 5] 4322         rts
                           4323 
   A39A F6 18 04      [ 4] 4324         ldab    PIA0PRA 
   A39D C4 F7         [ 2] 4325         andb    #0xF7
   A39F F7 18 04      [ 4] 4326         stab    PIA0PRA 
   A3A2 39            [ 5] 4327         rts
                           4328 
                           4329 ;'$' command goes here?
   A3A3                    4330 LA366:
   A3A3 7F 00 4E      [ 6] 4331         clr     (0x004E)
   A3A6 BD 86 D4      [ 6] 4332         jsr     L86C4           ; Reset boards 1-10
   A3A9 7F 04 2A      [ 6] 4333         clr     (0x042A)
                           4334 
   A3AC BD FB 0C      [ 6] 4335         jsr     SERMSGW
   A3AF 45 6E 74 65 72 20  4336         .ascis  'Enter security code:' 
        73 65 63 75 72 69
        74 79 20 63 6F 64
        65 BA
                           4337 
   A3C3 BD A3 27      [ 6] 4338         jsr     LA2EA
   A3C6 24 03         [ 3] 4339         bcc     LA38E
   A3C8 7E 83 3A      [ 3] 4340         jmp     L8331
                           4341 
   A3CB                    4342 LA38E:
   A3CB BD FB 0C      [ 6] 4343         jsr     SERMSGW      
   A3CE 0C 0A 0D 44 61 76  4344         .ascii  "\f\n\rDave's Setup Utility\n\r"
        65 27 73 20 53 65
        74 75 70 20 55 74
        69 6C 69 74 79 0A
        0D
   A3E7 3C 4B 3E 69 6E 67  4345         .ascii  '<K>ing enable\n\r'
        20 65 6E 61 62 6C
        65 0A 0D
   A3F6 3C 43 3E 6C 65 61  4346         .ascii  '<C>lear random\n\r'
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A406 3C 35 3E 20 63 68  4347         .ascii  '<5> character random\n\r'
        61 72 61 63 74 65
        72 20 72 61 6E 64
        6F 6D 0A 0D
   A41C 3C 4C 3E 69 76 65  4348         .ascii  '<L>ive tape number clear\n\r'
        20 74 61 70 65 20
        6E 75 6D 62 65 72
        20 63 6C 65 61 72
        0A 0D
   A436 3C 52 3E 65 67 75  4349         .ascii  '<R>egular tape number clear\n\r'
        6C 61 72 20 74 61
        70 65 20 6E 75 6D
        62 65 72 20 63 6C
        65 61 72 0A 0D
   A453 3C 54 3E 65 73 74  4350         .ascii  '<T>est driver boards\n\r'
        20 64 72 69 76 65
        72 20 62 6F 61 72
        64 73 0A 0D
   A469 3C 42 3E 75 62 20  4351         .ascii  '<B>ub test\n\r'
        74 65 73 74 0A 0D
   A475 3C 44 3E 65 63 6B  4352         .ascii  '<D>eck test (with tape inserted)\n\r'
        20 74 65 73 74 20
        28 77 69 74 68 20
        74 61 70 65 20 69
        6E 73 65 72 74 65
        64 29 0A 0D
   A497 3C 37 3E 35 25 20  4353         .ascii  '<7>5% adjustment\n\r'
        61 64 6A 75 73 74
        6D 65 6E 74 0A 0D
   A4A9 3C 53 3E 68 6F 77  4354         .ascii  '<S>how re-valid tapes\n\r'
        20 72 65 2D 76 61
        6C 69 64 20 74 61
        70 65 73 0A 0D
   A4C0 3C 4A 3E 75 6D 70  4355         .ascis  '<J>ump to system\n\r'
        20 74 6F 20 73 79
        73 74 65 6D 0A 8D
                           4356 
   A4D2                    4357 LA495:
   A4D2 BD FA 79      [ 6] 4358         jsr     SERIALR     
   A4D5 24 FB         [ 3] 4359         bcc     LA495  
   A4D7 81 43         [ 2] 4360         cmpa    #0x43           ;'C'
   A4D9 26 09         [ 3] 4361         bne     LA4A7  
   A4DB 7F 04 01      [ 6] 4362         clr     (0x0401)        ;clear random
   A4DE 7F 04 2B      [ 6] 4363         clr     (0x042B)
   A4E1 7E A5 51      [ 3] 4364         jmp     LA514
   A4E4                    4365 LA4A7:
   A4E4 81 35         [ 2] 4366         cmpa    #0x35           ;'5'
   A4E6 26 0D         [ 3] 4367         bne     LA4B8  
   A4E8 B6 04 01      [ 4] 4368         ldaa    (0x0401)        ;5 character random
   A4EB 84 7F         [ 2] 4369         anda    #0x7F
   A4ED 8A 7F         [ 2] 4370         oraa    #0x7F
   A4EF B7 04 01      [ 4] 4371         staa    (0x0401)
   A4F2 7E A5 51      [ 3] 4372         jmp     LA514
   A4F5                    4373 LA4B8:
   A4F5 81 4C         [ 2] 4374         cmpa    #0x4C           ;'L'
   A4F7 26 06         [ 3] 4375         bne     LA4C2
   A4F9 BD 9E EC      [ 6] 4376         jsr     L9EAF           ; reset Liv counts
   A4FC 7E A5 51      [ 3] 4377         jmp     LA514
   A4FF                    4378 LA4C2:
   A4FF 81 52         [ 2] 4379         cmpa    #0x52           ;'R'
   A501 26 06         [ 3] 4380         bne     LA4CC  
   A503 BD 9E CF      [ 6] 4381         jsr     L9E92           ; reset Reg counts
   A506 7E A5 51      [ 3] 4382         jmp     LA514
   A509                    4383 LA4CC:
   A509 81 54         [ 2] 4384         cmpa    #0x54           ;'T'
   A50B 26 06         [ 3] 4385         bne     LA4D6  
   A50D BD A5 A2      [ 6] 4386         jsr     LA565           ; test driver boards
   A510 7E A5 51      [ 3] 4387         jmp     LA514
   A513                    4388 LA4D6:
   A513 81 42         [ 2] 4389         cmpa    #0x42           ;'B'
   A515 26 06         [ 3] 4390         bne     LA4E0  
   A517 BD A5 63      [ 6] 4391         jsr     LA526           ; bulb test?
   A51A 7E A5 51      [ 3] 4392         jmp     LA514
   A51D                    4393 LA4E0:
   A51D 81 44         [ 2] 4394         cmpa    #0x44           ;'D'
   A51F 26 06         [ 3] 4395         bne     LA4EA  
   A521 BD A5 79      [ 6] 4396         jsr     LA53C           ; deck test
   A524 7E A5 51      [ 3] 4397         jmp     LA514
   A527                    4398 LA4EA:
   A527 81 37         [ 2] 4399         cmpa    #0x37           ;'7'
   A529 26 08         [ 3] 4400         bne     LA4F6  
   A52B C6 FB         [ 2] 4401         ldab    #0xFB           ; tape deck PLAY
   A52D BD 86 F7      [ 6] 4402         jsr     L86E7           ; 5% adjustment
   A530 7E A5 51      [ 3] 4403         jmp     LA514
   A533                    4404 LA4F6:
   A533 81 4A         [ 2] 4405         cmpa    #0x4A           ;'J'
   A535 26 03         [ 3] 4406         bne     LA4FD  
   A537 7E F8 00      [ 3] 4407         jmp     RESET           ; jump to system (reset)
   A53A                    4408 LA4FD:
   A53A 81 4B         [ 2] 4409         cmpa    #0x4B           ;'K'
   A53C 26 06         [ 3] 4410         bne     LA507  
   A53E 7C 04 2A      [ 6] 4411         inc     (0x042A)        ; King enable
   A541 7E A5 51      [ 3] 4412         jmp     LA514
   A544                    4413 LA507:
   A544 81 53         [ 2] 4414         cmpa    #0x53           ;'S'
   A546 26 06         [ 3] 4415         bne     LA511  
   A548 BD AB B9      [ 6] 4416         jsr     LAB7C           ; show re-valid tapes
   A54B 7E A5 51      [ 3] 4417         jmp     LA514
   A54E                    4418 LA511:
   A54E 7E A4 D2      [ 3] 4419         jmp     LA495
   A551                    4420 LA514:
   A551 86 07         [ 2] 4421         ldaa    #0x07
   A553 BD FA A3      [ 6] 4422         jsr     SERIALW      
   A556 C6 01         [ 2] 4423         ldab    #0x01
   A558 BD 8C 40      [ 6] 4424         jsr     DLYSECSBY2      ; delay 0.5 sec
   A55B 86 07         [ 2] 4425         ldaa    #0x07
   A55D BD FA A3      [ 6] 4426         jsr     SERIALW      
   A560 7E A3 CB      [ 3] 4427         jmp     LA38E
                           4428 
                           4429 ; bulb test
   A563                    4430 LA526:
   A563 5F            [ 2] 4431         clrb
   A564 BD FA F9      [ 6] 4432         jsr     BUTNLIT 
   A567                    4433 LA52A:
   A567 F6 10 0A      [ 4] 4434         ldab    PORTE
   A56A C8 FF         [ 2] 4435         eorb    #0xFF
   A56C BD FA F9      [ 6] 4436         jsr     BUTNLIT 
   A56F C1 80         [ 2] 4437         cmpb    #0x80
   A571 26 F4         [ 3] 4438         bne     LA52A  
   A573 C6 02         [ 2] 4439         ldab    #0x02
   A575 BD 8C 40      [ 6] 4440         jsr     DLYSECSBY2      ; delay 1 sec
   A578 39            [ 5] 4441         rts
                           4442 
                           4443 ; deck test
   A579                    4444 LA53C:
   A579 C6 FD         [ 2] 4445         ldab    #0xFD           ; tape deck STOP
   A57B BD 86 F7      [ 6] 4446         jsr     L86E7
   A57E C6 06         [ 2] 4447         ldab    #0x06
   A580 BD 8C 40      [ 6] 4448         jsr     DLYSECSBY2      ; delay 3 sec
   A583 C6 FB         [ 2] 4449         ldab    #0xFB           ; tape deck PLAY
   A585 BD 86 F7      [ 6] 4450         jsr     L86E7
   A588 C6 06         [ 2] 4451         ldab    #0x06
   A58A BD 8C 40      [ 6] 4452         jsr     DLYSECSBY2      ; delay 3 sec
   A58D C6 FD         [ 2] 4453         ldab    #0xFD           ; tape deck STOP
   A58F BD 86 F7      [ 6] 4454         jsr     L86E7
   A592 C6 F7         [ 2] 4455         ldab    #0xF7
   A594 BD 86 F7      [ 6] 4456         jsr     L86E7           ; tape deck REWIND
   A597 C6 06         [ 2] 4457         ldab    #0x06
   A599 BD 8C 40      [ 6] 4458         jsr     DLYSECSBY2      ; delay 3 sec
   A59C C6 EF         [ 2] 4459         ldab    #0xEF           ; tape deck EJECT
   A59E BD 86 F7      [ 6] 4460         jsr     L86E7
   A5A1 39            [ 5] 4461         rts
                           4462 
                           4463 ; test driver boards
   A5A2                    4464 LA565:
   A5A2 BD FA 79      [ 6] 4465         jsr     SERIALR     
   A5A5 24 08         [ 3] 4466         bcc     LA572  
   A5A7 81 1B         [ 2] 4467         cmpa    #0x1B
   A5A9 26 04         [ 3] 4468         bne     LA572  
   A5AB BD 86 D4      [ 6] 4469         jsr     L86C4           ; Reset boards 1-10
   A5AE 39            [ 5] 4470         rts
   A5AF                    4471 LA572:
   A5AF 86 08         [ 2] 4472         ldaa    #0x08
   A5B1 97 15         [ 3] 4473         staa    (0x0015)
   A5B3 BD 86 D4      [ 6] 4474         jsr     L86C4           ; Reset boards 1-10
   A5B6 86 01         [ 2] 4475         ldaa    #0x01
   A5B8                    4476 LA57B:
   A5B8 36            [ 3] 4477         psha
   A5B9 16            [ 2] 4478         tab
   A5BA BD FA F9      [ 6] 4479         jsr     BUTNLIT 
   A5BD B6 18 04      [ 4] 4480         ldaa    PIA0PRA 
   A5C0 88 08         [ 2] 4481         eora    #0x08
   A5C2 B7 18 04      [ 4] 4482         staa    PIA0PRA 
   A5C5 32            [ 4] 4483         pula
   A5C6 B7 10 80      [ 4] 4484         staa    (0x1080)
   A5C9 B7 10 84      [ 4] 4485         staa    (0x1084)
   A5CC B7 10 88      [ 4] 4486         staa    (0x1088)
   A5CF B7 10 8C      [ 4] 4487         staa    (0x108C)
   A5D2 B7 10 90      [ 4] 4488         staa    (0x1090)
   A5D5 B7 10 94      [ 4] 4489         staa    (0x1094)
   A5D8 B7 10 98      [ 4] 4490         staa    (0x1098)
   A5DB B7 10 9C      [ 4] 4491         staa    (0x109C)
   A5DE C6 14         [ 2] 4492         ldab    #0x14
   A5E0 BD A6 8F      [ 6] 4493         jsr     LA652
   A5E3 49            [ 2] 4494         rola
   A5E4 36            [ 3] 4495         psha
   A5E5 D6 15         [ 3] 4496         ldab    (0x0015)
   A5E7 5A            [ 2] 4497         decb
   A5E8 D7 15         [ 3] 4498         stab    (0x0015)
   A5EA BD FA C9      [ 6] 4499         jsr     DIAGDGT         ; write digit to the diag display
   A5ED 37            [ 3] 4500         pshb
   A5EE C6 27         [ 2] 4501         ldab    #0x27
   A5F0 96 15         [ 3] 4502         ldaa    (0x0015)
   A5F2 0C            [ 2] 4503         clc
   A5F3 89 30         [ 2] 4504         adca    #0x30
   A5F5 BD 8D C5      [ 6] 4505         jsr     L8DB5           ; display char here on LCD display
   A5F8 33            [ 4] 4506         pulb
   A5F9 32            [ 4] 4507         pula
   A5FA 5D            [ 2] 4508         tstb
   A5FB 26 BB         [ 3] 4509         bne     LA57B  
   A5FD 86 08         [ 2] 4510         ldaa    #0x08
   A5FF 97 15         [ 3] 4511         staa    (0x0015)
   A601 BD 86 D4      [ 6] 4512         jsr     L86C4           ; Reset boards 1-10
   A604 86 01         [ 2] 4513         ldaa    #0x01
   A606                    4514 LA5C9:
   A606 B7 10 82      [ 4] 4515         staa    (0x1082)
   A609 B7 10 86      [ 4] 4516         staa    (0x1086)
   A60C B7 10 8A      [ 4] 4517         staa    (0x108A)
   A60F B7 10 8E      [ 4] 4518         staa    (0x108E)
   A612 B7 10 92      [ 4] 4519         staa    (0x1092)
   A615 B7 10 96      [ 4] 4520         staa    (0x1096)
   A618 B7 10 9A      [ 4] 4521         staa    (0x109A)
   A61B B7 10 9E      [ 4] 4522         staa    (0x109E)
   A61E C6 14         [ 2] 4523         ldab    #0x14
   A620 BD A6 8F      [ 6] 4524         jsr     LA652
   A623 49            [ 2] 4525         rola
   A624 36            [ 3] 4526         psha
   A625 D6 15         [ 3] 4527         ldab    (0x0015)
   A627 5A            [ 2] 4528         decb
   A628 D7 15         [ 3] 4529         stab    (0x0015)
   A62A BD FA C9      [ 6] 4530         jsr     DIAGDGT         ; write digit to the diag display
   A62D 37            [ 3] 4531         pshb
   A62E C6 27         [ 2] 4532         ldab    #0x27
   A630 96 15         [ 3] 4533         ldaa    (0x0015)
   A632 0C            [ 2] 4534         clc
   A633 89 30         [ 2] 4535         adca    #0x30
   A635 BD 8D C5      [ 6] 4536         jsr     L8DB5           ; display char here on LCD display
   A638 33            [ 4] 4537         pulb
   A639 32            [ 4] 4538         pula
   A63A 7D 00 15      [ 6] 4539         tst     (0x0015)
   A63D 26 C7         [ 3] 4540         bne     LA5C9  
   A63F BD 86 D4      [ 6] 4541         jsr     L86C4           ; Reset boards 1-10
   A642 CE 10 80      [ 3] 4542         ldx     #0x1080
   A645 C6 00         [ 2] 4543         ldab    #0x00
   A647                    4544 LA60A:
   A647 86 FF         [ 2] 4545         ldaa    #0xFF
   A649 A7 00         [ 4] 4546         staa    0,X
   A64B A7 02         [ 4] 4547         staa    2,X     
   A64D 37            [ 3] 4548         pshb
   A64E C6 1E         [ 2] 4549         ldab    #0x1E
   A650 BD A6 8F      [ 6] 4550         jsr     LA652
   A653 33            [ 4] 4551         pulb
   A654 86 00         [ 2] 4552         ldaa    #0x00
   A656 A7 00         [ 4] 4553         staa    0,X     
   A658 A7 02         [ 4] 4554         staa    2,X     
   A65A 5C            [ 2] 4555         incb
   A65B 3C            [ 4] 4556         pshx
   A65C BD FA C9      [ 6] 4557         jsr     DIAGDGT         ; write digit to the diag display
   A65F 37            [ 3] 4558         pshb
   A660 C6 27         [ 2] 4559         ldab    #0x27
   A662 32            [ 4] 4560         pula
   A663 36            [ 3] 4561         psha
   A664 0C            [ 2] 4562         clc
   A665 89 30         [ 2] 4563         adca    #0x30
   A667 BD 8D C5      [ 6] 4564         jsr     L8DB5           ; display char here on LCD display
   A66A 33            [ 4] 4565         pulb
   A66B 38            [ 5] 4566         pulx
   A66C 08            [ 3] 4567         inx
   A66D 08            [ 3] 4568         inx
   A66E 08            [ 3] 4569         inx
   A66F 08            [ 3] 4570         inx
   A670 8C 10 9D      [ 4] 4571         cpx     #0x109D
   A673 25 D2         [ 3] 4572         bcs     LA60A  
   A675 CE 10 80      [ 3] 4573         ldx     #0x1080
   A678                    4574 LA63B:
   A678 86 FF         [ 2] 4575         ldaa    #0xFF
   A67A A7 00         [ 4] 4576         staa    0,X     
   A67C A7 02         [ 4] 4577         staa    2,X     
   A67E 08            [ 3] 4578         inx
   A67F 08            [ 3] 4579         inx
   A680 08            [ 3] 4580         inx
   A681 08            [ 3] 4581         inx
   A682 8C 10 9D      [ 4] 4582         cpx     #0x109D
   A685 25 F1         [ 3] 4583         bcs     LA63B  
   A687 C6 06         [ 2] 4584         ldab    #0x06
   A689 BD 8C 40      [ 6] 4585         jsr     DLYSECSBY2      ; delay 3 sec
   A68C 7E A5 A2      [ 3] 4586         jmp     LA565
   A68F                    4587 LA652:
   A68F 36            [ 3] 4588         psha
   A690 4F            [ 2] 4589         clra
   A691 DD 23         [ 4] 4590         std     CDTIMR5
   A693                    4591 LA656:
   A693 7D 00 24      [ 6] 4592         tst     CDTIMR5+1
   A696 26 FB         [ 3] 4593         bne     LA656  
   A698 32            [ 4] 4594         pula
   A699 39            [ 5] 4595         rts
                           4596 
                           4597 ; Comma-seperated text
   A69A                    4598 LA65D:
   A69A 30 2C 43 68 75 63  4599         .ascii  '0,Chuck,Mouth,'
        6B 2C 4D 6F 75 74
        68 2C
   A6A8 31 2C 48 65 61 64  4600         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A6B4 32 2C 48 65 61 64  4601         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A6C1 32 2C 48 65 61 64  4602         .ascii  '2,Head up,'
        20 75 70 2C
   A6CB 32 2C 45 79 65 73  4603         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A6D8 31 2C 45 79 65 6C  4604         .ascii  '1,Eyelids,'
        69 64 73 2C
   A6E2 31 2C 52 69 67 68  4605         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A6EF 32 2C 45 79 65 73  4606         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A6FB 31 2C 38 2C 48 65  4607         .ascii  '1,8,Helen,Mouth,'
        6C 65 6E 2C 4D 6F
        75 74 68 2C
   A70B 31 2C 48 65 61 64  4608         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A717 32 2C 48 65 61 64  4609         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A724 32 2C 48 65 61 64  4610         .ascii  '2,Head up,'
        20 75 70 2C
   A72E 32 2C 45 79 65 73  4611         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A73B 31 2C 45 79 65 6C  4612         .ascii  '1,Eyelids,'
        69 64 73 2C
   A745 31 2C 52 69 67 68  4613         .ascii  '1,Right hand,'
        74 20 68 61 6E 64
        2C
   A752 32 2C 45 79 65 73  4614         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A75E 31 2C 36 2C 4D 75  4615         .ascii  '1,6,Munch,Mouth,'
        6E 63 68 2C 4D 6F
        75 74 68 2C
   A76E 31 2C 48 65 61 64  4616         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A77A 32 2C 48 65 61 64  4617         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A787 32 2C 4C 65 66 74  4618         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A792 32 2C 45 79 65 73  4619         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A79F 31 2C 45 79 65 6C  4620         .ascii  '1,Eyelids,'
        69 64 73 2C
   A7A9 31 2C 52 69 67 68  4621         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A7B5 32 2C 45 79 65 73  4622         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A7C1 31 2C 32 2C 4A 61  4623         .ascii  '1,2,Jasper,Mouth,'
        73 70 65 72 2C 4D
        6F 75 74 68 2C
   A7D2 31 2C 48 65 61 64  4624         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A7DE 32 2C 48 65 61 64  4625         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A7EB 32 2C 48 65 61 64  4626         .ascii  '2,Head up,'
        20 75 70 2C
   A7F5 32 2C 45 79 65 73  4627         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A802 31 2C 45 79 65 6C  4628         .ascii  '1,Eyelids,'
        69 64 73 2C
   A80C 31 2C 48 61 6E 64  4629         .ascii  '1,Hands,'
        73 2C
   A814 32 2C 45 79 65 73  4630         .ascii  '2,Eyes left,'
        20 6C 65 66 74 2C
   A820 31 2C 34 2C 50 61  4631         .ascii  '1,4,Pasqually,Mouth-Mustache,'
        73 71 75 61 6C 6C
        79 2C 4D 6F 75 74
        68 2D 4D 75 73 74
        61 63 68 65 2C
   A83D 31 2C 48 65 61 64  4632         .ascii  '1,Head left,'
        20 6C 65 66 74 2C
   A849 32 2C 48 65 61 64  4633         .ascii  '2,Head right,'
        20 72 69 67 68 74
        2C
   A856 32 2C 4C 65 66 74  4634         .ascii  '2,Left arm,'
        20 61 72 6D 2C
   A861 32 2C 45 79 65 73  4635         .ascii  '2,Eyes right,'
        20 72 69 67 68 74
        2C
   A86E 31 2C 45 79 65 6C  4636         .ascii  '1,Eyelids,'
        69 64 73 2C
   A878 31 2C 52 69 67 68  4637         .ascii  '1,Right arm,'
        74 20 61 72 6D 2C
   A884 32 2C 45 79 65 73  4638         .ascii  '2,Eyes left,1,'
        20 6C 65 66 74 2C
        31 2C
                           4639 
   A892                    4640 LA855:
   A892 3C            [ 4] 4641         pshx
   A893 BD 86 D4      [ 6] 4642         jsr     L86C4           ; Reset boards 1-10
   A896 CE 10 80      [ 3] 4643         ldx     #0x1080
   A899 86 20         [ 2] 4644         ldaa    #0x20
   A89B A7 00         [ 4] 4645         staa    0,X
   A89D A7 04         [ 4] 4646         staa    4,X
   A89F A7 08         [ 4] 4647         staa    8,X
   A8A1 A7 0C         [ 4] 4648         staa    12,X
   A8A3 A7 10         [ 4] 4649         staa    16,X
   A8A5 38            [ 5] 4650         pulx
   A8A6 39            [ 5] 4651         rts
                           4652 
   A8A7                    4653 LA86A:
   A8A7 BD A3 6B      [ 6] 4654         jsr     LA32E
                           4655 
   A8AA BD 8D F4      [ 6] 4656         jsr     LCDMSG1 
   A8AD 20 20 20 20 57 61  4657         .ascis  '    Warm-Up  '
        72 6D 2D 55 70 20
        A0
                           4658 
   A8BA BD 8D ED      [ 6] 4659         jsr     LCDMSG2 
   A8BD 43 75 72 74 61 69  4660         .ascis  'Curtains opening'
        6E 73 20 6F 70 65
        6E 69 6E E7
                           4661 
   A8CD C6 14         [ 2] 4662         ldab    #0x14
   A8CF BD 8C 40      [ 6] 4663         jsr     DLYSECSBY2      ; delay 10 sec
   A8D2                    4664 LA895:
   A8D2 BD A8 92      [ 6] 4665         jsr     LA855
   A8D5 C6 02         [ 2] 4666         ldab    #0x02
   A8D7 BD 8C 40      [ 6] 4667         jsr     DLYSECSBY2      ; delay 1 sec
   A8DA CE A6 9A      [ 3] 4668         ldx     #LA65D
   A8DD C6 05         [ 2] 4669         ldab    #0x05
   A8DF D7 12         [ 3] 4670         stab    (0x0012)
   A8E1                    4671 LA8A4:
   A8E1 C6 08         [ 2] 4672         ldab    #0x08
   A8E3 D7 13         [ 3] 4673         stab    (0x0013)
   A8E5 BD A9 7E      [ 6] 4674         jsr     LA941
   A8E8 BD A9 89      [ 6] 4675         jsr     LA94C
   A8EB C6 02         [ 2] 4676         ldab    #0x02
   A8ED BD 8C 40      [ 6] 4677         jsr     DLYSECSBY2      ; delay 1 sec
   A8F0                    4678 LA8B3:
   A8F0 BD A9 9B      [ 6] 4679         jsr     LA95E
   A8F3 A6 00         [ 4] 4680         ldaa    0,X     
   A8F5 80 30         [ 2] 4681         suba    #0x30
   A8F7 08            [ 3] 4682         inx
   A8F8 08            [ 3] 4683         inx
   A8F9 36            [ 3] 4684         psha
   A8FA 7C 00 4C      [ 6] 4685         inc     (0x004C)
   A8FD 3C            [ 4] 4686         pshx
   A8FE BD 88 F5      [ 6] 4687         jsr     L88E5
   A901 38            [ 5] 4688         pulx
   A902 86 4F         [ 2] 4689         ldaa    #0x4F           ;'O'
   A904 C6 0C         [ 2] 4690         ldab    #0x0C
   A906 BD 8D C5      [ 6] 4691         jsr     L8DB5           ; display char here on LCD display
   A909 86 6E         [ 2] 4692         ldaa    #0x6E           ;'n'
   A90B C6 0D         [ 2] 4693         ldab    #0x0D
   A90D BD 8D C5      [ 6] 4694         jsr     L8DB5           ; display char here on LCD display
   A910 CC 20 0E      [ 3] 4695         ldd     #0x200E         ;' '
   A913 BD 8D C5      [ 6] 4696         jsr     L8DB5           ; display char here on LCD display
   A916 7A 00 4C      [ 6] 4697         dec     (0x004C)
   A919 32            [ 4] 4698         pula
   A91A 36            [ 3] 4699         psha
   A91B C6 64         [ 2] 4700         ldab    #0x64
   A91D 3D            [10] 4701         mul
   A91E DD 23         [ 4] 4702         std     CDTIMR5
   A920                    4703 LA8E3:
   A920 DC 23         [ 4] 4704         ldd     CDTIMR5
   A922 26 FC         [ 3] 4705         bne     LA8E3  
   A924 BD 8E A5      [ 6] 4706         jsr     L8E95
   A927 81 0D         [ 2] 4707         cmpa    #0x0D
   A929 26 05         [ 3] 4708         bne     LA8F3  
   A92B BD A9 B2      [ 6] 4709         jsr     LA975           ; Wait for SCD Keypress
   A92E 20 10         [ 3] 4710         bra     LA903  
   A930                    4711 LA8F3:
   A930 81 01         [ 2] 4712         cmpa    #0x01
   A932 26 04         [ 3] 4713         bne     LA8FB  
   A934 32            [ 4] 4714         pula
   A935 7E A8 D2      [ 3] 4715         jmp     LA895
   A938                    4716 LA8FB:
   A938 81 02         [ 2] 4717         cmpa    #0x02
   A93A 26 04         [ 3] 4718         bne     LA903  
   A93C 32            [ 4] 4719         pula
   A93D 7E A9 72      [ 3] 4720         jmp     LA935
   A940                    4721 LA903:
   A940 3C            [ 4] 4722         pshx
   A941 BD 88 F5      [ 6] 4723         jsr     L88E5
   A944 38            [ 5] 4724         pulx
   A945 86 66         [ 2] 4725         ldaa    #0x66           ;'f'
   A947 C6 0D         [ 2] 4726         ldab    #0x0D
   A949 BD 8D C5      [ 6] 4727         jsr     L8DB5           ; display char here on LCD display
   A94C 86 66         [ 2] 4728         ldaa    #0x66           ;'f'
   A94E C6 0E         [ 2] 4729         ldab    #0x0E
   A950 BD 8D C5      [ 6] 4730         jsr     L8DB5           ; display char here on LCD display
   A953 32            [ 4] 4731         pula
   A954 C6 64         [ 2] 4732         ldab    #0x64
   A956 3D            [10] 4733         mul
   A957 DD 23         [ 4] 4734         std     CDTIMR5
   A959                    4735 LA91C:
   A959 DC 23         [ 4] 4736         ldd     CDTIMR5
   A95B 26 FC         [ 3] 4737         bne     LA91C  
   A95D BD A8 92      [ 6] 4738         jsr     LA855
   A960 7C 00 4B      [ 6] 4739         inc     (0x004B)
   A963 96 4B         [ 3] 4740         ldaa    (0x004B)
   A965 81 48         [ 2] 4741         cmpa    #0x48
   A967 25 87         [ 3] 4742         bcs     LA8B3  
   A969 96 4C         [ 3] 4743         ldaa    (0x004C)
   A96B 81 34         [ 2] 4744         cmpa    #0x34
   A96D 27 03         [ 3] 4745         beq     LA935  
   A96F 7E A8 E1      [ 3] 4746         jmp     LA8A4
   A972                    4747 LA935:
   A972 C6 02         [ 2] 4748         ldab    #0x02
   A974 BD 8C 40      [ 6] 4749         jsr     DLYSECSBY2      ; delay 1 sec
   A977 BD 86 D4      [ 6] 4750         jsr     L86C4           ; Reset boards 1-10
   A97A BD A3 7E      [ 6] 4751         jsr     LA341
   A97D 39            [ 5] 4752         rts
                           4753 
   A97E                    4754 LA941:
   A97E A6 00         [ 4] 4755         ldaa    0,X     
   A980 08            [ 3] 4756         inx
   A981 08            [ 3] 4757         inx
   A982 97 4C         [ 3] 4758         staa    (0x004C)
   A984 86 40         [ 2] 4759         ldaa    #0x40
   A986 97 4B         [ 3] 4760         staa    (0x004B)
   A988 39            [ 5] 4761         rts
                           4762 
   A989                    4763 LA94C:
   A989 BD 8D 02      [ 6] 4764         jsr     L8CF2
   A98C                    4765 LA94F:
   A98C A6 00         [ 4] 4766         ldaa    0,X     
   A98E 08            [ 3] 4767         inx
   A98F 81 2C         [ 2] 4768         cmpa    #0x2C
   A991 27 07         [ 3] 4769         beq     LA95D  
   A993 36            [ 3] 4770         psha
   A994 BD 8E 80      [ 6] 4771         jsr     L8E70
   A997 32            [ 4] 4772         pula
   A998 20 F2         [ 3] 4773         bra     LA94F  
   A99A                    4774 LA95D:
   A99A 39            [ 5] 4775         rts
                           4776 
   A99B                    4777 LA95E:
   A99B BD 8D 13      [ 6] 4778         jsr     L8D03
   A99E 86 C0         [ 2] 4779         ldaa    #0xC0
   A9A0 BD 8E 5B      [ 6] 4780         jsr     L8E4B
   A9A3                    4781 LA966:
   A9A3 A6 00         [ 4] 4782         ldaa    0,X     
   A9A5 08            [ 3] 4783         inx
   A9A6 81 2C         [ 2] 4784         cmpa    #0x2C
   A9A8 27 07         [ 3] 4785         beq     LA974  
   A9AA 36            [ 3] 4786         psha
   A9AB BD 8E 80      [ 6] 4787         jsr     L8E70
   A9AE 32            [ 4] 4788         pula
   A9AF 20 F2         [ 3] 4789         bra     LA966  
   A9B1                    4790 LA974:
   A9B1 39            [ 5] 4791         rts
                           4792 
                           4793 ; Wait for SCD Keypress
   A9B2                    4794 LA975:
   A9B2 BD 8E A5      [ 6] 4795         jsr     L8E95
   A9B5 4D            [ 2] 4796         tsta
   A9B6 27 FA         [ 3] 4797         beq     LA975  
   A9B8 39            [ 5] 4798         rts
                           4799 
   A9B9                    4800 LA97C:
   A9B9 7F 00 60      [ 6] 4801         clr     (0x0060)
   A9BC FC 02 9C      [ 5] 4802         ldd     (0x029C)
   A9BF 1A 83 00 01   [ 5] 4803         cpd     #0x0001
   A9C3 27 0C         [ 3] 4804         beq     LA994  
   A9C5 1A 83 03 E8   [ 5] 4805         cpd     #0x03E8
   A9C9 2D 7D         [ 3] 4806         blt     LAA0B  
   A9CB 1A 83 04 4B   [ 5] 4807         cpd     #0x044B
   A9CF 22 77         [ 3] 4808         bhi     LAA0B  
   A9D1                    4809 LA994:
   A9D1 C6 40         [ 2] 4810         ldab    #0x40
   A9D3 D7 62         [ 3] 4811         stab    (0x0062)
   A9D5 BD FA F9      [ 6] 4812         jsr     BUTNLIT 
   A9D8 C6 64         [ 2] 4813         ldab    #0x64           ; delay 1 sec
   A9DA BD 8C 32      [ 6] 4814         jsr     DLYSECSBY100
   A9DD BD 86 D4      [ 6] 4815         jsr     L86C4           ; Reset boards 1-10
   A9E0 BD 8C F9      [ 6] 4816         jsr     L8CE9
                           4817 
   A9E3 BD 8D F4      [ 6] 4818         jsr     LCDMSG1 
   A9E6 20 20 20 20 20 53  4819         .ascis  '     STUDIO'
        54 55 44 49 CF
                           4820 
   A9F1 BD 8D ED      [ 6] 4821         jsr     LCDMSG2 
   A9F4 70 72 6F 67 72 61  4822         .ascis  'programming mode'
        6D 6D 69 6E 67 20
        6D 6F 64 E5
                           4823 
   AA04 BD A3 6B      [ 6] 4824         jsr     LA32E
   AA07 BD 99 AE      [ 6] 4825         jsr     L999E
   AA0A BD 99 C1      [ 6] 4826         jsr     L99B1
   AA0D CE 20 00      [ 3] 4827         ldx     #0x2000
   AA10                    4828 LA9D3:
   AA10 18 CE 00 C0   [ 4] 4829         ldy     #0x00C0
   AA14                    4830 LA9D7:
   AA14 18 09         [ 4] 4831         dey
   AA16 26 0A         [ 3] 4832         bne     LA9E5  
   AA18 BD AA 31      [ 6] 4833         jsr     LA9F4
   AA1B 96 60         [ 3] 4834         ldaa    (0x0060)
   AA1D 26 29         [ 3] 4835         bne     LAA0B  
   AA1F CE 20 00      [ 3] 4836         ldx     #0x2000
   AA22                    4837 LA9E5:
   AA22 B6 10 A8      [ 4] 4838         ldaa    (0x10A8)
   AA25 84 01         [ 2] 4839         anda    #0x01
   AA27 27 EB         [ 3] 4840         beq     LA9D7  
   AA29 B6 10 A9      [ 4] 4841         ldaa    (0x10A9)
   AA2C A7 00         [ 4] 4842         staa    0,X     
   AA2E 08            [ 3] 4843         inx
   AA2F 20 DF         [ 3] 4844         bra     LA9D3
                           4845 
   AA31                    4846 LA9F4:
   AA31 CE 20 00      [ 3] 4847         ldx     #0x2000
   AA34 18 CE 10 80   [ 4] 4848         ldy     #0x1080
   AA38                    4849 LA9FB:
   AA38 A6 00         [ 4] 4850         ldaa    0,X     
   AA3A 18 A7 00      [ 5] 4851         staa    0,Y     
   AA3D 08            [ 3] 4852         inx
   AA3E 18 08         [ 4] 4853         iny
   AA40 18 08         [ 4] 4854         iny
   AA42 8C 20 10      [ 4] 4855         cpx     #0x2010
   AA45 25 F1         [ 3] 4856         bcs     LA9FB  
   AA47 39            [ 5] 4857         rts
   AA48                    4858 LAA0B:
   AA48 39            [ 5] 4859         rts
                           4860 
   AA49                    4861 LAA0C:
   AA49 CC 48 37      [ 3] 4862         ldd     #0x4837         ;'H'
   AA4C                    4863 LAA0F:
   AA4C BD 8D C5      [ 6] 4864         jsr     L8DB5           ; display char here on LCD display
   AA4F 39            [ 5] 4865         rts
                           4866 
   AA50                    4867 LAA13:
   AA50 CC 20 37      [ 3] 4868         ldd     #0x2037         ;' '
   AA53 20 F7         [ 3] 4869         bra     LAA0F
                           4870 
   AA55                    4871 LAA18:
   AA55 CC 42 0F      [ 3] 4872         ldd     #0x420F         ;'B'
   AA58 20 F2         [ 3] 4873         bra     LAA0F
                           4874 
   AA5A                    4875 LAA1D:
   AA5A CC 20 0F      [ 3] 4876         ldd     #0x200F         ;' '
   AA5D 20 ED         [ 3] 4877         bra     LAA0F
                           4878 
   AA5F                    4879 LAA22: 
   AA5F 7F 00 4F      [ 6] 4880         clr     (0x004F)
   AA62 CC 00 01      [ 3] 4881         ldd     #0x0001
   AA65 DD 1B         [ 4] 4882         std     CDTIMR1
   AA67 CE 20 00      [ 3] 4883         ldx     #0x2000
   AA6A                    4884 LAA2D:
   AA6A B6 10 A8      [ 4] 4885         ldaa    (0x10A8)
   AA6D 84 01         [ 2] 4886         anda    #0x01
   AA6F 27 F9         [ 3] 4887         beq     LAA2D  
   AA71 DC 1B         [ 4] 4888         ldd     CDTIMR1
   AA73 0F            [ 2] 4889         sei
   AA74 26 03         [ 3] 4890         bne     LAA3C  
   AA76 CE 20 00      [ 3] 4891         ldx     #0x2000
   AA79                    4892 LAA3C:
   AA79 B6 10 A9      [ 4] 4893         ldaa    (0x10A9)
   AA7C A7 00         [ 4] 4894         staa    0,X     
   AA7E 0E            [ 2] 4895         cli
   AA7F BD FA A3      [ 6] 4896         jsr     SERIALW      
   AA82 08            [ 3] 4897         inx
   AA83 7F 00 4F      [ 6] 4898         clr     (0x004F)
   AA86 CC 00 01      [ 3] 4899         ldd     #0x0001
   AA89 DD 1B         [ 4] 4900         std     CDTIMR1
   AA8B 8C 20 23      [ 4] 4901         cpx     #0x2023
   AA8E 26 DA         [ 3] 4902         bne     LAA2D  
   AA90 CE 20 00      [ 3] 4903         ldx     #0x2000
   AA93 7F 00 B7      [ 6] 4904         clr     (0x00B7)
   AA96                    4905 LAA59:
   AA96 A6 00         [ 4] 4906         ldaa    0,X     
   AA98 9B B7         [ 3] 4907         adda    (0x00B7)
   AA9A 97 B7         [ 3] 4908         staa    (0x00B7)
   AA9C 08            [ 3] 4909         inx
   AA9D 8C 20 22      [ 4] 4910         cpx     #0x2022
   AAA0 25 F4         [ 3] 4911         bcs     LAA59  
   AAA2 96 B7         [ 3] 4912         ldaa    (0x00B7)
   AAA4 88 FF         [ 2] 4913         eora    #0xFF
   AAA6 A1 00         [ 4] 4914         cmpa    0,X     
   AAA8 CE 20 00      [ 3] 4915         ldx     #0x2000
   AAAB A6 20         [ 4] 4916         ldaa    0x20,X
   AAAD 2B 03         [ 3] 4917         bmi     LAA75  
   AAAF 7E AA 5F      [ 3] 4918         jmp     LAA22
   AAB2                    4919 LAA75:
   AAB2 A6 00         [ 4] 4920         ldaa    0,X     
   AAB4 B7 10 80      [ 4] 4921         staa    (0x1080)
   AAB7 08            [ 3] 4922         inx
   AAB8 A6 00         [ 4] 4923         ldaa    0,X     
   AABA B7 10 82      [ 4] 4924         staa    (0x1082)
   AABD 08            [ 3] 4925         inx
   AABE A6 00         [ 4] 4926         ldaa    0,X     
   AAC0 B7 10 84      [ 4] 4927         staa    (0x1084)
   AAC3 08            [ 3] 4928         inx
   AAC4 A6 00         [ 4] 4929         ldaa    0,X     
   AAC6 B7 10 86      [ 4] 4930         staa    (0x1086)
   AAC9 08            [ 3] 4931         inx
   AACA A6 00         [ 4] 4932         ldaa    0,X     
   AACC B7 10 88      [ 4] 4933         staa    (0x1088)
   AACF 08            [ 3] 4934         inx
   AAD0 A6 00         [ 4] 4935         ldaa    0,X     
   AAD2 B7 10 8A      [ 4] 4936         staa    (0x108A)
   AAD5 08            [ 3] 4937         inx
   AAD6 A6 00         [ 4] 4938         ldaa    0,X     
   AAD8 B7 10 8C      [ 4] 4939         staa    (0x108C)
   AADB 08            [ 3] 4940         inx
   AADC A6 00         [ 4] 4941         ldaa    0,X     
   AADE B7 10 8E      [ 4] 4942         staa    (0x108E)
   AAE1 08            [ 3] 4943         inx
   AAE2 A6 00         [ 4] 4944         ldaa    0,X     
   AAE4 B7 10 90      [ 4] 4945         staa    (0x1090)
   AAE7 08            [ 3] 4946         inx
   AAE8 A6 00         [ 4] 4947         ldaa    0,X     
   AAEA B7 10 92      [ 4] 4948         staa    (0x1092)
   AAED 08            [ 3] 4949         inx
   AAEE A6 00         [ 4] 4950         ldaa    0,X     
   AAF0 8A 80         [ 2] 4951         oraa    #0x80
   AAF2 B7 10 94      [ 4] 4952         staa    (0x1094)
   AAF5 08            [ 3] 4953         inx
   AAF6 A6 00         [ 4] 4954         ldaa    0,X     
   AAF8 8A 01         [ 2] 4955         oraa    #0x01
   AAFA B7 10 96      [ 4] 4956         staa    (0x1096)
   AAFD 08            [ 3] 4957         inx
   AAFE A6 00         [ 4] 4958         ldaa    0,X     
   AB00 B7 10 98      [ 4] 4959         staa    (0x1098)
   AB03 08            [ 3] 4960         inx
   AB04 A6 00         [ 4] 4961         ldaa    0,X     
   AB06 B7 10 9A      [ 4] 4962         staa    (0x109A)
   AB09 08            [ 3] 4963         inx
   AB0A A6 00         [ 4] 4964         ldaa    0,X     
   AB0C B7 10 9C      [ 4] 4965         staa    (0x109C)
   AB0F 08            [ 3] 4966         inx
   AB10 A6 00         [ 4] 4967         ldaa    0,X     
   AB12 B7 10 9E      [ 4] 4968         staa    (0x109E)
   AB15 7E AA 5F      [ 3] 4969         jmp     LAA22
                           4970 
   AB18                    4971 LAADB:
   AB18 7F 10 98      [ 6] 4972         clr     (0x1098)
   AB1B 7F 10 9A      [ 6] 4973         clr     (0x109A)
   AB1E 7F 10 9C      [ 6] 4974         clr     (0x109C)
   AB21 7F 10 9E      [ 6] 4975         clr     (0x109E)
   AB24 39            [ 5] 4976         rts
   AB25                    4977 LAAE8:
   AB25 CE 04 2C      [ 3] 4978         ldx     #0x042C
   AB28 C6 10         [ 2] 4979         ldab    #0x10
   AB2A                    4980 LAAED:
   AB2A 5D            [ 2] 4981         tstb
   AB2B 27 12         [ 3] 4982         beq     LAB02  
   AB2D A6 00         [ 4] 4983         ldaa    0,X     
   AB2F 81 30         [ 2] 4984         cmpa    #0x30
   AB31 25 0D         [ 3] 4985         bcs     LAB03  
   AB33 81 39         [ 2] 4986         cmpa    #0x39
   AB35 22 09         [ 3] 4987         bhi     LAB03  
   AB37 08            [ 3] 4988         inx
   AB38 08            [ 3] 4989         inx
   AB39 08            [ 3] 4990         inx
   AB3A 8C 04 59      [ 4] 4991         cpx     #0x0459
   AB3D 23 EB         [ 3] 4992         bls     LAAED  
   AB3F                    4993 LAB02:
   AB3F 39            [ 5] 4994         rts
                           4995 
   AB40                    4996 LAB03:
   AB40 5A            [ 2] 4997         decb
   AB41 3C            [ 4] 4998         pshx
   AB42                    4999 LAB05:
   AB42 A6 03         [ 4] 5000         ldaa    3,X     
   AB44 A7 00         [ 4] 5001         staa    0,X     
   AB46 08            [ 3] 5002         inx
   AB47 8C 04 5C      [ 4] 5003         cpx     #0x045C
   AB4A 25 F6         [ 3] 5004         bcs     LAB05  
   AB4C 86 FF         [ 2] 5005         ldaa    #0xFF
   AB4E B7 04 59      [ 4] 5006         staa    (0x0459)
   AB51 38            [ 5] 5007         pulx
   AB52 20 D6         [ 3] 5008         bra     LAAED
                           5009 
                           5010 ; erase revalid tape section in EEPROM
   AB54                    5011 LAB17:
   AB54 CE 04 2C      [ 3] 5012         ldx     #0x042C
   AB57 86 FF         [ 2] 5013         ldaa    #0xFF
   AB59                    5014 LAB1C:
   AB59 A7 00         [ 4] 5015         staa    0,X     
   AB5B 08            [ 3] 5016         inx
   AB5C 8C 04 5C      [ 4] 5017         cpx     #0x045C
   AB5F 25 F8         [ 3] 5018         bcs     LAB1C
   AB61 39            [ 5] 5019         rts
                           5020 
   AB62                    5021 LAB25:
   AB62 CE 04 2C      [ 3] 5022         ldx     #0x042C
   AB65                    5023 LAB28:
   AB65 A6 00         [ 4] 5024         ldaa    0,X     
   AB67 81 30         [ 2] 5025         cmpa    #0x30
   AB69 25 17         [ 3] 5026         bcs     LAB45  
   AB6B 81 39         [ 2] 5027         cmpa    #0x39
   AB6D 22 13         [ 3] 5028         bhi     LAB45  
   AB6F 08            [ 3] 5029         inx
   AB70 08            [ 3] 5030         inx
   AB71 08            [ 3] 5031         inx
   AB72 8C 04 5C      [ 4] 5032         cpx     #0x045C
   AB75 25 EE         [ 3] 5033         bcs     LAB28  
   AB77 86 FF         [ 2] 5034         ldaa    #0xFF
   AB79 B7 04 2C      [ 4] 5035         staa    (0x042C)
   AB7C BD AB 25      [ 6] 5036         jsr     LAAE8
   AB7F CE 04 59      [ 3] 5037         ldx     #0x0459
   AB82                    5038 LAB45:
   AB82 39            [ 5] 5039         rts
                           5040 
   AB83                    5041 LAB46:
   AB83 B6 02 99      [ 4] 5042         ldaa    (0x0299)
   AB86 A7 00         [ 4] 5043         staa    0,X     
   AB88 B6 02 9A      [ 4] 5044         ldaa    (0x029A)
   AB8B A7 01         [ 4] 5045         staa    1,X     
   AB8D B6 02 9B      [ 4] 5046         ldaa    (0x029B)
   AB90 A7 02         [ 4] 5047         staa    2,X     
   AB92 39            [ 5] 5048         rts
                           5049 
   AB93                    5050 LAB56:
   AB93 CE 04 2C      [ 3] 5051         ldx     #0x042C
   AB96                    5052 LAB59:
   AB96 B6 02 99      [ 4] 5053         ldaa    (0x0299)
   AB99 A1 00         [ 4] 5054         cmpa    0,X     
   AB9B 26 10         [ 3] 5055         bne     LAB70  
   AB9D B6 02 9A      [ 4] 5056         ldaa    (0x029A)
   ABA0 A1 01         [ 4] 5057         cmpa    1,X     
   ABA2 26 09         [ 3] 5058         bne     LAB70  
   ABA4 B6 02 9B      [ 4] 5059         ldaa    (0x029B)
   ABA7 A1 02         [ 4] 5060         cmpa    2,X     
   ABA9 26 02         [ 3] 5061         bne     LAB70  
   ABAB 20 0A         [ 3] 5062         bra     LAB7A  
   ABAD                    5063 LAB70:
   ABAD 08            [ 3] 5064         inx
   ABAE 08            [ 3] 5065         inx
   ABAF 08            [ 3] 5066         inx
   ABB0 8C 04 5C      [ 4] 5067         cpx     #0x045C
   ABB3 25 E1         [ 3] 5068         bcs     LAB59  
   ABB5 0D            [ 2] 5069         sec
   ABB6 39            [ 5] 5070         rts
                           5071 
   ABB7                    5072 LAB7A:
   ABB7 0C            [ 2] 5073         clc
   ABB8 39            [ 5] 5074         rts
                           5075 
                           5076 ;show re-valid tapes
   ABB9                    5077 LAB7C:
   ABB9 CE 04 2C      [ 3] 5078         ldx     #0x042C
   ABBC                    5079 LAB7F:
   ABBC A6 00         [ 4] 5080         ldaa    0,X     
   ABBE 81 30         [ 2] 5081         cmpa    #0x30
   ABC0 25 1E         [ 3] 5082         bcs     LABA3  
   ABC2 81 39         [ 2] 5083         cmpa    #0x39
   ABC4 22 1A         [ 3] 5084         bhi     LABA3  
   ABC6 BD FA A3      [ 6] 5085         jsr     SERIALW      
   ABC9 08            [ 3] 5086         inx
   ABCA A6 00         [ 4] 5087         ldaa    0,X     
   ABCC BD FA A3      [ 6] 5088         jsr     SERIALW      
   ABCF 08            [ 3] 5089         inx
   ABD0 A6 00         [ 4] 5090         ldaa    0,X     
   ABD2 BD FA A3      [ 6] 5091         jsr     SERIALW      
   ABD5 08            [ 3] 5092         inx
   ABD6 86 20         [ 2] 5093         ldaa    #0x20
   ABD8 BD FA A3      [ 6] 5094         jsr     SERIALW      
   ABDB 8C 04 5C      [ 4] 5095         cpx     #0x045C
   ABDE 25 DC         [ 3] 5096         bcs     LAB7F  
   ABE0                    5097 LABA3:
   ABE0 86 0D         [ 2] 5098         ldaa    #0x0D
   ABE2 BD FA A3      [ 6] 5099         jsr     SERIALW      
   ABE5 86 0A         [ 2] 5100         ldaa    #0x0A
   ABE7 BD FA A3      [ 6] 5101         jsr     SERIALW      
   ABEA 39            [ 5] 5102         rts
                           5103 
   ABEB                    5104 LABAE:
   ABEB 7F 00 4A      [ 6] 5105         clr     (0x004A)
   ABEE CC 00 64      [ 3] 5106         ldd     #0x0064
   ABF1 DD 23         [ 4] 5107         std     CDTIMR5
   ABF3                    5108 LABB6:
   ABF3 96 4A         [ 3] 5109         ldaa    (0x004A)
   ABF5 26 08         [ 3] 5110         bne     LABC2  
   ABF7 BD 9B 29      [ 6] 5111         jsr     L9B19           ; do the random motions if enabled
   ABFA DC 23         [ 4] 5112         ldd     CDTIMR5
   ABFC 26 F5         [ 3] 5113         bne     LABB6  
   ABFE                    5114 LABC1:
   ABFE 39            [ 5] 5115         rts
                           5116 
   ABFF                    5117 LABC2:
   ABFF 81 31         [ 2] 5118         cmpa    #0x31
   AC01 26 04         [ 3] 5119         bne     LABCA  
   AC03 BD AB 54      [ 6] 5120         jsr     LAB17
   AC06 39            [ 5] 5121         rts
                           5122 
   AC07                    5123 LABCA:
   AC07 20 F5         [ 3] 5124         bra     LABC1  
                           5125 
                           5126 ; TOC1 timer handler
                           5127 ;
                           5128 ; Timer is running at:
                           5129 ; EXTAL = 16Mhz
                           5130 ; E Clk = 4Mhz
                           5131 ; Timer Prescaler = /16 = 250Khz
                           5132 ; Timer Period = 4us
                           5133 ; T1OC is set to previous value +625
                           5134 ; So, this routine is called every 2.5ms
                           5135 ;
   AC09                    5136 LABCC:
   AC09 DC 10         [ 4] 5137         ldd     T1NXT           ; get ready for next time
   AC0B C3 02 71      [ 4] 5138         addd    #0x0271         ; add 625
   AC0E FD 10 16      [ 5] 5139         std     TOC1  
   AC11 DD 10         [ 4] 5140         std     T1NXT
                           5141 
   AC13 86 80         [ 2] 5142         ldaa    #0x80
   AC15 B7 10 23      [ 4] 5143         staa    TFLG1           ; clear timer1 flag
                           5144 
                           5145 ; Some blinking SPECIAL button every half second,
                           5146 ; if 0x0078 is non zero
                           5147 
   AC18 7D 00 78      [ 6] 5148         tst     (0x0078)        ; if 78 is zero, skip ahead
   AC1B 27 1C         [ 3] 5149         beq     LABFC           ; else do some blinking button lights
   AC1D DC 25         [ 4] 5150         ldd     (0x0025)        ; else inc 25/26
   AC1F C3 00 01      [ 4] 5151         addd    #0x0001
   AC22 DD 25         [ 4] 5152         std     (0x0025)
   AC24 1A 83 00 C8   [ 5] 5153         cpd     #0x00C8         ; is it 200?
   AC28 26 0F         [ 3] 5154         bne     LABFC           ; no, keep going
   AC2A 7F 00 25      [ 6] 5155         clr     (0x0025)        ; reset 25/26
   AC2D 7F 00 26      [ 6] 5156         clr     (0x0026)
   AC30 D6 62         [ 3] 5157         ldab    (0x0062)        ; and toggle bit 3 of 62
   AC32 C8 08         [ 2] 5158         eorb    #0x08
   AC34 D7 62         [ 3] 5159         stab    (0x0062)
   AC36 BD FA F9      [ 6] 5160         jsr     BUTNLIT         ; and toggle the "special" button light
                           5161 
                           5162 ; 
   AC39                    5163 LABFC:
   AC39 7C 00 6F      [ 6] 5164         inc     (0x006F)        ; count every 2.5ms
   AC3C 96 6F         [ 3] 5165         ldaa    (0x006F)
   AC3E 81 28         [ 2] 5166         cmpa    #0x28           ; is it 40 intervals? (0.1 sec?)
   AC40 25 42         [ 3] 5167         bcs     LAC47           ; if not yet, jump ahead
   AC42 7F 00 6F      [ 6] 5168         clr     (0x006F)        ; clear it 2.5ms counter
   AC45 7D 00 63      [ 6] 5169         tst     (0x0063)        ; decrement 0.1s counter here
   AC48 27 03         [ 3] 5170         beq     LAC10           ; if it's not already zero
   AC4A 7A 00 63      [ 6] 5171         dec     (0x0063)
                           5172 
                           5173 ; staggered counters - here every 100ms
                           5174 
                           5175 ; 0x0070 counts from 250 to 1, period is 25 secs
   AC4D                    5176 LAC10:
   AC4D 96 70         [ 3] 5177         ldaa    OFFCNT1         ; decrement 0.1s counter here
   AC4F 4A            [ 2] 5178         deca
   AC50 97 70         [ 3] 5179         staa    OFFCNT1
   AC52 26 04         [ 3] 5180         bne     LAC1B       
   AC54 86 FA         [ 2] 5181         ldaa    #0xFA           ; 250
   AC56 97 70         [ 3] 5182         staa    OFFCNT1
                           5183 
                           5184 ; 0x0071 counts from 230 to 1, period is 23 secs
   AC58                    5185 LAC1B:
   AC58 96 71         [ 3] 5186         ldaa    OFFCNT2
   AC5A 4A            [ 2] 5187         deca
   AC5B 97 71         [ 3] 5188         staa    OFFCNT2
   AC5D 26 04         [ 3] 5189         bne     LAC26  
   AC5F 86 E6         [ 2] 5190         ldaa    #0xE6           ; 230
   AC61 97 71         [ 3] 5191         staa    OFFCNT2
                           5192 
                           5193 ; 0x0072 counts from 210 to 1, period is 21 secs
   AC63                    5194 LAC26:
   AC63 96 72         [ 3] 5195         ldaa    OFFCNT3
   AC65 4A            [ 2] 5196         deca
   AC66 97 72         [ 3] 5197         staa    OFFCNT3
   AC68 26 04         [ 3] 5198         bne     LAC31  
   AC6A 86 D2         [ 2] 5199         ldaa    #0xD2           ; 210
   AC6C 97 72         [ 3] 5200         staa    OFFCNT3
                           5201 
                           5202 ; 0x0073 counts from 190 to 1, period is 19 secs
   AC6E                    5203 LAC31:
   AC6E 96 73         [ 3] 5204         ldaa    OFFCNT4
   AC70 4A            [ 2] 5205         deca
   AC71 97 73         [ 3] 5206         staa    OFFCNT4
   AC73 26 04         [ 3] 5207         bne     LAC3C  
   AC75 86 BE         [ 2] 5208         ldaa    #0xBE           ; 190
   AC77 97 73         [ 3] 5209         staa    OFFCNT4
                           5210 
                           5211 ; 0x0074 counts from 170 to 1, period is 17 secs
   AC79                    5212 LAC3C:
   AC79 96 74         [ 3] 5213         ldaa    OFFCNT5
   AC7B 4A            [ 2] 5214         deca
   AC7C 97 74         [ 3] 5215         staa    OFFCNT5
   AC7E 26 04         [ 3] 5216         bne     LAC47  
   AC80 86 AA         [ 2] 5217         ldaa    #0xAA           ; 170
   AC82 97 74         [ 3] 5218         staa    OFFCNT5
                           5219 
                           5220 ; back to 2.5ms period here
                           5221 
   AC84                    5222 LAC47:
   AC84 96 27         [ 3] 5223         ldaa    T30MS
   AC86 4C            [ 2] 5224         inca
   AC87 97 27         [ 3] 5225         staa    T30MS
   AC89 81 0C         [ 2] 5226         cmpa    #0x0C           ; 12 = 30ms?
   AC8B 23 09         [ 3] 5227         bls     LAC59  
   AC8D 7F 00 27      [ 6] 5228         clr     T30MS
                           5229 
                           5230 ; do these two tasks every 30ms
   AC90 BD 8E D6      [ 6] 5231         jsr     L8EC6           ; Scan SCD keys
   AC93 BD 8F 22      [ 6] 5232         jsr     L8F12           ; Scan Front Panel Switches
                           5233 
                           5234 ; back to every 2.5ms here
                           5235 ; LCD update???
                           5236 
   AC96                    5237 LAC59:
   AC96 96 43         [ 3] 5238         ldaa    (0x0043)
   AC98 27 55         [ 3] 5239         beq     LACB2  
   AC9A DE 44         [ 4] 5240         ldx     (0x0044)
   AC9C A6 00         [ 4] 5241         ldaa    0,X     
   AC9E 27 23         [ 3] 5242         beq     LAC86  
   ACA0 B7 10 00      [ 4] 5243         staa    PORTA  
   ACA3 B6 10 02      [ 4] 5244         ldaa    PORTG  
   ACA6 84 F3         [ 2] 5245         anda    #0xF3
   ACA8 B7 10 02      [ 4] 5246         staa    PORTG  
   ACAB 84 FD         [ 2] 5247         anda    #0xFD
   ACAD B7 10 02      [ 4] 5248         staa    PORTG  
   ACB0 8A 02         [ 2] 5249         oraa    #0x02
   ACB2 B7 10 02      [ 4] 5250         staa    PORTG  
   ACB5 08            [ 3] 5251         inx
   ACB6 08            [ 3] 5252         inx
   ACB7 8C 05 80      [ 4] 5253         cpx     #0x0580
   ACBA 25 03         [ 3] 5254         bcs     LAC82  
   ACBC CE 05 00      [ 3] 5255         ldx     #0x0500
   ACBF                    5256 LAC82:
   ACBF DF 44         [ 4] 5257         stx     (0x0044)
   ACC1 20 2C         [ 3] 5258         bra     LACB2  
   ACC3                    5259 LAC86:
   ACC3 A6 01         [ 4] 5260         ldaa    1,X     
   ACC5 27 25         [ 3] 5261         beq     LACAF  
   ACC7 B7 10 00      [ 4] 5262         staa    PORTA  
   ACCA B6 10 02      [ 4] 5263         ldaa    PORTG  
   ACCD 84 FB         [ 2] 5264         anda    #0xFB
   ACCF 8A 08         [ 2] 5265         oraa    #0x08
   ACD1 B7 10 02      [ 4] 5266         staa    PORTG  
   ACD4 84 FD         [ 2] 5267         anda    #0xFD
   ACD6 B7 10 02      [ 4] 5268         staa    PORTG  
   ACD9 8A 02         [ 2] 5269         oraa    #0x02
   ACDB B7 10 02      [ 4] 5270         staa    PORTG  
   ACDE 08            [ 3] 5271         inx
   ACDF 08            [ 3] 5272         inx
   ACE0 8C 05 80      [ 4] 5273         cpx     #0x0580
   ACE3 25 03         [ 3] 5274         bcs     LACAB  
   ACE5 CE 05 00      [ 3] 5275         ldx     #0x0500
   ACE8                    5276 LACAB:
   ACE8 DF 44         [ 4] 5277         stx     (0x0044)
   ACEA 20 03         [ 3] 5278         bra     LACB2  
   ACEC                    5279 LACAF:
   ACEC 7F 00 43      [ 6] 5280         clr     (0x0043)
                           5281 
                           5282 ; divide by 4
   ACEF                    5283 LACB2:
   ACEF 96 4F         [ 3] 5284         ldaa    (0x004F)
   ACF1 4C            [ 2] 5285         inca
   ACF2 97 4F         [ 3] 5286         staa    (0x004F)
   ACF4 81 04         [ 2] 5287         cmpa    #0x04
   ACF6 26 30         [ 3] 5288         bne     LACEB  
   ACF8 7F 00 4F      [ 6] 5289         clr     (0x004F)
                           5290 
                           5291 ; here every 10ms
                           5292 ; Five big countdown timers available here
                           5293 ; up to 655.35 seconds each
                           5294 
   ACFB DC 1B         [ 4] 5295         ldd     CDTIMR1         ; countdown 0x001B/1C every 10ms
   ACFD 27 05         [ 3] 5296         beq     LACC7           ; if not already 0
   ACFF 83 00 01      [ 4] 5297         subd    #0x0001
   AD02 DD 1B         [ 4] 5298         std     CDTIMR1
                           5299 
   AD04                    5300 LACC7:
   AD04 DC 1D         [ 4] 5301         ldd     CDTIMR2         ; same with 0x001D/1E
   AD06 27 05         [ 3] 5302         beq     LACD0  
   AD08 83 00 01      [ 4] 5303         subd    #0x0001
   AD0B DD 1D         [ 4] 5304         std     CDTIMR2
                           5305 
   AD0D                    5306 LACD0:
   AD0D DC 1F         [ 4] 5307         ldd     CDTIMR3         ; same with 0x001F/20
   AD0F 27 05         [ 3] 5308         beq     LACD9  
   AD11 83 00 01      [ 4] 5309         subd    #0x0001
   AD14 DD 1F         [ 4] 5310         std     CDTIMR3
                           5311 
   AD16                    5312 LACD9:
   AD16 DC 21         [ 4] 5313         ldd     CDTIMR4         ; same with 0x0021/22
   AD18 27 05         [ 3] 5314         beq     LACE2  
   AD1A 83 00 01      [ 4] 5315         subd    #0x0001
   AD1D DD 21         [ 4] 5316         std     CDTIMR4
                           5317 
   AD1F                    5318 LACE2:
   AD1F DC 23         [ 4] 5319         ldd     CDTIMR5         ; same with 0x0023/24
   AD21 27 05         [ 3] 5320         beq     LACEB  
   AD23 83 00 01      [ 4] 5321         subd    #0x0001
   AD26 DD 23         [ 4] 5322         std     CDTIMR5
                           5323 
                           5324 ; every other time through this, setup a task switch?
   AD28                    5325 LACEB:
   AD28 96 B0         [ 3] 5326         ldaa    (TSCNT)
   AD2A 88 01         [ 2] 5327         eora    #0x01
   AD2C 97 B0         [ 3] 5328         staa    (TSCNT)
   AD2E 27 18         [ 3] 5329         beq     LAD0B  
                           5330 
   AD30 BF 01 3C      [ 5] 5331         sts     (0x013C)        ; switch stacks???
   AD33 BE 01 3E      [ 5] 5332         lds     (0x013E)
   AD36 DC 10         [ 4] 5333         ldd     T1NXT
   AD38 83 01 F4      [ 4] 5334         subd    #0x01F4         ; 625-500 = 125?
   AD3B FD 10 18      [ 5] 5335         std     TOC2            ; set this TOC2 to happen 0.5ms
   AD3E 86 40         [ 2] 5336         ldaa    #0x40           ; after the current TOC1 but before the next TOC1
   AD40 B7 10 23      [ 4] 5337         staa    TFLG1           ; clear timer2 irq flag, just in case?
   AD43 86 C0         [ 2] 5338         ldaa    #0xC0           ;
   AD45 B7 10 22      [ 4] 5339         staa    TMSK1           ; enable TOC1 and TOC2
   AD48                    5340 LAD0B:
   AD48 3B            [12] 5341         rti
                           5342 
                           5343 ; TOC2 Timer handler and SWI handler
   AD49                    5344 LAD0C:
   AD49 86 40         [ 2] 5345         ldaa    #0x40
   AD4B B7 10 23      [ 4] 5346         staa    TFLG1           ; clear timer2 flag
   AD4E BF 01 3E      [ 5] 5347         sts     (0x013E)        ; switch stacks back???
   AD51 BE 01 3C      [ 5] 5348         lds     (0x013C)
   AD54 86 80         [ 2] 5349         ldaa    #0x80
   AD56 B7 10 22      [ 4] 5350         staa    TMSK1           ; enable TOC1 only
   AD59 3B            [12] 5351         rti
                           5352 
                           5353 ; Secondary task??
                           5354 
   AD5A                    5355 TASK2:
   AD5A 7D 04 2A      [ 6] 5356         tst     (0x042A)
   AD5D 27 35         [ 3] 5357         beq     LAD57
   AD5F 96 B6         [ 3] 5358         ldaa    (0x00B6)
   AD61 26 03         [ 3] 5359         bne     LAD29
   AD63 3F            [14] 5360         swi
   AD64 20 F4         [ 3] 5361         bra     TASK2
   AD66                    5362 LAD29:
   AD66 7F 00 B6      [ 6] 5363         clr     (0x00B6)
   AD69 C6 04         [ 2] 5364         ldab    #0x04
   AD6B                    5365 LAD2E:
   AD6B 37            [ 3] 5366         pshb
   AD6C CE AD 79      [ 3] 5367         ldx     #LAD3C
   AD6F BD 8A 2A      [ 6] 5368         jsr     L8A1A  
   AD72 3F            [14] 5369         swi
   AD73 33            [ 4] 5370         pulb
   AD74 5A            [ 2] 5371         decb
   AD75 26 F4         [ 3] 5372         bne     LAD2E  
   AD77 20 E1         [ 3] 5373         bra     TASK2
                           5374 
   AD79                    5375 LAD3C:
   AD79 53 31 00           5376         .asciz     'S1'
                           5377 
   AD7C FC 02 9C      [ 5] 5378         ldd     (0x029C)
   AD7F 1A 83 00 01   [ 5] 5379         cpd     #0x0001         ; 1
   AD83 27 0C         [ 3] 5380         beq     LAD54  
   AD85 1A 83 03 E8   [ 5] 5381         cpd     #0x03E8         ; 1000
   AD89 2D 09         [ 3] 5382         blt     LAD57  
   AD8B 1A 83 04 4B   [ 5] 5383         cpd     #0x044B         ; 1099
   AD8F 22 03         [ 3] 5384         bhi     LAD57  
   AD91                    5385 LAD54:
   AD91 3F            [14] 5386         swi
   AD92 20 C6         [ 3] 5387         bra     TASK2
   AD94                    5388 LAD57:
   AD94 7F 00 B3      [ 6] 5389         clr     (0x00B3)
   AD97 BD AD BB      [ 6] 5390         jsr     LAD7E
   AD9A BD AD DD      [ 6] 5391         jsr     LADA0
   AD9D 25 BB         [ 3] 5392         bcs     TASK2
   AD9F C6 0A         [ 2] 5393         ldab    #0x0A
   ADA1 BD AE 50      [ 6] 5394         jsr     LAE13
   ADA4 BD AD EB      [ 6] 5395         jsr     LADAE
   ADA7 25 B1         [ 3] 5396         bcs     TASK2
   ADA9 C6 14         [ 2] 5397         ldab    #0x14
   ADAB BD AE 50      [ 6] 5398         jsr     LAE13
   ADAE BD AD F3      [ 6] 5399         jsr     LADB6
   ADB1 25 A7         [ 3] 5400         bcs     TASK2
   ADB3                    5401 LAD76:
   ADB3 BD AD F5      [ 6] 5402         jsr     LADB8
   ADB6 0D            [ 2] 5403         sec
   ADB7 25 A1         [ 3] 5404         bcs     TASK2
   ADB9 20 F8         [ 3] 5405         bra     LAD76
   ADBB                    5406 LAD7E:
   ADBB CE AE 5B      [ 3] 5407         ldx     #LAE1E          ;+++
   ADBE BD 8A 2A      [ 6] 5408         jsr     L8A1A  
   ADC1 C6 1E         [ 2] 5409         ldab    #0x1E
   ADC3 BD AE 50      [ 6] 5410         jsr     LAE13
   ADC6 CE AE 5F      [ 3] 5411         ldx     #LAE22          ;ATH
   ADC9 BD 8A 2A      [ 6] 5412         jsr     L8A1A  
   ADCC C6 1E         [ 2] 5413         ldab    #0x1E
   ADCE BD AE 50      [ 6] 5414         jsr     LAE13
   ADD1 CE AE 64      [ 3] 5415         ldx     #LAE27          ;ATZ
   ADD4 BD 8A 2A      [ 6] 5416         jsr     L8A1A  
   ADD7 C6 1E         [ 2] 5417         ldab    #0x1E
   ADD9 BD AE 50      [ 6] 5418         jsr     LAE13
   ADDC 39            [ 5] 5419         rts
   ADDD                    5420 LADA0:
   ADDD BD B2 1A      [ 6] 5421         jsr     LB1DD
   ADE0 25 FB         [ 3] 5422         bcs     LADA0  
   ADE2 BD B2 8C      [ 6] 5423         jsr     LB24F
                           5424 
   ADE5 52 49 4E 47 00     5425         .asciz  'RING'
                           5426 
   ADEA 39            [ 5] 5427         rts
                           5428 
   ADEB                    5429 LADAE:
   ADEB CE AE 69      [ 3] 5430         ldx     #LAE2C
   ADEE BD 8A 2A      [ 6] 5431         jsr     L8A1A           ;ATA
   ADF1 0C            [ 2] 5432         clc
   ADF2 39            [ 5] 5433         rts
   ADF3                    5434 LADB6:
   ADF3 0C            [ 2] 5435         clc
   ADF4 39            [ 5] 5436         rts
                           5437 
   ADF5                    5438 LADB8:
   ADF5 BD B2 0F      [ 6] 5439         jsr     LB1D2
   ADF8 BD AE 6E      [ 6] 5440         jsr     LAE31
   ADFB 86 01         [ 2] 5441         ldaa    #0x01
   ADFD 97 B3         [ 3] 5442         staa    (0x00B3)
   ADFF BD B2 1A      [ 6] 5443         jsr     LB1DD
   AE02 BD B2 AE      [ 6] 5444         jsr     LB271
   AE05 36            [ 3] 5445         psha
   AE06 BD B2 FD      [ 6] 5446         jsr     LB2C0
   AE09 32            [ 4] 5447         pula
   AE0A 81 01         [ 2] 5448         cmpa    #0x01
   AE0C 26 08         [ 3] 5449         bne     LADD9  
   AE0E CE B2 D2      [ 3] 5450         ldx     #LB295
   AE11 BD 8A 2A      [ 6] 5451         jsr     L8A1A           ;'You have selected #1'
   AE14 20 31         [ 3] 5452         bra     LAE0A  
   AE16                    5453 LADD9:
   AE16 81 02         [ 2] 5454         cmpa    #0x02
   AE18 26 00         [ 3] 5455         bne     LADDD  
   AE1A                    5456 LADDD:
   AE1A 81 03         [ 2] 5457         cmpa    #0x03
   AE1C 26 00         [ 3] 5458         bne     LADE1  
   AE1E                    5459 LADE1:
   AE1E 81 04         [ 2] 5460         cmpa    #0x04
   AE20 26 00         [ 3] 5461         bne     LADE5  
   AE22                    5462 LADE5:
   AE22 81 05         [ 2] 5463         cmpa    #0x05
   AE24 26 00         [ 3] 5464         bne     LADE9  
   AE26                    5465 LADE9:
   AE26 81 06         [ 2] 5466         cmpa    #0x06
   AE28 26 00         [ 3] 5467         bne     LADED  
   AE2A                    5468 LADED:
   AE2A 81 07         [ 2] 5469         cmpa    #0x07
   AE2C 26 00         [ 3] 5470         bne     LADF1  
   AE2E                    5471 LADF1:
   AE2E 81 08         [ 2] 5472         cmpa    #0x08
   AE30 26 00         [ 3] 5473         bne     LADF5  
   AE32                    5474 LADF5:
   AE32 81 09         [ 2] 5475         cmpa    #0x09
   AE34 26 00         [ 3] 5476         bne     LADF9  
   AE36                    5477 LADF9:
   AE36 81 0A         [ 2] 5478         cmpa    #0x0A
   AE38 26 00         [ 3] 5479         bne     LADFD  
   AE3A                    5480 LADFD:
   AE3A 81 0B         [ 2] 5481         cmpa    #0x0B
   AE3C 26 09         [ 3] 5482         bne     LAE0A  
   AE3E CE B2 E7      [ 3] 5483         ldx     #LB2AA          ;'You have selected #11'
   AE41 BD 8A 2A      [ 6] 5484         jsr     L8A1A  
   AE44 7E AE 47      [ 3] 5485         jmp     LAE0A
   AE47                    5486 LAE0A:
   AE47 C6 14         [ 2] 5487         ldab    #0x14
   AE49 BD AE 50      [ 6] 5488         jsr     LAE13
   AE4C 7F 00 B3      [ 6] 5489         clr     (0x00B3)
   AE4F 39            [ 5] 5490         rts
                           5491 
   AE50                    5492 LAE13:
   AE50 CE 00 20      [ 3] 5493         ldx     #0x0020
   AE53                    5494 LAE16:
   AE53 3F            [14] 5495         swi
   AE54 09            [ 3] 5496         dex
   AE55 26 FC         [ 3] 5497         bne     LAE16  
   AE57 5A            [ 2] 5498         decb
   AE58 26 F6         [ 3] 5499         bne     LAE13  
   AE5A 39            [ 5] 5500         rts
                           5501 
                           5502 ; text??
   AE5B                    5503 LAE1E:
   AE5B 2B 2B 2B 00        5504         .asciz      '+++'
   AE5F                    5505 LAE22:
   AE5F 41 54 48 0D 00     5506         .asciz      'ATH\r'
   AE64                    5507 LAE27:
   AE64 41 54 5A 0D 00     5508         .asciz      'ATZ\r'
   AE69                    5509 LAE2C:
   AE69 41 54 41 0D 00     5510         .asciz      'ATA\r'
                           5511 
   AE6E                    5512 LAE31:
   AE6E CE AE 75      [ 3] 5513         ldx     #LAE38          ; big long string of stats, with compressed ansi codes
   AE71 BD 8A 2A      [ 6] 5514         jsr     L8A1A  
   AE74 39            [ 5] 5515         rts
                           5516 
   AE75                    5517 LAE38:
   AE75 5E 30 31 30 31 53  5518         .ascii  "^0101Serial #:^0140#0000^0111~4"
        65 72 69 61 6C 20
        23 3A 5E 30 31 34
        30 23 30 30 30 30
        5E 30 31 31 31 7E
        34
   AE94 0E 20              5519         .byte   0x0E,0x20
   AE96 5E 30 31 34 31 7C  5520         .ascii  "^0141|"
   AE9C 04 28              5521         .byte   0x04,0x28
   AE9E 5E 30 33 30 31 43  5522         .ascii  "^0301CURRENT^0340HISTORY^0501Show Status:^0540Total # reg. shows:^0601Random Status:^0570|"
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
   AEF8 04 10              5523         .byte   0x04,0x10
   AEFA 5E 30 36 34 30 54  5524         .ascii  "^0640Total # live shows:^0701Current Reg Tape #:^0670|"
        6F 74 61 6C 20 23
        20 6C 69 76 65 20
        73 68 6F 77 73 3A
        5E 30 37 30 31 43
        75 72 72 65 6E 74
        20 52 65 67 20 54
        61 70 65 20 23 3A
        5E 30 36 37 30 7C
   AF30 04 12              5525         .byte   0x04,0x12
   AF32 5E 30 37 33 30 7E  5526         .ascii  "^0730~3"
        33
   AF39 04 02              5527         .byte   0x04,0x02
   AF3B 5E 30 37 34 30 54  5528         .ascii  "^0740Total # failed pswd attempts:^0801Current Live Tape #:^0770|"
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
   AF7C 04 14              5529         .byte   0x04,0x14
   AF7E 5E 30 38 33 30 7E  5530         .ascii  "^0830~3"
        33
   AF85 04 05              5531         .byte   0x04,0x05
   AF87 5E 30 38 34 30 54  5532         .ascii  "^0840Total # successful pswd:^0901Current Version #:^0870|"
        6F 74 61 6C 20 23
        20 73 75 63 63 65
        73 73 66 75 6C 20
        70 73 77 64 3A 5E
        30 39 30 31 43 75
        72 72 65 6E 74 20
        56 65 72 73 69 6F
        6E 20 23 3A 5E 30
        38 37 30 7C
   AFC1 04 16              5533         .byte   0x04,0x16
   AFC3 5E 30 39 33 30 40  5534         .ascii  "^0930@"
   AFC9 04 00              5535         .byte   0x04,0x00
   AFCB 5E 30 39 34 30 54  5536         .ascii  "^0940Total # bdays played:^1040Total # VCR adjusts:^0970|"
        6F 74 61 6C 20 23
        20 62 64 61 79 73
        20 70 6C 61 79 65
        64 3A 5E 31 30 34
        30 54 6F 74 61 6C
        20 23 20 56 43 52
        20 61 64 6A 75 73
        74 73 3A 5E 30 39
        37 30 7C
   B004 04 18              5537         .byte   0x04,0x18
   B006 5E 31 30 37 30 7C  5538         .ascii  "^1070|"
   B00C 04 1A              5539         .byte   0x04,0x1A
   B00E 5E 31 31 34 30 54  5540         .ascii  "^1140Total # remote accesses:^1240Total # access attempts:^1170|"
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
   B04E 04 1C              5541         .byte   0x04,0x1C
   B050 5E 31 32 37 30 7C  5542         .ascii  "^1270|"
   B056 04 1E              5543         .byte   0x04,0x1E
   B058 5E 31 33 34 30 54  5544         .ascii  "^1340Total # rejected showtapes:^1440Total # Short bdays:^1370|"
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
   B097 04 20              5545         .byte   0x04,0x20
   B099 5E 31 34 37 30 7C  5546         .ascii  "^1470|"
   B09F 04 22              5547         .byte   0x04,0x22
   B0A1 5E 31 35 34 30 54  5548         .ascii  "^1540Total # Reg bdays:^1640Total # resets-pwr ups:^1570|"
        6F 74 61 6C 20 23
        20 52 65 67 20 62
        64 61 79 73 3A 5E
        31 36 34 30 54 6F
        74 61 6C 20 23 20
        72 65 73 65 74 73
        2D 70 77 72 20 75
        70 73 3A 5E 31 35
        37 30 7C
   B0DA 04 24              5549         .byte   0x04,0x24
   B0DC 5E 31 36 37 30 7C  5550         .ascii  "^1670|"
   B0E2 04 26              5551         .byte   0x04,0x26
   B0E4 5E 31 38 30 31 46  5552         .ascii  "^1801FUNCTIONS^1823Select Function:^20011.Clear rnd enables^2028 6.Set loc name-#^205411.Diagnostics^21012.Set rnd enables^2128 7.Set Time^215412.^22013.Set reg tape #^2228 8.Disbl-enbl show^225413.^23014.Set liv tape #^2328 9.Upload program^235414.^24015.Reset history^242810.Debugger^245415.^1840"
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
   B20E 00                 5553         .byte   0x00
                           5554 
   B20F                    5555 LB1D2:
   B20F CE B2 15      [ 3] 5556         ldx     #LB1D8          ; escape sequence?
   B212 7E 8A 2A      [ 3] 5557         jmp     L8A1A  
                           5558 
                           5559 ; ANSI control sequence - Clear Screen and Home Cursor
   B215                    5560 LB1D8:
                           5561         ; esc[2J
   B215 1B                 5562         .byte   0x1b
   B216 5B 32 4A 00        5563         .asciz  '[2J'
                           5564 
   B21A                    5565 LB1DD:
   B21A CE 05 A0      [ 3] 5566         ldx     #0x05A0
   B21D CC 00 00      [ 3] 5567         ldd     #0x0000
   B220 FD 02 9E      [ 5] 5568         std     (0x029E)
   B223                    5569 LB1E6:
   B223 FC 02 9E      [ 5] 5570         ldd     (0x029E)
   B226 C3 00 01      [ 4] 5571         addd    #0x0001
   B229 FD 02 9E      [ 5] 5572         std     (0x029E)
   B22C 1A 83 0F A0   [ 5] 5573         cpd     #0x0FA0
   B230 24 28         [ 3] 5574         bcc     LB21D  
   B232 BD B2 60      [ 6] 5575         jsr     LB223
   B235 25 04         [ 3] 5576         bcs     LB1FE  
   B237 3F            [14] 5577         swi
   B238 20 E9         [ 3] 5578         bra     LB1E6  
   B23A 39            [ 5] 5579         rts
                           5580 
   B23B                    5581 LB1FE:
   B23B A7 00         [ 4] 5582         staa    0,X     
   B23D 08            [ 3] 5583         inx
   B23E 81 0D         [ 2] 5584         cmpa    #0x0D
   B240 26 02         [ 3] 5585         bne     LB207  
   B242 20 18         [ 3] 5586         bra     LB21F  
   B244                    5587 LB207:
   B244 81 1B         [ 2] 5588         cmpa    #0x1B
   B246 26 02         [ 3] 5589         bne     LB20D  
   B248 20 10         [ 3] 5590         bra     LB21D  
   B24A                    5591 LB20D:
   B24A 7D 00 B3      [ 6] 5592         tst     (0x00B3)
   B24D 27 03         [ 3] 5593         beq     LB215  
   B24F BD 8B 4B      [ 6] 5594         jsr     L8B3B
   B252                    5595 LB215:
   B252 CC 00 00      [ 3] 5596         ldd     #0x0000
   B255 FD 02 9E      [ 5] 5597         std     (0x029E)
   B258 20 C9         [ 3] 5598         bra     LB1E6  
   B25A                    5599 LB21D:
   B25A 0D            [ 2] 5600         sec
   B25B 39            [ 5] 5601         rts
                           5602 
   B25C                    5603 LB21F:
   B25C 6F 00         [ 6] 5604         clr     0,X     
   B25E 0C            [ 2] 5605         clc
   B25F 39            [ 5] 5606         rts
                           5607 
   B260                    5608 LB223:
   B260 B6 18 0D      [ 4] 5609         ldaa    SCCCTRLA
   B263 44            [ 2] 5610         lsra
   B264 25 0B         [ 3] 5611         bcs     LB234  
   B266 4F            [ 2] 5612         clra
   B267 B7 18 0D      [ 4] 5613         staa    SCCCTRLA
   B26A 86 30         [ 2] 5614         ldaa    #0x30
   B26C B7 18 0D      [ 4] 5615         staa    SCCCTRLA
   B26F 0C            [ 2] 5616         clc
   B270 39            [ 5] 5617         rts
                           5618 
   B271                    5619 LB234:
   B271 86 01         [ 2] 5620         ldaa    #0x01
   B273 B7 18 0D      [ 4] 5621         staa    SCCCTRLA
   B276 86 70         [ 2] 5622         ldaa    #0x70
   B278 B5 18 0D      [ 4] 5623         bita    SCCCTRLA
   B27B 26 05         [ 3] 5624         bne     LB245  
   B27D 0D            [ 2] 5625         sec
   B27E B6 18 0F      [ 4] 5626         ldaa    SCCDATAA
   B281 39            [ 5] 5627         rts
                           5628 
   B282                    5629 LB245:
   B282 B6 18 0F      [ 4] 5630         ldaa    SCCDATAA
   B285 86 30         [ 2] 5631         ldaa    #0x30
   B287 B7 18 0C      [ 4] 5632         staa    SCCCTRLB
   B28A 0C            [ 2] 5633         clc
   B28B 39            [ 5] 5634         rts
                           5635 
   B28C                    5636 LB24F:
   B28C 38            [ 5] 5637         pulx
   B28D 18 CE 05 A0   [ 4] 5638         ldy     #0x05A0
   B291                    5639 LB254:
   B291 A6 00         [ 4] 5640         ldaa    0,X
   B293 27 11         [ 3] 5641         beq     LB269
   B295 08            [ 3] 5642         inx
   B296 18 A1 00      [ 5] 5643         cmpa    0,Y
   B299 26 04         [ 3] 5644         bne     LB262
   B29B 18 08         [ 4] 5645         iny
   B29D 20 F2         [ 3] 5646         bra     LB254
   B29F                    5647 LB262:
   B29F A6 00         [ 4] 5648         ldaa    0,X
   B2A1 27 07         [ 3] 5649         beq     LB26D
   B2A3 08            [ 3] 5650         inx
   B2A4 20 F9         [ 3] 5651         bra     LB262
   B2A6                    5652 LB269:
   B2A6 08            [ 3] 5653         inx
   B2A7 3C            [ 4] 5654         pshx
   B2A8 0C            [ 2] 5655         clc
   B2A9 39            [ 5] 5656         rts
   B2AA                    5657 LB26D:
   B2AA 08            [ 3] 5658         inx
   B2AB 3C            [ 4] 5659         pshx
   B2AC 0D            [ 2] 5660         sec
   B2AD 39            [ 5] 5661         rts
                           5662 
   B2AE                    5663 LB271:
   B2AE CE 05 A0      [ 3] 5664         ldx     #0x05A0
   B2B1                    5665 LB274:
   B2B1 A6 00         [ 4] 5666         ldaa    0,X
   B2B3 08            [ 3] 5667         inx
   B2B4 81 0D         [ 2] 5668         cmpa    #0x0D
   B2B6 26 F9         [ 3] 5669         bne     LB274
   B2B8 09            [ 3] 5670         dex
   B2B9 09            [ 3] 5671         dex
   B2BA A6 00         [ 4] 5672         ldaa    0,X
   B2BC 09            [ 3] 5673         dex
   B2BD 80 30         [ 2] 5674         suba    #0x30
   B2BF 97 B2         [ 3] 5675         staa    (0x00B2)
   B2C1 8C 05 9F      [ 4] 5676         cpx     #0x059F
   B2C4 27 0B         [ 3] 5677         beq     LB294
   B2C6 A6 00         [ 4] 5678         ldaa    0,X
   B2C8 09            [ 3] 5679         dex
   B2C9 80 30         [ 2] 5680         suba    #0x30
   B2CB C6 0A         [ 2] 5681         ldab    #0x0A
   B2CD 3D            [10] 5682         mul
   B2CE 17            [ 2] 5683         tba
   B2CF 9B B2         [ 3] 5684         adda    (0x00B2)
   B2D1                    5685 LB294:
   B2D1 39            [ 5] 5686         rts
                           5687 
   B2D2                    5688 LB295:
   B2D2 59 6F 75 20 68 61  5689         .asciz  'You have selected #1'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 00
   B2E7                    5690 LB2AA:
   B2E7 59 6F 75 20 68 61  5691         .asciz  'You have selected #11'
        76 65 20 73 65 6C
        65 63 74 65 64 20
        23 31 31 00
                           5692 
   B2FD                    5693 LB2C0:
   B2FD CE B3 04      [ 3] 5694         ldx     #LB2C7          ; Table with compressed ANSI cursor controls
   B300 BD 8A 2A      [ 6] 5695         jsr     L8A1A  
   B303 39            [ 5] 5696         rts
                           5697 
   B304                    5698 LB2C7:
   B304 5E 32 30 30 31 25  5699         .asciz  "^2001%^2101%^2201%^2301%^2401%^2001"
        5E 32 31 30 31 25
        5E 32 32 30 31 25
        5E 32 33 30 31 25
        5E 32 34 30 31 25
        5E 32 30 30 31 00
                           5700 
                           5701 ; Random movement tables
                           5702 
                           5703 ; board 1
   B328                    5704 LB2EB:
   B328 FA 20 FA 20 F6 22  5705         .byte   0xfa,0x20,0xfa,0x20,0xf6,0x22,0xf5,0x20
        F5 20
   B330 F5 20 F3 22 F2 20  5706         .byte   0xf5,0x20,0xf3,0x22,0xf2,0x20,0xe5,0x22
        E5 22
   B338 E5 22 E2 20 D2 20  5707         .byte   0xe5,0x22,0xe2,0x20,0xd2,0x20,0xbe,0x00
        BE 00
   B340 BC 22 BB 30 B9 32  5708         .byte   0xbc,0x22,0xbb,0x30,0xb9,0x32,0xb9,0x32
        B9 32
   B348 B7 30 B6 32 B5 30  5709         .byte   0xb7,0x30,0xb6,0x32,0xb5,0x30,0xb4,0x32
        B4 32
   B350 B4 32 B3 20 B3 20  5710         .byte   0xb4,0x32,0xb3,0x20,0xb3,0x20,0xb1,0xa0
        B1 A0
   B358 B1 A0 B0 A2 AF A0  5711         .byte   0xb1,0xa0,0xb0,0xa2,0xaf,0xa0,0xaf,0xa6
        AF A6
   B360 AE A0 AE A6 AD A4  5712         .byte   0xae,0xa0,0xae,0xa6,0xad,0xa4,0xac,0xa0
        AC A0
   B368 AC A0 AB A0 AA A0  5713         .byte   0xac,0xa0,0xab,0xa0,0xaa,0xa0,0xaa,0xa0
        AA A0
   B370 A2 80 A0 A0 A0 A0  5714         .byte   0xa2,0x80,0xa0,0xa0,0xa0,0xa0,0x8d,0x80
        8D 80
   B378 8A A0 7E 80 7B A0  5715         .byte   0x8a,0xa0,0x7e,0x80,0x7b,0xa0,0x79,0xa4
        79 A4
   B380 78 A0 77 A4 76 A0  5716         .byte   0x78,0xa0,0x77,0xa4,0x76,0xa0,0x75,0xa4
        75 A4
   B388 74 A0 73 A4 72 A0  5717         .byte   0x74,0xa0,0x73,0xa4,0x72,0xa0,0x71,0xa4
        71 A4
   B390 70 A0 6F A4 6E A0  5718         .byte   0x70,0xa0,0x6f,0xa4,0x6e,0xa0,0x6d,0xa4
        6D A4
   B398 6C A0 69 80 69 80  5719         .byte   0x6c,0xa0,0x69,0x80,0x69,0x80,0x67,0xa0
        67 A0
   B3A0 5E 20 58 24 57 20  5720         .byte   0x5e,0x20,0x58,0x24,0x57,0x20,0x57,0x20
        57 20
   B3A8 56 24 55 20 54 24  5721         .byte   0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24
        54 24
   B3B0 53 20 52 24 52 24  5722         .byte   0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20
        50 20
   B3B8 4F 24 4E 20 4D 24  5723         .byte   0x4f,0x24,0x4e,0x20,0x4d,0x24,0x4c,0x20
        4C 20
   B3C0 4C 20 4B 24 4A 20  5724         .byte   0x4c,0x20,0x4b,0x24,0x4a,0x20,0x49,0x20
        49 20
   B3C8 49 00 48 20 47 20  5725         .byte   0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20
        47 20
   B3D0 46 20 45 24 45 24  5726         .byte   0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20
        44 20
   B3D8 42 20 42 20 37 04  5727         .byte   0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20
        35 20
   B3E0 2E 04 2E 04 2D 20  5728         .byte   0x2e,0x04,0x2e,0x04,0x2d,0x20,0x23,0x24
        23 24
   B3E8 21 20 17 24 13 00  5729         .byte   0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24
        11 24
   B3F0 10 30 07 34 06 30  5730         .byte   0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30
        05 30
   B3F8 FF FF              5731         .byte   0xff,0xff
                           5732 
                           5733 ; board 2
   B3FA                    5734 LB3BD:
   B3FA D7 22 D5 20 C9 22  5735         .byte   0xd7,0x22,0xd5,0x20,0xc9,0x22,0xc7,0x20
        C7 20
   B402 C4 24 C3 20 C2 24  5736         .byte   0xc4,0x24,0xc3,0x20,0xc2,0x24,0xc1,0x20
        C1 20
   B40A BF 24 BF 24 BE 20  5737         .byte   0xbf,0x24,0xbf,0x24,0xbe,0x20,0xbd,0x24
        BD 24
   B412 BC 20 BB 24 BA 20  5738         .byte   0xbc,0x20,0xbb,0x24,0xba,0x20,0xb9,0x20
        B9 20
   B41A B8 24 B7 20 B4 00  5739         .byte   0xb8,0x24,0xb7,0x20,0xb4,0x00,0xb4,0x00
        B4 00
   B422 B2 20 A9 20 A3 20  5740         .byte   0xb2,0x20,0xa9,0x20,0xa3,0x20,0xa2,0x20
        A2 20
   B42A A1 20 A0 20 A0 20  5741         .byte   0xa1,0x20,0xa0,0x20,0xa0,0x20,0x9f,0x20
        9F 20
   B432 9F 20 9E 20 9D 24  5742         .byte   0x9f,0x20,0x9e,0x20,0x9d,0x24,0x9d,0x24
        9D 24
   B43A 9B 20 9A 24 99 20  5743         .byte   0x9b,0x20,0x9a,0x24,0x99,0x20,0x98,0x20
        98 20
   B442 97 24 97 24 95 20  5744         .byte   0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20
        95 20
   B44A 94 00 94 00 93 20  5745         .byte   0x94,0x00,0x94,0x00,0x93,0x20,0x92,0x00
        92 00
   B452 92 00 91 20 90 20  5746         .byte   0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20
        90 20
   B45A 8F 20 8D 20 8D 20  5747         .byte   0x8f,0x20,0x8d,0x20,0x8d,0x20,0x81,0x00
        81 00
   B462 7F 20 79 00 79 00  5748         .byte   0x7f,0x20,0x79,0x00,0x79,0x00,0x78,0x20
        78 20
   B46A 76 20 6B 00 69 20  5749         .byte   0x76,0x20,0x6b,0x00,0x69,0x20,0x5e,0x00
        5E 00
   B472 5C 20 5B 30 52 10  5750         .byte   0x5c,0x20,0x5b,0x30,0x52,0x10,0x51,0x30
        51 30
   B47A 50 30 50 30 4F 20  5751         .byte   0x50,0x30,0x50,0x30,0x4f,0x20,0x4e,0x20
        4E 20
   B482 4E 20 4D 20 46 A0  5752         .byte   0x4e,0x20,0x4d,0x20,0x46,0xa0,0x45,0xa0
        45 A0
   B48A 3D A0 3D A0 39 20  5753         .byte   0x3d,0xa0,0x3d,0xa0,0x39,0x20,0x2a,0x00
        2A 00
   B492 28 20 1E 00 1C 22  5754         .byte   0x28,0x20,0x1e,0x00,0x1c,0x22,0x1c,0x22
        1C 22
   B49A 1B 20 1A 22 19 20  5755         .byte   0x1b,0x20,0x1a,0x22,0x19,0x20,0x18,0x22
        18 22
   B4A2 18 22 16 20 15 22  5756         .byte   0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22
        15 22
   B4AA 14 A0 13 A2 11 A0  5757         .byte   0x14,0xa0,0x13,0xa2,0x11,0xa0,0xff,0xff
        FF FF
                           5758 
                           5759 ; board 4
   B4B2                    5760 LB475:
   B4B2 BE 00 BC 22 BB 30  5761         .byte   0xbe,0x00,0xbc,0x22,0xbb,0x30,0xb9,0x32
        B9 32
   B4BA B9 32 B7 30 B6 32  5762         .byte   0xb9,0x32,0xb7,0x30,0xb6,0x32,0xb5,0x30
        B5 30
   B4C2 B4 32 B4 32 B3 20  5763         .byte   0xb4,0x32,0xb4,0x32,0xb3,0x20,0xb3,0x20
        B3 20
   B4CA B1 A0 B1 A0 B0 A2  5764         .byte   0xb1,0xa0,0xb1,0xa0,0xb0,0xa2,0xaf,0xa0
        AF A0
   B4D2 AF A6 AE A0 AE A6  5765         .byte   0xaf,0xa6,0xae,0xa0,0xae,0xa6,0xad,0xa4
        AD A4
   B4DA AC A0 AC A0 AB A0  5766         .byte   0xac,0xa0,0xac,0xa0,0xab,0xa0,0xaa,0xa0
        AA A0
   B4E2 AA A0 A2 80 A0 A0  5767         .byte   0xaa,0xa0,0xa2,0x80,0xa0,0xa0,0xa0,0xa0
        A0 A0
   B4EA 8D 80 8A A0 7E 80  5768         .byte   0x8d,0x80,0x8a,0xa0,0x7e,0x80,0x7b,0xa0
        7B A0
   B4F2 79 A4 78 A0 77 A4  5769         .byte   0x79,0xa4,0x78,0xa0,0x77,0xa4,0x76,0xa0
        76 A0
   B4FA 75 A4 74 A0 73 A4  5770         .byte   0x75,0xa4,0x74,0xa0,0x73,0xa4,0x72,0xa0
        72 A0
   B502 71 A4 70 A0 6F A4  5771         .byte   0x71,0xa4,0x70,0xa0,0x6f,0xa4,0x6e,0xa0
        6E A0
   B50A 6D A4 6C A0 69 80  5772         .byte   0x6d,0xa4,0x6c,0xa0,0x69,0x80,0x69,0x80
        69 80
   B512 67 A0 5E 20 58 24  5773         .byte   0x67,0xa0,0x5e,0x20,0x58,0x24,0x57,0x20
        57 20
   B51A 57 20 56 24 55 20  5774         .byte   0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24
        54 24
   B522 54 24 53 20 52 24  5775         .byte   0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24
        52 24
   B52A 50 20 4F 24 4E 20  5776         .byte   0x50,0x20,0x4f,0x24,0x4e,0x20,0x4d,0x24
        4D 24
   B532 4C 20 4C 20 4B 24  5777         .byte   0x4c,0x20,0x4c,0x20,0x4b,0x24,0x4a,0x20
        4A 20
   B53A 49 20 49 00 48 20  5778         .byte   0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20
        47 20
   B542 47 20 46 20 45 24  5779         .byte   0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24
        45 24
   B54A 44 20 42 20 42 20  5780         .byte   0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04
        37 04
   B552 35 20 2E 04 2E 04  5781         .byte   0x35,0x20,0x2e,0x04,0x2e,0x04,0x2d,0x20
        2D 20
   B55A 23 24 21 20 17 24  5782         .byte   0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00
        13 00
   B562 11 24 10 30 07 34  5783         .byte   0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30
        06 30
   B56A 05 30 FF FF        5784         .byte   0x05,0x30,0xff,0xff
                           5785 
                           5786 ; board 3
   B56E                    5787 LB531:
   B56E CD 20 CC 20 CB 20  5788         .byte   0xcd,0x20,0xcc,0x20,0xcb,0x20,0xcb,0x20
        CB 20
   B576 CA 00 C9 20 C9 20  5789         .byte   0xca,0x00,0xc9,0x20,0xc9,0x20,0xc8,0x20
        C8 20
   B57E C1 A0 C0 A0 B8 A0  5790         .byte   0xc1,0xa0,0xc0,0xa0,0xb8,0xa0,0xb8,0x20
        B8 20
   B586 B4 20 A6 00 A4 20  5791         .byte   0xb4,0x20,0xa6,0x00,0xa4,0x20,0x99,0x00
        99 00
   B58E 97 22 97 22 96 20  5792         .byte   0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22
        95 22
   B596 94 20 93 22 93 22  5793         .byte   0x94,0x20,0x93,0x22,0x93,0x22,0x91,0x20
        91 20
   B59E 90 20 90 20 8D A0  5794         .byte   0x90,0x20,0x90,0x20,0x8d,0xa0,0x8c,0xa0
        8C A0
   B5A6 7D A2 7D A2 7B A0  5795         .byte   0x7d,0xa2,0x7d,0xa2,0x7b,0xa0,0x7b,0xa0
        7B A0
   B5AE 79 A2 79 A2 77 A0  5796         .byte   0x79,0xa2,0x79,0xa2,0x77,0xa0,0x77,0xa0
        77 A0
   B5B6 76 80 75 A0 6E 20  5797         .byte   0x76,0x80,0x75,0xa0,0x6e,0x20,0x67,0x24
        67 24
   B5BE 66 20 65 24 64 20  5798         .byte   0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24
        63 24
   B5C6 63 24 61 20 60 24  5799         .byte   0x63,0x24,0x61,0x20,0x60,0x24,0x5f,0x20
        5F 20
   B5CE 5E 20 5D 24 5C 20  5800         .byte   0x5e,0x20,0x5d,0x24,0x5c,0x20,0x5b,0x24
        5B 24
   B5D6 5A 20 59 24 58 20  5801         .byte   0x5a,0x20,0x59,0x24,0x58,0x20,0x56,0x20
        56 20
   B5DE 55 04 54 00 53 24  5802         .byte   0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20
        52 20
   B5E6 52 20 4F 24 4F 24  5803         .byte   0x52,0x20,0x4f,0x24,0x4f,0x24,0x4e,0x30
        4E 30
   B5EE 4D 30 47 10 45 30  5804         .byte   0x4d,0x30,0x47,0x10,0x45,0x30,0x35,0x30
        35 30
   B5F6 33 10 31 30 31 30  5805         .byte   0x33,0x10,0x31,0x30,0x31,0x30,0x1d,0x20
        1D 20
   B5FE FF FF              5806         .byte   0xff,0xff
                           5807 
                           5808 ; board 5
   B600                    5809 LB5C3:
   B600 A9 20 A3 20 A2 20  5810         .byte   0xa9,0x20,0xa3,0x20,0xa2,0x20,0xa1,0x20
        A1 20
   B608 A0 20 A0 20 9F 20  5811         .byte   0xa0,0x20,0xa0,0x20,0x9f,0x20,0x9f,0x20
        9F 20
   B610 9E 20 9D 24 9D 24  5812         .byte   0x9e,0x20,0x9d,0x24,0x9d,0x24,0x9b,0x20
        9B 20
   B618 9A 24 99 20 98 20  5813         .byte   0x9a,0x24,0x99,0x20,0x98,0x20,0x97,0x24
        97 24
   B620 97 24 95 20 95 20  5814         .byte   0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00
        94 00
   B628 94 00 93 20 92 00  5815         .byte   0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00
        92 00
   B630 91 20 90 20 90 20  5816         .byte   0x91,0x20,0x90,0x20,0x90,0x20,0x8f,0x20
        8F 20
   B638 8D 20 8D 20 81 00  5817         .byte   0x8d,0x20,0x8d,0x20,0x81,0x00,0x7f,0x20
        7F 20
   B640 79 00 79 00 78 20  5818         .byte   0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20
        76 20
   B648 6B 00 69 20 5E 00  5819         .byte   0x6b,0x00,0x69,0x20,0x5e,0x00,0x5c,0x20
        5C 20
   B650 5B 30 52 10 51 30  5820         .byte   0x5b,0x30,0x52,0x10,0x51,0x30,0x50,0x30
        50 30
   B658 50 30 4F 20 4E 20  5821         .byte   0x50,0x30,0x4f,0x20,0x4e,0x20,0x4e,0x20
        4E 20
   B660 4D 20 46 A0 45 A0  5822         .byte   0x4d,0x20,0x46,0xa0,0x45,0xa0,0x3d,0xa0
        3D A0
   B668 3D A0 39 20 2A 00  5823         .byte   0x3d,0xa0,0x39,0x20,0x2a,0x00,0x28,0x20
        28 20
   B670 1E 00 1C 22 1C 22  5824         .byte   0x1e,0x00,0x1c,0x22,0x1c,0x22,0x1b,0x20
        1B 20
   B678 1A 22 19 20 18 22  5825         .byte   0x1a,0x22,0x19,0x20,0x18,0x22,0x18,0x22
        18 22
   B680 16 20 15 22 15 22  5826         .byte   0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xa0
        14 A0
   B688 13 A2 11 A0        5827         .byte   0x13,0xa2,0x11,0xa0
                           5828 
                           5829 ; All empty (0xFFs) in this gap
                           5830 
   F780                    5831         .org    0xF780
                           5832 
                           5833 ; Two Tables used by data protocol handler
                           5834 
   F780                    5835 LF780:
   F780 57 0B 00 00 00 00  5836         .byte   0x57,0x0b,0x00,0x00,0x00,0x00,0x08,0x00
        08 00
   F788 00 00 20 00 00 00  5837         .byte   0x00,0x00,0x20,0x00,0x00,0x00,0x80,0x00
        80 00
   F790 00 00 00 00 00 04  5838         .byte   0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
        00 00
   F798 00 10 00 00 00 00  5839         .byte   0x00,0x10,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
                           5840 
   F7A0                    5841 LF7A0:
   F7A0 40 12 20 09 80 24  5842         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x02,0x00
        02 00
   F7A8 40 12 20 09 80 24  5843         .byte   0x40,0x12,0x20,0x09,0x80,0x24,0x04,0x00
        04 00
   F7B0 00 00 00 00 00 00  5844         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00
   F7B8 00 00 00 00 08 00  5845         .byte   0x00,0x00,0x00,0x00,0x08,0x00,0x00,0x00
        00 00
                           5846 
   F7C0                    5847 LF7C0:
   F7C0 01                 5848         .byte   0x01
                           5849 ;
                           5850 ; All empty (0xFFs) in this gap
                           5851 ;
   F800                    5852         .org    0xF800
                           5853 ; Reset
   F800                    5854 RESET:
   F800 0F            [ 2] 5855         sei                     ; disable interrupts
   F801 86 03         [ 2] 5856         ldaa    #0x03
   F803 B7 10 24      [ 4] 5857         staa    TMSK2           ; disable irqs, set prescaler to 16
   F806 86 80         [ 2] 5858         ldaa    #0x80
   F808 B7 10 22      [ 4] 5859         staa    TMSK1           ; enable OC1 irq
   F80B 86 00         [ 2] 5860         ldaa    #0x00
   F80D B7 10 35      [ 4] 5861         staa    BPROT           ; protect ????
   F810 96 07         [ 3] 5862         ldaa    0x0007          ;
   F812 81 DB         [ 2] 5863         cmpa    #0xDB           ; special unprotect mode???
   F814 26 06         [ 3] 5864         bne     LF81C           ; if not, jump ahead
   F816 7F 10 35      [ 6] 5865         clr     BPROT           ; else unprotect everything
   F819 7F 00 07      [ 6] 5866         clr     0x0007          ; reset special unprotect mode???
   F81C                    5867 LF81C:
   F81C 8E 01 FF      [ 3] 5868         lds     #0x01FF         ; init SP
   F81F 86 A5         [ 2] 5869         ldaa    #0xA5
   F821 B7 10 5D      [ 4] 5870         staa    CSCTL           ; enable external IO:
                           5871                                 ; IO1EN,  BUSSEL, active LOW
                           5872                                 ; IO2EN,  PIA/SCCSEL, active LOW
                           5873                                 ; CSPROG, ROMSEL priority over RAMSEL 
                           5874                                 ; CSPROG, ROMSEL enabled, 32K, $8000-$FFFF
   F824 86 01         [ 2] 5875         ldaa    #0x01
   F826 B7 10 5F      [ 4] 5876         staa    CSGSIZ          ; CSGEN,  RAMSEL active low
                           5877                                 ; CSGEN,  RAMSEL 32K
   F829 86 00         [ 2] 5878         ldaa    #0x00
   F82B B7 10 5E      [ 4] 5879         staa    CSGADR          ; CSGEN,  RAMSEL = $0000-$7FFF (except internal regs)
   F82E 86 F0         [ 2] 5880         ldaa    #0xF0
   F830 B7 10 5C      [ 4] 5881         staa    CSSTRH          ; 3 cycle clock stretching on BUSSEL and LCRS
   F833 7F 00 00      [ 6] 5882         clr     0x0000          ; ????? Done with basic init?
                           5883 
                           5884 ; Initialize Main PIA
   F836 86 30         [ 2] 5885         ldaa    #0x30           ;
   F838 B7 18 05      [ 4] 5886         staa    PIA0CRA         ; control register A, CA2=0, sel DDRA
   F83B B7 18 07      [ 4] 5887         staa    PIA0CRB         ; control register B, CB2=0, sel DDRB
   F83E 86 FF         [ 2] 5888         ldaa    #0xFF
   F840 B7 18 06      [ 4] 5889         staa    PIA0DDRB        ; select B0-B7 to be outputs
   F843 86 78         [ 2] 5890         ldaa    #0x78           ;
   F845 B7 18 04      [ 4] 5891         staa    PIA0DDRA        ; select A3-A6 to be outputs
   F848 86 34         [ 2] 5892         ldaa    #0x34           ;
   F84A B7 18 05      [ 4] 5893         staa    PIA0CRA         ; select output register A
   F84D B7 18 07      [ 4] 5894         staa    PIA0CRB         ; select output register B
   F850 C6 FF         [ 2] 5895         ldab    #0xFF
   F852 BD FA F9      [ 6] 5896         jsr     BUTNLIT         ; turn on all button lights
   F855 20 13         [ 3] 5897         bra     LF86A           ; jump past data table
                           5898 
                           5899 ; data table for aux serial config
   F857                    5900 LF857:
   F857 09 4A              5901         .byte   0x09,0x4a       ; channel reset B, MIE off, DLC on, no vector
   F859 01 10              5902         .byte   0x01,0x10       ; irq on all character received
   F85B 0C 18              5903         .byte   0x0c,0x18       ; Lower byte of time constant
   F85D 0D 00              5904         .byte   0x0d,0x00       ; Upper byte of time constant
   F85F 04 44              5905         .byte   0x04,0x44       ; X16 clock mode, 8-bit sync char, 1 stop bit, no parity
   F861 0E 63              5906         .byte   0x0e,0x63       ; Disable DPLL, BR enable & source
   F863 05 68              5907         .byte   0x05,0x68       ; No DTR/RTS, Tx 8 bits/char, Tx enable
   F865 0B 56              5908         .byte   0x0b,0x56       ; Rx & Tx & TRxC clk from BR gen
   F867 03 C1              5909         .byte   0x03,0xc1       ; Rx 8 bits/char, Rx Enable
                           5910         ;   tc = 4Mhz / (2 * DesiredRate * BRClockPeriod) - 2
                           5911         ;   DesiredRate=~4800 bps with tc=0x18 and BRClockPeriod=16
   F869 FF                 5912         .byte   0xff            ; end of table marker
                           5913 
                           5914 ; init SCC (8530), aux serial config
   F86A                    5915 LF86A:
   F86A CE F8 57      [ 3] 5916         ldx     #LF857
   F86D                    5917 LF86D:
   F86D A6 00         [ 4] 5918         ldaa    0,X
   F86F 81 FF         [ 2] 5919         cmpa    #0xFF
   F871 27 06         [ 3] 5920         beq     LF879
   F873 B7 18 0D      [ 4] 5921         staa    SCCCTRLA
   F876 08            [ 3] 5922         inx
   F877 20 F4         [ 3] 5923         bra     LF86D
                           5924 
                           5925 ; Setup normal SCI, 8 data bits, 1 stop bit
                           5926 ; Interrupts disabled, Transmitter and Receiver enabled
                           5927 ; prescaler = /13, SCR=/2, rate = 9600 baud at 16Mhz clock
                           5928 
   F879                    5929 LF879:
   F879 86 00         [ 2] 5930         ldaa    #0x00
   F87B B7 10 2C      [ 4] 5931         staa    SCCR1
   F87E 86 0C         [ 2] 5932         ldaa    #0x0C
   F880 B7 10 2D      [ 4] 5933         staa    SCCR2
   F883 86 30         [ 2] 5934         ldaa    #0x30
   F885 B7 10 2B      [ 4] 5935         staa    BAUD
                           5936 
                           5937 ; Initialize all RAM vectors to RTI: 
                           5938 ; Opcode 0x3b into vectors at 0x0100 through 0x0139
                           5939 
   F888 CE 01 00      [ 3] 5940         ldx     #0x0100
   F88B 86 3B         [ 2] 5941         ldaa    #0x3B           ; RTI opcode
   F88D                    5942 LF88D:
   F88D A7 00         [ 4] 5943         staa    0,X
   F88F 08            [ 3] 5944         inx
   F890 08            [ 3] 5945         inx
   F891 08            [ 3] 5946         inx
   F892 8C 01 3C      [ 4] 5947         cpx     #0x013C
   F895 25 F6         [ 3] 5948         bcs     LF88D
   F897 C6 F0         [ 2] 5949         ldab    #0xF0
   F899 F7 18 04      [ 4] 5950         stab    PIA0PRA         ; enable LCD backlight, disable RESET button light
   F89C 86 7E         [ 2] 5951         ldaa    #0x7E
   F89E 97 03         [ 3] 5952         staa    (0x0003)        ; Put a jump instruction here???
                           5953 
                           5954 ; Non-destructive ram test:
                           5955 ;
                           5956 ; HC11 Internal RAM: 0x0000-0x3ff
                           5957 ; External NVRAM:    0x2000-0x7fff
                           5958 ;
                           5959 ; Note:
                           5960 ; External NVRAM:    0x0400-0xfff is also available, but not tested
                           5961 
   F8A0 CE 00 00      [ 3] 5962         ldx     #0x0000
   F8A3                    5963 LF8A3:
   F8A3 E6 00         [ 4] 5964         ldab    0,X             ; save value
   F8A5 86 55         [ 2] 5965         ldaa    #0x55
   F8A7 A7 00         [ 4] 5966         staa    0,X
   F8A9 A1 00         [ 4] 5967         cmpa    0,X
   F8AB 26 19         [ 3] 5968         bne     LF8C6
   F8AD 49            [ 2] 5969         rola
   F8AE A7 00         [ 4] 5970         staa    0,X
   F8B0 A1 00         [ 4] 5971         cmpa    0,X
   F8B2 26 12         [ 3] 5972         bne     LF8C6
   F8B4 E7 00         [ 4] 5973         stab    0,X             ; restore value
   F8B6 08            [ 3] 5974         inx
   F8B7 8C 04 00      [ 4] 5975         cpx     #0x0400
   F8BA 26 03         [ 3] 5976         bne     LF8BF
   F8BC CE 20 00      [ 3] 5977         ldx     #0x2000
   F8BF                    5978 LF8BF:  
   F8BF 8C 80 00      [ 4] 5979         cpx     #0x8000
   F8C2 26 DF         [ 3] 5980         bne     LF8A3
   F8C4 20 04         [ 3] 5981         bra     LF8CA
                           5982 
   F8C6                    5983 LF8C6:
   F8C6 86 01         [ 2] 5984         ldaa    #0x01           ; Mark Failed RAM test
   F8C8 97 00         [ 3] 5985         staa    (0x0000)
                           5986 ; 
   F8CA                    5987 LF8CA:
   F8CA C6 01         [ 2] 5988         ldab    #0x01
   F8CC BD FA C9      [ 6] 5989         jsr     DIAGDGT         ; write digit 1 to diag display
   F8CF B6 10 35      [ 4] 5990         ldaa    BPROT  
   F8D2 26 0F         [ 3] 5991         bne     LF8E3           ; if something is protected, jump ahead
   F8D4 B6 30 00      [ 4] 5992         ldaa    (0x3000)        ; NVRAM
   F8D7 81 7E         [ 2] 5993         cmpa    #0x7E
   F8D9 26 08         [ 3] 5994         bne     LF8E3           ; if RAM(0x3000) == 0x7E, jump ahead anyway (special unlock?)
                           5995 
                           5996 ; error?
   F8DB C6 0E         [ 2] 5997         ldab    #0x0E
   F8DD BD FA C9      [ 6] 5998         jsr     DIAGDGT         ; write digit E to diag display
   F8E0 7E 30 00      [ 3] 5999         jmp     (0x3000)        ; jump to routine in NVRAM?
                           6000 
                           6001 ; checking for serial connection
                           6002 
   F8E3                    6003 LF8E3:
   F8E3 CE F0 00      [ 3] 6004         ldx     #0xF000         ; timeout counter
   F8E6                    6005 LF8E6:
   F8E6 01            [ 2] 6006         nop
   F8E7 01            [ 2] 6007         nop
   F8E8 09            [ 3] 6008         dex
   F8E9 27 0B         [ 3] 6009         beq     LF8F6           ; if time is up, jump ahead
   F8EB BD FA 79      [ 6] 6010         jsr     SERIALR         ; else read serial data if available
   F8EE 24 F6         [ 3] 6011         bcc     LF8E6           ; if no data available, loop
   F8F0 81 1B         [ 2] 6012         cmpa    #0x1B           ; if serial data was read, is it an ESC?
   F8F2 27 3B         [ 3] 6013         beq     LF91D           ; if so, jump to echo hex char routine?
   F8F4 20 F0         [ 3] 6014         bra     LF8E6           ; else loop
   F8F6                    6015 LF8F6:
   F8F6 B6 40 00      [ 4] 6016         ldaa    (0x4000)        ; NEW
   F8F9 81 7E         [ 2] 6017         cmpa    #0x7E        
   F8FB 26 0B         [ 3] 6018         bne     0xF908
                           6019 
   F8FD C6 0A         [ 2] 6020         ldab    #0x0A
   F8FF BD FA C9      [ 6] 6021         jsr     DIAGDGT         ; else write digit A to diag display
                           6022 
   F902 BD 40 00      [ 6] 6023         jsr     0x4000          ; NEW - jump to ????
   F905 0F            [ 2] 6024         sei                     ; if we ever come return, just loop and do it all again
   F906 20 27         [ 3] 6025         bra     LF91D
                           6026 
   F908 B6 80 00      [ 4] 6027         ldaa    (0x8000)        ; check if this is a regular rom?
   F90B 81 7E         [ 2] 6028         cmpa    #0x7E        
   F90D 26 0B         [ 3] 6029         bne     MINIMON
                           6030 
                           6031 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6032 
   F90F C6 0A         [ 2] 6033         ldab    #0x0A           ; NEW - ??
   F911 BD FA C9      [ 6] 6034         jsr     DIAGDGT         ; NEW - A to display?
   F914 BD 80 00      [ 6] 6035         jsr     0x8000          ; NEW
   F917 0F            [ 2] 6036         sei                     ; NEW
   F918 20 15         [ 3] 6037         bra     0xF92F          ; NEW
                           6038 
   F91A                    6039 MINIMON:
   F91A C6 10         [ 2] 6040         ldab    #0x10           ; not a regular rom
   F91C BD FA C9      [ 6] 6041         jsr     DIAGDGT         ; blank the diag display
                           6042 
   F91F BD FB 0C      [ 6] 6043         jsr     SERMSGW         ; enter the mini-monitor???
   F922 4D 49 4E 49 2D 4D  6044         .ascis  'MINI-MON'
        4F CE
                           6045 
   F92A C6 10         [ 2] 6046         ldab    #0x10
   F92C BD FA C9      [ 6] 6047         jsr     DIAGDGT         ; blank the diag display
                           6048 
   F92F                    6049 LF91D:
   F92F 7F 00 05      [ 6] 6050         clr     (0x0005)
   F932 7F 00 04      [ 6] 6051         clr     (0x0004)
   F935 7F 00 02      [ 6] 6052         clr     (0x0002)
   F938 7F 00 06      [ 6] 6053         clr     (0x0006)
                           6054 
   F93B BD FB 0C      [ 6] 6055         jsr     SERMSGW
   F93E 0D 0A BE           6056         .ascis  '\r\n>'
                           6057 
                           6058 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6059 
                           6060 ; NEW - All new code here
   F941 BD FA BB      [ 6] 6061         jsr     0xFABB
   F944 97 01         [ 3] 6062         staa    (0x0001)
   F946 81 30         [ 2] 6063         cmpa    #0x30
   F948 25 3B         [ 3] 6064         bcs     0xF985
   F94A 81 39         [ 2] 6065         cmpa    #0x39
   F94C 22 0D         [ 3] 6066         bhi     0xF95B
   F94E 48            [ 2] 6067         asla
   F94F 48            [ 2] 6068         asla
   F950 48            [ 2] 6069         asla
   F951 48            [ 2] 6070         asla
   F952 C6 04         [ 2] 6071         ldab    #0x04
   F954 7D 00 02      [ 6] 6072         tst     (0x0002)
   F957 2A 0E         [ 3] 6073         bpl     0xF967
   F959 2B 18         [ 3] 6074         bmi     0xF973
   F95B 81 41         [ 2] 6075         cmpa    #0x41
   F95D 25 26         [ 3] 6076         bcs     0xF985
   F95F 81 47         [ 2] 6077         cmpa    #0x47
   F961 24 22         [ 3] 6078         bcc     0xF985
   F963 80 37         [ 2] 6079         suba    #0x37
   F965 20 E7         [ 3] 6080         bra     0xF94E
   F967 49            [ 2] 6081         rola
   F968 79 00 05      [ 6] 6082         rol     (0x0005)
   F96B 79 00 04      [ 6] 6083         rol     (0x0004)
   F96E 5A            [ 2] 6084         decb
   F96F 26 F6         [ 3] 6085         bne     0xF967
   F971 27 0B         [ 3] 6086         beq     0xF97E
   F973 49            [ 2] 6087         rola
   F974 79 00 06      [ 6] 6088         rol     0x0006
   F977 5A            [ 2] 6089         decb
   F978 26 F9         [ 3] 6090         bne     0xF973
   F97A 86 C0         [ 2] 6091         ldaa    #0xC0
   F97C 97 02         [ 3] 6092         staa    0x0002
   F97E 96 01         [ 3] 6093         ldaa    0x0001
   F980 BD FA A3      [ 6] 6094         jsr     0xFAA3
   F983 20 BC         [ 3] 6095         bra     0xF941
   F985 81 3A         [ 2] 6096         cmpa    #0x3A
   F987 26 06         [ 3] 6097         bne     0xF98F
   F989 C6 80         [ 2] 6098         ldab    #0x80
   F98B D7 02         [ 3] 6099         stab    0x0002
   F98D 20 F1         [ 3] 6100         bra     0xF980
   F98F 81 47         [ 2] 6101         cmpa    #0x47
   F991 26 08         [ 3] 6102         bne     0xF99B
   F993 BD FA A3      [ 6] 6103         jsr     0xFAA3
   F996 9D 03         [ 5] 6104         jsr     0x0003
   F998 7E F9 2F      [ 3] 6105         jmp     0xF92F
   F99B 81 2F         [ 2] 6106         cmpa    #0x2F
   F99D 26 0D         [ 3] 6107         bne     0xF9AC
   F99F 20 1C         [ 3] 6108         bra     0xF9BD
   F9A1 BD FA A3      [ 6] 6109         jsr     0xFAA3
   F9A4 BD F9 D9      [ 6] 6110         jsr     0xF9D9
   F9A7 7F 00 02      [ 6] 6111         clr     0x0002
   F9AA 20 95         [ 3] 6112         bra     0xF941
   F9AC 81 2E         [ 2] 6113         cmpa    #0x2E
   F9AE 26 14         [ 3] 6114         bne     0xF9C4
   F9B0 86 5E         [ 2] 6115         ldaa    #0x5E
   F9B2 BD FA A3      [ 6] 6116         jsr     0xFAA3
   F9B5 7C 00 05      [ 6] 6117         inc     0x0005
   F9B8 26 03         [ 3] 6118         bne     0xF9BD
   F9BA 7C 00 04      [ 6] 6119         inc     0x0004
   F9BD BD FA 6C      [ 6] 6120         jsr     0xFA6C
   F9C0 86 2F         [ 2] 6121         ldaa    #0x2F
   F9C2 20 DD         [ 3] 6122         bra     0xF9A1
   F9C4 81 2C         [ 2] 6123         cmpa    #0x2C
   F9C6 26 2D         [ 3] 6124         bne     0xF9F5
   F9C8 86 21         [ 2] 6125         ldaa    #0x21
   F9CA BD FA A3      [ 6] 6126         jsr     0xFAA3
   F9CD 96 05         [ 3] 6127         ldaa    0x0005
   F9CF 26 03         [ 3] 6128         bne     0xF9D4
   F9D1 7A 00 04      [ 6] 6129         dec     0x0004
   F9D4 7A 00 05      [ 6] 6130         dec     0x0005
   F9D7 20 E4         [ 3] 6131         bra     0xF9BD
   F9D9 18 DE 04      [ 5] 6132         ldy     0x0004
   F9DC 18 A6 00      [ 5] 6133         ldaa    0,Y
                           6134 
                           6135 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6136 
                           6137 ; convert A to 2 hex digits and transmit
   F9DF                    6138 SERHEXW:
   F9DF 36            [ 3] 6139         psha
   F9E0 44            [ 2] 6140         lsra
   F9E1 44            [ 2] 6141         lsra
   F9E2 44            [ 2] 6142         lsra
   F9E3 44            [ 2] 6143         lsra
   F9E4 BD F9 E8      [ 6] 6144         jsr     LF938
   F9E7 32            [ 4] 6145         pula
   F9E8                    6146 LF938:
   F9E8 84 0F         [ 2] 6147         anda    #0x0F
   F9EA 8A 30         [ 2] 6148         oraa    #0x30
   F9EC 81 3A         [ 2] 6149         cmpa    #0x3A
   F9EE 25 02         [ 3] 6150         bcs     LF942
   F9F0 8B 07         [ 2] 6151         adda    #0x07
   F9F2                    6152 LF942:
   F9F2 7E FA A3      [ 3] 6153         jmp     SERIALW
                           6154 
                           6155 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6156 
                           6157 ; NEW - - All new code here
   F9F5 81 0D         [ 2] 6158         cmpa    #0x0D
   F9F7 26 20         [ 3] 6159         bne     0xFA19
   F9F9 4F            [ 2] 6160         clra
   F9FA D6 02         [ 3] 6161         ldab    0x0002
   F9FC C4 40         [ 2] 6162         andb    #0x40
   F9FE 97 02         [ 3] 6163         staa    0x0002
   FA00 5D            [ 2] 6164         tstb
   FA01 27 10         [ 3] 6165         beq     0xFA13
   FA03 96 06         [ 3] 6166         ldaa    0x0006
   FA05 18 DE 04      [ 5] 6167         ldy     0x0004
   FA08 18 A7 00      [ 5] 6168         staa    0,Y
   FA0B 7C 00 05      [ 6] 6169         inc     0x0005
   FA0E 26 03         [ 3] 6170         bne     0xFA13
   FA10 7C 00 04      [ 6] 6171         inc     0x0004
   FA13 7F 00 06      [ 6] 6172         clr     0x0006
   FA16 7E F9 7E      [ 3] 6173         jmp     0xF97E
   FA19 81 20         [ 2] 6174         cmpa    #0x20
   FA1B 26 04         [ 3] 6175         bne     0xFA21
   FA1D 86 80         [ 2] 6176         ldaa    #0x80
   FA1F 20 D9         [ 3] 6177         bra     0xF9FA
   FA21 81 0A         [ 2] 6178         cmpa    #0x0A
   FA23 26 03         [ 3] 6179         bne     0xFA28
   FA25 7E F9 2F      [ 3] 6180         jmp     0xF92F
   FA28 81 57         [ 2] 6181         cmpa    #0x57
   FA2A 26 08         [ 3] 6182         bne     0xFA34
   FA2C BD FB 0C      [ 6] 6183         jsr     0xFB0C
   FA2F 57            [ 2] 6184         asrb
   FA30 4F            [ 2] 6185         clra
   FA31 4F            [ 2] 6186         clra
   FA32 46            [ 2] 6187         rora
   FA33 A1 81         [ 4] 6188         cmpa    0x81,X
   FA35 4C            [ 2] 6189         inca
   FA36 26 2F         [ 3] 6190         bne     0xFA67
   FA38 BD FA A9      [ 6] 6191         jsr     0xFAA9
   FA3B CE 00 00      [ 3] 6192         ldx     #0x0000
   FA3E BD FA 6F      [ 6] 6193         jsr     0xFA6F
   FA41 86 3A         [ 2] 6194         ldaa    #0x3A
   FA43 BD FA A3      [ 6] 6195         jsr     0xFAA3
   FA46 BD F9 D9      [ 6] 6196         jsr     0xF9D9
   FA49 86 20         [ 2] 6197         ldaa    #0x20
   FA4B 08            [ 3] 6198         inx
   FA4C 8C 00 10      [ 4] 6199         cpx     #0x0010
   FA4F 25 02         [ 3] 6200         bcs     0xFA53
   FA51 86 0D         [ 2] 6201         ldaa    #0x0D
   FA53 7C 00 05      [ 6] 6202         inc     0x0005
   FA56 26 03         [ 3] 6203         bne     0xFA5B
   FA58 7C 00 04      [ 6] 6204         inc     0x0004
   FA5B BD FA A3      [ 6] 6205         jsr     0xFAA3
   FA5E 81 20         [ 2] 6206         cmpa    #0x20
   FA60 27 E4         [ 3] 6207         beq     0xFA46
   FA62 BD FA 79      [ 6] 6208         jsr     0xFA79
   FA65 24 D4         [ 3] 6209         bcc     0xFA3B
   FA67 86 07         [ 2] 6210         ldaa    #0x07
   FA69 7E F9 80      [ 3] 6211         jmp     0xF980
   FA6C BD FA A9      [ 6] 6212         jsr     0xFAA9
   FA6F 96 04         [ 3] 6213         ldaa    0x0004
   FA71 BD F9 DF      [ 6] 6214         jsr     0xF9DF
   FA74 96 05         [ 3] 6215         ldaa    0x0005
   FA76 7E F9 DF      [ 3] 6216         jmp     0xF9DF
                           6217 
                           6218 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6219 
                           6220 ; serial read non-blocking
   FA79                    6221 SERIALR:
   FA79 B6 10 2E      [ 4] 6222         ldaa    SCSR  
   FA7C 85 20         [ 2] 6223         bita    #0x20
   FA7E 26 09         [ 3] 6224         bne     LF955
   FA80 0C            [ 2] 6225         clc
   FA81 39            [ 5] 6226         rts
                           6227 
                           6228 ; serial blocking read
   FA82                    6229 SERBLKR:
   FA82 B6 10 2E      [ 4] 6230         ldaa    SCSR            ; read serial status
   FA85 85 20         [ 2] 6231         bita    #0x20
   FA87 27 F9         [ 3] 6232         beq     SERBLKR         ; if RDRF=0, loop
                           6233 
                           6234 ; read serial data, (assumes it's ready)
   FA89                    6235 LF955:
   FA89 B6 10 2E      [ 4] 6236         ldaa    SCSR            ; read serial status
   FA8C 85 02         [ 2] 6237         bita    #0x02
   FA8E 26 09         [ 3] 6238         bne     LF965           ; if FE=1, clear it
   FA90 85 08         [ 2] 6239         bita    #0x08
   FA92 26 05         [ 3] 6240         bne     LF965           ; if OR=1, clear it
   FA94 B6 10 2F      [ 4] 6241         ldaa    SCDR            ; otherwise, good data
   FA97 0D            [ 2] 6242         sec
   FA98 39            [ 5] 6243         rts
                           6244 
   FA99                    6245 LF965:
   FA99 B6 10 2F      [ 4] 6246         ldaa    SCDR            ; clear any error
   FA9C 86 2F         [ 2] 6247         ldaa    #0x2F           ; '/'   
   FA9E BD FA A3      [ 6] 6248         jsr     SERIALW
   FAA1 20 DF         [ 3] 6249         bra     SERBLKR         ; go to wait for a character
                           6250 
                           6251 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6252 
                           6253 ; Send A to SCI with CR turned to CRLF
   FAA3                    6254 SERIALW:
   FAA3 81 0D         [ 2] 6255         cmpa    #0x0D           ; CR?
   FAA5 27 02         [ 3] 6256         beq     LF975           ; if so echo CR+LF
   FAA7 20 07         [ 3] 6257         bra     SERRAWW         ; else just echo it
   FAA9                    6258 LF975:
   FAA9 86 0D         [ 2] 6259         ldaa    #0x0D
   FAAB BD FA B0      [ 6] 6260         jsr     SERRAWW
   FAAE 86 0A         [ 2] 6261         ldaa    #0x0A
                           6262 
                           6263 ; send a char to SCI
   FAB0                    6264 SERRAWW:
   FAB0 F6 10 2E      [ 4] 6265         ldab    SCSR            ; wait for ready to send
   FAB3 C5 40         [ 2] 6266         bitb    #0x40
   FAB5 27 F9         [ 3] 6267         beq     SERRAWW
   FAB7 B7 10 2F      [ 4] 6268         staa    SCDR            ; send it
   FABA 39            [ 5] 6269         rts
                           6270 
                           6271 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6272 
                           6273 ; Unused?
   FABB                    6274 LF987:
   FABB BD FA 82      [ 6] 6275         jsr     SERBLKR         ; get a serial char
   FABE 81 7A         [ 2] 6276         cmpa    #0x7A           ;'z'
   FAC0 22 06         [ 3] 6277         bhi     LF994
   FAC2 81 61         [ 2] 6278         cmpa    #0x61           ;'a'
   FAC4 25 02         [ 3] 6279         bcs     LF994
   FAC6 82 20         [ 2] 6280         sbca    #0x20           ;convert to upper case?
   FAC8                    6281 LF994:
   FAC8 39            [ 5] 6282         rts
                           6283 
                           6284 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6285 
                           6286 ; Write hex digit arg in B to diagnostic lights
                           6287 ; or B=0x10 or higher for blank
                           6288 
   FAC9                    6289 DIAGDGT:
   FAC9 36            [ 3] 6290         psha
   FACA C1 11         [ 2] 6291         cmpb    #0x11
   FACC 25 02         [ 3] 6292         bcs     LF99C
   FACE C6 10         [ 2] 6293         ldab    #0x10
   FAD0                    6294 LF99C:
   FAD0 CE FA E8      [ 3] 6295         ldx     #LF9B4
   FAD3 3A            [ 3] 6296         abx
   FAD4 A6 00         [ 4] 6297         ldaa    0,X
   FAD6 B7 18 06      [ 4] 6298         staa    PIA0PRB         ; write arg to local data bus
   FAD9 B6 18 04      [ 4] 6299         ldaa    PIA0PRA         ; read from Port A
   FADC 8A 20         [ 2] 6300         oraa    #0x20           ; bit 5 high
   FADE B7 18 04      [ 4] 6301         staa    PIA0PRA         ; write back to Port A
   FAE1 84 DF         [ 2] 6302         anda    #0xDF           ; bit 5 low
   FAE3 B7 18 04      [ 4] 6303         staa    PIA0PRA         ; write back to Port A
   FAE6 32            [ 4] 6304         pula
   FAE7 39            [ 5] 6305         rts
                           6306 
                           6307 ; 7 segment patterns - XGFEDCBA
   FAE8                    6308 LF9B4:
   FAE8 C0                 6309         .byte   0xc0            ; 0
   FAE9 F9                 6310         .byte   0xf9            ; 1
   FAEA A4                 6311         .byte   0xa4            ; 2
   FAEB B0                 6312         .byte   0xb0            ; 3
   FAEC 99                 6313         .byte   0x99            ; 4
   FAED 92                 6314         .byte   0x92            ; 5
   FAEE 82                 6315         .byte   0x82            ; 6
   FAEF F8                 6316         .byte   0xf8            ; 7
   FAF0 80                 6317         .byte   0x80            ; 8
   FAF1 90                 6318         .byte   0x90            ; 9
   FAF2 88                 6319         .byte   0x88            ; A 
   FAF3 83                 6320         .byte   0x83            ; b
   FAF4 C6                 6321         .byte   0xc6            ; C
   FAF5 A1                 6322         .byte   0xa1            ; d
   FAF6 86                 6323         .byte   0x86            ; E
   FAF7 8E                 6324         .byte   0x8e            ; F
   FAF8 FF                 6325         .byte   0xff            ; blank
                           6326 
                           6327 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6328 
                           6329 ; Write arg in B to Button Lights
   FAF9                    6330 BUTNLIT:
   FAF9 36            [ 3] 6331         psha
   FAFA F7 18 06      [ 4] 6332         stab    PIA0PRB         ; write arg to local data bus
   FAFD B6 18 04      [ 4] 6333         ldaa    PIA0PRA         ; read from Port A
   FB00 84 EF         [ 2] 6334         anda    #0xEF           ; bit 4 low
   FB02 B7 18 04      [ 4] 6335         staa    PIA0PRA         ; write back to Port A
   FB05 8A 10         [ 2] 6336         oraa    #0x10           ; bit 4 high
   FB07 B7 18 04      [ 4] 6337         staa    PIA0PRA         ; write this to Port A
   FB0A 32            [ 4] 6338         pula
   FB0B 39            [ 5] 6339         rts
                           6340 
                           6341 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                           6342 
                           6343 ; Send rom message via SCI
   FB0C                    6344 SERMSGW:
   FB0C 18 38         [ 6] 6345         puly
   FB0E                    6346 LF9DA:
   FB0E 18 A6 00      [ 5] 6347         ldaa    0,Y
   FB11 27 09         [ 3] 6348         beq     LF9E8           ; if zero terminated, return
   FB13 2B 0C         [ 3] 6349         bmi     LF9ED           ; if high bit set..do last char and return
   FB15 BD FA B0      [ 6] 6350         jsr     SERRAWW         ; else send char
   FB18 18 08         [ 4] 6351         iny
   FB1A 20 F2         [ 3] 6352         bra     LF9DA           ; and loop for next one
                           6353 
   FB1C                    6354 LF9E8:
   FB1C 18 08         [ 4] 6355         iny                     ; setup return address and return
   FB1E 18 3C         [ 5] 6356         pshy
   FB20 39            [ 5] 6357         rts
                           6358 
   FB21                    6359 LF9ED:
   FB21 84 7F         [ 2] 6360         anda    #0x7F           ; remove top bit
   FB23 BD FA B0      [ 6] 6361         jsr     SERRAWW         ; send char
   FB26 20 F4         [ 3] 6362         bra     LF9E8           ; and we're done
   FB28 39            [ 5] 6363         rts
                           6364 
   FB29                    6365 DORTS:
   FB29 39            [ 5] 6366         rts
   FB2A                    6367 DORTI:        
   FB2A 3B            [12] 6368         rti
                           6369 
                           6370 ; all 0xffs in this gap
                           6371 
   FFA0                    6372         .org    0xFFA0
                           6373 
   FFA0 7E FB 29      [ 3] 6374         jmp     DORTS
   FFA3 7E FB 29      [ 3] 6375         jmp     DORTS
   FFA6 7E FB 29      [ 3] 6376         jmp     DORTS
   FFA9 7E F9 DF      [ 3] 6377         jmp     SERHEXW
   FFAC 7E FB 0C      [ 3] 6378         jmp     SERMSGW      
   FFAF 7E FA 79      [ 3] 6379         jmp     SERIALR     
   FFB2 7E FA A3      [ 3] 6380         jmp     SERIALW      
   FFB5 7E F9 1A      [ 3] 6381         jmp     MINIMON
   FFB8 7E FA C9      [ 3] 6382         jmp     DIAGDGT 
   FFBB 7E FA F9      [ 3] 6383         jmp     BUTNLIT 
                           6384 
   FFBE FF                 6385        .byte    0xff
   FFBF FF                 6386        .byte    0xff
                           6387 
                           6388 ; Vectors
                           6389 
   FFC0 FB 2A              6390        .word   DORTI            ; Stub RTI
   FFC2 FB 2A              6391        .word   DORTI            ; Stub RTI
   FFC4 FB 2A              6392        .word   DORTI            ; Stub RTI
   FFC6 FB 2A              6393        .word   DORTI            ; Stub RTI
   FFC8 FB 2A              6394        .word   DORTI            ; Stub RTI
   FFCA FB 2A              6395        .word   DORTI            ; Stub RTI
   FFCC FB 2A              6396        .word   DORTI            ; Stub RTI
   FFCE FB 2A              6397        .word   DORTI            ; Stub RTI
   FFD0 FB 2A              6398        .word   DORTI            ; Stub RTI
   FFD2 FB 2A              6399        .word   DORTI            ; Stub RTI
   FFD4 FB 2A              6400        .word   DORTI            ; Stub RTI
                           6401 
   FFD6 01 00              6402         .word  0x0100           ; SCI
   FFD8 01 03              6403         .word  0x0103           ; SPI
   FFDA 01 06              6404         .word  0x0106           ; PA accum. input edge
   FFDC 01 09              6405         .word  0x0109           ; PA Overflow
                           6406 
   FFDE FB 2A              6407         .word  DORTI            ; Stub RTI
                           6408 
   FFE0 01 0C              6409         .word  0x010c           ; TI4O5
   FFE2 01 0F              6410         .word  0x010f           ; TOC4
   FFE4 01 12              6411         .word  0x0112           ; TOC3
   FFE6 01 15              6412         .word  0x0115           ; TOC2
   FFE8 01 18              6413         .word  0x0118           ; TOC1
   FFEA 01 1B              6414         .word  0x011b           ; TIC3
   FFEC 01 1E              6415         .word  0x011e           ; TIC2
   FFEE 01 21              6416         .word  0x0121           ; TIC1
   FFF0 01 24              6417         .word  0x0124           ; RTI
   FFF2 01 27              6418         .word  0x0127           ; ~IRQ
   FFF4 01 2A              6419         .word  0x012a           ; XIRQ
   FFF6 01 2D              6420         .word  0x012d           ; SWI
   FFF8 01 30              6421         .word  0x0130           ; ILLEGAL OPCODE
   FFFA 01 33              6422         .word  0x0133           ; COP Failure
   FFFC 01 36              6423         .word  0x0136           ; COP Clock Monitor Fail
                           6424 
   FFFE F8 00              6425         .word  RESET            ; Reset
                           6426 
