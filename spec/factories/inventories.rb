FactoryBot.define do
  factory :inventory do
    date { "2019-09-07" }
    item { "MyString" }
    inventory_type { "MyString" }
    cost_price { 1.5 }
    quantity { 1 }
    selling_price { 1.5 }
    sold_for { "MyString" }
    status { "MyString" }
  end
end
