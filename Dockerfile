FROM alpine:latest

WORKDIR /app

ENV PATH=$PATH:/app

RUN apk update && apk add --no-cache su-exec tzdata certbot

COPY entrypoint.sh setup auth_hook.tmpl renew-cert .

RUN chmod +x entrypoint.sh setup renew-cert

ENTRYPOINT ["entrypoint.sh"]

CMD ["renew-cert"]

LABEL org.opencontainers.image.source="https://github.com/phoebuss/letscert"
