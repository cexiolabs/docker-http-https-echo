FROM node:9.2-alpine

WORKDIR /app

COPY . .

ENV HTTP_PORT=80 HTTPS_PORT=443 SSL_CERT_FILE=/app/fullchain.pem SSL_KEY_FILE=/app/privkey.pem

RUN npm install --production

RUN apk --no-cache add openssl && sh generate-cert.sh && rm -rf /var/cache/apk/*

ENTRYPOINT ["node", "./index.js"]
CMD []
