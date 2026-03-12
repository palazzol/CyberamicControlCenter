                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       The Beagles/King Program
                              7 ;       Version Unknown
                              8 ;
                              9 ;       Triggered by PROG button press / coin mech
                             10 ;       No AGC Mic Logic
                             11 ;
                             12 ;       This image was recovered from an unmarked 2708
                             13 ;
                             14 
                     0050    15 RAM_50  = 0x0050    ; decremented every 1ms
                     0051    16 RAM_51  = 0x0051    ; decremented every 1ms
                     0052    17 RAM_52  = 0x0052    ; decremented every 1ms
                     0053    18 RAM_53  = 0x0053    ; decremented every 1ms, resets to 100
                     0054    19 RAM_54  = 0x0054    ; decremented every 0.1s
                     0055    20 RAM_55  = 0x0055    ; decremented every 0.1s, resets to 100
                     0056    21 RAM_56  = 0x0056    ; decremented every 10s
                     0057    22 RAM_57  = 0x0057    ; temp timer storage
                     0058    23 RAM_58  = 0x0058    ; zero crossing counter
                     0059    24 RAM_59  = 0x0059    ; track counter
                     005A    25 RAM_5A  = 0x005A    ; number of PROG button presses
                     005B    26 RAM_5B  = 0x005B    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
                     005C    27 RAM_5C  = 0x005C    ; storage for incoming serial byte (& 0x7F)
                     005D    28 RAM_5D  = 0x005D    ; bitmask for solenoids
                     005E    29 RAM_5E  = 0x005E    ; current channel serial byte
                     005F    30 RAM_5F  = 0x005F    ; temp timer storage
                             31 
                     0064    32 RAM_64  = 0x0064    ; current channel port address
                             33 
                             34         .include "../include/ptt6502.def"
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
                             35 
   1C00                      36         .org     0x1C00
                             37 ;
   1C00                      38 RESET:
   1C00 D8            [ 2]   39         cld                                             ; No decimal mode
   1C01 78            [ 2]   40         sei                                             ; Interrupts are not used
   1C02 A2 F0         [ 2]   41         ldx     #0xF0                                   ; Stack is at 0x01F0
   1C04 9A            [ 2]   42         txs
   1C05 A9 00         [ 2]   43         lda     #0x00                                   ; Clear RAM
   1C07 A2 10         [ 2]   44         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1C09                      45 ZERORAM:
   1C09 95 00         [ 4]   46         sta     RAM_start,x
   1C0B E8            [ 2]   47         inx
   1C0C E0 80         [ 2]   48         cpx     #0x80
   1C0E D0 F9         [ 4]   49         bne     ZERORAM
   1C10 A9 00         [ 2]   50         lda     #0x00                                   ; Initialize these registers to 0x00
   1C12 8D 01 03      [ 4]   51         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   1C15 8D 00 03      [ 4]   52         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1C18 8D 81 03      [ 4]   53         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1C1B 8D 80 03      [ 4]   54         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1C1E 8D 83 03      [ 4]   55         sta     audio_control_reg_b                     ; Clear audio control B
   1C21 8D 05 02      [ 4]   56         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   1C24 8D 03 03      [ 4]   57         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1C27 8D 01 02      [ 4]   58         sta     U18_DDRA                                ; Buttons are inputs
   1C2A A9 02         [ 2]   59         lda     #0x02
   1C2C 8D 81 02      [ 4]   60         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   1C2F A9 FF         [ 2]   61         lda     #0xFF
   1C31 8D 82 03      [ 4]   62         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1C34 8D 03 02      [ 4]   63         sta     U18_DDRB                                ; Button lights are outputs
   1C37 8D 83 02      [ 4]   64         sta     U19_DDRB                                ; CPU card lights are outputs
   1C3A A9 FC         [ 2]   65         lda     #0xFC
   1C3C 8D 02 03      [ 4]   66         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   1C3F A9 2E         [ 2]   67         lda     #0x2E
   1C41 8D 01 03      [ 4]   68         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1C44 8D 03 03      [ 4]   69         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1C47 A9 3C         [ 2]   70         lda     #0x3C
   1C49 8D 81 03      [ 4]   71         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   1C4C 8D 83 03      [ 4]   72         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   1C4F A9 64         [ 2]   73         lda     #0x64
   1C51 85 53         [ 3]   74         sta     RAM_53                                  ; 100 - init 1 msec master counter
   1C53 A9 64         [ 2]   75         lda     #0x64
   1C55 85 56         [ 3]   76         sta     RAM_56                                  ; 100 - init a 1000 sec = 16 min counter? mistake?
   1C57 A9 F0         [ 2]   77         lda     #0xF0
   1C59 8D 82 03      [ 4]   78         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs - upper 4 bits only?
   1C5C 8D 82 02      [ 4]   79         sta     U19_PORTB                               ; turn on CPU LEDs 5-8
   1C5F A9 10         [ 2]   80         lda     #TAPEMODE_STOP
   1C61 20 60 1D      [ 6]   81         jsr     TAPECMD                                 ; STOP tape
   1C64 A9 28         [ 2]   82         lda     #0x28                                   ; this will count 4 seconds
   1C66 85 54         [ 3]   83         sta     RAM_54
   1C68 A9 64         [ 2]   84         lda     #0x64                                   ; reset master timer
   1C6A 85 53         [ 3]   85         sta     RAM_53
   1C6C                      86 $1:
   1C6C 20 72 1E      [ 6]   87         jsr     TUPDATE                                 ; do not much for 4 seconds
   1C6F A5 54         [ 3]   88         lda     RAM_54
   1C71 D0 F9         [ 4]   89         bne     $1
   1C73                      90 REWIND:
   1C73 A9 40         [ 2]   91         lda     #TAPEMODE_REWIND
   1C75 20 74 1D      [ 6]   92         jsr     TAPESET                                 ; REWIND tape
   1C78                      93 $22:
   1C78 A9 00         [ 2]   94         lda     #0x00
   1C7A 85 58         [ 3]   95         sta     RAM_58                                  ; counter to zero
                             96 ; Look for the long tone at the beginning of tape
   1C7C                      97 $2:
   1C7C 20 72 1E      [ 6]   98         jsr     TUPDATE                                 ; housekeeping
   1C7F AD 03 03      [ 4]   99         lda     transport_control_reg_b                 ; loop until we see tone marking beginning of tape
   1C82 10 F8         [ 4]  100         bpl     $2
   1C84 A9 06         [ 2]  101         lda     #0x06
   1C86 85 54         [ 3]  102         sta     RAM_54                                  ; set 0.6 second timer
   1C88 A9 64         [ 2]  103         lda     #0x64                                   ; 100 rising edge transitions
   1C8A 85 53         [ 3]  104         sta     RAM_53
   1C8C                     105 $3:
   1C8C 20 72 1E      [ 6]  106         jsr     TUPDATE                                 ; housekeeping
   1C8F AD 03 03      [ 4]  107         lda     transport_control_reg_b                 ; loop until 100 transport CB1 rising edges or 0.6 secs expired
   1C92 10 0B         [ 4]  108         bpl     $4                                      ; (> 83.333 Hz for 100 zero crossings)
   1C94 E6 58         [ 5]  109         inc     RAM_58                                  ; count transitions
   1C96 AD 02 03      [ 4]  110         lda     transport_periph$ddr_reg_b
   1C99 A5 58         [ 3]  111         lda     RAM_58
   1C9B C9 64         [ 2]  112         cmp     #0x64
   1C9D B0 0B         [ 4]  113         bcs     FINDTRK                                 ; happened 100 times, tape is at the beginning, jump ahead
   1C9F                     114 $4:
   1C9F A5 54         [ 3]  115         lda     RAM_54
   1CA1 D0 E9         [ 4]  116         bne     $3
   1CA3 4C 78 1C      [ 3]  117         jmp     $22
                            118 ; unused instructions start
   1CA6 C9 60         [ 2]  119         cmp     #0x60
   1CA8 90 00         [ 4]  120         bcc     FINDTRK
                            121 ; unused instructions end
                            122 ;
   1CAA                     123 FINDTRK:
   1CAA A9 20         [ 2]  124         lda     #TAPEMODE_FFWD
   1CAC 20 74 1D      [ 6]  125         jsr     TAPESET                                 ; FFWD tape
   1CAF A9 19         [ 2]  126         lda     #0x19
   1CB1 85 54         [ 3]  127         sta     RAM_54                                  ; 2.5 secs
   1CB3 A9 64         [ 2]  128         lda     #0x64
   1CB5 85 53         [ 3]  129         sta     RAM_53
   1CB7                     130 $5:
   1CB7 20 72 1E      [ 6]  131         jsr     TUPDATE                                 ; do housekeeping stuff
   1CBA A5 54         [ 3]  132         lda     RAM_54
   1CBC D0 F9         [ 4]  133         bne     $5
   1CBE A9 00         [ 2]  134         lda     #0x00
   1CC0 85 59         [ 3]  135         sta     RAM_59
   1CC2 20 83 1D      [ 6]  136         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CC5 E6 59         [ 5]  137         inc     RAM_59
   1CC7 A9 10         [ 2]  138         lda     #TAPEMODE_STOP
   1CC9 20 60 1D      [ 6]  139         jsr     TAPECMD                                 ; STOP tape
   1CCC A9 80         [ 2]  140         lda     #TAPEMODE_PLAY
   1CCE 20 60 1D      [ 6]  141         jsr     TAPECMD                                 ; PLAY tape
   1CD1 20 A6 1D      [ 6]  142         jsr     WAITCD                                  ; wait for carrier
   1CD4 A9 10         [ 2]  143         lda     #TAPEMODE_STOP
   1CD6 20 60 1D      [ 6]  144         jsr     TAPECMD                                 ; STOP Tape
   1CD9 20 33 1D      [ 6]  145         jsr     INITBRDS                                ; init the boards
   1CDC A9 00         [ 2]  146         lda     #0x00
   1CDE 85 5A         [ 3]  147         sta     RAM_5A                                  ; set state to not playing
   1CE0                     148 WAITPLAY:
   1CE0 20 72 1E      [ 6]  149         jsr     TUPDATE                                 ; do housekeeping stuff
   1CE3 A5 5A         [ 3]  150         lda     RAM_5A                                  ; wait until we are triggered
   1CE5 D0 0D         [ 4]  151         bne     STARTPLAY                               ; then jump
   1CE7 A9 02         [ 2]  152         lda     #0x02                                   ; else
   1CE9 8D 80 02      [ 4]  153         sta     U19_PORTA                               ; turn on RESET button light
   1CEC A9 00         [ 2]  154         lda     #0x00
   1CEE 8D 02 02      [ 4]  155         sta     U18_PORTB                               ; turn on all other button lights
   1CF1 4C E0 1C      [ 3]  156         jmp     WAITPLAY
                            157 ;   we have been started!
   1CF4                     158 STARTPLAY:
   1CF4 20 33 1D      [ 6]  159         jsr     INITBRDS                                ; init the boards
   1CF7 A9 00         [ 2]  160         lda     #0x00
   1CF9 8D 80 02      [ 4]  161         sta     U19_PORTA                               ; turn off RESET button light
   1CFC A9 80         [ 2]  162         lda     #0x80
   1CFE 8D 02 02      [ 4]  163         sta     U18_PORTB                               ; turn off all but PROG light
   1D01 A9 80         [ 2]  164         lda     #TAPEMODE_PLAY
   1D03 20 60 1D      [ 6]  165         jsr     TAPECMD                                 ; PLAY tape
   1D06 20 A6 1D      [ 6]  166         jsr     WAITCD                                  ; wait for carrier
   1D09 C6 5A         [ 5]  167         dec     RAM_5A                                  ; no longer triggered
   1D0B 20 CC 1D      [ 6]  168         jsr     PLAYTRK                                 ; play a track!
   1D0E 20 33 1D      [ 6]  169         jsr     INITBRDS                                ; init the boards
   1D11 A9 30         [ 2]  170         lda     #0x30
   1D13 85 56         [ 3]  171         sta     RAM_56                                  ; set an 8 minute timer?
   1D15 A9 64         [ 2]  172         lda     #0x64
   1D17 85 55         [ 3]  173         sta     RAM_55
   1D19 E6 59         [ 5]  174         inc     RAM_59                                  ; track counter
   1D1B A5 59         [ 3]  175         lda     RAM_59
   1D1D C9 1A         [ 2]  176         cmp     #0x1A                                   ; 26?
   1D1F 90 03         [ 4]  177         bcc     NEXTTRK
   1D21 4C 73 1C      [ 3]  178         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            179 ; go to next track
   1D24                     180 NEXTTRK:
   1D24 20 A6 1D      [ 6]  181         jsr     WAITCD                                  ; wait for carrier
   1D27 A9 10         [ 2]  182         lda     #TAPEMODE_STOP
   1D29 20 60 1D      [ 6]  183         jsr     TAPECMD                                 ; STOP tape
   1D2C A9 00         [ 2]  184         lda     #0x00
   1D2E 85 5A         [ 3]  185         sta     RAM_5A                                  ; no longer triggered
   1D30 4C E0 1C      [ 3]  186         jmp     WAITPLAY
                            187 ;
                            188 ;       Init boards, bg audio stopped, tape audio enable
                            189 ;
   1D33                     190 INITBRDS:
   1D33 A9 3C         [ 2]  191         lda     #0x3C
   1D35 8D 83 03      [ 4]  192         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1D38 A9 34         [ 2]  193         lda     #0x34
   1D3A 8D 81 03      [ 4]  194         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1D3D A2 00         [ 2]  195         ldx     #0x00
   1D3F                     196 NEXTBRD:
   1D3F A9 30         [ 2]  197         lda     #0x30
   1D41 95 81         [ 4]  198         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1D43 95 83         [ 4]  199         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1D45 A9 FF         [ 2]  200         lda     #0xFF
   1D47 95 80         [ 4]  201         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1D49 95 82         [ 4]  202         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1D4B A9 34         [ 2]  203         lda     #0x34
   1D4D 95 81         [ 4]  204         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1D4F 95 83         [ 4]  205         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1D51 A9 00         [ 2]  206         lda     #0x00
   1D53 95 80         [ 4]  207         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1D55 95 82         [ 4]  208         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1D57 E8            [ 2]  209         inx
   1D58 E8            [ 2]  210         inx
   1D59 E8            [ 2]  211         inx
   1D5A E8            [ 2]  212         inx
   1D5B E0 20         [ 2]  213         cpx     #0x20                                   ; do for boards 1-8
   1D5D 90 E0         [ 4]  214         bcc     NEXTBRD
   1D5F 60            [ 6]  215         rts
                            216 ;
                            217 ;       Send Transport command for 0.255 sec
                            218 ;       and then unassert it
                            219 ;       (Used for STOP and PLAY)
                            220 ;
   1D60                     221 TAPECMD:
   1D60 8D 02 03      [ 4]  222         sta     transport_periph$ddr_reg_b              ; enable output line
   1D63 A9 FF         [ 2]  223         lda     #0xFF
   1D65 85 50         [ 3]  224         sta     RAM_50
   1D67                     225 $6:
   1D67 20 72 1E      [ 6]  226         jsr     TUPDATE                                 ; check for PROG button push
   1D6A A5 50         [ 3]  227         lda     RAM_50
   1D6C D0 F9         [ 4]  228         bne     $6
   1D6E A9 00         [ 2]  229         lda     #0x00
   1D70 8D 02 03      [ 4]  230         sta     transport_periph$ddr_reg_b
   1D73 60            [ 6]  231         rts
                            232 ;
                            233 ;       Send Transport command for 0.250 sec
                            234 ;       and keep it asserted on return
                            235 ;       (Used for Rewind and FFwd)
                            236 ;
   1D74                     237 TAPESET:
   1D74 8D 02 03      [ 4]  238         sta     transport_periph$ddr_reg_b
   1D77 A9 FA         [ 2]  239         lda     #0xFA
   1D79 85 50         [ 3]  240         sta     RAM_50
   1D7B                     241 $7:
   1D7B 20 72 1E      [ 6]  242         jsr     TUPDATE
   1D7E A5 50         [ 3]  243         lda     RAM_50
   1D80 D0 F9         [ 4]  244         bne     $7
   1D82 60            [ 6]  245         rts
                            246 ;
                            247 ;       Wait for tone during Fast Forward, signaling beginning of track
                            248 ;       (50Hz or above, for 33 zero crossing) 
                            249 ;
   1D83                     250 WAITTONE:
   1D83 A9 00         [ 2]  251         lda     #0x00
   1D85 85 58         [ 3]  252         sta     RAM_58
   1D87                     253 $8:
   1D87 AD 02 03      [ 4]  254         lda     transport_periph$ddr_reg_b
   1D8A A9 0A         [ 2]  255         lda     #0x0A
   1D8C 85 50         [ 3]  256         sta     RAM_50                                  ; 10 msec
   1D8E E6 58         [ 5]  257         inc     RAM_58
   1D90 A5 58         [ 3]  258         lda     RAM_58
   1D92 C9 21         [ 2]  259         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   1D94 B0 0F         [ 4]  260         bcs     $10                                     ; timeout - exit
   1D96                     261 $9:
   1D96 20 72 1E      [ 6]  262         jsr     TUPDATE                                 ; housekeeping
   1D99 A5 50         [ 3]  263         lda     RAM_50
   1D9B F0 E6         [ 4]  264         beq     WAITTONE                                ; 10 msec done yet? then loop
   1D9D AD 03 03      [ 4]  265         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1DA0 10 F4         [ 4]  266         bpl     $9                                      ; if not, extend the looping
   1DA2 4C 87 1D      [ 3]  267         jmp     $8                                      ; else loop but keep timeout going
   1DA5                     268 $10:
   1DA5 60            [ 6]  269         rts
                            270 ;
                            271 ;       Wait for carrier / start of data
                            272 ;
                            273 
                            274 ; Wait for 250ms
   1DA6                     275 WAITCD:
   1DA6 A9 FA         [ 2]  276         lda     #0xFA
   1DA8 85 50         [ 3]  277         sta     RAM_50                                  ; 250 msec
   1DAA                     278 $11:
   1DAA 20 72 1E      [ 6]  279         jsr     TUPDATE                                 ; housekeeping
   1DAD A5 50         [ 3]  280         lda     RAM_50
   1DAF D0 F9         [ 4]  281         bne     $11
                            282 
                            283 ; Wait for 160ms of consecutive zero crossings
   1DB1                     284 $12:
   1DB1 20 72 1E      [ 6]  285         jsr     TUPDATE                                 ; housekeeping
   1DB4 AD 02 03      [ 4]  286         lda     transport_periph$ddr_reg_b
   1DB7 6A            [ 2]  287         ror     a
   1DB8 90 F7         [ 4]  288         bcc     $12
   1DBA A9 A0         [ 2]  289         lda     #0xA0                                   ; 160 msec
   1DBC 85 50         [ 3]  290         sta     RAM_50
   1DBE                     291 $13:
   1DBE 20 72 1E      [ 6]  292         jsr     TUPDATE                                 ; housekeeping
   1DC1 AD 02 03      [ 4]  293         lda     transport_periph$ddr_reg_b
   1DC4 6A            [ 2]  294         ror     a
   1DC5 90 EA         [ 4]  295         bcc     $12
   1DC7 A5 50         [ 3]  296         lda     RAM_50
   1DC9 D0 F3         [ 4]  297         bne     $13
   1DCB 60            [ 6]  298         rts
                            299 ;
                            300 ;       Play a track
                            301 ;
   1DCC                     302 PLAYTRK:
   1DCC AD 00 03      [ 4]  303         lda     transport_periph$ddr_reg_a
   1DCF A9 40         [ 2]  304         lda     #0x40
   1DD1 85 82         [ 3]  305         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1DD3 85 86         [ 3]  306         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1DD5 85 8A         [ 3]  307         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1DD7 85 8E         [ 3]  308         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   1DD9 A9 3C         [ 2]  309         lda     #0x3C
   1DDB 8D 81 03      [ 4]  310         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   1DDE A9 34         [ 2]  311         lda     #0x34
   1DE0 8D 83 03      [ 4]  312         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   1DE3                     313 $14:
   1DE3 AD 02 03      [ 4]  314         lda     transport_periph$ddr_reg_b
   1DE6 4A            [ 2]  315         lsr     a
   1DE7 90 0E         [ 4]  316         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   1DE9 20 72 1E      [ 6]  317         jsr     TUPDATE                                 ; housekeeping
   1DEC AD 01 03      [ 4]  318         lda     transport_control_reg_a                 ; Did we get a byte?
   1DEF 10 F2         [ 4]  319         bpl     $14                                     ; No, loop
   1DF1 20 09 1E      [ 6]  320         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   1DF4 4C E3 1D      [ 3]  321         jmp     $14
                            322 
                            323 ;       Lost carrier - wait 100 msec for more data before giving up
   1DF7                     324 LOSTCD:
   1DF7 A9 64         [ 2]  325         lda     #0x64                                   ; 100 msec
   1DF9 85 50         [ 3]  326         sta     RAM_50
   1DFB                     327 $15:
   1DFB 20 72 1E      [ 6]  328         jsr     TUPDATE
   1DFE AD 02 03      [ 4]  329         lda     transport_periph$ddr_reg_b
   1E01 4A            [ 2]  330         lsr     a
   1E02 B0 C8         [ 4]  331         bcs     PLAYTRK                                 ; carrier
   1E04 A5 50         [ 3]  332         lda     RAM_50
   1E06 D0 F3         [ 4]  333         bne     $15
   1E08 60            [ 6]  334         rts
                            335 ;
                            336 ; Protocol handler
                            337 ;
   1E09                     338 PROTOHAND:
   1E09 AD 00 03      [ 4]  339         lda     transport_periph$ddr_reg_a
   1E0C 29 7F         [ 2]  340         and     #0x7F                                   ; insure data is ASCII
   1E0E 85 5C         [ 3]  341         sta     RAM_5C                                  ; store it here
   1E10 29 7E         [ 2]  342         and     #0x7E                                   ; ignore bottom bit
   1E12 C9 22         [ 2]  343         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1E14 F0 3A         [ 4]  344         beq     PROCCHNL                                ; if so, process as channel
   1E16 C9 32         [ 2]  345         cmp     #0x32                                   ; is it < 0x32 ?
   1E18 90 4F         [ 4]  346         bcc     $18                                     ; ignore it
   1E1A C9 3A         [ 2]  347         cmp     #0x3A                                   ; is it < 0x3A
   1E1C 90 32         [ 4]  348         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   1E1E A5 5C         [ 3]  349         lda     RAM_5C
   1E20 C9 41         [ 2]  350         cmp     #0x41                                   ; is it < 0x41?
   1E22 90 45         [ 4]  351         bcc     $18                                     ; ignore it
   1E24 C9 51         [ 2]  352         cmp     #0x51                                   ; is it >= 0x51?
   1E26 B0 41         [ 4]  353         bcs     $18                                     ; ignore it
   1E28 A6 64         [ 3]  354         ldx     RAM_64                                  ; X = current board address
   1E2A 38            [ 2]  355         sec                                             ; (it's 0x41 to 0x50)
   1E2B E9 41         [ 2]  356         sbc     #0x41                                   ; subtract 0x41
   1E2D C9 08         [ 2]  357         cmp     #0x08
   1E2F 90 02         [ 4]  358         bcc     $16                                     ; process as command
   1E31 E8            [ 2]  359         inx
   1E32 E8            [ 2]  360         inx
   1E33                     361 $16:
   1E33 29 07         [ 2]  362         and     #0x07                                   ; lookup bitmask in A
   1E35 A8            [ 2]  363         tay
   1E36 B9 6A 1E      [ 5]  364         lda     MASKTBL,y
   1E39 85 5D         [ 3]  365         sta     RAM_5D                                  ; store mask in RAM_5D
   1E3B A5 5E         [ 3]  366         lda     RAM_5E
   1E3D 4A            [ 2]  367         lsr     a                                       ; get on/off in carry
   1E3E B0 09         [ 4]  368         bcs     $17                                     ; if on, jump
   1E40 A5 5D         [ 3]  369         lda     RAM_5D
   1E42 49 FF         [ 2]  370         eor     #0xFF
   1E44 35 00         [ 4]  371         and     RAM_start,x
   1E46 95 00         [ 4]  372         sta     RAM_start,x                             ; turn off solenoid
   1E48 60            [ 6]  373         rts
                            374 ;
   1E49                     375 $17:
   1E49 A5 5D         [ 3]  376         lda     RAM_5D
   1E4B 15 00         [ 4]  377         ora     RAM_start,x
   1E4D 95 00         [ 4]  378         sta     RAM_start,x                             ; turn on solenoid
   1E4F 60            [ 6]  379         rts
                            380 ;
   1E50                     381 PROCCHNL:
   1E50 A5 5C         [ 3]  382         lda     RAM_5C                                  ; put channel byte in RAM_5E
   1E52 85 5E         [ 3]  383         sta     RAM_5E
   1E54 29 7E         [ 2]  384         and     #0x7E
   1E56 C9 22         [ 2]  385         cmp     #0x22
   1E58 D0 05         [ 4]  386         bne     CONVCHNL
   1E5A A9 98         [ 2]  387         lda     #0x98                                   ; process 0x22 or 0x23
   1E5C 85 64         [ 3]  388         sta     RAM_64                                  ; set this to 0x98 - board 7
   1E5E 60            [ 6]  389         rts
                            390 ;
   1E5F                     391 CONVCHNL:
   1E5F 38            [ 2]  392         sec                                             ; process channel
   1E60 E9 32         [ 2]  393         sbc     #0x32
   1E62 0A            [ 2]  394         asl     a                               
   1E63 18            [ 2]  395         clc
   1E64 69 80         [ 2]  396         adc     #0x80
   1E66 85 64         [ 3]  397         sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
   1E68 60            [ 6]  398         rts
   1E69                     399 $18:
   1E69 60            [ 6]  400         rts
                            401 ;
                            402 ; bit mask table
                            403 ;
   1E6A                     404 MASKTBL:
   1E6A 01 02 04 08         405         .db      0x01, 0x02, 0x04, 0x08
   1E6E 10 20 40 80         406         .db      0x10, 0x20, 0x40, 0x80
                            407 ;
                            408 ;       Housekeeping routine
                            409 ;       RAM_50 used on entry
                            410 ;
   1E72                     411 TUPDATE:
   1E72 AD 05 02      [ 4]  412         lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
   1E75 85 5F         [ 3]  413         sta     RAM_5F                                  ; store this state in 5F
   1E77 F0 50         [ 4]  414         beq     TEXIT                                   ; No flags set, return
   1E79 A5 5B         [ 3]  415         lda     RAM_5B                                  ; Are we already running?
   1E7B 30 0E         [ 4]  416         bmi     $19                                     ; yes, jump ahead
   1E7D A5 5F         [ 3]  417         lda     RAM_5F                                  ; else check flags
   1E7F 29 40         [ 2]  418         and     #0x40                                   ; PROG pushed?
   1E81 F0 16         [ 4]  419         beq     ADJTMR                                  ; if not, go to adjust timer
   1E83 A9 80         [ 2]  420         lda     #0x80
   1E85 85 5B         [ 3]  421         sta     RAM_5B                                  ; PROG Button pushed
   1E87 A9 FA         [ 2]  422         lda     #0xFA
   1E89 85 51         [ 3]  423         sta     RAM_51
   1E8B                     424 $19:
   1E8B A5 51         [ 3]  425         lda     RAM_51                                  ; for 250ms?
   1E8D D0 06         [ 4]  426         bne     $20                                     ; no, exit
   1E8F A9 00         [ 2]  427         lda     #0x00
   1E91 85 5B         [ 3]  428         sta     RAM_5B                                  ; yes, reset PROG button state
   1E93 E6 5A         [ 5]  429         inc     RAM_5A                                  ; and mark as running
   1E95                     430 $20:
   1E95 A5 5F         [ 3]  431         lda     RAM_5F                                  ; check timer irq bit
   1E97 10 30         [ 4]  432         bpl     TEXIT                                   ; if timer not expired, return
                            433 ; Adjust Timer routine
   1E99                     434 ADJTMR:
   1E99 AD 04 02      [ 4]  435         lda     U18_timer                               ; read timer in U18
   1E9C 49 FF         [ 2]  436         eor     #0xFF                                   ; flip the bits
   1E9E 4A            [ 2]  437         lsr     a                                       ; keep the top 5 bits
   1E9F 4A            [ 2]  438         lsr     a
   1EA0 4A            [ 2]  439         lsr     a
   1EA1 85 57         [ 3]  440         sta     RAM_57                                  ; store them
   1EA3 90 02         [ 4]  441         bcc     $21                                     ; bcc on timer bit D2
   1EA5 E6 57         [ 5]  442         inc     RAM_57                                  ; round up?
                            443                                                         ; now RAM_57 has the number of 8us 
                            444                                                         ;   intervals since timer expired
   1EA7                     445 $21:
   1EA7 A9 7A         [ 2]  446         lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
   1EA9 38            [ 2]  447         sec                                             ; with programming delays, this is 1 msec
   1EAA E5 57         [ 3]  448         sbc     RAM_57
   1EAC 8D 15 02      [ 4]  449         sta     U18_timer_8T_DI                         ; set timer
   1EAF C6 50         [ 5]  450         dec     RAM_50                                  ; decrement these timers every timer reset (1ms)
   1EB1 C6 51         [ 5]  451         dec     RAM_51
   1EB3 C6 52         [ 5]  452         dec     RAM_52
   1EB5 C6 53         [ 5]  453         dec     RAM_53
   1EB7 D0 10         [ 4]  454         bne     TEXIT                                   ; if timer RAM_53 expires, then wrap to 100
   1EB9 A9 64         [ 2]  455         lda     #0x64                                   ; 100
   1EBB 85 53         [ 3]  456         sta     RAM_53
   1EBD C6 54         [ 5]  457         dec     RAM_54
   1EBF C6 55         [ 5]  458         dec     RAM_55                                  
   1EC1 D0 06         [ 4]  459         bne     TEXIT                                   ; if timer RAM_55 expires, then wrap to 100
   1EC3 A9 64         [ 2]  460         lda     #0x64                                   ; 100
   1EC5 85 55         [ 3]  461         sta     RAM_55
   1EC7 C6 56         [ 5]  462         dec     RAM_56
   1EC9                     463 TEXIT:
   1EC9 60            [ 6]  464         rts
                            465 ;
                            466 ;       AGC table, unused
                            467 ;
   1ECA 03 04 06 08         468         .db      0x03, 0x04, 0x06, 0x08
   1ECE 10 16 20 2D         469         .db      0x10, 0x16, 0x20, 0x2D
   1ED2 40 5A 80 BF         470         .db      0x40, 0x5A, 0x80, 0xBF
   1ED6 FF FF FF FF         471         .db      0xFF, 0xFF, 0xFF, 0xFF
                            472 ;
                            473 ; all zeros in this gap
                            474 ;
   1FFA                     475         .org    0x1FFA
                            476 ;
                            477 ; vectors
                            478 ;
   1FFA                     479 NMIVEC:
   1FFA 00 00               480         .dw      RAM_start
   1FFC                     481 RESETVEC:
   1FFC 00 1C               482         .dw      RESET
   1FFE                     483 IRQVEC:
   1FFE 00 00               484         .dw      RAM_start
