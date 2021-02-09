FactoryBot.define do
  factory :test_user_1, class: User do
    name { 'テストユーザー1' }
    email { 'example@icloud.com' }
    password { 'password' }
  end
  factory :test_user_2, class: User do
    name { 'テストユーザー2' }
    email { 'example@icloud.com' }
    password { 'password' }
  end
end
