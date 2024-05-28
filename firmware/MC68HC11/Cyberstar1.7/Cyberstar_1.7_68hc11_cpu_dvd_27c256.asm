8000: 7e 80 50     jmp (0x8050)
8003: 43           coma
8004: 6f 70        clr (X+0x70)
8006: 79 72 69     rol (0x7269)
8009: 67 68        asr (X+0x68)
800b: 74 20 28     lsr (0x2028)
800e: 63 29        com (X+0x29)
8010: 20 31        bra [0x8043]
8012: 39           rts
8013: 39           rts
8014: 33           pulb
8015: 20 62        bra [0x8079]
8017: 79 20 44     rol (0x2044)
801a: 61           ?
801b: 76 69 64     ror (0x6964)
801e: 20 42        bra [0x8062]
8020: 2e 20        bgt [0x8042]
8022: 50           negb
8023: 68 69        asl (X+0x69)
8025: 6c 69        inc (X+0x69)
8027: 70 73 65     neg (0x7365)
802a: 6e 20        jmp (X+0x20)
802c: 4c           inca
802d: 69 63        rol (X+0x63)
802f: 65           ?
8030: 6e 73        jmp (X+0x73)
8032: 65           ?
8033: 64 20        lsr (X+0x20)
8035: 62           ?
8036: 79 20 53     rol (0x2053)
8039: 68 6f        asl (X+0x6F)
803b: 77 42 69     asr (0x4269)
803e: 7a 20 50     dec (0x2050)
8041: 69 7a        rol (X+0x7A)
8043: 7a 61 20     dec (0x6120)
8046: 54           lsrb
8047: 69 6d        rol (X+0x6D)
8049: 65           ?
804a: 2c 20        bge [0x806C]
804c: 49           rola
804d: 6e 63        jmp (X+0x63)
804f: 2e 0f        bgt [0x8060]
8051: fc 04 26     ldd (0x0426)
8054: c3 00 01     addd 0x0001
8057: fd 04 26     std (0x0426)
805a: ce ad 5a     ldx 0xAD5A
805d: ff 01 ce     stx (0x01CE)
8060: 7f 01 c7     clr (0x01C7)
8063: cc 01 c6     ldd 0x01C6
8066: fd 01 3e     std (0x013E)
8069: 7f 00 b0     clr (0x00B0)
806c: 7f 00 4e     clr (0x004E)
806f: 7f 00 b6     clr (0x00B6)
8072: 7f 00 4d     clr (0x004D)
8075: 86 03        ldaa 0x03
8077: b7 10 a8     staa (0x10A8)
807a: 18 ce 00 80  ldy 0x0080
807e: 18 09        dey
8080: 26 fc        bne [0x807E]
8082: 86 11        ldaa 0x11
8084: b7 10 a8     staa (0x10A8)
8087: c6 10        ldab 0x10
8089: bd fa c9     jsr (0xFAC9)
808c: b6 18 04     ldaa (0x1804)
808f: 84 bf        anda 0xBF
8091: b7 18 04     staa (0x1804)
8094: 86 ff        ldaa 0xFF
8096: 97 ac        staa (0x00AC)
8098: bd 86 d4     jsr (0x86D4)
809b: bd 99 b6     jsr (0x99B6)
809e: bd 8c 4c     jsr (0x8C4C)
80a1: bd 87 f8     jsr (0x87F8)
80a4: bd 87 cc     jsr (0x87CC)
80a7: bd 8c 8e     jsr (0x8C8E)
80aa: bd 8d 39     jsr (0x8D39)
80ad: bd 8b d0     jsr (0x8BD0)
80b0: bd 8b fe     jsr (0x8BFE)
80b3: 0e           cli
80b4: bd a2 9b     jsr (0xA29B)
80b7: b6 04 0f     ldaa (0x040F)
80ba: 81 01        cmpa 0x01
80bc: 26 03        bne [0x80C1]
80be: 7e a2 b2     jmp (0xA2B2)
80c1: fc 04 0b     ldd (0x040B)
80c4: 1a 83 19 7b  cpd 0x197B
80c8: 26 4c        bne [0x8116]
80ca: 5f           clrb
80cb: d7 62        stab (0x0062)
80cd: bd fa f9     jsr (0xFAF9)
80d0: bd a3 7e     jsr (0xA37E)
80d3: b6 04 00     ldaa (0x0400)
80d6: 81 08        cmpa 0x08
80d8: 27 3f        beq [0x8119]
80da: 25 29        bcs [0x8105]
80dc: 81 07        cmpa 0x07
80de: 27 25        beq [0x8105]
80e0: cc 00 00     ldd 0x0000
80e3: fd 04 0d     std (0x040D)
80e6: cc 00 c8     ldd 0x00C8
80e9: dd 1b        std (0x001B)
80eb: dc 1b        ldd (0x001B)
80ed: 27 0b        beq [0x80FA]
80ef: bd fa 79     jsr (0xFA79)
80f2: 24 f7        bcc [0x80EB]
80f4: 81 44        cmpa 0x44
80f6: 26 f3        bne [0x80EB]
80f8: 20 05        bra [0x80FF]
80fa: bd 9f 5b     jsr (0x9F5B)
80fd: 25 17        bcs [0x8116]
80ff: bd 9e ec     jsr (0x9EEC)
8102: bd 9e cf     jsr (0x9ECF)
8105: 86 39        ldaa 0x39
8107: b7 04 08     staa (0x0408)
810a: bd a2 12     jsr (0xA212)
810d: b6 f7 c0     ldaa (0xF7C0)
8110: b7 04 5c     staa (0x045C)
8113: 7e f8 00     jmp (0xF800)
8116: 7e 81 16     jmp (0x8116)
8119: 7f 00 79     clr (0x0079)
811c: 7f 00 7c     clr (0x007C)
811f: bd 04 08     jsr (0x0408)
8122: bd 80 13     jsr (0x8013)
8125: c6 fd        ldab 0xFD
8127: bd 86 f7     jsr (0x86F7)
812a: c6 df        ldab 0xDF
812c: bd 87 58     jsr (0x8758)
812f: bd 87 a1     jsr (0x87A1)
8132: bd 9b 07     jsr (0x9B07)
8135: bd 9c 61     jsr (0x9C61)
8138: 7f 00 62     clr (0x0062)
813b: bd 99 e9     jsr (0x99E9)
813e: 24 16        bcc [0x8156]
8140: bd 8d f4     jsr (0x8DF4)
8143: 49           rola
8144: 6e 76        jmp (X+0x76)
8146: 61           ?
8147: 6c 69        inc (X+0x69)
8149: 64 20        lsr (X+0x20)
814b: 43           coma
814c: 50           negb
814d: 55           ?
814e: a1 86        cmpa (X+0x86)
8150: 53           comb
8151: 7e 82 ad     jmp (0x82AD)
8154: 20 fe        bra [0x8154]
8156: bd a3 91     jsr (0xA391)
8159: 7f 00 aa     clr (0x00AA)
815c: 7d 00 00     tst (0x0000)
815f: 27 15        beq [0x8176]
8161: bd 8d f4     jsr (0x8DF4)
8164: 52           ?
8165: 41           ?
8166: 4d           tsta
8167: 20 74        bra [0x81DD]
8169: 65           ?
816a: 73 74 20     com (0x7420)
816d: 66 61        ror (X+0x61)
816f: 69 6c        rol (X+0x6C)
8171: 65           ?
8172: 64 a1        lsr (X+0xA1)
8174: 20 44        bra [0x81BA]
8176: bd 8d f4     jsr (0x8DF4)
8179: 33           pulb
817a: 32           pula
817b: 4b           ?
817c: 20 52        bra [0x81D0]
817e: 41           ?
817f: 4d           tsta
8180: 20 4f        bra [0x81D1]
8182: cb 7d        addb 0x7D
8184: 04           lsrd
8185: 5c           incb
8186: 26 08        bne [0x8190]
8188: cc 52 0f     ldd 0x520F
818b: bd 8d c5     jsr (0x8DC5)
818e: 20 06        bra [0x8196]
8190: cc 43 0f     ldd 0x430F
8193: bd 8d c5     jsr (0x8DC5)
8196: bd 8d ed     jsr (0x8DED)
8199: 52           ?
819a: 4f           clra
819b: 4d           tsta
819c: 20 43        bra [0x81E1]
819e: 68 6b        asl (X+0x6B)
81a0: 73 75 6d     com (0x756D)
81a3: bd bd 97     jsr (0xBD97)
81a6: 6f c6        clr (X+0xC6)
81a8: 02           idiv
81a9: bd 8c 12     jsr (0x8C12)
81ac: bd 9a 37     jsr (0x9A37)
81af: bd 9f 09     jsr (0x9F09)
81b2: bd 9b 29     jsr (0x9B29)
81b5: c6 02        ldab 0x02
81b7: bd 8c 12     jsr (0x8C12)
81ba: f6 10 2d     ldab (0x102D)
81bd: c4 df        andb 0xDF
81bf: f7 10 2d     stab (0x102D)
81c2: bd 9b 07     jsr (0x9B07)
81c5: c6 fd        ldab 0xFD
81c7: bd 86 f7     jsr (0x86F7)
81ca: bd 87 a1     jsr (0x87A1)
81cd: c6 00        ldab 0x00
81cf: d7 62        stab (0x0062)
81d1: bd fa f9     jsr (0xFAF9)
81d4: bd 8d f4     jsr (0x8DF4)
81d7: 20 43        bra [0x821C]
81d9: 79 62 65     rol (0x6265)
81dc: 72           ?
81dd: 73 74 61     com (0x7461)
81e0: 72           ?
81e1: 20 76        bra [0x8259]
81e3: 31           ins
81e4: 2e b7        bgt [0x819D]
81e6: bd a3 1c     jsr (0xA31C)
81e9: 24 11        bcc [0x81FC]
81eb: cc 52 0f     ldd 0x520F
81ee: bd 8d c5     jsr (0x8DC5)
81f1: 7d 04 2a     tst (0x042A)
81f4: 27 06        beq [0x81FC]
81f6: cc 4b 0f     ldd 0x4B0F
81f9: bd 8d c5     jsr (0x8DC5)
81fc: bd 8d 13     jsr (0x8D13)
81ff: fc 02 9c     ldd (0x029C)
8202: 1a 83 00 01  cpd 0x0001
8206: 26 15        bne [0x821D]
8208: bd 8d ed     jsr (0x8DED)
820b: 20 44        bra [0x8251]
820d: 61           ?
820e: 76 65 27     ror (0x6527)
8211: 73 20 73     com (0x2073)
8214: 79 73 74     rol (0x7374)
8217: 65           ?
8218: 6d 20        tst (X+0x20)
821a: a0 20        suba (X+0x20)
821c: 47           asra
821d: 1a 83 03 e8  cpd 0x03E8
8221: 2d 1b        blt [0x823E]
8223: 1a 83 04 4b  cpd 0x044B
8227: 22 15        bhi [0x823E]
8229: bd 8d ed     jsr (0x8DED)
822c: 20 20        bra [0x824E]
822e: 20 53        bra [0x8283]
8230: 50           negb
8231: 54           lsrb
8232: 20 53        bra [0x8287]
8234: 74 75 64     lsr (0x7564)
8237: 69 6f        rol (X+0x6F)
8239: 20 20        bra [0x825B]
823b: a0 20        suba (X+0x20)
823d: 26 cc        bne [0x820B]
823f: 0e           cli
8240: 0c           clc
8241: dd ad        std (0x00AD)
8243: fc 04 0d     ldd (0x040D)
8246: 1a 83 02 58  cpd 0x0258
824a: 22 05        bhi [0x8251]
824c: cc 0e 09     ldd 0x0E09
824f: dd ad        std (0x00AD)
8251: c6 29        ldab 0x29
8253: ce 0e 00     ldx 0x0E00
8256: a6 00        ldaa (X+0x00)
8258: 4a           deca
8259: 08           inx
825a: 5c           incb
825b: 3c           pshx
825c: bd 8d c5     jsr (0x8DC5)
825f: 38           pulx
8260: 9c ad        cpx (0x00AD)
8262: 26 f2        bne [0x8256]
8264: bd 9c 61     jsr (0x9C61)
8267: 7f 00 5b     clr (0x005B)
826a: 7f 00 5a     clr (0x005A)
826d: 7f 00 5e     clr (0x005E)
8270: 7f 00 60     clr (0x0060)
8273: bd 9b 29     jsr (0x9B29)
8276: 96 60        ldaa (0x0060)
8278: 27 06        beq [0x8280]
827a: bd a9 b9     jsr (0xA9B9)
827d: 7e f8 00     jmp (0xF800)
8280: bd 9d 01     jsr (0x9D01)
8283: c6 32        ldab 0x32
8285: bd 8c 32     jsr (0x8C32)
8288: bd 9d 28     jsr (0x9D28)
828b: cc 01 2c     ldd 0x012C
828e: dd 23        std (0x0023)
8290: bd 9b 29     jsr (0x9B29)
8293: dc 23        ldd (0x0023)
8295: 1a 83 00 00  cpd 0x0000
8299: 27 0a        beq [0x82A5]
829b: bd 8e a5     jsr (0x8EA5)
829e: 81 0d        cmpa 0x0D
82a0: 26 ee        bne [0x8290]
82a2: 7e 92 a2     jmp (0x92A2)
82a5: bd fa 79     jsr (0xFA79)
82a8: 25 03        bcs [0x82AD]
82aa: 7e 83 3c     jmp (0x833C)
82ad: 81 44        cmpa 0x44
82af: 26 03        bne [0x82B4]
82b1: 7e a3 a3     jmp (0xA3A3)
82b4: 81 53        cmpa 0x53
82b6: 26 f2        bne [0x82AA]
82b8: bd fb 0c     jsr (0xFB0C)
82bb: 0a           clv
82bc: 0d           sec
82bd: 45           ?
82be: 6e 74        jmp (X+0x74)
82c0: 65           ?
82c1: 72           ?
82c2: 20 73        bra [0x8337]
82c4: 65           ?
82c5: 63 75        com (X+0x75)
82c7: 72           ?
82c8: 69 74        rol (X+0x74)
82ca: 79 20 63     rol (0x2063)
82cd: 6f 64        clr (X+0x64)
82cf: 65           ?
82d0: 3a           abx
82d1: a0 0f        suba (X+0x0F)
82d3: bd a3 27     jsr (0xA327)
82d6: 0e           cli
82d7: 25 61        bcs [0x833A]
82d9: bd fb 0c     jsr (0xFB0C)
82dc: 0a           clv
82dd: 0d           sec
82de: 45           ?
82df: 45           ?
82e0: 50           negb
82e1: 52           ?
82e2: 4f           clra
82e3: 4d           tsta
82e4: 20 73        bra [0x8359]
82e6: 65           ?
82e7: 72           ?
82e8: 69 61        rol (X+0x61)
82ea: 6c 20        inc (X+0x20)
82ec: 6e 75        jmp (X+0x75)
82ee: 6d 62        tst (X+0x62)
82f0: 65           ?
82f1: 72           ?
82f2: 20 70        bra [0x8364]
82f4: 72           ?
82f5: 6f 67        clr (X+0x67)
82f7: 72           ?
82f8: 61           ?
82f9: 6d 6d        tst (X+0x6D)
82fb: 69 6e        rol (X+0x6E)
82fd: 67 20        asr (X+0x20)
82ff: 65           ?
8300: 6e 61        jmp (X+0x61)
8302: 62           ?
8303: 6c 65        inc (X+0x65)
8305: 64 2e        lsr (X+0x2E)
8307: 0a           clv
8308: 0d           sec
8309: 50           negb
830a: 6c 65        inc (X+0x65)
830c: 61           ?
830d: 73 65 20     com (0x6520)
8310: 52           ?
8311: 45           ?
8312: 53           comb
8313: 45           ?
8314: 54           lsrb
8315: 20 74        bra [0x838B]
8317: 68 65        asl (X+0x65)
8319: 20 70        bra [0x838B]
831b: 72           ?
831c: 6f 63        clr (X+0x63)
831e: 65           ?
831f: 73 73 6f     com (0x736F)
8322: 72           ?
8323: 20 74        bra [0x8399]
8325: 6f 20        clr (X+0x20)
8327: 63 6f        com (X+0x6F)
8329: 6e 74        jmp (X+0x74)
832b: 69 6e        rol (X+0x6E)
832d: 75           ?
832e: 65           ?
832f: 0a           clv
8330: 8d 86        bsr [0x82B8]
8332: 01           nop
8333: b7 04 0f     staa (0x040F)
8336: 86 db        ldaa 0xDB
8338: 97 07        staa (0x0007)
833a: 20 fe        bra [0x833A]
833c: 96 aa        ldaa (0x00AA)
833e: 27 12        beq [0x8352]
8340: dc 1b        ldd (0x001B)
8342: 26 0e        bne [0x8352]
8344: d6 62        ldab (0x0062)
8346: c8 20        eorb 0x20
8348: d7 62        stab (0x0062)
834a: bd fa f9     jsr (0xFAF9)
834d: cc 00 32     ldd 0x0032
8350: dd 1b        std (0x001B)
8352: bd 86 b2     jsr (0x86B2)
8355: 24 03        bcc [0x835A]
8357: 7e 82 73     jmp (0x8273)
835a: f6 10 2d     ldab (0x102D)
835d: ca 20        orab 0x20
835f: f7 10 2d     stab (0x102D)
8362: 7f 00 aa     clr (0x00AA)
8365: d6 62        ldab (0x0062)
8367: c4 df        andb 0xDF
8369: d7 62        stab (0x0062)
836b: bd fa f9     jsr (0xFAF9)
836e: c6 02        ldab 0x02
8370: bd 8c 12     jsr (0x8C12)
8373: 96 7c        ldaa (0x007C)
8375: 27 2d        beq [0x83A4]
8377: 96 7f        ldaa (0x007F)
8379: 97 4e        staa (0x004E)
837b: d6 81        ldab (0x0081)
837d: bd 87 58     jsr (0x8758)
8380: 96 82        ldaa (0x0082)
8382: 85 01        bita 0x01
8384: 26 06        bne [0x838C]
8386: 96 ac        ldaa (0x00AC)
8388: 84 fd        anda 0xFD
838a: 20 04        bra [0x8390]
838c: 96 ac        ldaa (0x00AC)
838e: 8a 02        oraa 0x02
8390: 97 ac        staa (0x00AC)
8392: b7 18 06     staa (0x1806)
8395: b6 18 04     ldaa (0x1804)
8398: 8a 20        oraa 0x20
839a: b7 18 04     staa (0x1804)
839d: 84 df        anda 0xDF
839f: b7 18 04     staa (0x1804)
83a2: 20 14        bra [0x83B8]
83a4: fc 04 0d     ldd (0x040D)
83a7: 1a 83 fd e8  cpd 0xFDE8
83ab: 22 06        bhi [0x83B3]
83ad: c3 00 01     addd 0x0001
83b0: fd 04 0d     std (0x040D)
83b3: c6 f7        ldab 0xF7
83b5: bd 86 f7     jsr (0x86F7)
83b8: 7f 00 30     clr (0x0030)
83bb: 7f 00 31     clr (0x0031)
83be: 7f 00 32     clr (0x0032)
83c1: bd 9b 29     jsr (0x9B29)
83c4: bd 86 b2     jsr (0x86B2)
83c7: 25 ef        bcs [0x83B8]
83c9: 96 79        ldaa (0x0079)
83cb: 27 17        beq [0x83E4]
83cd: 7f 00 79     clr (0x0079)
83d0: 96 b5        ldaa (0x00B5)
83d2: 81 01        cmpa 0x01
83d4: 26 07        bne [0x83DD]
83d6: 7f 00 b5     clr (0x00B5)
83d9: 86 01        ldaa 0x01
83db: 97 7c        staa (0x007C)
83dd: 86 01        ldaa 0x01
83df: 97 aa        staa (0x00AA)
83e1: 7e 9a 8f     jmp (0x9A8F)
83e4: bd 8d f4     jsr (0x8DF4)
83e7: 20 20        bra [0x8409]
83e9: 20 44        bra [0x842F]
83eb: 56           rorb
83ec: 44           lsra
83ed: 20 20        bra [0x840F]
83ef: 64 61        lsr (X+0x61)
83f1: 74 61 20     lsr (0x6120)
83f4: 20 20        bra [0x8416]
83f6: a0 d6        suba (X+0xD6)
83f8: 62           ?
83f9: ca 80        orab 0x80
83fb: d7 62        stab (0x0062)
83fd: bd fa f9     jsr (0xFAF9)
8400: c6 fb        ldab 0xFB
8402: bd 86 f7     jsr (0x86F7)
8405: bd 8d df     jsr (0x8DDF)
8408: 36           psha
8409: 38           pulx
840a: 48           asla
840b: 43           coma
840c: 31           ins
840d: 31           ins
840e: 20 50        bra [0x8460]
8410: 72           ?
8411: 6f 74        clr (X+0x74)
8413: ef bd        stx (X+0xBD)
8415: 8d e6        bsr [0x83FD]
8417: 64 62        lsr (X+0x62)
8419: f0 c6 03     subb (0xC603)
841c: bd 8c 12     jsr (0x8C12)
841f: 7d 00 7c     tst (0x007C)
8422: 27 15        beq [0x8439]
8424: d6 80        ldab (0x0080)
8426: d7 62        stab (0x0062)
8428: bd fa f9     jsr (0xFAF9)
842b: d6 7d        ldab (0x007D)
842d: d7 78        stab (0x0078)
842f: d6 7e        ldab (0x007E)
8431: f7 10 8a     stab (0x108A)
8434: 7f 00 7c     clr (0x007C)
8437: 20 1d        bra [0x8456]
8439: bd 8d 13     jsr (0x8D13)
843c: bd 9d 4f     jsr (0x9D4F)
843f: 24 08        bcc [0x8449]
8441: 7d 00 b8     tst (0x00B8)
8444: 27 f3        beq [0x8439]
8446: 7e 9a 70     jmp (0x9A70)
8449: 7d 00 b8     tst (0x00B8)
844c: 27 eb        beq [0x8439]
844e: 7f 00 30     clr (0x0030)
8451: 7f 00 31     clr (0x0031)
8454: 20 00        bra [0x8456]
8456: 96 49        ldaa (0x0049)
8458: 26 03        bne [0x845D]
845a: 7e 85 ad     jmp (0x85AD)
845d: 7f 00 49     clr (0x0049)
8460: 81 31        cmpa 0x31
8462: 26 08        bne [0x846C]
8464: bd a3 63     jsr (0xA363)
8467: bd 8d 52     jsr (0x8D52)
846a: 20 ea        bra [0x8456]
846c: 81 32        cmpa 0x32
846e: 26 08        bne [0x8478]
8470: bd a3 63     jsr (0xA363)
8473: bd 8d 45     jsr (0x8D45)
8476: 20 de        bra [0x8456]
8478: 81 54        cmpa 0x54
847a: 26 08        bne [0x8484]
847c: bd a3 63     jsr (0xA363)
847f: bd 8d 52     jsr (0x8D52)
8482: 20 d2        bra [0x8456]
8484: 81 5a        cmpa 0x5A
8486: 26 1c        bne [0x84A4]
8488: bd a3 5b     jsr (0xA35B)
848b: bd 8e a5     jsr (0x8EA5)
848e: 7f 00 32     clr (0x0032)
8491: 7f 00 31     clr (0x0031)
8494: 7f 00 30     clr (0x0030)
8497: bd 99 b6     jsr (0x99B6)
849a: d6 7b        ldab (0x007B)
849c: ca 0c        orab 0x0C
849e: bd 87 58     jsr (0x8758)
84a1: 7e 81 ba     jmp (0x81BA)
84a4: 81 42        cmpa 0x42
84a6: 26 03        bne [0x84AB]
84a8: 7e 98 4c     jmp (0x984C)
84ab: 81 4d        cmpa 0x4D
84ad: 26 03        bne [0x84B2]
84af: 7e 98 34     jmp (0x9834)
84b2: 81 45        cmpa 0x45
84b4: 26 03        bne [0x84B9]
84b6: 7e 98 12     jmp (0x9812)
84b9: 81 58        cmpa 0x58
84bb: 26 05        bne [0x84C2]
84bd: 7e 99 4f     jmp (0x994F)
84c0: 20 94        bra [0x8456]
84c2: 81 46        cmpa 0x46
84c4: 26 03        bne [0x84C9]
84c6: 7e 99 81     jmp (0x9981)
84c9: 81 47        cmpa 0x47
84cb: 26 03        bne [0x84D0]
84cd: 7e 99 8b     jmp (0x998B)
84d0: 81 48        cmpa 0x48
84d2: 26 03        bne [0x84D7]
84d4: 7e 99 95     jmp (0x9995)
84d7: 81 49        cmpa 0x49
84d9: 26 03        bne [0x84DE]
84db: 7e 99 9f     jmp (0x999F)
84de: 81 53        cmpa 0x53
84e0: 26 03        bne [0x84E5]
84e2: 7e 97 ca     jmp (0x97CA)
84e5: 81 59        cmpa 0x59
84e7: 26 03        bne [0x84EC]
84e9: 7e 99 e2     jmp (0x99E2)
84ec: 81 57        cmpa 0x57
84ee: 26 03        bne [0x84F3]
84f0: 7e 9a b4     jmp (0x9AB4)
84f3: 81 41        cmpa 0x41
84f5: 26 17        bne [0x850E]
84f7: bd 9d 4f     jsr (0x9D4F)
84fa: 25 09        bcs [0x8505]
84fc: 7f 00 30     clr (0x0030)
84ff: 7f 00 31     clr (0x0031)
8502: 7e 85 ad     jmp (0x85AD)
8505: 7f 00 30     clr (0x0030)
8508: 7f 00 31     clr (0x0031)
850b: 7e 9a 8f     jmp (0x9A8F)
850e: 81 4b        cmpa 0x4B
8510: 26 0b        bne [0x851D]
8512: bd 9d 4f     jsr (0x9D4F)
8515: 25 03        bcs [0x851A]
8517: 7e 85 ad     jmp (0x85AD)
851a: 7e 9a 8f     jmp (0x9A8F)
851d: 81 4a        cmpa 0x4A
851f: 26 07        bne [0x8528]
8521: 86 01        ldaa 0x01
8523: 97 af        staa (0x00AF)
8525: 7e 98 4c     jmp (0x984C)
8528: 81 4e        cmpa 0x4E
852a: 26 0b        bne [0x8537]
852c: b6 10 8a     ldaa (0x108A)
852f: 8a 02        oraa 0x02
8531: b7 10 8a     staa (0x108A)
8534: 7e 84 56     jmp (0x8456)
8537: 81 4f        cmpa 0x4F
8539: 26 06        bne [0x8541]
853b: bd 9d 4f     jsr (0x9D4F)
853e: 7e 84 56     jmp (0x8456)
8541: 81 50        cmpa 0x50
8543: 26 06        bne [0x854B]
8545: bd 9d 4f     jsr (0x9D4F)
8548: 7e 84 56     jmp (0x8456)
854b: 81 51        cmpa 0x51
854d: 26 0b        bne [0x855A]
854f: b6 10 8a     ldaa (0x108A)
8552: 8a 04        oraa 0x04
8554: b7 10 8a     staa (0x108A)
8557: 7e 84 56     jmp (0x8456)
855a: 81 55        cmpa 0x55
855c: 26 07        bne [0x8565]
855e: c6 01        ldab 0x01
8560: d7 b6        stab (0x00B6)
8562: 7e 84 56     jmp (0x8456)
8565: 81 4c        cmpa 0x4C
8567: 26 19        bne [0x8582]
8569: 7f 00 49     clr (0x0049)
856c: bd 9d 4f     jsr (0x9D4F)
856f: 25 0e        bcs [0x857F]
8571: bd ab 25     jsr (0xAB25)
8574: bd ab 93     jsr (0xAB93)
8577: 24 06        bcc [0x857F]
8579: bd ab 62     jsr (0xAB62)
857c: bd ab 83     jsr (0xAB83)
857f: 7e 84 56     jmp (0x8456)
8582: 81 52        cmpa 0x52
8584: 26 1a        bne [0x85A0]
8586: 7f 00 49     clr (0x0049)
8589: bd 9d 4f     jsr (0x9D4F)
858c: 25 0f        bcs [0x859D]
858e: bd ab 25     jsr (0xAB25)
8591: bd ab 93     jsr (0xAB93)
8594: 25 07        bcs [0x859D]
8596: 86 ff        ldaa 0xFF
8598: a7 00        staa (X+0x00)
859a: bd ab 25     jsr (0xAB25)
859d: 7e 84 56     jmp (0x8456)
85a0: 81 44        cmpa 0x44
85a2: 26 09        bne [0x85AD]
85a4: 7f 00 49     clr (0x0049)
85a7: bd ab eb     jsr (0xABEB)
85aa: 7e 84 56     jmp (0x8456)
85ad: 7d 00 75     tst (0x0075)
85b0: 26 56        bne [0x8608]
85b2: 7d 00 79     tst (0x0079)
85b5: 26 51        bne [0x8608]
85b7: 7d 00 30     tst (0x0030)
85ba: 26 07        bne [0x85C3]
85bc: 96 5b        ldaa (0x005B)
85be: 27 48        beq [0x8608]
85c0: 7f 00 5b     clr (0x005B)
85c3: cc 00 64     ldd 0x0064
85c6: dd 23        std (0x0023)
85c8: dc 23        ldd (0x0023)
85ca: 27 14        beq [0x85E0]
85cc: bd 9b 29     jsr (0x9B29)
85cf: b6 18 04     ldaa (0x1804)
85d2: 88 ff        eora 0xFF
85d4: 84 06        anda 0x06
85d6: 81 06        cmpa 0x06
85d8: 26 ee        bne [0x85C8]
85da: 7f 00 30     clr (0x0030)
85dd: 7e 86 89     jmp (0x8689)
85e0: 7f 00 30     clr (0x0030)
85e3: d6 62        ldab (0x0062)
85e5: c8 02        eorb 0x02
85e7: d7 62        stab (0x0062)
85e9: bd fa f9     jsr (0xFAF9)
85ec: c4 02        andb 0x02
85ee: 27 0d        beq [0x85FD]
85f0: bd aa 55     jsr (0xAA55)
85f3: c6 1e        ldab 0x1E
85f5: bd 8c 32     jsr (0x8C32)
85f8: 7f 00 30     clr (0x0030)
85fb: 20 0b        bra [0x8608]
85fd: bd aa 5a     jsr (0xAA5A)
8600: c6 1e        ldab 0x1E
8602: bd 8c 32     jsr (0x8C32)
8605: 7f 00 30     clr (0x0030)
8608: bd 9b 29     jsr (0x9B29)
860b: b6 10 0a     ldaa (0x100A)
860e: 84 10        anda 0x10
8610: 27 0b        beq [0x861D]
8612: b6 18 04     ldaa (0x1804)
8615: 88 ff        eora 0xFF
8617: 84 07        anda 0x07
8619: 81 06        cmpa 0x06
861b: 26 1c        bne [0x8639]
861d: 7d 00 76     tst (0x0076)
8620: 26 17        bne [0x8639]
8622: 7d 00 75     tst (0x0075)
8625: 26 12        bne [0x8639]
8627: d6 62        ldab (0x0062)
8629: c4 fc        andb 0xFC
862b: d7 62        stab (0x0062)
862d: bd fa f9     jsr (0xFAF9)
8630: bd aa 50     jsr (0xAA50)
8633: bd aa 5a     jsr (0xAA5A)
8636: 7e 9a 70     jmp (0x9A70)
8639: 7d 00 31     tst (0x0031)
863c: 26 07        bne [0x8645]
863e: 96 5a        ldaa (0x005A)
8640: 27 47        beq [0x8689]
8642: 7f 00 5a     clr (0x005A)
8645: cc 00 64     ldd 0x0064
8648: dd 23        std (0x0023)
864a: dc 23        ldd (0x0023)
864c: 27 13        beq [0x8661]
864e: bd 9b 29     jsr (0x9B29)
8651: b6 18 04     ldaa (0x1804)
8654: 88 ff        eora 0xFF
8656: 84 06        anda 0x06
8658: 81 06        cmpa 0x06
865a: 26 ee        bne [0x864A]
865c: 7f 00 31     clr (0x0031)
865f: 20 28        bra [0x8689]
8661: 7f 00 31     clr (0x0031)
8664: d6 62        ldab (0x0062)
8666: c8 01        eorb 0x01
8668: d7 62        stab (0x0062)
866a: bd fa f9     jsr (0xFAF9)
866d: c4 01        andb 0x01
866f: 27 0d        beq [0x867E]
8671: bd aa 49     jsr (0xAA49)
8674: c6 1e        ldab 0x1E
8676: bd 8c 32     jsr (0x8C32)
8679: 7f 00 31     clr (0x0031)
867c: 20 0b        bra [0x8689]
867e: bd aa 50     jsr (0xAA50)
8681: c6 1e        ldab 0x1E
8683: bd 8c 32     jsr (0x8C32)
8686: 7f 00 31     clr (0x0031)
8689: 20 24        bra [0x86AF]
868b: bd 86 b2     jsr (0x86B2)
868e: 25 1f        bcs [0x86AF]
8690: 7e 86 af     jmp (0x86AF)
8693: 7f 00 4e     clr (0x004E)
8696: bd 99 b6     jsr (0x99B6)
8699: bd 86 d4     jsr (0x86D4)
869c: 5f           clrb
869d: d7 62        stab (0x0062)
869f: bd fa f9     jsr (0xFAF9)
86a2: c6 fd        ldab 0xFD
86a4: bd 86 f7     jsr (0x86F7)
86a7: c6 04        ldab 0x04
86a9: bd 8c 12     jsr (0x8C12)
86ac: 7e 84 88     jmp (0x8488)
86af: 7e 84 56     jmp (0x8456)
86b2: bd 9b 29     jsr (0x9B29)
86b5: 7f 00 23     clr (0x0023)
86b8: 86 19        ldaa 0x19
86ba: 97 24        staa (0x0024)
86bc: 0c           clc
86bd: 39           rts
86be: b6 10 0a     ldaa (0x100A)
86c1: 84 80        anda 0x80
86c3: 27 02        beq [0x86C7]
86c5: 0d           sec
86c6: 39           rts
86c7: b6 10 0a     ldaa (0x100A)
86ca: 84 80        anda 0x80
86cc: 26 f7        bne [0x86C5]
86ce: 96 24        ldaa (0x0024)
86d0: 26 f5        bne [0x86C7]
86d2: 0c           clc
86d3: 39           rts
86d4: ce 10 80     ldx 0x1080
86d7: 86 30        ldaa 0x30
86d9: a7 01        staa (X+0x01)
86db: a7 03        staa (X+0x03)
86dd: 86 ff        ldaa 0xFF
86df: a7 00        staa (X+0x00)
86e1: a7 02        staa (X+0x02)
86e3: 86 34        ldaa 0x34
86e5: a7 01        staa (X+0x01)
86e7: a7 03        staa (X+0x03)
86e9: 6f 00        clr (X+0x00)
86eb: 6f 02        clr (X+0x02)
86ed: 08           inx
86ee: 08           inx
86ef: 08           inx
86f0: 08           inx
86f1: 8c 10 a4     cpx 0x10A4
86f4: 2f e1        ble [0x86D7]
86f6: 39           rts
86f7: 36           psha
86f8: bd 9b 29     jsr (0x9B29)
86fb: 96 ac        ldaa (0x00AC)
86fd: c1 fb        cmpb 0xFB
86ff: 26 04        bne [0x8705]
8701: 84 fe        anda 0xFE
8703: 20 0e        bra [0x8713]
8705: c1 f7        cmpb 0xF7
8707: 26 04        bne [0x870D]
8709: 84 bf        anda 0xBF
870b: 20 06        bra [0x8713]
870d: c1 fd        cmpb 0xFD
870f: 26 02        bne [0x8713]
8711: 84 f7        anda 0xF7
8713: 97 ac        staa (0x00AC)
8715: b7 18 06     staa (0x1806)
8718: bd 87 4a     jsr (0x874A)
871b: 96 7a        ldaa (0x007A)
871d: 84 01        anda 0x01
871f: 97 7a        staa (0x007A)
8721: c4 fe        andb 0xFE
8723: da 7a        orab (0x007A)
8725: f7 18 06     stab (0x1806)
8728: bd 87 85     jsr (0x8785)
872b: c6 32        ldab 0x32
872d: bd 8c 32     jsr (0x8C32)
8730: c6 fe        ldab 0xFE
8732: da 7a        orab (0x007A)
8734: f7 18 06     stab (0x1806)
8737: d7 7a        stab (0x007A)
8739: bd 87 85     jsr (0x8785)
873c: 96 ac        ldaa (0x00AC)
873e: 8a 49        oraa 0x49
8740: 97 ac        staa (0x00AC)
8742: b7 18 06     staa (0x1806)
8745: bd 87 4a     jsr (0x874A)
8748: 32           pula
8749: 39           rts
874a: b6 18 04     ldaa (0x1804)
874d: 8a 20        oraa 0x20
874f: b7 18 04     staa (0x1804)
8752: 84 df        anda 0xDF
8754: b7 18 04     staa (0x1804)
8757: 39           rts
8758: 36           psha
8759: 37           pshb
875a: 96 ac        ldaa (0x00AC)
875c: 8a 30        oraa 0x30
875e: 84 fd        anda 0xFD
8760: c5 20        bitb 0x20
8762: 26 02        bne [0x8766]
8764: 8a 02        oraa 0x02
8766: c5 04        bitb 0x04
8768: 26 02        bne [0x876C]
876a: 84 ef        anda 0xEF
876c: c5 08        bitb 0x08
876e: 26 02        bne [0x8772]
8770: 84 df        anda 0xDF
8772: b7 18 06     staa (0x1806)
8775: 97 ac        staa (0x00AC)
8777: bd 87 4a     jsr (0x874A)
877a: 33           pulb
877b: f7 18 06     stab (0x1806)
877e: d7 7b        stab (0x007B)
8780: bd 87 93     jsr (0x8793)
8783: 32           pula
8784: 39           rts
8785: b6 18 07     ldaa (0x1807)
8788: 8a 38        oraa 0x38
878a: b7 18 07     staa (0x1807)
878d: 84 f7        anda 0xF7
878f: b7 18 07     staa (0x1807)
8792: 39           rts
8793: b6 18 05     ldaa (0x1805)
8796: 8a 38        oraa 0x38
8798: b7 18 05     staa (0x1805)
879b: 84 f7        anda 0xF7
879d: b7 18 05     staa (0x1805)
87a0: 39           rts
87a1: 96 7a        ldaa (0x007A)
87a3: 84 fe        anda 0xFE
87a5: 36           psha
87a6: 96 ac        ldaa (0x00AC)
87a8: 8a 04        oraa 0x04
87aa: 97 ac        staa (0x00AC)
87ac: 32           pula
87ad: 97 7a        staa (0x007A)
87af: b7 18 06     staa (0x1806)
87b2: bd 87 85     jsr (0x8785)
87b5: 96 ac        ldaa (0x00AC)
87b7: b7 18 06     staa (0x1806)
87ba: bd 87 4a     jsr (0x874A)
87bd: 39           rts
87be: 96 7a        ldaa (0x007A)
87c0: 8a 01        oraa 0x01
87c2: 36           psha
87c3: 96 ac        ldaa (0x00AC)
87c5: 84 fb        anda 0xFB
87c7: 97 ac        staa (0x00AC)
87c9: 32           pula
87ca: 20 e1        bra [0x87AD]
87cc: ce 87 e2     ldx 0x87E2
87cf: a6 00        ldaa (X+0x00)
87d1: 81 ff        cmpa 0xFF
87d3: 27 0c        beq [0x87E1]
87d5: 08           inx
87d6: b7 18 0d     staa (0x180D)
87d9: a6 00        ldaa (X+0x00)
87db: 08           inx
87dc: b7 18 0d     staa (0x180D)
87df: 20 ee        bra [0x87CF]
87e1: 39           rts
87e2: 09           dex
87e3: 8a 01        oraa 0x01
87e5: 00           test
87e6: 0c           clc
87e7: 18 0d        ?
87e9: 00           test
87ea: 04           lsrd
87eb: 44           lsra
87ec: 0e           cli
87ed: 63 05        com (X+0x05)
87ef: 68 0b        asl (X+0x0B)
87f1: 56           rorb
87f2: 03           fdiv
87f3: c1 0f        cmpb 0x0F
87f5: 00           test
87f6: ff ff ce     stx (0xFFCE)
87f9: f8 57 a6     eorb (0x57A6)
87fc: 00           test
87fd: 81 ff        cmpa 0xFF
87ff: 27 0c        beq [0x880D]
8801: 08           inx
8802: b7 18 0c     staa (0x180C)
8805: a6 00        ldaa (X+0x00)
8807: 08           inx
8808: b7 18 0c     staa (0x180C)
880b: 20 ee        bra [0x87FB]
880d: 20 16        bra [0x8825]
880f: 09           dex
8810: 8a 01        oraa 0x01
8812: 10           sba
8813: 0c           clc
8814: 18 0d        ?
8816: 00           test
8817: 04           lsrd
8818: 04           lsrd
8819: 0e           cli
881a: 63 05        com (X+0x05)
881c: 68 0b        asl (X+0x0B)
881e: 01           nop
881f: 03           fdiv
8820: c1 0f        cmpb 0x0F
8822: 00           test
8823: ff ff ce     stx (0xFFCE)
8826: 88 4e        eora 0x4E
8828: ff 01 28     stx (0x0128)
882b: 86 7e        ldaa 0x7E
882d: b7 01 27     staa (0x0127)
8830: ce 88 42     ldx 0x8842
8833: ff 01 01     stx (0x0101)
8836: b7 01 00     staa (0x0100)
8839: b6 10 2d     ldaa (0x102D)
883c: 8a 20        oraa 0x20
883e: b7 10 2d     staa (0x102D)
8841: 39           rts
8842: b6 10 2e     ldaa (0x102E)
8845: b6 10 2f     ldaa (0x102F)
8848: 7c 00 48     inc (0x0048)
884b: 7e 88 72     jmp (0x8872)
884e: 86 01        ldaa 0x01
8850: b7 18 0c     staa (0x180C)
8853: b6 18 0c     ldaa (0x180C)
8856: 84 70        anda 0x70
8858: 26 1f        bne [0x8879]
885a: 86 0a        ldaa 0x0A
885c: b7 18 0c     staa (0x180C)
885f: b6 18 0c     ldaa (0x180C)
8862: 84 c0        anda 0xC0
8864: 26 22        bne [0x8888]
8866: b6 18 0c     ldaa (0x180C)
8869: 44           lsra
886a: 24 35        bcc [0x88A1]
886c: 7c 00 48     inc (0x0048)
886f: b6 18 0e     ldaa (0x180E)
8872: bd fa a3     jsr (0xFAA3)
8875: 97 4a        staa (0x004A)
8877: 20 2d        bra [0x88A6]
8879: b6 18 0e     ldaa (0x180E)
887c: 86 30        ldaa 0x30
887e: b7 18 0c     staa (0x180C)
8881: 86 07        ldaa 0x07
8883: bd fa a3     jsr (0xFAA3)
8886: 0c           clc
8887: 3b           rti
8888: 86 07        ldaa 0x07
888a: bd fa a3     jsr (0xFAA3)
888d: 86 0e        ldaa 0x0E
888f: b7 18 0c     staa (0x180C)
8892: 86 43        ldaa 0x43
8894: b7 18 0c     staa (0x180C)
8897: b6 18 0e     ldaa (0x180E)
889a: 86 07        ldaa 0x07
889c: bd fa a3     jsr (0xFAA3)
889f: 0d           sec
88a0: 3b           rti
88a1: b6 18 0e     ldaa (0x180E)
88a4: 0c           clc
88a5: 3b           rti
88a6: 84 7f        anda 0x7F
88a8: 81 24        cmpa 0x24
88aa: 27 44        beq [0x88F0]
88ac: 81 25        cmpa 0x25
88ae: 27 40        beq [0x88F0]
88b0: 81 20        cmpa 0x20
88b2: 27 3a        beq [0x88EE]
88b4: 81 30        cmpa 0x30
88b6: 25 35        bcs [0x88ED]
88b8: 97 12        staa (0x0012)
88ba: 96 4d        ldaa (0x004D)
88bc: 81 02        cmpa 0x02
88be: 25 09        bcs [0x88C9]
88c0: 7f 00 4d     clr (0x004D)
88c3: 96 12        ldaa (0x0012)
88c5: 97 49        staa (0x0049)
88c7: 20 24        bra [0x88ED]
88c9: 7d 00 4e     tst (0x004E)
88cc: 27 1f        beq [0x88ED]
88ce: 86 78        ldaa 0x78
88d0: 97 63        staa (0x0063)
88d2: 97 64        staa (0x0064)
88d4: 96 12        ldaa (0x0012)
88d6: 81 40        cmpa 0x40
88d8: 24 07        bcc [0x88E1]
88da: 97 4c        staa (0x004C)
88dc: 7f 00 4d     clr (0x004D)
88df: 20 0c        bra [0x88ED]
88e1: 81 60        cmpa 0x60
88e3: 24 08        bcc [0x88ED]
88e5: 97 4b        staa (0x004B)
88e7: 7f 00 4d     clr (0x004D)
88ea: bd 88 f5     jsr (0x88F5)
88ed: 3b           rti
88ee: 20 fd        bra [0x88ED]
88f0: 7c 00 4d     inc (0x004D)
88f3: 20 f9        bra [0x88EE]
88f5: d6 4b        ldab (0x004B)
88f7: 96 4c        ldaa (0x004C)
88f9: 7d 04 5c     tst (0x045C)
88fc: 27 0d        beq [0x890B]
88fe: 81 3c        cmpa 0x3C
8900: 25 09        bcs [0x890B]
8902: 81 3f        cmpa 0x3F
8904: 22 05        bhi [0x890B]
8906: bd 89 a3     jsr (0x89A3)
8909: 20 65        bra [0x8970]
890b: 1a 83 30 48  cpd 0x3048
890f: 27 79        beq [0x898A]
8911: 1a 83 31 48  cpd 0x3148
8915: 27 5a        beq [0x8971]
8917: 1a 83 34 4d  cpd 0x344D
891b: 27 6d        beq [0x898A]
891d: 1a 83 35 4d  cpd 0x354D
8921: 27 4e        beq [0x8971]
8923: 1a 83 36 4d  cpd 0x364D
8927: 27 61        beq [0x898A]
8929: 1a 83 37 4d  cpd 0x374D
892d: 27 42        beq [0x8971]
892f: ce 10 80     ldx 0x1080
8932: d6 4c        ldab (0x004C)
8934: c0 30        subb 0x30
8936: 54           lsrb
8937: 58           aslb
8938: 58           aslb
8939: 3a           abx
893a: d6 4b        ldab (0x004B)
893c: c1 50        cmpb 0x50
893e: 24 30        bcc [0x8970]
8940: c1 47        cmpb 0x47
8942: 23 02        bls [0x8946]
8944: 08           inx
8945: 08           inx
8946: c0 40        subb 0x40
8948: c4 07        andb 0x07
894a: 4f           clra
894b: 0d           sec
894c: 49           rola
894d: 5d           tstb
894e: 27 04        beq [0x8954]
8950: 49           rola
8951: 5a           decb
8952: 26 fc        bne [0x8950]
8954: 97 50        staa (0x0050)
8956: 96 4c        ldaa (0x004C)
8958: 84 01        anda 0x01
895a: 27 08        beq [0x8964]
895c: a6 00        ldaa (X+0x00)
895e: 9a 50        oraa (0x0050)
8960: a7 00        staa (X+0x00)
8962: 20 0c        bra [0x8970]
8964: 96 50        ldaa (0x0050)
8966: 88 ff        eora 0xFF
8968: 97 50        staa (0x0050)
896a: a6 00        ldaa (X+0x00)
896c: 94 50        anda (0x0050)
896e: a7 00        staa (X+0x00)
8970: 39           rts
8971: b6 10 82     ldaa (0x1082)
8974: 8a 01        oraa 0x01
8976: b7 10 82     staa (0x1082)
8979: b6 10 8a     ldaa (0x108A)
897c: 8a 20        oraa 0x20
897e: b7 10 8a     staa (0x108A)
8981: b6 10 8e     ldaa (0x108E)
8984: 8a 20        oraa 0x20
8986: b7 10 8e     staa (0x108E)
8989: 39           rts
898a: b6 10 82     ldaa (0x1082)
898d: 84 fe        anda 0xFE
898f: b7 10 82     staa (0x1082)
8992: b6 10 8a     ldaa (0x108A)
8995: 84 df        anda 0xDF
8997: b7 10 8a     staa (0x108A)
899a: b6 10 8e     ldaa (0x108E)
899d: 84 df        anda 0xDF
899f: b7 10 8e     staa (0x108E)
89a2: 39           rts
89a3: 3c           pshx
89a4: 81 3d        cmpa 0x3D
89a6: 22 05        bhi [0x89AD]
89a8: ce f7 80     ldx 0xF780
89ab: 20 03        bra [0x89B0]
89ad: ce f7 a0     ldx 0xF7A0
89b0: c0 40        subb 0x40
89b2: 58           aslb
89b3: 3a           abx
89b4: 81 3c        cmpa 0x3C
89b6: 27 34        beq [0x89EC]
89b8: 81 3d        cmpa 0x3D
89ba: 27 0a        beq [0x89C6]
89bc: 81 3e        cmpa 0x3E
89be: 27 4b        beq [0x8A0B]
89c0: 81 3f        cmpa 0x3F
89c2: 27 15        beq [0x89D9]
89c4: 38           pulx
89c5: 39           rts
89c6: b6 10 98     ldaa (0x1098)
89c9: aa 00        oraa (X+0x00)
89cb: b7 10 98     staa (0x1098)
89ce: 08           inx
89cf: b6 10 9a     ldaa (0x109A)
89d2: aa 00        oraa (X+0x00)
89d4: b7 10 9a     staa (0x109A)
89d7: 38           pulx
89d8: 39           rts
89d9: b6 10 9c     ldaa (0x109C)
89dc: aa 00        oraa (X+0x00)
89de: b7 10 9c     staa (0x109C)
89e1: 08           inx
89e2: b6 10 9e     ldaa (0x109E)
89e5: aa 00        oraa (X+0x00)
89e7: b7 10 9e     staa (0x109E)
89ea: 38           pulx
89eb: 39           rts
89ec: e6 00        ldab (X+0x00)
89ee: c8 ff        eorb 0xFF
89f0: d7 12        stab (0x0012)
89f2: b6 10 98     ldaa (0x1098)
89f5: 94 12        anda (0x0012)
89f7: b7 10 98     staa (0x1098)
89fa: 08           inx
89fb: e6 00        ldab (X+0x00)
89fd: c8 ff        eorb 0xFF
89ff: d7 12        stab (0x0012)
8a01: b6 10 9a     ldaa (0x109A)
8a04: 94 12        anda (0x0012)
8a06: b7 10 9a     staa (0x109A)
8a09: 38           pulx
8a0a: 39           rts
8a0b: e6 00        ldab (X+0x00)
8a0d: c8 ff        eorb 0xFF
8a0f: d7 12        stab (0x0012)
8a11: b6 10 9c     ldaa (0x109C)
8a14: 94 12        anda (0x0012)
8a16: b7 10 9c     staa (0x109C)
8a19: 08           inx
8a1a: e6 00        ldab (X+0x00)
8a1c: c8 ff        eorb 0xFF
8a1e: d7 12        stab (0x0012)
8a20: b6 10 9e     ldaa (0x109E)
8a23: 94 12        anda (0x0012)
8a25: b7 10 9e     staa (0x109E)
8a28: 38           pulx
8a29: 39           rts
8a2a: 3c           pshx
8a2b: 86 04        ldaa 0x04
8a2d: b5 18 0d     bita (0x180D)
8a30: 27 f9        beq [0x8A2B]
8a32: a6 00        ldaa (X+0x00)
8a34: 26 03        bne [0x8A39]
8a36: 7e 8b 31     jmp (0x8B31)
8a39: 08           inx
8a3a: 81 5e        cmpa 0x5E
8a3c: 26 1d        bne [0x8A5B]
8a3e: a6 00        ldaa (X+0x00)
8a40: 08           inx
8a41: b7 05 92     staa (0x0592)
8a44: a6 00        ldaa (X+0x00)
8a46: 08           inx
8a47: b7 05 93     staa (0x0593)
8a4a: a6 00        ldaa (X+0x00)
8a4c: 08           inx
8a4d: b7 05 95     staa (0x0595)
8a50: a6 00        ldaa (X+0x00)
8a52: 08           inx
8a53: b7 05 96     staa (0x0596)
8a56: bd 8b 33     jsr (0x8B33)
8a59: 20 d0        bra [0x8A2B]
8a5b: 81 40        cmpa 0x40
8a5d: 26 3b        bne [0x8A9A]
8a5f: 1a ee 00     ldy (X+0x00)
8a62: 08           inx
8a63: 08           inx
8a64: 86 30        ldaa 0x30
8a66: 97 b1        staa (0x00B1)
8a68: 18 a6 00     ldaa (Y+0x00)
8a6b: 81 64        cmpa 0x64
8a6d: 25 07        bcs [0x8A76]
8a6f: 7c 00 b1     inc (0x00B1)
8a72: 80 64        suba 0x64
8a74: 20 f5        bra [0x8A6B]
8a76: 36           psha
8a77: 96 b1        ldaa (0x00B1)
8a79: bd 8b 4b     jsr (0x8B4B)
8a7c: 86 30        ldaa 0x30
8a7e: 97 b1        staa (0x00B1)
8a80: 32           pula
8a81: 81 0a        cmpa 0x0A
8a83: 25 07        bcs [0x8A8C]
8a85: 7c 00 b1     inc (0x00B1)
8a88: 80 0a        suba 0x0A
8a8a: 20 f5        bra [0x8A81]
8a8c: 36           psha
8a8d: 96 b1        ldaa (0x00B1)
8a8f: bd 8b 4b     jsr (0x8B4B)
8a92: 32           pula
8a93: 8b 30        adda 0x30
8a95: bd 8b 4b     jsr (0x8B4B)
8a98: 20 91        bra [0x8A2B]
8a9a: 81 7c        cmpa 0x7C
8a9c: 26 59        bne [0x8AF7]
8a9e: 1a ee 00     ldy (X+0x00)
8aa1: 08           inx
8aa2: 08           inx
8aa3: 86 30        ldaa 0x30
8aa5: 97 b1        staa (0x00B1)
8aa7: 18 ec 00     ldd (Y+0x00)
8aaa: 1a 83 27 10  cpd 0x2710
8aae: 25 08        bcs [0x8AB8]
8ab0: 7c 00 b1     inc (0x00B1)
8ab3: 83 27 10     subd 0x2710
8ab6: 20 f2        bra [0x8AAA]
8ab8: 36           psha
8ab9: 96 b1        ldaa (0x00B1)
8abb: bd 8b 4b     jsr (0x8B4B)
8abe: 86 30        ldaa 0x30
8ac0: 97 b1        staa (0x00B1)
8ac2: 32           pula
8ac3: 1a 83 03 e8  cpd 0x03E8
8ac7: 25 08        bcs [0x8AD1]
8ac9: 7c 00 b1     inc (0x00B1)
8acc: 83 03 e8     subd 0x03E8
8acf: 20 f2        bra [0x8AC3]
8ad1: 36           psha
8ad2: 96 b1        ldaa (0x00B1)
8ad4: bd 8b 4b     jsr (0x8B4B)
8ad7: 86 30        ldaa 0x30
8ad9: 97 b1        staa (0x00B1)
8adb: 32           pula
8adc: 1a 83 00 64  cpd 0x0064
8ae0: 25 08        bcs [0x8AEA]
8ae2: 7c 00 b1     inc (0x00B1)
8ae5: 83 00 64     subd 0x0064
8ae8: 20 f2        bra [0x8ADC]
8aea: 96 b1        ldaa (0x00B1)
8aec: bd 8b 4b     jsr (0x8B4B)
8aef: 86 30        ldaa 0x30
8af1: 97 b1        staa (0x00B1)
8af3: 17           tba
8af4: 7e 8a 81     jmp (0x8A81)
8af7: 81 7e        cmpa 0x7E
8af9: 26 18        bne [0x8B13]
8afb: e6 00        ldab (X+0x00)
8afd: c0 30        subb 0x30
8aff: 08           inx
8b00: 1a ee 00     ldy (X+0x00)
8b03: 08           inx
8b04: 08           inx
8b05: 18 a6 00     ldaa (Y+0x00)
8b08: 18 08        iny
8b0a: bd 8b 4b     jsr (0x8B4B)
8b0d: 5a           decb
8b0e: 26 f5        bne [0x8B05]
8b10: 7e 8a 2b     jmp (0x8A2B)
8b13: 81 25        cmpa 0x25
8b15: 26 14        bne [0x8B2B]
8b17: ce 05 90     ldx 0x0590
8b1a: cc 1b 5b     ldd 0x1B5B
8b1d: ed 00        std (X+0x00)
8b1f: 86 4b        ldaa 0x4B
8b21: a7 02        staa (X+0x02)
8b23: 6f 03        clr (X+0x03)
8b25: bd 8a 2a     jsr (0x8A2A)
8b28: 7e 8a 2b     jmp (0x8A2B)
8b2b: b7 18 0f     staa (0x180F)
8b2e: 7e 8a 2b     jmp (0x8A2B)
8b31: 38           pulx
8b32: 39           rts
8b33: 3c           pshx
8b34: ce 05 90     ldx 0x0590
8b37: cc 1b 5b     ldd 0x1B5B
8b3a: ed 00        std (X+0x00)
8b3c: 86 48        ldaa 0x48
8b3e: a7 07        staa (X+0x07)
8b40: 86 3b        ldaa 0x3B
8b42: a7 04        staa (X+0x04)
8b44: 6f 08        clr (X+0x08)
8b46: bd 8a 2a     jsr (0x8A2A)
8b49: 38           pulx
8b4a: 39           rts
8b4b: 36           psha
8b4c: 86 04        ldaa 0x04
8b4e: b5 18 0d     bita (0x180D)
8b51: 27 f9        beq [0x8B4C]
8b53: 32           pula
8b54: b7 18 0f     staa (0x180F)
8b57: 39           rts
8b58: bd a3 6b     jsr (0xA36B)
8b5b: bd 8d f4     jsr (0x8DF4)
8b5e: 4c           inca
8b5f: 69 67        rol (X+0x67)
8b61: 68 74        asl (X+0x74)
8b63: 20 44        bra [0x8BA9]
8b65: 69 61        rol (X+0x61)
8b67: 67 6e        asr (X+0x6E)
8b69: 6f 73        clr (X+0x73)
8b6b: 74 69 e3     lsr (0x69E3)
8b6e: bd 8d ed     jsr (0x8DED)
8b71: 43           coma
8b72: 75           ?
8b73: 72           ?
8b74: 74 61 69     lsr (0x6169)
8b77: 6e 73        jmp (X+0x73)
8b79: 20 6f        bra [0x8BEA]
8b7b: 70 65 6e     neg (0x656E)
8b7e: 69 6e        rol (X+0x6E)
8b80: e7 c6        stab (X+0xC6)
8b82: 14 bd 8c     bset (0x00BD), 0x8C
8b85: 40           nega
8b86: c6 ff        ldab 0xFF
8b88: f7 10 98     stab (0x1098)
8b8b: f7 10 9a     stab (0x109A)
8b8e: f7 10 9c     stab (0x109C)
8b91: f7 10 9e     stab (0x109E)
8b94: bd fa f9     jsr (0xFAF9)
8b97: b6 18 04     ldaa (0x1804)
8b9a: 8a 40        oraa 0x40
8b9c: b7 18 04     staa (0x1804)
8b9f: bd 8d f4     jsr (0x8DF4)
8ba2: 20 50        bra [0x8BF4]
8ba4: 72           ?
8ba5: 65           ?
8ba6: 73 73 20     com (0x7320)
8ba9: 45           ?
8baa: 4e           ?
8bab: 54           lsrb
8bac: 45           ?
8bad: 52           ?
8bae: 20 74        bra [0x8C24]
8bb0: 6f a0        clr (X+0xA0)
8bb2: bd 8d ed     jsr (0x8DED)
8bb5: 74 75 72     lsr (0x7572)
8bb8: 6e 20        jmp (X+0x20)
8bba: 6c 69        inc (X+0x69)
8bbc: 67 68        asr (X+0x68)
8bbe: 74 73 20     lsr (0x7320)
8bc1: 20 6f        bra [0x8C32]
8bc3: 66 e6        ror (X+0xE6)
8bc5: bd 8e a5     jsr (0x8EA5)
8bc8: 81 0d        cmpa 0x0D
8bca: 26 f9        bne [0x8BC5]
8bcc: bd a3 7e     jsr (0xA37E)
8bcf: 39           rts
8bd0: 86 80        ldaa 0x80
8bd2: b7 10 22     staa (0x1022)
8bd5: ce ac 09     ldx 0xAC09
8bd8: ff 01 19     stx (0x0119)
8bdb: ce ad 49     ldx 0xAD49
8bde: ff 01 16     stx (0x0116)
8be1: ce ad 49     ldx 0xAD49
8be4: ff 01 2e     stx (0x012E)
8be7: 86 7e        ldaa 0x7E
8be9: b7 01 18     staa (0x0118)
8bec: b7 01 15     staa (0x0115)
8bef: b7 01 2d     staa (0x012D)
8bf2: 4f           clra
8bf3: 5f           clrb
8bf4: dd 1b        std (0x001B)
8bf6: dd 1d        std (0x001D)
8bf8: dd 1f        std (0x001F)
8bfa: dd 21        std (0x0021)
8bfc: dd 23        std (0x0023)
8bfe: 86 c0        ldaa 0xC0
8c00: b7 10 23     staa (0x1023)
8c03: 39           rts
8c04: b6 10 0a     ldaa (0x100A)
8c07: 88 ff        eora 0xFF
8c09: 16           tab
8c0a: d7 62        stab (0x0062)
8c0c: bd fa f9     jsr (0xFAF9)
8c0f: 20 f3        bra [0x8C04]
8c11: 39           rts
8c12: 36           psha
8c13: 86 64        ldaa 0x64
8c15: 3d           mul
8c16: dd 23        std (0x0023)
8c18: bd 9b 29     jsr (0x9B29)
8c1b: dc 23        ldd (0x0023)
8c1d: 26 f9        bne [0x8C18]
8c1f: 32           pula
8c20: 39           rts
8c21: 36           psha
8c22: 86 3c        ldaa 0x3C
8c24: 97 28        staa (0x0028)
8c26: c6 01        ldab 0x01
8c28: bd 8c 12     jsr (0x8C12)
8c2b: 96 28        ldaa (0x0028)
8c2d: 4a           deca
8c2e: 26 f4        bne [0x8C24]
8c30: 32           pula
8c31: 39           rts
8c32: 36           psha
8c33: 4f           clra
8c34: dd 23        std (0x0023)
8c36: bd 9b 29     jsr (0x9B29)
8c39: 7d 00 24     tst (0x0024)
8c3c: 26 f8        bne [0x8C36]
8c3e: 32           pula
8c3f: 39           rts
8c40: 36           psha
8c41: 86 32        ldaa 0x32
8c43: 3d           mul
8c44: dd 23        std (0x0023)
8c46: dc 23        ldd (0x0023)
8c48: 26 fc        bne [0x8C46]
8c4a: 32           pula
8c4b: 39           rts
8c4c: 86 ff        ldaa 0xFF
8c4e: b7 10 01     staa (0x1001)
8c51: 86 ff        ldaa 0xFF
8c53: b7 10 03     staa (0x1003)
8c56: b6 10 02     ldaa (0x1002)
8c59: 8a 02        oraa 0x02
8c5b: b7 10 02     staa (0x1002)
8c5e: 86 38        ldaa 0x38
8c60: bd 8c 96     jsr (0x8C96)
8c63: 86 38        ldaa 0x38
8c65: bd 8c 96     jsr (0x8C96)
8c68: 86 06        ldaa 0x06
8c6a: bd 8c 96     jsr (0x8C96)
8c6d: 86 0e        ldaa 0x0E
8c6f: bd 8c 96     jsr (0x8C96)
8c72: 86 01        ldaa 0x01
8c74: bd 8c 96     jsr (0x8C96)
8c77: ce 00 ff     ldx 0x00FF
8c7a: 01           nop
8c7b: 01           nop
8c7c: 09           dex
8c7d: 26 fb        bne [0x8C7A]
8c7f: 39           rts
8c80: b6 10 02     ldaa (0x1002)
8c83: 84 fd        anda 0xFD
8c85: b7 10 02     staa (0x1002)
8c88: 8a 02        oraa 0x02
8c8a: b7 10 02     staa (0x1002)
8c8d: 39           rts
8c8e: cc 05 00     ldd 0x0500
8c91: dd 46        std (0x0046)
8c93: dd 44        std (0x0044)
8c95: 39           rts
8c96: bd 8c cd     jsr (0x8CCD)
8c99: b7 10 00     staa (0x1000)
8c9c: b6 10 02     ldaa (0x1002)
8c9f: 84 f3        anda 0xF3
8ca1: b7 10 02     staa (0x1002)
8ca4: bd 8c 80     jsr (0x8C80)
8ca7: 39           rts
8ca8: bd 8c cd     jsr (0x8CCD)
8cab: b7 10 00     staa (0x1000)
8cae: b6 10 02     ldaa (0x1002)
8cb1: 84 fb        anda 0xFB
8cb3: 8a 08        oraa 0x08
8cb5: 20 ea        bra [0x8CA1]
8cb7: bd 8c cd     jsr (0x8CCD)
8cba: b6 10 02     ldaa (0x1002)
8cbd: 84 f7        anda 0xF7
8cbf: 8a 08        oraa 0x08
8cc1: 20 de        bra [0x8CA1]
8cc3: bd 8c cd     jsr (0x8CCD)
8cc6: b6 10 02     ldaa (0x1002)
8cc9: 8a 0c        oraa 0x0C
8ccb: 20 d4        bra [0x8CA1]
8ccd: 36           psha
8cce: 37           pshb
8ccf: c6 ff        ldab 0xFF
8cd1: 5d           tstb
8cd2: 27 1a        beq [0x8CEE]
8cd4: b6 10 02     ldaa (0x1002)
8cd7: 84 f7        anda 0xF7
8cd9: 8a 04        oraa 0x04
8cdb: b7 10 02     staa (0x1002)
8cde: bd 8c 80     jsr (0x8C80)
8ce1: 7f 10 01     clr (0x1001)
8ce4: b6 10 00     ldaa (0x1000)
8ce7: 2b 08        bmi [0x8CF1]
8ce9: 86 ff        ldaa 0xFF
8ceb: b7 10 01     staa (0x1001)
8cee: 33           pulb
8cef: 32           pula
8cf0: 39           rts
8cf1: 5a           decb
8cf2: 86 ff        ldaa 0xFF
8cf4: b7 10 01     staa (0x1001)
8cf7: 20 d8        bra [0x8CD1]
8cf9: bd 8c cd     jsr (0x8CCD)
8cfc: 86 01        ldaa 0x01
8cfe: bd 8c 96     jsr (0x8C96)
8d01: 39           rts
8d02: bd 8c cd     jsr (0x8CCD)
8d05: 86 80        ldaa 0x80
8d07: bd 8d 24     jsr (0x8D24)
8d0a: bd 8c cd     jsr (0x8CCD)
8d0d: 86 80        ldaa 0x80
8d0f: bd 8c 96     jsr (0x8C96)
8d12: 39           rts
8d13: bd 8c cd     jsr (0x8CCD)
8d16: 86 c0        ldaa 0xC0
8d18: bd 8d 24     jsr (0x8D24)
8d1b: bd 8c cd     jsr (0x8CCD)
8d1e: 86 c0        ldaa 0xC0
8d20: bd 8c 96     jsr (0x8C96)
8d23: 39           rts
8d24: bd 8c 96     jsr (0x8C96)
8d27: 86 10        ldaa 0x10
8d29: 97 14        staa (0x0014)
8d2b: bd 8c cd     jsr (0x8CCD)
8d2e: 86 20        ldaa 0x20
8d30: bd 8c a8     jsr (0x8CA8)
8d33: 7a 00 14     dec (0x0014)
8d36: 26 f3        bne [0x8D2B]
8d38: 39           rts
8d39: 86 0c        ldaa 0x0C
8d3b: bd 8e 5b     jsr (0x8E5B)
8d3e: 39           rts
8d3f: 86 0e        ldaa 0x0E
8d41: bd 8e 5b     jsr (0x8E5B)
8d44: 39           rts
8d45: 7f 00 4a     clr (0x004A)
8d48: 7f 00 43     clr (0x0043)
8d4b: 18 de 46     ldy (0x0046)
8d4e: 86 c0        ldaa 0xC0
8d50: 20 0b        bra [0x8D5D]
8d52: 7f 00 4a     clr (0x004A)
8d55: 7f 00 43     clr (0x0043)
8d58: 18 de 46     ldy (0x0046)
8d5b: 86 80        ldaa 0x80
8d5d: 18 a7 00     staa (Y+0x00)
8d60: 18 6f 01     clr (Y+0x01)
8d63: 18 08        iny
8d65: 18 08        iny
8d67: 18 8c 05 80  cpy 0x0580
8d6b: 25 04        bcs [0x8D71]
8d6d: 18 ce 05 00  ldy 0x0500
8d71: c6 0f        ldab 0x0F
8d73: 96 4a        ldaa (0x004A)
8d75: 27 fc        beq [0x8D73]
8d77: 7f 00 4a     clr (0x004A)
8d7a: 5a           decb
8d7b: 27 1a        beq [0x8D97]
8d7d: 81 24        cmpa 0x24
8d7f: 27 16        beq [0x8D97]
8d81: 18 6f 00     clr (Y+0x00)
8d84: 18 a7 01     staa (Y+0x01)
8d87: 18 08        iny
8d89: 18 08        iny
8d8b: 18 8c 05 80  cpy 0x0580
8d8f: 25 04        bcs [0x8D95]
8d91: 18 ce 05 00  ldy 0x0500
8d95: 20 dc        bra [0x8D73]
8d97: 5d           tstb
8d98: 27 19        beq [0x8DB3]
8d9a: 86 20        ldaa 0x20
8d9c: 18 6f 00     clr (Y+0x00)
8d9f: 18 a7 01     staa (Y+0x01)
8da2: 18 08        iny
8da4: 18 08        iny
8da6: 18 8c 05 80  cpy 0x0580
8daa: 25 04        bcs [0x8DB0]
8dac: 18 ce 05 00  ldy 0x0500
8db0: 5a           decb
8db1: 26 e9        bne [0x8D9C]
8db3: 18 6f 00     clr (Y+0x00)
8db6: 18 6f 01     clr (Y+0x01)
8db9: 18 df 46     sty (0x0046)
8dbc: 96 19        ldaa (0x0019)
8dbe: 97 4e        staa (0x004E)
8dc0: 86 01        ldaa 0x01
8dc2: 97 43        staa (0x0043)
8dc4: 39           rts
8dc5: 36           psha
8dc6: 37           pshb
8dc7: c1 4f        cmpb 0x4F
8dc9: 22 13        bhi [0x8DDE]
8dcb: c1 28        cmpb 0x28
8dcd: 25 03        bcs [0x8DD2]
8dcf: 0c           clc
8dd0: c9 18        adcb 0x18
8dd2: 0c           clc
8dd3: c9 80        adcb 0x80
8dd5: 17           tba
8dd6: bd 8e 5b     jsr (0x8E5B)
8dd9: 33           pulb
8dda: 32           pula
8ddb: bd 8e 80     jsr (0x8E80)
8dde: 39           rts
8ddf: 18 de 46     ldy (0x0046)
8de2: 86 90        ldaa 0x90
8de4: 20 13        bra [0x8DF9]
8de6: 18 de 46     ldy (0x0046)
8de9: 86 d0        ldaa 0xD0
8deb: 20 0c        bra [0x8DF9]
8ded: 18 de 46     ldy (0x0046)
8df0: 86 c0        ldaa 0xC0
8df2: 20 05        bra [0x8DF9]
8df4: 18 de 46     ldy (0x0046)
8df7: 86 80        ldaa 0x80
8df9: 18 a7 00     staa (Y+0x00)
8dfc: 18 6f 01     clr (Y+0x01)
8dff: 18 08        iny
8e01: 18 08        iny
8e03: 18 8c 05 80  cpy 0x0580
8e07: 25 04        bcs [0x8E0D]
8e09: 18 ce 05 00  ldy 0x0500
8e0d: 38           pulx
8e0e: df 17        stx (0x0017)
8e10: a6 00        ldaa (X+0x00)
8e12: 27 36        beq [0x8E4A]
8e14: 2b 17        bmi [0x8E2D]
8e16: 18 6f 00     clr (Y+0x00)
8e19: 18 a7 01     staa (Y+0x01)
8e1c: 08           inx
8e1d: 18 08        iny
8e1f: 18 08        iny
8e21: 18 8c 05 80  cpy 0x0580
8e25: 25 e9        bcs [0x8E10]
8e27: 18 ce 05 00  ldy 0x0500
8e2b: 20 e3        bra [0x8E10]
8e2d: 84 7f        anda 0x7F
8e2f: 18 6f 00     clr (Y+0x00)
8e32: 18 a7 01     staa (Y+0x01)
8e35: 18 6f 02     clr (Y+0x02)
8e38: 18 6f 03     clr (Y+0x03)
8e3b: 08           inx
8e3c: 18 08        iny
8e3e: 18 08        iny
8e40: 18 8c 05 80  cpy 0x0580
8e44: 25 04        bcs [0x8E4A]
8e46: 18 ce 05 00  ldy 0x0500
8e4a: 3c           pshx
8e4b: 86 01        ldaa 0x01
8e4d: 97 43        staa (0x0043)
8e4f: dc 46        ldd (0x0046)
8e51: 18 6f 00     clr (Y+0x00)
8e54: 18 6f 01     clr (Y+0x01)
8e57: 18 df 46     sty (0x0046)
8e5a: 39           rts
8e5b: 18 de 46     ldy (0x0046)
8e5e: 18 a7 00     staa (Y+0x00)
8e61: 18 6f 01     clr (Y+0x01)
8e64: 18 08        iny
8e66: 18 08        iny
8e68: 18 8c 05 80  cpy 0x0580
8e6c: 25 04        bcs [0x8E72]
8e6e: 18 ce 05 00  ldy 0x0500
8e72: 18 6f 00     clr (Y+0x00)
8e75: 18 6f 01     clr (Y+0x01)
8e78: 86 01        ldaa 0x01
8e7a: 97 43        staa (0x0043)
8e7c: 18 df 46     sty (0x0046)
8e7f: 39           rts
8e80: 18 de 46     ldy (0x0046)
8e83: 18 6f 00     clr (Y+0x00)
8e86: 18 a7 01     staa (Y+0x01)
8e89: 18 08        iny
8e8b: 18 08        iny
8e8d: 18 8c 05 80  cpy 0x0580
8e91: 25 04        bcs [0x8E97]
8e93: 18 ce 05 00  ldy 0x0500
8e97: 18 6f 00     clr (Y+0x00)
8e9a: 18 6f 01     clr (Y+0x01)
8e9d: 86 01        ldaa 0x01
8e9f: 97 43        staa (0x0043)
8ea1: 18 df 46     sty (0x0046)
8ea4: 39           rts
8ea5: 96 30        ldaa (0x0030)
8ea7: 26 09        bne [0x8EB2]
8ea9: 96 31        ldaa (0x0031)
8eab: 26 11        bne [0x8EBE]
8ead: 96 32        ldaa (0x0032)
8eaf: 26 19        bne [0x8ECA]
8eb1: 39           rts
8eb2: 7f 00 30     clr (0x0030)
8eb5: 7f 00 32     clr (0x0032)
8eb8: 7f 00 31     clr (0x0031)
8ebb: 86 01        ldaa 0x01
8ebd: 39           rts
8ebe: 7f 00 31     clr (0x0031)
8ec1: 7f 00 30     clr (0x0030)
8ec4: 7f 00 32     clr (0x0032)
8ec7: 86 02        ldaa 0x02
8ec9: 39           rts
8eca: 7f 00 32     clr (0x0032)
8ecd: 7f 00 30     clr (0x0030)
8ed0: 7f 00 31     clr (0x0031)
8ed3: 86 0d        ldaa 0x0D
8ed5: 39           rts
8ed6: b6 18 04     ldaa (0x1804)
8ed9: 84 07        anda 0x07
8edb: 97 2c        staa (0x002C)
8edd: 78 00 2c     asl (0x002C)
8ee0: 78 00 2c     asl (0x002C)
8ee3: 78 00 2c     asl (0x002C)
8ee6: 78 00 2c     asl (0x002C)
8ee9: 78 00 2c     asl (0x002C)
8eec: ce 00 00     ldx 0x0000
8eef: 8c 00 03     cpx 0x0003
8ef2: 27 24        beq [0x8F18]
8ef4: 78 00 2c     asl (0x002C)
8ef7: 25 12        bcs [0x8F0B]
8ef9: a6 2d        ldaa (X+0x2D)
8efb: 81 0f        cmpa 0x0F
8efd: 24 1a        bcc [0x8F19]
8eff: 6c 2d        inc (X+0x2D)
8f01: a6 2d        ldaa (X+0x2D)
8f03: 81 02        cmpa 0x02
8f05: 26 02        bne [0x8F09]
8f07: a7 30        staa (X+0x30)
8f09: 20 0a        bra [0x8F15]
8f0b: 6f 2d        clr (X+0x2D)
8f0d: 20 06        bra [0x8F15]
8f0f: a6 2d        ldaa (X+0x2D)
8f11: 27 02        beq [0x8F15]
8f13: 6a 2d        dec (X+0x2D)
8f15: 08           inx
8f16: 20 d7        bra [0x8EEF]
8f18: 39           rts
8f19: 8c 00 02     cpx 0x0002
8f1c: 27 02        beq [0x8F20]
8f1e: 6f 2d        clr (X+0x2D)
8f20: 20 f3        bra [0x8F15]
8f22: b6 10 0a     ldaa (0x100A)
8f25: 97 51        staa (0x0051)
8f27: ce 00 00     ldx 0x0000
8f2a: 8c 00 08     cpx 0x0008
8f2d: 27 22        beq [0x8F51]
8f2f: 77 00 51     asr (0x0051)
8f32: 25 10        bcs [0x8F44]
8f34: a6 52        ldaa (X+0x52)
8f36: 81 0f        cmpa 0x0F
8f38: 6c 52        inc (X+0x52)
8f3a: a6 52        ldaa (X+0x52)
8f3c: 81 04        cmpa 0x04
8f3e: 26 02        bne [0x8F42]
8f40: a7 5a        staa (X+0x5A)
8f42: 20 0a        bra [0x8F4E]
8f44: 6f 52        clr (X+0x52)
8f46: 20 06        bra [0x8F4E]
8f48: a6 52        ldaa (X+0x52)
8f4a: 27 02        beq [0x8F4E]
8f4c: 6a 52        dec (X+0x52)
8f4e: 08           inx
8f4f: 20 d9        bra [0x8F2A]
8f51: 39           rts
8f52: 6f 52        clr (X+0x52)
8f54: 20 f8        bra [0x8F4E]
8f56: 30           tsx
8f57: 2e 35        bgt [0x8F8E]
8f59: 31           ins
8f5a: 2e 30        bgt [0x8F8C]
8f5c: 31           ins
8f5d: 2e 35        bgt [0x8F94]
8f5f: 32           pula
8f60: 2e 30        bgt [0x8F92]
8f62: 32           pula
8f63: 2e 35        bgt [0x8F9A]
8f65: 33           pulb
8f66: 2e 30        bgt [0x8F98]
8f68: 3c           pshx
8f69: 96 12        ldaa (0x0012)
8f6b: 80 01        suba 0x01
8f6d: c6 03        ldab 0x03
8f6f: 3d           mul
8f70: ce 8f 56     ldx 0x8F56
8f73: 3a           abx
8f74: c6 2c        ldab 0x2C
8f76: a6 00        ldaa (X+0x00)
8f78: 08           inx
8f79: bd 8d c5     jsr (0x8DC5)
8f7c: 5c           incb
8f7d: c1 2f        cmpb 0x2F
8f7f: 26 f5        bne [0x8F76]
8f81: 38           pulx
8f82: 39           rts
8f83: 36           psha
8f84: bd 8d 02     jsr (0x8D02)
8f87: c6 02        ldab 0x02
8f89: bd 8c 40     jsr (0x8C40)
8f8c: 32           pula
8f8d: 97 b4        staa (0x00B4)
8f8f: 81 03        cmpa 0x03
8f91: 26 11        bne [0x8FA4]
8f93: bd 8d f4     jsr (0x8DF4)
8f96: 43           coma
8f97: 68 75        asl (X+0x75)
8f99: 63 6b        com (X+0x6B)
8f9b: 20 20        bra [0x8FBD]
8f9d: 20 a0        bra [0x8F3F]
8f9f: ce 90 82     ldx 0x9082
8fa2: 20 4d        bra [0x8FF1]
8fa4: 81 04        cmpa 0x04
8fa6: 26 11        bne [0x8FB9]
8fa8: bd 8d f4     jsr (0x8DF4)
8fab: 4a           deca
8fac: 61           ?
8fad: 73 70 65     com (0x7065)
8fb0: 72           ?
8fb1: 20 20        bra [0x8FD3]
8fb3: a0 ce        suba (X+0xCE)
8fb5: 90 ee        suba (0x00EE)
8fb7: 20 38        bra [0x8FF1]
8fb9: 81 05        cmpa 0x05
8fbb: 26 11        bne [0x8FCE]
8fbd: bd 8d f4     jsr (0x8DF4)
8fc0: 50           negb
8fc1: 61           ?
8fc2: 73 71 75     com (0x7175)
8fc5: 61           ?
8fc6: 6c 6c        inc (X+0x6C)
8fc8: f9 ce 91     adcb (0xCE91)
8fcb: 55           ?
8fcc: 20 23        bra [0x8FF1]
8fce: 81 06        cmpa 0x06
8fd0: 26 11        bne [0x8FE3]
8fd2: bd 8d f4     jsr (0x8DF4)
8fd5: 4d           tsta
8fd6: 75           ?
8fd7: 6e 63        jmp (X+0x63)
8fd9: 68 20        asl (X+0x20)
8fdb: 20 20        bra [0x8FFD]
8fdd: a0 ce        suba (X+0xCE)
8fdf: 91 ca        cmpa (0x00CA)
8fe1: 20 0e        bra [0x8FF1]
8fe3: bd 8d f4     jsr (0x8DF4)
8fe6: 48           asla
8fe7: 65           ?
8fe8: 6c 65        inc (X+0x65)
8fea: 6e 20        jmp (X+0x20)
8fec: 20 a0        bra [0x8F8E]
8fee: ce 92 36     ldx 0x9236
8ff1: 96 b4        ldaa (0x00B4)
8ff3: 80 03        suba 0x03
8ff5: 48           asla
8ff6: 48           asla
8ff7: 97 4b        staa (0x004B)
8ff9: bd 95 14     jsr (0x9514)
8ffc: 97 4c        staa (0x004C)
8ffe: 81 0f        cmpa 0x0F
9000: 26 01        bne [0x9003]
9002: 39           rts
9003: 81 08        cmpa 0x08
9005: 23 08        bls [0x900F]
9007: 80 08        suba 0x08
9009: d6 4b        ldab (0x004B)
900b: cb 02        addb 0x02
900d: d7 4b        stab (0x004B)
900f: 36           psha
9010: 18 de 46     ldy (0x0046)
9013: 32           pula
9014: 5f           clrb
9015: 0d           sec
9016: 59           rolb
9017: 4a           deca
9018: 26 fc        bne [0x9016]
901a: d7 50        stab (0x0050)
901c: d6 4b        ldab (0x004B)
901e: ce 10 80     ldx 0x1080
9021: 3a           abx
9022: 86 02        ldaa 0x02
9024: 97 12        staa (0x0012)
9026: a6 00        ldaa (X+0x00)
9028: 98 50        eora (0x0050)
902a: a7 00        staa (X+0x00)
902c: 6d 00        tst (X+0x00)
902e: 27 16        beq [0x9046]
9030: 86 4f        ldaa 0x4F
9032: c6 0c        ldab 0x0C
9034: bd 8d c5     jsr (0x8DC5)
9037: 86 6e        ldaa 0x6E
9039: c6 0d        ldab 0x0D
903b: bd 8d c5     jsr (0x8DC5)
903e: cc 20 0e     ldd 0x200E
9041: bd 8d c5     jsr (0x8DC5)
9044: 20 0e        bra [0x9054]
9046: 86 66        ldaa 0x66
9048: c6 0d        ldab 0x0D
904a: bd 8d c5     jsr (0x8DC5)
904d: 86 66        ldaa 0x66
904f: c6 0e        ldab 0x0E
9051: bd 8d c5     jsr (0x8DC5)
9054: d6 12        ldab (0x0012)
9056: bd 8c 40     jsr (0x8C40)
9059: bd 8e a5     jsr (0x8EA5)
905c: 81 0d        cmpa 0x0D
905e: 27 14        beq [0x9074]
9060: 20 c4        bra [0x9026]
9062: 81 02        cmpa 0x02
9064: 26 c0        bne [0x9026]
9066: 96 12        ldaa (0x0012)
9068: 81 06        cmpa 0x06
906a: 27 ba        beq [0x9026]
906c: 4c           inca
906d: 97 12        staa (0x0012)
906f: bd 8f 68     jsr (0x8F68)
9072: 20 b2        bra [0x9026]
9074: a6 00        ldaa (X+0x00)
9076: 9a 50        oraa (0x0050)
9078: 98 50        eora (0x0050)
907a: a7 00        staa (X+0x00)
907c: 96 b4        ldaa (0x00B4)
907e: 7e 8f 83     jmp (0x8F83)
9081: 39           rts
9082: 4d           tsta
9083: 6f 75        clr (X+0x75)
9085: 74 68 2c     lsr (0x682C)
9088: 48           asla
9089: 65           ?
908a: 61           ?
908b: 64 20        lsr (X+0x20)
908d: 6c 65        inc (X+0x65)
908f: 66 74        ror (X+0x74)
9091: 2c 48        bge [0x90DB]
9093: 65           ?
9094: 61           ?
9095: 64 20        lsr (X+0x20)
9097: 72           ?
9098: 69 67        rol (X+0x67)
909a: 68 74        asl (X+0x74)
909c: 2c 48        bge [0x90E6]
909e: 65           ?
909f: 61           ?
90a0: 64 20        lsr (X+0x20)
90a2: 75           ?
90a3: 70 2c 45     neg (0x2C45)
90a6: 79 65 73     rol (0x6573)
90a9: 20 72        bra [0x911D]
90ab: 69 67        rol (X+0x67)
90ad: 68 74        asl (X+0x74)
90af: 2c 45        bge [0x90F6]
90b1: 79 65 6c     rol (0x656C)
90b4: 69 64        rol (X+0x64)
90b6: 73 2c 52     com (0x2C52)
90b9: 69 67        rol (X+0x67)
90bb: 68 74        asl (X+0x74)
90bd: 20 68        bra [0x9127]
90bf: 61           ?
90c0: 6e 64        jmp (X+0x64)
90c2: 2c 45        bge [0x9109]
90c4: 79 65 73     rol (0x6573)
90c7: 20 6c        bra [0x9135]
90c9: 65           ?
90ca: 66 74        ror (X+0x74)
90cc: 2c 44        bge [0x9112]
90ce: 53           comb
90cf: 39           rts
90d0: 2c 44        bge [0x9116]
90d2: 53           comb
90d3: 31           ins
90d4: 30           tsx
90d5: 2c 44        bge [0x911B]
90d7: 53           comb
90d8: 31           ins
90d9: 31           ins
90da: 2c 44        bge [0x9120]
90dc: 53           comb
90dd: 31           ins
90de: 32           pula
90df: 2c 44        bge [0x9125]
90e1: 53           comb
90e2: 31           ins
90e3: 33           pulb
90e4: 2c 44        bge [0x912A]
90e6: 53           comb
90e7: 31           ins
90e8: 34           des
90e9: 2c 45        bge [0x9130]
90eb: 78 69 f4     asl (0x69F4)
90ee: 4d           tsta
90ef: 6f 75        clr (X+0x75)
90f1: 74 68 2c     lsr (0x682C)
90f4: 48           asla
90f5: 65           ?
90f6: 61           ?
90f7: 64 20        lsr (X+0x20)
90f9: 6c 65        inc (X+0x65)
90fb: 66 74        ror (X+0x74)
90fd: 2c 48        bge [0x9147]
90ff: 65           ?
9100: 61           ?
9101: 64 20        lsr (X+0x20)
9103: 72           ?
9104: 69 67        rol (X+0x67)
9106: 68 74        asl (X+0x74)
9108: 2c 48        bge [0x9152]
910a: 65           ?
910b: 61           ?
910c: 64 20        lsr (X+0x20)
910e: 75           ?
910f: 70 2c 45     neg (0x2C45)
9112: 79 65 73     rol (0x6573)
9115: 20 72        bra [0x9189]
9117: 69 67        rol (X+0x67)
9119: 68 74        asl (X+0x74)
911b: 2c 45        bge [0x9162]
911d: 79 65 6c     rol (0x656C)
9120: 69 64        rol (X+0x64)
9122: 73 2c 48     com (0x2C48)
9125: 61           ?
9126: 6e 64        jmp (X+0x64)
9128: 73 2c 45     com (0x2C45)
912b: 79 65 73     rol (0x6573)
912e: 20 6c        bra [0x919C]
9130: 65           ?
9131: 66 74        ror (X+0x74)
9133: 2c 44        bge [0x9179]
9135: 53           comb
9136: 39           rts
9137: 2c 44        bge [0x917D]
9139: 53           comb
913a: 31           ins
913b: 30           tsx
913c: 2c 44        bge [0x9182]
913e: 53           comb
913f: 31           ins
9140: 31           ins
9141: 2c 44        bge [0x9187]
9143: 53           comb
9144: 31           ins
9145: 32           pula
9146: 2c 44        bge [0x918C]
9148: 53           comb
9149: 31           ins
914a: 33           pulb
914b: 2c 44        bge [0x9191]
914d: 53           comb
914e: 31           ins
914f: 34           des
9150: 2c 45        bge [0x9197]
9152: 78 69 f4     asl (0x69F4)
9155: 4d           tsta
9156: 6f 75        clr (X+0x75)
9158: 74 68 2d     lsr (0x682D)
915b: 4d           tsta
915c: 75           ?
915d: 73 74 61     com (0x7461)
9160: 63 68        com (X+0x68)
9162: 65           ?
9163: 2c 48        bge [0x91AD]
9165: 65           ?
9166: 61           ?
9167: 64 20        lsr (X+0x20)
9169: 6c 65        inc (X+0x65)
916b: 66 74        ror (X+0x74)
916d: 2c 48        bge [0x91B7]
916f: 65           ?
9170: 61           ?
9171: 64 20        lsr (X+0x20)
9173: 72           ?
9174: 69 67        rol (X+0x67)
9176: 68 74        asl (X+0x74)
9178: 2c 4c        bge [0x91C6]
917a: 65           ?
917b: 66 74        ror (X+0x74)
917d: 20 61        bra [0x91E0]
917f: 72           ?
9180: 6d 2c        tst (X+0x2C)
9182: 45           ?
9183: 79 65 73     rol (0x6573)
9186: 20 72        bra [0x91FA]
9188: 69 67        rol (X+0x67)
918a: 68 74        asl (X+0x74)
918c: 2c 45        bge [0x91D3]
918e: 79 65 6c     rol (0x656C)
9191: 69 64        rol (X+0x64)
9193: 73 2c 52     com (0x2C52)
9196: 69 67        rol (X+0x67)
9198: 68 74        asl (X+0x74)
919a: 20 61        bra [0x91FD]
919c: 72           ?
919d: 6d 2c        tst (X+0x2C)
919f: 45           ?
91a0: 79 65 73     rol (0x6573)
91a3: 20 6c        bra [0x9211]
91a5: 65           ?
91a6: 66 74        ror (X+0x74)
91a8: 2c 44        bge [0x91EE]
91aa: 53           comb
91ab: 39           rts
91ac: 2c 44        bge [0x91F2]
91ae: 53           comb
91af: 31           ins
91b0: 30           tsx
91b1: 2c 44        bge [0x91F7]
91b3: 53           comb
91b4: 31           ins
91b5: 31           ins
91b6: 2c 44        bge [0x91FC]
91b8: 53           comb
91b9: 31           ins
91ba: 32           pula
91bb: 2c 44        bge [0x9201]
91bd: 53           comb
91be: 31           ins
91bf: 33           pulb
91c0: 2c 44        bge [0x9206]
91c2: 53           comb
91c3: 31           ins
91c4: 34           des
91c5: 2c 45        bge [0x920C]
91c7: 78 69 f4     asl (0x69F4)
91ca: 4d           tsta
91cb: 6f 75        clr (X+0x75)
91cd: 74 68 2c     lsr (0x682C)
91d0: 48           asla
91d1: 65           ?
91d2: 61           ?
91d3: 64 20        lsr (X+0x20)
91d5: 6c 65        inc (X+0x65)
91d7: 66 74        ror (X+0x74)
91d9: 2c 48        bge [0x9223]
91db: 65           ?
91dc: 61           ?
91dd: 64 20        lsr (X+0x20)
91df: 72           ?
91e0: 69 67        rol (X+0x67)
91e2: 68 74        asl (X+0x74)
91e4: 2c 4c        bge [0x9232]
91e6: 65           ?
91e7: 66 74        ror (X+0x74)
91e9: 20 61        bra [0x924C]
91eb: 72           ?
91ec: 6d 2c        tst (X+0x2C)
91ee: 45           ?
91ef: 79 65 73     rol (0x6573)
91f2: 20 72        bra [0x9266]
91f4: 69 67        rol (X+0x67)
91f6: 68 74        asl (X+0x74)
91f8: 2c 45        bge [0x923F]
91fa: 79 65 6c     rol (0x656C)
91fd: 69 64        rol (X+0x64)
91ff: 73 2c 52     com (0x2C52)
9202: 69 67        rol (X+0x67)
9204: 68 74        asl (X+0x74)
9206: 20 61        bra [0x9269]
9208: 72           ?
9209: 6d 2c        tst (X+0x2C)
920b: 45           ?
920c: 79 65 73     rol (0x6573)
920f: 20 6c        bra [0x927D]
9211: 65           ?
9212: 66 74        ror (X+0x74)
9214: 2c 44        bge [0x925A]
9216: 53           comb
9217: 39           rts
9218: 2c 44        bge [0x925E]
921a: 53           comb
921b: 31           ins
921c: 30           tsx
921d: 2c 44        bge [0x9263]
921f: 53           comb
9220: 31           ins
9221: 31           ins
9222: 2c 44        bge [0x9268]
9224: 53           comb
9225: 31           ins
9226: 32           pula
9227: 2c 44        bge [0x926D]
9229: 53           comb
922a: 31           ins
922b: 33           pulb
922c: 2c 44        bge [0x9272]
922e: 53           comb
922f: 31           ins
9230: 34           des
9231: 2c 45        bge [0x9278]
9233: 78 69 f4     asl (0x69F4)
9236: 4d           tsta
9237: 6f 75        clr (X+0x75)
9239: 74 68 2c     lsr (0x682C)
923c: 48           asla
923d: 65           ?
923e: 61           ?
923f: 64 20        lsr (X+0x20)
9241: 6c 65        inc (X+0x65)
9243: 66 74        ror (X+0x74)
9245: 2c 48        bge [0x928F]
9247: 65           ?
9248: 61           ?
9249: 64 20        lsr (X+0x20)
924b: 72           ?
924c: 69 67        rol (X+0x67)
924e: 68 74        asl (X+0x74)
9250: 2c 48        bge [0x929A]
9252: 65           ?
9253: 61           ?
9254: 64 20        lsr (X+0x20)
9256: 75           ?
9257: 70 2c 45     neg (0x2C45)
925a: 79 65 73     rol (0x6573)
925d: 20 72        bra [0x92D1]
925f: 69 67        rol (X+0x67)
9261: 68 74        asl (X+0x74)
9263: 2c 45        bge [0x92AA]
9265: 79 65 6c     rol (0x656C)
9268: 69 64        rol (X+0x64)
926a: 73 2c 52     com (0x2C52)
926d: 69 67        rol (X+0x67)
926f: 68 74        asl (X+0x74)
9271: 20 68        bra [0x92DB]
9273: 61           ?
9274: 6e 64        jmp (X+0x64)
9276: 2c 45        bge [0x92BD]
9278: 79 65 73     rol (0x6573)
927b: 20 6c        bra [0x92E9]
927d: 65           ?
927e: 66 74        ror (X+0x74)
9280: 2c 44        bge [0x92C6]
9282: 53           comb
9283: 39           rts
9284: 2c 44        bge [0x92CA]
9286: 53           comb
9287: 31           ins
9288: 30           tsx
9289: 2c 44        bge [0x92CF]
928b: 53           comb
928c: 31           ins
928d: 31           ins
928e: 2c 44        bge [0x92D4]
9290: 53           comb
9291: 31           ins
9292: 32           pula
9293: 2c 44        bge [0x92D9]
9295: 53           comb
9296: 31           ins
9297: 33           pulb
9298: 2c 44        bge [0x92DE]
929a: 53           comb
929b: 31           ins
929c: 34           des
929d: 2c 45        bge [0x92E4]
929f: 78 69 f4     asl (0x69F4)
92a2: bd 86 d4     jsr (0x86D4)
92a5: c6 01        ldab 0x01
92a7: bd 8c 40     jsr (0x8C40)
92aa: bd 8d f4     jsr (0x8DF4)
92ad: 20 20        bra [0x92CF]
92af: 44           lsra
92b0: 69 61        rol (X+0x61)
92b2: 67 6e        asr (X+0x6E)
92b4: 6f 73        clr (X+0x73)
92b6: 74 69 63     lsr (0x6963)
92b9: 73 20 20     com (0x2020)
92bc: a0 bd        suba (X+0xBD)
92be: 8d ed        bsr [0x92AD]
92c0: 20 20        bra [0x92E2]
92c2: 20 20        bra [0x92E4]
92c4: 20 20        bra [0x92E6]
92c6: 20 20        bra [0x92E8]
92c8: 20 20        bra [0x92EA]
92ca: 20 20        bra [0x92EC]
92cc: 20 20        bra [0x92EE]
92ce: 20 a0        bra [0x9270]
92d0: c6 01        ldab 0x01
92d2: bd 8c 40     jsr (0x8C40)
92d5: bd 8d 13     jsr (0x8D13)
92d8: ce 93 e3     ldx 0x93E3
92db: bd 95 14     jsr (0x9514)
92de: 81 11        cmpa 0x11
92e0: 26 14        bne [0x92F6]
92e2: bd 86 d4     jsr (0x86D4)
92e5: 5f           clrb
92e6: d7 62        stab (0x0062)
92e8: bd fa f9     jsr (0xFAF9)
92eb: b6 18 04     ldaa (0x1804)
92ee: 84 bf        anda 0xBF
92f0: b7 18 04     staa (0x1804)
92f3: 7e 81 d4     jmp (0x81D4)
92f6: 81 03        cmpa 0x03
92f8: 25 09        bcs [0x9303]
92fa: 81 08        cmpa 0x08
92fc: 24 05        bcc [0x9303]
92fe: bd 8f 83     jsr (0x8F83)
9301: 20 a2        bra [0x92A5]
9303: 81 02        cmpa 0x02
9305: 26 08        bne [0x930F]
9307: bd 9f 5b     jsr (0x9F5B)
930a: 25 99        bcs [0x92A5]
930c: 7e 96 85     jmp (0x9685)
930f: 81 0b        cmpa 0x0B
9311: 26 0d        bne [0x9320]
9313: bd 8d 13     jsr (0x8D13)
9316: bd 9f 09     jsr (0x9F09)
9319: c6 03        ldab 0x03
931b: bd 8c 40     jsr (0x8C40)
931e: 20 85        bra [0x92A5]
9320: 81 09        cmpa 0x09
9322: 26 0e        bne [0x9332]
9324: bd 9f 5b     jsr (0x9F5B)
9327: 24 03        bcc [0x932C]
9329: 7e 92 a5     jmp (0x92A5)
932c: bd 9e cf     jsr (0x9ECF)
932f: 7e 92 a5     jmp (0x92A5)
9332: 81 0a        cmpa 0x0A
9334: 26 0b        bne [0x9341]
9336: bd 9f 5b     jsr (0x9F5B)
9339: 25 03        bcs [0x933E]
933b: bd 9e ec     jsr (0x9EEC)
933e: 7e 92 a5     jmp (0x92A5)
9341: 81 01        cmpa 0x01
9343: 26 03        bne [0x9348]
9345: 7e a1 26     jmp (0xA126)
9348: 81 08        cmpa 0x08
934a: 26 1f        bne [0x936B]
934c: bd 9f 5b     jsr (0x9F5B)
934f: 25 1a        bcs [0x936B]
9351: bd 8d f4     jsr (0x8DF4)
9354: 52           ?
9355: 65           ?
9356: 73 65 74     com (0x6574)
9359: 20 53        bra [0x93AE]
935b: 79 73 74     rol (0x7374)
935e: 65           ?
935f: 6d a1        tst (X+0xA1)
9361: 7e a2 86     jmp (0xA286)
9364: c6 02        ldab 0x02
9366: bd 8c 40     jsr (0x8C40)
9369: 20 18        bra [0x9383]
936b: 81 0c        cmpa 0x0C
936d: 26 14        bne [0x9383]
936f: bd 8b 58     jsr (0x8B58)
9372: 5f           clrb
9373: d7 62        stab (0x0062)
9375: bd fa f9     jsr (0xFAF9)
9378: b6 18 04     ldaa (0x1804)
937b: 84 bf        anda 0xBF
937d: b7 18 04     staa (0x1804)
9380: 7e 92 a2     jmp (0x92A2)
9383: 81 0d        cmpa 0x0D
9385: 26 2e        bne [0x93B5]
9387: bd 8c f9     jsr (0x8CF9)
938a: bd 8d f4     jsr (0x8DF4)
938d: 20 20        bra [0x93AF]
938f: 42           ?
9390: 75           ?
9391: 74 74 6f     lsr (0x746F)
9394: 6e 20        jmp (X+0x20)
9396: 20 74        bra [0x940C]
9398: 65           ?
9399: 73 f4 bd     com (0xF4BD)
939c: 8d ed        bsr [0x938B]
939e: 20 20        bra [0x93C0]
93a0: 20 50        bra [0x93F2]
93a2: 52           ?
93a3: 4f           clra
93a4: 47           asra
93a5: 20 65        bra [0x940C]
93a7: 78 69 74     asl (0x6974)
93aa: f3 bd a5     addd (0xBDA5)
93ad: 63 5f        com (X+0x5F)
93af: bd fa f9     jsr (0xFAF9)
93b2: 7e 92 a5     jmp (0x92A5)
93b5: 81 0e        cmpa 0x0E
93b7: 26 10        bne [0x93C9]
93b9: bd 9f 5b     jsr (0x9F5B)
93bc: 24 03        bcc [0x93C1]
93be: 7e 92 a5     jmp (0x92A5)
93c1: c6 01        ldab 0x01
93c3: bd 8c 40     jsr (0x8C40)
93c6: 7e 94 aa     jmp (0x94AA)
93c9: 81 0f        cmpa 0x0F
93cb: 26 06        bne [0x93D3]
93cd: bd a8 a7     jsr (0xA8A7)
93d0: 7e 92 a5     jmp (0x92A5)
93d3: 81 10        cmpa 0x10
93d5: 26 09        bne [0x93E0]
93d7: bd 9f 5b     jsr (0x9F5B)
93da: bd 95 ca     jsr (0x95CA)
93dd: 7e 92 a5     jmp (0x92A5)
93e0: 7e 92 e2     jmp (0x92E2)
93e3: 56           rorb
93e4: 43           coma
93e5: 52           ?
93e6: 20 61        bra [0x9449]
93e8: 64 6a        lsr (X+0x6A)
93ea: 75           ?
93eb: 73 74 2c     com (0x742C)
93ee: 53           comb
93ef: 65           ?
93f0: 74 20 52     lsr (0x2052)
93f3: 61           ?
93f4: 6e 64        jmp (X+0x64)
93f6: 6f 6d        clr (X+0x6D)
93f8: 2c 43        bge [0x943D]
93fa: 68 75        asl (X+0x75)
93fc: 63 6b        com (X+0x6B)
93fe: 20 45        bra [0x9445]
9400: 2e 20        bgt [0x9422]
9402: 43           coma
9403: 68 65        asl (X+0x65)
9405: 65           ?
9406: 73 65 2c     com (0x652C)
9409: 4a           deca
940a: 61           ?
940b: 73 70 65     com (0x7065)
940e: 72           ?
940f: 2c 50        bge [0x9461]
9411: 61           ?
9412: 73 71 75     com (0x7175)
9415: 61           ?
9416: 6c 6c        inc (X+0x6C)
9418: 79 2c 4d     rol (0x2C4D)
941b: 75           ?
941c: 6e 63        jmp (X+0x63)
941e: 68 2c        asl (X+0x2C)
9420: 48           asla
9421: 65           ?
9422: 6c 65        inc (X+0x65)
9424: 6e 2c        jmp (X+0x2C)
9426: 52           ?
9427: 65           ?
9428: 73 65 74     com (0x6574)
942b: 20 53        bra [0x9480]
942d: 79 73 74     rol (0x7374)
9430: 65           ?
9431: 6d 2c        tst (X+0x2C)
9433: 52           ?
9434: 65           ?
9435: 73 65 74     com (0x6574)
9438: 20 72        bra [0x94AC]
943a: 65           ?
943b: 67 20        asr (X+0x20)
943d: 74 61 70     lsr (0x6170)
9440: 65           ?
9441: 23 2c        bls [0x946F]
9443: 52           ?
9444: 65           ?
9445: 73 65 74     com (0x6574)
9448: 20 6c        bra [0x94B6]
944a: 69 76        rol (X+0x76)
944c: 20 74        bra [0x94C2]
944e: 61           ?
944f: 70 65 23     neg (0x6523)
9452: 2c 56        bge [0x94AA]
9454: 69 65        rol (X+0x65)
9456: 77 20 54     asr (0x2054)
9459: 61           ?
945a: 70 65 20     neg (0x6520)
945d: 23 27        bls [0x9486]
945f: 73 2c 41     com (0x2C41)
9462: 6c 6c        inc (X+0x6C)
9464: 20 4c        bra [0x94B2]
9466: 69 67        rol (X+0x67)
9468: 68 74        asl (X+0x74)
946a: 73 20 4f     com (0x204F)
946d: 6e 2c        jmp (X+0x2C)
946f: 42           ?
9470: 75           ?
9471: 74 74 6f     lsr (0x746F)
9474: 6e 20        jmp (X+0x20)
9476: 74 65 73     lsr (0x6573)
9479: 74 2c 4b     lsr (0x2C4B)
947c: 69 6e        rol (X+0x6E)
947e: 67 20        asr (X+0x20)
9480: 65           ?
9481: 6e 61        jmp (X+0x61)
9483: 62           ?
9484: 6c 65        inc (X+0x65)
9486: 2c 57        bge [0x94DF]
9488: 61           ?
9489: 72           ?
948a: 6d 2d        tst (X+0x2D)
948c: 55           ?
948d: 70 2c 53     neg (0x2C53)
9490: 68 6f        asl (X+0x6F)
9492: 77 20 54     asr (0x2054)
9495: 79 70 65     rol (0x7065)
9498: 2c 51        bge [0x94EB]
949a: 75           ?
949b: 69 74        rol (X+0x74)
949d: 20 44        bra [0x94E3]
949f: 69 61        rol (X+0x61)
94a1: 67 6e        asr (X+0x6E)
94a3: 6f 73        clr (X+0x73)
94a5: 74 69 63     lsr (0x6963)
94a8: f3 00 7d     addd (0x007D)
94ab: 04           lsrd
94ac: 2a 27        bpl [0x94D5]
94ae: 27 bd        beq [0x946D]
94b0: 8d f4        bsr [0x94A6]
94b2: 4b           ?
94b3: 69 6e        rol (X+0x6E)
94b5: 67 20        asr (X+0x20)
94b7: 69 73        rol (X+0x73)
94b9: 20 45        bra [0x9500]
94bb: 6e 61        jmp (X+0x61)
94bd: 62           ?
94be: 6c 65        inc (X+0x65)
94c0: e4 bd        andb (X+0xBD)
94c2: 8d ed        bsr [0x94B1]
94c4: 45           ?
94c5: 4e           ?
94c6: 54           lsrb
94c7: 45           ?
94c8: 52           ?
94c9: 20 74        bra [0x953F]
94cb: 6f 20        clr (X+0x20)
94cd: 64 69        lsr (X+0x69)
94cf: 73 61 62     com (0x6162)
94d2: 6c e5        inc (X+0xE5)
94d4: 20 25        bra [0x94FB]
94d6: bd 8d f4     jsr (0x8DF4)
94d9: 4b           ?
94da: 69 6e        rol (X+0x6E)
94dc: 67 20        asr (X+0x20)
94de: 69 73        rol (X+0x73)
94e0: 20 44        bra [0x9526]
94e2: 69 73        rol (X+0x73)
94e4: 61           ?
94e5: 62           ?
94e6: 6c 65        inc (X+0x65)
94e8: e4 bd        andb (X+0xBD)
94ea: 8d ed        bsr [0x94D9]
94ec: 45           ?
94ed: 4e           ?
94ee: 54           lsrb
94ef: 45           ?
94f0: 52           ?
94f1: 20 74        bra [0x9567]
94f3: 6f 20        clr (X+0x20)
94f5: 65           ?
94f6: 6e 61        jmp (X+0x61)
94f8: 62           ?
94f9: 6c e5        inc (X+0xE5)
94fb: bd 8e a5     jsr (0x8EA5)
94fe: 4d           tsta
94ff: 27 fa        beq [0x94FB]
9501: 81 0d        cmpa 0x0D
9503: 27 02        beq [0x9507]
9505: 20 0a        bra [0x9511]
9507: b6 04 2a     ldaa (0x042A)
950a: 84 01        anda 0x01
950c: 88 01        eora 0x01
950e: b7 04 2a     staa (0x042A)
9511: 7e 92 a5     jmp (0x92A5)
9514: 86 01        ldaa 0x01
9516: 97 a6        staa (0x00A6)
9518: 97 a7        staa (0x00A7)
951a: df 12        stx (0x0012)
951c: 20 09        bra [0x9527]
951e: 86 01        ldaa 0x01
9520: 97 a7        staa (0x00A7)
9522: 7f 00 a6     clr (0x00A6)
9525: df 12        stx (0x0012)
9527: 7f 00 16     clr (0x0016)
952a: 18 de 46     ldy (0x0046)
952d: 7d 00 a6     tst (0x00A6)
9530: 26 07        bne [0x9539]
9532: bd 8d 02     jsr (0x8D02)
9535: 86 80        ldaa 0x80
9537: 20 05        bra [0x953E]
9539: bd 8d 13     jsr (0x8D13)
953c: 86 c0        ldaa 0xC0
953e: 18 a7 00     staa (Y+0x00)
9541: 18 6f 01     clr (Y+0x01)
9544: 18 08        iny
9546: 18 08        iny
9548: 18 8c 05 80  cpy 0x0580
954c: 25 04        bcs [0x9552]
954e: 18 ce 05 00  ldy 0x0500
9552: df 14        stx (0x0014)
9554: a6 00        ldaa (X+0x00)
9556: 2a 04        bpl [0x955C]
9558: c6 01        ldab 0x01
955a: d7 16        stab (0x0016)
955c: 81 2c        cmpa 0x2C
955e: 27 1e        beq [0x957E]
9560: 18 6f 00     clr (Y+0x00)
9563: 84 7f        anda 0x7F
9565: 18 a7 01     staa (Y+0x01)
9568: 18 08        iny
956a: 18 08        iny
956c: 18 8c 05 80  cpy 0x0580
9570: 25 04        bcs [0x9576]
9572: 18 ce 05 00  ldy 0x0500
9576: 7d 00 16     tst (0x0016)
9579: 26 03        bne [0x957E]
957b: 08           inx
957c: 20 d6        bra [0x9554]
957e: 08           inx
957f: 86 01        ldaa 0x01
9581: 97 43        staa (0x0043)
9583: 18 6f 00     clr (Y+0x00)
9586: 18 6f 01     clr (Y+0x01)
9589: 18 df 46     sty (0x0046)
958c: bd 8e a5     jsr (0x8EA5)
958f: 27 fb        beq [0x958C]
9591: 81 02        cmpa 0x02
9593: 26 0a        bne [0x959F]
9595: 7d 00 16     tst (0x0016)
9598: 26 05        bne [0x959F]
959a: 7c 00 a7     inc (0x00A7)
959d: 20 88        bra [0x9527]
959f: 81 01        cmpa 0x01
95a1: 26 20        bne [0x95C3]
95a3: 18 de 14     ldy (0x0014)
95a6: 18 9c 12     cpy (0x0012)
95a9: 23 e1        bls [0x958C]
95ab: 7a 00 a7     dec (0x00A7)
95ae: de 14        ldx (0x0014)
95b0: 09           dex
95b1: 09           dex
95b2: 9c 12        cpx (0x0012)
95b4: 26 03        bne [0x95B9]
95b6: 7e 95 27     jmp (0x9527)
95b9: a6 00        ldaa (X+0x00)
95bb: 81 2c        cmpa 0x2C
95bd: 26 f2        bne [0x95B1]
95bf: 08           inx
95c0: 7e 95 27     jmp (0x9527)
95c3: 81 0d        cmpa 0x0D
95c5: 26 c5        bne [0x958C]
95c7: 96 a7        ldaa (0x00A7)
95c9: 39           rts
95ca: b6 04 5c     ldaa (0x045C)
95cd: 27 14        beq [0x95E3]
95cf: bd 8d f4     jsr (0x8DF4)
95d2: 43           coma
95d3: 75           ?
95d4: 72           ?
95d5: 72           ?
95d6: 65           ?
95d7: 6e 74        jmp (X+0x74)
95d9: 3a           abx
95da: 20 43        bra [0x961F]
95dc: 4e           ?
95dd: 52           ?
95de: 20 20        bra [0x9600]
95e0: a0 20        suba (X+0x20)
95e2: 12 bd 8d f4  brset (0x00BD), 0x8D, [0x95DA]
95e6: 43           coma
95e7: 75           ?
95e8: 72           ?
95e9: 72           ?
95ea: 65           ?
95eb: 6e 74        jmp (X+0x74)
95ed: 3a           abx
95ee: 20 52        bra [0x9642]
95f0: 31           ins
95f1: 32           pula
95f2: 20 20        bra [0x9614]
95f4: a0 bd        suba (X+0xBD)
95f6: 8d ed        bsr [0x95E5]
95f8: 3c           pshx
95f9: 45           ?
95fa: 6e 74        jmp (X+0x74)
95fc: 65           ?
95fd: 72           ?
95fe: 3e           wai
95ff: 20 74        bra [0x9675]
9601: 6f 20        clr (X+0x20)
9603: 63 68        com (X+0x68)
9605: 67 ae        asr (X+0xAE)
9607: bd 8e a5     jsr (0x8EA5)
960a: 27 fb        beq [0x9607]
960c: 81 0d        cmpa 0x0D
960e: 26 0f        bne [0x961F]
9610: b6 04 5c     ldaa (0x045C)
9613: 27 05        beq [0x961A]
9615: 7f 04 5c     clr (0x045C)
9618: 20 05        bra [0x961F]
961a: 86 01        ldaa 0x01
961c: b7 04 5c     staa (0x045C)
961f: 39           rts
9620: 43           coma
9621: 68 75        asl (X+0x75)
9623: 63 6b        com (X+0x6B)
9625: 2c 4a        bge [0x9671]
9627: 61           ?
9628: 73 70 65     com (0x7065)
962b: 72           ?
962c: 2c 50        bge [0x967E]
962e: 61           ?
962f: 73 71 75     com (0x7175)
9632: 61           ?
9633: 6c 6c        inc (X+0x6C)
9635: 79 2c 4d     rol (0x2C4D)
9638: 75           ?
9639: 6e 63        jmp (X+0x63)
963b: 68 2c        asl (X+0x2C)
963d: 48           asla
963e: 65           ?
963f: 6c 65        inc (X+0x65)
9641: 6e 2c        jmp (X+0x2C)
9643: 4c           inca
9644: 69 67        rol (X+0x67)
9646: 68 74        asl (X+0x74)
9648: 20 31        bra [0x967B]
964a: 2c 4c        bge [0x9698]
964c: 69 67        rol (X+0x67)
964e: 68 74        asl (X+0x74)
9650: 20 32        bra [0x9684]
9652: 2c 4c        bge [0x96A0]
9654: 69 67        rol (X+0x67)
9656: 68 74        asl (X+0x74)
9658: 20 33        bra [0x968D]
965a: 2c 53        bge [0x96AF]
965c: 74 61 72     lsr (0x6172)
965f: 20 45        bra [0x96A6]
9661: 46           rora
9662: 58           aslb
9663: 2c 57        bge [0x96BC]
9665: 69 6e        rol (X+0x6E)
9667: 6b           ?
9668: 20 53        bra [0x96BD]
966a: 70 6f 74     neg (0x6F74)
966d: 2c 47        bge [0x96B6]
966f: 6f 62        clr (X+0x62)
9671: 6f 2c        clr (X+0x2C)
9673: 43           coma
9674: 6c 65        inc (X+0x65)
9676: 61           ?
9677: 72           ?
9678: 20 41        bra [0x96BB]
967a: 6c 6c        inc (X+0x6C)
967c: 20 52        bra [0x96D0]
967e: 6e 64        jmp (X+0x64)
9680: 2c 45        bge [0x96C7]
9682: 78 69 f4     asl (0x69F4)
9685: bd 8d f4     jsr (0x8DF4)
9688: 52           ?
9689: 61           ?
968a: 6e 64        jmp (X+0x64)
968c: 6f 6d        clr (X+0x6D)
968e: 20 20        bra [0x96B0]
9690: 20 20        bra [0x96B2]
9692: 20 20        bra [0x96B4]
9694: 20 20        bra [0x96B6]
9696: 20 a0        bra [0x9638]
9698: ce 96 20     ldx 0x9620
969b: bd 95 14     jsr (0x9514)
969e: 5f           clrb
969f: 37           pshb
96a0: 81 0d        cmpa 0x0D
96a2: 26 03        bne [0x96A7]
96a4: 7e 97 6b     jmp (0x976B)
96a7: 81 0c        cmpa 0x0C
96a9: 26 21        bne [0x96CC]
96ab: 7f 04 01     clr (0x0401)
96ae: 7f 04 2b     clr (0x042B)
96b1: bd 8d f4     jsr (0x8DF4)
96b4: 41           ?
96b5: 6c 6c        inc (X+0x6C)
96b7: 20 52        bra [0x970B]
96b9: 6e 64        jmp (X+0x64)
96bb: 20 43        bra [0x9700]
96bd: 6c 65        inc (X+0x65)
96bf: 61           ?
96c0: 72           ?
96c1: 65           ?
96c2: 64 a1        lsr (X+0xA1)
96c4: c6 64        ldab 0x64
96c6: bd 8c 32     jsr (0x8C32)
96c9: 7e 97 6b     jmp (0x976B)
96cc: 81 09        cmpa 0x09
96ce: 25 05        bcs [0x96D5]
96d0: 80 08        suba 0x08
96d2: 33           pulb
96d3: 5c           incb
96d4: 37           pshb
96d5: 5f           clrb
96d6: 0d           sec
96d7: 59           rolb
96d8: 4a           deca
96d9: 26 fc        bne [0x96D7]
96db: d7 12        stab (0x0012)
96dd: c8 ff        eorb 0xFF
96df: d7 13        stab (0x0013)
96e1: cc 20 34     ldd 0x2034
96e4: bd 8d c5     jsr (0x8DC5)
96e7: 33           pulb
96e8: 37           pshb
96e9: 5d           tstb
96ea: 27 05        beq [0x96F1]
96ec: b6 04 2b     ldaa (0x042B)
96ef: 20 03        bra [0x96F4]
96f1: b6 04 01     ldaa (0x0401)
96f4: 94 12        anda (0x0012)
96f6: 27 0a        beq [0x9702]
96f8: 18 de 46     ldy (0x0046)
96fb: bd 8e 0d     jsr (0x8E0D)
96fe: 4f           clra
96ff: ee 20        ldx (X+0x20)
9701: 09           dex
9702: 18 de 46     ldy (0x0046)
9705: bd 8e 0d     jsr (0x8E0D)
9708: 4f           clra
9709: 66 e6        ror (X+0xE6)
970b: cc 20 34     ldd 0x2034
970e: bd 8d c5     jsr (0x8DC5)
9711: bd 8e a5     jsr (0x8EA5)
9714: 27 fb        beq [0x9711]
9716: 81 01        cmpa 0x01
9718: 26 22        bne [0x973C]
971a: 33           pulb
971b: 37           pshb
971c: 5d           tstb
971d: 27 0a        beq [0x9729]
971f: b6 04 2b     ldaa (0x042B)
9722: 9a 12        oraa (0x0012)
9724: b7 04 2b     staa (0x042B)
9727: 20 08        bra [0x9731]
9729: b6 04 01     ldaa (0x0401)
972c: 9a 12        oraa (0x0012)
972e: b7 04 01     staa (0x0401)
9731: 18 de 46     ldy (0x0046)
9734: bd 8e 0d     jsr (0x8E0D)
9737: 4f           clra
9738: 6e a0        jmp (X+0xA0)
973a: 20 a5        bra [0x96E1]
973c: 81 02        cmpa 0x02
973e: 26 23        bne [0x9763]
9740: 33           pulb
9741: 37           pshb
9742: 5d           tstb
9743: 27 0a        beq [0x974F]
9745: b6 04 2b     ldaa (0x042B)
9748: 94 13        anda (0x0013)
974a: b7 04 2b     staa (0x042B)
974d: 20 08        bra [0x9757]
974f: b6 04 01     ldaa (0x0401)
9752: 94 13        anda (0x0013)
9754: b7 04 01     staa (0x0401)
9757: 18 de 46     ldy (0x0046)
975a: bd 8e 0d     jsr (0x8E0D)
975d: 4f           clra
975e: 66 e6        ror (X+0xE6)
9760: 7e 96 e1     jmp (0x96E1)
9763: 81 0d        cmpa 0x0D
9765: 26 aa        bne [0x9711]
9767: 33           pulb
9768: 7e 96 85     jmp (0x9685)
976b: 33           pulb
976c: 7e 92 a2     jmp (0x92A2)
976f: ce 00 00     ldx 0x0000
9772: 18 ce 80 00  ldy 0x8000
9776: 18 e6 00     ldab (Y+0x00)
9779: 18 08        iny
977b: 3a           abx
977c: 18 8c 00 00  cpy 0x0000
9780: 26 f4        bne [0x9776]
9782: df 17        stx (0x0017)
9784: 96 17        ldaa (0x0017)
9786: bd 97 ab     jsr (0x97AB)
9789: 96 12        ldaa (0x0012)
978b: c6 33        ldab 0x33
978d: bd 8d c5     jsr (0x8DC5)
9790: 96 13        ldaa (0x0013)
9792: c6 34        ldab 0x34
9794: bd 8d c5     jsr (0x8DC5)
9797: 96 18        ldaa (0x0018)
9799: bd 97 ab     jsr (0x97AB)
979c: 96 12        ldaa (0x0012)
979e: c6 35        ldab 0x35
97a0: bd 8d c5     jsr (0x8DC5)
97a3: 96 13        ldaa (0x0013)
97a5: c6 36        ldab 0x36
97a7: bd 8d c5     jsr (0x8DC5)
97aa: 39           rts
97ab: 36           psha
97ac: 84 0f        anda 0x0F
97ae: 8b 30        adda 0x30
97b0: 81 39        cmpa 0x39
97b2: 23 02        bls [0x97B6]
97b4: 8b 07        adda 0x07
97b6: 97 13        staa (0x0013)
97b8: 32           pula
97b9: 84 f0        anda 0xF0
97bb: 44           lsra
97bc: 44           lsra
97bd: 44           lsra
97be: 44           lsra
97bf: 8b 30        adda 0x30
97c1: 81 39        cmpa 0x39
97c3: 23 02        bls [0x97C7]
97c5: 8b 07        adda 0x07
97c7: 97 12        staa (0x0012)
97c9: 39           rts
97ca: bd 9d 4f     jsr (0x9D4F)
97cd: 24 03        bcc [0x97D2]
97cf: 7e 9a 8f     jmp (0x9A8F)
97d2: 7d 00 79     tst (0x0079)
97d5: 26 0b        bne [0x97E2]
97d7: fc 04 10     ldd (0x0410)
97da: c3 00 01     addd 0x0001
97dd: fd 04 10     std (0x0410)
97e0: 20 09        bra [0x97EB]
97e2: fc 04 12     ldd (0x0412)
97e5: c3 00 01     addd 0x0001
97e8: fd 04 12     std (0x0412)
97eb: 86 78        ldaa 0x78
97ed: 97 63        staa (0x0063)
97ef: 97 64        staa (0x0064)
97f1: bd a3 50     jsr (0xA350)
97f4: bd ab 18     jsr (0xAB18)
97f7: 86 01        ldaa 0x01
97f9: 97 4e        staa (0x004E)
97fb: 97 76        staa (0x0076)
97fd: 7f 00 75     clr (0x0075)
9800: 7f 00 77     clr (0x0077)
9803: bd 87 be     jsr (0x87BE)
9806: d6 7b        ldab (0x007B)
9808: ca 20        orab 0x20
980a: c4 f7        andb 0xF7
980c: bd 87 58     jsr (0x8758)
980f: 7e 85 ad     jmp (0x85AD)
9812: 7f 00 76     clr (0x0076)
9815: 7f 00 75     clr (0x0075)
9818: 7f 00 77     clr (0x0077)
981b: 7f 00 4e     clr (0x004E)
981e: d6 7b        ldab (0x007B)
9820: ca 0c        orab 0x0C
9822: bd 87 58     jsr (0x8758)
9825: bd a3 5b     jsr (0xA35B)
9828: bd 86 d4     jsr (0x86D4)
982b: bd 9c 61     jsr (0x9C61)
982e: bd 8e a5     jsr (0x8EA5)
9831: 7e 84 56     jmp (0x8456)
9834: bd 9c 61     jsr (0x9C61)
9837: 7f 00 4e     clr (0x004E)
983a: d6 7b        ldab (0x007B)
983c: ca 24        orab 0x24
983e: c4 f7        andb 0xF7
9840: bd 87 58     jsr (0x8758)
9843: bd 87 be     jsr (0x87BE)
9846: bd 8e a5     jsr (0x8EA5)
9849: 7e 84 56     jmp (0x8456)
984c: 7f 00 78     clr (0x0078)
984f: b6 10 8a     ldaa (0x108A)
9852: 84 f9        anda 0xF9
9854: b7 10 8a     staa (0x108A)
9857: 7d 00 af     tst (0x00AF)
985a: 26 61        bne [0x98BD]
985c: 96 62        ldaa (0x0062)
985e: 84 01        anda 0x01
9860: 27 5b        beq [0x98BD]
9862: c6 fd        ldab 0xFD
9864: bd 86 f7     jsr (0x86F7)
9867: cc 00 32     ldd 0x0032
986a: dd 1b        std (0x001B)
986c: cc 75 30     ldd 0x7530
986f: dd 1d        std (0x001D)
9871: 7f 00 5a     clr (0x005A)
9874: bd 9b 29     jsr (0x9B29)
9877: 7d 00 31     tst (0x0031)
987a: 26 04        bne [0x9880]
987c: 96 5a        ldaa (0x005A)
987e: 27 19        beq [0x9899]
9880: 7f 00 31     clr (0x0031)
9883: d6 62        ldab (0x0062)
9885: c4 fe        andb 0xFE
9887: d7 62        stab (0x0062)
9889: bd fa f9     jsr (0xFAF9)
988c: bd aa 50     jsr (0xAA50)
988f: c6 fb        ldab 0xFB
9891: bd 86 f7     jsr (0x86F7)
9894: 7f 00 5a     clr (0x005A)
9897: 20 4b        bra [0x98E4]
9899: dc 1b        ldd (0x001B)
989b: 26 d7        bne [0x9874]
989d: d6 62        ldab (0x0062)
989f: c8 01        eorb 0x01
98a1: d7 62        stab (0x0062)
98a3: bd fa f9     jsr (0xFAF9)
98a6: c4 01        andb 0x01
98a8: 26 05        bne [0x98AF]
98aa: bd aa 49     jsr (0xAA49)
98ad: 20 03        bra [0x98B2]
98af: bd aa 50     jsr (0xAA50)
98b2: cc 00 32     ldd 0x0032
98b5: dd 1b        std (0x001B)
98b7: dc 1d        ldd (0x001D)
98b9: 27 c5        beq [0x9880]
98bb: 20 b7        bra [0x9874]
98bd: 7d 00 75     tst (0x0075)
98c0: 27 03        beq [0x98C5]
98c2: 7e 99 49     jmp (0x9949)
98c5: 96 62        ldaa (0x0062)
98c7: 84 02        anda 0x02
98c9: 27 4e        beq [0x9919]
98cb: 7d 00 af     tst (0x00AF)
98ce: 26 0b        bne [0x98DB]
98d0: fc 04 24     ldd (0x0424)
98d3: c3 00 01     addd 0x0001
98d6: fd 04 24     std (0x0424)
98d9: 20 09        bra [0x98E4]
98db: fc 04 22     ldd (0x0422)
98de: c3 00 01     addd 0x0001
98e1: fd 04 22     std (0x0422)
98e4: fc 04 18     ldd (0x0418)
98e7: c3 00 01     addd 0x0001
98ea: fd 04 18     std (0x0418)
98ed: 86 78        ldaa 0x78
98ef: 97 63        staa (0x0063)
98f1: 97 64        staa (0x0064)
98f3: d6 62        ldab (0x0062)
98f5: c4 f7        andb 0xF7
98f7: ca 02        orab 0x02
98f9: d7 62        stab (0x0062)
98fb: bd fa f9     jsr (0xFAF9)
98fe: bd aa 55     jsr (0xAA55)
9901: 86 01        ldaa 0x01
9903: 97 4e        staa (0x004E)
9905: 97 75        staa (0x0075)
9907: d6 7b        ldab (0x007B)
9909: c4 df        andb 0xDF
990b: bd 87 58     jsr (0x8758)
990e: bd 87 be     jsr (0x87BE)
9911: bd a3 50     jsr (0xA350)
9914: bd ab 18     jsr (0xAB18)
9917: 20 30        bra [0x9949]
9919: d6 62        ldab (0x0062)
991b: c4 f5        andb 0xF5
991d: ca 40        orab 0x40
991f: d7 62        stab (0x0062)
9921: bd fa f9     jsr (0xFAF9)
9924: bd aa 5a     jsr (0xAA5A)
9927: 7d 00 af     tst (0x00AF)
992a: 26 04        bne [0x9930]
992c: c6 01        ldab 0x01
992e: d7 b6        stab (0x00B6)
9930: bd 9c 61     jsr (0x9C61)
9933: 7f 00 4e     clr (0x004E)
9936: 7f 00 75     clr (0x0075)
9939: 86 01        ldaa 0x01
993b: 97 77        staa (0x0077)
993d: d6 7b        ldab (0x007B)
993f: ca 24        orab 0x24
9941: c4 f7        andb 0xF7
9943: bd 87 58     jsr (0x8758)
9946: bd 87 a1     jsr (0x87A1)
9949: 7f 00 af     clr (0x00AF)
994c: 7e 85 ad     jmp (0x85AD)
994f: 7f 00 77     clr (0x0077)
9952: bd 9c 61     jsr (0x9C61)
9955: 7f 00 4e     clr (0x004E)
9958: d6 62        ldab (0x0062)
995a: c4 bf        andb 0xBF
995c: 7d 00 75     tst (0x0075)
995f: 27 02        beq [0x9963]
9961: c4 fd        andb 0xFD
9963: d7 62        stab (0x0062)
9965: bd fa f9     jsr (0xFAF9)
9968: bd aa 5a     jsr (0xAA5A)
996b: 7f 00 5b     clr (0x005B)
996e: bd 87 be     jsr (0x87BE)
9971: d6 7b        ldab (0x007B)
9973: ca 20        orab 0x20
9975: bd 87 58     jsr (0x8758)
9978: 7f 00 75     clr (0x0075)
997b: 7f 00 76     clr (0x0076)
997e: 7e 98 25     jmp (0x9825)
9981: d6 7b        ldab (0x007B)
9983: c4 fb        andb 0xFB
9985: bd 87 58     jsr (0x8758)
9988: 7e 85 ad     jmp (0x85AD)
998b: d6 7b        ldab (0x007B)
998d: ca 04        orab 0x04
998f: bd 87 58     jsr (0x8758)
9992: 7e 85 ad     jmp (0x85AD)
9995: d6 7b        ldab (0x007B)
9997: c4 f7        andb 0xF7
9999: bd 87 58     jsr (0x8758)
999c: 7e 85 ad     jmp (0x85AD)
999f: 7d 00 77     tst (0x0077)
99a2: 26 07        bne [0x99AB]
99a4: d6 7b        ldab (0x007B)
99a6: ca 08        orab 0x08
99a8: bd 87 58     jsr (0x8758)
99ab: 7e 85 ad     jmp (0x85AD)
99ae: d6 7b        ldab (0x007B)
99b0: c4 f3        andb 0xF3
99b2: bd 87 58     jsr (0x8758)
99b5: 39           rts
99b6: d6 7b        ldab (0x007B)
99b8: c4 df        andb 0xDF
99ba: bd 87 58     jsr (0x8758)
99bd: bd 87 a1     jsr (0x87A1)
99c0: 39           rts
99c1: d6 7b        ldab (0x007B)
99c3: ca 20        orab 0x20
99c5: bd 87 58     jsr (0x8758)
99c8: bd 87 be     jsr (0x87BE)
99cb: 39           rts
99cc: d6 7b        ldab (0x007B)
99ce: c4 df        andb 0xDF
99d0: bd 87 58     jsr (0x8758)
99d3: bd 87 be     jsr (0x87BE)
99d6: 39           rts
99d7: d6 7b        ldab (0x007B)
99d9: ca 20        orab 0x20
99db: bd 87 58     jsr (0x8758)
99de: bd 87 a1     jsr (0x87A1)
99e1: 39           rts
99e2: 86 01        ldaa 0x01
99e4: 97 78        staa (0x0078)
99e6: 7e 85 ad     jmp (0x85AD)
99e9: ce 0e 20     ldx 0x0E20
99ec: a6 00        ldaa (X+0x00)
99ee: 80 30        suba 0x30
99f0: c6 0a        ldab 0x0A
99f2: 3d           mul
99f3: 17           tba
99f4: c6 64        ldab 0x64
99f6: 3d           mul
99f7: dd 17        std (0x0017)
99f9: a6 01        ldaa (X+0x01)
99fb: 80 30        suba 0x30
99fd: c6 64        ldab 0x64
99ff: 3d           mul
9a00: d3 17        addd (0x0017)
9a02: dd 17        std (0x0017)
9a04: a6 02        ldaa (X+0x02)
9a06: 80 30        suba 0x30
9a08: c6 0a        ldab 0x0A
9a0a: 3d           mul
9a0b: d3 17        addd (0x0017)
9a0d: dd 17        std (0x0017)
9a0f: 4f           clra
9a10: e6 03        ldab (X+0x03)
9a12: c0 30        subb 0x30
9a14: d3 17        addd (0x0017)
9a16: fd 02 9c     std (0x029C)
9a19: ce 0e 20     ldx 0x0E20
9a1c: a6 00        ldaa (X+0x00)
9a1e: 81 30        cmpa 0x30
9a20: 25 13        bcs [0x9A35]
9a22: 81 39        cmpa 0x39
9a24: 22 0f        bhi [0x9A35]
9a26: 08           inx
9a27: 8c 0e 24     cpx 0x0E24
9a2a: 26 f0        bne [0x9A1C]
9a2c: b6 0e 24     ldaa (0x0E24)
9a2f: 81 db        cmpa 0xDB
9a31: 26 02        bne [0x9A35]
9a33: 0c           clc
9a34: 39           rts
9a35: 0d           sec
9a36: 39           rts
9a37: bd 8d f4     jsr (0x8DF4)
9a3a: 53           comb
9a3b: 65           ?
9a3c: 72           ?
9a3d: 69 61        rol (X+0x61)
9a3f: 6c 23        inc (X+0x23)
9a41: a0 bd        suba (X+0xBD)
9a43: 8d ed        bsr [0x9A32]
9a45: 20 20        bra [0x9A67]
9a47: 20 20        bra [0x9A69]
9a49: 20 20        bra [0x9A6B]
9a4b: 20 20        bra [0x9A6D]
9a4d: 20 20        bra [0x9A6F]
9a4f: 20 20        bra [0x9A71]
9a51: 20 20        bra [0x9A73]
9a53: a0 c6        suba (X+0xC6)
9a55: 08           inx
9a56: 18 ce 0e 20  ldy 0x0E20
9a5a: 18 a6 00     ldaa (Y+0x00)
9a5d: 18 3c        pshy
9a5f: 37           pshb
9a60: bd 8d c5     jsr (0x8DC5)
9a63: 33           pulb
9a64: 18 38        puly
9a66: 5c           incb
9a67: 18 08        iny
9a69: 18 8c 0e 24  cpy 0x0E24
9a6d: 26 eb        bne [0x9A5A]
9a6f: 39           rts
9a70: 86 01        ldaa 0x01
9a72: 97 b5        staa (0x00B5)
9a74: 96 4e        ldaa (0x004E)
9a76: 97 7f        staa (0x007F)
9a78: 96 62        ldaa (0x0062)
9a7a: 97 80        staa (0x0080)
9a7c: 96 7b        ldaa (0x007B)
9a7e: 97 81        staa (0x0081)
9a80: 96 7a        ldaa (0x007A)
9a82: 97 82        staa (0x0082)
9a84: 96 78        ldaa (0x0078)
9a86: 97 7d        staa (0x007D)
9a88: b6 10 8a     ldaa (0x108A)
9a8b: 84 06        anda 0x06
9a8d: 97 7e        staa (0x007E)
9a8f: c6 ef        ldab 0xEF
9a91: bd 86 f7     jsr (0x86F7)
9a94: d6 7b        ldab (0x007B)
9a96: ca 0c        orab 0x0C
9a98: c4 df        andb 0xDF
9a9a: bd 87 58     jsr (0x8758)
9a9d: bd 87 a1     jsr (0x87A1)
9aa0: bd 86 d4     jsr (0x86D4)
9aa3: bd 9c 61     jsr (0x9C61)
9aa6: c6 06        ldab 0x06
9aa8: bd 8c 12     jsr (0x8C12)
9aab: bd 8e a5     jsr (0x8EA5)
9aae: bd 99 b6     jsr (0x99B6)
9ab1: 7e 81 ba     jmp (0x81BA)
9ab4: 7f 00 5c     clr (0x005C)
9ab7: 86 01        ldaa 0x01
9ab9: 97 79        staa (0x0079)
9abb: c6 fd        ldab 0xFD
9abd: bd 86 f7     jsr (0x86F7)
9ac0: bd 8e a5     jsr (0x8EA5)
9ac3: cc 75 30     ldd 0x7530
9ac6: dd 1d        std (0x001D)
9ac8: bd 9b 29     jsr (0x9B29)
9acb: d6 62        ldab (0x0062)
9acd: c8 04        eorb 0x04
9acf: d7 62        stab (0x0062)
9ad1: bd fa f9     jsr (0xFAF9)
9ad4: f6 18 04     ldab (0x1804)
9ad7: c8 08        eorb 0x08
9ad9: f7 18 04     stab (0x1804)
9adc: 7d 00 5c     tst (0x005C)
9adf: 26 12        bne [0x9AF3]
9ae1: bd 8e a5     jsr (0x8EA5)
9ae4: 81 0d        cmpa 0x0D
9ae6: 27 0b        beq [0x9AF3]
9ae8: c6 32        ldab 0x32
9aea: bd 8c 32     jsr (0x8C32)
9aed: dc 1d        ldd (0x001D)
9aef: 27 02        beq [0x9AF3]
9af1: 20 d5        bra [0x9AC8]
9af3: d6 62        ldab (0x0062)
9af5: c4 fb        andb 0xFB
9af7: d7 62        stab (0x0062)
9af9: bd fa f9     jsr (0xFAF9)
9afc: bd a3 91     jsr (0xA391)
9aff: c6 fb        ldab 0xFB
9b01: bd 86 f7     jsr (0x86F7)
9b04: 7e 85 ad     jmp (0x85AD)
9b07: 7f 00 75     clr (0x0075)
9b0a: 7f 00 76     clr (0x0076)
9b0d: 7f 00 77     clr (0x0077)
9b10: 7f 00 78     clr (0x0078)
9b13: 7f 00 25     clr (0x0025)
9b16: 7f 00 26     clr (0x0026)
9b19: 7f 00 4e     clr (0x004E)
9b1c: 7f 00 30     clr (0x0030)
9b1f: 7f 00 31     clr (0x0031)
9b22: 7f 00 32     clr (0x0032)
9b25: 7f 00 af     clr (0x00AF)
9b28: 39           rts
9b29: 36           psha
9b2a: 37           pshb
9b2b: 96 4e        ldaa (0x004E)
9b2d: 27 17        beq [0x9B46]
9b2f: 96 63        ldaa (0x0063)
9b31: 26 10        bne [0x9B43]
9b33: 7d 00 64     tst (0x0064)
9b36: 27 09        beq [0x9B41]
9b38: bd 86 d4     jsr (0x86D4)
9b3b: bd 9c 61     jsr (0x9C61)
9b3e: 7f 00 64     clr (0x0064)
9b41: 20 03        bra [0x9B46]
9b43: 33           pulb
9b44: 32           pula
9b45: 39           rts
9b46: b6 04 01     ldaa (0x0401)
9b49: 84 01        anda 0x01
9b4b: 27 03        beq [0x9B50]
9b4d: bd 9b 7b     jsr (0x9B7B)
9b50: b6 04 01     ldaa (0x0401)
9b53: 84 02        anda 0x02
9b55: 27 03        beq [0x9B5A]
9b57: bd 9b a9     jsr (0x9BA9)
9b5a: b6 04 01     ldaa (0x0401)
9b5d: 84 04        anda 0x04
9b5f: 27 03        beq [0x9B64]
9b61: bd 9b d7     jsr (0x9BD7)
9b64: b6 04 01     ldaa (0x0401)
9b67: 84 08        anda 0x08
9b69: 27 03        beq [0x9B6E]
9b6b: bd 9c 05     jsr (0x9C05)
9b6e: b6 04 01     ldaa (0x0401)
9b71: 84 10        anda 0x10
9b73: 27 03        beq [0x9B78]
9b75: bd 9c 33     jsr (0x9C33)
9b78: 33           pulb
9b79: 32           pula
9b7a: 39           rts
9b7b: 18 3c        pshy
9b7d: 18 de 65     ldy (0x0065)
9b80: 18 a6 00     ldaa (Y+0x00)
9b83: 81 ff        cmpa 0xFF
9b85: 27 14        beq [0x9B9B]
9b87: 91 70        cmpa (0x0070)
9b89: 25 0d        bcs [0x9B98]
9b8b: 18 08        iny
9b8d: 18 a6 00     ldaa (Y+0x00)
9b90: b7 10 80     staa (0x1080)
9b93: 18 08        iny
9b95: 18 df 65     sty (0x0065)
9b98: 18 38        puly
9b9a: 39           rts
9b9b: 18 ce b3 28  ldy 0xB328
9b9f: 18 df 65     sty (0x0065)
9ba2: 86 fa        ldaa 0xFA
9ba4: 97 70        staa (0x0070)
9ba6: 7e 9b 98     jmp (0x9B98)
9ba9: 18 3c        pshy
9bab: 18 de 67     ldy (0x0067)
9bae: 18 a6 00     ldaa (Y+0x00)
9bb1: 81 ff        cmpa 0xFF
9bb3: 27 14        beq [0x9BC9]
9bb5: 91 71        cmpa (0x0071)
9bb7: 25 0d        bcs [0x9BC6]
9bb9: 18 08        iny
9bbb: 18 a6 00     ldaa (Y+0x00)
9bbe: b7 10 84     staa (0x1084)
9bc1: 18 08        iny
9bc3: 18 df 67     sty (0x0067)
9bc6: 18 38        puly
9bc8: 39           rts
9bc9: 18 ce b3 fa  ldy 0xB3FA
9bcd: 18 df 67     sty (0x0067)
9bd0: 86 e6        ldaa 0xE6
9bd2: 97 71        staa (0x0071)
9bd4: 7e 9b c6     jmp (0x9BC6)
9bd7: 18 3c        pshy
9bd9: 18 de 69     ldy (0x0069)
9bdc: 18 a6 00     ldaa (Y+0x00)
9bdf: 81 ff        cmpa 0xFF
9be1: 27 14        beq [0x9BF7]
9be3: 91 72        cmpa (0x0072)
9be5: 25 0d        bcs [0x9BF4]
9be7: 18 08        iny
9be9: 18 a6 00     ldaa (Y+0x00)
9bec: b7 10 88     staa (0x1088)
9bef: 18 08        iny
9bf1: 18 df 69     sty (0x0069)
9bf4: 18 38        puly
9bf6: 39           rts
9bf7: 18 ce b5 6e  ldy 0xB56E
9bfb: 18 df 69     sty (0x0069)
9bfe: 86 d2        ldaa 0xD2
9c00: 97 72        staa (0x0072)
9c02: 7e 9b f4     jmp (0x9BF4)
9c05: 18 3c        pshy
9c07: 18 de 6b     ldy (0x006B)
9c0a: 18 a6 00     ldaa (Y+0x00)
9c0d: 81 ff        cmpa 0xFF
9c0f: 27 14        beq [0x9C25]
9c11: 91 73        cmpa (0x0073)
9c13: 25 0d        bcs [0x9C22]
9c15: 18 08        iny
9c17: 18 a6 00     ldaa (Y+0x00)
9c1a: b7 10 8c     staa (0x108C)
9c1d: 18 08        iny
9c1f: 18 df 6b     sty (0x006B)
9c22: 18 38        puly
9c24: 39           rts
9c25: 18 ce b4 b2  ldy 0xB4B2
9c29: 18 df 6b     sty (0x006B)
9c2c: 86 be        ldaa 0xBE
9c2e: 97 73        staa (0x0073)
9c30: 7e 9c 22     jmp (0x9C22)
9c33: 18 3c        pshy
9c35: 18 de 6d     ldy (0x006D)
9c38: 18 a6 00     ldaa (Y+0x00)
9c3b: 81 ff        cmpa 0xFF
9c3d: 27 14        beq [0x9C53]
9c3f: 91 74        cmpa (0x0074)
9c41: 25 0d        bcs [0x9C50]
9c43: 18 08        iny
9c45: 18 a6 00     ldaa (Y+0x00)
9c48: b7 10 90     staa (0x1090)
9c4b: 18 08        iny
9c4d: 18 df 6d     sty (0x006D)
9c50: 18 38        puly
9c52: 39           rts
9c53: 18 ce b6 00  ldy 0xB600
9c57: 18 df 6d     sty (0x006D)
9c5a: 86 aa        ldaa 0xAA
9c5c: 97 74        staa (0x0074)
9c5e: 7e 9c 50     jmp (0x9C50)
9c61: 86 fa        ldaa 0xFA
9c63: 97 70        staa (0x0070)
9c65: 86 e6        ldaa 0xE6
9c67: 97 71        staa (0x0071)
9c69: 86 d2        ldaa 0xD2
9c6b: 97 72        staa (0x0072)
9c6d: 86 be        ldaa 0xBE
9c6f: 97 73        staa (0x0073)
9c71: 86 aa        ldaa 0xAA
9c73: 97 74        staa (0x0074)
9c75: 18 ce b3 28  ldy 0xB328
9c79: 18 df 65     sty (0x0065)
9c7c: 18 ce b3 fa  ldy 0xB3FA
9c80: 18 df 67     sty (0x0067)
9c83: 18 ce b5 6e  ldy 0xB56E
9c87: 18 df 69     sty (0x0069)
9c8a: 18 ce b4 b2  ldy 0xB4B2
9c8e: 18 df 6b     sty (0x006B)
9c91: 18 ce b6 00  ldy 0xB600
9c95: 18 df 6d     sty (0x006D)
9c98: 7f 10 9c     clr (0x109C)
9c9b: 7f 10 9e     clr (0x109E)
9c9e: b6 04 01     ldaa (0x0401)
9ca1: 84 20        anda 0x20
9ca3: 27 08        beq [0x9CAD]
9ca5: b6 10 9c     ldaa (0x109C)
9ca8: 8a 19        oraa 0x19
9caa: b7 10 9c     staa (0x109C)
9cad: b6 04 01     ldaa (0x0401)
9cb0: 84 40        anda 0x40
9cb2: 27 10        beq [0x9CC4]
9cb4: b6 10 9c     ldaa (0x109C)
9cb7: 8a 44        oraa 0x44
9cb9: b7 10 9c     staa (0x109C)
9cbc: b6 10 9e     ldaa (0x109E)
9cbf: 8a 40        oraa 0x40
9cc1: b7 10 9e     staa (0x109E)
9cc4: b6 04 01     ldaa (0x0401)
9cc7: 84 80        anda 0x80
9cc9: 27 08        beq [0x9CD3]
9ccb: b6 10 9c     ldaa (0x109C)
9cce: 8a a2        oraa 0xA2
9cd0: b7 10 9c     staa (0x109C)
9cd3: b6 04 2b     ldaa (0x042B)
9cd6: 84 01        anda 0x01
9cd8: 27 08        beq [0x9CE2]
9cda: b6 10 9a     ldaa (0x109A)
9cdd: 8a 80        oraa 0x80
9cdf: b7 10 9a     staa (0x109A)
9ce2: b6 04 2b     ldaa (0x042B)
9ce5: 84 02        anda 0x02
9ce7: 27 08        beq [0x9CF1]
9ce9: b6 10 9e     ldaa (0x109E)
9cec: 8a 04        oraa 0x04
9cee: b7 10 9e     staa (0x109E)
9cf1: b6 04 2b     ldaa (0x042B)
9cf4: 84 04        anda 0x04
9cf6: 27 08        beq [0x9D00]
9cf8: b6 10 9e     ldaa (0x109E)
9cfb: 8a 08        oraa 0x08
9cfd: b7 10 9e     staa (0x109E)
9d00: 39           rts
9d01: bd 8d f4     jsr (0x8DF4)
9d04: 20 20        bra [0x9D26]
9d06: 20 50        bra [0x9D58]
9d08: 72           ?
9d09: 6f 67        clr (X+0x67)
9d0b: 72           ?
9d0c: 61           ?
9d0d: 6d 20        tst (X+0x20)
9d0f: 62           ?
9d10: 79 20 20     rol (0x2020)
9d13: a0 bd        suba (X+0xBD)
9d15: 8d ed        bsr [0x9D04]
9d17: 44           lsra
9d18: 61           ?
9d19: 76 69 64     ror (0x6964)
9d1c: 20 20        bra [0x9D3E]
9d1e: 50           negb
9d1f: 68 69        asl (X+0x69)
9d21: 6c 69        inc (X+0x69)
9d23: 70 73 65     neg (0x7365)
9d26: ee 39        ldx (X+0x39)
9d28: bd 8d f4     jsr (0x8DF4)
9d2b: 50           negb
9d2c: 72           ?
9d2d: 65           ?
9d2e: 73 73 20     com (0x7320)
9d31: 45           ?
9d32: 6e 74        jmp (X+0x74)
9d34: 65           ?
9d35: 72           ?
9d36: 20 66        bra [0x9D9E]
9d38: 6f 72        clr (X+0x72)
9d3a: a0 bd        suba (X+0xBD)
9d3c: 8d ed        bsr [0x9D2B]
9d3e: 44           lsra
9d3f: 69 61        rol (X+0x61)
9d41: 67 6e        asr (X+0x6E)
9d43: 6f 73        clr (X+0x73)
9d45: 74 69 63     lsr (0x6963)
9d48: 73 20 20     com (0x2020)
9d4b: 20 20        bra [0x9D6D]
9d4d: a0 39        suba (X+0x39)
9d4f: 0c           clc
9d50: c6 01        ldab 0x01
9d52: d7 b8        stab (0x00B8)
9d54: 39           rts
9d55: 97 49        staa (0x0049)
9d57: 7f 00 b8     clr (0x00B8)
9d5a: bd 8d 13     jsr (0x8D13)
9d5d: 86 2a        ldaa 0x2A
9d5f: c6 28        ldab 0x28
9d61: bd 8d c5     jsr (0x8DC5)
9d64: cc 0b b8     ldd 0x0BB8
9d67: dd 1b        std (0x001B)
9d69: bd 9b 29     jsr (0x9B29)
9d6c: 96 49        ldaa (0x0049)
9d6e: 81 41        cmpa 0x41
9d70: 27 04        beq [0x9D76]
9d72: 81 4b        cmpa 0x4B
9d74: 26 04        bne [0x9D7A]
9d76: c6 01        ldab 0x01
9d78: d7 b8        stab (0x00B8)
9d7a: 81 41        cmpa 0x41
9d7c: 27 04        beq [0x9D82]
9d7e: 81 4f        cmpa 0x4F
9d80: 26 07        bne [0x9D89]
9d82: 86 01        ldaa 0x01
9d84: b7 02 98     staa (0x0298)
9d87: 20 32        bra [0x9DBB]
9d89: 81 4b        cmpa 0x4B
9d8b: 27 04        beq [0x9D91]
9d8d: 81 50        cmpa 0x50
9d8f: 26 07        bne [0x9D98]
9d91: 86 02        ldaa 0x02
9d93: b7 02 98     staa (0x0298)
9d96: 20 23        bra [0x9DBB]
9d98: 81 4c        cmpa 0x4C
9d9a: 26 07        bne [0x9DA3]
9d9c: 86 03        ldaa 0x03
9d9e: b7 02 98     staa (0x0298)
9da1: 20 18        bra [0x9DBB]
9da3: 81 52        cmpa 0x52
9da5: 26 07        bne [0x9DAE]
9da7: 86 04        ldaa 0x04
9da9: b7 02 98     staa (0x0298)
9dac: 20 0d        bra [0x9DBB]
9dae: dc 1b        ldd (0x001B)
9db0: 26 b7        bne [0x9D69]
9db2: 86 23        ldaa 0x23
9db4: c6 29        ldab 0x29
9db6: bd 8d c5     jsr (0x8DC5)
9db9: 20 6c        bra [0x9E27]
9dbb: 7f 00 49     clr (0x0049)
9dbe: 86 2a        ldaa 0x2A
9dc0: c6 29        ldab 0x29
9dc2: bd 8d c5     jsr (0x8DC5)
9dc5: 7f 00 4a     clr (0x004A)
9dc8: ce 02 99     ldx 0x0299
9dcb: bd 9b 29     jsr (0x9B29)
9dce: 96 4a        ldaa (0x004A)
9dd0: 27 f9        beq [0x9DCB]
9dd2: 7f 00 4a     clr (0x004A)
9dd5: 84 3f        anda 0x3F
9dd7: a7 00        staa (X+0x00)
9dd9: 08           inx
9dda: 8c 02 9c     cpx 0x029C
9ddd: 26 ec        bne [0x9DCB]
9ddf: bd 9e 32     jsr (0x9E32)
9de2: 24 09        bcc [0x9DED]
9de4: 86 23        ldaa 0x23
9de6: c6 2a        ldab 0x2A
9de8: bd 8d c5     jsr (0x8DC5)
9deb: 20 3a        bra [0x9E27]
9ded: 86 2a        ldaa 0x2A
9def: c6 2a        ldab 0x2A
9df1: bd 8d c5     jsr (0x8DC5)
9df4: b6 02 99     ldaa (0x0299)
9df7: 81 39        cmpa 0x39
9df9: 26 15        bne [0x9E10]
9dfb: bd 8d ed     jsr (0x8DED)
9dfe: 47           asra
9dff: 65           ?
9e00: 6e 65        jmp (X+0x65)
9e02: 72           ?
9e03: 69 63        rol (X+0x63)
9e05: 20 53        bra [0x9E5A]
9e07: 68 6f        asl (X+0x6F)
9e09: 77 74 61     asr (0x7461)
9e0c: 70 e5 0c     neg (0xE50C)
9e0f: 39           rts
9e10: b6 02 98     ldaa (0x0298)
9e13: 81 03        cmpa 0x03
9e15: 27 0e        beq [0x9E25]
9e17: 81 04        cmpa 0x04
9e19: 27 0a        beq [0x9E25]
9e1b: 96 76        ldaa (0x0076)
9e1d: 26 06        bne [0x9E25]
9e1f: bd 9e b0     jsr (0x9EB0)
9e22: bd 9f 09     jsr (0x9F09)
9e25: 0c           clc
9e26: 39           rts
9e27: fc 04 20     ldd (0x0420)
9e2a: c3 00 01     addd 0x0001
9e2d: fd 04 20     std (0x0420)
9e30: 0d           sec
9e31: 39           rts
9e32: b6 02 99     ldaa (0x0299)
9e35: 81 39        cmpa 0x39
9e37: 27 6c        beq [0x9EA5]
9e39: ce 00 a8     ldx 0x00A8
9e3c: bd 9b 29     jsr (0x9B29)
9e3f: 96 4a        ldaa (0x004A)
9e41: 27 f9        beq [0x9E3C]
9e43: 7f 00 4a     clr (0x004A)
9e46: a7 00        staa (X+0x00)
9e48: 08           inx
9e49: 8c 00 aa     cpx 0x00AA
9e4c: 26 ee        bne [0x9E3C]
9e4e: bd 9f 37     jsr (0x9F37)
9e51: ce 02 99     ldx 0x0299
9e54: 7f 00 13     clr (0x0013)
9e57: a6 00        ldaa (X+0x00)
9e59: 9b 13        adda (0x0013)
9e5b: 97 13        staa (0x0013)
9e5d: 08           inx
9e5e: 8c 02 9c     cpx 0x029C
9e61: 26 f4        bne [0x9E57]
9e63: 91 a8        cmpa (0x00A8)
9e65: 26 47        bne [0x9EAE]
9e67: ce 04 02     ldx 0x0402
9e6a: b6 02 98     ldaa (0x0298)
9e6d: 81 02        cmpa 0x02
9e6f: 26 03        bne [0x9E74]
9e71: ce 04 05     ldx 0x0405
9e74: 3c           pshx
9e75: bd ab 93     jsr (0xAB93)
9e78: 38           pulx
9e79: 25 07        bcs [0x9E82]
9e7b: 86 03        ldaa 0x03
9e7d: b7 02 98     staa (0x0298)
9e80: 20 23        bra [0x9EA5]
9e82: b6 02 99     ldaa (0x0299)
9e85: a1 00        cmpa (X+0x00)
9e87: 25 1e        bcs [0x9EA7]
9e89: 27 02        beq [0x9E8D]
9e8b: 24 18        bcc [0x9EA5]
9e8d: 08           inx
9e8e: b6 02 9a     ldaa (0x029A)
9e91: a1 00        cmpa (X+0x00)
9e93: 25 12        bcs [0x9EA7]
9e95: 27 02        beq [0x9E99]
9e97: 24 0c        bcc [0x9EA5]
9e99: 08           inx
9e9a: b6 02 9b     ldaa (0x029B)
9e9d: a1 00        cmpa (X+0x00)
9e9f: 25 06        bcs [0x9EA7]
9ea1: 27 02        beq [0x9EA5]
9ea3: 24 00        bcc [0x9EA5]
9ea5: 0c           clc
9ea6: 39           rts
9ea7: b6 02 98     ldaa (0x0298)
9eaa: 81 03        cmpa 0x03
9eac: 27 f7        beq [0x9EA5]
9eae: 0d           sec
9eaf: 39           rts
9eb0: ce 04 02     ldx 0x0402
9eb3: b6 02 98     ldaa (0x0298)
9eb6: 81 02        cmpa 0x02
9eb8: 26 03        bne [0x9EBD]
9eba: ce 04 05     ldx 0x0405
9ebd: b6 02 99     ldaa (0x0299)
9ec0: a7 00        staa (X+0x00)
9ec2: 08           inx
9ec3: b6 02 9a     ldaa (0x029A)
9ec6: a7 00        staa (X+0x00)
9ec8: 08           inx
9ec9: b6 02 9b     ldaa (0x029B)
9ecc: a7 00        staa (X+0x00)
9ece: 39           rts
9ecf: 86 30        ldaa 0x30
9ed1: b7 04 02     staa (0x0402)
9ed4: b7 04 03     staa (0x0403)
9ed7: b7 04 04     staa (0x0404)
9eda: bd 8d ed     jsr (0x8DED)
9edd: 52           ?
9ede: 65           ?
9edf: 67 20        asr (X+0x20)
9ee1: 23 20        bls [0x9F03]
9ee3: 63 6c        com (X+0x6C)
9ee5: 65           ?
9ee6: 61           ?
9ee7: 72           ?
9ee8: 65           ?
9ee9: 64 a1        lsr (X+0xA1)
9eeb: 39           rts
9eec: 86 30        ldaa 0x30
9eee: b7 04 05     staa (0x0405)
9ef1: b7 04 06     staa (0x0406)
9ef4: b7 04 07     staa (0x0407)
9ef7: bd 8d ed     jsr (0x8DED)
9efa: 4c           inca
9efb: 69 76        rol (X+0x76)
9efd: 20 23        bra [0x9F22]
9eff: 20 63        bra [0x9F64]
9f01: 6c 65        inc (X+0x65)
9f03: 61           ?
9f04: 72           ?
9f05: 65           ?
9f06: 64 a1        lsr (X+0xA1)
9f08: 39           rts
9f09: 86 52        ldaa 0x52
9f0b: c6 2b        ldab 0x2B
9f0d: bd 8d c5     jsr (0x8DC5)
9f10: 86 4c        ldaa 0x4C
9f12: c6 32        ldab 0x32
9f14: bd 8d c5     jsr (0x8DC5)
9f17: ce 04 02     ldx 0x0402
9f1a: c6 2c        ldab 0x2C
9f1c: a6 00        ldaa (X+0x00)
9f1e: bd 8d c5     jsr (0x8DC5)
9f21: 5c           incb
9f22: 08           inx
9f23: 8c 04 05     cpx 0x0405
9f26: 26 f4        bne [0x9F1C]
9f28: c6 33        ldab 0x33
9f2a: a6 00        ldaa (X+0x00)
9f2c: bd 8d c5     jsr (0x8DC5)
9f2f: 5c           incb
9f30: 08           inx
9f31: 8c 04 08     cpx 0x0408
9f34: 26 f4        bne [0x9F2A]
9f36: 39           rts
9f37: 96 a8        ldaa (0x00A8)
9f39: bd 9f 4c     jsr (0x9F4C)
9f3c: 48           asla
9f3d: 48           asla
9f3e: 48           asla
9f3f: 48           asla
9f40: 97 13        staa (0x0013)
9f42: 96 a9        ldaa (0x00A9)
9f44: bd 9f 4c     jsr (0x9F4C)
9f47: 9b 13        adda (0x0013)
9f49: 97 a8        staa (0x00A8)
9f4b: 39           rts
9f4c: 81 2f        cmpa 0x2F
9f4e: 24 02        bcc [0x9F52]
9f50: 86 30        ldaa 0x30
9f52: 81 3a        cmpa 0x3A
9f54: 25 02        bcs [0x9F58]
9f56: 80 07        suba 0x07
9f58: 80 30        suba 0x30
9f5a: 39           rts
9f5b: fc 02 9c     ldd (0x029C)
9f5e: 1a 83 00 01  cpd 0x0001
9f62: 27 0c        beq [0x9F70]
9f64: 1a 83 03 e8  cpd 0x03E8
9f68: 25 20        bcs [0x9F8A]
9f6a: 1a 83 04 4b  cpd 0x044B
9f6e: 22 1a        bhi [0x9F8A]
9f70: bd 8d f4     jsr (0x8DF4)
9f73: 50           negb
9f74: 61           ?
9f75: 73 73 77     com (0x7377)
9f78: 6f 72        clr (X+0x72)
9f7a: 64 20        lsr (X+0x20)
9f7c: 62           ?
9f7d: 79 70 61     rol (0x7061)
9f80: 73 73 a0     com (0x73A0)
9f83: c6 04        ldab 0x04
9f85: bd 8c 40     jsr (0x8C40)
9f88: 0c           clc
9f89: 39           rts
9f8a: bd 8d 02     jsr (0x8D02)
9f8d: bd 8d 13     jsr (0x8D13)
9f90: bd 8d f4     jsr (0x8DF4)
9f93: 43           coma
9f94: 6f 64        clr (X+0x64)
9f96: 65           ?
9f97: ba ce 02     oraa (0xCE02)
9f9a: 90 7f        suba (0x007F)
9f9c: 00           test
9f9d: 16           tab
9f9e: 86 41        ldaa 0x41
9fa0: 97 15        staa (0x0015)
9fa2: bd 8e a5     jsr (0x8EA5)
9fa5: 81 0d        cmpa 0x0D
9fa7: 26 11        bne [0x9FBA]
9fa9: 96 15        ldaa (0x0015)
9fab: a7 00        staa (X+0x00)
9fad: 08           inx
9fae: bd 8c a8     jsr (0x8CA8)
9fb1: 96 16        ldaa (0x0016)
9fb3: 4c           inca
9fb4: 97 16        staa (0x0016)
9fb6: 81 05        cmpa 0x05
9fb8: 27 09        beq [0x9FC3]
9fba: 96 15        ldaa (0x0015)
9fbc: 4c           inca
9fbd: 81 5b        cmpa 0x5B
9fbf: 27 dd        beq [0x9F9E]
9fc1: 20 dd        bra [0x9FA0]
9fc3: bd 8d ed     jsr (0x8DED)
9fc6: 50           negb
9fc7: 73 77 64     com (0x7764)
9fca: ba ce 02     oraa (0xCE02)
9fcd: 88 86        eora 0x86
9fcf: 41           ?
9fd0: 97 16        staa (0x0016)
9fd2: 86 c5        ldaa 0xC5
9fd4: 97 15        staa (0x0015)
9fd6: 96 15        ldaa (0x0015)
9fd8: bd 8c 96     jsr (0x8C96)
9fdb: 96 16        ldaa (0x0016)
9fdd: bd 8c a8     jsr (0x8CA8)
9fe0: bd 8e a5     jsr (0x8EA5)
9fe3: 27 fb        beq [0x9FE0]
9fe5: 81 0d        cmpa 0x0D
9fe7: 26 10        bne [0x9FF9]
9fe9: 96 16        ldaa (0x0016)
9feb: a7 00        staa (X+0x00)
9fed: 08           inx
9fee: 96 15        ldaa (0x0015)
9ff0: 4c           inca
9ff1: 97 15        staa (0x0015)
9ff3: 81 ca        cmpa 0xCA
9ff5: 27 28        beq [0xA01F]
9ff7: 20 dd        bra [0x9FD6]
9ff9: 81 01        cmpa 0x01
9ffb: 26 0f        bne [0xA00C]
9ffd: 96 16        ldaa (0x0016)
9fff: 4c           inca
a000: 97 16        staa (0x0016)
a002: 81 5b        cmpa 0x5B
a004: 26 d0        bne [0x9FD6]
a006: 86 41        ldaa 0x41
a008: 97 16        staa (0x0016)
a00a: 20 ca        bra [0x9FD6]
a00c: 81 02        cmpa 0x02
a00e: 26 d0        bne [0x9FE0]
a010: 96 16        ldaa (0x0016)
a012: 4a           deca
a013: 97 16        staa (0x0016)
a015: 81 40        cmpa 0x40
a017: 26 bd        bne [0x9FD6]
a019: 86 5a        ldaa 0x5A
a01b: 97 16        staa (0x0016)
a01d: 20 b7        bra [0x9FD6]
a01f: bd a0 3e     jsr (0xA03E)
a022: 25 0f        bcs [0xA033]
a024: 86 db        ldaa 0xDB
a026: 97 ab        staa (0x00AB)
a028: fc 04 16     ldd (0x0416)
a02b: c3 00 01     addd 0x0001
a02e: fd 04 16     std (0x0416)
a031: 0c           clc
a032: 39           rts
a033: fc 04 14     ldd (0x0414)
a036: c3 00 01     addd 0x0001
a039: fd 04 14     std (0x0414)
a03c: 0d           sec
a03d: 39           rts
a03e: b6 02 90     ldaa (0x0290)
a041: b7 02 81     staa (0x0281)
a044: b6 02 91     ldaa (0x0291)
a047: b7 02 83     staa (0x0283)
a04a: b6 02 92     ldaa (0x0292)
a04d: b7 02 84     staa (0x0284)
a050: b6 02 93     ldaa (0x0293)
a053: b7 02 80     staa (0x0280)
a056: b6 02 94     ldaa (0x0294)
a059: b7 02 82     staa (0x0282)
a05c: b6 02 80     ldaa (0x0280)
a05f: 88 13        eora 0x13
a061: 8b 03        adda 0x03
a063: b7 02 80     staa (0x0280)
a066: b6 02 81     ldaa (0x0281)
a069: 88 04        eora 0x04
a06b: 8b 12        adda 0x12
a06d: b7 02 81     staa (0x0281)
a070: b6 02 82     ldaa (0x0282)
a073: 88 06        eora 0x06
a075: 8b 04        adda 0x04
a077: b7 02 82     staa (0x0282)
a07a: b6 02 83     ldaa (0x0283)
a07d: 88 11        eora 0x11
a07f: 8b 07        adda 0x07
a081: b7 02 83     staa (0x0283)
a084: b6 02 84     ldaa (0x0284)
a087: 88 01        eora 0x01
a089: 8b 10        adda 0x10
a08b: b7 02 84     staa (0x0284)
a08e: bd a0 ec     jsr (0xA0EC)
a091: b6 02 94     ldaa (0x0294)
a094: 84 17        anda 0x17
a096: 97 15        staa (0x0015)
a098: b6 02 90     ldaa (0x0290)
a09b: 84 17        anda 0x17
a09d: 97 16        staa (0x0016)
a09f: ce 02 80     ldx 0x0280
a0a2: a6 00        ldaa (X+0x00)
a0a4: 98 15        eora (0x0015)
a0a6: 98 16        eora (0x0016)
a0a8: a7 00        staa (X+0x00)
a0aa: 08           inx
a0ab: 8c 02 85     cpx 0x0285
a0ae: 26 f2        bne [0xA0A2]
a0b0: bd a0 ec     jsr (0xA0EC)
a0b3: ce 02 80     ldx 0x0280
a0b6: 18 ce 02 88  ldy 0x0288
a0ba: a6 00        ldaa (X+0x00)
a0bc: 18 a1 00     cmpa (Y+0x00)
a0bf: 26 0a        bne [0xA0CB]
a0c1: 08           inx
a0c2: 18 08        iny
a0c4: 8c 02 85     cpx 0x0285
a0c7: 26 f1        bne [0xA0BA]
a0c9: 0c           clc
a0ca: 39           rts
a0cb: 0d           sec
a0cc: 39           rts
a0cd: 59           rolb
a0ce: 41           ?
a0cf: 44           lsra
a0d0: 44           lsra
a0d1: 41           ?
a0d2: ce 02 88     ldx 0x0288
a0d5: 18 ce a0 cd  ldy 0xA0CD
a0d9: a6 00        ldaa (X+0x00)
a0db: 18 a1 00     cmpa (Y+0x00)
a0de: 26 0a        bne [0xA0EA]
a0e0: 08           inx
a0e1: 18 08        iny
a0e3: 8c 02 8d     cpx 0x028D
a0e6: 26 f1        bne [0xA0D9]
a0e8: 0c           clc
a0e9: 39           rts
a0ea: 0d           sec
a0eb: 39           rts
a0ec: ce 02 80     ldx 0x0280
a0ef: a6 00        ldaa (X+0x00)
a0f1: 81 5b        cmpa 0x5B
a0f3: 25 06        bcs [0xA0FB]
a0f5: 80 1a        suba 0x1A
a0f7: a7 00        staa (X+0x00)
a0f9: 20 08        bra [0xA103]
a0fb: 81 41        cmpa 0x41
a0fd: 24 04        bcc [0xA103]
a0ff: 8b 1a        adda 0x1A
a101: a7 00        staa (X+0x00)
a103: 08           inx
a104: 8c 02 85     cpx 0x0285
a107: 26 e6        bne [0xA0EF]
a109: 39           rts
a10a: bd 8d 02     jsr (0x8D02)
a10d: bd 8d ed     jsr (0x8DED)
a110: 46           rora
a111: 61           ?
a112: 69 6c        rol (X+0x6C)
a114: 65           ?
a115: 64 21        lsr (X+0x21)
a117: 20 20        bra [0xA139]
a119: 20 20        bra [0xA13B]
a11b: 20 20        bra [0xA13D]
a11d: 20 20        bra [0xA13F]
a11f: a0 c6        suba (X+0xC6)
a121: 02           idiv
a122: bd 8c 40     jsr (0x8C40)
a125: 39           rts
a126: c6 01        ldab 0x01
a128: bd 8c 40     jsr (0x8C40)
a12b: 7f 00 4e     clr (0x004E)
a12e: c6 d3        ldab 0xD3
a130: bd 87 58     jsr (0x8758)
a133: bd 87 be     jsr (0x87BE)
a136: bd 8c f9     jsr (0x8CF9)
a139: bd 8d f4     jsr (0x8DF4)
a13c: 20 20        bra [0xA15E]
a13e: 20 56        bra [0xA196]
a140: 43           coma
a141: 52           ?
a142: 20 61        bra [0xA1A5]
a144: 64 6a        lsr (X+0x6A)
a146: 75           ?
a147: 73 f4 bd     com (0xF4BD)
a14a: 8d ed        bsr [0xA139]
a14c: 55           ?
a14d: 50           negb
a14e: 20 74        bra [0xA1C4]
a150: 6f 20        clr (X+0x20)
a152: 63 6c        com (X+0x6C)
a154: 65           ?
a155: 61           ?
a156: 72           ?
a157: 20 62        bra [0xA1BB]
a159: 69 74        rol (X+0x74)
a15b: f3 5f d7     addd (0x5FD7)
a15e: 62           ?
a15f: bd fa f9     jsr (0xFAF9)
a162: b6 18 04     ldaa (0x1804)
a165: 84 bf        anda 0xBF
a167: b7 18 04     staa (0x1804)
a16a: bd 8e a5     jsr (0x8EA5)
a16d: 7f 00 48     clr (0x0048)
a170: 7f 00 49     clr (0x0049)
a173: bd 86 d4     jsr (0x86D4)
a176: 86 28        ldaa 0x28
a178: 97 63        staa (0x0063)
a17a: c6 fd        ldab 0xFD
a17c: bd 86 f7     jsr (0x86F7)
a17f: bd a3 6b     jsr (0xA36B)
a182: 7c 00 76     inc (0x0076)
a185: 7f 00 32     clr (0x0032)
a188: bd 8e a5     jsr (0x8EA5)
a18b: 81 0d        cmpa 0x0D
a18d: 26 03        bne [0xA192]
a18f: 7e a2 01     jmp (0xA201)
a192: 86 28        ldaa 0x28
a194: 97 63        staa (0x0063)
a196: bd 86 b2     jsr (0x86B2)
a199: 25 ed        bcs [0xA188]
a19b: fc 04 1a     ldd (0x041A)
a19e: c3 00 01     addd 0x0001
a1a1: fd 04 1a     std (0x041A)
a1a4: bd 86 d4     jsr (0x86D4)
a1a7: 7c 00 4e     inc (0x004E)
a1aa: c6 d3        ldab 0xD3
a1ac: bd 87 58     jsr (0x8758)
a1af: bd 87 be     jsr (0x87BE)
a1b2: 96 49        ldaa (0x0049)
a1b4: 81 43        cmpa 0x43
a1b6: 26 06        bne [0xA1BE]
a1b8: 7f 00 49     clr (0x0049)
a1bb: 7f 00 48     clr (0x0048)
a1be: 96 48        ldaa (0x0048)
a1c0: 81 c8        cmpa 0xC8
a1c2: 25 1f        bcs [0xA1E3]
a1c4: fc 02 9c     ldd (0x029C)
a1c7: 1a 83 00 01  cpd 0x0001
a1cb: 27 16        beq [0xA1E3]
a1cd: c6 ef        ldab 0xEF
a1cf: bd 86 f7     jsr (0x86F7)
a1d2: bd 86 d4     jsr (0x86D4)
a1d5: 7f 00 4e     clr (0x004E)
a1d8: 7f 00 76     clr (0x0076)
a1db: c6 0a        ldab 0x0A
a1dd: bd 8c 40     jsr (0x8C40)
a1e0: 7e 81 d4     jmp (0x81D4)
a1e3: bd 8e a5     jsr (0x8EA5)
a1e6: 81 01        cmpa 0x01
a1e8: 26 10        bne [0xA1FA]
a1ea: ce 10 80     ldx 0x1080
a1ed: 86 34        ldaa 0x34
a1ef: 6f 00        clr (X+0x00)
a1f1: a7 01        staa (X+0x01)
a1f3: 08           inx
a1f4: 08           inx
a1f5: 8c 10 a0     cpx 0x10A0
a1f8: 25 f5        bcs [0xA1EF]
a1fa: 81 0d        cmpa 0x0D
a1fc: 27 03        beq [0xA201]
a1fe: 7e a1 b2     jmp (0xA1B2)
a201: 7f 00 76     clr (0x0076)
a204: 7f 00 4e     clr (0x004E)
a207: c6 df        ldab 0xDF
a209: bd 87 58     jsr (0x8758)
a20c: bd 87 a1     jsr (0x87A1)
a20f: 7e 81 d4     jmp (0x81D4)
a212: 86 08        ldaa 0x08
a214: b7 04 00     staa (0x0400)
a217: cc 0e 09     ldd 0x0E09
a21a: 81 65        cmpa 0x65
a21c: 26 05        bne [0xA223]
a21e: c1 63        cmpb 0x63
a220: 26 01        bne [0xA223]
a222: 39           rts
a223: 86 0e        ldaa 0x0E
a225: b7 10 3b     staa (0x103B)
a228: 86 ff        ldaa 0xFF
a22a: b7 0e 00     staa (0x0E00)
a22d: b6 10 3b     ldaa (0x103B)
a230: 8a 01        oraa 0x01
a232: b7 10 3b     staa (0x103B)
a235: ce 1b 58     ldx 0x1B58
a238: 09           dex
a239: 26 fd        bne [0xA238]
a23b: b6 10 3b     ldaa (0x103B)
a23e: 84 fe        anda 0xFE
a240: b7 10 3b     staa (0x103B)
a243: ce 0e 00     ldx 0x0E00
a246: 18 ce a2 63  ldy 0xA263
a24a: c6 02        ldab 0x02
a24c: f7 10 3b     stab (0x103B)
a24f: 18 a6 00     ldaa (Y+0x00)
a252: 18 08        iny
a254: a7 00        staa (X+0x00)
a256: bd a2 6f     jsr (0xA26F)
a259: 08           inx
a25a: 8c 0e 0c     cpx 0x0E0C
a25d: 26 eb        bne [0xA24A]
a25f: 7f 10 3b     clr (0x103B)
a262: 39           rts
a263: 29 64        bvs [0xA2C9]
a265: 2a 21        bpl [0xA288]
a267: 32           pula
a268: 3a           abx
a269: 3a           abx
a26a: 34           des
a26b: 21 65        brn [0xA2D2]
a26d: 63 71        com (X+0x71)
a26f: 18 3c        pshy
a271: c6 03        ldab 0x03
a273: f7 10 3b     stab (0x103B)
a276: 18 ce 1b 58  ldy 0x1B58
a27a: 18 09        dey
a27c: 26 fc        bne [0xA27A]
a27e: c6 02        ldab 0x02
a280: f7 10 3b     stab (0x103B)
a283: 18 38        puly
a285: 39           rts
a286: 0f           sei
a287: ce 00 10     ldx 0x0010
a28a: 6f 00        clr (X+0x00)
a28c: 08           inx
a28d: 8c 0e 00     cpx 0x0E00
a290: 26 f8        bne [0xA28A]
a292: bd 9e ec     jsr (0x9EEC)
a295: bd 9e cf     jsr (0x9ECF)
a298: 7e f8 00     jmp (0xF800)
a29b: 18 ce 80 03  ldy 0x8003
a29f: ce 00 00     ldx 0x0000
a2a2: 18 e6 00     ldab (Y+0x00)
a2a5: 3a           abx
a2a6: 18 08        iny
a2a8: 18 8c 80 50  cpy 0x8050
a2ac: 26 f4        bne [0xA2A2]
a2ae: ff 04 0b     stx (0x040B)
a2b1: 39           rts
a2b2: 0f           sei
a2b3: 7f 04 0f     clr (0x040F)
a2b6: 86 0e        ldaa 0x0E
a2b8: b7 10 3b     staa (0x103B)
a2bb: 86 ff        ldaa 0xFF
a2bd: b7 0e 20     staa (0x0E20)
a2c0: b6 10 3b     ldaa (0x103B)
a2c3: 8a 01        oraa 0x01
a2c5: b7 10 3b     staa (0x103B)
a2c8: ce 1b 58     ldx 0x1B58
a2cb: 09           dex
a2cc: 26 fd        bne [0xA2CB]
a2ce: b6 10 3b     ldaa (0x103B)
a2d1: 84 fe        anda 0xFE
a2d3: 7f 10 3b     clr (0x103B)
a2d6: bd fb 0c     jsr (0xFB0C)
a2d9: 45           ?
a2da: 6e 74        jmp (X+0x74)
a2dc: 65           ?
a2dd: 72           ?
a2de: 20 73        bra [0xA353]
a2e0: 65           ?
a2e1: 72           ?
a2e2: 69 61        rol (X+0x61)
a2e4: 6c 20        inc (X+0x20)
a2e6: 23 3a        bls [0xA322]
a2e8: a0 ce        suba (X+0xCE)
a2ea: 0e           cli
a2eb: 20 bd        bra [0xA2AA]
a2ed: fa 79 24     orab (0x7924)
a2f0: fb bd fa     addb (0xBDFA)
a2f3: a3 c6        subd (X+0xC6)
a2f5: 02           idiv
a2f6: f7 10 3b     stab (0x103B)
a2f9: a7 00        staa (X+0x00)
a2fb: bd a2 6f     jsr (0xA26F)
a2fe: 08           inx
a2ff: 8c 0e 24     cpx 0x0E24
a302: 26 e8        bne [0xA2EC]
a304: c6 02        ldab 0x02
a306: f7 10 3b     stab (0x103B)
a309: 86 db        ldaa 0xDB
a30b: b7 0e 24     staa (0x0E24)
a30e: bd a2 6f     jsr (0xA26F)
a311: 7f 10 3b     clr (0x103B)
a314: 86 1e        ldaa 0x1E
a316: b7 10 35     staa (0x1035)
a319: 7e f8 00     jmp (0xF800)
a31c: 38           pulx
a31d: 3c           pshx
a31e: 8c 80 00     cpx 0x8000
a321: 25 02        bcs [0xA325]
a323: 0c           clc
a324: 39           rts
a325: 0d           sec
a326: 39           rts
a327: ce 02 88     ldx 0x0288
a32a: c6 03        ldab 0x03
a32c: bd fa 79     jsr (0xFA79)
a32f: 24 fb        bcc [0xA32C]
a331: a7 00        staa (X+0x00)
a333: 08           inx
a334: 5a           decb
a335: 26 f5        bne [0xA32C]
a337: b6 02 88     ldaa (0x0288)
a33a: 81 13        cmpa 0x13
a33c: 26 10        bne [0xA34E]
a33e: b6 02 89     ldaa (0x0289)
a341: 81 10        cmpa 0x10
a343: 26 09        bne [0xA34E]
a345: b6 02 8a     ldaa (0x028A)
a348: 81 14        cmpa 0x14
a34a: 26 02        bne [0xA34E]
a34c: 0c           clc
a34d: 39           rts
a34e: 0d           sec
a34f: 39           rts
a350: 36           psha
a351: b6 10 92     ldaa (0x1092)
a354: 8a 01        oraa 0x01
a356: b7 10 92     staa (0x1092)
a359: 32           pula
a35a: 39           rts
a35b: 36           psha
a35c: b6 10 92     ldaa (0x1092)
a35f: 84 fe        anda 0xFE
a361: 20 f3        bra [0xA356]
a363: 96 4e        ldaa (0x004E)
a365: 97 19        staa (0x0019)
a367: 7f 00 4e     clr (0x004E)
a36a: 39           rts
a36b: b6 10 86     ldaa (0x1086)
a36e: 8a 15        oraa 0x15
a370: b7 10 86     staa (0x1086)
a373: c6 01        ldab 0x01
a375: bd 8c 40     jsr (0x8C40)
a378: 84 ea        anda 0xEA
a37a: b7 10 86     staa (0x1086)
a37d: 39           rts
a37e: b6 10 86     ldaa (0x1086)
a381: 8a 2a        oraa 0x2A
a383: b7 10 86     staa (0x1086)
a386: c6 01        ldab 0x01
a388: bd 8c 40     jsr (0x8C40)
a38b: 84 d5        anda 0xD5
a38d: b7 10 86     staa (0x1086)
a390: 39           rts
a391: f6 18 04     ldab (0x1804)
a394: ca 08        orab 0x08
a396: f7 18 04     stab (0x1804)
a399: 39           rts
a39a: f6 18 04     ldab (0x1804)
a39d: c4 f7        andb 0xF7
a39f: f7 18 04     stab (0x1804)
a3a2: 39           rts
a3a3: 7f 00 4e     clr (0x004E)
a3a6: bd 86 d4     jsr (0x86D4)
a3a9: 7f 04 2a     clr (0x042A)
a3ac: bd fb 0c     jsr (0xFB0C)
a3af: 45           ?
a3b0: 6e 74        jmp (X+0x74)
a3b2: 65           ?
a3b3: 72           ?
a3b4: 20 73        bra [0xA429]
a3b6: 65           ?
a3b7: 63 75        com (X+0x75)
a3b9: 72           ?
a3ba: 69 74        rol (X+0x74)
a3bc: 79 20 63     rol (0x2063)
a3bf: 6f 64        clr (X+0x64)
a3c1: 65           ?
a3c2: ba bd a3     oraa (0xBDA3)
a3c5: 27 24        beq [0xA3EB]
a3c7: 03           fdiv
a3c8: 7e 83 3a     jmp (0x833A)
a3cb: bd fb 0c     jsr (0xFB0C)
a3ce: 0c           clc
a3cf: 0a           clv
a3d0: 0d           sec
a3d1: 44           lsra
a3d2: 61           ?
a3d3: 76 65 27     ror (0x6527)
a3d6: 73 20 53     com (0x2053)
a3d9: 65           ?
a3da: 74 75 70     lsr (0x7570)
a3dd: 20 55        bra [0xA434]
a3df: 74 69 6c     lsr (0x696C)
a3e2: 69 74        rol (X+0x74)
a3e4: 79 0a 0d     rol (0x0A0D)
a3e7: 3c           pshx
a3e8: 4b           ?
a3e9: 3e           wai
a3ea: 69 6e        rol (X+0x6E)
a3ec: 67 20        asr (X+0x20)
a3ee: 65           ?
a3ef: 6e 61        jmp (X+0x61)
a3f1: 62           ?
a3f2: 6c 65        inc (X+0x65)
a3f4: 0a           clv
a3f5: 0d           sec
a3f6: 3c           pshx
a3f7: 43           coma
a3f8: 3e           wai
a3f9: 6c 65        inc (X+0x65)
a3fb: 61           ?
a3fc: 72           ?
a3fd: 20 72        bra [0xA471]
a3ff: 61           ?
a400: 6e 64        jmp (X+0x64)
a402: 6f 6d        clr (X+0x6D)
a404: 0a           clv
a405: 0d           sec
a406: 3c           pshx
a407: 35           txs
a408: 3e           wai
a409: 20 63        bra [0xA46E]
a40b: 68 61        asl (X+0x61)
a40d: 72           ?
a40e: 61           ?
a40f: 63 74        com (X+0x74)
a411: 65           ?
a412: 72           ?
a413: 20 72        bra [0xA487]
a415: 61           ?
a416: 6e 64        jmp (X+0x64)
a418: 6f 6d        clr (X+0x6D)
a41a: 0a           clv
a41b: 0d           sec
a41c: 3c           pshx
a41d: 4c           inca
a41e: 3e           wai
a41f: 69 76        rol (X+0x76)
a421: 65           ?
a422: 20 74        bra [0xA498]
a424: 61           ?
a425: 70 65 20     neg (0x6520)
a428: 6e 75        jmp (X+0x75)
a42a: 6d 62        tst (X+0x62)
a42c: 65           ?
a42d: 72           ?
a42e: 20 63        bra [0xA493]
a430: 6c 65        inc (X+0x65)
a432: 61           ?
a433: 72           ?
a434: 0a           clv
a435: 0d           sec
a436: 3c           pshx
a437: 52           ?
a438: 3e           wai
a439: 65           ?
a43a: 67 75        asr (X+0x75)
a43c: 6c 61        inc (X+0x61)
a43e: 72           ?
a43f: 20 74        bra [0xA4B5]
a441: 61           ?
a442: 70 65 20     neg (0x6520)
a445: 6e 75        jmp (X+0x75)
a447: 6d 62        tst (X+0x62)
a449: 65           ?
a44a: 72           ?
a44b: 20 63        bra [0xA4B0]
a44d: 6c 65        inc (X+0x65)
a44f: 61           ?
a450: 72           ?
a451: 0a           clv
a452: 0d           sec
a453: 3c           pshx
a454: 54           lsrb
a455: 3e           wai
a456: 65           ?
a457: 73 74 20     com (0x7420)
a45a: 64 72        lsr (X+0x72)
a45c: 69 76        rol (X+0x76)
a45e: 65           ?
a45f: 72           ?
a460: 20 62        bra [0xA4C4]
a462: 6f 61        clr (X+0x61)
a464: 72           ?
a465: 64 73        lsr (X+0x73)
a467: 0a           clv
a468: 0d           sec
a469: 3c           pshx
a46a: 42           ?
a46b: 3e           wai
a46c: 75           ?
a46d: 62           ?
a46e: 20 74        bra [0xA4E4]
a470: 65           ?
a471: 73 74 0a     com (0x740A)
a474: 0d           sec
a475: 3c           pshx
a476: 44           lsra
a477: 3e           wai
a478: 65           ?
a479: 63 6b        com (X+0x6B)
a47b: 20 74        bra [0xA4F1]
a47d: 65           ?
a47e: 73 74 20     com (0x7420)
a481: 28 77        bvc [0xA4FA]
a483: 69 74        rol (X+0x74)
a485: 68 20        asl (X+0x20)
a487: 74 61 70     lsr (0x6170)
a48a: 65           ?
a48b: 20 69        bra [0xA4F6]
a48d: 6e 73        jmp (X+0x73)
a48f: 65           ?
a490: 72           ?
a491: 74 65 64     lsr (0x6564)
a494: 29 0a        bvs [0xA4A0]
a496: 0d           sec
a497: 3c           pshx
a498: 37           pshb
a499: 3e           wai
a49a: 35           txs
a49b: 25 20        bcs [0xA4BD]
a49d: 61           ?
a49e: 64 6a        lsr (X+0x6A)
a4a0: 75           ?
a4a1: 73 74 6d     com (0x746D)
a4a4: 65           ?
a4a5: 6e 74        jmp (X+0x74)
a4a7: 0a           clv
a4a8: 0d           sec
a4a9: 3c           pshx
a4aa: 53           comb
a4ab: 3e           wai
a4ac: 68 6f        asl (X+0x6F)
a4ae: 77 20 72     asr (0x2072)
a4b1: 65           ?
a4b2: 2d 76        blt [0xA52A]
a4b4: 61           ?
a4b5: 6c 69        inc (X+0x69)
a4b7: 64 20        lsr (X+0x20)
a4b9: 74 61 70     lsr (0x6170)
a4bc: 65           ?
a4bd: 73 0a 0d     com (0x0A0D)
a4c0: 3c           pshx
a4c1: 4a           deca
a4c2: 3e           wai
a4c3: 75           ?
a4c4: 6d 70        tst (X+0x70)
a4c6: 20 74        bra [0xA53C]
a4c8: 6f 20        clr (X+0x20)
a4ca: 73 79 73     com (0x7973)
a4cd: 74 65 6d     lsr (0x656D)
a4d0: 0a           clv
a4d1: 8d bd        bsr [0xA490]
a4d3: fa 79 24     orab (0x7924)
a4d6: fb 81 43     addb (0x8143)
a4d9: 26 09        bne [0xA4E4]
a4db: 7f 04 01     clr (0x0401)
a4de: 7f 04 2b     clr (0x042B)
a4e1: 7e a5 51     jmp (0xA551)
a4e4: 81 35        cmpa 0x35
a4e6: 26 0d        bne [0xA4F5]
a4e8: b6 04 01     ldaa (0x0401)
a4eb: 84 7f        anda 0x7F
a4ed: 8a 7f        oraa 0x7F
a4ef: b7 04 01     staa (0x0401)
a4f2: 7e a5 51     jmp (0xA551)
a4f5: 81 4c        cmpa 0x4C
a4f7: 26 06        bne [0xA4FF]
a4f9: bd 9e ec     jsr (0x9EEC)
a4fc: 7e a5 51     jmp (0xA551)
a4ff: 81 52        cmpa 0x52
a501: 26 06        bne [0xA509]
a503: bd 9e cf     jsr (0x9ECF)
a506: 7e a5 51     jmp (0xA551)
a509: 81 54        cmpa 0x54
a50b: 26 06        bne [0xA513]
a50d: bd a5 a2     jsr (0xA5A2)
a510: 7e a5 51     jmp (0xA551)
a513: 81 42        cmpa 0x42
a515: 26 06        bne [0xA51D]
a517: bd a5 63     jsr (0xA563)
a51a: 7e a5 51     jmp (0xA551)
a51d: 81 44        cmpa 0x44
a51f: 26 06        bne [0xA527]
a521: bd a5 79     jsr (0xA579)
a524: 7e a5 51     jmp (0xA551)
a527: 81 37        cmpa 0x37
a529: 26 08        bne [0xA533]
a52b: c6 fb        ldab 0xFB
a52d: bd 86 f7     jsr (0x86F7)
a530: 7e a5 51     jmp (0xA551)
a533: 81 4a        cmpa 0x4A
a535: 26 03        bne [0xA53A]
a537: 7e f8 00     jmp (0xF800)
a53a: 81 4b        cmpa 0x4B
a53c: 26 06        bne [0xA544]
a53e: 7c 04 2a     inc (0x042A)
a541: 7e a5 51     jmp (0xA551)
a544: 81 53        cmpa 0x53
a546: 26 06        bne [0xA54E]
a548: bd ab b9     jsr (0xABB9)
a54b: 7e a5 51     jmp (0xA551)
a54e: 7e a4 d2     jmp (0xA4D2)
a551: 86 07        ldaa 0x07
a553: bd fa a3     jsr (0xFAA3)
a556: c6 01        ldab 0x01
a558: bd 8c 40     jsr (0x8C40)
a55b: 86 07        ldaa 0x07
a55d: bd fa a3     jsr (0xFAA3)
a560: 7e a3 cb     jmp (0xA3CB)
a563: 5f           clrb
a564: bd fa f9     jsr (0xFAF9)
a567: f6 10 0a     ldab (0x100A)
a56a: c8 ff        eorb 0xFF
a56c: bd fa f9     jsr (0xFAF9)
a56f: c1 80        cmpb 0x80
a571: 26 f4        bne [0xA567]
a573: c6 02        ldab 0x02
a575: bd 8c 40     jsr (0x8C40)
a578: 39           rts
a579: c6 fd        ldab 0xFD
a57b: bd 86 f7     jsr (0x86F7)
a57e: c6 06        ldab 0x06
a580: bd 8c 40     jsr (0x8C40)
a583: c6 fb        ldab 0xFB
a585: bd 86 f7     jsr (0x86F7)
a588: c6 06        ldab 0x06
a58a: bd 8c 40     jsr (0x8C40)
a58d: c6 fd        ldab 0xFD
a58f: bd 86 f7     jsr (0x86F7)
a592: c6 f7        ldab 0xF7
a594: bd 86 f7     jsr (0x86F7)
a597: c6 06        ldab 0x06
a599: bd 8c 40     jsr (0x8C40)
a59c: c6 ef        ldab 0xEF
a59e: bd 86 f7     jsr (0x86F7)
a5a1: 39           rts
a5a2: bd fa 79     jsr (0xFA79)
a5a5: 24 08        bcc [0xA5AF]
a5a7: 81 1b        cmpa 0x1B
a5a9: 26 04        bne [0xA5AF]
a5ab: bd 86 d4     jsr (0x86D4)
a5ae: 39           rts
a5af: 86 08        ldaa 0x08
a5b1: 97 15        staa (0x0015)
a5b3: bd 86 d4     jsr (0x86D4)
a5b6: 86 01        ldaa 0x01
a5b8: 36           psha
a5b9: 16           tab
a5ba: bd fa f9     jsr (0xFAF9)
a5bd: b6 18 04     ldaa (0x1804)
a5c0: 88 08        eora 0x08
a5c2: b7 18 04     staa (0x1804)
a5c5: 32           pula
a5c6: b7 10 80     staa (0x1080)
a5c9: b7 10 84     staa (0x1084)
a5cc: b7 10 88     staa (0x1088)
a5cf: b7 10 8c     staa (0x108C)
a5d2: b7 10 90     staa (0x1090)
a5d5: b7 10 94     staa (0x1094)
a5d8: b7 10 98     staa (0x1098)
a5db: b7 10 9c     staa (0x109C)
a5de: c6 14        ldab 0x14
a5e0: bd a6 8f     jsr (0xA68F)
a5e3: 49           rola
a5e4: 36           psha
a5e5: d6 15        ldab (0x0015)
a5e7: 5a           decb
a5e8: d7 15        stab (0x0015)
a5ea: bd fa c9     jsr (0xFAC9)
a5ed: 37           pshb
a5ee: c6 27        ldab 0x27
a5f0: 96 15        ldaa (0x0015)
a5f2: 0c           clc
a5f3: 89 30        adca 0x30
a5f5: bd 8d c5     jsr (0x8DC5)
a5f8: 33           pulb
a5f9: 32           pula
a5fa: 5d           tstb
a5fb: 26 bb        bne [0xA5B8]
a5fd: 86 08        ldaa 0x08
a5ff: 97 15        staa (0x0015)
a601: bd 86 d4     jsr (0x86D4)
a604: 86 01        ldaa 0x01
a606: b7 10 82     staa (0x1082)
a609: b7 10 86     staa (0x1086)
a60c: b7 10 8a     staa (0x108A)
a60f: b7 10 8e     staa (0x108E)
a612: b7 10 92     staa (0x1092)
a615: b7 10 96     staa (0x1096)
a618: b7 10 9a     staa (0x109A)
a61b: b7 10 9e     staa (0x109E)
a61e: c6 14        ldab 0x14
a620: bd a6 8f     jsr (0xA68F)
a623: 49           rola
a624: 36           psha
a625: d6 15        ldab (0x0015)
a627: 5a           decb
a628: d7 15        stab (0x0015)
a62a: bd fa c9     jsr (0xFAC9)
a62d: 37           pshb
a62e: c6 27        ldab 0x27
a630: 96 15        ldaa (0x0015)
a632: 0c           clc
a633: 89 30        adca 0x30
a635: bd 8d c5     jsr (0x8DC5)
a638: 33           pulb
a639: 32           pula
a63a: 7d 00 15     tst (0x0015)
a63d: 26 c7        bne [0xA606]
a63f: bd 86 d4     jsr (0x86D4)
a642: ce 10 80     ldx 0x1080
a645: c6 00        ldab 0x00
a647: 86 ff        ldaa 0xFF
a649: a7 00        staa (X+0x00)
a64b: a7 02        staa (X+0x02)
a64d: 37           pshb
a64e: c6 1e        ldab 0x1E
a650: bd a6 8f     jsr (0xA68F)
a653: 33           pulb
a654: 86 00        ldaa 0x00
a656: a7 00        staa (X+0x00)
a658: a7 02        staa (X+0x02)
a65a: 5c           incb
a65b: 3c           pshx
a65c: bd fa c9     jsr (0xFAC9)
a65f: 37           pshb
a660: c6 27        ldab 0x27
a662: 32           pula
a663: 36           psha
a664: 0c           clc
a665: 89 30        adca 0x30
a667: bd 8d c5     jsr (0x8DC5)
a66a: 33           pulb
a66b: 38           pulx
a66c: 08           inx
a66d: 08           inx
a66e: 08           inx
a66f: 08           inx
a670: 8c 10 9d     cpx 0x109D
a673: 25 d2        bcs [0xA647]
a675: ce 10 80     ldx 0x1080
a678: 86 ff        ldaa 0xFF
a67a: a7 00        staa (X+0x00)
a67c: a7 02        staa (X+0x02)
a67e: 08           inx
a67f: 08           inx
a680: 08           inx
a681: 08           inx
a682: 8c 10 9d     cpx 0x109D
a685: 25 f1        bcs [0xA678]
a687: c6 06        ldab 0x06
a689: bd 8c 40     jsr (0x8C40)
a68c: 7e a5 a2     jmp (0xA5A2)
a68f: 36           psha
a690: 4f           clra
a691: dd 23        std (0x0023)
a693: 7d 00 24     tst (0x0024)
a696: 26 fb        bne [0xA693]
a698: 32           pula
a699: 39           rts
a69a: 30           tsx
a69b: 2c 43        bge [0xA6E0]
a69d: 68 75        asl (X+0x75)
a69f: 63 6b        com (X+0x6B)
a6a1: 2c 4d        bge [0xA6F0]
a6a3: 6f 75        clr (X+0x75)
a6a5: 74 68 2c     lsr (0x682C)
a6a8: 31           ins
a6a9: 2c 48        bge [0xA6F3]
a6ab: 65           ?
a6ac: 61           ?
a6ad: 64 20        lsr (X+0x20)
a6af: 6c 65        inc (X+0x65)
a6b1: 66 74        ror (X+0x74)
a6b3: 2c 32        bge [0xA6E7]
a6b5: 2c 48        bge [0xA6FF]
a6b7: 65           ?
a6b8: 61           ?
a6b9: 64 20        lsr (X+0x20)
a6bb: 72           ?
a6bc: 69 67        rol (X+0x67)
a6be: 68 74        asl (X+0x74)
a6c0: 2c 32        bge [0xA6F4]
a6c2: 2c 48        bge [0xA70C]
a6c4: 65           ?
a6c5: 61           ?
a6c6: 64 20        lsr (X+0x20)
a6c8: 75           ?
a6c9: 70 2c 32     neg (0x2C32)
a6cc: 2c 45        bge [0xA713]
a6ce: 79 65 73     rol (0x6573)
a6d1: 20 72        bra [0xA745]
a6d3: 69 67        rol (X+0x67)
a6d5: 68 74        asl (X+0x74)
a6d7: 2c 31        bge [0xA70A]
a6d9: 2c 45        bge [0xA720]
a6db: 79 65 6c     rol (0x656C)
a6de: 69 64        rol (X+0x64)
a6e0: 73 2c 31     com (0x2C31)
a6e3: 2c 52        bge [0xA737]
a6e5: 69 67        rol (X+0x67)
a6e7: 68 74        asl (X+0x74)
a6e9: 20 68        bra [0xA753]
a6eb: 61           ?
a6ec: 6e 64        jmp (X+0x64)
a6ee: 2c 32        bge [0xA722]
a6f0: 2c 45        bge [0xA737]
a6f2: 79 65 73     rol (0x6573)
a6f5: 20 6c        bra [0xA763]
a6f7: 65           ?
a6f8: 66 74        ror (X+0x74)
a6fa: 2c 31        bge [0xA72D]
a6fc: 2c 38        bge [0xA736]
a6fe: 2c 48        bge [0xA748]
a700: 65           ?
a701: 6c 65        inc (X+0x65)
a703: 6e 2c        jmp (X+0x2C)
a705: 4d           tsta
a706: 6f 75        clr (X+0x75)
a708: 74 68 2c     lsr (0x682C)
a70b: 31           ins
a70c: 2c 48        bge [0xA756]
a70e: 65           ?
a70f: 61           ?
a710: 64 20        lsr (X+0x20)
a712: 6c 65        inc (X+0x65)
a714: 66 74        ror (X+0x74)
a716: 2c 32        bge [0xA74A]
a718: 2c 48        bge [0xA762]
a71a: 65           ?
a71b: 61           ?
a71c: 64 20        lsr (X+0x20)
a71e: 72           ?
a71f: 69 67        rol (X+0x67)
a721: 68 74        asl (X+0x74)
a723: 2c 32        bge [0xA757]
a725: 2c 48        bge [0xA76F]
a727: 65           ?
a728: 61           ?
a729: 64 20        lsr (X+0x20)
a72b: 75           ?
a72c: 70 2c 32     neg (0x2C32)
a72f: 2c 45        bge [0xA776]
a731: 79 65 73     rol (0x6573)
a734: 20 72        bra [0xA7A8]
a736: 69 67        rol (X+0x67)
a738: 68 74        asl (X+0x74)
a73a: 2c 31        bge [0xA76D]
a73c: 2c 45        bge [0xA783]
a73e: 79 65 6c     rol (0x656C)
a741: 69 64        rol (X+0x64)
a743: 73 2c 31     com (0x2C31)
a746: 2c 52        bge [0xA79A]
a748: 69 67        rol (X+0x67)
a74a: 68 74        asl (X+0x74)
a74c: 20 68        bra [0xA7B6]
a74e: 61           ?
a74f: 6e 64        jmp (X+0x64)
a751: 2c 32        bge [0xA785]
a753: 2c 45        bge [0xA79A]
a755: 79 65 73     rol (0x6573)
a758: 20 6c        bra [0xA7C6]
a75a: 65           ?
a75b: 66 74        ror (X+0x74)
a75d: 2c 31        bge [0xA790]
a75f: 2c 36        bge [0xA797]
a761: 2c 4d        bge [0xA7B0]
a763: 75           ?
a764: 6e 63        jmp (X+0x63)
a766: 68 2c        asl (X+0x2C)
a768: 4d           tsta
a769: 6f 75        clr (X+0x75)
a76b: 74 68 2c     lsr (0x682C)
a76e: 31           ins
a76f: 2c 48        bge [0xA7B9]
a771: 65           ?
a772: 61           ?
a773: 64 20        lsr (X+0x20)
a775: 6c 65        inc (X+0x65)
a777: 66 74        ror (X+0x74)
a779: 2c 32        bge [0xA7AD]
a77b: 2c 48        bge [0xA7C5]
a77d: 65           ?
a77e: 61           ?
a77f: 64 20        lsr (X+0x20)
a781: 72           ?
a782: 69 67        rol (X+0x67)
a784: 68 74        asl (X+0x74)
a786: 2c 32        bge [0xA7BA]
a788: 2c 4c        bge [0xA7D6]
a78a: 65           ?
a78b: 66 74        ror (X+0x74)
a78d: 20 61        bra [0xA7F0]
a78f: 72           ?
a790: 6d 2c        tst (X+0x2C)
a792: 32           pula
a793: 2c 45        bge [0xA7DA]
a795: 79 65 73     rol (0x6573)
a798: 20 72        bra [0xA80C]
a79a: 69 67        rol (X+0x67)
a79c: 68 74        asl (X+0x74)
a79e: 2c 31        bge [0xA7D1]
a7a0: 2c 45        bge [0xA7E7]
a7a2: 79 65 6c     rol (0x656C)
a7a5: 69 64        rol (X+0x64)
a7a7: 73 2c 31     com (0x2C31)
a7aa: 2c 52        bge [0xA7FE]
a7ac: 69 67        rol (X+0x67)
a7ae: 68 74        asl (X+0x74)
a7b0: 20 61        bra [0xA813]
a7b2: 72           ?
a7b3: 6d 2c        tst (X+0x2C)
a7b5: 32           pula
a7b6: 2c 45        bge [0xA7FD]
a7b8: 79 65 73     rol (0x6573)
a7bb: 20 6c        bra [0xA829]
a7bd: 65           ?
a7be: 66 74        ror (X+0x74)
a7c0: 2c 31        bge [0xA7F3]
a7c2: 2c 32        bge [0xA7F6]
a7c4: 2c 4a        bge [0xA810]
a7c6: 61           ?
a7c7: 73 70 65     com (0x7065)
a7ca: 72           ?
a7cb: 2c 4d        bge [0xA81A]
a7cd: 6f 75        clr (X+0x75)
a7cf: 74 68 2c     lsr (0x682C)
a7d2: 31           ins
a7d3: 2c 48        bge [0xA81D]
a7d5: 65           ?
a7d6: 61           ?
a7d7: 64 20        lsr (X+0x20)
a7d9: 6c 65        inc (X+0x65)
a7db: 66 74        ror (X+0x74)
a7dd: 2c 32        bge [0xA811]
a7df: 2c 48        bge [0xA829]
a7e1: 65           ?
a7e2: 61           ?
a7e3: 64 20        lsr (X+0x20)
a7e5: 72           ?
a7e6: 69 67        rol (X+0x67)
a7e8: 68 74        asl (X+0x74)
a7ea: 2c 32        bge [0xA81E]
a7ec: 2c 48        bge [0xA836]
a7ee: 65           ?
a7ef: 61           ?
a7f0: 64 20        lsr (X+0x20)
a7f2: 75           ?
a7f3: 70 2c 32     neg (0x2C32)
a7f6: 2c 45        bge [0xA83D]
a7f8: 79 65 73     rol (0x6573)
a7fb: 20 72        bra [0xA86F]
a7fd: 69 67        rol (X+0x67)
a7ff: 68 74        asl (X+0x74)
a801: 2c 31        bge [0xA834]
a803: 2c 45        bge [0xA84A]
a805: 79 65 6c     rol (0x656C)
a808: 69 64        rol (X+0x64)
a80a: 73 2c 31     com (0x2C31)
a80d: 2c 48        bge [0xA857]
a80f: 61           ?
a810: 6e 64        jmp (X+0x64)
a812: 73 2c 32     com (0x2C32)
a815: 2c 45        bge [0xA85C]
a817: 79 65 73     rol (0x6573)
a81a: 20 6c        bra [0xA888]
a81c: 65           ?
a81d: 66 74        ror (X+0x74)
a81f: 2c 31        bge [0xA852]
a821: 2c 34        bge [0xA857]
a823: 2c 50        bge [0xA875]
a825: 61           ?
a826: 73 71 75     com (0x7175)
a829: 61           ?
a82a: 6c 6c        inc (X+0x6C)
a82c: 79 2c 4d     rol (0x2C4D)
a82f: 6f 75        clr (X+0x75)
a831: 74 68 2d     lsr (0x682D)
a834: 4d           tsta
a835: 75           ?
a836: 73 74 61     com (0x7461)
a839: 63 68        com (X+0x68)
a83b: 65           ?
a83c: 2c 31        bge [0xA86F]
a83e: 2c 48        bge [0xA888]
a840: 65           ?
a841: 61           ?
a842: 64 20        lsr (X+0x20)
a844: 6c 65        inc (X+0x65)
a846: 66 74        ror (X+0x74)
a848: 2c 32        bge [0xA87C]
a84a: 2c 48        bge [0xA894]
a84c: 65           ?
a84d: 61           ?
a84e: 64 20        lsr (X+0x20)
a850: 72           ?
a851: 69 67        rol (X+0x67)
a853: 68 74        asl (X+0x74)
a855: 2c 32        bge [0xA889]
a857: 2c 4c        bge [0xA8A5]
a859: 65           ?
a85a: 66 74        ror (X+0x74)
a85c: 20 61        bra [0xA8BF]
a85e: 72           ?
a85f: 6d 2c        tst (X+0x2C)
a861: 32           pula
a862: 2c 45        bge [0xA8A9]
a864: 79 65 73     rol (0x6573)
a867: 20 72        bra [0xA8DB]
a869: 69 67        rol (X+0x67)
a86b: 68 74        asl (X+0x74)
a86d: 2c 31        bge [0xA8A0]
a86f: 2c 45        bge [0xA8B6]
a871: 79 65 6c     rol (0x656C)
a874: 69 64        rol (X+0x64)
a876: 73 2c 31     com (0x2C31)
a879: 2c 52        bge [0xA8CD]
a87b: 69 67        rol (X+0x67)
a87d: 68 74        asl (X+0x74)
a87f: 20 61        bra [0xA8E2]
a881: 72           ?
a882: 6d 2c        tst (X+0x2C)
a884: 32           pula
a885: 2c 45        bge [0xA8CC]
a887: 79 65 73     rol (0x6573)
a88a: 20 6c        bra [0xA8F8]
a88c: 65           ?
a88d: 66 74        ror (X+0x74)
a88f: 2c 31        bge [0xA8C2]
a891: 2c 3c        bge [0xA8CF]
a893: bd 86 d4     jsr (0x86D4)
a896: ce 10 80     ldx 0x1080
a899: 86 20        ldaa 0x20
a89b: a7 00        staa (X+0x00)
a89d: a7 04        staa (X+0x04)
a89f: a7 08        staa (X+0x08)
a8a1: a7 0c        staa (X+0x0C)
a8a3: a7 10        staa (X+0x10)
a8a5: 38           pulx
a8a6: 39           rts
a8a7: bd a3 6b     jsr (0xA36B)
a8aa: bd 8d f4     jsr (0x8DF4)
a8ad: 20 20        bra [0xA8CF]
a8af: 20 20        bra [0xA8D1]
a8b1: 57           asrb
a8b2: 61           ?
a8b3: 72           ?
a8b4: 6d 2d        tst (X+0x2D)
a8b6: 55           ?
a8b7: 70 20 a0     neg (0x20A0)
a8ba: bd 8d ed     jsr (0x8DED)
a8bd: 43           coma
a8be: 75           ?
a8bf: 72           ?
a8c0: 74 61 69     lsr (0x6169)
a8c3: 6e 73        jmp (X+0x73)
a8c5: 20 6f        bra [0xA936]
a8c7: 70 65 6e     neg (0x656E)
a8ca: 69 6e        rol (X+0x6E)
a8cc: e7 c6        stab (X+0xC6)
a8ce: 14 bd 8c     bset (0x00BD), 0x8C
a8d1: 40           nega
a8d2: bd a8 92     jsr (0xA892)
a8d5: c6 02        ldab 0x02
a8d7: bd 8c 40     jsr (0x8C40)
a8da: ce a6 9a     ldx 0xA69A
a8dd: c6 05        ldab 0x05
a8df: d7 12        stab (0x0012)
a8e1: c6 08        ldab 0x08
a8e3: d7 13        stab (0x0013)
a8e5: bd a9 7e     jsr (0xA97E)
a8e8: bd a9 89     jsr (0xA989)
a8eb: c6 02        ldab 0x02
a8ed: bd 8c 40     jsr (0x8C40)
a8f0: bd a9 9b     jsr (0xA99B)
a8f3: a6 00        ldaa (X+0x00)
a8f5: 80 30        suba 0x30
a8f7: 08           inx
a8f8: 08           inx
a8f9: 36           psha
a8fa: 7c 00 4c     inc (0x004C)
a8fd: 3c           pshx
a8fe: bd 88 f5     jsr (0x88F5)
a901: 38           pulx
a902: 86 4f        ldaa 0x4F
a904: c6 0c        ldab 0x0C
a906: bd 8d c5     jsr (0x8DC5)
a909: 86 6e        ldaa 0x6E
a90b: c6 0d        ldab 0x0D
a90d: bd 8d c5     jsr (0x8DC5)
a910: cc 20 0e     ldd 0x200E
a913: bd 8d c5     jsr (0x8DC5)
a916: 7a 00 4c     dec (0x004C)
a919: 32           pula
a91a: 36           psha
a91b: c6 64        ldab 0x64
a91d: 3d           mul
a91e: dd 23        std (0x0023)
a920: dc 23        ldd (0x0023)
a922: 26 fc        bne [0xA920]
a924: bd 8e a5     jsr (0x8EA5)
a927: 81 0d        cmpa 0x0D
a929: 26 05        bne [0xA930]
a92b: bd a9 b2     jsr (0xA9B2)
a92e: 20 10        bra [0xA940]
a930: 81 01        cmpa 0x01
a932: 26 04        bne [0xA938]
a934: 32           pula
a935: 7e a8 d2     jmp (0xA8D2)
a938: 81 02        cmpa 0x02
a93a: 26 04        bne [0xA940]
a93c: 32           pula
a93d: 7e a9 72     jmp (0xA972)
a940: 3c           pshx
a941: bd 88 f5     jsr (0x88F5)
a944: 38           pulx
a945: 86 66        ldaa 0x66
a947: c6 0d        ldab 0x0D
a949: bd 8d c5     jsr (0x8DC5)
a94c: 86 66        ldaa 0x66
a94e: c6 0e        ldab 0x0E
a950: bd 8d c5     jsr (0x8DC5)
a953: 32           pula
a954: c6 64        ldab 0x64
a956: 3d           mul
a957: dd 23        std (0x0023)
a959: dc 23        ldd (0x0023)
a95b: 26 fc        bne [0xA959]
a95d: bd a8 92     jsr (0xA892)
a960: 7c 00 4b     inc (0x004B)
a963: 96 4b        ldaa (0x004B)
a965: 81 48        cmpa 0x48
a967: 25 87        bcs [0xA8F0]
a969: 96 4c        ldaa (0x004C)
a96b: 81 34        cmpa 0x34
a96d: 27 03        beq [0xA972]
a96f: 7e a8 e1     jmp (0xA8E1)
a972: c6 02        ldab 0x02
a974: bd 8c 40     jsr (0x8C40)
a977: bd 86 d4     jsr (0x86D4)
a97a: bd a3 7e     jsr (0xA37E)
a97d: 39           rts
a97e: a6 00        ldaa (X+0x00)
a980: 08           inx
a981: 08           inx
a982: 97 4c        staa (0x004C)
a984: 86 40        ldaa 0x40
a986: 97 4b        staa (0x004B)
a988: 39           rts
a989: bd 8d 02     jsr (0x8D02)
a98c: a6 00        ldaa (X+0x00)
a98e: 08           inx
a98f: 81 2c        cmpa 0x2C
a991: 27 07        beq [0xA99A]
a993: 36           psha
a994: bd 8e 80     jsr (0x8E80)
a997: 32           pula
a998: 20 f2        bra [0xA98C]
a99a: 39           rts
a99b: bd 8d 13     jsr (0x8D13)
a99e: 86 c0        ldaa 0xC0
a9a0: bd 8e 5b     jsr (0x8E5B)
a9a3: a6 00        ldaa (X+0x00)
a9a5: 08           inx
a9a6: 81 2c        cmpa 0x2C
a9a8: 27 07        beq [0xA9B1]
a9aa: 36           psha
a9ab: bd 8e 80     jsr (0x8E80)
a9ae: 32           pula
a9af: 20 f2        bra [0xA9A3]
a9b1: 39           rts
a9b2: bd 8e a5     jsr (0x8EA5)
a9b5: 4d           tsta
a9b6: 27 fa        beq [0xA9B2]
a9b8: 39           rts
a9b9: 7f 00 60     clr (0x0060)
a9bc: fc 02 9c     ldd (0x029C)
a9bf: 1a 83 00 01  cpd 0x0001
a9c3: 27 0c        beq [0xA9D1]
a9c5: 1a 83 03 e8  cpd 0x03E8
a9c9: 2d 7d        blt [0xAA48]
a9cb: 1a 83 04 4b  cpd 0x044B
a9cf: 22 77        bhi [0xAA48]
a9d1: c6 40        ldab 0x40
a9d3: d7 62        stab (0x0062)
a9d5: bd fa f9     jsr (0xFAF9)
a9d8: c6 64        ldab 0x64
a9da: bd 8c 32     jsr (0x8C32)
a9dd: bd 86 d4     jsr (0x86D4)
a9e0: bd 8c f9     jsr (0x8CF9)
a9e3: bd 8d f4     jsr (0x8DF4)
a9e6: 20 20        bra [0xAA08]
a9e8: 20 20        bra [0xAA0A]
a9ea: 20 53        bra [0xAA3F]
a9ec: 54           lsrb
a9ed: 55           ?
a9ee: 44           lsra
a9ef: 49           rola
a9f0: cf           stop
a9f1: bd 8d ed     jsr (0x8DED)
a9f4: 70 72 6f     neg (0x726F)
a9f7: 67 72        asr (X+0x72)
a9f9: 61           ?
a9fa: 6d 6d        tst (X+0x6D)
a9fc: 69 6e        rol (X+0x6E)
a9fe: 67 20        asr (X+0x20)
aa00: 6d 6f        tst (X+0x6F)
aa02: 64 e5        lsr (X+0xE5)
aa04: bd a3 6b     jsr (0xA36B)
aa07: bd 99 ae     jsr (0x99AE)
aa0a: bd 99 c1     jsr (0x99C1)
aa0d: ce 20 00     ldx 0x2000
aa10: 18 ce 00 c0  ldy 0x00C0
aa14: 18 09        dey
aa16: 26 0a        bne [0xAA22]
aa18: bd aa 31     jsr (0xAA31)
aa1b: 96 60        ldaa (0x0060)
aa1d: 26 29        bne [0xAA48]
aa1f: ce 20 00     ldx 0x2000
aa22: b6 10 a8     ldaa (0x10A8)
aa25: 84 01        anda 0x01
aa27: 27 eb        beq [0xAA14]
aa29: b6 10 a9     ldaa (0x10A9)
aa2c: a7 00        staa (X+0x00)
aa2e: 08           inx
aa2f: 20 df        bra [0xAA10]
aa31: ce 20 00     ldx 0x2000
aa34: 18 ce 10 80  ldy 0x1080
aa38: a6 00        ldaa (X+0x00)
aa3a: 18 a7 00     staa (Y+0x00)
aa3d: 08           inx
aa3e: 18 08        iny
aa40: 18 08        iny
aa42: 8c 20 10     cpx 0x2010
aa45: 25 f1        bcs [0xAA38]
aa47: 39           rts
aa48: 39           rts
aa49: cc 48 37     ldd 0x4837
aa4c: bd 8d c5     jsr (0x8DC5)
aa4f: 39           rts
aa50: cc 20 37     ldd 0x2037
aa53: 20 f7        bra [0xAA4C]
aa55: cc 42 0f     ldd 0x420F
aa58: 20 f2        bra [0xAA4C]
aa5a: cc 20 0f     ldd 0x200F
aa5d: 20 ed        bra [0xAA4C]
aa5f: 7f 00 4f     clr (0x004F)
aa62: cc 00 01     ldd 0x0001
aa65: dd 1b        std (0x001B)
aa67: ce 20 00     ldx 0x2000
aa6a: b6 10 a8     ldaa (0x10A8)
aa6d: 84 01        anda 0x01
aa6f: 27 f9        beq [0xAA6A]
aa71: dc 1b        ldd (0x001B)
aa73: 0f           sei
aa74: 26 03        bne [0xAA79]
aa76: ce 20 00     ldx 0x2000
aa79: b6 10 a9     ldaa (0x10A9)
aa7c: a7 00        staa (X+0x00)
aa7e: 0e           cli
aa7f: bd fa a3     jsr (0xFAA3)
aa82: 08           inx
aa83: 7f 00 4f     clr (0x004F)
aa86: cc 00 01     ldd 0x0001
aa89: dd 1b        std (0x001B)
aa8b: 8c 20 23     cpx 0x2023
aa8e: 26 da        bne [0xAA6A]
aa90: ce 20 00     ldx 0x2000
aa93: 7f 00 b7     clr (0x00B7)
aa96: a6 00        ldaa (X+0x00)
aa98: 9b b7        adda (0x00B7)
aa9a: 97 b7        staa (0x00B7)
aa9c: 08           inx
aa9d: 8c 20 22     cpx 0x2022
aaa0: 25 f4        bcs [0xAA96]
aaa2: 96 b7        ldaa (0x00B7)
aaa4: 88 ff        eora 0xFF
aaa6: a1 00        cmpa (X+0x00)
aaa8: ce 20 00     ldx 0x2000
aaab: a6 20        ldaa (X+0x20)
aaad: 2b 03        bmi [0xAAB2]
aaaf: 7e aa 5f     jmp (0xAA5F)
aab2: a6 00        ldaa (X+0x00)
aab4: b7 10 80     staa (0x1080)
aab7: 08           inx
aab8: a6 00        ldaa (X+0x00)
aaba: b7 10 82     staa (0x1082)
aabd: 08           inx
aabe: a6 00        ldaa (X+0x00)
aac0: b7 10 84     staa (0x1084)
aac3: 08           inx
aac4: a6 00        ldaa (X+0x00)
aac6: b7 10 86     staa (0x1086)
aac9: 08           inx
aaca: a6 00        ldaa (X+0x00)
aacc: b7 10 88     staa (0x1088)
aacf: 08           inx
aad0: a6 00        ldaa (X+0x00)
aad2: b7 10 8a     staa (0x108A)
aad5: 08           inx
aad6: a6 00        ldaa (X+0x00)
aad8: b7 10 8c     staa (0x108C)
aadb: 08           inx
aadc: a6 00        ldaa (X+0x00)
aade: b7 10 8e     staa (0x108E)
aae1: 08           inx
aae2: a6 00        ldaa (X+0x00)
aae4: b7 10 90     staa (0x1090)
aae7: 08           inx
aae8: a6 00        ldaa (X+0x00)
aaea: b7 10 92     staa (0x1092)
aaed: 08           inx
aaee: a6 00        ldaa (X+0x00)
aaf0: 8a 80        oraa 0x80
aaf2: b7 10 94     staa (0x1094)
aaf5: 08           inx
aaf6: a6 00        ldaa (X+0x00)
aaf8: 8a 01        oraa 0x01
aafa: b7 10 96     staa (0x1096)
aafd: 08           inx
aafe: a6 00        ldaa (X+0x00)
ab00: b7 10 98     staa (0x1098)
ab03: 08           inx
ab04: a6 00        ldaa (X+0x00)
ab06: b7 10 9a     staa (0x109A)
ab09: 08           inx
ab0a: a6 00        ldaa (X+0x00)
ab0c: b7 10 9c     staa (0x109C)
ab0f: 08           inx
ab10: a6 00        ldaa (X+0x00)
ab12: b7 10 9e     staa (0x109E)
ab15: 7e aa 5f     jmp (0xAA5F)
ab18: 7f 10 98     clr (0x1098)
ab1b: 7f 10 9a     clr (0x109A)
ab1e: 7f 10 9c     clr (0x109C)
ab21: 7f 10 9e     clr (0x109E)
ab24: 39           rts
ab25: ce 04 2c     ldx 0x042C
ab28: c6 10        ldab 0x10
ab2a: 5d           tstb
ab2b: 27 12        beq [0xAB3F]
ab2d: a6 00        ldaa (X+0x00)
ab2f: 81 30        cmpa 0x30
ab31: 25 0d        bcs [0xAB40]
ab33: 81 39        cmpa 0x39
ab35: 22 09        bhi [0xAB40]
ab37: 08           inx
ab38: 08           inx
ab39: 08           inx
ab3a: 8c 04 59     cpx 0x0459
ab3d: 23 eb        bls [0xAB2A]
ab3f: 39           rts
ab40: 5a           decb
ab41: 3c           pshx
ab42: a6 03        ldaa (X+0x03)
ab44: a7 00        staa (X+0x00)
ab46: 08           inx
ab47: 8c 04 5c     cpx 0x045C
ab4a: 25 f6        bcs [0xAB42]
ab4c: 86 ff        ldaa 0xFF
ab4e: b7 04 59     staa (0x0459)
ab51: 38           pulx
ab52: 20 d6        bra [0xAB2A]
ab54: ce 04 2c     ldx 0x042C
ab57: 86 ff        ldaa 0xFF
ab59: a7 00        staa (X+0x00)
ab5b: 08           inx
ab5c: 8c 04 5c     cpx 0x045C
ab5f: 25 f8        bcs [0xAB59]
ab61: 39           rts
ab62: ce 04 2c     ldx 0x042C
ab65: a6 00        ldaa (X+0x00)
ab67: 81 30        cmpa 0x30
ab69: 25 17        bcs [0xAB82]
ab6b: 81 39        cmpa 0x39
ab6d: 22 13        bhi [0xAB82]
ab6f: 08           inx
ab70: 08           inx
ab71: 08           inx
ab72: 8c 04 5c     cpx 0x045C
ab75: 25 ee        bcs [0xAB65]
ab77: 86 ff        ldaa 0xFF
ab79: b7 04 2c     staa (0x042C)
ab7c: bd ab 25     jsr (0xAB25)
ab7f: ce 04 59     ldx 0x0459
ab82: 39           rts
ab83: b6 02 99     ldaa (0x0299)
ab86: a7 00        staa (X+0x00)
ab88: b6 02 9a     ldaa (0x029A)
ab8b: a7 01        staa (X+0x01)
ab8d: b6 02 9b     ldaa (0x029B)
ab90: a7 02        staa (X+0x02)
ab92: 39           rts
ab93: ce 04 2c     ldx 0x042C
ab96: b6 02 99     ldaa (0x0299)
ab99: a1 00        cmpa (X+0x00)
ab9b: 26 10        bne [0xABAD]
ab9d: b6 02 9a     ldaa (0x029A)
aba0: a1 01        cmpa (X+0x01)
aba2: 26 09        bne [0xABAD]
aba4: b6 02 9b     ldaa (0x029B)
aba7: a1 02        cmpa (X+0x02)
aba9: 26 02        bne [0xABAD]
abab: 20 0a        bra [0xABB7]
abad: 08           inx
abae: 08           inx
abaf: 08           inx
abb0: 8c 04 5c     cpx 0x045C
abb3: 25 e1        bcs [0xAB96]
abb5: 0d           sec
abb6: 39           rts
abb7: 0c           clc
abb8: 39           rts
abb9: ce 04 2c     ldx 0x042C
abbc: a6 00        ldaa (X+0x00)
abbe: 81 30        cmpa 0x30
abc0: 25 1e        bcs [0xABE0]
abc2: 81 39        cmpa 0x39
abc4: 22 1a        bhi [0xABE0]
abc6: bd fa a3     jsr (0xFAA3)
abc9: 08           inx
abca: a6 00        ldaa (X+0x00)
abcc: bd fa a3     jsr (0xFAA3)
abcf: 08           inx
abd0: a6 00        ldaa (X+0x00)
abd2: bd fa a3     jsr (0xFAA3)
abd5: 08           inx
abd6: 86 20        ldaa 0x20
abd8: bd fa a3     jsr (0xFAA3)
abdb: 8c 04 5c     cpx 0x045C
abde: 25 dc        bcs [0xABBC]
abe0: 86 0d        ldaa 0x0D
abe2: bd fa a3     jsr (0xFAA3)
abe5: 86 0a        ldaa 0x0A
abe7: bd fa a3     jsr (0xFAA3)
abea: 39           rts
abeb: 7f 00 4a     clr (0x004A)
abee: cc 00 64     ldd 0x0064
abf1: dd 23        std (0x0023)
abf3: 96 4a        ldaa (0x004A)
abf5: 26 08        bne [0xABFF]
abf7: bd 9b 29     jsr (0x9B29)
abfa: dc 23        ldd (0x0023)
abfc: 26 f5        bne [0xABF3]
abfe: 39           rts
abff: 81 31        cmpa 0x31
ac01: 26 04        bne [0xAC07]
ac03: bd ab 54     jsr (0xAB54)
ac06: 39           rts
ac07: 20 f5        bra [0xABFE]
ac09: dc 10        ldd (0x0010)
ac0b: c3 02 71     addd 0x0271
ac0e: fd 10 16     std (0x1016)
ac11: dd 10        std (0x0010)
ac13: 86 80        ldaa 0x80
ac15: b7 10 23     staa (0x1023)
ac18: 7d 00 78     tst (0x0078)
ac1b: 27 1c        beq [0xAC39]
ac1d: dc 25        ldd (0x0025)
ac1f: c3 00 01     addd 0x0001
ac22: dd 25        std (0x0025)
ac24: 1a 83 00 c8  cpd 0x00C8
ac28: 26 0f        bne [0xAC39]
ac2a: 7f 00 25     clr (0x0025)
ac2d: 7f 00 26     clr (0x0026)
ac30: d6 62        ldab (0x0062)
ac32: c8 08        eorb 0x08
ac34: d7 62        stab (0x0062)
ac36: bd fa f9     jsr (0xFAF9)
ac39: 7c 00 6f     inc (0x006F)
ac3c: 96 6f        ldaa (0x006F)
ac3e: 81 28        cmpa 0x28
ac40: 25 42        bcs [0xAC84]
ac42: 7f 00 6f     clr (0x006F)
ac45: 7d 00 63     tst (0x0063)
ac48: 27 03        beq [0xAC4D]
ac4a: 7a 00 63     dec (0x0063)
ac4d: 96 70        ldaa (0x0070)
ac4f: 4a           deca
ac50: 97 70        staa (0x0070)
ac52: 26 04        bne [0xAC58]
ac54: 86 fa        ldaa 0xFA
ac56: 97 70        staa (0x0070)
ac58: 96 71        ldaa (0x0071)
ac5a: 4a           deca
ac5b: 97 71        staa (0x0071)
ac5d: 26 04        bne [0xAC63]
ac5f: 86 e6        ldaa 0xE6
ac61: 97 71        staa (0x0071)
ac63: 96 72        ldaa (0x0072)
ac65: 4a           deca
ac66: 97 72        staa (0x0072)
ac68: 26 04        bne [0xAC6E]
ac6a: 86 d2        ldaa 0xD2
ac6c: 97 72        staa (0x0072)
ac6e: 96 73        ldaa (0x0073)
ac70: 4a           deca
ac71: 97 73        staa (0x0073)
ac73: 26 04        bne [0xAC79]
ac75: 86 be        ldaa 0xBE
ac77: 97 73        staa (0x0073)
ac79: 96 74        ldaa (0x0074)
ac7b: 4a           deca
ac7c: 97 74        staa (0x0074)
ac7e: 26 04        bne [0xAC84]
ac80: 86 aa        ldaa 0xAA
ac82: 97 74        staa (0x0074)
ac84: 96 27        ldaa (0x0027)
ac86: 4c           inca
ac87: 97 27        staa (0x0027)
ac89: 81 0c        cmpa 0x0C
ac8b: 23 09        bls [0xAC96]
ac8d: 7f 00 27     clr (0x0027)
ac90: bd 8e d6     jsr (0x8ED6)
ac93: bd 8f 22     jsr (0x8F22)
ac96: 96 43        ldaa (0x0043)
ac98: 27 55        beq [0xACEF]
ac9a: de 44        ldx (0x0044)
ac9c: a6 00        ldaa (X+0x00)
ac9e: 27 23        beq [0xACC3]
aca0: b7 10 00     staa (0x1000)
aca3: b6 10 02     ldaa (0x1002)
aca6: 84 f3        anda 0xF3
aca8: b7 10 02     staa (0x1002)
acab: 84 fd        anda 0xFD
acad: b7 10 02     staa (0x1002)
acb0: 8a 02        oraa 0x02
acb2: b7 10 02     staa (0x1002)
acb5: 08           inx
acb6: 08           inx
acb7: 8c 05 80     cpx 0x0580
acba: 25 03        bcs [0xACBF]
acbc: ce 05 00     ldx 0x0500
acbf: df 44        stx (0x0044)
acc1: 20 2c        bra [0xACEF]
acc3: a6 01        ldaa (X+0x01)
acc5: 27 25        beq [0xACEC]
acc7: b7 10 00     staa (0x1000)
acca: b6 10 02     ldaa (0x1002)
accd: 84 fb        anda 0xFB
accf: 8a 08        oraa 0x08
acd1: b7 10 02     staa (0x1002)
acd4: 84 fd        anda 0xFD
acd6: b7 10 02     staa (0x1002)
acd9: 8a 02        oraa 0x02
acdb: b7 10 02     staa (0x1002)
acde: 08           inx
acdf: 08           inx
ace0: 8c 05 80     cpx 0x0580
ace3: 25 03        bcs [0xACE8]
ace5: ce 05 00     ldx 0x0500
ace8: df 44        stx (0x0044)
acea: 20 03        bra [0xACEF]
acec: 7f 00 43     clr (0x0043)
acef: 96 4f        ldaa (0x004F)
acf1: 4c           inca
acf2: 97 4f        staa (0x004F)
acf4: 81 04        cmpa 0x04
acf6: 26 30        bne [0xAD28]
acf8: 7f 00 4f     clr (0x004F)
acfb: dc 1b        ldd (0x001B)
acfd: 27 05        beq [0xAD04]
acff: 83 00 01     subd 0x0001
ad02: dd 1b        std (0x001B)
ad04: dc 1d        ldd (0x001D)
ad06: 27 05        beq [0xAD0D]
ad08: 83 00 01     subd 0x0001
ad0b: dd 1d        std (0x001D)
ad0d: dc 1f        ldd (0x001F)
ad0f: 27 05        beq [0xAD16]
ad11: 83 00 01     subd 0x0001
ad14: dd 1f        std (0x001F)
ad16: dc 21        ldd (0x0021)
ad18: 27 05        beq [0xAD1F]
ad1a: 83 00 01     subd 0x0001
ad1d: dd 21        std (0x0021)
ad1f: dc 23        ldd (0x0023)
ad21: 27 05        beq [0xAD28]
ad23: 83 00 01     subd 0x0001
ad26: dd 23        std (0x0023)
ad28: 96 b0        ldaa (0x00B0)
ad2a: 88 01        eora 0x01
ad2c: 97 b0        staa (0x00B0)
ad2e: 27 18        beq [0xAD48]
ad30: bf 01 3c     sts (0x013C)
ad33: be 01 3e     lds (0x013E)
ad36: dc 10        ldd (0x0010)
ad38: 83 01 f4     subd 0x01F4
ad3b: fd 10 18     std (0x1018)
ad3e: 86 40        ldaa 0x40
ad40: b7 10 23     staa (0x1023)
ad43: 86 c0        ldaa 0xC0
ad45: b7 10 22     staa (0x1022)
ad48: 3b           rti
ad49: 86 40        ldaa 0x40
ad4b: b7 10 23     staa (0x1023)
ad4e: bf 01 3e     sts (0x013E)
ad51: be 01 3c     lds (0x013C)
ad54: 86 80        ldaa 0x80
ad56: b7 10 22     staa (0x1022)
ad59: 3b           rti
ad5a: 7d 04 2a     tst (0x042A)
ad5d: 27 35        beq [0xAD94]
ad5f: 96 b6        ldaa (0x00B6)
ad61: 26 03        bne [0xAD66]
ad63: 3f           swi
ad64: 20 f4        bra [0xAD5A]
ad66: 7f 00 b6     clr (0x00B6)
ad69: c6 04        ldab 0x04
ad6b: 37           pshb
ad6c: ce ad 79     ldx 0xAD79
ad6f: bd 8a 2a     jsr (0x8A2A)
ad72: 3f           swi
ad73: 33           pulb
ad74: 5a           decb
ad75: 26 f4        bne [0xAD6B]
ad77: 20 e1        bra [0xAD5A]
ad79: 53           comb
ad7a: 31           ins
ad7b: 00           test
ad7c: fc 02 9c     ldd (0x029C)
ad7f: 1a 83 00 01  cpd 0x0001
ad83: 27 0c        beq [0xAD91]
ad85: 1a 83 03 e8  cpd 0x03E8
ad89: 2d 09        blt [0xAD94]
ad8b: 1a 83 04 4b  cpd 0x044B
ad8f: 22 03        bhi [0xAD94]
ad91: 3f           swi
ad92: 20 c6        bra [0xAD5A]
ad94: 7f 00 b3     clr (0x00B3)
ad97: bd ad bb     jsr (0xADBB)
ad9a: bd ad dd     jsr (0xADDD)
ad9d: 25 bb        bcs [0xAD5A]
ad9f: c6 0a        ldab 0x0A
ada1: bd ae 50     jsr (0xAE50)
ada4: bd ad eb     jsr (0xADEB)
ada7: 25 b1        bcs [0xAD5A]
ada9: c6 14        ldab 0x14
adab: bd ae 50     jsr (0xAE50)
adae: bd ad f3     jsr (0xADF3)
adb1: 25 a7        bcs [0xAD5A]
adb3: bd ad f5     jsr (0xADF5)
adb6: 0d           sec
adb7: 25 a1        bcs [0xAD5A]
adb9: 20 f8        bra [0xADB3]
adbb: ce ae 5b     ldx 0xAE5B
adbe: bd 8a 2a     jsr (0x8A2A)
adc1: c6 1e        ldab 0x1E
adc3: bd ae 50     jsr (0xAE50)
adc6: ce ae 5f     ldx 0xAE5F
adc9: bd 8a 2a     jsr (0x8A2A)
adcc: c6 1e        ldab 0x1E
adce: bd ae 50     jsr (0xAE50)
add1: ce ae 64     ldx 0xAE64
add4: bd 8a 2a     jsr (0x8A2A)
add7: c6 1e        ldab 0x1E
add9: bd ae 50     jsr (0xAE50)
addc: 39           rts
addd: bd b2 1a     jsr (0xB21A)
ade0: 25 fb        bcs [0xADDD]
ade2: bd b2 8c     jsr (0xB28C)
ade5: 52           ?
ade6: 49           rola
ade7: 4e           ?
ade8: 47           asra
ade9: 00           test
adea: 39           rts
adeb: ce ae 69     ldx 0xAE69
adee: bd 8a 2a     jsr (0x8A2A)
adf1: 0c           clc
adf2: 39           rts
adf3: 0c           clc
adf4: 39           rts
adf5: bd b2 0f     jsr (0xB20F)
adf8: bd ae 6e     jsr (0xAE6E)
adfb: 86 01        ldaa 0x01
adfd: 97 b3        staa (0x00B3)
adff: bd b2 1a     jsr (0xB21A)
ae02: bd b2 ae     jsr (0xB2AE)
ae05: 36           psha
ae06: bd b2 fd     jsr (0xB2FD)
ae09: 32           pula
ae0a: 81 01        cmpa 0x01
ae0c: 26 08        bne [0xAE16]
ae0e: ce b2 d2     ldx 0xB2D2
ae11: bd 8a 2a     jsr (0x8A2A)
ae14: 20 31        bra [0xAE47]
ae16: 81 02        cmpa 0x02
ae18: 26 00        bne [0xAE1A]
ae1a: 81 03        cmpa 0x03
ae1c: 26 00        bne [0xAE1E]
ae1e: 81 04        cmpa 0x04
ae20: 26 00        bne [0xAE22]
ae22: 81 05        cmpa 0x05
ae24: 26 00        bne [0xAE26]
ae26: 81 06        cmpa 0x06
ae28: 26 00        bne [0xAE2A]
ae2a: 81 07        cmpa 0x07
ae2c: 26 00        bne [0xAE2E]
ae2e: 81 08        cmpa 0x08
ae30: 26 00        bne [0xAE32]
ae32: 81 09        cmpa 0x09
ae34: 26 00        bne [0xAE36]
ae36: 81 0a        cmpa 0x0A
ae38: 26 00        bne [0xAE3A]
ae3a: 81 0b        cmpa 0x0B
ae3c: 26 09        bne [0xAE47]
ae3e: ce b2 e7     ldx 0xB2E7
ae41: bd 8a 2a     jsr (0x8A2A)
ae44: 7e ae 47     jmp (0xAE47)
ae47: c6 14        ldab 0x14
ae49: bd ae 50     jsr (0xAE50)
ae4c: 7f 00 b3     clr (0x00B3)
ae4f: 39           rts
ae50: ce 00 20     ldx 0x0020
ae53: 3f           swi
ae54: 09           dex
ae55: 26 fc        bne [0xAE53]
ae57: 5a           decb
ae58: 26 f6        bne [0xAE50]
ae5a: 39           rts
ae5b: 2b 2b        bmi [0xAE88]
ae5d: 2b 00        bmi [0xAE5F]
ae5f: 41           ?
ae60: 54           lsrb
ae61: 48           asla
ae62: 0d           sec
ae63: 00           test
ae64: 41           ?
ae65: 54           lsrb
ae66: 5a           decb
ae67: 0d           sec
ae68: 00           test
ae69: 41           ?
ae6a: 54           lsrb
ae6b: 41           ?
ae6c: 0d           sec
ae6d: 00           test
ae6e: ce ae 75     ldx 0xAE75
ae71: bd 8a 2a     jsr (0x8A2A)
ae74: 39           rts
ae75: 5e           ?
ae76: 30           tsx
ae77: 31           ins
ae78: 30           tsx
ae79: 31           ins
ae7a: 53           comb
ae7b: 65           ?
ae7c: 72           ?
ae7d: 69 61        rol (X+0x61)
ae7f: 6c 20        inc (X+0x20)
ae81: 23 3a        bls [0xAEBD]
ae83: 5e           ?
ae84: 30           tsx
ae85: 31           ins
ae86: 34           des
ae87: 30           tsx
ae88: 23 30        bls [0xAEBA]
ae8a: 30           tsx
ae8b: 30           tsx
ae8c: 30           tsx
ae8d: 5e           ?
ae8e: 30           tsx
ae8f: 31           ins
ae90: 31           ins
ae91: 31           ins
ae92: 7e 34 0e     jmp (0x340E)
ae95: 20 5e        bra [0xAEF5]
ae97: 30           tsx
ae98: 31           ins
ae99: 34           des
ae9a: 31           ins
ae9b: 7c 04 28     inc (0x0428)
ae9e: 5e           ?
ae9f: 30           tsx
aea0: 33           pulb
aea1: 30           tsx
aea2: 31           ins
aea3: 43           coma
aea4: 55           ?
aea5: 52           ?
aea6: 52           ?
aea7: 45           ?
aea8: 4e           ?
aea9: 54           lsrb
aeaa: 5e           ?
aeab: 30           tsx
aeac: 33           pulb
aead: 34           des
aeae: 30           tsx
aeaf: 48           asla
aeb0: 49           rola
aeb1: 53           comb
aeb2: 54           lsrb
aeb3: 4f           clra
aeb4: 52           ?
aeb5: 59           rolb
aeb6: 5e           ?
aeb7: 30           tsx
aeb8: 35           txs
aeb9: 30           tsx
aeba: 31           ins
aebb: 53           comb
aebc: 68 6f        asl (X+0x6F)
aebe: 77 20 53     asr (0x2053)
aec1: 74 61 74     lsr (0x6174)
aec4: 75           ?
aec5: 73 3a 5e     com (0x3A5E)
aec8: 30           tsx
aec9: 35           txs
aeca: 34           des
aecb: 30           tsx
aecc: 54           lsrb
aecd: 6f 74        clr (X+0x74)
aecf: 61           ?
aed0: 6c 20        inc (X+0x20)
aed2: 23 20        bls [0xAEF4]
aed4: 72           ?
aed5: 65           ?
aed6: 67 2e        asr (X+0x2E)
aed8: 20 73        bra [0xAF4D]
aeda: 68 6f        asl (X+0x6F)
aedc: 77 73 3a     asr (0x733A)
aedf: 5e           ?
aee0: 30           tsx
aee1: 36           psha
aee2: 30           tsx
aee3: 31           ins
aee4: 52           ?
aee5: 61           ?
aee6: 6e 64        jmp (X+0x64)
aee8: 6f 6d        clr (X+0x6D)
aeea: 20 53        bra [0xAF3F]
aeec: 74 61 74     lsr (0x6174)
aeef: 75           ?
aef0: 73 3a 5e     com (0x3A5E)
aef3: 30           tsx
aef4: 35           txs
aef5: 37           pshb
aef6: 30           tsx
aef7: 7c 04 10     inc (0x0410)
aefa: 5e           ?
aefb: 30           tsx
aefc: 36           psha
aefd: 34           des
aefe: 30           tsx
aeff: 54           lsrb
af00: 6f 74        clr (X+0x74)
af02: 61           ?
af03: 6c 20        inc (X+0x20)
af05: 23 20        bls [0xAF27]
af07: 6c 69        inc (X+0x69)
af09: 76 65 20     ror (0x6520)
af0c: 73 68 6f     com (0x686F)
af0f: 77 73 3a     asr (0x733A)
af12: 5e           ?
af13: 30           tsx
af14: 37           pshb
af15: 30           tsx
af16: 31           ins
af17: 43           coma
af18: 75           ?
af19: 72           ?
af1a: 72           ?
af1b: 65           ?
af1c: 6e 74        jmp (X+0x74)
af1e: 20 52        bra [0xAF72]
af20: 65           ?
af21: 67 20        asr (X+0x20)
af23: 54           lsrb
af24: 61           ?
af25: 70 65 20     neg (0x6520)
af28: 23 3a        bls [0xAF64]
af2a: 5e           ?
af2b: 30           tsx
af2c: 36           psha
af2d: 37           pshb
af2e: 30           tsx
af2f: 7c 04 12     inc (0x0412)
af32: 5e           ?
af33: 30           tsx
af34: 37           pshb
af35: 33           pulb
af36: 30           tsx
af37: 7e 33 04     jmp (0x3304)
af3a: 02           idiv
af3b: 5e           ?
af3c: 30           tsx
af3d: 37           pshb
af3e: 34           des
af3f: 30           tsx
af40: 54           lsrb
af41: 6f 74        clr (X+0x74)
af43: 61           ?
af44: 6c 20        inc (X+0x20)
af46: 23 20        bls [0xAF68]
af48: 66 61        ror (X+0x61)
af4a: 69 6c        rol (X+0x6C)
af4c: 65           ?
af4d: 64 20        lsr (X+0x20)
af4f: 70 73 77     neg (0x7377)
af52: 64 20        lsr (X+0x20)
af54: 61           ?
af55: 74 74 65     lsr (0x7465)
af58: 6d 70        tst (X+0x70)
af5a: 74 73 3a     lsr (0x733A)
af5d: 5e           ?
af5e: 30           tsx
af5f: 38           pulx
af60: 30           tsx
af61: 31           ins
af62: 43           coma
af63: 75           ?
af64: 72           ?
af65: 72           ?
af66: 65           ?
af67: 6e 74        jmp (X+0x74)
af69: 20 4c        bra [0xAFB7]
af6b: 69 76        rol (X+0x76)
af6d: 65           ?
af6e: 20 54        bra [0xAFC4]
af70: 61           ?
af71: 70 65 20     neg (0x6520)
af74: 23 3a        bls [0xAFB0]
af76: 5e           ?
af77: 30           tsx
af78: 37           pshb
af79: 37           pshb
af7a: 30           tsx
af7b: 7c 04 14     inc (0x0414)
af7e: 5e           ?
af7f: 30           tsx
af80: 38           pulx
af81: 33           pulb
af82: 30           tsx
af83: 7e 33 04     jmp (0x3304)
af86: 05           asld
af87: 5e           ?
af88: 30           tsx
af89: 38           pulx
af8a: 34           des
af8b: 30           tsx
af8c: 54           lsrb
af8d: 6f 74        clr (X+0x74)
af8f: 61           ?
af90: 6c 20        inc (X+0x20)
af92: 23 20        bls [0xAFB4]
af94: 73 75 63     com (0x7563)
af97: 63 65        com (X+0x65)
af99: 73 73 66     com (0x7366)
af9c: 75           ?
af9d: 6c 20        inc (X+0x20)
af9f: 70 73 77     neg (0x7377)
afa2: 64 3a        lsr (X+0x3A)
afa4: 5e           ?
afa5: 30           tsx
afa6: 39           rts
afa7: 30           tsx
afa8: 31           ins
afa9: 43           coma
afaa: 75           ?
afab: 72           ?
afac: 72           ?
afad: 65           ?
afae: 6e 74        jmp (X+0x74)
afb0: 20 56        bra [0xB008]
afb2: 65           ?
afb3: 72           ?
afb4: 73 69 6f     com (0x696F)
afb7: 6e 20        jmp (X+0x20)
afb9: 23 3a        bls [0xAFF5]
afbb: 5e           ?
afbc: 30           tsx
afbd: 38           pulx
afbe: 37           pshb
afbf: 30           tsx
afc0: 7c 04 16     inc (0x0416)
afc3: 5e           ?
afc4: 30           tsx
afc5: 39           rts
afc6: 33           pulb
afc7: 30           tsx
afc8: 40           nega
afc9: 04           lsrd
afca: 00           test
afcb: 5e           ?
afcc: 30           tsx
afcd: 39           rts
afce: 34           des
afcf: 30           tsx
afd0: 54           lsrb
afd1: 6f 74        clr (X+0x74)
afd3: 61           ?
afd4: 6c 20        inc (X+0x20)
afd6: 23 20        bls [0xAFF8]
afd8: 62           ?
afd9: 64 61        lsr (X+0x61)
afdb: 79 73 20     rol (0x7320)
afde: 70 6c 61     neg (0x6C61)
afe1: 79 65 64     rol (0x6564)
afe4: 3a           abx
afe5: 5e           ?
afe6: 31           ins
afe7: 30           tsx
afe8: 34           des
afe9: 30           tsx
afea: 54           lsrb
afeb: 6f 74        clr (X+0x74)
afed: 61           ?
afee: 6c 20        inc (X+0x20)
aff0: 23 20        bls [0xB012]
aff2: 56           rorb
aff3: 43           coma
aff4: 52           ?
aff5: 20 61        bra [0xB058]
aff7: 64 6a        lsr (X+0x6A)
aff9: 75           ?
affa: 73 74 73     com (0x7473)
affd: 3a           abx
affe: 5e           ?
afff: 30           tsx
b000: 39           rts
b001: 37           pshb
b002: 30           tsx
b003: 7c 04 18     inc (0x0418)
b006: 5e           ?
b007: 31           ins
b008: 30           tsx
b009: 37           pshb
b00a: 30           tsx
b00b: 7c 04 1a     inc (0x041A)
b00e: 5e           ?
b00f: 31           ins
b010: 31           ins
b011: 34           des
b012: 30           tsx
b013: 54           lsrb
b014: 6f 74        clr (X+0x74)
b016: 61           ?
b017: 6c 20        inc (X+0x20)
b019: 23 20        bls [0xB03B]
b01b: 72           ?
b01c: 65           ?
b01d: 6d 6f        tst (X+0x6F)
b01f: 74 65 20     lsr (0x6520)
b022: 61           ?
b023: 63 63        com (X+0x63)
b025: 65           ?
b026: 73 73 65     com (0x7365)
b029: 73 3a 5e     com (0x3A5E)
b02c: 31           ins
b02d: 32           pula
b02e: 34           des
b02f: 30           tsx
b030: 54           lsrb
b031: 6f 74        clr (X+0x74)
b033: 61           ?
b034: 6c 20        inc (X+0x20)
b036: 23 20        bls [0xB058]
b038: 61           ?
b039: 63 63        com (X+0x63)
b03b: 65           ?
b03c: 73 73 20     com (0x7320)
b03f: 61           ?
b040: 74 74 65     lsr (0x7465)
b043: 6d 70        tst (X+0x70)
b045: 74 73 3a     lsr (0x733A)
b048: 5e           ?
b049: 31           ins
b04a: 31           ins
b04b: 37           pshb
b04c: 30           tsx
b04d: 7c 04 1c     inc (0x041C)
b050: 5e           ?
b051: 31           ins
b052: 32           pula
b053: 37           pshb
b054: 30           tsx
b055: 7c 04 1e     inc (0x041E)
b058: 5e           ?
b059: 31           ins
b05a: 33           pulb
b05b: 34           des
b05c: 30           tsx
b05d: 54           lsrb
b05e: 6f 74        clr (X+0x74)
b060: 61           ?
b061: 6c 20        inc (X+0x20)
b063: 23 20        bls [0xB085]
b065: 72           ?
b066: 65           ?
b067: 6a 65        dec (X+0x65)
b069: 63 74        com (X+0x74)
b06b: 65           ?
b06c: 64 20        lsr (X+0x20)
b06e: 73 68 6f     com (0x686F)
b071: 77 74 61     asr (0x7461)
b074: 70 65 73     neg (0x6573)
b077: 3a           abx
b078: 5e           ?
b079: 31           ins
b07a: 34           des
b07b: 34           des
b07c: 30           tsx
b07d: 54           lsrb
b07e: 6f 74        clr (X+0x74)
b080: 61           ?
b081: 6c 20        inc (X+0x20)
b083: 23 20        bls [0xB0A5]
b085: 53           comb
b086: 68 6f        asl (X+0x6F)
b088: 72           ?
b089: 74 20 62     lsr (0x2062)
b08c: 64 61        lsr (X+0x61)
b08e: 79 73 3a     rol (0x733A)
b091: 5e           ?
b092: 31           ins
b093: 33           pulb
b094: 37           pshb
b095: 30           tsx
b096: 7c 04 20     inc (0x0420)
b099: 5e           ?
b09a: 31           ins
b09b: 34           des
b09c: 37           pshb
b09d: 30           tsx
b09e: 7c 04 22     inc (0x0422)
b0a1: 5e           ?
b0a2: 31           ins
b0a3: 35           txs
b0a4: 34           des
b0a5: 30           tsx
b0a6: 54           lsrb
b0a7: 6f 74        clr (X+0x74)
b0a9: 61           ?
b0aa: 6c 20        inc (X+0x20)
b0ac: 23 20        bls [0xB0CE]
b0ae: 52           ?
b0af: 65           ?
b0b0: 67 20        asr (X+0x20)
b0b2: 62           ?
b0b3: 64 61        lsr (X+0x61)
b0b5: 79 73 3a     rol (0x733A)
b0b8: 5e           ?
b0b9: 31           ins
b0ba: 36           psha
b0bb: 34           des
b0bc: 30           tsx
b0bd: 54           lsrb
b0be: 6f 74        clr (X+0x74)
b0c0: 61           ?
b0c1: 6c 20        inc (X+0x20)
b0c3: 23 20        bls [0xB0E5]
b0c5: 72           ?
b0c6: 65           ?
b0c7: 73 65 74     com (0x6574)
b0ca: 73 2d 70     com (0x2D70)
b0cd: 77 72 20     asr (0x7220)
b0d0: 75           ?
b0d1: 70 73 3a     neg (0x733A)
b0d4: 5e           ?
b0d5: 31           ins
b0d6: 35           txs
b0d7: 37           pshb
b0d8: 30           tsx
b0d9: 7c 04 24     inc (0x0424)
b0dc: 5e           ?
b0dd: 31           ins
b0de: 36           psha
b0df: 37           pshb
b0e0: 30           tsx
b0e1: 7c 04 26     inc (0x0426)
b0e4: 5e           ?
b0e5: 31           ins
b0e6: 38           pulx
b0e7: 30           tsx
b0e8: 31           ins
b0e9: 46           rora
b0ea: 55           ?
b0eb: 4e           ?
b0ec: 43           coma
b0ed: 54           lsrb
b0ee: 49           rola
b0ef: 4f           clra
b0f0: 4e           ?
b0f1: 53           comb
b0f2: 5e           ?
b0f3: 31           ins
b0f4: 38           pulx
b0f5: 32           pula
b0f6: 33           pulb
b0f7: 53           comb
b0f8: 65           ?
b0f9: 6c 65        inc (X+0x65)
b0fb: 63 74        com (X+0x74)
b0fd: 20 46        bra [0xB145]
b0ff: 75           ?
b100: 6e 63        jmp (X+0x63)
b102: 74 69 6f     lsr (0x696F)
b105: 6e 3a        jmp (X+0x3A)
b107: 5e           ?
b108: 32           pula
b109: 30           tsx
b10a: 30           tsx
b10b: 31           ins
b10c: 31           ins
b10d: 2e 43        bgt [0xB152]
b10f: 6c 65        inc (X+0x65)
b111: 61           ?
b112: 72           ?
b113: 20 72        bra [0xB187]
b115: 6e 64        jmp (X+0x64)
b117: 20 65        bra [0xB17E]
b119: 6e 61        jmp (X+0x61)
b11b: 62           ?
b11c: 6c 65        inc (X+0x65)
b11e: 73 5e 32     com (0x5E32)
b121: 30           tsx
b122: 32           pula
b123: 38           pulx
b124: 20 36        bra [0xB15C]
b126: 2e 53        bgt [0xB17B]
b128: 65           ?
b129: 74 20 6c     lsr (0x206C)
b12c: 6f 63        clr (X+0x63)
b12e: 20 6e        bra [0xB19E]
b130: 61           ?
b131: 6d 65        tst (X+0x65)
b133: 2d 23        blt [0xB158]
b135: 5e           ?
b136: 32           pula
b137: 30           tsx
b138: 35           txs
b139: 34           des
b13a: 31           ins
b13b: 31           ins
b13c: 2e 44        bgt [0xB182]
b13e: 69 61        rol (X+0x61)
b140: 67 6e        asr (X+0x6E)
b142: 6f 73        clr (X+0x73)
b144: 74 69 63     lsr (0x6963)
b147: 73 5e 32     com (0x5E32)
b14a: 31           ins
b14b: 30           tsx
b14c: 31           ins
b14d: 32           pula
b14e: 2e 53        bgt [0xB1A3]
b150: 65           ?
b151: 74 20 72     lsr (0x2072)
b154: 6e 64        jmp (X+0x64)
b156: 20 65        bra [0xB1BD]
b158: 6e 61        jmp (X+0x61)
b15a: 62           ?
b15b: 6c 65        inc (X+0x65)
b15d: 73 5e 32     com (0x5E32)
b160: 31           ins
b161: 32           pula
b162: 38           pulx
b163: 20 37        bra [0xB19C]
b165: 2e 53        bgt [0xB1BA]
b167: 65           ?
b168: 74 20 54     lsr (0x2054)
b16b: 69 6d        rol (X+0x6D)
b16d: 65           ?
b16e: 5e           ?
b16f: 32           pula
b170: 31           ins
b171: 35           txs
b172: 34           des
b173: 31           ins
b174: 32           pula
b175: 2e 5e        bgt [0xB1D5]
b177: 32           pula
b178: 32           pula
b179: 30           tsx
b17a: 31           ins
b17b: 33           pulb
b17c: 2e 53        bgt [0xB1D1]
b17e: 65           ?
b17f: 74 20 72     lsr (0x2072)
b182: 65           ?
b183: 67 20        asr (X+0x20)
b185: 74 61 70     lsr (0x6170)
b188: 65           ?
b189: 20 23        bra [0xB1AE]
b18b: 5e           ?
b18c: 32           pula
b18d: 32           pula
b18e: 32           pula
b18f: 38           pulx
b190: 20 38        bra [0xB1CA]
b192: 2e 44        bgt [0xB1D8]
b194: 69 73        rol (X+0x73)
b196: 62           ?
b197: 6c 2d        inc (X+0x2D)
b199: 65           ?
b19a: 6e 62        jmp (X+0x62)
b19c: 6c 20        inc (X+0x20)
b19e: 73 68 6f     com (0x686F)
b1a1: 77 5e 32     asr (0x5E32)
b1a4: 32           pula
b1a5: 35           txs
b1a6: 34           des
b1a7: 31           ins
b1a8: 33           pulb
b1a9: 2e 5e        bgt [0xB209]
b1ab: 32           pula
b1ac: 33           pulb
b1ad: 30           tsx
b1ae: 31           ins
b1af: 34           des
b1b0: 2e 53        bgt [0xB205]
b1b2: 65           ?
b1b3: 74 20 6c     lsr (0x206C)
b1b6: 69 76        rol (X+0x76)
b1b8: 20 74        bra [0xB22E]
b1ba: 61           ?
b1bb: 70 65 20     neg (0x6520)
b1be: 23 5e        bls [0xB21E]
b1c0: 32           pula
b1c1: 33           pulb
b1c2: 32           pula
b1c3: 38           pulx
b1c4: 20 39        bra [0xB1FF]
b1c6: 2e 55        bgt [0xB21D]
b1c8: 70 6c 6f     neg (0x6C6F)
b1cb: 61           ?
b1cc: 64 20        lsr (X+0x20)
b1ce: 70 72 6f     neg (0x726F)
b1d1: 67 72        asr (X+0x72)
b1d3: 61           ?
b1d4: 6d 5e        tst (X+0x5E)
b1d6: 32           pula
b1d7: 33           pulb
b1d8: 35           txs
b1d9: 34           des
b1da: 31           ins
b1db: 34           des
b1dc: 2e 5e        bgt [0xB23C]
b1de: 32           pula
b1df: 34           des
b1e0: 30           tsx
b1e1: 31           ins
b1e2: 35           txs
b1e3: 2e 52        bgt [0xB237]
b1e5: 65           ?
b1e6: 73 65 74     com (0x6574)
b1e9: 20 68        bra [0xB253]
b1eb: 69 73        rol (X+0x73)
b1ed: 74 6f 72     lsr (0x6F72)
b1f0: 79 5e 32     rol (0x5E32)
b1f3: 34           des
b1f4: 32           pula
b1f5: 38           pulx
b1f6: 31           ins
b1f7: 30           tsx
b1f8: 2e 44        bgt [0xB23E]
b1fa: 65           ?
b1fb: 62           ?
b1fc: 75           ?
b1fd: 67 67        asr (X+0x67)
b1ff: 65           ?
b200: 72           ?
b201: 5e           ?
b202: 32           pula
b203: 34           des
b204: 35           txs
b205: 34           des
b206: 31           ins
b207: 35           txs
b208: 2e 5e        bgt [0xB268]
b20a: 31           ins
b20b: 38           pulx
b20c: 34           des
b20d: 30           tsx
b20e: 00           test
b20f: ce b2 15     ldx 0xB215
b212: 7e 8a 2a     jmp (0x8A2A)
b215: 1b           aba
b216: 5b           ?
b217: 32           pula
b218: 4a           deca
b219: 00           test
b21a: ce 05 a0     ldx 0x05A0
b21d: cc 00 00     ldd 0x0000
b220: fd 02 9e     std (0x029E)
b223: fc 02 9e     ldd (0x029E)
b226: c3 00 01     addd 0x0001
b229: fd 02 9e     std (0x029E)
b22c: 1a 83 0f a0  cpd 0x0FA0
b230: 24 28        bcc [0xB25A]
b232: bd b2 60     jsr (0xB260)
b235: 25 04        bcs [0xB23B]
b237: 3f           swi
b238: 20 e9        bra [0xB223]
b23a: 39           rts
b23b: a7 00        staa (X+0x00)
b23d: 08           inx
b23e: 81 0d        cmpa 0x0D
b240: 26 02        bne [0xB244]
b242: 20 18        bra [0xB25C]
b244: 81 1b        cmpa 0x1B
b246: 26 02        bne [0xB24A]
b248: 20 10        bra [0xB25A]
b24a: 7d 00 b3     tst (0x00B3)
b24d: 27 03        beq [0xB252]
b24f: bd 8b 4b     jsr (0x8B4B)
b252: cc 00 00     ldd 0x0000
b255: fd 02 9e     std (0x029E)
b258: 20 c9        bra [0xB223]
b25a: 0d           sec
b25b: 39           rts
b25c: 6f 00        clr (X+0x00)
b25e: 0c           clc
b25f: 39           rts
b260: b6 18 0d     ldaa (0x180D)
b263: 44           lsra
b264: 25 0b        bcs [0xB271]
b266: 4f           clra
b267: b7 18 0d     staa (0x180D)
b26a: 86 30        ldaa 0x30
b26c: b7 18 0d     staa (0x180D)
b26f: 0c           clc
b270: 39           rts
b271: 86 01        ldaa 0x01
b273: b7 18 0d     staa (0x180D)
b276: 86 70        ldaa 0x70
b278: b5 18 0d     bita (0x180D)
b27b: 26 05        bne [0xB282]
b27d: 0d           sec
b27e: b6 18 0f     ldaa (0x180F)
b281: 39           rts
b282: b6 18 0f     ldaa (0x180F)
b285: 86 30        ldaa 0x30
b287: b7 18 0c     staa (0x180C)
b28a: 0c           clc
b28b: 39           rts
b28c: 38           pulx
b28d: 18 ce 05 a0  ldy 0x05A0
b291: a6 00        ldaa (X+0x00)
b293: 27 11        beq [0xB2A6]
b295: 08           inx
b296: 18 a1 00     cmpa (Y+0x00)
b299: 26 04        bne [0xB29F]
b29b: 18 08        iny
b29d: 20 f2        bra [0xB291]
b29f: a6 00        ldaa (X+0x00)
b2a1: 27 07        beq [0xB2AA]
b2a3: 08           inx
b2a4: 20 f9        bra [0xB29F]
b2a6: 08           inx
b2a7: 3c           pshx
b2a8: 0c           clc
b2a9: 39           rts
b2aa: 08           inx
b2ab: 3c           pshx
b2ac: 0d           sec
b2ad: 39           rts
b2ae: ce 05 a0     ldx 0x05A0
b2b1: a6 00        ldaa (X+0x00)
b2b3: 08           inx
b2b4: 81 0d        cmpa 0x0D
b2b6: 26 f9        bne [0xB2B1]
b2b8: 09           dex
b2b9: 09           dex
b2ba: a6 00        ldaa (X+0x00)
b2bc: 09           dex
b2bd: 80 30        suba 0x30
b2bf: 97 b2        staa (0x00B2)
b2c1: 8c 05 9f     cpx 0x059F
b2c4: 27 0b        beq [0xB2D1]
b2c6: a6 00        ldaa (X+0x00)
b2c8: 09           dex
b2c9: 80 30        suba 0x30
b2cb: c6 0a        ldab 0x0A
b2cd: 3d           mul
b2ce: 17           tba
b2cf: 9b b2        adda (0x00B2)
b2d1: 39           rts
b2d2: 59           rolb
b2d3: 6f 75        clr (X+0x75)
b2d5: 20 68        bra [0xB33F]
b2d7: 61           ?
b2d8: 76 65 20     ror (0x6520)
b2db: 73 65 6c     com (0x656C)
b2de: 65           ?
b2df: 63 74        com (X+0x74)
b2e1: 65           ?
b2e2: 64 20        lsr (X+0x20)
b2e4: 23 31        bls [0xB317]
b2e6: 00           test
b2e7: 59           rolb
b2e8: 6f 75        clr (X+0x75)
b2ea: 20 68        bra [0xB354]
b2ec: 61           ?
b2ed: 76 65 20     ror (0x6520)
b2f0: 73 65 6c     com (0x656C)
b2f3: 65           ?
b2f4: 63 74        com (X+0x74)
b2f6: 65           ?
b2f7: 64 20        lsr (X+0x20)
b2f9: 23 31        bls [0xB32C]
b2fb: 31           ins
b2fc: 00           test
b2fd: ce b3 04     ldx 0xB304
b300: bd 8a 2a     jsr (0x8A2A)
b303: 39           rts
b304: 5e           ?
b305: 32           pula
b306: 30           tsx
b307: 30           tsx
b308: 31           ins
b309: 25 5e        bcs [0xB369]
b30b: 32           pula
b30c: 31           ins
b30d: 30           tsx
b30e: 31           ins
b30f: 25 5e        bcs [0xB36F]
b311: 32           pula
b312: 32           pula
b313: 30           tsx
b314: 31           ins
b315: 25 5e        bcs [0xB375]
b317: 32           pula
b318: 33           pulb
b319: 30           tsx
b31a: 31           ins
b31b: 25 5e        bcs [0xB37B]
b31d: 32           pula
b31e: 34           des
b31f: 30           tsx
b320: 31           ins
b321: 25 5e        bcs [0xB381]
b323: 32           pula
b324: 30           tsx
b325: 30           tsx
b326: 31           ins
b327: 00           test
b328: fa 20 fa     orab (0x20FA)
b32b: 20 f6        bra [0xB323]
b32d: 22 f5        bhi [0xB324]
b32f: 20 f5        bra [0xB326]
b331: 20 f3        bra [0xB326]
b333: 22 f2        bhi [0xB327]
b335: 20 e5        bra [0xB31C]
b337: 22 e5        bhi [0xB31E]
b339: 22 e2        bhi [0xB31D]
b33b: 20 d2        bra [0xB30F]
b33d: 20 be        bra [0xB2FD]
b33f: 00           test
b340: bc 22 bb     cpx (0x22BB)
b343: 30           tsx
b344: b9 32 b9     adca (0x32B9)
b347: 32           pula
b348: b7 30 b6     staa (0x30B6)
b34b: 32           pula
b34c: b5 30 b4     bita (0x30B4)
b34f: 32           pula
b350: b4 32 b3     anda (0x32B3)
b353: 20 b3        bra [0xB308]
b355: 20 b1        bra [0xB308]
b357: a0 b1        suba (X+0xB1)
b359: a0 b0        suba (X+0xB0)
b35b: a2 af        sbca (X+0xAF)
b35d: a0 af        suba (X+0xAF)
b35f: a6 ae        ldaa (X+0xAE)
b361: a0 ae        suba (X+0xAE)
b363: a6 ad        ldaa (X+0xAD)
b365: a4 ac        anda (X+0xAC)
b367: a0 ac        suba (X+0xAC)
b369: a0 ab        suba (X+0xAB)
b36b: a0 aa        suba (X+0xAA)
b36d: a0 aa        suba (X+0xAA)
b36f: a0 a2        suba (X+0xA2)
b371: 80 a0        suba 0xA0
b373: a0 a0        suba (X+0xA0)
b375: a0 8d        suba (X+0x8D)
b377: 80 8a        suba 0x8A
b379: a0 7e        suba (X+0x7E)
b37b: 80 7b        suba 0x7B
b37d: a0 79        suba (X+0x79)
b37f: a4 78        anda (X+0x78)
b381: a0 77        suba (X+0x77)
b383: a4 76        anda (X+0x76)
b385: a0 75        suba (X+0x75)
b387: a4 74        anda (X+0x74)
b389: a0 73        suba (X+0x73)
b38b: a4 72        anda (X+0x72)
b38d: a0 71        suba (X+0x71)
b38f: a4 70        anda (X+0x70)
b391: a0 6f        suba (X+0x6F)
b393: a4 6e        anda (X+0x6E)
b395: a0 6d        suba (X+0x6D)
b397: a4 6c        anda (X+0x6C)
b399: a0 69        suba (X+0x69)
b39b: 80 69        suba 0x69
b39d: 80 67        suba 0x67
b39f: a0 5e        suba (X+0x5E)
b3a1: 20 58        bra [0xB3FB]
b3a3: 24 57        bcc [0xB3FC]
b3a5: 20 57        bra [0xB3FE]
b3a7: 20 56        bra [0xB3FF]
b3a9: 24 55        bcc [0xB400]
b3ab: 20 54        bra [0xB401]
b3ad: 24 54        bcc [0xB403]
b3af: 24 53        bcc [0xB404]
b3b1: 20 52        bra [0xB405]
b3b3: 24 52        bcc [0xB407]
b3b5: 24 50        bcc [0xB407]
b3b7: 20 4f        bra [0xB408]
b3b9: 24 4e        bcc [0xB409]
b3bb: 20 4d        bra [0xB40A]
b3bd: 24 4c        bcc [0xB40B]
b3bf: 20 4c        bra [0xB40D]
b3c1: 20 4b        bra [0xB40E]
b3c3: 24 4a        bcc [0xB40F]
b3c5: 20 49        bra [0xB410]
b3c7: 20 49        bra [0xB412]
b3c9: 00           test
b3ca: 48           asla
b3cb: 20 47        bra [0xB414]
b3cd: 20 47        bra [0xB416]
b3cf: 20 46        bra [0xB417]
b3d1: 20 45        bra [0xB418]
b3d3: 24 45        bcc [0xB41A]
b3d5: 24 44        bcc [0xB41B]
b3d7: 20 42        bra [0xB41B]
b3d9: 20 42        bra [0xB41D]
b3db: 20 37        bra [0xB414]
b3dd: 04           lsrd
b3de: 35           txs
b3df: 20 2e        bra [0xB40F]
b3e1: 04           lsrd
b3e2: 2e 04        bgt [0xB3E8]
b3e4: 2d 20        blt [0xB406]
b3e6: 23 24        bls [0xB40C]
b3e8: 21 20        brn [0xB40A]
b3ea: 17           tba
b3eb: 24 13        bcc [0xB400]
b3ed: 00           test
b3ee: 11           cba
b3ef: 24 10        bcc [0xB401]
b3f1: 30           tsx
b3f2: 07           tpa
b3f3: 34           des
b3f4: 06           tap
b3f5: 30           tsx
b3f6: 05           asld
b3f7: 30           tsx
b3f8: ff ff d7     stx (0xFFD7)
b3fb: 22 d5        bhi [0xB3D2]
b3fd: 20 c9        bra [0xB3C8]
b3ff: 22 c7        bhi [0xB3C8]
b401: 20 c4        bra [0xB3C7]
b403: 24 c3        bcc [0xB3C8]
b405: 20 c2        bra [0xB3C9]
b407: 24 c1        bcc [0xB3CA]
b409: 20 bf        bra [0xB3CA]
b40b: 24 bf        bcc [0xB3CC]
b40d: 24 be        bcc [0xB3CD]
b40f: 20 bd        bra [0xB3CE]
b411: 24 bc        bcc [0xB3CF]
b413: 20 bb        bra [0xB3D0]
b415: 24 ba        bcc [0xB3D1]
b417: 20 b9        bra [0xB3D2]
b419: 20 b8        bra [0xB3D3]
b41b: 24 b7        bcc [0xB3D4]
b41d: 20 b4        bra [0xB3D3]
b41f: 00           test
b420: b4 00 b2     anda (0x00B2)
b423: 20 a9        bra [0xB3CE]
b425: 20 a3        bra [0xB3CA]
b427: 20 a2        bra [0xB3CB]
b429: 20 a1        bra [0xB3CC]
b42b: 20 a0        bra [0xB3CD]
b42d: 20 a0        bra [0xB3CF]
b42f: 20 9f        bra [0xB3D0]
b431: 20 9f        bra [0xB3D2]
b433: 20 9e        bra [0xB3D3]
b435: 20 9d        bra [0xB3D4]
b437: 24 9d        bcc [0xB3D6]
b439: 24 9b        bcc [0xB3D6]
b43b: 20 9a        bra [0xB3D7]
b43d: 24 99        bcc [0xB3D8]
b43f: 20 98        bra [0xB3D9]
b441: 20 97        bra [0xB3DA]
b443: 24 97        bcc [0xB3DC]
b445: 24 95        bcc [0xB3DC]
b447: 20 95        bra [0xB3DE]
b449: 20 94        bra [0xB3DF]
b44b: 00           test
b44c: 94 00        anda (0x0000)
b44e: 93 20        subd (0x0020)
b450: 92 00        sbca (0x0000)
b452: 92 00        sbca (0x0000)
b454: 91 20        cmpa (0x0020)
b456: 90 20        suba (0x0020)
b458: 90 20        suba (0x0020)
b45a: 8f           xgdx
b45b: 20 8d        bra [0xB3EA]
b45d: 20 8d        bra [0xB3EC]
b45f: 20 81        bra [0xB3E2]
b461: 00           test
b462: 7f 20 79     clr (0x2079)
b465: 00           test
b466: 79 00 78     rol (0x0078)
b469: 20 76        bra [0xB4E1]
b46b: 20 6b        bra [0xB4D8]
b46d: 00           test
b46e: 69 20        rol (X+0x20)
b470: 5e           ?
b471: 00           test
b472: 5c           incb
b473: 20 5b        bra [0xB4D0]
b475: 30           tsx
b476: 52           ?
b477: 10           sba
b478: 51           ?
b479: 30           tsx
b47a: 50           negb
b47b: 30           tsx
b47c: 50           negb
b47d: 30           tsx
b47e: 4f           clra
b47f: 20 4e        bra [0xB4CF]
b481: 20 4e        bra [0xB4D1]
b483: 20 4d        bra [0xB4D2]
b485: 20 46        bra [0xB4CD]
b487: a0 45        suba (X+0x45)
b489: a0 3d        suba (X+0x3D)
b48b: a0 3d        suba (X+0x3D)
b48d: a0 39        suba (X+0x39)
b48f: 20 2a        bra [0xB4BB]
b491: 00           test
b492: 28 20        bvc [0xB4B4]
b494: 1e 00 1c 22  brset (X+0x00), 0x1C, [0xB4BA]
b498: 1c 22 1b     bset (X+0x22), 0x1B
b49b: 20 1a        bra [0xB4B7]
b49d: 22 19        bhi [0xB4B8]
b49f: 20 18        bra [0xB4B9]
b4a1: 22 18        bhi [0xB4BB]
b4a3: 22 16        bhi [0xB4BB]
b4a5: 20 15        bra [0xB4BC]
b4a7: 22 15        bhi [0xB4BE]
b4a9: 22 14        bhi [0xB4BF]
b4ab: a0 13        suba (X+0x13)
b4ad: a2 11        sbca (X+0x11)
b4af: a0 ff        suba (X+0xFF)
b4b1: ff be 00     stx (0xBE00)
b4b4: bc 22 bb     cpx (0x22BB)
b4b7: 30           tsx
b4b8: b9 32 b9     adca (0x32B9)
b4bb: 32           pula
b4bc: b7 30 b6     staa (0x30B6)
b4bf: 32           pula
b4c0: b5 30 b4     bita (0x30B4)
b4c3: 32           pula
b4c4: b4 32 b3     anda (0x32B3)
b4c7: 20 b3        bra [0xB47C]
b4c9: 20 b1        bra [0xB47C]
b4cb: a0 b1        suba (X+0xB1)
b4cd: a0 b0        suba (X+0xB0)
b4cf: a2 af        sbca (X+0xAF)
b4d1: a0 af        suba (X+0xAF)
b4d3: a6 ae        ldaa (X+0xAE)
b4d5: a0 ae        suba (X+0xAE)
b4d7: a6 ad        ldaa (X+0xAD)
b4d9: a4 ac        anda (X+0xAC)
b4db: a0 ac        suba (X+0xAC)
b4dd: a0 ab        suba (X+0xAB)
b4df: a0 aa        suba (X+0xAA)
b4e1: a0 aa        suba (X+0xAA)
b4e3: a0 a2        suba (X+0xA2)
b4e5: 80 a0        suba 0xA0
b4e7: a0 a0        suba (X+0xA0)
b4e9: a0 8d        suba (X+0x8D)
b4eb: 80 8a        suba 0x8A
b4ed: a0 7e        suba (X+0x7E)
b4ef: 80 7b        suba 0x7B
b4f1: a0 79        suba (X+0x79)
b4f3: a4 78        anda (X+0x78)
b4f5: a0 77        suba (X+0x77)
b4f7: a4 76        anda (X+0x76)
b4f9: a0 75        suba (X+0x75)
b4fb: a4 74        anda (X+0x74)
b4fd: a0 73        suba (X+0x73)
b4ff: a4 72        anda (X+0x72)
b501: a0 71        suba (X+0x71)
b503: a4 70        anda (X+0x70)
b505: a0 6f        suba (X+0x6F)
b507: a4 6e        anda (X+0x6E)
b509: a0 6d        suba (X+0x6D)
b50b: a4 6c        anda (X+0x6C)
b50d: a0 69        suba (X+0x69)
b50f: 80 69        suba 0x69
b511: 80 67        suba 0x67
b513: a0 5e        suba (X+0x5E)
b515: 20 58        bra [0xB56F]
b517: 24 57        bcc [0xB570]
b519: 20 57        bra [0xB572]
b51b: 20 56        bra [0xB573]
b51d: 24 55        bcc [0xB574]
b51f: 20 54        bra [0xB575]
b521: 24 54        bcc [0xB577]
b523: 24 53        bcc [0xB578]
b525: 20 52        bra [0xB579]
b527: 24 52        bcc [0xB57B]
b529: 24 50        bcc [0xB57B]
b52b: 20 4f        bra [0xB57C]
b52d: 24 4e        bcc [0xB57D]
b52f: 20 4d        bra [0xB57E]
b531: 24 4c        bcc [0xB57F]
b533: 20 4c        bra [0xB581]
b535: 20 4b        bra [0xB582]
b537: 24 4a        bcc [0xB583]
b539: 20 49        bra [0xB584]
b53b: 20 49        bra [0xB586]
b53d: 00           test
b53e: 48           asla
b53f: 20 47        bra [0xB588]
b541: 20 47        bra [0xB58A]
b543: 20 46        bra [0xB58B]
b545: 20 45        bra [0xB58C]
b547: 24 45        bcc [0xB58E]
b549: 24 44        bcc [0xB58F]
b54b: 20 42        bra [0xB58F]
b54d: 20 42        bra [0xB591]
b54f: 20 37        bra [0xB588]
b551: 04           lsrd
b552: 35           txs
b553: 20 2e        bra [0xB583]
b555: 04           lsrd
b556: 2e 04        bgt [0xB55C]
b558: 2d 20        blt [0xB57A]
b55a: 23 24        bls [0xB580]
b55c: 21 20        brn [0xB57E]
b55e: 17           tba
b55f: 24 13        bcc [0xB574]
b561: 00           test
b562: 11           cba
b563: 24 10        bcc [0xB575]
b565: 30           tsx
b566: 07           tpa
b567: 34           des
b568: 06           tap
b569: 30           tsx
b56a: 05           asld
b56b: 30           tsx
b56c: ff ff cd     stx (0xFFCD)
b56f: 20 cc        bra [0xB53D]
b571: 20 cb        bra [0xB53E]
b573: 20 cb        bra [0xB540]
b575: 20 ca        bra [0xB541]
b577: 00           test
b578: c9 20        adcb 0x20
b57a: c9 20        adcb 0x20
b57c: c8 20        eorb 0x20
b57e: c1 a0        cmpb 0xA0
b580: c0 a0        subb 0xA0
b582: b8 a0 b8     eora (0xA0B8)
b585: 20 b4        bra [0xB53B]
b587: 20 a6        bra [0xB52F]
b589: 00           test
b58a: a4 20        anda (X+0x20)
b58c: 99 00        adca (0x0000)
b58e: 97 22        staa (0x0022)
b590: 97 22        staa (0x0022)
b592: 96 20        ldaa (0x0020)
b594: 95 22        bita (0x0022)
b596: 94 20        anda (0x0020)
b598: 93 22        subd (0x0022)
b59a: 93 22        subd (0x0022)
b59c: 91 20        cmpa (0x0020)
b59e: 90 20        suba (0x0020)
b5a0: 90 20        suba (0x0020)
b5a2: 8d a0        bsr [0xB544]
b5a4: 8c a0 7d     cpx 0xA07D
b5a7: a2 7d        sbca (X+0x7D)
b5a9: a2 7b        sbca (X+0x7B)
b5ab: a0 7b        suba (X+0x7B)
b5ad: a0 79        suba (X+0x79)
b5af: a2 79        sbca (X+0x79)
b5b1: a2 77        sbca (X+0x77)
b5b3: a0 77        suba (X+0x77)
b5b5: a0 76        suba (X+0x76)
b5b7: 80 75        suba 0x75
b5b9: a0 6e        suba (X+0x6E)
b5bb: 20 67        bra [0xB624]
b5bd: 24 66        bcc [0xB625]
b5bf: 20 65        bra [0xB626]
b5c1: 24 64        bcc [0xB627]
b5c3: 20 63        bra [0xB628]
b5c5: 24 63        bcc [0xB62A]
b5c7: 24 61        bcc [0xB62A]
b5c9: 20 60        bra [0xB62B]
b5cb: 24 5f        bcc [0xB62C]
b5cd: 20 5e        bra [0xB62D]
b5cf: 20 5d        bra [0xB62E]
b5d1: 24 5c        bcc [0xB62F]
b5d3: 20 5b        bra [0xB630]
b5d5: 24 5a        bcc [0xB631]
b5d7: 20 59        bra [0xB632]
b5d9: 24 58        bcc [0xB633]
b5db: 20 56        bra [0xB633]
b5dd: 20 55        bra [0xB634]
b5df: 04           lsrd
b5e0: 54           lsrb
b5e1: 00           test
b5e2: 53           comb
b5e3: 24 52        bcc [0xB637]
b5e5: 20 52        bra [0xB639]
b5e7: 20 4f        bra [0xB638]
b5e9: 24 4f        bcc [0xB63A]
b5eb: 24 4e        bcc [0xB63B]
b5ed: 30           tsx
b5ee: 4d           tsta
b5ef: 30           tsx
b5f0: 47           asra
b5f1: 10           sba
b5f2: 45           ?
b5f3: 30           tsx
b5f4: 35           txs
b5f5: 30           tsx
b5f6: 33           pulb
b5f7: 10           sba
b5f8: 31           ins
b5f9: 30           tsx
b5fa: 31           ins
b5fb: 30           tsx
b5fc: 1d 20 ff     bclr (X+0x20), 0xFF
b5ff: ff a9 20     stx (0xA920)
b602: a3 20        subd (X+0x20)
b604: a2 20        sbca (X+0x20)
b606: a1 20        cmpa (X+0x20)
b608: a0 20        suba (X+0x20)
b60a: a0 20        suba (X+0x20)
b60c: 9f 20        sts (0x0020)
b60e: 9f 20        sts (0x0020)
b610: 9e 20        lds (0x0020)
b612: 9d 24        jsr (0x0024)
b614: 9d 24        jsr (0x0024)
b616: 9b 20        adda (0x0020)
b618: 9a 24        oraa (0x0024)
b61a: 99 20        adca (0x0020)
b61c: 98 20        eora (0x0020)
b61e: 97 24        staa (0x0024)
b620: 97 24        staa (0x0024)
b622: 95 20        bita (0x0020)
b624: 95 20        bita (0x0020)
b626: 94 00        anda (0x0000)
b628: 94 00        anda (0x0000)
b62a: 93 20        subd (0x0020)
b62c: 92 00        sbca (0x0000)
b62e: 92 00        sbca (0x0000)
b630: 91 20        cmpa (0x0020)
b632: 90 20        suba (0x0020)
b634: 90 20        suba (0x0020)
b636: 8f           xgdx
b637: 20 8d        bra [0xB5C6]
b639: 20 8d        bra [0xB5C8]
b63b: 20 81        bra [0xB5BE]
b63d: 00           test
b63e: 7f 20 79     clr (0x2079)
b641: 00           test
b642: 79 00 78     rol (0x0078)
b645: 20 76        bra [0xB6BD]
b647: 20 6b        bra [0xB6B4]
b649: 00           test
b64a: 69 20        rol (X+0x20)
b64c: 5e           ?
b64d: 00           test
b64e: 5c           incb
b64f: 20 5b        bra [0xB6AC]
b651: 30           tsx
b652: 52           ?
b653: 10           sba
b654: 51           ?
b655: 30           tsx
b656: 50           negb
b657: 30           tsx
b658: 50           negb
b659: 30           tsx
b65a: 4f           clra
b65b: 20 4e        bra [0xB6AB]
b65d: 20 4e        bra [0xB6AD]
b65f: 20 4d        bra [0xB6AE]
b661: 20 46        bra [0xB6A9]
b663: a0 45        suba (X+0x45)
b665: a0 3d        suba (X+0x3D)
b667: a0 3d        suba (X+0x3D)
b669: a0 39        suba (X+0x39)
b66b: 20 2a        bra [0xB697]
b66d: 00           test
b66e: 28 20        bvc [0xB690]
b670: 1e 00 1c 22  brset (X+0x00), 0x1C, [0xB696]
b674: 1c 22 1b     bset (X+0x22), 0x1B
b677: 20 1a        bra [0xB693]
b679: 22 19        bhi [0xB694]
b67b: 20 18        bra [0xB695]
b67d: 22 18        bhi [0xB697]
b67f: 22 16        bhi [0xB697]
b681: 20 15        bra [0xB698]
b683: 22 15        bhi [0xB69A]
b685: 22 14        bhi [0xB69B]
b687: a0 13        suba (X+0x13)
b689: a2 11        sbca (X+0x11)
b68b: a0 ff        suba (X+0xFF)
b68d: ff ff ff     stx (0xFFFF)
b690: ff ff ff     stx (0xFFFF)
b693: ff ff ff     stx (0xFFFF)
b696: ff ff ff     stx (0xFFFF)
b699: ff ff ff     stx (0xFFFF)
b69c: ff ff ff     stx (0xFFFF)
b69f: ff ff ff     stx (0xFFFF)
b6a2: ff ff ff     stx (0xFFFF)
b6a5: ff ff ff     stx (0xFFFF)
b6a8: ff ff ff     stx (0xFFFF)
b6ab: ff ff ff     stx (0xFFFF)
b6ae: ff ff ff     stx (0xFFFF)
b6b1: ff ff ff     stx (0xFFFF)
b6b4: ff ff ff     stx (0xFFFF)
b6b7: ff ff ff     stx (0xFFFF)
b6ba: ff ff ff     stx (0xFFFF)
b6bd: ff ff ff     stx (0xFFFF)
b6c0: ff ff ff     stx (0xFFFF)
b6c3: ff ff ff     stx (0xFFFF)
b6c6: ff ff ff     stx (0xFFFF)
b6c9: ff ff ff     stx (0xFFFF)
b6cc: ff ff ff     stx (0xFFFF)
b6cf: ff ff ff     stx (0xFFFF)
b6d2: ff ff ff     stx (0xFFFF)
b6d5: ff ff ff     stx (0xFFFF)
b6d8: ff ff ff     stx (0xFFFF)
b6db: ff ff ff     stx (0xFFFF)
b6de: ff ff ff     stx (0xFFFF)
b6e1: ff ff ff     stx (0xFFFF)
b6e4: ff ff ff     stx (0xFFFF)
b6e7: ff ff ff     stx (0xFFFF)
b6ea: ff ff ff     stx (0xFFFF)
b6ed: ff ff ff     stx (0xFFFF)
b6f0: ff ff ff     stx (0xFFFF)
b6f3: ff ff ff     stx (0xFFFF)
b6f6: ff ff ff     stx (0xFFFF)
b6f9: ff ff ff     stx (0xFFFF)
b6fc: ff ff ff     stx (0xFFFF)
b6ff: ff ff ff     stx (0xFFFF)
b702: ff ff ff     stx (0xFFFF)
b705: ff ff ff     stx (0xFFFF)
b708: ff ff ff     stx (0xFFFF)
b70b: ff ff ff     stx (0xFFFF)
b70e: ff ff ff     stx (0xFFFF)
b711: ff ff ff     stx (0xFFFF)
b714: ff ff ff     stx (0xFFFF)
b717: ff ff ff     stx (0xFFFF)
b71a: ff ff ff     stx (0xFFFF)
b71d: ff ff ff     stx (0xFFFF)
b720: ff ff ff     stx (0xFFFF)
b723: ff ff ff     stx (0xFFFF)
b726: ff ff ff     stx (0xFFFF)
b729: ff ff ff     stx (0xFFFF)
b72c: ff ff ff     stx (0xFFFF)
b72f: ff ff ff     stx (0xFFFF)
b732: ff ff ff     stx (0xFFFF)
b735: ff ff ff     stx (0xFFFF)
b738: ff ff ff     stx (0xFFFF)
b73b: ff ff ff     stx (0xFFFF)
b73e: ff ff ff     stx (0xFFFF)
b741: ff ff ff     stx (0xFFFF)
b744: ff ff ff     stx (0xFFFF)
b747: ff ff ff     stx (0xFFFF)
b74a: ff ff ff     stx (0xFFFF)
b74d: ff ff ff     stx (0xFFFF)
b750: ff ff ff     stx (0xFFFF)
b753: ff ff ff     stx (0xFFFF)
b756: ff ff ff     stx (0xFFFF)
b759: ff ff ff     stx (0xFFFF)
b75c: ff ff ff     stx (0xFFFF)
b75f: ff ff ff     stx (0xFFFF)
b762: ff ff ff     stx (0xFFFF)
b765: ff ff ff     stx (0xFFFF)
b768: ff ff ff     stx (0xFFFF)
b76b: ff ff ff     stx (0xFFFF)
b76e: ff ff ff     stx (0xFFFF)
b771: ff ff ff     stx (0xFFFF)
b774: ff ff ff     stx (0xFFFF)
b777: ff ff ff     stx (0xFFFF)
b77a: ff ff ff     stx (0xFFFF)
b77d: ff ff ff     stx (0xFFFF)
b780: ff ff ff     stx (0xFFFF)
b783: ff ff ff     stx (0xFFFF)
b786: ff ff ff     stx (0xFFFF)
b789: ff ff ff     stx (0xFFFF)
b78c: ff ff ff     stx (0xFFFF)
b78f: ff ff ff     stx (0xFFFF)
b792: ff ff ff     stx (0xFFFF)
b795: ff ff ff     stx (0xFFFF)
b798: ff ff ff     stx (0xFFFF)
b79b: ff ff ff     stx (0xFFFF)
b79e: ff ff ff     stx (0xFFFF)
b7a1: ff ff ff     stx (0xFFFF)
b7a4: ff ff ff     stx (0xFFFF)
b7a7: ff ff ff     stx (0xFFFF)
b7aa: ff ff ff     stx (0xFFFF)
b7ad: ff ff ff     stx (0xFFFF)
b7b0: ff ff ff     stx (0xFFFF)
b7b3: ff ff ff     stx (0xFFFF)
b7b6: ff ff ff     stx (0xFFFF)
b7b9: ff ff ff     stx (0xFFFF)
b7bc: ff ff ff     stx (0xFFFF)
b7bf: ff ff ff     stx (0xFFFF)
b7c2: ff ff ff     stx (0xFFFF)
b7c5: ff ff ff     stx (0xFFFF)
b7c8: ff ff ff     stx (0xFFFF)
b7cb: ff ff ff     stx (0xFFFF)
b7ce: ff ff ff     stx (0xFFFF)
b7d1: ff ff ff     stx (0xFFFF)
b7d4: ff ff ff     stx (0xFFFF)
b7d7: ff ff ff     stx (0xFFFF)
b7da: ff ff ff     stx (0xFFFF)
b7dd: ff ff ff     stx (0xFFFF)
b7e0: ff ff ff     stx (0xFFFF)
b7e3: ff ff ff     stx (0xFFFF)
b7e6: ff ff ff     stx (0xFFFF)
b7e9: ff ff ff     stx (0xFFFF)
b7ec: ff ff ff     stx (0xFFFF)
b7ef: ff ff ff     stx (0xFFFF)
b7f2: ff ff ff     stx (0xFFFF)
b7f5: ff ff ff     stx (0xFFFF)
b7f8: ff ff ff     stx (0xFFFF)
b7fb: ff ff ff     stx (0xFFFF)
b7fe: ff ff ff     stx (0xFFFF)
b801: ff ff ff     stx (0xFFFF)
b804: ff ff ff     stx (0xFFFF)
b807: ff ff ff     stx (0xFFFF)
b80a: ff ff ff     stx (0xFFFF)
b80d: ff ff ff     stx (0xFFFF)
b810: ff ff ff     stx (0xFFFF)
b813: ff ff ff     stx (0xFFFF)
b816: ff ff ff     stx (0xFFFF)
b819: ff ff ff     stx (0xFFFF)
b81c: ff ff ff     stx (0xFFFF)
b81f: ff ff ff     stx (0xFFFF)
b822: ff ff ff     stx (0xFFFF)
b825: ff ff ff     stx (0xFFFF)
b828: ff ff ff     stx (0xFFFF)
b82b: ff ff ff     stx (0xFFFF)
b82e: ff ff ff     stx (0xFFFF)
b831: ff ff ff     stx (0xFFFF)
b834: ff ff ff     stx (0xFFFF)
b837: ff ff ff     stx (0xFFFF)
b83a: ff ff ff     stx (0xFFFF)
b83d: ff ff ff     stx (0xFFFF)
b840: ff ff ff     stx (0xFFFF)
b843: ff ff ff     stx (0xFFFF)
b846: ff ff ff     stx (0xFFFF)
b849: ff ff ff     stx (0xFFFF)
b84c: ff ff ff     stx (0xFFFF)
b84f: ff ff ff     stx (0xFFFF)
b852: ff ff ff     stx (0xFFFF)
b855: ff ff ff     stx (0xFFFF)
b858: ff ff ff     stx (0xFFFF)
b85b: ff ff ff     stx (0xFFFF)
b85e: ff ff ff     stx (0xFFFF)
b861: ff ff ff     stx (0xFFFF)
b864: ff ff ff     stx (0xFFFF)
b867: ff ff ff     stx (0xFFFF)
b86a: ff ff ff     stx (0xFFFF)
b86d: ff ff ff     stx (0xFFFF)
b870: ff ff ff     stx (0xFFFF)
b873: ff ff ff     stx (0xFFFF)
b876: ff ff ff     stx (0xFFFF)
b879: ff ff ff     stx (0xFFFF)
b87c: ff ff ff     stx (0xFFFF)
b87f: ff ff ff     stx (0xFFFF)
b882: ff ff ff     stx (0xFFFF)
b885: ff ff ff     stx (0xFFFF)
b888: ff ff ff     stx (0xFFFF)
b88b: ff ff ff     stx (0xFFFF)
b88e: ff ff ff     stx (0xFFFF)
b891: ff ff ff     stx (0xFFFF)
b894: ff ff ff     stx (0xFFFF)
b897: ff ff ff     stx (0xFFFF)
b89a: ff ff ff     stx (0xFFFF)
b89d: ff ff ff     stx (0xFFFF)
b8a0: ff ff ff     stx (0xFFFF)
b8a3: ff ff ff     stx (0xFFFF)
b8a6: ff ff ff     stx (0xFFFF)
b8a9: ff ff ff     stx (0xFFFF)
b8ac: ff ff ff     stx (0xFFFF)
b8af: ff ff ff     stx (0xFFFF)
b8b2: ff ff ff     stx (0xFFFF)
b8b5: ff ff ff     stx (0xFFFF)
b8b8: ff ff ff     stx (0xFFFF)
b8bb: ff ff ff     stx (0xFFFF)
b8be: ff ff ff     stx (0xFFFF)
b8c1: ff ff ff     stx (0xFFFF)
b8c4: ff ff ff     stx (0xFFFF)
b8c7: ff ff ff     stx (0xFFFF)
b8ca: ff ff ff     stx (0xFFFF)
b8cd: ff ff ff     stx (0xFFFF)
b8d0: ff ff ff     stx (0xFFFF)
b8d3: ff ff ff     stx (0xFFFF)
b8d6: ff ff ff     stx (0xFFFF)
b8d9: ff ff ff     stx (0xFFFF)
b8dc: ff ff ff     stx (0xFFFF)
b8df: ff ff ff     stx (0xFFFF)
b8e2: ff ff ff     stx (0xFFFF)
b8e5: ff ff ff     stx (0xFFFF)
b8e8: ff ff ff     stx (0xFFFF)
b8eb: ff ff ff     stx (0xFFFF)
b8ee: ff ff ff     stx (0xFFFF)
b8f1: ff ff ff     stx (0xFFFF)
b8f4: ff ff ff     stx (0xFFFF)
b8f7: ff ff ff     stx (0xFFFF)
b8fa: ff ff ff     stx (0xFFFF)
b8fd: ff ff ff     stx (0xFFFF)
b900: ff ff ff     stx (0xFFFF)
b903: ff ff ff     stx (0xFFFF)
b906: ff ff ff     stx (0xFFFF)
b909: ff ff ff     stx (0xFFFF)
b90c: ff ff ff     stx (0xFFFF)
b90f: ff ff ff     stx (0xFFFF)
b912: ff ff ff     stx (0xFFFF)
b915: ff ff ff     stx (0xFFFF)
b918: ff ff ff     stx (0xFFFF)
b91b: ff ff ff     stx (0xFFFF)
b91e: ff ff ff     stx (0xFFFF)
b921: ff ff ff     stx (0xFFFF)
b924: ff ff ff     stx (0xFFFF)
b927: ff ff ff     stx (0xFFFF)
b92a: ff ff ff     stx (0xFFFF)
b92d: ff ff ff     stx (0xFFFF)
b930: ff ff ff     stx (0xFFFF)
b933: ff ff ff     stx (0xFFFF)
b936: ff ff ff     stx (0xFFFF)
b939: ff ff ff     stx (0xFFFF)
b93c: ff ff ff     stx (0xFFFF)
b93f: ff ff ff     stx (0xFFFF)
b942: ff ff ff     stx (0xFFFF)
b945: ff ff ff     stx (0xFFFF)
b948: ff ff ff     stx (0xFFFF)
b94b: ff ff ff     stx (0xFFFF)
b94e: ff ff ff     stx (0xFFFF)
b951: ff ff ff     stx (0xFFFF)
b954: ff ff ff     stx (0xFFFF)
b957: ff ff ff     stx (0xFFFF)
b95a: ff ff ff     stx (0xFFFF)
b95d: ff ff ff     stx (0xFFFF)
b960: ff ff ff     stx (0xFFFF)
b963: ff ff ff     stx (0xFFFF)
b966: ff ff ff     stx (0xFFFF)
b969: ff ff ff     stx (0xFFFF)
b96c: ff ff ff     stx (0xFFFF)
b96f: ff ff ff     stx (0xFFFF)
b972: ff ff ff     stx (0xFFFF)
b975: ff ff ff     stx (0xFFFF)
b978: ff ff ff     stx (0xFFFF)
b97b: ff ff ff     stx (0xFFFF)
b97e: ff ff ff     stx (0xFFFF)
b981: ff ff ff     stx (0xFFFF)
b984: ff ff ff     stx (0xFFFF)
b987: ff ff ff     stx (0xFFFF)
b98a: ff ff ff     stx (0xFFFF)
b98d: ff ff ff     stx (0xFFFF)
b990: ff ff ff     stx (0xFFFF)
b993: ff ff ff     stx (0xFFFF)
b996: ff ff ff     stx (0xFFFF)
b999: ff ff ff     stx (0xFFFF)
b99c: ff ff ff     stx (0xFFFF)
b99f: ff ff ff     stx (0xFFFF)
b9a2: ff ff ff     stx (0xFFFF)
b9a5: ff ff ff     stx (0xFFFF)
b9a8: ff ff ff     stx (0xFFFF)
b9ab: ff ff ff     stx (0xFFFF)
b9ae: ff ff ff     stx (0xFFFF)
b9b1: ff ff ff     stx (0xFFFF)
b9b4: ff ff ff     stx (0xFFFF)
b9b7: ff ff ff     stx (0xFFFF)
b9ba: ff ff ff     stx (0xFFFF)
b9bd: ff ff ff     stx (0xFFFF)
b9c0: ff ff ff     stx (0xFFFF)
b9c3: ff ff ff     stx (0xFFFF)
b9c6: ff ff ff     stx (0xFFFF)
b9c9: ff ff ff     stx (0xFFFF)
b9cc: ff ff ff     stx (0xFFFF)
b9cf: ff ff ff     stx (0xFFFF)
b9d2: ff ff ff     stx (0xFFFF)
b9d5: ff ff ff     stx (0xFFFF)
b9d8: ff ff ff     stx (0xFFFF)
b9db: ff ff ff     stx (0xFFFF)
b9de: ff ff ff     stx (0xFFFF)
b9e1: ff ff ff     stx (0xFFFF)
b9e4: ff ff ff     stx (0xFFFF)
b9e7: ff ff ff     stx (0xFFFF)
b9ea: ff ff ff     stx (0xFFFF)
b9ed: ff ff ff     stx (0xFFFF)
b9f0: ff ff ff     stx (0xFFFF)
b9f3: ff ff ff     stx (0xFFFF)
b9f6: ff ff ff     stx (0xFFFF)
b9f9: ff ff ff     stx (0xFFFF)
b9fc: ff ff ff     stx (0xFFFF)
b9ff: ff ff ff     stx (0xFFFF)
ba02: ff ff ff     stx (0xFFFF)
ba05: ff ff ff     stx (0xFFFF)
ba08: ff ff ff     stx (0xFFFF)
ba0b: ff ff ff     stx (0xFFFF)
ba0e: ff ff ff     stx (0xFFFF)
ba11: ff ff ff     stx (0xFFFF)
ba14: ff ff ff     stx (0xFFFF)
ba17: ff ff ff     stx (0xFFFF)
ba1a: ff ff ff     stx (0xFFFF)
ba1d: ff ff ff     stx (0xFFFF)
ba20: ff ff ff     stx (0xFFFF)
ba23: ff ff ff     stx (0xFFFF)
ba26: ff ff ff     stx (0xFFFF)
ba29: ff ff ff     stx (0xFFFF)
ba2c: ff ff ff     stx (0xFFFF)
ba2f: ff ff ff     stx (0xFFFF)
ba32: ff ff ff     stx (0xFFFF)
ba35: ff ff ff     stx (0xFFFF)
ba38: ff ff ff     stx (0xFFFF)
ba3b: ff ff ff     stx (0xFFFF)
ba3e: ff ff ff     stx (0xFFFF)
ba41: ff ff ff     stx (0xFFFF)
ba44: ff ff ff     stx (0xFFFF)
ba47: ff ff ff     stx (0xFFFF)
ba4a: ff ff ff     stx (0xFFFF)
ba4d: ff ff ff     stx (0xFFFF)
ba50: ff ff ff     stx (0xFFFF)
ba53: ff ff ff     stx (0xFFFF)
ba56: ff ff ff     stx (0xFFFF)
ba59: ff ff ff     stx (0xFFFF)
ba5c: ff ff ff     stx (0xFFFF)
ba5f: ff ff ff     stx (0xFFFF)
ba62: ff ff ff     stx (0xFFFF)
ba65: ff ff ff     stx (0xFFFF)
ba68: ff ff ff     stx (0xFFFF)
ba6b: ff ff ff     stx (0xFFFF)
ba6e: ff ff ff     stx (0xFFFF)
ba71: ff ff ff     stx (0xFFFF)
ba74: ff ff ff     stx (0xFFFF)
ba77: ff ff ff     stx (0xFFFF)
ba7a: ff ff ff     stx (0xFFFF)
ba7d: ff ff ff     stx (0xFFFF)
ba80: ff ff ff     stx (0xFFFF)
ba83: ff ff ff     stx (0xFFFF)
ba86: ff ff ff     stx (0xFFFF)
ba89: ff ff ff     stx (0xFFFF)
ba8c: ff ff ff     stx (0xFFFF)
ba8f: ff ff ff     stx (0xFFFF)
ba92: ff ff ff     stx (0xFFFF)
ba95: ff ff ff     stx (0xFFFF)
ba98: ff ff ff     stx (0xFFFF)
ba9b: ff ff ff     stx (0xFFFF)
ba9e: ff ff ff     stx (0xFFFF)
baa1: ff ff ff     stx (0xFFFF)
baa4: ff ff ff     stx (0xFFFF)
baa7: ff ff ff     stx (0xFFFF)
baaa: ff ff ff     stx (0xFFFF)
baad: ff ff ff     stx (0xFFFF)
bab0: ff ff ff     stx (0xFFFF)
bab3: ff ff ff     stx (0xFFFF)
bab6: ff ff ff     stx (0xFFFF)
bab9: ff ff ff     stx (0xFFFF)
babc: ff ff ff     stx (0xFFFF)
babf: ff ff ff     stx (0xFFFF)
bac2: ff ff ff     stx (0xFFFF)
bac5: ff ff ff     stx (0xFFFF)
bac8: ff ff ff     stx (0xFFFF)
bacb: ff ff ff     stx (0xFFFF)
bace: ff ff ff     stx (0xFFFF)
bad1: ff ff ff     stx (0xFFFF)
bad4: ff ff ff     stx (0xFFFF)
bad7: ff ff ff     stx (0xFFFF)
bada: ff ff ff     stx (0xFFFF)
badd: ff ff ff     stx (0xFFFF)
bae0: ff ff ff     stx (0xFFFF)
bae3: ff ff ff     stx (0xFFFF)
bae6: ff ff ff     stx (0xFFFF)
bae9: ff ff ff     stx (0xFFFF)
baec: ff ff ff     stx (0xFFFF)
baef: ff ff ff     stx (0xFFFF)
baf2: ff ff ff     stx (0xFFFF)
baf5: ff ff ff     stx (0xFFFF)
baf8: ff ff ff     stx (0xFFFF)
bafb: ff ff ff     stx (0xFFFF)
bafe: ff ff ff     stx (0xFFFF)
bb01: ff ff ff     stx (0xFFFF)
bb04: ff ff ff     stx (0xFFFF)
bb07: ff ff ff     stx (0xFFFF)
bb0a: ff ff ff     stx (0xFFFF)
bb0d: ff ff ff     stx (0xFFFF)
bb10: ff ff ff     stx (0xFFFF)
bb13: ff ff ff     stx (0xFFFF)
bb16: ff ff ff     stx (0xFFFF)
bb19: ff ff ff     stx (0xFFFF)
bb1c: ff ff ff     stx (0xFFFF)
bb1f: ff ff ff     stx (0xFFFF)
bb22: ff ff ff     stx (0xFFFF)
bb25: ff ff ff     stx (0xFFFF)
bb28: ff ff ff     stx (0xFFFF)
bb2b: ff ff ff     stx (0xFFFF)
bb2e: ff ff ff     stx (0xFFFF)
bb31: ff ff ff     stx (0xFFFF)
bb34: ff ff ff     stx (0xFFFF)
bb37: ff ff ff     stx (0xFFFF)
bb3a: ff ff ff     stx (0xFFFF)
bb3d: ff ff ff     stx (0xFFFF)
bb40: ff ff ff     stx (0xFFFF)
bb43: ff ff ff     stx (0xFFFF)
bb46: ff ff ff     stx (0xFFFF)
bb49: ff ff ff     stx (0xFFFF)
bb4c: ff ff ff     stx (0xFFFF)
bb4f: ff ff ff     stx (0xFFFF)
bb52: ff ff ff     stx (0xFFFF)
bb55: ff ff ff     stx (0xFFFF)
bb58: ff ff ff     stx (0xFFFF)
bb5b: ff ff ff     stx (0xFFFF)
bb5e: ff ff ff     stx (0xFFFF)
bb61: ff ff ff     stx (0xFFFF)
bb64: ff ff ff     stx (0xFFFF)
bb67: ff ff ff     stx (0xFFFF)
bb6a: ff ff ff     stx (0xFFFF)
bb6d: ff ff ff     stx (0xFFFF)
bb70: ff ff ff     stx (0xFFFF)
bb73: ff ff ff     stx (0xFFFF)
bb76: ff ff ff     stx (0xFFFF)
bb79: ff ff ff     stx (0xFFFF)
bb7c: ff ff ff     stx (0xFFFF)
bb7f: ff ff ff     stx (0xFFFF)
bb82: ff ff ff     stx (0xFFFF)
bb85: ff ff ff     stx (0xFFFF)
bb88: ff ff ff     stx (0xFFFF)
bb8b: ff ff ff     stx (0xFFFF)
bb8e: ff ff ff     stx (0xFFFF)
bb91: ff ff ff     stx (0xFFFF)
bb94: ff ff ff     stx (0xFFFF)
bb97: ff ff ff     stx (0xFFFF)
bb9a: ff ff ff     stx (0xFFFF)
bb9d: ff ff ff     stx (0xFFFF)
bba0: ff ff ff     stx (0xFFFF)
bba3: ff ff ff     stx (0xFFFF)
bba6: ff ff ff     stx (0xFFFF)
bba9: ff ff ff     stx (0xFFFF)
bbac: ff ff ff     stx (0xFFFF)
bbaf: ff ff ff     stx (0xFFFF)
bbb2: ff ff ff     stx (0xFFFF)
bbb5: ff ff ff     stx (0xFFFF)
bbb8: ff ff ff     stx (0xFFFF)
bbbb: ff ff ff     stx (0xFFFF)
bbbe: ff ff ff     stx (0xFFFF)
bbc1: ff ff ff     stx (0xFFFF)
bbc4: ff ff ff     stx (0xFFFF)
bbc7: ff ff ff     stx (0xFFFF)
bbca: ff ff ff     stx (0xFFFF)
bbcd: ff ff ff     stx (0xFFFF)
bbd0: ff ff ff     stx (0xFFFF)
bbd3: ff ff ff     stx (0xFFFF)
bbd6: ff ff ff     stx (0xFFFF)
bbd9: ff ff ff     stx (0xFFFF)
bbdc: ff ff ff     stx (0xFFFF)
bbdf: ff ff ff     stx (0xFFFF)
bbe2: ff ff ff     stx (0xFFFF)
bbe5: ff ff ff     stx (0xFFFF)
bbe8: ff ff ff     stx (0xFFFF)
bbeb: ff ff ff     stx (0xFFFF)
bbee: ff ff ff     stx (0xFFFF)
bbf1: ff ff ff     stx (0xFFFF)
bbf4: ff ff ff     stx (0xFFFF)
bbf7: ff ff ff     stx (0xFFFF)
bbfa: ff ff ff     stx (0xFFFF)
bbfd: ff ff ff     stx (0xFFFF)
bc00: ff ff ff     stx (0xFFFF)
bc03: ff ff ff     stx (0xFFFF)
bc06: ff ff ff     stx (0xFFFF)
bc09: ff ff ff     stx (0xFFFF)
bc0c: ff ff ff     stx (0xFFFF)
bc0f: ff ff ff     stx (0xFFFF)
bc12: ff ff ff     stx (0xFFFF)
bc15: ff ff ff     stx (0xFFFF)
bc18: ff ff ff     stx (0xFFFF)
bc1b: ff ff ff     stx (0xFFFF)
bc1e: ff ff ff     stx (0xFFFF)
bc21: ff ff ff     stx (0xFFFF)
bc24: ff ff ff     stx (0xFFFF)
bc27: ff ff ff     stx (0xFFFF)
bc2a: ff ff ff     stx (0xFFFF)
bc2d: ff ff ff     stx (0xFFFF)
bc30: ff ff ff     stx (0xFFFF)
bc33: ff ff ff     stx (0xFFFF)
bc36: ff ff ff     stx (0xFFFF)
bc39: ff ff ff     stx (0xFFFF)
bc3c: ff ff ff     stx (0xFFFF)
bc3f: ff ff ff     stx (0xFFFF)
bc42: ff ff ff     stx (0xFFFF)
bc45: ff ff ff     stx (0xFFFF)
bc48: ff ff ff     stx (0xFFFF)
bc4b: ff ff ff     stx (0xFFFF)
bc4e: ff ff ff     stx (0xFFFF)
bc51: ff ff ff     stx (0xFFFF)
bc54: ff ff ff     stx (0xFFFF)
bc57: ff ff ff     stx (0xFFFF)
bc5a: ff ff ff     stx (0xFFFF)
bc5d: ff ff ff     stx (0xFFFF)
bc60: ff ff ff     stx (0xFFFF)
bc63: ff ff ff     stx (0xFFFF)
bc66: ff ff ff     stx (0xFFFF)
bc69: ff ff ff     stx (0xFFFF)
bc6c: ff ff ff     stx (0xFFFF)
bc6f: ff ff ff     stx (0xFFFF)
bc72: ff ff ff     stx (0xFFFF)
bc75: ff ff ff     stx (0xFFFF)
bc78: ff ff ff     stx (0xFFFF)
bc7b: ff ff ff     stx (0xFFFF)
bc7e: ff ff ff     stx (0xFFFF)
bc81: ff ff ff     stx (0xFFFF)
bc84: ff ff ff     stx (0xFFFF)
bc87: ff ff ff     stx (0xFFFF)
bc8a: ff ff ff     stx (0xFFFF)
bc8d: ff ff ff     stx (0xFFFF)
bc90: ff ff ff     stx (0xFFFF)
bc93: ff ff ff     stx (0xFFFF)
bc96: ff ff ff     stx (0xFFFF)
bc99: ff ff ff     stx (0xFFFF)
bc9c: ff ff ff     stx (0xFFFF)
bc9f: ff ff ff     stx (0xFFFF)
bca2: ff ff ff     stx (0xFFFF)
bca5: ff ff ff     stx (0xFFFF)
bca8: ff ff ff     stx (0xFFFF)
bcab: ff ff ff     stx (0xFFFF)
bcae: ff ff ff     stx (0xFFFF)
bcb1: ff ff ff     stx (0xFFFF)
bcb4: ff ff ff     stx (0xFFFF)
bcb7: ff ff ff     stx (0xFFFF)
bcba: ff ff ff     stx (0xFFFF)
bcbd: ff ff ff     stx (0xFFFF)
bcc0: ff ff ff     stx (0xFFFF)
bcc3: ff ff ff     stx (0xFFFF)
bcc6: ff ff ff     stx (0xFFFF)
bcc9: ff ff ff     stx (0xFFFF)
bccc: ff ff ff     stx (0xFFFF)
bccf: ff ff ff     stx (0xFFFF)
bcd2: ff ff ff     stx (0xFFFF)
bcd5: ff ff ff     stx (0xFFFF)
bcd8: ff ff ff     stx (0xFFFF)
bcdb: ff ff ff     stx (0xFFFF)
bcde: ff ff ff     stx (0xFFFF)
bce1: ff ff ff     stx (0xFFFF)
bce4: ff ff ff     stx (0xFFFF)
bce7: ff ff ff     stx (0xFFFF)
bcea: ff ff ff     stx (0xFFFF)
bced: ff ff ff     stx (0xFFFF)
bcf0: ff ff ff     stx (0xFFFF)
bcf3: ff ff ff     stx (0xFFFF)
bcf6: ff ff ff     stx (0xFFFF)
bcf9: ff ff ff     stx (0xFFFF)
bcfc: ff ff ff     stx (0xFFFF)
bcff: ff ff ff     stx (0xFFFF)
bd02: ff ff ff     stx (0xFFFF)
bd05: ff ff ff     stx (0xFFFF)
bd08: ff ff ff     stx (0xFFFF)
bd0b: ff ff ff     stx (0xFFFF)
bd0e: ff ff ff     stx (0xFFFF)
bd11: ff ff ff     stx (0xFFFF)
bd14: ff ff ff     stx (0xFFFF)
bd17: ff ff ff     stx (0xFFFF)
bd1a: ff ff ff     stx (0xFFFF)
bd1d: ff ff ff     stx (0xFFFF)
bd20: ff ff ff     stx (0xFFFF)
bd23: ff ff ff     stx (0xFFFF)
bd26: ff ff ff     stx (0xFFFF)
bd29: ff ff ff     stx (0xFFFF)
bd2c: ff ff ff     stx (0xFFFF)
bd2f: ff ff ff     stx (0xFFFF)
bd32: ff ff ff     stx (0xFFFF)
bd35: ff ff ff     stx (0xFFFF)
bd38: ff ff ff     stx (0xFFFF)
bd3b: ff ff ff     stx (0xFFFF)
bd3e: ff ff ff     stx (0xFFFF)
bd41: ff ff ff     stx (0xFFFF)
bd44: ff ff ff     stx (0xFFFF)
bd47: ff ff ff     stx (0xFFFF)
bd4a: ff ff ff     stx (0xFFFF)
bd4d: ff ff ff     stx (0xFFFF)
bd50: ff ff ff     stx (0xFFFF)
bd53: ff ff ff     stx (0xFFFF)
bd56: ff ff ff     stx (0xFFFF)
bd59: ff ff ff     stx (0xFFFF)
bd5c: ff ff ff     stx (0xFFFF)
bd5f: ff ff ff     stx (0xFFFF)
bd62: ff ff ff     stx (0xFFFF)
bd65: ff ff ff     stx (0xFFFF)
bd68: ff ff ff     stx (0xFFFF)
bd6b: ff ff ff     stx (0xFFFF)
bd6e: ff ff ff     stx (0xFFFF)
bd71: ff ff ff     stx (0xFFFF)
bd74: ff ff ff     stx (0xFFFF)
bd77: ff ff ff     stx (0xFFFF)
bd7a: ff ff ff     stx (0xFFFF)
bd7d: ff ff ff     stx (0xFFFF)
bd80: ff ff ff     stx (0xFFFF)
bd83: ff ff ff     stx (0xFFFF)
bd86: ff ff ff     stx (0xFFFF)
bd89: ff ff ff     stx (0xFFFF)
bd8c: ff ff ff     stx (0xFFFF)
bd8f: ff ff ff     stx (0xFFFF)
bd92: ff ff ff     stx (0xFFFF)
bd95: ff ff ff     stx (0xFFFF)
bd98: ff ff ff     stx (0xFFFF)
bd9b: ff ff ff     stx (0xFFFF)
bd9e: ff ff ff     stx (0xFFFF)
bda1: ff ff ff     stx (0xFFFF)
bda4: ff ff ff     stx (0xFFFF)
bda7: ff ff ff     stx (0xFFFF)
bdaa: ff ff ff     stx (0xFFFF)
bdad: ff ff ff     stx (0xFFFF)
bdb0: ff ff ff     stx (0xFFFF)
bdb3: ff ff ff     stx (0xFFFF)
bdb6: ff ff ff     stx (0xFFFF)
bdb9: ff ff ff     stx (0xFFFF)
bdbc: ff ff ff     stx (0xFFFF)
bdbf: ff ff ff     stx (0xFFFF)
bdc2: ff ff ff     stx (0xFFFF)
bdc5: ff ff ff     stx (0xFFFF)
bdc8: ff ff ff     stx (0xFFFF)
bdcb: ff ff ff     stx (0xFFFF)
bdce: ff ff ff     stx (0xFFFF)
bdd1: ff ff ff     stx (0xFFFF)
bdd4: ff ff ff     stx (0xFFFF)
bdd7: ff ff ff     stx (0xFFFF)
bdda: ff ff ff     stx (0xFFFF)
bddd: ff ff ff     stx (0xFFFF)
bde0: ff ff ff     stx (0xFFFF)
bde3: ff ff ff     stx (0xFFFF)
bde6: ff ff ff     stx (0xFFFF)
bde9: ff ff ff     stx (0xFFFF)
bdec: ff ff ff     stx (0xFFFF)
bdef: ff ff ff     stx (0xFFFF)
bdf2: ff ff ff     stx (0xFFFF)
bdf5: ff ff ff     stx (0xFFFF)
bdf8: ff ff ff     stx (0xFFFF)
bdfb: ff ff ff     stx (0xFFFF)
bdfe: ff ff ff     stx (0xFFFF)
be01: ff ff ff     stx (0xFFFF)
be04: ff ff ff     stx (0xFFFF)
be07: ff ff ff     stx (0xFFFF)
be0a: ff ff ff     stx (0xFFFF)
be0d: ff ff ff     stx (0xFFFF)
be10: ff ff ff     stx (0xFFFF)
be13: ff ff ff     stx (0xFFFF)
be16: ff ff ff     stx (0xFFFF)
be19: ff ff ff     stx (0xFFFF)
be1c: ff ff ff     stx (0xFFFF)
be1f: ff ff ff     stx (0xFFFF)
be22: ff ff ff     stx (0xFFFF)
be25: ff ff ff     stx (0xFFFF)
be28: ff ff ff     stx (0xFFFF)
be2b: ff ff ff     stx (0xFFFF)
be2e: ff ff ff     stx (0xFFFF)
be31: ff ff ff     stx (0xFFFF)
be34: ff ff ff     stx (0xFFFF)
be37: ff ff ff     stx (0xFFFF)
be3a: ff ff ff     stx (0xFFFF)
be3d: ff ff ff     stx (0xFFFF)
be40: ff ff ff     stx (0xFFFF)
be43: ff ff ff     stx (0xFFFF)
be46: ff ff ff     stx (0xFFFF)
be49: ff ff ff     stx (0xFFFF)
be4c: ff ff ff     stx (0xFFFF)
be4f: ff ff ff     stx (0xFFFF)
be52: ff ff ff     stx (0xFFFF)
be55: ff ff ff     stx (0xFFFF)
be58: ff ff ff     stx (0xFFFF)
be5b: ff ff ff     stx (0xFFFF)
be5e: ff ff ff     stx (0xFFFF)
be61: ff ff ff     stx (0xFFFF)
be64: ff ff ff     stx (0xFFFF)
be67: ff ff ff     stx (0xFFFF)
be6a: ff ff ff     stx (0xFFFF)
be6d: ff ff ff     stx (0xFFFF)
be70: ff ff ff     stx (0xFFFF)
be73: ff ff ff     stx (0xFFFF)
be76: ff ff ff     stx (0xFFFF)
be79: ff ff ff     stx (0xFFFF)
be7c: ff ff ff     stx (0xFFFF)
be7f: ff ff ff     stx (0xFFFF)
be82: ff ff ff     stx (0xFFFF)
be85: ff ff ff     stx (0xFFFF)
be88: ff ff ff     stx (0xFFFF)
be8b: ff ff ff     stx (0xFFFF)
be8e: ff ff ff     stx (0xFFFF)
be91: ff ff ff     stx (0xFFFF)
be94: ff ff ff     stx (0xFFFF)
be97: ff ff ff     stx (0xFFFF)
be9a: ff ff ff     stx (0xFFFF)
be9d: ff ff ff     stx (0xFFFF)
bea0: ff ff ff     stx (0xFFFF)
bea3: ff ff ff     stx (0xFFFF)
bea6: ff ff ff     stx (0xFFFF)
bea9: ff ff ff     stx (0xFFFF)
beac: ff ff ff     stx (0xFFFF)
beaf: ff ff ff     stx (0xFFFF)
beb2: ff ff ff     stx (0xFFFF)
beb5: ff ff ff     stx (0xFFFF)
beb8: ff ff ff     stx (0xFFFF)
bebb: ff ff ff     stx (0xFFFF)
bebe: ff ff ff     stx (0xFFFF)
bec1: ff ff ff     stx (0xFFFF)
bec4: ff ff ff     stx (0xFFFF)
bec7: ff ff ff     stx (0xFFFF)
beca: ff ff ff     stx (0xFFFF)
becd: ff ff ff     stx (0xFFFF)
bed0: ff ff ff     stx (0xFFFF)
bed3: ff ff ff     stx (0xFFFF)
bed6: ff ff ff     stx (0xFFFF)
bed9: ff ff ff     stx (0xFFFF)
bedc: ff ff ff     stx (0xFFFF)
bedf: ff ff ff     stx (0xFFFF)
bee2: ff ff ff     stx (0xFFFF)
bee5: ff ff ff     stx (0xFFFF)
bee8: ff ff ff     stx (0xFFFF)
beeb: ff ff ff     stx (0xFFFF)
beee: ff ff ff     stx (0xFFFF)
bef1: ff ff ff     stx (0xFFFF)
bef4: ff ff ff     stx (0xFFFF)
bef7: ff ff ff     stx (0xFFFF)
befa: ff ff ff     stx (0xFFFF)
befd: ff ff ff     stx (0xFFFF)
bf00: ff ff ff     stx (0xFFFF)
bf03: ff ff ff     stx (0xFFFF)
bf06: ff ff ff     stx (0xFFFF)
bf09: ff ff ff     stx (0xFFFF)
bf0c: ff ff ff     stx (0xFFFF)
bf0f: ff ff ff     stx (0xFFFF)
bf12: ff ff ff     stx (0xFFFF)
bf15: ff ff ff     stx (0xFFFF)
bf18: ff ff ff     stx (0xFFFF)
bf1b: ff ff ff     stx (0xFFFF)
bf1e: ff ff ff     stx (0xFFFF)
bf21: ff ff ff     stx (0xFFFF)
bf24: ff ff ff     stx (0xFFFF)
bf27: ff ff ff     stx (0xFFFF)
bf2a: ff ff ff     stx (0xFFFF)
bf2d: ff ff ff     stx (0xFFFF)
bf30: ff ff ff     stx (0xFFFF)
bf33: ff ff ff     stx (0xFFFF)
bf36: ff ff ff     stx (0xFFFF)
bf39: ff ff ff     stx (0xFFFF)
bf3c: ff ff ff     stx (0xFFFF)
bf3f: ff ff ff     stx (0xFFFF)
bf42: ff ff ff     stx (0xFFFF)
bf45: ff ff ff     stx (0xFFFF)
bf48: ff ff ff     stx (0xFFFF)
bf4b: ff ff ff     stx (0xFFFF)
bf4e: ff ff ff     stx (0xFFFF)
bf51: ff ff ff     stx (0xFFFF)
bf54: ff ff ff     stx (0xFFFF)
bf57: ff ff ff     stx (0xFFFF)
bf5a: ff ff ff     stx (0xFFFF)
bf5d: ff ff ff     stx (0xFFFF)
bf60: ff ff ff     stx (0xFFFF)
bf63: ff ff ff     stx (0xFFFF)
bf66: ff ff ff     stx (0xFFFF)
bf69: ff ff ff     stx (0xFFFF)
bf6c: ff ff ff     stx (0xFFFF)
bf6f: ff ff ff     stx (0xFFFF)
bf72: ff ff ff     stx (0xFFFF)
bf75: ff ff ff     stx (0xFFFF)
bf78: ff ff ff     stx (0xFFFF)
bf7b: ff ff ff     stx (0xFFFF)
bf7e: ff ff ff     stx (0xFFFF)
bf81: ff ff ff     stx (0xFFFF)
bf84: ff ff ff     stx (0xFFFF)
bf87: ff ff ff     stx (0xFFFF)
bf8a: ff ff ff     stx (0xFFFF)
bf8d: ff ff ff     stx (0xFFFF)
bf90: ff ff ff     stx (0xFFFF)
bf93: ff ff ff     stx (0xFFFF)
bf96: ff ff ff     stx (0xFFFF)
bf99: ff ff ff     stx (0xFFFF)
bf9c: ff ff ff     stx (0xFFFF)
bf9f: ff ff ff     stx (0xFFFF)
bfa2: ff ff ff     stx (0xFFFF)
bfa5: ff ff ff     stx (0xFFFF)
bfa8: ff ff ff     stx (0xFFFF)
bfab: ff ff ff     stx (0xFFFF)
bfae: ff ff ff     stx (0xFFFF)
bfb1: ff ff ff     stx (0xFFFF)
bfb4: ff ff ff     stx (0xFFFF)
bfb7: ff ff ff     stx (0xFFFF)
bfba: ff ff ff     stx (0xFFFF)
bfbd: ff ff ff     stx (0xFFFF)
bfc0: ff ff ff     stx (0xFFFF)
bfc3: ff ff ff     stx (0xFFFF)
bfc6: ff ff ff     stx (0xFFFF)
bfc9: ff ff ff     stx (0xFFFF)
bfcc: ff ff ff     stx (0xFFFF)
bfcf: ff ff ff     stx (0xFFFF)
bfd2: ff ff ff     stx (0xFFFF)
bfd5: ff ff ff     stx (0xFFFF)
bfd8: ff ff ff     stx (0xFFFF)
bfdb: ff ff ff     stx (0xFFFF)
bfde: ff ff ff     stx (0xFFFF)
bfe1: ff ff ff     stx (0xFFFF)
bfe4: ff ff ff     stx (0xFFFF)
bfe7: ff ff ff     stx (0xFFFF)
bfea: ff ff ff     stx (0xFFFF)
bfed: ff ff ff     stx (0xFFFF)
bff0: ff ff ff     stx (0xFFFF)
bff3: ff ff ff     stx (0xFFFF)
bff6: ff ff ff     stx (0xFFFF)
bff9: ff ff ff     stx (0xFFFF)
bffc: ff ff ff     stx (0xFFFF)
bfff: ff ff ff     stx (0xFFFF)
c002: ff ff ff     stx (0xFFFF)
c005: ff ff ff     stx (0xFFFF)
c008: ff ff ff     stx (0xFFFF)
c00b: ff ff ff     stx (0xFFFF)
c00e: ff ff ff     stx (0xFFFF)
c011: ff ff ff     stx (0xFFFF)
c014: ff ff ff     stx (0xFFFF)
c017: ff ff ff     stx (0xFFFF)
c01a: ff ff ff     stx (0xFFFF)
c01d: ff ff ff     stx (0xFFFF)
c020: ff ff ff     stx (0xFFFF)
c023: ff ff ff     stx (0xFFFF)
c026: ff ff ff     stx (0xFFFF)
c029: ff ff ff     stx (0xFFFF)
c02c: ff ff ff     stx (0xFFFF)
c02f: ff ff ff     stx (0xFFFF)
c032: ff ff ff     stx (0xFFFF)
c035: ff ff ff     stx (0xFFFF)
c038: ff ff ff     stx (0xFFFF)
c03b: ff ff ff     stx (0xFFFF)
c03e: ff ff ff     stx (0xFFFF)
c041: ff ff ff     stx (0xFFFF)
c044: ff ff ff     stx (0xFFFF)
c047: ff ff ff     stx (0xFFFF)
c04a: ff ff ff     stx (0xFFFF)
c04d: ff ff ff     stx (0xFFFF)
c050: ff ff ff     stx (0xFFFF)
c053: ff ff ff     stx (0xFFFF)
c056: ff ff ff     stx (0xFFFF)
c059: ff ff ff     stx (0xFFFF)
c05c: ff ff ff     stx (0xFFFF)
c05f: ff ff ff     stx (0xFFFF)
c062: ff ff ff     stx (0xFFFF)
c065: ff ff ff     stx (0xFFFF)
c068: ff ff ff     stx (0xFFFF)
c06b: ff ff ff     stx (0xFFFF)
c06e: ff ff ff     stx (0xFFFF)
c071: ff ff ff     stx (0xFFFF)
c074: ff ff ff     stx (0xFFFF)
c077: ff ff ff     stx (0xFFFF)
c07a: ff ff ff     stx (0xFFFF)
c07d: ff ff ff     stx (0xFFFF)
c080: ff ff ff     stx (0xFFFF)
c083: ff ff ff     stx (0xFFFF)
c086: ff ff ff     stx (0xFFFF)
c089: ff ff ff     stx (0xFFFF)
c08c: ff ff ff     stx (0xFFFF)
c08f: ff ff ff     stx (0xFFFF)
c092: ff ff ff     stx (0xFFFF)
c095: ff ff ff     stx (0xFFFF)
c098: ff ff ff     stx (0xFFFF)
c09b: ff ff ff     stx (0xFFFF)
c09e: ff ff ff     stx (0xFFFF)
c0a1: ff ff ff     stx (0xFFFF)
c0a4: ff ff ff     stx (0xFFFF)
c0a7: ff ff ff     stx (0xFFFF)
c0aa: ff ff ff     stx (0xFFFF)
c0ad: ff ff ff     stx (0xFFFF)
c0b0: ff ff ff     stx (0xFFFF)
c0b3: ff ff ff     stx (0xFFFF)
c0b6: ff ff ff     stx (0xFFFF)
c0b9: ff ff ff     stx (0xFFFF)
c0bc: ff ff ff     stx (0xFFFF)
c0bf: ff ff ff     stx (0xFFFF)
c0c2: ff ff ff     stx (0xFFFF)
c0c5: ff ff ff     stx (0xFFFF)
c0c8: ff ff ff     stx (0xFFFF)
c0cb: ff ff ff     stx (0xFFFF)
c0ce: ff ff ff     stx (0xFFFF)
c0d1: ff ff ff     stx (0xFFFF)
c0d4: ff ff ff     stx (0xFFFF)
c0d7: ff ff ff     stx (0xFFFF)
c0da: ff ff ff     stx (0xFFFF)
c0dd: ff ff ff     stx (0xFFFF)
c0e0: ff ff ff     stx (0xFFFF)
c0e3: ff ff ff     stx (0xFFFF)
c0e6: ff ff ff     stx (0xFFFF)
c0e9: ff ff ff     stx (0xFFFF)
c0ec: ff ff ff     stx (0xFFFF)
c0ef: ff ff ff     stx (0xFFFF)
c0f2: ff ff ff     stx (0xFFFF)
c0f5: ff ff ff     stx (0xFFFF)
c0f8: ff ff ff     stx (0xFFFF)
c0fb: ff ff ff     stx (0xFFFF)
c0fe: ff ff ff     stx (0xFFFF)
c101: ff ff ff     stx (0xFFFF)
c104: ff ff ff     stx (0xFFFF)
c107: ff ff ff     stx (0xFFFF)
c10a: ff ff ff     stx (0xFFFF)
c10d: ff ff ff     stx (0xFFFF)
c110: ff ff ff     stx (0xFFFF)
c113: ff ff ff     stx (0xFFFF)
c116: ff ff ff     stx (0xFFFF)
c119: ff ff ff     stx (0xFFFF)
c11c: ff ff ff     stx (0xFFFF)
c11f: ff ff ff     stx (0xFFFF)
c122: ff ff ff     stx (0xFFFF)
c125: ff ff ff     stx (0xFFFF)
c128: ff ff ff     stx (0xFFFF)
c12b: ff ff ff     stx (0xFFFF)
c12e: ff ff ff     stx (0xFFFF)
c131: ff ff ff     stx (0xFFFF)
c134: ff ff ff     stx (0xFFFF)
c137: ff ff ff     stx (0xFFFF)
c13a: ff ff ff     stx (0xFFFF)
c13d: ff ff ff     stx (0xFFFF)
c140: ff ff ff     stx (0xFFFF)
c143: ff ff ff     stx (0xFFFF)
c146: ff ff ff     stx (0xFFFF)
c149: ff ff ff     stx (0xFFFF)
c14c: ff ff ff     stx (0xFFFF)
c14f: ff ff ff     stx (0xFFFF)
c152: ff ff ff     stx (0xFFFF)
c155: ff ff ff     stx (0xFFFF)
c158: ff ff ff     stx (0xFFFF)
c15b: ff ff ff     stx (0xFFFF)
c15e: ff ff ff     stx (0xFFFF)
c161: ff ff ff     stx (0xFFFF)
c164: ff ff ff     stx (0xFFFF)
c167: ff ff ff     stx (0xFFFF)
c16a: ff ff ff     stx (0xFFFF)
c16d: ff ff ff     stx (0xFFFF)
c170: ff ff ff     stx (0xFFFF)
c173: ff ff ff     stx (0xFFFF)
c176: ff ff ff     stx (0xFFFF)
c179: ff ff ff     stx (0xFFFF)
c17c: ff ff ff     stx (0xFFFF)
c17f: ff ff ff     stx (0xFFFF)
c182: ff ff ff     stx (0xFFFF)
c185: ff ff ff     stx (0xFFFF)
c188: ff ff ff     stx (0xFFFF)
c18b: ff ff ff     stx (0xFFFF)
c18e: ff ff ff     stx (0xFFFF)
c191: ff ff ff     stx (0xFFFF)
c194: ff ff ff     stx (0xFFFF)
c197: ff ff ff     stx (0xFFFF)
c19a: ff ff ff     stx (0xFFFF)
c19d: ff ff ff     stx (0xFFFF)
c1a0: ff ff ff     stx (0xFFFF)
c1a3: ff ff ff     stx (0xFFFF)
c1a6: ff ff ff     stx (0xFFFF)
c1a9: ff ff ff     stx (0xFFFF)
c1ac: ff ff ff     stx (0xFFFF)
c1af: ff ff ff     stx (0xFFFF)
c1b2: ff ff ff     stx (0xFFFF)
c1b5: ff ff ff     stx (0xFFFF)
c1b8: ff ff ff     stx (0xFFFF)
c1bb: ff ff ff     stx (0xFFFF)
c1be: ff ff ff     stx (0xFFFF)
c1c1: ff ff ff     stx (0xFFFF)
c1c4: ff ff ff     stx (0xFFFF)
c1c7: ff ff ff     stx (0xFFFF)
c1ca: ff ff ff     stx (0xFFFF)
c1cd: ff ff ff     stx (0xFFFF)
c1d0: ff ff ff     stx (0xFFFF)
c1d3: ff ff ff     stx (0xFFFF)
c1d6: ff ff ff     stx (0xFFFF)
c1d9: ff ff ff     stx (0xFFFF)
c1dc: ff ff ff     stx (0xFFFF)
c1df: ff ff ff     stx (0xFFFF)
c1e2: ff ff ff     stx (0xFFFF)
c1e5: ff ff ff     stx (0xFFFF)
c1e8: ff ff ff     stx (0xFFFF)
c1eb: ff ff ff     stx (0xFFFF)
c1ee: ff ff ff     stx (0xFFFF)
c1f1: ff ff ff     stx (0xFFFF)
c1f4: ff ff ff     stx (0xFFFF)
c1f7: ff ff ff     stx (0xFFFF)
c1fa: ff ff ff     stx (0xFFFF)
c1fd: ff ff ff     stx (0xFFFF)
c200: ff ff ff     stx (0xFFFF)
c203: ff ff ff     stx (0xFFFF)
c206: ff ff ff     stx (0xFFFF)
c209: ff ff ff     stx (0xFFFF)
c20c: ff ff ff     stx (0xFFFF)
c20f: ff ff ff     stx (0xFFFF)
c212: ff ff ff     stx (0xFFFF)
c215: ff ff ff     stx (0xFFFF)
c218: ff ff ff     stx (0xFFFF)
c21b: ff ff ff     stx (0xFFFF)
c21e: ff ff ff     stx (0xFFFF)
c221: ff ff ff     stx (0xFFFF)
c224: ff ff ff     stx (0xFFFF)
c227: ff ff ff     stx (0xFFFF)
c22a: ff ff ff     stx (0xFFFF)
c22d: ff ff ff     stx (0xFFFF)
c230: ff ff ff     stx (0xFFFF)
c233: ff ff ff     stx (0xFFFF)
c236: ff ff ff     stx (0xFFFF)
c239: ff ff ff     stx (0xFFFF)
c23c: ff ff ff     stx (0xFFFF)
c23f: ff ff ff     stx (0xFFFF)
c242: ff ff ff     stx (0xFFFF)
c245: ff ff ff     stx (0xFFFF)
c248: ff ff ff     stx (0xFFFF)
c24b: ff ff ff     stx (0xFFFF)
c24e: ff ff ff     stx (0xFFFF)
c251: ff ff ff     stx (0xFFFF)
c254: ff ff ff     stx (0xFFFF)
c257: ff ff ff     stx (0xFFFF)
c25a: ff ff ff     stx (0xFFFF)
c25d: ff ff ff     stx (0xFFFF)
c260: ff ff ff     stx (0xFFFF)
c263: ff ff ff     stx (0xFFFF)
c266: ff ff ff     stx (0xFFFF)
c269: ff ff ff     stx (0xFFFF)
c26c: ff ff ff     stx (0xFFFF)
c26f: ff ff ff     stx (0xFFFF)
c272: ff ff ff     stx (0xFFFF)
c275: ff ff ff     stx (0xFFFF)
c278: ff ff ff     stx (0xFFFF)
c27b: ff ff ff     stx (0xFFFF)
c27e: ff ff ff     stx (0xFFFF)
c281: ff ff ff     stx (0xFFFF)
c284: ff ff ff     stx (0xFFFF)
c287: ff ff ff     stx (0xFFFF)
c28a: ff ff ff     stx (0xFFFF)
c28d: ff ff ff     stx (0xFFFF)
c290: ff ff ff     stx (0xFFFF)
c293: ff ff ff     stx (0xFFFF)
c296: ff ff ff     stx (0xFFFF)
c299: ff ff ff     stx (0xFFFF)
c29c: ff ff ff     stx (0xFFFF)
c29f: ff ff ff     stx (0xFFFF)
c2a2: ff ff ff     stx (0xFFFF)
c2a5: ff ff ff     stx (0xFFFF)
c2a8: ff ff ff     stx (0xFFFF)
c2ab: ff ff ff     stx (0xFFFF)
c2ae: ff ff ff     stx (0xFFFF)
c2b1: ff ff ff     stx (0xFFFF)
c2b4: ff ff ff     stx (0xFFFF)
c2b7: ff ff ff     stx (0xFFFF)
c2ba: ff ff ff     stx (0xFFFF)
c2bd: ff ff ff     stx (0xFFFF)
c2c0: ff ff ff     stx (0xFFFF)
c2c3: ff ff ff     stx (0xFFFF)
c2c6: ff ff ff     stx (0xFFFF)
c2c9: ff ff ff     stx (0xFFFF)
c2cc: ff ff ff     stx (0xFFFF)
c2cf: ff ff ff     stx (0xFFFF)
c2d2: ff ff ff     stx (0xFFFF)
c2d5: ff ff ff     stx (0xFFFF)
c2d8: ff ff ff     stx (0xFFFF)
c2db: ff ff ff     stx (0xFFFF)
c2de: ff ff ff     stx (0xFFFF)
c2e1: ff ff ff     stx (0xFFFF)
c2e4: ff ff ff     stx (0xFFFF)
c2e7: ff ff ff     stx (0xFFFF)
c2ea: ff ff ff     stx (0xFFFF)
c2ed: ff ff ff     stx (0xFFFF)
c2f0: ff ff ff     stx (0xFFFF)
c2f3: ff ff ff     stx (0xFFFF)
c2f6: ff ff ff     stx (0xFFFF)
c2f9: ff ff ff     stx (0xFFFF)
c2fc: ff ff ff     stx (0xFFFF)
c2ff: ff ff ff     stx (0xFFFF)
c302: ff ff ff     stx (0xFFFF)
c305: ff ff ff     stx (0xFFFF)
c308: ff ff ff     stx (0xFFFF)
c30b: ff ff ff     stx (0xFFFF)
c30e: ff ff ff     stx (0xFFFF)
c311: ff ff ff     stx (0xFFFF)
c314: ff ff ff     stx (0xFFFF)
c317: ff ff ff     stx (0xFFFF)
c31a: ff ff ff     stx (0xFFFF)
c31d: ff ff ff     stx (0xFFFF)
c320: ff ff ff     stx (0xFFFF)
c323: ff ff ff     stx (0xFFFF)
c326: ff ff ff     stx (0xFFFF)
c329: ff ff ff     stx (0xFFFF)
c32c: ff ff ff     stx (0xFFFF)
c32f: ff ff ff     stx (0xFFFF)
c332: ff ff ff     stx (0xFFFF)
c335: ff ff ff     stx (0xFFFF)
c338: ff ff ff     stx (0xFFFF)
c33b: ff ff ff     stx (0xFFFF)
c33e: ff ff ff     stx (0xFFFF)
c341: ff ff ff     stx (0xFFFF)
c344: ff ff ff     stx (0xFFFF)
c347: ff ff ff     stx (0xFFFF)
c34a: ff ff ff     stx (0xFFFF)
c34d: ff ff ff     stx (0xFFFF)
c350: ff ff ff     stx (0xFFFF)
c353: ff ff ff     stx (0xFFFF)
c356: ff ff ff     stx (0xFFFF)
c359: ff ff ff     stx (0xFFFF)
c35c: ff ff ff     stx (0xFFFF)
c35f: ff ff ff     stx (0xFFFF)
c362: ff ff ff     stx (0xFFFF)
c365: ff ff ff     stx (0xFFFF)
c368: ff ff ff     stx (0xFFFF)
c36b: ff ff ff     stx (0xFFFF)
c36e: ff ff ff     stx (0xFFFF)
c371: ff ff ff     stx (0xFFFF)
c374: ff ff ff     stx (0xFFFF)
c377: ff ff ff     stx (0xFFFF)
c37a: ff ff ff     stx (0xFFFF)
c37d: ff ff ff     stx (0xFFFF)
c380: ff ff ff     stx (0xFFFF)
c383: ff ff ff     stx (0xFFFF)
c386: ff ff ff     stx (0xFFFF)
c389: ff ff ff     stx (0xFFFF)
c38c: ff ff ff     stx (0xFFFF)
c38f: ff ff ff     stx (0xFFFF)
c392: ff ff ff     stx (0xFFFF)
c395: ff ff ff     stx (0xFFFF)
c398: ff ff ff     stx (0xFFFF)
c39b: ff ff ff     stx (0xFFFF)
c39e: ff ff ff     stx (0xFFFF)
c3a1: ff ff ff     stx (0xFFFF)
c3a4: ff ff ff     stx (0xFFFF)
c3a7: ff ff ff     stx (0xFFFF)
c3aa: ff ff ff     stx (0xFFFF)
c3ad: ff ff ff     stx (0xFFFF)
c3b0: ff ff ff     stx (0xFFFF)
c3b3: ff ff ff     stx (0xFFFF)
c3b6: ff ff ff     stx (0xFFFF)
c3b9: ff ff ff     stx (0xFFFF)
c3bc: ff ff ff     stx (0xFFFF)
c3bf: ff ff ff     stx (0xFFFF)
c3c2: ff ff ff     stx (0xFFFF)
c3c5: ff ff ff     stx (0xFFFF)
c3c8: ff ff ff     stx (0xFFFF)
c3cb: ff ff ff     stx (0xFFFF)
c3ce: ff ff ff     stx (0xFFFF)
c3d1: ff ff ff     stx (0xFFFF)
c3d4: ff ff ff     stx (0xFFFF)
c3d7: ff ff ff     stx (0xFFFF)
c3da: ff ff ff     stx (0xFFFF)
c3dd: ff ff ff     stx (0xFFFF)
c3e0: ff ff ff     stx (0xFFFF)
c3e3: ff ff ff     stx (0xFFFF)
c3e6: ff ff ff     stx (0xFFFF)
c3e9: ff ff ff     stx (0xFFFF)
c3ec: ff ff ff     stx (0xFFFF)
c3ef: ff ff ff     stx (0xFFFF)
c3f2: ff ff ff     stx (0xFFFF)
c3f5: ff ff ff     stx (0xFFFF)
c3f8: ff ff ff     stx (0xFFFF)
c3fb: ff ff ff     stx (0xFFFF)
c3fe: ff ff ff     stx (0xFFFF)
c401: ff ff ff     stx (0xFFFF)
c404: ff ff ff     stx (0xFFFF)
c407: ff ff ff     stx (0xFFFF)
c40a: ff ff ff     stx (0xFFFF)
c40d: ff ff ff     stx (0xFFFF)
c410: ff ff ff     stx (0xFFFF)
c413: ff ff ff     stx (0xFFFF)
c416: ff ff ff     stx (0xFFFF)
c419: ff ff ff     stx (0xFFFF)
c41c: ff ff ff     stx (0xFFFF)
c41f: ff ff ff     stx (0xFFFF)
c422: ff ff ff     stx (0xFFFF)
c425: ff ff ff     stx (0xFFFF)
c428: ff ff ff     stx (0xFFFF)
c42b: ff ff ff     stx (0xFFFF)
c42e: ff ff ff     stx (0xFFFF)
c431: ff ff ff     stx (0xFFFF)
c434: ff ff ff     stx (0xFFFF)
c437: ff ff ff     stx (0xFFFF)
c43a: ff ff ff     stx (0xFFFF)
c43d: ff ff ff     stx (0xFFFF)
c440: ff ff ff     stx (0xFFFF)
c443: ff ff ff     stx (0xFFFF)
c446: ff ff ff     stx (0xFFFF)
c449: ff ff ff     stx (0xFFFF)
c44c: ff ff ff     stx (0xFFFF)
c44f: ff ff ff     stx (0xFFFF)
c452: ff ff ff     stx (0xFFFF)
c455: ff ff ff     stx (0xFFFF)
c458: ff ff ff     stx (0xFFFF)
c45b: ff ff ff     stx (0xFFFF)
c45e: ff ff ff     stx (0xFFFF)
c461: ff ff ff     stx (0xFFFF)
c464: ff ff ff     stx (0xFFFF)
c467: ff ff ff     stx (0xFFFF)
c46a: ff ff ff     stx (0xFFFF)
c46d: ff ff ff     stx (0xFFFF)
c470: ff ff ff     stx (0xFFFF)
c473: ff ff ff     stx (0xFFFF)
c476: ff ff ff     stx (0xFFFF)
c479: ff ff ff     stx (0xFFFF)
c47c: ff ff ff     stx (0xFFFF)
c47f: ff ff ff     stx (0xFFFF)
c482: ff ff ff     stx (0xFFFF)
c485: ff ff ff     stx (0xFFFF)
c488: ff ff ff     stx (0xFFFF)
c48b: ff ff ff     stx (0xFFFF)
c48e: ff ff ff     stx (0xFFFF)
c491: ff ff ff     stx (0xFFFF)
c494: ff ff ff     stx (0xFFFF)
c497: ff ff ff     stx (0xFFFF)
c49a: ff ff ff     stx (0xFFFF)
c49d: ff ff ff     stx (0xFFFF)
c4a0: ff ff ff     stx (0xFFFF)
c4a3: ff ff ff     stx (0xFFFF)
c4a6: ff ff ff     stx (0xFFFF)
c4a9: ff ff ff     stx (0xFFFF)
c4ac: ff ff ff     stx (0xFFFF)
c4af: ff ff ff     stx (0xFFFF)
c4b2: ff ff ff     stx (0xFFFF)
c4b5: ff ff ff     stx (0xFFFF)
c4b8: ff ff ff     stx (0xFFFF)
c4bb: ff ff ff     stx (0xFFFF)
c4be: ff ff ff     stx (0xFFFF)
c4c1: ff ff ff     stx (0xFFFF)
c4c4: ff ff ff     stx (0xFFFF)
c4c7: ff ff ff     stx (0xFFFF)
c4ca: ff ff ff     stx (0xFFFF)
c4cd: ff ff ff     stx (0xFFFF)
c4d0: ff ff ff     stx (0xFFFF)
c4d3: ff ff ff     stx (0xFFFF)
c4d6: ff ff ff     stx (0xFFFF)
c4d9: ff ff ff     stx (0xFFFF)
c4dc: ff ff ff     stx (0xFFFF)
c4df: ff ff ff     stx (0xFFFF)
c4e2: ff ff ff     stx (0xFFFF)
c4e5: ff ff ff     stx (0xFFFF)
c4e8: ff ff ff     stx (0xFFFF)
c4eb: ff ff ff     stx (0xFFFF)
c4ee: ff ff ff     stx (0xFFFF)
c4f1: ff ff ff     stx (0xFFFF)
c4f4: ff ff ff     stx (0xFFFF)
c4f7: ff ff ff     stx (0xFFFF)
c4fa: ff ff ff     stx (0xFFFF)
c4fd: ff ff ff     stx (0xFFFF)
c500: ff ff ff     stx (0xFFFF)
c503: ff ff ff     stx (0xFFFF)
c506: ff ff ff     stx (0xFFFF)
c509: ff ff ff     stx (0xFFFF)
c50c: ff ff ff     stx (0xFFFF)
c50f: ff ff ff     stx (0xFFFF)
c512: ff ff ff     stx (0xFFFF)
c515: ff ff ff     stx (0xFFFF)
c518: ff ff ff     stx (0xFFFF)
c51b: ff ff ff     stx (0xFFFF)
c51e: ff ff ff     stx (0xFFFF)
c521: ff ff ff     stx (0xFFFF)
c524: ff ff ff     stx (0xFFFF)
c527: ff ff ff     stx (0xFFFF)
c52a: ff ff ff     stx (0xFFFF)
c52d: ff ff ff     stx (0xFFFF)
c530: ff ff ff     stx (0xFFFF)
c533: ff ff ff     stx (0xFFFF)
c536: ff ff ff     stx (0xFFFF)
c539: ff ff ff     stx (0xFFFF)
c53c: ff ff ff     stx (0xFFFF)
c53f: ff ff ff     stx (0xFFFF)
c542: ff ff ff     stx (0xFFFF)
c545: ff ff ff     stx (0xFFFF)
c548: ff ff ff     stx (0xFFFF)
c54b: ff ff ff     stx (0xFFFF)
c54e: ff ff ff     stx (0xFFFF)
c551: ff ff ff     stx (0xFFFF)
c554: ff ff ff     stx (0xFFFF)
c557: ff ff ff     stx (0xFFFF)
c55a: ff ff ff     stx (0xFFFF)
c55d: ff ff ff     stx (0xFFFF)
c560: ff ff ff     stx (0xFFFF)
c563: ff ff ff     stx (0xFFFF)
c566: ff ff ff     stx (0xFFFF)
c569: ff ff ff     stx (0xFFFF)
c56c: ff ff ff     stx (0xFFFF)
c56f: ff ff ff     stx (0xFFFF)
c572: ff ff ff     stx (0xFFFF)
c575: ff ff ff     stx (0xFFFF)
c578: ff ff ff     stx (0xFFFF)
c57b: ff ff ff     stx (0xFFFF)
c57e: ff ff ff     stx (0xFFFF)
c581: ff ff ff     stx (0xFFFF)
c584: ff ff ff     stx (0xFFFF)
c587: ff ff ff     stx (0xFFFF)
c58a: ff ff ff     stx (0xFFFF)
c58d: ff ff ff     stx (0xFFFF)
c590: ff ff ff     stx (0xFFFF)
c593: ff ff ff     stx (0xFFFF)
c596: ff ff ff     stx (0xFFFF)
c599: ff ff ff     stx (0xFFFF)
c59c: ff ff ff     stx (0xFFFF)
c59f: ff ff ff     stx (0xFFFF)
c5a2: ff ff ff     stx (0xFFFF)
c5a5: ff ff ff     stx (0xFFFF)
c5a8: ff ff ff     stx (0xFFFF)
c5ab: ff ff ff     stx (0xFFFF)
c5ae: ff ff ff     stx (0xFFFF)
c5b1: ff ff ff     stx (0xFFFF)
c5b4: ff ff ff     stx (0xFFFF)
c5b7: ff ff ff     stx (0xFFFF)
c5ba: ff ff ff     stx (0xFFFF)
c5bd: ff ff ff     stx (0xFFFF)
c5c0: ff ff ff     stx (0xFFFF)
c5c3: ff ff ff     stx (0xFFFF)
c5c6: ff ff ff     stx (0xFFFF)
c5c9: ff ff ff     stx (0xFFFF)
c5cc: ff ff ff     stx (0xFFFF)
c5cf: ff ff ff     stx (0xFFFF)
c5d2: ff ff ff     stx (0xFFFF)
c5d5: ff ff ff     stx (0xFFFF)
c5d8: ff ff ff     stx (0xFFFF)
c5db: ff ff ff     stx (0xFFFF)
c5de: ff ff ff     stx (0xFFFF)
c5e1: ff ff ff     stx (0xFFFF)
c5e4: ff ff ff     stx (0xFFFF)
c5e7: ff ff ff     stx (0xFFFF)
c5ea: ff ff ff     stx (0xFFFF)
c5ed: ff ff ff     stx (0xFFFF)
c5f0: ff ff ff     stx (0xFFFF)
c5f3: ff ff ff     stx (0xFFFF)
c5f6: ff ff ff     stx (0xFFFF)
c5f9: ff ff ff     stx (0xFFFF)
c5fc: ff ff ff     stx (0xFFFF)
c5ff: ff ff ff     stx (0xFFFF)
c602: ff ff ff     stx (0xFFFF)
c605: ff ff ff     stx (0xFFFF)
c608: ff ff ff     stx (0xFFFF)
c60b: ff ff ff     stx (0xFFFF)
c60e: ff ff ff     stx (0xFFFF)
c611: ff ff ff     stx (0xFFFF)
c614: ff ff ff     stx (0xFFFF)
c617: ff ff ff     stx (0xFFFF)
c61a: ff ff ff     stx (0xFFFF)
c61d: ff ff ff     stx (0xFFFF)
c620: ff ff ff     stx (0xFFFF)
c623: ff ff ff     stx (0xFFFF)
c626: ff ff ff     stx (0xFFFF)
c629: ff ff ff     stx (0xFFFF)
c62c: ff ff ff     stx (0xFFFF)
c62f: ff ff ff     stx (0xFFFF)
c632: ff ff ff     stx (0xFFFF)
c635: ff ff ff     stx (0xFFFF)
c638: ff ff ff     stx (0xFFFF)
c63b: ff ff ff     stx (0xFFFF)
c63e: ff ff ff     stx (0xFFFF)
c641: ff ff ff     stx (0xFFFF)
c644: ff ff ff     stx (0xFFFF)
c647: ff ff ff     stx (0xFFFF)
c64a: ff ff ff     stx (0xFFFF)
c64d: ff ff ff     stx (0xFFFF)
c650: ff ff ff     stx (0xFFFF)
c653: ff ff ff     stx (0xFFFF)
c656: ff ff ff     stx (0xFFFF)
c659: ff ff ff     stx (0xFFFF)
c65c: ff ff ff     stx (0xFFFF)
c65f: ff ff ff     stx (0xFFFF)
c662: ff ff ff     stx (0xFFFF)
c665: ff ff ff     stx (0xFFFF)
c668: ff ff ff     stx (0xFFFF)
c66b: ff ff ff     stx (0xFFFF)
c66e: ff ff ff     stx (0xFFFF)
c671: ff ff ff     stx (0xFFFF)
c674: ff ff ff     stx (0xFFFF)
c677: ff ff ff     stx (0xFFFF)
c67a: ff ff ff     stx (0xFFFF)
c67d: ff ff ff     stx (0xFFFF)
c680: ff ff ff     stx (0xFFFF)
c683: ff ff ff     stx (0xFFFF)
c686: ff ff ff     stx (0xFFFF)
c689: ff ff ff     stx (0xFFFF)
c68c: ff ff ff     stx (0xFFFF)
c68f: ff ff ff     stx (0xFFFF)
c692: ff ff ff     stx (0xFFFF)
c695: ff ff ff     stx (0xFFFF)
c698: ff ff ff     stx (0xFFFF)
c69b: ff ff ff     stx (0xFFFF)
c69e: ff ff ff     stx (0xFFFF)
c6a1: ff ff ff     stx (0xFFFF)
c6a4: ff ff ff     stx (0xFFFF)
c6a7: ff ff ff     stx (0xFFFF)
c6aa: ff ff ff     stx (0xFFFF)
c6ad: ff ff ff     stx (0xFFFF)
c6b0: ff ff ff     stx (0xFFFF)
c6b3: ff ff ff     stx (0xFFFF)
c6b6: ff ff ff     stx (0xFFFF)
c6b9: ff ff ff     stx (0xFFFF)
c6bc: ff ff ff     stx (0xFFFF)
c6bf: ff ff ff     stx (0xFFFF)
c6c2: ff ff ff     stx (0xFFFF)
c6c5: ff ff ff     stx (0xFFFF)
c6c8: ff ff ff     stx (0xFFFF)
c6cb: ff ff ff     stx (0xFFFF)
c6ce: ff ff ff     stx (0xFFFF)
c6d1: ff ff ff     stx (0xFFFF)
c6d4: ff ff ff     stx (0xFFFF)
c6d7: ff ff ff     stx (0xFFFF)
c6da: ff ff ff     stx (0xFFFF)
c6dd: ff ff ff     stx (0xFFFF)
c6e0: ff ff ff     stx (0xFFFF)
c6e3: ff ff ff     stx (0xFFFF)
c6e6: ff ff ff     stx (0xFFFF)
c6e9: ff ff ff     stx (0xFFFF)
c6ec: ff ff ff     stx (0xFFFF)
c6ef: ff ff ff     stx (0xFFFF)
c6f2: ff ff ff     stx (0xFFFF)
c6f5: ff ff ff     stx (0xFFFF)
c6f8: ff ff ff     stx (0xFFFF)
c6fb: ff ff ff     stx (0xFFFF)
c6fe: ff ff ff     stx (0xFFFF)
c701: ff ff ff     stx (0xFFFF)
c704: ff ff ff     stx (0xFFFF)
c707: ff ff ff     stx (0xFFFF)
c70a: ff ff ff     stx (0xFFFF)
c70d: ff ff ff     stx (0xFFFF)
c710: ff ff ff     stx (0xFFFF)
c713: ff ff ff     stx (0xFFFF)
c716: ff ff ff     stx (0xFFFF)
c719: ff ff ff     stx (0xFFFF)
c71c: ff ff ff     stx (0xFFFF)
c71f: ff ff ff     stx (0xFFFF)
c722: ff ff ff     stx (0xFFFF)
c725: ff ff ff     stx (0xFFFF)
c728: ff ff ff     stx (0xFFFF)
c72b: ff ff ff     stx (0xFFFF)
c72e: ff ff ff     stx (0xFFFF)
c731: ff ff ff     stx (0xFFFF)
c734: ff ff ff     stx (0xFFFF)
c737: ff ff ff     stx (0xFFFF)
c73a: ff ff ff     stx (0xFFFF)
c73d: ff ff ff     stx (0xFFFF)
c740: ff ff ff     stx (0xFFFF)
c743: ff ff ff     stx (0xFFFF)
c746: ff ff ff     stx (0xFFFF)
c749: ff ff ff     stx (0xFFFF)
c74c: ff ff ff     stx (0xFFFF)
c74f: ff ff ff     stx (0xFFFF)
c752: ff ff ff     stx (0xFFFF)
c755: ff ff ff     stx (0xFFFF)
c758: ff ff ff     stx (0xFFFF)
c75b: ff ff ff     stx (0xFFFF)
c75e: ff ff ff     stx (0xFFFF)
c761: ff ff ff     stx (0xFFFF)
c764: ff ff ff     stx (0xFFFF)
c767: ff ff ff     stx (0xFFFF)
c76a: ff ff ff     stx (0xFFFF)
c76d: ff ff ff     stx (0xFFFF)
c770: ff ff ff     stx (0xFFFF)
c773: ff ff ff     stx (0xFFFF)
c776: ff ff ff     stx (0xFFFF)
c779: ff ff ff     stx (0xFFFF)
c77c: ff ff ff     stx (0xFFFF)
c77f: ff ff ff     stx (0xFFFF)
c782: ff ff ff     stx (0xFFFF)
c785: ff ff ff     stx (0xFFFF)
c788: ff ff ff     stx (0xFFFF)
c78b: ff ff ff     stx (0xFFFF)
c78e: ff ff ff     stx (0xFFFF)
c791: ff ff ff     stx (0xFFFF)
c794: ff ff ff     stx (0xFFFF)
c797: ff ff ff     stx (0xFFFF)
c79a: ff ff ff     stx (0xFFFF)
c79d: ff ff ff     stx (0xFFFF)
c7a0: ff ff ff     stx (0xFFFF)
c7a3: ff ff ff     stx (0xFFFF)
c7a6: ff ff ff     stx (0xFFFF)
c7a9: ff ff ff     stx (0xFFFF)
c7ac: ff ff ff     stx (0xFFFF)
c7af: ff ff ff     stx (0xFFFF)
c7b2: ff ff ff     stx (0xFFFF)
c7b5: ff ff ff     stx (0xFFFF)
c7b8: ff ff ff     stx (0xFFFF)
c7bb: ff ff ff     stx (0xFFFF)
c7be: ff ff ff     stx (0xFFFF)
c7c1: ff ff ff     stx (0xFFFF)
c7c4: ff ff ff     stx (0xFFFF)
c7c7: ff ff ff     stx (0xFFFF)
c7ca: ff ff ff     stx (0xFFFF)
c7cd: ff ff ff     stx (0xFFFF)
c7d0: ff ff ff     stx (0xFFFF)
c7d3: ff ff ff     stx (0xFFFF)
c7d6: ff ff ff     stx (0xFFFF)
c7d9: ff ff ff     stx (0xFFFF)
c7dc: ff ff ff     stx (0xFFFF)
c7df: ff ff ff     stx (0xFFFF)
c7e2: ff ff ff     stx (0xFFFF)
c7e5: ff ff ff     stx (0xFFFF)
c7e8: ff ff ff     stx (0xFFFF)
c7eb: ff ff ff     stx (0xFFFF)
c7ee: ff ff ff     stx (0xFFFF)
c7f1: ff ff ff     stx (0xFFFF)
c7f4: ff ff ff     stx (0xFFFF)
c7f7: ff ff ff     stx (0xFFFF)
c7fa: ff ff ff     stx (0xFFFF)
c7fd: ff ff ff     stx (0xFFFF)
c800: ff ff ff     stx (0xFFFF)
c803: ff ff ff     stx (0xFFFF)
c806: ff ff ff     stx (0xFFFF)
c809: ff ff ff     stx (0xFFFF)
c80c: ff ff ff     stx (0xFFFF)
c80f: ff ff ff     stx (0xFFFF)
c812: ff ff ff     stx (0xFFFF)
c815: ff ff ff     stx (0xFFFF)
c818: ff ff ff     stx (0xFFFF)
c81b: ff ff ff     stx (0xFFFF)
c81e: ff ff ff     stx (0xFFFF)
c821: ff ff ff     stx (0xFFFF)
c824: ff ff ff     stx (0xFFFF)
c827: ff ff ff     stx (0xFFFF)
c82a: ff ff ff     stx (0xFFFF)
c82d: ff ff ff     stx (0xFFFF)
c830: ff ff ff     stx (0xFFFF)
c833: ff ff ff     stx (0xFFFF)
c836: ff ff ff     stx (0xFFFF)
c839: ff ff ff     stx (0xFFFF)
c83c: ff ff ff     stx (0xFFFF)
c83f: ff ff ff     stx (0xFFFF)
c842: ff ff ff     stx (0xFFFF)
c845: ff ff ff     stx (0xFFFF)
c848: ff ff ff     stx (0xFFFF)
c84b: ff ff ff     stx (0xFFFF)
c84e: ff ff ff     stx (0xFFFF)
c851: ff ff ff     stx (0xFFFF)
c854: ff ff ff     stx (0xFFFF)
c857: ff ff ff     stx (0xFFFF)
c85a: ff ff ff     stx (0xFFFF)
c85d: ff ff ff     stx (0xFFFF)
c860: ff ff ff     stx (0xFFFF)
c863: ff ff ff     stx (0xFFFF)
c866: ff ff ff     stx (0xFFFF)
c869: ff ff ff     stx (0xFFFF)
c86c: ff ff ff     stx (0xFFFF)
c86f: ff ff ff     stx (0xFFFF)
c872: ff ff ff     stx (0xFFFF)
c875: ff ff ff     stx (0xFFFF)
c878: ff ff ff     stx (0xFFFF)
c87b: ff ff ff     stx (0xFFFF)
c87e: ff ff ff     stx (0xFFFF)
c881: ff ff ff     stx (0xFFFF)
c884: ff ff ff     stx (0xFFFF)
c887: ff ff ff     stx (0xFFFF)
c88a: ff ff ff     stx (0xFFFF)
c88d: ff ff ff     stx (0xFFFF)
c890: ff ff ff     stx (0xFFFF)
c893: ff ff ff     stx (0xFFFF)
c896: ff ff ff     stx (0xFFFF)
c899: ff ff ff     stx (0xFFFF)
c89c: ff ff ff     stx (0xFFFF)
c89f: ff ff ff     stx (0xFFFF)
c8a2: ff ff ff     stx (0xFFFF)
c8a5: ff ff ff     stx (0xFFFF)
c8a8: ff ff ff     stx (0xFFFF)
c8ab: ff ff ff     stx (0xFFFF)
c8ae: ff ff ff     stx (0xFFFF)
c8b1: ff ff ff     stx (0xFFFF)
c8b4: ff ff ff     stx (0xFFFF)
c8b7: ff ff ff     stx (0xFFFF)
c8ba: ff ff ff     stx (0xFFFF)
c8bd: ff ff ff     stx (0xFFFF)
c8c0: ff ff ff     stx (0xFFFF)
c8c3: ff ff ff     stx (0xFFFF)
c8c6: ff ff ff     stx (0xFFFF)
c8c9: ff ff ff     stx (0xFFFF)
c8cc: ff ff ff     stx (0xFFFF)
c8cf: ff ff ff     stx (0xFFFF)
c8d2: ff ff ff     stx (0xFFFF)
c8d5: ff ff ff     stx (0xFFFF)
c8d8: ff ff ff     stx (0xFFFF)
c8db: ff ff ff     stx (0xFFFF)
c8de: ff ff ff     stx (0xFFFF)
c8e1: ff ff ff     stx (0xFFFF)
c8e4: ff ff ff     stx (0xFFFF)
c8e7: ff ff ff     stx (0xFFFF)
c8ea: ff ff ff     stx (0xFFFF)
c8ed: ff ff ff     stx (0xFFFF)
c8f0: ff ff ff     stx (0xFFFF)
c8f3: ff ff ff     stx (0xFFFF)
c8f6: ff ff ff     stx (0xFFFF)
c8f9: ff ff ff     stx (0xFFFF)
c8fc: ff ff ff     stx (0xFFFF)
c8ff: ff ff ff     stx (0xFFFF)
c902: ff ff ff     stx (0xFFFF)
c905: ff ff ff     stx (0xFFFF)
c908: ff ff ff     stx (0xFFFF)
c90b: ff ff ff     stx (0xFFFF)
c90e: ff ff ff     stx (0xFFFF)
c911: ff ff ff     stx (0xFFFF)
c914: ff ff ff     stx (0xFFFF)
c917: ff ff ff     stx (0xFFFF)
c91a: ff ff ff     stx (0xFFFF)
c91d: ff ff ff     stx (0xFFFF)
c920: ff ff ff     stx (0xFFFF)
c923: ff ff ff     stx (0xFFFF)
c926: ff ff ff     stx (0xFFFF)
c929: ff ff ff     stx (0xFFFF)
c92c: ff ff ff     stx (0xFFFF)
c92f: ff ff ff     stx (0xFFFF)
c932: ff ff ff     stx (0xFFFF)
c935: ff ff ff     stx (0xFFFF)
c938: ff ff ff     stx (0xFFFF)
c93b: ff ff ff     stx (0xFFFF)
c93e: ff ff ff     stx (0xFFFF)
c941: ff ff ff     stx (0xFFFF)
c944: ff ff ff     stx (0xFFFF)
c947: ff ff ff     stx (0xFFFF)
c94a: ff ff ff     stx (0xFFFF)
c94d: ff ff ff     stx (0xFFFF)
c950: ff ff ff     stx (0xFFFF)
c953: ff ff ff     stx (0xFFFF)
c956: ff ff ff     stx (0xFFFF)
c959: ff ff ff     stx (0xFFFF)
c95c: ff ff ff     stx (0xFFFF)
c95f: ff ff ff     stx (0xFFFF)
c962: ff ff ff     stx (0xFFFF)
c965: ff ff ff     stx (0xFFFF)
c968: ff ff ff     stx (0xFFFF)
c96b: ff ff ff     stx (0xFFFF)
c96e: ff ff ff     stx (0xFFFF)
c971: ff ff ff     stx (0xFFFF)
c974: ff ff ff     stx (0xFFFF)
c977: ff ff ff     stx (0xFFFF)
c97a: ff ff ff     stx (0xFFFF)
c97d: ff ff ff     stx (0xFFFF)
c980: ff ff ff     stx (0xFFFF)
c983: ff ff ff     stx (0xFFFF)
c986: ff ff ff     stx (0xFFFF)
c989: ff ff ff     stx (0xFFFF)
c98c: ff ff ff     stx (0xFFFF)
c98f: ff ff ff     stx (0xFFFF)
c992: ff ff ff     stx (0xFFFF)
c995: ff ff ff     stx (0xFFFF)
c998: ff ff ff     stx (0xFFFF)
c99b: ff ff ff     stx (0xFFFF)
c99e: ff ff ff     stx (0xFFFF)
c9a1: ff ff ff     stx (0xFFFF)
c9a4: ff ff ff     stx (0xFFFF)
c9a7: ff ff ff     stx (0xFFFF)
c9aa: ff ff ff     stx (0xFFFF)
c9ad: ff ff ff     stx (0xFFFF)
c9b0: ff ff ff     stx (0xFFFF)
c9b3: ff ff ff     stx (0xFFFF)
c9b6: ff ff ff     stx (0xFFFF)
c9b9: ff ff ff     stx (0xFFFF)
c9bc: ff ff ff     stx (0xFFFF)
c9bf: ff ff ff     stx (0xFFFF)
c9c2: ff ff ff     stx (0xFFFF)
c9c5: ff ff ff     stx (0xFFFF)
c9c8: ff ff ff     stx (0xFFFF)
c9cb: ff ff ff     stx (0xFFFF)
c9ce: ff ff ff     stx (0xFFFF)
c9d1: ff ff ff     stx (0xFFFF)
c9d4: ff ff ff     stx (0xFFFF)
c9d7: ff ff ff     stx (0xFFFF)
c9da: ff ff ff     stx (0xFFFF)
c9dd: ff ff ff     stx (0xFFFF)
c9e0: ff ff ff     stx (0xFFFF)
c9e3: ff ff ff     stx (0xFFFF)
c9e6: ff ff ff     stx (0xFFFF)
c9e9: ff ff ff     stx (0xFFFF)
c9ec: ff ff ff     stx (0xFFFF)
c9ef: ff ff ff     stx (0xFFFF)
c9f2: ff ff ff     stx (0xFFFF)
c9f5: ff ff ff     stx (0xFFFF)
c9f8: ff ff ff     stx (0xFFFF)
c9fb: ff ff ff     stx (0xFFFF)
c9fe: ff ff ff     stx (0xFFFF)
ca01: ff ff ff     stx (0xFFFF)
ca04: ff ff ff     stx (0xFFFF)
ca07: ff ff ff     stx (0xFFFF)
ca0a: ff ff ff     stx (0xFFFF)
ca0d: ff ff ff     stx (0xFFFF)
ca10: ff ff ff     stx (0xFFFF)
ca13: ff ff ff     stx (0xFFFF)
ca16: ff ff ff     stx (0xFFFF)
ca19: ff ff ff     stx (0xFFFF)
ca1c: ff ff ff     stx (0xFFFF)
ca1f: ff ff ff     stx (0xFFFF)
ca22: ff ff ff     stx (0xFFFF)
ca25: ff ff ff     stx (0xFFFF)
ca28: ff ff ff     stx (0xFFFF)
ca2b: ff ff ff     stx (0xFFFF)
ca2e: ff ff ff     stx (0xFFFF)
ca31: ff ff ff     stx (0xFFFF)
ca34: ff ff ff     stx (0xFFFF)
ca37: ff ff ff     stx (0xFFFF)
ca3a: ff ff ff     stx (0xFFFF)
ca3d: ff ff ff     stx (0xFFFF)
ca40: ff ff ff     stx (0xFFFF)
ca43: ff ff ff     stx (0xFFFF)
ca46: ff ff ff     stx (0xFFFF)
ca49: ff ff ff     stx (0xFFFF)
ca4c: ff ff ff     stx (0xFFFF)
ca4f: ff ff ff     stx (0xFFFF)
ca52: ff ff ff     stx (0xFFFF)
ca55: ff ff ff     stx (0xFFFF)
ca58: ff ff ff     stx (0xFFFF)
ca5b: ff ff ff     stx (0xFFFF)
ca5e: ff ff ff     stx (0xFFFF)
ca61: ff ff ff     stx (0xFFFF)
ca64: ff ff ff     stx (0xFFFF)
ca67: ff ff ff     stx (0xFFFF)
ca6a: ff ff ff     stx (0xFFFF)
ca6d: ff ff ff     stx (0xFFFF)
ca70: ff ff ff     stx (0xFFFF)
ca73: ff ff ff     stx (0xFFFF)
ca76: ff ff ff     stx (0xFFFF)
ca79: ff ff ff     stx (0xFFFF)
ca7c: ff ff ff     stx (0xFFFF)
ca7f: ff ff ff     stx (0xFFFF)
ca82: ff ff ff     stx (0xFFFF)
ca85: ff ff ff     stx (0xFFFF)
ca88: ff ff ff     stx (0xFFFF)
ca8b: ff ff ff     stx (0xFFFF)
ca8e: ff ff ff     stx (0xFFFF)
ca91: ff ff ff     stx (0xFFFF)
ca94: ff ff ff     stx (0xFFFF)
ca97: ff ff ff     stx (0xFFFF)
ca9a: ff ff ff     stx (0xFFFF)
ca9d: ff ff ff     stx (0xFFFF)
caa0: ff ff ff     stx (0xFFFF)
caa3: ff ff ff     stx (0xFFFF)
caa6: ff ff ff     stx (0xFFFF)
caa9: ff ff ff     stx (0xFFFF)
caac: ff ff ff     stx (0xFFFF)
caaf: ff ff ff     stx (0xFFFF)
cab2: ff ff ff     stx (0xFFFF)
cab5: ff ff ff     stx (0xFFFF)
cab8: ff ff ff     stx (0xFFFF)
cabb: ff ff ff     stx (0xFFFF)
cabe: ff ff ff     stx (0xFFFF)
cac1: ff ff ff     stx (0xFFFF)
cac4: ff ff ff     stx (0xFFFF)
cac7: ff ff ff     stx (0xFFFF)
caca: ff ff ff     stx (0xFFFF)
cacd: ff ff ff     stx (0xFFFF)
cad0: ff ff ff     stx (0xFFFF)
cad3: ff ff ff     stx (0xFFFF)
cad6: ff ff ff     stx (0xFFFF)
cad9: ff ff ff     stx (0xFFFF)
cadc: ff ff ff     stx (0xFFFF)
cadf: ff ff ff     stx (0xFFFF)
cae2: ff ff ff     stx (0xFFFF)
cae5: ff ff ff     stx (0xFFFF)
cae8: ff ff ff     stx (0xFFFF)
caeb: ff ff ff     stx (0xFFFF)
caee: ff ff ff     stx (0xFFFF)
caf1: ff ff ff     stx (0xFFFF)
caf4: ff ff ff     stx (0xFFFF)
caf7: ff ff ff     stx (0xFFFF)
cafa: ff ff ff     stx (0xFFFF)
cafd: ff ff ff     stx (0xFFFF)
cb00: ff ff ff     stx (0xFFFF)
cb03: ff ff ff     stx (0xFFFF)
cb06: ff ff ff     stx (0xFFFF)
cb09: ff ff ff     stx (0xFFFF)
cb0c: ff ff ff     stx (0xFFFF)
cb0f: ff ff ff     stx (0xFFFF)
cb12: ff ff ff     stx (0xFFFF)
cb15: ff ff ff     stx (0xFFFF)
cb18: ff ff ff     stx (0xFFFF)
cb1b: ff ff ff     stx (0xFFFF)
cb1e: ff ff ff     stx (0xFFFF)
cb21: ff ff ff     stx (0xFFFF)
cb24: ff ff ff     stx (0xFFFF)
cb27: ff ff ff     stx (0xFFFF)
cb2a: ff ff ff     stx (0xFFFF)
cb2d: ff ff ff     stx (0xFFFF)
cb30: ff ff ff     stx (0xFFFF)
cb33: ff ff ff     stx (0xFFFF)
cb36: ff ff ff     stx (0xFFFF)
cb39: ff ff ff     stx (0xFFFF)
cb3c: ff ff ff     stx (0xFFFF)
cb3f: ff ff ff     stx (0xFFFF)
cb42: ff ff ff     stx (0xFFFF)
cb45: ff ff ff     stx (0xFFFF)
cb48: ff ff ff     stx (0xFFFF)
cb4b: ff ff ff     stx (0xFFFF)
cb4e: ff ff ff     stx (0xFFFF)
cb51: ff ff ff     stx (0xFFFF)
cb54: ff ff ff     stx (0xFFFF)
cb57: ff ff ff     stx (0xFFFF)
cb5a: ff ff ff     stx (0xFFFF)
cb5d: ff ff ff     stx (0xFFFF)
cb60: ff ff ff     stx (0xFFFF)
cb63: ff ff ff     stx (0xFFFF)
cb66: ff ff ff     stx (0xFFFF)
cb69: ff ff ff     stx (0xFFFF)
cb6c: ff ff ff     stx (0xFFFF)
cb6f: ff ff ff     stx (0xFFFF)
cb72: ff ff ff     stx (0xFFFF)
cb75: ff ff ff     stx (0xFFFF)
cb78: ff ff ff     stx (0xFFFF)
cb7b: ff ff ff     stx (0xFFFF)
cb7e: ff ff ff     stx (0xFFFF)
cb81: ff ff ff     stx (0xFFFF)
cb84: ff ff ff     stx (0xFFFF)
cb87: ff ff ff     stx (0xFFFF)
cb8a: ff ff ff     stx (0xFFFF)
cb8d: ff ff ff     stx (0xFFFF)
cb90: ff ff ff     stx (0xFFFF)
cb93: ff ff ff     stx (0xFFFF)
cb96: ff ff ff     stx (0xFFFF)
cb99: ff ff ff     stx (0xFFFF)
cb9c: ff ff ff     stx (0xFFFF)
cb9f: ff ff ff     stx (0xFFFF)
cba2: ff ff ff     stx (0xFFFF)
cba5: ff ff ff     stx (0xFFFF)
cba8: ff ff ff     stx (0xFFFF)
cbab: ff ff ff     stx (0xFFFF)
cbae: ff ff ff     stx (0xFFFF)
cbb1: ff ff ff     stx (0xFFFF)
cbb4: ff ff ff     stx (0xFFFF)
cbb7: ff ff ff     stx (0xFFFF)
cbba: ff ff ff     stx (0xFFFF)
cbbd: ff ff ff     stx (0xFFFF)
cbc0: ff ff ff     stx (0xFFFF)
cbc3: ff ff ff     stx (0xFFFF)
cbc6: ff ff ff     stx (0xFFFF)
cbc9: ff ff ff     stx (0xFFFF)
cbcc: ff ff ff     stx (0xFFFF)
cbcf: ff ff ff     stx (0xFFFF)
cbd2: ff ff ff     stx (0xFFFF)
cbd5: ff ff ff     stx (0xFFFF)
cbd8: ff ff ff     stx (0xFFFF)
cbdb: ff ff ff     stx (0xFFFF)
cbde: ff ff ff     stx (0xFFFF)
cbe1: ff ff ff     stx (0xFFFF)
cbe4: ff ff ff     stx (0xFFFF)
cbe7: ff ff ff     stx (0xFFFF)
cbea: ff ff ff     stx (0xFFFF)
cbed: ff ff ff     stx (0xFFFF)
cbf0: ff ff ff     stx (0xFFFF)
cbf3: ff ff ff     stx (0xFFFF)
cbf6: ff ff ff     stx (0xFFFF)
cbf9: ff ff ff     stx (0xFFFF)
cbfc: ff ff ff     stx (0xFFFF)
cbff: ff ff ff     stx (0xFFFF)
cc02: ff ff ff     stx (0xFFFF)
cc05: ff ff ff     stx (0xFFFF)
cc08: ff ff ff     stx (0xFFFF)
cc0b: ff ff ff     stx (0xFFFF)
cc0e: ff ff ff     stx (0xFFFF)
cc11: ff ff ff     stx (0xFFFF)
cc14: ff ff ff     stx (0xFFFF)
cc17: ff ff ff     stx (0xFFFF)
cc1a: ff ff ff     stx (0xFFFF)
cc1d: ff ff ff     stx (0xFFFF)
cc20: ff ff ff     stx (0xFFFF)
cc23: ff ff ff     stx (0xFFFF)
cc26: ff ff ff     stx (0xFFFF)
cc29: ff ff ff     stx (0xFFFF)
cc2c: ff ff ff     stx (0xFFFF)
cc2f: ff ff ff     stx (0xFFFF)
cc32: ff ff ff     stx (0xFFFF)
cc35: ff ff ff     stx (0xFFFF)
cc38: ff ff ff     stx (0xFFFF)
cc3b: ff ff ff     stx (0xFFFF)
cc3e: ff ff ff     stx (0xFFFF)
cc41: ff ff ff     stx (0xFFFF)
cc44: ff ff ff     stx (0xFFFF)
cc47: ff ff ff     stx (0xFFFF)
cc4a: ff ff ff     stx (0xFFFF)
cc4d: ff ff ff     stx (0xFFFF)
cc50: ff ff ff     stx (0xFFFF)
cc53: ff ff ff     stx (0xFFFF)
cc56: ff ff ff     stx (0xFFFF)
cc59: ff ff ff     stx (0xFFFF)
cc5c: ff ff ff     stx (0xFFFF)
cc5f: ff ff ff     stx (0xFFFF)
cc62: ff ff ff     stx (0xFFFF)
cc65: ff ff ff     stx (0xFFFF)
cc68: ff ff ff     stx (0xFFFF)
cc6b: ff ff ff     stx (0xFFFF)
cc6e: ff ff ff     stx (0xFFFF)
cc71: ff ff ff     stx (0xFFFF)
cc74: ff ff ff     stx (0xFFFF)
cc77: ff ff ff     stx (0xFFFF)
cc7a: ff ff ff     stx (0xFFFF)
cc7d: ff ff ff     stx (0xFFFF)
cc80: ff ff ff     stx (0xFFFF)
cc83: ff ff ff     stx (0xFFFF)
cc86: ff ff ff     stx (0xFFFF)
cc89: ff ff ff     stx (0xFFFF)
cc8c: ff ff ff     stx (0xFFFF)
cc8f: ff ff ff     stx (0xFFFF)
cc92: ff ff ff     stx (0xFFFF)
cc95: ff ff ff     stx (0xFFFF)
cc98: ff ff ff     stx (0xFFFF)
cc9b: ff ff ff     stx (0xFFFF)
cc9e: ff ff ff     stx (0xFFFF)
cca1: ff ff ff     stx (0xFFFF)
cca4: ff ff ff     stx (0xFFFF)
cca7: ff ff ff     stx (0xFFFF)
ccaa: ff ff ff     stx (0xFFFF)
ccad: ff ff ff     stx (0xFFFF)
ccb0: ff ff ff     stx (0xFFFF)
ccb3: ff ff ff     stx (0xFFFF)
ccb6: ff ff ff     stx (0xFFFF)
ccb9: ff ff ff     stx (0xFFFF)
ccbc: ff ff ff     stx (0xFFFF)
ccbf: ff ff ff     stx (0xFFFF)
ccc2: ff ff ff     stx (0xFFFF)
ccc5: ff ff ff     stx (0xFFFF)
ccc8: ff ff ff     stx (0xFFFF)
cccb: ff ff ff     stx (0xFFFF)
ccce: ff ff ff     stx (0xFFFF)
ccd1: ff ff ff     stx (0xFFFF)
ccd4: ff ff ff     stx (0xFFFF)
ccd7: ff ff ff     stx (0xFFFF)
ccda: ff ff ff     stx (0xFFFF)
ccdd: ff ff ff     stx (0xFFFF)
cce0: ff ff ff     stx (0xFFFF)
cce3: ff ff ff     stx (0xFFFF)
cce6: ff ff ff     stx (0xFFFF)
cce9: ff ff ff     stx (0xFFFF)
ccec: ff ff ff     stx (0xFFFF)
ccef: ff ff ff     stx (0xFFFF)
ccf2: ff ff ff     stx (0xFFFF)
ccf5: ff ff ff     stx (0xFFFF)
ccf8: ff ff ff     stx (0xFFFF)
ccfb: ff ff ff     stx (0xFFFF)
ccfe: ff ff ff     stx (0xFFFF)
cd01: ff ff ff     stx (0xFFFF)
cd04: ff ff ff     stx (0xFFFF)
cd07: ff ff ff     stx (0xFFFF)
cd0a: ff ff ff     stx (0xFFFF)
cd0d: ff ff ff     stx (0xFFFF)
cd10: ff ff ff     stx (0xFFFF)
cd13: ff ff ff     stx (0xFFFF)
cd16: ff ff ff     stx (0xFFFF)
cd19: ff ff ff     stx (0xFFFF)
cd1c: ff ff ff     stx (0xFFFF)
cd1f: ff ff ff     stx (0xFFFF)
cd22: ff ff ff     stx (0xFFFF)
cd25: ff ff ff     stx (0xFFFF)
cd28: ff ff ff     stx (0xFFFF)
cd2b: ff ff ff     stx (0xFFFF)
cd2e: ff ff ff     stx (0xFFFF)
cd31: ff ff ff     stx (0xFFFF)
cd34: ff ff ff     stx (0xFFFF)
cd37: ff ff ff     stx (0xFFFF)
cd3a: ff ff ff     stx (0xFFFF)
cd3d: ff ff ff     stx (0xFFFF)
cd40: ff ff ff     stx (0xFFFF)
cd43: ff ff ff     stx (0xFFFF)
cd46: ff ff ff     stx (0xFFFF)
cd49: ff ff ff     stx (0xFFFF)
cd4c: ff ff ff     stx (0xFFFF)
cd4f: ff ff ff     stx (0xFFFF)
cd52: ff ff ff     stx (0xFFFF)
cd55: ff ff ff     stx (0xFFFF)
cd58: ff ff ff     stx (0xFFFF)
cd5b: ff ff ff     stx (0xFFFF)
cd5e: ff ff ff     stx (0xFFFF)
cd61: ff ff ff     stx (0xFFFF)
cd64: ff ff ff     stx (0xFFFF)
cd67: ff ff ff     stx (0xFFFF)
cd6a: ff ff ff     stx (0xFFFF)
cd6d: ff ff ff     stx (0xFFFF)
cd70: ff ff ff     stx (0xFFFF)
cd73: ff ff ff     stx (0xFFFF)
cd76: ff ff ff     stx (0xFFFF)
cd79: ff ff ff     stx (0xFFFF)
cd7c: ff ff ff     stx (0xFFFF)
cd7f: ff ff ff     stx (0xFFFF)
cd82: ff ff ff     stx (0xFFFF)
cd85: ff ff ff     stx (0xFFFF)
cd88: ff ff ff     stx (0xFFFF)
cd8b: ff ff ff     stx (0xFFFF)
cd8e: ff ff ff     stx (0xFFFF)
cd91: ff ff ff     stx (0xFFFF)
cd94: ff ff ff     stx (0xFFFF)
cd97: ff ff ff     stx (0xFFFF)
cd9a: ff ff ff     stx (0xFFFF)
cd9d: ff ff ff     stx (0xFFFF)
cda0: ff ff ff     stx (0xFFFF)
cda3: ff ff ff     stx (0xFFFF)
cda6: ff ff ff     stx (0xFFFF)
cda9: ff ff ff     stx (0xFFFF)
cdac: ff ff ff     stx (0xFFFF)
cdaf: ff ff ff     stx (0xFFFF)
cdb2: ff ff ff     stx (0xFFFF)
cdb5: ff ff ff     stx (0xFFFF)
cdb8: ff ff ff     stx (0xFFFF)
cdbb: ff ff ff     stx (0xFFFF)
cdbe: ff ff ff     stx (0xFFFF)
cdc1: ff ff ff     stx (0xFFFF)
cdc4: ff ff ff     stx (0xFFFF)
cdc7: ff ff ff     stx (0xFFFF)
cdca: ff ff ff     stx (0xFFFF)
cdcd: ff ff ff     stx (0xFFFF)
cdd0: ff ff ff     stx (0xFFFF)
cdd3: ff ff ff     stx (0xFFFF)
cdd6: ff ff ff     stx (0xFFFF)
cdd9: ff ff ff     stx (0xFFFF)
cddc: ff ff ff     stx (0xFFFF)
cddf: ff ff ff     stx (0xFFFF)
cde2: ff ff ff     stx (0xFFFF)
cde5: ff ff ff     stx (0xFFFF)
cde8: ff ff ff     stx (0xFFFF)
cdeb: ff ff ff     stx (0xFFFF)
cdee: ff ff ff     stx (0xFFFF)
cdf1: ff ff ff     stx (0xFFFF)
cdf4: ff ff ff     stx (0xFFFF)
cdf7: ff ff ff     stx (0xFFFF)
cdfa: ff ff ff     stx (0xFFFF)
cdfd: ff ff ff     stx (0xFFFF)
ce00: ff ff ff     stx (0xFFFF)
ce03: ff ff ff     stx (0xFFFF)
ce06: ff ff ff     stx (0xFFFF)
ce09: ff ff ff     stx (0xFFFF)
ce0c: ff ff ff     stx (0xFFFF)
ce0f: ff ff ff     stx (0xFFFF)
ce12: ff ff ff     stx (0xFFFF)
ce15: ff ff ff     stx (0xFFFF)
ce18: ff ff ff     stx (0xFFFF)
ce1b: ff ff ff     stx (0xFFFF)
ce1e: ff ff ff     stx (0xFFFF)
ce21: ff ff ff     stx (0xFFFF)
ce24: ff ff ff     stx (0xFFFF)
ce27: ff ff ff     stx (0xFFFF)
ce2a: ff ff ff     stx (0xFFFF)
ce2d: ff ff ff     stx (0xFFFF)
ce30: ff ff ff     stx (0xFFFF)
ce33: ff ff ff     stx (0xFFFF)
ce36: ff ff ff     stx (0xFFFF)
ce39: ff ff ff     stx (0xFFFF)
ce3c: ff ff ff     stx (0xFFFF)
ce3f: ff ff ff     stx (0xFFFF)
ce42: ff ff ff     stx (0xFFFF)
ce45: ff ff ff     stx (0xFFFF)
ce48: ff ff ff     stx (0xFFFF)
ce4b: ff ff ff     stx (0xFFFF)
ce4e: ff ff ff     stx (0xFFFF)
ce51: ff ff ff     stx (0xFFFF)
ce54: ff ff ff     stx (0xFFFF)
ce57: ff ff ff     stx (0xFFFF)
ce5a: ff ff ff     stx (0xFFFF)
ce5d: ff ff ff     stx (0xFFFF)
ce60: ff ff ff     stx (0xFFFF)
ce63: ff ff ff     stx (0xFFFF)
ce66: ff ff ff     stx (0xFFFF)
ce69: ff ff ff     stx (0xFFFF)
ce6c: ff ff ff     stx (0xFFFF)
ce6f: ff ff ff     stx (0xFFFF)
ce72: ff ff ff     stx (0xFFFF)
ce75: ff ff ff     stx (0xFFFF)
ce78: ff ff ff     stx (0xFFFF)
ce7b: ff ff ff     stx (0xFFFF)
ce7e: ff ff ff     stx (0xFFFF)
ce81: ff ff ff     stx (0xFFFF)
ce84: ff ff ff     stx (0xFFFF)
ce87: ff ff ff     stx (0xFFFF)
ce8a: ff ff ff     stx (0xFFFF)
ce8d: ff ff ff     stx (0xFFFF)
ce90: ff ff ff     stx (0xFFFF)
ce93: ff ff ff     stx (0xFFFF)
ce96: ff ff ff     stx (0xFFFF)
ce99: ff ff ff     stx (0xFFFF)
ce9c: ff ff ff     stx (0xFFFF)
ce9f: ff ff ff     stx (0xFFFF)
cea2: ff ff ff     stx (0xFFFF)
cea5: ff ff ff     stx (0xFFFF)
cea8: ff ff ff     stx (0xFFFF)
ceab: ff ff ff     stx (0xFFFF)
ceae: ff ff ff     stx (0xFFFF)
ceb1: ff ff ff     stx (0xFFFF)
ceb4: ff ff ff     stx (0xFFFF)
ceb7: ff ff ff     stx (0xFFFF)
ceba: ff ff ff     stx (0xFFFF)
cebd: ff ff ff     stx (0xFFFF)
cec0: ff ff ff     stx (0xFFFF)
cec3: ff ff ff     stx (0xFFFF)
cec6: ff ff ff     stx (0xFFFF)
cec9: ff ff ff     stx (0xFFFF)
cecc: ff ff ff     stx (0xFFFF)
cecf: ff ff ff     stx (0xFFFF)
ced2: ff ff ff     stx (0xFFFF)
ced5: ff ff ff     stx (0xFFFF)
ced8: ff ff ff     stx (0xFFFF)
cedb: ff ff ff     stx (0xFFFF)
cede: ff ff ff     stx (0xFFFF)
cee1: ff ff ff     stx (0xFFFF)
cee4: ff ff ff     stx (0xFFFF)
cee7: ff ff ff     stx (0xFFFF)
ceea: ff ff ff     stx (0xFFFF)
ceed: ff ff ff     stx (0xFFFF)
cef0: ff ff ff     stx (0xFFFF)
cef3: ff ff ff     stx (0xFFFF)
cef6: ff ff ff     stx (0xFFFF)
cef9: ff ff ff     stx (0xFFFF)
cefc: ff ff ff     stx (0xFFFF)
ceff: ff ff ff     stx (0xFFFF)
cf02: ff ff ff     stx (0xFFFF)
cf05: ff ff ff     stx (0xFFFF)
cf08: ff ff ff     stx (0xFFFF)
cf0b: ff ff ff     stx (0xFFFF)
cf0e: ff ff ff     stx (0xFFFF)
cf11: ff ff ff     stx (0xFFFF)
cf14: ff ff ff     stx (0xFFFF)
cf17: ff ff ff     stx (0xFFFF)
cf1a: ff ff ff     stx (0xFFFF)
cf1d: ff ff ff     stx (0xFFFF)
cf20: ff ff ff     stx (0xFFFF)
cf23: ff ff ff     stx (0xFFFF)
cf26: ff ff ff     stx (0xFFFF)
cf29: ff ff ff     stx (0xFFFF)
cf2c: ff ff ff     stx (0xFFFF)
cf2f: ff ff ff     stx (0xFFFF)
cf32: ff ff ff     stx (0xFFFF)
cf35: ff ff ff     stx (0xFFFF)
cf38: ff ff ff     stx (0xFFFF)
cf3b: ff ff ff     stx (0xFFFF)
cf3e: ff ff ff     stx (0xFFFF)
cf41: ff ff ff     stx (0xFFFF)
cf44: ff ff ff     stx (0xFFFF)
cf47: ff ff ff     stx (0xFFFF)
cf4a: ff ff ff     stx (0xFFFF)
cf4d: ff ff ff     stx (0xFFFF)
cf50: ff ff ff     stx (0xFFFF)
cf53: ff ff ff     stx (0xFFFF)
cf56: ff ff ff     stx (0xFFFF)
cf59: ff ff ff     stx (0xFFFF)
cf5c: ff ff ff     stx (0xFFFF)
cf5f: ff ff ff     stx (0xFFFF)
cf62: ff ff ff     stx (0xFFFF)
cf65: ff ff ff     stx (0xFFFF)
cf68: ff ff ff     stx (0xFFFF)
cf6b: ff ff ff     stx (0xFFFF)
cf6e: ff ff ff     stx (0xFFFF)
cf71: ff ff ff     stx (0xFFFF)
cf74: ff ff ff     stx (0xFFFF)
cf77: ff ff ff     stx (0xFFFF)
cf7a: ff ff ff     stx (0xFFFF)
cf7d: ff ff ff     stx (0xFFFF)
cf80: ff ff ff     stx (0xFFFF)
cf83: ff ff ff     stx (0xFFFF)
cf86: ff ff ff     stx (0xFFFF)
cf89: ff ff ff     stx (0xFFFF)
cf8c: ff ff ff     stx (0xFFFF)
cf8f: ff ff ff     stx (0xFFFF)
cf92: ff ff ff     stx (0xFFFF)
cf95: ff ff ff     stx (0xFFFF)
cf98: ff ff ff     stx (0xFFFF)
cf9b: ff ff ff     stx (0xFFFF)
cf9e: ff ff ff     stx (0xFFFF)
cfa1: ff ff ff     stx (0xFFFF)
cfa4: ff ff ff     stx (0xFFFF)
cfa7: ff ff ff     stx (0xFFFF)
cfaa: ff ff ff     stx (0xFFFF)
cfad: ff ff ff     stx (0xFFFF)
cfb0: ff ff ff     stx (0xFFFF)
cfb3: ff ff ff     stx (0xFFFF)
cfb6: ff ff ff     stx (0xFFFF)
cfb9: ff ff ff     stx (0xFFFF)
cfbc: ff ff ff     stx (0xFFFF)
cfbf: ff ff ff     stx (0xFFFF)
cfc2: ff ff ff     stx (0xFFFF)
cfc5: ff ff ff     stx (0xFFFF)
cfc8: ff ff ff     stx (0xFFFF)
cfcb: ff ff ff     stx (0xFFFF)
cfce: ff ff ff     stx (0xFFFF)
cfd1: ff ff ff     stx (0xFFFF)
cfd4: ff ff ff     stx (0xFFFF)
cfd7: ff ff ff     stx (0xFFFF)
cfda: ff ff ff     stx (0xFFFF)
cfdd: ff ff ff     stx (0xFFFF)
cfe0: ff ff ff     stx (0xFFFF)
cfe3: ff ff ff     stx (0xFFFF)
cfe6: ff ff ff     stx (0xFFFF)
cfe9: ff ff ff     stx (0xFFFF)
cfec: ff ff ff     stx (0xFFFF)
cfef: ff ff ff     stx (0xFFFF)
cff2: ff ff ff     stx (0xFFFF)
cff5: ff ff ff     stx (0xFFFF)
cff8: ff ff ff     stx (0xFFFF)
cffb: ff ff ff     stx (0xFFFF)
cffe: ff ff ff     stx (0xFFFF)
d001: ff ff ff     stx (0xFFFF)
d004: ff ff ff     stx (0xFFFF)
d007: ff ff ff     stx (0xFFFF)
d00a: ff ff ff     stx (0xFFFF)
d00d: ff ff ff     stx (0xFFFF)
d010: ff ff ff     stx (0xFFFF)
d013: ff ff ff     stx (0xFFFF)
d016: ff ff ff     stx (0xFFFF)
d019: ff ff ff     stx (0xFFFF)
d01c: ff ff ff     stx (0xFFFF)
d01f: ff ff ff     stx (0xFFFF)
d022: ff ff ff     stx (0xFFFF)
d025: ff ff ff     stx (0xFFFF)
d028: ff ff ff     stx (0xFFFF)
d02b: ff ff ff     stx (0xFFFF)
d02e: ff ff ff     stx (0xFFFF)
d031: ff ff ff     stx (0xFFFF)
d034: ff ff ff     stx (0xFFFF)
d037: ff ff ff     stx (0xFFFF)
d03a: ff ff ff     stx (0xFFFF)
d03d: ff ff ff     stx (0xFFFF)
d040: ff ff ff     stx (0xFFFF)
d043: ff ff ff     stx (0xFFFF)
d046: ff ff ff     stx (0xFFFF)
d049: ff ff ff     stx (0xFFFF)
d04c: ff ff ff     stx (0xFFFF)
d04f: ff ff ff     stx (0xFFFF)
d052: ff ff ff     stx (0xFFFF)
d055: ff ff ff     stx (0xFFFF)
d058: ff ff ff     stx (0xFFFF)
d05b: ff ff ff     stx (0xFFFF)
d05e: ff ff ff     stx (0xFFFF)
d061: ff ff ff     stx (0xFFFF)
d064: ff ff ff     stx (0xFFFF)
d067: ff ff ff     stx (0xFFFF)
d06a: ff ff ff     stx (0xFFFF)
d06d: ff ff ff     stx (0xFFFF)
d070: ff ff ff     stx (0xFFFF)
d073: ff ff ff     stx (0xFFFF)
d076: ff ff ff     stx (0xFFFF)
d079: ff ff ff     stx (0xFFFF)
d07c: ff ff ff     stx (0xFFFF)
d07f: ff ff ff     stx (0xFFFF)
d082: ff ff ff     stx (0xFFFF)
d085: ff ff ff     stx (0xFFFF)
d088: ff ff ff     stx (0xFFFF)
d08b: ff ff ff     stx (0xFFFF)
d08e: ff ff ff     stx (0xFFFF)
d091: ff ff ff     stx (0xFFFF)
d094: ff ff ff     stx (0xFFFF)
d097: ff ff ff     stx (0xFFFF)
d09a: ff ff ff     stx (0xFFFF)
d09d: ff ff ff     stx (0xFFFF)
d0a0: ff ff ff     stx (0xFFFF)
d0a3: ff ff ff     stx (0xFFFF)
d0a6: ff ff ff     stx (0xFFFF)
d0a9: ff ff ff     stx (0xFFFF)
d0ac: ff ff ff     stx (0xFFFF)
d0af: ff ff ff     stx (0xFFFF)
d0b2: ff ff ff     stx (0xFFFF)
d0b5: ff ff ff     stx (0xFFFF)
d0b8: ff ff ff     stx (0xFFFF)
d0bb: ff ff ff     stx (0xFFFF)
d0be: ff ff ff     stx (0xFFFF)
d0c1: ff ff ff     stx (0xFFFF)
d0c4: ff ff ff     stx (0xFFFF)
d0c7: ff ff ff     stx (0xFFFF)
d0ca: ff ff ff     stx (0xFFFF)
d0cd: ff ff ff     stx (0xFFFF)
d0d0: ff ff ff     stx (0xFFFF)
d0d3: ff ff ff     stx (0xFFFF)
d0d6: ff ff ff     stx (0xFFFF)
d0d9: ff ff ff     stx (0xFFFF)
d0dc: ff ff ff     stx (0xFFFF)
d0df: ff ff ff     stx (0xFFFF)
d0e2: ff ff ff     stx (0xFFFF)
d0e5: ff ff ff     stx (0xFFFF)
d0e8: ff ff ff     stx (0xFFFF)
d0eb: ff ff ff     stx (0xFFFF)
d0ee: ff ff ff     stx (0xFFFF)
d0f1: ff ff ff     stx (0xFFFF)
d0f4: ff ff ff     stx (0xFFFF)
d0f7: ff ff ff     stx (0xFFFF)
d0fa: ff ff ff     stx (0xFFFF)
d0fd: ff ff ff     stx (0xFFFF)
d100: ff ff ff     stx (0xFFFF)
d103: ff ff ff     stx (0xFFFF)
d106: ff ff ff     stx (0xFFFF)
d109: ff ff ff     stx (0xFFFF)
d10c: ff ff ff     stx (0xFFFF)
d10f: ff ff ff     stx (0xFFFF)
d112: ff ff ff     stx (0xFFFF)
d115: ff ff ff     stx (0xFFFF)
d118: ff ff ff     stx (0xFFFF)
d11b: ff ff ff     stx (0xFFFF)
d11e: ff ff ff     stx (0xFFFF)
d121: ff ff ff     stx (0xFFFF)
d124: ff ff ff     stx (0xFFFF)
d127: ff ff ff     stx (0xFFFF)
d12a: ff ff ff     stx (0xFFFF)
d12d: ff ff ff     stx (0xFFFF)
d130: ff ff ff     stx (0xFFFF)
d133: ff ff ff     stx (0xFFFF)
d136: ff ff ff     stx (0xFFFF)
d139: ff ff ff     stx (0xFFFF)
d13c: ff ff ff     stx (0xFFFF)
d13f: ff ff ff     stx (0xFFFF)
d142: ff ff ff     stx (0xFFFF)
d145: ff ff ff     stx (0xFFFF)
d148: ff ff ff     stx (0xFFFF)
d14b: ff ff ff     stx (0xFFFF)
d14e: ff ff ff     stx (0xFFFF)
d151: ff ff ff     stx (0xFFFF)
d154: ff ff ff     stx (0xFFFF)
d157: ff ff ff     stx (0xFFFF)
d15a: ff ff ff     stx (0xFFFF)
d15d: ff ff ff     stx (0xFFFF)
d160: ff ff ff     stx (0xFFFF)
d163: ff ff ff     stx (0xFFFF)
d166: ff ff ff     stx (0xFFFF)
d169: ff ff ff     stx (0xFFFF)
d16c: ff ff ff     stx (0xFFFF)
d16f: ff ff ff     stx (0xFFFF)
d172: ff ff ff     stx (0xFFFF)
d175: ff ff ff     stx (0xFFFF)
d178: ff ff ff     stx (0xFFFF)
d17b: ff ff ff     stx (0xFFFF)
d17e: ff ff ff     stx (0xFFFF)
d181: ff ff ff     stx (0xFFFF)
d184: ff ff ff     stx (0xFFFF)
d187: ff ff ff     stx (0xFFFF)
d18a: ff ff ff     stx (0xFFFF)
d18d: ff ff ff     stx (0xFFFF)
d190: ff ff ff     stx (0xFFFF)
d193: ff ff ff     stx (0xFFFF)
d196: ff ff ff     stx (0xFFFF)
d199: ff ff ff     stx (0xFFFF)
d19c: ff ff ff     stx (0xFFFF)
d19f: ff ff ff     stx (0xFFFF)
d1a2: ff ff ff     stx (0xFFFF)
d1a5: ff ff ff     stx (0xFFFF)
d1a8: ff ff ff     stx (0xFFFF)
d1ab: ff ff ff     stx (0xFFFF)
d1ae: ff ff ff     stx (0xFFFF)
d1b1: ff ff ff     stx (0xFFFF)
d1b4: ff ff ff     stx (0xFFFF)
d1b7: ff ff ff     stx (0xFFFF)
d1ba: ff ff ff     stx (0xFFFF)
d1bd: ff ff ff     stx (0xFFFF)
d1c0: ff ff ff     stx (0xFFFF)
d1c3: ff ff ff     stx (0xFFFF)
d1c6: ff ff ff     stx (0xFFFF)
d1c9: ff ff ff     stx (0xFFFF)
d1cc: ff ff ff     stx (0xFFFF)
d1cf: ff ff ff     stx (0xFFFF)
d1d2: ff ff ff     stx (0xFFFF)
d1d5: ff ff ff     stx (0xFFFF)
d1d8: ff ff ff     stx (0xFFFF)
d1db: ff ff ff     stx (0xFFFF)
d1de: ff ff ff     stx (0xFFFF)
d1e1: ff ff ff     stx (0xFFFF)
d1e4: ff ff ff     stx (0xFFFF)
d1e7: ff ff ff     stx (0xFFFF)
d1ea: ff ff ff     stx (0xFFFF)
d1ed: ff ff ff     stx (0xFFFF)
d1f0: ff ff ff     stx (0xFFFF)
d1f3: ff ff ff     stx (0xFFFF)
d1f6: ff ff ff     stx (0xFFFF)
d1f9: ff ff ff     stx (0xFFFF)
d1fc: ff ff ff     stx (0xFFFF)
d1ff: ff ff ff     stx (0xFFFF)
d202: ff ff ff     stx (0xFFFF)
d205: ff ff ff     stx (0xFFFF)
d208: ff ff ff     stx (0xFFFF)
d20b: ff ff ff     stx (0xFFFF)
d20e: ff ff ff     stx (0xFFFF)
d211: ff ff ff     stx (0xFFFF)
d214: ff ff ff     stx (0xFFFF)
d217: ff ff ff     stx (0xFFFF)
d21a: ff ff ff     stx (0xFFFF)
d21d: ff ff ff     stx (0xFFFF)
d220: ff ff ff     stx (0xFFFF)
d223: ff ff ff     stx (0xFFFF)
d226: ff ff ff     stx (0xFFFF)
d229: ff ff ff     stx (0xFFFF)
d22c: ff ff ff     stx (0xFFFF)
d22f: ff ff ff     stx (0xFFFF)
d232: ff ff ff     stx (0xFFFF)
d235: ff ff ff     stx (0xFFFF)
d238: ff ff ff     stx (0xFFFF)
d23b: ff ff ff     stx (0xFFFF)
d23e: ff ff ff     stx (0xFFFF)
d241: ff ff ff     stx (0xFFFF)
d244: ff ff ff     stx (0xFFFF)
d247: ff ff ff     stx (0xFFFF)
d24a: ff ff ff     stx (0xFFFF)
d24d: ff ff ff     stx (0xFFFF)
d250: ff ff ff     stx (0xFFFF)
d253: ff ff ff     stx (0xFFFF)
d256: ff ff ff     stx (0xFFFF)
d259: ff ff ff     stx (0xFFFF)
d25c: ff ff ff     stx (0xFFFF)
d25f: ff ff ff     stx (0xFFFF)
d262: ff ff ff     stx (0xFFFF)
d265: ff ff ff     stx (0xFFFF)
d268: ff ff ff     stx (0xFFFF)
d26b: ff ff ff     stx (0xFFFF)
d26e: ff ff ff     stx (0xFFFF)
d271: ff ff ff     stx (0xFFFF)
d274: ff ff ff     stx (0xFFFF)
d277: ff ff ff     stx (0xFFFF)
d27a: ff ff ff     stx (0xFFFF)
d27d: ff ff ff     stx (0xFFFF)
d280: ff ff ff     stx (0xFFFF)
d283: ff ff ff     stx (0xFFFF)
d286: ff ff ff     stx (0xFFFF)
d289: ff ff ff     stx (0xFFFF)
d28c: ff ff ff     stx (0xFFFF)
d28f: ff ff ff     stx (0xFFFF)
d292: ff ff ff     stx (0xFFFF)
d295: ff ff ff     stx (0xFFFF)
d298: ff ff ff     stx (0xFFFF)
d29b: ff ff ff     stx (0xFFFF)
d29e: ff ff ff     stx (0xFFFF)
d2a1: ff ff ff     stx (0xFFFF)
d2a4: ff ff ff     stx (0xFFFF)
d2a7: ff ff ff     stx (0xFFFF)
d2aa: ff ff ff     stx (0xFFFF)
d2ad: ff ff ff     stx (0xFFFF)
d2b0: ff ff ff     stx (0xFFFF)
d2b3: ff ff ff     stx (0xFFFF)
d2b6: ff ff ff     stx (0xFFFF)
d2b9: ff ff ff     stx (0xFFFF)
d2bc: ff ff ff     stx (0xFFFF)
d2bf: ff ff ff     stx (0xFFFF)
d2c2: ff ff ff     stx (0xFFFF)
d2c5: ff ff ff     stx (0xFFFF)
d2c8: ff ff ff     stx (0xFFFF)
d2cb: ff ff ff     stx (0xFFFF)
d2ce: ff ff ff     stx (0xFFFF)
d2d1: ff ff ff     stx (0xFFFF)
d2d4: ff ff ff     stx (0xFFFF)
d2d7: ff ff ff     stx (0xFFFF)
d2da: ff ff ff     stx (0xFFFF)
d2dd: ff ff ff     stx (0xFFFF)
d2e0: ff ff ff     stx (0xFFFF)
d2e3: ff ff ff     stx (0xFFFF)
d2e6: ff ff ff     stx (0xFFFF)
d2e9: ff ff ff     stx (0xFFFF)
d2ec: ff ff ff     stx (0xFFFF)
d2ef: ff ff ff     stx (0xFFFF)
d2f2: ff ff ff     stx (0xFFFF)
d2f5: ff ff ff     stx (0xFFFF)
d2f8: ff ff ff     stx (0xFFFF)
d2fb: ff ff ff     stx (0xFFFF)
d2fe: ff ff ff     stx (0xFFFF)
d301: ff ff ff     stx (0xFFFF)
d304: ff ff ff     stx (0xFFFF)
d307: ff ff ff     stx (0xFFFF)
d30a: ff ff ff     stx (0xFFFF)
d30d: ff ff ff     stx (0xFFFF)
d310: ff ff ff     stx (0xFFFF)
d313: ff ff ff     stx (0xFFFF)
d316: ff ff ff     stx (0xFFFF)
d319: ff ff ff     stx (0xFFFF)
d31c: ff ff ff     stx (0xFFFF)
d31f: ff ff ff     stx (0xFFFF)
d322: ff ff ff     stx (0xFFFF)
d325: ff ff ff     stx (0xFFFF)
d328: ff ff ff     stx (0xFFFF)
d32b: ff ff ff     stx (0xFFFF)
d32e: ff ff ff     stx (0xFFFF)
d331: ff ff ff     stx (0xFFFF)
d334: ff ff ff     stx (0xFFFF)
d337: ff ff ff     stx (0xFFFF)
d33a: ff ff ff     stx (0xFFFF)
d33d: ff ff ff     stx (0xFFFF)
d340: ff ff ff     stx (0xFFFF)
d343: ff ff ff     stx (0xFFFF)
d346: ff ff ff     stx (0xFFFF)
d349: ff ff ff     stx (0xFFFF)
d34c: ff ff ff     stx (0xFFFF)
d34f: ff ff ff     stx (0xFFFF)
d352: ff ff ff     stx (0xFFFF)
d355: ff ff ff     stx (0xFFFF)
d358: ff ff ff     stx (0xFFFF)
d35b: ff ff ff     stx (0xFFFF)
d35e: ff ff ff     stx (0xFFFF)
d361: ff ff ff     stx (0xFFFF)
d364: ff ff ff     stx (0xFFFF)
d367: ff ff ff     stx (0xFFFF)
d36a: ff ff ff     stx (0xFFFF)
d36d: ff ff ff     stx (0xFFFF)
d370: ff ff ff     stx (0xFFFF)
d373: ff ff ff     stx (0xFFFF)
d376: ff ff ff     stx (0xFFFF)
d379: ff ff ff     stx (0xFFFF)
d37c: ff ff ff     stx (0xFFFF)
d37f: ff ff ff     stx (0xFFFF)
d382: ff ff ff     stx (0xFFFF)
d385: ff ff ff     stx (0xFFFF)
d388: ff ff ff     stx (0xFFFF)
d38b: ff ff ff     stx (0xFFFF)
d38e: ff ff ff     stx (0xFFFF)
d391: ff ff ff     stx (0xFFFF)
d394: ff ff ff     stx (0xFFFF)
d397: ff ff ff     stx (0xFFFF)
d39a: ff ff ff     stx (0xFFFF)
d39d: ff ff ff     stx (0xFFFF)
d3a0: ff ff ff     stx (0xFFFF)
d3a3: ff ff ff     stx (0xFFFF)
d3a6: ff ff ff     stx (0xFFFF)
d3a9: ff ff ff     stx (0xFFFF)
d3ac: ff ff ff     stx (0xFFFF)
d3af: ff ff ff     stx (0xFFFF)
d3b2: ff ff ff     stx (0xFFFF)
d3b5: ff ff ff     stx (0xFFFF)
d3b8: ff ff ff     stx (0xFFFF)
d3bb: ff ff ff     stx (0xFFFF)
d3be: ff ff ff     stx (0xFFFF)
d3c1: ff ff ff     stx (0xFFFF)
d3c4: ff ff ff     stx (0xFFFF)
d3c7: ff ff ff     stx (0xFFFF)
d3ca: ff ff ff     stx (0xFFFF)
d3cd: ff ff ff     stx (0xFFFF)
d3d0: ff ff ff     stx (0xFFFF)
d3d3: ff ff ff     stx (0xFFFF)
d3d6: ff ff ff     stx (0xFFFF)
d3d9: ff ff ff     stx (0xFFFF)
d3dc: ff ff ff     stx (0xFFFF)
d3df: ff ff ff     stx (0xFFFF)
d3e2: ff ff ff     stx (0xFFFF)
d3e5: ff ff ff     stx (0xFFFF)
d3e8: ff ff ff     stx (0xFFFF)
d3eb: ff ff ff     stx (0xFFFF)
d3ee: ff ff ff     stx (0xFFFF)
d3f1: ff ff ff     stx (0xFFFF)
d3f4: ff ff ff     stx (0xFFFF)
d3f7: ff ff ff     stx (0xFFFF)
d3fa: ff ff ff     stx (0xFFFF)
d3fd: ff ff ff     stx (0xFFFF)
d400: ff ff ff     stx (0xFFFF)
d403: ff ff ff     stx (0xFFFF)
d406: ff ff ff     stx (0xFFFF)
d409: ff ff ff     stx (0xFFFF)
d40c: ff ff ff     stx (0xFFFF)
d40f: ff ff ff     stx (0xFFFF)
d412: ff ff ff     stx (0xFFFF)
d415: ff ff ff     stx (0xFFFF)
d418: ff ff ff     stx (0xFFFF)
d41b: ff ff ff     stx (0xFFFF)
d41e: ff ff ff     stx (0xFFFF)
d421: ff ff ff     stx (0xFFFF)
d424: ff ff ff     stx (0xFFFF)
d427: ff ff ff     stx (0xFFFF)
d42a: ff ff ff     stx (0xFFFF)
d42d: ff ff ff     stx (0xFFFF)
d430: ff ff ff     stx (0xFFFF)
d433: ff ff ff     stx (0xFFFF)
d436: ff ff ff     stx (0xFFFF)
d439: ff ff ff     stx (0xFFFF)
d43c: ff ff ff     stx (0xFFFF)
d43f: ff ff ff     stx (0xFFFF)
d442: ff ff ff     stx (0xFFFF)
d445: ff ff ff     stx (0xFFFF)
d448: ff ff ff     stx (0xFFFF)
d44b: ff ff ff     stx (0xFFFF)
d44e: ff ff ff     stx (0xFFFF)
d451: ff ff ff     stx (0xFFFF)
d454: ff ff ff     stx (0xFFFF)
d457: ff ff ff     stx (0xFFFF)
d45a: ff ff ff     stx (0xFFFF)
d45d: ff ff ff     stx (0xFFFF)
d460: ff ff ff     stx (0xFFFF)
d463: ff ff ff     stx (0xFFFF)
d466: ff ff ff     stx (0xFFFF)
d469: ff ff ff     stx (0xFFFF)
d46c: ff ff ff     stx (0xFFFF)
d46f: ff ff ff     stx (0xFFFF)
d472: ff ff ff     stx (0xFFFF)
d475: ff ff ff     stx (0xFFFF)
d478: ff ff ff     stx (0xFFFF)
d47b: ff ff ff     stx (0xFFFF)
d47e: ff ff ff     stx (0xFFFF)
d481: ff ff ff     stx (0xFFFF)
d484: ff ff ff     stx (0xFFFF)
d487: ff ff ff     stx (0xFFFF)
d48a: ff ff ff     stx (0xFFFF)
d48d: ff ff ff     stx (0xFFFF)
d490: ff ff ff     stx (0xFFFF)
d493: ff ff ff     stx (0xFFFF)
d496: ff ff ff     stx (0xFFFF)
d499: ff ff ff     stx (0xFFFF)
d49c: ff ff ff     stx (0xFFFF)
d49f: ff ff ff     stx (0xFFFF)
d4a2: ff ff ff     stx (0xFFFF)
d4a5: ff ff ff     stx (0xFFFF)
d4a8: ff ff ff     stx (0xFFFF)
d4ab: ff ff ff     stx (0xFFFF)
d4ae: ff ff ff     stx (0xFFFF)
d4b1: ff ff ff     stx (0xFFFF)
d4b4: ff ff ff     stx (0xFFFF)
d4b7: ff ff ff     stx (0xFFFF)
d4ba: ff ff ff     stx (0xFFFF)
d4bd: ff ff ff     stx (0xFFFF)
d4c0: ff ff ff     stx (0xFFFF)
d4c3: ff ff ff     stx (0xFFFF)
d4c6: ff ff ff     stx (0xFFFF)
d4c9: ff ff ff     stx (0xFFFF)
d4cc: ff ff ff     stx (0xFFFF)
d4cf: ff ff ff     stx (0xFFFF)
d4d2: ff ff ff     stx (0xFFFF)
d4d5: ff ff ff     stx (0xFFFF)
d4d8: ff ff ff     stx (0xFFFF)
d4db: ff ff ff     stx (0xFFFF)
d4de: ff ff ff     stx (0xFFFF)
d4e1: ff ff ff     stx (0xFFFF)
d4e4: ff ff ff     stx (0xFFFF)
d4e7: ff ff ff     stx (0xFFFF)
d4ea: ff ff ff     stx (0xFFFF)
d4ed: ff ff ff     stx (0xFFFF)
d4f0: ff ff ff     stx (0xFFFF)
d4f3: ff ff ff     stx (0xFFFF)
d4f6: ff ff ff     stx (0xFFFF)
d4f9: ff ff ff     stx (0xFFFF)
d4fc: ff ff ff     stx (0xFFFF)
d4ff: ff ff ff     stx (0xFFFF)
d502: ff ff ff     stx (0xFFFF)
d505: ff ff ff     stx (0xFFFF)
d508: ff ff ff     stx (0xFFFF)
d50b: ff ff ff     stx (0xFFFF)
d50e: ff ff ff     stx (0xFFFF)
d511: ff ff ff     stx (0xFFFF)
d514: ff ff ff     stx (0xFFFF)
d517: ff ff ff     stx (0xFFFF)
d51a: ff ff ff     stx (0xFFFF)
d51d: ff ff ff     stx (0xFFFF)
d520: ff ff ff     stx (0xFFFF)
d523: ff ff ff     stx (0xFFFF)
d526: ff ff ff     stx (0xFFFF)
d529: ff ff ff     stx (0xFFFF)
d52c: ff ff ff     stx (0xFFFF)
d52f: ff ff ff     stx (0xFFFF)
d532: ff ff ff     stx (0xFFFF)
d535: ff ff ff     stx (0xFFFF)
d538: ff ff ff     stx (0xFFFF)
d53b: ff ff ff     stx (0xFFFF)
d53e: ff ff ff     stx (0xFFFF)
d541: ff ff ff     stx (0xFFFF)
d544: ff ff ff     stx (0xFFFF)
d547: ff ff ff     stx (0xFFFF)
d54a: ff ff ff     stx (0xFFFF)
d54d: ff ff ff     stx (0xFFFF)
d550: ff ff ff     stx (0xFFFF)
d553: ff ff ff     stx (0xFFFF)
d556: ff ff ff     stx (0xFFFF)
d559: ff ff ff     stx (0xFFFF)
d55c: ff ff ff     stx (0xFFFF)
d55f: ff ff ff     stx (0xFFFF)
d562: ff ff ff     stx (0xFFFF)
d565: ff ff ff     stx (0xFFFF)
d568: ff ff ff     stx (0xFFFF)
d56b: ff ff ff     stx (0xFFFF)
d56e: ff ff ff     stx (0xFFFF)
d571: ff ff ff     stx (0xFFFF)
d574: ff ff ff     stx (0xFFFF)
d577: ff ff ff     stx (0xFFFF)
d57a: ff ff ff     stx (0xFFFF)
d57d: ff ff ff     stx (0xFFFF)
d580: ff ff ff     stx (0xFFFF)
d583: ff ff ff     stx (0xFFFF)
d586: ff ff ff     stx (0xFFFF)
d589: ff ff ff     stx (0xFFFF)
d58c: ff ff ff     stx (0xFFFF)
d58f: ff ff ff     stx (0xFFFF)
d592: ff ff ff     stx (0xFFFF)
d595: ff ff ff     stx (0xFFFF)
d598: ff ff ff     stx (0xFFFF)
d59b: ff ff ff     stx (0xFFFF)
d59e: ff ff ff     stx (0xFFFF)
d5a1: ff ff ff     stx (0xFFFF)
d5a4: ff ff ff     stx (0xFFFF)
d5a7: ff ff ff     stx (0xFFFF)
d5aa: ff ff ff     stx (0xFFFF)
d5ad: ff ff ff     stx (0xFFFF)
d5b0: ff ff ff     stx (0xFFFF)
d5b3: ff ff ff     stx (0xFFFF)
d5b6: ff ff ff     stx (0xFFFF)
d5b9: ff ff ff     stx (0xFFFF)
d5bc: ff ff ff     stx (0xFFFF)
d5bf: ff ff ff     stx (0xFFFF)
d5c2: ff ff ff     stx (0xFFFF)
d5c5: ff ff ff     stx (0xFFFF)
d5c8: ff ff ff     stx (0xFFFF)
d5cb: ff ff ff     stx (0xFFFF)
d5ce: ff ff ff     stx (0xFFFF)
d5d1: ff ff ff     stx (0xFFFF)
d5d4: ff ff ff     stx (0xFFFF)
d5d7: ff ff ff     stx (0xFFFF)
d5da: ff ff ff     stx (0xFFFF)
d5dd: ff ff ff     stx (0xFFFF)
d5e0: ff ff ff     stx (0xFFFF)
d5e3: ff ff ff     stx (0xFFFF)
d5e6: ff ff ff     stx (0xFFFF)
d5e9: ff ff ff     stx (0xFFFF)
d5ec: ff ff ff     stx (0xFFFF)
d5ef: ff ff ff     stx (0xFFFF)
d5f2: ff ff ff     stx (0xFFFF)
d5f5: ff ff ff     stx (0xFFFF)
d5f8: ff ff ff     stx (0xFFFF)
d5fb: ff ff ff     stx (0xFFFF)
d5fe: ff ff ff     stx (0xFFFF)
d601: ff ff ff     stx (0xFFFF)
d604: ff ff ff     stx (0xFFFF)
d607: ff ff ff     stx (0xFFFF)
d60a: ff ff ff     stx (0xFFFF)
d60d: ff ff ff     stx (0xFFFF)
d610: ff ff ff     stx (0xFFFF)
d613: ff ff ff     stx (0xFFFF)
d616: ff ff ff     stx (0xFFFF)
d619: ff ff ff     stx (0xFFFF)
d61c: ff ff ff     stx (0xFFFF)
d61f: ff ff ff     stx (0xFFFF)
d622: ff ff ff     stx (0xFFFF)
d625: ff ff ff     stx (0xFFFF)
d628: ff ff ff     stx (0xFFFF)
d62b: ff ff ff     stx (0xFFFF)
d62e: ff ff ff     stx (0xFFFF)
d631: ff ff ff     stx (0xFFFF)
d634: ff ff ff     stx (0xFFFF)
d637: ff ff ff     stx (0xFFFF)
d63a: ff ff ff     stx (0xFFFF)
d63d: ff ff ff     stx (0xFFFF)
d640: ff ff ff     stx (0xFFFF)
d643: ff ff ff     stx (0xFFFF)
d646: ff ff ff     stx (0xFFFF)
d649: ff ff ff     stx (0xFFFF)
d64c: ff ff ff     stx (0xFFFF)
d64f: ff ff ff     stx (0xFFFF)
d652: ff ff ff     stx (0xFFFF)
d655: ff ff ff     stx (0xFFFF)
d658: ff ff ff     stx (0xFFFF)
d65b: ff ff ff     stx (0xFFFF)
d65e: ff ff ff     stx (0xFFFF)
d661: ff ff ff     stx (0xFFFF)
d664: ff ff ff     stx (0xFFFF)
d667: ff ff ff     stx (0xFFFF)
d66a: ff ff ff     stx (0xFFFF)
d66d: ff ff ff     stx (0xFFFF)
d670: ff ff ff     stx (0xFFFF)
d673: ff ff ff     stx (0xFFFF)
d676: ff ff ff     stx (0xFFFF)
d679: ff ff ff     stx (0xFFFF)
d67c: ff ff ff     stx (0xFFFF)
d67f: ff ff ff     stx (0xFFFF)
d682: ff ff ff     stx (0xFFFF)
d685: ff ff ff     stx (0xFFFF)
d688: ff ff ff     stx (0xFFFF)
d68b: ff ff ff     stx (0xFFFF)
d68e: ff ff ff     stx (0xFFFF)
d691: ff ff ff     stx (0xFFFF)
d694: ff ff ff     stx (0xFFFF)
d697: ff ff ff     stx (0xFFFF)
d69a: ff ff ff     stx (0xFFFF)
d69d: ff ff ff     stx (0xFFFF)
d6a0: ff ff ff     stx (0xFFFF)
d6a3: ff ff ff     stx (0xFFFF)
d6a6: ff ff ff     stx (0xFFFF)
d6a9: ff ff ff     stx (0xFFFF)
d6ac: ff ff ff     stx (0xFFFF)
d6af: ff ff ff     stx (0xFFFF)
d6b2: ff ff ff     stx (0xFFFF)
d6b5: ff ff ff     stx (0xFFFF)
d6b8: ff ff ff     stx (0xFFFF)
d6bb: ff ff ff     stx (0xFFFF)
d6be: ff ff ff     stx (0xFFFF)
d6c1: ff ff ff     stx (0xFFFF)
d6c4: ff ff ff     stx (0xFFFF)
d6c7: ff ff ff     stx (0xFFFF)
d6ca: ff ff ff     stx (0xFFFF)
d6cd: ff ff ff     stx (0xFFFF)
d6d0: ff ff ff     stx (0xFFFF)
d6d3: ff ff ff     stx (0xFFFF)
d6d6: ff ff ff     stx (0xFFFF)
d6d9: ff ff ff     stx (0xFFFF)
d6dc: ff ff ff     stx (0xFFFF)
d6df: ff ff ff     stx (0xFFFF)
d6e2: ff ff ff     stx (0xFFFF)
d6e5: ff ff ff     stx (0xFFFF)
d6e8: ff ff ff     stx (0xFFFF)
d6eb: ff ff ff     stx (0xFFFF)
d6ee: ff ff ff     stx (0xFFFF)
d6f1: ff ff ff     stx (0xFFFF)
d6f4: ff ff ff     stx (0xFFFF)
d6f7: ff ff ff     stx (0xFFFF)
d6fa: ff ff ff     stx (0xFFFF)
d6fd: ff ff ff     stx (0xFFFF)
d700: ff ff ff     stx (0xFFFF)
d703: ff ff ff     stx (0xFFFF)
d706: ff ff ff     stx (0xFFFF)
d709: ff ff ff     stx (0xFFFF)
d70c: ff ff ff     stx (0xFFFF)
d70f: ff ff ff     stx (0xFFFF)
d712: ff ff ff     stx (0xFFFF)
d715: ff ff ff     stx (0xFFFF)
d718: ff ff ff     stx (0xFFFF)
d71b: ff ff ff     stx (0xFFFF)
d71e: ff ff ff     stx (0xFFFF)
d721: ff ff ff     stx (0xFFFF)
d724: ff ff ff     stx (0xFFFF)
d727: ff ff ff     stx (0xFFFF)
d72a: ff ff ff     stx (0xFFFF)
d72d: ff ff ff     stx (0xFFFF)
d730: ff ff ff     stx (0xFFFF)
d733: ff ff ff     stx (0xFFFF)
d736: ff ff ff     stx (0xFFFF)
d739: ff ff ff     stx (0xFFFF)
d73c: ff ff ff     stx (0xFFFF)
d73f: ff ff ff     stx (0xFFFF)
d742: ff ff ff     stx (0xFFFF)
d745: ff ff ff     stx (0xFFFF)
d748: ff ff ff     stx (0xFFFF)
d74b: ff ff ff     stx (0xFFFF)
d74e: ff ff ff     stx (0xFFFF)
d751: ff ff ff     stx (0xFFFF)
d754: ff ff ff     stx (0xFFFF)
d757: ff ff ff     stx (0xFFFF)
d75a: ff ff ff     stx (0xFFFF)
d75d: ff ff ff     stx (0xFFFF)
d760: ff ff ff     stx (0xFFFF)
d763: ff ff ff     stx (0xFFFF)
d766: ff ff ff     stx (0xFFFF)
d769: ff ff ff     stx (0xFFFF)
d76c: ff ff ff     stx (0xFFFF)
d76f: ff ff ff     stx (0xFFFF)
d772: ff ff ff     stx (0xFFFF)
d775: ff ff ff     stx (0xFFFF)
d778: ff ff ff     stx (0xFFFF)
d77b: ff ff ff     stx (0xFFFF)
d77e: ff ff ff     stx (0xFFFF)
d781: ff ff ff     stx (0xFFFF)
d784: ff ff ff     stx (0xFFFF)
d787: ff ff ff     stx (0xFFFF)
d78a: ff ff ff     stx (0xFFFF)
d78d: ff ff ff     stx (0xFFFF)
d790: ff ff ff     stx (0xFFFF)
d793: ff ff ff     stx (0xFFFF)
d796: ff ff ff     stx (0xFFFF)
d799: ff ff ff     stx (0xFFFF)
d79c: ff ff ff     stx (0xFFFF)
d79f: ff ff ff     stx (0xFFFF)
d7a2: ff ff ff     stx (0xFFFF)
d7a5: ff ff ff     stx (0xFFFF)
d7a8: ff ff ff     stx (0xFFFF)
d7ab: ff ff ff     stx (0xFFFF)
d7ae: ff ff ff     stx (0xFFFF)
d7b1: ff ff ff     stx (0xFFFF)
d7b4: ff ff ff     stx (0xFFFF)
d7b7: ff ff ff     stx (0xFFFF)
d7ba: ff ff ff     stx (0xFFFF)
d7bd: ff ff ff     stx (0xFFFF)
d7c0: ff ff ff     stx (0xFFFF)
d7c3: ff ff ff     stx (0xFFFF)
d7c6: ff ff ff     stx (0xFFFF)
d7c9: ff ff ff     stx (0xFFFF)
d7cc: ff ff ff     stx (0xFFFF)
d7cf: ff ff ff     stx (0xFFFF)
d7d2: ff ff ff     stx (0xFFFF)
d7d5: ff ff ff     stx (0xFFFF)
d7d8: ff ff ff     stx (0xFFFF)
d7db: ff ff ff     stx (0xFFFF)
d7de: ff ff ff     stx (0xFFFF)
d7e1: ff ff ff     stx (0xFFFF)
d7e4: ff ff ff     stx (0xFFFF)
d7e7: ff ff ff     stx (0xFFFF)
d7ea: ff ff ff     stx (0xFFFF)
d7ed: ff ff ff     stx (0xFFFF)
d7f0: ff ff ff     stx (0xFFFF)
d7f3: ff ff ff     stx (0xFFFF)
d7f6: ff ff ff     stx (0xFFFF)
d7f9: ff ff ff     stx (0xFFFF)
d7fc: ff ff ff     stx (0xFFFF)
d7ff: ff ff ff     stx (0xFFFF)
d802: ff ff ff     stx (0xFFFF)
d805: ff ff ff     stx (0xFFFF)
d808: ff ff ff     stx (0xFFFF)
d80b: ff ff ff     stx (0xFFFF)
d80e: ff ff ff     stx (0xFFFF)
d811: ff ff ff     stx (0xFFFF)
d814: ff ff ff     stx (0xFFFF)
d817: ff ff ff     stx (0xFFFF)
d81a: ff ff ff     stx (0xFFFF)
d81d: ff ff ff     stx (0xFFFF)
d820: ff ff ff     stx (0xFFFF)
d823: ff ff ff     stx (0xFFFF)
d826: ff ff ff     stx (0xFFFF)
d829: ff ff ff     stx (0xFFFF)
d82c: ff ff ff     stx (0xFFFF)
d82f: ff ff ff     stx (0xFFFF)
d832: ff ff ff     stx (0xFFFF)
d835: ff ff ff     stx (0xFFFF)
d838: ff ff ff     stx (0xFFFF)
d83b: ff ff ff     stx (0xFFFF)
d83e: ff ff ff     stx (0xFFFF)
d841: ff ff ff     stx (0xFFFF)
d844: ff ff ff     stx (0xFFFF)
d847: ff ff ff     stx (0xFFFF)
d84a: ff ff ff     stx (0xFFFF)
d84d: ff ff ff     stx (0xFFFF)
d850: ff ff ff     stx (0xFFFF)
d853: ff ff ff     stx (0xFFFF)
d856: ff ff ff     stx (0xFFFF)
d859: ff ff ff     stx (0xFFFF)
d85c: ff ff ff     stx (0xFFFF)
d85f: ff ff ff     stx (0xFFFF)
d862: ff ff ff     stx (0xFFFF)
d865: ff ff ff     stx (0xFFFF)
d868: ff ff ff     stx (0xFFFF)
d86b: ff ff ff     stx (0xFFFF)
d86e: ff ff ff     stx (0xFFFF)
d871: ff ff ff     stx (0xFFFF)
d874: ff ff ff     stx (0xFFFF)
d877: ff ff ff     stx (0xFFFF)
d87a: ff ff ff     stx (0xFFFF)
d87d: ff ff ff     stx (0xFFFF)
d880: ff ff ff     stx (0xFFFF)
d883: ff ff ff     stx (0xFFFF)
d886: ff ff ff     stx (0xFFFF)
d889: ff ff ff     stx (0xFFFF)
d88c: ff ff ff     stx (0xFFFF)
d88f: ff ff ff     stx (0xFFFF)
d892: ff ff ff     stx (0xFFFF)
d895: ff ff ff     stx (0xFFFF)
d898: ff ff ff     stx (0xFFFF)
d89b: ff ff ff     stx (0xFFFF)
d89e: ff ff ff     stx (0xFFFF)
d8a1: ff ff ff     stx (0xFFFF)
d8a4: ff ff ff     stx (0xFFFF)
d8a7: ff ff ff     stx (0xFFFF)
d8aa: ff ff ff     stx (0xFFFF)
d8ad: ff ff ff     stx (0xFFFF)
d8b0: ff ff ff     stx (0xFFFF)
d8b3: ff ff ff     stx (0xFFFF)
d8b6: ff ff ff     stx (0xFFFF)
d8b9: ff ff ff     stx (0xFFFF)
d8bc: ff ff ff     stx (0xFFFF)
d8bf: ff ff ff     stx (0xFFFF)
d8c2: ff ff ff     stx (0xFFFF)
d8c5: ff ff ff     stx (0xFFFF)
d8c8: ff ff ff     stx (0xFFFF)
d8cb: ff ff ff     stx (0xFFFF)
d8ce: ff ff ff     stx (0xFFFF)
d8d1: ff ff ff     stx (0xFFFF)
d8d4: ff ff ff     stx (0xFFFF)
d8d7: ff ff ff     stx (0xFFFF)
d8da: ff ff ff     stx (0xFFFF)
d8dd: ff ff ff     stx (0xFFFF)
d8e0: ff ff ff     stx (0xFFFF)
d8e3: ff ff ff     stx (0xFFFF)
d8e6: ff ff ff     stx (0xFFFF)
d8e9: ff ff ff     stx (0xFFFF)
d8ec: ff ff ff     stx (0xFFFF)
d8ef: ff ff ff     stx (0xFFFF)
d8f2: ff ff ff     stx (0xFFFF)
d8f5: ff ff ff     stx (0xFFFF)
d8f8: ff ff ff     stx (0xFFFF)
d8fb: ff ff ff     stx (0xFFFF)
d8fe: ff ff ff     stx (0xFFFF)
d901: ff ff ff     stx (0xFFFF)
d904: ff ff ff     stx (0xFFFF)
d907: ff ff ff     stx (0xFFFF)
d90a: ff ff ff     stx (0xFFFF)
d90d: ff ff ff     stx (0xFFFF)
d910: ff ff ff     stx (0xFFFF)
d913: ff ff ff     stx (0xFFFF)
d916: ff ff ff     stx (0xFFFF)
d919: ff ff ff     stx (0xFFFF)
d91c: ff ff ff     stx (0xFFFF)
d91f: ff ff ff     stx (0xFFFF)
d922: ff ff ff     stx (0xFFFF)
d925: ff ff ff     stx (0xFFFF)
d928: ff ff ff     stx (0xFFFF)
d92b: ff ff ff     stx (0xFFFF)
d92e: ff ff ff     stx (0xFFFF)
d931: ff ff ff     stx (0xFFFF)
d934: ff ff ff     stx (0xFFFF)
d937: ff ff ff     stx (0xFFFF)
d93a: ff ff ff     stx (0xFFFF)
d93d: ff ff ff     stx (0xFFFF)
d940: ff ff ff     stx (0xFFFF)
d943: ff ff ff     stx (0xFFFF)
d946: ff ff ff     stx (0xFFFF)
d949: ff ff ff     stx (0xFFFF)
d94c: ff ff ff     stx (0xFFFF)
d94f: ff ff ff     stx (0xFFFF)
d952: ff ff ff     stx (0xFFFF)
d955: ff ff ff     stx (0xFFFF)
d958: ff ff ff     stx (0xFFFF)
d95b: ff ff ff     stx (0xFFFF)
d95e: ff ff ff     stx (0xFFFF)
d961: ff ff ff     stx (0xFFFF)
d964: ff ff ff     stx (0xFFFF)
d967: ff ff ff     stx (0xFFFF)
d96a: ff ff ff     stx (0xFFFF)
d96d: ff ff ff     stx (0xFFFF)
d970: ff ff ff     stx (0xFFFF)
d973: ff ff ff     stx (0xFFFF)
d976: ff ff ff     stx (0xFFFF)
d979: ff ff ff     stx (0xFFFF)
d97c: ff ff ff     stx (0xFFFF)
d97f: ff ff ff     stx (0xFFFF)
d982: ff ff ff     stx (0xFFFF)
d985: ff ff ff     stx (0xFFFF)
d988: ff ff ff     stx (0xFFFF)
d98b: ff ff ff     stx (0xFFFF)
d98e: ff ff ff     stx (0xFFFF)
d991: ff ff ff     stx (0xFFFF)
d994: ff ff ff     stx (0xFFFF)
d997: ff ff ff     stx (0xFFFF)
d99a: ff ff ff     stx (0xFFFF)
d99d: ff ff ff     stx (0xFFFF)
d9a0: ff ff ff     stx (0xFFFF)
d9a3: ff ff ff     stx (0xFFFF)
d9a6: ff ff ff     stx (0xFFFF)
d9a9: ff ff ff     stx (0xFFFF)
d9ac: ff ff ff     stx (0xFFFF)
d9af: ff ff ff     stx (0xFFFF)
d9b2: ff ff ff     stx (0xFFFF)
d9b5: ff ff ff     stx (0xFFFF)
d9b8: ff ff ff     stx (0xFFFF)
d9bb: ff ff ff     stx (0xFFFF)
d9be: ff ff ff     stx (0xFFFF)
d9c1: ff ff ff     stx (0xFFFF)
d9c4: ff ff ff     stx (0xFFFF)
d9c7: ff ff ff     stx (0xFFFF)
d9ca: ff ff ff     stx (0xFFFF)
d9cd: ff ff ff     stx (0xFFFF)
d9d0: ff ff ff     stx (0xFFFF)
d9d3: ff ff ff     stx (0xFFFF)
d9d6: ff ff ff     stx (0xFFFF)
d9d9: ff ff ff     stx (0xFFFF)
d9dc: ff ff ff     stx (0xFFFF)
d9df: ff ff ff     stx (0xFFFF)
d9e2: ff ff ff     stx (0xFFFF)
d9e5: ff ff ff     stx (0xFFFF)
d9e8: ff ff ff     stx (0xFFFF)
d9eb: ff ff ff     stx (0xFFFF)
d9ee: ff ff ff     stx (0xFFFF)
d9f1: ff ff ff     stx (0xFFFF)
d9f4: ff ff ff     stx (0xFFFF)
d9f7: ff ff ff     stx (0xFFFF)
d9fa: ff ff ff     stx (0xFFFF)
d9fd: ff ff ff     stx (0xFFFF)
da00: ff ff ff     stx (0xFFFF)
da03: ff ff ff     stx (0xFFFF)
da06: ff ff ff     stx (0xFFFF)
da09: ff ff ff     stx (0xFFFF)
da0c: ff ff ff     stx (0xFFFF)
da0f: ff ff ff     stx (0xFFFF)
da12: ff ff ff     stx (0xFFFF)
da15: ff ff ff     stx (0xFFFF)
da18: ff ff ff     stx (0xFFFF)
da1b: ff ff ff     stx (0xFFFF)
da1e: ff ff ff     stx (0xFFFF)
da21: ff ff ff     stx (0xFFFF)
da24: ff ff ff     stx (0xFFFF)
da27: ff ff ff     stx (0xFFFF)
da2a: ff ff ff     stx (0xFFFF)
da2d: ff ff ff     stx (0xFFFF)
da30: ff ff ff     stx (0xFFFF)
da33: ff ff ff     stx (0xFFFF)
da36: ff ff ff     stx (0xFFFF)
da39: ff ff ff     stx (0xFFFF)
da3c: ff ff ff     stx (0xFFFF)
da3f: ff ff ff     stx (0xFFFF)
da42: ff ff ff     stx (0xFFFF)
da45: ff ff ff     stx (0xFFFF)
da48: ff ff ff     stx (0xFFFF)
da4b: ff ff ff     stx (0xFFFF)
da4e: ff ff ff     stx (0xFFFF)
da51: ff ff ff     stx (0xFFFF)
da54: ff ff ff     stx (0xFFFF)
da57: ff ff ff     stx (0xFFFF)
da5a: ff ff ff     stx (0xFFFF)
da5d: ff ff ff     stx (0xFFFF)
da60: ff ff ff     stx (0xFFFF)
da63: ff ff ff     stx (0xFFFF)
da66: ff ff ff     stx (0xFFFF)
da69: ff ff ff     stx (0xFFFF)
da6c: ff ff ff     stx (0xFFFF)
da6f: ff ff ff     stx (0xFFFF)
da72: ff ff ff     stx (0xFFFF)
da75: ff ff ff     stx (0xFFFF)
da78: ff ff ff     stx (0xFFFF)
da7b: ff ff ff     stx (0xFFFF)
da7e: ff ff ff     stx (0xFFFF)
da81: ff ff ff     stx (0xFFFF)
da84: ff ff ff     stx (0xFFFF)
da87: ff ff ff     stx (0xFFFF)
da8a: ff ff ff     stx (0xFFFF)
da8d: ff ff ff     stx (0xFFFF)
da90: ff ff ff     stx (0xFFFF)
da93: ff ff ff     stx (0xFFFF)
da96: ff ff ff     stx (0xFFFF)
da99: ff ff ff     stx (0xFFFF)
da9c: ff ff ff     stx (0xFFFF)
da9f: ff ff ff     stx (0xFFFF)
daa2: ff ff ff     stx (0xFFFF)
daa5: ff ff ff     stx (0xFFFF)
daa8: ff ff ff     stx (0xFFFF)
daab: ff ff ff     stx (0xFFFF)
daae: ff ff ff     stx (0xFFFF)
dab1: ff ff ff     stx (0xFFFF)
dab4: ff ff ff     stx (0xFFFF)
dab7: ff ff ff     stx (0xFFFF)
daba: ff ff ff     stx (0xFFFF)
dabd: ff ff ff     stx (0xFFFF)
dac0: ff ff ff     stx (0xFFFF)
dac3: ff ff ff     stx (0xFFFF)
dac6: ff ff ff     stx (0xFFFF)
dac9: ff ff ff     stx (0xFFFF)
dacc: ff ff ff     stx (0xFFFF)
dacf: ff ff ff     stx (0xFFFF)
dad2: ff ff ff     stx (0xFFFF)
dad5: ff ff ff     stx (0xFFFF)
dad8: ff ff ff     stx (0xFFFF)
dadb: ff ff ff     stx (0xFFFF)
dade: ff ff ff     stx (0xFFFF)
dae1: ff ff ff     stx (0xFFFF)
dae4: ff ff ff     stx (0xFFFF)
dae7: ff ff ff     stx (0xFFFF)
daea: ff ff ff     stx (0xFFFF)
daed: ff ff ff     stx (0xFFFF)
daf0: ff ff ff     stx (0xFFFF)
daf3: ff ff ff     stx (0xFFFF)
daf6: ff ff ff     stx (0xFFFF)
daf9: ff ff ff     stx (0xFFFF)
dafc: ff ff ff     stx (0xFFFF)
daff: ff ff ff     stx (0xFFFF)
db02: ff ff ff     stx (0xFFFF)
db05: ff ff ff     stx (0xFFFF)
db08: ff ff ff     stx (0xFFFF)
db0b: ff ff ff     stx (0xFFFF)
db0e: ff ff ff     stx (0xFFFF)
db11: ff ff ff     stx (0xFFFF)
db14: ff ff ff     stx (0xFFFF)
db17: ff ff ff     stx (0xFFFF)
db1a: ff ff ff     stx (0xFFFF)
db1d: ff ff ff     stx (0xFFFF)
db20: ff ff ff     stx (0xFFFF)
db23: ff ff ff     stx (0xFFFF)
db26: ff ff ff     stx (0xFFFF)
db29: ff ff ff     stx (0xFFFF)
db2c: ff ff ff     stx (0xFFFF)
db2f: ff ff ff     stx (0xFFFF)
db32: ff ff ff     stx (0xFFFF)
db35: ff ff ff     stx (0xFFFF)
db38: ff ff ff     stx (0xFFFF)
db3b: ff ff ff     stx (0xFFFF)
db3e: ff ff ff     stx (0xFFFF)
db41: ff ff ff     stx (0xFFFF)
db44: ff ff ff     stx (0xFFFF)
db47: ff ff ff     stx (0xFFFF)
db4a: ff ff ff     stx (0xFFFF)
db4d: ff ff ff     stx (0xFFFF)
db50: ff ff ff     stx (0xFFFF)
db53: ff ff ff     stx (0xFFFF)
db56: ff ff ff     stx (0xFFFF)
db59: ff ff ff     stx (0xFFFF)
db5c: ff ff ff     stx (0xFFFF)
db5f: ff ff ff     stx (0xFFFF)
db62: ff ff ff     stx (0xFFFF)
db65: ff ff ff     stx (0xFFFF)
db68: ff ff ff     stx (0xFFFF)
db6b: ff ff ff     stx (0xFFFF)
db6e: ff ff ff     stx (0xFFFF)
db71: ff ff ff     stx (0xFFFF)
db74: ff ff ff     stx (0xFFFF)
db77: ff ff ff     stx (0xFFFF)
db7a: ff ff ff     stx (0xFFFF)
db7d: ff ff ff     stx (0xFFFF)
db80: ff ff ff     stx (0xFFFF)
db83: ff ff ff     stx (0xFFFF)
db86: ff ff ff     stx (0xFFFF)
db89: ff ff ff     stx (0xFFFF)
db8c: ff ff ff     stx (0xFFFF)
db8f: ff ff ff     stx (0xFFFF)
db92: ff ff ff     stx (0xFFFF)
db95: ff ff ff     stx (0xFFFF)
db98: ff ff ff     stx (0xFFFF)
db9b: ff ff ff     stx (0xFFFF)
db9e: ff ff ff     stx (0xFFFF)
dba1: ff ff ff     stx (0xFFFF)
dba4: ff ff ff     stx (0xFFFF)
dba7: ff ff ff     stx (0xFFFF)
dbaa: ff ff ff     stx (0xFFFF)
dbad: ff ff ff     stx (0xFFFF)
dbb0: ff ff ff     stx (0xFFFF)
dbb3: ff ff ff     stx (0xFFFF)
dbb6: ff ff ff     stx (0xFFFF)
dbb9: ff ff ff     stx (0xFFFF)
dbbc: ff ff ff     stx (0xFFFF)
dbbf: ff ff ff     stx (0xFFFF)
dbc2: ff ff ff     stx (0xFFFF)
dbc5: ff ff ff     stx (0xFFFF)
dbc8: ff ff ff     stx (0xFFFF)
dbcb: ff ff ff     stx (0xFFFF)
dbce: ff ff ff     stx (0xFFFF)
dbd1: ff ff ff     stx (0xFFFF)
dbd4: ff ff ff     stx (0xFFFF)
dbd7: ff ff ff     stx (0xFFFF)
dbda: ff ff ff     stx (0xFFFF)
dbdd: ff ff ff     stx (0xFFFF)
dbe0: ff ff ff     stx (0xFFFF)
dbe3: ff ff ff     stx (0xFFFF)
dbe6: ff ff ff     stx (0xFFFF)
dbe9: ff ff ff     stx (0xFFFF)
dbec: ff ff ff     stx (0xFFFF)
dbef: ff ff ff     stx (0xFFFF)
dbf2: ff ff ff     stx (0xFFFF)
dbf5: ff ff ff     stx (0xFFFF)
dbf8: ff ff ff     stx (0xFFFF)
dbfb: ff ff ff     stx (0xFFFF)
dbfe: ff ff ff     stx (0xFFFF)
dc01: ff ff ff     stx (0xFFFF)
dc04: ff ff ff     stx (0xFFFF)
dc07: ff ff ff     stx (0xFFFF)
dc0a: ff ff ff     stx (0xFFFF)
dc0d: ff ff ff     stx (0xFFFF)
dc10: ff ff ff     stx (0xFFFF)
dc13: ff ff ff     stx (0xFFFF)
dc16: ff ff ff     stx (0xFFFF)
dc19: ff ff ff     stx (0xFFFF)
dc1c: ff ff ff     stx (0xFFFF)
dc1f: ff ff ff     stx (0xFFFF)
dc22: ff ff ff     stx (0xFFFF)
dc25: ff ff ff     stx (0xFFFF)
dc28: ff ff ff     stx (0xFFFF)
dc2b: ff ff ff     stx (0xFFFF)
dc2e: ff ff ff     stx (0xFFFF)
dc31: ff ff ff     stx (0xFFFF)
dc34: ff ff ff     stx (0xFFFF)
dc37: ff ff ff     stx (0xFFFF)
dc3a: ff ff ff     stx (0xFFFF)
dc3d: ff ff ff     stx (0xFFFF)
dc40: ff ff ff     stx (0xFFFF)
dc43: ff ff ff     stx (0xFFFF)
dc46: ff ff ff     stx (0xFFFF)
dc49: ff ff ff     stx (0xFFFF)
dc4c: ff ff ff     stx (0xFFFF)
dc4f: ff ff ff     stx (0xFFFF)
dc52: ff ff ff     stx (0xFFFF)
dc55: ff ff ff     stx (0xFFFF)
dc58: ff ff ff     stx (0xFFFF)
dc5b: ff ff ff     stx (0xFFFF)
dc5e: ff ff ff     stx (0xFFFF)
dc61: ff ff ff     stx (0xFFFF)
dc64: ff ff ff     stx (0xFFFF)
dc67: ff ff ff     stx (0xFFFF)
dc6a: ff ff ff     stx (0xFFFF)
dc6d: ff ff ff     stx (0xFFFF)
dc70: ff ff ff     stx (0xFFFF)
dc73: ff ff ff     stx (0xFFFF)
dc76: ff ff ff     stx (0xFFFF)
dc79: ff ff ff     stx (0xFFFF)
dc7c: ff ff ff     stx (0xFFFF)
dc7f: ff ff ff     stx (0xFFFF)
dc82: ff ff ff     stx (0xFFFF)
dc85: ff ff ff     stx (0xFFFF)
dc88: ff ff ff     stx (0xFFFF)
dc8b: ff ff ff     stx (0xFFFF)
dc8e: ff ff ff     stx (0xFFFF)
dc91: ff ff ff     stx (0xFFFF)
dc94: ff ff ff     stx (0xFFFF)
dc97: ff ff ff     stx (0xFFFF)
dc9a: ff ff ff     stx (0xFFFF)
dc9d: ff ff ff     stx (0xFFFF)
dca0: ff ff ff     stx (0xFFFF)
dca3: ff ff ff     stx (0xFFFF)
dca6: ff ff ff     stx (0xFFFF)
dca9: ff ff ff     stx (0xFFFF)
dcac: ff ff ff     stx (0xFFFF)
dcaf: ff ff ff     stx (0xFFFF)
dcb2: ff ff ff     stx (0xFFFF)
dcb5: ff ff ff     stx (0xFFFF)
dcb8: ff ff ff     stx (0xFFFF)
dcbb: ff ff ff     stx (0xFFFF)
dcbe: ff ff ff     stx (0xFFFF)
dcc1: ff ff ff     stx (0xFFFF)
dcc4: ff ff ff     stx (0xFFFF)
dcc7: ff ff ff     stx (0xFFFF)
dcca: ff ff ff     stx (0xFFFF)
dccd: ff ff ff     stx (0xFFFF)
dcd0: ff ff ff     stx (0xFFFF)
dcd3: ff ff ff     stx (0xFFFF)
dcd6: ff ff ff     stx (0xFFFF)
dcd9: ff ff ff     stx (0xFFFF)
dcdc: ff ff ff     stx (0xFFFF)
dcdf: ff ff ff     stx (0xFFFF)
dce2: ff ff ff     stx (0xFFFF)
dce5: ff ff ff     stx (0xFFFF)
dce8: ff ff ff     stx (0xFFFF)
dceb: ff ff ff     stx (0xFFFF)
dcee: ff ff ff     stx (0xFFFF)
dcf1: ff ff ff     stx (0xFFFF)
dcf4: ff ff ff     stx (0xFFFF)
dcf7: ff ff ff     stx (0xFFFF)
dcfa: ff ff ff     stx (0xFFFF)
dcfd: ff ff ff     stx (0xFFFF)
dd00: ff ff ff     stx (0xFFFF)
dd03: ff ff ff     stx (0xFFFF)
dd06: ff ff ff     stx (0xFFFF)
dd09: ff ff ff     stx (0xFFFF)
dd0c: ff ff ff     stx (0xFFFF)
dd0f: ff ff ff     stx (0xFFFF)
dd12: ff ff ff     stx (0xFFFF)
dd15: ff ff ff     stx (0xFFFF)
dd18: ff ff ff     stx (0xFFFF)
dd1b: ff ff ff     stx (0xFFFF)
dd1e: ff ff ff     stx (0xFFFF)
dd21: ff ff ff     stx (0xFFFF)
dd24: ff ff ff     stx (0xFFFF)
dd27: ff ff ff     stx (0xFFFF)
dd2a: ff ff ff     stx (0xFFFF)
dd2d: ff ff ff     stx (0xFFFF)
dd30: ff ff ff     stx (0xFFFF)
dd33: ff ff ff     stx (0xFFFF)
dd36: ff ff ff     stx (0xFFFF)
dd39: ff ff ff     stx (0xFFFF)
dd3c: ff ff ff     stx (0xFFFF)
dd3f: ff ff ff     stx (0xFFFF)
dd42: ff ff ff     stx (0xFFFF)
dd45: ff ff ff     stx (0xFFFF)
dd48: ff ff ff     stx (0xFFFF)
dd4b: ff ff ff     stx (0xFFFF)
dd4e: ff ff ff     stx (0xFFFF)
dd51: ff ff ff     stx (0xFFFF)
dd54: ff ff ff     stx (0xFFFF)
dd57: ff ff ff     stx (0xFFFF)
dd5a: ff ff ff     stx (0xFFFF)
dd5d: ff ff ff     stx (0xFFFF)
dd60: ff ff ff     stx (0xFFFF)
dd63: ff ff ff     stx (0xFFFF)
dd66: ff ff ff     stx (0xFFFF)
dd69: ff ff ff     stx (0xFFFF)
dd6c: ff ff ff     stx (0xFFFF)
dd6f: ff ff ff     stx (0xFFFF)
dd72: ff ff ff     stx (0xFFFF)
dd75: ff ff ff     stx (0xFFFF)
dd78: ff ff ff     stx (0xFFFF)
dd7b: ff ff ff     stx (0xFFFF)
dd7e: ff ff ff     stx (0xFFFF)
dd81: ff ff ff     stx (0xFFFF)
dd84: ff ff ff     stx (0xFFFF)
dd87: ff ff ff     stx (0xFFFF)
dd8a: ff ff ff     stx (0xFFFF)
dd8d: ff ff ff     stx (0xFFFF)
dd90: ff ff ff     stx (0xFFFF)
dd93: ff ff ff     stx (0xFFFF)
dd96: ff ff ff     stx (0xFFFF)
dd99: ff ff ff     stx (0xFFFF)
dd9c: ff ff ff     stx (0xFFFF)
dd9f: ff ff ff     stx (0xFFFF)
dda2: ff ff ff     stx (0xFFFF)
dda5: ff ff ff     stx (0xFFFF)
dda8: ff ff ff     stx (0xFFFF)
ddab: ff ff ff     stx (0xFFFF)
ddae: ff ff ff     stx (0xFFFF)
ddb1: ff ff ff     stx (0xFFFF)
ddb4: ff ff ff     stx (0xFFFF)
ddb7: ff ff ff     stx (0xFFFF)
ddba: ff ff ff     stx (0xFFFF)
ddbd: ff ff ff     stx (0xFFFF)
ddc0: ff ff ff     stx (0xFFFF)
ddc3: ff ff ff     stx (0xFFFF)
ddc6: ff ff ff     stx (0xFFFF)
ddc9: ff ff ff     stx (0xFFFF)
ddcc: ff ff ff     stx (0xFFFF)
ddcf: ff ff ff     stx (0xFFFF)
ddd2: ff ff ff     stx (0xFFFF)
ddd5: ff ff ff     stx (0xFFFF)
ddd8: ff ff ff     stx (0xFFFF)
dddb: ff ff ff     stx (0xFFFF)
ddde: ff ff ff     stx (0xFFFF)
dde1: ff ff ff     stx (0xFFFF)
dde4: ff ff ff     stx (0xFFFF)
dde7: ff ff ff     stx (0xFFFF)
ddea: ff ff ff     stx (0xFFFF)
dded: ff ff ff     stx (0xFFFF)
ddf0: ff ff ff     stx (0xFFFF)
ddf3: ff ff ff     stx (0xFFFF)
ddf6: ff ff ff     stx (0xFFFF)
ddf9: ff ff ff     stx (0xFFFF)
ddfc: ff ff ff     stx (0xFFFF)
ddff: ff ff ff     stx (0xFFFF)
de02: ff ff ff     stx (0xFFFF)
de05: ff ff ff     stx (0xFFFF)
de08: ff ff ff     stx (0xFFFF)
de0b: ff ff ff     stx (0xFFFF)
de0e: ff ff ff     stx (0xFFFF)
de11: ff ff ff     stx (0xFFFF)
de14: ff ff ff     stx (0xFFFF)
de17: ff ff ff     stx (0xFFFF)
de1a: ff ff ff     stx (0xFFFF)
de1d: ff ff ff     stx (0xFFFF)
de20: ff ff ff     stx (0xFFFF)
de23: ff ff ff     stx (0xFFFF)
de26: ff ff ff     stx (0xFFFF)
de29: ff ff ff     stx (0xFFFF)
de2c: ff ff ff     stx (0xFFFF)
de2f: ff ff ff     stx (0xFFFF)
de32: ff ff ff     stx (0xFFFF)
de35: ff ff ff     stx (0xFFFF)
de38: ff ff ff     stx (0xFFFF)
de3b: ff ff ff     stx (0xFFFF)
de3e: ff ff ff     stx (0xFFFF)
de41: ff ff ff     stx (0xFFFF)
de44: ff ff ff     stx (0xFFFF)
de47: ff ff ff     stx (0xFFFF)
de4a: ff ff ff     stx (0xFFFF)
de4d: ff ff ff     stx (0xFFFF)
de50: ff ff ff     stx (0xFFFF)
de53: ff ff ff     stx (0xFFFF)
de56: ff ff ff     stx (0xFFFF)
de59: ff ff ff     stx (0xFFFF)
de5c: ff ff ff     stx (0xFFFF)
de5f: ff ff ff     stx (0xFFFF)
de62: ff ff ff     stx (0xFFFF)
de65: ff ff ff     stx (0xFFFF)
de68: ff ff ff     stx (0xFFFF)
de6b: ff ff ff     stx (0xFFFF)
de6e: ff ff ff     stx (0xFFFF)
de71: ff ff ff     stx (0xFFFF)
de74: ff ff ff     stx (0xFFFF)
de77: ff ff ff     stx (0xFFFF)
de7a: ff ff ff     stx (0xFFFF)
de7d: ff ff ff     stx (0xFFFF)
de80: ff ff ff     stx (0xFFFF)
de83: ff ff ff     stx (0xFFFF)
de86: ff ff ff     stx (0xFFFF)
de89: ff ff ff     stx (0xFFFF)
de8c: ff ff ff     stx (0xFFFF)
de8f: ff ff ff     stx (0xFFFF)
de92: ff ff ff     stx (0xFFFF)
de95: ff ff ff     stx (0xFFFF)
de98: ff ff ff     stx (0xFFFF)
de9b: ff ff ff     stx (0xFFFF)
de9e: ff ff ff     stx (0xFFFF)
dea1: ff ff ff     stx (0xFFFF)
dea4: ff ff ff     stx (0xFFFF)
dea7: ff ff ff     stx (0xFFFF)
deaa: ff ff ff     stx (0xFFFF)
dead: ff ff ff     stx (0xFFFF)
deb0: ff ff ff     stx (0xFFFF)
deb3: ff ff ff     stx (0xFFFF)
deb6: ff ff ff     stx (0xFFFF)
deb9: ff ff ff     stx (0xFFFF)
debc: ff ff ff     stx (0xFFFF)
debf: ff ff ff     stx (0xFFFF)
dec2: ff ff ff     stx (0xFFFF)
dec5: ff ff ff     stx (0xFFFF)
dec8: ff ff ff     stx (0xFFFF)
decb: ff ff ff     stx (0xFFFF)
dece: ff ff ff     stx (0xFFFF)
ded1: ff ff ff     stx (0xFFFF)
ded4: ff ff ff     stx (0xFFFF)
ded7: ff ff ff     stx (0xFFFF)
deda: ff ff ff     stx (0xFFFF)
dedd: ff ff ff     stx (0xFFFF)
dee0: ff ff ff     stx (0xFFFF)
dee3: ff ff ff     stx (0xFFFF)
dee6: ff ff ff     stx (0xFFFF)
dee9: ff ff ff     stx (0xFFFF)
deec: ff ff ff     stx (0xFFFF)
deef: ff ff ff     stx (0xFFFF)
def2: ff ff ff     stx (0xFFFF)
def5: ff ff ff     stx (0xFFFF)
def8: ff ff ff     stx (0xFFFF)
defb: ff ff ff     stx (0xFFFF)
defe: ff ff ff     stx (0xFFFF)
df01: ff ff ff     stx (0xFFFF)
df04: ff ff ff     stx (0xFFFF)
df07: ff ff ff     stx (0xFFFF)
df0a: ff ff ff     stx (0xFFFF)
df0d: ff ff ff     stx (0xFFFF)
df10: ff ff ff     stx (0xFFFF)
df13: ff ff ff     stx (0xFFFF)
df16: ff ff ff     stx (0xFFFF)
df19: ff ff ff     stx (0xFFFF)
df1c: ff ff ff     stx (0xFFFF)
df1f: ff ff ff     stx (0xFFFF)
df22: ff ff ff     stx (0xFFFF)
df25: ff ff ff     stx (0xFFFF)
df28: ff ff ff     stx (0xFFFF)
df2b: ff ff ff     stx (0xFFFF)
df2e: ff ff ff     stx (0xFFFF)
df31: ff ff ff     stx (0xFFFF)
df34: ff ff ff     stx (0xFFFF)
df37: ff ff ff     stx (0xFFFF)
df3a: ff ff ff     stx (0xFFFF)
df3d: ff ff ff     stx (0xFFFF)
df40: ff ff ff     stx (0xFFFF)
df43: ff ff ff     stx (0xFFFF)
df46: ff ff ff     stx (0xFFFF)
df49: ff ff ff     stx (0xFFFF)
df4c: ff ff ff     stx (0xFFFF)
df4f: ff ff ff     stx (0xFFFF)
df52: ff ff ff     stx (0xFFFF)
df55: ff ff ff     stx (0xFFFF)
df58: ff ff ff     stx (0xFFFF)
df5b: ff ff ff     stx (0xFFFF)
df5e: ff ff ff     stx (0xFFFF)
df61: ff ff ff     stx (0xFFFF)
df64: ff ff ff     stx (0xFFFF)
df67: ff ff ff     stx (0xFFFF)
df6a: ff ff ff     stx (0xFFFF)
df6d: ff ff ff     stx (0xFFFF)
df70: ff ff ff     stx (0xFFFF)
df73: ff ff ff     stx (0xFFFF)
df76: ff ff ff     stx (0xFFFF)
df79: ff ff ff     stx (0xFFFF)
df7c: ff ff ff     stx (0xFFFF)
df7f: ff ff ff     stx (0xFFFF)
df82: ff ff ff     stx (0xFFFF)
df85: ff ff ff     stx (0xFFFF)
df88: ff ff ff     stx (0xFFFF)
df8b: ff ff ff     stx (0xFFFF)
df8e: ff ff ff     stx (0xFFFF)
df91: ff ff ff     stx (0xFFFF)
df94: ff ff ff     stx (0xFFFF)
df97: ff ff ff     stx (0xFFFF)
df9a: ff ff ff     stx (0xFFFF)
df9d: ff ff ff     stx (0xFFFF)
dfa0: ff ff ff     stx (0xFFFF)
dfa3: ff ff ff     stx (0xFFFF)
dfa6: ff ff ff     stx (0xFFFF)
dfa9: ff ff ff     stx (0xFFFF)
dfac: ff ff ff     stx (0xFFFF)
dfaf: ff ff ff     stx (0xFFFF)
dfb2: ff ff ff     stx (0xFFFF)
dfb5: ff ff ff     stx (0xFFFF)
dfb8: ff ff ff     stx (0xFFFF)
dfbb: ff ff ff     stx (0xFFFF)
dfbe: ff ff ff     stx (0xFFFF)
dfc1: ff ff ff     stx (0xFFFF)
dfc4: ff ff ff     stx (0xFFFF)
dfc7: ff ff ff     stx (0xFFFF)
dfca: ff ff ff     stx (0xFFFF)
dfcd: ff ff ff     stx (0xFFFF)
dfd0: ff ff ff     stx (0xFFFF)
dfd3: ff ff ff     stx (0xFFFF)
dfd6: ff ff ff     stx (0xFFFF)
dfd9: ff ff ff     stx (0xFFFF)
dfdc: ff ff ff     stx (0xFFFF)
dfdf: ff ff ff     stx (0xFFFF)
dfe2: ff ff ff     stx (0xFFFF)
dfe5: ff ff ff     stx (0xFFFF)
dfe8: ff ff ff     stx (0xFFFF)
dfeb: ff ff ff     stx (0xFFFF)
dfee: ff ff ff     stx (0xFFFF)
dff1: ff ff ff     stx (0xFFFF)
dff4: ff ff ff     stx (0xFFFF)
dff7: ff ff ff     stx (0xFFFF)
dffa: ff ff ff     stx (0xFFFF)
dffd: ff ff ff     stx (0xFFFF)
e000: ff ff ff     stx (0xFFFF)
e003: ff ff ff     stx (0xFFFF)
e006: ff ff ff     stx (0xFFFF)
e009: ff ff ff     stx (0xFFFF)
e00c: ff ff ff     stx (0xFFFF)
e00f: ff ff ff     stx (0xFFFF)
e012: ff ff ff     stx (0xFFFF)
e015: ff ff ff     stx (0xFFFF)
e018: ff ff ff     stx (0xFFFF)
e01b: ff ff ff     stx (0xFFFF)
e01e: ff ff ff     stx (0xFFFF)
e021: ff ff ff     stx (0xFFFF)
e024: ff ff ff     stx (0xFFFF)
e027: ff ff ff     stx (0xFFFF)
e02a: ff ff ff     stx (0xFFFF)
e02d: ff ff ff     stx (0xFFFF)
e030: ff ff ff     stx (0xFFFF)
e033: ff ff ff     stx (0xFFFF)
e036: ff ff ff     stx (0xFFFF)
e039: ff ff ff     stx (0xFFFF)
e03c: ff ff ff     stx (0xFFFF)
e03f: ff ff ff     stx (0xFFFF)
e042: ff ff ff     stx (0xFFFF)
e045: ff ff ff     stx (0xFFFF)
e048: ff ff ff     stx (0xFFFF)
e04b: ff ff ff     stx (0xFFFF)
e04e: ff ff ff     stx (0xFFFF)
e051: ff ff ff     stx (0xFFFF)
e054: ff ff ff     stx (0xFFFF)
e057: ff ff ff     stx (0xFFFF)
e05a: ff ff ff     stx (0xFFFF)
e05d: ff ff ff     stx (0xFFFF)
e060: ff ff ff     stx (0xFFFF)
e063: ff ff ff     stx (0xFFFF)
e066: ff ff ff     stx (0xFFFF)
e069: ff ff ff     stx (0xFFFF)
e06c: ff ff ff     stx (0xFFFF)
e06f: ff ff ff     stx (0xFFFF)
e072: ff ff ff     stx (0xFFFF)
e075: ff ff ff     stx (0xFFFF)
e078: ff ff ff     stx (0xFFFF)
e07b: ff ff ff     stx (0xFFFF)
e07e: ff ff ff     stx (0xFFFF)
e081: ff ff ff     stx (0xFFFF)
e084: ff ff ff     stx (0xFFFF)
e087: ff ff ff     stx (0xFFFF)
e08a: ff ff ff     stx (0xFFFF)
e08d: ff ff ff     stx (0xFFFF)
e090: ff ff ff     stx (0xFFFF)
e093: ff ff ff     stx (0xFFFF)
e096: ff ff ff     stx (0xFFFF)
e099: ff ff ff     stx (0xFFFF)
e09c: ff ff ff     stx (0xFFFF)
e09f: ff ff ff     stx (0xFFFF)
e0a2: ff ff ff     stx (0xFFFF)
e0a5: ff ff ff     stx (0xFFFF)
e0a8: ff ff ff     stx (0xFFFF)
e0ab: ff ff ff     stx (0xFFFF)
e0ae: ff ff ff     stx (0xFFFF)
e0b1: ff ff ff     stx (0xFFFF)
e0b4: ff ff ff     stx (0xFFFF)
e0b7: ff ff ff     stx (0xFFFF)
e0ba: ff ff ff     stx (0xFFFF)
e0bd: ff ff ff     stx (0xFFFF)
e0c0: ff ff ff     stx (0xFFFF)
e0c3: ff ff ff     stx (0xFFFF)
e0c6: ff ff ff     stx (0xFFFF)
e0c9: ff ff ff     stx (0xFFFF)
e0cc: ff ff ff     stx (0xFFFF)
e0cf: ff ff ff     stx (0xFFFF)
e0d2: ff ff ff     stx (0xFFFF)
e0d5: ff ff ff     stx (0xFFFF)
e0d8: ff ff ff     stx (0xFFFF)
e0db: ff ff ff     stx (0xFFFF)
e0de: ff ff ff     stx (0xFFFF)
e0e1: ff ff ff     stx (0xFFFF)
e0e4: ff ff ff     stx (0xFFFF)
e0e7: ff ff ff     stx (0xFFFF)
e0ea: ff ff ff     stx (0xFFFF)
e0ed: ff ff ff     stx (0xFFFF)
e0f0: ff ff ff     stx (0xFFFF)
e0f3: ff ff ff     stx (0xFFFF)
e0f6: ff ff ff     stx (0xFFFF)
e0f9: ff ff ff     stx (0xFFFF)
e0fc: ff ff ff     stx (0xFFFF)
e0ff: ff ff ff     stx (0xFFFF)
e102: ff ff ff     stx (0xFFFF)
e105: ff ff ff     stx (0xFFFF)
e108: ff ff ff     stx (0xFFFF)
e10b: ff ff ff     stx (0xFFFF)
e10e: ff ff ff     stx (0xFFFF)
e111: ff ff ff     stx (0xFFFF)
e114: ff ff ff     stx (0xFFFF)
e117: ff ff ff     stx (0xFFFF)
e11a: ff ff ff     stx (0xFFFF)
e11d: ff ff ff     stx (0xFFFF)
e120: ff ff ff     stx (0xFFFF)
e123: ff ff ff     stx (0xFFFF)
e126: ff ff ff     stx (0xFFFF)
e129: ff ff ff     stx (0xFFFF)
e12c: ff ff ff     stx (0xFFFF)
e12f: ff ff ff     stx (0xFFFF)
e132: ff ff ff     stx (0xFFFF)
e135: ff ff ff     stx (0xFFFF)
e138: ff ff ff     stx (0xFFFF)
e13b: ff ff ff     stx (0xFFFF)
e13e: ff ff ff     stx (0xFFFF)
e141: ff ff ff     stx (0xFFFF)
e144: ff ff ff     stx (0xFFFF)
e147: ff ff ff     stx (0xFFFF)
e14a: ff ff ff     stx (0xFFFF)
e14d: ff ff ff     stx (0xFFFF)
e150: ff ff ff     stx (0xFFFF)
e153: ff ff ff     stx (0xFFFF)
e156: ff ff ff     stx (0xFFFF)
e159: ff ff ff     stx (0xFFFF)
e15c: ff ff ff     stx (0xFFFF)
e15f: ff ff ff     stx (0xFFFF)
e162: ff ff ff     stx (0xFFFF)
e165: ff ff ff     stx (0xFFFF)
e168: ff ff ff     stx (0xFFFF)
e16b: ff ff ff     stx (0xFFFF)
e16e: ff ff ff     stx (0xFFFF)
e171: ff ff ff     stx (0xFFFF)
e174: ff ff ff     stx (0xFFFF)
e177: ff ff ff     stx (0xFFFF)
e17a: ff ff ff     stx (0xFFFF)
e17d: ff ff ff     stx (0xFFFF)
e180: ff ff ff     stx (0xFFFF)
e183: ff ff ff     stx (0xFFFF)
e186: ff ff ff     stx (0xFFFF)
e189: ff ff ff     stx (0xFFFF)
e18c: ff ff ff     stx (0xFFFF)
e18f: ff ff ff     stx (0xFFFF)
e192: ff ff ff     stx (0xFFFF)
e195: ff ff ff     stx (0xFFFF)
e198: ff ff ff     stx (0xFFFF)
e19b: ff ff ff     stx (0xFFFF)
e19e: ff ff ff     stx (0xFFFF)
e1a1: ff ff ff     stx (0xFFFF)
e1a4: ff ff ff     stx (0xFFFF)
e1a7: ff ff ff     stx (0xFFFF)
e1aa: ff ff ff     stx (0xFFFF)
e1ad: ff ff ff     stx (0xFFFF)
e1b0: ff ff ff     stx (0xFFFF)
e1b3: ff ff ff     stx (0xFFFF)
e1b6: ff ff ff     stx (0xFFFF)
e1b9: ff ff ff     stx (0xFFFF)
e1bc: ff ff ff     stx (0xFFFF)
e1bf: ff ff ff     stx (0xFFFF)
e1c2: ff ff ff     stx (0xFFFF)
e1c5: ff ff ff     stx (0xFFFF)
e1c8: ff ff ff     stx (0xFFFF)
e1cb: ff ff ff     stx (0xFFFF)
e1ce: ff ff ff     stx (0xFFFF)
e1d1: ff ff ff     stx (0xFFFF)
e1d4: ff ff ff     stx (0xFFFF)
e1d7: ff ff ff     stx (0xFFFF)
e1da: ff ff ff     stx (0xFFFF)
e1dd: ff ff ff     stx (0xFFFF)
e1e0: ff ff ff     stx (0xFFFF)
e1e3: ff ff ff     stx (0xFFFF)
e1e6: ff ff ff     stx (0xFFFF)
e1e9: ff ff ff     stx (0xFFFF)
e1ec: ff ff ff     stx (0xFFFF)
e1ef: ff ff ff     stx (0xFFFF)
e1f2: ff ff ff     stx (0xFFFF)
e1f5: ff ff ff     stx (0xFFFF)
e1f8: ff ff ff     stx (0xFFFF)
e1fb: ff ff ff     stx (0xFFFF)
e1fe: ff ff ff     stx (0xFFFF)
e201: ff ff ff     stx (0xFFFF)
e204: ff ff ff     stx (0xFFFF)
e207: ff ff ff     stx (0xFFFF)
e20a: ff ff ff     stx (0xFFFF)
e20d: ff ff ff     stx (0xFFFF)
e210: ff ff ff     stx (0xFFFF)
e213: ff ff ff     stx (0xFFFF)
e216: ff ff ff     stx (0xFFFF)
e219: ff ff ff     stx (0xFFFF)
e21c: ff ff ff     stx (0xFFFF)
e21f: ff ff ff     stx (0xFFFF)
e222: ff ff ff     stx (0xFFFF)
e225: ff ff ff     stx (0xFFFF)
e228: ff ff ff     stx (0xFFFF)
e22b: ff ff ff     stx (0xFFFF)
e22e: ff ff ff     stx (0xFFFF)
e231: ff ff ff     stx (0xFFFF)
e234: ff ff ff     stx (0xFFFF)
e237: ff ff ff     stx (0xFFFF)
e23a: ff ff ff     stx (0xFFFF)
e23d: ff ff ff     stx (0xFFFF)
e240: ff ff ff     stx (0xFFFF)
e243: ff ff ff     stx (0xFFFF)
e246: ff ff ff     stx (0xFFFF)
e249: ff ff ff     stx (0xFFFF)
e24c: ff ff ff     stx (0xFFFF)
e24f: ff ff ff     stx (0xFFFF)
e252: ff ff ff     stx (0xFFFF)
e255: ff ff ff     stx (0xFFFF)
e258: ff ff ff     stx (0xFFFF)
e25b: ff ff ff     stx (0xFFFF)
e25e: ff ff ff     stx (0xFFFF)
e261: ff ff ff     stx (0xFFFF)
e264: ff ff ff     stx (0xFFFF)
e267: ff ff ff     stx (0xFFFF)
e26a: ff ff ff     stx (0xFFFF)
e26d: ff ff ff     stx (0xFFFF)
e270: ff ff ff     stx (0xFFFF)
e273: ff ff ff     stx (0xFFFF)
e276: ff ff ff     stx (0xFFFF)
e279: ff ff ff     stx (0xFFFF)
e27c: ff ff ff     stx (0xFFFF)
e27f: ff ff ff     stx (0xFFFF)
e282: ff ff ff     stx (0xFFFF)
e285: ff ff ff     stx (0xFFFF)
e288: ff ff ff     stx (0xFFFF)
e28b: ff ff ff     stx (0xFFFF)
e28e: ff ff ff     stx (0xFFFF)
e291: ff ff ff     stx (0xFFFF)
e294: ff ff ff     stx (0xFFFF)
e297: ff ff ff     stx (0xFFFF)
e29a: ff ff ff     stx (0xFFFF)
e29d: ff ff ff     stx (0xFFFF)
e2a0: ff ff ff     stx (0xFFFF)
e2a3: ff ff ff     stx (0xFFFF)
e2a6: ff ff ff     stx (0xFFFF)
e2a9: ff ff ff     stx (0xFFFF)
e2ac: ff ff ff     stx (0xFFFF)
e2af: ff ff ff     stx (0xFFFF)
e2b2: ff ff ff     stx (0xFFFF)
e2b5: ff ff ff     stx (0xFFFF)
e2b8: ff ff ff     stx (0xFFFF)
e2bb: ff ff ff     stx (0xFFFF)
e2be: ff ff ff     stx (0xFFFF)
e2c1: ff ff ff     stx (0xFFFF)
e2c4: ff ff ff     stx (0xFFFF)
e2c7: ff ff ff     stx (0xFFFF)
e2ca: ff ff ff     stx (0xFFFF)
e2cd: ff ff ff     stx (0xFFFF)
e2d0: ff ff ff     stx (0xFFFF)
e2d3: ff ff ff     stx (0xFFFF)
e2d6: ff ff ff     stx (0xFFFF)
e2d9: ff ff ff     stx (0xFFFF)
e2dc: ff ff ff     stx (0xFFFF)
e2df: ff ff ff     stx (0xFFFF)
e2e2: ff ff ff     stx (0xFFFF)
e2e5: ff ff ff     stx (0xFFFF)
e2e8: ff ff ff     stx (0xFFFF)
e2eb: ff ff ff     stx (0xFFFF)
e2ee: ff ff ff     stx (0xFFFF)
e2f1: ff ff ff     stx (0xFFFF)
e2f4: ff ff ff     stx (0xFFFF)
e2f7: ff ff ff     stx (0xFFFF)
e2fa: ff ff ff     stx (0xFFFF)
e2fd: ff ff ff     stx (0xFFFF)
e300: ff ff ff     stx (0xFFFF)
e303: ff ff ff     stx (0xFFFF)
e306: ff ff ff     stx (0xFFFF)
e309: ff ff ff     stx (0xFFFF)
e30c: ff ff ff     stx (0xFFFF)
e30f: ff ff ff     stx (0xFFFF)
e312: ff ff ff     stx (0xFFFF)
e315: ff ff ff     stx (0xFFFF)
e318: ff ff ff     stx (0xFFFF)
e31b: ff ff ff     stx (0xFFFF)
e31e: ff ff ff     stx (0xFFFF)
e321: ff ff ff     stx (0xFFFF)
e324: ff ff ff     stx (0xFFFF)
e327: ff ff ff     stx (0xFFFF)
e32a: ff ff ff     stx (0xFFFF)
e32d: ff ff ff     stx (0xFFFF)
e330: ff ff ff     stx (0xFFFF)
e333: ff ff ff     stx (0xFFFF)
e336: ff ff ff     stx (0xFFFF)
e339: ff ff ff     stx (0xFFFF)
e33c: ff ff ff     stx (0xFFFF)
e33f: ff ff ff     stx (0xFFFF)
e342: ff ff ff     stx (0xFFFF)
e345: ff ff ff     stx (0xFFFF)
e348: ff ff ff     stx (0xFFFF)
e34b: ff ff ff     stx (0xFFFF)
e34e: ff ff ff     stx (0xFFFF)
e351: ff ff ff     stx (0xFFFF)
e354: ff ff ff     stx (0xFFFF)
e357: ff ff ff     stx (0xFFFF)
e35a: ff ff ff     stx (0xFFFF)
e35d: ff ff ff     stx (0xFFFF)
e360: ff ff ff     stx (0xFFFF)
e363: ff ff ff     stx (0xFFFF)
e366: ff ff ff     stx (0xFFFF)
e369: ff ff ff     stx (0xFFFF)
e36c: ff ff ff     stx (0xFFFF)
e36f: ff ff ff     stx (0xFFFF)
e372: ff ff ff     stx (0xFFFF)
e375: ff ff ff     stx (0xFFFF)
e378: ff ff ff     stx (0xFFFF)
e37b: ff ff ff     stx (0xFFFF)
e37e: ff ff ff     stx (0xFFFF)
e381: ff ff ff     stx (0xFFFF)
e384: ff ff ff     stx (0xFFFF)
e387: ff ff ff     stx (0xFFFF)
e38a: ff ff ff     stx (0xFFFF)
e38d: ff ff ff     stx (0xFFFF)
e390: ff ff ff     stx (0xFFFF)
e393: ff ff ff     stx (0xFFFF)
e396: ff ff ff     stx (0xFFFF)
e399: ff ff ff     stx (0xFFFF)
e39c: ff ff ff     stx (0xFFFF)
e39f: ff ff ff     stx (0xFFFF)
e3a2: ff ff ff     stx (0xFFFF)
e3a5: ff ff ff     stx (0xFFFF)
e3a8: ff ff ff     stx (0xFFFF)
e3ab: ff ff ff     stx (0xFFFF)
e3ae: ff ff ff     stx (0xFFFF)
e3b1: ff ff ff     stx (0xFFFF)
e3b4: ff ff ff     stx (0xFFFF)
e3b7: ff ff ff     stx (0xFFFF)
e3ba: ff ff ff     stx (0xFFFF)
e3bd: ff ff ff     stx (0xFFFF)
e3c0: ff ff ff     stx (0xFFFF)
e3c3: ff ff ff     stx (0xFFFF)
e3c6: ff ff ff     stx (0xFFFF)
e3c9: ff ff ff     stx (0xFFFF)
e3cc: ff ff ff     stx (0xFFFF)
e3cf: ff ff ff     stx (0xFFFF)
e3d2: ff ff ff     stx (0xFFFF)
e3d5: ff ff ff     stx (0xFFFF)
e3d8: ff ff ff     stx (0xFFFF)
e3db: ff ff ff     stx (0xFFFF)
e3de: ff ff ff     stx (0xFFFF)
e3e1: ff ff ff     stx (0xFFFF)
e3e4: ff ff ff     stx (0xFFFF)
e3e7: ff ff ff     stx (0xFFFF)
e3ea: ff ff ff     stx (0xFFFF)
e3ed: ff ff ff     stx (0xFFFF)
e3f0: ff ff ff     stx (0xFFFF)
e3f3: ff ff ff     stx (0xFFFF)
e3f6: ff ff ff     stx (0xFFFF)
e3f9: ff ff ff     stx (0xFFFF)
e3fc: ff ff ff     stx (0xFFFF)
e3ff: ff ff ff     stx (0xFFFF)
e402: ff ff ff     stx (0xFFFF)
e405: ff ff ff     stx (0xFFFF)
e408: ff ff ff     stx (0xFFFF)
e40b: ff ff ff     stx (0xFFFF)
e40e: ff ff ff     stx (0xFFFF)
e411: ff ff ff     stx (0xFFFF)
e414: ff ff ff     stx (0xFFFF)
e417: ff ff ff     stx (0xFFFF)
e41a: ff ff ff     stx (0xFFFF)
e41d: ff ff ff     stx (0xFFFF)
e420: ff ff ff     stx (0xFFFF)
e423: ff ff ff     stx (0xFFFF)
e426: ff ff ff     stx (0xFFFF)
e429: ff ff ff     stx (0xFFFF)
e42c: ff ff ff     stx (0xFFFF)
e42f: ff ff ff     stx (0xFFFF)
e432: ff ff ff     stx (0xFFFF)
e435: ff ff ff     stx (0xFFFF)
e438: ff ff ff     stx (0xFFFF)
e43b: ff ff ff     stx (0xFFFF)
e43e: ff ff ff     stx (0xFFFF)
e441: ff ff ff     stx (0xFFFF)
e444: ff ff ff     stx (0xFFFF)
e447: ff ff ff     stx (0xFFFF)
e44a: ff ff ff     stx (0xFFFF)
e44d: ff ff ff     stx (0xFFFF)
e450: ff ff ff     stx (0xFFFF)
e453: ff ff ff     stx (0xFFFF)
e456: ff ff ff     stx (0xFFFF)
e459: ff ff ff     stx (0xFFFF)
e45c: ff ff ff     stx (0xFFFF)
e45f: ff ff ff     stx (0xFFFF)
e462: ff ff ff     stx (0xFFFF)
e465: ff ff ff     stx (0xFFFF)
e468: ff ff ff     stx (0xFFFF)
e46b: ff ff ff     stx (0xFFFF)
e46e: ff ff ff     stx (0xFFFF)
e471: ff ff ff     stx (0xFFFF)
e474: ff ff ff     stx (0xFFFF)
e477: ff ff ff     stx (0xFFFF)
e47a: ff ff ff     stx (0xFFFF)
e47d: ff ff ff     stx (0xFFFF)
e480: ff ff ff     stx (0xFFFF)
e483: ff ff ff     stx (0xFFFF)
e486: ff ff ff     stx (0xFFFF)
e489: ff ff ff     stx (0xFFFF)
e48c: ff ff ff     stx (0xFFFF)
e48f: ff ff ff     stx (0xFFFF)
e492: ff ff ff     stx (0xFFFF)
e495: ff ff ff     stx (0xFFFF)
e498: ff ff ff     stx (0xFFFF)
e49b: ff ff ff     stx (0xFFFF)
e49e: ff ff ff     stx (0xFFFF)
e4a1: ff ff ff     stx (0xFFFF)
e4a4: ff ff ff     stx (0xFFFF)
e4a7: ff ff ff     stx (0xFFFF)
e4aa: ff ff ff     stx (0xFFFF)
e4ad: ff ff ff     stx (0xFFFF)
e4b0: ff ff ff     stx (0xFFFF)
e4b3: ff ff ff     stx (0xFFFF)
e4b6: ff ff ff     stx (0xFFFF)
e4b9: ff ff ff     stx (0xFFFF)
e4bc: ff ff ff     stx (0xFFFF)
e4bf: ff ff ff     stx (0xFFFF)
e4c2: ff ff ff     stx (0xFFFF)
e4c5: ff ff ff     stx (0xFFFF)
e4c8: ff ff ff     stx (0xFFFF)
e4cb: ff ff ff     stx (0xFFFF)
e4ce: ff ff ff     stx (0xFFFF)
e4d1: ff ff ff     stx (0xFFFF)
e4d4: ff ff ff     stx (0xFFFF)
e4d7: ff ff ff     stx (0xFFFF)
e4da: ff ff ff     stx (0xFFFF)
e4dd: ff ff ff     stx (0xFFFF)
e4e0: ff ff ff     stx (0xFFFF)
e4e3: ff ff ff     stx (0xFFFF)
e4e6: ff ff ff     stx (0xFFFF)
e4e9: ff ff ff     stx (0xFFFF)
e4ec: ff ff ff     stx (0xFFFF)
e4ef: ff ff ff     stx (0xFFFF)
e4f2: ff ff ff     stx (0xFFFF)
e4f5: ff ff ff     stx (0xFFFF)
e4f8: ff ff ff     stx (0xFFFF)
e4fb: ff ff ff     stx (0xFFFF)
e4fe: ff ff ff     stx (0xFFFF)
e501: ff ff ff     stx (0xFFFF)
e504: ff ff ff     stx (0xFFFF)
e507: ff ff ff     stx (0xFFFF)
e50a: ff ff ff     stx (0xFFFF)
e50d: ff ff ff     stx (0xFFFF)
e510: ff ff ff     stx (0xFFFF)
e513: ff ff ff     stx (0xFFFF)
e516: ff ff ff     stx (0xFFFF)
e519: ff ff ff     stx (0xFFFF)
e51c: ff ff ff     stx (0xFFFF)
e51f: ff ff ff     stx (0xFFFF)
e522: ff ff ff     stx (0xFFFF)
e525: ff ff ff     stx (0xFFFF)
e528: ff ff ff     stx (0xFFFF)
e52b: ff ff ff     stx (0xFFFF)
e52e: ff ff ff     stx (0xFFFF)
e531: ff ff ff     stx (0xFFFF)
e534: ff ff ff     stx (0xFFFF)
e537: ff ff ff     stx (0xFFFF)
e53a: ff ff ff     stx (0xFFFF)
e53d: ff ff ff     stx (0xFFFF)
e540: ff ff ff     stx (0xFFFF)
e543: ff ff ff     stx (0xFFFF)
e546: ff ff ff     stx (0xFFFF)
e549: ff ff ff     stx (0xFFFF)
e54c: ff ff ff     stx (0xFFFF)
e54f: ff ff ff     stx (0xFFFF)
e552: ff ff ff     stx (0xFFFF)
e555: ff ff ff     stx (0xFFFF)
e558: ff ff ff     stx (0xFFFF)
e55b: ff ff ff     stx (0xFFFF)
e55e: ff ff ff     stx (0xFFFF)
e561: ff ff ff     stx (0xFFFF)
e564: ff ff ff     stx (0xFFFF)
e567: ff ff ff     stx (0xFFFF)
e56a: ff ff ff     stx (0xFFFF)
e56d: ff ff ff     stx (0xFFFF)
e570: ff ff ff     stx (0xFFFF)
e573: ff ff ff     stx (0xFFFF)
e576: ff ff ff     stx (0xFFFF)
e579: ff ff ff     stx (0xFFFF)
e57c: ff ff ff     stx (0xFFFF)
e57f: ff ff ff     stx (0xFFFF)
e582: ff ff ff     stx (0xFFFF)
e585: ff ff ff     stx (0xFFFF)
e588: ff ff ff     stx (0xFFFF)
e58b: ff ff ff     stx (0xFFFF)
e58e: ff ff ff     stx (0xFFFF)
e591: ff ff ff     stx (0xFFFF)
e594: ff ff ff     stx (0xFFFF)
e597: ff ff ff     stx (0xFFFF)
e59a: ff ff ff     stx (0xFFFF)
e59d: ff ff ff     stx (0xFFFF)
e5a0: ff ff ff     stx (0xFFFF)
e5a3: ff ff ff     stx (0xFFFF)
e5a6: ff ff ff     stx (0xFFFF)
e5a9: ff ff ff     stx (0xFFFF)
e5ac: ff ff ff     stx (0xFFFF)
e5af: ff ff ff     stx (0xFFFF)
e5b2: ff ff ff     stx (0xFFFF)
e5b5: ff ff ff     stx (0xFFFF)
e5b8: ff ff ff     stx (0xFFFF)
e5bb: ff ff ff     stx (0xFFFF)
e5be: ff ff ff     stx (0xFFFF)
e5c1: ff ff ff     stx (0xFFFF)
e5c4: ff ff ff     stx (0xFFFF)
e5c7: ff ff ff     stx (0xFFFF)
e5ca: ff ff ff     stx (0xFFFF)
e5cd: ff ff ff     stx (0xFFFF)
e5d0: ff ff ff     stx (0xFFFF)
e5d3: ff ff ff     stx (0xFFFF)
e5d6: ff ff ff     stx (0xFFFF)
e5d9: ff ff ff     stx (0xFFFF)
e5dc: ff ff ff     stx (0xFFFF)
e5df: ff ff ff     stx (0xFFFF)
e5e2: ff ff ff     stx (0xFFFF)
e5e5: ff ff ff     stx (0xFFFF)
e5e8: ff ff ff     stx (0xFFFF)
e5eb: ff ff ff     stx (0xFFFF)
e5ee: ff ff ff     stx (0xFFFF)
e5f1: ff ff ff     stx (0xFFFF)
e5f4: ff ff ff     stx (0xFFFF)
e5f7: ff ff ff     stx (0xFFFF)
e5fa: ff ff ff     stx (0xFFFF)
e5fd: ff ff ff     stx (0xFFFF)
e600: ff ff ff     stx (0xFFFF)
e603: ff ff ff     stx (0xFFFF)
e606: ff ff ff     stx (0xFFFF)
e609: ff ff ff     stx (0xFFFF)
e60c: ff ff ff     stx (0xFFFF)
e60f: ff ff ff     stx (0xFFFF)
e612: ff ff ff     stx (0xFFFF)
e615: ff ff ff     stx (0xFFFF)
e618: ff ff ff     stx (0xFFFF)
e61b: ff ff ff     stx (0xFFFF)
e61e: ff ff ff     stx (0xFFFF)
e621: ff ff ff     stx (0xFFFF)
e624: ff ff ff     stx (0xFFFF)
e627: ff ff ff     stx (0xFFFF)
e62a: ff ff ff     stx (0xFFFF)
e62d: ff ff ff     stx (0xFFFF)
e630: ff ff ff     stx (0xFFFF)
e633: ff ff ff     stx (0xFFFF)
e636: ff ff ff     stx (0xFFFF)
e639: ff ff ff     stx (0xFFFF)
e63c: ff ff ff     stx (0xFFFF)
e63f: ff ff ff     stx (0xFFFF)
e642: ff ff ff     stx (0xFFFF)
e645: ff ff ff     stx (0xFFFF)
e648: ff ff ff     stx (0xFFFF)
e64b: ff ff ff     stx (0xFFFF)
e64e: ff ff ff     stx (0xFFFF)
e651: ff ff ff     stx (0xFFFF)
e654: ff ff ff     stx (0xFFFF)
e657: ff ff ff     stx (0xFFFF)
e65a: ff ff ff     stx (0xFFFF)
e65d: ff ff ff     stx (0xFFFF)
e660: ff ff ff     stx (0xFFFF)
e663: ff ff ff     stx (0xFFFF)
e666: ff ff ff     stx (0xFFFF)
e669: ff ff ff     stx (0xFFFF)
e66c: ff ff ff     stx (0xFFFF)
e66f: ff ff ff     stx (0xFFFF)
e672: ff ff ff     stx (0xFFFF)
e675: ff ff ff     stx (0xFFFF)
e678: ff ff ff     stx (0xFFFF)
e67b: ff ff ff     stx (0xFFFF)
e67e: ff ff ff     stx (0xFFFF)
e681: ff ff ff     stx (0xFFFF)
e684: ff ff ff     stx (0xFFFF)
e687: ff ff ff     stx (0xFFFF)
e68a: ff ff ff     stx (0xFFFF)
e68d: ff ff ff     stx (0xFFFF)
e690: ff ff ff     stx (0xFFFF)
e693: ff ff ff     stx (0xFFFF)
e696: ff ff ff     stx (0xFFFF)
e699: ff ff ff     stx (0xFFFF)
e69c: ff ff ff     stx (0xFFFF)
e69f: ff ff ff     stx (0xFFFF)
e6a2: ff ff ff     stx (0xFFFF)
e6a5: ff ff ff     stx (0xFFFF)
e6a8: ff ff ff     stx (0xFFFF)
e6ab: ff ff ff     stx (0xFFFF)
e6ae: ff ff ff     stx (0xFFFF)
e6b1: ff ff ff     stx (0xFFFF)
e6b4: ff ff ff     stx (0xFFFF)
e6b7: ff ff ff     stx (0xFFFF)
e6ba: ff ff ff     stx (0xFFFF)
e6bd: ff ff ff     stx (0xFFFF)
e6c0: ff ff ff     stx (0xFFFF)
e6c3: ff ff ff     stx (0xFFFF)
e6c6: ff ff ff     stx (0xFFFF)
e6c9: ff ff ff     stx (0xFFFF)
e6cc: ff ff ff     stx (0xFFFF)
e6cf: ff ff ff     stx (0xFFFF)
e6d2: ff ff ff     stx (0xFFFF)
e6d5: ff ff ff     stx (0xFFFF)
e6d8: ff ff ff     stx (0xFFFF)
e6db: ff ff ff     stx (0xFFFF)
e6de: ff ff ff     stx (0xFFFF)
e6e1: ff ff ff     stx (0xFFFF)
e6e4: ff ff ff     stx (0xFFFF)
e6e7: ff ff ff     stx (0xFFFF)
e6ea: ff ff ff     stx (0xFFFF)
e6ed: ff ff ff     stx (0xFFFF)
e6f0: ff ff ff     stx (0xFFFF)
e6f3: ff ff ff     stx (0xFFFF)
e6f6: ff ff ff     stx (0xFFFF)
e6f9: ff ff ff     stx (0xFFFF)
e6fc: ff ff ff     stx (0xFFFF)
e6ff: ff ff ff     stx (0xFFFF)
e702: ff ff ff     stx (0xFFFF)
e705: ff ff ff     stx (0xFFFF)
e708: ff ff ff     stx (0xFFFF)
e70b: ff ff ff     stx (0xFFFF)
e70e: ff ff ff     stx (0xFFFF)
e711: ff ff ff     stx (0xFFFF)
e714: ff ff ff     stx (0xFFFF)
e717: ff ff ff     stx (0xFFFF)
e71a: ff ff ff     stx (0xFFFF)
e71d: ff ff ff     stx (0xFFFF)
e720: ff ff ff     stx (0xFFFF)
e723: ff ff ff     stx (0xFFFF)
e726: ff ff ff     stx (0xFFFF)
e729: ff ff ff     stx (0xFFFF)
e72c: ff ff ff     stx (0xFFFF)
e72f: ff ff ff     stx (0xFFFF)
e732: ff ff ff     stx (0xFFFF)
e735: ff ff ff     stx (0xFFFF)
e738: ff ff ff     stx (0xFFFF)
e73b: ff ff ff     stx (0xFFFF)
e73e: ff ff ff     stx (0xFFFF)
e741: ff ff ff     stx (0xFFFF)
e744: ff ff ff     stx (0xFFFF)
e747: ff ff ff     stx (0xFFFF)
e74a: ff ff ff     stx (0xFFFF)
e74d: ff ff ff     stx (0xFFFF)
e750: ff ff ff     stx (0xFFFF)
e753: ff ff ff     stx (0xFFFF)
e756: ff ff ff     stx (0xFFFF)
e759: ff ff ff     stx (0xFFFF)
e75c: ff ff ff     stx (0xFFFF)
e75f: ff ff ff     stx (0xFFFF)
e762: ff ff ff     stx (0xFFFF)
e765: ff ff ff     stx (0xFFFF)
e768: ff ff ff     stx (0xFFFF)
e76b: ff ff ff     stx (0xFFFF)
e76e: ff ff ff     stx (0xFFFF)
e771: ff ff ff     stx (0xFFFF)
e774: ff ff ff     stx (0xFFFF)
e777: ff ff ff     stx (0xFFFF)
e77a: ff ff ff     stx (0xFFFF)
e77d: ff ff ff     stx (0xFFFF)
e780: ff ff ff     stx (0xFFFF)
e783: ff ff ff     stx (0xFFFF)
e786: ff ff ff     stx (0xFFFF)
e789: ff ff ff     stx (0xFFFF)
e78c: ff ff ff     stx (0xFFFF)
e78f: ff ff ff     stx (0xFFFF)
e792: ff ff ff     stx (0xFFFF)
e795: ff ff ff     stx (0xFFFF)
e798: ff ff ff     stx (0xFFFF)
e79b: ff ff ff     stx (0xFFFF)
e79e: ff ff ff     stx (0xFFFF)
e7a1: ff ff ff     stx (0xFFFF)
e7a4: ff ff ff     stx (0xFFFF)
e7a7: ff ff ff     stx (0xFFFF)
e7aa: ff ff ff     stx (0xFFFF)
e7ad: ff ff ff     stx (0xFFFF)
e7b0: ff ff ff     stx (0xFFFF)
e7b3: ff ff ff     stx (0xFFFF)
e7b6: ff ff ff     stx (0xFFFF)
e7b9: ff ff ff     stx (0xFFFF)
e7bc: ff ff ff     stx (0xFFFF)
e7bf: ff ff ff     stx (0xFFFF)
e7c2: ff ff ff     stx (0xFFFF)
e7c5: ff ff ff     stx (0xFFFF)
e7c8: ff ff ff     stx (0xFFFF)
e7cb: ff ff ff     stx (0xFFFF)
e7ce: ff ff ff     stx (0xFFFF)
e7d1: ff ff ff     stx (0xFFFF)
e7d4: ff ff ff     stx (0xFFFF)
e7d7: ff ff ff     stx (0xFFFF)
e7da: ff ff ff     stx (0xFFFF)
e7dd: ff ff ff     stx (0xFFFF)
e7e0: ff ff ff     stx (0xFFFF)
e7e3: ff ff ff     stx (0xFFFF)
e7e6: ff ff ff     stx (0xFFFF)
e7e9: ff ff ff     stx (0xFFFF)
e7ec: ff ff ff     stx (0xFFFF)
e7ef: ff ff ff     stx (0xFFFF)
e7f2: ff ff ff     stx (0xFFFF)
e7f5: ff ff ff     stx (0xFFFF)
e7f8: ff ff ff     stx (0xFFFF)
e7fb: ff ff ff     stx (0xFFFF)
e7fe: ff ff ff     stx (0xFFFF)
e801: ff ff ff     stx (0xFFFF)
e804: ff ff ff     stx (0xFFFF)
e807: ff ff ff     stx (0xFFFF)
e80a: ff ff ff     stx (0xFFFF)
e80d: ff ff ff     stx (0xFFFF)
e810: ff ff ff     stx (0xFFFF)
e813: ff ff ff     stx (0xFFFF)
e816: ff ff ff     stx (0xFFFF)
e819: ff ff ff     stx (0xFFFF)
e81c: ff ff ff     stx (0xFFFF)
e81f: ff ff ff     stx (0xFFFF)
e822: ff ff ff     stx (0xFFFF)
e825: ff ff ff     stx (0xFFFF)
e828: ff ff ff     stx (0xFFFF)
e82b: ff ff ff     stx (0xFFFF)
e82e: ff ff ff     stx (0xFFFF)
e831: ff ff ff     stx (0xFFFF)
e834: ff ff ff     stx (0xFFFF)
e837: ff ff ff     stx (0xFFFF)
e83a: ff ff ff     stx (0xFFFF)
e83d: ff ff ff     stx (0xFFFF)
e840: ff ff ff     stx (0xFFFF)
e843: ff ff ff     stx (0xFFFF)
e846: ff ff ff     stx (0xFFFF)
e849: ff ff ff     stx (0xFFFF)
e84c: ff ff ff     stx (0xFFFF)
e84f: ff ff ff     stx (0xFFFF)
e852: ff ff ff     stx (0xFFFF)
e855: ff ff ff     stx (0xFFFF)
e858: ff ff ff     stx (0xFFFF)
e85b: ff ff ff     stx (0xFFFF)
e85e: ff ff ff     stx (0xFFFF)
e861: ff ff ff     stx (0xFFFF)
e864: ff ff ff     stx (0xFFFF)
e867: ff ff ff     stx (0xFFFF)
e86a: ff ff ff     stx (0xFFFF)
e86d: ff ff ff     stx (0xFFFF)
e870: ff ff ff     stx (0xFFFF)
e873: ff ff ff     stx (0xFFFF)
e876: ff ff ff     stx (0xFFFF)
e879: ff ff ff     stx (0xFFFF)
e87c: ff ff ff     stx (0xFFFF)
e87f: ff ff ff     stx (0xFFFF)
e882: ff ff ff     stx (0xFFFF)
e885: ff ff ff     stx (0xFFFF)
e888: ff ff ff     stx (0xFFFF)
e88b: ff ff ff     stx (0xFFFF)
e88e: ff ff ff     stx (0xFFFF)
e891: ff ff ff     stx (0xFFFF)
e894: ff ff ff     stx (0xFFFF)
e897: ff ff ff     stx (0xFFFF)
e89a: ff ff ff     stx (0xFFFF)
e89d: ff ff ff     stx (0xFFFF)
e8a0: ff ff ff     stx (0xFFFF)
e8a3: ff ff ff     stx (0xFFFF)
e8a6: ff ff ff     stx (0xFFFF)
e8a9: ff ff ff     stx (0xFFFF)
e8ac: ff ff ff     stx (0xFFFF)
e8af: ff ff ff     stx (0xFFFF)
e8b2: ff ff ff     stx (0xFFFF)
e8b5: ff ff ff     stx (0xFFFF)
e8b8: ff ff ff     stx (0xFFFF)
e8bb: ff ff ff     stx (0xFFFF)
e8be: ff ff ff     stx (0xFFFF)
e8c1: ff ff ff     stx (0xFFFF)
e8c4: ff ff ff     stx (0xFFFF)
e8c7: ff ff ff     stx (0xFFFF)
e8ca: ff ff ff     stx (0xFFFF)
e8cd: ff ff ff     stx (0xFFFF)
e8d0: ff ff ff     stx (0xFFFF)
e8d3: ff ff ff     stx (0xFFFF)
e8d6: ff ff ff     stx (0xFFFF)
e8d9: ff ff ff     stx (0xFFFF)
e8dc: ff ff ff     stx (0xFFFF)
e8df: ff ff ff     stx (0xFFFF)
e8e2: ff ff ff     stx (0xFFFF)
e8e5: ff ff ff     stx (0xFFFF)
e8e8: ff ff ff     stx (0xFFFF)
e8eb: ff ff ff     stx (0xFFFF)
e8ee: ff ff ff     stx (0xFFFF)
e8f1: ff ff ff     stx (0xFFFF)
e8f4: ff ff ff     stx (0xFFFF)
e8f7: ff ff ff     stx (0xFFFF)
e8fa: ff ff ff     stx (0xFFFF)
e8fd: ff ff ff     stx (0xFFFF)
e900: ff ff ff     stx (0xFFFF)
e903: ff ff ff     stx (0xFFFF)
e906: ff ff ff     stx (0xFFFF)
e909: ff ff ff     stx (0xFFFF)
e90c: ff ff ff     stx (0xFFFF)
e90f: ff ff ff     stx (0xFFFF)
e912: ff ff ff     stx (0xFFFF)
e915: ff ff ff     stx (0xFFFF)
e918: ff ff ff     stx (0xFFFF)
e91b: ff ff ff     stx (0xFFFF)
e91e: ff ff ff     stx (0xFFFF)
e921: ff ff ff     stx (0xFFFF)
e924: ff ff ff     stx (0xFFFF)
e927: ff ff ff     stx (0xFFFF)
e92a: ff ff ff     stx (0xFFFF)
e92d: ff ff ff     stx (0xFFFF)
e930: ff ff ff     stx (0xFFFF)
e933: ff ff ff     stx (0xFFFF)
e936: ff ff ff     stx (0xFFFF)
e939: ff ff ff     stx (0xFFFF)
e93c: ff ff ff     stx (0xFFFF)
e93f: ff ff ff     stx (0xFFFF)
e942: ff ff ff     stx (0xFFFF)
e945: ff ff ff     stx (0xFFFF)
e948: ff ff ff     stx (0xFFFF)
e94b: ff ff ff     stx (0xFFFF)
e94e: ff ff ff     stx (0xFFFF)
e951: ff ff ff     stx (0xFFFF)
e954: ff ff ff     stx (0xFFFF)
e957: ff ff ff     stx (0xFFFF)
e95a: ff ff ff     stx (0xFFFF)
e95d: ff ff ff     stx (0xFFFF)
e960: ff ff ff     stx (0xFFFF)
e963: ff ff ff     stx (0xFFFF)
e966: ff ff ff     stx (0xFFFF)
e969: ff ff ff     stx (0xFFFF)
e96c: ff ff ff     stx (0xFFFF)
e96f: ff ff ff     stx (0xFFFF)
e972: ff ff ff     stx (0xFFFF)
e975: ff ff ff     stx (0xFFFF)
e978: ff ff ff     stx (0xFFFF)
e97b: ff ff ff     stx (0xFFFF)
e97e: ff ff ff     stx (0xFFFF)
e981: ff ff ff     stx (0xFFFF)
e984: ff ff ff     stx (0xFFFF)
e987: ff ff ff     stx (0xFFFF)
e98a: ff ff ff     stx (0xFFFF)
e98d: ff ff ff     stx (0xFFFF)
e990: ff ff ff     stx (0xFFFF)
e993: ff ff ff     stx (0xFFFF)
e996: ff ff ff     stx (0xFFFF)
e999: ff ff ff     stx (0xFFFF)
e99c: ff ff ff     stx (0xFFFF)
e99f: ff ff ff     stx (0xFFFF)
e9a2: ff ff ff     stx (0xFFFF)
e9a5: ff ff ff     stx (0xFFFF)
e9a8: ff ff ff     stx (0xFFFF)
e9ab: ff ff ff     stx (0xFFFF)
e9ae: ff ff ff     stx (0xFFFF)
e9b1: ff ff ff     stx (0xFFFF)
e9b4: ff ff ff     stx (0xFFFF)
e9b7: ff ff ff     stx (0xFFFF)
e9ba: ff ff ff     stx (0xFFFF)
e9bd: ff ff ff     stx (0xFFFF)
e9c0: ff ff ff     stx (0xFFFF)
e9c3: ff ff ff     stx (0xFFFF)
e9c6: ff ff ff     stx (0xFFFF)
e9c9: ff ff ff     stx (0xFFFF)
e9cc: ff ff ff     stx (0xFFFF)
e9cf: ff ff ff     stx (0xFFFF)
e9d2: ff ff ff     stx (0xFFFF)
e9d5: ff ff ff     stx (0xFFFF)
e9d8: ff ff ff     stx (0xFFFF)
e9db: ff ff ff     stx (0xFFFF)
e9de: ff ff ff     stx (0xFFFF)
e9e1: ff ff ff     stx (0xFFFF)
e9e4: ff ff ff     stx (0xFFFF)
e9e7: ff ff ff     stx (0xFFFF)
e9ea: ff ff ff     stx (0xFFFF)
e9ed: ff ff ff     stx (0xFFFF)
e9f0: ff ff ff     stx (0xFFFF)
e9f3: ff ff ff     stx (0xFFFF)
e9f6: ff ff ff     stx (0xFFFF)
e9f9: ff ff ff     stx (0xFFFF)
e9fc: ff ff ff     stx (0xFFFF)
e9ff: ff ff ff     stx (0xFFFF)
ea02: ff ff ff     stx (0xFFFF)
ea05: ff ff ff     stx (0xFFFF)
ea08: ff ff ff     stx (0xFFFF)
ea0b: ff ff ff     stx (0xFFFF)
ea0e: ff ff ff     stx (0xFFFF)
ea11: ff ff ff     stx (0xFFFF)
ea14: ff ff ff     stx (0xFFFF)
ea17: ff ff ff     stx (0xFFFF)
ea1a: ff ff ff     stx (0xFFFF)
ea1d: ff ff ff     stx (0xFFFF)
ea20: ff ff ff     stx (0xFFFF)
ea23: ff ff ff     stx (0xFFFF)
ea26: ff ff ff     stx (0xFFFF)
ea29: ff ff ff     stx (0xFFFF)
ea2c: ff ff ff     stx (0xFFFF)
ea2f: ff ff ff     stx (0xFFFF)
ea32: ff ff ff     stx (0xFFFF)
ea35: ff ff ff     stx (0xFFFF)
ea38: ff ff ff     stx (0xFFFF)
ea3b: ff ff ff     stx (0xFFFF)
ea3e: ff ff ff     stx (0xFFFF)
ea41: ff ff ff     stx (0xFFFF)
ea44: ff ff ff     stx (0xFFFF)
ea47: ff ff ff     stx (0xFFFF)
ea4a: ff ff ff     stx (0xFFFF)
ea4d: ff ff ff     stx (0xFFFF)
ea50: ff ff ff     stx (0xFFFF)
ea53: ff ff ff     stx (0xFFFF)
ea56: ff ff ff     stx (0xFFFF)
ea59: ff ff ff     stx (0xFFFF)
ea5c: ff ff ff     stx (0xFFFF)
ea5f: ff ff ff     stx (0xFFFF)
ea62: ff ff ff     stx (0xFFFF)
ea65: ff ff ff     stx (0xFFFF)
ea68: ff ff ff     stx (0xFFFF)
ea6b: ff ff ff     stx (0xFFFF)
ea6e: ff ff ff     stx (0xFFFF)
ea71: ff ff ff     stx (0xFFFF)
ea74: ff ff ff     stx (0xFFFF)
ea77: ff ff ff     stx (0xFFFF)
ea7a: ff ff ff     stx (0xFFFF)
ea7d: ff ff ff     stx (0xFFFF)
ea80: ff ff ff     stx (0xFFFF)
ea83: ff ff ff     stx (0xFFFF)
ea86: ff ff ff     stx (0xFFFF)
ea89: ff ff ff     stx (0xFFFF)
ea8c: ff ff ff     stx (0xFFFF)
ea8f: ff ff ff     stx (0xFFFF)
ea92: ff ff ff     stx (0xFFFF)
ea95: ff ff ff     stx (0xFFFF)
ea98: ff ff ff     stx (0xFFFF)
ea9b: ff ff ff     stx (0xFFFF)
ea9e: ff ff ff     stx (0xFFFF)
eaa1: ff ff ff     stx (0xFFFF)
eaa4: ff ff ff     stx (0xFFFF)
eaa7: ff ff ff     stx (0xFFFF)
eaaa: ff ff ff     stx (0xFFFF)
eaad: ff ff ff     stx (0xFFFF)
eab0: ff ff ff     stx (0xFFFF)
eab3: ff ff ff     stx (0xFFFF)
eab6: ff ff ff     stx (0xFFFF)
eab9: ff ff ff     stx (0xFFFF)
eabc: ff ff ff     stx (0xFFFF)
eabf: ff ff ff     stx (0xFFFF)
eac2: ff ff ff     stx (0xFFFF)
eac5: ff ff ff     stx (0xFFFF)
eac8: ff ff ff     stx (0xFFFF)
eacb: ff ff ff     stx (0xFFFF)
eace: ff ff ff     stx (0xFFFF)
ead1: ff ff ff     stx (0xFFFF)
ead4: ff ff ff     stx (0xFFFF)
ead7: ff ff ff     stx (0xFFFF)
eada: ff ff ff     stx (0xFFFF)
eadd: ff ff ff     stx (0xFFFF)
eae0: ff ff ff     stx (0xFFFF)
eae3: ff ff ff     stx (0xFFFF)
eae6: ff ff ff     stx (0xFFFF)
eae9: ff ff ff     stx (0xFFFF)
eaec: ff ff ff     stx (0xFFFF)
eaef: ff ff ff     stx (0xFFFF)
eaf2: ff ff ff     stx (0xFFFF)
eaf5: ff ff ff     stx (0xFFFF)
eaf8: ff ff ff     stx (0xFFFF)
eafb: ff ff ff     stx (0xFFFF)
eafe: ff ff ff     stx (0xFFFF)
eb01: ff ff ff     stx (0xFFFF)
eb04: ff ff ff     stx (0xFFFF)
eb07: ff ff ff     stx (0xFFFF)
eb0a: ff ff ff     stx (0xFFFF)
eb0d: ff ff ff     stx (0xFFFF)
eb10: ff ff ff     stx (0xFFFF)
eb13: ff ff ff     stx (0xFFFF)
eb16: ff ff ff     stx (0xFFFF)
eb19: ff ff ff     stx (0xFFFF)
eb1c: ff ff ff     stx (0xFFFF)
eb1f: ff ff ff     stx (0xFFFF)
eb22: ff ff ff     stx (0xFFFF)
eb25: ff ff ff     stx (0xFFFF)
eb28: ff ff ff     stx (0xFFFF)
eb2b: ff ff ff     stx (0xFFFF)
eb2e: ff ff ff     stx (0xFFFF)
eb31: ff ff ff     stx (0xFFFF)
eb34: ff ff ff     stx (0xFFFF)
eb37: ff ff ff     stx (0xFFFF)
eb3a: ff ff ff     stx (0xFFFF)
eb3d: ff ff ff     stx (0xFFFF)
eb40: ff ff ff     stx (0xFFFF)
eb43: ff ff ff     stx (0xFFFF)
eb46: ff ff ff     stx (0xFFFF)
eb49: ff ff ff     stx (0xFFFF)
eb4c: ff ff ff     stx (0xFFFF)
eb4f: ff ff ff     stx (0xFFFF)
eb52: ff ff ff     stx (0xFFFF)
eb55: ff ff ff     stx (0xFFFF)
eb58: ff ff ff     stx (0xFFFF)
eb5b: ff ff ff     stx (0xFFFF)
eb5e: ff ff ff     stx (0xFFFF)
eb61: ff ff ff     stx (0xFFFF)
eb64: ff ff ff     stx (0xFFFF)
eb67: ff ff ff     stx (0xFFFF)
eb6a: ff ff ff     stx (0xFFFF)
eb6d: ff ff ff     stx (0xFFFF)
eb70: ff ff ff     stx (0xFFFF)
eb73: ff ff ff     stx (0xFFFF)
eb76: ff ff ff     stx (0xFFFF)
eb79: ff ff ff     stx (0xFFFF)
eb7c: ff ff ff     stx (0xFFFF)
eb7f: ff ff ff     stx (0xFFFF)
eb82: ff ff ff     stx (0xFFFF)
eb85: ff ff ff     stx (0xFFFF)
eb88: ff ff ff     stx (0xFFFF)
eb8b: ff ff ff     stx (0xFFFF)
eb8e: ff ff ff     stx (0xFFFF)
eb91: ff ff ff     stx (0xFFFF)
eb94: ff ff ff     stx (0xFFFF)
eb97: ff ff ff     stx (0xFFFF)
eb9a: ff ff ff     stx (0xFFFF)
eb9d: ff ff ff     stx (0xFFFF)
eba0: ff ff ff     stx (0xFFFF)
eba3: ff ff ff     stx (0xFFFF)
eba6: ff ff ff     stx (0xFFFF)
eba9: ff ff ff     stx (0xFFFF)
ebac: ff ff ff     stx (0xFFFF)
ebaf: ff ff ff     stx (0xFFFF)
ebb2: ff ff ff     stx (0xFFFF)
ebb5: ff ff ff     stx (0xFFFF)
ebb8: ff ff ff     stx (0xFFFF)
ebbb: ff ff ff     stx (0xFFFF)
ebbe: ff ff ff     stx (0xFFFF)
ebc1: ff ff ff     stx (0xFFFF)
ebc4: ff ff ff     stx (0xFFFF)
ebc7: ff ff ff     stx (0xFFFF)
ebca: ff ff ff     stx (0xFFFF)
ebcd: ff ff ff     stx (0xFFFF)
ebd0: ff ff ff     stx (0xFFFF)
ebd3: ff ff ff     stx (0xFFFF)
ebd6: ff ff ff     stx (0xFFFF)
ebd9: ff ff ff     stx (0xFFFF)
ebdc: ff ff ff     stx (0xFFFF)
ebdf: ff ff ff     stx (0xFFFF)
ebe2: ff ff ff     stx (0xFFFF)
ebe5: ff ff ff     stx (0xFFFF)
ebe8: ff ff ff     stx (0xFFFF)
ebeb: ff ff ff     stx (0xFFFF)
ebee: ff ff ff     stx (0xFFFF)
ebf1: ff ff ff     stx (0xFFFF)
ebf4: ff ff ff     stx (0xFFFF)
ebf7: ff ff ff     stx (0xFFFF)
ebfa: ff ff ff     stx (0xFFFF)
ebfd: ff ff ff     stx (0xFFFF)
ec00: ff ff ff     stx (0xFFFF)
ec03: ff ff ff     stx (0xFFFF)
ec06: ff ff ff     stx (0xFFFF)
ec09: ff ff ff     stx (0xFFFF)
ec0c: ff ff ff     stx (0xFFFF)
ec0f: ff ff ff     stx (0xFFFF)
ec12: ff ff ff     stx (0xFFFF)
ec15: ff ff ff     stx (0xFFFF)
ec18: ff ff ff     stx (0xFFFF)
ec1b: ff ff ff     stx (0xFFFF)
ec1e: ff ff ff     stx (0xFFFF)
ec21: ff ff ff     stx (0xFFFF)
ec24: ff ff ff     stx (0xFFFF)
ec27: ff ff ff     stx (0xFFFF)
ec2a: ff ff ff     stx (0xFFFF)
ec2d: ff ff ff     stx (0xFFFF)
ec30: ff ff ff     stx (0xFFFF)
ec33: ff ff ff     stx (0xFFFF)
ec36: ff ff ff     stx (0xFFFF)
ec39: ff ff ff     stx (0xFFFF)
ec3c: ff ff ff     stx (0xFFFF)
ec3f: ff ff ff     stx (0xFFFF)
ec42: ff ff ff     stx (0xFFFF)
ec45: ff ff ff     stx (0xFFFF)
ec48: ff ff ff     stx (0xFFFF)
ec4b: ff ff ff     stx (0xFFFF)
ec4e: ff ff ff     stx (0xFFFF)
ec51: ff ff ff     stx (0xFFFF)
ec54: ff ff ff     stx (0xFFFF)
ec57: ff ff ff     stx (0xFFFF)
ec5a: ff ff ff     stx (0xFFFF)
ec5d: ff ff ff     stx (0xFFFF)
ec60: ff ff ff     stx (0xFFFF)
ec63: ff ff ff     stx (0xFFFF)
ec66: ff ff ff     stx (0xFFFF)
ec69: ff ff ff     stx (0xFFFF)
ec6c: ff ff ff     stx (0xFFFF)
ec6f: ff ff ff     stx (0xFFFF)
ec72: ff ff ff     stx (0xFFFF)
ec75: ff ff ff     stx (0xFFFF)
ec78: ff ff ff     stx (0xFFFF)
ec7b: ff ff ff     stx (0xFFFF)
ec7e: ff ff ff     stx (0xFFFF)
ec81: ff ff ff     stx (0xFFFF)
ec84: ff ff ff     stx (0xFFFF)
ec87: ff ff ff     stx (0xFFFF)
ec8a: ff ff ff     stx (0xFFFF)
ec8d: ff ff ff     stx (0xFFFF)
ec90: ff ff ff     stx (0xFFFF)
ec93: ff ff ff     stx (0xFFFF)
ec96: ff ff ff     stx (0xFFFF)
ec99: ff ff ff     stx (0xFFFF)
ec9c: ff ff ff     stx (0xFFFF)
ec9f: ff ff ff     stx (0xFFFF)
eca2: ff ff ff     stx (0xFFFF)
eca5: ff ff ff     stx (0xFFFF)
eca8: ff ff ff     stx (0xFFFF)
ecab: ff ff ff     stx (0xFFFF)
ecae: ff ff ff     stx (0xFFFF)
ecb1: ff ff ff     stx (0xFFFF)
ecb4: ff ff ff     stx (0xFFFF)
ecb7: ff ff ff     stx (0xFFFF)
ecba: ff ff ff     stx (0xFFFF)
ecbd: ff ff ff     stx (0xFFFF)
ecc0: ff ff ff     stx (0xFFFF)
ecc3: ff ff ff     stx (0xFFFF)
ecc6: ff ff ff     stx (0xFFFF)
ecc9: ff ff ff     stx (0xFFFF)
eccc: ff ff ff     stx (0xFFFF)
eccf: ff ff ff     stx (0xFFFF)
ecd2: ff ff ff     stx (0xFFFF)
ecd5: ff ff ff     stx (0xFFFF)
ecd8: ff ff ff     stx (0xFFFF)
ecdb: ff ff ff     stx (0xFFFF)
ecde: ff ff ff     stx (0xFFFF)
ece1: ff ff ff     stx (0xFFFF)
ece4: ff ff ff     stx (0xFFFF)
ece7: ff ff ff     stx (0xFFFF)
ecea: ff ff ff     stx (0xFFFF)
eced: ff ff ff     stx (0xFFFF)
ecf0: ff ff ff     stx (0xFFFF)
ecf3: ff ff ff     stx (0xFFFF)
ecf6: ff ff ff     stx (0xFFFF)
ecf9: ff ff ff     stx (0xFFFF)
ecfc: ff ff ff     stx (0xFFFF)
ecff: ff ff ff     stx (0xFFFF)
ed02: ff ff ff     stx (0xFFFF)
ed05: ff ff ff     stx (0xFFFF)
ed08: ff ff ff     stx (0xFFFF)
ed0b: ff ff ff     stx (0xFFFF)
ed0e: ff ff ff     stx (0xFFFF)
ed11: ff ff ff     stx (0xFFFF)
ed14: ff ff ff     stx (0xFFFF)
ed17: ff ff ff     stx (0xFFFF)
ed1a: ff ff ff     stx (0xFFFF)
ed1d: ff ff ff     stx (0xFFFF)
ed20: ff ff ff     stx (0xFFFF)
ed23: ff ff ff     stx (0xFFFF)
ed26: ff ff ff     stx (0xFFFF)
ed29: ff ff ff     stx (0xFFFF)
ed2c: ff ff ff     stx (0xFFFF)
ed2f: ff ff ff     stx (0xFFFF)
ed32: ff ff ff     stx (0xFFFF)
ed35: ff ff ff     stx (0xFFFF)
ed38: ff ff ff     stx (0xFFFF)
ed3b: ff ff ff     stx (0xFFFF)
ed3e: ff ff ff     stx (0xFFFF)
ed41: ff ff ff     stx (0xFFFF)
ed44: ff ff ff     stx (0xFFFF)
ed47: ff ff ff     stx (0xFFFF)
ed4a: ff ff ff     stx (0xFFFF)
ed4d: ff ff ff     stx (0xFFFF)
ed50: ff ff ff     stx (0xFFFF)
ed53: ff ff ff     stx (0xFFFF)
ed56: ff ff ff     stx (0xFFFF)
ed59: ff ff ff     stx (0xFFFF)
ed5c: ff ff ff     stx (0xFFFF)
ed5f: ff ff ff     stx (0xFFFF)
ed62: ff ff ff     stx (0xFFFF)
ed65: ff ff ff     stx (0xFFFF)
ed68: ff ff ff     stx (0xFFFF)
ed6b: ff ff ff     stx (0xFFFF)
ed6e: ff ff ff     stx (0xFFFF)
ed71: ff ff ff     stx (0xFFFF)
ed74: ff ff ff     stx (0xFFFF)
ed77: ff ff ff     stx (0xFFFF)
ed7a: ff ff ff     stx (0xFFFF)
ed7d: ff ff ff     stx (0xFFFF)
ed80: ff ff ff     stx (0xFFFF)
ed83: ff ff ff     stx (0xFFFF)
ed86: ff ff ff     stx (0xFFFF)
ed89: ff ff ff     stx (0xFFFF)
ed8c: ff ff ff     stx (0xFFFF)
ed8f: ff ff ff     stx (0xFFFF)
ed92: ff ff ff     stx (0xFFFF)
ed95: ff ff ff     stx (0xFFFF)
ed98: ff ff ff     stx (0xFFFF)
ed9b: ff ff ff     stx (0xFFFF)
ed9e: ff ff ff     stx (0xFFFF)
eda1: ff ff ff     stx (0xFFFF)
eda4: ff ff ff     stx (0xFFFF)
eda7: ff ff ff     stx (0xFFFF)
edaa: ff ff ff     stx (0xFFFF)
edad: ff ff ff     stx (0xFFFF)
edb0: ff ff ff     stx (0xFFFF)
edb3: ff ff ff     stx (0xFFFF)
edb6: ff ff ff     stx (0xFFFF)
edb9: ff ff ff     stx (0xFFFF)
edbc: ff ff ff     stx (0xFFFF)
edbf: ff ff ff     stx (0xFFFF)
edc2: ff ff ff     stx (0xFFFF)
edc5: ff ff ff     stx (0xFFFF)
edc8: ff ff ff     stx (0xFFFF)
edcb: ff ff ff     stx (0xFFFF)
edce: ff ff ff     stx (0xFFFF)
edd1: ff ff ff     stx (0xFFFF)
edd4: ff ff ff     stx (0xFFFF)
edd7: ff ff ff     stx (0xFFFF)
edda: ff ff ff     stx (0xFFFF)
eddd: ff ff ff     stx (0xFFFF)
ede0: ff ff ff     stx (0xFFFF)
ede3: ff ff ff     stx (0xFFFF)
ede6: ff ff ff     stx (0xFFFF)
ede9: ff ff ff     stx (0xFFFF)
edec: ff ff ff     stx (0xFFFF)
edef: ff ff ff     stx (0xFFFF)
edf2: ff ff ff     stx (0xFFFF)
edf5: ff ff ff     stx (0xFFFF)
edf8: ff ff ff     stx (0xFFFF)
edfb: ff ff ff     stx (0xFFFF)
edfe: ff ff ff     stx (0xFFFF)
ee01: ff ff ff     stx (0xFFFF)
ee04: ff ff ff     stx (0xFFFF)
ee07: ff ff ff     stx (0xFFFF)
ee0a: ff ff ff     stx (0xFFFF)
ee0d: ff ff ff     stx (0xFFFF)
ee10: ff ff ff     stx (0xFFFF)
ee13: ff ff ff     stx (0xFFFF)
ee16: ff ff ff     stx (0xFFFF)
ee19: ff ff ff     stx (0xFFFF)
ee1c: ff ff ff     stx (0xFFFF)
ee1f: ff ff ff     stx (0xFFFF)
ee22: ff ff ff     stx (0xFFFF)
ee25: ff ff ff     stx (0xFFFF)
ee28: ff ff ff     stx (0xFFFF)
ee2b: ff ff ff     stx (0xFFFF)
ee2e: ff ff ff     stx (0xFFFF)
ee31: ff ff ff     stx (0xFFFF)
ee34: ff ff ff     stx (0xFFFF)
ee37: ff ff ff     stx (0xFFFF)
ee3a: ff ff ff     stx (0xFFFF)
ee3d: ff ff ff     stx (0xFFFF)
ee40: ff ff ff     stx (0xFFFF)
ee43: ff ff ff     stx (0xFFFF)
ee46: ff ff ff     stx (0xFFFF)
ee49: ff ff ff     stx (0xFFFF)
ee4c: ff ff ff     stx (0xFFFF)
ee4f: ff ff ff     stx (0xFFFF)
ee52: ff ff ff     stx (0xFFFF)
ee55: ff ff ff     stx (0xFFFF)
ee58: ff ff ff     stx (0xFFFF)
ee5b: ff ff ff     stx (0xFFFF)
ee5e: ff ff ff     stx (0xFFFF)
ee61: ff ff ff     stx (0xFFFF)
ee64: ff ff ff     stx (0xFFFF)
ee67: ff ff ff     stx (0xFFFF)
ee6a: ff ff ff     stx (0xFFFF)
ee6d: ff ff ff     stx (0xFFFF)
ee70: ff ff ff     stx (0xFFFF)
ee73: ff ff ff     stx (0xFFFF)
ee76: ff ff ff     stx (0xFFFF)
ee79: ff ff ff     stx (0xFFFF)
ee7c: ff ff ff     stx (0xFFFF)
ee7f: ff ff ff     stx (0xFFFF)
ee82: ff ff ff     stx (0xFFFF)
ee85: ff ff ff     stx (0xFFFF)
ee88: ff ff ff     stx (0xFFFF)
ee8b: ff ff ff     stx (0xFFFF)
ee8e: ff ff ff     stx (0xFFFF)
ee91: ff ff ff     stx (0xFFFF)
ee94: ff ff ff     stx (0xFFFF)
ee97: ff ff ff     stx (0xFFFF)
ee9a: ff ff ff     stx (0xFFFF)
ee9d: ff ff ff     stx (0xFFFF)
eea0: ff ff ff     stx (0xFFFF)
eea3: ff ff ff     stx (0xFFFF)
eea6: ff ff ff     stx (0xFFFF)
eea9: ff ff ff     stx (0xFFFF)
eeac: ff ff ff     stx (0xFFFF)
eeaf: ff ff ff     stx (0xFFFF)
eeb2: ff ff ff     stx (0xFFFF)
eeb5: ff ff ff     stx (0xFFFF)
eeb8: ff ff ff     stx (0xFFFF)
eebb: ff ff ff     stx (0xFFFF)
eebe: ff ff ff     stx (0xFFFF)
eec1: ff ff ff     stx (0xFFFF)
eec4: ff ff ff     stx (0xFFFF)
eec7: ff ff ff     stx (0xFFFF)
eeca: ff ff ff     stx (0xFFFF)
eecd: ff ff ff     stx (0xFFFF)
eed0: ff ff ff     stx (0xFFFF)
eed3: ff ff ff     stx (0xFFFF)
eed6: ff ff ff     stx (0xFFFF)
eed9: ff ff ff     stx (0xFFFF)
eedc: ff ff ff     stx (0xFFFF)
eedf: ff ff ff     stx (0xFFFF)
eee2: ff ff ff     stx (0xFFFF)
eee5: ff ff ff     stx (0xFFFF)
eee8: ff ff ff     stx (0xFFFF)
eeeb: ff ff ff     stx (0xFFFF)
eeee: ff ff ff     stx (0xFFFF)
eef1: ff ff ff     stx (0xFFFF)
eef4: ff ff ff     stx (0xFFFF)
eef7: ff ff ff     stx (0xFFFF)
eefa: ff ff ff     stx (0xFFFF)
eefd: ff ff ff     stx (0xFFFF)
ef00: ff ff ff     stx (0xFFFF)
ef03: ff ff ff     stx (0xFFFF)
ef06: ff ff ff     stx (0xFFFF)
ef09: ff ff ff     stx (0xFFFF)
ef0c: ff ff ff     stx (0xFFFF)
ef0f: ff ff ff     stx (0xFFFF)
ef12: ff ff ff     stx (0xFFFF)
ef15: ff ff ff     stx (0xFFFF)
ef18: ff ff ff     stx (0xFFFF)
ef1b: ff ff ff     stx (0xFFFF)
ef1e: ff ff ff     stx (0xFFFF)
ef21: ff ff ff     stx (0xFFFF)
ef24: ff ff ff     stx (0xFFFF)
ef27: ff ff ff     stx (0xFFFF)
ef2a: ff ff ff     stx (0xFFFF)
ef2d: ff ff ff     stx (0xFFFF)
ef30: ff ff ff     stx (0xFFFF)
ef33: ff ff ff     stx (0xFFFF)
ef36: ff ff ff     stx (0xFFFF)
ef39: ff ff ff     stx (0xFFFF)
ef3c: ff ff ff     stx (0xFFFF)
ef3f: ff ff ff     stx (0xFFFF)
ef42: ff ff ff     stx (0xFFFF)
ef45: ff ff ff     stx (0xFFFF)
ef48: ff ff ff     stx (0xFFFF)
ef4b: ff ff ff     stx (0xFFFF)
ef4e: ff ff ff     stx (0xFFFF)
ef51: ff ff ff     stx (0xFFFF)
ef54: ff ff ff     stx (0xFFFF)
ef57: ff ff ff     stx (0xFFFF)
ef5a: ff ff ff     stx (0xFFFF)
ef5d: ff ff ff     stx (0xFFFF)
ef60: ff ff ff     stx (0xFFFF)
ef63: ff ff ff     stx (0xFFFF)
ef66: ff ff ff     stx (0xFFFF)
ef69: ff ff ff     stx (0xFFFF)
ef6c: ff ff ff     stx (0xFFFF)
ef6f: ff ff ff     stx (0xFFFF)
ef72: ff ff ff     stx (0xFFFF)
ef75: ff ff ff     stx (0xFFFF)
ef78: ff ff ff     stx (0xFFFF)
ef7b: ff ff ff     stx (0xFFFF)
ef7e: ff ff ff     stx (0xFFFF)
ef81: ff ff ff     stx (0xFFFF)
ef84: ff ff ff     stx (0xFFFF)
ef87: ff ff ff     stx (0xFFFF)
ef8a: ff ff ff     stx (0xFFFF)
ef8d: ff ff ff     stx (0xFFFF)
ef90: ff ff ff     stx (0xFFFF)
ef93: ff ff ff     stx (0xFFFF)
ef96: ff ff ff     stx (0xFFFF)
ef99: ff ff ff     stx (0xFFFF)
ef9c: ff ff ff     stx (0xFFFF)
ef9f: ff ff ff     stx (0xFFFF)
efa2: ff ff ff     stx (0xFFFF)
efa5: ff ff ff     stx (0xFFFF)
efa8: ff ff ff     stx (0xFFFF)
efab: ff ff ff     stx (0xFFFF)
efae: ff ff ff     stx (0xFFFF)
efb1: ff ff ff     stx (0xFFFF)
efb4: ff ff ff     stx (0xFFFF)
efb7: ff ff ff     stx (0xFFFF)
efba: ff ff ff     stx (0xFFFF)
efbd: ff ff ff     stx (0xFFFF)
efc0: ff ff ff     stx (0xFFFF)
efc3: ff ff ff     stx (0xFFFF)
efc6: ff ff ff     stx (0xFFFF)
efc9: ff ff ff     stx (0xFFFF)
efcc: ff ff ff     stx (0xFFFF)
efcf: ff ff ff     stx (0xFFFF)
efd2: ff ff ff     stx (0xFFFF)
efd5: ff ff ff     stx (0xFFFF)
efd8: ff ff ff     stx (0xFFFF)
efdb: ff ff ff     stx (0xFFFF)
efde: ff ff ff     stx (0xFFFF)
efe1: ff ff ff     stx (0xFFFF)
efe4: ff ff ff     stx (0xFFFF)
efe7: ff ff ff     stx (0xFFFF)
efea: ff ff ff     stx (0xFFFF)
efed: ff ff ff     stx (0xFFFF)
eff0: ff ff ff     stx (0xFFFF)
eff3: ff ff ff     stx (0xFFFF)
eff6: ff ff ff     stx (0xFFFF)
eff9: ff ff ff     stx (0xFFFF)
effc: ff ff ff     stx (0xFFFF)
efff: ff ff ff     stx (0xFFFF)
f002: ff ff ff     stx (0xFFFF)
f005: ff ff ff     stx (0xFFFF)
f008: ff ff ff     stx (0xFFFF)
f00b: ff ff ff     stx (0xFFFF)
f00e: ff ff ff     stx (0xFFFF)
f011: ff ff ff     stx (0xFFFF)
f014: ff ff ff     stx (0xFFFF)
f017: ff ff ff     stx (0xFFFF)
f01a: ff ff ff     stx (0xFFFF)
f01d: ff ff ff     stx (0xFFFF)
f020: ff ff ff     stx (0xFFFF)
f023: ff ff ff     stx (0xFFFF)
f026: ff ff ff     stx (0xFFFF)
f029: ff ff ff     stx (0xFFFF)
f02c: ff ff ff     stx (0xFFFF)
f02f: ff ff ff     stx (0xFFFF)
f032: ff ff ff     stx (0xFFFF)
f035: ff ff ff     stx (0xFFFF)
f038: ff ff ff     stx (0xFFFF)
f03b: ff ff ff     stx (0xFFFF)
f03e: ff ff ff     stx (0xFFFF)
f041: ff ff ff     stx (0xFFFF)
f044: ff ff ff     stx (0xFFFF)
f047: ff ff ff     stx (0xFFFF)
f04a: ff ff ff     stx (0xFFFF)
f04d: ff ff ff     stx (0xFFFF)
f050: ff ff ff     stx (0xFFFF)
f053: ff ff ff     stx (0xFFFF)
f056: ff ff ff     stx (0xFFFF)
f059: ff ff ff     stx (0xFFFF)
f05c: ff ff ff     stx (0xFFFF)
f05f: ff ff ff     stx (0xFFFF)
f062: ff ff ff     stx (0xFFFF)
f065: ff ff ff     stx (0xFFFF)
f068: ff ff ff     stx (0xFFFF)
f06b: ff ff ff     stx (0xFFFF)
f06e: ff ff ff     stx (0xFFFF)
f071: ff ff ff     stx (0xFFFF)
f074: ff ff ff     stx (0xFFFF)
f077: ff ff ff     stx (0xFFFF)
f07a: ff ff ff     stx (0xFFFF)
f07d: ff ff ff     stx (0xFFFF)
f080: ff ff ff     stx (0xFFFF)
f083: ff ff ff     stx (0xFFFF)
f086: ff ff ff     stx (0xFFFF)
f089: ff ff ff     stx (0xFFFF)
f08c: ff ff ff     stx (0xFFFF)
f08f: ff ff ff     stx (0xFFFF)
f092: ff ff ff     stx (0xFFFF)
f095: ff ff ff     stx (0xFFFF)
f098: ff ff ff     stx (0xFFFF)
f09b: ff ff ff     stx (0xFFFF)
f09e: ff ff ff     stx (0xFFFF)
f0a1: ff ff ff     stx (0xFFFF)
f0a4: ff ff ff     stx (0xFFFF)
f0a7: ff ff ff     stx (0xFFFF)
f0aa: ff ff ff     stx (0xFFFF)
f0ad: ff ff ff     stx (0xFFFF)
f0b0: ff ff ff     stx (0xFFFF)
f0b3: ff ff ff     stx (0xFFFF)
f0b6: ff ff ff     stx (0xFFFF)
f0b9: ff ff ff     stx (0xFFFF)
f0bc: ff ff ff     stx (0xFFFF)
f0bf: ff ff ff     stx (0xFFFF)
f0c2: ff ff ff     stx (0xFFFF)
f0c5: ff ff ff     stx (0xFFFF)
f0c8: ff ff ff     stx (0xFFFF)
f0cb: ff ff ff     stx (0xFFFF)
f0ce: ff ff ff     stx (0xFFFF)
f0d1: ff ff ff     stx (0xFFFF)
f0d4: ff ff ff     stx (0xFFFF)
f0d7: ff ff ff     stx (0xFFFF)
f0da: ff ff ff     stx (0xFFFF)
f0dd: ff ff ff     stx (0xFFFF)
f0e0: ff ff ff     stx (0xFFFF)
f0e3: ff ff ff     stx (0xFFFF)
f0e6: ff ff ff     stx (0xFFFF)
f0e9: ff ff ff     stx (0xFFFF)
f0ec: ff ff ff     stx (0xFFFF)
f0ef: ff ff ff     stx (0xFFFF)
f0f2: ff ff ff     stx (0xFFFF)
f0f5: ff ff ff     stx (0xFFFF)
f0f8: ff ff ff     stx (0xFFFF)
f0fb: ff ff ff     stx (0xFFFF)
f0fe: ff ff ff     stx (0xFFFF)
f101: ff ff ff     stx (0xFFFF)
f104: ff ff ff     stx (0xFFFF)
f107: ff ff ff     stx (0xFFFF)
f10a: ff ff ff     stx (0xFFFF)
f10d: ff ff ff     stx (0xFFFF)
f110: ff ff ff     stx (0xFFFF)
f113: ff ff ff     stx (0xFFFF)
f116: ff ff ff     stx (0xFFFF)
f119: ff ff ff     stx (0xFFFF)
f11c: ff ff ff     stx (0xFFFF)
f11f: ff ff ff     stx (0xFFFF)
f122: ff ff ff     stx (0xFFFF)
f125: ff ff ff     stx (0xFFFF)
f128: ff ff ff     stx (0xFFFF)
f12b: ff ff ff     stx (0xFFFF)
f12e: ff ff ff     stx (0xFFFF)
f131: ff ff ff     stx (0xFFFF)
f134: ff ff ff     stx (0xFFFF)
f137: ff ff ff     stx (0xFFFF)
f13a: ff ff ff     stx (0xFFFF)
f13d: ff ff ff     stx (0xFFFF)
f140: ff ff ff     stx (0xFFFF)
f143: ff ff ff     stx (0xFFFF)
f146: ff ff ff     stx (0xFFFF)
f149: ff ff ff     stx (0xFFFF)
f14c: ff ff ff     stx (0xFFFF)
f14f: ff ff ff     stx (0xFFFF)
f152: ff ff ff     stx (0xFFFF)
f155: ff ff ff     stx (0xFFFF)
f158: ff ff ff     stx (0xFFFF)
f15b: ff ff ff     stx (0xFFFF)
f15e: ff ff ff     stx (0xFFFF)
f161: ff ff ff     stx (0xFFFF)
f164: ff ff ff     stx (0xFFFF)
f167: ff ff ff     stx (0xFFFF)
f16a: ff ff ff     stx (0xFFFF)
f16d: ff ff ff     stx (0xFFFF)
f170: ff ff ff     stx (0xFFFF)
f173: ff ff ff     stx (0xFFFF)
f176: ff ff ff     stx (0xFFFF)
f179: ff ff ff     stx (0xFFFF)
f17c: ff ff ff     stx (0xFFFF)
f17f: ff ff ff     stx (0xFFFF)
f182: ff ff ff     stx (0xFFFF)
f185: ff ff ff     stx (0xFFFF)
f188: ff ff ff     stx (0xFFFF)
f18b: ff ff ff     stx (0xFFFF)
f18e: ff ff ff     stx (0xFFFF)
f191: ff ff ff     stx (0xFFFF)
f194: ff ff ff     stx (0xFFFF)
f197: ff ff ff     stx (0xFFFF)
f19a: ff ff ff     stx (0xFFFF)
f19d: ff ff ff     stx (0xFFFF)
f1a0: ff ff ff     stx (0xFFFF)
f1a3: ff ff ff     stx (0xFFFF)
f1a6: ff ff ff     stx (0xFFFF)
f1a9: ff ff ff     stx (0xFFFF)
f1ac: ff ff ff     stx (0xFFFF)
f1af: ff ff ff     stx (0xFFFF)
f1b2: ff ff ff     stx (0xFFFF)
f1b5: ff ff ff     stx (0xFFFF)
f1b8: ff ff ff     stx (0xFFFF)
f1bb: ff ff ff     stx (0xFFFF)
f1be: ff ff ff     stx (0xFFFF)
f1c1: ff ff ff     stx (0xFFFF)
f1c4: ff ff ff     stx (0xFFFF)
f1c7: ff ff ff     stx (0xFFFF)
f1ca: ff ff ff     stx (0xFFFF)
f1cd: ff ff ff     stx (0xFFFF)
f1d0: ff ff ff     stx (0xFFFF)
f1d3: ff ff ff     stx (0xFFFF)
f1d6: ff ff ff     stx (0xFFFF)
f1d9: ff ff ff     stx (0xFFFF)
f1dc: ff ff ff     stx (0xFFFF)
f1df: ff ff ff     stx (0xFFFF)
f1e2: ff ff ff     stx (0xFFFF)
f1e5: ff ff ff     stx (0xFFFF)
f1e8: ff ff ff     stx (0xFFFF)
f1eb: ff ff ff     stx (0xFFFF)
f1ee: ff ff ff     stx (0xFFFF)
f1f1: ff ff ff     stx (0xFFFF)
f1f4: ff ff ff     stx (0xFFFF)
f1f7: ff ff ff     stx (0xFFFF)
f1fa: ff ff ff     stx (0xFFFF)
f1fd: ff ff ff     stx (0xFFFF)
f200: ff ff ff     stx (0xFFFF)
f203: ff ff ff     stx (0xFFFF)
f206: ff ff ff     stx (0xFFFF)
f209: ff ff ff     stx (0xFFFF)
f20c: ff ff ff     stx (0xFFFF)
f20f: ff ff ff     stx (0xFFFF)
f212: ff ff ff     stx (0xFFFF)
f215: ff ff ff     stx (0xFFFF)
f218: ff ff ff     stx (0xFFFF)
f21b: ff ff ff     stx (0xFFFF)
f21e: ff ff ff     stx (0xFFFF)
f221: ff ff ff     stx (0xFFFF)
f224: ff ff ff     stx (0xFFFF)
f227: ff ff ff     stx (0xFFFF)
f22a: ff ff ff     stx (0xFFFF)
f22d: ff ff ff     stx (0xFFFF)
f230: ff ff ff     stx (0xFFFF)
f233: ff ff ff     stx (0xFFFF)
f236: ff ff ff     stx (0xFFFF)
f239: ff ff ff     stx (0xFFFF)
f23c: ff ff ff     stx (0xFFFF)
f23f: ff ff ff     stx (0xFFFF)
f242: ff ff ff     stx (0xFFFF)
f245: ff ff ff     stx (0xFFFF)
f248: ff ff ff     stx (0xFFFF)
f24b: ff ff ff     stx (0xFFFF)
f24e: ff ff ff     stx (0xFFFF)
f251: ff ff ff     stx (0xFFFF)
f254: ff ff ff     stx (0xFFFF)
f257: ff ff ff     stx (0xFFFF)
f25a: ff ff ff     stx (0xFFFF)
f25d: ff ff ff     stx (0xFFFF)
f260: ff ff ff     stx (0xFFFF)
f263: ff ff ff     stx (0xFFFF)
f266: ff ff ff     stx (0xFFFF)
f269: ff ff ff     stx (0xFFFF)
f26c: ff ff ff     stx (0xFFFF)
f26f: ff ff ff     stx (0xFFFF)
f272: ff ff ff     stx (0xFFFF)
f275: ff ff ff     stx (0xFFFF)
f278: ff ff ff     stx (0xFFFF)
f27b: ff ff ff     stx (0xFFFF)
f27e: ff ff ff     stx (0xFFFF)
f281: ff ff ff     stx (0xFFFF)
f284: ff ff ff     stx (0xFFFF)
f287: ff ff ff     stx (0xFFFF)
f28a: ff ff ff     stx (0xFFFF)
f28d: ff ff ff     stx (0xFFFF)
f290: ff ff ff     stx (0xFFFF)
f293: ff ff ff     stx (0xFFFF)
f296: ff ff ff     stx (0xFFFF)
f299: ff ff ff     stx (0xFFFF)
f29c: ff ff ff     stx (0xFFFF)
f29f: ff ff ff     stx (0xFFFF)
f2a2: ff ff ff     stx (0xFFFF)
f2a5: ff ff ff     stx (0xFFFF)
f2a8: ff ff ff     stx (0xFFFF)
f2ab: ff ff ff     stx (0xFFFF)
f2ae: ff ff ff     stx (0xFFFF)
f2b1: ff ff ff     stx (0xFFFF)
f2b4: ff ff ff     stx (0xFFFF)
f2b7: ff ff ff     stx (0xFFFF)
f2ba: ff ff ff     stx (0xFFFF)
f2bd: ff ff ff     stx (0xFFFF)
f2c0: ff ff ff     stx (0xFFFF)
f2c3: ff ff ff     stx (0xFFFF)
f2c6: ff ff ff     stx (0xFFFF)
f2c9: ff ff ff     stx (0xFFFF)
f2cc: ff ff ff     stx (0xFFFF)
f2cf: ff ff ff     stx (0xFFFF)
f2d2: ff ff ff     stx (0xFFFF)
f2d5: ff ff ff     stx (0xFFFF)
f2d8: ff ff ff     stx (0xFFFF)
f2db: ff ff ff     stx (0xFFFF)
f2de: ff ff ff     stx (0xFFFF)
f2e1: ff ff ff     stx (0xFFFF)
f2e4: ff ff ff     stx (0xFFFF)
f2e7: ff ff ff     stx (0xFFFF)
f2ea: ff ff ff     stx (0xFFFF)
f2ed: ff ff ff     stx (0xFFFF)
f2f0: ff ff ff     stx (0xFFFF)
f2f3: ff ff ff     stx (0xFFFF)
f2f6: ff ff ff     stx (0xFFFF)
f2f9: ff ff ff     stx (0xFFFF)
f2fc: ff ff ff     stx (0xFFFF)
f2ff: ff ff ff     stx (0xFFFF)
f302: ff ff ff     stx (0xFFFF)
f305: ff ff ff     stx (0xFFFF)
f308: ff ff ff     stx (0xFFFF)
f30b: ff ff ff     stx (0xFFFF)
f30e: ff ff ff     stx (0xFFFF)
f311: ff ff ff     stx (0xFFFF)
f314: ff ff ff     stx (0xFFFF)
f317: ff ff ff     stx (0xFFFF)
f31a: ff ff ff     stx (0xFFFF)
f31d: ff ff ff     stx (0xFFFF)
f320: ff ff ff     stx (0xFFFF)
f323: ff ff ff     stx (0xFFFF)
f326: ff ff ff     stx (0xFFFF)
f329: ff ff ff     stx (0xFFFF)
f32c: ff ff ff     stx (0xFFFF)
f32f: ff ff ff     stx (0xFFFF)
f332: ff ff ff     stx (0xFFFF)
f335: ff ff ff     stx (0xFFFF)
f338: ff ff ff     stx (0xFFFF)
f33b: ff ff ff     stx (0xFFFF)
f33e: ff ff ff     stx (0xFFFF)
f341: ff ff ff     stx (0xFFFF)
f344: ff ff ff     stx (0xFFFF)
f347: ff ff ff     stx (0xFFFF)
f34a: ff ff ff     stx (0xFFFF)
f34d: ff ff ff     stx (0xFFFF)
f350: ff ff ff     stx (0xFFFF)
f353: ff ff ff     stx (0xFFFF)
f356: ff ff ff     stx (0xFFFF)
f359: ff ff ff     stx (0xFFFF)
f35c: ff ff ff     stx (0xFFFF)
f35f: ff ff ff     stx (0xFFFF)
f362: ff ff ff     stx (0xFFFF)
f365: ff ff ff     stx (0xFFFF)
f368: ff ff ff     stx (0xFFFF)
f36b: ff ff ff     stx (0xFFFF)
f36e: ff ff ff     stx (0xFFFF)
f371: ff ff ff     stx (0xFFFF)
f374: ff ff ff     stx (0xFFFF)
f377: ff ff ff     stx (0xFFFF)
f37a: ff ff ff     stx (0xFFFF)
f37d: ff ff ff     stx (0xFFFF)
f380: ff ff ff     stx (0xFFFF)
f383: ff ff ff     stx (0xFFFF)
f386: ff ff ff     stx (0xFFFF)
f389: ff ff ff     stx (0xFFFF)
f38c: ff ff ff     stx (0xFFFF)
f38f: ff ff ff     stx (0xFFFF)
f392: ff ff ff     stx (0xFFFF)
f395: ff ff ff     stx (0xFFFF)
f398: ff ff ff     stx (0xFFFF)
f39b: ff ff ff     stx (0xFFFF)
f39e: ff ff ff     stx (0xFFFF)
f3a1: ff ff ff     stx (0xFFFF)
f3a4: ff ff ff     stx (0xFFFF)
f3a7: ff ff ff     stx (0xFFFF)
f3aa: ff ff ff     stx (0xFFFF)
f3ad: ff ff ff     stx (0xFFFF)
f3b0: ff ff ff     stx (0xFFFF)
f3b3: ff ff ff     stx (0xFFFF)
f3b6: ff ff ff     stx (0xFFFF)
f3b9: ff ff ff     stx (0xFFFF)
f3bc: ff ff ff     stx (0xFFFF)
f3bf: ff ff ff     stx (0xFFFF)
f3c2: ff ff ff     stx (0xFFFF)
f3c5: ff ff ff     stx (0xFFFF)
f3c8: ff ff ff     stx (0xFFFF)
f3cb: ff ff ff     stx (0xFFFF)
f3ce: ff ff ff     stx (0xFFFF)
f3d1: ff ff ff     stx (0xFFFF)
f3d4: ff ff ff     stx (0xFFFF)
f3d7: ff ff ff     stx (0xFFFF)
f3da: ff ff ff     stx (0xFFFF)
f3dd: ff ff ff     stx (0xFFFF)
f3e0: ff ff ff     stx (0xFFFF)
f3e3: ff ff ff     stx (0xFFFF)
f3e6: ff ff ff     stx (0xFFFF)
f3e9: ff ff ff     stx (0xFFFF)
f3ec: ff ff ff     stx (0xFFFF)
f3ef: ff ff ff     stx (0xFFFF)
f3f2: ff ff ff     stx (0xFFFF)
f3f5: ff ff ff     stx (0xFFFF)
f3f8: ff ff ff     stx (0xFFFF)
f3fb: ff ff ff     stx (0xFFFF)
f3fe: ff ff ff     stx (0xFFFF)
f401: ff ff ff     stx (0xFFFF)
f404: ff ff ff     stx (0xFFFF)
f407: ff ff ff     stx (0xFFFF)
f40a: ff ff ff     stx (0xFFFF)
f40d: ff ff ff     stx (0xFFFF)
f410: ff ff ff     stx (0xFFFF)
f413: ff ff ff     stx (0xFFFF)
f416: ff ff ff     stx (0xFFFF)
f419: ff ff ff     stx (0xFFFF)
f41c: ff ff ff     stx (0xFFFF)
f41f: ff ff ff     stx (0xFFFF)
f422: ff ff ff     stx (0xFFFF)
f425: ff ff ff     stx (0xFFFF)
f428: ff ff ff     stx (0xFFFF)
f42b: ff ff ff     stx (0xFFFF)
f42e: ff ff ff     stx (0xFFFF)
f431: ff ff ff     stx (0xFFFF)
f434: ff ff ff     stx (0xFFFF)
f437: ff ff ff     stx (0xFFFF)
f43a: ff ff ff     stx (0xFFFF)
f43d: ff ff ff     stx (0xFFFF)
f440: ff ff ff     stx (0xFFFF)
f443: ff ff ff     stx (0xFFFF)
f446: ff ff ff     stx (0xFFFF)
f449: ff ff ff     stx (0xFFFF)
f44c: ff ff ff     stx (0xFFFF)
f44f: ff ff ff     stx (0xFFFF)
f452: ff ff ff     stx (0xFFFF)
f455: ff ff ff     stx (0xFFFF)
f458: ff ff ff     stx (0xFFFF)
f45b: ff ff ff     stx (0xFFFF)
f45e: ff ff ff     stx (0xFFFF)
f461: ff ff ff     stx (0xFFFF)
f464: ff ff ff     stx (0xFFFF)
f467: ff ff ff     stx (0xFFFF)
f46a: ff ff ff     stx (0xFFFF)
f46d: ff ff ff     stx (0xFFFF)
f470: ff ff ff     stx (0xFFFF)
f473: ff ff ff     stx (0xFFFF)
f476: ff ff ff     stx (0xFFFF)
f479: ff ff ff     stx (0xFFFF)
f47c: ff ff ff     stx (0xFFFF)
f47f: ff ff ff     stx (0xFFFF)
f482: ff ff ff     stx (0xFFFF)
f485: ff ff ff     stx (0xFFFF)
f488: ff ff ff     stx (0xFFFF)
f48b: ff ff ff     stx (0xFFFF)
f48e: ff ff ff     stx (0xFFFF)
f491: ff ff ff     stx (0xFFFF)
f494: ff ff ff     stx (0xFFFF)
f497: ff ff ff     stx (0xFFFF)
f49a: ff ff ff     stx (0xFFFF)
f49d: ff ff ff     stx (0xFFFF)
f4a0: ff ff ff     stx (0xFFFF)
f4a3: ff ff ff     stx (0xFFFF)
f4a6: ff ff ff     stx (0xFFFF)
f4a9: ff ff ff     stx (0xFFFF)
f4ac: ff ff ff     stx (0xFFFF)
f4af: ff ff ff     stx (0xFFFF)
f4b2: ff ff ff     stx (0xFFFF)
f4b5: ff ff ff     stx (0xFFFF)
f4b8: ff ff ff     stx (0xFFFF)
f4bb: ff ff ff     stx (0xFFFF)
f4be: ff ff ff     stx (0xFFFF)
f4c1: ff ff ff     stx (0xFFFF)
f4c4: ff ff ff     stx (0xFFFF)
f4c7: ff ff ff     stx (0xFFFF)
f4ca: ff ff ff     stx (0xFFFF)
f4cd: ff ff ff     stx (0xFFFF)
f4d0: ff ff ff     stx (0xFFFF)
f4d3: ff ff ff     stx (0xFFFF)
f4d6: ff ff ff     stx (0xFFFF)
f4d9: ff ff ff     stx (0xFFFF)
f4dc: ff ff ff     stx (0xFFFF)
f4df: ff ff ff     stx (0xFFFF)
f4e2: ff ff ff     stx (0xFFFF)
f4e5: ff ff ff     stx (0xFFFF)
f4e8: ff ff ff     stx (0xFFFF)
f4eb: ff ff ff     stx (0xFFFF)
f4ee: ff ff ff     stx (0xFFFF)
f4f1: ff ff ff     stx (0xFFFF)
f4f4: ff ff ff     stx (0xFFFF)
f4f7: ff ff ff     stx (0xFFFF)
f4fa: ff ff ff     stx (0xFFFF)
f4fd: ff ff ff     stx (0xFFFF)
f500: ff ff ff     stx (0xFFFF)
f503: ff ff ff     stx (0xFFFF)
f506: ff ff ff     stx (0xFFFF)
f509: ff ff ff     stx (0xFFFF)
f50c: ff ff ff     stx (0xFFFF)
f50f: ff ff ff     stx (0xFFFF)
f512: ff ff ff     stx (0xFFFF)
f515: ff ff ff     stx (0xFFFF)
f518: ff ff ff     stx (0xFFFF)
f51b: ff ff ff     stx (0xFFFF)
f51e: ff ff ff     stx (0xFFFF)
f521: ff ff ff     stx (0xFFFF)
f524: ff ff ff     stx (0xFFFF)
f527: ff ff ff     stx (0xFFFF)
f52a: ff ff ff     stx (0xFFFF)
f52d: ff ff ff     stx (0xFFFF)
f530: ff ff ff     stx (0xFFFF)
f533: ff ff ff     stx (0xFFFF)
f536: ff ff ff     stx (0xFFFF)
f539: ff ff ff     stx (0xFFFF)
f53c: ff ff ff     stx (0xFFFF)
f53f: ff ff ff     stx (0xFFFF)
f542: ff ff ff     stx (0xFFFF)
f545: ff ff ff     stx (0xFFFF)
f548: ff ff ff     stx (0xFFFF)
f54b: ff ff ff     stx (0xFFFF)
f54e: ff ff ff     stx (0xFFFF)
f551: ff ff ff     stx (0xFFFF)
f554: ff ff ff     stx (0xFFFF)
f557: ff ff ff     stx (0xFFFF)
f55a: ff ff ff     stx (0xFFFF)
f55d: ff ff ff     stx (0xFFFF)
f560: ff ff ff     stx (0xFFFF)
f563: ff ff ff     stx (0xFFFF)
f566: ff ff ff     stx (0xFFFF)
f569: ff ff ff     stx (0xFFFF)
f56c: ff ff ff     stx (0xFFFF)
f56f: ff ff ff     stx (0xFFFF)
f572: ff ff ff     stx (0xFFFF)
f575: ff ff ff     stx (0xFFFF)
f578: ff ff ff     stx (0xFFFF)
f57b: ff ff ff     stx (0xFFFF)
f57e: ff ff ff     stx (0xFFFF)
f581: ff ff ff     stx (0xFFFF)
f584: ff ff ff     stx (0xFFFF)
f587: ff ff ff     stx (0xFFFF)
f58a: ff ff ff     stx (0xFFFF)
f58d: ff ff ff     stx (0xFFFF)
f590: ff ff ff     stx (0xFFFF)
f593: ff ff ff     stx (0xFFFF)
f596: ff ff ff     stx (0xFFFF)
f599: ff ff ff     stx (0xFFFF)
f59c: ff ff ff     stx (0xFFFF)
f59f: ff ff ff     stx (0xFFFF)
f5a2: ff ff ff     stx (0xFFFF)
f5a5: ff ff ff     stx (0xFFFF)
f5a8: ff ff ff     stx (0xFFFF)
f5ab: ff ff ff     stx (0xFFFF)
f5ae: ff ff ff     stx (0xFFFF)
f5b1: ff ff ff     stx (0xFFFF)
f5b4: ff ff ff     stx (0xFFFF)
f5b7: ff ff ff     stx (0xFFFF)
f5ba: ff ff ff     stx (0xFFFF)
f5bd: ff ff ff     stx (0xFFFF)
f5c0: ff ff ff     stx (0xFFFF)
f5c3: ff ff ff     stx (0xFFFF)
f5c6: ff ff ff     stx (0xFFFF)
f5c9: ff ff ff     stx (0xFFFF)
f5cc: ff ff ff     stx (0xFFFF)
f5cf: ff ff ff     stx (0xFFFF)
f5d2: ff ff ff     stx (0xFFFF)
f5d5: ff ff ff     stx (0xFFFF)
f5d8: ff ff ff     stx (0xFFFF)
f5db: ff ff ff     stx (0xFFFF)
f5de: ff ff ff     stx (0xFFFF)
f5e1: ff ff ff     stx (0xFFFF)
f5e4: ff ff ff     stx (0xFFFF)
f5e7: ff ff ff     stx (0xFFFF)
f5ea: ff ff ff     stx (0xFFFF)
f5ed: ff ff ff     stx (0xFFFF)
f5f0: ff ff ff     stx (0xFFFF)
f5f3: ff ff ff     stx (0xFFFF)
f5f6: ff ff ff     stx (0xFFFF)
f5f9: ff ff ff     stx (0xFFFF)
f5fc: ff ff ff     stx (0xFFFF)
f5ff: ff ff ff     stx (0xFFFF)
f602: ff ff ff     stx (0xFFFF)
f605: ff ff ff     stx (0xFFFF)
f608: ff ff ff     stx (0xFFFF)
f60b: ff ff ff     stx (0xFFFF)
f60e: ff ff ff     stx (0xFFFF)
f611: ff ff ff     stx (0xFFFF)
f614: ff ff ff     stx (0xFFFF)
f617: ff ff ff     stx (0xFFFF)
f61a: ff ff ff     stx (0xFFFF)
f61d: ff ff ff     stx (0xFFFF)
f620: ff ff ff     stx (0xFFFF)
f623: ff ff ff     stx (0xFFFF)
f626: ff ff ff     stx (0xFFFF)
f629: ff ff ff     stx (0xFFFF)
f62c: ff ff ff     stx (0xFFFF)
f62f: ff ff ff     stx (0xFFFF)
f632: ff ff ff     stx (0xFFFF)
f635: ff ff ff     stx (0xFFFF)
f638: ff ff ff     stx (0xFFFF)
f63b: ff ff ff     stx (0xFFFF)
f63e: ff ff ff     stx (0xFFFF)
f641: ff ff ff     stx (0xFFFF)
f644: ff ff ff     stx (0xFFFF)
f647: ff ff ff     stx (0xFFFF)
f64a: ff ff ff     stx (0xFFFF)
f64d: ff ff ff     stx (0xFFFF)
f650: ff ff ff     stx (0xFFFF)
f653: ff ff ff     stx (0xFFFF)
f656: ff ff ff     stx (0xFFFF)
f659: ff ff ff     stx (0xFFFF)
f65c: ff ff ff     stx (0xFFFF)
f65f: ff ff ff     stx (0xFFFF)
f662: ff ff ff     stx (0xFFFF)
f665: ff ff ff     stx (0xFFFF)
f668: ff ff ff     stx (0xFFFF)
f66b: ff ff ff     stx (0xFFFF)
f66e: ff ff ff     stx (0xFFFF)
f671: ff ff ff     stx (0xFFFF)
f674: ff ff ff     stx (0xFFFF)
f677: ff ff ff     stx (0xFFFF)
f67a: ff ff ff     stx (0xFFFF)
f67d: ff ff ff     stx (0xFFFF)
f680: ff ff ff     stx (0xFFFF)
f683: ff ff ff     stx (0xFFFF)
f686: ff ff ff     stx (0xFFFF)
f689: ff ff ff     stx (0xFFFF)
f68c: ff ff ff     stx (0xFFFF)
f68f: ff ff ff     stx (0xFFFF)
f692: ff ff ff     stx (0xFFFF)
f695: ff ff ff     stx (0xFFFF)
f698: ff ff ff     stx (0xFFFF)
f69b: ff ff ff     stx (0xFFFF)
f69e: ff ff ff     stx (0xFFFF)
f6a1: ff ff ff     stx (0xFFFF)
f6a4: ff ff ff     stx (0xFFFF)
f6a7: ff ff ff     stx (0xFFFF)
f6aa: ff ff ff     stx (0xFFFF)
f6ad: ff ff ff     stx (0xFFFF)
f6b0: ff ff ff     stx (0xFFFF)
f6b3: ff ff ff     stx (0xFFFF)
f6b6: ff ff ff     stx (0xFFFF)
f6b9: ff ff ff     stx (0xFFFF)
f6bc: ff ff ff     stx (0xFFFF)
f6bf: ff ff ff     stx (0xFFFF)
f6c2: ff ff ff     stx (0xFFFF)
f6c5: ff ff ff     stx (0xFFFF)
f6c8: ff ff ff     stx (0xFFFF)
f6cb: ff ff ff     stx (0xFFFF)
f6ce: ff ff ff     stx (0xFFFF)
f6d1: ff ff ff     stx (0xFFFF)
f6d4: ff ff ff     stx (0xFFFF)
f6d7: ff ff ff     stx (0xFFFF)
f6da: ff ff ff     stx (0xFFFF)
f6dd: ff ff ff     stx (0xFFFF)
f6e0: ff ff ff     stx (0xFFFF)
f6e3: ff ff ff     stx (0xFFFF)
f6e6: ff ff ff     stx (0xFFFF)
f6e9: ff ff ff     stx (0xFFFF)
f6ec: ff ff ff     stx (0xFFFF)
f6ef: ff ff ff     stx (0xFFFF)
f6f2: ff ff ff     stx (0xFFFF)
f6f5: ff ff ff     stx (0xFFFF)
f6f8: ff ff ff     stx (0xFFFF)
f6fb: ff ff ff     stx (0xFFFF)
f6fe: ff ff ff     stx (0xFFFF)
f701: ff ff ff     stx (0xFFFF)
f704: ff ff ff     stx (0xFFFF)
f707: ff ff ff     stx (0xFFFF)
f70a: ff ff ff     stx (0xFFFF)
f70d: ff ff ff     stx (0xFFFF)
f710: ff ff ff     stx (0xFFFF)
f713: ff ff ff     stx (0xFFFF)
f716: ff ff ff     stx (0xFFFF)
f719: ff ff ff     stx (0xFFFF)
f71c: ff ff ff     stx (0xFFFF)
f71f: ff ff ff     stx (0xFFFF)
f722: ff ff ff     stx (0xFFFF)
f725: ff ff ff     stx (0xFFFF)
f728: ff ff ff     stx (0xFFFF)
f72b: ff ff ff     stx (0xFFFF)
f72e: ff ff ff     stx (0xFFFF)
f731: ff ff ff     stx (0xFFFF)
f734: ff ff ff     stx (0xFFFF)
f737: ff ff ff     stx (0xFFFF)
f73a: ff ff ff     stx (0xFFFF)
f73d: ff ff ff     stx (0xFFFF)
f740: ff ff ff     stx (0xFFFF)
f743: ff ff ff     stx (0xFFFF)
f746: ff ff ff     stx (0xFFFF)
f749: ff ff ff     stx (0xFFFF)
f74c: ff ff ff     stx (0xFFFF)
f74f: ff ff ff     stx (0xFFFF)
f752: ff ff ff     stx (0xFFFF)
f755: ff ff ff     stx (0xFFFF)
f758: ff ff ff     stx (0xFFFF)
f75b: ff ff ff     stx (0xFFFF)
f75e: ff ff ff     stx (0xFFFF)
f761: ff ff ff     stx (0xFFFF)
f764: ff ff ff     stx (0xFFFF)
f767: ff ff ff     stx (0xFFFF)
f76a: ff ff ff     stx (0xFFFF)
f76d: ff ff ff     stx (0xFFFF)
f770: ff ff ff     stx (0xFFFF)
f773: ff ff ff     stx (0xFFFF)
f776: ff ff ff     stx (0xFFFF)
f779: ff ff ff     stx (0xFFFF)
f77c: ff ff ff     stx (0xFFFF)
f77f: ff 57 0b     stx (0x570B)
f782: 00           test
f783: 00           test
f784: 00           test
f785: 00           test
f786: 08           inx
f787: 00           test
f788: 00           test
f789: 00           test
f78a: 20 00        bra [0xF78C]
f78c: 00           test
f78d: 00           test
f78e: 80 00        suba 0x00
f790: 00           test
f791: 00           test
f792: 00           test
f793: 00           test
f794: 00           test
f795: 04           lsrd
f796: 00           test
f797: 00           test
f798: 00           test
f799: 10           sba
f79a: 00           test
f79b: 00           test
f79c: 00           test
f79d: 00           test
f79e: 00           test
f79f: 00           test
f7a0: 40           nega
f7a1: 12 20 09 80  brset (0x0020), 0x09, [0xF725]
f7a5: 24 02        bcc [0xF7A9]
f7a7: 00           test
f7a8: 40           nega
f7a9: 12 20 09 80  brset (0x0020), 0x09, [0xF72D]
f7ad: 24 04        bcc [0xF7B3]
f7af: 00           test
f7b0: 00           test
f7b1: 00           test
f7b2: 00           test
f7b3: 00           test
f7b4: 00           test
f7b5: 00           test
f7b6: 00           test
f7b7: 00           test
f7b8: 00           test
f7b9: 00           test
f7ba: 00           test
f7bb: 00           test
f7bc: 08           inx
f7bd: 00           test
f7be: 00           test
f7bf: 00           test
f7c0: 01           nop
f7c1: ff ff ff     stx (0xFFFF)
f7c4: ff ff ff     stx (0xFFFF)
f7c7: ff ff ff     stx (0xFFFF)
f7ca: ff ff ff     stx (0xFFFF)
f7cd: ff ff ff     stx (0xFFFF)
f7d0: ff ff ff     stx (0xFFFF)
f7d3: ff ff ff     stx (0xFFFF)
f7d6: ff ff ff     stx (0xFFFF)
f7d9: ff ff ff     stx (0xFFFF)
f7dc: ff ff ff     stx (0xFFFF)
f7df: ff ff ff     stx (0xFFFF)
f7e2: ff ff ff     stx (0xFFFF)
f7e5: ff ff ff     stx (0xFFFF)
f7e8: ff ff ff     stx (0xFFFF)
f7eb: ff ff ff     stx (0xFFFF)
f7ee: ff ff ff     stx (0xFFFF)
f7f1: ff ff ff     stx (0xFFFF)
f7f4: ff ff ff     stx (0xFFFF)
f7f7: ff ff ff     stx (0xFFFF)
f7fa: ff ff ff     stx (0xFFFF)
f7fd: ff ff ff     stx (0xFFFF)
f800: 0f           sei
f801: 86 03        ldaa 0x03
f803: b7 10 24     staa (0x1024)
f806: 86 80        ldaa 0x80
f808: b7 10 22     staa (0x1022)
f80b: 86 00        ldaa 0x00
f80d: b7 10 35     staa (0x1035)
f810: 96 07        ldaa (0x0007)
f812: 81 db        cmpa 0xDB
f814: 26 06        bne [0xF81C]
f816: 7f 10 35     clr (0x1035)
f819: 7f 00 07     clr (0x0007)
f81c: 8e 01 ff     lds 0x01FF
f81f: 86 a5        ldaa 0xA5
f821: b7 10 5d     staa (0x105D)
f824: 86 01        ldaa 0x01
f826: b7 10 5f     staa (0x105F)
f829: 86 00        ldaa 0x00
f82b: b7 10 5e     staa (0x105E)
f82e: 86 f0        ldaa 0xF0
f830: b7 10 5c     staa (0x105C)
f833: 7f 00 00     clr (0x0000)
f836: 86 30        ldaa 0x30
f838: b7 18 05     staa (0x1805)
f83b: b7 18 07     staa (0x1807)
f83e: 86 ff        ldaa 0xFF
f840: b7 18 06     staa (0x1806)
f843: 86 78        ldaa 0x78
f845: b7 18 04     staa (0x1804)
f848: 86 34        ldaa 0x34
f84a: b7 18 05     staa (0x1805)
f84d: b7 18 07     staa (0x1807)
f850: c6 ff        ldab 0xFF
f852: bd fa f9     jsr (0xFAF9)
f855: 20 13        bra [0xF86A]
f857: 09           dex
f858: 4a           deca
f859: 01           nop
f85a: 10           sba
f85b: 0c           clc
f85c: 18 0d        ?
f85e: 00           test
f85f: 04           lsrd
f860: 44           lsra
f861: 0e           cli
f862: 63 05        com (X+0x05)
f864: 68 0b        asl (X+0x0B)
f866: 56           rorb
f867: 03           fdiv
f868: c1 ff        cmpb 0xFF
f86a: ce f8 57     ldx 0xF857
f86d: a6 00        ldaa (X+0x00)
f86f: 81 ff        cmpa 0xFF
f871: 27 06        beq [0xF879]
f873: b7 18 0d     staa (0x180D)
f876: 08           inx
f877: 20 f4        bra [0xF86D]
f879: 86 00        ldaa 0x00
f87b: b7 10 2c     staa (0x102C)
f87e: 86 0c        ldaa 0x0C
f880: b7 10 2d     staa (0x102D)
f883: 86 30        ldaa 0x30
f885: b7 10 2b     staa (0x102B)
f888: ce 01 00     ldx 0x0100
f88b: 86 3b        ldaa 0x3B
f88d: a7 00        staa (X+0x00)
f88f: 08           inx
f890: 08           inx
f891: 08           inx
f892: 8c 01 3c     cpx 0x013C
f895: 25 f6        bcs [0xF88D]
f897: c6 f0        ldab 0xF0
f899: f7 18 04     stab (0x1804)
f89c: 86 7e        ldaa 0x7E
f89e: 97 03        staa (0x0003)
f8a0: ce 00 00     ldx 0x0000
f8a3: e6 00        ldab (X+0x00)
f8a5: 86 55        ldaa 0x55
f8a7: a7 00        staa (X+0x00)
f8a9: a1 00        cmpa (X+0x00)
f8ab: 26 19        bne [0xF8C6]
f8ad: 49           rola
f8ae: a7 00        staa (X+0x00)
f8b0: a1 00        cmpa (X+0x00)
f8b2: 26 12        bne [0xF8C6]
f8b4: e7 00        stab (X+0x00)
f8b6: 08           inx
f8b7: 8c 04 00     cpx 0x0400
f8ba: 26 03        bne [0xF8BF]
f8bc: ce 20 00     ldx 0x2000
f8bf: 8c 80 00     cpx 0x8000
f8c2: 26 df        bne [0xF8A3]
f8c4: 20 04        bra [0xF8CA]
f8c6: 86 01        ldaa 0x01
f8c8: 97 00        staa (0x0000)
f8ca: c6 01        ldab 0x01
f8cc: bd fa c9     jsr (0xFAC9)
f8cf: b6 10 35     ldaa (0x1035)
f8d2: 26 0f        bne [0xF8E3]
f8d4: b6 30 00     ldaa (0x3000)
f8d7: 81 7e        cmpa 0x7E
f8d9: 26 08        bne [0xF8E3]
f8db: c6 0e        ldab 0x0E
f8dd: bd fa c9     jsr (0xFAC9)
f8e0: 7e 30 00     jmp (0x3000)
f8e3: ce f0 00     ldx 0xF000
f8e6: 01           nop
f8e7: 01           nop
f8e8: 09           dex
f8e9: 27 0b        beq [0xF8F6]
f8eb: bd fa 79     jsr (0xFA79)
f8ee: 24 f6        bcc [0xF8E6]
f8f0: 81 1b        cmpa 0x1B
f8f2: 27 3b        beq [0xF92F]
f8f4: 20 f0        bra [0xF8E6]
f8f6: b6 40 00     ldaa (0x4000)
f8f9: 81 7e        cmpa 0x7E
f8fb: 26 0b        bne [0xF908]
f8fd: c6 0a        ldab 0x0A
f8ff: bd fa c9     jsr (0xFAC9)
f902: bd 40 00     jsr (0x4000)
f905: 0f           sei
f906: 20 27        bra [0xF92F]
f908: b6 80 00     ldaa (0x8000)
f90b: 81 7e        cmpa 0x7E
f90d: 26 0b        bne [0xF91A]
f90f: c6 0a        ldab 0x0A
f911: bd fa c9     jsr (0xFAC9)
f914: bd 80 00     jsr (0x8000)
f917: 0f           sei
f918: 20 15        bra [0xF92F]
f91a: c6 10        ldab 0x10
f91c: bd fa c9     jsr (0xFAC9)
f91f: bd fb 0c     jsr (0xFB0C)
f922: 4d           tsta
f923: 49           rola
f924: 4e           ?
f925: 49           rola
f926: 2d 4d        blt [0xF975]
f928: 4f           clra
f929: ce c6 10     ldx 0xC610
f92c: bd fa c9     jsr (0xFAC9)
f92f: 7f 00 05     clr (0x0005)
f932: 7f 00 04     clr (0x0004)
f935: 7f 00 02     clr (0x0002)
f938: 7f 00 06     clr (0x0006)
f93b: bd fb 0c     jsr (0xFB0C)
f93e: 0d           sec
f93f: 0a           clv
f940: be bd fa     lds (0xBDFA)
f943: bb 97 01     adda (0x9701)
f946: 81 30        cmpa 0x30
f948: 25 3b        bcs [0xF985]
f94a: 81 39        cmpa 0x39
f94c: 22 0d        bhi [0xF95B]
f94e: 48           asla
f94f: 48           asla
f950: 48           asla
f951: 48           asla
f952: c6 04        ldab 0x04
f954: 7d 00 02     tst (0x0002)
f957: 2a 0e        bpl [0xF967]
f959: 2b 18        bmi [0xF973]
f95b: 81 41        cmpa 0x41
f95d: 25 26        bcs [0xF985]
f95f: 81 47        cmpa 0x47
f961: 24 22        bcc [0xF985]
f963: 80 37        suba 0x37
f965: 20 e7        bra [0xF94E]
f967: 49           rola
f968: 79 00 05     rol (0x0005)
f96b: 79 00 04     rol (0x0004)
f96e: 5a           decb
f96f: 26 f6        bne [0xF967]
f971: 27 0b        beq [0xF97E]
f973: 49           rola
f974: 79 00 06     rol (0x0006)
f977: 5a           decb
f978: 26 f9        bne [0xF973]
f97a: 86 c0        ldaa 0xC0
f97c: 97 02        staa (0x0002)
f97e: 96 01        ldaa (0x0001)
f980: bd fa a3     jsr (0xFAA3)
f983: 20 bc        bra [0xF941]
f985: 81 3a        cmpa 0x3A
f987: 26 06        bne [0xF98F]
f989: c6 80        ldab 0x80
f98b: d7 02        stab (0x0002)
f98d: 20 f1        bra [0xF980]
f98f: 81 47        cmpa 0x47
f991: 26 08        bne [0xF99B]
f993: bd fa a3     jsr (0xFAA3)
f996: 9d 03        jsr (0x0003)
f998: 7e f9 2f     jmp (0xF92F)
f99b: 81 2f        cmpa 0x2F
f99d: 26 0d        bne [0xF9AC]
f99f: 20 1c        bra [0xF9BD]
f9a1: bd fa a3     jsr (0xFAA3)
f9a4: bd f9 d9     jsr (0xF9D9)
f9a7: 7f 00 02     clr (0x0002)
f9aa: 20 95        bra [0xF941]
f9ac: 81 2e        cmpa 0x2E
f9ae: 26 14        bne [0xF9C4]
f9b0: 86 5e        ldaa 0x5E
f9b2: bd fa a3     jsr (0xFAA3)
f9b5: 7c 00 05     inc (0x0005)
f9b8: 26 03        bne [0xF9BD]
f9ba: 7c 00 04     inc (0x0004)
f9bd: bd fa 6c     jsr (0xFA6C)
f9c0: 86 2f        ldaa 0x2F
f9c2: 20 dd        bra [0xF9A1]
f9c4: 81 2c        cmpa 0x2C
f9c6: 26 2d        bne [0xF9F5]
f9c8: 86 21        ldaa 0x21
f9ca: bd fa a3     jsr (0xFAA3)
f9cd: 96 05        ldaa (0x0005)
f9cf: 26 03        bne [0xF9D4]
f9d1: 7a 00 04     dec (0x0004)
f9d4: 7a 00 05     dec (0x0005)
f9d7: 20 e4        bra [0xF9BD]
f9d9: 18 de 04     ldy (0x0004)
f9dc: 18 a6 00     ldaa (Y+0x00)
f9df: 36           psha
f9e0: 44           lsra
f9e1: 44           lsra
f9e2: 44           lsra
f9e3: 44           lsra
f9e4: bd f9 e8     jsr (0xF9E8)
f9e7: 32           pula
f9e8: 84 0f        anda 0x0F
f9ea: 8a 30        oraa 0x30
f9ec: 81 3a        cmpa 0x3A
f9ee: 25 02        bcs [0xF9F2]
f9f0: 8b 07        adda 0x07
f9f2: 7e fa a3     jmp (0xFAA3)
f9f5: 81 0d        cmpa 0x0D
f9f7: 26 20        bne [0xFA19]
f9f9: 4f           clra
f9fa: d6 02        ldab (0x0002)
f9fc: c4 40        andb 0x40
f9fe: 97 02        staa (0x0002)
fa00: 5d           tstb
fa01: 27 10        beq [0xFA13]
fa03: 96 06        ldaa (0x0006)
fa05: 18 de 04     ldy (0x0004)
fa08: 18 a7 00     staa (Y+0x00)
fa0b: 7c 00 05     inc (0x0005)
fa0e: 26 03        bne [0xFA13]
fa10: 7c 00 04     inc (0x0004)
fa13: 7f 00 06     clr (0x0006)
fa16: 7e f9 7e     jmp (0xF97E)
fa19: 81 20        cmpa 0x20
fa1b: 26 04        bne [0xFA21]
fa1d: 86 80        ldaa 0x80
fa1f: 20 d9        bra [0xF9FA]
fa21: 81 0a        cmpa 0x0A
fa23: 26 03        bne [0xFA28]
fa25: 7e f9 2f     jmp (0xF92F)
fa28: 81 57        cmpa 0x57
fa2a: 26 08        bne [0xFA34]
fa2c: bd fb 0c     jsr (0xFB0C)
fa2f: 57           asrb
fa30: 4f           clra
fa31: 4f           clra
fa32: 46           rora
fa33: a1 81        cmpa (X+0x81)
fa35: 4c           inca
fa36: 26 2f        bne [0xFA67]
fa38: bd fa a9     jsr (0xFAA9)
fa3b: ce 00 00     ldx 0x0000
fa3e: bd fa 6f     jsr (0xFA6F)
fa41: 86 3a        ldaa 0x3A
fa43: bd fa a3     jsr (0xFAA3)
fa46: bd f9 d9     jsr (0xF9D9)
fa49: 86 20        ldaa 0x20
fa4b: 08           inx
fa4c: 8c 00 10     cpx 0x0010
fa4f: 25 02        bcs [0xFA53]
fa51: 86 0d        ldaa 0x0D
fa53: 7c 00 05     inc (0x0005)
fa56: 26 03        bne [0xFA5B]
fa58: 7c 00 04     inc (0x0004)
fa5b: bd fa a3     jsr (0xFAA3)
fa5e: 81 20        cmpa 0x20
fa60: 27 e4        beq [0xFA46]
fa62: bd fa 79     jsr (0xFA79)
fa65: 24 d4        bcc [0xFA3B]
fa67: 86 07        ldaa 0x07
fa69: 7e f9 80     jmp (0xF980)
fa6c: bd fa a9     jsr (0xFAA9)
fa6f: 96 04        ldaa (0x0004)
fa71: bd f9 df     jsr (0xF9DF)
fa74: 96 05        ldaa (0x0005)
fa76: 7e f9 df     jmp (0xF9DF)
fa79: b6 10 2e     ldaa (0x102E)
fa7c: 85 20        bita 0x20
fa7e: 26 09        bne [0xFA89]
fa80: 0c           clc
fa81: 39           rts
fa82: b6 10 2e     ldaa (0x102E)
fa85: 85 20        bita 0x20
fa87: 27 f9        beq [0xFA82]
fa89: b6 10 2e     ldaa (0x102E)
fa8c: 85 02        bita 0x02
fa8e: 26 09        bne [0xFA99]
fa90: 85 08        bita 0x08
fa92: 26 05        bne [0xFA99]
fa94: b6 10 2f     ldaa (0x102F)
fa97: 0d           sec
fa98: 39           rts
fa99: b6 10 2f     ldaa (0x102F)
fa9c: 86 2f        ldaa 0x2F
fa9e: bd fa a3     jsr (0xFAA3)
faa1: 20 df        bra [0xFA82]
faa3: 81 0d        cmpa 0x0D
faa5: 27 02        beq [0xFAA9]
faa7: 20 07        bra [0xFAB0]
faa9: 86 0d        ldaa 0x0D
faab: bd fa b0     jsr (0xFAB0)
faae: 86 0a        ldaa 0x0A
fab0: f6 10 2e     ldab (0x102E)
fab3: c5 40        bitb 0x40
fab5: 27 f9        beq [0xFAB0]
fab7: b7 10 2f     staa (0x102F)
faba: 39           rts
fabb: bd fa 82     jsr (0xFA82)
fabe: 81 7a        cmpa 0x7A
fac0: 22 06        bhi [0xFAC8]
fac2: 81 61        cmpa 0x61
fac4: 25 02        bcs [0xFAC8]
fac6: 82 20        sbca 0x20
fac8: 39           rts
fac9: 36           psha
faca: c1 11        cmpb 0x11
facc: 25 02        bcs [0xFAD0]
face: c6 10        ldab 0x10
fad0: ce fa e8     ldx 0xFAE8
fad3: 3a           abx
fad4: a6 00        ldaa (X+0x00)
fad6: b7 18 06     staa (0x1806)
fad9: b6 18 04     ldaa (0x1804)
fadc: 8a 20        oraa 0x20
fade: b7 18 04     staa (0x1804)
fae1: 84 df        anda 0xDF
fae3: b7 18 04     staa (0x1804)
fae6: 32           pula
fae7: 39           rts
fae8: c0 f9        subb 0xF9
faea: a4 b0        anda (X+0xB0)
faec: 99 92        adca (0x0092)
faee: 82 f8        sbca 0xF8
faf0: 80 90        suba 0x90
faf2: 88 83        eora 0x83
faf4: c6 a1        ldab 0xA1
faf6: 86 8e        ldaa 0x8E
faf8: ff 36 f7     stx (0x36F7)
fafb: 18 06        ?
fafd: b6 18 04     ldaa (0x1804)
fb00: 84 ef        anda 0xEF
fb02: b7 18 04     staa (0x1804)
fb05: 8a 10        oraa 0x10
fb07: b7 18 04     staa (0x1804)
fb0a: 32           pula
fb0b: 39           rts
fb0c: 18 38        puly
fb0e: 18 a6 00     ldaa (Y+0x00)
fb11: 27 09        beq [0xFB1C]
fb13: 2b 0c        bmi [0xFB21]
fb15: bd fa b0     jsr (0xFAB0)
fb18: 18 08        iny
fb1a: 20 f2        bra [0xFB0E]
fb1c: 18 08        iny
fb1e: 18 3c        pshy
fb20: 39           rts
fb21: 84 7f        anda 0x7F
fb23: bd fa b0     jsr (0xFAB0)
fb26: 20 f4        bra [0xFB1C]
fb28: 39           rts
fb29: 39           rts
fb2a: 3b           rti
fb2b: ff ff ff     stx (0xFFFF)
fb2e: ff ff ff     stx (0xFFFF)
fb31: ff ff ff     stx (0xFFFF)
fb34: ff ff ff     stx (0xFFFF)
fb37: ff ff ff     stx (0xFFFF)
fb3a: ff ff ff     stx (0xFFFF)
fb3d: ff ff ff     stx (0xFFFF)
fb40: ff ff ff     stx (0xFFFF)
fb43: ff ff ff     stx (0xFFFF)
fb46: ff ff ff     stx (0xFFFF)
fb49: ff ff ff     stx (0xFFFF)
fb4c: ff ff ff     stx (0xFFFF)
fb4f: ff ff ff     stx (0xFFFF)
fb52: ff ff ff     stx (0xFFFF)
fb55: ff ff ff     stx (0xFFFF)
fb58: ff ff ff     stx (0xFFFF)
fb5b: ff ff ff     stx (0xFFFF)
fb5e: ff ff ff     stx (0xFFFF)
fb61: ff ff ff     stx (0xFFFF)
fb64: ff ff ff     stx (0xFFFF)
fb67: ff ff ff     stx (0xFFFF)
fb6a: ff ff ff     stx (0xFFFF)
fb6d: ff ff ff     stx (0xFFFF)
fb70: ff ff ff     stx (0xFFFF)
fb73: ff ff ff     stx (0xFFFF)
fb76: ff ff ff     stx (0xFFFF)
fb79: ff ff ff     stx (0xFFFF)
fb7c: ff ff ff     stx (0xFFFF)
fb7f: ff ff ff     stx (0xFFFF)
fb82: ff ff ff     stx (0xFFFF)
fb85: ff ff ff     stx (0xFFFF)
fb88: ff ff ff     stx (0xFFFF)
fb8b: ff ff ff     stx (0xFFFF)
fb8e: ff ff ff     stx (0xFFFF)
fb91: ff ff ff     stx (0xFFFF)
fb94: ff ff ff     stx (0xFFFF)
fb97: ff ff ff     stx (0xFFFF)
fb9a: ff ff ff     stx (0xFFFF)
fb9d: ff ff ff     stx (0xFFFF)
fba0: ff ff ff     stx (0xFFFF)
fba3: ff ff ff     stx (0xFFFF)
fba6: ff ff ff     stx (0xFFFF)
fba9: ff ff ff     stx (0xFFFF)
fbac: ff ff ff     stx (0xFFFF)
fbaf: ff ff ff     stx (0xFFFF)
fbb2: ff ff ff     stx (0xFFFF)
fbb5: ff ff ff     stx (0xFFFF)
fbb8: ff ff ff     stx (0xFFFF)
fbbb: ff ff ff     stx (0xFFFF)
fbbe: ff ff ff     stx (0xFFFF)
fbc1: ff ff ff     stx (0xFFFF)
fbc4: ff ff ff     stx (0xFFFF)
fbc7: ff ff ff     stx (0xFFFF)
fbca: ff ff ff     stx (0xFFFF)
fbcd: ff ff ff     stx (0xFFFF)
fbd0: ff ff ff     stx (0xFFFF)
fbd3: ff ff ff     stx (0xFFFF)
fbd6: ff ff ff     stx (0xFFFF)
fbd9: ff ff ff     stx (0xFFFF)
fbdc: ff ff ff     stx (0xFFFF)
fbdf: ff ff ff     stx (0xFFFF)
fbe2: ff ff ff     stx (0xFFFF)
fbe5: ff ff ff     stx (0xFFFF)
fbe8: ff ff ff     stx (0xFFFF)
fbeb: ff ff ff     stx (0xFFFF)
fbee: ff ff ff     stx (0xFFFF)
fbf1: ff ff ff     stx (0xFFFF)
fbf4: ff ff ff     stx (0xFFFF)
fbf7: ff ff ff     stx (0xFFFF)
fbfa: ff ff ff     stx (0xFFFF)
fbfd: ff ff ff     stx (0xFFFF)
fc00: ff ff ff     stx (0xFFFF)
fc03: ff ff ff     stx (0xFFFF)
fc06: ff ff ff     stx (0xFFFF)
fc09: ff ff ff     stx (0xFFFF)
fc0c: ff ff ff     stx (0xFFFF)
fc0f: ff ff ff     stx (0xFFFF)
fc12: ff ff ff     stx (0xFFFF)
fc15: ff ff ff     stx (0xFFFF)
fc18: ff ff ff     stx (0xFFFF)
fc1b: ff ff ff     stx (0xFFFF)
fc1e: ff ff ff     stx (0xFFFF)
fc21: ff ff ff     stx (0xFFFF)
fc24: ff ff ff     stx (0xFFFF)
fc27: ff ff ff     stx (0xFFFF)
fc2a: ff ff ff     stx (0xFFFF)
fc2d: ff ff ff     stx (0xFFFF)
fc30: ff ff ff     stx (0xFFFF)
fc33: ff ff ff     stx (0xFFFF)
fc36: ff ff ff     stx (0xFFFF)
fc39: ff ff ff     stx (0xFFFF)
fc3c: ff ff ff     stx (0xFFFF)
fc3f: ff ff ff     stx (0xFFFF)
fc42: ff ff ff     stx (0xFFFF)
fc45: ff ff ff     stx (0xFFFF)
fc48: ff ff ff     stx (0xFFFF)
fc4b: ff ff ff     stx (0xFFFF)
fc4e: ff ff ff     stx (0xFFFF)
fc51: ff ff ff     stx (0xFFFF)
fc54: ff ff ff     stx (0xFFFF)
fc57: ff ff ff     stx (0xFFFF)
fc5a: ff ff ff     stx (0xFFFF)
fc5d: ff ff ff     stx (0xFFFF)
fc60: ff ff ff     stx (0xFFFF)
fc63: ff ff ff     stx (0xFFFF)
fc66: ff ff ff     stx (0xFFFF)
fc69: ff ff ff     stx (0xFFFF)
fc6c: ff ff ff     stx (0xFFFF)
fc6f: ff ff ff     stx (0xFFFF)
fc72: ff ff ff     stx (0xFFFF)
fc75: ff ff ff     stx (0xFFFF)
fc78: ff ff ff     stx (0xFFFF)
fc7b: ff ff ff     stx (0xFFFF)
fc7e: ff ff ff     stx (0xFFFF)
fc81: ff ff ff     stx (0xFFFF)
fc84: ff ff ff     stx (0xFFFF)
fc87: ff ff ff     stx (0xFFFF)
fc8a: ff ff ff     stx (0xFFFF)
fc8d: ff ff ff     stx (0xFFFF)
fc90: ff ff ff     stx (0xFFFF)
fc93: ff ff ff     stx (0xFFFF)
fc96: ff ff ff     stx (0xFFFF)
fc99: ff ff ff     stx (0xFFFF)
fc9c: ff ff ff     stx (0xFFFF)
fc9f: ff ff ff     stx (0xFFFF)
fca2: ff ff ff     stx (0xFFFF)
fca5: ff ff ff     stx (0xFFFF)
fca8: ff ff ff     stx (0xFFFF)
fcab: ff ff ff     stx (0xFFFF)
fcae: ff ff ff     stx (0xFFFF)
fcb1: ff ff ff     stx (0xFFFF)
fcb4: ff ff ff     stx (0xFFFF)
fcb7: ff ff ff     stx (0xFFFF)
fcba: ff ff ff     stx (0xFFFF)
fcbd: ff ff ff     stx (0xFFFF)
fcc0: ff ff ff     stx (0xFFFF)
fcc3: ff ff ff     stx (0xFFFF)
fcc6: ff ff ff     stx (0xFFFF)
fcc9: ff ff ff     stx (0xFFFF)
fccc: ff ff ff     stx (0xFFFF)
fccf: ff ff ff     stx (0xFFFF)
fcd2: ff ff ff     stx (0xFFFF)
fcd5: ff ff ff     stx (0xFFFF)
fcd8: ff ff ff     stx (0xFFFF)
fcdb: ff ff ff     stx (0xFFFF)
fcde: ff ff ff     stx (0xFFFF)
fce1: ff ff ff     stx (0xFFFF)
fce4: ff ff ff     stx (0xFFFF)
fce7: ff ff ff     stx (0xFFFF)
fcea: ff ff ff     stx (0xFFFF)
fced: ff ff ff     stx (0xFFFF)
fcf0: ff ff ff     stx (0xFFFF)
fcf3: ff ff ff     stx (0xFFFF)
fcf6: ff ff ff     stx (0xFFFF)
fcf9: ff ff ff     stx (0xFFFF)
fcfc: ff ff ff     stx (0xFFFF)
fcff: ff ff ff     stx (0xFFFF)
fd02: ff ff ff     stx (0xFFFF)
fd05: ff ff ff     stx (0xFFFF)
fd08: ff ff ff     stx (0xFFFF)
fd0b: ff ff ff     stx (0xFFFF)
fd0e: ff ff ff     stx (0xFFFF)
fd11: ff ff ff     stx (0xFFFF)
fd14: ff ff ff     stx (0xFFFF)
fd17: ff ff ff     stx (0xFFFF)
fd1a: ff ff ff     stx (0xFFFF)
fd1d: ff ff ff     stx (0xFFFF)
fd20: ff ff ff     stx (0xFFFF)
fd23: ff ff ff     stx (0xFFFF)
fd26: ff ff ff     stx (0xFFFF)
fd29: ff ff ff     stx (0xFFFF)
fd2c: ff ff ff     stx (0xFFFF)
fd2f: ff ff ff     stx (0xFFFF)
fd32: ff ff ff     stx (0xFFFF)
fd35: ff ff ff     stx (0xFFFF)
fd38: ff ff ff     stx (0xFFFF)
fd3b: ff ff ff     stx (0xFFFF)
fd3e: ff ff ff     stx (0xFFFF)
fd41: ff ff ff     stx (0xFFFF)
fd44: ff ff ff     stx (0xFFFF)
fd47: ff ff ff     stx (0xFFFF)
fd4a: ff ff ff     stx (0xFFFF)
fd4d: ff ff ff     stx (0xFFFF)
fd50: ff ff ff     stx (0xFFFF)
fd53: ff ff ff     stx (0xFFFF)
fd56: ff ff ff     stx (0xFFFF)
fd59: ff ff ff     stx (0xFFFF)
fd5c: ff ff ff     stx (0xFFFF)
fd5f: ff ff ff     stx (0xFFFF)
fd62: ff ff ff     stx (0xFFFF)
fd65: ff ff ff     stx (0xFFFF)
fd68: ff ff ff     stx (0xFFFF)
fd6b: ff ff ff     stx (0xFFFF)
fd6e: ff ff ff     stx (0xFFFF)
fd71: ff ff ff     stx (0xFFFF)
fd74: ff ff ff     stx (0xFFFF)
fd77: ff ff ff     stx (0xFFFF)
fd7a: ff ff ff     stx (0xFFFF)
fd7d: ff ff ff     stx (0xFFFF)
fd80: ff ff ff     stx (0xFFFF)
fd83: ff ff ff     stx (0xFFFF)
fd86: ff ff ff     stx (0xFFFF)
fd89: ff ff ff     stx (0xFFFF)
fd8c: ff ff ff     stx (0xFFFF)
fd8f: ff ff ff     stx (0xFFFF)
fd92: ff ff ff     stx (0xFFFF)
fd95: ff ff ff     stx (0xFFFF)
fd98: ff ff ff     stx (0xFFFF)
fd9b: ff ff ff     stx (0xFFFF)
fd9e: ff ff ff     stx (0xFFFF)
fda1: ff ff ff     stx (0xFFFF)
fda4: ff ff ff     stx (0xFFFF)
fda7: ff ff ff     stx (0xFFFF)
fdaa: ff ff ff     stx (0xFFFF)
fdad: ff ff ff     stx (0xFFFF)
fdb0: ff ff ff     stx (0xFFFF)
fdb3: ff ff ff     stx (0xFFFF)
fdb6: ff ff ff     stx (0xFFFF)
fdb9: ff ff ff     stx (0xFFFF)
fdbc: ff ff ff     stx (0xFFFF)
fdbf: ff ff ff     stx (0xFFFF)
fdc2: ff ff ff     stx (0xFFFF)
fdc5: ff ff ff     stx (0xFFFF)
fdc8: ff ff ff     stx (0xFFFF)
fdcb: ff ff ff     stx (0xFFFF)
fdce: ff ff ff     stx (0xFFFF)
fdd1: ff ff ff     stx (0xFFFF)
fdd4: ff ff ff     stx (0xFFFF)
fdd7: ff ff ff     stx (0xFFFF)
fdda: ff ff ff     stx (0xFFFF)
fddd: ff ff ff     stx (0xFFFF)
fde0: ff ff ff     stx (0xFFFF)
fde3: ff ff ff     stx (0xFFFF)
fde6: ff ff ff     stx (0xFFFF)
fde9: ff ff ff     stx (0xFFFF)
fdec: ff ff ff     stx (0xFFFF)
fdef: ff ff ff     stx (0xFFFF)
fdf2: ff ff ff     stx (0xFFFF)
fdf5: ff ff ff     stx (0xFFFF)
fdf8: ff ff ff     stx (0xFFFF)
fdfb: ff ff ff     stx (0xFFFF)
fdfe: ff ff ff     stx (0xFFFF)
fe01: ff ff ff     stx (0xFFFF)
fe04: ff ff ff     stx (0xFFFF)
fe07: ff ff ff     stx (0xFFFF)
fe0a: ff ff ff     stx (0xFFFF)
fe0d: ff ff ff     stx (0xFFFF)
fe10: ff ff ff     stx (0xFFFF)
fe13: ff ff ff     stx (0xFFFF)
fe16: ff ff ff     stx (0xFFFF)
fe19: ff ff ff     stx (0xFFFF)
fe1c: ff ff ff     stx (0xFFFF)
fe1f: ff ff ff     stx (0xFFFF)
fe22: ff ff ff     stx (0xFFFF)
fe25: ff ff ff     stx (0xFFFF)
fe28: ff ff ff     stx (0xFFFF)
fe2b: ff ff ff     stx (0xFFFF)
fe2e: ff ff ff     stx (0xFFFF)
fe31: ff ff ff     stx (0xFFFF)
fe34: ff ff ff     stx (0xFFFF)
fe37: ff ff ff     stx (0xFFFF)
fe3a: ff ff ff     stx (0xFFFF)
fe3d: ff ff ff     stx (0xFFFF)
fe40: ff ff ff     stx (0xFFFF)
fe43: ff ff ff     stx (0xFFFF)
fe46: ff ff ff     stx (0xFFFF)
fe49: ff ff ff     stx (0xFFFF)
fe4c: ff ff ff     stx (0xFFFF)
fe4f: ff ff ff     stx (0xFFFF)
fe52: ff ff ff     stx (0xFFFF)
fe55: ff ff ff     stx (0xFFFF)
fe58: ff ff ff     stx (0xFFFF)
fe5b: ff ff ff     stx (0xFFFF)
fe5e: ff ff ff     stx (0xFFFF)
fe61: ff ff ff     stx (0xFFFF)
fe64: ff ff ff     stx (0xFFFF)
fe67: ff ff ff     stx (0xFFFF)
fe6a: ff ff ff     stx (0xFFFF)
fe6d: ff ff ff     stx (0xFFFF)
fe70: ff ff ff     stx (0xFFFF)
fe73: ff ff ff     stx (0xFFFF)
fe76: ff ff ff     stx (0xFFFF)
fe79: ff ff ff     stx (0xFFFF)
fe7c: ff ff ff     stx (0xFFFF)
fe7f: ff ff ff     stx (0xFFFF)
fe82: ff ff ff     stx (0xFFFF)
fe85: ff ff ff     stx (0xFFFF)
fe88: ff ff ff     stx (0xFFFF)
fe8b: ff ff ff     stx (0xFFFF)
fe8e: ff ff ff     stx (0xFFFF)
fe91: ff ff ff     stx (0xFFFF)
fe94: ff ff ff     stx (0xFFFF)
fe97: ff ff ff     stx (0xFFFF)
fe9a: ff ff ff     stx (0xFFFF)
fe9d: ff ff ff     stx (0xFFFF)
fea0: ff ff ff     stx (0xFFFF)
fea3: ff ff ff     stx (0xFFFF)
fea6: ff ff ff     stx (0xFFFF)
fea9: ff ff ff     stx (0xFFFF)
feac: ff ff ff     stx (0xFFFF)
feaf: ff ff ff     stx (0xFFFF)
feb2: ff ff ff     stx (0xFFFF)
feb5: ff ff ff     stx (0xFFFF)
feb8: ff ff ff     stx (0xFFFF)
febb: ff ff ff     stx (0xFFFF)
febe: ff ff ff     stx (0xFFFF)
fec1: ff ff ff     stx (0xFFFF)
fec4: ff ff ff     stx (0xFFFF)
fec7: ff ff ff     stx (0xFFFF)
feca: ff ff ff     stx (0xFFFF)
fecd: ff ff ff     stx (0xFFFF)
fed0: ff ff ff     stx (0xFFFF)
fed3: ff ff ff     stx (0xFFFF)
fed6: ff ff ff     stx (0xFFFF)
fed9: ff ff ff     stx (0xFFFF)
fedc: ff ff ff     stx (0xFFFF)
fedf: ff ff ff     stx (0xFFFF)
fee2: ff ff ff     stx (0xFFFF)
fee5: ff ff ff     stx (0xFFFF)
fee8: ff ff ff     stx (0xFFFF)
feeb: ff ff ff     stx (0xFFFF)
feee: ff ff ff     stx (0xFFFF)
fef1: ff ff ff     stx (0xFFFF)
fef4: ff ff ff     stx (0xFFFF)
fef7: ff ff ff     stx (0xFFFF)
fefa: ff ff ff     stx (0xFFFF)
fefd: ff ff ff     stx (0xFFFF)
ff00: ff ff ff     stx (0xFFFF)
ff03: ff ff ff     stx (0xFFFF)
ff06: ff ff ff     stx (0xFFFF)
ff09: ff ff ff     stx (0xFFFF)
ff0c: ff ff ff     stx (0xFFFF)
ff0f: ff ff ff     stx (0xFFFF)
ff12: ff ff ff     stx (0xFFFF)
ff15: ff ff ff     stx (0xFFFF)
ff18: ff ff ff     stx (0xFFFF)
ff1b: ff ff ff     stx (0xFFFF)
ff1e: ff ff ff     stx (0xFFFF)
ff21: ff ff ff     stx (0xFFFF)
ff24: ff ff ff     stx (0xFFFF)
ff27: ff ff ff     stx (0xFFFF)
ff2a: ff ff ff     stx (0xFFFF)
ff2d: ff ff ff     stx (0xFFFF)
ff30: ff ff ff     stx (0xFFFF)
ff33: ff ff ff     stx (0xFFFF)
ff36: ff ff ff     stx (0xFFFF)
ff39: ff ff ff     stx (0xFFFF)
ff3c: ff ff ff     stx (0xFFFF)
ff3f: ff ff ff     stx (0xFFFF)
ff42: ff ff ff     stx (0xFFFF)
ff45: ff ff ff     stx (0xFFFF)
ff48: ff ff ff     stx (0xFFFF)
ff4b: ff ff ff     stx (0xFFFF)
ff4e: ff ff ff     stx (0xFFFF)
ff51: ff ff ff     stx (0xFFFF)
ff54: ff ff ff     stx (0xFFFF)
ff57: ff ff ff     stx (0xFFFF)
ff5a: ff ff ff     stx (0xFFFF)
ff5d: ff ff ff     stx (0xFFFF)
ff60: ff ff ff     stx (0xFFFF)
ff63: ff ff ff     stx (0xFFFF)
ff66: ff ff ff     stx (0xFFFF)
ff69: ff ff ff     stx (0xFFFF)
ff6c: ff ff ff     stx (0xFFFF)
ff6f: ff ff ff     stx (0xFFFF)
ff72: ff ff ff     stx (0xFFFF)
ff75: ff ff ff     stx (0xFFFF)
ff78: ff ff ff     stx (0xFFFF)
ff7b: ff ff ff     stx (0xFFFF)
ff7e: ff ff ff     stx (0xFFFF)
ff81: ff ff ff     stx (0xFFFF)
ff84: ff ff ff     stx (0xFFFF)
ff87: ff ff ff     stx (0xFFFF)
ff8a: ff ff ff     stx (0xFFFF)
ff8d: ff ff ff     stx (0xFFFF)
ff90: ff ff ff     stx (0xFFFF)
ff93: ff ff ff     stx (0xFFFF)
ff96: ff ff ff     stx (0xFFFF)
ff99: ff ff ff     stx (0xFFFF)
ff9c: ff ff ff     stx (0xFFFF)
ff9f: ff 7e fb     stx (0x7EFB)
ffa2: 29 7e        bvs [0x10022]
ffa4: fb 29 7e     addb (0x297E)
ffa7: fb 29 7e     addb (0x297E)
ffaa: f9 df 7e     adcb (0xDF7E)
ffad: fb 0c 7e     addb (0x0C7E)
ffb0: fa 79 7e     orab (0x797E)
ffb3: fa a3 7e     orab (0xA37E)
ffb6: f9 1a 7e     adcb (0x1A7E)
ffb9: fa c9 7e     orab (0xC97E)
ffbc: fa f9 ff     orab (0xF9FF)
ffbf: ff fb 2a     stx (0xFB2A)
ffc2: fb 2a fb     addb (0x2AFB)
ffc5: 2a fb        bpl [0xFFC2]
ffc7: 2a fb        bpl [0xFFC4]
ffc9: 2a fb        bpl [0xFFC6]
ffcb: 2a fb        bpl [0xFFC8]
ffcd: 2a fb        bpl [0xFFCA]
ffcf: 2a fb        bpl [0xFFCC]
ffd1: 2a fb        bpl [0xFFCE]
ffd3: 2a fb        bpl [0xFFD0]
ffd5: 2a 01        bpl [0xFFD8]
ffd7: 00           test
ffd8: 01           nop
ffd9: 03           fdiv
ffda: 01           nop
ffdb: 06           tap
ffdc: 01           nop
ffdd: 09           dex
ffde: fb 2a 01     addb (0x2A01)
ffe1: 0c           clc
ffe2: 01           nop
ffe3: 0f           sei
ffe4: 01           nop
ffe5: 12 01 15 01  brset (0x0001), 0x15, [0xFFEA]
ffe9: 18 01        ?
ffeb: 1b           aba
ffec: 01           nop
ffed: 1e 01 21 01  brset (X+0x01), 0x21, [0xFFF2]
fff1: 24 01        bcc [0xFFF4]
fff3: 27 01        beq [0xFFF6]
fff5: 2a 01        bpl [0xFFF8]
fff7: 2d 01        blt [0xFFFA]
fff9: 30           tsx
fffa: 01           nop
fffb: 33           pulb
fffc: 01           nop
fffd: 36           psha
fffe: f8 00 00     eorb (0x0000)
