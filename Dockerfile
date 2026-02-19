FROM alpine:latest

WORKDIR /app

ENV PATH=$PATH:/app

RUN apk update && apk add tzdata certbot

COPY setup auth_hook.tmpl renew-cert .

RUN chmod +x setup renew-cert

ENTRYPOINT ["tail", "-f", "/dev/null"]
