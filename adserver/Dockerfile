FROM nginx:alpine

WORKDIR /data/www/

ENV REVIVE_VERSION=4.2.1

RUN apk --update upgrade && apk update && apk add curl ca-certificates && update-ca-certificates --fresh && apk add openssl

RUN apk --update add \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        gzip \
        php7 \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo \
        php7-pdo_mysql \
        php7-posix \
        php7-session \
        php7-xml \
        php7-iconv \
        php7-phar \
        php7-openssl \
        php7-zlib \
        php7-zip \
        php7-memcached \
    && rm -rf /var/cache/apk/*

RUN addgroup -S  www &&  adduser -D -h /data/www -S www -G www

RUN wget -qO- https://download.revive-adserver.com/revive-adserver-$REVIVE_VERSION.tar.gz | tar xz --strip 1 \
    && chown -R www:www . \
    && chmod -R a+w /data/www/var \
    && chmod -R a+w /data/www/plugins \
    && chmod -R a+w /data/www/www/admin/plugins \
    && chmod -R a+w /data/www/www/images \
    && rm -rf /var/cache/apk/*

COPY plugins/vast-converter /data/www/plugins/vast-converter

COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD php-fpm7 && nginx -g 'daemon off;'
