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
                     0002    11 RAM_02 = 0x0002
                     0008    12 RAM_08 = 0x0008
                     0050    13 RAM_50 = 0x0050
                     0051    14 RAM_51 = 0x0051
                     0052    15 RAM_52 = 0x0052
                     0053    16 RAM_53 = 0x0053
                     0054    17 RAM_54 = 0x0054
                     0055    18 RAM_55 = 0x0055
                     0056    19 RAM_56 = 0x0056
                     0057    20 RAM_57 = 0x0057
                     0058    21 RAM_58 = 0x0058
                     0059    22 RAM_59 = 0x0059
                     005A    23 RAM_5A = 0x005A
                             24 
                     005C    25 RAM_5C = 0x005C
                     005D    26 RAM_5D = 0x005D
                     005E    27 RAM_5E = 0x005E
                     005F    28 RAM_5F = 0x005F
                     0060    29 RAM_60 = 0x0060
                     0061    30 RAM_61 = 0x0061
                     0062    31 RAM_62 = 0x0062
                     0063    32 RAM_63 = 0x0063
                     0064    33 RAM_64 = 0x0064
                             34 
                             35         .include "../include/ptt6502.def"
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
                             36 
   1C00                      37         .org    0x1C00
                             38 ;
   1C00                      39 RESET:
   1C00 D8            [ 2]   40         cld
   1C01 78            [ 2]   41         sei
   1C02 A2 F0         [ 2]   42         ldx     #0xF0
   1C04 9A            [ 2]   43         txs
   1C05 A9 00         [ 2]   44         lda     #0x00
   1C07 A2 10         [ 2]   45         ldx     #0x10
   1C09                      46 L1C09:
   1C09 95 00         [ 4]   47         sta     RAM_start,x
   1C0B E8            [ 2]   48         inx
   1C0C E0 80         [ 2]   49         cpx     #0x80
   1C0E D0 F9         [ 4]   50         bne     L1C09
   1C10 A9 00         [ 2]   51         lda     #0x00
   1C12 8D 01 03      [ 4]   52         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   53         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   54         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   55         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   56         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   57         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   58         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   59         sta     U18_DDRA
   1C2A A9 02         [ 2]   60         lda     #0x02
   1C2C 8D 81 02      [ 4]   61         sta     U19_DDRA
   1C2F A9 FF         [ 2]   62         lda     #0xFF
   1C31 8D 82 03      [ 4]   63         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   64         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   65         sta     U19_DDRB
   1C3A A9 FC         [ 2]   66         lda     #0xFC
   1C3C 8D 02 03      [ 4]   67         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   68         lda     #0x2E
   1C41 8D 01 03      [ 4]   69         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]   70         sta     transport_control_reg_b
   1C47 A9 3C         [ 2]   71         lda     #0x3C
   1C49 8D 81 03      [ 4]   72         sta     audio_control_reg_a
   1C4C 8D 83 03      [ 4]   73         sta     audio_control_reg_b
   1C4F A9 64         [ 2]   74         lda     #0x64
   1C51 85 53         [ 3]   75         sta     RAM_53
   1C53 A9 1E         [ 2]   76         lda     #0x1E
   1C55 85 56         [ 3]   77         sta     RAM_56
   1C57 A9 64         [ 2]   78         lda     #0x64
   1C59 85 55         [ 3]   79         sta     RAM_55
   1C5B A9 10         [ 2]   80         lda     #0x10
   1C5D 85 63         [ 3]   81         sta     RAM_63
   1C5F A9 10         [ 2]   82         lda     #0x10
   1C61 20 7C 1D      [ 6]   83         jsr     L1D7C
   1C64 A9 28         [ 2]   84         lda     #0x28
   1C66 85 54         [ 3]   85         sta     RAM_54
   1C68 A9 64         [ 2]   86         lda     #0x64
   1C6A 85 53         [ 3]   87         sta     RAM_53
   1C6C                      88 L1C6C:
   1C6C 20 8D 1E      [ 6]   89         jsr     L1E8D
   1C6F A5 54         [ 3]   90         lda     RAM_54
   1C71 D0 F9         [ 4]   91         bne     L1C6C
   1C73                      92 L1C73:
   1C73 A9 40         [ 2]   93         lda     #0x40
   1C75 20 7C 1D      [ 6]   94         jsr     L1D7C
   1C78                      95 L1C78:
   1C78 A9 00         [ 2]   96         lda     #0x00
   1C7A 85 58         [ 3]   97         sta     RAM_58
   1C7C                      98 L1C7C:
   1C7C 20 8D 1E      [ 6]   99         jsr     L1E8D
   1C7F AD 03 03      [ 4]  100         lda     transport_control_reg_b
   1C82 10 F8         [ 4]  101         bpl     L1C7C
   1C84 A9 06         [ 2]  102         lda     #0x06
   1C86 85 54         [ 3]  103         sta     RAM_54
   1C88 A9 64         [ 2]  104         lda     #0x64
   1C8A 85 53         [ 3]  105         sta     RAM_53
   1C8C                     106 L1C8C:
   1C8C 20 8D 1E      [ 6]  107         jsr     L1E8D
   1C8F AD 03 03      [ 4]  108         lda     transport_control_reg_b
   1C92 10 0B         [ 4]  109         bpl     L1C9F
   1C94 E6 58         [ 5]  110         inc     RAM_58
   1C96 AD 02 03      [ 4]  111         lda     transport_periph$ddr_reg_b
   1C99 A5 58         [ 3]  112         lda     RAM_58
   1C9B C9 64         [ 2]  113         cmp     #0x64
   1C9D B0 0B         [ 4]  114         bcs     L1CAA
   1C9F                     115 L1C9F:
   1C9F A5 54         [ 3]  116         lda     RAM_54
   1CA1 D0 E9         [ 4]  117         bne     L1C8C
   1CA3 4C 78 1C      [ 3]  118         jmp     L1C78
                            119 ;
   1CA6 C9 60         [ 2]  120         cmp     #0x60
   1CA8 90 00         [ 4]  121         bcc     L1CAA
   1CAA                     122 L1CAA:
   1CAA A9 20         [ 2]  123         lda     #0x20
   1CAC 20 7C 1D      [ 6]  124         jsr     L1D7C
   1CAF A9 19         [ 2]  125         lda     #0x19
   1CB1 85 54         [ 3]  126         sta     RAM_54
   1CB3 A9 64         [ 2]  127         lda     #0x64
   1CB5 85 53         [ 3]  128         sta     RAM_53
   1CB7                     129 L1CB7:
   1CB7 20 8D 1E      [ 6]  130         jsr     L1E8D
   1CBA A5 54         [ 3]  131         lda     RAM_54
   1CBC D0 F9         [ 4]  132         bne     L1CB7
   1CBE A9 00         [ 2]  133         lda     #0x00
   1CC0 85 59         [ 3]  134         sta     RAM_59
   1CC2 20 97 1D      [ 6]  135         jsr     L1D97
   1CC5 A9 40         [ 2]  136         lda     #0x40
   1CC7 20 7C 1D      [ 6]  137         jsr     L1D7C
   1CCA 20 97 1D      [ 6]  138         jsr     L1D97
   1CCD A9 FA         [ 2]  139         lda     #0xFA
   1CCF 85 50         [ 3]  140         sta     RAM_50
   1CD1                     141 L1CD1:
   1CD1 20 8D 1E      [ 6]  142         jsr     L1E8D
   1CD4 A5 50         [ 3]  143         lda     RAM_50
   1CD6 D0 F9         [ 4]  144         bne     L1CD1
   1CD8 A9 20         [ 2]  145         lda     #0x20
   1CDA 20 7C 1D      [ 6]  146         jsr     L1D7C
   1CDD 20 97 1D      [ 6]  147         jsr     L1D97
   1CE0 E6 59         [ 5]  148         inc     RAM_59
   1CE2 A9 10         [ 2]  149         lda     #0x10
   1CE4 20 7C 1D      [ 6]  150         jsr     L1D7C
   1CE7 A9 80         [ 2]  151         lda     #0x80
   1CE9 20 7C 1D      [ 6]  152         jsr     L1D7C
   1CEC 20 BA 1D      [ 6]  153         jsr     L1DBA
   1CEF A9 10         [ 2]  154         lda     #0x10
   1CF1 20 7C 1D      [ 6]  155         jsr     L1D7C
   1CF4 20 4F 1D      [ 6]  156         jsr     L1D4F
   1CF7                     157 L1CF7:
   1CF7 20 8D 1E      [ 6]  158         jsr     L1E8D
   1CFA 20 1A 1F      [ 6]  159         jsr     L1F1A
   1CFD A5 5A         [ 3]  160         lda     RAM_5A
   1CFF D0 10         [ 4]  161         bne     L1D11
   1D01 A9 02         [ 2]  162         lda     #0x02
   1D03 8D 80 02      [ 4]  163         sta     U19_PORTA
   1D06 A9 00         [ 2]  164         lda     #0x00
   1D08 8D 02 02      [ 4]  165         sta     U18_PORTB
   1D0B A5 56         [ 3]  166         lda     RAM_56
   1D0D D0 E8         [ 4]  167         bne     L1CF7
   1D0F E6 5A         [ 5]  168         inc     RAM_5A
   1D11                     169 L1D11:
   1D11 20 4F 1D      [ 6]  170         jsr     L1D4F
   1D14 A9 00         [ 2]  171         lda     #0x00
   1D16 8D 80 02      [ 4]  172         sta     U19_PORTA
   1D19 A9 80         [ 2]  173         lda     #0x80
   1D1B 8D 02 02      [ 4]  174         sta     U18_PORTB
   1D1E A9 80         [ 2]  175         lda     #0x80
   1D20 20 7C 1D      [ 6]  176         jsr     L1D7C
   1D23 20 BA 1D      [ 6]  177         jsr     L1DBA
   1D26 C6 5A         [ 5]  178         dec     RAM_5A
   1D28 20 E0 1D      [ 6]  179         jsr     L1DE0
   1D2B 20 4F 1D      [ 6]  180         jsr     L1D4F
   1D2E A9 1E         [ 2]  181         lda     #0x1E
   1D30 85 56         [ 3]  182         sta     RAM_56
   1D32 A9 64         [ 2]  183         lda     #0x64
   1D34 85 55         [ 3]  184         sta     RAM_55
   1D36 E6 59         [ 5]  185         inc     RAM_59
   1D38 A5 59         [ 3]  186         lda     RAM_59
   1D3A C9 1A         [ 2]  187         cmp     #0x1A
   1D3C 90 03         [ 4]  188         bcc     L1D41
   1D3E 4C 73 1C      [ 3]  189         jmp     L1C73
                            190 ;
   1D41                     191 L1D41:
   1D41 20 BA 1D      [ 6]  192         jsr     L1DBA
   1D44 A9 10         [ 2]  193         lda     #0x10
   1D46 20 7C 1D      [ 6]  194         jsr     L1D7C
   1D49 20 D1 1E      [ 6]  195         jsr     L1ED1
   1D4C 4C F7 1C      [ 3]  196         jmp     L1CF7
                            197 ;
   1D4F                     198 L1D4F:
   1D4F A9 3C         [ 2]  199         lda     #0x3C
   1D51 8D 83 03      [ 4]  200         sta     audio_control_reg_b
   1D54 A9 34         [ 2]  201         lda     #0x34
   1D56 8D 81 03      [ 4]  202         sta     audio_control_reg_a
   1D59 A2 00         [ 2]  203         ldx     #0x00
   1D5B                     204 L1D5B:
   1D5B A9 30         [ 2]  205         lda     #0x30
   1D5D 95 81         [ 4]  206         sta     board_1_control_reg_a,x
   1D5F 95 83         [ 4]  207         sta     board_1_control_reg_b,x
   1D61 A9 FF         [ 2]  208         lda     #0xFF
   1D63 95 80         [ 4]  209         sta     board_1_periph$ddr_reg_a,x
   1D65 95 82         [ 4]  210         sta     board_1_periph$ddr_reg_b,x
   1D67 A9 34         [ 2]  211         lda     #0x34
   1D69 95 81         [ 4]  212         sta     board_1_control_reg_a,x
   1D6B 95 83         [ 4]  213         sta     board_1_control_reg_b,x
   1D6D A9 00         [ 2]  214         lda     #0x00
   1D6F 95 80         [ 4]  215         sta     board_1_periph$ddr_reg_a,x
   1D71 95 82         [ 4]  216         sta     board_1_periph$ddr_reg_b,x
   1D73 E8            [ 2]  217         inx
   1D74 E8            [ 2]  218         inx
   1D75 E8            [ 2]  219         inx
   1D76 E8            [ 2]  220         inx
   1D77 E0 20         [ 2]  221         cpx     #0x20
   1D79 90 E0         [ 4]  222         bcc     L1D5B
   1D7B 60            [ 6]  223         rts
                            224 ;
   1D7C                     225 L1D7C:
   1D7C 8D 02 03      [ 4]  226         sta     transport_periph$ddr_reg_b
   1D7F A9 FA         [ 2]  227         lda     #0xFA
   1D81 85 50         [ 3]  228         sta     RAM_50
   1D83                     229 L1D83:
   1D83 20 8D 1E      [ 6]  230         jsr     L1E8D
   1D86 A5 50         [ 3]  231         lda     RAM_50
   1D88 D0 F9         [ 4]  232         bne     L1D83
   1D8A AD 02 03      [ 4]  233         lda     transport_periph$ddr_reg_b
   1D8D 29 60         [ 2]  234         and     #0x60
   1D8F D0 05         [ 4]  235         bne     L1D96
   1D91 A9 00         [ 2]  236         lda     #0x00
   1D93 8D 02 03      [ 4]  237         sta     transport_periph$ddr_reg_b
   1D96                     238 L1D96:
   1D96 60            [ 6]  239         rts
                            240 ;
   1D97                     241 L1D97:
   1D97 A9 00         [ 2]  242         lda     #0x00
   1D99 85 58         [ 3]  243         sta     RAM_58
   1D9B                     244 L1D9B:
   1D9B AD 02 03      [ 4]  245         lda     transport_periph$ddr_reg_b
   1D9E A9 0A         [ 2]  246         lda     #0x0A
   1DA0 85 50         [ 3]  247         sta     RAM_50
   1DA2 E6 58         [ 5]  248         inc     RAM_58
   1DA4 A5 58         [ 3]  249         lda     RAM_58
   1DA6 C9 21         [ 2]  250         cmp     #0x21
   1DA8 B0 0F         [ 4]  251         bcs     L1DB9
   1DAA                     252 L1DAA:
   1DAA 20 8D 1E      [ 6]  253         jsr     L1E8D
   1DAD A5 50         [ 3]  254         lda     RAM_50
   1DAF F0 E6         [ 4]  255         beq     L1D97
   1DB1 AD 03 03      [ 4]  256         lda     transport_control_reg_b
   1DB4 10 F4         [ 4]  257         bpl     L1DAA
   1DB6 4C 9B 1D      [ 3]  258         jmp     L1D9B
   1DB9                     259 L1DB9:
   1DB9 60            [ 6]  260         rts
                            261 ;
   1DBA                     262 L1DBA:
   1DBA A9 FA         [ 2]  263         lda     #0xFA
   1DBC 85 50         [ 3]  264         sta     RAM_50
   1DBE                     265 L1DBE:
   1DBE 20 8D 1E      [ 6]  266         jsr     L1E8D
   1DC1 A5 50         [ 3]  267         lda     RAM_50
   1DC3 D0 F9         [ 4]  268         bne     L1DBE
   1DC5                     269 L1DC5:
   1DC5 20 8D 1E      [ 6]  270         jsr     L1E8D
   1DC8 AD 02 03      [ 4]  271         lda     transport_periph$ddr_reg_b
   1DCB 6A            [ 2]  272         ror     a
   1DCC 90 F7         [ 4]  273         bcc     L1DC5
   1DCE A9 A0         [ 2]  274         lda     #0xA0
   1DD0 85 50         [ 3]  275         sta     RAM_50
   1DD2                     276 L1DD2:
   1DD2 20 8D 1E      [ 6]  277         jsr     L1E8D
   1DD5 AD 02 03      [ 4]  278         lda     transport_periph$ddr_reg_b
   1DD8 6A            [ 2]  279         ror     a
   1DD9 90 EA         [ 4]  280         bcc     L1DC5
   1DDB A5 50         [ 3]  281         lda     RAM_50
   1DDD D0 F3         [ 4]  282         bne     L1DD2
   1DDF 60            [ 6]  283         rts
                            284 ;
   1DE0                     285 L1DE0:
   1DE0 AD 00 03      [ 4]  286         lda     transport_periph$ddr_reg_a
   1DE3 A9 40         [ 2]  287         lda     #0x40
   1DE5 85 82         [ 3]  288         sta     board_1_periph$ddr_reg_b
   1DE7 85 86         [ 3]  289         sta     board_2_periph$ddr_reg_b
   1DE9 85 8A         [ 3]  290         sta     board_3_periph$ddr_reg_b
   1DEB 85 8E         [ 3]  291         sta     board_4_periph$ddr_reg_b
   1DED A9 3C         [ 2]  292         lda     #0x3C
   1DEF 8D 81 03      [ 4]  293         sta     audio_control_reg_a
   1DF2 A9 34         [ 2]  294         lda     #0x34
   1DF4 8D 83 03      [ 4]  295         sta     audio_control_reg_b
   1DF7 A9 60         [ 2]  296         lda     #0x60
   1DF9 85 82         [ 3]  297         sta     board_1_periph$ddr_reg_b
   1DFB                     298 L1DFB:
   1DFB AD 02 03      [ 4]  299         lda     transport_periph$ddr_reg_b
   1DFE 4A            [ 2]  300         lsr     a
   1DFF 90 11         [ 4]  301         bcc     L1E12
   1E01 20 1A 1F      [ 6]  302         jsr     L1F1A
   1E04 20 8D 1E      [ 6]  303         jsr     L1E8D
   1E07 AD 01 03      [ 4]  304         lda     transport_control_reg_a
   1E0A 10 EF         [ 4]  305         bpl     L1DFB
   1E0C 20 24 1E      [ 6]  306         jsr     L1E24
   1E0F 4C FB 1D      [ 3]  307         jmp     L1DFB
                            308 ;
   1E12                     309 L1E12:
   1E12 A9 64         [ 2]  310         lda     #0x64
   1E14 85 50         [ 3]  311         sta     RAM_50
   1E16                     312 L1E16:
   1E16 20 8D 1E      [ 6]  313         jsr     L1E8D
   1E19 AD 02 03      [ 4]  314         lda     transport_periph$ddr_reg_b
   1E1C 4A            [ 2]  315         lsr     a
   1E1D B0 C1         [ 4]  316         bcs     L1DE0
   1E1F A5 50         [ 3]  317         lda     RAM_50
   1E21 D0 F3         [ 4]  318         bne     L1E16
   1E23 60            [ 6]  319         rts
                            320 ;
   1E24                     321 L1E24:
   1E24 AD 00 03      [ 4]  322         lda     transport_periph$ddr_reg_a
   1E27 29 7F         [ 2]  323         and     #0x7F
   1E29 85 5C         [ 3]  324         sta     RAM_5C
   1E2B 29 7E         [ 2]  325         and     #0x7E
   1E2D C9 22         [ 2]  326         cmp     #0x22
   1E2F F0 3A         [ 4]  327         beq     L1E6B
   1E31 C9 32         [ 2]  328         cmp     #0x32
   1E33 90 4F         [ 4]  329         bcc     L1E84
   1E35 C9 3A         [ 2]  330         cmp     #0x3A
   1E37 90 32         [ 4]  331         bcc     L1E6B
   1E39 A5 5C         [ 3]  332         lda     RAM_5C
   1E3B C9 41         [ 2]  333         cmp     #0x41
   1E3D 90 45         [ 4]  334         bcc     L1E84
   1E3F C9 51         [ 2]  335         cmp     #0x51
   1E41 B0 41         [ 4]  336         bcs     L1E84
   1E43 A6 64         [ 3]  337         ldx     RAM_64
   1E45 38            [ 2]  338         sec
   1E46 E9 41         [ 2]  339         sbc     #0x41
   1E48 C9 08         [ 2]  340         cmp     #0x08
   1E4A 90 02         [ 4]  341         bcc     L1E4E
   1E4C E8            [ 2]  342         inx
   1E4D E8            [ 2]  343         inx
   1E4E                     344 L1E4E:
   1E4E 29 07         [ 2]  345         and     #0x07
   1E50 A8            [ 2]  346         tay
   1E51 B9 85 1E      [ 5]  347         lda     X1E85,y
   1E54 85 5D         [ 3]  348         sta     RAM_5D
   1E56 A5 5E         [ 3]  349         lda     RAM_5E
   1E58 4A            [ 2]  350         lsr     a
   1E59 B0 09         [ 4]  351         bcs     L1E64
   1E5B A5 5D         [ 3]  352         lda     RAM_5D
   1E5D 49 FF         [ 2]  353         eor     #0xFF
   1E5F 35 00         [ 4]  354         and     RAM_start,x
   1E61 95 00         [ 4]  355         sta     RAM_start,x
   1E63 60            [ 6]  356         rts
                            357 ;
   1E64                     358 L1E64:
   1E64 A5 5D         [ 3]  359         lda     RAM_5D
   1E66 15 00         [ 4]  360         ora     RAM_start,x
   1E68 95 00         [ 4]  361         sta     RAM_start,x
   1E6A 60            [ 6]  362         rts
                            363 ;
   1E6B                     364 L1E6B:
   1E6B A5 5C         [ 3]  365         lda     RAM_5C
   1E6D 85 5E         [ 3]  366         sta     RAM_5E
   1E6F 29 7E         [ 2]  367         and     #0x7E
   1E71 C9 22         [ 2]  368         cmp     #0x22
   1E73 D0 05         [ 4]  369         bne     L1E7A
   1E75 A9 98         [ 2]  370         lda     #0x98
   1E77 85 64         [ 3]  371         sta     RAM_64
   1E79 60            [ 6]  372         rts
                            373 ;
   1E7A                     374 L1E7A:
   1E7A 38            [ 2]  375         sec
   1E7B E9 32         [ 2]  376         sbc     #0x32
   1E7D 0A            [ 2]  377         asl     a
   1E7E 18            [ 2]  378         clc
   1E7F 69 80         [ 2]  379         adc     #0x80
   1E81 85 64         [ 3]  380         sta     RAM_64
   1E83 60            [ 6]  381         rts
   1E84                     382 L1E84:
   1E84 60            [ 6]  383         rts
                            384 ;
   1E85                     385 X1E85:
   1E85 01 02 04 08         386         .db     0x01,0x02,0x04,0x08
   1E89 10 20 40 80         387         .db     0x10,0x20,0x40,0x80
                            388 ;
   1E8D                     389 L1E8D:
   1E8D AD 05 02      [ 4]  390         lda     U18_edge_detect_control_DI_pos
   1E90 85 5F         [ 3]  391         sta     RAM_5F
   1E92 F0 3C         [ 4]  392         beq     L1ED0
   1E94 29 40         [ 2]  393         and     #0x40
   1E96 F0 04         [ 4]  394         beq     L1E9C
   1E98 A9 01         [ 2]  395         lda     #0x01
   1E9A 85 5A         [ 3]  396         sta     RAM_5A
   1E9C                     397 L1E9C:
   1E9C A5 5F         [ 3]  398         lda     RAM_5F
   1E9E 10 30         [ 4]  399         bpl     L1ED0
   1EA0 AD 04 02      [ 4]  400         lda     U18_timer
   1EA3 49 FF         [ 2]  401         eor     #0xFF
   1EA5 4A            [ 2]  402         lsr     a
   1EA6 4A            [ 2]  403         lsr     a
   1EA7 4A            [ 2]  404         lsr     a
   1EA8 85 57         [ 3]  405         sta     RAM_57
   1EAA 90 02         [ 4]  406         bcc     L1EAE
   1EAC E6 57         [ 5]  407         inc     RAM_57
   1EAE                     408 L1EAE:
   1EAE A9 7A         [ 2]  409         lda     #0x7A
   1EB0 38            [ 2]  410         sec
   1EB1 E5 57         [ 3]  411         sbc     RAM_57
   1EB3 8D 15 02      [ 4]  412         sta     U18_timer_8T_DI
   1EB6 C6 50         [ 5]  413         dec     RAM_50
   1EB8 C6 51         [ 5]  414         dec     RAM_51
   1EBA C6 52         [ 5]  415         dec     RAM_52
   1EBC C6 53         [ 5]  416         dec     RAM_53
   1EBE D0 10         [ 4]  417         bne     L1ED0
   1EC0 A9 64         [ 2]  418         lda     #0x64
   1EC2 85 53         [ 3]  419         sta     RAM_53
   1EC4 C6 54         [ 5]  420         dec     RAM_54
   1EC6 C6 55         [ 5]  421         dec     RAM_55
   1EC8 D0 06         [ 4]  422         bne     L1ED0
   1ECA A9 64         [ 2]  423         lda     #0x64
   1ECC 85 55         [ 3]  424         sta     RAM_55
   1ECE C6 56         [ 5]  425         dec     RAM_56
   1ED0                     426 L1ED0:
   1ED0 60            [ 6]  427         rts
                            428 ;
   1ED1                     429 L1ED1:
   1ED1 A9 00         [ 2]  430         lda     #0x00
   1ED3 85 61         [ 3]  431         sta     RAM_61
   1ED5 85 62         [ 3]  432         sta     RAM_62
   1ED7 A9 0A         [ 2]  433         lda     #0x0A
   1ED9 85 54         [ 3]  434         sta     RAM_54
   1EDB A9 64         [ 2]  435         lda     #0x64
   1EDD 85 53         [ 3]  436         sta     RAM_53
   1EDF                     437 L1EDF:
   1EDF 20 8D 1E      [ 6]  438         jsr     L1E8D
   1EE2 A5 54         [ 3]  439         lda     RAM_54
   1EE4 D0 F9         [ 4]  440         bne     L1EDF
   1EE6 A9 0A         [ 2]  441         lda     #0x0A
   1EE8 85 54         [ 3]  442         sta     RAM_54
   1EEA A9 64         [ 2]  443         lda     #0x64
   1EEC 85 53         [ 3]  444         sta     RAM_53
   1EEE A5 62         [ 3]  445         lda     RAM_62
   1EF0 C9 08         [ 2]  446         cmp     #0x08
   1EF2 F0 15         [ 4]  447         beq     L1F09
   1EF4 E6 62         [ 5]  448         inc     RAM_62
   1EF6 A2 09         [ 2]  449         ldx     #0x09
   1EF8 38            [ 2]  450         sec
   1EF9 AD 80 03      [ 4]  451         lda     audio_periph$ddr_reg_a
   1EFC                     452 L1EFC:
   1EFC 2A            [ 2]  453         rol     a
   1EFD CA            [ 2]  454         dex
   1EFE 90 FC         [ 4]  455         bcc     L1EFC
   1F00 18            [ 2]  456         clc
   1F01 8A            [ 2]  457         txa
   1F02 65 61         [ 3]  458         adc     RAM_61
   1F04 85 61         [ 3]  459         sta     RAM_61
   1F06 4C DF 1E      [ 3]  460         jmp     L1EDF
                            461 ;
   1F09                     462 L1F09:
   1F09 46 61         [ 5]  463         lsr     RAM_61
   1F0B 46 61         [ 5]  464         lsr     RAM_61
   1F0D 46 61         [ 5]  465         lsr     RAM_61
   1F0F A5 61         [ 3]  466         lda     RAM_61
   1F11 85 60         [ 3]  467         sta     RAM_60
   1F13 A9 00         [ 2]  468         lda     #0x00
   1F15 85 61         [ 3]  469         sta     RAM_61
   1F17 85 62         [ 3]  470         sta     RAM_62
   1F19 60            [ 6]  471         rts
                            472 ;
   1F1A                     473 L1F1A:
   1F1A AD 80 02      [ 4]  474         lda     U19_PORTA
   1F1D 49 FF         [ 2]  475         eor     #0xFF
   1F1F 4A            [ 2]  476         lsr     a
   1F20 4A            [ 2]  477         lsr     a
   1F21 4A            [ 2]  478         lsr     a
   1F22 4A            [ 2]  479         lsr     a
   1F23 18            [ 2]  480         clc
   1F24 65 60         [ 3]  481         adc     RAM_60
   1F26 AA            [ 2]  482         tax
   1F27 BD 4D 1F      [ 5]  483         lda     X1F4D,x
   1F2A 85 63         [ 3]  484         sta     RAM_63
   1F2C A5 52         [ 3]  485         lda     RAM_52
   1F2E D0 16         [ 4]  486         bne     L1F46
   1F30 A9 0A         [ 2]  487         lda     #0x0A
   1F32 85 52         [ 3]  488         sta     RAM_52
   1F34 A5 63         [ 3]  489         lda     RAM_63
   1F36 CD 82 03      [ 4]  490         cmp     audio_periph$ddr_reg_b
   1F39 90 08         [ 4]  491         bcc     L1F43
   1F3B F0 09         [ 4]  492         beq     L1F46
   1F3D EE 82 03      [ 6]  493         inc     audio_periph$ddr_reg_b
   1F40 4C 46 1F      [ 3]  494         jmp     L1F46
                            495 ;
   1F43                     496 L1F43:
   1F43 CE 82 03      [ 6]  497         dec     audio_periph$ddr_reg_b
   1F46                     498 L1F46:
   1F46 AD 82 03      [ 4]  499         lda     audio_periph$ddr_reg_b
   1F49 8D 82 02      [ 4]  500         sta     U19_PORTB
   1F4C 60            [ 6]  501         rts
                            502 ;
   1F4D                     503 X1F4D:
   1F4D 03 04 06 08         504         .db     0x03, 0x04, 0x06, 0x08
   1F51 10 16 20 2D         505         .db     0x10, 0x16, 0x20, 0x2D
   1F55 40 5A 80 BF         506         .db     0x40, 0x5A, 0x80, 0xBF
   1F59 FF FF FF FF         507         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F5D FF                  508         .db     0xFF
                            509 ;
                            510 ; all zeros in this gap
                            511 ;
   1FFC                     512         .org    0x1FFC
                            513 ;
                            514 ; vectors
                            515 ;
   1FFC                     516 RESETVEC:
   1FFC 00 1C               517         .dw     RESET
   1FFE                     518 IRQVEC:
   1FFE 00 00               519         .dw     RAM_start
