#!/bin/bash
#To deploy from development machine to test pis
# you will need to npm install on each machine after rsyncing

#add as many pi's as you want to the arrray of pi's here:
ssh_alias=( "pi@raspberrypi-1.local" "pi@raspberrypi-2.local" "pi@raspberrypi-3.local" "pi@raspberrypi-4.local" "pi@raspberrypi-5.local" )

site_folder="./*"
remote_folder="~/node-omxplayer-sync"
exclude="node_modules"

for i in "${ssh_alias[@]}"
do
	echo "+~+~+~+~+~+~+~+~+~+~+~+~+~+"
	echo $i
	rsync --exclude ${exclude} -a ${site_folder} ${i}:${remote_folder} -v
done

# rsync --exclude ${exclude} -a ${site_folder} ${ssh_alias2}:${remote_folder} -v


#try to fix this....
# ssh -t ${ssh_alias} "cd $remote_folder && npm install"
# ssh ${ssh_alias} 'bash -l -c "source /home/pi/.bashrc; cd $remote_folder; npm install"'
