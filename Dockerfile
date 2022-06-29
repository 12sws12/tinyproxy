FROM ubuntu:20.04
RUN apt update && apt install -y nano ncdu git automake build-essential && apt clean && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/tinyproxy/tinyproxy.git
WORKDIR ./tinyproxy
RUN ./autogen.sh
RUN ./configure
RUN make
RUN make install
ENTRYPOINT ["/usr/local/bin/tinyproxy", "-d", "-c", "/etc/tinyproxy/tinyproxy.conf"]

