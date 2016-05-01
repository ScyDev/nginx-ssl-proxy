FROM nginx

WORKDIR /usr/src

ADD ./nginx /usr/src/

COPY ./ssl/1_hungrypeople.snaxter.ch_bundle.crt /etc/ssl/certs/docker-registry
COPY ./ssl/snaxter-startssl-free-wo-pw.key /etc/ssl/private/docker-registry

RUN chmod +x run.sh

CMD ./run.sh
