#this script runs all the other steup scripts

#!/bin/bash

bash installations/installApplications.sh || echo "install applications failed, continuing..."

#taskbar stuff
bash TaskbarStuff/unpinStuff.sh || echo "unpin stuff failed, continuing..."
bash TaskbarStuff/pinStuff.sh || echo "pin stuff failed, continuing..."
bash TaskbarStuff/configureTaskbar.sh || echo "configure taskbar failed, continuing..."


bash MiscPreferences/configureSystem.sh || echo "configure misc system stuff failed, continuing..."
