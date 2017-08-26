/usr/bin/certbot certonly --webroot -w /usr/share/nginx/html -d <DOMAIN-NAME> --no-self-upgrade --noninteractive --keep-until-expiring --agree-tos --email wangweiliang61@gmail.com;
rm /etc/nginx/conf.d/letsencrypt.conf;
openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
cp /src/nginx.conf /etc/nginx/conf.d/nginx.conf;
/usr/sbin/nginx -s reload;
