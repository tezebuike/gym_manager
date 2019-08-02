class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :plans, :through => :subscriptions
  has_many :attendances
  mount_uploader :avatar, AvatarUploader
  validates :avatar, file_size: { less_than: 2.megabytes }

  scope :active, -> {    joins(:subscriptions).merge(Subscription.current_subscribers) }
  scope :birth_month, -> { where('extract(month from date_of_birth) = ?', Date.today.month)  }

  # add age group
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
end
