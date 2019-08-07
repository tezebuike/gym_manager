class Plan < ApplicationRecord
  has_many :subscriptions
  has_many :customers, :through => :subscriptions
  has_many :attendances, through: :subscriptions
  
  def membership_type
    return self.name + " - " + self.plan_type
  end
end
