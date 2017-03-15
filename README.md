[Sonarr](https://sonarr.tv/) (formerly NZBdrone) is a PVR for usenet and bittorrent users. It can monitor multiple RSS feeds for new episodes of your favorite shows and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

[![sonarr](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/sonarr-banner.png)][appurl]

## Usage

```
docker run -d --name sonarr \
-p 8989:8989 \
-e PUID=<UID> -e PGID=<GID> \
-v /dev/rtc:/dev/rtc:ro \
-v /etc/localtime:/etc/localtime:ro
-v </path/to/appdata>:/config \
-v <path/to/tvseries>:/tv \
-v <path/to/downloadclient-downloads>:/downloads \
djavanargent/alpine-sonarr
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 8989` - the port sonarr webinterface
* `-v /dev/rtc:/dev/rtc:ro` - map hwclock as ReadOnly (mono throws exceptions otherwise)
* `-v /config` - database and sonarr configs
* `-v /tv` - location of TV library on disk
* `-e PGID` for for GroupID - see below for explanation
* `-e PUID` for for UserID - see below for explanation

It is based on ubuntu xenial with S6 overlay, for shell access whilst the container is running do `docker exec -it sonarr /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" <sup>TM</sup>.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application
Access the webui at `<your-ip>:8989`, for more information check out [Sonarr](https://sonarr.tv/).

## Info

* Monitor the logs of the container in realtime `docker logs -f sonarr`.
