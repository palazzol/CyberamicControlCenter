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
                             17 
                     005B    18 TAPE_BYTE       = 0x005B    ; storage for incoming serial byte (& 0x7F)
                     005C    19 SOL_MASK        = 0x005C    ; bitmask for solenoids
                     005D    20 CURR_CHANNEL    = 0x005D    ; current channel serial byte
                             21 
                     005F    22 AGC_LEVEL       = 0x005F    ; agc mic level
                     0060    23 AGC_ACCUM       = 0x0060    ; agc mic level accumulator
                     0061    24 AGC_SAMPLES     = 0x0061    ; agc mic sample counter
                     0062    25 AGC_GAIN        = 0x0062    ; agc calculated gain value
                     0063    26 CURR_PORT       = 0x0063    ; current channel port address
                     0064    27 TIMER_100MS_C   = 0x0064    ; 0.1s timer
                             28 
                             29 ;
                             30 ;       IRQ handler
                             31 ;
   1000                      32 IRQ:
   1000 48            [ 3]   33         pha
   1001 AD 05 02      [ 4]   34         lda     U18_edge_detect_control_DI_pos          ; clear PA7 flag
   1004 AD 85 02      [ 4]   35         lda     U19_edge_detect_control_DI_pos          ; clear PA7 flag
   1007 A9 7D         [ 2]   36         lda     #0x7D                                   ; expire every 125*8=1000us=1ms
   1009 8D 1D 02      [ 4]   37         sta     U18_1D                                  ; div by 8, enable interrupt
   100C A5 50         [ 3]   38         lda     TIMER_1MS_A                             ; 1ms timer
   100E F0 02         [ 4]   39         beq     L1012
   1010 C6 50         [ 5]   40         dec     TIMER_1MS_A
   1012                      41 L1012:
   1012 A5 51         [ 3]   42         lda     TIMER_1MS_B                             ; 1ms timer
   1014 F0 02         [ 4]   43         beq     L1018
   1016 C6 51         [ 5]   44         dec     TIMER_1MS_B
   1018                      45 L1018:
   1018 A5 52         [ 3]   46         lda     TIMER_1MS_C                             ; 1ms timer
   101A F0 02         [ 4]   47         beq     L101E
   101C C6 52         [ 5]   48         dec     TIMER_1MS_C
   101E                      49 L101E:
   101E C6 53         [ 5]   50         dec     TIMER_1MS_R
   1020 D0 24         [ 4]   51         bne     L1046
   1022 A9 64         [ 2]   52         lda     #0x64
   1024 85 53         [ 3]   53         sta     TIMER_1MS_R
   1026 A5 54         [ 3]   54         lda     TIMER_100MS_A
   1028 F0 02         [ 4]   55         beq     L102C
   102A C6 54         [ 5]   56         dec     TIMER_100MS_A
   102C                      57 L102C:
   102C A5 64         [ 3]   58         lda     TIMER_100MS_C
   102E F0 02         [ 4]   59         beq     L1032
   1030 C6 64         [ 5]   60         dec     TIMER_100MS_C
   1032                      61 L1032:
   1032 A5 55         [ 3]   62         lda     TIMER_100MS_B
   1034 F0 02         [ 4]   63         beq     L1038
   1036 C6 55         [ 5]   64         dec     TIMER_100MS_B
   1038                      65 L1038:
   1038 C6 56         [ 5]   66         dec     TIMER_100MS_R
   103A D0 0A         [ 4]   67         bne     L1046
   103C A9 64         [ 2]   68         lda     #0x64
   103E 85 56         [ 3]   69         sta     TIMER_100MS_R
   1040 A5 57         [ 3]   70         lda     TIMER_10S
   1042 F0 02         [ 4]   71         beq     L1046
   1044 C6 57         [ 5]   72         dec     TIMER_10S
   1046                      73 L1046:
   1046 68            [ 4]   74         pla
   1047 40            [ 6]   75         rti
                             76 ;
                             77 ;       Main Program Start
                             78 ;
   1048                      79 RESET:
   1048 D8            [ 2]   80         cld                                             ; No decimal mode
   1049 78            [ 2]   81         sei                                             ; Interrupts are not used
   104A A2 F0         [ 2]   82         ldx     #0xF0                                   ; Stack is at 0x01F0
   104C 9A            [ 2]   83         txs
   104D A9 00         [ 2]   84         lda     #0x00                                   ; Clear RAM
   104F A2 10         [ 2]   85         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1051                      86 ZERORAM:
   1051 95 00         [ 4]   87         sta     RAM_start,x
   1053 E8            [ 2]   88         inx
   1054 E0 80         [ 2]   89         cpx     #0x80
   1056 D0 F9         [ 4]   90         bne     ZERORAM
   1058 A9 00         [ 2]   91         lda     #0x00
   105A 8D 01 03      [ 4]   92         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   105D 8D 00 03      [ 4]   93         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1060 8D 81 03      [ 4]   94         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1063 8D 80 03      [ 4]   95         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1066 8D 83 03      [ 4]   96         sta     audio_control_reg_b                     ; Clear audio control B
   1069 8D 05 02      [ 4]   97         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   106C 8D 03 03      [ 4]   98         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   106F 8D 06 02      [ 4]   99         sta     U18_06
   1072 8D 86 02      [ 4]  100         sta     U19_06
   1075 8D 01 02      [ 4]  101         sta     U18_DDRA                                ; Buttons are inputs
   1078 A9 02         [ 2]  102         lda     #0x02
   107A 8D 81 02      [ 4]  103         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   107D A9 FF         [ 2]  104         lda     #0xFF
   107F 8D 82 03      [ 4]  105         sta     audio_periph$ddr_reg_b
   1082 8D 03 02      [ 4]  106         sta     U18_DDRB
   1085 8D 83 02      [ 4]  107         sta     U19_DDRB
   1088 A9 FC         [ 2]  108         lda     #0xFC
   108A 8D 02 03      [ 4]  109         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   108D A9 2E         [ 2]  110         lda     #0x2E
   108F 8D 01 03      [ 4]  111         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1092 8D 03 03      [ 4]  112         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1095 A9 3C         [ 2]  113         lda     #0x3C
   1097 8D 81 03      [ 4]  114         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   109A 8D 83 03      [ 4]  115         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   109D 58            [ 2]  116         cli
   109E 8D 1C 02      [ 4]  117         sta     U18_1C
   10A1 A9 64         [ 2]  118         lda     #0x64
   10A3 85 53         [ 3]  119         sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
   10A5 A9 18         [ 2]  120         lda     #0x18
   10A7 85 57         [ 3]  121         sta     TIMER_10S                               ; Init a 4 minute timer
   10A9 A9 64         [ 2]  122         lda     #0x64
   10AB 85 56         [ 3]  123         sta     TIMER_100MS_R                           ; 100 - init 0.1 sec master counter
   10AD A9 0A         [ 2]  124         lda     #0x0A
   10AF 85 62         [ 3]  125         sta     0x62
   10B1 A9 03         [ 2]  126         lda     #0x03
   10B3 8D 02 01      [ 4]  127         sta     UART_02
   10B6 EA            [ 2]  128         nop
   10B7 A9 09         [ 2]  129         lda     #0x09
   10B9 8D 02 01      [ 4]  130         sta     UART_02
   10BC A9 10         [ 2]  131         lda     #TAPEMODE_STOP
   10BE 20 34 12      [ 6]  132         jsr     TAPECMD
   10C1 A9 28         [ 2]  133         lda     #0x28
   10C3 85 54         [ 3]  134         sta     TIMER_100MS_A
   10C5 A9 64         [ 2]  135         lda     #0x64
   10C7 85 53         [ 3]  136         sta     TIMER_1MS_R
                            137 
                            138 
   10C9                     139 L10C9:
   10C9 A5 54         [ 3]  140         lda     TIMER_100MS_A
   10CB D0 FC         [ 4]  141         bne     L10C9
   10CD 20 01 12      [ 6]  142         jsr     INITBRDS
                            143 
                            144 
   10D0                     145 L10D0:
   10D0 A9 FA         [ 2]  146         lda     #0xFA
   10D2 85 64         [ 3]  147         sta     TIMER_100MS_C
   10D4 A9 00         [ 2]  148         lda     #0x00
   10D6 85 65         [ 3]  149         sta     0x65
   10D8 85 66         [ 3]  150         sta     0x66
   10DA A9 30         [ 2]  151         lda     #0x30
   10DC A9 40         [ 2]  152         lda     #0x40
   10DE 20 34 12      [ 6]  153         jsr     TAPECMD
                            154 
                            155 
   10E1                     156 L10E1:
   10E1 A9 00         [ 2]  157         lda     #0x00
   10E3 85 58         [ 3]  158         sta     0x58
                            159 
                            160 
   10E5                     161 L10E5:
   10E5 AD 02 03      [ 4]  162         lda     transport_periph$ddr_reg_b
   10E8 A9 0A         [ 2]  163         lda     #0x0A
   10EA 85 50         [ 3]  164         sta     TIMER_1MS_A
   10EC E6 58         [ 5]  165         inc     0x58
   10EE A5 58         [ 3]  166         lda     0x58
   10F0 C9 64         [ 2]  167         cmp     #0x64
   10F2 B0 0F         [ 4]  168         bcs     L1103
                            169 
                            170 
   10F4                     171 L10F4:
   10F4 20 F3 13      [ 6]  172         jsr     L13F3
   10F7 A5 50         [ 3]  173         lda     TIMER_1MS_A
   10F9 F0 E6         [ 4]  174         beq     L10E1
   10FB AD 03 03      [ 4]  175         lda     transport_control_reg_b
   10FE 10 F4         [ 4]  176         bpl     L10F4
   1100 4C E5 10      [ 3]  177         jmp     L10E5
                            178 
                            179 
   1103                     180 L1103:
   1103 A9 20         [ 2]  181         lda     #0x20
   1105 20 34 12      [ 6]  182         jsr     TAPECMD
   1108 A9 19         [ 2]  183         lda     #0x19
   110A 85 54         [ 3]  184         sta     TIMER_100MS_A
   110C A9 64         [ 2]  185         lda     #0x64
   110E 85 53         [ 3]  186         sta     TIMER_1MS_R
                            187 
                            188 
   1110                     189 L1110:
   1110 20 F3 13      [ 6]  190         jsr     L13F3
   1113 A5 54         [ 3]  191         lda     TIMER_100MS_A
   1115 D0 F9         [ 4]  192         bne     L1110
   1117 A9 00         [ 2]  193         lda     #0x00
   1119 85 59         [ 3]  194         sta     0x59
   111B 20 4F 12      [ 6]  195         jsr     L124F
   111E A9 40         [ 2]  196         lda     #0x40
   1120 20 34 12      [ 6]  197         jsr     TAPECMD
   1123 20 4F 12      [ 6]  198         jsr     L124F
   1126 A9 FA         [ 2]  199         lda     #0xFA
   1128 85 50         [ 3]  200         sta     TIMER_1MS_A
                            201 
                            202 
   112A                     203 L112A:
   112A 20 F3 13      [ 6]  204         jsr     L13F3
   112D A5 50         [ 3]  205         lda     TIMER_1MS_A
   112F D0 F9         [ 4]  206         bne     L112A
   1131 A9 20         [ 2]  207         lda     #0x20
   1133 20 34 12      [ 6]  208         jsr     TAPECMD
   1136 20 4F 12      [ 6]  209         jsr     L124F
   1139 E6 59         [ 5]  210         inc     0x59
   113B A9 10         [ 2]  211         lda     #0x10
   113D 20 34 12      [ 6]  212         jsr     TAPECMD
   1140 A9 80         [ 2]  213         lda     #0x80
   1142 20 34 12      [ 6]  214         jsr     TAPECMD
   1145 20 72 12      [ 6]  215         jsr     L1272
   1148 A9 10         [ 2]  216         lda     #0x10
   114A 20 34 12      [ 6]  217         jsr     TAPECMD
                            218 
                            219 
   114D                     220 L114D:
   114D A9 64         [ 2]  221         lda     #0x64
   114F 85 69         [ 3]  222         sta     0x69
   1151 A9 13         [ 2]  223         lda     #0x13
   1153 85 6A         [ 3]  224         sta     0x6A
   1155 20 AF 13      [ 6]  225         jsr     AGCUPD
   1158 20 F3 13      [ 6]  226         jsr     L13F3
   115B 20 D9 12      [ 6]  227         jsr     L12D9
   115E AD 02 01      [ 4]  228         lda     UART_02
   1161 29 05         [ 2]  229         and     #0x05
   1163 F0 23         [ 4]  230         beq     L1188
   1165 A5 67         [ 3]  231         lda     0x67
   1167 D0 0C         [ 4]  232         bne     L1175
   1169 AD 01 01      [ 4]  233         lda     UART_01
   116C C9 53         [ 2]  234         cmp     #0x53
   116E D0 18         [ 4]  235         bne     L1188
   1170 E6 67         [ 5]  236         inc     0x67
   1172 4C 88 11      [ 3]  237         jmp     L1188
                            238 
                            239 
   1175                     240 L1175:
   1175 A9 00         [ 2]  241         lda     #0x00
   1177 85 67         [ 3]  242         sta     0x67
   1179 AD 01 01      [ 4]  243         lda     UART_01
   117C C9 31         [ 2]  244         cmp     #0x31
   117E F0 36         [ 4]  245         beq     L11B6
   1180 C9 32         [ 2]  246         cmp     #0x32
   1182 F0 0A         [ 4]  247         beq     L118E
   1184 C9 33         [ 2]  248         cmp     #0x33
   1186 F0 1B         [ 4]  249         beq     L11A3
                            250 
                            251 
   1188                     252 L1188:
   1188 4C 4D 11      [ 3]  253         jmp     L114D
   118B 4C D0 10      [ 3]  254         jmp     L10D0
                            255 
                            256 
   118E                     257 L118E:
   118E A9 FF         [ 2]  258         lda     #0xFF
   1190 85 98         [ 3]  259         sta     0x98
   1192 85 9A         [ 3]  260         sta     0x9A
   1194 85 9C         [ 3]  261         sta     0x9C
   1196 85 9E         [ 3]  262         sta     0x9E
   1198 8D 02 02      [ 4]  263         sta     U18_PORTB
   119B A9 02         [ 2]  264         lda     #0x02
   119D 8D 80 02      [ 4]  265         sta     U19_PORTA
   11A0 4C 4D 11      [ 3]  266         jmp     L114D
                            267 
                            268 
   11A3                     269 L11A3:
   11A3 A9 00         [ 2]  270         lda     #0x00
   11A5 85 98         [ 3]  271         sta     0x98
   11A7 85 9A         [ 3]  272         sta     0x9A
   11A9 85 9C         [ 3]  273         sta     0x9C
   11AB 85 9E         [ 3]  274         sta     0x9E
   11AD 8D 02 02      [ 4]  275         sta     U18_PORTB
   11B0 8D 80 02      [ 4]  276         sta     U19_PORTA
   11B3 4C 4D 11      [ 3]  277         jmp     L114D
                            278 
                            279 
   11B6                     280 L11B6:
   11B6 20 01 12      [ 6]  281         jsr     INITBRDS
   11B9 A9 62         [ 2]  282         lda     #0x62
   11BB 85 69         [ 3]  283         sta     0x69
   11BD A9 13         [ 2]  284         lda     #0x13
   11BF 85 6A         [ 3]  285         sta     0x6A
   11C1 A9 00         [ 2]  286         lda     #0x00
   11C3 8D 80 02      [ 4]  287         sta     U19_PORTA
   11C6 A9 A0         [ 2]  288         lda     #0xA0
   11C8 8D 02 02      [ 4]  289         sta     U18_PORTB
   11CB A9 80         [ 2]  290         lda     #0x80
   11CD 20 34 12      [ 6]  291         jsr     TAPECMD
   11D0 20 72 12      [ 6]  292         jsr     L1272
   11D3 20 98 12      [ 6]  293         jsr     L1298
   11D6 20 01 12      [ 6]  294         jsr     INITBRDS
   11D9 A9 80         [ 2]  295         lda     #0x80
   11DB 8D 02 02      [ 4]  296         sta     U18_PORTB
   11DE E6 59         [ 5]  297         inc     0x59
   11E0 A5 59         [ 3]  298         lda     0x59
   11E2 C9 1A         [ 2]  299         cmp     #0x1A
   11E4 90 03         [ 4]  300         bcc     L11E9
   11E6 4C D0 10      [ 3]  301         jmp     L10D0
                            302 
                            303 
   11E9                     304 L11E9:
   11E9 A9 00         [ 2]  305         lda     #0x00
   11EB 85 65         [ 3]  306         sta     0x65
   11ED 85 66         [ 3]  307         sta     0x66
   11EF A9 FA         [ 2]  308         lda     #0xFA
   11F1 85 64         [ 3]  309         sta     TIMER_100MS_C
   11F3 20 72 12      [ 6]  310         jsr     L1272
   11F6 A9 10         [ 2]  311         lda     #0x10
   11F8 20 34 12      [ 6]  312         jsr     TAPECMD
   11FB 20 66 13      [ 6]  313         jsr     AGCMICRD
   11FE 4C 4D 11      [ 3]  314         jmp     L114D
                            315 ;
                            316 ;       Init boards
                            317 ;
   1201                     318 INITBRDS:
   1201 A9 3C         [ 2]  319         lda     #0x3C
   1203 8D 83 03      [ 4]  320         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1206 A9 34         [ 2]  321         lda     #0x34
   1208 8D 81 03      [ 4]  322         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   120B A2 00         [ 2]  323         ldx     #0x00
   120D                     324 NEXTBRD:
   120D A9 30         [ 2]  325         lda     #0x30
   120F 95 81         [ 4]  326         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1211 95 83         [ 4]  327         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1213 A9 FF         [ 2]  328         lda     #0xFF
   1215 95 80         [ 4]  329         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1217 95 82         [ 4]  330         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1219 A9 34         [ 2]  331         lda     #0x34
   121B 95 81         [ 4]  332         sta     board_1_control_reg_a,x                 ; A peripheral selected
   121D 95 83         [ 4]  333         sta     board_1_control_reg_b,x                 ; B peripheral selected
   121F A9 00         [ 2]  334         lda     #0x00
   1221 95 80         [ 4]  335         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1223 95 82         [ 4]  336         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1225 E8            [ 2]  337         inx
   1226 E8            [ 2]  338         inx
   1227 E8            [ 2]  339         inx
   1228 E8            [ 2]  340         inx
   1229 E0 20         [ 2]  341         cpx     #0x20                                   ; do for boards 1-8
   122B 90 E0         [ 4]  342         bcc     NEXTBRD
   122D A9 00         [ 2]  343         lda     #0x00                                   ; bug fix!
   122F 85 5D         [ 3]  344         sta     CURR_CHANNEL                            ; reset current channel serial byte
   1231 85 63         [ 3]  345         sta     CURR_PORT                               ; reset current channel port address
   1233 60            [ 6]  346         rts
                            347 ;
                            348 ;
                            349 ;       Send Transport command for 0.250 sec
                            350 ;       (Unified)
                            351 ;
   1234                     352 TAPECMD:
   1234 8D 02 03      [ 4]  353         sta     transport_periph$ddr_reg_b              ; enable output line
   1237 A9 FA         [ 2]  354         lda     #0xFA
   1239 85 50         [ 3]  355         sta     TIMER_1MS_A
   123B                     356 $6:
   123B 20 F3 13      [ 6]  357         jsr     L13F3                                 ; check for PROG button push
   123E A5 50         [ 3]  358         lda     TIMER_1MS_A
   1240 D0 F9         [ 4]  359         bne     $6
   1242 AD 02 03      [ 4]  360         lda     transport_periph$ddr_reg_b
   1245 29 60         [ 2]  361         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1247 D0 05         [ 4]  362         bne     $31                                     ; Yes, go to exit
   1249 A9 00         [ 2]  363         lda     #0x00                                   ; else unassert STOP or PLAY
   124B 8D 02 03      [ 4]  364         sta     transport_periph$ddr_reg_b              ; and then exit
   124E                     365 $31:
   124E 60            [ 6]  366         rts
                            367 
                            368 
   124F                     369 L124F:
   124F A9 00         [ 2]  370         lda     #0x00
   1251 85 58         [ 3]  371         sta     0x58
                            372 
                            373 
   1253                     374 L1253:
   1253 AD 02 03      [ 4]  375         lda     transport_periph$ddr_reg_b
   1256 A9 0A         [ 2]  376         lda     #0x0A
   1258 85 50         [ 3]  377         sta     TIMER_1MS_A
   125A E6 58         [ 5]  378         inc     0x58
   125C A5 58         [ 3]  379         lda     0x58
   125E C9 21         [ 2]  380         cmp     #0x21
   1260 B0 0F         [ 4]  381         bcs     L1271
                            382 
                            383 
   1262                     384 L1262:
   1262 20 F3 13      [ 6]  385         jsr     L13F3
   1265 A5 50         [ 3]  386         lda     TIMER_1MS_A
   1267 F0 E6         [ 4]  387         beq     L124F
   1269 AD 03 03      [ 4]  388         lda     transport_control_reg_b
   126C 10 F4         [ 4]  389         bpl     L1262
   126E 4C 53 12      [ 3]  390         jmp     L1253
                            391 
                            392 
   1271                     393 L1271:
   1271 60            [ 6]  394         rts
                            395 
                            396 
   1272                     397 L1272:
   1272 A9 FA         [ 2]  398         lda     #0xFA
   1274 85 50         [ 3]  399         sta     TIMER_1MS_A
                            400 
                            401 
   1276                     402 L1276:
   1276 20 F3 13      [ 6]  403         jsr     L13F3
   1279 A5 50         [ 3]  404         lda     TIMER_1MS_A
   127B D0 F9         [ 4]  405         bne     L1276
                            406 
                            407 
   127D                     408 L127D:
   127D 20 F3 13      [ 6]  409         jsr     L13F3
   1280 AD 02 03      [ 4]  410         lda     transport_periph$ddr_reg_b
   1283 6A            [ 2]  411         ror
   1284 90 F7         [ 4]  412         bcc     L127D
   1286 A9 A0         [ 2]  413         lda     #0xA0
   1288 85 50         [ 3]  414         sta     TIMER_1MS_A
                            415 
                            416 
   128A                     417 L128A:
   128A 20 F3 13      [ 6]  418         jsr     L13F3
   128D AD 02 03      [ 4]  419         lda     transport_periph$ddr_reg_b
   1290 6A            [ 2]  420         ror
   1291 90 EA         [ 4]  421         bcc     L127D
   1293 A5 50         [ 3]  422         lda     TIMER_1MS_A
   1295 D0 F3         [ 4]  423         bne     L128A
   1297 60            [ 6]  424         rts
                            425 
                            426 
   1298                     427 L1298:
   1298 AD 00 03      [ 4]  428         lda     transport_periph$ddr_reg_a
   129B A9 40         [ 2]  429         lda     #0x40
   129D 85 82         [ 3]  430         sta     0x82
   129F 85 86         [ 3]  431         sta     0x86
   12A1 85 8A         [ 3]  432         sta     0x8A
   12A3 85 8E         [ 3]  433         sta     0x8E
   12A5 A9 3C         [ 2]  434         lda     #0x3C
   12A7 8D 81 03      [ 4]  435         sta     audio_control_reg_a
   12AA A9 34         [ 2]  436         lda     #0x34
   12AC 8D 83 03      [ 4]  437         sta     audio_control_reg_b
   12AF A9 60         [ 2]  438         lda     #0x60
   12B1 85 82         [ 3]  439         sta     0x82
                            440 
                            441 
   12B3                     442 L12B3:
   12B3 AD 02 03      [ 4]  443         lda     transport_periph$ddr_reg_b
   12B6 4A            [ 2]  444         lsr
   12B7 90 11         [ 4]  445         bcc     L12CA
   12B9 20 D9 12      [ 6]  446         jsr     L12D9
   12BC 20 AF 13      [ 6]  447         jsr     AGCUPD
   12BF AD 01 03      [ 4]  448         lda     transport_control_reg_a
   12C2 10 EF         [ 4]  449         bpl     L12B3
   12C4 20 F9 12      [ 6]  450         jsr     L12F9
   12C7 4C B3 12      [ 3]  451         jmp     L12B3
                            452 
                            453 
   12CA                     454 L12CA:
   12CA A9 64         [ 2]  455         lda     #0x64
   12CC 85 50         [ 3]  456         sta     TIMER_1MS_A
                            457 
                            458 
   12CE                     459 L12CE:
   12CE AD 02 03      [ 4]  460         lda     transport_periph$ddr_reg_b
   12D1 4A            [ 2]  461         lsr
   12D2 B0 C4         [ 4]  462         bcs     L1298
   12D4 A5 50         [ 3]  463         lda     TIMER_1MS_A
   12D6 D0 F6         [ 4]  464         bne     L12CE
   12D8 60            [ 6]  465         rts
                            466 
                            467 
   12D9                     468 L12D9:
   12D9 AD 02 01      [ 4]  469         lda     UART_02
   12DC 29 02         [ 2]  470         and     #0x02
   12DE F0 18         [ 4]  471         beq     L12F8
   12E0 A5 68         [ 3]  472         lda     0x68
   12E2 D0 09         [ 4]  473         bne     L12ED
   12E4 A0 00         [ 2]  474         ldy     #0x00
   12E6 B1 69         [ 6]  475         lda     [0x69],y
   12E8 E6 68         [ 5]  476         inc     0x68
   12EA 4C F5 12      [ 3]  477         jmp     L12F5
                            478 
                            479 
   12ED                     480 L12ED:
   12ED A9 00         [ 2]  481         lda     #0x00
   12EF 85 68         [ 3]  482         sta     0x68
   12F1 A0 01         [ 2]  483         ldy     #0x01
   12F3 B1 69         [ 6]  484         lda     [0x69],y
                            485 
                            486 
   12F5                     487 L12F5:
   12F5 8D 01 01      [ 4]  488         sta     UART_01
                            489 
                            490 
   12F8                     491 L12F8:
   12F8 60            [ 6]  492         rts
                            493 ;
                            494 ; Protocol handler
                            495 ;
   12F9                     496 L12F9:
   12F9 AD 00 03      [ 4]  497         lda     transport_periph$ddr_reg_a
   12FC                     498 L12FC:
   12FC 29 7F         [ 2]  499         and     #0x7F                                   ; insure data is ASCII
   12FE 85 5B         [ 3]  500         sta     TAPE_BYTE                               ; store it here
   1300 29 7E         [ 2]  501         and     #0x7E                                   ; ignore bottom bit
   1302 C9 22         [ 2]  502         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1304 F0 3A         [ 4]  503         beq     PROCCHNL                                ; if so, process as channel
   1306 C9 32         [ 2]  504         cmp     #0x32                                   ; is it < 0x32 ?
   1308 90 4F         [ 4]  505         bcc     $18                                     ; ignore it
   130A C9 3A         [ 2]  506         cmp     #0x3A                                   ; is it < 0x3A
   130C 90 32         [ 4]  507         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   130E A5 5B         [ 3]  508         lda     TAPE_BYTE
   1310 C9 41         [ 2]  509         cmp     #0x41                                   ; is it < 0x41?
   1312 90 45         [ 4]  510         bcc     $18                                     ; ignore it
   1314 C9 4F         [ 2]  511         cmp     #0x4F                                   ; is it >= 0x4F?
   1316 B0 41         [ 4]  512         bcs     $18                                     ; ignore it
   1318 A6 63         [ 3]  513         ldx     CURR_PORT                               ; X = current board address
   131A 38            [ 2]  514         sec                                             ; (it's 0x41 to 0x4E)
   131B E9 41         [ 2]  515         sbc     #0x41                                   ; subtract 0x41
   131D C9 08         [ 2]  516         cmp     #0x08
   131F 90 02         [ 4]  517         bcc     $16                                     ; process as command
   1321 E8            [ 2]  518         inx
   1322 E8            [ 2]  519         inx
   1323                     520 $16:
   1323 29 07         [ 2]  521         and     #0x07                                   ; lookup bitmask in A
   1325 A8            [ 2]  522         tay
   1326 B9 5A 13      [ 5]  523         lda     MASKTBL,y
   1329 85 5C         [ 3]  524         sta     SOL_MASK                                ; store mask in SOL_MASK
   132B A5 5D         [ 3]  525         lda     CURR_CHANNEL
   132D 4A            [ 2]  526         lsr     a                                       ; get on/off in carry
   132E B0 09         [ 4]  527         bcs     $17                                     ; if on, jump
   1330 A5 5C         [ 3]  528         lda     SOL_MASK
   1332 49 FF         [ 2]  529         eor     #0xFF
   1334 35 00         [ 4]  530         and     RAM_start,x
   1336 95 00         [ 4]  531         sta     RAM_start,x                             ; turn off solenoid
   1338 60            [ 6]  532         rts
                            533 ;
   1339                     534 $17:
   1339 A5 5C         [ 3]  535         lda     SOL_MASK
   133B 15 00         [ 4]  536         ora     RAM_start,x
   133D 95 00         [ 4]  537         sta     RAM_start,x                             ; turn on solenoid
   133F 60            [ 6]  538         rts
                            539 ;
   1340                     540 PROCCHNL:
   1340 A5 5B         [ 3]  541         lda     TAPE_BYTE                               ; put channel byte in CURR_CHANNEL
   1342 85 5D         [ 3]  542         sta     CURR_CHANNEL
   1344 29 7E         [ 2]  543         and     #0x7E
   1346 C9 22         [ 2]  544         cmp     #0x22
   1348 D0 05         [ 4]  545         bne     CONVCHNL
   134A A9 98         [ 2]  546         lda     #0x98                                   ; process 0x22 or 0x23
   134C 85 63         [ 3]  547         sta     CURR_PORT                               ; set this to 0x98 - board 7
   134E 60            [ 6]  548         rts
                            549 ;
   134F                     550 CONVCHNL:
   134F 38            [ 2]  551         sec                                             ; process channel
   1350 E9 32         [ 2]  552         sbc     #0x32
   1352 0A            [ 2]  553         asl     a
   1353 18            [ 2]  554         clc
   1354 69 80         [ 2]  555         adc     #0x80
   1356 85 63         [ 3]  556         sta     CURR_PORT                               ; (X-0x32) * 2 + 0x80
   1358 60            [ 6]  557         rts
   1359                     558 $18:
   1359 60            [ 6]  559         rts
                            560 ;
                            561 ; bit mask table
                            562 ;
   135A                     563 MASKTBL:
   135A 01 02 04 08         564         .byte   0x01,0x02,0x04,0x08
   135E 10 20 40 80         565         .byte   0x10,0x20,0x40,0x80
   1362 4D 31 4D 32         566         .byte   0x4D,0x31,0x4D,0x32
                            567 ;
                            568 ;       Read the AGC mic level
                            569 ;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
                            570 ;
   1366                     571 AGCMICRD:
   1366 A9 00         [ 2]  572         lda     #0x00
   1368 85 60         [ 3]  573         sta     AGC_ACCUM                               ; init final agc value
   136A 85 61         [ 3]  574         sta     AGC_SAMPLES                             ; init agc sample counter
   136C A9 0A         [ 2]  575         lda     #0x0A
   136E 85 54         [ 3]  576         sta     TIMER_100MS_A                           ; Start a 1 second timer
   1370 A9 64         [ 2]  577         lda     #0x64
   1372 85 53         [ 3]  578         sta     TIMER_1MS_R
   1374                     579 $23:
   1374 20 F3 13      [ 6]  580         jsr     L13F3                                   ; housekeeping
   1377 A5 54         [ 3]  581         lda     TIMER_100MS_A
   1379 D0 F9         [ 4]  582         bne     $23                                     ; if 1 sec, do housekeeping
   137B A9 0A         [ 2]  583         lda     #0x0A
   137D 85 54         [ 3]  584         sta     TIMER_100MS_A
   137F A9 64         [ 2]  585         lda     #0x64
   1381 85 53         [ 3]  586         sta     TIMER_1MS_R                             ; reset timer
   1383 A5 61         [ 3]  587         lda     AGC_SAMPLES
   1385 C9 08         [ 2]  588         cmp     #0x08                                   ; 8 samples?
   1387 F0 15         [ 4]  589         beq     $27
   1389 E6 61         [ 5]  590         inc     AGC_SAMPLES                             ; increment the sample counter
   138B A2 09         [ 2]  591         ldx     #0x09
   138D 38            [ 2]  592         sec
   138E AD 80 03      [ 4]  593         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1391                     594 $24:                                                    ; read the most significant high bit
   1391 2A            [ 2]  595         rol     a
   1392 CA            [ 2]  596         dex
   1393 90 FC         [ 4]  597         bcc     $24
   1395 18            [ 2]  598         clc
   1396 8A            [ 2]  599         txa                                             ; 8=high bit7, 0=no high bits
   1397 65 60         [ 3]  600         adc     AGC_ACCUM                               ; add it into AGC_ACCUM (do this 8 times)
   1399 85 60         [ 3]  601         sta     AGC_ACCUM
   139B 4C 74 13      [ 3]  602         jmp     $23
                            603 ;
   139E                     604 $27:
   139E 46 60         [ 5]  605         lsr     AGC_ACCUM                               ; divide by 8 (average of 8 samples)
   13A0 46 60         [ 5]  606         lsr     AGC_ACCUM
   13A2 46 60         [ 5]  607         lsr     AGC_ACCUM
   13A4 A5 60         [ 3]  608         lda     AGC_ACCUM
   13A6 85 5F         [ 3]  609         sta     AGC_LEVEL                               ; store agc value in AGC_LEVEL
   13A8 A9 00         [ 2]  610         lda     #0x00
   13AA 85 60         [ 3]  611         sta     AGC_ACCUM                               ; clear these 2 and return
   13AC 85 61         [ 3]  612         sta     AGC_SAMPLES
   13AE 60            [ 6]  613         rts
                            614 ;
                            615 ;        Do AGC Mic Logic
                            616 ;
   13AF                     617 AGCUPD:
   13AF AD 80 02      [ 4]  618         lda     U19_PORTA                               ; read AGC knob
   13B2 49 FF         [ 2]  619         eor     #0xFF                                   ; invert the bits
   13B4 4A            [ 2]  620         lsr     a                                       ; get into lower nibble
   13B5 4A            [ 2]  621         lsr     a
   13B6 4A            [ 2]  622         lsr     a
   13B7 4A            [ 2]  623         lsr     a
   13B8 18            [ 2]  624         clc
   13B9 65 5F         [ 3]  625         adc     AGC_LEVEL                               ; add audio level to it
   13BB AA            [ 2]  626         tax
   13BC BD E2 13      [ 5]  627         lda     AGCTABLE,x                              ; and get the table value
   13BF 85 62         [ 3]  628         sta     AGC_GAIN                                ; store this value in AGC_GAIN
   13C1 A5 52         [ 3]  629         lda     TIMER_1MS_C                             ; 10ms timer expired?
   13C3 D0 16         [ 4]  630         bne     $26                                     ; no, just update CPU Leds
   13C5 A9 0A         [ 2]  631         lda     #0x0A
   13C7 85 52         [ 3]  632         sta     TIMER_1MS_C                             ; restart 10ms timer
   13C9 A5 62         [ 3]  633         lda     AGC_GAIN                                ; every 10ms, adjust gain by 1 if needed
   13CB CD 82 03      [ 4]  634         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   13CE 90 08         [ 4]  635         bcc     $25
   13D0 F0 09         [ 4]  636         beq     $26
   13D2 EE 82 03      [ 6]  637         inc     audio_periph$ddr_reg_b                  ; increase value
   13D5 4C DB 13      [ 3]  638         jmp     $26
                            639 ;
   13D8                     640 $25:
   13D8 CE 82 03      [ 6]  641         dec     audio_periph$ddr_reg_b                  ; decrease value
   13DB                     642 $26:
   13DB AD 82 03      [ 4]  643         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   13DE 8D 82 02      [ 4]  644         sta     U19_PORTB
   13E1 60            [ 6]  645         rts
                            646 ;
                            647 ;       AGC table
                            648 ;
   13E2                     649 AGCTABLE:
   13E2 03 04 06 08         650         .db     0x03, 0x04, 0x06, 0x08
   13E6 10 16 20 2D         651         .db     0x10, 0x16, 0x20, 0x2D
   13EA 40 5A 80 BF         652         .db     0x40, 0x5A, 0x80, 0xBF
   13EE FF FF FF FF         653         .db     0xFF, 0xFF, 0xFF, 0xFF
   13F2 FF                  654         .db     0xFF
                            655 ;
                            656 ;       Process RAM_65 and RAM_66
                            657 ;
   13F3                     658 L13F3:
   13F3 A5 65         [ 3]  659         lda     0x65
   13F5 AA            [ 2]  660         tax
   13F6 A5 66         [ 3]  661         lda     0x66
   13F8 D0 37         [ 4]  662         bne     L1431
   13FA BD 5F 14      [ 5]  663         lda     X145F,x
   13FD C9 FE         [ 2]  664         cmp     #0xFE
   13FF F0 27         [ 4]  665         beq     L1428
   1401 C9 FF         [ 2]  666         cmp     #0xFF
   1403 D0 0B         [ 4]  667         bne     L1410
   1405 A9 00         [ 2]  668         lda     #0x00
   1407 85 65         [ 3]  669         sta     0x65
   1409 A9 FA         [ 2]  670         lda     #0xFA
   140B 85 64         [ 3]  671         sta     TIMER_100MS_C
   140D 4C 27 14      [ 3]  672         jmp     L1427
                            673 
                            674 
   1410                     675 L1410:
   1410 C5 64         [ 3]  676         cmp     TIMER_100MS_C
   1412 D0 13         [ 4]  677         bne     L1427
   1414 BD 60 14      [ 5]  678         lda     X145F+1,x
   1417 20 FC 12      [ 6]  679         jsr     L12FC
   141A BD 61 14      [ 5]  680         lda     X145F+2,x
   141D 20 FC 12      [ 6]  681         jsr     L12FC
   1420 A5 65         [ 3]  682         lda     0x65
   1422 18            [ 2]  683         clc
   1423 69 03         [ 2]  684         adc     #0x03
   1425 85 65         [ 3]  685         sta     0x65
                            686 
                            687 
   1427                     688 L1427:
   1427 60            [ 6]  689         rts
                            690 
                            691 
   1428                     692 L1428:
   1428 E6 66         [ 5]  693         inc     0x66
   142A A9 00         [ 2]  694         lda     #0x00
   142C 85 65         [ 3]  695         sta     0x65
   142E 4C 27 14      [ 3]  696         jmp     L1427
                            697 
                            698 
   1431                     699 L1431:
   1431 BD 49 15      [ 5]  700         lda     X1549,x
   1434 C9 FF         [ 2]  701         cmp     #0xFF
   1436 D0 0D         [ 4]  702         bne     L1445
   1438 A9 00         [ 2]  703         lda     #0x00
   143A 85 65         [ 3]  704         sta     0x65
   143C 85 66         [ 3]  705         sta     0x66
   143E A9 FA         [ 2]  706         lda     #0xFA
   1440 85 64         [ 3]  707         sta     TIMER_100MS_C
   1442 4C 27 14      [ 3]  708         jmp     L1427
                            709 
                            710 
   1445                     711 L1445:
   1445 C5 64         [ 3]  712         cmp     TIMER_100MS_C
   1447 D0 DE         [ 4]  713         bne     L1427
   1449 BD 4A 15      [ 5]  714         lda     X1549+1,x
   144C 20 FC 12      [ 6]  715         jsr     L12FC
   144F BD 4B 15      [ 5]  716         lda     X1549+2,x
   1452 20 FC 12      [ 6]  717         jsr     L12FC
   1455 A5 65         [ 3]  718         lda     0x65
   1457 18            [ 2]  719         clc
   1458 69 03         [ 2]  720         adc     #0x03
   145A 85 65         [ 3]  721         sta     0x65
   145C 4C 27 14      [ 3]  722         jmp     L1427
                            723 
   145F                     724 X145F:
   145F F5 35 49 F5 35 4A   725         .byte   0xF5,0x35,0x49, 0xF5,0x35,0x4A, 0xEE,0x35,0x46, 0xEB,0x33,0x46
        EE 35 46 EB 33 46
   146B E9 32 46 E9 33 42   726         .byte   0xE9,0x32,0x46, 0xE9,0x33,0x42, 0xE8,0x33,0x46, 0xE7,0x32,0x46
        E8 33 46 E7 32 46
   1477 E6 33 46 E5 32 46   727         .byte   0xE6,0x33,0x46, 0xE5,0x32,0x46, 0xE4,0x33,0x46, 0xE3,0x32,0x46
        E4 33 46 E3 32 46
   1483 E2 33 46 E1 32 46   728         .byte   0xE2,0x33,0x46, 0xE1,0x32,0x46, 0xE0,0x33,0x46, 0xDF,0x32,0x46
        E0 33 46 DF 32 46
   148F DE 33 46 DD 32 46   729         .byte   0xDE,0x33,0x46, 0xDD,0x32,0x46, 0xDD,0x34,0x46, 0xDC,0x33,0x46
        DD 34 46 DC 33 46
   149B DB 32 46 DB 35 46   730         .byte   0xDB,0x32,0x46, 0xDB,0x35,0x46, 0xDA,0x33,0x46, 0xD9,0x32,0x46
        DA 33 46 D9 32 46
   14A7 D1 32 42 C6 33 47   731         .byte   0xD1,0x32,0x42, 0xC6,0x33,0x47, 0xC6,0x33,0x43, 0xC5,0x32,0x47
        C6 33 43 C5 32 47
   14B3 C3 34 46 C2 33 47   732         .byte   0xC3,0x34,0x46, 0xC2,0x33,0x47, 0xC1,0x32,0x47, 0xC0,0x35,0x46
        C1 32 47 C0 35 46
   14BF B9 34 46 B9 32 43   733         .byte   0xB9,0x34,0x46, 0xB9,0x32,0x43, 0xB7,0x35,0x46, 0xB7,0x33,0x42
        B7 35 46 B7 33 42
   14CB B3 33 46 B2 32 46   734         .byte   0xB3,0x33,0x46, 0xB2,0x32,0x46, 0xA8,0x32,0x42, 0x9D,0x33,0x47
        A8 32 42 9D 33 47
   14D7 9C 32 47 9B 33 47   735         .byte   0x9C,0x32,0x47, 0x9B,0x33,0x47, 0x9A,0x32,0x47, 0x9A,0x34,0x46
        9A 32 47 9A 34 46
   14E3 99 33 47 99 33 43   736         .byte   0x99,0x33,0x47, 0x99,0x33,0x43, 0x99,0x35,0x46, 0x98,0x32,0x47
        99 35 46 98 32 47
   14EF 97 33 47 94 32 47   737         .byte   0x97,0x33,0x47, 0x94,0x32,0x47, 0x93,0x33,0x47, 0x92,0x32,0x47
        93 33 47 92 32 47
   14FB 91 33 47 90 32 47   738         .byte   0x91,0x33,0x47, 0x90,0x32,0x47, 0x87,0x33,0x42, 0x86,0x32,0x43
        87 33 42 86 32 43
   1507 7D 33 46 7C 32 46   739         .byte   0x7D,0x33,0x46, 0x7C,0x32,0x46, 0x77,0x32,0x42, 0x77,0x34,0x46
        77 32 42 77 34 46
   1513 75 32 43 75 35 46   740         .byte   0x75,0x32,0x43, 0x75,0x35,0x46, 0x6A,0x33,0x46, 0x69,0x32,0x46
        6A 33 46 69 32 46
   151F 67 33 46 66 32 46   741         .byte   0x67,0x33,0x46, 0x66,0x32,0x46, 0x66,0x32,0x43, 0x65,0x34,0x46
        66 32 43 65 34 46
   152B 62 35 46 62 33 42   742         .byte   0x62,0x35,0x46, 0x62,0x33,0x42, 0x56,0x33,0x46, 0x55,0x32,0x46
        56 33 46 55 32 46
   1537 55 32 42 54 33 46   743         .byte   0x55,0x32,0x42, 0x54,0x33,0x46, 0x53,0x32,0x46, 0x52,0x33,0x46
        53 32 46 52 33 46
   1543 51 32 46 FE FE FE   744         .byte   0x51,0x32,0x46, 0xFE,0xFE,0xFE
   1549                     745 X1549:
   1549 50 33 46 4F 32 46   746         .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        4E 33 46 4E 33 42
   1555 4D 32 46 4C 33 46   747         .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        4B 32 46 40 34 46
   1561 3E 35 46 3C 33 47   748         .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        3B 32 47 3A 33 47
   156D 39 32 47 32 32 42   749         .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        29 34 46 28 32 47
   1579 27 35 46 26 33 43   750         .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        23 33 47 22 32 47
   1585 1E 33 42 1D 32 43   751         .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        1B 33 47 1A 32 47
   1591 19 33 47 18 32 47   752         .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        17 34 46 17 33 47
   159D 17 32 42 16 32 47   753         .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        15 35 46 15 33 43
   15A9 08 32 43 03 33 46   754         .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        02 32 46 02 34 46
   15B5 FF FF FF FF FF FF   755         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
                            756 
   1FFA                     757         .org    0x1FFA
                            758         ;
                            759         ; vectors
                            760         ;
   1FFA                     761 NMIVEC:
   1FFA FF FF               762         .dw     0xFFFF
   1FFC                     763 RESETVEC:
   1FFC 48 10               764         .dw     RESET
   1FFE                     765 IRQVEC:
   1FFE 00 10               766         .dw     IRQ
