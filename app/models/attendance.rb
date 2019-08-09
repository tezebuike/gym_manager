class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  audited associated_with: :customer

  scope :attended_yesterday, -> { where(date_attended: Date.yesterday) }
  scope :attended_today, -> { where(date_attended: Date.today) }

  scope :filter, lambda { |params|
    chain = all
    chain.where!(date_attended: params[:date_attended]) if params[:date_attended].present?
    chain.where!("date_attended >= ?", params[:from_date])if params[:from_date].present?
    chain.where!("date_attended <= ?", params[:to_date])if params[:to_date].present?
    chain.where!('EXTRACT(month FROM date_attended) = ?', params[:month]) if params[:month].present?
    chain.where!('date_attended >= ? AND date_attended <= ?', params[:week].to_date.beginning_of_week, params[:week].to_date.end_of_week) if params[:week].present?
    chain.includes(:customer)
  }
end
