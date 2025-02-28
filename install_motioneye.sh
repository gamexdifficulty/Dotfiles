pip install --upgrade motioneye
pip3 install --upgrade motioneye
python3 -m pip install --upgrade motioneye
python3 -m pip3 install --upgrade motioneye
sudo apt update
sudo apt --no-install-recommends install ca-certificates curl python3 python3-distutils
sudo apt update
sudo apt --no-install-recommends install ca-certificates curl python3 python3-dev libcurl4-openssl-dev gcc libssl-dev
curl -sSfO 'https://bootstrap.pypa.io/get-pip.py'
sudo python3 get-pip.py
rm get-pip.py
grep -q '\[global\]' /etc/pip.conf 2> /dev/null || printf '%b' '[global]\n' | sudo tee -a /etc/pip.conf > /dev/null
sudo sed -i '/^\[global\]/a\break-system-packages=true' /etc/pip.conf
sudo python3 -m pip install --pre motioneye
sudo motioneye_init
sudo apt install pip
sudo python3 -m pip install --pre motioneye
sudo motioneye_init
