FactoryBot.define do
  factory :organization do
    sequence(:name) { |n| "organization #{n}" }
    sequence(:email) { |n| "fake#{n}@email.com" }
    phone { '1+541-392-5468' }
    status { 'submitted' }
    title { 'Fake Title' }
    primary_name { 'Fake' }
    secondary_name { 'StillFake' }
    secondary_phone { '1+541-392-5469' }
    transportation { :yes }
    description { 'Fake description' }
    rejection_reason { 'Fake reason' }
  end

  trait 'approved' do
    status { 'approved' }
  end
end