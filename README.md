# Let's Cert
## Docker container to automate certificate creation / renewal
This container will help you to create and renew Let's Encrypt certificate with
fulfilling DNS-01 challenge via ACME DNS server.

All you need are only docker runtime environment, adding a CNAME record on the DNS
of your domain (e.g. Cloudflare) and,,, THAT'S IT!

The default ACME DNS server is `auth.acme-dns.io`, credit to the [acme-dns][1]
project. You may pick your choice of server via setting the env `LETSCERT_SERVER`.

Please see the sample environment file, `env`, for more custom setting.

## Usage
### Build from source
```
# build and run in daemon mode
# need to provide volume for persisting Let's Encrypt artifacts
docker run -d --rm --name letscert -v ./letsencrypt:/etc/letsencrypt $(docker build -q .)

# initial setup
docker exec -it letscert setup
```

### Pull from registry
```
# pull and run in daemon mode
docker run -d --rm --name letscert -v ./letsencrypt:/etc/letsencrypt ghcr.io/phoebuss/letscert

# initial setup
docker exec -it letscert setup
```

### Setup with custom ACME DNS server
```
docker exec -it -e LETSCERT_SERVER=dns.server.you.named.it letscert setup
```
[1]: https://github.com/acme-dns/acme-dns
