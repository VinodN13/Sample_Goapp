FROM golang:latest AS builder

WORKDIR /app

ADD . /app 


COPY main.go /app

RUN go build -o hello 


FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/hello /app

EXPOSE 8080

ENTRYPOINT ["./hello"]
