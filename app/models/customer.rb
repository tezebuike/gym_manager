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

  def full_name
    return "#{first_name} #{middle_name} #{last_name}" if self.middle_name.present?
    return "#{first_name} #{last_name}"
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
end
