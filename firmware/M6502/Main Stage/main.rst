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
                             86         .include "../include/ptt6502.def"
                              1 
                              2 ;
                              3 ; Peripheral Addresses for PTT 6502 system
                              4 ;
                              5 
                     0080     6 board_1_periph$ddr_reg_a    = 0x0080
                     0081     7 board_1_control_reg_a       = 0x0081
                     0082     8 board_1_periph$ddr_reg_b    = 0x0082
                     0083     9 board_1_control_reg_b       = 0x0083
                             10 
                     0084    11 board_2_periph$ddr_reg_a    = 0x0084
                     0085    12 board_2_control_reg_a       = 0x0085
                     0086    13 board_2_periph$ddr_reg_b    = 0x0086
                     0087    14 board_2_control_reg_b       = 0x0087
                             15 
                     0088    16 board_3_periph$ddr_reg_a    = 0x0088
                     0089    17 board_3_control_reg_a       = 0x0089
                     008A    18 board_3_periph$ddr_reg_b    = 0x008A
                     008B    19 board_3_control_reg_b       = 0x008B
                             20 
                     008C    21 board_4_periph$ddr_reg_a    = 0x008C
                     008D    22 board_4_control_reg_a       = 0x008D
                     008E    23 board_4_periph$ddr_reg_b    = 0x008E
                     008F    24 board_4_control_reg_b       = 0x008F
                             25 
                     0090    26 board_5_periph$ddr_reg_a    = 0x0090
                     0092    27 board_5_periph$ddr_reg_b    = 0x0092
                             28 
                     0094    29 board_6_periph$ddr_reg_a    = 0x0094
                             30 
                     0098    31 board_7_periph$ddr_reg_a    = 0x0098
                     009A    32 board_7_periph$ddr_reg_b    = 0x009A
                             33 
                     009C    34 board_8_periph$ddr_reg_a    = 0x009C
                     009E    35 board_8_periph$ddr_reg_b    = 0x009E
                             36 
                     0101    37 X0101                       = 0x0101
                     0102    38 X0102                       = 0x0102
                             39 
                     0200    40 U18_PORTA                   = 0x0200
                     0201    41 U18_DDRA                    = 0x0201
                     0202    42 U18_PORTB                   = 0x0202
                     0203    43 U18_DDRB                    = 0x0203
                             44 
                     0204    45 U18_timer                   = 0x0204
                     0204    46 U18_edge_detect_control_DI_neg = 0x0204
                     0205    47 U18_edge_detect_control_DI_pos = 0x0205
                     0206    48 U18_06                      = 0x0206    
                     0215    49 U18_timer_8T_DI             = 0x0215
                     0217    50 X0217 = 0x0217
                     021C    51 U18_1C                      = 0x021C    ; timer div by 1, enable interrupt
                     021D    52 U18_1D                      = 0x021D    ; timer div by 1, disable interrupt
                             53 
                     0280    54 U19_PORTA                   = 0x0280
                     0281    55 U19_DDRA                    = 0x0281
                     0282    56 U19_PORTB                   = 0x0282
                     0283    57 U19_DDRB                    = 0x0283
                     0285    58 U19_edge_detect_control_DI_pos  = 0x0285
                     0286    59 U19_86                      = 0x0286
                             60 
                     0300    61 transport_periph$ddr_reg_a  = 0x0300
                     0301    62 transport_control_reg_a     = 0x0301
                     0302    63 transport_periph$ddr_reg_b  = 0x0302
                     0303    64 transport_control_reg_b     = 0x0303
                             65 
                     0380    66 audio_periph$ddr_reg_a      = 0x0380
                     0381    67 audio_control_reg_a         = 0x0381
                     0382    68 audio_periph$ddr_reg_b      = 0x0382
                     0383    69 audio_control_reg_b         = 0x0383
                             70 
                             71 
                             72 
                             73 
                             74 
                             75 
                             87 
   1000                      88         .org    0x1000
                             89 ;
                             90 ;       IRQ handler
                             91 ;
   1000                      92 IRQ:
   1000 48            [ 3]   93         pha
   1001 AD 05 02      [ 4]   94         lda     U18_edge_detect_control_DI_pos  ; clear PA7 flag
   1004 AD 85 02      [ 4]   95         lda     U19_edge_detect_control_DI_pos  ; clear PA7 flag
   1007 A9 7D         [ 2]   96         lda     #0x7D
   1009 8D 1D 02      [ 4]   97         sta     U18_1D                  ; div by 8, enable interrupt
   100C A5 4B         [ 3]   98         lda     X004B                   ; timer
   100E F0 02         [ 4]   99         beq     L1012
   1010 C6 4B         [ 5]  100         dec     X004B
   1012                     101 L1012:
   1012 A5 4C         [ 3]  102         lda     X004C                   ; timer
   1014 F0 02         [ 4]  103         beq     L1018
   1016 C6 4C         [ 5]  104         dec     X004C
   1018                     105 L1018:
   1018 A5 4D         [ 3]  106         lda     X004D                   ; timer
   101A F0 02         [ 4]  107         beq     L101E
   101C C6 4D         [ 5]  108         dec     X004D
   101E                     109 L101E:
   101E C6 4E         [ 5]  110         dec     X004E                   ; timer
   1020 D0 42         [ 4]  111         bne     L1064
   1022 A9 64         [ 2]  112         lda     #0x64
   1024 85 4E         [ 3]  113         sta     X004E
   1026 A5 4F         [ 3]  114         lda     X004F                   ; timer
   1028 F0 02         [ 4]  115         beq     L102C
   102A C6 4F         [ 5]  116         dec     X004F
   102C                     117 L102C:
   102C A5 50         [ 3]  118         lda     X0050                   ; timer
   102E F0 02         [ 4]  119         beq     L1032
   1030 C6 50         [ 5]  120         dec     X0050
   1032                     121 L1032:
   1032 A5 51         [ 3]  122         lda     X0051                   ; timer
   1034 F0 02         [ 4]  123         beq     L1038
   1036 C6 51         [ 5]  124         dec     X0051
   1038                     125 L1038:
   1038 A5 3E         [ 3]  126         lda     X003E                   ; timer
   103A F0 02         [ 4]  127         beq     L103E
   103C C6 3E         [ 5]  128         dec     X003E
   103E                     129 L103E:
   103E A5 3F         [ 3]  130         lda     X003F                   ; timer
   1040 F0 02         [ 4]  131         beq     L1044
   1042 C6 3F         [ 5]  132         dec     X003F
   1044                     133 L1044:
   1044 A5 40         [ 3]  134         lda     X0040                   ; timer
   1046 F0 02         [ 4]  135         beq     L104A
   1048 C6 40         [ 5]  136         dec     X0040
   104A                     137 L104A:
   104A A5 41         [ 3]  138         lda     X0041                   ; timer
   104C F0 02         [ 4]  139         beq     L1050
   104E C6 41         [ 5]  140         dec     X0041
   1050                     141 L1050:
   1050 A5 42         [ 3]  142         lda     X0042                   ; timer
   1052 F0 02         [ 4]  143         beq     L1056
   1054 C6 42         [ 5]  144         dec     X0042
   1056                     145 L1056:
   1056 C6 52         [ 5]  146         dec     X0052                   ; timer
   1058 D0 0A         [ 4]  147         bne     L1064
   105A A9 64         [ 2]  148         lda     #0x64
   105C 85 52         [ 3]  149         sta     X0052
   105E A5 53         [ 3]  150         lda     X0053                   ; timer
   1060 F0 02         [ 4]  151         beq     L1064
   1062 C6 53         [ 5]  152         dec     X0053
   1064                     153 L1064:
   1064 68            [ 4]  154         pla
   1065 40            [ 6]  155         rti
                            156 ;
                            157 ;       Main Program Start
                            158 ;
   1066                     159 RESET:
   1066 D8            [ 2]  160         cld
   1067 78            [ 2]  161         sei
   1068 A2 F0         [ 2]  162         ldx     #0xF0
   106A 9A            [ 2]  163         txs
   106B A9 00         [ 2]  164         lda     #0x00
   106D A2 10         [ 2]  165         ldx     #0x10
   106F                     166 L106F:
   106F 95 00         [ 4]  167         sta     RAM_start,x
   1071 E8            [ 2]  168         inx
   1072 E0 80         [ 2]  169         cpx     #0x80
   1074 D0 F9         [ 4]  170         bne     L106F
   1076 A9 00         [ 2]  171         lda     #0x00
   1078 8D 01 03      [ 4]  172         sta     transport_control_reg_a
   107B 8D 02 02      [ 4]  173         sta     U18_PORTB
   107E 8D 81 03      [ 4]  174         sta     audio_control_reg_a
   1081 8D 83 03      [ 4]  175         sta     audio_control_reg_b
   1084 8D 05 02      [ 4]  176         sta     U18_edge_detect_control_DI_pos
   1087 8D 85 02      [ 4]  177         sta     U19_edge_detect_control_DI_pos
   108A 8D 06 02      [ 4]  178         sta     U18_06
   108D 8D 86 02      [ 4]  179         sta     U19_86
   1090 8D 03 03      [ 4]  180         sta     transport_control_reg_b
   1093 8D 01 02      [ 4]  181         sta     U18_DDRA
   1096 A9 02         [ 2]  182         lda     #0x02
   1098 8D 81 02      [ 4]  183         sta     U19_DDRA
   109B 8D 80 02      [ 4]  184         sta     U19_PORTA
   109E A9 FF         [ 2]  185         lda     #0xFF
   10A0 8D 82 03      [ 4]  186         sta     audio_periph$ddr_reg_b
   10A3 8D 03 02      [ 4]  187         sta     U18_DDRB
   10A6 8D 83 02      [ 4]  188         sta     U19_DDRB
   10A9 A9 FC         [ 2]  189         lda     #0xFC
   10AB 8D 02 03      [ 4]  190         sta     transport_periph$ddr_reg_b
   10AE A9 2E         [ 2]  191         lda     #0x2E
   10B0 8D 01 03      [ 4]  192         sta     transport_control_reg_a
   10B3 8D 03 03      [ 4]  193         sta     transport_control_reg_b
   10B6 A9 3C         [ 2]  194         lda     #0x3C
   10B8 8D 83 03      [ 4]  195         sta     audio_control_reg_b
   10BB 8D 81 03      [ 4]  196         sta     audio_control_reg_a
   10BE A9 10         [ 2]  197         lda     #0x10
   10C0 8D 82 03      [ 4]  198         sta     audio_periph$ddr_reg_b
   10C3 8D 82 02      [ 4]  199         sta     U19_PORTB
   10C6 A9 00         [ 2]  200         lda     #0x00
   10C8 85 5E         [ 3]  201         sta     X005E
   10CA A9 64         [ 2]  202         lda     #0x64
   10CC 85 4E         [ 3]  203         sta     X004E
   10CE 58            [ 2]  204         cli
   10CF 8D 1C 02      [ 4]  205         sta     U18_1C
   10D2 A9 09         [ 2]  206         lda     #0x09
   10D4 8D 02 01      [ 4]  207         sta     X0102
   10D7 20 FC 18      [ 6]  208         jsr     L18FC
   10DA 20 99 16      [ 6]  209         jsr     L1699
   10DD A9 02         [ 2]  210         lda     #0x02
   10DF 8D 80 02      [ 4]  211         sta     U19_PORTA
   10E2 A9 33         [ 2]  212         lda     #0x33
   10E4 20 0F 17      [ 6]  213         jsr     L170F
   10E7 A9 10         [ 2]  214         lda     #0x10
   10E9 20 8C 15      [ 6]  215         jsr     L158C
   10EC A9 28         [ 2]  216         lda     #0x28
   10EE 85 4F         [ 3]  217         sta     X004F
   10F0                     218 L10F0:
   10F0 20 39 19      [ 6]  219         jsr     L1939
   10F3 A5 4F         [ 3]  220         lda     X004F
   10F5 D0 F9         [ 4]  221         bne     L10F0
   10F7 20 99 16      [ 6]  222         jsr     L1699
   10FA 20 AA 18      [ 6]  223         jsr     L18AA
   10FD AD 00 02      [ 4]  224         lda     U18_PORTA
   1100 49 FF         [ 2]  225         eor     #0xFF
   1102 C9 10         [ 2]  226         cmp     #0x10
   1104 D0 15         [ 4]  227         bne     L111B
   1106 A9 FF         [ 2]  228         lda     #0xFF
   1108 85 98         [ 3]  229         sta     board_7_periph$ddr_reg_a
   110A 85 9A         [ 3]  230         sta     board_7_periph$ddr_reg_b
   110C 85 9C         [ 3]  231         sta     board_8_periph$ddr_reg_a
   110E 85 9E         [ 3]  232         sta     board_8_periph$ddr_reg_b
   1110 8D 02 02      [ 4]  233         sta     U18_PORTB
   1113                     234 L1113:
   1113 A9 32         [ 2]  235         lda     #0x32
   1115 20 0F 17      [ 6]  236         jsr     L170F
   1118 4C 13 11      [ 3]  237         jmp     L1113
                            238 ;
   111B                     239 L111B:
   111B A9 40         [ 2]  240         lda     #0x40
   111D 20 8C 15      [ 6]  241         jsr     L158C
   1120 A5 55         [ 3]  242         lda     X0055
   1122 8D 82 02      [ 4]  243         sta     U19_PORTB
   1125                     244 L1125:
   1125 A9 00         [ 2]  245         lda     #0x00
   1127 85 59         [ 3]  246         sta     X0059
   1129                     247 L1129:
   1129 AD 02 03      [ 4]  248         lda     transport_periph$ddr_reg_b
   112C A9 0A         [ 2]  249         lda     #0x0A
   112E 85 4B         [ 3]  250         sta     X004B
   1130 E6 59         [ 5]  251         inc     X0059
   1132 A5 59         [ 3]  252         lda     X0059
   1134 C9 64         [ 2]  253         cmp     #0x64
   1136 B0 0F         [ 4]  254         bcs     L1147
   1138                     255 L1138:
   1138 20 39 19      [ 6]  256         jsr     L1939
   113B A5 4B         [ 3]  257         lda     X004B
   113D F0 E6         [ 4]  258         beq     L1125
   113F AD 03 03      [ 4]  259         lda     transport_control_reg_b
   1142 10 F4         [ 4]  260         bpl     L1138
   1144 4C 29 11      [ 3]  261         jmp     L1129
                            262 ;
   1147                     263 L1147:
   1147 A9 20         [ 2]  264         lda     #0x20
   1149 20 8C 15      [ 6]  265         jsr     L158C
   114C A9 19         [ 2]  266         lda     #0x19
   114E 85 4F         [ 3]  267         sta     X004F
   1150                     268 L1150:
   1150 20 39 19      [ 6]  269         jsr     L1939
   1153 A5 4F         [ 3]  270         lda     X004F
   1155 D0 F9         [ 4]  271         bne     L1150
   1157 A9 00         [ 2]  272         lda     #0x00
   1159 85 55         [ 3]  273         sta     X0055
   115B A9 01         [ 2]  274         lda     #0x01
   115D 85 56         [ 3]  275         sta     X0056
   115F 85 57         [ 3]  276         sta     X0057
   1161 20 C7 14      [ 6]  277         jsr     L14C7
   1164 A9 80         [ 2]  278         lda     #0x80
   1166 20 8C 15      [ 6]  279         jsr     L158C
   1169 20 2C 15      [ 6]  280         jsr     L152C
   116C A9 96         [ 2]  281         lda     #0x96
   116E 85 4F         [ 3]  282         sta     X004F
   1170 A9 80         [ 2]  283         lda     #0x80
   1172 20 8C 15      [ 6]  284         jsr     L158C
   1175 20 8C 15      [ 6]  285         jsr     L158C
   1178                     286 L1178:
   1178 20 F1 11      [ 6]  287         jsr     L11F1
   117B C9 24         [ 2]  288         cmp     #0x24
   117D D0 F9         [ 4]  289         bne     L1178
   117F                     290 L117F:
   117F 20 F1 11      [ 6]  291         jsr     L11F1
   1182 C9 24         [ 2]  292         cmp     #0x24
   1184 F0 F9         [ 4]  293         beq     L117F
   1186 29 3F         [ 2]  294         and     #0x3F
   1188 C5 56         [ 3]  295         cmp     X0056
   118A F0 07         [ 4]  296         beq     L1193
   118C 4C 66 10      [ 3]  297         jmp     RESET
                            298 ;
   118F A9 00         [ 2]  299         lda     #0x00
   1191 85 49         [ 3]  300         sta     X0049
   1193                     301 L1193:
   1193 20 F1 11      [ 6]  302         jsr     L11F1
   1196 C9 28         [ 2]  303         cmp     #0x28
   1198 D0 F9         [ 4]  304         bne     L1193
   119A 20 F1 11      [ 6]  305         jsr     L11F1
   119D C9 47         [ 2]  306         cmp     #0x47
   119F 90 2B         [ 4]  307         bcc     L11CC
   11A1 C9 5A         [ 2]  308         cmp     #0x5A
   11A3 B0 27         [ 4]  309         bcs     L11CC
   11A5 29 1F         [ 2]  310         and     #0x1F
   11A7 A2 00         [ 2]  311         ldx     #0x00
   11A9 A0 00         [ 2]  312         ldy     #0x00
   11AB                     313 L11AB:
   11AB 95 70         [ 4]  314         sta     X0070,x
   11AD E8            [ 2]  315         inx
   11AE 20 F1 11      [ 6]  316         jsr     L11F1
   11B1 D9 E9 11      [ 5]  317         cmp     X11E9,y
   11B4 F0 F5         [ 4]  318         beq     L11AB
   11B6 C8            [ 2]  319         iny
   11B7 D9 E9 11      [ 5]  320         cmp     X11E9,y
   11BA D0 10         [ 4]  321         bne     L11CC
   11BC C0 07         [ 2]  322         cpy     #0x07
   11BE D0 EB         [ 4]  323         bne     L11AB
   11C0 CA            [ 2]  324         dex
   11C1 E4 70         [ 3]  325         cpx     X0070
   11C3 D0 07         [ 4]  326         bne     L11CC
   11C5 A9 00         [ 2]  327         lda     #0x00
   11C7 85 49         [ 3]  328         sta     X0049
   11C9 4C 11 12      [ 3]  329         jmp     L1211
                            330 ;
   11CC                     331 L11CC:
   11CC A5 49         [ 3]  332         lda     X0049
   11CE F0 12         [ 4]  333         beq     L11E2
   11D0                     334 L11D0:
   11D0 A9 FF         [ 2]  335         lda     #0xFF
   11D2 85 49         [ 3]  336         sta     X0049
   11D4 8D 02 02      [ 4]  337         sta     U18_PORTB
   11D7 8D 82 02      [ 4]  338         sta     U19_PORTB
   11DA A9 10         [ 2]  339         lda     #0x10
   11DC 20 8C 15      [ 6]  340         jsr     L158C
   11DF 4C D0 11      [ 3]  341         jmp     L11D0
                            342 ;
   11E2                     343 L11E2:
   11E2 A9 80         [ 2]  344         lda     #0x80
   11E4 85 49         [ 3]  345         sta     X0049
   11E6 4C 93 11      [ 3]  346         jmp     L1193
                            347 ;
   11E9                     348 X11E9:
   11E9 44 52 42 43 53 49   349         .ascii  "DRBCSIR)"
        52 29
                            350 ;
   11F1                     351 L11F1:
   11F1 A5 4F         [ 3]  352         lda     X004F
   11F3 F0 0B         [ 4]  353         beq     L1200
   11F5 AD 01 03      [ 4]  354         lda     transport_control_reg_a             ; Wait for Transport Byte
   11F8 10 F7         [ 4]  355         bpl     L11F1
   11FA AD 00 03      [ 4]  356         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   11FD 29 7F         [ 2]  357         and     #0x7F
   11FF 60            [ 6]  358         rts
                            359 ;
   1200                     360 L1200:
   1200 A5 49         [ 3]  361         lda     X0049
   1202 F0 03         [ 4]  362         beq     L1207
   1204 4C D0 11      [ 3]  363         jmp     L11D0
                            364 ;
   1207                     365 L1207:
   1207 A9 0F         [ 2]  366         lda     #0x0F
   1209 85 49         [ 3]  367         sta     X0049
   120B A9 02         [ 2]  368         lda     #0x02
   120D 85 57         [ 3]  369         sta     X0057
   120F 68            [ 4]  370         pla
   1210 68            [ 4]  371         pla
   1211                     372 L1211:
   1211 20 FC 18      [ 6]  373         jsr     L18FC
   1214 A9 02         [ 2]  374         lda     #0x02
   1216 85 56         [ 3]  375         sta     X0056
   1218 20 C7 14      [ 6]  376         jsr     L14C7
   121B A9 00         [ 2]  377         lda     #0x00
   121D 8D 80 02      [ 4]  378         sta     U19_PORTA
   1220 A9 00         [ 2]  379         lda     #0x00
   1222 85 63         [ 3]  380         sta     X0063
   1224                     381 L1224:
   1224 A9 18         [ 2]  382         lda     #0x18
   1226 85 53         [ 3]  383         sta     X0053
   1228                     384 L1228:
   1228 A9 0A         [ 2]  385         lda     #0x0A
   122A 85 4F         [ 3]  386         sta     X004F
   122C                     387 L122C:
   122C 20 39 19      [ 6]  388         jsr     L1939
   122F A5 63         [ 3]  389         lda     X0063
   1231 30 03         [ 4]  390         bmi     L1236
   1233 20 33 16      [ 6]  391         jsr     L1633
   1236                     392 L1236:
   1236 A5 6B         [ 3]  393         lda     X006B
   1238 30 47         [ 4]  394         bmi     L1281
   123A D0 11         [ 4]  395         bne     L124D
   123C A9 64         [ 2]  396         lda     #0x64
   123E 85 50         [ 3]  397         sta     X0050
   1240 A9 80         [ 2]  398         lda     #0x80
   1242 20 8C 15      [ 6]  399         jsr     L158C
   1245 A9 03         [ 2]  400         lda     #0x03
   1247 85 6B         [ 3]  401         sta     X006B
   1249 A9 A0         [ 2]  402         lda     #0xA0
   124B 85 4C         [ 3]  403         sta     X004C
   124D                     404 L124D:
   124D A5 6B         [ 3]  405         lda     X006B
   124F 6A            [ 2]  406         ror     a
   1250 90 0B         [ 4]  407         bcc     L125D
   1252 A5 50         [ 3]  408         lda     X0050
   1254 D0 07         [ 4]  409         bne     L125D
   1256 A9 02         [ 2]  410         lda     #0x02
   1258 85 6B         [ 3]  411         sta     X006B
   125A 4C 74 12      [ 3]  412         jmp     L1274
                            413 ;
   125D                     414 L125D:
   125D AD 02 03      [ 4]  415         lda     transport_periph$ddr_reg_b
   1260 6A            [ 2]  416         ror     a
   1261 B0 04         [ 4]  417         bcs     L1267
   1263 A9 A0         [ 2]  418         lda     #0xA0
   1265 85 4C         [ 3]  419         sta     X004C
   1267                     420 L1267:
   1267 A5 4C         [ 3]  421         lda     X004C
   1269 D0 11         [ 4]  422         bne     L127C
   126B A9 10         [ 2]  423         lda     #0x10
   126D 20 8C 15      [ 6]  424         jsr     L158C
   1270 A9 80         [ 2]  425         lda     #0x80
   1272 85 6B         [ 3]  426         sta     X006B
   1274                     427 L1274:
   1274 A9 80         [ 2]  428         lda     #0x80
   1276 2D 02 02      [ 4]  429         and     U18_PORTB
   1279 8D 02 02      [ 4]  430         sta     U18_PORTB
   127C                     431 L127C:
   127C A5 6B         [ 3]  432         lda     X006B
   127E 6A            [ 2]  433         ror     a
   127F B0 AB         [ 4]  434         bcs     L122C
   1281                     435 L1281:
   1281 20 A9 15      [ 6]  436         jsr     L15A9
   1284 20 00 16      [ 6]  437         jsr     L1600
   1287 A5 5A         [ 3]  438         lda     X005A
   1289 D0 A1         [ 4]  439         bne     L122C
   128B AD 02 02      [ 4]  440         lda     U18_PORTB
   128E 10 94         [ 4]  441         bpl     L1224
   1290 2A            [ 2]  442         rol     a
   1291 2A            [ 2]  443         rol     a
   1292 90 03         [ 4]  444         bcc     L1297
   1294 4C 64 13      [ 3]  445         jmp     L1364
                            446 ;
   1297                     447 L1297:
   1297 2A            [ 2]  448         rol     a
   1298 90 03         [ 4]  449         bcc     L129D
   129A 4C 15 13      [ 3]  450         jmp     L1315
                            451 ;
   129D                     452 L129D:
   129D 2A            [ 2]  453         rol     a
   129E 90 03         [ 4]  454         bcc     L12A3
   12A0 4C C4 12      [ 3]  455         jmp     L12C4
                            456 ;
   12A3                     457 L12A3:
   12A3 29 F0         [ 2]  458         and     #0xF0
   12A5 F0 03         [ 4]  459         beq     L12AA
   12A7 4C 6D 13      [ 3]  460         jmp     L136D
                            461 ;
   12AA                     462 L12AA:
   12AA 20 CD 16      [ 6]  463         jsr     L16CD
   12AD A5 32         [ 3]  464         lda     X0032
   12AF C9 01         [ 2]  465         cmp     #0x01
   12B1 F0 0E         [ 4]  466         beq     L12C1
   12B3 20 AA 18      [ 6]  467         jsr     L18AA
   12B6 A9 40         [ 2]  468         lda     #0x40
   12B8 85 92         [ 3]  469         sta     board_5_periph$ddr_reg_b
   12BA A5 53         [ 3]  470         lda     X0053
   12BC F0 57         [ 4]  471         beq     L1315
   12BE 4C 2C 12      [ 3]  472         jmp     L122C
   12C1                     473 L12C1:
   12C1 4C 24 12      [ 3]  474         jmp     L1224
                            475 ;
   12C4                     476 L12C4:
   12C4 A9 01         [ 2]  477         lda     #0x01
   12C6 85 56         [ 3]  478         sta     X0056
   12C8 20 C7 14      [ 6]  479         jsr     L14C7
   12CB 20 2C 15      [ 6]  480         jsr     L152C
   12CE 20 3F 17      [ 6]  481         jsr     L173F
   12D1 E6 56         [ 5]  482         inc     X0056
   12D3 20 D7 14      [ 6]  483         jsr     L14D7
   12D6 4C 24 12      [ 3]  484         jmp     L1224
                            485 ;
   12D9                     486 L12D9:
   12D9 E6 31         [ 5]  487         inc     X0031
   12DB 20 CD 16      [ 6]  488         jsr     L16CD
   12DE A5 32         [ 3]  489         lda     X0032
   12E0 C9 02         [ 2]  490         cmp     #0x02
   12E2 F0 03         [ 4]  491         beq     L12E7
   12E4 4C 2C 12      [ 3]  492         jmp     L122C
                            493 ;
   12E7                     494 L12E7:
   12E7 A9 31         [ 2]  495         lda     #0x31
   12E9 20 0F 17      [ 6]  496         jsr     L170F
   12EC A9 28         [ 2]  497         lda     #0x28
   12EE 85 4F         [ 3]  498         sta     X004F
   12F0                     499 L12F0:
   12F0 20 39 19      [ 6]  500         jsr     L1939
   12F3 A5 4F         [ 3]  501         lda     X004F
   12F5 D0 F9         [ 4]  502         bne     L12F0
   12F7 20 CD 16      [ 6]  503         jsr     L16CD
   12FA A5 32         [ 3]  504         lda     X0032
   12FC C9 01         [ 2]  505         cmp     #0x01
   12FE F0 03         [ 4]  506         beq     L1303
   1300 4C 2C 12      [ 3]  507         jmp     L122C
                            508 ;
   1303                     509 L1303:
   1303 AD 02 02      [ 4]  510         lda     U18_PORTB
   1306 29 80         [ 2]  511         and     #0x80
   1308 8D 02 02      [ 4]  512         sta     U18_PORTB
   130B 20 B5 18      [ 6]  513         jsr     L18B5
   130E A9 41         [ 2]  514         lda     #0x41
   1310 85 92         [ 3]  515         sta     board_5_periph$ddr_reg_b
   1312 4C 24 12      [ 3]  516         jmp     L1224
                            517 ;
   1315                     518 L1315:
   1315 A5 31         [ 3]  519         lda     X0031
   1317 F0 C0         [ 4]  520         beq     L12D9
   1319 A5 49         [ 3]  521         lda     X0049
   131B C9 0F         [ 2]  522         cmp     #0x0F
   131D F0 57         [ 4]  523         beq     L1376
   131F A9 52         [ 2]  524         lda     #0x52
   1321 85 4A         [ 3]  525         sta     X004A
   1323 A6 44         [ 3]  526         ldx     X0044
   1325 20 B7 14      [ 6]  527         jsr     L14B7
   1328 86 44         [ 3]  528         stx     X0044
   132A A9 A0         [ 2]  529         lda     #0xA0
   132C 8D 02 02      [ 4]  530         sta     U18_PORTB
   132F 20 C7 14      [ 6]  531         jsr     L14C7
   1332 20 2C 15      [ 6]  532         jsr     L152C
   1335                     533 L1335:
   1335 20 39 19      [ 6]  534         jsr     L1939
   1338 20 CD 16      [ 6]  535         jsr     L16CD
   133B A5 32         [ 3]  536         lda     X0032
   133D C9 02         [ 2]  537         cmp     #0x02
   133F F0 04         [ 4]  538         beq     L1345
   1341 C9 01         [ 2]  539         cmp     #0x01
   1343 F0 F0         [ 4]  540         beq     L1335
   1345                     541 L1345:
   1345 A9 00         [ 2]  542         lda     #0x00
   1347 85 31         [ 3]  543         sta     X0031
   1349 20 3F 17      [ 6]  544         jsr     L173F
   134C                     545 L134C:
   134C A5 56         [ 3]  546         lda     X0056
   134E C5 70         [ 3]  547         cmp     X0070
   1350 B0 08         [ 4]  548         bcs     L135A
   1352 E6 56         [ 5]  549         inc     X0056
   1354 20 D7 14      [ 6]  550         jsr     L14D7
   1357 4C 24 12      [ 3]  551         jmp     L1224
                            552 ;
   135A                     553 L135A:
   135A A9 02         [ 2]  554         lda     #0x02
   135C 85 56         [ 3]  555         sta     X0056
   135E 20 F0 14      [ 6]  556         jsr     L14F0
   1361 4C 24 12      [ 3]  557         jmp     L1224
                            558 ;
   1364                     559 L1364:
   1364 A5 49         [ 3]  560         lda     X0049
   1366 C9 0F         [ 2]  561         cmp     #0x0F
   1368 F0 32         [ 4]  562         beq     L139C
   136A 4C 4C 13      [ 3]  563         jmp     L134C
                            564 ;
   136D                     565 L136D:
   136D A5 49         [ 3]  566         lda     X0049
   136F C9 0F         [ 2]  567         cmp     #0x0F
   1371 F0 58         [ 4]  568         beq     L13CB
   1373 4C 61 14      [ 3]  569         jmp     L1461
                            570 ;
   1376                     571 L1376:
   1376 A9 A0         [ 2]  572         lda     #0xA0
   1378 8D 02 02      [ 4]  573         sta     U18_PORTB
   137B A5 57         [ 3]  574         lda     X0057
   137D 85 56         [ 3]  575         sta     X0056
   137F 20 C7 14      [ 6]  576         jsr     L14C7
   1382 20 2C 15      [ 6]  577         jsr     L152C
   1385                     578 L1385:
   1385 20 39 19      [ 6]  579         jsr     L1939
   1388 20 CD 16      [ 6]  580         jsr     L16CD
   138B A5 32         [ 3]  581         lda     X0032
   138D C9 02         [ 2]  582         cmp     #0x02
   138F F0 04         [ 4]  583         beq     L1395
   1391 C9 01         [ 2]  584         cmp     #0x01
   1393 F0 F0         [ 4]  585         beq     L1385
   1395                     586 L1395:
   1395 A9 00         [ 2]  587         lda     #0x00
   1397 85 31         [ 3]  588         sta     X0031
   1399 20 3F 17      [ 6]  589         jsr     L173F
   139C                     590 L139C:
   139C A5 57         [ 3]  591         lda     X0057
   139E C5 56         [ 3]  592         cmp     X0056
   13A0 D0 21         [ 4]  593         bne     L13C3
   13A2 E6 57         [ 5]  594         inc     X0057
   13A4 A5 57         [ 3]  595         lda     X0057
   13A6 C9 06         [ 2]  596         cmp     #0x06
   13A8 F0 14         [ 4]  597         beq     L13BE
   13AA C9 10         [ 2]  598         cmp     #0x10
   13AC F0 10         [ 4]  599         beq     L13BE
   13AE C9 1A         [ 2]  600         cmp     #0x1A
   13B0 D0 11         [ 4]  601         bne     L13C3
   13B2 A9 02         [ 2]  602         lda     #0x02
   13B4 85 57         [ 3]  603         sta     X0057
   13B6 A9 02         [ 2]  604         lda     #0x02
   13B8 8D 80 02      [ 4]  605         sta     U19_PORTA
   13BB 4C 11 12      [ 3]  606         jmp     L1211
                            607 ;
   13BE                     608 L13BE:
   13BE 18            [ 2]  609         clc
   13BF 69 06         [ 2]  610         adc     #0x06
   13C1 85 57         [ 3]  611         sta     X0057
   13C3                     612 L13C3:
   13C3 E6 56         [ 5]  613         inc     X0056
   13C5 20 D7 14      [ 6]  614         jsr     L14D7
   13C8 4C 24 12      [ 3]  615         jmp     L1224
                            616 ;
   13CB                     617 L13CB:
   13CB AD 02 02      [ 4]  618         lda     U18_PORTB
   13CE 85 5C         [ 3]  619         sta     X005C
   13D0 29 0F         [ 2]  620         and     #0x0F
   13D2 85 5D         [ 3]  621         sta     X005D
   13D4 6A            [ 2]  622         ror     a
   13D5 90 04         [ 4]  623         bcc     L13DB
   13D7 A9 09         [ 2]  624         lda     #0x09
   13D9 D0 1F         [ 4]  625         bne     L13FA
   13DB                     626 L13DB:
   13DB 6A            [ 2]  627         ror     a
   13DC 90 13         [ 4]  628         bcc     L13F1
   13DE 18            [ 2]  629         clc
   13DF A9 06         [ 2]  630         lda     #0x06
   13E1 65 58         [ 3]  631         adc     X0058
   13E3 E6 58         [ 5]  632         inc     X0058
   13E5 A6 58         [ 3]  633         ldx     X0058
   13E7 E0 03         [ 2]  634         cpx     #0x03
   13E9 90 0F         [ 4]  635         bcc     L13FA
   13EB A2 00         [ 2]  636         ldx     #0x00
   13ED 86 58         [ 3]  637         stx     X0058
   13EF F0 09         [ 4]  638         beq     L13FA
   13F1                     639 L13F1:
   13F1 6A            [ 2]  640         ror     a
   13F2 90 04         [ 4]  641         bcc     L13F8
   13F4 A9 0B         [ 2]  642         lda     #0x0B
   13F6 D0 02         [ 4]  643         bne     L13FA
   13F8                     644 L13F8:
   13F8 A9 0A         [ 2]  645         lda     #0x0A
   13FA                     646 L13FA:
   13FA A6 57         [ 3]  647         ldx     X0057
   13FC E0 0E         [ 2]  648         cpx     #0x0E
   13FE 90 03         [ 4]  649         bcc     L1403
   1400 18            [ 2]  650         clc
   1401 69 0A         [ 2]  651         adc     #0x0A
   1403                     652 L1403:
   1403 85 56         [ 3]  653         sta     X0056
   1405                     654 L1405:
   1405 20 C7 14      [ 6]  655         jsr     L14C7
   1408 20 2C 15      [ 6]  656         jsr     L152C
   140B 20 AA 18      [ 6]  657         jsr     L18AA
   140E                     658 L140E:
   140E 20 39 19      [ 6]  659         jsr     L1939
   1411 20 CD 16      [ 6]  660         jsr     L16CD
   1414 A5 32         [ 3]  661         lda     X0032
   1416 C9 02         [ 2]  662         cmp     #0x02
   1418 F0 04         [ 4]  663         beq     L141E
   141A C9 01         [ 2]  664         cmp     #0x01
   141C F0 F0         [ 4]  665         beq     L140E
   141E                     666 L141E:
   141E A9 3C         [ 2]  667         lda     #0x3C
   1420 85 53         [ 3]  668         sta     X0053
   1422                     669 L1422:
   1422 A9 FA         [ 2]  670         lda     #0xFA
   1424 85 4C         [ 3]  671         sta     X004C
   1426                     672 L1426:
   1426 20 A9 15      [ 6]  673         jsr     L15A9
   1429 A5 5A         [ 3]  674         lda     X005A
   142B D0 15         [ 4]  675         bne     L1442
   142D A5 53         [ 3]  676         lda     X0053
   142F F0 22         [ 4]  677         beq     L1453
   1431 20 39 19      [ 6]  678         jsr     L1939
   1434 A5 4C         [ 3]  679         lda     X004C
   1436 D0 EE         [ 4]  680         bne     L1426
   1438 AD 02 02      [ 4]  681         lda     U18_PORTB
   143B 45 5D         [ 3]  682         eor     X005D
   143D 8D 02 02      [ 4]  683         sta     U18_PORTB
   1440 D0 E0         [ 4]  684         bne     L1422
   1442                     685 L1442:
   1442 20 39 19      [ 6]  686         jsr     L1939
   1445 20 A9 15      [ 6]  687         jsr     L15A9
   1448 A5 5A         [ 3]  688         lda     X005A
   144A D0 F6         [ 4]  689         bne     L1442
   144C AD 02 02      [ 4]  690         lda     U18_PORTB
   144F C5 5C         [ 3]  691         cmp     X005C
   1451 F0 03         [ 4]  692         beq     L1456
   1453                     693 L1453:
   1453 4C 28 12      [ 3]  694         jmp     L1228
                            695 ;
   1456                     696 L1456:
   1456 20 3F 17      [ 6]  697         jsr     L173F
   1459 E6 56         [ 5]  698         inc     X0056
   145B 20 D7 14      [ 6]  699         jsr     L14D7
   145E 4C 24 12      [ 3]  700         jmp     L1224
                            701 ;
   1461                     702 L1461:
   1461 AD 02 02      [ 4]  703         lda     U18_PORTB
   1464 85 5C         [ 3]  704         sta     X005C
   1466 29 0F         [ 2]  705         and     #0x0F
   1468 85 5D         [ 3]  706         sta     X005D
   146A 6A            [ 2]  707         ror     a
   146B 90 03         [ 4]  708         bcc     L1470
   146D 4C 8D 14      [ 3]  709         jmp     L148D
                            710 ;
   1470                     711 L1470:
   1470 6A            [ 2]  712         ror     a
   1471 90 03         [ 4]  713         bcc     L1476
   1473 4C 7F 14      [ 3]  714         jmp     L147F
                            715 ;
   1476                     716 L1476:
   1476 6A            [ 2]  717         ror     a
   1477 90 03         [ 4]  718         bcc     L147C
   1479 4C A9 14      [ 3]  719         jmp     L14A9
   147C                     720 L147C:
   147C 4C 9B 14      [ 3]  721         jmp     L149B
                            722 ;
   147F                     723 L147F:
   147F A9 42         [ 2]  724         lda     #0x42
   1481 85 4A         [ 3]  725         sta     X004A
   1483 A6 45         [ 3]  726         ldx     X0045
   1485 20 B7 14      [ 6]  727         jsr     L14B7
   1488 86 45         [ 3]  728         stx     X0045
   148A 4C 05 14      [ 3]  729         jmp     L1405
                            730 ;
   148D                     731 L148D:
   148D A9 43         [ 2]  732         lda     #0x43
   148F 85 4A         [ 3]  733         sta     X004A
   1491 A6 46         [ 3]  734         ldx     X0046
   1493 20 B7 14      [ 6]  735         jsr     L14B7
   1496 86 46         [ 3]  736         stx     X0046
   1498 4C 05 14      [ 3]  737         jmp     L1405
                            738 ;
   149B                     739 L149B:
   149B A9 53         [ 2]  740         lda     #0x53
   149D 85 4A         [ 3]  741         sta     X004A
   149F A6 47         [ 3]  742         ldx     X0047
   14A1 20 B7 14      [ 6]  743         jsr     L14B7
   14A4 86 47         [ 3]  744         stx     X0047
   14A6 4C 05 14      [ 3]  745         jmp     L1405
                            746 ;
   14A9                     747 L14A9:
   14A9 A9 49         [ 2]  748         lda     #0x49
   14AB 85 4A         [ 3]  749         sta     X004A
   14AD A6 48         [ 3]  750         ldx     X0048
   14AF 20 B7 14      [ 6]  751         jsr     L14B7
   14B2 86 48         [ 3]  752         stx     X0048
   14B4 4C 05 14      [ 3]  753         jmp     L1405
                            754 ;
   14B7                     755 L14B7:
   14B7 E8            [ 2]  756         inx
   14B8 E0 1F         [ 2]  757         cpx     #0x1F
   14BA D0 02         [ 4]  758         bne     L14BE
   14BC A2 02         [ 2]  759         ldx     #0x02
   14BE                     760 L14BE:
   14BE B5 70         [ 4]  761         lda     X0070,x
   14C0 C5 4A         [ 3]  762         cmp     X004A
   14C2 D0 F3         [ 4]  763         bne     L14B7
   14C4 86 56         [ 3]  764         stx     X0056
   14C6 60            [ 6]  765         rts
                            766 ;
   14C7                     767 L14C7:
   14C7 A5 56         [ 3]  768         lda     X0056
   14C9 C5 55         [ 3]  769         cmp     X0055
   14CB 90 06         [ 4]  770         bcc     L14D3
   14CD F0 03         [ 4]  771         beq     L14D2
   14CF 20 D7 14      [ 6]  772         jsr     L14D7
   14D2                     773 L14D2:
   14D2 60            [ 6]  774         rts
                            775 ;
   14D3                     776 L14D3:
   14D3 20 F0 14      [ 6]  777         jsr     L14F0
   14D6 60            [ 6]  778         rts
                            779 ;
   14D7                     780 L14D7:
   14D7 A9 20         [ 2]  781         lda     #0x20
   14D9 20 8C 15      [ 6]  782         jsr     L158C
   14DC 20 64 15      [ 6]  783         jsr     L1564
   14DF E6 55         [ 5]  784         inc     X0055
   14E1 A5 55         [ 3]  785         lda     X0055
   14E3 8D 82 02      [ 4]  786         sta     U19_PORTB
   14E6 A5 56         [ 3]  787         lda     X0056
   14E8 C5 55         [ 3]  788         cmp     X0055
   14EA D0 EB         [ 4]  789         bne     L14D7
   14EC 20 0B 15      [ 6]  790         jsr     L150B
   14EF 60            [ 6]  791         rts
                            792 ;
   14F0                     793 L14F0:
   14F0 E6 55         [ 5]  794         inc     X0055
   14F2                     795 L14F2:
   14F2 A9 40         [ 2]  796         lda     #0x40
   14F4 20 8C 15      [ 6]  797         jsr     L158C
   14F7 20 64 15      [ 6]  798         jsr     L1564
   14FA C6 55         [ 5]  799         dec     X0055
   14FC A5 55         [ 3]  800         lda     X0055
   14FE 8D 82 02      [ 4]  801         sta     U19_PORTB
   1501 A5 56         [ 3]  802         lda     X0056
   1503 C5 55         [ 3]  803         cmp     X0055
   1505 D0 EB         [ 4]  804         bne     L14F2
   1507 20 1E 15      [ 6]  805         jsr     L151E
   150A 60            [ 6]  806         rts
                            807 ;
   150B                     808 L150B:
   150B A9 40         [ 2]  809         lda     #0x40
   150D 20 8C 15      [ 6]  810         jsr     L158C
   1510 20 64 15      [ 6]  811         jsr     L1564
   1513 A9 03         [ 2]  812         lda     #0x03
   1515 85 4F         [ 3]  813         sta     X004F
   1517                     814 L1517:
   1517 20 39 19      [ 6]  815         jsr     L1939
   151A A5 4F         [ 3]  816         lda     X004F
   151C D0 F9         [ 4]  817         bne     L1517
   151E                     818 L151E:
   151E A9 20         [ 2]  819         lda     #0x20
   1520 20 8C 15      [ 6]  820         jsr     L158C
   1523 20 64 15      [ 6]  821         jsr     L1564
   1526 A9 10         [ 2]  822         lda     #0x10
   1528 20 8C 15      [ 6]  823         jsr     L158C
   152B 60            [ 6]  824         rts
                            825 ;
   152C                     826 L152C:
   152C A5 6B         [ 3]  827         lda     X006B
   152E 30 33         [ 4]  828         bmi     L1563
   1530 A9 80         [ 2]  829         lda     #0x80
   1532 20 8C 15      [ 6]  830         jsr     L158C
   1535 A9 FA         [ 2]  831         lda     #0xFA
   1537 85 4B         [ 3]  832         sta     X004B
   1539                     833 L1539:
   1539 20 39 19      [ 6]  834         jsr     L1939
   153C A5 4B         [ 3]  835         lda     X004B
   153E D0 F9         [ 4]  836         bne     L1539
   1540                     837 L1540:
   1540 20 39 19      [ 6]  838         jsr     L1939
   1543 AD 02 03      [ 4]  839         lda     transport_periph$ddr_reg_b
   1546 6A            [ 2]  840         ror     a
   1547 90 F7         [ 4]  841         bcc     L1540
   1549 A9 A0         [ 2]  842         lda     #0xA0
   154B 85 4B         [ 3]  843         sta     X004B
   154D                     844 L154D:
   154D AD 02 03      [ 4]  845         lda     transport_periph$ddr_reg_b
   1550 6A            [ 2]  846         ror     a
   1551 90 E6         [ 4]  847         bcc     L1539
   1553 20 39 19      [ 6]  848         jsr     L1939
   1556 A5 4B         [ 3]  849         lda     X004B
   1558 D0 F3         [ 4]  850         bne     L154D
   155A A9 10         [ 2]  851         lda     #0x10
   155C 20 8C 15      [ 6]  852         jsr     L158C
   155F A9 80         [ 2]  853         lda     #0x80
   1561 85 6B         [ 3]  854         sta     X006B
   1563                     855 L1563:
   1563 60            [ 6]  856         rts
                            857 ;
   1564                     858 L1564:
   1564 A5 55         [ 3]  859         lda     X0055
   1566 8D 82 02      [ 4]  860         sta     U19_PORTB
   1569                     861 L1569:
   1569 A9 00         [ 2]  862         lda     #0x00
   156B 85 59         [ 3]  863         sta     X0059
   156D                     864 L156D:
   156D AD 02 03      [ 4]  865         lda     transport_periph$ddr_reg_b
   1570 A9 14         [ 2]  866         lda     #0x14
   1572 85 4B         [ 3]  867         sta     X004B
   1574 E6 59         [ 5]  868         inc     X0059
   1576 A5 59         [ 3]  869         lda     X0059
   1578 C9 21         [ 2]  870         cmp     #0x21
   157A B0 0F         [ 4]  871         bcs     L158B
   157C                     872 L157C:
   157C 20 39 19      [ 6]  873         jsr     L1939
   157F A5 4B         [ 3]  874         lda     X004B
   1581 F0 E6         [ 4]  875         beq     L1569
   1583 AD 03 03      [ 4]  876         lda     transport_control_reg_b
   1586 10 F4         [ 4]  877         bpl     L157C
   1588 4C 6D 15      [ 3]  878         jmp     L156D
   158B                     879 L158B:
   158B 60            [ 6]  880         rts
                            881 ;
   158C                     882 L158C:
   158C 8D 02 03      [ 4]  883         sta     transport_periph$ddr_reg_b
   158F A9 FA         [ 2]  884         lda     #0xFA
   1591 85 4B         [ 3]  885         sta     X004B
   1593                     886 L1593:
   1593 20 39 19      [ 6]  887         jsr     L1939
   1596 A5 4B         [ 3]  888         lda     X004B
   1598 D0 F9         [ 4]  889         bne     L1593
   159A AD 02 03      [ 4]  890         lda     transport_periph$ddr_reg_b
   159D 29 60         [ 2]  891         and     #0x60
   159F D0 07         [ 4]  892         bne     L15A8
   15A1 A9 00         [ 2]  893         lda     #0x00
   15A3 8D 02 03      [ 4]  894         sta     transport_periph$ddr_reg_b
   15A6 85 6B         [ 3]  895         sta     X006B
   15A8                     896 L15A8:
   15A8 60            [ 6]  897         rts
                            898 ;
   15A9                     899 L15A9:
   15A9 A5 5A         [ 3]  900         lda     X005A
   15AB D0 29         [ 4]  901         bne     L15D6
   15AD AD 00 02      [ 4]  902         lda     U18_PORTA
   15B0 49 FF         [ 2]  903         eor     #0xFF
   15B2 F0 21         [ 4]  904         beq     L15D5
   15B4 85 5B         [ 3]  905         sta     X005B
   15B6 10 09         [ 4]  906         bpl     L15C1
   15B8 4D 02 02      [ 4]  907         eor     U18_PORTB
   15BB 8D 02 02      [ 4]  908         sta     U18_PORTB
   15BE 4C CD 15      [ 3]  909         jmp     L15CD
                            910 ;
   15C1                     911 L15C1:
   15C1 AD 02 02      [ 4]  912         lda     U18_PORTB
   15C4 29 80         [ 2]  913         and     #0x80
   15C6 F0 0D         [ 4]  914         beq     L15D5
   15C8 05 5B         [ 3]  915         ora     X005B
   15CA 8D 02 02      [ 4]  916         sta     U18_PORTB
   15CD                     917 L15CD:
   15CD A9 80         [ 2]  918         lda     #0x80
   15CF 85 5A         [ 3]  919         sta     X005A
   15D1 A9 14         [ 2]  920         lda     #0x14
   15D3 85 4B         [ 3]  921         sta     X004B
   15D5                     922 L15D5:
   15D5 60            [ 6]  923         rts
                            924 ;
   15D6                     925 L15D6:
   15D6 A5 5A         [ 3]  926         lda     X005A
   15D8 2A            [ 2]  927         rol     a
   15D9 90 09         [ 4]  928         bcc     L15E4
   15DB A5 4B         [ 3]  929         lda     X004B
   15DD D0 20         [ 4]  930         bne     L15FF
   15DF A9 40         [ 2]  931         lda     #0x40
   15E1 85 5A         [ 3]  932         sta     X005A
   15E3 60            [ 6]  933         rts
                            934 ;
   15E4                     935 L15E4:
   15E4 2A            [ 2]  936         rol     a
   15E5 90 10         [ 4]  937         bcc     L15F7
   15E7 AD 00 02      [ 4]  938         lda     U18_PORTA
   15EA 49 FF         [ 2]  939         eor     #0xFF
   15EC D0 11         [ 4]  940         bne     L15FF
   15EE A9 20         [ 2]  941         lda     #0x20
   15F0 85 5A         [ 3]  942         sta     X005A
   15F2 A9 14         [ 2]  943         lda     #0x14
   15F4 85 4B         [ 3]  944         sta     X004B
   15F6 60            [ 6]  945         rts
                            946 ;
   15F7                     947 L15F7:
   15F7 A5 4B         [ 3]  948         lda     X004B
   15F9 D0 04         [ 4]  949         bne     L15FF
   15FB A9 00         [ 2]  950         lda     #0x00
   15FD 85 5A         [ 3]  951         sta     X005A
   15FF                     952 L15FF:
   15FF 60            [ 6]  953         rts
                            954 ;
                            955 ;       AGC audio stuff
                            956 ;
   1600                     957 L1600:
   1600 AD 80 02      [ 4]  958         lda     U19_PORTA
   1603 49 FF         [ 2]  959         eor     #0xFF
   1605 4A            [ 2]  960         lsr     a
   1606 4A            [ 2]  961         lsr     a
   1607 4A            [ 2]  962         lsr     a
   1608 4A            [ 2]  963         lsr     a
   1609 18            [ 2]  964         clc
   160A 65 5E         [ 3]  965         adc     X005E
   160C AA            [ 2]  966         tax
   160D BD 88 16      [ 5]  967         lda     X1688,x
   1610 85 62         [ 3]  968         sta     X0062
   1612 A5 4D         [ 3]  969         lda     X004D
   1614 D0 16         [ 4]  970         bne     L162C
   1616 A9 0A         [ 2]  971         lda     #0x0A
   1618 85 4D         [ 3]  972         sta     X004D
   161A A5 62         [ 3]  973         lda     X0062
   161C CD 82 03      [ 4]  974         cmp     audio_periph$ddr_reg_b
   161F 90 08         [ 4]  975         bcc     L1629
   1621 F0 09         [ 4]  976         beq     L162C
   1623 EE 82 03      [ 6]  977         inc     audio_periph$ddr_reg_b
   1626 4C 2C 16      [ 3]  978         jmp     L162C
                            979 ;
   1629                     980 L1629:
   1629 CE 82 03      [ 6]  981         dec     audio_periph$ddr_reg_b
   162C                     982 L162C:
   162C AD 82 03      [ 4]  983         lda     audio_periph$ddr_reg_b
   162F 8D 82 02      [ 4]  984         sta     U19_PORTB
   1632 60            [ 6]  985         rts
                            986 ;
   1633                     987 L1633:
   1633 A5 63         [ 3]  988         lda     X0063
   1635 D0 15         [ 4]  989         bne     L164C
   1637 A9 7F         [ 2]  990         lda     #0x7F
   1639 85 63         [ 3]  991         sta     X0063
   163B 20 B5 18      [ 6]  992         jsr     L18B5
   163E A9 0A         [ 2]  993         lda     #0x0A
   1640 85 51         [ 3]  994         sta     X0051
   1642 A5 5E         [ 3]  995         lda     X005E
   1644 85 5F         [ 3]  996         sta     X005F
   1646 A9 00         [ 2]  997         lda     #0x00
   1648 85 61         [ 3]  998         sta     X0061
   164A 85 60         [ 3]  999         sta     X0060
   164C                    1000 L164C:
   164C A5 51         [ 3] 1001         lda     X0051
   164E D0 1C         [ 4] 1002         bne     L166C
   1650 A9 0A         [ 2] 1003         lda     #0x0A
   1652 85 51         [ 3] 1004         sta     X0051
   1654 A5 60         [ 3] 1005         lda     X0060
   1656 C9 08         [ 2] 1006         cmp     #0x08
   1658 F0 13         [ 4] 1007         beq     L166D
   165A E6 60         [ 5] 1008         inc     X0060
   165C A2 09         [ 2] 1009         ldx     #0x09
   165E 38            [ 2] 1010         sec
   165F AD 80 03      [ 4] 1011         lda     audio_periph$ddr_reg_a
   1662                    1012 L1662:
   1662 2A            [ 2] 1013         rol     a
   1663 CA            [ 2] 1014         dex
   1664 90 FC         [ 4] 1015         bcc     L1662
   1666 18            [ 2] 1016         clc
   1667 8A            [ 2] 1017         txa
   1668 65 61         [ 3] 1018         adc     X0061
   166A 85 61         [ 3] 1019         sta     X0061
   166C                    1020 L166C:
   166C 60            [ 6] 1021         rts
                           1022 ;
   166D                    1023 L166D:
   166D 46 61         [ 5] 1024         lsr     X0061
   166F 46 61         [ 5] 1025         lsr     X0061
   1671 46 61         [ 5] 1026         lsr     X0061
   1673 A5 61         [ 3] 1027         lda     X0061
   1675 18            [ 2] 1028         clc
   1676 65 5F         [ 3] 1029         adc     X005F
   1678 4A            [ 2] 1030         lsr     a
   1679 85 5E         [ 3] 1031         sta     X005E
   167B A9 00         [ 2] 1032         lda     #0x00
   167D 85 61         [ 3] 1033         sta     X0061
   167F 85 60         [ 3] 1034         sta     X0060
   1681 A9 FF         [ 2] 1035         lda     #0xFF
   1683 85 63         [ 3] 1036         sta     X0063
   1685 4C AA 18      [ 3] 1037         jmp     L18AA
                           1038 ;
                           1039 ;   AGC Mic table
                           1040 ;
   1688                    1041 X1688:
   1688 03 04 06 08        1042         .db     0x03, 0x04, 0x06, 0x08
   168C 10 16 20 2D        1043         .db     0x10, 0x16, 0x20, 0x2D
   1690 40 5A 80 BF        1044         .db     0x40, 0x5A, 0x80, 0xBF
   1694 FF FF FF FF        1045         .db     0xFF, 0xFF, 0xFF, 0xFF
   1698 FF                 1046         .db     0xFF
                           1047 ;
   1699                    1048 L1699:
   1699 A2 00         [ 2] 1049         ldx     #0x00
   169B                    1050 L169B:
   169B A9 30         [ 2] 1051         lda     #0x30
   169D 95 81         [ 4] 1052         sta     board_1_control_reg_a,x
   169F 95 83         [ 4] 1053         sta     board_1_control_reg_b,x
   16A1 A9 FF         [ 2] 1054         lda     #0xFF
   16A3 95 80         [ 4] 1055         sta     board_1_periph$ddr_reg_a,x
   16A5 95 82         [ 4] 1056         sta     board_1_periph$ddr_reg_b,x
   16A7 A9 34         [ 2] 1057         lda     #0x34
   16A9 95 81         [ 4] 1058         sta     board_1_control_reg_a,x
   16AB 95 83         [ 4] 1059         sta     board_1_control_reg_b,x
   16AD A9 00         [ 2] 1060         lda     #0x00
   16AF 95 80         [ 4] 1061         sta     board_1_periph$ddr_reg_a,x
   16B1 95 82         [ 4] 1062         sta     board_1_periph$ddr_reg_b,x
   16B3 E8            [ 2] 1063         inx
   16B4 E8            [ 2] 1064         inx
   16B5 E8            [ 2] 1065         inx
   16B6 E8            [ 2] 1066         inx
   16B7 E0 20         [ 2] 1067         cpx     #0x20
   16B9 90 E0         [ 4] 1068         bcc     L169B
   16BB A9 24         [ 2] 1069         lda     #0x24
   16BD 85 64         [ 3] 1070         sta     X0064
   16BF A9 00         [ 2] 1071         lda     #0x00
   16C1 85 67         [ 3] 1072         sta     X0067
   16C3 85 69         [ 3] 1073         sta     X0069
   16C5 85 6A         [ 3] 1074         sta     X006A
   16C7 AD 00 03      [ 4] 1075         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   16CA A0 00         [ 2] 1076         ldy     #0x00
   16CC 60            [ 6] 1077         rts
                           1078 ;
   16CD                    1079 L16CD:
   16CD A9 00         [ 2] 1080         lda     #0x00
   16CF 85 33         [ 3] 1081         sta     X0033
   16D1 A9 02         [ 2] 1082         lda     #0x02
   16D3 85 4F         [ 3] 1083         sta     X004F
   16D5                    1084 L16D5:
   16D5 AD 02 01      [ 4] 1085         lda     X0102
   16D8 29 05         [ 2] 1086         and     #0x05
   16DA F0 1F         [ 4] 1087         beq     L16FB
   16DC A5 33         [ 3] 1088         lda     X0033
   16DE D0 0C         [ 4] 1089         bne     L16EC
   16E0 AD 01 01      [ 4] 1090         lda     X0101
   16E3 C9 4D         [ 2] 1091         cmp     #0x4D
   16E5 D0 14         [ 4] 1092         bne     L16FB
   16E7 E6 33         [ 5] 1093         inc     X0033
   16E9 4C FB 16      [ 3] 1094         jmp     L16FB
                           1095 ;
   16EC                    1096 L16EC:
   16EC A9 00         [ 2] 1097         lda     #0x00
   16EE 85 33         [ 3] 1098         sta     X0033
   16F0 AD 01 01      [ 4] 1099         lda     X0101
   16F3 C9 31         [ 2] 1100         cmp     #0x31
   16F5 F0 10         [ 4] 1101         beq     L1707
   16F7 C9 32         [ 2] 1102         cmp     #0x32
   16F9 F0 10         [ 4] 1103         beq     L170B
   16FB                    1104 L16FB:
   16FB 20 39 19      [ 6] 1105         jsr     L1939
   16FE A5 4F         [ 3] 1106         lda     X004F
   1700 D0 D3         [ 4] 1107         bne     L16D5
   1702 A9 00         [ 2] 1108         lda     #0x00
   1704                    1109 L1704:
   1704 85 32         [ 3] 1110         sta     X0032
   1706 60            [ 6] 1111         rts
                           1112 ;
   1707                    1113 L1707:
   1707 A9 01         [ 2] 1114         lda     #0x01
   1709 D0 F9         [ 4] 1115         bne     L1704
   170B                    1116 L170B:
   170B A9 02         [ 2] 1117         lda     #0x02
   170D D0 F5         [ 4] 1118         bne     L1704
   170F                    1119 L170F:
   170F 48            [ 3] 1120         pha
   1710 A9 02         [ 2] 1121         lda     #0x02
   1712 85 4F         [ 3] 1122         sta     X004F
   1714 A9 04         [ 2] 1123         lda     #0x04
   1716 85 30         [ 3] 1124         sta     X0030
   1718 68            [ 4] 1125         pla
   1719                    1126 L1719:
   1719 48            [ 3] 1127         pha
   171A 20 39 19      [ 6] 1128         jsr     L1939
   171D A9 53         [ 2] 1129         lda     #0x53
   171F 20 2B 17      [ 6] 1130         jsr     L172B
   1722 68            [ 4] 1131         pla
   1723 20 2B 17      [ 6] 1132         jsr     L172B
   1726 C6 30         [ 5] 1133         dec     X0030
   1728 D0 EF         [ 4] 1134         bne     L1719
   172A 60            [ 6] 1135         rts
                           1136 ;
   172B                    1137 L172B:
   172B 48            [ 3] 1138         pha
   172C                    1139 L172C:
   172C 20 39 19      [ 6] 1140         jsr     L1939
   172F A5 4F         [ 3] 1141         lda     X004F
   1731 F0 07         [ 4] 1142         beq     L173A
   1733 AD 02 01      [ 4] 1143         lda     X0102
   1736 29 02         [ 2] 1144         and     #0x02
   1738 F0 F2         [ 4] 1145         beq     L172C
   173A                    1146 L173A:
   173A 68            [ 4] 1147         pla
   173B 8D 01 01      [ 4] 1148         sta     X0101
   173E 60            [ 6] 1149         rts
                           1150 ;
   173F                    1151 L173F:
   173F A9 80         [ 2] 1152         lda     #0x80
   1741 20 8C 15      [ 6] 1153         jsr     L158C
   1744 20 8C 15      [ 6] 1154         jsr     L158C
   1747                    1155 L1747:
   1747 AD 01 03      [ 4] 1156         lda     transport_control_reg_a             ; Wait for Transport Byte
   174A 0A            [ 2] 1157         asl     a
   174B 90 FA         [ 4] 1158         bcc     L1747
   174D AD 00 03      [ 4] 1159         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   1750 29 7F         [ 2] 1160         and     #0x7F
   1752 C9 24         [ 2] 1161         cmp     #0x24                               ; 0x24 code
   1754 D0 F1         [ 4] 1162         bne     L1747
   1756                    1163 L1756:
   1756 AD 01 03      [ 4] 1164         lda     transport_control_reg_a             ; Wait for Transport Byte
   1759 0A            [ 2] 1165         asl     a
   175A 90 FA         [ 4] 1166         bcc     L1756
   175C AD 00 03      [ 4] 1167         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   175F 29 7F         [ 2] 1168         and     #0x7F
   1761 C9 24         [ 2] 1169         cmp     #0x24                               ; 0x24 code
   1763 F0 F1         [ 4] 1170         beq     L1756
   1765 29 3F         [ 2] 1171         and     #0x3F
   1767 C5 56         [ 3] 1172         cmp     X0056
   1769 F0 03         [ 4] 1173         beq     L176E
   176B 4C 66 10      [ 3] 1174         jmp     RESET
                           1175 ;
   176E                    1176 L176E:
   176E 20 99 16      [ 6] 1177         jsr     L1699
   1771 20 9F 18      [ 6] 1178         jsr     L189F
   1774 A9 41         [ 2] 1179         lda     #0x41
   1776 85 92         [ 3] 1180         sta     board_5_periph$ddr_reg_b
   1778                    1181 L1778:
   1778 AD 01 03      [ 4] 1182         lda     transport_control_reg_a             ; Wait for Transport Byte
   177B 0A            [ 2] 1183         asl     a
   177C 90 11         [ 4] 1184         bcc     L178F
   177E AD 00 03      [ 4] 1185         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   1781 29 7F         [ 2] 1186         and     #0x7F
   1783 85 65         [ 3] 1187         sta     X0065                               ; First byte into 0065
   1785 C9 22         [ 2] 1188         cmp     #0x22
   1787 90 EF         [ 4] 1189         bcc     L1778                               ; ignore if < 0x22
   1789 C9 40         [ 2] 1190         cmp     #0x40
   178B B0 05         [ 4] 1191         bcs     L1792                               ; jump if >= 0x40
   178D 85 64         [ 3] 1192         sta     X0064                               ; put it here if it's >= 0x22 and < 0x40
   178F                    1193 L178F:
   178F 4C 1A 18      [ 3] 1194         jmp     L181A
                           1195 ;
   1792                    1196 L1792:
   1792 A5 64         [ 3] 1197         lda     X0064                               ; read the last command byte
   1794 29 7E         [ 2] 1198         and     #0x7E
   1796 38            [ 2] 1199         sec
   1797 E9 22         [ 2] 1200         sbc     #0x22
   1799 AA            [ 2] 1201         tax
   179A BD 93 1D      [ 5] 1202         lda     X1D93,x
   179D 85 6C         [ 3] 1203         sta     X006C
   179F BD 94 1D      [ 5] 1204         lda     X1D93+1,x
   17A2 85 6D         [ 3] 1205         sta     X006D
   17A4 20 AA 17      [ 6] 1206         jsr     L17AA
   17A7 4C 78 17      [ 3] 1207         jmp     L1778
   17AA                    1208 L17AA:
   17AA 6C 6C 00      [ 5] 1209         jmp     [X006C]                              ;INFO: indirect jump
                           1210 ;
                           1211 ;       Decode command byte in 0064 and channel byte in 0065
                           1212 ;       to a command offset in 0066 and bit mask in 0068, return with carry clear
                           1213 ;
   17AD                    1214 L17AD:
   17AD A5 64         [ 3] 1215         lda     X0064                               ; read the last command byte?
   17AF                    1216 L17AF:
   17AF 38            [ 2] 1217         sec
   17B0 E9 26         [ 2] 1218         sbc     #0x26
   17B2 4A            [ 2] 1219         lsr     a
   17B3 A8            [ 2] 1220         tay
   17B4 B9 B2 1D      [ 5] 1221         lda     X1DB2,y
   17B7 85 66         [ 3] 1222         sta     X0066                               ; table value goes here
   17B9 98            [ 2] 1223         tya
   17BA 0A            [ 2] 1224         asl     a
   17BB 0A            [ 2] 1225         asl     a
   17BC 0A            [ 2] 1226         asl     a
   17BD A8            [ 2] 1227         tay                                         ; times 8
   17BE A9 01         [ 2] 1228         lda     #0x01
   17C0 85 68         [ 3] 1229         sta     X0068                               ; set bit 0 here
   17C2 A5 65         [ 3] 1230         lda     X0065                               ; get current byte
   17C4                    1231 L17C4:
   17C4 D9 04 1E      [ 5] 1232         cmp     X1E04,y
   17C7 F0 07         [ 4] 1233         beq     L17D0
   17C9 C8            [ 2] 1234         iny
   17CA 06 68         [ 5] 1235         asl     X0068                               ; now X0068 has the right bit
   17CC 90 F6         [ 4] 1236         bcc     L17C4
   17CE 18            [ 2] 1237         clc                                         ; code not found, return
   17CF 60            [ 6] 1238         rts
                           1239 ;
   17D0                    1240 L17D0:
   17D0 A0 00         [ 2] 1241         ldy     #0x00
   17D2 A5 64         [ 3] 1242         lda     X0064
   17D4 4A            [ 2] 1243         lsr     a                                   ; get bottom bit on/off into carry
   17D5 A5 68         [ 3] 1244         lda     X0068                               ; get bitmask
   17D7 B0 08         [ 4] 1245         bcs     L17E1                               ; if on, jump ahead
   17D9 49 FF         [ 2] 1246         eor     #0xFF
   17DB 31 66         [ 6] 1247         and     [X0066],y
   17DD                    1248 L17DD:
   17DD 91 66         [ 6] 1249         sta     [X0066],y                           ; set bit in 0066
   17DF 38            [ 2] 1250         sec                                         ; code found
   17E0 60            [ 6] 1251         rts
                           1252 ;
   17E1                    1253 L17E1:
   17E1 11 66         [ 6] 1254         ora     [X0066],y
   17E3 4C DD 17      [ 3] 1255         jmp     L17DD
                           1256 ;
                           1257 ;       Act like call to L17AD, but if code not found, act like a you got a 0028
                           1258 ;
   17E6                    1259 L17E6:
   17E6 20 AD 17      [ 6] 1260         jsr     L17AD
   17E9 90 01         [ 4] 1261         bcc     L17EC
   17EB 60            [ 6] 1262         rts
                           1263 ;
   17EC                    1264 L17EC:
   17EC A9 28         [ 2] 1265         lda     #0x28
   17EE 4C AF 17      [ 3] 1266         jmp     L17AF
                           1267 ;
   17F1                    1268 L17F1:
   17F1 A5 65         [ 3] 1269         lda     X0065
   17F3 C9 40         [ 2] 1270         cmp     #0x40
   17F5 90 16         [ 4] 1271         bcc     L180D
   17F7 C9 60         [ 2] 1272         cmp     #0x60
   17F9 B0 12         [ 4] 1273         bcs     L180D
   17FB 38            [ 2] 1274         sec
   17FC E9 40         [ 2] 1275         sbc     #0x40
   17FE 0A            [ 2] 1276         asl     a
   17FF A8            [ 2] 1277         tay
   1800 B9 C2 1D      [ 5] 1278         lda     X1DC2,y
   1803 85 66         [ 3] 1279         sta     X0066
   1805 B9 C3 1D      [ 5] 1280         lda     X1DC2+1,y
   1808 85 68         [ 3] 1281         sta     X0068
   180A 4C D0 17      [ 3] 1282         jmp     L17D0
   180D                    1283 L180D:
   180D 60            [ 6] 1284         rts
                           1285 ;
                           1286 ;       Act like call to L17AD, but if code not found, act like a you got a 0030
                           1287 ;
   180E                    1288 L180E:
   180E 20 AD 17      [ 6] 1289         jsr     L17AD
   1811 B0 05         [ 4] 1290         bcs     L1818
   1813 A9 30         [ 2] 1291         lda     #0x30
   1815 20 AF 17      [ 6] 1292         jsr     L17AF
   1818                    1293 L1818:
   1818 60            [ 6] 1294         rts
                           1295 ;
   1819                    1296 L1819:
   1819 60            [ 6] 1297         rts
                           1298 ;
   181A                    1299 L181A:
   181A AD 05 02      [ 4] 1300         lda     U18_edge_detect_control_DI_pos
   181D 30 03         [ 4] 1301         bmi     L1822
   181F 4C 78 17      [ 3] 1302         jmp     L1778
                           1303 ;
   1822                    1304 L1822:
   1822 20 00 16      [ 6] 1305         jsr     L1600
   1825 AD 02 03      [ 4] 1306         lda     transport_periph$ddr_reg_b
   1828 4A            [ 2] 1307         lsr     a
   1829 90 04         [ 4] 1308         bcc     L182F
   182B A9 06         [ 2] 1309         lda     #0x06
   182D 85 4B         [ 3] 1310         sta     X004B
   182F                    1311 L182F:
   182F A5 4B         [ 3] 1312         lda     X004B
   1831 F0 07         [ 4] 1313         beq     L183A
   1833 AD 00 02      [ 4] 1314         lda     U18_PORTA
   1836 29 40         [ 2] 1315         and     #0x40
   1838 D0 0E         [ 4] 1316         bne     L1848
   183A                    1317 L183A:
   183A 20 99 16      [ 6] 1318         jsr     L1699
   183D 20 FC 18      [ 6] 1319         jsr     L18FC
   1840 20 B5 18      [ 6] 1320         jsr     L18B5
   1843 A9 00         [ 2] 1321         lda     #0x00
   1845 85 63         [ 3] 1322         sta     X0063
   1847 60            [ 6] 1323         rts
                           1324 ;
   1848                    1325 L1848:
   1848 A5 6A         [ 3] 1326         lda     X006A
   184A AA            [ 2] 1327         tax
   184B 29 04         [ 2] 1328         and     #0x04
   184D F0 10         [ 4] 1329         beq     L185F
   184F A5 4C         [ 3] 1330         lda     X004C
   1851 C9 2B         [ 2] 1331         cmp     #0x2B
   1853 B0 15         [ 4] 1332         bcs     L186A
   1855 C9 00         [ 2] 1333         cmp     #0x00
   1857 F0 0A         [ 4] 1334         beq     L1863
   1859 8A            [ 2] 1335         txa
   185A 29 FB         [ 2] 1336         and     #0xFB
   185C 4C 68 18      [ 3] 1337         jmp     L1868
                           1338 ;
   185F                    1339 L185F:
   185F A9 64         [ 2] 1340         lda     #0x64
   1861 85 4F         [ 3] 1341         sta     X004F
   1863                    1342 L1863:
   1863 A9 3C         [ 2] 1343         lda     #0x3C
   1865 85 4C         [ 3] 1344         sta     X004C
   1867 8A            [ 2] 1345         txa
   1868                    1346 L1868:
   1868 85 94         [ 3] 1347         sta     board_6_periph$ddr_reg_a
   186A                    1348 L186A:
   186A A5 6A         [ 3] 1349         lda     X006A
   186C 29 04         [ 2] 1350         and     #0x04
   186E F0 0A         [ 4] 1351         beq     L187A
   1870 A5 4F         [ 3] 1352         lda     X004F
   1872 D0 06         [ 4] 1353         bne     L187A
   1874 A5 6A         [ 3] 1354         lda     X006A
   1876 29 FB         [ 2] 1355         and     #0xFB
   1878 85 6A         [ 3] 1356         sta     X006A
   187A                    1357 L187A:
   187A A5 69         [ 3] 1358         lda     X0069
   187C 29 3E         [ 2] 1359         and     #0x3E
   187E 85 68         [ 3] 1360         sta     X0068
   1880 D0 04         [ 4] 1361         bne     L1886
   1882                    1362 L1882:
   1882 A9 0C         [ 2] 1363         lda     #0x0C
   1884 85 50         [ 3] 1364         sta     X0050
   1886                    1365 L1886:
   1886 A5 50         [ 3] 1366         lda     X0050
   1888 C9 07         [ 2] 1367         cmp     #0x07
   188A B0 08         [ 4] 1368         bcs     L1894
   188C C9 00         [ 2] 1369         cmp     #0x00
   188E F0 F2         [ 4] 1370         beq     L1882
   1890 A9 00         [ 2] 1371         lda     #0x00
   1892 85 68         [ 3] 1372         sta     X0068
   1894                    1373 L1894:
   1894 A5 92         [ 3] 1374         lda     board_5_periph$ddr_reg_b
   1896 29 C1         [ 2] 1375         and     #0xC1
   1898 05 68         [ 3] 1376         ora     X0068
   189A 85 92         [ 3] 1377         sta     board_5_periph$ddr_reg_b
   189C 4C 78 17      [ 3] 1378         jmp     L1778
                           1379 ;
   189F                    1380 L189F:
   189F A9 34         [ 2] 1381         lda     #0x34
   18A1 48            [ 3] 1382         pha
   18A2 A9 40         [ 2] 1383         lda     #0x40
   18A4 A0 34         [ 2] 1384         ldy     #0x34
   18A6 A2 3C         [ 2] 1385         ldx     #0x3C
   18A8 D0 14         [ 4] 1386         bne     L18BE
   18AA                    1387 L18AA:
   18AA A9 34         [ 2] 1388         lda     #0x34
   18AC 48            [ 3] 1389         pha
   18AD A9 00         [ 2] 1390         lda     #0x00
   18AF A0 3C         [ 2] 1391         ldy     #0x3C
   18B1 A2 34         [ 2] 1392         ldx     #0x34
   18B3 D0 09         [ 4] 1393         bne     L18BE
   18B5                    1394 L18B5:
   18B5 A9 3C         [ 2] 1395         lda     #0x3C
   18B7 48            [ 3] 1396         pha
   18B8 A9 00         [ 2] 1397         lda     #0x00
   18BA A0 3C         [ 2] 1398         ldy     #0x3C
   18BC A2 3C         [ 2] 1399         ldx     #0x3C
   18BE                    1400 L18BE:
   18BE 8E 81 03      [ 4] 1401         stx     audio_control_reg_a
   18C1 8C 83 03      [ 4] 1402         sty     audio_control_reg_b
   18C4 A2 00         [ 2] 1403         ldx     #0x00
   18C6 20 D0 18      [ 6] 1404         jsr     L18D0
   18C9 68            [ 4] 1405         pla
   18CA A2 01         [ 2] 1406         ldx     #0x01
   18CC 20 D0 18      [ 6] 1407         jsr     L18D0
   18CF 60            [ 6] 1408         rts
                           1409 ;
   18D0                    1410 L18D0:
   18D0 95 82         [ 4] 1411         sta     board_1_periph$ddr_reg_b,x
   18D2 E8            [ 2] 1412         inx
   18D3 E8            [ 2] 1413         inx
   18D4 E8            [ 2] 1414         inx
   18D5 E8            [ 2] 1415         inx
   18D6 E0 17         [ 2] 1416         cpx     #0x17
   18D8 90 F6         [ 4] 1417         bcc     L18D0
   18DA 60            [ 6] 1418         rts
                           1419 ;
                           1420 ;       Act like call to L17AD, but if code not found, act like a you got a 002C
                           1421 ;
   18DB                    1422 L18DB:
   18DB 20 AD 17      [ 6] 1423         jsr     L17AD
   18DE 90 01         [ 4] 1424         bcc     L18E1
   18E0 60            [ 6] 1425         rts
                           1426 ;
   18E1                    1427 L18E1:
   18E1 A9 2C         [ 2] 1428         lda     #0x2C
   18E3 4C AF 17      [ 3] 1429         jmp     L17AF
                           1430 ;
                           1431 ;       Act like call to L17AD, but if code not found, act like a you got a 002E
                           1432 ;
   18E6                    1433 L18E6:
   18E6 20 AD 17      [ 6] 1434         jsr     L17AD
   18E9 90 01         [ 4] 1435         bcc     L18EC
   18EB 60            [ 6] 1436         rts
                           1437 ;
   18EC                    1438 L18EC:
   18EC A9 2E         [ 2] 1439         lda     #0x2E
   18EE 4C AF 17      [ 3] 1440         jmp     L17AF
                           1441 ;
                           1442 ;       Act like call to L17AD, but if code not found, act like a you got a 0040
                           1443 ;
   18F1                    1444 L18F1:
   18F1 20 AD 17      [ 6] 1445         jsr     L17AD
   18F4 90 01         [ 4] 1446         bcc     L18F7
   18F6 60            [ 6] 1447         rts
                           1448 ;
   18F7                    1449 L18F7:
   18F7 A9 40         [ 2] 1450         lda     #0x40
   18F9 4C AF 17      [ 3] 1451         jmp     L17AF
                           1452 ;
   18FC                    1453 L18FC:
   18FC A9 FA         [ 2] 1454         lda     #0xFA
   18FE 85 3E         [ 3] 1455         sta     X003E
   1900 A9 E6         [ 2] 1456         lda     #0xE6
   1902 85 3F         [ 3] 1457         sta     X003F
   1904 A9 D2         [ 2] 1458         lda     #0xD2
   1906 85 40         [ 3] 1459         sta     X0040
   1908 A9 BE         [ 2] 1460         lda     #0xBE
   190A 85 41         [ 3] 1461         sta     X0041
   190C A9 AA         [ 2] 1462         lda     #0xAA
   190E 85 42         [ 3] 1463         sta     X0042
                           1464 
                           1465         ;       Init Table addresses
                           1466 
   1910 A9 2F         [ 2] 1467         lda     #0x2F                   ; X1A2F - board 1 related?
   1912 85 38         [ 3] 1468         sta     X0038
   1914 A9 1A         [ 2] 1469         lda     #0x1A
   1916 85 39         [ 3] 1470         sta     X0039
                           1471 
   1918 A9 01         [ 2] 1472         lda     #0x01                   ; X1B01 - board 2 related?
   191A 85 34         [ 3] 1473         sta     X0034
   191C A9 1B         [ 2] 1474         lda     #0x1B
   191E 85 35         [ 3] 1475         sta     X0035
                           1476 
   1920 A9 B9         [ 2] 1477         lda     #0xB9                   ; X1BB9 - board 5 related?
   1922 85 36         [ 3] 1478         sta     X0036
   1924 A9 1B         [ 2] 1479         lda     #0x1B
   1926 85 37         [ 3] 1480         sta     X0037
                           1481 
   1928 A9 4B         [ 2] 1482         lda     #0x4B                   ; X1C4B - board 4 related?
   192A 85 3A         [ 3] 1483         sta     X003A
   192C A9 1C         [ 2] 1484         lda     #0x1C
   192E 85 3B         [ 3] 1485         sta     X003B
                           1486 
   1930 A9 05         [ 2] 1487         lda     #0x05                   ; X1D05 - board 3 related?
   1932 85 3C         [ 3] 1488         sta     X003C
   1934 A9 1D         [ 2] 1489         lda     #0x1D
   1936 85 3D         [ 3] 1490         sta     X003D
   1938 60            [ 6] 1491         rts
                           1492 ;
   1939                    1493 L1939:
   1939 20 49 19      [ 6] 1494         jsr     L1949
   193C 20 77 19      [ 6] 1495         jsr     L1977
   193F 20 A5 19      [ 6] 1496         jsr     L19A5
   1942 20 D3 19      [ 6] 1497         jsr     L19D3
   1945 20 01 1A      [ 6] 1498         jsr     L1A01
   1948 60            [ 6] 1499         rts
                           1500 ;
   1949                    1501 L1949:
   1949 A0 00         [ 2] 1502         ldy     #0x00
   194B B1 38         [ 6] 1503         lda     [X0038],y
   194D C9 FF         [ 2] 1504         cmp     #0xFF
   194F F0 17         [ 4] 1505         beq     L1968
   1951 C5 3E         [ 3] 1506         cmp     X003E
   1953 D0 12         [ 4] 1507         bne     L1967
   1955 C8            [ 2] 1508         iny
   1956 B1 38         [ 6] 1509         lda     [X0038],y
   1958 85 80         [ 3] 1510         sta     board_1_periph$ddr_reg_a
   195A 18            [ 2] 1511         clc
   195B A5 38         [ 3] 1512         lda     X0038
   195D 69 02         [ 2] 1513         adc     #0x02
   195F 85 38         [ 3] 1514         sta     X0038
   1961 A5 39         [ 3] 1515         lda     X0039
   1963 69 00         [ 2] 1516         adc     #0x00
   1965 85 39         [ 3] 1517         sta     X0039
   1967                    1518 L1967:
   1967 60            [ 6] 1519         rts
                           1520 ;
   1968                    1521 L1968:
   1968 A9 2F         [ 2] 1522         lda     #0x2F
   196A 85 38         [ 3] 1523         sta     X0038
   196C A9 1A         [ 2] 1524         lda     #0x1A
   196E 85 39         [ 3] 1525         sta     X0039
   1970 A9 FA         [ 2] 1526         lda     #0xFA
   1972 85 3E         [ 3] 1527         sta     X003E
   1974 4C 67 19      [ 3] 1528         jmp     L1967
                           1529 ;
   1977                    1530 L1977:
   1977 A0 00         [ 2] 1531         ldy     #0x00
   1979 B1 34         [ 6] 1532         lda     [X0034],y
   197B C9 FF         [ 2] 1533         cmp     #0xFF
   197D F0 17         [ 4] 1534         beq     L1996
   197F C5 3F         [ 3] 1535         cmp     X003F
   1981 D0 12         [ 4] 1536         bne     L1995
   1983 C8            [ 2] 1537         iny
   1984 B1 34         [ 6] 1538         lda     [X0034],y
   1986 85 84         [ 3] 1539         sta     board_2_periph$ddr_reg_a
   1988 18            [ 2] 1540         clc
   1989 A5 34         [ 3] 1541         lda     X0034
   198B 69 02         [ 2] 1542         adc     #0x02
   198D 85 34         [ 3] 1543         sta     X0034
   198F A5 35         [ 3] 1544         lda     X0035
   1991 69 00         [ 2] 1545         adc     #0x00
   1993 85 35         [ 3] 1546         sta     X0035
   1995                    1547 L1995:
   1995 60            [ 6] 1548         rts
                           1549 ;
   1996                    1550 L1996:
   1996 A9 01         [ 2] 1551         lda     #0x01
   1998 85 34         [ 3] 1552         sta     X0034
   199A A9 1B         [ 2] 1553         lda     #0x1B
   199C 85 35         [ 3] 1554         sta     X0035
   199E A9 E6         [ 2] 1555         lda     #0xE6
   19A0 85 3F         [ 3] 1556         sta     X003F
   19A2 4C 95 19      [ 3] 1557         jmp     L1995
                           1558 ;
   19A5                    1559 L19A5:
   19A5 A0 00         [ 2] 1560         ldy     #0x00
   19A7 B1 36         [ 6] 1561         lda     [X0036],y
   19A9 C9 FF         [ 2] 1562         cmp     #0xFF
   19AB F0 17         [ 4] 1563         beq     L19C4
   19AD C5 40         [ 3] 1564         cmp     X0040
   19AF D0 12         [ 4] 1565         bne     L19C3
   19B1 C8            [ 2] 1566         iny
   19B2 B1 36         [ 6] 1567         lda     [X0036],y
   19B4 85 90         [ 3] 1568         sta     board_5_periph$ddr_reg_a
   19B6 18            [ 2] 1569         clc
   19B7 A5 36         [ 3] 1570         lda     X0036
   19B9 69 02         [ 2] 1571         adc     #0x02
   19BB 85 36         [ 3] 1572         sta     X0036
   19BD A5 37         [ 3] 1573         lda     X0037
   19BF 69 00         [ 2] 1574         adc     #0x00
   19C1 85 37         [ 3] 1575         sta     X0037
   19C3                    1576 L19C3:
   19C3 60            [ 6] 1577         rts
                           1578 ;
   19C4                    1579 L19C4:
   19C4 A9 B9         [ 2] 1580         lda     #0xB9
   19C6 85 36         [ 3] 1581         sta     X0036
   19C8 A9 1B         [ 2] 1582         lda     #0x1B
   19CA 85 37         [ 3] 1583         sta     X0037
   19CC A9 D2         [ 2] 1584         lda     #0xD2
   19CE 85 40         [ 3] 1585         sta     X0040
   19D0 4C C3 19      [ 3] 1586         jmp     L19C3
                           1587 ;
   19D3                    1588 L19D3:
   19D3 A0 00         [ 2] 1589         ldy     #0x00
   19D5 B1 3A         [ 6] 1590         lda     [X003A],y
   19D7 C9 FF         [ 2] 1591         cmp     #0xFF
   19D9 F0 17         [ 4] 1592         beq     L19F2
   19DB C5 41         [ 3] 1593         cmp     X0041
   19DD D0 12         [ 4] 1594         bne     L19F1
   19DF C8            [ 2] 1595         iny
   19E0 B1 3A         [ 6] 1596         lda     [X003A],y
   19E2 85 8C         [ 3] 1597         sta     board_4_periph$ddr_reg_a
   19E4 18            [ 2] 1598         clc
   19E5 A5 3A         [ 3] 1599         lda     X003A
   19E7 69 02         [ 2] 1600         adc     #0x02
   19E9 85 3A         [ 3] 1601         sta     X003A
   19EB A5 3B         [ 3] 1602         lda     X003B
   19ED 69 00         [ 2] 1603         adc     #0x00
   19EF 85 3B         [ 3] 1604         sta     X003B
   19F1                    1605 L19F1:
   19F1 60            [ 6] 1606         rts
                           1607 ;
   19F2                    1608 L19F2:
   19F2 A9 4B         [ 2] 1609         lda     #0x4B
   19F4 85 3A         [ 3] 1610         sta     X003A
   19F6 A9 1C         [ 2] 1611         lda     #0x1C
   19F8 85 3B         [ 3] 1612         sta     X003B
   19FA A9 BE         [ 2] 1613         lda     #0xBE
   19FC 85 41         [ 3] 1614         sta     X0041
   19FE 4C F1 19      [ 3] 1615         jmp     L19F1
                           1616 ;
   1A01                    1617 L1A01:
   1A01 A0 00         [ 2] 1618         ldy     #0x00
   1A03 B1 3C         [ 6] 1619         lda     [X003C],y
   1A05                    1620 L1A05:
   1A05 C9 FF         [ 2] 1621         cmp     #0xFF
   1A07 F0 17         [ 4] 1622         beq     L1A20
   1A09 C5 42         [ 3] 1623         cmp     X0042
   1A0B D0 12         [ 4] 1624         bne     L1A1F
   1A0D C8            [ 2] 1625         iny
   1A0E B1 3C         [ 6] 1626         lda     [X003C],y
   1A10 85 88         [ 3] 1627         sta     board_3_periph$ddr_reg_a
   1A12 18            [ 2] 1628         clc
   1A13 A5 3C         [ 3] 1629         lda     X003C
   1A15 69 02         [ 2] 1630         adc     #0x02
   1A17 85 3C         [ 3] 1631         sta     X003C
   1A19 A5 3D         [ 3] 1632         lda     X003D
   1A1B 69 00         [ 2] 1633         adc     #0x00
   1A1D 85 3D         [ 3] 1634         sta     X003D
   1A1F                    1635 L1A1F:
   1A1F 60            [ 6] 1636         rts
                           1637 ;
   1A20                    1638 L1A20:
   1A20 A9 05         [ 2] 1639         lda     #0x05
   1A22 85 3C         [ 3] 1640         sta     X003C
   1A24 A9 1D         [ 2] 1641         lda     #0x1D
   1A26 85 3D         [ 3] 1642         sta     X003D
   1A28 A9 AA         [ 2] 1643         lda     #0xAA
   1A2A 85 42         [ 3] 1644         sta     X0042
   1A2C 4C 1F 1A      [ 3] 1645         jmp     L1A1F
                           1646 ;
                           1647 ;
                           1648 ;
   1A2F                    1649 X1A2F:
   1A2F FA 20              1650         .db     0xFA, 0x20
   1A31 FA 20              1651         .db     0xFA, 0x20
   1A33 F6 22              1652         .db     0xF6, 0x22
   1A35 F5 20              1653         .db     0xF5, 0x20
   1A37 F5 20              1654         .db     0xF5, 0x20
   1A39 F3 22              1655         .db     0xF3, 0x22
   1A3B F2 20              1656         .db     0xF2, 0x20
   1A3D E5 22              1657         .db     0xE5, 0x22
   1A3F E5 22              1658         .db     0xE5, 0x22
   1A41 E2 20              1659         .db     0xE2, 0x20
   1A43 D2 20              1660         .db     0xD2, 0x20
   1A45 BE 00              1661         .db     0xBE, 0x00
   1A47 BC 22              1662         .db     0xBC, 0x22
   1A49 BB 30              1663         .db     0xBB, 0x30
   1A4B B9 32              1664         .db     0xB9, 0x32
   1A4D B9 32              1665         .db     0xB9, 0x32
   1A4F B7 30              1666         .db     0xB7, 0x30
   1A51 B6 32              1667         .db     0xB6, 0x32
   1A53 B5 30              1668         .db     0xB5, 0x30
   1A55 B4 32              1669         .db     0xB4, 0x32
   1A57 B4 32              1670         .db     0xB4, 0x32
   1A59 B3 20              1671         .db     0xB3, 0x20
   1A5B B3 20              1672         .db     0xB3, 0x20
   1A5D B1 A0              1673         .db     0xB1, 0xA0
   1A5F B1 A0              1674         .db     0xB1, 0xA0
   1A61 B0 A2              1675         .db     0xB0, 0xA2
   1A63 AF A0              1676         .db     0xAF, 0xA0
   1A65 AF A6              1677         .db     0xAF, 0xA6
   1A67 AE A0              1678         .db     0xAE, 0xA0
   1A69 AE A6              1679         .db     0xAE, 0xA6
   1A6B AD A4              1680         .db     0xAD, 0xA4
   1A6D AC A0              1681         .db     0xAC, 0xA0
   1A6F AC A0              1682         .db     0xAC, 0xA0
   1A71 AB A0              1683         .db     0xAB, 0xA0
   1A73 AA A0              1684         .db     0xAA, 0xA0
   1A75 AA A0              1685         .db     0xAA, 0xA0
   1A77 A2 80              1686         .db     0xA2, 0x80
   1A79 A0 A0              1687         .db     0xA0, 0xA0
   1A7B A0 A0              1688         .db     0xA0, 0xA0
   1A7D 8D 80              1689         .db     0x8D, 0x80
   1A7F 8A A0              1690         .db     0x8A, 0xA0
   1A81 7E 80              1691         .db     0x7E, 0x80
   1A83 7B A0              1692         .db     0x7B, 0xA0
   1A85 79 A4              1693         .db     0x79, 0xA4
   1A87 78 A0              1694         .db     0x78, 0xA0
   1A89 77 A4              1695         .db     0x77, 0xA4
   1A8B 76 A0              1696         .db     0x76, 0xA0
   1A8D 75 A4              1697         .db     0x75, 0xA4
   1A8F 74 A0              1698         .db     0x74, 0xA0
   1A91 73 A4              1699         .db     0x73, 0xA4
   1A93 72 A0              1700         .db     0x72, 0xA0
   1A95 71 A4              1701         .db     0x71, 0xA4
   1A97 70 A0              1702         .db     0x70, 0xA0
   1A99 6F A4              1703         .db     0x6F, 0xA4
   1A9B 6E A0              1704         .db     0x6E, 0xA0
   1A9D 6D A4              1705         .db     0x6D, 0xA4
   1A9F 6C A0              1706         .db     0x6C, 0xA0
   1AA1 69 80              1707         .db     0x69, 0x80
   1AA3 69 80              1708         .db     0x69, 0x80
   1AA5 67 A0              1709         .db     0x67, 0xA0
   1AA7 5E 20              1710         .db     0x5E, 0x20
   1AA9 58 24              1711         .db     0x58, 0x24
   1AAB 57 20              1712         .db     0x57, 0x20
   1AAD 57 20              1713         .db     0x57, 0x20
   1AAF 56 24              1714         .db     0x56, 0x24
   1AB1 55 20              1715         .db     0x55, 0x20
   1AB3 54 24              1716         .db     0x54, 0x24
   1AB5 54 24              1717         .db     0x54, 0x24
   1AB7 53 20              1718         .db     0x53, 0x20
   1AB9 52 24              1719         .db     0x52, 0x24
   1ABB 52 24              1720         .db     0x52, 0x24
   1ABD 50 20              1721         .db     0x50, 0x20
   1ABF 4F 24              1722         .db     0x4F, 0x24
   1AC1 4E 20              1723         .db     0x4E, 0x20
   1AC3 4D 24              1724         .db     0x4D, 0x24
   1AC5 4C 20              1725         .db     0x4C, 0x20
   1AC7 4C 20              1726         .db     0x4C, 0x20
   1AC9 4B 24              1727         .db     0x4B, 0x24
   1ACB 4A 20              1728         .db     0x4A, 0x20
   1ACD 49 20              1729         .db     0x49, 0x20
   1ACF 49 00              1730         .db     0x49, 0x00
   1AD1 48 20              1731         .db     0x48, 0x20
   1AD3 47 20              1732         .db     0x47, 0x20
   1AD5 47 20              1733         .db     0x47, 0x20
   1AD7 46 20              1734         .db     0x46, 0x20
   1AD9 45 24              1735         .db     0x45, 0x24
   1ADB 45 24              1736         .db     0x45, 0x24
   1ADD 44 20              1737         .db     0x44, 0x20
   1ADF 42 20              1738         .db     0x42, 0x20
   1AE1 42 20              1739         .db     0x42, 0x20
   1AE3 37 04              1740         .db     0x37, 0x04
   1AE5 35 20              1741         .db     0x35, 0x20
   1AE7 2E 04              1742         .db     0x2E, 0x04
   1AE9 2E 04              1743         .db     0x2E, 0x04
   1AEB 2D 20              1744         .db     0x2D, 0x20
   1AED 23 24              1745         .db     0x23, 0x24
   1AEF 21 20              1746         .db     0x21, 0x20
   1AF1 17 24              1747         .db     0x17, 0x24
   1AF3 13 00              1748         .db     0x13, 0x00
   1AF5 11 24              1749         .db     0x11, 0x24
   1AF7 10 30              1750         .db     0x10, 0x30
   1AF9 07 34              1751         .db     0x07, 0x34
   1AFB 06 30              1752         .db     0x06, 0x30
   1AFD 05 30              1753         .db     0x05, 0x30
   1AFF FF FF              1754         .db     0xFF, 0xFF
                           1755 ;
   1B01                    1756 X1B01:
   1B01 D7 22              1757         .db     0xD7, 0x22
   1B03 D5 20              1758         .db     0xD5, 0x20
   1B05 C9 22              1759         .db     0xC9, 0x22
   1B07 C7 20              1760         .db     0xC7, 0x20
   1B09 C4 24              1761         .db     0xC4, 0x24
   1B0B C3 20              1762         .db     0xC3, 0x20
   1B0D C2 24              1763         .db     0xC2, 0x24
   1B0F C1 20              1764         .db     0xC1, 0x20
   1B11 BF 24              1765         .db     0xBF, 0x24
   1B13 BF 24              1766         .db     0xBF, 0x24
   1B15 BE 20              1767         .db     0xBE, 0x20
   1B17 BD 24              1768         .db     0xBD, 0x24
   1B19 BC 20              1769         .db     0xBC, 0x20
   1B1B BB 24              1770         .db     0xBB, 0x24
   1B1D BA 20              1771         .db     0xBA, 0x20
   1B1F B9 20              1772         .db     0xB9, 0x20
   1B21 B8 24              1773         .db     0xB8, 0x24
   1B23 B7 20              1774         .db     0xB7, 0x20
   1B25 B4 00              1775         .db     0xB4, 0x00
   1B27 B4 00              1776         .db     0xB4, 0x00
   1B29 B2 20              1777         .db     0xB2, 0x20
   1B2B A9 20              1778         .db     0xA9, 0x20
   1B2D A3 20              1779         .db     0xA3, 0x20
   1B2F A2 20              1780         .db     0xA2, 0x20
   1B31 A1 20              1781         .db     0xA1, 0x20
   1B33 A0 20              1782         .db     0xA0, 0x20
   1B35 A0 20              1783         .db     0xA0, 0x20
   1B37 9F 20              1784         .db     0x9F, 0x20
   1B39 9F 20              1785         .db     0x9F, 0x20
   1B3B 9E 20              1786         .db     0x9E, 0x20
   1B3D 9D 24              1787         .db     0x9D, 0x24
   1B3F 9D 24              1788         .db     0x9D, 0x24
   1B41 9B 20              1789         .db     0x9B, 0x20
   1B43 9A 24              1790         .db     0x9A, 0x24
   1B45 99 20              1791         .db     0x99, 0x20
   1B47 98 20              1792         .db     0x98, 0x20
   1B49 97 24              1793         .db     0x97, 0x24
   1B4B 97 24              1794         .db     0x97, 0x24
   1B4D 95 20              1795         .db     0x95, 0x20
   1B4F 95 20              1796         .db     0x95, 0x20
   1B51 94 00              1797         .db     0x94, 0x00
   1B53 94 00              1798         .db     0x94, 0x00
   1B55 93 20              1799         .db     0x93, 0x20
   1B57 92 00              1800         .db     0x92, 0x00
   1B59 92 00              1801         .db     0x92, 0x00
   1B5B 91 20              1802         .db     0x91, 0x20
   1B5D 90 20              1803         .db     0x90, 0x20
   1B5F 90 20              1804         .db     0x90, 0x20
   1B61 8F 20              1805         .db     0x8F, 0x20
   1B63 8D 20              1806         .db     0x8D, 0x20
   1B65 8D 20              1807         .db     0x8D, 0x20
   1B67 81 00              1808         .db     0x81, 0x00
   1B69 7F 20              1809         .db     0x7F, 0x20
   1B6B 79 00              1810         .db     0x79, 0x00
   1B6D 79 00              1811         .db     0x79, 0x00
   1B6F 78 20              1812         .db     0x78, 0x20
   1B71 76 20              1813         .db     0x76, 0x20
   1B73 6B 00              1814         .db     0x6B, 0x00
   1B75 69 20              1815         .db     0x69, 0x20
   1B77 5E 00              1816         .db     0x5E, 0x00
   1B79 5C 20              1817         .db     0x5C, 0x20
   1B7B 5B 30              1818         .db     0x5B, 0x30
   1B7D 52 10              1819         .db     0x52, 0x10
   1B7F 51 30              1820         .db     0x51, 0x30
   1B81 50 30              1821         .db     0x50, 0x30
   1B83 50 30              1822         .db     0x50, 0x30
   1B85 4F 20              1823         .db     0x4F, 0x20
   1B87 4E 20              1824         .db     0x4E, 0x20
   1B89 4E 20              1825         .db     0x4E, 0x20
   1B8B 4D 20              1826         .db     0x4D, 0x20
   1B8D 46 A0              1827         .db     0x46, 0xA0
   1B8F 45 A0              1828         .db     0x45, 0xA0
   1B91 3D A0              1829         .db     0x3D, 0xA0
   1B93 3D A0              1830         .db     0x3D, 0xA0
   1B95 39 20              1831         .db     0x39, 0x20
   1B97 2A 00              1832         .db     0x2A, 0x00
   1B99 28 20              1833         .db     0x28, 0x20
   1B9B 1E 00              1834         .db     0x1E, 0x00
   1B9D 1C 22              1835         .db     0x1C, 0x22
   1B9F 1C 22              1836         .db     0x1C, 0x22
   1BA1 1B 20              1837         .db     0x1B, 0x20
   1BA3 1A 22              1838         .db     0x1A, 0x22
   1BA5 19 20              1839         .db     0x19, 0x20
   1BA7 18 22              1840         .db     0x18, 0x22
   1BA9 18 22              1841         .db     0x18, 0x22
   1BAB 16 20              1842         .db     0x16, 0x20
   1BAD 15 22              1843         .db     0x15, 0x22
   1BAF 15 22              1844         .db     0x15, 0x22
   1BB1 14 A0              1845         .db     0x14, 0xA0
   1BB3 13 A2              1846         .db     0x13, 0xA2
   1BB5 11 A0              1847         .db     0x11, 0xA0
   1BB7 FF FF              1848         .db     0xFF, 0xFF
                           1849 ;
   1BB9                    1850 X1BB9:
   1BB9 CD 20              1851         .db     0xCD, 0x20
   1BBB CC 20              1852         .db     0xCC, 0x20
   1BBD CB 20              1853         .db     0xCB, 0x20
   1BBF CB 20              1854         .db     0xCB, 0x20
   1BC1 CA 00              1855         .db     0xCA, 0x00
   1BC3 C9 20              1856         .db     0xC9, 0x20
   1BC5 C9 20              1857         .db     0xC9, 0x20
   1BC7 C8 20              1858         .db     0xC8, 0x20
   1BC9 C1 A0              1859         .db     0xC1, 0xA0
   1BCB C0 A0              1860         .db     0xC0, 0xA0
   1BCD B8 A0              1861         .db     0xB8, 0xA0
   1BCF B8 20              1862         .db     0xB8, 0x20
   1BD1 B4 20              1863         .db     0xB4, 0x20
   1BD3 A6 00              1864         .db     0xA6, 0x00
   1BD5 A4 20              1865         .db     0xA4, 0x20
   1BD7 99 00              1866         .db     0x99, 0x00
   1BD9 97 22              1867         .db     0x97, 0x22
   1BDB 97 22              1868         .db     0x97, 0x22
   1BDD 96 20              1869         .db     0x96, 0x20
   1BDF 95 22              1870         .db     0x95, 0x22
   1BE1 94 20              1871         .db     0x94, 0x20
   1BE3 93 22              1872         .db     0x93, 0x22
   1BE5 93 22              1873         .db     0x93, 0x22
   1BE7 91 20              1874         .db     0x91, 0x20
   1BE9 90 20              1875         .db     0x90, 0x20
   1BEB 90 20              1876         .db     0x90, 0x20
   1BED 8D A0              1877         .db     0x8D, 0xA0
   1BEF 8C A0              1878         .db     0x8C, 0xA0
   1BF1 7D A2              1879         .db     0x7D, 0xA2
   1BF3 7D A2              1880         .db     0x7D, 0xA2
   1BF5 7B A0              1881         .db     0x7B, 0xA0
   1BF7 7B A0              1882         .db     0x7B, 0xA0
   1BF9 79 A2              1883         .db     0x79, 0xA2
   1BFB 79 A2              1884         .db     0x79, 0xA2
   1BFD 77 A0              1885         .db     0x77, 0xA0
   1BFF 77 A0              1886         .db     0x77, 0xA0
   1C01 76 80              1887         .db     0x76, 0x80
   1C03 75 A0              1888         .db     0x75, 0xA0
   1C05 6E 20              1889         .db     0x6E, 0x20
   1C07 67 24              1890         .db     0x67, 0x24
   1C09 66 20              1891         .db     0x66, 0x20
   1C0B 65 24              1892         .db     0x65, 0x24
   1C0D 64 20              1893         .db     0x64, 0x20
   1C0F 63 24              1894         .db     0x63, 0x24
   1C11 63 24              1895         .db     0x63, 0x24
   1C13 61 20              1896         .db     0x61, 0x20
   1C15 60 24              1897         .db     0x60, 0x24
   1C17 5F 20              1898         .db     0x5F, 0x20
   1C19 5E 20              1899         .db     0x5E, 0x20
   1C1B 5D 24              1900         .db     0x5D, 0x24
   1C1D 5C 20              1901         .db     0x5C, 0x20
   1C1F 5B 24              1902         .db     0x5B, 0x24
   1C21 5A 20              1903         .db     0x5A, 0x20
   1C23 59 24              1904         .db     0x59, 0x24
   1C25 58 20              1905         .db     0x58, 0x20
   1C27 56 20              1906         .db     0x56, 0x20
   1C29 55 04              1907         .db     0x55, 0x04
   1C2B 54 00              1908         .db     0x54, 0x00
   1C2D 53 24              1909         .db     0x53, 0x24
   1C2F 52 20              1910         .db     0x52, 0x20
   1C31 52 20              1911         .db     0x52, 0x20
   1C33 4F 24              1912         .db     0x4F, 0x24
   1C35 4F 24              1913         .db     0x4F, 0x24
   1C37 4E 30              1914         .db     0x4E, 0x30
   1C39 4D 30              1915         .db     0x4D, 0x30
   1C3B 47 10              1916         .db     0x47, 0x10
   1C3D 45 30              1917         .db     0x45, 0x30
   1C3F 35 30              1918         .db     0x35, 0x30
   1C41 33 10              1919         .db     0x33, 0x10
   1C43 31 30              1920         .db     0x31, 0x30
   1C45 31 30              1921         .db     0x31, 0x30
   1C47 1D 20              1922         .db     0x1D, 0x20
   1C49 FF FF              1923         .db     0xFF, 0xFF
                           1924 ;
   1C4B                    1925 X1C4B:
   1C4B BE 00              1926         .db     0xBE, 0x00
   1C4D BC 22              1927         .db     0xBC, 0x22
   1C4F BB 30              1928         .db     0xBB, 0x30
   1C51 B9 32              1929         .db     0xB9, 0x32
   1C53 B7 30              1930         .db     0xB7, 0x30
   1C55 B6 32              1931         .db     0xB6, 0x32
   1C57 B5 30              1932         .db     0xB5, 0x30
   1C59 B4 32              1933         .db     0xB4, 0x32
   1C5B B4 32              1934         .db     0xB4, 0x32
   1C5D B3 20              1935         .db     0xB3, 0x20
   1C5F B3 20              1936         .db     0xB3, 0x20
   1C61 B1 A0              1937         .db     0xB1, 0xA0
   1C63 B1 A0              1938         .db     0xB1, 0xA0
   1C65 B0 A2              1939         .db     0xB0, 0xA2
   1C67 AF A0              1940         .db     0xAF, 0xA0
   1C69 AF A6              1941         .db     0xAF, 0xA6
   1C6B AE A0              1942         .db     0xAE, 0xA0
   1C6D AE A6              1943         .db     0xAE, 0xA6
   1C6F AD A4              1944         .db     0xAD, 0xA4
   1C71 AC A0              1945         .db     0xAC, 0xA0
   1C73 AC A0              1946         .db     0xAC, 0xA0
   1C75 AB A0              1947         .db     0xAB, 0xA0
   1C77 AA A0              1948         .db     0xAA, 0xA0
   1C79 AA A0              1949         .db     0xAA, 0xA0
   1C7B A2 80              1950         .db     0xA2, 0x80
   1C7D A0 A0              1951         .db     0xA0, 0xA0
   1C7F A0 A0              1952         .db     0xA0, 0xA0
   1C81 8D 80              1953         .db     0x8D, 0x80
   1C83 8A A0              1954         .db     0x8A, 0xA0
   1C85 7E 80              1955         .db     0x7E, 0x80
   1C87 7B A0              1956         .db     0x7B, 0xA0
   1C89 79 A4              1957         .db     0x79, 0xA4
   1C8B 78 A0              1958         .db     0x78, 0xA0
   1C8D 77 A4              1959         .db     0x77, 0xA4
   1C8F 76 A0              1960         .db     0x76, 0xA0
   1C91 75 A4              1961         .db     0x75, 0xA4
   1C93 74 A0              1962         .db     0x74, 0xA0
   1C95 73 A4              1963         .db     0x73, 0xA4
   1C97 72 A0              1964         .db     0x72, 0xA0
   1C99 71 A4              1965         .db     0x71, 0xA4
   1C9B 70 A0              1966         .db     0x70, 0xA0
   1C9D 6F A4              1967         .db     0x6F, 0xA4
   1C9F 6E A0              1968         .db     0x6E, 0xA0
   1CA1 6D A4              1969         .db     0x6D, 0xA4
   1CA3 6C A0              1970         .db     0x6C, 0xA0
   1CA5 69 80              1971         .db     0x69, 0x80
   1CA7 69 80              1972         .db     0x69, 0x80
   1CA9 67 A0              1973         .db     0x67, 0xA0
   1CAB 5E 20              1974         .db     0x5E, 0x20
   1CAD 58 24              1975         .db     0x58, 0x24
   1CAF 57 20              1976         .db     0x57, 0x20
   1CB1 57 20              1977         .db     0x57, 0x20
   1CB3 56 24              1978         .db     0x56, 0x24
   1CB5 55 20              1979         .db     0x55, 0x20
   1CB7 54 24              1980         .db     0x54, 0x24
   1CB9 54 24              1981         .db     0x54, 0x24
   1CBB 53 20              1982         .db     0x53, 0x20
   1CBD 52 24              1983         .db     0x52, 0x24
   1CBF 52 24              1984         .db     0x52, 0x24
   1CC1 50 20              1985         .db     0x50, 0x20
   1CC3 4F 24              1986         .db     0x4F, 0x24
   1CC5 4E 20              1987         .db     0x4E, 0x20
   1CC7 4D 24              1988         .db     0x4D, 0x24
   1CC9 4C 20              1989         .db     0x4C, 0x20
   1CCB 4C 20              1990         .db     0x4C, 0x20
   1CCD 4B 24              1991         .db     0x4B, 0x24
   1CCF 4A 20              1992         .db     0x4A, 0x20
   1CD1 49 20              1993         .db     0x49, 0x20
   1CD3 49 00              1994         .db     0x49, 0x00
   1CD5 48 20              1995         .db     0x48, 0x20
   1CD7 47 20              1996         .db     0x47, 0x20
   1CD9 47 20              1997         .db     0x47, 0x20
   1CDB 46 20              1998         .db     0x46, 0x20
   1CDD 45 24              1999         .db     0x45, 0x24
   1CDF 45 24              2000         .db     0x45, 0x24
   1CE1 44 20              2001         .db     0x44, 0x20
   1CE3 42 20              2002         .db     0x42, 0x20
   1CE5 42 20              2003         .db     0x42, 0x20
   1CE7 37 04              2004         .db     0x37, 0x04
   1CE9 35 20              2005         .db     0x35, 0x20
   1CEB 2E 04              2006         .db     0x2E, 0x04
   1CED 2E 04              2007         .db     0x2E, 0x04
   1CEF 2D 20              2008         .db     0x2D, 0x20
   1CF1 23 24              2009         .db     0x23, 0x24
   1CF3 21 20              2010         .db     0x21, 0x20
   1CF5 17 24              2011         .db     0x17, 0x24
   1CF7 13 00              2012         .db     0x13, 0x00
   1CF9 11 24              2013         .db     0x11, 0x24
   1CFB 10 30              2014         .db     0x10, 0x30
   1CFD 07 34              2015         .db     0x07, 0x34
   1CFF 06 30              2016         .db     0x06, 0x30
   1D01 05 30              2017         .db     0x05, 0x30
   1D03 FF FF              2018         .db     0xFF, 0xFF
                           2019 ;
   1D05                    2020 X1D05:
   1D05 A9 20              2021         .db     0xA9, 0x20
   1D07 A3 20              2022         .db     0xA3, 0x20
   1D09 A2 20              2023         .db     0xA2, 0x20
   1D0B A1 20              2024         .db     0xA1, 0x20
   1D0D A0 20              2025         .db     0xA0, 0x20
   1D0F A0 20              2026         .db     0xA0, 0x20
   1D11 9F 20              2027         .db     0x9F, 0x20
   1D13 9F 20              2028         .db     0x9F, 0x20
   1D15 9E 20              2029         .db     0x9E, 0x20
   1D17 9D 24              2030         .db     0x9D, 0x24
   1D19 9D 24              2031         .db     0x9D, 0x24
   1D1B 9B 20              2032         .db     0x9B, 0x20
   1D1D 9A 24              2033         .db     0x9A, 0x24
   1D1F 99 20              2034         .db     0x99, 0x20
   1D21 98 20              2035         .db     0x98, 0x20
   1D23 97 24              2036         .db     0x97, 0x24
   1D25 97 24              2037         .db     0x97, 0x24
   1D27 95 20              2038         .db     0x95, 0x20
   1D29 95 20              2039         .db     0x95, 0x20
   1D2B 94 00              2040         .db     0x94, 0x00
   1D2D 94 00              2041         .db     0x94, 0x00
   1D2F 93 20              2042         .db     0x93, 0x20
   1D31 92 00              2043         .db     0x92, 0x00
   1D33 92 00              2044         .db     0x92, 0x00
   1D35 91 20              2045         .db     0x91, 0x20
   1D37 90 20              2046         .db     0x90, 0x20
   1D39 90 20              2047         .db     0x90, 0x20
   1D3B 8F 20              2048         .db     0x8F, 0x20
   1D3D 8D 20              2049         .db     0x8D, 0x20
   1D3F 8D 20              2050         .db     0x8D, 0x20
   1D41 81 00              2051         .db     0x81, 0x00
   1D43 7F 20              2052         .db     0x7F, 0x20
   1D45 79 00              2053         .db     0x79, 0x00
   1D47 79 00              2054         .db     0x79, 0x00
   1D49 78 20              2055         .db     0x78, 0x20
   1D4B 76 20              2056         .db     0x76, 0x20
   1D4D 6B 00              2057         .db     0x6B, 0x00
   1D4F 69 20              2058         .db     0x69, 0x20
   1D51 5E 00              2059         .db     0x5E, 0x00
   1D53 5C 20              2060         .db     0x5C, 0x20
   1D55 5B 30              2061         .db     0x5B, 0x30
   1D57 52 10              2062         .db     0x52, 0x10
   1D59 51 30              2063         .db     0x51, 0x30
   1D5B 50 30              2064         .db     0x50, 0x30
   1D5D 50 30              2065         .db     0x50, 0x30
   1D5F 4F 20              2066         .db     0x4F, 0x20
   1D61 4E 20              2067         .db     0x4E, 0x20
   1D63 4E 20              2068         .db     0x4E, 0x20
   1D65 4D 20              2069         .db     0x4D, 0x20
   1D67 46 A0              2070         .db     0x46, 0xA0
   1D69 45 A0              2071         .db     0x45, 0xA0
   1D6B 3D A0              2072         .db     0x3D, 0xA0
   1D6D 3D A0              2073         .db     0x3D, 0xA0
   1D6F 39 20              2074         .db     0x39, 0x20
   1D71 2A 00              2075         .db     0x2A, 0x00
   1D73 28 20              2076         .db     0x28, 0x20
   1D75 1E 00              2077         .db     0x1E, 0x00
   1D77 1C 22              2078         .db     0x1C, 0x22
   1D79 1C 22              2079         .db     0x1C, 0x22
   1D7B 1B 20              2080         .db     0x1B, 0x20
   1D7D 1A 22              2081         .db     0x1A, 0x22
   1D7F 19 20              2082         .db     0x19, 0x20
   1D81 18 22              2083         .db     0x18, 0x22
   1D83 18 22              2084         .db     0x18, 0x22
   1D85 16 20              2085         .db     0x16, 0x20
   1D87 15 22              2086         .db     0x15, 0x22
   1D89 15 22              2087         .db     0x15, 0x22
   1D8B 14 A0              2088         .db     0x14, 0xA0
   1D8D 13 A2              2089         .db     0x13, 0xA2
   1D8F 11 A0              2090         .db     0x11, 0xA0
   1D91 FF FF              2091         .db     0xFF, 0xFF
                           2092 ;
                           2093 ;       Jump Table - process command bytes
                           2094 ;
   1D93                    2095 X1D93:
   1D93 F1 17              2096         .dw     L17F1                   ; 0x22-23 ( "# card 7?) - extended codes?
   1D95 B1 1D              2097         .dw     IGNORE                  ; 0x24-25
   1D97 AD 17              2098         .dw     L17AD                   ; 0x26-27 ( &' ???)
   1D99 B1 1D              2099         .dw     IGNORE                  ; 0x28-29
   1D9B 0E 18              2100         .dw     L180E                   ; 0x2A-2B ( *+ card 8?) - def 30
   1D9D B1 1D              2101         .dw     IGNORE                  ; 0x2C-2D
   1D9F B1 1D              2102         .dw     IGNORE                  ; 0x2E-2F
   1DA1 B1 1D              2103         .dw     IGNORE                  ; 0x30-31
   1DA3 AD 17              2104         .dw     L17AD                   ; 0x32-33 ( 23 card 1?)
   1DA5 DB 18              2105         .dw     L18DB                   ; 0x34-35 ( 45 card 3?) - def 2C
   1DA7 F1 18              2106         .dw     L18F1                   ; 0x36-37 ( 67 card 2?) - def 40
   1DA9 19 18              2107         .dw     L1819                   ; 0x38-39 ( 89 card 6?) - do nothing?
   1DAB E6 17              2108         .dw     L17E6                   ; 0x3A-3B ( :; card 5?) - def 28
   1DAD E6 18              2109         .dw     L18E6                   ; 0x3C-3D ( <= card 4?) - def 2E
   1DAF AD 17              2110         .dw     L17AD                   ; 0x3E-3F ( >? ???)
                           2111 
   1DB1                    2112 IGNORE:
   1DB1 60            [ 6] 2113         rts
                           2114 ;
                           2115 ;       Memory address codes
                           2116 ;
   1DB2                    2117 X1DB2:
   1DB2 6A                 2118         .db     0x6A        ; 0x26 - ???
   1DB3 96                 2119         .db     0x96        ; 0x28 - board 6B?
   1DB4 96                 2120         .db     0x96        ; 0x2A - board 6B?
   1DB5 8A                 2121         .db     0x8A        ; 0x2C - board 3B?
   1DB6 8E                 2122         .db     0x8E        ; 0x2E - board 4B?
   1DB7 69                 2123         .db     0x69        ; 0x30 - ???
   1DB8 80                 2124         .db     0x80        ; 0x32 - board 1
   1DB9 88                 2125         .db     0x88        ; 0x34 - board 3
   1DBA 84                 2126         .db     0x84        ; 0x36 - board 2
   1DBB 00                 2127         .db     0x00        ; 0x38
   1DBC 90                 2128         .db     0x90        ; 0x3A - board 5
   1DBD 8C                 2129         .db     0x8C        ; 0x3C - board 4
   1DBE 82                 2130         .db     0x82        ; 0x3E - board 1B?
   1DBF 86                 2131         .db     0x86        ; 0x40 - board 2B?
   1DC0 00                 2132         .db     0x00        ; 0x42
   1DC1 00                 2133         .db     0x00        ; 0x44
                           2134 ;
                           2135 ;       Extended codes for 0x22-0x23?
                           2136 ;
   1DC2                    2137 X1DC2:
   1DC2 9C 01              2138         .db     0x9C,0x01
   1DC4 98 02              2139         .db     0x98,0x02
   1DC6 9C 08              2140         .db     0x9C,0x08
   1DC8 9C 04              2141         .db     0x9C,0x04
   1DCA 9C 10              2142         .db     0x9C,0x10
   1DCC 98 04              2143         .db     0x98,0x04
   1DCE 98 08              2144         .db     0x98,0x08
   1DD0 9A 20              2145         .db     0x9A,0x20
   1DD2 9A 40              2146         .db     0x9A,0x40
   1DD4 9C 20              2147         .db     0x9C,0x20
   1DD6 9C 40              2148         .db     0x9C,0x40
   1DD8 9C 80              2149         .db     0x9C,0x80
   1DDA 9A 01              2150         .db     0x9A,0x01
   1DDC 9A 08              2151         .db     0x9A,0x08
   1DDE 9A 10              2152         .db     0x9A,0x10
   1DE0 98 40              2153         .db     0x98,0x40
   1DE2 98 80              2154         .db     0x98,0x80
   1DE4 9A 02              2155         .db     0x9A,0x02
   1DE6 9A 04              2156         .db     0x9A,0x04
   1DE8 98 10              2157         .db     0x98,0x10
   1DEA 98 20              2158         .db     0x98,0x20
   1DEC 9C 02              2159         .db     0x9C,0x02
   1DEE 9E 01              2160         .db     0x9E,0x01
   1DF0 9E 08              2161         .db     0x9E,0x08
   1DF2 9E 02              2162         .db     0x9E,0x02
   1DF4 98 01              2163         .db     0x98,0x01
   1DF6 00 80              2164         .db     0x00,0x80
   1DF8 9E 04              2165         .db     0x9E,0x04
   1DFA 9E 10              2166         .db     0x9E,0x10
   1DFC 9E 20              2167         .db     0x9E,0x20
   1DFE 9E 40              2168         .db     0x9E,0x40
   1E00 92 01              2169         .db     0x92,0x01
   1E02 00 00              2170         .db     0x00,0x00
                           2171 ;
                           2172 ;       8 bytes per command, starting with 0x26, 0x28...
                           2173 ;
   1E04                    2174 X1E04:
   1E04 46 45 48 41 4A 4C  2175         .db     'F,'E,'H,'A,'J,'L,'I,'B, 0, 0, 0,'\,'W,'X, 0, 0     ; 0x26, 0x28
        49 42 00 00 00 5C
        57 58 00 00
   1E14 41 46 43 00 00 00  2176         .db     'A,'F,'C, 0, 0, 0, 0, 0,'G,'B,'E,'F,'J,'K, 0, 0     ; 0x2A, 0x2C
        00 00 47 42 45 46
        4A 4B 00 00
   1E24 47 42 43 45 46 4A  2177         .db     'G,'B,'C,'E,'F,'J, 0, 0, 0,'J,'I,'M,'K,'L, 0, 0     ; 0x2E, 0x30
        00 00 00 4A 49 4D
        4B 4C 00 00
   1E34 41 55 43 50 49 4E  2178         .db     'A,'U,'C,'P,'I,'N,'T,'V,'A,'D,'C,'V,'I,'N,'H,'T     ; 0x32, 0x34
        54 56 41 44 43 56
        49 4E 48 54
   1E44 41 48 47 50 49 4E  2179         .db     'A,'H,'G,'P,'I,'N,'T,'V, 0, 0, 0, 0, 0, 0, 0, 0     ; 0x36, 0x38
        54 56 00 00 00 00
        00 00 00 00
   1E54 41 44 43 50 46 4E  2180         .db     'A,'D,'C,'P,'F,'N,'K,'L,'A,'H,'L,'D,'I,'N,'T,'V     ; 0x3A, 0x3C
        4B 4C 41 48 4C 44
        49 4E 54 56
   1E64 41 44 43 50 49 42  2181         .db     'A,'D,'C,'P,'I,'B, 0, 0,'B,'C,'D,'E,'F,'J, 0, 0     ; 0x3E, 0x40
        00 00 42 43 44 45
        46 4A 00 00
                           2182 ;
                           2183 ;       Gap filled with 0xff here
                           2184 ;       
   1FFC                    2185         .org    0x1ffc
                           2186 
   1FFC 66 10              2187 RESETVEC:   .dw     RESET
   1FFE 00 10              2188 IRQVEC:     .dw     IRQ
                           2189 
