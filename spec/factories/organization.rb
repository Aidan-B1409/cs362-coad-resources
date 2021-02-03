FactoryBot.define do
  factory :organization do
    name { 'Fake' }
    email { 'fake@fake.com' }
    phone { '555-123-4567' }
    status { :submitted }
    primary_name { 'Fake' }
    secondary_name { 'StillFake' }
    secondary_phone { '555-123-4567' }
  end
end