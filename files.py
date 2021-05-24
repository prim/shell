
import utils
import sys

key = raw_input("input key:")

aes = utils.AESCipher(key)

if sys.argv[1] == "e":
    with open("files", "rb") as rf:
        content = rf.read()
    with open("files.e", "wb+") as wf:
        wf.write(aes.encrypt(content))

if sys.argv[1] == "d":
    with open("files.e", "rb") as rf:
        content = rf.read()
    with open("files.d", "wb+") as wf:
        wf.write(aes.decrypt(content))

