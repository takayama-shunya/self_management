# rubyのバージョンを指定
FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# cronインストール
RUN apt-get install -y cron
WORKDIR /self_management
ADD Gemfile /self_management/Gemfile
ADD Gemfile.lock /self_management/Gemfile.lock
# 注意！！ Gemfile.lockにかいてあるbundlerバージョンが2.0.1以降だとエラーが出ます！
# 僕の場合はここで環境設定してあげれば通りました。
# ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler:2.1.4
RUN bundle install
COPY . /self_management

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

# wheneverでcrontab書き込み
RUN bundle exec whenever --update-crontab 
# cronをフォアグラウンド実行
CMD ["cron", "-f"] 
