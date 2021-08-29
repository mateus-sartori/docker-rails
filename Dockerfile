FROM ruby:2.7.0-slim-buster

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y mariadb-server default-libmysqlclient-dev


RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:2.2.26
RUN bundle install 

ADD . /app

