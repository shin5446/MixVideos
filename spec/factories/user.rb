FactoryBot.define do
  factory :user, class: User do
    name { 'テストユーザー1' }
    email { 'user1@example.com' }
    password { 'password' }
    provider { 'google' }
    uid { SecureRandom.uuid }
  end
  factory :user2, class: User do
    name { 'テストユーザー2' }
    email { 'user2@example.com' }
    password { 'password' }
    provider { 'google' }
    uid { SecureRandom.uuid }
  end
  factory :user3, class: User do
    name { 'テストユーザー3' }
    email { 'user3@example.com' }
    password { 'password' }
    provider { 'google' }
    uid { SecureRandom.uuid }
  end
  factory :user4, class: User do
    name { 'テストユーザー4' }
    email { 'user4@example.com' }
    password { 'password' }
    provider { 'google' }
    uid { SecureRandom.uuid }
  end
end
