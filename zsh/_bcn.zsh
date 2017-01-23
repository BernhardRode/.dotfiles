location=$(networksetup -getcurrentlocation)
if [ "$location" = "BCN" ] || [ "$location" = "BCN (Auto)" ] || [ "$location" = "BCN (VPN)" ]; then
  export BCN="yes"
fi