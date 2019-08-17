class SubscriptionsController < ApplicationController
  before_action :authorize
  before_action :set_subscription, only: [:show, :edit, :pause, :restart, :update, :destroy]

  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.filter(params.slice(:plan_type, :mode_of_payment, :end_date, :start_date, :status, :prepared_by))
  end

  # GET /subscriptions/new
  def new
    @customer = Customer.find(params[:customer_id])
    @subscription = Subscription.new(customer_id: @customer.id, prepared_by: current_user.full_name) if @customer.present?
  end

  # GET /subscriptions/1/edit
  def edit
  end

  def expire
    expired_subscriptions = Subscription.expired
    if expired_subscriptions.present?
      expired_subscriptions.each do |subscription|
        subscription.update({status: :completed})
      end
      redirect_to :subscriptions, notice: "#{expired_subscriptions.count} has been completed"
    else
      redirect_to :subscriptions, notice: "There are no expired subscriptions today"
    end
  end

  def pause
    @subscription.update(paused_date: Date.today, status: :paused)
    redirect_to @subscription.customer
  end

  def restart
    @subscription.update(paused_date: nil, status: :active)
    redirect_to @subscription.customer
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @subscription, notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1
  # PATCH/PUT /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @customer, notice: 'Subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription.update_attribute({status: :deactivated}) if current_user.admin?
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: 'Subscription was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
      @customer = @subscription.customer
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:receipt_number, :mode_of_payment, :start_date, :end_date, :amount_paid, :balance, :discount, :status, :customer_id, :plan_id,
      :notes, :prepared_by)
    end
end
