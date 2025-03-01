FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    role { :member }
  end
end
