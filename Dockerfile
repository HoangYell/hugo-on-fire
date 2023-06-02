FROM node:14.18.0-alpine

LABEL maintainer="Wajahat Karim (https://wajahatkarim.com)"

# Get Hugo Version
ARG HUGO_VERSION=0.87.0

# Downloading & Installing Hugo & Firebase
RUN set -x && \
    apk add --update --upgrade --no-cache wget ca-certificates && \
    update-ca-certificates && \
    cd /tmp && \

    # Install Firebase Tools
    npm install -g firebase-tools@10.9.2

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1

    - name: hugo
      uses: klakegg/actions-hugo@1.0.0

# Start the building & deploying now
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
