#!/usr/bin/python

import os

f = open("targets.yaml", 'r')
lines = f.readlines()

for line in lines:
    pair = line.split(":")
    key = pair[0]
    value = pair[1].strip()
    working_dir = os.getcwd()
    command = "ln -s -T -i {0}/{1} {2}".format(working_dir, key, value)
    print(command)
    os.system(command)
