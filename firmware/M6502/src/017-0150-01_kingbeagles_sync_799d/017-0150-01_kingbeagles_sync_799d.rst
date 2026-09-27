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
                     0065    29 KTABLE_OFFS     = 0x0065    ; offset into King table
                     0066    30 KTABLE_SEL      = 0x0066    ; select King table
                     0067    31 UART_RBYTE      = 0x0067    ; UART routine recv byte (0 or 1)
                     0068    32 UART_SBYTE      = 0x0068    ; UART routine send byte (0 or 1)
                     0069    33 UART_ADDR       = 0x0069    ; Address of UART send table (2 bytes)
                             34 ;
                             35 ;       IRQ handler
                             36 ;
   1000                      37 IRQ:
   1000 48            [ 3]   38         pha
   1001 AD 05 02      [ 4]   39         lda     U18_edge_detect_control_DI_pos          ; clear PA7 flag
   1004 AD 85 02      [ 4]   40         lda     U19_edge_detect_control_DI_pos          ; clear PA7 flag
   1007 A9 7D         [ 2]   41         lda     #0x7D                                   ; expire every 125*8=1000us=1ms
   1009 8D 1D 02      [ 4]   42         sta     U18_1D                                  ; div by 8, enable interrupt
   100C A5 50         [ 3]   43         lda     TIMER_1MS_A                             ; 1ms timer
   100E F0 02         [ 4]   44         beq     L1012
   1010 C6 50         [ 5]   45         dec     TIMER_1MS_A
   1012                      46 L1012:
   1012 A5 51         [ 3]   47         lda     TIMER_1MS_B                             ; 1ms timer
   1014 F0 02         [ 4]   48         beq     L1018
   1016 C6 51         [ 5]   49         dec     TIMER_1MS_B
   1018                      50 L1018:
   1018 A5 52         [ 3]   51         lda     TIMER_1MS_C                             ; 1ms timer
   101A F0 02         [ 4]   52         beq     L101E
   101C C6 52         [ 5]   53         dec     TIMER_1MS_C
   101E                      54 L101E:
   101E C6 53         [ 5]   55         dec     TIMER_1MS_R
   1020 D0 24         [ 4]   56         bne     L1046
   1022 A9 64         [ 2]   57         lda     #0x64
   1024 85 53         [ 3]   58         sta     TIMER_1MS_R
   1026 A5 54         [ 3]   59         lda     TIMER_100MS_A
   1028 F0 02         [ 4]   60         beq     L102C
   102A C6 54         [ 5]   61         dec     TIMER_100MS_A
   102C                      62 L102C:
   102C A5 64         [ 3]   63         lda     TIMER_100MS_C
   102E F0 02         [ 4]   64         beq     L1032
   1030 C6 64         [ 5]   65         dec     TIMER_100MS_C
   1032                      66 L1032:
   1032 A5 55         [ 3]   67         lda     TIMER_100MS_B
   1034 F0 02         [ 4]   68         beq     L1038
   1036 C6 55         [ 5]   69         dec     TIMER_100MS_B
   1038                      70 L1038:
   1038 C6 56         [ 5]   71         dec     TIMER_100MS_R
   103A D0 0A         [ 4]   72         bne     L1046
   103C A9 64         [ 2]   73         lda     #0x64
   103E 85 56         [ 3]   74         sta     TIMER_100MS_R
   1040 A5 57         [ 3]   75         lda     TIMER_10S
   1042 F0 02         [ 4]   76         beq     L1046
   1044 C6 57         [ 5]   77         dec     TIMER_10S
   1046                      78 L1046:
   1046 68            [ 4]   79         pla
   1047 40            [ 6]   80         rti
                             81 ;
                             82 ;       Main Program Start
                             83 ;
   1048                      84 RESET:
   1048 D8            [ 2]   85         cld                                             ; No decimal mode
   1049 78            [ 2]   86         sei                                             ; Interrupts are not used
   104A A2 F0         [ 2]   87         ldx     #0xF0                                   ; Stack is at 0x01F0
   104C 9A            [ 2]   88         txs
   104D A9 00         [ 2]   89         lda     #0x00                                   ; Clear RAM
   104F A2 10         [ 2]   90         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1051                      91 ZERORAM:
   1051 95 00         [ 4]   92         sta     RAM_start,x
   1053 E8            [ 2]   93         inx
   1054 E0 80         [ 2]   94         cpx     #0x80
   1056 D0 F9         [ 4]   95         bne     ZERORAM
   1058 A9 00         [ 2]   96         lda     #0x00
   105A 8D 01 03      [ 4]   97         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   105D 8D 00 03      [ 4]   98         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1060 8D 81 03      [ 4]   99         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1063 8D 80 03      [ 4]  100         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1066 8D 83 03      [ 4]  101         sta     audio_control_reg_b                     ; Clear audio control B
   1069 8D 05 02      [ 4]  102         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   106C 8D 03 03      [ 4]  103         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   106F 8D 06 02      [ 4]  104         sta     U18_06                                  ; Enable PROG falling edge irq
   1072 8D 86 02      [ 4]  105         sta     U19_06                                  ; Enable AGC8 falling edge irq
   1075 8D 01 02      [ 4]  106         sta     U18_DDRA                                ; Buttons are inputs
   1078 A9 02         [ 2]  107         lda     #0x02
   107A 8D 81 02      [ 4]  108         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   107D A9 FF         [ 2]  109         lda     #0xFF
   107F 8D 82 03      [ 4]  110         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1082 8D 03 02      [ 4]  111         sta     U18_DDRB                                ; Button lights are outputs
   1085 8D 83 02      [ 4]  112         sta     U19_DDRB                                ; CPU card lights are outputs
   1088 A9 FC         [ 2]  113         lda     #0xFC
   108A 8D 02 03      [ 4]  114         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   108D A9 2E         [ 2]  115         lda     #0x2E
   108F 8D 01 03      [ 4]  116         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1092 8D 03 03      [ 4]  117         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1095 A9 3C         [ 2]  118         lda     #0x3C
   1097 8D 81 03      [ 4]  119         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   109A 8D 83 03      [ 4]  120         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   109D 58            [ 2]  121         cli
   109E 8D 1C 02      [ 4]  122         sta     U18_1C
   10A1 A9 64         [ 2]  123         lda     #0x64
   10A3 85 53         [ 3]  124         sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
   10A5 A9 18         [ 2]  125         lda     #0x18
   10A7 85 57         [ 3]  126         sta     TIMER_10S                               ; Init a 4 minute timer
   10A9 A9 64         [ 2]  127         lda     #0x64
   10AB 85 56         [ 3]  128         sta     TIMER_100MS_R                           ; 100 - init 0.1 sec master counter
   10AD A9 0A         [ 2]  129         lda     #0x0A                                   ; 10
   10AF 85 62         [ 3]  130         sta     AGC_GAIN                                ; Set initial AGC gain value
   10B1 A9 03         [ 2]  131         lda     #0x03
   10B3 8D 02 01      [ 4]  132         sta     UART_02                                 ; ???
   10B6 EA            [ 2]  133         nop                                             ; ???
   10B7 A9 09         [ 2]  134         lda     #0x09
   10B9 8D 02 01      [ 4]  135         sta     UART_02                                 ; ???
   10BC A9 10         [ 2]  136         lda     #TAPEMODE_STOP
   10BE 20 34 12      [ 6]  137         jsr     TAPECMD                                 ; STOP tape
   10C1 A9 28         [ 2]  138         lda     #0x28                                   ; this will count 4 seconds
   10C3 85 54         [ 3]  139         sta     TIMER_100MS_A
   10C5 A9 64         [ 2]  140         lda     #0x64                                   ; reset master timer
   10C7 85 53         [ 3]  141         sta     TIMER_1MS_R
   10C9                     142 $1:
   10C9 A5 54         [ 3]  143         lda     TIMER_100MS_A                           ; do not much for 4 seconds
   10CB D0 FC         [ 4]  144         bne     $1
   10CD 20 01 12      [ 6]  145         jsr     INITBRDS
   10D0                     146 REWIND:
   10D0 A9 FA         [ 2]  147         lda     #0xFA
   10D2 85 64         [ 3]  148         sta     TIMER_100MS_C
   10D4 A9 00         [ 2]  149         lda     #0x00
   10D6 85 65         [ 3]  150         sta     KTABLE_OFFS
   10D8 85 66         [ 3]  151         sta     KTABLE_SEL
   10DA A9 30         [ 2]  152         lda     #0x30
   10DC A9 40         [ 2]  153         lda     #TAPEMODE_REWIND
   10DE 20 34 12      [ 6]  154         jsr     TAPECMD                                 ; REWIND tape
   10E1                     155 $22:
   10E1 A9 00         [ 2]  156         lda     #0x00
   10E3 85 58         [ 3]  157         sta     ZEROCROSS_CTR                           ; counter to zero
   10E5                     158 $3:
   10E5 AD 02 03      [ 4]  159         lda     transport_periph$ddr_reg_b
   10E8 A9 0A         [ 2]  160         lda     #0x0A
   10EA 85 50         [ 3]  161         sta     TIMER_1MS_A                             ; set a 10ms timer
   10EC E6 58         [ 5]  162         inc     ZEROCROSS_CTR                           ; count transitions
   10EE A5 58         [ 3]  163         lda     ZEROCROSS_CTR
   10F0 C9 64         [ 2]  164         cmp     #0x64
   10F2 B0 0F         [ 4]  165         bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
   10F4                     166 $4:
   10F4 20 F3 13      [ 6]  167         jsr     KUPDATE
   10F7 A5 50         [ 3]  168         lda     TIMER_1MS_A
   10F9 F0 E6         [ 4]  169         beq     $22
   10FB AD 03 03      [ 4]  170         lda     transport_control_reg_b
   10FE 10 F4         [ 4]  171         bpl     $4
   1100 4C E5 10      [ 3]  172         jmp     $3
                            173 ;
   1103                     174 FINDTRK:
   1103 A9 20         [ 2]  175         lda     #TAPEMODE_FFWD
   1105 20 34 12      [ 6]  176         jsr     TAPECMD                                 ; FFWD tape
   1108 A9 19         [ 2]  177         lda     #0x19
   110A 85 54         [ 3]  178         sta     TIMER_100MS_A                           ; 2.5 secs
   110C A9 64         [ 2]  179         lda     #0x64
   110E 85 53         [ 3]  180         sta     TIMER_1MS_R
   1110                     181 $5:
   1110 20 F3 13      [ 6]  182         jsr     KUPDATE
   1113 A5 54         [ 3]  183         lda     TIMER_100MS_A
   1115 D0 F9         [ 4]  184         bne     $5
   1117 A9 00         [ 2]  185         lda     #0x00
   1119 85 59         [ 3]  186         sta     TRACK_CTR
   111B 20 4F 12      [ 6]  187         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   111E A9 40         [ 2]  188         lda     #TAPEMODE_REWIND
   1120 20 34 12      [ 6]  189         jsr     TAPECMD                                 ; REWIND tape
   1123 20 4F 12      [ 6]  190         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1126 A9 FA         [ 2]  191         lda     #0xFA
   1128 85 50         [ 3]  192         sta     TIMER_1MS_A
   112A                     193 $30:
   112A 20 F3 13      [ 6]  194         jsr     KUPDATE
   112D A5 50         [ 3]  195         lda     TIMER_1MS_A
   112F D0 F9         [ 4]  196         bne     $30                                     ; delay for 250 ms
   1131 A9 20         [ 2]  197         lda     #TAPEMODE_FFWD
   1133 20 34 12      [ 6]  198         jsr     TAPECMD
   1136 20 4F 12      [ 6]  199         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1139 E6 59         [ 5]  200         inc     TRACK_CTR
   113B A9 10         [ 2]  201         lda     #TAPEMODE_STOP
   113D 20 34 12      [ 6]  202         jsr     TAPECMD                                 ; STOP tape
   1140 A9 80         [ 2]  203         lda     #TAPEMODE_PLAY
   1142 20 34 12      [ 6]  204         jsr     TAPECMD                                 ; PLAY tape
   1145 20 72 12      [ 6]  205         jsr     WAITCD                                  ; wait for carrier
   1148 A9 10         [ 2]  206         lda     #TAPEMODE_STOP
   114A 20 34 12      [ 6]  207         jsr     TAPECMD                                 ; STOP Tape
                            208 
                            209 
   114D                     210 L114D:
   114D A9 64         [ 2]  211         lda     #<UTABLE_M2
   114F 85 69         [ 3]  212         sta     UART_ADDR
   1151 A9 13         [ 2]  213         lda     #>UTABLE_M2
   1153 85 6A         [ 3]  214         sta     UART_ADDR+1                             ; set UTABLE address
   1155 20 AF 13      [ 6]  215         jsr     AGCUPD
   1158 20 F3 13      [ 6]  216         jsr     KUPDATE
   115B 20 D9 12      [ 6]  217         jsr     UARTPROC
   115E AD 02 01      [ 4]  218         lda     UART_02
   1161 29 05         [ 2]  219         and     #0x05
   1163 F0 23         [ 4]  220         beq     L1188
   1165 A5 67         [ 3]  221         lda     UART_RBYTE
   1167 D0 0C         [ 4]  222         bne     L1175
   1169 AD 01 01      [ 4]  223         lda     UART_01
   116C C9 53         [ 2]  224         cmp     #'S                                     ; 'S' - start command?
   116E D0 18         [ 4]  225         bne     L1188
   1170 E6 67         [ 5]  226         inc     UART_RBYTE
   1172 4C 88 11      [ 3]  227         jmp     L1188
   1175                     228 L1175:
   1175 A9 00         [ 2]  229         lda     #0x00
   1177 85 67         [ 3]  230         sta     UART_RBYTE
   1179 AD 01 01      [ 4]  231         lda     UART_01
   117C C9 31         [ 2]  232         cmp     #'1                                     ; '1' - 2nd byte startplay command?
   117E F0 36         [ 4]  233         beq     STARTPLAY
   1180 C9 32         [ 2]  234         cmp     #'2                                     ; '2' - 2nd byte lights command?
   1182 F0 0A         [ 4]  235         beq     L118E
   1184 C9 33         [ 2]  236         cmp     #'3                                     ; '3' - 2nd byte lights command?
   1186 F0 1B         [ 4]  237         beq     L11A3
   1188                     238 L1188:
   1188 4C 4D 11      [ 3]  239         jmp     L114D
   118B 4C D0 10      [ 3]  240         jmp     REWIND
                            241 ; lights to all ones
   118E                     242 L118E:
   118E A9 FF         [ 2]  243         lda     #0xFF
   1190 85 98         [ 3]  244         sta     board_7_periph$ddr_reg_a
   1192 85 9A         [ 3]  245         sta     board_7_periph$ddr_reg_b
   1194 85 9C         [ 3]  246         sta     board_8_periph$ddr_reg_a
   1196 85 9E         [ 3]  247         sta     board_8_periph$ddr_reg_b
   1198 8D 02 02      [ 4]  248         sta     U18_PORTB
   119B A9 02         [ 2]  249         lda     #0x02
   119D 8D 80 02      [ 4]  250         sta     U19_PORTA
   11A0 4C 4D 11      [ 3]  251         jmp     L114D
                            252 ; lights to all zeros
   11A3                     253 L11A3:
   11A3 A9 00         [ 2]  254         lda     #0x00
   11A5 85 98         [ 3]  255         sta     board_7_periph$ddr_reg_a
   11A7 85 9A         [ 3]  256         sta     board_7_periph$ddr_reg_b
   11A9 85 9C         [ 3]  257         sta     board_8_periph$ddr_reg_a
   11AB 85 9E         [ 3]  258         sta     board_8_periph$ddr_reg_b
   11AD 8D 02 02      [ 4]  259         sta     U18_PORTB
   11B0 8D 80 02      [ 4]  260         sta     U19_PORTA
   11B3 4C 4D 11      [ 3]  261         jmp     L114D
                            262 
                            263 ;   we have been started!
   11B6                     264 STARTPLAY:
   11B6 20 01 12      [ 6]  265         jsr     INITBRDS
   11B9 A9 62         [ 2]  266         lda     #<UTABLE_M1
   11BB 85 69         [ 3]  267         sta     UART_ADDR
   11BD A9 13         [ 2]  268         lda     #>UTABLE_M1
   11BF 85 6A         [ 3]  269         sta     UART_ADDR+1                             ; set UTABLE address
   11C1 A9 00         [ 2]  270         lda     #0x00
   11C3 8D 80 02      [ 4]  271         sta     U19_PORTA                               ; turn off RESET button light
   11C6 A9 A0         [ 2]  272         lda     #0xA0
   11C8 8D 02 02      [ 4]  273         sta     U18_PORTB                               ; turn off some lights - TBD
   11CB A9 80         [ 2]  274         lda     #TAPEMODE_PLAY
   11CD 20 34 12      [ 6]  275         jsr     TAPECMD                                 ; PLAY tape
   11D0 20 72 12      [ 6]  276         jsr     WAITCD                                  ; wait for carrier
   11D3 20 98 12      [ 6]  277         jsr     PLAYTRK                                 ; play a track!
   11D6 20 01 12      [ 6]  278         jsr     INITBRDS                                ; init the boards
   11D9 A9 80         [ 2]  279         lda     #0x80
   11DB 8D 02 02      [ 4]  280         sta     U18_PORTB                               ; turn off all but PROG light
   11DE E6 59         [ 5]  281         inc     TRACK_CTR                               ; track counter
   11E0 A5 59         [ 3]  282         lda     TRACK_CTR
   11E2 C9 1A         [ 2]  283         cmp     #0x1A                                   ; 26?
   11E4 90 03         [ 4]  284         bcc     NEXTTRK
   11E6 4C D0 10      [ 3]  285         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
   11E9                     286 NEXTTRK:
   11E9 A9 00         [ 2]  287         lda     #0x00
   11EB 85 65         [ 3]  288         sta     KTABLE_OFFS
   11ED 85 66         [ 3]  289         sta     KTABLE_SEL
   11EF A9 FA         [ 2]  290         lda     #0xFA
   11F1 85 64         [ 3]  291         sta     TIMER_100MS_C
   11F3 20 72 12      [ 6]  292         jsr     WAITCD                                  ; wait for carrier
   11F6 A9 10         [ 2]  293         lda     #TAPEMODE_STOP
   11F8 20 34 12      [ 6]  294         jsr     TAPECMD                                 ; STOP tape
   11FB 20 66 13      [ 6]  295         jsr     AGCMICRD                                ; Read the AGC mic level
   11FE 4C 4D 11      [ 3]  296         jmp     L114D
                            297 ;
                            298 ;       Init boards
                            299 ;
   1201                     300 INITBRDS:
   1201 A9 3C         [ 2]  301         lda     #0x3C
   1203 8D 83 03      [ 4]  302         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1206 A9 34         [ 2]  303         lda     #0x34
   1208 8D 81 03      [ 4]  304         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   120B A2 00         [ 2]  305         ldx     #0x00
   120D                     306 NEXTBRD:
   120D A9 30         [ 2]  307         lda     #0x30
   120F 95 81         [ 4]  308         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1211 95 83         [ 4]  309         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1213 A9 FF         [ 2]  310         lda     #0xFF
   1215 95 80         [ 4]  311         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1217 95 82         [ 4]  312         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1219 A9 34         [ 2]  313         lda     #0x34
   121B 95 81         [ 4]  314         sta     board_1_control_reg_a,x                 ; A peripheral selected
   121D 95 83         [ 4]  315         sta     board_1_control_reg_b,x                 ; B peripheral selected
   121F A9 00         [ 2]  316         lda     #0x00
   1221 95 80         [ 4]  317         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1223 95 82         [ 4]  318         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1225 E8            [ 2]  319         inx
   1226 E8            [ 2]  320         inx
   1227 E8            [ 2]  321         inx
   1228 E8            [ 2]  322         inx
   1229 E0 20         [ 2]  323         cpx     #0x20                                   ; do for boards 1-8
   122B 90 E0         [ 4]  324         bcc     NEXTBRD
   122D A9 00         [ 2]  325         lda     #0x00                                   ; bug fix!
   122F 85 5D         [ 3]  326         sta     CURR_CHANNEL                            ; reset current channel serial byte
   1231 85 63         [ 3]  327         sta     CURR_PORT                               ; reset current channel port address
   1233 60            [ 6]  328         rts
                            329 ;
                            330 ;       Send Transport command for 0.250 sec
                            331 ;       (Unified)
                            332 ;
   1234                     333 TAPECMD:
   1234 8D 02 03      [ 4]  334         sta     transport_periph$ddr_reg_b              ; enable output line
   1237 A9 FA         [ 2]  335         lda     #0xFA
   1239 85 50         [ 3]  336         sta     TIMER_1MS_A
   123B                     337 $6:
   123B 20 F3 13      [ 6]  338         jsr     KUPDATE                                 ; housekeeping
   123E A5 50         [ 3]  339         lda     TIMER_1MS_A
   1240 D0 F9         [ 4]  340         bne     $6
   1242 AD 02 03      [ 4]  341         lda     transport_periph$ddr_reg_b
   1245 29 60         [ 2]  342         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1247 D0 05         [ 4]  343         bne     $31                                     ; Yes, go to exit
   1249 A9 00         [ 2]  344         lda     #0x00                                   ; else unassert STOP or PLAY
   124B 8D 02 03      [ 4]  345         sta     transport_periph$ddr_reg_b              ; and then exit
   124E                     346 $31:
   124E 60            [ 6]  347         rts
                            348 ;
                            349 ;       Wait for tone during Fast Forward, signaling beginning of track
                            350 ;       (50Hz or above, for 33 zero crossing) 
                            351 ;
   124F                     352 WAITTONE:
   124F A9 00         [ 2]  353         lda     #0x00
   1251 85 58         [ 3]  354         sta     ZEROCROSS_CTR
   1253                     355 $8:
   1253 AD 02 03      [ 4]  356         lda     transport_periph$ddr_reg_b
   1256 A9 0A         [ 2]  357         lda     #0x0A
   1258 85 50         [ 3]  358         sta     TIMER_1MS_A                             ; 10 msec
   125A E6 58         [ 5]  359         inc     ZEROCROSS_CTR
   125C A5 58         [ 3]  360         lda     ZEROCROSS_CTR
   125E C9 21         [ 2]  361         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   1260 B0 0F         [ 4]  362         bcs     $10                                     ; timeout - exit
   1262                     363 $9:
   1262 20 F3 13      [ 6]  364         jsr     KUPDATE
   1265 A5 50         [ 3]  365         lda     TIMER_1MS_A
   1267 F0 E6         [ 4]  366         beq     WAITTONE                                ; 10 msec done yet? then loop
   1269 AD 03 03      [ 4]  367         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   126C 10 F4         [ 4]  368         bpl     $9                                      ; if not, extend the looping
   126E 4C 53 12      [ 3]  369         jmp     $8                                      ; else loop but keep timeout going
                            370 
   1271                     371 $10:
   1271 60            [ 6]  372         rts
                            373 ;
                            374 ;       Wait for carrier / start of data
                            375 ;
                            376 
                            377 ; Wait for 250ms
   1272                     378 WAITCD:
   1272 A9 FA         [ 2]  379         lda     #0xFA
   1274 85 50         [ 3]  380         sta     TIMER_1MS_A                             ; 250 msec
   1276                     381 $11:
   1276 20 F3 13      [ 6]  382         jsr     KUPDATE
   1279 A5 50         [ 3]  383         lda     TIMER_1MS_A
   127B D0 F9         [ 4]  384         bne     $11
                            385 
                            386 ; Wait for 160ms of consecutive zero crossings
   127D                     387 $12:
   127D 20 F3 13      [ 6]  388         jsr     KUPDATE
   1280 AD 02 03      [ 4]  389         lda     transport_periph$ddr_reg_b
   1283 6A            [ 2]  390         ror
   1284 90 F7         [ 4]  391         bcc     $12
   1286 A9 A0         [ 2]  392         lda     #0xA0                                   ; 160 msec
   1288 85 50         [ 3]  393         sta     TIMER_1MS_A
   128A                     394 $13:
   128A 20 F3 13      [ 6]  395         jsr     KUPDATE
   128D AD 02 03      [ 4]  396         lda     transport_periph$ddr_reg_b
   1290 6A            [ 2]  397         ror
   1291 90 EA         [ 4]  398         bcc     $12
   1293 A5 50         [ 3]  399         lda     TIMER_1MS_A
   1295 D0 F3         [ 4]  400         bne     $13
   1297 60            [ 6]  401         rts
                            402 ;
                            403 ;       Play a track
                            404 ;
   1298                     405 PLAYTRK:
   1298 AD 00 03      [ 4]  406         lda     transport_periph$ddr_reg_a
   129B A9 40         [ 2]  407         lda     #0x40
   129D 85 82         [ 3]  408         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   129F 85 86         [ 3]  409         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   12A1 85 8A         [ 3]  410         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   12A3 85 8E         [ 3]  411         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   12A5 A9 3C         [ 2]  412         lda     #0x3C
   12A7 8D 81 03      [ 4]  413         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   12AA A9 34         [ 2]  414         lda     #0x34
   12AC 8D 83 03      [ 4]  415         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   12AF A9 60         [ 2]  416         lda     #0x60
   12B1 85 82         [ 3]  417         sta     board_1_periph$ddr_reg_b                ; ???
   12B3                     418 $14:
   12B3 AD 02 03      [ 4]  419         lda     transport_periph$ddr_reg_b
   12B6 4A            [ 2]  420         lsr     a
   12B7 90 11         [ 4]  421         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   12B9 20 D9 12      [ 6]  422         jsr     UARTPROC                                ; ??? Unknown UART routine
   12BC 20 AF 13      [ 6]  423         jsr     AGCUPD
   12BF AD 01 03      [ 4]  424         lda     transport_control_reg_a                 ; Did we get a byte?
   12C2 10 EF         [ 4]  425         bpl     $14                                     ; No, loop
   12C4 20 F9 12      [ 6]  426         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   12C7 4C B3 12      [ 3]  427         jmp     $14
                            428 
                            429 ;       Lost carrier - wait 100 msec for more data before giving up
   12CA                     430 LOSTCD:
   12CA A9 64         [ 2]  431         lda     #0x64                                   ; 100 msec
   12CC 85 50         [ 3]  432         sta     TIMER_1MS_A
   12CE                     433 $15:
   12CE AD 02 03      [ 4]  434         lda     transport_periph$ddr_reg_b
   12D1 4A            [ 2]  435         lsr
   12D2 B0 C4         [ 4]  436         bcs     PLAYTRK                                 ; carrier
   12D4 A5 50         [ 3]  437         lda     TIMER_1MS_A
   12D6 D0 F6         [ 4]  438         bne     $15
   12D8 60            [ 6]  439         rts
                            440 ;
                            441 ;   TBD - Unknown UART routine
                            442 ;   Send first or second byte from the UART table to UART_01
                            443 ;
   12D9                     444 UARTPROC:
   12D9 AD 02 01      [ 4]  445         lda     UART_02                                 ; check UART_02.bit2 == 0
   12DC 29 02         [ 2]  446         and     #0x02                                   
   12DE F0 18         [ 4]  447         beq     $42                                     ; if so, return
   12E0 A5 68         [ 3]  448         lda     UART_SBYTE                              ; else, check byte number
   12E2 D0 09         [ 4]  449         bne     $40
   12E4 A0 00         [ 2]  450         ldy     #0x00
   12E6 B1 69         [ 6]  451         lda     [UART_ADDR],y                           ; send first byte
   12E8 E6 68         [ 5]  452         inc     UART_SBYTE
   12EA 4C F5 12      [ 3]  453         jmp     $41
   12ED                     454 $40:
   12ED A9 00         [ 2]  455         lda     #0x00
   12EF 85 68         [ 3]  456         sta     UART_SBYTE
   12F1 A0 01         [ 2]  457         ldy     #0x01
   12F3 B1 69         [ 6]  458         lda     [UART_ADDR],y                           ; send second byte
   12F5                     459 $41:
   12F5 8D 01 01      [ 4]  460         sta     UART_01
   12F8                     461 $42:
   12F8 60            [ 6]  462         rts
                            463 ;
                            464 ; Protocol handler
                            465 ;
   12F9                     466 PROTOHAND:
   12F9 AD 00 03      [ 4]  467         lda     transport_periph$ddr_reg_a
   12FC                     468 PROCBYTE:
   12FC 29 7F         [ 2]  469         and     #0x7F                                   ; insure data is ASCII
   12FE 85 5B         [ 3]  470         sta     TAPE_BYTE                               ; store it here
   1300 29 7E         [ 2]  471         and     #0x7E                                   ; ignore bottom bit
   1302 C9 22         [ 2]  472         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1304 F0 3A         [ 4]  473         beq     PROCCHNL                                ; if so, process as channel
   1306 C9 32         [ 2]  474         cmp     #0x32                                   ; is it < 0x32 ?
   1308 90 4F         [ 4]  475         bcc     $18                                     ; ignore it
   130A C9 3A         [ 2]  476         cmp     #0x3A                                   ; is it < 0x3A
   130C 90 32         [ 4]  477         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   130E A5 5B         [ 3]  478         lda     TAPE_BYTE
   1310 C9 41         [ 2]  479         cmp     #0x41                                   ; is it < 0x41?
   1312 90 45         [ 4]  480         bcc     $18                                     ; ignore it
   1314 C9 4F         [ 2]  481         cmp     #0x4F                                   ; is it >= 0x4F?
   1316 B0 41         [ 4]  482         bcs     $18                                     ; ignore it
   1318 A6 63         [ 3]  483         ldx     CURR_PORT                               ; X = current board address
   131A 38            [ 2]  484         sec                                             ; (it's 0x41 to 0x4E)
   131B E9 41         [ 2]  485         sbc     #0x41                                   ; subtract 0x41
   131D C9 08         [ 2]  486         cmp     #0x08
   131F 90 02         [ 4]  487         bcc     $16                                     ; process as command
   1321 E8            [ 2]  488         inx
   1322 E8            [ 2]  489         inx
   1323                     490 $16:
   1323 29 07         [ 2]  491         and     #0x07                                   ; lookup bitmask in A
   1325 A8            [ 2]  492         tay
   1326 B9 5A 13      [ 5]  493         lda     MASKTBL,y
   1329 85 5C         [ 3]  494         sta     SOL_MASK                                ; store mask in SOL_MASK
   132B A5 5D         [ 3]  495         lda     CURR_CHANNEL
   132D 4A            [ 2]  496         lsr     a                                       ; get on/off in carry
   132E B0 09         [ 4]  497         bcs     $17                                     ; if on, jump
   1330 A5 5C         [ 3]  498         lda     SOL_MASK
   1332 49 FF         [ 2]  499         eor     #0xFF
   1334 35 00         [ 4]  500         and     RAM_start,x
   1336 95 00         [ 4]  501         sta     RAM_start,x                             ; turn off solenoid
   1338 60            [ 6]  502         rts
                            503 ;
   1339                     504 $17:
   1339 A5 5C         [ 3]  505         lda     SOL_MASK
   133B 15 00         [ 4]  506         ora     RAM_start,x
   133D 95 00         [ 4]  507         sta     RAM_start,x                             ; turn on solenoid
   133F 60            [ 6]  508         rts
                            509 ;
   1340                     510 PROCCHNL:
   1340 A5 5B         [ 3]  511         lda     TAPE_BYTE                               ; put channel byte in CURR_CHANNEL
   1342 85 5D         [ 3]  512         sta     CURR_CHANNEL
   1344 29 7E         [ 2]  513         and     #0x7E
   1346 C9 22         [ 2]  514         cmp     #0x22
   1348 D0 05         [ 4]  515         bne     CONVCHNL
   134A A9 98         [ 2]  516         lda     #0x98                                   ; process 0x22 or 0x23
   134C 85 63         [ 3]  517         sta     CURR_PORT                               ; set this to 0x98 - board 7
   134E 60            [ 6]  518         rts
                            519 ;
   134F                     520 CONVCHNL:
   134F 38            [ 2]  521         sec                                             ; process channel
   1350 E9 32         [ 2]  522         sbc     #0x32
   1352 0A            [ 2]  523         asl     a
   1353 18            [ 2]  524         clc
   1354 69 80         [ 2]  525         adc     #0x80
   1356 85 63         [ 3]  526         sta     CURR_PORT                               ; (X-0x32) * 2 + 0x80
   1358 60            [ 6]  527         rts
   1359                     528 $18:
   1359 60            [ 6]  529         rts
                            530 ;
                            531 ; bit mask table
                            532 ;
   135A                     533 MASKTBL:
   135A 01 02 04 08         534         .byte   0x01,0x02,0x04,0x08
   135E 10 20 40 80         535         .byte   0x10,0x20,0x40,0x80
                            536 ;
                            537 ; This table is referenced by UART code
                            538 ;
   1362                     539 UTABLE_M1:
   1362 4D 31               540         .byte   'M,'1                                   ; M1
   1364                     541 UTABLE_M2:
   1364 4D 32               542         .byte   'M,'2                                   ; M2
                            543 ;
                            544 ;       Read the AGC mic level
                            545 ;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
                            546 ;
   1366                     547 AGCMICRD:
   1366 A9 00         [ 2]  548         lda     #0x00
   1368 85 60         [ 3]  549         sta     AGC_ACCUM                               ; init final agc value
   136A 85 61         [ 3]  550         sta     AGC_SAMPLES                             ; init agc sample counter
   136C A9 0A         [ 2]  551         lda     #0x0A
   136E 85 54         [ 3]  552         sta     TIMER_100MS_A                           ; Start a 1 second timer
   1370 A9 64         [ 2]  553         lda     #0x64
   1372 85 53         [ 3]  554         sta     TIMER_1MS_R
   1374                     555 $23:
   1374 20 F3 13      [ 6]  556         jsr     KUPDATE                                 ; housekeeping
   1377 A5 54         [ 3]  557         lda     TIMER_100MS_A
   1379 D0 F9         [ 4]  558         bne     $23                                     ; if 1 sec, do housekeeping
   137B A9 0A         [ 2]  559         lda     #0x0A
   137D 85 54         [ 3]  560         sta     TIMER_100MS_A
   137F A9 64         [ 2]  561         lda     #0x64
   1381 85 53         [ 3]  562         sta     TIMER_1MS_R                             ; reset timer
   1383 A5 61         [ 3]  563         lda     AGC_SAMPLES
   1385 C9 08         [ 2]  564         cmp     #0x08                                   ; 8 samples?
   1387 F0 15         [ 4]  565         beq     $27
   1389 E6 61         [ 5]  566         inc     AGC_SAMPLES                             ; increment the sample counter
   138B A2 09         [ 2]  567         ldx     #0x09
   138D 38            [ 2]  568         sec
   138E AD 80 03      [ 4]  569         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1391                     570 $24:                                                    ; read the most significant high bit
   1391 2A            [ 2]  571         rol     a
   1392 CA            [ 2]  572         dex
   1393 90 FC         [ 4]  573         bcc     $24
   1395 18            [ 2]  574         clc
   1396 8A            [ 2]  575         txa                                             ; 8=high bit7, 0=no high bits
   1397 65 60         [ 3]  576         adc     AGC_ACCUM                               ; add it into AGC_ACCUM (do this 8 times)
   1399 85 60         [ 3]  577         sta     AGC_ACCUM
   139B 4C 74 13      [ 3]  578         jmp     $23
                            579 ;
   139E                     580 $27:
   139E 46 60         [ 5]  581         lsr     AGC_ACCUM                               ; divide by 8 (average of 8 samples)
   13A0 46 60         [ 5]  582         lsr     AGC_ACCUM
   13A2 46 60         [ 5]  583         lsr     AGC_ACCUM
   13A4 A5 60         [ 3]  584         lda     AGC_ACCUM
   13A6 85 5F         [ 3]  585         sta     AGC_LEVEL                               ; store agc value in AGC_LEVEL
   13A8 A9 00         [ 2]  586         lda     #0x00
   13AA 85 60         [ 3]  587         sta     AGC_ACCUM                               ; clear these 2 and return
   13AC 85 61         [ 3]  588         sta     AGC_SAMPLES
   13AE 60            [ 6]  589         rts
                            590 ;
                            591 ;        Do AGC Mic Logic
                            592 ;
   13AF                     593 AGCUPD:
   13AF AD 80 02      [ 4]  594         lda     U19_PORTA                               ; read AGC knob
   13B2 49 FF         [ 2]  595         eor     #0xFF                                   ; invert the bits
   13B4 4A            [ 2]  596         lsr     a                                       ; get into lower nibble
   13B5 4A            [ 2]  597         lsr     a
   13B6 4A            [ 2]  598         lsr     a
   13B7 4A            [ 2]  599         lsr     a
   13B8 18            [ 2]  600         clc
   13B9 65 5F         [ 3]  601         adc     AGC_LEVEL                               ; add audio level to it
   13BB AA            [ 2]  602         tax
   13BC BD E2 13      [ 5]  603         lda     AGCTABLE,x                              ; and get the table value
   13BF 85 62         [ 3]  604         sta     AGC_GAIN                                ; store this value in AGC_GAIN
   13C1 A5 52         [ 3]  605         lda     TIMER_1MS_C                             ; 10ms timer expired?
   13C3 D0 16         [ 4]  606         bne     $26                                     ; no, just update CPU Leds
   13C5 A9 0A         [ 2]  607         lda     #0x0A
   13C7 85 52         [ 3]  608         sta     TIMER_1MS_C                             ; restart 10ms timer
   13C9 A5 62         [ 3]  609         lda     AGC_GAIN                                ; every 10ms, adjust gain by 1 if needed
   13CB CD 82 03      [ 4]  610         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   13CE 90 08         [ 4]  611         bcc     $25
   13D0 F0 09         [ 4]  612         beq     $26
   13D2 EE 82 03      [ 6]  613         inc     audio_periph$ddr_reg_b                  ; increase value
   13D5 4C DB 13      [ 3]  614         jmp     $26
                            615 ;
   13D8                     616 $25:
   13D8 CE 82 03      [ 6]  617         dec     audio_periph$ddr_reg_b                  ; decrease value
   13DB                     618 $26:
   13DB AD 82 03      [ 4]  619         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   13DE 8D 82 02      [ 4]  620         sta     U19_PORTB
   13E1 60            [ 6]  621         rts
                            622 ;
                            623 ;       AGC table
                            624 ;
   13E2                     625 AGCTABLE:
   13E2 03 04 06 08         626         .db     0x03, 0x04, 0x06, 0x08
   13E6 10 16 20 2D         627         .db     0x10, 0x16, 0x20, 0x2D
   13EA 40 5A 80 BF         628         .db     0x40, 0x5A, 0x80, 0xBF
   13EE FF FF FF FF         629         .db     0xFF, 0xFF, 0xFF, 0xFF
   13F2 FF                  630         .db     0xFF
                            631 ;
                            632 ;       Process King Tables
                            633 ;
   13F3                     634 KUPDATE:
   13F3 A5 65         [ 3]  635         lda     KTABLE_OFFS
   13F5 AA            [ 2]  636         tax                                             ; KTABLE_OFFS - table offset
   13F6 A5 66         [ 3]  637         lda     KTABLE_SEL                              ; if KTABLE_SEL != 0   
   13F8 D0 37         [ 4]  638         bne     $38                                     ; goto other table                                  
   13FA BD 5F 14      [ 5]  639         lda     KTABLE1,x                               ; else read byte
   13FD C9 FE         [ 2]  640         cmp     #0xFE                                   ; if it's 0xFE
   13FF F0 27         [ 4]  641         beq     $37                                     ; goto next table
   1401 C9 FF         [ 2]  642         cmp     #0xFF                                   ; if it's not 0xFF
   1403 D0 0B         [ 4]  643         bne     $35                                     ; check the long timer
   1405 A9 00         [ 2]  644         lda     #0x00                                   ; if it is 0xFF
   1407 85 65         [ 3]  645         sta     KTABLE_OFFS                             ; else clear KTABLE_OFFS
   1409 A9 FA         [ 2]  646         lda     #0xFA   
   140B 85 64         [ 3]  647         sta     TIMER_100MS_C                           ; init 25 second timer
   140D 4C 27 14      [ 3]  648         jmp     $36                                     ; and return
   1410                     649 $35:
   1410 C5 64         [ 3]  650         cmp     TIMER_100MS_C
   1412 D0 13         [ 4]  651         bne     $36                                     ; if it's not time, return
   1414 BD 60 14      [ 5]  652         lda     KTABLE1+1,x                             ; use two bytes from this table
   1417 20 FC 12      [ 6]  653         jsr     PROCBYTE
   141A BD 61 14      [ 5]  654         lda     KTABLE1+2,x
   141D 20 FC 12      [ 6]  655         jsr     PROCBYTE
   1420 A5 65         [ 3]  656         lda     KTABLE_OFFS
   1422 18            [ 2]  657         clc
   1423 69 03         [ 2]  658         adc     #0x03
   1425 85 65         [ 3]  659         sta     KTABLE_OFFS                             ; add 3 to KTABLE_OFFS and return
   1427                     660 $36:
   1427 60            [ 6]  661         rts
   1428                     662 $37:
   1428 E6 66         [ 5]  663         inc     KTABLE_SEL                              ; add 1 to KTABLE_SEL
   142A A9 00         [ 2]  664         lda     #0x00
   142C 85 65         [ 3]  665         sta     KTABLE_OFFS                             ; clear KTABLE_OFFS
   142E 4C 27 14      [ 3]  666         jmp     $36                                     ; return
   1431                     667 $38:
   1431 BD 49 15      [ 5]  668         lda     KTABLE2,x
   1434 C9 FF         [ 2]  669         cmp     #0xFF
   1436 D0 0D         [ 4]  670         bne     $39
   1438 A9 00         [ 2]  671         lda     #0x00
   143A 85 65         [ 3]  672         sta     KTABLE_OFFS
   143C 85 66         [ 3]  673         sta     KTABLE_SEL
   143E A9 FA         [ 2]  674         lda     #0xFA
   1440 85 64         [ 3]  675         sta     TIMER_100MS_C
   1442 4C 27 14      [ 3]  676         jmp     $36
   1445                     677 $39:
   1445 C5 64         [ 3]  678         cmp     TIMER_100MS_C
   1447 D0 DE         [ 4]  679         bne     $36
   1449 BD 4A 15      [ 5]  680         lda     KTABLE2+1,x
   144C 20 FC 12      [ 6]  681         jsr     PROCBYTE
   144F BD 4B 15      [ 5]  682         lda     KTABLE2+2,x
   1452 20 FC 12      [ 6]  683         jsr     PROCBYTE
   1455 A5 65         [ 3]  684         lda     KTABLE_OFFS
   1457 18            [ 2]  685         clc
   1458 69 03         [ 2]  686         adc     #0x03
   145A 85 65         [ 3]  687         sta     KTABLE_OFFS
   145C 4C 27 14      [ 3]  688         jmp     $36
                            689 
   145F                     690 KTABLE1:
   145F F5 35 49 F5 35 4A   691         .byte   0xF5,0x35,0x49, 0xF5,0x35,0x4A, 0xEE,0x35,0x46, 0xEB,0x33,0x46
        EE 35 46 EB 33 46
   146B E9 32 46 E9 33 42   692         .byte   0xE9,0x32,0x46, 0xE9,0x33,0x42, 0xE8,0x33,0x46, 0xE7,0x32,0x46
        E8 33 46 E7 32 46
   1477 E6 33 46 E5 32 46   693         .byte   0xE6,0x33,0x46, 0xE5,0x32,0x46, 0xE4,0x33,0x46, 0xE3,0x32,0x46
        E4 33 46 E3 32 46
   1483 E2 33 46 E1 32 46   694         .byte   0xE2,0x33,0x46, 0xE1,0x32,0x46, 0xE0,0x33,0x46, 0xDF,0x32,0x46
        E0 33 46 DF 32 46
   148F DE 33 46 DD 32 46   695         .byte   0xDE,0x33,0x46, 0xDD,0x32,0x46, 0xDD,0x34,0x46, 0xDC,0x33,0x46
        DD 34 46 DC 33 46
   149B DB 32 46 DB 35 46   696         .byte   0xDB,0x32,0x46, 0xDB,0x35,0x46, 0xDA,0x33,0x46, 0xD9,0x32,0x46
        DA 33 46 D9 32 46
   14A7 D1 32 42 C6 33 47   697         .byte   0xD1,0x32,0x42, 0xC6,0x33,0x47, 0xC6,0x33,0x43, 0xC5,0x32,0x47
        C6 33 43 C5 32 47
   14B3 C3 34 46 C2 33 47   698         .byte   0xC3,0x34,0x46, 0xC2,0x33,0x47, 0xC1,0x32,0x47, 0xC0,0x35,0x46
        C1 32 47 C0 35 46
   14BF B9 34 46 B9 32 43   699         .byte   0xB9,0x34,0x46, 0xB9,0x32,0x43, 0xB7,0x35,0x46, 0xB7,0x33,0x42
        B7 35 46 B7 33 42
   14CB B3 33 46 B2 32 46   700         .byte   0xB3,0x33,0x46, 0xB2,0x32,0x46, 0xA8,0x32,0x42, 0x9D,0x33,0x47
        A8 32 42 9D 33 47
   14D7 9C 32 47 9B 33 47   701         .byte   0x9C,0x32,0x47, 0x9B,0x33,0x47, 0x9A,0x32,0x47, 0x9A,0x34,0x46
        9A 32 47 9A 34 46
   14E3 99 33 47 99 33 43   702         .byte   0x99,0x33,0x47, 0x99,0x33,0x43, 0x99,0x35,0x46, 0x98,0x32,0x47
        99 35 46 98 32 47
   14EF 97 33 47 94 32 47   703         .byte   0x97,0x33,0x47, 0x94,0x32,0x47, 0x93,0x33,0x47, 0x92,0x32,0x47
        93 33 47 92 32 47
   14FB 91 33 47 90 32 47   704         .byte   0x91,0x33,0x47, 0x90,0x32,0x47, 0x87,0x33,0x42, 0x86,0x32,0x43
        87 33 42 86 32 43
   1507 7D 33 46 7C 32 46   705         .byte   0x7D,0x33,0x46, 0x7C,0x32,0x46, 0x77,0x32,0x42, 0x77,0x34,0x46
        77 32 42 77 34 46
   1513 75 32 43 75 35 46   706         .byte   0x75,0x32,0x43, 0x75,0x35,0x46, 0x6A,0x33,0x46, 0x69,0x32,0x46
        6A 33 46 69 32 46
   151F 67 33 46 66 32 46   707         .byte   0x67,0x33,0x46, 0x66,0x32,0x46, 0x66,0x32,0x43, 0x65,0x34,0x46
        66 32 43 65 34 46
   152B 62 35 46 62 33 42   708         .byte   0x62,0x35,0x46, 0x62,0x33,0x42, 0x56,0x33,0x46, 0x55,0x32,0x46
        56 33 46 55 32 46
   1537 55 32 42 54 33 46   709         .byte   0x55,0x32,0x42, 0x54,0x33,0x46, 0x53,0x32,0x46, 0x52,0x33,0x46
        53 32 46 52 33 46
   1543 51 32 46 FE FE FE   710         .byte   0x51,0x32,0x46, 0xFE,0xFE,0xFE
                            711 
   1549                     712 KTABLE2:
   1549 50 33 46 4F 32 46   713         .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        4E 33 46 4E 33 42
   1555 4D 32 46 4C 33 46   714         .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        4B 32 46 40 34 46
   1561 3E 35 46 3C 33 47   715         .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        3B 32 47 3A 33 47
   156D 39 32 47 32 32 42   716         .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        29 34 46 28 32 47
   1579 27 35 46 26 33 43   717         .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        23 33 47 22 32 47
   1585 1E 33 42 1D 32 43   718         .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        1B 33 47 1A 32 47
   1591 19 33 47 18 32 47   719         .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        17 34 46 17 33 47
   159D 17 32 42 16 32 47   720         .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        15 35 46 15 33 43
   15A9 08 32 43 03 33 46   721         .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        02 32 46 02 34 46
   15B5 FF FF FF FF FF FF   722         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
                            723 
   1FFA                     724         .org    0x1FFA
                            725         ;
                            726         ; vectors
                            727         ;
   1FFA                     728 NMIVEC:
   1FFA FF FF               729         .dw     0xFFFF
   1FFC                     730 RESETVEC:
   1FFC 48 10               731         .dw     RESET
   1FFE                     732 IRQVEC:
   1FFE 00 10               733         .dw     IRQ
