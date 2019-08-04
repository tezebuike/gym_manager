class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :plan

  scope :active, -> { includes(:plan).where(status: "active") }
  scope :upcoming, -> { active.where("start_date > ?", Date.today) }
  scope :today_expiry, -> { active.where('extract(month from end_date) = ? AND EXTRACT(day FROM end_date) = ?', Date.today.month, Date.today.day) }
  scope :upcoming_expiry, -> { active.where('extract(month from end_date) = ? AND EXTRACT(day FROM end_date) >= ?', 1.days.from_now.month, 1.days.from_now.day) }
  scope :current_subscribers, -> { active.where("end_date >= ?", Date.today) }

  enum status: {
    active: "active",
    completed: "completed",
    deactivated: "deactivated"
  }

  def sub_start_date
    self.start_date.strftime("%b %d, %Y")
  end

  def sub_end_date
    self.end_date.strftime("%b %d, %Y")
  end

  def subscription_period
    return sub_start_date + " - " + sub_end_date
  end

  def subscription_month
    start_month = self.start_date.strftime("%B")
    end_month = self.end_date.strftime("%B")

    return [start_month] if start_month == end_month
    return [start_month, end_month]
  end
end
