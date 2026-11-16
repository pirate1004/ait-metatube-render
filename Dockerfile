FROM golang:alpine AS builder
RUN apk add --no-cache git make
WORKDIR /src
RUN git clone https://github.com/metatube-community/metatube-sdk-go.git . \
    && git checkout 59ac7f294e9c5b7fac400c5adbc3777a36cff5a4 \
    && sed -i '/import (/a\    _ "github.com/metatube-community/metatube-sdk-go/provider/avbase"' engine/register.go \
    && make server
FROM alpine:latest
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder /src/build/metatube-server /metatube-server
ENV GIN_MODE=release PORT=10000
EXPOSE 10000
ENTRYPOINT ["/metatube-server"]
