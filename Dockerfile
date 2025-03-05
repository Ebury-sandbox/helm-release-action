FROM alpine

# Install bash
RUN apk add --no-cache bash curl openssl git nodejs

# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

COPY . ./

RUN --mount=type=secret,id=awscli,env=AWS_CONTAINER_CREDENTIALS_RELATIVE_URI \
    aws sts get-caller-identity

ENTRYPOINT ["node", "/index.js"]
