                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       Unknown Program (1)
                              7 ;       Version Unknown
                              8 ;
                              9 ;       This image was recovered from the last quarter of a 2732 with a black label
                             10 ;
                     0050    11 RAM_50 = 0x0050
                     0051    12 RAM_51 = 0x0051
                     0052    13 RAM_52 = 0x0052
                     0053    14 RAM_53 = 0x0053
                     0054    15 RAM_54 = 0x0054
                     0055    16 RAM_55 = 0x0055
                     0056    17 RAM_56 = 0x0056
                     0057    18 RAM_57 = 0x0057
                     0058    19 RAM_58 = 0x0058
                     0059    20 RAM_59 = 0x0059
                     005A    21 RAM_5A = 0x005A
                     005B    22 RAM_5B = 0x005B
                     005C    23 RAM_5C = 0x005C
                     005D    24 RAM_5D = 0x005D
                     005E    25 RAM_5E = 0x005E
                     005F    26 RAM_5F = 0x005F
                     0060    27 RAM_60 = 0x0060
                     0061    28 RAM_61 = 0x0061
                     0062    29 RAM_62 = 0x0062
                     0063    30 RAM_63 = 0x0063
                     0064    31 RAM_64 = 0x0064
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
                             78 
                             79 
                             80 
                             81 
                             82 
                             34 
   1C00                      35         .org    0x1C00
                             36 ;
   1C00                      37 RESET:
   1C00 D8            [ 2]   38         cld
   1C01 78            [ 2]   39         sei
   1C02 A2 F0         [ 2]   40         ldx     #0xF0
   1C04 9A            [ 2]   41         txs
   1C05 A9 00         [ 2]   42         lda     #0x00
   1C07 A2 10         [ 2]   43         ldx     #0x10
   1C09                      44 L1C09:
   1C09 95 00         [ 4]   45         sta     RAM_start,x
   1C0B E8            [ 2]   46         inx
   1C0C E0 80         [ 2]   47         cpx     #0x80
   1C0E D0 F9         [ 4]   48         bne     L1C09
   1C10 A9 00         [ 2]   49         lda     #0x00
   1C12 8D 01 03      [ 4]   50         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   51         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   52         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   53         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   54         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   55         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   56         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   57         sta     U18_DDRA
   1C2A A9 02         [ 2]   58         lda     #0x02
   1C2C 8D 81 02      [ 4]   59         sta     U19_DDRA
   1C2F A9 FF         [ 2]   60         lda     #0xFF
   1C31 8D 82 03      [ 4]   61         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   62         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   63         sta     U19_DDRB
   1C3A A9 FC         [ 2]   64         lda     #0xFC
   1C3C 8D 02 03      [ 4]   65         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   66         lda     #0x2E
   1C41 8D 01 03      [ 4]   67         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]   68         sta     transport_control_reg_b
   1C47 A9 3C         [ 2]   69         lda     #0x3C
   1C49 8D 81 03      [ 4]   70         sta     audio_control_reg_a
   1C4C 8D 83 03      [ 4]   71         sta     audio_control_reg_b
   1C4F A9 64         [ 2]   72         lda     #0x64
   1C51 85 53         [ 3]   73         sta     RAM_53
   1C53 A9 1E         [ 2]   74         lda     #0x1E
   1C55 85 56         [ 3]   75         sta     RAM_56
   1C57 A9 64         [ 2]   76         lda     #0x64
   1C59 85 55         [ 3]   77         sta     RAM_55
   1C5B A9 10         [ 2]   78         lda     #0x10
   1C5D 85 63         [ 3]   79         sta     RAM_63
   1C5F A9 10         [ 2]   80         lda     #0x10
   1C61 20 72 1D      [ 6]   81         jsr     L1D72
   1C64 A9 28         [ 2]   82         lda     #0x28
   1C66 85 54         [ 3]   83         sta     RAM_54
   1C68 A9 64         [ 2]   84         lda     #0x64
   1C6A 85 53         [ 3]   85         sta     RAM_53
   1C6C                      86 L1C6C:
   1C6C 20 83 1E      [ 6]   87         jsr     L1E83
   1C6F A5 54         [ 3]   88         lda     RAM_54
   1C71 D0 F9         [ 4]   89         bne     L1C6C
   1C73                      90 L1C73:
   1C73 A9 40         [ 2]   91         lda     #0x40
   1C75 20 72 1D      [ 6]   92         jsr     L1D72
   1C78                      93 L1C78:
   1C78 A9 00         [ 2]   94         lda     #0x00
   1C7A 85 58         [ 3]   95         sta     RAM_58
   1C7C                      96 L1C7C:
   1C7C AD 02 03      [ 4]   97         lda     transport_periph$ddr_reg_b
   1C7F A9 0A         [ 2]   98         lda     #0x0A
   1C81 85 50         [ 3]   99         sta     RAM_50
   1C83 E6 58         [ 5]  100         inc     RAM_58
   1C85 A5 58         [ 3]  101         lda     RAM_58
   1C87 C9 64         [ 2]  102         cmp     #0x64
   1C89 B0 0F         [ 4]  103         bcs     L1C9A
   1C8B                     104 L1C8B:
   1C8B 20 83 1E      [ 6]  105         jsr     L1E83
   1C8E A5 50         [ 3]  106         lda     RAM_50
   1C90 F0 E6         [ 4]  107         beq     L1C78
   1C92 AD 03 03      [ 4]  108         lda     transport_control_reg_b
   1C95 10 F4         [ 4]  109         bpl     L1C8B
   1C97 4C 7C 1C      [ 3]  110         jmp     L1C7C
                            111 ;
   1C9A                     112 L1C9A:
   1C9A A9 20         [ 2]  113         lda     #0x20
   1C9C 20 72 1D      [ 6]  114         jsr     L1D72
   1C9F A9 19         [ 2]  115         lda     #0x19
   1CA1 85 54         [ 3]  116         sta     RAM_54
   1CA3 A9 64         [ 2]  117         lda     #0x64
   1CA5 85 53         [ 3]  118         sta     RAM_53
   1CA7                     119 L1CA7:
   1CA7 20 83 1E      [ 6]  120         jsr     L1E83
   1CAA A5 54         [ 3]  121         lda     RAM_54
   1CAC D0 F9         [ 4]  122         bne     L1CA7
   1CAE A9 00         [ 2]  123         lda     #0x00
   1CB0 85 59         [ 3]  124         sta     RAM_59
   1CB2 20 8D 1D      [ 6]  125         jsr     L1D8D
   1CB5 A9 40         [ 2]  126         lda     #0x40
   1CB7 20 72 1D      [ 6]  127         jsr     L1D72
   1CBA 20 8D 1D      [ 6]  128         jsr     L1D8D
   1CBD A9 FA         [ 2]  129         lda     #0xFA
   1CBF 85 50         [ 3]  130         sta     RAM_50
   1CC1                     131 L1CC1:
   1CC1 20 83 1E      [ 6]  132         jsr     L1E83
   1CC4 A5 50         [ 3]  133         lda     RAM_50
   1CC6 D0 F9         [ 4]  134         bne     L1CC1
   1CC8 A9 20         [ 2]  135         lda     #0x20
   1CCA 20 72 1D      [ 6]  136         jsr     L1D72
   1CCD 20 8D 1D      [ 6]  137         jsr     L1D8D
   1CD0 E6 59         [ 5]  138         inc     RAM_59
   1CD2 A9 10         [ 2]  139         lda     #0x10
   1CD4 20 72 1D      [ 6]  140         jsr     L1D72
   1CD7 A9 80         [ 2]  141         lda     #0x80
   1CD9 20 72 1D      [ 6]  142         jsr     L1D72
   1CDC 20 B0 1D      [ 6]  143         jsr     L1DB0
   1CDF A9 10         [ 2]  144         lda     #0x10
   1CE1 20 72 1D      [ 6]  145         jsr     L1D72
   1CE4 20 3F 1D      [ 6]  146         jsr     L1D3F
   1CE7                     147 L1CE7:
   1CE7 4C 68 1F      [ 3]  148         jmp     L1F68
                            149 ;
   1CEA                     150 L1CEA:
   1CEA 20 24 1F      [ 6]  151         jsr     L1F24
   1CED A5 5A         [ 3]  152         lda     RAM_5A
   1CEF D0 10         [ 4]  153         bne     L1D01
   1CF1 A9 02         [ 2]  154         lda     #0x02
   1CF3 8D 80 02      [ 4]  155         sta     U19_PORTA
   1CF6 A9 00         [ 2]  156         lda     #0x00
   1CF8 8D 02 02      [ 4]  157         sta     U18_PORTB
   1CFB 4C E7 1C      [ 3]  158         jmp     L1CE7
                            159 ;
   1CFE EA            [ 2]  160         nop
   1CFF EA            [ 2]  161         nop
   1D00 EA            [ 2]  162         nop
   1D01                     163 L1D01:
   1D01 20 3F 1D      [ 6]  164         jsr     L1D3F
   1D04 A9 00         [ 2]  165         lda     #0x00
   1D06 8D 80 02      [ 4]  166         sta     U19_PORTA
   1D09 A9 80         [ 2]  167         lda     #0x80
   1D0B 8D 02 02      [ 4]  168         sta     U18_PORTB
   1D0E A9 80         [ 2]  169         lda     #0x80
   1D10 20 72 1D      [ 6]  170         jsr     L1D72
   1D13 20 B0 1D      [ 6]  171         jsr     L1DB0
   1D16 C6 5A         [ 5]  172         dec     RAM_5A
   1D18 20 D6 1D      [ 6]  173         jsr     L1DD6
   1D1B 20 3F 1D      [ 6]  174         jsr     L1D3F
   1D1E A9 1E         [ 2]  175         lda     #0x1E
   1D20 85 56         [ 3]  176         sta     RAM_56
   1D22 A9 64         [ 2]  177         lda     #0x64
   1D24 85 55         [ 3]  178         sta     RAM_55
   1D26 E6 59         [ 5]  179         inc     RAM_59
   1D28 A5 59         [ 3]  180         lda     RAM_59
   1D2A C9 1A         [ 2]  181         cmp     #0x1A
   1D2C 90 03         [ 4]  182         bcc     L1D31
   1D2E 4C 73 1C      [ 3]  183         jmp     L1C73
                            184 ;
   1D31                     185 L1D31:
   1D31 20 B0 1D      [ 6]  186         jsr     L1DB0
   1D34 A9 10         [ 2]  187         lda     #0x10
   1D36 20 72 1D      [ 6]  188         jsr     L1D72
   1D39 20 DB 1E      [ 6]  189         jsr     L1EDB
   1D3C 4C E7 1C      [ 3]  190         jmp     L1CE7
                            191 ;
   1D3F                     192 L1D3F:
   1D3F A9 3C         [ 2]  193         lda     #0x3C
   1D41 8D 83 03      [ 4]  194         sta     audio_control_reg_b
   1D44 A9 34         [ 2]  195         lda     #0x34
   1D46 8D 81 03      [ 4]  196         sta     audio_control_reg_a
   1D49 A2 00         [ 2]  197         ldx     #0x00
   1D4B                     198 L1D4B:
   1D4B A9 30         [ 2]  199         lda     #0x30
   1D4D 95 81         [ 4]  200         sta     board_1_control_reg_a,x
   1D4F 95 83         [ 4]  201         sta     board_1_control_reg_b,x
   1D51 A9 FF         [ 2]  202         lda     #0xFF
   1D53 95 80         [ 4]  203         sta     board_1_periph$ddr_reg_a,x
   1D55 95 82         [ 4]  204         sta     board_1_periph$ddr_reg_b,x
   1D57 A9 34         [ 2]  205         lda     #0x34
   1D59 95 81         [ 4]  206         sta     board_1_control_reg_a,x
   1D5B 95 83         [ 4]  207         sta     board_1_control_reg_b,x
   1D5D A9 00         [ 2]  208         lda     #0x00
   1D5F 95 80         [ 4]  209         sta     board_1_periph$ddr_reg_a,x
   1D61 95 82         [ 4]  210         sta     board_1_periph$ddr_reg_b,x
   1D63 E8            [ 2]  211         inx
   1D64 E8            [ 2]  212         inx
   1D65 E8            [ 2]  213         inx
   1D66 E8            [ 2]  214         inx
   1D67 E0 20         [ 2]  215         cpx     #0x20
   1D69 90 E0         [ 4]  216         bcc     L1D4B
   1D6B A9 00         [ 2]  217         lda     #0x00
   1D6D 85 5E         [ 3]  218         sta     RAM_5E
   1D6F 85 64         [ 3]  219         sta     RAM_64
   1D71 60            [ 6]  220         rts
                            221 ;
   1D72                     222 L1D72:
   1D72 8D 02 03      [ 4]  223         sta     transport_periph$ddr_reg_b
   1D75 A9 FA         [ 2]  224         lda     #0xFA
   1D77 85 50         [ 3]  225         sta     RAM_50
   1D79                     226 L1D79:
   1D79 20 83 1E      [ 6]  227         jsr     L1E83
   1D7C A5 50         [ 3]  228         lda     RAM_50
   1D7E D0 F9         [ 4]  229         bne     L1D79
   1D80 AD 02 03      [ 4]  230         lda     transport_periph$ddr_reg_b
   1D83 29 60         [ 2]  231         and     #0x60
   1D85 D0 05         [ 4]  232         bne     L1D8C
   1D87 A9 00         [ 2]  233         lda     #0x00
   1D89 8D 02 03      [ 4]  234         sta     transport_periph$ddr_reg_b
   1D8C                     235 L1D8C:
   1D8C 60            [ 6]  236         rts
                            237 ;
   1D8D                     238 L1D8D:
   1D8D A9 00         [ 2]  239         lda     #0x00
   1D8F 85 58         [ 3]  240         sta     RAM_58
   1D91                     241 L1D91:
   1D91 AD 02 03      [ 4]  242         lda     transport_periph$ddr_reg_b
   1D94 A9 0A         [ 2]  243         lda     #0x0A
   1D96 85 50         [ 3]  244         sta     RAM_50
   1D98 E6 58         [ 5]  245         inc     RAM_58
   1D9A A5 58         [ 3]  246         lda     RAM_58
   1D9C C9 21         [ 2]  247         cmp     #0x21
   1D9E B0 0F         [ 4]  248         bcs     L1DAF
   1DA0                     249 L1DA0:
   1DA0 20 83 1E      [ 6]  250         jsr     L1E83
   1DA3 A5 50         [ 3]  251         lda     RAM_50
   1DA5 F0 E6         [ 4]  252         beq     L1D8D
   1DA7 AD 03 03      [ 4]  253         lda     transport_control_reg_b
   1DAA 10 F4         [ 4]  254         bpl     L1DA0
   1DAC 4C 91 1D      [ 3]  255         jmp     L1D91
   1DAF                     256 L1DAF:
   1DAF 60            [ 6]  257         rts
                            258 ;
   1DB0                     259 L1DB0:
   1DB0 A9 FA         [ 2]  260         lda     #0xFA
   1DB2 85 50         [ 3]  261         sta     RAM_50
   1DB4                     262 L1DB4:
   1DB4 20 83 1E      [ 6]  263         jsr     L1E83
   1DB7 A5 50         [ 3]  264         lda     RAM_50
   1DB9 D0 F9         [ 4]  265         bne     L1DB4
   1DBB                     266 L1DBB:
   1DBB 20 83 1E      [ 6]  267         jsr     L1E83
   1DBE AD 02 03      [ 4]  268         lda     transport_periph$ddr_reg_b
   1DC1 6A            [ 2]  269         ror     a
   1DC2 90 F7         [ 4]  270         bcc     L1DBB
   1DC4 A9 A0         [ 2]  271         lda     #0xA0
   1DC6 85 50         [ 3]  272         sta     RAM_50
   1DC8                     273 L1DC8:
   1DC8 20 83 1E      [ 6]  274         jsr     L1E83
   1DCB AD 02 03      [ 4]  275         lda     transport_periph$ddr_reg_b
   1DCE 6A            [ 2]  276         ror     a
   1DCF 90 EA         [ 4]  277         bcc     L1DBB
   1DD1 A5 50         [ 3]  278         lda     RAM_50
   1DD3 D0 F3         [ 4]  279         bne     L1DC8
   1DD5 60            [ 6]  280         rts
                            281 ;
   1DD6                     282 L1DD6:
   1DD6 AD 00 03      [ 4]  283         lda     transport_periph$ddr_reg_a
   1DD9 A9 40         [ 2]  284         lda     #0x40
   1DDB 85 82         [ 3]  285         sta     board_1_periph$ddr_reg_b
   1DDD 85 86         [ 3]  286         sta     board_2_periph$ddr_reg_b
   1DDF 85 8A         [ 3]  287         sta     board_3_periph$ddr_reg_b
   1DE1 85 8E         [ 3]  288         sta     board_4_periph$ddr_reg_b
   1DE3 A9 3C         [ 2]  289         lda     #0x3C
   1DE5 8D 81 03      [ 4]  290         sta     audio_control_reg_a
   1DE8 A9 34         [ 2]  291         lda     #0x34
   1DEA 8D 83 03      [ 4]  292         sta     audio_control_reg_b
   1DED A9 60         [ 2]  293         lda     #0x60
   1DEF 85 82         [ 3]  294         sta     board_1_periph$ddr_reg_b
   1DF1                     295 L1DF1:
   1DF1 AD 02 03      [ 4]  296         lda     transport_periph$ddr_reg_b
   1DF4 4A            [ 2]  297         lsr     a
   1DF5 90 11         [ 4]  298         bcc     L1E08
   1DF7 20 24 1F      [ 6]  299         jsr     L1F24
   1DFA 20 83 1E      [ 6]  300         jsr     L1E83
   1DFD AD 01 03      [ 4]  301         lda     transport_control_reg_a
   1E00 10 EF         [ 4]  302         bpl     L1DF1
   1E02 20 1A 1E      [ 6]  303         jsr     L1E1A
   1E05 4C F1 1D      [ 3]  304         jmp     L1DF1
                            305 ;
   1E08                     306 L1E08:
   1E08 A9 64         [ 2]  307         lda     #0x64
   1E0A 85 50         [ 3]  308         sta     RAM_50
   1E0C                     309 L1E0C:
   1E0C 20 83 1E      [ 6]  310         jsr     L1E83
   1E0F AD 02 03      [ 4]  311         lda     transport_periph$ddr_reg_b
   1E12 4A            [ 2]  312         lsr     a
   1E13 B0 C1         [ 4]  313         bcs     L1DD6
   1E15 A5 50         [ 3]  314         lda     RAM_50
   1E17 D0 F3         [ 4]  315         bne     L1E0C
   1E19 60            [ 6]  316         rts
                            317 ;
   1E1A                     318 L1E1A:
   1E1A AD 00 03      [ 4]  319         lda     transport_periph$ddr_reg_a
   1E1D 29 7F         [ 2]  320         and     #0x7F
   1E1F 85 5C         [ 3]  321         sta     RAM_5C
   1E21 29 7E         [ 2]  322         and     #0x7E
   1E23 C9 22         [ 2]  323         cmp     #0x22
   1E25 F0 3A         [ 4]  324         beq     L1E61
   1E27 C9 32         [ 2]  325         cmp     #0x32
   1E29 90 4F         [ 4]  326         bcc     L1E7A
   1E2B C9 3A         [ 2]  327         cmp     #0x3A
   1E2D 90 32         [ 4]  328         bcc     L1E61
   1E2F A5 5C         [ 3]  329         lda     RAM_5C
   1E31 C9 41         [ 2]  330         cmp     #0x41
   1E33 90 45         [ 4]  331         bcc     L1E7A
   1E35 C9 4F         [ 2]  332         cmp     #0x4F
   1E37 B0 41         [ 4]  333         bcs     L1E7A
   1E39 A6 64         [ 3]  334         ldx     RAM_64
   1E3B 38            [ 2]  335         sec
   1E3C E9 41         [ 2]  336         sbc     #0x41
   1E3E C9 08         [ 2]  337         cmp     #0x08
   1E40 90 02         [ 4]  338         bcc     L1E44
   1E42 E8            [ 2]  339         inx
   1E43 E8            [ 2]  340         inx
   1E44                     341 L1E44:
   1E44 29 07         [ 2]  342         and     #0x07
   1E46 A8            [ 2]  343         tay
   1E47 B9 7B 1E      [ 5]  344         lda     X1E7B,y
   1E4A 85 5D         [ 3]  345         sta     RAM_5D
   1E4C A5 5E         [ 3]  346         lda     RAM_5E
   1E4E 4A            [ 2]  347         lsr     a
   1E4F B0 09         [ 4]  348         bcs     L1E5A
   1E51 A5 5D         [ 3]  349         lda     RAM_5D
   1E53 49 FF         [ 2]  350         eor     #0xFF
   1E55 35 00         [ 4]  351         and     RAM_start,x
   1E57 95 00         [ 4]  352         sta     RAM_start,x
   1E59 60            [ 6]  353         rts
                            354 ;
   1E5A                     355 L1E5A:
   1E5A A5 5D         [ 3]  356         lda     RAM_5D
   1E5C 15 00         [ 4]  357         ora     RAM_start,x
   1E5E 95 00         [ 4]  358         sta     RAM_start,x
   1E60 60            [ 6]  359         rts
                            360 ;
   1E61                     361 L1E61:
   1E61 A5 5C         [ 3]  362         lda     RAM_5C
   1E63 85 5E         [ 3]  363         sta     RAM_5E
   1E65 29 7E         [ 2]  364         and     #0x7E
   1E67 C9 22         [ 2]  365         cmp     #0x22
   1E69 D0 05         [ 4]  366         bne     L1E70
   1E6B A9 98         [ 2]  367         lda     #0x98
   1E6D 85 64         [ 3]  368         sta     RAM_64
   1E6F 60            [ 6]  369         rts
                            370 ;
   1E70                     371 L1E70:
   1E70 38            [ 2]  372         sec
   1E71 E9 32         [ 2]  373         sbc     #0x32
   1E73 0A            [ 2]  374         asl     a
   1E74 18            [ 2]  375         clc
   1E75 69 80         [ 2]  376         adc     #0x80
   1E77 85 64         [ 3]  377         sta     RAM_64
   1E79 60            [ 6]  378         rts
   1E7A                     379 L1E7A:
   1E7A 60            [ 6]  380         rts
                            381 ;
   1E7B                     382 X1E7B:
   1E7B 01 02 04 08         383         .db     0x01,0x02,0x04,0x08
   1E7F 10 20 40 80         384         .db     0x10,0x20,0x40,0x80
                            385 ;
   1E83                     386 L1E83:
   1E83 AD 05 02      [ 4]  387         lda     U18_edge_detect_control_DI_pos
   1E86 85 5F         [ 3]  388         sta     RAM_5F
   1E88 F0 50         [ 4]  389         beq     L1EDA
   1E8A A5 5B         [ 3]  390         lda     RAM_5B
   1E8C 30 0E         [ 4]  391         bmi     L1E9C
   1E8E A5 5F         [ 3]  392         lda     RAM_5F
   1E90 29 40         [ 2]  393         and     #0x40
   1E92 F0 16         [ 4]  394         beq     L1EAA
   1E94 A9 80         [ 2]  395         lda     #0x80
   1E96 85 5B         [ 3]  396         sta     RAM_5B
   1E98 A9 FA         [ 2]  397         lda     #0xFA
   1E9A 85 51         [ 3]  398         sta     RAM_51
   1E9C                     399 L1E9C:
   1E9C A5 51         [ 3]  400         lda     RAM_51
   1E9E D0 06         [ 4]  401         bne     L1EA6
   1EA0 A9 00         [ 2]  402         lda     #0x00
   1EA2 85 5B         [ 3]  403         sta     RAM_5B
   1EA4 E6 5A         [ 5]  404         inc     RAM_5A
   1EA6                     405 L1EA6:
   1EA6 A5 5F         [ 3]  406         lda     RAM_5F
   1EA8 10 30         [ 4]  407         bpl     L1EDA
   1EAA                     408 L1EAA:
   1EAA AD 04 02      [ 4]  409         lda     U18_timer
   1EAD 49 FF         [ 2]  410         eor     #0xFF
   1EAF 4A            [ 2]  411         lsr     a
   1EB0 4A            [ 2]  412         lsr     a
   1EB1 4A            [ 2]  413         lsr     a
   1EB2 85 57         [ 3]  414         sta     RAM_57
   1EB4 90 02         [ 4]  415         bcc     L1EB8
   1EB6 E6 57         [ 5]  416         inc     RAM_57
   1EB8                     417 L1EB8:
   1EB8 A9 7A         [ 2]  418         lda     #0x7A
   1EBA 38            [ 2]  419         sec
   1EBB E5 57         [ 3]  420         sbc     RAM_57
   1EBD 8D 15 02      [ 4]  421         sta     U18_timer_8T_DI
   1EC0 C6 50         [ 5]  422         dec     RAM_50
   1EC2 C6 51         [ 5]  423         dec     RAM_51
   1EC4 C6 52         [ 5]  424         dec     RAM_52
   1EC6 C6 53         [ 5]  425         dec     RAM_53
   1EC8 D0 10         [ 4]  426         bne     L1EDA
   1ECA A9 64         [ 2]  427         lda     #0x64
   1ECC 85 53         [ 3]  428         sta     RAM_53
   1ECE C6 54         [ 5]  429         dec     RAM_54
   1ED0 C6 55         [ 5]  430         dec     RAM_55
   1ED2 D0 06         [ 4]  431         bne     L1EDA
   1ED4 A9 64         [ 2]  432         lda     #0x64
   1ED6 85 55         [ 3]  433         sta     RAM_55
   1ED8 C6 56         [ 5]  434         dec     RAM_56
   1EDA                     435 L1EDA:
   1EDA 60            [ 6]  436         rts
                            437 ;
   1EDB                     438 L1EDB:
   1EDB A9 00         [ 2]  439         lda     #0x00
   1EDD 85 61         [ 3]  440         sta     RAM_61
   1EDF 85 62         [ 3]  441         sta     RAM_62
   1EE1 A9 0A         [ 2]  442         lda     #0x0A
   1EE3 85 54         [ 3]  443         sta     RAM_54
   1EE5 A9 64         [ 2]  444         lda     #0x64
   1EE7 85 53         [ 3]  445         sta     RAM_53
   1EE9                     446 L1EE9:
   1EE9 20 83 1E      [ 6]  447         jsr     L1E83
   1EEC A5 54         [ 3]  448         lda     RAM_54
   1EEE D0 F9         [ 4]  449         bne     L1EE9
   1EF0 A9 0A         [ 2]  450         lda     #0x0A
   1EF2 85 54         [ 3]  451         sta     RAM_54
   1EF4 A9 64         [ 2]  452         lda     #0x64
   1EF6 85 53         [ 3]  453         sta     RAM_53
   1EF8 A5 62         [ 3]  454         lda     RAM_62
   1EFA C9 08         [ 2]  455         cmp     #0x08
   1EFC F0 15         [ 4]  456         beq     L1F13
   1EFE E6 62         [ 5]  457         inc     RAM_62
   1F00 A2 09         [ 2]  458         ldx     #0x09
   1F02 38            [ 2]  459         sec
   1F03 AD 80 03      [ 4]  460         lda     audio_periph$ddr_reg_a
   1F06                     461 L1F06:
   1F06 2A            [ 2]  462         rol     a
   1F07 CA            [ 2]  463         dex
   1F08 90 FC         [ 4]  464         bcc     L1F06
   1F0A 18            [ 2]  465         clc
   1F0B 8A            [ 2]  466         txa
   1F0C 65 61         [ 3]  467         adc     RAM_61
   1F0E 85 61         [ 3]  468         sta     RAM_61
   1F10 4C E9 1E      [ 3]  469         jmp     L1EE9
                            470 ;
   1F13                     471 L1F13:
   1F13 46 61         [ 5]  472         lsr     RAM_61
   1F15 46 61         [ 5]  473         lsr     RAM_61
   1F17 46 61         [ 5]  474         lsr     RAM_61
   1F19 A5 61         [ 3]  475         lda     RAM_61
   1F1B 85 60         [ 3]  476         sta     RAM_60
   1F1D A9 00         [ 2]  477         lda     #0x00
   1F1F 85 61         [ 3]  478         sta     RAM_61
   1F21 85 62         [ 3]  479         sta     RAM_62
   1F23 60            [ 6]  480         rts
                            481 ;
   1F24                     482 L1F24:
   1F24 AD 80 02      [ 4]  483         lda     U19_PORTA
   1F27 49 FF         [ 2]  484         eor     #0xFF
   1F29 4A            [ 2]  485         lsr     a
   1F2A 4A            [ 2]  486         lsr     a
   1F2B 4A            [ 2]  487         lsr     a
   1F2C 4A            [ 2]  488         lsr     a
   1F2D 18            [ 2]  489         clc
   1F2E 65 60         [ 3]  490         adc     RAM_60
   1F30 AA            [ 2]  491         tax
   1F31 BD 57 1F      [ 5]  492         lda     X1F57,x
   1F34 85 63         [ 3]  493         sta     RAM_63
   1F36 A5 52         [ 3]  494         lda     RAM_52
   1F38 D0 16         [ 4]  495         bne     L1F50
   1F3A A9 0A         [ 2]  496         lda     #0x0A
   1F3C 85 52         [ 3]  497         sta     RAM_52
   1F3E A5 63         [ 3]  498         lda     RAM_63
   1F40 CD 82 03      [ 4]  499         cmp     audio_periph$ddr_reg_b
   1F43 90 08         [ 4]  500         bcc     L1F4D
   1F45 F0 09         [ 4]  501         beq     L1F50
   1F47 EE 82 03      [ 6]  502         inc     audio_periph$ddr_reg_b
   1F4A 4C 50 1F      [ 3]  503         jmp     L1F50
                            504 ;
   1F4D                     505 L1F4D:
   1F4D CE 82 03      [ 6]  506         dec     audio_periph$ddr_reg_b
   1F50                     507 L1F50:
   1F50 AD 82 03      [ 4]  508         lda     audio_periph$ddr_reg_b
   1F53 8D 82 02      [ 4]  509         sta     U19_PORTB
   1F56 60            [ 6]  510         rts
                            511 ;
   1F57                     512 X1F57:
   1F57 03 04 06 08         513         .db     0x03, 0x04, 0x06, 0x08
   1F5B 10 16 20 2D         514         .db     0x10, 0x16, 0x20, 0x2D
   1F5F 40 5A 80 BF         515         .db     0x40, 0x5A, 0x80, 0xBF
   1F63 FF FF FF FF         516         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1F67 FF                  517         .db     0xFF
                            518 ;
   1F68                     519 L1F68:
   1F68 A9 00         [ 2]  520         lda     #0x00
   1F6A 85 5A         [ 3]  521         sta     RAM_5A
   1F6C 20 83 1E      [ 6]  522         jsr     L1E83
   1F6F 4C EA 1C      [ 3]  523         jmp     L1CEA
                            524 ;
                            525 ; all zeros in this gap
                            526 ;
   1FFC                     527         .org    0x1FFC
                            528 ;
                            529 ; vectors
                            530 ;
   1FFC                     531 RESETVEC:
   1FFC 00 1C               532         .dw     RESET
   1FFE                     533 IRQVEC:
   1FFE 00 00               534         .dw     RAM_start
                            535 
