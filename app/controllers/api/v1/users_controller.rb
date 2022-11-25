class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    current_user = user_from_token
    if current_user.update(user_params)
      render json: { message: 'user photo updated successfully', user: current_user },
             except: [:jti], status: :ok
    else
      render json: { error: 'Fail to update user photo', errors: resource.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:photo, :name)
  end
end
