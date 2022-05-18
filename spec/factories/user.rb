FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "testman#{n}@example.ru" }
        password { "Password123456" }
    end
end