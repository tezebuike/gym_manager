class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  audited associated_with: :customer

  scope :attended_yesterday, -> { where(date_attended: Date.yesterday) }
  scope :attended_today, -> { where(date_attended: Date.today) }
end
