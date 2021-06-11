FactoryBot.define do
  factory :comment do
    text          {Faker::Lorem.sentences}
  end
end
