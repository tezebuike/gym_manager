class ImprestsController < ApplicationController
  before_action :set_imprest, only: [:show, :edit, :update, :destroy]

  # GET /imprests
  # GET /imprests.json
  def index
    @imprests = Imprest.all
  end

  # GET /imprests/1
  # GET /imprests/1.json
  def show
  end

  # GET /imprests/new
  def new
    @imprest = Imprest.new
  end

  # GET /imprests/1/edit
  def edit
  end

  # POST /imprests
  # POST /imprests.json
  def create
    @imprest = Imprest.new(imprest_params)

    respond_to do |format|
      if @imprest.save
        format.html { redirect_to @imprest, notice: 'Imprest was successfully created.' }
        format.json { render :show, status: :created, location: @imprest }
      else
        format.html { render :new }
        format.json { render json: @imprest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imprests/1
  # PATCH/PUT /imprests/1.json
  def update
    respond_to do |format|
      if @imprest.update(imprest_params)
        format.html { redirect_to @imprest, notice: 'Imprest was successfully updated.' }
        format.json { render :show, status: :ok, location: @imprest }
      else
        format.html { render :edit }
        format.json { render json: @imprest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imprests/1
  # DELETE /imprests/1.json
  def destroy
    @imprest.destroy
    respond_to do |format|
      format.html { redirect_to imprests_url, notice: 'Imprest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imprest
      @imprest = Imprest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imprest_params
      params.require(:imprest).permit(:date, :item, :debit, :credit)
    end
end
