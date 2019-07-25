# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

plans = [
  { name: 'Individual', plan_type: 'Daily', duration: 1 },
  { name: 'Individual', plan_type: 'Monthly', duration: 30 },
  { name: 'Individual', plan_type: 'Quarterly', duration: 90 },
  { name: 'Individual', plan_type: 'Bi-annually', duration: 180 },
  { name: 'Individual', plan_type: 'Yearly', duration: 365 },
  { name: 'Couple', plan_type: 'Daily', duration: 1 },
  { name: 'Couple', plan_type: 'Monthly', duration: 30 },
  { name: 'Couple', plan_type: 'Quarterly', duration: 90 },
  { name: 'Couple', plan_type: 'Bi-annually', duration: 180 },
  { name: 'Couple', plan_type: 'Yearly', duration: 365 }
]
plans.each do |plan|
  Plan.find_or_create_by(plan)
end


customers = [
  {
    slug:         "SF_10001",
    first_name:   "Nkechi",
    middle_name:  "Dora",
    last_name:    "Onwune",
    email:        "nkydora@gmail.com",
    phone_number: "08023425562",
    address:      "58 Jurigbo Street, Okota",
    gender:       "Female",
    date_of_birth: Date.parse('1987-09-30'),
    status:       "active",
    date_joined:  Date.parse('2015-01-07')
  },
  {
    slug:         "SF_10002",
    first_name:   "John",
    middle_name:  "O",
    last_name:    "Brunce",
    email:        "brujoh@yahoo.com",
    phone_number: "08177899076",
    address:      "Plot 2 Aboloju cresent, Odepe",
    gender:       "Male",
    date_of_birth: Date.parse('1977-09-05'),
    status:       "active",
    date_joined:  Date.parse('2015-02-01')
  },
  {
    slug:         "SF_10003",
    first_name:   "Bless",
    middle_name:  "J",
    last_name:    "Owen",
    email:        "jeany0@gmail.com",
    phone_number: "08099876576",
    address:      "Go-slow office",
    gender:       "Family",
    date_of_birth: Date.parse('1983-10-02'),
    status:       "active",
    date_joined:  Date.parse('2015-03-28')
  }
]

customers.each do |customer|
  Customer.find_or_create_by(customer)
end

subscriptions = [
  {
    customer_id:     1,
    plan_id:         1,
    receipt_number:  "A3453772",
    mode_of_payment: "POS",
    start_date: Date.parse('2018-09-01'),
    end_date:   Date.parse('2018-09-01'),
    amount_paid:     1000,
    balance: 0,
    discount:      0,
    status:          "completed"
  },
  {
    customer_id:     2,
    plan_id:         2,
    receipt_number:  "A3737562",
    mode_of_payment: "Bank Transfer",
    start_date: Date.parse('2018-09-01'),
    end_date:   Date.parse('2018-09-30'),
    amount_paid:     30000,
    balance: 0,
    discount: 0,
    status:          "active"
  },
  {
    customer_id:     3,
    plan_id:         7,
    receipt_number:  "A3453000",
    mode_of_payment: "Cash",
    start_date: Date.parse('2018-10-01'),
    end_date:   Date.parse('2018-10-30'),
    amount_paid:     40000,
    balance: 5000,
    discount:       0,
    status:          "active"
  }
]

subscriptions.each do |subscription|
  Subscription.find_or_create_by(subscription)
end

attendances = [
  { customer_id: 1, 
    user_id: 2, 
    date_attended: Date.parse('2018-09-01'), 
    deleted: false
  },
  { customer_id: 2, 
    user_id: 2, 
    date_attended: Date.parse('2018-09-01'), 
    deleted: false
  },
  { customer_id: 2, 
    user_id: 2, 
    date_attended: Date.parse('2018-09-06'), 
    deleted: false
  },
]

attendances.each do |attendance|
  Attendance.find_or_create_by(attendance)
end