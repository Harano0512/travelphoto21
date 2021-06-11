FactoryBot.define do
  factory :content do
    title             {Faker::Lorem.word}
    from_date         {Faker::Date.between(from: '2021-05-01', to: '2021-05-03')}
    return_date       {Faker::Date.between(from: '2021-05-04', to: '2021-05-06')}
  end
  
end
