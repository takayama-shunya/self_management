set :output, 'log/crontab.log'
set :environment, ENV['RAILS_ENV']

every 1.day at: '2:50 pm' do  #（JSTは+9:00なので-9:00の時間を記述）
  rake "record_task:after_save_update_flag"
end


