                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       Main Stage Program
                              7 ;       Version Unknown
                              8 ;
                              9 ;       This image was recovered from an unmarked 2732
                             10 ;
                             11 
                             12 ; start of RAM
                     0000    13 RAM_start = 0x0000
                             14 
                     0030    15 X0030   = 0x0030
                     0031    16 X0031   = 0x0031
                     0032    17 X0032   = 0x0032
                     0033    18 X0033   = 0x0033
                             19 
                             20 ; Table Addresses go here
                     0034    21 X0034   = 0x0034
                     0035    22 X0035   = 0x0035
                     0036    23 X0036   = 0x0036
                     0037    24 X0037   = 0x0037
                     0038    25 X0038   = 0x0038
                     0039    26 X0039   = 0x0039
                     003A    27 X003A   = 0x003A
                     003B    28 X003B   = 0x003B
                     003C    29 X003C   = 0x003C
                     003D    30 X003D   = 0x003D
                             31 
                             32 ; IRQ timer section 1
                     003E    33 X003E   = 0x003E
                     003F    34 X003F   = 0x003F
                     0040    35 X0040   = 0x0040
                     0041    36 X0041   = 0x0041
                     0042    37 X0042   = 0x0042
                             38 
                     0044    39 X0044   = 0x0044
                     0045    40 X0045   = 0x0045
                     0046    41 X0046   = 0x0046
                     0047    42 X0047   = 0x0047
                     0048    43 X0048   = 0x0048
                     0049    44 X0049   = 0x0049
                     004A    45 X004A   = 0x004A
                             46 
                             47 ; IRQ timer section 2
                     004B    48 X004B   = 0x004B
                     004C    49 X004C   = 0x004C
                     004D    50 X004D   = 0x004D
                     004E    51 X004E   = 0x004E
                     004F    52 X004F   = 0x004F
                     0050    53 X0050   = 0x0050
                     0051    54 X0051   = 0x0051
                     0052    55 X0052   = 0x0052
                     0053    56 X0053   = 0x0053
                             57 
                     0055    58 X0055   = 0x0055
                     0056    59 X0056   = 0x0056
                     0057    60 X0057   = 0x0057
                     0058    61 X0058   = 0x0058
                     0059    62 X0059   = 0x0059
                     005A    63 X005A   = 0x005A
                     005B    64 X005B   = 0x005B
                     005C    65 X005C   = 0x005C
                     005D    66 X005D   = 0x005D
                     005E    67 X005E   = 0x005E
                     005F    68 X005F   = 0x005F
                     0060    69 X0060   = 0x0060
                     0061    70 X0061   = 0x0061
                     0062    71 X0062   = 0x0062
                     0063    72 X0063   = 0x0063
                     0064    73 X0064   = 0x0064    ; Command byte
                     0065    74 X0065   = 0x0065    ; Channel byte
                     0066    75 X0066   = 0x0066    ; Two byte address of current memory
                     0067    76 X0067   = 0x0067    ;   address to write to cards
                     0068    77 X0068   = 0x0068    ; Current Bitmask
                     0069    78 X0069   = 0x0069
                     006A    79 X006A   = 0x006A
                     006B    80 X006B   = 0x006B
                     006C    81 X006C   = 0x006C
                     006D    82 X006D   = 0x006D
                             83 
                     0070    84 X0070   = 0x0070
                             85 
                     0080    86 board_1_periph$ddr_reg_a    = 0x0080
                     0081    87 board_1_control_reg_a       = 0x0081
                     0082    88 board_1_periph$ddr_reg_b    = 0x0082
                     0083    89 board_1_control_reg_b       = 0x0083
                             90 
                     0084    91 board_2_periph$ddr_reg_a    = 0x0084
                     0088    92 board_3_periph$ddr_reg_a    = 0x0088
                     008C    93 board_4_periph$ddr_reg_a    = 0x008C
                             94 
                     0090    95 board_5_periph$ddr_reg_a    = 0x0090
                     0092    96 board_5_periph$ddr_reg_b    = 0x0092
                             97 
                     0094    98 board_6_periph$ddr_reg_a    = 0x0094
                             99 
                     0098   100 board_7_periph$ddr_reg_a    = 0x0098
                     009A   101 board_7_periph$ddr_reg_b    = 0x009A
                     009C   102 board_8_periph$ddr_reg_a    = 0x009C
                     009E   103 board_8_periph$ddr_reg_b    = 0x009E
                            104 
                     0101   105 X0101   = 0x0101
                     0102   106 X0102   = 0x0102
                            107 
                     0200   108 U18_PORTA   = 0x0200
                     0201   109 U18_DDRA    = 0x0201
                     0202   110 U18_PORTB   = 0x0202
                     0203   111 U18_DDRB    = 0x0203
                     0205   112 U18_edge_detect_control_DI_pos  = 0x0205
                     0206   113 U18_06      = 0x0206    
                     021C   114 U18_1C      = 0x021C    ; timer div by 1, enable interrupt
                     021D   115 U18_1D      = 0x021D    ; timer div by 1, disable interrupt
                            116 
                     0280   117 U19_PORTA   = 0x0280
                     0281   118 U19_DDRA    = 0x0281
                     0282   119 U19_PORTB   = 0x0282
                     0283   120 U19_DDRB    = 0x0283
                     0285   121 U19_edge_detect_control_DI_pos  = 0x0285
                     0286   122 U19_86      = 0x0286
                            123 
                     0300   124 transport_periph$ddr_reg_a  = 0x0300
                     0301   125 transport_control_reg_a     = 0x0301
                     0302   126 transport_periph$ddr_reg_b  = 0x0302
                     0303   127 transport_control_reg_b     = 0x0303
                            128 
                     0380   129 audio_periph$ddr_reg_a  = 0x0380
                     0381   130 audio_control_reg_a     = 0x0381
                     0382   131 audio_periph$ddr_reg_b  = 0x0382
                     0383   132 audio_control_reg_b     = 0x0383
                            133 
   1000                     134         .org    0x1000
                            135 ;
                            136 ;       IRQ handler
                            137 ;
   1000                     138 IRQ:
   1000 48            [ 3]  139         pha
   1001 AD 05 02      [ 4]  140         lda     U18_edge_detect_control_DI_pos  ; clear PA7 flag
   1004 AD 85 02      [ 4]  141         lda     U19_edge_detect_control_DI_pos  ; clear PA7 flag
   1007 A9 7D         [ 2]  142         lda     #0x7D
   1009 8D 1D 02      [ 4]  143         sta     U18_1D                  ; div by 8, enable interrupt
   100C A5 4B         [ 3]  144         lda     X004B                   ; timer
   100E F0 02         [ 4]  145         beq     L1012
   1010 C6 4B         [ 5]  146         dec     X004B
   1012                     147 L1012:
   1012 A5 4C         [ 3]  148         lda     X004C                   ; timer
   1014 F0 02         [ 4]  149         beq     L1018
   1016 C6 4C         [ 5]  150         dec     X004C
   1018                     151 L1018:
   1018 A5 4D         [ 3]  152         lda     X004D                   ; timer
   101A F0 02         [ 4]  153         beq     L101E
   101C C6 4D         [ 5]  154         dec     X004D
   101E                     155 L101E:
   101E C6 4E         [ 5]  156         dec     X004E                   ; timer
   1020 D0 42         [ 4]  157         bne     L1064
   1022 A9 64         [ 2]  158         lda     #0x64
   1024 85 4E         [ 3]  159         sta     X004E
   1026 A5 4F         [ 3]  160         lda     X004F                   ; timer
   1028 F0 02         [ 4]  161         beq     L102C
   102A C6 4F         [ 5]  162         dec     X004F
   102C                     163 L102C:
   102C A5 50         [ 3]  164         lda     X0050                   ; timer
   102E F0 02         [ 4]  165         beq     L1032
   1030 C6 50         [ 5]  166         dec     X0050
   1032                     167 L1032:
   1032 A5 51         [ 3]  168         lda     X0051                   ; timer
   1034 F0 02         [ 4]  169         beq     L1038
   1036 C6 51         [ 5]  170         dec     X0051
   1038                     171 L1038:
   1038 A5 3E         [ 3]  172         lda     X003E                   ; timer
   103A F0 02         [ 4]  173         beq     L103E
   103C C6 3E         [ 5]  174         dec     X003E
   103E                     175 L103E:
   103E A5 3F         [ 3]  176         lda     X003F                   ; timer
   1040 F0 02         [ 4]  177         beq     L1044
   1042 C6 3F         [ 5]  178         dec     X003F
   1044                     179 L1044:
   1044 A5 40         [ 3]  180         lda     X0040                   ; timer
   1046 F0 02         [ 4]  181         beq     L104A
   1048 C6 40         [ 5]  182         dec     X0040
   104A                     183 L104A:
   104A A5 41         [ 3]  184         lda     X0041                   ; timer
   104C F0 02         [ 4]  185         beq     L1050
   104E C6 41         [ 5]  186         dec     X0041
   1050                     187 L1050:
   1050 A5 42         [ 3]  188         lda     X0042                   ; timer
   1052 F0 02         [ 4]  189         beq     L1056
   1054 C6 42         [ 5]  190         dec     X0042
   1056                     191 L1056:
   1056 C6 52         [ 5]  192         dec     X0052                   ; timer
   1058 D0 0A         [ 4]  193         bne     L1064
   105A A9 64         [ 2]  194         lda     #0x64
   105C 85 52         [ 3]  195         sta     X0052
   105E A5 53         [ 3]  196         lda     X0053                   ; timer
   1060 F0 02         [ 4]  197         beq     L1064
   1062 C6 53         [ 5]  198         dec     X0053
   1064                     199 L1064:
   1064 68            [ 4]  200         pla
   1065 40            [ 6]  201         rti
                            202 ;
                            203 ;       Main Program Start
                            204 ;
   1066                     205 RESET:
   1066 D8            [ 2]  206         cld
   1067 78            [ 2]  207         sei
   1068 A2 F0         [ 2]  208         ldx     #0xF0
   106A 9A            [ 2]  209         txs
   106B A9 00         [ 2]  210         lda     #0x00
   106D A2 10         [ 2]  211         ldx     #0x10
   106F                     212 L106F:
   106F 95 00         [ 4]  213         sta     RAM_start,x
   1071 E8            [ 2]  214         inx
   1072 E0 80         [ 2]  215         cpx     #0x80
   1074 D0 F9         [ 4]  216         bne     L106F
   1076 A9 00         [ 2]  217         lda     #0x00
   1078 8D 01 03      [ 4]  218         sta     transport_control_reg_a
   107B 8D 02 02      [ 4]  219         sta     U18_PORTB
   107E 8D 81 03      [ 4]  220         sta     audio_control_reg_a
   1081 8D 83 03      [ 4]  221         sta     audio_control_reg_b
   1084 8D 05 02      [ 4]  222         sta     U18_edge_detect_control_DI_pos
   1087 8D 85 02      [ 4]  223         sta     U19_edge_detect_control_DI_pos
   108A 8D 06 02      [ 4]  224         sta     U18_06
   108D 8D 86 02      [ 4]  225         sta     U19_86
   1090 8D 03 03      [ 4]  226         sta     transport_control_reg_b
   1093 8D 01 02      [ 4]  227         sta     U18_DDRA
   1096 A9 02         [ 2]  228         lda     #0x02
   1098 8D 81 02      [ 4]  229         sta     U19_DDRA
   109B 8D 80 02      [ 4]  230         sta     U19_PORTA
   109E A9 FF         [ 2]  231         lda     #0xFF
   10A0 8D 82 03      [ 4]  232         sta     audio_periph$ddr_reg_b
   10A3 8D 03 02      [ 4]  233         sta     U18_DDRB
   10A6 8D 83 02      [ 4]  234         sta     U19_DDRB
   10A9 A9 FC         [ 2]  235         lda     #0xFC
   10AB 8D 02 03      [ 4]  236         sta     transport_periph$ddr_reg_b
   10AE A9 2E         [ 2]  237         lda     #0x2E
   10B0 8D 01 03      [ 4]  238         sta     transport_control_reg_a
   10B3 8D 03 03      [ 4]  239         sta     transport_control_reg_b
   10B6 A9 3C         [ 2]  240         lda     #0x3C
   10B8 8D 83 03      [ 4]  241         sta     audio_control_reg_b
   10BB 8D 81 03      [ 4]  242         sta     audio_control_reg_a
   10BE A9 10         [ 2]  243         lda     #0x10
   10C0 8D 82 03      [ 4]  244         sta     audio_periph$ddr_reg_b
   10C3 8D 82 02      [ 4]  245         sta     U19_PORTB
   10C6 A9 00         [ 2]  246         lda     #0x00
   10C8 85 5E         [ 3]  247         sta     X005E
   10CA A9 64         [ 2]  248         lda     #0x64
   10CC 85 4E         [ 3]  249         sta     X004E
   10CE 58            [ 2]  250         cli
   10CF 8D 1C 02      [ 4]  251         sta     U18_1C
   10D2 A9 09         [ 2]  252         lda     #0x09
   10D4 8D 02 01      [ 4]  253         sta     X0102
   10D7 20 FC 18      [ 6]  254         jsr     L18FC
   10DA 20 99 16      [ 6]  255         jsr     L1699
   10DD A9 02         [ 2]  256         lda     #0x02
   10DF 8D 80 02      [ 4]  257         sta     U19_PORTA
   10E2 A9 33         [ 2]  258         lda     #0x33
   10E4 20 0F 17      [ 6]  259         jsr     L170F
   10E7 A9 10         [ 2]  260         lda     #0x10
   10E9 20 8C 15      [ 6]  261         jsr     L158C
   10EC A9 28         [ 2]  262         lda     #0x28
   10EE 85 4F         [ 3]  263         sta     X004F
   10F0                     264 L10F0:
   10F0 20 39 19      [ 6]  265         jsr     L1939
   10F3 A5 4F         [ 3]  266         lda     X004F
   10F5 D0 F9         [ 4]  267         bne     L10F0
   10F7 20 99 16      [ 6]  268         jsr     L1699
   10FA 20 AA 18      [ 6]  269         jsr     L18AA
   10FD AD 00 02      [ 4]  270         lda     U18_PORTA
   1100 49 FF         [ 2]  271         eor     #0xFF
   1102 C9 10         [ 2]  272         cmp     #0x10
   1104 D0 15         [ 4]  273         bne     L111B
   1106 A9 FF         [ 2]  274         lda     #0xFF
   1108 85 98         [ 3]  275         sta     board_7_periph$ddr_reg_a
   110A 85 9A         [ 3]  276         sta     board_7_periph$ddr_reg_b
   110C 85 9C         [ 3]  277         sta     board_8_periph$ddr_reg_a
   110E 85 9E         [ 3]  278         sta     board_8_periph$ddr_reg_b
   1110 8D 02 02      [ 4]  279         sta     U18_PORTB
   1113                     280 L1113:
   1113 A9 32         [ 2]  281         lda     #0x32
   1115 20 0F 17      [ 6]  282         jsr     L170F
   1118 4C 13 11      [ 3]  283         jmp     L1113
                            284 ;
   111B                     285 L111B:
   111B A9 40         [ 2]  286         lda     #0x40
   111D 20 8C 15      [ 6]  287         jsr     L158C
   1120 A5 55         [ 3]  288         lda     X0055
   1122 8D 82 02      [ 4]  289         sta     U19_PORTB
   1125                     290 L1125:
   1125 A9 00         [ 2]  291         lda     #0x00
   1127 85 59         [ 3]  292         sta     X0059
   1129                     293 L1129:
   1129 AD 02 03      [ 4]  294         lda     transport_periph$ddr_reg_b
   112C A9 0A         [ 2]  295         lda     #0x0A
   112E 85 4B         [ 3]  296         sta     X004B
   1130 E6 59         [ 5]  297         inc     X0059
   1132 A5 59         [ 3]  298         lda     X0059
   1134 C9 64         [ 2]  299         cmp     #0x64
   1136 B0 0F         [ 4]  300         bcs     L1147
   1138                     301 L1138:
   1138 20 39 19      [ 6]  302         jsr     L1939
   113B A5 4B         [ 3]  303         lda     X004B
   113D F0 E6         [ 4]  304         beq     L1125
   113F AD 03 03      [ 4]  305         lda     transport_control_reg_b
   1142 10 F4         [ 4]  306         bpl     L1138
   1144 4C 29 11      [ 3]  307         jmp     L1129
                            308 ;
   1147                     309 L1147:
   1147 A9 20         [ 2]  310         lda     #0x20
   1149 20 8C 15      [ 6]  311         jsr     L158C
   114C A9 19         [ 2]  312         lda     #0x19
   114E 85 4F         [ 3]  313         sta     X004F
   1150                     314 L1150:
   1150 20 39 19      [ 6]  315         jsr     L1939
   1153 A5 4F         [ 3]  316         lda     X004F
   1155 D0 F9         [ 4]  317         bne     L1150
   1157 A9 00         [ 2]  318         lda     #0x00
   1159 85 55         [ 3]  319         sta     X0055
   115B A9 01         [ 2]  320         lda     #0x01
   115D 85 56         [ 3]  321         sta     X0056
   115F 85 57         [ 3]  322         sta     X0057
   1161 20 C7 14      [ 6]  323         jsr     L14C7
   1164 A9 80         [ 2]  324         lda     #0x80
   1166 20 8C 15      [ 6]  325         jsr     L158C
   1169 20 2C 15      [ 6]  326         jsr     L152C
   116C A9 96         [ 2]  327         lda     #0x96
   116E 85 4F         [ 3]  328         sta     X004F
   1170 A9 80         [ 2]  329         lda     #0x80
   1172 20 8C 15      [ 6]  330         jsr     L158C
   1175 20 8C 15      [ 6]  331         jsr     L158C
   1178                     332 L1178:
   1178 20 F1 11      [ 6]  333         jsr     L11F1
   117B C9 24         [ 2]  334         cmp     #0x24
   117D D0 F9         [ 4]  335         bne     L1178
   117F                     336 L117F:
   117F 20 F1 11      [ 6]  337         jsr     L11F1
   1182 C9 24         [ 2]  338         cmp     #0x24
   1184 F0 F9         [ 4]  339         beq     L117F
   1186 29 3F         [ 2]  340         and     #0x3F
   1188 C5 56         [ 3]  341         cmp     X0056
   118A F0 07         [ 4]  342         beq     L1193
   118C 4C 66 10      [ 3]  343         jmp     RESET
                            344 ;
   118F A9 00         [ 2]  345         lda     #0x00
   1191 85 49         [ 3]  346         sta     X0049
   1193                     347 L1193:
   1193 20 F1 11      [ 6]  348         jsr     L11F1
   1196 C9 28         [ 2]  349         cmp     #0x28
   1198 D0 F9         [ 4]  350         bne     L1193
   119A 20 F1 11      [ 6]  351         jsr     L11F1
   119D C9 47         [ 2]  352         cmp     #0x47
   119F 90 2B         [ 4]  353         bcc     L11CC
   11A1 C9 5A         [ 2]  354         cmp     #0x5A
   11A3 B0 27         [ 4]  355         bcs     L11CC
   11A5 29 1F         [ 2]  356         and     #0x1F
   11A7 A2 00         [ 2]  357         ldx     #0x00
   11A9 A0 00         [ 2]  358         ldy     #0x00
   11AB                     359 L11AB:
   11AB 95 70         [ 4]  360         sta     X0070,x
   11AD E8            [ 2]  361         inx
   11AE 20 F1 11      [ 6]  362         jsr     L11F1
   11B1 D9 E9 11      [ 5]  363         cmp     X11E9,y
   11B4 F0 F5         [ 4]  364         beq     L11AB
   11B6 C8            [ 2]  365         iny
   11B7 D9 E9 11      [ 5]  366         cmp     X11E9,y
   11BA D0 10         [ 4]  367         bne     L11CC
   11BC C0 07         [ 2]  368         cpy     #0x07
   11BE D0 EB         [ 4]  369         bne     L11AB
   11C0 CA            [ 2]  370         dex
   11C1 E4 70         [ 3]  371         cpx     X0070
   11C3 D0 07         [ 4]  372         bne     L11CC
   11C5 A9 00         [ 2]  373         lda     #0x00
   11C7 85 49         [ 3]  374         sta     X0049
   11C9 4C 11 12      [ 3]  375         jmp     L1211
                            376 ;
   11CC                     377 L11CC:
   11CC A5 49         [ 3]  378         lda     X0049
   11CE F0 12         [ 4]  379         beq     L11E2
   11D0                     380 L11D0:
   11D0 A9 FF         [ 2]  381         lda     #0xFF
   11D2 85 49         [ 3]  382         sta     X0049
   11D4 8D 02 02      [ 4]  383         sta     U18_PORTB
   11D7 8D 82 02      [ 4]  384         sta     U19_PORTB
   11DA A9 10         [ 2]  385         lda     #0x10
   11DC 20 8C 15      [ 6]  386         jsr     L158C
   11DF 4C D0 11      [ 3]  387         jmp     L11D0
                            388 ;
   11E2                     389 L11E2:
   11E2 A9 80         [ 2]  390         lda     #0x80
   11E4 85 49         [ 3]  391         sta     X0049
   11E6 4C 93 11      [ 3]  392         jmp     L1193
                            393 ;
   11E9                     394 X11E9:
   11E9 44 52 42 43 53 49   395         .ascii  "DRBCSIR)"
        52 29
                            396 ;
   11F1                     397 L11F1:
   11F1 A5 4F         [ 3]  398         lda     X004F
   11F3 F0 0B         [ 4]  399         beq     L1200
   11F5 AD 01 03      [ 4]  400         lda     transport_control_reg_a             ; Wait for Transport Byte
   11F8 10 F7         [ 4]  401         bpl     L11F1
   11FA AD 00 03      [ 4]  402         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   11FD 29 7F         [ 2]  403         and     #0x7F
   11FF 60            [ 6]  404         rts
                            405 ;
   1200                     406 L1200:
   1200 A5 49         [ 3]  407         lda     X0049
   1202 F0 03         [ 4]  408         beq     L1207
   1204 4C D0 11      [ 3]  409         jmp     L11D0
                            410 ;
   1207                     411 L1207:
   1207 A9 0F         [ 2]  412         lda     #0x0F
   1209 85 49         [ 3]  413         sta     X0049
   120B A9 02         [ 2]  414         lda     #0x02
   120D 85 57         [ 3]  415         sta     X0057
   120F 68            [ 4]  416         pla
   1210 68            [ 4]  417         pla
   1211                     418 L1211:
   1211 20 FC 18      [ 6]  419         jsr     L18FC
   1214 A9 02         [ 2]  420         lda     #0x02
   1216 85 56         [ 3]  421         sta     X0056
   1218 20 C7 14      [ 6]  422         jsr     L14C7
   121B A9 00         [ 2]  423         lda     #0x00
   121D 8D 80 02      [ 4]  424         sta     U19_PORTA
   1220 A9 00         [ 2]  425         lda     #0x00
   1222 85 63         [ 3]  426         sta     X0063
   1224                     427 L1224:
   1224 A9 18         [ 2]  428         lda     #0x18
   1226 85 53         [ 3]  429         sta     X0053
   1228                     430 L1228:
   1228 A9 0A         [ 2]  431         lda     #0x0A
   122A 85 4F         [ 3]  432         sta     X004F
   122C                     433 L122C:
   122C 20 39 19      [ 6]  434         jsr     L1939
   122F A5 63         [ 3]  435         lda     X0063
   1231 30 03         [ 4]  436         bmi     L1236
   1233 20 33 16      [ 6]  437         jsr     L1633
   1236                     438 L1236:
   1236 A5 6B         [ 3]  439         lda     X006B
   1238 30 47         [ 4]  440         bmi     L1281
   123A D0 11         [ 4]  441         bne     L124D
   123C A9 64         [ 2]  442         lda     #0x64
   123E 85 50         [ 3]  443         sta     X0050
   1240 A9 80         [ 2]  444         lda     #0x80
   1242 20 8C 15      [ 6]  445         jsr     L158C
   1245 A9 03         [ 2]  446         lda     #0x03
   1247 85 6B         [ 3]  447         sta     X006B
   1249 A9 A0         [ 2]  448         lda     #0xA0
   124B 85 4C         [ 3]  449         sta     X004C
   124D                     450 L124D:
   124D A5 6B         [ 3]  451         lda     X006B
   124F 6A            [ 2]  452         ror     a
   1250 90 0B         [ 4]  453         bcc     L125D
   1252 A5 50         [ 3]  454         lda     X0050
   1254 D0 07         [ 4]  455         bne     L125D
   1256 A9 02         [ 2]  456         lda     #0x02
   1258 85 6B         [ 3]  457         sta     X006B
   125A 4C 74 12      [ 3]  458         jmp     L1274
                            459 ;
   125D                     460 L125D:
   125D AD 02 03      [ 4]  461         lda     transport_periph$ddr_reg_b
   1260 6A            [ 2]  462         ror     a
   1261 B0 04         [ 4]  463         bcs     L1267
   1263 A9 A0         [ 2]  464         lda     #0xA0
   1265 85 4C         [ 3]  465         sta     X004C
   1267                     466 L1267:
   1267 A5 4C         [ 3]  467         lda     X004C
   1269 D0 11         [ 4]  468         bne     L127C
   126B A9 10         [ 2]  469         lda     #0x10
   126D 20 8C 15      [ 6]  470         jsr     L158C
   1270 A9 80         [ 2]  471         lda     #0x80
   1272 85 6B         [ 3]  472         sta     X006B
   1274                     473 L1274:
   1274 A9 80         [ 2]  474         lda     #0x80
   1276 2D 02 02      [ 4]  475         and     U18_PORTB
   1279 8D 02 02      [ 4]  476         sta     U18_PORTB
   127C                     477 L127C:
   127C A5 6B         [ 3]  478         lda     X006B
   127E 6A            [ 2]  479         ror     a
   127F B0 AB         [ 4]  480         bcs     L122C
   1281                     481 L1281:
   1281 20 A9 15      [ 6]  482         jsr     L15A9
   1284 20 00 16      [ 6]  483         jsr     L1600
   1287 A5 5A         [ 3]  484         lda     X005A
   1289 D0 A1         [ 4]  485         bne     L122C
   128B AD 02 02      [ 4]  486         lda     U18_PORTB
   128E 10 94         [ 4]  487         bpl     L1224
   1290 2A            [ 2]  488         rol     a
   1291 2A            [ 2]  489         rol     a
   1292 90 03         [ 4]  490         bcc     L1297
   1294 4C 64 13      [ 3]  491         jmp     L1364
                            492 ;
   1297                     493 L1297:
   1297 2A            [ 2]  494         rol     a
   1298 90 03         [ 4]  495         bcc     L129D
   129A 4C 15 13      [ 3]  496         jmp     L1315
                            497 ;
   129D                     498 L129D:
   129D 2A            [ 2]  499         rol     a
   129E 90 03         [ 4]  500         bcc     L12A3
   12A0 4C C4 12      [ 3]  501         jmp     L12C4
                            502 ;
   12A3                     503 L12A3:
   12A3 29 F0         [ 2]  504         and     #0xF0
   12A5 F0 03         [ 4]  505         beq     L12AA
   12A7 4C 6D 13      [ 3]  506         jmp     L136D
                            507 ;
   12AA                     508 L12AA:
   12AA 20 CD 16      [ 6]  509         jsr     L16CD
   12AD A5 32         [ 3]  510         lda     X0032
   12AF C9 01         [ 2]  511         cmp     #0x01
   12B1 F0 0E         [ 4]  512         beq     L12C1
   12B3 20 AA 18      [ 6]  513         jsr     L18AA
   12B6 A9 40         [ 2]  514         lda     #0x40
   12B8 85 92         [ 3]  515         sta     board_5_periph$ddr_reg_b
   12BA A5 53         [ 3]  516         lda     X0053
   12BC F0 57         [ 4]  517         beq     L1315
   12BE 4C 2C 12      [ 3]  518         jmp     L122C
   12C1                     519 L12C1:
   12C1 4C 24 12      [ 3]  520         jmp     L1224
                            521 ;
   12C4                     522 L12C4:
   12C4 A9 01         [ 2]  523         lda     #0x01
   12C6 85 56         [ 3]  524         sta     X0056
   12C8 20 C7 14      [ 6]  525         jsr     L14C7
   12CB 20 2C 15      [ 6]  526         jsr     L152C
   12CE 20 3F 17      [ 6]  527         jsr     L173F
   12D1 E6 56         [ 5]  528         inc     X0056
   12D3 20 D7 14      [ 6]  529         jsr     L14D7
   12D6 4C 24 12      [ 3]  530         jmp     L1224
                            531 ;
   12D9                     532 L12D9:
   12D9 E6 31         [ 5]  533         inc     X0031
   12DB 20 CD 16      [ 6]  534         jsr     L16CD
   12DE A5 32         [ 3]  535         lda     X0032
   12E0 C9 02         [ 2]  536         cmp     #0x02
   12E2 F0 03         [ 4]  537         beq     L12E7
   12E4 4C 2C 12      [ 3]  538         jmp     L122C
                            539 ;
   12E7                     540 L12E7:
   12E7 A9 31         [ 2]  541         lda     #0x31
   12E9 20 0F 17      [ 6]  542         jsr     L170F
   12EC A9 28         [ 2]  543         lda     #0x28
   12EE 85 4F         [ 3]  544         sta     X004F
   12F0                     545 L12F0:
   12F0 20 39 19      [ 6]  546         jsr     L1939
   12F3 A5 4F         [ 3]  547         lda     X004F
   12F5 D0 F9         [ 4]  548         bne     L12F0
   12F7 20 CD 16      [ 6]  549         jsr     L16CD
   12FA A5 32         [ 3]  550         lda     X0032
   12FC C9 01         [ 2]  551         cmp     #0x01
   12FE F0 03         [ 4]  552         beq     L1303
   1300 4C 2C 12      [ 3]  553         jmp     L122C
                            554 ;
   1303                     555 L1303:
   1303 AD 02 02      [ 4]  556         lda     U18_PORTB
   1306 29 80         [ 2]  557         and     #0x80
   1308 8D 02 02      [ 4]  558         sta     U18_PORTB
   130B 20 B5 18      [ 6]  559         jsr     L18B5
   130E A9 41         [ 2]  560         lda     #0x41
   1310 85 92         [ 3]  561         sta     board_5_periph$ddr_reg_b
   1312 4C 24 12      [ 3]  562         jmp     L1224
                            563 ;
   1315                     564 L1315:
   1315 A5 31         [ 3]  565         lda     X0031
   1317 F0 C0         [ 4]  566         beq     L12D9
   1319 A5 49         [ 3]  567         lda     X0049
   131B C9 0F         [ 2]  568         cmp     #0x0F
   131D F0 57         [ 4]  569         beq     L1376
   131F A9 52         [ 2]  570         lda     #0x52
   1321 85 4A         [ 3]  571         sta     X004A
   1323 A6 44         [ 3]  572         ldx     X0044
   1325 20 B7 14      [ 6]  573         jsr     L14B7
   1328 86 44         [ 3]  574         stx     X0044
   132A A9 A0         [ 2]  575         lda     #0xA0
   132C 8D 02 02      [ 4]  576         sta     U18_PORTB
   132F 20 C7 14      [ 6]  577         jsr     L14C7
   1332 20 2C 15      [ 6]  578         jsr     L152C
   1335                     579 L1335:
   1335 20 39 19      [ 6]  580         jsr     L1939
   1338 20 CD 16      [ 6]  581         jsr     L16CD
   133B A5 32         [ 3]  582         lda     X0032
   133D C9 02         [ 2]  583         cmp     #0x02
   133F F0 04         [ 4]  584         beq     L1345
   1341 C9 01         [ 2]  585         cmp     #0x01
   1343 F0 F0         [ 4]  586         beq     L1335
   1345                     587 L1345:
   1345 A9 00         [ 2]  588         lda     #0x00
   1347 85 31         [ 3]  589         sta     X0031
   1349 20 3F 17      [ 6]  590         jsr     L173F
   134C                     591 L134C:
   134C A5 56         [ 3]  592         lda     X0056
   134E C5 70         [ 3]  593         cmp     X0070
   1350 B0 08         [ 4]  594         bcs     L135A
   1352 E6 56         [ 5]  595         inc     X0056
   1354 20 D7 14      [ 6]  596         jsr     L14D7
   1357 4C 24 12      [ 3]  597         jmp     L1224
                            598 ;
   135A                     599 L135A:
   135A A9 02         [ 2]  600         lda     #0x02
   135C 85 56         [ 3]  601         sta     X0056
   135E 20 F0 14      [ 6]  602         jsr     L14F0
   1361 4C 24 12      [ 3]  603         jmp     L1224
                            604 ;
   1364                     605 L1364:
   1364 A5 49         [ 3]  606         lda     X0049
   1366 C9 0F         [ 2]  607         cmp     #0x0F
   1368 F0 32         [ 4]  608         beq     L139C
   136A 4C 4C 13      [ 3]  609         jmp     L134C
                            610 ;
   136D                     611 L136D:
   136D A5 49         [ 3]  612         lda     X0049
   136F C9 0F         [ 2]  613         cmp     #0x0F
   1371 F0 58         [ 4]  614         beq     L13CB
   1373 4C 61 14      [ 3]  615         jmp     L1461
                            616 ;
   1376                     617 L1376:
   1376 A9 A0         [ 2]  618         lda     #0xA0
   1378 8D 02 02      [ 4]  619         sta     U18_PORTB
   137B A5 57         [ 3]  620         lda     X0057
   137D 85 56         [ 3]  621         sta     X0056
   137F 20 C7 14      [ 6]  622         jsr     L14C7
   1382 20 2C 15      [ 6]  623         jsr     L152C
   1385                     624 L1385:
   1385 20 39 19      [ 6]  625         jsr     L1939
   1388 20 CD 16      [ 6]  626         jsr     L16CD
   138B A5 32         [ 3]  627         lda     X0032
   138D C9 02         [ 2]  628         cmp     #0x02
   138F F0 04         [ 4]  629         beq     L1395
   1391 C9 01         [ 2]  630         cmp     #0x01
   1393 F0 F0         [ 4]  631         beq     L1385
   1395                     632 L1395:
   1395 A9 00         [ 2]  633         lda     #0x00
   1397 85 31         [ 3]  634         sta     X0031
   1399 20 3F 17      [ 6]  635         jsr     L173F
   139C                     636 L139C:
   139C A5 57         [ 3]  637         lda     X0057
   139E C5 56         [ 3]  638         cmp     X0056
   13A0 D0 21         [ 4]  639         bne     L13C3
   13A2 E6 57         [ 5]  640         inc     X0057
   13A4 A5 57         [ 3]  641         lda     X0057
   13A6 C9 06         [ 2]  642         cmp     #0x06
   13A8 F0 14         [ 4]  643         beq     L13BE
   13AA C9 10         [ 2]  644         cmp     #0x10
   13AC F0 10         [ 4]  645         beq     L13BE
   13AE C9 1A         [ 2]  646         cmp     #0x1A
   13B0 D0 11         [ 4]  647         bne     L13C3
   13B2 A9 02         [ 2]  648         lda     #0x02
   13B4 85 57         [ 3]  649         sta     X0057
   13B6 A9 02         [ 2]  650         lda     #0x02
   13B8 8D 80 02      [ 4]  651         sta     U19_PORTA
   13BB 4C 11 12      [ 3]  652         jmp     L1211
                            653 ;
   13BE                     654 L13BE:
   13BE 18            [ 2]  655         clc
   13BF 69 06         [ 2]  656         adc     #0x06
   13C1 85 57         [ 3]  657         sta     X0057
   13C3                     658 L13C3:
   13C3 E6 56         [ 5]  659         inc     X0056
   13C5 20 D7 14      [ 6]  660         jsr     L14D7
   13C8 4C 24 12      [ 3]  661         jmp     L1224
                            662 ;
   13CB                     663 L13CB:
   13CB AD 02 02      [ 4]  664         lda     U18_PORTB
   13CE 85 5C         [ 3]  665         sta     X005C
   13D0 29 0F         [ 2]  666         and     #0x0F
   13D2 85 5D         [ 3]  667         sta     X005D
   13D4 6A            [ 2]  668         ror     a
   13D5 90 04         [ 4]  669         bcc     L13DB
   13D7 A9 09         [ 2]  670         lda     #0x09
   13D9 D0 1F         [ 4]  671         bne     L13FA
   13DB                     672 L13DB:
   13DB 6A            [ 2]  673         ror     a
   13DC 90 13         [ 4]  674         bcc     L13F1
   13DE 18            [ 2]  675         clc
   13DF A9 06         [ 2]  676         lda     #0x06
   13E1 65 58         [ 3]  677         adc     X0058
   13E3 E6 58         [ 5]  678         inc     X0058
   13E5 A6 58         [ 3]  679         ldx     X0058
   13E7 E0 03         [ 2]  680         cpx     #0x03
   13E9 90 0F         [ 4]  681         bcc     L13FA
   13EB A2 00         [ 2]  682         ldx     #0x00
   13ED 86 58         [ 3]  683         stx     X0058
   13EF F0 09         [ 4]  684         beq     L13FA
   13F1                     685 L13F1:
   13F1 6A            [ 2]  686         ror     a
   13F2 90 04         [ 4]  687         bcc     L13F8
   13F4 A9 0B         [ 2]  688         lda     #0x0B
   13F6 D0 02         [ 4]  689         bne     L13FA
   13F8                     690 L13F8:
   13F8 A9 0A         [ 2]  691         lda     #0x0A
   13FA                     692 L13FA:
   13FA A6 57         [ 3]  693         ldx     X0057
   13FC E0 0E         [ 2]  694         cpx     #0x0E
   13FE 90 03         [ 4]  695         bcc     L1403
   1400 18            [ 2]  696         clc
   1401 69 0A         [ 2]  697         adc     #0x0A
   1403                     698 L1403:
   1403 85 56         [ 3]  699         sta     X0056
   1405                     700 L1405:
   1405 20 C7 14      [ 6]  701         jsr     L14C7
   1408 20 2C 15      [ 6]  702         jsr     L152C
   140B 20 AA 18      [ 6]  703         jsr     L18AA
   140E                     704 L140E:
   140E 20 39 19      [ 6]  705         jsr     L1939
   1411 20 CD 16      [ 6]  706         jsr     L16CD
   1414 A5 32         [ 3]  707         lda     X0032
   1416 C9 02         [ 2]  708         cmp     #0x02
   1418 F0 04         [ 4]  709         beq     L141E
   141A C9 01         [ 2]  710         cmp     #0x01
   141C F0 F0         [ 4]  711         beq     L140E
   141E                     712 L141E:
   141E A9 3C         [ 2]  713         lda     #0x3C
   1420 85 53         [ 3]  714         sta     X0053
   1422                     715 L1422:
   1422 A9 FA         [ 2]  716         lda     #0xFA
   1424 85 4C         [ 3]  717         sta     X004C
   1426                     718 L1426:
   1426 20 A9 15      [ 6]  719         jsr     L15A9
   1429 A5 5A         [ 3]  720         lda     X005A
   142B D0 15         [ 4]  721         bne     L1442
   142D A5 53         [ 3]  722         lda     X0053
   142F F0 22         [ 4]  723         beq     L1453
   1431 20 39 19      [ 6]  724         jsr     L1939
   1434 A5 4C         [ 3]  725         lda     X004C
   1436 D0 EE         [ 4]  726         bne     L1426
   1438 AD 02 02      [ 4]  727         lda     U18_PORTB
   143B 45 5D         [ 3]  728         eor     X005D
   143D 8D 02 02      [ 4]  729         sta     U18_PORTB
   1440 D0 E0         [ 4]  730         bne     L1422
   1442                     731 L1442:
   1442 20 39 19      [ 6]  732         jsr     L1939
   1445 20 A9 15      [ 6]  733         jsr     L15A9
   1448 A5 5A         [ 3]  734         lda     X005A
   144A D0 F6         [ 4]  735         bne     L1442
   144C AD 02 02      [ 4]  736         lda     U18_PORTB
   144F C5 5C         [ 3]  737         cmp     X005C
   1451 F0 03         [ 4]  738         beq     L1456
   1453                     739 L1453:
   1453 4C 28 12      [ 3]  740         jmp     L1228
                            741 ;
   1456                     742 L1456:
   1456 20 3F 17      [ 6]  743         jsr     L173F
   1459 E6 56         [ 5]  744         inc     X0056
   145B 20 D7 14      [ 6]  745         jsr     L14D7
   145E 4C 24 12      [ 3]  746         jmp     L1224
                            747 ;
   1461                     748 L1461:
   1461 AD 02 02      [ 4]  749         lda     U18_PORTB
   1464 85 5C         [ 3]  750         sta     X005C
   1466 29 0F         [ 2]  751         and     #0x0F
   1468 85 5D         [ 3]  752         sta     X005D
   146A 6A            [ 2]  753         ror     a
   146B 90 03         [ 4]  754         bcc     L1470
   146D 4C 8D 14      [ 3]  755         jmp     L148D
                            756 ;
   1470                     757 L1470:
   1470 6A            [ 2]  758         ror     a
   1471 90 03         [ 4]  759         bcc     L1476
   1473 4C 7F 14      [ 3]  760         jmp     L147F
                            761 ;
   1476                     762 L1476:
   1476 6A            [ 2]  763         ror     a
   1477 90 03         [ 4]  764         bcc     L147C
   1479 4C A9 14      [ 3]  765         jmp     L14A9
   147C                     766 L147C:
   147C 4C 9B 14      [ 3]  767         jmp     L149B
                            768 ;
   147F                     769 L147F:
   147F A9 42         [ 2]  770         lda     #0x42
   1481 85 4A         [ 3]  771         sta     X004A
   1483 A6 45         [ 3]  772         ldx     X0045
   1485 20 B7 14      [ 6]  773         jsr     L14B7
   1488 86 45         [ 3]  774         stx     X0045
   148A 4C 05 14      [ 3]  775         jmp     L1405
                            776 ;
   148D                     777 L148D:
   148D A9 43         [ 2]  778         lda     #0x43
   148F 85 4A         [ 3]  779         sta     X004A
   1491 A6 46         [ 3]  780         ldx     X0046
   1493 20 B7 14      [ 6]  781         jsr     L14B7
   1496 86 46         [ 3]  782         stx     X0046
   1498 4C 05 14      [ 3]  783         jmp     L1405
                            784 ;
   149B                     785 L149B:
   149B A9 53         [ 2]  786         lda     #0x53
   149D 85 4A         [ 3]  787         sta     X004A
   149F A6 47         [ 3]  788         ldx     X0047
   14A1 20 B7 14      [ 6]  789         jsr     L14B7
   14A4 86 47         [ 3]  790         stx     X0047
   14A6 4C 05 14      [ 3]  791         jmp     L1405
                            792 ;
   14A9                     793 L14A9:
   14A9 A9 49         [ 2]  794         lda     #0x49
   14AB 85 4A         [ 3]  795         sta     X004A
   14AD A6 48         [ 3]  796         ldx     X0048
   14AF 20 B7 14      [ 6]  797         jsr     L14B7
   14B2 86 48         [ 3]  798         stx     X0048
   14B4 4C 05 14      [ 3]  799         jmp     L1405
                            800 ;
   14B7                     801 L14B7:
   14B7 E8            [ 2]  802         inx
   14B8 E0 1F         [ 2]  803         cpx     #0x1F
   14BA D0 02         [ 4]  804         bne     L14BE
   14BC A2 02         [ 2]  805         ldx     #0x02
   14BE                     806 L14BE:
   14BE B5 70         [ 4]  807         lda     X0070,x
   14C0 C5 4A         [ 3]  808         cmp     X004A
   14C2 D0 F3         [ 4]  809         bne     L14B7
   14C4 86 56         [ 3]  810         stx     X0056
   14C6 60            [ 6]  811         rts
                            812 ;
   14C7                     813 L14C7:
   14C7 A5 56         [ 3]  814         lda     X0056
   14C9 C5 55         [ 3]  815         cmp     X0055
   14CB 90 06         [ 4]  816         bcc     L14D3
   14CD F0 03         [ 4]  817         beq     L14D2
   14CF 20 D7 14      [ 6]  818         jsr     L14D7
   14D2                     819 L14D2:
   14D2 60            [ 6]  820         rts
                            821 ;
   14D3                     822 L14D3:
   14D3 20 F0 14      [ 6]  823         jsr     L14F0
   14D6 60            [ 6]  824         rts
                            825 ;
   14D7                     826 L14D7:
   14D7 A9 20         [ 2]  827         lda     #0x20
   14D9 20 8C 15      [ 6]  828         jsr     L158C
   14DC 20 64 15      [ 6]  829         jsr     L1564
   14DF E6 55         [ 5]  830         inc     X0055
   14E1 A5 55         [ 3]  831         lda     X0055
   14E3 8D 82 02      [ 4]  832         sta     U19_PORTB
   14E6 A5 56         [ 3]  833         lda     X0056
   14E8 C5 55         [ 3]  834         cmp     X0055
   14EA D0 EB         [ 4]  835         bne     L14D7
   14EC 20 0B 15      [ 6]  836         jsr     L150B
   14EF 60            [ 6]  837         rts
                            838 ;
   14F0                     839 L14F0:
   14F0 E6 55         [ 5]  840         inc     X0055
   14F2                     841 L14F2:
   14F2 A9 40         [ 2]  842         lda     #0x40
   14F4 20 8C 15      [ 6]  843         jsr     L158C
   14F7 20 64 15      [ 6]  844         jsr     L1564
   14FA C6 55         [ 5]  845         dec     X0055
   14FC A5 55         [ 3]  846         lda     X0055
   14FE 8D 82 02      [ 4]  847         sta     U19_PORTB
   1501 A5 56         [ 3]  848         lda     X0056
   1503 C5 55         [ 3]  849         cmp     X0055
   1505 D0 EB         [ 4]  850         bne     L14F2
   1507 20 1E 15      [ 6]  851         jsr     L151E
   150A 60            [ 6]  852         rts
                            853 ;
   150B                     854 L150B:
   150B A9 40         [ 2]  855         lda     #0x40
   150D 20 8C 15      [ 6]  856         jsr     L158C
   1510 20 64 15      [ 6]  857         jsr     L1564
   1513 A9 03         [ 2]  858         lda     #0x03
   1515 85 4F         [ 3]  859         sta     X004F
   1517                     860 L1517:
   1517 20 39 19      [ 6]  861         jsr     L1939
   151A A5 4F         [ 3]  862         lda     X004F
   151C D0 F9         [ 4]  863         bne     L1517
   151E                     864 L151E:
   151E A9 20         [ 2]  865         lda     #0x20
   1520 20 8C 15      [ 6]  866         jsr     L158C
   1523 20 64 15      [ 6]  867         jsr     L1564
   1526 A9 10         [ 2]  868         lda     #0x10
   1528 20 8C 15      [ 6]  869         jsr     L158C
   152B 60            [ 6]  870         rts
                            871 ;
   152C                     872 L152C:
   152C A5 6B         [ 3]  873         lda     X006B
   152E 30 33         [ 4]  874         bmi     L1563
   1530 A9 80         [ 2]  875         lda     #0x80
   1532 20 8C 15      [ 6]  876         jsr     L158C
   1535 A9 FA         [ 2]  877         lda     #0xFA
   1537 85 4B         [ 3]  878         sta     X004B
   1539                     879 L1539:
   1539 20 39 19      [ 6]  880         jsr     L1939
   153C A5 4B         [ 3]  881         lda     X004B
   153E D0 F9         [ 4]  882         bne     L1539
   1540                     883 L1540:
   1540 20 39 19      [ 6]  884         jsr     L1939
   1543 AD 02 03      [ 4]  885         lda     transport_periph$ddr_reg_b
   1546 6A            [ 2]  886         ror     a
   1547 90 F7         [ 4]  887         bcc     L1540
   1549 A9 A0         [ 2]  888         lda     #0xA0
   154B 85 4B         [ 3]  889         sta     X004B
   154D                     890 L154D:
   154D AD 02 03      [ 4]  891         lda     transport_periph$ddr_reg_b
   1550 6A            [ 2]  892         ror     a
   1551 90 E6         [ 4]  893         bcc     L1539
   1553 20 39 19      [ 6]  894         jsr     L1939
   1556 A5 4B         [ 3]  895         lda     X004B
   1558 D0 F3         [ 4]  896         bne     L154D
   155A A9 10         [ 2]  897         lda     #0x10
   155C 20 8C 15      [ 6]  898         jsr     L158C
   155F A9 80         [ 2]  899         lda     #0x80
   1561 85 6B         [ 3]  900         sta     X006B
   1563                     901 L1563:
   1563 60            [ 6]  902         rts
                            903 ;
   1564                     904 L1564:
   1564 A5 55         [ 3]  905         lda     X0055
   1566 8D 82 02      [ 4]  906         sta     U19_PORTB
   1569                     907 L1569:
   1569 A9 00         [ 2]  908         lda     #0x00
   156B 85 59         [ 3]  909         sta     X0059
   156D                     910 L156D:
   156D AD 02 03      [ 4]  911         lda     transport_periph$ddr_reg_b
   1570 A9 14         [ 2]  912         lda     #0x14
   1572 85 4B         [ 3]  913         sta     X004B
   1574 E6 59         [ 5]  914         inc     X0059
   1576 A5 59         [ 3]  915         lda     X0059
   1578 C9 21         [ 2]  916         cmp     #0x21
   157A B0 0F         [ 4]  917         bcs     L158B
   157C                     918 L157C:
   157C 20 39 19      [ 6]  919         jsr     L1939
   157F A5 4B         [ 3]  920         lda     X004B
   1581 F0 E6         [ 4]  921         beq     L1569
   1583 AD 03 03      [ 4]  922         lda     transport_control_reg_b
   1586 10 F4         [ 4]  923         bpl     L157C
   1588 4C 6D 15      [ 3]  924         jmp     L156D
   158B                     925 L158B:
   158B 60            [ 6]  926         rts
                            927 ;
   158C                     928 L158C:
   158C 8D 02 03      [ 4]  929         sta     transport_periph$ddr_reg_b
   158F A9 FA         [ 2]  930         lda     #0xFA
   1591 85 4B         [ 3]  931         sta     X004B
   1593                     932 L1593:
   1593 20 39 19      [ 6]  933         jsr     L1939
   1596 A5 4B         [ 3]  934         lda     X004B
   1598 D0 F9         [ 4]  935         bne     L1593
   159A AD 02 03      [ 4]  936         lda     transport_periph$ddr_reg_b
   159D 29 60         [ 2]  937         and     #0x60
   159F D0 07         [ 4]  938         bne     L15A8
   15A1 A9 00         [ 2]  939         lda     #0x00
   15A3 8D 02 03      [ 4]  940         sta     transport_periph$ddr_reg_b
   15A6 85 6B         [ 3]  941         sta     X006B
   15A8                     942 L15A8:
   15A8 60            [ 6]  943         rts
                            944 ;
   15A9                     945 L15A9:
   15A9 A5 5A         [ 3]  946         lda     X005A
   15AB D0 29         [ 4]  947         bne     L15D6
   15AD AD 00 02      [ 4]  948         lda     U18_PORTA
   15B0 49 FF         [ 2]  949         eor     #0xFF
   15B2 F0 21         [ 4]  950         beq     L15D5
   15B4 85 5B         [ 3]  951         sta     X005B
   15B6 10 09         [ 4]  952         bpl     L15C1
   15B8 4D 02 02      [ 4]  953         eor     U18_PORTB
   15BB 8D 02 02      [ 4]  954         sta     U18_PORTB
   15BE 4C CD 15      [ 3]  955         jmp     L15CD
                            956 ;
   15C1                     957 L15C1:
   15C1 AD 02 02      [ 4]  958         lda     U18_PORTB
   15C4 29 80         [ 2]  959         and     #0x80
   15C6 F0 0D         [ 4]  960         beq     L15D5
   15C8 05 5B         [ 3]  961         ora     X005B
   15CA 8D 02 02      [ 4]  962         sta     U18_PORTB
   15CD                     963 L15CD:
   15CD A9 80         [ 2]  964         lda     #0x80
   15CF 85 5A         [ 3]  965         sta     X005A
   15D1 A9 14         [ 2]  966         lda     #0x14
   15D3 85 4B         [ 3]  967         sta     X004B
   15D5                     968 L15D5:
   15D5 60            [ 6]  969         rts
                            970 ;
   15D6                     971 L15D6:
   15D6 A5 5A         [ 3]  972         lda     X005A
   15D8 2A            [ 2]  973         rol     a
   15D9 90 09         [ 4]  974         bcc     L15E4
   15DB A5 4B         [ 3]  975         lda     X004B
   15DD D0 20         [ 4]  976         bne     L15FF
   15DF A9 40         [ 2]  977         lda     #0x40
   15E1 85 5A         [ 3]  978         sta     X005A
   15E3 60            [ 6]  979         rts
                            980 ;
   15E4                     981 L15E4:
   15E4 2A            [ 2]  982         rol     a
   15E5 90 10         [ 4]  983         bcc     L15F7
   15E7 AD 00 02      [ 4]  984         lda     U18_PORTA
   15EA 49 FF         [ 2]  985         eor     #0xFF
   15EC D0 11         [ 4]  986         bne     L15FF
   15EE A9 20         [ 2]  987         lda     #0x20
   15F0 85 5A         [ 3]  988         sta     X005A
   15F2 A9 14         [ 2]  989         lda     #0x14
   15F4 85 4B         [ 3]  990         sta     X004B
   15F6 60            [ 6]  991         rts
                            992 ;
   15F7                     993 L15F7:
   15F7 A5 4B         [ 3]  994         lda     X004B
   15F9 D0 04         [ 4]  995         bne     L15FF
   15FB A9 00         [ 2]  996         lda     #0x00
   15FD 85 5A         [ 3]  997         sta     X005A
   15FF                     998 L15FF:
   15FF 60            [ 6]  999         rts
                           1000 ;
                           1001 ;       AGC audio stuff
                           1002 ;
   1600                    1003 L1600:
   1600 AD 80 02      [ 4] 1004         lda     U19_PORTA
   1603 49 FF         [ 2] 1005         eor     #0xFF
   1605 4A            [ 2] 1006         lsr     a
   1606 4A            [ 2] 1007         lsr     a
   1607 4A            [ 2] 1008         lsr     a
   1608 4A            [ 2] 1009         lsr     a
   1609 18            [ 2] 1010         clc
   160A 65 5E         [ 3] 1011         adc     X005E
   160C AA            [ 2] 1012         tax
   160D BD 88 16      [ 5] 1013         lda     X1688,x
   1610 85 62         [ 3] 1014         sta     X0062
   1612 A5 4D         [ 3] 1015         lda     X004D
   1614 D0 16         [ 4] 1016         bne     L162C
   1616 A9 0A         [ 2] 1017         lda     #0x0A
   1618 85 4D         [ 3] 1018         sta     X004D
   161A A5 62         [ 3] 1019         lda     X0062
   161C CD 82 03      [ 4] 1020         cmp     audio_periph$ddr_reg_b
   161F 90 08         [ 4] 1021         bcc     L1629
   1621 F0 09         [ 4] 1022         beq     L162C
   1623 EE 82 03      [ 6] 1023         inc     audio_periph$ddr_reg_b
   1626 4C 2C 16      [ 3] 1024         jmp     L162C
                           1025 ;
   1629                    1026 L1629:
   1629 CE 82 03      [ 6] 1027         dec     audio_periph$ddr_reg_b
   162C                    1028 L162C:
   162C AD 82 03      [ 4] 1029         lda     audio_periph$ddr_reg_b
   162F 8D 82 02      [ 4] 1030         sta     U19_PORTB
   1632 60            [ 6] 1031         rts
                           1032 ;
   1633                    1033 L1633:
   1633 A5 63         [ 3] 1034         lda     X0063
   1635 D0 15         [ 4] 1035         bne     L164C
   1637 A9 7F         [ 2] 1036         lda     #0x7F
   1639 85 63         [ 3] 1037         sta     X0063
   163B 20 B5 18      [ 6] 1038         jsr     L18B5
   163E A9 0A         [ 2] 1039         lda     #0x0A
   1640 85 51         [ 3] 1040         sta     X0051
   1642 A5 5E         [ 3] 1041         lda     X005E
   1644 85 5F         [ 3] 1042         sta     X005F
   1646 A9 00         [ 2] 1043         lda     #0x00
   1648 85 61         [ 3] 1044         sta     X0061
   164A 85 60         [ 3] 1045         sta     X0060
   164C                    1046 L164C:
   164C A5 51         [ 3] 1047         lda     X0051
   164E D0 1C         [ 4] 1048         bne     L166C
   1650 A9 0A         [ 2] 1049         lda     #0x0A
   1652 85 51         [ 3] 1050         sta     X0051
   1654 A5 60         [ 3] 1051         lda     X0060
   1656 C9 08         [ 2] 1052         cmp     #0x08
   1658 F0 13         [ 4] 1053         beq     L166D
   165A E6 60         [ 5] 1054         inc     X0060
   165C A2 09         [ 2] 1055         ldx     #0x09
   165E 38            [ 2] 1056         sec
   165F AD 80 03      [ 4] 1057         lda     audio_periph$ddr_reg_a
   1662                    1058 L1662:
   1662 2A            [ 2] 1059         rol     a
   1663 CA            [ 2] 1060         dex
   1664 90 FC         [ 4] 1061         bcc     L1662
   1666 18            [ 2] 1062         clc
   1667 8A            [ 2] 1063         txa
   1668 65 61         [ 3] 1064         adc     X0061
   166A 85 61         [ 3] 1065         sta     X0061
   166C                    1066 L166C:
   166C 60            [ 6] 1067         rts
                           1068 ;
   166D                    1069 L166D:
   166D 46 61         [ 5] 1070         lsr     X0061
   166F 46 61         [ 5] 1071         lsr     X0061
   1671 46 61         [ 5] 1072         lsr     X0061
   1673 A5 61         [ 3] 1073         lda     X0061
   1675 18            [ 2] 1074         clc
   1676 65 5F         [ 3] 1075         adc     X005F
   1678 4A            [ 2] 1076         lsr     a
   1679 85 5E         [ 3] 1077         sta     X005E
   167B A9 00         [ 2] 1078         lda     #0x00
   167D 85 61         [ 3] 1079         sta     X0061
   167F 85 60         [ 3] 1080         sta     X0060
   1681 A9 FF         [ 2] 1081         lda     #0xFF
   1683 85 63         [ 3] 1082         sta     X0063
   1685 4C AA 18      [ 3] 1083         jmp     L18AA
                           1084 ;
                           1085 ;   AGC Mic table
                           1086 ;
   1688                    1087 X1688:
   1688 03 04 06 08        1088         .db     0x03, 0x04, 0x06, 0x08
   168C 10 16 20 2D        1089         .db     0x10, 0x16, 0x20, 0x2D
   1690 40 5A 80 BF        1090         .db     0x40, 0x5A, 0x80, 0xBF
   1694 FF FF FF FF        1091         .db     0xFF, 0xFF, 0xFF, 0xFF
   1698 FF                 1092         .db     0xFF
                           1093 ;
   1699                    1094 L1699:
   1699 A2 00         [ 2] 1095         ldx     #0x00
   169B                    1096 L169B:
   169B A9 30         [ 2] 1097         lda     #0x30
   169D 95 81         [ 4] 1098         sta     board_1_control_reg_a,x
   169F 95 83         [ 4] 1099         sta     board_1_control_reg_b,x
   16A1 A9 FF         [ 2] 1100         lda     #0xFF
   16A3 95 80         [ 4] 1101         sta     board_1_periph$ddr_reg_a,x
   16A5 95 82         [ 4] 1102         sta     board_1_periph$ddr_reg_b,x
   16A7 A9 34         [ 2] 1103         lda     #0x34
   16A9 95 81         [ 4] 1104         sta     board_1_control_reg_a,x
   16AB 95 83         [ 4] 1105         sta     board_1_control_reg_b,x
   16AD A9 00         [ 2] 1106         lda     #0x00
   16AF 95 80         [ 4] 1107         sta     board_1_periph$ddr_reg_a,x
   16B1 95 82         [ 4] 1108         sta     board_1_periph$ddr_reg_b,x
   16B3 E8            [ 2] 1109         inx
   16B4 E8            [ 2] 1110         inx
   16B5 E8            [ 2] 1111         inx
   16B6 E8            [ 2] 1112         inx
   16B7 E0 20         [ 2] 1113         cpx     #0x20
   16B9 90 E0         [ 4] 1114         bcc     L169B
   16BB A9 24         [ 2] 1115         lda     #0x24
   16BD 85 64         [ 3] 1116         sta     X0064
   16BF A9 00         [ 2] 1117         lda     #0x00
   16C1 85 67         [ 3] 1118         sta     X0067
   16C3 85 69         [ 3] 1119         sta     X0069
   16C5 85 6A         [ 3] 1120         sta     X006A
   16C7 AD 00 03      [ 4] 1121         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   16CA A0 00         [ 2] 1122         ldy     #0x00
   16CC 60            [ 6] 1123         rts
                           1124 ;
   16CD                    1125 L16CD:
   16CD A9 00         [ 2] 1126         lda     #0x00
   16CF 85 33         [ 3] 1127         sta     X0033
   16D1 A9 02         [ 2] 1128         lda     #0x02
   16D3 85 4F         [ 3] 1129         sta     X004F
   16D5                    1130 L16D5:
   16D5 AD 02 01      [ 4] 1131         lda     X0102
   16D8 29 05         [ 2] 1132         and     #0x05
   16DA F0 1F         [ 4] 1133         beq     L16FB
   16DC A5 33         [ 3] 1134         lda     X0033
   16DE D0 0C         [ 4] 1135         bne     L16EC
   16E0 AD 01 01      [ 4] 1136         lda     X0101
   16E3 C9 4D         [ 2] 1137         cmp     #0x4D
   16E5 D0 14         [ 4] 1138         bne     L16FB
   16E7 E6 33         [ 5] 1139         inc     X0033
   16E9 4C FB 16      [ 3] 1140         jmp     L16FB
                           1141 ;
   16EC                    1142 L16EC:
   16EC A9 00         [ 2] 1143         lda     #0x00
   16EE 85 33         [ 3] 1144         sta     X0033
   16F0 AD 01 01      [ 4] 1145         lda     X0101
   16F3 C9 31         [ 2] 1146         cmp     #0x31
   16F5 F0 10         [ 4] 1147         beq     L1707
   16F7 C9 32         [ 2] 1148         cmp     #0x32
   16F9 F0 10         [ 4] 1149         beq     L170B
   16FB                    1150 L16FB:
   16FB 20 39 19      [ 6] 1151         jsr     L1939
   16FE A5 4F         [ 3] 1152         lda     X004F
   1700 D0 D3         [ 4] 1153         bne     L16D5
   1702 A9 00         [ 2] 1154         lda     #0x00
   1704                    1155 L1704:
   1704 85 32         [ 3] 1156         sta     X0032
   1706 60            [ 6] 1157         rts
                           1158 ;
   1707                    1159 L1707:
   1707 A9 01         [ 2] 1160         lda     #0x01
   1709 D0 F9         [ 4] 1161         bne     L1704
   170B                    1162 L170B:
   170B A9 02         [ 2] 1163         lda     #0x02
   170D D0 F5         [ 4] 1164         bne     L1704
   170F                    1165 L170F:
   170F 48            [ 3] 1166         pha
   1710 A9 02         [ 2] 1167         lda     #0x02
   1712 85 4F         [ 3] 1168         sta     X004F
   1714 A9 04         [ 2] 1169         lda     #0x04
   1716 85 30         [ 3] 1170         sta     X0030
   1718 68            [ 4] 1171         pla
   1719                    1172 L1719:
   1719 48            [ 3] 1173         pha
   171A 20 39 19      [ 6] 1174         jsr     L1939
   171D A9 53         [ 2] 1175         lda     #0x53
   171F 20 2B 17      [ 6] 1176         jsr     L172B
   1722 68            [ 4] 1177         pla
   1723 20 2B 17      [ 6] 1178         jsr     L172B
   1726 C6 30         [ 5] 1179         dec     X0030
   1728 D0 EF         [ 4] 1180         bne     L1719
   172A 60            [ 6] 1181         rts
                           1182 ;
   172B                    1183 L172B:
   172B 48            [ 3] 1184         pha
   172C                    1185 L172C:
   172C 20 39 19      [ 6] 1186         jsr     L1939
   172F A5 4F         [ 3] 1187         lda     X004F
   1731 F0 07         [ 4] 1188         beq     L173A
   1733 AD 02 01      [ 4] 1189         lda     X0102
   1736 29 02         [ 2] 1190         and     #0x02
   1738 F0 F2         [ 4] 1191         beq     L172C
   173A                    1192 L173A:
   173A 68            [ 4] 1193         pla
   173B 8D 01 01      [ 4] 1194         sta     X0101
   173E 60            [ 6] 1195         rts
                           1196 ;
   173F                    1197 L173F:
   173F A9 80         [ 2] 1198         lda     #0x80
   1741 20 8C 15      [ 6] 1199         jsr     L158C
   1744 20 8C 15      [ 6] 1200         jsr     L158C
   1747                    1201 L1747:
   1747 AD 01 03      [ 4] 1202         lda     transport_control_reg_a             ; Wait for Transport Byte
   174A 0A            [ 2] 1203         asl     a
   174B 90 FA         [ 4] 1204         bcc     L1747
   174D AD 00 03      [ 4] 1205         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   1750 29 7F         [ 2] 1206         and     #0x7F
   1752 C9 24         [ 2] 1207         cmp     #0x24                               ; 0x24 code
   1754 D0 F1         [ 4] 1208         bne     L1747
   1756                    1209 L1756:
   1756 AD 01 03      [ 4] 1210         lda     transport_control_reg_a             ; Wait for Transport Byte
   1759 0A            [ 2] 1211         asl     a
   175A 90 FA         [ 4] 1212         bcc     L1756
   175C AD 00 03      [ 4] 1213         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   175F 29 7F         [ 2] 1214         and     #0x7F
   1761 C9 24         [ 2] 1215         cmp     #0x24                               ; 0x24 code
   1763 F0 F1         [ 4] 1216         beq     L1756
   1765 29 3F         [ 2] 1217         and     #0x3F
   1767 C5 56         [ 3] 1218         cmp     X0056
   1769 F0 03         [ 4] 1219         beq     L176E
   176B 4C 66 10      [ 3] 1220         jmp     RESET
                           1221 ;
   176E                    1222 L176E:
   176E 20 99 16      [ 6] 1223         jsr     L1699
   1771 20 9F 18      [ 6] 1224         jsr     L189F
   1774 A9 41         [ 2] 1225         lda     #0x41
   1776 85 92         [ 3] 1226         sta     board_5_periph$ddr_reg_b
   1778                    1227 L1778:
   1778 AD 01 03      [ 4] 1228         lda     transport_control_reg_a             ; Wait for Transport Byte
   177B 0A            [ 2] 1229         asl     a
   177C 90 11         [ 4] 1230         bcc     L178F
   177E AD 00 03      [ 4] 1231         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   1781 29 7F         [ 2] 1232         and     #0x7F
   1783 85 65         [ 3] 1233         sta     X0065                               ; First byte into 0065
   1785 C9 22         [ 2] 1234         cmp     #0x22
   1787 90 EF         [ 4] 1235         bcc     L1778                               ; ignore if < 0x22
   1789 C9 40         [ 2] 1236         cmp     #0x40
   178B B0 05         [ 4] 1237         bcs     L1792                               ; jump if >= 0x40
   178D 85 64         [ 3] 1238         sta     X0064                               ; put it here if it's >= 0x22 and < 0x40
   178F                    1239 L178F:
   178F 4C 1A 18      [ 3] 1240         jmp     L181A
                           1241 ;
   1792                    1242 L1792:
   1792 A5 64         [ 3] 1243         lda     X0064                               ; read the last command byte
   1794 29 7E         [ 2] 1244         and     #0x7E
   1796 38            [ 2] 1245         sec
   1797 E9 22         [ 2] 1246         sbc     #0x22
   1799 AA            [ 2] 1247         tax
   179A BD 93 1D      [ 5] 1248         lda     X1D93,x
   179D 85 6C         [ 3] 1249         sta     X006C
   179F BD 94 1D      [ 5] 1250         lda     X1D93+1,x
   17A2 85 6D         [ 3] 1251         sta     X006D
   17A4 20 AA 17      [ 6] 1252         jsr     L17AA
   17A7 4C 78 17      [ 3] 1253         jmp     L1778
   17AA                    1254 L17AA:
   17AA 6C 6C 00      [ 5] 1255         jmp     [X006C]                              ;INFO: indirect jump
                           1256 ;
                           1257 ;       Decode command byte in 0064 and channel byte in 0065
                           1258 ;       to a command offset in 0066 and bit mask in 0068, return with carry clear
                           1259 ;
   17AD                    1260 L17AD:
   17AD A5 64         [ 3] 1261         lda     X0064                               ; read the last command byte?
   17AF                    1262 L17AF:
   17AF 38            [ 2] 1263         sec
   17B0 E9 26         [ 2] 1264         sbc     #0x26
   17B2 4A            [ 2] 1265         lsr     a
   17B3 A8            [ 2] 1266         tay
   17B4 B9 B2 1D      [ 5] 1267         lda     X1DB2,y
   17B7 85 66         [ 3] 1268         sta     X0066                               ; table value goes here
   17B9 98            [ 2] 1269         tya
   17BA 0A            [ 2] 1270         asl     a
   17BB 0A            [ 2] 1271         asl     a
   17BC 0A            [ 2] 1272         asl     a
   17BD A8            [ 2] 1273         tay                                         ; times 8
   17BE A9 01         [ 2] 1274         lda     #0x01
   17C0 85 68         [ 3] 1275         sta     X0068                               ; set bit 0 here
   17C2 A5 65         [ 3] 1276         lda     X0065                               ; get current byte
   17C4                    1277 L17C4:
   17C4 D9 04 1E      [ 5] 1278         cmp     X1E04,y
   17C7 F0 07         [ 4] 1279         beq     L17D0
   17C9 C8            [ 2] 1280         iny
   17CA 06 68         [ 5] 1281         asl     X0068                               ; now X0068 has the right bit
   17CC 90 F6         [ 4] 1282         bcc     L17C4
   17CE 18            [ 2] 1283         clc                                         ; code not found, return
   17CF 60            [ 6] 1284         rts
                           1285 ;
   17D0                    1286 L17D0:
   17D0 A0 00         [ 2] 1287         ldy     #0x00
   17D2 A5 64         [ 3] 1288         lda     X0064
   17D4 4A            [ 2] 1289         lsr     a                                   ; get bottom bit on/off into carry
   17D5 A5 68         [ 3] 1290         lda     X0068                               ; get bitmask
   17D7 B0 08         [ 4] 1291         bcs     L17E1                               ; if on, jump ahead
   17D9 49 FF         [ 2] 1292         eor     #0xFF
   17DB 31 66         [ 6] 1293         and     [X0066],y
   17DD                    1294 L17DD:
   17DD 91 66         [ 6] 1295         sta     [X0066],y                           ; set bit in 0066
   17DF 38            [ 2] 1296         sec                                         ; code found
   17E0 60            [ 6] 1297         rts
                           1298 ;
   17E1                    1299 L17E1:
   17E1 11 66         [ 6] 1300         ora     [X0066],y
   17E3 4C DD 17      [ 3] 1301         jmp     L17DD
                           1302 ;
                           1303 ;       Act like call to L17AD, but if code not found, act like a you got a 0028
                           1304 ;
   17E6                    1305 L17E6:
   17E6 20 AD 17      [ 6] 1306         jsr     L17AD
   17E9 90 01         [ 4] 1307         bcc     L17EC
   17EB 60            [ 6] 1308         rts
                           1309 ;
   17EC                    1310 L17EC:
   17EC A9 28         [ 2] 1311         lda     #0x28
   17EE 4C AF 17      [ 3] 1312         jmp     L17AF
                           1313 ;
   17F1                    1314 L17F1:
   17F1 A5 65         [ 3] 1315         lda     X0065
   17F3 C9 40         [ 2] 1316         cmp     #0x40
   17F5 90 16         [ 4] 1317         bcc     L180D
   17F7 C9 60         [ 2] 1318         cmp     #0x60
   17F9 B0 12         [ 4] 1319         bcs     L180D
   17FB 38            [ 2] 1320         sec
   17FC E9 40         [ 2] 1321         sbc     #0x40
   17FE 0A            [ 2] 1322         asl     a
   17FF A8            [ 2] 1323         tay
   1800 B9 C2 1D      [ 5] 1324         lda     X1DC2,y
   1803 85 66         [ 3] 1325         sta     X0066
   1805 B9 C3 1D      [ 5] 1326         lda     X1DC2+1,y
   1808 85 68         [ 3] 1327         sta     X0068
   180A 4C D0 17      [ 3] 1328         jmp     L17D0
   180D                    1329 L180D:
   180D 60            [ 6] 1330         rts
                           1331 ;
                           1332 ;       Act like call to L17AD, but if code not found, act like a you got a 0030
                           1333 ;
   180E                    1334 L180E:
   180E 20 AD 17      [ 6] 1335         jsr     L17AD
   1811 B0 05         [ 4] 1336         bcs     L1818
   1813 A9 30         [ 2] 1337         lda     #0x30
   1815 20 AF 17      [ 6] 1338         jsr     L17AF
   1818                    1339 L1818:
   1818 60            [ 6] 1340         rts
                           1341 ;
   1819                    1342 L1819:
   1819 60            [ 6] 1343         rts
                           1344 ;
   181A                    1345 L181A:
   181A AD 05 02      [ 4] 1346         lda     U18_edge_detect_control_DI_pos
   181D 30 03         [ 4] 1347         bmi     L1822
   181F 4C 78 17      [ 3] 1348         jmp     L1778
                           1349 ;
   1822                    1350 L1822:
   1822 20 00 16      [ 6] 1351         jsr     L1600
   1825 AD 02 03      [ 4] 1352         lda     transport_periph$ddr_reg_b
   1828 4A            [ 2] 1353         lsr     a
   1829 90 04         [ 4] 1354         bcc     L182F
   182B A9 06         [ 2] 1355         lda     #0x06
   182D 85 4B         [ 3] 1356         sta     X004B
   182F                    1357 L182F:
   182F A5 4B         [ 3] 1358         lda     X004B
   1831 F0 07         [ 4] 1359         beq     L183A
   1833 AD 00 02      [ 4] 1360         lda     U18_PORTA
   1836 29 40         [ 2] 1361         and     #0x40
   1838 D0 0E         [ 4] 1362         bne     L1848
   183A                    1363 L183A:
   183A 20 99 16      [ 6] 1364         jsr     L1699
   183D 20 FC 18      [ 6] 1365         jsr     L18FC
   1840 20 B5 18      [ 6] 1366         jsr     L18B5
   1843 A9 00         [ 2] 1367         lda     #0x00
   1845 85 63         [ 3] 1368         sta     X0063
   1847 60            [ 6] 1369         rts
                           1370 ;
   1848                    1371 L1848:
   1848 A5 6A         [ 3] 1372         lda     X006A
   184A AA            [ 2] 1373         tax
   184B 29 04         [ 2] 1374         and     #0x04
   184D F0 10         [ 4] 1375         beq     L185F
   184F A5 4C         [ 3] 1376         lda     X004C
   1851 C9 2B         [ 2] 1377         cmp     #0x2B
   1853 B0 15         [ 4] 1378         bcs     L186A
   1855 C9 00         [ 2] 1379         cmp     #0x00
   1857 F0 0A         [ 4] 1380         beq     L1863
   1859 8A            [ 2] 1381         txa
   185A 29 FB         [ 2] 1382         and     #0xFB
   185C 4C 68 18      [ 3] 1383         jmp     L1868
                           1384 ;
   185F                    1385 L185F:
   185F A9 64         [ 2] 1386         lda     #0x64
   1861 85 4F         [ 3] 1387         sta     X004F
   1863                    1388 L1863:
   1863 A9 3C         [ 2] 1389         lda     #0x3C
   1865 85 4C         [ 3] 1390         sta     X004C
   1867 8A            [ 2] 1391         txa
   1868                    1392 L1868:
   1868 85 94         [ 3] 1393         sta     board_6_periph$ddr_reg_a
   186A                    1394 L186A:
   186A A5 6A         [ 3] 1395         lda     X006A
   186C 29 04         [ 2] 1396         and     #0x04
   186E F0 0A         [ 4] 1397         beq     L187A
   1870 A5 4F         [ 3] 1398         lda     X004F
   1872 D0 06         [ 4] 1399         bne     L187A
   1874 A5 6A         [ 3] 1400         lda     X006A
   1876 29 FB         [ 2] 1401         and     #0xFB
   1878 85 6A         [ 3] 1402         sta     X006A
   187A                    1403 L187A:
   187A A5 69         [ 3] 1404         lda     X0069
   187C 29 3E         [ 2] 1405         and     #0x3E
   187E 85 68         [ 3] 1406         sta     X0068
   1880 D0 04         [ 4] 1407         bne     L1886
   1882                    1408 L1882:
   1882 A9 0C         [ 2] 1409         lda     #0x0C
   1884 85 50         [ 3] 1410         sta     X0050
   1886                    1411 L1886:
   1886 A5 50         [ 3] 1412         lda     X0050
   1888 C9 07         [ 2] 1413         cmp     #0x07
   188A B0 08         [ 4] 1414         bcs     L1894
   188C C9 00         [ 2] 1415         cmp     #0x00
   188E F0 F2         [ 4] 1416         beq     L1882
   1890 A9 00         [ 2] 1417         lda     #0x00
   1892 85 68         [ 3] 1418         sta     X0068
   1894                    1419 L1894:
   1894 A5 92         [ 3] 1420         lda     board_5_periph$ddr_reg_b
   1896 29 C1         [ 2] 1421         and     #0xC1
   1898 05 68         [ 3] 1422         ora     X0068
   189A 85 92         [ 3] 1423         sta     board_5_periph$ddr_reg_b
   189C 4C 78 17      [ 3] 1424         jmp     L1778
                           1425 ;
   189F                    1426 L189F:
   189F A9 34         [ 2] 1427         lda     #0x34
   18A1 48            [ 3] 1428         pha
   18A2 A9 40         [ 2] 1429         lda     #0x40
   18A4 A0 34         [ 2] 1430         ldy     #0x34
   18A6 A2 3C         [ 2] 1431         ldx     #0x3C
   18A8 D0 14         [ 4] 1432         bne     L18BE
   18AA                    1433 L18AA:
   18AA A9 34         [ 2] 1434         lda     #0x34
   18AC 48            [ 3] 1435         pha
   18AD A9 00         [ 2] 1436         lda     #0x00
   18AF A0 3C         [ 2] 1437         ldy     #0x3C
   18B1 A2 34         [ 2] 1438         ldx     #0x34
   18B3 D0 09         [ 4] 1439         bne     L18BE
   18B5                    1440 L18B5:
   18B5 A9 3C         [ 2] 1441         lda     #0x3C
   18B7 48            [ 3] 1442         pha
   18B8 A9 00         [ 2] 1443         lda     #0x00
   18BA A0 3C         [ 2] 1444         ldy     #0x3C
   18BC A2 3C         [ 2] 1445         ldx     #0x3C
   18BE                    1446 L18BE:
   18BE 8E 81 03      [ 4] 1447         stx     audio_control_reg_a
   18C1 8C 83 03      [ 4] 1448         sty     audio_control_reg_b
   18C4 A2 00         [ 2] 1449         ldx     #0x00
   18C6 20 D0 18      [ 6] 1450         jsr     L18D0
   18C9 68            [ 4] 1451         pla
   18CA A2 01         [ 2] 1452         ldx     #0x01
   18CC 20 D0 18      [ 6] 1453         jsr     L18D0
   18CF 60            [ 6] 1454         rts
                           1455 ;
   18D0                    1456 L18D0:
   18D0 95 82         [ 4] 1457         sta     board_1_periph$ddr_reg_b,x
   18D2 E8            [ 2] 1458         inx
   18D3 E8            [ 2] 1459         inx
   18D4 E8            [ 2] 1460         inx
   18D5 E8            [ 2] 1461         inx
   18D6 E0 17         [ 2] 1462         cpx     #0x17
   18D8 90 F6         [ 4] 1463         bcc     L18D0
   18DA 60            [ 6] 1464         rts
                           1465 ;
                           1466 ;       Act like call to L17AD, but if code not found, act like a you got a 002C
                           1467 ;
   18DB                    1468 L18DB:
   18DB 20 AD 17      [ 6] 1469         jsr     L17AD
   18DE 90 01         [ 4] 1470         bcc     L18E1
   18E0 60            [ 6] 1471         rts
                           1472 ;
   18E1                    1473 L18E1:
   18E1 A9 2C         [ 2] 1474         lda     #0x2C
   18E3 4C AF 17      [ 3] 1475         jmp     L17AF
                           1476 ;
                           1477 ;       Act like call to L17AD, but if code not found, act like a you got a 002E
                           1478 ;
   18E6                    1479 L18E6:
   18E6 20 AD 17      [ 6] 1480         jsr     L17AD
   18E9 90 01         [ 4] 1481         bcc     L18EC
   18EB 60            [ 6] 1482         rts
                           1483 ;
   18EC                    1484 L18EC:
   18EC A9 2E         [ 2] 1485         lda     #0x2E
   18EE 4C AF 17      [ 3] 1486         jmp     L17AF
                           1487 ;
                           1488 ;       Act like call to L17AD, but if code not found, act like a you got a 0040
                           1489 ;
   18F1                    1490 L18F1:
   18F1 20 AD 17      [ 6] 1491         jsr     L17AD
   18F4 90 01         [ 4] 1492         bcc     L18F7
   18F6 60            [ 6] 1493         rts
                           1494 ;
   18F7                    1495 L18F7:
   18F7 A9 40         [ 2] 1496         lda     #0x40
   18F9 4C AF 17      [ 3] 1497         jmp     L17AF
                           1498 ;
   18FC                    1499 L18FC:
   18FC A9 FA         [ 2] 1500         lda     #0xFA
   18FE 85 3E         [ 3] 1501         sta     X003E
   1900 A9 E6         [ 2] 1502         lda     #0xE6
   1902 85 3F         [ 3] 1503         sta     X003F
   1904 A9 D2         [ 2] 1504         lda     #0xD2
   1906 85 40         [ 3] 1505         sta     X0040
   1908 A9 BE         [ 2] 1506         lda     #0xBE
   190A 85 41         [ 3] 1507         sta     X0041
   190C A9 AA         [ 2] 1508         lda     #0xAA
   190E 85 42         [ 3] 1509         sta     X0042
                           1510 
                           1511         ;       Init Table addresses
                           1512 
   1910 A9 2F         [ 2] 1513         lda     #0x2F                   ; X1A2F - board 1 related?
   1912 85 38         [ 3] 1514         sta     X0038
   1914 A9 1A         [ 2] 1515         lda     #0x1A
   1916 85 39         [ 3] 1516         sta     X0039
                           1517 
   1918 A9 01         [ 2] 1518         lda     #0x01                   ; X1B01 - board 2 related?
   191A 85 34         [ 3] 1519         sta     X0034
   191C A9 1B         [ 2] 1520         lda     #0x1B
   191E 85 35         [ 3] 1521         sta     X0035
                           1522 
   1920 A9 B9         [ 2] 1523         lda     #0xB9                   ; X1BB9 - board 5 related?
   1922 85 36         [ 3] 1524         sta     X0036
   1924 A9 1B         [ 2] 1525         lda     #0x1B
   1926 85 37         [ 3] 1526         sta     X0037
                           1527 
   1928 A9 4B         [ 2] 1528         lda     #0x4B                   ; X1C4B - board 4 related?
   192A 85 3A         [ 3] 1529         sta     X003A
   192C A9 1C         [ 2] 1530         lda     #0x1C
   192E 85 3B         [ 3] 1531         sta     X003B
                           1532 
   1930 A9 05         [ 2] 1533         lda     #0x05                   ; X1D05 - board 3 related?
   1932 85 3C         [ 3] 1534         sta     X003C
   1934 A9 1D         [ 2] 1535         lda     #0x1D
   1936 85 3D         [ 3] 1536         sta     X003D
   1938 60            [ 6] 1537         rts
                           1538 ;
   1939                    1539 L1939:
   1939 20 49 19      [ 6] 1540         jsr     L1949
   193C 20 77 19      [ 6] 1541         jsr     L1977
   193F 20 A5 19      [ 6] 1542         jsr     L19A5
   1942 20 D3 19      [ 6] 1543         jsr     L19D3
   1945 20 01 1A      [ 6] 1544         jsr     L1A01
   1948 60            [ 6] 1545         rts
                           1546 ;
   1949                    1547 L1949:
   1949 A0 00         [ 2] 1548         ldy     #0x00
   194B B1 38         [ 6] 1549         lda     [X0038],y
   194D C9 FF         [ 2] 1550         cmp     #0xFF
   194F F0 17         [ 4] 1551         beq     L1968
   1951 C5 3E         [ 3] 1552         cmp     X003E
   1953 D0 12         [ 4] 1553         bne     L1967
   1955 C8            [ 2] 1554         iny
   1956 B1 38         [ 6] 1555         lda     [X0038],y
   1958 85 80         [ 3] 1556         sta     board_1_periph$ddr_reg_a
   195A 18            [ 2] 1557         clc
   195B A5 38         [ 3] 1558         lda     X0038
   195D 69 02         [ 2] 1559         adc     #0x02
   195F 85 38         [ 3] 1560         sta     X0038
   1961 A5 39         [ 3] 1561         lda     X0039
   1963 69 00         [ 2] 1562         adc     #0x00
   1965 85 39         [ 3] 1563         sta     X0039
   1967                    1564 L1967:
   1967 60            [ 6] 1565         rts
                           1566 ;
   1968                    1567 L1968:
   1968 A9 2F         [ 2] 1568         lda     #0x2F
   196A 85 38         [ 3] 1569         sta     X0038
   196C A9 1A         [ 2] 1570         lda     #0x1A
   196E 85 39         [ 3] 1571         sta     X0039
   1970 A9 FA         [ 2] 1572         lda     #0xFA
   1972 85 3E         [ 3] 1573         sta     X003E
   1974 4C 67 19      [ 3] 1574         jmp     L1967
                           1575 ;
   1977                    1576 L1977:
   1977 A0 00         [ 2] 1577         ldy     #0x00
   1979 B1 34         [ 6] 1578         lda     [X0034],y
   197B C9 FF         [ 2] 1579         cmp     #0xFF
   197D F0 17         [ 4] 1580         beq     L1996
   197F C5 3F         [ 3] 1581         cmp     X003F
   1981 D0 12         [ 4] 1582         bne     L1995
   1983 C8            [ 2] 1583         iny
   1984 B1 34         [ 6] 1584         lda     [X0034],y
   1986 85 84         [ 3] 1585         sta     board_2_periph$ddr_reg_a
   1988 18            [ 2] 1586         clc
   1989 A5 34         [ 3] 1587         lda     X0034
   198B 69 02         [ 2] 1588         adc     #0x02
   198D 85 34         [ 3] 1589         sta     X0034
   198F A5 35         [ 3] 1590         lda     X0035
   1991 69 00         [ 2] 1591         adc     #0x00
   1993 85 35         [ 3] 1592         sta     X0035
   1995                    1593 L1995:
   1995 60            [ 6] 1594         rts
                           1595 ;
   1996                    1596 L1996:
   1996 A9 01         [ 2] 1597         lda     #0x01
   1998 85 34         [ 3] 1598         sta     X0034
   199A A9 1B         [ 2] 1599         lda     #0x1B
   199C 85 35         [ 3] 1600         sta     X0035
   199E A9 E6         [ 2] 1601         lda     #0xE6
   19A0 85 3F         [ 3] 1602         sta     X003F
   19A2 4C 95 19      [ 3] 1603         jmp     L1995
                           1604 ;
   19A5                    1605 L19A5:
   19A5 A0 00         [ 2] 1606         ldy     #0x00
   19A7 B1 36         [ 6] 1607         lda     [X0036],y
   19A9 C9 FF         [ 2] 1608         cmp     #0xFF
   19AB F0 17         [ 4] 1609         beq     L19C4
   19AD C5 40         [ 3] 1610         cmp     X0040
   19AF D0 12         [ 4] 1611         bne     L19C3
   19B1 C8            [ 2] 1612         iny
   19B2 B1 36         [ 6] 1613         lda     [X0036],y
   19B4 85 90         [ 3] 1614         sta     board_5_periph$ddr_reg_a
   19B6 18            [ 2] 1615         clc
   19B7 A5 36         [ 3] 1616         lda     X0036
   19B9 69 02         [ 2] 1617         adc     #0x02
   19BB 85 36         [ 3] 1618         sta     X0036
   19BD A5 37         [ 3] 1619         lda     X0037
   19BF 69 00         [ 2] 1620         adc     #0x00
   19C1 85 37         [ 3] 1621         sta     X0037
   19C3                    1622 L19C3:
   19C3 60            [ 6] 1623         rts
                           1624 ;
   19C4                    1625 L19C4:
   19C4 A9 B9         [ 2] 1626         lda     #0xB9
   19C6 85 36         [ 3] 1627         sta     X0036
   19C8 A9 1B         [ 2] 1628         lda     #0x1B
   19CA 85 37         [ 3] 1629         sta     X0037
   19CC A9 D2         [ 2] 1630         lda     #0xD2
   19CE 85 40         [ 3] 1631         sta     X0040
   19D0 4C C3 19      [ 3] 1632         jmp     L19C3
                           1633 ;
   19D3                    1634 L19D3:
   19D3 A0 00         [ 2] 1635         ldy     #0x00
   19D5 B1 3A         [ 6] 1636         lda     [X003A],y
   19D7 C9 FF         [ 2] 1637         cmp     #0xFF
   19D9 F0 17         [ 4] 1638         beq     L19F2
   19DB C5 41         [ 3] 1639         cmp     X0041
   19DD D0 12         [ 4] 1640         bne     L19F1
   19DF C8            [ 2] 1641         iny
   19E0 B1 3A         [ 6] 1642         lda     [X003A],y
   19E2 85 8C         [ 3] 1643         sta     board_4_periph$ddr_reg_a
   19E4 18            [ 2] 1644         clc
   19E5 A5 3A         [ 3] 1645         lda     X003A
   19E7 69 02         [ 2] 1646         adc     #0x02
   19E9 85 3A         [ 3] 1647         sta     X003A
   19EB A5 3B         [ 3] 1648         lda     X003B
   19ED 69 00         [ 2] 1649         adc     #0x00
   19EF 85 3B         [ 3] 1650         sta     X003B
   19F1                    1651 L19F1:
   19F1 60            [ 6] 1652         rts
                           1653 ;
   19F2                    1654 L19F2:
   19F2 A9 4B         [ 2] 1655         lda     #0x4B
   19F4 85 3A         [ 3] 1656         sta     X003A
   19F6 A9 1C         [ 2] 1657         lda     #0x1C
   19F8 85 3B         [ 3] 1658         sta     X003B
   19FA A9 BE         [ 2] 1659         lda     #0xBE
   19FC 85 41         [ 3] 1660         sta     X0041
   19FE 4C F1 19      [ 3] 1661         jmp     L19F1
                           1662 ;
   1A01                    1663 L1A01:
   1A01 A0 00         [ 2] 1664         ldy     #0x00
   1A03 B1 3C         [ 6] 1665         lda     [X003C],y
   1A05                    1666 L1A05:
   1A05 C9 FF         [ 2] 1667         cmp     #0xFF
   1A07 F0 17         [ 4] 1668         beq     L1A20
   1A09 C5 42         [ 3] 1669         cmp     X0042
   1A0B D0 12         [ 4] 1670         bne     L1A1F
   1A0D C8            [ 2] 1671         iny
   1A0E B1 3C         [ 6] 1672         lda     [X003C],y
   1A10 85 88         [ 3] 1673         sta     board_3_periph$ddr_reg_a
   1A12 18            [ 2] 1674         clc
   1A13 A5 3C         [ 3] 1675         lda     X003C
   1A15 69 02         [ 2] 1676         adc     #0x02
   1A17 85 3C         [ 3] 1677         sta     X003C
   1A19 A5 3D         [ 3] 1678         lda     X003D
   1A1B 69 00         [ 2] 1679         adc     #0x00
   1A1D 85 3D         [ 3] 1680         sta     X003D
   1A1F                    1681 L1A1F:
   1A1F 60            [ 6] 1682         rts
                           1683 ;
   1A20                    1684 L1A20:
   1A20 A9 05         [ 2] 1685         lda     #0x05
   1A22 85 3C         [ 3] 1686         sta     X003C
   1A24 A9 1D         [ 2] 1687         lda     #0x1D
   1A26 85 3D         [ 3] 1688         sta     X003D
   1A28 A9 AA         [ 2] 1689         lda     #0xAA
   1A2A 85 42         [ 3] 1690         sta     X0042
   1A2C 4C 1F 1A      [ 3] 1691         jmp     L1A1F
                           1692 ;
                           1693 ;
                           1694 ;
   1A2F                    1695 X1A2F:
   1A2F FA 20              1696         .db     0xFA, 0x20
   1A31 FA 20              1697         .db     0xFA, 0x20
   1A33 F6 22              1698         .db     0xF6, 0x22
   1A35 F5 20              1699         .db     0xF5, 0x20
   1A37 F5 20              1700         .db     0xF5, 0x20
   1A39 F3 22              1701         .db     0xF3, 0x22
   1A3B F2 20              1702         .db     0xF2, 0x20
   1A3D E5 22              1703         .db     0xE5, 0x22
   1A3F E5 22              1704         .db     0xE5, 0x22
   1A41 E2 20              1705         .db     0xE2, 0x20
   1A43 D2 20              1706         .db     0xD2, 0x20
   1A45 BE 00              1707         .db     0xBE, 0x00
   1A47 BC 22              1708         .db     0xBC, 0x22
   1A49 BB 30              1709         .db     0xBB, 0x30
   1A4B B9 32              1710         .db     0xB9, 0x32
   1A4D B9 32              1711         .db     0xB9, 0x32
   1A4F B7 30              1712         .db     0xB7, 0x30
   1A51 B6 32              1713         .db     0xB6, 0x32
   1A53 B5 30              1714         .db     0xB5, 0x30
   1A55 B4 32              1715         .db     0xB4, 0x32
   1A57 B4 32              1716         .db     0xB4, 0x32
   1A59 B3 20              1717         .db     0xB3, 0x20
   1A5B B3 20              1718         .db     0xB3, 0x20
   1A5D B1 A0              1719         .db     0xB1, 0xA0
   1A5F B1 A0              1720         .db     0xB1, 0xA0
   1A61 B0 A2              1721         .db     0xB0, 0xA2
   1A63 AF A0              1722         .db     0xAF, 0xA0
   1A65 AF A6              1723         .db     0xAF, 0xA6
   1A67 AE A0              1724         .db     0xAE, 0xA0
   1A69 AE A6              1725         .db     0xAE, 0xA6
   1A6B AD A4              1726         .db     0xAD, 0xA4
   1A6D AC A0              1727         .db     0xAC, 0xA0
   1A6F AC A0              1728         .db     0xAC, 0xA0
   1A71 AB A0              1729         .db     0xAB, 0xA0
   1A73 AA A0              1730         .db     0xAA, 0xA0
   1A75 AA A0              1731         .db     0xAA, 0xA0
   1A77 A2 80              1732         .db     0xA2, 0x80
   1A79 A0 A0              1733         .db     0xA0, 0xA0
   1A7B A0 A0              1734         .db     0xA0, 0xA0
   1A7D 8D 80              1735         .db     0x8D, 0x80
   1A7F 8A A0              1736         .db     0x8A, 0xA0
   1A81 7E 80              1737         .db     0x7E, 0x80
   1A83 7B A0              1738         .db     0x7B, 0xA0
   1A85 79 A4              1739         .db     0x79, 0xA4
   1A87 78 A0              1740         .db     0x78, 0xA0
   1A89 77 A4              1741         .db     0x77, 0xA4
   1A8B 76 A0              1742         .db     0x76, 0xA0
   1A8D 75 A4              1743         .db     0x75, 0xA4
   1A8F 74 A0              1744         .db     0x74, 0xA0
   1A91 73 A4              1745         .db     0x73, 0xA4
   1A93 72 A0              1746         .db     0x72, 0xA0
   1A95 71 A4              1747         .db     0x71, 0xA4
   1A97 70 A0              1748         .db     0x70, 0xA0
   1A99 6F A4              1749         .db     0x6F, 0xA4
   1A9B 6E A0              1750         .db     0x6E, 0xA0
   1A9D 6D A4              1751         .db     0x6D, 0xA4
   1A9F 6C A0              1752         .db     0x6C, 0xA0
   1AA1 69 80              1753         .db     0x69, 0x80
   1AA3 69 80              1754         .db     0x69, 0x80
   1AA5 67 A0              1755         .db     0x67, 0xA0
   1AA7 5E 20              1756         .db     0x5E, 0x20
   1AA9 58 24              1757         .db     0x58, 0x24
   1AAB 57 20              1758         .db     0x57, 0x20
   1AAD 57 20              1759         .db     0x57, 0x20
   1AAF 56 24              1760         .db     0x56, 0x24
   1AB1 55 20              1761         .db     0x55, 0x20
   1AB3 54 24              1762         .db     0x54, 0x24
   1AB5 54 24              1763         .db     0x54, 0x24
   1AB7 53 20              1764         .db     0x53, 0x20
   1AB9 52 24              1765         .db     0x52, 0x24
   1ABB 52 24              1766         .db     0x52, 0x24
   1ABD 50 20              1767         .db     0x50, 0x20
   1ABF 4F 24              1768         .db     0x4F, 0x24
   1AC1 4E 20              1769         .db     0x4E, 0x20
   1AC3 4D 24              1770         .db     0x4D, 0x24
   1AC5 4C 20              1771         .db     0x4C, 0x20
   1AC7 4C 20              1772         .db     0x4C, 0x20
   1AC9 4B 24              1773         .db     0x4B, 0x24
   1ACB 4A 20              1774         .db     0x4A, 0x20
   1ACD 49 20              1775         .db     0x49, 0x20
   1ACF 49 00              1776         .db     0x49, 0x00
   1AD1 48 20              1777         .db     0x48, 0x20
   1AD3 47 20              1778         .db     0x47, 0x20
   1AD5 47 20              1779         .db     0x47, 0x20
   1AD7 46 20              1780         .db     0x46, 0x20
   1AD9 45 24              1781         .db     0x45, 0x24
   1ADB 45 24              1782         .db     0x45, 0x24
   1ADD 44 20              1783         .db     0x44, 0x20
   1ADF 42 20              1784         .db     0x42, 0x20
   1AE1 42 20              1785         .db     0x42, 0x20
   1AE3 37 04              1786         .db     0x37, 0x04
   1AE5 35 20              1787         .db     0x35, 0x20
   1AE7 2E 04              1788         .db     0x2E, 0x04
   1AE9 2E 04              1789         .db     0x2E, 0x04
   1AEB 2D 20              1790         .db     0x2D, 0x20
   1AED 23 24              1791         .db     0x23, 0x24
   1AEF 21 20              1792         .db     0x21, 0x20
   1AF1 17 24              1793         .db     0x17, 0x24
   1AF3 13 00              1794         .db     0x13, 0x00
   1AF5 11 24              1795         .db     0x11, 0x24
   1AF7 10 30              1796         .db     0x10, 0x30
   1AF9 07 34              1797         .db     0x07, 0x34
   1AFB 06 30              1798         .db     0x06, 0x30
   1AFD 05 30              1799         .db     0x05, 0x30
   1AFF FF FF              1800         .db     0xFF, 0xFF
                           1801 ;
   1B01                    1802 X1B01:
   1B01 D7 22              1803         .db     0xD7, 0x22
   1B03 D5 20              1804         .db     0xD5, 0x20
   1B05 C9 22              1805         .db     0xC9, 0x22
   1B07 C7 20              1806         .db     0xC7, 0x20
   1B09 C4 24              1807         .db     0xC4, 0x24
   1B0B C3 20              1808         .db     0xC3, 0x20
   1B0D C2 24              1809         .db     0xC2, 0x24
   1B0F C1 20              1810         .db     0xC1, 0x20
   1B11 BF 24              1811         .db     0xBF, 0x24
   1B13 BF 24              1812         .db     0xBF, 0x24
   1B15 BE 20              1813         .db     0xBE, 0x20
   1B17 BD 24              1814         .db     0xBD, 0x24
   1B19 BC 20              1815         .db     0xBC, 0x20
   1B1B BB 24              1816         .db     0xBB, 0x24
   1B1D BA 20              1817         .db     0xBA, 0x20
   1B1F B9 20              1818         .db     0xB9, 0x20
   1B21 B8 24              1819         .db     0xB8, 0x24
   1B23 B7 20              1820         .db     0xB7, 0x20
   1B25 B4 00              1821         .db     0xB4, 0x00
   1B27 B4 00              1822         .db     0xB4, 0x00
   1B29 B2 20              1823         .db     0xB2, 0x20
   1B2B A9 20              1824         .db     0xA9, 0x20
   1B2D A3 20              1825         .db     0xA3, 0x20
   1B2F A2 20              1826         .db     0xA2, 0x20
   1B31 A1 20              1827         .db     0xA1, 0x20
   1B33 A0 20              1828         .db     0xA0, 0x20
   1B35 A0 20              1829         .db     0xA0, 0x20
   1B37 9F 20              1830         .db     0x9F, 0x20
   1B39 9F 20              1831         .db     0x9F, 0x20
   1B3B 9E 20              1832         .db     0x9E, 0x20
   1B3D 9D 24              1833         .db     0x9D, 0x24
   1B3F 9D 24              1834         .db     0x9D, 0x24
   1B41 9B 20              1835         .db     0x9B, 0x20
   1B43 9A 24              1836         .db     0x9A, 0x24
   1B45 99 20              1837         .db     0x99, 0x20
   1B47 98 20              1838         .db     0x98, 0x20
   1B49 97 24              1839         .db     0x97, 0x24
   1B4B 97 24              1840         .db     0x97, 0x24
   1B4D 95 20              1841         .db     0x95, 0x20
   1B4F 95 20              1842         .db     0x95, 0x20
   1B51 94 00              1843         .db     0x94, 0x00
   1B53 94 00              1844         .db     0x94, 0x00
   1B55 93 20              1845         .db     0x93, 0x20
   1B57 92 00              1846         .db     0x92, 0x00
   1B59 92 00              1847         .db     0x92, 0x00
   1B5B 91 20              1848         .db     0x91, 0x20
   1B5D 90 20              1849         .db     0x90, 0x20
   1B5F 90 20              1850         .db     0x90, 0x20
   1B61 8F 20              1851         .db     0x8F, 0x20
   1B63 8D 20              1852         .db     0x8D, 0x20
   1B65 8D 20              1853         .db     0x8D, 0x20
   1B67 81 00              1854         .db     0x81, 0x00
   1B69 7F 20              1855         .db     0x7F, 0x20
   1B6B 79 00              1856         .db     0x79, 0x00
   1B6D 79 00              1857         .db     0x79, 0x00
   1B6F 78 20              1858         .db     0x78, 0x20
   1B71 76 20              1859         .db     0x76, 0x20
   1B73 6B 00              1860         .db     0x6B, 0x00
   1B75 69 20              1861         .db     0x69, 0x20
   1B77 5E 00              1862         .db     0x5E, 0x00
   1B79 5C 20              1863         .db     0x5C, 0x20
   1B7B 5B 30              1864         .db     0x5B, 0x30
   1B7D 52 10              1865         .db     0x52, 0x10
   1B7F 51 30              1866         .db     0x51, 0x30
   1B81 50 30              1867         .db     0x50, 0x30
   1B83 50 30              1868         .db     0x50, 0x30
   1B85 4F 20              1869         .db     0x4F, 0x20
   1B87 4E 20              1870         .db     0x4E, 0x20
   1B89 4E 20              1871         .db     0x4E, 0x20
   1B8B 4D 20              1872         .db     0x4D, 0x20
   1B8D 46 A0              1873         .db     0x46, 0xA0
   1B8F 45 A0              1874         .db     0x45, 0xA0
   1B91 3D A0              1875         .db     0x3D, 0xA0
   1B93 3D A0              1876         .db     0x3D, 0xA0
   1B95 39 20              1877         .db     0x39, 0x20
   1B97 2A 00              1878         .db     0x2A, 0x00
   1B99 28 20              1879         .db     0x28, 0x20
   1B9B 1E 00              1880         .db     0x1E, 0x00
   1B9D 1C 22              1881         .db     0x1C, 0x22
   1B9F 1C 22              1882         .db     0x1C, 0x22
   1BA1 1B 20              1883         .db     0x1B, 0x20
   1BA3 1A 22              1884         .db     0x1A, 0x22
   1BA5 19 20              1885         .db     0x19, 0x20
   1BA7 18 22              1886         .db     0x18, 0x22
   1BA9 18 22              1887         .db     0x18, 0x22
   1BAB 16 20              1888         .db     0x16, 0x20
   1BAD 15 22              1889         .db     0x15, 0x22
   1BAF 15 22              1890         .db     0x15, 0x22
   1BB1 14 A0              1891         .db     0x14, 0xA0
   1BB3 13 A2              1892         .db     0x13, 0xA2
   1BB5 11 A0              1893         .db     0x11, 0xA0
   1BB7 FF FF              1894         .db     0xFF, 0xFF
                           1895 ;
   1BB9                    1896 X1BB9:
   1BB9 CD 20              1897         .db     0xCD, 0x20
   1BBB CC 20              1898         .db     0xCC, 0x20
   1BBD CB 20              1899         .db     0xCB, 0x20
   1BBF CB 20              1900         .db     0xCB, 0x20
   1BC1 CA 00              1901         .db     0xCA, 0x00
   1BC3 C9 20              1902         .db     0xC9, 0x20
   1BC5 C9 20              1903         .db     0xC9, 0x20
   1BC7 C8 20              1904         .db     0xC8, 0x20
   1BC9 C1 A0              1905         .db     0xC1, 0xA0
   1BCB C0 A0              1906         .db     0xC0, 0xA0
   1BCD B8 A0              1907         .db     0xB8, 0xA0
   1BCF B8 20              1908         .db     0xB8, 0x20
   1BD1 B4 20              1909         .db     0xB4, 0x20
   1BD3 A6 00              1910         .db     0xA6, 0x00
   1BD5 A4 20              1911         .db     0xA4, 0x20
   1BD7 99 00              1912         .db     0x99, 0x00
   1BD9 97 22              1913         .db     0x97, 0x22
   1BDB 97 22              1914         .db     0x97, 0x22
   1BDD 96 20              1915         .db     0x96, 0x20
   1BDF 95 22              1916         .db     0x95, 0x22
   1BE1 94 20              1917         .db     0x94, 0x20
   1BE3 93 22              1918         .db     0x93, 0x22
   1BE5 93 22              1919         .db     0x93, 0x22
   1BE7 91 20              1920         .db     0x91, 0x20
   1BE9 90 20              1921         .db     0x90, 0x20
   1BEB 90 20              1922         .db     0x90, 0x20
   1BED 8D A0              1923         .db     0x8D, 0xA0
   1BEF 8C A0              1924         .db     0x8C, 0xA0
   1BF1 7D A2              1925         .db     0x7D, 0xA2
   1BF3 7D A2              1926         .db     0x7D, 0xA2
   1BF5 7B A0              1927         .db     0x7B, 0xA0
   1BF7 7B A0              1928         .db     0x7B, 0xA0
   1BF9 79 A2              1929         .db     0x79, 0xA2
   1BFB 79 A2              1930         .db     0x79, 0xA2
   1BFD 77 A0              1931         .db     0x77, 0xA0
   1BFF 77 A0              1932         .db     0x77, 0xA0
   1C01 76 80              1933         .db     0x76, 0x80
   1C03 75 A0              1934         .db     0x75, 0xA0
   1C05 6E 20              1935         .db     0x6E, 0x20
   1C07 67 24              1936         .db     0x67, 0x24
   1C09 66 20              1937         .db     0x66, 0x20
   1C0B 65 24              1938         .db     0x65, 0x24
   1C0D 64 20              1939         .db     0x64, 0x20
   1C0F 63 24              1940         .db     0x63, 0x24
   1C11 63 24              1941         .db     0x63, 0x24
   1C13 61 20              1942         .db     0x61, 0x20
   1C15 60 24              1943         .db     0x60, 0x24
   1C17 5F 20              1944         .db     0x5F, 0x20
   1C19 5E 20              1945         .db     0x5E, 0x20
   1C1B 5D 24              1946         .db     0x5D, 0x24
   1C1D 5C 20              1947         .db     0x5C, 0x20
   1C1F 5B 24              1948         .db     0x5B, 0x24
   1C21 5A 20              1949         .db     0x5A, 0x20
   1C23 59 24              1950         .db     0x59, 0x24
   1C25 58 20              1951         .db     0x58, 0x20
   1C27 56 20              1952         .db     0x56, 0x20
   1C29 55 04              1953         .db     0x55, 0x04
   1C2B 54 00              1954         .db     0x54, 0x00
   1C2D 53 24              1955         .db     0x53, 0x24
   1C2F 52 20              1956         .db     0x52, 0x20
   1C31 52 20              1957         .db     0x52, 0x20
   1C33 4F 24              1958         .db     0x4F, 0x24
   1C35 4F 24              1959         .db     0x4F, 0x24
   1C37 4E 30              1960         .db     0x4E, 0x30
   1C39 4D 30              1961         .db     0x4D, 0x30
   1C3B 47 10              1962         .db     0x47, 0x10
   1C3D 45 30              1963         .db     0x45, 0x30
   1C3F 35 30              1964         .db     0x35, 0x30
   1C41 33 10              1965         .db     0x33, 0x10
   1C43 31 30              1966         .db     0x31, 0x30
   1C45 31 30              1967         .db     0x31, 0x30
   1C47 1D 20              1968         .db     0x1D, 0x20
   1C49 FF FF              1969         .db     0xFF, 0xFF
                           1970 ;
   1C4B                    1971 X1C4B:
   1C4B BE 00              1972         .db     0xBE, 0x00
   1C4D BC 22              1973         .db     0xBC, 0x22
   1C4F BB 30              1974         .db     0xBB, 0x30
   1C51 B9 32              1975         .db     0xB9, 0x32
   1C53 B7 30              1976         .db     0xB7, 0x30
   1C55 B6 32              1977         .db     0xB6, 0x32
   1C57 B5 30              1978         .db     0xB5, 0x30
   1C59 B4 32              1979         .db     0xB4, 0x32
   1C5B B4 32              1980         .db     0xB4, 0x32
   1C5D B3 20              1981         .db     0xB3, 0x20
   1C5F B3 20              1982         .db     0xB3, 0x20
   1C61 B1 A0              1983         .db     0xB1, 0xA0
   1C63 B1 A0              1984         .db     0xB1, 0xA0
   1C65 B0 A2              1985         .db     0xB0, 0xA2
   1C67 AF A0              1986         .db     0xAF, 0xA0
   1C69 AF A6              1987         .db     0xAF, 0xA6
   1C6B AE A0              1988         .db     0xAE, 0xA0
   1C6D AE A6              1989         .db     0xAE, 0xA6
   1C6F AD A4              1990         .db     0xAD, 0xA4
   1C71 AC A0              1991         .db     0xAC, 0xA0
   1C73 AC A0              1992         .db     0xAC, 0xA0
   1C75 AB A0              1993         .db     0xAB, 0xA0
   1C77 AA A0              1994         .db     0xAA, 0xA0
   1C79 AA A0              1995         .db     0xAA, 0xA0
   1C7B A2 80              1996         .db     0xA2, 0x80
   1C7D A0 A0              1997         .db     0xA0, 0xA0
   1C7F A0 A0              1998         .db     0xA0, 0xA0
   1C81 8D 80              1999         .db     0x8D, 0x80
   1C83 8A A0              2000         .db     0x8A, 0xA0
   1C85 7E 80              2001         .db     0x7E, 0x80
   1C87 7B A0              2002         .db     0x7B, 0xA0
   1C89 79 A4              2003         .db     0x79, 0xA4
   1C8B 78 A0              2004         .db     0x78, 0xA0
   1C8D 77 A4              2005         .db     0x77, 0xA4
   1C8F 76 A0              2006         .db     0x76, 0xA0
   1C91 75 A4              2007         .db     0x75, 0xA4
   1C93 74 A0              2008         .db     0x74, 0xA0
   1C95 73 A4              2009         .db     0x73, 0xA4
   1C97 72 A0              2010         .db     0x72, 0xA0
   1C99 71 A4              2011         .db     0x71, 0xA4
   1C9B 70 A0              2012         .db     0x70, 0xA0
   1C9D 6F A4              2013         .db     0x6F, 0xA4
   1C9F 6E A0              2014         .db     0x6E, 0xA0
   1CA1 6D A4              2015         .db     0x6D, 0xA4
   1CA3 6C A0              2016         .db     0x6C, 0xA0
   1CA5 69 80              2017         .db     0x69, 0x80
   1CA7 69 80              2018         .db     0x69, 0x80
   1CA9 67 A0              2019         .db     0x67, 0xA0
   1CAB 5E 20              2020         .db     0x5E, 0x20
   1CAD 58 24              2021         .db     0x58, 0x24
   1CAF 57 20              2022         .db     0x57, 0x20
   1CB1 57 20              2023         .db     0x57, 0x20
   1CB3 56 24              2024         .db     0x56, 0x24
   1CB5 55 20              2025         .db     0x55, 0x20
   1CB7 54 24              2026         .db     0x54, 0x24
   1CB9 54 24              2027         .db     0x54, 0x24
   1CBB 53 20              2028         .db     0x53, 0x20
   1CBD 52 24              2029         .db     0x52, 0x24
   1CBF 52 24              2030         .db     0x52, 0x24
   1CC1 50 20              2031         .db     0x50, 0x20
   1CC3 4F 24              2032         .db     0x4F, 0x24
   1CC5 4E 20              2033         .db     0x4E, 0x20
   1CC7 4D 24              2034         .db     0x4D, 0x24
   1CC9 4C 20              2035         .db     0x4C, 0x20
   1CCB 4C 20              2036         .db     0x4C, 0x20
   1CCD 4B 24              2037         .db     0x4B, 0x24
   1CCF 4A 20              2038         .db     0x4A, 0x20
   1CD1 49 20              2039         .db     0x49, 0x20
   1CD3 49 00              2040         .db     0x49, 0x00
   1CD5 48 20              2041         .db     0x48, 0x20
   1CD7 47 20              2042         .db     0x47, 0x20
   1CD9 47 20              2043         .db     0x47, 0x20
   1CDB 46 20              2044         .db     0x46, 0x20
   1CDD 45 24              2045         .db     0x45, 0x24
   1CDF 45 24              2046         .db     0x45, 0x24
   1CE1 44 20              2047         .db     0x44, 0x20
   1CE3 42 20              2048         .db     0x42, 0x20
   1CE5 42 20              2049         .db     0x42, 0x20
   1CE7 37 04              2050         .db     0x37, 0x04
   1CE9 35 20              2051         .db     0x35, 0x20
   1CEB 2E 04              2052         .db     0x2E, 0x04
   1CED 2E 04              2053         .db     0x2E, 0x04
   1CEF 2D 20              2054         .db     0x2D, 0x20
   1CF1 23 24              2055         .db     0x23, 0x24
   1CF3 21 20              2056         .db     0x21, 0x20
   1CF5 17 24              2057         .db     0x17, 0x24
   1CF7 13 00              2058         .db     0x13, 0x00
   1CF9 11 24              2059         .db     0x11, 0x24
   1CFB 10 30              2060         .db     0x10, 0x30
   1CFD 07 34              2061         .db     0x07, 0x34
   1CFF 06 30              2062         .db     0x06, 0x30
   1D01 05 30              2063         .db     0x05, 0x30
   1D03 FF FF              2064         .db     0xFF, 0xFF
                           2065 ;
   1D05                    2066 X1D05:
   1D05 A9 20              2067         .db     0xA9, 0x20
   1D07 A3 20              2068         .db     0xA3, 0x20
   1D09 A2 20              2069         .db     0xA2, 0x20
   1D0B A1 20              2070         .db     0xA1, 0x20
   1D0D A0 20              2071         .db     0xA0, 0x20
   1D0F A0 20              2072         .db     0xA0, 0x20
   1D11 9F 20              2073         .db     0x9F, 0x20
   1D13 9F 20              2074         .db     0x9F, 0x20
   1D15 9E 20              2075         .db     0x9E, 0x20
   1D17 9D 24              2076         .db     0x9D, 0x24
   1D19 9D 24              2077         .db     0x9D, 0x24
   1D1B 9B 20              2078         .db     0x9B, 0x20
   1D1D 9A 24              2079         .db     0x9A, 0x24
   1D1F 99 20              2080         .db     0x99, 0x20
   1D21 98 20              2081         .db     0x98, 0x20
   1D23 97 24              2082         .db     0x97, 0x24
   1D25 97 24              2083         .db     0x97, 0x24
   1D27 95 20              2084         .db     0x95, 0x20
   1D29 95 20              2085         .db     0x95, 0x20
   1D2B 94 00              2086         .db     0x94, 0x00
   1D2D 94 00              2087         .db     0x94, 0x00
   1D2F 93 20              2088         .db     0x93, 0x20
   1D31 92 00              2089         .db     0x92, 0x00
   1D33 92 00              2090         .db     0x92, 0x00
   1D35 91 20              2091         .db     0x91, 0x20
   1D37 90 20              2092         .db     0x90, 0x20
   1D39 90 20              2093         .db     0x90, 0x20
   1D3B 8F 20              2094         .db     0x8F, 0x20
   1D3D 8D 20              2095         .db     0x8D, 0x20
   1D3F 8D 20              2096         .db     0x8D, 0x20
   1D41 81 00              2097         .db     0x81, 0x00
   1D43 7F 20              2098         .db     0x7F, 0x20
   1D45 79 00              2099         .db     0x79, 0x00
   1D47 79 00              2100         .db     0x79, 0x00
   1D49 78 20              2101         .db     0x78, 0x20
   1D4B 76 20              2102         .db     0x76, 0x20
   1D4D 6B 00              2103         .db     0x6B, 0x00
   1D4F 69 20              2104         .db     0x69, 0x20
   1D51 5E 00              2105         .db     0x5E, 0x00
   1D53 5C 20              2106         .db     0x5C, 0x20
   1D55 5B 30              2107         .db     0x5B, 0x30
   1D57 52 10              2108         .db     0x52, 0x10
   1D59 51 30              2109         .db     0x51, 0x30
   1D5B 50 30              2110         .db     0x50, 0x30
   1D5D 50 30              2111         .db     0x50, 0x30
   1D5F 4F 20              2112         .db     0x4F, 0x20
   1D61 4E 20              2113         .db     0x4E, 0x20
   1D63 4E 20              2114         .db     0x4E, 0x20
   1D65 4D 20              2115         .db     0x4D, 0x20
   1D67 46 A0              2116         .db     0x46, 0xA0
   1D69 45 A0              2117         .db     0x45, 0xA0
   1D6B 3D A0              2118         .db     0x3D, 0xA0
   1D6D 3D A0              2119         .db     0x3D, 0xA0
   1D6F 39 20              2120         .db     0x39, 0x20
   1D71 2A 00              2121         .db     0x2A, 0x00
   1D73 28 20              2122         .db     0x28, 0x20
   1D75 1E 00              2123         .db     0x1E, 0x00
   1D77 1C 22              2124         .db     0x1C, 0x22
   1D79 1C 22              2125         .db     0x1C, 0x22
   1D7B 1B 20              2126         .db     0x1B, 0x20
   1D7D 1A 22              2127         .db     0x1A, 0x22
   1D7F 19 20              2128         .db     0x19, 0x20
   1D81 18 22              2129         .db     0x18, 0x22
   1D83 18 22              2130         .db     0x18, 0x22
   1D85 16 20              2131         .db     0x16, 0x20
   1D87 15 22              2132         .db     0x15, 0x22
   1D89 15 22              2133         .db     0x15, 0x22
   1D8B 14 A0              2134         .db     0x14, 0xA0
   1D8D 13 A2              2135         .db     0x13, 0xA2
   1D8F 11 A0              2136         .db     0x11, 0xA0
   1D91 FF FF              2137         .db     0xFF, 0xFF
                           2138 ;
                           2139 ;       Jump Table - process command bytes
                           2140 ;
   1D93                    2141 X1D93:
   1D93 F1 17              2142         .dw     L17F1                   ; 0x22-23 ( "# card 7?) - extended codes?
   1D95 B1 1D              2143         .dw     IGNORE                  ; 0x24-25
   1D97 AD 17              2144         .dw     L17AD                   ; 0x26-27 ( &' ???)
   1D99 B1 1D              2145         .dw     IGNORE                  ; 0x28-29
   1D9B 0E 18              2146         .dw     L180E                   ; 0x2A-2B ( *+ card 8?) - def 30
   1D9D B1 1D              2147         .dw     IGNORE                  ; 0x2C-2D
   1D9F B1 1D              2148         .dw     IGNORE                  ; 0x2E-2F
   1DA1 B1 1D              2149         .dw     IGNORE                  ; 0x30-31
   1DA3 AD 17              2150         .dw     L17AD                   ; 0x32-33 ( 23 card 1?)
   1DA5 DB 18              2151         .dw     L18DB                   ; 0x34-35 ( 45 card 3?) - def 2C
   1DA7 F1 18              2152         .dw     L18F1                   ; 0x36-37 ( 67 card 2?) - def 40
   1DA9 19 18              2153         .dw     L1819                   ; 0x38-39 ( 89 card 6?) - do nothing?
   1DAB E6 17              2154         .dw     L17E6                   ; 0x3A-3B ( :; card 5?) - def 28
   1DAD E6 18              2155         .dw     L18E6                   ; 0x3C-3D ( <= card 4?) - def 2E
   1DAF AD 17              2156         .dw     L17AD                   ; 0x3E-3F ( >? ???)
                           2157 
   1DB1                    2158 IGNORE:
   1DB1 60            [ 6] 2159         rts
                           2160 ;
                           2161 ;       Memory address codes
                           2162 ;
   1DB2                    2163 X1DB2:
   1DB2 6A                 2164         .db     0x6A        ; 0x26 - ???
   1DB3 96                 2165         .db     0x96        ; 0x28 - board 6B?
   1DB4 96                 2166         .db     0x96        ; 0x2A - board 6B?
   1DB5 8A                 2167         .db     0x8A        ; 0x2C - board 3B?
   1DB6 8E                 2168         .db     0x8E        ; 0x2E - board 4B?
   1DB7 69                 2169         .db     0x69        ; 0x30 - ???
   1DB8 80                 2170         .db     0x80        ; 0x32 - board 1
   1DB9 88                 2171         .db     0x88        ; 0x34 - board 3
   1DBA 84                 2172         .db     0x84        ; 0x36 - board 2
   1DBB 00                 2173         .db     0x00        ; 0x38
   1DBC 90                 2174         .db     0x90        ; 0x3A - board 5
   1DBD 8C                 2175         .db     0x8C        ; 0x3C - board 4
   1DBE 82                 2176         .db     0x82        ; 0x3E - board 1B?
   1DBF 86                 2177         .db     0x86        ; 0x40 - board 2B?
   1DC0 00                 2178         .db     0x00        ; 0x42
   1DC1 00                 2179         .db     0x00        ; 0x44
                           2180 ;
                           2181 ;       Extended codes for 0x22-0x23?
                           2182 ;
   1DC2                    2183 X1DC2:
   1DC2 9C 01              2184         .db     0x9C,0x01
   1DC4 98 02              2185         .db     0x98,0x02
   1DC6 9C 08              2186         .db     0x9C,0x08
   1DC8 9C 04              2187         .db     0x9C,0x04
   1DCA 9C 10              2188         .db     0x9C,0x10
   1DCC 98 04              2189         .db     0x98,0x04
   1DCE 98 08              2190         .db     0x98,0x08
   1DD0 9A 20              2191         .db     0x9A,0x20
   1DD2 9A 40              2192         .db     0x9A,0x40
   1DD4 9C 20              2193         .db     0x9C,0x20
   1DD6 9C 40              2194         .db     0x9C,0x40
   1DD8 9C 80              2195         .db     0x9C,0x80
   1DDA 9A 01              2196         .db     0x9A,0x01
   1DDC 9A 08              2197         .db     0x9A,0x08
   1DDE 9A 10              2198         .db     0x9A,0x10
   1DE0 98 40              2199         .db     0x98,0x40
   1DE2 98 80              2200         .db     0x98,0x80
   1DE4 9A 02              2201         .db     0x9A,0x02
   1DE6 9A 04              2202         .db     0x9A,0x04
   1DE8 98 10              2203         .db     0x98,0x10
   1DEA 98 20              2204         .db     0x98,0x20
   1DEC 9C 02              2205         .db     0x9C,0x02
   1DEE 9E 01              2206         .db     0x9E,0x01
   1DF0 9E 08              2207         .db     0x9E,0x08
   1DF2 9E 02              2208         .db     0x9E,0x02
   1DF4 98 01              2209         .db     0x98,0x01
   1DF6 00 80              2210         .db     0x00,0x80
   1DF8 9E 04              2211         .db     0x9E,0x04
   1DFA 9E 10              2212         .db     0x9E,0x10
   1DFC 9E 20              2213         .db     0x9E,0x20
   1DFE 9E 40              2214         .db     0x9E,0x40
   1E00 92 01              2215         .db     0x92,0x01
   1E02 00 00              2216         .db     0x00,0x00
                           2217 ;
                           2218 ;       8 bytes per command, starting with 0x26, 0x28...
                           2219 ;
   1E04                    2220 X1E04:
   1E04 46 45 48 41 4A 4C  2221         .db     'F,'E,'H,'A,'J,'L,'I,'B, 0, 0, 0,'\,'W,'X, 0, 0     ; 0x26, 0x28
        49 42 00 00 00 5C
        57 58 00 00
   1E14 41 46 43 00 00 00  2222         .db     'A,'F,'C, 0, 0, 0, 0, 0,'G,'B,'E,'F,'J,'K, 0, 0     ; 0x2A, 0x2C
        00 00 47 42 45 46
        4A 4B 00 00
   1E24 47 42 43 45 46 4A  2223         .db     'G,'B,'C,'E,'F,'J, 0, 0, 0,'J,'I,'M,'K,'L, 0, 0     ; 0x2E, 0x30
        00 00 00 4A 49 4D
        4B 4C 00 00
   1E34 41 55 43 50 49 4E  2224         .db     'A,'U,'C,'P,'I,'N,'T,'V,'A,'D,'C,'V,'I,'N,'H,'T     ; 0x32, 0x34
        54 56 41 44 43 56
        49 4E 48 54
   1E44 41 48 47 50 49 4E  2225         .db     'A,'H,'G,'P,'I,'N,'T,'V, 0, 0, 0, 0, 0, 0, 0, 0     ; 0x36, 0x38
        54 56 00 00 00 00
        00 00 00 00
   1E54 41 44 43 50 46 4E  2226         .db     'A,'D,'C,'P,'F,'N,'K,'L,'A,'H,'L,'D,'I,'N,'T,'V     ; 0x3A, 0x3C
        4B 4C 41 48 4C 44
        49 4E 54 56
   1E64 41 44 43 50 49 42  2227         .db     'A,'D,'C,'P,'I,'B, 0, 0,'B,'C,'D,'E,'F,'J, 0, 0     ; 0x3E, 0x40
        00 00 42 43 44 45
        46 4A 00 00
                           2228 ;
                           2229 ;       Gap filled with 0xff here
                           2230 ;       
   1FFC                    2231         .org    0x1ffc
                           2232 
   1FFC 66 10              2233 RESETVEC:   .dw     RESET
   1FFE 00 10              2234 IRQVEC:     .dw     IRQ
                           2235 
