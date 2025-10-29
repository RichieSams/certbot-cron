FROM infinityofspace/certbot_dns_porkbun:v0.11.0

RUN apk add --no-cache curl bash

# Add supercronic
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.38/supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=bc072eba2ae083849d5f86c6bd1f345f6ed902d0 \
    SUPERCRONIC=supercronic-linux-amd64
RUN curl -fsSLO "$SUPERCRONIC_URL" \
    && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
    && chmod +x "$SUPERCRONIC" \
    && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
    && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

ENTRYPOINT [ "/usr/local/bin/supercronic" ]
