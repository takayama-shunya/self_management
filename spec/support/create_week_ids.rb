module CreateWeekIds
  def week_ids

    # sun = FactoryBot.find_or_create(:week_1, dayname: FactoryBot.build(:week_1).dayname) 
    # mon = FactoryBot.find_or_create(:week_2, dayname: FactoryBot.build(:week_2).dayname) 
    # tue = FactoryBot.find_or_create(:week_3, dayname: FactoryBot.build(:week_3).dayname) 
    # wed = FactoryBot.find_or_create(:week_4, dayname: FactoryBot.build(:week_4).dayname) 
    # thurs = FactoryBot.find_or_create(:week_5, dayname: FactoryBot.build(:week_5).dayname) 
    # fri = FactoryBot.find_or_create(:week_6, dayname: FactoryBot.build(:week_6).dayname) 
    # sat = FactoryBot.find_or_create(:week_7, dayname: FactoryBot.build(:week_7).dayname) 
    sun = find_or_create_by_name(:week_1, FactoryBot.build(:week_1).dayname) 
    mon = find_or_create_by_name(:week_2, FactoryBot.build(:week_2).dayname) 
    tue = find_or_create_by_name(:week_3, FactoryBot.build(:week_3).dayname) 
    wed = find_or_create_by_name(:week_4, FactoryBot.build(:week_4).dayname) 
    thurs = find_or_create_by_name(:week_5, FactoryBot.build(:week_5).dayname) 
    fri = find_or_create_by_name(:week_6, FactoryBot.build(:week_6).dayname) 
    sat = find_or_create_by_name(:week_7, FactoryBot.build(:week_7).dayname) 
    weeks = [ sun.id, mon.id, tue.id, wed.id, thurs.id, fri.id, sat.id]
  end

  def find_or_create_by_name(name, dayname)
    Week.find_by(dayname: dayname) || FactoryBot.create(name)
  end
end

RSpec.configure do |config|
  config.include CreateWeekIds, type: :system
end