FROM golang:latest AS build-env

WORKDIR /app
ENV SRC_DIR=/go/src/Go-webapp/
ADD . $SRC_DIR
RUN cd $SRC_DIR; go get -v -t -d ./... && \
    go build -o Go-webapp; cp Go-webapp /app/

FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache libc6-compat bash
COPY --from=build-env /Go-webapp /app/
ENTRYPOINT ["./Go-webapp"]
