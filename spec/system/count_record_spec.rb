require 'rails_helper'
RSpec.describe 'カウントタイプ 記録機能', type: :system, js: true do
  let!(:user_1) { FactoryBot.create(:test_user_1,
    name: 'user_1',
    email: 'user_1@icloud.com',
    password: 'password') }
  
  
  let!(:count_record_1) { FactoryBot.create(:count_record,
    title: 'count',
    unit: '',
    content: 10,
    week_ids: week_ids,
    user: user_1) }
  
  describe 'カウントタイプ記録管理機能' do
    before do
      visit root_path
      fill_in "Eメール", with: "user_1@icloud.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
  
    context 'カウントタイプの記録を新規作成した場合' do
      it '作成した記録が表示される' do
        visit setting_records_path
        find('#count-record-btn').click
        fill_in "タイトル", with: "count"
        fill_in "単位", with: "本"
        fill_in "内容", with: 10
        check '日'
        check '月'
        check '火'
        check '水'
        check '木'
        check '金'
        check '土'
        click_on "登録"
        expect(page).to have_content 'count'
      end
    end
    context 'カウントタイプのプラスボタンをクリックした場合' do
      it '内容の値がプラス1される' do
        visit top_index_path
        find("#countup-btn-#{count_record_1.id}").click
        wait_for_ajax do
          visit setting_records_path
          expect(page).to have_content '11'
        end
      end
    end
    context 'カウントタイプのマイナスボタンをクリックした場合' do
      it '内容の値がマイナス1される' do
        visit top_index_path
        find("#countdown-btn-#{count_record_1.id}").click
        wait_for_ajax do
          expect(page).to have_content '9'
        end
      end
    end
    context 'カウントタイプ記録の設定を削除した場合' do
      it '記録が削除される' do
        visit top_index_path
        find("#destroy-#{count_record_1.id}").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'count'
        end
      end
    end
  end
end
