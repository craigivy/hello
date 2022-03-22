FROM golang:alpine as builder

RUN apk add --no-cache git

WORKDIR /app 

# COPY go.mod .
# COPY go.sum .
# RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" .

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello /usr/bin/

EXPOSE 8080

ENTRYPOINT ["hello"]