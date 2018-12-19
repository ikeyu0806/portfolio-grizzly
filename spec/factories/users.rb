FactoryBot.define do
  factory :user do
    name 'test_name'
    email 'test@email.com'
    password 'password'
    password_confirmation 'password'
  end
end
