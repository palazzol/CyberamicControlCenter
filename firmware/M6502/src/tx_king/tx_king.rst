                              1 
                              2         .area   region1 (ABS)
                              3 
                     0050     4 TIMER_1MS_A     = 0x0050    ; decremented every 1ms
                     0051     5 TIMER_1MS_B     = 0x0051    ; decremented every 1ms
                              6 
                     0053     7 TIMER_1MS_C     = 0x0053    ; decremented every 1ms
                     0054     8 TIMER_1MS_R     = 0x0054    ; decremented every 1ms, resets to 100
                     0055     9 TIMER_100MS_A   = 0X0055    ; decremented every 0.1s
                     0056    10 TIMER_100MS_R   = 0x0056    ; decremented every 0.1s, resets to 100
                     0057    11 TIMER_10S       = 0x0057    ; decremented every 10s
                     0058    12 TIMER_TMP1      = 0x0058    ; temp timer storage
                     0059    13 ZEROCROSS_CTR   = 0x0059    ; zero crossing counter
                     005A    14 TRACK_CTR       = 0x005A    ; track counter
                     005B    15 PROG_CTR        = 0x005B    ; number of PROG button presses
                     005C    16 PROG_STATE      = 0x005C    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
                     005D    17 TAPE_BYTE       = 0x005D    ; storage for incoming serial byte (& 0x7F)
                     005E    18 SOL_MASK        = 0x005E    ; bitmask for solenoids
                     005F    19 CURR_CHANNEL    = 0x005F    ; current channel serial byte
                     0060    20 TIMER_TMP       = 0x0060    ; temp timer storage
                     0061    21 AGC_LEVEL       = 0x0061    ; agc mic level
                     0062    22 AGC_ACCUM       = 0x0062    ; agc mic level accumulator
                     0063    23 AGC_SAMPLES     = 0x0063    ; agc mic sample counter
                     0064    24 AGC_GAIN        = 0x0064    ; agc calculated gain value
                     0065    25 CURR_PORT       = 0x0065    ; current channel port address
                     0066    26 TIMER_100MS_R25 = 0x0066    ; decremented every 0.1s, resets to 250
                     0067    27 RAM_67          = 0x0067    ; TBD?
                     0068    28 RAM_68          = 0x0068    ; TBD?
                             29 
                             30         .include "../../include/ptt6502.def"
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
                             31 
   1000                      32         .org    0x1000
                             33         
   1000 FF                   34         .byte   0xff                    ; Need this, or .s19 file wont start here
                             35 
   1A00                      36         .org    0x1A00
                             37 
   1A00                      38 RESET:
   1A00 D8            [ 2]   39         cld
   1A01 78            [ 2]   40         sei
   1A02 A2 F0         [ 2]   41         ldx     #0xF0
   1A04 9A            [ 2]   42         txs
   1A05 A9 00         [ 2]   43         lda     #0x00
   1A07 A2 10         [ 2]   44         ldx     #0x10
                             45 
   1A09                      46 ZERORAM:
   1A09 95 00         [ 4]   47         sta     RAM_start,x
   1A0B E8            [ 2]   48         inx
   1A0C E0 80         [ 2]   49         cpx     #0x80
   1A0E D0 F9         [ 4]   50         bne     ZERORAM
   1A10 A9 00         [ 2]   51         lda     #0x00
   1A12 8D 01 03      [ 4]   52         sta     transport_control_reg_a
   1A15 8D 00 03      [ 4]   53         sta     transport_periph$ddr_reg_a
   1A18 8D 81 03      [ 4]   54         sta     audio_control_reg_a
   1A1B 8D 80 03      [ 4]   55         sta     audio_periph$ddr_reg_a
   1A1E 8D 83 03      [ 4]   56         sta     audio_control_reg_b
   1A21 8D 05 02      [ 4]   57         sta     U18_edge_detect_control_DI_pos
   1A24 8D 03 03      [ 4]   58         sta     transport_control_reg_b
   1A27 8D 01 02      [ 4]   59         sta     U18_DDRA
   1A2A A9 02         [ 2]   60         lda     #0x02
   1A2C 8D 81 02      [ 4]   61         sta     U19_DDRA
   1A2F A9 FF         [ 2]   62         lda     #0xFF
   1A31 8D 82 03      [ 4]   63         sta     audio_periph$ddr_reg_b
   1A34 8D 03 02      [ 4]   64         sta     U18_DDRB
   1A37 8D 83 02      [ 4]   65         sta     U19_DDRB
   1A3A A9 FC         [ 2]   66         lda     #0xFC
   1A3C 8D 02 03      [ 4]   67         sta     transport_periph$ddr_reg_b
   1A3F A9 2E         [ 2]   68         lda     #0x2E
   1A41 8D 01 03      [ 4]   69         sta     transport_control_reg_a
   1A44 8D 03 03      [ 4]   70         sta     transport_control_reg_b
   1A47 A9 3C         [ 2]   71         lda     #0x3C
   1A49 8D 81 03      [ 4]   72         sta     audio_control_reg_a
   1A4C 8D 83 03      [ 4]   73         sta     audio_control_reg_b
   1A4F A9 64         [ 2]   74         lda     #0x64
   1A51 85 54         [ 3]   75         sta     TIMER_1MS_R
   1A53 A9 18         [ 2]   76         lda     #0x18
   1A55 85 57         [ 3]   77         sta     TIMER_10S
   1A57 A9 64         [ 2]   78         lda     #0x64
   1A59 85 56         [ 3]   79         sta     TIMER_100MS_R
   1A5B A9 0A         [ 2]   80         lda     #0x0A
   1A5D 85 64         [ 3]   81         sta     AGC_GAIN
   1A5F A9 10         [ 2]   82         lda     #TAPEMODE_STOP
   1A61 20 97 1B      [ 6]   83         jsr     TAPECMD
   1A64 A9 28         [ 2]   84         lda     #0x28
   1A66 85 55         [ 3]   85         sta     TIMER_100MS_A
   1A68 A9 64         [ 2]   86         lda     #0x64
   1A6A 85 54         [ 3]   87         sta     TIMER_1MS_R
   1A6C                      88 $1:
   1A6C 20 B7 1C      [ 6]   89         jsr     TUPDATE
   1A6F A5 55         [ 3]   90         lda     TIMER_100MS_A
   1A71 D0 F9         [ 4]   91         bne     $1
   1A73 20 64 1B      [ 6]   92         jsr     INITBRDS
   1A76                      93 REWIND:
   1A76 A9 FA         [ 2]   94         lda     #0xFA
   1A78 85 66         [ 3]   95         sta     TIMER_100MS_R25
   1A7A A9 00         [ 2]   96         lda     #0x00
   1A7C 85 67         [ 3]   97         sta     RAM_67
   1A7E 85 68         [ 3]   98         sta     RAM_68
   1A80 A9 30         [ 2]   99         lda     #0x30
   1A82 A9 40         [ 2]  100         lda     #TAPEMODE_REWIND
   1A84 20 97 1B      [ 6]  101         jsr     TAPECMD
                            102 
                            103 
   1A87                     104 L1A87:
   1A87 A9 00         [ 2]  105         lda     #0x00
   1A89 85 59         [ 3]  106         sta     ZEROCROSS_CTR
                            107 
                            108 
   1A8B                     109 L1A8B:
   1A8B AD 02 03      [ 4]  110         lda     transport_periph$ddr_reg_b
   1A8E A9 0A         [ 2]  111         lda     #0x0A
   1A90 85 50         [ 3]  112         sta     TIMER_1MS_A
   1A92 E6 59         [ 5]  113         inc     ZEROCROSS_CTR
   1A94 A5 59         [ 3]  114         lda     ZEROCROSS_CTR
   1A96 C9 64         [ 2]  115         cmp     #0x64
   1A98 B0 12         [ 4]  116         bcs     FINDTRK
                            117 
                            118 
   1A9A                     119 L1A9A:
   1A9A 20 B7 1C      [ 6]  120         jsr     TUPDATE
   1A9D 20 AB 1D      [ 6]  121         jsr     L1DAB
   1AA0 A5 50         [ 3]  122         lda     TIMER_1MS_A
   1AA2 F0 E3         [ 4]  123         beq     L1A87
   1AA4 AD 03 03      [ 4]  124         lda     transport_control_reg_b
   1AA7 10 F1         [ 4]  125         bpl     L1A9A
   1AA9 4C 8B 1A      [ 3]  126         jmp     L1A8B
                            127 
                            128 
   1AAC                     129 FINDTRK:
   1AAC A9 20         [ 2]  130         lda     #TAPEMODE_FFWD
   1AAE 20 97 1B      [ 6]  131         jsr     TAPECMD
   1AB1 A9 19         [ 2]  132         lda     #0x19
   1AB3 85 55         [ 3]  133         sta     TIMER_100MS_A
   1AB5 A9 64         [ 2]  134         lda     #0x64
   1AB7 85 54         [ 3]  135         sta     TIMER_1MS_R
                            136 
                            137 
   1AB9                     138 L1AB9:
   1AB9 20 B7 1C      [ 6]  139         jsr     TUPDATE
   1ABC 20 AB 1D      [ 6]  140         jsr     L1DAB
   1ABF A5 55         [ 3]  141         lda     TIMER_100MS_A
   1AC1 D0 F6         [ 4]  142         bne     L1AB9
   1AC3 A9 00         [ 2]  143         lda     #0x00
   1AC5 85 5A         [ 3]  144         sta     TRACK_CTR
   1AC7 20 B5 1B      [ 6]  145         jsr     WAITTONE
   1ACA A9 40         [ 2]  146         lda     #TAPEMODE_REWIND
   1ACC 20 97 1B      [ 6]  147         jsr     TAPECMD
   1ACF 20 B5 1B      [ 6]  148         jsr     WAITTONE
   1AD2 A9 FA         [ 2]  149         lda     #0xFA
   1AD4 85 50         [ 3]  150         sta     TIMER_1MS_A
                            151 
                            152 
   1AD6                     153 L1AD6:
   1AD6 20 B7 1C      [ 6]  154         jsr     TUPDATE
   1AD9 20 AB 1D      [ 6]  155         jsr     L1DAB
   1ADC A5 50         [ 3]  156         lda     TIMER_1MS_A
   1ADE D0 F6         [ 4]  157         bne     L1AD6
   1AE0 A9 20         [ 2]  158         lda     #TAPEMODE_FFWD
   1AE2 20 97 1B      [ 6]  159         jsr     TAPECMD
   1AE5 20 B5 1B      [ 6]  160         jsr     WAITTONE
   1AE8 E6 5A         [ 5]  161         inc     TRACK_CTR
   1AEA A9 10         [ 2]  162         lda     #TAPEMODE_STOP
   1AEC 20 97 1B      [ 6]  163         jsr     TAPECMD
   1AEF A9 80         [ 2]  164         lda     #TAPEMODE_PLAY
   1AF1 20 97 1B      [ 6]  165         jsr     TAPECMD
   1AF4 20 DB 1B      [ 6]  166         jsr     WAITCD
   1AF7 A9 10         [ 2]  167         lda     #TAPEMODE_STOP
   1AF9 20 97 1B      [ 6]  168         jsr     TAPECMD
   1AFC 20 64 1B      [ 6]  169         jsr     INITBRDS
                            170 
                            171 
   1AFF                     172 WAITPLAY:
   1AFF 20 B7 1C      [ 6]  173         jsr     TUPDATE
   1B02 20 67 1D      [ 6]  174         jsr     AGCUPD
   1B05 20 AB 1D      [ 6]  175         jsr     L1DAB
   1B08 A5 5B         [ 3]  176         lda     PROG_CTR
   1B0A D0 10         [ 4]  177         bne     STARTPLAY
   1B0C A9 02         [ 2]  178         lda     #0x02
   1B0E 8D 80 02      [ 4]  179         sta     U19_PORTA
   1B11 A9 00         [ 2]  180         lda     #0x00
   1B13 8D 02 02      [ 4]  181         sta     U18_PORTB
   1B16 A5 57         [ 3]  182         lda     TIMER_10S
   1B18 D0 E5         [ 4]  183         bne     WAITPLAY
   1B1A E6 5B         [ 5]  184         inc     PROG_CTR
                            185 
                            186 
   1B1C                     187 STARTPLAY:
   1B1C 20 64 1B      [ 6]  188         jsr     INITBRDS
   1B1F A9 00         [ 2]  189         lda     #0x00
   1B21 8D 80 02      [ 4]  190         sta     U19_PORTA
   1B24 A9 80         [ 2]  191         lda     #0x80
   1B26 8D 02 02      [ 4]  192         sta     U18_PORTB
   1B29 A9 80         [ 2]  193         lda     #TAPEMODE_PLAY
   1B2B 20 97 1B      [ 6]  194         jsr     TAPECMD
   1B2E 20 DB 1B      [ 6]  195         jsr     WAITCD
   1B31 C6 5B         [ 5]  196         dec     PROG_CTR
   1B33 20 0A 1C      [ 6]  197         jsr     PLAYTRK
   1B36 20 64 1B      [ 6]  198         jsr     INITBRDS
   1B39 A9 18         [ 2]  199         lda     #0x18
   1B3B 85 57         [ 3]  200         sta     TIMER_10S
   1B3D A9 64         [ 2]  201         lda     #0x64
   1B3F 85 56         [ 3]  202         sta     TIMER_100MS_R
   1B41 E6 5A         [ 5]  203         inc     TRACK_CTR
   1B43 A5 5A         [ 3]  204         lda     TRACK_CTR
   1B45 C9 1A         [ 2]  205         cmp     #0x1A
   1B47 90 03         [ 4]  206         bcc     NEXTTRK
   1B49 4C 76 1A      [ 3]  207         jmp     REWIND
                            208 
                            209 
   1B4C                     210 NEXTTRK:
   1B4C A9 00         [ 2]  211         lda     #0x00
   1B4E 85 67         [ 3]  212         sta     RAM_67
   1B50 85 68         [ 3]  213         sta     RAM_68
   1B52 A9 FA         [ 2]  214         lda     #0xFA
   1B54 85 66         [ 3]  215         sta     TIMER_100MS_R25
   1B56 20 DB 1B      [ 6]  216         jsr     WAITCD
   1B59 A9 10         [ 2]  217         lda     #TAPEMODE_STOP
   1B5B 20 97 1B      [ 6]  218         jsr     TAPECMD
   1B5E 20 1B 1D      [ 6]  219         jsr     AGCMICRD
   1B61 4C FF 1A      [ 3]  220         jmp     WAITPLAY
                            221 ;
                            222 ;       Init boards
                            223 ;
   1B64                     224 INITBRDS:
   1B64 A9 3C         [ 2]  225         lda     #0x3C
   1B66 8D 83 03      [ 4]  226         sta     audio_control_reg_b
   1B69 A9 34         [ 2]  227         lda     #0x34
   1B6B 8D 81 03      [ 4]  228         sta     audio_control_reg_a
   1B6E A2 00         [ 2]  229         ldx     #0x00
   1B70                     230 NEXTBRD:
   1B70 A9 30         [ 2]  231         lda     #0x30
   1B72 95 81         [ 4]  232         sta     0x81,x
   1B74 95 83         [ 4]  233         sta     0x83,x
   1B76 A9 FF         [ 2]  234         lda     #0xFF
   1B78 95 80         [ 4]  235         sta     0x80,x
   1B7A 95 82         [ 4]  236         sta     0x82,x
   1B7C A9 34         [ 2]  237         lda     #0x34
   1B7E 95 81         [ 4]  238         sta     0x81,x
   1B80 95 83         [ 4]  239         sta     0x83,x
   1B82 A9 00         [ 2]  240         lda     #0x00
   1B84 95 80         [ 4]  241         sta     0x80,x
   1B86 95 82         [ 4]  242         sta     0x82,x
   1B88 E8            [ 2]  243         inx
   1B89 E8            [ 2]  244         inx
   1B8A E8            [ 2]  245         inx
   1B8B E8            [ 2]  246         inx
   1B8C E0 20         [ 2]  247         cpx     #0x20
   1B8E 90 E0         [ 4]  248         bcc     NEXTBRD
                            249 
   1B90 A9 00         [ 2]  250         lda     #0x00
   1B92 85 5F         [ 3]  251         sta     CURR_CHANNEL
   1B94 85 65         [ 3]  252         sta     CURR_PORT
   1B96 60            [ 6]  253         rts
                            254 
                            255 
   1B97                     256 TAPECMD:
   1B97 8D 02 03      [ 4]  257         sta     transport_periph$ddr_reg_b
   1B9A A9 FA         [ 2]  258         lda     #0xFA
   1B9C 85 50         [ 3]  259         sta     TIMER_1MS_A
                            260 
                            261 
   1B9E                     262 L1B9E:
   1B9E 20 B7 1C      [ 6]  263         jsr     TUPDATE
   1BA1 20 AB 1D      [ 6]  264         jsr     L1DAB
   1BA4 A5 50         [ 3]  265         lda     TIMER_1MS_A
   1BA6 D0 F6         [ 4]  266         bne     L1B9E
   1BA8 AD 02 03      [ 4]  267         lda     transport_periph$ddr_reg_b
   1BAB 29 60         [ 2]  268         and     #TIMER_TMP
   1BAD D0 05         [ 4]  269         bne     L1BB4
   1BAF A9 00         [ 2]  270         lda     #0x00
   1BB1 8D 02 03      [ 4]  271         sta     transport_periph$ddr_reg_b
                            272 
                            273 
   1BB4                     274 L1BB4:
   1BB4 60            [ 6]  275         rts
                            276 
                            277 
   1BB5                     278 WAITTONE:
   1BB5 A9 00         [ 2]  279         lda     #0x00
   1BB7 85 59         [ 3]  280         sta     ZEROCROSS_CTR
   1BB9                     281 L1BB9:
   1BB9 AD 02 03      [ 4]  282         lda     transport_periph$ddr_reg_b
   1BBC A9 0A         [ 2]  283         lda     #0x0A
   1BBE 85 50         [ 3]  284         sta     TIMER_1MS_A
   1BC0 E6 59         [ 5]  285         inc     ZEROCROSS_CTR
   1BC2 A5 59         [ 3]  286         lda     ZEROCROSS_CTR
   1BC4 C9 21         [ 2]  287         cmp     #0x21
   1BC6 B0 12         [ 4]  288         bcs     L1BDA
   1BC8                     289 L1BC8:
   1BC8 20 B7 1C      [ 6]  290         jsr     TUPDATE
   1BCB 20 AB 1D      [ 6]  291         jsr     L1DAB
   1BCE A5 50         [ 3]  292         lda     TIMER_1MS_A
   1BD0 F0 E3         [ 4]  293         beq     WAITTONE
   1BD2 AD 03 03      [ 4]  294         lda     transport_control_reg_b
   1BD5 10 F1         [ 4]  295         bpl     L1BC8
   1BD7 4C B9 1B      [ 3]  296         jmp     L1BB9
   1BDA                     297 L1BDA:
   1BDA 60            [ 6]  298         rts
                            299 
                            300 
   1BDB                     301 WAITCD:
   1BDB A9 FA         [ 2]  302         lda     #0xFA
   1BDD 85 50         [ 3]  303         sta     TIMER_1MS_A
   1BDF                     304 L1BDF:
   1BDF 20 B7 1C      [ 6]  305         jsr     TUPDATE
   1BE2 20 AB 1D      [ 6]  306         jsr     L1DAB
   1BE5 A5 50         [ 3]  307         lda     TIMER_1MS_A
   1BE7 D0 F6         [ 4]  308         bne     L1BDF
                            309 
                            310 
   1BE9                     311 L1BE9:
   1BE9 20 B7 1C      [ 6]  312         jsr     TUPDATE
   1BEC 20 AB 1D      [ 6]  313         jsr     L1DAB
   1BEF AD 02 03      [ 4]  314         lda     transport_periph$ddr_reg_b
   1BF2 6A            [ 2]  315         ror
   1BF3 90 F4         [ 4]  316         bcc     L1BE9
   1BF5 A9 A0         [ 2]  317         lda     #0xA0
   1BF7 85 50         [ 3]  318         sta     TIMER_1MS_A
   1BF9                     319 L1BF9:
   1BF9 20 B7 1C      [ 6]  320         jsr     TUPDATE
   1BFC 20 AB 1D      [ 6]  321         jsr     L1DAB
   1BFF AD 02 03      [ 4]  322         lda     transport_periph$ddr_reg_b
   1C02 6A            [ 2]  323         ror
   1C03 90 E4         [ 4]  324         bcc     L1BE9
   1C05 A5 50         [ 3]  325         lda     TIMER_1MS_A
   1C07 D0 F0         [ 4]  326         bne     L1BF9
   1C09 60            [ 6]  327         rts
                            328 
                            329 
   1C0A                     330 PLAYTRK:
   1C0A AD 00 03      [ 4]  331         lda     transport_periph$ddr_reg_a
   1C0D A9 40         [ 2]  332         lda     #0x40
   1C0F 85 82         [ 3]  333         sta     0x82
   1C11 85 86         [ 3]  334         sta     0x86
   1C13 85 8A         [ 3]  335         sta     0x8A
   1C15 85 8E         [ 3]  336         sta     0x8E
   1C17 A9 3C         [ 2]  337         lda     #0x3C
   1C19 8D 81 03      [ 4]  338         sta     audio_control_reg_a
   1C1C A9 34         [ 2]  339         lda     #0x34
   1C1E 8D 83 03      [ 4]  340         sta     audio_control_reg_b
   1C21 A9 60         [ 2]  341         lda     #TIMER_TMP
   1C23 85 82         [ 3]  342         sta     0x82
   1C25                     343 L1C25:
   1C25 AD 02 03      [ 4]  344         lda     transport_periph$ddr_reg_b
   1C28 4A            [ 2]  345         lsr
   1C29 90 11         [ 4]  346         bcc     LOSTCD
   1C2B 20 67 1D      [ 6]  347         jsr     AGCUPD
   1C2E 20 B7 1C      [ 6]  348         jsr     TUPDATE
   1C31 AD 01 03      [ 4]  349         lda     transport_control_reg_a
   1C34 10 EF         [ 4]  350         bpl     L1C25
   1C36 20 4E 1C      [ 6]  351         jsr     PROTOHAND
   1C39 4C 25 1C      [ 3]  352         jmp     L1C25
                            353 
                            354 
   1C3C                     355 LOSTCD:
   1C3C A9 64         [ 2]  356         lda     #0x64
   1C3E 85 50         [ 3]  357         sta     TIMER_1MS_A
   1C40                     358 L1C40:
   1C40 20 B7 1C      [ 6]  359         jsr     TUPDATE
   1C43 AD 02 03      [ 4]  360         lda     transport_periph$ddr_reg_b
   1C46 4A            [ 2]  361         lsr
   1C47 B0 C1         [ 4]  362         bcs     PLAYTRK
   1C49 A5 50         [ 3]  363         lda     TIMER_1MS_A
   1C4B D0 F3         [ 4]  364         bne     L1C40
   1C4D 60            [ 6]  365         rts
                            366 ;
                            367 ; Protocol handler
                            368 ;
   1C4E                     369 PROTOHAND:
   1C4E AD 00 03      [ 4]  370         lda     transport_periph$ddr_reg_a
   1C51                     371 PROCBYTE:
   1C51 29 7F         [ 2]  372         and     #0x7F
   1C53 85 5D         [ 3]  373         sta     TAPE_BYTE
   1C55 29 7E         [ 2]  374         and     #0x7E
   1C57 C9 22         [ 2]  375         cmp     #0x22
   1C59 F0 3A         [ 4]  376         beq     PROCCHNL
   1C5B C9 32         [ 2]  377         cmp     #0x32
   1C5D 90 4F         [ 4]  378         bcc     $18
   1C5F C9 3A         [ 2]  379         cmp     #0x3A
   1C61 90 32         [ 4]  380         bcc     PROCCHNL
   1C63 A5 5D         [ 3]  381         lda     TAPE_BYTE
   1C65 C9 41         [ 2]  382         cmp     #0x41
   1C67 90 45         [ 4]  383         bcc     $18
   1C69 C9 4F         [ 2]  384         cmp     #0x4F                           ; is it >= 0x4F?
   1C6B B0 41         [ 4]  385         bcs     $18
   1C6D A6 65         [ 3]  386         ldx     CURR_PORT
   1C6F 38            [ 2]  387         sec                                     ; (it's 0x41 to 0x4E)
   1C70 E9 41         [ 2]  388         sbc     #0x41
   1C72 C9 08         [ 2]  389         cmp     #0x08
   1C74 90 02         [ 4]  390         bcc     $16
   1C76 E8            [ 2]  391         inx
   1C77 E8            [ 2]  392         inx
   1C78                     393 $16:
   1C78 29 07         [ 2]  394         and     #0x07
   1C7A A8            [ 2]  395         tay
   1C7B B9 AF 1C      [ 5]  396         lda     MASKTBL,y
   1C7E 85 5E         [ 3]  397         sta     SOL_MASK
   1C80 A5 5F         [ 3]  398         lda     CURR_CHANNEL
   1C82 4A            [ 2]  399         lsr
   1C83 B0 09         [ 4]  400         bcs     $17
   1C85 A5 5E         [ 3]  401         lda     SOL_MASK
   1C87 49 FF         [ 2]  402         eor     #0xFF
   1C89 35 00         [ 4]  403         and     0x00,x
   1C8B 95 00         [ 4]  404         sta     0x00,x
   1C8D 60            [ 6]  405         rts
                            406 ;
   1C8E                     407 $17:
   1C8E A5 5E         [ 3]  408         lda     SOL_MASK
   1C90 15 00         [ 4]  409         ora     0x00,x
   1C92 95 00         [ 4]  410         sta     0x00,x
   1C94 60            [ 6]  411         rts
                            412 ;
   1C95                     413 PROCCHNL:
   1C95 A5 5D         [ 3]  414         lda     TAPE_BYTE
   1C97 85 5F         [ 3]  415         sta     CURR_CHANNEL
   1C99 29 7E         [ 2]  416         and     #0x7E
   1C9B C9 22         [ 2]  417         cmp     #0x22
   1C9D D0 05         [ 4]  418         bne     CONVCHNL
   1C9F A9 98         [ 2]  419         lda     #0x98
   1CA1 85 65         [ 3]  420         sta     CURR_PORT
   1CA3 60            [ 6]  421         rts
                            422 ;
   1CA4                     423 CONVCHNL:
   1CA4 38            [ 2]  424         sec
   1CA5 E9 32         [ 2]  425         sbc     #0x32
   1CA7 0A            [ 2]  426         asl
   1CA8 18            [ 2]  427         clc
   1CA9 69 80         [ 2]  428         adc     #0x80
   1CAB 85 65         [ 3]  429         sta     CURR_PORT
   1CAD 60            [ 6]  430         rts
   1CAE                     431 $18:
   1CAE 60            [ 6]  432         rts
                            433 ;
                            434 ; bit mask table
                            435 ;
   1CAF                     436 MASKTBL:
   1CAF 01 02 04 08         437         .db     0x01,0x02,0x04,0x08
   1CB3 10 20 40 80         438         .db     0x10,0x20,0x40,0x80
                            439 ;
                            440 ;       Housekeeping routine
                            441 ;
                            442 ;
   1CB7                     443 TUPDATE:
   1CB7 AD 05 02      [ 4]  444         lda     U18_edge_detect_control_DI_pos
   1CBA 85 60         [ 3]  445         sta     TIMER_TMP
   1CBC F0 5C         [ 4]  446         beq     TEXIT
   1CBE A5 5C         [ 3]  447         lda     PROG_STATE
   1CC0 30 0E         [ 4]  448         bmi     $20_A
   1CC2 A5 60         [ 3]  449         lda     TIMER_TMP
   1CC4 29 40         [ 2]  450         and     #0x40
   1CC6 F0 1A         [ 4]  451         beq     $20_B
   1CC8 A9 80         [ 2]  452         lda     #0x80
   1CCA 85 5C         [ 3]  453         sta     PROG_STATE
   1CCC A9 FA         [ 2]  454         lda     #0xFA
   1CCE 85 51         [ 3]  455         sta     TIMER_1MS_B
   1CD0                     456 $20_A:
   1CD0 A5 51         [ 3]  457         lda     TIMER_1MS_B
   1CD2 D0 0A         [ 4]  458         bne     $20
   1CD4 A9 00         [ 2]  459         lda     #0x00
   1CD6 85 5C         [ 3]  460         sta     PROG_STATE
   1CD8 A5 5B         [ 3]  461         lda     PROG_CTR
   1CDA D0 02         [ 4]  462         bne     $20
   1CDC E6 5B         [ 5]  463         inc     PROG_CTR
   1CDE                     464 $20:
   1CDE A5 60         [ 3]  465         lda     TIMER_TMP
   1CE0 10 38         [ 4]  466         bpl     TEXIT
                            467 ; Adjust Timer routine
   1CE2                     468 $20_B:
   1CE2 AD 04 02      [ 4]  469         lda     U18_timer
   1CE5 49 FF         [ 2]  470         eor     #0xFF
   1CE7 4A            [ 2]  471         lsr
   1CE8 4A            [ 2]  472         lsr
   1CE9 4A            [ 2]  473         lsr
   1CEA 85 58         [ 3]  474         sta     TIMER_TMP1
   1CEC 90 02         [ 4]  475         bcc     $21
   1CEE E6 58         [ 5]  476         inc     TIMER_TMP1
                            477 
                            478 
   1CF0                     479 $21:
   1CF0 A9 7A         [ 2]  480         lda     #0x7A
   1CF2 38            [ 2]  481         sec
   1CF3 E5 58         [ 3]  482         sbc     TIMER_TMP1
   1CF5 8D 15 02      [ 4]  483         sta     U18_timer_8T_DI
   1CF8 C6 50         [ 5]  484         dec     TIMER_1MS_A
   1CFA C6 51         [ 5]  485         dec     TIMER_1MS_B
   1CFC C6 53         [ 5]  486         dec     TIMER_1MS_C
   1CFE C6 54         [ 5]  487         dec     TIMER_1MS_R
   1D00 D0 18         [ 4]  488         bne     TEXIT
   1D02 A9 64         [ 2]  489         lda     #0x64
   1D04 85 54         [ 3]  490         sta     TIMER_1MS_R
   1D06 C6 55         [ 5]  491         dec     TIMER_100MS_A
   1D08 C6 66         [ 5]  492         dec     TIMER_100MS_R25
   1D0A D0 04         [ 4]  493         bne     $21_A
   1D0C A9 FA         [ 2]  494         lda     #0xFA                   ; reset to 2.5 seconds?
   1D0E 85 66         [ 3]  495         sta     TIMER_100MS_R25
   1D10                     496 $21_A:
   1D10 C6 56         [ 5]  497         dec     TIMER_100MS_R
   1D12 D0 06         [ 4]  498         bne     TEXIT
   1D14 A9 64         [ 2]  499         lda     #0x64                   ; reset to 10 seconds?
   1D16 85 56         [ 3]  500         sta     TIMER_100MS_R
   1D18 C6 57         [ 5]  501         dec     TIMER_10S
   1D1A                     502 TEXIT:
   1D1A 60            [ 6]  503         rts
                            504 ;
                            505 ;       Read the AGC mic level
                            506 ;       Take the average of 8 samples
                            507 ;
   1D1B                     508 AGCMICRD:
   1D1B A9 00         [ 2]  509         lda     #0x00
   1D1D 85 62         [ 3]  510         sta     AGC_ACCUM
   1D1F 85 63         [ 3]  511         sta     AGC_SAMPLES
   1D21 A9 0A         [ 2]  512         lda     #0x0A
   1D23 85 55         [ 3]  513         sta     TIMER_100MS_A
   1D25 A9 64         [ 2]  514         lda     #0x64
   1D27 85 54         [ 3]  515         sta     TIMER_1MS_R
   1D29                     516 $23:
   1D29 20 B7 1C      [ 6]  517         jsr     TUPDATE
   1D2C 20 AB 1D      [ 6]  518         jsr     L1DAB
   1D2F A5 55         [ 3]  519         lda     TIMER_100MS_A
   1D31 D0 F6         [ 4]  520         bne     $23
   1D33 A9 0A         [ 2]  521         lda     #0x0A
   1D35 85 55         [ 3]  522         sta     TIMER_100MS_A
   1D37 A9 64         [ 2]  523         lda     #0x64
   1D39 85 54         [ 3]  524         sta     TIMER_1MS_R
   1D3B A5 63         [ 3]  525         lda     AGC_SAMPLES
   1D3D C9 08         [ 2]  526         cmp     #0x08
   1D3F F0 15         [ 4]  527         beq     $27
   1D41 E6 63         [ 5]  528         inc     AGC_SAMPLES
   1D43 A2 09         [ 2]  529         ldx     #0x09
   1D45 38            [ 2]  530         sec
   1D46 AD 80 03      [ 4]  531         lda     audio_periph$ddr_reg_a
   1D49                     532 $24:
   1D49 2A            [ 2]  533         rol
   1D4A CA            [ 2]  534         dex
   1D4B 90 FC         [ 4]  535         bcc     $24
   1D4D 18            [ 2]  536         clc
   1D4E 8A            [ 2]  537         txa
   1D4F 65 62         [ 3]  538         adc     AGC_ACCUM
   1D51 85 62         [ 3]  539         sta     AGC_ACCUM
   1D53 4C 29 1D      [ 3]  540         jmp     $23
                            541 ;
   1D56                     542 $27:
   1D56 46 62         [ 5]  543         lsr     AGC_ACCUM
   1D58 46 62         [ 5]  544         lsr     AGC_ACCUM
   1D5A 46 62         [ 5]  545         lsr     AGC_ACCUM
   1D5C A5 62         [ 3]  546         lda     AGC_ACCUM
   1D5E 85 61         [ 3]  547         sta     AGC_LEVEL
   1D60 A9 00         [ 2]  548         lda     #0x00
   1D62 85 62         [ 3]  549         sta     AGC_ACCUM
   1D64 85 63         [ 3]  550         sta     AGC_SAMPLES
   1D66 60            [ 6]  551         rts
                            552 ;
                            553 ;        Do AGC Mic Logic
                            554 ;
   1D67                     555 AGCUPD:
   1D67 AD 80 02      [ 4]  556         lda     U19_PORTA
   1D6A 49 FF         [ 2]  557         eor     #0xFF
   1D6C 4A            [ 2]  558         lsr
   1D6D 4A            [ 2]  559         lsr
   1D6E 4A            [ 2]  560         lsr
   1D6F 4A            [ 2]  561         lsr
   1D70 18            [ 2]  562         clc
   1D71 65 61         [ 3]  563         adc     AGC_LEVEL
   1D73 AA            [ 2]  564         tax
   1D74 BD 9A 1D      [ 5]  565         lda     AGCTABLE,x
   1D77 85 64         [ 3]  566         sta     AGC_GAIN
   1D79 A5 53         [ 3]  567         lda     TIMER_1MS_C
   1D7B D0 16         [ 4]  568         bne     $26
   1D7D A9 0A         [ 2]  569         lda     #0x0A
   1D7F 85 53         [ 3]  570         sta     TIMER_1MS_C
   1D81 A5 64         [ 3]  571         lda     AGC_GAIN
   1D83 CD 82 03      [ 4]  572         cmp     audio_periph$ddr_reg_b
   1D86 90 08         [ 4]  573         bcc     $25
   1D88 F0 09         [ 4]  574         beq     $26
   1D8A EE 82 03      [ 6]  575         inc     audio_periph$ddr_reg_b
   1D8D 4C 93 1D      [ 3]  576         jmp     $26
                            577 ;
   1D90                     578 $25:
   1D90 CE 82 03      [ 6]  579         dec     audio_periph$ddr_reg_b
   1D93                     580 $26:
   1D93 AD 82 03      [ 4]  581         lda     audio_periph$ddr_reg_b
   1D96 8D 82 02      [ 4]  582         sta     U19_PORTB
   1D99 60            [ 6]  583         rts
                            584 ;
                            585 ;       AGC table
                            586 ;
   1D9A                     587 AGCTABLE:
   1D9A 03 04 06 08         588         .db     0x03, 0x04, 0x06, 0x08
   1D9E 10 16 20 2D         589         .db     0x10, 0x16, 0x20, 0x2D
   1DA2 40 5A 80 BF         590         .db     0x40, 0x5A, 0x80, 0xBF
   1DA6 FF FF FF FF         591         .db     0xFF, 0xFF, 0xFF, 0xFF
   1DAA FF                  592         .db     0xFF
                            593 
   1DAB                     594 L1DAB:
   1DAB A5 67         [ 3]  595         lda     RAM_67
   1DAD AA            [ 2]  596         tax
   1DAE A5 68         [ 3]  597         lda     RAM_68
   1DB0 D0 33         [ 4]  598         bne     L1DE5
   1DB2 BD 0F 1E      [ 5]  599         lda     X1E0F,x
   1DB5 C9 FE         [ 2]  600         cmp     #0xFE
   1DB7 F0 23         [ 4]  601         beq     L1DDC
   1DB9 C9 FF         [ 2]  602         cmp     #0xFF
   1DBB D0 07         [ 4]  603         bne     L1DC4
   1DBD A9 00         [ 2]  604         lda     #0x00
   1DBF 85 67         [ 3]  605         sta     RAM_67
   1DC1 4C DB 1D      [ 3]  606         jmp     L1DDB
                            607 
                            608 
   1DC4                     609 L1DC4:
   1DC4 C5 66         [ 3]  610         cmp     TIMER_100MS_R25
   1DC6 D0 13         [ 4]  611         bne     L1DDB
   1DC8 BD 10 1E      [ 5]  612         lda     X1E10,x
   1DCB 20 51 1C      [ 6]  613         jsr     PROCBYTE
   1DCE BD 11 1E      [ 5]  614         lda     X1E11,x
   1DD1 20 51 1C      [ 6]  615         jsr     PROCBYTE
   1DD4 A5 67         [ 3]  616         lda     RAM_67
   1DD6 18            [ 2]  617         clc
   1DD7 69 03         [ 2]  618         adc     #0x03
   1DD9 85 67         [ 3]  619         sta     RAM_67
                            620 
                            621 
   1DDB                     622 L1DDB:
   1DDB 60            [ 6]  623         rts
                            624 
                            625 
   1DDC                     626 L1DDC:
   1DDC E6 68         [ 5]  627         inc     RAM_68
   1DDE A9 00         [ 2]  628         lda     #0x00
   1DE0 85 67         [ 3]  629         sta     RAM_67
   1DE2 4C DB 1D      [ 3]  630         jmp     L1DDB
                            631 
                            632 
   1DE5                     633 L1DE5:
   1DE5 BD F3 1E      [ 5]  634         lda     X1EF3,x
   1DE8 C9 FF         [ 2]  635         cmp     #0xFF
   1DEA D0 09         [ 4]  636         bne     L1DF5
   1DEC A9 00         [ 2]  637         lda     #0x00
   1DEE 85 67         [ 3]  638         sta     RAM_67
   1DF0 85 68         [ 3]  639         sta     RAM_68
   1DF2 4C DB 1D      [ 3]  640         jmp     L1DDB
                            641 
                            642 
   1DF5                     643 L1DF5:
   1DF5 C5 66         [ 3]  644         cmp     TIMER_100MS_R25
   1DF7 D0 E2         [ 4]  645         bne     L1DDB
   1DF9 BD F4 1E      [ 5]  646         lda     X1EF4,x
   1DFC 20 51 1C      [ 6]  647         jsr     PROCBYTE
   1DFF BD F5 1E      [ 5]  648         lda     X1EF5,x
   1E02 20 51 1C      [ 6]  649         jsr     PROCBYTE
   1E05 A5 67         [ 3]  650         lda     RAM_67
   1E07 18            [ 2]  651         clc
   1E08 69 03         [ 2]  652         adc     #0x03
   1E0A 85 67         [ 3]  653         sta     RAM_67
   1E0C 4C DB 1D      [ 3]  654         jmp     L1DDB
                            655 ;
                            656 ;       Table of pairs of bytes to process
                            657 ;
   1E0F                     658 X1E0F:
   1E0F EE                  659         .byte   0xEE
                            660 
   1E10                     661 X1E10:
   1E10 35                  662         .byte   0x35
                            663 
   1E11                     664 X1E11:
   1E11 46 EB 35 49 E9 35   665         .byte   0x46,0xEB,0x35,0x49,0xE9,0x35,0x4A,0xE9,0x33,0x42,0xE8,0x33,0x46,0xE7,0x32,0x46
        4A E9 33 42 E8 33
        46 E7 32 46
   1E21 E6 33 46 E5 32 46   666         .byte   0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3,0x32,0x46,0xE2,0x33,0x46,0xE1
        E4 33 46 E3 32 46
        E2 33 46 E1
   1E31 32 46 E0 33 46 DF   667         .byte   0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33,0x46,0xDD,0x32,0x46,0xDD,0x34
        32 46 DE 33 46 DD
        32 46 DD 34
   1E41 46 DC 33 46 DB 32   668         .byte   0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46,0xDA,0x33,0x46,0xD9,0x32,0x46
        46 DB 35 46 DA 33
        46 D9 32 46
   1E51 D1 32 42 C6 33 47   669         .byte   0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5,0x32,0x47,0xC3,0x34,0x46,0xC2
        C6 33 43 C5 32 47
        C3 34 46 C2
   1E61 33 47 C1 32 47 C0   670         .byte   0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34,0x46,0xB9,0x32,0x43,0xB7,0x35
        35 46 B9 34 46 B9
        32 43 B7 35
   1E71 46 B7 33 42 B3 33   671         .byte   0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46,0xA8,0x32,0x42,0x9D,0x33,0x47
        46 B2 32 46 A8 32
        42 9D 33 47
   1E81 9C 32 47 9B 33 47   672         .byte   0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A,0x34,0x46,0x99,0x33,0x47,0x99
        9A 32 47 9A 34 46
        99 33 47 99
   1E91 33 43 99 35 46 98   673         .byte   0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33,0x47,0x94,0x32,0x47,0x93,0x33
        32 47 97 33 47 94
        32 47 93 33
   1EA1 47 92 32 47 91 33   674         .byte   0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47,0x87,0x33,0x42,0x86,0x32,0x43
        47 90 32 47 87 33
        42 86 32 43
   1EB1 7D 33 46 7C 32 46   675         .byte   0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77,0x34,0x46,0x75,0x32,0x43,0x75
        77 32 42 77 34 46
        75 32 43 75
   1EC1 35 46 6A 33 46 69   676         .byte   0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33,0x46,0x66,0x32,0x46,0x66,0x32
        32 46 67 33 46 66
        32 46 66 32
   1ED1 43 65 34 46 62 35   677         .byte   0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42,0x56,0x33,0x46,0x55,0x32,0x46
        46 62 33 42 56 33
        46 55 32 46
   1EE1 55 32 42 54 33 46   678         .byte   0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52,0x33,0x46,0x51,0x32,0x46,0xFE
        53 32 46 52 33 46
        51 32 46 FE
   1EF1 FE FE               679         .byte   0xFE,0xFE
                            680 
   1EF3                     681 X1EF3:
   1EF3 50                  682         .byte   0x50
                            683 
   1EF4                     684 X1EF4:
   1EF4 33                  685         .byte   0x33
                            686 
   1EF5                     687 X1EF5:
   1EF5 46 4F 32 46 4E 33   688         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   1F05 4B 32 46 40 34 46   689         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   1F15 33 47 39 32 47 32   690         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   1F25 46 26 33 43 23 33   691         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   1F35 1B 33 47 1A 32 47   692         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   1F45 33 47 17 32 42 16   693         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   1F55 43 03 33 46 02 32   694         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
   1F65 FF FF FF FF FF FF   695         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F75 FF FF FF FF FF FF   696         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F85 FF FF FF FF FF FF   697         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F95 FF FF FF FF FF FF   698         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FA5 FF FF FF FF FF FF   699         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FB5 FF FF FF FF FF FF   700         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FC5 FF FF FF FF FF FF   701         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FD5 FF FF FF FF FF FF   702         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FE5 FF FF FF FF FF FF   703         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FF5 FF FF FF FF FF      704         .byte   0xFF,0xFF,0xFF,0xFF,0xFF
                            705 
   1FFA                     706         .org    0x1FFA
                            707         ;
                            708         ; vectors
                            709         ;
   1FFA                     710 NMIVEC:
   1FFA FF FF               711         .dw     0xFFFF
   1FFC                     712 RESETVEC:
   1FFC 00 1A               713         .dw     RESET
   1FFE                     714 IRQVEC:
   1FFE FF FF               715         .dw     0xFFFF
