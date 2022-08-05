FROM ruby:2.7.1

ENV LANG C.UTF-8

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash \
 && apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/* \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

RUN mkdir /projeto
WORKDIR /projeto

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json *yarn* ./
RUN yarn install --ignore-optional
RUN yarn install --check-files

COPY . .