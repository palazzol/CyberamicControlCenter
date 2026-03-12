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
   1000                       8 L1000:
   1000 48            [ 3]    9         pha
   1001 AD 05 02      [ 4]   10         lda     U18_edge_detect_control_DI_pos
   1004 AD 85 02      [ 4]   11         lda     U19_edge_detect_control_DI_pos
   1007 A9 7D         [ 2]   12         lda     #0x7D
   1009 8D 1D 02      [ 4]   13         sta     U18_1D
   100C A5 50         [ 3]   14         lda     0x50
   100E F0 02         [ 4]   15         beq     L1012
   1010 C6 50         [ 5]   16         dec     0x50
                             17 
                             18 
   1012                      19 L1012:
   1012 A5 51         [ 3]   20         lda     0x51
   1014 F0 02         [ 4]   21         beq     L1018
   1016 C6 51         [ 5]   22         dec     0x51
                             23 
                             24 
   1018                      25 L1018:
   1018 A5 52         [ 3]   26         lda     0x52
   101A F0 02         [ 4]   27         beq     L101E
   101C C6 52         [ 5]   28         dec     0x52
                             29 
                             30 
   101E                      31 L101E:
   101E C6 53         [ 5]   32         dec     0x53
   1020 D0 24         [ 4]   33         bne     L1046
   1022 A9 64         [ 2]   34         lda     #0x64
   1024 85 53         [ 3]   35         sta     0x53
   1026 A5 54         [ 3]   36         lda     0x54
   1028 F0 02         [ 4]   37         beq     L102C
   102A C6 54         [ 5]   38         dec     0x54
                             39 
                             40 
   102C                      41 L102C:
   102C A5 64         [ 3]   42         lda     0x64
   102E F0 02         [ 4]   43         beq     L1032
   1030 C6 64         [ 5]   44         dec     0x64
                             45 
                             46 
   1032                      47 L1032:
   1032 A5 55         [ 3]   48         lda     0x55
   1034 F0 02         [ 4]   49         beq     L1038
   1036 C6 55         [ 5]   50         dec     0x55
                             51 
                             52 
   1038                      53 L1038:
   1038 C6 56         [ 5]   54         dec     0x56
   103A D0 0A         [ 4]   55         bne     L1046
   103C A9 64         [ 2]   56         lda     #0x64
   103E 85 56         [ 3]   57         sta     0x56
   1040 A5 57         [ 3]   58         lda     0x57
   1042 F0 02         [ 4]   59         beq     L1046
   1044 C6 57         [ 5]   60         dec     0x57
                             61 
                             62 
   1046                      63 L1046:
   1046 68            [ 4]   64         pla
   1047 40            [ 6]   65         rti
                             66 
   1048                      67 L1048:
   1048 D8            [ 2]   68         cld
   1049 78            [ 2]   69         sei
   104A A2 F0         [ 2]   70         ldx     #0xF0
   104C 9A            [ 2]   71         txs
   104D A9 00         [ 2]   72         lda     #0x00
   104F A2 10         [ 2]   73         ldx     #0x10
                             74 
                             75 
   1051                      76 L1051:
   1051 95 00         [ 4]   77         sta     0x00,x
   1053 E8            [ 2]   78         inx
   1054 E0 80         [ 2]   79         cpx     #0x80
   1056 D0 F9         [ 4]   80         bne     L1051
   1058 A9 00         [ 2]   81         lda     #0x00
   105A 8D 01 03      [ 4]   82         sta     transport_control_reg_a
   105D 8D 00 03      [ 4]   83         sta     transport_periph$ddr_reg_a
   1060 8D 81 03      [ 4]   84         sta     audio_control_reg_a
   1063 8D 80 03      [ 4]   85         sta     audio_periph$ddr_reg_a
   1066 8D 83 03      [ 4]   86         sta     audio_control_reg_b
   1069 8D 05 02      [ 4]   87         sta     U18_edge_detect_control_DI_pos
   106C 8D 03 03      [ 4]   88         sta     transport_control_reg_b
   106F 8D 06 02      [ 4]   89         sta     U18_06
   1072 8D 86 02      [ 4]   90         sta     U19_06
   1075 8D 01 02      [ 4]   91         sta     U18_DDRA
   1078 A9 02         [ 2]   92         lda     #0x02
   107A 8D 81 02      [ 4]   93         sta     U19_DDRA
   107D A9 FF         [ 2]   94         lda     #0xFF
   107F 8D 82 03      [ 4]   95         sta     audio_periph$ddr_reg_b
   1082 8D 03 02      [ 4]   96         sta     U18_DDRB
   1085 8D 83 02      [ 4]   97         sta     U19_DDRB
   1088 A9 FC         [ 2]   98         lda     #0xFC
   108A 8D 02 03      [ 4]   99         sta     transport_periph$ddr_reg_b
   108D A9 2E         [ 2]  100         lda     #0x2E
   108F 8D 01 03      [ 4]  101         sta     transport_control_reg_a
   1092 8D 03 03      [ 4]  102         sta     transport_control_reg_b
   1095 A9 3C         [ 2]  103         lda     #0x3C
   1097 8D 81 03      [ 4]  104         sta     audio_control_reg_a
   109A 8D 83 03      [ 4]  105         sta     audio_control_reg_b
   109D 58            [ 2]  106         cli
   109E 8D 1C 02      [ 4]  107         sta     U18_1C
   10A1 A9 64         [ 2]  108         lda     #0x64
   10A3 85 53         [ 3]  109         sta     0x53
   10A5 A9 18         [ 2]  110         lda     #0x18
   10A7 85 57         [ 3]  111         sta     0x57
   10A9 A9 64         [ 2]  112         lda     #0x64
   10AB 85 56         [ 3]  113         sta     0x56
   10AD A9 0A         [ 2]  114         lda     #0x0A
   10AF 85 62         [ 3]  115         sta     0x62
   10B1 A9 03         [ 2]  116         lda     #0x03
   10B3 8D 02 01      [ 4]  117         sta     UART_02
   10B6 EA            [ 2]  118         nop
   10B7 A9 09         [ 2]  119         lda     #0x09
   10B9 8D 02 01      [ 4]  120         sta     UART_02
   10BC A9 10         [ 2]  121         lda     #0x10
   10BE 20 34 12      [ 6]  122         jsr     L1234
   10C1 A9 28         [ 2]  123         lda     #0x28
   10C3 85 54         [ 3]  124         sta     0x54
   10C5 A9 64         [ 2]  125         lda     #0x64
   10C7 85 53         [ 3]  126         sta     0x53
                            127 
                            128 
   10C9                     129 L10C9:
   10C9 A5 54         [ 3]  130         lda     0x54
   10CB D0 FC         [ 4]  131         bne     L10C9
   10CD 20 01 12      [ 6]  132         jsr     L1201
                            133 
                            134 
   10D0                     135 L10D0:
   10D0 A9 FA         [ 2]  136         lda     #0xFA
   10D2 85 64         [ 3]  137         sta     0x64
   10D4 A9 00         [ 2]  138         lda     #0x00
   10D6 85 65         [ 3]  139         sta     0x65
   10D8 85 66         [ 3]  140         sta     0x66
   10DA A9 30         [ 2]  141         lda     #0x30
   10DC A9 40         [ 2]  142         lda     #0x40
   10DE 20 34 12      [ 6]  143         jsr     L1234
                            144 
                            145 
   10E1                     146 L10E1:
   10E1 A9 00         [ 2]  147         lda     #0x00
   10E3 85 58         [ 3]  148         sta     0x58
                            149 
                            150 
   10E5                     151 L10E5:
   10E5 AD 02 03      [ 4]  152         lda     transport_periph$ddr_reg_b
   10E8 A9 0A         [ 2]  153         lda     #0x0A
   10EA 85 50         [ 3]  154         sta     0x50
   10EC E6 58         [ 5]  155         inc     0x58
   10EE A5 58         [ 3]  156         lda     0x58
   10F0 C9 64         [ 2]  157         cmp     #0x64
   10F2 B0 0F         [ 4]  158         bcs     L1103
                            159 
                            160 
   10F4                     161 L10F4:
   10F4 20 F3 13      [ 6]  162         jsr     L13F3
   10F7 A5 50         [ 3]  163         lda     0x50
   10F9 F0 E6         [ 4]  164         beq     L10E1
   10FB AD 03 03      [ 4]  165         lda     transport_control_reg_b
   10FE 10 F4         [ 4]  166         bpl     L10F4
   1100 4C E5 10      [ 3]  167         jmp     L10E5
                            168 
                            169 
   1103                     170 L1103:
   1103 A9 20         [ 2]  171         lda     #0x20
   1105 20 34 12      [ 6]  172         jsr     L1234
   1108 A9 19         [ 2]  173         lda     #0x19
   110A 85 54         [ 3]  174         sta     0x54
   110C A9 64         [ 2]  175         lda     #0x64
   110E 85 53         [ 3]  176         sta     0x53
                            177 
                            178 
   1110                     179 L1110:
   1110 20 F3 13      [ 6]  180         jsr     L13F3
   1113 A5 54         [ 3]  181         lda     0x54
   1115 D0 F9         [ 4]  182         bne     L1110
   1117 A9 00         [ 2]  183         lda     #0x00
   1119 85 59         [ 3]  184         sta     0x59
   111B 20 4F 12      [ 6]  185         jsr     L124F
   111E A9 40         [ 2]  186         lda     #0x40
   1120 20 34 12      [ 6]  187         jsr     L1234
   1123 20 4F 12      [ 6]  188         jsr     L124F
   1126 A9 FA         [ 2]  189         lda     #0xFA
   1128 85 50         [ 3]  190         sta     0x50
                            191 
                            192 
   112A                     193 L112A:
   112A 20 F3 13      [ 6]  194         jsr     L13F3
   112D A5 50         [ 3]  195         lda     0x50
   112F D0 F9         [ 4]  196         bne     L112A
   1131 A9 20         [ 2]  197         lda     #0x20
   1133 20 34 12      [ 6]  198         jsr     L1234
   1136 20 4F 12      [ 6]  199         jsr     L124F
   1139 E6 59         [ 5]  200         inc     0x59
   113B A9 10         [ 2]  201         lda     #0x10
   113D 20 34 12      [ 6]  202         jsr     L1234
   1140 A9 80         [ 2]  203         lda     #0x80
   1142 20 34 12      [ 6]  204         jsr     L1234
   1145 20 72 12      [ 6]  205         jsr     L1272
   1148 A9 10         [ 2]  206         lda     #0x10
   114A 20 34 12      [ 6]  207         jsr     L1234
                            208 
                            209 
   114D                     210 L114D:
   114D A9 64         [ 2]  211         lda     #0x64
   114F 85 69         [ 3]  212         sta     0x69
   1151 A9 13         [ 2]  213         lda     #0x13
   1153 85 6A         [ 3]  214         sta     0x6A
   1155 20 AF 13      [ 6]  215         jsr     L13AF
   1158 20 F3 13      [ 6]  216         jsr     L13F3
   115B 20 D9 12      [ 6]  217         jsr     L12D9
   115E AD 02 01      [ 4]  218         lda     UART_02
   1161 29 05         [ 2]  219         and     #0x05
   1163 F0 23         [ 4]  220         beq     L1188
   1165 A5 67         [ 3]  221         lda     0x67
   1167 D0 0C         [ 4]  222         bne     L1175
   1169 AD 01 01      [ 4]  223         lda     UART_01
   116C C9 53         [ 2]  224         cmp     #0x53
   116E D0 18         [ 4]  225         bne     L1188
   1170 E6 67         [ 5]  226         inc     0x67
   1172 4C 88 11      [ 3]  227         jmp     L1188
                            228 
                            229 
   1175                     230 L1175:
   1175 A9 00         [ 2]  231         lda     #0x00
   1177 85 67         [ 3]  232         sta     0x67
   1179 AD 01 01      [ 4]  233         lda     UART_01
   117C C9 31         [ 2]  234         cmp     #0x31
   117E F0 36         [ 4]  235         beq     L11B6
   1180 C9 32         [ 2]  236         cmp     #0x32
   1182 F0 0A         [ 4]  237         beq     L118E
   1184 C9 33         [ 2]  238         cmp     #0x33
   1186 F0 1B         [ 4]  239         beq     L11A3
                            240 
                            241 
   1188                     242 L1188:
   1188 4C 4D 11      [ 3]  243         jmp     L114D
   118B 4C D0 10      [ 3]  244         jmp     L10D0
                            245 
                            246 
   118E                     247 L118E:
   118E A9 FF         [ 2]  248         lda     #0xFF
   1190 85 98         [ 3]  249         sta     0x98
   1192 85 9A         [ 3]  250         sta     0x9A
   1194 85 9C         [ 3]  251         sta     0x9C
   1196 85 9E         [ 3]  252         sta     0x9E
   1198 8D 02 02      [ 4]  253         sta     U18_PORTB
   119B A9 02         [ 2]  254         lda     #0x02
   119D 8D 80 02      [ 4]  255         sta     U19_PORTA
   11A0 4C 4D 11      [ 3]  256         jmp     L114D
                            257 
                            258 
   11A3                     259 L11A3:
   11A3 A9 00         [ 2]  260         lda     #0x00
   11A5 85 98         [ 3]  261         sta     0x98
   11A7 85 9A         [ 3]  262         sta     0x9A
   11A9 85 9C         [ 3]  263         sta     0x9C
   11AB 85 9E         [ 3]  264         sta     0x9E
   11AD 8D 02 02      [ 4]  265         sta     U18_PORTB
   11B0 8D 80 02      [ 4]  266         sta     U19_PORTA
   11B3 4C 4D 11      [ 3]  267         jmp     L114D
                            268 
                            269 
   11B6                     270 L11B6:
   11B6 20 01 12      [ 6]  271         jsr     L1201
   11B9 A9 62         [ 2]  272         lda     #0x62
   11BB 85 69         [ 3]  273         sta     0x69
   11BD A9 13         [ 2]  274         lda     #0x13
   11BF 85 6A         [ 3]  275         sta     0x6A
   11C1 A9 00         [ 2]  276         lda     #0x00
   11C3 8D 80 02      [ 4]  277         sta     U19_PORTA
   11C6 A9 A0         [ 2]  278         lda     #0xA0
   11C8 8D 02 02      [ 4]  279         sta     U18_PORTB
   11CB A9 80         [ 2]  280         lda     #0x80
   11CD 20 34 12      [ 6]  281         jsr     L1234
   11D0 20 72 12      [ 6]  282         jsr     L1272
   11D3 20 98 12      [ 6]  283         jsr     L1298
   11D6 20 01 12      [ 6]  284         jsr     L1201
   11D9 A9 80         [ 2]  285         lda     #0x80
   11DB 8D 02 02      [ 4]  286         sta     U18_PORTB
   11DE E6 59         [ 5]  287         inc     0x59
   11E0 A5 59         [ 3]  288         lda     0x59
   11E2 C9 1A         [ 2]  289         cmp     #0x1A
   11E4 90 03         [ 4]  290         bcc     L11E9
   11E6 4C D0 10      [ 3]  291         jmp     L10D0
                            292 
                            293 
   11E9                     294 L11E9:
   11E9 A9 00         [ 2]  295         lda     #0x00
   11EB 85 65         [ 3]  296         sta     0x65
   11ED 85 66         [ 3]  297         sta     0x66
   11EF A9 FA         [ 2]  298         lda     #0xFA
   11F1 85 64         [ 3]  299         sta     0x64
   11F3 20 72 12      [ 6]  300         jsr     L1272
   11F6 A9 10         [ 2]  301         lda     #0x10
   11F8 20 34 12      [ 6]  302         jsr     L1234
   11FB 20 66 13      [ 6]  303         jsr     L1366
   11FE 4C 4D 11      [ 3]  304         jmp     L114D
                            305 
                            306 
   1201                     307 L1201:
   1201 A9 3C         [ 2]  308         lda     #0x3C
   1203 8D 83 03      [ 4]  309         sta     audio_control_reg_b
   1206 A9 34         [ 2]  310         lda     #0x34
   1208 8D 81 03      [ 4]  311         sta     audio_control_reg_a
   120B A2 00         [ 2]  312         ldx     #0x00
                            313 
                            314 
   120D                     315 L120D:
   120D A9 30         [ 2]  316         lda     #0x30
   120F 95 81         [ 4]  317         sta     0x81,x
   1211 95 83         [ 4]  318         sta     0x83,x
   1213 A9 FF         [ 2]  319         lda     #0xFF
   1215 95 80         [ 4]  320         sta     0x80,x
   1217 95 82         [ 4]  321         sta     0x82,x
   1219 A9 34         [ 2]  322         lda     #0x34
   121B 95 81         [ 4]  323         sta     0x81,x
   121D 95 83         [ 4]  324         sta     0x83,x
   121F A9 00         [ 2]  325         lda     #0x00
   1221 95 80         [ 4]  326         sta     0x80,x
   1223 95 82         [ 4]  327         sta     0x82,x
   1225 E8            [ 2]  328         inx
   1226 E8            [ 2]  329         inx
   1227 E8            [ 2]  330         inx
   1228 E8            [ 2]  331         inx
   1229 E0 20         [ 2]  332         cpx     #0x20
   122B 90 E0         [ 4]  333         bcc     L120D
   122D A9 00         [ 2]  334         lda     #0x00
   122F 85 5D         [ 3]  335         sta     0x5D
   1231 85 63         [ 3]  336         sta     0x63
   1233 60            [ 6]  337         rts
                            338 
                            339 
   1234                     340 L1234:
   1234 8D 02 03      [ 4]  341         sta     transport_periph$ddr_reg_b
   1237 A9 FA         [ 2]  342         lda     #0xFA
   1239 85 50         [ 3]  343         sta     0x50
                            344 
                            345 
   123B                     346 L123B:
   123B 20 F3 13      [ 6]  347         jsr     L13F3
   123E A5 50         [ 3]  348         lda     0x50
   1240 D0 F9         [ 4]  349         bne     L123B
   1242 AD 02 03      [ 4]  350         lda     transport_periph$ddr_reg_b
   1245 29 60         [ 2]  351         and     #0x60
   1247 D0 05         [ 4]  352         bne     L124E
   1249 A9 00         [ 2]  353         lda     #0x00
   124B 8D 02 03      [ 4]  354         sta     transport_periph$ddr_reg_b
                            355 
                            356 
   124E                     357 L124E:
   124E 60            [ 6]  358         rts
                            359 
                            360 
   124F                     361 L124F:
   124F A9 00         [ 2]  362         lda     #0x00
   1251 85 58         [ 3]  363         sta     0x58
                            364 
                            365 
   1253                     366 L1253:
   1253 AD 02 03      [ 4]  367         lda     transport_periph$ddr_reg_b
   1256 A9 0A         [ 2]  368         lda     #0x0A
   1258 85 50         [ 3]  369         sta     0x50
   125A E6 58         [ 5]  370         inc     0x58
   125C A5 58         [ 3]  371         lda     0x58
   125E C9 21         [ 2]  372         cmp     #0x21
   1260 B0 0F         [ 4]  373         bcs     L1271
                            374 
                            375 
   1262                     376 L1262:
   1262 20 F3 13      [ 6]  377         jsr     L13F3
   1265 A5 50         [ 3]  378         lda     0x50
   1267 F0 E6         [ 4]  379         beq     L124F
   1269 AD 03 03      [ 4]  380         lda     transport_control_reg_b
   126C 10 F4         [ 4]  381         bpl     L1262
   126E 4C 53 12      [ 3]  382         jmp     L1253
                            383 
                            384 
   1271                     385 L1271:
   1271 60            [ 6]  386         rts
                            387 
                            388 
   1272                     389 L1272:
   1272 A9 FA         [ 2]  390         lda     #0xFA
   1274 85 50         [ 3]  391         sta     0x50
                            392 
                            393 
   1276                     394 L1276:
   1276 20 F3 13      [ 6]  395         jsr     L13F3
   1279 A5 50         [ 3]  396         lda     0x50
   127B D0 F9         [ 4]  397         bne     L1276
                            398 
                            399 
   127D                     400 L127D:
   127D 20 F3 13      [ 6]  401         jsr     L13F3
   1280 AD 02 03      [ 4]  402         lda     transport_periph$ddr_reg_b
   1283 6A            [ 2]  403         ror
   1284 90 F7         [ 4]  404         bcc     L127D
   1286 A9 A0         [ 2]  405         lda     #0xA0
   1288 85 50         [ 3]  406         sta     0x50
                            407 
                            408 
   128A                     409 L128A:
   128A 20 F3 13      [ 6]  410         jsr     L13F3
   128D AD 02 03      [ 4]  411         lda     transport_periph$ddr_reg_b
   1290 6A            [ 2]  412         ror
   1291 90 EA         [ 4]  413         bcc     L127D
   1293 A5 50         [ 3]  414         lda     0x50
   1295 D0 F3         [ 4]  415         bne     L128A
   1297 60            [ 6]  416         rts
                            417 
                            418 
   1298                     419 L1298:
   1298 AD 00 03      [ 4]  420         lda     transport_periph$ddr_reg_a
   129B A9 40         [ 2]  421         lda     #0x40
   129D 85 82         [ 3]  422         sta     0x82
   129F 85 86         [ 3]  423         sta     0x86
   12A1 85 8A         [ 3]  424         sta     0x8A
   12A3 85 8E         [ 3]  425         sta     0x8E
   12A5 A9 3C         [ 2]  426         lda     #0x3C
   12A7 8D 81 03      [ 4]  427         sta     audio_control_reg_a
   12AA A9 34         [ 2]  428         lda     #0x34
   12AC 8D 83 03      [ 4]  429         sta     audio_control_reg_b
   12AF A9 60         [ 2]  430         lda     #0x60
   12B1 85 82         [ 3]  431         sta     0x82
                            432 
                            433 
   12B3                     434 L12B3:
   12B3 AD 02 03      [ 4]  435         lda     transport_periph$ddr_reg_b
   12B6 4A            [ 2]  436         lsr
   12B7 90 11         [ 4]  437         bcc     L12CA
   12B9 20 D9 12      [ 6]  438         jsr     L12D9
   12BC 20 AF 13      [ 6]  439         jsr     L13AF
   12BF AD 01 03      [ 4]  440         lda     transport_control_reg_a
   12C2 10 EF         [ 4]  441         bpl     L12B3
   12C4 20 F9 12      [ 6]  442         jsr     L12F9
   12C7 4C B3 12      [ 3]  443         jmp     L12B3
                            444 
                            445 
   12CA                     446 L12CA:
   12CA A9 64         [ 2]  447         lda     #0x64
   12CC 85 50         [ 3]  448         sta     0x50
                            449 
                            450 
   12CE                     451 L12CE:
   12CE AD 02 03      [ 4]  452         lda     transport_periph$ddr_reg_b
   12D1 4A            [ 2]  453         lsr
   12D2 B0 C4         [ 4]  454         bcs     L1298
   12D4 A5 50         [ 3]  455         lda     0x50
   12D6 D0 F6         [ 4]  456         bne     L12CE
   12D8 60            [ 6]  457         rts
                            458 
                            459 
   12D9                     460 L12D9:
   12D9 AD 02 01      [ 4]  461         lda     UART_02
   12DC 29 02         [ 2]  462         and     #0x02
   12DE F0 18         [ 4]  463         beq     L12F8
   12E0 A5 68         [ 3]  464         lda     0x68
   12E2 D0 09         [ 4]  465         bne     L12ED
   12E4 A0 00         [ 2]  466         ldy     #0x00
   12E6 B1 69         [ 6]  467         lda     [0x69],y
   12E8 E6 68         [ 5]  468         inc     0x68
   12EA 4C F5 12      [ 3]  469         jmp     L12F5
                            470 
                            471 
   12ED                     472 L12ED:
   12ED A9 00         [ 2]  473         lda     #0x00
   12EF 85 68         [ 3]  474         sta     0x68
   12F1 A0 01         [ 2]  475         ldy     #0x01
   12F3 B1 69         [ 6]  476         lda     [0x69],y
                            477 
                            478 
   12F5                     479 L12F5:
   12F5 8D 01 01      [ 4]  480         sta     UART_01
                            481 
                            482 
   12F8                     483 L12F8:
   12F8 60            [ 6]  484         rts
                            485 
                            486 
   12F9                     487 L12F9:
   12F9 AD 00 03      [ 4]  488         lda     transport_periph$ddr_reg_a
                            489 
                            490 
   12FC                     491 L12FC:
   12FC 29 7F         [ 2]  492         and     #0x7F
   12FE 85 5B         [ 3]  493         sta     0x5B
   1300 29 7E         [ 2]  494         and     #0x7E
   1302 C9 22         [ 2]  495         cmp     #0x22
   1304 F0 3A         [ 4]  496         beq     L1340
   1306 C9 32         [ 2]  497         cmp     #0x32
   1308 90 4F         [ 4]  498         bcc     L1359
   130A C9 3A         [ 2]  499         cmp     #0x3A
   130C 90 32         [ 4]  500         bcc     L1340
   130E A5 5B         [ 3]  501         lda     0x5B
   1310 C9 41         [ 2]  502         cmp     #0x41
   1312 90 45         [ 4]  503         bcc     L1359
   1314 C9 4F         [ 2]  504         cmp     #0x4F
   1316 B0 41         [ 4]  505         bcs     L1359
   1318 A6 63         [ 3]  506         ldx     0x63
   131A 38            [ 2]  507         sec
   131B E9 41         [ 2]  508         sbc     #0x41
   131D C9 08         [ 2]  509         cmp     #0x08
   131F 90 02         [ 4]  510         bcc     L1323
   1321 E8            [ 2]  511         inx
   1322 E8            [ 2]  512         inx
                            513 
                            514 
   1323                     515 L1323:
   1323 29 07         [ 2]  516         and     #0x07
   1325 A8            [ 2]  517         tay
   1326 B9 5A 13      [ 5]  518         lda     X135A,y
   1329 85 5C         [ 3]  519         sta     0x5C
   132B A5 5D         [ 3]  520         lda     0x5D
   132D 4A            [ 2]  521         lsr
   132E B0 09         [ 4]  522         bcs     L1339
   1330 A5 5C         [ 3]  523         lda     0x5C
   1332 49 FF         [ 2]  524         eor     #0xFF
   1334 35 00         [ 4]  525         and     0x00,x
   1336 95 00         [ 4]  526         sta     0x00,x
   1338 60            [ 6]  527         rts
                            528 
                            529 
   1339                     530 L1339:
   1339 A5 5C         [ 3]  531         lda     0x5C
   133B 15 00         [ 4]  532         ora     0x00,x
   133D 95 00         [ 4]  533         sta     0x00,x
   133F 60            [ 6]  534         rts
                            535 
                            536 
   1340                     537 L1340:
   1340 A5 5B         [ 3]  538         lda     0x5B
   1342 85 5D         [ 3]  539         sta     0x5D
   1344 29 7E         [ 2]  540         and     #0x7E
   1346 C9 22         [ 2]  541         cmp     #0x22
   1348 D0 05         [ 4]  542         bne     L134F
   134A A9 98         [ 2]  543         lda     #0x98
   134C 85 63         [ 3]  544         sta     0x63
   134E 60            [ 6]  545         rts
                            546 
                            547 
   134F                     548 L134F:
   134F 38            [ 2]  549         sec
   1350 E9 32         [ 2]  550         sbc     #0x32
   1352 0A            [ 2]  551         asl
   1353 18            [ 2]  552         clc
   1354 69 80         [ 2]  553         adc     #0x80
   1356 85 63         [ 3]  554         sta     0x63
   1358 60            [ 6]  555         rts
                            556 
                            557 
   1359                     558 L1359:
   1359 60            [ 6]  559         rts
                            560 
                            561 
   135A                     562 X135A:
   135A 01 02 04 08 10 20   563         .byte   0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x4D,0x31,0x4D,0x32
        40 80 4D 31 4D 32
                            564 
   1366                     565 L1366:
   1366 A9 00         [ 2]  566         lda     #0x00
   1368 85 60         [ 3]  567         sta     0x60
   136A 85 61         [ 3]  568         sta     0x61
   136C A9 0A         [ 2]  569         lda     #0x0A
   136E 85 54         [ 3]  570         sta     0x54
   1370 A9 64         [ 2]  571         lda     #0x64
   1372 85 53         [ 3]  572         sta     0x53
                            573 
                            574 
   1374                     575 L1374:
   1374 20 F3 13      [ 6]  576         jsr     L13F3
   1377 A5 54         [ 3]  577         lda     0x54
   1379 D0 F9         [ 4]  578         bne     L1374
   137B A9 0A         [ 2]  579         lda     #0x0A
   137D 85 54         [ 3]  580         sta     0x54
   137F A9 64         [ 2]  581         lda     #0x64
   1381 85 53         [ 3]  582         sta     0x53
   1383 A5 61         [ 3]  583         lda     0x61
   1385 C9 08         [ 2]  584         cmp     #0x08
   1387 F0 15         [ 4]  585         beq     L139E
   1389 E6 61         [ 5]  586         inc     0x61
   138B A2 09         [ 2]  587         ldx     #0x09
   138D 38            [ 2]  588         sec
   138E AD 80 03      [ 4]  589         lda     audio_periph$ddr_reg_a
                            590 
                            591 
   1391                     592 L1391:
   1391 2A            [ 2]  593         rol
   1392 CA            [ 2]  594         dex
   1393 90 FC         [ 4]  595         bcc     L1391
   1395 18            [ 2]  596         clc
   1396 8A            [ 2]  597         txa
   1397 65 60         [ 3]  598         adc     0x60
   1399 85 60         [ 3]  599         sta     0x60
   139B 4C 74 13      [ 3]  600         jmp     L1374
                            601 
                            602 
   139E                     603 L139E:
   139E 46 60         [ 5]  604         lsr     0x60
   13A0 46 60         [ 5]  605         lsr     0x60
   13A2 46 60         [ 5]  606         lsr     0x60
   13A4 A5 60         [ 3]  607         lda     0x60
   13A6 85 5F         [ 3]  608         sta     0x5F
   13A8 A9 00         [ 2]  609         lda     #0x00
   13AA 85 60         [ 3]  610         sta     0x60
   13AC 85 61         [ 3]  611         sta     0x61
   13AE 60            [ 6]  612         rts
                            613 
                            614 
   13AF                     615 L13AF:
   13AF AD 80 02      [ 4]  616         lda     U19_PORTA
   13B2 49 FF         [ 2]  617         eor     #0xFF
   13B4 4A            [ 2]  618         lsr
   13B5 4A            [ 2]  619         lsr
   13B6 4A            [ 2]  620         lsr
   13B7 4A            [ 2]  621         lsr
   13B8 18            [ 2]  622         clc
   13B9 65 5F         [ 3]  623         adc     0x5F
   13BB AA            [ 2]  624         tax
   13BC BD E2 13      [ 5]  625         lda     X13E2,x
   13BF 85 62         [ 3]  626         sta     0x62
   13C1 A5 52         [ 3]  627         lda     0x52
   13C3 D0 16         [ 4]  628         bne     L13DB
   13C5 A9 0A         [ 2]  629         lda     #0x0A
   13C7 85 52         [ 3]  630         sta     0x52
   13C9 A5 62         [ 3]  631         lda     0x62
   13CB CD 82 03      [ 4]  632         cmp     audio_periph$ddr_reg_b
   13CE 90 08         [ 4]  633         bcc     L13D8
   13D0 F0 09         [ 4]  634         beq     L13DB
   13D2 EE 82 03      [ 6]  635         inc     audio_periph$ddr_reg_b
   13D5 4C DB 13      [ 3]  636         jmp     L13DB
                            637 
                            638 
   13D8                     639 L13D8:
   13D8 CE 82 03      [ 6]  640         dec     audio_periph$ddr_reg_b
                            641 
                            642 
   13DB                     643 L13DB:
   13DB AD 82 03      [ 4]  644         lda     audio_periph$ddr_reg_b
   13DE 8D 82 02      [ 4]  645         sta     U19_PORTB
   13E1 60            [ 6]  646         rts
                            647 
                            648 
   13E2                     649 X13E2:
   13E2 03 04 06 08 10 16   650         .byte   0x03,0x04,0x06,0x08,0x10,0x16,0x20,0x2D,0x40,0x5A,0x80,0xBF,0xFF,0xFF,0xFF,0xFF
        20 2D 40 5A 80 BF
        FF FF FF FF
   13F2 FF                  651         .byte   0xFF
                            652 
   13F3                     653 L13F3:
   13F3 A5 65         [ 3]  654         lda     0x65
   13F5 AA            [ 2]  655         tax
   13F6 A5 66         [ 3]  656         lda     0x66
   13F8 D0 37         [ 4]  657         bne     L1431
   13FA BD 5F 14      [ 5]  658         lda     X145F,x
   13FD C9 FE         [ 2]  659         cmp     #0xFE
   13FF F0 27         [ 4]  660         beq     L1428
   1401 C9 FF         [ 2]  661         cmp     #0xFF
   1403 D0 0B         [ 4]  662         bne     L1410
   1405 A9 00         [ 2]  663         lda     #0x00
   1407 85 65         [ 3]  664         sta     0x65
   1409 A9 FA         [ 2]  665         lda     #0xFA
   140B 85 64         [ 3]  666         sta     0x64
   140D 4C 27 14      [ 3]  667         jmp     L1427
                            668 
                            669 
   1410                     670 L1410:
   1410 C5 64         [ 3]  671         cmp     0x64
   1412 D0 13         [ 4]  672         bne     L1427
   1414 BD 60 14      [ 5]  673         lda     X1460,x
   1417 20 FC 12      [ 6]  674         jsr     L12FC
   141A BD 61 14      [ 5]  675         lda     X1461,x
   141D 20 FC 12      [ 6]  676         jsr     L12FC
   1420 A5 65         [ 3]  677         lda     0x65
   1422 18            [ 2]  678         clc
   1423 69 03         [ 2]  679         adc     #0x03
   1425 85 65         [ 3]  680         sta     0x65
                            681 
                            682 
   1427                     683 L1427:
   1427 60            [ 6]  684         rts
                            685 
                            686 
   1428                     687 L1428:
   1428 E6 66         [ 5]  688         inc     0x66
   142A A9 00         [ 2]  689         lda     #0x00
   142C 85 65         [ 3]  690         sta     0x65
   142E 4C 27 14      [ 3]  691         jmp     L1427
                            692 
                            693 
   1431                     694 L1431:
   1431 BD 49 15      [ 5]  695         lda     X1549,x
   1434 C9 FF         [ 2]  696         cmp     #0xFF
   1436 D0 0D         [ 4]  697         bne     L1445
   1438 A9 00         [ 2]  698         lda     #0x00
   143A 85 65         [ 3]  699         sta     0x65
   143C 85 66         [ 3]  700         sta     0x66
   143E A9 FA         [ 2]  701         lda     #0xFA
   1440 85 64         [ 3]  702         sta     0x64
   1442 4C 27 14      [ 3]  703         jmp     L1427
                            704 
                            705 
   1445                     706 L1445:
   1445 C5 64         [ 3]  707         cmp     0x64
   1447 D0 DE         [ 4]  708         bne     L1427
   1449 BD 4A 15      [ 5]  709         lda     X154A,x
   144C 20 FC 12      [ 6]  710         jsr     L12FC
   144F BD 4B 15      [ 5]  711         lda     X154B,x
   1452 20 FC 12      [ 6]  712         jsr     L12FC
   1455 A5 65         [ 3]  713         lda     0x65
   1457 18            [ 2]  714         clc
   1458 69 03         [ 2]  715         adc     #0x03
   145A 85 65         [ 3]  716         sta     0x65
   145C 4C 27 14      [ 3]  717         jmp     L1427
                            718 
                            719 
   145F                     720 X145F:
   145F F5                  721         .byte   0xF5
                            722 
   1460                     723 X1460:
   1460 35                  724         .byte   0x35
                            725 
   1461                     726 X1461:
   1461 49 F5 35 4A EE 35   727         .byte   0x49,0xF5,0x35,0x4A,0xEE,0x35,0x46,0xEB,0x33,0x46,0xE9,0x32,0x46,0xE9,0x33,0x42
        46 EB 33 46 E9 32
        46 E9 33 42
   1471 E8 33 46 E7 32 46   728         .byte   0xE8,0x33,0x46,0xE7,0x32,0x46,0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3
        E6 33 46 E5 32 46
        E4 33 46 E3
   1481 32 46 E2 33 46 E1   729         .byte   0x32,0x46,0xE2,0x33,0x46,0xE1,0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33
        32 46 E0 33 46 DF
        32 46 DE 33
   1491 46 DD 32 46 DD 34   730         .byte   0x46,0xDD,0x32,0x46,0xDD,0x34,0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46
        46 DC 33 46 DB 32
        46 DB 35 46
   14A1 DA 33 46 D9 32 46   731         .byte   0xDA,0x33,0x46,0xD9,0x32,0x46,0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5
        D1 32 42 C6 33 47
        C6 33 43 C5
   14B1 32 47 C3 34 46 C2   732         .byte   0x32,0x47,0xC3,0x34,0x46,0xC2,0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34
        33 47 C1 32 47 C0
        35 46 B9 34
   14C1 46 B9 32 43 B7 35   733         .byte   0x46,0xB9,0x32,0x43,0xB7,0x35,0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46
        46 B7 33 42 B3 33
        46 B2 32 46
   14D1 A8 32 42 9D 33 47   734         .byte   0xA8,0x32,0x42,0x9D,0x33,0x47,0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A
        9C 32 47 9B 33 47
        9A 32 47 9A
   14E1 34 46 99 33 47 99   735         .byte   0x34,0x46,0x99,0x33,0x47,0x99,0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33
        33 43 99 35 46 98
        32 47 97 33
   14F1 47 94 32 47 93 33   736         .byte   0x47,0x94,0x32,0x47,0x93,0x33,0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47
        47 92 32 47 91 33
        47 90 32 47
   1501 87 33 42 86 32 43   737         .byte   0x87,0x33,0x42,0x86,0x32,0x43,0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77
        7D 33 46 7C 32 46
        77 32 42 77
   1511 34 46 75 32 43 75   738         .byte   0x34,0x46,0x75,0x32,0x43,0x75,0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33
        35 46 6A 33 46 69
        32 46 67 33
   1521 46 66 32 46 66 32   739         .byte   0x46,0x66,0x32,0x46,0x66,0x32,0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42
        43 65 34 46 62 35
        46 62 33 42
   1531 56 33 46 55 32 46   740         .byte   0x56,0x33,0x46,0x55,0x32,0x46,0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52
        55 32 42 54 33 46
        53 32 46 52
   1541 33 46 51 32 46 FE   741         .byte   0x33,0x46,0x51,0x32,0x46,0xFE,0xFE,0xFE
        FE FE
                            742 
   1549                     743 X1549:
   1549 50                  744         .byte   0x50
                            745 
   154A                     746 X154A:
   154A 33                  747         .byte   0x33
                            748 
   154B                     749 X154B:
   154B 46 4F 32 46 4E 33   750         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   155B 4B 32 46 40 34 46   751         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   156B 33 47 39 32 47 32   752         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   157B 46 26 33 43 23 33   753         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   158B 1B 33 47 1A 32 47   754         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   159B 33 47 17 32 42 16   755         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   15AB 43 03 33 46 02 32   756         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
                            757 
   1FFA                     758         .org    0x1FFA
                            759         ;
                            760         ; vectors
                            761         ;
   1FFA                     762 NMIVEC:
   1FFA FF FF               763         .dw     0xFFFF
   1FFC                     764 RESETVEC:
   1FFC 48 10               765         .dw     L1048
   1FFE                     766 IRQVEC:
   1FFE 00 10               767         .dw     L1000
