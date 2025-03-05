FROM alpine
# ENV AWS_CONTAINER_CREDENTIALS_RELATIVE_URI = "${AWS_CONTAINER_CREDENTIALS_RELATIVE_URI}"
# Install bash
RUN apk add --no-cache bash curl openssl git nodejs

# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

COPY . ./

ENTRYPOINT ["echo", "$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI"]

# ENTRYPOINT ["node", "/index.js"]
