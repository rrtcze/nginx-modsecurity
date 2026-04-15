# Overview

This container provides nginx with modsecurity and core rule set.

It creates logs in `/var/log/nginx-modsecurity`:
```
/var/log/nginx-modesecurity/access.json 	# NGINX rich logs in JSON format
/var/log/nginx-modsecurity/modsecurity.json 	# ModSecurity logs in JSON format
```


# Usage


## 1. Create directory on host

```bash
mkdir -p /var/log/nginx-modsecurity && chmod 777 /var/log/nginx-modsecurity
```

## 2. Add nginx-modsecurity to your docker-compose.yml


```yaml
version: "3"

services:

  nginx-modsecurity:
    image: ghcr.io/rrtcze/nginx-modsecurity:main
    container_name: nginx-modsecurity
    environment:
      - PORT=80
      - SSL_PORT=443
      - SERVERNAME="CHANGE-ME.org"
      - SSL_CERT_FILE="/srv/certs/CHANGE_ME_fullchain.crt"
      - SSL_CERT_KEY_FILE="/srv/certs/CHANGE_ME_key.crt"
      - BACKEND="http://your-app:5000"
    ports:
      - 80:80
      - 443:443
    volumes:
      - /var/log/nginx-modsecurity:/var/log/nginx-modsecurity
      - /srv/certs:/srv/certs:ro

  your-app:
    ...

```

Full list of available environment variables available here:

For NGINX: https://github.com/coreruleset/modsecurity-crs-docker/blob/main/README.md#nginx-env-variables

For ModSecurity: https://github.com/coreruleset/modsecurity-crs-docker/blob/main/README.md#modsecurity-env-variables

For CoreRuleSet: https://github.com/coreruleset/modsecurity-crs-docker/blob/main/README.md#crs-specific

