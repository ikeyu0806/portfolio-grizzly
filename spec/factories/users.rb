FactoryBot.define do
  factory :user do
    name 'test_name'
    email 'test@email.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :user1, class: User do
    id 1
    name 'user1'
    email 'user1@email.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :user2, class: User do
    id 2
    name 'user2'
    email 'user2@email.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :user3, class: User do
    id 3
    name 'user3'
    email 'user3@email.com'
    password 'password'
    password_confirmation 'password'
  end
end
