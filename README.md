# Use Docker to Set Up A Private Docker Registry

## Description

This private docker registry has two parts: proxy (for ssl termination) and registry (docker registry api server that handles client `push` and `pull`). 

## Setup Steps

Pre-step: Buy a domain name from a domain provider and set up an A record pointing to the IP of the machine where you are deploying the registry. Note that the IP should be publicly accessible. After that, follow the steps below.

1) Change the cloud storage environment variables in docker-compose.yml. The current setup uses aliyun OSS as an example for image storage. Note that different providers would need different environment variables. Please reference https://github.com/docker/docker-registry#storage-options for more details. 
2) Change <DOMAIN-NAME> in all script files under `/src` folder to your own domain name.
3) Run `docker-compose build --build-arg username=<USERNAME> --build-arg password=<PASSWORD> registry`. Replace the username and password in the command. 
4) Run `docker-compose up -d`.
5) Docker into the proxy container by running `docker exec -it <YOUR-PROXY-CONTAINER-ID> /bin/bash`
6) In the proxy container, run 
```
cd /src
chmod +x get-ssl-cert.sh
./get-ssl-cert.sh
```
Wait for one or two minutes, the ssl cert should be configured correctly.

7) Now from any other machine having docker installed, run `docker login <YOUR-DOMAIN-NAME>`. Now it will ask for your username and password used in step 3. After that you should be able to log into your registry.
