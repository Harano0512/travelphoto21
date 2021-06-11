FactoryBot.define do
  factory :post do
    subject          {Faker::Lorem.word}
    travel_date      {Faker::Date.between(from: '2021-05-01', to: '2021-05-03')}
    prefecture_id    {Faker::Number.between(from: 2, to: 48)}
    article          {Faker::Lorem.sentences}
  
    after(:build) do |post|
      post.images.attach(io: File.open('public/images/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
