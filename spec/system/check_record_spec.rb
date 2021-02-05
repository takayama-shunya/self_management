require 'rails_helper'
RSpec.describe 'チェックタイプ 記録機能', type: :system, js: true do
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
  
  let!(:check_record_1) { FactoryBot.create(:check_record_1,
    title: 'check',
    unit: '',
    content: false,
    week_ids: [ sun.id, mon.id, tue.id, wed.id, thurs.id, fri.id, sat.id ],
    user: user_1) }
  # let(:check_record_2) { FactoryBot.create(:check_record_2,
  #   title: 'チェック',
  #   unit: '',
  #   content: true,
  #   week_ids: [ sun.id, mon.id, tue.id, wed.id, thurs.id, fri.id, sat.id ],
  #   user: user_1) }
  
  describe 'チェックタイプ記録管理機能' do
    before do
      visit root_path
      fill_in "Eメール", with: "user_1@icloud.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
  
    context 'チェックタイプの記録を新規作成した場合' do
      it '作成した記録が表示される' do
        visit setting_records_path
        find('#check-record-btn').click
        fill_in "タイトル", with: "check"
        check '日'
        check '月'
        check '火'
        check '水'
        check '木'
        check '金'
        check '土'
        click_on "登録"
        expect(page).to have_content 'check'
      end
    end
    context 'チェックタイプ記録の内容をチェックした場合（偽から真）' do
      it '内容の値が真になっている' do
        visit top_index_path
        find("#check-btn-#{check_record_1.id}").click
        # expect(check_record_1.content).to eq true
        wait_for_ajax do
          visit setting_records_path
          expect(page).to have_content 'チェック済'
        end
      end
    end
    context 'チェックタイプ記録の内容をチェックした場合（真から偽）' do
      it '内容の値が偽になっている' do
        visit top_index_path
        find("#check-btn-#{check_record_1.id}").click
        wait_for_ajax do
          find("#check-btn-#{check_record_1.id}").click
          visit setting_records_path
          expect(page).to have_content '未チェック'
        end
        # expect(check_record_2.content).to be false
      end
    end
    context 'チェックタイプ記録の設定を削除した場合' do
      it '記録が削除される' do
        visit top_index_path
        find("#destroy-#{check_record_1.id}").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'check'
        end
      end
    end
  end
end
