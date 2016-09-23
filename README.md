# What is this?
This is a QUIC reverse proxy server written in go, based on alpine linux.

QUIC is an experimental protocol aimed at reducing web latency over that of TCP. On the surface, QUIC is very similar to TCP+TLS+SPDY implemented on UDP. Because TCP is implement in operating system kernels, and middlebox firmware, making significant changes to TCP is next to impossible. However, since QUIC is built on top of UDP, it suffers from no such limitations.

For more details, see https://github.com/devsisters/goquic/blob/master/README.md

# Why another image?
This image is size-optimized. It uses about 300MB less disk space than the original author's image.
