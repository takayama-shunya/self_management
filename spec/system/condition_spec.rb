require 'rails_helper'
RSpec.describe 'コンディション機能', type: :system, js: true do
  let!(:user_1) { FactoryBot.create(:test_user_1,
    name: 'user_1',
    email: 'user_1@icloud.com',
    password: 'password') }

  let!(:condition_1) { FactoryBot.create(:first_condition,
    user: user_1,
    positive_comment: 'てすと') }
  let!(:condition_2) { FactoryBot.create(:second_condition,
    user: user_1,
    positive_comment: 'test') }
  
  describe 'コンディション管理機能' do
    before do
      visit root_path
      fill_in "Eメール", with: "user_1@icloud.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
  
    context 'コンディションを新規作成した場合' do
      it '作成したコンディションが表示される' do
        visit new_condition_path
        fill_in "condition[retirung_time]", with: "23:00"
        fill_in "condition[rising_time]", with: "07:00"
        find('#st-2').choose
        find('#sq-2').choose
        find('#mc-2').choose
        find('#sl-2').choose
        find('#t-2').choose
        find('#srb-2').choose
        find('#pl-2').choose
        find('#ehl-2').choose
        fill_in "【ネガティブコメント】", with: ""
        fill_in "【ポジティブコメント】", with: "作成テスト"
        click_on "登録"
        expect(page).to have_content '作成テスト'
      end
    end
    context 'コンディションを編集した場合' do
      it '編集内容が反映される' do
        visit edit_condition_path(condition_1)
        fill_in "【ポジティブコメント】", with: "編集テスト"
        click_on "更新"
        expect(page).to have_content '編集テスト'
      end
    end
    context '詳細ボタンをクリックした場合' do
      it '詳細内容が確認できる' do
        visit conditions_path
        find("#show-#{condition_1.id}").click
        expect(page).to have_content 'てすと'
      end
    end
    context 'コンディションを削除した場合' do
      it 'コンディションが削除される' do
        visit conditions_path
        find("#destroy-#{condition_1.id}").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        expect(page).to have_content 'コンディションチェック削除しました'
      end
    end
  end
end
