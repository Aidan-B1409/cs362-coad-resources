FactoryBot.define do
  factory :resource_category do
    sequence(:name) { |n| "category #{n}" }
    active { true }

    trait :is_active do
      active { true }
    end
    trait :inactive do
      active { false }
    end
  end
end
