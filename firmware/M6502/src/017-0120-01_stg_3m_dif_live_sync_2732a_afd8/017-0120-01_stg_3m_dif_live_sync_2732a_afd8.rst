                              1 
                              2         .area   region1 (ABS)
                              3 
                              4         .include "../../include/ptt6502.def"
                              1 
                              2 ;
                              3 ; Peripheral Addresses for PTT 6502 system
                              4 ;
                              5 
                     0000     6 RAM_start                       = 0x0000
                              7 
                              8 ; Board Select 1
                     0080     9 board_1_periph$ddr_reg_a        = 0x0080
                     0081    10 board_1_control_reg_a           = 0x0081
                     0082    11 board_1_periph$ddr_reg_b        = 0x0082
                     0083    12 board_1_control_reg_b           = 0x0083
                             13 
                             14 ; Board Select 2
                     0084    15 board_2_periph$ddr_reg_a        = 0x0084
                     0086    16 board_2_periph$ddr_reg_b        = 0x0086
                             17 
                             18 ; Board Select 3
                     0088    19 board_3_periph$ddr_reg_a        = 0x0088
                     008A    20 board_3_periph$ddr_reg_b        = 0x008A
                             21 
                             22 ; Board Select 4
                     008C    23 board_4_periph$ddr_reg_a        = 0x008C
                     008E    24 board_4_periph$ddr_reg_b        = 0x008E
                             25 
                             26 ; Board Select 5
                     0090    27 board_5_periph$ddr_reg_a        = 0x0090
                     0092    28 board_5_periph$ddr_reg_b        = 0x0092
                             29 
                             30 ; Board Select 6
                     0094    31 board_6_periph$ddr_reg_a        = 0x0094
                             32 
                             33 ; Board Select 7
                     0098    34 board_7_periph$ddr_reg_a        = 0x0098
                     009A    35 board_7_periph$ddr_reg_b        = 0x009A
                             36 
                             37 ; Board Select 8
                     009C    38 board_8_periph$ddr_reg_a        = 0x009C
                     009E    39 board_8_periph$ddr_reg_b        = 0x009E
                             40 
                             41 ; UART / Board Select 11
                     0101    42 UART_01                         = 0x0101
                     0102    43 UART_02                         = 0x0102
                             44 
                             45 ; 1st 6532 on CPU board
                     0200    46 U18_PORTA                       = 0x0200
                     0201    47 U18_DDRA                        = 0x0201
                     0202    48 U18_PORTB                       = 0x0202
                     0203    49 U18_DDRB                        = 0x0203
                     0204    50 U18_timer                       = 0x0204
                     0205    51 U18_edge_detect_control_DI_pos  = 0x0205
                     0206    52 U18_06                          = 0x0206    
                     0215    53 U18_timer_8T_DI                 = 0x0215
                     0217    54 U18_17                          = 0x0217
                     021C    55 U18_1C                          = 0x021C    ; timer div by 1, enable interrupt
                     021D    56 U18_1D                          = 0x021D    ; timer div by 1, disable interrupt
                             57 
                             58 ; 2nd 6532 on CPU board
                     0280    59 U19_PORTA                       = 0x0280
                     0281    60 U19_DDRA                        = 0x0281
                     0282    61 U19_PORTB                       = 0x0282
                     0283    62 U19_DDRB                        = 0x0283
                     0285    63 U19_edge_detect_control_DI_pos  = 0x0285
                     0286    64 U19_06                          = 0x0286
                             65 
                             66 ; XPRT / Board Select 12
                     0300    67 transport_periph$ddr_reg_a      = 0x0300
                     0301    68 transport_control_reg_a         = 0x0301
                     0302    69 transport_periph$ddr_reg_b      = 0x0302
                     0303    70 transport_control_reg_b         = 0x0303
                             71 
                             72 ; AUDIO / Board Select 13
                     0380    73 audio_periph$ddr_reg_a          = 0x0380
                     0381    74 audio_control_reg_a             = 0x0381
                     0382    75 audio_periph$ddr_reg_b          = 0x0382
                     0383    76 audio_control_reg_b             = 0x0383
                             77 
                             78 ; Tape Commands
                     0010    79 TAPEMODE_STOP                   = 0x10
                     0020    80 TAPEMODE_FFWD                   = 0x20
                     0040    81 TAPEMODE_REWIND                 = 0x40
                     0080    82 TAPEMODE_PLAY                   = 0x80
                             83 
                             84 
                             85 
                             86 
                             87 
                             88 
                              5 
   1000                       6         .org    0x1000
                              7 
   1000                       8 X1000:
   1000 A8                    9         .byte   0xA8
                             10 
   1001                      11 X1001:
   1001 14                   12         .byte   0x14
                             13 
   1002                      14 X1002:
   1002 1F                   15         .byte   0x1F
                             16 
   1003                      17 X1003:
   1003 00                   18         .byte   0x00
                             19 
   1004                      20 X1004:
   1004 01                   21         .byte   0x01
                             22 
   1005                      23 X1005:
   1005 12 00 00 00 00 00    24         .byte   0x12,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00
                             25 
   1010                      26 L1010:
   1010 48            [ 3]   27         pha
   1011 AD 05 02      [ 4]   28         lda     U18_edge_detect_control_DI_pos
   1014 AD 85 02      [ 4]   29         lda     U19_edge_detect_control_DI_pos
   1017 A9 7D         [ 2]   30         lda     #0x7D
   1019 8D 1D 02      [ 4]   31         sta     U18_1D
   101C A5 4B         [ 3]   32         lda     0x4B
   101E F0 02         [ 4]   33         beq     L1022
   1020 C6 4B         [ 5]   34         dec     0x4B
                             35 
                             36 
   1022                      37 L1022:
   1022 A5 4C         [ 3]   38         lda     0x4C
   1024 F0 02         [ 4]   39         beq     L1028
   1026 C6 4C         [ 5]   40         dec     0x4C
                             41 
                             42 
   1028                      43 L1028:
   1028 A5 4D         [ 3]   44         lda     0x4D
   102A F0 02         [ 4]   45         beq     L102E
   102C C6 4D         [ 5]   46         dec     0x4D
                             47 
                             48 
   102E                      49 L102E:
   102E C6 4E         [ 5]   50         dec     0x4E
   1030 D0 42         [ 4]   51         bne     L1074
   1032 A9 64         [ 2]   52         lda     #0x64
   1034 85 4E         [ 3]   53         sta     0x4E
   1036 A5 4F         [ 3]   54         lda     0x4F
   1038 F0 02         [ 4]   55         beq     L103C
   103A C6 4F         [ 5]   56         dec     0x4F
                             57 
                             58 
   103C                      59 L103C:
   103C A5 50         [ 3]   60         lda     0x50
   103E F0 02         [ 4]   61         beq     L1042
   1040 C6 50         [ 5]   62         dec     0x50
                             63 
                             64 
   1042                      65 L1042:
   1042 A5 51         [ 3]   66         lda     0x51
   1044 F0 02         [ 4]   67         beq     L1048
   1046 C6 51         [ 5]   68         dec     0x51
                             69 
                             70 
   1048                      71 L1048:
   1048 A5 3E         [ 3]   72         lda     0x3E
   104A F0 02         [ 4]   73         beq     L104E
   104C C6 3E         [ 5]   74         dec     0x3E
                             75 
                             76 
   104E                      77 L104E:
   104E A5 3F         [ 3]   78         lda     0x3F
   1050 F0 02         [ 4]   79         beq     L1054
   1052 C6 3F         [ 5]   80         dec     0x3F
                             81 
                             82 
   1054                      83 L1054:
   1054 A5 40         [ 3]   84         lda     0x40
   1056 F0 02         [ 4]   85         beq     L105A
   1058 C6 40         [ 5]   86         dec     0x40
                             87 
                             88 
   105A                      89 L105A:
   105A A5 41         [ 3]   90         lda     0x41
   105C F0 02         [ 4]   91         beq     L1060
   105E C6 41         [ 5]   92         dec     0x41
                             93 
                             94 
   1060                      95 L1060:
   1060 A5 42         [ 3]   96         lda     0x42
   1062 F0 02         [ 4]   97         beq     L1066
   1064 C6 42         [ 5]   98         dec     0x42
                             99 
                            100 
   1066                     101 L1066:
   1066 C6 52         [ 5]  102         dec     0x52
   1068 D0 0A         [ 4]  103         bne     L1074
   106A A9 64         [ 2]  104         lda     #0x64
   106C 85 52         [ 3]  105         sta     0x52
   106E A5 53         [ 3]  106         lda     0x53
   1070 F0 02         [ 4]  107         beq     L1074
   1072 C6 53         [ 5]  108         dec     0x53
                            109 
                            110 
   1074                     111 L1074:
   1074 68            [ 4]  112         pla
   1075 40            [ 6]  113         rti
                            114 
                            115 
   1076                     116 L1076:
   1076 D8            [ 2]  117         cld
   1077 78            [ 2]  118         sei
   1078 A2 F0         [ 2]  119         ldx     #0xF0
   107A 9A            [ 2]  120         txs
   107B A9 00         [ 2]  121         lda     #0x00
   107D A2 10         [ 2]  122         ldx     #0x10
                            123 
                            124 
   107F                     125 L107F:
   107F 95 00         [ 4]  126         sta     0x00,x
   1081 E8            [ 2]  127         inx
   1082 E0 80         [ 2]  128         cpx     #0x80
   1084 D0 F9         [ 4]  129         bne     L107F
   1086 A9 00         [ 2]  130         lda     #0x00
   1088 8D 01 03      [ 4]  131         sta     transport_control_reg_a
   108B 8D 02 02      [ 4]  132         sta     U18_PORTB
   108E 8D 81 03      [ 4]  133         sta     audio_control_reg_a
   1091 8D 83 03      [ 4]  134         sta     audio_control_reg_b
   1094 8D 05 02      [ 4]  135         sta     U18_edge_detect_control_DI_pos
   1097 8D 85 02      [ 4]  136         sta     U19_edge_detect_control_DI_pos
   109A 8D 06 02      [ 4]  137         sta     U18_06
   109D 8D 86 02      [ 4]  138         sta     U19_06
   10A0 8D 03 03      [ 4]  139         sta     transport_control_reg_b
   10A3 8D 01 02      [ 4]  140         sta     U18_DDRA
   10A6 A9 02         [ 2]  141         lda     #0x02
   10A8 8D 81 02      [ 4]  142         sta     U19_DDRA
   10AB 8D 80 02      [ 4]  143         sta     U19_PORTA
   10AE A9 FF         [ 2]  144         lda     #0xFF
   10B0 8D 82 03      [ 4]  145         sta     audio_periph$ddr_reg_b
   10B3 8D 03 02      [ 4]  146         sta     U18_DDRB
   10B6 8D 83 02      [ 4]  147         sta     U19_DDRB
   10B9 A9 FC         [ 2]  148         lda     #0xFC
   10BB 8D 02 03      [ 4]  149         sta     transport_periph$ddr_reg_b
   10BE A9 2E         [ 2]  150         lda     #0x2E
   10C0 8D 01 03      [ 4]  151         sta     transport_control_reg_a
   10C3 8D 03 03      [ 4]  152         sta     transport_control_reg_b
   10C6 A9 3C         [ 2]  153         lda     #0x3C
   10C8 8D 83 03      [ 4]  154         sta     audio_control_reg_b
   10CB 8D 81 03      [ 4]  155         sta     audio_control_reg_a
   10CE A9 10         [ 2]  156         lda     #0x10
   10D0 8D 82 03      [ 4]  157         sta     audio_periph$ddr_reg_b
   10D3 8D 82 02      [ 4]  158         sta     U19_PORTB
   10D6 A9 00         [ 2]  159         lda     #0x00
   10D8 85 5E         [ 3]  160         sta     0x5E
   10DA A9 64         [ 2]  161         lda     #0x64
   10DC 85 4E         [ 3]  162         sta     0x4E
   10DE 58            [ 2]  163         cli
   10DF 8D 1C 02      [ 4]  164         sta     U18_1C
   10E2 A9 03         [ 2]  165         lda     #0x03
   10E4 8D 02 01      [ 4]  166         sta     UART_02
   10E7 EA            [ 2]  167         nop
   10E8 A9 09         [ 2]  168         lda     #0x09
   10EA 8D 02 01      [ 4]  169         sta     UART_02
   10ED 20 7B 19      [ 6]  170         jsr     L197B
   10F0 20 BC 16      [ 6]  171         jsr     L16BC
   10F3 A9 02         [ 2]  172         lda     #0x02
   10F5 8D 80 02      [ 4]  173         sta     U19_PORTA
   10F8 A9 33         [ 2]  174         lda     #0x33
   10FA 20 64 17      [ 6]  175         jsr     L1764
   10FD A9 10         [ 2]  176         lda     #0x10
   10FF 20 AF 15      [ 6]  177         jsr     L15AF
   1102 A9 28         [ 2]  178         lda     #0x28
   1104 85 4F         [ 3]  179         sta     0x4F
                            180 
                            181 
   1106                     182 L1106:
   1106 20 B8 19      [ 6]  183         jsr     L19B8
   1109 A5 4F         [ 3]  184         lda     0x4F
   110B D0 F9         [ 4]  185         bne     L1106
   110D 20 BC 16      [ 6]  186         jsr     L16BC
   1110 20 FF 18      [ 6]  187         jsr     L18FF
   1113 AD 00 02      [ 4]  188         lda     U18_PORTA
   1116 49 FF         [ 2]  189         eor     #0xFF
   1118 C9 10         [ 2]  190         cmp     #0x10
   111A D0 15         [ 4]  191         bne     L1131
   111C A9 FF         [ 2]  192         lda     #0xFF
   111E 85 98         [ 3]  193         sta     0x98
   1120 85 9A         [ 3]  194         sta     0x9A
   1122 85 9C         [ 3]  195         sta     0x9C
   1124 85 9E         [ 3]  196         sta     0x9E
   1126 8D 02 02      [ 4]  197         sta     U18_PORTB
                            198 
                            199 
   1129                     200 L1129:
   1129 A9 32         [ 2]  201         lda     #0x32
   112B 20 64 17      [ 6]  202         jsr     L1764
   112E 4C 29 11      [ 3]  203         jmp     L1129
                            204 
                            205 
   1131                     206 L1131:
   1131 A9 40         [ 2]  207         lda     #0x40
   1133 20 AF 15      [ 6]  208         jsr     L15AF
   1136 A5 55         [ 3]  209         lda     0x55
   1138 8D 82 02      [ 4]  210         sta     U19_PORTB
                            211 
                            212 
   113B                     213 L113B:
   113B A9 00         [ 2]  214         lda     #0x00
   113D 85 59         [ 3]  215         sta     0x59
                            216 
                            217 
   113F                     218 L113F:
   113F AD 02 03      [ 4]  219         lda     transport_periph$ddr_reg_b
   1142 A9 0A         [ 2]  220         lda     #0x0A
   1144 85 4B         [ 3]  221         sta     0x4B
   1146 E6 59         [ 5]  222         inc     0x59
   1148 A5 59         [ 3]  223         lda     0x59
   114A C9 64         [ 2]  224         cmp     #0x64
   114C B0 0F         [ 4]  225         bcs     L115D
                            226 
                            227 
   114E                     228 L114E:
   114E 20 B8 19      [ 6]  229         jsr     L19B8
   1151 A5 4B         [ 3]  230         lda     0x4B
   1153 F0 E6         [ 4]  231         beq     L113B
   1155 AD 03 03      [ 4]  232         lda     transport_control_reg_b
   1158 10 F4         [ 4]  233         bpl     L114E
   115A 4C 3F 11      [ 3]  234         jmp     L113F
                            235 
                            236 
   115D                     237 L115D:
   115D A9 20         [ 2]  238         lda     #0x20
   115F 20 AF 15      [ 6]  239         jsr     L15AF
   1162 A9 19         [ 2]  240         lda     #0x19
   1164 85 4F         [ 3]  241         sta     0x4F
                            242 
                            243 
   1166                     244 L1166:
   1166 20 B8 19      [ 6]  245         jsr     L19B8
   1169 A5 4F         [ 3]  246         lda     0x4F
   116B D0 F9         [ 4]  247         bne     L1166
   116D A9 00         [ 2]  248         lda     #0x00
   116F 85 55         [ 3]  249         sta     0x55
   1171 A9 01         [ 2]  250         lda     #0x01
   1173 85 56         [ 3]  251         sta     0x56
   1175 85 57         [ 3]  252         sta     0x57
   1177 20 EA 14      [ 6]  253         jsr     L14EA
   117A A9 80         [ 2]  254         lda     #0x80
   117C 20 AF 15      [ 6]  255         jsr     L15AF
   117F 20 4F 15      [ 6]  256         jsr     L154F
   1182 A9 96         [ 2]  257         lda     #0x96
   1184 85 4F         [ 3]  258         sta     0x4F
   1186 A9 80         [ 2]  259         lda     #0x80
   1188 20 AF 15      [ 6]  260         jsr     L15AF
   118B 20 AF 15      [ 6]  261         jsr     L15AF
                            262 
                            263 
   118E                     264 L118E:
   118E 20 07 12      [ 6]  265         jsr     L1207
   1191 C9 24         [ 2]  266         cmp     #0x24
   1193 D0 F9         [ 4]  267         bne     L118E
                            268 
                            269 
   1195                     270 L1195:
   1195 20 07 12      [ 6]  271         jsr     L1207
   1198 C9 24         [ 2]  272         cmp     #0x24
   119A F0 F9         [ 4]  273         beq     L1195
   119C 29 3F         [ 2]  274         and     #0x3F
   119E C5 56         [ 3]  275         cmp     0x56
   11A0 F0 07         [ 4]  276         beq     L11A9
   11A2 4C 76 10      [ 3]  277         jmp     L1076
   11A5 A9 00         [ 2]  278         lda     #0x00
   11A7 85 49         [ 3]  279         sta     0x49
                            280 
                            281 
   11A9                     282 L11A9:
   11A9 20 07 12      [ 6]  283         jsr     L1207
   11AC C9 28         [ 2]  284         cmp     #0x28
   11AE D0 F9         [ 4]  285         bne     L11A9
   11B0 20 07 12      [ 6]  286         jsr     L1207
   11B3 C9 47         [ 2]  287         cmp     #0x47
   11B5 90 2B         [ 4]  288         bcc     L11E2
   11B7 C9 5A         [ 2]  289         cmp     #0x5A
   11B9 B0 27         [ 4]  290         bcs     L11E2
   11BB 29 1F         [ 2]  291         and     #0x1F
   11BD A2 00         [ 2]  292         ldx     #0x00
   11BF A0 00         [ 2]  293         ldy     #0x00
                            294 
                            295 
   11C1                     296 L11C1:
   11C1 95 70         [ 4]  297         sta     0x70,x
   11C3 E8            [ 2]  298         inx
   11C4 20 07 12      [ 6]  299         jsr     L1207
   11C7 D9 FF 11      [ 5]  300         cmp     X11FF,y
   11CA F0 F5         [ 4]  301         beq     L11C1
   11CC C8            [ 2]  302         iny
   11CD D9 FF 11      [ 5]  303         cmp     X11FF,y
   11D0 D0 10         [ 4]  304         bne     L11E2
   11D2 C0 07         [ 2]  305         cpy     #0x07
   11D4 D0 EB         [ 4]  306         bne     L11C1
   11D6 CA            [ 2]  307         dex
   11D7 E4 70         [ 3]  308         cpx     0x70
   11D9 D0 07         [ 4]  309         bne     L11E2
   11DB A9 00         [ 2]  310         lda     #0x00
   11DD 85 49         [ 3]  311         sta     0x49
   11DF 4C 27 12      [ 3]  312         jmp     L1227
                            313 
                            314 
   11E2                     315 L11E2:
   11E2 A5 49         [ 3]  316         lda     0x49
   11E4 F0 12         [ 4]  317         beq     L11F8
                            318 
                            319 
   11E6                     320 L11E6:
   11E6 A9 FF         [ 2]  321         lda     #0xFF
   11E8 85 49         [ 3]  322         sta     0x49
   11EA 8D 02 02      [ 4]  323         sta     U18_PORTB
   11ED 8D 82 02      [ 4]  324         sta     U19_PORTB
   11F0 A9 10         [ 2]  325         lda     #0x10
   11F2 20 AF 15      [ 6]  326         jsr     L15AF
   11F5 4C E6 11      [ 3]  327         jmp     L11E6
                            328 
                            329 
   11F8                     330 L11F8:
   11F8 A9 80         [ 2]  331         lda     #0x80
   11FA 85 49         [ 3]  332         sta     0x49
   11FC 4C A9 11      [ 3]  333         jmp     L11A9
                            334 
                            335 
   11FF                     336 X11FF:
   11FF 44 52 42 43 53 49   337         .byte   0x44,0x52,0x42,0x43,0x53,0x49,0x52,0x29
        52 29
                            338 
   1207                     339 L1207:
   1207 A5 4F         [ 3]  340         lda     0x4F
   1209 F0 0B         [ 4]  341         beq     L1216
   120B AD 01 03      [ 4]  342         lda     transport_control_reg_a
   120E 10 F7         [ 4]  343         bpl     L1207
   1210 AD 00 03      [ 4]  344         lda     transport_periph$ddr_reg_a
   1213 29 7F         [ 2]  345         and     #0x7F
   1215 60            [ 6]  346         rts
                            347 
                            348 
   1216                     349 L1216:
   1216 A5 49         [ 3]  350         lda     0x49
   1218 F0 03         [ 4]  351         beq     L121D
   121A 4C E6 11      [ 3]  352         jmp     L11E6
                            353 
                            354 
   121D                     355 L121D:
   121D A9 0F         [ 2]  356         lda     #0x0F
   121F 85 49         [ 3]  357         sta     0x49
   1221 A9 02         [ 2]  358         lda     #0x02
   1223 85 57         [ 3]  359         sta     0x57
   1225 68            [ 4]  360         pla
   1226 68            [ 4]  361         pla
                            362 
                            363 
   1227                     364 L1227:
   1227 20 7B 19      [ 6]  365         jsr     L197B
   122A A9 02         [ 2]  366         lda     #0x02
   122C 85 56         [ 3]  367         sta     0x56
   122E 20 EA 14      [ 6]  368         jsr     L14EA
   1231 A9 00         [ 2]  369         lda     #0x00
   1233 8D 80 02      [ 4]  370         sta     U19_PORTA
   1236 A9 00         [ 2]  371         lda     #0x00
   1238 85 63         [ 3]  372         sta     0x63
                            373 
                            374 
   123A                     375 L123A:
   123A AD 05 10      [ 4]  376         lda     X1005
   123D 85 53         [ 3]  377         sta     0x53
                            378 
                            379 
   123F                     380 L123F:
   123F A9 0A         [ 2]  381         lda     #0x0A
   1241 85 4F         [ 3]  382         sta     0x4F
                            383 
                            384 
   1243                     385 L1243:
   1243 20 B8 19      [ 6]  386         jsr     L19B8
   1246 A5 63         [ 3]  387         lda     0x63
   1248 30 03         [ 4]  388         bmi     L124D
   124A 20 56 16      [ 6]  389         jsr     L1656
                            390 
                            391 
   124D                     392 L124D:
   124D A5 6B         [ 3]  393         lda     0x6B
   124F 30 47         [ 4]  394         bmi     L1298
   1251 D0 11         [ 4]  395         bne     L1264
   1253 A9 64         [ 2]  396         lda     #0x64
   1255 85 50         [ 3]  397         sta     0x50
   1257 A9 80         [ 2]  398         lda     #0x80
   1259 20 AF 15      [ 6]  399         jsr     L15AF
   125C A9 03         [ 2]  400         lda     #0x03
   125E 85 6B         [ 3]  401         sta     0x6B
   1260 A9 A0         [ 2]  402         lda     #0xA0
   1262 85 4C         [ 3]  403         sta     0x4C
                            404 
                            405 
   1264                     406 L1264:
   1264 A5 6B         [ 3]  407         lda     0x6B
   1266 6A            [ 2]  408         ror
   1267 90 0B         [ 4]  409         bcc     L1274
   1269 A5 50         [ 3]  410         lda     0x50
   126B D0 07         [ 4]  411         bne     L1274
   126D A9 02         [ 2]  412         lda     #0x02
   126F 85 6B         [ 3]  413         sta     0x6B
   1271 4C 8B 12      [ 3]  414         jmp     L128B
                            415 
                            416 
   1274                     417 L1274:
   1274 AD 02 03      [ 4]  418         lda     transport_periph$ddr_reg_b
   1277 6A            [ 2]  419         ror
   1278 B0 04         [ 4]  420         bcs     L127E
   127A A9 A0         [ 2]  421         lda     #0xA0
   127C 85 4C         [ 3]  422         sta     0x4C
                            423 
                            424 
   127E                     425 L127E:
   127E A5 4C         [ 3]  426         lda     0x4C
   1280 D0 11         [ 4]  427         bne     L1293
   1282 A9 10         [ 2]  428         lda     #0x10
   1284 20 AF 15      [ 6]  429         jsr     L15AF
   1287 A9 80         [ 2]  430         lda     #0x80
   1289 85 6B         [ 3]  431         sta     0x6B
                            432 
                            433 
   128B                     434 L128B:
   128B A9 80         [ 2]  435         lda     #0x80
   128D 2D 02 02      [ 4]  436         and     U18_PORTB
   1290 8D 02 02      [ 4]  437         sta     U18_PORTB
                            438 
                            439 
   1293                     440 L1293:
   1293 A5 6B         [ 3]  441         lda     0x6B
   1295 6A            [ 2]  442         ror
   1296 B0 AB         [ 4]  443         bcs     L1243
                            444 
                            445 
   1298                     446 L1298:
   1298 20 CC 15      [ 6]  447         jsr     L15CC
   129B 20 23 16      [ 6]  448         jsr     L1623
   129E A5 5A         [ 3]  449         lda     0x5A
   12A0 D0 A1         [ 4]  450         bne     L1243
   12A2 AD 02 02      [ 4]  451         lda     U18_PORTB
   12A5 10 93         [ 4]  452         bpl     L123A
   12A7 2A            [ 2]  453         rol
   12A8 2A            [ 2]  454         rol
   12A9 90 03         [ 4]  455         bcc     L12AE
   12AB 4C 87 13      [ 3]  456         jmp     L1387
                            457 
                            458 
   12AE                     459 L12AE:
   12AE 2A            [ 2]  460         rol
   12AF 90 03         [ 4]  461         bcc     L12B4
   12B1 4C 38 13      [ 3]  462         jmp     L1338
                            463 
                            464 
   12B4                     465 L12B4:
   12B4 2A            [ 2]  466         rol
   12B5 90 03         [ 4]  467         bcc     L12BA
   12B7 4C DB 12      [ 3]  468         jmp     L12DB
                            469 
                            470 
   12BA                     471 L12BA:
   12BA 29 F0         [ 2]  472         and     #0xF0
   12BC F0 03         [ 4]  473         beq     L12C1
   12BE 4C 90 13      [ 3]  474         jmp     L1390
                            475 
                            476 
   12C1                     477 L12C1:
   12C1 20 22 17      [ 6]  478         jsr     L1722
   12C4 A5 32         [ 3]  479         lda     0x32
   12C6 C9 01         [ 2]  480         cmp     #0x01
   12C8 F0 0E         [ 4]  481         beq     L12D8
   12CA 20 FF 18      [ 6]  482         jsr     L18FF
   12CD A9 40         [ 2]  483         lda     #0x40
   12CF 85 92         [ 3]  484         sta     0x92
   12D1 A5 53         [ 3]  485         lda     0x53
   12D3 F0 63         [ 4]  486         beq     L1338
   12D5 4C 43 12      [ 3]  487         jmp     L1243
                            488 
                            489 
   12D8                     490 L12D8:
   12D8 4C 3A 12      [ 3]  491         jmp     L123A
                            492 
                            493 
   12DB                     494 L12DB:
   12DB A9 01         [ 2]  495         lda     #0x01
   12DD 85 56         [ 3]  496         sta     0x56
   12DF 20 EA 14      [ 6]  497         jsr     L14EA
   12E2 20 4F 15      [ 6]  498         jsr     L154F
   12E5 20 94 17      [ 6]  499         jsr     L1794
   12E8 E6 56         [ 5]  500         inc     0x56
   12EA 20 FA 14      [ 6]  501         jsr     L14FA
   12ED 4C 3A 12      [ 3]  502         jmp     L123A
                            503 
                            504 
   12F0                     505 L12F0:
   12F0 E6 31         [ 5]  506         inc     0x31
   12F2 20 22 17      [ 6]  507         jsr     L1722
   12F5 A5 32         [ 3]  508         lda     0x32
   12F7 C9 02         [ 2]  509         cmp     #0x02
   12F9 F0 03         [ 4]  510         beq     L12FE
   12FB 4C 43 12      [ 3]  511         jmp     L1243
                            512 
                            513 
   12FE                     514 L12FE:
   12FE A9 31         [ 2]  515         lda     #0x31
   1300 20 64 17      [ 6]  516         jsr     L1764
   1303 20 0A 19      [ 6]  517         jsr     L190A
   1306 AD 04 10      [ 4]  518         lda     X1004
   1309 D0 04         [ 4]  519         bne     L130F
   130B A9 41         [ 2]  520         lda     #0x41
   130D 85 92         [ 3]  521         sta     0x92
                            522 
                            523 
   130F                     524 L130F:
   130F A9 28         [ 2]  525         lda     #0x28
   1311 85 4F         [ 3]  526         sta     0x4F
                            527 
                            528 
   1313                     529 L1313:
   1313 20 B8 19      [ 6]  530         jsr     L19B8
   1316 A5 4F         [ 3]  531         lda     0x4F
   1318 D0 F9         [ 4]  532         bne     L1313
   131A 20 22 17      [ 6]  533         jsr     L1722
   131D A5 32         [ 3]  534         lda     0x32
   131F C9 01         [ 2]  535         cmp     #0x01
   1321 F0 0A         [ 4]  536         beq     L132D
   1323 20 FF 18      [ 6]  537         jsr     L18FF
   1326 A9 40         [ 2]  538         lda     #0x40
   1328 85 92         [ 3]  539         sta     0x92
   132A 4C 43 12      [ 3]  540         jmp     L1243
                            541 
                            542 
   132D                     543 L132D:
   132D AD 02 02      [ 4]  544         lda     U18_PORTB
   1330 29 80         [ 2]  545         and     #0x80
   1332 8D 02 02      [ 4]  546         sta     U18_PORTB
   1335 4C 3A 12      [ 3]  547         jmp     L123A
                            548 
                            549 
   1338                     550 L1338:
   1338 A5 31         [ 3]  551         lda     0x31
   133A F0 B4         [ 4]  552         beq     L12F0
   133C A5 49         [ 3]  553         lda     0x49
   133E C9 0F         [ 2]  554         cmp     #0x0F
   1340 F0 57         [ 4]  555         beq     L1399
   1342 A9 52         [ 2]  556         lda     #0x52
   1344 85 4A         [ 3]  557         sta     0x4A
   1346 A6 44         [ 3]  558         ldx     0x44
   1348 20 DA 14      [ 6]  559         jsr     L14DA
   134B 86 44         [ 3]  560         stx     0x44
   134D A9 A0         [ 2]  561         lda     #0xA0
   134F 8D 02 02      [ 4]  562         sta     U18_PORTB
   1352 20 EA 14      [ 6]  563         jsr     L14EA
   1355 20 4F 15      [ 6]  564         jsr     L154F
                            565 
                            566 
   1358                     567 L1358:
   1358 20 B8 19      [ 6]  568         jsr     L19B8
   135B 20 22 17      [ 6]  569         jsr     L1722
   135E A5 32         [ 3]  570         lda     0x32
   1360 C9 02         [ 2]  571         cmp     #0x02
   1362 F0 04         [ 4]  572         beq     L1368
   1364 C9 01         [ 2]  573         cmp     #0x01
   1366 F0 F0         [ 4]  574         beq     L1358
                            575 
                            576 
   1368                     577 L1368:
   1368 A9 00         [ 2]  578         lda     #0x00
   136A 85 31         [ 3]  579         sta     0x31
   136C 20 94 17      [ 6]  580         jsr     L1794
                            581 
                            582 
   136F                     583 L136F:
   136F A5 56         [ 3]  584         lda     0x56
   1371 C5 70         [ 3]  585         cmp     0x70
   1373 B0 08         [ 4]  586         bcs     L137D
   1375 E6 56         [ 5]  587         inc     0x56
   1377 20 FA 14      [ 6]  588         jsr     L14FA
   137A 4C 3A 12      [ 3]  589         jmp     L123A
                            590 
                            591 
   137D                     592 L137D:
   137D A9 02         [ 2]  593         lda     #0x02
   137F 85 56         [ 3]  594         sta     0x56
   1381 20 13 15      [ 6]  595         jsr     L1513
   1384 4C 3A 12      [ 3]  596         jmp     L123A
                            597 
                            598 
   1387                     599 L1387:
   1387 A5 49         [ 3]  600         lda     0x49
   1389 C9 0F         [ 2]  601         cmp     #0x0F
   138B F0 32         [ 4]  602         beq     L13BF
   138D 4C 6F 13      [ 3]  603         jmp     L136F
                            604 
                            605 
   1390                     606 L1390:
   1390 A5 49         [ 3]  607         lda     0x49
   1392 C9 0F         [ 2]  608         cmp     #0x0F
   1394 F0 58         [ 4]  609         beq     L13EE
   1396 4C 84 14      [ 3]  610         jmp     L1484
                            611 
                            612 
   1399                     613 L1399:
   1399 A9 A0         [ 2]  614         lda     #0xA0
   139B 8D 02 02      [ 4]  615         sta     U18_PORTB
   139E A5 57         [ 3]  616         lda     0x57
   13A0 85 56         [ 3]  617         sta     0x56
   13A2 20 EA 14      [ 6]  618         jsr     L14EA
   13A5 20 4F 15      [ 6]  619         jsr     L154F
                            620 
                            621 
   13A8                     622 L13A8:
   13A8 20 B8 19      [ 6]  623         jsr     L19B8
   13AB 20 22 17      [ 6]  624         jsr     L1722
   13AE A5 32         [ 3]  625         lda     0x32
   13B0 C9 02         [ 2]  626         cmp     #0x02
   13B2 F0 04         [ 4]  627         beq     L13B8
   13B4 C9 01         [ 2]  628         cmp     #0x01
   13B6 F0 F0         [ 4]  629         beq     L13A8
                            630 
                            631 
   13B8                     632 L13B8:
   13B8 A9 00         [ 2]  633         lda     #0x00
   13BA 85 31         [ 3]  634         sta     0x31
   13BC 20 94 17      [ 6]  635         jsr     L1794
                            636 
                            637 
   13BF                     638 L13BF:
   13BF A5 57         [ 3]  639         lda     0x57
   13C1 C5 56         [ 3]  640         cmp     0x56
   13C3 D0 21         [ 4]  641         bne     L13E6
   13C5 E6 57         [ 5]  642         inc     0x57
   13C7 A5 57         [ 3]  643         lda     0x57
   13C9 C9 06         [ 2]  644         cmp     #0x06
   13CB F0 14         [ 4]  645         beq     L13E1
   13CD C9 10         [ 2]  646         cmp     #0x10
   13CF F0 10         [ 4]  647         beq     L13E1
   13D1 C9 1A         [ 2]  648         cmp     #0x1A
   13D3 D0 11         [ 4]  649         bne     L13E6
   13D5 A9 02         [ 2]  650         lda     #0x02
   13D7 85 57         [ 3]  651         sta     0x57
   13D9 A9 02         [ 2]  652         lda     #0x02
   13DB 8D 80 02      [ 4]  653         sta     U19_PORTA
   13DE 4C 27 12      [ 3]  654         jmp     L1227
                            655 
                            656 
   13E1                     657 L13E1:
   13E1 18            [ 2]  658         clc
   13E2 69 06         [ 2]  659         adc     #0x06
   13E4 85 57         [ 3]  660         sta     0x57
                            661 
                            662 
   13E6                     663 L13E6:
   13E6 E6 56         [ 5]  664         inc     0x56
   13E8 20 FA 14      [ 6]  665         jsr     L14FA
   13EB 4C 3A 12      [ 3]  666         jmp     L123A
                            667 
                            668 
   13EE                     669 L13EE:
   13EE AD 02 02      [ 4]  670         lda     U18_PORTB
   13F1 85 5C         [ 3]  671         sta     0x5C
   13F3 29 0F         [ 2]  672         and     #0x0F
   13F5 85 5D         [ 3]  673         sta     0x5D
   13F7 6A            [ 2]  674         ror
   13F8 90 04         [ 4]  675         bcc     L13FE
   13FA A9 09         [ 2]  676         lda     #0x09
   13FC D0 1F         [ 4]  677         bne     L141D
                            678 
                            679 
   13FE                     680 L13FE:
   13FE 6A            [ 2]  681         ror
   13FF 90 13         [ 4]  682         bcc     L1414
   1401 18            [ 2]  683         clc
   1402 A9 06         [ 2]  684         lda     #0x06
   1404 65 58         [ 3]  685         adc     0x58
   1406 E6 58         [ 5]  686         inc     0x58
   1408 A6 58         [ 3]  687         ldx     0x58
   140A E0 03         [ 2]  688         cpx     #0x03
   140C 90 0F         [ 4]  689         bcc     L141D
   140E A2 00         [ 2]  690         ldx     #0x00
   1410 86 58         [ 3]  691         stx     0x58
   1412 F0 09         [ 4]  692         beq     L141D
                            693 
                            694 
   1414                     695 L1414:
   1414 6A            [ 2]  696         ror
   1415 90 04         [ 4]  697         bcc     L141B
   1417 A9 0B         [ 2]  698         lda     #0x0B
   1419 D0 02         [ 4]  699         bne     L141D
                            700 
                            701 
   141B                     702 L141B:
   141B A9 0A         [ 2]  703         lda     #0x0A
                            704 
                            705 
   141D                     706 L141D:
   141D A6 57         [ 3]  707         ldx     0x57
   141F E0 0E         [ 2]  708         cpx     #0x0E
   1421 90 03         [ 4]  709         bcc     L1426
   1423 18            [ 2]  710         clc
   1424 69 0A         [ 2]  711         adc     #0x0A
                            712 
                            713 
   1426                     714 L1426:
   1426 85 56         [ 3]  715         sta     0x56
                            716 
                            717 
   1428                     718 L1428:
   1428 20 EA 14      [ 6]  719         jsr     L14EA
   142B 20 4F 15      [ 6]  720         jsr     L154F
   142E 20 FF 18      [ 6]  721         jsr     L18FF
                            722 
                            723 
   1431                     724 L1431:
   1431 20 B8 19      [ 6]  725         jsr     L19B8
   1434 20 22 17      [ 6]  726         jsr     L1722
   1437 A5 32         [ 3]  727         lda     0x32
   1439 C9 02         [ 2]  728         cmp     #0x02
   143B F0 04         [ 4]  729         beq     L1441
   143D C9 01         [ 2]  730         cmp     #0x01
   143F F0 F0         [ 4]  731         beq     L1431
                            732 
                            733 
   1441                     734 L1441:
   1441 A9 3C         [ 2]  735         lda     #0x3C
   1443 85 53         [ 3]  736         sta     0x53
                            737 
                            738 
   1445                     739 L1445:
   1445 A9 FA         [ 2]  740         lda     #0xFA
   1447 85 4C         [ 3]  741         sta     0x4C
                            742 
                            743 
   1449                     744 L1449:
   1449 20 CC 15      [ 6]  745         jsr     L15CC
   144C A5 5A         [ 3]  746         lda     0x5A
   144E D0 15         [ 4]  747         bne     L1465
   1450 A5 53         [ 3]  748         lda     0x53
   1452 F0 22         [ 4]  749         beq     L1476
   1454 20 B8 19      [ 6]  750         jsr     L19B8
   1457 A5 4C         [ 3]  751         lda     0x4C
   1459 D0 EE         [ 4]  752         bne     L1449
   145B AD 02 02      [ 4]  753         lda     U18_PORTB
   145E 45 5D         [ 3]  754         eor     0x5D
   1460 8D 02 02      [ 4]  755         sta     U18_PORTB
   1463 D0 E0         [ 4]  756         bne     L1445
                            757 
                            758 
   1465                     759 L1465:
   1465 20 B8 19      [ 6]  760         jsr     L19B8
   1468 20 CC 15      [ 6]  761         jsr     L15CC
   146B A5 5A         [ 3]  762         lda     0x5A
   146D D0 F6         [ 4]  763         bne     L1465
   146F AD 02 02      [ 4]  764         lda     U18_PORTB
   1472 C5 5C         [ 3]  765         cmp     0x5C
   1474 F0 03         [ 4]  766         beq     L1479
                            767 
                            768 
   1476                     769 L1476:
   1476 4C 3F 12      [ 3]  770         jmp     L123F
                            771 
                            772 
   1479                     773 L1479:
   1479 20 94 17      [ 6]  774         jsr     L1794
   147C E6 56         [ 5]  775         inc     0x56
   147E 20 FA 14      [ 6]  776         jsr     L14FA
   1481 4C 3A 12      [ 3]  777         jmp     L123A
                            778 
                            779 
   1484                     780 L1484:
   1484 AD 02 02      [ 4]  781         lda     U18_PORTB
   1487 85 5C         [ 3]  782         sta     0x5C
   1489 29 0F         [ 2]  783         and     #0x0F
   148B 85 5D         [ 3]  784         sta     0x5D
   148D 6A            [ 2]  785         ror
   148E 90 03         [ 4]  786         bcc     L1493
   1490 4C B0 14      [ 3]  787         jmp     L14B0
                            788 
                            789 
   1493                     790 L1493:
   1493 6A            [ 2]  791         ror
   1494 90 03         [ 4]  792         bcc     L1499
   1496 4C A2 14      [ 3]  793         jmp     L14A2
                            794 
                            795 
   1499                     796 L1499:
   1499 6A            [ 2]  797         ror
   149A 90 03         [ 4]  798         bcc     L149F
   149C 4C CC 14      [ 3]  799         jmp     L14CC
                            800 
                            801 
   149F                     802 L149F:
   149F 4C BE 14      [ 3]  803         jmp     L14BE
                            804 
                            805 
   14A2                     806 L14A2:
   14A2 A9 42         [ 2]  807         lda     #0x42
   14A4 85 4A         [ 3]  808         sta     0x4A
   14A6 A6 45         [ 3]  809         ldx     0x45
   14A8 20 DA 14      [ 6]  810         jsr     L14DA
   14AB 86 45         [ 3]  811         stx     0x45
   14AD 4C 28 14      [ 3]  812         jmp     L1428
                            813 
                            814 
   14B0                     815 L14B0:
   14B0 A9 43         [ 2]  816         lda     #0x43
   14B2 85 4A         [ 3]  817         sta     0x4A
   14B4 A6 46         [ 3]  818         ldx     0x46
   14B6 20 DA 14      [ 6]  819         jsr     L14DA
   14B9 86 46         [ 3]  820         stx     0x46
   14BB 4C 28 14      [ 3]  821         jmp     L1428
                            822 
                            823 
   14BE                     824 L14BE:
   14BE A9 53         [ 2]  825         lda     #0x53
   14C0 85 4A         [ 3]  826         sta     0x4A
   14C2 A6 47         [ 3]  827         ldx     0x47
   14C4 20 DA 14      [ 6]  828         jsr     L14DA
   14C7 86 47         [ 3]  829         stx     0x47
   14C9 4C 28 14      [ 3]  830         jmp     L1428
                            831 
                            832 
   14CC                     833 L14CC:
   14CC A9 49         [ 2]  834         lda     #0x49
   14CE 85 4A         [ 3]  835         sta     0x4A
   14D0 A6 48         [ 3]  836         ldx     0x48
   14D2 20 DA 14      [ 6]  837         jsr     L14DA
   14D5 86 48         [ 3]  838         stx     0x48
   14D7 4C 28 14      [ 3]  839         jmp     L1428
                            840 
                            841 
   14DA                     842 L14DA:
   14DA E8            [ 2]  843         inx
   14DB E0 1F         [ 2]  844         cpx     #0x1F
   14DD D0 02         [ 4]  845         bne     L14E1
   14DF A2 02         [ 2]  846         ldx     #0x02
                            847 
                            848 
   14E1                     849 L14E1:
   14E1 B5 70         [ 4]  850         lda     0x70,x
   14E3 C5 4A         [ 3]  851         cmp     0x4A
   14E5 D0 F3         [ 4]  852         bne     L14DA
   14E7 86 56         [ 3]  853         stx     0x56
   14E9 60            [ 6]  854         rts
                            855 
                            856 
   14EA                     857 L14EA:
   14EA A5 56         [ 3]  858         lda     0x56
   14EC C5 55         [ 3]  859         cmp     0x55
   14EE 90 06         [ 4]  860         bcc     L14F6
   14F0 F0 03         [ 4]  861         beq     L14F5
   14F2 20 FA 14      [ 6]  862         jsr     L14FA
                            863 
                            864 
   14F5                     865 L14F5:
   14F5 60            [ 6]  866         rts
                            867 
                            868 
   14F6                     869 L14F6:
   14F6 20 13 15      [ 6]  870         jsr     L1513
   14F9 60            [ 6]  871         rts
                            872 
                            873 
   14FA                     874 L14FA:
   14FA A9 20         [ 2]  875         lda     #0x20
   14FC 20 AF 15      [ 6]  876         jsr     L15AF
   14FF 20 87 15      [ 6]  877         jsr     L1587
   1502 E6 55         [ 5]  878         inc     0x55
   1504 A5 55         [ 3]  879         lda     0x55
   1506 8D 82 02      [ 4]  880         sta     U19_PORTB
   1509 A5 56         [ 3]  881         lda     0x56
   150B C5 55         [ 3]  882         cmp     0x55
   150D D0 EB         [ 4]  883         bne     L14FA
   150F 20 2E 15      [ 6]  884         jsr     L152E
   1512 60            [ 6]  885         rts
                            886 
                            887 
   1513                     888 L1513:
   1513 E6 55         [ 5]  889         inc     0x55
                            890 
                            891 
   1515                     892 L1515:
   1515 A9 40         [ 2]  893         lda     #0x40
   1517 20 AF 15      [ 6]  894         jsr     L15AF
   151A 20 87 15      [ 6]  895         jsr     L1587
   151D C6 55         [ 5]  896         dec     0x55
   151F A5 55         [ 3]  897         lda     0x55
   1521 8D 82 02      [ 4]  898         sta     U19_PORTB
   1524 A5 56         [ 3]  899         lda     0x56
   1526 C5 55         [ 3]  900         cmp     0x55
   1528 D0 EB         [ 4]  901         bne     L1515
   152A 20 41 15      [ 6]  902         jsr     L1541
   152D 60            [ 6]  903         rts
                            904 
                            905 
   152E                     906 L152E:
   152E A9 40         [ 2]  907         lda     #0x40
   1530 20 AF 15      [ 6]  908         jsr     L15AF
   1533 20 87 15      [ 6]  909         jsr     L1587
   1536 A9 03         [ 2]  910         lda     #0x03
   1538 85 4F         [ 3]  911         sta     0x4F
                            912 
                            913 
   153A                     914 L153A:
   153A 20 B8 19      [ 6]  915         jsr     L19B8
   153D A5 4F         [ 3]  916         lda     0x4F
   153F D0 F9         [ 4]  917         bne     L153A
                            918 
                            919 
   1541                     920 L1541:
   1541 A9 20         [ 2]  921         lda     #0x20
   1543 20 AF 15      [ 6]  922         jsr     L15AF
   1546 20 87 15      [ 6]  923         jsr     L1587
   1549 A9 10         [ 2]  924         lda     #0x10
   154B 20 AF 15      [ 6]  925         jsr     L15AF
   154E 60            [ 6]  926         rts
                            927 
                            928 
   154F                     929 L154F:
   154F A5 6B         [ 3]  930         lda     0x6B
   1551 30 33         [ 4]  931         bmi     L1586
   1553 A9 80         [ 2]  932         lda     #0x80
   1555 20 AF 15      [ 6]  933         jsr     L15AF
   1558 A9 FA         [ 2]  934         lda     #0xFA
   155A 85 4B         [ 3]  935         sta     0x4B
                            936 
                            937 
   155C                     938 L155C:
   155C 20 B8 19      [ 6]  939         jsr     L19B8
   155F A5 4B         [ 3]  940         lda     0x4B
   1561 D0 F9         [ 4]  941         bne     L155C
                            942 
                            943 
   1563                     944 L1563:
   1563 20 B8 19      [ 6]  945         jsr     L19B8
   1566 AD 02 03      [ 4]  946         lda     transport_periph$ddr_reg_b
   1569 6A            [ 2]  947         ror
   156A 90 F7         [ 4]  948         bcc     L1563
   156C A9 A0         [ 2]  949         lda     #0xA0
   156E 85 4B         [ 3]  950         sta     0x4B
                            951 
                            952 
   1570                     953 L1570:
   1570 AD 02 03      [ 4]  954         lda     transport_periph$ddr_reg_b
   1573 6A            [ 2]  955         ror
   1574 90 E6         [ 4]  956         bcc     L155C
   1576 20 B8 19      [ 6]  957         jsr     L19B8
   1579 A5 4B         [ 3]  958         lda     0x4B
   157B D0 F3         [ 4]  959         bne     L1570
   157D A9 10         [ 2]  960         lda     #0x10
   157F 20 AF 15      [ 6]  961         jsr     L15AF
   1582 A9 80         [ 2]  962         lda     #0x80
   1584 85 6B         [ 3]  963         sta     0x6B
                            964 
                            965 
   1586                     966 L1586:
   1586 60            [ 6]  967         rts
                            968 
                            969 
   1587                     970 L1587:
   1587 A5 55         [ 3]  971         lda     0x55
   1589 8D 82 02      [ 4]  972         sta     U19_PORTB
                            973 
                            974 
   158C                     975 L158C:
   158C A9 00         [ 2]  976         lda     #0x00
   158E 85 59         [ 3]  977         sta     0x59
                            978 
                            979 
   1590                     980 L1590:
   1590 AD 02 03      [ 4]  981         lda     transport_periph$ddr_reg_b
   1593 A9 14         [ 2]  982         lda     #0x14
   1595 85 4B         [ 3]  983         sta     0x4B
   1597 E6 59         [ 5]  984         inc     0x59
   1599 A5 59         [ 3]  985         lda     0x59
   159B C9 21         [ 2]  986         cmp     #0x21
   159D B0 0F         [ 4]  987         bcs     L15AE
                            988 
                            989 
   159F                     990 L159F:
   159F 20 B8 19      [ 6]  991         jsr     L19B8
   15A2 A5 4B         [ 3]  992         lda     0x4B
   15A4 F0 E6         [ 4]  993         beq     L158C
   15A6 AD 03 03      [ 4]  994         lda     transport_control_reg_b
   15A9 10 F4         [ 4]  995         bpl     L159F
   15AB 4C 90 15      [ 3]  996         jmp     L1590
                            997 
                            998 
   15AE                     999 L15AE:
   15AE 60            [ 6] 1000         rts
                           1001 
                           1002 
   15AF                    1003 L15AF:
   15AF 8D 02 03      [ 4] 1004         sta     transport_periph$ddr_reg_b
   15B2 A9 FA         [ 2] 1005         lda     #0xFA
   15B4 85 4B         [ 3] 1006         sta     0x4B
                           1007 
                           1008 
   15B6                    1009 L15B6:
   15B6 20 B8 19      [ 6] 1010         jsr     L19B8
   15B9 A5 4B         [ 3] 1011         lda     0x4B
   15BB D0 F9         [ 4] 1012         bne     L15B6
   15BD AD 02 03      [ 4] 1013         lda     transport_periph$ddr_reg_b
   15C0 29 60         [ 2] 1014         and     #0x60
   15C2 D0 07         [ 4] 1015         bne     L15CB
   15C4 A9 00         [ 2] 1016         lda     #0x00
   15C6 8D 02 03      [ 4] 1017         sta     transport_periph$ddr_reg_b
   15C9 85 6B         [ 3] 1018         sta     0x6B
                           1019 
                           1020 
   15CB                    1021 L15CB:
   15CB 60            [ 6] 1022         rts
                           1023 
                           1024 
   15CC                    1025 L15CC:
   15CC A5 5A         [ 3] 1026         lda     0x5A
   15CE D0 29         [ 4] 1027         bne     L15F9
   15D0 AD 00 02      [ 4] 1028         lda     U18_PORTA
   15D3 49 FF         [ 2] 1029         eor     #0xFF
   15D5 F0 21         [ 4] 1030         beq     L15F8
   15D7 85 5B         [ 3] 1031         sta     0x5B
   15D9 10 09         [ 4] 1032         bpl     L15E4
   15DB 4D 02 02      [ 4] 1033         eor     U18_PORTB
   15DE 8D 02 02      [ 4] 1034         sta     U18_PORTB
   15E1 4C F0 15      [ 3] 1035         jmp     L15F0
                           1036 
                           1037 
   15E4                    1038 L15E4:
   15E4 AD 02 02      [ 4] 1039         lda     U18_PORTB
   15E7 29 80         [ 2] 1040         and     #0x80
   15E9 F0 0D         [ 4] 1041         beq     L15F8
   15EB 05 5B         [ 3] 1042         ora     0x5B
   15ED 8D 02 02      [ 4] 1043         sta     U18_PORTB
                           1044 
                           1045 
   15F0                    1046 L15F0:
   15F0 A9 80         [ 2] 1047         lda     #0x80
   15F2 85 5A         [ 3] 1048         sta     0x5A
   15F4 A9 14         [ 2] 1049         lda     #0x14
   15F6 85 4B         [ 3] 1050         sta     0x4B
                           1051 
                           1052 
   15F8                    1053 L15F8:
   15F8 60            [ 6] 1054         rts
                           1055 
                           1056 
   15F9                    1057 L15F9:
   15F9 A5 5A         [ 3] 1058         lda     0x5A
   15FB 2A            [ 2] 1059         rol
   15FC 90 09         [ 4] 1060         bcc     L1607
   15FE A5 4B         [ 3] 1061         lda     0x4B
   1600 D0 20         [ 4] 1062         bne     L1622
   1602 A9 40         [ 2] 1063         lda     #0x40
   1604 85 5A         [ 3] 1064         sta     0x5A
   1606 60            [ 6] 1065         rts
                           1066 
                           1067 
   1607                    1068 L1607:
   1607 2A            [ 2] 1069         rol
   1608 90 10         [ 4] 1070         bcc     L161A
   160A AD 00 02      [ 4] 1071         lda     U18_PORTA
   160D 49 FF         [ 2] 1072         eor     #0xFF
   160F D0 11         [ 4] 1073         bne     L1622
   1611 A9 20         [ 2] 1074         lda     #0x20
   1613 85 5A         [ 3] 1075         sta     0x5A
   1615 A9 14         [ 2] 1076         lda     #0x14
   1617 85 4B         [ 3] 1077         sta     0x4B
   1619 60            [ 6] 1078         rts
                           1079 
                           1080 
   161A                    1081 L161A:
   161A A5 4B         [ 3] 1082         lda     0x4B
   161C D0 04         [ 4] 1083         bne     L1622
   161E A9 00         [ 2] 1084         lda     #0x00
   1620 85 5A         [ 3] 1085         sta     0x5A
                           1086 
                           1087 
   1622                    1088 L1622:
   1622 60            [ 6] 1089         rts
                           1090 
                           1091 
   1623                    1092 L1623:
   1623 AD 80 02      [ 4] 1093         lda     U19_PORTA
   1626 49 FF         [ 2] 1094         eor     #0xFF
   1628 4A            [ 2] 1095         lsr
   1629 4A            [ 2] 1096         lsr
   162A 4A            [ 2] 1097         lsr
   162B 4A            [ 2] 1098         lsr
   162C 18            [ 2] 1099         clc
   162D 65 5E         [ 3] 1100         adc     0x5E
   162F AA            [ 2] 1101         tax
   1630 BD AB 16      [ 5] 1102         lda     X16AB,x
   1633 85 62         [ 3] 1103         sta     0x62
   1635 A5 4D         [ 3] 1104         lda     0x4D
   1637 D0 16         [ 4] 1105         bne     L164F
   1639 A9 0A         [ 2] 1106         lda     #0x0A
   163B 85 4D         [ 3] 1107         sta     0x4D
   163D A5 62         [ 3] 1108         lda     0x62
   163F CD 82 03      [ 4] 1109         cmp     audio_periph$ddr_reg_b
   1642 90 08         [ 4] 1110         bcc     L164C
   1644 F0 09         [ 4] 1111         beq     L164F
   1646 EE 82 03      [ 6] 1112         inc     audio_periph$ddr_reg_b
   1649 4C 4F 16      [ 3] 1113         jmp     L164F
                           1114 
                           1115 
   164C                    1116 L164C:
   164C CE 82 03      [ 6] 1117         dec     audio_periph$ddr_reg_b
                           1118 
                           1119 
   164F                    1120 L164F:
   164F AD 82 03      [ 4] 1121         lda     audio_periph$ddr_reg_b
   1652 8D 82 02      [ 4] 1122         sta     U19_PORTB
   1655 60            [ 6] 1123         rts
                           1124 
                           1125 
   1656                    1126 L1656:
   1656 A5 63         [ 3] 1127         lda     0x63
   1658 D0 15         [ 4] 1128         bne     L166F
   165A A9 7F         [ 2] 1129         lda     #0x7F
   165C 85 63         [ 3] 1130         sta     0x63
   165E 20 0A 19      [ 6] 1131         jsr     L190A
   1661 A9 0A         [ 2] 1132         lda     #0x0A
   1663 85 51         [ 3] 1133         sta     0x51
   1665 A5 5E         [ 3] 1134         lda     0x5E
   1667 85 5F         [ 3] 1135         sta     0x5F
   1669 A9 00         [ 2] 1136         lda     #0x00
   166B 85 61         [ 3] 1137         sta     0x61
   166D 85 60         [ 3] 1138         sta     0x60
                           1139 
                           1140 
   166F                    1141 L166F:
   166F A5 51         [ 3] 1142         lda     0x51
   1671 D0 1C         [ 4] 1143         bne     L168F
   1673 A9 0A         [ 2] 1144         lda     #0x0A
   1675 85 51         [ 3] 1145         sta     0x51
   1677 A5 60         [ 3] 1146         lda     0x60
   1679 C9 08         [ 2] 1147         cmp     #0x08
   167B F0 13         [ 4] 1148         beq     L1690
   167D E6 60         [ 5] 1149         inc     0x60
   167F A2 09         [ 2] 1150         ldx     #0x09
   1681 38            [ 2] 1151         sec
   1682 AD 80 03      [ 4] 1152         lda     audio_periph$ddr_reg_a
                           1153 
                           1154 
   1685                    1155 L1685:
   1685 2A            [ 2] 1156         rol
   1686 CA            [ 2] 1157         dex
   1687 90 FC         [ 4] 1158         bcc     L1685
   1689 18            [ 2] 1159         clc
   168A 8A            [ 2] 1160         txa
   168B 65 61         [ 3] 1161         adc     0x61
   168D 85 61         [ 3] 1162         sta     0x61
                           1163 
                           1164 
   168F                    1165 L168F:
   168F 60            [ 6] 1166         rts
                           1167 
                           1168 
   1690                    1169 L1690:
   1690 46 61         [ 5] 1170         lsr     0x61
   1692 46 61         [ 5] 1171         lsr     0x61
   1694 46 61         [ 5] 1172         lsr     0x61
   1696 A5 61         [ 3] 1173         lda     0x61
   1698 18            [ 2] 1174         clc
   1699 65 5F         [ 3] 1175         adc     0x5F
   169B 4A            [ 2] 1176         lsr
   169C 85 5E         [ 3] 1177         sta     0x5E
   169E A9 00         [ 2] 1178         lda     #0x00
   16A0 85 61         [ 3] 1179         sta     0x61
   16A2 85 60         [ 3] 1180         sta     0x60
   16A4 A9 FF         [ 2] 1181         lda     #0xFF
   16A6 85 63         [ 3] 1182         sta     0x63
   16A8 4C FF 18      [ 3] 1183         jmp     L18FF
                           1184 
                           1185 
   16AB                    1186 X16AB:
   16AB 03 04 06 08 10 16  1187         .byte   0x03,0x04,0x06,0x08,0x10,0x16,0x20,0x2D,0x40,0x5A,0x80,0xBF,0xFF,0xFF,0xFF,0xFF
        20 2D 40 5A 80 BF
        FF FF FF FF
   16BB FF                 1188         .byte   0xFF
                           1189 
   16BC                    1190 L16BC:
   16BC A2 00         [ 2] 1191         ldx     #0x00
                           1192 
                           1193 
   16BE                    1194 L16BE:
   16BE A9 30         [ 2] 1195         lda     #0x30
   16C0 95 81         [ 4] 1196         sta     0x81,x
   16C2 95 83         [ 4] 1197         sta     0x83,x
   16C4 A9 FF         [ 2] 1198         lda     #0xFF
   16C6 95 80         [ 4] 1199         sta     0x80,x
   16C8 95 82         [ 4] 1200         sta     0x82,x
   16CA A9 34         [ 2] 1201         lda     #0x34
   16CC 95 81         [ 4] 1202         sta     0x81,x
   16CE 95 83         [ 4] 1203         sta     0x83,x
   16D0 A9 00         [ 2] 1204         lda     #0x00
   16D2 95 80         [ 4] 1205         sta     0x80,x
   16D4 95 82         [ 4] 1206         sta     0x82,x
   16D6 E8            [ 2] 1207         inx
   16D7 E8            [ 2] 1208         inx
   16D8 E8            [ 2] 1209         inx
   16D9 E8            [ 2] 1210         inx
   16DA E0 18         [ 2] 1211         cpx     #0x18
   16DC 90 E0         [ 4] 1212         bcc     L16BE
   16DE A9 30         [ 2] 1213         lda     #0x30
   16E0 85 99         [ 3] 1214         sta     0x99
   16E2 85 9B         [ 3] 1215         sta     0x9B
   16E4 85 9D         [ 3] 1216         sta     0x9D
   16E6 85 9F         [ 3] 1217         sta     0x9F
   16E8 A9 FF         [ 2] 1218         lda     #0xFF
   16EA 85 98         [ 3] 1219         sta     0x98
   16EC 85 9A         [ 3] 1220         sta     0x9A
   16EE 85 9C         [ 3] 1221         sta     0x9C
   16F0 85 9E         [ 3] 1222         sta     0x9E
   16F2 A9 34         [ 2] 1223         lda     #0x34
   16F4 85 99         [ 3] 1224         sta     0x99
   16F6 85 9B         [ 3] 1225         sta     0x9B
   16F8 85 9D         [ 3] 1226         sta     0x9D
   16FA 85 9F         [ 3] 1227         sta     0x9F
   16FC AD 00 10      [ 4] 1228         lda     X1000
   16FF 85 98         [ 3] 1229         sta     0x98
   1701 AD 01 10      [ 4] 1230         lda     X1001
   1704 85 9A         [ 3] 1231         sta     0x9A
   1706 AD 02 10      [ 4] 1232         lda     X1002
   1709 85 9C         [ 3] 1233         sta     0x9C
   170B AD 03 10      [ 4] 1234         lda     X1003
   170E 85 9E         [ 3] 1235         sta     0x9E
   1710 A9 24         [ 2] 1236         lda     #0x24
   1712 85 64         [ 3] 1237         sta     0x64
   1714 A9 00         [ 2] 1238         lda     #0x00
   1716 85 67         [ 3] 1239         sta     0x67
   1718 85 69         [ 3] 1240         sta     0x69
   171A 85 6A         [ 3] 1241         sta     0x6A
   171C AD 00 03      [ 4] 1242         lda     transport_periph$ddr_reg_a
   171F A0 00         [ 2] 1243         ldy     #0x00
   1721 60            [ 6] 1244         rts
                           1245 
                           1246 
   1722                    1247 L1722:
   1722 A9 00         [ 2] 1248         lda     #0x00
   1724 85 33         [ 3] 1249         sta     0x33
   1726 A9 02         [ 2] 1250         lda     #0x02
   1728 85 4F         [ 3] 1251         sta     0x4F
                           1252 
                           1253 
   172A                    1254 L172A:
   172A AD 02 01      [ 4] 1255         lda     UART_02
   172D 29 05         [ 2] 1256         and     #0x05
   172F F0 1F         [ 4] 1257         beq     L1750
   1731 A5 33         [ 3] 1258         lda     0x33
   1733 D0 0C         [ 4] 1259         bne     L1741
   1735 AD 01 01      [ 4] 1260         lda     UART_01
   1738 C9 4D         [ 2] 1261         cmp     #0x4D
   173A D0 14         [ 4] 1262         bne     L1750
   173C E6 33         [ 5] 1263         inc     0x33
   173E 4C 50 17      [ 3] 1264         jmp     L1750
                           1265 
                           1266 
   1741                    1267 L1741:
   1741 A9 00         [ 2] 1268         lda     #0x00
   1743 85 33         [ 3] 1269         sta     0x33
   1745 AD 01 01      [ 4] 1270         lda     UART_01
   1748 C9 31         [ 2] 1271         cmp     #0x31
   174A F0 10         [ 4] 1272         beq     L175C
   174C C9 32         [ 2] 1273         cmp     #0x32
   174E F0 10         [ 4] 1274         beq     L1760
                           1275 
                           1276 
   1750                    1277 L1750:
   1750 20 B8 19      [ 6] 1278         jsr     L19B8
   1753 A5 4F         [ 3] 1279         lda     0x4F
   1755 D0 D3         [ 4] 1280         bne     L172A
   1757 A9 00         [ 2] 1281         lda     #0x00
                           1282 
                           1283 
   1759                    1284 L1759:
   1759 85 32         [ 3] 1285         sta     0x32
   175B 60            [ 6] 1286         rts
                           1287 
                           1288 
   175C                    1289 L175C:
   175C A9 01         [ 2] 1290         lda     #0x01
   175E D0 F9         [ 4] 1291         bne     L1759
                           1292 
                           1293 
   1760                    1294 L1760:
   1760 A9 02         [ 2] 1295         lda     #0x02
   1762 D0 F5         [ 4] 1296         bne     L1759
                           1297 
                           1298 
   1764                    1299 L1764:
   1764 48            [ 3] 1300         pha
   1765 A9 02         [ 2] 1301         lda     #0x02
   1767 85 4F         [ 3] 1302         sta     0x4F
   1769 A9 04         [ 2] 1303         lda     #0x04
   176B 85 30         [ 3] 1304         sta     0x30
   176D 68            [ 4] 1305         pla
                           1306 
                           1307 
   176E                    1308 L176E:
   176E 48            [ 3] 1309         pha
   176F 20 B8 19      [ 6] 1310         jsr     L19B8
   1772 A9 53         [ 2] 1311         lda     #0x53
   1774 20 80 17      [ 6] 1312         jsr     L1780
   1777 68            [ 4] 1313         pla
   1778 20 80 17      [ 6] 1314         jsr     L1780
   177B C6 30         [ 5] 1315         dec     0x30
   177D D0 EF         [ 4] 1316         bne     L176E
   177F 60            [ 6] 1317         rts
                           1318 
                           1319 
   1780                    1320 L1780:
   1780 48            [ 3] 1321         pha
                           1322 
                           1323 
   1781                    1324 L1781:
   1781 20 B8 19      [ 6] 1325         jsr     L19B8
   1784 A5 4F         [ 3] 1326         lda     0x4F
   1786 F0 07         [ 4] 1327         beq     L178F
   1788 AD 02 01      [ 4] 1328         lda     UART_02
   178B 29 02         [ 2] 1329         and     #0x02
   178D F0 F2         [ 4] 1330         beq     L1781
                           1331 
                           1332 
   178F                    1333 L178F:
   178F 68            [ 4] 1334         pla
   1790 8D 01 01      [ 4] 1335         sta     UART_01
   1793 60            [ 6] 1336         rts
                           1337 
                           1338 
   1794                    1339 L1794:
   1794 A9 80         [ 2] 1340         lda     #0x80
   1796 20 AF 15      [ 6] 1341         jsr     L15AF
   1799 20 AF 15      [ 6] 1342         jsr     L15AF
                           1343 
                           1344 
   179C                    1345 L179C:
   179C AD 01 03      [ 4] 1346         lda     transport_control_reg_a
   179F 0A            [ 2] 1347         asl
   17A0 90 FA         [ 4] 1348         bcc     L179C
   17A2 AD 00 03      [ 4] 1349         lda     transport_periph$ddr_reg_a
   17A5 29 7F         [ 2] 1350         and     #0x7F
   17A7 C9 24         [ 2] 1351         cmp     #0x24
   17A9 D0 F1         [ 4] 1352         bne     L179C
                           1353 
                           1354 
   17AB                    1355 L17AB:
   17AB AD 01 03      [ 4] 1356         lda     transport_control_reg_a
   17AE 0A            [ 2] 1357         asl
   17AF 90 FA         [ 4] 1358         bcc     L17AB
   17B1 AD 00 03      [ 4] 1359         lda     transport_periph$ddr_reg_a
   17B4 29 7F         [ 2] 1360         and     #0x7F
   17B6 C9 24         [ 2] 1361         cmp     #0x24
   17B8 F0 F1         [ 4] 1362         beq     L17AB
   17BA 29 3F         [ 2] 1363         and     #0x3F
   17BC C5 56         [ 3] 1364         cmp     0x56
   17BE F0 03         [ 4] 1365         beq     L17C3
   17C0 4C 76 10      [ 3] 1366         jmp     L1076
                           1367 
                           1368 
   17C3                    1369 L17C3:
   17C3 20 BC 16      [ 6] 1370         jsr     L16BC
   17C6 20 F4 18      [ 6] 1371         jsr     L18F4
   17C9 A9 41         [ 2] 1372         lda     #0x41
   17CB 85 92         [ 3] 1373         sta     0x92
                           1374 
                           1375 
   17CD                    1376 L17CD:
   17CD AD 01 03      [ 4] 1377         lda     transport_control_reg_a
   17D0 0A            [ 2] 1378         asl
   17D1 90 11         [ 4] 1379         bcc     L17E4
   17D3 AD 00 03      [ 4] 1380         lda     transport_periph$ddr_reg_a
   17D6 29 7F         [ 2] 1381         and     #0x7F
   17D8 85 65         [ 3] 1382         sta     0x65
   17DA C9 22         [ 2] 1383         cmp     #0x22
   17DC 90 EF         [ 4] 1384         bcc     L17CD
   17DE C9 40         [ 2] 1385         cmp     #0x40
   17E0 B0 05         [ 4] 1386         bcs     L17E7
   17E2 85 64         [ 3] 1387         sta     0x64
                           1388 
                           1389 
   17E4                    1390 L17E4:
   17E4 4C 6F 18      [ 3] 1391         jmp     L186F
                           1392 
                           1393 
   17E7                    1394 L17E7:
   17E7 A5 64         [ 3] 1395         lda     0x64
   17E9 29 7E         [ 2] 1396         and     #0x7E
   17EB 38            [ 2] 1397         sec
   17EC E9 22         [ 2] 1398         sbc     #0x22
   17EE AA            [ 2] 1399         tax
   17EF BD 14 1E      [ 5] 1400         lda     X1E14,x
   17F2 85 6C         [ 3] 1401         sta     0x6C
   17F4 BD 15 1E      [ 5] 1402         lda     X1E15,x
   17F7 85 6D         [ 3] 1403         sta     0x6D
   17F9 20 FF 17      [ 6] 1404         jsr     L17FF
   17FC 4C CD 17      [ 3] 1405         jmp     L17CD
                           1406 
                           1407 
   17FF                    1408 L17FF:
   17FF 6C 6C 00      [ 5] 1409         jmp     [0x006C]
                           1410 
                           1411 
   1802                    1412 L1802:
   1802 A5 64         [ 3] 1413         lda     0x64
                           1414 
                           1415 
   1804                    1416 L1804:
   1804 38            [ 2] 1417         sec
   1805 E9 26         [ 2] 1418         sbc     #0x26
   1807 4A            [ 2] 1419         lsr
   1808 A8            [ 2] 1420         tay
   1809 B9 33 1E      [ 5] 1421         lda     X1E33,y
   180C 85 66         [ 3] 1422         sta     0x66
   180E 98            [ 2] 1423         tya
   180F 0A            [ 2] 1424         asl
   1810 0A            [ 2] 1425         asl
   1811 0A            [ 2] 1426         asl
   1812 A8            [ 2] 1427         tay
   1813 A9 01         [ 2] 1428         lda     #0x01
   1815 85 68         [ 3] 1429         sta     0x68
   1817 A5 65         [ 3] 1430         lda     0x65
                           1431 
                           1432 
   1819                    1433 L1819:
   1819 D9 85 1E      [ 5] 1434         cmp     X1E85,y
   181C F0 07         [ 4] 1435         beq     L1825
   181E C8            [ 2] 1436         iny
   181F 06 68         [ 5] 1437         asl     0x68
   1821 90 F6         [ 4] 1438         bcc     L1819
   1823 18            [ 2] 1439         clc
   1824 60            [ 6] 1440         rts
                           1441 
                           1442 
   1825                    1443 L1825:
   1825 A0 00         [ 2] 1444         ldy     #0x00
   1827 A5 64         [ 3] 1445         lda     0x64
   1829 4A            [ 2] 1446         lsr
   182A A5 68         [ 3] 1447         lda     0x68
   182C B0 08         [ 4] 1448         bcs     L1836
   182E 49 FF         [ 2] 1449         eor     #0xFF
   1830 31 66         [ 6] 1450         and     [0x66],y
                           1451 
                           1452 
   1832                    1453 L1832:
   1832 91 66         [ 6] 1454         sta     [0x66],y
   1834 38            [ 2] 1455         sec
   1835 60            [ 6] 1456         rts
                           1457 
                           1458 
   1836                    1459 L1836:
   1836 11 66         [ 6] 1460         ora     [0x66],y
   1838 4C 32 18      [ 3] 1461         jmp     L1832
   183B 20 02 18      [ 6] 1462         jsr     L1802
   183E 90 01         [ 4] 1463         bcc     L1841
   1840 60            [ 6] 1464         rts
                           1465 
                           1466 
   1841                    1467 L1841:
   1841 A9 28         [ 2] 1468         lda     #0x28
   1843 4C 04 18      [ 3] 1469         jmp     L1804
   1846 A5 65         [ 3] 1470         lda     0x65
   1848 C9 40         [ 2] 1471         cmp     #0x40
   184A 90 16         [ 4] 1472         bcc     L1862
   184C C9 60         [ 2] 1473         cmp     #0x60
   184E B0 12         [ 4] 1474         bcs     L1862
   1850 38            [ 2] 1475         sec
   1851 E9 40         [ 2] 1476         sbc     #0x40
   1853 0A            [ 2] 1477         asl
   1854 A8            [ 2] 1478         tay
   1855 B9 43 1E      [ 5] 1479         lda     X1E43,y
   1858 85 66         [ 3] 1480         sta     0x66
   185A B9 44 1E      [ 5] 1481         lda     X1E44,y
   185D 85 68         [ 3] 1482         sta     0x68
   185F 4C 25 18      [ 3] 1483         jmp     L1825
                           1484 
                           1485 
   1862                    1486 L1862:
   1862 60            [ 6] 1487         rts
   1863 20 02 18      [ 6] 1488         jsr     L1802
   1866 B0 05         [ 4] 1489         bcs     L186D
   1868 A9 30         [ 2] 1490         lda     #0x30
   186A 20 04 18      [ 6] 1491         jsr     L1804
                           1492 
                           1493 
   186D                    1494 L186D:
   186D 60            [ 6] 1495         rts
   186E 60            [ 6] 1496         rts
                           1497 
                           1498 
   186F                    1499 L186F:
   186F AD 05 02      [ 4] 1500         lda     U18_edge_detect_control_DI_pos
   1872 30 03         [ 4] 1501         bmi     L1877
   1874 4C CD 17      [ 3] 1502         jmp     L17CD
                           1503 
                           1504 
   1877                    1505 L1877:
   1877 20 23 16      [ 6] 1506         jsr     L1623
   187A AD 02 03      [ 4] 1507         lda     transport_periph$ddr_reg_b
   187D 4A            [ 2] 1508         lsr
   187E 90 04         [ 4] 1509         bcc     L1884
   1880 A9 06         [ 2] 1510         lda     #0x06
   1882 85 4B         [ 3] 1511         sta     0x4B
                           1512 
                           1513 
   1884                    1514 L1884:
   1884 A5 4B         [ 3] 1515         lda     0x4B
   1886 F0 07         [ 4] 1516         beq     L188F
   1888 AD 00 02      [ 4] 1517         lda     U18_PORTA
   188B 29 40         [ 2] 1518         and     #0x40
   188D D0 0E         [ 4] 1519         bne     L189D
                           1520 
                           1521 
   188F                    1522 L188F:
   188F 20 BC 16      [ 6] 1523         jsr     L16BC
   1892 20 7B 19      [ 6] 1524         jsr     L197B
   1895 20 0A 19      [ 6] 1525         jsr     L190A
   1898 A9 00         [ 2] 1526         lda     #0x00
   189A 85 63         [ 3] 1527         sta     0x63
   189C 60            [ 6] 1528         rts
                           1529 
                           1530 
   189D                    1531 L189D:
   189D A5 6A         [ 3] 1532         lda     0x6A
   189F AA            [ 2] 1533         tax
   18A0 29 04         [ 2] 1534         and     #0x04
   18A2 F0 10         [ 4] 1535         beq     L18B4
   18A4 A5 4C         [ 3] 1536         lda     0x4C
   18A6 C9 2B         [ 2] 1537         cmp     #0x2B
   18A8 B0 15         [ 4] 1538         bcs     L18BF
   18AA C9 00         [ 2] 1539         cmp     #0x00
   18AC F0 0A         [ 4] 1540         beq     L18B8
   18AE 8A            [ 2] 1541         txa
   18AF 29 FB         [ 2] 1542         and     #0xFB
   18B1 4C BD 18      [ 3] 1543         jmp     L18BD
                           1544 
                           1545 
   18B4                    1546 L18B4:
   18B4 A9 64         [ 2] 1547         lda     #0x64
   18B6 85 4F         [ 3] 1548         sta     0x4F
                           1549 
                           1550 
   18B8                    1551 L18B8:
   18B8 A9 3C         [ 2] 1552         lda     #0x3C
   18BA 85 4C         [ 3] 1553         sta     0x4C
   18BC 8A            [ 2] 1554         txa
                           1555 
                           1556 
   18BD                    1557 L18BD:
   18BD 85 94         [ 3] 1558         sta     0x94
                           1559 
                           1560 
   18BF                    1561 L18BF:
   18BF A5 6A         [ 3] 1562         lda     0x6A
   18C1 29 04         [ 2] 1563         and     #0x04
   18C3 F0 0A         [ 4] 1564         beq     L18CF
   18C5 A5 4F         [ 3] 1565         lda     0x4F
   18C7 D0 06         [ 4] 1566         bne     L18CF
   18C9 A5 6A         [ 3] 1567         lda     0x6A
   18CB 29 FB         [ 2] 1568         and     #0xFB
   18CD 85 6A         [ 3] 1569         sta     0x6A
                           1570 
                           1571 
   18CF                    1572 L18CF:
   18CF A5 69         [ 3] 1573         lda     0x69
   18D1 29 3E         [ 2] 1574         and     #0x3E
   18D3 85 68         [ 3] 1575         sta     0x68
   18D5 D0 04         [ 4] 1576         bne     L18DB
                           1577 
                           1578 
   18D7                    1579 L18D7:
   18D7 A9 0C         [ 2] 1580         lda     #0x0C
   18D9 85 50         [ 3] 1581         sta     0x50
                           1582 
                           1583 
   18DB                    1584 L18DB:
   18DB A5 50         [ 3] 1585         lda     0x50
   18DD C9 07         [ 2] 1586         cmp     #0x07
   18DF B0 08         [ 4] 1587         bcs     L18E9
   18E1 C9 00         [ 2] 1588         cmp     #0x00
   18E3 F0 F2         [ 4] 1589         beq     L18D7
   18E5 A9 00         [ 2] 1590         lda     #0x00
   18E7 85 68         [ 3] 1591         sta     0x68
                           1592 
                           1593 
   18E9                    1594 L18E9:
   18E9 A5 92         [ 3] 1595         lda     0x92
   18EB 29 C1         [ 2] 1596         and     #0xC1
   18ED 05 68         [ 3] 1597         ora     0x68
   18EF 85 92         [ 3] 1598         sta     0x92
   18F1 4C CD 17      [ 3] 1599         jmp     L17CD
                           1600 
                           1601 
   18F4                    1602 L18F4:
   18F4 A9 34         [ 2] 1603         lda     #0x34
   18F6 48            [ 3] 1604         pha
   18F7 A9 40         [ 2] 1605         lda     #0x40
   18F9 A0 34         [ 2] 1606         ldy     #0x34
   18FB A2 3C         [ 2] 1607         ldx     #0x3C
   18FD D0 14         [ 4] 1608         bne     L1913
                           1609 
                           1610 
   18FF                    1611 L18FF:
   18FF A9 34         [ 2] 1612         lda     #0x34
   1901 48            [ 3] 1613         pha
   1902 A9 00         [ 2] 1614         lda     #0x00
   1904 A0 3C         [ 2] 1615         ldy     #0x3C
   1906 A2 34         [ 2] 1616         ldx     #0x34
   1908 D0 09         [ 4] 1617         bne     L1913
                           1618 
                           1619 
   190A                    1620 L190A:
   190A A9 3C         [ 2] 1621         lda     #0x3C
   190C 48            [ 3] 1622         pha
   190D A9 00         [ 2] 1623         lda     #0x00
   190F A0 3C         [ 2] 1624         ldy     #0x3C
   1911 A2 3C         [ 2] 1625         ldx     #0x3C
                           1626 
                           1627 
   1913                    1628 L1913:
   1913 8E 81 03      [ 4] 1629         stx     audio_control_reg_a
   1916 8C 83 03      [ 4] 1630         sty     audio_control_reg_b
   1919 A2 00         [ 2] 1631         ldx     #0x00
   191B 20 25 19      [ 6] 1632         jsr     L1925
   191E 68            [ 4] 1633         pla
   191F A2 01         [ 2] 1634         ldx     #0x01
   1921 20 25 19      [ 6] 1635         jsr     L1925
   1924 60            [ 6] 1636         rts
                           1637 
                           1638 
   1925                    1639 L1925:
   1925 95 82         [ 4] 1640         sta     0x82,x
   1927 E8            [ 2] 1641         inx
   1928 E8            [ 2] 1642         inx
   1929 E8            [ 2] 1643         inx
   192A E8            [ 2] 1644         inx
   192B E0 17         [ 2] 1645         cpx     #0x17
   192D 90 F6         [ 4] 1646         bcc     L1925
   192F 60            [ 6] 1647         rts
   1930 20 02 18      [ 6] 1648         jsr     L1802
   1933 90 01         [ 4] 1649         bcc     L1936
   1935 60            [ 6] 1650         rts
                           1651 
                           1652 
   1936                    1653 L1936:
   1936 A9 2C         [ 2] 1654         lda     #0x2C
   1938 4C 04 18      [ 3] 1655         jmp     L1804
   193B 20 02 18      [ 6] 1656         jsr     L1802
   193E 90 01         [ 4] 1657         bcc     L1941
   1940 60            [ 6] 1658         rts
                           1659 
                           1660 
   1941                    1661 L1941:
   1941 A9 2E         [ 2] 1662         lda     #0x2E
   1943 4C 04 18      [ 3] 1663         jmp     L1804
   1946 20 02 18      [ 6] 1664         jsr     L1802
   1949 90 01         [ 4] 1665         bcc     L194C
   194B 60            [ 6] 1666         rts
                           1667 
                           1668 
   194C                    1669 L194C:
   194C A9 40         [ 2] 1670         lda     #0x40
   194E 4C 04 18      [ 3] 1671         jmp     L1804
   1951 20 02 18      [ 6] 1672         jsr     L1802
   1954 A5 65         [ 3] 1673         lda     0x65
   1956 C9 41         [ 2] 1674         cmp     #0x41
   1958 F0 01         [ 4] 1675         beq     L195B
   195A 60            [ 6] 1676         rts
                           1677 
                           1678 
   195B                    1679 L195B:
   195B A5 64         [ 3] 1680         lda     0x64
   195D C9 3F         [ 2] 1681         cmp     #0x3F
   195F F0 0D         [ 4] 1682         beq     L196E
   1961 A5 8A         [ 3] 1683         lda     0x8A
   1963 29 DF         [ 2] 1684         and     #0xDF
   1965 85 8A         [ 3] 1685         sta     0x8A
   1967 A5 8E         [ 3] 1686         lda     0x8E
   1969 29 DF         [ 2] 1687         and     #0xDF
   196B 85 8E         [ 3] 1688         sta     0x8E
   196D 60            [ 6] 1689         rts
                           1690 
                           1691 
   196E                    1692 L196E:
   196E A5 8A         [ 3] 1693         lda     0x8A
   1970 09 20         [ 2] 1694         ora     #0x20
   1972 85 8A         [ 3] 1695         sta     0x8A
   1974 A5 8E         [ 3] 1696         lda     0x8E
   1976 09 20         [ 2] 1697         ora     #0x20
   1978 85 8E         [ 3] 1698         sta     0x8E
   197A 60            [ 6] 1699         rts
                           1700 
                           1701 
   197B                    1702 L197B:
   197B A9 FA         [ 2] 1703         lda     #0xFA
   197D 85 3E         [ 3] 1704         sta     0x3E
   197F A9 E6         [ 2] 1705         lda     #0xE6
   1981 85 3F         [ 3] 1706         sta     0x3F
   1983 A9 D2         [ 2] 1707         lda     #0xD2
   1985 85 40         [ 3] 1708         sta     0x40
   1987 A9 BE         [ 2] 1709         lda     #0xBE
   1989 85 41         [ 3] 1710         sta     0x41
   198B A9 AA         [ 2] 1711         lda     #0xAA
   198D 85 42         [ 3] 1712         sta     0x42
   198F A9 AE         [ 2] 1713         lda     #0xAE
   1991 85 38         [ 3] 1714         sta     0x38
   1993 A9 1A         [ 2] 1715         lda     #0x1A
   1995 85 39         [ 3] 1716         sta     0x39
   1997 A9 80         [ 2] 1717         lda     #0x80
   1999 85 34         [ 3] 1718         sta     0x34
   199B A9 1B         [ 2] 1719         lda     #0x1B
   199D 85 35         [ 3] 1720         sta     0x35
   199F A9 38         [ 2] 1721         lda     #0x38
   19A1 85 36         [ 3] 1722         sta     0x36
   19A3 A9 1C         [ 2] 1723         lda     #0x1C
   19A5 85 37         [ 3] 1724         sta     0x37
   19A7 A9 CA         [ 2] 1725         lda     #0xCA
   19A9 85 3A         [ 3] 1726         sta     0x3A
   19AB A9 1C         [ 2] 1727         lda     #0x1C
   19AD 85 3B         [ 3] 1728         sta     0x3B
   19AF A9 86         [ 2] 1729         lda     #0x86
   19B1 85 3C         [ 3] 1730         sta     0x3C
   19B3 A9 1D         [ 2] 1731         lda     #0x1D
   19B5 85 3D         [ 3] 1732         sta     0x3D
   19B7 60            [ 6] 1733         rts
                           1734 
                           1735 
   19B8                    1736 L19B8:
   19B8 20 C8 19      [ 6] 1737         jsr     L19C8
   19BB 20 F6 19      [ 6] 1738         jsr     L19F6
   19BE 20 24 1A      [ 6] 1739         jsr     L1A24
   19C1 20 52 1A      [ 6] 1740         jsr     L1A52
   19C4 20 80 1A      [ 6] 1741         jsr     L1A80
   19C7 60            [ 6] 1742         rts
                           1743 
                           1744 
   19C8                    1745 L19C8:
   19C8 A0 00         [ 2] 1746         ldy     #0x00
   19CA B1 38         [ 6] 1747         lda     [0x38],y
   19CC C9 FF         [ 2] 1748         cmp     #0xFF
   19CE F0 17         [ 4] 1749         beq     L19E7
   19D0 C5 3E         [ 3] 1750         cmp     0x3E
   19D2 D0 12         [ 4] 1751         bne     L19E6
   19D4 C8            [ 2] 1752         iny
   19D5 B1 38         [ 6] 1753         lda     [0x38],y
   19D7 85 80         [ 3] 1754         sta     0x80
   19D9 18            [ 2] 1755         clc
   19DA A5 38         [ 3] 1756         lda     0x38
   19DC 69 02         [ 2] 1757         adc     #0x02
   19DE 85 38         [ 3] 1758         sta     0x38
   19E0 A5 39         [ 3] 1759         lda     0x39
   19E2 69 00         [ 2] 1760         adc     #0x00
   19E4 85 39         [ 3] 1761         sta     0x39
                           1762 
                           1763 
   19E6                    1764 L19E6:
   19E6 60            [ 6] 1765         rts
                           1766 
                           1767 
   19E7                    1768 L19E7:
   19E7 A9 AE         [ 2] 1769         lda     #0xAE
   19E9 85 38         [ 3] 1770         sta     0x38
   19EB A9 1A         [ 2] 1771         lda     #0x1A
   19ED 85 39         [ 3] 1772         sta     0x39
   19EF A9 FA         [ 2] 1773         lda     #0xFA
   19F1 85 3E         [ 3] 1774         sta     0x3E
   19F3 4C E6 19      [ 3] 1775         jmp     L19E6
                           1776 
                           1777 
   19F6                    1778 L19F6:
   19F6 A0 00         [ 2] 1779         ldy     #0x00
   19F8 B1 34         [ 6] 1780         lda     [0x34],y
   19FA C9 FF         [ 2] 1781         cmp     #0xFF
   19FC F0 17         [ 4] 1782         beq     L1A15
   19FE C5 3F         [ 3] 1783         cmp     0x3F
   1A00 D0 12         [ 4] 1784         bne     L1A14
   1A02 C8            [ 2] 1785         iny
   1A03 B1 34         [ 6] 1786         lda     [0x34],y
   1A05 85 84         [ 3] 1787         sta     0x84
   1A07 18            [ 2] 1788         clc
   1A08 A5 34         [ 3] 1789         lda     0x34
   1A0A 69 02         [ 2] 1790         adc     #0x02
   1A0C 85 34         [ 3] 1791         sta     0x34
   1A0E A5 35         [ 3] 1792         lda     0x35
   1A10 69 00         [ 2] 1793         adc     #0x00
   1A12 85 35         [ 3] 1794         sta     0x35
                           1795 
                           1796 
   1A14                    1797 L1A14:
   1A14 60            [ 6] 1798         rts
                           1799 
                           1800 
   1A15                    1801 L1A15:
   1A15 A9 80         [ 2] 1802         lda     #0x80
   1A17 85 34         [ 3] 1803         sta     0x34
   1A19 A9 1B         [ 2] 1804         lda     #0x1B
   1A1B 85 35         [ 3] 1805         sta     0x35
   1A1D A9 E6         [ 2] 1806         lda     #0xE6
   1A1F 85 3F         [ 3] 1807         sta     0x3F
   1A21 4C 14 1A      [ 3] 1808         jmp     L1A14
                           1809 
                           1810 
   1A24                    1811 L1A24:
   1A24 A0 00         [ 2] 1812         ldy     #0x00
   1A26 B1 36         [ 6] 1813         lda     [0x36],y
   1A28 C9 FF         [ 2] 1814         cmp     #0xFF
   1A2A F0 17         [ 4] 1815         beq     L1A43
   1A2C C5 40         [ 3] 1816         cmp     0x40
   1A2E D0 12         [ 4] 1817         bne     L1A42
   1A30 C8            [ 2] 1818         iny
   1A31 B1 36         [ 6] 1819         lda     [0x36],y
   1A33 85 90         [ 3] 1820         sta     0x90
   1A35 18            [ 2] 1821         clc
   1A36 A5 36         [ 3] 1822         lda     0x36
   1A38 69 02         [ 2] 1823         adc     #0x02
   1A3A 85 36         [ 3] 1824         sta     0x36
   1A3C A5 37         [ 3] 1825         lda     0x37
   1A3E 69 00         [ 2] 1826         adc     #0x00
   1A40 85 37         [ 3] 1827         sta     0x37
                           1828 
                           1829 
   1A42                    1830 L1A42:
   1A42 60            [ 6] 1831         rts
                           1832 
                           1833 
   1A43                    1834 L1A43:
   1A43 A9 38         [ 2] 1835         lda     #0x38
   1A45 85 36         [ 3] 1836         sta     0x36
   1A47 A9 1C         [ 2] 1837         lda     #0x1C
   1A49 85 37         [ 3] 1838         sta     0x37
   1A4B A9 D2         [ 2] 1839         lda     #0xD2
   1A4D 85 40         [ 3] 1840         sta     0x40
   1A4F 4C 42 1A      [ 3] 1841         jmp     L1A42
                           1842 
                           1843 
   1A52                    1844 L1A52:
   1A52 A0 00         [ 2] 1845         ldy     #0x00
   1A54 B1 3A         [ 6] 1846         lda     [0x3A],y
   1A56 C9 FF         [ 2] 1847         cmp     #0xFF
   1A58 F0 17         [ 4] 1848         beq     L1A71
   1A5A C5 41         [ 3] 1849         cmp     0x41
   1A5C D0 12         [ 4] 1850         bne     L1A70
   1A5E C8            [ 2] 1851         iny
   1A5F B1 3A         [ 6] 1852         lda     [0x3A],y
   1A61 85 8C         [ 3] 1853         sta     0x8C
   1A63 18            [ 2] 1854         clc
   1A64 A5 3A         [ 3] 1855         lda     0x3A
   1A66 69 02         [ 2] 1856         adc     #0x02
   1A68 85 3A         [ 3] 1857         sta     0x3A
   1A6A A5 3B         [ 3] 1858         lda     0x3B
   1A6C 69 00         [ 2] 1859         adc     #0x00
   1A6E 85 3B         [ 3] 1860         sta     0x3B
                           1861 
                           1862 
   1A70                    1863 L1A70:
   1A70 60            [ 6] 1864         rts
                           1865 
                           1866 
   1A71                    1867 L1A71:
   1A71 A9 CA         [ 2] 1868         lda     #0xCA
   1A73 85 3A         [ 3] 1869         sta     0x3A
   1A75 A9 1C         [ 2] 1870         lda     #0x1C
   1A77 85 3B         [ 3] 1871         sta     0x3B
   1A79 A9 BE         [ 2] 1872         lda     #0xBE
   1A7B 85 41         [ 3] 1873         sta     0x41
   1A7D 4C 70 1A      [ 3] 1874         jmp     L1A70
                           1875 
                           1876 
   1A80                    1877 L1A80:
   1A80 A0 00         [ 2] 1878         ldy     #0x00
   1A82 B1 3C         [ 6] 1879         lda     [0x3C],y
   1A84 C9 FF         [ 2] 1880         cmp     #0xFF
   1A86 F0 17         [ 4] 1881         beq     L1A9F
   1A88 C5 42         [ 3] 1882         cmp     0x42
   1A8A D0 12         [ 4] 1883         bne     L1A9E
   1A8C C8            [ 2] 1884         iny
   1A8D B1 3C         [ 6] 1885         lda     [0x3C],y
   1A8F 85 88         [ 3] 1886         sta     0x88
   1A91 18            [ 2] 1887         clc
   1A92 A5 3C         [ 3] 1888         lda     0x3C
   1A94 69 02         [ 2] 1889         adc     #0x02
   1A96 85 3C         [ 3] 1890         sta     0x3C
   1A98 A5 3D         [ 3] 1891         lda     0x3D
   1A9A 69 00         [ 2] 1892         adc     #0x00
   1A9C 85 3D         [ 3] 1893         sta     0x3D
                           1894 
                           1895 
   1A9E                    1896 L1A9E:
   1A9E 60            [ 6] 1897         rts
                           1898 
                           1899 
   1A9F                    1900 L1A9F:
   1A9F A9 86         [ 2] 1901         lda     #0x86
   1AA1 85 3C         [ 3] 1902         sta     0x3C
   1AA3 A9 1D         [ 2] 1903         lda     #0x1D
   1AA5 85 3D         [ 3] 1904         sta     0x3D
   1AA7 A9 AA         [ 2] 1905         lda     #0xAA
   1AA9 85 42         [ 3] 1906         sta     0x42
   1AAB 4C 9E 1A      [ 3] 1907         jmp     L1A9E
                           1908 
   1AAE                    1909 X1AAE:
   1AAE FA 20 FA           1910         .byte   0xFA,0x20,0xFA
   1AB1 20 F6 22 F5 20 F5  1911         .byte   0x20,0xF6,0x22,0xF5,0x20,0xF5,0x20,0xF3,0x22,0xF2,0x20,0xE5,0x22,0xE5,0x22,0xE2
        20 F3 22 F2 20 E5
        22 E5 22 E2
   1AC1 20 D2 20 BE 00 BC  1912         .byte   0x20,0xD2,0x20,0xBE,0x00,0xBC,0x22,0xBB,0x30,0xB9,0x32,0xB9,0x32,0xB7,0x30,0xB6
        22 BB 30 B9 32 B9
        32 B7 30 B6
   1AD1 32 B5 30 B4 32 B4  1913         .byte   0x32,0xB5,0x30,0xB4,0x32,0xB4,0x32,0xB3,0x20,0xB3,0x20,0xB1,0xA0,0xB1,0xA0,0xB0
        32 B3 20 B3 20 B1
        A0 B1 A0 B0
   1AE1 A2 AF A0 AF A6 AE  1914         .byte   0xA2,0xAF,0xA0,0xAF,0xA6,0xAE,0xA0,0xAE,0xA6,0xAD,0xA4,0xAC,0xA0,0xAC,0xA0,0xAB
        A0 AE A6 AD A4 AC
        A0 AC A0 AB
   1AF1 A0 AA A0 AA A0 A2  1915         .byte   0xA0,0xAA,0xA0,0xAA,0xA0,0xA2,0x80,0xA0,0xA0,0xA0,0xA0,0x8D,0x80,0x8A,0xA0,0x7E
        80 A0 A0 A0 A0 8D
        80 8A A0 7E
   1B01 80 7B A0 79 A4 78  1916         .byte   0x80,0x7B,0xA0,0x79,0xA4,0x78,0xA0,0x77,0xA4,0x76,0xA0,0x75,0xA4,0x74,0xA0,0x73
        A0 77 A4 76 A0 75
        A4 74 A0 73
   1B11 A4 72 A0 71 A4 70  1917         .byte   0xA4,0x72,0xA0,0x71,0xA4,0x70,0xA0,0x6F,0xA4,0x6E,0xA0,0x6D,0xA4,0x6C,0xA0,0x69
        A0 6F A4 6E A0 6D
        A4 6C A0 69
   1B21 80 69 80 67 A0 5E  1918         .byte   0x80,0x69,0x80,0x67,0xA0,0x5E,0x20,0x58,0x24,0x57,0x20,0x57,0x20,0x56,0x24,0x55
        20 58 24 57 20 57
        20 56 24 55
   1B31 20 54 24 54 24 53  1919         .byte   0x20,0x54,0x24,0x54,0x24,0x53,0x20,0x52,0x24,0x52,0x24,0x50,0x20,0x4F,0x24,0x4E
        20 52 24 52 24 50
        20 4F 24 4E
   1B41 20 4D 24 4C 20 4C  1920         .byte   0x20,0x4D,0x24,0x4C,0x20,0x4C,0x20,0x4B,0x24,0x4A,0x20,0x49,0x20,0x49,0x00,0x48
        20 4B 24 4A 20 49
        20 49 00 48
   1B51 20 47 20 47 20 46  1921         .byte   0x20,0x47,0x20,0x47,0x20,0x46,0x20,0x45,0x24,0x45,0x24,0x44,0x20,0x42,0x20,0x42
        20 45 24 45 24 44
        20 42 20 42
   1B61 20 37 04 35 20 2E  1922         .byte   0x20,0x37,0x04,0x35,0x20,0x2E,0x04,0x2E,0x04,0x2D,0x20,0x23,0x24,0x21,0x20,0x17
        04 2E 04 2D 20 23
        24 21 20 17
   1B71 24 13 00 11 24 10  1923         .byte   0x24,0x13,0x00,0x11,0x24,0x10,0x30,0x07,0x34,0x06,0x30,0x05,0x30,0xFF,0xFF,0xD7
        30 07 34 06 30 05
        30 FF FF D7
   1B81 22 D5 20 C9 22 C7  1924         .byte   0x22,0xD5,0x20,0xC9,0x22,0xC7,0x20,0xC4,0x24,0xC3,0x20,0xC2,0x24,0xC1,0x20,0xBF
        20 C4 24 C3 20 C2
        24 C1 20 BF
   1B91 24 BF 24 BE 20 BD  1925         .byte   0x24,0xBF,0x24,0xBE,0x20,0xBD,0x24,0xBC,0x20,0xBB,0x24,0xBA,0x20,0xB9,0x20,0xB8
        24 BC 20 BB 24 BA
        20 B9 20 B8
   1BA1 24 B7 20 B4 00 B4  1926         .byte   0x24,0xB7,0x20,0xB4,0x00,0xB4,0x00,0xB2,0x20,0xA9,0x20,0xA3,0x20,0xA2,0x20,0xA1
        00 B2 20 A9 20 A3
        20 A2 20 A1
   1BB1 20 A0 20 A0 20 9F  1927         .byte   0x20,0xA0,0x20,0xA0,0x20,0x9F,0x20,0x9F,0x20,0x9E,0x20,0x9D,0x24,0x9D,0x24,0x9B
        20 9F 20 9E 20 9D
        24 9D 24 9B
   1BC1 20 9A 24 99 20 98  1928         .byte   0x20,0x9A,0x24,0x99,0x20,0x98,0x20,0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20,0x94
        20 97 24 97 24 95
        20 95 20 94
   1BD1 00 94 00 93 20 92  1929         .byte   0x00,0x94,0x00,0x93,0x20,0x92,0x00,0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20,0x8F
        00 92 00 91 20 90
        20 90 20 8F
   1BE1 20 8D 20 8D 20 81  1930         .byte   0x20,0x8D,0x20,0x8D,0x20,0x81,0x00,0x7F,0x20,0x79,0x00,0x79,0x00,0x78,0x20,0x76
        00 7F 20 79 00 79
        00 78 20 76
   1BF1 20 6B 00 69 20 5E  1931         .byte   0x20,0x6B,0x00,0x69,0x20,0x5E,0x00,0x5C,0x20,0x5B,0x30,0x52,0x10,0x51,0x30,0x50
        00 5C 20 5B 30 52
        10 51 30 50
   1C01 30 50 30 4F 20 4E  1932         .byte   0x30,0x50,0x30,0x4F,0x20,0x4E,0x20,0x4E,0x20,0x4D,0x20,0x46,0xA0,0x45,0xA0,0x3D
        20 4E 20 4D 20 46
        A0 45 A0 3D
   1C11 A0 3D A0 39 20 2A  1933         .byte   0xA0,0x3D,0xA0,0x39,0x20,0x2A,0x00,0x28,0x20,0x1E,0x00,0x1C,0x22,0x1C,0x22,0x1B
        00 28 20 1E 00 1C
        22 1C 22 1B
   1C21 20 1A 22 19 20 18  1934         .byte   0x20,0x1A,0x22,0x19,0x20,0x18,0x22,0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22,0x14
        22 18 22 16 20 15
        22 15 22 14
   1C31 A0 13 A2 11 A0 FF  1935         .byte   0xA0,0x13,0xA2,0x11,0xA0,0xFF,0xFF,0xCD,0x20,0xCC,0x20,0xCB,0x20,0xCB,0x20,0xCA
        FF CD 20 CC 20 CB
        20 CB 20 CA
   1C41 00 C9 20 C9 20 C8  1936         .byte   0x00,0xC9,0x20,0xC9,0x20,0xC8,0x20,0xC1,0xA0,0xC0,0xA0,0xB8,0xA0,0xB8,0x20,0xB4
        20 C1 A0 C0 A0 B8
        A0 B8 20 B4
   1C51 20 A6 00 A4 20 99  1937         .byte   0x20,0xA6,0x00,0xA4,0x20,0x99,0x00,0x97,0x22,0x97,0x22,0x96,0x20,0x95,0x22,0x94
        00 97 22 97 22 96
        20 95 22 94
   1C61 20 93 22 93 22 91  1938         .byte   0x20,0x93,0x22,0x93,0x22,0x91,0x20,0x90,0x20,0x90,0x20,0x8D,0xA0,0x8C,0xA0,0x7D
        20 90 20 90 20 8D
        A0 8C A0 7D
   1C71 A2 7D A2 7B A0 7B  1939         .byte   0xA2,0x7D,0xA2,0x7B,0xA0,0x7B,0xA0,0x79,0xA2,0x79,0xA2,0x77,0xA0,0x77,0xA0,0x76
        A0 79 A2 79 A2 77
        A0 77 A0 76
   1C81 80 75 A0 6E 20 67  1940         .byte   0x80,0x75,0xA0,0x6E,0x20,0x67,0x24,0x66,0x20,0x65,0x24,0x64,0x20,0x63,0x24,0x63
        24 66 20 65 24 64
        20 63 24 63
   1C91 24 61 20 60 24 5F  1941         .byte   0x24,0x61,0x20,0x60,0x24,0x5F,0x20,0x5E,0x20,0x5D,0x24,0x5C,0x20,0x5B,0x24,0x5A
        20 5E 20 5D 24 5C
        20 5B 24 5A
   1CA1 20 59 24 58 20 56  1942         .byte   0x20,0x59,0x24,0x58,0x20,0x56,0x20,0x55,0x04,0x54,0x00,0x53,0x24,0x52,0x20,0x52
        20 55 04 54 00 53
        24 52 20 52
   1CB1 20 4F 24 4F 24 4E  1943         .byte   0x20,0x4F,0x24,0x4F,0x24,0x4E,0x30,0x4D,0x30,0x47,0x10,0x45,0x30,0x35,0x30,0x33
        30 4D 30 47 10 45
        30 35 30 33
   1CC1 10 31 30 31 30 1D  1944         .byte   0x10,0x31,0x30,0x31,0x30,0x1D,0x20,0xFF,0xFF,0xBE,0x00,0xBC,0x22,0xBB,0x30,0xB9
        20 FF FF BE 00 BC
        22 BB 30 B9
   1CD1 32 B9 32 B7 30 B6  1945         .byte   0x32,0xB9,0x32,0xB7,0x30,0xB6,0x32,0xB5,0x30,0xB4,0x32,0xB4,0x32,0xB3,0x20,0xB3
        32 B5 30 B4 32 B4
        32 B3 20 B3
   1CE1 20 B1 A0 B1 A0 B0  1946         .byte   0x20,0xB1,0xA0,0xB1,0xA0,0xB0,0xA2,0xAF,0xA0,0xAF,0xA6,0xAE,0xA0,0xAE,0xA6,0xAD
        A2 AF A0 AF A6 AE
        A0 AE A6 AD
   1CF1 A4 AC A0 AC A0 AB  1947         .byte   0xA4,0xAC,0xA0,0xAC,0xA0,0xAB,0xA0,0xAA,0xA0,0xAA,0xA0,0xA2,0x80,0xA0,0xA0,0xA0
        A0 AA A0 AA A0 A2
        80 A0 A0 A0
   1D01 A0 8D 80 8A A0 7E  1948         .byte   0xA0,0x8D,0x80,0x8A,0xA0,0x7E,0x80,0x7B,0xA0,0x79,0xA4,0x78,0xA0,0x77,0xA4,0x76
        80 7B A0 79 A4 78
        A0 77 A4 76
   1D11 A0 75 A4 74 A0 73  1949         .byte   0xA0,0x75,0xA4,0x74,0xA0,0x73,0xA4,0x72,0xA0,0x71,0xA4,0x70,0xA0,0x6F,0xA4,0x6E
        A4 72 A0 71 A4 70
        A0 6F A4 6E
   1D21 A0 6D A4 6C A0 69  1950         .byte   0xA0,0x6D,0xA4,0x6C,0xA0,0x69,0x80,0x69,0x80,0x67,0xA0,0x5E,0x20,0x58,0x24,0x57
        80 69 80 67 A0 5E
        20 58 24 57
   1D31 20 57 20 56 24 55  1951         .byte   0x20,0x57,0x20,0x56,0x24,0x55,0x20,0x54,0x24,0x54,0x24,0x53,0x20,0x52,0x24,0x52
        20 54 24 54 24 53
        20 52 24 52
   1D41 24 50 20 4F 24 4E  1952         .byte   0x24,0x50,0x20,0x4F,0x24,0x4E,0x20,0x4D,0x24,0x4C,0x20,0x4C,0x20,0x4B,0x24,0x4A
        20 4D 24 4C 20 4C
        20 4B 24 4A
   1D51 20 49 20 49 00 48  1953         .byte   0x20,0x49,0x20,0x49,0x00,0x48,0x20,0x47,0x20,0x47,0x20,0x46,0x20,0x45,0x24,0x45
        20 47 20 47 20 46
        20 45 24 45
   1D61 24 44 20 42 20 42  1954         .byte   0x24,0x44,0x20,0x42,0x20,0x42,0x20,0x37,0x04,0x35,0x20,0x2E,0x04,0x2E,0x04,0x2D
        20 37 04 35 20 2E
        04 2E 04 2D
   1D71 20 23 24 21 20 17  1955         .byte   0x20,0x23,0x24,0x21,0x20,0x17,0x24,0x13,0x00,0x11,0x24,0x10,0x30,0x07,0x34,0x06
        24 13 00 11 24 10
        30 07 34 06
   1D81 30 05 30 FF FF A9  1956         .byte   0x30,0x05,0x30,0xFF,0xFF,0xA9,0x20,0xA3,0x20,0xA2,0x20,0xA1,0x20,0xA0,0x20,0xA0
        20 A3 20 A2 20 A1
        20 A0 20 A0
   1D91 20 9F 20 9F 20 9E  1957         .byte   0x20,0x9F,0x20,0x9F,0x20,0x9E,0x20,0x9D,0x24,0x9D,0x24,0x9B,0x20,0x9A,0x24,0x99
        20 9D 24 9D 24 9B
        20 9A 24 99
   1DA1 20 98 20 97 24 97  1958         .byte   0x20,0x98,0x20,0x97,0x24,0x97,0x24,0x95,0x20,0x95,0x20,0x94,0x00,0x94,0x00,0x93
        24 95 20 95 20 94
        00 94 00 93
   1DB1 20 92 00 92 00 91  1959         .byte   0x20,0x92,0x00,0x92,0x00,0x91,0x20,0x90,0x20,0x90,0x20,0x8F,0x20,0x8D,0x20,0x8D
        20 90 20 90 20 8F
        20 8D 20 8D
   1DC1 20 81 00 7F 20 79  1960         .byte   0x20,0x81,0x00,0x7F,0x20,0x79,0x00,0x79,0x00,0x78,0x20,0x76,0x20,0x6B,0x00,0x69
        00 79 00 78 20 76
        20 6B 00 69
   1DD1 20 5E 00 5C 20 5B  1961         .byte   0x20,0x5E,0x00,0x5C,0x20,0x5B,0x30,0x52,0x10,0x51,0x30,0x50,0x30,0x50,0x30,0x4F
        30 52 10 51 30 50
        30 50 30 4F
   1DE1 20 4E 20 4E 20 4D  1962         .byte   0x20,0x4E,0x20,0x4E,0x20,0x4D,0x20,0x46,0xA0,0x45,0xA0,0x3D,0xA0,0x3D,0xA0,0x39
        20 46 A0 45 A0 3D
        A0 3D A0 39
   1DF1 20 2A 00 28 20 1E  1963         .byte   0x20,0x2A,0x00,0x28,0x20,0x1E,0x00,0x1C,0x22,0x1C,0x22,0x1B,0x20,0x1A,0x22,0x19
        00 1C 22 1C 22 1B
        20 1A 22 19
   1E01 20 18 22 18 22 16  1964         .byte   0x20,0x18,0x22,0x18,0x22,0x16,0x20,0x15,0x22,0x15,0x22,0x14,0xA0,0x13,0xA2,0x11
        20 15 22 15 22 14
        A0 13 A2 11
   1E11 A0 FF FF           1965         .byte   0xA0,0xFF,0xFF
                           1966 
   1E14                    1967 X1E14:
   1E14 46                 1968         .byte   0x46
                           1969 
   1E15                    1970 X1E15:
   1E15 18 32 1E 02 18 32  1971         .byte   0x18,0x32,0x1E,0x02,0x18,0x32,0x1E,0x63,0x18,0x32,0x1E,0x32,0x1E,0x32,0x1E,0x02
        1E 63 18 32 1E 32
        1E 32 1E 02
   1E25 18 30 19 46 19 6E  1972         .byte   0x18,0x30,0x19,0x46,0x19,0x6E,0x18,0x3B,0x18,0x3B,0x19,0x51,0x19,0x60
        18 3B 18 3B 19 51
        19 60
                           1973 
   1E33                    1974 X1E33:
   1E33 6A 96 96 8A 8E 69  1975         .byte   0x6A,0x96,0x96,0x8A,0x8E,0x69,0x80,0x88,0x84,0x00,0x90,0x8C,0x82,0x86,0x00,0x00
        80 88 84 00 90 8C
        82 86 00 00
                           1976 
                           1977 
   1E43                    1978 X1E43:
   1E43 9C                 1979         .byte   0x9C
                           1980 
   1E44                    1981 X1E44:
   1E44 01 98 02 9C 08 9C  1982         .byte   0x01,0x98,0x02,0x9C,0x08,0x9C,0x04,0x9C,0x10,0x98,0x04,0x98,0x08,0x9A,0x20,0x9A
        04 9C 10 98 04 98
        08 9A 20 9A
   1E54 40 9C 20 9C 40 9C  1983         .byte   0x40,0x9C,0x20,0x9C,0x40,0x9C,0x80,0x9A,0x01,0x9A,0x08,0x9A,0x10,0x98,0x40,0x98
        80 9A 01 9A 08 9A
        10 98 40 98
   1E64 80 9A 02 9A 04 98  1984         .byte   0x80,0x9A,0x02,0x9A,0x04,0x98,0x10,0x98,0x20,0x9C,0x02,0x9E,0x01,0x9E,0x08,0x9E
        10 98 20 9C 02 9E
        01 9E 08 9E
   1E74 02 98 01 00 80 9E  1985         .byte   0x02,0x98,0x01,0x00,0x80,0x9E,0x04,0x9E,0x10,0x9E,0x20,0x9E,0x40,0x92,0x01,0x00
        04 9E 10 9E 20 9E
        40 92 01 00
   1E84 00                 1986         .byte   0x00
                           1987 
   1E85                    1988 X1E85:
   1E85 46 45 48 41 4A 4C  1989         .byte   0x46,0x45,0x48,0x41,0x4A,0x4C,0x49,0x42,0x00,0x00,0x00,0x5C,0x57,0x58,0x00,0x00
        49 42 00 00 00 5C
        57 58 00 00
   1E95 41 46 43 00 00 00  1990         .byte   0x41,0x46,0x43,0x00,0x00,0x00,0x00,0x00,0x47,0x42,0x45,0x46,0x4A,0x4B,0x00,0x00
        00 00 47 42 45 46
        4A 4B 00 00
   1EA5 47 42 43 45 46 4A  1991         .byte   0x47,0x42,0x43,0x45,0x46,0x4A,0x00,0x00,0x00,0x4A,0x49,0x4D,0x4B,0x4C,0x00,0x00
        00 00 00 4A 49 4D
        4B 4C 00 00
   1EB5 41 55 43 50 49 4E  1992         .byte   0x41,0x55,0x43,0x50,0x49,0x4E,0x54,0x56,0x41,0x44,0x43,0x56,0x49,0x4E,0x48,0x54
        54 56 41 44 43 56
        49 4E 48 54
   1EC5 41 48 47 50 49 4E  1993         .byte   0x41,0x48,0x47,0x50,0x49,0x4E,0x54,0x56,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        54 56 00 00 00 00
        00 00 00 00
   1ED5 41 44 43 50 46 4E  1994         .byte   0x41,0x44,0x43,0x50,0x46,0x4E,0x4B,0x4C,0x41,0x48,0x4C,0x44,0x49,0x4E,0x54,0x56
        4B 4C 41 48 4C 44
        49 4E 54 56
   1EE5 41 44 43 50 49 42  1995         .byte   0x41,0x44,0x43,0x50,0x49,0x42,0x00,0x00,0x42,0x43,0x44,0x45,0x46,0x4A,0x00,0x00
        00 00 42 43 44 45
        46 4A 00 00
   1EF5 00 00 00 00 00 00  1996         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F05 00 00 00 00 00 00  1997         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F15 00 00 00 00 00 00  1998         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F25 00 00 00 00 00 00  1999         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F35 00 00 00 00 00 00  2000         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F45 00 00 00 00 00 00  2001         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F55 00 00 00 00 00 00  2002         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F65 00 00 00 00 00 00  2003         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F75 00 00 00 00 00 00  2004         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F85 00 00 00 00 00 00  2005         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1F95 00 00 00 00 00 00  2006         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1FA5 00 00 00 00 00 00  2007         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1FB5 00 00 00 00 00 00  2008         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1FC5 00 00 00 00 00 00  2009         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1FD5 00 00 00 00 00 00  2010         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1FE5 00 00 00 00 00 00  2011         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
        00 00 00 00 00 00
        00 00 00 00
   1FF5 00 00 00 00 00 00  2012         .byte   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x76,0x10,0x10,0x10
        00 76 10 10 10
                           2013 
   1FFA                    2014         .org    0x1FFA
                           2015         ;
                           2016         ; vectors
                           2017         ;
   1FFA                    2018 NMIVEC:
   1FFA 00 00              2019         .dw     0x0000
   1FFC                    2020 RESETVEC:
   1FFC 76 10              2021         .dw     L1076
   1FFE                    2022 IRQVEC:
   1FFE 10 10              2023         .dw     L1010
