FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev wget default-jre
RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i es_ES -c -f UTF-8 -A /usr/share/locale/locale.alias es_ES.UTF-8
ENV LANG es_ES.utf8

RUN wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
RUN unzip platform-tools-latest-linux.zip -d /root
RUN rm platform-tools-latest-linux.zip
COPY profile /root/.profile

RUN mkdir -p /root/bin
RUN mkdir -p /root/android/lineage
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /root/bin/repo
RUN chmod a+x /root/bin/repo
