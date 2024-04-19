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
                     0000    11 X0000 = 0x0000
                             12 
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
                     0064    33 X0064 = 0x0064
                             34 
                     0080    35 X0080 = 0x0080
                     0081    36 X0081 = 0x0081
                     0082    37 X0082 = 0x0082
                     0083    38 X0083 = 0x0083
                     0086    39 X0086 = 0x0086
                     008A    40 X008A = 0x008A
                     008E    41 X008E = 0x008E
                     0201    42 X0201 = 0x0201
                     0202    43 X0202 = 0x0202
                     0203    44 X0203 = 0x0203
                     0204    45 X0204 = 0x0204
                     0205    46 X0205 = 0x0205
                     0215    47 X0215 = 0x0215
                     0280    48 X0280 = 0x0280
                     0281    49 X0281 = 0x0281
                     0282    50 X0282 = 0x0282
                     0283    51 X0283 = 0x0283
                     0300    52 X0300 = 0x0300
                     0301    53 X0301 = 0x0301
                     0302    54 X0302 = 0x0302
                     0303    55 X0303 = 0x0303
                     0380    56 X0380 = 0x0380
                     0381    57 X0381 = 0x0381
                     0382    58 X0382 = 0x0382
                     0383    59 X0383 = 0x0383
                             60 
   1C00                      61         .org	0x1C00
                             62 ;
   1C00                      63 RESET:
   1C00 D8            [ 2]   64         cld
   1C01 78            [ 2]   65         sei
   1C02 A2 F0         [ 2]   66         ldx	#0xF0
   1C04 9A            [ 2]   67         txs
   1C05 A9 00         [ 2]   68         lda	#0x00
   1C07 A2 10         [ 2]   69         ldx	#0x10
   1C09                      70 L1C09:
   1C09 95 00         [ 4]   71         sta	X0000,x
   1C0B E8            [ 2]   72         inx
   1C0C E0 80         [ 2]   73         cpx	#0x80
   1C0E D0 F9         [ 4]   74         bne	L1C09
   1C10 A9 00         [ 2]   75         lda	#0x00
   1C12 8D 01 03      [ 4]   76         sta	X0301
   1C15 8D 00 03      [ 4]   77         sta	X0300
   1C18 8D 81 03      [ 4]   78         sta	X0381
   1C1B 8D 80 03      [ 4]   79         sta	X0380
   1C1E 8D 83 03      [ 4]   80         sta	X0383
   1C21 8D 05 02      [ 4]   81         sta	X0205
   1C24 8D 03 03      [ 4]   82         sta	X0303
   1C27 8D 01 02      [ 4]   83         sta	X0201
   1C2A A9 02         [ 2]   84         lda	#0x02
   1C2C 8D 81 02      [ 4]   85         sta	X0281
   1C2F A9 FF         [ 2]   86         lda	#0xFF
   1C31 8D 82 03      [ 4]   87         sta	X0382
   1C34 8D 03 02      [ 4]   88         sta	X0203
   1C37 8D 83 02      [ 4]   89         sta	X0283
   1C3A A9 FC         [ 2]   90         lda	#0xFC
   1C3C 8D 02 03      [ 4]   91         sta	X0302
   1C3F A9 2E         [ 2]   92         lda	#0x2E
   1C41 8D 01 03      [ 4]   93         sta	X0301
   1C44 8D 03 03      [ 4]   94         sta	X0303
   1C47 A9 3C         [ 2]   95         lda	#0x3C
   1C49 8D 81 03      [ 4]   96         sta	X0381
   1C4C 8D 83 03      [ 4]   97         sta	X0383
   1C4F A9 64         [ 2]   98         lda	#0x64
   1C51 85 53         [ 3]   99         sta	X0053
   1C53 A9 1E         [ 2]  100         lda	#0x1E
   1C55 85 56         [ 3]  101         sta	X0056
   1C57 A9 64         [ 2]  102         lda	#0x64
   1C59 85 55         [ 3]  103         sta	X0055
   1C5B A9 10         [ 2]  104         lda	#0x10
   1C5D 85 63         [ 3]  105         sta	X0063
   1C5F A9 10         [ 2]  106         lda	#0x10
   1C61 20 72 1D      [ 6]  107         jsr	L1D72
   1C64 A9 28         [ 2]  108         lda	#0x28
   1C66 85 54         [ 3]  109         sta	X0054
   1C68 A9 64         [ 2]  110         lda	#0x64
   1C6A 85 53         [ 3]  111         sta	X0053
   1C6C                     112 L1C6C:
   1C6C 20 83 1E      [ 6]  113         jsr	L1E83
   1C6F A5 54         [ 3]  114         lda	X0054
   1C71 D0 F9         [ 4]  115         bne	L1C6C
   1C73                     116 L1C73:
   1C73 A9 40         [ 2]  117         lda	#0x40
   1C75 20 72 1D      [ 6]  118         jsr	L1D72
   1C78                     119 L1C78:
   1C78 A9 00         [ 2]  120         lda	#0x00
   1C7A 85 58         [ 3]  121         sta	X0058
   1C7C                     122 L1C7C:
   1C7C AD 02 03      [ 4]  123         lda	X0302
   1C7F A9 0A         [ 2]  124         lda	#0x0A
   1C81 85 50         [ 3]  125         sta	X0050
   1C83 E6 58         [ 5]  126         inc	X0058
   1C85 A5 58         [ 3]  127         lda	X0058
   1C87 C9 64         [ 2]  128         cmp	#0x64
   1C89 B0 0F         [ 4]  129         bcs	L1C9A
   1C8B                     130 L1C8B:
   1C8B 20 83 1E      [ 6]  131         jsr	L1E83
   1C8E A5 50         [ 3]  132         lda	X0050
   1C90 F0 E6         [ 4]  133         beq	L1C78
   1C92 AD 03 03      [ 4]  134         lda	X0303
   1C95 10 F4         [ 4]  135         bpl	L1C8B
   1C97 4C 7C 1C      [ 3]  136         jmp	L1C7C
                            137 ;
   1C9A                     138 L1C9A:
   1C9A A9 20         [ 2]  139         lda	#0x20
   1C9C 20 72 1D      [ 6]  140         jsr	L1D72
   1C9F A9 19         [ 2]  141         lda	#0x19
   1CA1 85 54         [ 3]  142         sta	X0054
   1CA3 A9 64         [ 2]  143         lda	#0x64
   1CA5 85 53         [ 3]  144         sta	X0053
   1CA7                     145 L1CA7:
   1CA7 20 83 1E      [ 6]  146         jsr	L1E83
   1CAA A5 54         [ 3]  147         lda	X0054
   1CAC D0 F9         [ 4]  148         bne	L1CA7
   1CAE A9 00         [ 2]  149         lda	#0x00
   1CB0 85 59         [ 3]  150         sta	X0059
   1CB2 20 8D 1D      [ 6]  151         jsr	L1D8D
   1CB5 A9 40         [ 2]  152         lda	#0x40
   1CB7 20 72 1D      [ 6]  153         jsr	L1D72
   1CBA 20 8D 1D      [ 6]  154         jsr	L1D8D
   1CBD A9 FA         [ 2]  155         lda	#0xFA
   1CBF 85 50         [ 3]  156         sta	X0050
   1CC1                     157 L1CC1:
   1CC1 20 83 1E      [ 6]  158         jsr	L1E83
   1CC4 A5 50         [ 3]  159         lda	X0050
   1CC6 D0 F9         [ 4]  160         bne	L1CC1
   1CC8 A9 20         [ 2]  161         lda	#0x20
   1CCA 20 72 1D      [ 6]  162         jsr	L1D72
   1CCD 20 8D 1D      [ 6]  163         jsr	L1D8D
   1CD0 E6 59         [ 5]  164         inc	X0059
   1CD2 A9 10         [ 2]  165         lda	#0x10
   1CD4 20 72 1D      [ 6]  166         jsr	L1D72
   1CD7 A9 80         [ 2]  167         lda	#0x80
   1CD9 20 72 1D      [ 6]  168         jsr	L1D72
   1CDC 20 B0 1D      [ 6]  169         jsr	L1DB0
   1CDF A9 10         [ 2]  170         lda	#0x10
   1CE1 20 72 1D      [ 6]  171         jsr	L1D72
   1CE4 20 3F 1D      [ 6]  172         jsr	L1D3F
   1CE7                     173 L1CE7:
   1CE7 4C 68 1F      [ 3]  174         jmp	L1F68
                            175 ;
   1CEA                     176 L1CEA:
   1CEA 20 24 1F      [ 6]  177         jsr	L1F24
   1CED A5 5A         [ 3]  178         lda	X005A
   1CEF D0 10         [ 4]  179         bne	L1D01
   1CF1 A9 02         [ 2]  180         lda	#0x02
   1CF3 8D 80 02      [ 4]  181         sta	X0280
   1CF6 A9 00         [ 2]  182         lda	#0x00
   1CF8 8D 02 02      [ 4]  183         sta	X0202
   1CFB 4C E7 1C      [ 3]  184         jmp	L1CE7
                            185 ;
   1CFE EA            [ 2]  186         nop
   1CFF EA            [ 2]  187         nop
   1D00 EA            [ 2]  188         nop
   1D01                     189 L1D01:
   1D01 20 3F 1D      [ 6]  190         jsr	L1D3F
   1D04 A9 00         [ 2]  191         lda	#0x00
   1D06 8D 80 02      [ 4]  192         sta	X0280
   1D09 A9 80         [ 2]  193         lda	#0x80
   1D0B 8D 02 02      [ 4]  194         sta	X0202
   1D0E A9 80         [ 2]  195         lda	#0x80
   1D10 20 72 1D      [ 6]  196         jsr	L1D72
   1D13 20 B0 1D      [ 6]  197         jsr	L1DB0
   1D16 C6 5A         [ 5]  198         dec	X005A
   1D18 20 D6 1D      [ 6]  199         jsr	L1DD6
   1D1B 20 3F 1D      [ 6]  200         jsr	L1D3F
   1D1E A9 1E         [ 2]  201         lda	#0x1E
   1D20 85 56         [ 3]  202         sta	X0056
   1D22 A9 64         [ 2]  203         lda	#0x64
   1D24 85 55         [ 3]  204         sta	X0055
   1D26 E6 59         [ 5]  205         inc	X0059
   1D28 A5 59         [ 3]  206         lda	X0059
   1D2A C9 1A         [ 2]  207         cmp	#0x1A
   1D2C 90 03         [ 4]  208         bcc	L1D31
   1D2E 4C 73 1C      [ 3]  209         jmp	L1C73
                            210 ;
   1D31                     211 L1D31:
   1D31 20 B0 1D      [ 6]  212         jsr	L1DB0
   1D34 A9 10         [ 2]  213         lda	#0x10
   1D36 20 72 1D      [ 6]  214         jsr	L1D72
   1D39 20 DB 1E      [ 6]  215         jsr	L1EDB
   1D3C 4C E7 1C      [ 3]  216         jmp	L1CE7
                            217 ;
   1D3F                     218 L1D3F:
   1D3F A9 3C         [ 2]  219         lda	#0x3C
   1D41 8D 83 03      [ 4]  220         sta	X0383
   1D44 A9 34         [ 2]  221         lda	#0x34
   1D46 8D 81 03      [ 4]  222         sta	X0381
   1D49 A2 00         [ 2]  223         ldx	#0x00
   1D4B                     224 L1D4B:
   1D4B A9 30         [ 2]  225         lda	#0x30
   1D4D 95 81         [ 4]  226         sta	X0081,x
   1D4F 95 83         [ 4]  227         sta	X0083,x
   1D51 A9 FF         [ 2]  228         lda	#0xFF
   1D53 95 80         [ 4]  229         sta	X0080,x
   1D55 95 82         [ 4]  230         sta	X0082,x
   1D57 A9 34         [ 2]  231         lda	#0x34
   1D59 95 81         [ 4]  232         sta	X0081,x
   1D5B 95 83         [ 4]  233         sta	X0083,x
   1D5D A9 00         [ 2]  234         lda	#0x00
   1D5F 95 80         [ 4]  235         sta	X0080,x
   1D61 95 82         [ 4]  236         sta	X0082,x
   1D63 E8            [ 2]  237         inx
   1D64 E8            [ 2]  238         inx
   1D65 E8            [ 2]  239         inx
   1D66 E8            [ 2]  240         inx
   1D67 E0 20         [ 2]  241         cpx	#0x20
   1D69 90 E0         [ 4]  242         bcc	L1D4B
   1D6B A9 00         [ 2]  243         lda	#0x00
   1D6D 85 5E         [ 3]  244         sta	X005E
   1D6F 85 64         [ 3]  245         sta	X0064
   1D71 60            [ 6]  246         rts
                            247 ;
   1D72                     248 L1D72:
   1D72 8D 02 03      [ 4]  249         sta	X0302
   1D75 A9 FA         [ 2]  250         lda	#0xFA
   1D77 85 50         [ 3]  251         sta	X0050
   1D79                     252 L1D79:
   1D79 20 83 1E      [ 6]  253         jsr	L1E83
   1D7C A5 50         [ 3]  254         lda	X0050
   1D7E D0 F9         [ 4]  255         bne	L1D79
   1D80 AD 02 03      [ 4]  256         lda	X0302
   1D83 29 60         [ 2]  257         and	#0x60
   1D85 D0 05         [ 4]  258         bne	L1D8C
   1D87 A9 00         [ 2]  259         lda	#0x00
   1D89 8D 02 03      [ 4]  260         sta	X0302
   1D8C                     261 L1D8C:
   1D8C 60            [ 6]  262         rts
                            263 ;
   1D8D                     264 L1D8D:
   1D8D A9 00         [ 2]  265         lda	#0x00
   1D8F 85 58         [ 3]  266         sta	X0058
   1D91                     267 L1D91:
   1D91 AD 02 03      [ 4]  268         lda	X0302
   1D94 A9 0A         [ 2]  269         lda	#0x0A
   1D96 85 50         [ 3]  270         sta	X0050
   1D98 E6 58         [ 5]  271         inc	X0058
   1D9A A5 58         [ 3]  272         lda	X0058
   1D9C C9 21         [ 2]  273         cmp	#0x21
   1D9E B0 0F         [ 4]  274         bcs	L1DAF
   1DA0                     275 L1DA0:
   1DA0 20 83 1E      [ 6]  276         jsr	L1E83
   1DA3 A5 50         [ 3]  277         lda	X0050
   1DA5 F0 E6         [ 4]  278         beq	L1D8D
   1DA7 AD 03 03      [ 4]  279         lda	X0303
   1DAA 10 F4         [ 4]  280         bpl	L1DA0
   1DAC 4C 91 1D      [ 3]  281         jmp	L1D91
   1DAF                     282 L1DAF:
   1DAF 60            [ 6]  283         rts
                            284 ;
   1DB0                     285 L1DB0:
   1DB0 A9 FA         [ 2]  286         lda	#0xFA
   1DB2 85 50         [ 3]  287         sta	X0050
   1DB4                     288 L1DB4:
   1DB4 20 83 1E      [ 6]  289         jsr	L1E83
   1DB7 A5 50         [ 3]  290         lda	X0050
   1DB9 D0 F9         [ 4]  291         bne	L1DB4
   1DBB                     292 L1DBB:
   1DBB 20 83 1E      [ 6]  293         jsr	L1E83
   1DBE AD 02 03      [ 4]  294         lda	X0302
   1DC1 6A            [ 2]  295         ror	a
   1DC2 90 F7         [ 4]  296         bcc	L1DBB
   1DC4 A9 A0         [ 2]  297         lda	#0xA0
   1DC6 85 50         [ 3]  298         sta	X0050
   1DC8                     299 L1DC8:
   1DC8 20 83 1E      [ 6]  300         jsr	L1E83
   1DCB AD 02 03      [ 4]  301         lda	X0302
   1DCE 6A            [ 2]  302         ror	a
   1DCF 90 EA         [ 4]  303         bcc	L1DBB
   1DD1 A5 50         [ 3]  304         lda	X0050
   1DD3 D0 F3         [ 4]  305         bne	L1DC8
   1DD5 60            [ 6]  306         rts
                            307 ;
   1DD6                     308 L1DD6:
   1DD6 AD 00 03      [ 4]  309         lda	X0300
   1DD9 A9 40         [ 2]  310         lda	#0x40
   1DDB 85 82         [ 3]  311         sta	X0082
   1DDD 85 86         [ 3]  312         sta	X0086
   1DDF 85 8A         [ 3]  313         sta	X008A
   1DE1 85 8E         [ 3]  314         sta	X008E
   1DE3 A9 3C         [ 2]  315         lda	#0x3C
   1DE5 8D 81 03      [ 4]  316         sta	X0381
   1DE8 A9 34         [ 2]  317         lda	#0x34
   1DEA 8D 83 03      [ 4]  318         sta	X0383
   1DED A9 60         [ 2]  319         lda	#0x60
   1DEF 85 82         [ 3]  320         sta	X0082
   1DF1                     321 L1DF1:
   1DF1 AD 02 03      [ 4]  322         lda	X0302
   1DF4 4A            [ 2]  323         lsr	a
   1DF5 90 11         [ 4]  324         bcc	L1E08
   1DF7 20 24 1F      [ 6]  325         jsr	L1F24
   1DFA 20 83 1E      [ 6]  326         jsr	L1E83
   1DFD AD 01 03      [ 4]  327         lda	X0301
   1E00 10 EF         [ 4]  328         bpl	L1DF1
   1E02 20 1A 1E      [ 6]  329         jsr	L1E1A
   1E05 4C F1 1D      [ 3]  330         jmp	L1DF1
                            331 ;
   1E08                     332 L1E08:
   1E08 A9 64         [ 2]  333         lda	#0x64
   1E0A 85 50         [ 3]  334         sta	X0050
   1E0C                     335 L1E0C:
   1E0C 20 83 1E      [ 6]  336         jsr	L1E83
   1E0F AD 02 03      [ 4]  337         lda	X0302
   1E12 4A            [ 2]  338         lsr	a
   1E13 B0 C1         [ 4]  339         bcs	L1DD6
   1E15 A5 50         [ 3]  340         lda	X0050
   1E17 D0 F3         [ 4]  341         bne	L1E0C
   1E19 60            [ 6]  342         rts
                            343 ;
   1E1A                     344 L1E1A:
   1E1A AD 00 03      [ 4]  345         lda	X0300
   1E1D 29 7F         [ 2]  346         and	#0x7F
   1E1F 85 5C         [ 3]  347         sta	X005C
   1E21 29 7E         [ 2]  348         and	#0x7E
   1E23 C9 22         [ 2]  349         cmp	#0x22
   1E25 F0 3A         [ 4]  350         beq	L1E61
   1E27 C9 32         [ 2]  351         cmp	#0x32
   1E29 90 4F         [ 4]  352         bcc	L1E7A
   1E2B C9 3A         [ 2]  353         cmp	#0x3A
   1E2D 90 32         [ 4]  354         bcc	L1E61
   1E2F A5 5C         [ 3]  355         lda	X005C
   1E31 C9 41         [ 2]  356         cmp	#0x41
   1E33 90 45         [ 4]  357         bcc	L1E7A
   1E35 C9 4F         [ 2]  358         cmp	#0x4F
   1E37 B0 41         [ 4]  359         bcs	L1E7A
   1E39 A6 64         [ 3]  360         ldx	X0064
   1E3B 38            [ 2]  361         sec
   1E3C E9 41         [ 2]  362         sbc	#0x41
   1E3E C9 08         [ 2]  363         cmp	#0x08
   1E40 90 02         [ 4]  364         bcc	L1E44
   1E42 E8            [ 2]  365         inx
   1E43 E8            [ 2]  366         inx
   1E44                     367 L1E44:
   1E44 29 07         [ 2]  368         and	#0x07
   1E46 A8            [ 2]  369         tay
   1E47 B9 7B 1E      [ 5]  370         lda	X1E7B,y
   1E4A 85 5D         [ 3]  371         sta	X005D
   1E4C A5 5E         [ 3]  372         lda	X005E
   1E4E 4A            [ 2]  373         lsr	a
   1E4F B0 09         [ 4]  374         bcs	L1E5A
   1E51 A5 5D         [ 3]  375         lda	X005D
   1E53 49 FF         [ 2]  376         eor	#0xFF
   1E55 35 00         [ 4]  377         and	X0000,x
   1E57 95 00         [ 4]  378         sta	X0000,x
   1E59 60            [ 6]  379         rts
                            380 ;
   1E5A                     381 L1E5A:
   1E5A A5 5D         [ 3]  382         lda	X005D
   1E5C 15 00         [ 4]  383         ora	X0000,x
   1E5E 95 00         [ 4]  384         sta	X0000,x
   1E60 60            [ 6]  385         rts
                            386 ;
   1E61                     387 L1E61:
   1E61 A5 5C         [ 3]  388         lda	X005C
   1E63 85 5E         [ 3]  389         sta	X005E
   1E65 29 7E         [ 2]  390         and	#0x7E
   1E67 C9 22         [ 2]  391         cmp	#0x22
   1E69 D0 05         [ 4]  392         bne	L1E70
   1E6B A9 98         [ 2]  393         lda	#0x98
   1E6D 85 64         [ 3]  394         sta	X0064
   1E6F 60            [ 6]  395         rts
                            396 ;
   1E70                     397 L1E70:
   1E70 38            [ 2]  398         sec
   1E71 E9 32         [ 2]  399         sbc	#0x32
   1E73 0A            [ 2]  400         asl	a
   1E74 18            [ 2]  401         clc
   1E75 69 80         [ 2]  402         adc	#0x80
   1E77 85 64         [ 3]  403         sta	X0064
   1E79 60            [ 6]  404         rts
   1E7A                     405 L1E7A:
   1E7A 60            [ 6]  406         rts
                            407 ;
   1E7B                     408 X1E7B:
   1E7B 01 02 04 08         409         .db     0x01,0x02,0x04,0x08
   1E7F 10 20 40 80         410         .db     0x10,0x20,0x40,0x80
                            411 ;
   1E83                     412 L1E83:
   1E83 AD 05 02      [ 4]  413         lda	X0205
   1E86 85 5F         [ 3]  414         sta	X005F
   1E88 F0 50         [ 4]  415         beq	L1EDA
   1E8A A5 5B         [ 3]  416         lda	X005B
   1E8C 30 0E         [ 4]  417         bmi	L1E9C
   1E8E A5 5F         [ 3]  418         lda	X005F
   1E90 29 40         [ 2]  419         and	#0x40
   1E92 F0 16         [ 4]  420         beq	L1EAA
   1E94 A9 80         [ 2]  421         lda	#0x80
   1E96 85 5B         [ 3]  422         sta	X005B
   1E98 A9 FA         [ 2]  423         lda	#0xFA
   1E9A 85 51         [ 3]  424         sta	X0051
   1E9C                     425 L1E9C:
   1E9C A5 51         [ 3]  426         lda	X0051
   1E9E D0 06         [ 4]  427         bne	L1EA6
   1EA0 A9 00         [ 2]  428         lda	#0x00
   1EA2 85 5B         [ 3]  429         sta	X005B
   1EA4 E6 5A         [ 5]  430         inc	X005A
   1EA6                     431 L1EA6:
   1EA6 A5 5F         [ 3]  432         lda	X005F
   1EA8 10 30         [ 4]  433         bpl	L1EDA
   1EAA                     434 L1EAA:
   1EAA AD 04 02      [ 4]  435         lda	X0204
   1EAD 49 FF         [ 2]  436         eor	#0xFF
   1EAF 4A            [ 2]  437         lsr	a
   1EB0 4A            [ 2]  438         lsr	a
   1EB1 4A            [ 2]  439         lsr	a
   1EB2 85 57         [ 3]  440         sta	X0057
   1EB4 90 02         [ 4]  441         bcc	L1EB8
   1EB6 E6 57         [ 5]  442         inc	X0057
   1EB8                     443 L1EB8:
   1EB8 A9 7A         [ 2]  444         lda	#0x7A
   1EBA 38            [ 2]  445         sec
   1EBB E5 57         [ 3]  446         sbc	X0057
   1EBD 8D 15 02      [ 4]  447         sta	X0215
   1EC0 C6 50         [ 5]  448         dec	X0050
   1EC2 C6 51         [ 5]  449         dec	X0051
   1EC4 C6 52         [ 5]  450         dec	X0052
   1EC6 C6 53         [ 5]  451         dec	X0053
   1EC8 D0 10         [ 4]  452         bne	L1EDA
   1ECA A9 64         [ 2]  453         lda	#0x64
   1ECC 85 53         [ 3]  454         sta	X0053
   1ECE C6 54         [ 5]  455         dec	X0054
   1ED0 C6 55         [ 5]  456         dec	X0055
   1ED2 D0 06         [ 4]  457         bne	L1EDA
   1ED4 A9 64         [ 2]  458         lda	#0x64
   1ED6 85 55         [ 3]  459         sta	X0055
   1ED8 C6 56         [ 5]  460         dec	X0056
   1EDA                     461 L1EDA:
   1EDA 60            [ 6]  462         rts
                            463 ;
   1EDB                     464 L1EDB:
   1EDB A9 00         [ 2]  465         lda	#0x00
   1EDD 85 61         [ 3]  466         sta	X0061
   1EDF 85 62         [ 3]  467         sta	X0062
   1EE1 A9 0A         [ 2]  468         lda	#0x0A
   1EE3 85 54         [ 3]  469         sta	X0054
   1EE5 A9 64         [ 2]  470         lda	#0x64
   1EE7 85 53         [ 3]  471         sta	X0053
   1EE9                     472 L1EE9:
   1EE9 20 83 1E      [ 6]  473         jsr	L1E83
   1EEC A5 54         [ 3]  474         lda	X0054
   1EEE D0 F9         [ 4]  475         bne	L1EE9
   1EF0 A9 0A         [ 2]  476         lda	#0x0A
   1EF2 85 54         [ 3]  477         sta	X0054
   1EF4 A9 64         [ 2]  478         lda	#0x64
   1EF6 85 53         [ 3]  479         sta	X0053
   1EF8 A5 62         [ 3]  480         lda	X0062
   1EFA C9 08         [ 2]  481         cmp	#0x08
   1EFC F0 15         [ 4]  482         beq	L1F13
   1EFE E6 62         [ 5]  483         inc	X0062
   1F00 A2 09         [ 2]  484         ldx	#0x09
   1F02 38            [ 2]  485         sec
   1F03 AD 80 03      [ 4]  486         lda	X0380
   1F06                     487 L1F06:
   1F06 2A            [ 2]  488         rol	a
   1F07 CA            [ 2]  489         dex
   1F08 90 FC         [ 4]  490         bcc	L1F06
   1F0A 18            [ 2]  491         clc
   1F0B 8A            [ 2]  492         txa
   1F0C 65 61         [ 3]  493         adc	X0061
   1F0E 85 61         [ 3]  494         sta	X0061
   1F10 4C E9 1E      [ 3]  495         jmp	L1EE9
                            496 ;
   1F13                     497 L1F13:
   1F13 46 61         [ 5]  498         lsr	X0061
   1F15 46 61         [ 5]  499         lsr	X0061
   1F17 46 61         [ 5]  500         lsr	X0061
   1F19 A5 61         [ 3]  501         lda	X0061
   1F1B 85 60         [ 3]  502         sta	X0060
   1F1D A9 00         [ 2]  503         lda	#0x00
   1F1F 85 61         [ 3]  504         sta	X0061
   1F21 85 62         [ 3]  505         sta	X0062
   1F23 60            [ 6]  506         rts
                            507 ;
   1F24                     508 L1F24:
   1F24 AD 80 02      [ 4]  509         lda	X0280
   1F27 49 FF         [ 2]  510         eor	#0xFF
   1F29 4A            [ 2]  511         lsr	a
   1F2A 4A            [ 2]  512         lsr	a
   1F2B 4A            [ 2]  513         lsr	a
   1F2C 4A            [ 2]  514         lsr	a
   1F2D 18            [ 2]  515         clc
   1F2E 65 60         [ 3]  516         adc	X0060
   1F30 AA            [ 2]  517         tax
   1F31 BD 57 1F      [ 5]  518         lda	X1F57,x
   1F34 85 63         [ 3]  519         sta	X0063
   1F36 A5 52         [ 3]  520         lda	X0052
   1F38 D0 16         [ 4]  521         bne	L1F50
   1F3A A9 0A         [ 2]  522         lda	#0x0A
   1F3C 85 52         [ 3]  523         sta	X0052
   1F3E A5 63         [ 3]  524         lda	X0063
   1F40 CD 82 03      [ 4]  525         cmp	X0382
   1F43 90 08         [ 4]  526         bcc	L1F4D
   1F45 F0 09         [ 4]  527         beq	L1F50
   1F47 EE 82 03      [ 6]  528         inc	X0382
   1F4A 4C 50 1F      [ 3]  529         jmp	L1F50
                            530 ;
   1F4D                     531 L1F4D:
   1F4D CE 82 03      [ 6]  532         dec	X0382
   1F50                     533 L1F50:
   1F50 AD 82 03      [ 4]  534         lda	X0382
   1F53 8D 82 02      [ 4]  535         sta	X0282
   1F56 60            [ 6]  536         rts
                            537 ;
   1F57                     538 X1F57:
   1F57 03 04 06 08         539         .db     0x03, 0x04, 0x06, 0x08
   1F5B 10 16 20 2D         540         .db     0x10, 0x16, 0x20, 0x2D
   1F5F 40 5A 80 BF         541         .db     0x40, 0x5A, 0x80, 0xBF
   1F63 FF FF FF FF         542         .db	0xFF, 0xFF, 0xFF, 0xFF 
   1F67 FF                  543         .db	0xFF
                            544 ;
   1F68                     545 L1F68:
   1F68 A9 00         [ 2]  546         lda	#0x00
   1F6A 85 5A         [ 3]  547         sta	X005A
   1F6C 20 83 1E      [ 6]  548         jsr	L1E83
   1F6F 4C EA 1C      [ 3]  549         jmp	L1CEA
                            550 ;
                            551 ; all zeros in this gap
                            552 ;
   1FFC                     553         .org    0x1FFC
                            554 ;
                            555 ; vectors
                            556 ;
   1FFC                     557 RESETVEC:
   1FFC 00 1C               558         .dw     RESET
   1FFE                     559 IRQVEC:
u  1FFE 00 00               560         .dw     RAM_start
                            561 
