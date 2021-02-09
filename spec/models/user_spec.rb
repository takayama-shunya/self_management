require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    context 'ユーザーの名前が未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: '', email: 'example@icloud.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの名前が16文字以上の場合' do
      it 'バリデーションにひっかかる' do
        name = "a" * 16
        user = User.new(name: "#{name}", email: 'example@icloud.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのアドレスが未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'test', email: '', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのアドレスが30文字以上の場合' do
      it 'バリデーションにひっかかる' do
        email = "a" * 30
        user = User.new(name: 'test', email: "#{email}@icloud.com", password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのパスワードが未入力の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(name: 'test', email: 'example@icloud.com', password: '')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのパスワードが５文字以下の場合' do
      it 'バリデーションにひっかかる' do
        password = "a" * 5 
        user = User.new(name: 'test', email: 'example@icloud.com', password: "#{password}")
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのパスワードが半角英数以外の場合' do
      it 'バリデーションにひっかかる' do
        password = "てすとテスト"
        user = User.new(name: 'test', email: 'example@icloud.com', password: "#{password}")
        expect(user).not_to be_valid
      end
    end
    context 'ユーザー作成時の条件を満たしている場合' do
      it 'バリデーションが通る' do
        user = User.new(name: 'test', email: 'example@icloud.com', password: 'password')
        expect(user).to be_valid
      end
    end
  end
end
