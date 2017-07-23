## docker-dr-transmission
PIA openvpn / transmission WebUI and pirate-get command line interfaces docker image based on alpine linux and inspired by [haugene](https://github.com/haugene) similar [project](https://github.com/haugene/docker-transmission-openvpn).
<br />
<br />

### Downloading dr-transmission fies
git clone https://github.com/danradom/docker-dr-transmission dr-transmission
<br />
<br />

### Building the dr-transmission image
The dr-transmission image is built using the included build.sh script.  It requires no editing.
<br />
<br />

### Starting the dr-transmission container
The dr-transmission container started using the included start_container.sh script.  Before you start the container, you need to edit the script providing the location of the dr-transmission directory and your PIA VPN crecentials.<br />
<br />

Change the /path/to/dr-transmission to the actual location of the dr-transmission directory.
<br />

-v /path/to/dr-transmission/:/data \
<br />

Supply your username, password, and (optional) VPN connection location.  See pia directory for possible locations.  Do not invlude the .ovpn file extension.
<br />

```
-e "vpn_user=username" \
-e "vpn_pass=password" \
-e "vpn_link=US California" \
```
<br />
At this point you can start the container by running the start_container.sh script.
<br />

### Connecting to the container
You can connect to the dr-transmission container using the included connect.sh script
<br />
<br />

### Stopping the container
You can stop the dr-transmission container using the included stop_container.sh script.  You'll need to exit the container shell first.
<br />
<br />

### Transmission WebUI
If you want to enable access to the transmission WebUI from your host network, you will need to set the following in start_container.sh
<br />
<br />

```
change
-e "webui=no" \
to
-e "webui=yes" \

add
-e "host_net=192.168.0.0/24" \
-e "gateway_ip=172.17.0.1" \
-e "gateway_dev=eth0" \
```
<br />
host_net is the network the host OS is connected to.
<br />
gateway_ip is the docker0 interfasce IP on the host.  This can likely be left at 172.17.0.1
<br />
gateway_dev is the network interface the container uses to connect to the host.  This can likely be left at eth0
<br />
<br />

### The pirate bay command line search tool  -  pirate-get
pirate-get is written by [vikstrous](https://github.com/vikstrous).  More informartion is available on the [project page](https://github.com/vikstrous/pirate-get).  The pirate-get package is included in this docker container.  It provides a quick and easy command line bridge between the pirate bay and transmission to effortlessly download whatever legal torrent files you're into.
<br />
<br />

### /usr/local/admin/transmission-command.sh script
This script is provided as a remote control for transmission.  Supported commands are as follows.
- /usr/local/admin/transmission-command.sh list:  lists status of treansmission downloads.
- /usr/local/admin/transmission-command.sh delete *torrent_ID*:  deletes a download based on ID.  See list for ID listing.
- /usr/local/admin/transmission-command.sh resume *torrent_ID*:  resumes a paused download based on ID.  See list for ID listing.
- /usr/local/admin/transmission-command.sh status:  prints server session information
