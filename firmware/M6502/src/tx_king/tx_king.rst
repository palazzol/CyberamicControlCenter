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
   1A00 D8            [ 2]   39         cld                                             ; No decimal mode
   1A01 78            [ 2]   40         sei                                             ; Interrupts are not used
   1A02 A2 F0         [ 2]   41         ldx     #0xF0                                   ; Stack is at 0x01F0
   1A04 9A            [ 2]   42         txs
   1A05 A9 00         [ 2]   43         lda     #0x00                                   ; Clear RAM
   1A07 A2 10         [ 2]   44         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1A09                      45 ZERORAM:
   1A09 95 00         [ 4]   46         sta     RAM_start,x
   1A0B E8            [ 2]   47         inx
   1A0C E0 80         [ 2]   48         cpx     #0x80
   1A0E D0 F9         [ 4]   49         bne     ZERORAM
   1A10 A9 00         [ 2]   50         lda     #0x00                                   ; Initialize these registers to 0x00
   1A12 8D 01 03      [ 4]   51         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   1A15 8D 00 03      [ 4]   52         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1A18 8D 81 03      [ 4]   53         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1A1B 8D 80 03      [ 4]   54         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1A1E 8D 83 03      [ 4]   55         sta     audio_control_reg_b                     ; Clear audio control B
   1A21 8D 05 02      [ 4]   56         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   1A24 8D 03 03      [ 4]   57         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1A27 8D 01 02      [ 4]   58         sta     U18_DDRA                                ; Buttons are inputs
   1A2A A9 02         [ 2]   59         lda     #0x02
   1A2C 8D 81 02      [ 4]   60         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   1A2F A9 FF         [ 2]   61         lda     #0xFF
   1A31 8D 82 03      [ 4]   62         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1A34 8D 03 02      [ 4]   63         sta     U18_DDRB                                ; Button lights are outputs
   1A37 8D 83 02      [ 4]   64         sta     U19_DDRB                                ; CPU card lights are outputs
   1A3A A9 FC         [ 2]   65         lda     #0xFC
   1A3C 8D 02 03      [ 4]   66         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   1A3F A9 2E         [ 2]   67         lda     #0x2E
   1A41 8D 01 03      [ 4]   68         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1A44 8D 03 03      [ 4]   69         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1A47 A9 3C         [ 2]   70         lda     #0x3C
   1A49 8D 81 03      [ 4]   71         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   1A4C 8D 83 03      [ 4]   72         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   1A4F A9 64         [ 2]   73         lda     #0x64
   1A51 85 54         [ 3]   74         sta     TIMER_1MS_R                             ; 100 - init 1 msec master counter
   1A53 A9 18         [ 2]   75         lda     #0x18
   1A55 85 57         [ 3]   76         sta     TIMER_10S                               ; Init a 4 minute timer
   1A57 A9 64         [ 2]   77         lda     #0x64
   1A59 85 56         [ 3]   78         sta     TIMER_100MS_R                           ; 100 - init 0.1 sec master counter
   1A5B A9 0A         [ 2]   79         lda     #0x0a                                   ; 10
   1A5D 85 64         [ 3]   80         sta     AGC_GAIN                                ; Set initial AGC gain value
   1A5F A9 10         [ 2]   81         lda     #TAPEMODE_STOP
   1A61 20 97 1B      [ 6]   82         jsr     TAPECMD                                 ; STOP tape
   1A64 A9 28         [ 2]   83         lda     #0x28                                   ; this will count 4 seconds
   1A66 85 55         [ 3]   84         sta     TIMER_100MS_A
   1A68 A9 64         [ 2]   85         lda     #0x64                                   ; reset master timer
   1A6A 85 54         [ 3]   86         sta     TIMER_1MS_R
   1A6C                      87 $1:
   1A6C 20 B7 1C      [ 6]   88         jsr     TUPDATE                                 ; do not much for 4 seconds
   1A6F A5 55         [ 3]   89         lda     TIMER_100MS_A
   1A71 D0 F9         [ 4]   90         bne     $1
   1A73 20 64 1B      [ 6]   91         jsr     INITBRDS
   1A76                      92 REWIND:
   1A76 A9 FA         [ 2]   93         lda     #0xFA
   1A78 85 66         [ 3]   94         sta     TIMER_100MS_R25
   1A7A A9 00         [ 2]   95         lda     #0x00
   1A7C 85 67         [ 3]   96         sta     RAM_67
   1A7E 85 68         [ 3]   97         sta     RAM_68
   1A80 A9 30         [ 2]   98         lda     #0x30
   1A82 A9 40         [ 2]   99         lda     #TAPEMODE_REWIND
   1A84 20 97 1B      [ 6]  100         jsr     TAPECMD
                            101 
                            102 
   1A87                     103 L1A87:
   1A87 A9 00         [ 2]  104         lda     #0x00
   1A89 85 59         [ 3]  105         sta     ZEROCROSS_CTR
                            106 
                            107 
   1A8B                     108 L1A8B:
   1A8B AD 02 03      [ 4]  109         lda     transport_periph$ddr_reg_b
   1A8E A9 0A         [ 2]  110         lda     #0x0A
   1A90 85 50         [ 3]  111         sta     TIMER_1MS_A
   1A92 E6 59         [ 5]  112         inc     ZEROCROSS_CTR
   1A94 A5 59         [ 3]  113         lda     ZEROCROSS_CTR
   1A96 C9 64         [ 2]  114         cmp     #0x64
   1A98 B0 12         [ 4]  115         bcs     FINDTRK
                            116 
                            117 
   1A9A                     118 L1A9A:
   1A9A 20 B7 1C      [ 6]  119         jsr     TUPDATE
   1A9D 20 AB 1D      [ 6]  120         jsr     L1DAB
   1AA0 A5 50         [ 3]  121         lda     TIMER_1MS_A
   1AA2 F0 E3         [ 4]  122         beq     L1A87
   1AA4 AD 03 03      [ 4]  123         lda     transport_control_reg_b
   1AA7 10 F1         [ 4]  124         bpl     L1A9A
   1AA9 4C 8B 1A      [ 3]  125         jmp     L1A8B
                            126 
                            127 
   1AAC                     128 FINDTRK:
   1AAC A9 20         [ 2]  129         lda     #TAPEMODE_FFWD
   1AAE 20 97 1B      [ 6]  130         jsr     TAPECMD                                 ; FFWD tape
   1AB1 A9 19         [ 2]  131         lda     #0x19
   1AB3 85 55         [ 3]  132         sta     TIMER_100MS_A                           ; 2.5 secs
   1AB5 A9 64         [ 2]  133         lda     #0x64
   1AB7 85 54         [ 3]  134         sta     TIMER_1MS_R
                            135 
                            136 
   1AB9                     137 L1AB9:
   1AB9 20 B7 1C      [ 6]  138         jsr     TUPDATE
   1ABC 20 AB 1D      [ 6]  139         jsr     L1DAB
   1ABF A5 55         [ 3]  140         lda     TIMER_100MS_A
   1AC1 D0 F6         [ 4]  141         bne     L1AB9
   1AC3 A9 00         [ 2]  142         lda     #0x00
   1AC5 85 5A         [ 3]  143         sta     TRACK_CTR
   1AC7 20 B5 1B      [ 6]  144         jsr     WAITTONE
   1ACA A9 40         [ 2]  145         lda     #TAPEMODE_REWIND
   1ACC 20 97 1B      [ 6]  146         jsr     TAPECMD
   1ACF 20 B5 1B      [ 6]  147         jsr     WAITTONE
   1AD2 A9 FA         [ 2]  148         lda     #0xFA
   1AD4 85 50         [ 3]  149         sta     TIMER_1MS_A
                            150 
                            151 
   1AD6                     152 L1AD6:
   1AD6 20 B7 1C      [ 6]  153         jsr     TUPDATE
   1AD9 20 AB 1D      [ 6]  154         jsr     L1DAB
   1ADC A5 50         [ 3]  155         lda     TIMER_1MS_A
   1ADE D0 F6         [ 4]  156         bne     L1AD6
   1AE0 A9 20         [ 2]  157         lda     #TAPEMODE_FFWD
   1AE2 20 97 1B      [ 6]  158         jsr     TAPECMD
   1AE5 20 B5 1B      [ 6]  159         jsr     WAITTONE
   1AE8 E6 5A         [ 5]  160         inc     TRACK_CTR
   1AEA A9 10         [ 2]  161         lda     #TAPEMODE_STOP
   1AEC 20 97 1B      [ 6]  162         jsr     TAPECMD
   1AEF A9 80         [ 2]  163         lda     #TAPEMODE_PLAY
   1AF1 20 97 1B      [ 6]  164         jsr     TAPECMD
   1AF4 20 DB 1B      [ 6]  165         jsr     WAITCD
   1AF7 A9 10         [ 2]  166         lda     #TAPEMODE_STOP
   1AF9 20 97 1B      [ 6]  167         jsr     TAPECMD
   1AFC 20 64 1B      [ 6]  168         jsr     INITBRDS
                            169 
                            170 
   1AFF                     171 WAITPLAY:
   1AFF 20 B7 1C      [ 6]  172         jsr     TUPDATE
   1B02 20 67 1D      [ 6]  173         jsr     AGCUPD
   1B05 20 AB 1D      [ 6]  174         jsr     L1DAB
   1B08 A5 5B         [ 3]  175         lda     PROG_CTR
   1B0A D0 10         [ 4]  176         bne     STARTPLAY
   1B0C A9 02         [ 2]  177         lda     #0x02
   1B0E 8D 80 02      [ 4]  178         sta     U19_PORTA
   1B11 A9 00         [ 2]  179         lda     #0x00
   1B13 8D 02 02      [ 4]  180         sta     U18_PORTB
   1B16 A5 57         [ 3]  181         lda     TIMER_10S
   1B18 D0 E5         [ 4]  182         bne     WAITPLAY
   1B1A E6 5B         [ 5]  183         inc     PROG_CTR
                            184 
                            185 
   1B1C                     186 STARTPLAY:
   1B1C 20 64 1B      [ 6]  187         jsr     INITBRDS
   1B1F A9 00         [ 2]  188         lda     #0x00
   1B21 8D 80 02      [ 4]  189         sta     U19_PORTA
   1B24 A9 80         [ 2]  190         lda     #0x80
   1B26 8D 02 02      [ 4]  191         sta     U18_PORTB
   1B29 A9 80         [ 2]  192         lda     #TAPEMODE_PLAY
   1B2B 20 97 1B      [ 6]  193         jsr     TAPECMD
   1B2E 20 DB 1B      [ 6]  194         jsr     WAITCD
   1B31 C6 5B         [ 5]  195         dec     PROG_CTR
   1B33 20 0A 1C      [ 6]  196         jsr     PLAYTRK
   1B36 20 64 1B      [ 6]  197         jsr     INITBRDS
   1B39 A9 18         [ 2]  198         lda     #0x18
   1B3B 85 57         [ 3]  199         sta     TIMER_10S
   1B3D A9 64         [ 2]  200         lda     #0x64
   1B3F 85 56         [ 3]  201         sta     TIMER_100MS_R
   1B41 E6 5A         [ 5]  202         inc     TRACK_CTR
   1B43 A5 5A         [ 3]  203         lda     TRACK_CTR
   1B45 C9 1A         [ 2]  204         cmp     #0x1A
   1B47 90 03         [ 4]  205         bcc     NEXTTRK
   1B49 4C 76 1A      [ 3]  206         jmp     REWIND
                            207 
                            208 
   1B4C                     209 NEXTTRK:
   1B4C A9 00         [ 2]  210         lda     #0x00
   1B4E 85 67         [ 3]  211         sta     RAM_67
   1B50 85 68         [ 3]  212         sta     RAM_68
   1B52 A9 FA         [ 2]  213         lda     #0xFA
   1B54 85 66         [ 3]  214         sta     TIMER_100MS_R25
   1B56 20 DB 1B      [ 6]  215         jsr     WAITCD
   1B59 A9 10         [ 2]  216         lda     #TAPEMODE_STOP
   1B5B 20 97 1B      [ 6]  217         jsr     TAPECMD
   1B5E 20 1B 1D      [ 6]  218         jsr     AGCMICRD
   1B61 4C FF 1A      [ 3]  219         jmp     WAITPLAY
                            220 ;
                            221 ;       Init boards
                            222 ;
   1B64                     223 INITBRDS:
   1B64 A9 3C         [ 2]  224         lda     #0x3C
   1B66 8D 83 03      [ 4]  225         sta     audio_control_reg_b
   1B69 A9 34         [ 2]  226         lda     #0x34
   1B6B 8D 81 03      [ 4]  227         sta     audio_control_reg_a
   1B6E A2 00         [ 2]  228         ldx     #0x00
   1B70                     229 NEXTBRD:
   1B70 A9 30         [ 2]  230         lda     #0x30
   1B72 95 81         [ 4]  231         sta     0x81,x
   1B74 95 83         [ 4]  232         sta     0x83,x
   1B76 A9 FF         [ 2]  233         lda     #0xFF
   1B78 95 80         [ 4]  234         sta     0x80,x
   1B7A 95 82         [ 4]  235         sta     0x82,x
   1B7C A9 34         [ 2]  236         lda     #0x34
   1B7E 95 81         [ 4]  237         sta     0x81,x
   1B80 95 83         [ 4]  238         sta     0x83,x
   1B82 A9 00         [ 2]  239         lda     #0x00
   1B84 95 80         [ 4]  240         sta     0x80,x
   1B86 95 82         [ 4]  241         sta     0x82,x
   1B88 E8            [ 2]  242         inx
   1B89 E8            [ 2]  243         inx
   1B8A E8            [ 2]  244         inx
   1B8B E8            [ 2]  245         inx
   1B8C E0 20         [ 2]  246         cpx     #0x20
   1B8E 90 E0         [ 4]  247         bcc     NEXTBRD
                            248 
   1B90 A9 00         [ 2]  249         lda     #0x00
   1B92 85 5F         [ 3]  250         sta     CURR_CHANNEL
   1B94 85 65         [ 3]  251         sta     CURR_PORT
   1B96 60            [ 6]  252         rts
                            253 
                            254 
   1B97                     255 TAPECMD:
   1B97 8D 02 03      [ 4]  256         sta     transport_periph$ddr_reg_b
   1B9A A9 FA         [ 2]  257         lda     #0xFA
   1B9C 85 50         [ 3]  258         sta     TIMER_1MS_A
                            259 
                            260 
   1B9E                     261 L1B9E:
   1B9E 20 B7 1C      [ 6]  262         jsr     TUPDATE
   1BA1 20 AB 1D      [ 6]  263         jsr     L1DAB
   1BA4 A5 50         [ 3]  264         lda     TIMER_1MS_A
   1BA6 D0 F6         [ 4]  265         bne     L1B9E
   1BA8 AD 02 03      [ 4]  266         lda     transport_periph$ddr_reg_b
   1BAB 29 60         [ 2]  267         and     #TIMER_TMP
   1BAD D0 05         [ 4]  268         bne     L1BB4
   1BAF A9 00         [ 2]  269         lda     #0x00
   1BB1 8D 02 03      [ 4]  270         sta     transport_periph$ddr_reg_b
                            271 
                            272 
   1BB4                     273 L1BB4:
   1BB4 60            [ 6]  274         rts
                            275 
                            276 
   1BB5                     277 WAITTONE:
   1BB5 A9 00         [ 2]  278         lda     #0x00
   1BB7 85 59         [ 3]  279         sta     ZEROCROSS_CTR
   1BB9                     280 L1BB9:
   1BB9 AD 02 03      [ 4]  281         lda     transport_periph$ddr_reg_b
   1BBC A9 0A         [ 2]  282         lda     #0x0A
   1BBE 85 50         [ 3]  283         sta     TIMER_1MS_A
   1BC0 E6 59         [ 5]  284         inc     ZEROCROSS_CTR
   1BC2 A5 59         [ 3]  285         lda     ZEROCROSS_CTR
   1BC4 C9 21         [ 2]  286         cmp     #0x21
   1BC6 B0 12         [ 4]  287         bcs     L1BDA
   1BC8                     288 L1BC8:
   1BC8 20 B7 1C      [ 6]  289         jsr     TUPDATE
   1BCB 20 AB 1D      [ 6]  290         jsr     L1DAB
   1BCE A5 50         [ 3]  291         lda     TIMER_1MS_A
   1BD0 F0 E3         [ 4]  292         beq     WAITTONE
   1BD2 AD 03 03      [ 4]  293         lda     transport_control_reg_b
   1BD5 10 F1         [ 4]  294         bpl     L1BC8
   1BD7 4C B9 1B      [ 3]  295         jmp     L1BB9
   1BDA                     296 L1BDA:
   1BDA 60            [ 6]  297         rts
                            298 
                            299 
   1BDB                     300 WAITCD:
   1BDB A9 FA         [ 2]  301         lda     #0xFA
   1BDD 85 50         [ 3]  302         sta     TIMER_1MS_A
   1BDF                     303 L1BDF:
   1BDF 20 B7 1C      [ 6]  304         jsr     TUPDATE
   1BE2 20 AB 1D      [ 6]  305         jsr     L1DAB
   1BE5 A5 50         [ 3]  306         lda     TIMER_1MS_A
   1BE7 D0 F6         [ 4]  307         bne     L1BDF
                            308 
                            309 
   1BE9                     310 L1BE9:
   1BE9 20 B7 1C      [ 6]  311         jsr     TUPDATE
   1BEC 20 AB 1D      [ 6]  312         jsr     L1DAB
   1BEF AD 02 03      [ 4]  313         lda     transport_periph$ddr_reg_b
   1BF2 6A            [ 2]  314         ror
   1BF3 90 F4         [ 4]  315         bcc     L1BE9
   1BF5 A9 A0         [ 2]  316         lda     #0xA0
   1BF7 85 50         [ 3]  317         sta     TIMER_1MS_A
   1BF9                     318 L1BF9:
   1BF9 20 B7 1C      [ 6]  319         jsr     TUPDATE
   1BFC 20 AB 1D      [ 6]  320         jsr     L1DAB
   1BFF AD 02 03      [ 4]  321         lda     transport_periph$ddr_reg_b
   1C02 6A            [ 2]  322         ror
   1C03 90 E4         [ 4]  323         bcc     L1BE9
   1C05 A5 50         [ 3]  324         lda     TIMER_1MS_A
   1C07 D0 F0         [ 4]  325         bne     L1BF9
   1C09 60            [ 6]  326         rts
                            327 
                            328 
   1C0A                     329 PLAYTRK:
   1C0A AD 00 03      [ 4]  330         lda     transport_periph$ddr_reg_a
   1C0D A9 40         [ 2]  331         lda     #0x40
   1C0F 85 82         [ 3]  332         sta     0x82
   1C11 85 86         [ 3]  333         sta     0x86
   1C13 85 8A         [ 3]  334         sta     0x8A
   1C15 85 8E         [ 3]  335         sta     0x8E
   1C17 A9 3C         [ 2]  336         lda     #0x3C
   1C19 8D 81 03      [ 4]  337         sta     audio_control_reg_a
   1C1C A9 34         [ 2]  338         lda     #0x34
   1C1E 8D 83 03      [ 4]  339         sta     audio_control_reg_b
   1C21 A9 60         [ 2]  340         lda     #TIMER_TMP
   1C23 85 82         [ 3]  341         sta     0x82
   1C25                     342 L1C25:
   1C25 AD 02 03      [ 4]  343         lda     transport_periph$ddr_reg_b
   1C28 4A            [ 2]  344         lsr
   1C29 90 11         [ 4]  345         bcc     LOSTCD
   1C2B 20 67 1D      [ 6]  346         jsr     AGCUPD
   1C2E 20 B7 1C      [ 6]  347         jsr     TUPDATE
   1C31 AD 01 03      [ 4]  348         lda     transport_control_reg_a
   1C34 10 EF         [ 4]  349         bpl     L1C25
   1C36 20 4E 1C      [ 6]  350         jsr     PROTOHAND
   1C39 4C 25 1C      [ 3]  351         jmp     L1C25
                            352 
                            353 
   1C3C                     354 LOSTCD:
   1C3C A9 64         [ 2]  355         lda     #0x64
   1C3E 85 50         [ 3]  356         sta     TIMER_1MS_A
   1C40                     357 L1C40:
   1C40 20 B7 1C      [ 6]  358         jsr     TUPDATE
   1C43 AD 02 03      [ 4]  359         lda     transport_periph$ddr_reg_b
   1C46 4A            [ 2]  360         lsr
   1C47 B0 C1         [ 4]  361         bcs     PLAYTRK
   1C49 A5 50         [ 3]  362         lda     TIMER_1MS_A
   1C4B D0 F3         [ 4]  363         bne     L1C40
   1C4D 60            [ 6]  364         rts
                            365 ;
                            366 ; Protocol handler
                            367 ;
   1C4E                     368 PROTOHAND:
   1C4E AD 00 03      [ 4]  369         lda     transport_periph$ddr_reg_a
   1C51                     370 PROCBYTE:
   1C51 29 7F         [ 2]  371         and     #0x7F
   1C53 85 5D         [ 3]  372         sta     TAPE_BYTE
   1C55 29 7E         [ 2]  373         and     #0x7E
   1C57 C9 22         [ 2]  374         cmp     #0x22
   1C59 F0 3A         [ 4]  375         beq     PROCCHNL
   1C5B C9 32         [ 2]  376         cmp     #0x32
   1C5D 90 4F         [ 4]  377         bcc     $18
   1C5F C9 3A         [ 2]  378         cmp     #0x3A
   1C61 90 32         [ 4]  379         bcc     PROCCHNL
   1C63 A5 5D         [ 3]  380         lda     TAPE_BYTE
   1C65 C9 41         [ 2]  381         cmp     #0x41
   1C67 90 45         [ 4]  382         bcc     $18
   1C69 C9 4F         [ 2]  383         cmp     #0x4F                           ; is it >= 0x4F?
   1C6B B0 41         [ 4]  384         bcs     $18
   1C6D A6 65         [ 3]  385         ldx     CURR_PORT
   1C6F 38            [ 2]  386         sec                                     ; (it's 0x41 to 0x4E)
   1C70 E9 41         [ 2]  387         sbc     #0x41
   1C72 C9 08         [ 2]  388         cmp     #0x08
   1C74 90 02         [ 4]  389         bcc     $16
   1C76 E8            [ 2]  390         inx
   1C77 E8            [ 2]  391         inx
   1C78                     392 $16:
   1C78 29 07         [ 2]  393         and     #0x07
   1C7A A8            [ 2]  394         tay
   1C7B B9 AF 1C      [ 5]  395         lda     MASKTBL,y
   1C7E 85 5E         [ 3]  396         sta     SOL_MASK
   1C80 A5 5F         [ 3]  397         lda     CURR_CHANNEL
   1C82 4A            [ 2]  398         lsr
   1C83 B0 09         [ 4]  399         bcs     $17
   1C85 A5 5E         [ 3]  400         lda     SOL_MASK
   1C87 49 FF         [ 2]  401         eor     #0xFF
   1C89 35 00         [ 4]  402         and     0x00,x
   1C8B 95 00         [ 4]  403         sta     0x00,x
   1C8D 60            [ 6]  404         rts
                            405 ;
   1C8E                     406 $17:
   1C8E A5 5E         [ 3]  407         lda     SOL_MASK
   1C90 15 00         [ 4]  408         ora     0x00,x
   1C92 95 00         [ 4]  409         sta     0x00,x
   1C94 60            [ 6]  410         rts
                            411 ;
   1C95                     412 PROCCHNL:
   1C95 A5 5D         [ 3]  413         lda     TAPE_BYTE
   1C97 85 5F         [ 3]  414         sta     CURR_CHANNEL
   1C99 29 7E         [ 2]  415         and     #0x7E
   1C9B C9 22         [ 2]  416         cmp     #0x22
   1C9D D0 05         [ 4]  417         bne     CONVCHNL
   1C9F A9 98         [ 2]  418         lda     #0x98
   1CA1 85 65         [ 3]  419         sta     CURR_PORT
   1CA3 60            [ 6]  420         rts
                            421 ;
   1CA4                     422 CONVCHNL:
   1CA4 38            [ 2]  423         sec
   1CA5 E9 32         [ 2]  424         sbc     #0x32
   1CA7 0A            [ 2]  425         asl
   1CA8 18            [ 2]  426         clc
   1CA9 69 80         [ 2]  427         adc     #0x80
   1CAB 85 65         [ 3]  428         sta     CURR_PORT
   1CAD 60            [ 6]  429         rts
   1CAE                     430 $18:
   1CAE 60            [ 6]  431         rts
                            432 ;
                            433 ; bit mask table
                            434 ;
   1CAF                     435 MASKTBL:
   1CAF 01 02 04 08         436         .db     0x01,0x02,0x04,0x08
   1CB3 10 20 40 80         437         .db     0x10,0x20,0x40,0x80
                            438 ;
                            439 ;       Housekeeping routine
                            440 ;
                            441 ;
   1CB7                     442 TUPDATE:
   1CB7 AD 05 02      [ 4]  443         lda     U18_edge_detect_control_DI_pos
   1CBA 85 60         [ 3]  444         sta     TIMER_TMP
   1CBC F0 5C         [ 4]  445         beq     TEXIT
   1CBE A5 5C         [ 3]  446         lda     PROG_STATE
   1CC0 30 0E         [ 4]  447         bmi     $20_A
   1CC2 A5 60         [ 3]  448         lda     TIMER_TMP
   1CC4 29 40         [ 2]  449         and     #0x40
   1CC6 F0 1A         [ 4]  450         beq     $20_B
   1CC8 A9 80         [ 2]  451         lda     #0x80
   1CCA 85 5C         [ 3]  452         sta     PROG_STATE
   1CCC A9 FA         [ 2]  453         lda     #0xFA
   1CCE 85 51         [ 3]  454         sta     TIMER_1MS_B
   1CD0                     455 $20_A:
   1CD0 A5 51         [ 3]  456         lda     TIMER_1MS_B
   1CD2 D0 0A         [ 4]  457         bne     $20
   1CD4 A9 00         [ 2]  458         lda     #0x00
   1CD6 85 5C         [ 3]  459         sta     PROG_STATE
   1CD8 A5 5B         [ 3]  460         lda     PROG_CTR
   1CDA D0 02         [ 4]  461         bne     $20
   1CDC E6 5B         [ 5]  462         inc     PROG_CTR
   1CDE                     463 $20:
   1CDE A5 60         [ 3]  464         lda     TIMER_TMP
   1CE0 10 38         [ 4]  465         bpl     TEXIT
                            466 ; Adjust Timer routine
   1CE2                     467 $20_B:
   1CE2 AD 04 02      [ 4]  468         lda     U18_timer
   1CE5 49 FF         [ 2]  469         eor     #0xFF
   1CE7 4A            [ 2]  470         lsr
   1CE8 4A            [ 2]  471         lsr
   1CE9 4A            [ 2]  472         lsr
   1CEA 85 58         [ 3]  473         sta     TIMER_TMP1
   1CEC 90 02         [ 4]  474         bcc     $21
   1CEE E6 58         [ 5]  475         inc     TIMER_TMP1
                            476 
                            477 
   1CF0                     478 $21:
   1CF0 A9 7A         [ 2]  479         lda     #0x7A
   1CF2 38            [ 2]  480         sec
   1CF3 E5 58         [ 3]  481         sbc     TIMER_TMP1
   1CF5 8D 15 02      [ 4]  482         sta     U18_timer_8T_DI
   1CF8 C6 50         [ 5]  483         dec     TIMER_1MS_A
   1CFA C6 51         [ 5]  484         dec     TIMER_1MS_B
   1CFC C6 53         [ 5]  485         dec     TIMER_1MS_C
   1CFE C6 54         [ 5]  486         dec     TIMER_1MS_R
   1D00 D0 18         [ 4]  487         bne     TEXIT
   1D02 A9 64         [ 2]  488         lda     #0x64
   1D04 85 54         [ 3]  489         sta     TIMER_1MS_R
   1D06 C6 55         [ 5]  490         dec     TIMER_100MS_A
   1D08 C6 66         [ 5]  491         dec     TIMER_100MS_R25
   1D0A D0 04         [ 4]  492         bne     $21_A
   1D0C A9 FA         [ 2]  493         lda     #0xFA                   ; reset to 2.5 seconds?
   1D0E 85 66         [ 3]  494         sta     TIMER_100MS_R25
   1D10                     495 $21_A:
   1D10 C6 56         [ 5]  496         dec     TIMER_100MS_R
   1D12 D0 06         [ 4]  497         bne     TEXIT
   1D14 A9 64         [ 2]  498         lda     #0x64                   ; reset to 10 seconds?
   1D16 85 56         [ 3]  499         sta     TIMER_100MS_R
   1D18 C6 57         [ 5]  500         dec     TIMER_10S
   1D1A                     501 TEXIT:
   1D1A 60            [ 6]  502         rts
                            503 ;
                            504 ;       Read the AGC mic level
                            505 ;       Take the average of 8 samples
                            506 ;
   1D1B                     507 AGCMICRD:
   1D1B A9 00         [ 2]  508         lda     #0x00
   1D1D 85 62         [ 3]  509         sta     AGC_ACCUM
   1D1F 85 63         [ 3]  510         sta     AGC_SAMPLES
   1D21 A9 0A         [ 2]  511         lda     #0x0A
   1D23 85 55         [ 3]  512         sta     TIMER_100MS_A
   1D25 A9 64         [ 2]  513         lda     #0x64
   1D27 85 54         [ 3]  514         sta     TIMER_1MS_R
   1D29                     515 $23:
   1D29 20 B7 1C      [ 6]  516         jsr     TUPDATE
   1D2C 20 AB 1D      [ 6]  517         jsr     L1DAB
   1D2F A5 55         [ 3]  518         lda     TIMER_100MS_A
   1D31 D0 F6         [ 4]  519         bne     $23
   1D33 A9 0A         [ 2]  520         lda     #0x0A
   1D35 85 55         [ 3]  521         sta     TIMER_100MS_A
   1D37 A9 64         [ 2]  522         lda     #0x64
   1D39 85 54         [ 3]  523         sta     TIMER_1MS_R
   1D3B A5 63         [ 3]  524         lda     AGC_SAMPLES
   1D3D C9 08         [ 2]  525         cmp     #0x08
   1D3F F0 15         [ 4]  526         beq     $27
   1D41 E6 63         [ 5]  527         inc     AGC_SAMPLES
   1D43 A2 09         [ 2]  528         ldx     #0x09
   1D45 38            [ 2]  529         sec
   1D46 AD 80 03      [ 4]  530         lda     audio_periph$ddr_reg_a
   1D49                     531 $24:
   1D49 2A            [ 2]  532         rol
   1D4A CA            [ 2]  533         dex
   1D4B 90 FC         [ 4]  534         bcc     $24
   1D4D 18            [ 2]  535         clc
   1D4E 8A            [ 2]  536         txa
   1D4F 65 62         [ 3]  537         adc     AGC_ACCUM
   1D51 85 62         [ 3]  538         sta     AGC_ACCUM
   1D53 4C 29 1D      [ 3]  539         jmp     $23
                            540 ;
   1D56                     541 $27:
   1D56 46 62         [ 5]  542         lsr     AGC_ACCUM
   1D58 46 62         [ 5]  543         lsr     AGC_ACCUM
   1D5A 46 62         [ 5]  544         lsr     AGC_ACCUM
   1D5C A5 62         [ 3]  545         lda     AGC_ACCUM
   1D5E 85 61         [ 3]  546         sta     AGC_LEVEL
   1D60 A9 00         [ 2]  547         lda     #0x00
   1D62 85 62         [ 3]  548         sta     AGC_ACCUM
   1D64 85 63         [ 3]  549         sta     AGC_SAMPLES
   1D66 60            [ 6]  550         rts
                            551 ;
                            552 ;        Do AGC Mic Logic
                            553 ;
   1D67                     554 AGCUPD:
   1D67 AD 80 02      [ 4]  555         lda     U19_PORTA
   1D6A 49 FF         [ 2]  556         eor     #0xFF
   1D6C 4A            [ 2]  557         lsr
   1D6D 4A            [ 2]  558         lsr
   1D6E 4A            [ 2]  559         lsr
   1D6F 4A            [ 2]  560         lsr
   1D70 18            [ 2]  561         clc
   1D71 65 61         [ 3]  562         adc     AGC_LEVEL
   1D73 AA            [ 2]  563         tax
   1D74 BD 9A 1D      [ 5]  564         lda     AGCTABLE,x
   1D77 85 64         [ 3]  565         sta     AGC_GAIN
   1D79 A5 53         [ 3]  566         lda     TIMER_1MS_C
   1D7B D0 16         [ 4]  567         bne     $26
   1D7D A9 0A         [ 2]  568         lda     #0x0A
   1D7F 85 53         [ 3]  569         sta     TIMER_1MS_C
   1D81 A5 64         [ 3]  570         lda     AGC_GAIN
   1D83 CD 82 03      [ 4]  571         cmp     audio_periph$ddr_reg_b
   1D86 90 08         [ 4]  572         bcc     $25
   1D88 F0 09         [ 4]  573         beq     $26
   1D8A EE 82 03      [ 6]  574         inc     audio_periph$ddr_reg_b
   1D8D 4C 93 1D      [ 3]  575         jmp     $26
                            576 ;
   1D90                     577 $25:
   1D90 CE 82 03      [ 6]  578         dec     audio_periph$ddr_reg_b
   1D93                     579 $26:
   1D93 AD 82 03      [ 4]  580         lda     audio_periph$ddr_reg_b
   1D96 8D 82 02      [ 4]  581         sta     U19_PORTB
   1D99 60            [ 6]  582         rts
                            583 ;
                            584 ;       AGC table
                            585 ;
   1D9A                     586 AGCTABLE:
   1D9A 03 04 06 08         587         .db     0x03, 0x04, 0x06, 0x08
   1D9E 10 16 20 2D         588         .db     0x10, 0x16, 0x20, 0x2D
   1DA2 40 5A 80 BF         589         .db     0x40, 0x5A, 0x80, 0xBF
   1DA6 FF FF FF FF         590         .db     0xFF, 0xFF, 0xFF, 0xFF
   1DAA FF                  591         .db     0xFF
                            592 
   1DAB                     593 L1DAB:
   1DAB A5 67         [ 3]  594         lda     RAM_67
   1DAD AA            [ 2]  595         tax
   1DAE A5 68         [ 3]  596         lda     RAM_68
   1DB0 D0 33         [ 4]  597         bne     L1DE5
   1DB2 BD 0F 1E      [ 5]  598         lda     X1E0F,x
   1DB5 C9 FE         [ 2]  599         cmp     #0xFE
   1DB7 F0 23         [ 4]  600         beq     L1DDC
   1DB9 C9 FF         [ 2]  601         cmp     #0xFF
   1DBB D0 07         [ 4]  602         bne     L1DC4
   1DBD A9 00         [ 2]  603         lda     #0x00
   1DBF 85 67         [ 3]  604         sta     RAM_67
   1DC1 4C DB 1D      [ 3]  605         jmp     L1DDB
                            606 
                            607 
   1DC4                     608 L1DC4:
   1DC4 C5 66         [ 3]  609         cmp     TIMER_100MS_R25
   1DC6 D0 13         [ 4]  610         bne     L1DDB
   1DC8 BD 10 1E      [ 5]  611         lda     X1E10,x
   1DCB 20 51 1C      [ 6]  612         jsr     PROCBYTE
   1DCE BD 11 1E      [ 5]  613         lda     X1E11,x
   1DD1 20 51 1C      [ 6]  614         jsr     PROCBYTE
   1DD4 A5 67         [ 3]  615         lda     RAM_67
   1DD6 18            [ 2]  616         clc
   1DD7 69 03         [ 2]  617         adc     #0x03
   1DD9 85 67         [ 3]  618         sta     RAM_67
                            619 
                            620 
   1DDB                     621 L1DDB:
   1DDB 60            [ 6]  622         rts
                            623 
                            624 
   1DDC                     625 L1DDC:
   1DDC E6 68         [ 5]  626         inc     RAM_68
   1DDE A9 00         [ 2]  627         lda     #0x00
   1DE0 85 67         [ 3]  628         sta     RAM_67
   1DE2 4C DB 1D      [ 3]  629         jmp     L1DDB
                            630 
                            631 
   1DE5                     632 L1DE5:
   1DE5 BD F3 1E      [ 5]  633         lda     X1EF3,x
   1DE8 C9 FF         [ 2]  634         cmp     #0xFF
   1DEA D0 09         [ 4]  635         bne     L1DF5
   1DEC A9 00         [ 2]  636         lda     #0x00
   1DEE 85 67         [ 3]  637         sta     RAM_67
   1DF0 85 68         [ 3]  638         sta     RAM_68
   1DF2 4C DB 1D      [ 3]  639         jmp     L1DDB
                            640 
                            641 
   1DF5                     642 L1DF5:
   1DF5 C5 66         [ 3]  643         cmp     TIMER_100MS_R25
   1DF7 D0 E2         [ 4]  644         bne     L1DDB
   1DF9 BD F4 1E      [ 5]  645         lda     X1EF4,x
   1DFC 20 51 1C      [ 6]  646         jsr     PROCBYTE
   1DFF BD F5 1E      [ 5]  647         lda     X1EF5,x
   1E02 20 51 1C      [ 6]  648         jsr     PROCBYTE
   1E05 A5 67         [ 3]  649         lda     RAM_67
   1E07 18            [ 2]  650         clc
   1E08 69 03         [ 2]  651         adc     #0x03
   1E0A 85 67         [ 3]  652         sta     RAM_67
   1E0C 4C DB 1D      [ 3]  653         jmp     L1DDB
                            654 ;
                            655 ;       Table of pairs of bytes to process
                            656 ;
   1E0F                     657 X1E0F:
   1E0F EE                  658         .byte   0xEE
                            659 
   1E10                     660 X1E10:
   1E10 35                  661         .byte   0x35
                            662 
   1E11                     663 X1E11:
   1E11 46 EB 35 49 E9 35   664         .byte   0x46,0xEB,0x35,0x49,0xE9,0x35,0x4A,0xE9,0x33,0x42,0xE8,0x33,0x46,0xE7,0x32,0x46
        4A E9 33 42 E8 33
        46 E7 32 46
   1E21 E6 33 46 E5 32 46   665         .byte   0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3,0x32,0x46,0xE2,0x33,0x46,0xE1
        E4 33 46 E3 32 46
        E2 33 46 E1
   1E31 32 46 E0 33 46 DF   666         .byte   0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33,0x46,0xDD,0x32,0x46,0xDD,0x34
        32 46 DE 33 46 DD
        32 46 DD 34
   1E41 46 DC 33 46 DB 32   667         .byte   0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46,0xDA,0x33,0x46,0xD9,0x32,0x46
        46 DB 35 46 DA 33
        46 D9 32 46
   1E51 D1 32 42 C6 33 47   668         .byte   0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5,0x32,0x47,0xC3,0x34,0x46,0xC2
        C6 33 43 C5 32 47
        C3 34 46 C2
   1E61 33 47 C1 32 47 C0   669         .byte   0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34,0x46,0xB9,0x32,0x43,0xB7,0x35
        35 46 B9 34 46 B9
        32 43 B7 35
   1E71 46 B7 33 42 B3 33   670         .byte   0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46,0xA8,0x32,0x42,0x9D,0x33,0x47
        46 B2 32 46 A8 32
        42 9D 33 47
   1E81 9C 32 47 9B 33 47   671         .byte   0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A,0x34,0x46,0x99,0x33,0x47,0x99
        9A 32 47 9A 34 46
        99 33 47 99
   1E91 33 43 99 35 46 98   672         .byte   0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33,0x47,0x94,0x32,0x47,0x93,0x33
        32 47 97 33 47 94
        32 47 93 33
   1EA1 47 92 32 47 91 33   673         .byte   0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47,0x87,0x33,0x42,0x86,0x32,0x43
        47 90 32 47 87 33
        42 86 32 43
   1EB1 7D 33 46 7C 32 46   674         .byte   0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77,0x34,0x46,0x75,0x32,0x43,0x75
        77 32 42 77 34 46
        75 32 43 75
   1EC1 35 46 6A 33 46 69   675         .byte   0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33,0x46,0x66,0x32,0x46,0x66,0x32
        32 46 67 33 46 66
        32 46 66 32
   1ED1 43 65 34 46 62 35   676         .byte   0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42,0x56,0x33,0x46,0x55,0x32,0x46
        46 62 33 42 56 33
        46 55 32 46
   1EE1 55 32 42 54 33 46   677         .byte   0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52,0x33,0x46,0x51,0x32,0x46,0xFE
        53 32 46 52 33 46
        51 32 46 FE
   1EF1 FE FE               678         .byte   0xFE,0xFE
                            679 
   1EF3                     680 X1EF3:
   1EF3 50                  681         .byte   0x50
                            682 
   1EF4                     683 X1EF4:
   1EF4 33                  684         .byte   0x33
                            685 
   1EF5                     686 X1EF5:
   1EF5 46 4F 32 46 4E 33   687         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   1F05 4B 32 46 40 34 46   688         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   1F15 33 47 39 32 47 32   689         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   1F25 46 26 33 43 23 33   690         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   1F35 1B 33 47 1A 32 47   691         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   1F45 33 47 17 32 42 16   692         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   1F55 43 03 33 46 02 32   693         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
   1F65 FF FF FF FF FF FF   694         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F75 FF FF FF FF FF FF   695         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F85 FF FF FF FF FF FF   696         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F95 FF FF FF FF FF FF   697         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FA5 FF FF FF FF FF FF   698         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FB5 FF FF FF FF FF FF   699         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FC5 FF FF FF FF FF FF   700         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FD5 FF FF FF FF FF FF   701         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FE5 FF FF FF FF FF FF   702         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FF5 FF FF FF FF FF      703         .byte   0xFF,0xFF,0xFF,0xFF,0xFF
                            704 
   1FFA                     705         .org    0x1FFA
                            706         ;
                            707         ; vectors
                            708         ;
   1FFA                     709 NMIVEC:
   1FFA FF FF               710         .dw     0xFFFF
   1FFC                     711 RESETVEC:
   1FFC 00 1A               712         .dw     RESET
   1FFE                     713 IRQVEC:
   1FFE FF FF               714         .dw     0xFFFF
