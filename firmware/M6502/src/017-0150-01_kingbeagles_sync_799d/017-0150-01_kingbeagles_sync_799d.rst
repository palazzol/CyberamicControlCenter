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
                             41 ; UART / Board Select 11 - 6850?
                     0101    42 UART_01                         = 0x0101    ; 6850 Control Register
                     0102    43 UART_02                         = 0x0102    ; 6850 Data Register
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
   100E F0 02         [ 4]   44         beq     $50
   1010 C6 50         [ 5]   45         dec     TIMER_1MS_A
   1012                      46 $50:
   1012 A5 51         [ 3]   47         lda     TIMER_1MS_B                             ; 1ms timer
   1014 F0 02         [ 4]   48         beq     $51
   1016 C6 51         [ 5]   49         dec     TIMER_1MS_B
   1018                      50 $51:
   1018 A5 52         [ 3]   51         lda     TIMER_1MS_C                             ; 1ms timer
   101A F0 02         [ 4]   52         beq     $52
   101C C6 52         [ 5]   53         dec     TIMER_1MS_C
   101E                      54 $52:
   101E C6 53         [ 5]   55         dec     TIMER_1MS_R
   1020 D0 24         [ 4]   56         bne     $56
   1022 A9 64         [ 2]   57         lda     #0x64
   1024 85 53         [ 3]   58         sta     TIMER_1MS_R
   1026 A5 54         [ 3]   59         lda     TIMER_100MS_A
   1028 F0 02         [ 4]   60         beq     $53
   102A C6 54         [ 5]   61         dec     TIMER_100MS_A
   102C                      62 $53:
   102C A5 64         [ 3]   63         lda     TIMER_100MS_C
   102E F0 02         [ 4]   64         beq     $54
   1030 C6 64         [ 5]   65         dec     TIMER_100MS_C
   1032                      66 $54:
   1032 A5 55         [ 3]   67         lda     TIMER_100MS_B
   1034 F0 02         [ 4]   68         beq     $55
   1036 C6 55         [ 5]   69         dec     TIMER_100MS_B
   1038                      70 $55:
   1038 C6 56         [ 5]   71         dec     TIMER_100MS_R
   103A D0 0A         [ 4]   72         bne     $56
   103C A9 64         [ 2]   73         lda     #0x64
   103E 85 56         [ 3]   74         sta     TIMER_100MS_R
   1040 A5 57         [ 3]   75         lda     TIMER_10S
   1042 F0 02         [ 4]   76         beq     $56
   1044 C6 57         [ 5]   77         dec     TIMER_10S
   1046                      78 $56:
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
   10B3 8D 02 01      [ 4]  132         sta     UART_02                                 ; 6850 Master Reset
   10B6 EA            [ 2]  133         nop                                             ; Wait a bit
   10B7 A9 09         [ 2]  134         lda     #0x09
   10B9 8D 02 01      [ 4]  135         sta     UART_02                                 ; 000 010 01
                            136                                                         ;  |   |   |__ div by 16 
                            137                                                         ;  |   |______ 7E1 
                            138                                                         ;  |__________ all interrupts disabled 
   10BC A9 10         [ 2]  139         lda     #TAPEMODE_STOP
   10BE 20 34 12      [ 6]  140         jsr     TAPECMD                                 ; STOP tape
   10C1 A9 28         [ 2]  141         lda     #0x28                                   ; this will count 4 seconds
   10C3 85 54         [ 3]  142         sta     TIMER_100MS_A
   10C5 A9 64         [ 2]  143         lda     #0x64                                   ; reset master timer
   10C7 85 53         [ 3]  144         sta     TIMER_1MS_R
   10C9                     145 $1:
   10C9 A5 54         [ 3]  146         lda     TIMER_100MS_A                           ; do not much for 4 seconds
   10CB D0 FC         [ 4]  147         bne     $1
   10CD 20 01 12      [ 6]  148         jsr     INITBRDS
   10D0                     149 REWIND:
   10D0 A9 FA         [ 2]  150         lda     #0xFA
   10D2 85 64         [ 3]  151         sta     TIMER_100MS_C
   10D4 A9 00         [ 2]  152         lda     #0x00
   10D6 85 65         [ 3]  153         sta     KTABLE_OFFS
   10D8 85 66         [ 3]  154         sta     KTABLE_SEL
   10DA A9 30         [ 2]  155         lda     #0x30
   10DC A9 40         [ 2]  156         lda     #TAPEMODE_REWIND
   10DE 20 34 12      [ 6]  157         jsr     TAPECMD                                 ; REWIND tape
   10E1                     158 $22:
   10E1 A9 00         [ 2]  159         lda     #0x00
   10E3 85 58         [ 3]  160         sta     ZEROCROSS_CTR                           ; counter to zero
   10E5                     161 $3:
   10E5 AD 02 03      [ 4]  162         lda     transport_periph$ddr_reg_b
   10E8 A9 0A         [ 2]  163         lda     #0x0A
   10EA 85 50         [ 3]  164         sta     TIMER_1MS_A                             ; set a 10ms timer
   10EC E6 58         [ 5]  165         inc     ZEROCROSS_CTR                           ; count transitions
   10EE A5 58         [ 3]  166         lda     ZEROCROSS_CTR
   10F0 C9 64         [ 2]  167         cmp     #0x64
   10F2 B0 0F         [ 4]  168         bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
   10F4                     169 $4:
   10F4 20 F3 13      [ 6]  170         jsr     KUPDATE
   10F7 A5 50         [ 3]  171         lda     TIMER_1MS_A
   10F9 F0 E6         [ 4]  172         beq     $22
   10FB AD 03 03      [ 4]  173         lda     transport_control_reg_b
   10FE 10 F4         [ 4]  174         bpl     $4
   1100 4C E5 10      [ 3]  175         jmp     $3
                            176 ;
   1103                     177 FINDTRK:
   1103 A9 20         [ 2]  178         lda     #TAPEMODE_FFWD
   1105 20 34 12      [ 6]  179         jsr     TAPECMD                                 ; FFWD tape
   1108 A9 19         [ 2]  180         lda     #0x19
   110A 85 54         [ 3]  181         sta     TIMER_100MS_A                           ; 2.5 secs
   110C A9 64         [ 2]  182         lda     #0x64
   110E 85 53         [ 3]  183         sta     TIMER_1MS_R
   1110                     184 $5:
   1110 20 F3 13      [ 6]  185         jsr     KUPDATE
   1113 A5 54         [ 3]  186         lda     TIMER_100MS_A
   1115 D0 F9         [ 4]  187         bne     $5
   1117 A9 00         [ 2]  188         lda     #0x00
   1119 85 59         [ 3]  189         sta     TRACK_CTR
   111B 20 4F 12      [ 6]  190         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   111E A9 40         [ 2]  191         lda     #TAPEMODE_REWIND
   1120 20 34 12      [ 6]  192         jsr     TAPECMD                                 ; REWIND tape
   1123 20 4F 12      [ 6]  193         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1126 A9 FA         [ 2]  194         lda     #0xFA
   1128 85 50         [ 3]  195         sta     TIMER_1MS_A
   112A                     196 $30:
   112A 20 F3 13      [ 6]  197         jsr     KUPDATE
   112D A5 50         [ 3]  198         lda     TIMER_1MS_A
   112F D0 F9         [ 4]  199         bne     $30                                     ; delay for 250 ms
   1131 A9 20         [ 2]  200         lda     #TAPEMODE_FFWD
   1133 20 34 12      [ 6]  201         jsr     TAPECMD
   1136 20 4F 12      [ 6]  202         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1139 E6 59         [ 5]  203         inc     TRACK_CTR
   113B A9 10         [ 2]  204         lda     #TAPEMODE_STOP
   113D 20 34 12      [ 6]  205         jsr     TAPECMD                                 ; STOP tape
   1140 A9 80         [ 2]  206         lda     #TAPEMODE_PLAY
   1142 20 34 12      [ 6]  207         jsr     TAPECMD                                 ; PLAY tape
   1145 20 72 12      [ 6]  208         jsr     WAITCD                                  ; wait for carrier
   1148 A9 10         [ 2]  209         lda     #TAPEMODE_STOP
   114A 20 34 12      [ 6]  210         jsr     TAPECMD                                 ; STOP Tape
   114D                     211 WAITPLAY:
   114D A9 64         [ 2]  212         lda     #<UTABLE_M2
   114F 85 69         [ 3]  213         sta     UART_ADDR
   1151 A9 13         [ 2]  214         lda     #>UTABLE_M2
   1153 85 6A         [ 3]  215         sta     UART_ADDR+1                             ; set UTABLE address
   1155 20 AF 13      [ 6]  216         jsr     AGCUPD
   1158 20 F3 13      [ 6]  217         jsr     KUPDATE
   115B 20 D9 12      [ 6]  218         jsr     UARTPROC
   115E AD 02 01      [ 4]  219         lda     UART_02
   1161 29 05         [ 2]  220         and     #0x05                                   ; bit 0 = rcv data, bit 2 = ~DCD pin
   1163 F0 23         [ 4]  221         beq     $46
   1165 A5 67         [ 3]  222         lda     UART_RBYTE
   1167 D0 0C         [ 4]  223         bne     $45
   1169 AD 01 01      [ 4]  224         lda     UART_01
   116C C9 53         [ 2]  225         cmp     #'S                                     ; 'S' - start command?
   116E D0 18         [ 4]  226         bne     $46
   1170 E6 67         [ 5]  227         inc     UART_RBYTE
   1172 4C 88 11      [ 3]  228         jmp     $46
   1175                     229 $45:
   1175 A9 00         [ 2]  230         lda     #0x00
   1177 85 67         [ 3]  231         sta     UART_RBYTE
   1179 AD 01 01      [ 4]  232         lda     UART_01
   117C C9 31         [ 2]  233         cmp     #'1                                     ; '1' - 2nd byte startplay command?
   117E F0 36         [ 4]  234         beq     STARTPLAY
   1180 C9 32         [ 2]  235         cmp     #'2                                     ; '2' - 2nd byte lights command?
   1182 F0 0A         [ 4]  236         beq     $47
   1184 C9 33         [ 2]  237         cmp     #'3                                     ; '3' - 2nd byte lights command?
   1186 F0 1B         [ 4]  238         beq     $48
   1188                     239 $46:
   1188 4C 4D 11      [ 3]  240         jmp     WAITPLAY
   118B 4C D0 10      [ 3]  241         jmp     REWIND
                            242 ; lights to all ones
   118E                     243 $47:
   118E A9 FF         [ 2]  244         lda     #0xFF
   1190 85 98         [ 3]  245         sta     board_7_periph$ddr_reg_a
   1192 85 9A         [ 3]  246         sta     board_7_periph$ddr_reg_b
   1194 85 9C         [ 3]  247         sta     board_8_periph$ddr_reg_a
   1196 85 9E         [ 3]  248         sta     board_8_periph$ddr_reg_b
   1198 8D 02 02      [ 4]  249         sta     U18_PORTB
   119B A9 02         [ 2]  250         lda     #0x02
   119D 8D 80 02      [ 4]  251         sta     U19_PORTA
   11A0 4C 4D 11      [ 3]  252         jmp     WAITPLAY
                            253 ; lights to all zeros
   11A3                     254 $48:
   11A3 A9 00         [ 2]  255         lda     #0x00
   11A5 85 98         [ 3]  256         sta     board_7_periph$ddr_reg_a
   11A7 85 9A         [ 3]  257         sta     board_7_periph$ddr_reg_b
   11A9 85 9C         [ 3]  258         sta     board_8_periph$ddr_reg_a
   11AB 85 9E         [ 3]  259         sta     board_8_periph$ddr_reg_b
   11AD 8D 02 02      [ 4]  260         sta     U18_PORTB
   11B0 8D 80 02      [ 4]  261         sta     U19_PORTA
   11B3 4C 4D 11      [ 3]  262         jmp     WAITPLAY
                            263 
                            264 ;   we have been started!
   11B6                     265 STARTPLAY:
   11B6 20 01 12      [ 6]  266         jsr     INITBRDS
   11B9 A9 62         [ 2]  267         lda     #<UTABLE_M1
   11BB 85 69         [ 3]  268         sta     UART_ADDR
   11BD A9 13         [ 2]  269         lda     #>UTABLE_M1
   11BF 85 6A         [ 3]  270         sta     UART_ADDR+1                             ; set UTABLE address
   11C1 A9 00         [ 2]  271         lda     #0x00
   11C3 8D 80 02      [ 4]  272         sta     U19_PORTA                               ; turn off RESET button light
   11C6 A9 A0         [ 2]  273         lda     #0xA0
   11C8 8D 02 02      [ 4]  274         sta     U18_PORTB                               ; turn off some lights - TBD
   11CB A9 80         [ 2]  275         lda     #TAPEMODE_PLAY
   11CD 20 34 12      [ 6]  276         jsr     TAPECMD                                 ; PLAY tape
   11D0 20 72 12      [ 6]  277         jsr     WAITCD                                  ; wait for carrier
   11D3 20 98 12      [ 6]  278         jsr     PLAYTRK                                 ; play a track!
   11D6 20 01 12      [ 6]  279         jsr     INITBRDS                                ; init the boards
   11D9 A9 80         [ 2]  280         lda     #0x80
   11DB 8D 02 02      [ 4]  281         sta     U18_PORTB                               ; turn off all but PROG light
   11DE E6 59         [ 5]  282         inc     TRACK_CTR                               ; track counter
   11E0 A5 59         [ 3]  283         lda     TRACK_CTR
   11E2 C9 1A         [ 2]  284         cmp     #0x1A                                   ; 26?
   11E4 90 03         [ 4]  285         bcc     NEXTTRK
   11E6 4C D0 10      [ 3]  286         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
   11E9                     287 NEXTTRK:
   11E9 A9 00         [ 2]  288         lda     #0x00
   11EB 85 65         [ 3]  289         sta     KTABLE_OFFS
   11ED 85 66         [ 3]  290         sta     KTABLE_SEL
   11EF A9 FA         [ 2]  291         lda     #0xFA
   11F1 85 64         [ 3]  292         sta     TIMER_100MS_C
   11F3 20 72 12      [ 6]  293         jsr     WAITCD                                  ; wait for carrier
   11F6 A9 10         [ 2]  294         lda     #TAPEMODE_STOP
   11F8 20 34 12      [ 6]  295         jsr     TAPECMD                                 ; STOP tape
   11FB 20 66 13      [ 6]  296         jsr     AGCMICRD                                ; Read the AGC mic level
   11FE 4C 4D 11      [ 3]  297         jmp     WAITPLAY
                            298 ;
                            299 ;       Init boards
                            300 ;
   1201                     301 INITBRDS:
   1201 A9 3C         [ 2]  302         lda     #0x3C
   1203 8D 83 03      [ 4]  303         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1206 A9 34         [ 2]  304         lda     #0x34
   1208 8D 81 03      [ 4]  305         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   120B A2 00         [ 2]  306         ldx     #0x00
   120D                     307 NEXTBRD:
   120D A9 30         [ 2]  308         lda     #0x30
   120F 95 81         [ 4]  309         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1211 95 83         [ 4]  310         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1213 A9 FF         [ 2]  311         lda     #0xFF
   1215 95 80         [ 4]  312         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1217 95 82         [ 4]  313         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1219 A9 34         [ 2]  314         lda     #0x34
   121B 95 81         [ 4]  315         sta     board_1_control_reg_a,x                 ; A peripheral selected
   121D 95 83         [ 4]  316         sta     board_1_control_reg_b,x                 ; B peripheral selected
   121F A9 00         [ 2]  317         lda     #0x00
   1221 95 80         [ 4]  318         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1223 95 82         [ 4]  319         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1225 E8            [ 2]  320         inx
   1226 E8            [ 2]  321         inx
   1227 E8            [ 2]  322         inx
   1228 E8            [ 2]  323         inx
   1229 E0 20         [ 2]  324         cpx     #0x20                                   ; do for boards 1-8
   122B 90 E0         [ 4]  325         bcc     NEXTBRD
   122D A9 00         [ 2]  326         lda     #0x00                                   ; bug fix!
   122F 85 5D         [ 3]  327         sta     CURR_CHANNEL                            ; reset current channel serial byte
   1231 85 63         [ 3]  328         sta     CURR_PORT                               ; reset current channel port address
   1233 60            [ 6]  329         rts
                            330 ;
                            331 ;       Send Transport command for 0.250 sec
                            332 ;       (Unified)
                            333 ;
   1234                     334 TAPECMD:
   1234 8D 02 03      [ 4]  335         sta     transport_periph$ddr_reg_b              ; enable output line
   1237 A9 FA         [ 2]  336         lda     #0xFA
   1239 85 50         [ 3]  337         sta     TIMER_1MS_A
   123B                     338 $6:
   123B 20 F3 13      [ 6]  339         jsr     KUPDATE                                 ; housekeeping
   123E A5 50         [ 3]  340         lda     TIMER_1MS_A
   1240 D0 F9         [ 4]  341         bne     $6
   1242 AD 02 03      [ 4]  342         lda     transport_periph$ddr_reg_b
   1245 29 60         [ 2]  343         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1247 D0 05         [ 4]  344         bne     $31                                     ; Yes, go to exit
   1249 A9 00         [ 2]  345         lda     #0x00                                   ; else unassert STOP or PLAY
   124B 8D 02 03      [ 4]  346         sta     transport_periph$ddr_reg_b              ; and then exit
   124E                     347 $31:
   124E 60            [ 6]  348         rts
                            349 ;
                            350 ;       Wait for tone during Fast Forward, signaling beginning of track
                            351 ;       (50Hz or above, for 33 zero crossing) 
                            352 ;
   124F                     353 WAITTONE:
   124F A9 00         [ 2]  354         lda     #0x00
   1251 85 58         [ 3]  355         sta     ZEROCROSS_CTR
   1253                     356 $8:
   1253 AD 02 03      [ 4]  357         lda     transport_periph$ddr_reg_b
   1256 A9 0A         [ 2]  358         lda     #0x0A
   1258 85 50         [ 3]  359         sta     TIMER_1MS_A                             ; 10 msec
   125A E6 58         [ 5]  360         inc     ZEROCROSS_CTR
   125C A5 58         [ 3]  361         lda     ZEROCROSS_CTR
   125E C9 21         [ 2]  362         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   1260 B0 0F         [ 4]  363         bcs     $10                                     ; timeout - exit
   1262                     364 $9:
   1262 20 F3 13      [ 6]  365         jsr     KUPDATE
   1265 A5 50         [ 3]  366         lda     TIMER_1MS_A
   1267 F0 E6         [ 4]  367         beq     WAITTONE                                ; 10 msec done yet? then loop
   1269 AD 03 03      [ 4]  368         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   126C 10 F4         [ 4]  369         bpl     $9                                      ; if not, extend the looping
   126E 4C 53 12      [ 3]  370         jmp     $8                                      ; else loop but keep timeout going
                            371 
   1271                     372 $10:
   1271 60            [ 6]  373         rts
                            374 ;
                            375 ;       Wait for carrier / start of data
                            376 ;
                            377 
                            378 ; Wait for 250ms
   1272                     379 WAITCD:
   1272 A9 FA         [ 2]  380         lda     #0xFA
   1274 85 50         [ 3]  381         sta     TIMER_1MS_A                             ; 250 msec
   1276                     382 $11:
   1276 20 F3 13      [ 6]  383         jsr     KUPDATE
   1279 A5 50         [ 3]  384         lda     TIMER_1MS_A
   127B D0 F9         [ 4]  385         bne     $11
                            386 
                            387 ; Wait for 160ms of consecutive zero crossings
   127D                     388 $12:
   127D 20 F3 13      [ 6]  389         jsr     KUPDATE
   1280 AD 02 03      [ 4]  390         lda     transport_periph$ddr_reg_b
   1283 6A            [ 2]  391         ror
   1284 90 F7         [ 4]  392         bcc     $12
   1286 A9 A0         [ 2]  393         lda     #0xA0                                   ; 160 msec
   1288 85 50         [ 3]  394         sta     TIMER_1MS_A
   128A                     395 $13:
   128A 20 F3 13      [ 6]  396         jsr     KUPDATE
   128D AD 02 03      [ 4]  397         lda     transport_periph$ddr_reg_b
   1290 6A            [ 2]  398         ror
   1291 90 EA         [ 4]  399         bcc     $12
   1293 A5 50         [ 3]  400         lda     TIMER_1MS_A
   1295 D0 F3         [ 4]  401         bne     $13
   1297 60            [ 6]  402         rts
                            403 ;
                            404 ;       Play a track
                            405 ;
   1298                     406 PLAYTRK:
   1298 AD 00 03      [ 4]  407         lda     transport_periph$ddr_reg_a
   129B A9 40         [ 2]  408         lda     #0x40
   129D 85 82         [ 3]  409         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   129F 85 86         [ 3]  410         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   12A1 85 8A         [ 3]  411         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   12A3 85 8E         [ 3]  412         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   12A5 A9 3C         [ 2]  413         lda     #0x3C
   12A7 8D 81 03      [ 4]  414         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   12AA A9 34         [ 2]  415         lda     #0x34
   12AC 8D 83 03      [ 4]  416         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   12AF A9 60         [ 2]  417         lda     #0x60
   12B1 85 82         [ 3]  418         sta     board_1_periph$ddr_reg_b                ; ???
   12B3                     419 $14:
   12B3 AD 02 03      [ 4]  420         lda     transport_periph$ddr_reg_b
   12B6 4A            [ 2]  421         lsr     a
   12B7 90 11         [ 4]  422         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   12B9 20 D9 12      [ 6]  423         jsr     UARTPROC                                ; ??? Unknown UART routine
   12BC 20 AF 13      [ 6]  424         jsr     AGCUPD
   12BF AD 01 03      [ 4]  425         lda     transport_control_reg_a                 ; Did we get a byte?
   12C2 10 EF         [ 4]  426         bpl     $14                                     ; No, loop
   12C4 20 F9 12      [ 6]  427         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   12C7 4C B3 12      [ 3]  428         jmp     $14
                            429 
                            430 ;       Lost carrier - wait 100 msec for more data before giving up
   12CA                     431 LOSTCD:
   12CA A9 64         [ 2]  432         lda     #0x64                                   ; 100 msec
   12CC 85 50         [ 3]  433         sta     TIMER_1MS_A
   12CE                     434 $15:
   12CE AD 02 03      [ 4]  435         lda     transport_periph$ddr_reg_b
   12D1 4A            [ 2]  436         lsr
   12D2 B0 C4         [ 4]  437         bcs     PLAYTRK                                 ; carrier
   12D4 A5 50         [ 3]  438         lda     TIMER_1MS_A
   12D6 D0 F6         [ 4]  439         bne     $15
   12D8 60            [ 6]  440         rts
                            441 ;
                            442 ;   TBD - Unknown UART routine
                            443 ;   Send first or second byte from the UART table to UART_01
                            444 ;
   12D9                     445 UARTPROC:
   12D9 AD 02 01      [ 4]  446         lda     UART_02                                 ; check UART_02.bit2 == 0
   12DC 29 02         [ 2]  447         and     #0x02                                   ; transmit register empty reg
   12DE F0 18         [ 4]  448         beq     $42                                     ; if so, return
   12E0 A5 68         [ 3]  449         lda     UART_SBYTE                              ; else, check byte number
   12E2 D0 09         [ 4]  450         bne     $40
   12E4 A0 00         [ 2]  451         ldy     #0x00
   12E6 B1 69         [ 6]  452         lda     [UART_ADDR],y                           ; send first byte
   12E8 E6 68         [ 5]  453         inc     UART_SBYTE
   12EA 4C F5 12      [ 3]  454         jmp     $41
   12ED                     455 $40:
   12ED A9 00         [ 2]  456         lda     #0x00
   12EF 85 68         [ 3]  457         sta     UART_SBYTE
   12F1 A0 01         [ 2]  458         ldy     #0x01
   12F3 B1 69         [ 6]  459         lda     [UART_ADDR],y                           ; send second byte
   12F5                     460 $41:
   12F5 8D 01 01      [ 4]  461         sta     UART_01
   12F8                     462 $42:
   12F8 60            [ 6]  463         rts
                            464 ;
                            465 ; Protocol handler
                            466 ;
   12F9                     467 PROTOHAND:
   12F9 AD 00 03      [ 4]  468         lda     transport_periph$ddr_reg_a
   12FC                     469 PROCBYTE:
   12FC 29 7F         [ 2]  470         and     #0x7F                                   ; insure data is ASCII
   12FE 85 5B         [ 3]  471         sta     TAPE_BYTE                               ; store it here
   1300 29 7E         [ 2]  472         and     #0x7E                                   ; ignore bottom bit
   1302 C9 22         [ 2]  473         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1304 F0 3A         [ 4]  474         beq     PROCCHNL                                ; if so, process as channel
   1306 C9 32         [ 2]  475         cmp     #0x32                                   ; is it < 0x32 ?
   1308 90 4F         [ 4]  476         bcc     $18                                     ; ignore it
   130A C9 3A         [ 2]  477         cmp     #0x3A                                   ; is it < 0x3A
   130C 90 32         [ 4]  478         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   130E A5 5B         [ 3]  479         lda     TAPE_BYTE
   1310 C9 41         [ 2]  480         cmp     #0x41                                   ; is it < 0x41?
   1312 90 45         [ 4]  481         bcc     $18                                     ; ignore it
   1314 C9 4F         [ 2]  482         cmp     #0x4F                                   ; is it >= 0x4F?
   1316 B0 41         [ 4]  483         bcs     $18                                     ; ignore it
   1318 A6 63         [ 3]  484         ldx     CURR_PORT                               ; X = current board address
   131A 38            [ 2]  485         sec                                             ; (it's 0x41 to 0x4E)
   131B E9 41         [ 2]  486         sbc     #0x41                                   ; subtract 0x41
   131D C9 08         [ 2]  487         cmp     #0x08
   131F 90 02         [ 4]  488         bcc     $16                                     ; process as command
   1321 E8            [ 2]  489         inx
   1322 E8            [ 2]  490         inx
   1323                     491 $16:
   1323 29 07         [ 2]  492         and     #0x07                                   ; lookup bitmask in A
   1325 A8            [ 2]  493         tay
   1326 B9 5A 13      [ 5]  494         lda     MASKTBL,y
   1329 85 5C         [ 3]  495         sta     SOL_MASK                                ; store mask in SOL_MASK
   132B A5 5D         [ 3]  496         lda     CURR_CHANNEL
   132D 4A            [ 2]  497         lsr     a                                       ; get on/off in carry
   132E B0 09         [ 4]  498         bcs     $17                                     ; if on, jump
   1330 A5 5C         [ 3]  499         lda     SOL_MASK
   1332 49 FF         [ 2]  500         eor     #0xFF
   1334 35 00         [ 4]  501         and     RAM_start,x
   1336 95 00         [ 4]  502         sta     RAM_start,x                             ; turn off solenoid
   1338 60            [ 6]  503         rts
                            504 ;
   1339                     505 $17:
   1339 A5 5C         [ 3]  506         lda     SOL_MASK
   133B 15 00         [ 4]  507         ora     RAM_start,x
   133D 95 00         [ 4]  508         sta     RAM_start,x                             ; turn on solenoid
   133F 60            [ 6]  509         rts
                            510 ;
   1340                     511 PROCCHNL:
   1340 A5 5B         [ 3]  512         lda     TAPE_BYTE                               ; put channel byte in CURR_CHANNEL
   1342 85 5D         [ 3]  513         sta     CURR_CHANNEL
   1344 29 7E         [ 2]  514         and     #0x7E
   1346 C9 22         [ 2]  515         cmp     #0x22
   1348 D0 05         [ 4]  516         bne     CONVCHNL
   134A A9 98         [ 2]  517         lda     #0x98                                   ; process 0x22 or 0x23
   134C 85 63         [ 3]  518         sta     CURR_PORT                               ; set this to 0x98 - board 7
   134E 60            [ 6]  519         rts
                            520 ;
   134F                     521 CONVCHNL:
   134F 38            [ 2]  522         sec                                             ; process channel
   1350 E9 32         [ 2]  523         sbc     #0x32
   1352 0A            [ 2]  524         asl     a
   1353 18            [ 2]  525         clc
   1354 69 80         [ 2]  526         adc     #0x80
   1356 85 63         [ 3]  527         sta     CURR_PORT                               ; (X-0x32) * 2 + 0x80
   1358 60            [ 6]  528         rts
   1359                     529 $18:
   1359 60            [ 6]  530         rts
                            531 ;
                            532 ; bit mask table
                            533 ;
   135A                     534 MASKTBL:
   135A 01 02 04 08         535         .byte   0x01,0x02,0x04,0x08
   135E 10 20 40 80         536         .byte   0x10,0x20,0x40,0x80
                            537 ;
                            538 ; This table is referenced by UART code
                            539 ;
   1362                     540 UTABLE_M1:
   1362 4D 31               541         .byte   'M,'1                                   ; M1
   1364                     542 UTABLE_M2:
   1364 4D 32               543         .byte   'M,'2                                   ; M2
                            544 ;
                            545 ;       Read the AGC mic level
                            546 ;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
                            547 ;
   1366                     548 AGCMICRD:
   1366 A9 00         [ 2]  549         lda     #0x00
   1368 85 60         [ 3]  550         sta     AGC_ACCUM                               ; init final agc value
   136A 85 61         [ 3]  551         sta     AGC_SAMPLES                             ; init agc sample counter
   136C A9 0A         [ 2]  552         lda     #0x0A
   136E 85 54         [ 3]  553         sta     TIMER_100MS_A                           ; Start a 1 second timer
   1370 A9 64         [ 2]  554         lda     #0x64
   1372 85 53         [ 3]  555         sta     TIMER_1MS_R
   1374                     556 $23:
   1374 20 F3 13      [ 6]  557         jsr     KUPDATE                                 ; housekeeping
   1377 A5 54         [ 3]  558         lda     TIMER_100MS_A
   1379 D0 F9         [ 4]  559         bne     $23                                     ; if 1 sec, do housekeeping
   137B A9 0A         [ 2]  560         lda     #0x0A
   137D 85 54         [ 3]  561         sta     TIMER_100MS_A
   137F A9 64         [ 2]  562         lda     #0x64
   1381 85 53         [ 3]  563         sta     TIMER_1MS_R                             ; reset timer
   1383 A5 61         [ 3]  564         lda     AGC_SAMPLES
   1385 C9 08         [ 2]  565         cmp     #0x08                                   ; 8 samples?
   1387 F0 15         [ 4]  566         beq     $27
   1389 E6 61         [ 5]  567         inc     AGC_SAMPLES                             ; increment the sample counter
   138B A2 09         [ 2]  568         ldx     #0x09
   138D 38            [ 2]  569         sec
   138E AD 80 03      [ 4]  570         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1391                     571 $24:                                                    ; read the most significant high bit
   1391 2A            [ 2]  572         rol     a
   1392 CA            [ 2]  573         dex
   1393 90 FC         [ 4]  574         bcc     $24
   1395 18            [ 2]  575         clc
   1396 8A            [ 2]  576         txa                                             ; 8=high bit7, 0=no high bits
   1397 65 60         [ 3]  577         adc     AGC_ACCUM                               ; add it into AGC_ACCUM (do this 8 times)
   1399 85 60         [ 3]  578         sta     AGC_ACCUM
   139B 4C 74 13      [ 3]  579         jmp     $23
                            580 ;
   139E                     581 $27:
   139E 46 60         [ 5]  582         lsr     AGC_ACCUM                               ; divide by 8 (average of 8 samples)
   13A0 46 60         [ 5]  583         lsr     AGC_ACCUM
   13A2 46 60         [ 5]  584         lsr     AGC_ACCUM
   13A4 A5 60         [ 3]  585         lda     AGC_ACCUM
   13A6 85 5F         [ 3]  586         sta     AGC_LEVEL                               ; store agc value in AGC_LEVEL
   13A8 A9 00         [ 2]  587         lda     #0x00
   13AA 85 60         [ 3]  588         sta     AGC_ACCUM                               ; clear these 2 and return
   13AC 85 61         [ 3]  589         sta     AGC_SAMPLES
   13AE 60            [ 6]  590         rts
                            591 ;
                            592 ;        Do AGC Mic Logic
                            593 ;
   13AF                     594 AGCUPD:
   13AF AD 80 02      [ 4]  595         lda     U19_PORTA                               ; read AGC knob
   13B2 49 FF         [ 2]  596         eor     #0xFF                                   ; invert the bits
   13B4 4A            [ 2]  597         lsr     a                                       ; get into lower nibble
   13B5 4A            [ 2]  598         lsr     a
   13B6 4A            [ 2]  599         lsr     a
   13B7 4A            [ 2]  600         lsr     a
   13B8 18            [ 2]  601         clc
   13B9 65 5F         [ 3]  602         adc     AGC_LEVEL                               ; add audio level to it
   13BB AA            [ 2]  603         tax
   13BC BD E2 13      [ 5]  604         lda     AGCTABLE,x                              ; and get the table value
   13BF 85 62         [ 3]  605         sta     AGC_GAIN                                ; store this value in AGC_GAIN
   13C1 A5 52         [ 3]  606         lda     TIMER_1MS_C                             ; 10ms timer expired?
   13C3 D0 16         [ 4]  607         bne     $26                                     ; no, just update CPU Leds
   13C5 A9 0A         [ 2]  608         lda     #0x0A
   13C7 85 52         [ 3]  609         sta     TIMER_1MS_C                             ; restart 10ms timer
   13C9 A5 62         [ 3]  610         lda     AGC_GAIN                                ; every 10ms, adjust gain by 1 if needed
   13CB CD 82 03      [ 4]  611         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   13CE 90 08         [ 4]  612         bcc     $25
   13D0 F0 09         [ 4]  613         beq     $26
   13D2 EE 82 03      [ 6]  614         inc     audio_periph$ddr_reg_b                  ; increase value
   13D5 4C DB 13      [ 3]  615         jmp     $26
                            616 ;
   13D8                     617 $25:
   13D8 CE 82 03      [ 6]  618         dec     audio_periph$ddr_reg_b                  ; decrease value
   13DB                     619 $26:
   13DB AD 82 03      [ 4]  620         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   13DE 8D 82 02      [ 4]  621         sta     U19_PORTB
   13E1 60            [ 6]  622         rts
                            623 ;
                            624 ;       AGC table
                            625 ;
   13E2                     626 AGCTABLE:
   13E2 03 04 06 08         627         .db     0x03, 0x04, 0x06, 0x08
   13E6 10 16 20 2D         628         .db     0x10, 0x16, 0x20, 0x2D
   13EA 40 5A 80 BF         629         .db     0x40, 0x5A, 0x80, 0xBF
   13EE FF FF FF FF         630         .db     0xFF, 0xFF, 0xFF, 0xFF
   13F2 FF                  631         .db     0xFF
                            632 ;
                            633 ;       Process King Tables
                            634 ;
   13F3                     635 KUPDATE:
   13F3 A5 65         [ 3]  636         lda     KTABLE_OFFS
   13F5 AA            [ 2]  637         tax                                             ; KTABLE_OFFS - table offset
   13F6 A5 66         [ 3]  638         lda     KTABLE_SEL                              ; if KTABLE_SEL != 0   
   13F8 D0 37         [ 4]  639         bne     $38                                     ; goto other table                                  
   13FA BD 5F 14      [ 5]  640         lda     KTABLE1,x                               ; else read byte
   13FD C9 FE         [ 2]  641         cmp     #0xFE                                   ; if it's 0xFE
   13FF F0 27         [ 4]  642         beq     $37                                     ; goto next table
   1401 C9 FF         [ 2]  643         cmp     #0xFF                                   ; if it's not 0xFF
   1403 D0 0B         [ 4]  644         bne     $35                                     ; check the long timer
   1405 A9 00         [ 2]  645         lda     #0x00                                   ; if it is 0xFF
   1407 85 65         [ 3]  646         sta     KTABLE_OFFS                             ; else clear KTABLE_OFFS
   1409 A9 FA         [ 2]  647         lda     #0xFA   
   140B 85 64         [ 3]  648         sta     TIMER_100MS_C                           ; init 25 second timer
   140D 4C 27 14      [ 3]  649         jmp     $36                                     ; and return
   1410                     650 $35:
   1410 C5 64         [ 3]  651         cmp     TIMER_100MS_C
   1412 D0 13         [ 4]  652         bne     $36                                     ; if it's not time, return
   1414 BD 60 14      [ 5]  653         lda     KTABLE1+1,x                             ; use two bytes from this table
   1417 20 FC 12      [ 6]  654         jsr     PROCBYTE
   141A BD 61 14      [ 5]  655         lda     KTABLE1+2,x
   141D 20 FC 12      [ 6]  656         jsr     PROCBYTE
   1420 A5 65         [ 3]  657         lda     KTABLE_OFFS
   1422 18            [ 2]  658         clc
   1423 69 03         [ 2]  659         adc     #0x03
   1425 85 65         [ 3]  660         sta     KTABLE_OFFS                             ; add 3 to KTABLE_OFFS and return
   1427                     661 $36:
   1427 60            [ 6]  662         rts
   1428                     663 $37:
   1428 E6 66         [ 5]  664         inc     KTABLE_SEL                              ; add 1 to KTABLE_SEL
   142A A9 00         [ 2]  665         lda     #0x00
   142C 85 65         [ 3]  666         sta     KTABLE_OFFS                             ; clear KTABLE_OFFS
   142E 4C 27 14      [ 3]  667         jmp     $36                                     ; return
   1431                     668 $38:
   1431 BD 49 15      [ 5]  669         lda     KTABLE2,x
   1434 C9 FF         [ 2]  670         cmp     #0xFF
   1436 D0 0D         [ 4]  671         bne     $39
   1438 A9 00         [ 2]  672         lda     #0x00
   143A 85 65         [ 3]  673         sta     KTABLE_OFFS
   143C 85 66         [ 3]  674         sta     KTABLE_SEL
   143E A9 FA         [ 2]  675         lda     #0xFA
   1440 85 64         [ 3]  676         sta     TIMER_100MS_C
   1442 4C 27 14      [ 3]  677         jmp     $36
   1445                     678 $39:
   1445 C5 64         [ 3]  679         cmp     TIMER_100MS_C
   1447 D0 DE         [ 4]  680         bne     $36
   1449 BD 4A 15      [ 5]  681         lda     KTABLE2+1,x
   144C 20 FC 12      [ 6]  682         jsr     PROCBYTE
   144F BD 4B 15      [ 5]  683         lda     KTABLE2+2,x
   1452 20 FC 12      [ 6]  684         jsr     PROCBYTE
   1455 A5 65         [ 3]  685         lda     KTABLE_OFFS
   1457 18            [ 2]  686         clc
   1458 69 03         [ 2]  687         adc     #0x03
   145A 85 65         [ 3]  688         sta     KTABLE_OFFS
   145C 4C 27 14      [ 3]  689         jmp     $36
                            690 ;
                            691 ;       Table of bytes to process
                            692 ;
   145F                     693 KTABLE1:
   145F F5 35 49 F5 35 4A   694         .byte   0xF5,0x35,0x49, 0xF5,0x35,0x4A, 0xEE,0x35,0x46, 0xEB,0x33,0x46
        EE 35 46 EB 33 46
   146B E9 32 46 E9 33 42   695         .byte   0xE9,0x32,0x46, 0xE9,0x33,0x42, 0xE8,0x33,0x46, 0xE7,0x32,0x46
        E8 33 46 E7 32 46
   1477 E6 33 46 E5 32 46   696         .byte   0xE6,0x33,0x46, 0xE5,0x32,0x46, 0xE4,0x33,0x46, 0xE3,0x32,0x46
        E4 33 46 E3 32 46
   1483 E2 33 46 E1 32 46   697         .byte   0xE2,0x33,0x46, 0xE1,0x32,0x46, 0xE0,0x33,0x46, 0xDF,0x32,0x46
        E0 33 46 DF 32 46
   148F DE 33 46 DD 32 46   698         .byte   0xDE,0x33,0x46, 0xDD,0x32,0x46, 0xDD,0x34,0x46, 0xDC,0x33,0x46
        DD 34 46 DC 33 46
   149B DB 32 46 DB 35 46   699         .byte   0xDB,0x32,0x46, 0xDB,0x35,0x46, 0xDA,0x33,0x46, 0xD9,0x32,0x46
        DA 33 46 D9 32 46
   14A7 D1 32 42 C6 33 47   700         .byte   0xD1,0x32,0x42, 0xC6,0x33,0x47, 0xC6,0x33,0x43, 0xC5,0x32,0x47
        C6 33 43 C5 32 47
   14B3 C3 34 46 C2 33 47   701         .byte   0xC3,0x34,0x46, 0xC2,0x33,0x47, 0xC1,0x32,0x47, 0xC0,0x35,0x46
        C1 32 47 C0 35 46
   14BF B9 34 46 B9 32 43   702         .byte   0xB9,0x34,0x46, 0xB9,0x32,0x43, 0xB7,0x35,0x46, 0xB7,0x33,0x42
        B7 35 46 B7 33 42
   14CB B3 33 46 B2 32 46   703         .byte   0xB3,0x33,0x46, 0xB2,0x32,0x46, 0xA8,0x32,0x42, 0x9D,0x33,0x47
        A8 32 42 9D 33 47
   14D7 9C 32 47 9B 33 47   704         .byte   0x9C,0x32,0x47, 0x9B,0x33,0x47, 0x9A,0x32,0x47, 0x9A,0x34,0x46
        9A 32 47 9A 34 46
   14E3 99 33 47 99 33 43   705         .byte   0x99,0x33,0x47, 0x99,0x33,0x43, 0x99,0x35,0x46, 0x98,0x32,0x47
        99 35 46 98 32 47
   14EF 97 33 47 94 32 47   706         .byte   0x97,0x33,0x47, 0x94,0x32,0x47, 0x93,0x33,0x47, 0x92,0x32,0x47
        93 33 47 92 32 47
   14FB 91 33 47 90 32 47   707         .byte   0x91,0x33,0x47, 0x90,0x32,0x47, 0x87,0x33,0x42, 0x86,0x32,0x43
        87 33 42 86 32 43
   1507 7D 33 46 7C 32 46   708         .byte   0x7D,0x33,0x46, 0x7C,0x32,0x46, 0x77,0x32,0x42, 0x77,0x34,0x46
        77 32 42 77 34 46
   1513 75 32 43 75 35 46   709         .byte   0x75,0x32,0x43, 0x75,0x35,0x46, 0x6A,0x33,0x46, 0x69,0x32,0x46
        6A 33 46 69 32 46
   151F 67 33 46 66 32 46   710         .byte   0x67,0x33,0x46, 0x66,0x32,0x46, 0x66,0x32,0x43, 0x65,0x34,0x46
        66 32 43 65 34 46
   152B 62 35 46 62 33 42   711         .byte   0x62,0x35,0x46, 0x62,0x33,0x42, 0x56,0x33,0x46, 0x55,0x32,0x46
        56 33 46 55 32 46
   1537 55 32 42 54 33 46   712         .byte   0x55,0x32,0x42, 0x54,0x33,0x46, 0x53,0x32,0x46, 0x52,0x33,0x46
        53 32 46 52 33 46
   1543 51 32 46 FE FE FE   713         .byte   0x51,0x32,0x46, 0xFE,0xFE,0xFE
                            714 
   1549                     715 KTABLE2:
   1549 50 33 46 4F 32 46   716         .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        4E 33 46 4E 33 42
   1555 4D 32 46 4C 33 46   717         .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        4B 32 46 40 34 46
   1561 3E 35 46 3C 33 47   718         .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        3B 32 47 3A 33 47
   156D 39 32 47 32 32 42   719         .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        29 34 46 28 32 47
   1579 27 35 46 26 33 43   720         .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        23 33 47 22 32 47
   1585 1E 33 42 1D 32 43   721         .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        1B 33 47 1A 32 47
   1591 19 33 47 18 32 47   722         .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        17 34 46 17 33 47
   159D 17 32 42 16 32 47   723         .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        15 35 46 15 33 43
   15A9 08 32 43 03 33 46   724         .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        02 32 46 02 34 46
   15B5 FF FF FF FF FF FF   725         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
                            726 
   1FFA                     727         .org    0x1FFA
                            728         ;
                            729         ; vectors
                            730         ;
   1FFA                     731 NMIVEC:
   1FFA FF FF               732         .dw     0xFFFF
   1FFC                     733 RESETVEC:
   1FFC 48 10               734         .dw     RESET
   1FFE                     735 IRQVEC:
   1FFE 00 10               736         .dw     IRQ
