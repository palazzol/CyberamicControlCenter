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
   1800                       6         .org    0x1800
                              7 
   1800                       8 L1800:
   1800 D8            [ 2]    9         cld
   1801 78            [ 2]   10         sei
   1802 A2 F0         [ 2]   11         ldx     #0xF0
   1804 9A            [ 2]   12         txs
   1805 A9 00         [ 2]   13         lda     #0x00
   1807 A2 10         [ 2]   14         ldx     #0x10
                             15 
                             16 
   1809                      17 L1809:
   1809 95 00         [ 4]   18         sta     0x00,x
   180B E8            [ 2]   19         inx
   180C E0 80         [ 2]   20         cpx     #0x80
   180E D0 F9         [ 4]   21         bne     L1809
   1810 A9 00         [ 2]   22         lda     #0x00
   1812 8D 01 03      [ 4]   23         sta     transport_control_reg_a
   1815 8D 02 02      [ 4]   24         sta     U18_PORTB
   1818 8D 81 03      [ 4]   25         sta     audio_control_reg_a
   181B 8D 83 03      [ 4]   26         sta     audio_control_reg_b
   181E 8D 05 02      [ 4]   27         sta     U18_edge_detect_control_DI_pos
   1821 8D 03 03      [ 4]   28         sta     transport_control_reg_b
   1824 8D 01 02      [ 4]   29         sta     U18_DDRA
   1827 A9 02         [ 2]   30         lda     #0x02
   1829 8D 81 02      [ 4]   31         sta     U19_DDRA
   182C 8D 80 02      [ 4]   32         sta     U19_PORTA
   182F A9 FF         [ 2]   33         lda     #0xFF
   1831 8D 82 03      [ 4]   34         sta     audio_periph$ddr_reg_b
   1834 8D 03 02      [ 4]   35         sta     U18_DDRB
   1837 8D 83 02      [ 4]   36         sta     U19_DDRB
   183A A9 FC         [ 2]   37         lda     #0xFC
   183C 8D 02 03      [ 4]   38         sta     transport_periph$ddr_reg_b
   183F A9 2E         [ 2]   39         lda     #0x2E
   1841 8D 01 03      [ 4]   40         sta     transport_control_reg_a
   1844 8D 03 03      [ 4]   41         sta     transport_control_reg_b
   1847 A9 3C         [ 2]   42         lda     #0x3C
   1849 8D 83 03      [ 4]   43         sta     audio_control_reg_b
   184C 8D 81 03      [ 4]   44         sta     audio_control_reg_a
   184F A9 10         [ 2]   45         lda     #0x10
   1851 8D 82 03      [ 4]   46         sta     audio_periph$ddr_reg_b
   1854 8D 82 02      [ 4]   47         sta     U19_PORTB
   1857 A9 00         [ 2]   48         lda     #0x00
   1859 85 66         [ 3]   49         sta     0x66
   185B A9 64         [ 2]   50         lda     #0x64
   185D 85 53         [ 3]   51         sta     0x53
   185F A9 24         [ 2]   52         lda     #0x24
   1861 85 74         [ 3]   53         sta     0x74
                             54 
                             55 
   1863                      56 L1863:
   1863 A9 02         [ 2]   57         lda     #0x02
   1865 8D 80 02      [ 4]   58         sta     U19_PORTA
   1868 A9 10         [ 2]   59         lda     #0x10
   186A 20 46 1B      [ 6]   60         jsr     L1B46
   186D A9 28         [ 2]   61         lda     #0x28
   186F 85 54         [ 3]   62         sta     0x54
                             63 
                             64 
   1871                      65 L1871:
   1871 20 63 1B      [ 6]   66         jsr     L1B63
   1874 A5 54         [ 3]   67         lda     0x54
   1876 D0 F9         [ 4]   68         bne     L1871
   1878 20 61 1D      [ 6]   69         jsr     0x1D61
   187B 20 39 1D      [ 6]   70         jsr     0x1D39
   187E A9 40         [ 2]   71         lda     #0x40
   1880 20 46 1B      [ 6]   72         jsr     L1B46
   1883 A5 5D         [ 3]   73         lda     0x5D
   1885 8D 82 02      [ 4]   74         sta     U19_PORTB
                             75 
                             76 
   1888                      77 L1888:
   1888 A9 00         [ 2]   78         lda     #0x00
   188A 85 61         [ 3]   79         sta     0x61
                             80 
                             81 
   188C                      82 L188C:
   188C AD 02 03      [ 4]   83         lda     transport_periph$ddr_reg_b
   188F A9 0A         [ 2]   84         lda     #0x0A
   1891 85 50         [ 3]   85         sta     0x50
   1893 E6 61         [ 5]   86         inc     0x61
   1895 A5 61         [ 3]   87         lda     0x61
   1897 C9 64         [ 2]   88         cmp     #0x64
   1899 B0 0F         [ 4]   89         bcs     L18AA
                             90 
                             91 
   189B                      92 L189B:
   189B 20 63 1B      [ 6]   93         jsr     L1B63
   189E A5 50         [ 3]   94         lda     0x50
   18A0 F0 E6         [ 4]   95         beq     L1888
   18A2 AD 03 03      [ 4]   96         lda     transport_control_reg_b
   18A5 10 F4         [ 4]   97         bpl     L189B
   18A7 4C 8C 18      [ 3]   98         jmp     L188C
                             99 
                            100 
   18AA                     101 L18AA:
   18AA A9 20         [ 2]  102         lda     #0x20
   18AC 20 46 1B      [ 6]  103         jsr     L1B46
   18AF A9 19         [ 2]  104         lda     #0x19
   18B1 85 54         [ 3]  105         sta     0x54
                            106 
                            107 
   18B3                     108 L18B3:
   18B3 20 63 1B      [ 6]  109         jsr     L1B63
   18B6 A5 54         [ 3]  110         lda     0x54
   18B8 D0 F9         [ 4]  111         bne     L18B3
   18BA A9 00         [ 2]  112         lda     #0x00
   18BC 85 5D         [ 3]  113         sta     0x5D
   18BE A9 02         [ 2]  114         lda     #0x02
   18C0 85 5E         [ 3]  115         sta     0x5E
   18C2 85 5F         [ 3]  116         sta     0x5F
   18C4 20 84 1A      [ 6]  117         jsr     L1A84
   18C7 A9 00         [ 2]  118         lda     #0x00
   18C9 8D 80 02      [ 4]  119         sta     U19_PORTA
   18CC A9 00         [ 2]  120         lda     #0x00
   18CE 85 6B         [ 3]  121         sta     0x6B
                            122 
                            123 
   18D0                     124 L18D0:
   18D0 A5 74         [ 3]  125         lda     0x74
   18D2 85 58         [ 3]  126         sta     0x58
                            127 
                            128 
   18D4                     129 L18D4:
   18D4 A9 0A         [ 2]  130         lda     #0x0A
   18D6 85 54         [ 3]  131         sta     0x54
                            132 
                            133 
   18D8                     134 L18D8:
   18D8 20 63 1B      [ 6]  135         jsr     L1B63
   18DB A5 6B         [ 3]  136         lda     0x6B
   18DD 30 03         [ 4]  137         bmi     L18E2
   18DF 20 4D 1C      [ 6]  138         jsr     0x1C4D
                            139 
                            140 
   18E2                     141 L18E2:
   18E2 A5 72         [ 3]  142         lda     0x72
   18E4 30 47         [ 4]  143         bmi     L192D
   18E6 D0 11         [ 4]  144         bne     L18F9
   18E8 A9 64         [ 2]  145         lda     #0x64
   18EA 85 55         [ 3]  146         sta     0x55
   18EC A9 80         [ 2]  147         lda     #0x80
   18EE 8D 02 03      [ 4]  148         sta     transport_periph$ddr_reg_b
   18F1 A9 03         [ 2]  149         lda     #0x03
   18F3 85 72         [ 3]  150         sta     0x72
   18F5 A9 A0         [ 2]  151         lda     #0xA0
   18F7 85 51         [ 3]  152         sta     0x51
                            153 
                            154 
   18F9                     155 L18F9:
   18F9 A5 72         [ 3]  156         lda     0x72
   18FB 6A            [ 2]  157         ror
   18FC 90 0B         [ 4]  158         bcc     L1909
   18FE A5 55         [ 3]  159         lda     0x55
   1900 D0 07         [ 4]  160         bne     L1909
   1902 A9 02         [ 2]  161         lda     #0x02
   1904 85 72         [ 3]  162         sta     0x72
   1906 4C 20 19      [ 3]  163         jmp     L1920
                            164 
                            165 
   1909                     166 L1909:
   1909 AD 02 03      [ 4]  167         lda     transport_periph$ddr_reg_b
   190C 6A            [ 2]  168         ror
   190D B0 04         [ 4]  169         bcs     L1913
   190F A9 A0         [ 2]  170         lda     #0xA0
   1911 85 51         [ 3]  171         sta     0x51
                            172 
                            173 
   1913                     174 L1913:
   1913 A5 51         [ 3]  175         lda     0x51
   1915 D0 11         [ 4]  176         bne     L1928
   1917 A9 10         [ 2]  177         lda     #0x10
   1919 8D 02 03      [ 4]  178         sta     transport_periph$ddr_reg_b
   191C A9 80         [ 2]  179         lda     #0x80
   191E 85 72         [ 3]  180         sta     0x72
                            181 
                            182 
   1920                     183 L1920:
   1920 A9 20         [ 2]  184         lda     #0x20
   1922 2D 02 02      [ 4]  185         and     U18_PORTB
   1925 8D 02 02      [ 4]  186         sta     U18_PORTB
                            187 
                            188 
   1928                     189 L1928:
   1928 A5 72         [ 3]  190         lda     0x72
   192A 6A            [ 2]  191         ror
   192B B0 AB         [ 4]  192         bcs     L18D8
                            193 
                            194 
   192D                     195 L192D:
   192D 20 BF 1B      [ 6]  196         jsr     L1BBF
   1930 20 1A 1C      [ 6]  197         jsr     0x1C1A
   1933 A5 62         [ 3]  198         lda     0x62
   1935 D0 A1         [ 4]  199         bne     L18D8
   1937 AD 02 02      [ 4]  200         lda     U18_PORTB
   193A 29 20         [ 2]  201         and     #0x20
   193C F0 28         [ 4]  202         beq     L1966
   193E A5 5A         [ 3]  203         lda     0x5A
   1940 F0 03         [ 4]  204         beq     L1945
   1942 4C B6 19      [ 3]  205         jmp     L19B6
                            206 
                            207 
   1945                     208 L1945:
   1945 2A            [ 2]  209         rol
   1946 90 03         [ 4]  210         bcc     L194B
   1948 4C CA 19      [ 3]  211         jmp     L19CA
                            212 
                            213 
   194B                     214 L194B:
   194B 2A            [ 2]  215         rol
   194C 2A            [ 2]  216         rol
   194D 90 03         [ 4]  217         bcc     L1952
   194F 4C 71 1A      [ 3]  218         jmp     L1A71
                            219 
                            220 
   1952                     221 L1952:
   1952 29 B0         [ 2]  222         and     #0xB0
   1954 F0 03         [ 4]  223         beq     L1959
   1956 4C F9 19      [ 3]  224         jmp     L19F9
                            225 
                            226 
   1959                     227 L1959:
   1959 A5 74         [ 3]  228         lda     0x74
   195B F0 06         [ 4]  229         beq     L1963
   195D A5 58         [ 3]  230         lda     0x58
   195F D0 02         [ 4]  231         bne     L1963
   1961 E6 5A         [ 5]  232         inc     0x5A
                            233 
                            234 
   1963                     235 L1963:
   1963 4C D8 18      [ 3]  236         jmp     L18D8
                            237 
                            238 
   1966                     239 L1966:
   1966 A5 72         [ 3]  240         lda     0x72
   1968 10 F9         [ 4]  241         bpl     L1963
   196A A9 00         [ 2]  242         lda     #0x00
   196C 8D 02 02      [ 4]  243         sta     U18_PORTB
                            244 
                            245 
   196F                     246 L196F:
   196F 20 63 1B      [ 6]  247         jsr     L1B63
   1972 AD 00 02      [ 4]  248         lda     U18_PORTA
   1975 49 FF         [ 2]  249         eor     #0xFF
   1977 8D 02 02      [ 4]  250         sta     U18_PORTB
   197A F0 F3         [ 4]  251         beq     L196F
   197C C9 20         [ 2]  252         cmp     #0x20
   197E D0 07         [ 4]  253         bne     L1987
   1980 A9 00         [ 2]  254         lda     #0x00
   1982 8D 02 02      [ 4]  255         sta     U18_PORTB
   1985 F0 DC         [ 4]  256         beq     L1963
                            257 
                            258 
   1987                     259 L1987:
   1987 C9 10         [ 2]  260         cmp     #0x10
   1989 D0 E4         [ 4]  261         bne     L196F
   198B AD 80 02      [ 4]  262         lda     U19_PORTA
   198E 49 FF         [ 2]  263         eor     #0xFF
   1990 4A            [ 2]  264         lsr
   1991 4A            [ 2]  265         lsr
   1992 4A            [ 2]  266         lsr
   1993 4A            [ 2]  267         lsr
   1994 AA            [ 2]  268         tax
   1995 C9 09         [ 2]  269         cmp     #0x09
   1997 D0 09         [ 4]  270         bne     L19A2
   1999 A9 00         [ 2]  271         lda     #0x00
   199B 85 74         [ 3]  272         sta     0x74
   199D 8D 82 02      [ 4]  273         sta     U19_PORTB
   19A0 F0 C4         [ 4]  274         beq     L1966
                            275 
                            276 
   19A2                     277 L19A2:
   19A2 A9 00         [ 2]  278         lda     #0x00
                            279 
                            280 
   19A4                     281 L19A4:
   19A4 CA            [ 2]  282         dex
   19A5 30 05         [ 4]  283         bmi     L19AC
   19A7 18            [ 2]  284         clc
   19A8 69 03         [ 2]  285         adc     #0x03
   19AA D0 F8         [ 4]  286         bne     L19A4
                            287 
                            288 
   19AC                     289 L19AC:
   19AC 18            [ 2]  290         clc
   19AD 69 1B         [ 2]  291         adc     #0x1B
   19AF 8D 82 02      [ 4]  292         sta     U19_PORTB
   19B2 85 74         [ 3]  293         sta     0x74
   19B4 D0 B0         [ 4]  294         bne     L1966
                            295 
                            296 
   19B6                     297 L19B6:
   19B6 A9 A0         [ 2]  298         lda     #0xA0
   19B8 8D 02 02      [ 4]  299         sta     U18_PORTB
   19BB A5 5F         [ 3]  300         lda     0x5F
   19BD 85 5E         [ 3]  301         sta     0x5E
   19BF 20 84 1A      [ 6]  302         jsr     L1A84
   19C2 20 E9 1A      [ 6]  303         jsr     L1AE9
   19C5 C6 5A         [ 5]  304         dec     0x5A
   19C7 20 B3 1C      [ 6]  305         jsr     0x1CB3
                            306 
                            307 
   19CA                     308 L19CA:
   19CA A5 5F         [ 3]  309         lda     0x5F
   19CC C5 5E         [ 3]  310         cmp     0x5E
   19CE D0 21         [ 4]  311         bne     L19F1
   19D0 E6 5F         [ 5]  312         inc     0x5F
   19D2 A5 5F         [ 3]  313         lda     0x5F
   19D4 C9 06         [ 2]  314         cmp     #0x06
   19D6 F0 14         [ 4]  315         beq     L19EC
   19D8 C9 10         [ 2]  316         cmp     #0x10
   19DA F0 10         [ 4]  317         beq     L19EC
   19DC C9 1A         [ 2]  318         cmp     #0x1A
   19DE D0 11         [ 4]  319         bne     L19F1
   19E0 A9 02         [ 2]  320         lda     #0x02
   19E2 85 5F         [ 3]  321         sta     0x5F
   19E4 A9 02         [ 2]  322         lda     #0x02
   19E6 8D 80 02      [ 4]  323         sta     U19_PORTA
   19E9 4C 63 18      [ 3]  324         jmp     L1863
                            325 
                            326 
   19EC                     327 L19EC:
   19EC 18            [ 2]  328         clc
   19ED 69 06         [ 2]  329         adc     #0x06
   19EF 85 5F         [ 3]  330         sta     0x5F
                            331 
                            332 
   19F1                     333 L19F1:
   19F1 E6 5E         [ 5]  334         inc     0x5E
   19F3 20 94 1A      [ 6]  335         jsr     L1A94
   19F6 4C D0 18      [ 3]  336         jmp     L18D0
                            337 
                            338 
   19F9                     339 L19F9:
   19F9 A5 58         [ 3]  340         lda     0x58
   19FB 85 73         [ 3]  341         sta     0x73
   19FD AD 02 02      [ 4]  342         lda     U18_PORTB
   1A00 29 0F         [ 2]  343         and     #0x0F
   1A02 85 64         [ 3]  344         sta     0x64
   1A04 85 65         [ 3]  345         sta     0x65
   1A06 6A            [ 2]  346         ror
   1A07 90 13         [ 4]  347         bcc     L1A1C
   1A09 18            [ 2]  348         clc
   1A0A A9 06         [ 2]  349         lda     #0x06
   1A0C 65 60         [ 3]  350         adc     0x60
   1A0E E6 60         [ 5]  351         inc     0x60
   1A10 A6 60         [ 3]  352         ldx     0x60
   1A12 E0 03         [ 2]  353         cpx     #0x03
   1A14 90 08         [ 4]  354         bcc     L1A1E
   1A16 A2 00         [ 2]  355         ldx     #0x00
   1A18 86 60         [ 3]  356         stx     0x60
   1A1A F0 02         [ 4]  357         beq     L1A1E
                            358 
                            359 
   1A1C                     360 L1A1C:
   1A1C A9 0A         [ 2]  361         lda     #0x0A
                            362 
                            363 
   1A1E                     364 L1A1E:
   1A1E A6 5F         [ 3]  365         ldx     0x5F
   1A20 E0 0E         [ 2]  366         cpx     #0x0E
   1A22 90 03         [ 4]  367         bcc     L1A27
   1A24 18            [ 2]  368         clc
   1A25 69 0A         [ 2]  369         adc     #0x0A
                            370 
                            371 
   1A27                     372 L1A27:
   1A27 85 5E         [ 3]  373         sta     0x5E
   1A29 20 84 1A      [ 6]  374         jsr     L1A84
   1A2C 20 E9 1A      [ 6]  375         jsr     L1AE9
   1A2F 20 39 1D      [ 6]  376         jsr     0x1D39
                            377 
                            378 
   1A32                     379 L1A32:
   1A32 A9 FA         [ 2]  380         lda     #0xFA
   1A34 85 51         [ 3]  381         sta     0x51
                            382 
                            383 
   1A36                     384 L1A36:
   1A36 20 BF 1B      [ 6]  385         jsr     L1BBF
   1A39 A5 62         [ 3]  386         lda     0x62
   1A3B D0 11         [ 4]  387         bne     L1A4E
   1A3D 20 63 1B      [ 6]  388         jsr     L1B63
   1A40 A5 51         [ 3]  389         lda     0x51
   1A42 D0 F2         [ 4]  390         bne     L1A36
   1A44 AD 02 02      [ 4]  391         lda     U18_PORTB
   1A47 45 65         [ 3]  392         eor     0x65
   1A49 8D 02 02      [ 4]  393         sta     U18_PORTB
   1A4C D0 E4         [ 4]  394         bne     L1A32
                            395 
                            396 
   1A4E                     397 L1A4E:
   1A4E 20 63 1B      [ 6]  398         jsr     L1B63
   1A51 20 BF 1B      [ 6]  399         jsr     L1BBF
   1A54 A5 62         [ 3]  400         lda     0x62
   1A56 D0 F6         [ 4]  401         bne     L1A4E
   1A58 AD 02 02      [ 4]  402         lda     U18_PORTB
   1A5B 25 64         [ 3]  403         and     0x64
   1A5D D0 03         [ 4]  404         bne     L1A62
   1A5F 4C D4 18      [ 3]  405         jmp     L18D4
                            406 
                            407 
   1A62                     408 L1A62:
   1A62 20 B3 1C      [ 6]  409         jsr     0x1CB3
                            410 
                            411 
   1A65                     412 L1A65:
   1A65 E6 5E         [ 5]  413         inc     0x5E
   1A67 20 94 1A      [ 6]  414         jsr     L1A94
   1A6A A5 73         [ 3]  415         lda     0x73
   1A6C 85 58         [ 3]  416         sta     0x58
   1A6E 4C D4 18      [ 3]  417         jmp     L18D4
                            418 
                            419 
   1A71                     420 L1A71:
   1A71 A9 01         [ 2]  421         lda     #0x01
   1A73 85 5E         [ 3]  422         sta     0x5E
   1A75 20 84 1A      [ 6]  423         jsr     L1A84
   1A78 20 E9 1A      [ 6]  424         jsr     L1AE9
   1A7B 20 4D 1C      [ 6]  425         jsr     0x1C4D
   1A7E 20 B3 1C      [ 6]  426         jsr     0x1CB3
   1A81 4C 65 1A      [ 3]  427         jmp     L1A65
                            428 
                            429 
   1A84                     430 L1A84:
   1A84 A5 5E         [ 3]  431         lda     0x5E
   1A86 C5 5D         [ 3]  432         cmp     0x5D
   1A88 90 06         [ 4]  433         bcc     L1A90
   1A8A F0 03         [ 4]  434         beq     L1A8F
   1A8C 20 94 1A      [ 6]  435         jsr     L1A94
                            436 
                            437 
   1A8F                     438 L1A8F:
   1A8F 60            [ 6]  439         rts
                            440 
                            441 
   1A90                     442 L1A90:
   1A90 20 AD 1A      [ 6]  443         jsr     L1AAD
   1A93 60            [ 6]  444         rts
                            445 
                            446 
   1A94                     447 L1A94:
   1A94 A9 20         [ 2]  448         lda     #0x20
   1A96 20 46 1B      [ 6]  449         jsr     L1B46
   1A99 20 1E 1B      [ 6]  450         jsr     L1B1E
   1A9C E6 5D         [ 5]  451         inc     0x5D
   1A9E A5 5D         [ 3]  452         lda     0x5D
   1AA0 8D 82 02      [ 4]  453         sta     U19_PORTB
   1AA3 A5 5E         [ 3]  454         lda     0x5E
   1AA5 C5 5D         [ 3]  455         cmp     0x5D
   1AA7 D0 EB         [ 4]  456         bne     L1A94
   1AA9 20 C8 1A      [ 6]  457         jsr     L1AC8
   1AAC 60            [ 6]  458         rts
                            459 
                            460 
   1AAD                     461 L1AAD:
   1AAD E6 5D         [ 5]  462         inc     0x5D
                            463 
                            464 
   1AAF                     465 L1AAF:
   1AAF A9 40         [ 2]  466         lda     #0x40
   1AB1 20 46 1B      [ 6]  467         jsr     L1B46
   1AB4 20 1E 1B      [ 6]  468         jsr     L1B1E
   1AB7 C6 5D         [ 5]  469         dec     0x5D
   1AB9 A5 5D         [ 3]  470         lda     0x5D
   1ABB 8D 82 02      [ 4]  471         sta     U19_PORTB
   1ABE A5 5E         [ 3]  472         lda     0x5E
   1AC0 C5 5D         [ 3]  473         cmp     0x5D
   1AC2 D0 EB         [ 4]  474         bne     L1AAF
   1AC4 20 DB 1A      [ 6]  475         jsr     L1ADB
   1AC7 60            [ 6]  476         rts
                            477 
                            478 
   1AC8                     479 L1AC8:
   1AC8 A9 40         [ 2]  480         lda     #0x40
   1ACA 20 46 1B      [ 6]  481         jsr     L1B46
   1ACD 20 1E 1B      [ 6]  482         jsr     L1B1E
   1AD0 A9 03         [ 2]  483         lda     #0x03
   1AD2 85 54         [ 3]  484         sta     0x54
                            485 
                            486 
   1AD4                     487 L1AD4:
   1AD4 20 63 1B      [ 6]  488         jsr     L1B63
   1AD7 A5 54         [ 3]  489         lda     0x54
   1AD9 D0 F9         [ 4]  490         bne     L1AD4
                            491 
                            492 
   1ADB                     493 L1ADB:
   1ADB A9 20         [ 2]  494         lda     #0x20
   1ADD 20 46 1B      [ 6]  495         jsr     L1B46
   1AE0 20 1E 1B      [ 6]  496         jsr     L1B1E
   1AE3 A9 10         [ 2]  497         lda     #0x10
   1AE5 20 46 1B      [ 6]  498         jsr     L1B46
   1AE8 60            [ 6]  499         rts
                            500 
                            501 
   1AE9                     502 L1AE9:
   1AE9 A5 72         [ 3]  503         lda     0x72
   1AEB 30 30         [ 4]  504         bmi     L1B1D
   1AED A9 80         [ 2]  505         lda     #0x80
   1AEF 20 46 1B      [ 6]  506         jsr     L1B46
   1AF2 A9 FA         [ 2]  507         lda     #0xFA
   1AF4 85 50         [ 3]  508         sta     0x50
                            509 
                            510 
   1AF6                     511 L1AF6:
   1AF6 20 63 1B      [ 6]  512         jsr     L1B63
   1AF9 A5 50         [ 3]  513         lda     0x50
   1AFB D0 F9         [ 4]  514         bne     L1AF6
                            515 
                            516 
   1AFD                     517 L1AFD:
   1AFD AD 02 03      [ 4]  518         lda     transport_periph$ddr_reg_b
   1B00 6A            [ 2]  519         ror
   1B01 90 FA         [ 4]  520         bcc     L1AFD
   1B03 A9 A0         [ 2]  521         lda     #0xA0
   1B05 85 50         [ 3]  522         sta     0x50
                            523 
                            524 
   1B07                     525 L1B07:
   1B07 AD 02 03      [ 4]  526         lda     transport_periph$ddr_reg_b
   1B0A 6A            [ 2]  527         ror
   1B0B 90 E9         [ 4]  528         bcc     L1AF6
   1B0D 20 63 1B      [ 6]  529         jsr     L1B63
   1B10 A5 50         [ 3]  530         lda     0x50
   1B12 D0 F3         [ 4]  531         bne     L1B07
   1B14 A9 10         [ 2]  532         lda     #0x10
   1B16 20 46 1B      [ 6]  533         jsr     L1B46
   1B19 A9 80         [ 2]  534         lda     #0x80
   1B1B 85 72         [ 3]  535         sta     0x72
                            536 
                            537 
   1B1D                     538 L1B1D:
   1B1D 60            [ 6]  539         rts
                            540 
                            541 
   1B1E                     542 L1B1E:
   1B1E A5 5D         [ 3]  543         lda     0x5D
   1B20 8D 82 02      [ 4]  544         sta     U19_PORTB
                            545 
                            546 
   1B23                     547 L1B23:
   1B23 A9 00         [ 2]  548         lda     #0x00
   1B25 85 61         [ 3]  549         sta     0x61
                            550 
                            551 
   1B27                     552 L1B27:
   1B27 AD 02 03      [ 4]  553         lda     transport_periph$ddr_reg_b
   1B2A A9 0A         [ 2]  554         lda     #0x0A
   1B2C 85 50         [ 3]  555         sta     0x50
   1B2E E6 61         [ 5]  556         inc     0x61
   1B30 A5 61         [ 3]  557         lda     0x61
   1B32 C9 21         [ 2]  558         cmp     #0x21
   1B34 B0 0F         [ 4]  559         bcs     L1B45
                            560 
                            561 
   1B36                     562 L1B36:
   1B36 20 63 1B      [ 6]  563         jsr     L1B63
   1B39 A5 50         [ 3]  564         lda     0x50
   1B3B F0 E6         [ 4]  565         beq     L1B23
   1B3D AD 03 03      [ 4]  566         lda     transport_control_reg_b
   1B40 10 F4         [ 4]  567         bpl     L1B36
   1B42 4C 27 1B      [ 3]  568         jmp     L1B27
                            569 
                            570 
   1B45                     571 L1B45:
   1B45 60            [ 6]  572         rts
                            573 
                            574 
   1B46                     575 L1B46:
   1B46 8D 02 03      [ 4]  576         sta     transport_periph$ddr_reg_b
   1B49 A9 FA         [ 2]  577         lda     #0xFA
   1B4B 85 50         [ 3]  578         sta     0x50
                            579 
                            580 
   1B4D                     581 L1B4D:
   1B4D 20 63 1B      [ 6]  582         jsr     L1B63
   1B50 A5 50         [ 3]  583         lda     0x50
   1B52 D0 F9         [ 4]  584         bne     L1B4D
   1B54 AD 02 03      [ 4]  585         lda     transport_periph$ddr_reg_b
   1B57 29 60         [ 2]  586         and     #0x60
   1B59 D0 07         [ 4]  587         bne     L1B62
   1B5B A9 00         [ 2]  588         lda     #0x00
   1B5D 8D 02 03      [ 4]  589         sta     transport_periph$ddr_reg_b
   1B60 85 72         [ 3]  590         sta     0x72
                            591 
                            592 
   1B62                     593 L1B62:
   1B62 60            [ 6]  594         rts
                            595 
                            596 
   1B63                     597 L1B63:
   1B63 AD 05 02      [ 4]  598         lda     U18_edge_detect_control_DI_pos
   1B66 85 5C         [ 3]  599         sta     0x5C
   1B68 F0 54         [ 4]  600         beq     L1BBE
   1B6A A5 5B         [ 3]  601         lda     0x5B
   1B6C 30 0E         [ 4]  602         bmi     L1B7C
   1B6E A5 5C         [ 3]  603         lda     0x5C
   1B70 29 40         [ 2]  604         and     #0x40
   1B72 F0 16         [ 4]  605         beq     L1B8A
   1B74 A9 80         [ 2]  606         lda     #0x80
   1B76 85 5B         [ 3]  607         sta     0x5B
   1B78 A9 FA         [ 2]  608         lda     #0xFA
   1B7A 85 51         [ 3]  609         sta     0x51
                            610 
                            611 
   1B7C                     612 L1B7C:
   1B7C A5 51         [ 3]  613         lda     0x51
   1B7E D0 06         [ 4]  614         bne     L1B86
   1B80 A9 00         [ 2]  615         lda     #0x00
   1B82 85 5B         [ 3]  616         sta     0x5B
   1B84 E6 5A         [ 5]  617         inc     0x5A
                            618 
                            619 
   1B86                     620 L1B86:
   1B86 A5 5C         [ 3]  621         lda     0x5C
   1B88 10 34         [ 4]  622         bpl     L1BBE
                            623 
                            624 
   1B8A                     625 L1B8A:
   1B8A AD 04 02      [ 4]  626         lda     U18_timer
   1B8D 49 FF         [ 2]  627         eor     #0xFF
   1B8F 4A            [ 2]  628         lsr
   1B90 4A            [ 2]  629         lsr
   1B91 4A            [ 2]  630         lsr
   1B92 85 59         [ 3]  631         sta     0x59
   1B94 90 02         [ 4]  632         bcc     L1B98
   1B96 E6 59         [ 5]  633         inc     0x59
                            634 
                            635 
   1B98                     636 L1B98:
   1B98 A9 7A         [ 2]  637         lda     #0x7A
   1B9A 38            [ 2]  638         sec
   1B9B E5 59         [ 3]  639         sbc     0x59
   1B9D 8D 15 02      [ 4]  640         sta     U18_timer_8T_DI
   1BA0 C6 50         [ 5]  641         dec     0x50
   1BA2 C6 51         [ 5]  642         dec     0x51
   1BA4 C6 52         [ 5]  643         dec     0x52
   1BA6 C6 53         [ 5]  644         dec     0x53
   1BA8 D0 14         [ 4]  645         bne     L1BBE
   1BAA A9 64         [ 2]  646         lda     #0x64
   1BAC 85 53         [ 3]  647         sta     0x53
   1BAE C6 54         [ 5]  648         dec     0x54
   1BB0 C6 55         [ 5]  649         dec     0x55
   1BB2 C6 56         [ 5]  650         dec     0x56
   1BB4 C6 57         [ 5]  651         dec     0x57
   1BB6 D0 06         [ 4]  652         bne     L1BBE
   1BB8 A9 64         [ 2]  653         lda     #0x64
   1BBA 85 57         [ 3]  654         sta     0x57
   1BBC C6 58         [ 5]  655         dec     0x58
                            656 
                            657 
   1BBE                     658 L1BBE:
   1BBE 60            [ 6]  659         rts
                            660 
                            661 
   1BBF                     662 L1BBF:
   1BBF A5 62         [ 3]  663         lda     0x62
   1BC1 D0 2D         [ 4]  664         bne     L1BF0
   1BC3 AD 00 02      [ 4]  665         lda     U18_PORTA
   1BC6 49 FF         [ 2]  666         eor     #0xFF
   1BC8 29 E9         [ 2]  667         and     #0xE9
   1BCA F0 23         [ 4]  668         beq     L1BEF
   1BCC 85 63         [ 3]  669         sta     0x63
   1BCE 29 20         [ 2]  670         and     #0x20
   1BD0 F0 09         [ 4]  671         beq     L1BDB
   1BD2 4D 02 02      [ 4]  672         eor     U18_PORTB
   1BD5 8D 02 02      [ 4]  673         sta     U18_PORTB
   1BD8 4C E7 1B      [ 3]  674         jmp     L1BE7
                            675 
                            676 
   1BDB                     677 L1BDB:
   1BDB AD 02 02      [ 4]  678         lda     U18_PORTB
   1BDE 29 20         [ 2]  679         and     #0x20
   1BE0 F0 0D         [ 4]  680         beq     L1BEF
   1BE2 05 63         [ 3]  681         ora     0x63
   1BE4 8D 02 02      [ 4]  682         sta     U18_PORTB
                            683 
                            684 
   1BE7                     685 L1BE7:
   1BE7 A9 80         [ 2]  686         lda     #0x80
   1BE9 85 62         [ 3]  687         sta     0x62
   1BEB A9 14         [ 2]  688         lda     #0x14
   1BED 85 50         [ 3]  689         sta     0x50
                            690 
                            691 
   1BEF                     692 L1BEF:
   1BEF 60            [ 6]  693         rts
                            694 
                            695 
   1BF0                     696 L1BF0:
   1BF0 A5 62         [ 3]  697         lda     0x62
   1BF2 2A            [ 2]  698         rol
   1BF3 90 09         [ 4]  699         bcc     L1BFE
   1BF5 A5 50         [ 3]  700         lda     0x50
   1BF7 D0 20         [ 4]  701         bne     L1C19
   1BF9 A9 40         [ 2]  702         lda     #0x40
   1BFB 85 62         [ 3]  703         sta     0x62
   1BFD 60            [ 6]  704         rts
                            705 
                            706 
   1BFE                     707 L1BFE:
   1BFE 2A            [ 2]  708         rol
                            709 
                            710 ;        bcc     0xhh                   ; incomplete instruction
   1BFF 90                  711         .byte   0x90                    ; put first byte here
                            712 
                            713 ; Symbols out of range
                     1C19   714 L1C19   =       0x1C19
