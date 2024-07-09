                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       Unknown Program (2)
                              7 ;       Version Unknown
                              8 ;
                              9 ;       This image was recovered from the last quarter of a 2732
                             10 ;
                     0050    11 RAM_50  = 0x0050    ; decremented every 1ms
                     0051    12 RAM_51  = 0x0051    ; decremented every 1ms
                     0052    13 RAM_52  = 0x0052    ; decremented every 1ms
                     0053    14 RAM_53  = 0x0053    ; decremented every 1ms, resets to 100
                     0054    15 RAM_54  = 0x0054    ; decremented every 0.1s
                     0055    16 RAM_55  = 0x0055    ; decremented every 0.1s, resets to 100
                     0056    17 RAM_56  = 0x0056    ; decremented every 10s
                     0057    18 RAM_57  = 0x0057    ; temp timer storage
                     0058    19 RAM_58  = 0x0058    ; zero crossing counter
                     0059    20 RAM_59  = 0x0059    ; track counter
                     005A    21 RAM_5A  = 0x005A    ; number of PROG button presses
                             22 
                     005C    23 RAM_5C  = 0x005C    ; storage for incoming serial byte (& 0x7F)
                     005D    24 RAM_5D  = 0x005D    ; bitmask for solenoids
                     005E    25 RAM_5E  = 0x005E    ; current channel serial byte
                     005F    26 RAM_5F  = 0x005F    ; temp timer storage
                     0060    27 RAM_60  = 0x0060    ; agc mic level
                     0061    28 RAM_61  = 0x0061    ; agc mic level accumulator
                     0062    29 RAM_62  = 0x0062    ; agc mic sample counter
                     0063    30 RAM_63  = 0x0063    ; agc calculated gain value
                     0064    31 RAM_64  = 0x0064    ; current channel port address
                             32 
                             33         .include "../include/ptt6502.def"
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
                             34 
   1C00                      35         .org    0x1C00
                             36 ;
   1C00                      37 RESET:
   1C00 D8            [ 2]   38         cld                                             ; No decimal mode
   1C01 78            [ 2]   39         sei                                             ; Interrupts are not used
   1C02 A2 F0         [ 2]   40         ldx     #0xF0                                   ; Stack is at 0x01F0
   1C04 9A            [ 2]   41         txs
   1C05 A9 00         [ 2]   42         lda     #0x00                                   ; Clear RAM
   1C07 A2 10         [ 2]   43         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1C09                      44 ZERORAM:
   1C09 95 00         [ 4]   45         sta     RAM_start,x
   1C0B E8            [ 2]   46         inx
   1C0C E0 80         [ 2]   47         cpx     #0x80
   1C0E D0 F9         [ 4]   48         bne     ZERORAM
   1C10 A9 00         [ 2]   49         lda     #0x00                                   ; Initialize these registers to 0x00
   1C12 8D 01 03      [ 4]   50         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   1C15 8D 00 03      [ 4]   51         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1C18 8D 81 03      [ 4]   52         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1C1B 8D 80 03      [ 4]   53         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1C1E 8D 83 03      [ 4]   54         sta     audio_control_reg_b                     ; Clear audio control B
   1C21 8D 05 02      [ 4]   55         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   1C24 8D 03 03      [ 4]   56         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1C27 8D 01 02      [ 4]   57         sta     U18_DDRA                                ; Buttons are inputs
   1C2A A9 02         [ 2]   58         lda     #0x02
   1C2C 8D 81 02      [ 4]   59         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   1C2F A9 FF         [ 2]   60         lda     #0xFF
   1C31 8D 82 03      [ 4]   61         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1C34 8D 03 02      [ 4]   62         sta     U18_DDRB                                ; Button lights are outputs
   1C37 8D 83 02      [ 4]   63         sta     U19_DDRB                                ; CPU card lights are outputs
   1C3A A9 FC         [ 2]   64         lda     #0xFC
   1C3C 8D 02 03      [ 4]   65         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   1C3F A9 2E         [ 2]   66         lda     #0x2E
   1C41 8D 01 03      [ 4]   67         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1C44 8D 03 03      [ 4]   68         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1C47 A9 3C         [ 2]   69         lda     #0x3C
   1C49 8D 81 03      [ 4]   70         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   1C4C 8D 83 03      [ 4]   71         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   1C4F A9 64         [ 2]   72         lda     #0x64
   1C51 85 53         [ 3]   73         sta     RAM_53                                  ; 100 - init 1 msec master counter
   1C53 A9 1E         [ 2]   74         lda     #0x1E
   1C55 85 56         [ 3]   75         sta     RAM_56                                  ; Init an 5 minute timer
   1C57 A9 64         [ 2]   76         lda     #0x64
   1C59 85 55         [ 3]   77         sta     RAM_55                                  ; 100 - init 0.1 sec master counter
   1C5B A9 10         [ 2]   78         lda     #0x10                                   ; 16
   1C5D 85 63         [ 3]   79         sta     RAM_63                                  ; Set initial AGC gain value
   1C5F A9 10         [ 2]   80         lda     #TAPEMODE_STOP
   1C61 20 7C 1D      [ 6]   81         jsr     TAPECMD                                 ; STOP tape
   1C64 A9 28         [ 2]   82         lda     #0x28                                   ; this will count 4 seconds
   1C66 85 54         [ 3]   83         sta     RAM_54
   1C68 A9 64         [ 2]   84         lda     #0x64                                   ; reset master timer
   1C6A 85 53         [ 3]   85         sta     RAM_53
   1C6C                      86 $1:
   1C6C 20 8D 1E      [ 6]   87         jsr     TUPDATE                                 ; do not much for 4 seconds
   1C6F A5 54         [ 3]   88         lda     RAM_54
   1C71 D0 F9         [ 4]   89         bne     $1
   1C73                      90 REWIND:
   1C73 A9 40         [ 2]   91         lda     #TAPEMODE_REWIND
   1C75 20 7C 1D      [ 6]   92         jsr     TAPECMD                                 ; REWIND tape
   1C78                      93 $22:
   1C78 A9 00         [ 2]   94         lda     #0x00
   1C7A 85 58         [ 3]   95         sta     RAM_58                                  ; counter to zero
                             96 ; Look for the long tone at the beginning of tape
   1C7C                      97 $2:
   1C7C 20 8D 1E      [ 6]   98         jsr     TUPDATE                                 ; housekeeping
   1C7F AD 03 03      [ 4]   99         lda     transport_control_reg_b                 ; loop until we see tone marking beginning of tape
   1C82 10 F8         [ 4]  100         bpl     $2
   1C84 A9 06         [ 2]  101         lda     #0x06
   1C86 85 54         [ 3]  102         sta     RAM_54                                  ; set 0.6 second timer
   1C88 A9 64         [ 2]  103         lda     #0x64                                   ; 100 rising edge transitions
   1C8A 85 53         [ 3]  104         sta     RAM_53
   1C8C                     105 $3:
   1C8C 20 8D 1E      [ 6]  106         jsr     TUPDATE                                 ; housekeeping
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
   1CAC 20 7C 1D      [ 6]  125         jsr     TAPECMD                                 ; FFWD tape
   1CAF A9 19         [ 2]  126         lda     #0x19
   1CB1 85 54         [ 3]  127         sta     RAM_54                                  ; 2.5 secs
   1CB3 A9 64         [ 2]  128         lda     #0x64
   1CB5 85 53         [ 3]  129         sta     RAM_53
   1CB7                     130 $5:
   1CB7 20 8D 1E      [ 6]  131         jsr     TUPDATE                                 ; do housekeeping stuff
   1CBA A5 54         [ 3]  132         lda     RAM_54
   1CBC D0 F9         [ 4]  133         bne     $5
   1CBE A9 00         [ 2]  134         lda     #0x00
   1CC0 85 59         [ 3]  135         sta     RAM_59
   1CC2 20 97 1D      [ 6]  136         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CC5 A9 40         [ 2]  137         lda     #TAPEMODE_REWIND
   1CC7 20 7C 1D      [ 6]  138         jsr     TAPECMD                                 ; REWIND tape
   1CCA 20 97 1D      [ 6]  139         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CCD A9 FA         [ 2]  140         lda     #0xFA
   1CCF 85 50         [ 3]  141         sta     RAM_50
   1CD1                     142 $30:
   1CD1 20 8D 1E      [ 6]  143         jsr     TUPDATE                                 ; housekeeping
   1CD4 A5 50         [ 3]  144         lda     RAM_50
   1CD6 D0 F9         [ 4]  145         bne     $30                                     ; delay for 250 ms
   1CD8 A9 20         [ 2]  146         lda     #TAPEMODE_FFWD
   1CDA 20 7C 1D      [ 6]  147         jsr     TAPECMD                                 ; FFWD tape
   1CDD 20 97 1D      [ 6]  148         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CE0 E6 59         [ 5]  149         inc     RAM_59
   1CE2 A9 10         [ 2]  150         lda     #TAPEMODE_STOP
   1CE4 20 7C 1D      [ 6]  151         jsr     TAPECMD                                 ; STOP tape
   1CE7 A9 80         [ 2]  152         lda     #TAPEMODE_PLAY
   1CE9 20 7C 1D      [ 6]  153         jsr     TAPECMD                                 ; PLAY tape
   1CEC 20 BA 1D      [ 6]  154         jsr     WAITCD                                  ; wait for carrier
   1CEF A9 10         [ 2]  155         lda     #TAPEMODE_STOP
   1CF1 20 7C 1D      [ 6]  156         jsr     TAPECMD                                 ; STOP Tape
   1CF4 20 4F 1D      [ 6]  157         jsr     INITBRDS                                ; init the boards
   1CF7                     158 WAITPLAY:
   1CF7 20 8D 1E      [ 6]  159         jsr     TUPDATE                                 ; do housekeeping stuff
   1CFA 20 1A 1F      [ 6]  160         jsr     AGCUPD                                  ; do AGC Mic Logic
   1CFD A5 5A         [ 3]  161         lda     RAM_5A                                  ; wait until we are triggered
   1CFF D0 10         [ 4]  162         bne     STARTPLAY                                   ; then jump
   1D01 A9 02         [ 2]  163         lda     #0x02                                   ; else
   1D03 8D 80 02      [ 4]  164         sta     U19_PORTA                               ; turn on RESET button light
   1D06 A9 00         [ 2]  165         lda     #0x00
   1D08 8D 02 02      [ 4]  166         sta     U18_PORTB                               ; turn on all other button lights
   1D0B A5 56         [ 3]  167         lda     RAM_56                                  ; has the 8 minute timer run out?
   1D0D D0 E8         [ 4]  168         bne     WAITPLAY                                ; no, keep looping
   1D0F E6 5A         [ 5]  169         inc     RAM_5A                                  ; yes, simulate a PROG button press
                            170 ;   we have been started!
   1D11                     171 STARTPLAY:
   1D11 20 4F 1D      [ 6]  172         jsr     INITBRDS                                ; init the boards
   1D14 A9 00         [ 2]  173         lda     #0x00
   1D16 8D 80 02      [ 4]  174         sta     U19_PORTA                               ; turn off RESET button light
   1D19 A9 80         [ 2]  175         lda     #0x80
   1D1B 8D 02 02      [ 4]  176         sta     U18_PORTB                               ; turn off all but PROG light
   1D1E A9 80         [ 2]  177         lda     #TAPEMODE_PLAY
   1D20 20 7C 1D      [ 6]  178         jsr     TAPECMD                                 ; PLAY tape
   1D23 20 BA 1D      [ 6]  179         jsr     WAITCD                                  ; wait for carrier
   1D26 C6 5A         [ 5]  180         dec     RAM_5A                                  ; no longer triggered
   1D28 20 E0 1D      [ 6]  181         jsr     PLAYTRK                                 ; play a track!
   1D2B 20 4F 1D      [ 6]  182         jsr     INITBRDS                                ; init the boards
   1D2E A9 1E         [ 2]  183         lda     #0x1E
   1D30 85 56         [ 3]  184         sta     RAM_56                                  ; set a 5 min timer
   1D32 A9 64         [ 2]  185         lda     #0x64
   1D34 85 55         [ 3]  186         sta     RAM_55
   1D36 E6 59         [ 5]  187         inc     RAM_59                                  ; track counter
   1D38 A5 59         [ 3]  188         lda     RAM_59
   1D3A C9 1A         [ 2]  189         cmp     #0x1A                                   ; 26?
   1D3C 90 03         [ 4]  190         bcc     NEXTTRK
   1D3E 4C 73 1C      [ 3]  191         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            192 ; go to next track
   1D41                     193 NEXTTRK:
   1D41 20 BA 1D      [ 6]  194         jsr     WAITCD                                  ; wait for carrier
   1D44 A9 10         [ 2]  195         lda     #TAPEMODE_STOP
   1D46 20 7C 1D      [ 6]  196         jsr     TAPECMD                                 ; STOP tape
   1D49 20 D1 1E      [ 6]  197         jsr     AGCMICRD                                ; Read the AGC mic level
   1D4C 4C F7 1C      [ 3]  198         jmp     WAITPLAY
                            199 ;
                            200 ;       Init boards
                            201 ;
   1D4F                     202 INITBRDS:
   1D4F A9 3C         [ 2]  203         lda     #0x3C
   1D51 8D 83 03      [ 4]  204         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1D54 A9 34         [ 2]  205         lda     #0x34
   1D56 8D 81 03      [ 4]  206         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1D59 A2 00         [ 2]  207         ldx     #0x00
   1D5B                     208 NEXTBRD:
   1D5B A9 30         [ 2]  209         lda     #0x30
   1D5D 95 81         [ 4]  210         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1D5F 95 83         [ 4]  211         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1D61 A9 FF         [ 2]  212         lda     #0xFF
   1D63 95 80         [ 4]  213         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1D65 95 82         [ 4]  214         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1D67 A9 34         [ 2]  215         lda     #0x34
   1D69 95 81         [ 4]  216         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1D6B 95 83         [ 4]  217         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1D6D A9 00         [ 2]  218         lda     #0x00
   1D6F 95 80         [ 4]  219         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1D71 95 82         [ 4]  220         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1D73 E8            [ 2]  221         inx
   1D74 E8            [ 2]  222         inx
   1D75 E8            [ 2]  223         inx
   1D76 E8            [ 2]  224         inx
   1D77 E0 20         [ 2]  225         cpx     #0x20                                   ; do for boards 1-8
   1D79 90 E0         [ 4]  226         bcc     NEXTBRD
   1D7B 60            [ 6]  227         rts
                            228 ;
                            229 ;       Send Transport command for 0.250 sec
                            230 ;       (Unified)
                            231 ;
   1D7C                     232 TAPECMD:
   1D7C 8D 02 03      [ 4]  233         sta     transport_periph$ddr_reg_b              ; enable output line
   1D7F A9 FA         [ 2]  234         lda     #0xFA
   1D81 85 50         [ 3]  235         sta     RAM_50
   1D83                     236 $6:
   1D83 20 8D 1E      [ 6]  237         jsr     TUPDATE                                 ; check for PROG button push
   1D86 A5 50         [ 3]  238         lda     RAM_50
   1D88 D0 F9         [ 4]  239         bne     $6
   1D8A AD 02 03      [ 4]  240         lda     transport_periph$ddr_reg_b
   1D8D 29 60         [ 2]  241         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1D8F D0 05         [ 4]  242         bne     $31                                     ; Yes, go to exit
   1D91 A9 00         [ 2]  243         lda     #0x00                                   ; else unassert STOP or PLAY
   1D93 8D 02 03      [ 4]  244         sta     transport_periph$ddr_reg_b              ; and then exit
   1D96                     245 $31:
   1D96 60            [ 6]  246         rts
                            247 ;
                            248 ;       Wait for tone during Fast Forward, signaling beginning of track
                            249 ;       (50Hz or above, for 33 zero crossing) 
                            250 ;
   1D97                     251 WAITTONE:
   1D97 A9 00         [ 2]  252         lda     #0x00
   1D99 85 58         [ 3]  253         sta     RAM_58
   1D9B                     254 $8:
   1D9B AD 02 03      [ 4]  255         lda     transport_periph$ddr_reg_b
   1D9E A9 0A         [ 2]  256         lda     #0x0A
   1DA0 85 50         [ 3]  257         sta     RAM_50                                  ; 10 msec
   1DA2 E6 58         [ 5]  258         inc     RAM_58
   1DA4 A5 58         [ 3]  259         lda     RAM_58
   1DA6 C9 21         [ 2]  260         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   1DA8 B0 0F         [ 4]  261         bcs     $10                                     ; timeout - exit
   1DAA                     262 $9:
   1DAA 20 8D 1E      [ 6]  263         jsr     TUPDATE                                 ; housekeeping
   1DAD A5 50         [ 3]  264         lda     RAM_50
   1DAF F0 E6         [ 4]  265         beq     WAITTONE                                ; 10 msec done yet? then loop
   1DB1 AD 03 03      [ 4]  266         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1DB4 10 F4         [ 4]  267         bpl     $9                                      ; if not, extend the looping
   1DB6 4C 9B 1D      [ 3]  268         jmp     $8                                      ; else loop but keep timeout going
   1DB9                     269 $10:
   1DB9 60            [ 6]  270         rts
                            271 ;
                            272 ;       Wait for carrier / start of data
                            273 ;
                            274 
                            275 ; Wait for 250ms
   1DBA                     276 WAITCD:
   1DBA A9 FA         [ 2]  277         lda     #0xFA
   1DBC 85 50         [ 3]  278         sta     RAM_50                                  ; 250 msec
   1DBE                     279 $11:
   1DBE 20 8D 1E      [ 6]  280         jsr     TUPDATE                                 ; housekeeping
   1DC1 A5 50         [ 3]  281         lda     RAM_50
   1DC3 D0 F9         [ 4]  282         bne     $11
                            283 
                            284 ; Wait for 160ms of consecutive zero crossings
   1DC5                     285 $12:
   1DC5 20 8D 1E      [ 6]  286         jsr     TUPDATE                                 ; housekeeping
   1DC8 AD 02 03      [ 4]  287         lda     transport_periph$ddr_reg_b
   1DCB 6A            [ 2]  288         ror     a
   1DCC 90 F7         [ 4]  289         bcc     $12
   1DCE A9 A0         [ 2]  290         lda     #0xA0                                   ; 160 msec
   1DD0 85 50         [ 3]  291         sta     RAM_50
   1DD2                     292 $13:
   1DD2 20 8D 1E      [ 6]  293         jsr     TUPDATE                                 ; housekeeping
   1DD5 AD 02 03      [ 4]  294         lda     transport_periph$ddr_reg_b
   1DD8 6A            [ 2]  295         ror     a
   1DD9 90 EA         [ 4]  296         bcc     $12
   1DDB A5 50         [ 3]  297         lda     RAM_50
   1DDD D0 F3         [ 4]  298         bne     $13
   1DDF 60            [ 6]  299         rts
                            300 ;
                            301 ;       Play a track
                            302 ;
   1DE0                     303 PLAYTRK:
   1DE0 AD 00 03      [ 4]  304         lda     transport_periph$ddr_reg_a
   1DE3 A9 40         [ 2]  305         lda     #0x40
   1DE5 85 82         [ 3]  306         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1DE7 85 86         [ 3]  307         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1DE9 85 8A         [ 3]  308         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1DEB 85 8E         [ 3]  309         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   1DED A9 3C         [ 2]  310         lda     #0x3C
   1DEF 8D 81 03      [ 4]  311         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   1DF2 A9 34         [ 2]  312         lda     #0x34
   1DF4 8D 83 03      [ 4]  313         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   1DF7 A9 60         [ 2]  314         lda     #0x60
   1DF9 85 82         [ 3]  315         sta     board_1_periph$ddr_reg_b                ; ???
   1DFB                     316 $14:
   1DFB AD 02 03      [ 4]  317         lda     transport_periph$ddr_reg_b
   1DFE 4A            [ 2]  318         lsr     a
   1DFF 90 11         [ 4]  319         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   1E01 20 1A 1F      [ 6]  320         jsr     AGCUPD                                  ; do AGC Mic Logic
   1E04 20 8D 1E      [ 6]  321         jsr     TUPDATE                                 ; housekeeping
   1E07 AD 01 03      [ 4]  322         lda     transport_control_reg_a                 ; Did we get a byte?
   1E0A 10 EF         [ 4]  323         bpl     $14                                     ; No, loop
   1E0C 20 24 1E      [ 6]  324         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   1E0F 4C FB 1D      [ 3]  325         jmp     $14
                            326 
                            327 ;       Lost carrier - wait 100 msec for more data before giving up
   1E12                     328 LOSTCD:
   1E12 A9 64         [ 2]  329         lda     #0x64                                   ; 100 msec
   1E14 85 50         [ 3]  330         sta     RAM_50
   1E16                     331 $15:
   1E16 20 8D 1E      [ 6]  332         jsr     TUPDATE
   1E19 AD 02 03      [ 4]  333         lda     transport_periph$ddr_reg_b
   1E1C 4A            [ 2]  334         lsr     a
   1E1D B0 C1         [ 4]  335         bcs     PLAYTRK                                 ; carrier
   1E1F A5 50         [ 3]  336         lda     RAM_50
   1E21 D0 F3         [ 4]  337         bne     $15
   1E23 60            [ 6]  338         rts
                            339 ;
                            340 ; Protocol handler
                            341 ;
   1E24                     342 PROTOHAND:
   1E24 AD 00 03      [ 4]  343         lda     transport_periph$ddr_reg_a
   1E27 29 7F         [ 2]  344         and     #0x7F                                   ; insure data is ASCII
   1E29 85 5C         [ 3]  345         sta     RAM_5C                                  ; store it here
   1E2B 29 7E         [ 2]  346         and     #0x7E                                   ; ignore bottom bit
   1E2D C9 22         [ 2]  347         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1E2F F0 3A         [ 4]  348         beq     PROCCHNL                                ; if so, process as channel
   1E31 C9 32         [ 2]  349         cmp     #0x32                                   ; is it < 0x32 ?
   1E33 90 4F         [ 4]  350         bcc     $18                                     ; ignore it
   1E35 C9 3A         [ 2]  351         cmp     #0x3A                                   ; is it < 0x3A
   1E37 90 32         [ 4]  352         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   1E39 A5 5C         [ 3]  353         lda     RAM_5C
   1E3B C9 41         [ 2]  354         cmp     #0x41                                   ; is it < 0x41?
   1E3D 90 45         [ 4]  355         bcc     $18                                     ; ignore it
   1E3F C9 51         [ 2]  356         cmp     #0x51                                   ; is it >= 0x51?
   1E41 B0 41         [ 4]  357         bcs     $18                                     ; ignore it
   1E43 A6 64         [ 3]  358         ldx     RAM_64                                  ; X = current board address
   1E45 38            [ 2]  359         sec                                             ; (it's 0x41 to 0x50)
   1E46 E9 41         [ 2]  360         sbc     #0x41                                   ; subtract 0x41
   1E48 C9 08         [ 2]  361         cmp     #0x08
   1E4A 90 02         [ 4]  362         bcc     $16                                     ; process as command
   1E4C E8            [ 2]  363         inx
   1E4D E8            [ 2]  364         inx
   1E4E                     365 $16:
   1E4E 29 07         [ 2]  366         and     #0x07                                   ; lookup bitmask in A
   1E50 A8            [ 2]  367         tay
   1E51 B9 85 1E      [ 5]  368         lda     MASKTBL,y
   1E54 85 5D         [ 3]  369         sta     RAM_5D                                  ; store mask in RAM_5D
   1E56 A5 5E         [ 3]  370         lda     RAM_5E
   1E58 4A            [ 2]  371         lsr     a                                       ; get on/off in carry
   1E59 B0 09         [ 4]  372         bcs     $17                                     ; if on, jump
   1E5B A5 5D         [ 3]  373         lda     RAM_5D
   1E5D 49 FF         [ 2]  374         eor     #0xFF
   1E5F 35 00         [ 4]  375         and     RAM_start,x
   1E61 95 00         [ 4]  376         sta     RAM_start,x                             ; turn off solenoid
   1E63 60            [ 6]  377         rts
                            378 ;
   1E64                     379 $17:
   1E64 A5 5D         [ 3]  380         lda     RAM_5D
   1E66 15 00         [ 4]  381         ora     RAM_start,x
   1E68 95 00         [ 4]  382         sta     RAM_start,x                             ; turn on solenoid
   1E6A 60            [ 6]  383         rts
                            384 ;
   1E6B                     385 PROCCHNL:
   1E6B A5 5C         [ 3]  386         lda     RAM_5C                                  ; put channel byte in RAM_5E
   1E6D 85 5E         [ 3]  387         sta     RAM_5E
   1E6F 29 7E         [ 2]  388         and     #0x7E
   1E71 C9 22         [ 2]  389         cmp     #0x22
   1E73 D0 05         [ 4]  390         bne     CONVCHNL
   1E75 A9 98         [ 2]  391         lda     #0x98                                   ; process 0x22 or 0x23
   1E77 85 64         [ 3]  392         sta     RAM_64                                  ; set this to 0x98 - board 7
   1E79 60            [ 6]  393         rts
                            394 ;
   1E7A                     395 CONVCHNL:
   1E7A 38            [ 2]  396         sec                                             ; process channel
   1E7B E9 32         [ 2]  397         sbc     #0x32
   1E7D 0A            [ 2]  398         asl     a
   1E7E 18            [ 2]  399         clc
   1E7F 69 80         [ 2]  400         adc     #0x80
   1E81 85 64         [ 3]  401         sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
   1E83 60            [ 6]  402         rts
   1E84                     403 $18:
   1E84 60            [ 6]  404         rts
                            405 ;
                            406 ; bit mask table
                            407 ;
   1E85                     408 MASKTBL:
   1E85 01 02 04 08         409         .db     0x01,0x02,0x04,0x08
   1E89 10 20 40 80         410         .db     0x10,0x20,0x40,0x80
                            411 ;
                            412 ;       Housekeeping routine
                            413 ;       RAM_50 used on entry
                            414 ;
   1E8D                     415 TUPDATE:
   1E8D AD 05 02      [ 4]  416         lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
   1E90 85 5F         [ 3]  417         sta     RAM_5F                                  ; store this state in 5F
   1E92 F0 3C         [ 4]  418         beq     TEXIT                                   ; No flags set, return
   1E94 29 40         [ 2]  419         and     #0x40                                   ; PROG pushed?
   1E96 F0 04         [ 4]  420         beq     $20                                     ; if not, check if timer expired
   1E98 A9 01         [ 2]  421         lda     #0x01
   1E9A 85 5A         [ 3]  422         sta     RAM_5A                                  ; Mark as started
   1E9C                     423 $20:
   1E9C A5 5F         [ 3]  424         lda     RAM_5F                                  ; check timer irq bit
   1E9E 10 30         [ 4]  425         bpl     TEXIT                                   ; if timer not expired, return
                            426 ; Adjust Timer routine
   1EA0 AD 04 02      [ 4]  427         lda     U18_timer                               ; read timer in U18
   1EA3 49 FF         [ 2]  428         eor     #0xFF                                   ; flip the bits
   1EA5 4A            [ 2]  429         lsr     a                                       ; keep the top 5 bits
   1EA6 4A            [ 2]  430         lsr     a
   1EA7 4A            [ 2]  431         lsr     a
   1EA8 85 57         [ 3]  432         sta     RAM_57                                  ; store them
   1EAA 90 02         [ 4]  433         bcc     $21                                     ; bcc on timer bit D2
   1EAC E6 57         [ 5]  434         inc     RAM_57                                  ; round up?
                            435                                                         ; now RAM_57 has the number of 8us 
                            436                                                         ;   intervals since timer expired
   1EAE                     437 $21:
   1EAE A9 7A         [ 2]  438         lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
   1EB0 38            [ 2]  439         sec                                             ; with programming delays, this is 1 msec
   1EB1 E5 57         [ 3]  440         sbc     RAM_57
   1EB3 8D 15 02      [ 4]  441         sta     U18_timer_8T_DI                         ; set timer
   1EB6 C6 50         [ 5]  442         dec     RAM_50                                  ; decrement these timers every timer reset (1ms)
   1EB8 C6 51         [ 5]  443         dec     RAM_51
   1EBA C6 52         [ 5]  444         dec     RAM_52
   1EBC C6 53         [ 5]  445         dec     RAM_53
   1EBE D0 10         [ 4]  446         bne     TEXIT                                   ; if timer RAM_53 expires, then wrap to 100
   1EC0 A9 64         [ 2]  447         lda     #0x64                                   ; 100
   1EC2 85 53         [ 3]  448         sta     RAM_53
   1EC4 C6 54         [ 5]  449         dec     RAM_54
   1EC6 C6 55         [ 5]  450         dec     RAM_55
   1EC8 D0 06         [ 4]  451         bne     TEXIT                                   ; if timer RAM_55 expires, then wrap to 100
   1ECA A9 64         [ 2]  452         lda     #0x64                                   ; 100
   1ECC 85 55         [ 3]  453         sta     RAM_55
   1ECE C6 56         [ 5]  454         dec     RAM_56
   1ED0                     455 TEXIT:
   1ED0 60            [ 6]  456         rts
                            457 ;
                            458 ;       Read the AGC mic level
                            459 ;       Take the average of 8 samples, and put it into RAM_60 (range is 0 to 8)
                            460 ;
   1ED1                     461 AGCMICRD:
   1ED1 A9 00         [ 2]  462         lda     #0x00
   1ED3 85 61         [ 3]  463         sta     RAM_61                                  ; init final agc value
   1ED5 85 62         [ 3]  464         sta     RAM_62                                  ; init agc sample counter
   1ED7 A9 0A         [ 2]  465         lda     #0x0A
   1ED9 85 54         [ 3]  466         sta     RAM_54                                  ; Start a 1 second timer
   1EDB A9 64         [ 2]  467         lda     #0x64
   1EDD 85 53         [ 3]  468         sta     RAM_53
   1EDF                     469 $23:
   1EDF 20 8D 1E      [ 6]  470         jsr     TUPDATE                                 ; housekeeping
   1EE2 A5 54         [ 3]  471         lda     RAM_54
   1EE4 D0 F9         [ 4]  472         bne     $23                                     ; if 1 sec, do housekeeping
   1EE6 A9 0A         [ 2]  473         lda     #0x0A
   1EE8 85 54         [ 3]  474         sta     RAM_54
   1EEA A9 64         [ 2]  475         lda     #0x64
   1EEC 85 53         [ 3]  476         sta     RAM_53                                  ; reset timer
   1EEE A5 62         [ 3]  477         lda     RAM_62
   1EF0 C9 08         [ 2]  478         cmp     #0x08                                   ; 8 samples?
   1EF2 F0 15         [ 4]  479         beq     $27                                     ; yes - jump to final calculation
   1EF4 E6 62         [ 5]  480         inc     RAM_62                                  ; increment the sample counter
   1EF6 A2 09         [ 2]  481         ldx     #0x09
   1EF8 38            [ 2]  482         sec
   1EF9 AD 80 03      [ 4]  483         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1EFC                     484 $24:                                                    ; read the most significant high bit
   1EFC 2A            [ 2]  485         rol     a
   1EFD CA            [ 2]  486         dex
   1EFE 90 FC         [ 4]  487         bcc     $24
   1F00 18            [ 2]  488         clc
   1F01 8A            [ 2]  489         txa                                             ; 8=high bit7, 0=no high bits
   1F02 65 61         [ 3]  490         adc     RAM_61                                  ; add it into RAM_61 (do this 8 times)
   1F04 85 61         [ 3]  491         sta     RAM_61
   1F06 4C DF 1E      [ 3]  492         jmp     $23
                            493 ;
   1F09                     494 $27:
   1F09 46 61         [ 5]  495         lsr     RAM_61                                  ; divide by 8 (average of 8 samples)
   1F0B 46 61         [ 5]  496         lsr     RAM_61
   1F0D 46 61         [ 5]  497         lsr     RAM_61
   1F0F A5 61         [ 3]  498         lda     RAM_61
   1F11 85 60         [ 3]  499         sta     RAM_60                                  ; store agc value in RAM_60
   1F13 A9 00         [ 2]  500         lda     #0x00
   1F15 85 61         [ 3]  501         sta     RAM_61                                  ; clear these 2 and return
   1F17 85 62         [ 3]  502         sta     RAM_62
   1F19 60            [ 6]  503         rts
                            504 ;
                            505 ;        Do AGC Mic Logic
                            506 ;
   1F1A                     507 AGCUPD:
   1F1A AD 80 02      [ 4]  508         lda     U19_PORTA                               ; read AGC knob
   1F1D 49 FF         [ 2]  509         eor     #0xFF                                   ; invert the bits
   1F1F 4A            [ 2]  510         lsr     a                                       ; get into lower nibble
   1F20 4A            [ 2]  511         lsr     a
   1F21 4A            [ 2]  512         lsr     a
   1F22 4A            [ 2]  513         lsr     a
   1F23 18            [ 2]  514         clc
   1F24 65 60         [ 3]  515         adc     RAM_60                                  ; add audio level to it
   1F26 AA            [ 2]  516         tax
   1F27 BD 4D 1F      [ 5]  517         lda     AGCTABLE,x                              ; and get the table value
   1F2A 85 63         [ 3]  518         sta     RAM_63                                  ; store this value in RAM_63
   1F2C A5 52         [ 3]  519         lda     RAM_52                                  ; 10ms timer expired?
   1F2E D0 16         [ 4]  520         bne     $26                                     ; no, just update CPU Leds
   1F30 A9 0A         [ 2]  521         lda     #0x0A
   1F32 85 52         [ 3]  522         sta     RAM_52                                  ; restart 10ms timer
   1F34 A5 63         [ 3]  523         lda     RAM_63                                  ; every 10ms, adjust gain by 1 if needed
   1F36 CD 82 03      [ 4]  524         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   1F39 90 08         [ 4]  525         bcc     $25
   1F3B F0 09         [ 4]  526         beq     $26
   1F3D EE 82 03      [ 6]  527         inc     audio_periph$ddr_reg_b                  ; increase value
   1F40 4C 46 1F      [ 3]  528         jmp     $26
                            529 ;
   1F43                     530 $25:
   1F43 CE 82 03      [ 6]  531         dec     audio_periph$ddr_reg_b                  ; decrease value
   1F46                     532 $26:
   1F46 AD 82 03      [ 4]  533         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   1F49 8D 82 02      [ 4]  534         sta     U19_PORTB
   1F4C 60            [ 6]  535         rts
                            536 ;
                            537 ;       AGC table
                            538 ;
   1F4D                     539 AGCTABLE:
   1F4D 03 04 06 08         540         .db     0x03, 0x04, 0x06, 0x08
   1F51 10 16 20 2D         541         .db     0x10, 0x16, 0x20, 0x2D
   1F55 40 5A 80 BF         542         .db     0x40, 0x5A, 0x80, 0xBF
   1F59 FF FF FF FF         543         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F5D FF                  544         .db     0xFF
                            545 ;
                            546 ; all zeros in this gap
                            547 ;
   1FFA                     548         .org    0x1FFA
                            549 ;
                            550 ; vectors
                            551 ;
   1FFA                     552 NMIVEC:
   1FFA 00 00               553         .dw     RAM_start
   1FFC                     554 RESETVEC:
   1FFC 00 1C               555         .dw     RESET
   1FFE                     556 IRQVEC:
   1FFE 00 00               557         .dw     RAM_start
