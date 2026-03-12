                              1 
                              2         .area   region1 (ABS)
                              3 
                              4         .include "../../include/ptt6502.def"
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
                             78 ; Tape Commands
                     0010    79 TAPEMODE_STOP                   = 0x10
                     0020    80 TAPEMODE_FFWD                   = 0x20
                     0040    81 TAPEMODE_REWIND                 = 0x40
                     0080    82 TAPEMODE_PLAY                   = 0x80
                             83 
                             84 
                             85 
                             86 
                             87 
                             88 
                              5 
   1000                       6         .org    0x1000
                              7         
   1000 FF                    8         .byte   0xff                    ; Need this, or .s19 file wont start here
                              9 
   1A00                      10         .org    0x1A00
                             11 
   1A00                      12 L1A00:
   1A00 D8            [ 2]   13         cld
   1A01 78            [ 2]   14         sei
   1A02 A2 F0         [ 2]   15         ldx     #0xF0
   1A04 9A            [ 2]   16         txs
   1A05 A9 00         [ 2]   17         lda     #0x00
   1A07 A2 10         [ 2]   18         ldx     #0x10
                             19 
                             20 
   1A09                      21 L1A09:
   1A09 95 00         [ 4]   22         sta     0x00,x
   1A0B E8            [ 2]   23         inx
   1A0C E0 80         [ 2]   24         cpx     #0x80
   1A0E D0 F9         [ 4]   25         bne     L1A09
   1A10 A9 00         [ 2]   26         lda     #0x00
   1A12 8D 01 03      [ 4]   27         sta     transport_control_reg_a
   1A15 8D 00 03      [ 4]   28         sta     transport_periph$ddr_reg_a
   1A18 8D 81 03      [ 4]   29         sta     audio_control_reg_a
   1A1B 8D 80 03      [ 4]   30         sta     audio_periph$ddr_reg_a
   1A1E 8D 83 03      [ 4]   31         sta     audio_control_reg_b
   1A21 8D 05 02      [ 4]   32         sta     U18_edge_detect_control_DI_pos
   1A24 8D 03 03      [ 4]   33         sta     transport_control_reg_b
   1A27 8D 01 02      [ 4]   34         sta     U18_DDRA
   1A2A A9 02         [ 2]   35         lda     #0x02
   1A2C 8D 81 02      [ 4]   36         sta     U19_DDRA
   1A2F A9 FF         [ 2]   37         lda     #0xFF
   1A31 8D 82 03      [ 4]   38         sta     audio_periph$ddr_reg_b
   1A34 8D 03 02      [ 4]   39         sta     U18_DDRB
   1A37 8D 83 02      [ 4]   40         sta     U19_DDRB
   1A3A A9 FC         [ 2]   41         lda     #0xFC
   1A3C 8D 02 03      [ 4]   42         sta     transport_periph$ddr_reg_b
   1A3F A9 2E         [ 2]   43         lda     #0x2E
   1A41 8D 01 03      [ 4]   44         sta     transport_control_reg_a
   1A44 8D 03 03      [ 4]   45         sta     transport_control_reg_b
   1A47 A9 3C         [ 2]   46         lda     #0x3C
   1A49 8D 81 03      [ 4]   47         sta     audio_control_reg_a
   1A4C 8D 83 03      [ 4]   48         sta     audio_control_reg_b
   1A4F A9 64         [ 2]   49         lda     #0x64
   1A51 85 54         [ 3]   50         sta     0x54
   1A53 A9 18         [ 2]   51         lda     #0x18
   1A55 85 57         [ 3]   52         sta     0x57
   1A57 A9 64         [ 2]   53         lda     #0x64
   1A59 85 56         [ 3]   54         sta     0x56
   1A5B A9 0A         [ 2]   55         lda     #0x0A
   1A5D 85 64         [ 3]   56         sta     0x64
   1A5F A9 10         [ 2]   57         lda     #0x10
   1A61 20 97 1B      [ 6]   58         jsr     L1B97
   1A64 A9 28         [ 2]   59         lda     #0x28
   1A66 85 55         [ 3]   60         sta     0x55
   1A68 A9 64         [ 2]   61         lda     #0x64
   1A6A 85 54         [ 3]   62         sta     0x54
                             63 
                             64 
   1A6C                      65 L1A6C:
   1A6C 20 B7 1C      [ 6]   66         jsr     L1CB7
   1A6F A5 55         [ 3]   67         lda     0x55
   1A71 D0 F9         [ 4]   68         bne     L1A6C
   1A73 20 64 1B      [ 6]   69         jsr     L1B64
                             70 
                             71 
   1A76                      72 L1A76:
   1A76 A9 FA         [ 2]   73         lda     #0xFA
   1A78 85 66         [ 3]   74         sta     0x66
   1A7A A9 00         [ 2]   75         lda     #0x00
   1A7C 85 67         [ 3]   76         sta     0x67
   1A7E 85 68         [ 3]   77         sta     0x68
   1A80 A9 30         [ 2]   78         lda     #0x30
   1A82 A9 40         [ 2]   79         lda     #0x40
   1A84 20 97 1B      [ 6]   80         jsr     L1B97
                             81 
                             82 
   1A87                      83 L1A87:
   1A87 A9 00         [ 2]   84         lda     #0x00
   1A89 85 59         [ 3]   85         sta     0x59
                             86 
                             87 
   1A8B                      88 L1A8B:
   1A8B AD 02 03      [ 4]   89         lda     transport_periph$ddr_reg_b
   1A8E A9 0A         [ 2]   90         lda     #0x0A
   1A90 85 50         [ 3]   91         sta     0x50
   1A92 E6 59         [ 5]   92         inc     0x59
   1A94 A5 59         [ 3]   93         lda     0x59
   1A96 C9 64         [ 2]   94         cmp     #0x64
   1A98 B0 12         [ 4]   95         bcs     L1AAC
                             96 
                             97 
   1A9A                      98 L1A9A:
   1A9A 20 B7 1C      [ 6]   99         jsr     L1CB7
   1A9D 20 AB 1D      [ 6]  100         jsr     L1DAB
   1AA0 A5 50         [ 3]  101         lda     0x50
   1AA2 F0 E3         [ 4]  102         beq     L1A87
   1AA4 AD 03 03      [ 4]  103         lda     transport_control_reg_b
   1AA7 10 F1         [ 4]  104         bpl     L1A9A
   1AA9 4C 8B 1A      [ 3]  105         jmp     L1A8B
                            106 
                            107 
   1AAC                     108 L1AAC:
   1AAC A9 20         [ 2]  109         lda     #0x20
   1AAE 20 97 1B      [ 6]  110         jsr     L1B97
   1AB1 A9 19         [ 2]  111         lda     #0x19
   1AB3 85 55         [ 3]  112         sta     0x55
   1AB5 A9 64         [ 2]  113         lda     #0x64
   1AB7 85 54         [ 3]  114         sta     0x54
                            115 
                            116 
   1AB9                     117 L1AB9:
   1AB9 20 B7 1C      [ 6]  118         jsr     L1CB7
   1ABC 20 AB 1D      [ 6]  119         jsr     L1DAB
   1ABF A5 55         [ 3]  120         lda     0x55
   1AC1 D0 F6         [ 4]  121         bne     L1AB9
   1AC3 A9 00         [ 2]  122         lda     #0x00
   1AC5 85 5A         [ 3]  123         sta     0x5A
   1AC7 20 B5 1B      [ 6]  124         jsr     L1BB5
   1ACA A9 40         [ 2]  125         lda     #0x40
   1ACC 20 97 1B      [ 6]  126         jsr     L1B97
   1ACF 20 B5 1B      [ 6]  127         jsr     L1BB5
   1AD2 A9 FA         [ 2]  128         lda     #0xFA
   1AD4 85 50         [ 3]  129         sta     0x50
                            130 
                            131 
   1AD6                     132 L1AD6:
   1AD6 20 B7 1C      [ 6]  133         jsr     L1CB7
   1AD9 20 AB 1D      [ 6]  134         jsr     L1DAB
   1ADC A5 50         [ 3]  135         lda     0x50
   1ADE D0 F6         [ 4]  136         bne     L1AD6
   1AE0 A9 20         [ 2]  137         lda     #0x20
   1AE2 20 97 1B      [ 6]  138         jsr     L1B97
   1AE5 20 B5 1B      [ 6]  139         jsr     L1BB5
   1AE8 E6 5A         [ 5]  140         inc     0x5A
   1AEA A9 10         [ 2]  141         lda     #0x10
   1AEC 20 97 1B      [ 6]  142         jsr     L1B97
   1AEF A9 80         [ 2]  143         lda     #0x80
   1AF1 20 97 1B      [ 6]  144         jsr     L1B97
   1AF4 20 DB 1B      [ 6]  145         jsr     L1BDB
   1AF7 A9 10         [ 2]  146         lda     #0x10
   1AF9 20 97 1B      [ 6]  147         jsr     L1B97
   1AFC 20 64 1B      [ 6]  148         jsr     L1B64
                            149 
                            150 
   1AFF                     151 L1AFF:
   1AFF 20 B7 1C      [ 6]  152         jsr     L1CB7
   1B02 20 67 1D      [ 6]  153         jsr     L1D67
   1B05 20 AB 1D      [ 6]  154         jsr     L1DAB
   1B08 A5 5B         [ 3]  155         lda     0x5B
   1B0A D0 10         [ 4]  156         bne     L1B1C
   1B0C A9 02         [ 2]  157         lda     #0x02
   1B0E 8D 80 02      [ 4]  158         sta     U19_PORTA
   1B11 A9 00         [ 2]  159         lda     #0x00
   1B13 8D 02 02      [ 4]  160         sta     U18_PORTB
   1B16 A5 57         [ 3]  161         lda     0x57
   1B18 D0 E5         [ 4]  162         bne     L1AFF
   1B1A E6 5B         [ 5]  163         inc     0x5B
                            164 
                            165 
   1B1C                     166 L1B1C:
   1B1C 20 64 1B      [ 6]  167         jsr     L1B64
   1B1F A9 00         [ 2]  168         lda     #0x00
   1B21 8D 80 02      [ 4]  169         sta     U19_PORTA
   1B24 A9 80         [ 2]  170         lda     #0x80
   1B26 8D 02 02      [ 4]  171         sta     U18_PORTB
   1B29 A9 80         [ 2]  172         lda     #0x80
   1B2B 20 97 1B      [ 6]  173         jsr     L1B97
   1B2E 20 DB 1B      [ 6]  174         jsr     L1BDB
   1B31 C6 5B         [ 5]  175         dec     0x5B
   1B33 20 0A 1C      [ 6]  176         jsr     L1C0A
   1B36 20 64 1B      [ 6]  177         jsr     L1B64
   1B39 A9 18         [ 2]  178         lda     #0x18
   1B3B 85 57         [ 3]  179         sta     0x57
   1B3D A9 64         [ 2]  180         lda     #0x64
   1B3F 85 56         [ 3]  181         sta     0x56
   1B41 E6 5A         [ 5]  182         inc     0x5A
   1B43 A5 5A         [ 3]  183         lda     0x5A
   1B45 C9 1A         [ 2]  184         cmp     #0x1A
   1B47 90 03         [ 4]  185         bcc     L1B4C
   1B49 4C 76 1A      [ 3]  186         jmp     L1A76
                            187 
                            188 
   1B4C                     189 L1B4C:
   1B4C A9 00         [ 2]  190         lda     #0x00
   1B4E 85 67         [ 3]  191         sta     0x67
   1B50 85 68         [ 3]  192         sta     0x68
   1B52 A9 FA         [ 2]  193         lda     #0xFA
   1B54 85 66         [ 3]  194         sta     0x66
   1B56 20 DB 1B      [ 6]  195         jsr     L1BDB
   1B59 A9 10         [ 2]  196         lda     #0x10
   1B5B 20 97 1B      [ 6]  197         jsr     L1B97
   1B5E 20 1B 1D      [ 6]  198         jsr     L1D1B
   1B61 4C FF 1A      [ 3]  199         jmp     L1AFF
                            200 
                            201 
   1B64                     202 L1B64:
   1B64 A9 3C         [ 2]  203         lda     #0x3C
   1B66 8D 83 03      [ 4]  204         sta     audio_control_reg_b
   1B69 A9 34         [ 2]  205         lda     #0x34
   1B6B 8D 81 03      [ 4]  206         sta     audio_control_reg_a
   1B6E A2 00         [ 2]  207         ldx     #0x00
                            208 
                            209 
   1B70                     210 L1B70:
   1B70 A9 30         [ 2]  211         lda     #0x30
   1B72 95 81         [ 4]  212         sta     0x81,x
   1B74 95 83         [ 4]  213         sta     0x83,x
   1B76 A9 FF         [ 2]  214         lda     #0xFF
   1B78 95 80         [ 4]  215         sta     0x80,x
   1B7A 95 82         [ 4]  216         sta     0x82,x
   1B7C A9 34         [ 2]  217         lda     #0x34
   1B7E 95 81         [ 4]  218         sta     0x81,x
   1B80 95 83         [ 4]  219         sta     0x83,x
   1B82 A9 00         [ 2]  220         lda     #0x00
   1B84 95 80         [ 4]  221         sta     0x80,x
   1B86 95 82         [ 4]  222         sta     0x82,x
   1B88 E8            [ 2]  223         inx
   1B89 E8            [ 2]  224         inx
   1B8A E8            [ 2]  225         inx
   1B8B E8            [ 2]  226         inx
   1B8C E0 20         [ 2]  227         cpx     #0x20
   1B8E 90 E0         [ 4]  228         bcc     L1B70
   1B90 A9 00         [ 2]  229         lda     #0x00
   1B92 85 5F         [ 3]  230         sta     0x5F
   1B94 85 65         [ 3]  231         sta     0x65
   1B96 60            [ 6]  232         rts
                            233 
                            234 
   1B97                     235 L1B97:
   1B97 8D 02 03      [ 4]  236         sta     transport_periph$ddr_reg_b
   1B9A A9 FA         [ 2]  237         lda     #0xFA
   1B9C 85 50         [ 3]  238         sta     0x50
                            239 
                            240 
   1B9E                     241 L1B9E:
   1B9E 20 B7 1C      [ 6]  242         jsr     L1CB7
   1BA1 20 AB 1D      [ 6]  243         jsr     L1DAB
   1BA4 A5 50         [ 3]  244         lda     0x50
   1BA6 D0 F6         [ 4]  245         bne     L1B9E
   1BA8 AD 02 03      [ 4]  246         lda     transport_periph$ddr_reg_b
   1BAB 29 60         [ 2]  247         and     #0x60
   1BAD D0 05         [ 4]  248         bne     L1BB4
   1BAF A9 00         [ 2]  249         lda     #0x00
   1BB1 8D 02 03      [ 4]  250         sta     transport_periph$ddr_reg_b
                            251 
                            252 
   1BB4                     253 L1BB4:
   1BB4 60            [ 6]  254         rts
                            255 
                            256 
   1BB5                     257 L1BB5:
   1BB5 A9 00         [ 2]  258         lda     #0x00
   1BB7 85 59         [ 3]  259         sta     0x59
                            260 
                            261 
   1BB9                     262 L1BB9:
   1BB9 AD 02 03      [ 4]  263         lda     transport_periph$ddr_reg_b
   1BBC A9 0A         [ 2]  264         lda     #0x0A
   1BBE 85 50         [ 3]  265         sta     0x50
   1BC0 E6 59         [ 5]  266         inc     0x59
   1BC2 A5 59         [ 3]  267         lda     0x59
   1BC4 C9 21         [ 2]  268         cmp     #0x21
   1BC6 B0 12         [ 4]  269         bcs     L1BDA
                            270 
                            271 
   1BC8                     272 L1BC8:
   1BC8 20 B7 1C      [ 6]  273         jsr     L1CB7
   1BCB 20 AB 1D      [ 6]  274         jsr     L1DAB
   1BCE A5 50         [ 3]  275         lda     0x50
   1BD0 F0 E3         [ 4]  276         beq     L1BB5
   1BD2 AD 03 03      [ 4]  277         lda     transport_control_reg_b
   1BD5 10 F1         [ 4]  278         bpl     L1BC8
   1BD7 4C B9 1B      [ 3]  279         jmp     L1BB9
                            280 
                            281 
   1BDA                     282 L1BDA:
   1BDA 60            [ 6]  283         rts
                            284 
                            285 
   1BDB                     286 L1BDB:
   1BDB A9 FA         [ 2]  287         lda     #0xFA
   1BDD 85 50         [ 3]  288         sta     0x50
                            289 
                            290 
   1BDF                     291 L1BDF:
   1BDF 20 B7 1C      [ 6]  292         jsr     L1CB7
   1BE2 20 AB 1D      [ 6]  293         jsr     L1DAB
   1BE5 A5 50         [ 3]  294         lda     0x50
   1BE7 D0 F6         [ 4]  295         bne     L1BDF
                            296 
                            297 
   1BE9                     298 L1BE9:
   1BE9 20 B7 1C      [ 6]  299         jsr     L1CB7
   1BEC 20 AB 1D      [ 6]  300         jsr     L1DAB
   1BEF AD 02 03      [ 4]  301         lda     transport_periph$ddr_reg_b
   1BF2 6A            [ 2]  302         ror
   1BF3 90 F4         [ 4]  303         bcc     L1BE9
   1BF5 A9 A0         [ 2]  304         lda     #0xA0
   1BF7 85 50         [ 3]  305         sta     0x50
                            306 
                            307 
   1BF9                     308 L1BF9:
   1BF9 20 B7 1C      [ 6]  309         jsr     L1CB7
   1BFC 20 AB 1D      [ 6]  310         jsr     L1DAB
   1BFF AD 02 03      [ 4]  311         lda     transport_periph$ddr_reg_b
   1C02 6A            [ 2]  312         ror
   1C03 90 E4         [ 4]  313         bcc     L1BE9
   1C05 A5 50         [ 3]  314         lda     0x50
   1C07 D0 F0         [ 4]  315         bne     L1BF9
   1C09 60            [ 6]  316         rts
                            317 
                            318 
   1C0A                     319 L1C0A:
   1C0A AD 00 03      [ 4]  320         lda     transport_periph$ddr_reg_a
   1C0D A9 40         [ 2]  321         lda     #0x40
   1C0F 85 82         [ 3]  322         sta     0x82
   1C11 85 86         [ 3]  323         sta     0x86
   1C13 85 8A         [ 3]  324         sta     0x8A
   1C15 85 8E         [ 3]  325         sta     0x8E
   1C17 A9 3C         [ 2]  326         lda     #0x3C
   1C19 8D 81 03      [ 4]  327         sta     audio_control_reg_a
   1C1C A9 34         [ 2]  328         lda     #0x34
   1C1E 8D 83 03      [ 4]  329         sta     audio_control_reg_b
   1C21 A9 60         [ 2]  330         lda     #0x60
   1C23 85 82         [ 3]  331         sta     0x82
                            332 
                            333 
   1C25                     334 L1C25:
   1C25 AD 02 03      [ 4]  335         lda     transport_periph$ddr_reg_b
   1C28 4A            [ 2]  336         lsr
   1C29 90 11         [ 4]  337         bcc     L1C3C
   1C2B 20 67 1D      [ 6]  338         jsr     L1D67
   1C2E 20 B7 1C      [ 6]  339         jsr     L1CB7
   1C31 AD 01 03      [ 4]  340         lda     transport_control_reg_a
   1C34 10 EF         [ 4]  341         bpl     L1C25
   1C36 20 4E 1C      [ 6]  342         jsr     L1C4E
   1C39 4C 25 1C      [ 3]  343         jmp     L1C25
                            344 
                            345 
   1C3C                     346 L1C3C:
   1C3C A9 64         [ 2]  347         lda     #0x64
   1C3E 85 50         [ 3]  348         sta     0x50
                            349 
                            350 
   1C40                     351 L1C40:
   1C40 20 B7 1C      [ 6]  352         jsr     L1CB7
   1C43 AD 02 03      [ 4]  353         lda     transport_periph$ddr_reg_b
   1C46 4A            [ 2]  354         lsr
   1C47 B0 C1         [ 4]  355         bcs     L1C0A
   1C49 A5 50         [ 3]  356         lda     0x50
   1C4B D0 F3         [ 4]  357         bne     L1C40
   1C4D 60            [ 6]  358         rts
                            359 
                            360 
   1C4E                     361 L1C4E:
   1C4E AD 00 03      [ 4]  362         lda     transport_periph$ddr_reg_a
                            363 
                            364 
   1C51                     365 L1C51:
   1C51 29 7F         [ 2]  366         and     #0x7F
   1C53 85 5D         [ 3]  367         sta     0x5D
   1C55 29 7E         [ 2]  368         and     #0x7E
   1C57 C9 22         [ 2]  369         cmp     #0x22
   1C59 F0 3A         [ 4]  370         beq     L1C95
   1C5B C9 32         [ 2]  371         cmp     #0x32
   1C5D 90 4F         [ 4]  372         bcc     L1CAE
   1C5F C9 3A         [ 2]  373         cmp     #0x3A
   1C61 90 32         [ 4]  374         bcc     L1C95
   1C63 A5 5D         [ 3]  375         lda     0x5D
   1C65 C9 41         [ 2]  376         cmp     #0x41
   1C67 90 45         [ 4]  377         bcc     L1CAE
   1C69 C9 4F         [ 2]  378         cmp     #0x4F
   1C6B B0 41         [ 4]  379         bcs     L1CAE
   1C6D A6 65         [ 3]  380         ldx     0x65
   1C6F 38            [ 2]  381         sec
   1C70 E9 41         [ 2]  382         sbc     #0x41
   1C72 C9 08         [ 2]  383         cmp     #0x08
   1C74 90 02         [ 4]  384         bcc     L1C78
   1C76 E8            [ 2]  385         inx
   1C77 E8            [ 2]  386         inx
                            387 
                            388 
   1C78                     389 L1C78:
   1C78 29 07         [ 2]  390         and     #0x07
   1C7A A8            [ 2]  391         tay
   1C7B B9 AF 1C      [ 5]  392         lda     X1CAF,y
   1C7E 85 5E         [ 3]  393         sta     0x5E
   1C80 A5 5F         [ 3]  394         lda     0x5F
   1C82 4A            [ 2]  395         lsr
   1C83 B0 09         [ 4]  396         bcs     L1C8E
   1C85 A5 5E         [ 3]  397         lda     0x5E
   1C87 49 FF         [ 2]  398         eor     #0xFF
   1C89 35 00         [ 4]  399         and     0x00,x
   1C8B 95 00         [ 4]  400         sta     0x00,x
   1C8D 60            [ 6]  401         rts
                            402 
                            403 
   1C8E                     404 L1C8E:
   1C8E A5 5E         [ 3]  405         lda     0x5E
   1C90 15 00         [ 4]  406         ora     0x00,x
   1C92 95 00         [ 4]  407         sta     0x00,x
   1C94 60            [ 6]  408         rts
                            409 
                            410 
   1C95                     411 L1C95:
   1C95 A5 5D         [ 3]  412         lda     0x5D
   1C97 85 5F         [ 3]  413         sta     0x5F
   1C99 29 7E         [ 2]  414         and     #0x7E
   1C9B C9 22         [ 2]  415         cmp     #0x22
   1C9D D0 05         [ 4]  416         bne     L1CA4
   1C9F A9 98         [ 2]  417         lda     #0x98
   1CA1 85 65         [ 3]  418         sta     0x65
   1CA3 60            [ 6]  419         rts
                            420 
                            421 
   1CA4                     422 L1CA4:
   1CA4 38            [ 2]  423         sec
   1CA5 E9 32         [ 2]  424         sbc     #0x32
   1CA7 0A            [ 2]  425         asl
   1CA8 18            [ 2]  426         clc
   1CA9 69 80         [ 2]  427         adc     #0x80
   1CAB 85 65         [ 3]  428         sta     0x65
   1CAD 60            [ 6]  429         rts
                            430 
                            431 
   1CAE                     432 L1CAE:
   1CAE 60            [ 6]  433         rts
                            434 
                            435 
   1CAF                     436 X1CAF:
   1CAF 01 02 04 08 10 20   437         .byte   0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80
        40 80
                            438 
   1CB7                     439 L1CB7:
   1CB7 AD 05 02      [ 4]  440         lda     U18_edge_detect_control_DI_pos
   1CBA 85 60         [ 3]  441         sta     0x60
   1CBC F0 5C         [ 4]  442         beq     L1D1A
   1CBE A5 5C         [ 3]  443         lda     0x5C
   1CC0 30 0E         [ 4]  444         bmi     L1CD0
   1CC2 A5 60         [ 3]  445         lda     0x60
   1CC4 29 40         [ 2]  446         and     #0x40
   1CC6 F0 1A         [ 4]  447         beq     L1CE2
   1CC8 A9 80         [ 2]  448         lda     #0x80
   1CCA 85 5C         [ 3]  449         sta     0x5C
   1CCC A9 FA         [ 2]  450         lda     #0xFA
   1CCE 85 51         [ 3]  451         sta     0x51
                            452 
                            453 
   1CD0                     454 L1CD0:
   1CD0 A5 51         [ 3]  455         lda     0x51
   1CD2 D0 0A         [ 4]  456         bne     L1CDE
   1CD4 A9 00         [ 2]  457         lda     #0x00
   1CD6 85 5C         [ 3]  458         sta     0x5C
   1CD8 A5 5B         [ 3]  459         lda     0x5B
   1CDA D0 02         [ 4]  460         bne     L1CDE
   1CDC E6 5B         [ 5]  461         inc     0x5B
                            462 
                            463 
   1CDE                     464 L1CDE:
   1CDE A5 60         [ 3]  465         lda     0x60
   1CE0 10 38         [ 4]  466         bpl     L1D1A
                            467 
                            468 
   1CE2                     469 L1CE2:
   1CE2 AD 04 02      [ 4]  470         lda     U18_timer
   1CE5 49 FF         [ 2]  471         eor     #0xFF
   1CE7 4A            [ 2]  472         lsr
   1CE8 4A            [ 2]  473         lsr
   1CE9 4A            [ 2]  474         lsr
   1CEA 85 58         [ 3]  475         sta     0x58
   1CEC 90 02         [ 4]  476         bcc     L1CF0
   1CEE E6 58         [ 5]  477         inc     0x58
                            478 
                            479 
   1CF0                     480 L1CF0:
   1CF0 A9 7A         [ 2]  481         lda     #0x7A
   1CF2 38            [ 2]  482         sec
   1CF3 E5 58         [ 3]  483         sbc     0x58
   1CF5 8D 15 02      [ 4]  484         sta     U18_timer_8T_DI
   1CF8 C6 50         [ 5]  485         dec     0x50
   1CFA C6 51         [ 5]  486         dec     0x51
   1CFC C6 53         [ 5]  487         dec     0x53
   1CFE C6 54         [ 5]  488         dec     0x54
   1D00 D0 18         [ 4]  489         bne     L1D1A
   1D02 A9 64         [ 2]  490         lda     #0x64
   1D04 85 54         [ 3]  491         sta     0x54
   1D06 C6 55         [ 5]  492         dec     0x55
   1D08 C6 66         [ 5]  493         dec     0x66
   1D0A D0 04         [ 4]  494         bne     L1D10
   1D0C A9 FA         [ 2]  495         lda     #0xFA
   1D0E 85 66         [ 3]  496         sta     0x66
                            497 
                            498 
   1D10                     499 L1D10:
   1D10 C6 56         [ 5]  500         dec     0x56
   1D12 D0 06         [ 4]  501         bne     L1D1A
   1D14 A9 64         [ 2]  502         lda     #0x64
   1D16 85 56         [ 3]  503         sta     0x56
   1D18 C6 57         [ 5]  504         dec     0x57
                            505 
                            506 
   1D1A                     507 L1D1A:
   1D1A 60            [ 6]  508         rts
                            509 
                            510 
   1D1B                     511 L1D1B:
   1D1B A9 00         [ 2]  512         lda     #0x00
   1D1D 85 62         [ 3]  513         sta     0x62
   1D1F 85 63         [ 3]  514         sta     0x63
   1D21 A9 0A         [ 2]  515         lda     #0x0A
   1D23 85 55         [ 3]  516         sta     0x55
   1D25 A9 64         [ 2]  517         lda     #0x64
   1D27 85 54         [ 3]  518         sta     0x54
                            519 
                            520 
   1D29                     521 L1D29:
   1D29 20 B7 1C      [ 6]  522         jsr     L1CB7
   1D2C 20 AB 1D      [ 6]  523         jsr     L1DAB
   1D2F A5 55         [ 3]  524         lda     0x55
   1D31 D0 F6         [ 4]  525         bne     L1D29
   1D33 A9 0A         [ 2]  526         lda     #0x0A
   1D35 85 55         [ 3]  527         sta     0x55
   1D37 A9 64         [ 2]  528         lda     #0x64
   1D39 85 54         [ 3]  529         sta     0x54
   1D3B A5 63         [ 3]  530         lda     0x63
   1D3D C9 08         [ 2]  531         cmp     #0x08
   1D3F F0 15         [ 4]  532         beq     L1D56
   1D41 E6 63         [ 5]  533         inc     0x63
   1D43 A2 09         [ 2]  534         ldx     #0x09
   1D45 38            [ 2]  535         sec
   1D46 AD 80 03      [ 4]  536         lda     audio_periph$ddr_reg_a
                            537 
                            538 
   1D49                     539 L1D49:
   1D49 2A            [ 2]  540         rol
   1D4A CA            [ 2]  541         dex
   1D4B 90 FC         [ 4]  542         bcc     L1D49
   1D4D 18            [ 2]  543         clc
   1D4E 8A            [ 2]  544         txa
   1D4F 65 62         [ 3]  545         adc     0x62
   1D51 85 62         [ 3]  546         sta     0x62
   1D53 4C 29 1D      [ 3]  547         jmp     L1D29
                            548 
                            549 
   1D56                     550 L1D56:
   1D56 46 62         [ 5]  551         lsr     0x62
   1D58 46 62         [ 5]  552         lsr     0x62
   1D5A 46 62         [ 5]  553         lsr     0x62
   1D5C A5 62         [ 3]  554         lda     0x62
   1D5E 85 61         [ 3]  555         sta     0x61
   1D60 A9 00         [ 2]  556         lda     #0x00
   1D62 85 62         [ 3]  557         sta     0x62
   1D64 85 63         [ 3]  558         sta     0x63
   1D66 60            [ 6]  559         rts
                            560 
                            561 
   1D67                     562 L1D67:
   1D67 AD 80 02      [ 4]  563         lda     U19_PORTA
   1D6A 49 FF         [ 2]  564         eor     #0xFF
   1D6C 4A            [ 2]  565         lsr
   1D6D 4A            [ 2]  566         lsr
   1D6E 4A            [ 2]  567         lsr
   1D6F 4A            [ 2]  568         lsr
   1D70 18            [ 2]  569         clc
   1D71 65 61         [ 3]  570         adc     0x61
   1D73 AA            [ 2]  571         tax
   1D74 BD 9A 1D      [ 5]  572         lda     AGCTABLE,x
   1D77 85 64         [ 3]  573         sta     0x64
   1D79 A5 53         [ 3]  574         lda     0x53
   1D7B D0 16         [ 4]  575         bne     L1D93
   1D7D A9 0A         [ 2]  576         lda     #0x0A
   1D7F 85 53         [ 3]  577         sta     0x53
   1D81 A5 64         [ 3]  578         lda     0x64
   1D83 CD 82 03      [ 4]  579         cmp     audio_periph$ddr_reg_b
   1D86 90 08         [ 4]  580         bcc     L1D90
   1D88 F0 09         [ 4]  581         beq     L1D93
   1D8A EE 82 03      [ 6]  582         inc     audio_periph$ddr_reg_b
   1D8D 4C 93 1D      [ 3]  583         jmp     L1D93
                            584 
                            585 
   1D90                     586 L1D90:
   1D90 CE 82 03      [ 6]  587         dec     audio_periph$ddr_reg_b
                            588 
                            589 
   1D93                     590 L1D93:
   1D93 AD 82 03      [ 4]  591         lda     audio_periph$ddr_reg_b
   1D96 8D 82 02      [ 4]  592         sta     U19_PORTB
   1D99 60            [ 6]  593         rts
                            594 
                            595 ;
                            596 ;       AGC table
                            597 ;
   1D9A                     598 AGCTABLE:
   1D9A 03 04 06 08         599         .db     0x03, 0x04, 0x06, 0x08
   1D9E 10 16 20 2D         600         .db     0x10, 0x16, 0x20, 0x2D
   1DA2 40 5A 80 BF         601         .db     0x40, 0x5A, 0x80, 0xBF
   1DA6 FF FF FF FF         602         .db     0xFF, 0xFF, 0xFF, 0xFF
   1DAA FF                  603         .db     0xFF
                            604 
   1DAB                     605 L1DAB:
   1DAB A5 67         [ 3]  606         lda     0x67
   1DAD AA            [ 2]  607         tax
   1DAE A5 68         [ 3]  608         lda     0x68
   1DB0 D0 33         [ 4]  609         bne     L1DE5
   1DB2 BD 0F 1E      [ 5]  610         lda     X1E0F,x
   1DB5 C9 FE         [ 2]  611         cmp     #0xFE
   1DB7 F0 23         [ 4]  612         beq     L1DDC
   1DB9 C9 FF         [ 2]  613         cmp     #0xFF
   1DBB D0 07         [ 4]  614         bne     L1DC4
   1DBD A9 00         [ 2]  615         lda     #0x00
   1DBF 85 67         [ 3]  616         sta     0x67
   1DC1 4C DB 1D      [ 3]  617         jmp     L1DDB
                            618 
                            619 
   1DC4                     620 L1DC4:
   1DC4 C5 66         [ 3]  621         cmp     0x66
   1DC6 D0 13         [ 4]  622         bne     L1DDB
   1DC8 BD 10 1E      [ 5]  623         lda     X1E10,x
   1DCB 20 51 1C      [ 6]  624         jsr     L1C51
   1DCE BD 11 1E      [ 5]  625         lda     X1E11,x
   1DD1 20 51 1C      [ 6]  626         jsr     L1C51
   1DD4 A5 67         [ 3]  627         lda     0x67
   1DD6 18            [ 2]  628         clc
   1DD7 69 03         [ 2]  629         adc     #0x03
   1DD9 85 67         [ 3]  630         sta     0x67
                            631 
                            632 
   1DDB                     633 L1DDB:
   1DDB 60            [ 6]  634         rts
                            635 
                            636 
   1DDC                     637 L1DDC:
   1DDC E6 68         [ 5]  638         inc     0x68
   1DDE A9 00         [ 2]  639         lda     #0x00
   1DE0 85 67         [ 3]  640         sta     0x67
   1DE2 4C DB 1D      [ 3]  641         jmp     L1DDB
                            642 
                            643 
   1DE5                     644 L1DE5:
   1DE5 BD F3 1E      [ 5]  645         lda     X1EF3,x
   1DE8 C9 FF         [ 2]  646         cmp     #0xFF
   1DEA D0 09         [ 4]  647         bne     L1DF5
   1DEC A9 00         [ 2]  648         lda     #0x00
   1DEE 85 67         [ 3]  649         sta     0x67
   1DF0 85 68         [ 3]  650         sta     0x68
   1DF2 4C DB 1D      [ 3]  651         jmp     L1DDB
                            652 
                            653 
   1DF5                     654 L1DF5:
   1DF5 C5 66         [ 3]  655         cmp     0x66
   1DF7 D0 E2         [ 4]  656         bne     L1DDB
   1DF9 BD F4 1E      [ 5]  657         lda     X1EF4,x
   1DFC 20 51 1C      [ 6]  658         jsr     L1C51
   1DFF BD F5 1E      [ 5]  659         lda     X1EF5,x
   1E02 20 51 1C      [ 6]  660         jsr     L1C51
   1E05 A5 67         [ 3]  661         lda     0x67
   1E07 18            [ 2]  662         clc
   1E08 69 03         [ 2]  663         adc     #0x03
   1E0A 85 67         [ 3]  664         sta     0x67
   1E0C 4C DB 1D      [ 3]  665         jmp     L1DDB
                            666 
   1E0F                     667 X1E0F:
   1E0F EE                  668         .byte   0xEE
                            669 
   1E10                     670 X1E10:
   1E10 35                  671         .byte   0x35
                            672 
   1E11                     673 X1E11:
   1E11 46 EB 35 49 E9 35   674         .byte   0x46,0xEB,0x35,0x49,0xE9,0x35,0x4A,0xE9,0x33,0x42,0xE8,0x33,0x46,0xE7,0x32,0x46
        4A E9 33 42 E8 33
        46 E7 32 46
   1E21 E6 33 46 E5 32 46   675         .byte   0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3,0x32,0x46,0xE2,0x33,0x46,0xE1
        E4 33 46 E3 32 46
        E2 33 46 E1
   1E31 32 46 E0 33 46 DF   676         .byte   0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33,0x46,0xDD,0x32,0x46,0xDD,0x34
        32 46 DE 33 46 DD
        32 46 DD 34
   1E41 46 DC 33 46 DB 32   677         .byte   0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46,0xDA,0x33,0x46,0xD9,0x32,0x46
        46 DB 35 46 DA 33
        46 D9 32 46
   1E51 D1 32 42 C6 33 47   678         .byte   0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5,0x32,0x47,0xC3,0x34,0x46,0xC2
        C6 33 43 C5 32 47
        C3 34 46 C2
   1E61 33 47 C1 32 47 C0   679         .byte   0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34,0x46,0xB9,0x32,0x43,0xB7,0x35
        35 46 B9 34 46 B9
        32 43 B7 35
   1E71 46 B7 33 42 B3 33   680         .byte   0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46,0xA8,0x32,0x42,0x9D,0x33,0x47
        46 B2 32 46 A8 32
        42 9D 33 47
   1E81 9C 32 47 9B 33 47   681         .byte   0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A,0x34,0x46,0x99,0x33,0x47,0x99
        9A 32 47 9A 34 46
        99 33 47 99
   1E91 33 43 99 35 46 98   682         .byte   0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33,0x47,0x94,0x32,0x47,0x93,0x33
        32 47 97 33 47 94
        32 47 93 33
   1EA1 47 92 32 47 91 33   683         .byte   0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47,0x87,0x33,0x42,0x86,0x32,0x43
        47 90 32 47 87 33
        42 86 32 43
   1EB1 7D 33 46 7C 32 46   684         .byte   0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77,0x34,0x46,0x75,0x32,0x43,0x75
        77 32 42 77 34 46
        75 32 43 75
   1EC1 35 46 6A 33 46 69   685         .byte   0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33,0x46,0x66,0x32,0x46,0x66,0x32
        32 46 67 33 46 66
        32 46 66 32
   1ED1 43 65 34 46 62 35   686         .byte   0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42,0x56,0x33,0x46,0x55,0x32,0x46
        46 62 33 42 56 33
        46 55 32 46
   1EE1 55 32 42 54 33 46   687         .byte   0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52,0x33,0x46,0x51,0x32,0x46,0xFE
        53 32 46 52 33 46
        51 32 46 FE
   1EF1 FE FE               688         .byte   0xFE,0xFE
                            689 
   1EF3                     690 X1EF3:
   1EF3 50                  691         .byte   0x50
                            692 
   1EF4                     693 X1EF4:
   1EF4 33                  694         .byte   0x33
                            695 
   1EF5                     696 X1EF5:
   1EF5 46 4F 32 46 4E 33   697         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   1F05 4B 32 46 40 34 46   698         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   1F15 33 47 39 32 47 32   699         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   1F25 46 26 33 43 23 33   700         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   1F35 1B 33 47 1A 32 47   701         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   1F45 33 47 17 32 42 16   702         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   1F55 43 03 33 46 02 32   703         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
   1F65 FF FF FF FF FF FF   704         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F75 FF FF FF FF FF FF   705         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F85 FF FF FF FF FF FF   706         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F95 FF FF FF FF FF FF   707         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FA5 FF FF FF FF FF FF   708         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FB5 FF FF FF FF FF FF   709         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FC5 FF FF FF FF FF FF   710         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FD5 FF FF FF FF FF FF   711         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FE5 FF FF FF FF FF FF   712         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FF5 FF FF FF FF FF      713         .byte   0xFF,0xFF,0xFF,0xFF,0xFF
                            714 
   1FFA                     715         .org    0x1FFA
                            716         ;
                            717         ; vectors
                            718         ;
   1FFA                     719 NMIVEC:
   1FFA FF FF               720         .dw     0xFFFF
   1FFC                     721 RESETVEC:
   1FFC 00 1A               722         .dw     L1A00
   1FFE                     723 IRQVEC:
   1FFE FF FF               724         .dw     0xFFFF
