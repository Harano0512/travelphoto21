FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.first_name}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
