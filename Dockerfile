# PIA openvpn / transmission
#


FROM alpine
MAINTAINER dan radom


ENV vpn_user=username \
    vpn_pass=password \
    vpn_link=pia_site


COPY admin/* /usr/local/admin/
COPY pia/* /etc/openvpn/pia/
COPY pirate-get /root/.config/pirate-get


RUN apk update \
	&& apk add dumb-init \
	&& apk add python3 \
	&& apk add ca-certificates \
	&& apk add openvpn \
	&& apk add transmission \
	&& apk add transmission-daemon \
	&& apk add transmission-cli \
	&& pip3 install pirate-get \
	&& chmod 750 /usr/local/admin/*.sh


EXPOSE 9091


CMD ["dumb-init", "/usr/local/admin/openvpn.sh"]
