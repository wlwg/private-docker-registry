# docker-registry

This repository shows how to manually set up a private docker registry.

## Description

This private docker registry has two parts: proxy (for ssl termination) and registry (docker registry api server that handles client `push` and `pull`). The registry uses aliyun OSS as an example for image storage. More storage config can be found at https://github.com/docker/docker-registry#storage-options.

## Setup Steps

1) Fill in the storage environment variables in docker-compose.yml
2) `docker-compose build --build-arg username=<USERNAME> --build-arg password=<PASSWORD> registry`
3) `docker-compose up -d`
4) Docker into the proxy container: `docker exec -it <PROXY-CONTAINER-ID> /bin/bash`
5) In the proxy container, run `cd /src && chmod +x get-ssl-cert.sh && ./get-ssl-cert.sh`
