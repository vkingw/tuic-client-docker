# tuic-client-docker
Run TUIC Client in docker

TUIC: https://github.com/EAimTY/tuic

Docker Hub: https://hub.docker.com/r/kilvn/tuic-client

Docker Compose:
```yaml
version: '3'

services:
  tuic-server:
    image: kilvn/tuic-client:{{ tag }}
    network_mode: {{ network mode }}
    volumes:
      - /path/to/you/config.json:/etc/tuic/config.json
```
