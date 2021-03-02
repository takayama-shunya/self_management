set :output, 'log/crontab.log'
set :environment, ENV['RAILS_ENV']

every 1.day  at: '11:50 pm' do
  rake "rails record_task:after_save_update_flag "
end