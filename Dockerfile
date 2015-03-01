# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV HOME /root


RUN apt-get update -y

RUN apt-get install -y  git build-essential zip erlang rebar icu-devtools libcurl4-openssl-dev

RUN git clone https://github.com/rcouch/rcouch.git
WORKDIR /rcouch

RUN make rel USE_STATIC_ICU=1


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
