echo "entrypoint.sh started.";

if ! test -e "/etc/shadowsocks-libev/config.json"; then

    echo "Shadowsocks configuration file not detected. Generating...";

    envsubst < /etc/shadowsocks-libev/pre_config.json \
        | tee /etc/shadowsocks-libev/config.json;

    echo "";
fi

echo "Spinning up the Shadowsocks service...";
ss-server; 

tail -f /dev/null