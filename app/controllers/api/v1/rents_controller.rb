class RentsController < ApplicationController
  before_action :set_rent, only: %i[ show update destroy ]

  # GET /rents
  def index
    @rents = Rent.all

    render json: @rents
  end

  # GET /rents/1
  def show
    render json: @rent
  end

  # POST /rents
  def create
    @rent = Rent.new(rent_params)

    if @rent.save
      render json: @rent, status: :created, location: @rent
    else
      render json: @rent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rents/1
  def update
    if @rent.update(rent_params)
      render json: @rent
    else
      render json: @rent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rents/1
  def destroy
    @rent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rent_params
      params.require(:rent).permit(:total_costs)
    end
end
