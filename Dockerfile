FROM ubuntu:20.04

LABEL Description="NS3"

ENV DEBIAN_FRONTEND noninteractive
ARG NS3="3.36.1"

RUN apt-get update && \
    apt-get install -y \
    wget \
    git \
    cmake \
    gcc \
    g++ \
    python \
    python3 \
    python3-dev \
    python3-setuptools \
    mercurial \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr
RUN wget -P /usr https://www.nsnam.org/releases/ns-allinone-${NS3}.tar.bz2 \
    && tar xjf ns-allinone-${NS3}.tar.bz2 \
    && rm ns-allinone-${NS3}.tar.bz2

RUN /usr/ns-allinone-${NS3}/ns-${NS3}/ns3 configure --enable-examples --enable-tests --enable-python-bindings \
    && /usr/ns-allinone-${NS3}/ns-${NS3}/ns3 build

RUN ln -s /usr/ns-allinone-3.36.1/ns-3.36.1/ /usr/ns3

WORKDIR /usr/ns3