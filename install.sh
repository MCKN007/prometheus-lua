ecoh "开始安装程序依赖库文件"
apt update 
apt install lua5.3
apt install lua-filesystem
mkdir /usr/prometheus-lua-app
cp ./* /usr/prometheus-lua-app/
rm -rf /usr/prometheus-lua-app/install.sh
dpkg -i /usr/prometheus-lua-app/deb/*
apt install libnfc-dev libnfc-examples mfoc mfcuk bless
cp /usr/prometheus-lua-app/deb/libnfc.conf /etc/nfc

