                              1 ; converted with pydisass6502 by awsm of mayday!
                              2 ; modified for ASXXXX format by Frank Palazzolo
                              3 
                              4         .area   region1 (ABS)
                              5 
                              6         .include "../include/ptt6502.def"
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
                              7 
   1000                       8         .org    0x1000
                              9         
   1000 FF                   10         .byte   0xff                    ; Need this, or .s19 file wont start here
                             11 
   1A00                      12         .org    0x1A00
                             13 
   1A00                      14 L1A00:
   1A00 D8            [ 2]   15         cld
   1A01 78            [ 2]   16         sei
   1A02 A2 F0         [ 2]   17         ldx     #0xF0
   1A04 9A            [ 2]   18         txs
   1A05 A9 00         [ 2]   19         lda     #0x00
   1A07 A2 10         [ 2]   20         ldx     #0x10
                             21 
                             22 
   1A09                      23 L1A09:
   1A09 95 00         [ 4]   24         sta     0x00,x
   1A0B E8            [ 2]   25         inx
   1A0C E0 80         [ 2]   26         cpx     #0x80
   1A0E D0 F9         [ 4]   27         bne     L1A09
   1A10 A9 00         [ 2]   28         lda     #0x00
   1A12 8D 01 03      [ 4]   29         sta     transport_control_reg_a
   1A15 8D 00 03      [ 4]   30         sta     transport_periph$ddr_reg_a
   1A18 8D 81 03      [ 4]   31         sta     audio_control_reg_a
   1A1B 8D 80 03      [ 4]   32         sta     audio_periph$ddr_reg_a
   1A1E 8D 83 03      [ 4]   33         sta     audio_control_reg_b
   1A21 8D 05 02      [ 4]   34         sta     U18_edge_detect_control_DI_pos
   1A24 8D 03 03      [ 4]   35         sta     transport_control_reg_b
   1A27 8D 01 02      [ 4]   36         sta     U18_DDRA
   1A2A A9 02         [ 2]   37         lda     #0x02
   1A2C 8D 81 02      [ 4]   38         sta     U19_DDRA
   1A2F A9 FF         [ 2]   39         lda     #0xFF
   1A31 8D 82 03      [ 4]   40         sta     audio_periph$ddr_reg_b
   1A34 8D 03 02      [ 4]   41         sta     U18_DDRB
   1A37 8D 83 02      [ 4]   42         sta     U19_DDRB
   1A3A A9 FC         [ 2]   43         lda     #0xFC
   1A3C 8D 02 03      [ 4]   44         sta     transport_periph$ddr_reg_b
   1A3F A9 2E         [ 2]   45         lda     #0x2E
   1A41 8D 01 03      [ 4]   46         sta     transport_control_reg_a
   1A44 8D 03 03      [ 4]   47         sta     transport_control_reg_b
   1A47 A9 3C         [ 2]   48         lda     #0x3C
   1A49 8D 81 03      [ 4]   49         sta     audio_control_reg_a
   1A4C 8D 83 03      [ 4]   50         sta     audio_control_reg_b
   1A4F A9 64         [ 2]   51         lda     #0x64
   1A51 85 54         [ 3]   52         sta     0x54
   1A53 A9 18         [ 2]   53         lda     #0x18
   1A55 85 57         [ 3]   54         sta     0x57
   1A57 A9 64         [ 2]   55         lda     #0x64
   1A59 85 56         [ 3]   56         sta     0x56
   1A5B A9 0A         [ 2]   57         lda     #0x0A
   1A5D 85 64         [ 3]   58         sta     0x64
   1A5F A9 10         [ 2]   59         lda     #0x10
   1A61 20 97 1B      [ 6]   60         jsr     L1B97
   1A64 A9 28         [ 2]   61         lda     #0x28
   1A66 85 55         [ 3]   62         sta     0x55
   1A68 A9 64         [ 2]   63         lda     #0x64
   1A6A 85 54         [ 3]   64         sta     0x54
                             65 
                             66 
   1A6C                      67 L1A6C:
   1A6C 20 B7 1C      [ 6]   68         jsr     L1CB7
   1A6F A5 55         [ 3]   69         lda     0x55
   1A71 D0 F9         [ 4]   70         bne     L1A6C
   1A73 20 64 1B      [ 6]   71         jsr     L1B64
                             72 
                             73 
   1A76                      74 L1A76:
   1A76 A9 FA         [ 2]   75         lda     #0xFA
   1A78 85 66         [ 3]   76         sta     0x66
   1A7A A9 00         [ 2]   77         lda     #0x00
   1A7C 85 67         [ 3]   78         sta     0x67
   1A7E 85 68         [ 3]   79         sta     0x68
   1A80 A9 30         [ 2]   80         lda     #0x30
   1A82 A9 40         [ 2]   81         lda     #0x40
   1A84 20 97 1B      [ 6]   82         jsr     L1B97
                             83 
                             84 
   1A87                      85 L1A87:
   1A87 A9 00         [ 2]   86         lda     #0x00
   1A89 85 59         [ 3]   87         sta     0x59
                             88 
                             89 
   1A8B                      90 L1A8B:
   1A8B AD 02 03      [ 4]   91         lda     transport_periph$ddr_reg_b
   1A8E A9 0A         [ 2]   92         lda     #0x0A
   1A90 85 50         [ 3]   93         sta     0x50
   1A92 E6 59         [ 5]   94         inc     0x59
   1A94 A5 59         [ 3]   95         lda     0x59
   1A96 C9 64         [ 2]   96         cmp     #0x64
   1A98 B0 12         [ 4]   97         bcs     L1AAC
                             98 
                             99 
   1A9A                     100 L1A9A:
   1A9A 20 B7 1C      [ 6]  101         jsr     L1CB7
   1A9D 20 AB 1D      [ 6]  102         jsr     L1DAB
   1AA0 A5 50         [ 3]  103         lda     0x50
   1AA2 F0 E3         [ 4]  104         beq     L1A87
   1AA4 AD 03 03      [ 4]  105         lda     transport_control_reg_b
   1AA7 10 F1         [ 4]  106         bpl     L1A9A
   1AA9 4C 8B 1A      [ 3]  107         jmp     L1A8B
                            108 
                            109 
   1AAC                     110 L1AAC:
   1AAC A9 20         [ 2]  111         lda     #0x20
   1AAE 20 97 1B      [ 6]  112         jsr     L1B97
   1AB1 A9 19         [ 2]  113         lda     #0x19
   1AB3 85 55         [ 3]  114         sta     0x55
   1AB5 A9 64         [ 2]  115         lda     #0x64
   1AB7 85 54         [ 3]  116         sta     0x54
                            117 
                            118 
   1AB9                     119 L1AB9:
   1AB9 20 B7 1C      [ 6]  120         jsr     L1CB7
   1ABC 20 AB 1D      [ 6]  121         jsr     L1DAB
   1ABF A5 55         [ 3]  122         lda     0x55
   1AC1 D0 F6         [ 4]  123         bne     L1AB9
   1AC3 A9 00         [ 2]  124         lda     #0x00
   1AC5 85 5A         [ 3]  125         sta     0x5A
   1AC7 20 B5 1B      [ 6]  126         jsr     L1BB5
   1ACA A9 40         [ 2]  127         lda     #0x40
   1ACC 20 97 1B      [ 6]  128         jsr     L1B97
   1ACF 20 B5 1B      [ 6]  129         jsr     L1BB5
   1AD2 A9 FA         [ 2]  130         lda     #0xFA
   1AD4 85 50         [ 3]  131         sta     0x50
                            132 
                            133 
   1AD6                     134 L1AD6:
   1AD6 20 B7 1C      [ 6]  135         jsr     L1CB7
   1AD9 20 AB 1D      [ 6]  136         jsr     L1DAB
   1ADC A5 50         [ 3]  137         lda     0x50
   1ADE D0 F6         [ 4]  138         bne     L1AD6
   1AE0 A9 20         [ 2]  139         lda     #0x20
   1AE2 20 97 1B      [ 6]  140         jsr     L1B97
   1AE5 20 B5 1B      [ 6]  141         jsr     L1BB5
   1AE8 E6 5A         [ 5]  142         inc     0x5A
   1AEA A9 10         [ 2]  143         lda     #0x10
   1AEC 20 97 1B      [ 6]  144         jsr     L1B97
   1AEF A9 80         [ 2]  145         lda     #0x80
   1AF1 20 97 1B      [ 6]  146         jsr     L1B97
   1AF4 20 DB 1B      [ 6]  147         jsr     L1BDB
   1AF7 A9 10         [ 2]  148         lda     #0x10
   1AF9 20 97 1B      [ 6]  149         jsr     L1B97
   1AFC 20 64 1B      [ 6]  150         jsr     L1B64
                            151 
                            152 
   1AFF                     153 L1AFF:
   1AFF 20 B7 1C      [ 6]  154         jsr     L1CB7
   1B02 20 67 1D      [ 6]  155         jsr     L1D67
   1B05 20 AB 1D      [ 6]  156         jsr     L1DAB
   1B08 A5 5B         [ 3]  157         lda     0x5B
   1B0A D0 10         [ 4]  158         bne     L1B1C
   1B0C A9 02         [ 2]  159         lda     #0x02
   1B0E 8D 80 02      [ 4]  160         sta     U19_PORTA
   1B11 A9 00         [ 2]  161         lda     #0x00
   1B13 8D 02 02      [ 4]  162         sta     U18_PORTB
   1B16 A5 57         [ 3]  163         lda     0x57
   1B18 D0 E5         [ 4]  164         bne     L1AFF
   1B1A E6 5B         [ 5]  165         inc     0x5B
                            166 
                            167 
   1B1C                     168 L1B1C:
   1B1C 20 64 1B      [ 6]  169         jsr     L1B64
   1B1F A9 00         [ 2]  170         lda     #0x00
   1B21 8D 80 02      [ 4]  171         sta     U19_PORTA
   1B24 A9 80         [ 2]  172         lda     #0x80
   1B26 8D 02 02      [ 4]  173         sta     U18_PORTB
   1B29 A9 80         [ 2]  174         lda     #0x80
   1B2B 20 97 1B      [ 6]  175         jsr     L1B97
   1B2E 20 DB 1B      [ 6]  176         jsr     L1BDB
   1B31 C6 5B         [ 5]  177         dec     0x5B
   1B33 20 0A 1C      [ 6]  178         jsr     L1C0A
   1B36 20 64 1B      [ 6]  179         jsr     L1B64
   1B39 A9 18         [ 2]  180         lda     #0x18
   1B3B 85 57         [ 3]  181         sta     0x57
   1B3D A9 64         [ 2]  182         lda     #0x64
   1B3F 85 56         [ 3]  183         sta     0x56
   1B41 E6 5A         [ 5]  184         inc     0x5A
   1B43 A5 5A         [ 3]  185         lda     0x5A
   1B45 C9 1A         [ 2]  186         cmp     #0x1A
   1B47 90 03         [ 4]  187         bcc     L1B4C
   1B49 4C 76 1A      [ 3]  188         jmp     L1A76
                            189 
                            190 
   1B4C                     191 L1B4C:
   1B4C A9 00         [ 2]  192         lda     #0x00
   1B4E 85 67         [ 3]  193         sta     0x67
   1B50 85 68         [ 3]  194         sta     0x68
   1B52 A9 FA         [ 2]  195         lda     #0xFA
   1B54 85 66         [ 3]  196         sta     0x66
   1B56 20 DB 1B      [ 6]  197         jsr     L1BDB
   1B59 A9 10         [ 2]  198         lda     #0x10
   1B5B 20 97 1B      [ 6]  199         jsr     L1B97
   1B5E 20 1B 1D      [ 6]  200         jsr     L1D1B
   1B61 4C FF 1A      [ 3]  201         jmp     L1AFF
                            202 
                            203 
   1B64                     204 L1B64:
   1B64 A9 3C         [ 2]  205         lda     #0x3C
   1B66 8D 83 03      [ 4]  206         sta     audio_control_reg_b
   1B69 A9 34         [ 2]  207         lda     #0x34
   1B6B 8D 81 03      [ 4]  208         sta     audio_control_reg_a
   1B6E A2 00         [ 2]  209         ldx     #0x00
                            210 
                            211 
   1B70                     212 L1B70:
   1B70 A9 30         [ 2]  213         lda     #0x30
   1B72 95 81         [ 4]  214         sta     0x81,x
   1B74 95 83         [ 4]  215         sta     0x83,x
   1B76 A9 FF         [ 2]  216         lda     #0xFF
   1B78 95 80         [ 4]  217         sta     0x80,x
   1B7A 95 82         [ 4]  218         sta     0x82,x
   1B7C A9 34         [ 2]  219         lda     #0x34
   1B7E 95 81         [ 4]  220         sta     0x81,x
   1B80 95 83         [ 4]  221         sta     0x83,x
   1B82 A9 00         [ 2]  222         lda     #0x00
   1B84 95 80         [ 4]  223         sta     0x80,x
   1B86 95 82         [ 4]  224         sta     0x82,x
   1B88 E8            [ 2]  225         inx
   1B89 E8            [ 2]  226         inx
   1B8A E8            [ 2]  227         inx
   1B8B E8            [ 2]  228         inx
   1B8C E0 20         [ 2]  229         cpx     #0x20
   1B8E 90 E0         [ 4]  230         bcc     L1B70
   1B90 A9 00         [ 2]  231         lda     #0x00
   1B92 85 5F         [ 3]  232         sta     0x5F
   1B94 85 65         [ 3]  233         sta     0x65
   1B96 60            [ 6]  234         rts
                            235 
                            236 
   1B97                     237 L1B97:
   1B97 8D 02 03      [ 4]  238         sta     transport_periph$ddr_reg_b
   1B9A A9 FA         [ 2]  239         lda     #0xFA
   1B9C 85 50         [ 3]  240         sta     0x50
                            241 
                            242 
   1B9E                     243 L1B9E:
   1B9E 20 B7 1C      [ 6]  244         jsr     L1CB7
   1BA1 20 AB 1D      [ 6]  245         jsr     L1DAB
   1BA4 A5 50         [ 3]  246         lda     0x50
   1BA6 D0 F6         [ 4]  247         bne     L1B9E
   1BA8 AD 02 03      [ 4]  248         lda     transport_periph$ddr_reg_b
   1BAB 29 60         [ 2]  249         and     #0x60
   1BAD D0 05         [ 4]  250         bne     L1BB4
   1BAF A9 00         [ 2]  251         lda     #0x00
   1BB1 8D 02 03      [ 4]  252         sta     transport_periph$ddr_reg_b
                            253 
                            254 
   1BB4                     255 L1BB4:
   1BB4 60            [ 6]  256         rts
                            257 
                            258 
   1BB5                     259 L1BB5:
   1BB5 A9 00         [ 2]  260         lda     #0x00
   1BB7 85 59         [ 3]  261         sta     0x59
                            262 
                            263 
   1BB9                     264 L1BB9:
   1BB9 AD 02 03      [ 4]  265         lda     transport_periph$ddr_reg_b
   1BBC A9 0A         [ 2]  266         lda     #0x0A
   1BBE 85 50         [ 3]  267         sta     0x50
   1BC0 E6 59         [ 5]  268         inc     0x59
   1BC2 A5 59         [ 3]  269         lda     0x59
   1BC4 C9 21         [ 2]  270         cmp     #0x21
   1BC6 B0 12         [ 4]  271         bcs     L1BDA
                            272 
                            273 
   1BC8                     274 L1BC8:
   1BC8 20 B7 1C      [ 6]  275         jsr     L1CB7
   1BCB 20 AB 1D      [ 6]  276         jsr     L1DAB
   1BCE A5 50         [ 3]  277         lda     0x50
   1BD0 F0 E3         [ 4]  278         beq     L1BB5
   1BD2 AD 03 03      [ 4]  279         lda     transport_control_reg_b
   1BD5 10 F1         [ 4]  280         bpl     L1BC8
   1BD7 4C B9 1B      [ 3]  281         jmp     L1BB9
                            282 
                            283 
   1BDA                     284 L1BDA:
   1BDA 60            [ 6]  285         rts
                            286 
                            287 
   1BDB                     288 L1BDB:
   1BDB A9 FA         [ 2]  289         lda     #0xFA
   1BDD 85 50         [ 3]  290         sta     0x50
                            291 
                            292 
   1BDF                     293 L1BDF:
   1BDF 20 B7 1C      [ 6]  294         jsr     L1CB7
   1BE2 20 AB 1D      [ 6]  295         jsr     L1DAB
   1BE5 A5 50         [ 3]  296         lda     0x50
   1BE7 D0 F6         [ 4]  297         bne     L1BDF
                            298 
                            299 
   1BE9                     300 L1BE9:
   1BE9 20 B7 1C      [ 6]  301         jsr     L1CB7
   1BEC 20 AB 1D      [ 6]  302         jsr     L1DAB
   1BEF AD 02 03      [ 4]  303         lda     transport_periph$ddr_reg_b
   1BF2 6A            [ 2]  304         ror
   1BF3 90 F4         [ 4]  305         bcc     L1BE9
   1BF5 A9 A0         [ 2]  306         lda     #0xA0
   1BF7 85 50         [ 3]  307         sta     0x50
                            308 
                            309 
   1BF9                     310 L1BF9:
   1BF9 20 B7 1C      [ 6]  311         jsr     L1CB7
   1BFC 20 AB 1D      [ 6]  312         jsr     L1DAB
   1BFF AD 02 03      [ 4]  313         lda     transport_periph$ddr_reg_b
   1C02 6A            [ 2]  314         ror
   1C03 90 E4         [ 4]  315         bcc     L1BE9
   1C05 A5 50         [ 3]  316         lda     0x50
   1C07 D0 F0         [ 4]  317         bne     L1BF9
   1C09 60            [ 6]  318         rts
                            319 
                            320 
   1C0A                     321 L1C0A:
   1C0A AD 00 03      [ 4]  322         lda     transport_periph$ddr_reg_a
   1C0D A9 40         [ 2]  323         lda     #0x40
   1C0F 85 82         [ 3]  324         sta     0x82
   1C11 85 86         [ 3]  325         sta     0x86
   1C13 85 8A         [ 3]  326         sta     0x8A
   1C15 85 8E         [ 3]  327         sta     0x8E
   1C17 A9 3C         [ 2]  328         lda     #0x3C
   1C19 8D 81 03      [ 4]  329         sta     audio_control_reg_a
   1C1C A9 34         [ 2]  330         lda     #0x34
   1C1E 8D 83 03      [ 4]  331         sta     audio_control_reg_b
   1C21 A9 60         [ 2]  332         lda     #0x60
   1C23 85 82         [ 3]  333         sta     0x82
                            334 
                            335 
   1C25                     336 L1C25:
   1C25 AD 02 03      [ 4]  337         lda     transport_periph$ddr_reg_b
   1C28 4A            [ 2]  338         lsr
   1C29 90 11         [ 4]  339         bcc     L1C3C
   1C2B 20 67 1D      [ 6]  340         jsr     L1D67
   1C2E 20 B7 1C      [ 6]  341         jsr     L1CB7
   1C31 AD 01 03      [ 4]  342         lda     transport_control_reg_a
   1C34 10 EF         [ 4]  343         bpl     L1C25
   1C36 20 4E 1C      [ 6]  344         jsr     L1C4E
   1C39 4C 25 1C      [ 3]  345         jmp     L1C25
                            346 
                            347 
   1C3C                     348 L1C3C:
   1C3C A9 64         [ 2]  349         lda     #0x64
   1C3E 85 50         [ 3]  350         sta     0x50
                            351 
                            352 
   1C40                     353 L1C40:
   1C40 20 B7 1C      [ 6]  354         jsr     L1CB7
   1C43 AD 02 03      [ 4]  355         lda     transport_periph$ddr_reg_b
   1C46 4A            [ 2]  356         lsr
   1C47 B0 C1         [ 4]  357         bcs     L1C0A
   1C49 A5 50         [ 3]  358         lda     0x50
   1C4B D0 F3         [ 4]  359         bne     L1C40
   1C4D 60            [ 6]  360         rts
                            361 
                            362 
   1C4E                     363 L1C4E:
   1C4E AD 00 03      [ 4]  364         lda     transport_periph$ddr_reg_a
                            365 
                            366 
   1C51                     367 L1C51:
   1C51 29 7F         [ 2]  368         and     #0x7F
   1C53 85 5D         [ 3]  369         sta     0x5D
   1C55 29 7E         [ 2]  370         and     #0x7E
   1C57 C9 22         [ 2]  371         cmp     #0x22
   1C59 F0 3A         [ 4]  372         beq     L1C95
   1C5B C9 32         [ 2]  373         cmp     #0x32
   1C5D 90 4F         [ 4]  374         bcc     L1CAE
   1C5F C9 3A         [ 2]  375         cmp     #0x3A
   1C61 90 32         [ 4]  376         bcc     L1C95
   1C63 A5 5D         [ 3]  377         lda     0x5D
   1C65 C9 41         [ 2]  378         cmp     #0x41
   1C67 90 45         [ 4]  379         bcc     L1CAE
   1C69 C9 4F         [ 2]  380         cmp     #0x4F
   1C6B B0 41         [ 4]  381         bcs     L1CAE
   1C6D A6 65         [ 3]  382         ldx     0x65
   1C6F 38            [ 2]  383         sec
   1C70 E9 41         [ 2]  384         sbc     #0x41
   1C72 C9 08         [ 2]  385         cmp     #0x08
   1C74 90 02         [ 4]  386         bcc     L1C78
   1C76 E8            [ 2]  387         inx
   1C77 E8            [ 2]  388         inx
                            389 
                            390 
   1C78                     391 L1C78:
   1C78 29 07         [ 2]  392         and     #0x07
   1C7A A8            [ 2]  393         tay
   1C7B B9 AF 1C      [ 5]  394         lda     X1CAF,y
   1C7E 85 5E         [ 3]  395         sta     0x5E
   1C80 A5 5F         [ 3]  396         lda     0x5F
   1C82 4A            [ 2]  397         lsr
   1C83 B0 09         [ 4]  398         bcs     L1C8E
   1C85 A5 5E         [ 3]  399         lda     0x5E
   1C87 49 FF         [ 2]  400         eor     #0xFF
   1C89 35 00         [ 4]  401         and     0x00,x
   1C8B 95 00         [ 4]  402         sta     0x00,x
   1C8D 60            [ 6]  403         rts
                            404 
                            405 
   1C8E                     406 L1C8E:
   1C8E A5 5E         [ 3]  407         lda     0x5E
   1C90 15 00         [ 4]  408         ora     0x00,x
   1C92 95 00         [ 4]  409         sta     0x00,x
   1C94 60            [ 6]  410         rts
                            411 
                            412 
   1C95                     413 L1C95:
   1C95 A5 5D         [ 3]  414         lda     0x5D
   1C97 85 5F         [ 3]  415         sta     0x5F
   1C99 29 7E         [ 2]  416         and     #0x7E
   1C9B C9 22         [ 2]  417         cmp     #0x22
   1C9D D0 05         [ 4]  418         bne     L1CA4
   1C9F A9 98         [ 2]  419         lda     #0x98
   1CA1 85 65         [ 3]  420         sta     0x65
   1CA3 60            [ 6]  421         rts
                            422 
                            423 
   1CA4                     424 L1CA4:
   1CA4 38            [ 2]  425         sec
   1CA5 E9 32         [ 2]  426         sbc     #0x32
   1CA7 0A            [ 2]  427         asl
   1CA8 18            [ 2]  428         clc
   1CA9 69 80         [ 2]  429         adc     #0x80
   1CAB 85 65         [ 3]  430         sta     0x65
   1CAD 60            [ 6]  431         rts
                            432 
                            433 
   1CAE                     434 L1CAE:
   1CAE 60            [ 6]  435         rts
                            436 
                            437 
   1CAF                     438 X1CAF:
   1CAF 01 02 04 08 10 20   439         .byte   0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80
        40 80
                            440 
   1CB7                     441 L1CB7:
   1CB7 AD 05 02      [ 4]  442         lda     U18_edge_detect_control_DI_pos
   1CBA 85 60         [ 3]  443         sta     0x60
   1CBC F0 5C         [ 4]  444         beq     L1D1A
   1CBE A5 5C         [ 3]  445         lda     0x5C
   1CC0 30 0E         [ 4]  446         bmi     L1CD0
   1CC2 A5 60         [ 3]  447         lda     0x60
   1CC4 29 40         [ 2]  448         and     #0x40
   1CC6 F0 1A         [ 4]  449         beq     L1CE2
   1CC8 A9 80         [ 2]  450         lda     #0x80
   1CCA 85 5C         [ 3]  451         sta     0x5C
   1CCC A9 FA         [ 2]  452         lda     #0xFA
   1CCE 85 51         [ 3]  453         sta     0x51
                            454 
                            455 
   1CD0                     456 L1CD0:
   1CD0 A5 51         [ 3]  457         lda     0x51
   1CD2 D0 0A         [ 4]  458         bne     L1CDE
   1CD4 A9 00         [ 2]  459         lda     #0x00
   1CD6 85 5C         [ 3]  460         sta     0x5C
   1CD8 A5 5B         [ 3]  461         lda     0x5B
   1CDA D0 02         [ 4]  462         bne     L1CDE
   1CDC E6 5B         [ 5]  463         inc     0x5B
                            464 
                            465 
   1CDE                     466 L1CDE:
   1CDE A5 60         [ 3]  467         lda     0x60
   1CE0 10 38         [ 4]  468         bpl     L1D1A
                            469 
                            470 
   1CE2                     471 L1CE2:
   1CE2 AD 04 02      [ 4]  472         lda     U18_timer
   1CE5 49 FF         [ 2]  473         eor     #0xFF
   1CE7 4A            [ 2]  474         lsr
   1CE8 4A            [ 2]  475         lsr
   1CE9 4A            [ 2]  476         lsr
   1CEA 85 58         [ 3]  477         sta     0x58
   1CEC 90 02         [ 4]  478         bcc     L1CF0
   1CEE E6 58         [ 5]  479         inc     0x58
                            480 
                            481 
   1CF0                     482 L1CF0:
   1CF0 A9 7A         [ 2]  483         lda     #0x7A
   1CF2 38            [ 2]  484         sec
   1CF3 E5 58         [ 3]  485         sbc     0x58
   1CF5 8D 15 02      [ 4]  486         sta     U18_timer_8T_DI
   1CF8 C6 50         [ 5]  487         dec     0x50
   1CFA C6 51         [ 5]  488         dec     0x51
   1CFC C6 53         [ 5]  489         dec     0x53
   1CFE C6 54         [ 5]  490         dec     0x54
   1D00 D0 18         [ 4]  491         bne     L1D1A
   1D02 A9 64         [ 2]  492         lda     #0x64
   1D04 85 54         [ 3]  493         sta     0x54
   1D06 C6 55         [ 5]  494         dec     0x55
   1D08 C6 66         [ 5]  495         dec     0x66
   1D0A D0 04         [ 4]  496         bne     L1D10
   1D0C A9 FA         [ 2]  497         lda     #0xFA
   1D0E 85 66         [ 3]  498         sta     0x66
                            499 
                            500 
   1D10                     501 L1D10:
   1D10 C6 56         [ 5]  502         dec     0x56
   1D12 D0 06         [ 4]  503         bne     L1D1A
   1D14 A9 64         [ 2]  504         lda     #0x64
   1D16 85 56         [ 3]  505         sta     0x56
   1D18 C6 57         [ 5]  506         dec     0x57
                            507 
                            508 
   1D1A                     509 L1D1A:
   1D1A 60            [ 6]  510         rts
                            511 
                            512 
   1D1B                     513 L1D1B:
   1D1B A9 00         [ 2]  514         lda     #0x00
   1D1D 85 62         [ 3]  515         sta     0x62
   1D1F 85 63         [ 3]  516         sta     0x63
   1D21 A9 0A         [ 2]  517         lda     #0x0A
   1D23 85 55         [ 3]  518         sta     0x55
   1D25 A9 64         [ 2]  519         lda     #0x64
   1D27 85 54         [ 3]  520         sta     0x54
                            521 
                            522 
   1D29                     523 L1D29:
   1D29 20 B7 1C      [ 6]  524         jsr     L1CB7
   1D2C 20 AB 1D      [ 6]  525         jsr     L1DAB
   1D2F A5 55         [ 3]  526         lda     0x55
   1D31 D0 F6         [ 4]  527         bne     L1D29
   1D33 A9 0A         [ 2]  528         lda     #0x0A
   1D35 85 55         [ 3]  529         sta     0x55
   1D37 A9 64         [ 2]  530         lda     #0x64
   1D39 85 54         [ 3]  531         sta     0x54
   1D3B A5 63         [ 3]  532         lda     0x63
   1D3D C9 08         [ 2]  533         cmp     #0x08
   1D3F F0 15         [ 4]  534         beq     L1D56
   1D41 E6 63         [ 5]  535         inc     0x63
   1D43 A2 09         [ 2]  536         ldx     #0x09
   1D45 38            [ 2]  537         sec
   1D46 AD 80 03      [ 4]  538         lda     audio_periph$ddr_reg_a
                            539 
                            540 
   1D49                     541 L1D49:
   1D49 2A            [ 2]  542         rol
   1D4A CA            [ 2]  543         dex
   1D4B 90 FC         [ 4]  544         bcc     L1D49
   1D4D 18            [ 2]  545         clc
   1D4E 8A            [ 2]  546         txa
   1D4F 65 62         [ 3]  547         adc     0x62
   1D51 85 62         [ 3]  548         sta     0x62
   1D53 4C 29 1D      [ 3]  549         jmp     L1D29
                            550 
                            551 
   1D56                     552 L1D56:
   1D56 46 62         [ 5]  553         lsr     0x62
   1D58 46 62         [ 5]  554         lsr     0x62
   1D5A 46 62         [ 5]  555         lsr     0x62
   1D5C A5 62         [ 3]  556         lda     0x62
   1D5E 85 61         [ 3]  557         sta     0x61
   1D60 A9 00         [ 2]  558         lda     #0x00
   1D62 85 62         [ 3]  559         sta     0x62
   1D64 85 63         [ 3]  560         sta     0x63
   1D66 60            [ 6]  561         rts
                            562 
                            563 
   1D67                     564 L1D67:
   1D67 AD 80 02      [ 4]  565         lda     U19_PORTA
   1D6A 49 FF         [ 2]  566         eor     #0xFF
   1D6C 4A            [ 2]  567         lsr
   1D6D 4A            [ 2]  568         lsr
   1D6E 4A            [ 2]  569         lsr
   1D6F 4A            [ 2]  570         lsr
   1D70 18            [ 2]  571         clc
   1D71 65 61         [ 3]  572         adc     0x61
   1D73 AA            [ 2]  573         tax
   1D74 BD 9A 1D      [ 5]  574         lda     AGCTABLE,x
   1D77 85 64         [ 3]  575         sta     0x64
   1D79 A5 53         [ 3]  576         lda     0x53
   1D7B D0 16         [ 4]  577         bne     L1D93
   1D7D A9 0A         [ 2]  578         lda     #0x0A
   1D7F 85 53         [ 3]  579         sta     0x53
   1D81 A5 64         [ 3]  580         lda     0x64
   1D83 CD 82 03      [ 4]  581         cmp     audio_periph$ddr_reg_b
   1D86 90 08         [ 4]  582         bcc     L1D90
   1D88 F0 09         [ 4]  583         beq     L1D93
   1D8A EE 82 03      [ 6]  584         inc     audio_periph$ddr_reg_b
   1D8D 4C 93 1D      [ 3]  585         jmp     L1D93
                            586 
                            587 
   1D90                     588 L1D90:
   1D90 CE 82 03      [ 6]  589         dec     audio_periph$ddr_reg_b
                            590 
                            591 
   1D93                     592 L1D93:
   1D93 AD 82 03      [ 4]  593         lda     audio_periph$ddr_reg_b
   1D96 8D 82 02      [ 4]  594         sta     U19_PORTB
   1D99 60            [ 6]  595         rts
                            596 
                            597 ;
                            598 ;       AGC table
                            599 ;
   1D9A                     600 AGCTABLE:
   1D9A 03 04 06 08         601         .db     0x03, 0x04, 0x06, 0x08
   1D9E 10 16 20 2D         602         .db     0x10, 0x16, 0x20, 0x2D
   1DA2 40 5A 80 BF         603         .db     0x40, 0x5A, 0x80, 0xBF
   1DA6 FF FF FF FF         604         .db     0xFF, 0xFF, 0xFF, 0xFF
   1DAA FF                  605         .db     0xFF
                            606 
   1DAB                     607 L1DAB:
   1DAB A5 67         [ 3]  608         lda     0x67
   1DAD AA            [ 2]  609         tax
   1DAE A5 68         [ 3]  610         lda     0x68
   1DB0 D0 33         [ 4]  611         bne     L1DE5
   1DB2 BD 0F 1E      [ 5]  612         lda     X1E0F,x
   1DB5 C9 FE         [ 2]  613         cmp     #0xFE
   1DB7 F0 23         [ 4]  614         beq     L1DDC
   1DB9 C9 FF         [ 2]  615         cmp     #0xFF
   1DBB D0 07         [ 4]  616         bne     L1DC4
   1DBD A9 00         [ 2]  617         lda     #0x00
   1DBF 85 67         [ 3]  618         sta     0x67
   1DC1 4C DB 1D      [ 3]  619         jmp     L1DDB
                            620 
                            621 
   1DC4                     622 L1DC4:
   1DC4 C5 66         [ 3]  623         cmp     0x66
   1DC6 D0 13         [ 4]  624         bne     L1DDB
   1DC8 BD 10 1E      [ 5]  625         lda     X1E10,x
   1DCB 20 51 1C      [ 6]  626         jsr     L1C51
   1DCE BD 11 1E      [ 5]  627         lda     X1E11,x
   1DD1 20 51 1C      [ 6]  628         jsr     L1C51
   1DD4 A5 67         [ 3]  629         lda     0x67
   1DD6 18            [ 2]  630         clc
   1DD7 69 03         [ 2]  631         adc     #0x03
   1DD9 85 67         [ 3]  632         sta     0x67
                            633 
                            634 
   1DDB                     635 L1DDB:
   1DDB 60            [ 6]  636         rts
                            637 
                            638 
   1DDC                     639 L1DDC:
   1DDC E6 68         [ 5]  640         inc     0x68
   1DDE A9 00         [ 2]  641         lda     #0x00
   1DE0 85 67         [ 3]  642         sta     0x67
   1DE2 4C DB 1D      [ 3]  643         jmp     L1DDB
                            644 
                            645 
   1DE5                     646 L1DE5:
   1DE5 BD F3 1E      [ 5]  647         lda     X1EF3,x
   1DE8 C9 FF         [ 2]  648         cmp     #0xFF
   1DEA D0 09         [ 4]  649         bne     L1DF5
   1DEC A9 00         [ 2]  650         lda     #0x00
   1DEE 85 67         [ 3]  651         sta     0x67
   1DF0 85 68         [ 3]  652         sta     0x68
   1DF2 4C DB 1D      [ 3]  653         jmp     L1DDB
                            654 
                            655 
   1DF5                     656 L1DF5:
   1DF5 C5 66         [ 3]  657         cmp     0x66
   1DF7 D0 E2         [ 4]  658         bne     L1DDB
   1DF9 BD F4 1E      [ 5]  659         lda     X1EF4,x
   1DFC 20 51 1C      [ 6]  660         jsr     L1C51
   1DFF BD F5 1E      [ 5]  661         lda     X1EF5,x
   1E02 20 51 1C      [ 6]  662         jsr     L1C51
   1E05 A5 67         [ 3]  663         lda     0x67
   1E07 18            [ 2]  664         clc
   1E08 69 03         [ 2]  665         adc     #0x03
   1E0A 85 67         [ 3]  666         sta     0x67
   1E0C 4C DB 1D      [ 3]  667         jmp     L1DDB
                            668 
   1E0F                     669 X1E0F:
   1E0F EE                  670         .byte   0xEE
                            671 
   1E10                     672 X1E10:
   1E10 35                  673         .byte   0x35
                            674 
   1E11                     675 X1E11:
   1E11 46 EB 35 49 E9 35   676         .byte   0x46,0xEB,0x35,0x49,0xE9,0x35,0x4A,0xE9,0x33,0x42,0xE8,0x33,0x46,0xE7,0x32,0x46
        4A E9 33 42 E8 33
        46 E7 32 46
   1E21 E6 33 46 E5 32 46   677         .byte   0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3,0x32,0x46,0xE2,0x33,0x46,0xE1
        E4 33 46 E3 32 46
        E2 33 46 E1
   1E31 32 46 E0 33 46 DF   678         .byte   0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33,0x46,0xDD,0x32,0x46,0xDD,0x34
        32 46 DE 33 46 DD
        32 46 DD 34
   1E41 46 DC 33 46 DB 32   679         .byte   0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46,0xDA,0x33,0x46,0xD9,0x32,0x46
        46 DB 35 46 DA 33
        46 D9 32 46
   1E51 D1 32 42 C6 33 47   680         .byte   0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5,0x32,0x47,0xC3,0x34,0x46,0xC2
        C6 33 43 C5 32 47
        C3 34 46 C2
   1E61 33 47 C1 32 47 C0   681         .byte   0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34,0x46,0xB9,0x32,0x43,0xB7,0x35
        35 46 B9 34 46 B9
        32 43 B7 35
   1E71 46 B7 33 42 B3 33   682         .byte   0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46,0xA8,0x32,0x42,0x9D,0x33,0x47
        46 B2 32 46 A8 32
        42 9D 33 47
   1E81 9C 32 47 9B 33 47   683         .byte   0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A,0x34,0x46,0x99,0x33,0x47,0x99
        9A 32 47 9A 34 46
        99 33 47 99
   1E91 33 43 99 35 46 98   684         .byte   0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33,0x47,0x94,0x32,0x47,0x93,0x33
        32 47 97 33 47 94
        32 47 93 33
   1EA1 47 92 32 47 91 33   685         .byte   0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47,0x87,0x33,0x42,0x86,0x32,0x43
        47 90 32 47 87 33
        42 86 32 43
   1EB1 7D 33 46 7C 32 46   686         .byte   0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77,0x34,0x46,0x75,0x32,0x43,0x75
        77 32 42 77 34 46
        75 32 43 75
   1EC1 35 46 6A 33 46 69   687         .byte   0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33,0x46,0x66,0x32,0x46,0x66,0x32
        32 46 67 33 46 66
        32 46 66 32
   1ED1 43 65 34 46 62 35   688         .byte   0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42,0x56,0x33,0x46,0x55,0x32,0x46
        46 62 33 42 56 33
        46 55 32 46
   1EE1 55 32 42 54 33 46   689         .byte   0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52,0x33,0x46,0x51,0x32,0x46,0xFE
        53 32 46 52 33 46
        51 32 46 FE
   1EF1 FE FE               690         .byte   0xFE,0xFE
                            691 
   1EF3                     692 X1EF3:
   1EF3 50                  693         .byte   0x50
                            694 
   1EF4                     695 X1EF4:
   1EF4 33                  696         .byte   0x33
                            697 
   1EF5                     698 X1EF5:
   1EF5 46 4F 32 46 4E 33   699         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   1F05 4B 32 46 40 34 46   700         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   1F15 33 47 39 32 47 32   701         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   1F25 46 26 33 43 23 33   702         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   1F35 1B 33 47 1A 32 47   703         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   1F45 33 47 17 32 42 16   704         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   1F55 43 03 33 46 02 32   705         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
   1F65 FF FF FF FF FF FF   706         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F75 FF FF FF FF FF FF   707         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F85 FF FF FF FF FF FF   708         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F95 FF FF FF FF FF FF   709         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FA5 FF FF FF FF FF FF   710         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FB5 FF FF FF FF FF FF   711         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FC5 FF FF FF FF FF FF   712         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FD5 FF FF FF FF FF FF   713         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FE5 FF FF FF FF FF FF   714         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FF5 FF FF FF FF FF      715         .byte   0xFF,0xFF,0xFF,0xFF,0xFF
                            716 
   1FFA                     717         .org    0x1FFA
                            718         ;
                            719         ; vectors
                            720         ;
   1FFA                     721 NMIVEC:
   1FFA FF FF               722         .dw     0xFFFF
   1FFC                     723 RESETVEC:
   1FFC 00 1A               724         .dw     L1A00
   1FFE                     725 IRQVEC:
   1FFE FF FF               726         .dw     0xFFFF
