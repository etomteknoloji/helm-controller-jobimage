FROM alpine:3.8 as extract
RUN apk add -U curl ca-certificates
RUN curl https://get.helm.sh/helm-v2.16.0-linux-amd64.tar.gz | tar xvzf - --strip-components=1 -C /usr/bin

FROM alpine:3.8
RUN apk add -U --no-cache ca-certificates jq bash
COPY --from=extract /usr/bin/helm /usr/bin/tiller /usr/bin/
COPY entrypoint.sh /usr/bin/
ENTRYPOINT ["entrypoint.sh"]
