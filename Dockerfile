FROM golang:1-alpine AS go-layer

WORKDIR /usr/app

COPY . .

RUN go build -o hello .

# -------

FROM hello-world

WORKDIR /usr/app

COPY --from=go-layer /usr/app/hello .

CMD [ "./hello" ]
