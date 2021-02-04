FactoryBot.define do
  factory :user do
    username { 'factoryUser' }
    password { '12345678' }

    trait :with_shirt do
      after(:create) do |user, _evaluator|
        user.shirts << build(:shirt, title: 'user_with_shirt')
        user.shirts << build(:shirt)
      end
    end

    factory :user_with_shirt, traits: %i[with_shirt]
  end
end