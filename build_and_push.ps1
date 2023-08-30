docker build -f "./dockerfile.alpine" . `
    -t "luminodiode/shadowsocks-libev:alpine" `
    -t "luminodiode/shadowsocks-libev:latest";

docker build -f "./dockerfile.ubuntu" . `
    -t "luminodiode/shadowsocks-libev:ubuntu";

docker push "luminodiode/shadowsocks-libev:alpine";
docker push "luminodiode/shadowsocks-libev:latest";
docker push "luminodiode/shadowsocks-libev:ubuntu";

pause;