FROM        hashicorp/terraform:0.12.10
RUN         mkdir /scripts
COPY        entrypoint.sh /scripts/entrypoint.sh
RUN         chmod +x /scripts/entrypoint.sh \
            && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
            && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
            && apk update \
            && apk add curl
VOLUME      [ "/data" ]
VOLUME      [ "/secrets" ]
VOLUME      [ "/ssh" ]
ENV         build=0.1.27
ENTRYPOINT  [ "/scripts/entrypoint.sh" ]
WORKDIR     /data
LABEL       maintainer="David Sanders" \
            org="DGSD Consulting, Inc." \
            base_image="hashicorp/terraform:0.12.10" \
            build="0.1.27"
