FROM golang:1.11.2-stretch

RUN apt-get update

RUN go get github.com/cespare/reflex

RUN CGO_ENABLED=0

ENV GO111MODULE=on