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
   1A00                      12 RESET:
   1A00 D8            [ 2]   13         cld
   1A01 78            [ 2]   14         sei
   1A02 A2 F0         [ 2]   15         ldx     #0xF0
   1A04 9A            [ 2]   16         txs
   1A05 A9 00         [ 2]   17         lda     #0x00
   1A07 A2 10         [ 2]   18         ldx     #0x10
                             19 
   1A09                      20 ZERORAM:
   1A09 95 00         [ 4]   21         sta     0x00,x
   1A0B E8            [ 2]   22         inx
   1A0C E0 80         [ 2]   23         cpx     #0x80
   1A0E D0 F9         [ 4]   24         bne     ZERORAM
   1A10 A9 00         [ 2]   25         lda     #0x00
   1A12 8D 01 03      [ 4]   26         sta     transport_control_reg_a
   1A15 8D 00 03      [ 4]   27         sta     transport_periph$ddr_reg_a
   1A18 8D 81 03      [ 4]   28         sta     audio_control_reg_a
   1A1B 8D 80 03      [ 4]   29         sta     audio_periph$ddr_reg_a
   1A1E 8D 83 03      [ 4]   30         sta     audio_control_reg_b
   1A21 8D 05 02      [ 4]   31         sta     U18_edge_detect_control_DI_pos
   1A24 8D 03 03      [ 4]   32         sta     transport_control_reg_b
   1A27 8D 01 02      [ 4]   33         sta     U18_DDRA
   1A2A A9 02         [ 2]   34         lda     #0x02
   1A2C 8D 81 02      [ 4]   35         sta     U19_DDRA
   1A2F A9 FF         [ 2]   36         lda     #0xFF
   1A31 8D 82 03      [ 4]   37         sta     audio_periph$ddr_reg_b
   1A34 8D 03 02      [ 4]   38         sta     U18_DDRB
   1A37 8D 83 02      [ 4]   39         sta     U19_DDRB
   1A3A A9 FC         [ 2]   40         lda     #0xFC
   1A3C 8D 02 03      [ 4]   41         sta     transport_periph$ddr_reg_b
   1A3F A9 2E         [ 2]   42         lda     #0x2E
   1A41 8D 01 03      [ 4]   43         sta     transport_control_reg_a
   1A44 8D 03 03      [ 4]   44         sta     transport_control_reg_b
   1A47 A9 3C         [ 2]   45         lda     #0x3C
   1A49 8D 81 03      [ 4]   46         sta     audio_control_reg_a
   1A4C 8D 83 03      [ 4]   47         sta     audio_control_reg_b
   1A4F A9 64         [ 2]   48         lda     #0x64
   1A51 85 54         [ 3]   49         sta     0x54
   1A53 A9 18         [ 2]   50         lda     #0x18
   1A55 85 57         [ 3]   51         sta     0x57
   1A57 A9 64         [ 2]   52         lda     #0x64
   1A59 85 56         [ 3]   53         sta     0x56
   1A5B A9 0A         [ 2]   54         lda     #0x0A
   1A5D 85 64         [ 3]   55         sta     0x64
   1A5F A9 10         [ 2]   56         lda     #0x10
   1A61 20 97 1B      [ 6]   57         jsr     L1B97
   1A64 A9 28         [ 2]   58         lda     #0x28
   1A66 85 55         [ 3]   59         sta     0x55
   1A68 A9 64         [ 2]   60         lda     #0x64
   1A6A 85 54         [ 3]   61         sta     0x54
                             62 
                             63 
   1A6C                      64 L1A6C:
   1A6C 20 B7 1C      [ 6]   65         jsr     L1CB7
   1A6F A5 55         [ 3]   66         lda     0x55
   1A71 D0 F9         [ 4]   67         bne     L1A6C
   1A73 20 64 1B      [ 6]   68         jsr     L1B64
                             69 
                             70 
   1A76                      71 L1A76:
   1A76 A9 FA         [ 2]   72         lda     #0xFA
   1A78 85 66         [ 3]   73         sta     0x66
   1A7A A9 00         [ 2]   74         lda     #0x00
   1A7C 85 67         [ 3]   75         sta     0x67
   1A7E 85 68         [ 3]   76         sta     0x68
   1A80 A9 30         [ 2]   77         lda     #0x30
   1A82 A9 40         [ 2]   78         lda     #0x40
   1A84 20 97 1B      [ 6]   79         jsr     L1B97
                             80 
                             81 
   1A87                      82 L1A87:
   1A87 A9 00         [ 2]   83         lda     #0x00
   1A89 85 59         [ 3]   84         sta     0x59
                             85 
                             86 
   1A8B                      87 L1A8B:
   1A8B AD 02 03      [ 4]   88         lda     transport_periph$ddr_reg_b
   1A8E A9 0A         [ 2]   89         lda     #0x0A
   1A90 85 50         [ 3]   90         sta     0x50
   1A92 E6 59         [ 5]   91         inc     0x59
   1A94 A5 59         [ 3]   92         lda     0x59
   1A96 C9 64         [ 2]   93         cmp     #0x64
   1A98 B0 12         [ 4]   94         bcs     L1AAC
                             95 
                             96 
   1A9A                      97 L1A9A:
   1A9A 20 B7 1C      [ 6]   98         jsr     L1CB7
   1A9D 20 AB 1D      [ 6]   99         jsr     L1DAB
   1AA0 A5 50         [ 3]  100         lda     0x50
   1AA2 F0 E3         [ 4]  101         beq     L1A87
   1AA4 AD 03 03      [ 4]  102         lda     transport_control_reg_b
   1AA7 10 F1         [ 4]  103         bpl     L1A9A
   1AA9 4C 8B 1A      [ 3]  104         jmp     L1A8B
                            105 
                            106 
   1AAC                     107 L1AAC:
   1AAC A9 20         [ 2]  108         lda     #0x20
   1AAE 20 97 1B      [ 6]  109         jsr     L1B97
   1AB1 A9 19         [ 2]  110         lda     #0x19
   1AB3 85 55         [ 3]  111         sta     0x55
   1AB5 A9 64         [ 2]  112         lda     #0x64
   1AB7 85 54         [ 3]  113         sta     0x54
                            114 
                            115 
   1AB9                     116 L1AB9:
   1AB9 20 B7 1C      [ 6]  117         jsr     L1CB7
   1ABC 20 AB 1D      [ 6]  118         jsr     L1DAB
   1ABF A5 55         [ 3]  119         lda     0x55
   1AC1 D0 F6         [ 4]  120         bne     L1AB9
   1AC3 A9 00         [ 2]  121         lda     #0x00
   1AC5 85 5A         [ 3]  122         sta     0x5A
   1AC7 20 B5 1B      [ 6]  123         jsr     L1BB5
   1ACA A9 40         [ 2]  124         lda     #0x40
   1ACC 20 97 1B      [ 6]  125         jsr     L1B97
   1ACF 20 B5 1B      [ 6]  126         jsr     L1BB5
   1AD2 A9 FA         [ 2]  127         lda     #0xFA
   1AD4 85 50         [ 3]  128         sta     0x50
                            129 
                            130 
   1AD6                     131 L1AD6:
   1AD6 20 B7 1C      [ 6]  132         jsr     L1CB7
   1AD9 20 AB 1D      [ 6]  133         jsr     L1DAB
   1ADC A5 50         [ 3]  134         lda     0x50
   1ADE D0 F6         [ 4]  135         bne     L1AD6
   1AE0 A9 20         [ 2]  136         lda     #0x20
   1AE2 20 97 1B      [ 6]  137         jsr     L1B97
   1AE5 20 B5 1B      [ 6]  138         jsr     L1BB5
   1AE8 E6 5A         [ 5]  139         inc     0x5A
   1AEA A9 10         [ 2]  140         lda     #0x10
   1AEC 20 97 1B      [ 6]  141         jsr     L1B97
   1AEF A9 80         [ 2]  142         lda     #0x80
   1AF1 20 97 1B      [ 6]  143         jsr     L1B97
   1AF4 20 DB 1B      [ 6]  144         jsr     L1BDB
   1AF7 A9 10         [ 2]  145         lda     #0x10
   1AF9 20 97 1B      [ 6]  146         jsr     L1B97
   1AFC 20 64 1B      [ 6]  147         jsr     L1B64
                            148 
                            149 
   1AFF                     150 L1AFF:
   1AFF 20 B7 1C      [ 6]  151         jsr     L1CB7
   1B02 20 67 1D      [ 6]  152         jsr     AGCUPD
   1B05 20 AB 1D      [ 6]  153         jsr     L1DAB
   1B08 A5 5B         [ 3]  154         lda     0x5B
   1B0A D0 10         [ 4]  155         bne     L1B1C
   1B0C A9 02         [ 2]  156         lda     #0x02
   1B0E 8D 80 02      [ 4]  157         sta     U19_PORTA
   1B11 A9 00         [ 2]  158         lda     #0x00
   1B13 8D 02 02      [ 4]  159         sta     U18_PORTB
   1B16 A5 57         [ 3]  160         lda     0x57
   1B18 D0 E5         [ 4]  161         bne     L1AFF
   1B1A E6 5B         [ 5]  162         inc     0x5B
                            163 
                            164 
   1B1C                     165 L1B1C:
   1B1C 20 64 1B      [ 6]  166         jsr     L1B64
   1B1F A9 00         [ 2]  167         lda     #0x00
   1B21 8D 80 02      [ 4]  168         sta     U19_PORTA
   1B24 A9 80         [ 2]  169         lda     #0x80
   1B26 8D 02 02      [ 4]  170         sta     U18_PORTB
   1B29 A9 80         [ 2]  171         lda     #0x80
   1B2B 20 97 1B      [ 6]  172         jsr     L1B97
   1B2E 20 DB 1B      [ 6]  173         jsr     L1BDB
   1B31 C6 5B         [ 5]  174         dec     0x5B
   1B33 20 0A 1C      [ 6]  175         jsr     L1C0A
   1B36 20 64 1B      [ 6]  176         jsr     L1B64
   1B39 A9 18         [ 2]  177         lda     #0x18
   1B3B 85 57         [ 3]  178         sta     0x57
   1B3D A9 64         [ 2]  179         lda     #0x64
   1B3F 85 56         [ 3]  180         sta     0x56
   1B41 E6 5A         [ 5]  181         inc     0x5A
   1B43 A5 5A         [ 3]  182         lda     0x5A
   1B45 C9 1A         [ 2]  183         cmp     #0x1A
   1B47 90 03         [ 4]  184         bcc     L1B4C
   1B49 4C 76 1A      [ 3]  185         jmp     L1A76
                            186 
                            187 
   1B4C                     188 L1B4C:
   1B4C A9 00         [ 2]  189         lda     #0x00
   1B4E 85 67         [ 3]  190         sta     0x67
   1B50 85 68         [ 3]  191         sta     0x68
   1B52 A9 FA         [ 2]  192         lda     #0xFA
   1B54 85 66         [ 3]  193         sta     0x66
   1B56 20 DB 1B      [ 6]  194         jsr     L1BDB
   1B59 A9 10         [ 2]  195         lda     #0x10
   1B5B 20 97 1B      [ 6]  196         jsr     L1B97
   1B5E 20 1B 1D      [ 6]  197         jsr     AGCMICRD
   1B61 4C FF 1A      [ 3]  198         jmp     L1AFF
                            199 
                            200 
   1B64                     201 L1B64:
   1B64 A9 3C         [ 2]  202         lda     #0x3C
   1B66 8D 83 03      [ 4]  203         sta     audio_control_reg_b
   1B69 A9 34         [ 2]  204         lda     #0x34
   1B6B 8D 81 03      [ 4]  205         sta     audio_control_reg_a
   1B6E A2 00         [ 2]  206         ldx     #0x00
                            207 
                            208 
   1B70                     209 L1B70:
   1B70 A9 30         [ 2]  210         lda     #0x30
   1B72 95 81         [ 4]  211         sta     0x81,x
   1B74 95 83         [ 4]  212         sta     0x83,x
   1B76 A9 FF         [ 2]  213         lda     #0xFF
   1B78 95 80         [ 4]  214         sta     0x80,x
   1B7A 95 82         [ 4]  215         sta     0x82,x
   1B7C A9 34         [ 2]  216         lda     #0x34
   1B7E 95 81         [ 4]  217         sta     0x81,x
   1B80 95 83         [ 4]  218         sta     0x83,x
   1B82 A9 00         [ 2]  219         lda     #0x00
   1B84 95 80         [ 4]  220         sta     0x80,x
   1B86 95 82         [ 4]  221         sta     0x82,x
   1B88 E8            [ 2]  222         inx
   1B89 E8            [ 2]  223         inx
   1B8A E8            [ 2]  224         inx
   1B8B E8            [ 2]  225         inx
   1B8C E0 20         [ 2]  226         cpx     #0x20
   1B8E 90 E0         [ 4]  227         bcc     L1B70
   1B90 A9 00         [ 2]  228         lda     #0x00
   1B92 85 5F         [ 3]  229         sta     0x5F
   1B94 85 65         [ 3]  230         sta     0x65
   1B96 60            [ 6]  231         rts
                            232 
                            233 
   1B97                     234 L1B97:
   1B97 8D 02 03      [ 4]  235         sta     transport_periph$ddr_reg_b
   1B9A A9 FA         [ 2]  236         lda     #0xFA
   1B9C 85 50         [ 3]  237         sta     0x50
                            238 
                            239 
   1B9E                     240 L1B9E:
   1B9E 20 B7 1C      [ 6]  241         jsr     L1CB7
   1BA1 20 AB 1D      [ 6]  242         jsr     L1DAB
   1BA4 A5 50         [ 3]  243         lda     0x50
   1BA6 D0 F6         [ 4]  244         bne     L1B9E
   1BA8 AD 02 03      [ 4]  245         lda     transport_periph$ddr_reg_b
   1BAB 29 60         [ 2]  246         and     #0x60
   1BAD D0 05         [ 4]  247         bne     L1BB4
   1BAF A9 00         [ 2]  248         lda     #0x00
   1BB1 8D 02 03      [ 4]  249         sta     transport_periph$ddr_reg_b
                            250 
                            251 
   1BB4                     252 L1BB4:
   1BB4 60            [ 6]  253         rts
                            254 
                            255 
   1BB5                     256 L1BB5:
   1BB5 A9 00         [ 2]  257         lda     #0x00
   1BB7 85 59         [ 3]  258         sta     0x59
                            259 
                            260 
   1BB9                     261 L1BB9:
   1BB9 AD 02 03      [ 4]  262         lda     transport_periph$ddr_reg_b
   1BBC A9 0A         [ 2]  263         lda     #0x0A
   1BBE 85 50         [ 3]  264         sta     0x50
   1BC0 E6 59         [ 5]  265         inc     0x59
   1BC2 A5 59         [ 3]  266         lda     0x59
   1BC4 C9 21         [ 2]  267         cmp     #0x21
   1BC6 B0 12         [ 4]  268         bcs     L1BDA
                            269 
                            270 
   1BC8                     271 L1BC8:
   1BC8 20 B7 1C      [ 6]  272         jsr     L1CB7
   1BCB 20 AB 1D      [ 6]  273         jsr     L1DAB
   1BCE A5 50         [ 3]  274         lda     0x50
   1BD0 F0 E3         [ 4]  275         beq     L1BB5
   1BD2 AD 03 03      [ 4]  276         lda     transport_control_reg_b
   1BD5 10 F1         [ 4]  277         bpl     L1BC8
   1BD7 4C B9 1B      [ 3]  278         jmp     L1BB9
                            279 
                            280 
   1BDA                     281 L1BDA:
   1BDA 60            [ 6]  282         rts
                            283 
                            284 
   1BDB                     285 L1BDB:
   1BDB A9 FA         [ 2]  286         lda     #0xFA
   1BDD 85 50         [ 3]  287         sta     0x50
                            288 
                            289 
   1BDF                     290 L1BDF:
   1BDF 20 B7 1C      [ 6]  291         jsr     L1CB7
   1BE2 20 AB 1D      [ 6]  292         jsr     L1DAB
   1BE5 A5 50         [ 3]  293         lda     0x50
   1BE7 D0 F6         [ 4]  294         bne     L1BDF
                            295 
                            296 
   1BE9                     297 L1BE9:
   1BE9 20 B7 1C      [ 6]  298         jsr     L1CB7
   1BEC 20 AB 1D      [ 6]  299         jsr     L1DAB
   1BEF AD 02 03      [ 4]  300         lda     transport_periph$ddr_reg_b
   1BF2 6A            [ 2]  301         ror
   1BF3 90 F4         [ 4]  302         bcc     L1BE9
   1BF5 A9 A0         [ 2]  303         lda     #0xA0
   1BF7 85 50         [ 3]  304         sta     0x50
                            305 
                            306 
   1BF9                     307 L1BF9:
   1BF9 20 B7 1C      [ 6]  308         jsr     L1CB7
   1BFC 20 AB 1D      [ 6]  309         jsr     L1DAB
   1BFF AD 02 03      [ 4]  310         lda     transport_periph$ddr_reg_b
   1C02 6A            [ 2]  311         ror
   1C03 90 E4         [ 4]  312         bcc     L1BE9
   1C05 A5 50         [ 3]  313         lda     0x50
   1C07 D0 F0         [ 4]  314         bne     L1BF9
   1C09 60            [ 6]  315         rts
                            316 
                            317 
   1C0A                     318 L1C0A:
   1C0A AD 00 03      [ 4]  319         lda     transport_periph$ddr_reg_a
   1C0D A9 40         [ 2]  320         lda     #0x40
   1C0F 85 82         [ 3]  321         sta     0x82
   1C11 85 86         [ 3]  322         sta     0x86
   1C13 85 8A         [ 3]  323         sta     0x8A
   1C15 85 8E         [ 3]  324         sta     0x8E
   1C17 A9 3C         [ 2]  325         lda     #0x3C
   1C19 8D 81 03      [ 4]  326         sta     audio_control_reg_a
   1C1C A9 34         [ 2]  327         lda     #0x34
   1C1E 8D 83 03      [ 4]  328         sta     audio_control_reg_b
   1C21 A9 60         [ 2]  329         lda     #0x60
   1C23 85 82         [ 3]  330         sta     0x82
                            331 
                            332 
   1C25                     333 L1C25:
   1C25 AD 02 03      [ 4]  334         lda     transport_periph$ddr_reg_b
   1C28 4A            [ 2]  335         lsr
   1C29 90 11         [ 4]  336         bcc     L1C3C
   1C2B 20 67 1D      [ 6]  337         jsr     AGCUPD
   1C2E 20 B7 1C      [ 6]  338         jsr     L1CB7
   1C31 AD 01 03      [ 4]  339         lda     transport_control_reg_a
   1C34 10 EF         [ 4]  340         bpl     L1C25
   1C36 20 4E 1C      [ 6]  341         jsr     PROTOHAND
   1C39 4C 25 1C      [ 3]  342         jmp     L1C25
                            343 
                            344 
   1C3C                     345 L1C3C:
   1C3C A9 64         [ 2]  346         lda     #0x64
   1C3E 85 50         [ 3]  347         sta     0x50
                            348 
                            349 
   1C40                     350 L1C40:
   1C40 20 B7 1C      [ 6]  351         jsr     L1CB7
   1C43 AD 02 03      [ 4]  352         lda     transport_periph$ddr_reg_b
   1C46 4A            [ 2]  353         lsr
   1C47 B0 C1         [ 4]  354         bcs     L1C0A
   1C49 A5 50         [ 3]  355         lda     0x50
   1C4B D0 F3         [ 4]  356         bne     L1C40
   1C4D 60            [ 6]  357         rts
                            358 ;
                            359 ; Protocol handler
                            360 ;
   1C4E                     361 PROTOHAND:
   1C4E AD 00 03      [ 4]  362         lda     transport_periph$ddr_reg_a
   1C51                     363 PROCBYTE:
   1C51 29 7F         [ 2]  364         and     #0x7F
   1C53 85 5D         [ 3]  365         sta     0x5D
   1C55 29 7E         [ 2]  366         and     #0x7E
   1C57 C9 22         [ 2]  367         cmp     #0x22
   1C59 F0 3A         [ 4]  368         beq     PROCCHNL
   1C5B C9 32         [ 2]  369         cmp     #0x32
   1C5D 90 4F         [ 4]  370         bcc     $18
   1C5F C9 3A         [ 2]  371         cmp     #0x3A
   1C61 90 32         [ 4]  372         bcc     PROCCHNL
   1C63 A5 5D         [ 3]  373         lda     0x5D
   1C65 C9 41         [ 2]  374         cmp     #0x41
   1C67 90 45         [ 4]  375         bcc     $18
   1C69 C9 4F         [ 2]  376         cmp     #0x4F
   1C6B B0 41         [ 4]  377         bcs     $18
   1C6D A6 65         [ 3]  378         ldx     0x65
   1C6F 38            [ 2]  379         sec
   1C70 E9 41         [ 2]  380         sbc     #0x41
   1C72 C9 08         [ 2]  381         cmp     #0x08
   1C74 90 02         [ 4]  382         bcc     $16
   1C76 E8            [ 2]  383         inx
   1C77 E8            [ 2]  384         inx
   1C78                     385 $16:
   1C78 29 07         [ 2]  386         and     #0x07
   1C7A A8            [ 2]  387         tay
   1C7B B9 AF 1C      [ 5]  388         lda     MASKTBL,y
   1C7E 85 5E         [ 3]  389         sta     0x5E
   1C80 A5 5F         [ 3]  390         lda     0x5F
   1C82 4A            [ 2]  391         lsr
   1C83 B0 09         [ 4]  392         bcs     $17
   1C85 A5 5E         [ 3]  393         lda     0x5E
   1C87 49 FF         [ 2]  394         eor     #0xFF
   1C89 35 00         [ 4]  395         and     0x00,x
   1C8B 95 00         [ 4]  396         sta     0x00,x
   1C8D 60            [ 6]  397         rts
                            398 ;
   1C8E                     399 $17:
   1C8E A5 5E         [ 3]  400         lda     0x5E
   1C90 15 00         [ 4]  401         ora     0x00,x
   1C92 95 00         [ 4]  402         sta     0x00,x
   1C94 60            [ 6]  403         rts
                            404 ;
   1C95                     405 PROCCHNL:
   1C95 A5 5D         [ 3]  406         lda     0x5D
   1C97 85 5F         [ 3]  407         sta     0x5F
   1C99 29 7E         [ 2]  408         and     #0x7E
   1C9B C9 22         [ 2]  409         cmp     #0x22
   1C9D D0 05         [ 4]  410         bne     CONVCHNL
   1C9F A9 98         [ 2]  411         lda     #0x98
   1CA1 85 65         [ 3]  412         sta     0x65
   1CA3 60            [ 6]  413         rts
                            414 ;
   1CA4                     415 CONVCHNL:
   1CA4 38            [ 2]  416         sec
   1CA5 E9 32         [ 2]  417         sbc     #0x32
   1CA7 0A            [ 2]  418         asl
   1CA8 18            [ 2]  419         clc
   1CA9 69 80         [ 2]  420         adc     #0x80
   1CAB 85 65         [ 3]  421         sta     0x65
   1CAD 60            [ 6]  422         rts
   1CAE                     423 $18:
   1CAE 60            [ 6]  424         rts
                            425 ;
                            426 ; bit mask table
                            427 ;
   1CAF                     428 MASKTBL:
   1CAF 01 02 04 08         429         .db     0x01,0x02,0x04,0x08
   1CB3 10 20 40 80         430         .db     0x10,0x20,0x40,0x80
                            431 ;
                            432 ;       Housekeeping routine
                            433 ;
                            434 ;
   1CB7                     435 L1CB7:
   1CB7 AD 05 02      [ 4]  436         lda     U18_edge_detect_control_DI_pos
   1CBA 85 60         [ 3]  437         sta     0x60
   1CBC F0 5C         [ 4]  438         beq     L1D1A
   1CBE A5 5C         [ 3]  439         lda     0x5C
   1CC0 30 0E         [ 4]  440         bmi     L1CD0
   1CC2 A5 60         [ 3]  441         lda     0x60
   1CC4 29 40         [ 2]  442         and     #0x40
   1CC6 F0 1A         [ 4]  443         beq     L1CE2
   1CC8 A9 80         [ 2]  444         lda     #0x80
   1CCA 85 5C         [ 3]  445         sta     0x5C
   1CCC A9 FA         [ 2]  446         lda     #0xFA
   1CCE 85 51         [ 3]  447         sta     0x51
   1CD0                     448 L1CD0:
   1CD0 A5 51         [ 3]  449         lda     0x51
   1CD2 D0 0A         [ 4]  450         bne     L1CDE
   1CD4 A9 00         [ 2]  451         lda     #0x00
   1CD6 85 5C         [ 3]  452         sta     0x5C
   1CD8 A5 5B         [ 3]  453         lda     0x5B
   1CDA D0 02         [ 4]  454         bne     L1CDE
   1CDC E6 5B         [ 5]  455         inc     0x5B
   1CDE                     456 L1CDE:
   1CDE A5 60         [ 3]  457         lda     0x60
   1CE0 10 38         [ 4]  458         bpl     L1D1A
                            459 ; Adjust Timer routine
   1CE2                     460 L1CE2:
   1CE2 AD 04 02      [ 4]  461         lda     U18_timer
   1CE5 49 FF         [ 2]  462         eor     #0xFF
   1CE7 4A            [ 2]  463         lsr
   1CE8 4A            [ 2]  464         lsr
   1CE9 4A            [ 2]  465         lsr
   1CEA 85 58         [ 3]  466         sta     0x58
   1CEC 90 02         [ 4]  467         bcc     L1CF0
   1CEE E6 58         [ 5]  468         inc     0x58
                            469 
                            470 
   1CF0                     471 L1CF0:
   1CF0 A9 7A         [ 2]  472         lda     #0x7A
   1CF2 38            [ 2]  473         sec
   1CF3 E5 58         [ 3]  474         sbc     0x58
   1CF5 8D 15 02      [ 4]  475         sta     U18_timer_8T_DI
   1CF8 C6 50         [ 5]  476         dec     0x50
   1CFA C6 51         [ 5]  477         dec     0x51
   1CFC C6 53         [ 5]  478         dec     0x53
   1CFE C6 54         [ 5]  479         dec     0x54
   1D00 D0 18         [ 4]  480         bne     L1D1A
   1D02 A9 64         [ 2]  481         lda     #0x64
   1D04 85 54         [ 3]  482         sta     0x54
   1D06 C6 55         [ 5]  483         dec     0x55
   1D08 C6 66         [ 5]  484         dec     0x66
   1D0A D0 04         [ 4]  485         bne     L1D10
   1D0C A9 FA         [ 2]  486         lda     #0xFA
   1D0E 85 66         [ 3]  487         sta     0x66
   1D10                     488 L1D10:
   1D10 C6 56         [ 5]  489         dec     0x56
   1D12 D0 06         [ 4]  490         bne     L1D1A
   1D14 A9 64         [ 2]  491         lda     #0x64
   1D16 85 56         [ 3]  492         sta     0x56
   1D18 C6 57         [ 5]  493         dec     0x57
   1D1A                     494 L1D1A:
   1D1A 60            [ 6]  495         rts
                            496 ;
                            497 ;       Read the AGC mic level
                            498 ;       Take the average of 8 samples
                            499 ;
   1D1B                     500 AGCMICRD:
   1D1B A9 00         [ 2]  501         lda     #0x00
   1D1D 85 62         [ 3]  502         sta     0x62
   1D1F 85 63         [ 3]  503         sta     0x63
   1D21 A9 0A         [ 2]  504         lda     #0x0A
   1D23 85 55         [ 3]  505         sta     0x55
   1D25 A9 64         [ 2]  506         lda     #0x64
   1D27 85 54         [ 3]  507         sta     0x54
   1D29                     508 $23:
   1D29 20 B7 1C      [ 6]  509         jsr     L1CB7
   1D2C 20 AB 1D      [ 6]  510         jsr     L1DAB
   1D2F A5 55         [ 3]  511         lda     0x55
   1D31 D0 F6         [ 4]  512         bne     $23
   1D33 A9 0A         [ 2]  513         lda     #0x0A
   1D35 85 55         [ 3]  514         sta     0x55
   1D37 A9 64         [ 2]  515         lda     #0x64
   1D39 85 54         [ 3]  516         sta     0x54
   1D3B A5 63         [ 3]  517         lda     0x63
   1D3D C9 08         [ 2]  518         cmp     #0x08
   1D3F F0 15         [ 4]  519         beq     $27
   1D41 E6 63         [ 5]  520         inc     0x63
   1D43 A2 09         [ 2]  521         ldx     #0x09
   1D45 38            [ 2]  522         sec
   1D46 AD 80 03      [ 4]  523         lda     audio_periph$ddr_reg_a
   1D49                     524 $24:
   1D49 2A            [ 2]  525         rol
   1D4A CA            [ 2]  526         dex
   1D4B 90 FC         [ 4]  527         bcc     $24
   1D4D 18            [ 2]  528         clc
   1D4E 8A            [ 2]  529         txa
   1D4F 65 62         [ 3]  530         adc     0x62
   1D51 85 62         [ 3]  531         sta     0x62
   1D53 4C 29 1D      [ 3]  532         jmp     $23
                            533 ;
   1D56                     534 $27:
   1D56 46 62         [ 5]  535         lsr     0x62
   1D58 46 62         [ 5]  536         lsr     0x62
   1D5A 46 62         [ 5]  537         lsr     0x62
   1D5C A5 62         [ 3]  538         lda     0x62
   1D5E 85 61         [ 3]  539         sta     0x61
   1D60 A9 00         [ 2]  540         lda     #0x00
   1D62 85 62         [ 3]  541         sta     0x62
   1D64 85 63         [ 3]  542         sta     0x63
   1D66 60            [ 6]  543         rts
                            544 ;
                            545 ;        Do AGC Mic Logic
                            546 ;
   1D67                     547 AGCUPD:
   1D67 AD 80 02      [ 4]  548         lda     U19_PORTA
   1D6A 49 FF         [ 2]  549         eor     #0xFF
   1D6C 4A            [ 2]  550         lsr
   1D6D 4A            [ 2]  551         lsr
   1D6E 4A            [ 2]  552         lsr
   1D6F 4A            [ 2]  553         lsr
   1D70 18            [ 2]  554         clc
   1D71 65 61         [ 3]  555         adc     0x61
   1D73 AA            [ 2]  556         tax
   1D74 BD 9A 1D      [ 5]  557         lda     AGCTABLE,x
   1D77 85 64         [ 3]  558         sta     0x64
   1D79 A5 53         [ 3]  559         lda     0x53
   1D7B D0 16         [ 4]  560         bne     $26
   1D7D A9 0A         [ 2]  561         lda     #0x0A
   1D7F 85 53         [ 3]  562         sta     0x53
   1D81 A5 64         [ 3]  563         lda     0x64
   1D83 CD 82 03      [ 4]  564         cmp     audio_periph$ddr_reg_b
   1D86 90 08         [ 4]  565         bcc     $25
   1D88 F0 09         [ 4]  566         beq     $26
   1D8A EE 82 03      [ 6]  567         inc     audio_periph$ddr_reg_b
   1D8D 4C 93 1D      [ 3]  568         jmp     $26
                            569 ;
   1D90                     570 $25:
   1D90 CE 82 03      [ 6]  571         dec     audio_periph$ddr_reg_b
   1D93                     572 $26:
   1D93 AD 82 03      [ 4]  573         lda     audio_periph$ddr_reg_b
   1D96 8D 82 02      [ 4]  574         sta     U19_PORTB
   1D99 60            [ 6]  575         rts
                            576 ;
                            577 ;       AGC table
                            578 ;
   1D9A                     579 AGCTABLE:
   1D9A 03 04 06 08         580         .db     0x03, 0x04, 0x06, 0x08
   1D9E 10 16 20 2D         581         .db     0x10, 0x16, 0x20, 0x2D
   1DA2 40 5A 80 BF         582         .db     0x40, 0x5A, 0x80, 0xBF
   1DA6 FF FF FF FF         583         .db     0xFF, 0xFF, 0xFF, 0xFF
   1DAA FF                  584         .db     0xFF
                            585 
   1DAB                     586 L1DAB:
   1DAB A5 67         [ 3]  587         lda     0x67
   1DAD AA            [ 2]  588         tax
   1DAE A5 68         [ 3]  589         lda     0x68
   1DB0 D0 33         [ 4]  590         bne     L1DE5
   1DB2 BD 0F 1E      [ 5]  591         lda     X1E0F,x
   1DB5 C9 FE         [ 2]  592         cmp     #0xFE
   1DB7 F0 23         [ 4]  593         beq     L1DDC
   1DB9 C9 FF         [ 2]  594         cmp     #0xFF
   1DBB D0 07         [ 4]  595         bne     L1DC4
   1DBD A9 00         [ 2]  596         lda     #0x00
   1DBF 85 67         [ 3]  597         sta     0x67
   1DC1 4C DB 1D      [ 3]  598         jmp     L1DDB
                            599 
                            600 
   1DC4                     601 L1DC4:
   1DC4 C5 66         [ 3]  602         cmp     0x66
   1DC6 D0 13         [ 4]  603         bne     L1DDB
   1DC8 BD 10 1E      [ 5]  604         lda     X1E10,x
   1DCB 20 51 1C      [ 6]  605         jsr     PROCBYTE
   1DCE BD 11 1E      [ 5]  606         lda     X1E11,x
   1DD1 20 51 1C      [ 6]  607         jsr     PROCBYTE
   1DD4 A5 67         [ 3]  608         lda     0x67
   1DD6 18            [ 2]  609         clc
   1DD7 69 03         [ 2]  610         adc     #0x03
   1DD9 85 67         [ 3]  611         sta     0x67
                            612 
                            613 
   1DDB                     614 L1DDB:
   1DDB 60            [ 6]  615         rts
                            616 
                            617 
   1DDC                     618 L1DDC:
   1DDC E6 68         [ 5]  619         inc     0x68
   1DDE A9 00         [ 2]  620         lda     #0x00
   1DE0 85 67         [ 3]  621         sta     0x67
   1DE2 4C DB 1D      [ 3]  622         jmp     L1DDB
                            623 
                            624 
   1DE5                     625 L1DE5:
   1DE5 BD F3 1E      [ 5]  626         lda     X1EF3,x
   1DE8 C9 FF         [ 2]  627         cmp     #0xFF
   1DEA D0 09         [ 4]  628         bne     L1DF5
   1DEC A9 00         [ 2]  629         lda     #0x00
   1DEE 85 67         [ 3]  630         sta     0x67
   1DF0 85 68         [ 3]  631         sta     0x68
   1DF2 4C DB 1D      [ 3]  632         jmp     L1DDB
                            633 
                            634 
   1DF5                     635 L1DF5:
   1DF5 C5 66         [ 3]  636         cmp     0x66
   1DF7 D0 E2         [ 4]  637         bne     L1DDB
   1DF9 BD F4 1E      [ 5]  638         lda     X1EF4,x
   1DFC 20 51 1C      [ 6]  639         jsr     PROCBYTE
   1DFF BD F5 1E      [ 5]  640         lda     X1EF5,x
   1E02 20 51 1C      [ 6]  641         jsr     PROCBYTE
   1E05 A5 67         [ 3]  642         lda     0x67
   1E07 18            [ 2]  643         clc
   1E08 69 03         [ 2]  644         adc     #0x03
   1E0A 85 67         [ 3]  645         sta     0x67
   1E0C 4C DB 1D      [ 3]  646         jmp     L1DDB
                            647 ;
                            648 ;       Table of pairs of bytes to process
                            649 ;
   1E0F                     650 X1E0F:
   1E0F EE                  651         .byte   0xEE
                            652 
   1E10                     653 X1E10:
   1E10 35                  654         .byte   0x35
                            655 
   1E11                     656 X1E11:
   1E11 46 EB 35 49 E9 35   657         .byte   0x46,0xEB,0x35,0x49,0xE9,0x35,0x4A,0xE9,0x33,0x42,0xE8,0x33,0x46,0xE7,0x32,0x46
        4A E9 33 42 E8 33
        46 E7 32 46
   1E21 E6 33 46 E5 32 46   658         .byte   0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3,0x32,0x46,0xE2,0x33,0x46,0xE1
        E4 33 46 E3 32 46
        E2 33 46 E1
   1E31 32 46 E0 33 46 DF   659         .byte   0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33,0x46,0xDD,0x32,0x46,0xDD,0x34
        32 46 DE 33 46 DD
        32 46 DD 34
   1E41 46 DC 33 46 DB 32   660         .byte   0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46,0xDA,0x33,0x46,0xD9,0x32,0x46
        46 DB 35 46 DA 33
        46 D9 32 46
   1E51 D1 32 42 C6 33 47   661         .byte   0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5,0x32,0x47,0xC3,0x34,0x46,0xC2
        C6 33 43 C5 32 47
        C3 34 46 C2
   1E61 33 47 C1 32 47 C0   662         .byte   0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34,0x46,0xB9,0x32,0x43,0xB7,0x35
        35 46 B9 34 46 B9
        32 43 B7 35
   1E71 46 B7 33 42 B3 33   663         .byte   0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46,0xA8,0x32,0x42,0x9D,0x33,0x47
        46 B2 32 46 A8 32
        42 9D 33 47
   1E81 9C 32 47 9B 33 47   664         .byte   0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A,0x34,0x46,0x99,0x33,0x47,0x99
        9A 32 47 9A 34 46
        99 33 47 99
   1E91 33 43 99 35 46 98   665         .byte   0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33,0x47,0x94,0x32,0x47,0x93,0x33
        32 47 97 33 47 94
        32 47 93 33
   1EA1 47 92 32 47 91 33   666         .byte   0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47,0x87,0x33,0x42,0x86,0x32,0x43
        47 90 32 47 87 33
        42 86 32 43
   1EB1 7D 33 46 7C 32 46   667         .byte   0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77,0x34,0x46,0x75,0x32,0x43,0x75
        77 32 42 77 34 46
        75 32 43 75
   1EC1 35 46 6A 33 46 69   668         .byte   0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33,0x46,0x66,0x32,0x46,0x66,0x32
        32 46 67 33 46 66
        32 46 66 32
   1ED1 43 65 34 46 62 35   669         .byte   0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42,0x56,0x33,0x46,0x55,0x32,0x46
        46 62 33 42 56 33
        46 55 32 46
   1EE1 55 32 42 54 33 46   670         .byte   0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52,0x33,0x46,0x51,0x32,0x46,0xFE
        53 32 46 52 33 46
        51 32 46 FE
   1EF1 FE FE               671         .byte   0xFE,0xFE
                            672 
   1EF3                     673 X1EF3:
   1EF3 50                  674         .byte   0x50
                            675 
   1EF4                     676 X1EF4:
   1EF4 33                  677         .byte   0x33
                            678 
   1EF5                     679 X1EF5:
   1EF5 46 4F 32 46 4E 33   680         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   1F05 4B 32 46 40 34 46   681         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   1F15 33 47 39 32 47 32   682         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   1F25 46 26 33 43 23 33   683         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   1F35 1B 33 47 1A 32 47   684         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   1F45 33 47 17 32 42 16   685         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   1F55 43 03 33 46 02 32   686         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
   1F65 FF FF FF FF FF FF   687         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F75 FF FF FF FF FF FF   688         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F85 FF FF FF FF FF FF   689         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F95 FF FF FF FF FF FF   690         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FA5 FF FF FF FF FF FF   691         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FB5 FF FF FF FF FF FF   692         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FC5 FF FF FF FF FF FF   693         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FD5 FF FF FF FF FF FF   694         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FE5 FF FF FF FF FF FF   695         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FF5 FF FF FF FF FF      696         .byte   0xFF,0xFF,0xFF,0xFF,0xFF
                            697 
   1FFA                     698         .org    0x1FFA
                            699         ;
                            700         ; vectors
                            701         ;
   1FFA                     702 NMIVEC:
   1FFA FF FF               703         .dw     0xFFFF
   1FFC                     704 RESETVEC:
   1FFC 00 1A               705         .dw     RESET
   1FFE                     706 IRQVEC:
   1FFE FF FF               707         .dw     0xFFFF
