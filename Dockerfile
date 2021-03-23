# rubyのバージョンを指定
FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
# 注意！！ Gemfile.lockにかいてあるbundlerバージョンが2.0.1以降だとエラーが出ます！
# 僕の場合はここで環境設定してあげれば通りました。
ENV BUNDLER_VERSION 2.1.4
RUN bundle install
COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]