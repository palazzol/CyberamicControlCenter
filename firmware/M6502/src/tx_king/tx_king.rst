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
   1A78 85 66         [ 3]   94         sta     TIMER_100MS_R25                         ; init 25 second timer
   1A7A A9 00         [ 2]   95         lda     #0x00
   1A7C 85 67         [ 3]   96         sta     RAM_67
   1A7E 85 68         [ 3]   97         sta     RAM_68
   1A80 A9 30         [ 2]   98         lda     #0x30
   1A82 A9 40         [ 2]   99         lda     #TAPEMODE_REWIND
   1A84 20 97 1B      [ 6]  100         jsr     TAPECMD                                 ; REWIND tape
   1A87                     101 $22:
   1A87 A9 00         [ 2]  102         lda     #0x00
   1A89 85 59         [ 3]  103         sta     ZEROCROSS_CTR                           ; counter to zero
                            104 ; Look for the long tone at the beginning of tape
   1A8B                     105 $2:
   1A8B AD 02 03      [ 4]  106         lda     transport_periph$ddr_reg_b
   1A8E A9 0A         [ 2]  107         lda     #0x0A
   1A90 85 50         [ 3]  108         sta     TIMER_1MS_A                             ; set 10ms second timer
   1A92 E6 59         [ 5]  109         inc     ZEROCROSS_CTR
   1A94 A5 59         [ 3]  110         lda     ZEROCROSS_CTR
   1A96 C9 64         [ 2]  111         cmp     #0x64
   1A98 B0 12         [ 4]  112         bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
   1A9A                     113 $3:
   1A9A 20 B7 1C      [ 6]  114         jsr     TUPDATE                                 ; housekeeping
   1A9D 20 AB 1D      [ 6]  115         jsr     L1DAB
   1AA0 A5 50         [ 3]  116         lda     TIMER_1MS_A
   1AA2 F0 E3         [ 4]  117         beq     $22
   1AA4 AD 03 03      [ 4]  118         lda     transport_control_reg_b
   1AA7 10 F1         [ 4]  119         bpl     $3
   1AA9 4C 8B 1A      [ 3]  120         jmp     $2
                            121 ;
   1AAC                     122 FINDTRK:
   1AAC A9 20         [ 2]  123         lda     #TAPEMODE_FFWD
   1AAE 20 97 1B      [ 6]  124         jsr     TAPECMD                                 ; FFWD tape
   1AB1 A9 19         [ 2]  125         lda     #0x19
   1AB3 85 55         [ 3]  126         sta     TIMER_100MS_A                           ; 2.5 secs
   1AB5 A9 64         [ 2]  127         lda     #0x64
   1AB7 85 54         [ 3]  128         sta     TIMER_1MS_R
   1AB9                     129 $5:
   1AB9 20 B7 1C      [ 6]  130         jsr     TUPDATE                                 ; do housekeeping stuff
   1ABC 20 AB 1D      [ 6]  131         jsr     L1DAB
   1ABF A5 55         [ 3]  132         lda     TIMER_100MS_A
   1AC1 D0 F6         [ 4]  133         bne     $5
   1AC3 A9 00         [ 2]  134         lda     #0x00
   1AC5 85 5A         [ 3]  135         sta     TRACK_CTR
   1AC7 20 B5 1B      [ 6]  136         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1ACA A9 40         [ 2]  137         lda     #TAPEMODE_REWIND
   1ACC 20 97 1B      [ 6]  138         jsr     TAPECMD                                 ; REWIND tape
   1ACF 20 B5 1B      [ 6]  139         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1AD2 A9 FA         [ 2]  140         lda     #0xFA
   1AD4 85 50         [ 3]  141         sta     TIMER_1MS_A
   1AD6                     142 $30:
   1AD6 20 B7 1C      [ 6]  143         jsr     TUPDATE                                 ; housekeeping
   1AD9 20 AB 1D      [ 6]  144         jsr     L1DAB
   1ADC A5 50         [ 3]  145         lda     TIMER_1MS_A
   1ADE D0 F6         [ 4]  146         bne     $30                                     ; delay for 250 ms
   1AE0 A9 20         [ 2]  147         lda     #TAPEMODE_FFWD
   1AE2 20 97 1B      [ 6]  148         jsr     TAPECMD                                 ; FFWD tape
   1AE5 20 B5 1B      [ 6]  149         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1AE8 E6 5A         [ 5]  150         inc     TRACK_CTR
   1AEA A9 10         [ 2]  151         lda     #TAPEMODE_STOP
   1AEC 20 97 1B      [ 6]  152         jsr     TAPECMD                                 ; STOP tape
   1AEF A9 80         [ 2]  153         lda     #TAPEMODE_PLAY
   1AF1 20 97 1B      [ 6]  154         jsr     TAPECMD                                 ; PLAY tape
   1AF4 20 DB 1B      [ 6]  155         jsr     WAITCD                                  ; wait for carrier
   1AF7 A9 10         [ 2]  156         lda     #TAPEMODE_STOP
   1AF9 20 97 1B      [ 6]  157         jsr     TAPECMD                                 ; STOP Tape
   1AFC 20 64 1B      [ 6]  158         jsr     INITBRDS                                ; init the boards
   1AFF                     159 WAITPLAY:
   1AFF 20 B7 1C      [ 6]  160         jsr     TUPDATE                                 ; do housekeeping stuff
   1B02 20 67 1D      [ 6]  161         jsr     AGCUPD                                  ; do AGC Mic Logic
   1B05 20 AB 1D      [ 6]  162         jsr     L1DAB
   1B08 A5 5B         [ 3]  163         lda     PROG_CTR                                ; wait until we are triggered
   1B0A D0 10         [ 4]  164         bne     STARTPLAY                               ; then jump
   1B0C A9 02         [ 2]  165         lda     #0x02                                   ; else
   1B0E 8D 80 02      [ 4]  166         sta     U19_PORTA                               ; turn on RESET button light
   1B11 A9 00         [ 2]  167         lda     #0x00
   1B13 8D 02 02      [ 4]  168         sta     U18_PORTB                               ; turn on all other button lights
   1B16 A5 57         [ 3]  169         lda     TIMER_10S                               ; has the 8 minute timer run out?
   1B18 D0 E5         [ 4]  170         bne     WAITPLAY                                ; no, keep looping
   1B1A E6 5B         [ 5]  171         inc     PROG_CTR                                ; yes, simulate a PROG button press
                            172 ;   we have been started!
   1B1C                     173 STARTPLAY:
   1B1C 20 64 1B      [ 6]  174         jsr     INITBRDS                                ; init the boards
   1B1F A9 00         [ 2]  175         lda     #0x00
   1B21 8D 80 02      [ 4]  176         sta     U19_PORTA                               ; turn off RESET button light
   1B24 A9 80         [ 2]  177         lda     #0x80
   1B26 8D 02 02      [ 4]  178         sta     U18_PORTB                               ; turn off all but PROG light
   1B29 A9 80         [ 2]  179         lda     #TAPEMODE_PLAY
   1B2B 20 97 1B      [ 6]  180         jsr     TAPECMD                                 ; PLAY tape
   1B2E 20 DB 1B      [ 6]  181         jsr     WAITCD                                  ; wait for carrier
   1B31 C6 5B         [ 5]  182         dec     PROG_CTR                                  ; no longer triggered
   1B33 20 0A 1C      [ 6]  183         jsr     PLAYTRK                                 ; play a track!
   1B36 20 64 1B      [ 6]  184         jsr     INITBRDS                                ; init the boards
   1B39 A9 18         [ 2]  185         lda     #0x18
   1B3B 85 57         [ 3]  186         sta     TIMER_10S                               ; set a 4 min timer
   1B3D A9 64         [ 2]  187         lda     #0x64
   1B3F 85 56         [ 3]  188         sta     TIMER_100MS_R
   1B41 E6 5A         [ 5]  189         inc     TRACK_CTR                               ; track counter
   1B43 A5 5A         [ 3]  190         lda     TRACK_CTR
   1B45 C9 1A         [ 2]  191         cmp     #0x1A                                   ; 26?
   1B47 90 03         [ 4]  192         bcc     NEXTTRK
   1B49 4C 76 1A      [ 3]  193         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            194 ; go to next track
   1B4C                     195 NEXTTRK:
   1B4C A9 00         [ 2]  196         lda     #0x00
   1B4E 85 67         [ 3]  197         sta     RAM_67
   1B50 85 68         [ 3]  198         sta     RAM_68
   1B52 A9 FA         [ 2]  199         lda     #0xFA
   1B54 85 66         [ 3]  200         sta     TIMER_100MS_R25
   1B56 20 DB 1B      [ 6]  201         jsr     WAITCD                                  ; wait for carrier
   1B59 A9 10         [ 2]  202         lda     #TAPEMODE_STOP
   1B5B 20 97 1B      [ 6]  203         jsr     TAPECMD                                 ; STOP tape
   1B5E 20 1B 1D      [ 6]  204         jsr     AGCMICRD                                ; Read the AGC mic level
   1B61 4C FF 1A      [ 3]  205         jmp     WAITPLAY
                            206 ;
                            207 ;       Init boards
                            208 ;
   1B64                     209 INITBRDS:
   1B64 A9 3C         [ 2]  210         lda     #0x3C
   1B66 8D 83 03      [ 4]  211         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1B69 A9 34         [ 2]  212         lda     #0x34
   1B6B 8D 81 03      [ 4]  213         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1B6E A2 00         [ 2]  214         ldx     #0x00
   1B70                     215 NEXTBRD:
   1B70 A9 30         [ 2]  216         lda     #0x30
   1B72 95 81         [ 4]  217         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1B74 95 83         [ 4]  218         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1B76 A9 FF         [ 2]  219         lda     #0xFF
   1B78 95 80         [ 4]  220         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1B7A 95 82         [ 4]  221         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1B7C A9 34         [ 2]  222         lda     #0x34
   1B7E 95 81         [ 4]  223         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1B80 95 83         [ 4]  224         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1B82 A9 00         [ 2]  225         lda     #0x00
   1B84 95 80         [ 4]  226         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1B86 95 82         [ 4]  227         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1B88 E8            [ 2]  228         inx
   1B89 E8            [ 2]  229         inx
   1B8A E8            [ 2]  230         inx
   1B8B E8            [ 2]  231         inx
   1B8C E0 20         [ 2]  232         cpx     #0x20                                   ; do for boards 1-8
   1B8E 90 E0         [ 4]  233         bcc     NEXTBRD
                            234 
   1B90 A9 00         [ 2]  235         lda     #0x00
   1B92 85 5F         [ 3]  236         sta     CURR_CHANNEL
   1B94 85 65         [ 3]  237         sta     CURR_PORT
   1B96 60            [ 6]  238         rts
                            239 ;
                            240 ;       Send Transport command for 0.250 sec
                            241 ;       (Unified)
                            242 ;
   1B97                     243 TAPECMD:
   1B97 8D 02 03      [ 4]  244         sta     transport_periph$ddr_reg_b
   1B9A A9 FA         [ 2]  245         lda     #0xFA
   1B9C 85 50         [ 3]  246         sta     TIMER_1MS_A
   1B9E                     247 $6:
   1B9E 20 B7 1C      [ 6]  248         jsr     TUPDATE                                 ; check for PROG button push
   1BA1 20 AB 1D      [ 6]  249         jsr     L1DAB
   1BA4 A5 50         [ 3]  250         lda     TIMER_1MS_A
   1BA6 D0 F6         [ 4]  251         bne     $6
   1BA8 AD 02 03      [ 4]  252         lda     transport_periph$ddr_reg_b
   1BAB 29 60         [ 2]  253         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1BAD D0 05         [ 4]  254         bne     $31                                     ; Yes, go to exit
   1BAF A9 00         [ 2]  255         lda     #0x00                                   ; else unassert STOP or PLAY
   1BB1 8D 02 03      [ 4]  256         sta     transport_periph$ddr_reg_b              ; and then exit
   1BB4                     257 $31:
   1BB4 60            [ 6]  258         rts
                            259 ;
                            260 ;       Wait for tone during Fast Forward, signaling beginning of track
                            261 ;       (50Hz or above, for 33 zero crossing) 
                            262 ;
   1BB5                     263 WAITTONE:
   1BB5 A9 00         [ 2]  264         lda     #0x00
   1BB7 85 59         [ 3]  265         sta     ZEROCROSS_CTR
   1BB9                     266 $8:
   1BB9 AD 02 03      [ 4]  267         lda     transport_periph$ddr_reg_b
   1BBC A9 0A         [ 2]  268         lda     #0x0A
   1BBE 85 50         [ 3]  269         sta     TIMER_1MS_A                             ; 10 msec
   1BC0 E6 59         [ 5]  270         inc     ZEROCROSS_CTR
   1BC2 A5 59         [ 3]  271         lda     ZEROCROSS_CTR
   1BC4 C9 21         [ 2]  272         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   1BC6 B0 12         [ 4]  273         bcs     $10                                     ; timeout - exit
   1BC8                     274 $9:
   1BC8 20 B7 1C      [ 6]  275         jsr     TUPDATE                                 ; housekeeping
   1BCB 20 AB 1D      [ 6]  276         jsr     L1DAB
   1BCE A5 50         [ 3]  277         lda     TIMER_1MS_A
   1BD0 F0 E3         [ 4]  278         beq     WAITTONE                                ; 10 msec done yet? then loop
   1BD2 AD 03 03      [ 4]  279         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1BD5 10 F1         [ 4]  280         bpl     $9                                      ; if not, extend the looping
   1BD7 4C B9 1B      [ 3]  281         jmp     $8                                      ; else loop but keep timeout going
   1BDA                     282 $10:
   1BDA 60            [ 6]  283         rts
                            284 ;
                            285 ;       Wait for carrier / start of data
                            286 ;
                            287 
                            288 ; Wait for 250ms
   1BDB                     289 WAITCD:
   1BDB A9 FA         [ 2]  290         lda     #0xFA
   1BDD 85 50         [ 3]  291         sta     TIMER_1MS_A                             ; 250 msec
   1BDF                     292 $11:
   1BDF 20 B7 1C      [ 6]  293         jsr     TUPDATE                                 ; housekeeping
   1BE2 20 AB 1D      [ 6]  294         jsr     L1DAB
   1BE5 A5 50         [ 3]  295         lda     TIMER_1MS_A
   1BE7 D0 F6         [ 4]  296         bne     $11
                            297 
                            298 ; Wait for 160ms of consecutive zero crossings
   1BE9                     299 $12:
   1BE9 20 B7 1C      [ 6]  300         jsr     TUPDATE                                 ; housekeeping
   1BEC 20 AB 1D      [ 6]  301         jsr     L1DAB
   1BEF AD 02 03      [ 4]  302         lda     transport_periph$ddr_reg_b
   1BF2 6A            [ 2]  303         ror
   1BF3 90 F4         [ 4]  304         bcc     $12
   1BF5 A9 A0         [ 2]  305         lda     #0xA0                                   ; 160 msec
   1BF7 85 50         [ 3]  306         sta     TIMER_1MS_A
   1BF9                     307 $13:
   1BF9 20 B7 1C      [ 6]  308         jsr     TUPDATE
   1BFC 20 AB 1D      [ 6]  309         jsr     L1DAB
   1BFF AD 02 03      [ 4]  310         lda     transport_periph$ddr_reg_b
   1C02 6A            [ 2]  311         ror
   1C03 90 E4         [ 4]  312         bcc     $12
   1C05 A5 50         [ 3]  313         lda     TIMER_1MS_A
   1C07 D0 F0         [ 4]  314         bne     $13
   1C09 60            [ 6]  315         rts
                            316 ;
                            317 ;       Play a track
                            318 ;
   1C0A                     319 PLAYTRK:
   1C0A AD 00 03      [ 4]  320         lda     transport_periph$ddr_reg_a
   1C0D A9 40         [ 2]  321         lda     #0x40
   1C0F 85 82         [ 3]  322         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1C11 85 86         [ 3]  323         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1C13 85 8A         [ 3]  324         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1C15 85 8E         [ 3]  325         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   1C17 A9 3C         [ 2]  326         lda     #0x3C
   1C19 8D 81 03      [ 4]  327         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   1C1C A9 34         [ 2]  328         lda     #0x34
   1C1E 8D 83 03      [ 4]  329         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   1C21 A9 60         [ 2]  330         lda     #TIMER_TMP
   1C23 85 82         [ 3]  331         sta     board_1_periph$ddr_reg_b                ; ???
   1C25                     332 $14:
   1C25 AD 02 03      [ 4]  333         lda     transport_periph$ddr_reg_b
   1C28 4A            [ 2]  334         lsr     a
   1C29 90 11         [ 4]  335         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   1C2B 20 67 1D      [ 6]  336         jsr     AGCUPD                                  ; do AGC Mic Logic
   1C2E 20 B7 1C      [ 6]  337         jsr     TUPDATE                                 ; housekeeping
   1C31 AD 01 03      [ 4]  338         lda     transport_control_reg_a                 ; Did we get a byte?
   1C34 10 EF         [ 4]  339         bpl     $14                                     ; No, loop
   1C36 20 4E 1C      [ 6]  340         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   1C39 4C 25 1C      [ 3]  341         jmp     $14
                            342 
                            343 ;       Lost carrier - wait 100 msec for more data before giving up
   1C3C                     344 LOSTCD:
   1C3C A9 64         [ 2]  345         lda     #0x64                                   ; 100 msec
   1C3E 85 50         [ 3]  346         sta     TIMER_1MS_A
   1C40                     347 $15:
   1C40 20 B7 1C      [ 6]  348         jsr     TUPDATE
   1C43 AD 02 03      [ 4]  349         lda     transport_periph$ddr_reg_b
   1C46 4A            [ 2]  350         lsr     a
   1C47 B0 C1         [ 4]  351         bcs     PLAYTRK                                 ; carrier
   1C49 A5 50         [ 3]  352         lda     TIMER_1MS_A
   1C4B D0 F3         [ 4]  353         bne     $15
   1C4D 60            [ 6]  354         rts
                            355 ;
                            356 ; Protocol handler
                            357 ;
   1C4E                     358 PROTOHAND:
   1C4E AD 00 03      [ 4]  359         lda     transport_periph$ddr_reg_a
   1C51                     360 PROCBYTE:
   1C51 29 7F         [ 2]  361         and     #0x7F                                   ; insure data is ASCII
   1C53 85 5D         [ 3]  362         sta     TAPE_BYTE                               ; store it here
   1C55 29 7E         [ 2]  363         and     #0x7E                                   ; ignore bottom bit
   1C57 C9 22         [ 2]  364         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1C59 F0 3A         [ 4]  365         beq     PROCCHNL                                ; if so, process as channel
   1C5B C9 32         [ 2]  366         cmp     #0x32                                   ; is it < 0x32 ?
   1C5D 90 4F         [ 4]  367         bcc     $18                                     ; ignore it
   1C5F C9 3A         [ 2]  368         cmp     #0x3A                                   ; is it < 0x3A
   1C61 90 32         [ 4]  369         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   1C63 A5 5D         [ 3]  370         lda     TAPE_BYTE
   1C65 C9 41         [ 2]  371         cmp     #0x41                                   ; is it < 0x41?
   1C67 90 45         [ 4]  372         bcc     $18                                     ; ignore it
   1C69 C9 4F         [ 2]  373         cmp     #0x4F                                   ; is it >= 0x4F?
   1C6B B0 41         [ 4]  374         bcs     $18                                     ; ignore it
   1C6D A6 65         [ 3]  375         ldx     CURR_PORT                               ; X = current board address
   1C6F 38            [ 2]  376         sec                                             ; (it's 0x41 to 0x4E)
   1C70 E9 41         [ 2]  377         sbc     #0x41                                   ; subtract 0x41
   1C72 C9 08         [ 2]  378         cmp     #0x08
   1C74 90 02         [ 4]  379         bcc     $16                                     ; process as command
   1C76 E8            [ 2]  380         inx
   1C77 E8            [ 2]  381         inx
   1C78                     382 $16:
   1C78 29 07         [ 2]  383         and     #0x07                                   ; lookup bitmask in A
   1C7A A8            [ 2]  384         tay
   1C7B B9 AF 1C      [ 5]  385         lda     MASKTBL,y
   1C7E 85 5E         [ 3]  386         sta     SOL_MASK                                ; store mask in SOL_MASK
   1C80 A5 5F         [ 3]  387         lda     CURR_CHANNEL
   1C82 4A            [ 2]  388         lsr     a                                       ; get on/off in carry
   1C83 B0 09         [ 4]  389         bcs     $17                                     ; if on, jump
   1C85 A5 5E         [ 3]  390         lda     SOL_MASK
   1C87 49 FF         [ 2]  391         eor     #0xFF
   1C89 35 00         [ 4]  392         and     RAM_start,x
   1C8B 95 00         [ 4]  393         sta     RAM_start,x                             ; turn off solenoid
   1C8D 60            [ 6]  394         rts
                            395 ;
   1C8E                     396 $17:
   1C8E A5 5E         [ 3]  397         lda     SOL_MASK
   1C90 15 00         [ 4]  398         ora     RAM_start,x
   1C92 95 00         [ 4]  399         sta     RAM_start,x                             ; turn on solenoid
   1C94 60            [ 6]  400         rts
                            401 ;
   1C95                     402 PROCCHNL:
   1C95 A5 5D         [ 3]  403         lda     TAPE_BYTE                               ; put channel byte in CURR_CHANNEL
   1C97 85 5F         [ 3]  404         sta     CURR_CHANNEL
   1C99 29 7E         [ 2]  405         and     #0x7E
   1C9B C9 22         [ 2]  406         cmp     #0x22
   1C9D D0 05         [ 4]  407         bne     CONVCHNL
   1C9F A9 98         [ 2]  408         lda     #0x98                                   ; process 0x22 or 0x23
   1CA1 85 65         [ 3]  409         sta     CURR_PORT                               ; set this to 0x98 - board 7
   1CA3 60            [ 6]  410         rts
                            411 ;
   1CA4                     412 CONVCHNL:
   1CA4 38            [ 2]  413         sec                                             ; process channel
   1CA5 E9 32         [ 2]  414         sbc     #0x32
   1CA7 0A            [ 2]  415         asl     a
   1CA8 18            [ 2]  416         clc
   1CA9 69 80         [ 2]  417         adc     #0x80
   1CAB 85 65         [ 3]  418         sta     CURR_PORT                               ; (X-0x32) * 2 + 0x80
   1CAD 60            [ 6]  419         rts
   1CAE                     420 $18:
   1CAE 60            [ 6]  421         rts
                            422 ;
                            423 ; bit mask table
                            424 ;
   1CAF                     425 MASKTBL:
   1CAF 01 02 04 08         426         .db     0x01,0x02,0x04,0x08
   1CB3 10 20 40 80         427         .db     0x10,0x20,0x40,0x80
                            428 ;
                            429 ;       Housekeeping routine
                            430 ;       TIMER_1MS_A used on entry
                            431 ;
   1CB7                     432 TUPDATE:
   1CB7 AD 05 02      [ 4]  433        lda     U18_edge_detect_control_DI_pos           ; Did the PROG button get pushed or timer expire?
   1CBA 85 60         [ 3]  434         sta     TIMER_TMP                               ; store this state in 5F
   1CBC F0 5C         [ 4]  435         beq     TEXIT                                   ; No flags set, return
   1CBE A5 5C         [ 3]  436         lda     PROG_STATE
   1CC0 30 0E         [ 4]  437         bmi     $20_A                                   ; TBD - ???
   1CC2 A5 60         [ 3]  438         lda     TIMER_TMP
   1CC4 29 40         [ 2]  439         and     #0x40
   1CC6 F0 1A         [ 4]  440         beq     $20_B
   1CC8 A9 80         [ 2]  441         lda     #0x80
   1CCA 85 5C         [ 3]  442         sta     PROG_STATE
   1CCC A9 FA         [ 2]  443         lda     #0xFA
   1CCE 85 51         [ 3]  444         sta     TIMER_1MS_B
   1CD0                     445 $20_A:
   1CD0 A5 51         [ 3]  446         lda     TIMER_1MS_B
   1CD2 D0 0A         [ 4]  447         bne     $20
   1CD4 A9 00         [ 2]  448         lda     #0x00
   1CD6 85 5C         [ 3]  449         sta     PROG_STATE
   1CD8 A5 5B         [ 3]  450         lda     PROG_CTR
   1CDA D0 02         [ 4]  451         bne     $20
   1CDC E6 5B         [ 5]  452         inc     PROG_CTR
   1CDE                     453 $20:
   1CDE A5 60         [ 3]  454         lda     TIMER_TMP                               ; check timer irq bit
   1CE0 10 38         [ 4]  455         bpl     TEXIT                                   ; if timer not expired, return
                            456 ; Adjust Timer routine
   1CE2                     457 $20_B:
   1CE2 AD 04 02      [ 4]  458         lda     U18_timer                               ; read timer in U18
   1CE5 49 FF         [ 2]  459         eor     #0xFF                                   ; flip the bits
   1CE7 4A            [ 2]  460         lsr     a                                       ; keep the top 5 bits
   1CE8 4A            [ 2]  461         lsr     a
   1CE9 4A            [ 2]  462         lsr     a
   1CEA 85 58         [ 3]  463         sta     TIMER_TMP1                              ; store them
   1CEC 90 02         [ 4]  464         bcc     $21                                     ; bcc on timer bit D2
   1CEE E6 58         [ 5]  465         inc     TIMER_TMP1                              ; round up?
                            466                                                         ; now TIMER_TMP1 has the number of 8us 
                            467                            
   1CF0                     468 $21:
   1CF0 A9 7A         [ 2]  469         lda     #0x7A
   1CF2 38            [ 2]  470         sec
   1CF3 E5 58         [ 3]  471         sbc     TIMER_TMP1
   1CF5 8D 15 02      [ 4]  472         sta     U18_timer_8T_DI
   1CF8 C6 50         [ 5]  473         dec     TIMER_1MS_A
   1CFA C6 51         [ 5]  474         dec     TIMER_1MS_B
   1CFC C6 53         [ 5]  475         dec     TIMER_1MS_C
   1CFE C6 54         [ 5]  476         dec     TIMER_1MS_R
   1D00 D0 18         [ 4]  477         bne     TEXIT
   1D02 A9 64         [ 2]  478         lda     #0x64
   1D04 85 54         [ 3]  479         sta     TIMER_1MS_R
   1D06 C6 55         [ 5]  480         dec     TIMER_100MS_A
   1D08 C6 66         [ 5]  481         dec     TIMER_100MS_R25
   1D0A D0 04         [ 4]  482         bne     $21_A
   1D0C A9 FA         [ 2]  483         lda     #0xFA                   ; reset to 2.5 seconds?
   1D0E 85 66         [ 3]  484         sta     TIMER_100MS_R25
   1D10                     485 $21_A:
   1D10 C6 56         [ 5]  486         dec     TIMER_100MS_R
   1D12 D0 06         [ 4]  487         bne     TEXIT
   1D14 A9 64         [ 2]  488         lda     #0x64                   ; reset to 10 seconds?
   1D16 85 56         [ 3]  489         sta     TIMER_100MS_R
   1D18 C6 57         [ 5]  490         dec     TIMER_10S
   1D1A                     491 TEXIT:
   1D1A 60            [ 6]  492         rts
                            493 ;
                            494 ;       Read the AGC mic level
                            495 ;       Take the average of 8 samples, and put it into AGC_LEVEL (range is 0 to 8)
                            496 ;
   1D1B                     497 AGCMICRD:
   1D1B A9 00         [ 2]  498         lda     #0x00
   1D1D 85 62         [ 3]  499         sta     AGC_ACCUM                               ; init final agc value
   1D1F 85 63         [ 3]  500         sta     AGC_SAMPLES                             ; init agc sample counter
   1D21 A9 0A         [ 2]  501         lda     #0x0A
   1D23 85 55         [ 3]  502         sta     TIMER_100MS_A                           ; Start a 1 second timer
   1D25 A9 64         [ 2]  503         lda     #0x64
   1D27 85 54         [ 3]  504         sta     TIMER_1MS_R
   1D29                     505 $23:
   1D29 20 B7 1C      [ 6]  506         jsr     TUPDATE                                 ; housekeeping
   1D2C 20 AB 1D      [ 6]  507         jsr     L1DAB
   1D2F A5 55         [ 3]  508         lda     TIMER_100MS_A
   1D31 D0 F6         [ 4]  509         bne     $23                                     ; if 1 sec, do housekeeping
   1D33 A9 0A         [ 2]  510         lda     #0x0A
   1D35 85 55         [ 3]  511         sta     TIMER_100MS_A
   1D37 A9 64         [ 2]  512         lda     #0x64
   1D39 85 54         [ 3]  513         sta     TIMER_1MS_R                             ; reset timer
   1D3B A5 63         [ 3]  514         lda     AGC_SAMPLES
   1D3D C9 08         [ 2]  515         cmp     #0x08                                   ; 8 samples?
   1D3F F0 15         [ 4]  516         beq     $27                                     ; yes - jump to final calculation
   1D41 E6 63         [ 5]  517         inc     AGC_SAMPLES                             ; increment the sample counter
   1D43 A2 09         [ 2]  518         ldx     #0x09
   1D45 38            [ 2]  519         sec
   1D46 AD 80 03      [ 4]  520         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1D49                     521 $24:                                                    ; read the most significant high bit
   1D49 2A            [ 2]  522         rol     a
   1D4A CA            [ 2]  523         dex
   1D4B 90 FC         [ 4]  524         bcc     $24
   1D4D 18            [ 2]  525         clc
   1D4E 8A            [ 2]  526         txa                                             ; 8=high bit7, 0=no high bits
   1D4F 65 62         [ 3]  527         adc     AGC_ACCUM                               ; add it into AGC_ACCUM (do this 8 times)
   1D51 85 62         [ 3]  528         sta     AGC_ACCUM
   1D53 4C 29 1D      [ 3]  529         jmp     $23
                            530 ;
   1D56                     531 $27:
   1D56 46 62         [ 5]  532         lsr     AGC_ACCUM                               ; divide by 8 (average of 8 samples)
   1D58 46 62         [ 5]  533         lsr     AGC_ACCUM
   1D5A 46 62         [ 5]  534         lsr     AGC_ACCUM
   1D5C A5 62         [ 3]  535         lda     AGC_ACCUM
   1D5E 85 61         [ 3]  536         sta     AGC_LEVEL                               ; store agc value in AGC_LEVEL
   1D60 A9 00         [ 2]  537         lda     #0x00
   1D62 85 62         [ 3]  538         sta     AGC_ACCUM                               ; clear these 2 and return
   1D64 85 63         [ 3]  539         sta     AGC_SAMPLES
   1D66 60            [ 6]  540         rts
                            541 ;
                            542 ;        Do AGC Mic Logic
                            543 ;
   1D67                     544 AGCUPD:
   1D67 AD 80 02      [ 4]  545         lda     U19_PORTA                               ; read AGC knob
   1D6A 49 FF         [ 2]  546         eor     #0xFF                                   ; invert the bits
   1D6C 4A            [ 2]  547         lsr     a                                       ; get into lower nibble
   1D6D 4A            [ 2]  548         lsr     a
   1D6E 4A            [ 2]  549         lsr     a
   1D6F 4A            [ 2]  550         lsr     a
   1D70 18            [ 2]  551         clc
   1D71 65 61         [ 3]  552         adc     AGC_LEVEL                               ; add audio level to it
   1D73 AA            [ 2]  553         tax
   1D74 BD 9A 1D      [ 5]  554         lda     AGCTABLE,x                              ; and get the table value
   1D77 85 64         [ 3]  555         sta     AGC_GAIN                                ; store this value in AGC_GAIN
   1D79 A5 53         [ 3]  556         lda     TIMER_1MS_C                             ; 10ms timer expired?
   1D7B D0 16         [ 4]  557         bne     $26                                     ; no, just update CPU Leds
   1D7D A9 0A         [ 2]  558         lda     #0x0A
   1D7F 85 53         [ 3]  559         sta     TIMER_1MS_C                             ; restart 10ms timer
   1D81 A5 64         [ 3]  560         lda     AGC_GAIN                                ; every 10ms, adjust gain by 1 if needed
   1D83 CD 82 03      [ 4]  561         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   1D86 90 08         [ 4]  562         bcc     $25
   1D88 F0 09         [ 4]  563         beq     $26
   1D8A EE 82 03      [ 6]  564         inc     audio_periph$ddr_reg_b                  ; increase value
   1D8D 4C 93 1D      [ 3]  565         jmp     $26
                            566 ;
   1D90                     567 $25:
   1D90 CE 82 03      [ 6]  568         dec     audio_periph$ddr_reg_b                  ; decrease value
   1D93                     569 $26:
   1D93 AD 82 03      [ 4]  570         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   1D96 8D 82 02      [ 4]  571         sta     U19_PORTB
   1D99 60            [ 6]  572         rts
                            573 ;
                            574 ;       AGC table
                            575 ;
   1D9A                     576 AGCTABLE:
   1D9A 03 04 06 08         577         .db     0x03, 0x04, 0x06, 0x08
   1D9E 10 16 20 2D         578         .db     0x10, 0x16, 0x20, 0x2D
   1DA2 40 5A 80 BF         579         .db     0x40, 0x5A, 0x80, 0xBF
   1DA6 FF FF FF FF         580         .db     0xFF, 0xFF, 0xFF, 0xFF
   1DAA FF                  581         .db     0xFF
                            582 ;
                            583 ;       Process RAM_67 and RAM_68
                            584 ;
   1DAB                     585 L1DAB:
   1DAB A5 67         [ 3]  586         lda     RAM_67
   1DAD AA            [ 2]  587         tax                                             ; RAM_67 - table offset
   1DAE A5 68         [ 3]  588         lda     RAM_68                                  ; if RAM_68 != 0   
   1DB0 D0 33         [ 4]  589         bne     L1DE5                                   ; goto other table                                  
   1DB2 BD 0F 1E      [ 5]  590         lda     X1E0F,x                                 ; else read byte
   1DB5 C9 FE         [ 2]  591         cmp     #0xFE                                   ; if it's 0xFE
   1DB7 F0 23         [ 4]  592         beq     L1DDC                                   ; goto next table
   1DB9 C9 FF         [ 2]  593         cmp     #0xFF                                   ; if it's not 0xFF
   1DBB D0 07         [ 4]  594         bne     L1DC4                                   ; check the long timer
   1DBD A9 00         [ 2]  595         lda     #0x00                                   ; if it is 0xFF
   1DBF 85 67         [ 3]  596         sta     RAM_67                                  ; else clear RAM_67
   1DC1 4C DB 1D      [ 3]  597         jmp     L1DDB                                   ; and return
                            598 
                            599 
   1DC4                     600 L1DC4:
   1DC4 C5 66         [ 3]  601         cmp     TIMER_100MS_R25
   1DC6 D0 13         [ 4]  602         bne     L1DDB                                   ; if it's not time, return
   1DC8 BD 10 1E      [ 5]  603         lda     X1E0F+1,x                               ; use two bytes from this table
   1DCB 20 51 1C      [ 6]  604         jsr     PROCBYTE
   1DCE BD 11 1E      [ 5]  605         lda     X1E0F+2,x
   1DD1 20 51 1C      [ 6]  606         jsr     PROCBYTE
   1DD4 A5 67         [ 3]  607         lda     RAM_67
   1DD6 18            [ 2]  608         clc
   1DD7 69 03         [ 2]  609         adc     #0x03
   1DD9 85 67         [ 3]  610         sta     RAM_67                                  ; add 3 to RAM_67 and return
                            611 
                            612 
   1DDB                     613 L1DDB:
   1DDB 60            [ 6]  614         rts
                            615 
                            616 
   1DDC                     617 L1DDC:
   1DDC E6 68         [ 5]  618         inc     RAM_68                                  ; add 1 to RAM_68
   1DDE A9 00         [ 2]  619         lda     #0x00
   1DE0 85 67         [ 3]  620         sta     RAM_67                                  ; clear RAM_67
   1DE2 4C DB 1D      [ 3]  621         jmp     L1DDB                                   ; return
                            622 
                            623 
   1DE5                     624 L1DE5:
   1DE5 BD F3 1E      [ 5]  625         lda     X1EF3,x
   1DE8 C9 FF         [ 2]  626         cmp     #0xFF
   1DEA D0 09         [ 4]  627         bne     L1DF5
   1DEC A9 00         [ 2]  628         lda     #0x00
   1DEE 85 67         [ 3]  629         sta     RAM_67
   1DF0 85 68         [ 3]  630         sta     RAM_68
   1DF2 4C DB 1D      [ 3]  631         jmp     L1DDB
                            632 
                            633 
   1DF5                     634 L1DF5:
   1DF5 C5 66         [ 3]  635         cmp     TIMER_100MS_R25
   1DF7 D0 E2         [ 4]  636         bne     L1DDB
   1DF9 BD F4 1E      [ 5]  637         lda     X1EF3+1,x
   1DFC 20 51 1C      [ 6]  638         jsr     PROCBYTE
   1DFF BD F5 1E      [ 5]  639         lda     X1EF3+2,x
   1E02 20 51 1C      [ 6]  640         jsr     PROCBYTE
   1E05 A5 67         [ 3]  641         lda     RAM_67
   1E07 18            [ 2]  642         clc
   1E08 69 03         [ 2]  643         adc     #0x03
   1E0A 85 67         [ 3]  644         sta     RAM_67
   1E0C 4C DB 1D      [ 3]  645         jmp     L1DDB
                            646 ;
                            647 ;       Table of bytes to process
                            648 ;
   1E0F EE 35 46 EB 35 49   649 X1E0F:  .byte   0xEE,0x35,0x46, 0xEB,0x35,0x49, 0xE9,0x35,0x4A, 0xE9,0x33,0x42
        E9 35 4A E9 33 42
   1E1B E8 33 46 E7 32 46   650         .byte   0xE8,0x33,0x46, 0xE7,0x32,0x46, 0xE6,0x33,0x46, 0xE5,0x32,0x46 
        E6 33 46 E5 32 46
   1E27 E4 33 46 E3 32 46   651         .byte   0xE4,0x33,0x46, 0xE3,0x32,0x46, 0xE2,0x33,0x46, 0xE1,0x32,0x46
        E2 33 46 E1 32 46
   1E33 E0 33 46 DF 32 46   652         .byte   0xE0,0x33,0x46, 0xDF,0x32,0x46, 0xDE,0x33,0x46, 0xDD,0x32,0x46
        DE 33 46 DD 32 46
   1E3F DD 34 46 DC 33 46   653         .byte   0xDD,0x34,0x46, 0xDC,0x33,0x46, 0xDB,0x32,0x46, 0xDB,0x35,0x46
        DB 32 46 DB 35 46
   1E4B DA 33 46 D9 32 46   654         .byte   0xDA,0x33,0x46, 0xD9,0x32,0x46, 0xD1,0x32,0x42, 0xC6,0x33,0x47
        D1 32 42 C6 33 47
   1E57 C6 33 43 C5 32 47   655         .byte   0xC6,0x33,0x43, 0xC5,0x32,0x47, 0xC3,0x34,0x46, 0xC2,0x33,0x47
        C3 34 46 C2 33 47
   1E63 C1 32 47 C0 35 46   656         .byte   0xC1,0x32,0x47, 0xC0,0x35,0x46, 0xB9,0x34,0x46, 0xB9,0x32,0x43
        B9 34 46 B9 32 43
   1E6F B7 35 46 B7 33 42   657         .byte   0xB7,0x35,0x46, 0xB7,0x33,0x42, 0xB3,0x33,0x46, 0xB2,0x32,0x46
        B3 33 46 B2 32 46
   1E7B A8 32 42 9D 33 47   658         .byte   0xA8,0x32,0x42, 0x9D,0x33,0x47, 0x9C,0x32,0x47, 0x9B,0x33,0x47
        9C 32 47 9B 33 47
   1E87 9A 32 47 9A 34 46   659         .byte   0x9A,0x32,0x47, 0x9A,0x34,0x46, 0x99,0x33,0x47, 0x99,0x33,0x43
        99 33 47 99 33 43
   1E93 99 35 46 98 32 47   660         .byte   0x99,0x35,0x46, 0x98,0x32,0x47, 0x97,0x33,0x47, 0x94,0x32,0x47
        97 33 47 94 32 47
   1E9F 93 33 47 92 32 47   661         .byte   0x93,0x33,0x47, 0x92,0x32,0x47, 0x91,0x33,0x47, 0x90,0x32,0x47
        91 33 47 90 32 47
   1EAB 87 33 42 86 32 43   662         .byte   0x87,0x33,0x42, 0x86,0x32,0x43, 0x7D,0x33,0x46, 0x7C,0x32,0x46
        7D 33 46 7C 32 46
   1EB7 77 32 42 77 34 46   663         .byte   0x77,0x32,0x42, 0x77,0x34,0x46, 0x75,0x32,0x43, 0x75,0x35,0x46
        75 32 43 75 35 46
   1EC3 6A 33 46 69 32 46   664         .byte   0x6A,0x33,0x46, 0x69,0x32,0x46, 0x67,0x33,0x46, 0x66,0x32,0x46
        67 33 46 66 32 46
   1ECF 66 32 43 65 34 46   665         .byte   0x66,0x32,0x43, 0x65,0x34,0x46, 0x62,0x35,0x46, 0x62,0x33,0x42
        62 35 46 62 33 42
   1EDB 56 33 46 55 32 46   666         .byte   0x56,0x33,0x46, 0x55,0x32,0x46, 0x55,0x32,0x42, 0x54,0x33,0x46
        55 32 42 54 33 46
   1EE7 53 32 46 52 33 46   667         .byte   0x53,0x32,0x46, 0x52,0x33,0x46, 0x51,0x32,0x46, 0xFE,0xFE,0xFE
        51 32 46 FE FE FE
                            668 
   1EF3                     669 X1EF3:
   1EF3 50 33 46 4F 32 46   670         .byte   0x50,0x33,0x46, 0x4F,0x32,0x46, 0x4E,0x33,0x46, 0x4E,0x33,0x42
        4E 33 46 4E 33 42
   1EFF 4D 32 46 4C 33 46   671         .byte   0x4D,0x32,0x46, 0x4C,0x33,0x46, 0x4B,0x32,0x46, 0x40,0x34,0x46
        4B 32 46 40 34 46
   1F0B 3E 35 46 3C 33 47   672         .byte   0x3E,0x35,0x46, 0x3C,0x33,0x47, 0x3B,0x32,0x47, 0x3A,0x33,0x47
        3B 32 47 3A 33 47
   1F17 39 32 47 32 32 42   673         .byte   0x39,0x32,0x47, 0x32,0x32,0x42, 0x29,0x34,0x46, 0x28,0x32,0x47
        29 34 46 28 32 47
   1F23 27 35 46 26 33 43   674         .byte   0x27,0x35,0x46, 0x26,0x33,0x43, 0x23,0x33,0x47, 0x22,0x32,0x47
        23 33 47 22 32 47
   1F2F 1E 33 42 1D 32 43   675         .byte   0x1E,0x33,0x42, 0x1D,0x32,0x43, 0x1B,0x33,0x47, 0x1A,0x32,0x47
        1B 33 47 1A 32 47
   1F3B 19 33 47 18 32 47   676         .byte   0x19,0x33,0x47, 0x18,0x32,0x47, 0x17,0x34,0x46, 0x17,0x33,0x47
        17 34 46 17 33 47
   1F47 17 32 42 16 32 47   677         .byte   0x17,0x32,0x42, 0x16,0x32,0x47, 0x15,0x35,0x46, 0x15,0x33,0x43
        15 35 46 15 33 43
   1F53 08 32 43 03 33 46   678         .byte   0x08,0x32,0x43, 0x03,0x33,0x46, 0x02,0x32,0x46, 0x02,0x34,0x46
        02 32 46 02 34 46
   1F5F FF FF FF FF FF FF   679         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1F6B FF FF FF FF FF FF   680         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1F77 FF FF FF FF FF FF   681         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1F83 FF FF FF FF FF FF   682         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1F8F FF FF FF FF FF FF   683         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1F9B FF FF FF FF FF FF   684         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1FA7 FF FF FF FF FF FF   685         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1FB3 FF FF FF FF FF FF   686         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1FBF FF FF FF FF FF FF   687         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1FCB FF FF FF FF FF FF   688         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1FD7 FF FF FF FF FF FF   689         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF
        FF FF FF FF FF FF
   1FE3 FF FF FF FF FF FF   690         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF 
        FF FF FF FF FF FF
   1FEF FF FF FF FF FF FF   691         .byte   0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF,0xFF, 0xFF,0xFF
        FF FF FF FF FF
                            692 
   1FFA                     693         .org    0x1FFA
                            694         ;
                            695         ; vectors
                            696         ;
   1FFA                     697 NMIVEC:
   1FFA FF FF               698         .dw     0xFFFF
   1FFC                     699 RESETVEC:
   1FFC 00 1A               700         .dw     RESET
   1FFE                     701 IRQVEC:
   1FFE FF FF               702         .dw     0xFFFF
