                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       The Beagles/King Program
                              7 ;       Version Unknown
                              8 ;
                              9 ;       Runs every 8 minutes or on PROG button press / coin mech
                             10 ;       AGC mic logic included
                             11 ;       Not designed to use Audio board 0033
                             12 ;
                             13 ;       This image was recovered from a 2708 with an orange label
                             14 ;
                             15 
                     0050    16 RAM_50  = 0x0050    ; decremented every 1ms
                     0051    17 RAM_51  = 0x0051    ; decremented every 1ms
                     0052    18 RAM_52  = 0x0052    ; decremented every 1ms
                     0053    19 RAM_53  = 0x0053    ; decremented every 1ms, resets to 100
                     0054    20 RAM_54  = 0x0054    ; decremented every 0.1s
                     0055    21 RAM_55  = 0x0055    ; decremented every 0.1s, resets to 100
                     0056    22 RAM_56  = 0x0056    ; decremented every 10s
                     0057    23 RAM_57  = 0x0057    ; temp timer storage
                     0058    24 RAM_58  = 0x0058    ; zero crossing counter
                     0059    25 RAM_59  = 0x0059    ; track counter
                     005A    26 RAM_5A  = 0x005A    ; number of PROG button presses
                     005B    27 RAM_5B  = 0x005B    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
                     005C    28 RAM_5C  = 0x005C    ; storage for incoming serial byte (& 0x7F)
                     005D    29 RAM_5D  = 0x005D    ; bitmask for solenoids
                     005E    30 RAM_5E  = 0x005E    ; current channel serial byte
                     005F    31 RAM_5F  = 0x005F    ; temp timer storage
                     0060    32 RAM_60  = 0x0060    ; agc mic level
                     0061    33 RAM_61  = 0x0061    ; agc mic level accumulator
                     0062    34 RAM_62  = 0x0062    ; agc mic sample counter
                     0063    35 RAM_63  = 0x0063    ; agc calculated gain value
                     0064    36 RAM_64  = 0x0064    ; current channel port address
                             37 
                             38         .include "../include/ptt6502.def"
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
                             39 
   1C00                      40         .org    0x1C00
                             41 ;
   1C00                      42 RESET:
   1C00 D8            [ 2]   43         cld                                             ; No decimal mode
   1C01 78            [ 2]   44         sei                                             ; Interrupts are not used
   1C02 A2 F0         [ 2]   45         ldx     #0xF0                                   ; Stack is at 0x01F0
   1C04 9A            [ 2]   46         txs
   1C05 A9 00         [ 2]   47         lda     #0x00                                   ; Clear RAM
   1C07 A2 10         [ 2]   48         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1C09                      49 ZERORAM:
   1C09 95 00         [ 4]   50         sta     RAM_start,x
   1C0B E8            [ 2]   51         inx
   1C0C E0 80         [ 2]   52         cpx     #0x80
   1C0E D0 F9         [ 4]   53         bne     ZERORAM
   1C10 A9 00         [ 2]   54         lda     #0x00                                   ; Initialize these registers to 0x00
   1C12 8D 01 03      [ 4]   55         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   1C15 8D 00 03      [ 4]   56         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1C18 8D 81 03      [ 4]   57         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1C1B 8D 80 03      [ 4]   58         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1C1E 8D 83 03      [ 4]   59         sta     audio_control_reg_b                     ; Clear audio control B
   1C21 8D 05 02      [ 4]   60         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   1C24 8D 03 03      [ 4]   61         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1C27 8D 01 02      [ 4]   62         sta     U18_DDRA                                ; Buttons are inputs
   1C2A A9 02         [ 2]   63         lda     #0x02
   1C2C 8D 81 02      [ 4]   64         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   1C2F A9 FF         [ 2]   65         lda     #0xFF
   1C31 8D 82 03      [ 4]   66         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1C34 8D 03 02      [ 4]   67         sta     U18_DDRB                                ; Button lights are outputs
   1C37 8D 83 02      [ 4]   68         sta     U19_DDRB                                ; CPU card lights are outputs
   1C3A A9 FC         [ 2]   69         lda     #0xFC
   1C3C 8D 02 03      [ 4]   70         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   1C3F A9 2E         [ 2]   71         lda     #0x2E
   1C41 8D 01 03      [ 4]   72         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1C44 8D 03 03      [ 4]   73         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1C47 8D 83 03      [ 4]   74         sta     audio_control_reg_b                     ; audio CB2 is Write strobe (Unused)
   1C4A 8D 81 03      [ 4]   75         sta     audio_control_reg_a                     ; audio CA2 is Read strobe (Unused)
   1C4D A9 64         [ 2]   76         lda     #0x64
   1C4F 85 53         [ 3]   77         sta     RAM_53                                  ; 100 - init 1 msec master counter
   1C51 A9 30         [ 2]   78         lda     #0x30
   1C53 85 56         [ 3]   79         sta     RAM_56                                  ; Init an 8 minute timer
   1C55 A9 64         [ 2]   80         lda     #0x64
   1C57 85 55         [ 3]   81         sta     RAM_55                                  ; 100 - init 0.1 sec master counter
   1C59 A9 10         [ 2]   82         lda     #0x10                                   ; 16
   1C5B 85 63         [ 3]   83         sta     RAM_63                                  ; Set initial AGC gain value
   1C5D A9 10         [ 2]   84         lda     #TAPEMODE_STOP
   1C5F 20 55 1D      [ 6]   85         jsr     TAPECMD                                 ; STOP tape
   1C62 A9 28         [ 2]   86         lda     #0x28                                   ; this will count 4 seconds
   1C64 85 54         [ 3]   87         sta     RAM_54
   1C66 A9 64         [ 2]   88         lda     #0x64                                   ; reset master timer
   1C68 85 53         [ 3]   89         sta     RAM_53
   1C6A                      90 $1:
   1C6A 20 6B 1E      [ 6]   91         jsr     TUPDATE                                 ; do not much for 4 seconds
   1C6D A5 54         [ 3]   92         lda     RAM_54
   1C6F D0 F9         [ 4]   93         bne     $1
   1C71                      94 REWIND:
   1C71 A9 40         [ 2]   95         lda     #TAPEMODE_REWIND
   1C73 20 69 1D      [ 6]   96         jsr     TAPESET                                 ; REWIND tape
   1C76                      97 $22:
   1C76 A9 00         [ 2]   98         lda     #0x00
   1C78 85 58         [ 3]   99         sta     RAM_58                                  ; counter to zero
                            100 ; Look for the long tone at the beginning of tape
   1C7A                     101 $2:
   1C7A 20 6B 1E      [ 6]  102         jsr     TUPDATE                                 ; housekeeping
   1C7D AD 03 03      [ 4]  103         lda     transport_control_reg_b                 ; loop until we see tone marking beginning of tape
   1C80 10 F8         [ 4]  104         bpl     $2
   1C82 A9 06         [ 2]  105         lda     #0x06
   1C84 85 54         [ 3]  106         sta     RAM_54                                  ; set 0.6 second timer
   1C86 A9 64         [ 2]  107         lda     #0x64                                   ; 100 rising edge transitions
   1C88 85 53         [ 3]  108         sta     RAM_53
   1C8A                     109 $3:
   1C8A 20 6B 1E      [ 6]  110         jsr     TUPDATE                                 ; housekeeping
   1C8D AD 03 03      [ 4]  111         lda     transport_control_reg_b                 ; loop until 100 transport CB1 rising edges or 0.6 secs expired
   1C90 10 0B         [ 4]  112         bpl     $4                                      ; (> 83.333 Hz for 100 zero crossings)
   1C92 E6 58         [ 5]  113         inc     RAM_58                                  ; count transitions
   1C94 AD 02 03      [ 4]  114         lda     transport_periph$ddr_reg_b
   1C97 A5 58         [ 3]  115         lda     RAM_58
   1C99 C9 64         [ 2]  116         cmp     #0x64
   1C9B B0 0B         [ 4]  117         bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
   1C9D                     118 $4:
   1C9D A5 54         [ 3]  119         lda     RAM_54
   1C9F D0 E9         [ 4]  120         bne     $3
   1CA1 4C 76 1C      [ 3]  121         jmp     $22
                            122 ; unused instructions start
   1CA4 C9 60         [ 2]  123         cmp     #0x60
   1CA6 90 00         [ 4]  124         bcc     FINDTRK
                            125 ; unused instructions end
                            126 ;
   1CA8                     127 FINDTRK:
   1CA8 A9 20         [ 2]  128         lda     #TAPEMODE_FFWD
   1CAA 20 69 1D      [ 6]  129         jsr     TAPESET                                 ; FFWD tape
   1CAD A9 19         [ 2]  130         lda     #0x19
   1CAF 85 54         [ 3]  131         sta     RAM_54                                  ; 2.5 secs
   1CB1 A9 64         [ 2]  132         lda     #0x64
   1CB3 85 53         [ 3]  133         sta     RAM_53
   1CB5                     134 $5:
   1CB5 20 6B 1E      [ 6]  135         jsr     TUPDATE                                 ; do housekeeping stuff
   1CB8 A5 54         [ 3]  136         lda     RAM_54
   1CBA D0 F9         [ 4]  137         bne     $5
   1CBC A9 00         [ 2]  138         lda     #0x00
   1CBE 85 59         [ 3]  139         sta     RAM_59
   1CC0 20 78 1D      [ 6]  140         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CC3 E6 59         [ 5]  141         inc     RAM_59
   1CC5 A9 10         [ 2]  142         lda     #TAPEMODE_STOP
   1CC7 20 55 1D      [ 6]  143         jsr     TAPECMD                                 ; STOP tape
   1CCA A9 80         [ 2]  144         lda     #TAPEMODE_PLAY
   1CCC 20 55 1D      [ 6]  145         jsr     TAPECMD                                 ; PLAY tape
   1CCF 20 A6 1D      [ 6]  146         jsr     WAITCD                                  ; wait for carrier
   1CD2 A9 10         [ 2]  147         lda     #TAPEMODE_STOP
   1CD4 20 55 1D      [ 6]  148         jsr     TAPECMD                                 ; STOP Tape
   1CD7 20 32 1D      [ 6]  149         jsr     INITBRDS                                ; init the boards
   1CDA                     150 WAITPLAY:
   1CDA 20 6B 1E      [ 6]  151         jsr     TUPDATE                                 ; do housekeeping stuff
   1CDD 20 0C 1F      [ 6]  152         jsr     AGCUPD                                  ; do AGC Mic Logic
   1CE0 A5 5A         [ 3]  153         lda     RAM_5A                                  ; wait until we are triggered
   1CE2 D0 10         [ 4]  154         bne     STARTPLAY                                   ; then jump
   1CE4 A9 02         [ 2]  155         lda     #0x02                                   ; else
   1CE6 8D 80 02      [ 4]  156         sta     U19_PORTA                               ; turn on RESET button light
   1CE9 A9 00         [ 2]  157         lda     #0x00
   1CEB 8D 02 02      [ 4]  158         sta     U18_PORTB                               ; turn on all other button lights
   1CEE A5 56         [ 3]  159         lda     RAM_56                                  ; has the 8 minute timer run out?
   1CF0 D0 E8         [ 4]  160         bne     WAITPLAY                                ; no, keep looping
   1CF2 E6 5A         [ 5]  161         inc     RAM_5A                                  ; yes, simulate a PROG button press
                            162 ;   we have been started!
   1CF4                     163 STARTPLAY:
   1CF4 20 32 1D      [ 6]  164         jsr     INITBRDS                                ; init the boards
   1CF7 A9 00         [ 2]  165         lda     #0x00
   1CF9 8D 80 02      [ 4]  166         sta     U19_PORTA                               ; turn off RESET button light
   1CFC A9 80         [ 2]  167         lda     #0x80
   1CFE 8D 02 02      [ 4]  168         sta     U18_PORTB                               ; turn off all but PROG light
   1D01 A9 80         [ 2]  169         lda     #TAPEMODE_PLAY
   1D03 20 55 1D      [ 6]  170         jsr     TAPECMD                                 ; PLAY tape
   1D06 20 A6 1D      [ 6]  171         jsr     WAITCD                                  ; wait for carrier
   1D09 C6 5A         [ 5]  172         dec     RAM_5A                                  ; no longer triggered
   1D0B 20 CC 1D      [ 6]  173         jsr     PLAYTRK                                 ; play a track!
   1D0E 20 32 1D      [ 6]  174         jsr     INITBRDS                                ; init the boards
   1D11 A9 30         [ 2]  175         lda     #0x30
   1D13 85 56         [ 3]  176         sta     RAM_56                                  ; set an 8 minute timer
   1D15 A9 64         [ 2]  177         lda     #0x64
   1D17 85 55         [ 3]  178         sta     RAM_55
   1D19 E6 59         [ 5]  179         inc     RAM_59                                  ; track counter
   1D1B A5 59         [ 3]  180         lda     RAM_59
   1D1D C9 1A         [ 2]  181         cmp     #0x1A                                   ; 26?
   1D1F 90 03         [ 4]  182         bcc     NEXTTRK
   1D21 4C 71 1C      [ 3]  183         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            184 ; go to next track
   1D24                     185 NEXTTRK:
   1D24 20 A6 1D      [ 6]  186         jsr     WAITCD                                  ; wait for carrier
   1D27 A9 10         [ 2]  187         lda     #TAPEMODE_STOP
   1D29 20 55 1D      [ 6]  188         jsr     TAPECMD                                 ; STOP tape
   1D2C 20 C3 1E      [ 6]  189         jsr     AGCMICRD                                ; Read the AGC mic level
   1D2F 4C DA 1C      [ 3]  190         jmp     WAITPLAY
                            191 ;
                            192 ;       Init boards
                            193 ;
   1D32                     194 INITBRDS:
   1D32 A2 00         [ 2]  195         ldx     #0x00
   1D34                     196 NEXTBRD:
   1D34 A9 30         [ 2]  197         lda     #0x30
   1D36 95 81         [ 4]  198         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1D38 95 83         [ 4]  199         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1D3A A9 FF         [ 2]  200         lda     #0xFF
   1D3C 95 80         [ 4]  201         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1D3E 95 82         [ 4]  202         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1D40 A9 34         [ 2]  203         lda     #0x34
   1D42 95 81         [ 4]  204         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1D44 95 83         [ 4]  205         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1D46 A9 00         [ 2]  206         lda     #0x00
   1D48 95 80         [ 4]  207         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1D4A 95 82         [ 4]  208         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1D4C E8            [ 2]  209         inx
   1D4D E8            [ 2]  210         inx
   1D4E E8            [ 2]  211         inx
   1D4F E8            [ 2]  212         inx
   1D50 E0 20         [ 2]  213         cpx     #0x20                                   ; do for boards 1-8
   1D52 90 E0         [ 4]  214         bcc     NEXTBRD
   1D54 60            [ 6]  215         rts
                            216 ;
                            217 ;       Send Transport command for 0.255 sec
                            218 ;       and then unassert it
                            219 ;       (Used for STOP and PLAY)
                            220 ;
   1D55                     221 TAPECMD:
   1D55 8D 02 03      [ 4]  222         sta     transport_periph$ddr_reg_b              ; enable output line
   1D58 A9 FF         [ 2]  223         lda     #0xFF
   1D5A 85 50         [ 3]  224         sta     RAM_50
   1D5C                     225 $6:
   1D5C 20 6B 1E      [ 6]  226         jsr     TUPDATE                                 ; check for PROG button push
   1D5F A5 50         [ 3]  227         lda     RAM_50
   1D61 D0 F9         [ 4]  228         bne     $6
   1D63 A9 00         [ 2]  229         lda     #0x00
   1D65 8D 02 03      [ 4]  230         sta     transport_periph$ddr_reg_b
   1D68 60            [ 6]  231         rts
                            232 ;
                            233 ;       Send Transport command for 0.250 sec
                            234 ;       and keep it asserted on return
                            235 ;       (Used for Rewind and FFwd)
                            236 ;
   1D69                     237 TAPESET:
   1D69 8D 02 03      [ 4]  238         sta     transport_periph$ddr_reg_b
   1D6C A9 FA         [ 2]  239         lda     #0xFA
   1D6E 85 50         [ 3]  240         sta     RAM_50
   1D70                     241 $7:
   1D70 20 6B 1E      [ 6]  242         jsr     TUPDATE
   1D73 A5 50         [ 3]  243         lda     RAM_50
   1D75 D0 F9         [ 4]  244         bne     $7
   1D77 60            [ 6]  245         rts
                            246 ;
                            247 ;       Wait for tone during Fast Forward, signaling beginning of track
                            248 ;       (64 Hz for 250ms, or higher for proportionally less)
                            249 ;
   1D78                     250 WAITTONE:
   1D78 A9 00         [ 2]  251         lda     #0x00
   1D7A 85 58         [ 3]  252         sta     RAM_58
                            253 ; wait for tone start
   1D7C                     254 $8:
   1D7C 20 6B 1E      [ 6]  255         jsr     TUPDATE                                 ; housekeeping
   1D7F AD 03 03      [ 4]  256         lda     transport_control_reg_b
   1D82 10 F8         [ 4]  257         bpl     $8
   1D84 A9 FA         [ 2]  258         lda     #0xFA                                   ; 250ms
   1D86 85 50         [ 3]  259         sta     RAM_50
   1D88                     260 $29:
   1D88 20 6B 1E      [ 6]  261         jsr     TUPDATE                                 ; housekeeping
   1D8B AD 03 03      [ 4]  262         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1D8E 10 0B         [ 4]  263         bpl     $28                                     ; if not, jump ahead
   1D90 E6 58         [ 5]  264         inc     RAM_58                                  ; count edges
   1D92 AD 02 03      [ 4]  265         lda     transport_periph$ddr_reg_b
   1D95 A5 58         [ 3]  266         lda     RAM_58
   1D97 C9 60         [ 2]  267         cmp     #0x60                                   ; 96 edges?
   1D99 B0 0A         [ 4]  268         bcs     $10                                     ; exit
   1D9B                     269 $28:
   1D9B A5 50         [ 3]  270         lda     RAM_50                                  ; 250ms?
   1D9D D0 E9         [ 4]  271         bne     $29
   1D9F A5 58         [ 3]  272         lda     RAM_58
   1DA1 C9 20         [ 2]  273         cmp     #0x20                                   ; 32 edges?
   1DA3 90 D3         [ 4]  274         bcc     WAITTONE                                ; no, loop
   1DA5                     275 $10:
   1DA5 60            [ 6]  276         rts
                            277 ;
                            278 ;       Wait for carrier / start of data
                            279 ;
                            280 
                            281 ; Wait for 250ms
   1DA6                     282 WAITCD:
   1DA6 A9 FA         [ 2]  283         lda     #0xFA
   1DA8 85 50         [ 3]  284         sta     RAM_50                                  ; 250 msec
   1DAA                     285 $11:
   1DAA 20 6B 1E      [ 6]  286         jsr     TUPDATE                                 ; housekeeping
   1DAD A5 50         [ 3]  287         lda     RAM_50
   1DAF D0 F9         [ 4]  288         bne     $11
                            289 
                            290 ; Wait for 160ms of consecutive zero crossings
   1DB1                     291 $12:
   1DB1 20 6B 1E      [ 6]  292         jsr     TUPDATE                                 ; housekeeping
   1DB4 AD 02 03      [ 4]  293         lda     transport_periph$ddr_reg_b
   1DB7 6A            [ 2]  294         ror     a
   1DB8 90 F7         [ 4]  295         bcc     $12
   1DBA A9 A0         [ 2]  296         lda     #0xA0                                   ; 160 msec
   1DBC 85 50         [ 3]  297         sta     RAM_50
   1DBE                     298 $13:
   1DBE 20 6B 1E      [ 6]  299         jsr     TUPDATE                                 ; housekeeping
   1DC1 AD 02 03      [ 4]  300         lda     transport_periph$ddr_reg_b
   1DC4 6A            [ 2]  301         ror     a
   1DC5 90 EA         [ 4]  302         bcc     $12
   1DC7 A5 50         [ 3]  303         lda     RAM_50
   1DC9 D0 F3         [ 4]  304         bne     $13
   1DCB 60            [ 6]  305         rts
                            306 ;
                            307 ;       Play a track
                            308 ;
   1DCC                     309 PLAYTRK:
   1DCC AD 00 03      [ 4]  310         lda     transport_periph$ddr_reg_a
   1DCF A9 40         [ 2]  311         lda     #0x40
   1DD1 85 82         [ 3]  312         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1DD3 85 86         [ 3]  313         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1DD5 85 8A         [ 3]  314         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1DD7 85 8E         [ 3]  315         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   1DD9                     316 $14:
   1DD9 AD 02 03      [ 4]  317         lda     transport_periph$ddr_reg_b
   1DDC 4A            [ 2]  318         lsr     a
   1DDD 90 11         [ 4]  319         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   1DDF 20 0C 1F      [ 6]  320         jsr     AGCUPD                                  ; do AGC Mic Logic
   1DE2 20 6B 1E      [ 6]  321         jsr     TUPDATE                                 ; housekeeping
   1DE5 AD 01 03      [ 4]  322         lda     transport_control_reg_a                 ; Did we get a byte?
   1DE8 10 EF         [ 4]  323         bpl     $14                                     ; No, loop
   1DEA 20 02 1E      [ 6]  324         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   1DED 4C D9 1D      [ 3]  325         jmp     $14
                            326 
                            327 ;       Lost carrier - wait 100 msec for more data before giving up
   1DF0                     328 LOSTCD:
   1DF0 A9 64         [ 2]  329         lda     #0x64                                   ; 100 msec
   1DF2 85 50         [ 3]  330         sta     RAM_50
   1DF4                     331 $15:
   1DF4 20 6B 1E      [ 6]  332         jsr     TUPDATE
   1DF7 AD 02 03      [ 4]  333         lda     transport_periph$ddr_reg_b
   1DFA 4A            [ 2]  334         lsr     a
   1DFB B0 CF         [ 4]  335         bcs     PLAYTRK                                 ; carrier
   1DFD A5 50         [ 3]  336         lda     RAM_50
   1DFF D0 F3         [ 4]  337         bne     $15
   1E01 60            [ 6]  338         rts
                            339 ;
                            340 ; Protocol handler
                            341 ;
   1E02                     342 PROTOHAND:
   1E02 AD 00 03      [ 4]  343         lda     transport_periph$ddr_reg_a
   1E05 29 7F         [ 2]  344         and     #0x7F                                   ; insure data is ASCII
   1E07 85 5C         [ 3]  345         sta     RAM_5C                                  ; store it here
   1E09 29 7E         [ 2]  346         and     #0x7E                                   ; ignore bottom bit
   1E0B C9 22         [ 2]  347         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1E0D F0 3A         [ 4]  348         beq     PROCCHNL                                ; if so, process as channel
   1E0F C9 32         [ 2]  349         cmp     #0x32                                   ; is it < 0x32 ?
   1E11 90 4F         [ 4]  350         bcc     $18                                     ; ignore it
   1E13 C9 3A         [ 2]  351         cmp     #0x3A                                   ; is it < 0x3A
   1E15 90 32         [ 4]  352         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   1E17 A5 5C         [ 3]  353         lda     RAM_5C
   1E19 C9 41         [ 2]  354         cmp     #0x41                                   ; is it < 0x41?
   1E1B 90 45         [ 4]  355         bcc     $18                                     ; ignore it
   1E1D C9 51         [ 2]  356         cmp     #0x51                                   ; is it >= 0x51?
   1E1F B0 41         [ 4]  357         bcs     $18                                     ; ignore it
   1E21 A6 64         [ 3]  358         ldx     RAM_64                                  ; X = current board address
   1E23 38            [ 2]  359         sec                                             ; (it's 0x41 to 0x50)
   1E24 E9 41         [ 2]  360         sbc     #0x41                                   ; subtract 0x41
   1E26 C9 08         [ 2]  361         cmp     #0x08
   1E28 90 02         [ 4]  362         bcc     $16                                     ; process as command
   1E2A E8            [ 2]  363         inx
   1E2B E8            [ 2]  364         inx
   1E2C                     365 $16:
   1E2C 29 07         [ 2]  366         and     #0x07                                   ; lookup bitmask in A
   1E2E A8            [ 2]  367         tay
   1E2F B9 63 1E      [ 5]  368         lda     MASKTBL,y
   1E32 85 5D         [ 3]  369         sta     RAM_5D                                  ; store mask in RAM_5D
   1E34 A5 5E         [ 3]  370         lda     RAM_5E
   1E36 4A            [ 2]  371         lsr     a                                       ; get on/off in carry
   1E37 B0 09         [ 4]  372         bcs     $17                                     ; if on, jump
   1E39 A5 5D         [ 3]  373         lda     RAM_5D
   1E3B 49 FF         [ 2]  374         eor     #0xFF
   1E3D 35 00         [ 4]  375         and     RAM_start,x
   1E3F 95 00         [ 4]  376         sta     RAM_start,x                             ; turn off solenoid
   1E41 60            [ 6]  377         rts
                            378 ;
   1E42                     379 $17:
   1E42 A5 5D         [ 3]  380         lda     RAM_5D
   1E44 15 00         [ 4]  381         ora     RAM_start,x
   1E46 95 00         [ 4]  382         sta     RAM_start,x                             ; turn on solenoid
   1E48 60            [ 6]  383         rts
                            384 ;
   1E49                     385 PROCCHNL:
   1E49 A5 5C         [ 3]  386         lda     RAM_5C                                  ; put channel byte in RAM_5E
   1E4B 85 5E         [ 3]  387         sta     RAM_5E
   1E4D 29 7E         [ 2]  388         and     #0x7E
   1E4F C9 22         [ 2]  389         cmp     #0x22
   1E51 D0 05         [ 4]  390         bne     CONVCHNL
   1E53 A9 98         [ 2]  391         lda     #0x98                                   ; process 0x22 or 0x23
   1E55 85 64         [ 3]  392         sta     RAM_64                                  ; set this to 0x98 - board 7
   1E57 60            [ 6]  393         rts
                            394 ;
   1E58                     395 CONVCHNL:
   1E58 38            [ 2]  396         sec                                             ; process channel
   1E59 E9 32         [ 2]  397         sbc     #0x32
   1E5B 0A            [ 2]  398         asl     a
   1E5C 18            [ 2]  399         clc
   1E5D 69 80         [ 2]  400         adc     #0x80
   1E5F 85 64         [ 3]  401         sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
   1E61 60            [ 6]  402         rts
   1E62                     403 $18:
   1E62 60            [ 6]  404         rts
                            405 ;
                            406 ; bit mask table
                            407 ;
   1E63                     408 MASKTBL:
   1E63 01 02 04 08         409         .db     0x01, 0x02, 0x04, 0x08
   1E67 10 20 40 80         410         .db     0x10, 0x20, 0x40, 0x80
                            411 ;
                            412 ;       Housekeeping routine
                            413 ;       RAM_50 used on entry
                            414 ;
   1E6B                     415 TUPDATE:
   1E6B AD 05 02      [ 4]  416         lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
   1E6E 85 5F         [ 3]  417         sta     RAM_5F                                  ; store this state in 5F
   1E70 F0 50         [ 4]  418         beq     TEXIT                                   ; No flags set, return
   1E72 A5 5B         [ 3]  419         lda     RAM_5B                                  ; Are we already running?
   1E74 30 0E         [ 4]  420         bmi     $19                                     ; yes, jump ahead
   1E76 A5 5F         [ 3]  421         lda     RAM_5F                                  ; else check flags
   1E78 29 40         [ 2]  422         and     #0x40                                   ; PROG pushed?
   1E7A F0 16         [ 4]  423         beq     ADJTMR                                  ; if not, go to adjust timer
   1E7C A9 80         [ 2]  424         lda     #0x80
   1E7E 85 5B         [ 3]  425         sta     RAM_5B                                  ; PROG Button pushed
   1E80 A9 FA         [ 2]  426         lda     #0xFA
   1E82 85 51         [ 3]  427         sta     RAM_51
   1E84                     428 $19:
   1E84 A5 51         [ 3]  429         lda     RAM_51                                  ; for 250ms?
   1E86 D0 06         [ 4]  430         bne     $20                                     ; no, exit
   1E88 A9 00         [ 2]  431         lda     #0x00
   1E8A 85 5B         [ 3]  432         sta     RAM_5B                                  ; yes, reset PROG button state
   1E8C E6 5A         [ 5]  433         inc     RAM_5A                                  ; and mark as running
   1E8E                     434 $20:
   1E8E A5 5F         [ 3]  435         lda     RAM_5F                                  ; check timer irq bit
   1E90 10 30         [ 4]  436         bpl     TEXIT                                   ; if timer not expired, return
                            437 ; Adjust Timer routine
   1E92                     438 ADJTMR:
   1E92 AD 04 02      [ 4]  439         lda     U18_timer                               ; read timer in U18
   1E95 49 FF         [ 2]  440         eor     #0xFF                                   ; flip the bits
   1E97 4A            [ 2]  441         lsr     a                                       ; keep the top 5 bits
   1E98 4A            [ 2]  442         lsr     a
   1E99 4A            [ 2]  443         lsr     a
   1E9A 85 57         [ 3]  444         sta     RAM_57                                  ; store them
   1E9C 90 02         [ 4]  445         bcc     $21                                     ; bcc on timer bit D2
   1E9E E6 57         [ 5]  446         inc     RAM_57                                  ; round up?
                            447                                                         ; now RAM_57 has the number of 8us 
                            448                                                         ;   intervals since timer expired
   1EA0                     449 $21:
   1EA0 A9 7A         [ 2]  450         lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
   1EA2 38            [ 2]  451         sec                                             ; with programming delays, this is 1 msec
   1EA3 E5 57         [ 3]  452         sbc     RAM_57
   1EA5 8D 15 02      [ 4]  453         sta     U18_timer_8T_DI                         ; set timer
   1EA8 C6 50         [ 5]  454         dec     RAM_50                                  ; decrement these timers every timer reset (1ms)
   1EAA C6 51         [ 5]  455         dec     RAM_51
   1EAC C6 52         [ 5]  456         dec     RAM_52
   1EAE C6 53         [ 5]  457         dec     RAM_53
   1EB0 D0 10         [ 4]  458         bne     TEXIT                                   ; if timer RAM_53 expires, then wrap to 100
   1EB2 A9 64         [ 2]  459         lda     #0x64                                   ; 100
   1EB4 85 53         [ 3]  460         sta     RAM_53
   1EB6 C6 54         [ 5]  461         dec     RAM_54
   1EB8 C6 55         [ 5]  462         dec     RAM_55
   1EBA D0 06         [ 4]  463         bne     TEXIT                                   ; if timer RAM_55 expires, then wrap to 100
   1EBC A9 64         [ 2]  464         lda     #0x64                                   ; 100
   1EBE 85 55         [ 3]  465         sta     RAM_55
   1EC0 C6 56         [ 5]  466         dec     RAM_56
   1EC2                     467 TEXIT:
   1EC2 60            [ 6]  468         rts
                            469 ;
                            470 ;       Read the AGC mic level
                            471 ;       Take the average of 8 samples, and put it into RAM_60 (range is 0 to 8)
                            472 ;
   1EC3                     473 AGCMICRD:
   1EC3 A9 00         [ 2]  474         lda     #0x00
   1EC5 85 61         [ 3]  475         sta     RAM_61                                  ; init final agc value
   1EC7 85 62         [ 3]  476         sta     RAM_62                                  ; init agc sample counter
   1EC9 A9 0A         [ 2]  477         lda     #0x0A
   1ECB 85 54         [ 3]  478         sta     RAM_54                                  ; Start a 1 second timer
   1ECD A9 64         [ 2]  479         lda     #0x64
   1ECF 85 53         [ 3]  480         sta     RAM_53
   1ED1                     481 $23:
   1ED1 20 6B 1E      [ 6]  482         jsr     TUPDATE                                 ; housekeeping
   1ED4 A5 54         [ 3]  483         lda     RAM_54
   1ED6 D0 F9         [ 4]  484         bne     $23                                     ; if 1 sec, do housekeeping
   1ED8 A9 0A         [ 2]  485         lda     #0x0A
   1EDA 85 54         [ 3]  486         sta     RAM_54
   1EDC A9 64         [ 2]  487         lda     #0x64
   1EDE 85 53         [ 3]  488         sta     RAM_53                                  ; reset timer
   1EE0 A5 62         [ 3]  489         lda     RAM_62                                  
   1EE2 C9 08         [ 2]  490         cmp     #0x08                                   ; 8 samples?
   1EE4 F0 15         [ 4]  491         beq     $27                                     ; yes - jump to final calculation
   1EE6 E6 62         [ 5]  492         inc     RAM_62                                  ; increment the sample counter
   1EE8 A2 09         [ 2]  493         ldx     #0x09
   1EEA 38            [ 2]  494         sec
   1EEB AD 80 03      [ 4]  495         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1EEE                     496 $24:                                                    ; read the most significant high bit
   1EEE 2A            [ 2]  497         rol     a
   1EEF CA            [ 2]  498         dex
   1EF0 90 FC         [ 4]  499         bcc     $24
   1EF2 18            [ 2]  500         clc
   1EF3 8A            [ 2]  501         txa                                             ; 8=high bit7, 0=no high bits
   1EF4 65 61         [ 3]  502         adc     RAM_61                                  ; add it into RAM_61 (do this 8 times)
   1EF6 85 61         [ 3]  503         sta     RAM_61
   1EF8 4C D1 1E      [ 3]  504         jmp     $23
                            505 ;
   1EFB                     506 $27:
   1EFB 46 61         [ 5]  507         lsr     RAM_61                                  ; divide by 8 (average of 8 samples)
   1EFD 46 61         [ 5]  508         lsr     RAM_61
   1EFF 46 61         [ 5]  509         lsr     RAM_61
   1F01 A5 61         [ 3]  510         lda     RAM_61
   1F03 85 60         [ 3]  511         sta     RAM_60                                  ; store agc value in RAM_60
   1F05 A9 00         [ 2]  512         lda     #0x00
   1F07 85 61         [ 3]  513         sta     RAM_61                                  ; clear these 2 and return
   1F09 85 62         [ 3]  514         sta     RAM_62
   1F0B 60            [ 6]  515         rts
                            516 ;
                            517 ;        Do AGC Mic Logic
                            518 ;
   1F0C                     519 AGCUPD:
   1F0C AD 80 02      [ 4]  520         lda     U19_PORTA                               ; read AGC knob
   1F0F 49 FF         [ 2]  521         eor     #0xFF                                   ; invert the bits
   1F11 4A            [ 2]  522         lsr     a                                       ; get into lower nibble
   1F12 4A            [ 2]  523         lsr     a
   1F13 4A            [ 2]  524         lsr     a
   1F14 4A            [ 2]  525         lsr     a
   1F15 18            [ 2]  526         clc
   1F16 65 60         [ 3]  527         adc     RAM_60                                  ; add audio level to it
   1F18 AA            [ 2]  528         tax
   1F19 BD 3F 1F      [ 5]  529         lda     AGCTABLE,x                              ; and get the table value
   1F1C 85 63         [ 3]  530         sta     RAM_63                                  ; store this value in RAM_63
   1F1E A5 52         [ 3]  531         lda     RAM_52                                  ; 10ms timer expired?
   1F20 D0 16         [ 4]  532         bne     $26                                     ; no, just update CPU Leds
   1F22 A9 0A         [ 2]  533         lda     #0x0A
   1F24 85 52         [ 3]  534         sta     RAM_52                                  ; restart 10ms timer
   1F26 A5 63         [ 3]  535         lda     RAM_63                                  ; every 10ms, adjust gain by 1 if needed
   1F28 CD 82 03      [ 4]  536         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   1F2B 90 08         [ 4]  537         bcc     $25
   1F2D F0 09         [ 4]  538         beq     $26
   1F2F EE 82 03      [ 6]  539         inc     audio_periph$ddr_reg_b                  ; increase value
   1F32 4C 38 1F      [ 3]  540         jmp     $26
                            541 ;
   1F35                     542 $25:
   1F35 CE 82 03      [ 6]  543         dec     audio_periph$ddr_reg_b                  ; decrease value
   1F38                     544 $26:
   1F38 AD 82 03      [ 4]  545         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   1F3B 8D 82 02      [ 4]  546         sta     U19_PORTB
   1F3E 60            [ 6]  547         rts
                            548 ;
                            549 ;       AGC table
                            550 ;
   1F3F                     551 AGCTABLE:
   1F3F 03 04 06 08         552         .db     0x03, 0x04, 0x06, 0x08
   1F43 10 16 20 2D         553         .db     0x10, 0x16, 0x20, 0x2D
   1F47 40 5A 80 BF         554         .db     0x40, 0x5A, 0x80, 0xBF
   1F4B FF FF FF FF         555         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F4F FF                  556         .db     0xFF
                            557 ;
                            558 ; all zeros in this gap
                            559 ;
   1FFA                     560         .org    0x1FFA
                            561 ;
                            562 ; vectors
                            563 ;
   1FFA                     564 NMIVEC:
   1FFA 00 00               565         .dw     RAM_start
   1FFC                     566 RESETVEC:
   1FFC 00 1C               567         .dw     RESET
   1FFE                     568 IRQVEC:
   1FFE 00 00               569         .dw     RAM_start
