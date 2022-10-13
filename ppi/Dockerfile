# see https://benpetering.com/posts/2020/10/25/php-and-postgres-with-docker.html
FROM php:8.0-fpm-buster
RUN apt-get update && apt-get install --no-install-recommends -y libzip-dev zip sendmail && \
  docker-php-ext-install -j 6 zip && \
  docker-php-ext-install -j 6 mysqli  && \
  docker-php-ext-install -j 6 pdo_mysql
# see https://r.je/sendmail-php-docker
RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini && \
 sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint && \
 sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint
