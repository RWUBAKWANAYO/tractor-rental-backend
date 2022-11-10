class TractorsController < ApplicationController
  before_action :set_tractor, only: %i[ show update destroy ]

  # GET /tractors
  def index
    @tractors = Tractor.all

    render json: @tractors
  end

  # GET /tractors/1
  def show
    render json: @tractor
  end

  # POST /tractors
  def create
    @tractor = Tractor.new(tractor_params)

    if @tractor.save
      render json: @tractor, status: :created, location: @tractor
    else
      render json: @tractor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tractors/1
  def update
    if @tractor.update(tractor_params)
      render json: @tractor
    else
      render json: @tractor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tractors/1
  def destroy
    @tractor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tractor
      @tractor = Tractor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tractor_params
      params.require(:tractor).permit(:photo, :title, :description, :price, :completion, :demand)
    end
end
