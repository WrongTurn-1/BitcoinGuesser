#!/bin/bash
# One script to rule them all
# ./brainflayer -v -b btc_h160.blf -i 12words.txt -o foundkeys1.txt 

echo " **************** Program START **************** "
echo $(date +"%r")
SECONDS=0


# Then we run the files, all in parallel. Each creates its own version of 12words in a different location.
echo First we create word lists of 12 words per line:
#cd ~/path0
rm 13words.txt

#./biphelper-v102a-X64linux -n 10000000 >> 12words.txt &
python3 MNemomakeTest.py > 13words.txt
#echo " Ran Bip39Helper core 0"
echo "+++++++++++++++++  Finished making wordlists +++++++++++++++"


# Then we run simultaneous versions of brainflayer
echo "* Starting Brainflayer...*"
echo $(date +"%r")
./brainflayer -v -b btc_h160.blf -i 13words.txt -o foundkeys0.txt &
wait
echo "Finished brainflayer ALL"
echo $(date +"%r")




## Archive all positive results so they are not written over next loop, ammend file not overwrite:
cat foundkeys0.txt >> foundkeysALL.txt

echo all processes complete stage 3

# STAGE 4: if foundkeysALL.txt is bigger than zero then it has saved a key, and we will create a beep alert (use 2 forms to be sure)

if [ -s foundkeysALL.txt ] 
then
	echo "filename exists and is > 0 bytes"
	echo "FOUND SOMETHING, FOUND SOMETHING"
	echo "FOUND SOMETHING, FOUND SOMETHING"
	echo "				FOUND SOMETHING, FOUND SOMETHING"
	echo "								FOUND SOMETHING, FOUND SOMETHING"
	echo $(date +"%r")
			# play an annoying sound if an address is found
	speaker-test -t sine -f 1000 -l 1 & sleep .8 && kill -9 $!
	echo -ne '\007'
	# exit program when somthing found
	exit
else
	echo " "
	echo "foundkeysALL.txt is zero length so no keys found"
	echo $(date +"%r")
	echo " --------------------------------------------"
fi

wait

##### LOOP AGAIN ??? 

echo "---------Program END----------"
echo $(date +"%r")

## NOTE TIME TAKEN:

if (( $SECONDS > 3600 )) ; then
    let "hours=SECONDS/3600"
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Completed in $hours hour(s), $minutes minute(s) and $seconds second(s)" 
elif (( $SECONDS > 60 )) ; then
    let "minutes=(SECONDS%3600)/60"
    let "seconds=(SECONDS%3600)%60"
    echo "Completed in $minutes minute(s) and $seconds second(s)"
else
    echo " --- Completed in $SECONDS seconds --- "
fi

echo " ///////////////////////////////////////////////////////////////////////"
echo " "
echo "************************************************************************"

# repeat loop if nothing found
./runme.sh
