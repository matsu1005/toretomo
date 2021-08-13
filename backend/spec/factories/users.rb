FactoryBot.define do
  factory :user, class: User do
    name { "test太郎" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end


  factory :user2, class: User do
    name { "test二郎" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end