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
                     0050     8 TIMER_1MS_A     = 0x0050    ; 1ms timer
                     0051     9 TIMER_1MS_B     = 0x0051    ; 1ms timer
                     0052    10 TIMER_1MS_C     = 0x0052    ; 1ms timer
                     0053    11 TIMER_1MS_R     = 0x0053    ; 1ms timer, autoload to 100
                     0054    12 TIMER_100MS_A   = 0x0054    ; 0.1s timer
                     0055    13 TIMER_100MS_B   = 0x0055    ; 0.1s timer
                     0056    14 TIMER_100MS_R   = 0x0056    ; 0.1s timer, autoload to 100
                     0057    15 TIMER_10S       = 0x0057    ; 10s timer
                             16 
                     0064    17 TIMER_100MS_C   = 0x0064    ; 0.1s timer
                             18 ;
                             19 ;       IRQ handler
                             20 ;
   1000                      21 IRQ:
   1000 48            [ 3]   22         pha
   1001 AD 05 02      [ 4]   23         lda     U18_edge_detect_control_DI_pos          ; clear PA7 flag
   1004 AD 85 02      [ 4]   24         lda     U19_edge_detect_control_DI_pos          ; clear PA7 flag
   1007 A9 7D         [ 2]   25         lda     #0x7D                                   ; expire every 125*8=1000us=1ms
   1009 8D 1D 02      [ 4]   26         sta     U18_1D                                  ; div by 8, enable interrupt
   100C A5 50         [ 3]   27         lda     TIMER_1MS_A                             ; 1ms timer
   100E F0 02         [ 4]   28         beq     L1012
   1010 C6 50         [ 5]   29         dec     TIMER_1MS_A
   1012                      30 L1012:
   1012 A5 51         [ 3]   31         lda     TIMER_1MS_B                             ; 1ms timer
   1014 F0 02         [ 4]   32         beq     L1018
   1016 C6 51         [ 5]   33         dec     TIMER_1MS_B
   1018                      34 L1018:
   1018 A5 52         [ 3]   35         lda     TIMER_1MS_C                             ; 1ms timer
   101A F0 02         [ 4]   36         beq     L101E
   101C C6 52         [ 5]   37         dec     TIMER_1MS_C
   101E                      38 L101E:
   101E C6 53         [ 5]   39         dec     TIMER_1MS_R
   1020 D0 24         [ 4]   40         bne     L1046
   1022 A9 64         [ 2]   41         lda     #0x64
   1024 85 53         [ 3]   42         sta     TIMER_1MS_R
   1026 A5 54         [ 3]   43         lda     TIMER_100MS_A
   1028 F0 02         [ 4]   44         beq     L102C
   102A C6 54         [ 5]   45         dec     TIMER_100MS_A
   102C                      46 L102C:
   102C A5 64         [ 3]   47         lda     TIMER_100MS_C
   102E F0 02         [ 4]   48         beq     L1032
   1030 C6 64         [ 5]   49         dec     TIMER_100MS_C
   1032                      50 L1032:
   1032 A5 55         [ 3]   51         lda     TIMER_100MS_B
   1034 F0 02         [ 4]   52         beq     L1038
   1036 C6 55         [ 5]   53         dec     TIMER_100MS_B
   1038                      54 L1038:
   1038 C6 56         [ 5]   55         dec     TIMER_100MS_R
   103A D0 0A         [ 4]   56         bne     L1046
   103C A9 64         [ 2]   57         lda     #0x64
   103E 85 56         [ 3]   58         sta     TIMER_100MS_R
   1040 A5 57         [ 3]   59         lda     TIMER_10S
   1042 F0 02         [ 4]   60         beq     L1046
   1044 C6 57         [ 5]   61         dec     TIMER_10S
   1046                      62 L1046:
   1046 68            [ 4]   63         pla
   1047 40            [ 6]   64         rti
                             65 ;
                             66 ;       Main Program Start
                             67 ;
   1048                      68 RESET:
   1048 D8            [ 2]   69         cld                                             ; No decimal mode
   1049 78            [ 2]   70         sei                                             ; Interrupts are not used
   104A A2 F0         [ 2]   71         ldx     #0xF0                                   ; Stack is at 0x01F0
   104C 9A            [ 2]   72         txs
   104D A9 00         [ 2]   73         lda     #0x00                                   ; Clear RAM
   104F A2 10         [ 2]   74         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1051                      75 ZERORAM:
   1051 95 00         [ 4]   76         sta     0x00,x
   1053 E8            [ 2]   77         inx
   1054 E0 80         [ 2]   78         cpx     #0x80
   1056 D0 F9         [ 4]   79         bne     ZERORAM
   1058 A9 00         [ 2]   80         lda     #0x00
   105A 8D 01 03      [ 4]   81         sta     transport_control_reg_a
   105D 8D 00 03      [ 4]   82         sta     transport_periph$ddr_reg_a
   1060 8D 81 03      [ 4]   83         sta     audio_control_reg_a
   1063 8D 80 03      [ 4]   84         sta     audio_periph$ddr_reg_a
   1066 8D 83 03      [ 4]   85         sta     audio_control_reg_b
   1069 8D 05 02      [ 4]   86         sta     U18_edge_detect_control_DI_pos
   106C 8D 03 03      [ 4]   87         sta     transport_control_reg_b
   106F 8D 06 02      [ 4]   88         sta     U18_06
   1072 8D 86 02      [ 4]   89         sta     U19_06
   1075 8D 01 02      [ 4]   90         sta     U18_DDRA
   1078 A9 02         [ 2]   91         lda     #0x02
   107A 8D 81 02      [ 4]   92         sta     U19_DDRA
   107D A9 FF         [ 2]   93         lda     #0xFF
   107F 8D 82 03      [ 4]   94         sta     audio_periph$ddr_reg_b
   1082 8D 03 02      [ 4]   95         sta     U18_DDRB
   1085 8D 83 02      [ 4]   96         sta     U19_DDRB
   1088 A9 FC         [ 2]   97         lda     #0xFC
   108A 8D 02 03      [ 4]   98         sta     transport_periph$ddr_reg_b
   108D A9 2E         [ 2]   99         lda     #0x2E
   108F 8D 01 03      [ 4]  100         sta     transport_control_reg_a
   1092 8D 03 03      [ 4]  101         sta     transport_control_reg_b
   1095 A9 3C         [ 2]  102         lda     #0x3C
   1097 8D 81 03      [ 4]  103         sta     audio_control_reg_a
   109A 8D 83 03      [ 4]  104         sta     audio_control_reg_b
   109D 58            [ 2]  105         cli
   109E 8D 1C 02      [ 4]  106         sta     U18_1C
   10A1 A9 64         [ 2]  107         lda     #0x64
   10A3 85 53         [ 3]  108         sta     0x53
   10A5 A9 18         [ 2]  109         lda     #0x18
   10A7 85 57         [ 3]  110         sta     0x57
   10A9 A9 64         [ 2]  111         lda     #0x64
   10AB 85 56         [ 3]  112         sta     0x56
   10AD A9 0A         [ 2]  113         lda     #0x0A
   10AF 85 62         [ 3]  114         sta     0x62
   10B1 A9 09         [ 2]  115         lda     #0x09
   10B3 8D 02 01      [ 4]  116         sta     UART_02
   10B6 A9 10         [ 2]  117         lda     #0x10
   10B8 20 2E 12      [ 6]  118         jsr     L122E
   10BB A9 28         [ 2]  119         lda     #0x28
   10BD 85 54         [ 3]  120         sta     0x54
   10BF A9 64         [ 2]  121         lda     #0x64
   10C1 85 53         [ 3]  122         sta     0x53
                            123 
                            124 
   10C3                     125 L10C3:
   10C3 A5 54         [ 3]  126         lda     0x54
   10C5 D0 FC         [ 4]  127         bne     L10C3
   10C7 20 FB 11      [ 6]  128         jsr     L11FB
                            129 
                            130 
   10CA                     131 L10CA:
   10CA A9 FA         [ 2]  132         lda     #0xFA
   10CC 85 64         [ 3]  133         sta     0x64
   10CE A9 00         [ 2]  134         lda     #0x00
   10D0 85 65         [ 3]  135         sta     0x65
   10D2 85 66         [ 3]  136         sta     0x66
   10D4 A9 30         [ 2]  137         lda     #0x30
   10D6 A9 40         [ 2]  138         lda     #0x40
   10D8 20 2E 12      [ 6]  139         jsr     L122E
                            140 
                            141 
   10DB                     142 L10DB:
   10DB A9 00         [ 2]  143         lda     #0x00
   10DD 85 58         [ 3]  144         sta     0x58
                            145 
                            146 
   10DF                     147 L10DF:
   10DF AD 02 03      [ 4]  148         lda     transport_periph$ddr_reg_b
   10E2 A9 0A         [ 2]  149         lda     #0x0A
   10E4 85 50         [ 3]  150         sta     0x50
   10E6 E6 58         [ 5]  151         inc     0x58
   10E8 A5 58         [ 3]  152         lda     0x58
   10EA C9 64         [ 2]  153         cmp     #0x64
   10EC B0 0F         [ 4]  154         bcs     L10FD
                            155 
                            156 
   10EE                     157 L10EE:
   10EE 20 ED 13      [ 6]  158         jsr     L13ED
   10F1 A5 50         [ 3]  159         lda     0x50
   10F3 F0 E6         [ 4]  160         beq     L10DB
   10F5 AD 03 03      [ 4]  161         lda     transport_control_reg_b
   10F8 10 F4         [ 4]  162         bpl     L10EE
   10FA 4C DF 10      [ 3]  163         jmp     L10DF
                            164 
                            165 
   10FD                     166 L10FD:
   10FD A9 20         [ 2]  167         lda     #0x20
   10FF 20 2E 12      [ 6]  168         jsr     L122E
   1102 A9 19         [ 2]  169         lda     #0x19
   1104 85 54         [ 3]  170         sta     0x54
   1106 A9 64         [ 2]  171         lda     #0x64
   1108 85 53         [ 3]  172         sta     0x53
                            173 
                            174 
   110A                     175 L110A:
   110A 20 ED 13      [ 6]  176         jsr     L13ED
   110D A5 54         [ 3]  177         lda     0x54
   110F D0 F9         [ 4]  178         bne     L110A
   1111 A9 00         [ 2]  179         lda     #0x00
   1113 85 59         [ 3]  180         sta     0x59
   1115 20 49 12      [ 6]  181         jsr     L1249
   1118 A9 40         [ 2]  182         lda     #0x40
   111A 20 2E 12      [ 6]  183         jsr     L122E
   111D 20 49 12      [ 6]  184         jsr     L1249
   1120 A9 FA         [ 2]  185         lda     #0xFA
   1122 85 50         [ 3]  186         sta     0x50
                            187 
                            188 
   1124                     189 L1124:
   1124 20 ED 13      [ 6]  190         jsr     L13ED
   1127 A5 50         [ 3]  191         lda     0x50
   1129 D0 F9         [ 4]  192         bne     L1124
   112B A9 20         [ 2]  193         lda     #0x20
   112D 20 2E 12      [ 6]  194         jsr     L122E
   1130 20 49 12      [ 6]  195         jsr     L1249
   1133 E6 59         [ 5]  196         inc     0x59
   1135 A9 10         [ 2]  197         lda     #0x10
   1137 20 2E 12      [ 6]  198         jsr     L122E
   113A A9 80         [ 2]  199         lda     #0x80
   113C 20 2E 12      [ 6]  200         jsr     L122E
   113F 20 6C 12      [ 6]  201         jsr     L126C
   1142 A9 10         [ 2]  202         lda     #0x10
   1144 20 2E 12      [ 6]  203         jsr     L122E
                            204 
                            205 
   1147                     206 L1147:
   1147 A9 5E         [ 2]  207         lda     #0x5E
   1149 85 69         [ 3]  208         sta     0x69
   114B A9 13         [ 2]  209         lda     #0x13
   114D 85 6A         [ 3]  210         sta     0x6A
   114F 20 A9 13      [ 6]  211         jsr     L13A9
   1152 20 ED 13      [ 6]  212         jsr     L13ED
   1155 20 D3 12      [ 6]  213         jsr     L12D3
   1158 AD 02 01      [ 4]  214         lda     UART_02
   115B 29 05         [ 2]  215         and     #0x05
   115D F0 23         [ 4]  216         beq     L1182
   115F A5 67         [ 3]  217         lda     0x67
   1161 D0 0C         [ 4]  218         bne     L116F
   1163 AD 01 01      [ 4]  219         lda     UART_01
   1166 C9 53         [ 2]  220         cmp     #0x53
   1168 D0 18         [ 4]  221         bne     L1182
   116A E6 67         [ 5]  222         inc     0x67
   116C 4C 82 11      [ 3]  223         jmp     L1182
                            224 
                            225 
   116F                     226 L116F:
   116F A9 00         [ 2]  227         lda     #0x00
   1171 85 67         [ 3]  228         sta     0x67
   1173 AD 01 01      [ 4]  229         lda     UART_01
   1176 C9 31         [ 2]  230         cmp     #0x31
   1178 F0 36         [ 4]  231         beq     L11B0
   117A C9 32         [ 2]  232         cmp     #0x32
   117C F0 0A         [ 4]  233         beq     L1188
   117E C9 33         [ 2]  234         cmp     #0x33
   1180 F0 1B         [ 4]  235         beq     L119D
                            236 
                            237 
   1182                     238 L1182:
   1182 4C 47 11      [ 3]  239         jmp     L1147
   1185 4C CA 10      [ 3]  240         jmp     L10CA
                            241 
                            242 
   1188                     243 L1188:
   1188 A9 FF         [ 2]  244         lda     #0xFF
   118A 85 98         [ 3]  245         sta     0x98
   118C 85 9A         [ 3]  246         sta     0x9A
   118E 85 9C         [ 3]  247         sta     0x9C
   1190 85 9E         [ 3]  248         sta     0x9E
   1192 8D 02 02      [ 4]  249         sta     U18_PORTB
   1195 A9 02         [ 2]  250         lda     #0x02
   1197 8D 80 02      [ 4]  251         sta     U19_PORTA
   119A 4C 47 11      [ 3]  252         jmp     L1147
                            253 
                            254 
   119D                     255 L119D:
   119D A9 00         [ 2]  256         lda     #0x00
   119F 85 98         [ 3]  257         sta     0x98
   11A1 85 9A         [ 3]  258         sta     0x9A
   11A3 85 9C         [ 3]  259         sta     0x9C
   11A5 85 9E         [ 3]  260         sta     0x9E
   11A7 8D 02 02      [ 4]  261         sta     U18_PORTB
   11AA 8D 80 02      [ 4]  262         sta     U19_PORTA
   11AD 4C 47 11      [ 3]  263         jmp     L1147
                            264 
                            265 
   11B0                     266 L11B0:
   11B0 20 FB 11      [ 6]  267         jsr     L11FB
   11B3 A9 5C         [ 2]  268         lda     #0x5C
   11B5 85 69         [ 3]  269         sta     0x69
   11B7 A9 13         [ 2]  270         lda     #0x13
   11B9 85 6A         [ 3]  271         sta     0x6A
   11BB A9 00         [ 2]  272         lda     #0x00
   11BD 8D 80 02      [ 4]  273         sta     U19_PORTA
   11C0 A9 A0         [ 2]  274         lda     #0xA0
   11C2 8D 02 02      [ 4]  275         sta     U18_PORTB
   11C5 A9 80         [ 2]  276         lda     #0x80
   11C7 20 2E 12      [ 6]  277         jsr     L122E
   11CA 20 6C 12      [ 6]  278         jsr     L126C
   11CD 20 92 12      [ 6]  279         jsr     L1292
   11D0 20 FB 11      [ 6]  280         jsr     L11FB
   11D3 A9 80         [ 2]  281         lda     #0x80
   11D5 8D 02 02      [ 4]  282         sta     U18_PORTB
   11D8 E6 59         [ 5]  283         inc     0x59
   11DA A5 59         [ 3]  284         lda     0x59
   11DC C9 1A         [ 2]  285         cmp     #0x1A
   11DE 90 03         [ 4]  286         bcc     L11E3
   11E0 4C CA 10      [ 3]  287         jmp     L10CA
                            288 
                            289 
   11E3                     290 L11E3:
   11E3 A9 00         [ 2]  291         lda     #0x00
   11E5 85 65         [ 3]  292         sta     0x65
   11E7 85 66         [ 3]  293         sta     0x66
   11E9 A9 FA         [ 2]  294         lda     #0xFA
   11EB 85 64         [ 3]  295         sta     0x64
   11ED 20 6C 12      [ 6]  296         jsr     L126C
   11F0 A9 10         [ 2]  297         lda     #0x10
   11F2 20 2E 12      [ 6]  298         jsr     L122E
   11F5 20 60 13      [ 6]  299         jsr     L1360
   11F8 4C 47 11      [ 3]  300         jmp     L1147
                            301 
                            302 
   11FB                     303 L11FB:
   11FB A9 3C         [ 2]  304         lda     #0x3C
   11FD 8D 83 03      [ 4]  305         sta     audio_control_reg_b
   1200 A9 34         [ 2]  306         lda     #0x34
   1202 8D 81 03      [ 4]  307         sta     audio_control_reg_a
   1205 A2 00         [ 2]  308         ldx     #0x00
                            309 
                            310 
   1207                     311 L1207:
   1207 A9 30         [ 2]  312         lda     #0x30
   1209 95 81         [ 4]  313         sta     0x81,x
   120B 95 83         [ 4]  314         sta     0x83,x
   120D A9 FF         [ 2]  315         lda     #0xFF
   120F 95 80         [ 4]  316         sta     0x80,x
   1211 95 82         [ 4]  317         sta     0x82,x
   1213 A9 34         [ 2]  318         lda     #0x34
   1215 95 81         [ 4]  319         sta     0x81,x
   1217 95 83         [ 4]  320         sta     0x83,x
   1219 A9 00         [ 2]  321         lda     #0x00
   121B 95 80         [ 4]  322         sta     0x80,x
   121D 95 82         [ 4]  323         sta     0x82,x
   121F E8            [ 2]  324         inx
   1220 E8            [ 2]  325         inx
   1221 E8            [ 2]  326         inx
   1222 E8            [ 2]  327         inx
   1223 E0 20         [ 2]  328         cpx     #0x20
   1225 90 E0         [ 4]  329         bcc     L1207
   1227 A9 00         [ 2]  330         lda     #0x00
   1229 85 5D         [ 3]  331         sta     0x5D
   122B 85 63         [ 3]  332         sta     0x63
   122D 60            [ 6]  333         rts
                            334 
                            335 
   122E                     336 L122E:
   122E 8D 02 03      [ 4]  337         sta     transport_periph$ddr_reg_b
   1231 A9 FA         [ 2]  338         lda     #0xFA
   1233 85 50         [ 3]  339         sta     0x50
                            340 
                            341 
   1235                     342 L1235:
   1235 20 ED 13      [ 6]  343         jsr     L13ED
   1238 A5 50         [ 3]  344         lda     0x50
   123A D0 F9         [ 4]  345         bne     L1235
   123C AD 02 03      [ 4]  346         lda     transport_periph$ddr_reg_b
   123F 29 60         [ 2]  347         and     #0x60
   1241 D0 05         [ 4]  348         bne     L1248
   1243 A9 00         [ 2]  349         lda     #0x00
   1245 8D 02 03      [ 4]  350         sta     transport_periph$ddr_reg_b
                            351 
                            352 
   1248                     353 L1248:
   1248 60            [ 6]  354         rts
                            355 
                            356 
   1249                     357 L1249:
   1249 A9 00         [ 2]  358         lda     #0x00
   124B 85 58         [ 3]  359         sta     0x58
                            360 
                            361 
   124D                     362 L124D:
   124D AD 02 03      [ 4]  363         lda     transport_periph$ddr_reg_b
   1250 A9 0A         [ 2]  364         lda     #0x0A
   1252 85 50         [ 3]  365         sta     0x50
   1254 E6 58         [ 5]  366         inc     0x58
   1256 A5 58         [ 3]  367         lda     0x58
   1258 C9 21         [ 2]  368         cmp     #0x21
   125A B0 0F         [ 4]  369         bcs     L126B
                            370 
                            371 
   125C                     372 L125C:
   125C 20 ED 13      [ 6]  373         jsr     L13ED
   125F A5 50         [ 3]  374         lda     0x50
   1261 F0 E6         [ 4]  375         beq     L1249
   1263 AD 03 03      [ 4]  376         lda     transport_control_reg_b
   1266 10 F4         [ 4]  377         bpl     L125C
   1268 4C 4D 12      [ 3]  378         jmp     L124D
                            379 
                            380 
   126B                     381 L126B:
   126B 60            [ 6]  382         rts
                            383 
                            384 
   126C                     385 L126C:
   126C A9 FA         [ 2]  386         lda     #0xFA
   126E 85 50         [ 3]  387         sta     0x50
                            388 
                            389 
   1270                     390 L1270:
   1270 20 ED 13      [ 6]  391         jsr     L13ED
   1273 A5 50         [ 3]  392         lda     0x50
   1275 D0 F9         [ 4]  393         bne     L1270
                            394 
                            395 
   1277                     396 L1277:
   1277 20 ED 13      [ 6]  397         jsr     L13ED
   127A AD 02 03      [ 4]  398         lda     transport_periph$ddr_reg_b
   127D 6A            [ 2]  399         ror
   127E 90 F7         [ 4]  400         bcc     L1277
   1280 A9 A0         [ 2]  401         lda     #0xA0
   1282 85 50         [ 3]  402         sta     0x50
                            403 
                            404 
   1284                     405 L1284:
   1284 20 ED 13      [ 6]  406         jsr     L13ED
   1287 AD 02 03      [ 4]  407         lda     transport_periph$ddr_reg_b
   128A 6A            [ 2]  408         ror
   128B 90 EA         [ 4]  409         bcc     L1277
   128D A5 50         [ 3]  410         lda     0x50
   128F D0 F3         [ 4]  411         bne     L1284
   1291 60            [ 6]  412         rts
                            413 
                            414 
   1292                     415 L1292:
   1292 AD 00 03      [ 4]  416         lda     transport_periph$ddr_reg_a
   1295 A9 40         [ 2]  417         lda     #0x40
   1297 85 82         [ 3]  418         sta     0x82
   1299 85 86         [ 3]  419         sta     0x86
   129B 85 8A         [ 3]  420         sta     0x8A
   129D 85 8E         [ 3]  421         sta     0x8E
   129F A9 3C         [ 2]  422         lda     #0x3C
   12A1 8D 81 03      [ 4]  423         sta     audio_control_reg_a
   12A4 A9 34         [ 2]  424         lda     #0x34
   12A6 8D 83 03      [ 4]  425         sta     audio_control_reg_b
   12A9 A9 60         [ 2]  426         lda     #0x60
   12AB 85 82         [ 3]  427         sta     0x82
                            428 
                            429 
   12AD                     430 L12AD:
   12AD AD 02 03      [ 4]  431         lda     transport_periph$ddr_reg_b
   12B0 4A            [ 2]  432         lsr
   12B1 90 11         [ 4]  433         bcc     L12C4
   12B3 20 D3 12      [ 6]  434         jsr     L12D3
   12B6 20 A9 13      [ 6]  435         jsr     L13A9
   12B9 AD 01 03      [ 4]  436         lda     transport_control_reg_a
   12BC 10 EF         [ 4]  437         bpl     L12AD
   12BE 20 F3 12      [ 6]  438         jsr     L12F3
   12C1 4C AD 12      [ 3]  439         jmp     L12AD
                            440 
                            441 
   12C4                     442 L12C4:
   12C4 A9 64         [ 2]  443         lda     #0x64
   12C6 85 50         [ 3]  444         sta     0x50
                            445 
                            446 
   12C8                     447 L12C8:
   12C8 AD 02 03      [ 4]  448         lda     transport_periph$ddr_reg_b
   12CB 4A            [ 2]  449         lsr
   12CC B0 C4         [ 4]  450         bcs     L1292
   12CE A5 50         [ 3]  451         lda     0x50
   12D0 D0 F6         [ 4]  452         bne     L12C8
   12D2 60            [ 6]  453         rts
                            454 ;
                            455 ;   TBD - Unknown UART routine
                            456 ;
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
   12E7                     467 L12E7:
   12E7 A9 00         [ 2]  468         lda     #0x00
   12E9 85 68         [ 3]  469         sta     0x68
   12EB A0 01         [ 2]  470         ldy     #0x01
   12ED B1 69         [ 6]  471         lda     [0x69],y
   12EF                     472 L12EF:
   12EF 8D 01 01      [ 4]  473         sta     UART_01
   12F2                     474 L12F2:
   12F2 60            [ 6]  475         rts
                            476 ;
                            477 ; Protocol handler
                            478 ;
   12F3                     479 L12F3:
   12F3 AD 00 03      [ 4]  480         lda     transport_periph$ddr_reg_a
   12F6                     481 L12F6:
   12F6 29 7F         [ 2]  482         and     #0x7F
   12F8 85 5B         [ 3]  483         sta     0x5B
   12FA 29 7E         [ 2]  484         and     #0x7E
   12FC C9 22         [ 2]  485         cmp     #0x22
   12FE F0 3A         [ 4]  486         beq     L133A
   1300 C9 32         [ 2]  487         cmp     #0x32
   1302 90 4F         [ 4]  488         bcc     L1353
   1304 C9 3A         [ 2]  489         cmp     #0x3A
   1306 90 32         [ 4]  490         bcc     L133A
   1308 A5 5B         [ 3]  491         lda     0x5B
   130A C9 41         [ 2]  492         cmp     #0x41
   130C 90 45         [ 4]  493         bcc     L1353
   130E C9 4F         [ 2]  494         cmp     #0x4F
   1310 B0 41         [ 4]  495         bcs     L1353
   1312 A6 63         [ 3]  496         ldx     0x63
   1314 38            [ 2]  497         sec
   1315 E9 41         [ 2]  498         sbc     #0x41
   1317 C9 08         [ 2]  499         cmp     #0x08
   1319 90 02         [ 4]  500         bcc     L131D
   131B E8            [ 2]  501         inx
   131C E8            [ 2]  502         inx
   131D                     503 L131D:
   131D 29 07         [ 2]  504         and     #0x07
   131F A8            [ 2]  505         tay
   1320 B9 54 13      [ 5]  506         lda     X1354,y
   1323 85 5C         [ 3]  507         sta     0x5C
   1325 A5 5D         [ 3]  508         lda     0x5D
   1327 4A            [ 2]  509         lsr
   1328 B0 09         [ 4]  510         bcs     L1333
   132A A5 5C         [ 3]  511         lda     0x5C
   132C 49 FF         [ 2]  512         eor     #0xFF
   132E 35 00         [ 4]  513         and     0x00,x
   1330 95 00         [ 4]  514         sta     0x00,x
   1332 60            [ 6]  515         rts
                            516 ;
   1333                     517 L1333:
   1333 A5 5C         [ 3]  518         lda     0x5C
   1335 15 00         [ 4]  519         ora     0x00,x
   1337 95 00         [ 4]  520         sta     0x00,x
   1339 60            [ 6]  521         rts
                            522 ;
   133A                     523 L133A:
   133A A5 5B         [ 3]  524         lda     0x5B
   133C 85 5D         [ 3]  525         sta     0x5D
   133E 29 7E         [ 2]  526         and     #0x7E
   1340 C9 22         [ 2]  527         cmp     #0x22
   1342 D0 05         [ 4]  528         bne     L1349
   1344 A9 98         [ 2]  529         lda     #0x98
   1346 85 63         [ 3]  530         sta     0x63
   1348 60            [ 6]  531         rts
                            532 ;
   1349                     533 L1349:
   1349 38            [ 2]  534         sec
   134A E9 32         [ 2]  535         sbc     #0x32
   134C 0A            [ 2]  536         asl
   134D 18            [ 2]  537         clc
   134E 69 80         [ 2]  538         adc     #0x80
   1350 85 63         [ 3]  539         sta     0x63
   1352 60            [ 6]  540         rts
   1353                     541 L1353:
   1353 60            [ 6]  542         rts
                            543 ;
                            544 ; bit mask table
                            545 ;
   1354                     546 X1354:
   1354 01 02 04 08         547         .byte   0x01,0x02,0x04,0x08
   1358 10 20 40 80         548         .byte   0x10,0x20,0x40,0x80
   135C 4D 31 4D 32         549         .byte   0x4D,0x31,0x4D,0x32
                            550 ;
                            551 ;       Read the AGC mic level
                            552 ;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
                            553 ;
   1360                     554 L1360:
   1360 A9 00         [ 2]  555         lda     #0x00
   1362 85 60         [ 3]  556         sta     0x60
   1364 85 61         [ 3]  557         sta     0x61
   1366 A9 0A         [ 2]  558         lda     #0x0A
   1368 85 54         [ 3]  559         sta     0x54
   136A A9 64         [ 2]  560         lda     #0x64
   136C 85 53         [ 3]  561         sta     0x53
   136E                     562 L136E:
   136E 20 ED 13      [ 6]  563         jsr     L13ED
   1371 A5 54         [ 3]  564         lda     0x54
   1373 D0 F9         [ 4]  565         bne     L136E
   1375 A9 0A         [ 2]  566         lda     #0x0A
   1377 85 54         [ 3]  567         sta     0x54
   1379 A9 64         [ 2]  568         lda     #0x64
   137B 85 53         [ 3]  569         sta     0x53
   137D A5 61         [ 3]  570         lda     0x61
   137F C9 08         [ 2]  571         cmp     #0x08
   1381 F0 15         [ 4]  572         beq     L1398
   1383 E6 61         [ 5]  573         inc     0x61
   1385 A2 09         [ 2]  574         ldx     #0x09
   1387 38            [ 2]  575         sec
   1388 AD 80 03      [ 4]  576         lda     audio_periph$ddr_reg_a
   138B                     577 L138B:
   138B 2A            [ 2]  578         rol
   138C CA            [ 2]  579         dex
   138D 90 FC         [ 4]  580         bcc     L138B
   138F 18            [ 2]  581         clc
   1390 8A            [ 2]  582         txa
   1391 65 60         [ 3]  583         adc     0x60
   1393 85 60         [ 3]  584         sta     0x60
   1395 4C 6E 13      [ 3]  585         jmp     L136E
                            586 ;
   1398                     587 L1398:
   1398 46 60         [ 5]  588         lsr     0x60
   139A 46 60         [ 5]  589         lsr     0x60
   139C 46 60         [ 5]  590         lsr     0x60
   139E A5 60         [ 3]  591         lda     0x60
   13A0 85 5F         [ 3]  592         sta     0x5F
   13A2 A9 00         [ 2]  593         lda     #0x00
   13A4 85 60         [ 3]  594         sta     0x60
   13A6 85 61         [ 3]  595         sta     0x61
   13A8 60            [ 6]  596         rts
                            597 ;
                            598 ;        Do AGC Mic Logic
                            599 ;
   13A9                     600 L13A9:
   13A9 AD 80 02      [ 4]  601         lda     U19_PORTA
   13AC 49 FF         [ 2]  602         eor     #0xFF
   13AE 4A            [ 2]  603         lsr
   13AF 4A            [ 2]  604         lsr
   13B0 4A            [ 2]  605         lsr
   13B1 4A            [ 2]  606         lsr
   13B2 18            [ 2]  607         clc
   13B3 65 5F         [ 3]  608         adc     0x5F
   13B5 AA            [ 2]  609         tax
   13B6 BD DC 13      [ 5]  610         lda     AGCTABLE,x
   13B9 85 62         [ 3]  611         sta     0x62
   13BB A5 52         [ 3]  612         lda     0x52
   13BD D0 16         [ 4]  613         bne     L13D5
   13BF A9 0A         [ 2]  614         lda     #0x0A
   13C1 85 52         [ 3]  615         sta     0x52
   13C3 A5 62         [ 3]  616         lda     0x62
   13C5 CD 82 03      [ 4]  617         cmp     audio_periph$ddr_reg_b
   13C8 90 08         [ 4]  618         bcc     L13D2
   13CA F0 09         [ 4]  619         beq     L13D5
   13CC EE 82 03      [ 6]  620         inc     audio_periph$ddr_reg_b
   13CF 4C D5 13      [ 3]  621         jmp     L13D5
                            622 ;
   13D2                     623 L13D2:
   13D2 CE 82 03      [ 6]  624         dec     audio_periph$ddr_reg_b
   13D5                     625 L13D5:
   13D5 AD 82 03      [ 4]  626         lda     audio_periph$ddr_reg_b
   13D8 8D 82 02      [ 4]  627         sta     U19_PORTB
   13DB 60            [ 6]  628         rts
                            629 ;
                            630 ;       AGC table
                            631 ;
   13DC                     632 AGCTABLE:
   13DC 03 04 06 08         633         .db     0x03, 0x04, 0x06, 0x08
   13E0 10 16 20 2D         634         .db     0x10, 0x16, 0x20, 0x2D
   13E4 40 5A 80 BF         635         .db     0x40, 0x5A, 0x80, 0xBF
   13E8 FF FF FF FF         636         .db     0xFF, 0xFF, 0xFF, 0xFF
   13EC FF                  637         .db     0xFF
                            638 ;
                            639 ;       Process RAM_65 and RAM_66
                            640 ;
   13ED                     641 L13ED:
   13ED A5 65         [ 3]  642         lda     0x65
   13EF AA            [ 2]  643         tax
   13F0 A5 66         [ 3]  644         lda     0x66
   13F2 D0 37         [ 4]  645         bne     L142B
   13F4 BD 59 14      [ 5]  646         lda     X1459,x
   13F7 C9 FE         [ 2]  647         cmp     #0xFE
   13F9 F0 27         [ 4]  648         beq     L1422
   13FB C9 FF         [ 2]  649         cmp     #0xFF
   13FD D0 0B         [ 4]  650         bne     L140A
   13FF A9 00         [ 2]  651         lda     #0x00
   1401 85 65         [ 3]  652         sta     0x65
   1403 A9 FA         [ 2]  653         lda     #0xFA
   1405 85 64         [ 3]  654         sta     0x64
   1407 4C 21 14      [ 3]  655         jmp     L1421
                            656 
                            657 
   140A                     658 L140A:
   140A C5 64         [ 3]  659         cmp     0x64
   140C D0 13         [ 4]  660         bne     L1421
   140E BD 5A 14      [ 5]  661         lda     X1459+1,x
   1411 20 F6 12      [ 6]  662         jsr     L12F6
   1414 BD 5B 14      [ 5]  663         lda     X1459+2,x
   1417 20 F6 12      [ 6]  664         jsr     L12F6
   141A A5 65         [ 3]  665         lda     0x65
   141C 18            [ 2]  666         clc
   141D 69 03         [ 2]  667         adc     #0x03
   141F 85 65         [ 3]  668         sta     0x65
                            669 
   1421                     670 L1421:
   1421 60            [ 6]  671         rts
                            672 
   1422                     673 L1422:
   1422 E6 66         [ 5]  674         inc     0x66
   1424 A9 00         [ 2]  675         lda     #0x00
   1426 85 65         [ 3]  676         sta     0x65
   1428 4C 21 14      [ 3]  677         jmp     L1421
                            678 
   142B                     679 L142B:
   142B BD 43 15      [ 5]  680         lda     X1543,x
   142E C9 FF         [ 2]  681         cmp     #0xFF
   1430 D0 0D         [ 4]  682         bne     L143F
   1432 A9 00         [ 2]  683         lda     #0x00
   1434 85 65         [ 3]  684         sta     0x65
   1436 85 66         [ 3]  685         sta     0x66
   1438 A9 FA         [ 2]  686         lda     #0xFA
   143A 85 64         [ 3]  687         sta     0x64
   143C 4C 21 14      [ 3]  688         jmp     L1421
                            689 
   143F                     690 L143F:
   143F C5 64         [ 3]  691         cmp     0x64
   1441 D0 DE         [ 4]  692         bne     L1421
   1443 BD 44 15      [ 5]  693         lda     X1543+1,x
   1446 20 F6 12      [ 6]  694         jsr     L12F6
   1449 BD 45 15      [ 5]  695         lda     X1543+2,x
   144C 20 F6 12      [ 6]  696         jsr     L12F6
   144F A5 65         [ 3]  697         lda     0x65
   1451 18            [ 2]  698         clc
   1452 69 03         [ 2]  699         adc     #0x03
   1454 85 65         [ 3]  700         sta     0x65
   1456 4C 21 14      [ 3]  701         jmp     L1421
                            702 
   1459                     703 X1459:
   1459 F5 35 46 F5 35 46   704         .byte   0xF5,0x35,0x46, 0xF5,0x35,0x46, 0xEE,0x35,0x46, 0xEB,0x33,0x46 
        EE 35 46 EB 33 46
   1465 E9 32 46 E9 33 42   705         .byte   0xE9,0x32,0x46, 0xE9,0x33,0x42, 0xE8,0x33,0x46, 0xE7,0x32,0x46
        E8 33 46 E7 32 46
   1471 E6 33 46 E5 32 46   706         .byte   0xE6,0x33,0x46, 0xE5,0x32,0x46, 0xE4,0x33,0x46, 0xE3,0x32,0x46
        E4 33 46 E3 32 46
   147D E2 33 46 E1 32 46   707         .byte   0xE2,0x33,0x46, 0xE1,0x32,0x46, 0xE0,0x33,0x46, 0xDF,0x32,0x46
        E0 33 46 DF 32 46
   1489 DE 33 46 DD 32 46   708         .byte   0xDE,0x33,0x46, 0xDD,0x32,0x46, 0xDD,0x34,0x46, 0xDC,0x33,0x46
        DD 34 46 DC 33 46
   1495 DB 32 46 DB 35 46   709         .byte   0xDB,0x32,0x46, 0xDB,0x35,0x46, 0xDA,0x33,0x46, 0xD9,0x32,0x46
        DA 33 46 D9 32 46
   14A1 D1 32 42 C6 33 47   710         .byte   0xD1,0x32,0x42, 0xC6,0x33,0x47, 0xC6,0x33,0x43, 0xC5,0x32,0x47
        C6 33 43 C5 32 47
   14AD C3 34 46 C2 33 47   711         .byte   0xC3,0x34,0x46, 0xC2,0x33,0x47, 0xC1,0x32,0x47, 0xC0,0x35,0x46
        C1 32 47 C0 35 46
   14B9 B9 34 46 B9 32 43   712         .byte   0xB9,0x34,0x46, 0xB9,0x32,0x43, 0xB7,0x35,0x46, 0xB7,0x33,0x42
        B7 35 46 B7 33 42
   14C5 B3 33 46 B2 32 46   713         .byte   0xB3,0x33,0x46, 0xB2,0x32,0x46, 0xA8,0x32,0x42, 0x9D,0x33,0x47
        A8 32 42 9D 33 47
   14D1 9C 32 47 9B 33 47   714         .byte   0x9C,0x32,0x47, 0x9B,0x33,0x47, 0x9A,0x32,0x47, 0x9A,0x34,0x46
        9A 32 47 9A 34 46
   14DD 99 33 47 99 33 43   715         .byte   0x99,0x33,0x47, 0x99,0x33,0x43, 0x99,0x35,0x46, 0x98,0x32,0x47
        99 35 46 98 32 47
   14E9 97 33 47 94 32 47   716         .byte   0x97,0x33,0x47, 0x94,0x32,0x47, 0x93,0x33,0x47, 0x92,0x32,0x47
        93 33 47 92 32 47
   14F5 91 33 47 90 32 47   717         .byte   0x91,0x33,0x47, 0x90,0x32,0x47, 0x87,0x33,0x42, 0x86,0x32,0x43
        87 33 42 86 32 43
   1501 7D 33 46 7C 32 46   718         .byte   0x7D,0x33,0x46, 0x7C,0x32,0x46, 0x77,0x32,0x42, 0x77,0x34,0x46
        77 32 42 77 34 46
   150D 75 32 43 75 35 46   719         .byte   0x75,0x32,0x43, 0x75,0x35,0x46, 0x6A,0x33,0x46, 0x69,0x32,0x46
        6A 33 46 69 32 46
   1519 67 33 46 66 32 46   720         .byte   0x67,0x33,0x46, 0x66,0x32,0x46, 0x66,0x32,0x43, 0x65,0x34,0x46
        66 32 43 65 34 46
   1525 62 35 46 62 33 42   721         .byte   0x62,0x35,0x46, 0x62,0x33,0x42, 0x56,0x33,0x46, 0x55,0x32,0x46
        56 33 46 55 32 46
   1531 55 32 42 54 33 46   722         .byte   0x55,0x32,0x42, 0x54,0x33,0x46, 0x53,0x32,0x46, 0x52,0x33,0x46
        53 32 46 52 33 46
   153D 51 32 46 FE FE FE   723         .byte   0x51,0x32,0x46, 0xFE,0xFE,0xFE
   1543                     724 X1543:
   1543 50 33 46 4F 32 46   725         .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        4E 33 46 4E 33 42
   154F 4D 32 46 4C 33 46   726         .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        4B 32 46 40 34 46
   155B 3E 35 46 3C 33 47   727         .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        3B 32 47 3A 33 47
   1567 39 32 47 32 32 42   728         .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        29 34 46 28 32 47
   1573 27 35 46 26 33 43   729         .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        23 33 47 22 32 47
   157F 1E 33 42 1D 32 43   730         .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        1B 33 47 1A 32 47
   158B 19 33 47 18 32 47   731         .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        17 34 46 17 33 47
   1597 17 32 42 16 32 47   732         .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        15 35 46 15 33 43
   15A3 08 32 43 03 33 46   733         .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        02 32 46 02 34 46
   15AF FF FF FF FF FF FF   734         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
                            735         
   1FFA                     736         .org    0x1FFA
                            737         ;
                            738         ; vectors
                            739         ;
   1FFA                     740 NMIVEC:
   1FFA FF FF               741         .dw     0xFFFF
   1FFC                     742 RESETVEC:
   1FFC 48 10               743         .dw     RESET
   1FFE                     744 IRQVEC:
   1FFE 00 10               745         .dw     IRQ
