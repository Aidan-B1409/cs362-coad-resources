FactoryBot.define do
  factory :ticket do
    name { 'Fake Name' }
    description { 'Fake Description' }
    phone { '555-123-4567' }
    region
    resource_category
    organization

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
  end
end
