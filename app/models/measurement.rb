class Measurement < ApplicationRecord
  audited associated_with: :customer
  belongs_to :customer

  def bmi
    if self.body_weight.present? && self.height.present?
      return self.body_weight / self.height
    end
  end
end
