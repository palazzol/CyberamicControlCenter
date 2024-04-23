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
                             11 ; start of RAM
                     0000    12 RAM_start = 0x0000
                             13 
                     0002    14 RAM_02 = 0x0002
                     0008    15 RAM_08 = 0x0008
                     0050    16 RAM_50 = 0x0050
                     0051    17 RAM_51 = 0x0051
                     0052    18 RAM_52 = 0x0052
                     0053    19 RAM_53 = 0x0053
                     0054    20 RAM_54 = 0x0054
                     0055    21 RAM_55 = 0x0055
                     0056    22 RAM_56 = 0x0056
                     0057    23 RAM_57 = 0x0057
                     0058    24 RAM_58 = 0x0058
                     0059    25 RAM_59 = 0x0059
                     005A    26 RAM_5A = 0x005A
                     005B    27 RAM_5B = 0x005B
                     005C    28 RAM_5C = 0x005C
                     005D    29 RAM_5D = 0x005D
                     005E    30 RAM_5E = 0x005E
                     005F    31 RAM_5F = 0x005F
                     0060    32 RAM_60 = 0x0060
                     0061    33 RAM_61 = 0x0061
                     0062    34 RAM_62 = 0x0062
                     0063    35 RAM_63 = 0x0063
                     0064    36 RAM_64 = 0x0064
                             37 
                     0080    38 board_1_periph$ddr_reg_a   = 0x0080
                     0081    39 board_1_control_reg_a      = 0x0081
                     0082    40 board_1_periph$ddr_reg_b   = 0x0082
                     0083    41 board_1_control_reg_b      = 0x0083
                     0086    42 board_2_periph$ddr_reg_b   = 0x0086
                     008A    43 board_3_periph$ddr_reg_b   = 0x008A
                     008E    44 board_4_periph$ddr_reg_b   = 0x008E
                     0200    45 U18_PORTA                  = 0x0200
                     0201    46 U18_DDRA                   = 0x0201
                     0202    47 U18_PORTB                  = 0x0202
                     0203    48 U18_DDRB                   = 0x0203
                     0204    49 U18_edge_detect_control_DI_neg = 0x0204
                     0205    50 U18_edge_detect_control_DI_pos = 0x0205
                     0215    51 U18_timer_8T_DI            = 0x0215
                     0280    52 U19_PORTA                  = 0x0280
                     0281    53 U19_DDRA                   = 0x0281
                     0282    54 U19_PORTB                  = 0x0282
                     0283    55 U19_DDRB                   = 0x0283
                     0300    56 transport_periph$ddr_reg_a = 0x0300
                     0301    57 transport_control_reg_a    = 0x0301
                     0302    58 transport_periph$ddr_reg_b = 0x0302
                     0303    59 transport_control_reg_b    = 0x0303
                     0380    60 audio_periph$ddr_reg_a     = 0x0380
                     0381    61 audio_control_reg_a        = 0x0381
                     0382    62 audio_periph$ddr_reg_b     = 0x0382
                     0383    63 audio_control_reg_b        = 0x0383
                             64 
   1C00                      65         .org    0x1C00
                             66 ;
   1C00                      67 RESET:
   1C00 D8            [ 2]   68         cld
   1C01 78            [ 2]   69         sei
   1C02 A2 F0         [ 2]   70         ldx     #0xF0
   1C04 9A            [ 2]   71         txs
   1C05 A9 00         [ 2]   72         lda     #0x00
   1C07 A2 10         [ 2]   73         ldx     #0x10
   1C09                      74 L1C09:
   1C09 95 00         [ 4]   75         sta     RAM_start,x
   1C0B E8            [ 2]   76         inx
   1C0C E0 80         [ 2]   77         cpx     #0x80
   1C0E D0 F9         [ 4]   78         bne     L1C09
   1C10 A9 00         [ 2]   79         lda     #0x00
   1C12 8D 01 03      [ 4]   80         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   81         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   82         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   83         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   84         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   85         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   86         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   87         sta     U18_DDRA
   1C2A A9 02         [ 2]   88         lda     #0x02
   1C2C 8D 81 02      [ 4]   89         sta     U19_DDRA
   1C2F A9 FF         [ 2]   90         lda     #0xFF
   1C31 8D 82 03      [ 4]   91         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   92         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   93         sta     U19_DDRB
   1C3A A9 FC         [ 2]   94         lda     #0xFC
   1C3C 8D 02 03      [ 4]   95         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   96         lda     #0x2E
   1C41 8D 01 03      [ 4]   97         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]   98         sta     transport_control_reg_b
   1C47 8D 83 03      [ 4]   99         sta     audio_control_reg_b
   1C4A 8D 81 03      [ 4]  100         sta     audio_control_reg_a
   1C4D A9 64         [ 2]  101         lda     #0x64
   1C4F 85 53         [ 3]  102         sta     RAM_53
   1C51 A9 30         [ 2]  103         lda     #0x30
   1C53 85 56         [ 3]  104         sta     RAM_56
   1C55 A9 64         [ 2]  105         lda     #0x64
   1C57 85 55         [ 3]  106         sta     RAM_55
   1C59 A9 10         [ 2]  107         lda     #0x10
   1C5B 85 63         [ 3]  108         sta     RAM_63
   1C5D A9 10         [ 2]  109         lda     #0x10
   1C5F 20 55 1D      [ 6]  110         jsr     L1D55
   1C62 A9 28         [ 2]  111         lda     #0x28
   1C64 85 54         [ 3]  112         sta     RAM_54
   1C66 A9 64         [ 2]  113         lda     #0x64
   1C68 85 53         [ 3]  114         sta     RAM_53
   1C6A                     115 L1C6A:
   1C6A 20 6B 1E      [ 6]  116         jsr     L1E6B
   1C6D A5 54         [ 3]  117         lda     RAM_54
   1C6F D0 F9         [ 4]  118         bne     L1C6A
   1C71                     119 L1C71:
   1C71 A9 40         [ 2]  120         lda     #0x40
   1C73 20 69 1D      [ 6]  121         jsr     L1D69
   1C76                     122 L1C76:
   1C76 A9 00         [ 2]  123         lda     #0x00
   1C78 85 58         [ 3]  124         sta     RAM_58
   1C7A                     125 L1C7A:
   1C7A 20 6B 1E      [ 6]  126         jsr     L1E6B
   1C7D AD 03 03      [ 4]  127         lda     transport_control_reg_b
   1C80 10 F8         [ 4]  128         bpl     L1C7A
   1C82 A9 06         [ 2]  129         lda     #0x06
   1C84 85 54         [ 3]  130         sta     RAM_54
   1C86 A9 64         [ 2]  131         lda     #0x64
   1C88 85 53         [ 3]  132         sta     RAM_53
   1C8A                     133 L1C8A:
   1C8A 20 6B 1E      [ 6]  134         jsr     L1E6B
   1C8D AD 03 03      [ 4]  135         lda     transport_control_reg_b
   1C90 10 0B         [ 4]  136         bpl     L1C9D
   1C92 E6 58         [ 5]  137         inc     RAM_58
   1C94 AD 02 03      [ 4]  138         lda     transport_periph$ddr_reg_b
   1C97 A5 58         [ 3]  139         lda     RAM_58
   1C99 C9 64         [ 2]  140         cmp     #0x64
   1C9B B0 0B         [ 4]  141         bcs     L1CA8
   1C9D                     142 L1C9D:
   1C9D A5 54         [ 3]  143         lda     RAM_54
   1C9F D0 E9         [ 4]  144         bne     L1C8A
   1CA1 4C 76 1C      [ 3]  145         jmp     L1C76
                            146 ;
                            147         ; this code is skipped
   1CA4 C9 60         [ 2]  148         cmp     #0x60
   1CA6 90 00         [ 4]  149         bcc     L1CA8
   1CA8                     150 L1CA8:
   1CA8 A9 20         [ 2]  151         lda     #0x20
   1CAA 20 69 1D      [ 6]  152         jsr     L1D69
   1CAD A9 19         [ 2]  153         lda     #0x19
   1CAF 85 54         [ 3]  154         sta     RAM_54
   1CB1 A9 64         [ 2]  155         lda     #0x64
   1CB3 85 53         [ 3]  156         sta     RAM_53
   1CB5                     157 L1CB5:
   1CB5 20 6B 1E      [ 6]  158         jsr     L1E6B
   1CB8 A5 54         [ 3]  159         lda     RAM_54
   1CBA D0 F9         [ 4]  160         bne     L1CB5
   1CBC A9 00         [ 2]  161         lda     #0x00
   1CBE 85 59         [ 3]  162         sta     RAM_59
   1CC0 20 78 1D      [ 6]  163         jsr     L1D78
   1CC3 E6 59         [ 5]  164         inc     RAM_59
   1CC5 A9 10         [ 2]  165         lda     #0x10
   1CC7 20 55 1D      [ 6]  166         jsr     L1D55
   1CCA A9 80         [ 2]  167         lda     #0x80
   1CCC 20 55 1D      [ 6]  168         jsr     L1D55
   1CCF 20 A6 1D      [ 6]  169         jsr     L1DA6
   1CD2 A9 10         [ 2]  170         lda     #0x10
   1CD4 20 55 1D      [ 6]  171         jsr     L1D55
   1CD7 20 32 1D      [ 6]  172         jsr     L1D32
   1CDA                     173 L1CDA:
   1CDA 20 6B 1E      [ 6]  174         jsr     L1E6B
   1CDD 20 0C 1F      [ 6]  175         jsr     L1F0C
   1CE0 A5 5A         [ 3]  176         lda     RAM_5A
   1CE2 D0 10         [ 4]  177         bne     L1CF4
   1CE4 A9 02         [ 2]  178         lda     #0x02
   1CE6 8D 80 02      [ 4]  179         sta     U19_PORTA
   1CE9 A9 00         [ 2]  180         lda     #0x00
   1CEB 8D 02 02      [ 4]  181         sta     U18_PORTB
   1CEE A5 56         [ 3]  182         lda     RAM_56
   1CF0 D0 E8         [ 4]  183         bne     L1CDA
   1CF2 E6 5A         [ 5]  184         inc     RAM_5A
   1CF4                     185 L1CF4:
   1CF4 20 32 1D      [ 6]  186         jsr     L1D32
   1CF7 A9 00         [ 2]  187         lda     #0x00
   1CF9 8D 80 02      [ 4]  188         sta     U19_PORTA
   1CFC A9 80         [ 2]  189         lda     #0x80
   1CFE 8D 02 02      [ 4]  190         sta     U18_PORTB
   1D01 A9 80         [ 2]  191         lda     #0x80
   1D03 20 55 1D      [ 6]  192         jsr     L1D55
   1D06 20 A6 1D      [ 6]  193         jsr     L1DA6
   1D09 C6 5A         [ 5]  194         dec     RAM_5A
   1D0B 20 CC 1D      [ 6]  195         jsr     L1DCC
   1D0E 20 32 1D      [ 6]  196         jsr     L1D32
   1D11 A9 30         [ 2]  197         lda     #0x30
   1D13 85 56         [ 3]  198         sta     RAM_56
   1D15 A9 64         [ 2]  199         lda     #0x64
   1D17 85 55         [ 3]  200         sta     RAM_55
   1D19 E6 59         [ 5]  201         inc     RAM_59
   1D1B A5 59         [ 3]  202         lda     RAM_59
   1D1D C9 1A         [ 2]  203         cmp     #0x1A
   1D1F 90 03         [ 4]  204         bcc     L1D24
   1D21 4C 71 1C      [ 3]  205         jmp     L1C71
                            206 ;
   1D24                     207 L1D24:
   1D24 20 A6 1D      [ 6]  208         jsr     L1DA6
   1D27 A9 10         [ 2]  209         lda     #0x10
   1D29 20 55 1D      [ 6]  210         jsr     L1D55
   1D2C 20 C3 1E      [ 6]  211         jsr     L1EC3
   1D2F 4C DA 1C      [ 3]  212         jmp     L1CDA
                            213 ;
   1D32                     214 L1D32:
   1D32 A2 00         [ 2]  215         ldx     #0x00
   1D34                     216 L1D34:
   1D34 A9 30         [ 2]  217         lda     #0x30
   1D36 95 81         [ 4]  218         sta     board_1_control_reg_a,x
   1D38 95 83         [ 4]  219         sta     board_1_control_reg_b,x
   1D3A A9 FF         [ 2]  220         lda     #0xFF
   1D3C 95 80         [ 4]  221         sta     board_1_periph$ddr_reg_a,x
   1D3E 95 82         [ 4]  222         sta     board_1_periph$ddr_reg_b,x
   1D40 A9 34         [ 2]  223         lda     #0x34
   1D42 95 81         [ 4]  224         sta     board_1_control_reg_a,x
   1D44 95 83         [ 4]  225         sta     board_1_control_reg_b,x
   1D46 A9 00         [ 2]  226         lda     #0x00
   1D48 95 80         [ 4]  227         sta     board_1_periph$ddr_reg_a,x
   1D4A 95 82         [ 4]  228         sta     board_1_periph$ddr_reg_b,x
   1D4C E8            [ 2]  229         inx
   1D4D E8            [ 2]  230         inx
   1D4E E8            [ 2]  231         inx
   1D4F E8            [ 2]  232         inx
   1D50 E0 20         [ 2]  233         cpx     #0x20
   1D52 90 E0         [ 4]  234         bcc     L1D34
   1D54 60            [ 6]  235         rts
                            236 ;
   1D55                     237 L1D55:
   1D55 8D 02 03      [ 4]  238         sta     transport_periph$ddr_reg_b
   1D58 A9 FF         [ 2]  239         lda     #0xFF
   1D5A 85 50         [ 3]  240         sta     RAM_50
   1D5C                     241 L1D5C:
   1D5C 20 6B 1E      [ 6]  242         jsr     L1E6B
   1D5F A5 50         [ 3]  243         lda     RAM_50
   1D61 D0 F9         [ 4]  244         bne     L1D5C
   1D63 A9 00         [ 2]  245         lda     #0x00
   1D65 8D 02 03      [ 4]  246         sta     transport_periph$ddr_reg_b
   1D68 60            [ 6]  247         rts
                            248 ;
   1D69                     249 L1D69:
   1D69 8D 02 03      [ 4]  250         sta     transport_periph$ddr_reg_b
   1D6C A9 FA         [ 2]  251         lda     #0xFA
   1D6E 85 50         [ 3]  252         sta     RAM_50
   1D70                     253 L1D70:
   1D70 20 6B 1E      [ 6]  254         jsr     L1E6B
   1D73 A5 50         [ 3]  255         lda     RAM_50
   1D75 D0 F9         [ 4]  256         bne     L1D70
   1D77 60            [ 6]  257         rts
                            258 ;
   1D78                     259 L1D78:
   1D78 A9 00         [ 2]  260         lda     #0x00
   1D7A 85 58         [ 3]  261         sta     RAM_58
   1D7C                     262 L1D7C:
   1D7C 20 6B 1E      [ 6]  263         jsr     L1E6B
   1D7F AD 03 03      [ 4]  264         lda     transport_control_reg_b
   1D82 10 F8         [ 4]  265         bpl     L1D7C
   1D84 A9 FA         [ 2]  266         lda     #0xFA
   1D86 85 50         [ 3]  267         sta     RAM_50
   1D88                     268 L1D88:
   1D88 20 6B 1E      [ 6]  269         jsr     L1E6B
   1D8B AD 03 03      [ 4]  270         lda     transport_control_reg_b
   1D8E 10 0B         [ 4]  271         bpl     L1D9B
   1D90 E6 58         [ 5]  272         inc     RAM_58
   1D92 AD 02 03      [ 4]  273         lda     transport_periph$ddr_reg_b
   1D95 A5 58         [ 3]  274         lda     RAM_58
   1D97 C9 60         [ 2]  275         cmp     #0x60
   1D99 B0 0A         [ 4]  276         bcs     L1DA5
   1D9B                     277 L1D9B:
   1D9B A5 50         [ 3]  278         lda     RAM_50
   1D9D D0 E9         [ 4]  279         bne     L1D88
   1D9F A5 58         [ 3]  280         lda     RAM_58
   1DA1 C9 20         [ 2]  281         cmp     #0x20
   1DA3 90 D3         [ 4]  282         bcc     L1D78
   1DA5                     283 L1DA5:
   1DA5 60            [ 6]  284         rts
                            285 ;
   1DA6                     286 L1DA6:
   1DA6 A9 FA         [ 2]  287         lda     #0xFA
   1DA8 85 50         [ 3]  288         sta     RAM_50
   1DAA                     289 L1DAA:
   1DAA 20 6B 1E      [ 6]  290         jsr     L1E6B
   1DAD A5 50         [ 3]  291         lda     RAM_50
   1DAF D0 F9         [ 4]  292         bne     L1DAA
   1DB1                     293 L1DB1:
   1DB1 20 6B 1E      [ 6]  294         jsr     L1E6B
   1DB4 AD 02 03      [ 4]  295         lda     transport_periph$ddr_reg_b
   1DB7 6A            [ 2]  296         ror     a
   1DB8 90 F7         [ 4]  297         bcc     L1DB1
   1DBA A9 A0         [ 2]  298         lda     #0xA0
   1DBC 85 50         [ 3]  299         sta     RAM_50
   1DBE                     300 L1DBE:
   1DBE 20 6B 1E      [ 6]  301         jsr     L1E6B
   1DC1 AD 02 03      [ 4]  302         lda     transport_periph$ddr_reg_b
   1DC4 6A            [ 2]  303         ror     a
   1DC5 90 EA         [ 4]  304         bcc     L1DB1
   1DC7 A5 50         [ 3]  305         lda     RAM_50
   1DC9 D0 F3         [ 4]  306         bne     L1DBE
   1DCB 60            [ 6]  307         rts
                            308 ;
   1DCC                     309 L1DCC:
   1DCC AD 00 03      [ 4]  310         lda     transport_periph$ddr_reg_a
   1DCF A9 40         [ 2]  311         lda     #0x40
   1DD1 85 82         [ 3]  312         sta     board_1_periph$ddr_reg_b
   1DD3 85 86         [ 3]  313         sta     board_2_periph$ddr_reg_b
   1DD5 85 8A         [ 3]  314         sta     board_3_periph$ddr_reg_b
   1DD7 85 8E         [ 3]  315         sta     board_4_periph$ddr_reg_b
   1DD9                     316 L1DD9:
   1DD9 AD 02 03      [ 4]  317         lda     transport_periph$ddr_reg_b
   1DDC 4A            [ 2]  318         lsr     a
   1DDD 90 11         [ 4]  319         bcc     L1DF0
   1DDF 20 0C 1F      [ 6]  320         jsr     L1F0C
   1DE2 20 6B 1E      [ 6]  321         jsr     L1E6B
   1DE5 AD 01 03      [ 4]  322         lda     transport_control_reg_a
   1DE8 10 EF         [ 4]  323         bpl     L1DD9
   1DEA 20 02 1E      [ 6]  324         jsr     L1E02
   1DED 4C D9 1D      [ 3]  325         jmp     L1DD9
                            326 ;
   1DF0                     327 L1DF0:
   1DF0 A9 64         [ 2]  328         lda     #0x64
   1DF2 85 50         [ 3]  329         sta     RAM_50
   1DF4                     330 L1DF4:
   1DF4 20 6B 1E      [ 6]  331         jsr     L1E6B
   1DF7 AD 02 03      [ 4]  332         lda     transport_periph$ddr_reg_b
   1DFA 4A            [ 2]  333         lsr     a
   1DFB B0 CF         [ 4]  334         bcs     L1DCC
   1DFD A5 50         [ 3]  335         lda     RAM_50
   1DFF D0 F3         [ 4]  336         bne     L1DF4
   1E01 60            [ 6]  337         rts
                            338 ;
   1E02                     339 L1E02:
   1E02 AD 00 03      [ 4]  340         lda     transport_periph$ddr_reg_a
   1E05 29 7F         [ 2]  341         and     #0x7F
   1E07 85 5C         [ 3]  342         sta     RAM_5C
   1E09 29 7E         [ 2]  343         and     #0x7E
   1E0B C9 22         [ 2]  344         cmp     #0x22
   1E0D F0 3A         [ 4]  345         beq     L1E49
   1E0F C9 32         [ 2]  346         cmp     #0x32
   1E11 90 4F         [ 4]  347         bcc     L1E62
   1E13 C9 3A         [ 2]  348         cmp     #0x3A
   1E15 90 32         [ 4]  349         bcc     L1E49
   1E17 A5 5C         [ 3]  350         lda     RAM_5C
   1E19 C9 41         [ 2]  351         cmp     #0x41
   1E1B 90 45         [ 4]  352         bcc     L1E62
   1E1D C9 51         [ 2]  353         cmp     #0x51
   1E1F B0 41         [ 4]  354         bcs     L1E62
   1E21 A6 64         [ 3]  355         ldx     RAM_64
   1E23 38            [ 2]  356         sec
   1E24 E9 41         [ 2]  357         sbc     #0x41
   1E26 C9 08         [ 2]  358         cmp     #0x08
   1E28 90 02         [ 4]  359         bcc     L1E2C
   1E2A E8            [ 2]  360         inx
   1E2B E8            [ 2]  361         inx
   1E2C                     362 L1E2C:
   1E2C 29 07         [ 2]  363         and     #0x07
   1E2E A8            [ 2]  364         tay
   1E2F B9 63 1E      [ 5]  365         lda     X1E63,y
   1E32 85 5D         [ 3]  366         sta     RAM_5D
   1E34 A5 5E         [ 3]  367         lda     RAM_5E
   1E36 4A            [ 2]  368         lsr     a
   1E37 B0 09         [ 4]  369         bcs     L1E42
   1E39 A5 5D         [ 3]  370         lda     RAM_5D
   1E3B 49 FF         [ 2]  371         eor     #0xFF
   1E3D 35 00         [ 4]  372         and     RAM_start,x
   1E3F 95 00         [ 4]  373         sta     RAM_start,x
   1E41 60            [ 6]  374         rts
                            375 ;
   1E42                     376 L1E42:
   1E42 A5 5D         [ 3]  377         lda     RAM_5D
   1E44 15 00         [ 4]  378         ora     RAM_start,x
   1E46 95 00         [ 4]  379         sta     RAM_start,x
   1E48 60            [ 6]  380         rts
                            381 ;
   1E49                     382 L1E49:
   1E49 A5 5C         [ 3]  383         lda     RAM_5C
   1E4B 85 5E         [ 3]  384         sta     RAM_5E
   1E4D 29 7E         [ 2]  385         and     #0x7E
   1E4F C9 22         [ 2]  386         cmp     #0x22
   1E51 D0 05         [ 4]  387         bne     L1E58
   1E53 A9 98         [ 2]  388         lda     #0x98
   1E55 85 64         [ 3]  389         sta     RAM_64
   1E57 60            [ 6]  390         rts
                            391 ;
   1E58                     392 L1E58:
   1E58 38            [ 2]  393         sec
   1E59 E9 32         [ 2]  394         sbc     #0x32
   1E5B 0A            [ 2]  395         asl     a
   1E5C 18            [ 2]  396         clc
   1E5D 69 80         [ 2]  397         adc     #0x80
   1E5F 85 64         [ 3]  398         sta     RAM_64
   1E61 60            [ 6]  399         rts
   1E62                     400 L1E62:
   1E62 60            [ 6]  401         rts
                            402 ;
   1E63                     403 X1E63:
   1E63 01 02 04 08         404         .db     0x01, 0x02, 0x04, 0x08
   1E67 10 20 40 80         405         .db     0x10, 0x20, 0x40, 0x80
                            406 ;
   1E6B                     407 L1E6B:
   1E6B AD 05 02      [ 4]  408         lda     U18_edge_detect_control_DI_pos
   1E6E 85 5F         [ 3]  409         sta     RAM_5F
   1E70 F0 50         [ 4]  410         beq     L1EC2
   1E72 A5 5B         [ 3]  411         lda     RAM_5B
   1E74 30 0E         [ 4]  412         bmi     L1E84
   1E76 A5 5F         [ 3]  413         lda     RAM_5F
   1E78 29 40         [ 2]  414         and     #0x40
   1E7A F0 16         [ 4]  415         beq     L1E92
   1E7C A9 80         [ 2]  416         lda     #0x80
   1E7E 85 5B         [ 3]  417         sta     RAM_5B
   1E80 A9 FA         [ 2]  418         lda     #0xFA
   1E82 85 51         [ 3]  419         sta     RAM_51
   1E84                     420 L1E84:
   1E84 A5 51         [ 3]  421         lda     RAM_51
   1E86 D0 06         [ 4]  422         bne     L1E8E
   1E88 A9 00         [ 2]  423         lda     #0x00
   1E8A 85 5B         [ 3]  424         sta     RAM_5B
   1E8C E6 5A         [ 5]  425         inc     RAM_5A
   1E8E                     426 L1E8E:
   1E8E A5 5F         [ 3]  427         lda     RAM_5F
   1E90 10 30         [ 4]  428         bpl     L1EC2
   1E92                     429 L1E92:
   1E92 AD 04 02      [ 4]  430         lda     U18_edge_detect_control_DI_neg
   1E95 49 FF         [ 2]  431         eor     #0xFF
   1E97 4A            [ 2]  432         lsr     a
   1E98 4A            [ 2]  433         lsr     a
   1E99 4A            [ 2]  434         lsr     a
   1E9A 85 57         [ 3]  435         sta     RAM_57
   1E9C 90 02         [ 4]  436         bcc     L1EA0
   1E9E E6 57         [ 5]  437         inc     RAM_57
   1EA0                     438 L1EA0:
   1EA0 A9 7A         [ 2]  439         lda     #0x7A
   1EA2 38            [ 2]  440         sec
   1EA3 E5 57         [ 3]  441         sbc     RAM_57
   1EA5 8D 15 02      [ 4]  442         sta     U18_timer_8T_DI
   1EA8 C6 50         [ 5]  443         dec     RAM_50
   1EAA C6 51         [ 5]  444         dec     RAM_51
   1EAC C6 52         [ 5]  445         dec     RAM_52
   1EAE C6 53         [ 5]  446         dec     RAM_53
   1EB0 D0 10         [ 4]  447         bne     L1EC2
   1EB2 A9 64         [ 2]  448         lda     #0x64
   1EB4 85 53         [ 3]  449         sta     RAM_53
   1EB6 C6 54         [ 5]  450         dec     RAM_54
   1EB8 C6 55         [ 5]  451         dec     RAM_55
   1EBA D0 06         [ 4]  452         bne     L1EC2
   1EBC A9 64         [ 2]  453         lda     #0x64
   1EBE 85 55         [ 3]  454         sta     RAM_55
   1EC0 C6 56         [ 5]  455         dec     RAM_56
   1EC2                     456 L1EC2:
   1EC2 60            [ 6]  457         rts
                            458 ;
   1EC3                     459 L1EC3:
   1EC3 A9 00         [ 2]  460         lda     #0x00
   1EC5 85 61         [ 3]  461         sta     RAM_61
   1EC7 85 62         [ 3]  462         sta     RAM_62
   1EC9 A9 0A         [ 2]  463         lda     #0x0A
   1ECB 85 54         [ 3]  464         sta     RAM_54
   1ECD A9 64         [ 2]  465         lda     #0x64
   1ECF 85 53         [ 3]  466         sta     RAM_53
   1ED1                     467 L1ED1:
   1ED1 20 6B 1E      [ 6]  468         jsr     L1E6B
   1ED4 A5 54         [ 3]  469         lda     RAM_54
   1ED6 D0 F9         [ 4]  470         bne     L1ED1
   1ED8 A9 0A         [ 2]  471         lda     #0x0A
   1EDA 85 54         [ 3]  472         sta     RAM_54
   1EDC A9 64         [ 2]  473         lda     #0x64
   1EDE 85 53         [ 3]  474         sta     RAM_53
   1EE0 A5 62         [ 3]  475         lda     RAM_62
   1EE2 C9 08         [ 2]  476         cmp     #0x08
   1EE4 F0 15         [ 4]  477         beq     L1EFB
   1EE6 E6 62         [ 5]  478         inc     RAM_62
   1EE8 A2 09         [ 2]  479         ldx     #0x09
   1EEA 38            [ 2]  480         sec
   1EEB AD 80 03      [ 4]  481         lda     audio_periph$ddr_reg_a
   1EEE                     482 L1EEE:
   1EEE 2A            [ 2]  483         rol     a
   1EEF CA            [ 2]  484         dex
   1EF0 90 FC         [ 4]  485         bcc     L1EEE
   1EF2 18            [ 2]  486         clc
   1EF3 8A            [ 2]  487         txa
   1EF4 65 61         [ 3]  488         adc     RAM_61
   1EF6 85 61         [ 3]  489         sta     RAM_61
   1EF8 4C D1 1E      [ 3]  490         jmp     L1ED1
                            491 ;
   1EFB                     492 L1EFB:
   1EFB 46 61         [ 5]  493         lsr     RAM_61
   1EFD 46 61         [ 5]  494         lsr     RAM_61
   1EFF 46 61         [ 5]  495         lsr     RAM_61
   1F01 A5 61         [ 3]  496         lda     RAM_61
   1F03 85 60         [ 3]  497         sta     RAM_60
   1F05 A9 00         [ 2]  498         lda     #0x00
   1F07 85 61         [ 3]  499         sta     RAM_61
   1F09 85 62         [ 3]  500         sta     RAM_62
   1F0B 60            [ 6]  501         rts
                            502 ;
   1F0C                     503 L1F0C:
   1F0C AD 80 02      [ 4]  504         lda     U19_PORTA
   1F0F 49 FF         [ 2]  505         eor     #0xFF
   1F11 4A            [ 2]  506         lsr     a
   1F12 4A            [ 2]  507         lsr     a
   1F13 4A            [ 2]  508         lsr     a
   1F14 4A            [ 2]  509         lsr     a
   1F15 18            [ 2]  510         clc
   1F16 65 60         [ 3]  511         adc     RAM_60
   1F18 AA            [ 2]  512         tax
   1F19 BD 3F 1F      [ 5]  513         lda     X1F3F,x
   1F1C 85 63         [ 3]  514         sta     RAM_63
   1F1E A5 52         [ 3]  515         lda     RAM_52
   1F20 D0 16         [ 4]  516         bne     L1F38
   1F22 A9 0A         [ 2]  517         lda     #0x0A
   1F24 85 52         [ 3]  518         sta     RAM_52
   1F26 A5 63         [ 3]  519         lda     RAM_63
   1F28 CD 82 03      [ 4]  520         cmp     audio_periph$ddr_reg_b
   1F2B 90 08         [ 4]  521         bcc     L1F35
   1F2D F0 09         [ 4]  522         beq     L1F38
   1F2F EE 82 03      [ 6]  523         inc     audio_periph$ddr_reg_b
   1F32 4C 38 1F      [ 3]  524         jmp     L1F38
                            525 ;
   1F35                     526 L1F35:
   1F35 CE 82 03      [ 6]  527         dec     audio_periph$ddr_reg_b
   1F38                     528 L1F38:
   1F38 AD 82 03      [ 4]  529         lda     audio_periph$ddr_reg_b
   1F3B 8D 82 02      [ 4]  530         sta     U19_PORTB
   1F3E 60            [ 6]  531         rts
                            532 ;
   1F3F                     533 X1F3F:
   1F3F 03 04 06 08         534         .db     0x03, 0x04, 0x06, 0x08
   1F43 10 16 20 2D         535         .db     0x10, 0x16, 0x20, 0x2D
   1F47 40 5A 80 BF         536         .db     0x40, 0x5A, 0x80, 0xBF
   1F4B FF FF FF FF         537         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F4F FF                  538         .db     0xFF
                            539 ;
                            540 ; all zeros in this gap
                            541 ;
   1FFA                     542         .org    0x1FFA
                            543 ;
                            544 ; vectors
                            545 ;
   1FFA                     546 NMIVEC:
   1FFA 00 00               547         .dw     RAM_start
   1FFC                     548 RESETVEC:
   1FFC 00 1C               549         .dw     RESET
   1FFE                     550 IRQVEC:
   1FFE 00 00               551         .dw     RAM_start
