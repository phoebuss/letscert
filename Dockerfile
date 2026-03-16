FROM alpine:latest

WORKDIR /app

ENV PATH=$PATH:/app

RUN apk update && apk add --no-cache su-exec tzdata certbot

COPY letscert setup auth_hook.tmpl renew-cert .

RUN chmod +x letscert setup renew-cert

ENTRYPOINT ["letscert"]

CMD ["renew-cert"]

LABEL org.opencontainers.image.source="https://github.com/phoebuss/letscert"
