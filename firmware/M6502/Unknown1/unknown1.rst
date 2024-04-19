                              1 
                              2         .area   region1 (ABS)
                              3 
                              4 ;
                              5 ;       Pizza Time Theatre
                              6 ;       Unknown Program (1)
                              7 ;       Version Unknown
                              8 ;
                              9 ;       This image was recovered from the last quarter of a 2732 with a black label
                             10 ;
                     0000    11 RAM_start = 0x0000
                     0050    12 X0050 = 0x0050
                     0051    13 X0051 = 0x0051
                     0052    14 X0052 = 0x0052
                     0053    15 X0053 = 0x0053
                     0054    16 X0054 = 0x0054
                     0055    17 X0055 = 0x0055
                     0056    18 X0056 = 0x0056
                     0057    19 X0057 = 0x0057
                     0058    20 X0058 = 0x0058
                     0059    21 X0059 = 0x0059
                     005A    22 X005A = 0x005A
                     005B    23 X005B = 0x005B
                     005C    24 X005C = 0x005C
                     005D    25 X005D = 0x005D
                     005E    26 X005E = 0x005E
                     005F    27 X005F = 0x005F
                     0060    28 X0060 = 0x0060
                     0061    29 X0061 = 0x0061
                     0062    30 X0062 = 0x0062
                     0063    31 X0063 = 0x0063
                     0064    32 X0064 = 0x0064
                             33 
                     0080    34 X0080 = 0x0080
                     0081    35 X0081 = 0x0081
                     0082    36 X0082 = 0x0082
                     0083    37 X0083 = 0x0083
                     0086    38 X0086 = 0x0086
                     008A    39 X008A = 0x008A
                     008E    40 X008E = 0x008E
                     0201    41 X0201 = 0x0201
                     0202    42 X0202 = 0x0202
                     0203    43 X0203 = 0x0203
                     0204    44 X0204 = 0x0204
                     0205    45 X0205 = 0x0205
                     0215    46 X0215 = 0x0215
                     0280    47 X0280 = 0x0280
                     0281    48 X0281 = 0x0281
                     0282    49 X0282 = 0x0282
                     0283    50 X0283 = 0x0283
                     0300    51 X0300 = 0x0300
                     0301    52 X0301 = 0x0301
                     0302    53 X0302 = 0x0302
                     0303    54 X0303 = 0x0303
                     0380    55 X0380 = 0x0380
                     0381    56 X0381 = 0x0381
                     0382    57 X0382 = 0x0382
                     0383    58 X0383 = 0x0383
                             59 
   1C00                      60         .org    0x1C00
                             61 ;
   1C00                      62 RESET:
   1C00 D8            [ 2]   63         cld
   1C01 78            [ 2]   64         sei
   1C02 A2 F0         [ 2]   65         ldx     #0xF0
   1C04 9A            [ 2]   66         txs
   1C05 A9 00         [ 2]   67         lda     #0x00
   1C07 A2 10         [ 2]   68         ldx     #0x10
   1C09                      69 L1C09:
   1C09 95 00         [ 4]   70         sta     RAM_start,x
   1C0B E8            [ 2]   71         inx
   1C0C E0 80         [ 2]   72         cpx     #0x80
   1C0E D0 F9         [ 4]   73         bne     L1C09
   1C10 A9 00         [ 2]   74         lda     #0x00
   1C12 8D 01 03      [ 4]   75         sta     X0301
   1C15 8D 00 03      [ 4]   76         sta     X0300
   1C18 8D 81 03      [ 4]   77         sta     X0381
   1C1B 8D 80 03      [ 4]   78         sta     X0380
   1C1E 8D 83 03      [ 4]   79         sta     X0383
   1C21 8D 05 02      [ 4]   80         sta     X0205
   1C24 8D 03 03      [ 4]   81         sta     X0303
   1C27 8D 01 02      [ 4]   82         sta     X0201
   1C2A A9 02         [ 2]   83         lda     #0x02
   1C2C 8D 81 02      [ 4]   84         sta     X0281
   1C2F A9 FF         [ 2]   85         lda     #0xFF
   1C31 8D 82 03      [ 4]   86         sta     X0382
   1C34 8D 03 02      [ 4]   87         sta     X0203
   1C37 8D 83 02      [ 4]   88         sta     X0283
   1C3A A9 FC         [ 2]   89         lda     #0xFC
   1C3C 8D 02 03      [ 4]   90         sta     X0302
   1C3F A9 2E         [ 2]   91         lda     #0x2E
   1C41 8D 01 03      [ 4]   92         sta     X0301
   1C44 8D 03 03      [ 4]   93         sta     X0303
   1C47 A9 3C         [ 2]   94         lda     #0x3C
   1C49 8D 81 03      [ 4]   95         sta     X0381
   1C4C 8D 83 03      [ 4]   96         sta     X0383
   1C4F A9 64         [ 2]   97         lda     #0x64
   1C51 85 53         [ 3]   98         sta     X0053
   1C53 A9 1E         [ 2]   99         lda     #0x1E
   1C55 85 56         [ 3]  100         sta     X0056
   1C57 A9 64         [ 2]  101         lda     #0x64
   1C59 85 55         [ 3]  102         sta     X0055
   1C5B A9 10         [ 2]  103         lda     #0x10
   1C5D 85 63         [ 3]  104         sta     X0063
   1C5F A9 10         [ 2]  105         lda     #0x10
   1C61 20 72 1D      [ 6]  106         jsr     L1D72
   1C64 A9 28         [ 2]  107         lda     #0x28
   1C66 85 54         [ 3]  108         sta     X0054
   1C68 A9 64         [ 2]  109         lda     #0x64
   1C6A 85 53         [ 3]  110         sta     X0053
   1C6C                     111 L1C6C:
   1C6C 20 83 1E      [ 6]  112         jsr     L1E83
   1C6F A5 54         [ 3]  113         lda     X0054
   1C71 D0 F9         [ 4]  114         bne     L1C6C
   1C73                     115 L1C73:
   1C73 A9 40         [ 2]  116         lda     #0x40
   1C75 20 72 1D      [ 6]  117         jsr     L1D72
   1C78                     118 L1C78:
   1C78 A9 00         [ 2]  119         lda     #0x00
   1C7A 85 58         [ 3]  120         sta     X0058
   1C7C                     121 L1C7C:
   1C7C AD 02 03      [ 4]  122         lda     X0302
   1C7F A9 0A         [ 2]  123         lda     #0x0A
   1C81 85 50         [ 3]  124         sta     X0050
   1C83 E6 58         [ 5]  125         inc     X0058
   1C85 A5 58         [ 3]  126         lda     X0058
   1C87 C9 64         [ 2]  127         cmp     #0x64
   1C89 B0 0F         [ 4]  128         bcs     L1C9A
   1C8B                     129 L1C8B:
   1C8B 20 83 1E      [ 6]  130         jsr     L1E83
   1C8E A5 50         [ 3]  131         lda     X0050
   1C90 F0 E6         [ 4]  132         beq     L1C78
   1C92 AD 03 03      [ 4]  133         lda     X0303
   1C95 10 F4         [ 4]  134         bpl     L1C8B
   1C97 4C 7C 1C      [ 3]  135         jmp     L1C7C
                            136 ;
   1C9A                     137 L1C9A:
   1C9A A9 20         [ 2]  138         lda     #0x20
   1C9C 20 72 1D      [ 6]  139         jsr     L1D72
   1C9F A9 19         [ 2]  140         lda     #0x19
   1CA1 85 54         [ 3]  141         sta     X0054
   1CA3 A9 64         [ 2]  142         lda     #0x64
   1CA5 85 53         [ 3]  143         sta     X0053
   1CA7                     144 L1CA7:
   1CA7 20 83 1E      [ 6]  145         jsr     L1E83
   1CAA A5 54         [ 3]  146         lda     X0054
   1CAC D0 F9         [ 4]  147         bne     L1CA7
   1CAE A9 00         [ 2]  148         lda     #0x00
   1CB0 85 59         [ 3]  149         sta     X0059
   1CB2 20 8D 1D      [ 6]  150         jsr     L1D8D
   1CB5 A9 40         [ 2]  151         lda     #0x40
   1CB7 20 72 1D      [ 6]  152         jsr     L1D72
   1CBA 20 8D 1D      [ 6]  153         jsr     L1D8D
   1CBD A9 FA         [ 2]  154         lda     #0xFA
   1CBF 85 50         [ 3]  155         sta     X0050
   1CC1                     156 L1CC1:
   1CC1 20 83 1E      [ 6]  157         jsr     L1E83
   1CC4 A5 50         [ 3]  158         lda     X0050
   1CC6 D0 F9         [ 4]  159         bne     L1CC1
   1CC8 A9 20         [ 2]  160         lda     #0x20
   1CCA 20 72 1D      [ 6]  161         jsr     L1D72
   1CCD 20 8D 1D      [ 6]  162         jsr     L1D8D
   1CD0 E6 59         [ 5]  163         inc     X0059
   1CD2 A9 10         [ 2]  164         lda     #0x10
   1CD4 20 72 1D      [ 6]  165         jsr     L1D72
   1CD7 A9 80         [ 2]  166         lda     #0x80
   1CD9 20 72 1D      [ 6]  167         jsr     L1D72
   1CDC 20 B0 1D      [ 6]  168         jsr     L1DB0
   1CDF A9 10         [ 2]  169         lda     #0x10
   1CE1 20 72 1D      [ 6]  170         jsr     L1D72
   1CE4 20 3F 1D      [ 6]  171         jsr     L1D3F
   1CE7                     172 L1CE7:
   1CE7 4C 68 1F      [ 3]  173         jmp     L1F68
                            174 ;
   1CEA                     175 L1CEA:
   1CEA 20 24 1F      [ 6]  176         jsr     L1F24
   1CED A5 5A         [ 3]  177         lda     X005A
   1CEF D0 10         [ 4]  178         bne     L1D01
   1CF1 A9 02         [ 2]  179         lda     #0x02
   1CF3 8D 80 02      [ 4]  180         sta     X0280
   1CF6 A9 00         [ 2]  181         lda     #0x00
   1CF8 8D 02 02      [ 4]  182         sta     X0202
   1CFB 4C E7 1C      [ 3]  183         jmp     L1CE7
                            184 ;
   1CFE EA            [ 2]  185         nop
   1CFF EA            [ 2]  186         nop
   1D00 EA            [ 2]  187         nop
   1D01                     188 L1D01:
   1D01 20 3F 1D      [ 6]  189         jsr     L1D3F
   1D04 A9 00         [ 2]  190         lda     #0x00
   1D06 8D 80 02      [ 4]  191         sta     X0280
   1D09 A9 80         [ 2]  192         lda     #0x80
   1D0B 8D 02 02      [ 4]  193         sta     X0202
   1D0E A9 80         [ 2]  194         lda     #0x80
   1D10 20 72 1D      [ 6]  195         jsr     L1D72
   1D13 20 B0 1D      [ 6]  196         jsr     L1DB0
   1D16 C6 5A         [ 5]  197         dec     X005A
   1D18 20 D6 1D      [ 6]  198         jsr     L1DD6
   1D1B 20 3F 1D      [ 6]  199         jsr     L1D3F
   1D1E A9 1E         [ 2]  200         lda     #0x1E
   1D20 85 56         [ 3]  201         sta     X0056
   1D22 A9 64         [ 2]  202         lda     #0x64
   1D24 85 55         [ 3]  203         sta     X0055
   1D26 E6 59         [ 5]  204         inc     X0059
   1D28 A5 59         [ 3]  205         lda     X0059
   1D2A C9 1A         [ 2]  206         cmp     #0x1A
   1D2C 90 03         [ 4]  207         bcc     L1D31
   1D2E 4C 73 1C      [ 3]  208         jmp     L1C73
                            209 ;
   1D31                     210 L1D31:
   1D31 20 B0 1D      [ 6]  211         jsr     L1DB0
   1D34 A9 10         [ 2]  212         lda     #0x10
   1D36 20 72 1D      [ 6]  213         jsr     L1D72
   1D39 20 DB 1E      [ 6]  214         jsr     L1EDB
   1D3C 4C E7 1C      [ 3]  215         jmp     L1CE7
                            216 ;
   1D3F                     217 L1D3F:
   1D3F A9 3C         [ 2]  218         lda     #0x3C
   1D41 8D 83 03      [ 4]  219         sta     X0383
   1D44 A9 34         [ 2]  220         lda     #0x34
   1D46 8D 81 03      [ 4]  221         sta     X0381
   1D49 A2 00         [ 2]  222         ldx     #0x00
   1D4B                     223 L1D4B:
   1D4B A9 30         [ 2]  224         lda     #0x30
   1D4D 95 81         [ 4]  225         sta     X0081,x
   1D4F 95 83         [ 4]  226         sta     X0083,x
   1D51 A9 FF         [ 2]  227         lda     #0xFF
   1D53 95 80         [ 4]  228         sta     X0080,x
   1D55 95 82         [ 4]  229         sta     X0082,x
   1D57 A9 34         [ 2]  230         lda     #0x34
   1D59 95 81         [ 4]  231         sta     X0081,x
   1D5B 95 83         [ 4]  232         sta     X0083,x
   1D5D A9 00         [ 2]  233         lda     #0x00
   1D5F 95 80         [ 4]  234         sta     X0080,x
   1D61 95 82         [ 4]  235         sta     X0082,x
   1D63 E8            [ 2]  236         inx
   1D64 E8            [ 2]  237         inx
   1D65 E8            [ 2]  238         inx
   1D66 E8            [ 2]  239         inx
   1D67 E0 20         [ 2]  240         cpx     #0x20
   1D69 90 E0         [ 4]  241         bcc     L1D4B
   1D6B A9 00         [ 2]  242         lda     #0x00
   1D6D 85 5E         [ 3]  243         sta     X005E
   1D6F 85 64         [ 3]  244         sta     X0064
   1D71 60            [ 6]  245         rts
                            246 ;
   1D72                     247 L1D72:
   1D72 8D 02 03      [ 4]  248         sta     X0302
   1D75 A9 FA         [ 2]  249         lda     #0xFA
   1D77 85 50         [ 3]  250         sta     X0050
   1D79                     251 L1D79:
   1D79 20 83 1E      [ 6]  252         jsr     L1E83
   1D7C A5 50         [ 3]  253         lda     X0050
   1D7E D0 F9         [ 4]  254         bne     L1D79
   1D80 AD 02 03      [ 4]  255         lda     X0302
   1D83 29 60         [ 2]  256         and     #0x60
   1D85 D0 05         [ 4]  257         bne     L1D8C
   1D87 A9 00         [ 2]  258         lda     #0x00
   1D89 8D 02 03      [ 4]  259         sta     X0302
   1D8C                     260 L1D8C:
   1D8C 60            [ 6]  261         rts
                            262 ;
   1D8D                     263 L1D8D:
   1D8D A9 00         [ 2]  264         lda     #0x00
   1D8F 85 58         [ 3]  265         sta     X0058
   1D91                     266 L1D91:
   1D91 AD 02 03      [ 4]  267         lda     X0302
   1D94 A9 0A         [ 2]  268         lda     #0x0A
   1D96 85 50         [ 3]  269         sta     X0050
   1D98 E6 58         [ 5]  270         inc     X0058
   1D9A A5 58         [ 3]  271         lda     X0058
   1D9C C9 21         [ 2]  272         cmp     #0x21
   1D9E B0 0F         [ 4]  273         bcs     L1DAF
   1DA0                     274 L1DA0:
   1DA0 20 83 1E      [ 6]  275         jsr     L1E83
   1DA3 A5 50         [ 3]  276         lda     X0050
   1DA5 F0 E6         [ 4]  277         beq     L1D8D
   1DA7 AD 03 03      [ 4]  278         lda     X0303
   1DAA 10 F4         [ 4]  279         bpl     L1DA0
   1DAC 4C 91 1D      [ 3]  280         jmp     L1D91
   1DAF                     281 L1DAF:
   1DAF 60            [ 6]  282         rts
                            283 ;
   1DB0                     284 L1DB0:
   1DB0 A9 FA         [ 2]  285         lda     #0xFA
   1DB2 85 50         [ 3]  286         sta     X0050
   1DB4                     287 L1DB4:
   1DB4 20 83 1E      [ 6]  288         jsr     L1E83
   1DB7 A5 50         [ 3]  289         lda     X0050
   1DB9 D0 F9         [ 4]  290         bne     L1DB4
   1DBB                     291 L1DBB:
   1DBB 20 83 1E      [ 6]  292         jsr     L1E83
   1DBE AD 02 03      [ 4]  293         lda     X0302
   1DC1 6A            [ 2]  294         ror     a
   1DC2 90 F7         [ 4]  295         bcc     L1DBB
   1DC4 A9 A0         [ 2]  296         lda     #0xA0
   1DC6 85 50         [ 3]  297         sta     X0050
   1DC8                     298 L1DC8:
   1DC8 20 83 1E      [ 6]  299         jsr     L1E83
   1DCB AD 02 03      [ 4]  300         lda     X0302
   1DCE 6A            [ 2]  301         ror     a
   1DCF 90 EA         [ 4]  302         bcc     L1DBB
   1DD1 A5 50         [ 3]  303         lda     X0050
   1DD3 D0 F3         [ 4]  304         bne     L1DC8
   1DD5 60            [ 6]  305         rts
                            306 ;
   1DD6                     307 L1DD6:
   1DD6 AD 00 03      [ 4]  308         lda     X0300
   1DD9 A9 40         [ 2]  309         lda     #0x40
   1DDB 85 82         [ 3]  310         sta     X0082
   1DDD 85 86         [ 3]  311         sta     X0086
   1DDF 85 8A         [ 3]  312         sta     X008A
   1DE1 85 8E         [ 3]  313         sta     X008E
   1DE3 A9 3C         [ 2]  314         lda     #0x3C
   1DE5 8D 81 03      [ 4]  315         sta     X0381
   1DE8 A9 34         [ 2]  316         lda     #0x34
   1DEA 8D 83 03      [ 4]  317         sta     X0383
   1DED A9 60         [ 2]  318         lda     #0x60
   1DEF 85 82         [ 3]  319         sta     X0082
   1DF1                     320 L1DF1:
   1DF1 AD 02 03      [ 4]  321         lda     X0302
   1DF4 4A            [ 2]  322         lsr     a
   1DF5 90 11         [ 4]  323         bcc     L1E08
   1DF7 20 24 1F      [ 6]  324         jsr     L1F24
   1DFA 20 83 1E      [ 6]  325         jsr     L1E83
   1DFD AD 01 03      [ 4]  326         lda     X0301
   1E00 10 EF         [ 4]  327         bpl     L1DF1
   1E02 20 1A 1E      [ 6]  328         jsr     L1E1A
   1E05 4C F1 1D      [ 3]  329         jmp     L1DF1
                            330 ;
   1E08                     331 L1E08:
   1E08 A9 64         [ 2]  332         lda     #0x64
   1E0A 85 50         [ 3]  333         sta     X0050
   1E0C                     334 L1E0C:
   1E0C 20 83 1E      [ 6]  335         jsr     L1E83
   1E0F AD 02 03      [ 4]  336         lda     X0302
   1E12 4A            [ 2]  337         lsr     a
   1E13 B0 C1         [ 4]  338         bcs     L1DD6
   1E15 A5 50         [ 3]  339         lda     X0050
   1E17 D0 F3         [ 4]  340         bne     L1E0C
   1E19 60            [ 6]  341         rts
                            342 ;
   1E1A                     343 L1E1A:
   1E1A AD 00 03      [ 4]  344         lda     X0300
   1E1D 29 7F         [ 2]  345         and     #0x7F
   1E1F 85 5C         [ 3]  346         sta     X005C
   1E21 29 7E         [ 2]  347         and     #0x7E
   1E23 C9 22         [ 2]  348         cmp     #0x22
   1E25 F0 3A         [ 4]  349         beq     L1E61
   1E27 C9 32         [ 2]  350         cmp     #0x32
   1E29 90 4F         [ 4]  351         bcc     L1E7A
   1E2B C9 3A         [ 2]  352         cmp     #0x3A
   1E2D 90 32         [ 4]  353         bcc     L1E61
   1E2F A5 5C         [ 3]  354         lda     X005C
   1E31 C9 41         [ 2]  355         cmp     #0x41
   1E33 90 45         [ 4]  356         bcc     L1E7A
   1E35 C9 4F         [ 2]  357         cmp     #0x4F
   1E37 B0 41         [ 4]  358         bcs     L1E7A
   1E39 A6 64         [ 3]  359         ldx     X0064
   1E3B 38            [ 2]  360         sec
   1E3C E9 41         [ 2]  361         sbc     #0x41
   1E3E C9 08         [ 2]  362         cmp     #0x08
   1E40 90 02         [ 4]  363         bcc     L1E44
   1E42 E8            [ 2]  364         inx
   1E43 E8            [ 2]  365         inx
   1E44                     366 L1E44:
   1E44 29 07         [ 2]  367         and     #0x07
   1E46 A8            [ 2]  368         tay
   1E47 B9 7B 1E      [ 5]  369         lda     X1E7B,y
   1E4A 85 5D         [ 3]  370         sta     X005D
   1E4C A5 5E         [ 3]  371         lda     X005E
   1E4E 4A            [ 2]  372         lsr     a
   1E4F B0 09         [ 4]  373         bcs     L1E5A
   1E51 A5 5D         [ 3]  374         lda     X005D
   1E53 49 FF         [ 2]  375         eor     #0xFF
   1E55 35 00         [ 4]  376         and     RAM_start,x
   1E57 95 00         [ 4]  377         sta     RAM_start,x
   1E59 60            [ 6]  378         rts
                            379 ;
   1E5A                     380 L1E5A:
   1E5A A5 5D         [ 3]  381         lda     X005D
   1E5C 15 00         [ 4]  382         ora     RAM_start,x
   1E5E 95 00         [ 4]  383         sta     RAM_start,x
   1E60 60            [ 6]  384         rts
                            385 ;
   1E61                     386 L1E61:
   1E61 A5 5C         [ 3]  387         lda     X005C
   1E63 85 5E         [ 3]  388         sta     X005E
   1E65 29 7E         [ 2]  389         and     #0x7E
   1E67 C9 22         [ 2]  390         cmp     #0x22
   1E69 D0 05         [ 4]  391         bne     L1E70
   1E6B A9 98         [ 2]  392         lda     #0x98
   1E6D 85 64         [ 3]  393         sta     X0064
   1E6F 60            [ 6]  394         rts
                            395 ;
   1E70                     396 L1E70:
   1E70 38            [ 2]  397         sec
   1E71 E9 32         [ 2]  398         sbc     #0x32
   1E73 0A            [ 2]  399         asl     a
   1E74 18            [ 2]  400         clc
   1E75 69 80         [ 2]  401         adc     #0x80
   1E77 85 64         [ 3]  402         sta     X0064
   1E79 60            [ 6]  403         rts
   1E7A                     404 L1E7A:
   1E7A 60            [ 6]  405         rts
                            406 ;
   1E7B                     407 X1E7B:
   1E7B 01 02 04 08         408         .db     0x01,0x02,0x04,0x08
   1E7F 10 20 40 80         409         .db     0x10,0x20,0x40,0x80
                            410 ;
   1E83                     411 L1E83:
   1E83 AD 05 02      [ 4]  412         lda     X0205
   1E86 85 5F         [ 3]  413         sta     X005F
   1E88 F0 50         [ 4]  414         beq     L1EDA
   1E8A A5 5B         [ 3]  415         lda     X005B
   1E8C 30 0E         [ 4]  416         bmi     L1E9C
   1E8E A5 5F         [ 3]  417         lda     X005F
   1E90 29 40         [ 2]  418         and     #0x40
   1E92 F0 16         [ 4]  419         beq     L1EAA
   1E94 A9 80         [ 2]  420         lda     #0x80
   1E96 85 5B         [ 3]  421         sta     X005B
   1E98 A9 FA         [ 2]  422         lda     #0xFA
   1E9A 85 51         [ 3]  423         sta     X0051
   1E9C                     424 L1E9C:
   1E9C A5 51         [ 3]  425         lda     X0051
   1E9E D0 06         [ 4]  426         bne     L1EA6
   1EA0 A9 00         [ 2]  427         lda     #0x00
   1EA2 85 5B         [ 3]  428         sta     X005B
   1EA4 E6 5A         [ 5]  429         inc     X005A
   1EA6                     430 L1EA6:
   1EA6 A5 5F         [ 3]  431         lda     X005F
   1EA8 10 30         [ 4]  432         bpl     L1EDA
   1EAA                     433 L1EAA:
   1EAA AD 04 02      [ 4]  434         lda     X0204
   1EAD 49 FF         [ 2]  435         eor     #0xFF
   1EAF 4A            [ 2]  436         lsr     a
   1EB0 4A            [ 2]  437         lsr     a
   1EB1 4A            [ 2]  438         lsr     a
   1EB2 85 57         [ 3]  439         sta     X0057
   1EB4 90 02         [ 4]  440         bcc     L1EB8
   1EB6 E6 57         [ 5]  441         inc     X0057
   1EB8                     442 L1EB8:
   1EB8 A9 7A         [ 2]  443         lda     #0x7A
   1EBA 38            [ 2]  444         sec
   1EBB E5 57         [ 3]  445         sbc     X0057
   1EBD 8D 15 02      [ 4]  446         sta     X0215
   1EC0 C6 50         [ 5]  447         dec     X0050
   1EC2 C6 51         [ 5]  448         dec     X0051
   1EC4 C6 52         [ 5]  449         dec     X0052
   1EC6 C6 53         [ 5]  450         dec     X0053
   1EC8 D0 10         [ 4]  451         bne     L1EDA
   1ECA A9 64         [ 2]  452         lda     #0x64
   1ECC 85 53         [ 3]  453         sta     X0053
   1ECE C6 54         [ 5]  454         dec     X0054
   1ED0 C6 55         [ 5]  455         dec     X0055
   1ED2 D0 06         [ 4]  456         bne     L1EDA
   1ED4 A9 64         [ 2]  457         lda     #0x64
   1ED6 85 55         [ 3]  458         sta     X0055
   1ED8 C6 56         [ 5]  459         dec     X0056
   1EDA                     460 L1EDA:
   1EDA 60            [ 6]  461         rts
                            462 ;
   1EDB                     463 L1EDB:
   1EDB A9 00         [ 2]  464         lda     #0x00
   1EDD 85 61         [ 3]  465         sta     X0061
   1EDF 85 62         [ 3]  466         sta     X0062
   1EE1 A9 0A         [ 2]  467         lda     #0x0A
   1EE3 85 54         [ 3]  468         sta     X0054
   1EE5 A9 64         [ 2]  469         lda     #0x64
   1EE7 85 53         [ 3]  470         sta     X0053
   1EE9                     471 L1EE9:
   1EE9 20 83 1E      [ 6]  472         jsr     L1E83
   1EEC A5 54         [ 3]  473         lda     X0054
   1EEE D0 F9         [ 4]  474         bne     L1EE9
   1EF0 A9 0A         [ 2]  475         lda     #0x0A
   1EF2 85 54         [ 3]  476         sta     X0054
   1EF4 A9 64         [ 2]  477         lda     #0x64
   1EF6 85 53         [ 3]  478         sta     X0053
   1EF8 A5 62         [ 3]  479         lda     X0062
   1EFA C9 08         [ 2]  480         cmp     #0x08
   1EFC F0 15         [ 4]  481         beq     L1F13
   1EFE E6 62         [ 5]  482         inc     X0062
   1F00 A2 09         [ 2]  483         ldx     #0x09
   1F02 38            [ 2]  484         sec
   1F03 AD 80 03      [ 4]  485         lda     X0380
   1F06                     486 L1F06:
   1F06 2A            [ 2]  487         rol     a
   1F07 CA            [ 2]  488         dex
   1F08 90 FC         [ 4]  489         bcc     L1F06
   1F0A 18            [ 2]  490         clc
   1F0B 8A            [ 2]  491         txa
   1F0C 65 61         [ 3]  492         adc     X0061
   1F0E 85 61         [ 3]  493         sta     X0061
   1F10 4C E9 1E      [ 3]  494         jmp     L1EE9
                            495 ;
   1F13                     496 L1F13:
   1F13 46 61         [ 5]  497         lsr     X0061
   1F15 46 61         [ 5]  498         lsr     X0061
   1F17 46 61         [ 5]  499         lsr     X0061
   1F19 A5 61         [ 3]  500         lda     X0061
   1F1B 85 60         [ 3]  501         sta     X0060
   1F1D A9 00         [ 2]  502         lda     #0x00
   1F1F 85 61         [ 3]  503         sta     X0061
   1F21 85 62         [ 3]  504         sta     X0062
   1F23 60            [ 6]  505         rts
                            506 ;
   1F24                     507 L1F24:
   1F24 AD 80 02      [ 4]  508         lda     X0280
   1F27 49 FF         [ 2]  509         eor     #0xFF
   1F29 4A            [ 2]  510         lsr     a
   1F2A 4A            [ 2]  511         lsr     a
   1F2B 4A            [ 2]  512         lsr     a
   1F2C 4A            [ 2]  513         lsr     a
   1F2D 18            [ 2]  514         clc
   1F2E 65 60         [ 3]  515         adc     X0060
   1F30 AA            [ 2]  516         tax
   1F31 BD 57 1F      [ 5]  517         lda     X1F57,x
   1F34 85 63         [ 3]  518         sta     X0063
   1F36 A5 52         [ 3]  519         lda     X0052
   1F38 D0 16         [ 4]  520         bne     L1F50
   1F3A A9 0A         [ 2]  521         lda     #0x0A
   1F3C 85 52         [ 3]  522         sta     X0052
   1F3E A5 63         [ 3]  523         lda     X0063
   1F40 CD 82 03      [ 4]  524         cmp     X0382
   1F43 90 08         [ 4]  525         bcc     L1F4D
   1F45 F0 09         [ 4]  526         beq     L1F50
   1F47 EE 82 03      [ 6]  527         inc     X0382
   1F4A 4C 50 1F      [ 3]  528         jmp     L1F50
                            529 ;
   1F4D                     530 L1F4D:
   1F4D CE 82 03      [ 6]  531         dec     X0382
   1F50                     532 L1F50:
   1F50 AD 82 03      [ 4]  533         lda     X0382
   1F53 8D 82 02      [ 4]  534         sta     X0282
   1F56 60            [ 6]  535         rts
                            536 ;
   1F57                     537 X1F57:
   1F57 03 04 06 08         538         .db     0x03, 0x04, 0x06, 0x08
   1F5B 10 16 20 2D         539         .db     0x10, 0x16, 0x20, 0x2D
   1F5F 40 5A 80 BF         540         .db     0x40, 0x5A, 0x80, 0xBF
   1F63 FF FF FF FF         541         .db     0xFF, 0xFF, 0xFF, 0xFF 
   1F67 FF                  542         .db     0xFF
                            543 ;
   1F68                     544 L1F68:
   1F68 A9 00         [ 2]  545         lda     #0x00
   1F6A 85 5A         [ 3]  546         sta     X005A
   1F6C 20 83 1E      [ 6]  547         jsr     L1E83
   1F6F 4C EA 1C      [ 3]  548         jmp     L1CEA
                            549 ;
                            550 ; all zeros in this gap
                            551 ;
   1FFC                     552         .org    0x1FFC
                            553 ;
                            554 ; vectors
                            555 ;
   1FFC                     556 RESETVEC:
   1FFC 00 1C               557         .dw     RESET
   1FFE                     558 IRQVEC:
   1FFE 00 00               559         .dw     RAM_start
                            560 
