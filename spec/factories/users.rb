FactoryBot.define do
  factory :user, aliases: [:friend] do
    # email { Faker::Internet.email }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
  end
end