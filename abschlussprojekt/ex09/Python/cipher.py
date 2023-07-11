# !/usr/bin/python3
import serial
import threading
import time


import sys
import bitarray

class DES(object):
    """Class implementing a simple DES algorithm."""
    #  Introduction to Cryptography with Coding Theory,  Wade Trappe, and Lawrence C. Washington,  2002.

    s1 = [[b'101', b'010', b'001', b'110', b'011', b'100', b'111', b'000'],
          [b'001', b'100',b'110',b'010', b'000',b'111', b'101' ,b'011']]
    s2 = [[b'100', b'000', b'110', b'101', b'111', b'001', b'011', b'010'],
          [b'101', b'011',b'000',b'111', b'110',b'010', b'001' ,b'100']]

    def __init__(self):
        pass

    def __s_Box(self, box, input):
        """Substitute box implementation."""
        row = 0
        if int(input, 2) >= int(b'1000', 2):
            row = 1
            column = int(input, 2) - int(b'1000', 2)
        else:
            column = int(input, 2)
        return box[row][column]

    def __expand(self, input):
        """Expand a 6 bit input to an 8 bit output."""
        data = input[0:2] + input[3:4] + input[2:4] + input[2:3] + input[4:6]
        return data

    def __xor(self, input, key):
        """Xor two 8 bit vectors."""
        dummy = b'01'
        data = dummy
        for i, k in zip(input, key):
            if chr(i) == '1' and chr(k) == '1':
                data += b'0'
            elif chr(i) == '0' and chr(k) == '0':
                data += b'0'
            else:
                data += b'1'
        data = data[2:]
        return data

    def __getKey(self, key, round):
        """Get key for a given round."""
        start = (round-1)%len(key)
        end = (start + 8)%len(key)
        if end < start:
            return key[start:] + key[:end]
        else:
            return key[start:end]

    def __splitLR(self, input):
        """Split an arbitrary length vector in two."""
        leng = len(input)
        if leng%2 != 0:
            print("ERROR: Cannot split data of length " + str(len(input)))
            sys.exit()
        return (input[:int(leng/2)], input[int(leng/2):])

    def crypt(self, message, key, rounds, encrypt, verbose=False):
        """Crypt or decrypt the given msg with the given key in given # rounds."""
        while len(message)%12 != 0:
            message = message + b'0'
        if verbose:
            print("Key: " + str(key))
            print("Message: " + str(message))
        blocks = []
        for i in range(0, len(message), 12):
          blocks.append(message[i:i + 12])
        if verbose:
            print("Blocks: " + str(blocks))
        _Blocks = []
        for block in blocks:
            if verbose:
                print("block: " + str(block))
            L, R = self.__splitLR(block)
            for round in range(1,rounds+1):
                if encrypt:
                    K = self.__getKey(key, round)
                else:
                    K = self.__getKey(key, (rounds - round) + 1)
                ER = self.__expand(R)
                ER_XOR_K = self.__xor(ER, K)
                l, r = self.__splitLR(ER_XOR_K)
                l_new = self.__s_Box(self.s1, l)
                r_new = self.__s_Box(self.s2, r)
                f = l_new + r_new
                F_XOR_L = self.__xor(f, L)
                if verbose:
                    if encrypt:
                        k = round
                    else:
                        k = (rounds - round) + 1
                    print("L_" + str(round-1) + ": " + str(L) + "\tR_" + str(round-1) + ": " + str(R))
                    print("K_" + str(k) + ": " + str(K))
                    print("E(R_" + str(round-1) + "): " + str(ER))
                    print("E(R_" + str(round-1) + ") xor K_" + str(k) + ":" + str(ER_XOR_K))
                    print("l_" + str(round-1) + ": " + str(l) + "\tr_" + str(round-1) + ": " + str(r))
                    print("s1(" + str(l) + "): " + str(l_new) + "\ts2(" + str(r) + "): " + str(r_new))
                    print("F(R_" + str(round-1) + ", K_" + str(k) + ") xor L_" + str(round-1) + ":" + str(F_XOR_L))
                L = R
                R = F_XOR_L
            if verbose:
                print("encrypted block:" + str(R+L))
            _Blocks.append(R+L)

        messageR = _Blocks[0]
        for eb in _Blocks[1:]:
            messageR += eb
        if verbose:
            if encrypt:
                print("Encrypted", end="")
            else:
                print("decrypted", end="")
            print(" message:" + str(messageR))
        return messageR


    def toString(self, bits):
        """Covert bit vector to chars."""
        try:
            plain = bitarray.bitarray(bits.decode('utf-8')).tobytes().decode('utf-8')
            return plain
        except:
            print("Error decoding to string")
            return ""

    def toBytes(self, bits):
        """Covert bit vector to list of bytes."""
        blocks = []
        for i in range(0, len(cipher), 8):
          byte = int(cipher[i:i + 8], 2).to_bytes(1, byteorder='little', signed=False)
          blocks.append(byte)
        return blocks

    def toInt(self, bits):
        """Covert bit vector to list of ints."""
        blocks = []
        for i in range(0, len(cipher), 8):
          byte = int(cipher[i:i + 8], 2)
          blocks.append(byte)
        return blocks

    def toBits(self, message):
        """Covert string to bits."""
        ba = bitarray.bitarray()
        ba.frombytes(message.encode('utf-8'))
        data = b'0'
        for i in range(len(ba)):
            if ba[i]:
                data += b'1'
            else:
                data += b'0'
        return data[1:]

# _______________Can be called as main__________________
if __name__ == '__main__':
    import argparse
    import sys
    import os
    import signal
    import time
    # _________________________Parse Arguments______________________________
    parser = argparse.ArgumentParser()
    parser.add_argument("-msg", type=str,
                        help="Plaintext MSG to use.")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Increase output verbosity")
    args = parser.parse_args()

    secretMessage = "KEY123456"
    if args.msg is not None:
        secretMessage = args.msg

    des = DES()
    encrypt = True
    key = b'1111101010101010111110'

    plain = des.toBits(secretMessage)
    rounds = len(key)

    cipher = des.crypt(plain, key, rounds, encrypt, verbose=args.verbose)

    cipher_int = des.toInt(cipher)
    rePlain = des.crypt(cipher, key, rounds, not encrypt, verbose=args.verbose)
    print("Key: " + str(key))
    print("keyLength: " + str(len(key)))
    print("Rounds: " + str(rounds))
    print("Plain: " + str(plain))
    print("\t" + des.toString(plain))
    print("Cypher: " + str(cipher))
    print("Cypher: " + str(cipher_int))
    print("Plain2:\t" + str(rePlain))
    print("\t" + des.toString(rePlain))
