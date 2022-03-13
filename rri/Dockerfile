# see https://benpetering.com/posts/2020/10/25/php-and-postgres-with-docker.html
FROM php:7-fpm-buster
RUN apt-get update && apt-get install --no-install-recommends -y libpq-dev libzip-dev zip sendmail && \
 docker-php-ext-install -j "$(nproc)" pdo pgsql pdo_pgsql && \
 docker-php-ext-install -j "$(nproc)" zip
RUN ln -s /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && \
 sed -i -e 's/;extension=pgsql/extension=pgsql/' /usr/local/etc/php/php.ini && \
 sed -i -e 's/;extension=pdo_pgsql/extension=pdo_pgsql/' /usr/local/etc/php/php.ini
# see https://r.je/sendmail-php-docker
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini && \
 sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint && \
 sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint
