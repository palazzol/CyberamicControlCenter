                              1         .area   region1 (ABS)
                              2 
                              3 ;
                              4 ;       Pizza Time Theatre
                              5 ;       Dolli Dimples Program
                              6 ;       Version C ?
                              7 ;
                              8 ;       This image was recovered from a 2708 with a label "Dolli C 1C00"
                              9 ;
                             10 
                     0050    11 RAM_50  = 0x0050    ; decremented every 1ms
                     0051    12 RAM_51  = 0x0051    ; decremented every 1ms
                     0052    13 RAM_52  = 0x0052    ; decremented every 1ms
                     0053    14 RAM_53  = 0x0053    ; decremented every 1ms, resets to 100
                     0054    15 RAM_54  = 0x0054    ; decremented every 0.1s
                     0055    16 RAM_55  = 0x0055    ; decremented every 0.1s
                     0056    17 RAM_56  = 0x0056    ; decremented every 0.1s, resets to 100
                     0057    18 RAM_57  = 0x0057    ; decremented every 10s
                     0058    19 RAM_58  = 0x0058    ; zero crossing counter
                     0059    20 RAM_59  = 0x0059    ; track counter
                     005A    21 RAM_5A  = 0x005A    ; number of PROG button presses
                     005B    22 RAM_5B  = 0x005B    ; 0x00=PROG was not pushed, 0x80=Prog was pushed
                     005C    23 RAM_5C  = 0x005C    ; storage for incoming serial byte (& 0x7F)
                     005D    24 RAM_5D  = 0x005D    ; bitmask for solenoids
                     005E    25 RAM_5E  = 0x005E    ; current channel serial byte
                     005F    26 RAM_5F  = 0x005F    ; temp timer storage
                     0060    27 RAM_60  = 0x0060    ; agc mic level
                     0061    28 RAM_61  = 0x0061    ; agc mic level accumulator
                     0062    29 RAM_62  = 0x0062    ; agc mic sample counter
                     0063    30 RAM_63  = 0x0063    ; agc calculated gain value
                             31 
                             32         .include "../include/ptt6502.def"
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
                             33 
   1C00                      34         .org    0x1C00
                             35 ;
   1C00                      36 RESET:
   1C00 D8            [ 2]   37         cld                                             ; No decimal mode
   1C01 78            [ 2]   38         sei                                             ; Interrupts are not used
   1C02 A2 F0         [ 2]   39         ldx     #0xF0                                   ; Stack is at 0x01F0
   1C04 9A            [ 2]   40         txs
   1C05 A9 00         [ 2]   41         lda     #0x00                                   ; Clear RAM
   1C07 A2 10         [ 2]   42         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1C09                      43 ZERORAM:
   1C09 95 00         [ 4]   44         sta     RAM_start,x
   1C0B E8            [ 2]   45         inx
   1C0C E0 80         [ 2]   46         cpx     #0x80
   1C0E D0 F9         [ 4]   47         bne     ZERORAM
   1C10 A9 00         [ 2]   48         lda     #0x00                                   ; Initialize these registers to 0x00
   1C12 8D 01 03      [ 4]   49         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   1C15 8D 00 03      [ 4]   50         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1C18 8D 81 03      [ 4]   51         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1C1B 8D 80 03      [ 4]   52         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1C1E 8D 83 03      [ 4]   53         sta     audio_control_reg_b                     ; Clear audio control B
   1C21 8D 05 02      [ 4]   54         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release
   1C24 8D 03 03      [ 4]   55         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1C27 8D 01 02      [ 4]   56         sta     U18_DDRA                                ; Buttons are inputs
   1C2A A9 02         [ 2]   57         lda     #0x02
   1C2C 8D 81 02      [ 4]   58         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   1C2F A9 FF         [ 2]   59         lda     #0xFF
   1C31 8D 82 03      [ 4]   60         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1C34 8D 03 02      [ 4]   61         sta     U18_DDRB                                ; Button lights are outputs
   1C37 8D 83 02      [ 4]   62         sta     U19_DDRB                                ; CPU card lights are outputs
   1C3A A9 FC         [ 2]   63         lda     #0xFC
   1C3C 8D 02 03      [ 4]   64         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs
   1C3F A9 2E         [ 2]   65         lda     #0x2E
   1C41 8D 01 03      [ 4]   66         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1C44 8D 03 03      [ 4]   67         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1C47 8D 83 03      [ 4]   68         sta     audio_control_reg_b                     ; audio CB2 is Write strobe (Unused)
   1C4A 8D 81 03      [ 4]   69         sta     audio_control_reg_a                     ; audio CA2 is Read strobe (Unused)
   1C4D A9 64         [ 2]   70         lda     #0x64
   1C4F 85 53         [ 3]   71         sta     RAM_53                                  ; 100 - init 1 msec master counter
   1C51 A9 2B         [ 2]   72         lda     #0x2B
   1C53 85 57         [ 3]   73         sta     RAM_57                                  ; ~5 minute timer?
   1C55 A9 10         [ 2]   74         lda     #0x10                                   ; 16
   1C57 85 63         [ 3]   75         sta     RAM_63                                  ; Set initial AGC gain value
   1C59 A9 10         [ 2]   76         lda     #TAPEMODE_STOP
   1C5B 20 1F 1D      [ 6]   77         jsr     TAPECMD                                 ; STOP tape
   1C5E A9 28         [ 2]   78         lda     #0x28                                   ; this will count 4 seconds
   1C60 85 54         [ 3]   79         sta     RAM_54
   1C62                      80 $1:
   1C62 20 13 1E      [ 6]   81         jsr     TUPDATE                                 ; do not much for 4 seconds
   1C65 A5 54         [ 3]   82         lda     RAM_54
   1C67 D0 F9         [ 4]   83         bne     $1
   1C69                      84 REWIND:
   1C69 A9 40         [ 2]   85         lda     #TAPEMODE_REWIND
   1C6B 20 1F 1D      [ 6]   86         jsr     TAPECMD                                 ; REWIND tape
   1C6E                      87 FINDSTART:
   1C6E 20 33 1D      [ 6]   88         jsr     WAITTONE
   1C71 A5 58         [ 3]   89         lda     RAM_58
   1C73 C9 60         [ 2]   90         cmp     #0x60                                   ; 96 edges?
   1C75 90 F7         [ 4]   91         bcc     FINDSTART                               ; no, loop
   1C77 A9 20         [ 2]   92         lda     #TAPEMODE_FFWD
   1C79 20 1F 1D      [ 6]   93         jsr     TAPECMD                                 ; FFWD tape
   1C7C A9 19         [ 2]   94         lda     #0x19
   1C7E 85 54         [ 3]   95         sta     RAM_54                                  ; ~2.5 secs?
   1C80                      96 $5:
   1C80 20 13 1E      [ 6]   97         jsr     TUPDATE                                 ; do housekeeping stuff
   1C83 A5 54         [ 3]   98         lda     RAM_54
   1C85 D0 F9         [ 4]   99         bne     $5
   1C87 A9 00         [ 2]  100         lda     #0x00
   1C89 85 59         [ 3]  101         sta     RAM_59
   1C8B 20 33 1D      [ 6]  102         jsr     WAITTONE                                ; wait for tone signaling beginning of track
   1C8E E6 59         [ 5]  103         inc     RAM_59
   1C90 A9 10         [ 2]  104         lda     #TAPEMODE_STOP
   1C92 20 1F 1D      [ 6]  105         jsr     TAPECMD                                 ; STOP tape
   1C95 A9 80         [ 2]  106         lda     #TAPEMODE_PLAY
   1C97 20 1F 1D      [ 6]  107         jsr     TAPECMD                                 ; PLAY tape
   1C9A 20 61 1D      [ 6]  108         jsr     WAITCD                                  ; wait for carrier
   1C9D A9 10         [ 2]  109         lda     #TAPEMODE_STOP
   1C9F 20 1F 1D      [ 6]  110         jsr     TAPECMD                                 ; STOP tape
   1CA2 20 F9 1C      [ 6]  111         jsr     INITBRDS                                ; init the boards
   1CA5                     112 WAITPLAY:
   1CA5 20 13 1E      [ 6]  113         jsr     TUPDATE                                 ; do housekeeping stuff
   1CA8 20 A0 1E      [ 6]  114         jsr     AGCUPD                                  ; do AGC Mic Logic
   1CAB A5 5A         [ 3]  115         lda     RAM_5A                                  ; wait until we are triggered
   1CAD D0 10         [ 4]  116         bne     STARTPLAY                                   ; then jump
   1CAF A9 02         [ 2]  117         lda     #0x02                                   ; else
   1CB1 8D 80 02      [ 4]  118         sta     U19_PORTA                               ; turn on RESET button light
   1CB4 A9 00         [ 2]  119         lda     #0x00
   1CB6 8D 02 02      [ 4]  120         sta     U18_PORTB                               ; turn on all other button lights
   1CB9 A5 57         [ 3]  121         lda     RAM_57                                  ; has the ~5 minute timer run out?
   1CBB D0 E8         [ 4]  122         bne     WAITPLAY                                ; no, keep looping
   1CBD E6 5A         [ 5]  123         inc     RAM_5A                                  ; yes, simulate a PROG button press
                            124 ;   we have been started!
   1CBF                     125 STARTPLAY:
   1CBF 20 F9 1C      [ 6]  126         jsr     INITBRDS                                ; init the boards
   1CC2 A9 00         [ 2]  127         lda     #0x00
   1CC4 8D 80 02      [ 4]  128         sta     U19_PORTA                               ; turn off RESET button light
   1CC7 A9 80         [ 2]  129         lda     #0x80
   1CC9 8D 02 02      [ 4]  130         sta     U18_PORTB                               ; turn off all but PROG light
   1CCC A9 80         [ 2]  131         lda     #TAPEMODE_PLAY
   1CCE 20 1F 1D      [ 6]  132         jsr     TAPECMD                                 ; PLAY tape
   1CD1 20 61 1D      [ 6]  133         jsr     WAITCD                                  ; wait for carrier
   1CD4 C6 5A         [ 5]  134         dec     RAM_5A                                  ; no longer triggered
   1CD6 20 87 1D      [ 6]  135         jsr     PLAYTRK                                 ; play a track!
   1CD9 20 F9 1C      [ 6]  136         jsr     INITBRDS                                ; init the boards
   1CDC A9 2B         [ 2]  137         lda     #0x2B
   1CDE 85 57         [ 3]  138         sta     RAM_57                                  ; set a ~5 minute timer
   1CE0 E6 59         [ 5]  139         inc     RAM_59                                  ; track counter
   1CE2 A5 59         [ 3]  140         lda     RAM_59
   1CE4 C9 1A         [ 2]  141         cmp     #0x1A                                   ; 26?
   1CE6 90 03         [ 4]  142         bcc     NEXTTRK
   1CE8 4C 69 1C      [ 3]  143         jmp     REWIND                                  ; rewind the tape after the total number of tracks are done
                            144 ; go to next track
   1CEB                     145 NEXTTRK:
   1CEB 20 61 1D      [ 6]  146         jsr     WAITCD                                  ; wait for carrier
   1CEE A9 10         [ 2]  147         lda     #TAPEMODE_STOP
   1CF0 20 1F 1D      [ 6]  148         jsr     TAPECMD                                 ; STOP tape
   1CF3 20 5F 1E      [ 6]  149         jsr     AGCMICRD                                ; Read the AGC mic level
   1CF6 4C A5 1C      [ 3]  150         jmp     WAITPLAY
                            151 ;
                            152 ;       Init boards
                            153 ;
   1CF9                     154 INITBRDS:
   1CF9 A9 00         [ 2]  155         lda     #0x00
   1CFB A2 01         [ 2]  156         ldx     #0x01
   1CFD 20 16 1D      [ 6]  157         jsr     DOBOARD                                 ; write 0x00 to port+1
   1D00 A9 FF         [ 2]  158         lda     #0xFF                                   ; set DDRx to all outputs
   1D02 A2 00         [ 2]  159         ldx     #0x00
   1D04 20 16 1D      [ 6]  160         jsr     DOBOARD                                 ; write 0xFF to port
   1D07 A9 34         [ 2]  161         lda     #0x34
   1D09 A2 01         [ 2]  162         ldx     #0x01
   1D0B 20 16 1D      [ 6]  163         jsr     DOBOARD                                 ; write 0x34 to port+1
   1D0E A9 00         [ 2]  164         lda     #0x00                                   ; Cx2 low, port all low
   1D10 A2 00         [ 2]  165         ldx     #0x00
   1D12 20 16 1D      [ 6]  166         jsr     DOBOARD                                 ; write 0x00 to port
   1D15 60            [ 6]  167         rts
                            168 ;
   1D16                     169 DOBOARD:
   1D16 95 84         [ 4]  170         sta     board_2_periph$ddr_reg_a,x
   1D18 95 86         [ 4]  171         sta     board_2_periph$ddr_reg_b,x
   1D1A 95 88         [ 4]  172         sta     board_3_periph$ddr_reg_a,x
   1D1C 95 8A         [ 4]  173         sta     board_3_periph$ddr_reg_b,x
   1D1E 60            [ 6]  174         rts
                            175 ;
                            176 ;       Send Transport command for 0.255 sec
                            177 ;       and then unassert it
                            178 ;
   1D1F                     179 TAPECMD:
   1D1F 8D 02 03      [ 4]  180         sta     transport_periph$ddr_reg_b              ; enable output line
   1D22 A9 FF         [ 2]  181         lda     #0xFF
   1D24 85 50         [ 3]  182         sta     RAM_50
   1D26                     183 $6:
   1D26 20 13 1E      [ 6]  184         jsr     TUPDATE                                 ; check for PROG button push
   1D29 A5 50         [ 3]  185         lda     RAM_50
   1D2B D0 F9         [ 4]  186         bne     $6
   1D2D A9 00         [ 2]  187         lda     #0x00
   1D2F 8D 02 03      [ 4]  188         sta     transport_periph$ddr_reg_b
   1D32 60            [ 6]  189         rts
                            190 ;
                            191 ;       Wait for tone during Fast Forward, signaling beginning of track
                            192 ;       (64 Hz for ~.4s, or higher for proportionally less)
                            193 ;
   1D33                     194 WAITTONE:
   1D33 A9 00         [ 2]  195         lda     #0x00
   1D35 85 58         [ 3]  196         sta     RAM_58
                            197 ; wait for tone start
   1D37                     198 $8:
   1D37 20 13 1E      [ 6]  199         jsr     TUPDATE                                 ; housekeeping
   1D3A AD 03 03      [ 4]  200         lda     transport_control_reg_b
   1D3D 10 F8         [ 4]  201         bpl     $8
   1D3F A9 04         [ 2]  202         lda     #0x04
   1D41 85 54         [ 3]  203         sta     RAM_54                                  ; ~.4 secs?
   1D43                     204 $29:
   1D43 20 13 1E      [ 6]  205         jsr     TUPDATE                                 ; housekeeping
   1D46 AD 03 03      [ 4]  206         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1D49 10 0B         [ 4]  207         bpl     $28                                     ; if not, jump ahead
   1D4B E6 58         [ 5]  208         inc     RAM_58                                  ; count edges
   1D4D AD 02 03      [ 4]  209         lda     transport_periph$ddr_reg_b
   1D50 A5 58         [ 3]  210         lda     RAM_58
   1D52 C9 60         [ 2]  211         cmp     #0x60                                   ; 96 edges?
   1D54 B0 0A         [ 4]  212         bcs     $10                                     ; exit
   1D56                     213 $28:
   1D56 A5 54         [ 3]  214         lda     RAM_54                                  ; ~.4 secs?
   1D58 D0 E9         [ 4]  215         bne     $29
   1D5A A5 58         [ 3]  216         lda     RAM_58
   1D5C C9 20         [ 2]  217         cmp     #0x20                                   ; 32 edges?
   1D5E 90 D3         [ 4]  218         bcc     WAITTONE                                ; no, loop
   1D60                     219 $10:
   1D60 60            [ 6]  220         rts
                            221 ;
                            222 ;       Wait for carrier / start of data
                            223 ;
                            224 
                            225 ; Wait for 250ms
   1D61                     226 WAITCD:
   1D61 A9 FA         [ 2]  227         lda     #0xFA
   1D63 85 50         [ 3]  228         sta     RAM_50                                  ; 250 msec
   1D65                     229 $11:
   1D65 20 13 1E      [ 6]  230         jsr     TUPDATE                                 ; housekeeping
   1D68 A5 50         [ 3]  231         lda     RAM_50
   1D6A D0 F9         [ 4]  232         bne     $11
                            233 
                            234 ; Wait for 160ms of consecutive zero crossings
   1D6C                     235 $12:
   1D6C 20 13 1E      [ 6]  236         jsr     TUPDATE                                 ; housekeeping
   1D6F AD 02 03      [ 4]  237         lda     transport_periph$ddr_reg_b
   1D72 6A            [ 2]  238         ror     a
   1D73 90 F7         [ 4]  239         bcc     $12
   1D75 A9 A0         [ 2]  240         lda     #0xA0                                   ; 160 msec
   1D77 85 50         [ 3]  241         sta     RAM_50
   1D79                     242 $13:
   1D79 20 13 1E      [ 6]  243         jsr     TUPDATE                                 ; housekeeping
   1D7C AD 02 03      [ 4]  244         lda     transport_periph$ddr_reg_b
   1D7F 6A            [ 2]  245         ror     a
   1D80 90 EA         [ 4]  246         bcc     $12
   1D82 A5 50         [ 3]  247         lda     RAM_50
   1D84 D0 F3         [ 4]  248         bne     $13
   1D86 60            [ 6]  249         rts
                            250 ;
   1D87                     251 PLAYTRK:
   1D87 AD 00 03      [ 4]  252         lda     transport_periph$ddr_reg_a
   1D8A A9 40         [ 2]  253         lda     #0x40
   1D8C 85 86         [ 3]  254         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1D8E 85 8A         [ 3]  255         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1D90                     256 $14:
   1D90 AD 02 03      [ 4]  257         lda     transport_periph$ddr_reg_b
   1D93 4A            [ 2]  258         lsr     a
   1D94 90 11         [ 4]  259         bcc     LOSTCD                                  ; b0=0, no carrier, exit
   1D96 20 A0 1E      [ 6]  260         jsr     AGCUPD                                  ; do AGC Mic Logic
   1D99 20 13 1E      [ 6]  261         jsr     TUPDATE                                 ; housekeeping
   1D9C AD 01 03      [ 4]  262         lda     transport_control_reg_a                 ; Did we get a byte?
   1D9F 10 EF         [ 4]  263         bpl     $14                                     ; No, loop
   1DA1 20 B9 1D      [ 6]  264         jsr     PROTOHAND                               ; Yes, Process Incoming Byte
   1DA4 4C 90 1D      [ 3]  265         jmp     $14
                            266 
                            267 ;       Lost carrier - wait 100 msec for more data before giving up
   1DA7                     268 LOSTCD:
   1DA7 A9 64         [ 2]  269         lda     #0x64                                   ; 100 msec
   1DA9 85 50         [ 3]  270         sta     RAM_50
   1DAB                     271 $15:
   1DAB 20 13 1E      [ 6]  272         jsr     TUPDATE
   1DAE AD 02 03      [ 4]  273         lda     transport_periph$ddr_reg_b
   1DB1 4A            [ 2]  274         lsr     a
   1DB2 B0 D3         [ 4]  275         bcs     PLAYTRK                                 ; carrier
   1DB4 A5 50         [ 3]  276         lda     RAM_50
   1DB6 D0 F3         [ 4]  277         bne     $15
   1DB8 60            [ 6]  278         rts
                            279 ;
                            280 ; Protocol handler
                            281 ;
   1DB9                     282 PROTOHAND:
   1DB9 AD 00 03      [ 4]  283         lda     transport_periph$ddr_reg_a
   1DBC 29 7F         [ 2]  284         and     #0x7F                                   ; insure data is ASCII
   1DBE 85 5C         [ 3]  285         sta     RAM_5C                                  ; store it here
   1DC0 29 7E         [ 2]  286         and     #0x7E                                   ; ignore bottom bit
   1DC2 C9 22         [ 2]  287         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1DC4 F0 38         [ 4]  288         beq     PROCCHNL                                ; if so, process as channel
   1DC6 C9 36         [ 2]  289         cmp     #0x36                                   ; is it 0x36 or 0x37?
   1DC8 F0 34         [ 4]  290         beq     PROCCHNL                                ; if so, process as channel
   1DCA A5 5C         [ 3]  291         lda     RAM_5C                                  ; get original byte
   1DCC 38            [ 2]  292         sec
   1DCD E9 41         [ 2]  293         sbc     #0x41                                   ; subtract 0x41
   1DCF A8            [ 2]  294         tay                                             ; filter (0x41 to 0x50)
   1DD0 30 30         [ 4]  295         bmi     $18                                     ; if original < 0x41, exit
   1DD2 C9 10         [ 2]  296         cmp     #0x10
   1DD4 B0 2C         [ 4]  297         bcs     $18                                     ; if original >= 0x51, exit
   1DD6 A2 84         [ 2]  298         ldx     #0x84                                   ; x = port offset
   1DD8 C9 08         [ 2]  299         cmp     #0x08
   1DDA 90 08         [ 4]  300         bcc     $16                                     ; if original is 0x41 to 0x48, use offset 0x84 (board 2A)
   1DDC A2 88         [ 2]  301         ldx     #0x88
   1DDE C9 0E         [ 2]  302         cmp     #0x0E                                   ; if original is 0x49 to 0x4E, use offset 0x88 (board 3A)
   1DE0 90 02         [ 4]  303         bcc     $16
   1DE2 A2 8A         [ 2]  304         ldx     #0x8A                                   ; if original is 0x4F to 0x50, use offset 0x8A (board 3B)
   1DE4                     305 $16:
   1DE4 B9 03 1E      [ 5]  306         lda     MASKTBL,y                               ; lookup bitmask
   1DE7 85 5D         [ 3]  307         sta     RAM_5D                                  ; store mask in RAM_5D
   1DE9 A5 5E         [ 3]  308         lda     RAM_5E
   1DEB 4A            [ 2]  309         lsr     a                                       ; get on/off in carry
   1DEC B0 09         [ 4]  310         bcs     $17                                     ; if on, jump
   1DEE A5 5D         [ 3]  311         lda     RAM_5D
   1DF0 49 FF         [ 2]  312         eor     #0xFF
   1DF2 35 00         [ 4]  313         and     RAM_start,x
   1DF4 95 00         [ 4]  314         sta     RAM_start,x                             ; turn off solenoid
   1DF6 60            [ 6]  315         rts
                            316 ;
   1DF7                     317 $17:
   1DF7 A5 5D         [ 3]  318         lda     RAM_5D
   1DF9 15 00         [ 4]  319         ora     RAM_start,x
   1DFB 95 00         [ 4]  320         sta     RAM_start,x                             ; turn on solenoid
   1DFD 60            [ 6]  321         rts
                            322 ;
   1DFE                     323 PROCCHNL:
   1DFE A5 5C         [ 3]  324         lda     RAM_5C
   1E00 85 5E         [ 3]  325         sta     RAM_5E
   1E02                     326 $18:
   1E02 60            [ 6]  327         rts
                            328 ;
                            329 ; bit mask table
                            330 ;
   1E03                     331 MASKTBL:
   1E03 01 02 04 08         332         .db     0x01,0x02,0x04,0x08
   1E07 10 20 40 80         333         .db     0x10,0x20,0x40,0x80
   1E0B 01 02 04 08         334         .db     0x01,0x02,0x04,0x08
   1E0F 10 20 01 02         335         .db     0x10,0x20,0x01,0x02
                            336 ;
   1E13                     337 TUPDATE:
   1E13 AD 05 02      [ 4]  338         lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
   1E16 85 5F         [ 3]  339         sta     RAM_5F                                  ; store this state in 5F
   1E18 F0 44         [ 4]  340         beq     TEXIT                                   ; No flags set, return
   1E1A A5 5B         [ 3]  341         lda     RAM_5B                                  ; Are we already running?
   1E1C 30 0E         [ 4]  342         bmi     $19                                     ; yes, jump ahead
   1E1E A5 5F         [ 3]  343         lda     RAM_5F                                  ; else check flags
   1E20 29 40         [ 2]  344         and     #0x40                                   ; PROG pushed?
   1E22 F0 16         [ 4]  345         beq     RDTIMER                                 ; if not, go to read timer
   1E24 A9 80         [ 2]  346         lda     #0x80
   1E26 85 5B         [ 3]  347         sta     RAM_5B                                  ; PROG Button pushed
   1E28 A9 FA         [ 2]  348         lda     #0xFA
   1E2A 85 51         [ 3]  349         sta     RAM_51
   1E2C                     350 $19:
   1E2C A5 51         [ 3]  351         lda     RAM_51                                  ; for 250ms?
   1E2E D0 06         [ 4]  352         bne     $20                                     ; no, exit
   1E30 A9 00         [ 2]  353         lda     #0x00
   1E32 85 5B         [ 3]  354         sta     RAM_5B                                  ; yes, reset PROG button state
   1E34 E6 5A         [ 5]  355         inc     RAM_5A                                  ; and mark as running
   1E36                     356 $20:
   1E36 A5 5F         [ 3]  357         lda     RAM_5F                                  ; check timer irq bit
   1E38 10 24         [ 4]  358         bpl     TEXIT                                   ; if timer not expired, return
   1E3A                     359 RDTIMER:
   1E3A AD 04 02      [ 4]  360         lda     U18_timer                               ; ???
   1E3D A9 01         [ 2]  361         lda     #0x01
   1E3F 8D 17 02      [ 4]  362         sta     U18_17                                  ; ???
   1E42 C6 50         [ 5]  363         dec     RAM_50                                  ; decrement these timers every timer reset (1ms)
   1E44 C6 51         [ 5]  364         dec     RAM_51
   1E46 C6 52         [ 5]  365         dec     RAM_52
   1E48 C6 53         [ 5]  366         dec     RAM_53
   1E4A D0 12         [ 4]  367         bne     TEXIT                                   ; if timer RAM_53 expires, then wrap to 100
   1E4C A9 64         [ 2]  368         lda     #0x64                                   ; 100
   1E4E 85 53         [ 3]  369         sta     RAM_53
   1E50 C6 54         [ 5]  370         dec     RAM_54
   1E52 C6 55         [ 5]  371         dec     RAM_55
   1E54 C6 56         [ 5]  372         dec     RAM_56
   1E56 D0 06         [ 4]  373         bne     TEXIT                                   ; if timer RAM_56 expires, then wrap to 100
   1E58 A9 64         [ 2]  374         lda     #0x64                                   ; 100
   1E5A 85 56         [ 3]  375         sta     RAM_56
   1E5C C6 57         [ 5]  376         dec     RAM_57
   1E5E                     377 TEXIT:
   1E5E 60            [ 6]  378         rts
                            379 ;
                            380 ;       Read the AGC mic level
                            381 ;       Take the average of 8 samples, and put it into RAM_60 (range is 0 to 8)
                            382 ;
   1E5F                     383 AGCMICRD:
   1E5F A9 00         [ 2]  384         lda     #0x00
   1E61 85 61         [ 3]  385         sta     RAM_61                                  ; init final agc value
   1E63 85 62         [ 3]  386         sta     RAM_62                                  ; init agc sample counter
   1E65 A9 0A         [ 2]  387         lda     #0x0A
   1E67 85 54         [ 3]  388         sta     RAM_54                                  ; Start a 1 second timer
   1E69                     389 $23:
   1E69 20 13 1E      [ 6]  390         jsr     TUPDATE                                 ; housekeeping
   1E6C A5 54         [ 3]  391         lda     RAM_54
   1E6E D0 F9         [ 4]  392         bne     $23                                     ; if 1 sec, do housekeeping
   1E70 A9 0A         [ 2]  393         lda     #0x0A
   1E72 85 54         [ 3]  394         sta     RAM_54                                  ; reset timer
   1E74 A5 62         [ 3]  395         lda     RAM_62
   1E76 C9 08         [ 2]  396         cmp     #0x08                                   ; 8 samples?
   1E78 F0 15         [ 4]  397         beq     $27                                     ; yes - jump to final calculation
   1E7A E6 62         [ 5]  398         inc     RAM_62                                  ; increment the sample counter
   1E7C A2 09         [ 2]  399         ldx     #0x09
   1E7E 38            [ 2]  400         sec
   1E7F AD 80 03      [ 4]  401         lda     audio_periph$ddr_reg_a                  ; read the agc mic level
   1E82                     402 $24:                                                    ; read the most significant high bit
   1E82 2A            [ 2]  403         rol     a
   1E83 CA            [ 2]  404         dex
   1E84 90 FC         [ 4]  405         bcc     $24
   1E86 18            [ 2]  406         clc
   1E87 8A            [ 2]  407         txa                                             ; 8=high bit7, 0=no high bits
   1E88 65 61         [ 3]  408         adc     RAM_61                                  ; add it into RAM_61 (do this 8 times)
   1E8A 85 61         [ 3]  409         sta     RAM_61
   1E8C 4C 69 1E      [ 3]  410         jmp     $23
                            411 ;
   1E8F                     412 $27:
   1E8F 46 61         [ 5]  413         lsr     RAM_61                                  ; divide by 8 (average of 8 samples)
   1E91 46 61         [ 5]  414         lsr     RAM_61
   1E93 46 61         [ 5]  415         lsr     RAM_61
   1E95 A5 61         [ 3]  416         lda     RAM_61
   1E97 85 60         [ 3]  417         sta     RAM_60                                  ; store agc value in RAM_60
   1E99 A9 00         [ 2]  418         lda     #0x00
   1E9B 85 61         [ 3]  419         sta     RAM_61                                  ; clear these 2 and return
   1E9D 85 62         [ 3]  420         sta     RAM_62
   1E9F 60            [ 6]  421         rts
                            422 ;
                            423 ;        Do AGC Mic Logic
                            424 ;
   1EA0                     425 AGCUPD:
   1EA0 AD 80 02      [ 4]  426         lda     U19_PORTA                               ; read AGC knob
   1EA3 49 FF         [ 2]  427         eor     #0xFF                                   ; invert the bits
   1EA5 4A            [ 2]  428         lsr     a                                       ; get into lower nibble
   1EA6 4A            [ 2]  429         lsr     a
   1EA7 4A            [ 2]  430         lsr     a
   1EA8 4A            [ 2]  431         lsr     a
   1EA9 18            [ 2]  432         clc
   1EAA 65 60         [ 3]  433         adc     RAM_60                                  ; add audio level to it
   1EAC AA            [ 2]  434         tax
   1EAD BD D3 1E      [ 5]  435         lda     AGCTABLE,x                              ; and get the table value
   1EB0 85 63         [ 3]  436         sta     RAM_63                                  ; store this value in RAM_63
   1EB2 A5 52         [ 3]  437         lda     RAM_52                                  ; 10ms timer expired?
   1EB4 D0 16         [ 4]  438         bne     $26                                     ; no, just update CPU Leds
   1EB6 A9 0A         [ 2]  439         lda     #0x0A
   1EB8 85 52         [ 3]  440         sta     RAM_52                                  ; restart 10ms timer
   1EBA A5 63         [ 3]  441         lda     RAM_63                                  ; every 10ms, adjust gain by 1 if needed
   1EBC CD 82 03      [ 4]  442         cmp     audio_periph$ddr_reg_b                  ; compare with current value
   1EBF 90 08         [ 4]  443         bcc     $25
   1EC1 F0 09         [ 4]  444         beq     $26
   1EC3 EE 82 03      [ 6]  445         inc     audio_periph$ddr_reg_b                  ; increase value
   1EC6 4C CC 1E      [ 3]  446         jmp     $26
                            447 ;
   1EC9                     448 $25:
   1EC9 CE 82 03      [ 6]  449         dec     audio_periph$ddr_reg_b                  ; decrease value
   1ECC                     450 $26:
   1ECC AD 82 03      [ 4]  451         lda     audio_periph$ddr_reg_b                  ; update CPU leds with value
   1ECF 8D 82 02      [ 4]  452         sta     U19_PORTB
   1ED2 60            [ 6]  453         rts
                            454 ;
                            455 ;       AGC table
                            456 ;
   1ED3                     457 AGCTABLE:
   1ED3 03 04 06 08         458         .db     0x03, 0x04, 0x06, 0x08
   1ED7 10 16 20 2D         459         .db     0x10, 0x16, 0x20, 0x2D
   1EDB 40 5A 80 BF         460         .db     0x40, 0x5A, 0x80, 0xBF
   1EDF FF FF FF FF         461         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1EE3 FF                  462         .db     0xFF
                            463 ;
                            464 ; all ff's in this gap
                            465 ;
   1FFA                     466         .org    0x1FFA
                            467 ;
                            468 ; vectors
                            469 ;
   1FFA                     470 NMIVEC:
   1FFA FF FF               471         .dw     0xFFFF
   1FFC                     472 RESETVEC:
   1FFC 00 1C               473         .dw     RESET
   1FFE                     474 IRQVEC:
   1FFE FF FF               475         .dw     0xFFFF
