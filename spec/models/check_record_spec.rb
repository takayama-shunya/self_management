require 'rails_helper'

RSpec.describe CheckRecord, type: :model do
  let!(:test_user_1) { FactoryBot.create(:test_user_1) }

  describe 'バリデーションテスト' do
    context 'タイトルが未入力の場合' do
      it 'バリデーションに引っかかる' do
        check_record = test_user_1.check_records.build(title: '')
        expect(check_record).not_to be_valid
      end
    end
    context 'タイトルが21文字以上の場合' do
      it 'バリデーションに引っかかる' do
        title = "a" * 21
        check_record = test_user_1.check_records.build(title: "#{title}")
        expect(check_record).not_to be_valid
      end
    end
    context '作成条件を満たしている場合' do
      it 'バリデーションが通る' do
        check_record = test_user_1.check_records.build(title: 'test')
        expect(check_record).to be_valid
      end
    end
  end
end
