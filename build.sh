#!/bin/bash

dockerfile="
	FROM golang:stretch\n
	WORKDIR /build\n
	RUN mkdir /rclone\n
	RUN git clone https://github.com/ncw/rclone.git .\n
	RUN go build -o /rclone/rclone\n
	RUN /rclone/rclone version\n
	ENTRYPOINT ["/rclone/rclone version"]"

tag="rclone-builder:latest"
echo -e $dockerfile | docker build -t $tag -

# tmpdir=$(mktemp -d)

# docker run -v $tmpdir:/rclone -it rclone-builder:latest /bin/bash

echo $tmpdir
ls $tmpdir
