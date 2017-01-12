#!/usr/bin/python3
import sys
import os.path

pos = 0
filename = ""
mark = " "
around = 0

if(len(sys.argv) > 1):
    filename = sys.argv[1]

if(len(sys.argv) > 2):
    pos = int(sys.argv[2])

if(len(sys.argv) > 3):
    around = int(sys.argv[3])

if (os.path.isfile(filename)):
    i=0
    with open(filename, encoding="utf8") as f:
        for line in f:
            i=i+1
            if pos-around<=i and i<=pos+around:
                if i == pos:
                    mark = "-"
                else:
                    mark = " "
                sys.stdout.write(mark + str(i) + " " + line)
            if i==pos+around:    
                break
else:
    print("vik {str:filename} {int:pos} {int:around}")