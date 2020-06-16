FROM ubuntu:20.04
MAINTAINER Sasha Gerrand <github+docker-glibc-builder@sgerrand.com>
ENV PREFIX_DIR /usr/glibc-compat
ENV GLIBC_VERSION 2.31
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -q update \
	&& apt-get -qy install \
		bison \
		build-essential \
		gawk \
		gettext \
		openssl \
		python3 \
		texinfo \
		wget
COPY configparams /glibc-build/configparams
COPY builder /builder
ENTRYPOINT ["/builder"]
