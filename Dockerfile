
FROM ruby:2.5.8

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
                       vim \
                       imagemagick


RUN mkdir /myapp 


ENV APP_ROOT /myapp 
WORKDIR $APP_ROOT



ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock


RUN bundle install
ADD . $APP_ROOT