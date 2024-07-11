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
                     0030    12 RAM_30   = 0x0030
                     0031    13 RAM_31   = 0x0031
                     0032    14 RAM_32   = 0x0032
                     0033    15 RAM_33   = 0x0033
                             16 
                             17 ; Table Addresses go here
                     0034    18 RAM_34   = 0x0034
                     0035    19 RAM_35   = 0x0035
                     0036    20 RAM_36   = 0x0036
                     0037    21 RAM_37   = 0x0037
                     0038    22 RAM_38   = 0x0038
                     0039    23 RAM_39   = 0x0039
                     003A    24 RAM_3A   = 0x003A
                     003B    25 RAM_3B   = 0x003B
                     003C    26 RAM_3C   = 0x003C
                     003D    27 RAM_3D   = 0x003D
                             28 
                             29 ; IRQ timer section 1
                     003E    30 RAM_3E   = 0x003E           ; r/100
                     003F    31 RAM_3F   = 0x003F           ; r/100
                     0040    32 RAM_40   = 0x0040           ; r/100
                     0041    33 RAM_41   = 0x0041           ; r/100
                     0042    34 RAM_42   = 0x0042           ; r/100
                             35 
                     0044    36 RAM_44   = 0x0044
                     0045    37 RAM_45   = 0x0045
                     0046    38 RAM_46   = 0x0046
                     0047    39 RAM_47   = 0x0047
                     0048    40 RAM_48   = 0x0048
                     0049    41 RAM_49   = 0x0049
                     004A    42 RAM_4A   = 0x004A
                             43 
                             44 ; IRQ timer section 2
                     004B    45 RAM_4B   = 0x004B           ; r
                     004C    46 RAM_4C   = 0x004C           ; r
                     004D    47 RAM_4D   = 0x004D           ; r
                     004E    48 RAM_4E   = 0x004E           ; r, autoload to 100
                     004F    49 RAM_4F   = 0x004F           ; r/100
                     0050    50 RAM_50   = 0x0050           ; r/100
                     0051    51 RAM_51   = 0x0051           ; r/100
                     0052    52 RAM_52   = 0x0052           ; r/100, autoload to 100
                     0053    53 RAM_53   = 0x0053           ; r/10000
                             54 
                     0055    55 RAM_55   = 0x0055
                     0056    56 RAM_56   = 0x0056           ; expected program number?
                     0057    57 RAM_57   = 0x0057
                     0058    58 RAM_58   = 0x0058
                     0059    59 RAM_59   = 0x0059
                     005A    60 RAM_5A   = 0x005A
                     005B    61 RAM_5B   = 0x005B
                     005C    62 RAM_5C   = 0x005C
                     005D    63 RAM_5D   = 0x005D
                     005E    64 RAM_5E   = 0x005E
                     005F    65 RAM_5F   = 0x005F
                     0060    66 RAM_60   = 0x0060
                     0061    67 RAM_61   = 0x0061
                     0062    68 RAM_62   = 0x0062
                     0063    69 RAM_63   = 0x0063
                     0064    70 RAM_64   = 0x0064   ; Command byte
                     0065    71 RAM_65   = 0x0065   ; Channel byte
                     0066    72 RAM_66   = 0x0066   ; Two byte address of current memory
                     0067    73 RAM_67   = 0x0067   ;   address to write to cards
                     0068    74 RAM_68   = 0x0068   ; Current Bitmask
                     0069    75 RAM_69   = 0x0069
                     006A    76 RAM_6A   = 0x006A
                     006B    77 RAM_6B   = 0x006B
                     006C    78 RAM_6C   = 0x006C
                     006D    79 RAM_6D   = 0x006D
                             80 
                     0070    81 RAM_70   = 0x0070
                             82 
                             83         .include "../include/ptt6502.def"
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
                             84 
   1000                      85         .org    0x1000
                             86 ;
                             87 ;       IRQ handler
                             88 ;
   1000                      89 IRQ:
   1000 48            [ 3]   90         pha
   1001 AD 05 02      [ 4]   91         lda     U18_edge_detect_control_DI_pos  ; clear PA7 flag
   1004 AD 85 02      [ 4]   92         lda     U19_edge_detect_control_DI_pos  ; clear PA7 flag
   1007 A9 7D         [ 2]   93         lda     #0x7D
   1009 8D 1D 02      [ 4]   94         sta     U18_1D                      ; div by 8, enable interrupt
   100C A5 4B         [ 3]   95         lda     RAM_4B                      ; timer
   100E F0 02         [ 4]   96         beq     L1012
   1010 C6 4B         [ 5]   97         dec     RAM_4B
   1012                      98 L1012:
   1012 A5 4C         [ 3]   99         lda     RAM_4C                   ; timer
   1014 F0 02         [ 4]  100         beq     L1018
   1016 C6 4C         [ 5]  101         dec     RAM_4C
   1018                     102 L1018:
   1018 A5 4D         [ 3]  103         lda     RAM_4D                   ; timer
   101A F0 02         [ 4]  104         beq     L101E
   101C C6 4D         [ 5]  105         dec     RAM_4D
   101E                     106 L101E:
   101E C6 4E         [ 5]  107         dec     RAM_4E                   ; timer
   1020 D0 42         [ 4]  108         bne     L1064
   1022 A9 64         [ 2]  109         lda     #0x64
   1024 85 4E         [ 3]  110         sta     RAM_4E
   1026 A5 4F         [ 3]  111         lda     RAM_4F                   ; timer
   1028 F0 02         [ 4]  112         beq     L102C
   102A C6 4F         [ 5]  113         dec     RAM_4F
   102C                     114 L102C:
   102C A5 50         [ 3]  115         lda     RAM_50                   ; timer
   102E F0 02         [ 4]  116         beq     L1032
   1030 C6 50         [ 5]  117         dec     RAM_50
   1032                     118 L1032:
   1032 A5 51         [ 3]  119         lda     RAM_51                   ; timer
   1034 F0 02         [ 4]  120         beq     L1038
   1036 C6 51         [ 5]  121         dec     RAM_51
   1038                     122 L1038:
   1038 A5 3E         [ 3]  123         lda     RAM_3E                   ; timer
   103A F0 02         [ 4]  124         beq     L103E
   103C C6 3E         [ 5]  125         dec     RAM_3E
   103E                     126 L103E:
   103E A5 3F         [ 3]  127         lda     RAM_3F                   ; timer
   1040 F0 02         [ 4]  128         beq     L1044
   1042 C6 3F         [ 5]  129         dec     RAM_3F
   1044                     130 L1044:
   1044 A5 40         [ 3]  131         lda     RAM_40                   ; timer
   1046 F0 02         [ 4]  132         beq     L104A
   1048 C6 40         [ 5]  133         dec     RAM_40
   104A                     134 L104A:
   104A A5 41         [ 3]  135         lda     RAM_41                   ; timer
   104C F0 02         [ 4]  136         beq     L1050
   104E C6 41         [ 5]  137         dec     RAM_41
   1050                     138 L1050:
   1050 A5 42         [ 3]  139         lda     RAM_42                   ; timer
   1052 F0 02         [ 4]  140         beq     L1056
   1054 C6 42         [ 5]  141         dec     RAM_42
   1056                     142 L1056:
   1056 C6 52         [ 5]  143         dec     RAM_52                   ; timer
   1058 D0 0A         [ 4]  144         bne     L1064
   105A A9 64         [ 2]  145         lda     #0x64
   105C 85 52         [ 3]  146         sta     RAM_52
   105E A5 53         [ 3]  147         lda     RAM_53                   ; timer
   1060 F0 02         [ 4]  148         beq     L1064
   1062 C6 53         [ 5]  149         dec     RAM_53
   1064                     150 L1064:
   1064 68            [ 4]  151         pla
   1065 40            [ 6]  152         rti
                            153 ;
                            154 ;       Main Program Start
                            155 ;
   1066                     156 RESET:
   1066 D8            [ 2]  157         cld                                             ; No decimal mode
   1067 78            [ 2]  158         sei                                             ; Interrupts are not used
   1068 A2 F0         [ 2]  159         ldx     #0xF0                                   ; Stack is at 0x01F0
   106A 9A            [ 2]  160         txs
   106B A9 00         [ 2]  161         lda     #0x00                                   ; Clear RAM
   106D A2 10         [ 2]  162         ldx     #0x10                                   ; from 0x0010 to 0x007F
   106F                     163 ZERORAM:
   106F 95 00         [ 4]  164         sta     RAM_start,x
   1071 E8            [ 2]  165         inx
   1072 E0 80         [ 2]  166         cpx     #0x80
   1074 D0 F9         [ 4]  167         bne     ZERORAM
   1076 A9 00         [ 2]  168         lda     #0x00                                   ; Initialize these registers to 0x00
   1078 8D 01 03      [ 4]  169         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   107B 8D 02 02      [ 4]  170         sta     U18_PORTB                               ; CPU board lights off
   107E 8D 81 03      [ 4]  171         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1081 8D 83 03      [ 4]  172         sta     audio_control_reg_b                     ; Clear audio control B, select DDRB
   1084 8D 05 02      [ 4]  173         sta     U18_edge_detect_control_DI_pos          ; ???
   1087 8D 85 02      [ 4]  174         sta     U19_edge_detect_control_DI_pos          ; ???
   108A 8D 06 02      [ 4]  175         sta     U18_06                                  ; ???
   108D 8D 86 02      [ 4]  176         sta     U19_06                                  ; ???
   1090 8D 03 03      [ 4]  177         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1093 8D 01 02      [ 4]  178         sta     U18_DDRA                                ; Buttons are inputs
   1096 A9 02         [ 2]  179         lda     #0x02
   1098 8D 81 02      [ 4]  180         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   109B 8D 80 02      [ 4]  181         sta     U19_PORTA                               ; turn on RESET button light
   109E A9 FF         [ 2]  182         lda     #0xFF
   10A0 8D 82 03      [ 4]  183         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   10A3 8D 03 02      [ 4]  184         sta     U18_DDRB                                ; Button lights are outputs
   10A6 8D 83 02      [ 4]  185         sta     U19_DDRB                                ; CPU card lights are outputs
   10A9 A9 FC         [ 2]  186         lda     #0xFC
   10AB 8D 02 03      [ 4]  187         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   10AE A9 2E         [ 2]  188         lda     #0x2E
   10B0 8D 01 03      [ 4]  189         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   10B3 8D 03 03      [ 4]  190         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   10B6 A9 3C         [ 2]  191         lda     #0x3C
   10B8 8D 83 03      [ 4]  192         sta     audio_control_reg_b                     ; CA2 High - Disable BG Audio
   10BB 8D 81 03      [ 4]  193         sta     audio_control_reg_a                     ; CB2 high - Disable Tape Audio
   10BE A9 10         [ 2]  194         lda     #0x10
   10C0 8D 82 03      [ 4]  195         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs - bit 4 only?
   10C3 8D 82 02      [ 4]  196         sta     U19_PORTB                               ; turn on CPU LEDs 5
   10C6 A9 00         [ 2]  197         lda     #0x00
   10C8 85 5E         [ 3]  198         sta     RAM_5E
   10CA A9 64         [ 2]  199         lda     #0x64
   10CC 85 4E         [ 3]  200         sta     RAM_4E
   10CE 58            [ 2]  201         cli
   10CF 8D 1C 02      [ 4]  202         sta     U18_1C
   10D2 A9 09         [ 2]  203         lda     #0x09
   10D4 8D 02 01      [ 4]  204         sta     UART_02
   10D7 20 FC 18      [ 6]  205         jsr     L18FC
   10DA 20 99 16      [ 6]  206         jsr     L1699
   10DD A9 02         [ 2]  207         lda     #0x02
   10DF 8D 80 02      [ 4]  208         sta     U19_PORTA
   10E2 A9 33         [ 2]  209         lda     #0x33
   10E4 20 0F 17      [ 6]  210         jsr     L170F
   10E7 A9 10         [ 2]  211         lda     #TAPEMODE_STOP
   10E9 20 8C 15      [ 6]  212         jsr     TAPECMD                                 ; STOP tape
   10EC A9 28         [ 2]  213         lda     #0x28
   10EE 85 4F         [ 3]  214         sta     RAM_4F
   10F0                     215 L10F0:
   10F0 20 39 19      [ 6]  216         jsr     L1939
   10F3 A5 4F         [ 3]  217         lda     RAM_4F
   10F5 D0 F9         [ 4]  218         bne     L10F0
   10F7 20 99 16      [ 6]  219         jsr     L1699
   10FA 20 AA 18      [ 6]  220         jsr     L18AA
   10FD AD 00 02      [ 4]  221         lda     U18_PORTA
   1100 49 FF         [ 2]  222         eor     #0xFF
   1102 C9 10         [ 2]  223         cmp     #0x10                                   ; DIAG pushed?
   1104 D0 15         [ 4]  224         bne     L111B                                   ; if not, jump ahead
   1106 A9 FF         [ 2]  225         lda     #0xFF
   1108 85 98         [ 3]  226         sta     board_7_periph$ddr_reg_a                ; all lights on?
   110A 85 9A         [ 3]  227         sta     board_7_periph$ddr_reg_b
   110C 85 9C         [ 3]  228         sta     board_8_periph$ddr_reg_a
   110E 85 9E         [ 3]  229         sta     board_8_periph$ddr_reg_b
   1110 8D 02 02      [ 4]  230         sta     U18_PORTB
   1113                     231 L1113:
   1113 A9 32         [ 2]  232         lda     #0x32
   1115 20 0F 17      [ 6]  233         jsr     L170F
   1118 4C 13 11      [ 3]  234         jmp     L1113
                            235 ;
   111B                     236 L111B:
   111B A9 40         [ 2]  237         lda     #TAPEMODE_REWIND
   111D 20 8C 15      [ 6]  238         jsr     TAPECMD                                 ; REWIND tape
   1120 A5 55         [ 3]  239         lda     RAM_55
   1122 8D 82 02      [ 4]  240         sta     U19_PORTB
   1125                     241 L1125:
   1125 A9 00         [ 2]  242         lda     #0x00
   1127 85 59         [ 3]  243         sta     RAM_59
   1129                     244 L1129:
   1129 AD 02 03      [ 4]  245         lda     transport_periph$ddr_reg_b
   112C A9 0A         [ 2]  246         lda     #0x0A
   112E 85 4B         [ 3]  247         sta     RAM_4B
   1130 E6 59         [ 5]  248         inc     RAM_59
   1132 A5 59         [ 3]  249         lda     RAM_59
   1134 C9 64         [ 2]  250         cmp     #0x64
   1136 B0 0F         [ 4]  251         bcs     L1147
   1138                     252 L1138:
   1138 20 39 19      [ 6]  253         jsr     L1939
   113B A5 4B         [ 3]  254         lda     RAM_4B
   113D F0 E6         [ 4]  255         beq     L1125
   113F AD 03 03      [ 4]  256         lda     transport_control_reg_b
   1142 10 F4         [ 4]  257         bpl     L1138
   1144 4C 29 11      [ 3]  258         jmp     L1129
                            259 ;
   1147                     260 L1147:
   1147 A9 20         [ 2]  261         lda     #TAPEMODE_FFWD
   1149 20 8C 15      [ 6]  262         jsr     TAPECMD                                 ; FFWD tape
   114C A9 19         [ 2]  263         lda     #0x19
   114E 85 4F         [ 3]  264         sta     RAM_4F                                  ; 2.5 secs?
   1150                     265 L1150:
   1150 20 39 19      [ 6]  266         jsr     L1939
   1153 A5 4F         [ 3]  267         lda     RAM_4F
   1155 D0 F9         [ 4]  268         bne     L1150
   1157 A9 00         [ 2]  269         lda     #0x00
   1159 85 55         [ 3]  270         sta     RAM_55
   115B A9 01         [ 2]  271         lda     #0x01
   115D 85 56         [ 3]  272         sta     RAM_56                                  ; set expected program number to 1?
   115F 85 57         [ 3]  273         sta     RAM_57
   1161 20 C7 14      [ 6]  274         jsr     L14C7
   1164 A9 80         [ 2]  275         lda     #TAPEMODE_PLAY
   1166 20 8C 15      [ 6]  276         jsr     TAPECMD                                 ; PLAY tape
   1169 20 2C 15      [ 6]  277         jsr     L152C
   116C A9 96         [ 2]  278         lda     #0x96
   116E 85 4F         [ 3]  279         sta     RAM_4F
   1170 A9 80         [ 2]  280         lda     #TAPEMODE_PLAY
   1172 20 8C 15      [ 6]  281         jsr     TAPECMD                                 ; PLAY tape
   1175 20 8C 15      [ 6]  282         jsr     TAPECMD                                 ; PLAY tape
   1178                     283 L1178:
   1178 20 F1 11      [ 6]  284         jsr     L11F1                                   ; loop until 0x24 received
   117B C9 24         [ 2]  285         cmp     #0x24
   117D D0 F9         [ 4]  286         bne     L1178
   117F                     287 L117F:
   117F 20 F1 11      [ 6]  288         jsr     L11F1                                   ; eat any additional 0x24 received
   1182 C9 24         [ 2]  289         cmp     #0x24
   1184 F0 F9         [ 4]  290         beq     L117F
   1186 29 3F         [ 2]  291         and     #0x3F                                   ; else compare to number
   1188 C5 56         [ 3]  292         cmp     RAM_56
   118A F0 07         [ 4]  293         beq     L1193                                   ; if match, jump
   118C 4C 66 10      [ 3]  294         jmp     RESET                                   ; else reset
                            295 ;
   118F A9 00         [ 2]  296         lda     #0x00
   1191 85 49         [ 3]  297         sta     RAM_49
   1193                     298 L1193:
   1193 20 F1 11      [ 6]  299         jsr     L11F1                                   ; eat chars until a 0x28
   1196 C9 28         [ 2]  300         cmp     #0x28
   1198 D0 F9         [ 4]  301         bne     L1193
   119A 20 F1 11      [ 6]  302         jsr     L11F1                                   ; get a character
   119D C9 47         [ 2]  303         cmp     #0x47                                   ; < 0x47, jump
   119F 90 2B         [ 4]  304         bcc     L11CC
   11A1 C9 5A         [ 2]  305         cmp     #0x5A                                   ; >= 0x5A
   11A3 B0 27         [ 4]  306         bcs     L11CC
   11A5 29 1F         [ 2]  307         and     #0x1F                                   ; only bottom 5 bits used
   11A7 A2 00         [ 2]  308         ldx     #0x00
   11A9 A0 00         [ 2]  309         ldy     #0x00
                            310 ; process 0x47 to 0x59 which is now 0x07 to 0x19
   11AB                     311 L11AB:                                                  
   11AB 95 70         [ 4]  312         sta     RAM_70,x                                ; queue this value
   11AD E8            [ 2]  313         inx
   11AE 20 F1 11      [ 6]  314         jsr     L11F1                                   ; get another value
   11B1 D9 E9 11      [ 5]  315         cmp     X11E9,y                                 ; find it in this table
   11B4 F0 F5         [ 4]  316         beq     L11AB   
   11B6 C8            [ 2]  317         iny                                             ; if found, jump to queue it
   11B7 D9 E9 11      [ 5]  318         cmp     X11E9,y                                 ; else keep looking
   11BA D0 10         [ 4]  319         bne     L11CC
   11BC C0 07         [ 2]  320         cpy     #0x07
   11BE D0 EB         [ 4]  321         bne     L11AB
   11C0 CA            [ 2]  322         dex
   11C1 E4 70         [ 3]  323         cpx     RAM_70
   11C3 D0 07         [ 4]  324         bne     L11CC
   11C5 A9 00         [ 2]  325         lda     #0x00
   11C7 85 49         [ 3]  326         sta     RAM_49
   11C9 4C 11 12      [ 3]  327         jmp     L1211
                            328 ;
   11CC                     329 L11CC:
   11CC A5 49         [ 3]  330         lda     RAM_49
   11CE F0 12         [ 4]  331         beq     L11E2
   11D0                     332 L11D0:
   11D0 A9 FF         [ 2]  333         lda     #0xFF
   11D2 85 49         [ 3]  334         sta     RAM_49
   11D4 8D 02 02      [ 4]  335         sta     U18_PORTB
   11D7 8D 82 02      [ 4]  336         sta     U19_PORTB
   11DA A9 10         [ 2]  337         lda     #TAPEMODE_STOP
   11DC 20 8C 15      [ 6]  338         jsr     TAPECMD                                 ; STOP tape
   11DF 4C D0 11      [ 3]  339         jmp     L11D0
                            340 ;
   11E2                     341 L11E2:
   11E2 A9 80         [ 2]  342         lda     #0x80
   11E4 85 49         [ 3]  343         sta     RAM_49
   11E6 4C 93 11      [ 3]  344         jmp     L1193
                            345 ;
   11E9                     346 X11E9:
   11E9 44 52 42 43 53 49   347         .ascii  "DRBCSIR)"
        52 29
                            348 ;
   11F1                     349 L11F1:
   11F1 A5 4F         [ 3]  350         lda     RAM_4F
   11F3 F0 0B         [ 4]  351         beq     L1200
   11F5 AD 01 03      [ 4]  352         lda     transport_control_reg_a                 ; Wait for Transport Byte
   11F8 10 F7         [ 4]  353         bpl     L11F1
   11FA AD 00 03      [ 4]  354         lda     transport_periph$ddr_reg_a              ; Read Transport Byte
   11FD 29 7F         [ 2]  355         and     #0x7F
   11FF 60            [ 6]  356         rts
                            357 ;
   1200                     358 L1200:
   1200 A5 49         [ 3]  359         lda     RAM_49
   1202 F0 03         [ 4]  360         beq     L1207
   1204 4C D0 11      [ 3]  361         jmp     L11D0
                            362 ;
   1207                     363 L1207:
   1207 A9 0F         [ 2]  364         lda     #0x0F
   1209 85 49         [ 3]  365         sta     RAM_49
   120B A9 02         [ 2]  366         lda     #0x02
   120D 85 57         [ 3]  367         sta     RAM_57
   120F 68            [ 4]  368         pla
   1210 68            [ 4]  369         pla
   1211                     370 L1211:
   1211 20 FC 18      [ 6]  371         jsr     L18FC
   1214 A9 02         [ 2]  372         lda     #0x02
   1216 85 56         [ 3]  373         sta     RAM_56
   1218 20 C7 14      [ 6]  374         jsr     L14C7
   121B A9 00         [ 2]  375         lda     #0x00
   121D 8D 80 02      [ 4]  376         sta     U19_PORTA
   1220 A9 00         [ 2]  377         lda     #0x00
   1222 85 63         [ 3]  378         sta     RAM_63
   1224                     379 L1224:
   1224 A9 18         [ 2]  380         lda     #0x18
   1226 85 53         [ 3]  381         sta     RAM_53
   1228                     382 L1228:
   1228 A9 0A         [ 2]  383         lda     #0x0A
   122A 85 4F         [ 3]  384         sta     RAM_4F
   122C                     385 L122C:
   122C 20 39 19      [ 6]  386         jsr     L1939
   122F A5 63         [ 3]  387         lda     RAM_63
   1231 30 03         [ 4]  388         bmi     L1236
   1233 20 33 16      [ 6]  389         jsr     L1633
   1236                     390 L1236:
   1236 A5 6B         [ 3]  391         lda     RAM_6B
   1238 30 47         [ 4]  392         bmi     L1281
   123A D0 11         [ 4]  393         bne     L124D
   123C A9 64         [ 2]  394         lda     #0x64
   123E 85 50         [ 3]  395         sta     RAM_50
   1240 A9 80         [ 2]  396         lda     #TAPEMODE_PLAY
   1242 20 8C 15      [ 6]  397         jsr     TAPECMD                                 ; PLAY tape
   1245 A9 03         [ 2]  398         lda     #0x03
   1247 85 6B         [ 3]  399         sta     RAM_6B
   1249 A9 A0         [ 2]  400         lda     #0xA0
   124B 85 4C         [ 3]  401         sta     RAM_4C
   124D                     402 L124D:
   124D A5 6B         [ 3]  403         lda     RAM_6B
   124F 6A            [ 2]  404         ror     a
   1250 90 0B         [ 4]  405         bcc     L125D
   1252 A5 50         [ 3]  406         lda     RAM_50
   1254 D0 07         [ 4]  407         bne     L125D
   1256 A9 02         [ 2]  408         lda     #0x02
   1258 85 6B         [ 3]  409         sta     RAM_6B
   125A 4C 74 12      [ 3]  410         jmp     L1274
                            411 ;
   125D                     412 L125D:
   125D AD 02 03      [ 4]  413         lda     transport_periph$ddr_reg_b
   1260 6A            [ 2]  414         ror     a
   1261 B0 04         [ 4]  415         bcs     L1267
   1263 A9 A0         [ 2]  416         lda     #0xA0
   1265 85 4C         [ 3]  417         sta     RAM_4C
   1267                     418 L1267:
   1267 A5 4C         [ 3]  419         lda     RAM_4C
   1269 D0 11         [ 4]  420         bne     L127C
   126B A9 10         [ 2]  421         lda     #TAPEMODE_STOP
   126D 20 8C 15      [ 6]  422         jsr     TAPECMD                                 ; STOP tape
   1270 A9 80         [ 2]  423         lda     #0x80
   1272 85 6B         [ 3]  424         sta     RAM_6B
   1274                     425 L1274:
   1274 A9 80         [ 2]  426         lda     #0x80
   1276 2D 02 02      [ 4]  427         and     U18_PORTB
   1279 8D 02 02      [ 4]  428         sta     U18_PORTB
   127C                     429 L127C:
   127C A5 6B         [ 3]  430         lda     RAM_6B
   127E 6A            [ 2]  431         ror     a
   127F B0 AB         [ 4]  432         bcs     L122C
   1281                     433 L1281:
   1281 20 A9 15      [ 6]  434         jsr     L15A9
   1284 20 00 16      [ 6]  435         jsr     AGCUPD
   1287 A5 5A         [ 3]  436         lda     RAM_5A
   1289 D0 A1         [ 4]  437         bne     L122C
   128B AD 02 02      [ 4]  438         lda     U18_PORTB
   128E 10 94         [ 4]  439         bpl     L1224
   1290 2A            [ 2]  440         rol     a
   1291 2A            [ 2]  441         rol     a
   1292 90 03         [ 4]  442         bcc     L1297
   1294 4C 64 13      [ 3]  443         jmp     L1364
                            444 ;
   1297                     445 L1297:
   1297 2A            [ 2]  446         rol     a
   1298 90 03         [ 4]  447         bcc     L129D
   129A 4C 15 13      [ 3]  448         jmp     L1315
                            449 ;
   129D                     450 L129D:
   129D 2A            [ 2]  451         rol     a
   129E 90 03         [ 4]  452         bcc     L12A3
   12A0 4C C4 12      [ 3]  453         jmp     L12C4
                            454 ;
   12A3                     455 L12A3:
   12A3 29 F0         [ 2]  456         and     #0xF0
   12A5 F0 03         [ 4]  457         beq     L12AA
   12A7 4C 6D 13      [ 3]  458         jmp     L136D
                            459 ;
   12AA                     460 L12AA:
   12AA 20 CD 16      [ 6]  461         jsr     L16CD
   12AD A5 32         [ 3]  462         lda     RAM_32
   12AF C9 01         [ 2]  463         cmp     #0x01
   12B1 F0 0E         [ 4]  464         beq     L12C1
   12B3 20 AA 18      [ 6]  465         jsr     L18AA
   12B6 A9 40         [ 2]  466         lda     #0x40
   12B8 85 92         [ 3]  467         sta     board_5_periph$ddr_reg_b
   12BA A5 53         [ 3]  468         lda     RAM_53
   12BC F0 57         [ 4]  469         beq     L1315
   12BE 4C 2C 12      [ 3]  470         jmp     L122C
   12C1                     471 L12C1:
   12C1 4C 24 12      [ 3]  472         jmp     L1224
                            473 ;
   12C4                     474 L12C4:
   12C4 A9 01         [ 2]  475         lda     #0x01
   12C6 85 56         [ 3]  476         sta     RAM_56
   12C8 20 C7 14      [ 6]  477         jsr     L14C7
   12CB 20 2C 15      [ 6]  478         jsr     L152C
   12CE 20 3F 17      [ 6]  479         jsr     L173F
   12D1 E6 56         [ 5]  480         inc     RAM_56
   12D3 20 D7 14      [ 6]  481         jsr     L14D7
   12D6 4C 24 12      [ 3]  482         jmp     L1224
                            483 ;
   12D9                     484 L12D9:
   12D9 E6 31         [ 5]  485         inc     RAM_31
   12DB 20 CD 16      [ 6]  486         jsr     L16CD
   12DE A5 32         [ 3]  487         lda     RAM_32
   12E0 C9 02         [ 2]  488         cmp     #0x02
   12E2 F0 03         [ 4]  489         beq     L12E7
   12E4 4C 2C 12      [ 3]  490         jmp     L122C
                            491 ;
   12E7                     492 L12E7:
   12E7 A9 31         [ 2]  493         lda     #0x31
   12E9 20 0F 17      [ 6]  494         jsr     L170F
   12EC A9 28         [ 2]  495         lda     #0x28
   12EE 85 4F         [ 3]  496         sta     RAM_4F
   12F0                     497 L12F0:
   12F0 20 39 19      [ 6]  498         jsr     L1939
   12F3 A5 4F         [ 3]  499         lda     RAM_4F
   12F5 D0 F9         [ 4]  500         bne     L12F0
   12F7 20 CD 16      [ 6]  501         jsr     L16CD
   12FA A5 32         [ 3]  502         lda     RAM_32
   12FC C9 01         [ 2]  503         cmp     #0x01
   12FE F0 03         [ 4]  504         beq     L1303
   1300 4C 2C 12      [ 3]  505         jmp     L122C
                            506 ;
   1303                     507 L1303:
   1303 AD 02 02      [ 4]  508         lda     U18_PORTB
   1306 29 80         [ 2]  509         and     #0x80
   1308 8D 02 02      [ 4]  510         sta     U18_PORTB
   130B 20 B5 18      [ 6]  511         jsr     L18B5
   130E A9 41         [ 2]  512         lda     #0x41
   1310 85 92         [ 3]  513         sta     board_5_periph$ddr_reg_b
   1312 4C 24 12      [ 3]  514         jmp     L1224
                            515 ;
   1315                     516 L1315:
   1315 A5 31         [ 3]  517         lda     RAM_31
   1317 F0 C0         [ 4]  518         beq     L12D9
   1319 A5 49         [ 3]  519         lda     RAM_49
   131B C9 0F         [ 2]  520         cmp     #0x0F
   131D F0 57         [ 4]  521         beq     L1376
   131F A9 52         [ 2]  522         lda     #0x52
   1321 85 4A         [ 3]  523         sta     RAM_4A
   1323 A6 44         [ 3]  524         ldx     RAM_44
   1325 20 B7 14      [ 6]  525         jsr     L14B7
   1328 86 44         [ 3]  526         stx     RAM_44
   132A A9 A0         [ 2]  527         lda     #0xA0
   132C 8D 02 02      [ 4]  528         sta     U18_PORTB
   132F 20 C7 14      [ 6]  529         jsr     L14C7
   1332 20 2C 15      [ 6]  530         jsr     L152C
   1335                     531 L1335:
   1335 20 39 19      [ 6]  532         jsr     L1939
   1338 20 CD 16      [ 6]  533         jsr     L16CD
   133B A5 32         [ 3]  534         lda     RAM_32
   133D C9 02         [ 2]  535         cmp     #0x02
   133F F0 04         [ 4]  536         beq     L1345
   1341 C9 01         [ 2]  537         cmp     #0x01
   1343 F0 F0         [ 4]  538         beq     L1335
   1345                     539 L1345:
   1345 A9 00         [ 2]  540         lda     #0x00
   1347 85 31         [ 3]  541         sta     RAM_31
   1349 20 3F 17      [ 6]  542         jsr     L173F
   134C                     543 L134C:
   134C A5 56         [ 3]  544         lda     RAM_56
   134E C5 70         [ 3]  545         cmp     RAM_70
   1350 B0 08         [ 4]  546         bcs     L135A
   1352 E6 56         [ 5]  547         inc     RAM_56
   1354 20 D7 14      [ 6]  548         jsr     L14D7
   1357 4C 24 12      [ 3]  549         jmp     L1224
                            550 ;
   135A                     551 L135A:
   135A A9 02         [ 2]  552         lda     #0x02
   135C 85 56         [ 3]  553         sta     RAM_56
   135E 20 F0 14      [ 6]  554         jsr     L14F0
   1361 4C 24 12      [ 3]  555         jmp     L1224
                            556 ;
   1364                     557 L1364:
   1364 A5 49         [ 3]  558         lda     RAM_49
   1366 C9 0F         [ 2]  559         cmp     #0x0F
   1368 F0 32         [ 4]  560         beq     L139C
   136A 4C 4C 13      [ 3]  561         jmp     L134C
                            562 ;
   136D                     563 L136D:
   136D A5 49         [ 3]  564         lda     RAM_49
   136F C9 0F         [ 2]  565         cmp     #0x0F
   1371 F0 58         [ 4]  566         beq     L13CB
   1373 4C 61 14      [ 3]  567         jmp     L1461
                            568 ;
   1376                     569 L1376:
   1376 A9 A0         [ 2]  570         lda     #0xA0
   1378 8D 02 02      [ 4]  571         sta     U18_PORTB
   137B A5 57         [ 3]  572         lda     RAM_57
   137D 85 56         [ 3]  573         sta     RAM_56
   137F 20 C7 14      [ 6]  574         jsr     L14C7
   1382 20 2C 15      [ 6]  575         jsr     L152C
   1385                     576 L1385:
   1385 20 39 19      [ 6]  577         jsr     L1939
   1388 20 CD 16      [ 6]  578         jsr     L16CD
   138B A5 32         [ 3]  579         lda     RAM_32
   138D C9 02         [ 2]  580         cmp     #0x02
   138F F0 04         [ 4]  581         beq     L1395
   1391 C9 01         [ 2]  582         cmp     #0x01
   1393 F0 F0         [ 4]  583         beq     L1385
   1395                     584 L1395:
   1395 A9 00         [ 2]  585         lda     #0x00
   1397 85 31         [ 3]  586         sta     RAM_31
   1399 20 3F 17      [ 6]  587         jsr     L173F
   139C                     588 L139C:
   139C A5 57         [ 3]  589         lda     RAM_57
   139E C5 56         [ 3]  590         cmp     RAM_56
   13A0 D0 21         [ 4]  591         bne     L13C3
   13A2 E6 57         [ 5]  592         inc     RAM_57
   13A4 A5 57         [ 3]  593         lda     RAM_57
   13A6 C9 06         [ 2]  594         cmp     #0x06
   13A8 F0 14         [ 4]  595         beq     L13BE
   13AA C9 10         [ 2]  596         cmp     #0x10
   13AC F0 10         [ 4]  597         beq     L13BE
   13AE C9 1A         [ 2]  598         cmp     #0x1A
   13B0 D0 11         [ 4]  599         bne     L13C3
   13B2 A9 02         [ 2]  600         lda     #0x02
   13B4 85 57         [ 3]  601         sta     RAM_57
   13B6 A9 02         [ 2]  602         lda     #0x02
   13B8 8D 80 02      [ 4]  603         sta     U19_PORTA
   13BB 4C 11 12      [ 3]  604         jmp     L1211
                            605 ;
   13BE                     606 L13BE:
   13BE 18            [ 2]  607         clc
   13BF 69 06         [ 2]  608         adc     #0x06
   13C1 85 57         [ 3]  609         sta     RAM_57
   13C3                     610 L13C3:
   13C3 E6 56         [ 5]  611         inc     RAM_56
   13C5 20 D7 14      [ 6]  612         jsr     L14D7
   13C8 4C 24 12      [ 3]  613         jmp     L1224
                            614 ;
   13CB                     615 L13CB:
   13CB AD 02 02      [ 4]  616         lda     U18_PORTB
   13CE 85 5C         [ 3]  617         sta     RAM_5C
   13D0 29 0F         [ 2]  618         and     #0x0F
   13D2 85 5D         [ 3]  619         sta     RAM_5D
   13D4 6A            [ 2]  620         ror     a
   13D5 90 04         [ 4]  621         bcc     L13DB
   13D7 A9 09         [ 2]  622         lda     #0x09
   13D9 D0 1F         [ 4]  623         bne     L13FA
   13DB                     624 L13DB:
   13DB 6A            [ 2]  625         ror     a
   13DC 90 13         [ 4]  626         bcc     L13F1
   13DE 18            [ 2]  627         clc
   13DF A9 06         [ 2]  628         lda     #0x06
   13E1 65 58         [ 3]  629         adc     RAM_58
   13E3 E6 58         [ 5]  630         inc     RAM_58
   13E5 A6 58         [ 3]  631         ldx     RAM_58
   13E7 E0 03         [ 2]  632         cpx     #0x03
   13E9 90 0F         [ 4]  633         bcc     L13FA
   13EB A2 00         [ 2]  634         ldx     #0x00
   13ED 86 58         [ 3]  635         stx     RAM_58
   13EF F0 09         [ 4]  636         beq     L13FA
   13F1                     637 L13F1:
   13F1 6A            [ 2]  638         ror     a
   13F2 90 04         [ 4]  639         bcc     L13F8
   13F4 A9 0B         [ 2]  640         lda     #0x0B
   13F6 D0 02         [ 4]  641         bne     L13FA
   13F8                     642 L13F8:
   13F8 A9 0A         [ 2]  643         lda     #0x0A
   13FA                     644 L13FA:
   13FA A6 57         [ 3]  645         ldx     RAM_57
   13FC E0 0E         [ 2]  646         cpx     #0x0E
   13FE 90 03         [ 4]  647         bcc     L1403
   1400 18            [ 2]  648         clc
   1401 69 0A         [ 2]  649         adc     #0x0A
   1403                     650 L1403:
   1403 85 56         [ 3]  651         sta     RAM_56
   1405                     652 L1405:
   1405 20 C7 14      [ 6]  653         jsr     L14C7
   1408 20 2C 15      [ 6]  654         jsr     L152C
   140B 20 AA 18      [ 6]  655         jsr     L18AA
   140E                     656 L140E:
   140E 20 39 19      [ 6]  657         jsr     L1939
   1411 20 CD 16      [ 6]  658         jsr     L16CD
   1414 A5 32         [ 3]  659         lda     RAM_32
   1416 C9 02         [ 2]  660         cmp     #0x02
   1418 F0 04         [ 4]  661         beq     L141E
   141A C9 01         [ 2]  662         cmp     #0x01
   141C F0 F0         [ 4]  663         beq     L140E
   141E                     664 L141E:
   141E A9 3C         [ 2]  665         lda     #0x3C
   1420 85 53         [ 3]  666         sta     RAM_53
   1422                     667 L1422:
   1422 A9 FA         [ 2]  668         lda     #0xFA
   1424 85 4C         [ 3]  669         sta     RAM_4C
   1426                     670 L1426:
   1426 20 A9 15      [ 6]  671         jsr     L15A9
   1429 A5 5A         [ 3]  672         lda     RAM_5A
   142B D0 15         [ 4]  673         bne     L1442
   142D A5 53         [ 3]  674         lda     RAM_53
   142F F0 22         [ 4]  675         beq     L1453
   1431 20 39 19      [ 6]  676         jsr     L1939
   1434 A5 4C         [ 3]  677         lda     RAM_4C
   1436 D0 EE         [ 4]  678         bne     L1426
   1438 AD 02 02      [ 4]  679         lda     U18_PORTB
   143B 45 5D         [ 3]  680         eor     RAM_5D
   143D 8D 02 02      [ 4]  681         sta     U18_PORTB
   1440 D0 E0         [ 4]  682         bne     L1422
   1442                     683 L1442:
   1442 20 39 19      [ 6]  684         jsr     L1939
   1445 20 A9 15      [ 6]  685         jsr     L15A9
   1448 A5 5A         [ 3]  686         lda     RAM_5A
   144A D0 F6         [ 4]  687         bne     L1442
   144C AD 02 02      [ 4]  688         lda     U18_PORTB
   144F C5 5C         [ 3]  689         cmp     RAM_5C
   1451 F0 03         [ 4]  690         beq     L1456
   1453                     691 L1453:
   1453 4C 28 12      [ 3]  692         jmp     L1228
                            693 ;
   1456                     694 L1456:
   1456 20 3F 17      [ 6]  695         jsr     L173F
   1459 E6 56         [ 5]  696         inc     RAM_56
   145B 20 D7 14      [ 6]  697         jsr     L14D7
   145E 4C 24 12      [ 3]  698         jmp     L1224
                            699 ;
   1461                     700 L1461:
   1461 AD 02 02      [ 4]  701         lda     U18_PORTB
   1464 85 5C         [ 3]  702         sta     RAM_5C
   1466 29 0F         [ 2]  703         and     #0x0F
   1468 85 5D         [ 3]  704         sta     RAM_5D
   146A 6A            [ 2]  705         ror     a
   146B 90 03         [ 4]  706         bcc     L1470
   146D 4C 8D 14      [ 3]  707         jmp     L148D
                            708 ;
   1470                     709 L1470:
   1470 6A            [ 2]  710         ror     a
   1471 90 03         [ 4]  711         bcc     L1476
   1473 4C 7F 14      [ 3]  712         jmp     L147F
                            713 ;
   1476                     714 L1476:
   1476 6A            [ 2]  715         ror     a
   1477 90 03         [ 4]  716         bcc     L147C
   1479 4C A9 14      [ 3]  717         jmp     L14A9
   147C                     718 L147C:
   147C 4C 9B 14      [ 3]  719         jmp     L149B
                            720 ;
   147F                     721 L147F:
   147F A9 42         [ 2]  722         lda     #0x42
   1481 85 4A         [ 3]  723         sta     RAM_4A
   1483 A6 45         [ 3]  724         ldx     RAM_45
   1485 20 B7 14      [ 6]  725         jsr     L14B7
   1488 86 45         [ 3]  726         stx     RAM_45
   148A 4C 05 14      [ 3]  727         jmp     L1405
                            728 ;
   148D                     729 L148D:
   148D A9 43         [ 2]  730         lda     #0x43
   148F 85 4A         [ 3]  731         sta     RAM_4A
   1491 A6 46         [ 3]  732         ldx     RAM_46
   1493 20 B7 14      [ 6]  733         jsr     L14B7
   1496 86 46         [ 3]  734         stx     RAM_46
   1498 4C 05 14      [ 3]  735         jmp     L1405
                            736 ;
   149B                     737 L149B:
   149B A9 53         [ 2]  738         lda     #0x53
   149D 85 4A         [ 3]  739         sta     RAM_4A
   149F A6 47         [ 3]  740         ldx     RAM_47
   14A1 20 B7 14      [ 6]  741         jsr     L14B7
   14A4 86 47         [ 3]  742         stx     RAM_47
   14A6 4C 05 14      [ 3]  743         jmp     L1405
                            744 ;
   14A9                     745 L14A9:
   14A9 A9 49         [ 2]  746         lda     #0x49
   14AB 85 4A         [ 3]  747         sta     RAM_4A
   14AD A6 48         [ 3]  748         ldx     RAM_48
   14AF 20 B7 14      [ 6]  749         jsr     L14B7
   14B2 86 48         [ 3]  750         stx     RAM_48
   14B4 4C 05 14      [ 3]  751         jmp     L1405
                            752 ;
   14B7                     753 L14B7:
   14B7 E8            [ 2]  754         inx
   14B8 E0 1F         [ 2]  755         cpx     #0x1F
   14BA D0 02         [ 4]  756         bne     L14BE
   14BC A2 02         [ 2]  757         ldx     #0x02
   14BE                     758 L14BE:
   14BE B5 70         [ 4]  759         lda     RAM_70,x
   14C0 C5 4A         [ 3]  760         cmp     RAM_4A
   14C2 D0 F3         [ 4]  761         bne     L14B7
   14C4 86 56         [ 3]  762         stx     RAM_56
   14C6 60            [ 6]  763         rts
                            764 ;
   14C7                     765 L14C7:
   14C7 A5 56         [ 3]  766         lda     RAM_56
   14C9 C5 55         [ 3]  767         cmp     RAM_55
   14CB 90 06         [ 4]  768         bcc     L14D3
   14CD F0 03         [ 4]  769         beq     L14D2
   14CF 20 D7 14      [ 6]  770         jsr     L14D7
   14D2                     771 L14D2:
   14D2 60            [ 6]  772         rts
                            773 ;
   14D3                     774 L14D3:
   14D3 20 F0 14      [ 6]  775         jsr     L14F0
   14D6 60            [ 6]  776         rts
                            777 ;
   14D7                     778 L14D7:
   14D7 A9 20         [ 2]  779         lda     #TAPEMODE_FFWD
   14D9 20 8C 15      [ 6]  780         jsr     TAPECMD                                 ; FFWD Tape
   14DC 20 64 15      [ 6]  781         jsr     L1564
   14DF E6 55         [ 5]  782         inc     RAM_55
   14E1 A5 55         [ 3]  783         lda     RAM_55
   14E3 8D 82 02      [ 4]  784         sta     U19_PORTB
   14E6 A5 56         [ 3]  785         lda     RAM_56
   14E8 C5 55         [ 3]  786         cmp     RAM_55
   14EA D0 EB         [ 4]  787         bne     L14D7
   14EC 20 0B 15      [ 6]  788         jsr     L150B
   14EF 60            [ 6]  789         rts
                            790 ;
   14F0                     791 L14F0:
   14F0 E6 55         [ 5]  792         inc     RAM_55
   14F2                     793 L14F2:
   14F2 A9 40         [ 2]  794         lda     #TAPEMODE_REWIND
   14F4 20 8C 15      [ 6]  795         jsr     TAPECMD                                 ; REWIND Tape
   14F7 20 64 15      [ 6]  796         jsr     L1564
   14FA C6 55         [ 5]  797         dec     RAM_55
   14FC A5 55         [ 3]  798         lda     RAM_55
   14FE 8D 82 02      [ 4]  799         sta     U19_PORTB
   1501 A5 56         [ 3]  800         lda     RAM_56
   1503 C5 55         [ 3]  801         cmp     RAM_55
   1505 D0 EB         [ 4]  802         bne     L14F2
   1507 20 1E 15      [ 6]  803         jsr     L151E
   150A 60            [ 6]  804         rts
                            805 ;
   150B                     806 L150B:
   150B A9 40         [ 2]  807         lda     #TAPEMODE_REWIND
   150D 20 8C 15      [ 6]  808         jsr     TAPECMD                                 ; REWIND Tape
   1510 20 64 15      [ 6]  809         jsr     L1564
   1513 A9 03         [ 2]  810         lda     #0x03
   1515 85 4F         [ 3]  811         sta     RAM_4F
   1517                     812 L1517:
   1517 20 39 19      [ 6]  813         jsr     L1939
   151A A5 4F         [ 3]  814         lda     RAM_4F
   151C D0 F9         [ 4]  815         bne     L1517
   151E                     816 L151E:
   151E A9 20         [ 2]  817         lda     #TAPEMODE_FFWD
   1520 20 8C 15      [ 6]  818         jsr     TAPECMD                                 ; FFWD Tape
   1523 20 64 15      [ 6]  819         jsr     L1564
   1526 A9 10         [ 2]  820         lda     #TAPEMODE_STOP
   1528 20 8C 15      [ 6]  821         jsr     TAPECMD                                 ; STOP Tape
   152B 60            [ 6]  822         rts
                            823 ;
   152C                     824 L152C:
   152C A5 6B         [ 3]  825         lda     RAM_6B
   152E 30 33         [ 4]  826         bmi     L1563
   1530 A9 80         [ 2]  827         lda     #TAPEMODE_PLAY
   1532 20 8C 15      [ 6]  828         jsr     TAPECMD                                 ; PLAY Tape
   1535 A9 FA         [ 2]  829         lda     #0xFA
   1537 85 4B         [ 3]  830         sta     RAM_4B
   1539                     831 L1539:
   1539 20 39 19      [ 6]  832         jsr     L1939
   153C A5 4B         [ 3]  833         lda     RAM_4B
   153E D0 F9         [ 4]  834         bne     L1539
   1540                     835 L1540:
   1540 20 39 19      [ 6]  836         jsr     L1939
   1543 AD 02 03      [ 4]  837         lda     transport_periph$ddr_reg_b
   1546 6A            [ 2]  838         ror     a
   1547 90 F7         [ 4]  839         bcc     L1540
   1549 A9 A0         [ 2]  840         lda     #0xA0
   154B 85 4B         [ 3]  841         sta     RAM_4B
   154D                     842 L154D:
   154D AD 02 03      [ 4]  843         lda     transport_periph$ddr_reg_b
   1550 6A            [ 2]  844         ror     a
   1551 90 E6         [ 4]  845         bcc     L1539
   1553 20 39 19      [ 6]  846         jsr     L1939
   1556 A5 4B         [ 3]  847         lda     RAM_4B
   1558 D0 F3         [ 4]  848         bne     L154D
   155A A9 10         [ 2]  849         lda     #TAPEMODE_STOP
   155C 20 8C 15      [ 6]  850         jsr     TAPECMD                                 ; STOP tape
   155F A9 80         [ 2]  851         lda     #0x80
   1561 85 6B         [ 3]  852         sta     RAM_6B
   1563                     853 L1563:
   1563 60            [ 6]  854         rts
                            855 ;
   1564                     856 L1564:
   1564 A5 55         [ 3]  857         lda     RAM_55
   1566 8D 82 02      [ 4]  858         sta     U19_PORTB
   1569                     859 L1569:
   1569 A9 00         [ 2]  860         lda     #0x00
   156B 85 59         [ 3]  861         sta     RAM_59
   156D                     862 L156D:
   156D AD 02 03      [ 4]  863         lda     transport_periph$ddr_reg_b
   1570 A9 14         [ 2]  864         lda     #0x14
   1572 85 4B         [ 3]  865         sta     RAM_4B
   1574 E6 59         [ 5]  866         inc     RAM_59
   1576 A5 59         [ 3]  867         lda     RAM_59
   1578 C9 21         [ 2]  868         cmp     #0x21
   157A B0 0F         [ 4]  869         bcs     L158B
   157C                     870 L157C:
   157C 20 39 19      [ 6]  871         jsr     L1939
   157F A5 4B         [ 3]  872         lda     RAM_4B
   1581 F0 E6         [ 4]  873         beq     L1569
   1583 AD 03 03      [ 4]  874         lda     transport_control_reg_b
   1586 10 F4         [ 4]  875         bpl     L157C
   1588 4C 6D 15      [ 3]  876         jmp     L156D
   158B                     877 L158B:
   158B 60            [ 6]  878         rts
                            879 ;
                            880 ;       Send Transport command for 0.250 sec
                            881 ;       (Unified)
                            882 ;
   158C                     883 TAPECMD:
   158C 8D 02 03      [ 4]  884         sta     transport_periph$ddr_reg_b              ; enable output line
   158F A9 FA         [ 2]  885         lda     #0xFA
   1591 85 4B         [ 3]  886         sta     RAM_4B
   1593                     887 L1593:
   1593 20 39 19      [ 6]  888         jsr     L1939
   1596 A5 4B         [ 3]  889         lda     RAM_4B
   1598 D0 F9         [ 4]  890         bne     L1593
   159A AD 02 03      [ 4]  891         lda     transport_periph$ddr_reg_b
   159D 29 60         [ 2]  892         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   159F D0 07         [ 4]  893         bne     L15A8                                   ; Yes, go to exit
   15A1 A9 00         [ 2]  894         lda     #0x00                                   ; else unassert STOP or PLAY
   15A3 8D 02 03      [ 4]  895         sta     transport_periph$ddr_reg_b              ; and then exit
   15A6 85 6B         [ 3]  896         sta     RAM_6B                                  ; ???
   15A8                     897 L15A8:
   15A8 60            [ 6]  898         rts
                            899 ;
   15A9                     900 L15A9:
   15A9 A5 5A         [ 3]  901         lda     RAM_5A
   15AB D0 29         [ 4]  902         bne     L15D6
   15AD AD 00 02      [ 4]  903         lda     U18_PORTA
   15B0 49 FF         [ 2]  904         eor     #0xFF
   15B2 F0 21         [ 4]  905         beq     L15D5                                   ; nothing pushed, jump to exit
   15B4 85 5B         [ 3]  906         sta     RAM_5B                                  ; buffer buttons in RAM_5B
   15B6 10 09         [ 4]  907         bpl     L15C1                                   ; PROG pushed, jump
   15B8 4D 02 02      [ 4]  908         eor     U18_PORTB
   15BB 8D 02 02      [ 4]  909         sta     U18_PORTB
   15BE 4C CD 15      [ 3]  910         jmp     L15CD
                            911 ;
   15C1                     912 L15C1:
   15C1 AD 02 02      [ 4]  913         lda     U18_PORTB
   15C4 29 80         [ 2]  914         and     #0x80
   15C6 F0 0D         [ 4]  915         beq     L15D5
   15C8 05 5B         [ 3]  916         ora     RAM_5B
   15CA 8D 02 02      [ 4]  917         sta     U18_PORTB
   15CD                     918 L15CD:
   15CD A9 80         [ 2]  919         lda     #0x80
   15CF 85 5A         [ 3]  920         sta     RAM_5A
   15D1 A9 14         [ 2]  921         lda     #0x14
   15D3 85 4B         [ 3]  922         sta     RAM_4B
   15D5                     923 L15D5:
   15D5 60            [ 6]  924         rts
                            925 ;
   15D6                     926 L15D6:
   15D6 A5 5A         [ 3]  927         lda     RAM_5A
   15D8 2A            [ 2]  928         rol     a
   15D9 90 09         [ 4]  929         bcc     L15E4
   15DB A5 4B         [ 3]  930         lda     RAM_4B
   15DD D0 20         [ 4]  931         bne     L15FF
   15DF A9 40         [ 2]  932         lda     #0x40
   15E1 85 5A         [ 3]  933         sta     RAM_5A
   15E3 60            [ 6]  934         rts
                            935 ;
   15E4                     936 L15E4:
   15E4 2A            [ 2]  937         rol     a
   15E5 90 10         [ 4]  938         bcc     L15F7
   15E7 AD 00 02      [ 4]  939         lda     U18_PORTA
   15EA 49 FF         [ 2]  940         eor     #0xFF
   15EC D0 11         [ 4]  941         bne     L15FF
   15EE A9 20         [ 2]  942         lda     #0x20
   15F0 85 5A         [ 3]  943         sta     RAM_5A
   15F2 A9 14         [ 2]  944         lda     #0x14
   15F4 85 4B         [ 3]  945         sta     RAM_4B
   15F6 60            [ 6]  946         rts
                            947 ;
   15F7                     948 L15F7:
   15F7 A5 4B         [ 3]  949         lda     RAM_4B
   15F9 D0 04         [ 4]  950         bne     L15FF
   15FB A9 00         [ 2]  951         lda     #0x00
   15FD 85 5A         [ 3]  952         sta     RAM_5A
   15FF                     953 L15FF:
   15FF 60            [ 6]  954         rts
                            955 ;
                            956 ;        Do AGC Mic Logic
                            957 ;
   1600                     958 AGCUPD:
   1600 AD 80 02      [ 4]  959         lda     U19_PORTA                               ; read AGC knob
   1603 49 FF         [ 2]  960         eor     #0xFF                                   ; invert the bits
   1605 4A            [ 2]  961         lsr     a                                       ; get into lower nibble
   1606 4A            [ 2]  962         lsr     a
   1607 4A            [ 2]  963         lsr     a
   1608 4A            [ 2]  964         lsr     a
   1609 18            [ 2]  965         clc
   160A 65 5E         [ 3]  966         adc     RAM_5E                                  ; add audio level to it
   160C AA            [ 2]  967         tax
   160D BD 88 16      [ 5]  968         lda     AGCTABLE,x                              ; and get the table value
   1610 85 62         [ 3]  969         sta     RAM_62                                  ; store this value in RAM_62
   1612 A5 4D         [ 3]  970         lda     RAM_4D                                  ; 10ms timer expired?
   1614 D0 16         [ 4]  971         bne     $26                                     ; no, just update CPU Leds
   1616 A9 0A         [ 2]  972         lda     #0x0A
   1618 85 4D         [ 3]  973         sta     RAM_4D                                  ; restart 10ms timer
   161A A5 62         [ 3]  974         lda     RAM_62                                  ; every 10ms, adjust gain by 1 if needed
   161C CD 82 03      [ 4]  975         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   161F 90 08         [ 4]  976         bcc     $25
   1621 F0 09         [ 4]  977         beq     $26
   1623 EE 82 03      [ 6]  978         inc     audio_periph$ddr_reg_b                  ; increase value
   1626 4C 2C 16      [ 3]  979         jmp     $26
                            980 ;
   1629                     981 $25:
   1629 CE 82 03      [ 6]  982         dec     audio_periph$ddr_reg_b                  ; decrease value
   162C                     983 $26:
   162C AD 82 03      [ 4]  984         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   162F 8D 82 02      [ 4]  985         sta     U19_PORTB
   1632 60            [ 6]  986         rts
                            987 ;
   1633                     988 L1633:
   1633 A5 63         [ 3]  989         lda     RAM_63
   1635 D0 15         [ 4]  990         bne     L164C
   1637 A9 7F         [ 2]  991         lda     #0x7F
   1639 85 63         [ 3]  992         sta     RAM_63
   163B 20 B5 18      [ 6]  993         jsr     L18B5
   163E A9 0A         [ 2]  994         lda     #0x0A
   1640 85 51         [ 3]  995         sta     RAM_51
   1642 A5 5E         [ 3]  996         lda     RAM_5E
   1644 85 5F         [ 3]  997         sta     RAM_5F
   1646 A9 00         [ 2]  998         lda     #0x00
   1648 85 61         [ 3]  999         sta     RAM_61
   164A 85 60         [ 3] 1000         sta     RAM_60
   164C                    1001 L164C:
   164C A5 51         [ 3] 1002         lda     RAM_51
   164E D0 1C         [ 4] 1003         bne     L166C
   1650 A9 0A         [ 2] 1004         lda     #0x0A
   1652 85 51         [ 3] 1005         sta     RAM_51
   1654 A5 60         [ 3] 1006         lda     RAM_60
   1656 C9 08         [ 2] 1007         cmp     #0x08                                   ; 8 samples?
   1658 F0 13         [ 4] 1008         beq     $27                                     ; yes - jump to final calculation
   165A E6 60         [ 5] 1009         inc     RAM_60                                  ; increment the sample counter
   165C A2 09         [ 2] 1010         ldx     #0x09
   165E 38            [ 2] 1011         sec
   165F AD 80 03      [ 4] 1012         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1662                    1013 L1662:                                                  ; read the most significant high bit
   1662 2A            [ 2] 1014         rol     a
   1663 CA            [ 2] 1015         dex
   1664 90 FC         [ 4] 1016         bcc     L1662
   1666 18            [ 2] 1017         clc
   1667 8A            [ 2] 1018         txa                                             ; 8=high bit7, 0=no high bits
   1668 65 61         [ 3] 1019         adc     RAM_61                                  ; add it into RAM_61 (do this 8 times)
   166A 85 61         [ 3] 1020         sta     RAM_61
   166C                    1021 L166C:
   166C 60            [ 6] 1022         rts
                           1023 ;
   166D                    1024 $27:
   166D 46 61         [ 5] 1025         lsr     RAM_61                                  ; divide by 8 (average of 8 samples)
   166F 46 61         [ 5] 1026         lsr     RAM_61
   1671 46 61         [ 5] 1027         lsr     RAM_61
   1673 A5 61         [ 3] 1028         lda     RAM_61
   1675 18            [ 2] 1029         clc
   1676 65 5F         [ 3] 1030         adc     RAM_5F
   1678 4A            [ 2] 1031         lsr     a
   1679 85 5E         [ 3] 1032         sta     RAM_5E
   167B A9 00         [ 2] 1033         lda     #0x00
   167D 85 61         [ 3] 1034         sta     RAM_61
   167F 85 60         [ 3] 1035         sta     RAM_60
   1681 A9 FF         [ 2] 1036         lda     #0xFF
   1683 85 63         [ 3] 1037         sta     RAM_63
   1685 4C AA 18      [ 3] 1038         jmp     L18AA
                           1039 ;
                           1040 ;   AGC table
                           1041 ;
   1688                    1042 AGCTABLE:
   1688 03 04 06 08        1043         .db     0x03, 0x04, 0x06, 0x08
   168C 10 16 20 2D        1044         .db     0x10, 0x16, 0x20, 0x2D
   1690 40 5A 80 BF        1045         .db     0x40, 0x5A, 0x80, 0xBF
   1694 FF FF FF FF        1046         .db     0xFF, 0xFF, 0xFF, 0xFF
   1698 FF                 1047         .db     0xFF
                           1048 ;
   1699                    1049 L1699:
   1699 A2 00         [ 2] 1050         ldx     #0x00
   169B                    1051 L169B:
   169B A9 30         [ 2] 1052         lda     #0x30
   169D 95 81         [ 4] 1053         sta     board_1_control_reg_a,x
   169F 95 83         [ 4] 1054         sta     board_1_control_reg_b,x
   16A1 A9 FF         [ 2] 1055         lda     #0xFF
   16A3 95 80         [ 4] 1056         sta     board_1_periph$ddr_reg_a,x
   16A5 95 82         [ 4] 1057         sta     board_1_periph$ddr_reg_b,x
   16A7 A9 34         [ 2] 1058         lda     #0x34
   16A9 95 81         [ 4] 1059         sta     board_1_control_reg_a,x
   16AB 95 83         [ 4] 1060         sta     board_1_control_reg_b,x
   16AD A9 00         [ 2] 1061         lda     #0x00
   16AF 95 80         [ 4] 1062         sta     board_1_periph$ddr_reg_a,x
   16B1 95 82         [ 4] 1063         sta     board_1_periph$ddr_reg_b,x
   16B3 E8            [ 2] 1064         inx
   16B4 E8            [ 2] 1065         inx
   16B5 E8            [ 2] 1066         inx
   16B6 E8            [ 2] 1067         inx
   16B7 E0 20         [ 2] 1068         cpx     #0x20
   16B9 90 E0         [ 4] 1069         bcc     L169B
   16BB A9 24         [ 2] 1070         lda     #0x24
   16BD 85 64         [ 3] 1071         sta     RAM_64
   16BF A9 00         [ 2] 1072         lda     #0x00
   16C1 85 67         [ 3] 1073         sta     RAM_67
   16C3 85 69         [ 3] 1074         sta     RAM_69
   16C5 85 6A         [ 3] 1075         sta     RAM_6A
   16C7 AD 00 03      [ 4] 1076         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   16CA A0 00         [ 2] 1077         ldy     #0x00
   16CC 60            [ 6] 1078         rts
                           1079 ;
   16CD                    1080 L16CD:
   16CD A9 00         [ 2] 1081         lda     #0x00
   16CF 85 33         [ 3] 1082         sta     RAM_33
   16D1 A9 02         [ 2] 1083         lda     #0x02
   16D3 85 4F         [ 3] 1084         sta     RAM_4F
   16D5                    1085 L16D5:
   16D5 AD 02 01      [ 4] 1086         lda     UART_02
   16D8 29 05         [ 2] 1087         and     #0x05
   16DA F0 1F         [ 4] 1088         beq     L16FB
   16DC A5 33         [ 3] 1089         lda     RAM_33
   16DE D0 0C         [ 4] 1090         bne     L16EC
   16E0 AD 01 01      [ 4] 1091         lda     UART_01
   16E3 C9 4D         [ 2] 1092         cmp     #0x4D
   16E5 D0 14         [ 4] 1093         bne     L16FB
   16E7 E6 33         [ 5] 1094         inc     RAM_33
   16E9 4C FB 16      [ 3] 1095         jmp     L16FB
                           1096 ;
   16EC                    1097 L16EC:
   16EC A9 00         [ 2] 1098         lda     #0x00
   16EE 85 33         [ 3] 1099         sta     RAM_33
   16F0 AD 01 01      [ 4] 1100         lda     UART_01
   16F3 C9 31         [ 2] 1101         cmp     #0x31
   16F5 F0 10         [ 4] 1102         beq     L1707
   16F7 C9 32         [ 2] 1103         cmp     #0x32
   16F9 F0 10         [ 4] 1104         beq     L170B
   16FB                    1105 L16FB:
   16FB 20 39 19      [ 6] 1106         jsr     L1939
   16FE A5 4F         [ 3] 1107         lda     RAM_4F
   1700 D0 D3         [ 4] 1108         bne     L16D5
   1702 A9 00         [ 2] 1109         lda     #0x00
   1704                    1110 L1704:
   1704 85 32         [ 3] 1111         sta     RAM_32
   1706 60            [ 6] 1112         rts
                           1113 ;
   1707                    1114 L1707:
   1707 A9 01         [ 2] 1115         lda     #0x01
   1709 D0 F9         [ 4] 1116         bne     L1704
   170B                    1117 L170B:
   170B A9 02         [ 2] 1118         lda     #0x02
   170D D0 F5         [ 4] 1119         bne     L1704
   170F                    1120 L170F:
   170F 48            [ 3] 1121         pha
   1710 A9 02         [ 2] 1122         lda     #0x02
   1712 85 4F         [ 3] 1123         sta     RAM_4F
   1714 A9 04         [ 2] 1124         lda     #0x04
   1716 85 30         [ 3] 1125         sta     RAM_30
   1718 68            [ 4] 1126         pla
   1719                    1127 L1719:
   1719 48            [ 3] 1128         pha
   171A 20 39 19      [ 6] 1129         jsr     L1939
   171D A9 53         [ 2] 1130         lda     #0x53
   171F 20 2B 17      [ 6] 1131         jsr     L172B
   1722 68            [ 4] 1132         pla
   1723 20 2B 17      [ 6] 1133         jsr     L172B
   1726 C6 30         [ 5] 1134         dec     RAM_30
   1728 D0 EF         [ 4] 1135         bne     L1719
   172A 60            [ 6] 1136         rts
                           1137 ;
   172B                    1138 L172B:
   172B 48            [ 3] 1139         pha
   172C                    1140 L172C:
   172C 20 39 19      [ 6] 1141         jsr     L1939
   172F A5 4F         [ 3] 1142         lda     RAM_4F
   1731 F0 07         [ 4] 1143         beq     L173A
   1733 AD 02 01      [ 4] 1144         lda     UART_02
   1736 29 02         [ 2] 1145         and     #0x02
   1738 F0 F2         [ 4] 1146         beq     L172C
   173A                    1147 L173A:
   173A 68            [ 4] 1148         pla
   173B 8D 01 01      [ 4] 1149         sta     UART_01
   173E 60            [ 6] 1150         rts
                           1151 ;
   173F                    1152 L173F:
   173F A9 80         [ 2] 1153         lda     #TAPEMODE_PLAY
   1741 20 8C 15      [ 6] 1154         jsr     TAPECMD                             ; PLAY tape
   1744 20 8C 15      [ 6] 1155         jsr     TAPECMD                             ; PLAY tape
   1747                    1156 L1747:
   1747 AD 01 03      [ 4] 1157         lda     transport_control_reg_a             ; Wait for Transport Byte
   174A 0A            [ 2] 1158         asl     a
   174B 90 FA         [ 4] 1159         bcc     L1747
   174D AD 00 03      [ 4] 1160         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   1750 29 7F         [ 2] 1161         and     #0x7F
   1752 C9 24         [ 2] 1162         cmp     #0x24                               ; 0x24 code
   1754 D0 F1         [ 4] 1163         bne     L1747
   1756                    1164 L1756:
   1756 AD 01 03      [ 4] 1165         lda     transport_control_reg_a             ; Wait for Transport Byte
   1759 0A            [ 2] 1166         asl     a
   175A 90 FA         [ 4] 1167         bcc     L1756
   175C AD 00 03      [ 4] 1168         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   175F 29 7F         [ 2] 1169         and     #0x7F
   1761 C9 24         [ 2] 1170         cmp     #0x24                               ; 0x24 code
   1763 F0 F1         [ 4] 1171         beq     L1756
   1765 29 3F         [ 2] 1172         and     #0x3F
   1767 C5 56         [ 3] 1173         cmp     RAM_56
   1769 F0 03         [ 4] 1174         beq     L176E
   176B 4C 66 10      [ 3] 1175         jmp     RESET
                           1176 ;
   176E                    1177 L176E:
   176E 20 99 16      [ 6] 1178         jsr     L1699
   1771 20 9F 18      [ 6] 1179         jsr     L189F
   1774 A9 41         [ 2] 1180         lda     #0x41
   1776 85 92         [ 3] 1181         sta     board_5_periph$ddr_reg_b
   1778                    1182 L1778:
   1778 AD 01 03      [ 4] 1183         lda     transport_control_reg_a             ; Wait for Transport Byte
   177B 0A            [ 2] 1184         asl     a
   177C 90 11         [ 4] 1185         bcc     L178F
   177E AD 00 03      [ 4] 1186         lda     transport_periph$ddr_reg_a          ; Read Transport Byte
   1781 29 7F         [ 2] 1187         and     #0x7F
   1783 85 65         [ 3] 1188         sta     RAM_65                              ; First byte into 0065
   1785 C9 22         [ 2] 1189         cmp     #0x22
   1787 90 EF         [ 4] 1190         bcc     L1778                               ; ignore if < 0x22
   1789 C9 40         [ 2] 1191         cmp     #0x40
   178B B0 05         [ 4] 1192         bcs     L1792                               ; jump if >= 0x40
   178D 85 64         [ 3] 1193         sta     RAM_64                              ; put it here if it's >= 0x22 and < 0x40
   178F                    1194 L178F:
   178F 4C 1A 18      [ 3] 1195         jmp     L181A
                           1196 ;
   1792                    1197 L1792:                                              
   1792 A5 64         [ 3] 1198         lda     RAM_64                              ; read the last command byte
   1794 29 7E         [ 2] 1199         and     #0x7E
   1796 38            [ 2] 1200         sec
   1797 E9 22         [ 2] 1201         sbc     #0x22
   1799 AA            [ 2] 1202         tax
   179A BD 93 1D      [ 5] 1203         lda     X1D93,x
   179D 85 6C         [ 3] 1204         sta     RAM_6C
   179F BD 94 1D      [ 5] 1205         lda     X1D93+1,x
   17A2 85 6D         [ 3] 1206         sta     RAM_6D
   17A4 20 AA 17      [ 6] 1207         jsr     L17AA
   17A7 4C 78 17      [ 3] 1208         jmp     L1778
   17AA                    1209 L17AA:
   17AA 6C 6C 00      [ 5] 1210         jmp     [RAM_6C]                              ;INFO: indirect jump
                           1211 ;
                           1212 ;       Decode command byte in 0064 and channel byte in 0065
                           1213 ;       to a command offset in 0066 and bit mask in 0068, return with carry clear
                           1214 ;       Handles 0x26/0x27, 0x32/0x33, 0x3E/0x3F
                           1215 ;
   17AD                    1216 L17AD:
   17AD A5 64         [ 3] 1217         lda     RAM_64                                  ; read the last command byte?
   17AF                    1218 L17AF:
   17AF 38            [ 2] 1219         sec
   17B0 E9 26         [ 2] 1220         sbc     #0x26                                   ; 0x00/0x01,0x0C/0x0D,0x18/0x19
   17B2 4A            [ 2] 1221         lsr     a
   17B3 A8            [ 2] 1222         tay                                             ; 0x00, 0x06, 0x0C
   17B4 B9 B2 1D      [ 5] 1223         lda     X1DB2,y                                 ; 0x6A, 0x80, 0x82 (??, board1A, board1B)
   17B7 85 66         [ 3] 1224         sta     RAM_66                                  ; table value goes here
   17B9 98            [ 2] 1225         tya
   17BA 0A            [ 2] 1226         asl     a
   17BB 0A            [ 2] 1227         asl     a
   17BC 0A            [ 2] 1228         asl     a
   17BD A8            [ 2] 1229         tay                                             ; 0x00, 0x30, 0x60
   17BE A9 01         [ 2] 1230         lda     #0x01
   17C0 85 68         [ 3] 1231         sta     RAM_68                                  ; set bit 0 here
   17C2 A5 65         [ 3] 1232         lda     RAM_65                                  ; get current byte
   17C4                    1233 L17C4:
   17C4 D9 04 1E      [ 5] 1234         cmp     X1E04,y
   17C7 F0 07         [ 4] 1235         beq     L17D0
   17C9 C8            [ 2] 1236         iny
   17CA 06 68         [ 5] 1237         asl     RAM_68                                  ; now RAM_68 has the right bit
   17CC 90 F6         [ 4] 1238         bcc     L17C4
   17CE 18            [ 2] 1239         clc                                             ; code not found, return
   17CF 60            [ 6] 1240         rts
                           1241 ;
   17D0                    1242 L17D0:
   17D0 A0 00         [ 2] 1243         ldy     #0x00                                   ; code found
   17D2 A5 64         [ 3] 1244         lda     RAM_64
   17D4 4A            [ 2] 1245         lsr     a                                       ; get bottom bit on/off into carry
   17D5 A5 68         [ 3] 1246         lda     RAM_68                                  ; get bitmask
   17D7 B0 08         [ 4] 1247         bcs     L17E1                                   ; if on, jump ahead
   17D9 49 FF         [ 2] 1248         eor     #0xFF
   17DB 31 66         [ 6] 1249         and     [RAM_66],y
   17DD                    1250 L17DD:
   17DD 91 66         [ 6] 1251         sta     [RAM_66],y                              ; set bit in 0066
   17DF 38            [ 2] 1252         sec                                             ; code found
   17E0 60            [ 6] 1253         rts
                           1254 ;
   17E1                    1255 L17E1:
   17E1 11 66         [ 6] 1256         ora     [RAM_66],y
   17E3 4C DD 17      [ 3] 1257         jmp     L17DD
                           1258 ;
                           1259 ;       Act like call to L17AD, but if code not found, act like a you got a 0028
                           1260 ;
   17E6                    1261 L17E6:
   17E6 20 AD 17      [ 6] 1262         jsr     L17AD
   17E9 90 01         [ 4] 1263         bcc     L17EC
   17EB 60            [ 6] 1264         rts
                           1265 ;
   17EC                    1266 L17EC:
   17EC A9 28         [ 2] 1267         lda     #0x28
   17EE 4C AF 17      [ 3] 1268         jmp     L17AF
                           1269 ;
   17F1                    1270 L17F1:
   17F1 A5 65         [ 3] 1271         lda     RAM_65
   17F3 C9 40         [ 2] 1272         cmp     #0x40
   17F5 90 16         [ 4] 1273         bcc     L180D                                   ; < 0x40, ignore
   17F7 C9 60         [ 2] 1274         cmp     #0x60
   17F9 B0 12         [ 4] 1275         bcs     L180D                                   ; >= 0x60, ignore
   17FB 38            [ 2] 1276         sec
   17FC E9 40         [ 2] 1277         sbc     #0x40                                   ; range is 0x00 to 0x1f now
   17FE 0A            [ 2] 1278         asl     a
   17FF A8            [ 2] 1279         tay
   1800 B9 C2 1D      [ 5] 1280         lda     X1DC2,y
   1803 85 66         [ 3] 1281         sta     RAM_66
   1805 B9 C3 1D      [ 5] 1282         lda     X1DC2+1,y
   1808 85 68         [ 3] 1283         sta     RAM_68
   180A 4C D0 17      [ 3] 1284         jmp     L17D0
   180D                    1285 L180D:
   180D 60            [ 6] 1286         rts
                           1287 ;
                           1288 ;       Act like call to L17AD, but if code not found, act like a you got a 0030
                           1289 ;
   180E                    1290 L180E:
   180E 20 AD 17      [ 6] 1291         jsr     L17AD
   1811 B0 05         [ 4] 1292         bcs     L1818
   1813 A9 30         [ 2] 1293         lda     #0x30
   1815 20 AF 17      [ 6] 1294         jsr     L17AF
   1818                    1295 L1818:
   1818 60            [ 6] 1296         rts
                           1297 ;
   1819                    1298 L1819:
   1819 60            [ 6] 1299         rts
                           1300 ;
   181A                    1301 L181A:
   181A AD 05 02      [ 4] 1302         lda     U18_edge_detect_control_DI_pos
   181D 30 03         [ 4] 1303         bmi     L1822
   181F 4C 78 17      [ 3] 1304         jmp     L1778
                           1305 ;
   1822                    1306 L1822:
   1822 20 00 16      [ 6] 1307         jsr     AGCUPD
   1825 AD 02 03      [ 4] 1308         lda     transport_periph$ddr_reg_b
   1828 4A            [ 2] 1309         lsr     a
   1829 90 04         [ 4] 1310         bcc     L182F
   182B A9 06         [ 2] 1311         lda     #0x06
   182D 85 4B         [ 3] 1312         sta     RAM_4B
   182F                    1313 L182F:
   182F A5 4B         [ 3] 1314         lda     RAM_4B
   1831 F0 07         [ 4] 1315         beq     L183A
   1833 AD 00 02      [ 4] 1316         lda     U18_PORTA
   1836 29 40         [ 2] 1317         and     #0x40                   ; SKIP button pushed?
   1838 D0 0E         [ 4] 1318         bne     L1848                   ; if not, jump ahead
   183A                    1319 L183A:
   183A 20 99 16      [ 6] 1320         jsr     L1699
   183D 20 FC 18      [ 6] 1321         jsr     L18FC
   1840 20 B5 18      [ 6] 1322         jsr     L18B5
   1843 A9 00         [ 2] 1323         lda     #0x00
   1845 85 63         [ 3] 1324         sta     RAM_63
   1847 60            [ 6] 1325         rts
                           1326 ;
   1848                    1327 L1848:
   1848 A5 6A         [ 3] 1328         lda     RAM_6A
   184A AA            [ 2] 1329         tax
   184B 29 04         [ 2] 1330         and     #0x04
   184D F0 10         [ 4] 1331         beq     L185F
   184F A5 4C         [ 3] 1332         lda     RAM_4C
   1851 C9 2B         [ 2] 1333         cmp     #0x2B
   1853 B0 15         [ 4] 1334         bcs     L186A
   1855 C9 00         [ 2] 1335         cmp     #0x00
   1857 F0 0A         [ 4] 1336         beq     L1863
   1859 8A            [ 2] 1337         txa
   185A 29 FB         [ 2] 1338         and     #0xFB
   185C 4C 68 18      [ 3] 1339         jmp     L1868
                           1340 ;
   185F                    1341 L185F:
   185F A9 64         [ 2] 1342         lda     #0x64
   1861 85 4F         [ 3] 1343         sta     RAM_4F
   1863                    1344 L1863:
   1863 A9 3C         [ 2] 1345         lda     #0x3C
   1865 85 4C         [ 3] 1346         sta     RAM_4C
   1867 8A            [ 2] 1347         txa
   1868                    1348 L1868:
   1868 85 94         [ 3] 1349         sta     board_6_periph$ddr_reg_a
   186A                    1350 L186A:
   186A A5 6A         [ 3] 1351         lda     RAM_6A
   186C 29 04         [ 2] 1352         and     #0x04
   186E F0 0A         [ 4] 1353         beq     L187A
   1870 A5 4F         [ 3] 1354         lda     RAM_4F
   1872 D0 06         [ 4] 1355         bne     L187A
   1874 A5 6A         [ 3] 1356         lda     RAM_6A
   1876 29 FB         [ 2] 1357         and     #0xFB
   1878 85 6A         [ 3] 1358         sta     RAM_6A
   187A                    1359 L187A:
   187A A5 69         [ 3] 1360         lda     RAM_69
   187C 29 3E         [ 2] 1361         and     #0x3E
   187E 85 68         [ 3] 1362         sta     RAM_68
   1880 D0 04         [ 4] 1363         bne     L1886
   1882                    1364 L1882:
   1882 A9 0C         [ 2] 1365         lda     #0x0C
   1884 85 50         [ 3] 1366         sta     RAM_50
   1886                    1367 L1886:
   1886 A5 50         [ 3] 1368         lda     RAM_50
   1888 C9 07         [ 2] 1369         cmp     #0x07
   188A B0 08         [ 4] 1370         bcs     L1894
   188C C9 00         [ 2] 1371         cmp     #0x00
   188E F0 F2         [ 4] 1372         beq     L1882
   1890 A9 00         [ 2] 1373         lda     #0x00
   1892 85 68         [ 3] 1374         sta     RAM_68
   1894                    1375 L1894:
   1894 A5 92         [ 3] 1376         lda     board_5_periph$ddr_reg_b
   1896 29 C1         [ 2] 1377         and     #0xC1
   1898 05 68         [ 3] 1378         ora     RAM_68
   189A 85 92         [ 3] 1379         sta     board_5_periph$ddr_reg_b
   189C 4C 78 17      [ 3] 1380         jmp     L1778
                           1381 ;
   189F                    1382 L189F:
   189F A9 34         [ 2] 1383         lda     #0x34
   18A1 48            [ 3] 1384         pha
   18A2 A9 40         [ 2] 1385         lda     #0x40
   18A4 A0 34         [ 2] 1386         ldy     #0x34
   18A6 A2 3C         [ 2] 1387         ldx     #0x3C
   18A8 D0 14         [ 4] 1388         bne     L18BE
   18AA                    1389 L18AA:
   18AA A9 34         [ 2] 1390         lda     #0x34
   18AC 48            [ 3] 1391         pha
   18AD A9 00         [ 2] 1392         lda     #0x00
   18AF A0 3C         [ 2] 1393         ldy     #0x3C
   18B1 A2 34         [ 2] 1394         ldx     #0x34
   18B3 D0 09         [ 4] 1395         bne     L18BE
   18B5                    1396 L18B5:
   18B5 A9 3C         [ 2] 1397         lda     #0x3C
   18B7 48            [ 3] 1398         pha
   18B8 A9 00         [ 2] 1399         lda     #0x00
   18BA A0 3C         [ 2] 1400         ldy     #0x3C
   18BC A2 3C         [ 2] 1401         ldx     #0x3C
   18BE                    1402 L18BE:
   18BE 8E 81 03      [ 4] 1403         stx     audio_control_reg_a
   18C1 8C 83 03      [ 4] 1404         sty     audio_control_reg_b
   18C4 A2 00         [ 2] 1405         ldx     #0x00
   18C6 20 D0 18      [ 6] 1406         jsr     L18D0
   18C9 68            [ 4] 1407         pla
   18CA A2 01         [ 2] 1408         ldx     #0x01
   18CC 20 D0 18      [ 6] 1409         jsr     L18D0
   18CF 60            [ 6] 1410         rts
                           1411 ;
   18D0                    1412 L18D0:
   18D0 95 82         [ 4] 1413         sta     board_1_periph$ddr_reg_b,x
   18D2 E8            [ 2] 1414         inx
   18D3 E8            [ 2] 1415         inx
   18D4 E8            [ 2] 1416         inx
   18D5 E8            [ 2] 1417         inx
   18D6 E0 17         [ 2] 1418         cpx     #0x17
   18D8 90 F6         [ 4] 1419         bcc     L18D0
   18DA 60            [ 6] 1420         rts
                           1421 ;
                           1422 ;       Act like call to L17AD, but if code not found, act like a you got a 002C
                           1423 ;
   18DB                    1424 L18DB:
   18DB 20 AD 17      [ 6] 1425         jsr     L17AD
   18DE 90 01         [ 4] 1426         bcc     L18E1
   18E0 60            [ 6] 1427         rts
                           1428 ;
   18E1                    1429 L18E1:
   18E1 A9 2C         [ 2] 1430         lda     #0x2C
   18E3 4C AF 17      [ 3] 1431         jmp     L17AF
                           1432 ;
                           1433 ;       Act like call to L17AD, but if code not found, act like a you got a 002E
                           1434 ;
   18E6                    1435 L18E6:
   18E6 20 AD 17      [ 6] 1436         jsr     L17AD
   18E9 90 01         [ 4] 1437         bcc     L18EC
   18EB 60            [ 6] 1438         rts
                           1439 ;
   18EC                    1440 L18EC:
   18EC A9 2E         [ 2] 1441         lda     #0x2E
   18EE 4C AF 17      [ 3] 1442         jmp     L17AF
                           1443 ;
                           1444 ;       Act like call to L17AD, but if code not found, act like a you got a 0040
                           1445 ;
   18F1                    1446 L18F1:
   18F1 20 AD 17      [ 6] 1447         jsr     L17AD
   18F4 90 01         [ 4] 1448         bcc     L18F7
   18F6 60            [ 6] 1449         rts
                           1450 ;
   18F7                    1451 L18F7:
   18F7 A9 40         [ 2] 1452         lda     #0x40
   18F9 4C AF 17      [ 3] 1453         jmp     L17AF
                           1454 ;
   18FC                    1455 L18FC:
   18FC A9 FA         [ 2] 1456         lda     #0xFA
   18FE 85 3E         [ 3] 1457         sta     RAM_3E
   1900 A9 E6         [ 2] 1458         lda     #0xE6
   1902 85 3F         [ 3] 1459         sta     RAM_3F
   1904 A9 D2         [ 2] 1460         lda     #0xD2
   1906 85 40         [ 3] 1461         sta     RAM_40
   1908 A9 BE         [ 2] 1462         lda     #0xBE
   190A 85 41         [ 3] 1463         sta     RAM_41
   190C A9 AA         [ 2] 1464         lda     #0xAA
   190E 85 42         [ 3] 1465         sta     RAM_42
                           1466 
                           1467         ;       Init Table addresses
                           1468 
   1910 A9 2F         [ 2] 1469         lda     #0x2F                   ; X1A2F - board 1 related?
   1912 85 38         [ 3] 1470         sta     RAM_38
   1914 A9 1A         [ 2] 1471         lda     #0x1A
   1916 85 39         [ 3] 1472         sta     RAM_39
                           1473 
   1918 A9 01         [ 2] 1474         lda     #0x01                   ; X1B01 - board 2 related?
   191A 85 34         [ 3] 1475         sta     RAM_34
   191C A9 1B         [ 2] 1476         lda     #0x1B
   191E 85 35         [ 3] 1477         sta     RAM_35
                           1478 
   1920 A9 B9         [ 2] 1479         lda     #0xB9                   ; X1BB9 - board 5 related?
   1922 85 36         [ 3] 1480         sta     RAM_36
   1924 A9 1B         [ 2] 1481         lda     #0x1B
   1926 85 37         [ 3] 1482         sta     RAM_37
                           1483 
   1928 A9 4B         [ 2] 1484         lda     #0x4B                   ; X1C4B - board 4 related?
   192A 85 3A         [ 3] 1485         sta     RAM_3A
   192C A9 1C         [ 2] 1486         lda     #0x1C
   192E 85 3B         [ 3] 1487         sta     RAM_3B
                           1488 
   1930 A9 05         [ 2] 1489         lda     #0x05                   ; X1D05 - board 3 related?
   1932 85 3C         [ 3] 1490         sta     RAM_3C
   1934 A9 1D         [ 2] 1491         lda     #0x1D
   1936 85 3D         [ 3] 1492         sta     RAM_3D
   1938 60            [ 6] 1493         rts
                           1494 ;
   1939                    1495 L1939:
   1939 20 49 19      [ 6] 1496         jsr     L1949                   ; do something to board 1
   193C 20 77 19      [ 6] 1497         jsr     L1977                   ; do something to board 2
   193F 20 A5 19      [ 6] 1498         jsr     L19A5                   ; do something to board 5
   1942 20 D3 19      [ 6] 1499         jsr     L19D3                   ; do something to board 4
   1945 20 01 1A      [ 6] 1500         jsr     L1A01                   ; do something to board 3
   1948 60            [ 6] 1501         rts
                           1502 
                           1503 ; do something to board 1
   1949                    1504 L1949:
   1949 A0 00         [ 2] 1505         ldy     #0x00
   194B B1 38         [ 6] 1506         lda     [RAM_38],y
   194D C9 FF         [ 2] 1507         cmp     #0xFF
   194F F0 17         [ 4] 1508         beq     L1968
   1951 C5 3E         [ 3] 1509         cmp     RAM_3E
   1953 D0 12         [ 4] 1510         bne     L1967
   1955 C8            [ 2] 1511         iny
   1956 B1 38         [ 6] 1512         lda     [RAM_38],y
   1958 85 80         [ 3] 1513         sta     board_1_periph$ddr_reg_a
   195A 18            [ 2] 1514         clc
   195B A5 38         [ 3] 1515         lda     RAM_38
   195D 69 02         [ 2] 1516         adc     #0x02
   195F 85 38         [ 3] 1517         sta     RAM_38
   1961 A5 39         [ 3] 1518         lda     RAM_39
   1963 69 00         [ 2] 1519         adc     #0x00
   1965 85 39         [ 3] 1520         sta     RAM_39
   1967                    1521 L1967:
   1967 60            [ 6] 1522         rts
                           1523 ;
   1968                    1524 L1968:
   1968 A9 2F         [ 2] 1525         lda     #0x2F
   196A 85 38         [ 3] 1526         sta     RAM_38
   196C A9 1A         [ 2] 1527         lda     #0x1A
   196E 85 39         [ 3] 1528         sta     RAM_39
   1970 A9 FA         [ 2] 1529         lda     #0xFA
   1972 85 3E         [ 3] 1530         sta     RAM_3E
   1974 4C 67 19      [ 3] 1531         jmp     L1967
                           1532 
                           1533 ; do something to board 2
   1977                    1534 L1977:
   1977 A0 00         [ 2] 1535         ldy     #0x00
   1979 B1 34         [ 6] 1536         lda     [RAM_34],y
   197B C9 FF         [ 2] 1537         cmp     #0xFF
   197D F0 17         [ 4] 1538         beq     L1996
   197F C5 3F         [ 3] 1539         cmp     RAM_3F
   1981 D0 12         [ 4] 1540         bne     L1995
   1983 C8            [ 2] 1541         iny
   1984 B1 34         [ 6] 1542         lda     [RAM_34],y
   1986 85 84         [ 3] 1543         sta     board_2_periph$ddr_reg_a
   1988 18            [ 2] 1544         clc
   1989 A5 34         [ 3] 1545         lda     RAM_34
   198B 69 02         [ 2] 1546         adc     #0x02
   198D 85 34         [ 3] 1547         sta     RAM_34
   198F A5 35         [ 3] 1548         lda     RAM_35
   1991 69 00         [ 2] 1549         adc     #0x00
   1993 85 35         [ 3] 1550         sta     RAM_35
   1995                    1551 L1995:
   1995 60            [ 6] 1552         rts
                           1553 ;
   1996                    1554 L1996:
   1996 A9 01         [ 2] 1555         lda     #0x01
   1998 85 34         [ 3] 1556         sta     RAM_34
   199A A9 1B         [ 2] 1557         lda     #0x1B
   199C 85 35         [ 3] 1558         sta     RAM_35
   199E A9 E6         [ 2] 1559         lda     #0xE6
   19A0 85 3F         [ 3] 1560         sta     RAM_3F
   19A2 4C 95 19      [ 3] 1561         jmp     L1995
                           1562 
                           1563 ; do something to board 5
   19A5                    1564 L19A5:
   19A5 A0 00         [ 2] 1565         ldy     #0x00
   19A7 B1 36         [ 6] 1566         lda     [RAM_36],y
   19A9 C9 FF         [ 2] 1567         cmp     #0xFF
   19AB F0 17         [ 4] 1568         beq     L19C4
   19AD C5 40         [ 3] 1569         cmp     RAM_40
   19AF D0 12         [ 4] 1570         bne     L19C3
   19B1 C8            [ 2] 1571         iny
   19B2 B1 36         [ 6] 1572         lda     [RAM_36],y
   19B4 85 90         [ 3] 1573         sta     board_5_periph$ddr_reg_a
   19B6 18            [ 2] 1574         clc
   19B7 A5 36         [ 3] 1575         lda     RAM_36
   19B9 69 02         [ 2] 1576         adc     #0x02
   19BB 85 36         [ 3] 1577         sta     RAM_36
   19BD A5 37         [ 3] 1578         lda     RAM_37
   19BF 69 00         [ 2] 1579         adc     #0x00
   19C1 85 37         [ 3] 1580         sta     RAM_37
   19C3                    1581 L19C3:
   19C3 60            [ 6] 1582         rts
                           1583 ;
   19C4                    1584 L19C4:
   19C4 A9 B9         [ 2] 1585         lda     #0xB9
   19C6 85 36         [ 3] 1586         sta     RAM_36
   19C8 A9 1B         [ 2] 1587         lda     #0x1B
   19CA 85 37         [ 3] 1588         sta     RAM_37
   19CC A9 D2         [ 2] 1589         lda     #0xD2
   19CE 85 40         [ 3] 1590         sta     RAM_40
   19D0 4C C3 19      [ 3] 1591         jmp     L19C3
                           1592 
                           1593 ; do something to board 4
   19D3                    1594 L19D3:
   19D3 A0 00         [ 2] 1595         ldy     #0x00
   19D5 B1 3A         [ 6] 1596         lda     [RAM_3A],y
   19D7 C9 FF         [ 2] 1597         cmp     #0xFF
   19D9 F0 17         [ 4] 1598         beq     L19F2
   19DB C5 41         [ 3] 1599         cmp     RAM_41
   19DD D0 12         [ 4] 1600         bne     L19F1
   19DF C8            [ 2] 1601         iny
   19E0 B1 3A         [ 6] 1602         lda     [RAM_3A],y
   19E2 85 8C         [ 3] 1603         sta     board_4_periph$ddr_reg_a
   19E4 18            [ 2] 1604         clc
   19E5 A5 3A         [ 3] 1605         lda     RAM_3A
   19E7 69 02         [ 2] 1606         adc     #0x02
   19E9 85 3A         [ 3] 1607         sta     RAM_3A
   19EB A5 3B         [ 3] 1608         lda     RAM_3B
   19ED 69 00         [ 2] 1609         adc     #0x00
   19EF 85 3B         [ 3] 1610         sta     RAM_3B
   19F1                    1611 L19F1:
   19F1 60            [ 6] 1612         rts
                           1613 ;
   19F2                    1614 L19F2:
   19F2 A9 4B         [ 2] 1615         lda     #0x4B
   19F4 85 3A         [ 3] 1616         sta     RAM_3A
   19F6 A9 1C         [ 2] 1617         lda     #0x1C
   19F8 85 3B         [ 3] 1618         sta     RAM_3B
   19FA A9 BE         [ 2] 1619         lda     #0xBE
   19FC 85 41         [ 3] 1620         sta     RAM_41
   19FE 4C F1 19      [ 3] 1621         jmp     L19F1
                           1622 
                           1623 ; do something to board 3
   1A01                    1624 L1A01:
   1A01 A0 00         [ 2] 1625         ldy     #0x00
   1A03 B1 3C         [ 6] 1626         lda     [RAM_3C],y
   1A05                    1627 L1A05:
   1A05 C9 FF         [ 2] 1628         cmp     #0xFF
   1A07 F0 17         [ 4] 1629         beq     L1A20
   1A09 C5 42         [ 3] 1630         cmp     RAM_42
   1A0B D0 12         [ 4] 1631         bne     L1A1F
   1A0D C8            [ 2] 1632         iny
   1A0E B1 3C         [ 6] 1633         lda     [RAM_3C],y
   1A10 85 88         [ 3] 1634         sta     board_3_periph$ddr_reg_a
   1A12 18            [ 2] 1635         clc
   1A13 A5 3C         [ 3] 1636         lda     RAM_3C
   1A15 69 02         [ 2] 1637         adc     #0x02
   1A17 85 3C         [ 3] 1638         sta     RAM_3C
   1A19 A5 3D         [ 3] 1639         lda     RAM_3D
   1A1B 69 00         [ 2] 1640         adc     #0x00
   1A1D 85 3D         [ 3] 1641         sta     RAM_3D
   1A1F                    1642 L1A1F:
   1A1F 60            [ 6] 1643         rts
                           1644 ;
   1A20                    1645 L1A20:
   1A20 A9 05         [ 2] 1646         lda     #0x05
   1A22 85 3C         [ 3] 1647         sta     RAM_3C
   1A24 A9 1D         [ 2] 1648         lda     #0x1D
   1A26 85 3D         [ 3] 1649         sta     RAM_3D
   1A28 A9 AA         [ 2] 1650         lda     #0xAA
   1A2A 85 42         [ 3] 1651         sta     RAM_42
   1A2C 4C 1F 1A      [ 3] 1652         jmp     L1A1F
                           1653 ;
                           1654 ;
                           1655 ;
   1A2F                    1656 X1A2F:
   1A2F FA 20              1657         .db     0xFA, 0x20
   1A31 FA 20              1658         .db     0xFA, 0x20
   1A33 F6 22              1659         .db     0xF6, 0x22
   1A35 F5 20              1660         .db     0xF5, 0x20
   1A37 F5 20              1661         .db     0xF5, 0x20
   1A39 F3 22              1662         .db     0xF3, 0x22
   1A3B F2 20              1663         .db     0xF2, 0x20
   1A3D E5 22              1664         .db     0xE5, 0x22
   1A3F E5 22              1665         .db     0xE5, 0x22
   1A41 E2 20              1666         .db     0xE2, 0x20
   1A43 D2 20              1667         .db     0xD2, 0x20
   1A45 BE 00              1668         .db     0xBE, 0x00
   1A47 BC 22              1669         .db     0xBC, 0x22
   1A49 BB 30              1670         .db     0xBB, 0x30
   1A4B B9 32              1671         .db     0xB9, 0x32
   1A4D B9 32              1672         .db     0xB9, 0x32
   1A4F B7 30              1673         .db     0xB7, 0x30
   1A51 B6 32              1674         .db     0xB6, 0x32
   1A53 B5 30              1675         .db     0xB5, 0x30
   1A55 B4 32              1676         .db     0xB4, 0x32
   1A57 B4 32              1677         .db     0xB4, 0x32
   1A59 B3 20              1678         .db     0xB3, 0x20
   1A5B B3 20              1679         .db     0xB3, 0x20
   1A5D B1 A0              1680         .db     0xB1, 0xA0
   1A5F B1 A0              1681         .db     0xB1, 0xA0
   1A61 B0 A2              1682         .db     0xB0, 0xA2
   1A63 AF A0              1683         .db     0xAF, 0xA0
   1A65 AF A6              1684         .db     0xAF, 0xA6
   1A67 AE A0              1685         .db     0xAE, 0xA0
   1A69 AE A6              1686         .db     0xAE, 0xA6
   1A6B AD A4              1687         .db     0xAD, 0xA4
   1A6D AC A0              1688         .db     0xAC, 0xA0
   1A6F AC A0              1689         .db     0xAC, 0xA0
   1A71 AB A0              1690         .db     0xAB, 0xA0
   1A73 AA A0              1691         .db     0xAA, 0xA0
   1A75 AA A0              1692         .db     0xAA, 0xA0
   1A77 A2 80              1693         .db     0xA2, 0x80
   1A79 A0 A0              1694         .db     0xA0, 0xA0
   1A7B A0 A0              1695         .db     0xA0, 0xA0
   1A7D 8D 80              1696         .db     0x8D, 0x80
   1A7F 8A A0              1697         .db     0x8A, 0xA0
   1A81 7E 80              1698         .db     0x7E, 0x80
   1A83 7B A0              1699         .db     0x7B, 0xA0
   1A85 79 A4              1700         .db     0x79, 0xA4
   1A87 78 A0              1701         .db     0x78, 0xA0
   1A89 77 A4              1702         .db     0x77, 0xA4
   1A8B 76 A0              1703         .db     0x76, 0xA0
   1A8D 75 A4              1704         .db     0x75, 0xA4
   1A8F 74 A0              1705         .db     0x74, 0xA0
   1A91 73 A4              1706         .db     0x73, 0xA4
   1A93 72 A0              1707         .db     0x72, 0xA0
   1A95 71 A4              1708         .db     0x71, 0xA4
   1A97 70 A0              1709         .db     0x70, 0xA0
   1A99 6F A4              1710         .db     0x6F, 0xA4
   1A9B 6E A0              1711         .db     0x6E, 0xA0
   1A9D 6D A4              1712         .db     0x6D, 0xA4
   1A9F 6C A0              1713         .db     0x6C, 0xA0
   1AA1 69 80              1714         .db     0x69, 0x80
   1AA3 69 80              1715         .db     0x69, 0x80
   1AA5 67 A0              1716         .db     0x67, 0xA0
   1AA7 5E 20              1717         .db     0x5E, 0x20
   1AA9 58 24              1718         .db     0x58, 0x24
   1AAB 57 20              1719         .db     0x57, 0x20
   1AAD 57 20              1720         .db     0x57, 0x20
   1AAF 56 24              1721         .db     0x56, 0x24
   1AB1 55 20              1722         .db     0x55, 0x20
   1AB3 54 24              1723         .db     0x54, 0x24
   1AB5 54 24              1724         .db     0x54, 0x24
   1AB7 53 20              1725         .db     0x53, 0x20
   1AB9 52 24              1726         .db     0x52, 0x24
   1ABB 52 24              1727         .db     0x52, 0x24
   1ABD 50 20              1728         .db     0x50, 0x20
   1ABF 4F 24              1729         .db     0x4F, 0x24
   1AC1 4E 20              1730         .db     0x4E, 0x20
   1AC3 4D 24              1731         .db     0x4D, 0x24
   1AC5 4C 20              1732         .db     0x4C, 0x20
   1AC7 4C 20              1733         .db     0x4C, 0x20
   1AC9 4B 24              1734         .db     0x4B, 0x24
   1ACB 4A 20              1735         .db     0x4A, 0x20
   1ACD 49 20              1736         .db     0x49, 0x20
   1ACF 49 00              1737         .db     0x49, 0x00
   1AD1 48 20              1738         .db     0x48, 0x20
   1AD3 47 20              1739         .db     0x47, 0x20
   1AD5 47 20              1740         .db     0x47, 0x20
   1AD7 46 20              1741         .db     0x46, 0x20
   1AD9 45 24              1742         .db     0x45, 0x24
   1ADB 45 24              1743         .db     0x45, 0x24
   1ADD 44 20              1744         .db     0x44, 0x20
   1ADF 42 20              1745         .db     0x42, 0x20
   1AE1 42 20              1746         .db     0x42, 0x20
   1AE3 37 04              1747         .db     0x37, 0x04
   1AE5 35 20              1748         .db     0x35, 0x20
   1AE7 2E 04              1749         .db     0x2E, 0x04
   1AE9 2E 04              1750         .db     0x2E, 0x04
   1AEB 2D 20              1751         .db     0x2D, 0x20
   1AED 23 24              1752         .db     0x23, 0x24
   1AEF 21 20              1753         .db     0x21, 0x20
   1AF1 17 24              1754         .db     0x17, 0x24
   1AF3 13 00              1755         .db     0x13, 0x00
   1AF5 11 24              1756         .db     0x11, 0x24
   1AF7 10 30              1757         .db     0x10, 0x30
   1AF9 07 34              1758         .db     0x07, 0x34
   1AFB 06 30              1759         .db     0x06, 0x30
   1AFD 05 30              1760         .db     0x05, 0x30
   1AFF FF FF              1761         .db     0xFF, 0xFF
                           1762 ;
   1B01                    1763 X1B01:
   1B01 D7 22              1764         .db     0xD7, 0x22
   1B03 D5 20              1765         .db     0xD5, 0x20
   1B05 C9 22              1766         .db     0xC9, 0x22
   1B07 C7 20              1767         .db     0xC7, 0x20
   1B09 C4 24              1768         .db     0xC4, 0x24
   1B0B C3 20              1769         .db     0xC3, 0x20
   1B0D C2 24              1770         .db     0xC2, 0x24
   1B0F C1 20              1771         .db     0xC1, 0x20
   1B11 BF 24              1772         .db     0xBF, 0x24
   1B13 BF 24              1773         .db     0xBF, 0x24
   1B15 BE 20              1774         .db     0xBE, 0x20
   1B17 BD 24              1775         .db     0xBD, 0x24
   1B19 BC 20              1776         .db     0xBC, 0x20
   1B1B BB 24              1777         .db     0xBB, 0x24
   1B1D BA 20              1778         .db     0xBA, 0x20
   1B1F B9 20              1779         .db     0xB9, 0x20
   1B21 B8 24              1780         .db     0xB8, 0x24
   1B23 B7 20              1781         .db     0xB7, 0x20
   1B25 B4 00              1782         .db     0xB4, 0x00
   1B27 B4 00              1783         .db     0xB4, 0x00
   1B29 B2 20              1784         .db     0xB2, 0x20
   1B2B A9 20              1785         .db     0xA9, 0x20
   1B2D A3 20              1786         .db     0xA3, 0x20
   1B2F A2 20              1787         .db     0xA2, 0x20
   1B31 A1 20              1788         .db     0xA1, 0x20
   1B33 A0 20              1789         .db     0xA0, 0x20
   1B35 A0 20              1790         .db     0xA0, 0x20
   1B37 9F 20              1791         .db     0x9F, 0x20
   1B39 9F 20              1792         .db     0x9F, 0x20
   1B3B 9E 20              1793         .db     0x9E, 0x20
   1B3D 9D 24              1794         .db     0x9D, 0x24
   1B3F 9D 24              1795         .db     0x9D, 0x24
   1B41 9B 20              1796         .db     0x9B, 0x20
   1B43 9A 24              1797         .db     0x9A, 0x24
   1B45 99 20              1798         .db     0x99, 0x20
   1B47 98 20              1799         .db     0x98, 0x20
   1B49 97 24              1800         .db     0x97, 0x24
   1B4B 97 24              1801         .db     0x97, 0x24
   1B4D 95 20              1802         .db     0x95, 0x20
   1B4F 95 20              1803         .db     0x95, 0x20
   1B51 94 00              1804         .db     0x94, 0x00
   1B53 94 00              1805         .db     0x94, 0x00
   1B55 93 20              1806         .db     0x93, 0x20
   1B57 92 00              1807         .db     0x92, 0x00
   1B59 92 00              1808         .db     0x92, 0x00
   1B5B 91 20              1809         .db     0x91, 0x20
   1B5D 90 20              1810         .db     0x90, 0x20
   1B5F 90 20              1811         .db     0x90, 0x20
   1B61 8F 20              1812         .db     0x8F, 0x20
   1B63 8D 20              1813         .db     0x8D, 0x20
   1B65 8D 20              1814         .db     0x8D, 0x20
   1B67 81 00              1815         .db     0x81, 0x00
   1B69 7F 20              1816         .db     0x7F, 0x20
   1B6B 79 00              1817         .db     0x79, 0x00
   1B6D 79 00              1818         .db     0x79, 0x00
   1B6F 78 20              1819         .db     0x78, 0x20
   1B71 76 20              1820         .db     0x76, 0x20
   1B73 6B 00              1821         .db     0x6B, 0x00
   1B75 69 20              1822         .db     0x69, 0x20
   1B77 5E 00              1823         .db     0x5E, 0x00
   1B79 5C 20              1824         .db     0x5C, 0x20
   1B7B 5B 30              1825         .db     0x5B, 0x30
   1B7D 52 10              1826         .db     0x52, 0x10
   1B7F 51 30              1827         .db     0x51, 0x30
   1B81 50 30              1828         .db     0x50, 0x30
   1B83 50 30              1829         .db     0x50, 0x30
   1B85 4F 20              1830         .db     0x4F, 0x20
   1B87 4E 20              1831         .db     0x4E, 0x20
   1B89 4E 20              1832         .db     0x4E, 0x20
   1B8B 4D 20              1833         .db     0x4D, 0x20
   1B8D 46 A0              1834         .db     0x46, 0xA0
   1B8F 45 A0              1835         .db     0x45, 0xA0
   1B91 3D A0              1836         .db     0x3D, 0xA0
   1B93 3D A0              1837         .db     0x3D, 0xA0
   1B95 39 20              1838         .db     0x39, 0x20
   1B97 2A 00              1839         .db     0x2A, 0x00
   1B99 28 20              1840         .db     0x28, 0x20
   1B9B 1E 00              1841         .db     0x1E, 0x00
   1B9D 1C 22              1842         .db     0x1C, 0x22
   1B9F 1C 22              1843         .db     0x1C, 0x22
   1BA1 1B 20              1844         .db     0x1B, 0x20
   1BA3 1A 22              1845         .db     0x1A, 0x22
   1BA5 19 20              1846         .db     0x19, 0x20
   1BA7 18 22              1847         .db     0x18, 0x22
   1BA9 18 22              1848         .db     0x18, 0x22
   1BAB 16 20              1849         .db     0x16, 0x20
   1BAD 15 22              1850         .db     0x15, 0x22
   1BAF 15 22              1851         .db     0x15, 0x22
   1BB1 14 A0              1852         .db     0x14, 0xA0
   1BB3 13 A2              1853         .db     0x13, 0xA2
   1BB5 11 A0              1854         .db     0x11, 0xA0
   1BB7 FF FF              1855         .db     0xFF, 0xFF
                           1856 ;
   1BB9                    1857 X1BB9:
   1BB9 CD 20              1858         .db     0xCD, 0x20
   1BBB CC 20              1859         .db     0xCC, 0x20
   1BBD CB 20              1860         .db     0xCB, 0x20
   1BBF CB 20              1861         .db     0xCB, 0x20
   1BC1 CA 00              1862         .db     0xCA, 0x00
   1BC3 C9 20              1863         .db     0xC9, 0x20
   1BC5 C9 20              1864         .db     0xC9, 0x20
   1BC7 C8 20              1865         .db     0xC8, 0x20
   1BC9 C1 A0              1866         .db     0xC1, 0xA0
   1BCB C0 A0              1867         .db     0xC0, 0xA0
   1BCD B8 A0              1868         .db     0xB8, 0xA0
   1BCF B8 20              1869         .db     0xB8, 0x20
   1BD1 B4 20              1870         .db     0xB4, 0x20
   1BD3 A6 00              1871         .db     0xA6, 0x00
   1BD5 A4 20              1872         .db     0xA4, 0x20
   1BD7 99 00              1873         .db     0x99, 0x00
   1BD9 97 22              1874         .db     0x97, 0x22
   1BDB 97 22              1875         .db     0x97, 0x22
   1BDD 96 20              1876         .db     0x96, 0x20
   1BDF 95 22              1877         .db     0x95, 0x22
   1BE1 94 20              1878         .db     0x94, 0x20
   1BE3 93 22              1879         .db     0x93, 0x22
   1BE5 93 22              1880         .db     0x93, 0x22
   1BE7 91 20              1881         .db     0x91, 0x20
   1BE9 90 20              1882         .db     0x90, 0x20
   1BEB 90 20              1883         .db     0x90, 0x20
   1BED 8D A0              1884         .db     0x8D, 0xA0
   1BEF 8C A0              1885         .db     0x8C, 0xA0
   1BF1 7D A2              1886         .db     0x7D, 0xA2
   1BF3 7D A2              1887         .db     0x7D, 0xA2
   1BF5 7B A0              1888         .db     0x7B, 0xA0
   1BF7 7B A0              1889         .db     0x7B, 0xA0
   1BF9 79 A2              1890         .db     0x79, 0xA2
   1BFB 79 A2              1891         .db     0x79, 0xA2
   1BFD 77 A0              1892         .db     0x77, 0xA0
   1BFF 77 A0              1893         .db     0x77, 0xA0
   1C01 76 80              1894         .db     0x76, 0x80
   1C03 75 A0              1895         .db     0x75, 0xA0
   1C05 6E 20              1896         .db     0x6E, 0x20
   1C07 67 24              1897         .db     0x67, 0x24
   1C09 66 20              1898         .db     0x66, 0x20
   1C0B 65 24              1899         .db     0x65, 0x24
   1C0D 64 20              1900         .db     0x64, 0x20
   1C0F 63 24              1901         .db     0x63, 0x24
   1C11 63 24              1902         .db     0x63, 0x24
   1C13 61 20              1903         .db     0x61, 0x20
   1C15 60 24              1904         .db     0x60, 0x24
   1C17 5F 20              1905         .db     0x5F, 0x20
   1C19 5E 20              1906         .db     0x5E, 0x20
   1C1B 5D 24              1907         .db     0x5D, 0x24
   1C1D 5C 20              1908         .db     0x5C, 0x20
   1C1F 5B 24              1909         .db     0x5B, 0x24
   1C21 5A 20              1910         .db     0x5A, 0x20
   1C23 59 24              1911         .db     0x59, 0x24
   1C25 58 20              1912         .db     0x58, 0x20
   1C27 56 20              1913         .db     0x56, 0x20
   1C29 55 04              1914         .db     0x55, 0x04
   1C2B 54 00              1915         .db     0x54, 0x00
   1C2D 53 24              1916         .db     0x53, 0x24
   1C2F 52 20              1917         .db     0x52, 0x20
   1C31 52 20              1918         .db     0x52, 0x20
   1C33 4F 24              1919         .db     0x4F, 0x24
   1C35 4F 24              1920         .db     0x4F, 0x24
   1C37 4E 30              1921         .db     0x4E, 0x30
   1C39 4D 30              1922         .db     0x4D, 0x30
   1C3B 47 10              1923         .db     0x47, 0x10
   1C3D 45 30              1924         .db     0x45, 0x30
   1C3F 35 30              1925         .db     0x35, 0x30
   1C41 33 10              1926         .db     0x33, 0x10
   1C43 31 30              1927         .db     0x31, 0x30
   1C45 31 30              1928         .db     0x31, 0x30
   1C47 1D 20              1929         .db     0x1D, 0x20
   1C49 FF FF              1930         .db     0xFF, 0xFF
                           1931 ;
   1C4B                    1932 X1C4B:
   1C4B BE 00              1933         .db     0xBE, 0x00
   1C4D BC 22              1934         .db     0xBC, 0x22
   1C4F BB 30              1935         .db     0xBB, 0x30
   1C51 B9 32              1936         .db     0xB9, 0x32
   1C53 B7 30              1937         .db     0xB7, 0x30
   1C55 B6 32              1938         .db     0xB6, 0x32
   1C57 B5 30              1939         .db     0xB5, 0x30
   1C59 B4 32              1940         .db     0xB4, 0x32
   1C5B B4 32              1941         .db     0xB4, 0x32
   1C5D B3 20              1942         .db     0xB3, 0x20
   1C5F B3 20              1943         .db     0xB3, 0x20
   1C61 B1 A0              1944         .db     0xB1, 0xA0
   1C63 B1 A0              1945         .db     0xB1, 0xA0
   1C65 B0 A2              1946         .db     0xB0, 0xA2
   1C67 AF A0              1947         .db     0xAF, 0xA0
   1C69 AF A6              1948         .db     0xAF, 0xA6
   1C6B AE A0              1949         .db     0xAE, 0xA0
   1C6D AE A6              1950         .db     0xAE, 0xA6
   1C6F AD A4              1951         .db     0xAD, 0xA4
   1C71 AC A0              1952         .db     0xAC, 0xA0
   1C73 AC A0              1953         .db     0xAC, 0xA0
   1C75 AB A0              1954         .db     0xAB, 0xA0
   1C77 AA A0              1955         .db     0xAA, 0xA0
   1C79 AA A0              1956         .db     0xAA, 0xA0
   1C7B A2 80              1957         .db     0xA2, 0x80
   1C7D A0 A0              1958         .db     0xA0, 0xA0
   1C7F A0 A0              1959         .db     0xA0, 0xA0
   1C81 8D 80              1960         .db     0x8D, 0x80
   1C83 8A A0              1961         .db     0x8A, 0xA0
   1C85 7E 80              1962         .db     0x7E, 0x80
   1C87 7B A0              1963         .db     0x7B, 0xA0
   1C89 79 A4              1964         .db     0x79, 0xA4
   1C8B 78 A0              1965         .db     0x78, 0xA0
   1C8D 77 A4              1966         .db     0x77, 0xA4
   1C8F 76 A0              1967         .db     0x76, 0xA0
   1C91 75 A4              1968         .db     0x75, 0xA4
   1C93 74 A0              1969         .db     0x74, 0xA0
   1C95 73 A4              1970         .db     0x73, 0xA4
   1C97 72 A0              1971         .db     0x72, 0xA0
   1C99 71 A4              1972         .db     0x71, 0xA4
   1C9B 70 A0              1973         .db     0x70, 0xA0
   1C9D 6F A4              1974         .db     0x6F, 0xA4
   1C9F 6E A0              1975         .db     0x6E, 0xA0
   1CA1 6D A4              1976         .db     0x6D, 0xA4
   1CA3 6C A0              1977         .db     0x6C, 0xA0
   1CA5 69 80              1978         .db     0x69, 0x80
   1CA7 69 80              1979         .db     0x69, 0x80
   1CA9 67 A0              1980         .db     0x67, 0xA0
   1CAB 5E 20              1981         .db     0x5E, 0x20
   1CAD 58 24              1982         .db     0x58, 0x24
   1CAF 57 20              1983         .db     0x57, 0x20
   1CB1 57 20              1984         .db     0x57, 0x20
   1CB3 56 24              1985         .db     0x56, 0x24
   1CB5 55 20              1986         .db     0x55, 0x20
   1CB7 54 24              1987         .db     0x54, 0x24
   1CB9 54 24              1988         .db     0x54, 0x24
   1CBB 53 20              1989         .db     0x53, 0x20
   1CBD 52 24              1990         .db     0x52, 0x24
   1CBF 52 24              1991         .db     0x52, 0x24
   1CC1 50 20              1992         .db     0x50, 0x20
   1CC3 4F 24              1993         .db     0x4F, 0x24
   1CC5 4E 20              1994         .db     0x4E, 0x20
   1CC7 4D 24              1995         .db     0x4D, 0x24
   1CC9 4C 20              1996         .db     0x4C, 0x20
   1CCB 4C 20              1997         .db     0x4C, 0x20
   1CCD 4B 24              1998         .db     0x4B, 0x24
   1CCF 4A 20              1999         .db     0x4A, 0x20
   1CD1 49 20              2000         .db     0x49, 0x20
   1CD3 49 00              2001         .db     0x49, 0x00
   1CD5 48 20              2002         .db     0x48, 0x20
   1CD7 47 20              2003         .db     0x47, 0x20
   1CD9 47 20              2004         .db     0x47, 0x20
   1CDB 46 20              2005         .db     0x46, 0x20
   1CDD 45 24              2006         .db     0x45, 0x24
   1CDF 45 24              2007         .db     0x45, 0x24
   1CE1 44 20              2008         .db     0x44, 0x20
   1CE3 42 20              2009         .db     0x42, 0x20
   1CE5 42 20              2010         .db     0x42, 0x20
   1CE7 37 04              2011         .db     0x37, 0x04
   1CE9 35 20              2012         .db     0x35, 0x20
   1CEB 2E 04              2013         .db     0x2E, 0x04
   1CED 2E 04              2014         .db     0x2E, 0x04
   1CEF 2D 20              2015         .db     0x2D, 0x20
   1CF1 23 24              2016         .db     0x23, 0x24
   1CF3 21 20              2017         .db     0x21, 0x20
   1CF5 17 24              2018         .db     0x17, 0x24
   1CF7 13 00              2019         .db     0x13, 0x00
   1CF9 11 24              2020         .db     0x11, 0x24
   1CFB 10 30              2021         .db     0x10, 0x30
   1CFD 07 34              2022         .db     0x07, 0x34
   1CFF 06 30              2023         .db     0x06, 0x30
   1D01 05 30              2024         .db     0x05, 0x30
   1D03 FF FF              2025         .db     0xFF, 0xFF
                           2026 ;
   1D05                    2027 X1D05:
   1D05 A9 20              2028         .db     0xA9, 0x20
   1D07 A3 20              2029         .db     0xA3, 0x20
   1D09 A2 20              2030         .db     0xA2, 0x20
   1D0B A1 20              2031         .db     0xA1, 0x20
   1D0D A0 20              2032         .db     0xA0, 0x20
   1D0F A0 20              2033         .db     0xA0, 0x20
   1D11 9F 20              2034         .db     0x9F, 0x20
   1D13 9F 20              2035         .db     0x9F, 0x20
   1D15 9E 20              2036         .db     0x9E, 0x20
   1D17 9D 24              2037         .db     0x9D, 0x24
   1D19 9D 24              2038         .db     0x9D, 0x24
   1D1B 9B 20              2039         .db     0x9B, 0x20
   1D1D 9A 24              2040         .db     0x9A, 0x24
   1D1F 99 20              2041         .db     0x99, 0x20
   1D21 98 20              2042         .db     0x98, 0x20
   1D23 97 24              2043         .db     0x97, 0x24
   1D25 97 24              2044         .db     0x97, 0x24
   1D27 95 20              2045         .db     0x95, 0x20
   1D29 95 20              2046         .db     0x95, 0x20
   1D2B 94 00              2047         .db     0x94, 0x00
   1D2D 94 00              2048         .db     0x94, 0x00
   1D2F 93 20              2049         .db     0x93, 0x20
   1D31 92 00              2050         .db     0x92, 0x00
   1D33 92 00              2051         .db     0x92, 0x00
   1D35 91 20              2052         .db     0x91, 0x20
   1D37 90 20              2053         .db     0x90, 0x20
   1D39 90 20              2054         .db     0x90, 0x20
   1D3B 8F 20              2055         .db     0x8F, 0x20
   1D3D 8D 20              2056         .db     0x8D, 0x20
   1D3F 8D 20              2057         .db     0x8D, 0x20
   1D41 81 00              2058         .db     0x81, 0x00
   1D43 7F 20              2059         .db     0x7F, 0x20
   1D45 79 00              2060         .db     0x79, 0x00
   1D47 79 00              2061         .db     0x79, 0x00
   1D49 78 20              2062         .db     0x78, 0x20
   1D4B 76 20              2063         .db     0x76, 0x20
   1D4D 6B 00              2064         .db     0x6B, 0x00
   1D4F 69 20              2065         .db     0x69, 0x20
   1D51 5E 00              2066         .db     0x5E, 0x00
   1D53 5C 20              2067         .db     0x5C, 0x20
   1D55 5B 30              2068         .db     0x5B, 0x30
   1D57 52 10              2069         .db     0x52, 0x10
   1D59 51 30              2070         .db     0x51, 0x30
   1D5B 50 30              2071         .db     0x50, 0x30
   1D5D 50 30              2072         .db     0x50, 0x30
   1D5F 4F 20              2073         .db     0x4F, 0x20
   1D61 4E 20              2074         .db     0x4E, 0x20
   1D63 4E 20              2075         .db     0x4E, 0x20
   1D65 4D 20              2076         .db     0x4D, 0x20
   1D67 46 A0              2077         .db     0x46, 0xA0
   1D69 45 A0              2078         .db     0x45, 0xA0
   1D6B 3D A0              2079         .db     0x3D, 0xA0
   1D6D 3D A0              2080         .db     0x3D, 0xA0
   1D6F 39 20              2081         .db     0x39, 0x20
   1D71 2A 00              2082         .db     0x2A, 0x00
   1D73 28 20              2083         .db     0x28, 0x20
   1D75 1E 00              2084         .db     0x1E, 0x00
   1D77 1C 22              2085         .db     0x1C, 0x22
   1D79 1C 22              2086         .db     0x1C, 0x22
   1D7B 1B 20              2087         .db     0x1B, 0x20
   1D7D 1A 22              2088         .db     0x1A, 0x22
   1D7F 19 20              2089         .db     0x19, 0x20
   1D81 18 22              2090         .db     0x18, 0x22
   1D83 18 22              2091         .db     0x18, 0x22
   1D85 16 20              2092         .db     0x16, 0x20
   1D87 15 22              2093         .db     0x15, 0x22
   1D89 15 22              2094         .db     0x15, 0x22
   1D8B 14 A0              2095         .db     0x14, 0xA0
   1D8D 13 A2              2096         .db     0x13, 0xA2
   1D8F 11 A0              2097         .db     0x11, 0xA0
   1D91 FF FF              2098         .db     0xFF, 0xFF
                           2099 ;
                           2100 ;       Jump Table - process command bytes
                           2101 ;
   1D93                    2102 X1D93:
   1D93 F1 17              2103         .dw     L17F1                   ; 0x22-23 ( "# card 7?) - extended codes?
   1D95 B1 1D              2104         .dw     IGNORE                  ; 0x24-25
   1D97 AD 17              2105         .dw     L17AD                   ; 0x26-27 ( &' ???)
   1D99 B1 1D              2106         .dw     IGNORE                  ; 0x28-29
   1D9B 0E 18              2107         .dw     L180E                   ; 0x2A-2B ( *+ card 8?) - def 30
   1D9D B1 1D              2108         .dw     IGNORE                  ; 0x2C-2D
   1D9F B1 1D              2109         .dw     IGNORE                  ; 0x2E-2F
   1DA1 B1 1D              2110         .dw     IGNORE                  ; 0x30-31
   1DA3 AD 17              2111         .dw     L17AD                   ; 0x32-33 ( 23 card 1?)
   1DA5 DB 18              2112         .dw     L18DB                   ; 0x34-35 ( 45 card 3?) - def 2C
   1DA7 F1 18              2113         .dw     L18F1                   ; 0x36-37 ( 67 card 2?) - def 40
   1DA9 19 18              2114         .dw     L1819                   ; 0x38-39 ( 89 card 6?) - do nothing?
   1DAB E6 17              2115         .dw     L17E6                   ; 0x3A-3B ( :; card 5?) - def 28
   1DAD E6 18              2116         .dw     L18E6                   ; 0x3C-3D ( <= card 4?) - def 2E
   1DAF AD 17              2117         .dw     L17AD                   ; 0x3E-3F ( >? ???)
                           2118 
   1DB1                    2119 IGNORE:
   1DB1 60            [ 6] 2120         rts
                           2121 ;
                           2122 ;       Memory address codes
                           2123 ;
   1DB2                    2124 X1DB2:
   1DB2 6A                 2125         .db     0x6A        ; 0x26 - ???
   1DB3 96                 2126         .db     0x96        ; 0x28 - board 6B
   1DB4 96                 2127         .db     0x96        ; 0x2A - board 6B
   1DB5 8A                 2128         .db     0x8A        ; 0x2C - board 3B
   1DB6 8E                 2129         .db     0x8E        ; 0x2E - board 4B
   1DB7 69                 2130         .db     0x69        ; 0x30 - ???
   1DB8 80                 2131         .db     0x80        ; 0x32 - board 1A
   1DB9 88                 2132         .db     0x88        ; 0x34 - board 3A
   1DBA 84                 2133         .db     0x84        ; 0x36 - board 2A
   1DBB 00                 2134         .db     0x00        ; 0x38
   1DBC 90                 2135         .db     0x90        ; 0x3A - board 5A
   1DBD 8C                 2136         .db     0x8C        ; 0x3C - board 4A
   1DBE 82                 2137         .db     0x82        ; 0x3E - board 1B
   1DBF 86                 2138         .db     0x86        ; 0x40 - board 2B
   1DC0 00                 2139         .db     0x00        ; 0x42
   1DC1 00                 2140         .db     0x00        ; 0x44
                           2141 ;
                           2142 ;       Extended codes for 0x22-0x23?
                           2143 ;
   1DC2                    2144 X1DC2:
   1DC2 9C 01              2145         .db     0x9C,0x01       ; 0x40, board 8A
   1DC4 98 02              2146         .db     0x98,0x02       ; 0x41, board 7A
   1DC6 9C 08              2147         .db     0x9C,0x08       ; 0x42, board 8A
   1DC8 9C 04              2148         .db     0x9C,0x04       ; 0x43, board 8A
   1DCA 9C 10              2149         .db     0x9C,0x10       ; 0x44, board 8A
   1DCC 98 04              2150         .db     0x98,0x04       ; 0x45, board 7A
   1DCE 98 08              2151         .db     0x98,0x08
   1DD0 9A 20              2152         .db     0x9A,0x20
   1DD2 9A 40              2153         .db     0x9A,0x40
   1DD4 9C 20              2154         .db     0x9C,0x20
   1DD6 9C 40              2155         .db     0x9C,0x40
   1DD8 9C 80              2156         .db     0x9C,0x80
   1DDA 9A 01              2157         .db     0x9A,0x01       ; 0x4C, board 7B
   1DDC 9A 08              2158         .db     0x9A,0x08       ; 0x4D, board 7B
   1DDE 9A 10              2159         .db     0x9A,0x10       ; 0x4E, board 7B
   1DE0 98 40              2160         .db     0x98,0x40       ; 0x4F, board 7A
   1DE2 98 80              2161         .db     0x98,0x80       ; 0x50, board 7A
   1DE4 9A 02              2162         .db     0x9A,0x02       ; 0x51, board 7B
   1DE6 9A 04              2163         .db     0x9A,0x04       ; 0x52, board 7B
   1DE8 98 10              2164         .db     0x98,0x10       ; 0x53, board 7A
   1DEA 98 20              2165         .db     0x98,0x20       ; 0x54, board 7A
   1DEC 9C 02              2166         .db     0x9C,0x02
   1DEE 9E 01              2167         .db     0x9E,0x01
   1DF0 9E 08              2168         .db     0x9E,0x08
   1DF2 9E 02              2169         .db     0x9E,0x02
   1DF4 98 01              2170         .db     0x98,0x01       ; 0x59, board 7A
   1DF6 00 80              2171         .db     0x00,0x80
   1DF8 9E 04              2172         .db     0x9E,0x04
   1DFA 9E 10              2173         .db     0x9E,0x10
   1DFC 9E 20              2174         .db     0x9E,0x20
   1DFE 9E 40              2175         .db     0x9E,0x40
   1E00 92 01              2176         .db     0x92,0x01       ; 0x5F, board 5B
   1E02 00 00              2177         .db     0x00,0x00
                           2178 ;
                           2179 ;       8 bytes per command, starting with 0x26, 0x28...
                           2180 ;
   1E04                    2181 X1E04:
   1E04 46 45 48 41 4A 4C  2182         .db     'F,'E,'H,'A,'J,'L,'I,'B, 0, 0, 0,'\,'W,'X, 0, 0     ; 0x26, 0x28
        49 42 00 00 00 5C
        57 58 00 00
   1E14 41 46 43 00 00 00  2183         .db     'A,'F,'C, 0, 0, 0, 0, 0,'G,'B,'E,'F,'J,'K, 0, 0     ; 0x2A, 0x2C
        00 00 47 42 45 46
        4A 4B 00 00
   1E24 47 42 43 45 46 4A  2184         .db     'G,'B,'C,'E,'F,'J, 0, 0, 0,'J,'I,'M,'K,'L, 0, 0     ; 0x2E, 0x30
        00 00 00 4A 49 4D
        4B 4C 00 00
   1E34 41 55 43 50 49 4E  2185         .db     'A,'U,'C,'P,'I,'N,'T,'V,'A,'D,'C,'V,'I,'N,'H,'T     ; 0x32, 0x34
        54 56 41 44 43 56
        49 4E 48 54
   1E44 41 48 47 50 49 4E  2186         .db     'A,'H,'G,'P,'I,'N,'T,'V, 0, 0, 0, 0, 0, 0, 0, 0     ; 0x36, 0x38
        54 56 00 00 00 00
        00 00 00 00
   1E54 41 44 43 50 46 4E  2187         .db     'A,'D,'C,'P,'F,'N,'K,'L,'A,'H,'L,'D,'I,'N,'T,'V     ; 0x3A, 0x3C
        4B 4C 41 48 4C 44
        49 4E 54 56
   1E64 41 44 43 50 49 42  2188         .db     'A,'D,'C,'P,'I,'B, 0, 0,'B,'C,'D,'E,'F,'J, 0, 0     ; 0x3E, 0x40
        00 00 42 43 44 45
        46 4A 00 00
                           2189 ;
                           2190 ;       Gap filled with 0xff here
                           2191 ;       
   1FFA                    2192         .org    0x1FFA
                           2193 ;
                           2194 ; vectors
                           2195 ;
   1FFA                    2196 NMIVEC:
   1FFA FF FF              2197             .dw     0xFFFF
   1FFC                    2198 RESETVEC:   
   1FFC 66 10              2199             .dw     RESET
   1FFE                    2200 IRQVEC:     
   1FFE 00 10              2201             .dw     IRQ
                           2202 
