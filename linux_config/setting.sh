# Install Desktop Environment
sudo apt-get update
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils

# Add user
sudo adduser $1 --gecos "$1,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "$1:$2" | sudo chpasswd


# Installing and Configurating Xrdp 
sudo apt install xrdp 
sudo adduser $1 ssl-cert  
sudo systemctl restart xrdp

# Download and Install Ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken $3
./ngrok tcp 3389 > /dev/null &

# Showing you IP for connect
echo Link for VNC
curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url'
echo Username: ${{ github.event.inputs.uname }}

