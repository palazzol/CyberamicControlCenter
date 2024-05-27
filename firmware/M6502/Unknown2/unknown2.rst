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
                             22 
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
   1C61 20 7C 1D      [ 6]   81         jsr     L1D7C
   1C64 A9 28         [ 2]   82         lda     #0x28
   1C66 85 54         [ 3]   83         sta     RAM_54
   1C68 A9 64         [ 2]   84         lda     #0x64
   1C6A 85 53         [ 3]   85         sta     RAM_53
   1C6C                      86 L1C6C:
   1C6C 20 8D 1E      [ 6]   87         jsr     L1E8D
   1C6F A5 54         [ 3]   88         lda     RAM_54
   1C71 D0 F9         [ 4]   89         bne     L1C6C
   1C73                      90 L1C73:
   1C73 A9 40         [ 2]   91         lda     #0x40
   1C75 20 7C 1D      [ 6]   92         jsr     L1D7C
   1C78                      93 L1C78:
   1C78 A9 00         [ 2]   94         lda     #0x00
   1C7A 85 58         [ 3]   95         sta     RAM_58
   1C7C                      96 L1C7C:
   1C7C 20 8D 1E      [ 6]   97         jsr     L1E8D
   1C7F AD 03 03      [ 4]   98         lda     transport_control_reg_b
   1C82 10 F8         [ 4]   99         bpl     L1C7C
   1C84 A9 06         [ 2]  100         lda     #0x06
   1C86 85 54         [ 3]  101         sta     RAM_54
   1C88 A9 64         [ 2]  102         lda     #0x64
   1C8A 85 53         [ 3]  103         sta     RAM_53
   1C8C                     104 L1C8C:
   1C8C 20 8D 1E      [ 6]  105         jsr     L1E8D
   1C8F AD 03 03      [ 4]  106         lda     transport_control_reg_b
   1C92 10 0B         [ 4]  107         bpl     L1C9F
   1C94 E6 58         [ 5]  108         inc     RAM_58
   1C96 AD 02 03      [ 4]  109         lda     transport_periph$ddr_reg_b
   1C99 A5 58         [ 3]  110         lda     RAM_58
   1C9B C9 64         [ 2]  111         cmp     #0x64
   1C9D B0 0B         [ 4]  112         bcs     L1CAA
   1C9F                     113 L1C9F:
   1C9F A5 54         [ 3]  114         lda     RAM_54
   1CA1 D0 E9         [ 4]  115         bne     L1C8C
   1CA3 4C 78 1C      [ 3]  116         jmp     L1C78
                            117 ;
   1CA6 C9 60         [ 2]  118         cmp     #0x60
   1CA8 90 00         [ 4]  119         bcc     L1CAA
   1CAA                     120 L1CAA:
   1CAA A9 20         [ 2]  121         lda     #0x20
   1CAC 20 7C 1D      [ 6]  122         jsr     L1D7C
   1CAF A9 19         [ 2]  123         lda     #0x19
   1CB1 85 54         [ 3]  124         sta     RAM_54
   1CB3 A9 64         [ 2]  125         lda     #0x64
   1CB5 85 53         [ 3]  126         sta     RAM_53
   1CB7                     127 L1CB7:
   1CB7 20 8D 1E      [ 6]  128         jsr     L1E8D
   1CBA A5 54         [ 3]  129         lda     RAM_54
   1CBC D0 F9         [ 4]  130         bne     L1CB7
   1CBE A9 00         [ 2]  131         lda     #0x00
   1CC0 85 59         [ 3]  132         sta     RAM_59
   1CC2 20 97 1D      [ 6]  133         jsr     L1D97
   1CC5 A9 40         [ 2]  134         lda     #0x40
   1CC7 20 7C 1D      [ 6]  135         jsr     L1D7C
   1CCA 20 97 1D      [ 6]  136         jsr     L1D97
   1CCD A9 FA         [ 2]  137         lda     #0xFA
   1CCF 85 50         [ 3]  138         sta     RAM_50
   1CD1                     139 L1CD1:
   1CD1 20 8D 1E      [ 6]  140         jsr     L1E8D
   1CD4 A5 50         [ 3]  141         lda     RAM_50
   1CD6 D0 F9         [ 4]  142         bne     L1CD1
   1CD8 A9 20         [ 2]  143         lda     #0x20
   1CDA 20 7C 1D      [ 6]  144         jsr     L1D7C
   1CDD 20 97 1D      [ 6]  145         jsr     L1D97
   1CE0 E6 59         [ 5]  146         inc     RAM_59
   1CE2 A9 10         [ 2]  147         lda     #0x10
   1CE4 20 7C 1D      [ 6]  148         jsr     L1D7C
   1CE7 A9 80         [ 2]  149         lda     #0x80
   1CE9 20 7C 1D      [ 6]  150         jsr     L1D7C
   1CEC 20 BA 1D      [ 6]  151         jsr     L1DBA
   1CEF A9 10         [ 2]  152         lda     #0x10
   1CF1 20 7C 1D      [ 6]  153         jsr     L1D7C
   1CF4 20 4F 1D      [ 6]  154         jsr     L1D4F
   1CF7                     155 L1CF7:
   1CF7 20 8D 1E      [ 6]  156         jsr     L1E8D
   1CFA 20 1A 1F      [ 6]  157         jsr     L1F1A
   1CFD A5 5A         [ 3]  158         lda     RAM_5A
   1CFF D0 10         [ 4]  159         bne     L1D11
   1D01 A9 02         [ 2]  160         lda     #0x02
   1D03 8D 80 02      [ 4]  161         sta     U19_PORTA
   1D06 A9 00         [ 2]  162         lda     #0x00
   1D08 8D 02 02      [ 4]  163         sta     U18_PORTB
   1D0B A5 56         [ 3]  164         lda     RAM_56
   1D0D D0 E8         [ 4]  165         bne     L1CF7
   1D0F E6 5A         [ 5]  166         inc     RAM_5A
   1D11                     167 L1D11:
   1D11 20 4F 1D      [ 6]  168         jsr     L1D4F
   1D14 A9 00         [ 2]  169         lda     #0x00
   1D16 8D 80 02      [ 4]  170         sta     U19_PORTA
   1D19 A9 80         [ 2]  171         lda     #0x80
   1D1B 8D 02 02      [ 4]  172         sta     U18_PORTB
   1D1E A9 80         [ 2]  173         lda     #0x80
   1D20 20 7C 1D      [ 6]  174         jsr     L1D7C
   1D23 20 BA 1D      [ 6]  175         jsr     L1DBA
   1D26 C6 5A         [ 5]  176         dec     RAM_5A
   1D28 20 E0 1D      [ 6]  177         jsr     L1DE0
   1D2B 20 4F 1D      [ 6]  178         jsr     L1D4F
   1D2E A9 1E         [ 2]  179         lda     #0x1E
   1D30 85 56         [ 3]  180         sta     RAM_56
   1D32 A9 64         [ 2]  181         lda     #0x64
   1D34 85 55         [ 3]  182         sta     RAM_55
   1D36 E6 59         [ 5]  183         inc     RAM_59
   1D38 A5 59         [ 3]  184         lda     RAM_59
   1D3A C9 1A         [ 2]  185         cmp     #0x1A
   1D3C 90 03         [ 4]  186         bcc     L1D41
   1D3E 4C 73 1C      [ 3]  187         jmp     L1C73
                            188 ;
   1D41                     189 L1D41:
   1D41 20 BA 1D      [ 6]  190         jsr     L1DBA
   1D44 A9 10         [ 2]  191         lda     #0x10
   1D46 20 7C 1D      [ 6]  192         jsr     L1D7C
   1D49 20 D1 1E      [ 6]  193         jsr     L1ED1
   1D4C 4C F7 1C      [ 3]  194         jmp     L1CF7
                            195 ;
   1D4F                     196 L1D4F:
   1D4F A9 3C         [ 2]  197         lda     #0x3C
   1D51 8D 83 03      [ 4]  198         sta     audio_control_reg_b
   1D54 A9 34         [ 2]  199         lda     #0x34
   1D56 8D 81 03      [ 4]  200         sta     audio_control_reg_a
   1D59 A2 00         [ 2]  201         ldx     #0x00
   1D5B                     202 L1D5B:
   1D5B A9 30         [ 2]  203         lda     #0x30
   1D5D 95 81         [ 4]  204         sta     board_1_control_reg_a,x
   1D5F 95 83         [ 4]  205         sta     board_1_control_reg_b,x
   1D61 A9 FF         [ 2]  206         lda     #0xFF
   1D63 95 80         [ 4]  207         sta     board_1_periph$ddr_reg_a,x
   1D65 95 82         [ 4]  208         sta     board_1_periph$ddr_reg_b,x
   1D67 A9 34         [ 2]  209         lda     #0x34
   1D69 95 81         [ 4]  210         sta     board_1_control_reg_a,x
   1D6B 95 83         [ 4]  211         sta     board_1_control_reg_b,x
   1D6D A9 00         [ 2]  212         lda     #0x00
   1D6F 95 80         [ 4]  213         sta     board_1_periph$ddr_reg_a,x
   1D71 95 82         [ 4]  214         sta     board_1_periph$ddr_reg_b,x
   1D73 E8            [ 2]  215         inx
   1D74 E8            [ 2]  216         inx
   1D75 E8            [ 2]  217         inx
   1D76 E8            [ 2]  218         inx
   1D77 E0 20         [ 2]  219         cpx     #0x20
   1D79 90 E0         [ 4]  220         bcc     L1D5B
   1D7B 60            [ 6]  221         rts
                            222 ;
   1D7C                     223 L1D7C:
   1D7C 8D 02 03      [ 4]  224         sta     transport_periph$ddr_reg_b
   1D7F A9 FA         [ 2]  225         lda     #0xFA
   1D81 85 50         [ 3]  226         sta     RAM_50
   1D83                     227 L1D83:
   1D83 20 8D 1E      [ 6]  228         jsr     L1E8D
   1D86 A5 50         [ 3]  229         lda     RAM_50
   1D88 D0 F9         [ 4]  230         bne     L1D83
   1D8A AD 02 03      [ 4]  231         lda     transport_periph$ddr_reg_b
   1D8D 29 60         [ 2]  232         and     #0x60
   1D8F D0 05         [ 4]  233         bne     L1D96
   1D91 A9 00         [ 2]  234         lda     #0x00
   1D93 8D 02 03      [ 4]  235         sta     transport_periph$ddr_reg_b
   1D96                     236 L1D96:
   1D96 60            [ 6]  237         rts
                            238 ;
   1D97                     239 L1D97:
   1D97 A9 00         [ 2]  240         lda     #0x00
   1D99 85 58         [ 3]  241         sta     RAM_58
   1D9B                     242 L1D9B:
   1D9B AD 02 03      [ 4]  243         lda     transport_periph$ddr_reg_b
   1D9E A9 0A         [ 2]  244         lda     #0x0A
   1DA0 85 50         [ 3]  245         sta     RAM_50
   1DA2 E6 58         [ 5]  246         inc     RAM_58
   1DA4 A5 58         [ 3]  247         lda     RAM_58
   1DA6 C9 21         [ 2]  248         cmp     #0x21
   1DA8 B0 0F         [ 4]  249         bcs     L1DB9
   1DAA                     250 L1DAA:
   1DAA 20 8D 1E      [ 6]  251         jsr     L1E8D
   1DAD A5 50         [ 3]  252         lda     RAM_50
   1DAF F0 E6         [ 4]  253         beq     L1D97
   1DB1 AD 03 03      [ 4]  254         lda     transport_control_reg_b
   1DB4 10 F4         [ 4]  255         bpl     L1DAA
   1DB6 4C 9B 1D      [ 3]  256         jmp     L1D9B
   1DB9                     257 L1DB9:
   1DB9 60            [ 6]  258         rts
                            259 ;
   1DBA                     260 L1DBA:
   1DBA A9 FA         [ 2]  261         lda     #0xFA
   1DBC 85 50         [ 3]  262         sta     RAM_50
   1DBE                     263 L1DBE:
   1DBE 20 8D 1E      [ 6]  264         jsr     L1E8D
   1DC1 A5 50         [ 3]  265         lda     RAM_50
   1DC3 D0 F9         [ 4]  266         bne     L1DBE
   1DC5                     267 L1DC5:
   1DC5 20 8D 1E      [ 6]  268         jsr     L1E8D
   1DC8 AD 02 03      [ 4]  269         lda     transport_periph$ddr_reg_b
   1DCB 6A            [ 2]  270         ror     a
   1DCC 90 F7         [ 4]  271         bcc     L1DC5
   1DCE A9 A0         [ 2]  272         lda     #0xA0
   1DD0 85 50         [ 3]  273         sta     RAM_50
   1DD2                     274 L1DD2:
   1DD2 20 8D 1E      [ 6]  275         jsr     L1E8D
   1DD5 AD 02 03      [ 4]  276         lda     transport_periph$ddr_reg_b
   1DD8 6A            [ 2]  277         ror     a
   1DD9 90 EA         [ 4]  278         bcc     L1DC5
   1DDB A5 50         [ 3]  279         lda     RAM_50
   1DDD D0 F3         [ 4]  280         bne     L1DD2
   1DDF 60            [ 6]  281         rts
                            282 ;
   1DE0                     283 L1DE0:
   1DE0 AD 00 03      [ 4]  284         lda     transport_periph$ddr_reg_a
   1DE3 A9 40         [ 2]  285         lda     #0x40
   1DE5 85 82         [ 3]  286         sta     board_1_periph$ddr_reg_b
   1DE7 85 86         [ 3]  287         sta     board_2_periph$ddr_reg_b
   1DE9 85 8A         [ 3]  288         sta     board_3_periph$ddr_reg_b
   1DEB 85 8E         [ 3]  289         sta     board_4_periph$ddr_reg_b
   1DED A9 3C         [ 2]  290         lda     #0x3C
   1DEF 8D 81 03      [ 4]  291         sta     audio_control_reg_a
   1DF2 A9 34         [ 2]  292         lda     #0x34
   1DF4 8D 83 03      [ 4]  293         sta     audio_control_reg_b
   1DF7 A9 60         [ 2]  294         lda     #0x60
   1DF9 85 82         [ 3]  295         sta     board_1_periph$ddr_reg_b
   1DFB                     296 L1DFB:
   1DFB AD 02 03      [ 4]  297         lda     transport_periph$ddr_reg_b
   1DFE 4A            [ 2]  298         lsr     a
   1DFF 90 11         [ 4]  299         bcc     L1E12
   1E01 20 1A 1F      [ 6]  300         jsr     L1F1A
   1E04 20 8D 1E      [ 6]  301         jsr     L1E8D
   1E07 AD 01 03      [ 4]  302         lda     transport_control_reg_a
   1E0A 10 EF         [ 4]  303         bpl     L1DFB
   1E0C 20 24 1E      [ 6]  304         jsr     L1E24
   1E0F 4C FB 1D      [ 3]  305         jmp     L1DFB
                            306 ;
   1E12                     307 L1E12:
   1E12 A9 64         [ 2]  308         lda     #0x64
   1E14 85 50         [ 3]  309         sta     RAM_50
   1E16                     310 L1E16:
   1E16 20 8D 1E      [ 6]  311         jsr     L1E8D
   1E19 AD 02 03      [ 4]  312         lda     transport_periph$ddr_reg_b
   1E1C 4A            [ 2]  313         lsr     a
   1E1D B0 C1         [ 4]  314         bcs     L1DE0
   1E1F A5 50         [ 3]  315         lda     RAM_50
   1E21 D0 F3         [ 4]  316         bne     L1E16
   1E23 60            [ 6]  317         rts
                            318 ;
   1E24                     319 L1E24:
   1E24 AD 00 03      [ 4]  320         lda     transport_periph$ddr_reg_a
   1E27 29 7F         [ 2]  321         and     #0x7F
   1E29 85 5C         [ 3]  322         sta     RAM_5C
   1E2B 29 7E         [ 2]  323         and     #0x7E
   1E2D C9 22         [ 2]  324         cmp     #0x22
   1E2F F0 3A         [ 4]  325         beq     L1E6B
   1E31 C9 32         [ 2]  326         cmp     #0x32
   1E33 90 4F         [ 4]  327         bcc     L1E84
   1E35 C9 3A         [ 2]  328         cmp     #0x3A
   1E37 90 32         [ 4]  329         bcc     L1E6B
   1E39 A5 5C         [ 3]  330         lda     RAM_5C
   1E3B C9 41         [ 2]  331         cmp     #0x41
   1E3D 90 45         [ 4]  332         bcc     L1E84
   1E3F C9 51         [ 2]  333         cmp     #0x51
   1E41 B0 41         [ 4]  334         bcs     L1E84
   1E43 A6 64         [ 3]  335         ldx     RAM_64
   1E45 38            [ 2]  336         sec
   1E46 E9 41         [ 2]  337         sbc     #0x41
   1E48 C9 08         [ 2]  338         cmp     #0x08
   1E4A 90 02         [ 4]  339         bcc     L1E4E
   1E4C E8            [ 2]  340         inx
   1E4D E8            [ 2]  341         inx
   1E4E                     342 L1E4E:
   1E4E 29 07         [ 2]  343         and     #0x07
   1E50 A8            [ 2]  344         tay
   1E51 B9 85 1E      [ 5]  345         lda     X1E85,y
   1E54 85 5D         [ 3]  346         sta     RAM_5D
   1E56 A5 5E         [ 3]  347         lda     RAM_5E
   1E58 4A            [ 2]  348         lsr     a
   1E59 B0 09         [ 4]  349         bcs     L1E64
   1E5B A5 5D         [ 3]  350         lda     RAM_5D
   1E5D 49 FF         [ 2]  351         eor     #0xFF
   1E5F 35 00         [ 4]  352         and     RAM_start,x
   1E61 95 00         [ 4]  353         sta     RAM_start,x
   1E63 60            [ 6]  354         rts
                            355 ;
   1E64                     356 L1E64:
   1E64 A5 5D         [ 3]  357         lda     RAM_5D
   1E66 15 00         [ 4]  358         ora     RAM_start,x
   1E68 95 00         [ 4]  359         sta     RAM_start,x
   1E6A 60            [ 6]  360         rts
                            361 ;
   1E6B                     362 L1E6B:
   1E6B A5 5C         [ 3]  363         lda     RAM_5C
   1E6D 85 5E         [ 3]  364         sta     RAM_5E
   1E6F 29 7E         [ 2]  365         and     #0x7E
   1E71 C9 22         [ 2]  366         cmp     #0x22
   1E73 D0 05         [ 4]  367         bne     L1E7A
   1E75 A9 98         [ 2]  368         lda     #0x98
   1E77 85 64         [ 3]  369         sta     RAM_64
   1E79 60            [ 6]  370         rts
                            371 ;
   1E7A                     372 L1E7A:
   1E7A 38            [ 2]  373         sec
   1E7B E9 32         [ 2]  374         sbc     #0x32
   1E7D 0A            [ 2]  375         asl     a
   1E7E 18            [ 2]  376         clc
   1E7F 69 80         [ 2]  377         adc     #0x80
   1E81 85 64         [ 3]  378         sta     RAM_64
   1E83 60            [ 6]  379         rts
   1E84                     380 L1E84:
   1E84 60            [ 6]  381         rts
                            382 ;
   1E85                     383 X1E85:
   1E85 01 02 04 08         384         .db     0x01,0x02,0x04,0x08
   1E89 10 20 40 80         385         .db     0x10,0x20,0x40,0x80
                            386 ;
   1E8D                     387 L1E8D:
   1E8D AD 05 02      [ 4]  388         lda     U18_edge_detect_control_DI_pos
   1E90 85 5F         [ 3]  389         sta     RAM_5F
   1E92 F0 3C         [ 4]  390         beq     L1ED0
   1E94 29 40         [ 2]  391         and     #0x40
   1E96 F0 04         [ 4]  392         beq     L1E9C
   1E98 A9 01         [ 2]  393         lda     #0x01
   1E9A 85 5A         [ 3]  394         sta     RAM_5A
   1E9C                     395 L1E9C:
   1E9C A5 5F         [ 3]  396         lda     RAM_5F
   1E9E 10 30         [ 4]  397         bpl     L1ED0
   1EA0 AD 04 02      [ 4]  398         lda     U18_timer
   1EA3 49 FF         [ 2]  399         eor     #0xFF
   1EA5 4A            [ 2]  400         lsr     a
   1EA6 4A            [ 2]  401         lsr     a
   1EA7 4A            [ 2]  402         lsr     a
   1EA8 85 57         [ 3]  403         sta     RAM_57
   1EAA 90 02         [ 4]  404         bcc     L1EAE
   1EAC E6 57         [ 5]  405         inc     RAM_57
   1EAE                     406 L1EAE:
   1EAE A9 7A         [ 2]  407         lda     #0x7A
   1EB0 38            [ 2]  408         sec
   1EB1 E5 57         [ 3]  409         sbc     RAM_57
   1EB3 8D 15 02      [ 4]  410         sta     U18_timer_8T_DI
   1EB6 C6 50         [ 5]  411         dec     RAM_50
   1EB8 C6 51         [ 5]  412         dec     RAM_51
   1EBA C6 52         [ 5]  413         dec     RAM_52
   1EBC C6 53         [ 5]  414         dec     RAM_53
   1EBE D0 10         [ 4]  415         bne     L1ED0
   1EC0 A9 64         [ 2]  416         lda     #0x64
   1EC2 85 53         [ 3]  417         sta     RAM_53
   1EC4 C6 54         [ 5]  418         dec     RAM_54
   1EC6 C6 55         [ 5]  419         dec     RAM_55
   1EC8 D0 06         [ 4]  420         bne     L1ED0
   1ECA A9 64         [ 2]  421         lda     #0x64
   1ECC 85 55         [ 3]  422         sta     RAM_55
   1ECE C6 56         [ 5]  423         dec     RAM_56
   1ED0                     424 L1ED0:
   1ED0 60            [ 6]  425         rts
                            426 ;
   1ED1                     427 L1ED1:
   1ED1 A9 00         [ 2]  428         lda     #0x00
   1ED3 85 61         [ 3]  429         sta     RAM_61
   1ED5 85 62         [ 3]  430         sta     RAM_62
   1ED7 A9 0A         [ 2]  431         lda     #0x0A
   1ED9 85 54         [ 3]  432         sta     RAM_54
   1EDB A9 64         [ 2]  433         lda     #0x64
   1EDD 85 53         [ 3]  434         sta     RAM_53
   1EDF                     435 L1EDF:
   1EDF 20 8D 1E      [ 6]  436         jsr     L1E8D
   1EE2 A5 54         [ 3]  437         lda     RAM_54
   1EE4 D0 F9         [ 4]  438         bne     L1EDF
   1EE6 A9 0A         [ 2]  439         lda     #0x0A
   1EE8 85 54         [ 3]  440         sta     RAM_54
   1EEA A9 64         [ 2]  441         lda     #0x64
   1EEC 85 53         [ 3]  442         sta     RAM_53
   1EEE A5 62         [ 3]  443         lda     RAM_62
   1EF0 C9 08         [ 2]  444         cmp     #0x08
   1EF2 F0 15         [ 4]  445         beq     L1F09
   1EF4 E6 62         [ 5]  446         inc     RAM_62
   1EF6 A2 09         [ 2]  447         ldx     #0x09
   1EF8 38            [ 2]  448         sec
   1EF9 AD 80 03      [ 4]  449         lda     audio_periph$ddr_reg_a
   1EFC                     450 L1EFC:
   1EFC 2A            [ 2]  451         rol     a
   1EFD CA            [ 2]  452         dex
   1EFE 90 FC         [ 4]  453         bcc     L1EFC
   1F00 18            [ 2]  454         clc
   1F01 8A            [ 2]  455         txa
   1F02 65 61         [ 3]  456         adc     RAM_61
   1F04 85 61         [ 3]  457         sta     RAM_61
   1F06 4C DF 1E      [ 3]  458         jmp     L1EDF
                            459 ;
   1F09                     460 L1F09:
   1F09 46 61         [ 5]  461         lsr     RAM_61
   1F0B 46 61         [ 5]  462         lsr     RAM_61
   1F0D 46 61         [ 5]  463         lsr     RAM_61
   1F0F A5 61         [ 3]  464         lda     RAM_61
   1F11 85 60         [ 3]  465         sta     RAM_60
   1F13 A9 00         [ 2]  466         lda     #0x00
   1F15 85 61         [ 3]  467         sta     RAM_61
   1F17 85 62         [ 3]  468         sta     RAM_62
   1F19 60            [ 6]  469         rts
                            470 ;
   1F1A                     471 L1F1A:
   1F1A AD 80 02      [ 4]  472         lda     U19_PORTA
   1F1D 49 FF         [ 2]  473         eor     #0xFF
   1F1F 4A            [ 2]  474         lsr     a
   1F20 4A            [ 2]  475         lsr     a
   1F21 4A            [ 2]  476         lsr     a
   1F22 4A            [ 2]  477         lsr     a
   1F23 18            [ 2]  478         clc
   1F24 65 60         [ 3]  479         adc     RAM_60
   1F26 AA            [ 2]  480         tax
   1F27 BD 4D 1F      [ 5]  481         lda     X1F4D,x
   1F2A 85 63         [ 3]  482         sta     RAM_63
   1F2C A5 52         [ 3]  483         lda     RAM_52
   1F2E D0 16         [ 4]  484         bne     L1F46
   1F30 A9 0A         [ 2]  485         lda     #0x0A
   1F32 85 52         [ 3]  486         sta     RAM_52
   1F34 A5 63         [ 3]  487         lda     RAM_63
   1F36 CD 82 03      [ 4]  488         cmp     audio_periph$ddr_reg_b
   1F39 90 08         [ 4]  489         bcc     L1F43
   1F3B F0 09         [ 4]  490         beq     L1F46
   1F3D EE 82 03      [ 6]  491         inc     audio_periph$ddr_reg_b
   1F40 4C 46 1F      [ 3]  492         jmp     L1F46
                            493 ;
   1F43                     494 L1F43:
   1F43 CE 82 03      [ 6]  495         dec     audio_periph$ddr_reg_b
   1F46                     496 L1F46:
   1F46 AD 82 03      [ 4]  497         lda     audio_periph$ddr_reg_b
   1F49 8D 82 02      [ 4]  498         sta     U19_PORTB
   1F4C 60            [ 6]  499         rts
                            500 ;
   1F4D                     501 X1F4D:
   1F4D 03 04 06 08         502         .db     0x03, 0x04, 0x06, 0x08
   1F51 10 16 20 2D         503         .db     0x10, 0x16, 0x20, 0x2D
   1F55 40 5A 80 BF         504         .db     0x40, 0x5A, 0x80, 0xBF
   1F59 FF FF FF FF         505         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F5D FF                  506         .db     0xFF
                            507 ;
                            508 ; all zeros in this gap
                            509 ;
   1FFC                     510         .org    0x1FFC
                            511 ;
                            512 ; vectors
                            513 ;
   1FFC                     514 RESETVEC:
   1FFC 00 1C               515         .dw     RESET
   1FFE                     516 IRQVEC:
   1FFE 00 00               517         .dw     RAM_start
