FactoryBot.define do
    factory :comment do
        user
        sequence(:body) { |n| "comment body #{n}" }
    end
end