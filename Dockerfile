# rubyのバージョンを指定
FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# cronインストール
RUN apt-get install -y cron
RUN apt-get update && apt-get -y install vim
WORKDIR /self_management
ADD Gemfile /self_management/Gemfile
ADD Gemfile.lock /self_management/Gemfile.lock
# 注意！！ Gemfile.lockにかいてあるbundlerバージョンが2.0.1以降だとエラーが出ます！
# 僕の場合はここで環境設定してあげれば通りました。
# ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler:2.1.4
RUN bundle install
ADD . /self_management

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# wheneverでcrontab書き込み
RUN bundle exec whenever --update-crontab
RUN service cron start 
# CMDが2つ以上の時はファイル分ける（CMDは1つしか実行されない）
CMD ["/startup.sh"] 

