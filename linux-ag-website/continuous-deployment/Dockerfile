FROM debian:buster

RUN apt-get update && apt-get install -y git

COPY deploy.sh /usr/local/bin/

CMD ["deploy.sh"]
