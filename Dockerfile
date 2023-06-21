FROM golang:1.20.3-alpine3.17 AS builder

WORKDIR /app

COPY go.mod .
RUN go mod download

COPY . .
RUN go build -o app .


FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

CMD ["/app/app"]