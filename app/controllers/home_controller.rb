class HomeController < ApplicationController
  before_action :authorize
  def index
    @current_subscribers = Subscription.current_subscribers
    @yesterday_attendance = Attendance.attended_yesterday
    @today_attendance = Attendance.attended_today
    @birthday_count = Customer.today_birthday.count + Customer.upcoming_birthday.count
    @expirations = Subscription.today_expiry.count + Subscription.upcoming_expiry.count
  end
end
