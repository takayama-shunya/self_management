FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# cronインストール
RUN apt-get install -y cron
RUN apt-get update && apt-get -y install vim

WORKDIR /self_management
ADD ./Gemfile /self_management/Gemfile
ADD ./Gemfile.lock /self_management/Gemfile.lock

RUN gem install bundler:2.1.4
RUN bundle install
ADD . /self_management

RUN bundle exec whenever --update-crontab

CMD ["cron", "-f"]