# BitcoinGuesser
This is how I scan for 600million bitcoin addresses per hour, a guide

SUMMARY:
Pipe Bip39Helper into brainflayer
I have 8 cores on an i5, so I'm running it 7 times simultaneously.
I'm a total scriptkiddy, so improvements welcome!

##### IN DETAIL:
#####  
0) download all the bitcoin addresses, this is around 3GB (just 34million active BTC addresses, not the whole blockchain!)
1) https://bitkeys.work/download.php
4) if you wish to use my code exactly, then you need these file paths exactly:
5) on my Ubuntu20.04 I create the file Desktop/BTC
6) in your Terminal: me@Ubuntu:~/Desktop/BTC$ git clone https://github.com/TheRealLordFractal/Bip39Helper/releases/tag/1.02a
--- note this is not the version on the mainpage it corrects for a blank space at the beginning of each line in wordlists created
7) in your terminal at me@Ubuntu:~/Desktop/BTC$ git clone https://github.com/matchv/brainflayer.git
---  note this is not the original version, but a version adapted for Ubuntu 18.04 and 20.04
--- move your BTC_addresses file into the /brainflayer directory
---  then compile brainflayer, with these further details at: https://bitkeys.work/crack.php
    Compile Brainflayer on Ubuntu 18.04 or Ubuntu 20.04
    $ git clone https://github.com/matchv/brainflayer.git
    $ apt-get install openssl
    $ apt-get install libgmp3-dev
    $ apt-get install libimobiledevice-dev libplist-dev libusbmuxd-dev libssl-dev zlib1g-dev
    $ apt-get install dh-autoreconf
    $ cd brainflayer/
    $ make
8)
--- next you need to turn your downloaded BTC addresses into a blf for faster checking, 
cd /brainflayer
cut -d, -f 4 btc_balance_sorted.csv > btc_h160.txt  ---  notes on this here: https://www.bitkeys.work/download.php \n
./hex2blf btc_h160.txt btc_h160.blf

--- you can do a quick test of brainflayer, make a small wordlist.txt in the brainflayer folder and run> ./brainflayer -v -b btc_h160.blf -i wordlist.txt
9) copy the wordlist from Bip39Helper into the BTC folder. I run the program from the /BTC location everytime and it likes to reference wordlist.txt in its current folder
 
10) cd /Bip39Helper-1.02a  ---  we need to make the file with this command:
11) /Bip39Helper-1.02a$    gcc -v -Os -I /usr/include/python2.7/ -L /usr/local/lib/python2.7/ -o biphelper-102a-LinuxX64 biphelper-102a-LinuxX64.c -lpython2.7 -lpthread -lm -lutil -ldl
 
12) Give the main file execution permissions, right click on biphelper-102a-LinuxX64 and select Permission and tick the box "allow executing"
13) Then make six copies of this fol14) der, I have /Bip39Helper-1.02a and /Bip39Helper-1.02a_1 and /Bip39Helper-1.02a_2 ... /Bip39Helper-1.02a_6 all inside the BTC folder.
15) copy my bash script called RUNME.sh here to BTC/

16) Now, run like this, and it permanently loops:
17)   me@Ubuntu:~/Desktop/BTC$ /home/ubuntu/Desktop/BTC/RUNME.sh
