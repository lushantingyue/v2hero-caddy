cd /usr/bin/v2ray
wget -O v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip 
unzip v2ray.zip 
mv /usr/bin/v2ray/v2ray-v$VER-linux-64/v2ray /usr/bin/v2ray/ 
mv /usr/bin/v2ray/v2ray-v$VER-linux-64/v2ctl /usr/bin/v2ray/ 
mv /usr/bin/v2ray/v2ray-v$VER-linux-64/geoip.dat  /usr/bin/v2ray/ 
mv /usr/bin/v2ray/v2ray-v$VER-linux-64/geosite.dat /usr/bin/v2ray/ 
chmod +x /usr/bin/v2ray/v2ray 
chmod +x /usr/bin/v2ray/v2ctl
chgrp -R 0 /usr/bin/v2ray/ 
chmod -R g+rwX /usr/bin/v2ray/ 
rm -rf v2ray.zip 
rm -rf v2ray-v$VER-linux-64 

echo -e "$CONFIG_JSON" > config.json
if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$CERT_PEM" > cert.pem
  echo -e "$KEY_PEM"  > key.pem
fi
./v2ray
