sudo apt update
sudo apt upgrade
sudo apt --no-install-recommends install ca-certificates curl pip python3 python3-dev libcurl4-openssl-dev gcc libssl-dev libcamera-tools libcamera-v4l2 libcamera-apps v4l-utils motion -y
curl -sSfO 'https://bootstrap.pypa.io/get-pip.py'
sudo python3 get-pip.py
rm get-pip.py
grep -q '\[global\]' /etc/pip.conf 2> /dev/null || printf '%b' '[global]\n' | sudo tee -a /etc/pip.conf > /dev/null
sudo sed -i '/^\[global\]/a\break-system-packages=true' /etc/pip.conf
sudo python3 -m pip install --pre motioneye
sudo motioneye_init
#edit systemd service from to ExecStart=/usr/bin/libcamerify /usr/local/bin/meyectl startserver -c /etc/motioneye/motioneye.conf
