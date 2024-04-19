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
                     0080    38 board_0_periph$ddr_reg_a   = 0x0080
                     0081    39 board_0_control_reg_a      = 0x0081
                     0082    40 board_0_periph$ddr_reg_b   = 0x0082
                     0083    41 board_0_control_reg_b      = 0x0083
                     0086    42 board_1_periph$ddr_reg_b   = 0x0086
                     008A    43 board_2_periph$ddr_reg_b   = 0x008A
                     008E    44 board_3_periph$ddr_reg_b   = 0x008E
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
   1C5F 20 59 1D      [ 6]  110         jsr     L1D55
   1C62 A9 28         [ 2]  111         lda     #0x28
   1C64 85 54         [ 3]  112         sta     RAM_54
   1C66 A9 64         [ 2]  113         lda     #0x64
   1C68 85 53         [ 3]  114         sta     RAM_53
   1C6A                     115 L1C6A:
   1C6A 20 6F 1E      [ 6]  116         jsr     L1E6B
   1C6D A5 54         [ 3]  117         lda     RAM_54
   1C6F D0 F9         [ 4]  118         bne     L1C6A
   1C71                     119 L1C71:
   1C71 A9 40         [ 2]  120         lda     #0x40
   1C73 20 6D 1D      [ 6]  121         jsr     L1D69
   1C76                     122 L1C76:
   1C76 A9 00         [ 2]  123         lda     #0x00
   1C78 85 58         [ 3]  124         sta     RAM_58
   1C7A                     125 L1C7A:
   1C7A 20 6F 1E      [ 6]  126         jsr     L1E6B
   1C7D AD 03 03      [ 4]  127         lda     transport_control_reg_b
   1C80 10 F8         [ 4]  128         bpl     L1C7A
   1C82 A9 06         [ 2]  129         lda     #0x06
   1C84 85 54         [ 3]  130         sta     RAM_54
   1C86 A9 64         [ 2]  131         lda     #0x64
   1C88 85 53         [ 3]  132         sta     RAM_53
   1C8A                     133 L1C8A:
   1C8A 20 6F 1E      [ 6]  134         jsr     L1E6B
   1C8D AD 03 03      [ 4]  135         lda     transport_control_reg_b
   1C90 10 0B         [ 4]  136         bpl     L1C9D
   1C92 E6 58         [ 5]  137         inc     RAM_58
   1C94 AD 02 03      [ 4]  138         lda     transport_periph$ddr_reg_b
   1C97 A5 58         [ 3]  139         lda     RAM_58
   1C99 C9 64         [ 2]  140         cmp     #0x64
   1C9B B0 0F         [ 4]  141         bcs     L1CA8
   1C9D                     142 L1C9D:
   1C9D A5 54         [ 3]  143         lda     RAM_54
   1C9F D0 E9         [ 4]  144         bne     L1C8A
   1CA1 4C 76 1C      [ 3]  145         jmp     L1C76
                            146 ;
   1CA4 C9 60 90 00         147         .db     0xC9, 0x60, 0x90, 0x00
                            148 ; this id the code that was skipped
   1CA8 C9 60         [ 2]  149         cmp     #0x60
   1CAA 90 00         [ 4]  150         bcc     L1CA8
   1CAC                     151 L1CA8:
   1CAC A9 20         [ 2]  152         lda     #0x20
   1CAE 20 6D 1D      [ 6]  153         jsr     L1D69
   1CB1 A9 19         [ 2]  154         lda     #0x19
   1CB3 85 54         [ 3]  155         sta     RAM_54
   1CB5 A9 64         [ 2]  156         lda     #0x64
   1CB7 85 53         [ 3]  157         sta     RAM_53
   1CB9                     158 L1CB5:
   1CB9 20 6F 1E      [ 6]  159         jsr     L1E6B
   1CBC A5 54         [ 3]  160         lda     RAM_54
   1CBE D0 F9         [ 4]  161         bne     L1CB5
   1CC0 A9 00         [ 2]  162         lda     #0x00
   1CC2 85 59         [ 3]  163         sta     RAM_59
   1CC4 20 7C 1D      [ 6]  164         jsr     L1D78
   1CC7 E6 59         [ 5]  165         inc     RAM_59
   1CC9 A9 10         [ 2]  166         lda     #0x10
   1CCB 20 59 1D      [ 6]  167         jsr     L1D55
   1CCE A9 80         [ 2]  168         lda     #0x80
   1CD0 20 59 1D      [ 6]  169         jsr     L1D55
   1CD3 20 AA 1D      [ 6]  170         jsr     L1DA6
   1CD6 A9 10         [ 2]  171         lda     #0x10
   1CD8 20 59 1D      [ 6]  172         jsr     L1D55
   1CDB 20 36 1D      [ 6]  173         jsr     L1D32
   1CDE                     174 L1CDA:
   1CDE 20 6F 1E      [ 6]  175         jsr     L1E6B
   1CE1 20 10 1F      [ 6]  176         jsr     L1F0C
   1CE4 A5 5A         [ 3]  177         lda     RAM_5A
   1CE6 D0 10         [ 4]  178         bne     L1CF4
   1CE8 A9 02         [ 2]  179         lda     #0x02
   1CEA 8D 80 02      [ 4]  180         sta     U19_PORTA
   1CED A9 00         [ 2]  181         lda     #0x00
   1CEF 8D 02 02      [ 4]  182         sta     U18_PORTB
   1CF2 A5 56         [ 3]  183         lda     RAM_56
   1CF4 D0 E8         [ 4]  184         bne     L1CDA
   1CF6 E6 5A         [ 5]  185         inc     RAM_5A
   1CF8                     186 L1CF4:
   1CF8 20 36 1D      [ 6]  187         jsr     L1D32
   1CFB A9 00         [ 2]  188         lda     #0x00
   1CFD 8D 80 02      [ 4]  189         sta     U19_PORTA
   1D00 A9 80         [ 2]  190         lda     #0x80
   1D02 8D 02 02      [ 4]  191         sta     U18_PORTB
   1D05 A9 80         [ 2]  192         lda     #0x80
   1D07 20 59 1D      [ 6]  193         jsr     L1D55
   1D0A 20 AA 1D      [ 6]  194         jsr     L1DA6
   1D0D C6 5A         [ 5]  195         dec     RAM_5A
   1D0F 20 D0 1D      [ 6]  196         jsr     L1DCC
   1D12 20 36 1D      [ 6]  197         jsr     L1D32
   1D15 A9 30         [ 2]  198         lda     #0x30
   1D17 85 56         [ 3]  199         sta     RAM_56
   1D19 A9 64         [ 2]  200         lda     #0x64
   1D1B 85 55         [ 3]  201         sta     RAM_55
   1D1D E6 59         [ 5]  202         inc     RAM_59
   1D1F A5 59         [ 3]  203         lda     RAM_59
   1D21 C9 1A         [ 2]  204         cmp     #0x1A
   1D23 90 03         [ 4]  205         bcc     L1D24
   1D25 4C 71 1C      [ 3]  206         jmp     L1C71
                            207 ;
   1D28                     208 L1D24:
   1D28 20 AA 1D      [ 6]  209         jsr     L1DA6
   1D2B A9 10         [ 2]  210         lda     #0x10
   1D2D 20 59 1D      [ 6]  211         jsr     L1D55
   1D30 20 C7 1E      [ 6]  212         jsr     L1EC3
   1D33 4C DE 1C      [ 3]  213         jmp     L1CDA
                            214 ;
   1D36                     215 L1D32:
   1D36 A2 00         [ 2]  216         ldx     #0x00
   1D38                     217 L1D34:
   1D38 A9 30         [ 2]  218         lda     #0x30
   1D3A 95 81         [ 4]  219         sta     board_0_control_reg_a,x
   1D3C 95 83         [ 4]  220         sta     board_0_control_reg_b,x
   1D3E A9 FF         [ 2]  221         lda     #0xFF
   1D40 95 80         [ 4]  222         sta     board_0_periph$ddr_reg_a,x
   1D42 95 82         [ 4]  223         sta     board_0_periph$ddr_reg_b,x
   1D44 A9 34         [ 2]  224         lda     #0x34
   1D46 95 81         [ 4]  225         sta     board_0_control_reg_a,x
   1D48 95 83         [ 4]  226         sta     board_0_control_reg_b,x
   1D4A A9 00         [ 2]  227         lda     #0x00
   1D4C 95 80         [ 4]  228         sta     board_0_periph$ddr_reg_a,x
   1D4E 95 82         [ 4]  229         sta     board_0_periph$ddr_reg_b,x
   1D50 E8            [ 2]  230         inx
   1D51 E8            [ 2]  231         inx
   1D52 E8            [ 2]  232         inx
   1D53 E8            [ 2]  233         inx
   1D54 E0 20         [ 2]  234         cpx     #0x20
   1D56 90 E0         [ 4]  235         bcc     L1D34
   1D58 60            [ 6]  236         rts
                            237 ;
   1D59                     238 L1D55:
   1D59 8D 02 03      [ 4]  239         sta     transport_periph$ddr_reg_b
   1D5C A9 FF         [ 2]  240         lda     #0xFF
   1D5E 85 50         [ 3]  241         sta     RAM_50
   1D60                     242 L1D5C:
   1D60 20 6F 1E      [ 6]  243         jsr     L1E6B
   1D63 A5 50         [ 3]  244         lda     RAM_50
   1D65 D0 F9         [ 4]  245         bne     L1D5C
   1D67 A9 00         [ 2]  246         lda     #0x00
   1D69 8D 02 03      [ 4]  247         sta     transport_periph$ddr_reg_b
   1D6C 60            [ 6]  248         rts
                            249 ;
   1D6D                     250 L1D69:
   1D6D 8D 02 03      [ 4]  251         sta     transport_periph$ddr_reg_b
   1D70 A9 FA         [ 2]  252         lda     #0xFA
   1D72 85 50         [ 3]  253         sta     RAM_50
   1D74                     254 L1D70:
   1D74 20 6F 1E      [ 6]  255         jsr     L1E6B
   1D77 A5 50         [ 3]  256         lda     RAM_50
   1D79 D0 F9         [ 4]  257         bne     L1D70
   1D7B 60            [ 6]  258         rts
                            259 ;
   1D7C                     260 L1D78:
   1D7C A9 00         [ 2]  261         lda     #0x00
   1D7E 85 58         [ 3]  262         sta     RAM_58
   1D80                     263 L1D7C:
   1D80 20 6F 1E      [ 6]  264         jsr     L1E6B
   1D83 AD 03 03      [ 4]  265         lda     transport_control_reg_b
   1D86 10 F8         [ 4]  266         bpl     L1D7C
   1D88 A9 FA         [ 2]  267         lda     #0xFA
   1D8A 85 50         [ 3]  268         sta     RAM_50
   1D8C                     269 L1D88:
   1D8C 20 6F 1E      [ 6]  270         jsr     L1E6B
   1D8F AD 03 03      [ 4]  271         lda     transport_control_reg_b
   1D92 10 0B         [ 4]  272         bpl     L1D9B
   1D94 E6 58         [ 5]  273         inc     RAM_58
   1D96 AD 02 03      [ 4]  274         lda     transport_periph$ddr_reg_b
   1D99 A5 58         [ 3]  275         lda     RAM_58
   1D9B C9 60         [ 2]  276         cmp     #0x60
   1D9D B0 0A         [ 4]  277         bcs     L1DA5
   1D9F                     278 L1D9B:
   1D9F A5 50         [ 3]  279         lda     RAM_50
   1DA1 D0 E9         [ 4]  280         bne     L1D88
   1DA3 A5 58         [ 3]  281         lda     RAM_58
   1DA5 C9 20         [ 2]  282         cmp     #0x20
   1DA7 90 D3         [ 4]  283         bcc     L1D78
   1DA9                     284 L1DA5:
   1DA9 60            [ 6]  285         rts
                            286 ;
   1DAA                     287 L1DA6:
   1DAA A9 FA         [ 2]  288         lda     #0xFA
   1DAC 85 50         [ 3]  289         sta     RAM_50
   1DAE                     290 L1DAA:
   1DAE 20 6F 1E      [ 6]  291         jsr     L1E6B
   1DB1 A5 50         [ 3]  292         lda     RAM_50
   1DB3 D0 F9         [ 4]  293         bne     L1DAA
   1DB5                     294 L1DB1:
   1DB5 20 6F 1E      [ 6]  295         jsr     L1E6B
   1DB8 AD 02 03      [ 4]  296         lda     transport_periph$ddr_reg_b
   1DBB 6A            [ 2]  297         ror     a
   1DBC 90 F7         [ 4]  298         bcc     L1DB1
   1DBE A9 A0         [ 2]  299         lda     #0xA0
   1DC0 85 50         [ 3]  300         sta     RAM_50
   1DC2                     301 L1DBE:
   1DC2 20 6F 1E      [ 6]  302         jsr     L1E6B
   1DC5 AD 02 03      [ 4]  303         lda     transport_periph$ddr_reg_b
   1DC8 6A            [ 2]  304         ror     a
   1DC9 90 EA         [ 4]  305         bcc     L1DB1
   1DCB A5 50         [ 3]  306         lda     RAM_50
   1DCD D0 F3         [ 4]  307         bne     L1DBE
   1DCF 60            [ 6]  308         rts
                            309 ;
   1DD0                     310 L1DCC:
   1DD0 AD 00 03      [ 4]  311         lda     transport_periph$ddr_reg_a
   1DD3 A9 40         [ 2]  312         lda     #0x40
   1DD5 85 86         [ 3]  313         sta     board_1_periph$ddr_reg_b
   1DD7 85 8A         [ 3]  314         sta     board_2_periph$ddr_reg_b
   1DD9 85 8E         [ 3]  315         sta     board_3_periph$ddr_reg_b
