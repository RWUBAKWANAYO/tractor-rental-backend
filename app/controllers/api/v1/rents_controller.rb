class Api::V1::RentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rents, only: %i[ index show update destroy ]
  before_action :set_tractor, only: %i[ create ]

  # GET /rents
  def index
    @data = rents_data(@rents)
    if @data
      render json: { message: 'Rents fetched successfully', data: @data}, status: :ok
    else
      render json: { message: 'fail to get rents', errors: @rents.errors.full_messages },
             status: :unprocessable_entity
    end
 
  end

  # GET /rents/1
  def show
    @rent = @rents.find(params[:id])
    if @rent
      render json: { message: 'Rent fetched successfully', data: {rent: @rent, tractor:@rent.tractor} },
       status: :ok
    else
      render json: { message: 'Fail to fetch Rent', errors: @rent.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # POST /rents
  def create
    @rent = Rent.new(rent_params)
    @rent.user_id = get_user_from_token.id
    @rent.tractor_id = @tractor.id
    if @rent.save
      render json: { message: 'Rent created successfully', data: {rent: @rent, tractor:@tractor} },
       status: :created
    else
      render json: { message: 'Fail to create Rent', errors: @rent.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rents/1
  def update
    @rent = @rents.find(params[:id])
    if @rent.update(rent_params)
        render json: { message: 'Rent updated successfully', data: {rent: @rent, tractor:@rent.tractor} },
         status: :ok
      else
        render json: { message: 'Fail to update Rent', errors: @rent.errors.full_messages },
               status: :unprocessable_entity
      end
  end

  # DELETE /rents/1
  def destroy
    @rent = @rents.find(params[:id])

    if @rent.destroy
      render json: { message: 'Rent deleted successfully' }, status: :ok
    else
      render json: { message: 'Fail to delete Rent', errors: @rent.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

    def set_rents
      @rents = Rent.includes(:tractor).where(user_id: get_user_from_token.id).order('created_at DESC')
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message }, status: :not_found
    end

    def set_tractor
      @tractor = Tractor.find(params[:tractor_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message }, status: :not_found
    end

    def rents_data(rents)
      res = []
      rents.each_with_index do |rent, index|
        res.push({id:index, rent:rent,tractor:rent.tractor})
      end
      res
    end
    # Only allow a list of trusted parameters through.
    def rent_params
      params.require(:rent).permit(:total_costs,:estimated_time, :tractor_id, :rent_date, :farm_size, :new_farm)
    end
end
