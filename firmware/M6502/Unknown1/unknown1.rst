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
                     0000    11 RAM_start = 0x0000
                     0050    12 X0050 = 0x0050
                     0051    13 X0051 = 0x0051
                     0052    14 X0052 = 0x0052
                     0053    15 X0053 = 0x0053
                     0054    16 X0054 = 0x0054
                     0055    17 X0055 = 0x0055
                     0056    18 X0056 = 0x0056
                     0057    19 X0057 = 0x0057
                     0058    20 X0058 = 0x0058
                     0059    21 X0059 = 0x0059
                     005A    22 X005A = 0x005A
                     005B    23 X005B = 0x005B
                     005C    24 X005C = 0x005C
                     005D    25 X005D = 0x005D
                     005E    26 X005E = 0x005E
                     005F    27 X005F = 0x005F
                     0060    28 X0060 = 0x0060
                     0061    29 X0061 = 0x0061
                     0062    30 X0062 = 0x0062
                     0063    31 X0063 = 0x0063
                     0064    32 X0064 = 0x0064
                             33 
                             34         .include "../include/ptt6502.def"
                              1 
                              2 ;
                              3 ; Peripheral Addresses for PTT 6502 system
                              4 ;
                              5 
                     0080     6 board_1_periph$ddr_reg_a    = 0x0080
                     0081     7 board_1_control_reg_a       = 0x0081
                     0082     8 board_1_periph$ddr_reg_b    = 0x0082
                     0083     9 board_1_control_reg_b       = 0x0083
                             10 
                     0084    11 board_2_periph$ddr_reg_a    = 0x0084
                     0085    12 board_2_control_reg_a       = 0x0085
                     0086    13 board_2_periph$ddr_reg_b    = 0x0086
                     0087    14 board_2_control_reg_b       = 0x0087
                             15 
                     0088    16 board_3_periph$ddr_reg_a    = 0x0088
                     0089    17 board_3_control_reg_a       = 0x0089
                     008A    18 board_3_periph$ddr_reg_b    = 0x008A
                     008B    19 board_3_control_reg_b       = 0x008B
                             20 
                     008C    21 board_4_periph$ddr_reg_a    = 0x008C
                     008D    22 board_4_control_reg_a       = 0x008D
                     008E    23 board_4_periph$ddr_reg_b    = 0x008E
                     008F    24 board_4_control_reg_b       = 0x008F
                             25 
                     0200    26 U18_PORTA                   = 0x0200
                     0201    27 U18_DDRA                    = 0x0201
                     0202    28 U18_PORTB                   = 0x0202
                     0203    29 U18_DDRB                    = 0x0203
                             30 
                     0204    31 U18_timer                   = 0x0204
                     0204    32 U18_edge_detect_control_DI_neg = 0x0204
                     0205    33 U18_edge_detect_control_DI_pos = 0x0205
                     0215    34 U18_timer_8T_DI             = 0x0215
                     0217    35 X0217 = 0x0217
                             36 
                     0280    37 U19_PORTA                   = 0x0280
                     0281    38 U19_DDRA                    = 0x0281
                     0282    39 U19_PORTB                   = 0x0282
                     0283    40 U19_DDRB                    = 0x0283
                             41 
                     0300    42 transport_periph$ddr_reg_a  = 0x0300
                     0301    43 transport_control_reg_a     = 0x0301
                     0302    44 transport_periph$ddr_reg_b  = 0x0302
                     0303    45 transport_control_reg_b     = 0x0303
                             46 
                     0380    47 audio_periph$ddr_reg_a      = 0x0380
                     0381    48 audio_control_reg_a         = 0x0381
                     0382    49 audio_periph$ddr_reg_b      = 0x0382
                     0383    50 audio_control_reg_b         = 0x0383
                             51 
                             52 
                             53 
                             54 
                             55 
                             56 
                             35 
                             36 ;board_1_periph$ddr_reg_a = 0board_1_periph$ddr_reg_a
                             37 ;board_1_control_reg_a = 0x0081
                             38 ;board_1_periph$ddr_reg_b = 0x0082
                             39 ;board_1_control_reg_b = 0x0083
                             40 ;board_2_periph$ddr_reg_b = 0x0086
                             41 ;board_3_periph$ddr_reg_b = 0x008A
                             42 ;board_4_periph$ddr_reg_b = 0x008E
                             43 
                             44 ;U18_DDRA = 0x0201
                             45 ;U18_PORTB = 0x0202
                             46 ;U18_DDRB = 0x0203
                             47 ;U18_timer = 0x0204
                             48 ;U18_edge_detect_control_DI_pos = 0x0205
                             49 ;U18_timer_8T_DI = 0x0215
                             50 
                             51 ;U19_PORTA = 0x0280
                             52 ;U19_DDRA = 0x0281
                             53 ;U19_PORTB = 0x0282
                             54 ;U19_DDRB = 0x0283
                             55 
                             56 ;transport_periph$ddr_reg_a = 0x0300
                             57 ;transport_control_reg_a = 0x0301
                             58 ;transport_periph$ddr_reg_b = 0x0302
                             59 ;transport_control_reg_b = 0x0303
                             60 
                             61 ;audio_periph$ddr_reg_a = 0x0380
                             62 ;audio_control_reg_a = 0x0381
                             63 ;audio_periph$ddr_reg_b = 0x0382
                             64 ;audio_control_reg_b = 0x0383
                             65 
   1C00                      66         .org    0x1C00
                             67 ;
   1C00                      68 RESET:
   1C00 D8            [ 2]   69         cld
   1C01 78            [ 2]   70         sei
   1C02 A2 F0         [ 2]   71         ldx     #0xF0
   1C04 9A            [ 2]   72         txs
   1C05 A9 00         [ 2]   73         lda     #0x00
   1C07 A2 10         [ 2]   74         ldx     #0x10
   1C09                      75 L1C09:
   1C09 95 00         [ 4]   76         sta     RAM_start,x
   1C0B E8            [ 2]   77         inx
   1C0C E0 80         [ 2]   78         cpx     #0x80
   1C0E D0 F9         [ 4]   79         bne     L1C09
   1C10 A9 00         [ 2]   80         lda     #0x00
   1C12 8D 01 03      [ 4]   81         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   82         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   83         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   84         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   85         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   86         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   87         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   88         sta     U18_DDRA
   1C2A A9 02         [ 2]   89         lda     #0x02
   1C2C 8D 81 02      [ 4]   90         sta     U19_DDRA
   1C2F A9 FF         [ 2]   91         lda     #0xFF
   1C31 8D 82 03      [ 4]   92         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   93         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   94         sta     U19_DDRB
   1C3A A9 FC         [ 2]   95         lda     #0xFC
   1C3C 8D 02 03      [ 4]   96         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   97         lda     #0x2E
   1C41 8D 01 03      [ 4]   98         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]   99         sta     transport_control_reg_b
   1C47 A9 3C         [ 2]  100         lda     #0x3C
   1C49 8D 81 03      [ 4]  101         sta     audio_control_reg_a
   1C4C 8D 83 03      [ 4]  102         sta     audio_control_reg_b
   1C4F A9 64         [ 2]  103         lda     #0x64
   1C51 85 53         [ 3]  104         sta     X0053
   1C53 A9 1E         [ 2]  105         lda     #0x1E
   1C55 85 56         [ 3]  106         sta     X0056
   1C57 A9 64         [ 2]  107         lda     #0x64
   1C59 85 55         [ 3]  108         sta     X0055
   1C5B A9 10         [ 2]  109         lda     #0x10
   1C5D 85 63         [ 3]  110         sta     X0063
   1C5F A9 10         [ 2]  111         lda     #0x10
   1C61 20 72 1D      [ 6]  112         jsr     L1D72
   1C64 A9 28         [ 2]  113         lda     #0x28
   1C66 85 54         [ 3]  114         sta     X0054
   1C68 A9 64         [ 2]  115         lda     #0x64
   1C6A 85 53         [ 3]  116         sta     X0053
   1C6C                     117 L1C6C:
   1C6C 20 83 1E      [ 6]  118         jsr     L1E83
   1C6F A5 54         [ 3]  119         lda     X0054
   1C71 D0 F9         [ 4]  120         bne     L1C6C
   1C73                     121 L1C73:
   1C73 A9 40         [ 2]  122         lda     #0x40
   1C75 20 72 1D      [ 6]  123         jsr     L1D72
   1C78                     124 L1C78:
   1C78 A9 00         [ 2]  125         lda     #0x00
   1C7A 85 58         [ 3]  126         sta     X0058
   1C7C                     127 L1C7C:
   1C7C AD 02 03      [ 4]  128         lda     transport_periph$ddr_reg_b
   1C7F A9 0A         [ 2]  129         lda     #0x0A
   1C81 85 50         [ 3]  130         sta     X0050
   1C83 E6 58         [ 5]  131         inc     X0058
   1C85 A5 58         [ 3]  132         lda     X0058
   1C87 C9 64         [ 2]  133         cmp     #0x64
   1C89 B0 0F         [ 4]  134         bcs     L1C9A
   1C8B                     135 L1C8B:
   1C8B 20 83 1E      [ 6]  136         jsr     L1E83
   1C8E A5 50         [ 3]  137         lda     X0050
   1C90 F0 E6         [ 4]  138         beq     L1C78
   1C92 AD 03 03      [ 4]  139         lda     transport_control_reg_b
   1C95 10 F4         [ 4]  140         bpl     L1C8B
   1C97 4C 7C 1C      [ 3]  141         jmp     L1C7C
                            142 ;
   1C9A                     143 L1C9A:
   1C9A A9 20         [ 2]  144         lda     #0x20
   1C9C 20 72 1D      [ 6]  145         jsr     L1D72
   1C9F A9 19         [ 2]  146         lda     #0x19
   1CA1 85 54         [ 3]  147         sta     X0054
   1CA3 A9 64         [ 2]  148         lda     #0x64
   1CA5 85 53         [ 3]  149         sta     X0053
   1CA7                     150 L1CA7:
   1CA7 20 83 1E      [ 6]  151         jsr     L1E83
   1CAA A5 54         [ 3]  152         lda     X0054
   1CAC D0 F9         [ 4]  153         bne     L1CA7
   1CAE A9 00         [ 2]  154         lda     #0x00
   1CB0 85 59         [ 3]  155         sta     X0059
   1CB2 20 8D 1D      [ 6]  156         jsr     L1D8D
   1CB5 A9 40         [ 2]  157         lda     #0x40
   1CB7 20 72 1D      [ 6]  158         jsr     L1D72
   1CBA 20 8D 1D      [ 6]  159         jsr     L1D8D
   1CBD A9 FA         [ 2]  160         lda     #0xFA
   1CBF 85 50         [ 3]  161         sta     X0050
   1CC1                     162 L1CC1:
   1CC1 20 83 1E      [ 6]  163         jsr     L1E83
   1CC4 A5 50         [ 3]  164         lda     X0050
   1CC6 D0 F9         [ 4]  165         bne     L1CC1
   1CC8 A9 20         [ 2]  166         lda     #0x20
   1CCA 20 72 1D      [ 6]  167         jsr     L1D72
   1CCD 20 8D 1D      [ 6]  168         jsr     L1D8D
   1CD0 E6 59         [ 5]  169         inc     X0059
   1CD2 A9 10         [ 2]  170         lda     #0x10
   1CD4 20 72 1D      [ 6]  171         jsr     L1D72
   1CD7 A9 80         [ 2]  172         lda     #0x80
   1CD9 20 72 1D      [ 6]  173         jsr     L1D72
   1CDC 20 B0 1D      [ 6]  174         jsr     L1DB0
   1CDF A9 10         [ 2]  175         lda     #0x10
   1CE1 20 72 1D      [ 6]  176         jsr     L1D72
   1CE4 20 3F 1D      [ 6]  177         jsr     L1D3F
   1CE7                     178 L1CE7:
   1CE7 4C 68 1F      [ 3]  179         jmp     L1F68
                            180 ;
   1CEA                     181 L1CEA:
   1CEA 20 24 1F      [ 6]  182         jsr     L1F24
   1CED A5 5A         [ 3]  183         lda     X005A
   1CEF D0 10         [ 4]  184         bne     L1D01
   1CF1 A9 02         [ 2]  185         lda     #0x02
   1CF3 8D 80 02      [ 4]  186         sta     U19_PORTA
   1CF6 A9 00         [ 2]  187         lda     #0x00
   1CF8 8D 02 02      [ 4]  188         sta     U18_PORTB
   1CFB 4C E7 1C      [ 3]  189         jmp     L1CE7
                            190 ;
   1CFE EA            [ 2]  191         nop
   1CFF EA            [ 2]  192         nop
   1D00 EA            [ 2]  193         nop
   1D01                     194 L1D01:
   1D01 20 3F 1D      [ 6]  195         jsr     L1D3F
   1D04 A9 00         [ 2]  196         lda     #0x00
   1D06 8D 80 02      [ 4]  197         sta     U19_PORTA
   1D09 A9 80         [ 2]  198         lda     #0x80
   1D0B 8D 02 02      [ 4]  199         sta     U18_PORTB
   1D0E A9 80         [ 2]  200         lda     #0x80
   1D10 20 72 1D      [ 6]  201         jsr     L1D72
   1D13 20 B0 1D      [ 6]  202         jsr     L1DB0
   1D16 C6 5A         [ 5]  203         dec     X005A
   1D18 20 D6 1D      [ 6]  204         jsr     L1DD6
   1D1B 20 3F 1D      [ 6]  205         jsr     L1D3F
   1D1E A9 1E         [ 2]  206         lda     #0x1E
   1D20 85 56         [ 3]  207         sta     X0056
   1D22 A9 64         [ 2]  208         lda     #0x64
   1D24 85 55         [ 3]  209         sta     X0055
   1D26 E6 59         [ 5]  210         inc     X0059
   1D28 A5 59         [ 3]  211         lda     X0059
   1D2A C9 1A         [ 2]  212         cmp     #0x1A
   1D2C 90 03         [ 4]  213         bcc     L1D31
   1D2E 4C 73 1C      [ 3]  214         jmp     L1C73
                            215 ;
   1D31                     216 L1D31:
   1D31 20 B0 1D      [ 6]  217         jsr     L1DB0
   1D34 A9 10         [ 2]  218         lda     #0x10
   1D36 20 72 1D      [ 6]  219         jsr     L1D72
   1D39 20 DB 1E      [ 6]  220         jsr     L1EDB
   1D3C 4C E7 1C      [ 3]  221         jmp     L1CE7
                            222 ;
   1D3F                     223 L1D3F:
   1D3F A9 3C         [ 2]  224         lda     #0x3C
   1D41 8D 83 03      [ 4]  225         sta     audio_control_reg_b
   1D44 A9 34         [ 2]  226         lda     #0x34
   1D46 8D 81 03      [ 4]  227         sta     audio_control_reg_a
   1D49 A2 00         [ 2]  228         ldx     #0x00
   1D4B                     229 L1D4B:
   1D4B A9 30         [ 2]  230         lda     #0x30
   1D4D 95 81         [ 4]  231         sta     board_1_control_reg_a,x
   1D4F 95 83         [ 4]  232         sta     board_1_control_reg_b,x
   1D51 A9 FF         [ 2]  233         lda     #0xFF
   1D53 95 80         [ 4]  234         sta     board_1_periph$ddr_reg_a,x
   1D55 95 82         [ 4]  235         sta     board_1_periph$ddr_reg_b,x
   1D57 A9 34         [ 2]  236         lda     #0x34
   1D59 95 81         [ 4]  237         sta     board_1_control_reg_a,x
   1D5B 95 83         [ 4]  238         sta     board_1_control_reg_b,x
   1D5D A9 00         [ 2]  239         lda     #0x00
   1D5F 95 80         [ 4]  240         sta     board_1_periph$ddr_reg_a,x
   1D61 95 82         [ 4]  241         sta     board_1_periph$ddr_reg_b,x
   1D63 E8            [ 2]  242         inx
   1D64 E8            [ 2]  243         inx
   1D65 E8            [ 2]  244         inx
   1D66 E8            [ 2]  245         inx
   1D67 E0 20         [ 2]  246         cpx     #0x20
   1D69 90 E0         [ 4]  247         bcc     L1D4B
   1D6B A9 00         [ 2]  248         lda     #0x00
   1D6D 85 5E         [ 3]  249         sta     X005E
   1D6F 85 64         [ 3]  250         sta     X0064
   1D71 60            [ 6]  251         rts
                            252 ;
   1D72                     253 L1D72:
   1D72 8D 02 03      [ 4]  254         sta     transport_periph$ddr_reg_b
   1D75 A9 FA         [ 2]  255         lda     #0xFA
   1D77 85 50         [ 3]  256         sta     X0050
   1D79                     257 L1D79:
   1D79 20 83 1E      [ 6]  258         jsr     L1E83
   1D7C A5 50         [ 3]  259         lda     X0050
   1D7E D0 F9         [ 4]  260         bne     L1D79
   1D80 AD 02 03      [ 4]  261         lda     transport_periph$ddr_reg_b
   1D83 29 60         [ 2]  262         and     #0x60
   1D85 D0 05         [ 4]  263         bne     L1D8C
   1D87 A9 00         [ 2]  264         lda     #0x00
   1D89 8D 02 03      [ 4]  265         sta     transport_periph$ddr_reg_b
   1D8C                     266 L1D8C:
   1D8C 60            [ 6]  267         rts
                            268 ;
   1D8D                     269 L1D8D:
   1D8D A9 00         [ 2]  270         lda     #0x00
   1D8F 85 58         [ 3]  271         sta     X0058
   1D91                     272 L1D91:
   1D91 AD 02 03      [ 4]  273         lda     transport_periph$ddr_reg_b
   1D94 A9 0A         [ 2]  274         lda     #0x0A
   1D96 85 50         [ 3]  275         sta     X0050
   1D98 E6 58         [ 5]  276         inc     X0058
   1D9A A5 58         [ 3]  277         lda     X0058
   1D9C C9 21         [ 2]  278         cmp     #0x21
   1D9E B0 0F         [ 4]  279         bcs     L1DAF
   1DA0                     280 L1DA0:
   1DA0 20 83 1E      [ 6]  281         jsr     L1E83
   1DA3 A5 50         [ 3]  282         lda     X0050
   1DA5 F0 E6         [ 4]  283         beq     L1D8D
   1DA7 AD 03 03      [ 4]  284         lda     transport_control_reg_b
   1DAA 10 F4         [ 4]  285         bpl     L1DA0
   1DAC 4C 91 1D      [ 3]  286         jmp     L1D91
   1DAF                     287 L1DAF:
   1DAF 60            [ 6]  288         rts
                            289 ;
   1DB0                     290 L1DB0:
   1DB0 A9 FA         [ 2]  291         lda     #0xFA
   1DB2 85 50         [ 3]  292         sta     X0050
   1DB4                     293 L1DB4:
   1DB4 20 83 1E      [ 6]  294         jsr     L1E83
   1DB7 A5 50         [ 3]  295         lda     X0050
   1DB9 D0 F9         [ 4]  296         bne     L1DB4
   1DBB                     297 L1DBB:
   1DBB 20 83 1E      [ 6]  298         jsr     L1E83
   1DBE AD 02 03      [ 4]  299         lda     transport_periph$ddr_reg_b
   1DC1 6A            [ 2]  300         ror     a
   1DC2 90 F7         [ 4]  301         bcc     L1DBB
   1DC4 A9 A0         [ 2]  302         lda     #0xA0
   1DC6 85 50         [ 3]  303         sta     X0050
   1DC8                     304 L1DC8:
   1DC8 20 83 1E      [ 6]  305         jsr     L1E83
   1DCB AD 02 03      [ 4]  306         lda     transport_periph$ddr_reg_b
   1DCE 6A            [ 2]  307         ror     a
   1DCF 90 EA         [ 4]  308         bcc     L1DBB
   1DD1 A5 50         [ 3]  309         lda     X0050
   1DD3 D0 F3         [ 4]  310         bne     L1DC8
   1DD5 60            [ 6]  311         rts
                            312 ;
   1DD6                     313 L1DD6:
   1DD6 AD 00 03      [ 4]  314         lda     transport_periph$ddr_reg_a
   1DD9 A9 40         [ 2]  315         lda     #0x40
   1DDB 85 82         [ 3]  316         sta     board_1_periph$ddr_reg_b
   1DDD 85 86         [ 3]  317         sta     board_2_periph$ddr_reg_b
   1DDF 85 8A         [ 3]  318         sta     board_3_periph$ddr_reg_b
   1DE1 85 8E         [ 3]  319         sta     board_4_periph$ddr_reg_b
   1DE3 A9 3C         [ 2]  320         lda     #0x3C
   1DE5 8D 81 03      [ 4]  321         sta     audio_control_reg_a
   1DE8 A9 34         [ 2]  322         lda     #0x34
   1DEA 8D 83 03      [ 4]  323         sta     audio_control_reg_b
   1DED A9 60         [ 2]  324         lda     #0x60
   1DEF 85 82         [ 3]  325         sta     board_1_periph$ddr_reg_b
   1DF1                     326 L1DF1:
   1DF1 AD 02 03      [ 4]  327         lda     transport_periph$ddr_reg_b
   1DF4 4A            [ 2]  328         lsr     a
   1DF5 90 11         [ 4]  329         bcc     L1E08
   1DF7 20 24 1F      [ 6]  330         jsr     L1F24
   1DFA 20 83 1E      [ 6]  331         jsr     L1E83
   1DFD AD 01 03      [ 4]  332         lda     transport_control_reg_a
   1E00 10 EF         [ 4]  333         bpl     L1DF1
   1E02 20 1A 1E      [ 6]  334         jsr     L1E1A
   1E05 4C F1 1D      [ 3]  335         jmp     L1DF1
                            336 ;
   1E08                     337 L1E08:
   1E08 A9 64         [ 2]  338         lda     #0x64
   1E0A 85 50         [ 3]  339         sta     X0050
   1E0C                     340 L1E0C:
   1E0C 20 83 1E      [ 6]  341         jsr     L1E83
   1E0F AD 02 03      [ 4]  342         lda     transport_periph$ddr_reg_b
   1E12 4A            [ 2]  343         lsr     a
   1E13 B0 C1         [ 4]  344         bcs     L1DD6
   1E15 A5 50         [ 3]  345         lda     X0050
   1E17 D0 F3         [ 4]  346         bne     L1E0C
   1E19 60            [ 6]  347         rts
                            348 ;
   1E1A                     349 L1E1A:
   1E1A AD 00 03      [ 4]  350         lda     transport_periph$ddr_reg_a
   1E1D 29 7F         [ 2]  351         and     #0x7F
   1E1F 85 5C         [ 3]  352         sta     X005C
   1E21 29 7E         [ 2]  353         and     #0x7E
   1E23 C9 22         [ 2]  354         cmp     #0x22
   1E25 F0 3A         [ 4]  355         beq     L1E61
   1E27 C9 32         [ 2]  356         cmp     #0x32
   1E29 90 4F         [ 4]  357         bcc     L1E7A
   1E2B C9 3A         [ 2]  358         cmp     #0x3A
   1E2D 90 32         [ 4]  359         bcc     L1E61
   1E2F A5 5C         [ 3]  360         lda     X005C
   1E31 C9 41         [ 2]  361         cmp     #0x41
   1E33 90 45         [ 4]  362         bcc     L1E7A
   1E35 C9 4F         [ 2]  363         cmp     #0x4F
   1E37 B0 41         [ 4]  364         bcs     L1E7A
   1E39 A6 64         [ 3]  365         ldx     X0064
   1E3B 38            [ 2]  366         sec
   1E3C E9 41         [ 2]  367         sbc     #0x41
   1E3E C9 08         [ 2]  368         cmp     #0x08
   1E40 90 02         [ 4]  369         bcc     L1E44
   1E42 E8            [ 2]  370         inx
   1E43 E8            [ 2]  371         inx
   1E44                     372 L1E44:
   1E44 29 07         [ 2]  373         and     #0x07
   1E46 A8            [ 2]  374         tay
   1E47 B9 7B 1E      [ 5]  375         lda     X1E7B,y
   1E4A 85 5D         [ 3]  376         sta     X005D
   1E4C A5 5E         [ 3]  377         lda     X005E
   1E4E 4A            [ 2]  378         lsr     a
   1E4F B0 09         [ 4]  379         bcs     L1E5A
   1E51 A5 5D         [ 3]  380         lda     X005D
   1E53 49 FF         [ 2]  381         eor     #0xFF
   1E55 35 00         [ 4]  382         and     RAM_start,x
   1E57 95 00         [ 4]  383         sta     RAM_start,x
   1E59 60            [ 6]  384         rts
                            385 ;
   1E5A                     386 L1E5A:
   1E5A A5 5D         [ 3]  387         lda     X005D
   1E5C 15 00         [ 4]  388         ora     RAM_start,x
   1E5E 95 00         [ 4]  389         sta     RAM_start,x
   1E60 60            [ 6]  390         rts
                            391 ;
   1E61                     392 L1E61:
   1E61 A5 5C         [ 3]  393         lda     X005C
   1E63 85 5E         [ 3]  394         sta     X005E
   1E65 29 7E         [ 2]  395         and     #0x7E
   1E67 C9 22         [ 2]  396         cmp     #0x22
   1E69 D0 05         [ 4]  397         bne     L1E70
   1E6B A9 98         [ 2]  398         lda     #0x98
   1E6D 85 64         [ 3]  399         sta     X0064
   1E6F 60            [ 6]  400         rts
                            401 ;
   1E70                     402 L1E70:
   1E70 38            [ 2]  403         sec
   1E71 E9 32         [ 2]  404         sbc     #0x32
   1E73 0A            [ 2]  405         asl     a
   1E74 18            [ 2]  406         clc
   1E75 69 80         [ 2]  407         adc     #0x80
   1E77 85 64         [ 3]  408         sta     X0064
   1E79 60            [ 6]  409         rts
   1E7A                     410 L1E7A:
   1E7A 60            [ 6]  411         rts
                            412 ;
   1E7B                     413 X1E7B:
   1E7B 01 02 04 08         414         .db     0x01,0x02,0x04,0x08
   1E7F 10 20 40 80         415         .db     0x10,0x20,0x40,0x80
                            416 ;
   1E83                     417 L1E83:
   1E83 AD 05 02      [ 4]  418         lda     U18_edge_detect_control_DI_pos
   1E86 85 5F         [ 3]  419         sta     X005F
   1E88 F0 50         [ 4]  420         beq     L1EDA
   1E8A A5 5B         [ 3]  421         lda     X005B
   1E8C 30 0E         [ 4]  422         bmi     L1E9C
   1E8E A5 5F         [ 3]  423         lda     X005F
   1E90 29 40         [ 2]  424         and     #0x40
   1E92 F0 16         [ 4]  425         beq     L1EAA
   1E94 A9 80         [ 2]  426         lda     #0x80
   1E96 85 5B         [ 3]  427         sta     X005B
   1E98 A9 FA         [ 2]  428         lda     #0xFA
   1E9A 85 51         [ 3]  429         sta     X0051
   1E9C                     430 L1E9C:
   1E9C A5 51         [ 3]  431         lda     X0051
   1E9E D0 06         [ 4]  432         bne     L1EA6
   1EA0 A9 00         [ 2]  433         lda     #0x00
   1EA2 85 5B         [ 3]  434         sta     X005B
   1EA4 E6 5A         [ 5]  435         inc     X005A
   1EA6                     436 L1EA6:
   1EA6 A5 5F         [ 3]  437         lda     X005F
   1EA8 10 30         [ 4]  438         bpl     L1EDA
   1EAA                     439 L1EAA:
   1EAA AD 04 02      [ 4]  440         lda     U18_timer
   1EAD 49 FF         [ 2]  441         eor     #0xFF
   1EAF 4A            [ 2]  442         lsr     a
   1EB0 4A            [ 2]  443         lsr     a
   1EB1 4A            [ 2]  444         lsr     a
   1EB2 85 57         [ 3]  445         sta     X0057
   1EB4 90 02         [ 4]  446         bcc     L1EB8
   1EB6 E6 57         [ 5]  447         inc     X0057
   1EB8                     448 L1EB8:
   1EB8 A9 7A         [ 2]  449         lda     #0x7A
   1EBA 38            [ 2]  450         sec
   1EBB E5 57         [ 3]  451         sbc     X0057
   1EBD 8D 15 02      [ 4]  452         sta     U18_timer_8T_DI
   1EC0 C6 50         [ 5]  453         dec     X0050
   1EC2 C6 51         [ 5]  454         dec     X0051
   1EC4 C6 52         [ 5]  455         dec     X0052
   1EC6 C6 53         [ 5]  456         dec     X0053
   1EC8 D0 10         [ 4]  457         bne     L1EDA
   1ECA A9 64         [ 2]  458         lda     #0x64
   1ECC 85 53         [ 3]  459         sta     X0053
   1ECE C6 54         [ 5]  460         dec     X0054
   1ED0 C6 55         [ 5]  461         dec     X0055
   1ED2 D0 06         [ 4]  462         bne     L1EDA
   1ED4 A9 64         [ 2]  463         lda     #0x64
   1ED6 85 55         [ 3]  464         sta     X0055
   1ED8 C6 56         [ 5]  465         dec     X0056
   1EDA                     466 L1EDA:
   1EDA 60            [ 6]  467         rts
                            468 ;
   1EDB                     469 L1EDB:
   1EDB A9 00         [ 2]  470         lda     #0x00
   1EDD 85 61         [ 3]  471         sta     X0061
   1EDF 85 62         [ 3]  472         sta     X0062
   1EE1 A9 0A         [ 2]  473         lda     #0x0A
   1EE3 85 54         [ 3]  474         sta     X0054
   1EE5 A9 64         [ 2]  475         lda     #0x64
   1EE7 85 53         [ 3]  476         sta     X0053
   1EE9                     477 L1EE9:
   1EE9 20 83 1E      [ 6]  478         jsr     L1E83
   1EEC A5 54         [ 3]  479         lda     X0054
   1EEE D0 F9         [ 4]  480         bne     L1EE9
   1EF0 A9 0A         [ 2]  481         lda     #0x0A
   1EF2 85 54         [ 3]  482         sta     X0054
   1EF4 A9 64         [ 2]  483         lda     #0x64
   1EF6 85 53         [ 3]  484         sta     X0053
   1EF8 A5 62         [ 3]  485         lda     X0062
   1EFA C9 08         [ 2]  486         cmp     #0x08
   1EFC F0 15         [ 4]  487         beq     L1F13
   1EFE E6 62         [ 5]  488         inc     X0062
   1F00 A2 09         [ 2]  489         ldx     #0x09
   1F02 38            [ 2]  490         sec
   1F03 AD 80 03      [ 4]  491         lda     audio_periph$ddr_reg_a
   1F06                     492 L1F06:
   1F06 2A            [ 2]  493         rol     a
   1F07 CA            [ 2]  494         dex
   1F08 90 FC         [ 4]  495         bcc     L1F06
   1F0A 18            [ 2]  496         clc
   1F0B 8A            [ 2]  497         txa
   1F0C 65 61         [ 3]  498         adc     X0061
   1F0E 85 61         [ 3]  499         sta     X0061
   1F10 4C E9 1E      [ 3]  500         jmp     L1EE9
                            501 ;
   1F13                     502 L1F13:
   1F13 46 61         [ 5]  503         lsr     X0061
   1F15 46 61         [ 5]  504         lsr     X0061
   1F17 46 61         [ 5]  505         lsr     X0061
   1F19 A5 61         [ 3]  506         lda     X0061
   1F1B 85 60         [ 3]  507         sta     X0060
   1F1D A9 00         [ 2]  508         lda     #0x00
   1F1F 85 61         [ 3]  509         sta     X0061
   1F21 85 62         [ 3]  510         sta     X0062
   1F23 60            [ 6]  511         rts
                            512 ;
   1F24                     513 L1F24:
   1F24 AD 80 02      [ 4]  514         lda     U19_PORTA
   1F27 49 FF         [ 2]  515         eor     #0xFF
   1F29 4A            [ 2]  516         lsr     a
   1F2A 4A            [ 2]  517         lsr     a
   1F2B 4A            [ 2]  518         lsr     a
   1F2C 4A            [ 2]  519         lsr     a
   1F2D 18            [ 2]  520         clc
   1F2E 65 60         [ 3]  521         adc     X0060
   1F30 AA            [ 2]  522         tax
   1F31 BD 57 1F      [ 5]  523         lda     X1F57,x
   1F34 85 63         [ 3]  524         sta     X0063
   1F36 A5 52         [ 3]  525         lda     X0052
   1F38 D0 16         [ 4]  526         bne     L1F50
   1F3A A9 0A         [ 2]  527         lda     #0x0A
   1F3C 85 52         [ 3]  528         sta     X0052
   1F3E A5 63         [ 3]  529         lda     X0063
   1F40 CD 82 03      [ 4]  530         cmp     audio_periph$ddr_reg_b
   1F43 90 08         [ 4]  531         bcc     L1F4D
   1F45 F0 09         [ 4]  532         beq     L1F50
   1F47 EE 82 03      [ 6]  533         inc     audio_periph$ddr_reg_b
   1F4A 4C 50 1F      [ 3]  534         jmp     L1F50
                            535 ;
   1F4D                     536 L1F4D:
   1F4D CE 82 03      [ 6]  537         dec     audio_periph$ddr_reg_b
   1F50                     538 L1F50:
   1F50 AD 82 03      [ 4]  539         lda     audio_periph$ddr_reg_b
   1F53 8D 82 02      [ 4]  540         sta     U19_PORTB
   1F56 60            [ 6]  541         rts
                            542 ;
   1F57                     543 X1F57:
   1F57 03 04 06 08         544         .db     0x03, 0x04, 0x06, 0x08
   1F5B 10 16 20 2D         545         .db     0x10, 0x16, 0x20, 0x2D
   1F5F 40 5A 80 BF         546         .db     0x40, 0x5A, 0x80, 0xBF
   1F63 FF FF FF FF         547         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1F67 FF                  548         .db     0xFF
                            549 ;
   1F68                     550 L1F68:
   1F68 A9 00         [ 2]  551         lda     #0x00
   1F6A 85 5A         [ 3]  552         sta     X005A
   1F6C 20 83 1E      [ 6]  553         jsr     L1E83
   1F6F 4C EA 1C      [ 3]  554         jmp     L1CEA
                            555 ;
                            556 ; all zeros in this gap
                            557 ;
   1FFC                     558         .org    0x1FFC
                            559 ;
                            560 ; vectors
                            561 ;
   1FFC                     562 RESETVEC:
   1FFC 00 1C               563         .dw     RESET
   1FFE                     564 IRQVEC:
   1FFE 00 00               565         .dw     RAM_start
                            566 
