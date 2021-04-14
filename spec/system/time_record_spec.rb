require 'rails_helper'
RSpec.describe '時間タイプ 記録機能', type: :system, js: true do
  let!(:user_1) { FactoryBot.create(:test_user_1,
    name: 'user_1',
    email: 'user_1@icloud.com',
    password: 'password') }
    
  let!(:time_record_1) { FactoryBot.create(:time_record,
    title: 'time',
    unit: '分',
    content: "10:10",
    week_ids: week_ids,
    user: user_1) }
  
  describe '時間タイプ記録管理機能' do
    before do
      visit root_path
      fill_in "Eメール", with: "user_1@icloud.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
  
    # context '時間タイプの記録を新規作成した場合' do
    #   it '作成した記録が表示される' do
    #     visit setting_records_path
    #     find('#time-record-btn').click
    #     fill_in "タイトル", with: "time"
    #     fill_in "単位", with: "分"
    #     fill_in "内容", with: "00:00"
    #     check '日'
    #     check '月'
    #     check '火'
    #     check '水'
    #     check '木'
    #     check '金'
    #     check '土'
    #     click_on "登録"
    #     expect(page).to have_content 'time'
    #   end
    # end
    context '時間タイプ記録の内容を編集した場合' do
      it '編集後の内容が表示される' do
        visit top_index_path
        find("#content-edit-#{time_record_1.id}").click
        fill_in "内容", with: "20:20"
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content "02:02"
        end
      end
    end
    context '時間タイプ記録の設定を編集した場合' do
      it '編集した記録が表示される' do
        visit top_index_path
        find("#edit-#{time_record_1.id}").click
        fill_in "タイトル", with: "編集後"
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content '編集後'
        end
      end
    end
    context '時間タイプ記録の設定を削除した場合' do
      it '記録が削除される' do
        visit top_index_path
        find("#destroy-#{time_record_1.id}").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'time'
        end
      end
    end
  end
end
