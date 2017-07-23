#!/bin/sh
#
# start openvpn and transmission
#

if [ "$webui" = "yes" ]; then
	/sbin/ip route add $host_net via $gateway_ip dev $gateway_dev
fi

if [ ! -z "$vpn_link" ]; then
	export vpn_link="US California"
fi

echo $vpn_user > /etc/openvpn/pia/pia.pass
echo $vpn_pass >> /etc/openvpn/pia/pia.pass

exec openvpn --config /etc/openvpn/pia/"${vpn_link}".ovpn --auth-user-pass /etc/openvpn/pia/pia.pass --script-security 2 --up-delay --up /usr/local/admin/transmission-start.sh --down /usr/local/admin/transmission-stop.sh --crl-verify /etc/openvpn/pia/crl.rsa.2048.pem --ca /etc/openvpn/pia/ca.rsa.2048.crt
