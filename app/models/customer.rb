class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :plans, :through => :subscriptions
  has_many :attendances
end
