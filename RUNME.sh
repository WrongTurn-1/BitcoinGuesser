#!/bin/bash
# One script to rule them all

echo " **************** Program START **************** "
echo $(date +"%r")
SECONDS=0

# to seed multiple scripts simultaneously, first we create a symbolic link (https://askubuntu.com/questions/481715/why-doesnt-cd-work-in-a-shell-script). THIS ONLY HAS TO BE DONE THE FIRST TIME YOU RUN THIS ON YOUR PC, then comment out the symbolic links part
#ln -s  /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a ~/path0		
#ln -s  /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_1 ~/path1
#ln -s  /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_2 ~/path2
#ln -s  /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_3 ~/path3
#ln -s  /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_4 ~/path4
#ln -s  /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_5 ~/path5
#ln -s  /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_6 ~/path6

# Then we run the files, all in parallel. Each creates its own version of 12words in a different location.
echo First we create word lists of 12 words per line:
cd ~/path0
/home/ubuntu/Desktop/BTC/Bip39Helper-1.02a/biphelper-102a-LinuxX64 -n 1000010 >> /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a/12words.txt &
echo " Ran Bip39Helper core 0"
cd ~/path1
/home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_1/biphelper-102a-LinuxX64 -n1000011 >> /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_1/12words.txt &
echo " Run BipH core 1"
cd ~/path2
/home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_2/biphelper-102a-LinuxX64 -n1000012 >> /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_2/12words.txt &
echo " Run BipH 2"

cd ~/path3
/home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_3/biphelper-102a-LinuxX64 -n1000013 >> /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_3/12words.txt &
echo " Run BipH 3"

cd ~/path4
/home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_4/biphelper-102a-LinuxX64 -n1000014 >> /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_4/12words.txt &
echo " Run BipH 4"

cd ~/path5
/home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_4/biphelper-102a-LinuxX64 -n1000015 >> /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_5/12words.txt &
echo " Run BipH 5"

cd ~/path6
/home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_4/biphelper-102a-LinuxX64 -n1000016 >> /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_6/12words.txt 
wait
echo " Run BipH 6"

echo "Now to remove blank from beginning and end of each line and copy to brainflayer folder -->"
sed -e 's/[[:blank:]]$//' -e 's/[[:blank:]]//' /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a/12words.txt > /home/ubuntu/Desktop/BTC/brainflayer/file0.txt &
sed -e 's/[[:blank:]]$//' -e 's/[[:blank:]]//' /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_1/12words.txt > /home/ubuntu/Desktop/BTC/brainflayer/file1.txt &
sed -e 's/[[:blank:]]$//' -e 's/[[:blank:]]//' /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_2/12words.txt > /home/ubuntu/Desktop/BTC/brainflayer/file2.txt &
sed -e 's/[[:blank:]]$//' -e 's/[[:blank:]]//' /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_3/12words.txt > /home/ubuntu/Desktop/BTC/brainflayer/file3.txt &
sed -e 's/[[:blank:]]$//' -e 's/[[:blank:]]//' /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_4/12words.txt > /home/ubuntu/Desktop/BTC/brainflayer/file4.txt &
sed -e 's/[[:blank:]]$//' -e 's/[[:blank:]]//' /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_5/12words.txt > /home/ubuntu/Desktop/BTC/brainflayer/file5.txt &
sed -e 's/[[:blank:]]$//' -e 's/[[:blank:]]//' /home/ubuntu/Desktop/BTC/Bip39Helper-1.02a_6/12words.txt > /home/ubuntu/Desktop/BTC/brainflayer/file6.txt &
wait
echo "+++++++++++++++++  Finished making wordlists +++++++++++++++"
echo $(date +"%r")

