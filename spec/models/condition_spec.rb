require 'rails_helper'

RSpec.describe Condition, type: :model do
  let(:test_user_1) { FactoryBot.create(:test_user_1) }

  describe 'バリデーションテスト' do
    context 'コメント関連以外で空の項目があった場合' do
      it 'バリデーションに引っかかる' do
        condition = Condition.new(
          retirung_time: '',
          rising_time: "08:30",
          sleep_time: 3,
          sleep_quality: 3,
          meal_count: 3,
          stress_level: 3,
          toughness: 3,
          stress_recovery_balance: 3,
          positive_level: 3,
          enrichment_happiness_level: 3,
          created_at: 1.days.ago 
        )
        expect(condition).not_to be_valid
      end
    end
    context 'ポジティブコメントの文字数が101文字以上場合' do
      it 'バリデーションに引っかかる' do
        positive_comment = "a" * 101
        condition = Condition.new(
          retirung_time: '00:30',
          rising_time: "08:30",
          sleep_time: 3,
          sleep_quality: 3,
          meal_count: 3,
          stress_level: 3,
          toughness: 3,
          stress_recovery_balance: 3,
          positive_level: 3,
          enrichment_happiness_level: 3,
          created_at: 1.days.ago,
          positive_comment: "#{positive_comment}",
          negative_comment: ''
        )
        expect(condition).not_to be_valid
      end
    end
    context 'ネガティブコメントの文字数が101文字以上場合' do
      it 'バリデーションに引っかかる' do
        positive_comment = "a" * 101
        condition = Condition.new(
          retirung_time: '00:30',
          rising_time: "08:30",
          sleep_time: 3,
          sleep_quality: 3,
          meal_count: 3,
          stress_level: 3,
          toughness: 3,
          stress_recovery_balance: 3,
          positive_level: 3,
          enrichment_happiness_level: 3,
          created_at: 1.days.ago,
          positive_comment: '',
          negative_comment: "#{positive_comment}"
        )
        expect(condition).not_to be_valid
      end
    end
    context '作成条件を満たしている場合' do
      it 'バリデーションに通る' do
        condition = Condition.new(
          retirung_time: '00:30',
          rising_time: "08:30",
          sleep_time: 3,
          sleep_quality: 3,
          meal_count: 3,
          stress_level: 3,
          toughness: 3,
          stress_recovery_balance: 3,
          positive_level: 3,
          enrichment_happiness_level: 3,
          created_at: 1.days.ago,
          positive_comment: '',
          negative_comment: '',
          user_id: test_user_1.id
        )
        expect(condition).to be_valid
      end
    end
  end
end
