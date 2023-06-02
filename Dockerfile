ARG HUGO_VERSION=0.87.0

FROM klakegg/hugo:${HUGO_VERSION}-ext-alpine

LABEL maintainer="Wajahat Karim (https://wajahatkarim.com)"

# Downloading & Installing Firebase Tools
RUN set -x && \
    apk add --update --upgrade --no-cache wget ca-certificates && \
    update-ca-certificates && \
    cd /tmp && \

    # Install Firebase Tools
    npm install -g firebase-tools@10.9.2

# Start the building & deploying now
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
