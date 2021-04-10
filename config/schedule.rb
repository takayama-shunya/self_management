# Rails.rootを使用するために必要。なぜなら、wheneverは読み込まれるときにrailsを起動する必要がある
require File.expand_path(File.dirname(__FILE__) + "/environment")
ENV.each { |k, v| env(k, v) }
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env

# cronのログの吐き出し場所。ここでエラー内容を確認する
set :output, "#{Rails.root}/log/cron.log"




# env :PATH, ENV['PATH'] # 絶対パスから相対パス指定
# set :environment, :development # 環境を設定
# set :output, 'log/cron.log' # ログの出力先ファイルを設定
# rails_env = ENV['RAILS_ENV'] || :development
# set :environment, rails_env
def local(time)
  Time.zone = 'Asia/Tokyo'
  Time.zone.parse(time).localtime($system_utc_offset)
end

every 1.day, at: local('11:50 pm') do
  rake "record_task:after_save_update_flag"
end

# every 1.hours do
#   rake "record_task:after_save_update_flag"
# end


# every 1.hours do
#   rake "test_flag"
# end

# every 1.minutes do
#   rake "test_flag"
# end
