FROM golang:1.7-alpine as builder
COPY . /app

ENV GO111MODULE=off
WORKDIR /app
RUN go build -ldflags "-s -w" -o full-cycle-go-challenge -a ./main.go

FROM scratch

COPY --from=builder /app/full-cycle-go-challenge /usr/local/bin/full-cycle-go-challenge
ENTRYPOINT ["/usr/local/bin/full-cycle-go-challenge"]