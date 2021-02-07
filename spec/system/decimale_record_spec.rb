require 'rails_helper'
RSpec.describe '少数タイプ 記録機能', type: :system, js: true do
  let!(:user_1) { FactoryBot.create(:test_user_1,
    name: 'user_1',
    email: 'user_1@icloud.com',
    password: 'password') }
  
  let!(:sun) { FactoryBot.create(:week_1) }
  let!(:mon) { FactoryBot.create(:week_2) }
  let!(:tue) { FactoryBot.create(:week_3) }
  let!(:wed) { FactoryBot.create(:week_4) }
  let!(:thurs) { FactoryBot.create(:week_5) }
  let!(:fri) { FactoryBot.create(:week_6) }
  let!(:sat) { FactoryBot.create(:week_7) }
  
  let!(:decimal_record_1) { FactoryBot.create(:decimal_record,
    title: 'decimal',
    unit: 'kg',
    content: 55.5,
    week_ids: [ sun.id, mon.id, tue.id, wed.id, thurs.id, fri.id, sat.id ],
    user: user_1) }
  
  describe '少数タイプ記録管理機能' do
    before do
      visit root_path
      fill_in "Eメール", with: "user_1@icloud.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
  
    context '少数タイプの記録を新規作成した場合' do
      it '作成した記録が表示される' do
        visit setting_records_path
        find('#decimal-record-btn').click
        fill_in "タイトル", with: "decimal"
        fill_in "単位", with: "kg"
        fill_in "内容", with: 55.5
        check '日'
        check '月'
        check '火'
        check '水'
        check '木'
        check '金'
        check '土'
        click_on "登録"
        expect(page).to have_content 'decimal'
      end
    end
    context '少数タイプ記録の内容を編集した場合' do
      it '編集後の内容が表示される' do
        visit top_index_path
        find("#content-edit-#{decimal_record_1.id}").click
        fill_in "内容", with: 66.6
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content "66.6"
        end
      end
    end
    context '少数タイプ記録の設定を編集した場合' do
      it '編集した記録が表示される' do
        visit top_index_path
        find("#edit-#{decimal_record_1.id}").click
        fill_in "タイトル", with: "編集後"
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content '編集後'
        end
      end
    end
    context '少数タイプ記録の設定を削除した場合' do
      it '記録が削除される' do
        visit top_index_path
        find("#destroy-#{decimal_record_1.id}").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'integer'
        end
      end
    end
  end
end
