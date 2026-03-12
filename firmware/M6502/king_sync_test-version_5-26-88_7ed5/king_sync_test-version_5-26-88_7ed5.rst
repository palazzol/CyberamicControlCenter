                              1 
                              2         .area   region1 (ABS)
                              3 
                              4         .include "../include/ptt6502.def"
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
   10B1 A9 09         [ 2]  116         lda     #0x09
   10B3 8D 02 01      [ 4]  117         sta     UART_02
   10B6 A9 10         [ 2]  118         lda     #0x10
   10B8 20 2E 12      [ 6]  119         jsr     L122E
   10BB A9 28         [ 2]  120         lda     #0x28
   10BD 85 54         [ 3]  121         sta     0x54
   10BF A9 64         [ 2]  122         lda     #0x64
   10C1 85 53         [ 3]  123         sta     0x53
                            124 
                            125 
   10C3                     126 L10C3:
   10C3 A5 54         [ 3]  127         lda     0x54
   10C5 D0 FC         [ 4]  128         bne     L10C3
   10C7 20 FB 11      [ 6]  129         jsr     L11FB
                            130 
                            131 
   10CA                     132 L10CA:
   10CA A9 FA         [ 2]  133         lda     #0xFA
   10CC 85 64         [ 3]  134         sta     0x64
   10CE A9 00         [ 2]  135         lda     #0x00
   10D0 85 65         [ 3]  136         sta     0x65
   10D2 85 66         [ 3]  137         sta     0x66
   10D4 A9 30         [ 2]  138         lda     #0x30
   10D6 A9 40         [ 2]  139         lda     #0x40
   10D8 20 2E 12      [ 6]  140         jsr     L122E
                            141 
                            142 
   10DB                     143 L10DB:
   10DB A9 00         [ 2]  144         lda     #0x00
   10DD 85 58         [ 3]  145         sta     0x58
                            146 
                            147 
   10DF                     148 L10DF:
   10DF AD 02 03      [ 4]  149         lda     transport_periph$ddr_reg_b
   10E2 A9 0A         [ 2]  150         lda     #0x0A
   10E4 85 50         [ 3]  151         sta     0x50
   10E6 E6 58         [ 5]  152         inc     0x58
   10E8 A5 58         [ 3]  153         lda     0x58
   10EA C9 64         [ 2]  154         cmp     #0x64
   10EC B0 0F         [ 4]  155         bcs     L10FD
                            156 
                            157 
   10EE                     158 L10EE:
   10EE 20 ED 13      [ 6]  159         jsr     L13ED
   10F1 A5 50         [ 3]  160         lda     0x50
   10F3 F0 E6         [ 4]  161         beq     L10DB
   10F5 AD 03 03      [ 4]  162         lda     transport_control_reg_b
   10F8 10 F4         [ 4]  163         bpl     L10EE
   10FA 4C DF 10      [ 3]  164         jmp     L10DF
                            165 
                            166 
   10FD                     167 L10FD:
   10FD A9 20         [ 2]  168         lda     #0x20
   10FF 20 2E 12      [ 6]  169         jsr     L122E
   1102 A9 19         [ 2]  170         lda     #0x19
   1104 85 54         [ 3]  171         sta     0x54
   1106 A9 64         [ 2]  172         lda     #0x64
   1108 85 53         [ 3]  173         sta     0x53
                            174 
                            175 
   110A                     176 L110A:
   110A 20 ED 13      [ 6]  177         jsr     L13ED
   110D A5 54         [ 3]  178         lda     0x54
   110F D0 F9         [ 4]  179         bne     L110A
   1111 A9 00         [ 2]  180         lda     #0x00
   1113 85 59         [ 3]  181         sta     0x59
   1115 20 49 12      [ 6]  182         jsr     L1249
   1118 A9 40         [ 2]  183         lda     #0x40
   111A 20 2E 12      [ 6]  184         jsr     L122E
   111D 20 49 12      [ 6]  185         jsr     L1249
   1120 A9 FA         [ 2]  186         lda     #0xFA
   1122 85 50         [ 3]  187         sta     0x50
                            188 
                            189 
   1124                     190 L1124:
   1124 20 ED 13      [ 6]  191         jsr     L13ED
   1127 A5 50         [ 3]  192         lda     0x50
   1129 D0 F9         [ 4]  193         bne     L1124
   112B A9 20         [ 2]  194         lda     #0x20
   112D 20 2E 12      [ 6]  195         jsr     L122E
   1130 20 49 12      [ 6]  196         jsr     L1249
   1133 E6 59         [ 5]  197         inc     0x59
   1135 A9 10         [ 2]  198         lda     #0x10
   1137 20 2E 12      [ 6]  199         jsr     L122E
   113A A9 80         [ 2]  200         lda     #0x80
   113C 20 2E 12      [ 6]  201         jsr     L122E
   113F 20 6C 12      [ 6]  202         jsr     L126C
   1142 A9 10         [ 2]  203         lda     #0x10
   1144 20 2E 12      [ 6]  204         jsr     L122E
                            205 
                            206 
   1147                     207 L1147:
   1147 A9 5E         [ 2]  208         lda     #0x5E
   1149 85 69         [ 3]  209         sta     0x69
   114B A9 13         [ 2]  210         lda     #0x13
   114D 85 6A         [ 3]  211         sta     0x6A
   114F 20 A9 13      [ 6]  212         jsr     L13A9
   1152 20 ED 13      [ 6]  213         jsr     L13ED
   1155 20 D3 12      [ 6]  214         jsr     L12D3
   1158 AD 02 01      [ 4]  215         lda     UART_02
   115B 29 05         [ 2]  216         and     #0x05
   115D F0 23         [ 4]  217         beq     L1182
   115F A5 67         [ 3]  218         lda     0x67
   1161 D0 0C         [ 4]  219         bne     L116F
   1163 AD 01 01      [ 4]  220         lda     UART_01
   1166 C9 53         [ 2]  221         cmp     #0x53
   1168 D0 18         [ 4]  222         bne     L1182
   116A E6 67         [ 5]  223         inc     0x67
   116C 4C 82 11      [ 3]  224         jmp     L1182
                            225 
                            226 
   116F                     227 L116F:
   116F A9 00         [ 2]  228         lda     #0x00
   1171 85 67         [ 3]  229         sta     0x67
   1173 AD 01 01      [ 4]  230         lda     UART_01
   1176 C9 31         [ 2]  231         cmp     #0x31
   1178 F0 36         [ 4]  232         beq     L11B0
   117A C9 32         [ 2]  233         cmp     #0x32
   117C F0 0A         [ 4]  234         beq     L1188
   117E C9 33         [ 2]  235         cmp     #0x33
   1180 F0 1B         [ 4]  236         beq     L119D
                            237 
                            238 
   1182                     239 L1182:
   1182 4C 47 11      [ 3]  240         jmp     L1147
   1185 4C CA 10      [ 3]  241         jmp     L10CA
                            242 
                            243 
   1188                     244 L1188:
   1188 A9 FF         [ 2]  245         lda     #0xFF
   118A 85 98         [ 3]  246         sta     0x98
   118C 85 9A         [ 3]  247         sta     0x9A
   118E 85 9C         [ 3]  248         sta     0x9C
   1190 85 9E         [ 3]  249         sta     0x9E
   1192 8D 02 02      [ 4]  250         sta     U18_PORTB
   1195 A9 02         [ 2]  251         lda     #0x02
   1197 8D 80 02      [ 4]  252         sta     U19_PORTA
   119A 4C 47 11      [ 3]  253         jmp     L1147
                            254 
                            255 
   119D                     256 L119D:
   119D A9 00         [ 2]  257         lda     #0x00
   119F 85 98         [ 3]  258         sta     0x98
   11A1 85 9A         [ 3]  259         sta     0x9A
   11A3 85 9C         [ 3]  260         sta     0x9C
   11A5 85 9E         [ 3]  261         sta     0x9E
   11A7 8D 02 02      [ 4]  262         sta     U18_PORTB
   11AA 8D 80 02      [ 4]  263         sta     U19_PORTA
   11AD 4C 47 11      [ 3]  264         jmp     L1147
                            265 
                            266 
   11B0                     267 L11B0:
   11B0 20 FB 11      [ 6]  268         jsr     L11FB
   11B3 A9 5C         [ 2]  269         lda     #0x5C
   11B5 85 69         [ 3]  270         sta     0x69
   11B7 A9 13         [ 2]  271         lda     #0x13
   11B9 85 6A         [ 3]  272         sta     0x6A
   11BB A9 00         [ 2]  273         lda     #0x00
   11BD 8D 80 02      [ 4]  274         sta     U19_PORTA
   11C0 A9 A0         [ 2]  275         lda     #0xA0
   11C2 8D 02 02      [ 4]  276         sta     U18_PORTB
   11C5 A9 80         [ 2]  277         lda     #0x80
   11C7 20 2E 12      [ 6]  278         jsr     L122E
   11CA 20 6C 12      [ 6]  279         jsr     L126C
   11CD 20 92 12      [ 6]  280         jsr     L1292
   11D0 20 FB 11      [ 6]  281         jsr     L11FB
   11D3 A9 80         [ 2]  282         lda     #0x80
   11D5 8D 02 02      [ 4]  283         sta     U18_PORTB
   11D8 E6 59         [ 5]  284         inc     0x59
   11DA A5 59         [ 3]  285         lda     0x59
   11DC C9 1A         [ 2]  286         cmp     #0x1A
   11DE 90 03         [ 4]  287         bcc     L11E3
   11E0 4C CA 10      [ 3]  288         jmp     L10CA
                            289 
                            290 
   11E3                     291 L11E3:
   11E3 A9 00         [ 2]  292         lda     #0x00
   11E5 85 65         [ 3]  293         sta     0x65
   11E7 85 66         [ 3]  294         sta     0x66
   11E9 A9 FA         [ 2]  295         lda     #0xFA
   11EB 85 64         [ 3]  296         sta     0x64
   11ED 20 6C 12      [ 6]  297         jsr     L126C
   11F0 A9 10         [ 2]  298         lda     #0x10
   11F2 20 2E 12      [ 6]  299         jsr     L122E
   11F5 20 60 13      [ 6]  300         jsr     L1360
   11F8 4C 47 11      [ 3]  301         jmp     L1147
                            302 
                            303 
   11FB                     304 L11FB:
   11FB A9 3C         [ 2]  305         lda     #0x3C
   11FD 8D 83 03      [ 4]  306         sta     audio_control_reg_b
   1200 A9 34         [ 2]  307         lda     #0x34
   1202 8D 81 03      [ 4]  308         sta     audio_control_reg_a
   1205 A2 00         [ 2]  309         ldx     #0x00
                            310 
                            311 
   1207                     312 L1207:
   1207 A9 30         [ 2]  313         lda     #0x30
   1209 95 81         [ 4]  314         sta     0x81,x
   120B 95 83         [ 4]  315         sta     0x83,x
   120D A9 FF         [ 2]  316         lda     #0xFF
   120F 95 80         [ 4]  317         sta     0x80,x
   1211 95 82         [ 4]  318         sta     0x82,x
   1213 A9 34         [ 2]  319         lda     #0x34
   1215 95 81         [ 4]  320         sta     0x81,x
   1217 95 83         [ 4]  321         sta     0x83,x
   1219 A9 00         [ 2]  322         lda     #0x00
   121B 95 80         [ 4]  323         sta     0x80,x
   121D 95 82         [ 4]  324         sta     0x82,x
   121F E8            [ 2]  325         inx
   1220 E8            [ 2]  326         inx
   1221 E8            [ 2]  327         inx
   1222 E8            [ 2]  328         inx
   1223 E0 20         [ 2]  329         cpx     #0x20
   1225 90 E0         [ 4]  330         bcc     L1207
   1227 A9 00         [ 2]  331         lda     #0x00
   1229 85 5D         [ 3]  332         sta     0x5D
   122B 85 63         [ 3]  333         sta     0x63
   122D 60            [ 6]  334         rts
                            335 
                            336 
   122E                     337 L122E:
   122E 8D 02 03      [ 4]  338         sta     transport_periph$ddr_reg_b
   1231 A9 FA         [ 2]  339         lda     #0xFA
   1233 85 50         [ 3]  340         sta     0x50
                            341 
                            342 
   1235                     343 L1235:
   1235 20 ED 13      [ 6]  344         jsr     L13ED
   1238 A5 50         [ 3]  345         lda     0x50
   123A D0 F9         [ 4]  346         bne     L1235
   123C AD 02 03      [ 4]  347         lda     transport_periph$ddr_reg_b
   123F 29 60         [ 2]  348         and     #0x60
   1241 D0 05         [ 4]  349         bne     L1248
   1243 A9 00         [ 2]  350         lda     #0x00
   1245 8D 02 03      [ 4]  351         sta     transport_periph$ddr_reg_b
                            352 
                            353 
   1248                     354 L1248:
   1248 60            [ 6]  355         rts
                            356 
                            357 
   1249                     358 L1249:
   1249 A9 00         [ 2]  359         lda     #0x00
   124B 85 58         [ 3]  360         sta     0x58
                            361 
                            362 
   124D                     363 L124D:
   124D AD 02 03      [ 4]  364         lda     transport_periph$ddr_reg_b
   1250 A9 0A         [ 2]  365         lda     #0x0A
   1252 85 50         [ 3]  366         sta     0x50
   1254 E6 58         [ 5]  367         inc     0x58
   1256 A5 58         [ 3]  368         lda     0x58
   1258 C9 21         [ 2]  369         cmp     #0x21
   125A B0 0F         [ 4]  370         bcs     L126B
                            371 
                            372 
   125C                     373 L125C:
   125C 20 ED 13      [ 6]  374         jsr     L13ED
   125F A5 50         [ 3]  375         lda     0x50
   1261 F0 E6         [ 4]  376         beq     L1249
   1263 AD 03 03      [ 4]  377         lda     transport_control_reg_b
   1266 10 F4         [ 4]  378         bpl     L125C
   1268 4C 4D 12      [ 3]  379         jmp     L124D
                            380 
                            381 
   126B                     382 L126B:
   126B 60            [ 6]  383         rts
                            384 
                            385 
   126C                     386 L126C:
   126C A9 FA         [ 2]  387         lda     #0xFA
   126E 85 50         [ 3]  388         sta     0x50
                            389 
                            390 
   1270                     391 L1270:
   1270 20 ED 13      [ 6]  392         jsr     L13ED
   1273 A5 50         [ 3]  393         lda     0x50
   1275 D0 F9         [ 4]  394         bne     L1270
                            395 
                            396 
   1277                     397 L1277:
   1277 20 ED 13      [ 6]  398         jsr     L13ED
   127A AD 02 03      [ 4]  399         lda     transport_periph$ddr_reg_b
   127D 6A            [ 2]  400         ror
   127E 90 F7         [ 4]  401         bcc     L1277
   1280 A9 A0         [ 2]  402         lda     #0xA0
   1282 85 50         [ 3]  403         sta     0x50
                            404 
                            405 
   1284                     406 L1284:
   1284 20 ED 13      [ 6]  407         jsr     L13ED
   1287 AD 02 03      [ 4]  408         lda     transport_periph$ddr_reg_b
   128A 6A            [ 2]  409         ror
   128B 90 EA         [ 4]  410         bcc     L1277
   128D A5 50         [ 3]  411         lda     0x50
   128F D0 F3         [ 4]  412         bne     L1284
   1291 60            [ 6]  413         rts
                            414 
                            415 
   1292                     416 L1292:
   1292 AD 00 03      [ 4]  417         lda     transport_periph$ddr_reg_a
   1295 A9 40         [ 2]  418         lda     #0x40
   1297 85 82         [ 3]  419         sta     0x82
   1299 85 86         [ 3]  420         sta     0x86
   129B 85 8A         [ 3]  421         sta     0x8A
   129D 85 8E         [ 3]  422         sta     0x8E
   129F A9 3C         [ 2]  423         lda     #0x3C
   12A1 8D 81 03      [ 4]  424         sta     audio_control_reg_a
   12A4 A9 34         [ 2]  425         lda     #0x34
   12A6 8D 83 03      [ 4]  426         sta     audio_control_reg_b
   12A9 A9 60         [ 2]  427         lda     #0x60
   12AB 85 82         [ 3]  428         sta     0x82
                            429 
                            430 
   12AD                     431 L12AD:
   12AD AD 02 03      [ 4]  432         lda     transport_periph$ddr_reg_b
   12B0 4A            [ 2]  433         lsr
   12B1 90 11         [ 4]  434         bcc     L12C4
   12B3 20 D3 12      [ 6]  435         jsr     L12D3
   12B6 20 A9 13      [ 6]  436         jsr     L13A9
   12B9 AD 01 03      [ 4]  437         lda     transport_control_reg_a
   12BC 10 EF         [ 4]  438         bpl     L12AD
   12BE 20 F3 12      [ 6]  439         jsr     L12F3
   12C1 4C AD 12      [ 3]  440         jmp     L12AD
                            441 
                            442 
   12C4                     443 L12C4:
   12C4 A9 64         [ 2]  444         lda     #0x64
   12C6 85 50         [ 3]  445         sta     0x50
                            446 
                            447 
   12C8                     448 L12C8:
   12C8 AD 02 03      [ 4]  449         lda     transport_periph$ddr_reg_b
   12CB 4A            [ 2]  450         lsr
   12CC B0 C4         [ 4]  451         bcs     L1292
   12CE A5 50         [ 3]  452         lda     0x50
   12D0 D0 F6         [ 4]  453         bne     L12C8
   12D2 60            [ 6]  454         rts
                            455 
                            456 
   12D3                     457 L12D3:
   12D3 AD 02 01      [ 4]  458         lda     UART_02
   12D6 29 02         [ 2]  459         and     #0x02
   12D8 F0 18         [ 4]  460         beq     L12F2
   12DA A5 68         [ 3]  461         lda     0x68
   12DC D0 09         [ 4]  462         bne     L12E7
   12DE A0 00         [ 2]  463         ldy     #0x00
   12E0 B1 69         [ 6]  464         lda     [0x69],y
   12E2 E6 68         [ 5]  465         inc     0x68
   12E4 4C EF 12      [ 3]  466         jmp     L12EF
                            467 
                            468 
   12E7                     469 L12E7:
   12E7 A9 00         [ 2]  470         lda     #0x00
   12E9 85 68         [ 3]  471         sta     0x68
   12EB A0 01         [ 2]  472         ldy     #0x01
   12ED B1 69         [ 6]  473         lda     [0x69],y
                            474 
                            475 
   12EF                     476 L12EF:
   12EF 8D 01 01      [ 4]  477         sta     UART_01
                            478 
                            479 
   12F2                     480 L12F2:
   12F2 60            [ 6]  481         rts
                            482 
                            483 
   12F3                     484 L12F3:
   12F3 AD 00 03      [ 4]  485         lda     transport_periph$ddr_reg_a
                            486 
                            487 
   12F6                     488 L12F6:
   12F6 29 7F         [ 2]  489         and     #0x7F
   12F8 85 5B         [ 3]  490         sta     0x5B
   12FA 29 7E         [ 2]  491         and     #0x7E
   12FC C9 22         [ 2]  492         cmp     #0x22
   12FE F0 3A         [ 4]  493         beq     L133A
   1300 C9 32         [ 2]  494         cmp     #0x32
   1302 90 4F         [ 4]  495         bcc     L1353
   1304 C9 3A         [ 2]  496         cmp     #0x3A
   1306 90 32         [ 4]  497         bcc     L133A
   1308 A5 5B         [ 3]  498         lda     0x5B
   130A C9 41         [ 2]  499         cmp     #0x41
   130C 90 45         [ 4]  500         bcc     L1353
   130E C9 4F         [ 2]  501         cmp     #0x4F
   1310 B0 41         [ 4]  502         bcs     L1353
   1312 A6 63         [ 3]  503         ldx     0x63
   1314 38            [ 2]  504         sec
   1315 E9 41         [ 2]  505         sbc     #0x41
   1317 C9 08         [ 2]  506         cmp     #0x08
   1319 90 02         [ 4]  507         bcc     L131D
   131B E8            [ 2]  508         inx
   131C E8            [ 2]  509         inx
                            510 
                            511 
   131D                     512 L131D:
   131D 29 07         [ 2]  513         and     #0x07
   131F A8            [ 2]  514         tay
   1320 B9 54 13      [ 5]  515         lda     X1354,y
   1323 85 5C         [ 3]  516         sta     0x5C
   1325 A5 5D         [ 3]  517         lda     0x5D
   1327 4A            [ 2]  518         lsr
   1328 B0 09         [ 4]  519         bcs     L1333
   132A A5 5C         [ 3]  520         lda     0x5C
   132C 49 FF         [ 2]  521         eor     #0xFF
   132E 35 00         [ 4]  522         and     0x00,x
   1330 95 00         [ 4]  523         sta     0x00,x
   1332 60            [ 6]  524         rts
                            525 
                            526 
   1333                     527 L1333:
   1333 A5 5C         [ 3]  528         lda     0x5C
   1335 15 00         [ 4]  529         ora     0x00,x
   1337 95 00         [ 4]  530         sta     0x00,x
   1339 60            [ 6]  531         rts
                            532 
                            533 
   133A                     534 L133A:
   133A A5 5B         [ 3]  535         lda     0x5B
   133C 85 5D         [ 3]  536         sta     0x5D
   133E 29 7E         [ 2]  537         and     #0x7E
   1340 C9 22         [ 2]  538         cmp     #0x22
   1342 D0 05         [ 4]  539         bne     L1349
   1344 A9 98         [ 2]  540         lda     #0x98
   1346 85 63         [ 3]  541         sta     0x63
   1348 60            [ 6]  542         rts
                            543 
                            544 
   1349                     545 L1349:
   1349 38            [ 2]  546         sec
   134A E9 32         [ 2]  547         sbc     #0x32
   134C 0A            [ 2]  548         asl
   134D 18            [ 2]  549         clc
   134E 69 80         [ 2]  550         adc     #0x80
   1350 85 63         [ 3]  551         sta     0x63
   1352 60            [ 6]  552         rts
                            553 
                            554 
   1353                     555 L1353:
   1353 60            [ 6]  556         rts
                            557 
                            558 
   1354                     559 X1354:
   1354 01 02 04 08 10 20   560         .byte   0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x4D,0x31,0x4D,0x32
        40 80 4D 31 4D 32
                            561 
   1360                     562 L1360:
   1360 A9 00         [ 2]  563         lda     #0x00
   1362 85 60         [ 3]  564         sta     0x60
   1364 85 61         [ 3]  565         sta     0x61
   1366 A9 0A         [ 2]  566         lda     #0x0A
   1368 85 54         [ 3]  567         sta     0x54
   136A A9 64         [ 2]  568         lda     #0x64
   136C 85 53         [ 3]  569         sta     0x53
                            570 
                            571 
   136E                     572 L136E:
   136E 20 ED 13      [ 6]  573         jsr     L13ED
   1371 A5 54         [ 3]  574         lda     0x54
   1373 D0 F9         [ 4]  575         bne     L136E
   1375 A9 0A         [ 2]  576         lda     #0x0A
   1377 85 54         [ 3]  577         sta     0x54
   1379 A9 64         [ 2]  578         lda     #0x64
   137B 85 53         [ 3]  579         sta     0x53
   137D A5 61         [ 3]  580         lda     0x61
   137F C9 08         [ 2]  581         cmp     #0x08
   1381 F0 15         [ 4]  582         beq     L1398
   1383 E6 61         [ 5]  583         inc     0x61
   1385 A2 09         [ 2]  584         ldx     #0x09
   1387 38            [ 2]  585         sec
   1388 AD 80 03      [ 4]  586         lda     audio_periph$ddr_reg_a
                            587 
                            588 
   138B                     589 L138B:
   138B 2A            [ 2]  590         rol
   138C CA            [ 2]  591         dex
   138D 90 FC         [ 4]  592         bcc     L138B
   138F 18            [ 2]  593         clc
   1390 8A            [ 2]  594         txa
   1391 65 60         [ 3]  595         adc     0x60
   1393 85 60         [ 3]  596         sta     0x60
   1395 4C 6E 13      [ 3]  597         jmp     L136E
                            598 
                            599 
   1398                     600 L1398:
   1398 46 60         [ 5]  601         lsr     0x60
   139A 46 60         [ 5]  602         lsr     0x60
   139C 46 60         [ 5]  603         lsr     0x60
   139E A5 60         [ 3]  604         lda     0x60
   13A0 85 5F         [ 3]  605         sta     0x5F
   13A2 A9 00         [ 2]  606         lda     #0x00
   13A4 85 60         [ 3]  607         sta     0x60
   13A6 85 61         [ 3]  608         sta     0x61
   13A8 60            [ 6]  609         rts
                            610 
                            611 
   13A9                     612 L13A9:
   13A9 AD 80 02      [ 4]  613         lda     U19_PORTA
   13AC 49 FF         [ 2]  614         eor     #0xFF
   13AE 4A            [ 2]  615         lsr
   13AF 4A            [ 2]  616         lsr
   13B0 4A            [ 2]  617         lsr
   13B1 4A            [ 2]  618         lsr
   13B2 18            [ 2]  619         clc
   13B3 65 5F         [ 3]  620         adc     0x5F
   13B5 AA            [ 2]  621         tax
   13B6 BD DC 13      [ 5]  622         lda     X13DC,x
   13B9 85 62         [ 3]  623         sta     0x62
   13BB A5 52         [ 3]  624         lda     0x52
   13BD D0 16         [ 4]  625         bne     L13D5
   13BF A9 0A         [ 2]  626         lda     #0x0A
   13C1 85 52         [ 3]  627         sta     0x52
   13C3 A5 62         [ 3]  628         lda     0x62
   13C5 CD 82 03      [ 4]  629         cmp     audio_periph$ddr_reg_b
   13C8 90 08         [ 4]  630         bcc     L13D2
   13CA F0 09         [ 4]  631         beq     L13D5
   13CC EE 82 03      [ 6]  632         inc     audio_periph$ddr_reg_b
   13CF 4C D5 13      [ 3]  633         jmp     L13D5
                            634 
                            635 
   13D2                     636 L13D2:
   13D2 CE 82 03      [ 6]  637         dec     audio_periph$ddr_reg_b
                            638 
                            639 
   13D5                     640 L13D5:
   13D5 AD 82 03      [ 4]  641         lda     audio_periph$ddr_reg_b
   13D8 8D 82 02      [ 4]  642         sta     U19_PORTB
   13DB 60            [ 6]  643         rts
                            644 
                            645 
   13DC                     646 X13DC:
   13DC 03 04 06 08 10 16   647         .byte   0x03,0x04,0x06,0x08,0x10,0x16,0x20,0x2D,0x40,0x5A,0x80,0xBF,0xFF,0xFF,0xFF,0xFF
        20 2D 40 5A 80 BF
        FF FF FF FF
   13EC FF                  648         .byte   0xFF
                            649 
   13ED                     650 L13ED:
   13ED A5 65         [ 3]  651         lda     0x65
   13EF AA            [ 2]  652         tax
   13F0 A5 66         [ 3]  653         lda     0x66
   13F2 D0 37         [ 4]  654         bne     L142B
   13F4 BD 59 14      [ 5]  655         lda     X1459,x
   13F7 C9 FE         [ 2]  656         cmp     #0xFE
   13F9 F0 27         [ 4]  657         beq     L1422
   13FB C9 FF         [ 2]  658         cmp     #0xFF
   13FD D0 0B         [ 4]  659         bne     L140A
   13FF A9 00         [ 2]  660         lda     #0x00
   1401 85 65         [ 3]  661         sta     0x65
   1403 A9 FA         [ 2]  662         lda     #0xFA
   1405 85 64         [ 3]  663         sta     0x64
   1407 4C 21 14      [ 3]  664         jmp     L1421
                            665 
                            666 
   140A                     667 L140A:
   140A C5 64         [ 3]  668         cmp     0x64
   140C D0 13         [ 4]  669         bne     L1421
   140E BD 5A 14      [ 5]  670         lda     X145A,x
   1411 20 F6 12      [ 6]  671         jsr     L12F6
   1414 BD 5B 14      [ 5]  672         lda     X145B,x
   1417 20 F6 12      [ 6]  673         jsr     L12F6
   141A A5 65         [ 3]  674         lda     0x65
   141C 18            [ 2]  675         clc
   141D 69 03         [ 2]  676         adc     #0x03
   141F 85 65         [ 3]  677         sta     0x65
                            678 
                            679 
   1421                     680 L1421:
   1421 60            [ 6]  681         rts
                            682 
                            683 
   1422                     684 L1422:
   1422 E6 66         [ 5]  685         inc     0x66
   1424 A9 00         [ 2]  686         lda     #0x00
   1426 85 65         [ 3]  687         sta     0x65
   1428 4C 21 14      [ 3]  688         jmp     L1421
                            689 
                            690 
   142B                     691 L142B:
   142B BD 43 15      [ 5]  692         lda     L1543,x
   142E C9 FF         [ 2]  693         cmp     #0xFF
   1430 D0 0D         [ 4]  694         bne     L143F
   1432 A9 00         [ 2]  695         lda     #0x00
   1434 85 65         [ 3]  696         sta     0x65
   1436 85 66         [ 3]  697         sta     0x66
   1438 A9 FA         [ 2]  698         lda     #0xFA
   143A 85 64         [ 3]  699         sta     0x64
   143C 4C 21 14      [ 3]  700         jmp     L1421
                            701 
                            702 
   143F                     703 L143F:
   143F C5 64         [ 3]  704         cmp     0x64
   1441 D0 DE         [ 4]  705         bne     L1421
   1443 BD 44 15      [ 5]  706         lda     X1544,x
   1446 20 F6 12      [ 6]  707         jsr     L12F6
   1449 BD 45 15      [ 5]  708         lda     X1545,x
   144C 20 F6 12      [ 6]  709         jsr     L12F6
   144F A5 65         [ 3]  710         lda     0x65
   1451 18            [ 2]  711         clc
   1452 69 03         [ 2]  712         adc     #0x03
   1454 85 65         [ 3]  713         sta     0x65
   1456 4C 21 14      [ 3]  714         jmp     L1421
                            715 
                            716 
   1459                     717 X1459:
   1459 F5                  718         .byte   0xF5
                            719 
   145A                     720 X145A:
   145A 35                  721         .byte   0x35
                            722 
   145B                     723 X145B:
   145B 46 F5 35 46 EE 35   724         .byte   0x46,0xF5,0x35,0x46,0xEE,0x35,0x46,0xEB,0x33,0x46,0xE9,0x32,0x46,0xE9,0x33,0x42
        46 EB 33 46 E9 32
        46 E9 33 42
   146B E8 33 46 E7 32 46   725         .byte   0xE8,0x33,0x46,0xE7,0x32,0x46,0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3
        E6 33 46 E5 32 46
        E4 33 46 E3
   147B 32 46 E2 33 46 E1   726         .byte   0x32,0x46,0xE2,0x33,0x46,0xE1,0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33
        32 46 E0 33 46 DF
        32 46 DE 33
   148B 46 DD 32 46 DD 34   727         .byte   0x46,0xDD,0x32,0x46,0xDD,0x34,0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46
        46 DC 33 46 DB 32
        46 DB 35 46
   149B DA 33 46 D9 32 46   728         .byte   0xDA,0x33,0x46,0xD9,0x32,0x46,0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5
        D1 32 42 C6 33 47
        C6 33 43 C5
   14AB 32 47 C3 34 46 C2   729         .byte   0x32,0x47,0xC3,0x34,0x46,0xC2,0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34
        33 47 C1 32 47 C0
        35 46 B9 34
   14BB 46 B9 32 43 B7 35   730         .byte   0x46,0xB9,0x32,0x43,0xB7,0x35,0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46
        46 B7 33 42 B3 33
        46 B2 32 46
   14CB A8 32 42 9D 33 47   731         .byte   0xA8,0x32,0x42,0x9D,0x33,0x47,0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A
        9C 32 47 9B 33 47
        9A 32 47 9A
   14DB 34 46 99 33 47 99   732         .byte   0x34,0x46,0x99,0x33,0x47,0x99,0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33
        33 43 99 35 46 98
        32 47 97 33
   14EB 47 94 32 47 93 33   733         .byte   0x47,0x94,0x32,0x47,0x93,0x33,0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47
        47 92 32 47 91 33
        47 90 32 47
   14FB 87 33 42 86 32 43   734         .byte   0x87,0x33,0x42,0x86,0x32,0x43,0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77
        7D 33 46 7C 32 46
        77 32 42 77
   150B 34 46 75 32 43 75   735         .byte   0x34,0x46,0x75,0x32,0x43,0x75,0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33
        35 46 6A 33 46 69
        32 46 67 33
   151B 46 66 32 46 66 32   736         .byte   0x46,0x66,0x32,0x46,0x66,0x32,0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42
        43 65 34 46 62 35
        46 62 33 42
   152B 56 33 46 55 32 46   737         .byte   0x56,0x33,0x46,0x55,0x32,0x46,0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52
        55 32 42 54 33 46
        53 32 46 52
   153B 33 46 51 32 46 FE   738         .byte   0x33,0x46,0x51,0x32,0x46,0xFE,0xFE,0xFE
        FE FE
                            739 
   1543                     740 L1543:
   1543 50                  741         .byte   0x50
                            742 
   1544                     743 X1544:
   1544 33                  744         .byte   0x33
                            745 
   1545                     746 X1545:
   1545 46 4F 32 46 4E 33   747         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   1555 4B 32 46 40 34 46   748         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   1565 33 47 39 32 47 32   749         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   1575 46 26 33 43 23 33   750         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   1585 1B 33 47 1A 32 47   751         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   1595 33 47 17 32 42 16   752         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   15A5 43 03 33 46 02 32   753         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
                            754 
   1FFA                     755         .org    0x1FFA
                            756         ;
                            757         ; vectors
                            758         ;
   1FFA                     759 NMIVEC:
   1FFA FF FF               760         .dw     0xFFFF
   1FFC                     761 RESETVEC:
   1FFC 48 10               762         .dw     L1048
   1FFE                     763 IRQVEC:
   1FFE 00 10               764         .dw     L1000
