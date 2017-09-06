#!/usr/bin/env python

import os
import os.path 

homedir=os.path.expanduser("~")

ls_homedir=os.listdir(homedir)

##test is 
test = [e for e in ls_homedir if e.startswith(".nanorc")]

if len(test) is 1:
    print ".nanorc exists" 
else:
    print ".nanorc does not exists"
