                              1         .area   region1 (ABS)
                              2 
                              3 ;
                              4 ;       Pizza Time Theatre
                              5 ;       Dolli Dimples Program
                              6 ;       Version C ?
                              7 ;
                              8 ;       This image was recovered from a 2708 with a label "Dolli C 1C00"
                              9 ;
                     0000    10 X0000 = 0x0000
                     0002    11 X0002 = 0x0002
                     0008    12 X0008 = 0x0008
                     0050    13 X0050 = 0x0050
                     0051    14 X0051 = 0x0051
                     0052    15 X0052 = 0x0052
                     0053    16 X0053 = 0x0053
                     0054    17 X0054 = 0x0054
                     0055    18 X0055 = 0x0055
                     0056    19 X0056 = 0x0056
                     0057    20 X0057 = 0x0057
                     0058    21 X0058 = 0x0058
                     0059    22 X0059 = 0x0059
                     005A    23 X005A = 0x005A
                     005B    24 X005B = 0x005B
                     005C    25 X005C = 0x005C
                     005D    26 X005D = 0x005D
                     005E    27 X005E = 0x005E
                     005F    28 X005F = 0x005F
                     0060    29 X0060 = 0x0060
                     0061    30 X0061 = 0x0061
                     0062    31 X0062 = 0x0062
                     0063    32 X0063 = 0x0063
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
   1C09 95 00         [ 4]   46         sta     X0000,x
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
   1C4F 85 53         [ 3]   73         sta     X0053
   1C51 A9 2B         [ 2]   74         lda     #0x2B
   1C53 85 57         [ 3]   75         sta     X0057
   1C55 A9 10         [ 2]   76         lda     #0x10
   1C57 85 63         [ 3]   77         sta     X0063
   1C59 A9 10         [ 2]   78         lda     #0x10
   1C5B 20 1F 1D      [ 6]   79         jsr     L1D1F
   1C5E A9 28         [ 2]   80         lda     #0x28
   1C60 85 54         [ 3]   81         sta     X0054
   1C62                      82 L1C62:
   1C62 20 13 1E      [ 6]   83         jsr     L1E13
   1C65 A5 54         [ 3]   84         lda     X0054
   1C67 D0 F9         [ 4]   85         bne     L1C62
   1C69                      86 L1C69:
   1C69 A9 40         [ 2]   87         lda     #0x40
   1C6B 20 1F 1D      [ 6]   88         jsr     L1D1F
   1C6E                      89 L1C6E:
   1C6E 20 33 1D      [ 6]   90         jsr     L1D33
   1C71 A5 58         [ 3]   91         lda     X0058
   1C73 C9 60         [ 2]   92         cmp     #0x60
   1C75 90 F7         [ 4]   93         bcc     L1C6E
   1C77 A9 20         [ 2]   94         lda     #0x20
   1C79 20 1F 1D      [ 6]   95         jsr     L1D1F
   1C7C A9 19         [ 2]   96         lda     #0x19
   1C7E 85 54         [ 3]   97         sta     X0054
   1C80                      98 L1C80:
   1C80 20 13 1E      [ 6]   99         jsr     L1E13
   1C83 A5 54         [ 3]  100         lda     X0054
   1C85 D0 F9         [ 4]  101         bne     L1C80
   1C87 A9 00         [ 2]  102         lda     #0x00
   1C89 85 59         [ 3]  103         sta     X0059
   1C8B 20 33 1D      [ 6]  104         jsr     L1D33
   1C8E E6 59         [ 5]  105         inc     X0059
   1C90 A9 10         [ 2]  106         lda     #0x10
   1C92 20 1F 1D      [ 6]  107         jsr     L1D1F
   1C95 A9 80         [ 2]  108         lda     #0x80
   1C97 20 1F 1D      [ 6]  109         jsr     L1D1F
   1C9A 20 61 1D      [ 6]  110         jsr     L1D61
   1C9D A9 10         [ 2]  111         lda     #0x10
   1C9F 20 1F 1D      [ 6]  112         jsr     L1D1F
   1CA2 20 F9 1C      [ 6]  113         jsr     L1CF9
   1CA5                     114 L1CA5:
   1CA5 20 13 1E      [ 6]  115         jsr     L1E13
   1CA8 20 A0 1E      [ 6]  116         jsr     L1EA0
   1CAB A5 5A         [ 3]  117         lda     X005A
   1CAD D0 10         [ 4]  118         bne     L1CBF
   1CAF A9 02         [ 2]  119         lda     #0x02
   1CB1 8D 80 02      [ 4]  120         sta     U19_PORTA
   1CB4 A9 00         [ 2]  121         lda     #0x00
   1CB6 8D 02 02      [ 4]  122         sta     U18_PORTB
   1CB9 A5 57         [ 3]  123         lda     X0057
   1CBB D0 E8         [ 4]  124         bne     L1CA5
   1CBD E6 5A         [ 5]  125         inc     X005A
   1CBF                     126 L1CBF:
   1CBF 20 F9 1C      [ 6]  127         jsr     L1CF9
   1CC2 A9 00         [ 2]  128         lda     #0x00
   1CC4 8D 80 02      [ 4]  129         sta     U19_PORTA
   1CC7 A9 80         [ 2]  130         lda     #0x80
   1CC9 8D 02 02      [ 4]  131         sta     U18_PORTB
   1CCC A9 80         [ 2]  132         lda     #0x80
   1CCE 20 1F 1D      [ 6]  133         jsr     L1D1F
   1CD1 20 61 1D      [ 6]  134         jsr     L1D61
   1CD4 C6 5A         [ 5]  135         dec     X005A
   1CD6 20 87 1D      [ 6]  136         jsr     L1D87
   1CD9 20 F9 1C      [ 6]  137         jsr     L1CF9
   1CDC A9 2B         [ 2]  138         lda     #0x2B
   1CDE 85 57         [ 3]  139         sta     X0057
   1CE0 E6 59         [ 5]  140         inc     X0059
   1CE2 A5 59         [ 3]  141         lda     X0059
   1CE4 C9 1A         [ 2]  142         cmp     #0x1A
   1CE6 90 03         [ 4]  143         bcc     L1CEB
   1CE8 4C 69 1C      [ 3]  144         jmp     L1C69
                            145 ;
   1CEB                     146 L1CEB:
   1CEB 20 61 1D      [ 6]  147         jsr     L1D61
   1CEE A9 10         [ 2]  148         lda     #0x10
   1CF0 20 1F 1D      [ 6]  149         jsr     L1D1F
   1CF3 20 5F 1E      [ 6]  150         jsr     L1E5F
   1CF6 4C A5 1C      [ 3]  151         jmp     L1CA5
                            152 ;
   1CF9                     153 L1CF9:
   1CF9 A9 00         [ 2]  154         lda     #0x00
   1CFB A2 01         [ 2]  155         ldx     #0x01
   1CFD 20 16 1D      [ 6]  156         jsr     L1D16
   1D00 A9 FF         [ 2]  157         lda     #0xFF
   1D02 A2 00         [ 2]  158         ldx     #0x00
   1D04 20 16 1D      [ 6]  159         jsr     L1D16
   1D07 A9 34         [ 2]  160         lda     #0x34
   1D09 A2 01         [ 2]  161         ldx     #0x01
   1D0B 20 16 1D      [ 6]  162         jsr     L1D16
   1D0E A9 00         [ 2]  163         lda     #0x00
   1D10 A2 00         [ 2]  164         ldx     #0x00
   1D12 20 16 1D      [ 6]  165         jsr     L1D16
   1D15 60            [ 6]  166         rts
                            167 ;
   1D16                     168 L1D16:
   1D16 95 84         [ 4]  169         sta     board_2_periph$ddr_reg_a,x
   1D18 95 86         [ 4]  170         sta     board_2_periph$ddr_reg_b,x
   1D1A 95 88         [ 4]  171         sta     board_3_periph$ddr_reg_a,x
   1D1C 95 8A         [ 4]  172         sta     board_3_periph$ddr_reg_b,x
   1D1E 60            [ 6]  173         rts
                            174 ;
   1D1F                     175 L1D1F:
   1D1F 8D 02 03      [ 4]  176         sta     transport_periph$ddr_reg_b
   1D22 A9 FF         [ 2]  177         lda     #0xFF
   1D24 85 50         [ 3]  178         sta     X0050
   1D26                     179 L1D26:
   1D26 20 13 1E      [ 6]  180         jsr     L1E13
   1D29 A5 50         [ 3]  181         lda     X0050
   1D2B D0 F9         [ 4]  182         bne     L1D26
   1D2D A9 00         [ 2]  183         lda     #0x00
   1D2F 8D 02 03      [ 4]  184         sta     transport_periph$ddr_reg_b
   1D32 60            [ 6]  185         rts
                            186 ;
   1D33                     187 L1D33:
   1D33 A9 00         [ 2]  188         lda     #0x00
   1D35 85 58         [ 3]  189         sta     X0058
   1D37                     190 L1D37:
   1D37 20 13 1E      [ 6]  191         jsr     L1E13
   1D3A AD 03 03      [ 4]  192         lda     transport_control_reg_b
   1D3D 10 F8         [ 4]  193         bpl     L1D37
   1D3F A9 04         [ 2]  194         lda     #0x04
   1D41 85 54         [ 3]  195         sta     X0054
   1D43                     196 L1D43:
   1D43 20 13 1E      [ 6]  197         jsr     L1E13
   1D46 AD 03 03      [ 4]  198         lda     transport_control_reg_b
   1D49 10 0B         [ 4]  199         bpl     L1D56
   1D4B E6 58         [ 5]  200         inc     X0058
   1D4D AD 02 03      [ 4]  201         lda     transport_periph$ddr_reg_b
   1D50 A5 58         [ 3]  202         lda     X0058
   1D52 C9 60         [ 2]  203         cmp     #0x60
   1D54 B0 0A         [ 4]  204         bcs     L1D60
   1D56                     205 L1D56:
   1D56 A5 54         [ 3]  206         lda     X0054
   1D58 D0 E9         [ 4]  207         bne     L1D43
   1D5A A5 58         [ 3]  208         lda     X0058
   1D5C C9 20         [ 2]  209         cmp     #0x20
   1D5E 90 D3         [ 4]  210         bcc     L1D33
   1D60                     211 L1D60:
   1D60 60            [ 6]  212         rts
                            213 ;
   1D61                     214 L1D61:
   1D61 A9 FA         [ 2]  215         lda     #0xFA
   1D63 85 50         [ 3]  216         sta     X0050
   1D65                     217 L1D65:
   1D65 20 13 1E      [ 6]  218         jsr     L1E13
   1D68 A5 50         [ 3]  219         lda     X0050
   1D6A D0 F9         [ 4]  220         bne     L1D65
   1D6C                     221 L1D6C:
   1D6C 20 13 1E      [ 6]  222         jsr     L1E13
   1D6F AD 02 03      [ 4]  223         lda     transport_periph$ddr_reg_b
   1D72 6A            [ 2]  224         ror     a
   1D73 90 F7         [ 4]  225         bcc     L1D6C
   1D75 A9 A0         [ 2]  226         lda     #0xA0
   1D77 85 50         [ 3]  227         sta     X0050
   1D79                     228 L1D79:
   1D79 20 13 1E      [ 6]  229         jsr     L1E13
   1D7C AD 02 03      [ 4]  230         lda     transport_periph$ddr_reg_b
   1D7F 6A            [ 2]  231         ror     a
   1D80 90 EA         [ 4]  232         bcc     L1D6C
   1D82 A5 50         [ 3]  233         lda     X0050
   1D84 D0 F3         [ 4]  234         bne     L1D79
   1D86 60            [ 6]  235         rts
                            236 ;
   1D87                     237 L1D87:
   1D87 AD 00 03      [ 4]  238         lda     transport_periph$ddr_reg_a
   1D8A A9 40         [ 2]  239         lda     #0x40
   1D8C 85 86         [ 3]  240         sta     board_2_periph$ddr_reg_b
   1D8E 85 8A         [ 3]  241         sta     board_3_periph$ddr_reg_b
   1D90                     242 L1D90:
   1D90 AD 02 03      [ 4]  243         lda     transport_periph$ddr_reg_b
   1D93 4A            [ 2]  244         lsr     a
   1D94 90 11         [ 4]  245         bcc     L1DA7
   1D96 20 A0 1E      [ 6]  246         jsr     L1EA0
   1D99 20 13 1E      [ 6]  247         jsr     L1E13
   1D9C AD 01 03      [ 4]  248         lda     transport_control_reg_a
   1D9F 10 EF         [ 4]  249         bpl     L1D90
   1DA1 20 B9 1D      [ 6]  250         jsr     L1DB9
   1DA4 4C 90 1D      [ 3]  251         jmp     L1D90
                            252 ;
   1DA7                     253 L1DA7:
   1DA7 A9 64         [ 2]  254         lda     #0x64
   1DA9 85 50         [ 3]  255         sta     X0050
   1DAB                     256 L1DAB:
   1DAB 20 13 1E      [ 6]  257         jsr     L1E13
   1DAE AD 02 03      [ 4]  258         lda     transport_periph$ddr_reg_b
   1DB1 4A            [ 2]  259         lsr     a
   1DB2 B0 D3         [ 4]  260         bcs     L1D87
   1DB4 A5 50         [ 3]  261         lda     X0050
   1DB6 D0 F3         [ 4]  262         bne     L1DAB
   1DB8 60            [ 6]  263         rts
                            264 ;
   1DB9                     265 L1DB9:
   1DB9 AD 00 03      [ 4]  266         lda     transport_periph$ddr_reg_a
   1DBC 29 7F         [ 2]  267         and     #0x7F
   1DBE 85 5C         [ 3]  268         sta     X005C
   1DC0 29 7E         [ 2]  269         and     #0x7E
   1DC2 C9 22         [ 2]  270         cmp     #0x22
   1DC4 F0 38         [ 4]  271         beq     L1DFE
   1DC6 C9 36         [ 2]  272         cmp     #0x36
   1DC8 F0 34         [ 4]  273         beq     L1DFE
   1DCA A5 5C         [ 3]  274         lda     X005C
   1DCC 38            [ 2]  275         sec
   1DCD E9 41         [ 2]  276         sbc     #0x41
   1DCF A8            [ 2]  277         tay
   1DD0 30 30         [ 4]  278         bmi     L1E02
   1DD2 C9 10         [ 2]  279         cmp     #0x10
   1DD4 B0 2C         [ 4]  280         bcs     L1E02
   1DD6 A2 84         [ 2]  281         ldx     #0x84
   1DD8 C9 08         [ 2]  282         cmp     #0x08
   1DDA 90 08         [ 4]  283         bcc     L1DE4
   1DDC A2 88         [ 2]  284         ldx     #0x88
   1DDE C9 0E         [ 2]  285         cmp     #0x0E
   1DE0 90 02         [ 4]  286         bcc     L1DE4
   1DE2 A2 8A         [ 2]  287         ldx     #0x8A
   1DE4                     288 L1DE4:
   1DE4 B9 03 1E      [ 5]  289         lda     X1E03,y
   1DE7 85 5D         [ 3]  290         sta     X005D
   1DE9 A5 5E         [ 3]  291         lda     X005E
   1DEB 4A            [ 2]  292         lsr     a
   1DEC B0 09         [ 4]  293         bcs     L1DF7
   1DEE A5 5D         [ 3]  294         lda     X005D
   1DF0 49 FF         [ 2]  295         eor     #0xFF
   1DF2 35 00         [ 4]  296         and     X0000,x
   1DF4 95 00         [ 4]  297         sta     X0000,x
   1DF6 60            [ 6]  298         rts
                            299 ;
   1DF7                     300 L1DF7:
   1DF7 A5 5D         [ 3]  301         lda     X005D
   1DF9 15 00         [ 4]  302         ora     X0000,x
   1DFB 95 00         [ 4]  303         sta     X0000,x
   1DFD 60            [ 6]  304         rts
                            305 ;
   1DFE                     306 L1DFE:
   1DFE A5 5C         [ 3]  307         lda     X005C
   1E00 85 5E         [ 3]  308         sta     X005E
   1E02                     309 L1E02:
   1E02 60            [ 6]  310         rts
                            311 ;
   1E03                     312 X1E03:
   1E03 01 02 04 08         313         .db     0x01,0x02,0x04,0x08
   1E07 10 20 40 80         314         .db     0x10,0x20,0x40,0x80
   1E0B 01 02 04 08         315         .db     0x01,0x02,0x04,0x08
   1E0F 10 20 01 02         316         .db     0x10,0x20,0x01,0x02
                            317 ;
   1E13                     318 L1E13:
   1E13 AD 05 02      [ 4]  319         lda     U18_edge_detect_control_DI_pos
   1E16 85 5F         [ 3]  320         sta     X005F
   1E18 F0 44         [ 4]  321         beq     L1E5E
   1E1A A5 5B         [ 3]  322         lda     X005B
   1E1C 30 0E         [ 4]  323         bmi     L1E2C
   1E1E A5 5F         [ 3]  324         lda     X005F
   1E20 29 40         [ 2]  325         and     #0x40
   1E22 F0 16         [ 4]  326         beq     L1E3A
   1E24 A9 80         [ 2]  327         lda     #0x80
   1E26 85 5B         [ 3]  328         sta     X005B
   1E28 A9 FA         [ 2]  329         lda     #0xFA
   1E2A 85 51         [ 3]  330         sta     X0051
   1E2C                     331 L1E2C:
   1E2C A5 51         [ 3]  332         lda     X0051
   1E2E D0 06         [ 4]  333         bne     L1E36
   1E30 A9 00         [ 2]  334         lda     #0x00
   1E32 85 5B         [ 3]  335         sta     X005B
   1E34 E6 5A         [ 5]  336         inc     X005A
   1E36                     337 L1E36:
   1E36 A5 5F         [ 3]  338         lda     X005F
   1E38 10 24         [ 4]  339         bpl     L1E5E
   1E3A                     340 L1E3A:
   1E3A AD 04 02      [ 4]  341         lda     U18_timer
   1E3D A9 01         [ 2]  342         lda     #0x01
   1E3F 8D 17 02      [ 4]  343         sta     X0217
   1E42 C6 50         [ 5]  344         dec     X0050
   1E44 C6 51         [ 5]  345         dec     X0051
   1E46 C6 52         [ 5]  346         dec     X0052
   1E48 C6 53         [ 5]  347         dec     X0053
   1E4A D0 12         [ 4]  348         bne     L1E5E
   1E4C A9 64         [ 2]  349         lda     #0x64
   1E4E 85 53         [ 3]  350         sta     X0053
   1E50 C6 54         [ 5]  351         dec     X0054
   1E52 C6 55         [ 5]  352         dec     X0055
   1E54 C6 56         [ 5]  353         dec     X0056
   1E56 D0 06         [ 4]  354         bne     L1E5E
   1E58 A9 64         [ 2]  355         lda     #0x64
   1E5A 85 56         [ 3]  356         sta     X0056
   1E5C C6 57         [ 5]  357         dec     X0057
   1E5E                     358 L1E5E:
   1E5E 60            [ 6]  359         rts
                            360 ;
   1E5F                     361 L1E5F:
   1E5F A9 00         [ 2]  362         lda     #0x00
   1E61 85 61         [ 3]  363         sta     X0061
   1E63 85 62         [ 3]  364         sta     X0062
   1E65 A9 0A         [ 2]  365         lda     #0x0A
   1E67 85 54         [ 3]  366         sta     X0054
   1E69                     367 L1E69:
   1E69 20 13 1E      [ 6]  368         jsr     L1E13
   1E6C A5 54         [ 3]  369         lda     X0054
   1E6E D0 F9         [ 4]  370         bne     L1E69
   1E70 A9 0A         [ 2]  371         lda     #0x0A
   1E72 85 54         [ 3]  372         sta     X0054
   1E74 A5 62         [ 3]  373         lda     X0062
   1E76 C9 08         [ 2]  374         cmp     #0x08
   1E78 F0 15         [ 4]  375         beq     L1E8F
   1E7A E6 62         [ 5]  376         inc     X0062
   1E7C A2 09         [ 2]  377         ldx     #0x09
   1E7E 38            [ 2]  378         sec
   1E7F AD 80 03      [ 4]  379         lda     audio_periph$ddr_reg_a
   1E82                     380 L1E82:
   1E82 2A            [ 2]  381         rol     a
   1E83 CA            [ 2]  382         dex
   1E84 90 FC         [ 4]  383         bcc     L1E82
   1E86 18            [ 2]  384         clc
   1E87 8A            [ 2]  385         txa
   1E88 65 61         [ 3]  386         adc     X0061
   1E8A 85 61         [ 3]  387         sta     X0061
   1E8C 4C 69 1E      [ 3]  388         jmp     L1E69
                            389 ;
   1E8F                     390 L1E8F:
   1E8F 46 61         [ 5]  391         lsr     X0061
   1E91 46 61         [ 5]  392         lsr     X0061
   1E93 46 61         [ 5]  393         lsr     X0061
   1E95 A5 61         [ 3]  394         lda     X0061
   1E97 85 60         [ 3]  395         sta     X0060
   1E99 A9 00         [ 2]  396         lda     #0x00
   1E9B 85 61         [ 3]  397         sta     X0061
   1E9D 85 62         [ 3]  398         sta     X0062
   1E9F 60            [ 6]  399         rts
                            400 ;
   1EA0                     401 L1EA0:
   1EA0 AD 80 02      [ 4]  402         lda     U19_PORTA
   1EA3 49 FF         [ 2]  403         eor     #0xFF
   1EA5 4A            [ 2]  404         lsr     a
   1EA6 4A            [ 2]  405         lsr     a
   1EA7 4A            [ 2]  406         lsr     a
   1EA8 4A            [ 2]  407         lsr     a
   1EA9 18            [ 2]  408         clc
   1EAA 65 60         [ 3]  409         adc     X0060
   1EAC AA            [ 2]  410         tax
   1EAD BD D3 1E      [ 5]  411         lda     X1ED3,x
   1EB0 85 63         [ 3]  412         sta     X0063
   1EB2 A5 52         [ 3]  413         lda     X0052
   1EB4 D0 16         [ 4]  414         bne     L1ECC
   1EB6 A9 0A         [ 2]  415         lda     #0x0A
   1EB8 85 52         [ 3]  416         sta     X0052
   1EBA A5 63         [ 3]  417         lda     X0063
   1EBC CD 82 03      [ 4]  418         cmp     audio_periph$ddr_reg_b
   1EBF 90 08         [ 4]  419         bcc     L1EC9
   1EC1 F0 09         [ 4]  420         beq     L1ECC
   1EC3 EE 82 03      [ 6]  421         inc     audio_periph$ddr_reg_b
   1EC6 4C CC 1E      [ 3]  422         jmp     L1ECC
                            423 ;
   1EC9                     424 L1EC9:
   1EC9 CE 82 03      [ 6]  425         dec     audio_periph$ddr_reg_b
   1ECC                     426 L1ECC:
   1ECC AD 82 03      [ 4]  427         lda     audio_periph$ddr_reg_b
   1ECF 8D 82 02      [ 4]  428         sta     U19_PORTB
   1ED2 60            [ 6]  429         rts
                            430 ;
   1ED3                     431 X1ED3:
   1ED3 03 04 06 08         432         .db     0x03, 0x04, 0x06, 0x08
   1ED7 10 16 20 2D         433         .db     0x10, 0x16, 0x20, 0x2D
   1EDB 40 5A 80 BF         434         .db     0x40, 0x5A, 0x80, 0xBF
   1EDF FF FF FF FF         435         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1EE3 FF                  436         .db     0xFF
                            437 ;
                            438 ; all ff's in this gap
                            439 ;
   1FFC                     440         .org    0x1FFC
                            441 ;
                            442 ; vectors
                            443 ;
   1FFC                     444 RESETVEC:
   1FFC 00 1C               445         .dw     RESET
   1FFE                     446 IRQVEC:
   1FFE FF FF               447         .dw     0xFFFF
