require 'rails_helper'

RSpec.describe DecimalRecord, type: :model do
  let!(:test_user_1) { FactoryBot.create(:test_user_1) }

  describe 'バリデーションテスト' do
    context 'タイトルが未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.decimal_records.build(title: '')
        expect(check_record).not_to be_valid
      end
    end
    context 'タイトルが21文字以上の場合' do
      it 'バリデーションに引っかかる' do
        title = "a" * 21
        check_record = test_user_1.decimal_records.build(title: "#{title}")
        expect(check_record).not_to be_valid
      end
    end
    context '内容が未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.decimal_records.build(title: 'decimal', content: '')
        expect(check_record).not_to be_valid
      end
    end
    context '内容が未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.decimal_records.build(title: 'decimal', content: '')
        expect(check_record).not_to be_valid
      end
    end
    context '内容がマイナス数字の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.decimal_records.build(title: 'decimal', content: -1)
        expect(check_record).not_to be_valid
      end
    end
    context '内容が1000以上場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.decimal_records.build(title: 'decimal', content: 1000)
        expect(check_record).not_to be_valid
      end
    end
    context '単位の文字数が11文字以上の場合' do
      it 'バリデーションに引っかかる' do
        unit = "a" * 11
        check_record = test_user_1.decimal_records.build(title: 'time', content: 0, unit: "#{unit}")
        expect(check_record).not_to be_valid
      end
    end
    context '作成条件を満たしている場合' do
      it 'バリデーションが通る' do
        check_record = test_user_1.decimal_records.build(title: 'decimal', content: 0)
        expect(check_record).to be_valid
      end
    end
  end
end
