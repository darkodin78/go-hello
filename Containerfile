#----Stage 1: building the application----
FROM golang:1.22 AS builder 
WORKDIR /app 
COPY . . 
RUN go build -o myapp main.go

#----Stage 2: Serve the application ----
FROM alpine:latest
COPY --from=builder /app/myapp /usr/local/bin/myapp
CMD /usr/local/bin/myapp


# here is where we can commit via command while not in visual studio(just in case)
# git commit -m "adding files" the quotes names it, then hit enter in the terminal
