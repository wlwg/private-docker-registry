# docker-registry

This repository shows how to manually set up a private docker registry.

## Description

This private docker registry has two parts: proxy (for ssl termination) and registry (docker registry api server that handles client `push` and `pull`). The registry uses aliyun OSS as an example for image storage. More storage config can be found at https://github.com/docker/docker-registry#storage-options.

## Setup Steps

1) Change the storage environment variables in docker-compose.yml
2) Change <DOMAIN-NAME> in all script files under `/src` folder to your own domain name
3) `docker-compose build --build-arg username=<USERNAME> --build-arg password=<PASSWORD> registry`
4) `docker-compose up -d`
5) Docker into the proxy container: `docker exec -it <YOUR-PROXY-CONTAINER-ID> /bin/bash`
6) In the proxy container, run `cd /src && chmod +x get-ssl-cert.sh && ./get-ssl-cert.sh`
