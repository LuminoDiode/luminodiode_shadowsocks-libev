## luminodiode_shadowsocks-libev

### Super-easy to start dockerized ss-server.

### Minimal config for '33333' port to listen:
    version: '3.9'

    services:
      ss_server:
        restart: always
        image: luminodiode/shadowsocks-libev:alpine
        environment:
          # default values provided below ↓↓↓, feel free to change some
          - password=shadowsocks
          - ipv4addr=172.27.1.1
          #- mode=tcp_only
          #- server_port=8388
          #- local_port=1080
          #- timeout=86400
          #- method=chacha20-ietf-poly1305 # also you can try aes-128-gcm
          #- fast_open=true
          #- workers=1
        ports:
          - 33333:8388/tcp
        networks:
          static_network:
            ipv4_address: 172.27.1.1
            # uncomment for ipv6 support ↓↓↓
            #ipv6_address: fd61:1e4c:f28c:466f:2727:2727:0001:0001

    # if you encounter one of the next error:
    # ERROR: getpeername: Socket not connected shadowsocks
    # ERROR: connect: Address not available
    # then try to disable IPv6 on your client

    # uncomment those two for ipv6 support ↓↓↓
    networks:
      static_network:
        #enable_ipv6: true
        ipam:
          config:
            #- subnet: fd61:1e4c:f28c:466f:2727:2727::/32
            - subnet: 172.27.0.0/16
