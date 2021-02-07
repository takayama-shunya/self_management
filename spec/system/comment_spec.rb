require 'rails_helper'
RSpec.describe 'コメント機能', type: :system, js: true do
  let!(:user_1) { FactoryBot.create(:test_user_1,
    name: 'user_1',
    email: 'user_1@icloud.com',
    password: 'password') }
  
  let!(:condition_1) { FactoryBot.create(:first_condition,
    user: user_1) }
  
  let!(:integer_record_1) { FactoryBot.create(:integer_record,
    title: 'integer',
    unit: '円',
    content: 1000,
    week_ids: week_ids,
    user: user_1) }
  
  let!(:decimal_record_1) { FactoryBot.create(:decimal_record,
    title: 'decimal',
    unit: 'kg',
    content: 55.5,
    week_ids: week_ids,
    user: user_1) }

  let!(:time_record_1) { FactoryBot.create(:time_record,
    title: 'time',
    unit: '分',
    content: "10:10",
    week_ids: week_ids,
    user: user_1) }

  let!(:count_record_1) { FactoryBot.create(:count_record,
    title: 'count',
    unit: '',
    content: 10,
    week_ids: week_ids,
    user: user_1) }

  let!(:check_record_1) { FactoryBot.create(:check_record_1,
    title: 'check',
    unit: '',
    content: false,
    week_ids: week_ids,
    user: user_1) }
  
  # comment = condition_1.build_comment(content: 'condition_comment_test')
  # comment.save
  let(:condition_comment) { Comment.create!(content: 'condition_comment_test', commentable_type: Condition, commentable_id: condition_1.id) }
  let(:integer_record_comment) { Comment.create!(content: 'integer_comment_test', commentable_type: SettingRecord, commentable_id: integer_record_1.id) }
  let(:decimal_record_comment) { Comment.create!(content: 'decimal_comment_test', commentable_type: SettingRecord, commentable_id: decimal_record_1.id) }
  let(:time_record_comment) { Comment.create!(content: 'time_comment_test', commentable_type: SettingRecord, commentable_id: time_record_1.id) }
  let(:count_record_comment) { Comment.create!(content: 'count_comment_test', commentable_type: SettingRecord, commentable_id: count_record_1.id) }
  let(:check_record_comment) { Comment.create!(content: 'count_comment_test', commentable_type: SettingRecord, commentable_id: check_record_1.id) }


  describe 'コメント管理機能' do
    before do
      visit root_path
      fill_in "Eメール", with: "user_1@icloud.com"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
    end
  
    context 'コンディションにコメントを付けた場合' do
      it '作成したコメントが表示される' do
        visit conditions_path
        find("#show-#{condition_1.id}").click
        fill_in "コメント", with: "condition_comment_test"
        click_on "登録"
        wait_for_ajax do
          expect(page).to have_content 'condition_comment_test'
        end
      end
      it '編集したコメントが表示される' do
        condition_comment
        visit conditions_path
        find("#show-#{condition_1.id}").click
        find('#comment-edit-btn').click
        wait_for_ajax do
          fill_in "コメント", with: "edit-comment"
        end
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content 'edit-comment'
        end
      end
      it '削除したコメントが表示されない' do
        condition_comment
        visit conditions_path
        find("#show-#{condition_1.id}").click
        find("#comment-destroy-btn").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'condition_comment_test'
        end
      end
    end

    context '整数タイプの記録にコメントを付けた場合' do
      it '作成したコメントが表示される' do
        visit top_index_path
        find("#record-link-#{integer_record_1.id}").click
        fill_in "コメント", with: "integer_comment_test"
        click_on "登録"
        wait_for_ajax do
          expect(page).to have_content 'integer_comment_test'
        end
      end
      it '編集したコメントが表示される' do
        integer_record_comment
        visit top_index_path
        find("#record-link-#{integer_record_1.id}").click
        find('#comment-edit-btn').click
        wait_for_ajax do
          fill_in "コメント", with: "edit-comment"
        end
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content 'edit-comment'
        end
      end
      it '削除したコメントが表示されない' do
        integer_record_comment
        visit top_index_path
        find("#record-link-#{integer_record_1.id}").click
        find("#comment-destroy-btn").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'condition_comment_test'
        end
      end
    end
    
    context '少数タイプの記録にコメントを付けた場合' do
      it '作成したコメントが表示される' do
        visit top_index_path
        find("#record-link-#{decimal_record_1.id}").click
        fill_in "コメント", with: "decimal_comment_test"
        click_on "登録"
        wait_for_ajax do
          expect(page).to have_content 'decimal_comment_test'
        end
      end
      it '編集したコメントが表示される' do
        decimal_record_comment
        visit top_index_path
        find("#record-link-#{decimal_record_1.id}").click
        find('#comment-edit-btn').click
        wait_for_ajax do
          fill_in "コメント", with: "edit-comment"
        end
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content 'edit-comment'
        end
      end
      it '削除したコメントが表示されない' do
        decimal_record_comment
        visit top_index_path
        find("#record-link-#{decimal_record_1.id}").click
        find("#comment-destroy-btn").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'condition_comment_test'
        end
      end
    end

    context '時間タイプの記録にコメントを付けた場合' do
      it '作成したコメントが表示される' do
        visit top_index_path
        find("#record-link-#{time_record_1.id}").click
        fill_in "コメント", with: "time_comment_test"
        click_on "登録"
        wait_for_ajax do
          expect(page).to have_content 'time_comment_test'
        end
      end
      it '編集したコメントが表示される' do
        time_record_comment
        visit top_index_path
        find("#record-link-#{time_record_1.id}").click
        find('#comment-edit-btn').click
        wait_for_ajax do
          fill_in "コメント", with: "edit-comment"
        end
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content 'edit-comment'
        end
      end
      it '削除したコメントが表示されない' do
        time_record_comment
        visit top_index_path
        find("#record-link-#{time_record_1.id}").click
        find("#comment-destroy-btn").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'condition_comment_test'
        end
      end
    end

    context 'カウントタイプの記録にコメントを付けた場合' do
      it '作成したコメントが表示される' do
        visit top_index_path
        find("#record-link-#{count_record_1.id}").click
        fill_in "コメント", with: "count_comment_test"
        click_on "登録"
        wait_for_ajax do
          expect(page).to have_content 'count_comment_test'
        end
      end
      it '編集したコメントが表示される' do
        count_record_comment
        visit top_index_path
        find("#record-link-#{count_record_1.id}").click
        find('#comment-edit-btn').click
        wait_for_ajax do
          fill_in "コメント", with: "edit-comment"
        end
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content 'edit-comment'
        end
      end
      it '削除したコメントが表示されない' do
        count_record_comment
        visit top_index_path
        find("#record-link-#{count_record_1.id}").click
        find("#comment-destroy-btn").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'condition_comment_test'
        end
      end
    end

    context 'チェックタイプの記録にコメントを付けた場合' do
      it '作成したコメントが表示される' do
        visit top_index_path
        find("#record-link-#{check_record_1.id}").click
        fill_in "コメント", with: "check_comment_test"
        click_on "登録"
        wait_for_ajax do
          expect(page).to have_content 'check_comment_test'
        end
      end
      it '編集したコメントが表示される' do
        check_record_comment
        visit top_index_path
        find("#record-link-#{check_record_1.id}").click
        find('#comment-edit-btn').click
        wait_for_ajax do
          fill_in "コメント", with: "edit-comment"
        end
        click_on "更新"
        wait_for_ajax do
          expect(page).to have_content 'edit-comment'
        end
      end
      it '削除したコメントが表示されない' do
        check_record_comment
        visit top_index_path
        find("#record-link-#{check_record_1.id}").click
        find("#comment-destroy-btn").click
        expect(page.accept_confirm).to eq "本当に削除して良いですか？"
        wait_for_ajax do
          expect(page).not_to have_content 'condition_comment_test'
        end
      end
    end
  end
end
