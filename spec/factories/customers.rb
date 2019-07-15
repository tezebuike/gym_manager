FactoryBot.define do
  factory :customer do
    slug { "MyString" }
    first_name { "MyString" }
    middle_name { "MyString" }
    email { "MyString" }
    phone_number { "" }
    address { "MyString" }
    gender { "MyString" }
    date_of_birth { "2019-07-15" }
    date_joined { "2019-07-15" }
    status { "MyString" }
  end
end
