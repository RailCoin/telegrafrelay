FROM golang:1.10 as builder

ENV TELEGRAF_CLOUDWATCH_REGION="us-east-1"
ENV TELEGRAF_CLOUDWATCH_NAMESPACE="telegraf/cloudwatch"

RUN go get -u github.com/golang/dep/cmd/dep

WORKDIR /go/src/github.com/influxdata
RUN git clone https://github.com/steemit/telegraf && \
  cd telegraf && \
  make

FROM phusion/baseimage

WORKDIR /app
COPY --from=builder /go/src/github.com/influxdata/telegraf/telegraf /app/
COPY telegraf.conf /etc/telegraf/
CMD ["/app/telegraf"]
EXPOSE 8125
