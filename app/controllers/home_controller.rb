class HomeController < ApplicationController
  def index
    @current_subscribers = Subscription.current_subscribers
    @yesterday_attendance = Attendance.attended_yesterday
    @today_attendance = Attendance.attended_today
    @month_birthday = Customer.all.birth_month
    @expirations = Subscription.expiry
  end
end
