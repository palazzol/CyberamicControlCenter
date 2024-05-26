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
                             38         .include "../include/ptt6502.def"
                              1 
                     0080     2 board_1_periph$ddr_reg_a    = 0x0080
                     0081     3 board_1_control_reg_a       = 0x0081
                     0082     4 board_1_periph$ddr_reg_b    = 0x0082
                     0083     5 board_1_control_reg_b       = 0x0083
                     0086     6 board_2_periph$ddr_reg_b    = 0x0086
                     008A     7 board_3_periph$ddr_reg_b    = 0x008A
                     008E     8 board_4_periph$ddr_reg_b    = 0x008E
                     0200     9 U18_PORTA                   = 0x0200
                     0201    10 U18_DDRA                    = 0x0201
                     0202    11 U18_PORTB                   = 0x0202
                     0203    12 U18_DDRB                    = 0x0203
                     0204    13 U18_timer                   = 0x0204
                     0204    14 U18_edge_detect_control_DI_neg = 0x0204
                     0205    15 U18_edge_detect_control_DI_pos = 0x0205
                     0215    16 U18_timer_8T_DI             = 0x0215
                     0280    17 U19_PORTA                   = 0x0280
                     0281    18 U19_DDRA                    = 0x0281
                     0282    19 U19_PORTB                   = 0x0282
                     0283    20 U19_DDRB                    = 0x0283
                     0300    21 transport_periph$ddr_reg_a  = 0x0300
                     0301    22 transport_control_reg_a     = 0x0301
                     0302    23 transport_periph$ddr_reg_b  = 0x0302
                     0303    24 transport_control_reg_b     = 0x0303
                     0380    25 audio_periph$ddr_reg_a      = 0x0380
                     0381    26 audio_control_reg_a         = 0x0381
                     0382    27 audio_periph$ddr_reg_b      = 0x0382
                     0383    28 audio_control_reg_b         = 0x0383
                             39 
                             40 ;board_1_periph$ddr_reg_a   = 0x0080
                             41 ;board_1_control_reg_a      = 0x0081
                             42 ;board_1_periph$ddr_reg_b   = 0x0082
                             43 ;board_1_control_reg_b      = 0x0083
                             44 ;board_2_periph$ddr_reg_b   = 0x0086
                             45 ;board_3_periph$ddr_reg_b   = 0x008A
                             46 ;board_4_periph$ddr_reg_b   = 0x008E
                             47 ;U18_PORTA                  = 0x0200
                             48 ;U18_DDRA                   = 0x0201
                             49 ;U18_PORTB                  = 0x0202
                             50 ;U18_DDRB                   = 0x0203
                             51 ;U18_edge_detect_control_DI_neg = 0x0204
                             52 ;U18_edge_detect_control_DI_pos = 0x0205
                             53 ;U18_timer_8T_DI            = 0x0215
                             54 ;U19_PORTA                  = 0x0280
                             55 ;U19_DDRA                   = 0x0281
                             56 ;U19_PORTB                  = 0x0282
                             57 ;U19_DDRB                   = 0x0283
                             58 ;transport_periph$ddr_reg_a = 0x0300
                             59 ;transport_control_reg_a    = 0x0301
                             60 ;transport_periph$ddr_reg_b = 0x0302
                             61 ;transport_control_reg_b    = 0x0303
                             62 ;audio_periph$ddr_reg_a     = 0x0380
                             63 ;audio_control_reg_a        = 0x0381
                             64 ;audio_periph$ddr_reg_b     = 0x0382
                             65 ;audio_control_reg_b        = 0x0383
                             66 
   1C00                      67         .org    0x1C00
                             68 ;
   1C00                      69 RESET:
   1C00 D8            [ 2]   70         cld
   1C01 78            [ 2]   71         sei
   1C02 A2 F0         [ 2]   72         ldx     #0xF0
   1C04 9A            [ 2]   73         txs
   1C05 A9 00         [ 2]   74         lda     #0x00
   1C07 A2 10         [ 2]   75         ldx     #0x10
   1C09                      76 L1C09:
   1C09 95 00         [ 4]   77         sta     RAM_start,x
   1C0B E8            [ 2]   78         inx
   1C0C E0 80         [ 2]   79         cpx     #0x80
   1C0E D0 F9         [ 4]   80         bne     L1C09
   1C10 A9 00         [ 2]   81         lda     #0x00
   1C12 8D 01 03      [ 4]   82         sta     transport_control_reg_a
   1C15 8D 00 03      [ 4]   83         sta     transport_periph$ddr_reg_a
   1C18 8D 81 03      [ 4]   84         sta     audio_control_reg_a
   1C1B 8D 80 03      [ 4]   85         sta     audio_periph$ddr_reg_a
   1C1E 8D 83 03      [ 4]   86         sta     audio_control_reg_b
   1C21 8D 05 02      [ 4]   87         sta     U18_edge_detect_control_DI_pos
   1C24 8D 03 03      [ 4]   88         sta     transport_control_reg_b
   1C27 8D 01 02      [ 4]   89         sta     U18_DDRA
   1C2A A9 02         [ 2]   90         lda     #0x02
   1C2C 8D 81 02      [ 4]   91         sta     U19_DDRA
   1C2F A9 FF         [ 2]   92         lda     #0xFF
   1C31 8D 82 03      [ 4]   93         sta     audio_periph$ddr_reg_b
   1C34 8D 03 02      [ 4]   94         sta     U18_DDRB
   1C37 8D 83 02      [ 4]   95         sta     U19_DDRB
   1C3A A9 FC         [ 2]   96         lda     #0xFC
   1C3C 8D 02 03      [ 4]   97         sta     transport_periph$ddr_reg_b
   1C3F A9 2E         [ 2]   98         lda     #0x2E
   1C41 8D 01 03      [ 4]   99         sta     transport_control_reg_a
   1C44 8D 03 03      [ 4]  100         sta     transport_control_reg_b
   1C47 8D 83 03      [ 4]  101         sta     audio_control_reg_b
   1C4A 8D 81 03      [ 4]  102         sta     audio_control_reg_a
   1C4D A9 64         [ 2]  103         lda     #0x64
   1C4F 85 53         [ 3]  104         sta     RAM_53
   1C51 A9 30         [ 2]  105         lda     #0x30
   1C53 85 56         [ 3]  106         sta     RAM_56
   1C55 A9 64         [ 2]  107         lda     #0x64
   1C57 85 55         [ 3]  108         sta     RAM_55
   1C59 A9 10         [ 2]  109         lda     #0x10
   1C5B 85 63         [ 3]  110         sta     RAM_63
   1C5D A9 10         [ 2]  111         lda     #0x10
   1C5F 20 55 1D      [ 6]  112         jsr     L1D55
   1C62 A9 28         [ 2]  113         lda     #0x28
   1C64 85 54         [ 3]  114         sta     RAM_54
   1C66 A9 64         [ 2]  115         lda     #0x64
   1C68 85 53         [ 3]  116         sta     RAM_53
   1C6A                     117 L1C6A:
   1C6A 20 6B 1E      [ 6]  118         jsr     L1E6B
   1C6D A5 54         [ 3]  119         lda     RAM_54
   1C6F D0 F9         [ 4]  120         bne     L1C6A
   1C71                     121 L1C71:
   1C71 A9 40         [ 2]  122         lda     #0x40
   1C73 20 69 1D      [ 6]  123         jsr     L1D69
   1C76                     124 L1C76:
   1C76 A9 00         [ 2]  125         lda     #0x00
   1C78 85 58         [ 3]  126         sta     RAM_58
   1C7A                     127 L1C7A:
   1C7A 20 6B 1E      [ 6]  128         jsr     L1E6B
   1C7D AD 03 03      [ 4]  129         lda     transport_control_reg_b
   1C80 10 F8         [ 4]  130         bpl     L1C7A
   1C82 A9 06         [ 2]  131         lda     #0x06
   1C84 85 54         [ 3]  132         sta     RAM_54
   1C86 A9 64         [ 2]  133         lda     #0x64
   1C88 85 53         [ 3]  134         sta     RAM_53
   1C8A                     135 L1C8A:
   1C8A 20 6B 1E      [ 6]  136         jsr     L1E6B
   1C8D AD 03 03      [ 4]  137         lda     transport_control_reg_b
   1C90 10 0B         [ 4]  138         bpl     L1C9D
   1C92 E6 58         [ 5]  139         inc     RAM_58
   1C94 AD 02 03      [ 4]  140         lda     transport_periph$ddr_reg_b
   1C97 A5 58         [ 3]  141         lda     RAM_58
   1C99 C9 64         [ 2]  142         cmp     #0x64
   1C9B B0 0B         [ 4]  143         bcs     L1CA8
   1C9D                     144 L1C9D:
   1C9D A5 54         [ 3]  145         lda     RAM_54
   1C9F D0 E9         [ 4]  146         bne     L1C8A
   1CA1 4C 76 1C      [ 3]  147         jmp     L1C76
                            148 ;
                            149         ; this code is skipped
   1CA4 C9 60         [ 2]  150         cmp     #0x60
   1CA6 90 00         [ 4]  151         bcc     L1CA8
   1CA8                     152 L1CA8:
   1CA8 A9 20         [ 2]  153         lda     #0x20
   1CAA 20 69 1D      [ 6]  154         jsr     L1D69
   1CAD A9 19         [ 2]  155         lda     #0x19
   1CAF 85 54         [ 3]  156         sta     RAM_54
   1CB1 A9 64         [ 2]  157         lda     #0x64
   1CB3 85 53         [ 3]  158         sta     RAM_53
   1CB5                     159 L1CB5:
   1CB5 20 6B 1E      [ 6]  160         jsr     L1E6B
   1CB8 A5 54         [ 3]  161         lda     RAM_54
   1CBA D0 F9         [ 4]  162         bne     L1CB5
   1CBC A9 00         [ 2]  163         lda     #0x00
   1CBE 85 59         [ 3]  164         sta     RAM_59
   1CC0 20 78 1D      [ 6]  165         jsr     L1D78
   1CC3 E6 59         [ 5]  166         inc     RAM_59
   1CC5 A9 10         [ 2]  167         lda     #0x10
   1CC7 20 55 1D      [ 6]  168         jsr     L1D55
   1CCA A9 80         [ 2]  169         lda     #0x80
   1CCC 20 55 1D      [ 6]  170         jsr     L1D55
   1CCF 20 A6 1D      [ 6]  171         jsr     L1DA6
   1CD2 A9 10         [ 2]  172         lda     #0x10
   1CD4 20 55 1D      [ 6]  173         jsr     L1D55
   1CD7 20 32 1D      [ 6]  174         jsr     L1D32
   1CDA                     175 L1CDA:
   1CDA 20 6B 1E      [ 6]  176         jsr     L1E6B
   1CDD 20 0C 1F      [ 6]  177         jsr     L1F0C
   1CE0 A5 5A         [ 3]  178         lda     RAM_5A
   1CE2 D0 10         [ 4]  179         bne     L1CF4
   1CE4 A9 02         [ 2]  180         lda     #0x02
   1CE6 8D 80 02      [ 4]  181         sta     U19_PORTA
   1CE9 A9 00         [ 2]  182         lda     #0x00
   1CEB 8D 02 02      [ 4]  183         sta     U18_PORTB
   1CEE A5 56         [ 3]  184         lda     RAM_56
   1CF0 D0 E8         [ 4]  185         bne     L1CDA
   1CF2 E6 5A         [ 5]  186         inc     RAM_5A
   1CF4                     187 L1CF4:
   1CF4 20 32 1D      [ 6]  188         jsr     L1D32
   1CF7 A9 00         [ 2]  189         lda     #0x00
   1CF9 8D 80 02      [ 4]  190         sta     U19_PORTA
   1CFC A9 80         [ 2]  191         lda     #0x80
   1CFE 8D 02 02      [ 4]  192         sta     U18_PORTB
   1D01 A9 80         [ 2]  193         lda     #0x80
   1D03 20 55 1D      [ 6]  194         jsr     L1D55
   1D06 20 A6 1D      [ 6]  195         jsr     L1DA6
   1D09 C6 5A         [ 5]  196         dec     RAM_5A
   1D0B 20 CC 1D      [ 6]  197         jsr     L1DCC
   1D0E 20 32 1D      [ 6]  198         jsr     L1D32
   1D11 A9 30         [ 2]  199         lda     #0x30
   1D13 85 56         [ 3]  200         sta     RAM_56
   1D15 A9 64         [ 2]  201         lda     #0x64
   1D17 85 55         [ 3]  202         sta     RAM_55
   1D19 E6 59         [ 5]  203         inc     RAM_59
   1D1B A5 59         [ 3]  204         lda     RAM_59
   1D1D C9 1A         [ 2]  205         cmp     #0x1A
   1D1F 90 03         [ 4]  206         bcc     L1D24
   1D21 4C 71 1C      [ 3]  207         jmp     L1C71
                            208 ;
   1D24                     209 L1D24:
   1D24 20 A6 1D      [ 6]  210         jsr     L1DA6
   1D27 A9 10         [ 2]  211         lda     #0x10
   1D29 20 55 1D      [ 6]  212         jsr     L1D55
   1D2C 20 C3 1E      [ 6]  213         jsr     L1EC3
   1D2F 4C DA 1C      [ 3]  214         jmp     L1CDA
                            215 ;
   1D32                     216 L1D32:
   1D32 A2 00         [ 2]  217         ldx     #0x00
   1D34                     218 L1D34:
   1D34 A9 30         [ 2]  219         lda     #0x30
   1D36 95 81         [ 4]  220         sta     board_1_control_reg_a,x
   1D38 95 83         [ 4]  221         sta     board_1_control_reg_b,x
   1D3A A9 FF         [ 2]  222         lda     #0xFF
   1D3C 95 80         [ 4]  223         sta     board_1_periph$ddr_reg_a,x
   1D3E 95 82         [ 4]  224         sta     board_1_periph$ddr_reg_b,x
   1D40 A9 34         [ 2]  225         lda     #0x34
   1D42 95 81         [ 4]  226         sta     board_1_control_reg_a,x
   1D44 95 83         [ 4]  227         sta     board_1_control_reg_b,x
   1D46 A9 00         [ 2]  228         lda     #0x00
   1D48 95 80         [ 4]  229         sta     board_1_periph$ddr_reg_a,x
   1D4A 95 82         [ 4]  230         sta     board_1_periph$ddr_reg_b,x
   1D4C E8            [ 2]  231         inx
   1D4D E8            [ 2]  232         inx
   1D4E E8            [ 2]  233         inx
   1D4F E8            [ 2]  234         inx
   1D50 E0 20         [ 2]  235         cpx     #0x20
   1D52 90 E0         [ 4]  236         bcc     L1D34
   1D54 60            [ 6]  237         rts
                            238 ;
   1D55                     239 L1D55:
   1D55 8D 02 03      [ 4]  240         sta     transport_periph$ddr_reg_b
   1D58 A9 FF         [ 2]  241         lda     #0xFF
   1D5A 85 50         [ 3]  242         sta     RAM_50
   1D5C                     243 L1D5C:
   1D5C 20 6B 1E      [ 6]  244         jsr     L1E6B
   1D5F A5 50         [ 3]  245         lda     RAM_50
   1D61 D0 F9         [ 4]  246         bne     L1D5C
   1D63 A9 00         [ 2]  247         lda     #0x00
   1D65 8D 02 03      [ 4]  248         sta     transport_periph$ddr_reg_b
   1D68 60            [ 6]  249         rts
                            250 ;
   1D69                     251 L1D69:
   1D69 8D 02 03      [ 4]  252         sta     transport_periph$ddr_reg_b
   1D6C A9 FA         [ 2]  253         lda     #0xFA
   1D6E 85 50         [ 3]  254         sta     RAM_50
   1D70                     255 L1D70:
   1D70 20 6B 1E      [ 6]  256         jsr     L1E6B
   1D73 A5 50         [ 3]  257         lda     RAM_50
   1D75 D0 F9         [ 4]  258         bne     L1D70
   1D77 60            [ 6]  259         rts
                            260 ;
   1D78                     261 L1D78:
   1D78 A9 00         [ 2]  262         lda     #0x00
   1D7A 85 58         [ 3]  263         sta     RAM_58
   1D7C                     264 L1D7C:
   1D7C 20 6B 1E      [ 6]  265         jsr     L1E6B
   1D7F AD 03 03      [ 4]  266         lda     transport_control_reg_b
   1D82 10 F8         [ 4]  267         bpl     L1D7C
   1D84 A9 FA         [ 2]  268         lda     #0xFA
   1D86 85 50         [ 3]  269         sta     RAM_50
   1D88                     270 L1D88:
   1D88 20 6B 1E      [ 6]  271         jsr     L1E6B
   1D8B AD 03 03      [ 4]  272         lda     transport_control_reg_b
   1D8E 10 0B         [ 4]  273         bpl     L1D9B
   1D90 E6 58         [ 5]  274         inc     RAM_58
   1D92 AD 02 03      [ 4]  275         lda     transport_periph$ddr_reg_b
   1D95 A5 58         [ 3]  276         lda     RAM_58
   1D97 C9 60         [ 2]  277         cmp     #0x60
   1D99 B0 0A         [ 4]  278         bcs     L1DA5
   1D9B                     279 L1D9B:
   1D9B A5 50         [ 3]  280         lda     RAM_50
   1D9D D0 E9         [ 4]  281         bne     L1D88
   1D9F A5 58         [ 3]  282         lda     RAM_58
   1DA1 C9 20         [ 2]  283         cmp     #0x20
   1DA3 90 D3         [ 4]  284         bcc     L1D78
   1DA5                     285 L1DA5:
   1DA5 60            [ 6]  286         rts
                            287 ;
   1DA6                     288 L1DA6:
   1DA6 A9 FA         [ 2]  289         lda     #0xFA
   1DA8 85 50         [ 3]  290         sta     RAM_50
   1DAA                     291 L1DAA:
   1DAA 20 6B 1E      [ 6]  292         jsr     L1E6B
   1DAD A5 50         [ 3]  293         lda     RAM_50
   1DAF D0 F9         [ 4]  294         bne     L1DAA
   1DB1                     295 L1DB1:
   1DB1 20 6B 1E      [ 6]  296         jsr     L1E6B
   1DB4 AD 02 03      [ 4]  297         lda     transport_periph$ddr_reg_b
   1DB7 6A            [ 2]  298         ror     a
   1DB8 90 F7         [ 4]  299         bcc     L1DB1
   1DBA A9 A0         [ 2]  300         lda     #0xA0
   1DBC 85 50         [ 3]  301         sta     RAM_50
   1DBE                     302 L1DBE:
   1DBE 20 6B 1E      [ 6]  303         jsr     L1E6B
   1DC1 AD 02 03      [ 4]  304         lda     transport_periph$ddr_reg_b
   1DC4 6A            [ 2]  305         ror     a
   1DC5 90 EA         [ 4]  306         bcc     L1DB1
   1DC7 A5 50         [ 3]  307         lda     RAM_50
   1DC9 D0 F3         [ 4]  308         bne     L1DBE
   1DCB 60            [ 6]  309         rts
                            310 ;
   1DCC                     311 L1DCC:
   1DCC AD 00 03      [ 4]  312         lda     transport_periph$ddr_reg_a
   1DCF A9 40         [ 2]  313         lda     #0x40
   1DD1 85 82         [ 3]  314         sta     board_1_periph$ddr_reg_b
   1DD3 85 86         [ 3]  315         sta     board_2_periph$ddr_reg_b
   1DD5 85 8A         [ 3]  316         sta     board_3_periph$ddr_reg_b
   1DD7 85 8E         [ 3]  317         sta     board_4_periph$ddr_reg_b
   1DD9                     318 L1DD9:
   1DD9 AD 02 03      [ 4]  319         lda     transport_periph$ddr_reg_b
   1DDC 4A            [ 2]  320         lsr     a
   1DDD 90 11         [ 4]  321         bcc     L1DF0
   1DDF 20 0C 1F      [ 6]  322         jsr     L1F0C
   1DE2 20 6B 1E      [ 6]  323         jsr     L1E6B
   1DE5 AD 01 03      [ 4]  324         lda     transport_control_reg_a
   1DE8 10 EF         [ 4]  325         bpl     L1DD9
   1DEA 20 02 1E      [ 6]  326         jsr     L1E02
   1DED 4C D9 1D      [ 3]  327         jmp     L1DD9
                            328 ;
   1DF0                     329 L1DF0:
   1DF0 A9 64         [ 2]  330         lda     #0x64
   1DF2 85 50         [ 3]  331         sta     RAM_50
   1DF4                     332 L1DF4:
   1DF4 20 6B 1E      [ 6]  333         jsr     L1E6B
   1DF7 AD 02 03      [ 4]  334         lda     transport_periph$ddr_reg_b
   1DFA 4A            [ 2]  335         lsr     a
   1DFB B0 CF         [ 4]  336         bcs     L1DCC
   1DFD A5 50         [ 3]  337         lda     RAM_50
   1DFF D0 F3         [ 4]  338         bne     L1DF4
   1E01 60            [ 6]  339         rts
                            340 ;
   1E02                     341 L1E02:
   1E02 AD 00 03      [ 4]  342         lda     transport_periph$ddr_reg_a
   1E05 29 7F         [ 2]  343         and     #0x7F
   1E07 85 5C         [ 3]  344         sta     RAM_5C
   1E09 29 7E         [ 2]  345         and     #0x7E
   1E0B C9 22         [ 2]  346         cmp     #0x22
   1E0D F0 3A         [ 4]  347         beq     L1E49
   1E0F C9 32         [ 2]  348         cmp     #0x32
   1E11 90 4F         [ 4]  349         bcc     L1E62
   1E13 C9 3A         [ 2]  350         cmp     #0x3A
   1E15 90 32         [ 4]  351         bcc     L1E49
   1E17 A5 5C         [ 3]  352         lda     RAM_5C
   1E19 C9 41         [ 2]  353         cmp     #0x41
   1E1B 90 45         [ 4]  354         bcc     L1E62
   1E1D C9 51         [ 2]  355         cmp     #0x51
   1E1F B0 41         [ 4]  356         bcs     L1E62
   1E21 A6 64         [ 3]  357         ldx     RAM_64
   1E23 38            [ 2]  358         sec
   1E24 E9 41         [ 2]  359         sbc     #0x41
   1E26 C9 08         [ 2]  360         cmp     #0x08
   1E28 90 02         [ 4]  361         bcc     L1E2C
   1E2A E8            [ 2]  362         inx
   1E2B E8            [ 2]  363         inx
   1E2C                     364 L1E2C:
   1E2C 29 07         [ 2]  365         and     #0x07
   1E2E A8            [ 2]  366         tay
   1E2F B9 63 1E      [ 5]  367         lda     X1E63,y
   1E32 85 5D         [ 3]  368         sta     RAM_5D
   1E34 A5 5E         [ 3]  369         lda     RAM_5E
   1E36 4A            [ 2]  370         lsr     a
   1E37 B0 09         [ 4]  371         bcs     L1E42
   1E39 A5 5D         [ 3]  372         lda     RAM_5D
   1E3B 49 FF         [ 2]  373         eor     #0xFF
   1E3D 35 00         [ 4]  374         and     RAM_start,x
   1E3F 95 00         [ 4]  375         sta     RAM_start,x
   1E41 60            [ 6]  376         rts
                            377 ;
   1E42                     378 L1E42:
   1E42 A5 5D         [ 3]  379         lda     RAM_5D
   1E44 15 00         [ 4]  380         ora     RAM_start,x
   1E46 95 00         [ 4]  381         sta     RAM_start,x
   1E48 60            [ 6]  382         rts
                            383 ;
   1E49                     384 L1E49:
   1E49 A5 5C         [ 3]  385         lda     RAM_5C
   1E4B 85 5E         [ 3]  386         sta     RAM_5E
   1E4D 29 7E         [ 2]  387         and     #0x7E
   1E4F C9 22         [ 2]  388         cmp     #0x22
   1E51 D0 05         [ 4]  389         bne     L1E58
   1E53 A9 98         [ 2]  390         lda     #0x98
   1E55 85 64         [ 3]  391         sta     RAM_64
   1E57 60            [ 6]  392         rts
                            393 ;
   1E58                     394 L1E58:
   1E58 38            [ 2]  395         sec
   1E59 E9 32         [ 2]  396         sbc     #0x32
   1E5B 0A            [ 2]  397         asl     a
   1E5C 18            [ 2]  398         clc
   1E5D 69 80         [ 2]  399         adc     #0x80
   1E5F 85 64         [ 3]  400         sta     RAM_64
   1E61 60            [ 6]  401         rts
   1E62                     402 L1E62:
   1E62 60            [ 6]  403         rts
                            404 ;
   1E63                     405 X1E63:
   1E63 01 02 04 08         406         .db     0x01, 0x02, 0x04, 0x08
   1E67 10 20 40 80         407         .db     0x10, 0x20, 0x40, 0x80
                            408 ;
   1E6B                     409 L1E6B:
   1E6B AD 05 02      [ 4]  410         lda     U18_edge_detect_control_DI_pos
   1E6E 85 5F         [ 3]  411         sta     RAM_5F
   1E70 F0 50         [ 4]  412         beq     L1EC2
   1E72 A5 5B         [ 3]  413         lda     RAM_5B
   1E74 30 0E         [ 4]  414         bmi     L1E84
   1E76 A5 5F         [ 3]  415         lda     RAM_5F
   1E78 29 40         [ 2]  416         and     #0x40
   1E7A F0 16         [ 4]  417         beq     L1E92
   1E7C A9 80         [ 2]  418         lda     #0x80
   1E7E 85 5B         [ 3]  419         sta     RAM_5B
   1E80 A9 FA         [ 2]  420         lda     #0xFA
   1E82 85 51         [ 3]  421         sta     RAM_51
   1E84                     422 L1E84:
   1E84 A5 51         [ 3]  423         lda     RAM_51
   1E86 D0 06         [ 4]  424         bne     L1E8E
   1E88 A9 00         [ 2]  425         lda     #0x00
   1E8A 85 5B         [ 3]  426         sta     RAM_5B
   1E8C E6 5A         [ 5]  427         inc     RAM_5A
   1E8E                     428 L1E8E:
   1E8E A5 5F         [ 3]  429         lda     RAM_5F
   1E90 10 30         [ 4]  430         bpl     L1EC2
   1E92                     431 L1E92:
   1E92 AD 04 02      [ 4]  432         lda     U18_edge_detect_control_DI_neg
   1E95 49 FF         [ 2]  433         eor     #0xFF
   1E97 4A            [ 2]  434         lsr     a
   1E98 4A            [ 2]  435         lsr     a
   1E99 4A            [ 2]  436         lsr     a
   1E9A 85 57         [ 3]  437         sta     RAM_57
   1E9C 90 02         [ 4]  438         bcc     L1EA0
   1E9E E6 57         [ 5]  439         inc     RAM_57
   1EA0                     440 L1EA0:
   1EA0 A9 7A         [ 2]  441         lda     #0x7A
   1EA2 38            [ 2]  442         sec
   1EA3 E5 57         [ 3]  443         sbc     RAM_57
   1EA5 8D 15 02      [ 4]  444         sta     U18_timer_8T_DI
   1EA8 C6 50         [ 5]  445         dec     RAM_50
   1EAA C6 51         [ 5]  446         dec     RAM_51
   1EAC C6 52         [ 5]  447         dec     RAM_52
   1EAE C6 53         [ 5]  448         dec     RAM_53
   1EB0 D0 10         [ 4]  449         bne     L1EC2
   1EB2 A9 64         [ 2]  450         lda     #0x64
   1EB4 85 53         [ 3]  451         sta     RAM_53
   1EB6 C6 54         [ 5]  452         dec     RAM_54
   1EB8 C6 55         [ 5]  453         dec     RAM_55
   1EBA D0 06         [ 4]  454         bne     L1EC2
   1EBC A9 64         [ 2]  455         lda     #0x64
   1EBE 85 55         [ 3]  456         sta     RAM_55
   1EC0 C6 56         [ 5]  457         dec     RAM_56
   1EC2                     458 L1EC2:
   1EC2 60            [ 6]  459         rts
                            460 ;
   1EC3                     461 L1EC3:
   1EC3 A9 00         [ 2]  462         lda     #0x00
   1EC5 85 61         [ 3]  463         sta     RAM_61
   1EC7 85 62         [ 3]  464         sta     RAM_62
   1EC9 A9 0A         [ 2]  465         lda     #0x0A
   1ECB 85 54         [ 3]  466         sta     RAM_54
   1ECD A9 64         [ 2]  467         lda     #0x64
   1ECF 85 53         [ 3]  468         sta     RAM_53
   1ED1                     469 L1ED1:
   1ED1 20 6B 1E      [ 6]  470         jsr     L1E6B
   1ED4 A5 54         [ 3]  471         lda     RAM_54
   1ED6 D0 F9         [ 4]  472         bne     L1ED1
   1ED8 A9 0A         [ 2]  473         lda     #0x0A
   1EDA 85 54         [ 3]  474         sta     RAM_54
   1EDC A9 64         [ 2]  475         lda     #0x64
   1EDE 85 53         [ 3]  476         sta     RAM_53
   1EE0 A5 62         [ 3]  477         lda     RAM_62
   1EE2 C9 08         [ 2]  478         cmp     #0x08
   1EE4 F0 15         [ 4]  479         beq     L1EFB
   1EE6 E6 62         [ 5]  480         inc     RAM_62
   1EE8 A2 09         [ 2]  481         ldx     #0x09
   1EEA 38            [ 2]  482         sec
   1EEB AD 80 03      [ 4]  483         lda     audio_periph$ddr_reg_a
   1EEE                     484 L1EEE:
   1EEE 2A            [ 2]  485         rol     a
   1EEF CA            [ 2]  486         dex
   1EF0 90 FC         [ 4]  487         bcc     L1EEE
   1EF2 18            [ 2]  488         clc
   1EF3 8A            [ 2]  489         txa
   1EF4 65 61         [ 3]  490         adc     RAM_61
   1EF6 85 61         [ 3]  491         sta     RAM_61
   1EF8 4C D1 1E      [ 3]  492         jmp     L1ED1
                            493 ;
   1EFB                     494 L1EFB:
   1EFB 46 61         [ 5]  495         lsr     RAM_61
   1EFD 46 61         [ 5]  496         lsr     RAM_61
   1EFF 46 61         [ 5]  497         lsr     RAM_61
   1F01 A5 61         [ 3]  498         lda     RAM_61
   1F03 85 60         [ 3]  499         sta     RAM_60
   1F05 A9 00         [ 2]  500         lda     #0x00
   1F07 85 61         [ 3]  501         sta     RAM_61
   1F09 85 62         [ 3]  502         sta     RAM_62
   1F0B 60            [ 6]  503         rts
                            504 ;
   1F0C                     505 L1F0C:
   1F0C AD 80 02      [ 4]  506         lda     U19_PORTA
   1F0F 49 FF         [ 2]  507         eor     #0xFF
   1F11 4A            [ 2]  508         lsr     a
   1F12 4A            [ 2]  509         lsr     a
   1F13 4A            [ 2]  510         lsr     a
   1F14 4A            [ 2]  511         lsr     a
   1F15 18            [ 2]  512         clc
   1F16 65 60         [ 3]  513         adc     RAM_60
   1F18 AA            [ 2]  514         tax
   1F19 BD 3F 1F      [ 5]  515         lda     X1F3F,x
   1F1C 85 63         [ 3]  516         sta     RAM_63
   1F1E A5 52         [ 3]  517         lda     RAM_52
   1F20 D0 16         [ 4]  518         bne     L1F38
   1F22 A9 0A         [ 2]  519         lda     #0x0A
   1F24 85 52         [ 3]  520         sta     RAM_52
   1F26 A5 63         [ 3]  521         lda     RAM_63
   1F28 CD 82 03      [ 4]  522         cmp     audio_periph$ddr_reg_b
   1F2B 90 08         [ 4]  523         bcc     L1F35
   1F2D F0 09         [ 4]  524         beq     L1F38
   1F2F EE 82 03      [ 6]  525         inc     audio_periph$ddr_reg_b
   1F32 4C 38 1F      [ 3]  526         jmp     L1F38
                            527 ;
   1F35                     528 L1F35:
   1F35 CE 82 03      [ 6]  529         dec     audio_periph$ddr_reg_b
   1F38                     530 L1F38:
   1F38 AD 82 03      [ 4]  531         lda     audio_periph$ddr_reg_b
   1F3B 8D 82 02      [ 4]  532         sta     U19_PORTB
   1F3E 60            [ 6]  533         rts
                            534 ;
   1F3F                     535 X1F3F:
   1F3F 03 04 06 08         536         .db     0x03, 0x04, 0x06, 0x08
   1F43 10 16 20 2D         537         .db     0x10, 0x16, 0x20, 0x2D
   1F47 40 5A 80 BF         538         .db     0x40, 0x5A, 0x80, 0xBF
   1F4B FF FF FF FF         539         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F4F FF                  540         .db     0xFF
                            541 ;
                            542 ; all zeros in this gap
                            543 ;
   1FFA                     544         .org    0x1FFA
                            545 ;
                            546 ; vectors
                            547 ;
   1FFA                     548 NMIVEC:
   1FFA 00 00               549         .dw     RAM_start
   1FFC                     550 RESETVEC:
   1FFC 00 1C               551         .dw     RESET
   1FFE                     552 IRQVEC:
   1FFE 00 00               553         .dw     RAM_start
