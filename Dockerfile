FROM ruby:2.3

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -qq -y \
  build-essential \
  imagemagick \
  postgresql-client \
  mysql-client \
  nodejs \
  yarn \
  --fix-missing --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV APP_ROOT /srv

RUN chmod a+w $APP_ROOT

EXPOSE 3000

VOLUME $APP_ROOT

WORKDIR $APP_ROOT

CMD [ "/bin/bash" ]
