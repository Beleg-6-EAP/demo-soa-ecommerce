FROM ruby:3.1.4

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y nodejs yarn && \
    gem install foreman

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN rails db:prepare

COPY Procfile /app/Procfile

RUN rm -f /app/tmp/pids/server.pid

CMD foreman start

