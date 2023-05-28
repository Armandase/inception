#! /bin/sh

#Create certificate for https connection
mkdir -p ${CERTS}
touch ${CERTS}default.key ${CERTS}default.crt && \
openssl req -x509 -nodes -days 365 \
        -subj "/C=FR/ST=PARIS/O=42/CN=adamiens.42.fr" \
        -newkey rsa:2048 -keyout ${CERTS}default.key \
        -out ${CERTS}default.crt 2>/dev/null;
sed -i "s|CERTS|${CERTS}|g" /etc/nginx/http.d/default.conf
sed -i "s|CERTS|${CERTS}|g" /etc/nginx/http.d/default.conf

#disable daemon for nginx (run in the foreground)
exec nginx -g "daemon off;"
