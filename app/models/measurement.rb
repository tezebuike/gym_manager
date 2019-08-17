class Measurement < ApplicationRecord
  audited associated_with: :customer
  belongs_to :customer

  # todo: add method to calculate bmi and calculate before saving
end
