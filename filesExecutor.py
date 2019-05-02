#/bin/python3

import os
import datetime

Time = (datetime.datetime.now())
Directory = "."
for filename in os.listdir(Directory):
#file names can start with any name like Json /Sh
    if filename.endswith("json"):
        os.system('packer build ' +  filename)
	print filename
        #file = (os.path.join(strDirectory, filename))
        #os.system('echo 'file)
        print(strStartTime)
