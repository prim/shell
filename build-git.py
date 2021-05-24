#!/usr/bin/env python

import os

os.system("python files.py d")

with open("home/files.d", "r") as rf:
    code = rf.read()
    files = eval(code)
    for file_path, (mode, file_content) in files.items():
        print file_path
        os.system("mkdir -p %s" % os.path.dirname(file_path))
        with open(os.path.expanduser(file_path), "w+") as wf:
            wf.write(file_content)
        os.system("chmod %s %s" % (mode, file_path))

os.system("rm home/files.d")
