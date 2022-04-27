# Use alpine latest as base
FROM alpine:latest

# Set container timezone to UTC
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Update packages
RUN apk update

# Install dev/build tools ( so that python pip can build awscli )
RUN apk add --no-cache --virtual .build-deps
RUN apk add make

# Install bash shell
RUN apk add bash

# Install nmap ( the port scanner we're going to use to scan things )
RUN apk add nmap

# Install python3 and python pip ( python package manager )
RUN apk add --update python3 py3-pip

# Install awscli via python pip
RUN pip install awscli
RUN rm /var/cache/apk/*

# Copy script files over to container
RUN mkdir -p /usr/local/bin
COPY ./scripts/retrieve_scan_targets /usr/local/bin/retrieve_scan_targets
COPY ./scripts/run_nmap_scans /usr/local/bin/run_nmap_scans
COPY ./scripts/runcmd /usr/local/bin/runcmd

# Run script file ( runcmd )
CMD /usr/local/bin/runcmd

