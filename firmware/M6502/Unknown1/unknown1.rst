                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       The Beagles/King Program
                              7 ;       Version Unknown - Newer?
                              8 ;
                              9 ;       AGC mic logic included
                             10 ;       "Double seek" to find next track marker
                             11 ;       Bug Fixes:
                             12 ;           Don't queue PROG button presses
                             13 ;           Make sure serial command mode is reset between tracks
                             14 ;           Serial protocol can't activate bits 14 and 15 on boards
                             15 ;       Unified TAPECMD routine
                             16 ;
                             17 ;       This image was recovered from the last quarter of a 2732 with a black label
                             18 ;
                             19 
                     0050    20 RAM_50  = 0x0050    ; decremented every 1ms
                     0051    21 RAM_51  = 0x0051    ; decremented every 1ms
                     0052    22 RAM_52  = 0x0052    ; decremented every 1ms
                     0053    23 RAM_53  = 0x0053    ; decremented every 1ms, resets to 100
                     0054    24 RAM_54  = 0x0054    ; decremented every 0.1s
                     0055    25 RAM_55  = 0x0055    ; decremented every 0.1s, resets to 100
                     0056    26 RAM_56  = 0x0056    ; decremented every 10s
                     0057    27 RAM_57  = 0x0057    ; temp timer storage
                     0058    28 RAM_58  = 0x0058    ; zero crossing counter
                     0059    29 RAM_59  = 0x0059    ; track counter
                     005A    30 RAM_5A  = 0x005A    ; number of PROG button presses
                     005B    31 RAM_5B  = 0x005B    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
                     005C    32 RAM_5C  = 0x005C    ; storage for incoming serial byte (& 0x7F)
                     005D    33 RAM_5D  = 0x005D    ; bitmask for solenoids
                     005E    34 RAM_5E  = 0x005E    ; current channel serial byte
                     005F    35 RAM_5F  = 0x005F    ; temp timer storage
                     0060    36 RAM_60  = 0x0060    ; agc mic level
                     0061    37 RAM_61  = 0x0061    ; agc mic level accumulator
                     0062    38 RAM_62  = 0x0062    ; agc mic sample counter
                     0063    39 RAM_63  = 0x0063    ; agc calculated gain value
                     0064    40 RAM_64  = 0x0064    ; current channel port address
                             41 
                             42         .include "../include/ptt6502.def"
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
                             43 
   1C00                      44         .org    0x1C00
                             45 ;
   1C00                      46 RESET:
   1C00 D8            [ 2]   47         cld                                             ; No decimal mode
   1C01 78            [ 2]   48         sei                                             ; Interrupts are not used
   1C02 A2 F0         [ 2]   49         ldx     #0xF0                                   ; Stack is at 0x01F0
   1C04 9A            [ 2]   50         txs
   1C05 A9 00         [ 2]   51         lda     #0x00                                   ; Clear RAM
   1C07 A2 10         [ 2]   52         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1C09                      53 ZERORAM:
   1C09 95 00         [ 4]   54         sta     RAM_start,x
   1C0B E8            [ 2]   55         inx
   1C0C E0 80         [ 2]   56         cpx     #0x80
   1C0E D0 F9         [ 4]   57         bne     ZERORAM
   1C10 A9 00         [ 2]   58         lda     #0x00                                   ; Initialize these registers to 0x00
   1C12 8D 01 03      [ 4]   59         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   1C15 8D 00 03      [ 4]   60         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1C18 8D 81 03      [ 4]   61         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1C1B 8D 80 03      [ 4]   62         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1C1E 8D 83 03      [ 4]   63         sta     audio_control_reg_b                     ; Clear audio control B
   1C21 8D 05 02      [ 4]   64         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   1C24 8D 03 03      [ 4]   65         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1C27 8D 01 02      [ 4]   66         sta     U18_DDRA                                ; Buttons are inputs
   1C2A A9 02         [ 2]   67         lda     #0x02
   1C2C 8D 81 02      [ 4]   68         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   1C2F A9 FF         [ 2]   69         lda     #0xFF
   1C31 8D 82 03      [ 4]   70         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1C34 8D 03 02      [ 4]   71         sta     U18_DDRB                                ; Button lights are outputs
   1C37 8D 83 02      [ 4]   72         sta     U19_DDRB                                ; CPU card lights are outputs
   1C3A A9 FC         [ 2]   73         lda     #0xFC
   1C3C 8D 02 03      [ 4]   74         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   1C3F A9 2E         [ 2]   75         lda     #0x2E
   1C41 8D 01 03      [ 4]   76         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1C44 8D 03 03      [ 4]   77         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1C47 A9 3C         [ 2]   78         lda     #0x3C
   1C49 8D 81 03      [ 4]   79         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   1C4C 8D 83 03      [ 4]   80         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   1C4F A9 64         [ 2]   81         lda     #0x64
   1C51 85 53         [ 3]   82         sta     RAM_53                                  ; 100 - init 1 msec master counter
   1C53 A9 1E         [ 2]   83         lda     #0x1E
   1C55 85 56         [ 3]   84         sta     RAM_56                                  ; Init a 5 minute timer
   1C57 A9 64         [ 2]   85         lda     #0x64
   1C59 85 55         [ 3]   86         sta     RAM_55                                  ; 100 - init 0.1 sec master counter
   1C5B A9 10         [ 2]   87         lda     #0x10                                   ; 16
   1C5D 85 63         [ 3]   88         sta     RAM_63                                  ; Set initial AGC gain value
   1C5F A9 10         [ 2]   89         lda     #TAPEMODE_STOP
   1C61 20 72 1D      [ 6]   90         jsr     TAPECMD                                 ; STOP tape
   1C64 A9 28         [ 2]   91         lda     #0x28                                   ; this will count 4 seconds
   1C66 85 54         [ 3]   92         sta     RAM_54
   1C68 A9 64         [ 2]   93         lda     #0x64                                   ; reset master timer
   1C6A 85 53         [ 3]   94         sta     RAM_53
   1C6C                      95 $1:
   1C6C 20 83 1E      [ 6]   96         jsr     TUPDATE                                 ; do not much for 4 seconds
   1C6F A5 54         [ 3]   97         lda     RAM_54
   1C71 D0 F9         [ 4]   98         bne     $1
   1C73                      99 REWIND:
   1C73 A9 40         [ 2]  100         lda     #TAPEMODE_REWIND
   1C75 20 72 1D      [ 6]  101         jsr     TAPECMD                                 ; REWIND tape
   1C78                     102 $22:
   1C78 A9 00         [ 2]  103         lda     #0x00
   1C7A 85 58         [ 3]  104         sta     RAM_58                                  ; counter to zero
                            105 ; Look for the long tone at the beginning of tape
   1C7C                     106 $2:
   1C7C AD 02 03      [ 4]  107         lda     transport_periph$ddr_reg_b
   1C7F A9 0A         [ 2]  108         lda     #0x0A
   1C81 85 50         [ 3]  109         sta     RAM_50                                  ; set a 10ms timer
   1C83 E6 58         [ 5]  110         inc     RAM_58                                  ; inc transition counter
   1C85 A5 58         [ 3]  111         lda     RAM_58
   1C87 C9 64         [ 2]  112         cmp     #0x64
   1C89 B0 0F         [ 4]  113         bcs     FINDTRK                                 ; if we got 100 without a 10ms break, go forward
   1C8B                     114 $3:
   1C8B 20 83 1E      [ 6]  115         jsr     TUPDATE                                 ; housekeeping
   1C8E A5 50         [ 3]  116         lda     RAM_50
   1C90 F0 E6         [ 4]  117         beq     $22
   1C92 AD 03 03      [ 4]  118         lda     transport_control_reg_b                 ; did we get a rising edge?
   1C95 10 F4         [ 4]  119         bpl     $3                                      ; no, keep looping
   1C97 4C 7C 1C      [ 3]  120         jmp     $2                                      ; yes, increment counter
                            121 ;
   1C9A                     122 FINDTRK:
   1C9A A9 20         [ 2]  123         lda     #TAPEMODE_FFWD
   1C9C 20 72 1D      [ 6]  124         jsr     TAPECMD                                 ; FFWD tape
   1C9F A9 19         [ 2]  125         lda     #0x19
   1CA1 85 54         [ 3]  126         sta     RAM_54                                  ; 2.5 secs
   1CA3 A9 64         [ 2]  127         lda     #0x64
   1CA5 85 53         [ 3]  128         sta     RAM_53
   1CA7                     129 $5:
   1CA7 20 83 1E      [ 6]  130         jsr     TUPDATE                                 ; do housekeeping stuff
   1CAA A5 54         [ 3]  131         lda     RAM_54
   1CAC D0 F9         [ 4]  132         bne     $5
   1CAE A9 00         [ 2]  133         lda     #0x00
   1CB0 85 59         [ 3]  134         sta     RAM_59
   1CB2 20 8D 1D      [ 6]  135         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CB5 A9 40         [ 2]  136         lda     #TAPEMODE_REWIND
   1CB7 20 72 1D      [ 6]  137         jsr     TAPECMD                                 ; REWIND tape
   1CBA 20 8D 1D      [ 6]  138         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CBD A9 FA         [ 2]  139         lda     #0xFA
   1CBF 85 50         [ 3]  140         sta     RAM_50
   1CC1                     141 $30:
   1CC1 20 83 1E      [ 6]  142         jsr     TUPDATE                                 ; housekeeping
   1CC4 A5 50         [ 3]  143         lda     RAM_50
   1CC6 D0 F9         [ 4]  144         bne     $30                                     ; delay for 250 ms
   1CC8 A9 20         [ 2]  145         lda     #TAPEMODE_FFWD
   1CCA 20 72 1D      [ 6]  146         jsr     TAPECMD                                 ; FFWD tape
   1CCD 20 8D 1D      [ 6]  147         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1CD0 E6 59         [ 5]  148         inc     RAM_59
   1CD2 A9 10         [ 2]  149         lda     #TAPEMODE_STOP
   1CD4 20 72 1D      [ 6]  150         jsr     TAPECMD                                 ; STOP tape
   1CD7 A9 80         [ 2]  151         lda     #TAPEMODE_PLAY
   1CD9 20 72 1D      [ 6]  152         jsr     TAPECMD                                 ; PLAY tape
   1CDC 20 B0 1D      [ 6]  153         jsr     WAITCD                                  ; wait for carrier
   1CDF A9 10         [ 2]  154         lda     #TAPEMODE_STOP
   1CE1 20 72 1D      [ 6]  155         jsr     TAPECMD                                 ; STOP Tape
   1CE4 20 3F 1D      [ 6]  156         jsr     INITBRDS
   1CE7                     157 WAITPLAY:
   1CE7 4C 68 1F      [ 3]  158         jmp     CALLP1                                  ; code patch - dont queue PROG button presses
                            159 ;
   1CEA                     160 RETP1:
   1CEA 20 24 1F      [ 6]  161         jsr     AGCUPD                                  ; do AGC Mic Logic
   1CED A5 5A         [ 3]  162         lda     RAM_5A                                  ; wait until we are triggered
   1CEF D0 10         [ 4]  163         bne     STARTPLAY                               ; then jump
   1CF1 A9 02         [ 2]  164         lda     #0x02                                   ; else
   1CF3 8D 80 02      [ 4]  165         sta     U19_PORTA                               ; turn on RESET button light
   1CF6 A9 00         [ 2]  166         lda     #0x00
   1CF8 8D 02 02      [ 4]  167         sta     U18_PORTB                               ; turn on all other button lights
   1CFB 4C E7 1C      [ 3]  168         jmp     WAITPLAY                                ; keep looping
                            169 ;
   1CFE EA            [ 2]  170         nop
   1CFF EA            [ 2]  171         nop
   1D00 EA            [ 2]  172         nop
                            173 ;   we have been started!
   1D01                     174 STARTPLAY:
   1D01 20 3F 1D      [ 6]  175         jsr     INITBRDS                                ; init the boards
   1D04 A9 00         [ 2]  176         lda     #0x00
   1D06 8D 80 02      [ 4]  177         sta     U19_PORTA                               ; turn off RESET button light
   1D09 A9 80         [ 2]  178         lda     #0x80
   1D0B 8D 02 02      [ 4]  179         sta     U18_PORTB                               ; turn off all but PROG light
   1D0E A9 80         [ 2]  180         lda     #TAPEMODE_PLAY
   1D10 20 72 1D      [ 6]  181         jsr     TAPECMD                                 ; PLAY tape
   1D13 20 B0 1D      [ 6]  182         jsr     WAITCD                                  ; wait for carrier
   1D16 C6 5A         [ 5]  183         dec     RAM_5A                                  ; no longer triggered
   1D18 20 D6 1D      [ 6]  184         jsr     PLAYTRK                                 ; play a track!
   1D1B 20 3F 1D      [ 6]  185         jsr     INITBRDS                                ; init the boards
   1D1E A9 1E         [ 2]  186         lda     #0x1E
   1D20 85 56         [ 3]  187         sta     RAM_56                                  ; set a 5 min timer
   1D22 A9 64         [ 2]  188         lda     #0x64
   1D24 85 55         [ 3]  189         sta     RAM_55
   1D26 E6 59         [ 5]  190         inc     RAM_59                                  ; track counter
   1D28 A5 59         [ 3]  191         lda     RAM_59
   1D2A C9 1A         [ 2]  192         cmp     #0x1A                                   ; 26?
   1D2C 90 03         [ 4]  193         bcc     NEXTTRK
   1D2E 4C 73 1C      [ 3]  194         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            195 ; go to next track
   1D31                     196 NEXTTRK:
   1D31 20 B0 1D      [ 6]  197         jsr     WAITCD                                  ; wait for carrier
   1D34 A9 10         [ 2]  198         lda     #TAPEMODE_STOP
   1D36 20 72 1D      [ 6]  199         jsr     TAPECMD                                 ; STOP tape
   1D39 20 DB 1E      [ 6]  200         jsr     AGCMICRD                                ; Read the AGC mic level
   1D3C 4C E7 1C      [ 3]  201         jmp     WAITPLAY
                            202 ;
                            203 ;       Init boards
                            204 ;
   1D3F                     205 INITBRDS:
   1D3F A9 3C         [ 2]  206         lda     #0x3C
   1D41 8D 83 03      [ 4]  207         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1D44 A9 34         [ 2]  208         lda     #0x34
   1D46 8D 81 03      [ 4]  209         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1D49 A2 00         [ 2]  210         ldx     #0x00
   1D4B                     211 NEXTBRD:
   1D4B A9 30         [ 2]  212         lda     #0x30
   1D4D 95 81         [ 4]  213         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1D4F 95 83         [ 4]  214         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1D51 A9 FF         [ 2]  215         lda     #0xFF
   1D53 95 80         [ 4]  216         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1D55 95 82         [ 4]  217         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1D57 A9 34         [ 2]  218         lda     #0x34
   1D59 95 81         [ 4]  219         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1D5B 95 83         [ 4]  220         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1D5D A9 00         [ 2]  221         lda     #0x00
   1D5F 95 80         [ 4]  222         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1D61 95 82         [ 4]  223         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1D63 E8            [ 2]  224         inx
   1D64 E8            [ 2]  225         inx
   1D65 E8            [ 2]  226         inx
   1D66 E8            [ 2]  227         inx
   1D67 E0 20         [ 2]  228         cpx     #0x20                                   ; do for boards 1-8
   1D69 90 E0         [ 4]  229         bcc     NEXTBRD
   1D6B A9 00         [ 2]  230         lda     #0x00                                   ; bug fix!
   1D6D 85 5E         [ 3]  231         sta     RAM_5E                                  ; reset current channel serial byte
   1D6F 85 64         [ 3]  232         sta     RAM_64                                  ; reset current channel port address
   1D71 60            [ 6]  233         rts
                            234 ;
                            235 ;       Send Transport command for 0.250 sec
                            236 ;       (Unified)
                            237 ;
   1D72                     238 TAPECMD:
   1D72 8D 02 03      [ 4]  239         sta     transport_periph$ddr_reg_b              ; enable output line
   1D75 A9 FA         [ 2]  240         lda     #0xFA
   1D77 85 50         [ 3]  241         sta     RAM_50
   1D79                     242 $6:
   1D79 20 83 1E      [ 6]  243         jsr     TUPDATE                                 ; check for PROG button push
   1D7C A5 50         [ 3]  244         lda     RAM_50
   1D7E D0 F9         [ 4]  245         bne     $6
   1D80 AD 02 03      [ 4]  246         lda     transport_periph$ddr_reg_b
   1D83 29 60         [ 2]  247         and     #TAPEMODE_REWIND | #TAPEMODE_FFWD       ; Is it a REWIND or FFWD?
   1D85 D0 05         [ 4]  248         bne     $31                                     ; Yes, go to exit
   1D87 A9 00         [ 2]  249         lda     #0x00                                   ; else unassert STOP or PLAY
   1D89 8D 02 03      [ 4]  250         sta     transport_periph$ddr_reg_b              ; and then exit
   1D8C                     251 $31:
   1D8C 60            [ 6]  252         rts
                            253 ;
                            254 ;       Wait for tone during Fast Forward, signaling beginning of track
                            255 ;       (50Hz or above, for 33 zero crossing) 
                            256 ;
   1D8D                     257 WAITTONE:
   1D8D A9 00         [ 2]  258         lda     #0x00
   1D8F 85 58         [ 3]  259         sta     RAM_58
   1D91                     260 $8:
   1D91 AD 02 03      [ 4]  261         lda     transport_periph$ddr_reg_b
   1D94 A9 0A         [ 2]  262         lda     #0x0A
   1D96 85 50         [ 3]  263         sta     RAM_50                                  ; 10 msec
   1D98 E6 58         [ 5]  264         inc     RAM_58
   1D9A A5 58         [ 3]  265         lda     RAM_58
   1D9C C9 21         [ 2]  266         cmp     #0x21                                   ; wait for 33 rising edges, each within 10ms window
   1D9E B0 0F         [ 4]  267         bcs     $10                                     ; timeout - exit
   1DA0                     268 $9:
   1DA0 20 83 1E      [ 6]  269         jsr     TUPDATE                                 ; housekeeping
   1DA3 A5 50         [ 3]  270         lda     RAM_50
   1DA5 F0 E6         [ 4]  271         beq     WAITTONE                                ; 10 msec done yet? then loop
   1DA7 AD 03 03      [ 4]  272         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1DAA 10 F4         [ 4]  273         bpl     $9                                      ; if not, extend the looping
   1DAC 4C 91 1D      [ 3]  274         jmp     $8                                      ; else loop but keep timeout going
   1DAF                     275 $10:
   1DAF 60            [ 6]  276         rts
                            277 ;
                            278 ;       Wait for carrier / start of data
                            279 ;
                            280 
                            281 ; Wait for 250ms
   1DB0                     282 WAITCD:
   1DB0 A9 FA         [ 2]  283         lda     #0xFA
   1DB2 85 50         [ 3]  284         sta     RAM_50                                  ; 250 msec
   1DB4                     285 $11:
   1DB4 20 83 1E      [ 6]  286         jsr     TUPDATE                                 ; housekeeping
   1DB7 A5 50         [ 3]  287         lda     RAM_50
   1DB9 D0 F9         [ 4]  288         bne     $11
                            289 
                            290 ; Wait for 160ms of consecutive zero crossings
   1DBB                     291 $12:
   1DBB 20 83 1E      [ 6]  292         jsr     TUPDATE                                 ; housekeeping
   1DBE AD 02 03      [ 4]  293         lda     transport_periph$ddr_reg_b
   1DC1 6A            [ 2]  294         ror     a
   1DC2 90 F7         [ 4]  295         bcc     $12
   1DC4 A9 A0         [ 2]  296         lda     #0xA0                                   ; 160 msec
   1DC6 85 50         [ 3]  297         sta     RAM_50
   1DC8                     298 $13:
   1DC8 20 83 1E      [ 6]  299         jsr     TUPDATE                                 ; housekeeping
   1DCB AD 02 03      [ 4]  300         lda     transport_periph$ddr_reg_b
   1DCE 6A            [ 2]  301         ror     a
   1DCF 90 EA         [ 4]  302         bcc     $12
   1DD1 A5 50         [ 3]  303         lda     RAM_50
   1DD3 D0 F3         [ 4]  304         bne     $13
   1DD5 60            [ 6]  305         rts
                            306 ;
                            307 ;       Play a track
                            308 ;
   1DD6                     309 PLAYTRK:
   1DD6 AD 00 03      [ 4]  310         lda     transport_periph$ddr_reg_a
   1DD9 A9 40         [ 2]  311         lda     #0x40
   1DDB 85 82         [ 3]  312         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1DDD 85 86         [ 3]  313         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1DDF 85 8A         [ 3]  314         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1DE1 85 8E         [ 3]  315         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   1DE3 A9 3C         [ 2]  316         lda     #0x3C
   1DE5 8D 81 03      [ 4]  317         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   1DE8 A9 34         [ 2]  318         lda     #0x34
   1DEA 8D 83 03      [ 4]  319         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   1DED A9 60         [ 2]  320         lda     #0x60
   1DEF 85 82         [ 3]  321         sta     board_1_periph$ddr_reg_b
   1DF1                     322 $14:
   1DF1 AD 02 03      [ 4]  323         lda     transport_periph$ddr_reg_b
   1DF4 4A            [ 2]  324         lsr     a
   1DF5 90 11         [ 4]  325         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   1DF7 20 24 1F      [ 6]  326         jsr     AGCUPD                                  ; do AGC Mic Logic
   1DFA 20 83 1E      [ 6]  327         jsr     TUPDATE                                 ; housekeeping
   1DFD AD 01 03      [ 4]  328         lda     transport_control_reg_a                 ; Did we get a byte?
   1E00 10 EF         [ 4]  329         bpl     $14                                     ; No, loop
   1E02 20 1A 1E      [ 6]  330         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   1E05 4C F1 1D      [ 3]  331         jmp     $14
                            332 
                            333 ;       Lost carrier - wait 100 msec for more data before giving up
   1E08                     334 LOSTCD:
   1E08 A9 64         [ 2]  335         lda     #0x64                                   ; 100 msec
   1E0A 85 50         [ 3]  336         sta     RAM_50
   1E0C                     337 $15:
   1E0C 20 83 1E      [ 6]  338         jsr     TUPDATE
   1E0F AD 02 03      [ 4]  339         lda     transport_periph$ddr_reg_b
   1E12 4A            [ 2]  340         lsr     a
   1E13 B0 C1         [ 4]  341         bcs     PLAYTRK                                 ; carrier
   1E15 A5 50         [ 3]  342         lda     RAM_50
   1E17 D0 F3         [ 4]  343         bne     $15
   1E19 60            [ 6]  344         rts
                            345 ;
                            346 ; Protocol handler
                            347 ;
   1E1A                     348 PROTOHAND:
   1E1A AD 00 03      [ 4]  349         lda     transport_periph$ddr_reg_a
   1E1D 29 7F         [ 2]  350         and     #0x7F                                   ; insure data is ASCII
   1E1F 85 5C         [ 3]  351         sta     RAM_5C                                  ; store it here
   1E21 29 7E         [ 2]  352         and     #0x7E                                   ; ignore bottom bit
   1E23 C9 22         [ 2]  353         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1E25 F0 3A         [ 4]  354         beq     PROCCHNL                                ; if so, process as channel
   1E27 C9 32         [ 2]  355         cmp     #0x32                                   ; is it < 0x32 ?
   1E29 90 4F         [ 4]  356         bcc     $18                                     ; ignore it
   1E2B C9 3A         [ 2]  357         cmp     #0x3A                                   ; is it < 0x3A
   1E2D 90 32         [ 4]  358         bcc     PROCCHNL                                ; process as channel (0x32 to 0x39)
   1E2F A5 5C         [ 3]  359         lda     RAM_5C
   1E31 C9 41         [ 2]  360         cmp     #0x41                                   ; is it < 0x41?
   1E33 90 45         [ 4]  361         bcc     $18                                     ; ignore it
   1E35 C9 4F         [ 2]  362         cmp     #0x4F                                   ; is it >= 0x4F?
   1E37 B0 41         [ 4]  363         bcs     $18                                     ; ignore it
   1E39 A6 64         [ 3]  364         ldx     RAM_64                                  ; X = current board address
   1E3B 38            [ 2]  365         sec                                             ; (it's 0x41 to 0x4E)
   1E3C E9 41         [ 2]  366         sbc     #0x41                                   ; subtract 0x41
   1E3E C9 08         [ 2]  367         cmp     #0x08
   1E40 90 02         [ 4]  368         bcc     $16                                     ; process as command
   1E42 E8            [ 2]  369         inx
   1E43 E8            [ 2]  370         inx
   1E44                     371 $16:
   1E44 29 07         [ 2]  372         and     #0x07                                   ; lookup bitmask in A
   1E46 A8            [ 2]  373         tay
   1E47 B9 7B 1E      [ 5]  374         lda     MASKTBL,y
   1E4A 85 5D         [ 3]  375         sta     RAM_5D                                  ; store mask in RAM_5D
   1E4C A5 5E         [ 3]  376         lda     RAM_5E
   1E4E 4A            [ 2]  377         lsr     a                                       ; get on/off in carry
   1E4F B0 09         [ 4]  378         bcs     $17                                     ; if on, jump
   1E51 A5 5D         [ 3]  379         lda     RAM_5D
   1E53 49 FF         [ 2]  380         eor     #0xFF
   1E55 35 00         [ 4]  381         and     RAM_start,x
   1E57 95 00         [ 4]  382         sta     RAM_start,x                             ; turn off solenoid
   1E59 60            [ 6]  383         rts
                            384 ;
   1E5A                     385 $17:
   1E5A A5 5D         [ 3]  386         lda     RAM_5D
   1E5C 15 00         [ 4]  387         ora     RAM_start,x
   1E5E 95 00         [ 4]  388         sta     RAM_start,x                             ; turn on solenoid
   1E60 60            [ 6]  389         rts
                            390 ;
   1E61                     391 PROCCHNL:
   1E61 A5 5C         [ 3]  392         lda     RAM_5C                                  ; put channel byte in RAM_5E
   1E63 85 5E         [ 3]  393         sta     RAM_5E
   1E65 29 7E         [ 2]  394         and     #0x7E
   1E67 C9 22         [ 2]  395         cmp     #0x22
   1E69 D0 05         [ 4]  396         bne     CONVCHNL
   1E6B A9 98         [ 2]  397         lda     #0x98                                   ; process 0x22 or 0x23
   1E6D 85 64         [ 3]  398         sta     RAM_64                                  ; set this to 0x98 - board 7
   1E6F 60            [ 6]  399         rts
                            400 ;
   1E70                     401 CONVCHNL:
   1E70 38            [ 2]  402         sec                                             ; process channel
   1E71 E9 32         [ 2]  403         sbc     #0x32
   1E73 0A            [ 2]  404         asl     a
   1E74 18            [ 2]  405         clc
   1E75 69 80         [ 2]  406         adc     #0x80
   1E77 85 64         [ 3]  407         sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
   1E79 60            [ 6]  408         rts
   1E7A                     409 $18:
   1E7A 60            [ 6]  410         rts
                            411 ;
                            412 ; bit mask table
                            413 ;
   1E7B                     414 MASKTBL:
   1E7B 01 02 04 08         415         .db     0x01,0x02,0x04,0x08
   1E7F 10 20 40 80         416         .db     0x10,0x20,0x40,0x80
                            417 ;
                            418 ;       Housekeeping routine
                            419 ;       RAM_50 used on entry
                            420 ;
   1E83                     421 TUPDATE:
   1E83 AD 05 02      [ 4]  422         lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
   1E86 85 5F         [ 3]  423         sta     RAM_5F                                  ; store this state in 5F
   1E88 F0 50         [ 4]  424         beq     TEXIT                                   ; No flags set, return
   1E8A A5 5B         [ 3]  425         lda     RAM_5B                                  ; Are we already running?
   1E8C 30 0E         [ 4]  426         bmi     $19                                     ; yes, jump ahead
   1E8E A5 5F         [ 3]  427         lda     RAM_5F                                  ; else check flags
   1E90 29 40         [ 2]  428         and     #0x40                                   ; PROG pushed?
   1E92 F0 16         [ 4]  429         beq     ADJTMR                                  ; if not, go to adjust timer
   1E94 A9 80         [ 2]  430         lda     #0x80
   1E96 85 5B         [ 3]  431         sta     RAM_5B                                  ; PROG Button pushed
   1E98 A9 FA         [ 2]  432         lda     #0xFA
   1E9A 85 51         [ 3]  433         sta     RAM_51
   1E9C                     434 $19:
   1E9C A5 51         [ 3]  435         lda     RAM_51                                  ; for 250ms?
   1E9E D0 06         [ 4]  436         bne     $20                                     ; no, exit
   1EA0 A9 00         [ 2]  437         lda     #0x00
   1EA2 85 5B         [ 3]  438         sta     RAM_5B                                  ; yes, reset PROG button state
   1EA4 E6 5A         [ 5]  439         inc     RAM_5A                                  ; and mark as running
   1EA6                     440 $20:
   1EA6 A5 5F         [ 3]  441         lda     RAM_5F                                  ; check timer irq bit
   1EA8 10 30         [ 4]  442         bpl     TEXIT                                   ; if timer not expired, return
                            443 ; Adjust Timer routine
   1EAA                     444 ADJTMR:
   1EAA AD 04 02      [ 4]  445         lda     U18_timer                               ; read timer in U18
   1EAD 49 FF         [ 2]  446         eor     #0xFF                                   ; flip the bits
   1EAF 4A            [ 2]  447         lsr     a                                       ; keep the top 5 bits
   1EB0 4A            [ 2]  448         lsr     a
   1EB1 4A            [ 2]  449         lsr     a
   1EB2 85 57         [ 3]  450         sta     RAM_57                                  ; store them
   1EB4 90 02         [ 4]  451         bcc     $21                                     ; bcc on timer bit D2
   1EB6 E6 57         [ 5]  452         inc     RAM_57                                  ; round up?
                            453                                                         ; now RAM_57 has the number of 8us 
                            454                                                         ;   intervals since timer expired
   1EB8                     455 $21:
   1EB8 A9 7A         [ 2]  456         lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
   1EBA 38            [ 2]  457         sec                                             ; with programming delays, this is 1 msec
   1EBB E5 57         [ 3]  458         sbc     RAM_57
   1EBD 8D 15 02      [ 4]  459         sta     U18_timer_8T_DI                         ; set timer
   1EC0 C6 50         [ 5]  460         dec     RAM_50                                  ; decrement these timers every timer reset (1ms)
   1EC2 C6 51         [ 5]  461         dec     RAM_51
   1EC4 C6 52         [ 5]  462         dec     RAM_52
   1EC6 C6 53         [ 5]  463         dec     RAM_53
   1EC8 D0 10         [ 4]  464         bne     TEXIT                                   ; if timer RAM_53 expires, then wrap to 100
   1ECA A9 64         [ 2]  465         lda     #0x64                                   ; 100
   1ECC 85 53         [ 3]  466         sta     RAM_53
   1ECE C6 54         [ 5]  467         dec     RAM_54
   1ED0 C6 55         [ 5]  468         dec     RAM_55
   1ED2 D0 06         [ 4]  469         bne     TEXIT                                   ; if timer RAM_55 expires, then wrap to 100
   1ED4 A9 64         [ 2]  470         lda     #0x64                                   ; 100
   1ED6 85 55         [ 3]  471         sta     RAM_55
   1ED8 C6 56         [ 5]  472         dec     RAM_56
   1EDA                     473 TEXIT:
   1EDA 60            [ 6]  474         rts
                            475 ;
                            476 ;       Read the AGC mic level
                            477 ;       Take the average of 8 samples, and put it into RAM_60 (range is 0 to 8)
                            478 ;
   1EDB                     479 AGCMICRD:
   1EDB A9 00         [ 2]  480         lda     #0x00
   1EDD 85 61         [ 3]  481         sta     RAM_61                                  ; init final agc value
   1EDF 85 62         [ 3]  482         sta     RAM_62                                  ; init agc sample counter
   1EE1 A9 0A         [ 2]  483         lda     #0x0A
   1EE3 85 54         [ 3]  484         sta     RAM_54                                  ; Start a 1 second timer
   1EE5 A9 64         [ 2]  485         lda     #0x64
   1EE7 85 53         [ 3]  486         sta     RAM_53
   1EE9                     487 $23:
   1EE9 20 83 1E      [ 6]  488         jsr     TUPDATE                                 ; housekeeping
   1EEC A5 54         [ 3]  489         lda     RAM_54
   1EEE D0 F9         [ 4]  490         bne     $23                                     ; if 1 sec, do housekeeping
   1EF0 A9 0A         [ 2]  491         lda     #0x0A
   1EF2 85 54         [ 3]  492         sta     RAM_54
   1EF4 A9 64         [ 2]  493         lda     #0x64
   1EF6 85 53         [ 3]  494         sta     RAM_53                                  ; reset timer
   1EF8 A5 62         [ 3]  495         lda     RAM_62
   1EFA C9 08         [ 2]  496         cmp     #0x08                                   ; 8 samples?
   1EFC F0 15         [ 4]  497         beq     $27                                     ; yes - jump to final calculation
   1EFE E6 62         [ 5]  498         inc     RAM_62                                  ; increment the sample counter
   1F00 A2 09         [ 2]  499         ldx     #0x09
   1F02 38            [ 2]  500         sec
   1F03 AD 80 03      [ 4]  501         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1F06                     502 $24:                                                    ; read the most significant high bit
   1F06 2A            [ 2]  503         rol     a
   1F07 CA            [ 2]  504         dex
   1F08 90 FC         [ 4]  505         bcc     $24
   1F0A 18            [ 2]  506         clc
   1F0B 8A            [ 2]  507         txa                                             ; 8=high bit7, 0=no high bits
   1F0C 65 61         [ 3]  508         adc     RAM_61                                  ; add it into RAM_61 (do this 8 times)
   1F0E 85 61         [ 3]  509         sta     RAM_61
   1F10 4C E9 1E      [ 3]  510         jmp     $23
                            511 ;
   1F13                     512 $27:
   1F13 46 61         [ 5]  513         lsr     RAM_61                                  ; divide by 8 (average of 8 samples)
   1F15 46 61         [ 5]  514         lsr     RAM_61
   1F17 46 61         [ 5]  515         lsr     RAM_61
   1F19 A5 61         [ 3]  516         lda     RAM_61
   1F1B 85 60         [ 3]  517         sta     RAM_60                                  ; store agc value in RAM_60
   1F1D A9 00         [ 2]  518         lda     #0x00
   1F1F 85 61         [ 3]  519         sta     RAM_61                                  ; clear these 2 and return
   1F21 85 62         [ 3]  520         sta     RAM_62
   1F23 60            [ 6]  521         rts
                            522 ;
                            523 ;        Do AGC Mic Logic
                            524 ;
   1F24                     525 AGCUPD:
   1F24 AD 80 02      [ 4]  526         lda     U19_PORTA                               ; read AGC knob
   1F27 49 FF         [ 2]  527         eor     #0xFF                                   ; invert the bits
   1F29 4A            [ 2]  528         lsr     a                                       ; get into lower nibble
   1F2A 4A            [ 2]  529         lsr     a
   1F2B 4A            [ 2]  530         lsr     a
   1F2C 4A            [ 2]  531         lsr     a
   1F2D 18            [ 2]  532         clc
   1F2E 65 60         [ 3]  533         adc     RAM_60                                  ; add audio level to it
   1F30 AA            [ 2]  534         tax
   1F31 BD 57 1F      [ 5]  535         lda     AGCTABLE,x                              ; and get the table value
   1F34 85 63         [ 3]  536         sta     RAM_63                                  ; store this value in RAM_63
   1F36 A5 52         [ 3]  537         lda     RAM_52                                  ; 10ms timer expired?
   1F38 D0 16         [ 4]  538         bne     $26                                     ; no, just update CPU Leds
   1F3A A9 0A         [ 2]  539         lda     #0x0A
   1F3C 85 52         [ 3]  540         sta     RAM_52                                  ; restart 10ms timer
   1F3E A5 63         [ 3]  541         lda     RAM_63                                  ; every 10ms, adjust gain by 1 if needed
   1F40 CD 82 03      [ 4]  542         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   1F43 90 08         [ 4]  543         bcc     $25
   1F45 F0 09         [ 4]  544         beq     $26
   1F47 EE 82 03      [ 6]  545         inc     audio_periph$ddr_reg_b                  ; increase value
   1F4A 4C 50 1F      [ 3]  546         jmp     $26
                            547 ;
   1F4D                     548 $25:
   1F4D CE 82 03      [ 6]  549         dec     audio_periph$ddr_reg_b                  ; decrease value
   1F50                     550 $26:
   1F50 AD 82 03      [ 4]  551         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   1F53 8D 82 02      [ 4]  552         sta     U19_PORTB
   1F56 60            [ 6]  553         rts
                            554 ;
                            555 ;       AGC table
                            556 ;
   1F57                     557 AGCTABLE:
   1F57 03 04 06 08         558         .db     0x03, 0x04, 0x06, 0x08
   1F5B 10 16 20 2D         559         .db     0x10, 0x16, 0x20, 0x2D
   1F5F 40 5A 80 BF         560         .db     0x40, 0x5A, 0x80, 0xBF
   1F63 FF FF FF FF         561         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1F67 FF                  562         .db     0xFF
                            563 ;
                            564 ;       Code Patch
                            565 ;
   1F68                     566 CALLP1:
   1F68 A9 00         [ 2]  567         lda     #0x00
   1F6A 85 5A         [ 3]  568         sta     RAM_5A                                  ; clear pending PROG button presses
   1F6C 20 83 1E      [ 6]  569         jsr     TUPDATE                                 ; housekeeping
   1F6F 4C EA 1C      [ 3]  570         jmp     RETP1
                            571 ;
                            572 ; all zeros in this gap
                            573 ;
   1FFC                     574         .org    0x1FFC
                            575 ;
                            576 ; vectors
                            577 ;
   1FFC                     578 RESETVEC:
   1FFC 00 1C               579         .dw     RESET
   1FFE                     580 IRQVEC:
   1FFE 00 00               581         .dw     RAM_start
                            582 
