FROM golang:stretch
WORKDIR /rclone
RUN git clone https://github.com/ncw/rclone.git .
RUN go build
VOLUME /rclone
# ENTRYPOINT ["./rclone","version"]
COPY ./entrypoint.sh /bin/entrypoint
ENTRYPOINT ["entrypoint"]
