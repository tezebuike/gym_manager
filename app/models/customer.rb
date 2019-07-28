class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :plans, :through => :subscriptions
  has_many :attendances

  def full_name
    return "#{first_name} #{middle_name} #{last_name}"
  end
end
