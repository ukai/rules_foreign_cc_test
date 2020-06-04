FROM ubuntu:18.04

RUN apt-get update && \
 apt-get install -y build-essential \
   golang \
   ca-certificates \
   git \
   python

RUN umask 022
RUN mkdir -p /go
ENV GOPATH=/go
RUN go get golang.org/dl/go1.14.4
ENV PATH=/go/bin:$PATH
RUN go1.14.4 download
RUN go1.14.4 get github.com/bazelbuild/bazelisk
