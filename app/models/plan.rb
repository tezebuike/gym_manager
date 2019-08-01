class Plan < ApplicationRecord
  has_many :subscriptions
  has_many :customers, :through => :subscriptions
  
  def subscription_name
    return self.name + " - " + self.plan_type
  end
end
