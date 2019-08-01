class Customer < ApplicationRecord
  has_many :subscriptions
  has_many :plans, :through => :subscriptions
  has_many :attendances

  scope :active, -> {    joins(:subscriptions).merge(Subscription.current_subscribers) }
  scope :birth_month, -> { where('extract(month from date_of_birth) = ?', Date.today.month)  }

  # add age group
  def full_name
    return "#{first_name} #{middle_name} #{last_name}" if self.middle_name.present?
    return "#{first_name} #{last_name}"
  end

  def active_subscriptions
    self.subscriptions.active[0]
  end

  def last_date_attended
    self.attendances.last.try(&:date_attended)
  end
end
