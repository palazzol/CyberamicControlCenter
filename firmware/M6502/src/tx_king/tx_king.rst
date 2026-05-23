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
   1A09 95 00         [ 4]   21         sta     RAM_start,x
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
   1A5F A9 10         [ 2]   56         lda     #TAPEMODE_STOP
   1A61 20 97 1B      [ 6]   57         jsr     TAPECMD
   1A64 A9 28         [ 2]   58         lda     #0x28
   1A66 85 55         [ 3]   59         sta     0x55
   1A68 A9 64         [ 2]   60         lda     #0x64
   1A6A 85 54         [ 3]   61         sta     0x54
   1A6C                      62 $1:
   1A6C 20 B7 1C      [ 6]   63         jsr     TUPDATE
   1A6F A5 55         [ 3]   64         lda     0x55
   1A71 D0 F9         [ 4]   65         bne     $1
   1A73 20 64 1B      [ 6]   66         jsr     INITBRDS
   1A76                      67 REWIND:
   1A76 A9 FA         [ 2]   68         lda     #0xFA
   1A78 85 66         [ 3]   69         sta     0x66
   1A7A A9 00         [ 2]   70         lda     #0x00
   1A7C 85 67         [ 3]   71         sta     0x67
   1A7E 85 68         [ 3]   72         sta     0x68
   1A80 A9 30         [ 2]   73         lda     #0x30
   1A82 A9 40         [ 2]   74         lda     #TAPEMODE_REWIND
   1A84 20 97 1B      [ 6]   75         jsr     TAPECMD
                             76 
                             77 
   1A87                      78 L1A87:
   1A87 A9 00         [ 2]   79         lda     #0x00
   1A89 85 59         [ 3]   80         sta     0x59
                             81 
                             82 
   1A8B                      83 L1A8B:
   1A8B AD 02 03      [ 4]   84         lda     transport_periph$ddr_reg_b
   1A8E A9 0A         [ 2]   85         lda     #0x0A
   1A90 85 50         [ 3]   86         sta     0x50
   1A92 E6 59         [ 5]   87         inc     0x59
   1A94 A5 59         [ 3]   88         lda     0x59
   1A96 C9 64         [ 2]   89         cmp     #0x64
   1A98 B0 12         [ 4]   90         bcs     FINDTRK
                             91 
                             92 
   1A9A                      93 L1A9A:
   1A9A 20 B7 1C      [ 6]   94         jsr     TUPDATE
   1A9D 20 AB 1D      [ 6]   95         jsr     L1DAB
   1AA0 A5 50         [ 3]   96         lda     0x50
   1AA2 F0 E3         [ 4]   97         beq     L1A87
   1AA4 AD 03 03      [ 4]   98         lda     transport_control_reg_b
   1AA7 10 F1         [ 4]   99         bpl     L1A9A
   1AA9 4C 8B 1A      [ 3]  100         jmp     L1A8B
                            101 
                            102 
   1AAC                     103 FINDTRK:
   1AAC A9 20         [ 2]  104         lda     #TAPEMODE_FFWD
   1AAE 20 97 1B      [ 6]  105         jsr     TAPECMD
   1AB1 A9 19         [ 2]  106         lda     #0x19
   1AB3 85 55         [ 3]  107         sta     0x55
   1AB5 A9 64         [ 2]  108         lda     #0x64
   1AB7 85 54         [ 3]  109         sta     0x54
                            110 
                            111 
   1AB9                     112 L1AB9:
   1AB9 20 B7 1C      [ 6]  113         jsr     TUPDATE
   1ABC 20 AB 1D      [ 6]  114         jsr     L1DAB
   1ABF A5 55         [ 3]  115         lda     0x55
   1AC1 D0 F6         [ 4]  116         bne     L1AB9
   1AC3 A9 00         [ 2]  117         lda     #0x00
   1AC5 85 5A         [ 3]  118         sta     0x5A
   1AC7 20 B5 1B      [ 6]  119         jsr     WAITTONE
   1ACA A9 40         [ 2]  120         lda     #TAPEMODE_REWIND
   1ACC 20 97 1B      [ 6]  121         jsr     TAPECMD
   1ACF 20 B5 1B      [ 6]  122         jsr     WAITTONE
   1AD2 A9 FA         [ 2]  123         lda     #0xFA
   1AD4 85 50         [ 3]  124         sta     0x50
                            125 
                            126 
   1AD6                     127 L1AD6:
   1AD6 20 B7 1C      [ 6]  128         jsr     TUPDATE
   1AD9 20 AB 1D      [ 6]  129         jsr     L1DAB
   1ADC A5 50         [ 3]  130         lda     0x50
   1ADE D0 F6         [ 4]  131         bne     L1AD6
   1AE0 A9 20         [ 2]  132         lda     #TAPEMODE_FFWD
   1AE2 20 97 1B      [ 6]  133         jsr     TAPECMD
   1AE5 20 B5 1B      [ 6]  134         jsr     WAITTONE
   1AE8 E6 5A         [ 5]  135         inc     0x5A
   1AEA A9 10         [ 2]  136         lda     #TAPEMODE_STOP
   1AEC 20 97 1B      [ 6]  137         jsr     TAPECMD
   1AEF A9 80         [ 2]  138         lda     #TAPEMODE_PLAY
   1AF1 20 97 1B      [ 6]  139         jsr     TAPECMD
   1AF4 20 DB 1B      [ 6]  140         jsr     WAITCD
   1AF7 A9 10         [ 2]  141         lda     #TAPEMODE_STOP
   1AF9 20 97 1B      [ 6]  142         jsr     TAPECMD
   1AFC 20 64 1B      [ 6]  143         jsr     INITBRDS
                            144 
                            145 
   1AFF                     146 WAITPLAY:
   1AFF 20 B7 1C      [ 6]  147         jsr     TUPDATE
   1B02 20 67 1D      [ 6]  148         jsr     AGCUPD
   1B05 20 AB 1D      [ 6]  149         jsr     L1DAB
   1B08 A5 5B         [ 3]  150         lda     0x5B
   1B0A D0 10         [ 4]  151         bne     STARTPLAY
   1B0C A9 02         [ 2]  152         lda     #0x02
   1B0E 8D 80 02      [ 4]  153         sta     U19_PORTA
   1B11 A9 00         [ 2]  154         lda     #0x00
   1B13 8D 02 02      [ 4]  155         sta     U18_PORTB
   1B16 A5 57         [ 3]  156         lda     0x57
   1B18 D0 E5         [ 4]  157         bne     WAITPLAY
   1B1A E6 5B         [ 5]  158         inc     0x5B
                            159 
                            160 
   1B1C                     161 STARTPLAY:
   1B1C 20 64 1B      [ 6]  162         jsr     INITBRDS
   1B1F A9 00         [ 2]  163         lda     #0x00
   1B21 8D 80 02      [ 4]  164         sta     U19_PORTA
   1B24 A9 80         [ 2]  165         lda     #0x80
   1B26 8D 02 02      [ 4]  166         sta     U18_PORTB
   1B29 A9 80         [ 2]  167         lda     #TAPEMODE_PLAY
   1B2B 20 97 1B      [ 6]  168         jsr     TAPECMD
   1B2E 20 DB 1B      [ 6]  169         jsr     WAITCD
   1B31 C6 5B         [ 5]  170         dec     0x5B
   1B33 20 0A 1C      [ 6]  171         jsr     PLAYTRK
   1B36 20 64 1B      [ 6]  172         jsr     INITBRDS
   1B39 A9 18         [ 2]  173         lda     #0x18
   1B3B 85 57         [ 3]  174         sta     0x57
   1B3D A9 64         [ 2]  175         lda     #0x64
   1B3F 85 56         [ 3]  176         sta     0x56
   1B41 E6 5A         [ 5]  177         inc     0x5A
   1B43 A5 5A         [ 3]  178         lda     0x5A
   1B45 C9 1A         [ 2]  179         cmp     #0x1A
   1B47 90 03         [ 4]  180         bcc     NEXTTRK
   1B49 4C 76 1A      [ 3]  181         jmp     REWIND
                            182 
                            183 
   1B4C                     184 NEXTTRK:
   1B4C A9 00         [ 2]  185         lda     #0x00
   1B4E 85 67         [ 3]  186         sta     0x67
   1B50 85 68         [ 3]  187         sta     0x68
   1B52 A9 FA         [ 2]  188         lda     #0xFA
   1B54 85 66         [ 3]  189         sta     0x66
   1B56 20 DB 1B      [ 6]  190         jsr     WAITCD
   1B59 A9 10         [ 2]  191         lda     #TAPEMODE_STOP
   1B5B 20 97 1B      [ 6]  192         jsr     TAPECMD
   1B5E 20 1B 1D      [ 6]  193         jsr     AGCMICRD
   1B61 4C FF 1A      [ 3]  194         jmp     WAITPLAY
                            195 ;
                            196 ;       Init boards
                            197 ;
   1B64                     198 INITBRDS:
   1B64 A9 3C         [ 2]  199         lda     #0x3C
   1B66 8D 83 03      [ 4]  200         sta     audio_control_reg_b
   1B69 A9 34         [ 2]  201         lda     #0x34
   1B6B 8D 81 03      [ 4]  202         sta     audio_control_reg_a
   1B6E A2 00         [ 2]  203         ldx     #0x00
   1B70                     204 NEXTBRD:
   1B70 A9 30         [ 2]  205         lda     #0x30
   1B72 95 81         [ 4]  206         sta     0x81,x
   1B74 95 83         [ 4]  207         sta     0x83,x
   1B76 A9 FF         [ 2]  208         lda     #0xFF
   1B78 95 80         [ 4]  209         sta     0x80,x
   1B7A 95 82         [ 4]  210         sta     0x82,x
   1B7C A9 34         [ 2]  211         lda     #0x34
   1B7E 95 81         [ 4]  212         sta     0x81,x
   1B80 95 83         [ 4]  213         sta     0x83,x
   1B82 A9 00         [ 2]  214         lda     #0x00
   1B84 95 80         [ 4]  215         sta     0x80,x
   1B86 95 82         [ 4]  216         sta     0x82,x
   1B88 E8            [ 2]  217         inx
   1B89 E8            [ 2]  218         inx
   1B8A E8            [ 2]  219         inx
   1B8B E8            [ 2]  220         inx
   1B8C E0 20         [ 2]  221         cpx     #0x20
   1B8E 90 E0         [ 4]  222         bcc     NEXTBRD
                            223 
   1B90 A9 00         [ 2]  224         lda     #0x00
   1B92 85 5F         [ 3]  225         sta     0x5F
   1B94 85 65         [ 3]  226         sta     0x65
   1B96 60            [ 6]  227         rts
                            228 
                            229 
   1B97                     230 TAPECMD:
   1B97 8D 02 03      [ 4]  231         sta     transport_periph$ddr_reg_b
   1B9A A9 FA         [ 2]  232         lda     #0xFA
   1B9C 85 50         [ 3]  233         sta     0x50
                            234 
                            235 
   1B9E                     236 L1B9E:
   1B9E 20 B7 1C      [ 6]  237         jsr     TUPDATE
   1BA1 20 AB 1D      [ 6]  238         jsr     L1DAB
   1BA4 A5 50         [ 3]  239         lda     0x50
   1BA6 D0 F6         [ 4]  240         bne     L1B9E
   1BA8 AD 02 03      [ 4]  241         lda     transport_periph$ddr_reg_b
   1BAB 29 60         [ 2]  242         and     #0x60
   1BAD D0 05         [ 4]  243         bne     L1BB4
   1BAF A9 00         [ 2]  244         lda     #0x00
   1BB1 8D 02 03      [ 4]  245         sta     transport_periph$ddr_reg_b
                            246 
                            247 
   1BB4                     248 L1BB4:
   1BB4 60            [ 6]  249         rts
                            250 
                            251 
   1BB5                     252 WAITTONE:
   1BB5 A9 00         [ 2]  253         lda     #0x00
   1BB7 85 59         [ 3]  254         sta     0x59
   1BB9                     255 L1BB9:
   1BB9 AD 02 03      [ 4]  256         lda     transport_periph$ddr_reg_b
   1BBC A9 0A         [ 2]  257         lda     #0x0A
   1BBE 85 50         [ 3]  258         sta     0x50
   1BC0 E6 59         [ 5]  259         inc     0x59
   1BC2 A5 59         [ 3]  260         lda     0x59
   1BC4 C9 21         [ 2]  261         cmp     #0x21
   1BC6 B0 12         [ 4]  262         bcs     L1BDA
   1BC8                     263 L1BC8:
   1BC8 20 B7 1C      [ 6]  264         jsr     TUPDATE
   1BCB 20 AB 1D      [ 6]  265         jsr     L1DAB
   1BCE A5 50         [ 3]  266         lda     0x50
   1BD0 F0 E3         [ 4]  267         beq     WAITTONE
   1BD2 AD 03 03      [ 4]  268         lda     transport_control_reg_b
   1BD5 10 F1         [ 4]  269         bpl     L1BC8
   1BD7 4C B9 1B      [ 3]  270         jmp     L1BB9
   1BDA                     271 L1BDA:
   1BDA 60            [ 6]  272         rts
                            273 
                            274 
   1BDB                     275 WAITCD:
   1BDB A9 FA         [ 2]  276         lda     #0xFA
   1BDD 85 50         [ 3]  277         sta     0x50
   1BDF                     278 L1BDF:
   1BDF 20 B7 1C      [ 6]  279         jsr     TUPDATE
   1BE2 20 AB 1D      [ 6]  280         jsr     L1DAB
   1BE5 A5 50         [ 3]  281         lda     0x50
   1BE7 D0 F6         [ 4]  282         bne     L1BDF
                            283 
                            284 
   1BE9                     285 L1BE9:
   1BE9 20 B7 1C      [ 6]  286         jsr     TUPDATE
   1BEC 20 AB 1D      [ 6]  287         jsr     L1DAB
   1BEF AD 02 03      [ 4]  288         lda     transport_periph$ddr_reg_b
   1BF2 6A            [ 2]  289         ror
   1BF3 90 F4         [ 4]  290         bcc     L1BE9
   1BF5 A9 A0         [ 2]  291         lda     #0xA0
   1BF7 85 50         [ 3]  292         sta     0x50
   1BF9                     293 L1BF9:
   1BF9 20 B7 1C      [ 6]  294         jsr     TUPDATE
   1BFC 20 AB 1D      [ 6]  295         jsr     L1DAB
   1BFF AD 02 03      [ 4]  296         lda     transport_periph$ddr_reg_b
   1C02 6A            [ 2]  297         ror
   1C03 90 E4         [ 4]  298         bcc     L1BE9
   1C05 A5 50         [ 3]  299         lda     0x50
   1C07 D0 F0         [ 4]  300         bne     L1BF9
   1C09 60            [ 6]  301         rts
                            302 
                            303 
   1C0A                     304 PLAYTRK:
   1C0A AD 00 03      [ 4]  305         lda     transport_periph$ddr_reg_a
   1C0D A9 40         [ 2]  306         lda     #0x40
   1C0F 85 82         [ 3]  307         sta     0x82
   1C11 85 86         [ 3]  308         sta     0x86
   1C13 85 8A         [ 3]  309         sta     0x8A
   1C15 85 8E         [ 3]  310         sta     0x8E
   1C17 A9 3C         [ 2]  311         lda     #0x3C
   1C19 8D 81 03      [ 4]  312         sta     audio_control_reg_a
   1C1C A9 34         [ 2]  313         lda     #0x34
   1C1E 8D 83 03      [ 4]  314         sta     audio_control_reg_b
   1C21 A9 60         [ 2]  315         lda     #0x60
   1C23 85 82         [ 3]  316         sta     0x82
   1C25                     317 L1C25:
   1C25 AD 02 03      [ 4]  318         lda     transport_periph$ddr_reg_b
   1C28 4A            [ 2]  319         lsr
   1C29 90 11         [ 4]  320         bcc     LOSTCD
   1C2B 20 67 1D      [ 6]  321         jsr     AGCUPD
   1C2E 20 B7 1C      [ 6]  322         jsr     TUPDATE
   1C31 AD 01 03      [ 4]  323         lda     transport_control_reg_a
   1C34 10 EF         [ 4]  324         bpl     L1C25
   1C36 20 4E 1C      [ 6]  325         jsr     PROTOHAND
   1C39 4C 25 1C      [ 3]  326         jmp     L1C25
                            327 
                            328 
   1C3C                     329 LOSTCD:
   1C3C A9 64         [ 2]  330         lda     #0x64
   1C3E 85 50         [ 3]  331         sta     0x50
   1C40                     332 L1C40:
   1C40 20 B7 1C      [ 6]  333         jsr     TUPDATE
   1C43 AD 02 03      [ 4]  334         lda     transport_periph$ddr_reg_b
   1C46 4A            [ 2]  335         lsr
   1C47 B0 C1         [ 4]  336         bcs     PLAYTRK
   1C49 A5 50         [ 3]  337         lda     0x50
   1C4B D0 F3         [ 4]  338         bne     L1C40
   1C4D 60            [ 6]  339         rts
                            340 ;
                            341 ; Protocol handler
                            342 ;
   1C4E                     343 PROTOHAND:
   1C4E AD 00 03      [ 4]  344         lda     transport_periph$ddr_reg_a
   1C51                     345 PROCBYTE:
   1C51 29 7F         [ 2]  346         and     #0x7F
   1C53 85 5D         [ 3]  347         sta     0x5D
   1C55 29 7E         [ 2]  348         and     #0x7E
   1C57 C9 22         [ 2]  349         cmp     #0x22
   1C59 F0 3A         [ 4]  350         beq     PROCCHNL
   1C5B C9 32         [ 2]  351         cmp     #0x32
   1C5D 90 4F         [ 4]  352         bcc     $18
   1C5F C9 3A         [ 2]  353         cmp     #0x3A
   1C61 90 32         [ 4]  354         bcc     PROCCHNL
   1C63 A5 5D         [ 3]  355         lda     0x5D
   1C65 C9 41         [ 2]  356         cmp     #0x41
   1C67 90 45         [ 4]  357         bcc     $18
   1C69 C9 4F         [ 2]  358         cmp     #0x4F                           ; is it >= 0x4F?
   1C6B B0 41         [ 4]  359         bcs     $18
   1C6D A6 65         [ 3]  360         ldx     0x65
   1C6F 38            [ 2]  361         sec                                     ; (it's 0x41 to 0x4E)
   1C70 E9 41         [ 2]  362         sbc     #0x41
   1C72 C9 08         [ 2]  363         cmp     #0x08
   1C74 90 02         [ 4]  364         bcc     $16
   1C76 E8            [ 2]  365         inx
   1C77 E8            [ 2]  366         inx
   1C78                     367 $16:
   1C78 29 07         [ 2]  368         and     #0x07
   1C7A A8            [ 2]  369         tay
   1C7B B9 AF 1C      [ 5]  370         lda     MASKTBL,y
   1C7E 85 5E         [ 3]  371         sta     0x5E
   1C80 A5 5F         [ 3]  372         lda     0x5F
   1C82 4A            [ 2]  373         lsr
   1C83 B0 09         [ 4]  374         bcs     $17
   1C85 A5 5E         [ 3]  375         lda     0x5E
   1C87 49 FF         [ 2]  376         eor     #0xFF
   1C89 35 00         [ 4]  377         and     0x00,x
   1C8B 95 00         [ 4]  378         sta     0x00,x
   1C8D 60            [ 6]  379         rts
                            380 ;
   1C8E                     381 $17:
   1C8E A5 5E         [ 3]  382         lda     0x5E
   1C90 15 00         [ 4]  383         ora     0x00,x
   1C92 95 00         [ 4]  384         sta     0x00,x
   1C94 60            [ 6]  385         rts
                            386 ;
   1C95                     387 PROCCHNL:
   1C95 A5 5D         [ 3]  388         lda     0x5D
   1C97 85 5F         [ 3]  389         sta     0x5F
   1C99 29 7E         [ 2]  390         and     #0x7E
   1C9B C9 22         [ 2]  391         cmp     #0x22
   1C9D D0 05         [ 4]  392         bne     CONVCHNL
   1C9F A9 98         [ 2]  393         lda     #0x98
   1CA1 85 65         [ 3]  394         sta     0x65
   1CA3 60            [ 6]  395         rts
                            396 ;
   1CA4                     397 CONVCHNL:
   1CA4 38            [ 2]  398         sec
   1CA5 E9 32         [ 2]  399         sbc     #0x32
   1CA7 0A            [ 2]  400         asl
   1CA8 18            [ 2]  401         clc
   1CA9 69 80         [ 2]  402         adc     #0x80
   1CAB 85 65         [ 3]  403         sta     0x65
   1CAD 60            [ 6]  404         rts
   1CAE                     405 $18:
   1CAE 60            [ 6]  406         rts
                            407 ;
                            408 ; bit mask table
                            409 ;
   1CAF                     410 MASKTBL:
   1CAF 01 02 04 08         411         .db     0x01,0x02,0x04,0x08
   1CB3 10 20 40 80         412         .db     0x10,0x20,0x40,0x80
                            413 ;
                            414 ;       Housekeeping routine
                            415 ;
                            416 ;
   1CB7                     417 TUPDATE:
   1CB7 AD 05 02      [ 4]  418         lda     U18_edge_detect_control_DI_pos
   1CBA 85 60         [ 3]  419         sta     0x60
   1CBC F0 5C         [ 4]  420         beq     TEXIT
   1CBE A5 5C         [ 3]  421         lda     0x5C
   1CC0 30 0E         [ 4]  422         bmi     $20_A
   1CC2 A5 60         [ 3]  423         lda     0x60
   1CC4 29 40         [ 2]  424         and     #0x40
   1CC6 F0 1A         [ 4]  425         beq     $20_B
   1CC8 A9 80         [ 2]  426         lda     #0x80
   1CCA 85 5C         [ 3]  427         sta     0x5C
   1CCC A9 FA         [ 2]  428         lda     #0xFA
   1CCE 85 51         [ 3]  429         sta     0x51
   1CD0                     430 $20_A:
   1CD0 A5 51         [ 3]  431         lda     0x51
   1CD2 D0 0A         [ 4]  432         bne     $20
   1CD4 A9 00         [ 2]  433         lda     #0x00
   1CD6 85 5C         [ 3]  434         sta     0x5C
   1CD8 A5 5B         [ 3]  435         lda     0x5B
   1CDA D0 02         [ 4]  436         bne     $20
   1CDC E6 5B         [ 5]  437         inc     0x5B
   1CDE                     438 $20:
   1CDE A5 60         [ 3]  439         lda     0x60
   1CE0 10 38         [ 4]  440         bpl     TEXIT
                            441 ; Adjust Timer routine
   1CE2                     442 $20_B:
   1CE2 AD 04 02      [ 4]  443         lda     U18_timer
   1CE5 49 FF         [ 2]  444         eor     #0xFF
   1CE7 4A            [ 2]  445         lsr
   1CE8 4A            [ 2]  446         lsr
   1CE9 4A            [ 2]  447         lsr
   1CEA 85 58         [ 3]  448         sta     0x58
   1CEC 90 02         [ 4]  449         bcc     $21
   1CEE E6 58         [ 5]  450         inc     0x58
                            451 
                            452 
   1CF0                     453 $21:
   1CF0 A9 7A         [ 2]  454         lda     #0x7A
   1CF2 38            [ 2]  455         sec
   1CF3 E5 58         [ 3]  456         sbc     0x58
   1CF5 8D 15 02      [ 4]  457         sta     U18_timer_8T_DI
   1CF8 C6 50         [ 5]  458         dec     0x50
   1CFA C6 51         [ 5]  459         dec     0x51
   1CFC C6 53         [ 5]  460         dec     0x53
   1CFE C6 54         [ 5]  461         dec     0x54
   1D00 D0 18         [ 4]  462         bne     TEXIT
   1D02 A9 64         [ 2]  463         lda     #0x64
   1D04 85 54         [ 3]  464         sta     0x54
   1D06 C6 55         [ 5]  465         dec     0x55
   1D08 C6 66         [ 5]  466         dec     0x66
   1D0A D0 04         [ 4]  467         bne     $21_A
   1D0C A9 FA         [ 2]  468         lda     #0xFA
   1D0E 85 66         [ 3]  469         sta     0x66
   1D10                     470 $21_A:
   1D10 C6 56         [ 5]  471         dec     0x56
   1D12 D0 06         [ 4]  472         bne     TEXIT
   1D14 A9 64         [ 2]  473         lda     #0x64
   1D16 85 56         [ 3]  474         sta     0x56
   1D18 C6 57         [ 5]  475         dec     0x57
   1D1A                     476 TEXIT:
   1D1A 60            [ 6]  477         rts
                            478 ;
                            479 ;       Read the AGC mic level
                            480 ;       Take the average of 8 samples
                            481 ;
   1D1B                     482 AGCMICRD:
   1D1B A9 00         [ 2]  483         lda     #0x00
   1D1D 85 62         [ 3]  484         sta     0x62
   1D1F 85 63         [ 3]  485         sta     0x63
   1D21 A9 0A         [ 2]  486         lda     #0x0A
   1D23 85 55         [ 3]  487         sta     0x55
   1D25 A9 64         [ 2]  488         lda     #0x64
   1D27 85 54         [ 3]  489         sta     0x54
   1D29                     490 $23:
   1D29 20 B7 1C      [ 6]  491         jsr     TUPDATE
   1D2C 20 AB 1D      [ 6]  492         jsr     L1DAB
   1D2F A5 55         [ 3]  493         lda     0x55
   1D31 D0 F6         [ 4]  494         bne     $23
   1D33 A9 0A         [ 2]  495         lda     #0x0A
   1D35 85 55         [ 3]  496         sta     0x55
   1D37 A9 64         [ 2]  497         lda     #0x64
   1D39 85 54         [ 3]  498         sta     0x54
   1D3B A5 63         [ 3]  499         lda     0x63
   1D3D C9 08         [ 2]  500         cmp     #0x08
   1D3F F0 15         [ 4]  501         beq     $27
   1D41 E6 63         [ 5]  502         inc     0x63
   1D43 A2 09         [ 2]  503         ldx     #0x09
   1D45 38            [ 2]  504         sec
   1D46 AD 80 03      [ 4]  505         lda     audio_periph$ddr_reg_a
   1D49                     506 $24:
   1D49 2A            [ 2]  507         rol
   1D4A CA            [ 2]  508         dex
   1D4B 90 FC         [ 4]  509         bcc     $24
   1D4D 18            [ 2]  510         clc
   1D4E 8A            [ 2]  511         txa
   1D4F 65 62         [ 3]  512         adc     0x62
   1D51 85 62         [ 3]  513         sta     0x62
   1D53 4C 29 1D      [ 3]  514         jmp     $23
                            515 ;
   1D56                     516 $27:
   1D56 46 62         [ 5]  517         lsr     0x62
   1D58 46 62         [ 5]  518         lsr     0x62
   1D5A 46 62         [ 5]  519         lsr     0x62
   1D5C A5 62         [ 3]  520         lda     0x62
   1D5E 85 61         [ 3]  521         sta     0x61
   1D60 A9 00         [ 2]  522         lda     #0x00
   1D62 85 62         [ 3]  523         sta     0x62
   1D64 85 63         [ 3]  524         sta     0x63
   1D66 60            [ 6]  525         rts
                            526 ;
                            527 ;        Do AGC Mic Logic
                            528 ;
   1D67                     529 AGCUPD:
   1D67 AD 80 02      [ 4]  530         lda     U19_PORTA
   1D6A 49 FF         [ 2]  531         eor     #0xFF
   1D6C 4A            [ 2]  532         lsr
   1D6D 4A            [ 2]  533         lsr
   1D6E 4A            [ 2]  534         lsr
   1D6F 4A            [ 2]  535         lsr
   1D70 18            [ 2]  536         clc
   1D71 65 61         [ 3]  537         adc     0x61
   1D73 AA            [ 2]  538         tax
   1D74 BD 9A 1D      [ 5]  539         lda     AGCTABLE,x
   1D77 85 64         [ 3]  540         sta     0x64
   1D79 A5 53         [ 3]  541         lda     0x53
   1D7B D0 16         [ 4]  542         bne     $26
   1D7D A9 0A         [ 2]  543         lda     #0x0A
   1D7F 85 53         [ 3]  544         sta     0x53
   1D81 A5 64         [ 3]  545         lda     0x64
   1D83 CD 82 03      [ 4]  546         cmp     audio_periph$ddr_reg_b
   1D86 90 08         [ 4]  547         bcc     $25
   1D88 F0 09         [ 4]  548         beq     $26
   1D8A EE 82 03      [ 6]  549         inc     audio_periph$ddr_reg_b
   1D8D 4C 93 1D      [ 3]  550         jmp     $26
                            551 ;
   1D90                     552 $25:
   1D90 CE 82 03      [ 6]  553         dec     audio_periph$ddr_reg_b
   1D93                     554 $26:
   1D93 AD 82 03      [ 4]  555         lda     audio_periph$ddr_reg_b
   1D96 8D 82 02      [ 4]  556         sta     U19_PORTB
   1D99 60            [ 6]  557         rts
                            558 ;
                            559 ;       AGC table
                            560 ;
   1D9A                     561 AGCTABLE:
   1D9A 03 04 06 08         562         .db     0x03, 0x04, 0x06, 0x08
   1D9E 10 16 20 2D         563         .db     0x10, 0x16, 0x20, 0x2D
   1DA2 40 5A 80 BF         564         .db     0x40, 0x5A, 0x80, 0xBF
   1DA6 FF FF FF FF         565         .db     0xFF, 0xFF, 0xFF, 0xFF
   1DAA FF                  566         .db     0xFF
                            567 
   1DAB                     568 L1DAB:
   1DAB A5 67         [ 3]  569         lda     0x67
   1DAD AA            [ 2]  570         tax
   1DAE A5 68         [ 3]  571         lda     0x68
   1DB0 D0 33         [ 4]  572         bne     L1DE5
   1DB2 BD 0F 1E      [ 5]  573         lda     X1E0F,x
   1DB5 C9 FE         [ 2]  574         cmp     #0xFE
   1DB7 F0 23         [ 4]  575         beq     L1DDC
   1DB9 C9 FF         [ 2]  576         cmp     #0xFF
   1DBB D0 07         [ 4]  577         bne     L1DC4
   1DBD A9 00         [ 2]  578         lda     #0x00
   1DBF 85 67         [ 3]  579         sta     0x67
   1DC1 4C DB 1D      [ 3]  580         jmp     L1DDB
                            581 
                            582 
   1DC4                     583 L1DC4:
   1DC4 C5 66         [ 3]  584         cmp     0x66
   1DC6 D0 13         [ 4]  585         bne     L1DDB
   1DC8 BD 10 1E      [ 5]  586         lda     X1E10,x
   1DCB 20 51 1C      [ 6]  587         jsr     PROCBYTE
   1DCE BD 11 1E      [ 5]  588         lda     X1E11,x
   1DD1 20 51 1C      [ 6]  589         jsr     PROCBYTE
   1DD4 A5 67         [ 3]  590         lda     0x67
   1DD6 18            [ 2]  591         clc
   1DD7 69 03         [ 2]  592         adc     #0x03
   1DD9 85 67         [ 3]  593         sta     0x67
                            594 
                            595 
   1DDB                     596 L1DDB:
   1DDB 60            [ 6]  597         rts
                            598 
                            599 
   1DDC                     600 L1DDC:
   1DDC E6 68         [ 5]  601         inc     0x68
   1DDE A9 00         [ 2]  602         lda     #0x00
   1DE0 85 67         [ 3]  603         sta     0x67
   1DE2 4C DB 1D      [ 3]  604         jmp     L1DDB
                            605 
                            606 
   1DE5                     607 L1DE5:
   1DE5 BD F3 1E      [ 5]  608         lda     X1EF3,x
   1DE8 C9 FF         [ 2]  609         cmp     #0xFF
   1DEA D0 09         [ 4]  610         bne     L1DF5
   1DEC A9 00         [ 2]  611         lda     #0x00
   1DEE 85 67         [ 3]  612         sta     0x67
   1DF0 85 68         [ 3]  613         sta     0x68
   1DF2 4C DB 1D      [ 3]  614         jmp     L1DDB
                            615 
                            616 
   1DF5                     617 L1DF5:
   1DF5 C5 66         [ 3]  618         cmp     0x66
   1DF7 D0 E2         [ 4]  619         bne     L1DDB
   1DF9 BD F4 1E      [ 5]  620         lda     X1EF4,x
   1DFC 20 51 1C      [ 6]  621         jsr     PROCBYTE
   1DFF BD F5 1E      [ 5]  622         lda     X1EF5,x
   1E02 20 51 1C      [ 6]  623         jsr     PROCBYTE
   1E05 A5 67         [ 3]  624         lda     0x67
   1E07 18            [ 2]  625         clc
   1E08 69 03         [ 2]  626         adc     #0x03
   1E0A 85 67         [ 3]  627         sta     0x67
   1E0C 4C DB 1D      [ 3]  628         jmp     L1DDB
                            629 ;
                            630 ;       Table of pairs of bytes to process
                            631 ;
   1E0F                     632 X1E0F:
   1E0F EE                  633         .byte   0xEE
                            634 
   1E10                     635 X1E10:
   1E10 35                  636         .byte   0x35
                            637 
   1E11                     638 X1E11:
   1E11 46 EB 35 49 E9 35   639         .byte   0x46,0xEB,0x35,0x49,0xE9,0x35,0x4A,0xE9,0x33,0x42,0xE8,0x33,0x46,0xE7,0x32,0x46
        4A E9 33 42 E8 33
        46 E7 32 46
   1E21 E6 33 46 E5 32 46   640         .byte   0xE6,0x33,0x46,0xE5,0x32,0x46,0xE4,0x33,0x46,0xE3,0x32,0x46,0xE2,0x33,0x46,0xE1
        E4 33 46 E3 32 46
        E2 33 46 E1
   1E31 32 46 E0 33 46 DF   641         .byte   0x32,0x46,0xE0,0x33,0x46,0xDF,0x32,0x46,0xDE,0x33,0x46,0xDD,0x32,0x46,0xDD,0x34
        32 46 DE 33 46 DD
        32 46 DD 34
   1E41 46 DC 33 46 DB 32   642         .byte   0x46,0xDC,0x33,0x46,0xDB,0x32,0x46,0xDB,0x35,0x46,0xDA,0x33,0x46,0xD9,0x32,0x46
        46 DB 35 46 DA 33
        46 D9 32 46
   1E51 D1 32 42 C6 33 47   643         .byte   0xD1,0x32,0x42,0xC6,0x33,0x47,0xC6,0x33,0x43,0xC5,0x32,0x47,0xC3,0x34,0x46,0xC2
        C6 33 43 C5 32 47
        C3 34 46 C2
   1E61 33 47 C1 32 47 C0   644         .byte   0x33,0x47,0xC1,0x32,0x47,0xC0,0x35,0x46,0xB9,0x34,0x46,0xB9,0x32,0x43,0xB7,0x35
        35 46 B9 34 46 B9
        32 43 B7 35
   1E71 46 B7 33 42 B3 33   645         .byte   0x46,0xB7,0x33,0x42,0xB3,0x33,0x46,0xB2,0x32,0x46,0xA8,0x32,0x42,0x9D,0x33,0x47
        46 B2 32 46 A8 32
        42 9D 33 47
   1E81 9C 32 47 9B 33 47   646         .byte   0x9C,0x32,0x47,0x9B,0x33,0x47,0x9A,0x32,0x47,0x9A,0x34,0x46,0x99,0x33,0x47,0x99
        9A 32 47 9A 34 46
        99 33 47 99
   1E91 33 43 99 35 46 98   647         .byte   0x33,0x43,0x99,0x35,0x46,0x98,0x32,0x47,0x97,0x33,0x47,0x94,0x32,0x47,0x93,0x33
        32 47 97 33 47 94
        32 47 93 33
   1EA1 47 92 32 47 91 33   648         .byte   0x47,0x92,0x32,0x47,0x91,0x33,0x47,0x90,0x32,0x47,0x87,0x33,0x42,0x86,0x32,0x43
        47 90 32 47 87 33
        42 86 32 43
   1EB1 7D 33 46 7C 32 46   649         .byte   0x7D,0x33,0x46,0x7C,0x32,0x46,0x77,0x32,0x42,0x77,0x34,0x46,0x75,0x32,0x43,0x75
        77 32 42 77 34 46
        75 32 43 75
   1EC1 35 46 6A 33 46 69   650         .byte   0x35,0x46,0x6A,0x33,0x46,0x69,0x32,0x46,0x67,0x33,0x46,0x66,0x32,0x46,0x66,0x32
        32 46 67 33 46 66
        32 46 66 32
   1ED1 43 65 34 46 62 35   651         .byte   0x43,0x65,0x34,0x46,0x62,0x35,0x46,0x62,0x33,0x42,0x56,0x33,0x46,0x55,0x32,0x46
        46 62 33 42 56 33
        46 55 32 46
   1EE1 55 32 42 54 33 46   652         .byte   0x55,0x32,0x42,0x54,0x33,0x46,0x53,0x32,0x46,0x52,0x33,0x46,0x51,0x32,0x46,0xFE
        53 32 46 52 33 46
        51 32 46 FE
   1EF1 FE FE               653         .byte   0xFE,0xFE
                            654 
   1EF3                     655 X1EF3:
   1EF3 50                  656         .byte   0x50
                            657 
   1EF4                     658 X1EF4:
   1EF4 33                  659         .byte   0x33
                            660 
   1EF5                     661 X1EF5:
   1EF5 46 4F 32 46 4E 33   662         .byte   0x46,0x4F,0x32,0x46,0x4E,0x33,0x46,0x4E,0x33,0x42,0x4D,0x32,0x46,0x4C,0x33,0x46
        46 4E 33 42 4D 32
        46 4C 33 46
   1F05 4B 32 46 40 34 46   663         .byte   0x4B,0x32,0x46,0x40,0x34,0x46,0x3E,0x35,0x46,0x3C,0x33,0x47,0x3B,0x32,0x47,0x3A
        3E 35 46 3C 33 47
        3B 32 47 3A
   1F15 33 47 39 32 47 32   664         .byte   0x33,0x47,0x39,0x32,0x47,0x32,0x32,0x42,0x29,0x34,0x46,0x28,0x32,0x47,0x27,0x35
        32 42 29 34 46 28
        32 47 27 35
   1F25 46 26 33 43 23 33   665         .byte   0x46,0x26,0x33,0x43,0x23,0x33,0x47,0x22,0x32,0x47,0x1E,0x33,0x42,0x1D,0x32,0x43
        47 22 32 47 1E 33
        42 1D 32 43
   1F35 1B 33 47 1A 32 47   666         .byte   0x1B,0x33,0x47,0x1A,0x32,0x47,0x19,0x33,0x47,0x18,0x32,0x47,0x17,0x34,0x46,0x17
        19 33 47 18 32 47
        17 34 46 17
   1F45 33 47 17 32 42 16   667         .byte   0x33,0x47,0x17,0x32,0x42,0x16,0x32,0x47,0x15,0x35,0x46,0x15,0x33,0x43,0x08,0x32
        32 47 15 35 46 15
        33 43 08 32
   1F55 43 03 33 46 02 32   668         .byte   0x43,0x03,0x33,0x46,0x02,0x32,0x46,0x02,0x34,0x46,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        46 02 34 46 FF FF
        FF FF FF FF
   1F65 FF FF FF FF FF FF   669         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F75 FF FF FF FF FF FF   670         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F85 FF FF FF FF FF FF   671         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1F95 FF FF FF FF FF FF   672         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FA5 FF FF FF FF FF FF   673         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FB5 FF FF FF FF FF FF   674         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FC5 FF FF FF FF FF FF   675         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FD5 FF FF FF FF FF FF   676         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FE5 FF FF FF FF FF FF   677         .byte   0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
        FF FF FF FF FF FF
        FF FF FF FF
   1FF5 FF FF FF FF FF      678         .byte   0xFF,0xFF,0xFF,0xFF,0xFF
                            679 
   1FFA                     680         .org    0x1FFA
                            681         ;
                            682         ; vectors
                            683         ;
   1FFA                     684 NMIVEC:
   1FFA FF FF               685         .dw     0xFFFF
   1FFC                     686 RESETVEC:
   1FFC 00 1A               687         .dw     RESET
   1FFE                     688 IRQVEC:
   1FFE FF FF               689         .dw     0xFFFF
