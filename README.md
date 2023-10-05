# tuic-client-docker
Run TUIC Client in docker

TUIC: https://github.com/EAimTY/tuic

Docker Hub: https://hub.docker.com/r/kilvn/tuic-client

Docker Compose:
```yaml
version: '3'

services:
  tuic-server:
    image: kilvn/tuic-client:latest
    network_mode: host
    volumes:
      - /path/to/you/config.json:/etc/tuic/config.json
```

**只有Linux模式下才支持host网络模式，Windows和Mac只能使用bridge网络，但是bridge网络无法共享socks5端口。**

**所以：非Linux机器(Windows和Mac)只能使用supervisor在宿主机使用传统可执行文件运行，不要浪费时间！**
