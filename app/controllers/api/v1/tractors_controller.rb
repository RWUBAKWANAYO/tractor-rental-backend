class Api::V1::TractorsController < ApplicationController
  before_action :set_tractor, only: %i[ show update destroy ]

  def index
    @tractors = Tractor.all

    if @tractors
      render json: { message: 'Tractors fetched successfully', data: @tractors }, status: :ok
    else
      render json: { message: 'fail to get tractors', errors: @tractors.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    if @tractor
      render json: { message: 'Tractor fetched successfully', data: @tractor }, status: :ok
    else
      render json: { message: 'Fail to get tractor', errors: @tractor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def create
    @tractor = Tractor.new(tractor_params)

    if @tractor.save
      render json: { message: 'Tractor created successfully', data: @tractor }, status: :created
    else
      render json: { message: 'Fail to create tractor', errors: @tractor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @tractor.update(tractor_params)
      render json: { message: 'Tractor updated successfully', data: @tractor }, status: :ok
    else
      render json: { message: 'Fail to update tractor', errors: @tractor.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def destroy
    if @tractor.destroy
      render json: { message: 'Tractor deleted successfully' }, status: :ok
    else
      render json: { message: 'Fail to delete Tractor', errors: @tractor.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

    def set_tractor
      @tractor = Tractor.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message }, status: :not_found
    end

    def tractor_params
      params.require(:tractor).permit(:photo, :name, :description, :price, :completion)
    end
end
