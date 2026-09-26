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
                     0058    16 ZEROCROSS_CTR   = 0x0058    ; zero crossing counter
                     0059    17 TRACK_CTR       = 0x0059    ; track counter
                             18 
                     005B    19 TAPE_BYTE       = 0x005B    ; storage for incoming serial byte (& 0x7F)
                     005C    20 SOL_MASK        = 0x005C    ; bitmask for solenoids
                     005D    21 CURR_CHANNEL    = 0x005D    ; current channel serial byte
                             22 
                     005F    23 AGC_LEVEL       = 0x005F    ; agc mic level
                     0060    24 AGC_ACCUM       = 0x0060    ; agc mic level accumulator
                     0061    25 AGC_SAMPLES     = 0x0061    ; agc mic sample counter
                     0062    26 AGC_GAIN        = 0x0062    ; agc calculated gain value
                     0063    27 CURR_PORT       = 0x0063    ; current channel port address
                     0064    28 TIMER_100MS_C   = 0x0064    ; 0.1s timer
                     0065    29 RAM_65          = 0x0065    ; TBD?
                     0066    30 RAM_66          = 0x0066    ; TBD?
                     0067    31 RAM_67          = 0x0067    ; TBD?
                     0068    32 RAM_68          = 0x0068    ; TBD?
                     0069    33 RAM_69          = 0x0069    ; TBD?
                     006A    34 RAM_6A          = 0x006A    ; TBD?
                             35 ;
                             36 ;       IRQ handler
                             37 ;
   1000                      38 IRQ:
   1000 48            [ 3]   39         pha
   1001 AD 05 02      [ 4]   40         lda     U18_edge_detect_control_DI_pos          ; clear PA7 flag
   1004 AD 85 02      [ 4]   41         lda     U19_edge_detect_control_DI_pos          ; clear PA7 flag
   1007 A9 7D         [ 2]   42         lda     #0x7D                                   ; expire every 125*8=1000us=1ms
   1009 8D 1D 02      [ 4]   43         sta     U18_1D                                  ; div by 8, enable interrupt
   100C A5 50         [ 3]   44         lda     TIMER_1MS_A                             ; 1ms timer
   100E F0 02         [ 4]   45         beq     L1012
   1010 C6 50         [ 5]   46         dec     TIMER_1MS_A
   1012                      47 L1012:
   1012 A5 51         [ 3]   48         lda     TIMER_1MS_B                             ; 1ms timer
   1014 F0 02         [ 4]   49         beq     L1018
   1016 C6 51         [ 5]   50         dec     TIMER_1MS_B
   1018                      51 L1018:
   1018 A5 52         [ 3]   52         lda     TIMER_1MS_C                             ; 1ms timer
   101A F0 02         [ 4]   53         beq     L101E
   101C C6 52         [ 5]   54         dec     TIMER_1MS_C
   101E                      55 L101E:
   101E C6 53         [ 5]   56         dec     TIMER_1MS_R
   1020 D0 24         [ 4]   57         bne     L1046
   1022 A9 64         [ 2]   58         lda     #0x64
   1024 85 53         [ 3]   59         sta     TIMER_1MS_R
   1026 A5 54         [ 3]   60         lda     TIMER_100MS_A
   1028 F0 02         [ 4]   61         beq     L102C
   102A C6 54         [ 5]   62         dec     TIMER_100MS_A
   102C                      63 L102C:
   102C A5 64         [ 3]   64         lda     TIMER_100MS_C
   102E F0 02         [ 4]   65         beq     L1032
   1030 C6 64         [ 5]   66         dec     TIMER_100MS_C
   1032                      67 L1032:
   1032 A5 55         [ 3]   68         lda     TIMER_100MS_B
   1034 F0 02         [ 4]   69         beq     L1038
   1036 C6 55         [ 5]   70         dec     TIMER_100MS_B
   1038                      71 L1038:
   1038 C6 56         [ 5]   72         dec     TIMER_100MS_R
   103A D0 0A         [ 4]   73         bne     L1046
   103C A9 64         [ 2]   74         lda     #0x64
   103E 85 56         [ 3]   75         sta     TIMER_100MS_R
   1040 A5 57         [ 3]   76         lda     TIMER_10S
   1042 F0 02         [ 4]   77         beq     L1046
   1044 C6 57         [ 5]   78         dec     TIMER_10S
   1046                      79 L1046:
   1046 68            [ 4]   80         pla
   1047 40            [ 6]   81         rti
                             82 ;
                             83 ;       Main Program Start
                             84 ;
   1048                      85 RESET:
   1048 D8            [ 2]   86         cld                                             ; No decimal mode
   1049 78            [ 2]   87         sei                                             ; Interrupts are not used
   104A A2 F0         [ 2]   88         ldx     #0xF0                                   ; Stack is at 0x01F0
   104C 9A            [ 2]   89         txs
   104D A9 00         [ 2]   90         lda     #0x00                                   ; Clear RAM
   104F A2 10         [ 2]   91         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1051                      92 ZERORAM:
   1051 95 00         [ 4]   93         sta     0x00,x
   1053 E8            [ 2]   94         inx
   1054 E0 80         [ 2]   95         cpx     #0x80
   1056 D0 F9         [ 4]   96         bne     ZERORAM
   1058 A9 00         [ 2]   97         lda     #0x00
   105A 8D 01 03      [ 4]   98         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   105D 8D 00 03      [ 4]   99         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1060 8D 81 03      [ 4]  100         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1063 8D 80 03      [ 4]  101         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1066 8D 83 03      [ 4]  102         sta     audio_control_reg_b                     ; Clear audio control B
   1069 8D 05 02      [ 4]  103         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   106C 8D 03 03      [ 4]  104         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   106F 8D 06 02      [ 4]  105         sta     U18_06                                  ; ???
   1072 8D 86 02      [ 4]  106         sta     U19_06                                  ; ???
   1075 8D 01 02      [ 4]  107         sta     U18_DDRA                                ; Buttons are inputs
   1078 A9 02         [ 2]  108         lda     #0x02
   107A 8D 81 02      [ 4]  109         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   107D A9 FF         [ 2]  110         lda     #0xFF
   107F 8D 82 03      [ 4]  111         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1082 8D 03 02      [ 4]  112         sta     U18_DDRB                                ; Button lights are outputs
   1085 8D 83 02      [ 4]  113         sta     U19_DDRB                                ; CPU card lights are outputs
   1088 A9 FC         [ 2]  114         lda     #0xFC
   108A 8D 02 03      [ 4]  115         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   108D A9 2E         [ 2]  116         lda     #0x2E
   108F 8D 01 03      [ 4]  117         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1092 8D 03 03      [ 4]  118         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1095 A9 3C         [ 2]  119         lda     #0x3C
   1097 8D 81 03      [ 4]  120         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   109A 8D 83 03      [ 4]  121         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   109D 58            [ 2]  122         cli
   109E 8D 1C 02      [ 4]  123         sta     U18_1C
   10A1 A9 64         [ 2]  124         lda     #0x64
   10A3 85 53         [ 3]  125         sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
   10A5 A9 18         [ 2]  126         lda     #0x18
   10A7 85 57         [ 3]  127         sta     TIMER_10S                               ; Init a 4 minute timer
   10A9 A9 64         [ 2]  128         lda     #0x64
   10AB 85 56         [ 3]  129         sta     TIMER_100MS_R                           ; 100 - init 0.1 sec master counter
   10AD A9 0A         [ 2]  130         lda     #0x0A                                   ; 10
   10AF 85 62         [ 3]  131         sta     AGC_GAIN                                ; Set initial AGC gain value
   10B1 A9 09         [ 2]  132         lda     #0x09
   10B3 8D 02 01      [ 4]  133         sta     UART_02                                 ; ???
   10B6 A9 10         [ 2]  134         lda     #TAPEMODE_STOP
   10B8 20 2E 12      [ 6]  135         jsr     TAPECMD                                 ; STOP tape
   10BB A9 28         [ 2]  136         lda     #0x28                                   ; this will count 4 seconds
   10BD 85 54         [ 3]  137         sta     TIMER_100MS_A
   10BF A9 64         [ 2]  138         lda     #0x64                                   ; reset master timer
   10C1 85 53         [ 3]  139         sta     TIMER_1MS_R
   10C3                     140 $1:
   10C3 A5 54         [ 3]  141         lda     TIMER_100MS_A                           ; do not much for 4 seconds
   10C5 D0 FC         [ 4]  142         bne     $1
   10C7 20 FB 11      [ 6]  143         jsr     INITBRDS
                            144 
                            145 
   10CA                     146 REWIND:
   10CA A9 FA         [ 2]  147         lda     #0xFA
   10CC 85 64         [ 3]  148         sta     TIMER_100MS_C
   10CE A9 00         [ 2]  149         lda     #0x00
   10D0 85 65         [ 3]  150         sta     RAM_65
   10D2 85 66         [ 3]  151         sta     RAM_66
   10D4 A9 30         [ 2]  152         lda     #0x30
   10D6 A9 40         [ 2]  153         lda     #0x40
   10D8 20 2E 12      [ 6]  154         jsr     TAPECMD
                            155 
                            156 
   10DB                     157 L10DB:
   10DB A9 00         [ 2]  158         lda     #0x00
   10DD 85 58         [ 3]  159         sta     0x58
                            160 
                            161 
   10DF                     162 L10DF:
   10DF AD 02 03      [ 4]  163         lda     transport_periph$ddr_reg_b
   10E2 A9 0A         [ 2]  164         lda     #0x0A
   10E4 85 50         [ 3]  165         sta     0x50
   10E6 E6 58         [ 5]  166         inc     0x58
   10E8 A5 58         [ 3]  167         lda     0x58
   10EA C9 64         [ 2]  168         cmp     #0x64
   10EC B0 0F         [ 4]  169         bcs     L10FD
                            170 
                            171 
   10EE                     172 L10EE:
   10EE 20 ED 13      [ 6]  173         jsr     L13ED
   10F1 A5 50         [ 3]  174         lda     0x50
   10F3 F0 E6         [ 4]  175         beq     L10DB
   10F5 AD 03 03      [ 4]  176         lda     transport_control_reg_b
   10F8 10 F4         [ 4]  177         bpl     L10EE
   10FA 4C DF 10      [ 3]  178         jmp     L10DF
                            179 
                            180 
   10FD                     181 L10FD:
   10FD A9 20         [ 2]  182         lda     #0x20
   10FF 20 2E 12      [ 6]  183         jsr     TAPECMD
   1102 A9 19         [ 2]  184         lda     #0x19
   1104 85 54         [ 3]  185         sta     0x54
   1106 A9 64         [ 2]  186         lda     #0x64
   1108 85 53         [ 3]  187         sta     0x53
                            188 
                            189 
   110A                     190 L110A:
   110A 20 ED 13      [ 6]  191         jsr     L13ED
   110D A5 54         [ 3]  192         lda     0x54
   110F D0 F9         [ 4]  193         bne     L110A
   1111 A9 00         [ 2]  194         lda     #0x00
   1113 85 59         [ 3]  195         sta     0x59
   1115 20 49 12      [ 6]  196         jsr     WAITTONE
   1118 A9 40         [ 2]  197         lda     #0x40
   111A 20 2E 12      [ 6]  198         jsr     TAPECMD
   111D 20 49 12      [ 6]  199         jsr     WAITTONE
   1120 A9 FA         [ 2]  200         lda     #0xFA
   1122 85 50         [ 3]  201         sta     0x50
                            202 
                            203 
   1124                     204 L1124:
   1124 20 ED 13      [ 6]  205         jsr     L13ED
   1127 A5 50         [ 3]  206         lda     0x50
   1129 D0 F9         [ 4]  207         bne     L1124
   112B A9 20         [ 2]  208         lda     #0x20
   112D 20 2E 12      [ 6]  209         jsr     TAPECMD
   1130 20 49 12      [ 6]  210         jsr     WAITTONE
   1133 E6 59         [ 5]  211         inc     0x59
   1135 A9 10         [ 2]  212         lda     #0x10
   1137 20 2E 12      [ 6]  213         jsr     TAPECMD
   113A A9 80         [ 2]  214         lda     #0x80
   113C 20 2E 12      [ 6]  215         jsr     TAPECMD
   113F 20 6C 12      [ 6]  216         jsr     WAITCD
   1142 A9 10         [ 2]  217         lda     #0x10
   1144 20 2E 12      [ 6]  218         jsr     TAPECMD
                            219 
                            220 
   1147                     221 L1147:
   1147 A9 5E         [ 2]  222         lda     #0x5E
   1149 85 69         [ 3]  223         sta     RAM_69
   114B A9 13         [ 2]  224         lda     #0x13
   114D 85 6A         [ 3]  225         sta     RAM_6A                                    ; set address to 0x135E?
   114F 20 A9 13      [ 6]  226         jsr     AGCUPD
   1152 20 ED 13      [ 6]  227         jsr     L13ED
   1155 20 D3 12      [ 6]  228         jsr     L12D3
   1158 AD 02 01      [ 4]  229         lda     UART_02
   115B 29 05         [ 2]  230         and     #0x05
   115D F0 23         [ 4]  231         beq     L1182
   115F A5 67         [ 3]  232         lda     RAM_67
   1161 D0 0C         [ 4]  233         bne     L116F
   1163 AD 01 01      [ 4]  234         lda     UART_01
   1166 C9 53         [ 2]  235         cmp     #0x53                                   ; 'S' - start command?
   1168 D0 18         [ 4]  236         bne     L1182
   116A E6 67         [ 5]  237         inc     RAM_67
   116C 4C 82 11      [ 3]  238         jmp     L1182
                            239 
                            240 
   116F                     241 L116F:
   116F A9 00         [ 2]  242         lda     #0x00
   1171 85 67         [ 3]  243         sta     RAM_67
   1173 AD 01 01      [ 4]  244         lda     UART_01
   1176 C9 31         [ 2]  245         cmp     #0x31                                   ; '1' - 2nd byte startplay command?
   1178 F0 36         [ 4]  246         beq     STARTPLAY
   117A C9 32         [ 2]  247         cmp     #0x32                                   ; '2' - 2nd byte lights command?
   117C F0 0A         [ 4]  248         beq     L1188
   117E C9 33         [ 2]  249         cmp     #0x33                                   ; '3' - 2nd byte lights command?
   1180 F0 1B         [ 4]  250         beq     L119D
   1182                     251 L1182:
   1182 4C 47 11      [ 3]  252         jmp     L1147
   1185 4C CA 10      [ 3]  253         jmp     REWIND
                            254 ; lights to all ones
   1188                     255 L1188:
   1188 A9 FF         [ 2]  256         lda     #0xFF
   118A 85 98         [ 3]  257         sta     board_7_periph$ddr_reg_a
   118C 85 9A         [ 3]  258         sta     board_7_periph$ddr_reg_b
   118E 85 9C         [ 3]  259         sta     board_8_periph$ddr_reg_a
   1190 85 9E         [ 3]  260         sta     board_8_periph$ddr_reg_b
   1192 8D 02 02      [ 4]  261         sta     U18_PORTB
   1195 A9 02         [ 2]  262         lda     #0x02
   1197 8D 80 02      [ 4]  263         sta     U19_PORTA
   119A 4C 47 11      [ 3]  264         jmp     L1147
                            265 ; lights to all zeros
   119D                     266 L119D:
   119D A9 00         [ 2]  267         lda     #0x00
   119F 85 98         [ 3]  268         sta     board_7_periph$ddr_reg_a
   11A1 85 9A         [ 3]  269         sta     board_7_periph$ddr_reg_b
   11A3 85 9C         [ 3]  270         sta     board_8_periph$ddr_reg_a
   11A5 85 9E         [ 3]  271         sta     board_8_periph$ddr_reg_b
   11A7 8D 02 02      [ 4]  272         sta     U18_PORTB
   11AA 8D 80 02      [ 4]  273         sta     U19_PORTA
   11AD 4C 47 11      [ 3]  274         jmp     L1147
                            275 
                            276 ;   we have been started!
   11B0                     277 STARTPLAY:
   11B0 20 FB 11      [ 6]  278         jsr     INITBRDS
   11B3 A9 5C         [ 2]  279         lda     #0x5C
   11B5 85 69         [ 3]  280         sta     RAM_69
   11B7 A9 13         [ 2]  281         lda     #0x13
   11B9 85 6A         [ 3]  282         sta     RAM_6A                                    ; set address to 0x1362?
   11BB A9 00         [ 2]  283         lda     #0x00
   11BD 8D 80 02      [ 4]  284         sta     U19_PORTA                               ; turn off RESET button light
   11C0 A9 A0         [ 2]  285         lda     #0xA0
   11C2 8D 02 02      [ 4]  286         sta     U18_PORTB                               ; turn off some lights - TBD
   11C5 A9 80         [ 2]  287         lda     #TAPEMODE_PLAY
   11C7 20 2E 12      [ 6]  288         jsr     TAPECMD                                 ; PLAY tape
   11CA 20 6C 12      [ 6]  289         jsr     WAITCD                                  ; wait for carrier
   11CD 20 92 12      [ 6]  290         jsr     PLAYTRK                                 ; play a track!
   11D0 20 FB 11      [ 6]  291         jsr     INITBRDS                                ; init the boards
   11D3 A9 80         [ 2]  292         lda     #0x80
   11D5 8D 02 02      [ 4]  293         sta     U18_PORTB                               ; turn off all but PROG light
   11D8 E6 59         [ 5]  294         inc     TRACK_CTR                               ; track counter
   11DA A5 59         [ 3]  295         lda     TRACK_CTR
   11DC C9 1A         [ 2]  296         cmp     #0x1A                                   ; 26?
   11DE 90 03         [ 4]  297         bcc     NEXTTRK
   11E0 4C CA 10      [ 3]  298         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            299 
   11E3                     300 NEXTTRK:
   11E3 A9 00         [ 2]  301         lda     #0x00
   11E5 85 65         [ 3]  302         sta     RAM_65
   11E7 85 66         [ 3]  303         sta     RAM_66
   11E9 A9 FA         [ 2]  304         lda     #0xFA
   11EB 85 64         [ 3]  305         sta     TIMER_100MS_C
   11ED 20 6C 12      [ 6]  306         jsr     WAITCD                                  ; wait for carrier
   11F0 A9 10         [ 2]  307         lda     #TAPEMODE_STOP
   11F2 20 2E 12      [ 6]  308         jsr     TAPECMD                                 ; STOP tape
   11F5 20 60 13      [ 6]  309         jsr     AGCMICRD                                ; Read the AGC mic level
   11F8 4C 47 11      [ 3]  310         jmp     L1147
                            311 ;
                            312 ;       Init boards
                            313 ;
   11FB                     314 INITBRDS:
   11FB A9 3C         [ 2]  315         lda     #0x3C
   11FD 8D 83 03      [ 4]  316         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1200 A9 34         [ 2]  317         lda     #0x34
   1202 8D 81 03      [ 4]  318         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1205 A2 00         [ 2]  319         ldx     #0x00
   1207                     320 NEXTBRD:
   1207 A9 30         [ 2]  321         lda     #0x30
   1209 95 81         [ 4]  322         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   120B 95 83         [ 4]  323         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   120D A9 FF         [ 2]  324         lda     #0xFF
   120F 95 80         [ 4]  325         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1211 95 82         [ 4]  326         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1213 A9 34         [ 2]  327         lda     #0x34
   1215 95 81         [ 4]  328         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1217 95 83         [ 4]  329         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1219 A9 00         [ 2]  330         lda     #0x00
   121B 95 80         [ 4]  331         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   121D 95 82         [ 4]  332         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   121F E8            [ 2]  333         inx
   1220 E8            [ 2]  334         inx
   1221 E8            [ 2]  335         inx
   1222 E8            [ 2]  336         inx
   1223 E0 20         [ 2]  337         cpx     #0x20                                   ; do for boards 1-8
   1225 90 E0         [ 4]  338         bcc     NEXTBRD
   1227 A9 00         [ 2]  339         lda     #0x00                                   ; bug fix!
   1229 85 5D         [ 3]  340         sta     CURR_CHANNEL                            ; reset current channel serial byte
   122B 85 63         [ 3]  341         sta     CURR_PORT                               ; reset current channel port address
   122D 60            [ 6]  342         rts
                            343 ;
                            344 ;       Send Transport command for 0.250 sec
                            345 ;       (Unified)
                            346 ;
   122E                     347 TAPECMD:
   122E 8D 02 03      [ 4]  348         sta     transport_periph$ddr_reg_b              ; enable output line
   1231 A9 FA         [ 2]  349         lda     #0xFA
   1233 85 50         [ 3]  350         sta     TIMER_1MS_A
   1235                     351 $6:
   1235 20 ED 13      [ 6]  352         jsr     L13ED                               ; check for PROG button push??
   1238 A5 50         [ 3]  353         lda     TIMER_1MS_A
   123A D0 F9         [ 4]  354         bne     $6
   123C AD 02 03      [ 4]  355         lda     transport_periph$ddr_reg_b
   123F 29 60         [ 2]  356         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1241 D0 05         [ 4]  357         bne     $31                                     ; Yes, go to exit
   1243 A9 00         [ 2]  358         lda     #0x00                                   ; else unassert STOP or PLAY
   1245 8D 02 03      [ 4]  359         sta     transport_periph$ddr_reg_b              ; and then exit
   1248                     360 $31:
   1248 60            [ 6]  361         rts
                            362 ;
                            363 ;       Wait for tone during Fast Forward, signaling beginning of track
                            364 ;       (50Hz or above, for 33 zero crossing) 
                            365 ;
   1249                     366 WAITTONE:
   1249 A9 00         [ 2]  367         lda     #0x00
   124B 85 58         [ 3]  368         sta     ZEROCROSS_CTR
   124D                     369 $8:
   124D AD 02 03      [ 4]  370         lda     transport_periph$ddr_reg_b
   1250 A9 0A         [ 2]  371         lda     #0x0A
   1252 85 50         [ 3]  372         sta     TIMER_1MS_A                             ; 10 msec
   1254 E6 58         [ 5]  373         inc     ZEROCROSS_CTR
   1256 A5 58         [ 3]  374         lda     ZEROCROSS_CTR
   1258 C9 21         [ 2]  375         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   125A B0 0F         [ 4]  376         bcs     $10                                     ; timeout - exit
   125C                     377 $9:
   125C 20 ED 13      [ 6]  378         jsr     L13ED
   125F A5 50         [ 3]  379         lda     TIMER_1MS_A
   1261 F0 E6         [ 4]  380         beq     WAITTONE                                ; 10 msec done yet? then loop
   1263 AD 03 03      [ 4]  381         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1266 10 F4         [ 4]  382         bpl     $9                                      ; if not, extend the looping
   1268 4C 4D 12      [ 3]  383         jmp     $8      
                            384 
   126B                     385 $10:
   126B 60            [ 6]  386         rts
                            387 ;
                            388 ;       Wait for carrier / start of data
                            389 ;
                            390 
                            391 ; Wait for 250ms
   126C                     392 WAITCD:
   126C A9 FA         [ 2]  393         lda     #0xFA
   126E 85 50         [ 3]  394         sta     TIMER_1MS_A                             ; 250 msec
   1270                     395 $11:
   1270 20 ED 13      [ 6]  396         jsr     L13ED
   1273 A5 50         [ 3]  397         lda     TIMER_1MS_A
   1275 D0 F9         [ 4]  398         bne     $11
                            399 
                            400 ; Wait for 160ms of consecutive zero crossings
   1277                     401 $12:
   1277 20 ED 13      [ 6]  402         jsr     L13ED
   127A AD 02 03      [ 4]  403         lda     transport_periph$ddr_reg_b
   127D 6A            [ 2]  404         ror
   127E 90 F7         [ 4]  405         bcc     $12
   1280 A9 A0         [ 2]  406         lda     #0xA0                                   ; 160 msec
   1282 85 50         [ 3]  407         sta     TIMER_1MS_A
                            408 
                            409 
   1284                     410 $13:
   1284 20 ED 13      [ 6]  411         jsr     L13ED
   1287 AD 02 03      [ 4]  412         lda     transport_periph$ddr_reg_b
   128A 6A            [ 2]  413         ror
   128B 90 EA         [ 4]  414         bcc     $12
   128D A5 50         [ 3]  415         lda     TIMER_1MS_A
   128F D0 F3         [ 4]  416         bne     $13
   1291 60            [ 6]  417         rts
                            418 ;
                            419 ;       Play a track
                            420 ;
   1292                     421 PLAYTRK:
   1292 AD 00 03      [ 4]  422         lda     transport_periph$ddr_reg_a
   1295 A9 40         [ 2]  423         lda     #0x40
   1297 85 82         [ 3]  424         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1299 85 86         [ 3]  425         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   129B 85 8A         [ 3]  426         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   129D 85 8E         [ 3]  427         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   129F A9 3C         [ 2]  428         lda     #0x3C
   12A1 8D 81 03      [ 4]  429         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   12A4 A9 34         [ 2]  430         lda     #0x34
   12A6 8D 83 03      [ 4]  431         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   12A9 A9 60         [ 2]  432         lda     #0x60
   12AB 85 82         [ 3]  433         sta     board_1_periph$ddr_reg_b                ; ???
   12AD                     434 $14:
   12AD AD 02 03      [ 4]  435         lda     transport_periph$ddr_reg_b
   12B0 4A            [ 2]  436         lsr     a
   12B1 90 11         [ 4]  437         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   12B3 20 D3 12      [ 6]  438         jsr     L12D3                                   ; ??? Unknown UART routine
   12B6 20 A9 13      [ 6]  439         jsr     AGCUPD
   12B9 AD 01 03      [ 4]  440         lda     transport_control_reg_a                 ; Did we get a byte?
   12BC 10 EF         [ 4]  441         bpl     $14                                     ; No, loop
   12BE 20 F3 12      [ 6]  442         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   12C1 4C AD 12      [ 3]  443         jmp     $14
                            444 
                            445 ;       Lost carrier - wait 100 msec for more data before giving up
   12C4                     446 LOSTCD:
   12C4 A9 64         [ 2]  447         lda     #0x64                                   ; 100 msec
   12C6 85 50         [ 3]  448         sta     TIMER_1MS_A
   12C8                     449 $15:
   12C8 AD 02 03      [ 4]  450         lda     transport_periph$ddr_reg_b
   12CB 4A            [ 2]  451         lsr
   12CC B0 C4         [ 4]  452         bcs     PLAYTRK
   12CE A5 50         [ 3]  453         lda     TIMER_1MS_A
   12D0 D0 F6         [ 4]  454         bne     $15
   12D2 60            [ 6]  455         rts
                            456 ;
                            457 ;   TBD - Unknown UART routine
                            458 ;
   12D3                     459 L12D3:
   12D3 AD 02 01      [ 4]  460         lda     UART_02
   12D6 29 02         [ 2]  461         and     #0x02
   12D8 F0 18         [ 4]  462         beq     L12F2
   12DA A5 68         [ 3]  463         lda     RAM_68
   12DC D0 09         [ 4]  464         bne     L12E7
   12DE A0 00         [ 2]  465         ldy     #0x00
   12E0 B1 69         [ 6]  466         lda     [RAM_69],y
   12E2 E6 68         [ 5]  467         inc     RAM_68
   12E4 4C EF 12      [ 3]  468         jmp     L12EF
   12E7                     469 L12E7:
   12E7 A9 00         [ 2]  470         lda     #0x00
   12E9 85 68         [ 3]  471         sta     RAM_68
   12EB A0 01         [ 2]  472         ldy     #0x01
   12ED B1 69         [ 6]  473         lda     [RAM_69],y
   12EF                     474 L12EF:
   12EF 8D 01 01      [ 4]  475         sta     UART_01
   12F2                     476 L12F2:
   12F2 60            [ 6]  477         rts
                            478 ;
                            479 ; Protocol handler
                            480 ;
   12F3                     481 PROTOHAND:
   12F3 AD 00 03      [ 4]  482         lda     transport_periph$ddr_reg_a
   12F6                     483 PROCBYTE:
   12F6 29 7F         [ 2]  484         and     #0x7F                                   ; insure data is ASCII
   12F8 85 5B         [ 3]  485         sta     TAPE_BYTE                               ; store it here
   12FA 29 7E         [ 2]  486         and     #0x7E                                   ; ignore bottom bit
   12FC C9 22         [ 2]  487         cmp     #0x22                                   ; is it 0x22 or 0x23?
   12FE F0 3A         [ 4]  488         beq     PROCCHNL                                ; if so, process as channel
   1300 C9 32         [ 2]  489         cmp     #0x32                                   ; is it < 0x32 ?
   1302 90 4F         [ 4]  490         bcc     $18                                     ; ignore it
   1304 C9 3A         [ 2]  491         cmp     #0x3A                                   ; is it < 0x3A
   1306 90 32         [ 4]  492         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   1308 A5 5B         [ 3]  493         lda     TAPE_BYTE
   130A C9 41         [ 2]  494         cmp     #0x41                                   ; is it < 0x41?
   130C 90 45         [ 4]  495         bcc     $18                                     ; ignore it
   130E C9 4F         [ 2]  496         cmp     #0x4F                                   ; is it >= 0x4F?
   1310 B0 41         [ 4]  497         bcs     $18                                     ; ignore it
   1312 A6 63         [ 3]  498         ldx     CURR_PORT                               ; X = current board address
   1314 38            [ 2]  499         sec                                             ; (it's 0x41 to 0x4E)
   1315 E9 41         [ 2]  500         sbc     #0x41                                   ; subtract 0x41
   1317 C9 08         [ 2]  501         cmp     #0x08
   1319 90 02         [ 4]  502         bcc     $16                                     ; process as command
   131B E8            [ 2]  503         inx
   131C E8            [ 2]  504         inx
   131D                     505 $16:
   131D 29 07         [ 2]  506         and     #0x07                                   ; lookup bitmask in A
   131F A8            [ 2]  507         tay
   1320 B9 54 13      [ 5]  508         lda     MASKTBL,y
   1323 85 5C         [ 3]  509         sta     SOL_MASK                                ; store mask in SOL_MASK
   1325 A5 5D         [ 3]  510         lda     CURR_CHANNEL
   1327 4A            [ 2]  511         lsr     a                                       ; get on/off in carry
   1328 B0 09         [ 4]  512         bcs     $17                                     ; if on, jump
   132A A5 5C         [ 3]  513         lda     SOL_MASK
   132C 49 FF         [ 2]  514         eor     #0xFF
   132E 35 00         [ 4]  515         and     RAM_start,x
   1330 95 00         [ 4]  516         sta     RAM_start,x                             ; turn off solenoid
   1332 60            [ 6]  517         rts
                            518 ;
   1333                     519 $17:
   1333 A5 5C         [ 3]  520         lda     SOL_MASK
   1335 15 00         [ 4]  521         ora     RAM_start,x
   1337 95 00         [ 4]  522         sta     RAM_start,x                             ; turn on solenoid
   1339 60            [ 6]  523         rts
                            524 ;
   133A                     525 PROCCHNL:
   133A A5 5B         [ 3]  526         lda     TAPE_BYTE                               ; put channel byte in CURR_CHANNEL
   133C 85 5D         [ 3]  527         sta     CURR_CHANNEL
   133E 29 7E         [ 2]  528         and     #0x7E
   1340 C9 22         [ 2]  529         cmp     #0x22
   1342 D0 05         [ 4]  530         bne     CONVCHNL
   1344 A9 98         [ 2]  531         lda     #0x98                                   ; process 0x22 or 0x23
   1346 85 63         [ 3]  532         sta     CURR_PORT                               ; set this to 0x98 - board 7
   1348 60            [ 6]  533         rts
                            534 ;
   1349                     535 CONVCHNL:
   1349 38            [ 2]  536         sec                                             ; process channel
   134A E9 32         [ 2]  537         sbc     #0x32
   134C 0A            [ 2]  538         asl     a
   134D 18            [ 2]  539         clc
   134E 69 80         [ 2]  540         adc     #0x80
   1350 85 63         [ 3]  541         sta     CURR_PORT                               ; (X-0x32) * 2 + 0x80
   1352 60            [ 6]  542         rts
   1353                     543 $18:
   1353 60            [ 6]  544         rts
                            545 ;
                            546 ; bit mask table
                            547 ;
   1354                     548 MASKTBL:
   1354 01 02 04 08         549         .byte   0x01,0x02,0x04,0x08
   1358 10 20 40 80         550         .byte   0x10,0x20,0x40,0x80
                            551 ;
                            552 ; This table is referenced by UART code
   135C 4D 31               553         .byte   0x4D,0x31                               ; M1
   135E 4D 32               554         .byte   0x4D,0x32                               ; M2
                            555 ;
                            556 ;       Read the AGC mic level
                            557 ;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
                            558 ;
   1360                     559 AGCMICRD:
   1360 A9 00         [ 2]  560         lda     #0x00
   1362 85 60         [ 3]  561         sta     AGC_ACCUM                               ; init final agc value
   1364 85 61         [ 3]  562         sta     AGC_SAMPLES                             ; init agc sample counter
   1366 A9 0A         [ 2]  563         lda     #0x0A
   1368 85 54         [ 3]  564         sta     TIMER_100MS_A                           ; Start a 1 second timer
   136A A9 64         [ 2]  565         lda     #0x64
   136C 85 53         [ 3]  566         sta     TIMER_1MS_R
   136E                     567 $23:
   136E 20 ED 13      [ 6]  568         jsr     L13ED                                   ; housekeeping
   1371 A5 54         [ 3]  569         lda     TIMER_100MS_A
   1373 D0 F9         [ 4]  570         bne     $23                                     ; if 1 sec, do housekeeping
   1375 A9 0A         [ 2]  571         lda     #0x0A
   1377 85 54         [ 3]  572         sta     TIMER_100MS_A
   1379 A9 64         [ 2]  573         lda     #0x64
   137B 85 53         [ 3]  574         sta     TIMER_1MS_R                             ; reset timer
   137D A5 61         [ 3]  575         lda     AGC_SAMPLES
   137F C9 08         [ 2]  576         cmp     #0x08                                   ; 8 samples?
   1381 F0 15         [ 4]  577         beq     $27
   1383 E6 61         [ 5]  578         inc     AGC_SAMPLES                             ; increment the sample counter
   1385 A2 09         [ 2]  579         ldx     #0x09
   1387 38            [ 2]  580         sec
   1388 AD 80 03      [ 4]  581         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   138B                     582 $24:                                                    ; read the most significant high bit
   138B 2A            [ 2]  583          rol     a
   138C CA            [ 2]  584         dex
   138D 90 FC         [ 4]  585         bcc     $24
   138F 18            [ 2]  586         clc
   1390 8A            [ 2]  587         txa                                             ; 8=high bit7, 0=no high bits
   1391 65 60         [ 3]  588         adc     AGC_ACCUM                               ; add it into AGC_ACCUM (do this 8 times)
   1393 85 60         [ 3]  589         sta     AGC_ACCUM
   1395 4C 6E 13      [ 3]  590         jmp     $23
                            591 ;
   1398                     592 $27:
   1398 46 60         [ 5]  593         lsr     AGC_ACCUM                               ; divide by 8 (average of 8 samples)
   139A 46 60         [ 5]  594         lsr     AGC_ACCUM
   139C 46 60         [ 5]  595         lsr     AGC_ACCUM
   139E A5 60         [ 3]  596         lda     AGC_ACCUM
   13A0 85 5F         [ 3]  597         sta     AGC_LEVEL                               ; store agc value in AGC_LEVEL
   13A2 A9 00         [ 2]  598         lda     #0x00
   13A4 85 60         [ 3]  599         sta     AGC_ACCUM                               ; clear these 2 and return
   13A6 85 61         [ 3]  600         sta     AGC_SAMPLES
   13A8 60            [ 6]  601         rts
                            602 ;
                            603 ;        Do AGC Mic Logic
                            604 ;
   13A9                     605 AGCUPD:
   13A9 AD 80 02      [ 4]  606         lda     U19_PORTA                               ; read AGC knob
   13AC 49 FF         [ 2]  607         eor     #0xFF                                   ; invert the bits
   13AE 4A            [ 2]  608         lsr     a                                       ; get into lower nibble
   13AF 4A            [ 2]  609         lsr     a
   13B0 4A            [ 2]  610         lsr     a
   13B1 4A            [ 2]  611         lsr     a
   13B2 18            [ 2]  612         clc
   13B3 65 5F         [ 3]  613         adc     AGC_LEVEL                               ; add audio level to it
   13B5 AA            [ 2]  614         tax
   13B6 BD DC 13      [ 5]  615         lda     AGCTABLE,x                              ; and get the table value
   13B9 85 62         [ 3]  616         sta     AGC_GAIN                                ; store this value in AGC_GAIN
   13BB A5 52         [ 3]  617         lda     TIMER_1MS_C                             ; 10ms timer expired?
   13BD D0 16         [ 4]  618         bne     $26                                     ; no, just update CPU Leds
   13BF A9 0A         [ 2]  619         lda     #0x0A
   13C1 85 52         [ 3]  620         sta     TIMER_1MS_C                             ; restart 10ms timer
   13C3 A5 62         [ 3]  621         lda     AGC_GAIN                                ; every 10ms, adjust gain by 1 if needed
   13C5 CD 82 03      [ 4]  622         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   13C8 90 08         [ 4]  623         bcc     $25
   13CA F0 09         [ 4]  624         beq     $26
   13CC EE 82 03      [ 6]  625         inc     audio_periph$ddr_reg_b                  ; increase value
   13CF 4C D5 13      [ 3]  626         jmp     $26
                            627 ;
   13D2                     628 $25:
   13D2 CE 82 03      [ 6]  629         dec     audio_periph$ddr_reg_b                  ; decrease value
   13D5                     630 $26:
   13D5 AD 82 03      [ 4]  631         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   13D8 8D 82 02      [ 4]  632         sta     U19_PORTB
   13DB 60            [ 6]  633         rts
                            634 ;
                            635 ;       AGC table
                            636 ;
   13DC                     637 AGCTABLE:
   13DC 03 04 06 08         638         .db     0x03,0x04,0x06,0x08
   13E0 10 16 20 2D         639         .db     0x10,0x16,0x20,0x2D
   13E4 40 5A 80 BF         640         .db     0x40,0x5A,0x80,0xBF
   13E8 FF FF FF FF         641         .db     0xFF,0xFF,0xFF,0xFF
   13EC FF                  642         .db     0xFF
                            643 ;
                            644 ;       Process RAM_65 and RAM_66
                            645 ;
   13ED                     646 L13ED:
   13ED A5 65         [ 3]  647         lda     RAM_65
   13EF AA            [ 2]  648         tax
   13F0 A5 66         [ 3]  649         lda     RAM_66
   13F2 D0 37         [ 4]  650         bne     L142B
   13F4 BD 59 14      [ 5]  651         lda     X1459,x
   13F7 C9 FE         [ 2]  652         cmp     #0xFE
   13F9 F0 27         [ 4]  653         beq     L1422
   13FB C9 FF         [ 2]  654         cmp     #0xFF
   13FD D0 0B         [ 4]  655         bne     L140A
   13FF A9 00         [ 2]  656         lda     #0x00
   1401 85 65         [ 3]  657         sta     RAM_65
   1403 A9 FA         [ 2]  658         lda     #0xFA
   1405 85 64         [ 3]  659         sta     TIMER_100MS_C
   1407 4C 21 14      [ 3]  660         jmp     L1421
                            661 
                            662 
   140A                     663 L140A:
   140A C5 64         [ 3]  664         cmp     TIMER_100MS_C
   140C D0 13         [ 4]  665         bne     L1421
   140E BD 5A 14      [ 5]  666         lda     X1459+1,x
   1411 20 F6 12      [ 6]  667         jsr     PROCBYTE
   1414 BD 5B 14      [ 5]  668         lda     X1459+2,x
   1417 20 F6 12      [ 6]  669         jsr     PROCBYTE
   141A A5 65         [ 3]  670         lda     RAM_65
   141C 18            [ 2]  671         clc
   141D 69 03         [ 2]  672         adc     #0x03
   141F 85 65         [ 3]  673         sta     RAM_65
                            674 
                            675 
   1421                     676 L1421:
   1421 60            [ 6]  677         rts
                            678 
                            679 
   1422                     680 L1422:
   1422 E6 66         [ 5]  681         inc     RAM_66
   1424 A9 00         [ 2]  682         lda     #0x00
   1426 85 65         [ 3]  683         sta     RAM_65
   1428 4C 21 14      [ 3]  684         jmp     L1421
                            685 
                            686 
   142B                     687 L142B:
   142B BD 43 15      [ 5]  688         lda     X1543,x
   142E C9 FF         [ 2]  689         cmp     #0xFF
   1430 D0 0D         [ 4]  690         bne     L143F
   1432 A9 00         [ 2]  691         lda     #0x00
   1434 85 65         [ 3]  692         sta     RAM_65
   1436 85 66         [ 3]  693         sta     RAM_66
   1438 A9 FA         [ 2]  694         lda     #0xFA
   143A 85 64         [ 3]  695         sta     TIMER_100MS_C
   143C 4C 21 14      [ 3]  696         jmp     L1421
                            697 
                            698 
   143F                     699 L143F:
   143F C5 64         [ 3]  700         cmp     TIMER_100MS_C
   1441 D0 DE         [ 4]  701         bne     L1421
   1443 BD 44 15      [ 5]  702         lda     X1543+1,x
   1446 20 F6 12      [ 6]  703         jsr     PROCBYTE
   1449 BD 45 15      [ 5]  704         lda     X1543+2,x
   144C 20 F6 12      [ 6]  705         jsr     PROCBYTE
   144F A5 65         [ 3]  706         lda     RAM_65
   1451 18            [ 2]  707         clc
   1452 69 03         [ 2]  708         adc     #0x03
   1454 85 65         [ 3]  709         sta     RAM_65
   1456 4C 21 14      [ 3]  710         jmp     L1421
                            711 
                            712 
   1459                     713 X1459:
   1459 F5 35 49 F5 35 4A   714         .byte   0xF5,0x35,0x49, 0xF5,0x35,0x4A, 0xEE,0x35,0x46, 0xEB,0x33,0x46 
        EE 35 46 EB 33 46
   1465 E9 32 46 E9 33 42   715         .byte   0xE9,0x32,0x46, 0xE9,0x33,0x42, 0xE8,0x33,0x46, 0xE7,0x32,0x46
        E8 33 46 E7 32 46
   1471 E6 33 46 E5 32 46   716         .byte   0xE6,0x33,0x46, 0xE5,0x32,0x46, 0xE4,0x33,0x46, 0xE3,0x32,0x46
        E4 33 46 E3 32 46
   147D E2 33 46 E1 32 46   717         .byte   0xE2,0x33,0x46, 0xE1,0x32,0x46, 0xE0,0x33,0x46, 0xDF,0x32,0x46
        E0 33 46 DF 32 46
   1489 DE 33 46 DD 32 46   718         .byte   0xDE,0x33,0x46, 0xDD,0x32,0x46, 0xDD,0x34,0x46, 0xDC,0x33,0x46
        DD 34 46 DC 33 46
   1495 DB 32 46 DB 35 46   719         .byte   0xDB,0x32,0x46, 0xDB,0x35,0x46, 0xDA,0x33,0x46, 0xD9,0x32,0x46
        DA 33 46 D9 32 46
   14A1 D1 32 42 C6 33 47   720         .byte   0xD1,0x32,0x42, 0xC6,0x33,0x47, 0xC6,0x33,0x43, 0xC5,0x32,0x47
        C6 33 43 C5 32 47
   14AD C3 34 46 C2 33 47   721         .byte   0xC3,0x34,0x46, 0xC2,0x33,0x47, 0xC1,0x32,0x47, 0xC0,0x35,0x46
        C1 32 47 C0 35 46
   14B9 B9 34 46 B9 32 43   722         .byte   0xB9,0x34,0x46, 0xB9,0x32,0x43, 0xB7,0x35,0x46, 0xB7,0x33,0x42
        B7 35 46 B7 33 42
   14C5 B3 33 46 B2 32 46   723         .byte   0xB3,0x33,0x46, 0xB2,0x32,0x46, 0xA8,0x32,0x42, 0x9D,0x33,0x47
        A8 32 42 9D 33 47
   14D1 9C 32 47 9B 33 47   724         .byte   0x9C,0x32,0x47, 0x9B,0x33,0x47, 0x9A,0x32,0x47, 0x9A,0x34,0x46
        9A 32 47 9A 34 46
   14DD 99 33 47 99 33 43   725         .byte   0x99,0x33,0x47, 0x99,0x33,0x43, 0x99,0x35,0x46, 0x98,0x32,0x47
        99 35 46 98 32 47
   14E9 97 33 47 94 32 47   726         .byte   0x97,0x33,0x47, 0x94,0x32,0x47, 0x93,0x33,0x47, 0x92,0x32,0x47
        93 33 47 92 32 47
   14F5 91 33 47 90 32 47   727         .byte   0x91,0x33,0x47, 0x90,0x32,0x47, 0x87,0x33,0x42, 0x86,0x32,0x43
        87 33 42 86 32 43
   1501 7D 33 46 7C 32 46   728         .byte   0x7D,0x33,0x46, 0x7C,0x32,0x46, 0x77,0x32,0x42, 0x77,0x34,0x46
        77 32 42 77 34 46
   150D 75 32 43 75 35 46   729         .byte   0x75,0x32,0x43, 0x75,0x35,0x46, 0x6A,0x33,0x46, 0x69,0x32,0x46
        6A 33 46 69 32 46
   1519 67 33 46 66 32 46   730         .byte   0x67,0x33,0x46, 0x66,0x32,0x46, 0x66,0x32,0x43, 0x65,0x34,0x46
        66 32 43 65 34 46
   1525 62 35 46 62 33 42   731         .byte   0x62,0x35,0x46, 0x62,0x33,0x42, 0x56,0x33,0x46, 0x55,0x32,0x46
        56 33 46 55 32 46
   1531 55 32 42 54 33 46   732         .byte   0x55,0x32,0x42, 0x54,0x33,0x46, 0x53,0x32,0x46, 0x52,0x33,0x46
        53 32 46 52 33 46
   153D 51 32 46 FE FE FE   733         .byte   0x51,0x32,0x46, 0xFE,0xFE,0xFE
                            734 
   1543                     735 X1543:
   1543 50 33 46 4F 32 46   736         .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        4E 33 46 4E 33 42
   154F 4D 32 46 4C 33 46   737         .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        4B 32 46 40 34 46
   155B 3E 35 46 3C 33 47   738         .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        3B 32 47 3A 33 47
   1567 39 32 47 32 32 42   739         .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        29 34 46 28 32 47
   1573 27 35 46 26 33 43   740         .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        23 33 47 22 32 47
   157F 1E 33 42 1D 32 43   741         .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        1B 33 47 1A 32 47
   158B 19 33 47 18 32 47   742         .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        17 34 46 17 33 47
   1597 17 32 42 16 32 47   743         .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        15 35 46 15 33 43
   15A3 08 32 43 03 33 46   744         .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        02 32 46 02 34 46
   15AF FF FF FF FF FF FF   745         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
                            746 
   1FFA                     747         .org    0x1FFA
                            748         ;
                            749         ; vectors
                            750         ;
   1FFA                     751 NMIVEC:
   1FFA FF FF               752         .dw     0xFFFF
   1FFC                     753 RESETVEC:
   1FFC 48 10               754         .dw     RESET
   1FFE                     755 IRQVEC:
   1FFE 00 10               756         .dw     IRQ
