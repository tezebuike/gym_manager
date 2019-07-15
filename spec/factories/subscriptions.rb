FactoryBot.define do
  factory :subscription do
    receipt_number { "MyString" }
    mode_of_payment { "MyString" }
    start_date { "2019-07-15" }
    end_date { "2019-07-15" }
    amount_paid { "9.99" }
    balance { "9.99" }
    discount { "9.99" }
    status { "MyString" }
    customer { nil }
    plan { nil }
  end
end
