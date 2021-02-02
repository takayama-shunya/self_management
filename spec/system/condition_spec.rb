require 'rails_helper'
RSpec.describe 'コンディション管理機能', type: :system do
  let!(:test_user) { FactoryBot.create(:test_user_1,
    name: 'test_user',
    email: 'test_user@icloud.com',
    password: 'password') }
  before do
    visit root_path
    fill_in "Eメール", with: "example@icloud.com"
    fill_in "パスワード", with: "password"
    click_button "ログイン"
  end
  describe '新規作成機能' do
    context 'コンディションを新規作成した場合' do
      it '作成したコンディションが表示される' do
        visit new_condition_path
        fill_in "【就寝時間】", with: "23:00"
        fill_in "【起床時間】", with: "07:00"
        choose 2, from: "【睡眠時間】"
        choose 2, from: "【睡眠の質】"
        choose 2, from: "【食事回数】"
        choose 2, from: "【ストレス度】"
        choose 2, from: "【タフど】"
        choose 2, from: "【ストレスと回復のバランス】"
        choose 2, from: "【ポジティブ度】"
        choose 2, from: "【幸福・充実度】"
        fill_in "【ネガティブコメント】", with: ""
        fill_in "【ポジティブコメント】", with: "作成テスト"
        click_on "登録"
        expect(page).to have_content '作成テスト'
      end
    end
  end
end
