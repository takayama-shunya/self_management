require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system, js: true do
  describe 'ユーザー登録機能' do
    context 'ユーザーを新規作成した場合' do
      it '作成したユーザーが登録されログインする' do
        visit root_path
        click_on 'アカウント登録'
        fill_in "Eメール", with: "test_user@icloud.com"
        fill_in "名前", with: "test_user"
        fill_in "パスワード", with: "password"
        fill_in "パスワード（確認用）", with: "password" 
        click_on "アカウント登録"
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
    context 'ログインせずにトップ画面に移動しようとした場合' do
      it 'ログイン画面に遷移すること' do
        visit top_index_path
        expect(page).to have_content 'アカウント登録もしくはログインしてください'
      end
    end
  end
  let!(:user_1) { FactoryBot.create(:test_user_1,
    name: 'user_1',
    email: 'user_1@icloud.com',
    password: 'password') }
  let!(:user_2) { FactoryBot.create(:test_user_2,
    name: 'user_2',
    email: 'user_2@icloud.com',
    password: 'password') }
  
  describe 'ログイン機能' do
    before do
      visit root_path
      fill_in "Eメール", with: "user_1@icloud.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
    context 'ログインした場合' do
      it 'ログアウトリンクが表示される' do
        visit top_index_path
        expect(page).to have_content 'ログアウト'
      end
    end
    context 'ログアウトした場合' do
      it 'ログインリンクが表示される' do
        click_on "ログアウト"
        expect(page).to have_content 'ログイン'
      end
    end
    context 'ログイン時' do
      it 'ユーザー詳細画面にアクセスできること' do
        visit edit_user_registration_path
        expect(page).to have_content 'user_1'
      end
      it 'ユーザー編集できること' do
        visit edit_user_registration_path
        fill_in "名前", with: "名前変更"
        fill_in "パスワード", with: "123456"
        fill_in "パスワード（確認用）", with: "123456"
        fill_in "現在のパスワード", with: "password"
        click_button "更新"
        expect(page).to have_content '名前変更'
      end
      it 'アカウント削除できること' do
        visit edit_user_registration_path
        click_button "アカウント削除"
        expect(page.accept_confirm).to eq "本当によろしいですか?"
        expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
      end
    end
  end
end
