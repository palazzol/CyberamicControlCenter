                              1         .area   region1 (ABS)
                              2 
                              3 ;
                              4 ;       Pizza Time Theatre
                              5 ;       Dolli Dimples Program
                              6 ;       Version C ?
                              7 ;
                              8 ;       This image was recovered from a 2708 with a label "Dolli C 1C00"
                              9 ;
                     0050    10 RAM_50 = 0x0050
                     0051    11 RAM_51 = 0x0051
                     0052    12 RAM_52 = 0x0052
                     0053    13 RAM_53 = 0x0053
                     0054    14 RAM_54 = 0x0054
                     0055    15 RAM_55 = 0x0055
                     0056    16 RAM_56 = 0x0056
                     0057    17 RAM_57 = 0x0057
                     0058    18 RAM_58 = 0x0058
                     0059    19 RAM_59 = 0x0059
                     005A    20 RAM_5A = 0x005A
                     005B    21 RAM_5B = 0x005B
                     005C    22 RAM_5C = 0x005C
                     005D    23 RAM_5D = 0x005D
                     005E    24 RAM_5E = 0x005E
                     005F    25 RAM_5F = 0x005F
                     0060    26 RAM_60 = 0x0060
                     0061    27 RAM_61 = 0x0061
                     0062    28 RAM_62 = 0x0062
                     0063    29 RAM_63 = 0x0063
                             30 
                             31         .include "../include/ptt6502.def"
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
                             32 
   1C00                      33         .org    0x1C00
                             34 ;
   1C00                      35 RESET:
   1C00 D8            [ 2]   36         cld
   1C01 78            [ 2]   37         sei
   1C02 A2 F0         [ 2]   38         ldx     #0xF0
   1C04 9A            [ 2]   39         txs
   1C05 A9 00         [ 2]   40         lda     #0x00
   1C07 A2 10         [ 2]   41         ldx     #0x10
   1C09                      42 L1C09:
   1C09 95 00         [ 4]   43         sta     RAM_start,x
   1C0B E8            [ 2]   44         inx
   1C0C E0 80         [ 2]   45         cpx     #0x80
   1C0E D0 F9         [ 4]   46         bne     L1C09
   1C10 A9 00         [ 2]   47         lda     #0x00
   1C12 8D 01 03      [ 4]   48         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   49         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   50         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   51         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   52         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   53         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   54         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   55         sta     U18_DDRA
   1C2A A9 02         [ 2]   56         lda     #0x02
   1C2C 8D 81 02      [ 4]   57         sta     U19_DDRA
   1C2F A9 FF         [ 2]   58         lda     #0xFF
   1C31 8D 82 03      [ 4]   59         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   60         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   61         sta     U19_DDRB
   1C3A A9 FC         [ 2]   62         lda     #0xFC
   1C3C 8D 02 03      [ 4]   63         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   64         lda     #0x2E
   1C41 8D 01 03      [ 4]   65         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]   66         sta     transport_control_reg_b
   1C47 8D 83 03      [ 4]   67         sta     audio_control_reg_b
   1C4A 8D 81 03      [ 4]   68         sta     audio_control_reg_a
   1C4D A9 64         [ 2]   69         lda     #0x64
   1C4F 85 53         [ 3]   70         sta     RAM_53
   1C51 A9 2B         [ 2]   71         lda     #0x2B
   1C53 85 57         [ 3]   72         sta     RAM_57
   1C55 A9 10         [ 2]   73         lda     #0x10
   1C57 85 63         [ 3]   74         sta     RAM_63
   1C59 A9 10         [ 2]   75         lda     #0x10
   1C5B 20 1F 1D      [ 6]   76         jsr     L1D1F
   1C5E A9 28         [ 2]   77         lda     #0x28
   1C60 85 54         [ 3]   78         sta     RAM_54
   1C62                      79 L1C62:
   1C62 20 13 1E      [ 6]   80         jsr     L1E13
   1C65 A5 54         [ 3]   81         lda     RAM_54
   1C67 D0 F9         [ 4]   82         bne     L1C62
   1C69                      83 L1C69:
   1C69 A9 40         [ 2]   84         lda     #0x40
   1C6B 20 1F 1D      [ 6]   85         jsr     L1D1F
   1C6E                      86 L1C6E:
   1C6E 20 33 1D      [ 6]   87         jsr     L1D33
   1C71 A5 58         [ 3]   88         lda     RAM_58
   1C73 C9 60         [ 2]   89         cmp     #0x60
   1C75 90 F7         [ 4]   90         bcc     L1C6E
   1C77 A9 20         [ 2]   91         lda     #0x20
   1C79 20 1F 1D      [ 6]   92         jsr     L1D1F
   1C7C A9 19         [ 2]   93         lda     #0x19
   1C7E 85 54         [ 3]   94         sta     RAM_54
   1C80                      95 L1C80:
   1C80 20 13 1E      [ 6]   96         jsr     L1E13
   1C83 A5 54         [ 3]   97         lda     RAM_54
   1C85 D0 F9         [ 4]   98         bne     L1C80
   1C87 A9 00         [ 2]   99         lda     #0x00
   1C89 85 59         [ 3]  100         sta     RAM_59
   1C8B 20 33 1D      [ 6]  101         jsr     L1D33
   1C8E E6 59         [ 5]  102         inc     RAM_59
   1C90 A9 10         [ 2]  103         lda     #0x10
   1C92 20 1F 1D      [ 6]  104         jsr     L1D1F
   1C95 A9 80         [ 2]  105         lda     #0x80
   1C97 20 1F 1D      [ 6]  106         jsr     L1D1F
   1C9A 20 61 1D      [ 6]  107         jsr     L1D61
   1C9D A9 10         [ 2]  108         lda     #0x10
   1C9F 20 1F 1D      [ 6]  109         jsr     L1D1F
   1CA2 20 F9 1C      [ 6]  110         jsr     L1CF9
   1CA5                     111 L1CA5:
   1CA5 20 13 1E      [ 6]  112         jsr     L1E13
   1CA8 20 A0 1E      [ 6]  113         jsr     L1EA0
   1CAB A5 5A         [ 3]  114         lda     RAM_5A
   1CAD D0 10         [ 4]  115         bne     L1CBF
   1CAF A9 02         [ 2]  116         lda     #0x02
   1CB1 8D 80 02      [ 4]  117         sta     U19_PORTA
   1CB4 A9 00         [ 2]  118         lda     #0x00
   1CB6 8D 02 02      [ 4]  119         sta     U18_PORTB
   1CB9 A5 57         [ 3]  120         lda     RAM_57
   1CBB D0 E8         [ 4]  121         bne     L1CA5
   1CBD E6 5A         [ 5]  122         inc     RAM_5A
   1CBF                     123 L1CBF:
   1CBF 20 F9 1C      [ 6]  124         jsr     L1CF9
   1CC2 A9 00         [ 2]  125         lda     #0x00
   1CC4 8D 80 02      [ 4]  126         sta     U19_PORTA
   1CC7 A9 80         [ 2]  127         lda     #0x80
   1CC9 8D 02 02      [ 4]  128         sta     U18_PORTB
   1CCC A9 80         [ 2]  129         lda     #0x80
   1CCE 20 1F 1D      [ 6]  130         jsr     L1D1F
   1CD1 20 61 1D      [ 6]  131         jsr     L1D61
   1CD4 C6 5A         [ 5]  132         dec     RAM_5A
   1CD6 20 87 1D      [ 6]  133         jsr     L1D87
   1CD9 20 F9 1C      [ 6]  134         jsr     L1CF9
   1CDC A9 2B         [ 2]  135         lda     #0x2B
   1CDE 85 57         [ 3]  136         sta     RAM_57
   1CE0 E6 59         [ 5]  137         inc     RAM_59
   1CE2 A5 59         [ 3]  138         lda     RAM_59
   1CE4 C9 1A         [ 2]  139         cmp     #0x1A
   1CE6 90 03         [ 4]  140         bcc     L1CEB
   1CE8 4C 69 1C      [ 3]  141         jmp     L1C69
                            142 ;
   1CEB                     143 L1CEB:
   1CEB 20 61 1D      [ 6]  144         jsr     L1D61
   1CEE A9 10         [ 2]  145         lda     #0x10
   1CF0 20 1F 1D      [ 6]  146         jsr     L1D1F
   1CF3 20 5F 1E      [ 6]  147         jsr     L1E5F
   1CF6 4C A5 1C      [ 3]  148         jmp     L1CA5
                            149 ;
   1CF9                     150 L1CF9:
   1CF9 A9 00         [ 2]  151         lda     #0x00
   1CFB A2 01         [ 2]  152         ldx     #0x01
   1CFD 20 16 1D      [ 6]  153         jsr     L1D16
   1D00 A9 FF         [ 2]  154         lda     #0xFF
   1D02 A2 00         [ 2]  155         ldx     #0x00
   1D04 20 16 1D      [ 6]  156         jsr     L1D16
   1D07 A9 34         [ 2]  157         lda     #0x34
   1D09 A2 01         [ 2]  158         ldx     #0x01
   1D0B 20 16 1D      [ 6]  159         jsr     L1D16
   1D0E A9 00         [ 2]  160         lda     #0x00
   1D10 A2 00         [ 2]  161         ldx     #0x00
   1D12 20 16 1D      [ 6]  162         jsr     L1D16
   1D15 60            [ 6]  163         rts
                            164 ;
   1D16                     165 L1D16:
   1D16 95 84         [ 4]  166         sta     board_2_periph$ddr_reg_a,x
   1D18 95 86         [ 4]  167         sta     board_2_periph$ddr_reg_b,x
   1D1A 95 88         [ 4]  168         sta     board_3_periph$ddr_reg_a,x
   1D1C 95 8A         [ 4]  169         sta     board_3_periph$ddr_reg_b,x
   1D1E 60            [ 6]  170         rts
                            171 ;
   1D1F                     172 L1D1F:
   1D1F 8D 02 03      [ 4]  173         sta     transport_periph$ddr_reg_b
   1D22 A9 FF         [ 2]  174         lda     #0xFF
   1D24 85 50         [ 3]  175         sta     RAM_50
   1D26                     176 L1D26:
   1D26 20 13 1E      [ 6]  177         jsr     L1E13
   1D29 A5 50         [ 3]  178         lda     RAM_50
   1D2B D0 F9         [ 4]  179         bne     L1D26
   1D2D A9 00         [ 2]  180         lda     #0x00
   1D2F 8D 02 03      [ 4]  181         sta     transport_periph$ddr_reg_b
   1D32 60            [ 6]  182         rts
                            183 ;
   1D33                     184 L1D33:
   1D33 A9 00         [ 2]  185         lda     #0x00
   1D35 85 58         [ 3]  186         sta     RAM_58
   1D37                     187 L1D37:
   1D37 20 13 1E      [ 6]  188         jsr     L1E13
   1D3A AD 03 03      [ 4]  189         lda     transport_control_reg_b
   1D3D 10 F8         [ 4]  190         bpl     L1D37
   1D3F A9 04         [ 2]  191         lda     #0x04
   1D41 85 54         [ 3]  192         sta     RAM_54
   1D43                     193 L1D43:
   1D43 20 13 1E      [ 6]  194         jsr     L1E13
   1D46 AD 03 03      [ 4]  195         lda     transport_control_reg_b
   1D49 10 0B         [ 4]  196         bpl     L1D56
   1D4B E6 58         [ 5]  197         inc     RAM_58
   1D4D AD 02 03      [ 4]  198         lda     transport_periph$ddr_reg_b
   1D50 A5 58         [ 3]  199         lda     RAM_58
   1D52 C9 60         [ 2]  200         cmp     #0x60
   1D54 B0 0A         [ 4]  201         bcs     L1D60
   1D56                     202 L1D56:
   1D56 A5 54         [ 3]  203         lda     RAM_54
   1D58 D0 E9         [ 4]  204         bne     L1D43
   1D5A A5 58         [ 3]  205         lda     RAM_58
   1D5C C9 20         [ 2]  206         cmp     #0x20
   1D5E 90 D3         [ 4]  207         bcc     L1D33
   1D60                     208 L1D60:
   1D60 60            [ 6]  209         rts
                            210 ;
   1D61                     211 L1D61:
   1D61 A9 FA         [ 2]  212         lda     #0xFA
   1D63 85 50         [ 3]  213         sta     RAM_50
   1D65                     214 L1D65:
   1D65 20 13 1E      [ 6]  215         jsr     L1E13
   1D68 A5 50         [ 3]  216         lda     RAM_50
   1D6A D0 F9         [ 4]  217         bne     L1D65
   1D6C                     218 L1D6C:
   1D6C 20 13 1E      [ 6]  219         jsr     L1E13
   1D6F AD 02 03      [ 4]  220         lda     transport_periph$ddr_reg_b
   1D72 6A            [ 2]  221         ror     a
   1D73 90 F7         [ 4]  222         bcc     L1D6C
   1D75 A9 A0         [ 2]  223         lda     #0xA0
   1D77 85 50         [ 3]  224         sta     RAM_50
   1D79                     225 L1D79:
   1D79 20 13 1E      [ 6]  226         jsr     L1E13
   1D7C AD 02 03      [ 4]  227         lda     transport_periph$ddr_reg_b
   1D7F 6A            [ 2]  228         ror     a
   1D80 90 EA         [ 4]  229         bcc     L1D6C
   1D82 A5 50         [ 3]  230         lda     RAM_50
   1D84 D0 F3         [ 4]  231         bne     L1D79
   1D86 60            [ 6]  232         rts
                            233 ;
   1D87                     234 L1D87:
   1D87 AD 00 03      [ 4]  235         lda     transport_periph$ddr_reg_a
   1D8A A9 40         [ 2]  236         lda     #0x40
   1D8C 85 86         [ 3]  237         sta     board_2_periph$ddr_reg_b
   1D8E 85 8A         [ 3]  238         sta     board_3_periph$ddr_reg_b
   1D90                     239 L1D90:
   1D90 AD 02 03      [ 4]  240         lda     transport_periph$ddr_reg_b
   1D93 4A            [ 2]  241         lsr     a
   1D94 90 11         [ 4]  242         bcc     L1DA7
   1D96 20 A0 1E      [ 6]  243         jsr     L1EA0
   1D99 20 13 1E      [ 6]  244         jsr     L1E13
   1D9C AD 01 03      [ 4]  245         lda     transport_control_reg_a
   1D9F 10 EF         [ 4]  246         bpl     L1D90
   1DA1 20 B9 1D      [ 6]  247         jsr     L1DB9
   1DA4 4C 90 1D      [ 3]  248         jmp     L1D90
                            249 ;
   1DA7                     250 L1DA7:
   1DA7 A9 64         [ 2]  251         lda     #0x64
   1DA9 85 50         [ 3]  252         sta     RAM_50
   1DAB                     253 L1DAB:
   1DAB 20 13 1E      [ 6]  254         jsr     L1E13
   1DAE AD 02 03      [ 4]  255         lda     transport_periph$ddr_reg_b
   1DB1 4A            [ 2]  256         lsr     a
   1DB2 B0 D3         [ 4]  257         bcs     L1D87
   1DB4 A5 50         [ 3]  258         lda     RAM_50
   1DB6 D0 F3         [ 4]  259         bne     L1DAB
   1DB8 60            [ 6]  260         rts
                            261 ;
   1DB9                     262 L1DB9:
   1DB9 AD 00 03      [ 4]  263         lda     transport_periph$ddr_reg_a
   1DBC 29 7F         [ 2]  264         and     #0x7F
   1DBE 85 5C         [ 3]  265         sta     RAM_5C
   1DC0 29 7E         [ 2]  266         and     #0x7E
   1DC2 C9 22         [ 2]  267         cmp     #0x22
   1DC4 F0 38         [ 4]  268         beq     L1DFE
   1DC6 C9 36         [ 2]  269         cmp     #0x36
   1DC8 F0 34         [ 4]  270         beq     L1DFE
   1DCA A5 5C         [ 3]  271         lda     RAM_5C
   1DCC 38            [ 2]  272         sec
   1DCD E9 41         [ 2]  273         sbc     #0x41
   1DCF A8            [ 2]  274         tay
   1DD0 30 30         [ 4]  275         bmi     L1E02
   1DD2 C9 10         [ 2]  276         cmp     #0x10
   1DD4 B0 2C         [ 4]  277         bcs     L1E02
   1DD6 A2 84         [ 2]  278         ldx     #0x84
   1DD8 C9 08         [ 2]  279         cmp     #0x08
   1DDA 90 08         [ 4]  280         bcc     L1DE4
   1DDC A2 88         [ 2]  281         ldx     #0x88
   1DDE C9 0E         [ 2]  282         cmp     #0x0E
   1DE0 90 02         [ 4]  283         bcc     L1DE4
   1DE2 A2 8A         [ 2]  284         ldx     #0x8A
   1DE4                     285 L1DE4:
   1DE4 B9 03 1E      [ 5]  286         lda     X1E03,y
   1DE7 85 5D         [ 3]  287         sta     RAM_5D
   1DE9 A5 5E         [ 3]  288         lda     RAM_5E
   1DEB 4A            [ 2]  289         lsr     a
   1DEC B0 09         [ 4]  290         bcs     L1DF7
   1DEE A5 5D         [ 3]  291         lda     RAM_5D
   1DF0 49 FF         [ 2]  292         eor     #0xFF
   1DF2 35 00         [ 4]  293         and     RAM_start,x
   1DF4 95 00         [ 4]  294         sta     RAM_start,x
   1DF6 60            [ 6]  295         rts
                            296 ;
   1DF7                     297 L1DF7:
   1DF7 A5 5D         [ 3]  298         lda     RAM_5D
   1DF9 15 00         [ 4]  299         ora     RAM_start,x
   1DFB 95 00         [ 4]  300         sta     RAM_start,x
   1DFD 60            [ 6]  301         rts
                            302 ;
   1DFE                     303 L1DFE:
   1DFE A5 5C         [ 3]  304         lda     RAM_5C
   1E00 85 5E         [ 3]  305         sta     RAM_5E
   1E02                     306 L1E02:
   1E02 60            [ 6]  307         rts
                            308 ;
   1E03                     309 X1E03:
   1E03 01 02 04 08         310         .db     0x01,0x02,0x04,0x08
   1E07 10 20 40 80         311         .db     0x10,0x20,0x40,0x80
   1E0B 01 02 04 08         312         .db     0x01,0x02,0x04,0x08
   1E0F 10 20 01 02         313         .db     0x10,0x20,0x01,0x02
                            314 ;
   1E13                     315 L1E13:
   1E13 AD 05 02      [ 4]  316         lda     U18_edge_detect_control_DI_pos
   1E16 85 5F         [ 3]  317         sta     RAM_5F
   1E18 F0 44         [ 4]  318         beq     L1E5E
   1E1A A5 5B         [ 3]  319         lda     RAM_5B
   1E1C 30 0E         [ 4]  320         bmi     L1E2C
   1E1E A5 5F         [ 3]  321         lda     RAM_5F
   1E20 29 40         [ 2]  322         and     #0x40
   1E22 F0 16         [ 4]  323         beq     L1E3A
   1E24 A9 80         [ 2]  324         lda     #0x80
   1E26 85 5B         [ 3]  325         sta     RAM_5B
   1E28 A9 FA         [ 2]  326         lda     #0xFA
   1E2A 85 51         [ 3]  327         sta     RAM_51
   1E2C                     328 L1E2C:
   1E2C A5 51         [ 3]  329         lda     RAM_51
   1E2E D0 06         [ 4]  330         bne     L1E36
   1E30 A9 00         [ 2]  331         lda     #0x00
   1E32 85 5B         [ 3]  332         sta     RAM_5B
   1E34 E6 5A         [ 5]  333         inc     RAM_5A
   1E36                     334 L1E36:
   1E36 A5 5F         [ 3]  335         lda     RAM_5F
   1E38 10 24         [ 4]  336         bpl     L1E5E
   1E3A                     337 L1E3A:
   1E3A AD 04 02      [ 4]  338         lda     U18_timer
   1E3D A9 01         [ 2]  339         lda     #0x01
   1E3F 8D 17 02      [ 4]  340         sta     U18_17
   1E42 C6 50         [ 5]  341         dec     RAM_50
   1E44 C6 51         [ 5]  342         dec     RAM_51
   1E46 C6 52         [ 5]  343         dec     RAM_52
   1E48 C6 53         [ 5]  344         dec     RAM_53
   1E4A D0 12         [ 4]  345         bne     L1E5E
   1E4C A9 64         [ 2]  346         lda     #0x64
   1E4E 85 53         [ 3]  347         sta     RAM_53
   1E50 C6 54         [ 5]  348         dec     RAM_54
   1E52 C6 55         [ 5]  349         dec     RAM_55
   1E54 C6 56         [ 5]  350         dec     RAM_56
   1E56 D0 06         [ 4]  351         bne     L1E5E
   1E58 A9 64         [ 2]  352         lda     #0x64
   1E5A 85 56         [ 3]  353         sta     RAM_56
   1E5C C6 57         [ 5]  354         dec     RAM_57
   1E5E                     355 L1E5E:
   1E5E 60            [ 6]  356         rts
                            357 ;
   1E5F                     358 L1E5F:
   1E5F A9 00         [ 2]  359         lda     #0x00
   1E61 85 61         [ 3]  360         sta     RAM_61
   1E63 85 62         [ 3]  361         sta     RAM_62
   1E65 A9 0A         [ 2]  362         lda     #0x0A
   1E67 85 54         [ 3]  363         sta     RAM_54
   1E69                     364 L1E69:
   1E69 20 13 1E      [ 6]  365         jsr     L1E13
   1E6C A5 54         [ 3]  366         lda     RAM_54
   1E6E D0 F9         [ 4]  367         bne     L1E69
   1E70 A9 0A         [ 2]  368         lda     #0x0A
   1E72 85 54         [ 3]  369         sta     RAM_54
   1E74 A5 62         [ 3]  370         lda     RAM_62
   1E76 C9 08         [ 2]  371         cmp     #0x08
   1E78 F0 15         [ 4]  372         beq     L1E8F
   1E7A E6 62         [ 5]  373         inc     RAM_62
   1E7C A2 09         [ 2]  374         ldx     #0x09
   1E7E 38            [ 2]  375         sec
   1E7F AD 80 03      [ 4]  376         lda     audio_periph$ddr_reg_a
   1E82                     377 L1E82:
   1E82 2A            [ 2]  378         rol     a
   1E83 CA            [ 2]  379         dex
   1E84 90 FC         [ 4]  380         bcc     L1E82
   1E86 18            [ 2]  381         clc
   1E87 8A            [ 2]  382         txa
   1E88 65 61         [ 3]  383         adc     RAM_61
   1E8A 85 61         [ 3]  384         sta     RAM_61
   1E8C 4C 69 1E      [ 3]  385         jmp     L1E69
                            386 ;
   1E8F                     387 L1E8F:
   1E8F 46 61         [ 5]  388         lsr     RAM_61
   1E91 46 61         [ 5]  389         lsr     RAM_61
   1E93 46 61         [ 5]  390         lsr     RAM_61
   1E95 A5 61         [ 3]  391         lda     RAM_61
   1E97 85 60         [ 3]  392         sta     RAM_60
   1E99 A9 00         [ 2]  393         lda     #0x00
   1E9B 85 61         [ 3]  394         sta     RAM_61
   1E9D 85 62         [ 3]  395         sta     RAM_62
   1E9F 60            [ 6]  396         rts
                            397 ;
   1EA0                     398 L1EA0:
   1EA0 AD 80 02      [ 4]  399         lda     U19_PORTA
   1EA3 49 FF         [ 2]  400         eor     #0xFF
   1EA5 4A            [ 2]  401         lsr     a
   1EA6 4A            [ 2]  402         lsr     a
   1EA7 4A            [ 2]  403         lsr     a
   1EA8 4A            [ 2]  404         lsr     a
   1EA9 18            [ 2]  405         clc
   1EAA 65 60         [ 3]  406         adc     RAM_60
   1EAC AA            [ 2]  407         tax
   1EAD BD D3 1E      [ 5]  408         lda     X1ED3,x
   1EB0 85 63         [ 3]  409         sta     RAM_63
   1EB2 A5 52         [ 3]  410         lda     RAM_52
   1EB4 D0 16         [ 4]  411         bne     L1ECC
   1EB6 A9 0A         [ 2]  412         lda     #0x0A
   1EB8 85 52         [ 3]  413         sta     RAM_52
   1EBA A5 63         [ 3]  414         lda     RAM_63
   1EBC CD 82 03      [ 4]  415         cmp     audio_periph$ddr_reg_b
   1EBF 90 08         [ 4]  416         bcc     L1EC9
   1EC1 F0 09         [ 4]  417         beq     L1ECC
   1EC3 EE 82 03      [ 6]  418         inc     audio_periph$ddr_reg_b
   1EC6 4C CC 1E      [ 3]  419         jmp     L1ECC
                            420 ;
   1EC9                     421 L1EC9:
   1EC9 CE 82 03      [ 6]  422         dec     audio_periph$ddr_reg_b
   1ECC                     423 L1ECC:
   1ECC AD 82 03      [ 4]  424         lda     audio_periph$ddr_reg_b
   1ECF 8D 82 02      [ 4]  425         sta     U19_PORTB
   1ED2 60            [ 6]  426         rts
                            427 ;
   1ED3                     428 X1ED3:
   1ED3 03 04 06 08         429         .db     0x03, 0x04, 0x06, 0x08
   1ED7 10 16 20 2D         430         .db     0x10, 0x16, 0x20, 0x2D
   1EDB 40 5A 80 BF         431         .db     0x40, 0x5A, 0x80, 0xBF
   1EDF FF FF FF FF         432         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1EE3 FF                  433         .db     0xFF
                            434 ;
                            435 ; all ff's in this gap
                            436 ;
   1FFC                     437         .org    0x1FFC
                            438 ;
                            439 ; vectors
                            440 ;
   1FFC                     441 RESETVEC:
   1FFC 00 1C               442         .dw     RESET
   1FFE                     443 IRQVEC:
   1FFE FF FF               444         .dw     0xFFFF
