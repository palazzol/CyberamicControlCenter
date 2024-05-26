                              1         .area   region1 (ABS)
                              2 
                              3 ;
                              4 ;       Pizza Time Theatre
                              5 ;       Dolli Dimples Program
                              6 ;       Version C ?
                              7 ;
                              8 ;       This image was recovered from a 2708 with a label "Dolli C 1C00"
                              9 ;
                     0002    10 RAM_02 = 0x0002
                     0008    11 RAM_08 = 0x0008
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
                             32 
                             33         .include "../include/ptt6502.def"
                              1 
                              2 ;
                              3 ; Peripheral Addresses for PTT 6502 system
                              4 ;
                              5 
                     0000     6 RAM_start                   = 0x0000
                              7 
                     0080     8 board_1_periph$ddr_reg_a    = 0x0080
                     0081     9 board_1_control_reg_a       = 0x0081
                     0082    10 board_1_periph$ddr_reg_b    = 0x0082
                     0083    11 board_1_control_reg_b       = 0x0083
                             12 
                     0084    13 board_2_periph$ddr_reg_a    = 0x0084
                     0085    14 board_2_control_reg_a       = 0x0085
                     0086    15 board_2_periph$ddr_reg_b    = 0x0086
                     0087    16 board_2_control_reg_b       = 0x0087
                             17 
                     0088    18 board_3_periph$ddr_reg_a    = 0x0088
                     0089    19 board_3_control_reg_a       = 0x0089
                     008A    20 board_3_periph$ddr_reg_b    = 0x008A
                     008B    21 board_3_control_reg_b       = 0x008B
                             22 
                     008C    23 board_4_periph$ddr_reg_a    = 0x008C
                     008D    24 board_4_control_reg_a       = 0x008D
                     008E    25 board_4_periph$ddr_reg_b    = 0x008E
                     008F    26 board_4_control_reg_b       = 0x008F
                             27 
                     0090    28 board_5_periph$ddr_reg_a    = 0x0090
                     0092    29 board_5_periph$ddr_reg_b    = 0x0092
                             30 
                     0094    31 board_6_periph$ddr_reg_a    = 0x0094
                             32 
                     0098    33 board_7_periph$ddr_reg_a    = 0x0098
                     009A    34 board_7_periph$ddr_reg_b    = 0x009A
                             35 
                     009C    36 board_8_periph$ddr_reg_a    = 0x009C
                     009E    37 board_8_periph$ddr_reg_b    = 0x009E
                             38 
                     0101    39 X0101                       = 0x0101
                     0102    40 X0102                       = 0x0102
                             41 
                     0200    42 U18_PORTA                   = 0x0200
                     0201    43 U18_DDRA                    = 0x0201
                     0202    44 U18_PORTB                   = 0x0202
                     0203    45 U18_DDRB                    = 0x0203
                             46 
                     0204    47 U18_timer                   = 0x0204
                     0204    48 U18_edge_detect_control_DI_neg = 0x0204
                     0205    49 U18_edge_detect_control_DI_pos = 0x0205
                     0206    50 U18_06                      = 0x0206    
                     0215    51 U18_timer_8T_DI             = 0x0215
                     0217    52 X0217 = 0x0217
                     021C    53 U18_1C                      = 0x021C    ; timer div by 1, enable interrupt
                     021D    54 U18_1D                      = 0x021D    ; timer div by 1, disable interrupt
                             55 
                     0280    56 U19_PORTA                   = 0x0280
                     0281    57 U19_DDRA                    = 0x0281
                     0282    58 U19_PORTB                   = 0x0282
                     0283    59 U19_DDRB                    = 0x0283
                     0285    60 U19_edge_detect_control_DI_pos  = 0x0285
                     0286    61 U19_86                      = 0x0286
                             62 
                     0300    63 transport_periph$ddr_reg_a  = 0x0300
                     0301    64 transport_control_reg_a     = 0x0301
                     0302    65 transport_periph$ddr_reg_b  = 0x0302
                     0303    66 transport_control_reg_b     = 0x0303
                             67 
                     0380    68 audio_periph$ddr_reg_a      = 0x0380
                     0381    69 audio_control_reg_a         = 0x0381
                     0382    70 audio_periph$ddr_reg_b      = 0x0382
                     0383    71 audio_control_reg_b         = 0x0383
                             72 
                             73 
                             74 
                             75 
                             76 
                             77 
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
   1C47 8D 83 03      [ 4]   69         sta     audio_control_reg_b
   1C4A 8D 81 03      [ 4]   70         sta     audio_control_reg_a
   1C4D A9 64         [ 2]   71         lda     #0x64
   1C4F 85 53         [ 3]   72         sta     RAM_53
   1C51 A9 2B         [ 2]   73         lda     #0x2B
   1C53 85 57         [ 3]   74         sta     RAM_57
   1C55 A9 10         [ 2]   75         lda     #0x10
   1C57 85 63         [ 3]   76         sta     RAM_63
   1C59 A9 10         [ 2]   77         lda     #0x10
   1C5B 20 1F 1D      [ 6]   78         jsr     L1D1F
   1C5E A9 28         [ 2]   79         lda     #0x28
   1C60 85 54         [ 3]   80         sta     RAM_54
   1C62                      81 L1C62:
   1C62 20 13 1E      [ 6]   82         jsr     L1E13
   1C65 A5 54         [ 3]   83         lda     RAM_54
   1C67 D0 F9         [ 4]   84         bne     L1C62
   1C69                      85 L1C69:
   1C69 A9 40         [ 2]   86         lda     #0x40
   1C6B 20 1F 1D      [ 6]   87         jsr     L1D1F
   1C6E                      88 L1C6E:
   1C6E 20 33 1D      [ 6]   89         jsr     L1D33
   1C71 A5 58         [ 3]   90         lda     RAM_58
   1C73 C9 60         [ 2]   91         cmp     #0x60
   1C75 90 F7         [ 4]   92         bcc     L1C6E
   1C77 A9 20         [ 2]   93         lda     #0x20
   1C79 20 1F 1D      [ 6]   94         jsr     L1D1F
   1C7C A9 19         [ 2]   95         lda     #0x19
   1C7E 85 54         [ 3]   96         sta     RAM_54
   1C80                      97 L1C80:
   1C80 20 13 1E      [ 6]   98         jsr     L1E13
   1C83 A5 54         [ 3]   99         lda     RAM_54
   1C85 D0 F9         [ 4]  100         bne     L1C80
   1C87 A9 00         [ 2]  101         lda     #0x00
   1C89 85 59         [ 3]  102         sta     RAM_59
   1C8B 20 33 1D      [ 6]  103         jsr     L1D33
   1C8E E6 59         [ 5]  104         inc     RAM_59
   1C90 A9 10         [ 2]  105         lda     #0x10
   1C92 20 1F 1D      [ 6]  106         jsr     L1D1F
   1C95 A9 80         [ 2]  107         lda     #0x80
   1C97 20 1F 1D      [ 6]  108         jsr     L1D1F
   1C9A 20 61 1D      [ 6]  109         jsr     L1D61
   1C9D A9 10         [ 2]  110         lda     #0x10
   1C9F 20 1F 1D      [ 6]  111         jsr     L1D1F
   1CA2 20 F9 1C      [ 6]  112         jsr     L1CF9
   1CA5                     113 L1CA5:
   1CA5 20 13 1E      [ 6]  114         jsr     L1E13
   1CA8 20 A0 1E      [ 6]  115         jsr     L1EA0
   1CAB A5 5A         [ 3]  116         lda     RAM_5A
   1CAD D0 10         [ 4]  117         bne     L1CBF
   1CAF A9 02         [ 2]  118         lda     #0x02
   1CB1 8D 80 02      [ 4]  119         sta     U19_PORTA
   1CB4 A9 00         [ 2]  120         lda     #0x00
   1CB6 8D 02 02      [ 4]  121         sta     U18_PORTB
   1CB9 A5 57         [ 3]  122         lda     RAM_57
   1CBB D0 E8         [ 4]  123         bne     L1CA5
   1CBD E6 5A         [ 5]  124         inc     RAM_5A
   1CBF                     125 L1CBF:
   1CBF 20 F9 1C      [ 6]  126         jsr     L1CF9
   1CC2 A9 00         [ 2]  127         lda     #0x00
   1CC4 8D 80 02      [ 4]  128         sta     U19_PORTA
   1CC7 A9 80         [ 2]  129         lda     #0x80
   1CC9 8D 02 02      [ 4]  130         sta     U18_PORTB
   1CCC A9 80         [ 2]  131         lda     #0x80
   1CCE 20 1F 1D      [ 6]  132         jsr     L1D1F
   1CD1 20 61 1D      [ 6]  133         jsr     L1D61
   1CD4 C6 5A         [ 5]  134         dec     RAM_5A
   1CD6 20 87 1D      [ 6]  135         jsr     L1D87
   1CD9 20 F9 1C      [ 6]  136         jsr     L1CF9
   1CDC A9 2B         [ 2]  137         lda     #0x2B
   1CDE 85 57         [ 3]  138         sta     RAM_57
   1CE0 E6 59         [ 5]  139         inc     RAM_59
   1CE2 A5 59         [ 3]  140         lda     RAM_59
   1CE4 C9 1A         [ 2]  141         cmp     #0x1A
   1CE6 90 03         [ 4]  142         bcc     L1CEB
   1CE8 4C 69 1C      [ 3]  143         jmp     L1C69
                            144 ;
   1CEB                     145 L1CEB:
   1CEB 20 61 1D      [ 6]  146         jsr     L1D61
   1CEE A9 10         [ 2]  147         lda     #0x10
   1CF0 20 1F 1D      [ 6]  148         jsr     L1D1F
   1CF3 20 5F 1E      [ 6]  149         jsr     L1E5F
   1CF6 4C A5 1C      [ 3]  150         jmp     L1CA5
                            151 ;
   1CF9                     152 L1CF9:
   1CF9 A9 00         [ 2]  153         lda     #0x00
   1CFB A2 01         [ 2]  154         ldx     #0x01
   1CFD 20 16 1D      [ 6]  155         jsr     L1D16
   1D00 A9 FF         [ 2]  156         lda     #0xFF
   1D02 A2 00         [ 2]  157         ldx     #0x00
   1D04 20 16 1D      [ 6]  158         jsr     L1D16
   1D07 A9 34         [ 2]  159         lda     #0x34
   1D09 A2 01         [ 2]  160         ldx     #0x01
   1D0B 20 16 1D      [ 6]  161         jsr     L1D16
   1D0E A9 00         [ 2]  162         lda     #0x00
   1D10 A2 00         [ 2]  163         ldx     #0x00
   1D12 20 16 1D      [ 6]  164         jsr     L1D16
   1D15 60            [ 6]  165         rts
                            166 ;
   1D16                     167 L1D16:
   1D16 95 84         [ 4]  168         sta     board_2_periph$ddr_reg_a,x
   1D18 95 86         [ 4]  169         sta     board_2_periph$ddr_reg_b,x
   1D1A 95 88         [ 4]  170         sta     board_3_periph$ddr_reg_a,x
   1D1C 95 8A         [ 4]  171         sta     board_3_periph$ddr_reg_b,x
   1D1E 60            [ 6]  172         rts
                            173 ;
   1D1F                     174 L1D1F:
   1D1F 8D 02 03      [ 4]  175         sta     transport_periph$ddr_reg_b
   1D22 A9 FF         [ 2]  176         lda     #0xFF
   1D24 85 50         [ 3]  177         sta     RAM_50
   1D26                     178 L1D26:
   1D26 20 13 1E      [ 6]  179         jsr     L1E13
   1D29 A5 50         [ 3]  180         lda     RAM_50
   1D2B D0 F9         [ 4]  181         bne     L1D26
   1D2D A9 00         [ 2]  182         lda     #0x00
   1D2F 8D 02 03      [ 4]  183         sta     transport_periph$ddr_reg_b
   1D32 60            [ 6]  184         rts
                            185 ;
   1D33                     186 L1D33:
   1D33 A9 00         [ 2]  187         lda     #0x00
   1D35 85 58         [ 3]  188         sta     RAM_58
   1D37                     189 L1D37:
   1D37 20 13 1E      [ 6]  190         jsr     L1E13
   1D3A AD 03 03      [ 4]  191         lda     transport_control_reg_b
   1D3D 10 F8         [ 4]  192         bpl     L1D37
   1D3F A9 04         [ 2]  193         lda     #0x04
   1D41 85 54         [ 3]  194         sta     RAM_54
   1D43                     195 L1D43:
   1D43 20 13 1E      [ 6]  196         jsr     L1E13
   1D46 AD 03 03      [ 4]  197         lda     transport_control_reg_b
   1D49 10 0B         [ 4]  198         bpl     L1D56
   1D4B E6 58         [ 5]  199         inc     RAM_58
   1D4D AD 02 03      [ 4]  200         lda     transport_periph$ddr_reg_b
   1D50 A5 58         [ 3]  201         lda     RAM_58
   1D52 C9 60         [ 2]  202         cmp     #0x60
   1D54 B0 0A         [ 4]  203         bcs     L1D60
   1D56                     204 L1D56:
   1D56 A5 54         [ 3]  205         lda     RAM_54
   1D58 D0 E9         [ 4]  206         bne     L1D43
   1D5A A5 58         [ 3]  207         lda     RAM_58
   1D5C C9 20         [ 2]  208         cmp     #0x20
   1D5E 90 D3         [ 4]  209         bcc     L1D33
   1D60                     210 L1D60:
   1D60 60            [ 6]  211         rts
                            212 ;
   1D61                     213 L1D61:
   1D61 A9 FA         [ 2]  214         lda     #0xFA
   1D63 85 50         [ 3]  215         sta     RAM_50
   1D65                     216 L1D65:
   1D65 20 13 1E      [ 6]  217         jsr     L1E13
   1D68 A5 50         [ 3]  218         lda     RAM_50
   1D6A D0 F9         [ 4]  219         bne     L1D65
   1D6C                     220 L1D6C:
   1D6C 20 13 1E      [ 6]  221         jsr     L1E13
   1D6F AD 02 03      [ 4]  222         lda     transport_periph$ddr_reg_b
   1D72 6A            [ 2]  223         ror     a
   1D73 90 F7         [ 4]  224         bcc     L1D6C
   1D75 A9 A0         [ 2]  225         lda     #0xA0
   1D77 85 50         [ 3]  226         sta     RAM_50
   1D79                     227 L1D79:
   1D79 20 13 1E      [ 6]  228         jsr     L1E13
   1D7C AD 02 03      [ 4]  229         lda     transport_periph$ddr_reg_b
   1D7F 6A            [ 2]  230         ror     a
   1D80 90 EA         [ 4]  231         bcc     L1D6C
   1D82 A5 50         [ 3]  232         lda     RAM_50
   1D84 D0 F3         [ 4]  233         bne     L1D79
   1D86 60            [ 6]  234         rts
                            235 ;
   1D87                     236 L1D87:
   1D87 AD 00 03      [ 4]  237         lda     transport_periph$ddr_reg_a
   1D8A A9 40         [ 2]  238         lda     #0x40
   1D8C 85 86         [ 3]  239         sta     board_2_periph$ddr_reg_b
   1D8E 85 8A         [ 3]  240         sta     board_3_periph$ddr_reg_b
   1D90                     241 L1D90:
   1D90 AD 02 03      [ 4]  242         lda     transport_periph$ddr_reg_b
   1D93 4A            [ 2]  243         lsr     a
   1D94 90 11         [ 4]  244         bcc     L1DA7
   1D96 20 A0 1E      [ 6]  245         jsr     L1EA0
   1D99 20 13 1E      [ 6]  246         jsr     L1E13
   1D9C AD 01 03      [ 4]  247         lda     transport_control_reg_a
   1D9F 10 EF         [ 4]  248         bpl     L1D90
   1DA1 20 B9 1D      [ 6]  249         jsr     L1DB9
   1DA4 4C 90 1D      [ 3]  250         jmp     L1D90
                            251 ;
   1DA7                     252 L1DA7:
   1DA7 A9 64         [ 2]  253         lda     #0x64
   1DA9 85 50         [ 3]  254         sta     RAM_50
   1DAB                     255 L1DAB:
   1DAB 20 13 1E      [ 6]  256         jsr     L1E13
   1DAE AD 02 03      [ 4]  257         lda     transport_periph$ddr_reg_b
   1DB1 4A            [ 2]  258         lsr     a
   1DB2 B0 D3         [ 4]  259         bcs     L1D87
   1DB4 A5 50         [ 3]  260         lda     RAM_50
   1DB6 D0 F3         [ 4]  261         bne     L1DAB
   1DB8 60            [ 6]  262         rts
                            263 ;
   1DB9                     264 L1DB9:
   1DB9 AD 00 03      [ 4]  265         lda     transport_periph$ddr_reg_a
   1DBC 29 7F         [ 2]  266         and     #0x7F
   1DBE 85 5C         [ 3]  267         sta     RAM_5C
   1DC0 29 7E         [ 2]  268         and     #0x7E
   1DC2 C9 22         [ 2]  269         cmp     #0x22
   1DC4 F0 38         [ 4]  270         beq     L1DFE
   1DC6 C9 36         [ 2]  271         cmp     #0x36
   1DC8 F0 34         [ 4]  272         beq     L1DFE
   1DCA A5 5C         [ 3]  273         lda     RAM_5C
   1DCC 38            [ 2]  274         sec
   1DCD E9 41         [ 2]  275         sbc     #0x41
   1DCF A8            [ 2]  276         tay
   1DD0 30 30         [ 4]  277         bmi     L1E02
   1DD2 C9 10         [ 2]  278         cmp     #0x10
   1DD4 B0 2C         [ 4]  279         bcs     L1E02
   1DD6 A2 84         [ 2]  280         ldx     #0x84
   1DD8 C9 08         [ 2]  281         cmp     #0x08
   1DDA 90 08         [ 4]  282         bcc     L1DE4
   1DDC A2 88         [ 2]  283         ldx     #0x88
   1DDE C9 0E         [ 2]  284         cmp     #0x0E
   1DE0 90 02         [ 4]  285         bcc     L1DE4
   1DE2 A2 8A         [ 2]  286         ldx     #0x8A
   1DE4                     287 L1DE4:
   1DE4 B9 03 1E      [ 5]  288         lda     X1E03,y
   1DE7 85 5D         [ 3]  289         sta     RAM_5D
   1DE9 A5 5E         [ 3]  290         lda     RAM_5E
   1DEB 4A            [ 2]  291         lsr     a
   1DEC B0 09         [ 4]  292         bcs     L1DF7
   1DEE A5 5D         [ 3]  293         lda     RAM_5D
   1DF0 49 FF         [ 2]  294         eor     #0xFF
   1DF2 35 00         [ 4]  295         and     RAM_start,x
   1DF4 95 00         [ 4]  296         sta     RAM_start,x
   1DF6 60            [ 6]  297         rts
                            298 ;
   1DF7                     299 L1DF7:
   1DF7 A5 5D         [ 3]  300         lda     RAM_5D
   1DF9 15 00         [ 4]  301         ora     RAM_start,x
   1DFB 95 00         [ 4]  302         sta     RAM_start,x
   1DFD 60            [ 6]  303         rts
                            304 ;
   1DFE                     305 L1DFE:
   1DFE A5 5C         [ 3]  306         lda     RAM_5C
   1E00 85 5E         [ 3]  307         sta     RAM_5E
   1E02                     308 L1E02:
   1E02 60            [ 6]  309         rts
                            310 ;
   1E03                     311 X1E03:
   1E03 01 02 04 08         312         .db     0x01,0x02,0x04,0x08
   1E07 10 20 40 80         313         .db     0x10,0x20,0x40,0x80
   1E0B 01 02 04 08         314         .db     0x01,0x02,0x04,0x08
   1E0F 10 20 01 02         315         .db     0x10,0x20,0x01,0x02
                            316 ;
   1E13                     317 L1E13:
   1E13 AD 05 02      [ 4]  318         lda     U18_edge_detect_control_DI_pos
   1E16 85 5F         [ 3]  319         sta     RAM_5F
   1E18 F0 44         [ 4]  320         beq     L1E5E
   1E1A A5 5B         [ 3]  321         lda     RAM_5B
   1E1C 30 0E         [ 4]  322         bmi     L1E2C
   1E1E A5 5F         [ 3]  323         lda     RAM_5F
   1E20 29 40         [ 2]  324         and     #0x40
   1E22 F0 16         [ 4]  325         beq     L1E3A
   1E24 A9 80         [ 2]  326         lda     #0x80
   1E26 85 5B         [ 3]  327         sta     RAM_5B
   1E28 A9 FA         [ 2]  328         lda     #0xFA
   1E2A 85 51         [ 3]  329         sta     RAM_51
   1E2C                     330 L1E2C:
   1E2C A5 51         [ 3]  331         lda     RAM_51
   1E2E D0 06         [ 4]  332         bne     L1E36
   1E30 A9 00         [ 2]  333         lda     #0x00
   1E32 85 5B         [ 3]  334         sta     RAM_5B
   1E34 E6 5A         [ 5]  335         inc     RAM_5A
   1E36                     336 L1E36:
   1E36 A5 5F         [ 3]  337         lda     RAM_5F
   1E38 10 24         [ 4]  338         bpl     L1E5E
   1E3A                     339 L1E3A:
   1E3A AD 04 02      [ 4]  340         lda     U18_timer
   1E3D A9 01         [ 2]  341         lda     #0x01
   1E3F 8D 17 02      [ 4]  342         sta     X0217
   1E42 C6 50         [ 5]  343         dec     RAM_50
   1E44 C6 51         [ 5]  344         dec     RAM_51
   1E46 C6 52         [ 5]  345         dec     RAM_52
   1E48 C6 53         [ 5]  346         dec     RAM_53
   1E4A D0 12         [ 4]  347         bne     L1E5E
   1E4C A9 64         [ 2]  348         lda     #0x64
   1E4E 85 53         [ 3]  349         sta     RAM_53
   1E50 C6 54         [ 5]  350         dec     RAM_54
   1E52 C6 55         [ 5]  351         dec     RAM_55
   1E54 C6 56         [ 5]  352         dec     RAM_56
   1E56 D0 06         [ 4]  353         bne     L1E5E
   1E58 A9 64         [ 2]  354         lda     #0x64
   1E5A 85 56         [ 3]  355         sta     RAM_56
   1E5C C6 57         [ 5]  356         dec     RAM_57
   1E5E                     357 L1E5E:
   1E5E 60            [ 6]  358         rts
                            359 ;
   1E5F                     360 L1E5F:
   1E5F A9 00         [ 2]  361         lda     #0x00
   1E61 85 61         [ 3]  362         sta     RAM_61
   1E63 85 62         [ 3]  363         sta     RAM_62
   1E65 A9 0A         [ 2]  364         lda     #0x0A
   1E67 85 54         [ 3]  365         sta     RAM_54
   1E69                     366 L1E69:
   1E69 20 13 1E      [ 6]  367         jsr     L1E13
   1E6C A5 54         [ 3]  368         lda     RAM_54
   1E6E D0 F9         [ 4]  369         bne     L1E69
   1E70 A9 0A         [ 2]  370         lda     #0x0A
   1E72 85 54         [ 3]  371         sta     RAM_54
   1E74 A5 62         [ 3]  372         lda     RAM_62
   1E76 C9 08         [ 2]  373         cmp     #0x08
   1E78 F0 15         [ 4]  374         beq     L1E8F
   1E7A E6 62         [ 5]  375         inc     RAM_62
   1E7C A2 09         [ 2]  376         ldx     #0x09
   1E7E 38            [ 2]  377         sec
   1E7F AD 80 03      [ 4]  378         lda     audio_periph$ddr_reg_a
   1E82                     379 L1E82:
   1E82 2A            [ 2]  380         rol     a
   1E83 CA            [ 2]  381         dex
   1E84 90 FC         [ 4]  382         bcc     L1E82
   1E86 18            [ 2]  383         clc
   1E87 8A            [ 2]  384         txa
   1E88 65 61         [ 3]  385         adc     RAM_61
   1E8A 85 61         [ 3]  386         sta     RAM_61
   1E8C 4C 69 1E      [ 3]  387         jmp     L1E69
                            388 ;
   1E8F                     389 L1E8F:
   1E8F 46 61         [ 5]  390         lsr     RAM_61
   1E91 46 61         [ 5]  391         lsr     RAM_61
   1E93 46 61         [ 5]  392         lsr     RAM_61
   1E95 A5 61         [ 3]  393         lda     RAM_61
   1E97 85 60         [ 3]  394         sta     RAM_60
   1E99 A9 00         [ 2]  395         lda     #0x00
   1E9B 85 61         [ 3]  396         sta     RAM_61
   1E9D 85 62         [ 3]  397         sta     RAM_62
   1E9F 60            [ 6]  398         rts
                            399 ;
   1EA0                     400 L1EA0:
   1EA0 AD 80 02      [ 4]  401         lda     U19_PORTA
   1EA3 49 FF         [ 2]  402         eor     #0xFF
   1EA5 4A            [ 2]  403         lsr     a
   1EA6 4A            [ 2]  404         lsr     a
   1EA7 4A            [ 2]  405         lsr     a
   1EA8 4A            [ 2]  406         lsr     a
   1EA9 18            [ 2]  407         clc
   1EAA 65 60         [ 3]  408         adc     RAM_60
   1EAC AA            [ 2]  409         tax
   1EAD BD D3 1E      [ 5]  410         lda     X1ED3,x
   1EB0 85 63         [ 3]  411         sta     RAM_63
   1EB2 A5 52         [ 3]  412         lda     RAM_52
   1EB4 D0 16         [ 4]  413         bne     L1ECC
   1EB6 A9 0A         [ 2]  414         lda     #0x0A
   1EB8 85 52         [ 3]  415         sta     RAM_52
   1EBA A5 63         [ 3]  416         lda     RAM_63
   1EBC CD 82 03      [ 4]  417         cmp     audio_periph$ddr_reg_b
   1EBF 90 08         [ 4]  418         bcc     L1EC9
   1EC1 F0 09         [ 4]  419         beq     L1ECC
   1EC3 EE 82 03      [ 6]  420         inc     audio_periph$ddr_reg_b
   1EC6 4C CC 1E      [ 3]  421         jmp     L1ECC
                            422 ;
   1EC9                     423 L1EC9:
   1EC9 CE 82 03      [ 6]  424         dec     audio_periph$ddr_reg_b
   1ECC                     425 L1ECC:
   1ECC AD 82 03      [ 4]  426         lda     audio_periph$ddr_reg_b
   1ECF 8D 82 02      [ 4]  427         sta     U19_PORTB
   1ED2 60            [ 6]  428         rts
                            429 ;
   1ED3                     430 X1ED3:
   1ED3 03 04 06 08         431         .db     0x03, 0x04, 0x06, 0x08
   1ED7 10 16 20 2D         432         .db     0x10, 0x16, 0x20, 0x2D
   1EDB 40 5A 80 BF         433         .db     0x40, 0x5A, 0x80, 0xBF
   1EDF FF FF FF FF         434         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1EE3 FF                  435         .db     0xFF
                            436 ;
                            437 ; all ff's in this gap
                            438 ;
   1FFC                     439         .org    0x1FFC
                            440 ;
                            441 ; vectors
                            442 ;
   1FFC                     443 RESETVEC:
   1FFC 00 1C               444         .dw     RESET
   1FFE                     445 IRQVEC:
   1FFE FF FF               446         .dw     0xFFFF