# Then we run simultaneous versions of brainflayer
echo "* Starting brainflayer 1st core..."
echo $(date +"%r")
/home/ubuntu/Desktop/BTC/brainflayer/brainflayer -v -b /home/ubuntu/Desktop/BTC/brainflayer/btc_h160.blf -i /home/ubuntu/Desktop/BTC/brainflayer/file0.txt -o /home/ubuntu/Desktop/BTC/brainflayer/foundkeys0.txt &
echo "** Starting brainflayer 2nd core.."
echo $(date +"%r")
/home/ubuntu/Desktop/BTC/brainflayer/brainflayer -v -b /home/ubuntu/Desktop/BTC/brainflayer/btc_h160.blf -i /home/ubuntu/Desktop/BTC/brainflayer/file1.txt -o /home/ubuntu/Desktop/BTC/brainflayer/foundkeys1.txt &
echo "*** Starting brainflayer 3rd"
echo $(date +"%r")
/home/ubuntu/Desktop/BTC/brainflayer/brainflayer -v -b /home/ubuntu/Desktop/BTC/brainflayer/btc_h160.blf -i /home/ubuntu/Desktop/BTC/brainflayer/file2.txt -o /home/ubuntu/Desktop/BTC/brainflayer/foundkeys2.txt &
echo "**** Starting brainflayer 4th"
echo $(date +"%r")
/home/ubuntu/Desktop/BTC/brainflayer/brainflayer -v -b /home/ubuntu/Desktop/BTC/brainflayer/btc_h160.blf -i /home/ubuntu/Desktop/BTC/brainflayer/file3.txt -o /home/ubuntu/Desktop/BTC/brainflayer/foundkeys3.txt &
echo "***** Starting brainflayer 5th"
echo $(date +"%r")
/home/ubuntu/Desktop/BTC/brainflayer/brainflayer -v -b /home/ubuntu/Desktop/BTC/brainflayer/btc_h160.blf -i /home/ubuntu/Desktop/BTC/brainflayer/file4.txt -o /home/ubuntu/Desktop/BTC/brainflayer/foundkeys4.txt &
echo "****** Starting brainflayer 6th"
echo $(date +"%r")
/home/ubuntu/Desktop/BTC/brainflayer/brainflayer -v -b /home/ubuntu/Desktop/BTC/brainflayer/btc_h160.blf -i /home/ubuntu/Desktop/BTC/brainflayer/file5.txt -o /home/ubuntu/Desktop/BTC/brainflayer/foundkeys5.txt &
echo "******* Starting brainflayer 7th (ie path 6, as 0...6)"
echo $(date +"%r")
/home/ubuntu/Desktop/BTC/brainflayer/brainflayer -v -b /home/ubuntu/Desktop/BTC/brainflayer/btc_h160.blf -i /home/ubuntu/Desktop/BTC/brainflayer/file6.txt -o /home/ubuntu/Desktop/BTC/brainflayer/foundkeys6.txt &

wait

echo "Finished brainflayer ALL"
echo $(date +"%r")

## Archive all positive results so they are not written over next loop, ammend file not overwrite:
cat /home/ubuntu/Desktop/BTC/brainflayer/foundkeys0.txt >> /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt
cat /home/ubuntu/Desktop/BTC/brainflayer/foundkeys1.txt >> /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt
cat /home/ubuntu/Desktop/BTC/brainflayer/foundkeys2.txt >> /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt
cat /home/ubuntu/Desktop/BTC/brainflayer/foundkeys3.txt >> /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt
cat /home/ubuntu/Desktop/BTC/brainflayer/foundkeys4.txt >> /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt
cat /home/ubuntu/Desktop/BTC/brainflayer/foundkeys5.txt >> /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt
cat /home/ubuntu/Desktop/BTC/brainflayer/foundkeys6.txt >> /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt

echo all processes complete stage 3

# STAGE 4: if foundkeysALL.txt is bigger than zero then it has saved a key, and we will create a beep alert (use 2 forms to be sure)

if [ -s /home/ubuntu/Desktop/BTC/brainflayer/foundkeysALL.txt ] 
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
/home/ubuntu/Desktop/BTC/RUNME2.sh

























