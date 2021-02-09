require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:test_user) { FactoryBot.create(:test_user_1,
    name: 'test_user',
    email: 'test_user@icloud.com',
    password: 'password') }
  let!(:first_condition) { FactoryBot.create(:first_condition, user: test_user) }
  let!(:check_record) { FactoryBot.create(:check_record_1, user: test_user) }
  let!(:count_record) { FactoryBot.create(:count_record, user: test_user) }
  let!(:decimal_record) { FactoryBot.create(:decimal_record, user: test_user) }
  let!(:integer_record) { FactoryBot.create(:integer_record, user: test_user) }
  let!(:time_record) { FactoryBot.create(:time_record, user: test_user) }

  describe 'バリデーションテスト' do
    context 'コメントが未入力の場合' do
      it 'バリデーションに引っかかる' do
        comment = first_condition.build_comment(content: '')
        expect(comment).not_to be_valid
      end
    end
    context 'コメントが101文字以上の場合' do
      it 'バリデーションに引っかかる' do
        content = "a" * 101
        comment = check_record.build_comment(content: "#{content}")
        expect(comment).not_to be_valid
      end
    end
  end
  describe 'コメント作成テスト' do
    context 'conditionの場合' do
      it 'バリデーションが通る' do
        comment = first_condition.build_comment(content: 'test')
        expect(comment).to be_valid
      end
    end
    context 'check_recordの場合' do
      it 'バリデーションが通る' do
        comment = check_record.build_comment(content: 'test')
        expect(comment).to be_valid
      end
    end
    context 'count_recordの場合' do
      it 'バリデーションが通る' do
        comment = count_record.build_comment(content: 'test')
        expect(comment).to be_valid
      end
    end
    context 'decimal_recordの場合' do
      it 'バリデーションが通る' do
        comment = decimal_record.build_comment(content: 'test')
        expect(comment).to be_valid
      end
    end
    context 'integer_recordの場合' do
      it 'バリデーションが通る' do
        comment = integer_record.build_comment(content: 'test')
        expect(comment).to be_valid
      end
    end
    context 'time_recordの場合' do
      it 'バリデーションが通る' do
        comment = time_record.build_comment(content: 'test')
        expect(comment).to be_valid
      end
    end
  end
end
