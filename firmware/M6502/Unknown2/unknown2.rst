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
                     0000    11 RAM_start = 0x0000
                     0002    12 X0002 = 0x0002
                     0008    13 X0008 = 0x0008
                     0050    14 X0050 = 0x0050
                     0051    15 X0051 = 0x0051
                     0052    16 X0052 = 0x0052
                     0053    17 X0053 = 0x0053
                     0054    18 X0054 = 0x0054
                     0055    19 X0055 = 0x0055
                     0056    20 X0056 = 0x0056
                     0057    21 X0057 = 0x0057
                     0058    22 X0058 = 0x0058
                     0059    23 X0059 = 0x0059
                     005A    24 X005A = 0x005A
                     005C    25 X005C = 0x005C
                     005D    26 X005D = 0x005D
                     005E    27 X005E = 0x005E
                     005F    28 X005F = 0x005F
                     0060    29 X0060 = 0x0060
                     0061    30 X0061 = 0x0061
                     0062    31 X0062 = 0x0062
                     0063    32 X0063 = 0x0063
                     0064    33 X0064 = 0x0064
                             34 
                             35         .include "../include/ptt6502.def"
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
                             36 
                             37 ;board_1_periph$ddr_reg_a = 0x0080
                             38 ;board_1_control_reg_a = 0x0081
                             39 ;board_1_periph$ddr_reg_b = 0x0082
                             40 ;board_1_control_reg_b = 0x0083
                             41 ;board_2_periph$ddr_reg_b = 0x0086
                             42 ;board_3_periph$ddr_reg_b = 0x008A
                             43 ;board_4_periph$ddr_reg_b = 0x008E
                             44 
                             45 ;U18_DDRA = 0x0201
                             46 ;U18_PORTB = 0x0202
                             47 ;U18_DDRB = 0x0203
                             48 ;U18_timer = 0x0204
                             49 ;U18_edge_detect_control_DI_pos = 0x0205
                             50 ;U18_timer_8T_DI = 0x0215
                             51 
                             52 ;U19_PORTA = 0x0280
                             53 ;U19_DDRA = 0x0281
                             54 ;U19_PORTB = 0x0282
                             55 ;U19_DDRB = 0x0283
                             56 
                             57 ;transport_periph$ddr_reg_a = 0x0300
                             58 ;transport_control_reg_a = 0x0301
                             59 ;transport_periph$ddr_reg_b = 0x0302
                             60 ;transport_control_reg_b = 0x0303
                             61 
                             62 ;audio_periph$ddr_reg_a = 0x0380
                             63 ;audio_control_reg_a = 0x0381
                             64 ;audio_periph$ddr_reg_b = 0x0382
                             65 ;audio_control_reg_b = 0x0383
                             66 
                             67 ;
   1C00                      68         .org    0x1C00
                             69 ;
   1C00                      70 RESET:
   1C00 D8            [ 2]   71         cld
   1C01 78            [ 2]   72         sei
   1C02 A2 F0         [ 2]   73         ldx     #0xF0
   1C04 9A            [ 2]   74         txs
   1C05 A9 00         [ 2]   75         lda     #0x00
   1C07 A2 10         [ 2]   76         ldx     #0x10
   1C09                      77 L1C09:
   1C09 95 00         [ 4]   78         sta     RAM_start,x
   1C0B E8            [ 2]   79         inx
   1C0C E0 80         [ 2]   80         cpx     #0x80
   1C0E D0 F9         [ 4]   81         bne     L1C09
   1C10 A9 00         [ 2]   82         lda     #0x00
   1C12 8D 01 03      [ 4]   83         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   84         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   85         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   86         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   87         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   88         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   89         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   90         sta     U18_DDRA
   1C2A A9 02         [ 2]   91         lda     #0x02
   1C2C 8D 81 02      [ 4]   92         sta     U19_DDRA
   1C2F A9 FF         [ 2]   93         lda     #0xFF
   1C31 8D 82 03      [ 4]   94         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   95         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   96         sta     U19_DDRB
   1C3A A9 FC         [ 2]   97         lda     #0xFC
   1C3C 8D 02 03      [ 4]   98         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   99         lda     #0x2E
   1C41 8D 01 03      [ 4]  100         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]  101         sta     transport_control_reg_b
   1C47 A9 3C         [ 2]  102         lda     #0x3C
   1C49 8D 81 03      [ 4]  103         sta     audio_control_reg_a
   1C4C 8D 83 03      [ 4]  104         sta     audio_control_reg_b
   1C4F A9 64         [ 2]  105         lda     #0x64
   1C51 85 53         [ 3]  106         sta     X0053
   1C53 A9 1E         [ 2]  107         lda     #0x1E
   1C55 85 56         [ 3]  108         sta     X0056
   1C57 A9 64         [ 2]  109         lda     #0x64
   1C59 85 55         [ 3]  110         sta     X0055
   1C5B A9 10         [ 2]  111         lda     #0x10
   1C5D 85 63         [ 3]  112         sta     X0063
   1C5F A9 10         [ 2]  113         lda     #0x10
   1C61 20 7C 1D      [ 6]  114         jsr     L1D7C
   1C64 A9 28         [ 2]  115         lda     #0x28
   1C66 85 54         [ 3]  116         sta     X0054
   1C68 A9 64         [ 2]  117         lda     #0x64
   1C6A 85 53         [ 3]  118         sta     X0053
   1C6C                     119 L1C6C:
   1C6C 20 8D 1E      [ 6]  120         jsr     L1E8D
   1C6F A5 54         [ 3]  121         lda     X0054
   1C71 D0 F9         [ 4]  122         bne     L1C6C
   1C73                     123 L1C73:
   1C73 A9 40         [ 2]  124         lda     #0x40
   1C75 20 7C 1D      [ 6]  125         jsr     L1D7C
   1C78                     126 L1C78:
   1C78 A9 00         [ 2]  127         lda     #0x00
   1C7A 85 58         [ 3]  128         sta     X0058
   1C7C                     129 L1C7C:
   1C7C 20 8D 1E      [ 6]  130         jsr     L1E8D
   1C7F AD 03 03      [ 4]  131         lda     transport_control_reg_b
   1C82 10 F8         [ 4]  132         bpl     L1C7C
   1C84 A9 06         [ 2]  133         lda     #0x06
   1C86 85 54         [ 3]  134         sta     X0054
   1C88 A9 64         [ 2]  135         lda     #0x64
   1C8A 85 53         [ 3]  136         sta     X0053
   1C8C                     137 L1C8C:
   1C8C 20 8D 1E      [ 6]  138         jsr     L1E8D
   1C8F AD 03 03      [ 4]  139         lda     transport_control_reg_b
   1C92 10 0B         [ 4]  140         bpl     L1C9F
   1C94 E6 58         [ 5]  141         inc     X0058
   1C96 AD 02 03      [ 4]  142         lda     transport_periph$ddr_reg_b
   1C99 A5 58         [ 3]  143         lda     X0058
   1C9B C9 64         [ 2]  144         cmp     #0x64
   1C9D B0 0B         [ 4]  145         bcs     L1CAA
   1C9F                     146 L1C9F:
   1C9F A5 54         [ 3]  147         lda     X0054
   1CA1 D0 E9         [ 4]  148         bne     L1C8C
   1CA3 4C 78 1C      [ 3]  149         jmp     L1C78
                            150 ;
   1CA6 C9 60         [ 2]  151         cmp     #0x60
   1CA8 90 00         [ 4]  152         bcc     L1CAA
   1CAA                     153 L1CAA:
   1CAA A9 20         [ 2]  154         lda     #0x20
   1CAC 20 7C 1D      [ 6]  155         jsr     L1D7C
   1CAF A9 19         [ 2]  156         lda     #0x19
   1CB1 85 54         [ 3]  157         sta     X0054
   1CB3 A9 64         [ 2]  158         lda     #0x64
   1CB5 85 53         [ 3]  159         sta     X0053
   1CB7                     160 L1CB7:
   1CB7 20 8D 1E      [ 6]  161         jsr     L1E8D
   1CBA A5 54         [ 3]  162         lda     X0054
   1CBC D0 F9         [ 4]  163         bne     L1CB7
   1CBE A9 00         [ 2]  164         lda     #0x00
   1CC0 85 59         [ 3]  165         sta     X0059
   1CC2 20 97 1D      [ 6]  166         jsr     L1D97
   1CC5 A9 40         [ 2]  167         lda     #0x40
   1CC7 20 7C 1D      [ 6]  168         jsr     L1D7C
   1CCA 20 97 1D      [ 6]  169         jsr     L1D97
   1CCD A9 FA         [ 2]  170         lda     #0xFA
   1CCF 85 50         [ 3]  171         sta     X0050
   1CD1                     172 L1CD1:
   1CD1 20 8D 1E      [ 6]  173         jsr     L1E8D
   1CD4 A5 50         [ 3]  174         lda     X0050
   1CD6 D0 F9         [ 4]  175         bne     L1CD1
   1CD8 A9 20         [ 2]  176         lda     #0x20
   1CDA 20 7C 1D      [ 6]  177         jsr     L1D7C
   1CDD 20 97 1D      [ 6]  178         jsr     L1D97
   1CE0 E6 59         [ 5]  179         inc     X0059
   1CE2 A9 10         [ 2]  180         lda     #0x10
   1CE4 20 7C 1D      [ 6]  181         jsr     L1D7C
   1CE7 A9 80         [ 2]  182         lda     #0x80
   1CE9 20 7C 1D      [ 6]  183         jsr     L1D7C
   1CEC 20 BA 1D      [ 6]  184         jsr     L1DBA
   1CEF A9 10         [ 2]  185         lda     #0x10
   1CF1 20 7C 1D      [ 6]  186         jsr     L1D7C
   1CF4 20 4F 1D      [ 6]  187         jsr     L1D4F
   1CF7                     188 L1CF7:
   1CF7 20 8D 1E      [ 6]  189         jsr     L1E8D
   1CFA 20 1A 1F      [ 6]  190         jsr     L1F1A
   1CFD A5 5A         [ 3]  191         lda     X005A
   1CFF D0 10         [ 4]  192         bne     L1D11
   1D01 A9 02         [ 2]  193         lda     #0x02
   1D03 8D 80 02      [ 4]  194         sta     U19_PORTA
   1D06 A9 00         [ 2]  195         lda     #0x00
   1D08 8D 02 02      [ 4]  196         sta     U18_PORTB
   1D0B A5 56         [ 3]  197         lda     X0056
   1D0D D0 E8         [ 4]  198         bne     L1CF7
   1D0F E6 5A         [ 5]  199         inc     X005A
   1D11                     200 L1D11:
   1D11 20 4F 1D      [ 6]  201         jsr     L1D4F
   1D14 A9 00         [ 2]  202         lda     #0x00
   1D16 8D 80 02      [ 4]  203         sta     U19_PORTA
   1D19 A9 80         [ 2]  204         lda     #0x80
   1D1B 8D 02 02      [ 4]  205         sta     U18_PORTB
   1D1E A9 80         [ 2]  206         lda     #0x80
   1D20 20 7C 1D      [ 6]  207         jsr     L1D7C
   1D23 20 BA 1D      [ 6]  208         jsr     L1DBA
   1D26 C6 5A         [ 5]  209         dec     X005A
   1D28 20 E0 1D      [ 6]  210         jsr     L1DE0
   1D2B 20 4F 1D      [ 6]  211         jsr     L1D4F
   1D2E A9 1E         [ 2]  212         lda     #0x1E
   1D30 85 56         [ 3]  213         sta     X0056
   1D32 A9 64         [ 2]  214         lda     #0x64
   1D34 85 55         [ 3]  215         sta     X0055
   1D36 E6 59         [ 5]  216         inc     X0059
   1D38 A5 59         [ 3]  217         lda     X0059
   1D3A C9 1A         [ 2]  218         cmp     #0x1A
   1D3C 90 03         [ 4]  219         bcc     L1D41
   1D3E 4C 73 1C      [ 3]  220         jmp     L1C73
                            221 ;
   1D41                     222 L1D41:
   1D41 20 BA 1D      [ 6]  223         jsr     L1DBA
   1D44 A9 10         [ 2]  224         lda     #0x10
   1D46 20 7C 1D      [ 6]  225         jsr     L1D7C
   1D49 20 D1 1E      [ 6]  226         jsr     L1ED1
   1D4C 4C F7 1C      [ 3]  227         jmp     L1CF7
                            228 ;
   1D4F                     229 L1D4F:
   1D4F A9 3C         [ 2]  230         lda     #0x3C
   1D51 8D 83 03      [ 4]  231         sta     audio_control_reg_b
   1D54 A9 34         [ 2]  232         lda     #0x34
   1D56 8D 81 03      [ 4]  233         sta     audio_control_reg_a
   1D59 A2 00         [ 2]  234         ldx     #0x00
   1D5B                     235 L1D5B:
   1D5B A9 30         [ 2]  236         lda     #0x30
   1D5D 95 81         [ 4]  237         sta     board_1_control_reg_a,x
   1D5F 95 83         [ 4]  238         sta     board_1_control_reg_b,x
   1D61 A9 FF         [ 2]  239         lda     #0xFF
   1D63 95 80         [ 4]  240         sta     board_1_periph$ddr_reg_a,x
   1D65 95 82         [ 4]  241         sta     board_1_periph$ddr_reg_b,x
   1D67 A9 34         [ 2]  242         lda     #0x34
   1D69 95 81         [ 4]  243         sta     board_1_control_reg_a,x
   1D6B 95 83         [ 4]  244         sta     board_1_control_reg_b,x
   1D6D A9 00         [ 2]  245         lda     #0x00
   1D6F 95 80         [ 4]  246         sta     board_1_periph$ddr_reg_a,x
   1D71 95 82         [ 4]  247         sta     board_1_periph$ddr_reg_b,x
   1D73 E8            [ 2]  248         inx
   1D74 E8            [ 2]  249         inx
   1D75 E8            [ 2]  250         inx
   1D76 E8            [ 2]  251         inx
   1D77 E0 20         [ 2]  252         cpx     #0x20
   1D79 90 E0         [ 4]  253         bcc     L1D5B
   1D7B 60            [ 6]  254         rts
                            255 ;
   1D7C                     256 L1D7C:
   1D7C 8D 02 03      [ 4]  257         sta     transport_periph$ddr_reg_b
   1D7F A9 FA         [ 2]  258         lda     #0xFA
   1D81 85 50         [ 3]  259         sta     X0050
   1D83                     260 L1D83:
   1D83 20 8D 1E      [ 6]  261         jsr     L1E8D
   1D86 A5 50         [ 3]  262         lda     X0050
   1D88 D0 F9         [ 4]  263         bne     L1D83
   1D8A AD 02 03      [ 4]  264         lda     transport_periph$ddr_reg_b
   1D8D 29 60         [ 2]  265         and     #0x60
   1D8F D0 05         [ 4]  266         bne     L1D96
   1D91 A9 00         [ 2]  267         lda     #0x00
   1D93 8D 02 03      [ 4]  268         sta     transport_periph$ddr_reg_b
   1D96                     269 L1D96:
   1D96 60            [ 6]  270         rts
                            271 ;
   1D97                     272 L1D97:
   1D97 A9 00         [ 2]  273         lda     #0x00
   1D99 85 58         [ 3]  274         sta     X0058
   1D9B                     275 L1D9B:
   1D9B AD 02 03      [ 4]  276         lda     transport_periph$ddr_reg_b
   1D9E A9 0A         [ 2]  277         lda     #0x0A
   1DA0 85 50         [ 3]  278         sta     X0050
   1DA2 E6 58         [ 5]  279         inc     X0058
   1DA4 A5 58         [ 3]  280         lda     X0058
   1DA6 C9 21         [ 2]  281         cmp     #0x21
   1DA8 B0 0F         [ 4]  282         bcs     L1DB9
   1DAA                     283 L1DAA:
   1DAA 20 8D 1E      [ 6]  284         jsr     L1E8D
   1DAD A5 50         [ 3]  285         lda     X0050
   1DAF F0 E6         [ 4]  286         beq     L1D97
   1DB1 AD 03 03      [ 4]  287         lda     transport_control_reg_b
   1DB4 10 F4         [ 4]  288         bpl     L1DAA
   1DB6 4C 9B 1D      [ 3]  289         jmp     L1D9B
   1DB9                     290 L1DB9:
   1DB9 60            [ 6]  291         rts
                            292 ;
   1DBA                     293 L1DBA:
   1DBA A9 FA         [ 2]  294         lda     #0xFA
   1DBC 85 50         [ 3]  295         sta     X0050
   1DBE                     296 L1DBE:
   1DBE 20 8D 1E      [ 6]  297         jsr     L1E8D
   1DC1 A5 50         [ 3]  298         lda     X0050
   1DC3 D0 F9         [ 4]  299         bne     L1DBE
   1DC5                     300 L1DC5:
   1DC5 20 8D 1E      [ 6]  301         jsr     L1E8D
   1DC8 AD 02 03      [ 4]  302         lda     transport_periph$ddr_reg_b
   1DCB 6A            [ 2]  303         ror     a
   1DCC 90 F7         [ 4]  304         bcc     L1DC5
   1DCE A9 A0         [ 2]  305         lda     #0xA0
   1DD0 85 50         [ 3]  306         sta     X0050
   1DD2                     307 L1DD2:
   1DD2 20 8D 1E      [ 6]  308         jsr     L1E8D
   1DD5 AD 02 03      [ 4]  309         lda     transport_periph$ddr_reg_b
   1DD8 6A            [ 2]  310         ror     a
   1DD9 90 EA         [ 4]  311         bcc     L1DC5
   1DDB A5 50         [ 3]  312         lda     X0050
   1DDD D0 F3         [ 4]  313         bne     L1DD2
   1DDF 60            [ 6]  314         rts
                            315 ;
   1DE0                     316 L1DE0:
   1DE0 AD 00 03      [ 4]  317         lda     transport_periph$ddr_reg_a
   1DE3 A9 40         [ 2]  318         lda     #0x40
   1DE5 85 82         [ 3]  319         sta     board_1_periph$ddr_reg_b
   1DE7 85 86         [ 3]  320         sta     board_2_periph$ddr_reg_b
   1DE9 85 8A         [ 3]  321         sta     board_3_periph$ddr_reg_b
   1DEB 85 8E         [ 3]  322         sta     board_4_periph$ddr_reg_b
   1DED A9 3C         [ 2]  323         lda     #0x3C
   1DEF 8D 81 03      [ 4]  324         sta     audio_control_reg_a
   1DF2 A9 34         [ 2]  325         lda     #0x34
   1DF4 8D 83 03      [ 4]  326         sta     audio_control_reg_b
   1DF7 A9 60         [ 2]  327         lda     #0x60
   1DF9 85 82         [ 3]  328         sta     board_1_periph$ddr_reg_b
   1DFB                     329 L1DFB:
   1DFB AD 02 03      [ 4]  330         lda     transport_periph$ddr_reg_b
   1DFE 4A            [ 2]  331         lsr     a
   1DFF 90 11         [ 4]  332         bcc     L1E12
   1E01 20 1A 1F      [ 6]  333         jsr     L1F1A
   1E04 20 8D 1E      [ 6]  334         jsr     L1E8D
   1E07 AD 01 03      [ 4]  335         lda     transport_control_reg_a
   1E0A 10 EF         [ 4]  336         bpl     L1DFB
   1E0C 20 24 1E      [ 6]  337         jsr     L1E24
   1E0F 4C FB 1D      [ 3]  338         jmp     L1DFB
                            339 ;
   1E12                     340 L1E12:
   1E12 A9 64         [ 2]  341         lda     #0x64
   1E14 85 50         [ 3]  342         sta     X0050
   1E16                     343 L1E16:
   1E16 20 8D 1E      [ 6]  344         jsr     L1E8D
   1E19 AD 02 03      [ 4]  345         lda     transport_periph$ddr_reg_b
   1E1C 4A            [ 2]  346         lsr     a
   1E1D B0 C1         [ 4]  347         bcs     L1DE0
   1E1F A5 50         [ 3]  348         lda     X0050
   1E21 D0 F3         [ 4]  349         bne     L1E16
   1E23 60            [ 6]  350         rts
                            351 ;
   1E24                     352 L1E24:
   1E24 AD 00 03      [ 4]  353         lda     transport_periph$ddr_reg_a
   1E27 29 7F         [ 2]  354         and     #0x7F
   1E29 85 5C         [ 3]  355         sta     X005C
   1E2B 29 7E         [ 2]  356         and     #0x7E
   1E2D C9 22         [ 2]  357         cmp     #0x22
   1E2F F0 3A         [ 4]  358         beq     L1E6B
   1E31 C9 32         [ 2]  359         cmp     #0x32
   1E33 90 4F         [ 4]  360         bcc     L1E84
   1E35 C9 3A         [ 2]  361         cmp     #0x3A
   1E37 90 32         [ 4]  362         bcc     L1E6B
   1E39 A5 5C         [ 3]  363         lda     X005C
   1E3B C9 41         [ 2]  364         cmp     #0x41
   1E3D 90 45         [ 4]  365         bcc     L1E84
   1E3F C9 51         [ 2]  366         cmp     #0x51
   1E41 B0 41         [ 4]  367         bcs     L1E84
   1E43 A6 64         [ 3]  368         ldx     X0064
   1E45 38            [ 2]  369         sec
   1E46 E9 41         [ 2]  370         sbc     #0x41
   1E48 C9 08         [ 2]  371         cmp     #0x08
   1E4A 90 02         [ 4]  372         bcc     L1E4E
   1E4C E8            [ 2]  373         inx
   1E4D E8            [ 2]  374         inx
   1E4E                     375 L1E4E:
   1E4E 29 07         [ 2]  376         and     #0x07
   1E50 A8            [ 2]  377         tay
   1E51 B9 85 1E      [ 5]  378         lda     X1E85,y
   1E54 85 5D         [ 3]  379         sta     X005D
   1E56 A5 5E         [ 3]  380         lda     X005E
   1E58 4A            [ 2]  381         lsr     a
   1E59 B0 09         [ 4]  382         bcs     L1E64
   1E5B A5 5D         [ 3]  383         lda     X005D
   1E5D 49 FF         [ 2]  384         eor     #0xFF
   1E5F 35 00         [ 4]  385         and     RAM_start,x
   1E61 95 00         [ 4]  386         sta     RAM_start,x
   1E63 60            [ 6]  387         rts
                            388 ;
   1E64                     389 L1E64:
   1E64 A5 5D         [ 3]  390         lda     X005D
   1E66 15 00         [ 4]  391         ora     RAM_start,x
   1E68 95 00         [ 4]  392         sta     RAM_start,x
   1E6A 60            [ 6]  393         rts
                            394 ;
   1E6B                     395 L1E6B:
   1E6B A5 5C         [ 3]  396         lda     X005C
   1E6D 85 5E         [ 3]  397         sta     X005E
   1E6F 29 7E         [ 2]  398         and     #0x7E
   1E71 C9 22         [ 2]  399         cmp     #0x22
   1E73 D0 05         [ 4]  400         bne     L1E7A
   1E75 A9 98         [ 2]  401         lda     #0x98
   1E77 85 64         [ 3]  402         sta     X0064
   1E79 60            [ 6]  403         rts
                            404 ;
   1E7A                     405 L1E7A:
   1E7A 38            [ 2]  406         sec
   1E7B E9 32         [ 2]  407         sbc     #0x32
   1E7D 0A            [ 2]  408         asl     a
   1E7E 18            [ 2]  409         clc
   1E7F 69 80         [ 2]  410         adc     #0x80
   1E81 85 64         [ 3]  411         sta     X0064
   1E83 60            [ 6]  412         rts
   1E84                     413 L1E84:
   1E84 60            [ 6]  414         rts
                            415 ;
   1E85                     416 X1E85:
   1E85 01 02 04 08         417         .db     0x01,0x02,0x04,0x08
   1E89 10 20 40 80         418         .db     0x10,0x20,0x40,0x80
                            419 ;
   1E8D                     420 L1E8D:
   1E8D AD 05 02      [ 4]  421         lda     U18_edge_detect_control_DI_pos
   1E90 85 5F         [ 3]  422         sta     X005F
   1E92 F0 3C         [ 4]  423         beq     L1ED0
   1E94 29 40         [ 2]  424         and     #0x40
   1E96 F0 04         [ 4]  425         beq     L1E9C
   1E98 A9 01         [ 2]  426         lda     #0x01
   1E9A 85 5A         [ 3]  427         sta     X005A
   1E9C                     428 L1E9C:
   1E9C A5 5F         [ 3]  429         lda     X005F
   1E9E 10 30         [ 4]  430         bpl     L1ED0
   1EA0 AD 04 02      [ 4]  431         lda     U18_timer
   1EA3 49 FF         [ 2]  432         eor     #0xFF
   1EA5 4A            [ 2]  433         lsr     a
   1EA6 4A            [ 2]  434         lsr     a
   1EA7 4A            [ 2]  435         lsr     a
   1EA8 85 57         [ 3]  436         sta     X0057
   1EAA 90 02         [ 4]  437         bcc     L1EAE
   1EAC E6 57         [ 5]  438         inc     X0057
   1EAE                     439 L1EAE:
   1EAE A9 7A         [ 2]  440         lda     #0x7A
   1EB0 38            [ 2]  441         sec
   1EB1 E5 57         [ 3]  442         sbc     X0057
   1EB3 8D 15 02      [ 4]  443         sta     U18_timer_8T_DI
   1EB6 C6 50         [ 5]  444         dec     X0050
   1EB8 C6 51         [ 5]  445         dec     X0051
   1EBA C6 52         [ 5]  446         dec     X0052
   1EBC C6 53         [ 5]  447         dec     X0053
   1EBE D0 10         [ 4]  448         bne     L1ED0
   1EC0 A9 64         [ 2]  449         lda     #0x64
   1EC2 85 53         [ 3]  450         sta     X0053
   1EC4 C6 54         [ 5]  451         dec     X0054
   1EC6 C6 55         [ 5]  452         dec     X0055
   1EC8 D0 06         [ 4]  453         bne     L1ED0
   1ECA A9 64         [ 2]  454         lda     #0x64
   1ECC 85 55         [ 3]  455         sta     X0055
   1ECE C6 56         [ 5]  456         dec     X0056
   1ED0                     457 L1ED0:
   1ED0 60            [ 6]  458         rts
                            459 ;
   1ED1                     460 L1ED1:
   1ED1 A9 00         [ 2]  461         lda     #0x00
   1ED3 85 61         [ 3]  462         sta     X0061
   1ED5 85 62         [ 3]  463         sta     X0062
   1ED7 A9 0A         [ 2]  464         lda     #0x0A
   1ED9 85 54         [ 3]  465         sta     X0054
   1EDB A9 64         [ 2]  466         lda     #0x64
   1EDD 85 53         [ 3]  467         sta     X0053
   1EDF                     468 L1EDF:
   1EDF 20 8D 1E      [ 6]  469         jsr     L1E8D
   1EE2 A5 54         [ 3]  470         lda     X0054
   1EE4 D0 F9         [ 4]  471         bne     L1EDF
   1EE6 A9 0A         [ 2]  472         lda     #0x0A
   1EE8 85 54         [ 3]  473         sta     X0054
   1EEA A9 64         [ 2]  474         lda     #0x64
   1EEC 85 53         [ 3]  475         sta     X0053
   1EEE A5 62         [ 3]  476         lda     X0062
   1EF0 C9 08         [ 2]  477         cmp     #0x08
   1EF2 F0 15         [ 4]  478         beq     L1F09
   1EF4 E6 62         [ 5]  479         inc     X0062
   1EF6 A2 09         [ 2]  480         ldx     #0x09
   1EF8 38            [ 2]  481         sec
   1EF9 AD 80 03      [ 4]  482         lda     audio_periph$ddr_reg_a
   1EFC                     483 L1EFC:
   1EFC 2A            [ 2]  484         rol     a
   1EFD CA            [ 2]  485         dex
   1EFE 90 FC         [ 4]  486         bcc     L1EFC
   1F00 18            [ 2]  487         clc
   1F01 8A            [ 2]  488         txa
   1F02 65 61         [ 3]  489         adc     X0061
   1F04 85 61         [ 3]  490         sta     X0061
   1F06 4C DF 1E      [ 3]  491         jmp     L1EDF
                            492 ;
   1F09                     493 L1F09:
   1F09 46 61         [ 5]  494         lsr     X0061
   1F0B 46 61         [ 5]  495         lsr     X0061
   1F0D 46 61         [ 5]  496         lsr     X0061
   1F0F A5 61         [ 3]  497         lda     X0061
   1F11 85 60         [ 3]  498         sta     X0060
   1F13 A9 00         [ 2]  499         lda     #0x00
   1F15 85 61         [ 3]  500         sta     X0061
   1F17 85 62         [ 3]  501         sta     X0062
   1F19 60            [ 6]  502         rts
                            503 ;
   1F1A                     504 L1F1A:
   1F1A AD 80 02      [ 4]  505         lda     U19_PORTA
   1F1D 49 FF         [ 2]  506         eor     #0xFF
   1F1F 4A            [ 2]  507         lsr     a
   1F20 4A            [ 2]  508         lsr     a
   1F21 4A            [ 2]  509         lsr     a
   1F22 4A            [ 2]  510         lsr     a
   1F23 18            [ 2]  511         clc
   1F24 65 60         [ 3]  512         adc     X0060
   1F26 AA            [ 2]  513         tax
   1F27 BD 4D 1F      [ 5]  514         lda     X1F4D,x
   1F2A 85 63         [ 3]  515         sta     X0063
   1F2C A5 52         [ 3]  516         lda     X0052
   1F2E D0 16         [ 4]  517         bne     L1F46
   1F30 A9 0A         [ 2]  518         lda     #0x0A
   1F32 85 52         [ 3]  519         sta     X0052
   1F34 A5 63         [ 3]  520         lda     X0063
   1F36 CD 82 03      [ 4]  521         cmp     audio_periph$ddr_reg_b
   1F39 90 08         [ 4]  522         bcc     L1F43
   1F3B F0 09         [ 4]  523         beq     L1F46
   1F3D EE 82 03      [ 6]  524         inc     audio_periph$ddr_reg_b
   1F40 4C 46 1F      [ 3]  525         jmp     L1F46
                            526 ;
   1F43                     527 L1F43:
   1F43 CE 82 03      [ 6]  528         dec     audio_periph$ddr_reg_b
   1F46                     529 L1F46:
   1F46 AD 82 03      [ 4]  530         lda     audio_periph$ddr_reg_b
   1F49 8D 82 02      [ 4]  531         sta     U19_PORTB
   1F4C 60            [ 6]  532         rts
                            533 ;
   1F4D                     534 X1F4D:
   1F4D 03 04 06 08         535         .db     0x03, 0x04, 0x06, 0x08
   1F51 10 16 20 2D         536         .db     0x10, 0x16, 0x20, 0x2D
   1F55 40 5A 80 BF         537         .db     0x40, 0x5A, 0x80, 0xBF
   1F59 FF FF FF FF         538         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F5D FF                  539         .db     0xFF
                            540 ;
                            541 ; all zeros in this gap
                            542 ;
   1FFC                     543         .org    0x1FFC
                            544 ;
                            545 ; vectors
                            546 ;
   1FFC                     547 RESETVEC:
   1FFC 00 1C               548         .dw     RESET
   1FFE                     549 IRQVEC:
   1FFE 00 00               550         .dw     RAM_start
