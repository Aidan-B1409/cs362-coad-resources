FactoryBot.define do
  factory :organization do
    name { 'Fake Organization' }
    email { 'fake@fake.com' }
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
end