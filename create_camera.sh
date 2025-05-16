#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install libcamera-tools docker.io ffmpeg -y
echo '#!/bin/bash
docker run --rm -d -p 8554:8554 aler9/rtsp-simple-server
libcamera-vid -t 0 --framerate 24 --width 1920 --height 1080 --inline --buffer-count 4 --denoise cdn_off -o - | ffmpeg -re -i - -c:v libx264 -preset ultrafast -tune zerolatency -bufsize 2M -maxrate 2M -f rtsp -rtsp_transport tcp rtsp://192.168.2.163:8554/live/stream' >> start_cam.sh
sudo tee /etc/systemd/system/start_cam.service > /dev/null <<EOF
[Unit]
Description=Start sec cam
After=network.target

[Service]
Type=simple
User=root
ExecStart=/home/pi/start_cam.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl enable start_cam.service
sudo systemctl start start_cam.service
