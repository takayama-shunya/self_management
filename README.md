# README  
# selef_management  
## 概要  
項目選択により、日々の自分のコンディションを可視化及び記録できる  
新しい取組（習慣化）の手助けや自分で設定した記録がつけられる  
デプロイ先：http://18.177.76.51/  
## コンセプト  
自分のパフォーマンス向上、状態の可視化
<img width="1352" alt="スクリーンショット 2021-04-21 4 58 42" src="https://user-images.githubusercontent.com/63427166/115456978-c9ba7e00-a25e-11eb-8d2c-342c7931d3fb.png">  

## 工夫した点／特徴  
5つのタイプを選ぶことで、使用者の自由に記録数値の設定ができる  
グラフで可視化し、一眼で認識できるようにした点  
記録数値の推移や累計値を確認できるようにした点  
記録数値の自動リセット機能（タスク処理）の実装  　　
使用頻度の高い箇所は非同期通信を使用した点  
<img width="1065" alt="スクリーンショット 2021-05-19 1 58 44" src="https://user-images.githubusercontent.com/63427166/118693465-07063180-b846-11eb-8e84-5f576a8ab750.png">  
<img width="1158" alt="スクリーンショット 2021-04-21 5 00 06" src="https://user-images.githubusercontent.com/63427166/115457109-fc647680-a25e-11eb-98f6-15cd527d1121.png">  
<img width="1195" alt="スクリーンショット 2021-04-21 5 01 37" src="https://user-images.githubusercontent.com/63427166/115457152-0b4b2900-a25f-11eb-9646-6ccd0a96db23.png">  

## 苦労した点  
記録のリセット機能（タスク処理）や累計値機能の実装  
STI（シングルテーブル継承）での関連付け  

## 使用技術  
Ruby(Ruby on Rails) PostgreSQL　AWS(EC2, Elastic IP) Docker cicleCI  

## バージョン  
Ruby 2.6.5  
Rails 5.2.4  
Docker 20.10.5  
  
## 機能一覧  
- ログイン機能  
  - 未ログイン時は機能を使用できない  
- ユーザー登録機能  
  - メールアドレス、名前、パスワードは必須  
  - パスワード再設定機能  
- コンディションチェック機能  
  - チェックは1日1回（更新は可）  
  - 項目の5段階評価はグラフで表示される  
  - 設定項目はコメント欄と時間を除き、入力必須  
  - 日付を選択することで、選択した日付のチェック結果を表示できる  
  - 作成、更新、削除はチェック者のみ
- 記録設定機能  
  - 設定タイプを選んで作成することができる  
  - 選んだタイプの値しか入力できない（例　整数記録は整数のみ）  
  - カウント記録は、カウンターボタンを押すことで数値（±1）が増減する  
  - チェック記録は、設定内容がチェック項目で表示される  
  - タイトルと記録は入力必須  
  - リセット機能（定期実行：明日実施予定の記録は前日の23時50分に数値がリセットされる）  
  - 累計機能（チェックタイプ以外）更新時の差分を計算  
  - 記録数値のグラフ化（直近30件）  
  - 作成、更新、削除は記録設定者のみ  
- コメント機能  
  - コンディションチェック、記録設定にコメントが付けられる（1コメントのみ）  
  - 作成、更新、削除はチェック者、記録設定者のみ  
  
## カタログ設計  
https://docs.google.com/spreadsheets/d/15OwkqELOmzLIorCDiugDTqcCiOmBogZdddh3RavRSh8/edit?usp=sharing  
  
## テーブル定義  
https://docs.google.com/spreadsheets/d/1PdyCWuQcUKHeThEkj30g0kH9SdVI9MNM9_aXswaWmfQ/edit?usp=sharing  
  
## 画面遷移図  
https://docs.google.com/spreadsheets/d/1wSSJcXp0IArIkdrBMQSjrXWWBAeoYdGsXdFkVET4e1s/edit?usp=sharing  
  
## 画面ワイヤーフレーム  
https://docs.google.com/spreadsheets/d/1wSSJcXp0IArIkdrBMQSjrXWWBAeoYdGsXdFkVET4e1s/edit?usp=sharing  
  
## 使用Gem  
- devise  
- devise-i18n  
- bootstrap  
- kaminari  
- bootstrap4-kaminari-views  
- jquery-rails  
- chart-js-rails
- gon  
- letter_opener_web  
- rspec-rails  
- spring-commands-rspec  
- factory_bot_rails  
- faker  
- launchy  
- capybara  
- webdrivers  
- selenium-webdriver
- dotenv-rails  
- pry-rails  
- unicorn  
- capistrano  
- whenever  

## 注意点  
SEEDデータを読み込んでから使用して下さい
  