class Plan < ApplicationRecord
  has_many :subscriptions
  has_many :customers, :through => :subscriptions
  
  def plan_type
    return self.name + " " + self.type
  end
end
