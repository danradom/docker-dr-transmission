#!/bin/sh
#
# PIA openvpn / transmission / pirate-get container based on alpine linux
#


docker run --rm -it -d \
	--dns 8.8.8.8 \
	--dns 8.8.4.4 \
	--cap-add=NET_ADMIN --device=/dev/net/tun \
	-e "vpn_user=username" \
	-e "vpn_pass=password" \
	-e "vpn_link=US California" \
	-e "webui=no" \
	-v /path/to/dr-transmission/:/data \
	--name dr-transmission \
	-p 9091:9091 \
	dr-transmission
