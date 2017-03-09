FROM djavanargent/alpine-base-mono
MAINTAINER djavanargent

# environment settings
ENV XDG_DATA_HOME="/config" \
    XDG_CONFIG_HOME="/config"

# Install jackett
RUN \
  mkdir -p /app/sonarr && \
  curl -o /tmp/NzbDrone.master.tar.gz -L https://update.sonarr.tv/v2/master/mono/NzbDrone.master.tar.gz && \
  tar zxf /tmp/NzbDrone.master.tar.gz -C /app/sonarr --strip-components=1 && \

# cleanup
  rm -rf /tmp/*

# add local files
COPY root /

# ports and volumes
VOLUME /config /downloads /tv
EXPOSE 8989
