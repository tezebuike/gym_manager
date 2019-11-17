class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  has_many :attendances, through: :customer
  audited associated_with: :customer

  scope :filter, lambda { |params|
    chain = all
    chain.where!(mode_of_payment: params[:mode_of_payment]) if params[:mode_of_payment].present?
    chain.where!(status: params[:status]) if params[:status].present?
    chain.where!(start_date: params[:start_date]) if params[:start_date].present?
    chain.where!(end_date: params[:end_date]) if params[:end_date].present?
    chain.where!(prepared_by: params[:prepared_by]) if params[:prepared_by].present?
    if params[:plan_type].present?
      chain = chain.joins(:plan).where(plans: {id: params[:plan_type]})
    end
    chain
  }

  scope :active, -> { includes(:plan).where(status: "active") }
  scope :upcoming, -> { active.where("start_date > ?", Date.today) }
  scope :today_expiry, -> { active.where('extract(month from end_date) = ? AND EXTRACT(day FROM end_date) = ?', Date.today.month, Date.today.day) }
  scope :upcoming_expiry, -> { active.where('extract(month from end_date) = ? AND EXTRACT(day FROM end_date) >= ?', 1.days.from_now.month, 1.days.from_now.day) }
  scope :current_subscribers, -> { active.where("end_date >= ?", Date.today) }
  scope :expired, -> { active.where("end_date < ?", Date.today) }

  enum status: {
    active: "active",
    paused: "paused",
    completed: "completed",
    deactivated: "deactivated"
  }

  MODE_OF_PAYMENTS = ["Bank Transfer","Cash","POS","Bank Payment(Receipt required)"]

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
