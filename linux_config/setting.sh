#Install Sudo
sudo apt-get update

#Opening the system VNC
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils > /dev/null 2>&1
        
#Creating User to Login
sudo useradd -m ${{ github.event.inputs.uname }} && sudo adduser ${{ github.event.inputs.uname }} sudo && echo '${{ github.event.inputs.uname }}:${{ github.event.inputs.pword }}' | sudo chpasswd

# Installing and Configurating Xrdp 
sudo apt install xrdp && sudo adduser ${{ github.event.inputs.uname }} ssl-cert && sudo systemctl restart xrdp

#Download and Install Ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && unzip ngrok-stable-linux-amd64.zip
