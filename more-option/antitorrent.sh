#!/bin/bash

GitUser="JebonRX"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)

if [[ $USER != 'root' ]]; then
	echo "Oops! root privileges needed"
	exit
fi
while :
do

#Start Conf
iptables -A OUTPUT -p icmp --icmp-type echo-request -j DROP 
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP 
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP 
iptables -A INPUT -f -j DROP 
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP 
iptables -A INPUT -m string --string "BitTorrent" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string "BitTorrent protocol" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string "peer_id=" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string ".torrent" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string "announce.php?passkey=" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string "torrent" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string "announce" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string "info_hash" --algo bm --to 65535 -j DROP 
iptables -A INPUT -m string --string "peer_id" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "BitTorrent" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "BitTorrent protocol" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "bittorrent-announce" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "announce.php?passkey=" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "find_node" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "info_hash" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "get_peers" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "announce" --algo kmp --to 65535 -j DROP 
iptables -A INPUT -m string --string "announce_peers" --algo kmp --to 65535 -j DROP 
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 
iptables -I OUTPUT -p tcp --dport 1723 -j ACCEPT 
iptables -A OUTPUT -p tcp --dport 6881:6889 -j DROP 
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP 
iptables -A FORWARD -p tcp --dport 6881:6889 -j DROP 
iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "peer_id=" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string ".torrent" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "torrent" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "announce" -j LOGDROP 
iptables -D FORWARD -m string --algo bm --string "info_hash" -j LOGDROP 
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP 
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j LOGDROP 
iptables -A FORWARD -m string --string "find_node" --algo bm -j LOGDROP 
iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "peer_id=" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string ".torrent" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "torrent" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "announce" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "info_hash" -j DROP 
iptables -A FORWARD -p udp -m string --algo bm --string "tracker" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string ".torrent" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "torrent" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "announce" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "info_hash" -j DROP 
iptables -A INPUT -p udp -m string --algo bm --string "tracker" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string ".torrent" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "torrent" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "announce" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "info_hash" -j DROP 
iptables -I INPUT -p udp -m string --algo bm --string "tracker" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "peer_id=" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string ".torrent" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "torrent" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "announce" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "info_hash" -j DROP 
iptables -D INPUT -p udp -m string --algo bm --string "tracker" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "peer_id=" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string ".torrent" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "torrent" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "announce" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "info_hash" -j DROP 
iptables -I OUTPUT -p udp -m string --algo bm --string "tracker" -j DROP 
iptables -D INPUT -m string --algo bm --string "BitTorrent" -j DROP 
iptables -D INPUT -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -D INPUT -m string --algo bm --string "peer_id=" -j DROP 
iptables -D INPUT -m string --algo bm --string ".torrent" -j DROP 
iptables -D INPUT -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D INPUT -m string --algo bm --string "torrent" -j DROP 
iptables -D INPUT -m string --algo bm --string "announce" -j DROP 
iptables -D INPUT -m string --algo bm --string "info_hash" -j DROP 
iptables -D INPUT -m string --algo bm --string "tracker" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "BitTorrent" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "peer_id=" -j DROP 
iptables -D OUTPUT -m string --algo bm --string ".torrent" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "torrent" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "announce" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "info_hash" -j DROP 
iptables -D OUTPUT -m string --algo bm --string "tracker" -j DROP 
iptables -D FORWARD -m string --algo bm --string "BitTorrent" -j DROP 
iptables -D FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP 
iptables -D FORWARD -m string --algo bm --string "peer_id=" -j DROP 
iptables -D FORWARD -m string --algo bm --string ".torrent" -j DROP 
iptables -D FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP 
iptables -D FORWARD -m string --algo bm --string "torrent" -j DROP 
iptables -D FORWARD -m string --algo bm --string "announce" -j DROP 
iptables -D FORWARD -m string --algo bm --string "info_hash" -j DROP 
iptables -D FORWARD -m string --algo bm --string "tracker" -j DROP 
iptables-save

# Hello World 
clear

	clear
	echo " "
	echo " "
	echo "-----------------------------------------"
	echo "            Install Anti Torrent         "
	echo "-----------------------------------------"
	echo "Anti-torrent was already installed in your server"
	echo "You don't need to touch anything here"
	echo "Just sit back and relax"
	echo " "
	echo " ### By V2Remake ###"
	echo " "
	echo "     [ MENU ]"
	echo "1. Go Back"
	read -p "Type 1 to go back : " option2
	case $option2 in
		1)
		clear
		exit
		;;
	esac
done
cd
