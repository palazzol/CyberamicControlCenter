                              1 
                              2         .area   region1 (ABS)
                              3 
                     0050     4 TIMER_1MS_A     = 0x0050    ; 1ms timer
                     0051     5 TIMER_1MS_B     = 0x0051    ; 1ms timer
                     0052     6 TIMER_1MS_C     = 0x0052    ; 1ms timer
                     0053     7 TIMER_1MS_R     = 0x0053    ; 1ms timer, autoload to 100
                     0054     8 TIMER_100MS_A   = 0x0054    ; 0.1s timer
                     0055     9 TIMER_100MS_B   = 0x0055    ; 0.1s timer
                     0056    10 TIMER_100MS_R   = 0x0056    ; 0.1s timer, autoload to 100
                     0057    11 TIMER_10S       = 0x0057    ; 10s timer
                     0058    12 ZEROCROSS_CTR   = 0x0058    ; zero crossing counter
                     0059    13 TRACK_CTR       = 0x0059    ; track counter
                             14 
                     005B    15 TAPE_BYTE       = 0x005B    ; storage for incoming serial byte (& 0x7F)
                     005C    16 SOL_MASK        = 0x005C    ; bitmask for solenoids
                     005D    17 CURR_CHANNEL    = 0x005D    ; current channel serial byte
                             18 
                     005F    19 AGC_LEVEL       = 0x005F    ; agc mic level
                     0060    20 AGC_ACCUM       = 0x0060    ; agc mic level accumulator
                     0061    21 AGC_SAMPLES     = 0x0061    ; agc mic sample counter
                     0062    22 AGC_GAIN        = 0x0062    ; agc calculated gain value
                     0063    23 CURR_PORT       = 0x0063    ; current channel port address
                     0064    24 TIMER_100MS_C   = 0x0064    ; 0.1s timer
                     0065    25 KTABLE_OFFS     = 0x0065    ; offset into King table
                     0066    26 KTABLE_SEL      = 0x0066    ; select King table
                     0067    27 UART_RBYTE      = 0x0067    ; UART routine recv byte (0 or 1)
                     0068    28 UART_SBYTE      = 0x0068    ; UART routine send byte (0 or 1)
                     0069    29 UART_ADDR       = 0x0069    ; Address of UART send table (2 bytes)
                             30 
                             31         .include "../../include/ptt6502.def"
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
                             32 
   1000                      33         .org    0x1000
                             34 
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
   100E F0 02         [ 4]   45         beq     $50
   1010 C6 50         [ 5]   46         dec     TIMER_1MS_A
   1012                      47 $50:
   1012 A5 51         [ 3]   48         lda     TIMER_1MS_B                             ; 1ms timer
   1014 F0 02         [ 4]   49         beq     $51
   1016 C6 51         [ 5]   50         dec     TIMER_1MS_B
   1018                      51 $51:
   1018 A5 52         [ 3]   52         lda     TIMER_1MS_C                             ; 1ms timer
   101A F0 02         [ 4]   53         beq     $52
   101C C6 52         [ 5]   54         dec     TIMER_1MS_C
   101E                      55 $52:
   101E C6 53         [ 5]   56         dec     TIMER_1MS_R
   1020 D0 24         [ 4]   57         bne     $56
   1022 A9 64         [ 2]   58         lda     #0x64
   1024 85 53         [ 3]   59         sta     TIMER_1MS_R
   1026 A5 54         [ 3]   60         lda     TIMER_100MS_A
   1028 F0 02         [ 4]   61         beq     $53
   102A C6 54         [ 5]   62         dec     TIMER_100MS_A
   102C                      63 $53:
   102C A5 64         [ 3]   64         lda     TIMER_100MS_C
   102E F0 02         [ 4]   65         beq     $54
   1030 C6 64         [ 5]   66         dec     TIMER_100MS_C
   1032                      67 $54:
   1032 A5 55         [ 3]   68         lda     TIMER_100MS_B
   1034 F0 02         [ 4]   69         beq     $55
   1036 C6 55         [ 5]   70         dec     TIMER_100MS_B
   1038                      71 $55:
   1038 C6 56         [ 5]   72         dec     TIMER_100MS_R
   103A D0 0A         [ 4]   73         bne     $56
   103C A9 64         [ 2]   74         lda     #0x64
   103E 85 56         [ 3]   75         sta     TIMER_100MS_R
   1040 A5 57         [ 3]   76         lda     TIMER_10S
   1042 F0 02         [ 4]   77         beq     $56
   1044 C6 57         [ 5]   78         dec     TIMER_10S
   1046                      79 $56:
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
   10D0 85 65         [ 3]  150         sta     KTABLE_OFFS
   10D2 85 66         [ 3]  151         sta     KTABLE_SEL
   10D4 A9 30         [ 2]  152         lda     #0x30
   10D6 A9 40         [ 2]  153         lda     #TAPEMODE_REWIND
   10D8 20 2E 12      [ 6]  154         jsr     TAPECMD                                 ; REWIND tape
   10DB                     155 $22:
   10DB A9 00         [ 2]  156         lda     #0x00
   10DD 85 58         [ 3]  157         sta     ZEROCROSS_CTR                           ; counter to zero
   10DF                     158 $3:
   10DF AD 02 03      [ 4]  159         lda     transport_periph$ddr_reg_b
   10E2 A9 0A         [ 2]  160         lda     #0x0A
   10E4 85 50         [ 3]  161         sta     TIMER_1MS_A                             ; set a 10ms timer
   10E6 E6 58         [ 5]  162         inc     ZEROCROSS_CTR                           ; count transitions
   10E8 A5 58         [ 3]  163         lda     ZEROCROSS_CTR
   10EA C9 64         [ 2]  164         cmp     #0x64
   10EC B0 0F         [ 4]  165         bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
   10EE                     166 $4:
   10EE 20 ED 13      [ 6]  167         jsr     KUPDATE
   10F1 A5 50         [ 3]  168         lda     TIMER_1MS_A
   10F3 F0 E6         [ 4]  169         beq     $22
   10F5 AD 03 03      [ 4]  170         lda     transport_control_reg_b
   10F8 10 F4         [ 4]  171         bpl     $4
   10FA 4C DF 10      [ 3]  172         jmp     $3
                            173 
                            174 ;
   10FD                     175 FINDTRK:
   10FD A9 20         [ 2]  176         lda     #TAPEMODE_FFWD
   10FF 20 2E 12      [ 6]  177         jsr     TAPECMD                                 ; FFWD tape
   1102 A9 19         [ 2]  178         lda     #0x19
   1104 85 54         [ 3]  179         sta     TIMER_100MS_A                           ; 2.5 secs
   1106 A9 64         [ 2]  180         lda     #0x64
   1108 85 53         [ 3]  181         sta     TIMER_1MS_R
   110A                     182 $5:
   110A 20 ED 13      [ 6]  183         jsr     KUPDATE
   110D A5 54         [ 3]  184         lda     TIMER_100MS_A
   110F D0 F9         [ 4]  185         bne     $5
   1111 A9 00         [ 2]  186         lda     #0x00
   1113 85 59         [ 3]  187         sta     TRACK_CTR
   1115 20 49 12      [ 6]  188         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1118 A9 40         [ 2]  189         lda     #TAPEMODE_REWIND
   111A 20 2E 12      [ 6]  190         jsr     TAPECMD                                 ; REWIND tape
   111D 20 49 12      [ 6]  191         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1120 A9 FA         [ 2]  192         lda     #0xFA
   1122 85 50         [ 3]  193         sta     TIMER_1MS_A
   1124                     194 $30:
   1124 20 ED 13      [ 6]  195         jsr     KUPDATE
   1127 A5 50         [ 3]  196         lda     TIMER_1MS_A
   1129 D0 F9         [ 4]  197         bne     $30                                     ; delay for 250 ms
   112B A9 20         [ 2]  198         lda     #TAPEMODE_FFWD
   112D 20 2E 12      [ 6]  199         jsr     TAPECMD
   1130 20 49 12      [ 6]  200         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1133 E6 59         [ 5]  201         inc     TRACK_CTR
   1135 A9 10         [ 2]  202         lda     #TAPEMODE_STOP
   1137 20 2E 12      [ 6]  203         jsr     TAPECMD                                 ; STOP tape
   113A A9 80         [ 2]  204         lda     #TAPEMODE_PLAY
   113C 20 2E 12      [ 6]  205         jsr     TAPECMD                                 ; PLAY tape
   113F 20 6C 12      [ 6]  206         jsr     WAITCD                                  ; wait for carrier
   1142 A9 10         [ 2]  207         lda     #TAPEMODE_STOP
   1144 20 2E 12      [ 6]  208         jsr     TAPECMD                                 ; STOP Tape
   1147                     209 WAITPLAY:
   1147 A9 5E         [ 2]  210         lda     #<UTABLE_M2
   1149 85 69         [ 3]  211         sta     UART_ADDR
   114B A9 13         [ 2]  212         lda     #>UTABLE_M2
   114D 85 6A         [ 3]  213         sta     UART_ADDR+1                             ; set UTABLE address
   114F 20 A9 13      [ 6]  214         jsr     AGCUPD
   1152 20 ED 13      [ 6]  215         jsr     KUPDATE
   1155 20 D3 12      [ 6]  216         jsr     UARTPROC
   1158 AD 02 01      [ 4]  217         lda     UART_02
   115B 29 05         [ 2]  218         and     #0x05
   115D F0 23         [ 4]  219         beq     $46
   115F A5 67         [ 3]  220         lda     UART_RBYTE
   1161 D0 0C         [ 4]  221         bne     $45
   1163 AD 01 01      [ 4]  222         lda     UART_01
   1166 C9 53         [ 2]  223         cmp     #'S                                     ; 'S' - start command?
   1168 D0 18         [ 4]  224         bne     $46
   116A E6 67         [ 5]  225         inc     UART_RBYTE
   116C 4C 82 11      [ 3]  226         jmp     $46
   116F                     227 $45:
   116F A9 00         [ 2]  228         lda     #0x00
   1171 85 67         [ 3]  229         sta     UART_RBYTE
   1173 AD 01 01      [ 4]  230         lda     UART_01
   1176 C9 31         [ 2]  231         cmp     #'1                                     ; '1' - 2nd byte startplay command?
   1178 F0 36         [ 4]  232         beq     STARTPLAY
   117A C9 32         [ 2]  233         cmp     #'2                                     ; '2' - 2nd byte lights command?
   117C F0 0A         [ 4]  234         beq     $47
   117E C9 33         [ 2]  235         cmp     #'3                                     ; '3' - 2nd byte lights command?
   1180 F0 1B         [ 4]  236         beq     $48
   1182                     237 $46:
   1182 4C 47 11      [ 3]  238         jmp     WAITPLAY
   1185 4C CA 10      [ 3]  239         jmp     REWIND
                            240 ; lights to all ones
   1188                     241 $47:
   1188 A9 FF         [ 2]  242         lda     #0xFF
   118A 85 98         [ 3]  243         sta     board_7_periph$ddr_reg_a
   118C 85 9A         [ 3]  244         sta     board_7_periph$ddr_reg_b
   118E 85 9C         [ 3]  245         sta     board_8_periph$ddr_reg_a
   1190 85 9E         [ 3]  246         sta     board_8_periph$ddr_reg_b
   1192 8D 02 02      [ 4]  247         sta     U18_PORTB
   1195 A9 02         [ 2]  248         lda     #0x02
   1197 8D 80 02      [ 4]  249         sta     U19_PORTA
   119A 4C 47 11      [ 3]  250         jmp     WAITPLAY
                            251 ; lights to all zeros
   119D                     252 $48:
   119D A9 00         [ 2]  253         lda     #0x00
   119F 85 98         [ 3]  254         sta     board_7_periph$ddr_reg_a
   11A1 85 9A         [ 3]  255         sta     board_7_periph$ddr_reg_b
   11A3 85 9C         [ 3]  256         sta     board_8_periph$ddr_reg_a
   11A5 85 9E         [ 3]  257         sta     board_8_periph$ddr_reg_b
   11A7 8D 02 02      [ 4]  258         sta     U18_PORTB
   11AA 8D 80 02      [ 4]  259         sta     U19_PORTA
   11AD 4C 47 11      [ 3]  260         jmp     WAITPLAY
                            261 
                            262 ;   we have been started!
   11B0                     263 STARTPLAY:
   11B0 20 FB 11      [ 6]  264         jsr     INITBRDS
   11B3 A9 5C         [ 2]  265         lda     #0x5C
   11B5 85 69         [ 3]  266         sta     UART_ADDR
   11B7 A9 13         [ 2]  267         lda     #0x13
   11B9 85 6A         [ 3]  268         sta     UART_ADDR+1                             ; set address to 0x1362?
   11BB A9 00         [ 2]  269         lda     #0x00
   11BD 8D 80 02      [ 4]  270         sta     U19_PORTA                               ; turn off RESET button light
   11C0 A9 A0         [ 2]  271         lda     #0xA0
   11C2 8D 02 02      [ 4]  272         sta     U18_PORTB                               ; turn off some lights - TBD
   11C5 A9 80         [ 2]  273         lda     #TAPEMODE_PLAY
   11C7 20 2E 12      [ 6]  274         jsr     TAPECMD                                 ; PLAY tape
   11CA 20 6C 12      [ 6]  275         jsr     WAITCD                                  ; wait for carrier
   11CD 20 92 12      [ 6]  276         jsr     PLAYTRK                                 ; play a track!
   11D0 20 FB 11      [ 6]  277         jsr     INITBRDS                                ; init the boards
   11D3 A9 80         [ 2]  278         lda     #0x80
   11D5 8D 02 02      [ 4]  279         sta     U18_PORTB                               ; turn off all but PROG light
   11D8 E6 59         [ 5]  280         inc     TRACK_CTR                               ; track counter
   11DA A5 59         [ 3]  281         lda     TRACK_CTR
   11DC C9 1A         [ 2]  282         cmp     #0x1A                                   ; 26?
   11DE 90 03         [ 4]  283         bcc     NEXTTRK
   11E0 4C CA 10      [ 3]  284         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            285 
   11E3                     286 NEXTTRK:
   11E3 A9 00         [ 2]  287         lda     #0x00
   11E5 85 65         [ 3]  288         sta     KTABLE_OFFS
   11E7 85 66         [ 3]  289         sta     KTABLE_SEL
   11E9 A9 FA         [ 2]  290         lda     #0xFA
   11EB 85 64         [ 3]  291         sta     TIMER_100MS_C
   11ED 20 6C 12      [ 6]  292         jsr     WAITCD                                  ; wait for carrier
   11F0 A9 10         [ 2]  293         lda     #TAPEMODE_STOP
   11F2 20 2E 12      [ 6]  294         jsr     TAPECMD                                 ; STOP tape
   11F5 20 60 13      [ 6]  295         jsr     AGCMICRD                                ; Read the AGC mic level
   11F8 4C 47 11      [ 3]  296         jmp     WAITPLAY
                            297 ;
                            298 ;       Init boards
                            299 ;
   11FB                     300 INITBRDS:
   11FB A9 3C         [ 2]  301         lda     #0x3C
   11FD 8D 83 03      [ 4]  302         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1200 A9 34         [ 2]  303         lda     #0x34
   1202 8D 81 03      [ 4]  304         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1205 A2 00         [ 2]  305         ldx     #0x00
   1207                     306 NEXTBRD:
   1207 A9 30         [ 2]  307         lda     #0x30
   1209 95 81         [ 4]  308         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   120B 95 83         [ 4]  309         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   120D A9 FF         [ 2]  310         lda     #0xFF
   120F 95 80         [ 4]  311         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1211 95 82         [ 4]  312         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1213 A9 34         [ 2]  313         lda     #0x34
   1215 95 81         [ 4]  314         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1217 95 83         [ 4]  315         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1219 A9 00         [ 2]  316         lda     #0x00
   121B 95 80         [ 4]  317         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   121D 95 82         [ 4]  318         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   121F E8            [ 2]  319         inx
   1220 E8            [ 2]  320         inx
   1221 E8            [ 2]  321         inx
   1222 E8            [ 2]  322         inx
   1223 E0 20         [ 2]  323         cpx     #0x20                                   ; do for boards 1-8
   1225 90 E0         [ 4]  324         bcc     NEXTBRD
   1227 A9 00         [ 2]  325         lda     #0x00                                   ; bug fix!
   1229 85 5D         [ 3]  326         sta     CURR_CHANNEL                            ; reset current channel serial byte
   122B 85 63         [ 3]  327         sta     CURR_PORT                               ; reset current channel port address
   122D 60            [ 6]  328         rts
                            329 ;
                            330 ;       Send Transport command for 0.250 sec
                            331 ;       (Unified)
                            332 ;
   122E                     333 TAPECMD:
   122E 8D 02 03      [ 4]  334         sta     transport_periph$ddr_reg_b              ; enable output line
   1231 A9 FA         [ 2]  335         lda     #0xFA
   1233 85 50         [ 3]  336         sta     TIMER_1MS_A
   1235                     337 $6:
   1235 20 ED 13      [ 6]  338         jsr     KUPDATE                                 ; housekeeping
   1238 A5 50         [ 3]  339         lda     TIMER_1MS_A
   123A D0 F9         [ 4]  340         bne     $6
   123C AD 02 03      [ 4]  341         lda     transport_periph$ddr_reg_b
   123F 29 60         [ 2]  342         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1241 D0 05         [ 4]  343         bne     $31                                     ; Yes, go to exit
   1243 A9 00         [ 2]  344         lda     #0x00                                   ; else unassert STOP or PLAY
   1245 8D 02 03      [ 4]  345         sta     transport_periph$ddr_reg_b              ; and then exit
   1248                     346 $31:
   1248 60            [ 6]  347         rts
                            348 ;
                            349 ;       Wait for tone during Fast Forward, signaling beginning of track
                            350 ;       (50Hz or above, for 33 zero crossing) 
                            351 ;
   1249                     352 WAITTONE:
   1249 A9 00         [ 2]  353         lda     #0x00
   124B 85 58         [ 3]  354         sta     ZEROCROSS_CTR
   124D                     355 $8:
   124D AD 02 03      [ 4]  356         lda     transport_periph$ddr_reg_b
   1250 A9 0A         [ 2]  357         lda     #0x0A
   1252 85 50         [ 3]  358         sta     TIMER_1MS_A                             ; 10 msec
   1254 E6 58         [ 5]  359         inc     ZEROCROSS_CTR
   1256 A5 58         [ 3]  360         lda     ZEROCROSS_CTR
   1258 C9 21         [ 2]  361         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   125A B0 0F         [ 4]  362         bcs     $10                                     ; timeout - exit
   125C                     363 $9:
   125C 20 ED 13      [ 6]  364         jsr     KUPDATE
   125F A5 50         [ 3]  365         lda     TIMER_1MS_A
   1261 F0 E6         [ 4]  366         beq     WAITTONE                                ; 10 msec done yet? then loop
   1263 AD 03 03      [ 4]  367         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1266 10 F4         [ 4]  368         bpl     $9                                      ; if not, extend the looping
   1268 4C 4D 12      [ 3]  369         jmp     $8      
                            370 
   126B                     371 $10:
   126B 60            [ 6]  372         rts
                            373 ;
                            374 ;       Wait for carrier / start of data
                            375 ;
                            376 
                            377 ; Wait for 250ms
   126C                     378 WAITCD:
   126C A9 FA         [ 2]  379         lda     #0xFA
   126E 85 50         [ 3]  380         sta     TIMER_1MS_A                             ; 250 msec
   1270                     381 $11:
   1270 20 ED 13      [ 6]  382         jsr     KUPDATE
   1273 A5 50         [ 3]  383         lda     TIMER_1MS_A
   1275 D0 F9         [ 4]  384         bne     $11
                            385 
                            386 ; Wait for 160ms of consecutive zero crossings
   1277                     387 $12:
   1277 20 ED 13      [ 6]  388         jsr     KUPDATE
   127A AD 02 03      [ 4]  389         lda     transport_periph$ddr_reg_b
   127D 6A            [ 2]  390         ror
   127E 90 F7         [ 4]  391         bcc     $12
   1280 A9 A0         [ 2]  392         lda     #0xA0                                   ; 160 msec
   1282 85 50         [ 3]  393         sta     TIMER_1MS_A
                            394 
                            395 
   1284                     396 $13:
   1284 20 ED 13      [ 6]  397         jsr     KUPDATE
   1287 AD 02 03      [ 4]  398         lda     transport_periph$ddr_reg_b
   128A 6A            [ 2]  399         ror
   128B 90 EA         [ 4]  400         bcc     $12
   128D A5 50         [ 3]  401         lda     TIMER_1MS_A
   128F D0 F3         [ 4]  402         bne     $13
   1291 60            [ 6]  403         rts
                            404 ;
                            405 ;       Play a track
                            406 ;
   1292                     407 PLAYTRK:
   1292 AD 00 03      [ 4]  408         lda     transport_periph$ddr_reg_a
   1295 A9 40         [ 2]  409         lda     #0x40
   1297 85 82         [ 3]  410         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1299 85 86         [ 3]  411         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   129B 85 8A         [ 3]  412         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   129D 85 8E         [ 3]  413         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   129F A9 3C         [ 2]  414         lda     #0x3C
   12A1 8D 81 03      [ 4]  415         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   12A4 A9 34         [ 2]  416         lda     #0x34
   12A6 8D 83 03      [ 4]  417         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   12A9 A9 60         [ 2]  418         lda     #0x60
   12AB 85 82         [ 3]  419         sta     board_1_periph$ddr_reg_b                ; ???
   12AD                     420 $14:
   12AD AD 02 03      [ 4]  421         lda     transport_periph$ddr_reg_b
   12B0 4A            [ 2]  422         lsr     a
   12B1 90 11         [ 4]  423         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   12B3 20 D3 12      [ 6]  424         jsr     UARTPROC                                ; ??? Unknown UART routine
   12B6 20 A9 13      [ 6]  425         jsr     AGCUPD
   12B9 AD 01 03      [ 4]  426         lda     transport_control_reg_a                 ; Did we get a byte?
   12BC 10 EF         [ 4]  427         bpl     $14                                     ; No, loop
   12BE 20 F3 12      [ 6]  428         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   12C1 4C AD 12      [ 3]  429         jmp     $14
                            430 
                            431 ;       Lost carrier - wait 100 msec for more data before giving up
   12C4                     432 LOSTCD:
   12C4 A9 64         [ 2]  433         lda     #0x64                                   ; 100 msec
   12C6 85 50         [ 3]  434         sta     TIMER_1MS_A
   12C8                     435 $15:
   12C8 AD 02 03      [ 4]  436         lda     transport_periph$ddr_reg_b
   12CB 4A            [ 2]  437         lsr
   12CC B0 C4         [ 4]  438         bcs     PLAYTRK
   12CE A5 50         [ 3]  439         lda     TIMER_1MS_A
   12D0 D0 F6         [ 4]  440         bne     $15
   12D2 60            [ 6]  441         rts
                            442 ;
                            443 ;   TBD - Unknown UART routine
                            444 ;   Send first or second byte from the UART table to UART_01
                            445 ;
   12D3                     446 UARTPROC:
   12D3 AD 02 01      [ 4]  447         lda     UART_02                                 ; check UART_02.bit2 == 0
   12D6 29 02         [ 2]  448         and     #0x02                                   
   12D8 F0 18         [ 4]  449         beq     $42                                     ; if so, return
   12DA A5 68         [ 3]  450         lda     UART_SBYTE                              ; else, check byte number
   12DC D0 09         [ 4]  451         bne     $40
   12DE A0 00         [ 2]  452         ldy     #0x00
   12E0 B1 69         [ 6]  453         lda     [UART_ADDR],y                           ; send first byte
   12E2 E6 68         [ 5]  454         inc     UART_SBYTE
   12E4 4C EF 12      [ 3]  455         jmp     $41
   12E7                     456 $40:
   12E7 A9 00         [ 2]  457         lda     #0x00
   12E9 85 68         [ 3]  458         sta     UART_SBYTE
   12EB A0 01         [ 2]  459         ldy     #0x01
   12ED B1 69         [ 6]  460         lda     [UART_ADDR],y                           ; send second byte
   12EF                     461 $41:
   12EF 8D 01 01      [ 4]  462         sta     UART_01
   12F2                     463 $42:
   12F2 60            [ 6]  464         rts
                            465 ;
                            466 ; Protocol handler
                            467 ;
   12F3                     468 PROTOHAND:
   12F3 AD 00 03      [ 4]  469         lda     transport_periph$ddr_reg_a
   12F6                     470 PROCBYTE:
   12F6 29 7F         [ 2]  471         and     #0x7F                                   ; insure data is ASCII
   12F8 85 5B         [ 3]  472         sta     TAPE_BYTE                               ; store it here
   12FA 29 7E         [ 2]  473         and     #0x7E                                   ; ignore bottom bit
   12FC C9 22         [ 2]  474         cmp     #0x22                                   ; is it 0x22 or 0x23?
   12FE F0 3A         [ 4]  475         beq     PROCCHNL                                ; if so, process as channel
   1300 C9 32         [ 2]  476         cmp     #0x32                                   ; is it < 0x32 ?
   1302 90 4F         [ 4]  477         bcc     $18                                     ; ignore it
   1304 C9 3A         [ 2]  478         cmp     #0x3A                                   ; is it < 0x3A
   1306 90 32         [ 4]  479         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   1308 A5 5B         [ 3]  480         lda     TAPE_BYTE
   130A C9 41         [ 2]  481         cmp     #0x41                                   ; is it < 0x41?
   130C 90 45         [ 4]  482         bcc     $18                                     ; ignore it
   130E C9 4F         [ 2]  483         cmp     #0x4F                                   ; is it >= 0x4F?
   1310 B0 41         [ 4]  484         bcs     $18                                     ; ignore it
   1312 A6 63         [ 3]  485         ldx     CURR_PORT                               ; X = current board address
   1314 38            [ 2]  486         sec                                             ; (it's 0x41 to 0x4E)
   1315 E9 41         [ 2]  487         sbc     #0x41                                   ; subtract 0x41
   1317 C9 08         [ 2]  488         cmp     #0x08
   1319 90 02         [ 4]  489         bcc     $16                                     ; process as command
   131B E8            [ 2]  490         inx
   131C E8            [ 2]  491         inx
   131D                     492 $16:
   131D 29 07         [ 2]  493         and     #0x07                                   ; lookup bitmask in A
   131F A8            [ 2]  494         tay
   1320 B9 54 13      [ 5]  495         lda     MASKTBL,y
   1323 85 5C         [ 3]  496         sta     SOL_MASK                                ; store mask in SOL_MASK
   1325 A5 5D         [ 3]  497         lda     CURR_CHANNEL
   1327 4A            [ 2]  498         lsr     a                                       ; get on/off in carry
   1328 B0 09         [ 4]  499         bcs     $17                                     ; if on, jump
   132A A5 5C         [ 3]  500         lda     SOL_MASK
   132C 49 FF         [ 2]  501         eor     #0xFF
   132E 35 00         [ 4]  502         and     RAM_start,x
   1330 95 00         [ 4]  503         sta     RAM_start,x                             ; turn off solenoid
   1332 60            [ 6]  504         rts
                            505 ;
   1333                     506 $17:
   1333 A5 5C         [ 3]  507         lda     SOL_MASK
   1335 15 00         [ 4]  508         ora     RAM_start,x
   1337 95 00         [ 4]  509         sta     RAM_start,x                             ; turn on solenoid
   1339 60            [ 6]  510         rts
                            511 ;
   133A                     512 PROCCHNL:
   133A A5 5B         [ 3]  513         lda     TAPE_BYTE                               ; put channel byte in CURR_CHANNEL
   133C 85 5D         [ 3]  514         sta     CURR_CHANNEL
   133E 29 7E         [ 2]  515         and     #0x7E
   1340 C9 22         [ 2]  516         cmp     #0x22
   1342 D0 05         [ 4]  517         bne     CONVCHNL
   1344 A9 98         [ 2]  518         lda     #0x98                                   ; process 0x22 or 0x23
   1346 85 63         [ 3]  519         sta     CURR_PORT                               ; set this to 0x98 - board 7
   1348 60            [ 6]  520         rts
                            521 ;
   1349                     522 CONVCHNL:
   1349 38            [ 2]  523         sec                                             ; process channel
   134A E9 32         [ 2]  524         sbc     #0x32
   134C 0A            [ 2]  525         asl     a
   134D 18            [ 2]  526         clc
   134E 69 80         [ 2]  527         adc     #0x80
   1350 85 63         [ 3]  528         sta     CURR_PORT                               ; (X-0x32) * 2 + 0x80
   1352 60            [ 6]  529         rts
   1353                     530 $18:
   1353 60            [ 6]  531         rts
                            532 ;
                            533 ; bit mask table
                            534 ;
   1354                     535 MASKTBL:
   1354 01 02 04 08         536         .byte   0x01,0x02,0x04,0x08
   1358 10 20 40 80         537         .byte   0x10,0x20,0x40,0x80
                            538 ;
                            539 ; This table is referenced by UART code
                            540 ;
   135C                     541 UTABLE_M1:
   135C 4D 31               542         .byte   'M,'1                                   ; M1
   135E                     543 UTABLE_M2:
   135E 4D 32               544         .byte   'M,'2                                   ; M2
                            545 ;
                            546 ;       Read the AGC mic level
                            547 ;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
                            548 ;
   1360                     549 AGCMICRD:
   1360 A9 00         [ 2]  550         lda     #0x00
   1362 85 60         [ 3]  551         sta     AGC_ACCUM                               ; init final agc value
   1364 85 61         [ 3]  552         sta     AGC_SAMPLES                             ; init agc sample counter
   1366 A9 0A         [ 2]  553         lda     #0x0A
   1368 85 54         [ 3]  554         sta     TIMER_100MS_A                           ; Start a 1 second timer
   136A A9 64         [ 2]  555         lda     #0x64
   136C 85 53         [ 3]  556         sta     TIMER_1MS_R
   136E                     557 $23:
   136E 20 ED 13      [ 6]  558         jsr     KUPDATE                                 ; housekeeping
   1371 A5 54         [ 3]  559         lda     TIMER_100MS_A
   1373 D0 F9         [ 4]  560         bne     $23                                     ; if 1 sec, do housekeeping
   1375 A9 0A         [ 2]  561         lda     #0x0A
   1377 85 54         [ 3]  562         sta     TIMER_100MS_A
   1379 A9 64         [ 2]  563         lda     #0x64
   137B 85 53         [ 3]  564         sta     TIMER_1MS_R                             ; reset timer
   137D A5 61         [ 3]  565         lda     AGC_SAMPLES
   137F C9 08         [ 2]  566         cmp     #0x08                                   ; 8 samples?
   1381 F0 15         [ 4]  567         beq     $27
   1383 E6 61         [ 5]  568         inc     AGC_SAMPLES                             ; increment the sample counter
   1385 A2 09         [ 2]  569         ldx     #0x09
   1387 38            [ 2]  570         sec
   1388 AD 80 03      [ 4]  571         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   138B                     572 $24:                                                    ; read the most significant high bit
   138B 2A            [ 2]  573          rol     a
   138C CA            [ 2]  574         dex
   138D 90 FC         [ 4]  575         bcc     $24
   138F 18            [ 2]  576         clc
   1390 8A            [ 2]  577         txa                                             ; 8=high bit7, 0=no high bits
   1391 65 60         [ 3]  578         adc     AGC_ACCUM                               ; add it into AGC_ACCUM (do this 8 times)
   1393 85 60         [ 3]  579         sta     AGC_ACCUM
   1395 4C 6E 13      [ 3]  580         jmp     $23
                            581 ;
   1398                     582 $27:
   1398 46 60         [ 5]  583         lsr     AGC_ACCUM                               ; divide by 8 (average of 8 samples)
   139A 46 60         [ 5]  584         lsr     AGC_ACCUM
   139C 46 60         [ 5]  585         lsr     AGC_ACCUM
   139E A5 60         [ 3]  586         lda     AGC_ACCUM
   13A0 85 5F         [ 3]  587         sta     AGC_LEVEL                               ; store agc value in AGC_LEVEL
   13A2 A9 00         [ 2]  588         lda     #0x00
   13A4 85 60         [ 3]  589         sta     AGC_ACCUM                               ; clear these 2 and return
   13A6 85 61         [ 3]  590         sta     AGC_SAMPLES
   13A8 60            [ 6]  591         rts
                            592 ;
                            593 ;        Do AGC Mic Logic
                            594 ;
   13A9                     595 AGCUPD:
   13A9 AD 80 02      [ 4]  596         lda     U19_PORTA                               ; read AGC knob
   13AC 49 FF         [ 2]  597         eor     #0xFF                                   ; invert the bits
   13AE 4A            [ 2]  598         lsr     a                                       ; get into lower nibble
   13AF 4A            [ 2]  599         lsr     a
   13B0 4A            [ 2]  600         lsr     a
   13B1 4A            [ 2]  601         lsr     a
   13B2 18            [ 2]  602         clc
   13B3 65 5F         [ 3]  603         adc     AGC_LEVEL                               ; add audio level to it
   13B5 AA            [ 2]  604         tax
   13B6 BD DC 13      [ 5]  605         lda     AGCTABLE,x                              ; and get the table value
   13B9 85 62         [ 3]  606         sta     AGC_GAIN                                ; store this value in AGC_GAIN
   13BB A5 52         [ 3]  607         lda     TIMER_1MS_C                             ; 10ms timer expired?
   13BD D0 16         [ 4]  608         bne     $26                                     ; no, just update CPU Leds
   13BF A9 0A         [ 2]  609         lda     #0x0A
   13C1 85 52         [ 3]  610         sta     TIMER_1MS_C                             ; restart 10ms timer
   13C3 A5 62         [ 3]  611         lda     AGC_GAIN                                ; every 10ms, adjust gain by 1 if needed
   13C5 CD 82 03      [ 4]  612         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   13C8 90 08         [ 4]  613         bcc     $25
   13CA F0 09         [ 4]  614         beq     $26
   13CC EE 82 03      [ 6]  615         inc     audio_periph$ddr_reg_b                  ; increase value
   13CF 4C D5 13      [ 3]  616         jmp     $26
                            617 ;
   13D2                     618 $25:
   13D2 CE 82 03      [ 6]  619         dec     audio_periph$ddr_reg_b                  ; decrease value
   13D5                     620 $26:
   13D5 AD 82 03      [ 4]  621         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   13D8 8D 82 02      [ 4]  622         sta     U19_PORTB
   13DB 60            [ 6]  623         rts
                            624 ;
                            625 ;       AGC table
                            626 ;
   13DC                     627 AGCTABLE:
   13DC 03 04 06 08         628         .db     0x03,0x04,0x06,0x08
   13E0 10 16 20 2D         629         .db     0x10,0x16,0x20,0x2D
   13E4 40 5A 80 BF         630         .db     0x40,0x5A,0x80,0xBF
   13E8 FF FF FF FF         631         .db     0xFF,0xFF,0xFF,0xFF
   13EC FF                  632         .db     0xFF
                            633 ;
                            634 ;       Process King Tables
                            635 ;
   13ED                     636 KUPDATE:
   13ED A5 65         [ 3]  637         lda     KTABLE_OFFS
   13EF AA            [ 2]  638         tax                                             ; KTABLE_OFFS - table offset
   13F0 A5 66         [ 3]  639         lda     KTABLE_SEL                              ; if KTABLE_SEL != 0   
   13F2 D0 37         [ 4]  640         bne     $38                                     ; goto other table                                  
   13F4 BD 59 14      [ 5]  641         lda     KTABLE1,x                               ; else read byte
   13F7 C9 FE         [ 2]  642         cmp     #0xFE                                   ; if it's 0xFE
   13F9 F0 27         [ 4]  643         beq     $37                                     ; goto next table
   13FB C9 FF         [ 2]  644         cmp     #0xFF                                   ; if it's not 0xFF
   13FD D0 0B         [ 4]  645         bne     $35                                     ; check the long timer
   13FF A9 00         [ 2]  646         lda     #0x00                                   ; if it is 0xFF
   1401 85 65         [ 3]  647         sta     KTABLE_OFFS                             ; else clear KTABLE_OFFS
   1403 A9 FA         [ 2]  648         lda     #0xFA   
   1405 85 64         [ 3]  649         sta     TIMER_100MS_C                           ; init 25 second timer
   1407 4C 21 14      [ 3]  650         jmp     $36                                     ; and return
   140A                     651 $35:
   140A C5 64         [ 3]  652         cmp     TIMER_100MS_C
   140C D0 13         [ 4]  653         bne     $36                                     ; if it's not time, return
   140E BD 5A 14      [ 5]  654         lda     KTABLE1+1,x                             ; use two bytes from this table
   1411 20 F6 12      [ 6]  655         jsr     PROCBYTE
   1414 BD 5B 14      [ 5]  656         lda     KTABLE1+2,x
   1417 20 F6 12      [ 6]  657         jsr     PROCBYTE
   141A A5 65         [ 3]  658         lda     KTABLE_OFFS
   141C 18            [ 2]  659         clc
   141D 69 03         [ 2]  660         adc     #0x03
   141F 85 65         [ 3]  661         sta     KTABLE_OFFS                             ; add 3 to KTABLE_OFFS and return
   1421                     662 $36:
   1421 60            [ 6]  663         rts
   1422                     664 $37:
   1422 E6 66         [ 5]  665         inc     KTABLE_SEL                              ; add 1 to KTABLE_SEL
   1424 A9 00         [ 2]  666         lda     #0x00
   1426 85 65         [ 3]  667         sta     KTABLE_OFFS                             ; clear KTABLE_OFFS
   1428 4C 21 14      [ 3]  668         jmp     $36                                     ; return
   142B                     669 $38:
   142B BD 43 15      [ 5]  670         lda     KTABLE2,x
   142E C9 FF         [ 2]  671         cmp     #0xFF
   1430 D0 0D         [ 4]  672         bne     $39
   1432 A9 00         [ 2]  673         lda     #0x00
   1434 85 65         [ 3]  674         sta     KTABLE_OFFS
   1436 85 66         [ 3]  675         sta     KTABLE_SEL
   1438 A9 FA         [ 2]  676         lda     #0xFA
   143A 85 64         [ 3]  677         sta     TIMER_100MS_C
   143C 4C 21 14      [ 3]  678         jmp     $36
   143F                     679 $39:
   143F C5 64         [ 3]  680         cmp     TIMER_100MS_C
   1441 D0 DE         [ 4]  681         bne     $36
   1443 BD 44 15      [ 5]  682         lda     KTABLE2+1,x
   1446 20 F6 12      [ 6]  683         jsr     PROCBYTE
   1449 BD 45 15      [ 5]  684         lda     KTABLE2+2,x
   144C 20 F6 12      [ 6]  685         jsr     PROCBYTE
   144F A5 65         [ 3]  686         lda     KTABLE_OFFS
   1451 18            [ 2]  687         clc
   1452 69 03         [ 2]  688         adc     #0x03
   1454 85 65         [ 3]  689         sta     KTABLE_OFFS
   1456 4C 21 14      [ 3]  690         jmp     $36
                            691 ;
                            692 ;       Table of bytes to process
                            693 ;
   1459                     694 KTABLE1:
   1459 F5 35 49 F5 35 4A   695         .byte   0xF5,0x35,0x49, 0xF5,0x35,0x4A, 0xEE,0x35,0x46, 0xEB,0x33,0x46 
        EE 35 46 EB 33 46
   1465 E9 32 46 E9 33 42   696         .byte   0xE9,0x32,0x46, 0xE9,0x33,0x42, 0xE8,0x33,0x46, 0xE7,0x32,0x46
        E8 33 46 E7 32 46
   1471 E6 33 46 E5 32 46   697         .byte   0xE6,0x33,0x46, 0xE5,0x32,0x46, 0xE4,0x33,0x46, 0xE3,0x32,0x46
        E4 33 46 E3 32 46
   147D E2 33 46 E1 32 46   698         .byte   0xE2,0x33,0x46, 0xE1,0x32,0x46, 0xE0,0x33,0x46, 0xDF,0x32,0x46
        E0 33 46 DF 32 46
   1489 DE 33 46 DD 32 46   699         .byte   0xDE,0x33,0x46, 0xDD,0x32,0x46, 0xDD,0x34,0x46, 0xDC,0x33,0x46
        DD 34 46 DC 33 46
   1495 DB 32 46 DB 35 46   700         .byte   0xDB,0x32,0x46, 0xDB,0x35,0x46, 0xDA,0x33,0x46, 0xD9,0x32,0x46
        DA 33 46 D9 32 46
   14A1 D1 32 42 C6 33 47   701         .byte   0xD1,0x32,0x42, 0xC6,0x33,0x47, 0xC6,0x33,0x43, 0xC5,0x32,0x47
        C6 33 43 C5 32 47
   14AD C3 34 46 C2 33 47   702         .byte   0xC3,0x34,0x46, 0xC2,0x33,0x47, 0xC1,0x32,0x47, 0xC0,0x35,0x46
        C1 32 47 C0 35 46
   14B9 B9 34 46 B9 32 43   703         .byte   0xB9,0x34,0x46, 0xB9,0x32,0x43, 0xB7,0x35,0x46, 0xB7,0x33,0x42
        B7 35 46 B7 33 42
   14C5 B3 33 46 B2 32 46   704         .byte   0xB3,0x33,0x46, 0xB2,0x32,0x46, 0xA8,0x32,0x42, 0x9D,0x33,0x47
        A8 32 42 9D 33 47
   14D1 9C 32 47 9B 33 47   705         .byte   0x9C,0x32,0x47, 0x9B,0x33,0x47, 0x9A,0x32,0x47, 0x9A,0x34,0x46
        9A 32 47 9A 34 46
   14DD 99 33 47 99 33 43   706         .byte   0x99,0x33,0x47, 0x99,0x33,0x43, 0x99,0x35,0x46, 0x98,0x32,0x47
        99 35 46 98 32 47
   14E9 97 33 47 94 32 47   707         .byte   0x97,0x33,0x47, 0x94,0x32,0x47, 0x93,0x33,0x47, 0x92,0x32,0x47
        93 33 47 92 32 47
   14F5 91 33 47 90 32 47   708         .byte   0x91,0x33,0x47, 0x90,0x32,0x47, 0x87,0x33,0x42, 0x86,0x32,0x43
        87 33 42 86 32 43
   1501 7D 33 46 7C 32 46   709         .byte   0x7D,0x33,0x46, 0x7C,0x32,0x46, 0x77,0x32,0x42, 0x77,0x34,0x46
        77 32 42 77 34 46
   150D 75 32 43 75 35 46   710         .byte   0x75,0x32,0x43, 0x75,0x35,0x46, 0x6A,0x33,0x46, 0x69,0x32,0x46
        6A 33 46 69 32 46
   1519 67 33 46 66 32 46   711         .byte   0x67,0x33,0x46, 0x66,0x32,0x46, 0x66,0x32,0x43, 0x65,0x34,0x46
        66 32 43 65 34 46
   1525 62 35 46 62 33 42   712         .byte   0x62,0x35,0x46, 0x62,0x33,0x42, 0x56,0x33,0x46, 0x55,0x32,0x46
        56 33 46 55 32 46
   1531 55 32 42 54 33 46   713         .byte   0x55,0x32,0x42, 0x54,0x33,0x46, 0x53,0x32,0x46, 0x52,0x33,0x46
        53 32 46 52 33 46
   153D 51 32 46 FE FE FE   714         .byte   0x51,0x32,0x46, 0xFE,0xFE,0xFE
                            715 
   1543                     716 KTABLE2:
   1543 50 33 46 4F 32 46   717         .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        4E 33 46 4E 33 42
   154F 4D 32 46 4C 33 46   718         .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        4B 32 46 40 34 46
   155B 3E 35 46 3C 33 47   719         .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        3B 32 47 3A 33 47
   1567 39 32 47 32 32 42   720         .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        29 34 46 28 32 47
   1573 27 35 46 26 33 43   721         .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        23 33 47 22 32 47
   157F 1E 33 42 1D 32 43   722         .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        1B 33 47 1A 32 47
   158B 19 33 47 18 32 47   723         .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        17 34 46 17 33 47
   1597 17 32 42 16 32 47   724         .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        15 35 46 15 33 43
   15A3 08 32 43 03 33 46   725         .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        02 32 46 02 34 46
   15AF FF FF FF FF FF FF   726         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
                            727 
   1FFA                     728         .org    0x1FFA
                            729         ;
                            730         ; vectors
                            731         ;
   1FFA                     732 NMIVEC:
   1FFA FF FF               733         .dw     0xFFFF
   1FFC                     734 RESETVEC:
   1FFC 48 10               735         .dw     RESET
   1FFE                     736 IRQVEC:
   1FFE 00 10               737         .dw     IRQ
