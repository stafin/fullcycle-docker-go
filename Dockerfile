#build stage
FROM golang:1.13-alpine3.12 as builder
WORKDIR /app
COPY main.go .
#RUN go build -o main main.go
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o main main.go

#Run Stage
FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
CMD [ "./main" ]