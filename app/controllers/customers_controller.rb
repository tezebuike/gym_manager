class CustomersController < ApplicationController
  before_action :authorize
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :consent_form, :check_in]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all.order(:id)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @subscriptions = @customer.subscriptions
    @attendances = @customer.attendances
    @audits = @customer.own_and_associated_audits
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.slug = @customer.generate_surefit_slug
  end

  def check_in
    @customer.attendances.create(
      date_attended: Date.today,
      user_id: current_user.id,
    )
    redirect_to :dashboard
  end

  def consent_form
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "consent.pdf",
        template: "customers/consent_form.html.erb",
        page_size: 'A4',
        zoom: 1,
        dpi: 75,
        layout: "pdf.html"
      end
    end
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.update_attribute(deleted: true) if user.admin?
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:slug, :title, :first_name, :middle_name, :last_name, :email, :phone_number, :address, :gender, :date_of_birth, :date_joined, :status, :avatar, :remove_avatar, :audit_comment,
        :company_name, :company_address, :nationality, :goals)
    end
end
