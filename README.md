# README  
# selef_management  
## 概要  
項目選択により、日々の自分のコンディションを可視化及び記録できる  
新しい取組の手助けや自分で設定した記録がつけられる  
## コンセプト  
自分のパフォーマンス向上  
  
## バージョン  
Ruby 2.6.5  
Rails 5.2.4  
  
## 機能一覧  
- [ ] ログイン機能  
 - [ ] 未ログイン時は機能を使用できない  
- [ ] ユーザー登録機能  
 - [ ] メールアドレス、名前、パスワードは必須  
 - [ ] パスワード再設定機能  
- [ ] コンディションチェック機能  
 - [ ] チェックは1日1回（更新は可）  
 - [ ] 項目の5段階評価はグラフで表示される  
 - [ ] 設定項目はコメント欄を除き、入力必須  
 - [ ] 日付を選択することで、選択した日付のチェック結果を表示できる  
 - [ ] 作成、更新、削除はチェック者のみ
- [ ] 記録設定機能  
 - [ ] 設定タイプを選んで作成することができる  
 - [ ] 選んだタイプの値しか入力できない（例　整数記録は整数のみ）  
 - [ ] カウント記録は、カウンターボタンを押すことで数値が増減する  
 - [ ] チェック記録は、設定内容がチェック項目で表示される  
 - [ ] タイトルと記録は入力必須  
 - [ ] 日付を選択することで、選択した日付のチェック結果を表示できる  
 - [ ] 作成、更新、削除は記録設定者のみ  
- [ ] コメント機能  
 - [ ] コンディションチェック、記録設定にコメントが付けられる（1コメントのみ）  
 - [ ] 作成、更新、削除はチェック者、記録設定者のみ  
  
## カタログ設計  
https://docs.google.com/spreadsheets/d/15OwkqELOmzLIorCDiugDTqcCiOmBogZdddh3RavRSh8/edit?usp=sharing  
  
## テーブル定義  
https://docs.google.com/spreadsheets/d/1PdyCWuQcUKHeThEkj30g0kH9SdVI9MNM9_aXswaWmfQ/edit?usp=sharing  
  
## 画面遷移図  
https://docs.google.com/spreadsheets/d/1wSSJcXp0IArIkdrBMQSjrXWWBAeoYdGsXdFkVET4e1s/edit?usp=sharing  
  
## 画面ワイヤーフレーム  
https://docs.google.com/spreadsheets/d/1wSSJcXp0IArIkdrBMQSjrXWWBAeoYdGsXdFkVET4e1s/edit?usp=sharing  
  
## 使用予定Gem  
- devise  
- bootstrap  
- chartkick  
 