FROM ubuntu

ARG TZ=Europe/Madrid
ARG DWEB="/usr/local/apache2/htdocs"
ARG DWEB1="/var/www/html"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-mysql \
    php-json \
    php-common \
    php-gd \
    php-zip \
    php-cli

COPY ./web $DWEB1
RUN chown -R www-data ${DWEB1}
RUN chmod -R u+x ${DWEB1}

EXPOSE 80
CMD apachectl -DFOREGROUND