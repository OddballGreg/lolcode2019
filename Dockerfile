FROM ruby:2.6.2-alpine

RUN apk update && apk add build-base nodejs postgresql-dev tzdata less

ENV INSTALL_PATH /app/lolcode
ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

ADD Gemfile $INSTALL_PATH/Gemfile
ADD Gemfile.lock $INSTALL_PATH/Gemfile.lock

RUN cd $INSTALL_PATH && bundle install

COPY . .

RUN cd $INSTALL_PATH && rake assets:precompile
