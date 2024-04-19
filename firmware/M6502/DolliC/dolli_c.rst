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
                     0084    33 X0084 = 0x0084
                     0086    34 X0086 = 0x0086
                     0088    35 X0088 = 0x0088
                     008A    36 X008A = 0x008A
                     0201    37 X0201 = 0x0201
                     0202    38 X0202 = 0x0202
                     0203    39 X0203 = 0x0203
                     0204    40 X0204 = 0x0204
                     0205    41 X0205 = 0x0205
                     0217    42 X0217 = 0x0217
                     0280    43 X0280 = 0x0280
                     0281    44 X0281 = 0x0281
                     0282    45 X0282 = 0x0282
                     0283    46 X0283 = 0x0283
                     0300    47 X0300 = 0x0300
                     0301    48 X0301 = 0x0301
                     0302    49 X0302 = 0x0302
                     0303    50 X0303 = 0x0303
                     0380    51 X0380 = 0x0380
                     0381    52 X0381 = 0x0381
                     0382    53 X0382 = 0x0382
                     0383    54 X0383 = 0x0383
                             55 
   1C00                      56         .org    0x1C00
                             57 ;
   1C00                      58 RESET:
   1C00 D8            [ 2]   59         cld
   1C01 78            [ 2]   60         sei
   1C02 A2 F0         [ 2]   61         ldx     #0xF0
   1C04 9A            [ 2]   62         txs
   1C05 A9 00         [ 2]   63         lda     #0x00
   1C07 A2 10         [ 2]   64         ldx     #0x10
   1C09                      65 L1C09:
   1C09 95 00         [ 4]   66         sta     X0000,x
   1C0B E8            [ 2]   67         inx
   1C0C E0 80         [ 2]   68         cpx     #0x80
   1C0E D0 F9         [ 4]   69         bne     L1C09
   1C10 A9 00         [ 2]   70         lda     #0x00
   1C12 8D 01 03      [ 4]   71         sta     X0301
   1C15 8D 00 03      [ 4]   72         sta     X0300
   1C18 8D 81 03      [ 4]   73         sta     X0381
   1C1B 8D 80 03      [ 4]   74         sta     X0380
   1C1E 8D 83 03      [ 4]   75         sta     X0383
   1C21 8D 05 02      [ 4]   76         sta     X0205
   1C24 8D 03 03      [ 4]   77         sta     X0303
   1C27 8D 01 02      [ 4]   78         sta     X0201
   1C2A A9 02         [ 2]   79         lda     #0x02
   1C2C 8D 81 02      [ 4]   80         sta     X0281
   1C2F A9 FF         [ 2]   81         lda     #0xFF
   1C31 8D 82 03      [ 4]   82         sta     X0382
   1C34 8D 03 02      [ 4]   83         sta     X0203
   1C37 8D 83 02      [ 4]   84         sta     X0283
   1C3A A9 FC         [ 2]   85         lda     #0xFC
   1C3C 8D 02 03      [ 4]   86         sta     X0302
   1C3F A9 2E         [ 2]   87         lda     #0x2E
   1C41 8D 01 03      [ 4]   88         sta     X0301
   1C44 8D 03 03      [ 4]   89         sta     X0303
   1C47 8D 83 03      [ 4]   90         sta     X0383
   1C4A 8D 81 03      [ 4]   91         sta     X0381
   1C4D A9 64         [ 2]   92         lda     #0x64
   1C4F 85 53         [ 3]   93         sta     X0053
   1C51 A9 2B         [ 2]   94         lda     #0x2B
   1C53 85 57         [ 3]   95         sta     X0057
   1C55 A9 10         [ 2]   96         lda     #0x10
   1C57 85 63         [ 3]   97         sta     X0063
   1C59 A9 10         [ 2]   98         lda     #0x10
   1C5B 20 1F 1D      [ 6]   99         jsr     L1D1F
   1C5E A9 28         [ 2]  100         lda     #0x28
   1C60 85 54         [ 3]  101         sta     X0054
   1C62                     102 L1C62:
   1C62 20 13 1E      [ 6]  103         jsr     L1E13
   1C65 A5 54         [ 3]  104         lda     X0054
   1C67 D0 F9         [ 4]  105         bne     L1C62
   1C69                     106 L1C69:
   1C69 A9 40         [ 2]  107         lda     #0x40
   1C6B 20 1F 1D      [ 6]  108         jsr     L1D1F
   1C6E                     109 L1C6E:
   1C6E 20 33 1D      [ 6]  110         jsr     L1D33
   1C71 A5 58         [ 3]  111         lda     X0058
   1C73 C9 60         [ 2]  112         cmp     #0x60
   1C75 90 F7         [ 4]  113         bcc     L1C6E
   1C77 A9 20         [ 2]  114         lda     #0x20
   1C79 20 1F 1D      [ 6]  115         jsr     L1D1F
   1C7C A9 19         [ 2]  116         lda     #0x19
   1C7E 85 54         [ 3]  117         sta     X0054
   1C80                     118 L1C80:
   1C80 20 13 1E      [ 6]  119         jsr     L1E13
   1C83 A5 54         [ 3]  120         lda     X0054
   1C85 D0 F9         [ 4]  121         bne     L1C80
   1C87 A9 00         [ 2]  122         lda     #0x00
   1C89 85 59         [ 3]  123         sta     X0059
   1C8B 20 33 1D      [ 6]  124         jsr     L1D33
   1C8E E6 59         [ 5]  125         inc     X0059
   1C90 A9 10         [ 2]  126         lda     #0x10
   1C92 20 1F 1D      [ 6]  127         jsr     L1D1F
   1C95 A9 80         [ 2]  128         lda     #0x80
   1C97 20 1F 1D      [ 6]  129         jsr     L1D1F
   1C9A 20 61 1D      [ 6]  130         jsr     L1D61
   1C9D A9 10         [ 2]  131         lda     #0x10
   1C9F 20 1F 1D      [ 6]  132         jsr     L1D1F
   1CA2 20 F9 1C      [ 6]  133         jsr     L1CF9
   1CA5                     134 L1CA5:
   1CA5 20 13 1E      [ 6]  135         jsr     L1E13
   1CA8 20 A0 1E      [ 6]  136         jsr     L1EA0
   1CAB A5 5A         [ 3]  137         lda     X005A
   1CAD D0 10         [ 4]  138         bne     L1CBF
   1CAF A9 02         [ 2]  139         lda     #0x02
   1CB1 8D 80 02      [ 4]  140         sta     X0280
   1CB4 A9 00         [ 2]  141         lda     #0x00
   1CB6 8D 02 02      [ 4]  142         sta     X0202
   1CB9 A5 57         [ 3]  143         lda     X0057
   1CBB D0 E8         [ 4]  144         bne     L1CA5
   1CBD E6 5A         [ 5]  145         inc     X005A
   1CBF                     146 L1CBF:
   1CBF 20 F9 1C      [ 6]  147         jsr     L1CF9
   1CC2 A9 00         [ 2]  148         lda     #0x00
   1CC4 8D 80 02      [ 4]  149         sta     X0280
   1CC7 A9 80         [ 2]  150         lda     #0x80
   1CC9 8D 02 02      [ 4]  151         sta     X0202
   1CCC A9 80         [ 2]  152         lda     #0x80
   1CCE 20 1F 1D      [ 6]  153         jsr     L1D1F
   1CD1 20 61 1D      [ 6]  154         jsr     L1D61
   1CD4 C6 5A         [ 5]  155         dec     X005A
   1CD6 20 87 1D      [ 6]  156         jsr     L1D87
   1CD9 20 F9 1C      [ 6]  157         jsr     L1CF9
   1CDC A9 2B         [ 2]  158         lda     #0x2B
   1CDE 85 57         [ 3]  159         sta     X0057
   1CE0 E6 59         [ 5]  160         inc     X0059
   1CE2 A5 59         [ 3]  161         lda     X0059
   1CE4 C9 1A         [ 2]  162         cmp     #0x1A
   1CE6 90 03         [ 4]  163         bcc     L1CEB
   1CE8 4C 69 1C      [ 3]  164         jmp     L1C69
                            165 ;
   1CEB                     166 L1CEB:
   1CEB 20 61 1D      [ 6]  167         jsr     L1D61
   1CEE A9 10         [ 2]  168         lda     #0x10
   1CF0 20 1F 1D      [ 6]  169         jsr     L1D1F
   1CF3 20 5F 1E      [ 6]  170         jsr     L1E5F
   1CF6 4C A5 1C      [ 3]  171         jmp     L1CA5
                            172 ;
   1CF9                     173 L1CF9:
   1CF9 A9 00         [ 2]  174         lda     #0x00
   1CFB A2 01         [ 2]  175         ldx     #0x01
   1CFD 20 16 1D      [ 6]  176         jsr     L1D16
   1D00 A9 FF         [ 2]  177         lda     #0xFF
   1D02 A2 00         [ 2]  178         ldx     #0x00
   1D04 20 16 1D      [ 6]  179         jsr     L1D16
   1D07 A9 34         [ 2]  180         lda     #0x34
   1D09 A2 01         [ 2]  181         ldx     #0x01
   1D0B 20 16 1D      [ 6]  182         jsr     L1D16
   1D0E A9 00         [ 2]  183         lda     #0x00
   1D10 A2 00         [ 2]  184         ldx     #0x00
   1D12 20 16 1D      [ 6]  185         jsr     L1D16
   1D15 60            [ 6]  186         rts
                            187 ;
   1D16                     188 L1D16:
   1D16 95 84         [ 4]  189         sta     X0084,x
   1D18 95 86         [ 4]  190         sta     X0086,x
   1D1A 95 88         [ 4]  191         sta     X0088,x
   1D1C 95 8A         [ 4]  192         sta     X008A,x
   1D1E 60            [ 6]  193         rts
                            194 ;
   1D1F                     195 L1D1F:
   1D1F 8D 02 03      [ 4]  196         sta     X0302
   1D22 A9 FF         [ 2]  197         lda     #0xFF
   1D24 85 50         [ 3]  198         sta     X0050
   1D26                     199 L1D26:
   1D26 20 13 1E      [ 6]  200         jsr     L1E13
   1D29 A5 50         [ 3]  201         lda     X0050
   1D2B D0 F9         [ 4]  202         bne     L1D26
   1D2D A9 00         [ 2]  203         lda     #0x00
   1D2F 8D 02 03      [ 4]  204         sta     X0302
   1D32 60            [ 6]  205         rts
                            206 ;
   1D33                     207 L1D33:
   1D33 A9 00         [ 2]  208         lda     #0x00
   1D35 85 58         [ 3]  209         sta     X0058
   1D37                     210 L1D37:
   1D37 20 13 1E      [ 6]  211         jsr     L1E13
   1D3A AD 03 03      [ 4]  212         lda     X0303
   1D3D 10 F8         [ 4]  213         bpl     L1D37
   1D3F A9 04         [ 2]  214         lda     #0x04
   1D41 85 54         [ 3]  215         sta     X0054
   1D43                     216 L1D43:
   1D43 20 13 1E      [ 6]  217         jsr     L1E13
   1D46 AD 03 03      [ 4]  218         lda     X0303
   1D49 10 0B         [ 4]  219         bpl     L1D56
   1D4B E6 58         [ 5]  220         inc     X0058
   1D4D AD 02 03      [ 4]  221         lda     X0302
   1D50 A5 58         [ 3]  222         lda     X0058
   1D52 C9 60         [ 2]  223         cmp     #0x60
   1D54 B0 0A         [ 4]  224         bcs     L1D60
   1D56                     225 L1D56:
   1D56 A5 54         [ 3]  226         lda     X0054
   1D58 D0 E9         [ 4]  227         bne     L1D43
   1D5A A5 58         [ 3]  228         lda     X0058
   1D5C C9 20         [ 2]  229         cmp     #0x20
   1D5E 90 D3         [ 4]  230         bcc     L1D33
   1D60                     231 L1D60:
   1D60 60            [ 6]  232         rts
                            233 ;
   1D61                     234 L1D61:
   1D61 A9 FA         [ 2]  235         lda     #0xFA
   1D63 85 50         [ 3]  236         sta     X0050
   1D65                     237 L1D65:
   1D65 20 13 1E      [ 6]  238         jsr     L1E13
   1D68 A5 50         [ 3]  239         lda     X0050
   1D6A D0 F9         [ 4]  240         bne     L1D65
   1D6C                     241 L1D6C:
   1D6C 20 13 1E      [ 6]  242         jsr     L1E13
   1D6F AD 02 03      [ 4]  243         lda     X0302
   1D72 6A            [ 2]  244         ror     a
   1D73 90 F7         [ 4]  245         bcc     L1D6C
   1D75 A9 A0         [ 2]  246         lda     #0xA0
   1D77 85 50         [ 3]  247         sta     X0050
   1D79                     248 L1D79:
   1D79 20 13 1E      [ 6]  249         jsr     L1E13
   1D7C AD 02 03      [ 4]  250         lda     X0302
   1D7F 6A            [ 2]  251         ror     a
   1D80 90 EA         [ 4]  252         bcc     L1D6C
   1D82 A5 50         [ 3]  253         lda     X0050
   1D84 D0 F3         [ 4]  254         bne     L1D79
   1D86 60            [ 6]  255         rts
                            256 ;
   1D87                     257 L1D87:
   1D87 AD 00 03      [ 4]  258         lda     X0300
   1D8A A9 40         [ 2]  259         lda     #0x40
   1D8C 85 86         [ 3]  260         sta     X0086
   1D8E 85 8A         [ 3]  261         sta     X008A
   1D90                     262 L1D90:
   1D90 AD 02 03      [ 4]  263         lda     X0302
   1D93 4A            [ 2]  264         lsr     a
   1D94 90 11         [ 4]  265         bcc     L1DA7
   1D96 20 A0 1E      [ 6]  266         jsr     L1EA0
   1D99 20 13 1E      [ 6]  267         jsr     L1E13
   1D9C AD 01 03      [ 4]  268         lda     X0301
   1D9F 10 EF         [ 4]  269         bpl     L1D90
   1DA1 20 B9 1D      [ 6]  270         jsr     L1DB9
   1DA4 4C 90 1D      [ 3]  271         jmp     L1D90
                            272 ;
   1DA7                     273 L1DA7:
   1DA7 A9 64         [ 2]  274         lda     #0x64
   1DA9 85 50         [ 3]  275         sta     X0050
   1DAB                     276 L1DAB:
   1DAB 20 13 1E      [ 6]  277         jsr     L1E13
   1DAE AD 02 03      [ 4]  278         lda     X0302
   1DB1 4A            [ 2]  279         lsr     a
   1DB2 B0 D3         [ 4]  280         bcs     L1D87
   1DB4 A5 50         [ 3]  281         lda     X0050
   1DB6 D0 F3         [ 4]  282         bne     L1DAB
   1DB8 60            [ 6]  283         rts
                            284 ;
   1DB9                     285 L1DB9:
   1DB9 AD 00 03      [ 4]  286         lda     X0300
   1DBC 29 7F         [ 2]  287         and     #0x7F
   1DBE 85 5C         [ 3]  288         sta     X005C
   1DC0 29 7E         [ 2]  289         and     #0x7E
   1DC2 C9 22         [ 2]  290         cmp     #0x22
   1DC4 F0 38         [ 4]  291         beq     L1DFE
   1DC6 C9 36         [ 2]  292         cmp     #0x36
   1DC8 F0 34         [ 4]  293         beq     L1DFE
   1DCA A5 5C         [ 3]  294         lda     X005C
   1DCC 38            [ 2]  295         sec
   1DCD E9 41         [ 2]  296         sbc     #0x41
   1DCF A8            [ 2]  297         tay
   1DD0 30 30         [ 4]  298         bmi     L1E02
   1DD2 C9 10         [ 2]  299         cmp     #0x10
   1DD4 B0 2C         [ 4]  300         bcs     L1E02
   1DD6 A2 84         [ 2]  301         ldx     #0x84
   1DD8 C9 08         [ 2]  302         cmp     #0x08
   1DDA 90 08         [ 4]  303         bcc     L1DE4
   1DDC A2 88         [ 2]  304         ldx     #0x88
   1DDE C9 0E         [ 2]  305         cmp     #0x0E
   1DE0 90 02         [ 4]  306         bcc     L1DE4
   1DE2 A2 8A         [ 2]  307         ldx     #0x8A
   1DE4                     308 L1DE4:
   1DE4 B9 03 1E      [ 5]  309         lda     X1E03,y
   1DE7 85 5D         [ 3]  310         sta     X005D
   1DE9 A5 5E         [ 3]  311         lda     X005E
   1DEB 4A            [ 2]  312         lsr     a
   1DEC B0 09         [ 4]  313         bcs     L1DF7
   1DEE A5 5D         [ 3]  314         lda     X005D
   1DF0 49 FF         [ 2]  315         eor     #0xFF
   1DF2 35 00         [ 4]  316         and     X0000,x
   1DF4 95 00         [ 4]  317         sta     X0000,x
   1DF6 60            [ 6]  318         rts
                            319 ;
   1DF7                     320 L1DF7:
   1DF7 A5 5D         [ 3]  321         lda     X005D
   1DF9 15 00         [ 4]  322         ora     X0000,x
   1DFB 95 00         [ 4]  323         sta     X0000,x
   1DFD 60            [ 6]  324         rts
                            325 ;
   1DFE                     326 L1DFE:
   1DFE A5 5C         [ 3]  327         lda     X005C
   1E00 85 5E         [ 3]  328         sta     X005E
   1E02                     329 L1E02:
   1E02 60            [ 6]  330         rts
                            331 ;
   1E03                     332 X1E03:
   1E03 01 02 04 08         333         .db     0x01,0x02,0x04,0x08
   1E07 10 20 40 80         334         .db     0x10,0x20,0x40,0x80
   1E0B 01 02 04 08         335         .db     0x01,0x02,0x04,0x08
   1E0F 10 20 01 02         336         .db     0x10,0x20,0x01,0x02
                            337 ;
   1E13                     338 L1E13:
   1E13 AD 05 02      [ 4]  339         lda     X0205
   1E16 85 5F         [ 3]  340         sta     X005F
   1E18 F0 44         [ 4]  341         beq     L1E5E
   1E1A A5 5B         [ 3]  342         lda     X005B
   1E1C 30 0E         [ 4]  343         bmi     L1E2C
   1E1E A5 5F         [ 3]  344         lda     X005F
   1E20 29 40         [ 2]  345         and     #0x40
   1E22 F0 16         [ 4]  346         beq     L1E3A
   1E24 A9 80         [ 2]  347         lda     #0x80
   1E26 85 5B         [ 3]  348         sta     X005B
   1E28 A9 FA         [ 2]  349         lda     #0xFA
   1E2A 85 51         [ 3]  350         sta     X0051
   1E2C                     351 L1E2C:
   1E2C A5 51         [ 3]  352         lda     X0051
   1E2E D0 06         [ 4]  353         bne     L1E36
   1E30 A9 00         [ 2]  354         lda     #0x00
   1E32 85 5B         [ 3]  355         sta     X005B
   1E34 E6 5A         [ 5]  356         inc     X005A
   1E36                     357 L1E36:
   1E36 A5 5F         [ 3]  358         lda     X005F
   1E38 10 24         [ 4]  359         bpl     L1E5E
   1E3A                     360 L1E3A:
   1E3A AD 04 02      [ 4]  361         lda     X0204
   1E3D A9 01         [ 2]  362         lda     #0x01
   1E3F 8D 17 02      [ 4]  363         sta     X0217
   1E42 C6 50         [ 5]  364         dec     X0050
   1E44 C6 51         [ 5]  365         dec     X0051
   1E46 C6 52         [ 5]  366         dec     X0052
   1E48 C6 53         [ 5]  367         dec     X0053
   1E4A D0 12         [ 4]  368         bne     L1E5E
   1E4C A9 64         [ 2]  369         lda     #0x64
   1E4E 85 53         [ 3]  370         sta     X0053
   1E50 C6 54         [ 5]  371         dec     X0054
   1E52 C6 55         [ 5]  372         dec     X0055
   1E54 C6 56         [ 5]  373         dec     X0056
   1E56 D0 06         [ 4]  374         bne     L1E5E
   1E58 A9 64         [ 2]  375         lda     #0x64
   1E5A 85 56         [ 3]  376         sta     X0056
   1E5C C6 57         [ 5]  377         dec     X0057
   1E5E                     378 L1E5E:
   1E5E 60            [ 6]  379         rts
                            380 ;
   1E5F                     381 L1E5F:
   1E5F A9 00         [ 2]  382         lda     #0x00
   1E61 85 61         [ 3]  383         sta     X0061
   1E63 85 62         [ 3]  384         sta     X0062
   1E65 A9 0A         [ 2]  385         lda     #0x0A
   1E67 85 54         [ 3]  386         sta     X0054
   1E69                     387 L1E69:
   1E69 20 13 1E      [ 6]  388         jsr     L1E13
   1E6C A5 54         [ 3]  389         lda     X0054
   1E6E D0 F9         [ 4]  390         bne     L1E69
   1E70 A9 0A         [ 2]  391         lda     #0x0A
   1E72 85 54         [ 3]  392         sta     X0054
   1E74 A5 62         [ 3]  393         lda     X0062
   1E76 C9 08         [ 2]  394         cmp     #0x08
   1E78 F0 15         [ 4]  395         beq     L1E8F
   1E7A E6 62         [ 5]  396         inc     X0062
   1E7C A2 09         [ 2]  397         ldx     #0x09
   1E7E 38            [ 2]  398         sec
   1E7F AD 80 03      [ 4]  399         lda     X0380
   1E82                     400 L1E82:
   1E82 2A            [ 2]  401         rol     a
   1E83 CA            [ 2]  402         dex
   1E84 90 FC         [ 4]  403         bcc     L1E82
   1E86 18            [ 2]  404         clc
   1E87 8A            [ 2]  405         txa
   1E88 65 61         [ 3]  406         adc     X0061
   1E8A 85 61         [ 3]  407         sta     X0061
   1E8C 4C 69 1E      [ 3]  408         jmp     L1E69
                            409 ;
   1E8F                     410 L1E8F:
   1E8F 46 61         [ 5]  411         lsr     X0061
   1E91 46 61         [ 5]  412         lsr     X0061
   1E93 46 61         [ 5]  413         lsr     X0061
   1E95 A5 61         [ 3]  414         lda     X0061
   1E97 85 60         [ 3]  415         sta     X0060
   1E99 A9 00         [ 2]  416         lda     #0x00
   1E9B 85 61         [ 3]  417         sta     X0061
   1E9D 85 62         [ 3]  418         sta     X0062
   1E9F 60            [ 6]  419         rts
                            420 ;
   1EA0                     421 L1EA0:
   1EA0 AD 80 02      [ 4]  422         lda     X0280
   1EA3 49 FF         [ 2]  423         eor     #0xFF
   1EA5 4A            [ 2]  424         lsr     a
   1EA6 4A            [ 2]  425         lsr     a
   1EA7 4A            [ 2]  426         lsr     a
   1EA8 4A            [ 2]  427         lsr     a
   1EA9 18            [ 2]  428         clc
   1EAA 65 60         [ 3]  429         adc     X0060
   1EAC AA            [ 2]  430         tax
   1EAD BD D3 1E      [ 5]  431         lda     X1ED3,x
   1EB0 85 63         [ 3]  432         sta     X0063
   1EB2 A5 52         [ 3]  433         lda     X0052
   1EB4 D0 16         [ 4]  434         bne     L1ECC
   1EB6 A9 0A         [ 2]  435         lda     #0x0A
   1EB8 85 52         [ 3]  436         sta     X0052
   1EBA A5 63         [ 3]  437         lda     X0063
   1EBC CD 82 03      [ 4]  438         cmp     X0382
   1EBF 90 08         [ 4]  439         bcc     L1EC9
   1EC1 F0 09         [ 4]  440         beq     L1ECC
   1EC3 EE 82 03      [ 6]  441         inc     X0382
   1EC6 4C CC 1E      [ 3]  442         jmp     L1ECC
                            443 ;
   1EC9                     444 L1EC9:
   1EC9 CE 82 03      [ 6]  445         dec     X0382
   1ECC                     446 L1ECC:
   1ECC AD 82 03      [ 4]  447         lda     X0382
   1ECF 8D 82 02      [ 4]  448         sta     X0282
   1ED2 60            [ 6]  449         rts
                            450 ;
   1ED3                     451 X1ED3:
   1ED3 03 04 06 08         452         .db     0x03, 0x04, 0x06, 0x08
   1ED7 10 16 20 2D         453         .db     0x10, 0x16, 0x20, 0x2D
   1EDB 40 5A 80 BF         454         .db     0x40, 0x5A, 0x80, 0xBF
   1EDF FF FF FF FF         455         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1EE3 FF                  456         .db     0xFF
                            457 ;
                            458 ; all ff's in this gap
                            459 ;
   1FFC                     460         .org    0x1FFC
                            461 ;
                            462 ; vectors
                            463 ;
   1FFC                     464 RESETVEC:
   1FFC 00 1C               465         .dw     RESET
   1FFE                     466 IRQVEC:
   1FFE FF FF               467         .dw     0xFFFF
