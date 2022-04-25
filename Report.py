#script for storing reports
import datetime
import os

time = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")

dirpath = 'Report\\'+str(time)

if not os.path.exists(dirpath):
    os.makedirs(dirpath)

print('--outputdir ' + dirpath)
