FactoryBot.define do
  factory :attendance do
    date_attended { "2019-07-15" }
    deleted { false }
    user { nil }
    customer { nil }
  end
end