u  1DDB 85 00         [ 3]  316         sta     board_4_periph$ddr_reg_b
   1DDD                     317 L1DD9:
   1DDD AD 02 03      [ 4]  318         lda     transport_periph$ddr_reg_b
   1DE0 4A            [ 2]  319         lsr     a
   1DE1 90 11         [ 4]  320         bcc     L1DF0
   1DE3 20 10 1F      [ 6]  321         jsr     L1F0C
   1DE6 20 6F 1E      [ 6]  322         jsr     L1E6B
   1DE9 AD 01 03      [ 4]  323         lda     transport_control_reg_a
   1DEC 10 EF         [ 4]  324         bpl     L1DD9
   1DEE 20 06 1E      [ 6]  325         jsr     L1E02
   1DF1 4C DD 1D      [ 3]  326         jmp     L1DD9
                            327 ;
   1DF4                     328 L1DF0:
   1DF4 A9 64         [ 2]  329         lda     #0x64
   1DF6 85 50         [ 3]  330         sta     RAM_50
   1DF8                     331 L1DF4:
   1DF8 20 6F 1E      [ 6]  332         jsr     L1E6B
   1DFB AD 02 03      [ 4]  333         lda     transport_periph$ddr_reg_b
   1DFE 4A            [ 2]  334         lsr     a
   1DFF B0 CF         [ 4]  335         bcs     L1DCC
   1E01 A5 50         [ 3]  336         lda     RAM_50
   1E03 D0 F3         [ 4]  337         bne     L1DF4
   1E05 60            [ 6]  338         rts
                            339 ;
   1E06                     340 L1E02:
   1E06 AD 00 03      [ 4]  341         lda     transport_periph$ddr_reg_a
   1E09 29 7F         [ 2]  342         and     #0x7F
   1E0B 85 5C         [ 3]  343         sta     RAM_5C
   1E0D 29 7E         [ 2]  344         and     #0x7E
   1E0F C9 22         [ 2]  345         cmp     #0x22
   1E11 F0 3A         [ 4]  346         beq     L1E49
   1E13 C9 32         [ 2]  347         cmp     #0x32
   1E15 90 4F         [ 4]  348         bcc     L1E62
   1E17 C9 3A         [ 2]  349         cmp     #0x3A
   1E19 90 32         [ 4]  350         bcc     L1E49
   1E1B A5 5C         [ 3]  351         lda     RAM_5C
   1E1D C9 41         [ 2]  352         cmp     #0x41
   1E1F 90 45         [ 4]  353         bcc     L1E62
   1E21 C9 51         [ 2]  354         cmp     #0x51
   1E23 B0 41         [ 4]  355         bcs     L1E62
   1E25 A6 64         [ 3]  356         ldx     RAM_64
   1E27 38            [ 2]  357         sec
   1E28 E9 41         [ 2]  358         sbc     #0x41
   1E2A C9 08         [ 2]  359         cmp     #0x08
   1E2C 90 02         [ 4]  360         bcc     L1E2C
   1E2E E8            [ 2]  361         inx
   1E2F E8            [ 2]  362         inx
   1E30                     363 L1E2C:
   1E30 29 07         [ 2]  364         and     #0x07
   1E32 A8            [ 2]  365         tay
   1E33 B9 67 1E      [ 5]  366         lda     X1E63,y
   1E36 85 5D         [ 3]  367         sta     RAM_5D
   1E38 A5 5E         [ 3]  368         lda     RAM_5E
   1E3A 4A            [ 2]  369         lsr     a
   1E3B B0 09         [ 4]  370         bcs     L1E42
   1E3D A5 5D         [ 3]  371         lda     RAM_5D
   1E3F 49 FF         [ 2]  372         eor     #0xFF
   1E41 35 00         [ 4]  373         and     RAM_start,x
   1E43 95 00         [ 4]  374         sta     RAM_start,x
   1E45 60            [ 6]  375         rts
                            376 ;
   1E46                     377 L1E42:
   1E46 A5 5D         [ 3]  378         lda     RAM_5D
   1E48 15 00         [ 4]  379         ora     RAM_start,x
   1E4A 95 00         [ 4]  380         sta     RAM_start,x
   1E4C 60            [ 6]  381         rts
                            382 ;
   1E4D                     383 L1E49:
   1E4D A5 5C         [ 3]  384         lda     RAM_5C
   1E4F 85 5E         [ 3]  385         sta     RAM_5E
   1E51 29 7E         [ 2]  386         and     #0x7E
   1E53 C9 22         [ 2]  387         cmp     #0x22
   1E55 D0 05         [ 4]  388         bne     L1E58
   1E57 A9 98         [ 2]  389         lda     #0x98
   1E59 85 64         [ 3]  390         sta     RAM_64
   1E5B 60            [ 6]  391         rts
                            392 ;
   1E5C                     393 L1E58:
   1E5C 38            [ 2]  394         sec
   1E5D E9 32         [ 2]  395         sbc     #0x32
   1E5F 0A            [ 2]  396         asl     a
   1E60 18            [ 2]  397         clc
   1E61 69 80         [ 2]  398         adc     #0x80
   1E63 85 64         [ 3]  399         sta     RAM_64
   1E65 60            [ 6]  400         rts
   1E66                     401 L1E62:
   1E66 60            [ 6]  402         rts
                            403 ;
   1E67                     404 X1E63:
   1E67 01 02 04 08         405         .db     0x01, 0x02, 0x04, 0x08
   1E6B 10 20 40 80         406         .db     0x10, 0x20, 0x40, 0x80
                            407 ;
   1E6F                     408 L1E6B:
   1E6F AD 05 02      [ 4]  409         lda     U18_edge_detect_control_DI_pos
   1E72 85 5F         [ 3]  410         sta     RAM_5F
   1E74 F0 50         [ 4]  411         beq     L1EC2
   1E76 A5 5B         [ 3]  412         lda     RAM_5B
   1E78 30 0E         [ 4]  413         bmi     L1E84
   1E7A A5 5F         [ 3]  414         lda     RAM_5F
   1E7C 29 40         [ 2]  415         and     #0x40
   1E7E F0 16         [ 4]  416         beq     L1E92
   1E80 A9 80         [ 2]  417         lda     #0x80
   1E82 85 5B         [ 3]  418         sta     RAM_5B
   1E84 A9 FA         [ 2]  419         lda     #0xFA
   1E86 85 51         [ 3]  420         sta     RAM_51
   1E88                     421 L1E84:
   1E88 A5 51         [ 3]  422         lda     RAM_51
   1E8A D0 06         [ 4]  423         bne     L1E8E
   1E8C A9 00         [ 2]  424         lda     #0x00
   1E8E 85 5B         [ 3]  425         sta     RAM_5B
   1E90 E6 5A         [ 5]  426         inc     RAM_5A
   1E92                     427 L1E8E:
   1E92 A5 5F         [ 3]  428         lda     RAM_5F
   1E94 10 30         [ 4]  429         bpl     L1EC2
   1E96                     430 L1E92:
   1E96 AD 04 02      [ 4]  431         lda     U18_edge_detect_control_DI_neg
   1E99 49 FF         [ 2]  432         eor     #0xFF
   1E9B 4A            [ 2]  433         lsr     a
   1E9C 4A            [ 2]  434         lsr     a
   1E9D 4A            [ 2]  435         lsr     a
   1E9E 85 57         [ 3]  436         sta     RAM_57
   1EA0 90 02         [ 4]  437         bcc     L1EA0
   1EA2 E6 57         [ 5]  438         inc     RAM_57
   1EA4                     439 L1EA0:
   1EA4 A9 7A         [ 2]  440         lda     #0x7A
   1EA6 38            [ 2]  441         sec
   1EA7 E5 57         [ 3]  442         sbc     RAM_57
   1EA9 8D 15 02      [ 4]  443         sta     U18_timer_8T_DI
   1EAC C6 50         [ 5]  444         dec     RAM_50
   1EAE C6 51         [ 5]  445         dec     RAM_51
   1EB0 C6 52         [ 5]  446         dec     RAM_52
   1EB2 C6 53         [ 5]  447         dec     RAM_53
   1EB4 D0 10         [ 4]  448         bne     L1EC2
   1EB6 A9 64         [ 2]  449         lda     #0x64
   1EB8 85 53         [ 3]  450         sta     RAM_53
   1EBA C6 54         [ 5]  451         dec     RAM_54
   1EBC C6 55         [ 5]  452         dec     RAM_55
   1EBE D0 06         [ 4]  453         bne     L1EC2
   1EC0 A9 64         [ 2]  454         lda     #0x64
   1EC2 85 55         [ 3]  455         sta     RAM_55
   1EC4 C6 56         [ 5]  456         dec     RAM_56
   1EC6                     457 L1EC2:
   1EC6 60            [ 6]  458         rts
                            459 ;
   1EC7                     460 L1EC3:
   1EC7 A9 00         [ 2]  461         lda     #0x00
   1EC9 85 61         [ 3]  462         sta     RAM_61
   1ECB 85 62         [ 3]  463         sta     RAM_62
   1ECD A9 0A         [ 2]  464         lda     #0x0A
   1ECF 85 54         [ 3]  465         sta     RAM_54
   1ED1 A9 64         [ 2]  466         lda     #0x64
   1ED3 85 53         [ 3]  467         sta     RAM_53
   1ED5                     468 L1ED1:
   1ED5 20 6F 1E      [ 6]  469         jsr     L1E6B
   1ED8 A5 54         [ 3]  470         lda     RAM_54
   1EDA D0 F9         [ 4]  471         bne     L1ED1
   1EDC A9 0A         [ 2]  472         lda     #0x0A
   1EDE 85 54         [ 3]  473         sta     RAM_54
   1EE0 A9 64         [ 2]  474         lda     #0x64
   1EE2 85 53         [ 3]  475         sta     RAM_53
   1EE4 A5 62         [ 3]  476         lda     RAM_62
   1EE6 C9 08         [ 2]  477         cmp     #0x08
   1EE8 F0 15         [ 4]  478         beq     L1EFB
   1EEA E6 62         [ 5]  479         inc     RAM_62
   1EEC A2 09         [ 2]  480         ldx     #0x09
   1EEE 38            [ 2]  481         sec
   1EEF AD 80 03      [ 4]  482         lda     audio_periph$ddr_reg_a
   1EF2                     483 L1EEE:
   1EF2 2A            [ 2]  484         rol     a
   1EF3 CA            [ 2]  485         dex
   1EF4 90 FC         [ 4]  486         bcc     L1EEE
   1EF6 18            [ 2]  487         clc
   1EF7 8A            [ 2]  488         txa
   1EF8 65 61         [ 3]  489         adc     RAM_61
   1EFA 85 61         [ 3]  490         sta     RAM_61
   1EFC 4C D5 1E      [ 3]  491         jmp     L1ED1
                            492 ;
   1EFF                     493 L1EFB:
   1EFF 46 61         [ 5]  494         lsr     RAM_61
   1F01 46 61         [ 5]  495         lsr     RAM_61
   1F03 46 61         [ 5]  496         lsr     RAM_61
   1F05 A5 61         [ 3]  497         lda     RAM_61
   1F07 85 60         [ 3]  498         sta     RAM_60
   1F09 A9 00         [ 2]  499         lda     #0x00
   1F0B 85 61         [ 3]  500         sta     RAM_61
   1F0D 85 62         [ 3]  501         sta     RAM_62
   1F0F 60            [ 6]  502         rts
                            503 ;
   1F10                     504 L1F0C:
   1F10 AD 80 02      [ 4]  505         lda     U19_PORTA
   1F13 49 FF         [ 2]  506         eor     #0xFF
   1F15 4A            [ 2]  507         lsr     a
   1F16 4A            [ 2]  508         lsr     a
   1F17 4A            [ 2]  509         lsr     a
   1F18 4A            [ 2]  510         lsr     a
   1F19 18            [ 2]  511         clc
   1F1A 65 60         [ 3]  512         adc     RAM_60
   1F1C AA            [ 2]  513         tax
   1F1D BD 43 1F      [ 5]  514         lda     X1F3F,x
   1F20 85 63         [ 3]  515         sta     RAM_63
   1F22 A5 52         [ 3]  516         lda     RAM_52
   1F24 D0 16         [ 4]  517         bne     L1F38
   1F26 A9 0A         [ 2]  518         lda     #0x0A
   1F28 85 52         [ 3]  519         sta     RAM_52
   1F2A A5 63         [ 3]  520         lda     RAM_63
   1F2C CD 82 03      [ 4]  521         cmp     audio_periph$ddr_reg_b
   1F2F 90 08         [ 4]  522         bcc     L1F35
   1F31 F0 09         [ 4]  523         beq     L1F38
   1F33 EE 82 03      [ 6]  524         inc     audio_periph$ddr_reg_b
   1F36 4C 3C 1F      [ 3]  525         jmp     L1F38
                            526 ;
   1F39                     527 L1F35:
   1F39 CE 82 03      [ 6]  528         dec     audio_periph$ddr_reg_b
   1F3C                     529 L1F38:
   1F3C AD 82 03      [ 4]  530         lda     audio_periph$ddr_reg_b
   1F3F 8D 82 02      [ 4]  531         sta     U19_PORTB
   1F42 60            [ 6]  532         rts
                            533 ;
   1F43                     534 X1F3F:
   1F43 03 04 06 08         535         .db     0x03, 0x04, 0x06, 0x08
   1F47 10 16 20 2D         536         .db     0x10, 0x16, 0x20, 0x2D
   1F4B 40 5A 80 BF         537         .db     0x40, 0x5A, 0x80, 0xBF
   1F4F FF FF FF FF         538         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F53 FF 00 00 00         539         .db     0xFF, 0x00, 0x00, 0x00
   1F57 00 00 00 00         540         .db     0x00, 0x00, 0x00, 0x00
   1F5B 00 00 00 00         541         .db     0x00, 0x00, 0x00, 0x00
   1F5F 00 00 00 00         542         .db     0x00, 0x00, 0x00, 0x00
   1F63 00 00 00 00         543         .db     0x00, 0x00, 0x00, 0x00
   1F67 00 00 00 00         544         .db     0x00, 0x00, 0x00, 0x00
   1F6B 00 00 00 00         545         .db     0x00, 0x00, 0x00, 0x00
   1F6F 00 00 00 00         546         .db     0x00, 0x00, 0x00, 0x00
   1F73 00 00 00 00         547         .db     0x00, 0x00, 0x00, 0x00
   1F77 00 00 00 00         548         .db     0x00, 0x00, 0x00, 0x00
   1F7B 00 00 00 00         549         .db     0x00, 0x00, 0x00, 0x00
   1F7F 00 00 00 00         550         .db     0x00, 0x00, 0x00, 0x00
   1F83 00 00 00 00         551         .db     0x00, 0x00, 0x00, 0x00
   1F87 00 00 00 00         552         .db     0x00, 0x00, 0x00, 0x00
   1F8B 00 00 00 00         553         .db     0x00, 0x00, 0x00, 0x00
   1F8F 00 00 00 00         554         .db     0x00, 0x00, 0x00, 0x00
   1F93 00 00 00 00         555         .db     0x00, 0x00, 0x00, 0x00
   1F97 00 00 00 00         556         .db     0x00, 0x00, 0x00, 0x00
   1F9B 00 00 00 00         557         .db     0x00, 0x00, 0x00, 0x00
   1F9F 00 00 00 00         558         .db     0x00, 0x00, 0x00, 0x00
   1FA3 00 00 00 00         559         .db     0x00, 0x00, 0x00, 0x00
   1FA7 00 00 00 00         560         .db     0x00, 0x00, 0x00, 0x00
   1FAB 00 00 00 00         561         .db     0x00, 0x00, 0x00, 0x00
   1FAF 00 00 00 00         562         .db     0x00, 0x00, 0x00, 0x00
   1FB3 00 00 00 00         563         .db     0x00, 0x00, 0x00, 0x00
   1FB7 00 00 00 00         564         .db     0x00, 0x00, 0x00, 0x00
   1FBB 00 00 00 00         565         .db     0x00, 0x00, 0x00, 0x00
   1FBF 00 00 00 00         566         .db     0x00, 0x00, 0x00, 0x00
   1FC3 00 00 00 00         567         .db     0x00, 0x00, 0x00, 0x00
   1FC7 00 00 00 00         568         .db     0x00, 0x00, 0x00, 0x00
   1FCB 00 00 00 00         569         .db     0x00, 0x00, 0x00, 0x00
   1FCF 00 00 00 00         570         .db     0x00, 0x00, 0x00, 0x00
   1FD3 00 00 00 00         571         .db     0x00, 0x00, 0x00, 0x00
   1FD7 00 00 00 00         572         .db     0x00, 0x00, 0x00, 0x00
   1FDB 00 00 00 00         573         .db     0x00, 0x00, 0x00, 0x00
   1FDF 00 00 00 00         574         .db     0x00, 0x00, 0x00, 0x00
   1FE3 00 00 00 00         575         .db     0x00, 0x00, 0x00, 0x00
   1FE7 00 00 00 00         576         .db     0x00, 0x00, 0x00, 0x00
   1FEB 00 00 00 00         577         .db     0x00, 0x00, 0x00, 0x00
   1FEF 00 00 00 00         578         .db     0x00, 0x00, 0x00, 0x00
   1FF3 00 00 00 00         579         .db     0x00, 0x00, 0x00, 0x00
   1FF7 00 00 00 00         580         .db     0x00, 0x00, 0x00, 0x00
   1FFB 00 00 00            581         .db     0x00, 0x00, 0x00
   1FFE                     582 NMIVEC:
   1FFE 00 00               583         .dw     RAM_start
   2000                     584 RESETVEC:
   2000 00 1C               585         .dw     RESET
   2002                     586 IRQVEC:
   2002 00 00               587         .dw     RAM_start
