FactoryBot.define do
  factory :ticket do
    name { 'Fake Name' }
    description { 'Fake Description' }
    phone { '1+541-392-5468' }
    closed { false }
    closed_at { nil }
    region
    resource_category

    trait :closed do
      closed { true }
    end

    trait :open do
      closed { false }
    end

    trait :assigned do
      organization
    end

    trait :unassigned do
      organization { nil }
    end

    trait :valid_phone do
      phone { '1+541-392-5468' }
    end

    trait :invalid_phone do
      phone { '888420' }
    end
  end
end
