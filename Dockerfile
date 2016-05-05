FROM ubuntu:trusty
MAINTAINER Jeremy Chang <jeremychang@qnap.com>

ENV GOLANG_VERSION 1.6.2
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 e40c36ae71756198478624ed1bb4ce17597b3c19d243f3f0899bb5740d56212a

RUN apt-get update && \
    apt-get install -y \
            apt-transport-https ca-certificates curl wget \
            gcc libc6-dev-i386 gcc-arm-linux-gnueabi gcc-mingw-w64 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz && \
    echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - && \
    tar -C /usr/local -zxvf golang.tar.gz && \
    rm golang.tar.gz

ENV GOPATH /go
ENV PATH $PATH:/bin:$GOPATH/bin:/usr/local/go/bin

RUN mkdir -p $GOPATH/src $GOPATH/bin $GOPATH/pkg

WORKDIR $GOPATH/src

ADD entry.sh /bin
ENTRYPOINT ["/bin/entry.sh"]
CMD []
