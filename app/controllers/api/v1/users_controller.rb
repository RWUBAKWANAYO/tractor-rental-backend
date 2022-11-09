class Api::V1::UsersController < ApplicationController

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { message: 'user photo updated successfully',user:@user}, :except =>  [:jti], status: :ok
    else
      render json: { error: 'Fail to update user photo',errors:resource.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end