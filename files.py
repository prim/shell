
import utils
import sys

key = raw_input("input key:")

aes = utils.AESCipher(key)

if sys.argv[1] == "e":
    with open("home/files", "rb") as rf:
        content = rf.read()
    with open("home/files.e", "wb+") as wf:
        wf.write(aes.encrypt(content))

if sys.argv[1] == "d":
    with open("home/files.e", "rb") as rf:
        content = rf.read()
    with open("home/files.d", "wb+") as wf:
        wf.write(aes.decrypt(content))

