FROM php:7.2-apache
# Alternative: httpd:2.4-alpine

# TODO: Configure HTTPS (will have to wait until we change the
# CNAME record for www.linux-ag.uni-tuebingen.de from 134.2.2.45 to
# 134.2.220.61).

# TODO: HTTP security headers

ENV PICO_VERSION 2.0.4

# Install the Pico CMS:
RUN cd /var/www/html \
  && curl -LO https://github.com/picocms/Pico/releases/download/v${PICO_VERSION}/pico-release-v${PICO_VERSION}.tar.gz \
  && tar -xf pico-release-v${PICO_VERSION}.tar.gz \
  && rm pico-release-v${PICO_VERSION}.tar.gz

# Apply our custom patches
COPY Customize-Pico.patch /var/www/html/
RUN cd /var/www/html \
  && mv config/config.yml.template config/config.yml \
  && patch -p1 < Customize-Pico.patch \
  && rm Customize-Pico.patch

# Update the Apache configuration
COPY linux-ag.conf /etc/apache2/sites-available/
RUN a2enmod ssl && a2enmod rewrite && a2dissite 000-default && a2ensite linux-ag

# Replace the content:
RUN cd /var/www/html \
  && rm -r content \
  && ln -s /var/www/website content \
  && ln -s /var/www/presentation presentation
