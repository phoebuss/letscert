# Let's Cert
## Docker container to automate certificate creation and renewal
This container helps you create and renew Let's Encrypt certificates by fulfilling the DNS-01 challenge via an ACME DNS server.

All you need is a Docker runtime environment and a CNAME record added to your domain DNS (e.g., Cloudflare). That's it!

The default ACME DNS server is `auth.acme-dns.io`, credit to the [acme-dns][1] project. You can choose a different server by setting the `LETSCERT_SERVER` environment variable.

Please see the sample environment file, `env`, for more custom settings.

## Usage

### Build from source

```sh
# Build and run in daemon mode
# You need to provide a volume for persisting Let's Encrypt artifacts
docker run -d --rm --name letscert -v ./letsencrypt:/etc/letsencrypt $(docker build -q .)

# Initial setup
docker exec -it letscert setup
```

### Pull from registry

```sh
# Pull and run in daemon mode
docker run -d --rm --name letscert -v ./letsencrypt:/etc/letsencrypt ghcr.io/phoebuss/letscert

# Initial setup
docker exec -it letscert setup
```

### Setup with custom ACME DNS server

```sh
docker exec -it -e LETSCERT_SERVER=dns.server.you.named.it letscert setup
```

[1]: https://github.com/acme-dns/acme-dns