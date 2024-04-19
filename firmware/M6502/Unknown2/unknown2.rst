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
                     0000    11 RAM_start = 0x0000
                     0002    12 X0002 = 0x0002
                     0008    13 X0008 = 0x0008
                     0050    14 X0050 = 0x0050
                     0051    15 X0051 = 0x0051
                     0052    16 X0052 = 0x0052
                     0053    17 X0053 = 0x0053
                     0054    18 X0054 = 0x0054
                     0055    19 X0055 = 0x0055
                     0056    20 X0056 = 0x0056
                     0057    21 X0057 = 0x0057
                     0058    22 X0058 = 0x0058
                     0059    23 X0059 = 0x0059
                     005A    24 X005A = 0x005A
                     005C    25 X005C = 0x005C
                     005D    26 X005D = 0x005D
                     005E    27 X005E = 0x005E
                     005F    28 X005F = 0x005F
                     0060    29 X0060 = 0x0060
                     0061    30 X0061 = 0x0061
                     0062    31 X0062 = 0x0062
                     0063    32 X0063 = 0x0063
                     0064    33 X0064 = 0x0064
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
                             59 ;
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
   1C61 20 7C 1D      [ 6]  106         jsr     L1D7C
   1C64 A9 28         [ 2]  107         lda     #0x28
   1C66 85 54         [ 3]  108         sta     X0054
   1C68 A9 64         [ 2]  109         lda     #0x64
   1C6A 85 53         [ 3]  110         sta     X0053
   1C6C                     111 L1C6C:
   1C6C 20 8D 1E      [ 6]  112         jsr     L1E8D
   1C6F A5 54         [ 3]  113         lda     X0054
   1C71 D0 F9         [ 4]  114         bne     L1C6C
   1C73                     115 L1C73:
   1C73 A9 40         [ 2]  116         lda     #0x40
   1C75 20 7C 1D      [ 6]  117         jsr     L1D7C
   1C78                     118 L1C78:
   1C78 A9 00         [ 2]  119         lda     #0x00
   1C7A 85 58         [ 3]  120         sta     X0058
   1C7C                     121 L1C7C:
   1C7C 20 8D 1E      [ 6]  122         jsr     L1E8D
   1C7F AD 03 03      [ 4]  123         lda     X0303
   1C82 10 F8         [ 4]  124         bpl     L1C7C
   1C84 A9 06         [ 2]  125         lda     #0x06
   1C86 85 54         [ 3]  126         sta     X0054
   1C88 A9 64         [ 2]  127         lda     #0x64
   1C8A 85 53         [ 3]  128         sta     X0053
   1C8C                     129 L1C8C:
   1C8C 20 8D 1E      [ 6]  130         jsr     L1E8D
   1C8F AD 03 03      [ 4]  131         lda     X0303
   1C92 10 0B         [ 4]  132         bpl     L1C9F
   1C94 E6 58         [ 5]  133         inc     X0058
   1C96 AD 02 03      [ 4]  134         lda     X0302
   1C99 A5 58         [ 3]  135         lda     X0058
   1C9B C9 64         [ 2]  136         cmp     #0x64
   1C9D B0 0B         [ 4]  137         bcs     L1CAA
   1C9F                     138 L1C9F:
   1C9F A5 54         [ 3]  139         lda     X0054
   1CA1 D0 E9         [ 4]  140         bne     L1C8C
   1CA3 4C 78 1C      [ 3]  141         jmp     L1C78
                            142 ;
   1CA6 C9 60         [ 2]  143         cmp     #0x60
   1CA8 90 00         [ 4]  144         bcc     L1CAA
   1CAA                     145 L1CAA:
   1CAA A9 20         [ 2]  146         lda     #0x20
   1CAC 20 7C 1D      [ 6]  147         jsr     L1D7C
   1CAF A9 19         [ 2]  148         lda     #0x19
   1CB1 85 54         [ 3]  149         sta     X0054
   1CB3 A9 64         [ 2]  150         lda     #0x64
   1CB5 85 53         [ 3]  151         sta     X0053
   1CB7                     152 L1CB7:
   1CB7 20 8D 1E      [ 6]  153         jsr     L1E8D
   1CBA A5 54         [ 3]  154         lda     X0054
   1CBC D0 F9         [ 4]  155         bne     L1CB7
   1CBE A9 00         [ 2]  156         lda     #0x00
   1CC0 85 59         [ 3]  157         sta     X0059
   1CC2 20 97 1D      [ 6]  158         jsr     L1D97
   1CC5 A9 40         [ 2]  159         lda     #0x40
   1CC7 20 7C 1D      [ 6]  160         jsr     L1D7C
   1CCA 20 97 1D      [ 6]  161         jsr     L1D97
   1CCD A9 FA         [ 2]  162         lda     #0xFA
   1CCF 85 50         [ 3]  163         sta     X0050
   1CD1                     164 L1CD1:
   1CD1 20 8D 1E      [ 6]  165         jsr     L1E8D
   1CD4 A5 50         [ 3]  166         lda     X0050
   1CD6 D0 F9         [ 4]  167         bne     L1CD1
   1CD8 A9 20         [ 2]  168         lda     #0x20
   1CDA 20 7C 1D      [ 6]  169         jsr     L1D7C
   1CDD 20 97 1D      [ 6]  170         jsr     L1D97
   1CE0 E6 59         [ 5]  171         inc     X0059
   1CE2 A9 10         [ 2]  172         lda     #0x10
   1CE4 20 7C 1D      [ 6]  173         jsr     L1D7C
   1CE7 A9 80         [ 2]  174         lda     #0x80
   1CE9 20 7C 1D      [ 6]  175         jsr     L1D7C
   1CEC 20 BA 1D      [ 6]  176         jsr     L1DBA
   1CEF A9 10         [ 2]  177         lda     #0x10
   1CF1 20 7C 1D      [ 6]  178         jsr     L1D7C
   1CF4 20 4F 1D      [ 6]  179         jsr     L1D4F
   1CF7                     180 L1CF7:
   1CF7 20 8D 1E      [ 6]  181         jsr     L1E8D
   1CFA 20 1A 1F      [ 6]  182         jsr     L1F1A
   1CFD A5 5A         [ 3]  183         lda     X005A
   1CFF D0 10         [ 4]  184         bne     L1D11
   1D01 A9 02         [ 2]  185         lda     #0x02
   1D03 8D 80 02      [ 4]  186         sta     X0280
   1D06 A9 00         [ 2]  187         lda     #0x00
   1D08 8D 02 02      [ 4]  188         sta     X0202
   1D0B A5 56         [ 3]  189         lda     X0056
   1D0D D0 E8         [ 4]  190         bne     L1CF7
   1D0F E6 5A         [ 5]  191         inc     X005A
   1D11                     192 L1D11:
   1D11 20 4F 1D      [ 6]  193         jsr     L1D4F
   1D14 A9 00         [ 2]  194         lda     #0x00
   1D16 8D 80 02      [ 4]  195         sta     X0280
   1D19 A9 80         [ 2]  196         lda     #0x80
   1D1B 8D 02 02      [ 4]  197         sta     X0202
   1D1E A9 80         [ 2]  198         lda     #0x80
   1D20 20 7C 1D      [ 6]  199         jsr     L1D7C
   1D23 20 BA 1D      [ 6]  200         jsr     L1DBA
   1D26 C6 5A         [ 5]  201         dec     X005A
   1D28 20 E0 1D      [ 6]  202         jsr     L1DE0
   1D2B 20 4F 1D      [ 6]  203         jsr     L1D4F
   1D2E A9 1E         [ 2]  204         lda     #0x1E
   1D30 85 56         [ 3]  205         sta     X0056
   1D32 A9 64         [ 2]  206         lda     #0x64
   1D34 85 55         [ 3]  207         sta     X0055
   1D36 E6 59         [ 5]  208         inc     X0059
   1D38 A5 59         [ 3]  209         lda     X0059
   1D3A C9 1A         [ 2]  210         cmp     #0x1A
   1D3C 90 03         [ 4]  211         bcc     L1D41
   1D3E 4C 73 1C      [ 3]  212         jmp     L1C73
                            213 ;
   1D41                     214 L1D41:
   1D41 20 BA 1D      [ 6]  215         jsr     L1DBA
   1D44 A9 10         [ 2]  216         lda     #0x10
   1D46 20 7C 1D      [ 6]  217         jsr     L1D7C
   1D49 20 D1 1E      [ 6]  218         jsr     L1ED1
   1D4C 4C F7 1C      [ 3]  219         jmp     L1CF7
                            220 ;
   1D4F                     221 L1D4F:
   1D4F A9 3C         [ 2]  222         lda     #0x3C
   1D51 8D 83 03      [ 4]  223         sta     X0383
   1D54 A9 34         [ 2]  224         lda     #0x34
   1D56 8D 81 03      [ 4]  225         sta     X0381
   1D59 A2 00         [ 2]  226         ldx     #0x00
   1D5B                     227 L1D5B:
   1D5B A9 30         [ 2]  228         lda     #0x30
   1D5D 95 81         [ 4]  229         sta     X0081,x
   1D5F 95 83         [ 4]  230         sta     X0083,x
   1D61 A9 FF         [ 2]  231         lda     #0xFF
   1D63 95 80         [ 4]  232         sta     X0080,x
   1D65 95 82         [ 4]  233         sta     X0082,x
   1D67 A9 34         [ 2]  234         lda     #0x34
   1D69 95 81         [ 4]  235         sta     X0081,x
   1D6B 95 83         [ 4]  236         sta     X0083,x
   1D6D A9 00         [ 2]  237         lda     #0x00
   1D6F 95 80         [ 4]  238         sta     X0080,x
   1D71 95 82         [ 4]  239         sta     X0082,x
   1D73 E8            [ 2]  240         inx
   1D74 E8            [ 2]  241         inx
   1D75 E8            [ 2]  242         inx
   1D76 E8            [ 2]  243         inx
   1D77 E0 20         [ 2]  244         cpx     #0x20
   1D79 90 E0         [ 4]  245         bcc     L1D5B
   1D7B 60            [ 6]  246         rts
                            247 ;
   1D7C                     248 L1D7C:
   1D7C 8D 02 03      [ 4]  249         sta     X0302
   1D7F A9 FA         [ 2]  250         lda     #0xFA
   1D81 85 50         [ 3]  251         sta     X0050
   1D83                     252 L1D83:
   1D83 20 8D 1E      [ 6]  253         jsr     L1E8D
   1D86 A5 50         [ 3]  254         lda     X0050
   1D88 D0 F9         [ 4]  255         bne     L1D83
   1D8A AD 02 03      [ 4]  256         lda     X0302
   1D8D 29 60         [ 2]  257         and     #0x60
   1D8F D0 05         [ 4]  258         bne     L1D96
   1D91 A9 00         [ 2]  259         lda     #0x00
   1D93 8D 02 03      [ 4]  260         sta     X0302
   1D96                     261 L1D96:
   1D96 60            [ 6]  262         rts
                            263 ;
   1D97                     264 L1D97:
   1D97 A9 00         [ 2]  265         lda     #0x00
   1D99 85 58         [ 3]  266         sta     X0058
   1D9B                     267 L1D9B:
   1D9B AD 02 03      [ 4]  268         lda     X0302
   1D9E A9 0A         [ 2]  269         lda     #0x0A
   1DA0 85 50         [ 3]  270         sta     X0050
   1DA2 E6 58         [ 5]  271         inc     X0058
   1DA4 A5 58         [ 3]  272         lda     X0058
   1DA6 C9 21         [ 2]  273         cmp     #0x21
   1DA8 B0 0F         [ 4]  274         bcs     L1DB9
   1DAA                     275 L1DAA:
   1DAA 20 8D 1E      [ 6]  276         jsr     L1E8D
   1DAD A5 50         [ 3]  277         lda     X0050
   1DAF F0 E6         [ 4]  278         beq     L1D97
   1DB1 AD 03 03      [ 4]  279         lda     X0303
   1DB4 10 F4         [ 4]  280         bpl     L1DAA
   1DB6 4C 9B 1D      [ 3]  281         jmp     L1D9B
   1DB9                     282 L1DB9:
   1DB9 60            [ 6]  283         rts
                            284 ;
   1DBA                     285 L1DBA:
   1DBA A9 FA         [ 2]  286         lda     #0xFA
   1DBC 85 50         [ 3]  287         sta     X0050
   1DBE                     288 L1DBE:
   1DBE 20 8D 1E      [ 6]  289         jsr     L1E8D
   1DC1 A5 50         [ 3]  290         lda     X0050
   1DC3 D0 F9         [ 4]  291         bne     L1DBE
   1DC5                     292 L1DC5:
   1DC5 20 8D 1E      [ 6]  293         jsr     L1E8D
   1DC8 AD 02 03      [ 4]  294         lda     X0302
   1DCB 6A            [ 2]  295         ror     a
   1DCC 90 F7         [ 4]  296         bcc     L1DC5
   1DCE A9 A0         [ 2]  297         lda     #0xA0
   1DD0 85 50         [ 3]  298         sta     X0050
   1DD2                     299 L1DD2:
   1DD2 20 8D 1E      [ 6]  300         jsr     L1E8D
   1DD5 AD 02 03      [ 4]  301         lda     X0302
   1DD8 6A            [ 2]  302         ror     a
   1DD9 90 EA         [ 4]  303         bcc     L1DC5
   1DDB A5 50         [ 3]  304         lda     X0050
   1DDD D0 F3         [ 4]  305         bne     L1DD2
   1DDF 60            [ 6]  306         rts
                            307 ;
   1DE0                     308 L1DE0:
   1DE0 AD 00 03      [ 4]  309         lda     X0300
   1DE3 A9 40         [ 2]  310         lda     #0x40
   1DE5 85 82         [ 3]  311         sta     X0082
   1DE7 85 86         [ 3]  312         sta     X0086
   1DE9 85 8A         [ 3]  313         sta     X008A
   1DEB 85 8E         [ 3]  314         sta     X008E
   1DED A9 3C         [ 2]  315         lda     #0x3C
   1DEF 8D 81 03      [ 4]  316         sta     X0381
   1DF2 A9 34         [ 2]  317         lda     #0x34
   1DF4 8D 83 03      [ 4]  318         sta     X0383
   1DF7 A9 60         [ 2]  319         lda     #0x60
   1DF9 85 82         [ 3]  320         sta     X0082
   1DFB                     321 L1DFB:
   1DFB AD 02 03      [ 4]  322         lda     X0302
   1DFE 4A            [ 2]  323         lsr     a
   1DFF 90 11         [ 4]  324         bcc     L1E12
   1E01 20 1A 1F      [ 6]  325         jsr     L1F1A
   1E04 20 8D 1E      [ 6]  326         jsr     L1E8D
   1E07 AD 01 03      [ 4]  327         lda     X0301
   1E0A 10 EF         [ 4]  328         bpl     L1DFB
   1E0C 20 24 1E      [ 6]  329         jsr     L1E24
   1E0F 4C FB 1D      [ 3]  330         jmp     L1DFB
                            331 ;
   1E12                     332 L1E12:
   1E12 A9 64         [ 2]  333         lda     #0x64
   1E14 85 50         [ 3]  334         sta     X0050
   1E16                     335 L1E16:
   1E16 20 8D 1E      [ 6]  336         jsr     L1E8D
   1E19 AD 02 03      [ 4]  337         lda     X0302
   1E1C 4A            [ 2]  338         lsr     a
   1E1D B0 C1         [ 4]  339         bcs     L1DE0
   1E1F A5 50         [ 3]  340         lda     X0050
   1E21 D0 F3         [ 4]  341         bne     L1E16
   1E23 60            [ 6]  342         rts
                            343 ;
   1E24                     344 L1E24:
   1E24 AD 00 03      [ 4]  345         lda     X0300
   1E27 29 7F         [ 2]  346         and     #0x7F
   1E29 85 5C         [ 3]  347         sta     X005C
   1E2B 29 7E         [ 2]  348         and     #0x7E
   1E2D C9 22         [ 2]  349         cmp     #0x22
   1E2F F0 3A         [ 4]  350         beq     L1E6B
   1E31 C9 32         [ 2]  351         cmp     #0x32
   1E33 90 4F         [ 4]  352         bcc     L1E84
   1E35 C9 3A         [ 2]  353         cmp     #0x3A
   1E37 90 32         [ 4]  354         bcc     L1E6B
   1E39 A5 5C         [ 3]  355         lda     X005C
   1E3B C9 41         [ 2]  356         cmp     #0x41
   1E3D 90 45         [ 4]  357         bcc     L1E84
   1E3F C9 51         [ 2]  358         cmp     #0x51
   1E41 B0 41         [ 4]  359         bcs     L1E84
   1E43 A6 64         [ 3]  360         ldx     X0064
   1E45 38            [ 2]  361         sec
   1E46 E9 41         [ 2]  362         sbc     #0x41
   1E48 C9 08         [ 2]  363         cmp     #0x08
   1E4A 90 02         [ 4]  364         bcc     L1E4E
   1E4C E8            [ 2]  365         inx
   1E4D E8            [ 2]  366         inx
   1E4E                     367 L1E4E:
   1E4E 29 07         [ 2]  368         and     #0x07
   1E50 A8            [ 2]  369         tay
   1E51 B9 85 1E      [ 5]  370         lda     X1E85,y
   1E54 85 5D         [ 3]  371         sta     X005D
   1E56 A5 5E         [ 3]  372         lda     X005E
   1E58 4A            [ 2]  373         lsr     a
   1E59 B0 09         [ 4]  374         bcs     L1E64
   1E5B A5 5D         [ 3]  375         lda     X005D
   1E5D 49 FF         [ 2]  376         eor     #0xFF
   1E5F 35 00         [ 4]  377         and     RAM_start,x
   1E61 95 00         [ 4]  378         sta     RAM_start,x
   1E63 60            [ 6]  379         rts
                            380 ;
   1E64                     381 L1E64:
   1E64 A5 5D         [ 3]  382         lda     X005D
   1E66 15 00         [ 4]  383         ora     RAM_start,x
   1E68 95 00         [ 4]  384         sta     RAM_start,x
   1E6A 60            [ 6]  385         rts
                            386 ;
   1E6B                     387 L1E6B:
   1E6B A5 5C         [ 3]  388         lda     X005C
   1E6D 85 5E         [ 3]  389         sta     X005E
   1E6F 29 7E         [ 2]  390         and     #0x7E
   1E71 C9 22         [ 2]  391         cmp     #0x22
   1E73 D0 05         [ 4]  392         bne     L1E7A
   1E75 A9 98         [ 2]  393         lda     #0x98
   1E77 85 64         [ 3]  394         sta     X0064
   1E79 60            [ 6]  395         rts
                            396 ;
   1E7A                     397 L1E7A:
   1E7A 38            [ 2]  398         sec
   1E7B E9 32         [ 2]  399         sbc     #0x32
   1E7D 0A            [ 2]  400         asl     a
   1E7E 18            [ 2]  401         clc
   1E7F 69 80         [ 2]  402         adc     #0x80
   1E81 85 64         [ 3]  403         sta     X0064
   1E83 60            [ 6]  404         rts
   1E84                     405 L1E84:
   1E84 60            [ 6]  406         rts
                            407 ;
   1E85                     408 X1E85:
   1E85 01 02 04 08         409         .db     0x01,0x02,0x04,0x08
   1E89 10 20 40 80         410         .db     0x10,0x20,0x40,0x80
                            411 ;
   1E8D                     412 L1E8D:
   1E8D AD 05 02      [ 4]  413         lda     X0205
   1E90 85 5F         [ 3]  414         sta     X005F
   1E92 F0 3C         [ 4]  415         beq     L1ED0
   1E94 29 40         [ 2]  416         and     #0x40
   1E96 F0 04         [ 4]  417         beq     L1E9C
   1E98 A9 01         [ 2]  418         lda     #0x01
   1E9A 85 5A         [ 3]  419         sta     X005A
   1E9C                     420 L1E9C:
   1E9C A5 5F         [ 3]  421         lda     X005F
   1E9E 10 30         [ 4]  422         bpl     L1ED0
   1EA0 AD 04 02      [ 4]  423         lda     X0204
   1EA3 49 FF         [ 2]  424         eor     #0xFF
   1EA5 4A            [ 2]  425         lsr     a
   1EA6 4A            [ 2]  426         lsr     a
   1EA7 4A            [ 2]  427         lsr     a
   1EA8 85 57         [ 3]  428         sta     X0057
   1EAA 90 02         [ 4]  429         bcc     L1EAE
   1EAC E6 57         [ 5]  430         inc     X0057
   1EAE                     431 L1EAE:
   1EAE A9 7A         [ 2]  432         lda     #0x7A
   1EB0 38            [ 2]  433         sec
   1EB1 E5 57         [ 3]  434         sbc     X0057
   1EB3 8D 15 02      [ 4]  435         sta     X0215
   1EB6 C6 50         [ 5]  436         dec     X0050
   1EB8 C6 51         [ 5]  437         dec     X0051
   1EBA C6 52         [ 5]  438         dec     X0052
   1EBC C6 53         [ 5]  439         dec     X0053
   1EBE D0 10         [ 4]  440         bne     L1ED0
   1EC0 A9 64         [ 2]  441         lda     #0x64
   1EC2 85 53         [ 3]  442         sta     X0053
   1EC4 C6 54         [ 5]  443         dec     X0054
   1EC6 C6 55         [ 5]  444         dec     X0055
   1EC8 D0 06         [ 4]  445         bne     L1ED0
   1ECA A9 64         [ 2]  446         lda     #0x64
   1ECC 85 55         [ 3]  447         sta     X0055
   1ECE C6 56         [ 5]  448         dec     X0056
   1ED0                     449 L1ED0:
   1ED0 60            [ 6]  450         rts
                            451 ;
   1ED1                     452 L1ED1:
   1ED1 A9 00         [ 2]  453         lda     #0x00
   1ED3 85 61         [ 3]  454         sta     X0061
   1ED5 85 62         [ 3]  455         sta     X0062
   1ED7 A9 0A         [ 2]  456         lda     #0x0A
   1ED9 85 54         [ 3]  457         sta     X0054
   1EDB A9 64         [ 2]  458         lda     #0x64
   1EDD 85 53         [ 3]  459         sta     X0053
   1EDF                     460 L1EDF:
   1EDF 20 8D 1E      [ 6]  461         jsr     L1E8D
   1EE2 A5 54         [ 3]  462         lda     X0054
   1EE4 D0 F9         [ 4]  463         bne     L1EDF
   1EE6 A9 0A         [ 2]  464         lda     #0x0A
   1EE8 85 54         [ 3]  465         sta     X0054
   1EEA A9 64         [ 2]  466         lda     #0x64
   1EEC 85 53         [ 3]  467         sta     X0053
   1EEE A5 62         [ 3]  468         lda     X0062
   1EF0 C9 08         [ 2]  469         cmp     #0x08
   1EF2 F0 15         [ 4]  470         beq     L1F09
   1EF4 E6 62         [ 5]  471         inc     X0062
   1EF6 A2 09         [ 2]  472         ldx     #0x09
   1EF8 38            [ 2]  473         sec
   1EF9 AD 80 03      [ 4]  474         lda     X0380
   1EFC                     475 L1EFC:
   1EFC 2A            [ 2]  476         rol     a
   1EFD CA            [ 2]  477         dex
   1EFE 90 FC         [ 4]  478         bcc     L1EFC
   1F00 18            [ 2]  479         clc
   1F01 8A            [ 2]  480         txa
   1F02 65 61         [ 3]  481         adc     X0061
   1F04 85 61         [ 3]  482         sta     X0061
   1F06 4C DF 1E      [ 3]  483         jmp     L1EDF
                            484 ;
   1F09                     485 L1F09:
   1F09 46 61         [ 5]  486         lsr     X0061
   1F0B 46 61         [ 5]  487         lsr     X0061
   1F0D 46 61         [ 5]  488         lsr     X0061
   1F0F A5 61         [ 3]  489         lda     X0061
   1F11 85 60         [ 3]  490         sta     X0060
   1F13 A9 00         [ 2]  491         lda     #0x00
   1F15 85 61         [ 3]  492         sta     X0061
   1F17 85 62         [ 3]  493         sta     X0062
   1F19 60            [ 6]  494         rts
                            495 ;
   1F1A                     496 L1F1A:
   1F1A AD 80 02      [ 4]  497         lda     X0280
   1F1D 49 FF         [ 2]  498         eor     #0xFF
   1F1F 4A            [ 2]  499         lsr     a
   1F20 4A            [ 2]  500         lsr     a
   1F21 4A            [ 2]  501         lsr     a
   1F22 4A            [ 2]  502         lsr     a
   1F23 18            [ 2]  503         clc
   1F24 65 60         [ 3]  504         adc     X0060
   1F26 AA            [ 2]  505         tax
   1F27 BD 4D 1F      [ 5]  506         lda     X1F4D,x
   1F2A 85 63         [ 3]  507         sta     X0063
   1F2C A5 52         [ 3]  508         lda     X0052
   1F2E D0 16         [ 4]  509         bne     L1F46
   1F30 A9 0A         [ 2]  510         lda     #0x0A
   1F32 85 52         [ 3]  511         sta     X0052
   1F34 A5 63         [ 3]  512         lda     X0063
   1F36 CD 82 03      [ 4]  513         cmp     X0382
   1F39 90 08         [ 4]  514         bcc     L1F43
   1F3B F0 09         [ 4]  515         beq     L1F46
   1F3D EE 82 03      [ 6]  516         inc     X0382
   1F40 4C 46 1F      [ 3]  517         jmp     L1F46
                            518 ;
   1F43                     519 L1F43:
   1F43 CE 82 03      [ 6]  520         dec     X0382
   1F46                     521 L1F46:
   1F46 AD 82 03      [ 4]  522         lda     X0382
   1F49 8D 82 02      [ 4]  523         sta     X0282
   1F4C 60            [ 6]  524         rts
                            525 ;
   1F4D                     526 X1F4D:
   1F4D 03 04 06 08         527         .db     0x03, 0x04, 0x06, 0x08
   1F51 10 16 20 2D         528         .db     0x10, 0x16, 0x20, 0x2D
   1F55 40 5A 80 BF         529         .db     0x40, 0x5A, 0x80, 0xBF
   1F59 FF FF FF FF         530         .db     0xFF, 0xFF, 0xFF, 0xFF
   1F5D FF                  531         .db     0xFF
                            532 ;
                            533 ; all zeros in this gap
                            534 ;
   1FFC                     535         .org    0x1FFC
                            536 ;
                            537 ; vectors
                            538 ;
   1FFC                     539 RESETVEC:
   1FFC 00 1C               540         .dw     RESET
   1FFE                     541 IRQVEC:
   1FFE 00 00               542         .dw     RAM_start
