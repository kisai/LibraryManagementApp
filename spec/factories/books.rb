FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Book.genre }
    isbn { Faker::Number.unique.number(digits: 13) }
    total_copies { rand(1..5) }
  end
end
