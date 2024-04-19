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
                     0080    34 board_1_periph$ddr_reg_a    = 0x0080
                     0081    35 board_1_control_reg_a       = 0x0081
                     0082    36 board_1_periph$ddr_reg_b    = 0x0082
                     0083    37 board_1_control_reg_b       = 0x0083
                     0086    38 board_2_periph$ddr_reg_b    = 0x0086
                     008A    39 board_3_periph$ddr_reg_b    = 0x008A
                     008E    40 board_4_periph$ddr_reg_b    = 0x008E
                     0200    41 U18_PORTA                   = 0x0200
                     0201    42 U18_DDRA                    = 0x0201
                     0202    43 U18_PORTB                   = 0x0202
                     0203    44 U18_DDRB                    = 0x0203
                     0204    45 U18_timer                   = 0x0204
                     0205    46 U18_edge_detect_control_DI_pos = 0x0205
                     0215    47 U18_timer_8T_DI             = 0x0215
                     0280    48 U19_PORTA                   = 0x0280
                     0281    49 U19_DDRA                    = 0x0281
                     0282    50 U19_PORTB                   = 0x0282
                     0283    51 U19_DDRB                    = 0x0283
                     0300    52 transport_periph$ddr_reg_a  = 0x0300
                     0301    53 transport_control_reg_a     = 0x0301
                     0302    54 transport_periph$ddr_reg_b  = 0x0302
                     0303    55 transport_control_reg_b     = 0x0303
                     0380    56 audio_periph$ddr_reg_a      = 0x0380
                     0381    57 audio_control_reg_a         = 0x0381
                     0382    58 audio_periph$ddr_reg_b      = 0x0382
                     0383    59 audio_control_reg_b         = 0x0383
                             60 
   1C00                      61         .org     0x1C00
                             62 ;
   1C00                      63 RESET:
   1C00 D8            [ 2]   64         cld
   1C01 78            [ 2]   65         sei                                             ; no decimal mode
   1C02 A2 F0         [ 2]   66         ldx     #0xF0                                   ; interrupts are not used
   1C04 9A            [ 2]   67         txs                                             ; stack is at 0x01F0
   1C05 A9 00         [ 2]   68         lda     #0x00                                   ; Clear and Test RAM 
   1C07 A2 10         [ 2]   69         ldx     #0x10                                   ; from 0x0010 to 0x007F
   1C09                      70 L1C09:
   1C09 95 00         [ 4]   71         sta     RAM_start,x
   1C0B E8            [ 2]   72         inx
   1C0C E0 80         [ 2]   73         cpx     #0x80
   1C0E D0 F9         [ 4]   74         bne     L1C09
   1C10 A9 00         [ 2]   75         lda     #0x00                                   ; Initialize these registers to 0x00
   1C12 8D 01 03      [ 4]   76         sta     transport_control_reg_a                 ; Clear transport control A, select DDRA
   1C15 8D 00 03      [ 4]   77         sta     transport_periph$ddr_reg_a              ; UART data inputs
   1C18 8D 81 03      [ 4]   78         sta     audio_control_reg_a                     ; Clear audio control A, select DDRA
   1C1B 8D 80 03      [ 4]   79         sta     audio_periph$ddr_reg_a                  ; Comparator inputs
   1C1E 8D 83 03      [ 4]   80         sta     audio_control_reg_b                     ; Clear audio control B
   1C21 8D 05 02      [ 4]   81         sta     U18_edge_detect_control_DI_pos          ; Detect PROG button release       
   1C24 8D 03 03      [ 4]   82         sta     transport_control_reg_b                 ; Clear transport control B, select DDRB
   1C27 8D 01 02      [ 4]   83         sta     U18_DDRA                                ; Buttons are inputs
   1C2A A9 02         [ 2]   84         lda     #0x02
   1C2C 8D 81 02      [ 4]   85         sta     U19_DDRA                                ; AGC and MIKESW are inputs, RESET Light output
   1C2F A9 FF         [ 2]   86         lda     #0xFF
   1C31 8D 82 03      [ 4]   87         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs
   1C34 8D 03 02      [ 4]   88         sta     U18_DDRB                                ; Button lights are outputs
   1C37 8D 83 02      [ 4]   89         sta     U19_DDRB                                ; CPU card lights are outputs
   1C3A A9 FC         [ 2]   90         lda     #0xFC
   1C3C 8D 02 03      [ 4]   91         sta     transport_periph$ddr_reg_b              ; transport control, chip control are outputs, PB1 & PB0 inputs           
   1C3F A9 2E         [ 2]   92         lda     #0x2E
   1C41 8D 01 03      [ 4]   93         sta     transport_control_reg_a                 ; transport CA2 is Read strobe (~DDR), set IRQA bit on ~DR low to high 
   1C44 8D 03 03      [ 4]   94         sta     transport_control_reg_b                 ; transport CB2 is Write strobe (~THRL), set IRQB bit on CB1 low to high
   1C47 A9 3C         [ 2]   95         lda     #0x3C
   1C49 8D 81 03      [ 4]   96         sta     audio_control_reg_a                     ; CA2 High - Disable BG Audio
   1C4C 8D 83 03      [ 4]   97         sta     audio_control_reg_b                     ; CB2 high - Disable Tape Audio
   1C4F A9 64         [ 2]   98         lda     #0x64
   1C51 85 53         [ 3]   99         sta     RAM_53                                  ; 100 - init 1 msec master counter
   1C53 A9 64         [ 2]  100         lda     #0x64
   1C55 85 56         [ 3]  101         sta     RAM_56                                  ; 100 - init a 1000 sec = 16 min counter?
   1C57 A9 F0         [ 2]  102         lda     #0xF0
   1C59 8D 82 03      [ 4]  103         sta     audio_periph$ddr_reg_b                  ; DAC08 outputs - upper 4 bits only?
   1C5C 8D 82 02      [ 4]  104         sta     U19_PORTB                               ; turn on CPU LEDs 5-8
   1C5F A9 10         [ 2]  105         lda     #0x10
   1C61 20 60 1D      [ 6]  106         jsr     L1D60                                   ; STOP tape
   1C64 A9 28         [ 2]  107         lda     #0x28                                   ; this will count 4 seconds
   1C66 85 54         [ 3]  108         sta     RAM_54
   1C68 A9 64         [ 2]  109         lda     #0x64                                   ; reset master timer
   1C6A 85 53         [ 3]  110         sta     RAM_53
   1C6C                     111 L1C6C:
   1C6C 20 72 1E      [ 6]  112         jsr     L1E72                                   ; do not much for 4 seconds
   1C6F A5 54         [ 3]  113         lda     RAM_54
   1C71 D0 F9         [ 4]  114         bne     L1C6C
   1C73                     115 L1C73:
   1C73 A9 40         [ 2]  116         lda     #0x40
   1C75 20 74 1D      [ 6]  117         jsr     L1D74                                   ; REWIND tape
   1C78                     118 L1C78:
   1C78 A9 00         [ 2]  119         lda     #0x00
   1C7A 85 58         [ 3]  120         sta     RAM_58                                  ; counter to zero
   1C7C                     121 L1C7C:
   1C7C 20 72 1E      [ 6]  122         jsr     L1E72                                   ; housekeeping
   1C7F AD 03 03      [ 4]  123         lda     transport_control_reg_b                 ; loop until we see tone marking beginning of tape
   1C82 10 F8         [ 4]  124         bpl     L1C7C
   1C84 A9 06         [ 2]  125         lda     #0x06
   1C86 85 54         [ 3]  126         sta     RAM_54                                  ; set 0.6 second timer
   1C88 A9 64         [ 2]  127         lda     #0x64                                   ; 100 rising edge transitions
   1C8A 85 53         [ 3]  128         sta     RAM_53
   1C8C                     129 L1C8C:
   1C8C 20 72 1E      [ 6]  130         jsr     L1E72                                   ; housekeeping
   1C8F AD 03 03      [ 4]  131         lda     transport_control_reg_b                 ; loop until 100 transport CB1 rising edges or 0.6 secs expired
   1C92 10 0B         [ 4]  132         bpl     L1C9F
   1C94 E6 58         [ 5]  133         inc     RAM_58                                  ; count transistions
   1C96 AD 02 03      [ 4]  134         lda     transport_periph$ddr_reg_b
   1C99 A5 58         [ 3]  135         lda     RAM_58
   1C9B C9 64         [ 2]  136         cmp     #0x64
   1C9D B0 0B         [ 4]  137         bcs     L1CAA                                   ; happened 100 times, tape is at the beginning, jump ahead
   1C9F                     138 L1C9F:
   1C9F A5 54         [ 3]  139         lda     RAM_54
   1CA1 D0 E9         [ 4]  140         bne     L1C8C
   1CA3 4C 78 1C      [ 3]  141         jmp     L1C78
                            142 ; unused instructions start
   1CA6 C9 60         [ 2]  143         cmp     #0x60
   1CA8 90 00         [ 4]  144         bcc     L1CAA
                            145 ; unused instructions end
                            146 ;
   1CAA                     147 L1CAA:
   1CAA A9 20         [ 2]  148         lda     #0x20
   1CAC 20 74 1D      [ 6]  149         jsr     L1D74                                   ; FFWD tape
   1CAF A9 19         [ 2]  150         lda     #0x19
   1CB1 85 54         [ 3]  151         sta     RAM_54                                  ; for 2.5 secs
   1CB3 A9 64         [ 2]  152         lda     #0x64
   1CB5 85 53         [ 3]  153         sta     RAM_53
   1CB7                     154 L1CB7:
   1CB7 20 72 1E      [ 6]  155         jsr     L1E72                                   ; do housekeeping stuff
   1CBA A5 54         [ 3]  156         lda     RAM_54
   1CBC D0 F9         [ 4]  157         bne     L1CB7
   1CBE A9 00         [ 2]  158         lda     #0x00
   1CC0 85 59         [ 3]  159         sta     RAM_59
   1CC2 20 83 1D      [ 6]  160         jsr     L1D83                                   ; look for start of data??
   1CC5 E6 59         [ 5]  161         inc     RAM_59
   1CC7 A9 10         [ 2]  162         lda     #0x10
   1CC9 20 60 1D      [ 6]  163         jsr     L1D60                                   ; STOP tape
   1CCC A9 80         [ 2]  164         lda     #0x80
   1CCE 20 60 1D      [ 6]  165         jsr     L1D60                                   ; PLAY tape
   1CD1 20 A6 1D      [ 6]  166         jsr     L1DA6                                   ; go up to carrier?
   1CD4 A9 10         [ 2]  167         lda     #0x10
   1CD6 20 60 1D      [ 6]  168         jsr     L1D60                                   ; STOP Tape
   1CD9 20 33 1D      [ 6]  169         jsr     L1D33                                   ; init the boards and audio to stopped
   1CDC A9 00         [ 2]  170         lda     #0x00
   1CDE 85 5A         [ 3]  171         sta     RAM_5A                                  ; set state to not playing
   1CE0                     172 L1CE0:
   1CE0 20 72 1E      [ 6]  173         jsr     L1E72                           
   1CE3 A5 5A         [ 3]  174         lda     RAM_5A                                  ; wait until we are triggered
   1CE5 D0 0D         [ 4]  175         bne     L1CF4                                   ; then jump
   1CE7 A9 02         [ 2]  176         lda     #0x02                                   ; else
   1CE9 8D 80 02      [ 4]  177         sta     U19_PORTA                               ; turn on RESET button light
   1CEC A9 00         [ 2]  178         lda     #0x00
   1CEE 8D 02 02      [ 4]  179         sta     U18_PORTB                               ; turn on all other button lights
   1CF1 4C E0 1C      [ 3]  180         jmp     L1CE0
                            181 ;   we have been started!
   1CF4                     182 L1CF4:
   1CF4 20 33 1D      [ 6]  183         jsr     L1D33                                   ; init the boards and audio to stopped
   1CF7 A9 00         [ 2]  184         lda     #0x00
   1CF9 8D 80 02      [ 4]  185         sta     U19_PORTA                               ; turn off RESET button light
   1CFC A9 80         [ 2]  186         lda     #0x80
   1CFE 8D 02 02      [ 4]  187         sta     U18_PORTB                               ; turn off all but PROG light
   1D01 A9 80         [ 2]  188         lda     #0x80
   1D03 20 60 1D      [ 6]  189         jsr     L1D60                                   ; PLAY tape
   1D06 20 A6 1D      [ 6]  190         jsr     L1DA6                                   ; go up to carrier?
   1D09 C6 5A         [ 5]  191         dec     RAM_5A                                  ; no longer triggered
   1D0B 20 CC 1D      [ 6]  192         jsr     L1DCC                                   ; play a track!
   1D0E 20 33 1D      [ 6]  193         jsr     L1D33                                   ; init the boards and audio to stopped
   1D11 A9 30         [ 2]  194         lda     #0x30
   1D13 85 56         [ 3]  195         sta     RAM_56                                  ; 8 minute timer?
   1D15 A9 64         [ 2]  196         lda     #0x64
   1D17 85 55         [ 3]  197         sta     RAM_55
   1D19 E6 59         [ 5]  198         inc     RAM_59                                  ; track counter
   1D1B A5 59         [ 3]  199         lda     RAM_59
   1D1D C9 1A         [ 2]  200         cmp     #0x1A                                   ; 26?
   1D1F 90 03         [ 4]  201         bcc     L1D24
   1D21 4C 73 1C      [ 3]  202         jmp     L1C73                                   ; rewind the tape after the total number of tracks are done
                            203 ;
   1D24                     204 L1D24:
   1D24 20 A6 1D      [ 6]  205         jsr     L1DA6                                   ; go up to carrier?
   1D27 A9 10         [ 2]  206         lda     #0x10
   1D29 20 60 1D      [ 6]  207         jsr     L1D60                                   ; STOP tape
   1D2C A9 00         [ 2]  208         lda     #0x00
   1D2E 85 5A         [ 3]  209         sta     RAM_5A                                  ; no longer triggered
   1D30 4C E0 1C      [ 3]  210         jmp     L1CE0
                            211 ;
   1D33                     212 L1D33:
   1D33 A9 3C         [ 2]  213         lda     #0x3C
   1D35 8D 83 03      [ 4]  214         sta     audio_control_reg_b                     ; CB2 High (Disable Tape Audio)
   1D38 A9 34         [ 2]  215         lda     #0x34
   1D3A 8D 81 03      [ 4]  216         sta     audio_control_reg_a                     ; CA2 Low (Enable BG Audio)
   1D3D A2 00         [ 2]  217         ldx     #0x00
   1D3F                     218 L1D3F:
   1D3F A9 30         [ 2]  219         lda     #0x30
   1D41 95 81         [ 4]  220         sta     board_1_control_reg_a,x                 ; boardX CA2 low, DDR select
   1D43 95 83         [ 4]  221         sta     board_1_control_reg_b,x                 ; boardX CB2 low, DDR select
   1D45 A9 FF         [ 2]  222         lda     #0xFF
   1D47 95 80         [ 4]  223         sta     board_1_periph$ddr_reg_a,x              ; all A pins to outputs
   1D49 95 82         [ 4]  224         sta     board_1_periph$ddr_reg_b,x              ; all B pins to outputs
   1D4B A9 34         [ 2]  225         lda     #0x34
   1D4D 95 81         [ 4]  226         sta     board_1_control_reg_a,x                 ; A peripheral selected
   1D4F 95 83         [ 4]  227         sta     board_1_control_reg_b,x                 ; B peripheral selected
   1D51 A9 00         [ 2]  228         lda     #0x00
   1D53 95 80         [ 4]  229         sta     board_1_periph$ddr_reg_a,x              ; A solenoids off
   1D55 95 82         [ 4]  230         sta     board_1_periph$ddr_reg_b,x              ; B solenoids off
   1D57 E8            [ 2]  231         inx
   1D58 E8            [ 2]  232         inx
   1D59 E8            [ 2]  233         inx
   1D5A E8            [ 2]  234         inx
   1D5B E0 20         [ 2]  235         cpx     #0x20                                   ; do for boards 1-8
   1D5D 90 E0         [ 4]  236         bcc     L1D3F
   1D5F 60            [ 6]  237         rts
                            238 ;
                            239 ;       Send Transport command for 0.255 sec
                            240 ;       and then unassert it
                            241 ;       (Used for STOP and PLAY)
                            242 ;
   1D60                     243 L1D60:
   1D60 8D 02 03      [ 4]  244         sta     transport_periph$ddr_reg_b              ; enable output line
   1D63 A9 FF         [ 2]  245         lda     #0xFF
   1D65 85 50         [ 3]  246         sta     RAM_50
   1D67                     247 L1D67:
   1D67 20 72 1E      [ 6]  248         jsr     L1E72                                   ; check for PROG button push
   1D6A A5 50         [ 3]  249         lda     RAM_50
   1D6C D0 F9         [ 4]  250         bne     L1D67
   1D6E A9 00         [ 2]  251         lda     #0x00
   1D70 8D 02 03      [ 4]  252         sta     transport_periph$ddr_reg_b
   1D73 60            [ 6]  253         rts
                            254 ;
                            255 ;       Send Transport command for 0.250 sec
                            256 ;       and keep it asserted on return
                            257 ;       (Used for Rewind and FFwd)
                            258 ;
   1D74                     259 L1D74:
   1D74 8D 02 03      [ 4]  260         sta     transport_periph$ddr_reg_b
   1D77 A9 FA         [ 2]  261         lda     #0xFA
   1D79 85 50         [ 3]  262         sta     RAM_50
   1D7B                     263 L1D7B:
   1D7B 20 72 1E      [ 6]  264         jsr     L1E72
   1D7E A5 50         [ 3]  265         lda     RAM_50
   1D80 D0 F9         [ 4]  266         bne     L1D7B
   1D82 60            [ 6]  267         rts
                            268 ;
                            269 ;       Look for header / start of data?
                            270 ;
   1D83                     271 L1D83:
   1D83 A9 00         [ 2]  272         lda     #0x00
   1D85 85 58         [ 3]  273         sta     RAM_58
   1D87                     274 L1D87:
   1D87 AD 02 03      [ 4]  275         lda     transport_periph$ddr_reg_b
   1D8A A9 0A         [ 2]  276         lda     #0x0A
   1D8C 85 50         [ 3]  277         sta     RAM_50                                  ; 10 msec
   1D8E E6 58         [ 5]  278         inc     RAM_58
   1D90 A5 58         [ 3]  279         lda     RAM_58
   1D92 C9 21         [ 2]  280         cmp     #0x21                                   ; wait for 330 msec?
   1D94 B0 0F         [ 4]  281         bcs     L1DA5                                   ; timeout - exit
   1D96                     282 L1D96:
   1D96 20 72 1E      [ 6]  283         jsr     L1E72                                   ; housekeeping
   1D99 A5 50         [ 3]  284         lda     RAM_50
   1D9B F0 E6         [ 4]  285         beq     L1D83                                   ; 10 msec done yet? then loop
   1D9D AD 03 03      [ 4]  286         lda     transport_control_reg_b                 ; transport CB1 rising edge?
   1DA0 10 F4         [ 4]  287         bpl     L1D96                                   ; if so, extend the looping
   1DA2 4C 87 1D      [ 3]  288         jmp     L1D87                                   ; else loop but keep timeout going
   1DA5                     289 L1DA5:
   1DA5 60            [ 6]  290         rts
                            291 ;
   1DA6                     292 L1DA6:
   1DA6 A9 FA         [ 2]  293         lda     #0xFA
   1DA8 85 50         [ 3]  294         sta     RAM_50                                  ; 250 msec
   1DAA                     295 L1DAA:
   1DAA 20 72 1E      [ 6]  296         jsr     L1E72                                   ; housekeeping
   1DAD A5 50         [ 3]  297         lda     RAM_50
   1DAF D0 F9         [ 4]  298         bne     L1DAA
   1DB1                     299 L1DB1:
   1DB1 20 72 1E      [ 6]  300         jsr     L1E72
   1DB4 AD 02 03      [ 4]  301         lda     transport_periph$ddr_reg_b
   1DB7 6A            [ 2]  302         ror     a
   1DB8 90 F7         [ 4]  303         bcc     L1DB1
   1DBA A9 A0         [ 2]  304         lda     #0xA0                                   ; 160 msec
   1DBC 85 50         [ 3]  305         sta     RAM_50
   1DBE                     306 L1DBE:
   1DBE 20 72 1E      [ 6]  307         jsr     L1E72
   1DC1 AD 02 03      [ 4]  308         lda     transport_periph$ddr_reg_b
   1DC4 6A            [ 2]  309         ror     a
   1DC5 90 EA         [ 4]  310         bcc     L1DB1
   1DC7 A5 50         [ 3]  311         lda     RAM_50
   1DC9 D0 F3         [ 4]  312         bne     L1DBE
   1DCB 60            [ 6]  313         rts
                            314 ;
   1DCC                     315 L1DCC:
   1DCC AD 00 03      [ 4]  316         lda     transport_periph$ddr_reg_a
   1DCF A9 40         [ 2]  317         lda     #0x40
   1DD1 85 82         [ 3]  318         sta     board_1_periph$ddr_reg_b                ; only Board 1 PB6 on
   1DD3 85 86         [ 3]  319         sta     board_2_periph$ddr_reg_b                ; only Board 2 PB6 on
   1DD5 85 8A         [ 3]  320         sta     board_3_periph$ddr_reg_b                ; only Board 3 PB6 on
   1DD7 85 8E         [ 3]  321         sta     board_4_periph$ddr_reg_b                ; only Board 4 PB6 on
   1DD9 A9 3C         [ 2]  322         lda     #0x3C
   1DDB 8D 81 03      [ 4]  323         sta     audio_control_reg_a                     ; CA2 High (Disable Other Audio)
   1DDE A9 34         [ 2]  324         lda     #0x34
   1DE0 8D 83 03      [ 4]  325         sta     audio_control_reg_b                     ; CB2 Low (Enable Tape Audio)
   1DE3                     326 L1DE3:
   1DE3 AD 02 03      [ 4]  327         lda     transport_periph$ddr_reg_b
   1DE6 4A            [ 2]  328         lsr     a
   1DE7 90 0E         [ 4]  329         bcc     L1DF7                                   ; b0=0, no carrier, exit
   1DE9 20 72 1E      [ 6]  330         jsr     L1E72                                   ; housekeeping
   1DEC AD 01 03      [ 4]  331         lda     transport_control_reg_a                 ; Did we get a byte?
   1DEF 10 F2         [ 4]  332         bpl     L1DE3                                   ; No, loop
   1DF1 20 09 1E      [ 6]  333         jsr     L1E09                                   ; Yes, Process Incoming Byte 
   1DF4 4C E3 1D      [ 3]  334         jmp     L1DE3
                            335 ;
   1DF7                     336 L1DF7:
   1DF7 A9 64         [ 2]  337         lda     #0x64                                   ; 100 msec
   1DF9 85 50         [ 3]  338         sta     RAM_50
   1DFB                     339 L1DFB:
   1DFB 20 72 1E      [ 6]  340         jsr     L1E72
   1DFE AD 02 03      [ 4]  341         lda     transport_periph$ddr_reg_b
   1E01 4A            [ 2]  342         lsr     a
   1E02 B0 C8         [ 4]  343         bcs     L1DCC                                   ; carrier 
   1E04 A5 50         [ 3]  344         lda     RAM_50
   1E06 D0 F3         [ 4]  345         bne     L1DFB
   1E08 60            [ 6]  346         rts
                            347 ;
                            348 ; Protocol handler
                            349 ;
   1E09                     350 L1E09:
   1E09 AD 00 03      [ 4]  351         lda     transport_periph$ddr_reg_a
   1E0C 29 7F         [ 2]  352         and     #0x7F                                   ; insure data is ASCII
   1E0E 85 5C         [ 3]  353         sta     RAM_5C                                  ; store it here
   1E10 29 7E         [ 2]  354         and     #0x7E                                   ; ignore bottom bit
   1E12 C9 22         [ 2]  355         cmp     #0x22                                   ; is it 0x22 or 0x23?
   1E14 F0 3A         [ 4]  356         beq     L1E50                                   ; if so, process as channel
   1E16 C9 32         [ 2]  357         cmp     #0x32                                   ; is it < 0x32 ?
   1E18 90 4F         [ 4]  358         bcc     L1E69                                   ; ignore it
   1E1A C9 3A         [ 2]  359         cmp     #0x3A                                   ; is it < 0x3A
   1E1C 90 32         [ 4]  360         bcc     L1E50                                   ; process as channel (0x32 to 0x39)
   1E1E A5 5C         [ 3]  361         lda     RAM_5C
   1E20 C9 41         [ 2]  362         cmp     #0x41                                   ; is it < 0x41?
   1E22 90 45         [ 4]  363         bcc     L1E69                                   ; ignore it
   1E24 C9 51         [ 2]  364         cmp     #0x51                                   ; is it >= 0x51?
   1E26 B0 41         [ 4]  365         bcs     L1E69                                   ; ignore it
   1E28 A6 64         [ 3]  366         ldx     RAM_64                                  ; X = current board address
   1E2A 38            [ 2]  367         sec                                             ; (it's 0x42 to 0x50)
   1E2B E9 41         [ 2]  368         sbc     #0x41                                   ; subtract 0x41
   1E2D C9 08         [ 2]  369         cmp     #0x08
   1E2F 90 02         [ 4]  370         bcc     L1E33                                   ; process as command
   1E31 E8            [ 2]  371         inx
   1E32 E8            [ 2]  372         inx
   1E33                     373 L1E33:
   1E33 29 07         [ 2]  374         and     #0x07                                   ; lookup bitmask in A
   1E35 A8            [ 2]  375         tay
   1E36 B9 6A 1E      [ 5]  376         lda     X1E6A,y
   1E39 85 5D         [ 3]  377         sta     RAM_5D                                  ; store mask in RAM_5D
   1E3B A5 5E         [ 3]  378         lda     RAM_5E
   1E3D 4A            [ 2]  379         lsr     a                                       ; get on/off in carry
   1E3E B0 09         [ 4]  380         bcs     L1E49                                   ; if on, jump
   1E40 A5 5D         [ 3]  381         lda     RAM_5D
   1E42 49 FF         [ 2]  382         eor     #0xFF
   1E44 35 00         [ 4]  383         and     RAM_start,x
   1E46 95 00         [ 4]  384         sta     RAM_start,x                             ; turn off solenoid
   1E48 60            [ 6]  385         rts
                            386 ;
   1E49                     387 L1E49:
   1E49 A5 5D         [ 3]  388         lda     RAM_5D
   1E4B 15 00         [ 4]  389         ora     RAM_start,x
   1E4D 95 00         [ 4]  390         sta     RAM_start,x                             ; turn on solenoid
   1E4F 60            [ 6]  391         rts
                            392 ;
   1E50                     393 L1E50:
   1E50 A5 5C         [ 3]  394         lda     RAM_5C                                  ; put channel byte in RAM_5E
   1E52 85 5E         [ 3]  395         sta     RAM_5E
   1E54 29 7E         [ 2]  396         and     #0x7E
   1E56 C9 22         [ 2]  397         cmp     #0x22
   1E58 D0 05         [ 4]  398         bne     L1E5F
   1E5A A9 98         [ 2]  399         lda     #0x98                                   ; process 0x22 or 0x23
   1E5C 85 64         [ 3]  400         sta     RAM_64                                  ; set this to 0x98 - board 7
   1E5E 60            [ 6]  401         rts
                            402 ;
   1E5F                     403 L1E5F:
   1E5F 38            [ 2]  404         sec                                             ; process channel
   1E60 E9 32         [ 2]  405         sbc     #0x32
   1E62 0A            [ 2]  406         asl     a                               
   1E63 18            [ 2]  407         clc
   1E64 69 80         [ 2]  408         adc     #0x80
   1E66 85 64         [ 3]  409         sta     RAM_64                                  ; (X-0x32) * 2 + 0x80
   1E68 60            [ 6]  410         rts
   1E69                     411 L1E69:
   1E69 60            [ 6]  412         rts
                            413 ;
                            414 ; bit mask table
                            415 ;
   1E6A                     416 X1E6A:
   1E6A 01 02 04 08         417         .db      0x01, 0x02, 0x04, 0x08
   1E6E 10 20 40 80         418         .db      0x10, 0x20, 0x40, 0x80
                            419 ;
                            420 ; RAM_50 used on entry
                            421 ;
   1E72                     422 L1E72:
   1E72 AD 05 02      [ 4]  423         lda     U18_edge_detect_control_DI_pos          ; Did the PROG button get pushed or timer expire?
   1E75 85 5F         [ 3]  424         sta     RAM_5F                                  ; store this state in 5F
   1E77 F0 50         [ 4]  425         beq     L1EC9                                   ; No flags set, return
   1E79 A5 5B         [ 3]  426         lda     RAM_5B                                  ; Are we already running?
   1E7B 30 0E         [ 4]  427         bmi     L1E8B                                   ; yes, jump ahead
   1E7D A5 5F         [ 3]  428         lda     RAM_5F                                  ; else check flags                                  
   1E7F 29 40         [ 2]  429         and     #0x40                                   ; PROG pushed?
   1E81 F0 16         [ 4]  430         beq     L1E99                                   ; if not, go to AGC
   1E83 A9 80         [ 2]  431         lda     #0x80
   1E85 85 5B         [ 3]  432         sta     RAM_5B                                  ; now we are running!
   1E87 A9 FA         [ 2]  433         lda     #0xFA
   1E89 85 51         [ 3]  434         sta     RAM_51                                  ; 
   1E8B                     435 L1E8B:
   1E8B A5 51         [ 3]  436         lda     RAM_51
   1E8D D0 06         [ 4]  437         bne     L1E95
   1E8F A9 00         [ 2]  438         lda     #0x00
   1E91 85 5B         [ 3]  439         sta     RAM_5B                                  ; we are stopped
   1E93 E6 5A         [ 5]  440         inc     RAM_5A
   1E95                     441 L1E95:
   1E95 A5 5F         [ 3]  442         lda     RAM_5F                                  ; check timer irq bit
   1E97 10 30         [ 4]  443         bpl     L1EC9                                   ; if timer not expired, return
   1E99                     444 L1E99:
   1E99 AD 04 02      [ 4]  445         lda     U18_timer                               ; read timer in U18
   1E9C 49 FF         [ 2]  446         eor     #0xFF                                   ; flip the bits
   1E9E 4A            [ 2]  447         lsr     a                                       ; keep the top 5 bits
   1E9F 4A            [ 2]  448         lsr     a
   1EA0 4A            [ 2]  449         lsr     a
   1EA1 85 57         [ 3]  450         sta     RAM_57                                  ; store them
   1EA3 90 02         [ 4]  451         bcc     L1EA7                                   ; bcc on timer bit D2
   1EA5 E6 57         [ 5]  452         inc     RAM_57                                  ; round up?
                            453                                                         ; now RAM_57 has the number of 8us 
                            454                                                         ;   intervals since timer expired
   1EA7                     455 L1EA7:
   1EA7 A9 7A         [ 2]  456         lda     #0x7A                                   ; reset timer to expire every 0x7A*8 ~= 976 usec?
   1EA9 38            [ 2]  457         sec                                             ; with programming delays, this is 1 msec
   1EAA E5 57         [ 3]  458         sbc     RAM_57
   1EAC 8D 15 02      [ 4]  459         sta     U18_timer_8T_DI                         ; set timer
   1EAF C6 50         [ 5]  460         dec     RAM_50                                  ; decrement these timers every timer reset
   1EB1 C6 51         [ 5]  461         dec     RAM_51
   1EB3 C6 52         [ 5]  462         dec     RAM_52
   1EB5 C6 53         [ 5]  463         dec     RAM_53
   1EB7 D0 10         [ 4]  464         bne     L1EC9                                   ; if timer RAM_53 expires, then wrap to 100
   1EB9 A9 64         [ 2]  465         lda     #0x64                                   ; 100
   1EBB 85 53         [ 3]  466         sta     RAM_53
   1EBD C6 54         [ 5]  467         dec     RAM_54
   1EBF C6 55         [ 5]  468         dec     RAM_55                                  
   1EC1 D0 06         [ 4]  469         bne     L1EC9                                   ; if timer RAM_55 expires, then wrap to 100
   1EC3 A9 64         [ 2]  470         lda     #0x64                                   ; 100
   1EC5 85 55         [ 3]  471         sta     RAM_55
   1EC7 C6 56         [ 5]  472         dec     RAM_56
   1EC9                     473 L1EC9:
   1EC9 60            [ 6]  474         rts
                            475 ;
                            476 ; AGC table, unused
                            477 ;
   1ECA 03 04 06 08         478         .db      0x03, 0x04, 0x06, 0x08
   1ECE 10 16 20 2D         479         .db      0x10, 0x16, 0x20, 0x2D
   1ED2 40 5A 80 BF         480         .db      0x40, 0x5A, 0x80, 0xBF
   1ED6 FF FF FF FF         481         .db      0xFF, 0xFF, 0xFF, 0xFF
                            482 ;
                            483 ; all zeros in this gap
                            484 ;
   1FFA                     485         .org    0x1FFA
                            486 ;
                            487 ; vectors
                            488 ;
   1FFA                     489 NMIVEC:
   1FFA 00 00               490         .dw      RAM_start
   1FFC                     491 RESETVEC:
   1FFC 00 1C               492         .dw      RESET
   1FFE                     493 IRQVEC:
   1FFE 00 00               494         .dw      RAM_start
