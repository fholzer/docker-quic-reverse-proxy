FROM alpine:3.4
MAINTAINER Server Team "se@devsisters.com"

EXPOSE 8080
EXPOSE 8080/udp

WORKDIR /usr/goquic

RUN mkdir -p /go/src/github.com/devsisters && \
	cd /go/src/github.com/devsisters && \
	apk add --no-cache --virtual build-deps g++ go cmake ninja perl linux-headers make git coreutils && \
	git config --global submodule.libquic.shallow true && \
	git clone --depth 1 --recursive -b fix-build https://github.com/fholzer/goquic.git goquic && \
	cd goquic && \
	./build_libs.sh -a -r && \
	GOPATH=/go go build /go/src/github.com/devsisters/goquic/example/reverse_proxy.go && \
	cp reverse_proxy /usr/goquic && \
	cd /usr/goquic && \
	rm -rf /go && \
	apk del build-deps 

RUN apk add --no-cache libstdc++ libgcc

ENTRYPOINT ["/usr/goquic/reverse_proxy"]
CMD ["--help"]
