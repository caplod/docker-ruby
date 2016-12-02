FROM ruby:2.3

RUN apt-get update -qq && \
  apt-get -yq install \
  imagemagick \
  nodejs && \
  rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV APP_ROOT /srv
ENV GEM_HOME /var/cache/bundle_cache
ENV BUNDLE_PATH /var/cache/bundle_cache

RUN chmod a+w $APP_ROOT

EXPOSE 3000

VOLUME $APP_ROOT

COPY start-rails.sh /

WORKDIR $APP_ROOT

CMD /start-rails.sh
