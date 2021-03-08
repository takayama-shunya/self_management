namespace :record_task do
  desc "実施日のcontent値を保存後、0に更新"
  task :after_save_update_flag => :environment do
    #ログ
    logger = Logger.new 'log/record_task.log'

    #ここから処理を書いていく

    def find_implementation_record(date)
      week_day = %w(日 月 火 水 木 金 土 日)
      dayname = week_day[date.wday] 

      model = [IntegerRecord, DecimalRecord, TimeRecord, CheckRecord, CountRecord]
      records = []

      model.each do |m|
        records << m.implementation_date(dayname)
      end

      @records = records.flatten!
    
    end

    def implementation_record_after_save_update
      today = Time.zone.now
      find_implementation_record(today)

      @records.each do |record|
        record.type == "CheckRecord" ?
          record_date = record.record_dates.build(content: "#{record.content}") :
          record_date = record.record_dates.build(content: record.content)
        record_date.save
      end

      tomorrow = Time.zone.tomorrow
      find_implementation_record(tomorrow)

      @records.each do |record|
        record.type == "TimeRecord" ?
          record.update(content: "00:00") :
          record.update(content: 0)
      end

    end

    implementation_record_after_save_update

  end
end 
