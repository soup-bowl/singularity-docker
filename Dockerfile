FROM docker.io/library/ubuntu:16.04 AS build

RUN apt-get update && \
	apt-get install -y \
	python3 \
	python3-pip \
 	libc6-dev \
	libstdc++6 \
	libx11-dev \
	libxrender-dev \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	zlib1g-dev \
	libssl-dev \
	libogg-dev \
	libpng12-dev \
	libdbus-glib-1-dev \
	libgtk2.0-dev \
	libopenal-dev \
	libvorbis-dev \
	libalut-dev \
	libapr1-dev \
	libaprutil1-dev \
	libboost-dev \
	libc-ares-dev \
	libxmlrpc-epi-dev \
	libopenjpeg-dev \
	libjpeg62-dev \
	libgtk2.0-dev \
	libsdl1.2-dev \
	libgstreamer0.10-dev \
	libgstreamer-plugins-base0.10-dev \
	google-mock && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN pip install "git+https://git.alchemyviewer.org/alchemy/autobuild"

# FROM ghcr.io/linuxserver/baseimage-selkies:ubuntunoble

# ARG VERSION=1.8.9.8338
# ARG PLAT=x86_64

# RUN apt-get update && \
# 	apt-get install -y \
#  	libgtk2.0-0 \
#  	gamemode \
# 	libatk1.0-0 \
# 	libvorbisfile3 \
# 	xz-utils && \
# 	apt-get clean && \
# 	rm -rf /var/lib/apt/lists/*

# RUN VERSION2=$(echo $VERSION | tr '.' '_') && \
#     curl -L -o /tmp/viewer.tar.xz \
#     https://github.com/singularity-viewer/SingularityViewer/releases/download/sv-${VERSION}-release/Singularity_${VERSION2}_${PLAT}.tar.xz && \
# 	mkdir -p /opt/viewer-install && \
# 	tar -xJf /tmp/viewer.tar.xz -C /opt/viewer-install --strip-components=1

# COPY /root /
# COPY branding /etc/s6-overlay/s6-rc.d/init-adduser/branding

# ENV TITLE="Singularity Viewer" \
# 	NO_DECOR="true"

# EXPOSE 3000

# VOLUME /config
