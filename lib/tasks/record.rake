namespace :record_task do
  desc "実施日のcontent値を保存後、0に更新"
  task :after_save_update_flag => :environment do
    #ログ
    logger = Logger.new 'log/midnight_reset.log'

    #ここから処理を書いていく

    def find_implementation_record(date)
      week_day = %w(日 月 火 水 木 金 土 日)
      dayname = week_day[date.wday] #dateを曜日数字に変換して配列から取り出す

      model = [IntegerRecord, DecimalRecord, TimeRecord, CheckRecord, CountRecord]
      today_records = []

      model.each do |m|
        today_records << m.implementation_date(dayname)
      end

      @today_records = today_records.flatten!
    
    end

    def implementation_record_save
      date = Time.zone.now
      find_implementation_record(date)

      @today_records.each do |record|
        record_date = record.record_dates.build(content: record.content)
        record_date.save
      end
    end

    def implementation_record_update
      date =  Time.zone.tomorrow
      find_implementation_record(date)

      @today_records.each do |record|
        if record.type == "TimeRecord"
          record.update(content: "00:00")
        else
          record.update(content: "0")
        end
      end
    end

    implementation_record_save
    implementation_record_update

  end
end 