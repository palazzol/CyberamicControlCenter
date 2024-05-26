                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       The Beagles/King Program
                              7 ;       Version Unknown
                              8 ;
                              9 ;       This image was recovered from an unmarked 2708
                             10 ;
                             11 
                             12 ; start of RAM
                     0000    13 RAM_start = 0x0000
                             14 
                     0050    15 RAM_50    = 0x0050
                     0051    16 RAM_51    = 0x0051
                     0052    17 RAM_52    = 0x0052
                     0053    18 RAM_53    = 0x0053
                     0054    19 RAM_54    = 0x0054
                     0055    20 RAM_55    = 0x0055
                     0056    21 RAM_56    = 0x0056
                     0057    22 RAM_57    = 0x0057
                     0058    23 RAM_58    = 0x0058
                     0059    24 RAM_59    = 0x0059
                     005A    25 RAM_5A    = 0x005A
                     005B    26 RAM_5B    = 0x005B
                     005C    27 RAM_5C    = 0x005C
                     005D    28 RAM_5D    = 0x005D
                     005E    29 RAM_5E    = 0x005E
                     005F    30 RAM_5F    = 0x005F
                             31 
                     0064    32 RAM_64    = 0x0064
                             33 
                             34         .include "../include/ptt6502.def"
                              1 
                     0080     2 board_1_periph$ddr_reg_a    = 0x0080
                     0081     3 board_1_control_reg_a       = 0x0081
                     0082     4 board_1_periph$ddr_reg_b    = 0x0082
                     0083     5 board_1_control_reg_b       = 0x0083
                     0086     6 board_2_periph$ddr_reg_b    = 0x0086
                     008A     7 board_3_periph$ddr_reg_b    = 0x008A
                     008E     8 board_4_periph$ddr_reg_b    = 0x008E
                     0200     9 U18_PORTA                   = 0x0200
                     0201    10 U18_DDRA                    = 0x0201
                     0202    11 U18_PORTB                   = 0x0202
                     0203    12 U18_DDRB                    = 0x0203
                     0204    13 U18_timer                   = 0x0204
                     0205    14 U18_edge_detect_control_DI_pos = 0x0205
                     0215    15 U18_timer_8T_DI             = 0x0215
                     0280    16 U19_PORTA                   = 0x0280
                     0281    17 U19_DDRA                    = 0x0281
                     0282    18 U19_PORTB                   = 0x0282
                     0283    19 U19_DDRB                    = 0x0283
                     0300    20 transport_periph$ddr_reg_a  = 0x0300
                     0301    21 transport_control_reg_a     = 0x0301
                     0302    22 transport_periph$ddr_reg_b  = 0x0302
                     0303    23 transport_control_reg_b     = 0x0303
                     0380    24 audio_periph$ddr_reg_a      = 0x0380
                     0381    25 audio_control_reg_a         = 0x0381
                     0382    26 audio_periph$ddr_reg_b      = 0x0382
                     0383    27 audio_control_reg_b         = 0x0383
                             35 
   1C00                      36         .org     0x1C00
                             37 ;
   1C00                      38 RESET:
   1C00 D8            [ 2]   39         cld
   1C01 78            [ 2]   40         sei                                             ; no decimal mode
   1C02 A2 F0         [ 2]   41         ldx     #0xF0                                   ; interrupts are not used
   1C04 9A            [ 2]   42         txs                                             ; stack is at 0x01F0
   1C05 A9 00         [ 2]   43         lda     #0x00                                   ; Clear and Test RAM 
   1C07 A2 10         [ 2]   44         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1C09                      45 L1C09:
   1C09 95 00         [ 4]   46         sta     RAM_start,x
   1C0B E8            [ 2]   47         inx
   1C0C E0 80         [ 2]   48         cpx     #0x80
   1C0E D0 F9         [ 4]   49         bne     L1C09
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
   1C55 85 56         [ 3]   76         sta     RAM_56                                  ; 100 - init a 1000 sec = 16 min counter?
   1C57 A9 F0         [ 2]   77         lda     #0xF0
   1C59 8D 82 03      [ 4]   78         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs - upper 4 bits only?
   1C5C 8D 82 02      [ 4]   79         sta     U19_PORTB                               ; turn on CPU LEDs 5-8
   1C5F A9 10         [ 2]   80         lda     #0x10
   1C61 20 60 1D      [ 6]   81         jsr     L1D60                                   ; STOP tape
   1C64 A9 28         [ 2]   82         lda     #0x28                                   ; this will count 4 seconds
   1C66 85 54         [ 3]   83         sta     RAM_54
   1C68 A9 64         [ 2]   84         lda     #0x64                                   ; reset master timer
   1C6A 85 53         [ 3]   85         sta     RAM_53
   1C6C                      86 L1C6C:
   1C6C 20 72 1E      [ 6]   87         jsr     L1E72                                   ; do not much for 4 seconds
   1C6F A5 54         [ 3]   88         lda     RAM_54
   1C71 D0 F9         [ 4]   89         bne     L1C6C
   1C73                      90 L1C73:
   1C73 A9 40         [ 2]   91         lda     #0x40
   1C75 20 74 1D      [ 6]   92         jsr     L1D74                                   ; REWIND tape
   1C78                      93 L1C78:
   1C78 A9 00         [ 2]   94         lda     #0x00
   1C7A 85 58         [ 3]   95         sta     RAM_58                                  ; counter to zero
   1C7C                      96 L1C7C:
   1C7C 20 72 1E      [ 6]   97         jsr     L1E72                                   ; housekeeping
   1C7F AD 03 03      [ 4]   98         lda     transport_control_reg_b                 ; loop until we see tone marking beginning of tape
   1C82 10 F8         [ 4]   99         bpl     L1C7C
   1C84 A9 06         [ 2]  100         lda     #0x06
   1C86 85 54         [ 3]  101         sta     RAM_54                                  ; set 0.6 second timer
   1C88 A9 64         [ 2]  102         lda     #0x64                                   ; 100 rising edge transitions
   1C8A 85 53         [ 3]  103         sta     RAM_53
   1C8C                     104 L1C8C:
   1C8C 20 72 1E      [ 6]  105         jsr     L1E72                                   ; housekeeping
   1C8F AD 03 03      [ 4]  106         lda     transport_control_reg_b                 ; loop until 100 transport CB1 rising edges or 0.6 secs expired
   1C92 10 0B         [ 4]  107         bpl     L1C9F
   1C94 E6 58         [ 5]  108         inc     RAM_58                                  ; count transistions
   1C96 AD 02 03      [ 4]  109         lda     transport_periph$ddr_reg_b
   1C99 A5 58         [ 3]  110         lda     RAM_58
   1C9B C9 64         [ 2]  111         cmp     #0x64
   1C9D B0 0B         [ 4]  112         bcs     L1CAA                                   ; happened 100 times, tape is at the beginning, jump ahead
   1C9F                     113 L1C9F:
   1C9F A5 54         [ 3]  114         lda     RAM_54
   1CA1 D0 E9         [ 4]  115         bne     L1C8C
   1CA3 4C 78 1C      [ 3]  116         jmp     L1C78
                            117 ; unused instructions start
   1CA6 C9 60         [ 2]  118         cmp     #0x60
   1CA8 90 00         [ 4]  119         bcc     L1CAA
                            120 ; unused instructions end
                            121 ;
   1CAA                     122 L1CAA:
   1CAA A9 20         [ 2]  123         lda     #0x20
   1CAC 20 74 1D      [ 6]  124         jsr     L1D74                                   ; FFWD tape
   1CAF A9 19         [ 2]  125         lda     #0x19
   1CB1 85 54         [ 3]  126         sta     RAM_54                                  ; for 2.5 secs
   1CB3 A9 64         [ 2]  127         lda     #0x64
   1CB5 85 53         [ 3]  128         sta     RAM_53
   1CB7                     129 L1CB7:
   1CB7 20 72 1E      [ 6]  130         jsr     L1E72                                   ; do housekeeping stuff
   1CBA A5 54         [ 3]  131         lda     RAM_54
   1CBC D0 F9         [ 4]  132         bne     L1CB7
   1CBE A9 00         [ 2]  133         lda     #0x00
   1CC0 85 59         [ 3]  134         sta     RAM_59
   1CC2 20 83 1D      [ 6]  135         jsr     L1D83                                   ; look for start of data??
   1CC5 E6 59         [ 5]  136         inc     RAM_59
   1CC7 A9 10         [ 2]  137         lda     #0x10
   1CC9 20 60 1D      [ 6]  138         jsr     L1D60                                   ; STOP tape
   1CCC A9 80         [ 2]  139         lda     #0x80
   1CCE 20 60 1D      [ 6]  140         jsr     L1D60                                   ; PLAY tape
   1CD1 20 A6 1D      [ 6]  141         jsr     L1DA6                                   ; go up to carrier?
   1CD4 A9 10         [ 2]  142         lda     #0x10
   1CD6 20 60 1D      [ 6]  143         jsr     L1D60                                   ; STOP Tape
   1CD9 20 33 1D      [ 6]  144         jsr     L1D33                                   ; init the boards and audio to stopped
   1CDC A9 00         [ 2]  145         lda     #0x00
   1CDE 85 5A         [ 3]  146         sta     RAM_5A                                  ; set state to not playing
   1CE0                     147 L1CE0:
   1CE0 20 72 1E      [ 6]  148         jsr     L1E72                           
   1CE3 A5 5A         [ 3]  149         lda     RAM_5A                                  ; wait until we are triggered
   1CE5 D0 0D         [ 4]  150         bne     L1CF4                                   ; then jump
   1CE7 A9 02         [ 2]  151         lda     #0x02                                   ; else
   1CE9 8D 80 02      [ 4]  152         sta     U19_PORTA                               ; turn on RESET button light
   1CEC A9 00         [ 2]  153         lda     #0x00
   1CEE 8D 02 02      [ 4]  154         sta     U18_PORTB                               ; turn on all other button lights
   1CF1 4C E0 1C      [ 3]  155         jmp     L1CE0
                            156 ;   we have been started!
   1CF4                     157 L1CF4:
   1CF4 20 33 1D      [ 6]  158         jsr     L1D33                                   ; init the boards and audio to stopped
   1CF7 A9 00         [ 2]  159         lda     #0x00
   1CF9 8D 80 02      [ 4]  160         sta     U19_PORTA                               ; turn off RESET button light
   1CFC A9 80         [ 2]  161         lda     #0x80
   1CFE 8D 02 02      [ 4]  162         sta     U18_PORTB                               ; turn off all but PROG light
   1D01 A9 80         [ 2]  163         lda     #0x80
   1D03 20 60 1D      [ 6]  164         jsr     L1D60                                   ; PLAY tape
   1D06 20 A6 1D      [ 6]  165         jsr     L1DA6                                   ; go up to carrier?
   1D09 C6 5A         [ 5]  166         dec     RAM_5A                                  ; no longer triggered
   1D0B 20 CC 1D      [ 6]  167         jsr     L1DCC                                   ; play a track!
   1D0E 20 33 1D      [ 6]  168         jsr     L1D33                                   ; init the boards and audio to stopped
   1D11 A9 30         [ 2]  169         lda     #0x30
   1D13 85 56         [ 3]  170         sta     RAM_56                                  ; 8 minute timer?
   1D15 A9 64         [ 2]  171         lda     #0x64
   1D17 85 55         [ 3]  172         sta     RAM_55
   1D19 E6 59         [ 5]  173         inc     RAM_59                                  ; track counter
   1D1B A5 59         [ 3]  174         lda     RAM_59
   1D1D C9 1A         [ 2]  175         cmp     #0x1A                                   ; 26?
   1D1F 90 03         [ 4]  176         bcc     L1D24
   1D21 4C 73 1C      [ 3]  177         jmp     L1C73                                   ; rewind the tape after the total number of tracks are done
                            178 ;
   1D24                     179 L1D24:
   1D24 20 A6 1D      [ 6]  180         jsr     L1DA6                                   ; go up to carrier?
   1D27 A9 10         [ 2]  181         lda     #0x10
   1D29 20 60 1D      [ 6]  182         jsr     L1D60                                   ; STOP tape
   1D2C A9 00         [ 2]  183         lda     #0x00
   1D2E 85 5A         [ 3]  184         sta     RAM_5A                                  ; no longer triggered
   1D30 4C E0 1C      [ 3]  185         jmp     L1CE0
                            186 ;
   1D33                     187 L1D33:
   1D33 A9 3C         [ 2]  188         lda     #0x3C
   1D35 8D 83 03      [ 4]  189         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1D38 A9 34         [ 2]  190         lda     #0x34
   1D3A 8D 81 03      [ 4]  191         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1D3D A2 00         [ 2]  192         ldx     #0x00
   1D3F                     193 L1D3F:
   1D3F A9 30         [ 2]  194         lda     #0x30
   1D41 95 81         [ 4]  195         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1D43 95 83         [ 4]  196         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1D45 A9 FF         [ 2]  197         lda     #0xFF
   1D47 95 80         [ 4]  198         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1D49 95 82         [ 4]  199         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1D4B A9 34         [ 2]  200         lda     #0x34
   1D4D 95 81         [ 4]  201         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1D4F 95 83         [ 4]  202         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1D51 A9 00         [ 2]  203         lda     #0x00
   1D53 95 80         [ 4]  204         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1D55 95 82         [ 4]  205         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1D57 E8            [ 2]  206         inx
   1D58 E8            [ 2]  207         inx
   1D59 E8            [ 2]  208         inx
   1D5A E8            [ 2]  209         inx
   1D5B E0 20         [ 2]  210         cpx     #0x20                                   ; do for boards 1-8
   1D5D 90 E0         [ 4]  211         bcc     L1D3F
   1D5F 60            [ 6]  212         rts
                            213 ;
                            214 ;       Send Transport command for 0.255 sec
                            215 ;       and then unassert it
                            216 ;       (Used for STOP and PLAY)
                            217 ;
   1D60                     218 L1D60:
   1D60 8D 02 03      [ 4]  219         sta     transport_periph$ddr_reg_b              ; enable output line
   1D63 A9 FF         [ 2]  220         lda     #0xFF
   1D65 85 50         [ 3]  221         sta     RAM_50
   1D67                     222 L1D67:
   1D67 20 72 1E      [ 6]  223         jsr     L1E72                                   ; check for PROG button push
   1D6A A5 50         [ 3]  224         lda     RAM_50
   1D6C D0 F9         [ 4]  225         bne     L1D67
   1D6E A9 00         [ 2]  226         lda     #0x00
   1D70 8D 02 03      [ 4]  227         sta     transport_periph$ddr_reg_b
   1D73 60            [ 6]  228         rts
                            229 ;
                            230 ;       Send Transport command for 0.250 sec
                            231 ;       and keep it asserted on return
                            232 ;       (Used for Rewind and FFwd)
                            233 ;
   1D74                     234 L1D74:
   1D74 8D 02 03      [ 4]  235         sta     transport_periph$ddr_reg_b
   1D77 A9 FA         [ 2]  236         lda     #0xFA
   1D79 85 50         [ 3]  237         sta     RAM_50
   1D7B                     238 L1D7B:
   1D7B 20 72 1E      [ 6]  239         jsr     L1E72
   1D7E A5 50         [ 3]  240         lda     RAM_50
   1D80 D0 F9         [ 4]  241         bne     L1D7B
   1D82 60            [ 6]  242         rts
                            243 ;
                            244 ;       Look for header / start of data?
                            245 ;
   1D83                     246 L1D83:
   1D83 A9 00         [ 2]  247         lda     #0x00
   1D85 85 58         [ 3]  248         sta     RAM_58
   1D87                     249 L1D87:
   1D87 AD 02 03      [ 4]  250         lda     transport_periph$ddr_reg_b
   1D8A A9 0A         [ 2]  251         lda     #0x0A
   1D8C 85 50         [ 3]  252         sta     RAM_50                                  ; 10 msec
   1D8E E6 58         [ 5]  253         inc     RAM_58
   1D90 A5 58         [ 3]  254         lda     RAM_58
   1D92 C9 21         [ 2]  255         cmp     #0x21                                   ; wait for 330 msec?
   1D94 B0 0F         [ 4]  256         bcs     L1DA5                                   ; timeout - exit
   1D96                     257 L1D96:
   1D96 20 72 1E      [ 6]  258         jsr     L1E72                                   ; housekeeping
   1D99 A5 50         [ 3]  259         lda     RAM_50
   1D9B F0 E6         [ 4]  260         beq     L1D83                                   ; 10 msec done yet? then loop
   1D9D AD 03 03      [ 4]  261         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1DA0 10 F4         [ 4]  262         bpl     L1D96                                   ; if so, extend the looping
   1DA2 4C 87 1D      [ 3]  263         jmp     L1D87                                   ; else loop but keep timeout going
   1DA5                     264 L1DA5:
   1DA5 60            [ 6]  265         rts
                            266 ;
   1DA6                     267 L1DA6:
   1DA6 A9 FA         [ 2]  268         lda     #0xFA
   1DA8 85 50         [ 3]  269         sta     RAM_50                                  ; 250 msec
   1DAA                     270 L1DAA:
   1DAA 20 72 1E      [ 6]  271         jsr     L1E72                                   ; housekeeping
   1DAD A5 50         [ 3]  272         lda     RAM_50
   1DAF D0 F9         [ 4]  273         bne     L1DAA
   1DB1                     274 L1DB1:
   1DB1 20 72 1E      [ 6]  275         jsr     L1E72
   1DB4 AD 02 03      [ 4]  276         lda     transport_periph$ddr_reg_b
   1DB7 6A            [ 2]  277         ror     a
   1DB8 90 F7         [ 4]  278         bcc     L1DB1
   1DBA A9 A0         [ 2]  279         lda     #0xA0                                   ; 160 msec
   1DBC 85 50         [ 3]  280         sta     RAM_50
   1DBE                     281 L1DBE:
   1DBE 20 72 1E      [ 6]  282         jsr     L1E72
   1DC1 AD 02 03      [ 4]  283         lda     transport_periph$ddr_reg_b
   1DC4 6A            [ 2]  284         ror     a
   1DC5 90 EA         [ 4]  285         bcc     L1DB1
   1DC7 A5 50         [ 3]  286         lda     RAM_50
   1DC9 D0 F3         [ 4]  287         bne     L1DBE
   1DCB 60            [ 6]  288         rts
                            289 ;
   1DCC                     290 L1DCC:
   1DCC AD 00 03      [ 4]  291         lda     transport_periph$ddr_reg_a
   1DCF A9 40         [ 2]  292         lda     #0x40
   1DD1 85 82         [ 3]  293         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1DD3 85 86         [ 3]  294         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1DD5 85 8A         [ 3]  295         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1DD7 85 8E         [ 3]  296         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   1DD9 A9 3C         [ 2]  297         lda     #0x3C
   1DDB 8D 81 03      [ 4]  298         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   1DDE A9 34         [ 2]  299         lda     #0x34
   1DE0 8D 83 03      [ 4]  300         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   1DE3                     301 L1DE3:
   1DE3 AD 02 03      [ 4]  302         lda     transport_periph$ddr_reg_b
   1DE6 4A            [ 2]  303         lsr     a
   1DE7 90 0E         [ 4]  304         bcc     L1DF7                                   ; b0=0, no carrier, exit
   1DE9 20 72 1E      [ 6]  305         jsr     L1E72                                   ; housekeeping
   1DEC AD 01 03      [ 4]  306         lda     transport_control_reg_a                 ; Did we get a byte?
   1DEF 10 F2         [ 4]  307         bpl     L1DE3                                   ; No, loop
   1DF1 20 09 1E      [ 6]  308         jsr     L1E09                                   ; Yes, Process Incoming Byte 
   1DF4 4C E3 1D      [ 3]  309         jmp     L1DE3
                            310 ;
   1DF7                     311 L1DF7:
   1DF7 A9 64         [ 2]  312         lda     #0x64                                   ; 100 msec
   1DF9 85 50         [ 3]  313         sta     RAM_50
   1DFB                     314 L1DFB:
   1DFB 20 72 1E      [ 6]  315         jsr     L1E72
   1DFE AD 02 03      [ 4]  316         lda     transport_periph$ddr_reg_b
   1E01 4A            [ 2]  317         lsr     a
   1E02 B0 C8         [ 4]  318         bcs     L1DCC                                   ; carrier 
   1E04 A5 50         [ 3]  319         lda     RAM_50
   1E06 D0 F3         [ 4]  320         bne     L1DFB
   1E08 60            [ 6]  321         rts
                            322 ;
                            323 ; Protocol handler
                            324 ;
   1E09                     325 L1E09:
   1E09 AD 00 03      [ 4]  326         lda     transport_periph$ddr_reg_a
   1E0C 29 7F         [ 2]  327         and     #0x7F                                   ; insure data is ASCII
   1E0E 85 5C         [ 3]  328         sta     RAM_5C                                  ; store it here
   1E10 29 7E         [ 2]  329         and     #0x7E                                   ; ignore bottom bit
   1E12 C9 22         [ 2]  330         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1E14 F0 3A         [ 4]  331         beq     L1E50                                   ; if so, process as channel
   1E16 C9 32         [ 2]  332         cmp     #0x32                                   ; is it < 0x32 ?
   1E18 90 4F         [ 4]  333         bcc     L1E69                                   ; ignore it
   1E1A C9 3A         [ 2]  334         cmp     #0x3A                                   ; is it < 0x3A
   1E1C 90 32         [ 4]  335         bcc     L1E50                                   ; process as channel (0x32 to 0x39)
   1E1E A5 5C         [ 3]  336         lda     RAM_5C
   1E20 C9 41         [ 2]  337         cmp     #0x41                                   ; is it < 0x41?
   1E22 90 45         [ 4]  338         bcc     L1E69                                   ; ignore it
   1E24 C9 51         [ 2]  339         cmp     #0x51                                   ; is it >= 0x51?
   1E26 B0 41         [ 4]  340         bcs     L1E69                                   ; ignore it
   1E28 A6 64         [ 3]  341         ldx     RAM_64                                  ; X = current board address
   1E2A 38            [ 2]  342         sec                                             ; (it's 0x42 to 0x50)
   1E2B E9 41         [ 2]  343         sbc     #0x41                                   ; subtract 0x41
   1E2D C9 08         [ 2]  344         cmp     #0x08
   1E2F 90 02         [ 4]  345         bcc     L1E33                                   ; process as command
   1E31 E8            [ 2]  346         inx
   1E32 E8            [ 2]  347         inx
   1E33                     348 L1E33:
   1E33 29 07         [ 2]  349         and     #0x07                                   ; lookup bitmask in A
   1E35 A8            [ 2]  350         tay
   1E36 B9 6A 1E      [ 5]  351         lda     X1E6A,y
   1E39 85 5D         [ 3]  352         sta     RAM_5D                                  ; store mask in RAM_5D
   1E3B A5 5E         [ 3]  353         lda     RAM_5E
   1E3D 4A            [ 2]  354         lsr     a                                       ; get on/off in carry
   1E3E B0 09         [ 4]  355         bcs     L1E49                                   ; if on, jump
   1E40 A5 5D         [ 3]  356         lda     RAM_5D
   1E42 49 FF         [ 2]  357         eor     #0xFF
   1E44 35 00         [ 4]  358         and     RAM_start,x
   1E46 95 00         [ 4]  359         sta     RAM_start,x                             ; turn off solenoid
   1E48 60            [ 6]  360         rts
                            361 ;
   1E49                     362 L1E49:
   1E49 A5 5D         [ 3]  363         lda     RAM_5D
   1E4B 15 00         [ 4]  364         ora     RAM_start,x
   1E4D 95 00         [ 4]  365         sta     RAM_start,x                             ; turn on solenoid
   1E4F 60            [ 6]  366         rts
                            367 ;
   1E50                     368 L1E50:
   1E50 A5 5C         [ 3]  369         lda     RAM_5C                                  ; put channel byte in RAM_5E
   1E52 85 5E         [ 3]  370         sta     RAM_5E
   1E54 29 7E         [ 2]  371         and     #0x7E
   1E56 C9 22         [ 2]  372         cmp     #0x22
   1E58 D0 05         [ 4]  373         bne     L1E5F
   1E5A A9 98         [ 2]  374         lda     #0x98                                   ; process 0x22 or 0x23
   1E5C 85 64         [ 3]  375         sta     RAM_64                                  ; set this to 0x98 - board 7
   1E5E 60            [ 6]  376         rts
                            377 ;
   1E5F                     378 L1E5F:
   1E5F 38            [ 2]  379         sec                                             ; process channel
   1E60 E9 32         [ 2]  380         sbc     #0x32
   1E62 0A            [ 2]  381         asl     a                               
   1E63 18            [ 2]  382         clc
   1E64 69 80         [ 2]  383         adc     #0x80
   1E66 85 64         [ 3]  384         sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
   1E68 60            [ 6]  385         rts
   1E69                     386 L1E69:
   1E69 60            [ 6]  387         rts
                            388 ;
                            389 ; bit mask table
                            390 ;
   1E6A                     391 X1E6A:
   1E6A 01 02 04 08         392         .db      0x01, 0x02, 0x04, 0x08
   1E6E 10 20 40 80         393         .db      0x10, 0x20, 0x40, 0x80
                            394 ;
                            395 ; RAM_50 used on entry
                            396 ;
   1E72                     397 L1E72:
   1E72 AD 05 02      [ 4]  398         lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
   1E75 85 5F         [ 3]  399         sta     RAM_5F                                  ; store this state in 5F
   1E77 F0 50         [ 4]  400         beq     L1EC9                                   ; No flags set, return
   1E79 A5 5B         [ 3]  401         lda     RAM_5B                                  ; Are we already running?
   1E7B 30 0E         [ 4]  402         bmi     L1E8B                                   ; yes, jump ahead
   1E7D A5 5F         [ 3]  403         lda     RAM_5F                                  ; else check flags                                  
   1E7F 29 40         [ 2]  404         and     #0x40                                   ; PROG pushed?
   1E81 F0 16         [ 4]  405         beq     L1E99                                   ; if not, go to AGC
   1E83 A9 80         [ 2]  406         lda     #0x80
   1E85 85 5B         [ 3]  407         sta     RAM_5B                                  ; now we are running!
   1E87 A9 FA         [ 2]  408         lda     #0xFA
   1E89 85 51         [ 3]  409         sta     RAM_51                                  ; 
   1E8B                     410 L1E8B:
   1E8B A5 51         [ 3]  411         lda     RAM_51
   1E8D D0 06         [ 4]  412         bne     L1E95
   1E8F A9 00         [ 2]  413         lda     #0x00
   1E91 85 5B         [ 3]  414         sta     RAM_5B                                  ; we are stopped
   1E93 E6 5A         [ 5]  415         inc     RAM_5A
   1E95                     416 L1E95:
   1E95 A5 5F         [ 3]  417         lda     RAM_5F                                  ; check timer irq bit
   1E97 10 30         [ 4]  418         bpl     L1EC9                                   ; if timer not expired, return
   1E99                     419 L1E99:
   1E99 AD 04 02      [ 4]  420         lda     U18_timer                               ; read timer in U18
   1E9C 49 FF         [ 2]  421         eor     #0xFF                                   ; flip the bits
   1E9E 4A            [ 2]  422         lsr     a                                       ; keep the top 5 bits
   1E9F 4A            [ 2]  423         lsr     a
   1EA0 4A            [ 2]  424         lsr     a
   1EA1 85 57         [ 3]  425         sta     RAM_57                                  ; store them
   1EA3 90 02         [ 4]  426         bcc     L1EA7                                   ; bcc on timer bit D2
   1EA5 E6 57         [ 5]  427         inc     RAM_57                                  ; round up?
                            428                                                         ; now RAM_57 has the number of 8us 
                            429                                                         ;   intervals since timer expired
   1EA7                     430 L1EA7:
   1EA7 A9 7A         [ 2]  431         lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
   1EA9 38            [ 2]  432         sec                                             ; with programming delays, this is 1 msec
   1EAA E5 57         [ 3]  433         sbc     RAM_57
   1EAC 8D 15 02      [ 4]  434         sta     U18_timer_8T_DI                         ; set timer
   1EAF C6 50         [ 5]  435         dec     RAM_50                                  ; decrement these timers every timer reset
   1EB1 C6 51         [ 5]  436         dec     RAM_51
   1EB3 C6 52         [ 5]  437         dec     RAM_52
   1EB5 C6 53         [ 5]  438         dec     RAM_53
   1EB7 D0 10         [ 4]  439         bne     L1EC9                                   ; if timer RAM_53 expires, then wrap to 100
   1EB9 A9 64         [ 2]  440         lda     #0x64                                   ; 100
   1EBB 85 53         [ 3]  441         sta     RAM_53
   1EBD C6 54         [ 5]  442         dec     RAM_54
   1EBF C6 55         [ 5]  443         dec     RAM_55                                  
   1EC1 D0 06         [ 4]  444         bne     L1EC9                                   ; if timer RAM_55 expires, then wrap to 100
   1EC3 A9 64         [ 2]  445         lda     #0x64                                   ; 100
   1EC5 85 55         [ 3]  446         sta     RAM_55
   1EC7 C6 56         [ 5]  447         dec     RAM_56
   1EC9                     448 L1EC9:
   1EC9 60            [ 6]  449         rts
                            450 ;
                            451 ; AGC table, unused
                            452 ;
   1ECA 03 04 06 08         453         .db      0x03, 0x04, 0x06, 0x08
   1ECE 10 16 20 2D         454         .db      0x10, 0x16, 0x20, 0x2D
   1ED2 40 5A 80 BF         455         .db      0x40, 0x5A, 0x80, 0xBF
   1ED6 FF FF FF FF         456         .db      0xFF, 0xFF, 0xFF, 0xFF
                            457 ;
                            458 ; all zeros in this gap
                            459 ;
   1FFA                     460         .org    0x1FFA
                            461 ;
                            462 ; vectors
                            463 ;
   1FFA                     464 NMIVEC:
   1FFA 00 00               465         .dw      RAM_start
   1FFC                     466 RESETVEC:
   1FFC 00 1C               467         .dw      RESET
   1FFE                     468 IRQVEC:
   1FFE 00 00               469         .dw      RAM_start
