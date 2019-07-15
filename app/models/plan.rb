class Plan < ApplicationRecord

  def plan_type
    return self.name + " " + self.type
  end
end
