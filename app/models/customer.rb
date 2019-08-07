class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :plans, :through => :subscriptions
  has_many :attendances
  mount_uploader :avatar, AvatarUploader
  validates :avatar, file_size: { less_than: 2.megabytes }
  audited
  has_associated_audits

  scope :active_customers, -> { joins(:subscriptions).merge(Subscription.current_subscribers) }
  scope :today_birthday, -> { where('EXTRACT(month FROM date_of_birth) = ? AND EXTRACT(day FROM date_of_birth) = ?', Date.today.month, Date.today.day) }
  scope :upcoming_birthday, -> { where('EXTRACT(month FROM date_of_birth) = ? AND EXTRACT(day FROM date_of_birth) >= ?', 1.days.from_now.month, 1.days.from_now.day) }

  enum gender: {
    male: "male",
    female: "female"
  }

  enum status: {
    active: "active",
    deactivated: "deactivated"
  }

  FITNESS_GOALS = [ "Lose Body Fat",
    "Strength and Power",
    "Muscular Endurance",
    "Cadio Fitness",
    "Flexibility",
    "Core Stability or Balance"
  ]

  def full_name
    return "#{title} #{first_name} #{middle_name} #{last_name}" if self.middle_name.present?
    return "#{title} #{first_name} #{last_name}"
  end

  def active_subscription
    self.subscriptions.active[0]
  end

  def last_date_attended
    self.attendances.last.try(&:date_attended)
  end

  def sub_period
    active_subscription.try(&:subscription_period)
  end

  def birthday
    date_of_birth.strftime("%b %d")
  end

  def active_membership_plan
    self.active_subscription.plan.membership_type
  end

  # Thinking this is better off as a class method but I need the last id
  # which I dont want to store in redis for now
  def generate_surefit_slug
    return "SF.#{id.to_i + 1}"
  end
end
