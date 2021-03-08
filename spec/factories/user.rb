FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "fake#{i}@example.com" } 
    password{ 'password' }
    password_confirmation { 'password' }
    organization

    trait :organization do
      role { 'organization' }
      organization { build(:organization, :approved) }
    end

    trait :nilorg do
      role { 'organization' }
      organization { nil }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end