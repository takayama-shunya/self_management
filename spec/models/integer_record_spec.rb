require 'rails_helper'

RSpec.describe IntegerRecord, type: :model do
  let!(:test_user_1) { FactoryBot.create(:test_user_1) }

  describe 'バリデーションテスト' do
    context 'タイトルが未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.integer_records.build(title: '')
        expect(check_record).not_to be_valid
      end
    end
    context 'タイトルが21文字以上の場合' do
      it 'バリデーションに引っかかる' do
        title = "a" * 21
        check_record = test_user_1.integer_records.build(title: "#{title}")
        expect(check_record).not_to be_valid
      end
    end
    context '内容が未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.integer_records.build(title: 'integer', content: '')
        expect(check_record).not_to be_valid
      end
    end
    context '内容が未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.integer_records.build(title: 'integer', content: '')
        expect(check_record).not_to be_valid
      end
    end
    context '内容が-100000以上の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.integer_records.build(title: 'inetger', content: -100000)
        expect(check_record).not_to be_valid
      end
    end
    context '内容が100000以上場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.integer_records.build(title: 'integer', content: 100000)
        expect(check_record).not_to be_valid
      end
    end
    context '単位の文字数が11文字以上の場合' do
      it 'バリデーションに引っかかる' do
        unit = "a" * 11
        check_record = test_user_1.integer_records.build(title: 'time', content: 0, unit: "#{unit}")
        expect(check_record).not_to be_valid
      end
    end
    context '作成条件を満たしている場合' do
      it 'バリデーションが通る' do
        check_record = test_user_1.integer_records.build(title: 'inetger', content: 0)
        expect(check_record).to be_valid
      end
    end
  end
end
