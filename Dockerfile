FROM ruby:2.2.2-onbuild
MAINTAINER Glenn Goodrich <glenn.goodrich@skookum.com>

EXPOSE 3000
WORKDIR /tmp
COPY Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /usr/src/app
WORKDIR  /usr/src/app

RUN rm .env

CMD ["foreman", "start", "-p", "3000"]
