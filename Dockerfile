FROM golang:latest AS builder

WORKDIR /app

ADD . /app 


COPY main.go /app

RUN go build -o hello 


# FROM alpine:latest

# WORKDIR /app-01

# COPY --from=builder /app/hello /app-01

EXPOSE 8080

CMD ["./hello"]
