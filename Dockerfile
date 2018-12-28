FROM linuxserver/plex

RUN \
	apt-get update && \
	apt-get install -y \
		ffmpeg \
		handbrake-cli \
		autoconf \
		libtool \
		git \
		build-essential \
		libargtable2-dev \
		libavformat-dev \
		libsd1.2-dev
	git clone git://github.com/erikkaashoek/Comskip /postproc/Comskip/
	
COPY root/ /

RUN \
	cd /postproc/Comskip/ \
	./autogen.sh \
	./configure \
	make \
	chmod 777 /postproc/postprocess.sh \