
#   Program to Validate Cyberstar v1.6 
#   Challenge-Response code
#   Frank Palazzolo - 2024

def Modulo(code):
    for i in range(0,len(code)):
        while(code[i] > ord('Z')):
            code[i] -= 26
        while(code[i] < ord('A')):
            code[i] += 26
    return code

def GenerateResponse(challenge):

    code = challenge.encode('ascii')

    # Permute the letters
    newcode = bytearray(code[3:4]+code[0:1]+code[4:5]+code[1:2]+code[2:3])

    # Transform them a bit
    newcode[0] ^= 0x13
    newcode[0] += 0x03
    newcode[1] ^= 0x04
    newcode[1] += 0x12
    newcode[2] ^= 0x06
    newcode[2] += 0x04
    newcode[3] ^= 0x11
    newcode[3] += 0x07
    newcode[4] ^= 0x01
    newcode[4] += 0x10
    newcode = Modulo(newcode)

    a = code[4] ^ 0x17
    b = code[0] ^ 0x17

    for i in range(0,len(newcode)):
        newcode[i] = newcode[i] ^ a ^ b

    newcode = Modulo(newcode)

    return newcode.decode('ascii')

def Validate(challenge):
    if len(challenge) != 5:
        print("Keyword is invalid length!\n")
        return False
    bs = challenge.encode('ascii')
    for c in bs:
        if c < ord('A') or c > ord('Z'):
            print("Keyword is invalid format!\n")
            return False
    return True

def main():
    print('''
    Workalike for "Tim's World Rules" (c) dbp
    (Logic regenerated from reverse engineering of 68HC11 code,
                                        Frank Palazzolo - 2024)

    This program asks for a 5-letter keyword. The keyword must be ALL
    capital letters from A-Z. After you have entered the keyword, the
    program will display the password associated with that keyword. To
    exit the program, simply press <ENTER> when asked for the keyword.
    ''')
    while True:
        challenge = input("Please enter the 5-letter keyword: ")
        if challenge == "":
            break
        ok = Validate(challenge)
        if ok:
            response = GenerateResponse(challenge)
            print(f"                  The password is: {response}\n")

main()
