FROM golang:latest AS build-env

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /docker-g


FROM alpine:latest

WORKDIR /app

COPY --from=build /docker-g /docker-g

EXPOSE 8080

ENTRYPOINT ["/docker-gs-ping"]
