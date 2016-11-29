FROM ruby:2.3

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install \
  nodejs && \
  rm -rf /var/lib/apt/lists/*

ENV GEM_HOME /var/cache/bundle_cache
ENV BUNDLE_PATH /var/cache/bundle_cache

EXPOSE 3000
VOLUME /srv

COPY start-rails.sh /

WORKDIR /srv

CMD /start-rails.sh
