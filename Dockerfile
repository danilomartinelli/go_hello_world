FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o main ./main.go

FROM alpine:latest

COPY --from=builder /app/main /bin

CMD main
