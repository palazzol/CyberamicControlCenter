                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       The Beagles/King Program
                              7 ;       Version Unknown
                              8 ;
                              9 ;       This image was recovered from a 2708 with an orange label
                             10 ;
                             11 
                     0050    12 RAM_50 = 0x0050
                     0051    13 RAM_51 = 0x0051
                     0052    14 RAM_52 = 0x0052
                     0053    15 RAM_53 = 0x0053
                     0054    16 RAM_54 = 0x0054
                     0055    17 RAM_55 = 0x0055
                     0056    18 RAM_56 = 0x0056
                     0057    19 RAM_57 = 0x0057
                     0058    20 RAM_58 = 0x0058
                     0059    21 RAM_59 = 0x0059
                     005A    22 RAM_5A = 0x005A
                     005B    23 RAM_5B = 0x005B
                     005C    24 RAM_5C = 0x005C
                     005D    25 RAM_5D = 0x005D
                     005E    26 RAM_5E = 0x005E
                     005F    27 RAM_5F = 0x005F
                     0060    28 RAM_60 = 0x0060
                     0061    29 RAM_61 = 0x0061
                     0062    30 RAM_62 = 0x0062
                     0063    31 RAM_63 = 0x0063
                     0064    32 RAM_64 = 0x0064
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
                             78 
                             79 
                             80 
                             81 
                             82 
                             35 
   1C00                      36         .org    0x1C00
                             37 ;
   1C00                      38 RESET:
   1C00 D8            [ 2]   39         cld
   1C01 78            [ 2]   40         sei
   1C02 A2 F0         [ 2]   41         ldx     #0xF0
   1C04 9A            [ 2]   42         txs
   1C05 A9 00         [ 2]   43         lda     #0x00
   1C07 A2 10         [ 2]   44         ldx     #0x10
   1C09                      45 L1C09:
   1C09 95 00         [ 4]   46         sta     RAM_start,x
   1C0B E8            [ 2]   47         inx
   1C0C E0 80         [ 2]   48         cpx     #0x80
   1C0E D0 F9         [ 4]   49         bne     L1C09
   1C10 A9 00         [ 2]   50         lda     #0x00
   1C12 8D 01 03      [ 4]   51         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   52         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   53         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   54         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   55         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   56         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   57         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   58         sta     U18_DDRA
   1C2A A9 02         [ 2]   59         lda     #0x02
   1C2C 8D 81 02      [ 4]   60         sta     U19_DDRA
   1C2F A9 FF         [ 2]   61         lda     #0xFF
   1C31 8D 82 03      [ 4]   62         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   63         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   64         sta     U19_DDRB
   1C3A A9 FC         [ 2]   65         lda     #0xFC
   1C3C 8D 02 03      [ 4]   66         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   67         lda     #0x2E
   1C41 8D 01 03      [ 4]   68         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]   69         sta     transport_control_reg_b
   1C47 8D 83 03      [ 4]   70         sta     audio_control_reg_b
   1C4A 8D 81 03      [ 4]   71         sta     audio_control_reg_a
   1C4D A9 64         [ 2]   72         lda     #0x64
   1C4F 85 53         [ 3]   73         sta     RAM_53
   1C51 A9 30         [ 2]   74         lda     #0x30
   1C53 85 56         [ 3]   75         sta     RAM_56
   1C55 A9 64         [ 2]   76         lda     #0x64
   1C57 85 55         [ 3]   77         sta     RAM_55
   1C59 A9 10         [ 2]   78         lda     #0x10
   1C5B 85 63         [ 3]   79         sta     RAM_63
   1C5D A9 10         [ 2]   80         lda     #0x10
   1C5F 20 55 1D      [ 6]   81         jsr     L1D55
   1C62 A9 28         [ 2]   82         lda     #0x28
   1C64 85 54         [ 3]   83         sta     RAM_54
   1C66 A9 64         [ 2]   84         lda     #0x64
   1C68 85 53         [ 3]   85         sta     RAM_53
   1C6A                      86 L1C6A:
   1C6A 20 6B 1E      [ 6]   87         jsr     L1E6B
   1C6D A5 54         [ 3]   88         lda     RAM_54
   1C6F D0 F9         [ 4]   89         bne     L1C6A
   1C71                      90 L1C71:
   1C71 A9 40         [ 2]   91         lda     #0x40
   1C73 20 69 1D      [ 6]   92         jsr     L1D69
   1C76                      93 L1C76:
   1C76 A9 00         [ 2]   94         lda     #0x00
   1C78 85 58         [ 3]   95         sta     RAM_58
   1C7A                      96 L1C7A:
   1C7A 20 6B 1E      [ 6]   97         jsr     L1E6B
   1C7D AD 03 03      [ 4]   98         lda     transport_control_reg_b
   1C80 10 F8         [ 4]   99         bpl     L1C7A
   1C82 A9 06         [ 2]  100         lda     #0x06
   1C84 85 54         [ 3]  101         sta     RAM_54
   1C86 A9 64         [ 2]  102         lda     #0x64
   1C88 85 53         [ 3]  103         sta     RAM_53
   1C8A                     104 L1C8A:
   1C8A 20 6B 1E      [ 6]  105         jsr     L1E6B
   1C8D AD 03 03      [ 4]  106         lda     transport_control_reg_b
   1C90 10 0B         [ 4]  107         bpl     L1C9D
   1C92 E6 58         [ 5]  108         inc     RAM_58
   1C94 AD 02 03      [ 4]  109         lda     transport_periph$ddr_reg_b
   1C97 A5 58         [ 3]  110         lda     RAM_58
   1C99 C9 64         [ 2]  111         cmp     #0x64
   1C9B B0 0B         [ 4]  112         bcs     L1CA8
   1C9D                     113 L1C9D:
   1C9D A5 54         [ 3]  114         lda     RAM_54
   1C9F D0 E9         [ 4]  115         bne     L1C8A
   1CA1 4C 76 1C      [ 3]  116         jmp     L1C76
                            117 ; unused instructions start
   1CA4 C9 60         [ 2]  118         cmp     #0x60
   1CA6 90 00         [ 4]  119         bcc     L1CA8
                            120 ; unused instructions end
                            121 ;
   1CA8                     122 L1CA8:
   1CA8 A9 20         [ 2]  123         lda     #0x20
   1CAA 20 69 1D      [ 6]  124         jsr     L1D69
   1CAD A9 19         [ 2]  125         lda     #0x19
   1CAF 85 54         [ 3]  126         sta     RAM_54
   1CB1 A9 64         [ 2]  127         lda     #0x64
   1CB3 85 53         [ 3]  128         sta     RAM_53
   1CB5                     129 L1CB5:
   1CB5 20 6B 1E      [ 6]  130         jsr     L1E6B
   1CB8 A5 54         [ 3]  131         lda     RAM_54
   1CBA D0 F9         [ 4]  132         bne     L1CB5
   1CBC A9 00         [ 2]  133         lda     #0x00
   1CBE 85 59         [ 3]  134         sta     RAM_59
   1CC0 20 78 1D      [ 6]  135         jsr     L1D78
   1CC3 E6 59         [ 5]  136         inc     RAM_59
   1CC5 A9 10         [ 2]  137         lda     #0x10
   1CC7 20 55 1D      [ 6]  138         jsr     L1D55
   1CCA A9 80         [ 2]  139         lda     #0x80
   1CCC 20 55 1D      [ 6]  140         jsr     L1D55
   1CCF 20 A6 1D      [ 6]  141         jsr     L1DA6
   1CD2 A9 10         [ 2]  142         lda     #0x10
   1CD4 20 55 1D      [ 6]  143         jsr     L1D55
   1CD7 20 32 1D      [ 6]  144         jsr     L1D32
   1CDA                     145 L1CDA:
   1CDA 20 6B 1E      [ 6]  146         jsr     L1E6B
   1CDD 20 0C 1F      [ 6]  147         jsr     L1F0C
   1CE0 A5 5A         [ 3]  148         lda     RAM_5A
   1CE2 D0 10         [ 4]  149         bne     L1CF4
   1CE4 A9 02         [ 2]  150         lda     #0x02
   1CE6 8D 80 02      [ 4]  151         sta     U19_PORTA
   1CE9 A9 00         [ 2]  152         lda     #0x00
   1CEB 8D 02 02      [ 4]  153         sta     U18_PORTB
   1CEE A5 56         [ 3]  154         lda     RAM_56
   1CF0 D0 E8         [ 4]  155         bne     L1CDA
   1CF2 E6 5A         [ 5]  156         inc     RAM_5A
   1CF4                     157 L1CF4:
   1CF4 20 32 1D      [ 6]  158         jsr     L1D32
   1CF7 A9 00         [ 2]  159         lda     #0x00
   1CF9 8D 80 02      [ 4]  160         sta     U19_PORTA
   1CFC A9 80         [ 2]  161         lda     #0x80
   1CFE 8D 02 02      [ 4]  162         sta     U18_PORTB
   1D01 A9 80         [ 2]  163         lda     #0x80
   1D03 20 55 1D      [ 6]  164         jsr     L1D55
   1D06 20 A6 1D      [ 6]  165         jsr     L1DA6
   1D09 C6 5A         [ 5]  166         dec     RAM_5A
   1D0B 20 CC 1D      [ 6]  167         jsr     L1DCC
   1D0E 20 32 1D      [ 6]  168         jsr     L1D32
   1D11 A9 30         [ 2]  169         lda     #0x30
   1D13 85 56         [ 3]  170         sta     RAM_56
   1D15 A9 64         [ 2]  171         lda     #0x64
   1D17 85 55         [ 3]  172         sta     RAM_55
   1D19 E6 59         [ 5]  173         inc     RAM_59
   1D1B A5 59         [ 3]  174         lda     RAM_59
   1D1D C9 1A         [ 2]  175         cmp     #0x1A
   1D1F 90 03         [ 4]  176         bcc     L1D24
   1D21 4C 71 1C      [ 3]  177         jmp     L1C71
                            178 ;
   1D24                     179 L1D24:
   1D24 20 A6 1D      [ 6]  180         jsr     L1DA6
   1D27 A9 10         [ 2]  181         lda     #0x10
   1D29 20 55 1D      [ 6]  182         jsr     L1D55
   1D2C 20 C3 1E      [ 6]  183         jsr     L1EC3
   1D2F 4C DA 1C      [ 3]  184         jmp     L1CDA
                            185 ;
   1D32                     186 L1D32:
   1D32 A2 00         [ 2]  187         ldx     #0x00
   1D34                     188 L1D34:
   1D34 A9 30         [ 2]  189         lda     #0x30
   1D36 95 81         [ 4]  190         sta     board_1_control_reg_a,x
   1D38 95 83         [ 4]  191         sta     board_1_control_reg_b,x
   1D3A A9 FF         [ 2]  192         lda     #0xFF
   1D3C 95 80         [ 4]  193         sta     board_1_periph$ddr_reg_a,x
   1D3E 95 82         [ 4]  194         sta     board_1_periph$ddr_reg_b,x
   1D40 A9 34         [ 2]  195         lda     #0x34
   1D42 95 81         [ 4]  196         sta     board_1_control_reg_a,x
   1D44 95 83         [ 4]  197         sta     board_1_control_reg_b,x
   1D46 A9 00         [ 2]  198         lda     #0x00
   1D48 95 80         [ 4]  199         sta     board_1_periph$ddr_reg_a,x
   1D4A 95 82         [ 4]  200         sta     board_1_periph$ddr_reg_b,x
   1D4C E8            [ 2]  201         inx
   1D4D E8            [ 2]  202         inx
   1D4E E8            [ 2]  203         inx
   1D4F E8            [ 2]  204         inx
   1D50 E0 20         [ 2]  205         cpx     #0x20
   1D52 90 E0         [ 4]  206         bcc     L1D34
   1D54 60            [ 6]  207         rts
                            208 ;
   1D55                     209 L1D55:
   1D55 8D 02 03      [ 4]  210         sta     transport_periph$ddr_reg_b
   1D58 A9 FF         [ 2]  211         lda     #0xFF
   1D5A 85 50         [ 3]  212         sta     RAM_50
   1D5C                     213 L1D5C:
   1D5C 20 6B 1E      [ 6]  214         jsr     L1E6B
   1D5F A5 50         [ 3]  215         lda     RAM_50
   1D61 D0 F9         [ 4]  216         bne     L1D5C
   1D63 A9 00         [ 2]  217         lda     #0x00
   1D65 8D 02 03      [ 4]  218         sta     transport_periph$ddr_reg_b
   1D68 60            [ 6]  219         rts
                            220 ;
   1D69                     221 L1D69:
   1D69 8D 02 03      [ 4]  222         sta     transport_periph$ddr_reg_b
   1D6C A9 FA         [ 2]  223         lda     #0xFA
   1D6E 85 50         [ 3]  224         sta     RAM_50
   1D70                     225 L1D70:
   1D70 20 6B 1E      [ 6]  226         jsr     L1E6B
   1D73 A5 50         [ 3]  227         lda     RAM_50
   1D75 D0 F9         [ 4]  228         bne     L1D70
   1D77 60            [ 6]  229         rts
                            230 ;
   1D78                     231 L1D78:
   1D78 A9 00         [ 2]  232         lda     #0x00
   1D7A 85 58         [ 3]  233         sta     RAM_58
   1D7C                     234 L1D7C:
   1D7C 20 6B 1E      [ 6]  235         jsr     L1E6B
   1D7F AD 03 03      [ 4]  236         lda     transport_control_reg_b
   1D82 10 F8         [ 4]  237         bpl     L1D7C
   1D84 A9 FA         [ 2]  238         lda     #0xFA
   1D86 85 50         [ 3]  239         sta     RAM_50
   1D88                     240 L1D88:
   1D88 20 6B 1E      [ 6]  241         jsr     L1E6B
   1D8B AD 03 03      [ 4]  242         lda     transport_control_reg_b
   1D8E 10 0B         [ 4]  243         bpl     L1D9B
   1D90 E6 58         [ 5]  244         inc     RAM_58
   1D92 AD 02 03      [ 4]  245         lda     transport_periph$ddr_reg_b
   1D95 A5 58         [ 3]  246         lda     RAM_58
   1D97 C9 60         [ 2]  247         cmp     #0x60
   1D99 B0 0A         [ 4]  248         bcs     L1DA5
   1D9B                     249 L1D9B:
   1D9B A5 50         [ 3]  250         lda     RAM_50
   1D9D D0 E9         [ 4]  251         bne     L1D88
   1D9F A5 58         [ 3]  252         lda     RAM_58
   1DA1 C9 20         [ 2]  253         cmp     #0x20
   1DA3 90 D3         [ 4]  254         bcc     L1D78
   1DA5                     255 L1DA5:
   1DA5 60            [ 6]  256         rts
                            257 ;
   1DA6                     258 L1DA6:
   1DA6 A9 FA         [ 2]  259         lda     #0xFA
   1DA8 85 50         [ 3]  260         sta     RAM_50
   1DAA                     261 L1DAA:
   1DAA 20 6B 1E      [ 6]  262         jsr     L1E6B
   1DAD A5 50         [ 3]  263         lda     RAM_50
   1DAF D0 F9         [ 4]  264         bne     L1DAA
   1DB1                     265 L1DB1:
   1DB1 20 6B 1E      [ 6]  266         jsr     L1E6B
   1DB4 AD 02 03      [ 4]  267         lda     transport_periph$ddr_reg_b
   1DB7 6A            [ 2]  268         ror     a
   1DB8 90 F7         [ 4]  269         bcc     L1DB1
   1DBA A9 A0         [ 2]  270         lda     #0xA0
   1DBC 85 50         [ 3]  271         sta     RAM_50
   1DBE                     272 L1DBE:
   1DBE 20 6B 1E      [ 6]  273         jsr     L1E6B
   1DC1 AD 02 03      [ 4]  274         lda     transport_periph$ddr_reg_b
   1DC4 6A            [ 2]  275         ror     a
   1DC5 90 EA         [ 4]  276         bcc     L1DB1
   1DC7 A5 50         [ 3]  277         lda     RAM_50
   1DC9 D0 F3         [ 4]  278         bne     L1DBE
   1DCB 60            [ 6]  279         rts
                            280 ;
   1DCC                     281 L1DCC:
   1DCC AD 00 03      [ 4]  282         lda     transport_periph$ddr_reg_a
   1DCF A9 40         [ 2]  283         lda     #0x40
   1DD1 85 82         [ 3]  284         sta     board_1_periph$ddr_reg_b
   1DD3 85 86         [ 3]  285         sta     board_2_periph$ddr_reg_b
   1DD5 85 8A         [ 3]  286         sta     board_3_periph$ddr_reg_b
   1DD7 85 8E         [ 3]  287         sta     board_4_periph$ddr_reg_b
   1DD9                     288 L1DD9:
   1DD9 AD 02 03      [ 4]  289         lda     transport_periph$ddr_reg_b
   1DDC 4A            [ 2]  290         lsr     a
   1DDD 90 11         [ 4]  291         bcc     L1DF0
   1DDF 20 0C 1F      [ 6]  292         jsr     L1F0C
   1DE2 20 6B 1E      [ 6]  293         jsr     L1E6B
   1DE5 AD 01 03      [ 4]  294         lda     transport_control_reg_a
   1DE8 10 EF         [ 4]  295         bpl     L1DD9
   1DEA 20 02 1E      [ 6]  296         jsr     L1E02
   1DED 4C D9 1D      [ 3]  297         jmp     L1DD9
                            298 ;
   1DF0                     299 L1DF0:
   1DF0 A9 64         [ 2]  300         lda     #0x64
   1DF2 85 50         [ 3]  301         sta     RAM_50
   1DF4                     302 L1DF4:
   1DF4 20 6B 1E      [ 6]  303         jsr     L1E6B
   1DF7 AD 02 03      [ 4]  304         lda     transport_periph$ddr_reg_b
   1DFA 4A            [ 2]  305         lsr     a
   1DFB B0 CF         [ 4]  306         bcs     L1DCC
   1DFD A5 50         [ 3]  307         lda     RAM_50
   1DFF D0 F3         [ 4]  308         bne     L1DF4
   1E01 60            [ 6]  309         rts
                            310 ;
   1E02                     311 L1E02:
   1E02 AD 00 03      [ 4]  312         lda     transport_periph$ddr_reg_a
   1E05 29 7F         [ 2]  313         and     #0x7F
   1E07 85 5C         [ 3]  314         sta     RAM_5C
   1E09 29 7E         [ 2]  315         and     #0x7E
   1E0B C9 22         [ 2]  316         cmp     #0x22
   1E0D F0 3A         [ 4]  317         beq     L1E49
   1E0F C9 32         [ 2]  318         cmp     #0x32
   1E11 90 4F         [ 4]  319         bcc     L1E62
   1E13 C9 3A         [ 2]  320         cmp     #0x3A
   1E15 90 32         [ 4]  321         bcc     L1E49
   1E17 A5 5C         [ 3]  322         lda     RAM_5C
   1E19 C9 41         [ 2]  323         cmp     #0x41
   1E1B 90 45         [ 4]  324         bcc     L1E62
   1E1D C9 51         [ 2]  325         cmp     #0x51
   1E1F B0 41         [ 4]  326         bcs     L1E62
   1E21 A6 64         [ 3]  327         ldx     RAM_64
   1E23 38            [ 2]  328         sec
   1E24 E9 41         [ 2]  329         sbc     #0x41
   1E26 C9 08         [ 2]  330         cmp     #0x08
   1E28 90 02         [ 4]  331         bcc     L1E2C
   1E2A E8            [ 2]  332         inx
   1E2B E8            [ 2]  333         inx
   1E2C                     334 L1E2C:
   1E2C 29 07         [ 2]  335         and     #0x07
   1E2E A8            [ 2]  336         tay
   1E2F B9 63 1E      [ 5]  337         lda     X1E63,y
   1E32 85 5D         [ 3]  338         sta     RAM_5D
   1E34 A5 5E         [ 3]  339         lda     RAM_5E
   1E36 4A            [ 2]  340         lsr     a
   1E37 B0 09         [ 4]  341         bcs     L1E42
   1E39 A5 5D         [ 3]  342         lda     RAM_5D
   1E3B 49 FF         [ 2]  343         eor     #0xFF
   1E3D 35 00         [ 4]  344         and     RAM_start,x
   1E3F 95 00         [ 4]  345         sta     RAM_start,x
   1E41 60            [ 6]  346         rts
                            347 ;
   1E42                     348 L1E42:
   1E42 A5 5D         [ 3]  349         lda     RAM_5D
   1E44 15 00         [ 4]  350         ora     RAM_start,x
   1E46 95 00         [ 4]  351         sta     RAM_start,x
   1E48 60            [ 6]  352         rts
                            353 ;
   1E49                     354 L1E49:
   1E49 A5 5C         [ 3]  355         lda     RAM_5C
   1E4B 85 5E         [ 3]  356         sta     RAM_5E
   1E4D 29 7E         [ 2]  357         and     #0x7E
   1E4F C9 22         [ 2]  358         cmp     #0x22
   1E51 D0 05         [ 4]  359         bne     L1E58
   1E53 A9 98         [ 2]  360         lda     #0x98
   1E55 85 64         [ 3]  361         sta     RAM_64
   1E57 60            [ 6]  362         rts
                            363 ;
   1E58                     364 L1E58:
   1E58 38            [ 2]  365         sec
   1E59 E9 32         [ 2]  366         sbc     #0x32
   1E5B 0A            [ 2]  367         asl     a
   1E5C 18            [ 2]  368         clc
   1E5D 69 80         [ 2]  369         adc     #0x80
   1E5F 85 64         [ 3]  370         sta     RAM_64
   1E61 60            [ 6]  371         rts
   1E62                     372 L1E62:
   1E62 60            [ 6]  373         rts
                            374 ;
   1E63                     375 X1E63:
   1E63 01 02 04 08         376         .db     0x01, 0x02, 0x04, 0x08
   1E67 10 20 40 80         377         .db     0x10, 0x20, 0x40, 0x80
                            378 ;
   1E6B                     379 L1E6B:
   1E6B AD 05 02      [ 4]  380         lda     U18_edge_detect_control_DI_pos
   1E6E 85 5F         [ 3]  381         sta     RAM_5F
   1E70 F0 50         [ 4]  382         beq     L1EC2
   1E72 A5 5B         [ 3]  383         lda     RAM_5B
   1E74 30 0E         [ 4]  384         bmi     L1E84
   1E76 A5 5F         [ 3]  385         lda     RAM_5F
   1E78 29 40         [ 2]  386         and     #0x40
   1E7A F0 16         [ 4]  387         beq     L1E92
   1E7C A9 80         [ 2]  388         lda     #0x80
   1E7E 85 5B         [ 3]  389         sta     RAM_5B
   1E80 A9 FA         [ 2]  390         lda     #0xFA
   1E82 85 51         [ 3]  391         sta     RAM_51
   1E84                     392 L1E84:
   1E84 A5 51         [ 3]  393         lda     RAM_51
   1E86 D0 06         [ 4]  394         bne     L1E8E
   1E88 A9 00         [ 2]  395         lda     #0x00
   1E8A 85 5B         [ 3]  396         sta     RAM_5B
   1E8C E6 5A         [ 5]  397         inc     RAM_5A
   1E8E                     398 L1E8E:
   1E8E A5 5F         [ 3]  399         lda     RAM_5F
   1E90 10 30         [ 4]  400         bpl     L1EC2
   1E92                     401 L1E92:
   1E92 AD 04 02      [ 4]  402         lda     U18_timer
   1E95 49 FF         [ 2]  403         eor     #0xFF
   1E97 4A            [ 2]  404         lsr     a
   1E98 4A            [ 2]  405         lsr     a
   1E99 4A            [ 2]  406         lsr     a
   1E9A 85 57         [ 3]  407         sta     RAM_57
   1E9C 90 02         [ 4]  408         bcc     L1EA0
   1E9E E6 57         [ 5]  409         inc     RAM_57
   1EA0                     410 L1EA0:
   1EA0 A9 7A         [ 2]  411         lda     #0x7A
   1EA2 38            [ 2]  412         sec
   1EA3 E5 57         [ 3]  413         sbc     RAM_57
   1EA5 8D 15 02      [ 4]  414         sta     U18_timer_8T_DI
   1EA8 C6 50         [ 5]  415         dec     RAM_50
   1EAA C6 51         [ 5]  416         dec     RAM_51
   1EAC C6 52         [ 5]  417         dec     RAM_52
   1EAE C6 53         [ 5]  418         dec     RAM_53
   1EB0 D0 10         [ 4]  419         bne     L1EC2
   1EB2 A9 64         [ 2]  420         lda     #0x64
   1EB4 85 53         [ 3]  421         sta     RAM_53
   1EB6 C6 54         [ 5]  422         dec     RAM_54
   1EB8 C6 55         [ 5]  423         dec     RAM_55
   1EBA D0 06         [ 4]  424         bne     L1EC2
   1EBC A9 64         [ 2]  425         lda     #0x64
   1EBE 85 55         [ 3]  426         sta     RAM_55
   1EC0 C6 56         [ 5]  427         dec     RAM_56
   1EC2                     428 L1EC2:
   1EC2 60            [ 6]  429         rts
                            430 ;
   1EC3                     431 L1EC3:
   1EC3 A9 00         [ 2]  432         lda     #0x00
   1EC5 85 61         [ 3]  433         sta     RAM_61
   1EC7 85 62         [ 3]  434         sta     RAM_62
   1EC9 A9 0A         [ 2]  435         lda     #0x0A
   1ECB 85 54         [ 3]  436         sta     RAM_54
   1ECD A9 64         [ 2]  437         lda     #0x64
   1ECF 85 53         [ 3]  438         sta     RAM_53
   1ED1                     439 L1ED1:
   1ED1 20 6B 1E      [ 6]  440         jsr     L1E6B
   1ED4 A5 54         [ 3]  441         lda     RAM_54
   1ED6 D0 F9         [ 4]  442         bne     L1ED1
   1ED8 A9 0A         [ 2]  443         lda     #0x0A
   1EDA 85 54         [ 3]  444         sta     RAM_54
   1EDC A9 64         [ 2]  445         lda     #0x64
   1EDE 85 53         [ 3]  446         sta     RAM_53
   1EE0 A5 62         [ 3]  447         lda     RAM_62
   1EE2 C9 08         [ 2]  448         cmp     #0x08
   1EE4 F0 15         [ 4]  449         beq     L1EFB
   1EE6 E6 62         [ 5]  450         inc     RAM_62
   1EE8 A2 09         [ 2]  451         ldx     #0x09
   1EEA 38            [ 2]  452         sec
   1EEB AD 80 03      [ 4]  453         lda     audio_periph$ddr_reg_a
   1EEE                     454 L1EEE:
   1EEE 2A            [ 2]  455         rol     a
   1EEF CA            [ 2]  456         dex
   1EF0 90 FC         [ 4]  457         bcc     L1EEE
   1EF2 18            [ 2]  458         clc
   1EF3 8A            [ 2]  459         txa
   1EF4 65 61         [ 3]  460         adc     RAM_61
   1EF6 85 61         [ 3]  461         sta     RAM_61
   1EF8 4C D1 1E      [ 3]  462         jmp     L1ED1
                            463 ;
   1EFB                     464 L1EFB:
   1EFB 46 61         [ 5]  465         lsr     RAM_61
   1EFD 46 61         [ 5]  466         lsr     RAM_61
   1EFF 46 61         [ 5]  467         lsr     RAM_61
   1F01 A5 61         [ 3]  468         lda     RAM_61
   1F03 85 60         [ 3]  469         sta     RAM_60
   1F05 A9 00         [ 2]  470         lda     #0x00
   1F07 85 61         [ 3]  471         sta     RAM_61
   1F09 85 62         [ 3]  472         sta     RAM_62
   1F0B 60            [ 6]  473         rts
                            474 ;
   1F0C                     475 L1F0C:
   1F0C AD 80 02      [ 4]  476         lda     U19_PORTA
   1F0F 49 FF         [ 2]  477         eor     #0xFF
   1F11 4A            [ 2]  478         lsr     a
   1F12 4A            [ 2]  479         lsr     a
   1F13 4A            [ 2]  480         lsr     a
   1F14 4A            [ 2]  481         lsr     a
   1F15 18            [ 2]  482         clc
   1F16 65 60         [ 3]  483         adc     RAM_60
   1F18 AA            [ 2]  484         tax
   1F19 BD 3F 1F      [ 5]  485         lda     X1F3F,x
   1F1C 85 63         [ 3]  486         sta     RAM_63
   1F1E A5 52         [ 3]  487         lda     RAM_52
   1F20 D0 16         [ 4]  488         bne     L1F38
   1F22 A9 0A         [ 2]  489         lda     #0x0A
   1F24 85 52         [ 3]  490         sta     RAM_52
   1F26 A5 63         [ 3]  491         lda     RAM_63
   1F28 CD 82 03      [ 4]  492         cmp     audio_periph$ddr_reg_b
   1F2B 90 08         [ 4]  493         bcc     L1F35
   1F2D F0 09         [ 4]  494         beq     L1F38
   1F2F EE 82 03      [ 6]  495         inc     audio_periph$ddr_reg_b
   1F32 4C 38 1F      [ 3]  496         jmp     L1F38
                            497 ;
   1F35                     498 L1F35:
   1F35 CE 82 03      [ 6]  499         dec     audio_periph$ddr_reg_b
   1F38                     500 L1F38:
   1F38 AD 82 03      [ 4]  501         lda     audio_periph$ddr_reg_b
   1F3B 8D 82 02      [ 4]  502         sta     U19_PORTB
   1F3E 60            [ 6]  503         rts
                            504 ;
   1F3F                     505 X1F3F:
   1F3F 03 04 06 08         506         .db     0x03, 0x04, 0x06, 0x08
   1F43 10 16 20 2D         507         .db     0x10, 0x16, 0x20, 0x2D
   1F47 40 5A 80 BF         508         .db     0x40, 0x5A, 0x80, 0xBF
   1F4B FF FF FF FF         509         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F4F FF                  510         .db     0xFF
                            511 ;
                            512 ; all zeros in this gap
                            513 ;
   1FFA                     514         .org    0x1FFA
                            515 ;
                            516 ; vectors
                            517 ;
   1FFA                     518 NMIVEC:
   1FFA 00 00               519         .dw     RAM_start
   1FFC                     520 RESETVEC:
   1FFC 00 1C               521         .dw     RESET
   1FFE                     522 IRQVEC:
   1FFE 00 00               523         .dw     RAM_start
