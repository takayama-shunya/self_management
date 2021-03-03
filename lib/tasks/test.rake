desc "テスト"
task :test_flag => :environment do
  #ログ
  logger = Logger.new 'log/test_flag.log'

  puts "1分　test"

end
