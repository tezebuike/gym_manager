FactoryBot.define do
  factory :imprest do
    date { "2019-09-07" }
    item { "MyString" }
    debit { 1.5 }
    credit { 1.5 }
  end
end
