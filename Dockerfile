FROM ruby:2.5
RUN mkdir /namejp
WORKDIR /namejp
COPY Gemfile /namejp/Gemfile
COPY Gemfile.lock /namejp/Gemfile.lock
RUN bundle install
