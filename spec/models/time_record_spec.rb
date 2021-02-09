require 'rails_helper'

RSpec.describe TimeRecord, type: :model do
  let!(:test_user_1) { FactoryBot.create(:test_user_1) }

  describe 'バリデーションテスト' do
    context 'タイトルが未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.time_records.build(title: '')
        expect(check_record).not_to be_valid
      end
    end
    context 'タイトルが21文字以上の場合' do
      it 'バリデーションに引っかかる' do
        title = "a" * 21
        check_record = test_user_1.time_records.build(title: "#{title}", content: '08:00')
        expect(check_record).not_to be_valid
      end
    end
    context '内容が未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.time_records.build(title: 'time', content: '')
        expect(check_record).not_to be_valid
      end
    end
    context '単位の文字数が11文字以上の場合' do
      it 'バリデーションに引っかかる' do
        unit = "a" * 11
        check_record = test_user_1.time_records.build(title: 'time', content: '08:00', unit: "#{unit}")
        expect(check_record).not_to be_valid
      end
    end
    context '作成条件を満たしている場合' do
      it 'バリデーションが通る' do
        check_record = test_user_1.time_records.build(title: 'time', content: '08:00')
        expect(check_record).to be_valid
      end
    end
  end
end
