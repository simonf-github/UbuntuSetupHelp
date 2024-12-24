#this script runs all the other steup scripts

#!/bin/bash

#install applications
#remove unneeded taskbar pins
#configure


bash script1.sh || echo "script1.sh failed, continuing..."
bash script2.sh || echo "script2.sh failed, continuing..."
bash script3.sh || echo "script3.sh failed, continuing..."
